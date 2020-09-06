// #include "global_define.h"
// 任务门描述符
struct TSS32 {
	int backlink, esp0, ss0, esp1, ss1, esp2, ss2, cr3;
	int eip, eflags, eax, ecx, edx, ebx, esp, ebp, esi, edi;
	int es, cs, ss, ds, fs, gs;
	int ldtr, iomap;
};
// 全局描述符
struct SEGMENT_DESCRIPTOR {
	short limit_low, base_low;
	char base_mid, access_right;
	char limit_high, base_high;
};

// 给一个全局描述符设置值
void set_segmdesc(struct SEGMENT_DESCRIPTOR *sd, unsigned int limit, int base, int ar);

#define AR_TSS32		0x0089
#define AR_CODE32       0x409a


// 一个进程/任务
struct TASK {
	// sel 该进程在gdt中的索引
	// flags 进程的状态, 0表示刚刚初始化未被分配，1表示已被分配但并未加入调度队列，2表示已加入调度队列
    int sel, flags;
	// 优先级，越大优先级越高，用时间片来设置	
	int priority;
	// level越低， 重要性越高
	int level;
	// 用于进程间通信
	struct FIFO8 fifo;
    struct TSS32 tss;
};

#define  MAX_TASKS  5
#define  MAX_TASKS_LV   3 // 一共有多少个调度队列
#define  MAX_TASKLEVELS 3 // 一个调度队列允许多少个进程

#define  TASK_GDT0  7 // 在gdt中从索引为7的位置开始都是tss
#define  SIZE_OF_TASK  148

// 进程的调度队列，level相同的进程处于同一个队列
struct TASKLEVEL {
	// 调度队列的队尾/当前一共有多少个进程正在被调度
    int running;
	// 调度队列的队首/当前被调度的进程
    int now;
	// 进程的调度队列
    struct TASK *tasks[MAX_TASKS_LV];
};

#define SIZE_OF_TASKLEVEL  (8+ 4*MAX_TASKS_LV)

// 进程/任务管理器
struct TASKCTL {
	// 当前被调度的队列的level
    int  now_lv;
	// 当有新的task加入，或是有task的level改变时， 这个值为1
	// 当在重新确认now_lv后这个值变为0
    int  lv_change;
	// 调度队列数组
    struct TASKLEVEL  level[MAX_TASKLEVELS];
	// 被管理的进程
	struct TASK tasks0[MAX_TASKS];
};

struct TASK *task_init(struct MEMMAN *memman);

#define SIZE_OF_TASKCTL  (4 + 4 + SIZE_OF_TASKLEVEL*MAX_TASKLEVELS + SIZE_OF_TASK*MAX_TASKS)

struct TASK *task_alloc(void);

struct TASK *task_now(void);

int task_sleep(struct TASK *task);

struct TASKCTL *get_taskctl();

#define  PROC_RESUME   0x57
#define  PROC_PAUSE    0x58

void send_message(struct TASK *sender, struct TASK *receiver, int msg);
