#include "defs.h"
#include "memlayout.h"

/// @brief etext 在 kernel.ld 中定义，表示内核代码段结束位置
extern char etext[];
extern char trampoline[];

/// @brief kernel_pgtbl 是内核的根页表
pgtbl_addr_t kernel_pgtbl;

int pagetbl_cnt = 0;

/// @brief 遍历页表 pg_tbl，找到虚拟地址 va 对应的页表项
/// @brief 如果中间的页表不存在且 alloc 非 0，则分配新的页表
/// @param pgtbl 出发页表
/// @param va 要查找页表项的虚拟地址
/// @param alloc 是否允许分配新的页表
/// @return 找到的页表项指针，失败则返回 0
pgtbl_entry_t* walk( pgtbl_addr_t pgtbl, addr_t va, int alloc ) {
    if ( va >= ( addr_t ) MAXVA ) {
        // 虚拟地址超过最大值，非法
        panic( "walk" );
    }

    //printf( "walk va %x, alloc: %d\n", va, alloc );

    // 最多遍历两级页表
    for ( int level = 2; level > 0; level-- ) {
        //printf( "walk level %d, pgtbl addr: %x\n", level, pgtbl );

        pgtbl_entry_t* p_pte = &pgtbl[PX( level, va )];

        //printf( "PTE addr: %x\n", p_pte );

        if ( *p_pte & PTE_V ) {
            // printf( "walk pte valid: %x, va: %x, level: %d, pte2pa: %x\n",
            //     *p_pte, va, level, PTE2PA( *p_pte ) );

            // PTE_V 位为 1，表示该页表项有效，继续向下查找
            pgtbl = ( pgtbl_addr_t ) PTE2PA( *p_pte );

            continue;
        }

        //printf( "PTE value invalid: %x\n", *p_pte );

        // PTE_V 位为 0，表示该页表项无效，尝试分配
        if ( ( alloc == 0 ) || ( pgtbl = ( pgtbl_addr_t ) alloc_page() ) == 0 ) {
            // when alloc==0 it's normal to encounter missing intermediate
            // page table entries; suppress noisy logging in that case.
            // printf( "walk alloc failed for alloc: %d, pgtbl: %x, level: %d\n",
            //     alloc, pgtbl, level );

            // 不允许分配新页表，或者分配失败，返回 0
            return 0;
        }

        // printf( "walk alloc new pgtbl at: %x, level: %d, page_cnt = %d\n",
        //     pgtbl, level, ++pagetbl_cnt );

        // 分配到的新页表的内存必须清零
        mem_set( pgtbl, 0, PAGE_SIZE );

        // 将新分配的页内存的物理地址写入该页表项，并设置 PTE_V 位为 1
        *p_pte = ( PA2PTE( pgtbl ) | PTE_V );
    }

    return &pgtbl[PX( 0, va )];
}

u64 walkaddr( pgtbl_addr_t pagetable, u64 va ) {
    // printf( "walkaddr va %x\n", va );

    pgtbl_entry_t* pte;
    u64 pa;

    if ( va >= MAXVA )
        return 0;

    pte = walk( pagetable, va, 0 );

    if ( pte == 0 )
        return 0;

    if ( ( *pte & PTE_V ) == 0 )
        return 0;

    if ( ( *pte & PTE_U ) == 0 )
        return 0;

    pa = PTE2PA( *pte );

    return pa;
}

