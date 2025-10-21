
kernel.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	100002b7          	lui	t0,0x10000
    80000004:	05300313          	li	t1,83
    80000008:	00628023          	sb	t1,0(t0) # 10000000 <_entry-0x70000000>
    8000000c:	00011117          	auipc	sp,0x11
    80000010:	ff410113          	add	sp,sp,-12 # 80011000 <swap_mgr>
    80000014:	05000313          	li	t1,80
    80000018:	00628023          	sb	t1,0(t0)
    8000001c:	00004297          	auipc	t0,0x4
    80000020:	b3428293          	add	t0,t0,-1228 # 80003b50 <machinevec>
    80000024:	30529073          	csrw	mtvec,t0
    80000028:	08000293          	li	t0,128
    8000002c:	30429073          	csrw	mie,t0
    80000030:	2000c2b7          	lui	t0,0x2000c
    80000034:	ff82829b          	addw	t0,t0,-8 # 2000bff8 <_entry-0x5fff4008>
    80000038:	0002b303          	ld	t1,0(t0)
    8000003c:	000f43b7          	lui	t2,0xf4
    80000040:	2403839b          	addw	t2,t2,576 # f4240 <_entry-0x7ff0bdc0>
    80000044:	00730e33          	add	t3,t1,t2
    80000048:	02004eb7          	lui	t4,0x2004
    8000004c:	01ceb023          	sd	t3,0(t4) # 2004000 <_entry-0x7dffc000>
    80000050:	00800293          	li	t0,8
    80000054:	30029073          	csrw	mstatus,t0
    80000058:	00010297          	auipc	t0,0x10
    8000005c:	fa828293          	add	t0,t0,-88 # 80010000 <bss_start>
    80000060:	00426317          	auipc	t1,0x426
    80000064:	19830313          	add	t1,t1,408 # 804261f8 <bss_end>

0000000080000068 <bss_clear>:
    80000068:	00628863          	beq	t0,t1,80000078 <bss_done>
    8000006c:	0002b023          	sd	zero,0(t0)
    80000070:	00828293          	add	t0,t0,8
    80000074:	ff5ff06f          	j	80000068 <bss_clear>

0000000080000078 <bss_done>:
    80000078:	7f4000ef          	jal	8000086c <main>

000000008000007c <loop>:
    8000007c:	0000006f          	j	8000007c <loop>

0000000080000080 <test_trap_initialization>:
    80000080:	ff010113          	add	sp,sp,-16
    80000084:	00004517          	auipc	a0,0x4
    80000088:	f7c50513          	add	a0,a0,-132 # 80004000 <rodata_start>
    8000008c:	00113423          	sd	ra,8(sp)
    80000090:	00813023          	sd	s0,0(sp)
    80000094:	158010ef          	jal	800011ec <uart_puts>
    80000098:	611020ef          	jal	80002ea8 <trap_init>
    8000009c:	66d020ef          	jal	80002f08 <trap_init_hart>
    800000a0:	10502473          	csrr	s0,stvec
    800000a4:	00004517          	auipc	a0,0x4
    800000a8:	f9c50513          	add	a0,a0,-100 # 80004040 <rodata_start+0x40>
    800000ac:	00040593          	mv	a1,s0
    800000b0:	5cd000ef          	jal	80000e7c <printf>
    800000b4:	02040c63          	beqz	s0,800000ec <test_trap_initialization+0x6c>
    800000b8:	00004517          	auipc	a0,0x4
    800000bc:	fa850513          	add	a0,a0,-88 # 80004060 <rodata_start+0x60>
    800000c0:	12c010ef          	jal	800011ec <uart_puts>
    800000c4:	104025f3          	csrr	a1,sie
    800000c8:	00004517          	auipc	a0,0x4
    800000cc:	fe050513          	add	a0,a0,-32 # 800040a8 <rodata_start+0xa8>
    800000d0:	5ad000ef          	jal	80000e7c <printf>
    800000d4:	00013403          	ld	s0,0(sp)
    800000d8:	00813083          	ld	ra,8(sp)
    800000dc:	00004517          	auipc	a0,0x4
    800000e0:	ffc50513          	add	a0,a0,-4 # 800040d8 <rodata_start+0xd8>
    800000e4:	01010113          	add	sp,sp,16
    800000e8:	1040106f          	j	800011ec <uart_puts>
    800000ec:	00004517          	auipc	a0,0x4
    800000f0:	f9450513          	add	a0,a0,-108 # 80004080 <rodata_start+0x80>
    800000f4:	0f8010ef          	jal	800011ec <uart_puts>
    800000f8:	fcdff06f          	j	800000c4 <test_trap_initialization+0x44>

00000000800000fc <test_interrupt_control>:
    800000fc:	ff010113          	add	sp,sp,-16
    80000100:	00004517          	auipc	a0,0x4
    80000104:	ff050513          	add	a0,a0,-16 # 800040f0 <rodata_start+0xf0>
    80000108:	00113423          	sd	ra,8(sp)
    8000010c:	00813023          	sd	s0,0(sp)
    80000110:	0dc010ef          	jal	800011ec <uart_puts>
    80000114:	00004517          	auipc	a0,0x4
    80000118:	01c50513          	add	a0,a0,28 # 80004130 <rodata_start+0x130>
    8000011c:	0d0010ef          	jal	800011ec <uart_puts>
    80000120:	55d020ef          	jal	80002e7c <intr_off>
    80000124:	569020ef          	jal	80002e8c <intr_get>
    80000128:	00050413          	mv	s0,a0
    8000012c:	00050593          	mv	a1,a0
    80000130:	00004517          	auipc	a0,0x4
    80000134:	01850513          	add	a0,a0,24 # 80004148 <rodata_start+0x148>
    80000138:	545000ef          	jal	80000e7c <printf>
    8000013c:	06041063          	bnez	s0,8000019c <test_interrupt_control+0xa0>
    80000140:	00004517          	auipc	a0,0x4
    80000144:	02850513          	add	a0,a0,40 # 80004168 <rodata_start+0x168>
    80000148:	0a4010ef          	jal	800011ec <uart_puts>
    8000014c:	00004517          	auipc	a0,0x4
    80000150:	04c50513          	add	a0,a0,76 # 80004198 <rodata_start+0x198>
    80000154:	098010ef          	jal	800011ec <uart_puts>
    80000158:	515020ef          	jal	80002e6c <intr_on>
    8000015c:	531020ef          	jal	80002e8c <intr_get>
    80000160:	00050413          	mv	s0,a0
    80000164:	00050593          	mv	a1,a0
    80000168:	00004517          	auipc	a0,0x4
    8000016c:	04850513          	add	a0,a0,72 # 800041b0 <rodata_start+0x1b0>
    80000170:	50d000ef          	jal	80000e7c <printf>
    80000174:	02040c63          	beqz	s0,800001ac <test_interrupt_control+0xb0>
    80000178:	00004517          	auipc	a0,0x4
    8000017c:	05850513          	add	a0,a0,88 # 800041d0 <rodata_start+0x1d0>
    80000180:	06c010ef          	jal	800011ec <uart_puts>
    80000184:	00013403          	ld	s0,0(sp)
    80000188:	00813083          	ld	ra,8(sp)
    8000018c:	00004517          	auipc	a0,0x4
    80000190:	07450513          	add	a0,a0,116 # 80004200 <rodata_start+0x200>
    80000194:	01010113          	add	sp,sp,16
    80000198:	0540106f          	j	800011ec <uart_puts>
    8000019c:	00004517          	auipc	a0,0x4
    800001a0:	fe450513          	add	a0,a0,-28 # 80004180 <rodata_start+0x180>
    800001a4:	048010ef          	jal	800011ec <uart_puts>
    800001a8:	fa5ff06f          	j	8000014c <test_interrupt_control+0x50>
    800001ac:	00004517          	auipc	a0,0x4
    800001b0:	03c50513          	add	a0,a0,60 # 800041e8 <rodata_start+0x1e8>
    800001b4:	038010ef          	jal	800011ec <uart_puts>
    800001b8:	00013403          	ld	s0,0(sp)
    800001bc:	00813083          	ld	ra,8(sp)
    800001c0:	00004517          	auipc	a0,0x4
    800001c4:	04050513          	add	a0,a0,64 # 80004200 <rodata_start+0x200>
    800001c8:	01010113          	add	sp,sp,16
    800001cc:	0200106f          	j	800011ec <uart_puts>

00000000800001d0 <test_trapframe_allocation>:
    800001d0:	fe010113          	add	sp,sp,-32
    800001d4:	00004517          	auipc	a0,0x4
    800001d8:	04450513          	add	a0,a0,68 # 80004218 <rodata_start+0x218>
    800001dc:	00113c23          	sd	ra,24(sp)
    800001e0:	00813823          	sd	s0,16(sp)
    800001e4:	00913423          	sd	s1,8(sp)
    800001e8:	01213023          	sd	s2,0(sp)
    800001ec:	000010ef          	jal	800011ec <uart_puts>
    800001f0:	00004517          	auipc	a0,0x4
    800001f4:	06850513          	add	a0,a0,104 # 80004258 <rodata_start+0x258>
    800001f8:	7f5000ef          	jal	800011ec <uart_puts>
    800001fc:	3cd020ef          	jal	80002dc8 <alloc_trapframe>
    80000200:	00050413          	mv	s0,a0
    80000204:	3c5020ef          	jal	80002dc8 <alloc_trapframe>
    80000208:	00050493          	mv	s1,a0
    8000020c:	3bd020ef          	jal	80002dc8 <alloc_trapframe>
    80000210:	10040863          	beqz	s0,80000320 <test_trapframe_allocation+0x150>
    80000214:	10048663          	beqz	s1,80000320 <test_trapframe_allocation+0x150>
    80000218:	00050913          	mv	s2,a0
    8000021c:	10050263          	beqz	a0,80000320 <test_trapframe_allocation+0x150>
    80000220:	00004517          	auipc	a0,0x4
    80000224:	05050513          	add	a0,a0,80 # 80004270 <rodata_start+0x270>
    80000228:	455000ef          	jal	80000e7c <printf>
    8000022c:	00040593          	mv	a1,s0
    80000230:	00004517          	auipc	a0,0x4
    80000234:	06050513          	add	a0,a0,96 # 80004290 <rodata_start+0x290>
    80000238:	445000ef          	jal	80000e7c <printf>
    8000023c:	00048593          	mv	a1,s1
    80000240:	00004517          	auipc	a0,0x4
    80000244:	06050513          	add	a0,a0,96 # 800042a0 <rodata_start+0x2a0>
    80000248:	435000ef          	jal	80000e7c <printf>
    8000024c:	00090593          	mv	a1,s2
    80000250:	00004517          	auipc	a0,0x4
    80000254:	06050513          	add	a0,a0,96 # 800042b0 <rodata_start+0x2b0>
    80000258:	425000ef          	jal	80000e7c <printf>
    8000025c:	00940463          	beq	s0,s1,80000264 <test_trapframe_allocation+0x94>
    80000260:	0f249663          	bne	s1,s2,8000034c <test_trapframe_allocation+0x17c>
    80000264:	00004517          	auipc	a0,0x4
    80000268:	07c50513          	add	a0,a0,124 # 800042e0 <rodata_start+0x2e0>
    8000026c:	781000ef          	jal	800011ec <uart_puts>
    80000270:	00004517          	auipc	a0,0x4
    80000274:	0a050513          	add	a0,a0,160 # 80004310 <rodata_start+0x310>
    80000278:	775000ef          	jal	800011ec <uart_puts>
    8000027c:	21d957b7          	lui	a5,0x21d95
    80000280:	00279793          	sll	a5,a5,0x2
    80000284:	32178793          	add	a5,a5,801 # 21d95321 <_entry-0x5e26acdf>
    80000288:	12345737          	lui	a4,0x12345
    8000028c:	67870713          	add	a4,a4,1656 # 12345678 <_entry-0x6dcba988>
    80000290:	00f43823          	sd	a5,16(s0)
    80000294:	02a00793          	li	a5,42
    80000298:	00e43423          	sd	a4,8(s0)
    8000029c:	04f43823          	sd	a5,80(s0)
    800002a0:	00004517          	auipc	a0,0x4
    800002a4:	09050513          	add	a0,a0,144 # 80004330 <rodata_start+0x330>
    800002a8:	745000ef          	jal	800011ec <uart_puts>
    800002ac:	00004517          	auipc	a0,0x4
    800002b0:	0a450513          	add	a0,a0,164 # 80004350 <rodata_start+0x350>
    800002b4:	739000ef          	jal	800011ec <uart_puts>
    800002b8:	00040513          	mv	a0,s0
    800002bc:	36d020ef          	jal	80002e28 <free_trapframe>
    800002c0:	00048513          	mv	a0,s1
    800002c4:	365020ef          	jal	80002e28 <free_trapframe>
    800002c8:	00090513          	mv	a0,s2
    800002cc:	35d020ef          	jal	80002e28 <free_trapframe>
    800002d0:	00004517          	auipc	a0,0x4
    800002d4:	09850513          	add	a0,a0,152 # 80004368 <rodata_start+0x368>
    800002d8:	715000ef          	jal	800011ec <uart_puts>
    800002dc:	2ed020ef          	jal	80002dc8 <alloc_trapframe>
    800002e0:	00050413          	mv	s0,a0
    800002e4:	04050463          	beqz	a0,8000032c <test_trapframe_allocation+0x15c>
    800002e8:	00050593          	mv	a1,a0
    800002ec:	00004517          	auipc	a0,0x4
    800002f0:	09c50513          	add	a0,a0,156 # 80004388 <rodata_start+0x388>
    800002f4:	389000ef          	jal	80000e7c <printf>
    800002f8:	00040513          	mv	a0,s0
    800002fc:	32d020ef          	jal	80002e28 <free_trapframe>
    80000300:	01013403          	ld	s0,16(sp)
    80000304:	01813083          	ld	ra,24(sp)
    80000308:	00813483          	ld	s1,8(sp)
    8000030c:	00013903          	ld	s2,0(sp)
    80000310:	00004517          	auipc	a0,0x4
    80000314:	0c850513          	add	a0,a0,200 # 800043d8 <rodata_start+0x3d8>
    80000318:	02010113          	add	sp,sp,32
    8000031c:	6d10006f          	j	800011ec <uart_puts>
    80000320:	00004517          	auipc	a0,0x4
    80000324:	09850513          	add	a0,a0,152 # 800043b8 <rodata_start+0x3b8>
    80000328:	6c5000ef          	jal	800011ec <uart_puts>
    8000032c:	01013403          	ld	s0,16(sp)
    80000330:	01813083          	ld	ra,24(sp)
    80000334:	00813483          	ld	s1,8(sp)
    80000338:	00013903          	ld	s2,0(sp)
    8000033c:	00004517          	auipc	a0,0x4
    80000340:	09c50513          	add	a0,a0,156 # 800043d8 <rodata_start+0x3d8>
    80000344:	02010113          	add	sp,sp,32
    80000348:	6a50006f          	j	800011ec <uart_puts>
    8000034c:	00004517          	auipc	a0,0x4
    80000350:	f7450513          	add	a0,a0,-140 # 800042c0 <rodata_start+0x2c0>
    80000354:	699000ef          	jal	800011ec <uart_puts>
    80000358:	f19ff06f          	j	80000270 <test_trapframe_allocation+0xa0>

000000008000035c <test_csr_operations>:
    8000035c:	ff010113          	add	sp,sp,-16
    80000360:	00004517          	auipc	a0,0x4
    80000364:	09050513          	add	a0,a0,144 # 800043f0 <rodata_start+0x3f0>
    80000368:	00113423          	sd	ra,8(sp)
    8000036c:	00813023          	sd	s0,0(sp)
    80000370:	67d000ef          	jal	800011ec <uart_puts>
    80000374:	10002473          	csrr	s0,sstatus
    80000378:	00004517          	auipc	a0,0x4
    8000037c:	0b050513          	add	a0,a0,176 # 80004428 <rodata_start+0x428>
    80000380:	00040593          	mv	a1,s0
    80000384:	2f9000ef          	jal	80000e7c <printf>
    80000388:	142025f3          	csrr	a1,scause
    8000038c:	00004517          	auipc	a0,0x4
    80000390:	0b450513          	add	a0,a0,180 # 80004440 <rodata_start+0x440>
    80000394:	2e9000ef          	jal	80000e7c <printf>
    80000398:	141025f3          	csrr	a1,sepc
    8000039c:	00004517          	auipc	a0,0x4
    800003a0:	0bc50513          	add	a0,a0,188 # 80004458 <rodata_start+0x458>
    800003a4:	2d9000ef          	jal	80000e7c <printf>
    800003a8:	00004517          	auipc	a0,0x4
    800003ac:	0c850513          	add	a0,a0,200 # 80004470 <rodata_start+0x470>
    800003b0:	63d000ef          	jal	800011ec <uart_puts>
    800003b4:	00000793          	li	a5,0
    800003b8:	10079073          	csrw	sstatus,a5
    800003bc:	100025f3          	csrr	a1,sstatus
    800003c0:	00004517          	auipc	a0,0x4
    800003c4:	0c850513          	add	a0,a0,200 # 80004488 <rodata_start+0x488>
    800003c8:	2b5000ef          	jal	80000e7c <printf>
    800003cc:	10041073          	csrw	sstatus,s0
    800003d0:	00004517          	auipc	a0,0x4
    800003d4:	0d050513          	add	a0,a0,208 # 800044a0 <rodata_start+0x4a0>
    800003d8:	615000ef          	jal	800011ec <uart_puts>
    800003dc:	00013403          	ld	s0,0(sp)
    800003e0:	00813083          	ld	ra,8(sp)
    800003e4:	00004517          	auipc	a0,0x4
    800003e8:	0d450513          	add	a0,a0,212 # 800044b8 <rodata_start+0x4b8>
    800003ec:	01010113          	add	sp,sp,16
    800003f0:	5fd0006f          	j	800011ec <uart_puts>

00000000800003f4 <test_exception_definitions>:
    800003f4:	ff010113          	add	sp,sp,-16
    800003f8:	00004517          	auipc	a0,0x4
    800003fc:	0d850513          	add	a0,a0,216 # 800044d0 <rodata_start+0x4d0>
    80000400:	00113423          	sd	ra,8(sp)
    80000404:	5e9000ef          	jal	800011ec <uart_puts>
    80000408:	00004517          	auipc	a0,0x4
    8000040c:	10850513          	add	a0,a0,264 # 80004510 <rodata_start+0x510>
    80000410:	26d000ef          	jal	80000e7c <printf>
    80000414:	00200593          	li	a1,2
    80000418:	00004517          	auipc	a0,0x4
    8000041c:	11050513          	add	a0,a0,272 # 80004528 <rodata_start+0x528>
    80000420:	25d000ef          	jal	80000e7c <printf>
    80000424:	00d00593          	li	a1,13
    80000428:	00004517          	auipc	a0,0x4
    8000042c:	12050513          	add	a0,a0,288 # 80004548 <rodata_start+0x548>
    80000430:	24d000ef          	jal	80000e7c <printf>
    80000434:	00f00593          	li	a1,15
    80000438:	00004517          	auipc	a0,0x4
    8000043c:	13050513          	add	a0,a0,304 # 80004568 <rodata_start+0x568>
    80000440:	23d000ef          	jal	80000e7c <printf>
    80000444:	00800593          	li	a1,8
    80000448:	00004517          	auipc	a0,0x4
    8000044c:	14050513          	add	a0,a0,320 # 80004588 <rodata_start+0x588>
    80000450:	22d000ef          	jal	80000e7c <printf>
    80000454:	00004517          	auipc	a0,0x4
    80000458:	14c50513          	add	a0,a0,332 # 800045a0 <rodata_start+0x5a0>
    8000045c:	221000ef          	jal	80000e7c <printf>
    80000460:	00500593          	li	a1,5
    80000464:	00004517          	auipc	a0,0x4
    80000468:	15450513          	add	a0,a0,340 # 800045b8 <rodata_start+0x5b8>
    8000046c:	211000ef          	jal	80000e7c <printf>
    80000470:	00700593          	li	a1,7
    80000474:	00004517          	auipc	a0,0x4
    80000478:	15c50513          	add	a0,a0,348 # 800045d0 <rodata_start+0x5d0>
    8000047c:	201000ef          	jal	80000e7c <printf>
    80000480:	00900593          	li	a1,9
    80000484:	00004517          	auipc	a0,0x4
    80000488:	16450513          	add	a0,a0,356 # 800045e8 <rodata_start+0x5e8>
    8000048c:	1f1000ef          	jal	80000e7c <printf>
    80000490:	00004517          	auipc	a0,0x4
    80000494:	17050513          	add	a0,a0,368 # 80004600 <rodata_start+0x600>
    80000498:	555000ef          	jal	800011ec <uart_puts>
    8000049c:	00813083          	ld	ra,8(sp)
    800004a0:	00004517          	auipc	a0,0x4
    800004a4:	18850513          	add	a0,a0,392 # 80004628 <rodata_start+0x628>
    800004a8:	01010113          	add	sp,sp,16
    800004ac:	5410006f          	j	800011ec <uart_puts>

00000000800004b0 <test_trapframe_structure>:
    800004b0:	ff010113          	add	sp,sp,-16
    800004b4:	00004517          	auipc	a0,0x4
    800004b8:	18c50513          	add	a0,a0,396 # 80004640 <rodata_start+0x640>
    800004bc:	00113423          	sd	ra,8(sp)
    800004c0:	52d000ef          	jal	800011ec <uart_puts>
    800004c4:	11000593          	li	a1,272
    800004c8:	00004517          	auipc	a0,0x4
    800004cc:	1b050513          	add	a0,a0,432 # 80004678 <rodata_start+0x678>
    800004d0:	1ad000ef          	jal	80000e7c <printf>
    800004d4:	00004517          	auipc	a0,0x4
    800004d8:	1cc50513          	add	a0,a0,460 # 800046a0 <rodata_start+0x6a0>
    800004dc:	1a1000ef          	jal	80000e7c <printf>
    800004e0:	00004517          	auipc	a0,0x4
    800004e4:	1f050513          	add	a0,a0,496 # 800046d0 <rodata_start+0x6d0>
    800004e8:	195000ef          	jal	80000e7c <printf>
    800004ec:	00800593          	li	a1,8
    800004f0:	00004517          	auipc	a0,0x4
    800004f4:	1f850513          	add	a0,a0,504 # 800046e8 <rodata_start+0x6e8>
    800004f8:	185000ef          	jal	80000e7c <printf>
    800004fc:	00800593          	li	a1,8
    80000500:	00004517          	auipc	a0,0x4
    80000504:	20050513          	add	a0,a0,512 # 80004700 <rodata_start+0x700>
    80000508:	175000ef          	jal	80000e7c <printf>
    8000050c:	00800593          	li	a1,8
    80000510:	00004517          	auipc	a0,0x4
    80000514:	21050513          	add	a0,a0,528 # 80004720 <rodata_start+0x720>
    80000518:	165000ef          	jal	80000e7c <printf>
    8000051c:	02200693          	li	a3,34
    80000520:	00800613          	li	a2,8
    80000524:	11000593          	li	a1,272
    80000528:	00004517          	auipc	a0,0x4
    8000052c:	21850513          	add	a0,a0,536 # 80004740 <rodata_start+0x740>
    80000530:	14d000ef          	jal	80000e7c <printf>
    80000534:	00004517          	auipc	a0,0x4
    80000538:	23450513          	add	a0,a0,564 # 80004768 <rodata_start+0x768>
    8000053c:	4b1000ef          	jal	800011ec <uart_puts>
    80000540:	00813083          	ld	ra,8(sp)
    80000544:	00004517          	auipc	a0,0x4
    80000548:	24c50513          	add	a0,a0,588 # 80004790 <rodata_start+0x790>
    8000054c:	01010113          	add	sp,sp,16
    80000550:	49d0006f          	j	800011ec <uart_puts>

0000000080000554 <test_interrupt_handlers>:
    80000554:	ff010113          	add	sp,sp,-16
    80000558:	00004517          	auipc	a0,0x4
    8000055c:	25050513          	add	a0,a0,592 # 800047a8 <rodata_start+0x7a8>
    80000560:	00113423          	sd	ra,8(sp)
    80000564:	489000ef          	jal	800011ec <uart_puts>
    80000568:	00004517          	auipc	a0,0x4
    8000056c:	28050513          	add	a0,a0,640 # 800047e8 <rodata_start+0x7e8>
    80000570:	47d000ef          	jal	800011ec <uart_puts>
    80000574:	00414797          	auipc	a5,0x414
    80000578:	f3478793          	add	a5,a5,-204 # 804144a8 <trap_handlers>
    8000057c:	00414697          	auipc	a3,0x414
    80000580:	fac68693          	add	a3,a3,-84 # 80414528 <trapframe_pool>
    80000584:	00000593          	li	a1,0
    80000588:	0007b703          	ld	a4,0(a5)
    8000058c:	00878793          	add	a5,a5,8
    80000590:	00070463          	beqz	a4,80000598 <test_interrupt_handlers+0x44>
    80000594:	0015859b          	addw	a1,a1,1
    80000598:	fed798e3          	bne	a5,a3,80000588 <test_interrupt_handlers+0x34>
    8000059c:	00004517          	auipc	a0,0x4
    800005a0:	26c50513          	add	a0,a0,620 # 80004808 <rodata_start+0x808>
    800005a4:	0d9000ef          	jal	80000e7c <printf>
    800005a8:	00004517          	auipc	a0,0x4
    800005ac:	28850513          	add	a0,a0,648 # 80004830 <rodata_start+0x830>
    800005b0:	43d000ef          	jal	800011ec <uart_puts>
    800005b4:	00813083          	ld	ra,8(sp)
    800005b8:	00004517          	auipc	a0,0x4
    800005bc:	2a850513          	add	a0,a0,680 # 80004860 <rodata_start+0x860>
    800005c0:	01010113          	add	sp,sp,16
    800005c4:	4290006f          	j	800011ec <uart_puts>

00000000800005c8 <test_timer_interrupt>:
    800005c8:	fd010113          	add	sp,sp,-48
    800005cc:	00004517          	auipc	a0,0x4
    800005d0:	2ac50513          	add	a0,a0,684 # 80004878 <rodata_start+0x878>
    800005d4:	02113423          	sd	ra,40(sp)
    800005d8:	02813023          	sd	s0,32(sp)
    800005dc:	00913c23          	sd	s1,24(sp)
    800005e0:	40d000ef          	jal	800011ec <uart_puts>
    800005e4:	00004517          	auipc	a0,0x4
    800005e8:	2cc50513          	add	a0,a0,716 # 800048b0 <rodata_start+0x8b0>
    800005ec:	401000ef          	jal	800011ec <uart_puts>
    800005f0:	00004517          	auipc	a0,0x4
    800005f4:	2f050513          	add	a0,a0,752 # 800048e0 <rodata_start+0x8e0>
    800005f8:	3f5000ef          	jal	800011ec <uart_puts>
    800005fc:	00426417          	auipc	s0,0x426
    80000600:	be440413          	add	s0,s0,-1052 # 804261e0 <ticks>
    80000604:	00004517          	auipc	a0,0x4
    80000608:	30c50513          	add	a0,a0,780 # 80004910 <rodata_start+0x910>
    8000060c:	3e1000ef          	jal	800011ec <uart_puts>
    80000610:	00043483          	ld	s1,0(s0)
    80000614:	00004517          	auipc	a0,0x4
    80000618:	32c50513          	add	a0,a0,812 # 80004940 <rodata_start+0x940>
    8000061c:	00048593          	mv	a1,s1
    80000620:	05d000ef          	jal	80000e7c <printf>
    80000624:	049020ef          	jal	80002e6c <intr_on>
    80000628:	00004517          	auipc	a0,0x4
    8000062c:	33050513          	add	a0,a0,816 # 80004958 <rodata_start+0x958>
    80000630:	3bd000ef          	jal	800011ec <uart_puts>
    80000634:	00004517          	auipc	a0,0x4
    80000638:	33c50513          	add	a0,a0,828 # 80004970 <rodata_start+0x970>
    8000063c:	3b1000ef          	jal	800011ec <uart_puts>
    80000640:	00043783          	ld	a5,0(s0)
    80000644:	00000593          	li	a1,0
    80000648:	00f13423          	sd	a5,8(sp)
    8000064c:	00813783          	ld	a5,8(sp)
    80000650:	00043703          	ld	a4,0(s0)
    80000654:	02f71263          	bne	a4,a5,80000678 <test_timer_interrupt+0xb0>
    80000658:	05f5e6b7          	lui	a3,0x5f5e
    8000065c:	10068693          	add	a3,a3,256 # 5f5e100 <_entry-0x7a0a1f00>
    80000660:	0080006f          	j	80000668 <test_timer_interrupt+0xa0>
    80000664:	00d58a63          	beq	a1,a3,80000678 <test_timer_interrupt+0xb0>
    80000668:	00813703          	ld	a4,8(sp)
    8000066c:	00043783          	ld	a5,0(s0)
    80000670:	0015859b          	addw	a1,a1,1
    80000674:	fef708e3          	beq	a4,a5,80000664 <test_timer_interrupt+0x9c>
    80000678:	00004517          	auipc	a0,0x4
    8000067c:	31050513          	add	a0,a0,784 # 80004988 <rodata_start+0x988>
    80000680:	7fc000ef          	jal	80000e7c <printf>
    80000684:	00043583          	ld	a1,0(s0)
    80000688:	00004517          	auipc	a0,0x4
    8000068c:	31850513          	add	a0,a0,792 # 800049a0 <rodata_start+0x9a0>
    80000690:	7ec000ef          	jal	80000e7c <printf>
    80000694:	00043783          	ld	a5,0(s0)
    80000698:	04f4f063          	bgeu	s1,a5,800006d8 <test_timer_interrupt+0x110>
    8000069c:	00043583          	ld	a1,0(s0)
    800006a0:	00004517          	auipc	a0,0x4
    800006a4:	31850513          	add	a0,a0,792 # 800049b8 <rodata_start+0x9b8>
    800006a8:	409585b3          	sub	a1,a1,s1
    800006ac:	7d0000ef          	jal	80000e7c <printf>
    800006b0:	00004517          	auipc	a0,0x4
    800006b4:	34050513          	add	a0,a0,832 # 800049f0 <rodata_start+0x9f0>
    800006b8:	335000ef          	jal	800011ec <uart_puts>
    800006bc:	02013403          	ld	s0,32(sp)
    800006c0:	02813083          	ld	ra,40(sp)
    800006c4:	01813483          	ld	s1,24(sp)
    800006c8:	00004517          	auipc	a0,0x4
    800006cc:	37050513          	add	a0,a0,880 # 80004a38 <rodata_start+0xa38>
    800006d0:	03010113          	add	sp,sp,48
    800006d4:	3190006f          	j	800011ec <uart_puts>
    800006d8:	00004517          	auipc	a0,0x4
    800006dc:	34050513          	add	a0,a0,832 # 80004a18 <rodata_start+0xa18>
    800006e0:	30d000ef          	jal	800011ec <uart_puts>
    800006e4:	02013403          	ld	s0,32(sp)
    800006e8:	02813083          	ld	ra,40(sp)
    800006ec:	01813483          	ld	s1,24(sp)
    800006f0:	00004517          	auipc	a0,0x4
    800006f4:	34850513          	add	a0,a0,840 # 80004a38 <rodata_start+0xa38>
    800006f8:	03010113          	add	sp,sp,48
    800006fc:	2f10006f          	j	800011ec <uart_puts>

0000000080000700 <test_repeated_initialization>:
    80000700:	fe010113          	add	sp,sp,-32
    80000704:	00004517          	auipc	a0,0x4
    80000708:	34c50513          	add	a0,a0,844 # 80004a50 <rodata_start+0xa50>
    8000070c:	00113c23          	sd	ra,24(sp)
    80000710:	00813823          	sd	s0,16(sp)
    80000714:	00913423          	sd	s1,8(sp)
    80000718:	01213023          	sd	s2,0(sp)
    8000071c:	2d1000ef          	jal	800011ec <uart_puts>
    80000720:	00004517          	auipc	a0,0x4
    80000724:	37050513          	add	a0,a0,880 # 80004a90 <rodata_start+0xa90>
    80000728:	2c5000ef          	jal	800011ec <uart_puts>
    8000072c:	00000413          	li	s0,0
    80000730:	00004917          	auipc	s2,0x4
    80000734:	37890913          	add	s2,s2,888 # 80004aa8 <rodata_start+0xaa8>
    80000738:	00500493          	li	s1,5
    8000073c:	76c020ef          	jal	80002ea8 <trap_init>
    80000740:	0014041b          	addw	s0,s0,1
    80000744:	7c4020ef          	jal	80002f08 <trap_init_hart>
    80000748:	00040593          	mv	a1,s0
    8000074c:	00090513          	mv	a0,s2
    80000750:	72c000ef          	jal	80000e7c <printf>
    80000754:	fe9414e3          	bne	s0,s1,8000073c <test_repeated_initialization+0x3c>
    80000758:	00004517          	auipc	a0,0x4
    8000075c:	37050513          	add	a0,a0,880 # 80004ac8 <rodata_start+0xac8>
    80000760:	28d000ef          	jal	800011ec <uart_puts>
    80000764:	01013403          	ld	s0,16(sp)
    80000768:	01813083          	ld	ra,24(sp)
    8000076c:	00813483          	ld	s1,8(sp)
    80000770:	00013903          	ld	s2,0(sp)
    80000774:	00004517          	auipc	a0,0x4
    80000778:	37c50513          	add	a0,a0,892 # 80004af0 <rodata_start+0xaf0>
    8000077c:	02010113          	add	sp,sp,32
    80000780:	26d0006f          	j	800011ec <uart_puts>

