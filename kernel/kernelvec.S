# kernelvec.S - RISC-V内核态中断向量入口
# 参考xv6的kernelvec.S实现
# 当CPU在内核态（监督模式）执行时发生中断或异常，跳转到这里

.section .text
.align 4
.global kernelvec
.type kernelvec, @function

kernelvec:
    # 在内核模式下，我们有内核栈可用
    # sp指向内核栈顶端
    # trapframe大小 = 34 * 8 = 272 字节
    # (32个通用寄存器 + 2个CSR: sepc + scause)
    
    # 第一步: 保存原始sp到一个临时位置
    # 使用sscratch寄存器存储原始sp (在xv6中, sscratch保存指向trapframe的指针)
    # 这里简化: 直接在栈上分配空间
    
    addi sp, sp, -272  # 为trapframe分配栈空间
    
    # 保存所有32个通用寄存器 (x0-x31)
    # trapframe结构中的偏移量
    sd x0, 0(sp)       # x0 - zero (硬编码为0，仍然保存)
    sd x1, 8(sp)       # x1 - ra (返回地址)
    # x2 (sp) 稍后处理，因为它的值已经改变
    sd x3, 24(sp)      # x3 - gp (全局指针)
    sd x4, 32(sp)      # x4 - tp (线程指针)
    sd x5, 40(sp)      # x5 - t0
    sd x6, 48(sp)      # x6 - t1
    sd x7, 56(sp)      # x7 - t2
    sd x8, 64(sp)      # x8 - s0 (fp)
    sd x9, 72(sp)      # x9 - s1
    sd x10, 80(sp)     # x10 - a0
    sd x11, 88(sp)     # x11 - a1
    sd x12, 96(sp)     # x12 - a2
    sd x13, 104(sp)    # x13 - a3
    sd x14, 112(sp)    # x14 - a4
    sd x15, 120(sp)    # x15 - a5
    sd x16, 128(sp)    # x16 - a6
    sd x17, 136(sp)    # x17 - a7
    sd x18, 144(sp)    # x18 - s2
    sd x19, 152(sp)    # x19 - s3
    sd x20, 160(sp)    # x20 - s4
    sd x21, 168(sp)    # x21 - s5
    sd x22, 176(sp)    # x22 - s6
    sd x23, 184(sp)    # x23 - s7
    sd x24, 192(sp)    # x24 - s8
    sd x25, 200(sp)    # x25 - s9
    sd x26, 208(sp)    # x26 - s10
    sd x27, 216(sp)    # x27 - s11
    sd x28, 224(sp)    # x28 - t3
    sd x29, 232(sp)    # x29 - t4
    sd x30, 240(sp)    # x30 - t5
    sd x31, 248(sp)    # x31 - t6
    
    # 保存原始sp (在sp被修改之前的值)
    # 原始sp = 当前sp + 272
    addi t0, sp, 272
    sd t0, 16(sp)      # 在x2的位置保存原始sp值
    
    # 保存CSR寄存器 (新位置: 256-272)
    csrr t0, sepc
    sd t0, 256(sp)     # sepc (offset 32*8 = 256)
    
    csrr t0, scause
    sd t0, 264(sp)     # scause (offset 33*8 = 264)
    
    # 现在调用C处理函数 kerneltrap()
    # C函数的调用约定: 第一个参数在a0中
    # 但kerneltrap()不需要参数（或者需要trapframe指针）
    # 简化: 不传递参数，让kerneltrap使用全局状态
    
    call kerneltrap
    
    # 从kerneltrap返回后，恢复上下文
    # 恢复所有寄存器（除了sp，我们最后处理）
    ld x1, 8(sp)       # ra
    ld x3, 24(sp)      # gp
    ld x4, 32(sp)      # tp
    ld x5, 40(sp)      # t0
    ld x6, 48(sp)      # t1
    ld x7, 56(sp)      # t2
    ld x8, 64(sp)      # s0
    ld x9, 72(sp)      # s1
    ld x10, 80(sp)     # a0
    ld x11, 88(sp)     # a1
    ld x12, 96(sp)     # a2
    ld x13, 104(sp)    # a3
    ld x14, 112(sp)    # a4
    ld x15, 120(sp)    # a5
    ld x16, 128(sp)    # a6
    ld x17, 136(sp)    # a7
    ld x18, 144(sp)    # s2
    ld x19, 152(sp)    # s3
    ld x20, 160(sp)    # s4
    ld x21, 168(sp)    # s5
    ld x22, 176(sp)    # s6
    ld x23, 184(sp)    # s7
    ld x24, 192(sp)    # s8
    ld x25, 200(sp)    # s9
    ld x26, 208(sp)    # s10
    ld x27, 216(sp)    # s11
    ld x28, 224(sp)    # t3
    ld x29, 232(sp)    # t4
    ld x30, 240(sp)    # t5
    ld x31, 248(sp)    # t6
    
    # 恢复CSR
    ld t0, 256(sp)     # sepc
    csrw sepc, t0
    
    ld t0, 264(sp)     # scause
    csrw scause, t0
    
    # 恢复sp (原始值)
    ld x2, 16(sp)      # 从栈上恢复原始sp
    
    # 使用sret返回到被中断的代码
    # sret会跳转到sepc，并恢复之前的权限级别
    sret
