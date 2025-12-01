#include "defs.h"
#include "riscv.h"

/// @brief 写 mstatus 寄存器
inline void write_mstatus( u64 x ) {
    asm volatile( "csrw mstatus, %0" : : "r" ( x ) );
}

/// @brief 读 mstatus 寄存器
inline u64 read_mstatus() {
    u64 x;

    asm volatile( "csrr %0, mstatus" : "=r" ( x ) );

    return x;
}

/// @brief 读 mcause 寄存器
inline u64 read_mcause() {
    u64 x;

    asm volatile( "csrr %0, mcause" : "=r" ( x ) );

    return x;
}

/// @brief 写 satp 寄存器
inline void write_satp( u64 x ) {
    asm volatile( "csrw satp, %0" : : "r" ( x ) );
}

/// @brief 读 SATP 寄存器
/// @return 
inline u64 read_satp() {
    u64 x;

    asm volatile( "csrr %0, satp" : "=r" ( x ) );

    return x;
}

/// @brief 写 medeleg 寄存器
inline void write_medeleg( u64 x ) {
    asm volatile( "csrw medeleg, %0" : : "r" ( x ) );
}

/// @brief 写 mideleg 寄存器
inline void write_mideleg( u64 x ) {
    asm volatile( "csrw mideleg, %0" : : "r" ( x ) );
}

/// @brief 读 sie 寄存器
inline u64 read_sie() {
    u64 x;

    asm volatile( "csrr %0, sie" : "=r" ( x ) );

    return x;
}

/// @brief 写 sie 寄存器
inline void write_sie( u64 x ) {
    asm volatile( "csrw sie, %0" : : "r" ( x ) );
}

/// @brief 读 mie 寄存器
inline u64 read_mie() {
    u64 x;

    asm volatile( "csrr %0, mie" : "=r" ( x ) );

    return x;
}

/// @brief 写 mie 寄存器
inline void write_mie( u64 x ) {
    asm volatile( "csrw mie, %0" : : "r" ( x ) );
}

/// @brief 写 mtvec 寄存器
inline void write_mtvec( u64 x ) {
    asm volatile( "csrw mtvec, %0" : : "r" ( x ) );
}

/// @brief 写 stvec 寄存器
inline void write_stvec( u64 x ) {
    asm volatile( "csrw stvec, %0" : : "r" ( x ) );
}

/// @brief 写 scause 寄存器
inline void write_scause( u64 x ) {
    asm volatile( "csrw scause, %0" : : "r" ( x ) );
}

/// @brief 读 sepc 寄存器
inline u64 read_sepc() {
    u64 x;

    asm volatile( "csrr %0, sepc" : "=r" ( x ) );

    return x;
}

/// @brief 写 sepc 寄存器
inline void write_sepc( u64 x ) {
    asm volatile( "csrw sepc, %0" : : "r" ( x ) );
}

/// @brief 写 stval 寄存器
inline void write_stval( u64 x ) {
    asm volatile( "csrw stval, %0" : : "r" ( x ) );
}

/// @brief 读 stval 寄存器
inline u64 read_stval() {
    u64 x;

    asm volatile( "csrr %0, stval" : "=r" ( x ) );

    return x;
}

/// @brief 写 sstatus 寄存器
inline void write_sstatus( u64 x ) {
    asm volatile( "csrw sstatus, %0" : : "r" ( x ) );
}

/// @brief 读 sstatus 寄存器
inline u64 read_sstatus() {
    u64 x;

    asm volatile( "csrr %0, sstatus" : "=r" ( x ) );

    return x;
}

/// @brief 判断当前中断是否开启
inline int is_interupt_on() {
    u64 x = read_sstatus();

    return ( x & SSTATUS_SIE ) != 0;
}

/// @brief 读 scause 寄存器
inline u64 read_scause() {
    u64 x;

    asm volatile( "csrr %0, scause" : "=r" ( x ) );

    return x;
}

/// @brief 读 time 寄存器
inline u64 read_time() {
    u64 x;

    asm volatile( "csrr %0, time" : "=r" ( x ) );

    return x;
}

/// @brief 写 stimecmp 寄存器
inline void write_stimecmp( u64 x ) {
    asm volatile( "csrw stimecmp, %0" : : "r" ( x ) );
}

/// @brief 读 stimecmp 寄存器
inline u64 read_stimecmp() {
    u64 x;

    asm volatile( "csrr %0, stimecmp" : "=r" ( x ) );

    return x;
}

/// @brief 写 mcounteren 寄存器
inline void write_mcounteren( u64 x ) {
    asm volatile( "csrw mcounteren, %0" : : "r" ( x ) );
}

/// @brief 读 mcounteren 寄存器
inline u64 read_mcounteren() {
    u64 x;

    asm volatile( "csrr %0, mcounteren" : "=r" ( x ) );

    return x;
}

/// @brief 写 menvcfg 寄存器
inline void write_menvcfg( u64 x ) {
    asm volatile( "csrw menvcfg, %0" : : "r" ( x ) );
}

/// @brief 读 menvcfg 寄存器
inline u64 read_menvcfg() {
    u64 x;

    asm volatile( "csrr %0, menvcfg" : "=r" ( x ) );

    return x;
}

/// @brief 写 mepc 寄存器
inline void write_mepc( u64 x ) {
    asm volatile( "csrw mepc, %0" : : "r" ( x ) );
}

/// @brief 写 pmpaddr0 寄存器
inline void write_pmpaddr0( u64 x ) {
    asm volatile( "csrw pmpaddr0, %0" : : "r" ( x ) );
}

/// @brief 写 pmpcfg0 寄存器
inline void write_pmpcfg0( u64 x ) {
    asm volatile( "csrw pmpcfg0, %0" : : "r" ( x ) );
}

/// @brief 读 sp 寄存器
u64 read_sp() {
    u64 x;

    asm volatile( "mv %0, sp" : "=r" ( x ) );

    return x;
}

/// @brief 刷新页表
inline void sfence_vma() {
    // 参数为 zero, zero 表示刷新所有 TLB 条目。
    asm volatile( "sfence.vma zero, zero" );
}

void interrupt_on() {
    u64 x = read_sstatus();
    x |= SSTATUS_SIE;
    write_sstatus( x );
}

void interrupt_off() {
    u64 x = read_sstatus();
    x &= ~SSTATUS_SIE;
    write_sstatus( x );
}