0000000080000784 <run_interrupt_exception_tests>:
    80000784:	ff010113          	add	sp,sp,-16
    80000788:	00004517          	auipc	a0,0x4
    8000078c:	94850513          	add	a0,a0,-1720 # 800040d0 <rodata_start+0xd0>
    80000790:	00113423          	sd	ra,8(sp)
    80000794:	259000ef          	jal	800011ec <uart_puts>
    80000798:	00004517          	auipc	a0,0x4
    8000079c:	37050513          	add	a0,a0,880 # 80004b08 <rodata_start+0xb08>
    800007a0:	24d000ef          	jal	800011ec <uart_puts>
    800007a4:	00004517          	auipc	a0,0x4
    800007a8:	42c50513          	add	a0,a0,1068 # 80004bd0 <rodata_start+0xbd0>
    800007ac:	241000ef          	jal	800011ec <uart_puts>
    800007b0:	00004517          	auipc	a0,0x4
    800007b4:	48050513          	add	a0,a0,1152 # 80004c30 <rodata_start+0xc30>
    800007b8:	235000ef          	jal	800011ec <uart_puts>
    800007bc:	8c5ff0ef          	jal	80000080 <test_trap_initialization>
    800007c0:	93dff0ef          	jal	800000fc <test_interrupt_control>
    800007c4:	a0dff0ef          	jal	800001d0 <test_trapframe_allocation>
    800007c8:	b95ff0ef          	jal	8000035c <test_csr_operations>
    800007cc:	c29ff0ef          	jal	800003f4 <test_exception_definitions>
    800007d0:	ce1ff0ef          	jal	800004b0 <test_trapframe_structure>
    800007d4:	d81ff0ef          	jal	80000554 <test_interrupt_handlers>
    800007d8:	df1ff0ef          	jal	800005c8 <test_timer_interrupt>
    800007dc:	f25ff0ef          	jal	80000700 <test_repeated_initialization>
    800007e0:	00004517          	auipc	a0,0x4
    800007e4:	8f050513          	add	a0,a0,-1808 # 800040d0 <rodata_start+0xd0>
    800007e8:	205000ef          	jal	800011ec <uart_puts>
    800007ec:	00004517          	auipc	a0,0x4
    800007f0:	31c50513          	add	a0,a0,796 # 80004b08 <rodata_start+0xb08>
    800007f4:	1f9000ef          	jal	800011ec <uart_puts>
    800007f8:	00004517          	auipc	a0,0x4
    800007fc:	50050513          	add	a0,a0,1280 # 80004cf8 <rodata_start+0xcf8>
    80000800:	1ed000ef          	jal	800011ec <uart_puts>
    80000804:	00004517          	auipc	a0,0x4
    80000808:	42c50513          	add	a0,a0,1068 # 80004c30 <rodata_start+0xc30>
    8000080c:	1e1000ef          	jal	800011ec <uart_puts>
    80000810:	00004517          	auipc	a0,0x4
    80000814:	54050513          	add	a0,a0,1344 # 80004d50 <rodata_start+0xd50>
    80000818:	1d5000ef          	jal	800011ec <uart_puts>
    8000081c:	00004517          	auipc	a0,0x4
    80000820:	54c50513          	add	a0,a0,1356 # 80004d68 <rodata_start+0xd68>
    80000824:	1c9000ef          	jal	800011ec <uart_puts>
    80000828:	00004517          	auipc	a0,0x4
    8000082c:	56850513          	add	a0,a0,1384 # 80004d90 <rodata_start+0xd90>
    80000830:	1bd000ef          	jal	800011ec <uart_puts>
    80000834:	00004517          	auipc	a0,0x4
    80000838:	58450513          	add	a0,a0,1412 # 80004db8 <rodata_start+0xdb8>
    8000083c:	1b1000ef          	jal	800011ec <uart_puts>
    80000840:	00004517          	auipc	a0,0x4
    80000844:	5a050513          	add	a0,a0,1440 # 80004de0 <rodata_start+0xde0>
    80000848:	1a5000ef          	jal	800011ec <uart_puts>
    8000084c:	00004517          	auipc	a0,0x4
    80000850:	5b450513          	add	a0,a0,1460 # 80004e00 <rodata_start+0xe00>
    80000854:	199000ef          	jal	800011ec <uart_puts>
    80000858:	00813083          	ld	ra,8(sp)
    8000085c:	00004517          	auipc	a0,0x4
    80000860:	5d450513          	add	a0,a0,1492 # 80004e30 <rodata_start+0xe30>
    80000864:	01010113          	add	sp,sp,16
    80000868:	1850006f          	j	800011ec <uart_puts>

000000008000086c <main>:
    8000086c:	ff010113          	add	sp,sp,-16
    80000870:	00004517          	auipc	a0,0x4
    80000874:	29850513          	add	a0,a0,664 # 80004b08 <rodata_start+0xb08>
    80000878:	00113423          	sd	ra,8(sp)
    8000087c:	171000ef          	jal	800011ec <uart_puts>
    80000880:	00004517          	auipc	a0,0x4
    80000884:	5d050513          	add	a0,a0,1488 # 80004e50 <rodata_start+0xe50>
    80000888:	165000ef          	jal	800011ec <uart_puts>
    8000088c:	00004517          	auipc	a0,0x4
    80000890:	61c50513          	add	a0,a0,1564 # 80004ea8 <rodata_start+0xea8>
    80000894:	159000ef          	jal	800011ec <uart_puts>
    80000898:	00004517          	auipc	a0,0x4
    8000089c:	6e050513          	add	a0,a0,1760 # 80004f78 <rodata_start+0xf78>
    800008a0:	14d000ef          	jal	800011ec <uart_puts>
    800008a4:	604020ef          	jal	80002ea8 <trap_init>
    800008a8:	660020ef          	jal	80002f08 <trap_init_hart>
    800008ac:	00004517          	auipc	a0,0x4
    800008b0:	70450513          	add	a0,a0,1796 # 80004fb0 <rodata_start+0xfb0>
    800008b4:	139000ef          	jal	800011ec <uart_puts>
    800008b8:	00004517          	auipc	a0,0x4
    800008bc:	72850513          	add	a0,a0,1832 # 80004fe0 <rodata_start+0xfe0>
    800008c0:	12d000ef          	jal	800011ec <uart_puts>
    800008c4:	6b8020ef          	jal	80002f7c <timerinit>
    800008c8:	00004517          	auipc	a0,0x4
    800008cc:	75050513          	add	a0,a0,1872 # 80005018 <rodata_start+0x1018>
    800008d0:	11d000ef          	jal	800011ec <uart_puts>
    800008d4:	00004517          	auipc	a0,0x4
    800008d8:	77450513          	add	a0,a0,1908 # 80005048 <rodata_start+0x1048>
    800008dc:	111000ef          	jal	800011ec <uart_puts>
    800008e0:	1e1020ef          	jal	800032c0 <proc_init>
    800008e4:	00004517          	auipc	a0,0x4
    800008e8:	79c50513          	add	a0,a0,1948 # 80005080 <rodata_start+0x1080>
    800008ec:	101000ef          	jal	800011ec <uart_puts>
    800008f0:	e95ff0ef          	jal	80000784 <run_interrupt_exception_tests>
    800008f4:	00004517          	auipc	a0,0x4
    800008f8:	7bc50513          	add	a0,a0,1980 # 800050b0 <rodata_start+0x10b0>
    800008fc:	0f1000ef          	jal	800011ec <uart_puts>
    80000900:	0000006f          	j	80000900 <main+0x94>

0000000080000904 <print_number>:
    80000904:	0c050663          	beqz	a0,800009d0 <print_number+0xcc>
    80000908:	fd010113          	add	sp,sp,-48
    8000090c:	02113423          	sd	ra,40(sp)
    80000910:	02813023          	sd	s0,32(sp)
    80000914:	08061a63          	bnez	a2,800009a8 <print_number+0xa4>
    80000918:	0005071b          	sext.w	a4,a0
    8000091c:	00000613          	li	a2,0
    80000920:	0005859b          	sext.w	a1,a1
    80000924:	00010fa3          	sb	zero,31(sp)
    80000928:	01e10813          	add	a6,sp,30
    8000092c:	01f00693          	li	a3,31
    80000930:	00005317          	auipc	t1,0x5
    80000934:	a7830313          	add	t1,t1,-1416 # 800053a8 <digits>
    80000938:	02b777bb          	remuw	a5,a4,a1
    8000093c:	fff80813          	add	a6,a6,-1
    80000940:	0007089b          	sext.w	a7,a4
    80000944:	00068e13          	mv	t3,a3
    80000948:	fff6869b          	addw	a3,a3,-1
    8000094c:	02079793          	sll	a5,a5,0x20
    80000950:	0207d793          	srl	a5,a5,0x20
    80000954:	00f307b3          	add	a5,t1,a5
    80000958:	0007c503          	lbu	a0,0(a5)
    8000095c:	02b7573b          	divuw	a4,a4,a1
    80000960:	00a800a3          	sb	a0,1(a6)
    80000964:	fcb8fae3          	bgeu	a7,a1,80000938 <print_number+0x34>
    80000968:	04060a63          	beqz	a2,800009bc <print_number+0xb8>
    8000096c:	ffee069b          	addw	a3,t3,-2
    80000970:	02068793          	add	a5,a3,32
    80000974:	002787b3          	add	a5,a5,sp
    80000978:	02d00713          	li	a4,45
    8000097c:	fee78023          	sb	a4,-32(a5)
    80000980:	02d00513          	li	a0,45
    80000984:	00d10433          	add	s0,sp,a3
    80000988:	00140413          	add	s0,s0,1
    8000098c:	049000ef          	jal	800011d4 <uart_putc>
    80000990:	00044503          	lbu	a0,0(s0)
    80000994:	fe051ae3          	bnez	a0,80000988 <print_number+0x84>
    80000998:	02813083          	ld	ra,40(sp)
    8000099c:	02013403          	ld	s0,32(sp)
    800009a0:	03010113          	add	sp,sp,48
    800009a4:	00008067          	ret
    800009a8:	f60558e3          	bgez	a0,80000918 <print_number+0x14>
    800009ac:	80000737          	lui	a4,0x80000
    800009b0:	f6e508e3          	beq	a0,a4,80000920 <print_number+0x1c>
    800009b4:	40a0073b          	negw	a4,a0
    800009b8:	f69ff06f          	j	80000920 <print_number+0x1c>
    800009bc:	fc0514e3          	bnez	a0,80000984 <print_number+0x80>
    800009c0:	02813083          	ld	ra,40(sp)
    800009c4:	02013403          	ld	s0,32(sp)
    800009c8:	03010113          	add	sp,sp,48
    800009cc:	00008067          	ret
    800009d0:	03000513          	li	a0,48
    800009d4:	0010006f          	j	800011d4 <uart_putc>

00000000800009d8 <print_number_long.part.0>:
    800009d8:	fd010113          	add	sp,sp,-48
    800009dc:	02113423          	sd	ra,40(sp)
    800009e0:	02813023          	sd	s0,32(sp)
    800009e4:	00050793          	mv	a5,a0
    800009e8:	00060463          	beqz	a2,800009f0 <print_number_long.part.0+0x18>
    800009ec:	08054c63          	bltz	a0,80000a84 <print_number_long.part.0+0xac>
    800009f0:	00000613          	li	a2,0
    800009f4:	00010fa3          	sb	zero,31(sp)
    800009f8:	01e10813          	add	a6,sp,30
    800009fc:	01f00693          	li	a3,31
    80000a00:	00005317          	auipc	t1,0x5
    80000a04:	9a830313          	add	t1,t1,-1624 # 800053a8 <digits>
    80000a08:	02b7f733          	remu	a4,a5,a1
    80000a0c:	fff80813          	add	a6,a6,-1
    80000a10:	00078893          	mv	a7,a5
    80000a14:	00068e13          	mv	t3,a3
    80000a18:	fff6869b          	addw	a3,a3,-1
    80000a1c:	00e30733          	add	a4,t1,a4
    80000a20:	00074503          	lbu	a0,0(a4) # ffffffff80000000 <bss_end+0xfffffffeffbd9e08>
    80000a24:	02b7d7b3          	divu	a5,a5,a1
    80000a28:	00a800a3          	sb	a0,1(a6)
    80000a2c:	fcb8fee3          	bgeu	a7,a1,80000a08 <print_number_long.part.0+0x30>
    80000a30:	04060063          	beqz	a2,80000a70 <print_number_long.part.0+0x98>
    80000a34:	ffee069b          	addw	a3,t3,-2
    80000a38:	02068793          	add	a5,a3,32
    80000a3c:	002787b3          	add	a5,a5,sp
    80000a40:	02d00713          	li	a4,45
    80000a44:	fee78023          	sb	a4,-32(a5)
    80000a48:	02d00513          	li	a0,45
    80000a4c:	00d10433          	add	s0,sp,a3
    80000a50:	00140413          	add	s0,s0,1
    80000a54:	780000ef          	jal	800011d4 <uart_putc>
    80000a58:	00044503          	lbu	a0,0(s0)
    80000a5c:	fe051ae3          	bnez	a0,80000a50 <print_number_long.part.0+0x78>
    80000a60:	02813083          	ld	ra,40(sp)
    80000a64:	02013403          	ld	s0,32(sp)
    80000a68:	03010113          	add	sp,sp,48
    80000a6c:	00008067          	ret
    80000a70:	fc051ee3          	bnez	a0,80000a4c <print_number_long.part.0+0x74>
    80000a74:	02813083          	ld	ra,40(sp)
    80000a78:	02013403          	ld	s0,32(sp)
    80000a7c:	03010113          	add	sp,sp,48
    80000a80:	00008067          	ret
    80000a84:	40a007b3          	neg	a5,a0
    80000a88:	f6dff06f          	j	800009f4 <print_number_long.part.0+0x1c>

0000000080000a8c <clear_screen>:
    80000a8c:	00004517          	auipc	a0,0x4
    80000a90:	64450513          	add	a0,a0,1604 # 800050d0 <rodata_start+0x10d0>
    80000a94:	7580006f          	j	800011ec <uart_puts>

0000000080000a98 <clear_line>:
    80000a98:	00004517          	auipc	a0,0x4
    80000a9c:	64050513          	add	a0,a0,1600 # 800050d8 <rodata_start+0x10d8>
    80000aa0:	74c0006f          	j	800011ec <uart_puts>

0000000080000aa4 <goto_xy>:
    80000aa4:	fd010113          	add	sp,sp,-48
    80000aa8:	00913c23          	sd	s1,24(sp)
    80000aac:	00050493          	mv	s1,a0
    80000ab0:	01b00513          	li	a0,27
    80000ab4:	02113423          	sd	ra,40(sp)
    80000ab8:	02813023          	sd	s0,32(sp)
    80000abc:	01213823          	sd	s2,16(sp)
    80000ac0:	00058413          	mv	s0,a1
    80000ac4:	01313423          	sd	s3,8(sp)
    80000ac8:	70c000ef          	jal	800011d4 <uart_putc>
    80000acc:	05b00513          	li	a0,91
    80000ad0:	704000ef          	jal	800011d4 <uart_putc>
    80000ad4:	06300793          	li	a5,99
    80000ad8:	0c87cc63          	blt	a5,s0,80000bb0 <goto_xy+0x10c>
    80000adc:	00900793          	li	a5,9
    80000ae0:	0487ce63          	blt	a5,s0,80000b3c <goto_xy+0x98>
    80000ae4:	12805a63          	blez	s0,80000c18 <goto_xy+0x174>
    80000ae8:	0304041b          	addw	s0,s0,48
    80000aec:	0ff47513          	zext.b	a0,s0
    80000af0:	6e4000ef          	jal	800011d4 <uart_putc>
    80000af4:	03b00513          	li	a0,59
    80000af8:	6dc000ef          	jal	800011d4 <uart_putc>
    80000afc:	06300793          	li	a5,99
    80000b00:	0697c863          	blt	a5,s1,80000b70 <goto_xy+0xcc>
    80000b04:	00900793          	li	a5,9
    80000b08:	0e97c463          	blt	a5,s1,80000bf0 <goto_xy+0x14c>
    80000b0c:	10905c63          	blez	s1,80000c24 <goto_xy+0x180>
    80000b10:	0304851b          	addw	a0,s1,48
    80000b14:	0ff57513          	zext.b	a0,a0
    80000b18:	6bc000ef          	jal	800011d4 <uart_putc>
    80000b1c:	02013403          	ld	s0,32(sp)
    80000b20:	02813083          	ld	ra,40(sp)
    80000b24:	01813483          	ld	s1,24(sp)
    80000b28:	01013903          	ld	s2,16(sp)
    80000b2c:	00813983          	ld	s3,8(sp)
    80000b30:	04800513          	li	a0,72
    80000b34:	03010113          	add	sp,sp,48
    80000b38:	69c0006f          	j	800011d4 <uart_putc>
    80000b3c:	00a00913          	li	s2,10
    80000b40:	0324453b          	divw	a0,s0,s2
    80000b44:	0305051b          	addw	a0,a0,48
    80000b48:	0ff57513          	zext.b	a0,a0
    80000b4c:	688000ef          	jal	800011d4 <uart_putc>
    80000b50:	0324643b          	remw	s0,s0,s2
    80000b54:	0304041b          	addw	s0,s0,48
    80000b58:	0ff47513          	zext.b	a0,s0
    80000b5c:	678000ef          	jal	800011d4 <uart_putc>
    80000b60:	03b00513          	li	a0,59
    80000b64:	670000ef          	jal	800011d4 <uart_putc>
    80000b68:	06300793          	li	a5,99
    80000b6c:	f897dce3          	bge	a5,s1,80000b04 <goto_xy+0x60>
    80000b70:	06400413          	li	s0,100
    80000b74:	0284c53b          	divw	a0,s1,s0
    80000b78:	00a00913          	li	s2,10
    80000b7c:	0305051b          	addw	a0,a0,48
    80000b80:	0ff57513          	zext.b	a0,a0
    80000b84:	650000ef          	jal	800011d4 <uart_putc>
    80000b88:	0284e53b          	remw	a0,s1,s0
    80000b8c:	0325453b          	divw	a0,a0,s2
    80000b90:	0305051b          	addw	a0,a0,48
    80000b94:	0ff57513          	zext.b	a0,a0
    80000b98:	63c000ef          	jal	800011d4 <uart_putc>
    80000b9c:	0324e53b          	remw	a0,s1,s2
    80000ba0:	0305051b          	addw	a0,a0,48
    80000ba4:	0ff57513          	zext.b	a0,a0
    80000ba8:	62c000ef          	jal	800011d4 <uart_putc>
    80000bac:	f71ff06f          	j	80000b1c <goto_xy+0x78>
    80000bb0:	06400913          	li	s2,100
    80000bb4:	0324453b          	divw	a0,s0,s2
    80000bb8:	00a00993          	li	s3,10
    80000bbc:	0305051b          	addw	a0,a0,48
    80000bc0:	0ff57513          	zext.b	a0,a0
    80000bc4:	610000ef          	jal	800011d4 <uart_putc>
    80000bc8:	0324653b          	remw	a0,s0,s2
    80000bcc:	0335453b          	divw	a0,a0,s3
    80000bd0:	0305051b          	addw	a0,a0,48
    80000bd4:	0ff57513          	zext.b	a0,a0
    80000bd8:	5fc000ef          	jal	800011d4 <uart_putc>
    80000bdc:	0334643b          	remw	s0,s0,s3
    80000be0:	0304041b          	addw	s0,s0,48
    80000be4:	0ff47513          	zext.b	a0,s0
    80000be8:	5ec000ef          	jal	800011d4 <uart_putc>
    80000bec:	f09ff06f          	j	80000af4 <goto_xy+0x50>
    80000bf0:	00a00413          	li	s0,10
    80000bf4:	0284c53b          	divw	a0,s1,s0
    80000bf8:	0305051b          	addw	a0,a0,48
    80000bfc:	0ff57513          	zext.b	a0,a0
    80000c00:	5d4000ef          	jal	800011d4 <uart_putc>
    80000c04:	0284e53b          	remw	a0,s1,s0
    80000c08:	0305051b          	addw	a0,a0,48
    80000c0c:	0ff57513          	zext.b	a0,a0
    80000c10:	5c4000ef          	jal	800011d4 <uart_putc>
    80000c14:	f09ff06f          	j	80000b1c <goto_xy+0x78>
    80000c18:	03100513          	li	a0,49
    80000c1c:	5b8000ef          	jal	800011d4 <uart_putc>
    80000c20:	ed5ff06f          	j	80000af4 <goto_xy+0x50>
    80000c24:	03100513          	li	a0,49
    80000c28:	5ac000ef          	jal	800011d4 <uart_putc>
    80000c2c:	ef1ff06f          	j	80000b1c <goto_xy+0x78>

0000000080000c30 <printf_color>:
    80000c30:	f8010113          	add	sp,sp,-128
    80000c34:	02913c23          	sd	s1,56(sp)
    80000c38:	00050493          	mv	s1,a0
    80000c3c:	01b00513          	li	a0,27
    80000c40:	06f13423          	sd	a5,104(sp)
    80000c44:	04113423          	sd	ra,72(sp)
    80000c48:	04813023          	sd	s0,64(sp)
    80000c4c:	04c13823          	sd	a2,80(sp)
    80000c50:	04d13c23          	sd	a3,88(sp)
    80000c54:	06e13023          	sd	a4,96(sp)
    80000c58:	07013823          	sd	a6,112(sp)
    80000c5c:	07113c23          	sd	a7,120(sp)
    80000c60:	00058413          	mv	s0,a1
    80000c64:	03213823          	sd	s2,48(sp)
    80000c68:	03313423          	sd	s3,40(sp)
    80000c6c:	03413023          	sd	s4,32(sp)
    80000c70:	01513c23          	sd	s5,24(sp)
    80000c74:	560000ef          	jal	800011d4 <uart_putc>
    80000c78:	05b00513          	li	a0,91
    80000c7c:	558000ef          	jal	800011d4 <uart_putc>
    80000c80:	06300793          	li	a5,99
    80000c84:	1a97e063          	bltu	a5,s1,80000e24 <printf_color+0x1f4>
    80000c88:	00900793          	li	a5,9
    80000c8c:	1497e663          	bltu	a5,s1,80000dd8 <printf_color+0x1a8>
    80000c90:	0304851b          	addw	a0,s1,48
    80000c94:	0ff57513          	zext.b	a0,a0
    80000c98:	53c000ef          	jal	800011d4 <uart_putc>
    80000c9c:	06d00513          	li	a0,109
    80000ca0:	534000ef          	jal	800011d4 <uart_putc>
    80000ca4:	1c040863          	beqz	s0,80000e74 <printf_color+0x244>
    80000ca8:	00044503          	lbu	a0,0(s0)
    80000cac:	05010793          	add	a5,sp,80
    80000cb0:	00f13423          	sd	a5,8(sp)
    80000cb4:	00000a93          	li	s5,0
    80000cb8:	06050463          	beqz	a0,80000d20 <printf_color+0xf0>
    80000cbc:	02500913          	li	s2,37
    80000cc0:	02000a13          	li	s4,32
    80000cc4:	00004997          	auipc	s3,0x4
    80000cc8:	55498993          	add	s3,s3,1364 # 80005218 <rodata_start+0x1218>
    80000ccc:	00140493          	add	s1,s0,1
    80000cd0:	13251863          	bne	a0,s2,80000e00 <printf_color+0x1d0>
    80000cd4:	00144783          	lbu	a5,1(s0)
    80000cd8:	14078063          	beqz	a5,80000e18 <printf_color+0x1e8>
    80000cdc:	13278863          	beq	a5,s2,80000e0c <printf_color+0x1dc>
    80000ce0:	fa87879b          	addw	a5,a5,-88
    80000ce4:	0ff7f793          	zext.b	a5,a5
    80000ce8:	00fa6c63          	bltu	s4,a5,80000d00 <printf_color+0xd0>
    80000cec:	00279793          	sll	a5,a5,0x2
    80000cf0:	013787b3          	add	a5,a5,s3
    80000cf4:	0007a783          	lw	a5,0(a5)
    80000cf8:	013787b3          	add	a5,a5,s3
    80000cfc:	00078067          	jr	a5
    80000d00:	02500513          	li	a0,37
    80000d04:	4d0000ef          	jal	800011d4 <uart_putc>
    80000d08:	00144503          	lbu	a0,1(s0)
    80000d0c:	ffe00a93          	li	s5,-2
    80000d10:	4c4000ef          	jal	800011d4 <uart_putc>
    80000d14:	0014c503          	lbu	a0,1(s1)
    80000d18:	00148413          	add	s0,s1,1
    80000d1c:	fa0518e3          	bnez	a0,80000ccc <printf_color+0x9c>
    80000d20:	00004517          	auipc	a0,0x4
    80000d24:	3c850513          	add	a0,a0,968 # 800050e8 <rodata_start+0x10e8>
    80000d28:	4c4000ef          	jal	800011ec <uart_puts>
    80000d2c:	04813083          	ld	ra,72(sp)
    80000d30:	04013403          	ld	s0,64(sp)
    80000d34:	03813483          	ld	s1,56(sp)
    80000d38:	03013903          	ld	s2,48(sp)
    80000d3c:	02813983          	ld	s3,40(sp)
    80000d40:	02013a03          	ld	s4,32(sp)
    80000d44:	000a8513          	mv	a0,s5
    80000d48:	01813a83          	ld	s5,24(sp)
    80000d4c:	08010113          	add	sp,sp,128
    80000d50:	00008067          	ret
    80000d54:	00813783          	ld	a5,8(sp)
    80000d58:	00000613          	li	a2,0
    80000d5c:	01000593          	li	a1,16
    80000d60:	0007a503          	lw	a0,0(a5)
    80000d64:	00878793          	add	a5,a5,8
    80000d68:	00f13423          	sd	a5,8(sp)
    80000d6c:	b99ff0ef          	jal	80000904 <print_number>
    80000d70:	fa5ff06f          	j	80000d14 <printf_color+0xe4>
    80000d74:	00813783          	ld	a5,8(sp)
    80000d78:	0007c503          	lbu	a0,0(a5)
    80000d7c:	00878793          	add	a5,a5,8
    80000d80:	00f13423          	sd	a5,8(sp)
    80000d84:	450000ef          	jal	800011d4 <uart_putc>
    80000d88:	f8dff06f          	j	80000d14 <printf_color+0xe4>
    80000d8c:	00813783          	ld	a5,8(sp)
    80000d90:	0007b403          	ld	s0,0(a5)
    80000d94:	00878793          	add	a5,a5,8
    80000d98:	00f13423          	sd	a5,8(sp)
    80000d9c:	00041863          	bnez	s0,80000dac <printf_color+0x17c>
    80000da0:	0c40006f          	j	80000e64 <printf_color+0x234>
    80000da4:	00140413          	add	s0,s0,1
    80000da8:	42c000ef          	jal	800011d4 <uart_putc>
    80000dac:	00044503          	lbu	a0,0(s0)
    80000db0:	fe051ae3          	bnez	a0,80000da4 <printf_color+0x174>
    80000db4:	f61ff06f          	j	80000d14 <printf_color+0xe4>
    80000db8:	00813783          	ld	a5,8(sp)
    80000dbc:	00100613          	li	a2,1
    80000dc0:	00a00593          	li	a1,10
    80000dc4:	0007a503          	lw	a0,0(a5)
    80000dc8:	00878793          	add	a5,a5,8
    80000dcc:	00f13423          	sd	a5,8(sp)
    80000dd0:	b35ff0ef          	jal	80000904 <print_number>
    80000dd4:	f41ff06f          	j	80000d14 <printf_color+0xe4>
    80000dd8:	00a00913          	li	s2,10
    80000ddc:	0324d53b          	divuw	a0,s1,s2
    80000de0:	0305051b          	addw	a0,a0,48
    80000de4:	0ff57513          	zext.b	a0,a0
    80000de8:	3ec000ef          	jal	800011d4 <uart_putc>
    80000dec:	0324f53b          	remuw	a0,s1,s2
    80000df0:	0305051b          	addw	a0,a0,48
    80000df4:	07f57513          	and	a0,a0,127
    80000df8:	3dc000ef          	jal	800011d4 <uart_putc>
    80000dfc:	ea1ff06f          	j	80000c9c <printf_color+0x6c>
    80000e00:	3d4000ef          	jal	800011d4 <uart_putc>
    80000e04:	00040493          	mv	s1,s0
    80000e08:	f0dff06f          	j	80000d14 <printf_color+0xe4>
    80000e0c:	02500513          	li	a0,37
    80000e10:	3c4000ef          	jal	800011d4 <uart_putc>
    80000e14:	f01ff06f          	j	80000d14 <printf_color+0xe4>
    80000e18:	02500513          	li	a0,37
    80000e1c:	3b8000ef          	jal	800011d4 <uart_putc>
    80000e20:	f01ff06f          	j	80000d20 <printf_color+0xf0>
    80000e24:	06400913          	li	s2,100
    80000e28:	0324d53b          	divuw	a0,s1,s2
    80000e2c:	00a00993          	li	s3,10
    80000e30:	0305051b          	addw	a0,a0,48
    80000e34:	0ff57513          	zext.b	a0,a0
    80000e38:	39c000ef          	jal	800011d4 <uart_putc>
    80000e3c:	0324f53b          	remuw	a0,s1,s2
    80000e40:	0335553b          	divuw	a0,a0,s3
    80000e44:	0305051b          	addw	a0,a0,48
    80000e48:	0ff57513          	zext.b	a0,a0
    80000e4c:	388000ef          	jal	800011d4 <uart_putc>
    80000e50:	0334f53b          	remuw	a0,s1,s3
    80000e54:	0305051b          	addw	a0,a0,48
    80000e58:	07f57513          	and	a0,a0,127
    80000e5c:	378000ef          	jal	800011d4 <uart_putc>
    80000e60:	e3dff06f          	j	80000c9c <printf_color+0x6c>
    80000e64:	00004517          	auipc	a0,0x4
    80000e68:	27c50513          	add	a0,a0,636 # 800050e0 <rodata_start+0x10e0>
    80000e6c:	380000ef          	jal	800011ec <uart_puts>
    80000e70:	ea5ff06f          	j	80000d14 <printf_color+0xe4>
    80000e74:	fff00a93          	li	s5,-1
    80000e78:	eb5ff06f          	j	80000d2c <printf_color+0xfc>

