#include "mem_util.h"

// 初始化内存管理器
void memman_init(struct MEMMAN *man) {
    man->frees = 0;
    man->maxfrees = 0;
    man->lostsize = 0;
    man->losts = 0;
}

// 内存管理器中总共有多少可用内存
unsigned int memman_total(struct MEMMAN *man) {
    unsigned int i, total = 0;
    for (i = 0; i < man->frees; i++) {
        total += man->free[i].size;
    }

    return total;
}

// 在man管理的内存中 分配size个字节, 返回分配内存的首地址
unsigned int memman_alloc(struct MEMMAN *man, unsigned int size) {
    unsigned int i, alloc_addr;
    for (i = 0; i < man->frees; i++) {
        if (man->free[i].size >= size) {
            alloc_addr = man->free[i].addr;
			man->free[i].addr += size; //bug
            man->free[i].size -= size;
            if (man->free[i].size == 0) {
                man->frees--;
            }

            return alloc_addr;
        }
    }

    return 0;
}

/* 
让man回收 首地址为addr, 大小为size个字节 的内存
*/
int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size) {
    int i, j;
	// 找到第一个地址比addr大的内存块
    for (i = 0; i < man->frees; i++) {
        if (man->free[i].addr > addr) {
            break;
        }
    }

    if (i > 0) {
		// 现在的顺序: i-1, 被回收内存, i
		// 如果 i-1位置上的内存块的起始地址加上他的size为被回收内存的起始地址
		// 说明这两块内存可以合并在一起
        if (man->free[i-1].addr + man->free[i-1].size == addr) {
           man->free[i-1].size += size;
           if (i < man->frees) {
			   // 这个条件说明被回收内存可以和内存块i合并在一起
               if (addr + size == man->free[i].addr) {
                   man->free[i-1].size += man->free[i].size;
                   man->frees--; // 有问题
               }
           }
     
           return 0;
        }
    }

    if (i < man->frees) {
		// 当前内存块和以和i合并
        if (addr + size == man->free[i].addr) {
           man->free[i].addr = addr;
           man->free[i].size += size;
           return 0;
        }
    }
	// 没有办法合并的情况
    if (man->frees < MEMMAN_FREES) {
		// 往后挪一个空位用来存被回收的内存块
		// 如果被回收内存的地址是最大的 那么i必定等于 man->frees, 直接存就可以了
        for (j = man->frees; j > i; j--) {
            man->free[j] = man->free[j-1];
        }

        man->frees++;
        if (man->maxfrees < man->frees) {
            man->maxfrees = man->frees;
        }

        man->free[i].addr = addr;
        man->free[i].size = size;
        return 0;
    }
	// 如果 man->frees >= MEMMAN_FREES, 说明free[]中装满了, 但是每一块都很小
	// 丢弃
    man->losts++;
    man->lostsize += size;
    return -1;
}
// 分配4kb的整数倍的内存
unsigned int memman_alloc_4k(struct MEMMAN *man, unsigned int size) {
    unsigned int a;
    size = (size + 0xfff) & 0xfffff000;
    a = memman_alloc(man, size);
    return a;
}
// 回收4kb整数倍的内存
int memman_free_4k(struct MEMMAN *man, unsigned int addr, unsigned int size) {
    int i ;
    size = (size + 0xfff) & 0xfffff000;
    i = memman_free(man, addr, size);
    return i;
}

