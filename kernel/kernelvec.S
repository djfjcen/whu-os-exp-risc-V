# kernelvec.S - 优化的RISC-V内核中断向量实现
# 基于xv6设计，支持多种保存策略和快速中断处理

.section .text
.globl kernelvec
.globl kernelvec_fast
.globl kernelvec_minimal
.globl uservec
.globl userret
.globl switch_to_interrupt_stack
.globl restore_from_interrupt_stack

.align 4

#
# kernelvec - 完整的内核中断向量
# 保存所有寄存器，适用于可能调用复杂C函数的中断
#
kernelvec:
    # 保存所有寄存器到当前栈
    # 为trap_frame分配空间 (37 * 8 = 296 bytes)
    addi sp, sp, -296
    
    # 保存通用寄存器 (x1-x31，跳过x0因为始终为0)
    sd x1,   8(sp)    # ra
    sd x2,  16(sp)    # sp (中断前的值，后面会修正)
    sd x3,  24(sp)    # gp
    sd x4,  32(sp)    # tp
    sd x5,  40(sp)    # t0
    sd x6,  48(sp)    # t1
    sd x7,  56(sp)    # t2
    sd x8,  64(sp)    # s0/fp
    sd x9,  72(sp)    # s1
    sd x10, 80(sp)    # a0
    sd x11, 88(sp)    # a1
    sd x12, 96(sp)    # a2
    sd x13,104(sp)    # a3
    sd x14,112(sp)    # a4
    sd x15,120(sp)    # a5
    sd x16,128(sp)    # a6
    sd x17,136(sp)    # a7
    sd x18,144(sp)    # s2
    sd x19,152(sp)    # s3
    sd x20,160(sp)    # s4
    sd x21,168(sp)    # s5
    sd x22,176(sp)    # s6
    sd x23,184(sp)    # s7
    sd x24,192(sp)    # s8
    sd x25,200(sp)    # s9
    sd x26,208(sp)    # s10
    sd x27,216(sp)    # s11
    sd x28,224(sp)    # t3
    sd x29,232(sp)    # t4
    sd x30,240(sp)    # t5
    sd x31,248(sp)    # t6
    
    # 修正保存的sp值（中断前的真实sp）
    addi t0, sp, 296
    sd t0, 16(sp)
    
    # 保存CSR寄存器
    csrr t0, sstatus
    sd t0, 256(sp)    # sstatus
    
    csrr t0, sepc  
    sd t0, 264(sp)    # sepc
    
    csrr t0, scause
    sd t0, 272(sp)    # scause
    
    csrr t0, stval
    sd t0, 280(sp)    # stval
    
    csrr t0, sscratch
    sd t0, 288(sp)    # sscratch
    
    # 调用栈管理函数
    mv a0, sp
    call enter_interrupt_handler
    
    # 检查栈管理函数返回值
    bnez a0, kernel_panic
    
    # 调用C中断处理函数
    mv a0, sp
    call trap_handler
    
    # 退出中断处理
    mv a0, sp
    call exit_interrupt_handler
    
    # 恢复所有寄存器并返回
    j kernelret

#
# kernelvec_fast - 快速中断向量
# 只保存调用者保存寄存器，用于简单的中断处理
#
kernelvec_fast:
    # 为快速trap_frame分配空间 (只保存必要寄存器)
    addi sp, sp, -128
    
    # 保存必要的寄存器
    sd x1,   8(sp)    # ra
    sd x2,  16(sp)    # sp
    sd x5,  24(sp)    # t0
    sd x6,  32(sp)    # t1 
    sd x7,  40(sp)    # t2
    sd x10, 48(sp)    # a0
    sd x11, 56(sp)    # a1
    sd x12, 64(sp)    # a2
    sd x13, 72(sp)    # a3
    sd x28, 80(sp)    # t3
    sd x29, 88(sp)    # t4
    sd x30, 96(sp)    # t5
    sd x31,104(sp)    # t6
    
    # 保存关键CSR
    csrr t0, sstatus
    sd t0, 112(sp)
    csrr t0, sepc
    sd t0, 120(sp)
    
    # 修正sp值
    addi t0, sp, 128
    sd t0, 16(sp)
    
    # 调用快速中断处理函数
    mv a0, sp
    call fast_interrupt_handler
    
    # 快速恢复
    j fast_kernelret

#
# kernelvec_minimal - 最小中断向量
# 只保存最基本寄存器，用于性能关键的中断
#
kernelvec_minimal:
    # 使用sscratch临时保存sp
    csrw sscratch, sp
    
    # 切换到中断栈
    call get_interrupt_stack_top
    mv sp, a0
    addi sp, sp, -64
    
    # 保存最小寄存器集
    sd x1,   8(sp)    # ra
    csrr t0, sscratch
    sd t0,  16(sp)    # 原始sp
    sd x10, 24(sp)    # a0
    sd x11, 32(sp)    # a1
    
    # 保存关键CSR
    csrr t0, sstatus
    sd t0, 40(sp)
    csrr t0, sepc
    sd t0, 48(sp)
    
    # 调用最小中断处理函数
    mv a0, sp
    call minimal_interrupt_handler
    
    # 最小恢复
    j minimal_kernelret

