#
# uservec.S - User trap vector (xv6-style)
# 
# This code runs in supervisor mode, but uses the user page table.
# It is called when a trap (interrupt, exception, or system call) occurs
# while executing in user mode.
#
# The processor has switched to supervisor mode, but we're still using
# the user page table. We need to save the user registers and switch
# to the kernel page table and stack.
#

.section .text
.align 4
.global uservec
.type uservec, @function

uservec:
    #
    # trap.c has set up sscratch to hold the address of 
    # this process's trapframe. We swap a0 and sscratch
    # so that a0 points to the trapframe, then save
    # all the user registers in the trapframe.
    #
    
    # Debug: 写 'V' 到 UART 表示进入 uservec
    # 注意：这时还在用户页表中，但 UART 应该已经映射了
    li t0, 0x10000000
    li t1, 86  # 'V'
    sb t1, 0(t0)
    
    # swap a0 and sscratch
    # now a0 points to trapframe, sscratch holds user's a0
    csrrw a0, sscratch, a0
    
    # save the user registers in the trapframe
    sd ra, 40(a0)
    sd sp, 48(a0)
    sd gp, 56(a0)
    sd tp, 64(a0)
    sd t0, 72(a0)
    sd t1, 80(a0)
    sd t2, 88(a0)
    sd s0, 96(a0)
    sd s1, 104(a0)
    sd a1, 120(a0)
    sd a2, 128(a0)
    sd a3, 136(a0)
    sd a4, 144(a0)
    sd a5, 152(a0)
    sd a6, 160(a0)
    sd a7, 168(a0)
    sd s2, 176(a0)
    sd s3, 184(a0)
    sd s4, 192(a0)
    sd s5, 200(a0)
    sd s6, 208(a0)
    sd s7, 216(a0)
    sd s8, 224(a0)
    sd s9, 232(a0)
    sd s10, 240(a0)
    sd s11, 248(a0)
    sd t3, 256(a0)
    sd t4, 264(a0)
    sd t5, 272(a0)
    sd t6, 280(a0)
    
    # save the user a0 (which is in sscratch) in trapframe->a0
    csrr t0, sscratch
    sd t0, 112(a0)
    
    # restore kernel stack pointer from trapframe->kernel_sp
    ld sp, 8(a0)
    
    # make tp hold the current hartid, from trapframe->kernel_hartid
    ld tp, 32(a0)
    
    # load the address of usertrap() from trapframe->kernel_trap
    ld t0, 16(a0)
    
    # restore kernel page table from trapframe->kernel_satp
    ld t1, 0(a0)
    csrw satp, t1
    sfence.vma zero, zero
    
    # jump to usertrap() in trap.c
    jr t0

#
# userret(pagetable)
# called by usertrapret() in trap.c to
# switch from kernel to user.
# a0: user page table, for satp.
#
.global userret
.type userret, @function
userret:
    # userret(SATP)
    # a0: user page table (satp value)
    
    # switch to the user page table
    csrw satp, a0
    sfence.vma zero, zero
    
    # Get trapframe address from sscratch (set by usertrapret)
    csrr a0, sscratch
    
    # restore all but a0 from trapframe
    ld ra, 40(a0)
    ld sp, 48(a0)
    ld gp, 56(a0)
    ld tp, 64(a0)
    ld t0, 72(a0)
    ld t1, 80(a0)
    ld t2, 88(a0)
    ld s0, 96(a0)
    ld s1, 104(a0)
    ld a1, 120(a0)
    ld a2, 128(a0)
    ld a3, 136(a0)
    ld a4, 144(a0)
    ld a5, 152(a0)
    ld a6, 160(a0)
    ld a7, 168(a0)
    ld s2, 176(a0)
    ld s3, 184(a0)
    ld s4, 192(a0)
    ld s5, 200(a0)
    ld s6, 208(a0)
    ld s7, 216(a0)
    ld s8, 224(a0)
    ld s9, 232(a0)
    ld s10, 240(a0)
    ld s11, 248(a0)
    ld t3, 256(a0)
    ld t4, 264(a0)
    ld t5, 272(a0)
    ld t6, 280(a0)
    
    # restore user a0, and save trapframe address in sscratch
    ld t0, 112(a0)
    csrw sscratch, a0
    mv a0, t0
    
    # return to user mode and user pc
    # userret does not return
    sret
