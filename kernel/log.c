#include "log.h"
#include "defs.h"
#include "bio.h"
#include "fs.h"

// 简化的日志系统
// 在真实系统中，这会实现写前日志(WAL)以支持崩溃恢复

#define LOGSIZE 30  // 最大日志块数

struct logheader {
    int n;
    int block[LOGSIZE];
};

struct log {
    int dev;
    int start;
    int size;
    int outstanding;  // 正在进行的文件系统操作数
    int committing;   // 是否正在提交
    
    struct logheader lh;
} log_ctx;

static void recover_from_log(void);
static void commit(void);

void log_init(int dev, struct superblock *sb) {
    if(sizeof(struct logheader) >= BSIZE)
        panic("log_init: too big logheader");
    
    log_ctx.dev = dev;
    log_ctx.start = sb->logstart;
    log_ctx.size = sb->nlog;
    
    recover_from_log();
}

// 从日志恢复（简化版本：直接忽略）
static void recover_from_log(void) {
    // 简化实现：不做恢复
    // 实际实现需要读取日志头，重放日志
}

// 开始文件系统操作
void begin_op(void) {
    while(1) {
        if(log_ctx.committing) {
            // 等待提交完成
            continue;
        } else if(log_ctx.lh.n + (log_ctx.outstanding + 1) * LOGSIZE > LOGSIZE) {
            // 日志空间不足
            continue;
        } else {
            log_ctx.outstanding++;
            break;
        }
    }
}

// 结束文件系统操作
void end_op(void) {
    int do_commit = 0;
    
    log_ctx.outstanding--;
    
    if(log_ctx.committing)
        panic("log_ctx.committing");
    
    if(log_ctx.outstanding == 0) {
        do_commit = 1;
        log_ctx.committing = 1;
    }
    
    if(do_commit) {
        commit();
        log_ctx.committing = 0;
    }
}

// 将修改后的块写入日志
void log_write(struct buf *b) {
    int i;
    
    if(log_ctx.lh.n >= LOGSIZE || log_ctx.lh.n >= log_ctx.size - 1)
        panic("too big a transaction");
    if(log_ctx.outstanding < 1)
        panic("log_write outside of trans");
    
    // 查找块是否已在日志中
    for(i = 0; i < log_ctx.lh.n; i++) {
        if(log_ctx.lh.block[i] == b->blockno)
            break;
    }
    
    log_ctx.lh.block[i] = b->blockno;
    if(i == log_ctx.lh.n) {
        bpin(b);
        log_ctx.lh.n++;
    }
}

// 提交当前事务
static void commit(void) {
    if(log_ctx.lh.n > 0) {
        // 写入日志头（简化：直接跳过）
        // write_log();     // 将修改的块写入日志
        // write_head();    // 写入日志头到磁盘
        // install_trans(); // 将日志中的块写入实际位置
        
        // 简化实现：直接写入磁盘
        for(int i = 0; i < log_ctx.lh.n; i++) {
            struct buf *to = bread(log_ctx.dev, log_ctx.lh.block[i]);
            bwrite(to);
            brelse(to);
            bunpin(to);
        }
        
        log_ctx.lh.n = 0;
    }
}
