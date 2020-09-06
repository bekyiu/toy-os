// 循环队列
struct FIFO8 {
    unsigned char* buf;		// 指向缓冲区
    int p;					// 队尾
	int q;					// 队首
	int size;				// 缓冲区大小
	int free;				// 还有多少可用的空间
	int flags;				// 队列的状态
	struct TASK *task;		// 用于恢复一个被挂起的进程
};

void fifo8_init(struct FIFO8 *fifo, int size, unsigned char *buf, struct TASK *task);

int fifo8_put(struct FIFO8 *fifo, unsigned char data);

int fifo8_get(struct FIFO8 *fifo);

int fifo8_status(struct FIFO8 *fifo);

int strcmp(char *src, char *dest);

// 文件目录在内存中的起始地址
#define  ADR_DISKIMG  0x13400
// 文件的结构
struct FILEINFO {
    unsigned char name[8], ext[3], type;
    char  reserve[10]; // 预留
    unsigned short time, date, clustno; // 距离文件内容起始地址的偏移(单位是扇区)
    unsigned int  size;
};


#define FILEINFO_SIZE  32
#define FILE_CONTENT_HEAD_ADDR 0x15800 // 文件内容起始地址
#define DISK_SECTOR_SIZE  512

#define API_CALL_INDEX_TABLE 0x5000
struct Buffer {
    unsigned char *pBuffer;
	unsigned char *pDataSeg;
    int  length;
};