0000000080000e7c <printf>:
    80000e7c:	f6010113          	add	sp,sp,-160
    80000e80:	04113c23          	sd	ra,88(sp)
    80000e84:	04813823          	sd	s0,80(sp)
    80000e88:	04913423          	sd	s1,72(sp)
    80000e8c:	05213023          	sd	s2,64(sp)
    80000e90:	03313c23          	sd	s3,56(sp)
    80000e94:	03413823          	sd	s4,48(sp)
    80000e98:	03513423          	sd	s5,40(sp)
    80000e9c:	03613023          	sd	s6,32(sp)
    80000ea0:	01713c23          	sd	s7,24(sp)
    80000ea4:	06b13423          	sd	a1,104(sp)
    80000ea8:	06c13823          	sd	a2,112(sp)
    80000eac:	06d13c23          	sd	a3,120(sp)
    80000eb0:	08e13023          	sd	a4,128(sp)
    80000eb4:	08f13423          	sd	a5,136(sp)
    80000eb8:	09013823          	sd	a6,144(sp)
    80000ebc:	09113c23          	sd	a7,152(sp)
    80000ec0:	20050c63          	beqz	a0,800010d8 <printf+0x25c>
    80000ec4:	00050413          	mv	s0,a0
    80000ec8:	00054503          	lbu	a0,0(a0)
    80000ecc:	06810793          	add	a5,sp,104
    80000ed0:	00f13423          	sd	a5,8(sp)
    80000ed4:	00000b13          	li	s6,0
    80000ed8:	06050c63          	beqz	a0,80000f50 <printf+0xd4>
    80000edc:	02500493          	li	s1,37
    80000ee0:	06c00993          	li	s3,108
    80000ee4:	02000a13          	li	s4,32
    80000ee8:	00004917          	auipc	s2,0x4
    80000eec:	3b490913          	add	s2,s2,948 # 8000529c <rodata_start+0x129c>
    80000ef0:	00004a97          	auipc	s5,0x4
    80000ef4:	430a8a93          	add	s5,s5,1072 # 80005320 <rodata_start+0x1320>
    80000ef8:	04951463          	bne	a0,s1,80000f40 <printf+0xc4>
    80000efc:	00144783          	lbu	a5,1(s0)
    80000f00:	18078e63          	beqz	a5,8000109c <printf+0x220>
    80000f04:	11378063          	beq	a5,s3,80001004 <printf+0x188>
    80000f08:	00140413          	add	s0,s0,1
    80000f0c:	16978863          	beq	a5,s1,8000107c <printf+0x200>
    80000f10:	fa87879b          	addw	a5,a5,-88
    80000f14:	0ff7f793          	zext.b	a5,a5
    80000f18:	00fa6c63          	bltu	s4,a5,80000f30 <printf+0xb4>
    80000f1c:	00279793          	sll	a5,a5,0x2
    80000f20:	012787b3          	add	a5,a5,s2
    80000f24:	0007a783          	lw	a5,0(a5)
    80000f28:	012787b3          	add	a5,a5,s2
    80000f2c:	00078067          	jr	a5
    80000f30:	02500513          	li	a0,37
    80000f34:	2a0000ef          	jal	800011d4 <uart_putc>
    80000f38:	00044503          	lbu	a0,0(s0)
    80000f3c:	ffe00b13          	li	s6,-2
    80000f40:	294000ef          	jal	800011d4 <uart_putc>
    80000f44:	00144503          	lbu	a0,1(s0)
    80000f48:	00140413          	add	s0,s0,1
    80000f4c:	fa0516e3          	bnez	a0,80000ef8 <printf+0x7c>
    80000f50:	05813083          	ld	ra,88(sp)
    80000f54:	05013403          	ld	s0,80(sp)
    80000f58:	04813483          	ld	s1,72(sp)
    80000f5c:	04013903          	ld	s2,64(sp)
    80000f60:	03813983          	ld	s3,56(sp)
    80000f64:	03013a03          	ld	s4,48(sp)
    80000f68:	02813a83          	ld	s5,40(sp)
    80000f6c:	01813b83          	ld	s7,24(sp)
    80000f70:	000b0513          	mv	a0,s6
    80000f74:	02013b03          	ld	s6,32(sp)
    80000f78:	0a010113          	add	sp,sp,160
    80000f7c:	00008067          	ret
    80000f80:	00813783          	ld	a5,8(sp)
    80000f84:	00000613          	li	a2,0
    80000f88:	01000593          	li	a1,16
    80000f8c:	0007a503          	lw	a0,0(a5)
    80000f90:	00878793          	add	a5,a5,8
    80000f94:	00f13423          	sd	a5,8(sp)
    80000f98:	96dff0ef          	jal	80000904 <print_number>
    80000f9c:	fa9ff06f          	j	80000f44 <printf+0xc8>
    80000fa0:	00813783          	ld	a5,8(sp)
    80000fa4:	0007c503          	lbu	a0,0(a5)
    80000fa8:	00878793          	add	a5,a5,8
    80000fac:	00f13423          	sd	a5,8(sp)
    80000fb0:	224000ef          	jal	800011d4 <uart_putc>
    80000fb4:	f91ff06f          	j	80000f44 <printf+0xc8>
    80000fb8:	00813783          	ld	a5,8(sp)
    80000fbc:	0007bb83          	ld	s7,0(a5)
    80000fc0:	00878793          	add	a5,a5,8
    80000fc4:	00f13423          	sd	a5,8(sp)
    80000fc8:	000b9863          	bnez	s7,80000fd8 <printf+0x15c>
    80000fcc:	0e80006f          	j	800010b4 <printf+0x238>
    80000fd0:	001b8b93          	add	s7,s7,1
    80000fd4:	200000ef          	jal	800011d4 <uart_putc>
    80000fd8:	000bc503          	lbu	a0,0(s7)
    80000fdc:	fe051ae3          	bnez	a0,80000fd0 <printf+0x154>
    80000fe0:	f65ff06f          	j	80000f44 <printf+0xc8>
    80000fe4:	00813783          	ld	a5,8(sp)
    80000fe8:	00100613          	li	a2,1
    80000fec:	00a00593          	li	a1,10
    80000ff0:	0007a503          	lw	a0,0(a5)
    80000ff4:	00878793          	add	a5,a5,8
    80000ff8:	00f13423          	sd	a5,8(sp)
    80000ffc:	909ff0ef          	jal	80000904 <print_number>
    80001000:	f45ff06f          	j	80000f44 <printf+0xc8>
    80001004:	00244783          	lbu	a5,2(s0)
    80001008:	00240413          	add	s0,s0,2
    8000100c:	0a078c63          	beqz	a5,800010c4 <printf+0x248>
    80001010:	06978663          	beq	a5,s1,8000107c <printf+0x200>
    80001014:	fa87879b          	addw	a5,a5,-88
    80001018:	0ff7f793          	zext.b	a5,a5
    8000101c:	06fa6663          	bltu	s4,a5,80001088 <printf+0x20c>
    80001020:	00279793          	sll	a5,a5,0x2
    80001024:	015787b3          	add	a5,a5,s5
    80001028:	0007a783          	lw	a5,0(a5)
    8000102c:	015787b3          	add	a5,a5,s5
    80001030:	00078067          	jr	a5
    80001034:	00813783          	ld	a5,8(sp)
    80001038:	0007b503          	ld	a0,0(a5)
    8000103c:	00878793          	add	a5,a5,8
    80001040:	00f13423          	sd	a5,8(sp)
    80001044:	06050263          	beqz	a0,800010a8 <printf+0x22c>
    80001048:	00000613          	li	a2,0
    8000104c:	01000593          	li	a1,16
    80001050:	989ff0ef          	jal	800009d8 <print_number_long.part.0>
    80001054:	ef1ff06f          	j	80000f44 <printf+0xc8>
    80001058:	00813783          	ld	a5,8(sp)
    8000105c:	0007b503          	ld	a0,0(a5)
    80001060:	00878793          	add	a5,a5,8
    80001064:	00f13423          	sd	a5,8(sp)
    80001068:	04050063          	beqz	a0,800010a8 <printf+0x22c>
    8000106c:	00100613          	li	a2,1
    80001070:	00a00593          	li	a1,10
    80001074:	965ff0ef          	jal	800009d8 <print_number_long.part.0>
    80001078:	ecdff06f          	j	80000f44 <printf+0xc8>
    8000107c:	02500513          	li	a0,37
    80001080:	154000ef          	jal	800011d4 <uart_putc>
    80001084:	ec1ff06f          	j	80000f44 <printf+0xc8>
    80001088:	02500513          	li	a0,37
    8000108c:	148000ef          	jal	800011d4 <uart_putc>
    80001090:	06c00513          	li	a0,108
    80001094:	140000ef          	jal	800011d4 <uart_putc>
    80001098:	ea1ff06f          	j	80000f38 <printf+0xbc>
    8000109c:	02500513          	li	a0,37
    800010a0:	134000ef          	jal	800011d4 <uart_putc>
    800010a4:	eadff06f          	j	80000f50 <printf+0xd4>
    800010a8:	03000513          	li	a0,48
    800010ac:	128000ef          	jal	800011d4 <uart_putc>
    800010b0:	e95ff06f          	j	80000f44 <printf+0xc8>
    800010b4:	00004517          	auipc	a0,0x4
    800010b8:	02c50513          	add	a0,a0,44 # 800050e0 <rodata_start+0x10e0>
    800010bc:	130000ef          	jal	800011ec <uart_puts>
    800010c0:	e85ff06f          	j	80000f44 <printf+0xc8>
    800010c4:	02500513          	li	a0,37
    800010c8:	10c000ef          	jal	800011d4 <uart_putc>
    800010cc:	06c00513          	li	a0,108
    800010d0:	104000ef          	jal	800011d4 <uart_putc>
    800010d4:	e7dff06f          	j	80000f50 <printf+0xd4>
    800010d8:	fff00b13          	li	s6,-1
    800010dc:	e75ff06f          	j	80000f50 <printf+0xd4>

00000000800010e0 <test_printf_basic>:
    800010e0:	ff010113          	add	sp,sp,-16
    800010e4:	02a00593          	li	a1,42
    800010e8:	00004517          	auipc	a0,0x4
    800010ec:	00850513          	add	a0,a0,8 # 800050f0 <rodata_start+0x10f0>
    800010f0:	00113423          	sd	ra,8(sp)
    800010f4:	d89ff0ef          	jal	80000e7c <printf>
    800010f8:	f8500593          	li	a1,-123
    800010fc:	00004517          	auipc	a0,0x4
    80001100:	00c50513          	add	a0,a0,12 # 80005108 <rodata_start+0x1108>
    80001104:	d79ff0ef          	jal	80000e7c <printf>
    80001108:	00000593          	li	a1,0
    8000110c:	00004517          	auipc	a0,0x4
    80001110:	01450513          	add	a0,a0,20 # 80005120 <rodata_start+0x1120>
    80001114:	d69ff0ef          	jal	80000e7c <printf>
    80001118:	000015b7          	lui	a1,0x1
    8000111c:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80001120:	00004517          	auipc	a0,0x4
    80001124:	01850513          	add	a0,a0,24 # 80005138 <rodata_start+0x1138>
    80001128:	d55ff0ef          	jal	80000e7c <printf>
    8000112c:	00004597          	auipc	a1,0x4
    80001130:	02458593          	add	a1,a1,36 # 80005150 <rodata_start+0x1150>
    80001134:	00004517          	auipc	a0,0x4
    80001138:	02450513          	add	a0,a0,36 # 80005158 <rodata_start+0x1158>
    8000113c:	d41ff0ef          	jal	80000e7c <printf>
    80001140:	05800593          	li	a1,88
    80001144:	00004517          	auipc	a0,0x4
    80001148:	02c50513          	add	a0,a0,44 # 80005170 <rodata_start+0x1170>
    8000114c:	d31ff0ef          	jal	80000e7c <printf>
    80001150:	00813083          	ld	ra,8(sp)
    80001154:	00004517          	auipc	a0,0x4
    80001158:	03450513          	add	a0,a0,52 # 80005188 <rodata_start+0x1188>
    8000115c:	01010113          	add	sp,sp,16
    80001160:	d1dff06f          	j	80000e7c <printf>

0000000080001164 <test_printf_edge_cases>:
    80001164:	800005b7          	lui	a1,0x80000
    80001168:	ff010113          	add	sp,sp,-16
    8000116c:	fff5c593          	not	a1,a1
    80001170:	00004517          	auipc	a0,0x4
    80001174:	03050513          	add	a0,a0,48 # 800051a0 <rodata_start+0x11a0>
    80001178:	00113423          	sd	ra,8(sp)
    8000117c:	d01ff0ef          	jal	80000e7c <printf>
    80001180:	800005b7          	lui	a1,0x80000
    80001184:	00004517          	auipc	a0,0x4
    80001188:	02c50513          	add	a0,a0,44 # 800051b0 <rodata_start+0x11b0>
    8000118c:	cf1ff0ef          	jal	80000e7c <printf>
    80001190:	00000593          	li	a1,0
    80001194:	00004517          	auipc	a0,0x4
    80001198:	02c50513          	add	a0,a0,44 # 800051c0 <rodata_start+0x11c0>
    8000119c:	ce1ff0ef          	jal	80000e7c <printf>
    800011a0:	00004597          	auipc	a1,0x4
    800011a4:	dd058593          	add	a1,a1,-560 # 80004f70 <rodata_start+0xf70>
    800011a8:	00004517          	auipc	a0,0x4
    800011ac:	03050513          	add	a0,a0,48 # 800051d8 <rodata_start+0x11d8>
    800011b0:	ccdff0ef          	jal	80000e7c <printf>
    800011b4:	00004517          	auipc	a0,0x4
    800011b8:	03c50513          	add	a0,a0,60 # 800051f0 <rodata_start+0x11f0>
    800011bc:	cc1ff0ef          	jal	80000e7c <printf>
    800011c0:	00813083          	ld	ra,8(sp)
    800011c4:	00004517          	auipc	a0,0x4
    800011c8:	03c50513          	add	a0,a0,60 # 80005200 <rodata_start+0x1200>
    800011cc:	01010113          	add	sp,sp,16
    800011d0:	cadff06f          	j	80000e7c <printf>

00000000800011d4 <uart_putc>:
    800011d4:	10000737          	lui	a4,0x10000
    800011d8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800011dc:	0207f793          	and	a5,a5,32
    800011e0:	fe078ce3          	beqz	a5,800011d8 <uart_putc+0x4>
    800011e4:	00a70023          	sb	a0,0(a4)
    800011e8:	00008067          	ret

00000000800011ec <uart_puts>:
    800011ec:	00054683          	lbu	a3,0(a0)
    800011f0:	02068263          	beqz	a3,80001214 <uart_puts+0x28>
    800011f4:	10000737          	lui	a4,0x10000
    800011f8:	00150513          	add	a0,a0,1
    800011fc:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80001200:	0207f793          	and	a5,a5,32
    80001204:	fe078ce3          	beqz	a5,800011fc <uart_puts+0x10>
    80001208:	00d70023          	sb	a3,0(a4)
    8000120c:	00054683          	lbu	a3,0(a0)
    80001210:	fe0694e3          	bnez	a3,800011f8 <uart_puts+0xc>
    80001214:	00008067          	ret

0000000080001218 <pmm_init>:
    80001218:	000017b7          	lui	a5,0x1
    8000121c:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001220:	00f50533          	add	a0,a0,a5
    80001224:	fffff737          	lui	a4,0xfffff
    80001228:	00e57533          	and	a0,a0,a4
    8000122c:	00e5f5b3          	and	a1,a1,a4
    80001230:	00425797          	auipc	a5,0x425
    80001234:	f8a7b823          	sd	a0,-112(a5) # 804261c0 <mem_start>
    80001238:	00425797          	auipc	a5,0x425
    8000123c:	f8b7b023          	sd	a1,-128(a5) # 804261b8 <mem_end>
    80001240:	00425797          	auipc	a5,0x425
    80001244:	f807b423          	sd	zero,-120(a5) # 804261c8 <freelist>
    80001248:	02b57e63          	bgeu	a0,a1,80001284 <pmm_init+0x6c>
    8000124c:	02050e63          	beqz	a0,80001288 <pmm_init+0x70>
    80001250:	00050793          	mv	a5,a0
    80001254:	00000613          	li	a2,0
    80001258:	00000693          	li	a3,0
    8000125c:	00a7e863          	bltu	a5,a0,8000126c <pmm_init+0x54>
    80001260:	00d7b023          	sd	a3,0(a5)
    80001264:	00100613          	li	a2,1
    80001268:	00078693          	mv	a3,a5
    8000126c:	00001737          	lui	a4,0x1
    80001270:	00e787b3          	add	a5,a5,a4
    80001274:	feb7e4e3          	bltu	a5,a1,8000125c <pmm_init+0x44>
    80001278:	00060663          	beqz	a2,80001284 <pmm_init+0x6c>
    8000127c:	00425797          	auipc	a5,0x425
    80001280:	f4d7b623          	sd	a3,-180(a5) # 804261c8 <freelist>
    80001284:	00008067          	ret
    80001288:	00000793          	li	a5,0
    8000128c:	00000613          	li	a2,0
    80001290:	00000693          	li	a3,0
    80001294:	fd9ff06f          	j	8000126c <pmm_init+0x54>

0000000080001298 <alloc_page>:
    80001298:	00425797          	auipc	a5,0x425
    8000129c:	f3078793          	add	a5,a5,-208 # 804261c8 <freelist>
    800012a0:	0007b503          	ld	a0,0(a5)
    800012a4:	00050663          	beqz	a0,800012b0 <alloc_page+0x18>
    800012a8:	00053703          	ld	a4,0(a0)
    800012ac:	00e7b023          	sd	a4,0(a5)
    800012b0:	00008067          	ret

00000000800012b4 <free_page>:
    800012b4:	02050c63          	beqz	a0,800012ec <free_page+0x38>
    800012b8:	00425797          	auipc	a5,0x425
    800012bc:	f087b783          	ld	a5,-248(a5) # 804261c0 <mem_start>
    800012c0:	02f56663          	bltu	a0,a5,800012ec <free_page+0x38>
    800012c4:	00425797          	auipc	a5,0x425
    800012c8:	ef47b783          	ld	a5,-268(a5) # 804261b8 <mem_end>
    800012cc:	02f57063          	bgeu	a0,a5,800012ec <free_page+0x38>
    800012d0:	03451793          	sll	a5,a0,0x34
    800012d4:	00079c63          	bnez	a5,800012ec <free_page+0x38>
    800012d8:	00425797          	auipc	a5,0x425
    800012dc:	ef078793          	add	a5,a5,-272 # 804261c8 <freelist>
    800012e0:	0007b703          	ld	a4,0(a5)
    800012e4:	00a7b023          	sd	a0,0(a5)
    800012e8:	00e53023          	sd	a4,0(a0)
    800012ec:	00008067          	ret

00000000800012f0 <alloc_pages>:
    800012f0:	00050613          	mv	a2,a0
    800012f4:	08a05863          	blez	a0,80001384 <alloc_pages+0x94>
    800012f8:	00425317          	auipc	t1,0x425
    800012fc:	ed030313          	add	t1,t1,-304 # 804261c8 <freelist>
    80001300:	00100793          	li	a5,1
    80001304:	00033803          	ld	a6,0(t1)
    80001308:	06f50463          	beq	a0,a5,80001370 <alloc_pages+0x80>
    8000130c:	06080c63          	beqz	a6,80001384 <alloc_pages+0x94>
    80001310:	00083503          	ld	a0,0(a6)
    80001314:	00080793          	mv	a5,a6
    80001318:	00100713          	li	a4,1
    8000131c:	00000893          	li	a7,0
    80001320:	000015b7          	lui	a1,0x1
    80001324:	0200006f          	j	80001344 <alloc_pages+0x54>
    80001328:	02d50463          	beq	a0,a3,80001350 <alloc_pages+0x60>
    8000132c:	00053683          	ld	a3,0(a0)
    80001330:	00078893          	mv	a7,a5
    80001334:	00050813          	mv	a6,a0
    80001338:	00100713          	li	a4,1
    8000133c:	00050793          	mv	a5,a0
    80001340:	00068513          	mv	a0,a3
    80001344:	00b786b3          	add	a3,a5,a1
    80001348:	fe0510e3          	bnez	a0,80001328 <alloc_pages+0x38>
    8000134c:	00008067          	ret
    80001350:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80001354:	00053683          	ld	a3,0(a0)
    80001358:	fee612e3          	bne	a2,a4,8000133c <alloc_pages+0x4c>
    8000135c:	02088863          	beqz	a7,8000138c <alloc_pages+0x9c>
    80001360:	00d8b023          	sd	a3,0(a7)
    80001364:	00053023          	sd	zero,0(a0)
    80001368:	00080513          	mv	a0,a6
    8000136c:	00008067          	ret
    80001370:	00080663          	beqz	a6,8000137c <alloc_pages+0x8c>
    80001374:	00083783          	ld	a5,0(a6)
    80001378:	00f33023          	sd	a5,0(t1)
    8000137c:	00080513          	mv	a0,a6
    80001380:	00008067          	ret
    80001384:	00000513          	li	a0,0
    80001388:	00008067          	ret
    8000138c:	00053023          	sd	zero,0(a0)
    80001390:	00d33023          	sd	a3,0(t1)
    80001394:	00080513          	mv	a0,a6
    80001398:	00008067          	ret

000000008000139c <walk_lookup>:
    8000139c:	01e5d793          	srl	a5,a1,0x1e
    800013a0:	1ff7f793          	and	a5,a5,511
    800013a4:	00379793          	sll	a5,a5,0x3
    800013a8:	00f50533          	add	a0,a0,a5
    800013ac:	00053703          	ld	a4,0(a0)
    800013b0:	00177793          	and	a5,a4,1
    800013b4:	04078a63          	beqz	a5,80001408 <walk_lookup+0x6c>
    800013b8:	00e77793          	and	a5,a4,14
    800013bc:	04079663          	bnez	a5,80001408 <walk_lookup+0x6c>
    800013c0:	0155d793          	srl	a5,a1,0x15
    800013c4:	00a75713          	srl	a4,a4,0xa
    800013c8:	1ff7f793          	and	a5,a5,511
    800013cc:	00c71713          	sll	a4,a4,0xc
    800013d0:	00379793          	sll	a5,a5,0x3
    800013d4:	00e787b3          	add	a5,a5,a4
    800013d8:	0007b503          	ld	a0,0(a5)
    800013dc:	00157793          	and	a5,a0,1
    800013e0:	02078463          	beqz	a5,80001408 <walk_lookup+0x6c>
    800013e4:	00e57793          	and	a5,a0,14
    800013e8:	02079063          	bnez	a5,80001408 <walk_lookup+0x6c>
    800013ec:	00c5d593          	srl	a1,a1,0xc
    800013f0:	00a55513          	srl	a0,a0,0xa
    800013f4:	1ff5f593          	and	a1,a1,511
    800013f8:	00359593          	sll	a1,a1,0x3
    800013fc:	00c51513          	sll	a0,a0,0xc
    80001400:	00b50533          	add	a0,a0,a1
    80001404:	00008067          	ret
    80001408:	00000513          	li	a0,0
    8000140c:	00008067          	ret

0000000080001410 <free_swap_slot.part.0>:
    80001410:	0055579b          	srlw	a5,a0,0x5
    80001414:	00010617          	auipc	a2,0x10
    80001418:	bec60613          	add	a2,a2,-1044 # 80011000 <swap_mgr>
    8000141c:	00279793          	sll	a5,a5,0x2
    80001420:	00f607b3          	add	a5,a2,a5
    80001424:	0007a583          	lw	a1,0(a5)
    80001428:	00100713          	li	a4,1
    8000142c:	00a7173b          	sllw	a4,a4,a0
    80001430:	00e5f6b3          	and	a3,a1,a4
    80001434:	0006869b          	sext.w	a3,a3
    80001438:	02068463          	beqz	a3,80001460 <free_swap_slot.part.0+0x50>
    8000143c:	08862683          	lw	a3,136(a2)
    80001440:	fff74713          	not	a4,a4
    80001444:	08062803          	lw	a6,128(a2)
    80001448:	00e5f5b3          	and	a1,a1,a4
    8000144c:	fff6871b          	addw	a4,a3,-1
    80001450:	00b7a023          	sw	a1,0(a5)
    80001454:	08e62423          	sw	a4,136(a2)
    80001458:	01057463          	bgeu	a0,a6,80001460 <free_swap_slot.part.0+0x50>
    8000145c:	08a62023          	sw	a0,128(a2)
    80001460:	00008067          	ret

0000000080001464 <create_pagetable>:
    80001464:	ff010113          	add	sp,sp,-16
    80001468:	00113423          	sd	ra,8(sp)
    8000146c:	e2dff0ef          	jal	80001298 <alloc_page>
    80001470:	00050e63          	beqz	a0,8000148c <create_pagetable+0x28>
    80001474:	00001737          	lui	a4,0x1
    80001478:	00050793          	mv	a5,a0
    8000147c:	00e50733          	add	a4,a0,a4
    80001480:	0007b023          	sd	zero,0(a5)
    80001484:	00878793          	add	a5,a5,8
    80001488:	fee79ce3          	bne	a5,a4,80001480 <create_pagetable+0x1c>
    8000148c:	00813083          	ld	ra,8(sp)
    80001490:	01010113          	add	sp,sp,16
    80001494:	00008067          	ret

0000000080001498 <map_page>:
    80001498:	00c5e7b3          	or	a5,a1,a2
    8000149c:	03479713          	sll	a4,a5,0x34
    800014a0:	20071863          	bnez	a4,800016b0 <map_page+0x218>
    800014a4:	fc010113          	add	sp,sp,-64
    800014a8:	02913423          	sd	s1,40(sp)
    800014ac:	03213023          	sd	s2,32(sp)
    800014b0:	01313c23          	sd	s3,24(sp)
    800014b4:	01413823          	sd	s4,16(sp)
    800014b8:	01513423          	sd	s5,8(sp)
    800014bc:	01613023          	sd	s6,0(sp)
    800014c0:	02113c23          	sd	ra,56(sp)
    800014c4:	02813823          	sd	s0,48(sp)
    800014c8:	00058493          	mv	s1,a1
    800014cc:	00060913          	mv	s2,a2
    800014d0:	00050a13          	mv	s4,a0
    800014d4:	00068993          	mv	s3,a3
    800014d8:	00050813          	mv	a6,a0
    800014dc:	00200a93          	li	s5,2
    800014e0:	00200793          	li	a5,2
    800014e4:	00100b13          	li	s6,1
    800014e8:	0037941b          	sllw	s0,a5,0x3
    800014ec:	00f4043b          	addw	s0,s0,a5
    800014f0:	00c4041b          	addw	s0,s0,12
    800014f4:	0084d433          	srl	s0,s1,s0
    800014f8:	1ff47413          	and	s0,s0,511
    800014fc:	00341413          	sll	s0,s0,0x3
    80001500:	00880433          	add	s0,a6,s0
    80001504:	00043783          	ld	a5,0(s0)
    80001508:	0017f713          	and	a4,a5,1
    8000150c:	14070e63          	beqz	a4,80001668 <map_page+0x1d0>
    80001510:	00e7f713          	and	a4,a5,14
    80001514:	18071a63          	bnez	a4,800016a8 <map_page+0x210>
    80001518:	00a7d793          	srl	a5,a5,0xa
    8000151c:	00c79813          	sll	a6,a5,0xc
    80001520:	00100793          	li	a5,1
    80001524:	016a8663          	beq	s5,s6,80001530 <map_page+0x98>
    80001528:	00100a93          	li	s5,1
    8000152c:	fbdff06f          	j	800014e8 <map_page+0x50>
    80001530:	00c4d793          	srl	a5,s1,0xc
    80001534:	1ff7f793          	and	a5,a5,511
    80001538:	00379793          	sll	a5,a5,0x3
    8000153c:	00f80833          	add	a6,a6,a5
    80001540:	16080463          	beqz	a6,800016a8 <map_page+0x210>
    80001544:	00083783          	ld	a5,0(a6)
    80001548:	0017f793          	and	a5,a5,1
    8000154c:	14079e63          	bnez	a5,800016a8 <map_page+0x210>
    80001550:	00c95793          	srl	a5,s2,0xc
    80001554:	00a79793          	sll	a5,a5,0xa
    80001558:	00413597          	auipc	a1,0x413
    8000155c:	b3858593          	add	a1,a1,-1224 # 80414090 <lru_mgr+0x3000>
    80001560:	0145a703          	lw	a4,20(a1)
    80001564:	0137e7b3          	or	a5,a5,s3
    80001568:	0017e793          	or	a5,a5,1
    8000156c:	00f83023          	sd	a5,0(a6)
    80001570:	0c070663          	beqz	a4,8000163c <map_page+0x1a4>
    80001574:	00410717          	auipc	a4,0x410
    80001578:	b4070713          	add	a4,a4,-1216 # 804110b4 <lru_mgr+0x24>
    8000157c:	00000793          	li	a5,0
    80001580:	10000693          	li	a3,256
    80001584:	00c0006f          	j	80001590 <map_page+0xf8>
    80001588:	0017879b          	addw	a5,a5,1
    8000158c:	0ad78863          	beq	a5,a3,8000163c <map_page+0x1a4>
    80001590:	00072803          	lw	a6,0(a4)
    80001594:	03070713          	add	a4,a4,48
    80001598:	fe0818e3          	bnez	a6,80001588 <map_page+0xf0>
    8000159c:	00178813          	add	a6,a5,1
    800015a0:	00181513          	sll	a0,a6,0x1
    800015a4:	00179713          	sll	a4,a5,0x1
    800015a8:	01050533          	add	a0,a0,a6
    800015ac:	00410617          	auipc	a2,0x410
    800015b0:	ae460613          	add	a2,a2,-1308 # 80411090 <lru_mgr>
    800015b4:	00f706b3          	add	a3,a4,a5
    800015b8:	00451513          	sll	a0,a0,0x4
    800015bc:	00469693          	sll	a3,a3,0x4
    800015c0:	00a60533          	add	a0,a2,a0
    800015c4:	fffff337          	lui	t1,0xfffff
    800015c8:	00d608b3          	add	a7,a2,a3
    800015cc:	0064f4b3          	and	s1,s1,t1
    800015d0:	01453423          	sd	s4,8(a0)
    800015d4:	fff00513          	li	a0,-1
    800015d8:	01068693          	add	a3,a3,16
    800015dc:	0098b823          	sd	s1,16(a7)
    800015e0:	0128bc23          	sd	s2,24(a7)
    800015e4:	02a8a023          	sw	a0,32(a7)
    800015e8:	0049f993          	and	s3,s3,4
    800015ec:	00d606b3          	add	a3,a2,a3
    800015f0:	00098463          	beqz	s3,800015f8 <map_page+0x160>
    800015f4:	00500a93          	li	s5,5
    800015f8:	00181513          	sll	a0,a6,0x1
    800015fc:	00f707b3          	add	a5,a4,a5
    80001600:	00063883          	ld	a7,0(a2)
    80001604:	01050733          	add	a4,a0,a6
    80001608:	00479793          	sll	a5,a5,0x4
    8000160c:	00471713          	sll	a4,a4,0x4
    80001610:	00f607b3          	add	a5,a2,a5
    80001614:	00e60733          	add	a4,a2,a4
    80001618:	0357a223          	sw	s5,36(a5)
    8000161c:	01173023          	sd	a7,0(a4)
    80001620:	0207b423          	sd	zero,40(a5)
    80001624:	06088e63          	beqz	a7,800016a0 <map_page+0x208>
    80001628:	00d8bc23          	sd	a3,24(a7)
    8000162c:	0105a783          	lw	a5,16(a1)
    80001630:	00d63023          	sd	a3,0(a2)
    80001634:	0017879b          	addw	a5,a5,1
    80001638:	00f5a823          	sw	a5,16(a1)
    8000163c:	00000513          	li	a0,0
    80001640:	03813083          	ld	ra,56(sp)
    80001644:	03013403          	ld	s0,48(sp)
    80001648:	02813483          	ld	s1,40(sp)
    8000164c:	02013903          	ld	s2,32(sp)
    80001650:	01813983          	ld	s3,24(sp)
    80001654:	01013a03          	ld	s4,16(sp)
    80001658:	00813a83          	ld	s5,8(sp)
    8000165c:	00013b03          	ld	s6,0(sp)
    80001660:	04010113          	add	sp,sp,64
    80001664:	00008067          	ret
    80001668:	c31ff0ef          	jal	80001298 <alloc_page>
    8000166c:	00050813          	mv	a6,a0
    80001670:	02050c63          	beqz	a0,800016a8 <map_page+0x210>
    80001674:	00001737          	lui	a4,0x1
    80001678:	00e50733          	add	a4,a0,a4
    8000167c:	00050793          	mv	a5,a0
    80001680:	0007b023          	sd	zero,0(a5)
    80001684:	00878793          	add	a5,a5,8
    80001688:	fee79ce3          	bne	a5,a4,80001680 <map_page+0x1e8>
    8000168c:	00c85793          	srl	a5,a6,0xc
    80001690:	00a79793          	sll	a5,a5,0xa
    80001694:	0017e793          	or	a5,a5,1
    80001698:	00f43023          	sd	a5,0(s0)
    8000169c:	e85ff06f          	j	80001520 <map_page+0x88>
    800016a0:	00d63423          	sd	a3,8(a2)
    800016a4:	f89ff06f          	j	8000162c <map_page+0x194>
    800016a8:	fff00513          	li	a0,-1
    800016ac:	f95ff06f          	j	80001640 <map_page+0x1a8>
    800016b0:	fff00513          	li	a0,-1
    800016b4:	00008067          	ret

00000000800016b8 <map_region>:
    800016b8:	000017b7          	lui	a5,0x1
    800016bc:	fc010113          	add	sp,sp,-64
    800016c0:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800016c4:	02913423          	sd	s1,40(sp)
    800016c8:	00f684b3          	add	s1,a3,a5
    800016cc:	00b484b3          	add	s1,s1,a1
    800016d0:	fffff7b7          	lui	a5,0xfffff
    800016d4:	02113c23          	sd	ra,56(sp)
    800016d8:	02813823          	sd	s0,48(sp)
    800016dc:	03213023          	sd	s2,32(sp)
    800016e0:	01313c23          	sd	s3,24(sp)
    800016e4:	01413823          	sd	s4,16(sp)
    800016e8:	01513423          	sd	s5,8(sp)
    800016ec:	00f4f4b3          	and	s1,s1,a5
    800016f0:	0495f263          	bgeu	a1,s1,80001734 <map_region+0x7c>
    800016f4:	00058413          	mv	s0,a1
    800016f8:	00050993          	mv	s3,a0
    800016fc:	00070a13          	mv	s4,a4
    80001700:	40b60933          	sub	s2,a2,a1
    80001704:	00001ab7          	lui	s5,0x1
    80001708:	0080006f          	j	80001710 <map_region+0x58>
    8000170c:	02947463          	bgeu	s0,s1,80001734 <map_region+0x7c>
    80001710:	00890633          	add	a2,s2,s0
    80001714:	00040593          	mv	a1,s0
    80001718:	000a0693          	mv	a3,s4
    8000171c:	00098513          	mv	a0,s3
    80001720:	d79ff0ef          	jal	80001498 <map_page>
    80001724:	01540433          	add	s0,s0,s5
    80001728:	fe0502e3          	beqz	a0,8000170c <map_region+0x54>
    8000172c:	fff00513          	li	a0,-1
    80001730:	0080006f          	j	80001738 <map_region+0x80>
    80001734:	00000513          	li	a0,0
    80001738:	03813083          	ld	ra,56(sp)
    8000173c:	03013403          	ld	s0,48(sp)
    80001740:	02813483          	ld	s1,40(sp)
    80001744:	02013903          	ld	s2,32(sp)
    80001748:	01813983          	ld	s3,24(sp)
    8000174c:	01013a03          	ld	s4,16(sp)
    80001750:	00813a83          	ld	s5,8(sp)
    80001754:	04010113          	add	sp,sp,64
    80001758:	00008067          	ret

