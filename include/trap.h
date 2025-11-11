#ifndef _TRAP_H
#define _TRAP_H

#include <stdint.h>

// 类型定义
typedef uint64_t uint64;

// RISC-V中断和异常原因码
#define INTR_S_TIMER    5    // 监督模式时钟中断
#define INTR_M_TIMER    7    // 机器模式时钟中断
#define INTR_S_EXTERNAL 9    // 监督模式外部中断

// 异常原因码
#define EXCP_INSTR_MISALIGNED    0     // 指令地址未对齐
#define EXCP_INSTR_FAULT         1     // 指令访问故障
#define EXCP_ILLEGAL_INSTR       2     // 非法指令
#define EXCP_BREAKPOINT          3     // 断点
#define EXCP_LOAD_MISALIGNED     4     // 加载地址未对齐
#define EXCP_LOAD_FAULT          5     // 加载访问故障
#define EXCP_STORE_MISALIGNED    6     // 存储地址未对齐
#define EXCP_STORE_FAULT         7     // 存储访问故障
#define EXCP_UENV_CALL           8     // 用户环境调用 (系统调用)
#define EXCP_SENV_CALL           9     // 监督环境调用
#define EXCP_MENV_CALL          11     // 机器环境调用
#define EXCP_INSTR_PAGE_FAULT   12     // 指令页故障
#define EXCP_LOAD_PAGE_FAULT    13     // 加载页故障
#define EXCP_STORE_PAGE_FAULT   15     // 存储页故障

// 陷阱帧结构 - 保存中断/异常时的处理器状态
// Layout must match uservec.S offsets!
struct trapframe {
    /*   0 */ uint64 kernel_satp;   // kernel page table
    /*   8 */ uint64 kernel_sp;     // top of process's kernel stack
    /*  16 */ uint64 kernel_trap;   // usertrap()
    /*  24 */ uint64 sepc;           // saved user program counter
    /*  32 */ uint64 kernel_hartid;  // saved kernel tp
    /*  40 */ uint64 ra;
    /*  48 */ uint64 sp;
    /*  56 */ uint64 gp;
    /*  64 */ uint64 tp;
    /*  72 */ uint64 t0;
    /*  80 */ uint64 t1;
    /*  88 */ uint64 t2;
    /*  96 */ uint64 s0;
    /* 104 */ uint64 s1;
    /* 112 */ uint64 a0;
    /* 120 */ uint64 a1;
    /* 128 */ uint64 a2;
    /* 136 */ uint64 a3;
    /* 144 */ uint64 a4;
    /* 152 */ uint64 a5;
    /* 160 */ uint64 a6;
    /* 168 */ uint64 a7;
    /* 176 */ uint64 s2;
    /* 184 */ uint64 s3;
    /* 192 */ uint64 s4;
    /* 200 */ uint64 s5;
    /* 208 */ uint64 s6;
    /* 216 */ uint64 s7;
    /* 224 */ uint64 s8;
    /* 232 */ uint64 s9;
    /* 240 */ uint64 s10;
    /* 248 */ uint64 s11;
    /* 256 */ uint64 t3;
    /* 264 */ uint64 t4;
    /* 272 */ uint64 t5;
    /* 280 */ uint64 t6;
};

// 中断处理函数类型定义
typedef void (*trap_handler_t)(struct trapframe *tf);

// 中断系统初始化函数
void trap_init(void);              // 初始化中断系统
void trap_init_hart(void);         // 初始化当前Hart的中断

// 中断使能/禁用
void intr_on(void);                // 启用中断
void intr_off(void);               // 禁用中断
int intr_get(void);                // 获取当前中断状态

// 中断处理函数（汇编入口调用）
void kerneltrap(void);             // 内核态中断处理
void usertrap(void);               // 用户态中断处理
void usertrapret(void);            // 用户态中断返回
int devintr(void);                 // 设备中断分发
void machine_timer_handler(void);  // Machine 模式时钟中断处理

// 具体的中断/异常处理函数
void handle_timer_interrupt(void);        // 定时器中断处理
void handle_external_interrupt(void);     // 外部中断处理
void handle_software_interrupt(void);     // 软件中断处理
void handle_syscall(struct trapframe *tf); // 系统调用处理 (ECALL)
void handle_trap_page_fault(struct trapframe *tf, int is_write); // 陷阱中的页故障处理
void handle_illegal_instruction(struct trapframe *tf);      // 非法指令处理
void handle_breakpoint(struct trapframe *tf);               // 断点处理

// 中断处理向量表
extern trap_handler_t trap_handlers[16];

// 陷阱帧分配 (对于用户进程)
struct trapframe* alloc_trapframe(void);
void free_trapframe(struct trapframe* tf);

// 时间中断相关
void timerinit(void);              // 初始化时间中断
void set_next_timer(void);         // 设置下一个时间中断
extern volatile uint64 ticks;      // 全局时钟计数器

// CLINT (Core Local Interruptor) 地址定义
#define CLINT_BASE 0x2000000L
#define CLINT_MTIME (CLINT_BASE + 0xBFF8)          // 机器模式时间值
#define CLINT_MTIMECMP (CLINT_BASE + 0x4000)       // 机器模式时间比较器
#define CLINT_MSIP (CLINT_BASE + 0x0)              // 机器模式软件中断

// 时间中断间隔 (QEMU virt 平台频率为 10MHz)
#define TIMER_INTERVAL (1000000)  // 100ms 触发一次时间中断

// CSR 寄存器读写函数声明
void w_stvec(uint64 x);
uint64 r_stvec(void);
void w_sscratch(uint64 x);
uint64 r_sscratch(void);

#endif
