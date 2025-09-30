/*
 * sbi.c - RISC-V SBI 接口实现
 */

#include "sbi.h"

/**
 * 底层 SBI ecall 调用
 */
struct sbiret sbi_ecall(int ext, int fid, uint64_t arg0, uint64_t arg1,
                        uint64_t arg2, uint64_t arg3, uint64_t arg4, uint64_t arg5) {
    struct sbiret ret;
    
    register uint64_t a0 asm ("a0") = arg0;
    register uint64_t a1 asm ("a1") = arg1;
    register uint64_t a2 asm ("a2") = arg2;
    register uint64_t a3 asm ("a3") = arg3;
    register uint64_t a4 asm ("a4") = arg4;
    register uint64_t a5 asm ("a5") = arg5;
    register uint64_t a6 asm ("a6") = fid;
    register uint64_t a7 asm ("a7") = ext;
    
    asm volatile ("ecall"
                  : "+r" (a0), "+r" (a1)
                  : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
                  : "memory");
    
    ret.error = a0;
    ret.value = a1;
    
    return ret;
}

/**
 * 设置时钟中断
 */
void sbi_set_timer(uint64_t stime_value) {
    sbi_ecall(SBI_SET_TIMER, 0, stime_value, 0, 0, 0, 0, 0);
}

/**
 * 获取当前时间
 */
uint64_t get_time(void) {
    uint64_t time;
    asm volatile("rdtime %0" : "=r" (time));
    return time;
}

/**
 * 控制台输出字符
 */
void sbi_console_putchar(int ch) {
    sbi_ecall(SBI_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
}

/**
 * 控制台输入字符
 */
int sbi_console_getchar(void) {
    struct sbiret ret = sbi_ecall(SBI_CONSOLE_GETCHAR, 0, 0, 0, 0, 0, 0, 0);
    if (ret.error)
        return -1;
    return ret.value;
}

/**
 * 系统关机
 */
void sbi_shutdown(void) {
    sbi_ecall(SBI_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
    while (1);
}

/**
 * 发送处理器间中断
 */
void sbi_send_ipi(const unsigned long *hart_mask) {
    sbi_ecall(SBI_SEND_IPI, 0, (uint64_t)hart_mask, 0, 0, 0, 0, 0);
}

/**
 * 清除处理器间中断
 */
void sbi_clear_ipi(void) {
    sbi_ecall(SBI_CLEAR_IPI, 0, 0, 0, 0, 0, 0, 0);
}

/**
 * 远程指令缓存同步
 */
void sbi_remote_fence_i(const unsigned long *hart_mask) {
    sbi_ecall(SBI_REMOTE_FENCE_I, 0, (uint64_t)hart_mask, 0, 0, 0, 0, 0);
}

/**
 * 远程 SFENCE.VMA
 */
void sbi_remote_sfence_vma(const unsigned long *hart_mask,
                          unsigned long start, unsigned long size) {
    sbi_ecall(SBI_REMOTE_SFENCE_VMA, 0, (uint64_t)hart_mask, start, size, 0, 0, 0);
}
