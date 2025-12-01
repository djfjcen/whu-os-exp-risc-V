#include "defs.h"
#include "memlayout.h"
#include "proc.h"
#include "userprog.h"

extern struct Process* curr_proc;

#define USER_TEXT_BASE 0

/// @brief 映射用户程序代码段到页表中
/// @param pagetable 用户页表
/// @param image 程序二进制镜像
/// @param len 镜像长度
/// @return 成功返回映射的字节数，失败返回 -1
static int map_user_program( pgtbl_addr_t pagetable, const unsigned char* image, u64 len ) {
    if ( len == 0 || image == 0 ) {
        return -1;
    }

    u64 offset = 0;
    addr_t va = USER_TEXT_BASE;
    u64 mapped_pages = 0;

    // 按页映射程序代码
    while ( offset < len ) {
        addr_t mem = alloc_page();

        if ( mem == 0 ) {
            if ( mapped_pages > 0 ) {
                uvm_unmap( pagetable, USER_TEXT_BASE, mapped_pages, 1 );
            }
            return -1;
        }

        mem_set( mem, 0, PAGE_SIZE );

        u64 chunk = len - offset;
        if ( chunk > PAGE_SIZE ) {
            chunk = PAGE_SIZE;
        }

        mem_move( ( void* ) mem, image + offset, chunk );

        // 映射为可读可执行，用户可访问
        if ( map_pages( pagetable, va, PAGE_SIZE, mem, PTE_R | PTE_X | PTE_U ) != 0 ) {
            free_page( mem );
            if ( mapped_pages > 0 ) {
                uvm_unmap( pagetable, USER_TEXT_BASE, mapped_pages, 1 );
            }
            return -1;
        }

        offset += chunk;
        va += PAGE_SIZE;
        mapped_pages++;
    }

    return mapped_pages * PAGE_SIZE;
}

/// @brief 替换当前进程的映像为指定的用户程序
/// @param path 可执行文件路径（当前未使用，保留用于未来扩展）
/// @param argv 参数列表（当前未使用，保留用于未来扩展）
/// @return 成功返回 0，失败返回 -1
int kexec( const char* path, char* const argv[] ) {
    ( void ) path;
    ( void ) argv;

    if ( curr_proc == 0 ) {
        return -1;
    }

    struct Process* p = curr_proc;

    // 分配新的页表（包含 trampoline 和 trapframe 映射）
    pgtbl_addr_t new_pgtbl = alloc_proc_pgtbl( p );
    if ( new_pgtbl == 0 ) {
        return -1;
    }

    // 映射用户程序代码段
    int mapped_size = map_user_program( new_pgtbl, user_main_bin, user_main_bin_len );
    if ( mapped_size < 0 ) {
        free_proc_pgtbl( new_pgtbl, 0 );
        return -1;
    }

    // 分配并映射用户栈（按页逐页分配）。
    addr_t stack_base = USER_STACK_TOP - USER_STACK_SIZE;
    u64 stack_pages = USER_STACK_SIZE / PAGE_SIZE;

    for ( u64 i = 0; i < stack_pages; i++ ) {
        addr_t sp_pa = alloc_page();

        if ( sp_pa == 0 ) {
            // cleanup: 解除已映射的文本页与已映射的栈页
            u64 text_pages = PAGE_ROUNDUP( ( u64 ) user_main_bin_len ) / PAGE_SIZE;
            if ( text_pages > 0 ) {
                uvm_unmap( new_pgtbl, USER_TEXT_BASE, text_pages, 1 );
            }

            if ( i > 0 ) {
                uvm_unmap( new_pgtbl, stack_base, i, 1 );
            }

            free_proc_pgtbl( new_pgtbl, 0 );
            return -1;
        }

        mem_set( sp_pa, 0, PAGE_SIZE );

        if ( map_pages( new_pgtbl, stack_base + i * PAGE_SIZE, PAGE_SIZE, sp_pa, PTE_R | PTE_W | PTE_U ) != 0 ) {
            free_page( sp_pa );

            // cleanup
            u64 text_pages = PAGE_ROUNDUP( ( u64 ) user_main_bin_len ) / PAGE_SIZE;
            if ( text_pages > 0 ) {
                uvm_unmap( new_pgtbl, USER_TEXT_BASE, text_pages, 1 );
            }

            if ( i > 0 ) {
                uvm_unmap( new_pgtbl, stack_base, i, 1 );
            }

            free_proc_pgtbl( new_pgtbl, 0 );
            return -1;
        }
    }

    // 保存旧页表和大小
    pgtbl_addr_t old_pgtbl = p->page_table;
    u64 old_size = p->mem_size;

    // 提交到新的用户映像
    p->page_table = new_pgtbl;
    p->mem_size = PAGE_ROUNDUP( ( u64 ) user_main_bin_len );
    p->trapframe->epc = USER_TEXT_BASE;  // 程序入口点
    p->trapframe->sp = USER_STACK_TOP;   // 栈指针

    // 释放旧页表
    if ( old_pgtbl ) {
        if ( old_size > 0 ) {
            uvm_unmap( old_pgtbl, USER_TEXT_BASE, PAGE_ROUNDUP( old_size ) / PAGE_SIZE, 1 );
        }

        uvm_unmap( old_pgtbl, USER_STACK_TOP - USER_STACK_SIZE, USER_STACK_SIZE / PAGE_SIZE, 1 );

        free_proc_pgtbl( old_pgtbl, old_size );
    }

    return 0;
}