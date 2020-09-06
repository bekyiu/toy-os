#include "mem_util.h"
#include "global_define.h"
#include "multi_task.h"
#include "win_sheet.h"

// 初始化一个图层管理器
struct SHTCTL *shtctl_init(struct MEMMAN *memman, unsigned char *vram,
  int xsize, int ysize) {
    struct SHTCTL *ctl;
    int i;
    ctl = (struct SHTCTL *)memman_alloc_4k(memman, SIZE_OF_SHTCTL);
    if (ctl == 0) {
        return 0;
    }

    ctl->map = (unsigned char*)memman_alloc_4k(memman, xsize * ysize);
    if (ctl->map == 0) {
        memman_free_4k(memman, (int)ctl, SIZE_OF_SHTCTL);
        return 0;
    }
    ctl->vram = vram;
    ctl->xsize = xsize;
    ctl->ysize = ysize;
    ctl->top = -1;
    for (i = 0; i < MAX_SHEETS; i++) {
        ctl->sheets0[i].flags = 0;
    }

    return ctl;
}

// 从ctl中分配一个图层
#define SHEET_USE  1
struct SHEET *sheet_alloc(struct SHTCTL *ctl) {
    struct SHEET *sht;
    int i;
    for (i = 0; i < MAX_SHEETS; i++) {
		// 找一个可用的
        if (ctl->sheets0[i].flags == 0) {
            sht = &ctl->sheets0[i];
            ctl->sheets[i] = sht;
            sht->flags = SHEET_USE;
			// 默认是最小化
            sht->height = -1;
			sht->task = task_now();
            return sht;
        }
    }

    return 0;
}

// 设置图层相关信息
void sheet_setbuf(struct SHEET *sht, unsigned char *buf, int bxsize, int bysize, int col_inv) {
    sht->buf = buf;
    sht->bxsize = bxsize;
    sht->bysize = bysize;
    sht->col_inv = col_inv;
    return;
}

// 调整图层高度
void sheet_updown(struct SHTCTL *ctl, struct SHEET *sht, int height) {
    int h, old = sht->height;
    // 规定死图层最小也就是-1, 最大也就是ctl->top + 1
	if (height > ctl->top + 1) {
        height = ctl->top + 1;
    }
    if (height < -1) {
        height = -1;
    }

    sht->height = height;
	// 高度变小
    if (old > height) {
		// 不是最小化的情况
        if (height >= 0) {
			// 把其他图层往后挪, 并且增加高度
            for (h = old; h > height; h--) {
                ctl->sheets[h] = ctl->sheets[h-1];
                ctl->sheets[h]->height = h;
            }
			// 把该图层放到空出来的位置
            ctl->sheets[height] = sht;
			// 高度变化后要重新绘制窗口
            sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize, height+1);
            sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize, height+1, old);
        } else { // 最小化的情况, 需要把该图层从数组中删除
			// 如果被删除的不是最后一个, 就进入if, 否则直接修改索引即可
            if (ctl->top > old) {
				// 把后面的图层往前挪, 覆盖掉最小化的那个, 并且减少高度
               for (h = old; h < ctl->top; h++) {
                   ctl->sheets[h] = ctl->sheets[h+1];
                   ctl->sheets[h]->height = h;
               }
            }

            ctl->top--;
            sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize, 0);
            sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize, 0, old - 1);
        }
    } else if (old < height) { //高度变高
		// 原来得窗口不是最小化的情况
        if (old >= 0) {
			// 把图层往前挪, 并且减小高度
            for (h = old; h < height; h++) {
               ctl->sheets[h] = ctl->sheets[h + 1];
               ctl->sheets[h]->height = h;
            }
			// 把变高的图层放在空出来的位置
            ctl->sheets[height] = sht;
        } else { // 原来得窗口是最小化的, 说明sheets数组要新增一个元素
			// 往后挪
            for (h = ctl->top; h >= height; h--) {
                ctl->sheets[h + 1] = ctl->sheets[h];
                ctl->sheets[h + 1]->height = h + 1;
            }
			// 新增
            ctl->sheets[height] = sht;
            ctl->top++;
        }
		//
        sheet_refreshmap(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize, height);       
        sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0+sht->bxsize, sht->vy0+sht->bysize, height, height);
    }

}

// bx0, by0 是相对于图层左上角的
int sheet_refresh(struct SHTCTL *ctl, struct SHEET *sht, int bx0, int by0, int bx1, int by1) {
    if (sht->height >= 0) {
        sheet_refreshsub(ctl, sht->vx0 + bx0, sht->vy0 + by0, sht->vx0 + bx1,
        sht->vy0 + by1, sht->height, sht->height);
    }
    return 0;
}

