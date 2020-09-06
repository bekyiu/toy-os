#include "global_define.h"
#include "multi_task.h"


// 初始化一个队列
void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf, struct TASK *task) {
    fifo->size = size;
    fifo->buf = buf;
    fifo->free = size;
    fifo->flags = 0;
    fifo->p = 0;
    fifo->q = 0;
    fifo->task = task;
    return ;
}

// 从队尾添加一个字节的数据
#define FLAGS_OVERRUN 0x0001
int fifo8_put(struct FIFO8 *fifo, unsigned char data) {
    if (fifo == 0) {
        return -1;
    }    

    if (fifo->free ==0) {
        fifo->flags |= FLAGS_OVERRUN;
        return -1;
    }

    fifo->buf[fifo->p] = data;
    fifo->p++;
    if (fifo->p == fifo->size) {
        fifo->p = 0;
    }

    fifo->free--;
	// 重新调度被挂起的进程
    if (fifo->task != 0) {
        if (fifo->task->flags != 2) {
			// -1表示原来的level, 0 表示保持原来的优先级
            task_run(fifo->task, -1, 0);
        }
    }

    return 0;
}


// 从队首取一个字节的数据
int fifo8_get(struct FIFO8 *fifo) {
    int data;
    if (fifo->free == fifo->size) {
        return -1;
    }

    data = fifo->buf[fifo->q];
    fifo->q++;
    if (fifo->q == fifo->size) {
        fifo->q = 0;
    }

    fifo->free++;
    return data;
}
// 返回结果大于0就说明缓冲区中有值需要被处理了
int fifo8_status(struct FIFO8 *fifo) {
    return fifo->size - fifo->free;
}

// 相等返回1 否则返回0
int strcmp(char *src, char *dest) {
    if (src == 0 || dest == 0) {
        return 0;
    }

    int i = 0;
    while (src[i] != 0 && dest[i] != 0) {
        if (src[i] != dest[i]) {
            return 0;
        }

        i++;
    }

    if (src[i] == 0 && dest[i] != 0) {
        return 0;
    }

    if (src[i] != 0 && dest[i] != 0) {
       return 0; 
    }

    return 1;
}
