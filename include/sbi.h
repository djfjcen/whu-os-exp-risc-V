/*
 * sbi.h - RISC-V SBI (Supervisor Binary Interface) 接口定义
 */

#ifndef _SBI_H
#define _SBI_H

#include <stdint.h>

// SBI 扩展 ID
#define SBI_EXT_TIMER       0x54494D45  // "TIME"
#define SBI_EXT_IPI         0x735049    // "sPI"
#define SBI_EXT_RFENCE      0x52464E43  // "RFNC"
#define SBI_EXT_HSM         0x48534D    // "HSM"
#define SBI_EXT_SRST        0x53525354  // "SRST"

// 传统 SBI 调用号
#define SBI_SET_TIMER       0
#define SBI_CONSOLE_PUTCHAR 1
#define SBI_CONSOLE_GETCHAR 2
#define SBI_CLEAR_IPI       3
#define SBI_SEND_IPI        4
#define SBI_REMOTE_FENCE_I  5
#define SBI_REMOTE_SFENCE_VMA 6
#define SBI_REMOTE_SFENCE_VMA_ASID 7
#define SBI_SHUTDOWN        8

// SBI 返回结构
struct sbiret {
    long error;
    long value;
};

// SBI 调用接口
struct sbiret sbi_ecall(int ext, int fid, uint64_t arg0, uint64_t arg1,
                        uint64_t arg2, uint64_t arg3, uint64_t arg4, uint64_t arg5);

// 时钟相关 SBI 调用
void sbi_set_timer(uint64_t stime_value);
uint64_t get_time(void);

// 控制台相关 SBI 调用
void sbi_console_putchar(int ch);
int sbi_console_getchar(void);

// 系统控制 SBI 调用
void sbi_shutdown(void);

// IPI 相关 SBI 调用
void sbi_send_ipi(const unsigned long *hart_mask);
void sbi_clear_ipi(void);

// 远程内存屏障相关 SBI 调用
void sbi_remote_fence_i(const unsigned long *hart_mask);
void sbi_remote_sfence_vma(const unsigned long *hart_mask,
                          unsigned long start, unsigned long size);

#endif /* _SBI_H */
