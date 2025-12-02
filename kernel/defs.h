#ifndef _DEFS_H_
#define _DEFS_H_

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;

typedef void* addr_t;

/// @brief pgtbl_entry_t 表示页表项
typedef u64 pgtbl_entry_t;
/// @brief pgtbl_addr_t 表示页表的起始地址
typedef pgtbl_entry_t* pgtbl_addr_t;

#define PAGE_SIZE 4096

#define PAGE_ROUNDUP(a)  (((a)+PAGE_SIZE-1) & ~(PAGE_SIZE-1))
#define PAGE_ROUNDDOWN(a) (((a)) & ~(PAGE_SIZE-1))

#define PTE_V (1L << 0) // 有效
#define PTE_R (1L << 1)
#define PTE_W (1L << 2)
#define PTE_X (1L << 3)
#define PTE_U (1L << 4) // 用户可访问

#define PA2PTE(pa) ((((u64)pa) >> 12) << 10)
#define PTE2PA(pte) (((pte) >> 10) << 12)
#define PTE_FLAGS(pte) ((pte) & 0x3FF)
#define PXMASK          0x1FF // 9 位
#define PXSHIFT(level)  (12+(9*(level)))
#define PX(level, va) ((((u64) (va)) >> PXSHIFT(level)) & PXMASK)

#define MAXVA (1L << (9 + 9 + 9 + 12 - 1))

#define SATP_SV39 (8L << 60)
#define MAKE_SATP(pgtbl) (SATP_SV39 | (((u64)pgtbl) >> 12))

#define NPROC 64

// UART 相关函数
void uart_init( void );
void uart_putc( char c );
void uart_puts( char* s );

// 控制台相关函数
void console_putc( char c );

// 打印及异常处理函数
void printf( const char* fmt, ... );
void panic( char* ) __attribute__( ( noreturn ) );

// 内存分配相关函数
addr_t mem_set( addr_t dst, char c, u64 size );
addr_t mem_move( void* dst, const void* src, u64 n );
void kmem_init( void );
addr_t alloc_page();
void free_page( addr_t pa );

// 虚拟内存相关函数
void kvm_init( void );
void kvm_init_hart( void );
void kvm_map( pgtbl_addr_t pgtbl, addr_t va, addr_t pa, u64 size, int perm );
pgtbl_addr_t uvm_make( void );
int map_pages( pgtbl_addr_t pgtbl, addr_t va, u64 size, addr_t pa, int perm );
void uvm_unmap( pgtbl_addr_t pgtbl, addr_t va, u64 page_num, int do_free );
void uvm_free( pgtbl_addr_t pgtbl, u64 size );
int uvm_copy( pgtbl_addr_t old, pgtbl_addr_t new, u64 sz );
int copy_k2u( pgtbl_addr_t upgtbl, addr_t udst, addr_t ksrc, u64 len );
int copy_u2k( pgtbl_addr_t upgtbl, addr_t kdst, addr_t usrc, u64 len );
u64 vm_fault( pgtbl_addr_t pgtbl, u64 va, int read );

// Trap 处理初始化
void trap_init( void );

struct Process;

void process_init( void );
void user_init( void );
void scheduler( void );
int kfork( void );
void kexit( int status );
int kwait( u64* status );
void prepare_return( void );
int is_killed( struct Process* p );
void set_killed( struct Process* p );
int kkill( int pid );
void wakeup( void* chan );
pgtbl_addr_t alloc_proc_pgtbl( struct Process* p );
void free_proc_pgtbl( pgtbl_addr_t pgtb, u64 size );

int kexec( const char* path, char* const argv[] );

// 文件系统相关函数
void fs_init(int dev);
void file_init(void);

#define assert(expr) \
    do { \
        if (!(expr)) { \
            printf("Assertion failed: %s, file %s, line %d\n", \
                   #expr, __FILE__, __LINE__); \
            while (1); \
        } \
    } while (0)

#define NELEM(x) (sizeof(x)/sizeof((x)[0]))

#endif // !_DEFS_H_

#include "riscv.h"
#include "proc.h"
#include "syscall.h"