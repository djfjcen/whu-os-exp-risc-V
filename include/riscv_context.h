/*
 * RISC-V 寄存器分析和上下文保存策略
 * 基于 RISC-V ABI 和 xv6 设计
 */

#ifndef _RISCV_CONTEXT_H
#define _RISCV_CONTEXT_H

#include <stdint.h>

/*
 * RISC-V 寄存器分类 (按照调用约定)
 * 
 * 1. 调用者保存寄存器 (Caller-saved):
 *    - 在函数调用时由调用者负责保存
 *    - 被调用函数可以自由修改这些寄存器
 *    - 中断发生时必须保存，因为中断处理函数可能修改这些寄存器
 * 
 * 2. 被调用者保存寄存器 (Callee-saved):
 *    - 在函数调用时由被调用函数负责保存
 *    - 如果被调用函数要使用，必须先保存原值
 *    - 中断处理时理论上不需要保存（如果中断处理函数遵循ABI）
 * 
 * 3. 特殊寄存器:
 *    - 零寄存器 (x0): 始终为0，不需要保存
 *    - 栈指针 (x2/sp): 必须保存，用于恢复原栈
 *    - 全局指针 (x3/gp): 通常不变，但安全起见需要保存
 *    - 线程指针 (x4/tp): 进程相关，需要保存
 */

// RISC-V 寄存器编号和名称映射
#define REG_ZERO    0   // x0  - 硬件零寄存器
#define REG_RA      1   // x1  - 返回地址
#define REG_SP      2   // x2  - 栈指针
#define REG_GP      3   // x3  - 全局指针  
#define REG_TP      4   // x4  - 线程指针
#define REG_T0      5   // x5  - 临时寄存器0
#define REG_T1      6   // x6  - 临时寄存器1
#define REG_T2      7   // x7  - 临时寄存器2
#define REG_S0_FP   8   // x8  - 保存寄存器0/帧指针
#define REG_S1      9   // x9  - 保存寄存器1
#define REG_A0     10   // x10 - 参数/返回值0
#define REG_A1     11   // x11 - 参数/返回值1
#define REG_A2     12   // x12 - 参数2
#define REG_A3     13   // x13 - 参数3
#define REG_A4     14   // x14 - 参数4
#define REG_A5     15   // x15 - 参数5
#define REG_A6     16   // x16 - 参数6
#define REG_A7     17   // x17 - 参数7
#define REG_S2     18   // x18 - 保存寄存器2
#define REG_S3     19   // x19 - 保存寄存器3
#define REG_S4     20   // x20 - 保存寄存器4
#define REG_S5     21   // x21 - 保存寄存器5
#define REG_S6     22   // x22 - 保存寄存器6
#define REG_S7     23   // x23 - 保存寄存器7
#define REG_S8     24   // x24 - 保存寄存器8
#define REG_S9     25   // x25 - 保存寄存器9
#define REG_S10    26   // x26 - 保存寄存器10
#define REG_S11    27   // x27 - 保存寄存器11
#define REG_T3     28   // x28 - 临时寄存器3
#define REG_T4     29   // x29 - 临时寄存器4
#define REG_T5     30   // x30 - 临时寄存器5
#define REG_T6     31   // x31 - 临时寄存器6

/*
 * 寄存器保存策略：
 * 
 * 必须保存的寄存器（调用者保存 + 特殊寄存器）:
 * - x1 (ra): 返回地址，中断返回需要
 * - x2 (sp): 栈指针，恢复原栈必需
 * - x3 (gp): 全局指针，安全保存
 * - x4 (tp): 线程指针，进程切换需要
 * - x5-x7 (t0-t2): 临时寄存器，调用者保存
 * - x10-x17 (a0-a7): 参数寄存器，调用者保存
 * - x28-x31 (t3-t6): 临时寄存器，调用者保存
 * 
 * 可选保存的寄存器（被调用者保存）:
 * - x8-x9 (s0-s1): 如果中断处理函数遵循ABI，理论上不需要保存
 * - x18-x27 (s2-s11): 同上
 * 
 * 不需要保存的寄存器:
 * - x0 (zero): 硬件保证始终为0
 */