000000008000175c <destroy_pagetable>:
    8000175c:	f0010113          	add	sp,sp,-256
    80001760:	000017b7          	lui	a5,0x1
    80001764:	0e813823          	sd	s0,240(sp)
    80001768:	0f213023          	sd	s2,224(sp)
    8000176c:	0d613023          	sd	s6,192(sp)
    80001770:	0b713c23          	sd	s7,184(sp)
    80001774:	0e113c23          	sd	ra,248(sp)
    80001778:	0e913423          	sd	s1,232(sp)
    8000177c:	0d313c23          	sd	s3,216(sp)
    80001780:	0d413823          	sd	s4,208(sp)
    80001784:	0d513423          	sd	s5,200(sp)
    80001788:	0b813823          	sd	s8,176(sp)
    8000178c:	0b913423          	sd	s9,168(sp)
    80001790:	0ba13023          	sd	s10,160(sp)
    80001794:	09b13c23          	sd	s11,152(sp)
    80001798:	00050413          	mv	s0,a0
    8000179c:	00050913          	mv	s2,a0
    800017a0:	00f50b33          	add	s6,a0,a5
    800017a4:	00001bb7          	lui	s7,0x1
    800017a8:	00c0006f          	j	800017b4 <destroy_pagetable+0x58>
    800017ac:	00890913          	add	s2,s2,8
    800017b0:	2d690063          	beq	s2,s6,80001a70 <destroy_pagetable+0x314>
    800017b4:	00093783          	ld	a5,0(s2)
    800017b8:	00100713          	li	a4,1
    800017bc:	00f7f693          	and	a3,a5,15
    800017c0:	fee696e3          	bne	a3,a4,800017ac <destroy_pagetable+0x50>
    800017c4:	00a7d793          	srl	a5,a5,0xa
    800017c8:	00c79a13          	sll	s4,a5,0xc
    800017cc:	017a0cb3          	add	s9,s4,s7
    800017d0:	00100d93          	li	s11,1
    800017d4:	000a0a93          	mv	s5,s4
    800017d8:	00040493          	mv	s1,s0
    800017dc:	00c0006f          	j	800017e8 <destroy_pagetable+0x8c>
    800017e0:	008a0a13          	add	s4,s4,8
    800017e4:	279a0c63          	beq	s4,s9,80001a5c <destroy_pagetable+0x300>
    800017e8:	000a3783          	ld	a5,0(s4)
    800017ec:	00f7f713          	and	a4,a5,15
    800017f0:	ffb718e3          	bne	a4,s11,800017e0 <destroy_pagetable+0x84>
    800017f4:	00a7d793          	srl	a5,a5,0xa
    800017f8:	00c79993          	sll	s3,a5,0xc
    800017fc:	00098c13          	mv	s8,s3
    80001800:	01798d33          	add	s10,s3,s7
    80001804:	00098413          	mv	s0,s3
    80001808:	00c0006f          	j	80001814 <destroy_pagetable+0xb8>
    8000180c:	00840413          	add	s0,s0,8
    80001810:	23a40e63          	beq	s0,s10,80001a4c <destroy_pagetable+0x2f0>
    80001814:	00043783          	ld	a5,0(s0)
    80001818:	00f7f713          	and	a4,a5,15
    8000181c:	ffb718e3          	bne	a4,s11,8000180c <destroy_pagetable+0xb0>
    80001820:	00a7d793          	srl	a5,a5,0xa
    80001824:	00c79793          	sll	a5,a5,0xc
    80001828:	00048713          	mv	a4,s1
    8000182c:	03513c23          	sd	s5,56(sp)
    80001830:	00090493          	mv	s1,s2
    80001834:	017789b3          	add	s3,a5,s7
    80001838:	02813823          	sd	s0,48(sp)
    8000183c:	00078a93          	mv	s5,a5
    80001840:	00070913          	mv	s2,a4
    80001844:	00c0006f          	j	80001850 <destroy_pagetable+0xf4>
    80001848:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    8000184c:	1cf98e63          	beq	s3,a5,80001a28 <destroy_pagetable+0x2cc>
    80001850:	0007b703          	ld	a4,0(a5)
    80001854:	00f77693          	and	a3,a4,15
    80001858:	ffb698e3          	bne	a3,s11,80001848 <destroy_pagetable+0xec>
    8000185c:	00a75713          	srl	a4,a4,0xa
    80001860:	00c71713          	sll	a4,a4,0xc
    80001864:	017706b3          	add	a3,a4,s7
    80001868:	05313423          	sd	s3,72(sp)
    8000186c:	00d13423          	sd	a3,8(sp)
    80001870:	05813023          	sd	s8,64(sp)
    80001874:	00070993          	mv	s3,a4
    80001878:	04f13823          	sd	a5,80(sp)
    8000187c:	0100006f          	j	8000188c <destroy_pagetable+0x130>
    80001880:	00813783          	ld	a5,8(sp)
    80001884:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    80001888:	16e78e63          	beq	a5,a4,80001a04 <destroy_pagetable+0x2a8>
    8000188c:	00073783          	ld	a5,0(a4)
    80001890:	00f7f693          	and	a3,a5,15
    80001894:	ffb696e3          	bne	a3,s11,80001880 <destroy_pagetable+0x124>
    80001898:	00a7d793          	srl	a5,a5,0xa
    8000189c:	00c79793          	sll	a5,a5,0xc
    800018a0:	017786b3          	add	a3,a5,s7
    800018a4:	000a8c13          	mv	s8,s5
    800018a8:	00d13c23          	sd	a3,24(sp)
    800018ac:	00078a93          	mv	s5,a5
    800018b0:	04e13c23          	sd	a4,88(sp)
    800018b4:	07213023          	sd	s2,96(sp)
    800018b8:	0100006f          	j	800018c8 <destroy_pagetable+0x16c>
    800018bc:	01813703          	ld	a4,24(sp)
    800018c0:	00878793          	add	a5,a5,8
    800018c4:	10f70c63          	beq	a4,a5,800019dc <destroy_pagetable+0x280>
    800018c8:	0007b703          	ld	a4,0(a5)
    800018cc:	00f77693          	and	a3,a4,15
    800018d0:	ffb696e3          	bne	a3,s11,800018bc <destroy_pagetable+0x160>
    800018d4:	00a75713          	srl	a4,a4,0xa
    800018d8:	00c71913          	sll	s2,a4,0xc
    800018dc:	01790733          	add	a4,s2,s7
    800018e0:	07213423          	sd	s2,104(sp)
    800018e4:	00090413          	mv	s0,s2
    800018e8:	02e13023          	sd	a4,32(sp)
    800018ec:	06f13823          	sd	a5,112(sp)
    800018f0:	00048913          	mv	s2,s1
    800018f4:	0100006f          	j	80001904 <destroy_pagetable+0x1a8>
    800018f8:	02013783          	ld	a5,32(sp)
    800018fc:	00840413          	add	s0,s0,8
    80001900:	0a878c63          	beq	a5,s0,800019b8 <destroy_pagetable+0x25c>
    80001904:	00043783          	ld	a5,0(s0)
    80001908:	00f7f693          	and	a3,a5,15
    8000190c:	ffb696e3          	bne	a3,s11,800018f8 <destroy_pagetable+0x19c>
    80001910:	00a7d793          	srl	a5,a5,0xa
    80001914:	00c79493          	sll	s1,a5,0xc
    80001918:	017487b3          	add	a5,s1,s7
    8000191c:	00913823          	sd	s1,16(sp)
    80001920:	02f13423          	sd	a5,40(sp)
    80001924:	06813c23          	sd	s0,120(sp)
    80001928:	0100006f          	j	80001938 <destroy_pagetable+0x1dc>
    8000192c:	02813783          	ld	a5,40(sp)
    80001930:	00848493          	add	s1,s1,8
    80001934:	06978663          	beq	a5,s1,800019a0 <destroy_pagetable+0x244>
    80001938:	0004b783          	ld	a5,0(s1)
    8000193c:	00f7f693          	and	a3,a5,15
    80001940:	ffb696e3          	bne	a3,s11,8000192c <destroy_pagetable+0x1d0>
    80001944:	00a7d793          	srl	a5,a5,0xa
    80001948:	00c79413          	sll	s0,a5,0xc
    8000194c:	017406b3          	add	a3,s0,s7
    80001950:	09213023          	sd	s2,128(sp)
    80001954:	09613423          	sd	s6,136(sp)
    80001958:	00040913          	mv	s2,s0
    8000195c:	000a0b13          	mv	s6,s4
    80001960:	00048a13          	mv	s4,s1
    80001964:	00068493          	mv	s1,a3
    80001968:	00043783          	ld	a5,0(s0)
    8000196c:	00840413          	add	s0,s0,8
    80001970:	00f7f713          	and	a4,a5,15
    80001974:	13b70e63          	beq	a4,s11,80001ab0 <destroy_pagetable+0x354>
    80001978:	fe8498e3          	bne	s1,s0,80001968 <destroy_pagetable+0x20c>
    8000197c:	00090513          	mv	a0,s2
    80001980:	000a0493          	mv	s1,s4
    80001984:	08013903          	ld	s2,128(sp)
    80001988:	000b0a13          	mv	s4,s6
    8000198c:	08813b03          	ld	s6,136(sp)
    80001990:	925ff0ef          	jal	800012b4 <free_page>
    80001994:	02813783          	ld	a5,40(sp)
    80001998:	00848493          	add	s1,s1,8
    8000199c:	f8979ee3          	bne	a5,s1,80001938 <destroy_pagetable+0x1dc>
    800019a0:	01013503          	ld	a0,16(sp)
    800019a4:	07813403          	ld	s0,120(sp)
    800019a8:	90dff0ef          	jal	800012b4 <free_page>
    800019ac:	02013783          	ld	a5,32(sp)
    800019b0:	00840413          	add	s0,s0,8
    800019b4:	f48798e3          	bne	a5,s0,80001904 <destroy_pagetable+0x1a8>
    800019b8:	07013783          	ld	a5,112(sp)
    800019bc:	06813503          	ld	a0,104(sp)
    800019c0:	00090493          	mv	s1,s2
    800019c4:	00f13823          	sd	a5,16(sp)
    800019c8:	8edff0ef          	jal	800012b4 <free_page>
    800019cc:	01013783          	ld	a5,16(sp)
    800019d0:	01813703          	ld	a4,24(sp)
    800019d4:	00878793          	add	a5,a5,8
    800019d8:	eef718e3          	bne	a4,a5,800018c8 <destroy_pagetable+0x16c>
    800019dc:	05813703          	ld	a4,88(sp)
    800019e0:	000a8513          	mv	a0,s5
    800019e4:	06013903          	ld	s2,96(sp)
    800019e8:	00e13823          	sd	a4,16(sp)
    800019ec:	8c9ff0ef          	jal	800012b4 <free_page>
    800019f0:	01013703          	ld	a4,16(sp)
    800019f4:	00813783          	ld	a5,8(sp)
    800019f8:	000c0a93          	mv	s5,s8
    800019fc:	00870713          	add	a4,a4,8
    80001a00:	e8e796e3          	bne	a5,a4,8000188c <destroy_pagetable+0x130>
    80001a04:	05013783          	ld	a5,80(sp)
    80001a08:	00098513          	mv	a0,s3
    80001a0c:	04013c03          	ld	s8,64(sp)
    80001a10:	00f13423          	sd	a5,8(sp)
    80001a14:	04813983          	ld	s3,72(sp)
    80001a18:	89dff0ef          	jal	800012b4 <free_page>
    80001a1c:	00813783          	ld	a5,8(sp)
    80001a20:	00878793          	add	a5,a5,8
    80001a24:	e2f996e3          	bne	s3,a5,80001850 <destroy_pagetable+0xf4>
    80001a28:	03013403          	ld	s0,48(sp)
    80001a2c:	00090793          	mv	a5,s2
    80001a30:	000a8513          	mv	a0,s5
    80001a34:	00840413          	add	s0,s0,8
    80001a38:	03813a83          	ld	s5,56(sp)
    80001a3c:	00048913          	mv	s2,s1
    80001a40:	00078493          	mv	s1,a5
    80001a44:	871ff0ef          	jal	800012b4 <free_page>
    80001a48:	dda416e3          	bne	s0,s10,80001814 <destroy_pagetable+0xb8>
    80001a4c:	000c0513          	mv	a0,s8
    80001a50:	008a0a13          	add	s4,s4,8
    80001a54:	861ff0ef          	jal	800012b4 <free_page>
    80001a58:	d99a18e3          	bne	s4,s9,800017e8 <destroy_pagetable+0x8c>
    80001a5c:	000a8513          	mv	a0,s5
    80001a60:	00890913          	add	s2,s2,8
    80001a64:	00048413          	mv	s0,s1
    80001a68:	84dff0ef          	jal	800012b4 <free_page>
    80001a6c:	d56914e3          	bne	s2,s6,800017b4 <destroy_pagetable+0x58>
    80001a70:	00040513          	mv	a0,s0
    80001a74:	0f013403          	ld	s0,240(sp)
    80001a78:	0f813083          	ld	ra,248(sp)
    80001a7c:	0e813483          	ld	s1,232(sp)
    80001a80:	0e013903          	ld	s2,224(sp)
    80001a84:	0d813983          	ld	s3,216(sp)
    80001a88:	0d013a03          	ld	s4,208(sp)
    80001a8c:	0c813a83          	ld	s5,200(sp)
    80001a90:	0c013b03          	ld	s6,192(sp)
    80001a94:	0b813b83          	ld	s7,184(sp)
    80001a98:	0b013c03          	ld	s8,176(sp)
    80001a9c:	0a813c83          	ld	s9,168(sp)
    80001aa0:	0a013d03          	ld	s10,160(sp)
    80001aa4:	09813d83          	ld	s11,152(sp)
    80001aa8:	10010113          	add	sp,sp,256
    80001aac:	809ff06f          	j	800012b4 <free_page>
    80001ab0:	00a7d793          	srl	a5,a5,0xa
    80001ab4:	00c79513          	sll	a0,a5,0xc
    80001ab8:	ca5ff0ef          	jal	8000175c <destroy_pagetable>
    80001abc:	ea8496e3          	bne	s1,s0,80001968 <destroy_pagetable+0x20c>
    80001ac0:	ebdff06f          	j	8000197c <destroy_pagetable+0x220>

0000000080001ac4 <kvminithart>:
    80001ac4:	00424797          	auipc	a5,0x424
    80001ac8:	70c7b783          	ld	a5,1804(a5) # 804261d0 <kernel_pagetable>
    80001acc:	fff00713          	li	a4,-1
    80001ad0:	03f71713          	sll	a4,a4,0x3f
    80001ad4:	00c7d793          	srl	a5,a5,0xc
    80001ad8:	00e7e7b3          	or	a5,a5,a4
    80001adc:	18079073          	csrw	satp,a5
    80001ae0:	12000073          	sfence.vma
    80001ae4:	00008067          	ret

0000000080001ae8 <dump_pagetable>:
    80001ae8:	fb010113          	add	sp,sp,-80
    80001aec:	03213823          	sd	s2,48(sp)
    80001af0:	03313423          	sd	s3,40(sp)
    80001af4:	04113423          	sd	ra,72(sp)
    80001af8:	04813023          	sd	s0,64(sp)
    80001afc:	02913c23          	sd	s1,56(sp)
    80001b00:	03413023          	sd	s4,32(sp)
    80001b04:	01513c23          	sd	s5,24(sp)
    80001b08:	01613823          	sd	s6,16(sp)
    80001b0c:	01713423          	sd	s7,8(sp)
    80001b10:	00058993          	mv	s3,a1
    80001b14:	00050913          	mv	s2,a0
    80001b18:	28b05263          	blez	a1,80001d9c <dump_pagetable+0x2b4>
    80001b1c:	00000413          	li	s0,0
    80001b20:	0014041b          	addw	s0,s0,1
    80001b24:	02000513          	li	a0,32
    80001b28:	eacff0ef          	jal	800011d4 <uart_putc>
    80001b2c:	fe899ae3          	bne	s3,s0,80001b20 <dump_pagetable+0x38>
    80001b30:	00004517          	auipc	a0,0x4
    80001b34:	89050513          	add	a0,a0,-1904 # 800053c0 <digits+0x18>
    80001b38:	eb4ff0ef          	jal	800011ec <uart_puts>
    80001b3c:	00900793          	li	a5,9
    80001b40:	2737d463          	bge	a5,s3,80001da8 <dump_pagetable+0x2c0>
    80001b44:	00a00413          	li	s0,10
    80001b48:	0289c53b          	divw	a0,s3,s0
    80001b4c:	0305051b          	addw	a0,a0,48
    80001b50:	0ff57513          	zext.b	a0,a0
    80001b54:	e80ff0ef          	jal	800011d4 <uart_putc>
    80001b58:	0289e53b          	remw	a0,s3,s0
    80001b5c:	0305051b          	addw	a0,a0,48
    80001b60:	0ff57513          	zext.b	a0,a0
    80001b64:	e70ff0ef          	jal	800011d4 <uart_putc>
    80001b68:	00004517          	auipc	a0,0x4
    80001b6c:	87050513          	add	a0,a0,-1936 # 800053d8 <digits+0x30>
    80001b70:	fff00b13          	li	s6,-1
    80001b74:	e78ff0ef          	jal	800011ec <uart_puts>
    80001b78:	00000493          	li	s1,0
    80001b7c:	00cb5b13          	srl	s6,s6,0xc
    80001b80:	00900a13          	li	s4,9
    80001b84:	ffc00a93          	li	s5,-4
    80001b88:	0140006f          	j	80001b9c <dump_pagetable+0xb4>
    80001b8c:	0014849b          	addw	s1,s1,1
    80001b90:	20000793          	li	a5,512
    80001b94:	00890913          	add	s2,s2,8
    80001b98:	0cf48063          	beq	s1,a5,80001c58 <dump_pagetable+0x170>
    80001b9c:	00093783          	ld	a5,0(s2)
    80001ba0:	0017f793          	and	a5,a5,1
    80001ba4:	fe0784e3          	beqz	a5,80001b8c <dump_pagetable+0xa4>
    80001ba8:	00000413          	li	s0,0
    80001bac:	0009ca63          	bltz	s3,80001bc0 <dump_pagetable+0xd8>
    80001bb0:	0014041b          	addw	s0,s0,1
    80001bb4:	02000513          	li	a0,32
    80001bb8:	e1cff0ef          	jal	800011d4 <uart_putc>
    80001bbc:	fe89dae3          	bge	s3,s0,80001bb0 <dump_pagetable+0xc8>
    80001bc0:	00004517          	auipc	a0,0x4
    80001bc4:	82050513          	add	a0,a0,-2016 # 800053e0 <digits+0x38>
    80001bc8:	e24ff0ef          	jal	800011ec <uart_puts>
    80001bcc:	06300793          	li	a5,99
    80001bd0:	1697d263          	bge	a5,s1,80001d34 <dump_pagetable+0x24c>
    80001bd4:	06400413          	li	s0,100
    80001bd8:	0284c53b          	divw	a0,s1,s0
    80001bdc:	00a00b93          	li	s7,10
    80001be0:	0305051b          	addw	a0,a0,48
    80001be4:	0ff57513          	zext.b	a0,a0
    80001be8:	decff0ef          	jal	800011d4 <uart_putc>
    80001bec:	0284e53b          	remw	a0,s1,s0
    80001bf0:	0375453b          	divw	a0,a0,s7
    80001bf4:	0305051b          	addw	a0,a0,48
    80001bf8:	0ff57513          	zext.b	a0,a0
    80001bfc:	dd8ff0ef          	jal	800011d4 <uart_putc>
    80001c00:	0374e53b          	remw	a0,s1,s7
    80001c04:	0305051b          	addw	a0,a0,48
    80001c08:	0ff57513          	zext.b	a0,a0
    80001c0c:	dc8ff0ef          	jal	800011d4 <uart_putc>
    80001c10:	00003517          	auipc	a0,0x3
    80001c14:	7d850513          	add	a0,a0,2008 # 800053e8 <digits+0x40>
    80001c18:	dd4ff0ef          	jal	800011ec <uart_puts>
    80001c1c:	00093b83          	ld	s7,0(s2)
    80001c20:	00ebf793          	and	a5,s7,14
    80001c24:	06079063          	bnez	a5,80001c84 <dump_pagetable+0x19c>
    80001c28:	00003517          	auipc	a0,0x3
    80001c2c:	7d850513          	add	a0,a0,2008 # 80005400 <digits+0x58>
    80001c30:	dbcff0ef          	jal	800011ec <uart_puts>
    80001c34:	00093503          	ld	a0,0(s2)
    80001c38:	0019859b          	addw	a1,s3,1
    80001c3c:	0014849b          	addw	s1,s1,1
    80001c40:	00a55513          	srl	a0,a0,0xa
    80001c44:	00c51513          	sll	a0,a0,0xc
    80001c48:	ea1ff0ef          	jal	80001ae8 <dump_pagetable>
    80001c4c:	20000793          	li	a5,512
    80001c50:	00890913          	add	s2,s2,8
    80001c54:	f4f494e3          	bne	s1,a5,80001b9c <dump_pagetable+0xb4>
    80001c58:	04813083          	ld	ra,72(sp)
    80001c5c:	04013403          	ld	s0,64(sp)
    80001c60:	03813483          	ld	s1,56(sp)
    80001c64:	03013903          	ld	s2,48(sp)
    80001c68:	02813983          	ld	s3,40(sp)
    80001c6c:	02013a03          	ld	s4,32(sp)
    80001c70:	01813a83          	ld	s5,24(sp)
    80001c74:	01013b03          	ld	s6,16(sp)
    80001c78:	00813b83          	ld	s7,8(sp)
    80001c7c:	05010113          	add	sp,sp,80
    80001c80:	00008067          	ret
    80001c84:	00003517          	auipc	a0,0x3
    80001c88:	76c50513          	add	a0,a0,1900 # 800053f0 <digits+0x48>
    80001c8c:	d60ff0ef          	jal	800011ec <uart_puts>
    80001c90:	00abdb93          	srl	s7,s7,0xa
    80001c94:	016bfbb3          	and	s7,s7,s6
    80001c98:	00000713          	li	a4,0
    80001c9c:	03c00413          	li	s0,60
    80001ca0:	008bd7b3          	srl	a5,s7,s0
    80001ca4:	00f7f793          	and	a5,a5,15
    80001ca8:	00e7e733          	or	a4,a5,a4
    80001cac:	00071e63          	bnez	a4,80001cc8 <dump_pagetable+0x1e0>
    80001cb0:	02040c63          	beqz	s0,80001ce8 <dump_pagetable+0x200>
    80001cb4:	ffc4041b          	addw	s0,s0,-4
    80001cb8:	008bd7b3          	srl	a5,s7,s0
    80001cbc:	00f7f793          	and	a5,a5,15
    80001cc0:	00e7e733          	or	a4,a5,a4
    80001cc4:	fe0706e3          	beqz	a4,80001cb0 <dump_pagetable+0x1c8>
    80001cc8:	ffc4041b          	addw	s0,s0,-4
    80001ccc:	03778513          	add	a0,a5,55
    80001cd0:	0ff7f713          	zext.b	a4,a5
    80001cd4:	04fa5c63          	bge	s4,a5,80001d2c <dump_pagetable+0x244>
    80001cd8:	cfcff0ef          	jal	800011d4 <uart_putc>
    80001cdc:	01540a63          	beq	s0,s5,80001cf0 <dump_pagetable+0x208>
    80001ce0:	00100713          	li	a4,1
    80001ce4:	fbdff06f          	j	80001ca0 <dump_pagetable+0x1b8>
    80001ce8:	03000513          	li	a0,48
    80001cec:	ce8ff0ef          	jal	800011d4 <uart_putc>
    80001cf0:	00003517          	auipc	a0,0x3
    80001cf4:	70850513          	add	a0,a0,1800 # 800053f8 <digits+0x50>
    80001cf8:	cf4ff0ef          	jal	800011ec <uart_puts>
    80001cfc:	00093783          	ld	a5,0(s2)
    80001d00:	0027f713          	and	a4,a5,2
    80001d04:	08071463          	bnez	a4,80001d8c <dump_pagetable+0x2a4>
    80001d08:	0047f713          	and	a4,a5,4
    80001d0c:	06071863          	bnez	a4,80001d7c <dump_pagetable+0x294>
    80001d10:	0087f713          	and	a4,a5,8
    80001d14:	04071c63          	bnez	a4,80001d6c <dump_pagetable+0x284>
    80001d18:	0107f793          	and	a5,a5,16
    80001d1c:	04079263          	bnez	a5,80001d60 <dump_pagetable+0x278>
    80001d20:	00a00513          	li	a0,10
    80001d24:	cb0ff0ef          	jal	800011d4 <uart_putc>
    80001d28:	e65ff06f          	j	80001b8c <dump_pagetable+0xa4>
    80001d2c:	03070513          	add	a0,a4,48
    80001d30:	fa9ff06f          	j	80001cd8 <dump_pagetable+0x1f0>
    80001d34:	089a5263          	bge	s4,s1,80001db8 <dump_pagetable+0x2d0>
    80001d38:	00a00413          	li	s0,10
    80001d3c:	0284c53b          	divw	a0,s1,s0
    80001d40:	0305051b          	addw	a0,a0,48
    80001d44:	0ff57513          	zext.b	a0,a0
    80001d48:	c8cff0ef          	jal	800011d4 <uart_putc>
    80001d4c:	0284e53b          	remw	a0,s1,s0
    80001d50:	0305051b          	addw	a0,a0,48
    80001d54:	0ff57513          	zext.b	a0,a0
    80001d58:	c7cff0ef          	jal	800011d4 <uart_putc>
    80001d5c:	eb5ff06f          	j	80001c10 <dump_pagetable+0x128>
    80001d60:	05500513          	li	a0,85
    80001d64:	c70ff0ef          	jal	800011d4 <uart_putc>
    80001d68:	fb9ff06f          	j	80001d20 <dump_pagetable+0x238>
    80001d6c:	05800513          	li	a0,88
    80001d70:	c64ff0ef          	jal	800011d4 <uart_putc>
    80001d74:	00093783          	ld	a5,0(s2)
    80001d78:	fa1ff06f          	j	80001d18 <dump_pagetable+0x230>
    80001d7c:	05700513          	li	a0,87
    80001d80:	c54ff0ef          	jal	800011d4 <uart_putc>
    80001d84:	00093783          	ld	a5,0(s2)
    80001d88:	f89ff06f          	j	80001d10 <dump_pagetable+0x228>
    80001d8c:	05200513          	li	a0,82
    80001d90:	c44ff0ef          	jal	800011d4 <uart_putc>
    80001d94:	00093783          	ld	a5,0(s2)
    80001d98:	f71ff06f          	j	80001d08 <dump_pagetable+0x220>
    80001d9c:	00003517          	auipc	a0,0x3
    80001da0:	62450513          	add	a0,a0,1572 # 800053c0 <digits+0x18>
    80001da4:	c48ff0ef          	jal	800011ec <uart_puts>
    80001da8:	0309851b          	addw	a0,s3,48
    80001dac:	0ff57513          	zext.b	a0,a0
    80001db0:	c24ff0ef          	jal	800011d4 <uart_putc>
    80001db4:	db5ff06f          	j	80001b68 <dump_pagetable+0x80>
    80001db8:	0304851b          	addw	a0,s1,48
    80001dbc:	0ff57513          	zext.b	a0,a0
    80001dc0:	c14ff0ef          	jal	800011d4 <uart_putc>
    80001dc4:	e4dff06f          	j	80001c10 <dump_pagetable+0x128>

0000000080001dc8 <init_page_replacement>:
    80001dc8:	00100713          	li	a4,1
    80001dcc:	02a71713          	sll	a4,a4,0x2a
    80001dd0:	0000f797          	auipc	a5,0xf
    80001dd4:	23078793          	add	a5,a5,560 # 80011000 <swap_mgr>
    80001dd8:	08e7b023          	sd	a4,128(a5)
    80001ddc:	0000f717          	auipc	a4,0xf
    80001de0:	2a072623          	sw	zero,684(a4) # 80011088 <swap_mgr+0x88>
    80001de4:	0000f717          	auipc	a4,0xf
    80001de8:	29c70713          	add	a4,a4,668 # 80011080 <swap_mgr+0x80>
    80001dec:	0007a023          	sw	zero,0(a5)
    80001df0:	00478793          	add	a5,a5,4
    80001df4:	fee79ce3          	bne	a5,a4,80001dec <init_page_replacement+0x24>
    80001df8:	0040f797          	auipc	a5,0x40f
    80001dfc:	2807bc23          	sd	zero,664(a5) # 80411090 <lru_mgr>
    80001e00:	0040f797          	auipc	a5,0x40f
    80001e04:	2807bc23          	sd	zero,664(a5) # 80411098 <lru_mgr+0x8>
    80001e08:	00100793          	li	a5,1
    80001e0c:	02879793          	sll	a5,a5,0x28
    80001e10:	00412717          	auipc	a4,0x412
    80001e14:	28f73823          	sd	a5,656(a4) # 804140a0 <lru_mgr+0x3010>
    80001e18:	fff00713          	li	a4,-1
    80001e1c:	0040f797          	auipc	a5,0x40f
    80001e20:	28478793          	add	a5,a5,644 # 804110a0 <lru_mgr+0x10>
    80001e24:	00412697          	auipc	a3,0x412
    80001e28:	27c68693          	add	a3,a3,636 # 804140a0 <lru_mgr+0x3010>
    80001e2c:	02075713          	srl	a4,a4,0x20
    80001e30:	0007b023          	sd	zero,0(a5)
    80001e34:	0007b423          	sd	zero,8(a5)
    80001e38:	00e7b823          	sd	a4,16(a5)
    80001e3c:	0007bc23          	sd	zero,24(a5)
    80001e40:	0207b023          	sd	zero,32(a5)
    80001e44:	0207b423          	sd	zero,40(a5)
    80001e48:	03078793          	add	a5,a5,48
    80001e4c:	fed792e3          	bne	a5,a3,80001e30 <init_page_replacement+0x68>
    80001e50:	00008067          	ret

