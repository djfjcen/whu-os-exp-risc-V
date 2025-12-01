#include "defs.h"
#include "memlayout.h"

/// @brief end 在 kernel.ld 中定义，表示内核结束位置
extern char end[];

/// @brief FreeList 指向空闲内存链表一个 entry 的首地址，大小始终为 4KB
struct FreePage {
    struct FreePage* next;
};

/// @brief FreeList 是内存分配器的元数据，包含一个空闲内存链表的头指针
struct FreeList {
    struct FreePage* head;
};

/// @brief 内存分配器的全局实例
struct FreeList kmem;

addr_t mem_set( addr_t dst, char c, u64 size ) {
    char* cdst = ( char* ) dst;

    for ( int i = 0; i < size; i++ ) {
        cdst[i] = c;
    }

    return dst;
}

addr_t mem_move( void* dst, const void* src, u64 n ) {
    const char* s;
    char* d;

    if ( n == 0 )
        return dst;

    s = src;
    d = dst;
    
    if ( s < d && s + n > d ) {
        s += n;
        d += n;
        while ( n-- > 0 )
            *--d = *--s;
    } else {
        while ( n-- > 0 )
            *d++ = *s++;
    }

    return dst;
}

/// @brief free_page 将一页物理内存（以 pa 起始的 PAGE_SIZE 字节）回收到内存分配器中
/// @param pa 物理内存的起始地址
void free_page( addr_t pa ) {
    struct FreePage* b;

    if ( ( ( unsigned long ) pa % PAGE_SIZE ) != 0
        || ( char* ) pa < end ) {
        // 地址不是页对齐，或者地址小于内核结束位置
        // 则是非法地址，则直接 panic
        panic( "free_page" );
    }

    // 将该页内存填充为 1，以帮助检测野指针
    mem_set( pa, 1, PAGE_SIZE );

    // 将该页内存回收到空闲链表中
    // 此处使用头插，所以最晚释放的页最先被重新分配
    // 另外，这里直接略去了多线程的锁控制
    b = ( struct FreePage* ) pa;

    b->next = kmem.head;

    kmem.head = b;
}

/// @brief 将从 pa_start 到 pa_end 范围内的物理内存全部按页回收到内存分配器中
/// @param pa_start 
/// @param pa_end 
void free_range( addr_t pa_start, addr_t pa_end ) {
    char* p;
    p = ( char* ) ( ( ( unsigned long ) pa_start + 0xFFF ) & ~0xFFF );

    for ( ; p + PAGE_SIZE <= ( char* ) pa_end; p += PAGE_SIZE )
        free_page( p );
}

/// @brief kmem_init 初始化内存分配器，回收内核结束位置到物理内存上限的所有内存
/// @brief 只是简单地调用了 free_range
void kmem_init() {
    free_range( end, ( addr_t ) PHYSTOP );
}

/// @brief alloc_page 从空闲链表的表头分配一页内存，返回该页内存的起始地址
/// @return 返回分配的内存页起始地址，失败则返回 NULL
addr_t alloc_page() {
    struct FreePage* b;

    if ( ( b = kmem.head ) == 0 ) {
        printf( "alloc_page: out of memory\n" );

        return 0;
    }

    // 如果还有空闲内存，则为 kmem 后移一个 entry
    kmem.head = b->next;

    // 将该页内存置 5，防止有残留数据和野指针
    mem_set( b, 5, PAGE_SIZE );


    return ( addr_t ) b;
}
