
user/initcode.out:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <start>:
   0:	00200893          	li	a7,2
   4:	00000513          	li	a0,0
   8:	00000073          	ecall

000000000000000c <loop>:
   c:	0000006f          	j	c <loop>
