#include <stdint.h>
#include "uart.h"

// 页表项相关定义
typedef uint64_t pte_t;
typedef uint64_t* pagetable_t;

// RISC-V SV39页表项权限位
#define PTE_V (1L << 0)  // 有效位
#define PTE_R (1L << 1)  // 读权限
#define PTE_W (1L << 2)  // 写权限
#define PTE_X (1L << 3)  // 执行权限
#define PTE_U (1L << 4)  // 用户权限
#define PTE_G (1L << 5)  // 全局位
#define PTE_A (1L << 6)  // 访问位
#define PTE_D (1L << 7)  // 脏位

// 页表相关常量
#define PAGE_SIZE 4096
#define PTE_SIZE sizeof(pte_t)
#define PT_ENTRIES 512  // 每级页表512个条目
#define PTE_PER_PAGE (PAGE_SIZE / PTE_SIZE)

// 虚拟地址相关宏定义
#define PXMASK 0x1FF  // 9位索引掩码
#define PXSHIFT(level) (12 + 9 * (level))  // 第level级页表索引偏移量
#define PX(level, va) ((((uint64_t)(va)) >> PXSHIFT(level)) & PXMASK)  // 提取第level级页表索引

// 虚拟地址各部分宏定义
#define VPN0(va) PX(0, va)  // 页内偏移索引
#define VPN1(va) PX(1, va)  // 二级页表索引
#define VPN2(va) PX(2, va)  // 一级页表索引

#define PTE2PA(pte) (((pte) >> 10) << 12)  // 页表项到物理地址
#define PA2PTE(pa) (((pa) >> 12) << 10)    // 物理地址到页表项

// 虚拟地址和物理地址对齐检查
#define PGROUNDUP(sz) (((sz) + PAGE_SIZE - 1) & ~(PAGE_SIZE - 1))
#define PGROUNDDOWN(a) (((a)) & ~(PAGE_SIZE - 1))

// 内核内存布局相关定义
#define KERNBASE 0x80000000L           // 内核基地址
#define UART0 0x10000000L              // UART设备地址
#define PHYSTOP 0x88000000L            // 物理内存结束地址

// SATP寄存器相关定义
#define SATP_MODE_SV39 (8L << 60)      // SV39模式

// 声明物理内存分配函数
void* alloc_page(void);
void free_page(void* page);

// 内核页表
pagetable_t kernel_pagetable;

// 函数声明
pagetable_t create_pagetable(void);
int map_page(pagetable_t pt, uint64_t va, uint64_t pa, int perm);
int map_region(pagetable_t pagetable, uint64_t va, uint64_t pa, uint64_t size, int perm);
void destroy_pagetable(pagetable_t pt);
void kvminit(void);
void kvminithart(void);
void dump_pagetable(pagetable_t pt, int level);

// 页表遍历函数（内部使用）
static pte_t* walk_create(pagetable_t pagetable, uint64_t va);
static pte_t* walk_lookup(pagetable_t pagetable, uint64_t va);

// 创建页表
pagetable_t create_pagetable(void) {
    pagetable_t pagetable = (pagetable_t)alloc_page();
    if (pagetable == 0) {
        return 0;
    }
    
    // 初始化页表内容为0
    for (int i = 0; i < PTE_PER_PAGE; i++) {
        pagetable[i] = 0;
    }
    
    return pagetable;
}

// 映射内存区域
int map_region(pagetable_t pagetable, uint64_t va, uint64_t pa, uint64_t size, int perm) {
    uint64_t end = PGROUNDUP(va + size);
    
    for (uint64_t a = va; a < end; a += PAGE_SIZE, pa += PAGE_SIZE) {
        if (map_page(pagetable, a, pa, perm) != 0) {
            return -1;
        }
    }
    
    return 0;
}

