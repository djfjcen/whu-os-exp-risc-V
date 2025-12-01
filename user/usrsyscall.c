#include "usrsyscall.h"

/// @brief 调用内核生成子进程
/// @return 子进程进程号
int sys_fork() {
    int ret;

    asm volatile(
        "li a7, %1\n"    // a7 = 系统调用号
        "ecall\n"        // 触发异常
        "mv %0, a0"      // 返回值存到ret
        : "=r"( ret )
        : "i"( SYS_FORK )
        : "memory"
        );

    return ret;
}

/// @brief 等待子进程
/// @param status 
/// @return 
int sys_wait( int* status ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = status指针
        "li a7, %2\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( status ), "i"( SYS_WAIT )
        : "memory"
        );

    return ret;
}

/// @brief 退出当前进程
/// @param status 
void sys_exit( int status ) {
    asm volatile(
        "mv a0, %0\n"    // a0 = 退出状态
        "li a7, %1\n"
        "ecall\n"
        : : "r"( status ), "i"( SYS_EXIT )
        : "memory"
        );

    // 不应该返回
    while ( 1 );
}

/// @brief 获取当前线程的 pid
/// @return 
int sys_getpid() {
    int ret;

    asm volatile(
        "li a7, %1\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "i"( SYS_GETPID )
        : "memory"
        );

    return ret;
}

/// @brief 打印字符串
/// @param s 
void sys_print( const char* s ) {
    asm volatile(
        "mv a0, %0\n"
        "li a7, %1\n"
        "ecall\n"
        : : "r"( s ), "i"( SYS_PRINT )
        : "memory"
        );
}

/// @brief 杀死指定 PID 的进程
/// @param pid 要杀死的进程号
/// @return 成功返回 0，失败返回 -1
int sys_kill( int pid ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = pid
        "li a7, %2\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( pid ), "i"( SYS_KILL )
        : "memory"
        );

    return ret;
}