#ifndef _TRAP_H
#define _TRAP_H

#include <stdint.h>
#include "riscv_context.h"

// RISC-V 中断和异常号定义
// Supervisor模式下的中断和异常
#define TRAP_USER_SOFTWARE_INTERRUPT    0
#define TRAP_SUPERVISOR_SOFTWARE_INTERRUPT  1
#define TRAP_MACHINE_SOFTWARE_INTERRUPT     3
#define TRAP_USER_TIMER_INTERRUPT          4
#define TRAP_SUPERVISOR_TIMER_INTERRUPT    5
#define TRAP_MACHINE_TIMER_INTERRUPT       7
#define TRAP_USER_EXTERNAL_INTERRUPT       8
#define TRAP_SUPERVISOR_EXTERNAL_INTERRUPT 9
#define TRAP_MACHINE_EXTERNAL_INTERRUPT    11

// 异常类型
#define TRAP_INSTRUCTION_ADDRESS_MISALIGNED   0
#define TRAP_INSTRUCTION_ACCESS_FAULT         1
#define TRAP_ILLEGAL_INSTRUCTION              2
#define TRAP_BREAKPOINT                       3
#define TRAP_LOAD_ADDRESS_MISALIGNED          4
#define TRAP_LOAD_ACCESS_FAULT                5
#define TRAP_STORE_ADDRESS_MISALIGNED         6
#define TRAP_STORE_ACCESS_FAULT               7
#define TRAP_ENVIRONMENT_CALL_FROM_U_MODE     8
#define TRAP_ENVIRONMENT_CALL_FROM_S_MODE     9
#define TRAP_ENVIRONMENT_CALL_FROM_M_MODE     11
#define TRAP_INSTRUCTION_PAGE_FAULT           12
#define TRAP_LOAD_PAGE_FAULT                  13
#define TRAP_STORE_PAGE_FAULT                 15

// 中断优先级定义
#define IRQ_PRIORITY_HIGHEST    0
#define IRQ_PRIORITY_HIGH       1
#define IRQ_PRIORITY_NORMAL     2
#define IRQ_PRIORITY_LOW        3
#define IRQ_PRIORITY_LOWEST     4

// 中断标志
#define IRQ_FLAG_ENABLED        (1 << 0)
#define IRQ_FLAG_SHARED         (1 << 1)
#define IRQ_FLAG_FAST           (1 << 2)
#define IRQ_FLAG_NESTABLE       (1 << 3)

// 最大中断处理函数数量
#define MAX_INTERRUPT_HANDLERS  64
#define MAX_SHARED_HANDLERS     8

// 中断上下文结构 - 保存的寄存器
struct trap_frame {
    uint64_t x0;     // zero register (always 0, but we save it for consistency)
    uint64_t x1;     // ra (return address)
    uint64_t x2;     // sp (stack pointer)
    uint64_t x3;     // gp (global pointer)
    uint64_t x4;     // tp (thread pointer)
    uint64_t x5;     // t0
    uint64_t x6;     // t1
    uint64_t x7;     // t2
    uint64_t x8;     // s0/fp (frame pointer)
    uint64_t x9;     // s1
    uint64_t x10;    // a0
    uint64_t x11;    // a1
    uint64_t x12;    // a2
    uint64_t x13;    // a3
    uint64_t x14;    // a4
    uint64_t x15;    // a5
    uint64_t x16;    // a6
    uint64_t x17;    // a7
    uint64_t x18;    // s2
    uint64_t x19;    // s3
    uint64_t x20;    // s4
    uint64_t x21;    // s5
    uint64_t x22;    // s6
    uint64_t x23;    // s7
    uint64_t x24;    // s8
    uint64_t x25;    // s9
    uint64_t x26;    // s10
    uint64_t x27;    // s11
    uint64_t x28;    // t3
    uint64_t x29;    // t4
    uint64_t x30;    // t5
    uint64_t x31;    // t6
    
    // CSR 寄存器
    uint64_t sstatus;   // Supervisor status
    uint64_t sepc;      // Supervisor exception program counter
    uint64_t scause;    // Supervisor cause
    uint64_t stval;     // Supervisor trap value
};

// 中断处理函数类型定义
typedef int (*interrupt_handler_t)(int irq, void* data, struct trap_frame* tf);

// 中断描述符结构
struct interrupt_desc {
    interrupt_handler_t handler;    // 中断处理函数
    void* data;                    // 传递给处理函数的数据
    char name[32];                 // 中断名称
    uint32_t flags;                // 中断标志
    uint32_t priority;             // 中断优先级
    uint32_t count;                // 中断计数
    struct interrupt_desc* next;   // 用于共享中断的链表
};

// 中断控制器状态
struct interrupt_controller {
    struct interrupt_desc* handlers[MAX_INTERRUPT_HANDLERS];
    uint64_t enabled_mask;         // 启用的中断掩码
    uint64_t pending_mask;         // 待处理中断掩码
    uint32_t nest_level;           // 中断嵌套级别
    uint32_t current_irq;          // 当前处理的中断号
    struct trap_frame* current_tf; // 当前中断上下文
};