// 寄存器保存策略位掩码
#define CALLER_SAVED_MASK  0xF87E0000  // t0-t2, a0-a7, t3-t6
#define CALLEE_SAVED_MASK  0x0781FE00  // s0-s11
#define SPECIAL_REGS_MASK  0x0000001E  // ra, sp, gp, tp

// 完整保存掩码（保守策略：保存所有非零寄存器）
#define FULL_SAVE_MASK     0xFFFFFFFE  // 除x0外的所有寄存器

// 最小保存掩码（激进策略：只保存调用者保存寄存器）
#define MINIMAL_SAVE_MASK  (CALLER_SAVED_MASK | SPECIAL_REGS_MASK)

/*
 * CSR 寄存器保存需求：
 * 
 * 必须保存的CSR：
 * - sstatus: 处理器状态，包含中断使能位
 * - sepc: 异常程序计数器，中断返回地址
 * - scause: 异常原因（在C代码中读取，不需要保存到栈）
 * - stval: 异常值（同上）
 * 
 * 可选保存的CSR：
 * - sscratch: 临时寄存器，可用于保存sp
 * - satp: 地址转换，进程切换时需要
 */

// CSR寄存器偏移量（在trap_frame中的位置）
#define CSR_SSTATUS_OFFSET  (32 * 8)
#define CSR_SEPC_OFFSET     (33 * 8)
#define CSR_SCAUSE_OFFSET   (34 * 8)
#define CSR_STVAL_OFFSET    (35 * 8)
#define CSR_SSCRATCH_OFFSET (36 * 8)

/*
 * 栈管理策略：
 * 
 * 1. 中断栈分配：
 *    - 每个CPU核心一个中断栈
 *    - 栈大小：8KB (2页)
 *    - 栈顶留guard page防止栈溢出
 * 
 * 2. 栈溢出检测：
 *    - 检查栈指针是否超出栈边界
 *    - 使用canary值检测栈破坏
 * 
 * 3. 多级中断栈管理：
 *    - 嵌套中断使用同一栈
 *    - 栈帧链式管理
 *    - 维护嵌套深度计数
 */

#define INTERRUPT_STACK_SIZE    (8 * 1024)     // 8KB中断栈
#define MAX_INTERRUPT_NEST      8              // 最大中断嵌套深度
#define STACK_CANARY           0xDEADBEEF      // 栈保护魔数

// 中断栈描述符
struct interrupt_stack {
    uint8_t stack[INTERRUPT_STACK_SIZE];       // 栈空间
    uint32_t canary;                           // 栈保护魔数
    uint32_t nest_level;                       // 当前嵌套深度
    uint64_t stack_base;                       // 栈基地址
    uint64_t stack_top;                        // 栈顶地址
    struct trap_frame* current_frame;          // 当前栈帧
};

/*
 * 快速中断处理优化：
 * 
 * 1. 寄存器分级保存：
 *    - Level 1: 只保存必要的寄存器 (ra, sp, 临时寄存器)
 *    - Level 2: 保存所有调用者保存寄存器
 *    - Level 3: 保存所有寄存器（完整上下文）
 * 
 * 2. CSR优化：
 *    - 使用sscratch寄存器临时保存sp
 *    - 延迟保存非关键CSR
 * 
 * 3. 内存访问优化：
 *    - 使用连续内存布局减少cache miss
 *    - 对齐到cache line边界
 */

// 快速中断处理的寄存器保存级别
typedef enum {
    SAVE_LEVEL_MINIMAL = 0,  // 最小保存：ra, sp, t0-t2, a0-a1
    SAVE_LEVEL_CALLER  = 1,  // 调用者保存：+ 其他参数和临时寄存器  
    SAVE_LEVEL_FULL    = 2   // 完整保存：所有寄存器
} save_level_t;

// 上下文保存配置
struct context_save_config {
    save_level_t save_level;           // 保存级别
    int save_callee_saved;             // 是否保存被调用者保存寄存器
    int save_fp_regs;                  // 是否保存浮点寄存器
    int enable_stack_check;            // 是否启用栈检查
    int enable_canary;                 // 是否启用栈保护
};

#endif /* _RISCV_CONTEXT_H */