/// @brief 将 va 地址开始的 size 大小的虚拟地址映射到物理地址 pa 开始 size 大小的内存上
/// @param pgtbl 要记录的基础页表（应该是根页表）
/// @param va 虚拟空间的起始地址
/// @param size 要映射的大小
/// @param pa 物理空间的起始地址
/// @param perm 页表项的权限
/// @return 错误码，0 表示成功，-1 表示失败
int map_pages( pgtbl_addr_t pgtbl, addr_t va, u64 size, addr_t pa, int perm ) {
    if ( ( ( u64 ) va % PAGE_SIZE ) != 0 ) {
        // va 必须是页对齐的
        panic( "mappages: va not aligned" );
    }

    if ( size == 0 ) {
        // 映射大小不能为 0
        panic( "mappages: size is 0" );
    }

    if ( ( ( u64 ) size % PAGE_SIZE ) != 0 ) {
        // size 必须是页对齐的
        panic( "mappages: size not aligned" );
    }

    //printf( "map_pages va %x, size %d, pa %x, perm %x\n", va, size, pa, perm );

    addr_t curr_va = va;
    addr_t last_va = va + size - PAGE_SIZE;
    addr_t curr_pa = pa;

    //printf( "map_pages loop variables: curr_va %x, last_va %x, curr_pa %x\n", curr_va, last_va, curr_pa );

    pgtbl_entry_t* p_new_pte;

    // 对给定的范围中的每一页都进行映射
    // 本质上是在页表中找到一个地方，放置一个 va -> pa 的映射
    // 使用 do while，表示至少进行一次映射
    do {
        //printf( "map_pages loop for curr_va %x, curr_pa %x\n", curr_va, curr_pa );

        // 在指定页表上进行遍历，尝试分配一个新的 PTE
        if ( ( p_new_pte = walk( pgtbl, curr_va, 1 ) ) == 0 ) {
            //printf( "map_pages: walk failed for va %x\n", curr_va );

            return -1;
        }

        if ( *p_new_pte & PTE_V ) {
            // 映射到了已占用的 page，panic
            panic( "mappages: remap" );
        }

        // printf( "newly mapped va %x\n", curr_va );

        // 将物理地址 pa 和权限 perm 写入该页表项，并设置 PTE_V 位为 1
        *p_new_pte = PA2PTE( curr_pa ) | perm | PTE_V;

        if ( curr_va == last_va ) {
            break;
        }

        curr_va += PAGE_SIZE;
        curr_pa += PAGE_SIZE;

    } while ( 1 );

    return 0;
}

/// @brief 激活当前 hart 的内核页表
void kvm_init_hart( void ) {
    // 使用屏障指令确保页表修改生效，理论上在单核情况下不需要
    sfence_vma();

    write_satp( MAKE_SATP( kernel_pgtbl ) );

    sfence_vma();
}

/// @brief 将内核的虚拟地址 va 映射到物理地址 pa 上，大小为 size，权限为 perm
/// @param pgtbl 根页表
/// @param va 虚拟地址
/// @param pa 物理地址
/// @param size 映射大小
/// @param perm 权限
void kvm_map( pgtbl_addr_t pgtbl, addr_t va, addr_t pa, u64 size, int perm ) {
    if ( map_pages( pgtbl, va, size, pa, perm ) != 0 ) {
        panic( "kvm_map" );
    }
}

pgtbl_addr_t kvm_make( void ) {
    // 为根页表分配一个物理页
    pgtbl_addr_t kpgtbl = ( pgtbl_addr_t ) alloc_page();

    mem_set( kpgtbl, 0, PAGE_SIZE );

    // 为每个进程在内核页表中映射内核栈
    extern void proc_map_stack( pgtbl_addr_t kpgtbl );
    proc_map_stack( kpgtbl );

    // 初始化 UART，可读写
    kvm_map(
        kpgtbl, ( addr_t ) UART0, ( addr_t ) UART0,
        PAGE_SIZE,
        PTE_R | PTE_W
    );

    // map virtio mmio region for disk driver
    kvm_map(
        kpgtbl, ( addr_t ) VIRTIO0, ( addr_t ) VIRTIO0,
        PAGE_SIZE,
        PTE_R | PTE_W
    );

    //printf( "UART mapped.\n" );

    // 初始化 kernel text 段，只读、可执行
    kvm_map(
        kpgtbl, ( addr_t ) KERNBASE, ( addr_t ) KERNBASE,
        ( u64 ) etext - KERNBASE,
        PTE_R | PTE_X
    );

    // 将 trampoline 代码映射到高地址 TRAMPOLINE，方便在内核页表下也能调用
    kvm_map(
        kpgtbl, ( addr_t ) TRAMPOLINE, ( addr_t ) trampoline,
        PAGE_SIZE,
        PTE_R | PTE_X
    );

    //printf( "Kernel text mapped.\n" );

    // 初始化 kernel data 段，可读写
    // NOTICE: 恒等映射 PHTSTOP - etext，则物理内存不够
    // 因此，修改 kmem_init 使其匹配虚拟内存的大小
    kvm_map(
        kpgtbl, ( addr_t ) etext, ( addr_t ) etext,
        PHYSTOP - ( u64 ) etext,
        PTE_R | PTE_W
    );

    //printf( "Kernel data mapped.\n" );

    return kpgtbl;
}

