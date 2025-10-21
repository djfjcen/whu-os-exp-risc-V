# Machine mode interrupt vector
# 处理在 Machine 模式下发生的中断

.section .text
.align 4
.global machinevec
.type machinevec, @function

machinevec:
    # 在 Machine 模式下处理中断
    # 保存最小的上下文（只保存需要用到的寄存器）
    
    # 调试：标记进入中断
    li t6, 0x10000000
    li t5, '!'
    sb t5, 0(t6)
    
    # 获取中断原因
    csrr t0, mcause
    
    # 检查是否是时钟中断 (mcause & 0x80000000 == 时钟中断)
    li t1, 0x80000000
    and t2, t0, t1
    beq t2, t1, machine_timer_interrupt
    
    # 检查其他中断类型
    li t1, 0x7FFFFFFF
    and t2, t0, t1
    
    # 检查是否是时钟中断（原因码 = 7）
    li t1, 7
    beq t2, t1, machine_timer_interrupt
    
    # 未知中断，直接返回
    li t5, '?'
    sb t5, 0(t6)
    mret

machine_timer_interrupt:
    # 时钟中断处理
    li t5, 'T'
    sb t5, 0(t6)
    
    # 调用 C 函数处理
    call machine_timer_handler
    mret

.end
