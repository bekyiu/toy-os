// 图层
struct SHEET {
    unsigned char *buf;		// 图层对应窗口的像素颜色信息
    int bxsize, bysize;		// 窗口的宽高
	int vx0, vy0;			// 窗口的坐标
	int col_inv;			// 如果buf中某个字节的值为col_inv, 则不绘制
	int height;				// 图层的的高度, 最小化是-1, 桌面是0
	int	flags;				// 0没被使用, 1表示被使用
    struct TASK *task;		// 当前图层所属的进程
};
// 最多能有256个图层
#define MAX_SHEETS  256
// 图层管理器
struct SHTCTL {
    unsigned char *vram, *map;			// 显存的首地址, map用于记录哪个像素输入哪个窗口
    int xsize, ysize, top;				// 屏幕的宽高, top表示要显示多少个图层(不包括桌面)
    struct SHEET *sheets[MAX_SHEETS];	// sheets0中图层的指针数组, 有顺序, height为1的话就保存在sheets[1]
    struct SHEET sheets0[MAX_SHEETS];	// 图层数组
};
// 一个图层占32kb
#define SIZE_OF_SHEET  32
// 一个图层管理器占用 9232kb
#define SIZE_OF_SHTCTL 9232

struct SHEET *sheet_alloc(struct SHTCTL *ctl);
struct SHTCTL *shtctl_init(struct MEMMAN *memman, unsigned char *vram,
  int xsize, int ysize);
void sheet_setbuf(struct SHEET *sht, unsigned char *buf, int xsize, int ysize,
    int col_inv);
void sheet_updown(struct SHTCTL *ctl, struct SHEET *sht, int height);

int sheet_refresh(struct SHTCTL *ctl, struct SHEET *sht, int bx0, int by0, int bx1, int by1);

void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0);

void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1, int h0, int h1);

void sheet_refreshmap(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1, int h0);

void sheet_free(struct SHTCTL* shtctl,struct SHEET *sht);
