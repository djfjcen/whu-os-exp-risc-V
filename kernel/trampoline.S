#define MAXVA (1L << (9 + 9 + 9 + 12 - 1))
#define PAGE_SIZE 4096
#define TRAMPOLINE (MAXVA - PAGE_SIZE)
#define TRAPFRAME (TRAMPOLINE - PAGE_SIZE)

.section trampsec
.globl trampoline
.globl usertrap
trampoline:
.align 4
.globl uservec
# 用户态下的陷阱处理入口点
uservec:
    csrw sscratch, x10
    li x10, TRAPFRAME
    
    # 保存用户态上下文到 TRAPFRAME
    sd x1, 40(x10)
    sd x2, 48(x10)
    sd x3, 56(x10)
    sd x4, 64(x10)
    sd x5, 72(x10)
    sd x6, 80(x10)
    sd x7, 88(x10)
    sd x8, 96(x10)
    sd x9, 104(x10)
    sd x11, 120(x10)
    sd x12, 128(x10)
    sd x13, 136(x10)
    sd x14, 144(x10)
    sd x15, 152(x10)
    sd x16, 160(x10)
    sd x17, 168(x10)
    sd x18, 176(x10)
    sd x19, 184(x10)
    sd x20, 192(x10)
    sd x21, 200(x10)
    sd x22, 208(x10)
    sd x23, 216(x10)
    sd x24, 224(x10)
    sd x25, 232(x10)
    sd x26, 240(x10)
    sd x27, 248(x10)
    sd x28, 256(x10)
    sd x29, 264(x10)
    sd x30, 272(x10)
    sd x31, 280(x10)

    csrr x5, sscratch
    sd x5, 112(x10)

    # 切换到内核页表并调用 usertrap()
    ld x2, 8(x10)

    #  p->trapframe->kernel_hartid
    ld x4, 32(x10)
    # p->trapframe->kernel_trap
    ld x5, 16(x10)

    # p->trapframe->kernel_satp.
    ld x6, 0(x10)

    sfence.vma zero, zero
    csrw satp, x6
    sfence.vma zero, zero

    # 调用 usertrap()
    jalr x5

.globl userret
userret:
    # 用户态 trap 处理完成后，准备返回用户态

    # 切换回用户页表
    sfence.vma zero, zero
    csrw satp, x10
    sfence.vma zero, zero

    # 从 TRAPFRAME 恢复用户态上下文
    li x10, TRAPFRAME

    ld x1, 40(x10)
    ld x2, 48(x10)
    ld x3, 56(x10)
    ld x4, 64(x10)
    ld x5, 72(x10)
    ld x6, 80(x10)
    ld x7, 88(x10)
    ld x8, 96(x10)
    ld x9, 104(x10)
    ld x11, 120(x10)
    ld x12, 128(x10)
    ld x13, 136(x10)
    ld x14, 144(x10)
    ld x15, 152(x10)
    ld x16, 160(x10)
    ld x17, 168(x10)
    ld x18, 176(x10)
    ld x19, 184(x10)
    ld x20, 192(x10)
    ld x21, 200(x10)
    ld x22, 208(x10)
    ld x23, 216(x10)
    ld x24, 224(x10)
    ld x25, 232(x10)
    ld x26, 240(x10)
    ld x27, 248(x10)
    ld x28, 256(x10)
    ld x29, 264(x10)
    ld x30, 272(x10)
    ld x31, 280(x10)

    # 回复用户的参数
    ld x10, 112(x10)
    
    # 返回用户态
    # usertrapret() 已经设置好了 sstatus 和 sepc
    sret