void kvm_init( void ) {
    kernel_pgtbl = kvm_make();

    kvm_init_hart();
}

/// @brief 创建用户空间下的新根页表
/// @param  
/// @return 如果分配失败，返回 0
pgtbl_addr_t uvm_make( void ) {
    pgtbl_addr_t upgtbl = ( pgtbl_addr_t ) alloc_page();

    if ( upgtbl == 0 ) {
        return 0;
    }

    mem_set( upgtbl, 0, PAGE_SIZE );

    return upgtbl;
}

/// @brief 释放用户空间下的虚拟地址映射
/// @param pgtbl 
/// @param va 
/// @param page_num 
/// @param do_free 
void uvm_unmap( pgtbl_addr_t pgtbl, addr_t va, u64 page_num, int do_free ) {
    addr_t a;
    pgtbl_entry_t* pte;

    if ( ( ( u64 ) va % PAGE_SIZE ) != 0 )
        panic( "uvmunmap: not aligned" );

    for ( a = va; a < va + page_num * PAGE_SIZE; a += PAGE_SIZE ) {
        // 跳过未映射的页
        if ( ( pte = walk( pgtbl, a, 0 ) ) == 0 )
            continue;

        // 跳过无效的页表项
        if ( ( *pte & PTE_V ) == 0 )
            continue;

        // 最后释放物理内存，并清空页表项
        if ( do_free ) {
            addr_t pa = PTE2PA( *pte );
            free_page( pa );
        }

        *pte = 0;
    }
}

void free_walk( pgtbl_addr_t pagetable ) {
    // 总共会有 2^9 = 512 个 PTE
    for ( int i = 0; i < 512; i++ ) {
        pgtbl_entry_t pte = pagetable[i];

        if ( ( pte & PTE_V ) && ( pte & ( PTE_R | PTE_W | PTE_X ) ) == 0 ) {
            // 该 PTE 有效，且不是叶子节点，递归释放下一级页表
            u64 child = PTE2PA( pte );

            free_walk( ( pgtbl_addr_t ) child );

            // FIXME: 这里是否需要？
            // free_page( ( addr_t ) child );

            pagetable[i] = 0;

            continue;
        }

        // FIXME: 这里是否应该越俎代庖释放 leaft 节点？
        if ( pte & PTE_V ) {
            // 该 PTE 是叶子节点，释放其对应的物理页并清空该 PTE
            addr_t pa = PTE2PA( pte );
            free_page( pa );
            pagetable[i] = 0;
            continue;
        }
    }

    free_page( ( addr_t ) pagetable );
}

/// @brief 释放用户空间下的页表，先取消映射，再释放页表本身的物理内存
/// @param pgtbl 
/// @param size 
void uvm_free( pgtbl_addr_t pgtbl, u64 size ) {
    if ( size > 0 ) {
        uvm_unmap(
            pgtbl, 0,
            PAGE_ROUNDUP( size ) / PAGE_SIZE, 1
        );
    }

    free_walk( pgtbl );
}

// addr_t mem_move( void* dst, const void* src, u64 n ) {
//     const char* s;
//     char* d;

//     if ( n == 0 )
//         return dst;

//     s = src;
//     d = dst;
//     if ( s < d && s + n > d ) {
//         s += n;
//         d += n;
//         while ( n-- > 0 )
//             *--d = *--s;
//     } else
//         while ( n-- > 0 )
//             *d++ = *s++;

