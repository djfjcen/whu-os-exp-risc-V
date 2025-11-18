
user/user_test.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <_start>:
   0:	00b00893          	li	a7,11
   4:	00000073          	ecall
   8:	00e00893          	li	a7,14
   c:	00000073          	ecall
  10:	00200893          	li	a7,2
  14:	02a00513          	li	a0,42
  18:	00000073          	ecall

000000000000001c <_loop>:
  1c:	0000006f          	j	1c <_loop>
