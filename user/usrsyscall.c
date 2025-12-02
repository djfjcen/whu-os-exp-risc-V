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

/// @brief 打开文件
/// @param path 文件路径
/// @param omode 打开模式
/// @return 文件描述符，失败返回 -1
int sys_open( const char* path, int omode ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = path
        "mv a1, %2\n"    // a1 = omode
        "li a7, %3\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( path ), "r"( omode ), "i"( SYS_OPEN )
        : "memory"
        );

    return ret;
}

/// @brief 关闭文件
/// @param fd 文件描述符
/// @return 成功返回 0，失败返回 -1
int sys_close( int fd ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = fd
        "li a7, %2\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( fd ), "i"( SYS_CLOSE )
        : "memory"
        );

    return ret;
}

/// @brief 从文件读取数据
/// @param fd 文件描述符
/// @param buf 缓冲区
/// @param n 读取字节数
/// @return 实际读取的字节数，失败返回 -1
int sys_read( int fd, char* buf, int n ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = fd
        "mv a1, %2\n"    // a1 = buf
        "mv a2, %3\n"    // a2 = n
        "li a7, %4\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( fd ), "r"( buf ), "r"( n ), "i"( SYS_READ )
        : "memory"
        );

    return ret;
}

/// @brief 向文件写入数据
/// @param fd 文件描述符
/// @param buf 缓冲区
/// @param n 写入字节数
/// @return 实际写入的字节数，失败返回 -1
int sys_write( int fd, const char* buf, int n ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = fd
        "mv a1, %2\n"    // a1 = buf
        "mv a2, %3\n"    // a2 = n
        "li a7, %4\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( fd ), "r"( buf ), "r"( n ), "i"( SYS_WRITE )
        : "memory"
        );

    return ret;
}

/// @brief 创建目录
/// @param path 目录路径
/// @return 成功返回 0，失败返回 -1
int sys_mkdir( const char* path ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = path
        "li a7, %2\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( path ), "i"( SYS_MKDIR )
        : "memory"
        );

    return ret;
}

/// @brief 删除文件
/// @param path 文件路径
/// @return 成功返回 0，失败返回 -1
int sys_unlink( const char* path ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = path
        "li a7, %2\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( path ), "i"( SYS_UNLINK )
        : "memory"
        );

    return ret;
}

/// @brief 获取文件状态
/// @param fd 文件描述符
/// @param st stat结构指针
/// @return 成功返回 0，失败返回 -1
int sys_fstat( int fd, struct stat* st ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = fd
        "mv a1, %2\n"    // a1 = st
        "li a7, %3\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( fd ), "r"( st ), "i"( SYS_FSTAT )
        : "memory"
        );

    return ret;
}

/// @brief 复制文件描述符
/// @param fd 文件描述符
/// @return 新的文件描述符，失败返回 -1
int sys_dup( int fd ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = fd
        "li a7, %2\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( fd ), "i"( SYS_DUP )
        : "memory"
        );

    return ret;
}

/// @brief 创建硬链接
/// @param oldpath 原文件路径
/// @param newpath 新链接路径
/// @return 成功返回 0，失败返回 -1
int sys_link( const char* oldpath, const char* newpath ) {
    int ret;

    asm volatile(
        "mv a0, %1\n"    // a0 = oldpath
        "mv a1, %2\n"    // a1 = newpath
        "li a7, %3\n"
        "ecall\n"
        "mv %0, a0"
        : "=r"( ret )
        : "r"( oldpath ), "r"( newpath ), "i"( SYS_LINK )
        : "memory"
        );

    return ret;
}
