#include "defs.h"
#include "memlayout.h"

/// @brief 定义在 kernelvec.S 中的内核 trap 入口函数
extern void kernelvec();

// /// @brief 启用 trap 处理程序
// void tarp_init_hart() {
//     // 设置内核的 trap 入口地址
//     write_stvec( ( u64 ) kernelvec );
// }

void trap_init() {
    // 设置内核的 trap 入口地址
    write_stvec( ( u64 ) kernelvec );
}

int ticks = 0;

/// @brief 处理时钟中断
void handle_clock_intr() {
    ticks++;

    wakeup( ( void* ) &ticks );

    // 记录下一个时钟中断时间（大约 0.1 秒后？）
    write_stimecmp( read_time() + 1000000 );
}

extern void spin();

/// @brief 检查是否是外部中断或者是软件中断，并且调用相应的处理函数
/// @return 2：时钟中断；1：外部中断；-1：无效
int handle_device_intr( u64 scause ) {
    // int msb = ( scause >> 63 ) & 1;

    switch ( scause ) {
        case 0x8000000000000005L:
            handle_clock_intr();
            return 2;

        case 0x2L:
            // TODO
            printf( "handle_device_intr: scause = 0x%x\n", scause );
            panic( "handle_device_intr: external interrupt not implemented" );
            return 1;

        default:
            return -1;
    }
}

/// @brief 内核态的 trap 处理函数
void kernel_trap() {
    u64 scause = read_scause();
    u64 sepc = read_sepc();
    u64 sstatus = read_sstatus();

    if ( ( sstatus & SSTATUS_SPP ) == 0 ) {
        // 并非由 supervisor 模式进入 kernel trap
        panic( "kernel_trap: not from supervisor mode" );
    }

    // 允许在内核处理中接受中断（例如 syscall 期间可能临时打开中断）
    // 因此不要在这里因为中断打开而 panic。保留这个检查会在正常的
    // syscall 处理或设备处理中引发不必要的 panic。
    // if ( is_interupt_on() ) {
    //     // handle trap 时不应该开启中断
    //     panic( "kernel_trap: interrupt enabled" );
    // }

    // NOTICE: 不确定这是否会影响嵌套中断
    if ( handle_device_intr( scause ) == -1 ) {
        // 打印更多调试信息以便定位问题
        u64 stval = read_stval();

        printf( "kernel_trap: unexpected scause 0x%x\n", scause );
        printf( "    sepc = 0x%x\n", sepc );
        printf( "    stval = 0x%x\n", stval );

        // 简单解码几个常见的同步异常代码，便于阅读
        switch ( ( int ) scause ) {
            case 0:
                printf( "    exception: instruction address misaligned\n" );
                break;
            case 1:
                printf( "    exception: instruction access fault\n" );
                break;
            case 2:
                printf( "    exception: illegal instruction\n" );
                break;
            case 5:
                printf( "    exception: load access fault\n" );
                break;
            case 7:
                printf( "    exception: store/AMO access fault\n" );
                break;
            case 12:
                printf( "    exception: instruction page fault\n" );
                break;
            case 13:
                printf( "    exception: load page fault\n" );
                break;
            case 15:
                printf( "    exception: store/AMO page fault\n" );
                break;
            default:
                break;
        }

        panic( "kernel_trap: unexpected scause" );
    }

    // 虽然目前因为没有进程调度，所以没有 yield，不会导致其他 intr 产生
    // 但是仍然写上还原现场的代码
    write_sepc( sepc );
    write_sstatus( sstatus );
}

u64 user_trap() {
    int which_dev = 0;

    // 必须从用户态进入 trap
    if ( ( read_sstatus() & SSTATUS_SPP ) != 0 )
        panic( "usertrap: not from user mode" );

    // 由于此时在内核态，仍然使用 kernel_trap()
    write_stvec( ( u64 ) kernelvec );

    extern struct Process* curr_proc;

    // save user program counter.
    curr_proc->trapframe->epc = read_sepc();

    int scause = read_scause();

    if ( scause == 8 ) {
        // 系统调用

        if ( is_killed( curr_proc ) )
            kexit( -1 );

        curr_proc->trapframe->epc += 4;//下一条指令

        // 重新启动中断，因为这个时候我们读取完成了
        // sepc、sstatus、scause 等寄存器的值
        interrupt_on();

        syscall();

    } else if ( ( read_scause() == 15 || read_scause() == 13 ) &&
        vm_fault( curr_proc->page_table, read_stval(), ( read_scause() == 13 ) ? 1 : 0 ) != 0 ) {
    } else {
        printf( "usertrap(): unexpected scause 0x%x pid=%d\n", read_scause(), curr_proc->pid );
        set_killed( curr_proc );
    }

    if ( is_killed( curr_proc ) )
        kexit( -1 );

    // // 如果是时钟中断，则进行调度
    // if ( which_dev == 2 )
    //     yield();

    prepare_return();

    // 获取 trampoline 中需要的用户态页表 satp 值
    u64 satp = MAKE_SATP( curr_proc->page_table );

    // 回到 trampoline.S，此时 satp 值会放在 a0
    return satp;
}

/// @brief 准备从内核态返回用户态，执行相关的状态恢复工作
void prepare_return() {
    extern struct Process* curr_proc;
    extern char trampoline[];
    extern char uservec[];

    // 将 stvec 从 kerneltrap() 转换为 usertrap()
    interrupt_off();

    // 即将转换到用户态，转发中断和异常到 uservec
    u64 trampoline_uservec = TRAMPOLINE + ( uservec - trampoline );

    write_stvec( trampoline_uservec );

    extern struct Process* curr_proc;

    curr_proc->trapframe->kernel_satp = read_satp();
    curr_proc->trapframe->kernel_sp = curr_proc->kstack + PAGE_SIZE;
    curr_proc->trapframe->kernel_trap = ( u64 ) user_trap;
    // current_process->trapframe->kernel_hartid = r_tp();

    // 准备返回用户态，重新启用中断
    unsigned long x = read_sstatus();
    x &= ~SSTATUS_SPP;
    x |= SSTATUS_SPIE;
    write_sstatus( x );

    write_sepc( curr_proc->trapframe->epc );
}