#
# kernelret - 完整中断返回
# 恢复所有寄存器
#
kernelret:
    # 恢复CSR寄存器
    ld t0, 288(sp)    # sscratch
    csrw sscratch, t0
    
    ld t0, 280(sp)    # stval
    csrw stval, t0
    
    ld t0, 272(sp)    # scause  
    csrw scause, t0
    
    ld t0, 264(sp)    # sepc
    csrw sepc, t0
    
    ld t0, 256(sp)    # sstatus
    csrw sstatus, t0
    
    # 恢复通用寄存器
    ld x1,   8(sp)    # ra
    ld x3,  24(sp)    # gp
    ld x4,  32(sp)    # tp
    ld x5,  40(sp)    # t0
    ld x6,  48(sp)    # t1
    ld x7,  56(sp)    # t2
    ld x8,  64(sp)    # s0/fp
    ld x9,  72(sp)    # s1
    ld x10, 80(sp)    # a0
    ld x11, 88(sp)    # a1
    ld x12, 96(sp)    # a2
    ld x13,104(sp)    # a3
    ld x14,112(sp)    # a4
    ld x15,120(sp)    # a5
    ld x16,128(sp)    # a6
    ld x17,136(sp)    # a7
    ld x18,144(sp)    # s2
    ld x19,152(sp)    # s3
    ld x20,160(sp)    # s4
    ld x21,168(sp)    # s5
    ld x22,176(sp)    # s6
    ld x23,184(sp)    # s7
    ld x24,192(sp)    # s8
    ld x25,200(sp)    # s9
    ld x26,208(sp)    # s10
    ld x27,216(sp)    # s11
    ld x28,224(sp)    # t3
    ld x29,232(sp)    # t4
    ld x30,240(sp)    # t5
    ld x31,248(sp)    # t6
    
    # 最后恢复sp并返回
    ld x2,  16(sp)    # sp
    sret

#
# fast_kernelret - 快速中断返回
#
fast_kernelret:
    # 恢复CSR
    ld t0, 120(sp)
    csrw sepc, t0
    ld t0, 112(sp) 
    csrw sstatus, t0
    
    # 恢复寄存器
    ld x1,   8(sp)
    ld x5,  24(sp)
    ld x6,  32(sp)
    ld x7,  40(sp)
    ld x10, 48(sp)
    ld x11, 56(sp)
    ld x12, 64(sp)
    ld x13, 72(sp)
    ld x28, 80(sp)
    ld x29, 88(sp)
    ld x30, 96(sp)
    ld x31,104(sp)
    
    # 恢复sp并返回
    ld x2,  16(sp)
    sret

#
# minimal_kernelret - 最小中断返回
#
minimal_kernelret:
    # 恢复CSR
    ld t0, 48(sp)
    csrw sepc, t0
    ld t0, 40(sp)
    csrw sstatus, t0
    
    # 恢复寄存器
    ld x1,   8(sp)
    ld x10, 24(sp)
    ld x11, 32(sp)
    
    # 恢复sp
    ld x2,  16(sp)
    sret

#
# uservec - 用户空间中断向量
# 处理从用户空间来的中断/异常
#
uservec:
    # 用户空间中断需要切换到内核栈
    # 使用sscratch保存用户栈指针
    csrw sscratch, sp
    
    # 切换到内核栈
    call get_interrupt_stack_top
    mv sp, a0
    
    # 分配用户trap_frame空间
    addi sp, sp, -296
    
    # 保存用户寄存器
    sd x1,   8(sp)
    csrr t0, sscratch  # 获取用户sp
    sd t0,  16(sp)
    sd x3,  24(sp)
    sd x4,  32(sp)
    # ... 保存其他寄存器 ...
    
    # 保存用户CSR状态
    csrr t0, sstatus
    sd t0, 256(sp)
    csrr t0, sepc
    sd t0, 264(sp)
    
    # 调用用户中断处理函数
    mv a0, sp
    call user_trap_handler
    
    # 用户空间返回
    j userret

#
# userret - 用户空间中断返回
#
userret:
    # 恢复用户寄存器和状态
    # 实现与kernelret类似，但需要恢复到用户栈
    
    # 恢复CSR
    ld t0, 264(sp)
    csrw sepc, t0
    ld t0, 256(sp)
    csrw sstatus, t0
    
    # 恢复用户寄存器
    ld x1,   8(sp)
    ld x3,  24(sp)
    ld x4,  32(sp)
    # ... 恢复其他寄存器 ...
    
    # 恢复用户栈指针并返回用户空间
    ld x2,  16(sp)
    sret

#
# 错误处理 - 内核panic
#
kernel_panic:
    # 调用C函数处理panic
    call emergency_stack_recovery
    call kernel_panic_handler
    # 不应该返回
    j .

#
# 栈切换辅助函数
#
switch_to_interrupt_stack:
    # 保存当前sp到a0指向的位置
    sd sp, 0(a0)
    
    # 切换到中断栈
    call get_interrupt_stack_top
    mv sp, a0
    ret

restore_from_interrupt_stack:
    # 从a0指向的位置恢复sp
    ld sp, 0(a0)  
    ret

#
# 性能计数器和调试支持
#
.globl save_minimal_context
save_minimal_context:
    # 保存最小上下文到a0指向的内存
    sd x1, 0(a0)     # ra
    sd x2, 8(a0)     # sp
    csrr t0, sstatus
    sd t0, 16(a0)    # sstatus
    csrr t0, sepc
    sd t0, 24(a0)    # sepc
    ret

.globl restore_minimal_context  
restore_minimal_context:
    # 从a0指向的内存恢复最小上下文
    ld x1, 0(a0)     # ra
    ld x2, 8(a0)     # sp  
    ld t0, 16(a0)    # sstatus
    csrw sstatus, t0
    ld t0, 24(a0)    # sepc
    csrw sepc, t0
    ret