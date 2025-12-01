#include "defs.h"

extern char _bss_start[], _bss_end[];

int main();

// stack0 的值（地址）由链接器自动确定，其定义为数组的根本原因只是为了
// 在 .bss 段中分配一份足够大的空间作为栈空间而已
__attribute__( ( aligned( 16 ) ) ) char stack0[4096];

void cleanup_bss() {
    for ( char* p = _bss_start; p < _bss_end; p++ ) {
        *p = 0;
    }
}

void call_main() {
    // 初始化 UART
    uart_init();

    // printf( "UART initialized.\n" );

    // 初始化内存分配器
    kmem_init();

    // printf( "Memory allocator initialized.\n" );

    // 初始化内核页表
    kvm_init();

    // printf( "Kernel page table initialized.\n" );

    // 初始化 trap 处理程序
    trap_init();

    // printf( "Trap handler initialized.\n" );

    // 初始化进程子系统
    process_init();

    // printf( "Process subsystem initialized.\n" );

    user_init();

    // printf( "User process initialized.\n" );

    // 由此进入循环
    scheduler();

    // 正常情况下不应该返回，因此自旋
    while ( 1 );
}

void perm_init() {
    // 设置 mstatus 寄存器的 MPP 位为 S 模式
    // 用于在发生中断、异常时切换到 S 模式进行处理
    u64 mstatus = read_mstatus();

    mstatus = ( mstatus & ~MSTATUS_MPP_MASK ) | MSTATUS_MPP_S;

    write_mstatus( mstatus );

    // 设置 mret 地址为 call_main 函数
    write_mepc( ( u64 ) call_main );
}

void intr_init() {
    // 将所有中断和异常都委托给 S 模式处理
    write_medeleg( 0xffff );
    write_mideleg( 0xffff );

    // 使能 S 模式下的外部中断和定时器中断
    write_sie( read_sie() | SIE_SEIE | SIE_STIE );

    // 开启 S 模式的总中断开关
    write_sstatus( read_sstatus() | SSTATUS_SIE );

    // // FIXME: 是否需要这样初始化？（为了在 timecmp 之前写入 handler）
    // extern void trap_init_hart();

    // trap_init_hart();
}

void enable_physical_protection() {
    write_pmpaddr0( 0x3fffffffffffffull );
    write_pmpcfg0( 0xf );
}

void timer_init() {
    // 使能机器模式下的定时器中断
    write_mie( read_mie() | MIE_STIE );

    // 使能机器模式下的计数器访问
    // 1L << 63 代表允许在 S 模式下访问机器模式的计数器寄存器
    write_menvcfg( read_menvcfg() | ( 1L << 63 ) );

    // 使能计数器寄存器的访问
    // 这里允许 S 模式下访问 mcounteren 的第 1 位（代表 time 寄存器）
    write_mcounteren( read_mcounteren() | 1L << 1 );

    // FIXME
    // 设置下一个时钟中断时间（大约 1 秒后，留足启动时间）
    write_stimecmp( read_time() + 10000000 );
}

/// @brief 内核入口函数，完成各种组件初始化
void start() {
    // 清零 .bss 段
    cleanup_bss();

    // 初始化委托中断和异常
    intr_init();

    // 禁止页表转换
    write_satp( 0 );

    // 应用物理内存保护
    enable_physical_protection();

    // 初始化定时器
    timer_init();

    perm_init();

    // 这里应该会以 S 模式（MPP设定）进入 call_main 函数
    asm volatile( "mret" );
}