// 中断统计信息
struct interrupt_stats {
    uint64_t total_interrupts;     // 总中断次数
    uint64_t nested_interrupts;    // 嵌套中断次数
    uint64_t spurious_interrupts;  // 伪中断次数
    uint64_t max_nest_level;       // 最大嵌套级别
    uint64_t total_exceptions;     // 总异常次数
    uint64_t irq_counts[MAX_INTERRUPT_HANDLERS]; // 各中断计数
};

// 中断控制接口函数声明
void trap_init(void);                                    // 初始化中断系统
int register_interrupt(int irq, interrupt_handler_t handler, void* data, const char* name, uint32_t flags, uint32_t priority);
int unregister_interrupt(int irq, interrupt_handler_t handler); // 注销中断处理函数
void enable_interrupt(int irq);                          // 启用中断
void disable_interrupt(int irq);                         // 禁用中断
void enable_interrupts(void);                            // 全局启用中断
void disable_interrupts(void);                           // 全局禁用中断
int is_interrupt_enabled(int irq);                       // 检查中断是否启用

// 中断处理核心函数
void trap_handler(struct trap_frame* tf);                // 通用中断处理入口
void handle_interrupt(int irq, struct trap_frame* tf);   // 处理具体中断
void handle_exception(int cause, struct trap_frame* tf); // 处理异常

// 具体异常处理函数
void handle_syscall(struct trap_frame* tf);
void handle_instruction_page_fault(struct trap_frame* tf);
void handle_load_page_fault(struct trap_frame* tf);
void handle_store_page_fault(struct trap_frame* tf);
void handle_illegal_instruction(struct trap_frame* tf);
void handle_breakpoint(struct trap_frame* tf);
void handle_misaligned_access(struct trap_frame* tf, int type);
void handle_access_fault(struct trap_frame* tf, int type);
void handle_environment_call(struct trap_frame* tf, int mode);

// 中断优先级管理
void set_interrupt_priority(int irq, uint32_t priority); // 设置中断优先级
uint32_t get_interrupt_priority(int irq);                // 获取中断优先级
int mask_interrupts_below_priority(uint32_t priority);   // 屏蔽低优先级中断

// 中断统计和调试
void print_interrupt_stats(void);                        // 打印中断统计信息
void dump_trap_frame(struct trap_frame* tf);            // 打印中断上下文
const char* get_trap_name(int cause);                   // 获取中断/异常名称

// 汇编入口函数声明
extern void trap_entry(void);                           // 汇编中断入口
extern void trap_return(struct trap_frame* tf);         // 中断返回
extern void kernelvec(void);                            // 内核中断向量
extern void kernelvec_fast(void);                       // 快速中断向量
extern void kernelvec_minimal(void);                    // 最小中断向量
extern void uservec(void);                              // 用户中断向量
extern void userret(void);                              // 用户中断返回

// 新增中断处理函数
void fast_interrupt_handler(struct trap_frame* tf);     // 快速中断处理
void minimal_interrupt_handler(struct trap_frame* tf);  // 最小中断处理
void user_trap_handler(struct trap_frame* tf);          // 用户中断处理
void kernel_panic_handler(void);                        // 内核panic处理
void test_context_switching(void);                      // 上下文切换测试

// 中断栈管理函数
void init_interrupt_stack(void);
uint64_t get_interrupt_stack_top(void);
int enter_interrupt_handler(struct trap_frame* tf);
void exit_interrupt_handler(struct trap_frame* tf);
void print_stack_stats(void);
void emergency_stack_recovery(void);

// CSR 操作宏定义
#define read_csr(reg) ({ \
    uint64_t __tmp; \
    asm volatile("csrr %0, " #reg : "=r"(__tmp)); \
    __tmp; \
})

#define write_csr(reg, val) ({ \
    asm volatile("csrw " #reg ", %0" :: "rK"(val)); \
})

#define set_csr(reg, bit) ({ \
    uint64_t __tmp; \
    asm volatile("csrrs %0, " #reg ", %1" : "=r"(__tmp) : "rK"(bit)); \
    __tmp; \
})

#define clear_csr(reg, bit) ({ \
    uint64_t __tmp; \
    asm volatile("csrrc %0, " #reg ", %1" : "=r"(__tmp) : "rK"(bit)); \
    __tmp; \
})

// SSTATUS 寄存器位定义
#define SSTATUS_SIE     (1UL << 1)     // Supervisor Interrupt Enable
#define SSTATUS_SPIE    (1UL << 5)     // Supervisor Previous Interrupt Enable
#define SSTATUS_SPP     (1UL << 8)     // Supervisor Previous Privilege

// SIE 和 SIP 寄存器位定义
#define SIE_SSIE        (1UL << 1)     // Supervisor Software Interrupt Enable
#define SIE_STIE        (1UL << 5)     // Supervisor Timer Interrupt Enable
#define SIE_SEIE        (1UL << 9)     // Supervisor External Interrupt Enable

#endif /* _TRAP_H */