//     return dst;
// }

/// @brief 将整个页表的内容进行复制
/// @param old 
/// @param  
/// @param sz 
/// @return 
int uvm_copy( pgtbl_addr_t old, pgtbl_addr_t new, u64 size ) {
    pgtbl_entry_t* p_pte;
    addr_t pa, va;
    u64 flags;
    char* tmp;

    for ( va = 0; ( u64 ) va < size; va += PAGE_SIZE ) {
        if ( ( p_pte = walk( old, va, 0 ) ) == 0 ) {
            // 无效页表项
            continue;
        }

        if ( ( *p_pte & PTE_V ) == 0 ) {
            // 物理页未分配
            continue;
        }

        pa = PTE2PA( *p_pte );
        flags = PTE_FLAGS( *p_pte );

        if ( ( tmp = alloc_page() ) == 0 ) {
            // 如果无法为 new 分配一块暂时使用内存，则直接返回 -1
            uvm_unmap( new, 0, ( u64 ) va / PAGE_SIZE, 1 );
            return -1;
        }

        mem_move( tmp, ( char* ) pa, PAGE_SIZE );

        if ( map_pages( new, va, PAGE_SIZE, tmp, flags ) != 0 ) {
            // 如果无法完成映射，同样
            free_page( tmp );
            uvm_unmap( new, 0, ( u64 ) va / PAGE_SIZE, 1 );

            return -1;
        }
        // 调试：记录复制的虚拟地址与权限（使用 %x，因为内核 printf 不支持 %lx）
        // debug: verbose uvm copy logging suppressed
        // printf( "uvm_copy: copied va=0x%x -> pa=0x%x, flags=0x%x\n", va, tmp, ( unsigned ) flags );
    }
    return 0;
}

// 递归遍历一个源页表，并将所有用户空间的叶子映射复制到目标页表中。
// 该实现以枚举页表项（PTE）的方式进行，而不是线性扫描虚拟地址范围，
// 因此对稀疏映射更为容忍。
static int uvm_copy_walk( pgtbl_addr_t src, pgtbl_addr_t dst, int level, u64 base_va ) {
    for ( int i = 0; i < 512; i++ ) {
        pgtbl_entry_t pte = src[i];

        if ( ( pte & PTE_V ) == 0 )
            continue;

        u64 shift = 12 + 9 * level;
        u64 va = base_va | ( ( u64 ) i << shift );

        // 如果该 PTE 是内部节点（无 R/W/X 标志），则递归进入下一层页表。
        if ( ( pte & ( PTE_R | PTE_W | PTE_X ) ) == 0 ) {
            // child page table physical address
            pgtbl_addr_t child = ( pgtbl_addr_t ) PTE2PA( pte );

            if ( level == 0 ) {
                // shouldn't happen: level 0 with non-leaf pte
                continue;
            }

            if ( uvm_copy_walk( child, dst, level - 1, va ) != 0 )
                return -1;

            continue;
        }

        // 叶子映射：可能是超页（level > 0）。
        u64 map_size = 1UL << shift;
        u64 flags = PTE_FLAGS( pte );
        addr_t pa_base = PTE2PA( pte );

        // 对于该（可能较大的）映射内的每一页：分配新的物理页，复制内容，
        // 并使用 map_pages 映射到目标页表中。
        for ( u64 off = 0; off < map_size; off += PAGE_SIZE ) {
            addr_t src_pa = pa_base + off;
            addr_t tmp = alloc_page();
            if ( tmp == 0 ) {
                // on failure, unmap what we might have mapped so far
                uvm_unmap( dst, 0, ( u64 ) va / PAGE_SIZE, 1 );
                return -1;
            }

            mem_move( ( char* ) tmp, ( char* ) src_pa, PAGE_SIZE );

            // 如果目标页表已经为该页存在映射，则跳过重新映射。
            pgtbl_entry_t* dst_pte = walk( dst, ( addr_t ) ( va + off ), 0 );
            if ( dst_pte && ( *dst_pte & PTE_V ) ) {
                // destination already mapped; drop our temp page and continue
                free_page( tmp );
                continue;
            }

            if ( map_pages( dst, ( addr_t ) ( va + off ), PAGE_SIZE, tmp, ( int ) flags ) != 0 ) {
                free_page( tmp );
                uvm_unmap( dst, 0, ( u64 ) va / PAGE_SIZE, 1 );
                return -1;
            }
        }
    }

    return 0;
}

