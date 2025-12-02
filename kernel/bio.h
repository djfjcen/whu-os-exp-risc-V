#ifndef _BIO_H_
#define _BIO_H_

#include "defs.h"
#include "fs.h"

// 块缓冲区结构
struct buf {
    int valid;       // 缓冲区是否包含有效数据
    int disk;        // 缓冲区内容是否需要写回磁盘
    u64 dev;         // 设备号
    u64 blockno;     // 块号
    u64 refcnt;      // 引用计数
    struct buf *prev; // LRU 链表前驱
    struct buf *next; // LRU 链表后继
    u8 data[BSIZE];  // 数据
};

// 块缓存管理函数
void bio_init(void);
struct buf* bread(u64 dev, u64 blockno);
void bwrite(struct buf *b);
void brelse(struct buf *b);
void bpin(struct buf *b);
void bunpin(struct buf *b);

#endif // _BIO_H_
