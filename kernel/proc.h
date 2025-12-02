#ifndef _PROC_H_
#define _PROC_H_

#include "defs.h"

struct Context {
    u64 ra;
    u64 sp;

    // callee-saved
    u64 s0;
    u64 s1;
    u64 s2;
    u64 s3;
    u64 s4;
    u64 s5;
    u64 s6;
    u64 s7;
    u64 s8;
    u64 s9;
    u64 s10;
    u64 s11;
};

/// @brief 从上到下依次为一个进程的生命周期
enum EnumProcState {
    UNUSED,
    USED,
    SLEEPING,
    RUNNABLE,
    RUNNING,
    ZOMBIE
};

struct TrapFrame {
    /*   0 */ u64 kernel_satp;   // kernel page table
    /*   8 */ u64 kernel_sp;     // top of process's kernel stack
    /*  16 */ u64 kernel_trap;   // usertrap()
    /*  24 */ u64 epc;           // saved user program counter
    /*  32 */ u64 kernel_hartid; // saved kernel tp
    /*  40 */ u64 ra;
    /*  48 */ u64 sp;
    /*  56 */ u64 gp;
    /*  64 */ u64 tp;
    /*  72 */ u64 t0;
    /*  80 */ u64 t1;
    /*  88 */ u64 t2;
    /*  96 */ u64 s0;
    /* 104 */ u64 s1;
    /* 112 */ u64 a0;
    /* 120 */ u64 a1;
    /* 128 */ u64 a2;
    /* 136 */ u64 a3;
    /* 144 */ u64 a4;
    /* 152 */ u64 a5;
    /* 160 */ u64 a6;
    /* 168 */ u64 a7;
    /* 176 */ u64 s2;
    /* 184 */ u64 s3;
    /* 192 */ u64 s4;
    /* 200 */ u64 s5;
    /* 208 */ u64 s6;
    /* 216 */ u64 s7;
    /* 224 */ u64 s8;
    /* 232 */ u64 s9;
    /* 240 */ u64 s10;
    /* 248 */ u64 s11;
    /* 256 */ u64 t3;
    /* 264 */ u64 t4;
    /* 272 */ u64 t5;
    /* 280 */ u64 t6;
};

// 文件描述符最大数量
#define NOFILE 16

/// @brief 进程的核心定义
struct Process {
    int pid;
    struct Process* parent;

    enum EnumProcState state;

    int is_killed;
    u64 ex_status;

    addr_t waiting_chan;

    pgtbl_addr_t page_table;

    /// @brief 进程的 trapframe，保存了用户态下寄存器状态
    struct TrapFrame* trapframe;
    /// @brief 进程的上下文，用于内核态下的上下文切换
    struct Context context;

    addr_t kstack;

    u64 mem_size;
    
    // 打开的文件描述符
    struct File *ofile[NOFILE];
};

#endif // !_PROC_H_