// 根据sheets数组, 从低到高绘制所有图层的指定部分
// 绘制坐标(vx0, vy0), 横向的长度为vx1, 纵向的长度为vy1
// 例如 绘制鼠标(0, 0) vx1 = 16, vy1 = 16
// 从高度为h0的图层绘制到h1
void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1, int h0, int h1) {
    int h, bx, by, vx, vy;
    unsigned char *buf, c, *vram = ctl->vram, *map = ctl->map, sid;
    struct SHEET *sht;
    if (vx0 < 0) {vx0 = 0;}
    if (vy0 < 9) {vy0 = 0;}
    if (vx1 > ctl->xsize) {vx1 = ctl->xsize;}
    if (vy1 > ctl->ysize) {vy1 = ctl->ysize;}

    for (h = h0; h <= h1; h++) {
        sht = ctl->sheets[h];
        buf = sht->buf;
        sid = sht - ctl->sheets0;

        for (by = 0; by < sht->bysize; by++) {
            vy = sht->vy0 + by;
			// 先绘制一行
            for (bx = 0; bx < sht->bxsize; bx++) {
                vx = sht->vx0 + bx;
				// 指定范围内才绘制
                if (vx0 <= vx && vx < vx1 && vy0 <= vy && vy < vy1) {
					// 取到颜色(rgb数组的下标)
                    c = buf[by * sht->bxsize + bx];
					// 这个像素属于当前窗口的才绘制 且 不用透过的才绘制
                    if (map[vy * ctl->xsize + vx] == sid && c != sht->col_inv) {
                        vram[vy * ctl->xsize + vx] = c;
                    }
                }
            }
        }
    }
}

// 移动窗口到vx0, vy0后, 重新绘制
void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0) {
    int old_vx0 = sht->vx0, old_vy0 = sht->vy0;
    sht->vx0 = vx0;
    sht->vy0 = vy0;
	// 先绘制原来的地方 再绘制新的地方        
    if (sht->height >= 0) {
		 // 窗口移动后 像素所属的窗口也有可能有所变化
		 // 对原来的位置从0层开始重新全部填充map
         sheet_refreshmap(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, old_vy0 + sht->bysize, 0);
		 // height 到 顶层
		 sheet_refreshmap(ctl, vx0, vy0, vx0+sht->bxsize, vy0+sht->bysize, sht->height);
		 
		 // 因为原来得窗口移开了, 所以下面的图层会露出来, 所以绘制0到 当前图层的下一层的所有内容
         sheet_refreshsub(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, old_vy0 + sht->bysize, 0, sht->height - 1);
		 // 仅仅绘制当前图层
         sheet_refreshsub(ctl, vx0, vy0, vx0+sht->bxsize, vy0+sht->bysize, sht->height, sht->height);
    }
}



// 填充map, 哪个像素属于哪个窗口
// 假如窗口1的某个像素位于坐标（20， 30），那么我就在map[30*xsize + 20] 处设置为1
void sheet_refreshmap(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1, int h0) {
    int h, bx, by, vx, vy, bx0, by0, bx1, by1;
    unsigned char *buf, sid, *map = ctl->map;
    struct SHEET *sht;
    
    if (vx0 < 0) {vx0 = 0;}
    if (vy0 < 0) {vy0 = 0;}

    if (vx1 > ctl->xsize) {vx1 = ctl->xsize;}
    if (vy1 > ctl->ysize) {vy1 = ctl->ysize;}

    for (h = h0; h <= ctl->top; h++) {
        sht = ctl->sheets[h];
        sid = sht - ctl->sheets0;
        buf = sht->buf;
        bx0 = vx0 - sht->vx0;
        by0 = vy0 - sht->vy0;
        bx1 = vx1 - sht->vx0;
        by1 = vy1 - sht->vy0;

        if (bx0 < 0) { bx0 = 0;}
        if (by0 < 0) { by0 = 0;}
        if (bx1 > sht->bxsize) {bx1 = sht->bxsize;}
        if (by1 > sht->bysize) {by1 = sht->bysize;}

        for (by = by0; by < by1; by++) {
            vy = sht->vy0 + by;
            for (bx = bx0; bx < bx1; bx++) {
                vx = sht->vx0 + bx;
                if (buf[by * sht->bxsize + bx] != sht->col_inv) {
                    map[vy * ctl->xsize + vx] = sid;
                }
            }
        }
        
    }

    return;
}


void sheet_free(struct SHTCTL *shtctl, struct SHEET *sht) {
    if (sht->height >= 0) {
        sheet_updown(shtctl, sht, -1);
    }

    sht->flags = 0;
    return;
}
