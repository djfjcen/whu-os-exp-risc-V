# trap.S - RISC-V 中断和异常处理汇编代码
# 基于 xv6 架构设计，支持中断嵌套和优先级管理

.section .text
.globl trap_entry
.globl trap_return
.globl kernel_trap_vector

.align 4

# 中断入口点 - 保存所有寄存器到栈上
trap_entry:
    # 分配栈空间存储 trap_frame (34 * 8 = 272 bytes)
    addi sp, sp, -272
    
    # 保存所有通用寄存器
    sd x0,   0(sp)    # x0 (zero)
    sd x1,   8(sp)    # x1 (ra)
    sd x2,  16(sp)    # x2 (sp) - 注意：这里保存的是中断前的sp
    sd x3,  24(sp)    # x3 (gp)
    sd x4,  32(sp)    # x4 (tp)
    sd x5,  40(sp)    # x5 (t0)
    sd x6,  48(sp)    # x6 (t1)
    sd x7,  56(sp)    # x7 (t2)
    sd x8,  64(sp)    # x8 (s0/fp)
    sd x9,  72(sp)    # x9 (s1)
    sd x10, 80(sp)    # x10 (a0)
    sd x11, 88(sp)    # x11 (a1)
    sd x12, 96(sp)    # x12 (a2)
    sd x13,104(sp)    # x13 (a3)
    sd x14,112(sp)    # x14 (a4)
    sd x15,120(sp)    # x15 (a5)
    sd x16,128(sp)    # x16 (a6)
    sd x17,136(sp)    # x17 (a7)
    sd x18,144(sp)    # x18 (s2)
    sd x19,152(sp)    # x19 (s3)
    sd x20,160(sp)    # x20 (s4)
    sd x21,168(sp)    # x21 (s5)
    sd x22,176(sp)    # x22 (s6)
    sd x23,184(sp)    # x23 (s7)
    sd x24,192(sp)    # x24 (s8)
    sd x25,200(sp)    # x25 (s9)
    sd x26,208(sp)    # x26 (s10)
    sd x27,216(sp)    # x27 (s11)
    sd x28,224(sp)    # x28 (t3)
    sd x29,232(sp)    # x29 (t4)
    sd x30,240(sp)    # x30 (t5)
    sd x31,248(sp)    # x31 (t6)
    
    # 修复 sp 的值 - 保存中断前的真实 sp
    addi t0, sp, 272
    sd t0, 16(sp)     # 修正 x2 (sp) 的值
    
    # 保存 CSR 寄存器
    csrr t0, sstatus
    sd t0, 256(sp)    # sstatus
    
    csrr t0, sepc
    sd t0, 264(sp)    # sepc
    
    # scause 和 stval 在 C 代码中读取，这里不保存
    
    # 设置内核栈和全局指针
    # 如果需要切换到内核栈，在这里实现
    
    # 调用 C 语言中断处理函数
    # 参数：trap_frame 指针
    mv a0, sp
    call trap_handler
    
    # 中断处理完成，恢复上下文
    j trap_return

# 中断返回 - 恢复所有寄存器并返回
trap_return:
    # a0 应该包含 trap_frame 指针
    # 如果 trap_handler 修改了栈指针，需要使用传入的指针
    mv sp, a0
    
    # 恢复 CSR 寄存器
    ld t0, 256(sp)    # sstatus
    csrw sstatus, t0
    
    ld t0, 264(sp)    # sepc
    csrw sepc, t0
    
    # 恢复通用寄存器 (除了 sp，最后恢复)
    ld x1,   8(sp)    # x1 (ra)
    ld x3,  24(sp)    # x3 (gp)
    ld x4,  32(sp)    # x4 (tp)
    ld x5,  40(sp)    # x5 (t0)
    ld x6,  48(sp)    # x6 (t1)
    ld x7,  56(sp)    # x7 (t2)
    ld x8,  64(sp)    # x8 (s0/fp)
    ld x9,  72(sp)    # x9 (s1)
    ld x10, 80(sp)    # x10 (a0)
    ld x11, 88(sp)    # x11 (a1)
    ld x12, 96(sp)    # x12 (a2)
    ld x13,104(sp)    # x13 (a3)
    ld x14,112(sp)    # x14 (a4)
    ld x15,120(sp)    # x15 (a5)
    ld x16,128(sp)    # x16 (a6)
    ld x17,136(sp)    # x17 (a7)
    ld x18,144(sp)    # x18 (s2)
    ld x19,152(sp)    # x19 (s3)
    ld x20,160(sp)    # x20 (s4)
    ld x21,168(sp)    # x21 (s5)
    ld x22,176(sp)    # x22 (s6)
    ld x23,184(sp)    # x23 (s7)
    ld x24,192(sp)    # x24 (s8)
    ld x25,200(sp)    # x25 (s9)
    ld x26,208(sp)    # x26 (s10)
    ld x27,216(sp)    # x27 (s11)
    ld x28,224(sp)    # x28 (t3)
    ld x29,232(sp)    # x29 (t4)
    ld x30,240(sp)    # x30 (t5)
    ld x31,248(sp)    # x31 (t6)
    
    # 最后恢复栈指针
    ld x2,  16(sp)    # x2 (sp)
    
    # 返回中断前的位置
    sret

# 内核中断向量表入口
kernel_trap_vector:
    j trap_entry

# 简化的中断返回（用于快速中断）
.globl fast_trap_return
fast_trap_return:
    # 只恢复必要的寄存器，用于快速中断处理
    ld t0, 256(sp)    # sstatus
    csrw sstatus, t0
    
    ld t0, 264(sp)    # sepc
    csrw sepc, t0
    
    # 恢复关键寄存器
    ld x1,   8(sp)    # ra
    ld x10, 80(sp)    # a0
    ld x11, 88(sp)    # a1
    
    # 恢复栈指针并返回
    addi sp, sp, 272
    sret

# 禁用中断的辅助函数
.globl disable_interrupts_asm
disable_interrupts_asm:
    csrci sstatus, 2  # 清除 SIE 位 (SSTATUS_SIE = 1 << 1)
    ret

# 启用中断的辅助函数
.globl enable_interrupts_asm  
enable_interrupts_asm:
    csrsi sstatus, 2  # 设置 SIE 位
    ret

# 读取中断状态
.globl read_interrupt_status
read_interrupt_status:
    csrr a0, sstatus
    andi a0, a0, 2    # 检查 SIE 位
    ret