#ifndef _RISC_V_H_
#define _RISC_V_H_

#include "defs.h"

#define MSTATUS_MPP_MASK (3L << 11) // previous mode.
#define MSTATUS_MPP_M (3L << 11)
#define MSTATUS_MPP_S (1L << 11)
#define MSTATUS_MPP_U (0L << 11)

void write_mstatus( u64 x );
u64 read_mstatus();

void write_satp( u64 x );
u64 read_satp();

void write_mideleg( u64 x );

void write_medeleg( u64 x );

#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer

void write_sie( u64 x );
u64 read_sie();

// Machine-mode Interrupt Enable
#define MIE_STIE (1L << 5)  // supervisor timer

void write_mie( u64 x );
u64 read_mie();

void write_mtvec( u64 x );

void write_stvec( u64 x );

void write_sepc( u64 x );
u64 read_sepc();

void write_stval( u64 x );
u64 read_stval();

#define SSTATUS_SPP (1L << 8)  // Previous mode, 1=Supervisor, 0=User
#define SSTATUS_SPIE (1L << 5) // Supervisor Previous Interrupt Enable
#define SSTATUS_UPIE (1L << 4) // User Previous Interrupt Enable
#define SSTATUS_SIE (1L << 1)  // Supervisor Interrupt Enable
#define SSTATUS_UIE (1L << 0)  // User Interrupt Enable
#define SSTATUS_SUM (1L << 18) // Supervisor User Memory access

void write_sstatus( u64 x );
u64 read_sstatus();

int is_interupt_on();
void interrupt_on();
void interrupt_off();

void write_scause( u64 x );
u64 read_scause();

u64 read_mcause();

u64 read_time();

void write_stimecmp( u64 x );
u64 read_stimecmp();

void write_mcounteren( u64 x );
u64 read_mcounteren();

void write_menvcfg( u64 x );
u64 read_menvcfg();

void write_mepc( u64 x );

void write_pmpaddr0( u64 x );

void write_pmpcfg0( u64 x );

u64 read_sp();

void sfence_vma();

#endif // !_RISC_V_H_