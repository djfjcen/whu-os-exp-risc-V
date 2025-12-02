#ifndef _MEMLAYOUT_H_
#define _MEMLAYOUT_H_

// 物理内存布局
//
// 在 qemu 的 -machine virt 模式下，物理地址空间通常组织如下（参考 qemu 的 hw/riscv/virt.c）：
//
// 00001000 -- 引导 ROM（由 qemu 提供）
// 02000000 -- CLINT（定时器/软件中断）
// 0C000000 -- PLIC（外部中断控制器）
// 10000000 -- UART0 寄存器
// 10001000 -- virtio 磁盘设备
// 80000000 -- qemu 的引导程序将内核加载到该物理地址并跳转到这里
// 此地址之后是可用的 RAM
//
// 内核使用物理内存的方式如下：
// 80000000 -- 放置 entry.S、内核文本段和数据段
// end         -- 内核页分配区的起始（由链接器定义）
// PHYSTOP     -- 内核可使用的物理内存结束位置
//
// qemu 将 UART 寄存器映射在上面的物理地址位置。
#define UART0 0x10000000L
#define UART0_IRQ 10
#define VIRTIO0 0x10001000L
#define VIRTIO0_IRQ 1

// the kernel expects there to be RAM
// for use by the kernel and user pages
// from physical address 0x80000000 to PHYSTOP.
#define KERNBASE 0x80000000L
#define PHYSTOP (KERNBASE + 256*1024*1024)

// map the trampoline page to the highest address,
// in both user and kernel space.
#define TRAMPOLINE (MAXVA - PAGE_SIZE)

// map kernel stacks beneath the trampoline,
// each surrounded by invalid guard pages.
#define KSTACK(p) (TRAMPOLINE - ( (p) + 1 ) * 2 * PAGE_SIZE)

#define TRAPFRAME (TRAMPOLINE - PAGE_SIZE)

// 用户栈布局：保留固定大小的用户栈于 trampoline 之下，
// 使内核能在高地址为每个进程分配栈和 trapframe。
#define USER_STACK_SIZE (2 * PAGE_SIZE)
#define USER_STACK_TOP (TRAMPOLINE - 2 * PAGE_SIZE)
#define USER_STACK_BASE (USER_STACK_TOP - USER_STACK_SIZE)

#endif // !_MEMLAYOUT_H_