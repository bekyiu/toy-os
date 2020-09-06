#define PIT_CTRL   0x0043
#define PIT_CNT0   0x0040

#define MAX_TIMER  500

// 时钟对象
struct TIMER {
    unsigned int timeout, flags; // 用来计时，一旦timeout为0，管理器将触发指定动作, flags 表示是否在使用
    struct FIFO8 *fifo;			 // 缓冲队列, timeout为0后, 将标记放进队列
    unsigned char data;			 // 标记
};


// 时钟管理器
struct TIMERCTL {
    unsigned int count;				// 记录时钟中断发送了多少次
	struct TIMER timer[MAX_TIMER];	// 管理500个时钟
};

void init_pit(void);

struct TIMER* timer_alloc(void);

void timer_free(struct TIMER *timer);

void timer_init(struct TIMER *timer, struct FIFO8 *fifo, unsigned char data) ;

void timer_settime(struct TIMER *timer, unsigned int timeout);