// 映射虚拟地址到物理地址
int map_page(pagetable_t pt, uint64_t va, uint64_t pa, int perm) {
    // 检查地址是否按页对齐
    if ((va % PAGE_SIZE) != 0 || (pa % PAGE_SIZE) != 0) {
        return -1; // 地址未对齐
    }
    
    // 获取页表项地址
    pte_t* pte = walk_create(pt, va);
    if (pte == 0) {
        return -1; // 无法创建页表项
    }
    
    // 检查是否已经映射
    if ((*pte & PTE_V) != 0) {
        return -1; // 已经映射
    }
    
    // 设置页表项
    *pte = PA2PTE(pa) | perm | PTE_V;
    return 0;
}

// 销毁页表
void destroy_pagetable(pagetable_t pt) {
    // 遍历一级页表
    for (int i = 0; i < PT_ENTRIES; i++) {
        if ((pt[i] & PTE_V) && (pt[i] & (PTE_R | PTE_W | PTE_X)) == 0) {
            // 有效的非叶节点（指向下一级页表）
            uint64_t pa = PTE2PA(pt[i]);
            pte_t* next_pt = (pte_t*)pa;
            
            // 递归销毁下一级页表
            destroy_pagetable(next_pt);
        }
    }
    
    // 释放当前页表占用的物理页
    free_page((void*)pt);
}

// 页表遍历函数 - 查找或创建页表项
static pte_t* walk_create(pagetable_t pagetable, uint64_t va) {
    // 从一级页表开始遍历
    for (int level = 2; level > 0; level--) {
        // 获取当前级页表索引
        uint64_t index = PX(level, va);
        pte_t* pte = &pagetable[index];
        
        // 检查页表项是否有效
        if (*pte & PTE_V) {
            // 有效页表项，检查是否为叶节点
            if ((*pte & (PTE_R | PTE_W | PTE_X)) != 0) {
                // 叶节点，但不是我们想要的级别
                return 0;
            }
            // 继续下一级页表
            pagetable = (pagetable_t)PTE2PA(*pte);
        } else {
            // 无效页表项，需要创建新的页表
            pagetable_t new_pt = (pagetable_t)alloc_page();
            if (new_pt == 0) {
                return 0; // 内存不足
            }
            
            // 初始化新页表
            for (int i = 0; i < PTE_PER_PAGE; i++) {
                new_pt[i] = 0;
            }
            
            // 更新当前页表项指向新页表
            *pte = PA2PTE((uint64_t)new_pt) | PTE_V;
            pagetable = new_pt;
        }
    }
    
    // 返回二级页表中的页表项
    return &pagetable[PX(0, va)];
}

// 页表遍历函数 - 仅查找页表项
static pte_t* walk_lookup(pagetable_t pagetable, uint64_t va) {
    // 从一级页表开始遍历
    for (int level = 2; level > 0; level--) {
        // 获取当前级页表索引
        uint64_t index = PX(level, va);
        pte_t* pte = &pagetable[index];
        
        // 检查页表项是否有效
        if (*pte & PTE_V) {
            // 有效页表项，检查是否为叶节点
            if ((*pte & (PTE_R | PTE_W | PTE_X)) != 0) {
                // 叶节点
                return (level == 0) ? pte : 0;
            }
            // 继续下一级页表
            pagetable = (pagetable_t)PTE2PA(*pte);
        } else {
            // 无效页表项
            return 0;
        }
    }
    
    // 返回二级页表中的页表项
    return &pagetable[PX(0, va)];
}