0000000080001e54 <kvminit>:
    80001e54:	fd010113          	add	sp,sp,-48
    80001e58:	02113423          	sd	ra,40(sp)
    80001e5c:	02813023          	sd	s0,32(sp)
    80001e60:	00913c23          	sd	s1,24(sp)
    80001e64:	01213823          	sd	s2,16(sp)
    80001e68:	01313423          	sd	s3,8(sp)
    80001e6c:	01413023          	sd	s4,0(sp)
    80001e70:	f59ff0ef          	jal	80001dc8 <init_page_replacement>
    80001e74:	c24ff0ef          	jal	80001298 <alloc_page>
    80001e78:	00001737          	lui	a4,0x1
    80001e7c:	00e50733          	add	a4,a0,a4
    80001e80:	00050413          	mv	s0,a0
    80001e84:	00050793          	mv	a5,a0
    80001e88:	1a050663          	beqz	a0,80002034 <kvminit+0x1e0>
    80001e8c:	0007b023          	sd	zero,0(a5)
    80001e90:	00878793          	add	a5,a5,8
    80001e94:	fef71ce3          	bne	a4,a5,80001e8c <kvminit+0x38>
    80001e98:	00424917          	auipc	s2,0x424
    80001e9c:	33890913          	add	s2,s2,824 # 804261d0 <kernel_pagetable>
    80001ea0:	00003997          	auipc	s3,0x3
    80001ea4:	fd398993          	add	s3,s3,-45 # 80004e73 <rodata_start+0xe73>
    80001ea8:	fffff7b7          	lui	a5,0xfffff
    80001eac:	00893023          	sd	s0,0(s2)
    80001eb0:	ffffe497          	auipc	s1,0xffffe
    80001eb4:	15048493          	add	s1,s1,336 # 80000000 <_entry>
    80001eb8:	00f9f9b3          	and	s3,s3,a5
    80001ebc:	0334f863          	bgeu	s1,s3,80001eec <kvminit+0x98>
    80001ec0:	00001a37          	lui	s4,0x1
    80001ec4:	0080006f          	j	80001ecc <kvminit+0x78>
    80001ec8:	0334f063          	bgeu	s1,s3,80001ee8 <kvminit+0x94>
    80001ecc:	00048613          	mv	a2,s1
    80001ed0:	00048593          	mv	a1,s1
    80001ed4:	00a00693          	li	a3,10
    80001ed8:	00040513          	mv	a0,s0
    80001edc:	dbcff0ef          	jal	80001498 <map_page>
    80001ee0:	014484b3          	add	s1,s1,s4
    80001ee4:	fe0502e3          	beqz	a0,80001ec8 <kvminit+0x74>
    80001ee8:	00093403          	ld	s0,0(s2)
    80001eec:	00005997          	auipc	s3,0x5
    80001ef0:	c4b98993          	add	s3,s3,-949 # 80006b37 <data_end+0xb33>
    80001ef4:	fffff7b7          	lui	a5,0xfffff
    80001ef8:	00002497          	auipc	s1,0x2
    80001efc:	10848493          	add	s1,s1,264 # 80004000 <rodata_start>
    80001f00:	00f9f9b3          	and	s3,s3,a5
    80001f04:	0334f863          	bgeu	s1,s3,80001f34 <kvminit+0xe0>
    80001f08:	00001a37          	lui	s4,0x1
    80001f0c:	0080006f          	j	80001f14 <kvminit+0xc0>
    80001f10:	0334f063          	bgeu	s1,s3,80001f30 <kvminit+0xdc>
    80001f14:	00048613          	mv	a2,s1
    80001f18:	00048593          	mv	a1,s1
    80001f1c:	00200693          	li	a3,2
    80001f20:	00040513          	mv	a0,s0
    80001f24:	d74ff0ef          	jal	80001498 <map_page>
    80001f28:	014484b3          	add	s1,s1,s4
    80001f2c:	fe0502e3          	beqz	a0,80001f10 <kvminit+0xbc>
    80001f30:	00093403          	ld	s0,0(s2)
    80001f34:	00005997          	auipc	s3,0x5
    80001f38:	0cf98993          	add	s3,s3,207 # 80007003 <data_end+0xfff>
    80001f3c:	fffff7b7          	lui	a5,0xfffff
    80001f40:	00004497          	auipc	s1,0x4
    80001f44:	0c048493          	add	s1,s1,192 # 80006000 <nextpid>
    80001f48:	00f9f9b3          	and	s3,s3,a5
    80001f4c:	0334f863          	bgeu	s1,s3,80001f7c <kvminit+0x128>
    80001f50:	00001a37          	lui	s4,0x1
    80001f54:	0080006f          	j	80001f5c <kvminit+0x108>
    80001f58:	0334f063          	bgeu	s1,s3,80001f78 <kvminit+0x124>
    80001f5c:	00048613          	mv	a2,s1
    80001f60:	00048593          	mv	a1,s1
    80001f64:	00600693          	li	a3,6
    80001f68:	00040513          	mv	a0,s0
    80001f6c:	d2cff0ef          	jal	80001498 <map_page>
    80001f70:	014484b3          	add	s1,s1,s4
    80001f74:	fe0502e3          	beqz	a0,80001f58 <kvminit+0x104>
    80001f78:	00093403          	ld	s0,0(s2)
    80001f7c:	00425997          	auipc	s3,0x425
    80001f80:	27b98993          	add	s3,s3,635 # 804271f7 <bss_end+0xfff>
    80001f84:	fffff7b7          	lui	a5,0xfffff
    80001f88:	0000e497          	auipc	s1,0xe
    80001f8c:	07848493          	add	s1,s1,120 # 80010000 <bss_start>
    80001f90:	00f9f9b3          	and	s3,s3,a5
    80001f94:	0334f863          	bgeu	s1,s3,80001fc4 <kvminit+0x170>
    80001f98:	00001a37          	lui	s4,0x1
    80001f9c:	0080006f          	j	80001fa4 <kvminit+0x150>
    80001fa0:	0334f063          	bgeu	s1,s3,80001fc0 <kvminit+0x16c>
    80001fa4:	00048613          	mv	a2,s1
    80001fa8:	00048593          	mv	a1,s1
    80001fac:	00600693          	li	a3,6
    80001fb0:	00040513          	mv	a0,s0
    80001fb4:	ce4ff0ef          	jal	80001498 <map_page>
    80001fb8:	014484b3          	add	s1,s1,s4
    80001fbc:	fe0502e3          	beqz	a0,80001fa0 <kvminit+0x14c>
    80001fc0:	00093403          	ld	s0,0(s2)
    80001fc4:	01100993          	li	s3,17
    80001fc8:	00424497          	auipc	s1,0x424
    80001fcc:	23048493          	add	s1,s1,560 # 804261f8 <bss_end>
    80001fd0:	01b99993          	sll	s3,s3,0x1b
    80001fd4:	0334f863          	bgeu	s1,s3,80002004 <kvminit+0x1b0>
    80001fd8:	00001a37          	lui	s4,0x1
    80001fdc:	0080006f          	j	80001fe4 <kvminit+0x190>
    80001fe0:	0334f063          	bgeu	s1,s3,80002000 <kvminit+0x1ac>
    80001fe4:	00048613          	mv	a2,s1
    80001fe8:	00048593          	mv	a1,s1
    80001fec:	00600693          	li	a3,6
    80001ff0:	00040513          	mv	a0,s0
    80001ff4:	ca4ff0ef          	jal	80001498 <map_page>
    80001ff8:	014484b3          	add	s1,s1,s4
    80001ffc:	fe0502e3          	beqz	a0,80001fe0 <kvminit+0x18c>
    80002000:	00093403          	ld	s0,0(s2)
    80002004:	00040513          	mv	a0,s0
    80002008:	02013403          	ld	s0,32(sp)
    8000200c:	02813083          	ld	ra,40(sp)
    80002010:	01813483          	ld	s1,24(sp)
    80002014:	01013903          	ld	s2,16(sp)
    80002018:	00813983          	ld	s3,8(sp)
    8000201c:	00013a03          	ld	s4,0(sp)
    80002020:	00600693          	li	a3,6
    80002024:	10000637          	lui	a2,0x10000
    80002028:	100005b7          	lui	a1,0x10000
    8000202c:	03010113          	add	sp,sp,48
    80002030:	c68ff06f          	j	80001498 <map_page>
    80002034:	02813083          	ld	ra,40(sp)
    80002038:	02013403          	ld	s0,32(sp)
    8000203c:	00424797          	auipc	a5,0x424
    80002040:	1807ba23          	sd	zero,404(a5) # 804261d0 <kernel_pagetable>
    80002044:	01813483          	ld	s1,24(sp)
    80002048:	01013903          	ld	s2,16(sp)
    8000204c:	00813983          	ld	s3,8(sp)
    80002050:	00013a03          	ld	s4,0(sp)
    80002054:	03010113          	add	sp,sp,48
    80002058:	00008067          	ret

000000008000205c <alloc_swap_slot>:
    8000205c:	0000f617          	auipc	a2,0xf
    80002060:	fa460613          	add	a2,a2,-92 # 80011000 <swap_mgr>
    80002064:	08862803          	lw	a6,136(a2)
    80002068:	08462883          	lw	a7,132(a2)
    8000206c:	fff00513          	li	a0,-1
    80002070:	0d187663          	bgeu	a6,a7,8000213c <alloc_swap_slot+0xe0>
    80002074:	08062303          	lw	t1,128(a2)
    80002078:	07137863          	bgeu	t1,a7,800020e8 <alloc_swap_slot+0x8c>
    8000207c:	0053579b          	srlw	a5,t1,0x5
    80002080:	00279793          	sll	a5,a5,0x2
    80002084:	00f607b3          	add	a5,a2,a5
    80002088:	0007a683          	lw	a3,0(a5)
    8000208c:	00100593          	li	a1,1
    80002090:	006595bb          	sllw	a1,a1,t1
    80002094:	00b6f7b3          	and	a5,a3,a1
    80002098:	0007879b          	sext.w	a5,a5
    8000209c:	0053571b          	srlw	a4,t1,0x5
    800020a0:	00030513          	mv	a0,t1
    800020a4:	08078e63          	beqz	a5,80002140 <alloc_swap_slot+0xe4>
    800020a8:	00100e13          	li	t3,1
    800020ac:	01c0006f          	j	800020c8 <alloc_swap_slot+0x6c>
    800020b0:	0006a683          	lw	a3,0(a3)
    800020b4:	0007859b          	sext.w	a1,a5
    800020b8:	0057571b          	srlw	a4,a4,0x5
    800020bc:	00f6f7b3          	and	a5,a3,a5
    800020c0:	0007879b          	sext.w	a5,a5
    800020c4:	06078e63          	beqz	a5,80002140 <alloc_swap_slot+0xe4>
    800020c8:	0015071b          	addw	a4,a0,1
    800020cc:	0057579b          	srlw	a5,a4,0x5
    800020d0:	00279793          	sll	a5,a5,0x2
    800020d4:	0007051b          	sext.w	a0,a4
    800020d8:	00f606b3          	add	a3,a2,a5
    800020dc:	00ee17bb          	sllw	a5,t3,a4
    800020e0:	fca898e3          	bne	a7,a0,800020b0 <alloc_swap_slot+0x54>
    800020e4:	04030a63          	beqz	t1,80002138 <alloc_swap_slot+0xdc>
    800020e8:	00062683          	lw	a3,0(a2)
    800020ec:	0016f513          	and	a0,a3,1
    800020f0:	0a050063          	beqz	a0,80002190 <alloc_swap_slot+0x134>
    800020f4:	00000513          	li	a0,0
    800020f8:	00100e13          	li	t3,1
    800020fc:	01c0006f          	j	80002118 <alloc_swap_slot+0xbc>
    80002100:	0006a683          	lw	a3,0(a3)
    80002104:	00078e9b          	sext.w	t4,a5
    80002108:	0057571b          	srlw	a4,a4,0x5
    8000210c:	00f6f7b3          	and	a5,a3,a5
    80002110:	0007879b          	sext.w	a5,a5
    80002114:	04078a63          	beqz	a5,80002168 <alloc_swap_slot+0x10c>
    80002118:	0015071b          	addw	a4,a0,1
    8000211c:	0057579b          	srlw	a5,a4,0x5
    80002120:	00279793          	sll	a5,a5,0x2
    80002124:	0005059b          	sext.w	a1,a0
    80002128:	0007051b          	sext.w	a0,a4
    8000212c:	00f606b3          	add	a3,a2,a5
    80002130:	00ee17bb          	sllw	a5,t3,a4
    80002134:	fca316e3          	bne	t1,a0,80002100 <alloc_swap_slot+0xa4>
    80002138:	fff00513          	li	a0,-1
    8000213c:	00008067          	ret
    80002140:	0015079b          	addw	a5,a0,1
    80002144:	0317f7bb          	remuw	a5,a5,a7
    80002148:	00271713          	sll	a4,a4,0x2
    8000214c:	00e60733          	add	a4,a2,a4
    80002150:	00b6e6b3          	or	a3,a3,a1
    80002154:	0018081b          	addw	a6,a6,1
    80002158:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    8000215c:	09062423          	sw	a6,136(a2)
    80002160:	08f62023          	sw	a5,128(a2)
    80002164:	00008067          	ret
    80002168:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    8000216c:	0315f5bb          	remuw	a1,a1,a7
    80002170:	00271713          	sll	a4,a4,0x2
    80002174:	00e60733          	add	a4,a2,a4
    80002178:	01d6e6b3          	or	a3,a3,t4
    8000217c:	0018081b          	addw	a6,a6,1
    80002180:	00d72023          	sw	a3,0(a4)
    80002184:	09062423          	sw	a6,136(a2)
    80002188:	08b62023          	sw	a1,128(a2)
    8000218c:	00008067          	ret
    80002190:	00000713          	li	a4,0
    80002194:	00100593          	li	a1,1
    80002198:	00100e93          	li	t4,1
    8000219c:	fd1ff06f          	j	8000216c <alloc_swap_slot+0x110>

00000000800021a0 <free_swap_slot>:
    800021a0:	0000f717          	auipc	a4,0xf
    800021a4:	e6070713          	add	a4,a4,-416 # 80011000 <swap_mgr>
    800021a8:	08472783          	lw	a5,132(a4)
    800021ac:	04f57663          	bgeu	a0,a5,800021f8 <free_swap_slot+0x58>
    800021b0:	0055579b          	srlw	a5,a0,0x5
    800021b4:	00279793          	sll	a5,a5,0x2
    800021b8:	00f707b3          	add	a5,a4,a5
    800021bc:	0007a583          	lw	a1,0(a5)
    800021c0:	00100693          	li	a3,1
    800021c4:	00a696bb          	sllw	a3,a3,a0
    800021c8:	00d5f633          	and	a2,a1,a3
    800021cc:	0006061b          	sext.w	a2,a2
    800021d0:	02060463          	beqz	a2,800021f8 <free_swap_slot+0x58>
    800021d4:	08872603          	lw	a2,136(a4)
    800021d8:	fff6c693          	not	a3,a3
    800021dc:	08072803          	lw	a6,128(a4)
    800021e0:	00d5f5b3          	and	a1,a1,a3
    800021e4:	fff6069b          	addw	a3,a2,-1
    800021e8:	00b7a023          	sw	a1,0(a5)
    800021ec:	08d72423          	sw	a3,136(a4)
    800021f0:	01057463          	bgeu	a0,a6,800021f8 <free_swap_slot+0x58>
    800021f4:	08a72023          	sw	a0,128(a4)
    800021f8:	00008067          	ret

00000000800021fc <find_page_desc>:
    800021fc:	fffff7b7          	lui	a5,0xfffff
    80002200:	00f57533          	and	a0,a0,a5
    80002204:	00000713          	li	a4,0
    80002208:	0040f797          	auipc	a5,0x40f
    8000220c:	e9878793          	add	a5,a5,-360 # 804110a0 <lru_mgr+0x10>
    80002210:	10000613          	li	a2,256
    80002214:	0100006f          	j	80002224 <find_page_desc+0x28>
    80002218:	0017071b          	addw	a4,a4,1
    8000221c:	03078793          	add	a5,a5,48
    80002220:	02c70a63          	beq	a4,a2,80002254 <find_page_desc+0x58>
    80002224:	0007b683          	ld	a3,0(a5)
    80002228:	fea698e3          	bne	a3,a0,80002218 <find_page_desc+0x1c>
    8000222c:	0147a683          	lw	a3,20(a5)
    80002230:	0016f693          	and	a3,a3,1
    80002234:	fe0682e3          	beqz	a3,80002218 <find_page_desc+0x1c>
    80002238:	00171513          	sll	a0,a4,0x1
    8000223c:	00e50533          	add	a0,a0,a4
    80002240:	0040f797          	auipc	a5,0x40f
    80002244:	e6078793          	add	a5,a5,-416 # 804110a0 <lru_mgr+0x10>
    80002248:	00451513          	sll	a0,a0,0x4
    8000224c:	00f50533          	add	a0,a0,a5
    80002250:	00008067          	ret
    80002254:	00000513          	li	a0,0
    80002258:	00008067          	ret

000000008000225c <lru_add_page>:
    8000225c:	02050c63          	beqz	a0,80002294 <lru_add_page+0x38>
    80002260:	0040f717          	auipc	a4,0x40f
    80002264:	e3070713          	add	a4,a4,-464 # 80411090 <lru_mgr>
    80002268:	00073783          	ld	a5,0(a4)
    8000226c:	00053c23          	sd	zero,24(a0)
    80002270:	02f53023          	sd	a5,32(a0)
    80002274:	02078263          	beqz	a5,80002298 <lru_add_page+0x3c>
    80002278:	00a7bc23          	sd	a0,24(a5)
    8000227c:	00412697          	auipc	a3,0x412
    80002280:	e1468693          	add	a3,a3,-492 # 80414090 <lru_mgr+0x3000>
    80002284:	0106a783          	lw	a5,16(a3)
    80002288:	00a73023          	sd	a0,0(a4)
    8000228c:	0017879b          	addw	a5,a5,1
    80002290:	00f6a823          	sw	a5,16(a3)
    80002294:	00008067          	ret
    80002298:	00a73423          	sd	a0,8(a4)
    8000229c:	fe1ff06f          	j	8000227c <lru_add_page+0x20>

00000000800022a0 <lru_remove_page>:
    800022a0:	02050c63          	beqz	a0,800022d8 <lru_remove_page+0x38>
    800022a4:	01853783          	ld	a5,24(a0)
    800022a8:	02053703          	ld	a4,32(a0)
    800022ac:	02078863          	beqz	a5,800022dc <lru_remove_page+0x3c>
    800022b0:	02e7b023          	sd	a4,32(a5)
    800022b4:	02070a63          	beqz	a4,800022e8 <lru_remove_page+0x48>
    800022b8:	00f73c23          	sd	a5,24(a4)
    800022bc:	00412717          	auipc	a4,0x412
    800022c0:	dd470713          	add	a4,a4,-556 # 80414090 <lru_mgr+0x3000>
    800022c4:	01072783          	lw	a5,16(a4)
    800022c8:	02053023          	sd	zero,32(a0)
    800022cc:	00053c23          	sd	zero,24(a0)
    800022d0:	fff7879b          	addw	a5,a5,-1
    800022d4:	00f72823          	sw	a5,16(a4)
    800022d8:	00008067          	ret
    800022dc:	0040f697          	auipc	a3,0x40f
    800022e0:	dae6ba23          	sd	a4,-588(a3) # 80411090 <lru_mgr>
    800022e4:	fc071ae3          	bnez	a4,800022b8 <lru_remove_page+0x18>
    800022e8:	0040f717          	auipc	a4,0x40f
    800022ec:	daf73823          	sd	a5,-592(a4) # 80411098 <lru_mgr+0x8>
    800022f0:	fcdff06f          	j	800022bc <lru_remove_page+0x1c>

00000000800022f4 <lru_touch_page>:
    800022f4:	fffff7b7          	lui	a5,0xfffff
    800022f8:	00f57533          	and	a0,a0,a5
    800022fc:	00000713          	li	a4,0
    80002300:	0040f797          	auipc	a5,0x40f
    80002304:	da078793          	add	a5,a5,-608 # 804110a0 <lru_mgr+0x10>
    80002308:	10000613          	li	a2,256
    8000230c:	0100006f          	j	8000231c <lru_touch_page+0x28>
    80002310:	0017071b          	addw	a4,a4,1
    80002314:	03078793          	add	a5,a5,48
    80002318:	0ac70663          	beq	a4,a2,800023c4 <lru_touch_page+0xd0>
    8000231c:	0007b683          	ld	a3,0(a5)
    80002320:	fea698e3          	bne	a3,a0,80002310 <lru_touch_page+0x1c>
    80002324:	0147a683          	lw	a3,20(a5)
    80002328:	0016f693          	and	a3,a3,1
    8000232c:	fe0682e3          	beqz	a3,80002310 <lru_touch_page+0x1c>
    80002330:	00171613          	sll	a2,a4,0x1
    80002334:	00e607b3          	add	a5,a2,a4
    80002338:	0040f597          	auipc	a1,0x40f
    8000233c:	d5858593          	add	a1,a1,-680 # 80411090 <lru_mgr>
    80002340:	00479793          	sll	a5,a5,0x4
    80002344:	00170513          	add	a0,a4,1
    80002348:	00f58833          	add	a6,a1,a5
    8000234c:	00151693          	sll	a3,a0,0x1
    80002350:	00a686b3          	add	a3,a3,a0
    80002354:	02883803          	ld	a6,40(a6)
    80002358:	00469693          	sll	a3,a3,0x4
    8000235c:	01078793          	add	a5,a5,16
    80002360:	00d586b3          	add	a3,a1,a3
    80002364:	0006b683          	ld	a3,0(a3)
    80002368:	00f587b3          	add	a5,a1,a5
    8000236c:	04080e63          	beqz	a6,800023c8 <lru_touch_page+0xd4>
    80002370:	02d83023          	sd	a3,32(a6)
    80002374:	0005b883          	ld	a7,0(a1)
    80002378:	04068c63          	beqz	a3,800023d0 <lru_touch_page+0xdc>
    8000237c:	0106bc23          	sd	a6,24(a3)
    80002380:	00151693          	sll	a3,a0,0x1
    80002384:	00e60733          	add	a4,a2,a4
    80002388:	00a686b3          	add	a3,a3,a0
    8000238c:	00469693          	sll	a3,a3,0x4
    80002390:	00471713          	sll	a4,a4,0x4
    80002394:	00e58733          	add	a4,a1,a4
    80002398:	00d586b3          	add	a3,a1,a3
    8000239c:	00412617          	auipc	a2,0x412
    800023a0:	cf460613          	add	a2,a2,-780 # 80414090 <lru_mgr+0x3000>
    800023a4:	02073423          	sd	zero,40(a4)
    800023a8:	0116b023          	sd	a7,0(a3)
    800023ac:	01062703          	lw	a4,16(a2)
    800023b0:	02088463          	beqz	a7,800023d8 <lru_touch_page+0xe4>
    800023b4:	00f8bc23          	sd	a5,24(a7)
    800023b8:	00f5b023          	sd	a5,0(a1)
    800023bc:	00e62823          	sw	a4,16(a2)
    800023c0:	00008067          	ret
    800023c4:	00008067          	ret
    800023c8:	00068893          	mv	a7,a3
    800023cc:	fa0698e3          	bnez	a3,8000237c <lru_touch_page+0x88>
    800023d0:	0105b423          	sd	a6,8(a1)
    800023d4:	fadff06f          	j	80002380 <lru_touch_page+0x8c>
    800023d8:	00f5b423          	sd	a5,8(a1)
    800023dc:	00f5b023          	sd	a5,0(a1)
    800023e0:	00e62823          	sw	a4,16(a2)
    800023e4:	00008067          	ret

00000000800023e8 <find_victim_page>:
    800023e8:	0040f517          	auipc	a0,0x40f
    800023ec:	cb053503          	ld	a0,-848(a0) # 80411098 <lru_mgr+0x8>
    800023f0:	00008067          	ret

00000000800023f4 <swap_out_page>:
    800023f4:	16050263          	beqz	a0,80002558 <swap_out_page+0x164>
    800023f8:	fd010113          	add	sp,sp,-48
    800023fc:	00913c23          	sd	s1,24(sp)
    80002400:	01452483          	lw	s1,20(a0)
    80002404:	02813023          	sd	s0,32(sp)
    80002408:	01313423          	sd	s3,8(sp)
    8000240c:	02113423          	sd	ra,40(sp)
    80002410:	01213823          	sd	s2,16(sp)
    80002414:	0014f793          	and	a5,s1,1
    80002418:	00050413          	mv	s0,a0
    8000241c:	00048993          	mv	s3,s1
    80002420:	12078863          	beqz	a5,80002550 <swap_out_page+0x15c>
    80002424:	c39ff0ef          	jal	8000205c <alloc_swap_slot>
    80002428:	0005091b          	sext.w	s2,a0
    8000242c:	fff00793          	li	a5,-1
    80002430:	12f90063          	beq	s2,a5,80002550 <swap_out_page+0x15c>
    80002434:	0049f993          	and	s3,s3,4
    80002438:	04098663          	beqz	s3,80002484 <swap_out_page+0x90>
    8000243c:	00843683          	ld	a3,8(s0)
    80002440:	00c9171b          	sllw	a4,s2,0xc
    80002444:	0000f797          	auipc	a5,0xf
    80002448:	c4c78793          	add	a5,a5,-948 # 80011090 <swap_area>
    8000244c:	02071713          	sll	a4,a4,0x20
    80002450:	02075713          	srl	a4,a4,0x20
    80002454:	40f686b3          	sub	a3,a3,a5
    80002458:	00010617          	auipc	a2,0x10
    8000245c:	c3860613          	add	a2,a2,-968 # 80012090 <swap_area+0x1000>
    80002460:	00f707b3          	add	a5,a4,a5
    80002464:	00e60633          	add	a2,a2,a4
    80002468:	40e686b3          	sub	a3,a3,a4
    8000246c:	00f68733          	add	a4,a3,a5
    80002470:	00074703          	lbu	a4,0(a4)
    80002474:	00178793          	add	a5,a5,1
    80002478:	fee78fa3          	sb	a4,-1(a5)
    8000247c:	fec798e3          	bne	a5,a2,8000246c <swap_out_page+0x78>
    80002480:	01442483          	lw	s1,20(s0)
    80002484:	00043583          	ld	a1,0(s0)
    80002488:	02843503          	ld	a0,40(s0)
    8000248c:	f11fe0ef          	jal	8000139c <walk_lookup>
    80002490:	00050863          	beqz	a0,800024a0 <swap_out_page+0xac>
    80002494:	00053783          	ld	a5,0(a0)
    80002498:	0017f713          	and	a4,a5,1
    8000249c:	08071063          	bnez	a4,8000251c <swap_out_page+0x128>
    800024a0:	ffe4f793          	and	a5,s1,-2
    800024a4:	0027e793          	or	a5,a5,2
    800024a8:	02091913          	sll	s2,s2,0x20
    800024ac:	02079793          	sll	a5,a5,0x20
    800024b0:	00843503          	ld	a0,8(s0)
    800024b4:	02095913          	srl	s2,s2,0x20
    800024b8:	00f96933          	or	s2,s2,a5
    800024bc:	01243823          	sd	s2,16(s0)
    800024c0:	df5fe0ef          	jal	800012b4 <free_page>
    800024c4:	01843783          	ld	a5,24(s0)
    800024c8:	00043423          	sd	zero,8(s0)
    800024cc:	02043703          	ld	a4,32(s0)
    800024d0:	06078463          	beqz	a5,80002538 <swap_out_page+0x144>
    800024d4:	02e7b023          	sd	a4,32(a5)
    800024d8:	06070663          	beqz	a4,80002544 <swap_out_page+0x150>
    800024dc:	00f73c23          	sd	a5,24(a4)
    800024e0:	00412717          	auipc	a4,0x412
    800024e4:	bb070713          	add	a4,a4,-1104 # 80414090 <lru_mgr+0x3000>
    800024e8:	01072783          	lw	a5,16(a4)
    800024ec:	02043023          	sd	zero,32(s0)
    800024f0:	00043c23          	sd	zero,24(s0)
    800024f4:	fff7879b          	addw	a5,a5,-1
    800024f8:	00f72823          	sw	a5,16(a4)
    800024fc:	00000513          	li	a0,0
    80002500:	02813083          	ld	ra,40(sp)
    80002504:	02013403          	ld	s0,32(sp)
    80002508:	01813483          	ld	s1,24(sp)
    8000250c:	01013903          	ld	s2,16(sp)
    80002510:	00813983          	ld	s3,8(sp)
    80002514:	03010113          	add	sp,sp,48
    80002518:	00008067          	ret
    8000251c:	00a9171b          	sllw	a4,s2,0xa
    80002520:	02071713          	sll	a4,a4,0x20
    80002524:	ffe7f793          	and	a5,a5,-2
    80002528:	02075713          	srl	a4,a4,0x20
    8000252c:	00e7e7b3          	or	a5,a5,a4
    80002530:	00f53023          	sd	a5,0(a0)
    80002534:	f6dff06f          	j	800024a0 <swap_out_page+0xac>
    80002538:	0040f697          	auipc	a3,0x40f
    8000253c:	b4e6bc23          	sd	a4,-1192(a3) # 80411090 <lru_mgr>
    80002540:	f8071ee3          	bnez	a4,800024dc <swap_out_page+0xe8>
    80002544:	0040f717          	auipc	a4,0x40f
    80002548:	b4f73a23          	sd	a5,-1196(a4) # 80411098 <lru_mgr+0x8>
    8000254c:	f95ff06f          	j	800024e0 <swap_out_page+0xec>
    80002550:	fff00513          	li	a0,-1
    80002554:	fadff06f          	j	80002500 <swap_out_page+0x10c>
    80002558:	fff00513          	li	a0,-1
    8000255c:	00008067          	ret

0000000080002560 <swap_in_page>:
    80002560:	12050263          	beqz	a0,80002684 <swap_in_page+0x124>
    80002564:	01452783          	lw	a5,20(a0)
    80002568:	fe010113          	add	sp,sp,-32
    8000256c:	00813823          	sd	s0,16(sp)
    80002570:	00113c23          	sd	ra,24(sp)
    80002574:	00913423          	sd	s1,8(sp)
    80002578:	0027f793          	and	a5,a5,2
    8000257c:	00050413          	mv	s0,a0
    80002580:	0e078e63          	beqz	a5,8000267c <swap_in_page+0x11c>
    80002584:	01052703          	lw	a4,16(a0)
    80002588:	0000f797          	auipc	a5,0xf
    8000258c:	b0878793          	add	a5,a5,-1272 # 80011090 <swap_area>
    80002590:	40f58633          	sub	a2,a1,a5
    80002594:	00c7171b          	sllw	a4,a4,0xc
    80002598:	02071713          	sll	a4,a4,0x20
    8000259c:	02075713          	srl	a4,a4,0x20
    800025a0:	00010817          	auipc	a6,0x10
    800025a4:	af080813          	add	a6,a6,-1296 # 80012090 <swap_area+0x1000>
    800025a8:	00058493          	mv	s1,a1
    800025ac:	00f707b3          	add	a5,a4,a5
    800025b0:	00e80833          	add	a6,a6,a4
    800025b4:	40e60633          	sub	a2,a2,a4
    800025b8:	0007c683          	lbu	a3,0(a5)
    800025bc:	00f60733          	add	a4,a2,a5
    800025c0:	00178793          	add	a5,a5,1
    800025c4:	00d70023          	sb	a3,0(a4)
    800025c8:	ff0798e3          	bne	a5,a6,800025b8 <swap_in_page+0x58>
    800025cc:	00043583          	ld	a1,0(s0)
    800025d0:	02843503          	ld	a0,40(s0)
    800025d4:	dc9fe0ef          	jal	8000139c <walk_lookup>
    800025d8:	02050063          	beqz	a0,800025f8 <swap_in_page+0x98>
    800025dc:	00053703          	ld	a4,0(a0)
    800025e0:	00c4d793          	srl	a5,s1,0xc
    800025e4:	00a79793          	sll	a5,a5,0xa
    800025e8:	01e77713          	and	a4,a4,30
    800025ec:	00e7e7b3          	or	a5,a5,a4
    800025f0:	0017e793          	or	a5,a5,1
    800025f4:	00f53023          	sd	a5,0(a0)
    800025f8:	01442783          	lw	a5,20(s0)
    800025fc:	01042503          	lw	a0,16(s0)
    80002600:	00943423          	sd	s1,8(s0)
    80002604:	ffd7f793          	and	a5,a5,-3
    80002608:	0017e793          	or	a5,a5,1
    8000260c:	00f42a23          	sw	a5,20(s0)
    80002610:	0000f797          	auipc	a5,0xf
    80002614:	a747a783          	lw	a5,-1420(a5) # 80011084 <swap_mgr+0x84>
    80002618:	00f57463          	bgeu	a0,a5,80002620 <swap_in_page+0xc0>
    8000261c:	df5fe0ef          	jal	80001410 <free_swap_slot.part.0>
    80002620:	0040f717          	auipc	a4,0x40f
    80002624:	a7070713          	add	a4,a4,-1424 # 80411090 <lru_mgr>
    80002628:	00073783          	ld	a5,0(a4)
    8000262c:	fff00693          	li	a3,-1
    80002630:	00d42823          	sw	a3,16(s0)
    80002634:	02f43023          	sd	a5,32(s0)
    80002638:	00043c23          	sd	zero,24(s0)
    8000263c:	02078c63          	beqz	a5,80002674 <swap_in_page+0x114>
    80002640:	0087bc23          	sd	s0,24(a5)
    80002644:	00412697          	auipc	a3,0x412
    80002648:	a4c68693          	add	a3,a3,-1460 # 80414090 <lru_mgr+0x3000>
    8000264c:	0106a783          	lw	a5,16(a3)
    80002650:	00873023          	sd	s0,0(a4)
    80002654:	00000513          	li	a0,0
    80002658:	0017879b          	addw	a5,a5,1
    8000265c:	00f6a823          	sw	a5,16(a3)
    80002660:	01813083          	ld	ra,24(sp)
    80002664:	01013403          	ld	s0,16(sp)
    80002668:	00813483          	ld	s1,8(sp)
    8000266c:	02010113          	add	sp,sp,32
    80002670:	00008067          	ret
    80002674:	00873423          	sd	s0,8(a4)
    80002678:	fcdff06f          	j	80002644 <swap_in_page+0xe4>
    8000267c:	fff00513          	li	a0,-1
    80002680:	fe1ff06f          	j	80002660 <swap_in_page+0x100>
    80002684:	fff00513          	li	a0,-1
    80002688:	00008067          	ret

