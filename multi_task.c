#include "mem_util.h"
#include "global_define.h"
#include "multi_task.h"
#include "timer.h"

// 初始化一个gdt
void set_segmdesc(struct SEGMENT_DESCRIPTOR *sd, unsigned int limit, int base, int ar)
{
	if (limit > 0xfffff) {
		ar |= 0x8000; /* G_bit = 1 */
		limit /= 0x1000;
	}
	sd->limit_low    = limit & 0xffff;
	sd->base_low     = base & 0xffff;
	sd->base_mid     = (base >> 16) & 0xff;
	sd->access_right = ar & 0xff;
	sd->limit_high   = ((limit >> 16) & 0x0f) | ((ar >> 8) & 0xf0);
	sd->base_high    = (base >> 24) & 0xff;
	return;
}

// 进程调度的时间片
static struct TIMER *task_timer;
static struct TASKCTL *taskctl;

struct TASKCTL *get_taskctl() {
    return taskctl;
}

// 初始化指定level的优先级队列
void init_task_level(int level) {
    taskctl->level[level].running = 0;
    taskctl->level[level].now = 0;
    int i;
    for (i = 0; i < MAX_TASKS_LV; i++) {
        taskctl->level[level].tasks[i] = 0;
    }
}

// 初始化任务管理器 同时创建一个时钟，用于进程调度，同时为每个任务分配一个全局描述符，
// 这个描述符指向该任务所对应的TSS32结构，并且将第一个任务的TSS32加载进CPU
struct TASK  *task_init(struct MEMMAN *memman) {
    int  i;
    struct TASK *task;
    struct SEGMENT_DESCRIPTOR *gdt = (struct SEGMENT_DESCRIPTOR *)get_addr_gdt();
    taskctl = (struct TASKCTL *)memman_alloc_4k(memman, SIZE_OF_TASKCTL);
    for (i = 0; i < MAX_TASKS; i++) {
        taskctl->tasks0[i].flags = 0;
        taskctl->tasks0[i].sel = (TASK_GDT0 + i) * 8;
        set_segmdesc(gdt + TASK_GDT0 + i, 103, (int)&taskctl->tasks0[i].tss,
        AR_TSS32);
    }
 
    for (i = 0; i < MAX_TASKLEVELS; i++) {
        init_task_level(i);
    }

    task = task_alloc();
    task->flags = 2;  //active
    task->priority = 100;
	// CMain函数的进程处于最高的level
    task->level = 0;
	// 将任务加入对应的队列
    task_add(task);
    task_switchsub();

    load_tr(task->sel);
    task_timer = timer_alloc();
    timer_settime(task_timer, task->priority);
    return task;
}

// 从任务管理器中分配一个任务
struct TASK *task_alloc(void) {
    int i;
    struct TASK *task;
    for (i = 0; i < MAX_TASKS; i++) {
        if (taskctl->tasks0[i].flags == 0) {
            task = &taskctl->tasks0[i];
			task->tss.ss0 = 0;
            task->flags = 1;
            task->tss.eflags = 0x00000202;
            task->tss.eax = 0;
            task->tss.ecx = 0;
            task->tss.edx = 0;
            task->tss.ebx = 0;
            task->tss.ebp = 0;
            task->tss.esp = 512*(i+1);
            task->tss.esi = 0;
            task->tss.edi = 0;
            task->tss.es = 0;
            task->tss.ds = 0;
            task->tss.fs = 0;
            task->tss.gs = 0;
            task->tss.ldtr = 0;
            task->tss.iomap = 0x40000000;
            return task;
        }
    }

    return 0;
}

// 修改进程重要性或优先级，或者把新的进程根据其重要性添加到相应队列
void task_run(struct TASK *task,int level, int priority) {
    if (level < 0) {
        level = task->level;
    }

    if (priority > 0) {
        task->priority = priority;
    }

    if (task->flags == 2 && task->level != level) {
        task_remove(task); //change task flags to 1
    }

    if (task->flags != 2) {
        task->level = level;
        task_add(task);
    }

    taskctl->lv_change = 1;
    return;
} 

void task_switch(void) {
	// 拿到当前正在被调度的任务 now_task
    struct TASKLEVEL *tl = &taskctl->level[taskctl->now_lv];
    struct TASK *new_task, *now_task = tl->tasks[tl->now];
	int old_now = tl->now;
    tl->now++;
    if (tl->now == tl->running) {
        tl->now = 0;
    }
	// 有新的task加入了队列，要确认新的task的level是不是更高
    if (taskctl->lv_change != 0) {
        task_switchsub();
        if(tl != &taskctl->level[taskctl->now_lv])
		{
			tl->now = old_now;
		}
		tl = &taskctl->level[taskctl->now_lv];
    }
	// 将要被调度的任务
    new_task = tl->tasks[tl->now];
    timer_settime(task_timer, new_task->priority);
	// 如果是同一个就不用切换了
    if (new_task != now_task && new_task != 0) {
        farjmp(0, new_task->sel);
    }

    return;
}

// 挂起进程， 实际上就是把指定的task从调度队列里移除
int  task_sleep(struct TASK *task) {
   struct TASK *cur_task = 0;
   int rtask = 0;
   // 要在调度队列中 才有挂起这一说
   if (task->flags == 2) {
       cur_task = task_now();
       task_remove(task);
   
       rtask = 1;
	   // 如果要挂起的就是当前正在执行的task
       if (task == cur_task) {
		  // 找一个合适的进程跳过去执行
          task_switchsub();
          cur_task = task_now();
          rtask = 2;

          if (cur_task != 0)
          {
              farjmp(0, cur_task->sel);
          }
       }
   }

   return rtask;
}

// 返回当前正在被调用的进程对象
struct TASK *task_now(void) {
    struct TASKLEVEL *tl = &taskctl->level[taskctl->now_lv];
    return tl->tasks[tl->now];
}

// 把给定的task加入到对应优先级的队列
void task_add(struct TASK *task) {
    struct TASKLEVEL *tl = &taskctl->level[task->level];
    tl->tasks[tl->running] = task;
    tl->running++;
    task->flags = 2;
    return;
} 

// 把给定的task从对应的优先级队列中删除
void task_remove(struct TASK *task) {
    int i ;
    struct TASKLEVEL *tl = &taskctl->level[task->level];
    for (i = 0; i< tl->running; i++) {
        if (tl->tasks[i] == task) {
            tl->tasks[i] = 0;
            break;
        }
    }

    tl->running--;
    if (i < tl->now) {
        tl->now--;
    }

    if (tl->now >= tl->running) {
        tl->now = 0;
    } 

    task->flags = 1;

    for (; i < tl->running; i++) {
        tl->tasks[i] = tl->tasks[i+1];
    }

    return;
}

/*
当进行进程调度时，进程调度器先查看level等于0的队列是否还有进程，有的话，只执行该队列的进程，
如果该队列不止一个进程，那么每个进程根据他们的优先级获得相应的CPU时间。
如果level为0的队列没有可调度的进程，那么level为1的队列中的进程才有获得调度的机会
*/
void task_switchsub(void) {
    int i;
    for (i = 0; i < MAX_TASKLEVELS; i++) {
        if (taskctl->level[i].running > 0) {
           break;
        }
    }

    taskctl->now_lv = i;
    taskctl->lv_change = 0;
}

// sender send msg to receiver
void send_message(struct TASK *sender, struct TASK *receiver, int msg) {
    fifo8_put(&receiver->fifo, msg);
    task_sleep(sender);
}