// 初始化内核页表
void kvminit(void) {
    // 创建内核页表
    kernel_pagetable = create_pagetable();
    if (kernel_pagetable == 0) {
        return;
    }
    
    // 获取链接脚本中定义的符号
    extern char text_start[], text_end[], rodata_start[], rodata_end[], data_start[], data_end[], bss_start[], bss_end[], end[];
    
    // 映射内核代码段（R+X权限）
    map_region(kernel_pagetable, (uint64_t)text_start, (uint64_t)text_start, 
               (uint64_t)text_end - (uint64_t)text_start, PTE_R | PTE_X);
    
    // 映射内核只读数据段（R权限）
    map_region(kernel_pagetable, (uint64_t)rodata_start, (uint64_t)rodata_start,
               (uint64_t)rodata_end - (uint64_t)rodata_start, PTE_R);
    
    // 映射内核数据段（R+W权限）
    map_region(kernel_pagetable, (uint64_t)data_start, (uint64_t)data_start,
               (uint64_t)data_end - (uint64_t)data_start, PTE_R | PTE_W);
    
    // 映射内核BSS段和堆（R+W权限）
    map_region(kernel_pagetable, (uint64_t)bss_start, (uint64_t)bss_start,
               (uint64_t)PHYSTOP - (uint64_t)bss_start, PTE_R | PTE_W);
    
    // 映射设备内存（UART等）（R+W权限）
    map_region(kernel_pagetable, UART0, UART0, PAGE_SIZE, PTE_R | PTE_W);
}

// 写入satp寄存器的内联汇编函数
static inline void w_satp(uint64_t x) {
    asm volatile("csrw satp, %0" : : "r" (x));
}

// sfence.vma指令的内联汇编函数
static inline void sfence_vma() {
    asm volatile("sfence.vma zero, zero");
}

// 激活内核页表
void kvminithart(void) {
    // 构造SATP寄存器值（SV39模式 + 页表基地址）
    uint64_t satp = SATP_MODE_SV39 | (((uint64_t)kernel_pagetable) >> 12);
    
    // 写入satp寄存器
    w_satp(satp);
    
    // 刷新TLB
    sfence_vma();
}

// 递归打印页表内容用于调试
void dump_pagetable(pagetable_t pt, int level) {
    // 打印缩进
    for (int i = 0; i < level; i++) {
        uart_putc(' ');
    }
    
    uart_puts("Page table level ");
    // 手动打印level数字
    if (level >= 10) {
        uart_putc('0' + (level / 10));
        uart_putc('0' + (level % 10));
    } else {
        uart_putc('0' + level);
    }
    uart_puts(":\n");
    
    // 遍历页表项
    for (int i = 0; i < PT_ENTRIES; i++) {
        if (pt[i] & PTE_V) {
            // 打印缩进
            for (int j = 0; j < level + 1; j++) {
                uart_putc(' ');
            }
            
            // 打印索引
            uart_puts("Index ");
            // 手动打印索引
            if (i >= 100) {
                uart_putc('0' + (i / 100));
                uart_putc('0' + ((i % 100) / 10));
                uart_putc('0' + (i % 10));
            } else if (i >= 10) {
                uart_putc('0' + (i / 10));
                uart_putc('0' + (i % 10));
            } else {
                uart_putc('0' + i);
            }
            
            uart_puts(": ");
            
            // 检查是否为叶节点
            if (pt[i] & (PTE_R | PTE_W | PTE_X)) {
                // 叶节点，打印物理地址和权限
                uint64_t pa = PTE2PA(pt[i]);
                uart_puts("PA=0x");
                // 简化打印物理地址（只打印高20位）
                uint64_t pa_high = pa >> 12;
                // 手动将数字转换为十六进制字符串
                int shift = 60;
                int started = 0;
                while (shift >= 0) {
                    int digit = (pa_high >> shift) & 0xF;
                    if (digit != 0 || started || shift == 0) {
                        started = 1;
                        uart_putc(digit < 10 ? '0' + digit : 'A' + digit - 10);
                    }
                    shift -= 4;
                }
                
                uart_puts(", perm=");
                if (pt[i] & PTE_R) uart_putc('R');
                if (pt[i] & PTE_W) uart_putc('W');
                if (pt[i] & PTE_X) uart_putc('X');
                if (pt[i] & PTE_U) uart_putc('U');
                uart_putc('\n');
            } else {
                // 非叶节点，递归打印下一级页表
                uart_puts("next level\n");
                pagetable_t next_pt = (pagetable_t)PTE2PA(pt[i]);
                dump_pagetable(next_pt, level + 1);
            }
        }
    }
}