000000008000268c <handle_page_fault>:
    8000268c:	fd010113          	add	sp,sp,-48
    80002690:	fffff7b7          	lui	a5,0xfffff
    80002694:	02813023          	sd	s0,32(sp)
    80002698:	00f5f433          	and	s0,a1,a5
    8000269c:	00040593          	mv	a1,s0
    800026a0:	01213823          	sd	s2,16(sp)
    800026a4:	02113423          	sd	ra,40(sp)
    800026a8:	00913c23          	sd	s1,24(sp)
    800026ac:	01313423          	sd	s3,8(sp)
    800026b0:	00050913          	mv	s2,a0
    800026b4:	ce9fe0ef          	jal	8000139c <walk_lookup>
    800026b8:	12050c63          	beqz	a0,800027f0 <handle_page_fault+0x164>
    800026bc:	00053483          	ld	s1,0(a0)
    800026c0:	0014f793          	and	a5,s1,1
    800026c4:	12079663          	bnez	a5,800027f0 <handle_page_fault+0x164>
    800026c8:	12048463          	beqz	s1,800027f0 <handle_page_fault+0x164>
    800026cc:	00a4d493          	srl	s1,s1,0xa
    800026d0:	bc9fe0ef          	jal	80001298 <alloc_page>
    800026d4:	0004849b          	sext.w	s1,s1
    800026d8:	00050993          	mv	s3,a0
    800026dc:	0e050a63          	beqz	a0,800027d0 <handle_page_fault+0x144>
    800026e0:	0040f797          	auipc	a5,0x40f
    800026e4:	9c078793          	add	a5,a5,-1600 # 804110a0 <lru_mgr+0x10>
    800026e8:	00000713          	li	a4,0
    800026ec:	10000613          	li	a2,256
    800026f0:	0100006f          	j	80002700 <handle_page_fault+0x74>
    800026f4:	0017071b          	addw	a4,a4,1
    800026f8:	03078793          	add	a5,a5,48
    800026fc:	06c70063          	beq	a4,a2,8000275c <handle_page_fault+0xd0>
    80002700:	0007b683          	ld	a3,0(a5)
    80002704:	fe8698e3          	bne	a3,s0,800026f4 <handle_page_fault+0x68>
    80002708:	0147a683          	lw	a3,20(a5)
    8000270c:	0026f693          	and	a3,a3,2
    80002710:	fe0682e3          	beqz	a3,800026f4 <handle_page_fault+0x68>
    80002714:	0107a683          	lw	a3,16(a5)
    80002718:	fc969ee3          	bne	a3,s1,800026f4 <handle_page_fault+0x68>
    8000271c:	00171513          	sll	a0,a4,0x1
    80002720:	00e50533          	add	a0,a0,a4
    80002724:	00451513          	sll	a0,a0,0x4
    80002728:	0040f797          	auipc	a5,0x40f
    8000272c:	97878793          	add	a5,a5,-1672 # 804110a0 <lru_mgr+0x10>
    80002730:	00f50533          	add	a0,a0,a5
    80002734:	00098593          	mv	a1,s3
    80002738:	e29ff0ef          	jal	80002560 <swap_in_page>
    8000273c:	0a051e63          	bnez	a0,800027f8 <handle_page_fault+0x16c>
    80002740:	02813083          	ld	ra,40(sp)
    80002744:	02013403          	ld	s0,32(sp)
    80002748:	01813483          	ld	s1,24(sp)
    8000274c:	01013903          	ld	s2,16(sp)
    80002750:	00813983          	ld	s3,8(sp)
    80002754:	03010113          	add	sp,sp,48
    80002758:	00008067          	ret
    8000275c:	0040f717          	auipc	a4,0x40f
    80002760:	95870713          	add	a4,a4,-1704 # 804110b4 <lru_mgr+0x24>
    80002764:	00000793          	li	a5,0
    80002768:	10000613          	li	a2,256
    8000276c:	00c0006f          	j	80002778 <handle_page_fault+0xec>
    80002770:	0017879b          	addw	a5,a5,1
    80002774:	08c78263          	beq	a5,a2,800027f8 <handle_page_fault+0x16c>
    80002778:	00072683          	lw	a3,0(a4)
    8000277c:	03070713          	add	a4,a4,48
    80002780:	fe0698e3          	bnez	a3,80002770 <handle_page_fault+0xe4>
    80002784:	00178613          	add	a2,a5,1
    80002788:	00179713          	sll	a4,a5,0x1
    8000278c:	00161693          	sll	a3,a2,0x1
    80002790:	00f707b3          	add	a5,a4,a5
    80002794:	00479793          	sll	a5,a5,0x4
    80002798:	00c68733          	add	a4,a3,a2
    8000279c:	0040f617          	auipc	a2,0x40f
    800027a0:	8f460613          	add	a2,a2,-1804 # 80411090 <lru_mgr>
    800027a4:	00f606b3          	add	a3,a2,a5
    800027a8:	00471713          	sll	a4,a4,0x4
    800027ac:	01078793          	add	a5,a5,16
    800027b0:	00e60733          	add	a4,a2,a4
    800027b4:	00c78533          	add	a0,a5,a2
    800027b8:	00200793          	li	a5,2
    800027bc:	0086b823          	sd	s0,16(a3)
    800027c0:	01273423          	sd	s2,8(a4)
    800027c4:	0296a023          	sw	s1,32(a3)
    800027c8:	02f6a223          	sw	a5,36(a3)
    800027cc:	f69ff06f          	j	80002734 <handle_page_fault+0xa8>
    800027d0:	0040f517          	auipc	a0,0x40f
    800027d4:	8c853503          	ld	a0,-1848(a0) # 80411098 <lru_mgr+0x8>
    800027d8:	00050c63          	beqz	a0,800027f0 <handle_page_fault+0x164>
    800027dc:	c19ff0ef          	jal	800023f4 <swap_out_page>
    800027e0:	00051863          	bnez	a0,800027f0 <handle_page_fault+0x164>
    800027e4:	ab5fe0ef          	jal	80001298 <alloc_page>
    800027e8:	00050993          	mv	s3,a0
    800027ec:	ee051ae3          	bnez	a0,800026e0 <handle_page_fault+0x54>
    800027f0:	fff00513          	li	a0,-1
    800027f4:	f4dff06f          	j	80002740 <handle_page_fault+0xb4>
    800027f8:	00098513          	mv	a0,s3
    800027fc:	ab9fe0ef          	jal	800012b4 <free_page>
    80002800:	fff00513          	li	a0,-1
    80002804:	f3dff06f          	j	80002740 <handle_page_fault+0xb4>

0000000080002808 <va2pa_with_replacement>:
    80002808:	fe010113          	add	sp,sp,-32
    8000280c:	00913423          	sd	s1,8(sp)
    80002810:	01213023          	sd	s2,0(sp)
    80002814:	00113c23          	sd	ra,24(sp)
    80002818:	00813823          	sd	s0,16(sp)
    8000281c:	00050493          	mv	s1,a0
    80002820:	00058913          	mv	s2,a1
    80002824:	b79fe0ef          	jal	8000139c <walk_lookup>
    80002828:	00050a63          	beqz	a0,8000283c <va2pa_with_replacement+0x34>
    8000282c:	00053403          	ld	s0,0(a0)
    80002830:	00147793          	and	a5,s0,1
    80002834:	06079663          	bnez	a5,800028a0 <va2pa_with_replacement+0x98>
    80002838:	02041063          	bnez	s0,80002858 <va2pa_with_replacement+0x50>
    8000283c:	00000513          	li	a0,0
    80002840:	01813083          	ld	ra,24(sp)
    80002844:	01013403          	ld	s0,16(sp)
    80002848:	00813483          	ld	s1,8(sp)
    8000284c:	00013903          	ld	s2,0(sp)
    80002850:	02010113          	add	sp,sp,32
    80002854:	00008067          	ret
    80002858:	00600613          	li	a2,6
    8000285c:	00090593          	mv	a1,s2
    80002860:	00048513          	mv	a0,s1
    80002864:	e29ff0ef          	jal	8000268c <handle_page_fault>
    80002868:	fc051ae3          	bnez	a0,8000283c <va2pa_with_replacement+0x34>
    8000286c:	00090593          	mv	a1,s2
    80002870:	00048513          	mv	a0,s1
    80002874:	b29fe0ef          	jal	8000139c <walk_lookup>
    80002878:	fc0502e3          	beqz	a0,8000283c <va2pa_with_replacement+0x34>
    8000287c:	00053783          	ld	a5,0(a0)
    80002880:	0017f713          	and	a4,a5,1
    80002884:	fa070ce3          	beqz	a4,8000283c <va2pa_with_replacement+0x34>
    80002888:	00a7d793          	srl	a5,a5,0xa
    8000288c:	03491593          	sll	a1,s2,0x34
    80002890:	00c79513          	sll	a0,a5,0xc
    80002894:	0345d593          	srl	a1,a1,0x34
    80002898:	00b50533          	add	a0,a0,a1
    8000289c:	fa5ff06f          	j	80002840 <va2pa_with_replacement+0x38>
    800028a0:	00090513          	mv	a0,s2
    800028a4:	a51ff0ef          	jal	800022f4 <lru_touch_page>
    800028a8:	01813083          	ld	ra,24(sp)
    800028ac:	00a45513          	srl	a0,s0,0xa
    800028b0:	01013403          	ld	s0,16(sp)
    800028b4:	03491593          	sll	a1,s2,0x34
    800028b8:	00c51513          	sll	a0,a0,0xc
    800028bc:	0345d593          	srl	a1,a1,0x34
    800028c0:	00813483          	ld	s1,8(sp)
    800028c4:	00013903          	ld	s2,0(sp)
    800028c8:	00b50533          	add	a0,a0,a1
    800028cc:	02010113          	add	sp,sp,32
    800028d0:	00008067          	ret

00000000800028d4 <safe_copyout>:
    800028d4:	14068063          	beqz	a3,80002a14 <safe_copyout+0x140>
    800028d8:	fb010113          	add	sp,sp,-80
    800028dc:	02913c23          	sd	s1,56(sp)
    800028e0:	03213823          	sd	s2,48(sp)
    800028e4:	03313423          	sd	s3,40(sp)
    800028e8:	03413023          	sd	s4,32(sp)
    800028ec:	01513c23          	sd	s5,24(sp)
    800028f0:	01613823          	sd	s6,16(sp)
    800028f4:	01713423          	sd	s7,8(sp)
    800028f8:	01813023          	sd	s8,0(sp)
    800028fc:	04113423          	sd	ra,72(sp)
    80002900:	04813023          	sd	s0,64(sp)
    80002904:	00068b13          	mv	s6,a3
    80002908:	00050993          	mv	s3,a0
    8000290c:	00058c13          	mv	s8,a1
    80002910:	00060b93          	mv	s7,a2
    80002914:	fffffa37          	lui	s4,0xfffff
    80002918:	00001937          	lui	s2,0x1
    8000291c:	10000493          	li	s1,256
    80002920:	0040ea97          	auipc	s5,0x40e
    80002924:	770a8a93          	add	s5,s5,1904 # 80411090 <lru_mgr>
    80002928:	014c7433          	and	s0,s8,s4
    8000292c:	00040593          	mv	a1,s0
    80002930:	00098513          	mv	a0,s3
    80002934:	ed5ff0ef          	jal	80002808 <va2pa_with_replacement>
    80002938:	0c050a63          	beqz	a0,80002a0c <safe_copyout+0x138>
    8000293c:	41840833          	sub	a6,s0,s8
    80002940:	01280833          	add	a6,a6,s2
    80002944:	010b7463          	bgeu	s6,a6,8000294c <safe_copyout+0x78>
    80002948:	000b0813          	mv	a6,s6
    8000294c:	01850733          	add	a4,a0,s8
    80002950:	40870733          	sub	a4,a4,s0
    80002954:	01780533          	add	a0,a6,s7
    80002958:	000b8793          	mv	a5,s7
    8000295c:	41770733          	sub	a4,a4,s7
    80002960:	0a080263          	beqz	a6,80002a04 <safe_copyout+0x130>
    80002964:	0007c583          	lbu	a1,0(a5)
    80002968:	00f70633          	add	a2,a4,a5
    8000296c:	00178793          	add	a5,a5,1
    80002970:	00b60023          	sb	a1,0(a2)
    80002974:	fef518e3          	bne	a0,a5,80002964 <safe_copyout+0x90>
    80002978:	0040e797          	auipc	a5,0x40e
    8000297c:	72878793          	add	a5,a5,1832 # 804110a0 <lru_mgr+0x10>
    80002980:	00000713          	li	a4,0
    80002984:	0100006f          	j	80002994 <safe_copyout+0xc0>
    80002988:	0017071b          	addw	a4,a4,1
    8000298c:	03078793          	add	a5,a5,48
    80002990:	02970863          	beq	a4,s1,800029c0 <safe_copyout+0xec>
    80002994:	0007b603          	ld	a2,0(a5)
    80002998:	fec418e3          	bne	s0,a2,80002988 <safe_copyout+0xb4>
    8000299c:	0147a603          	lw	a2,20(a5)
    800029a0:	00167593          	and	a1,a2,1
    800029a4:	fe0582e3          	beqz	a1,80002988 <safe_copyout+0xb4>
    800029a8:	00171793          	sll	a5,a4,0x1
    800029ac:	00e787b3          	add	a5,a5,a4
    800029b0:	00479793          	sll	a5,a5,0x4
    800029b4:	00fa87b3          	add	a5,s5,a5
    800029b8:	00466613          	or	a2,a2,4
    800029bc:	02c7a223          	sw	a2,36(a5)
    800029c0:	410b0b33          	sub	s6,s6,a6
    800029c4:	00050b93          	mv	s7,a0
    800029c8:	01240c33          	add	s8,s0,s2
    800029cc:	f40b1ee3          	bnez	s6,80002928 <safe_copyout+0x54>
    800029d0:	00000513          	li	a0,0
    800029d4:	04813083          	ld	ra,72(sp)
    800029d8:	04013403          	ld	s0,64(sp)
    800029dc:	03813483          	ld	s1,56(sp)
    800029e0:	03013903          	ld	s2,48(sp)
    800029e4:	02813983          	ld	s3,40(sp)
    800029e8:	02013a03          	ld	s4,32(sp)
    800029ec:	01813a83          	ld	s5,24(sp)
    800029f0:	01013b03          	ld	s6,16(sp)
    800029f4:	00813b83          	ld	s7,8(sp)
    800029f8:	00013c03          	ld	s8,0(sp)
    800029fc:	05010113          	add	sp,sp,80
    80002a00:	00008067          	ret
    80002a04:	000b8513          	mv	a0,s7
    80002a08:	f71ff06f          	j	80002978 <safe_copyout+0xa4>
    80002a0c:	fff00513          	li	a0,-1
    80002a10:	fc5ff06f          	j	800029d4 <safe_copyout+0x100>
    80002a14:	00000513          	li	a0,0
    80002a18:	00008067          	ret

0000000080002a1c <safe_copyin>:
    80002a1c:	0e068863          	beqz	a3,80002b0c <safe_copyin+0xf0>
    80002a20:	fc010113          	add	sp,sp,-64
    80002a24:	02813823          	sd	s0,48(sp)
    80002a28:	02913423          	sd	s1,40(sp)
    80002a2c:	03213023          	sd	s2,32(sp)
    80002a30:	01313c23          	sd	s3,24(sp)
    80002a34:	01513423          	sd	s5,8(sp)
    80002a38:	01613023          	sd	s6,0(sp)
    80002a3c:	02113c23          	sd	ra,56(sp)
    80002a40:	01413823          	sd	s4,16(sp)
    80002a44:	00068b13          	mv	s6,a3
    80002a48:	00050493          	mv	s1,a0
    80002a4c:	00058993          	mv	s3,a1
    80002a50:	00060a93          	mv	s5,a2
    80002a54:	fffff937          	lui	s2,0xfffff
    80002a58:	00001437          	lui	s0,0x1
    80002a5c:	012afa33          	and	s4,s5,s2
    80002a60:	000a0593          	mv	a1,s4
    80002a64:	00048513          	mv	a0,s1
    80002a68:	da1ff0ef          	jal	80002808 <va2pa_with_replacement>
    80002a6c:	08050c63          	beqz	a0,80002b04 <safe_copyin+0xe8>
    80002a70:	415a08b3          	sub	a7,s4,s5
    80002a74:	008888b3          	add	a7,a7,s0
    80002a78:	011b7463          	bgeu	s6,a7,80002a80 <safe_copyin+0x64>
    80002a7c:	000b0893          	mv	a7,s6
    80002a80:	01550533          	add	a0,a0,s5
    80002a84:	41450533          	sub	a0,a0,s4
    80002a88:	06088063          	beqz	a7,80002ae8 <safe_copyin+0xcc>
    80002a8c:	00098793          	mv	a5,s3
    80002a90:	01198833          	add	a6,s3,a7
    80002a94:	41350733          	sub	a4,a0,s3
    80002a98:	00f70633          	add	a2,a4,a5
    80002a9c:	00064603          	lbu	a2,0(a2)
    80002aa0:	00178793          	add	a5,a5,1
    80002aa4:	fec78fa3          	sb	a2,-1(a5)
    80002aa8:	fef818e3          	bne	a6,a5,80002a98 <safe_copyin+0x7c>
    80002aac:	411b0b33          	sub	s6,s6,a7
    80002ab0:	00080993          	mv	s3,a6
    80002ab4:	008a0ab3          	add	s5,s4,s0
    80002ab8:	fa0b12e3          	bnez	s6,80002a5c <safe_copyin+0x40>
    80002abc:	00000513          	li	a0,0
    80002ac0:	03813083          	ld	ra,56(sp)
    80002ac4:	03013403          	ld	s0,48(sp)
    80002ac8:	02813483          	ld	s1,40(sp)
    80002acc:	02013903          	ld	s2,32(sp)
    80002ad0:	01813983          	ld	s3,24(sp)
    80002ad4:	01013a03          	ld	s4,16(sp)
    80002ad8:	00813a83          	ld	s5,8(sp)
    80002adc:	00013b03          	ld	s6,0(sp)
    80002ae0:	04010113          	add	sp,sp,64
    80002ae4:	00008067          	ret
    80002ae8:	00001ab7          	lui	s5,0x1
    80002aec:	015a0ab3          	add	s5,s4,s5
    80002af0:	012afa33          	and	s4,s5,s2
    80002af4:	000a0593          	mv	a1,s4
    80002af8:	00048513          	mv	a0,s1
    80002afc:	d0dff0ef          	jal	80002808 <va2pa_with_replacement>
    80002b00:	f60518e3          	bnez	a0,80002a70 <safe_copyin+0x54>
    80002b04:	fff00513          	li	a0,-1
    80002b08:	fb9ff06f          	j	80002ac0 <safe_copyin+0xa4>
    80002b0c:	00000513          	li	a0,0
    80002b10:	00008067          	ret

0000000080002b14 <test_page_replacement>:
    80002b14:	f4010113          	add	sp,sp,-192
    80002b18:	00003517          	auipc	a0,0x3
    80002b1c:	8f850513          	add	a0,a0,-1800 # 80005410 <digits+0x68>
    80002b20:	0a113c23          	sd	ra,184(sp)
    80002b24:	0a813823          	sd	s0,176(sp)
    80002b28:	0a913423          	sd	s1,168(sp)
    80002b2c:	0b213023          	sd	s2,160(sp)
    80002b30:	09313c23          	sd	s3,152(sp)
    80002b34:	eb8fe0ef          	jal	800011ec <uart_puts>
    80002b38:	00003517          	auipc	a0,0x3
    80002b3c:	90050513          	add	a0,a0,-1792 # 80005438 <digits+0x90>
    80002b40:	eacfe0ef          	jal	800011ec <uart_puts>
    80002b44:	d18ff0ef          	jal	8000205c <alloc_swap_slot>
    80002b48:	0005049b          	sext.w	s1,a0
    80002b4c:	d10ff0ef          	jal	8000205c <alloc_swap_slot>
    80002b50:	0005041b          	sext.w	s0,a0
    80002b54:	d08ff0ef          	jal	8000205c <alloc_swap_slot>
    80002b58:	fff00793          	li	a5,-1
    80002b5c:	02f48663          	beq	s1,a5,80002b88 <test_page_replacement+0x74>
    80002b60:	1cf40c63          	beq	s0,a5,80002d38 <test_page_replacement+0x224>
    80002b64:	0005051b          	sext.w	a0,a0
    80002b68:	02f50063          	beq	a0,a5,80002b88 <test_page_replacement+0x74>
    80002b6c:	00848e63          	beq	s1,s0,80002b88 <test_page_replacement+0x74>
    80002b70:	00a40c63          	beq	s0,a0,80002b88 <test_page_replacement+0x74>
    80002b74:	00a48a63          	beq	s1,a0,80002b88 <test_page_replacement+0x74>
    80002b78:	00003517          	auipc	a0,0x3
    80002b7c:	8e850513          	add	a0,a0,-1816 # 80005460 <digits+0xb8>
    80002b80:	e6cfe0ef          	jal	800011ec <uart_puts>
    80002b84:	0100006f          	j	80002b94 <test_page_replacement+0x80>
    80002b88:	00003517          	auipc	a0,0x3
    80002b8c:	8f850513          	add	a0,a0,-1800 # 80005480 <digits+0xd8>
    80002b90:	e5cfe0ef          	jal	800011ec <uart_puts>
    80002b94:	0000e797          	auipc	a5,0xe
    80002b98:	4f07a783          	lw	a5,1264(a5) # 80011084 <swap_mgr+0x84>
    80002b9c:	00f47663          	bgeu	s0,a5,80002ba8 <test_page_replacement+0x94>
    80002ba0:	00040513          	mv	a0,s0
    80002ba4:	86dfe0ef          	jal	80001410 <free_swap_slot.part.0>
    80002ba8:	cb4ff0ef          	jal	8000205c <alloc_swap_slot>
    80002bac:	0005051b          	sext.w	a0,a0
    80002bb0:	14a40c63          	beq	s0,a0,80002d08 <test_page_replacement+0x1f4>
    80002bb4:	00003517          	auipc	a0,0x3
    80002bb8:	91450513          	add	a0,a0,-1772 # 800054c8 <digits+0x120>
    80002bbc:	e30fe0ef          	jal	800011ec <uart_puts>
    80002bc0:	00003517          	auipc	a0,0x3
    80002bc4:	93050513          	add	a0,a0,-1744 # 800054f0 <digits+0x148>
    80002bc8:	e24fe0ef          	jal	800011ec <uart_puts>
    80002bcc:	00080737          	lui	a4,0x80
    80002bd0:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    80002bd4:	00010637          	lui	a2,0x10
    80002bd8:	00c71713          	sll	a4,a4,0xc
    80002bdc:	fff00793          	li	a5,-1
    80002be0:	01f7d793          	srl	a5,a5,0x1f
    80002be4:	00c13023          	sd	a2,0(sp)
    80002be8:	02e13c23          	sd	a4,56(sp)
    80002bec:	00100613          	li	a2,1
    80002bf0:	00012737          	lui	a4,0x12
    80002bf4:	01f61613          	sll	a2,a2,0x1f
    80002bf8:	00f13823          	sd	a5,16(sp)
    80002bfc:	04f13023          	sd	a5,64(sp)
    80002c00:	06e13023          	sd	a4,96(sp)
    80002c04:	06f13823          	sd	a5,112(sp)
    80002c08:	40001737          	lui	a4,0x40001
    80002c0c:	03010793          	add	a5,sp,48
    80002c10:	00423697          	auipc	a3,0x423
    80002c14:	5c06b683          	ld	a3,1472(a3) # 804261d0 <kernel_pagetable>
    80002c18:	00171713          	sll	a4,a4,0x1
    80002c1c:	0040e417          	auipc	s0,0x40e
    80002c20:	47440413          	add	s0,s0,1140 # 80411090 <lru_mgr>
    80002c24:	00010493          	mv	s1,sp
    80002c28:	06010993          	add	s3,sp,96
    80002c2c:	00c13423          	sd	a2,8(sp)
    80002c30:	00f13c23          	sd	a5,24(sp)
    80002c34:	00011637          	lui	a2,0x11
    80002c38:	08f13023          	sd	a5,128(sp)
    80002c3c:	00411917          	auipc	s2,0x411
    80002c40:	45490913          	add	s2,s2,1108 # 80414090 <lru_mgr+0x3000>
    80002c44:	00300793          	li	a5,3
    80002c48:	00003517          	auipc	a0,0x3
    80002c4c:	8c850513          	add	a0,a0,-1848 # 80005510 <digits+0x168>
    80002c50:	06e13423          	sd	a4,104(sp)
    80002c54:	00f92823          	sw	a5,16(s2)
    80002c58:	02013023          	sd	zero,32(sp)
    80002c5c:	02d13423          	sd	a3,40(sp)
    80002c60:	02c13823          	sd	a2,48(sp)
    80002c64:	04d13c23          	sd	a3,88(sp)
    80002c68:	06013c23          	sd	zero,120(sp)
    80002c6c:	08d13423          	sd	a3,136(sp)
    80002c70:	00943423          	sd	s1,8(s0)
    80002c74:	04913823          	sd	s1,80(sp)
    80002c78:	05313423          	sd	s3,72(sp)
    80002c7c:	01343023          	sd	s3,0(s0)
    80002c80:	d6cfe0ef          	jal	800011ec <uart_puts>
    80002c84:	04813783          	ld	a5,72(sp)
    80002c88:	05013703          	ld	a4,80(sp)
    80002c8c:	08078a63          	beqz	a5,80002d20 <test_page_replacement+0x20c>
    80002c90:	02e7b023          	sd	a4,32(a5)
    80002c94:	08070263          	beqz	a4,80002d18 <test_page_replacement+0x204>
    80002c98:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    80002c9c:	01092783          	lw	a5,16(s2)
    80002ca0:	04013823          	sd	zero,80(sp)
    80002ca4:	04013423          	sd	zero,72(sp)
    80002ca8:	fff7871b          	addw	a4,a5,-1
    80002cac:	00e92823          	sw	a4,16(s2)
    80002cb0:	00200793          	li	a5,2
    80002cb4:	00f71663          	bne	a4,a5,80002cc0 <test_page_replacement+0x1ac>
    80002cb8:	00043783          	ld	a5,0(s0)
    80002cbc:	09378663          	beq	a5,s3,80002d48 <test_page_replacement+0x234>
    80002cc0:	00003517          	auipc	a0,0x3
    80002cc4:	89050513          	add	a0,a0,-1904 # 80005550 <digits+0x1a8>
    80002cc8:	d24fe0ef          	jal	800011ec <uart_puts>
    80002ccc:	00843783          	ld	a5,8(s0)
    80002cd0:	04978c63          	beq	a5,s1,80002d28 <test_page_replacement+0x214>
    80002cd4:	00003517          	auipc	a0,0x3
    80002cd8:	8bc50513          	add	a0,a0,-1860 # 80005590 <digits+0x1e8>
    80002cdc:	d10fe0ef          	jal	800011ec <uart_puts>
    80002ce0:	00003517          	auipc	a0,0x3
    80002ce4:	8d050513          	add	a0,a0,-1840 # 800055b0 <digits+0x208>
    80002ce8:	d04fe0ef          	jal	800011ec <uart_puts>
    80002cec:	0b813083          	ld	ra,184(sp)
    80002cf0:	0b013403          	ld	s0,176(sp)
    80002cf4:	0a813483          	ld	s1,168(sp)
    80002cf8:	0a013903          	ld	s2,160(sp)
    80002cfc:	09813983          	ld	s3,152(sp)
    80002d00:	0c010113          	add	sp,sp,192
    80002d04:	00008067          	ret
    80002d08:	00002517          	auipc	a0,0x2
    80002d0c:	79850513          	add	a0,a0,1944 # 800054a0 <digits+0xf8>
    80002d10:	cdcfe0ef          	jal	800011ec <uart_puts>
    80002d14:	eadff06f          	j	80002bc0 <test_page_replacement+0xac>
    80002d18:	00f43423          	sd	a5,8(s0)
    80002d1c:	f81ff06f          	j	80002c9c <test_page_replacement+0x188>
    80002d20:	00e43023          	sd	a4,0(s0)
    80002d24:	f71ff06f          	j	80002c94 <test_page_replacement+0x180>
    80002d28:	00003517          	auipc	a0,0x3
    80002d2c:	84850513          	add	a0,a0,-1976 # 80005570 <digits+0x1c8>
    80002d30:	cbcfe0ef          	jal	800011ec <uart_puts>
    80002d34:	fadff06f          	j	80002ce0 <test_page_replacement+0x1cc>
    80002d38:	00002517          	auipc	a0,0x2
    80002d3c:	74850513          	add	a0,a0,1864 # 80005480 <digits+0xd8>
    80002d40:	cacfe0ef          	jal	800011ec <uart_puts>
    80002d44:	e65ff06f          	j	80002ba8 <test_page_replacement+0x94>
    80002d48:	00843783          	ld	a5,8(s0)
    80002d4c:	f6979ae3          	bne	a5,s1,80002cc0 <test_page_replacement+0x1ac>
    80002d50:	00002517          	auipc	a0,0x2
    80002d54:	7e050513          	add	a0,a0,2016 # 80005530 <digits+0x188>
    80002d58:	c94fe0ef          	jal	800011ec <uart_puts>
    80002d5c:	f71ff06f          	j	80002ccc <test_page_replacement+0x1b8>

0000000080002d60 <machine_timer_handler>:
    80002d60:	00423797          	auipc	a5,0x423
    80002d64:	47878793          	add	a5,a5,1144 # 804261d8 <m_mode_ticks>
    80002d68:	0007b703          	ld	a4,0(a5)
    80002d6c:	ff010113          	add	sp,sp,-16
    80002d70:	00113423          	sd	ra,8(sp)
    80002d74:	00170713          	add	a4,a4,1
    80002d78:	00e7b023          	sd	a4,0(a5)
    80002d7c:	00423697          	auipc	a3,0x423
    80002d80:	46468693          	add	a3,a3,1124 # 804261e0 <ticks>
    80002d84:	0006b703          	ld	a4,0(a3)
    80002d88:	00003517          	auipc	a0,0x3
    80002d8c:	85050513          	add	a0,a0,-1968 # 800055d8 <digits+0x230>
    80002d90:	00170713          	add	a4,a4,1
    80002d94:	00e6b023          	sd	a4,0(a3)
    80002d98:	0007b583          	ld	a1,0(a5)
    80002d9c:	8e0fe0ef          	jal	80000e7c <printf>
    80002da0:	0200c7b7          	lui	a5,0x200c
    80002da4:	ff87b783          	ld	a5,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80002da8:	000f4737          	lui	a4,0xf4
    80002dac:	00813083          	ld	ra,8(sp)
    80002db0:	24070713          	add	a4,a4,576 # f4240 <_entry-0x7ff0bdc0>
    80002db4:	00e787b3          	add	a5,a5,a4
    80002db8:	02004737          	lui	a4,0x2004
    80002dbc:	00f73023          	sd	a5,0(a4) # 2004000 <_entry-0x7dffc000>
    80002dc0:	01010113          	add	sp,sp,16
    80002dc4:	00008067          	ret

0000000080002dc8 <alloc_trapframe>:
    80002dc8:	00411597          	auipc	a1,0x411
    80002dcc:	2e058593          	add	a1,a1,736 # 804140a8 <trapframe_used>
    80002dd0:	00058793          	mv	a5,a1
    80002dd4:	00000713          	li	a4,0
    80002dd8:	10000613          	li	a2,256
    80002ddc:	00c0006f          	j	80002de8 <alloc_trapframe+0x20>
    80002de0:	0017071b          	addw	a4,a4,1
    80002de4:	02c70e63          	beq	a4,a2,80002e20 <alloc_trapframe+0x58>
    80002de8:	0007a683          	lw	a3,0(a5)
    80002dec:	00478793          	add	a5,a5,4
    80002df0:	fe0698e3          	bnez	a3,80002de0 <alloc_trapframe+0x18>
    80002df4:	00271793          	sll	a5,a4,0x2
    80002df8:	00471513          	sll	a0,a4,0x4
    80002dfc:	00f585b3          	add	a1,a1,a5
    80002e00:	00e50533          	add	a0,a0,a4
    80002e04:	00100793          	li	a5,1
    80002e08:	00f5a023          	sw	a5,0(a1)
    80002e0c:	00451513          	sll	a0,a0,0x4
    80002e10:	00411797          	auipc	a5,0x411
    80002e14:	71878793          	add	a5,a5,1816 # 80414528 <trapframe_pool>
    80002e18:	00f50533          	add	a0,a0,a5
    80002e1c:	00008067          	ret
    80002e20:	00000513          	li	a0,0
    80002e24:	00008067          	ret

0000000080002e28 <free_trapframe>:
    80002e28:	00411797          	auipc	a5,0x411
    80002e2c:	70078793          	add	a5,a5,1792 # 80414528 <trapframe_pool>
    80002e30:	02f56c63          	bltu	a0,a5,80002e68 <free_trapframe+0x40>
    80002e34:	00422717          	auipc	a4,0x422
    80002e38:	6f470713          	add	a4,a4,1780 # 80425528 <cpus>
    80002e3c:	02e57663          	bgeu	a0,a4,80002e68 <free_trapframe+0x40>
    80002e40:	40f507b3          	sub	a5,a0,a5
    80002e44:	00003717          	auipc	a4,0x3
    80002e48:	cec73703          	ld	a4,-788(a4) # 80005b30 <digits+0x788>
    80002e4c:	4047d793          	sra	a5,a5,0x4
    80002e50:	02e787b3          	mul	a5,a5,a4
    80002e54:	00411717          	auipc	a4,0x411
    80002e58:	25470713          	add	a4,a4,596 # 804140a8 <trapframe_used>
    80002e5c:	00279793          	sll	a5,a5,0x2
    80002e60:	00f707b3          	add	a5,a4,a5
    80002e64:	0007a023          	sw	zero,0(a5)
    80002e68:	00008067          	ret

