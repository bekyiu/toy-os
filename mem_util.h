#define  MEMMAN_FREES  4096		// 内存管理器 最多可以管理4096个内存块
// 用来表示一个内存块
struct FREEINFO {
	// 起始地址, 大小
    unsigned int addr, size;
};

// 内存管理器
struct MEMMAN {
    int frees;								// free数组中存在的内存块的个数
	int maxfrees;							// free数组最多可容纳多少个内存块
	int lostsize;							// 被丢弃的内存块的大小
	int losts;								// 被丢弃的内存块的个数
	struct FREEINFO free[MEMMAN_FREES];		// 被管理的内存 顺序存放 低地址在前高地址在后
};

void memman_init(struct MEMMAN *man);

unsigned int memman_total(struct MEMMAN *man);

unsigned int memman_alloc(struct MEMMAN *man, unsigned int size);

int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size);

unsigned int memman_allock_4k(struct MEMMAN *man, unsigned int size);

int memman_free_4k(struct MEMMAN *man, unsigned int addr, unsigned int size);