// Public helper: copy all user mappings from src page-table into dst.
int uvm_copy_entire( pgtbl_addr_t src, pgtbl_addr_t dst ) {
    if ( src == 0 || dst == 0 )
        return -1;

    // start from level 2 (top-level) with base VA 0
    return uvm_copy_walk( src, dst, 2, 0 );
}

int is_mapped( pgtbl_addr_t pgtbl, addr_t va ) {
    pgtbl_entry_t* pte = walk( pgtbl, va, 0 );

    if ( pte == 0 ) {
        return 0;
    }

    if ( *pte & PTE_V ) {
        return 1;
    }

    return 0;
}

u64 vm_fault( pgtbl_addr_t pgtbl, u64 va, int read ) {
    addr_t mem;

    extern struct Process* curr_proc;

    struct Process* p = curr_proc;

    // 确保可以在栈区域内分配
    if ( va >= MAXVA )
        return 0;

    va = PAGE_ROUNDDOWN( va );

    if ( is_mapped( pgtbl, va ) ) {
        return 0;
    }

    mem = alloc_page();

    if ( mem == 0 )
        return 0;

    mem_set( ( void* ) mem, 0, PAGE_SIZE );

    if ( map_pages( p->page_table, va, PAGE_SIZE, mem, PTE_W | PTE_U | PTE_R ) != 0 ) {
        free_page( mem );

        return 0;
    }

    return mem;
}

int copy_k2u( pgtbl_addr_t upgtbl, addr_t udst, addr_t ksrc, u64 len ) {
    u64 n;
    addr_t va0, pa0;
    pgtbl_entry_t* pte;

    while ( len > 0 ) {
        va0 = PAGE_ROUNDDOWN( ( u64 ) udst );

        if ( va0 >= MAXVA )
            return -1;

        pa0 = walkaddr( upgtbl, va0 );

        if ( pa0 == 0 ) {
            if ( ( pa0 = vm_fault( upgtbl, va0, 0 ) ) == 0 ) {
                return -1;
            }
        }

        pte = walk( upgtbl, va0, 0 );

        if ( ( *pte & PTE_W ) == 0 )
            return -1;

        n = PAGE_SIZE - ( udst - va0 );

        if ( n > len )
            n = len;

        mem_move( ( void* ) ( pa0 + ( udst - va0 ) ), ksrc, n );

        *( ( u64* ) &len ) -= n;
        *( ( u64* ) &ksrc ) += n;

        udst = va0 + PAGE_SIZE;
    }

    return 0;
}

int copy_u2k( pgtbl_addr_t upgtbl, addr_t kdst, addr_t usrc, u64 len ) {
    u64 n;
    u64 va0, pa0;

    while ( len > 0 ) {
        va0 = PAGE_ROUNDDOWN( ( u64 ) usrc );

        if ( va0 >= MAXVA )
            return -1;

        // try to translate user VA to physical
        pa0 = walkaddr( upgtbl, va0 );

        if ( pa0 == 0 ) {
            // page not present, try to fault it in
            pa0 = vm_fault( upgtbl, va0, 0 );
            if ( pa0 == 0 )
                return -1;
        }

        n = PAGE_SIZE - ( ( u64 ) usrc - va0 );

        if ( n > len )
            n = len;

        mem_move( ( void* ) kdst, ( void* ) ( ( u64 ) pa0 + ( ( u64 ) usrc - va0 ) ), n );

        len -= n;
        kdst = ( addr_t ) ( ( u64 ) kdst + n );
        usrc = ( addr_t ) ( va0 + PAGE_SIZE );
    }

    return 0;
}