0000000080002e6c <intr_on>:
    80002e6c:	100027f3          	csrr	a5,sstatus
    80002e70:	0027e793          	or	a5,a5,2
    80002e74:	10079073          	csrw	sstatus,a5
    80002e78:	00008067          	ret

0000000080002e7c <intr_off>:
    80002e7c:	100027f3          	csrr	a5,sstatus
    80002e80:	ffd7f793          	and	a5,a5,-3
    80002e84:	10079073          	csrw	sstatus,a5
    80002e88:	00008067          	ret

0000000080002e8c <intr_get>:
    80002e8c:	10002573          	csrr	a0,sstatus
    80002e90:	00155513          	srl	a0,a0,0x1
    80002e94:	00157513          	and	a0,a0,1
    80002e98:	00008067          	ret

0000000080002e9c <set_stvec>:
    80002e9c:	00a585b3          	add	a1,a1,a0
    80002ea0:	10559073          	csrw	stvec,a1
    80002ea4:	00008067          	ret

0000000080002ea8 <trap_init>:
    80002ea8:	ff010113          	add	sp,sp,-16
    80002eac:	00002517          	auipc	a0,0x2
    80002eb0:	75c50513          	add	a0,a0,1884 # 80005608 <digits+0x260>
    80002eb4:	00113423          	sd	ra,8(sp)
    80002eb8:	b34fe0ef          	jal	800011ec <uart_puts>
    80002ebc:	00411797          	auipc	a5,0x411
    80002ec0:	1ec78793          	add	a5,a5,492 # 804140a8 <trapframe_used>
    80002ec4:	00411717          	auipc	a4,0x411
    80002ec8:	5e470713          	add	a4,a4,1508 # 804144a8 <trap_handlers>
    80002ecc:	0007a023          	sw	zero,0(a5)
    80002ed0:	00478793          	add	a5,a5,4
    80002ed4:	fee79ce3          	bne	a5,a4,80002ecc <trap_init+0x24>
    80002ed8:	00411797          	auipc	a5,0x411
    80002edc:	5d078793          	add	a5,a5,1488 # 804144a8 <trap_handlers>
    80002ee0:	00411717          	auipc	a4,0x411
    80002ee4:	64870713          	add	a4,a4,1608 # 80414528 <trapframe_pool>
    80002ee8:	0007b023          	sd	zero,0(a5)
    80002eec:	00878793          	add	a5,a5,8
    80002ef0:	fee79ce3          	bne	a5,a4,80002ee8 <trap_init+0x40>
    80002ef4:	00813083          	ld	ra,8(sp)
    80002ef8:	00002517          	auipc	a0,0x2
    80002efc:	73850513          	add	a0,a0,1848 # 80005630 <digits+0x288>
    80002f00:	01010113          	add	sp,sp,16
    80002f04:	ae8fe06f          	j	800011ec <uart_puts>

0000000080002f08 <trap_init_hart>:
    80002f08:	ff010113          	add	sp,sp,-16
    80002f0c:	00002517          	auipc	a0,0x2
    80002f10:	74450513          	add	a0,a0,1860 # 80005650 <digits+0x2a8>
    80002f14:	00113423          	sd	ra,8(sp)
    80002f18:	ad4fe0ef          	jal	800011ec <uart_puts>
    80002f1c:	00001797          	auipc	a5,0x1
    80002f20:	c8478793          	add	a5,a5,-892 # 80003ba0 <kernelvec>
    80002f24:	10579073          	csrw	stvec,a5
    80002f28:	104027f3          	csrr	a5,sie
    80002f2c:	2227e793          	or	a5,a5,546
    80002f30:	10479073          	csrw	sie,a5
    80002f34:	100027f3          	csrr	a5,sstatus
    80002f38:	0027e793          	or	a5,a5,2
    80002f3c:	10079073          	csrw	sstatus,a5
    80002f40:	00813083          	ld	ra,8(sp)
    80002f44:	00002517          	auipc	a0,0x2
    80002f48:	73450513          	add	a0,a0,1844 # 80005678 <digits+0x2d0>
    80002f4c:	01010113          	add	sp,sp,16
    80002f50:	a9cfe06f          	j	800011ec <uart_puts>

0000000080002f54 <set_next_timer>:
    80002f54:	0200c7b7          	lui	a5,0x200c
    80002f58:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80002f5c:	000f4637          	lui	a2,0xf4
    80002f60:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002f64:	00c58633          	add	a2,a1,a2
    80002f68:	020047b7          	lui	a5,0x2004
    80002f6c:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80002f70:	00002517          	auipc	a0,0x2
    80002f74:	73050513          	add	a0,a0,1840 # 800056a0 <digits+0x2f8>
    80002f78:	f05fd06f          	j	80000e7c <printf>

0000000080002f7c <timerinit>:
    80002f7c:	ff010113          	add	sp,sp,-16
    80002f80:	00002517          	auipc	a0,0x2
    80002f84:	75050513          	add	a0,a0,1872 # 800056d0 <digits+0x328>
    80002f88:	00113423          	sd	ra,8(sp)
    80002f8c:	a60fe0ef          	jal	800011ec <uart_puts>
    80002f90:	0200c7b7          	lui	a5,0x200c
    80002f94:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80002f98:	000f4637          	lui	a2,0xf4
    80002f9c:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002fa0:	00c58633          	add	a2,a1,a2
    80002fa4:	020047b7          	lui	a5,0x2004
    80002fa8:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80002fac:	00002517          	auipc	a0,0x2
    80002fb0:	6f450513          	add	a0,a0,1780 # 800056a0 <digits+0x2f8>
    80002fb4:	ec9fd0ef          	jal	80000e7c <printf>
    80002fb8:	00813083          	ld	ra,8(sp)
    80002fbc:	00002517          	auipc	a0,0x2
    80002fc0:	73450513          	add	a0,a0,1844 # 800056f0 <digits+0x348>
    80002fc4:	01010113          	add	sp,sp,16
    80002fc8:	a24fe06f          	j	800011ec <uart_puts>

0000000080002fcc <devintr>:
    80002fcc:	142025f3          	csrr	a1,scause
    80002fd0:	0e05d063          	bgez	a1,800030b0 <devintr+0xe4>
    80002fd4:	ff010113          	add	sp,sp,-16
    80002fd8:	00113423          	sd	ra,8(sp)
    80002fdc:	00813023          	sd	s0,0(sp)
    80002fe0:	00f5f593          	and	a1,a1,15
    80002fe4:	00500793          	li	a5,5
    80002fe8:	06f58a63          	beq	a1,a5,8000305c <devintr+0x90>
    80002fec:	00900793          	li	a5,9
    80002ff0:	04f58c63          	beq	a1,a5,80003048 <devintr+0x7c>
    80002ff4:	00100793          	li	a5,1
    80002ff8:	02f58263          	beq	a1,a5,8000301c <devintr+0x50>
    80002ffc:	00002517          	auipc	a0,0x2
    80003000:	77c50513          	add	a0,a0,1916 # 80005778 <digits+0x3d0>
    80003004:	e79fd0ef          	jal	80000e7c <printf>
    80003008:	00813083          	ld	ra,8(sp)
    8000300c:	00013403          	ld	s0,0(sp)
    80003010:	00000513          	li	a0,0
    80003014:	01010113          	add	sp,sp,16
    80003018:	00008067          	ret
    8000301c:	00002517          	auipc	a0,0x2
    80003020:	73c50513          	add	a0,a0,1852 # 80005758 <digits+0x3b0>
    80003024:	9c8fe0ef          	jal	800011ec <uart_puts>
    80003028:	144027f3          	csrr	a5,sip
    8000302c:	ffd7f793          	and	a5,a5,-3
    80003030:	14479073          	csrw	sip,a5
    80003034:	00100513          	li	a0,1
    80003038:	00813083          	ld	ra,8(sp)
    8000303c:	00013403          	ld	s0,0(sp)
    80003040:	01010113          	add	sp,sp,16
    80003044:	00008067          	ret
    80003048:	00002517          	auipc	a0,0x2
    8000304c:	6f050513          	add	a0,a0,1776 # 80005738 <digits+0x390>
    80003050:	99cfe0ef          	jal	800011ec <uart_puts>
    80003054:	00100513          	li	a0,1
    80003058:	fe1ff06f          	j	80003038 <devintr+0x6c>
    8000305c:	00423417          	auipc	s0,0x423
    80003060:	18440413          	add	s0,s0,388 # 804261e0 <ticks>
    80003064:	00043783          	ld	a5,0(s0)
    80003068:	000f4637          	lui	a2,0xf4
    8000306c:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003070:	00178793          	add	a5,a5,1
    80003074:	00f43023          	sd	a5,0(s0)
    80003078:	0200c7b7          	lui	a5,0x200c
    8000307c:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80003080:	020047b7          	lui	a5,0x2004
    80003084:	00002517          	auipc	a0,0x2
    80003088:	61c50513          	add	a0,a0,1564 # 800056a0 <digits+0x2f8>
    8000308c:	00c58633          	add	a2,a1,a2
    80003090:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80003094:	de9fd0ef          	jal	80000e7c <printf>
    80003098:	00043583          	ld	a1,0(s0)
    8000309c:	00002517          	auipc	a0,0x2
    800030a0:	67450513          	add	a0,a0,1652 # 80005710 <digits+0x368>
    800030a4:	dd9fd0ef          	jal	80000e7c <printf>
    800030a8:	00100513          	li	a0,1
    800030ac:	f8dff06f          	j	80003038 <devintr+0x6c>
    800030b0:	00000513          	li	a0,0
    800030b4:	00008067          	ret

00000000800030b8 <handle_exception>:
    800030b8:	142027f3          	csrr	a5,scause
    800030bc:	14102673          	csrr	a2,sepc
    800030c0:	143025f3          	csrr	a1,stval
    800030c4:	00f00713          	li	a4,15
    800030c8:	02f76063          	bltu	a4,a5,800030e8 <handle_exception+0x30>
    800030cc:	00003697          	auipc	a3,0x3
    800030d0:	84868693          	add	a3,a3,-1976 # 80005914 <digits+0x56c>
    800030d4:	00279713          	sll	a4,a5,0x2
    800030d8:	00d70733          	add	a4,a4,a3
    800030dc:	00072703          	lw	a4,0(a4)
    800030e0:	00d70733          	add	a4,a4,a3
    800030e4:	00070067          	jr	a4
    800030e8:	00078593          	mv	a1,a5
    800030ec:	00002517          	auipc	a0,0x2
    800030f0:	75c50513          	add	a0,a0,1884 # 80005848 <digits+0x4a0>
    800030f4:	d89fd06f          	j	80000e7c <printf>
    800030f8:	00060593          	mv	a1,a2
    800030fc:	00002517          	auipc	a0,0x2
    80003100:	72450513          	add	a0,a0,1828 # 80005820 <digits+0x478>
    80003104:	d79fd06f          	j	80000e7c <printf>
    80003108:	ff010113          	add	sp,sp,-16
    8000310c:	00813023          	sd	s0,0(sp)
    80003110:	00050413          	mv	s0,a0
    80003114:	00002517          	auipc	a0,0x2
    80003118:	68450513          	add	a0,a0,1668 # 80005798 <digits+0x3f0>
    8000311c:	00113423          	sd	ra,8(sp)
    80003120:	8ccfe0ef          	jal	800011ec <uart_puts>
    80003124:	10043783          	ld	a5,256(s0)
    80003128:	00813083          	ld	ra,8(sp)
    8000312c:	00478793          	add	a5,a5,4
    80003130:	10f43023          	sd	a5,256(s0)
    80003134:	00013403          	ld	s0,0(sp)
    80003138:	01010113          	add	sp,sp,16
    8000313c:	00008067          	ret
    80003140:	00060593          	mv	a1,a2
    80003144:	00002517          	auipc	a0,0x2
    80003148:	66c50513          	add	a0,a0,1644 # 800057b0 <digits+0x408>
    8000314c:	d31fd06f          	j	80000e7c <printf>
    80003150:	00002517          	auipc	a0,0x2
    80003154:	68850513          	add	a0,a0,1672 # 800057d8 <digits+0x430>
    80003158:	d25fd06f          	j	80000e7c <printf>
    8000315c:	00002517          	auipc	a0,0x2
    80003160:	69c50513          	add	a0,a0,1692 # 800057f8 <digits+0x450>
    80003164:	d19fd06f          	j	80000e7c <printf>

0000000080003168 <kerneltrap>:
    80003168:	ff010113          	add	sp,sp,-16
    8000316c:	00113423          	sd	ra,8(sp)
    80003170:	00813023          	sd	s0,0(sp)
    80003174:	14202473          	csrr	s0,scause
    80003178:	14102573          	csrr	a0,sepc
    8000317c:	00044a63          	bltz	s0,80003190 <kerneltrap+0x28>
    80003180:	00013403          	ld	s0,0(sp)
    80003184:	00813083          	ld	ra,8(sp)
    80003188:	01010113          	add	sp,sp,16
    8000318c:	f2dff06f          	j	800030b8 <handle_exception>
    80003190:	e3dff0ef          	jal	80002fcc <devintr>
    80003194:	00050a63          	beqz	a0,800031a8 <kerneltrap+0x40>
    80003198:	00813083          	ld	ra,8(sp)
    8000319c:	00013403          	ld	s0,0(sp)
    800031a0:	01010113          	add	sp,sp,16
    800031a4:	00008067          	ret
    800031a8:	00f47593          	and	a1,s0,15
    800031ac:	00013403          	ld	s0,0(sp)
    800031b0:	00813083          	ld	ra,8(sp)
    800031b4:	00002517          	auipc	a0,0x2
    800031b8:	6bc50513          	add	a0,a0,1724 # 80005870 <digits+0x4c8>
    800031bc:	01010113          	add	sp,sp,16
    800031c0:	cbdfd06f          	j	80000e7c <printf>

00000000800031c4 <usertrap>:
    800031c4:	142025f3          	csrr	a1,scause
    800031c8:	0405c463          	bltz	a1,80003210 <usertrap+0x4c>
    800031cc:	00d00793          	li	a5,13
    800031d0:	02b7e063          	bltu	a5,a1,800031f0 <usertrap+0x2c>
    800031d4:	00b00793          	li	a5,11
    800031d8:	02b7e663          	bltu	a5,a1,80003204 <usertrap+0x40>
    800031dc:	00800793          	li	a5,8
    800031e0:	00f59c63          	bne	a1,a5,800031f8 <usertrap+0x34>
    800031e4:	00002517          	auipc	a0,0x2
    800031e8:	5b450513          	add	a0,a0,1460 # 80005798 <digits+0x3f0>
    800031ec:	800fe06f          	j	800011ec <uart_puts>
    800031f0:	00f00793          	li	a5,15
    800031f4:	00f58863          	beq	a1,a5,80003204 <usertrap+0x40>
    800031f8:	00002517          	auipc	a0,0x2
    800031fc:	6f050513          	add	a0,a0,1776 # 800058e8 <digits+0x540>
    80003200:	c7dfd06f          	j	80000e7c <printf>
    80003204:	00002517          	auipc	a0,0x2
    80003208:	6c450513          	add	a0,a0,1732 # 800058c8 <digits+0x520>
    8000320c:	fe1fd06f          	j	800011ec <uart_puts>
    80003210:	ff010113          	add	sp,sp,-16
    80003214:	00113423          	sd	ra,8(sp)
    80003218:	db5ff0ef          	jal	80002fcc <devintr>
    8000321c:	00050863          	beqz	a0,8000322c <usertrap+0x68>
    80003220:	00813083          	ld	ra,8(sp)
    80003224:	01010113          	add	sp,sp,16
    80003228:	00008067          	ret
    8000322c:	00813083          	ld	ra,8(sp)
    80003230:	00002517          	auipc	a0,0x2
    80003234:	67050513          	add	a0,a0,1648 # 800058a0 <digits+0x4f8>
    80003238:	01010113          	add	sp,sp,16
    8000323c:	c41fd06f          	j	80000e7c <printf>

0000000080003240 <free_proc.part.0>:
    80003240:	fe010113          	add	sp,sp,-32
    80003244:	00813823          	sd	s0,16(sp)
    80003248:	00913423          	sd	s1,8(sp)
    8000324c:	00113c23          	sd	ra,24(sp)
    80003250:	00050493          	mv	s1,a0
    80003254:	00423417          	auipc	s0,0x423
    80003258:	f9440413          	add	s0,s0,-108 # 804261e8 <proc_lock>
    8000325c:	00100713          	li	a4,1
    80003260:	00070793          	mv	a5,a4
    80003264:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80003268:	0007879b          	sext.w	a5,a5
    8000326c:	fe079ae3          	bnez	a5,80003260 <free_proc.part.0+0x20>
    80003270:	0304b503          	ld	a0,48(s1)
    80003274:	00050663          	beqz	a0,80003280 <free_proc.part.0+0x40>
    80003278:	bb1ff0ef          	jal	80002e28 <free_trapframe>
    8000327c:	0204b823          	sd	zero,48(s1)
    80003280:	0284b503          	ld	a0,40(s1)
    80003284:	00050663          	beqz	a0,80003290 <free_proc.part.0+0x50>
    80003288:	82cfe0ef          	jal	800012b4 <free_page>
    8000328c:	0204b423          	sd	zero,40(s1)
    80003290:	0184b503          	ld	a0,24(s1)
    80003294:	00050663          	beqz	a0,800032a0 <free_proc.part.0+0x60>
    80003298:	cc4fe0ef          	jal	8000175c <destroy_pagetable>
    8000329c:	0004bc23          	sd	zero,24(s1)
    800032a0:	0004b023          	sd	zero,0(s1)
    800032a4:	0f50000f          	fence	iorw,ow
    800032a8:	0804202f          	amoswap.w	zero,zero,(s0)
    800032ac:	01813083          	ld	ra,24(sp)
    800032b0:	01013403          	ld	s0,16(sp)
    800032b4:	00813483          	ld	s1,8(sp)
    800032b8:	02010113          	add	sp,sp,32
    800032bc:	00008067          	ret

00000000800032c0 <proc_init>:
    800032c0:	ff010113          	add	sp,sp,-16
    800032c4:	00002517          	auipc	a0,0x2
    800032c8:	69450513          	add	a0,a0,1684 # 80005958 <digits+0x5b0>
    800032cc:	00113423          	sd	ra,8(sp)
    800032d0:	f1dfd0ef          	jal	800011ec <uart_puts>
    800032d4:	00422797          	auipc	a5,0x422
    800032d8:	26478793          	add	a5,a5,612 # 80425538 <proc>
    800032dc:	00423697          	auipc	a3,0x423
    800032e0:	edc68693          	add	a3,a3,-292 # 804261b8 <mem_end>
    800032e4:	00078713          	mv	a4,a5
    800032e8:	00073023          	sd	zero,0(a4)
    800032ec:	00870713          	add	a4,a4,8
    800032f0:	fed71ce3          	bne	a4,a3,800032e8 <proc_init+0x28>
    800032f4:	00100713          	li	a4,1
    800032f8:	00003617          	auipc	a2,0x3
    800032fc:	d0e62423          	sw	a4,-760(a2) # 80006000 <nextpid>
    80003300:	00423717          	auipc	a4,0x423
    80003304:	ee073823          	sd	zero,-272(a4) # 804261f0 <current_proc>
    80003308:	0007a023          	sw	zero,0(a5)
    8000330c:	0007a223          	sw	zero,4(a5)
    80003310:	0007a423          	sw	zero,8(a5)
    80003314:	0c878793          	add	a5,a5,200
    80003318:	fed798e3          	bne	a5,a3,80003308 <proc_init+0x48>
    8000331c:	00813083          	ld	ra,8(sp)
    80003320:	00002517          	auipc	a0,0x2
    80003324:	66050513          	add	a0,a0,1632 # 80005980 <digits+0x5d8>
    80003328:	01010113          	add	sp,sp,16
    8000332c:	ec1fd06f          	j	800011ec <uart_puts>

0000000080003330 <alloc_proc>:
    80003330:	fd010113          	add	sp,sp,-48
    80003334:	00913c23          	sd	s1,24(sp)
    80003338:	02113423          	sd	ra,40(sp)
    8000333c:	02813023          	sd	s0,32(sp)
    80003340:	01213823          	sd	s2,16(sp)
    80003344:	01313423          	sd	s3,8(sp)
    80003348:	01413023          	sd	s4,0(sp)
    8000334c:	00423497          	auipc	s1,0x423
    80003350:	e9c48493          	add	s1,s1,-356 # 804261e8 <proc_lock>
    80003354:	00100713          	li	a4,1
    80003358:	00070793          	mv	a5,a4
    8000335c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003360:	0007879b          	sext.w	a5,a5
    80003364:	fe079ae3          	bnez	a5,80003358 <alloc_proc+0x28>
    80003368:	00422997          	auipc	s3,0x422
    8000336c:	1d098993          	add	s3,s3,464 # 80425538 <proc>
    80003370:	00098793          	mv	a5,s3
    80003374:	00000413          	li	s0,0
    80003378:	01000693          	li	a3,16
    8000337c:	0007a703          	lw	a4,0(a5)
    80003380:	0c878793          	add	a5,a5,200
    80003384:	02070463          	beqz	a4,800033ac <alloc_proc+0x7c>
    80003388:	0014041b          	addw	s0,s0,1
    8000338c:	fed418e3          	bne	s0,a3,8000337c <alloc_proc+0x4c>
    80003390:	0f50000f          	fence	iorw,ow
    80003394:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003398:	00002517          	auipc	a0,0x2
    8000339c:	63850513          	add	a0,a0,1592 # 800059d0 <digits+0x628>
    800033a0:	e4dfd0ef          	jal	800011ec <uart_puts>
    800033a4:	00000a13          	li	s4,0
    800033a8:	09c0006f          	j	80003444 <alloc_proc+0x114>
    800033ac:	0c800913          	li	s2,200
    800033b0:	03240933          	mul	s2,s0,s2
    800033b4:	00003717          	auipc	a4,0x3
    800033b8:	c4c70713          	add	a4,a4,-948 # 80006000 <nextpid>
    800033bc:	00072783          	lw	a5,0(a4)
    800033c0:	0017869b          	addw	a3,a5,1
    800033c4:	00d72023          	sw	a3,0(a4)
    800033c8:	00100713          	li	a4,1
    800033cc:	01298a33          	add	s4,s3,s2
    800033d0:	000a3423          	sd	zero,8(s4) # fffffffffffff008 <bss_end+0xffffffff7fbd8e10>
    800033d4:	00ea2023          	sw	a4,0(s4)
    800033d8:	00fa2223          	sw	a5,4(s4)
    800033dc:	000a2823          	sw	zero,16(s4)
    800033e0:	9e9ff0ef          	jal	80002dc8 <alloc_trapframe>
    800033e4:	02aa3823          	sd	a0,48(s4)
    800033e8:	08050463          	beqz	a0,80003470 <alloc_proc+0x140>
    800033ec:	eadfd0ef          	jal	80001298 <alloc_page>
    800033f0:	04090793          	add	a5,s2,64
    800033f4:	00f987b3          	add	a5,s3,a5
    800033f8:	02aa3423          	sd	a0,40(s4)
    800033fc:	07078713          	add	a4,a5,112
    80003400:	06050463          	beqz	a0,80003468 <alloc_proc+0x138>
    80003404:	0007b023          	sd	zero,0(a5)
    80003408:	00878793          	add	a5,a5,8
    8000340c:	fee79ce3          	bne	a5,a4,80003404 <alloc_proc+0xd4>
    80003410:	0c800793          	li	a5,200
    80003414:	02f40433          	mul	s0,s0,a5
    80003418:	00001737          	lui	a4,0x1
    8000341c:	00002517          	auipc	a0,0x2
    80003420:	58c50513          	add	a0,a0,1420 # 800059a8 <digits+0x600>
    80003424:	008989b3          	add	s3,s3,s0
    80003428:	0289b783          	ld	a5,40(s3)
    8000342c:	0049a583          	lw	a1,4(s3)
    80003430:	00e787b3          	add	a5,a5,a4
    80003434:	04f9b423          	sd	a5,72(s3)
    80003438:	a45fd0ef          	jal	80000e7c <printf>
    8000343c:	0f50000f          	fence	iorw,ow
    80003440:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003444:	02813083          	ld	ra,40(sp)
    80003448:	02013403          	ld	s0,32(sp)
    8000344c:	01813483          	ld	s1,24(sp)
    80003450:	01013903          	ld	s2,16(sp)
    80003454:	00813983          	ld	s3,8(sp)
    80003458:	000a0513          	mv	a0,s4
    8000345c:	00013a03          	ld	s4,0(sp)
    80003460:	03010113          	add	sp,sp,48
    80003464:	00008067          	ret
    80003468:	030a3503          	ld	a0,48(s4)
    8000346c:	9bdff0ef          	jal	80002e28 <free_trapframe>
    80003470:	0f50000f          	fence	iorw,ow
    80003474:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003478:	00000a13          	li	s4,0
    8000347c:	fc9ff06f          	j	80003444 <alloc_proc+0x114>

0000000080003480 <free_proc>:
    80003480:	00050463          	beqz	a0,80003488 <free_proc+0x8>
    80003484:	dbdff06f          	j	80003240 <free_proc.part.0>
    80003488:	00008067          	ret

000000008000348c <find_proc>:
    8000348c:	00422597          	auipc	a1,0x422
    80003490:	0ac58593          	add	a1,a1,172 # 80425538 <proc>
    80003494:	00058793          	mv	a5,a1
    80003498:	00000713          	li	a4,0
    8000349c:	01000613          	li	a2,16
    800034a0:	0100006f          	j	800034b0 <find_proc+0x24>
    800034a4:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    800034a8:	0c878793          	add	a5,a5,200
    800034ac:	02c70263          	beq	a4,a2,800034d0 <find_proc+0x44>
    800034b0:	0047a683          	lw	a3,4(a5)
    800034b4:	fea698e3          	bne	a3,a0,800034a4 <find_proc+0x18>
    800034b8:	0007a683          	lw	a3,0(a5)
    800034bc:	fe0684e3          	beqz	a3,800034a4 <find_proc+0x18>
    800034c0:	0c800793          	li	a5,200
    800034c4:	02f70733          	mul	a4,a4,a5
    800034c8:	00e58533          	add	a0,a1,a4
    800034cc:	00008067          	ret
    800034d0:	00000513          	li	a0,0
    800034d4:	00008067          	ret

00000000800034d8 <proc_set_kernel_stack>:
    800034d8:	00050a63          	beqz	a0,800034ec <proc_set_kernel_stack+0x14>
    800034dc:	000017b7          	lui	a5,0x1
    800034e0:	00f587b3          	add	a5,a1,a5
    800034e4:	02b53423          	sd	a1,40(a0)
    800034e8:	04f53423          	sd	a5,72(a0)
    800034ec:	00008067          	ret

00000000800034f0 <proc_mark_runnable>:
    800034f0:	02050263          	beqz	a0,80003514 <proc_mark_runnable+0x24>
    800034f4:	00052783          	lw	a5,0(a0)
    800034f8:	00100713          	li	a4,1
    800034fc:	ffe7869b          	addw	a3,a5,-2 # ffe <_entry-0x7ffff002>
    80003500:	00d77a63          	bgeu	a4,a3,80003514 <proc_mark_runnable+0x24>
    80003504:	00500713          	li	a4,5
    80003508:	00e78663          	beq	a5,a4,80003514 <proc_mark_runnable+0x24>
    8000350c:	00200793          	li	a5,2
    80003510:	00f52023          	sw	a5,0(a0)
    80003514:	00008067          	ret

0000000080003518 <proc_mark_sleeping>:
    80003518:	00050863          	beqz	a0,80003528 <proc_mark_sleeping+0x10>
    8000351c:	00052703          	lw	a4,0(a0)
    80003520:	00300793          	li	a5,3
    80003524:	00f70463          	beq	a4,a5,8000352c <proc_mark_sleeping+0x14>
    80003528:	00008067          	ret
    8000352c:	00400793          	li	a5,4
    80003530:	00f52023          	sw	a5,0(a0)
    80003534:	0ab53c23          	sd	a1,184(a0)
    80003538:	00008067          	ret

000000008000353c <proc_mark_zombie>:
    8000353c:	00050c63          	beqz	a0,80003554 <proc_mark_zombie+0x18>
    80003540:	00052703          	lw	a4,0(a0)
    80003544:	00500793          	li	a5,5
    80003548:	00f70663          	beq	a4,a5,80003554 <proc_mark_zombie+0x18>
    8000354c:	00f52023          	sw	a5,0(a0)
    80003550:	00b52623          	sw	a1,12(a0)
    80003554:	00008067          	ret

0000000080003558 <get_pid>:
    80003558:	00423797          	auipc	a5,0x423
    8000355c:	c987b783          	ld	a5,-872(a5) # 804261f0 <current_proc>
    80003560:	00078663          	beqz	a5,8000356c <get_pid+0x14>
    80003564:	0047a503          	lw	a0,4(a5)
    80003568:	00008067          	ret
    8000356c:	fff00513          	li	a0,-1
    80003570:	00008067          	ret

0000000080003574 <get_current_proc>:
    80003574:	00423517          	auipc	a0,0x423
    80003578:	c7c53503          	ld	a0,-900(a0) # 804261f0 <current_proc>
    8000357c:	00008067          	ret

0000000080003580 <set_current_proc>:
    80003580:	00423797          	auipc	a5,0x423
    80003584:	c6a7b823          	sd	a0,-912(a5) # 804261f0 <current_proc>
    80003588:	00008067          	ret

000000008000358c <scheduler>:
    8000358c:	fc010113          	add	sp,sp,-64
    80003590:	00002517          	auipc	a0,0x2
    80003594:	46050513          	add	a0,a0,1120 # 800059f0 <digits+0x648>
    80003598:	02913423          	sd	s1,40(sp)
    8000359c:	03213023          	sd	s2,32(sp)
    800035a0:	01313c23          	sd	s3,24(sp)
    800035a4:	01413823          	sd	s4,16(sp)
    800035a8:	01513423          	sd	s5,8(sp)
    800035ac:	01613023          	sd	s6,0(sp)
    800035b0:	02113c23          	sd	ra,56(sp)
    800035b4:	02813823          	sd	s0,48(sp)
    800035b8:	00423917          	auipc	s2,0x423
    800035bc:	c0090913          	add	s2,s2,-1024 # 804261b8 <mem_end>
    800035c0:	c2dfd0ef          	jal	800011ec <uart_puts>
    800035c4:	00200493          	li	s1,2
    800035c8:	00422797          	auipc	a5,0x422
    800035cc:	f607b023          	sd	zero,-160(a5) # 80425528 <cpus>
    800035d0:	00300b13          	li	s6,3
    800035d4:	00422a97          	auipc	s5,0x422
    800035d8:	f54a8a93          	add	s5,s5,-172 # 80425528 <cpus>
    800035dc:	00423a17          	auipc	s4,0x423
    800035e0:	c14a0a13          	add	s4,s4,-1004 # 804261f0 <current_proc>
    800035e4:	00002997          	auipc	s3,0x2
    800035e8:	42c98993          	add	s3,s3,1068 # 80005a10 <digits+0x668>
    800035ec:	881ff0ef          	jal	80002e6c <intr_on>
    800035f0:	00422417          	auipc	s0,0x422
    800035f4:	f4840413          	add	s0,s0,-184 # 80425538 <proc>
    800035f8:	00042783          	lw	a5,0(s0)
    800035fc:	02978e63          	beq	a5,s1,80003638 <scheduler+0xac>
    80003600:	0c840413          	add	s0,s0,200
    80003604:	ff241ae3          	bne	s0,s2,800035f8 <scheduler+0x6c>
    80003608:	03013403          	ld	s0,48(sp)
    8000360c:	03813083          	ld	ra,56(sp)
    80003610:	02813483          	ld	s1,40(sp)
    80003614:	02013903          	ld	s2,32(sp)
    80003618:	01813983          	ld	s3,24(sp)
    8000361c:	01013a03          	ld	s4,16(sp)
    80003620:	00813a83          	ld	s5,8(sp)
    80003624:	00013b03          	ld	s6,0(sp)
    80003628:	00002517          	auipc	a0,0x2
    8000362c:	40850513          	add	a0,a0,1032 # 80005a30 <digits+0x688>
    80003630:	04010113          	add	sp,sp,64
    80003634:	bb9fd06f          	j	800011ec <uart_puts>
    80003638:	00442583          	lw	a1,4(s0)
    8000363c:	00098513          	mv	a0,s3
    80003640:	01642023          	sw	s6,0(s0)
    80003644:	008ab023          	sd	s0,0(s5)
    80003648:	008a3023          	sd	s0,0(s4)
    8000364c:	831fd0ef          	jal	80000e7c <printf>
    80003650:	00942023          	sw	s1,0(s0)
    80003654:	f99ff06f          	j	800035ec <scheduler+0x60>

0000000080003658 <yield>:
    80003658:	00423617          	auipc	a2,0x423
    8000365c:	b9863603          	ld	a2,-1128(a2) # 804261f0 <current_proc>
    80003660:	02060a63          	beqz	a2,80003694 <yield+0x3c>
    80003664:	00423717          	auipc	a4,0x423
    80003668:	b8470713          	add	a4,a4,-1148 # 804261e8 <proc_lock>
    8000366c:	00100693          	li	a3,1
    80003670:	00068793          	mv	a5,a3
    80003674:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80003678:	0007879b          	sext.w	a5,a5
    8000367c:	fe079ae3          	bnez	a5,80003670 <yield+0x18>
    80003680:	00062683          	lw	a3,0(a2)
    80003684:	00300793          	li	a5,3
    80003688:	00f68863          	beq	a3,a5,80003698 <yield+0x40>
    8000368c:	0f50000f          	fence	iorw,ow
    80003690:	0807202f          	amoswap.w	zero,zero,(a4)
    80003694:	ef9ff06f          	j	8000358c <scheduler>
    80003698:	00200793          	li	a5,2
    8000369c:	00f62023          	sw	a5,0(a2)
    800036a0:	fedff06f          	j	8000368c <yield+0x34>

00000000800036a4 <fork>:
    800036a4:	fe010113          	add	sp,sp,-32
    800036a8:	00913423          	sd	s1,8(sp)
    800036ac:	00113c23          	sd	ra,24(sp)
    800036b0:	00813823          	sd	s0,16(sp)
    800036b4:	00423497          	auipc	s1,0x423
    800036b8:	b3c4b483          	ld	s1,-1220(s1) # 804261f0 <current_proc>
    800036bc:	08048a63          	beqz	s1,80003750 <fork+0xac>
    800036c0:	c71ff0ef          	jal	80003330 <alloc_proc>
    800036c4:	00050413          	mv	s0,a0
    800036c8:	08050e63          	beqz	a0,80003764 <fork+0xc0>
    800036cc:	0044a703          	lw	a4,4(s1)
    800036d0:	0184b783          	ld	a5,24(s1)
    800036d4:	0a953823          	sd	s1,176(a0)
    800036d8:	00e52423          	sw	a4,8(a0)
    800036dc:	00078863          	beqz	a5,800036ec <fork+0x48>
    800036e0:	d85fd0ef          	jal	80001464 <create_pagetable>
    800036e4:	00a43c23          	sd	a0,24(s0)
    800036e8:	08050863          	beqz	a0,80003778 <fork+0xd4>
    800036ec:	0304b783          	ld	a5,48(s1)
    800036f0:	02078663          	beqz	a5,8000371c <fork+0x78>
    800036f4:	03043703          	ld	a4,48(s0)
    800036f8:	02070263          	beqz	a4,8000371c <fork+0x78>
    800036fc:	11078613          	add	a2,a5,272
    80003700:	0007c683          	lbu	a3,0(a5)
    80003704:	00178793          	add	a5,a5,1
    80003708:	00170713          	add	a4,a4,1
    8000370c:	fed70fa3          	sb	a3,-1(a4)
    80003710:	fec798e3          	bne	a5,a2,80003700 <fork+0x5c>
    80003714:	03043783          	ld	a5,48(s0)
    80003718:	0407b823          	sd	zero,80(a5)
    8000371c:	0044a603          	lw	a2,4(s1)
    80003720:	00442583          	lw	a1,4(s0)
    80003724:	00200793          	li	a5,2
    80003728:	00f42023          	sw	a5,0(s0)
    8000372c:	00002517          	auipc	a0,0x2
    80003730:	38450513          	add	a0,a0,900 # 80005ab0 <digits+0x708>
    80003734:	f48fd0ef          	jal	80000e7c <printf>
    80003738:	00442503          	lw	a0,4(s0)
    8000373c:	01813083          	ld	ra,24(sp)
    80003740:	01013403          	ld	s0,16(sp)
    80003744:	00813483          	ld	s1,8(sp)
    80003748:	02010113          	add	sp,sp,32
    8000374c:	00008067          	ret
    80003750:	00002517          	auipc	a0,0x2
    80003754:	30850513          	add	a0,a0,776 # 80005a58 <digits+0x6b0>
    80003758:	a95fd0ef          	jal	800011ec <uart_puts>
    8000375c:	fff00513          	li	a0,-1
    80003760:	fddff06f          	j	8000373c <fork+0x98>
    80003764:	00002517          	auipc	a0,0x2
    80003768:	31c50513          	add	a0,a0,796 # 80005a80 <digits+0x6d8>
    8000376c:	a81fd0ef          	jal	800011ec <uart_puts>
    80003770:	fff00513          	li	a0,-1
    80003774:	fc9ff06f          	j	8000373c <fork+0x98>
    80003778:	00040513          	mv	a0,s0
    8000377c:	ac5ff0ef          	jal	80003240 <free_proc.part.0>
    80003780:	fff00513          	li	a0,-1
    80003784:	fb9ff06f          	j	8000373c <fork+0x98>

0000000080003788 <exit>:
    80003788:	00423697          	auipc	a3,0x423
    8000378c:	a686b683          	ld	a3,-1432(a3) # 804261f0 <current_proc>
    80003790:	08068e63          	beqz	a3,8000382c <exit+0xa4>
    80003794:	ff010113          	add	sp,sp,-16
    80003798:	00813023          	sd	s0,0(sp)
    8000379c:	00113423          	sd	ra,8(sp)
    800037a0:	00050613          	mv	a2,a0
    800037a4:	00423417          	auipc	s0,0x423
    800037a8:	a4440413          	add	s0,s0,-1468 # 804261e8 <proc_lock>
    800037ac:	00100713          	li	a4,1
    800037b0:	00070793          	mv	a5,a4
    800037b4:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800037b8:	0007879b          	sext.w	a5,a5
    800037bc:	fe079ae3          	bnez	a5,800037b0 <exit+0x28>
    800037c0:	00500793          	li	a5,5
    800037c4:	00f6a023          	sw	a5,0(a3)
    800037c8:	00c6a623          	sw	a2,12(a3)
    800037cc:	00422797          	auipc	a5,0x422
    800037d0:	e1c78793          	add	a5,a5,-484 # 804255e8 <proc+0xb0>
    800037d4:	00423597          	auipc	a1,0x423
    800037d8:	a9458593          	add	a1,a1,-1388 # 80426268 <bss_end+0x70>
    800037dc:	00100513          	li	a0,1
    800037e0:	00c0006f          	j	800037ec <exit+0x64>
    800037e4:	0c878793          	add	a5,a5,200
    800037e8:	00b78e63          	beq	a5,a1,80003804 <exit+0x7c>
    800037ec:	0007b703          	ld	a4,0(a5)
    800037f0:	fed71ae3          	bne	a4,a3,800037e4 <exit+0x5c>
    800037f4:	0007b023          	sd	zero,0(a5)
    800037f8:	f4a7ac23          	sw	a0,-168(a5)
    800037fc:	0c878793          	add	a5,a5,200
    80003800:	feb796e3          	bne	a5,a1,800037ec <exit+0x64>
    80003804:	0046a583          	lw	a1,4(a3)
    80003808:	00002517          	auipc	a0,0x2
    8000380c:	2d850513          	add	a0,a0,728 # 80005ae0 <digits+0x738>
    80003810:	e6cfd0ef          	jal	80000e7c <printf>
    80003814:	0f50000f          	fence	iorw,ow
    80003818:	0804202f          	amoswap.w	zero,zero,(s0)
    8000381c:	00013403          	ld	s0,0(sp)
    80003820:	00813083          	ld	ra,8(sp)
    80003824:	01010113          	add	sp,sp,16
    80003828:	e31ff06f          	j	80003658 <yield>
    8000382c:	00008067          	ret

0000000080003830 <wait>:
    80003830:	fb010113          	add	sp,sp,-80
    80003834:	01813023          	sd	s8,0(sp)
    80003838:	00423c17          	auipc	s8,0x423
    8000383c:	9b8c0c13          	add	s8,s8,-1608 # 804261f0 <current_proc>
    80003840:	02913c23          	sd	s1,56(sp)
    80003844:	000c3483          	ld	s1,0(s8)
    80003848:	04113423          	sd	ra,72(sp)
    8000384c:	04813023          	sd	s0,64(sp)
    80003850:	03213823          	sd	s2,48(sp)
    80003854:	03313423          	sd	s3,40(sp)
    80003858:	03413023          	sd	s4,32(sp)
    8000385c:	01513c23          	sd	s5,24(sp)
    80003860:	01613823          	sd	s6,16(sp)
    80003864:	01713423          	sd	s7,8(sp)
    80003868:	10048063          	beqz	s1,80003968 <wait+0x138>
    8000386c:	00050913          	mv	s2,a0
    80003870:	00423417          	auipc	s0,0x423
    80003874:	97840413          	add	s0,s0,-1672 # 804261e8 <proc_lock>
    80003878:	00100a13          	li	s4,1
    8000387c:	00500b93          	li	s7,5
    80003880:	01000a93          	li	s5,16
    80003884:	00423b17          	auipc	s6,0x423
    80003888:	934b0b13          	add	s6,s6,-1740 # 804261b8 <mem_end>
    8000388c:	00400993          	li	s3,4
    80003890:	000a0793          	mv	a5,s4
    80003894:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80003898:	0007879b          	sext.w	a5,a5
    8000389c:	fe079ae3          	bnez	a5,80003890 <wait+0x60>
    800038a0:	00422797          	auipc	a5,0x422
    800038a4:	c9878793          	add	a5,a5,-872 # 80425538 <proc>
    800038a8:	00078593          	mv	a1,a5
    800038ac:	00078713          	mv	a4,a5
    800038b0:	00000693          	li	a3,0
    800038b4:	0100006f          	j	800038c4 <wait+0x94>
    800038b8:	0016869b          	addw	a3,a3,1
    800038bc:	0c870713          	add	a4,a4,200
    800038c0:	09568863          	beq	a3,s5,80003950 <wait+0x120>
    800038c4:	0b073603          	ld	a2,176(a4)
    800038c8:	fe9618e3          	bne	a2,s1,800038b8 <wait+0x88>
    800038cc:	00072603          	lw	a2,0(a4)
    800038d0:	ff7614e3          	bne	a2,s7,800038b8 <wait+0x88>
    800038d4:	0c800793          	li	a5,200
    800038d8:	02f686b3          	mul	a3,a3,a5
    800038dc:	00d58533          	add	a0,a1,a3
    800038e0:	00452483          	lw	s1,4(a0)
    800038e4:	00090663          	beqz	s2,800038f0 <wait+0xc0>
    800038e8:	00c52783          	lw	a5,12(a0)
    800038ec:	00f92023          	sw	a5,0(s2)
    800038f0:	951ff0ef          	jal	80003240 <free_proc.part.0>
    800038f4:	00048593          	mv	a1,s1
    800038f8:	00002517          	auipc	a0,0x2
    800038fc:	21850513          	add	a0,a0,536 # 80005b10 <digits+0x768>
    80003900:	d7cfd0ef          	jal	80000e7c <printf>
    80003904:	0f50000f          	fence	iorw,ow
    80003908:	0804202f          	amoswap.w	zero,zero,(s0)
    8000390c:	04813083          	ld	ra,72(sp)
    80003910:	04013403          	ld	s0,64(sp)
    80003914:	03013903          	ld	s2,48(sp)
    80003918:	02813983          	ld	s3,40(sp)
    8000391c:	02013a03          	ld	s4,32(sp)
    80003920:	01813a83          	ld	s5,24(sp)
    80003924:	01013b03          	ld	s6,16(sp)
    80003928:	00813b83          	ld	s7,8(sp)
    8000392c:	00013c03          	ld	s8,0(sp)
    80003930:	00048513          	mv	a0,s1
    80003934:	03813483          	ld	s1,56(sp)
    80003938:	05010113          	add	sp,sp,80
    8000393c:	00008067          	ret
    80003940:	0007a703          	lw	a4,0(a5)
    80003944:	02071663          	bnez	a4,80003970 <wait+0x140>
    80003948:	0c878793          	add	a5,a5,200
    8000394c:	01678a63          	beq	a5,s6,80003960 <wait+0x130>
    80003950:	0b07b703          	ld	a4,176(a5)
    80003954:	fe9706e3          	beq	a4,s1,80003940 <wait+0x110>
    80003958:	0c878793          	add	a5,a5,200
    8000395c:	ff679ae3          	bne	a5,s6,80003950 <wait+0x120>
    80003960:	0f50000f          	fence	iorw,ow
    80003964:	0804202f          	amoswap.w	zero,zero,(s0)
    80003968:	fff00493          	li	s1,-1
    8000396c:	fa1ff06f          	j	8000390c <wait+0xdc>
    80003970:	0f50000f          	fence	iorw,ow
    80003974:	0804202f          	amoswap.w	zero,zero,(s0)
    80003978:	000c3703          	ld	a4,0(s8)
    8000397c:	f0070ae3          	beqz	a4,80003890 <wait+0x60>
    80003980:	000a0793          	mv	a5,s4
    80003984:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80003988:	0007879b          	sext.w	a5,a5
    8000398c:	fe079ae3          	bnez	a5,80003980 <wait+0x150>
    80003990:	01372023          	sw	s3,0(a4)
    80003994:	0a973c23          	sd	s1,184(a4)
    80003998:	0f50000f          	fence	iorw,ow
    8000399c:	0804202f          	amoswap.w	zero,zero,(s0)
    800039a0:	cb9ff0ef          	jal	80003658 <yield>
    800039a4:	eedff06f          	j	80003890 <wait+0x60>

00000000800039a8 <kill>:
    800039a8:	00422597          	auipc	a1,0x422
    800039ac:	b9058593          	add	a1,a1,-1136 # 80425538 <proc>
    800039b0:	00058793          	mv	a5,a1
    800039b4:	00000713          	li	a4,0
    800039b8:	01000613          	li	a2,16
    800039bc:	0100006f          	j	800039cc <kill+0x24>
    800039c0:	0017071b          	addw	a4,a4,1
    800039c4:	0c878793          	add	a5,a5,200
    800039c8:	06c70263          	beq	a4,a2,80003a2c <kill+0x84>
    800039cc:	0047a683          	lw	a3,4(a5)
    800039d0:	fea698e3          	bne	a3,a0,800039c0 <kill+0x18>
    800039d4:	0007a683          	lw	a3,0(a5)
    800039d8:	fe0684e3          	beqz	a3,800039c0 <kill+0x18>
    800039dc:	00423697          	auipc	a3,0x423
    800039e0:	80c68693          	add	a3,a3,-2036 # 804261e8 <proc_lock>
    800039e4:	00100613          	li	a2,1
    800039e8:	00060793          	mv	a5,a2
    800039ec:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    800039f0:	0007879b          	sext.w	a5,a5
    800039f4:	fe079ae3          	bnez	a5,800039e8 <kill+0x40>
    800039f8:	0c800793          	li	a5,200
    800039fc:	02f70733          	mul	a4,a4,a5
    80003a00:	00100613          	li	a2,1
    80003a04:	00400793          	li	a5,4
    80003a08:	00e585b3          	add	a1,a1,a4
    80003a0c:	0005a703          	lw	a4,0(a1)
    80003a10:	00c5a823          	sw	a2,16(a1)
    80003a14:	00f71663          	bne	a4,a5,80003a20 <kill+0x78>
    80003a18:	00200793          	li	a5,2
    80003a1c:	00f5a023          	sw	a5,0(a1)
    80003a20:	0f50000f          	fence	iorw,ow
    80003a24:	0806a02f          	amoswap.w	zero,zero,(a3)
    80003a28:	00008067          	ret
    80003a2c:	00008067          	ret

0000000080003a30 <sleep>:
    80003a30:	00422617          	auipc	a2,0x422
    80003a34:	7c063603          	ld	a2,1984(a2) # 804261f0 <current_proc>
    80003a38:	02060c63          	beqz	a2,80003a70 <sleep+0x40>
    80003a3c:	00422717          	auipc	a4,0x422
    80003a40:	7ac70713          	add	a4,a4,1964 # 804261e8 <proc_lock>
    80003a44:	00100693          	li	a3,1
    80003a48:	00068793          	mv	a5,a3
    80003a4c:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80003a50:	0007879b          	sext.w	a5,a5
    80003a54:	fe079ae3          	bnez	a5,80003a48 <sleep+0x18>
    80003a58:	00400793          	li	a5,4
    80003a5c:	00f62023          	sw	a5,0(a2)
    80003a60:	0aa63c23          	sd	a0,184(a2)
    80003a64:	0f50000f          	fence	iorw,ow
    80003a68:	0807202f          	amoswap.w	zero,zero,(a4)
    80003a6c:	bedff06f          	j	80003658 <yield>
    80003a70:	00008067          	ret

0000000080003a74 <wakeup>:
    80003a74:	00422697          	auipc	a3,0x422
    80003a78:	77468693          	add	a3,a3,1908 # 804261e8 <proc_lock>
    80003a7c:	00100713          	li	a4,1
    80003a80:	00070793          	mv	a5,a4
    80003a84:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80003a88:	0007879b          	sext.w	a5,a5
    80003a8c:	fe079ae3          	bnez	a5,80003a80 <wakeup+0xc>
    80003a90:	00422797          	auipc	a5,0x422
    80003a94:	aa878793          	add	a5,a5,-1368 # 80425538 <proc>
    80003a98:	00422597          	auipc	a1,0x422
    80003a9c:	72058593          	add	a1,a1,1824 # 804261b8 <mem_end>
    80003aa0:	00400613          	li	a2,4
    80003aa4:	00200813          	li	a6,2
    80003aa8:	00c0006f          	j	80003ab4 <wakeup+0x40>
    80003aac:	0c878793          	add	a5,a5,200
    80003ab0:	02f58063          	beq	a1,a5,80003ad0 <wakeup+0x5c>
    80003ab4:	0007a703          	lw	a4,0(a5)
    80003ab8:	fec71ae3          	bne	a4,a2,80003aac <wakeup+0x38>
    80003abc:	0b87b703          	ld	a4,184(a5)
    80003ac0:	fea716e3          	bne	a4,a0,80003aac <wakeup+0x38>
    80003ac4:	0107a023          	sw	a6,0(a5)
    80003ac8:	0c878793          	add	a5,a5,200
    80003acc:	fef594e3          	bne	a1,a5,80003ab4 <wakeup+0x40>
    80003ad0:	0f50000f          	fence	iorw,ow
    80003ad4:	0806a02f          	amoswap.w	zero,zero,(a3)
    80003ad8:	00008067          	ret

0000000080003adc <wakeup_one>:
    80003adc:	00422617          	auipc	a2,0x422
    80003ae0:	70c60613          	add	a2,a2,1804 # 804261e8 <proc_lock>
    80003ae4:	00100713          	li	a4,1
    80003ae8:	00070793          	mv	a5,a4
    80003aec:	0cf627af          	amoswap.w.aq	a5,a5,(a2)
    80003af0:	0007879b          	sext.w	a5,a5
    80003af4:	fe079ae3          	bnez	a5,80003ae8 <wakeup_one+0xc>
    80003af8:	00422897          	auipc	a7,0x422
    80003afc:	a4088893          	add	a7,a7,-1472 # 80425538 <proc>
    80003b00:	00088793          	mv	a5,a7
    80003b04:	00000713          	li	a4,0
    80003b08:	00400593          	li	a1,4
    80003b0c:	01000813          	li	a6,16
    80003b10:	0100006f          	j	80003b20 <wakeup_one+0x44>
    80003b14:	0017071b          	addw	a4,a4,1
    80003b18:	0c878793          	add	a5,a5,200
    80003b1c:	03070463          	beq	a4,a6,80003b44 <wakeup_one+0x68>
    80003b20:	0007a683          	lw	a3,0(a5)
    80003b24:	feb698e3          	bne	a3,a1,80003b14 <wakeup_one+0x38>
    80003b28:	0b87b683          	ld	a3,184(a5)
    80003b2c:	fea694e3          	bne	a3,a0,80003b14 <wakeup_one+0x38>
    80003b30:	0c800793          	li	a5,200
    80003b34:	02f70733          	mul	a4,a4,a5
    80003b38:	00200793          	li	a5,2
    80003b3c:	00e888b3          	add	a7,a7,a4
    80003b40:	00f8a023          	sw	a5,0(a7)
    80003b44:	0f50000f          	fence	iorw,ow
    80003b48:	0806202f          	amoswap.w	zero,zero,(a2)
    80003b4c:	00008067          	ret

0000000080003b50 <machinevec>:
    80003b50:	10000fb7          	lui	t6,0x10000
    80003b54:	02100f13          	li	t5,33
    80003b58:	01ef8023          	sb	t5,0(t6) # 10000000 <_entry-0x70000000>
    80003b5c:	342022f3          	csrr	t0,mcause
    80003b60:	0010031b          	addw	t1,zero,1
    80003b64:	01f31313          	sll	t1,t1,0x1f
    80003b68:	0062f3b3          	and	t2,t0,t1
    80003b6c:	02638263          	beq	t2,t1,80003b90 <machine_timer_interrupt>
    80003b70:	80000337          	lui	t1,0x80000
    80003b74:	fff3031b          	addw	t1,t1,-1 # 7fffffff <_entry-0x1>
    80003b78:	0062f3b3          	and	t2,t0,t1
    80003b7c:	00700313          	li	t1,7
    80003b80:	00638863          	beq	t2,t1,80003b90 <machine_timer_interrupt>
    80003b84:	03f00f13          	li	t5,63
    80003b88:	01ef8023          	sb	t5,0(t6)
    80003b8c:	30200073          	mret

0000000080003b90 <machine_timer_interrupt>:
    80003b90:	05400f13          	li	t5,84
    80003b94:	01ef8023          	sb	t5,0(t6)
    80003b98:	9c8ff0ef          	jal	80002d60 <machine_timer_handler>
    80003b9c:	30200073          	mret

0000000080003ba0 <kernelvec>:
    80003ba0:	ef010113          	add	sp,sp,-272
    80003ba4:	00013023          	sd	zero,0(sp)
    80003ba8:	00113423          	sd	ra,8(sp)
    80003bac:	00313c23          	sd	gp,24(sp)
    80003bb0:	02413023          	sd	tp,32(sp)
    80003bb4:	02513423          	sd	t0,40(sp)
    80003bb8:	02613823          	sd	t1,48(sp)
    80003bbc:	02713c23          	sd	t2,56(sp)
    80003bc0:	04813023          	sd	s0,64(sp)
    80003bc4:	04913423          	sd	s1,72(sp)
    80003bc8:	04a13823          	sd	a0,80(sp)
    80003bcc:	04b13c23          	sd	a1,88(sp)
    80003bd0:	06c13023          	sd	a2,96(sp)
    80003bd4:	06d13423          	sd	a3,104(sp)
    80003bd8:	06e13823          	sd	a4,112(sp)
    80003bdc:	06f13c23          	sd	a5,120(sp)
    80003be0:	09013023          	sd	a6,128(sp)
    80003be4:	09113423          	sd	a7,136(sp)
    80003be8:	09213823          	sd	s2,144(sp)
    80003bec:	09313c23          	sd	s3,152(sp)
    80003bf0:	0b413023          	sd	s4,160(sp)
    80003bf4:	0b513423          	sd	s5,168(sp)
    80003bf8:	0b613823          	sd	s6,176(sp)
    80003bfc:	0b713c23          	sd	s7,184(sp)
    80003c00:	0d813023          	sd	s8,192(sp)
    80003c04:	0d913423          	sd	s9,200(sp)
    80003c08:	0da13823          	sd	s10,208(sp)
    80003c0c:	0db13c23          	sd	s11,216(sp)
    80003c10:	0fc13023          	sd	t3,224(sp)
    80003c14:	0fd13423          	sd	t4,232(sp)
    80003c18:	0fe13823          	sd	t5,240(sp)
    80003c1c:	0ff13c23          	sd	t6,248(sp)
    80003c20:	11010293          	add	t0,sp,272
    80003c24:	00513823          	sd	t0,16(sp)
    80003c28:	141022f3          	csrr	t0,sepc
    80003c2c:	10513023          	sd	t0,256(sp)
    80003c30:	142022f3          	csrr	t0,scause
    80003c34:	10513423          	sd	t0,264(sp)
    80003c38:	d30ff0ef          	jal	80003168 <kerneltrap>
    80003c3c:	00813083          	ld	ra,8(sp)
    80003c40:	01813183          	ld	gp,24(sp)
    80003c44:	02013203          	ld	tp,32(sp)
    80003c48:	02813283          	ld	t0,40(sp)
    80003c4c:	03013303          	ld	t1,48(sp)
    80003c50:	03813383          	ld	t2,56(sp)
    80003c54:	04013403          	ld	s0,64(sp)
    80003c58:	04813483          	ld	s1,72(sp)
    80003c5c:	05013503          	ld	a0,80(sp)
    80003c60:	05813583          	ld	a1,88(sp)
    80003c64:	06013603          	ld	a2,96(sp)
    80003c68:	06813683          	ld	a3,104(sp)
    80003c6c:	07013703          	ld	a4,112(sp)
    80003c70:	07813783          	ld	a5,120(sp)
    80003c74:	08013803          	ld	a6,128(sp)
    80003c78:	08813883          	ld	a7,136(sp)
    80003c7c:	09013903          	ld	s2,144(sp)
    80003c80:	09813983          	ld	s3,152(sp)
    80003c84:	0a013a03          	ld	s4,160(sp)
    80003c88:	0a813a83          	ld	s5,168(sp)
    80003c8c:	0b013b03          	ld	s6,176(sp)
    80003c90:	0b813b83          	ld	s7,184(sp)
    80003c94:	0c013c03          	ld	s8,192(sp)
    80003c98:	0c813c83          	ld	s9,200(sp)
    80003c9c:	0d013d03          	ld	s10,208(sp)
    80003ca0:	0d813d83          	ld	s11,216(sp)
    80003ca4:	0e013e03          	ld	t3,224(sp)
    80003ca8:	0e813e83          	ld	t4,232(sp)
    80003cac:	0f013f03          	ld	t5,240(sp)
    80003cb0:	0f813f83          	ld	t6,248(sp)
    80003cb4:	10013283          	ld	t0,256(sp)
    80003cb8:	14129073          	csrw	sepc,t0
    80003cbc:	10813283          	ld	t0,264(sp)
    80003cc0:	14229073          	csrw	scause,t0
    80003cc4:	01013103          	ld	sp,16(sp)
    80003cc8:	10200073          	sret
    80003ccc:	0000                	.2byte	0x0
	...

0000000080003cd0 <uservec>:
    80003cd0:	00010293          	mv	t0,sp
    80003cd4:	ef010113          	add	sp,sp,-272
    80003cd8:	00513823          	sd	t0,16(sp)
    80003cdc:	00113423          	sd	ra,8(sp)
    80003ce0:	00313c23          	sd	gp,24(sp)
    80003ce4:	02413023          	sd	tp,32(sp)
    80003ce8:	02513423          	sd	t0,40(sp)
    80003cec:	02613823          	sd	t1,48(sp)
    80003cf0:	02713c23          	sd	t2,56(sp)
    80003cf4:	04813023          	sd	s0,64(sp)
    80003cf8:	04913423          	sd	s1,72(sp)
    80003cfc:	04a13823          	sd	a0,80(sp)
    80003d00:	04b13c23          	sd	a1,88(sp)
    80003d04:	06c13023          	sd	a2,96(sp)
    80003d08:	06d13423          	sd	a3,104(sp)
    80003d0c:	06e13823          	sd	a4,112(sp)
    80003d10:	06f13c23          	sd	a5,120(sp)
    80003d14:	09013023          	sd	a6,128(sp)
    80003d18:	09113423          	sd	a7,136(sp)
    80003d1c:	09213823          	sd	s2,144(sp)
    80003d20:	09313c23          	sd	s3,152(sp)
    80003d24:	0b413023          	sd	s4,160(sp)
    80003d28:	0b513423          	sd	s5,168(sp)
    80003d2c:	0b613823          	sd	s6,176(sp)
    80003d30:	0b713c23          	sd	s7,184(sp)
    80003d34:	0d813023          	sd	s8,192(sp)
    80003d38:	0d913423          	sd	s9,200(sp)
    80003d3c:	0da13823          	sd	s10,208(sp)
    80003d40:	0db13c23          	sd	s11,216(sp)
    80003d44:	0fc13023          	sd	t3,224(sp)
    80003d48:	0fd13423          	sd	t4,232(sp)
    80003d4c:	0fe13823          	sd	t5,240(sp)
    80003d50:	0ff13c23          	sd	t6,248(sp)
    80003d54:	10002373          	csrr	t1,sstatus
    80003d58:	10613023          	sd	t1,256(sp)
    80003d5c:	14102373          	csrr	t1,sepc
    80003d60:	10613423          	sd	t1,264(sp)
    80003d64:	c60ff0ef          	jal	800031c4 <usertrap>
    80003d68:	00813083          	ld	ra,8(sp)
    80003d6c:	01813183          	ld	gp,24(sp)
    80003d70:	02013203          	ld	tp,32(sp)
    80003d74:	02813283          	ld	t0,40(sp)
    80003d78:	03013303          	ld	t1,48(sp)
    80003d7c:	03813383          	ld	t2,56(sp)
    80003d80:	04013403          	ld	s0,64(sp)
    80003d84:	04813483          	ld	s1,72(sp)
    80003d88:	05013503          	ld	a0,80(sp)
    80003d8c:	05813583          	ld	a1,88(sp)
    80003d90:	06013603          	ld	a2,96(sp)
    80003d94:	06813683          	ld	a3,104(sp)
    80003d98:	07013703          	ld	a4,112(sp)
    80003d9c:	07813783          	ld	a5,120(sp)
    80003da0:	08013803          	ld	a6,128(sp)
    80003da4:	08813883          	ld	a7,136(sp)
    80003da8:	09013903          	ld	s2,144(sp)
    80003dac:	09813983          	ld	s3,152(sp)
    80003db0:	0a013a03          	ld	s4,160(sp)
    80003db4:	0a813a83          	ld	s5,168(sp)
    80003db8:	0b013b03          	ld	s6,176(sp)
    80003dbc:	0b813b83          	ld	s7,184(sp)
    80003dc0:	0c013c03          	ld	s8,192(sp)
    80003dc4:	0c813c83          	ld	s9,200(sp)
    80003dc8:	0d013d03          	ld	s10,208(sp)
    80003dcc:	0d813d83          	ld	s11,216(sp)
    80003dd0:	0e013e03          	ld	t3,224(sp)
    80003dd4:	0e813e83          	ld	t4,232(sp)
    80003dd8:	0f013f03          	ld	t5,240(sp)
    80003ddc:	0f813f83          	ld	t6,248(sp)
    80003de0:	10013303          	ld	t1,256(sp)
    80003de4:	10031073          	csrw	sstatus,t1
    80003de8:	10813303          	ld	t1,264(sp)
    80003dec:	14131073          	csrw	sepc,t1
    80003df0:	01013103          	ld	sp,16(sp)
    80003df4:	10200073          	sret
	...

0000000080003e00 <switch_context>:
    80003e00:	00153023          	sd	ra,0(a0)
    80003e04:	00253423          	sd	sp,8(a0)
    80003e08:	00853823          	sd	s0,16(a0)
    80003e0c:	00953c23          	sd	s1,24(a0)
    80003e10:	03253023          	sd	s2,32(a0)
    80003e14:	03353423          	sd	s3,40(a0)
    80003e18:	03453823          	sd	s4,48(a0)
    80003e1c:	03553c23          	sd	s5,56(a0)
    80003e20:	05653023          	sd	s6,64(a0)
    80003e24:	05753423          	sd	s7,72(a0)
    80003e28:	05853823          	sd	s8,80(a0)
    80003e2c:	05953c23          	sd	s9,88(a0)
    80003e30:	07a53023          	sd	s10,96(a0)
    80003e34:	07b53423          	sd	s11,104(a0)
    80003e38:	0005b083          	ld	ra,0(a1)
    80003e3c:	0085b103          	ld	sp,8(a1)
    80003e40:	0105b403          	ld	s0,16(a1)
    80003e44:	0185b483          	ld	s1,24(a1)
    80003e48:	0205b903          	ld	s2,32(a1)
    80003e4c:	0285b983          	ld	s3,40(a1)
    80003e50:	0305ba03          	ld	s4,48(a1)
    80003e54:	0385ba83          	ld	s5,56(a1)
    80003e58:	0405bb03          	ld	s6,64(a1)
    80003e5c:	0485bb83          	ld	s7,72(a1)
    80003e60:	0505bc03          	ld	s8,80(a1)
    80003e64:	0585bc83          	ld	s9,88(a1)
    80003e68:	0605bd03          	ld	s10,96(a1)
    80003e6c:	0685bd83          	ld	s11,104(a1)
    80003e70:	00008067          	ret
