
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
    8000001c:	00006297          	auipc	t0,0x6
    80000020:	a4428293          	add	t0,t0,-1468 # 80005a60 <machinevec>
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
    80000064:	21030313          	add	t1,t1,528 # 80426270 <bss_end>

0000000080000068 <bss_clear>:
    80000068:	00628863          	beq	t0,t1,80000078 <bss_done>
    8000006c:	0002b023          	sd	zero,0(t0)
    80000070:	00828293          	add	t0,t0,8
    80000074:	ff5ff06f          	j	80000068 <bss_clear>

0000000080000078 <bss_done>:
    80000078:	400010ef          	jal	80001478 <main>

000000008000007c <loop>:
    8000007c:	0000006f          	j	8000007c <loop>

0000000080000080 <rr_worker>:
    80000080:	fc010113          	add	sp,sp,-64
    80000084:	02813823          	sd	s0,48(sp)
    80000088:	02913423          	sd	s1,40(sp)
    8000008c:	03213023          	sd	s2,32(sp)
    80000090:	01313c23          	sd	s3,24(sp)
    80000094:	01413823          	sd	s4,16(sp)
    80000098:	02113c23          	sd	ra,56(sp)
    8000009c:	00018437          	lui	s0,0x18
    800000a0:	6d1040ef          	jal	80004f70 <get_pid>
    800000a4:	00050913          	mv	s2,a0
    800000a8:	00000493          	li	s1,0
    800000ac:	00006a17          	auipc	s4,0x6
    800000b0:	f54a0a13          	add	s4,s4,-172 # 80006000 <rodata_start>
    800000b4:	69f40413          	add	s0,s0,1695 # 1869f <_entry-0x7ffe7961>
    800000b8:	00500993          	li	s3,5
    800000bc:	00048613          	mv	a2,s1
    800000c0:	00090593          	mv	a1,s2
    800000c4:	000a0513          	mv	a0,s4
    800000c8:	1f1010ef          	jal	80001ab8 <printf>
    800000cc:	00012623          	sw	zero,12(sp)
    800000d0:	00c12783          	lw	a5,12(sp)
    800000d4:	00f44c63          	blt	s0,a5,800000ec <rr_worker+0x6c>
    800000d8:	00c12783          	lw	a5,12(sp)
    800000dc:	0017879b          	addw	a5,a5,1
    800000e0:	00f12623          	sw	a5,12(sp)
    800000e4:	00c12783          	lw	a5,12(sp)
    800000e8:	fef458e3          	bge	s0,a5,800000d8 <rr_worker+0x58>
    800000ec:	0014849b          	addw	s1,s1,1
    800000f0:	300050ef          	jal	800053f0 <yield>
    800000f4:	fd3494e3          	bne	s1,s3,800000bc <rr_worker+0x3c>
    800000f8:	00090593          	mv	a1,s2
    800000fc:	00006517          	auipc	a0,0x6
    80000100:	f2450513          	add	a0,a0,-220 # 80006020 <rodata_start+0x20>
    80000104:	1b5010ef          	jal	80001ab8 <printf>
    80000108:	03013403          	ld	s0,48(sp)
    8000010c:	03813083          	ld	ra,56(sp)
    80000110:	02813483          	ld	s1,40(sp)
    80000114:	02013903          	ld	s2,32(sp)
    80000118:	01813983          	ld	s3,24(sp)
    8000011c:	01013a03          	ld	s4,16(sp)
    80000120:	00000513          	li	a0,0
    80000124:	04010113          	add	sp,sp,64
    80000128:	5700506f          	j	80005698 <exit>

000000008000012c <test_process_allocation>:
    8000012c:	fe010113          	add	sp,sp,-32
    80000130:	00006517          	auipc	a0,0x6
    80000134:	f1050513          	add	a0,a0,-240 # 80006040 <rodata_start+0x40>
    80000138:	00113c23          	sd	ra,24(sp)
    8000013c:	00813823          	sd	s0,16(sp)
    80000140:	00913423          	sd	s1,8(sp)
    80000144:	01213023          	sd	s2,0(sp)
    80000148:	4e1010ef          	jal	80001e28 <uart_puts>
    8000014c:	325040ef          	jal	80004c70 <alloc_proc>
    80000150:	00050413          	mv	s0,a0
    80000154:	31d040ef          	jal	80004c70 <alloc_proc>
    80000158:	00050493          	mv	s1,a0
    8000015c:	315040ef          	jal	80004c70 <alloc_proc>
    80000160:	0a040663          	beqz	s0,8000020c <test_process_allocation+0xe0>
    80000164:	0a048463          	beqz	s1,8000020c <test_process_allocation+0xe0>
    80000168:	00050913          	mv	s2,a0
    8000016c:	0a050063          	beqz	a0,8000020c <test_process_allocation+0xe0>
    80000170:	00452683          	lw	a3,4(a0)
    80000174:	0044a603          	lw	a2,4(s1)
    80000178:	00442583          	lw	a1,4(s0)
    8000017c:	00006517          	auipc	a0,0x6
    80000180:	f0450513          	add	a0,a0,-252 # 80006080 <rodata_start+0x80>
    80000184:	135010ef          	jal	80001ab8 <printf>
    80000188:	00042783          	lw	a5,0(s0)
    8000018c:	00100713          	li	a4,1
    80000190:	00e79a63          	bne	a5,a4,800001a4 <test_process_allocation+0x78>
    80000194:	0004a703          	lw	a4,0(s1)
    80000198:	00f71663          	bne	a4,a5,800001a4 <test_process_allocation+0x78>
    8000019c:	00092783          	lw	a5,0(s2)
    800001a0:	0ae78463          	beq	a5,a4,80000248 <test_process_allocation+0x11c>
    800001a4:	00006517          	auipc	a0,0x6
    800001a8:	f3c50513          	add	a0,a0,-196 # 800060e0 <rodata_start+0xe0>
    800001ac:	47d010ef          	jal	80001e28 <uart_puts>
    800001b0:	00040513          	mv	a0,s0
    800001b4:	47d040ef          	jal	80004e30 <free_proc>
    800001b8:	00048513          	mv	a0,s1
    800001bc:	475040ef          	jal	80004e30 <free_proc>
    800001c0:	00090513          	mv	a0,s2
    800001c4:	46d040ef          	jal	80004e30 <free_proc>
    800001c8:	00042783          	lw	a5,0(s0)
    800001cc:	00079a63          	bnez	a5,800001e0 <test_process_allocation+0xb4>
    800001d0:	0004a783          	lw	a5,0(s1)
    800001d4:	00079663          	bnez	a5,800001e0 <test_process_allocation+0xb4>
    800001d8:	00092783          	lw	a5,0(s2)
    800001dc:	04078e63          	beqz	a5,80000238 <test_process_allocation+0x10c>
    800001e0:	00006517          	auipc	a0,0x6
    800001e4:	f3050513          	add	a0,a0,-208 # 80006110 <rodata_start+0x110>
    800001e8:	441010ef          	jal	80001e28 <uart_puts>
    800001ec:	01013403          	ld	s0,16(sp)
    800001f0:	01813083          	ld	ra,24(sp)
    800001f4:	00813483          	ld	s1,8(sp)
    800001f8:	00013903          	ld	s2,0(sp)
    800001fc:	00006517          	auipc	a0,0x6
    80000200:	f4450513          	add	a0,a0,-188 # 80006140 <rodata_start+0x140>
    80000204:	02010113          	add	sp,sp,32
    80000208:	4210106f          	j	80001e28 <uart_puts>
    8000020c:	00006517          	auipc	a0,0x6
    80000210:	f1c50513          	add	a0,a0,-228 # 80006128 <rodata_start+0x128>
    80000214:	415010ef          	jal	80001e28 <uart_puts>
    80000218:	01013403          	ld	s0,16(sp)
    8000021c:	01813083          	ld	ra,24(sp)
    80000220:	00813483          	ld	s1,8(sp)
    80000224:	00013903          	ld	s2,0(sp)
    80000228:	00006517          	auipc	a0,0x6
    8000022c:	f1850513          	add	a0,a0,-232 # 80006140 <rodata_start+0x140>
    80000230:	02010113          	add	sp,sp,32
    80000234:	3f50106f          	j	80001e28 <uart_puts>
    80000238:	00006517          	auipc	a0,0x6
    8000023c:	ec050513          	add	a0,a0,-320 # 800060f8 <rodata_start+0xf8>
    80000240:	3e9010ef          	jal	80001e28 <uart_puts>
    80000244:	fd5ff06f          	j	80000218 <test_process_allocation+0xec>
    80000248:	00006517          	auipc	a0,0x6
    8000024c:	e7050513          	add	a0,a0,-400 # 800060b8 <rodata_start+0xb8>
    80000250:	3d9010ef          	jal	80001e28 <uart_puts>
    80000254:	f5dff06f          	j	800001b0 <test_process_allocation+0x84>

0000000080000258 <test_process_find>:
    80000258:	fe010113          	add	sp,sp,-32
    8000025c:	00006517          	auipc	a0,0x6
    80000260:	efc50513          	add	a0,a0,-260 # 80006158 <rodata_start+0x158>
    80000264:	00113c23          	sd	ra,24(sp)
    80000268:	00813823          	sd	s0,16(sp)
    8000026c:	00913423          	sd	s1,8(sp)
    80000270:	3b9010ef          	jal	80001e28 <uart_puts>
    80000274:	1fd040ef          	jal	80004c70 <alloc_proc>
    80000278:	08050863          	beqz	a0,80000308 <test_process_find+0xb0>
    8000027c:	00452483          	lw	s1,4(a0)
    80000280:	00050413          	mv	s0,a0
    80000284:	00006517          	auipc	a0,0x6
    80000288:	f2450513          	add	a0,a0,-220 # 800061a8 <rodata_start+0x1a8>
    8000028c:	00048593          	mv	a1,s1
    80000290:	029010ef          	jal	80001ab8 <printf>
    80000294:	00048513          	mv	a0,s1
    80000298:	40d040ef          	jal	80004ea4 <find_proc>
    8000029c:	00050663          	beqz	a0,800002a8 <test_process_find+0x50>
    800002a0:	00452783          	lw	a5,4(a0)
    800002a4:	08978063          	beq	a5,s1,80000324 <test_process_find+0xcc>
    800002a8:	00006517          	auipc	a0,0x6
    800002ac:	f3850513          	add	a0,a0,-200 # 800061e0 <rodata_start+0x1e0>
    800002b0:	379010ef          	jal	80001e28 <uart_puts>
    800002b4:	00040513          	mv	a0,s0
    800002b8:	379040ef          	jal	80004e30 <free_proc>
    800002bc:	00048513          	mv	a0,s1
    800002c0:	3e5040ef          	jal	80004ea4 <find_proc>
    800002c4:	00050663          	beqz	a0,800002d0 <test_process_find+0x78>
    800002c8:	00052783          	lw	a5,0(a0)
    800002cc:	02079663          	bnez	a5,800002f8 <test_process_find+0xa0>
    800002d0:	00006517          	auipc	a0,0x6
    800002d4:	f2850513          	add	a0,a0,-216 # 800061f8 <rodata_start+0x1f8>
    800002d8:	351010ef          	jal	80001e28 <uart_puts>
    800002dc:	01013403          	ld	s0,16(sp)
    800002e0:	01813083          	ld	ra,24(sp)
    800002e4:	00813483          	ld	s1,8(sp)
    800002e8:	00006517          	auipc	a0,0x6
    800002ec:	e5850513          	add	a0,a0,-424 # 80006140 <rodata_start+0x140>
    800002f0:	02010113          	add	sp,sp,32
    800002f4:	3350106f          	j	80001e28 <uart_puts>
    800002f8:	00006517          	auipc	a0,0x6
    800002fc:	f3850513          	add	a0,a0,-200 # 80006230 <rodata_start+0x230>
    80000300:	329010ef          	jal	80001e28 <uart_puts>
    80000304:	fd9ff06f          	j	800002dc <test_process_find+0x84>
    80000308:	01013403          	ld	s0,16(sp)
    8000030c:	01813083          	ld	ra,24(sp)
    80000310:	00813483          	ld	s1,8(sp)
    80000314:	00006517          	auipc	a0,0x6
    80000318:	e7c50513          	add	a0,a0,-388 # 80006190 <rodata_start+0x190>
    8000031c:	02010113          	add	sp,sp,32
    80000320:	3090106f          	j	80001e28 <uart_puts>
    80000324:	00048593          	mv	a1,s1
    80000328:	00006517          	auipc	a0,0x6
    8000032c:	e9850513          	add	a0,a0,-360 # 800061c0 <rodata_start+0x1c0>
    80000330:	788010ef          	jal	80001ab8 <printf>
    80000334:	f81ff06f          	j	800002b4 <test_process_find+0x5c>

0000000080000338 <test_process_state_transition>:
    80000338:	fe010113          	add	sp,sp,-32
    8000033c:	00006517          	auipc	a0,0x6
    80000340:	f2450513          	add	a0,a0,-220 # 80006260 <rodata_start+0x260>
    80000344:	00113c23          	sd	ra,24(sp)
    80000348:	00813823          	sd	s0,16(sp)
    8000034c:	00913423          	sd	s1,8(sp)
    80000350:	2d9010ef          	jal	80001e28 <uart_puts>
    80000354:	11d040ef          	jal	80004c70 <alloc_proc>
    80000358:	0c050a63          	beqz	a0,8000042c <test_process_state_transition+0xf4>
    8000035c:	00052583          	lw	a1,0(a0)
    80000360:	00050413          	mv	s0,a0
    80000364:	00100613          	li	a2,1
    80000368:	00006517          	auipc	a0,0x6
    8000036c:	f3850513          	add	a0,a0,-200 # 800062a0 <rodata_start+0x2a0>
    80000370:	748010ef          	jal	80001ab8 <printf>
    80000374:	00040513          	mv	a0,s0
    80000378:	391040ef          	jal	80004f08 <proc_mark_runnable>
    8000037c:	00042703          	lw	a4,0(s0)
    80000380:	00200793          	li	a5,2
    80000384:	0cf70263          	beq	a4,a5,80000448 <test_process_state_transition+0x110>
    80000388:	00300793          	li	a5,3
    8000038c:	000014b7          	lui	s1,0x1
    80000390:	00f42023          	sw	a5,0(s0)
    80000394:	23448593          	add	a1,s1,564 # 1234 <_entry-0x7fffedcc>
    80000398:	00040513          	mv	a0,s0
    8000039c:	395040ef          	jal	80004f30 <proc_mark_sleeping>
    800003a0:	00042583          	lw	a1,0(s0)
    800003a4:	00400793          	li	a5,4
    800003a8:	00f59863          	bne	a1,a5,800003b8 <test_process_state_transition+0x80>
    800003ac:	0b843783          	ld	a5,184(s0)
    800003b0:	23448493          	add	s1,s1,564
    800003b4:	06978463          	beq	a5,s1,8000041c <test_process_state_transition+0xe4>
    800003b8:	00006517          	auipc	a0,0x6
    800003bc:	f4850513          	add	a0,a0,-184 # 80006300 <rodata_start+0x300>
    800003c0:	6f8010ef          	jal	80001ab8 <printf>
    800003c4:	02a00593          	li	a1,42
    800003c8:	00040513          	mv	a0,s0
    800003cc:	389040ef          	jal	80004f54 <proc_mark_zombie>
    800003d0:	00042703          	lw	a4,0(s0)
    800003d4:	00500793          	li	a5,5
    800003d8:	02f70463          	beq	a4,a5,80000400 <test_process_state_transition+0xc8>
    800003dc:	00040513          	mv	a0,s0
    800003e0:	251040ef          	jal	80004e30 <free_proc>
    800003e4:	01013403          	ld	s0,16(sp)
    800003e8:	01813083          	ld	ra,24(sp)
    800003ec:	00813483          	ld	s1,8(sp)
    800003f0:	00006517          	auipc	a0,0x6
    800003f4:	d5050513          	add	a0,a0,-688 # 80006140 <rodata_start+0x140>
    800003f8:	02010113          	add	sp,sp,32
    800003fc:	22d0106f          	j	80001e28 <uart_puts>
    80000400:	01042703          	lw	a4,16(s0)
    80000404:	02a00793          	li	a5,42
    80000408:	fcf71ae3          	bne	a4,a5,800003dc <test_process_state_transition+0xa4>
    8000040c:	00006517          	auipc	a0,0x6
    80000410:	f2450513          	add	a0,a0,-220 # 80006330 <rodata_start+0x330>
    80000414:	215010ef          	jal	80001e28 <uart_puts>
    80000418:	fc5ff06f          	j	800003dc <test_process_state_transition+0xa4>
    8000041c:	00006517          	auipc	a0,0x6
    80000420:	ec450513          	add	a0,a0,-316 # 800062e0 <rodata_start+0x2e0>
    80000424:	205010ef          	jal	80001e28 <uart_puts>
    80000428:	f9dff06f          	j	800003c4 <test_process_state_transition+0x8c>
    8000042c:	01013403          	ld	s0,16(sp)
    80000430:	01813083          	ld	ra,24(sp)
    80000434:	00813483          	ld	s1,8(sp)
    80000438:	00006517          	auipc	a0,0x6
    8000043c:	d5850513          	add	a0,a0,-680 # 80006190 <rodata_start+0x190>
    80000440:	02010113          	add	sp,sp,32
    80000444:	1e50106f          	j	80001e28 <uart_puts>
    80000448:	00006517          	auipc	a0,0x6
    8000044c:	e7850513          	add	a0,a0,-392 # 800062c0 <rodata_start+0x2c0>
    80000450:	1d9010ef          	jal	80001e28 <uart_puts>
    80000454:	f35ff06f          	j	80000388 <test_process_state_transition+0x50>

0000000080000458 <test_simple_fork>:
    80000458:	fe010113          	add	sp,sp,-32
    8000045c:	00006517          	auipc	a0,0x6
    80000460:	ef450513          	add	a0,a0,-268 # 80006350 <rodata_start+0x350>
    80000464:	00113c23          	sd	ra,24(sp)
    80000468:	00813823          	sd	s0,16(sp)
    8000046c:	00913423          	sd	s1,8(sp)
    80000470:	1b9010ef          	jal	80001e28 <uart_puts>
    80000474:	7fc040ef          	jal	80004c70 <alloc_proc>
    80000478:	0a050463          	beqz	a0,80000520 <test_simple_fork+0xc8>
    8000047c:	00300793          	li	a5,3
    80000480:	00f52023          	sw	a5,0(a0)
    80000484:	00050413          	mv	s0,a0
    80000488:	311040ef          	jal	80004f98 <set_current_proc>
    8000048c:	00442583          	lw	a1,4(s0)
    80000490:	00006517          	auipc	a0,0x6
    80000494:	f2050513          	add	a0,a0,-224 # 800063b0 <rodata_start+0x3b0>
    80000498:	620010ef          	jal	80001ab8 <printf>
    8000049c:	004050ef          	jal	800054a0 <fork>
    800004a0:	00050493          	mv	s1,a0
    800004a4:	06a05663          	blez	a0,80000510 <test_simple_fork+0xb8>
    800004a8:	00050593          	mv	a1,a0
    800004ac:	00006517          	auipc	a0,0x6
    800004b0:	f1c50513          	add	a0,a0,-228 # 800063c8 <rodata_start+0x3c8>
    800004b4:	604010ef          	jal	80001ab8 <printf>
    800004b8:	00048513          	mv	a0,s1
    800004bc:	1e9040ef          	jal	80004ea4 <find_proc>
    800004c0:	00050493          	mv	s1,a0
    800004c4:	02050063          	beqz	a0,800004e4 <test_simple_fork+0x8c>
    800004c8:	0b053783          	ld	a5,176(a0)
    800004cc:	06878863          	beq	a5,s0,8000053c <test_simple_fork+0xe4>
    800004d0:	0004a703          	lw	a4,0(s1)
    800004d4:	00200793          	li	a5,2
    800004d8:	08f70063          	beq	a4,a5,80000558 <test_simple_fork+0x100>
    800004dc:	00048513          	mv	a0,s1
    800004e0:	151040ef          	jal	80004e30 <free_proc>
    800004e4:	00040513          	mv	a0,s0
    800004e8:	149040ef          	jal	80004e30 <free_proc>
    800004ec:	00000513          	li	a0,0
    800004f0:	2a9040ef          	jal	80004f98 <set_current_proc>
    800004f4:	01013403          	ld	s0,16(sp)
    800004f8:	01813083          	ld	ra,24(sp)
    800004fc:	00813483          	ld	s1,8(sp)
    80000500:	00006517          	auipc	a0,0x6
    80000504:	c4050513          	add	a0,a0,-960 # 80006140 <rodata_start+0x140>
    80000508:	02010113          	add	sp,sp,32
    8000050c:	11d0106f          	j	80001e28 <uart_puts>
    80000510:	00006517          	auipc	a0,0x6
    80000514:	f2050513          	add	a0,a0,-224 # 80006430 <rodata_start+0x430>
    80000518:	111010ef          	jal	80001e28 <uart_puts>
    8000051c:	fc9ff06f          	j	800004e4 <test_simple_fork+0x8c>
    80000520:	01013403          	ld	s0,16(sp)
    80000524:	01813083          	ld	ra,24(sp)
    80000528:	00813483          	ld	s1,8(sp)
    8000052c:	00006517          	auipc	a0,0x6
    80000530:	e6450513          	add	a0,a0,-412 # 80006390 <rodata_start+0x390>
    80000534:	02010113          	add	sp,sp,32
    80000538:	0f10106f          	j	80001e28 <uart_puts>
    8000053c:	00852703          	lw	a4,8(a0)
    80000540:	00442783          	lw	a5,4(s0)
    80000544:	f8f716e3          	bne	a4,a5,800004d0 <test_simple_fork+0x78>
    80000548:	00006517          	auipc	a0,0x6
    8000054c:	ea850513          	add	a0,a0,-344 # 800063f0 <rodata_start+0x3f0>
    80000550:	0d9010ef          	jal	80001e28 <uart_puts>
    80000554:	f7dff06f          	j	800004d0 <test_simple_fork+0x78>
    80000558:	00006517          	auipc	a0,0x6
    8000055c:	eb850513          	add	a0,a0,-328 # 80006410 <rodata_start+0x410>
    80000560:	0c9010ef          	jal	80001e28 <uart_puts>
    80000564:	f79ff06f          	j	800004dc <test_simple_fork+0x84>

0000000080000568 <test_scheduler_basic>:
    80000568:	fb010113          	add	sp,sp,-80
    8000056c:	04813023          	sd	s0,64(sp)
    80000570:	00006517          	auipc	a0,0x6
    80000574:	ed050513          	add	a0,a0,-304 # 80006440 <rodata_start+0x440>
    80000578:	00810413          	add	s0,sp,8
    8000057c:	02913c23          	sd	s1,56(sp)
    80000580:	03213823          	sd	s2,48(sp)
    80000584:	03313423          	sd	s3,40(sp)
    80000588:	03413023          	sd	s4,32(sp)
    8000058c:	04113423          	sd	ra,72(sp)
    80000590:	02010913          	add	s2,sp,32
    80000594:	095010ef          	jal	80001e28 <uart_puts>
    80000598:	00040493          	mv	s1,s0
    8000059c:	00200a13          	li	s4,2
    800005a0:	00006997          	auipc	s3,0x6
    800005a4:	ee098993          	add	s3,s3,-288 # 80006480 <rodata_start+0x480>
    800005a8:	6c8040ef          	jal	80004c70 <alloc_proc>
    800005ac:	00a4b023          	sd	a0,0(s1)
    800005b0:	00050793          	mv	a5,a0
    800005b4:	00848493          	add	s1,s1,8
    800005b8:	00098513          	mv	a0,s3
    800005bc:	00078863          	beqz	a5,800005cc <test_scheduler_basic+0x64>
    800005c0:	0047a583          	lw	a1,4(a5)
    800005c4:	0147a023          	sw	s4,0(a5)
    800005c8:	4f0010ef          	jal	80001ab8 <printf>
    800005cc:	fd249ee3          	bne	s1,s2,800005a8 <test_scheduler_basic+0x40>
    800005d0:	00425797          	auipc	a5,0x425
    800005d4:	fd878793          	add	a5,a5,-40 # 804255a8 <proc>
    800005d8:	00426617          	auipc	a2,0x426
    800005dc:	c5060613          	add	a2,a2,-944 # 80426228 <mem_end>
    800005e0:	00000593          	li	a1,0
    800005e4:	00200693          	li	a3,2
    800005e8:	0007a703          	lw	a4,0(a5)
    800005ec:	0c878793          	add	a5,a5,200
    800005f0:	04d70863          	beq	a4,a3,80000640 <test_scheduler_basic+0xd8>
    800005f4:	fec79ae3          	bne	a5,a2,800005e8 <test_scheduler_basic+0x80>
    800005f8:	00006517          	auipc	a0,0x6
    800005fc:	ea050513          	add	a0,a0,-352 # 80006498 <rodata_start+0x498>
    80000600:	4b8010ef          	jal	80001ab8 <printf>
    80000604:	00043503          	ld	a0,0(s0)
    80000608:	00840413          	add	s0,s0,8
    8000060c:	00050463          	beqz	a0,80000614 <test_scheduler_basic+0xac>
    80000610:	021040ef          	jal	80004e30 <free_proc>
    80000614:	ff2418e3          	bne	s0,s2,80000604 <test_scheduler_basic+0x9c>
    80000618:	04013403          	ld	s0,64(sp)
    8000061c:	04813083          	ld	ra,72(sp)
    80000620:	03813483          	ld	s1,56(sp)
    80000624:	03013903          	ld	s2,48(sp)
    80000628:	02813983          	ld	s3,40(sp)
    8000062c:	02013a03          	ld	s4,32(sp)
    80000630:	00006517          	auipc	a0,0x6
    80000634:	b1050513          	add	a0,a0,-1264 # 80006140 <rodata_start+0x140>
    80000638:	05010113          	add	sp,sp,80
    8000063c:	7ec0106f          	j	80001e28 <uart_puts>
    80000640:	0015859b          	addw	a1,a1,1
    80000644:	fac792e3          	bne	a5,a2,800005e8 <test_scheduler_basic+0x80>
    80000648:	fb1ff06f          	j	800005f8 <test_scheduler_basic+0x90>

000000008000064c <test_process_memory>:
    8000064c:	fd010113          	add	sp,sp,-48
    80000650:	00006517          	auipc	a0,0x6
    80000654:	e7050513          	add	a0,a0,-400 # 800064c0 <rodata_start+0x4c0>
    80000658:	02113423          	sd	ra,40(sp)
    8000065c:	02813023          	sd	s0,32(sp)
    80000660:	00913c23          	sd	s1,24(sp)
    80000664:	01213823          	sd	s2,16(sp)
    80000668:	01313423          	sd	s3,8(sp)
    8000066c:	7bc010ef          	jal	80001e28 <uart_puts>
    80000670:	600040ef          	jal	80004c70 <alloc_proc>
    80000674:	10050663          	beqz	a0,80000780 <test_process_memory+0x134>
    80000678:	01853783          	ld	a5,24(a0)
    8000067c:	00050413          	mv	s0,a0
    80000680:	0c078a63          	beqz	a5,80000754 <test_process_memory+0x108>
    80000684:	00452583          	lw	a1,4(a0)
    80000688:	00006517          	auipc	a0,0x6
    8000068c:	e7850513          	add	a0,a0,-392 # 80006500 <rodata_start+0x500>
    80000690:	00002937          	lui	s2,0x2
    80000694:	424010ef          	jal	80001ab8 <printf>
    80000698:	02043983          	ld	s3,32(s0)
    8000069c:	01843503          	ld	a0,24(s0)
    800006a0:	01298933          	add	s2,s3,s2
    800006a4:	00090613          	mv	a2,s2
    800006a8:	00098593          	mv	a1,s3
    800006ac:	6b8030ef          	jal	80003d64 <uvmalloc>
    800006b0:	00050493          	mv	s1,a0
    800006b4:	06a90663          	beq	s2,a0,80000720 <test_process_memory+0xd4>
    800006b8:	00006517          	auipc	a0,0x6
    800006bc:	ea050513          	add	a0,a0,-352 # 80006558 <rodata_start+0x558>
    800006c0:	768010ef          	jal	80001e28 <uart_puts>
    800006c4:	02043483          	ld	s1,32(s0)
    800006c8:	01843503          	ld	a0,24(s0)
    800006cc:	fffff937          	lui	s2,0xfffff
    800006d0:	01248633          	add	a2,s1,s2
    800006d4:	00048593          	mv	a1,s1
    800006d8:	614030ef          	jal	80003cec <uvmdealloc>
    800006dc:	02043583          	ld	a1,32(s0)
    800006e0:	01258933          	add	s2,a1,s2
    800006e4:	04a90c63          	beq	s2,a0,8000073c <test_process_memory+0xf0>
    800006e8:	00006517          	auipc	a0,0x6
    800006ec:	eb850513          	add	a0,a0,-328 # 800065a0 <rodata_start+0x5a0>
    800006f0:	738010ef          	jal	80001e28 <uart_puts>
    800006f4:	00040513          	mv	a0,s0
    800006f8:	738040ef          	jal	80004e30 <free_proc>
    800006fc:	00006517          	auipc	a0,0x6
    80000700:	ebc50513          	add	a0,a0,-324 # 800065b8 <rodata_start+0x5b8>
    80000704:	02013403          	ld	s0,32(sp)
    80000708:	02813083          	ld	ra,40(sp)
    8000070c:	01813483          	ld	s1,24(sp)
    80000710:	01013903          	ld	s2,16(sp)
    80000714:	00813983          	ld	s3,8(sp)
    80000718:	03010113          	add	sp,sp,48
    8000071c:	70c0106f          	j	80001e28 <uart_puts>
    80000720:	00050613          	mv	a2,a0
    80000724:	00098593          	mv	a1,s3
    80000728:	00006517          	auipc	a0,0x6
    8000072c:	e0050513          	add	a0,a0,-512 # 80006528 <rodata_start+0x528>
    80000730:	388010ef          	jal	80001ab8 <printf>
    80000734:	02943023          	sd	s1,32(s0)
    80000738:	f91ff06f          	j	800006c8 <test_process_memory+0x7c>
    8000073c:	00090613          	mv	a2,s2
    80000740:	00006517          	auipc	a0,0x6
    80000744:	e3050513          	add	a0,a0,-464 # 80006570 <rodata_start+0x570>
    80000748:	370010ef          	jal	80001ab8 <printf>
    8000074c:	03243023          	sd	s2,32(s0)
    80000750:	fa5ff06f          	j	800006f4 <test_process_memory+0xa8>
    80000754:	00006517          	auipc	a0,0x6
    80000758:	d8c50513          	add	a0,a0,-628 # 800064e0 <rodata_start+0x4e0>
    8000075c:	6cc010ef          	jal	80001e28 <uart_puts>
    80000760:	00040513          	mv	a0,s0
    80000764:	02013403          	ld	s0,32(sp)
    80000768:	02813083          	ld	ra,40(sp)
    8000076c:	01813483          	ld	s1,24(sp)
    80000770:	01013903          	ld	s2,16(sp)
    80000774:	00813983          	ld	s3,8(sp)
    80000778:	03010113          	add	sp,sp,48
    8000077c:	6b40406f          	j	80004e30 <free_proc>
    80000780:	00006517          	auipc	a0,0x6
    80000784:	9a850513          	add	a0,a0,-1624 # 80006128 <rodata_start+0x128>
    80000788:	f7dff06f          	j	80000704 <test_process_memory+0xb8>

000000008000078c <test_growproc>:
    8000078c:	fe010113          	add	sp,sp,-32
    80000790:	00006517          	auipc	a0,0x6
    80000794:	e5050513          	add	a0,a0,-432 # 800065e0 <rodata_start+0x5e0>
    80000798:	00113c23          	sd	ra,24(sp)
    8000079c:	00813823          	sd	s0,16(sp)
    800007a0:	00913423          	sd	s1,8(sp)
    800007a4:	01213023          	sd	s2,0(sp)
    800007a8:	680010ef          	jal	80001e28 <uart_puts>
    800007ac:	4c4040ef          	jal	80004c70 <alloc_proc>
    800007b0:	0c050463          	beqz	a0,80000878 <test_growproc+0xec>
    800007b4:	00050413          	mv	s0,a0
    800007b8:	01853503          	ld	a0,24(a0)
    800007bc:	00001637          	lui	a2,0x1
    800007c0:	00000593          	li	a1,0
    800007c4:	5a0030ef          	jal	80003d64 <uvmalloc>
    800007c8:	00050593          	mv	a1,a0
    800007cc:	02a43023          	sd	a0,32(s0)
    800007d0:	00006517          	auipc	a0,0x6
    800007d4:	e3050513          	add	a0,a0,-464 # 80006600 <rodata_start+0x600>
    800007d8:	2e0010ef          	jal	80001ab8 <printf>
    800007dc:	00426497          	auipc	s1,0x426
    800007e0:	a8c48493          	add	s1,s1,-1396 # 80426268 <current_proc>
    800007e4:	00001537          	lui	a0,0x1
    800007e8:	0004b903          	ld	s2,0(s1)
    800007ec:	0084b023          	sd	s0,0(s1)
    800007f0:	639040ef          	jal	80005628 <growproc>
    800007f4:	04050c63          	beqz	a0,8000084c <test_growproc+0xc0>
    800007f8:	00006517          	auipc	a0,0x6
    800007fc:	e6050513          	add	a0,a0,-416 # 80006658 <rodata_start+0x658>
    80000800:	628010ef          	jal	80001e28 <uart_puts>
    80000804:	fffff537          	lui	a0,0xfffff
    80000808:	621040ef          	jal	80005628 <growproc>
    8000080c:	04051e63          	bnez	a0,80000868 <test_growproc+0xdc>
    80000810:	02043583          	ld	a1,32(s0)
    80000814:	00006517          	auipc	a0,0x6
    80000818:	e6450513          	add	a0,a0,-412 # 80006678 <rodata_start+0x678>
    8000081c:	29c010ef          	jal	80001ab8 <printf>
    80000820:	00040513          	mv	a0,s0
    80000824:	0124b023          	sd	s2,0(s1)
    80000828:	608040ef          	jal	80004e30 <free_proc>
    8000082c:	01013403          	ld	s0,16(sp)
    80000830:	01813083          	ld	ra,24(sp)
    80000834:	00813483          	ld	s1,8(sp)
    80000838:	00013903          	ld	s2,0(sp)
    8000083c:	00006517          	auipc	a0,0x6
    80000840:	e9450513          	add	a0,a0,-364 # 800066d0 <rodata_start+0x6d0>
    80000844:	02010113          	add	sp,sp,32
    80000848:	5e00106f          	j	80001e28 <uart_puts>
    8000084c:	02043583          	ld	a1,32(s0)
    80000850:	00006517          	auipc	a0,0x6
    80000854:	dd050513          	add	a0,a0,-560 # 80006620 <rodata_start+0x620>
    80000858:	260010ef          	jal	80001ab8 <printf>
    8000085c:	fffff537          	lui	a0,0xfffff
    80000860:	5c9040ef          	jal	80005628 <growproc>
    80000864:	fa0506e3          	beqz	a0,80000810 <test_growproc+0x84>
    80000868:	00006517          	auipc	a0,0x6
    8000086c:	e4850513          	add	a0,a0,-440 # 800066b0 <rodata_start+0x6b0>
    80000870:	5b8010ef          	jal	80001e28 <uart_puts>
    80000874:	fadff06f          	j	80000820 <test_growproc+0x94>
    80000878:	01013403          	ld	s0,16(sp)
    8000087c:	01813083          	ld	ra,24(sp)
    80000880:	00813483          	ld	s1,8(sp)
    80000884:	00013903          	ld	s2,0(sp)
    80000888:	00006517          	auipc	a0,0x6
    8000088c:	8a050513          	add	a0,a0,-1888 # 80006128 <rodata_start+0x128>
    80000890:	02010113          	add	sp,sp,32
    80000894:	5940106f          	j	80001e28 <uart_puts>

0000000080000898 <test_uid_limits>:
    80000898:	f5010113          	add	sp,sp,-176
    8000089c:	00006517          	auipc	a0,0x6
    800008a0:	e5450513          	add	a0,a0,-428 # 800066f0 <rodata_start+0x6f0>
    800008a4:	0a113423          	sd	ra,168(sp)
    800008a8:	0a813023          	sd	s0,160(sp)
    800008ac:	09213823          	sd	s2,144(sp)
    800008b0:	08913c23          	sd	s1,152(sp)
    800008b4:	09313423          	sd	s3,136(sp)
    800008b8:	09413023          	sd	s4,128(sp)
    800008bc:	07513c23          	sd	s5,120(sp)
    800008c0:	07613823          	sd	s6,112(sp)
    800008c4:	07713423          	sd	s7,104(sp)
    800008c8:	07813023          	sd	s8,96(sp)
    800008cc:	05913c23          	sd	s9,88(sp)
    800008d0:	05a13823          	sd	s10,80(sp)
    800008d4:	554010ef          	jal	80001e28 <uart_puts>
    800008d8:	398040ef          	jal	80004c70 <alloc_proc>
    800008dc:	00050413          	mv	s0,a0
    800008e0:	00000913          	li	s2,0
    800008e4:	02050063          	beqz	a0,80000904 <test_uid_limits+0x6c>
    800008e8:	00c52603          	lw	a2,12(a0)
    800008ec:	00452583          	lw	a1,4(a0)
    800008f0:	00006517          	auipc	a0,0x6
    800008f4:	e2850513          	add	a0,a0,-472 # 80006718 <rodata_start+0x718>
    800008f8:	00100913          	li	s2,1
    800008fc:	1bc010ef          	jal	80001ab8 <printf>
    80000900:	00813023          	sd	s0,0(sp)
    80000904:	00426a97          	auipc	s5,0x426
    80000908:	964a8a93          	add	s5,s5,-1692 # 80426268 <current_proc>
    8000090c:	00100513          	li	a0,1
    80000910:	000abc03          	ld	s8,0(s5)
    80000914:	008ab023          	sd	s0,0(s5)
    80000918:	6a4040ef          	jal	80004fbc <set_uid>
    8000091c:	12050063          	beqz	a0,80000a3c <test_uid_limits+0x1a4>
    80000920:	00400593          	li	a1,4
    80000924:	00006517          	auipc	a0,0x6
    80000928:	e4c50513          	add	a0,a0,-436 # 80006770 <rodata_start+0x770>
    8000092c:	00391993          	sll	s3,s2,0x3
    80000930:	00200b13          	li	s6,2
    80000934:	184010ef          	jal	80001ab8 <printf>
    80000938:	013109b3          	add	s3,sp,s3
    8000093c:	00990b9b          	addw	s7,s2,9 # fffffffffffff009 <bss_end+0xffffffff7fbd8d99>
    80000940:	412b0b3b          	subw	s6,s6,s2
    80000944:	00400a13          	li	s4,4
    80000948:	00006c97          	auipc	s9,0x6
    8000094c:	ed8c8c93          	add	s9,s9,-296 # 80006820 <rodata_start+0x820>
    80000950:	320040ef          	jal	80004c70 <alloc_proc>
    80000954:	00050413          	mv	s0,a0
    80000958:	012b0d3b          	addw	s10,s6,s2
    8000095c:	0e050a63          	beqz	a0,80000a50 <test_uid_limits+0x1b8>
    80000960:	000ab783          	ld	a5,0(s5)
    80000964:	00c7a503          	lw	a0,12(a5)
    80000968:	00a42623          	sw	a0,12(s0)
    8000096c:	6d0040ef          	jal	8000503c <count_user_procs>
    80000970:	00050493          	mv	s1,a0
    80000974:	000d0593          	mv	a1,s10
    80000978:	000c8513          	mv	a0,s9
    8000097c:	00048713          	mv	a4,s1
    80000980:	109a4063          	blt	s4,s1,80000a80 <test_uid_limits+0x1e8>
    80000984:	00c42683          	lw	a3,12(s0)
    80000988:	00442603          	lw	a2,4(s0)
    8000098c:	00898993          	add	s3,s3,8
    80000990:	0019091b          	addw	s2,s2,1
    80000994:	124010ef          	jal	80001ab8 <printf>
    80000998:	fe89bc23          	sd	s0,-8(s3)
    8000099c:	13448063          	beq	s1,s4,80000abc <test_uid_limits+0x224>
    800009a0:	fb7918e3          	bne	s2,s7,80000950 <test_uid_limits+0xb8>
    800009a4:	00006517          	auipc	a0,0x6
    800009a8:	efc50513          	add	a0,a0,-260 # 800068a0 <rodata_start+0x8a0>
    800009ac:	10c010ef          	jal	80001ab8 <printf>
    800009b0:	00100513          	li	a0,1
    800009b4:	6e4040ef          	jal	80005098 <can_fork>
    800009b8:	06050a63          	beqz	a0,80000a2c <test_uid_limits+0x194>
    800009bc:	00006517          	auipc	a0,0x6
    800009c0:	f2c50513          	add	a0,a0,-212 # 800068e8 <rodata_start+0x8e8>
    800009c4:	464010ef          	jal	80001e28 <uart_puts>
    800009c8:	00010413          	mv	s0,sp
    800009cc:	003b9493          	sll	s1,s7,0x3
    800009d0:	018ab023          	sd	s8,0(s5)
    800009d4:	009404b3          	add	s1,s0,s1
    800009d8:	000b8a63          	beqz	s7,800009ec <test_uid_limits+0x154>
    800009dc:	00043503          	ld	a0,0(s0)
    800009e0:	00840413          	add	s0,s0,8
    800009e4:	44c040ef          	jal	80004e30 <free_proc>
    800009e8:	fe941ae3          	bne	s0,s1,800009dc <test_uid_limits+0x144>
    800009ec:	0a013403          	ld	s0,160(sp)
    800009f0:	0a813083          	ld	ra,168(sp)
    800009f4:	09813483          	ld	s1,152(sp)
    800009f8:	09013903          	ld	s2,144(sp)
    800009fc:	08813983          	ld	s3,136(sp)
    80000a00:	08013a03          	ld	s4,128(sp)
    80000a04:	07813a83          	ld	s5,120(sp)
    80000a08:	07013b03          	ld	s6,112(sp)
    80000a0c:	06813b83          	ld	s7,104(sp)
    80000a10:	06013c03          	ld	s8,96(sp)
    80000a14:	05813c83          	ld	s9,88(sp)
    80000a18:	05013d03          	ld	s10,80(sp)
    80000a1c:	00006517          	auipc	a0,0x6
    80000a20:	ef450513          	add	a0,a0,-268 # 80006910 <rodata_start+0x910>
    80000a24:	0b010113          	add	sp,sp,176
    80000a28:	4000106f          	j	80001e28 <uart_puts>
    80000a2c:	00006517          	auipc	a0,0x6
    80000a30:	e8c50513          	add	a0,a0,-372 # 800068b8 <rodata_start+0x8b8>
    80000a34:	3f4010ef          	jal	80001e28 <uart_puts>
    80000a38:	f91ff06f          	j	800009c8 <test_uid_limits+0x130>
    80000a3c:	00442583          	lw	a1,4(s0)
    80000a40:	00006517          	auipc	a0,0x6
    80000a44:	d0050513          	add	a0,a0,-768 # 80006740 <rodata_start+0x740>
    80000a48:	070010ef          	jal	80001ab8 <printf>
    80000a4c:	ed5ff06f          	j	80000920 <test_uid_limits+0x88>
    80000a50:	000d0593          	mv	a1,s10
    80000a54:	00006517          	auipc	a0,0x6
    80000a58:	d5450513          	add	a0,a0,-684 # 800067a8 <rodata_start+0x7a8>
    80000a5c:	05c010ef          	jal	80001ab8 <printf>
    80000a60:	00006517          	auipc	a0,0x6
    80000a64:	e4050513          	add	a0,a0,-448 # 800068a0 <rodata_start+0x8a0>
    80000a68:	050010ef          	jal	80001ab8 <printf>
    80000a6c:	00100513          	li	a0,1
    80000a70:	00090b93          	mv	s7,s2
    80000a74:	624040ef          	jal	80005098 <can_fork>
    80000a78:	f40512e3          	bnez	a0,800009bc <test_uid_limits+0x124>
    80000a7c:	fb1ff06f          	j	80000a2c <test_uid_limits+0x194>
    80000a80:	00c42603          	lw	a2,12(s0)
    80000a84:	fff4869b          	addw	a3,s1,-1
    80000a88:	00006517          	auipc	a0,0x6
    80000a8c:	d5050513          	add	a0,a0,-688 # 800067d8 <rodata_start+0x7d8>
    80000a90:	028010ef          	jal	80001ab8 <printf>
    80000a94:	00040513          	mv	a0,s0
    80000a98:	398040ef          	jal	80004e30 <free_proc>
    80000a9c:	00006517          	auipc	a0,0x6
    80000aa0:	e0450513          	add	a0,a0,-508 # 800068a0 <rodata_start+0x8a0>
    80000aa4:	014010ef          	jal	80001ab8 <printf>
    80000aa8:	00100513          	li	a0,1
    80000aac:	00090b93          	mv	s7,s2
    80000ab0:	5e8040ef          	jal	80005098 <can_fork>
    80000ab4:	f00514e3          	bnez	a0,800009bc <test_uid_limits+0x124>
    80000ab8:	f75ff06f          	j	80000a2c <test_uid_limits+0x194>
    80000abc:	00c42583          	lw	a1,12(s0)
    80000ac0:	00400613          	li	a2,4
    80000ac4:	00006517          	auipc	a0,0x6
    80000ac8:	dac50513          	add	a0,a0,-596 # 80006870 <rodata_start+0x870>
    80000acc:	7ed000ef          	jal	80001ab8 <printf>
    80000ad0:	00006517          	auipc	a0,0x6
    80000ad4:	dd050513          	add	a0,a0,-560 # 800068a0 <rodata_start+0x8a0>
    80000ad8:	7e1000ef          	jal	80001ab8 <printf>
    80000adc:	00100513          	li	a0,1
    80000ae0:	00090b93          	mv	s7,s2
    80000ae4:	5b4040ef          	jal	80005098 <can_fork>
    80000ae8:	ec051ae3          	bnez	a0,800009bc <test_uid_limits+0x124>
    80000aec:	f41ff06f          	j	80000a2c <test_uid_limits+0x194>

0000000080000af0 <run_process_management_tests>:
    80000af0:	ff010113          	add	sp,sp,-16
    80000af4:	00006517          	auipc	a0,0x6
    80000af8:	83450513          	add	a0,a0,-1996 # 80006328 <rodata_start+0x328>
    80000afc:	00113423          	sd	ra,8(sp)
    80000b00:	328010ef          	jal	80001e28 <uart_puts>
    80000b04:	00006517          	auipc	a0,0x6
    80000b08:	e2c50513          	add	a0,a0,-468 # 80006930 <rodata_start+0x930>
    80000b0c:	31c010ef          	jal	80001e28 <uart_puts>
    80000b10:	00006517          	auipc	a0,0x6
    80000b14:	ee850513          	add	a0,a0,-280 # 800069f8 <rodata_start+0x9f8>
    80000b18:	310010ef          	jal	80001e28 <uart_puts>
    80000b1c:	00006517          	auipc	a0,0x6
    80000b20:	f3c50513          	add	a0,a0,-196 # 80006a58 <rodata_start+0xa58>
    80000b24:	304010ef          	jal	80001e28 <uart_puts>
    80000b28:	e04ff0ef          	jal	8000012c <test_process_allocation>
    80000b2c:	f2cff0ef          	jal	80000258 <test_process_find>
    80000b30:	809ff0ef          	jal	80000338 <test_process_state_transition>
    80000b34:	925ff0ef          	jal	80000458 <test_simple_fork>
    80000b38:	b15ff0ef          	jal	8000064c <test_process_memory>
    80000b3c:	c51ff0ef          	jal	8000078c <test_growproc>
    80000b40:	d59ff0ef          	jal	80000898 <test_uid_limits>
    80000b44:	a25ff0ef          	jal	80000568 <test_scheduler_basic>
    80000b48:	00005517          	auipc	a0,0x5
    80000b4c:	7e050513          	add	a0,a0,2016 # 80006328 <rodata_start+0x328>
    80000b50:	2d8010ef          	jal	80001e28 <uart_puts>
    80000b54:	00006517          	auipc	a0,0x6
    80000b58:	ddc50513          	add	a0,a0,-548 # 80006930 <rodata_start+0x930>
    80000b5c:	2cc010ef          	jal	80001e28 <uart_puts>
    80000b60:	00006517          	auipc	a0,0x6
    80000b64:	fc050513          	add	a0,a0,-64 # 80006b20 <rodata_start+0xb20>
    80000b68:	2c0010ef          	jal	80001e28 <uart_puts>
    80000b6c:	00006517          	auipc	a0,0x6
    80000b70:	00c50513          	add	a0,a0,12 # 80006b78 <rodata_start+0xb78>
    80000b74:	2b4010ef          	jal	80001e28 <uart_puts>
    80000b78:	00006517          	auipc	a0,0x6
    80000b7c:	0d050513          	add	a0,a0,208 # 80006c48 <rodata_start+0xc48>
    80000b80:	2a8010ef          	jal	80001e28 <uart_puts>
    80000b84:	00006517          	auipc	a0,0x6
    80000b88:	0dc50513          	add	a0,a0,220 # 80006c60 <rodata_start+0xc60>
    80000b8c:	29c010ef          	jal	80001e28 <uart_puts>
    80000b90:	00006517          	auipc	a0,0x6
    80000b94:	12050513          	add	a0,a0,288 # 80006cb0 <rodata_start+0xcb0>
    80000b98:	290010ef          	jal	80001e28 <uart_puts>
    80000b9c:	00006517          	auipc	a0,0x6
    80000ba0:	13450513          	add	a0,a0,308 # 80006cd0 <rodata_start+0xcd0>
    80000ba4:	284010ef          	jal	80001e28 <uart_puts>
    80000ba8:	00006517          	auipc	a0,0x6
    80000bac:	14850513          	add	a0,a0,328 # 80006cf0 <rodata_start+0xcf0>
    80000bb0:	278010ef          	jal	80001e28 <uart_puts>
    80000bb4:	00006517          	auipc	a0,0x6
    80000bb8:	16c50513          	add	a0,a0,364 # 80006d20 <rodata_start+0xd20>
    80000bbc:	26c010ef          	jal	80001e28 <uart_puts>
    80000bc0:	00006517          	auipc	a0,0x6
    80000bc4:	19050513          	add	a0,a0,400 # 80006d50 <rodata_start+0xd50>
    80000bc8:	260010ef          	jal	80001e28 <uart_puts>
    80000bcc:	00006517          	auipc	a0,0x6
    80000bd0:	1a450513          	add	a0,a0,420 # 80006d70 <rodata_start+0xd70>
    80000bd4:	254010ef          	jal	80001e28 <uart_puts>
    80000bd8:	00813083          	ld	ra,8(sp)
    80000bdc:	00006517          	auipc	a0,0x6
    80000be0:	1bc50513          	add	a0,a0,444 # 80006d98 <rodata_start+0xd98>
    80000be4:	01010113          	add	sp,sp,16
    80000be8:	2400106f          	j	80001e28 <uart_puts>

0000000080000bec <test_round_robin_scheduler>:
    80000bec:	fa010113          	add	sp,sp,-96
    80000bf0:	04813823          	sd	s0,80(sp)
    80000bf4:	00006517          	auipc	a0,0x6
    80000bf8:	1c450513          	add	a0,a0,452 # 80006db8 <rodata_start+0xdb8>
    80000bfc:	00810413          	add	s0,sp,8
    80000c00:	04913423          	sd	s1,72(sp)
    80000c04:	05213023          	sd	s2,64(sp)
    80000c08:	03313c23          	sd	s3,56(sp)
    80000c0c:	03413823          	sd	s4,48(sp)
    80000c10:	03513423          	sd	s5,40(sp)
    80000c14:	03613023          	sd	s6,32(sp)
    80000c18:	04113c23          	sd	ra,88(sp)
    80000c1c:	00040913          	mv	s2,s0
    80000c20:	208010ef          	jal	80001e28 <uart_puts>
    80000c24:	00000493          	li	s1,0
    80000c28:	fffffb17          	auipc	s6,0xfffff
    80000c2c:	458b0b13          	add	s6,s6,1112 # 80000080 <rr_worker>
    80000c30:	00200a93          	li	s5,2
    80000c34:	00006a17          	auipc	s4,0x6
    80000c38:	1eca0a13          	add	s4,s4,492 # 80006e20 <rodata_start+0xe20>
    80000c3c:	00300993          	li	s3,3
    80000c40:	030040ef          	jal	80004c70 <alloc_proc>
    80000c44:	00050793          	mv	a5,a0
    80000c48:	00a93023          	sd	a0,0(s2)
    80000c4c:	000a0513          	mv	a0,s4
    80000c50:	06078c63          	beqz	a5,80000cc8 <test_round_robin_scheduler+0xdc>
    80000c54:	0047a583          	lw	a1,4(a5)
    80000c58:	0567b023          	sd	s6,64(a5)
    80000c5c:	0157a023          	sw	s5,0(a5)
    80000c60:	659000ef          	jal	80001ab8 <printf>
    80000c64:	0014849b          	addw	s1,s1,1
    80000c68:	00890913          	add	s2,s2,8
    80000c6c:	fd349ae3          	bne	s1,s3,80000c40 <test_round_robin_scheduler+0x54>
    80000c70:	00006517          	auipc	a0,0x6
    80000c74:	1d050513          	add	a0,a0,464 # 80006e40 <rodata_start+0xe40>
    80000c78:	1b0010ef          	jal	80001e28 <uart_puts>
    80000c7c:	01840493          	add	s1,s0,24
    80000c80:	630040ef          	jal	800052b0 <scheduler>
    80000c84:	00043503          	ld	a0,0(s0)
    80000c88:	00840413          	add	s0,s0,8
    80000c8c:	00050463          	beqz	a0,80000c94 <test_round_robin_scheduler+0xa8>
    80000c90:	1a0040ef          	jal	80004e30 <free_proc>
    80000c94:	fe9418e3          	bne	s0,s1,80000c84 <test_round_robin_scheduler+0x98>
    80000c98:	05013403          	ld	s0,80(sp)
    80000c9c:	05813083          	ld	ra,88(sp)
    80000ca0:	04813483          	ld	s1,72(sp)
    80000ca4:	04013903          	ld	s2,64(sp)
    80000ca8:	03813983          	ld	s3,56(sp)
    80000cac:	03013a03          	ld	s4,48(sp)
    80000cb0:	02813a83          	ld	s5,40(sp)
    80000cb4:	02013b03          	ld	s6,32(sp)
    80000cb8:	00006517          	auipc	a0,0x6
    80000cbc:	1c850513          	add	a0,a0,456 # 80006e80 <rodata_start+0xe80>
    80000cc0:	06010113          	add	sp,sp,96
    80000cc4:	1640106f          	j	80001e28 <uart_puts>
    80000cc8:	00048593          	mv	a1,s1
    80000ccc:	00006517          	auipc	a0,0x6
    80000cd0:	13450513          	add	a0,a0,308 # 80006e00 <rodata_start+0xe00>
    80000cd4:	5e5000ef          	jal	80001ab8 <printf>
    80000cd8:	f8dff06f          	j	80000c64 <test_round_robin_scheduler+0x78>

0000000080000cdc <test_trap_initialization>:
    80000cdc:	ff010113          	add	sp,sp,-16
    80000ce0:	00006517          	auipc	a0,0x6
    80000ce4:	1c850513          	add	a0,a0,456 # 80006ea8 <rodata_start+0xea8>
    80000ce8:	00113423          	sd	ra,8(sp)
    80000cec:	00813023          	sd	s0,0(sp)
    80000cf0:	138010ef          	jal	80001e28 <uart_puts>
    80000cf4:	0e5030ef          	jal	800045d8 <trap_init>
    80000cf8:	191030ef          	jal	80004688 <trap_init_hart>
    80000cfc:	10502473          	csrr	s0,stvec
    80000d00:	00006517          	auipc	a0,0x6
    80000d04:	1e850513          	add	a0,a0,488 # 80006ee8 <rodata_start+0xee8>
    80000d08:	00040593          	mv	a1,s0
    80000d0c:	5ad000ef          	jal	80001ab8 <printf>
    80000d10:	02040c63          	beqz	s0,80000d48 <test_trap_initialization+0x6c>
    80000d14:	00006517          	auipc	a0,0x6
    80000d18:	1f450513          	add	a0,a0,500 # 80006f08 <rodata_start+0xf08>
    80000d1c:	10c010ef          	jal	80001e28 <uart_puts>
    80000d20:	104025f3          	csrr	a1,sie
    80000d24:	00006517          	auipc	a0,0x6
    80000d28:	22c50513          	add	a0,a0,556 # 80006f50 <rodata_start+0xf50>
    80000d2c:	58d000ef          	jal	80001ab8 <printf>
    80000d30:	00013403          	ld	s0,0(sp)
    80000d34:	00813083          	ld	ra,8(sp)
    80000d38:	00006517          	auipc	a0,0x6
    80000d3c:	24850513          	add	a0,a0,584 # 80006f80 <rodata_start+0xf80>
    80000d40:	01010113          	add	sp,sp,16
    80000d44:	0e40106f          	j	80001e28 <uart_puts>
    80000d48:	00006517          	auipc	a0,0x6
    80000d4c:	1e050513          	add	a0,a0,480 # 80006f28 <rodata_start+0xf28>
    80000d50:	0d8010ef          	jal	80001e28 <uart_puts>
    80000d54:	fcdff06f          	j	80000d20 <test_trap_initialization+0x44>

0000000080000d58 <test_interrupt_control>:
    80000d58:	ff010113          	add	sp,sp,-16
    80000d5c:	00006517          	auipc	a0,0x6
    80000d60:	23c50513          	add	a0,a0,572 # 80006f98 <rodata_start+0xf98>
    80000d64:	00113423          	sd	ra,8(sp)
    80000d68:	00813023          	sd	s0,0(sp)
    80000d6c:	0bc010ef          	jal	80001e28 <uart_puts>
    80000d70:	00006517          	auipc	a0,0x6
    80000d74:	26850513          	add	a0,a0,616 # 80006fd8 <rodata_start+0xfd8>
    80000d78:	0b0010ef          	jal	80001e28 <uart_puts>
    80000d7c:	031030ef          	jal	800045ac <intr_off>
    80000d80:	03d030ef          	jal	800045bc <intr_get>
    80000d84:	00050413          	mv	s0,a0
    80000d88:	00050593          	mv	a1,a0
    80000d8c:	00006517          	auipc	a0,0x6
    80000d90:	26450513          	add	a0,a0,612 # 80006ff0 <rodata_start+0xff0>
    80000d94:	525000ef          	jal	80001ab8 <printf>
    80000d98:	06041063          	bnez	s0,80000df8 <test_interrupt_control+0xa0>
    80000d9c:	00006517          	auipc	a0,0x6
    80000da0:	27450513          	add	a0,a0,628 # 80007010 <rodata_start+0x1010>
    80000da4:	084010ef          	jal	80001e28 <uart_puts>
    80000da8:	00006517          	auipc	a0,0x6
    80000dac:	29850513          	add	a0,a0,664 # 80007040 <rodata_start+0x1040>
    80000db0:	078010ef          	jal	80001e28 <uart_puts>
    80000db4:	7e8030ef          	jal	8000459c <intr_on>
    80000db8:	005030ef          	jal	800045bc <intr_get>
    80000dbc:	00050413          	mv	s0,a0
    80000dc0:	00050593          	mv	a1,a0
    80000dc4:	00006517          	auipc	a0,0x6
    80000dc8:	29450513          	add	a0,a0,660 # 80007058 <rodata_start+0x1058>
    80000dcc:	4ed000ef          	jal	80001ab8 <printf>
    80000dd0:	02040c63          	beqz	s0,80000e08 <test_interrupt_control+0xb0>
    80000dd4:	00006517          	auipc	a0,0x6
    80000dd8:	2a450513          	add	a0,a0,676 # 80007078 <rodata_start+0x1078>
    80000ddc:	04c010ef          	jal	80001e28 <uart_puts>
    80000de0:	00013403          	ld	s0,0(sp)
    80000de4:	00813083          	ld	ra,8(sp)
    80000de8:	00006517          	auipc	a0,0x6
    80000dec:	2c050513          	add	a0,a0,704 # 800070a8 <rodata_start+0x10a8>
    80000df0:	01010113          	add	sp,sp,16
    80000df4:	0340106f          	j	80001e28 <uart_puts>
    80000df8:	00006517          	auipc	a0,0x6
    80000dfc:	23050513          	add	a0,a0,560 # 80007028 <rodata_start+0x1028>
    80000e00:	028010ef          	jal	80001e28 <uart_puts>
    80000e04:	fa5ff06f          	j	80000da8 <test_interrupt_control+0x50>
    80000e08:	00006517          	auipc	a0,0x6
    80000e0c:	28850513          	add	a0,a0,648 # 80007090 <rodata_start+0x1090>
    80000e10:	018010ef          	jal	80001e28 <uart_puts>
    80000e14:	00013403          	ld	s0,0(sp)
    80000e18:	00813083          	ld	ra,8(sp)
    80000e1c:	00006517          	auipc	a0,0x6
    80000e20:	28c50513          	add	a0,a0,652 # 800070a8 <rodata_start+0x10a8>
    80000e24:	01010113          	add	sp,sp,16
    80000e28:	0000106f          	j	80001e28 <uart_puts>

0000000080000e2c <test_trapframe_allocation>:
    80000e2c:	fe010113          	add	sp,sp,-32
    80000e30:	00006517          	auipc	a0,0x6
    80000e34:	29050513          	add	a0,a0,656 # 800070c0 <rodata_start+0x10c0>
    80000e38:	00113c23          	sd	ra,24(sp)
    80000e3c:	00813823          	sd	s0,16(sp)
    80000e40:	00913423          	sd	s1,8(sp)
    80000e44:	01213023          	sd	s2,0(sp)
    80000e48:	7e1000ef          	jal	80001e28 <uart_puts>
    80000e4c:	00006517          	auipc	a0,0x6
    80000e50:	2b450513          	add	a0,a0,692 # 80007100 <rodata_start+0x1100>
    80000e54:	7d5000ef          	jal	80001e28 <uart_puts>
    80000e58:	6a0030ef          	jal	800044f8 <alloc_trapframe>
    80000e5c:	00050413          	mv	s0,a0
    80000e60:	698030ef          	jal	800044f8 <alloc_trapframe>
    80000e64:	00050493          	mv	s1,a0
    80000e68:	690030ef          	jal	800044f8 <alloc_trapframe>
    80000e6c:	10040863          	beqz	s0,80000f7c <test_trapframe_allocation+0x150>
    80000e70:	10048663          	beqz	s1,80000f7c <test_trapframe_allocation+0x150>
    80000e74:	00050913          	mv	s2,a0
    80000e78:	10050263          	beqz	a0,80000f7c <test_trapframe_allocation+0x150>
    80000e7c:	00006517          	auipc	a0,0x6
    80000e80:	29c50513          	add	a0,a0,668 # 80007118 <rodata_start+0x1118>
    80000e84:	435000ef          	jal	80001ab8 <printf>
    80000e88:	00040593          	mv	a1,s0
    80000e8c:	00006517          	auipc	a0,0x6
    80000e90:	2ac50513          	add	a0,a0,684 # 80007138 <rodata_start+0x1138>
    80000e94:	425000ef          	jal	80001ab8 <printf>
    80000e98:	00048593          	mv	a1,s1
    80000e9c:	00006517          	auipc	a0,0x6
    80000ea0:	2ac50513          	add	a0,a0,684 # 80007148 <rodata_start+0x1148>
    80000ea4:	415000ef          	jal	80001ab8 <printf>
    80000ea8:	00090593          	mv	a1,s2
    80000eac:	00006517          	auipc	a0,0x6
    80000eb0:	2ac50513          	add	a0,a0,684 # 80007158 <rodata_start+0x1158>
    80000eb4:	405000ef          	jal	80001ab8 <printf>
    80000eb8:	00940463          	beq	s0,s1,80000ec0 <test_trapframe_allocation+0x94>
    80000ebc:	0f249663          	bne	s1,s2,80000fa8 <test_trapframe_allocation+0x17c>
    80000ec0:	00006517          	auipc	a0,0x6
    80000ec4:	2c850513          	add	a0,a0,712 # 80007188 <rodata_start+0x1188>
    80000ec8:	761000ef          	jal	80001e28 <uart_puts>
    80000ecc:	00006517          	auipc	a0,0x6
    80000ed0:	2ec50513          	add	a0,a0,748 # 800071b8 <rodata_start+0x11b8>
    80000ed4:	755000ef          	jal	80001e28 <uart_puts>
    80000ed8:	21d957b7          	lui	a5,0x21d95
    80000edc:	00279793          	sll	a5,a5,0x2
    80000ee0:	32178793          	add	a5,a5,801 # 21d95321 <_entry-0x5e26acdf>
    80000ee4:	12345737          	lui	a4,0x12345
    80000ee8:	67870713          	add	a4,a4,1656 # 12345678 <_entry-0x6dcba988>
    80000eec:	00f43823          	sd	a5,16(s0)
    80000ef0:	02a00793          	li	a5,42
    80000ef4:	00e43423          	sd	a4,8(s0)
    80000ef8:	04f43823          	sd	a5,80(s0)
    80000efc:	00006517          	auipc	a0,0x6
    80000f00:	2dc50513          	add	a0,a0,732 # 800071d8 <rodata_start+0x11d8>
    80000f04:	725000ef          	jal	80001e28 <uart_puts>
    80000f08:	00006517          	auipc	a0,0x6
    80000f0c:	2f050513          	add	a0,a0,752 # 800071f8 <rodata_start+0x11f8>
    80000f10:	719000ef          	jal	80001e28 <uart_puts>
    80000f14:	00040513          	mv	a0,s0
    80000f18:	640030ef          	jal	80004558 <free_trapframe>
    80000f1c:	00048513          	mv	a0,s1
    80000f20:	638030ef          	jal	80004558 <free_trapframe>
    80000f24:	00090513          	mv	a0,s2
    80000f28:	630030ef          	jal	80004558 <free_trapframe>
    80000f2c:	00006517          	auipc	a0,0x6
    80000f30:	2e450513          	add	a0,a0,740 # 80007210 <rodata_start+0x1210>
    80000f34:	6f5000ef          	jal	80001e28 <uart_puts>
    80000f38:	5c0030ef          	jal	800044f8 <alloc_trapframe>
    80000f3c:	00050413          	mv	s0,a0
    80000f40:	04050463          	beqz	a0,80000f88 <test_trapframe_allocation+0x15c>
    80000f44:	00050593          	mv	a1,a0
    80000f48:	00006517          	auipc	a0,0x6
    80000f4c:	2e850513          	add	a0,a0,744 # 80007230 <rodata_start+0x1230>
    80000f50:	369000ef          	jal	80001ab8 <printf>
    80000f54:	00040513          	mv	a0,s0
    80000f58:	600030ef          	jal	80004558 <free_trapframe>
    80000f5c:	01013403          	ld	s0,16(sp)
    80000f60:	01813083          	ld	ra,24(sp)
    80000f64:	00813483          	ld	s1,8(sp)
    80000f68:	00013903          	ld	s2,0(sp)
    80000f6c:	00006517          	auipc	a0,0x6
    80000f70:	31450513          	add	a0,a0,788 # 80007280 <rodata_start+0x1280>
    80000f74:	02010113          	add	sp,sp,32
    80000f78:	6b10006f          	j	80001e28 <uart_puts>
    80000f7c:	00006517          	auipc	a0,0x6
    80000f80:	2e450513          	add	a0,a0,740 # 80007260 <rodata_start+0x1260>
    80000f84:	6a5000ef          	jal	80001e28 <uart_puts>
    80000f88:	01013403          	ld	s0,16(sp)
    80000f8c:	01813083          	ld	ra,24(sp)
    80000f90:	00813483          	ld	s1,8(sp)
    80000f94:	00013903          	ld	s2,0(sp)
    80000f98:	00006517          	auipc	a0,0x6
    80000f9c:	2e850513          	add	a0,a0,744 # 80007280 <rodata_start+0x1280>
    80000fa0:	02010113          	add	sp,sp,32
    80000fa4:	6850006f          	j	80001e28 <uart_puts>
    80000fa8:	00006517          	auipc	a0,0x6
    80000fac:	1c050513          	add	a0,a0,448 # 80007168 <rodata_start+0x1168>
    80000fb0:	679000ef          	jal	80001e28 <uart_puts>
    80000fb4:	f19ff06f          	j	80000ecc <test_trapframe_allocation+0xa0>

0000000080000fb8 <test_csr_operations>:
    80000fb8:	ff010113          	add	sp,sp,-16
    80000fbc:	00006517          	auipc	a0,0x6
    80000fc0:	2dc50513          	add	a0,a0,732 # 80007298 <rodata_start+0x1298>
    80000fc4:	00113423          	sd	ra,8(sp)
    80000fc8:	00813023          	sd	s0,0(sp)
    80000fcc:	65d000ef          	jal	80001e28 <uart_puts>
    80000fd0:	10002473          	csrr	s0,sstatus
    80000fd4:	00006517          	auipc	a0,0x6
    80000fd8:	2fc50513          	add	a0,a0,764 # 800072d0 <rodata_start+0x12d0>
    80000fdc:	00040593          	mv	a1,s0
    80000fe0:	2d9000ef          	jal	80001ab8 <printf>
    80000fe4:	142025f3          	csrr	a1,scause
    80000fe8:	00006517          	auipc	a0,0x6
    80000fec:	30050513          	add	a0,a0,768 # 800072e8 <rodata_start+0x12e8>
    80000ff0:	2c9000ef          	jal	80001ab8 <printf>
    80000ff4:	141025f3          	csrr	a1,sepc
    80000ff8:	00006517          	auipc	a0,0x6
    80000ffc:	30850513          	add	a0,a0,776 # 80007300 <rodata_start+0x1300>
    80001000:	2b9000ef          	jal	80001ab8 <printf>
    80001004:	00006517          	auipc	a0,0x6
    80001008:	31450513          	add	a0,a0,788 # 80007318 <rodata_start+0x1318>
    8000100c:	61d000ef          	jal	80001e28 <uart_puts>
    80001010:	00000793          	li	a5,0
    80001014:	10079073          	csrw	sstatus,a5
    80001018:	100025f3          	csrr	a1,sstatus
    8000101c:	00006517          	auipc	a0,0x6
    80001020:	31450513          	add	a0,a0,788 # 80007330 <rodata_start+0x1330>
    80001024:	295000ef          	jal	80001ab8 <printf>
    80001028:	10041073          	csrw	sstatus,s0
    8000102c:	00006517          	auipc	a0,0x6
    80001030:	31c50513          	add	a0,a0,796 # 80007348 <rodata_start+0x1348>
    80001034:	5f5000ef          	jal	80001e28 <uart_puts>
    80001038:	00013403          	ld	s0,0(sp)
    8000103c:	00813083          	ld	ra,8(sp)
    80001040:	00006517          	auipc	a0,0x6
    80001044:	32050513          	add	a0,a0,800 # 80007360 <rodata_start+0x1360>
    80001048:	01010113          	add	sp,sp,16
    8000104c:	5dd0006f          	j	80001e28 <uart_puts>

0000000080001050 <test_exception_definitions>:
    80001050:	ff010113          	add	sp,sp,-16
    80001054:	00006517          	auipc	a0,0x6
    80001058:	32450513          	add	a0,a0,804 # 80007378 <rodata_start+0x1378>
    8000105c:	00113423          	sd	ra,8(sp)
    80001060:	5c9000ef          	jal	80001e28 <uart_puts>
    80001064:	00006517          	auipc	a0,0x6
    80001068:	35450513          	add	a0,a0,852 # 800073b8 <rodata_start+0x13b8>
    8000106c:	24d000ef          	jal	80001ab8 <printf>
    80001070:	00200593          	li	a1,2
    80001074:	00006517          	auipc	a0,0x6
    80001078:	35c50513          	add	a0,a0,860 # 800073d0 <rodata_start+0x13d0>
    8000107c:	23d000ef          	jal	80001ab8 <printf>
    80001080:	00d00593          	li	a1,13
    80001084:	00006517          	auipc	a0,0x6
    80001088:	36c50513          	add	a0,a0,876 # 800073f0 <rodata_start+0x13f0>
    8000108c:	22d000ef          	jal	80001ab8 <printf>
    80001090:	00f00593          	li	a1,15
    80001094:	00006517          	auipc	a0,0x6
    80001098:	37c50513          	add	a0,a0,892 # 80007410 <rodata_start+0x1410>
    8000109c:	21d000ef          	jal	80001ab8 <printf>
    800010a0:	00800593          	li	a1,8
    800010a4:	00006517          	auipc	a0,0x6
    800010a8:	38c50513          	add	a0,a0,908 # 80007430 <rodata_start+0x1430>
    800010ac:	20d000ef          	jal	80001ab8 <printf>
    800010b0:	00006517          	auipc	a0,0x6
    800010b4:	39850513          	add	a0,a0,920 # 80007448 <rodata_start+0x1448>
    800010b8:	201000ef          	jal	80001ab8 <printf>
    800010bc:	00500593          	li	a1,5
    800010c0:	00006517          	auipc	a0,0x6
    800010c4:	3a050513          	add	a0,a0,928 # 80007460 <rodata_start+0x1460>
    800010c8:	1f1000ef          	jal	80001ab8 <printf>
    800010cc:	00700593          	li	a1,7
    800010d0:	00006517          	auipc	a0,0x6
    800010d4:	3a850513          	add	a0,a0,936 # 80007478 <rodata_start+0x1478>
    800010d8:	1e1000ef          	jal	80001ab8 <printf>
    800010dc:	00900593          	li	a1,9
    800010e0:	00006517          	auipc	a0,0x6
    800010e4:	3b050513          	add	a0,a0,944 # 80007490 <rodata_start+0x1490>
    800010e8:	1d1000ef          	jal	80001ab8 <printf>
    800010ec:	00006517          	auipc	a0,0x6
    800010f0:	3bc50513          	add	a0,a0,956 # 800074a8 <rodata_start+0x14a8>
    800010f4:	535000ef          	jal	80001e28 <uart_puts>
    800010f8:	00813083          	ld	ra,8(sp)
    800010fc:	00006517          	auipc	a0,0x6
    80001100:	3d450513          	add	a0,a0,980 # 800074d0 <rodata_start+0x14d0>
    80001104:	01010113          	add	sp,sp,16
    80001108:	5210006f          	j	80001e28 <uart_puts>

000000008000110c <test_trapframe_structure>:
    8000110c:	ff010113          	add	sp,sp,-16
    80001110:	00006517          	auipc	a0,0x6
    80001114:	3d850513          	add	a0,a0,984 # 800074e8 <rodata_start+0x14e8>
    80001118:	00113423          	sd	ra,8(sp)
    8000111c:	50d000ef          	jal	80001e28 <uart_puts>
    80001120:	11000593          	li	a1,272
    80001124:	00006517          	auipc	a0,0x6
    80001128:	3fc50513          	add	a0,a0,1020 # 80007520 <rodata_start+0x1520>
    8000112c:	18d000ef          	jal	80001ab8 <printf>
    80001130:	00006517          	auipc	a0,0x6
    80001134:	41850513          	add	a0,a0,1048 # 80007548 <rodata_start+0x1548>
    80001138:	181000ef          	jal	80001ab8 <printf>
    8000113c:	00006517          	auipc	a0,0x6
    80001140:	43c50513          	add	a0,a0,1084 # 80007578 <rodata_start+0x1578>
    80001144:	175000ef          	jal	80001ab8 <printf>
    80001148:	00800593          	li	a1,8
    8000114c:	00006517          	auipc	a0,0x6
    80001150:	44450513          	add	a0,a0,1092 # 80007590 <rodata_start+0x1590>
    80001154:	165000ef          	jal	80001ab8 <printf>
    80001158:	00800593          	li	a1,8
    8000115c:	00006517          	auipc	a0,0x6
    80001160:	44c50513          	add	a0,a0,1100 # 800075a8 <rodata_start+0x15a8>
    80001164:	155000ef          	jal	80001ab8 <printf>
    80001168:	00800593          	li	a1,8
    8000116c:	00006517          	auipc	a0,0x6
    80001170:	45c50513          	add	a0,a0,1116 # 800075c8 <rodata_start+0x15c8>
    80001174:	145000ef          	jal	80001ab8 <printf>
    80001178:	02200693          	li	a3,34
    8000117c:	00800613          	li	a2,8
    80001180:	11000593          	li	a1,272
    80001184:	00006517          	auipc	a0,0x6
    80001188:	46450513          	add	a0,a0,1124 # 800075e8 <rodata_start+0x15e8>
    8000118c:	12d000ef          	jal	80001ab8 <printf>
    80001190:	00006517          	auipc	a0,0x6
    80001194:	48050513          	add	a0,a0,1152 # 80007610 <rodata_start+0x1610>
    80001198:	491000ef          	jal	80001e28 <uart_puts>
    8000119c:	00813083          	ld	ra,8(sp)
    800011a0:	00006517          	auipc	a0,0x6
    800011a4:	49850513          	add	a0,a0,1176 # 80007638 <rodata_start+0x1638>
    800011a8:	01010113          	add	sp,sp,16
    800011ac:	47d0006f          	j	80001e28 <uart_puts>

00000000800011b0 <test_interrupt_handlers>:
    800011b0:	ff010113          	add	sp,sp,-16
    800011b4:	00006517          	auipc	a0,0x6
    800011b8:	49c50513          	add	a0,a0,1180 # 80007650 <rodata_start+0x1650>
    800011bc:	00113423          	sd	ra,8(sp)
    800011c0:	469000ef          	jal	80001e28 <uart_puts>
    800011c4:	00006517          	auipc	a0,0x6
    800011c8:	4cc50513          	add	a0,a0,1228 # 80007690 <rodata_start+0x1690>
    800011cc:	45d000ef          	jal	80001e28 <uart_puts>
    800011d0:	00413797          	auipc	a5,0x413
    800011d4:	2d878793          	add	a5,a5,728 # 804144a8 <trap_handlers>
    800011d8:	00413697          	auipc	a3,0x413
    800011dc:	35068693          	add	a3,a3,848 # 80414528 <trapframe_pool>
    800011e0:	00000593          	li	a1,0
    800011e4:	0007b703          	ld	a4,0(a5)
    800011e8:	00878793          	add	a5,a5,8
    800011ec:	00070463          	beqz	a4,800011f4 <test_interrupt_handlers+0x44>
    800011f0:	0015859b          	addw	a1,a1,1
    800011f4:	fed798e3          	bne	a5,a3,800011e4 <test_interrupt_handlers+0x34>
    800011f8:	00006517          	auipc	a0,0x6
    800011fc:	4b850513          	add	a0,a0,1208 # 800076b0 <rodata_start+0x16b0>
    80001200:	0b9000ef          	jal	80001ab8 <printf>
    80001204:	00006517          	auipc	a0,0x6
    80001208:	4d450513          	add	a0,a0,1236 # 800076d8 <rodata_start+0x16d8>
    8000120c:	41d000ef          	jal	80001e28 <uart_puts>
    80001210:	00813083          	ld	ra,8(sp)
    80001214:	00006517          	auipc	a0,0x6
    80001218:	4f450513          	add	a0,a0,1268 # 80007708 <rodata_start+0x1708>
    8000121c:	01010113          	add	sp,sp,16
    80001220:	4090006f          	j	80001e28 <uart_puts>

0000000080001224 <test_timer_interrupt>:
    80001224:	fd010113          	add	sp,sp,-48
    80001228:	00006517          	auipc	a0,0x6
    8000122c:	4f850513          	add	a0,a0,1272 # 80007720 <rodata_start+0x1720>
    80001230:	02113423          	sd	ra,40(sp)
    80001234:	02813023          	sd	s0,32(sp)
    80001238:	00913c23          	sd	s1,24(sp)
    8000123c:	3ed000ef          	jal	80001e28 <uart_puts>
    80001240:	00006517          	auipc	a0,0x6
    80001244:	51850513          	add	a0,a0,1304 # 80007758 <rodata_start+0x1758>
    80001248:	3e1000ef          	jal	80001e28 <uart_puts>
    8000124c:	00006517          	auipc	a0,0x6
    80001250:	53c50513          	add	a0,a0,1340 # 80007788 <rodata_start+0x1788>
    80001254:	3d5000ef          	jal	80001e28 <uart_puts>
    80001258:	00425417          	auipc	s0,0x425
    8000125c:	ff840413          	add	s0,s0,-8 # 80426250 <ticks>
    80001260:	00006517          	auipc	a0,0x6
    80001264:	55850513          	add	a0,a0,1368 # 800077b8 <rodata_start+0x17b8>
    80001268:	3c1000ef          	jal	80001e28 <uart_puts>
    8000126c:	00043483          	ld	s1,0(s0)
    80001270:	00006517          	auipc	a0,0x6
    80001274:	57850513          	add	a0,a0,1400 # 800077e8 <rodata_start+0x17e8>
    80001278:	00048593          	mv	a1,s1
    8000127c:	03d000ef          	jal	80001ab8 <printf>
    80001280:	31c030ef          	jal	8000459c <intr_on>
    80001284:	00006517          	auipc	a0,0x6
    80001288:	57c50513          	add	a0,a0,1404 # 80007800 <rodata_start+0x1800>
    8000128c:	39d000ef          	jal	80001e28 <uart_puts>
    80001290:	00006517          	auipc	a0,0x6
    80001294:	58850513          	add	a0,a0,1416 # 80007818 <rodata_start+0x1818>
    80001298:	391000ef          	jal	80001e28 <uart_puts>
    8000129c:	00043783          	ld	a5,0(s0)
    800012a0:	00000593          	li	a1,0
    800012a4:	00f13423          	sd	a5,8(sp)
    800012a8:	00813783          	ld	a5,8(sp)
    800012ac:	00043703          	ld	a4,0(s0)
    800012b0:	02f71263          	bne	a4,a5,800012d4 <test_timer_interrupt+0xb0>
    800012b4:	05f5e6b7          	lui	a3,0x5f5e
    800012b8:	10068693          	add	a3,a3,256 # 5f5e100 <_entry-0x7a0a1f00>
    800012bc:	0080006f          	j	800012c4 <test_timer_interrupt+0xa0>
    800012c0:	00d58a63          	beq	a1,a3,800012d4 <test_timer_interrupt+0xb0>
    800012c4:	00813703          	ld	a4,8(sp)
    800012c8:	00043783          	ld	a5,0(s0)
    800012cc:	0015859b          	addw	a1,a1,1
    800012d0:	fef708e3          	beq	a4,a5,800012c0 <test_timer_interrupt+0x9c>
    800012d4:	00006517          	auipc	a0,0x6
    800012d8:	55c50513          	add	a0,a0,1372 # 80007830 <rodata_start+0x1830>
    800012dc:	7dc000ef          	jal	80001ab8 <printf>
    800012e0:	00043583          	ld	a1,0(s0)
    800012e4:	00006517          	auipc	a0,0x6
    800012e8:	56450513          	add	a0,a0,1380 # 80007848 <rodata_start+0x1848>
    800012ec:	7cc000ef          	jal	80001ab8 <printf>
    800012f0:	00043783          	ld	a5,0(s0)
    800012f4:	04f4f063          	bgeu	s1,a5,80001334 <test_timer_interrupt+0x110>
    800012f8:	00043583          	ld	a1,0(s0)
    800012fc:	00006517          	auipc	a0,0x6
    80001300:	56450513          	add	a0,a0,1380 # 80007860 <rodata_start+0x1860>
    80001304:	409585b3          	sub	a1,a1,s1
    80001308:	7b0000ef          	jal	80001ab8 <printf>
    8000130c:	00006517          	auipc	a0,0x6
    80001310:	58c50513          	add	a0,a0,1420 # 80007898 <rodata_start+0x1898>
    80001314:	315000ef          	jal	80001e28 <uart_puts>
    80001318:	02013403          	ld	s0,32(sp)
    8000131c:	02813083          	ld	ra,40(sp)
    80001320:	01813483          	ld	s1,24(sp)
    80001324:	00006517          	auipc	a0,0x6
    80001328:	5bc50513          	add	a0,a0,1468 # 800078e0 <rodata_start+0x18e0>
    8000132c:	03010113          	add	sp,sp,48
    80001330:	2f90006f          	j	80001e28 <uart_puts>
    80001334:	00006517          	auipc	a0,0x6
    80001338:	58c50513          	add	a0,a0,1420 # 800078c0 <rodata_start+0x18c0>
    8000133c:	2ed000ef          	jal	80001e28 <uart_puts>
    80001340:	02013403          	ld	s0,32(sp)
    80001344:	02813083          	ld	ra,40(sp)
    80001348:	01813483          	ld	s1,24(sp)
    8000134c:	00006517          	auipc	a0,0x6
    80001350:	59450513          	add	a0,a0,1428 # 800078e0 <rodata_start+0x18e0>
    80001354:	03010113          	add	sp,sp,48
    80001358:	2d10006f          	j	80001e28 <uart_puts>

000000008000135c <test_repeated_initialization>:
    8000135c:	fe010113          	add	sp,sp,-32
    80001360:	00006517          	auipc	a0,0x6
    80001364:	59850513          	add	a0,a0,1432 # 800078f8 <rodata_start+0x18f8>
    80001368:	00113c23          	sd	ra,24(sp)
    8000136c:	00813823          	sd	s0,16(sp)
    80001370:	00913423          	sd	s1,8(sp)
    80001374:	01213023          	sd	s2,0(sp)
    80001378:	2b1000ef          	jal	80001e28 <uart_puts>
    8000137c:	00006517          	auipc	a0,0x6
    80001380:	5bc50513          	add	a0,a0,1468 # 80007938 <rodata_start+0x1938>
    80001384:	2a5000ef          	jal	80001e28 <uart_puts>
    80001388:	00000413          	li	s0,0
    8000138c:	00006917          	auipc	s2,0x6
    80001390:	5c490913          	add	s2,s2,1476 # 80007950 <rodata_start+0x1950>
    80001394:	00500493          	li	s1,5
    80001398:	240030ef          	jal	800045d8 <trap_init>
    8000139c:	0014041b          	addw	s0,s0,1
    800013a0:	2e8030ef          	jal	80004688 <trap_init_hart>
    800013a4:	00040593          	mv	a1,s0
    800013a8:	00090513          	mv	a0,s2
    800013ac:	70c000ef          	jal	80001ab8 <printf>
    800013b0:	fe9414e3          	bne	s0,s1,80001398 <test_repeated_initialization+0x3c>
    800013b4:	00006517          	auipc	a0,0x6
    800013b8:	5bc50513          	add	a0,a0,1468 # 80007970 <rodata_start+0x1970>
    800013bc:	26d000ef          	jal	80001e28 <uart_puts>
    800013c0:	01013403          	ld	s0,16(sp)
    800013c4:	01813083          	ld	ra,24(sp)
    800013c8:	00813483          	ld	s1,8(sp)
    800013cc:	00013903          	ld	s2,0(sp)
    800013d0:	00006517          	auipc	a0,0x6
    800013d4:	5c850513          	add	a0,a0,1480 # 80007998 <rodata_start+0x1998>
    800013d8:	02010113          	add	sp,sp,32
    800013dc:	24d0006f          	j	80001e28 <uart_puts>

00000000800013e0 <run_all_system_tests>:
    800013e0:	ff010113          	add	sp,sp,-16
    800013e4:	00005517          	auipc	a0,0x5
    800013e8:	f4450513          	add	a0,a0,-188 # 80006328 <rodata_start+0x328>
    800013ec:	00113423          	sd	ra,8(sp)
    800013f0:	239000ef          	jal	80001e28 <uart_puts>
    800013f4:	00005517          	auipc	a0,0x5
    800013f8:	53c50513          	add	a0,a0,1340 # 80006930 <rodata_start+0x930>
    800013fc:	22d000ef          	jal	80001e28 <uart_puts>
    80001400:	00006517          	auipc	a0,0x6
    80001404:	5b050513          	add	a0,a0,1456 # 800079b0 <rodata_start+0x19b0>
    80001408:	221000ef          	jal	80001e28 <uart_puts>
    8000140c:	00005517          	auipc	a0,0x5
    80001410:	64c50513          	add	a0,a0,1612 # 80006a58 <rodata_start+0xa58>
    80001414:	215000ef          	jal	80001e28 <uart_puts>
    80001418:	8c5ff0ef          	jal	80000cdc <test_trap_initialization>
    8000141c:	93dff0ef          	jal	80000d58 <test_interrupt_control>
    80001420:	a0dff0ef          	jal	80000e2c <test_trapframe_allocation>
    80001424:	b95ff0ef          	jal	80000fb8 <test_csr_operations>
    80001428:	c29ff0ef          	jal	80001050 <test_exception_definitions>
    8000142c:	ce1ff0ef          	jal	8000110c <test_trapframe_structure>
    80001430:	d81ff0ef          	jal	800011b0 <test_interrupt_handlers>
    80001434:	df1ff0ef          	jal	80001224 <test_timer_interrupt>
    80001438:	f25ff0ef          	jal	8000135c <test_repeated_initialization>
    8000143c:	00005517          	auipc	a0,0x5
    80001440:	eec50513          	add	a0,a0,-276 # 80006328 <rodata_start+0x328>
    80001444:	1e5000ef          	jal	80001e28 <uart_puts>
    80001448:	00005517          	auipc	a0,0x5
    8000144c:	4e850513          	add	a0,a0,1256 # 80006930 <rodata_start+0x930>
    80001450:	1d9000ef          	jal	80001e28 <uart_puts>
    80001454:	00006517          	auipc	a0,0x6
    80001458:	5bc50513          	add	a0,a0,1468 # 80007a10 <rodata_start+0x1a10>
    8000145c:	1cd000ef          	jal	80001e28 <uart_puts>
    80001460:	00813083          	ld	ra,8(sp)
    80001464:	00005517          	auipc	a0,0x5
    80001468:	71450513          	add	a0,a0,1812 # 80006b78 <rodata_start+0xb78>
    8000146c:	01010113          	add	sp,sp,16
    80001470:	1b90006f          	j	80001e28 <uart_puts>

0000000080001474 <run_interrupt_exception_tests>:
    80001474:	f6dff06f          	j	800013e0 <run_all_system_tests>

0000000080001478 <main>:
    80001478:	ff010113          	add	sp,sp,-16
    8000147c:	00005517          	auipc	a0,0x5
    80001480:	4b450513          	add	a0,a0,1204 # 80006930 <rodata_start+0x930>
    80001484:	00113423          	sd	ra,8(sp)
    80001488:	1a1000ef          	jal	80001e28 <uart_puts>
    8000148c:	00006517          	auipc	a0,0x6
    80001490:	5dc50513          	add	a0,a0,1500 # 80007a68 <rodata_start+0x1a68>
    80001494:	195000ef          	jal	80001e28 <uart_puts>
    80001498:	00005517          	auipc	a0,0x5
    8000149c:	6e050513          	add	a0,a0,1760 # 80006b78 <rodata_start+0xb78>
    800014a0:	189000ef          	jal	80001e28 <uart_puts>
    800014a4:	00006517          	auipc	a0,0x6
    800014a8:	61c50513          	add	a0,a0,1564 # 80007ac0 <rodata_start+0x1ac0>
    800014ac:	17d000ef          	jal	80001e28 <uart_puts>
    800014b0:	01100593          	li	a1,17
    800014b4:	02001537          	lui	a0,0x2001
    800014b8:	01b59593          	sll	a1,a1,0x1b
    800014bc:	00651513          	sll	a0,a0,0x6
    800014c0:	195000ef          	jal	80001e54 <pmm_init>
    800014c4:	00006517          	auipc	a0,0x6
    800014c8:	63450513          	add	a0,a0,1588 # 80007af8 <rodata_start+0x1af8>
    800014cc:	15d000ef          	jal	80001e28 <uart_puts>
    800014d0:	00006517          	auipc	a0,0x6
    800014d4:	66050513          	add	a0,a0,1632 # 80007b30 <rodata_start+0x1b30>
    800014d8:	151000ef          	jal	80001e28 <uart_puts>
    800014dc:	0fc030ef          	jal	800045d8 <trap_init>
    800014e0:	1a8030ef          	jal	80004688 <trap_init_hart>
    800014e4:	00006517          	auipc	a0,0x6
    800014e8:	68450513          	add	a0,a0,1668 # 80007b68 <rodata_start+0x1b68>
    800014ec:	13d000ef          	jal	80001e28 <uart_puts>
    800014f0:	00006517          	auipc	a0,0x6
    800014f4:	6a850513          	add	a0,a0,1704 # 80007b98 <rodata_start+0x1b98>
    800014f8:	131000ef          	jal	80001e28 <uart_puts>
    800014fc:	200030ef          	jal	800046fc <timerinit>
    80001500:	00006517          	auipc	a0,0x6
    80001504:	6d050513          	add	a0,a0,1744 # 80007bd0 <rodata_start+0x1bd0>
    80001508:	121000ef          	jal	80001e28 <uart_puts>
    8000150c:	00006517          	auipc	a0,0x6
    80001510:	6f450513          	add	a0,a0,1780 # 80007c00 <rodata_start+0x1c00>
    80001514:	115000ef          	jal	80001e28 <uart_puts>
    80001518:	6e4030ef          	jal	80004bfc <proc_init>
    8000151c:	00006517          	auipc	a0,0x6
    80001520:	71c50513          	add	a0,a0,1820 # 80007c38 <rodata_start+0x1c38>
    80001524:	105000ef          	jal	80001e28 <uart_puts>
    80001528:	dc8ff0ef          	jal	80000af0 <run_process_management_tests>
    8000152c:	ec0ff0ef          	jal	80000bec <test_round_robin_scheduler>
    80001530:	00006517          	auipc	a0,0x6
    80001534:	73850513          	add	a0,a0,1848 # 80007c68 <rodata_start+0x1c68>
    80001538:	0f1000ef          	jal	80001e28 <uart_puts>
    8000153c:	0000006f          	j	8000153c <main+0xc4>

0000000080001540 <print_number>:
    80001540:	0c050663          	beqz	a0,8000160c <print_number+0xcc>
    80001544:	fd010113          	add	sp,sp,-48
    80001548:	02113423          	sd	ra,40(sp)
    8000154c:	02813023          	sd	s0,32(sp)
    80001550:	08061a63          	bnez	a2,800015e4 <print_number+0xa4>
    80001554:	0005071b          	sext.w	a4,a0
    80001558:	00000613          	li	a2,0
    8000155c:	0005859b          	sext.w	a1,a1
    80001560:	00010fa3          	sb	zero,31(sp)
    80001564:	01e10813          	add	a6,sp,30
    80001568:	01f00693          	li	a3,31
    8000156c:	00007317          	auipc	t1,0x7
    80001570:	a0c30313          	add	t1,t1,-1524 # 80007f78 <digits>
    80001574:	02b777bb          	remuw	a5,a4,a1
    80001578:	fff80813          	add	a6,a6,-1
    8000157c:	0007089b          	sext.w	a7,a4
    80001580:	00068e13          	mv	t3,a3
    80001584:	fff6869b          	addw	a3,a3,-1
    80001588:	02079793          	sll	a5,a5,0x20
    8000158c:	0207d793          	srl	a5,a5,0x20
    80001590:	00f307b3          	add	a5,t1,a5
    80001594:	0007c503          	lbu	a0,0(a5)
    80001598:	02b7573b          	divuw	a4,a4,a1
    8000159c:	00a800a3          	sb	a0,1(a6)
    800015a0:	fcb8fae3          	bgeu	a7,a1,80001574 <print_number+0x34>
    800015a4:	04060a63          	beqz	a2,800015f8 <print_number+0xb8>
    800015a8:	ffee069b          	addw	a3,t3,-2
    800015ac:	02068793          	add	a5,a3,32
    800015b0:	002787b3          	add	a5,a5,sp
    800015b4:	02d00713          	li	a4,45
    800015b8:	fee78023          	sb	a4,-32(a5)
    800015bc:	02d00513          	li	a0,45
    800015c0:	00d10433          	add	s0,sp,a3
    800015c4:	00140413          	add	s0,s0,1
    800015c8:	049000ef          	jal	80001e10 <uart_putc>
    800015cc:	00044503          	lbu	a0,0(s0)
    800015d0:	fe051ae3          	bnez	a0,800015c4 <print_number+0x84>
    800015d4:	02813083          	ld	ra,40(sp)
    800015d8:	02013403          	ld	s0,32(sp)
    800015dc:	03010113          	add	sp,sp,48
    800015e0:	00008067          	ret
    800015e4:	f60558e3          	bgez	a0,80001554 <print_number+0x14>
    800015e8:	80000737          	lui	a4,0x80000
    800015ec:	f6e508e3          	beq	a0,a4,8000155c <print_number+0x1c>
    800015f0:	40a0073b          	negw	a4,a0
    800015f4:	f69ff06f          	j	8000155c <print_number+0x1c>
    800015f8:	fc0514e3          	bnez	a0,800015c0 <print_number+0x80>
    800015fc:	02813083          	ld	ra,40(sp)
    80001600:	02013403          	ld	s0,32(sp)
    80001604:	03010113          	add	sp,sp,48
    80001608:	00008067          	ret
    8000160c:	03000513          	li	a0,48
    80001610:	0010006f          	j	80001e10 <uart_putc>

0000000080001614 <print_number_long.part.0>:
    80001614:	fd010113          	add	sp,sp,-48
    80001618:	02113423          	sd	ra,40(sp)
    8000161c:	02813023          	sd	s0,32(sp)
    80001620:	00050793          	mv	a5,a0
    80001624:	00060463          	beqz	a2,8000162c <print_number_long.part.0+0x18>
    80001628:	08054c63          	bltz	a0,800016c0 <print_number_long.part.0+0xac>
    8000162c:	00000613          	li	a2,0
    80001630:	00010fa3          	sb	zero,31(sp)
    80001634:	01e10813          	add	a6,sp,30
    80001638:	01f00693          	li	a3,31
    8000163c:	00007317          	auipc	t1,0x7
    80001640:	93c30313          	add	t1,t1,-1732 # 80007f78 <digits>
    80001644:	02b7f733          	remu	a4,a5,a1
    80001648:	fff80813          	add	a6,a6,-1
    8000164c:	00078893          	mv	a7,a5
    80001650:	00068e13          	mv	t3,a3
    80001654:	fff6869b          	addw	a3,a3,-1
    80001658:	00e30733          	add	a4,t1,a4
    8000165c:	00074503          	lbu	a0,0(a4) # ffffffff80000000 <bss_end+0xfffffffeffbd9d90>
    80001660:	02b7d7b3          	divu	a5,a5,a1
    80001664:	00a800a3          	sb	a0,1(a6)
    80001668:	fcb8fee3          	bgeu	a7,a1,80001644 <print_number_long.part.0+0x30>
    8000166c:	04060063          	beqz	a2,800016ac <print_number_long.part.0+0x98>
    80001670:	ffee069b          	addw	a3,t3,-2
    80001674:	02068793          	add	a5,a3,32
    80001678:	002787b3          	add	a5,a5,sp
    8000167c:	02d00713          	li	a4,45
    80001680:	fee78023          	sb	a4,-32(a5)
    80001684:	02d00513          	li	a0,45
    80001688:	00d10433          	add	s0,sp,a3
    8000168c:	00140413          	add	s0,s0,1
    80001690:	780000ef          	jal	80001e10 <uart_putc>
    80001694:	00044503          	lbu	a0,0(s0)
    80001698:	fe051ae3          	bnez	a0,8000168c <print_number_long.part.0+0x78>
    8000169c:	02813083          	ld	ra,40(sp)
    800016a0:	02013403          	ld	s0,32(sp)
    800016a4:	03010113          	add	sp,sp,48
    800016a8:	00008067          	ret
    800016ac:	fc051ee3          	bnez	a0,80001688 <print_number_long.part.0+0x74>
    800016b0:	02813083          	ld	ra,40(sp)
    800016b4:	02013403          	ld	s0,32(sp)
    800016b8:	03010113          	add	sp,sp,48
    800016bc:	00008067          	ret
    800016c0:	40a007b3          	neg	a5,a0
    800016c4:	f6dff06f          	j	80001630 <print_number_long.part.0+0x1c>

00000000800016c8 <clear_screen>:
    800016c8:	00006517          	auipc	a0,0x6
    800016cc:	5d850513          	add	a0,a0,1496 # 80007ca0 <rodata_start+0x1ca0>
    800016d0:	7580006f          	j	80001e28 <uart_puts>

00000000800016d4 <clear_line>:
    800016d4:	00006517          	auipc	a0,0x6
    800016d8:	5d450513          	add	a0,a0,1492 # 80007ca8 <rodata_start+0x1ca8>
    800016dc:	74c0006f          	j	80001e28 <uart_puts>

00000000800016e0 <goto_xy>:
    800016e0:	fd010113          	add	sp,sp,-48
    800016e4:	00913c23          	sd	s1,24(sp)
    800016e8:	00050493          	mv	s1,a0
    800016ec:	01b00513          	li	a0,27
    800016f0:	02113423          	sd	ra,40(sp)
    800016f4:	02813023          	sd	s0,32(sp)
    800016f8:	01213823          	sd	s2,16(sp)
    800016fc:	00058413          	mv	s0,a1
    80001700:	01313423          	sd	s3,8(sp)
    80001704:	70c000ef          	jal	80001e10 <uart_putc>
    80001708:	05b00513          	li	a0,91
    8000170c:	704000ef          	jal	80001e10 <uart_putc>
    80001710:	06300793          	li	a5,99
    80001714:	0c87cc63          	blt	a5,s0,800017ec <goto_xy+0x10c>
    80001718:	00900793          	li	a5,9
    8000171c:	0487ce63          	blt	a5,s0,80001778 <goto_xy+0x98>
    80001720:	12805a63          	blez	s0,80001854 <goto_xy+0x174>
    80001724:	0304041b          	addw	s0,s0,48
    80001728:	0ff47513          	zext.b	a0,s0
    8000172c:	6e4000ef          	jal	80001e10 <uart_putc>
    80001730:	03b00513          	li	a0,59
    80001734:	6dc000ef          	jal	80001e10 <uart_putc>
    80001738:	06300793          	li	a5,99
    8000173c:	0697c863          	blt	a5,s1,800017ac <goto_xy+0xcc>
    80001740:	00900793          	li	a5,9
    80001744:	0e97c463          	blt	a5,s1,8000182c <goto_xy+0x14c>
    80001748:	10905c63          	blez	s1,80001860 <goto_xy+0x180>
    8000174c:	0304851b          	addw	a0,s1,48
    80001750:	0ff57513          	zext.b	a0,a0
    80001754:	6bc000ef          	jal	80001e10 <uart_putc>
    80001758:	02013403          	ld	s0,32(sp)
    8000175c:	02813083          	ld	ra,40(sp)
    80001760:	01813483          	ld	s1,24(sp)
    80001764:	01013903          	ld	s2,16(sp)
    80001768:	00813983          	ld	s3,8(sp)
    8000176c:	04800513          	li	a0,72
    80001770:	03010113          	add	sp,sp,48
    80001774:	69c0006f          	j	80001e10 <uart_putc>
    80001778:	00a00913          	li	s2,10
    8000177c:	0324453b          	divw	a0,s0,s2
    80001780:	0305051b          	addw	a0,a0,48
    80001784:	0ff57513          	zext.b	a0,a0
    80001788:	688000ef          	jal	80001e10 <uart_putc>
    8000178c:	0324643b          	remw	s0,s0,s2
    80001790:	0304041b          	addw	s0,s0,48
    80001794:	0ff47513          	zext.b	a0,s0
    80001798:	678000ef          	jal	80001e10 <uart_putc>
    8000179c:	03b00513          	li	a0,59
    800017a0:	670000ef          	jal	80001e10 <uart_putc>
    800017a4:	06300793          	li	a5,99
    800017a8:	f897dce3          	bge	a5,s1,80001740 <goto_xy+0x60>
    800017ac:	06400413          	li	s0,100
    800017b0:	0284c53b          	divw	a0,s1,s0
    800017b4:	00a00913          	li	s2,10
    800017b8:	0305051b          	addw	a0,a0,48
    800017bc:	0ff57513          	zext.b	a0,a0
    800017c0:	650000ef          	jal	80001e10 <uart_putc>
    800017c4:	0284e53b          	remw	a0,s1,s0
    800017c8:	0325453b          	divw	a0,a0,s2
    800017cc:	0305051b          	addw	a0,a0,48
    800017d0:	0ff57513          	zext.b	a0,a0
    800017d4:	63c000ef          	jal	80001e10 <uart_putc>
    800017d8:	0324e53b          	remw	a0,s1,s2
    800017dc:	0305051b          	addw	a0,a0,48
    800017e0:	0ff57513          	zext.b	a0,a0
    800017e4:	62c000ef          	jal	80001e10 <uart_putc>
    800017e8:	f71ff06f          	j	80001758 <goto_xy+0x78>
    800017ec:	06400913          	li	s2,100
    800017f0:	0324453b          	divw	a0,s0,s2
    800017f4:	00a00993          	li	s3,10
    800017f8:	0305051b          	addw	a0,a0,48
    800017fc:	0ff57513          	zext.b	a0,a0
    80001800:	610000ef          	jal	80001e10 <uart_putc>
    80001804:	0324653b          	remw	a0,s0,s2
    80001808:	0335453b          	divw	a0,a0,s3
    8000180c:	0305051b          	addw	a0,a0,48
    80001810:	0ff57513          	zext.b	a0,a0
    80001814:	5fc000ef          	jal	80001e10 <uart_putc>
    80001818:	0334643b          	remw	s0,s0,s3
    8000181c:	0304041b          	addw	s0,s0,48
    80001820:	0ff47513          	zext.b	a0,s0
    80001824:	5ec000ef          	jal	80001e10 <uart_putc>
    80001828:	f09ff06f          	j	80001730 <goto_xy+0x50>
    8000182c:	00a00413          	li	s0,10
    80001830:	0284c53b          	divw	a0,s1,s0
    80001834:	0305051b          	addw	a0,a0,48
    80001838:	0ff57513          	zext.b	a0,a0
    8000183c:	5d4000ef          	jal	80001e10 <uart_putc>
    80001840:	0284e53b          	remw	a0,s1,s0
    80001844:	0305051b          	addw	a0,a0,48
    80001848:	0ff57513          	zext.b	a0,a0
    8000184c:	5c4000ef          	jal	80001e10 <uart_putc>
    80001850:	f09ff06f          	j	80001758 <goto_xy+0x78>
    80001854:	03100513          	li	a0,49
    80001858:	5b8000ef          	jal	80001e10 <uart_putc>
    8000185c:	ed5ff06f          	j	80001730 <goto_xy+0x50>
    80001860:	03100513          	li	a0,49
    80001864:	5ac000ef          	jal	80001e10 <uart_putc>
    80001868:	ef1ff06f          	j	80001758 <goto_xy+0x78>

000000008000186c <printf_color>:
    8000186c:	f8010113          	add	sp,sp,-128
    80001870:	02913c23          	sd	s1,56(sp)
    80001874:	00050493          	mv	s1,a0
    80001878:	01b00513          	li	a0,27
    8000187c:	06f13423          	sd	a5,104(sp)
    80001880:	04113423          	sd	ra,72(sp)
    80001884:	04813023          	sd	s0,64(sp)
    80001888:	04c13823          	sd	a2,80(sp)
    8000188c:	04d13c23          	sd	a3,88(sp)
    80001890:	06e13023          	sd	a4,96(sp)
    80001894:	07013823          	sd	a6,112(sp)
    80001898:	07113c23          	sd	a7,120(sp)
    8000189c:	00058413          	mv	s0,a1
    800018a0:	03213823          	sd	s2,48(sp)
    800018a4:	03313423          	sd	s3,40(sp)
    800018a8:	03413023          	sd	s4,32(sp)
    800018ac:	01513c23          	sd	s5,24(sp)
    800018b0:	560000ef          	jal	80001e10 <uart_putc>
    800018b4:	05b00513          	li	a0,91
    800018b8:	558000ef          	jal	80001e10 <uart_putc>
    800018bc:	06300793          	li	a5,99
    800018c0:	1a97e063          	bltu	a5,s1,80001a60 <printf_color+0x1f4>
    800018c4:	00900793          	li	a5,9
    800018c8:	1497e663          	bltu	a5,s1,80001a14 <printf_color+0x1a8>
    800018cc:	0304851b          	addw	a0,s1,48
    800018d0:	0ff57513          	zext.b	a0,a0
    800018d4:	53c000ef          	jal	80001e10 <uart_putc>
    800018d8:	06d00513          	li	a0,109
    800018dc:	534000ef          	jal	80001e10 <uart_putc>
    800018e0:	1c040863          	beqz	s0,80001ab0 <printf_color+0x244>
    800018e4:	00044503          	lbu	a0,0(s0)
    800018e8:	05010793          	add	a5,sp,80
    800018ec:	00f13423          	sd	a5,8(sp)
    800018f0:	00000a93          	li	s5,0
    800018f4:	06050463          	beqz	a0,8000195c <printf_color+0xf0>
    800018f8:	02500913          	li	s2,37
    800018fc:	02000a13          	li	s4,32
    80001900:	00006997          	auipc	s3,0x6
    80001904:	4e898993          	add	s3,s3,1256 # 80007de8 <rodata_start+0x1de8>
    80001908:	00140493          	add	s1,s0,1
    8000190c:	13251863          	bne	a0,s2,80001a3c <printf_color+0x1d0>
    80001910:	00144783          	lbu	a5,1(s0)
    80001914:	14078063          	beqz	a5,80001a54 <printf_color+0x1e8>
    80001918:	13278863          	beq	a5,s2,80001a48 <printf_color+0x1dc>
    8000191c:	fa87879b          	addw	a5,a5,-88
    80001920:	0ff7f793          	zext.b	a5,a5
    80001924:	00fa6c63          	bltu	s4,a5,8000193c <printf_color+0xd0>
    80001928:	00279793          	sll	a5,a5,0x2
    8000192c:	013787b3          	add	a5,a5,s3
    80001930:	0007a783          	lw	a5,0(a5)
    80001934:	013787b3          	add	a5,a5,s3
    80001938:	00078067          	jr	a5
    8000193c:	02500513          	li	a0,37
    80001940:	4d0000ef          	jal	80001e10 <uart_putc>
    80001944:	00144503          	lbu	a0,1(s0)
    80001948:	ffe00a93          	li	s5,-2
    8000194c:	4c4000ef          	jal	80001e10 <uart_putc>
    80001950:	0014c503          	lbu	a0,1(s1)
    80001954:	00148413          	add	s0,s1,1
    80001958:	fa0518e3          	bnez	a0,80001908 <printf_color+0x9c>
    8000195c:	00006517          	auipc	a0,0x6
    80001960:	35c50513          	add	a0,a0,860 # 80007cb8 <rodata_start+0x1cb8>
    80001964:	4c4000ef          	jal	80001e28 <uart_puts>
    80001968:	04813083          	ld	ra,72(sp)
    8000196c:	04013403          	ld	s0,64(sp)
    80001970:	03813483          	ld	s1,56(sp)
    80001974:	03013903          	ld	s2,48(sp)
    80001978:	02813983          	ld	s3,40(sp)
    8000197c:	02013a03          	ld	s4,32(sp)
    80001980:	000a8513          	mv	a0,s5
    80001984:	01813a83          	ld	s5,24(sp)
    80001988:	08010113          	add	sp,sp,128
    8000198c:	00008067          	ret
    80001990:	00813783          	ld	a5,8(sp)
    80001994:	00000613          	li	a2,0
    80001998:	01000593          	li	a1,16
    8000199c:	0007a503          	lw	a0,0(a5)
    800019a0:	00878793          	add	a5,a5,8
    800019a4:	00f13423          	sd	a5,8(sp)
    800019a8:	b99ff0ef          	jal	80001540 <print_number>
    800019ac:	fa5ff06f          	j	80001950 <printf_color+0xe4>
    800019b0:	00813783          	ld	a5,8(sp)
    800019b4:	0007c503          	lbu	a0,0(a5)
    800019b8:	00878793          	add	a5,a5,8
    800019bc:	00f13423          	sd	a5,8(sp)
    800019c0:	450000ef          	jal	80001e10 <uart_putc>
    800019c4:	f8dff06f          	j	80001950 <printf_color+0xe4>
    800019c8:	00813783          	ld	a5,8(sp)
    800019cc:	0007b403          	ld	s0,0(a5)
    800019d0:	00878793          	add	a5,a5,8
    800019d4:	00f13423          	sd	a5,8(sp)
    800019d8:	00041863          	bnez	s0,800019e8 <printf_color+0x17c>
    800019dc:	0c40006f          	j	80001aa0 <printf_color+0x234>
    800019e0:	00140413          	add	s0,s0,1
    800019e4:	42c000ef          	jal	80001e10 <uart_putc>
    800019e8:	00044503          	lbu	a0,0(s0)
    800019ec:	fe051ae3          	bnez	a0,800019e0 <printf_color+0x174>
    800019f0:	f61ff06f          	j	80001950 <printf_color+0xe4>
    800019f4:	00813783          	ld	a5,8(sp)
    800019f8:	00100613          	li	a2,1
    800019fc:	00a00593          	li	a1,10
    80001a00:	0007a503          	lw	a0,0(a5)
    80001a04:	00878793          	add	a5,a5,8
    80001a08:	00f13423          	sd	a5,8(sp)
    80001a0c:	b35ff0ef          	jal	80001540 <print_number>
    80001a10:	f41ff06f          	j	80001950 <printf_color+0xe4>
    80001a14:	00a00913          	li	s2,10
    80001a18:	0324d53b          	divuw	a0,s1,s2
    80001a1c:	0305051b          	addw	a0,a0,48
    80001a20:	0ff57513          	zext.b	a0,a0
    80001a24:	3ec000ef          	jal	80001e10 <uart_putc>
    80001a28:	0324f53b          	remuw	a0,s1,s2
    80001a2c:	0305051b          	addw	a0,a0,48
    80001a30:	07f57513          	and	a0,a0,127
    80001a34:	3dc000ef          	jal	80001e10 <uart_putc>
    80001a38:	ea1ff06f          	j	800018d8 <printf_color+0x6c>
    80001a3c:	3d4000ef          	jal	80001e10 <uart_putc>
    80001a40:	00040493          	mv	s1,s0
    80001a44:	f0dff06f          	j	80001950 <printf_color+0xe4>
    80001a48:	02500513          	li	a0,37
    80001a4c:	3c4000ef          	jal	80001e10 <uart_putc>
    80001a50:	f01ff06f          	j	80001950 <printf_color+0xe4>
    80001a54:	02500513          	li	a0,37
    80001a58:	3b8000ef          	jal	80001e10 <uart_putc>
    80001a5c:	f01ff06f          	j	8000195c <printf_color+0xf0>
    80001a60:	06400913          	li	s2,100
    80001a64:	0324d53b          	divuw	a0,s1,s2
    80001a68:	00a00993          	li	s3,10
    80001a6c:	0305051b          	addw	a0,a0,48
    80001a70:	0ff57513          	zext.b	a0,a0
    80001a74:	39c000ef          	jal	80001e10 <uart_putc>
    80001a78:	0324f53b          	remuw	a0,s1,s2
    80001a7c:	0335553b          	divuw	a0,a0,s3
    80001a80:	0305051b          	addw	a0,a0,48
    80001a84:	0ff57513          	zext.b	a0,a0
    80001a88:	388000ef          	jal	80001e10 <uart_putc>
    80001a8c:	0334f53b          	remuw	a0,s1,s3
    80001a90:	0305051b          	addw	a0,a0,48
    80001a94:	07f57513          	and	a0,a0,127
    80001a98:	378000ef          	jal	80001e10 <uart_putc>
    80001a9c:	e3dff06f          	j	800018d8 <printf_color+0x6c>
    80001aa0:	00006517          	auipc	a0,0x6
    80001aa4:	21050513          	add	a0,a0,528 # 80007cb0 <rodata_start+0x1cb0>
    80001aa8:	380000ef          	jal	80001e28 <uart_puts>
    80001aac:	ea5ff06f          	j	80001950 <printf_color+0xe4>
    80001ab0:	fff00a93          	li	s5,-1
    80001ab4:	eb5ff06f          	j	80001968 <printf_color+0xfc>

0000000080001ab8 <printf>:
    80001ab8:	f6010113          	add	sp,sp,-160
    80001abc:	04113c23          	sd	ra,88(sp)
    80001ac0:	04813823          	sd	s0,80(sp)
    80001ac4:	04913423          	sd	s1,72(sp)
    80001ac8:	05213023          	sd	s2,64(sp)
    80001acc:	03313c23          	sd	s3,56(sp)
    80001ad0:	03413823          	sd	s4,48(sp)
    80001ad4:	03513423          	sd	s5,40(sp)
    80001ad8:	03613023          	sd	s6,32(sp)
    80001adc:	01713c23          	sd	s7,24(sp)
    80001ae0:	06b13423          	sd	a1,104(sp)
    80001ae4:	06c13823          	sd	a2,112(sp)
    80001ae8:	06d13c23          	sd	a3,120(sp)
    80001aec:	08e13023          	sd	a4,128(sp)
    80001af0:	08f13423          	sd	a5,136(sp)
    80001af4:	09013823          	sd	a6,144(sp)
    80001af8:	09113c23          	sd	a7,152(sp)
    80001afc:	20050c63          	beqz	a0,80001d14 <printf+0x25c>
    80001b00:	00050413          	mv	s0,a0
    80001b04:	00054503          	lbu	a0,0(a0)
    80001b08:	06810793          	add	a5,sp,104
    80001b0c:	00f13423          	sd	a5,8(sp)
    80001b10:	00000b13          	li	s6,0
    80001b14:	06050c63          	beqz	a0,80001b8c <printf+0xd4>
    80001b18:	02500493          	li	s1,37
    80001b1c:	06c00993          	li	s3,108
    80001b20:	02000a13          	li	s4,32
    80001b24:	00006917          	auipc	s2,0x6
    80001b28:	34890913          	add	s2,s2,840 # 80007e6c <rodata_start+0x1e6c>
    80001b2c:	00006a97          	auipc	s5,0x6
    80001b30:	3c4a8a93          	add	s5,s5,964 # 80007ef0 <rodata_start+0x1ef0>
    80001b34:	04951463          	bne	a0,s1,80001b7c <printf+0xc4>
    80001b38:	00144783          	lbu	a5,1(s0)
    80001b3c:	18078e63          	beqz	a5,80001cd8 <printf+0x220>
    80001b40:	11378063          	beq	a5,s3,80001c40 <printf+0x188>
    80001b44:	00140413          	add	s0,s0,1
    80001b48:	16978863          	beq	a5,s1,80001cb8 <printf+0x200>
    80001b4c:	fa87879b          	addw	a5,a5,-88
    80001b50:	0ff7f793          	zext.b	a5,a5
    80001b54:	00fa6c63          	bltu	s4,a5,80001b6c <printf+0xb4>
    80001b58:	00279793          	sll	a5,a5,0x2
    80001b5c:	012787b3          	add	a5,a5,s2
    80001b60:	0007a783          	lw	a5,0(a5)
    80001b64:	012787b3          	add	a5,a5,s2
    80001b68:	00078067          	jr	a5
    80001b6c:	02500513          	li	a0,37
    80001b70:	2a0000ef          	jal	80001e10 <uart_putc>
    80001b74:	00044503          	lbu	a0,0(s0)
    80001b78:	ffe00b13          	li	s6,-2
    80001b7c:	294000ef          	jal	80001e10 <uart_putc>
    80001b80:	00144503          	lbu	a0,1(s0)
    80001b84:	00140413          	add	s0,s0,1
    80001b88:	fa0516e3          	bnez	a0,80001b34 <printf+0x7c>
    80001b8c:	05813083          	ld	ra,88(sp)
    80001b90:	05013403          	ld	s0,80(sp)
    80001b94:	04813483          	ld	s1,72(sp)
    80001b98:	04013903          	ld	s2,64(sp)
    80001b9c:	03813983          	ld	s3,56(sp)
    80001ba0:	03013a03          	ld	s4,48(sp)
    80001ba4:	02813a83          	ld	s5,40(sp)
    80001ba8:	01813b83          	ld	s7,24(sp)
    80001bac:	000b0513          	mv	a0,s6
    80001bb0:	02013b03          	ld	s6,32(sp)
    80001bb4:	0a010113          	add	sp,sp,160
    80001bb8:	00008067          	ret
    80001bbc:	00813783          	ld	a5,8(sp)
    80001bc0:	00000613          	li	a2,0
    80001bc4:	01000593          	li	a1,16
    80001bc8:	0007a503          	lw	a0,0(a5)
    80001bcc:	00878793          	add	a5,a5,8
    80001bd0:	00f13423          	sd	a5,8(sp)
    80001bd4:	96dff0ef          	jal	80001540 <print_number>
    80001bd8:	fa9ff06f          	j	80001b80 <printf+0xc8>
    80001bdc:	00813783          	ld	a5,8(sp)
    80001be0:	0007c503          	lbu	a0,0(a5)
    80001be4:	00878793          	add	a5,a5,8
    80001be8:	00f13423          	sd	a5,8(sp)
    80001bec:	224000ef          	jal	80001e10 <uart_putc>
    80001bf0:	f91ff06f          	j	80001b80 <printf+0xc8>
    80001bf4:	00813783          	ld	a5,8(sp)
    80001bf8:	0007bb83          	ld	s7,0(a5)
    80001bfc:	00878793          	add	a5,a5,8
    80001c00:	00f13423          	sd	a5,8(sp)
    80001c04:	000b9863          	bnez	s7,80001c14 <printf+0x15c>
    80001c08:	0e80006f          	j	80001cf0 <printf+0x238>
    80001c0c:	001b8b93          	add	s7,s7,1
    80001c10:	200000ef          	jal	80001e10 <uart_putc>
    80001c14:	000bc503          	lbu	a0,0(s7)
    80001c18:	fe051ae3          	bnez	a0,80001c0c <printf+0x154>
    80001c1c:	f65ff06f          	j	80001b80 <printf+0xc8>
    80001c20:	00813783          	ld	a5,8(sp)
    80001c24:	00100613          	li	a2,1
    80001c28:	00a00593          	li	a1,10
    80001c2c:	0007a503          	lw	a0,0(a5)
    80001c30:	00878793          	add	a5,a5,8
    80001c34:	00f13423          	sd	a5,8(sp)
    80001c38:	909ff0ef          	jal	80001540 <print_number>
    80001c3c:	f45ff06f          	j	80001b80 <printf+0xc8>
    80001c40:	00244783          	lbu	a5,2(s0)
    80001c44:	00240413          	add	s0,s0,2
    80001c48:	0a078c63          	beqz	a5,80001d00 <printf+0x248>
    80001c4c:	06978663          	beq	a5,s1,80001cb8 <printf+0x200>
    80001c50:	fa87879b          	addw	a5,a5,-88
    80001c54:	0ff7f793          	zext.b	a5,a5
    80001c58:	06fa6663          	bltu	s4,a5,80001cc4 <printf+0x20c>
    80001c5c:	00279793          	sll	a5,a5,0x2
    80001c60:	015787b3          	add	a5,a5,s5
    80001c64:	0007a783          	lw	a5,0(a5)
    80001c68:	015787b3          	add	a5,a5,s5
    80001c6c:	00078067          	jr	a5
    80001c70:	00813783          	ld	a5,8(sp)
    80001c74:	0007b503          	ld	a0,0(a5)
    80001c78:	00878793          	add	a5,a5,8
    80001c7c:	00f13423          	sd	a5,8(sp)
    80001c80:	06050263          	beqz	a0,80001ce4 <printf+0x22c>
    80001c84:	00000613          	li	a2,0
    80001c88:	01000593          	li	a1,16
    80001c8c:	989ff0ef          	jal	80001614 <print_number_long.part.0>
    80001c90:	ef1ff06f          	j	80001b80 <printf+0xc8>
    80001c94:	00813783          	ld	a5,8(sp)
    80001c98:	0007b503          	ld	a0,0(a5)
    80001c9c:	00878793          	add	a5,a5,8
    80001ca0:	00f13423          	sd	a5,8(sp)
    80001ca4:	04050063          	beqz	a0,80001ce4 <printf+0x22c>
    80001ca8:	00100613          	li	a2,1
    80001cac:	00a00593          	li	a1,10
    80001cb0:	965ff0ef          	jal	80001614 <print_number_long.part.0>
    80001cb4:	ecdff06f          	j	80001b80 <printf+0xc8>
    80001cb8:	02500513          	li	a0,37
    80001cbc:	154000ef          	jal	80001e10 <uart_putc>
    80001cc0:	ec1ff06f          	j	80001b80 <printf+0xc8>
    80001cc4:	02500513          	li	a0,37
    80001cc8:	148000ef          	jal	80001e10 <uart_putc>
    80001ccc:	06c00513          	li	a0,108
    80001cd0:	140000ef          	jal	80001e10 <uart_putc>
    80001cd4:	ea1ff06f          	j	80001b74 <printf+0xbc>
    80001cd8:	02500513          	li	a0,37
    80001cdc:	134000ef          	jal	80001e10 <uart_putc>
    80001ce0:	eadff06f          	j	80001b8c <printf+0xd4>
    80001ce4:	03000513          	li	a0,48
    80001ce8:	128000ef          	jal	80001e10 <uart_putc>
    80001cec:	e95ff06f          	j	80001b80 <printf+0xc8>
    80001cf0:	00006517          	auipc	a0,0x6
    80001cf4:	fc050513          	add	a0,a0,-64 # 80007cb0 <rodata_start+0x1cb0>
    80001cf8:	130000ef          	jal	80001e28 <uart_puts>
    80001cfc:	e85ff06f          	j	80001b80 <printf+0xc8>
    80001d00:	02500513          	li	a0,37
    80001d04:	10c000ef          	jal	80001e10 <uart_putc>
    80001d08:	06c00513          	li	a0,108
    80001d0c:	104000ef          	jal	80001e10 <uart_putc>
    80001d10:	e7dff06f          	j	80001b8c <printf+0xd4>
    80001d14:	fff00b13          	li	s6,-1
    80001d18:	e75ff06f          	j	80001b8c <printf+0xd4>

0000000080001d1c <test_printf_basic>:
    80001d1c:	ff010113          	add	sp,sp,-16
    80001d20:	02a00593          	li	a1,42
    80001d24:	00006517          	auipc	a0,0x6
    80001d28:	f9c50513          	add	a0,a0,-100 # 80007cc0 <rodata_start+0x1cc0>
    80001d2c:	00113423          	sd	ra,8(sp)
    80001d30:	d89ff0ef          	jal	80001ab8 <printf>
    80001d34:	f8500593          	li	a1,-123
    80001d38:	00006517          	auipc	a0,0x6
    80001d3c:	fa050513          	add	a0,a0,-96 # 80007cd8 <rodata_start+0x1cd8>
    80001d40:	d79ff0ef          	jal	80001ab8 <printf>
    80001d44:	00000593          	li	a1,0
    80001d48:	00006517          	auipc	a0,0x6
    80001d4c:	fa850513          	add	a0,a0,-88 # 80007cf0 <rodata_start+0x1cf0>
    80001d50:	d69ff0ef          	jal	80001ab8 <printf>
    80001d54:	000015b7          	lui	a1,0x1
    80001d58:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80001d5c:	00006517          	auipc	a0,0x6
    80001d60:	fac50513          	add	a0,a0,-84 # 80007d08 <rodata_start+0x1d08>
    80001d64:	d55ff0ef          	jal	80001ab8 <printf>
    80001d68:	00006597          	auipc	a1,0x6
    80001d6c:	fb858593          	add	a1,a1,-72 # 80007d20 <rodata_start+0x1d20>
    80001d70:	00006517          	auipc	a0,0x6
    80001d74:	fb850513          	add	a0,a0,-72 # 80007d28 <rodata_start+0x1d28>
    80001d78:	d41ff0ef          	jal	80001ab8 <printf>
    80001d7c:	05800593          	li	a1,88
    80001d80:	00006517          	auipc	a0,0x6
    80001d84:	fc050513          	add	a0,a0,-64 # 80007d40 <rodata_start+0x1d40>
    80001d88:	d31ff0ef          	jal	80001ab8 <printf>
    80001d8c:	00813083          	ld	ra,8(sp)
    80001d90:	00006517          	auipc	a0,0x6
    80001d94:	fc850513          	add	a0,a0,-56 # 80007d58 <rodata_start+0x1d58>
    80001d98:	01010113          	add	sp,sp,16
    80001d9c:	d1dff06f          	j	80001ab8 <printf>

0000000080001da0 <test_printf_edge_cases>:
    80001da0:	800005b7          	lui	a1,0x80000
    80001da4:	ff010113          	add	sp,sp,-16
    80001da8:	fff5c593          	not	a1,a1
    80001dac:	00006517          	auipc	a0,0x6
    80001db0:	fc450513          	add	a0,a0,-60 # 80007d70 <rodata_start+0x1d70>
    80001db4:	00113423          	sd	ra,8(sp)
    80001db8:	d01ff0ef          	jal	80001ab8 <printf>
    80001dbc:	800005b7          	lui	a1,0x80000
    80001dc0:	00006517          	auipc	a0,0x6
    80001dc4:	fc050513          	add	a0,a0,-64 # 80007d80 <rodata_start+0x1d80>
    80001dc8:	cf1ff0ef          	jal	80001ab8 <printf>
    80001dcc:	00000593          	li	a1,0
    80001dd0:	00006517          	auipc	a0,0x6
    80001dd4:	fc050513          	add	a0,a0,-64 # 80007d90 <rodata_start+0x1d90>
    80001dd8:	ce1ff0ef          	jal	80001ab8 <printf>
    80001ddc:	00005597          	auipc	a1,0x5
    80001de0:	e6458593          	add	a1,a1,-412 # 80006c40 <rodata_start+0xc40>
    80001de4:	00006517          	auipc	a0,0x6
    80001de8:	fc450513          	add	a0,a0,-60 # 80007da8 <rodata_start+0x1da8>
    80001dec:	ccdff0ef          	jal	80001ab8 <printf>
    80001df0:	00006517          	auipc	a0,0x6
    80001df4:	fd050513          	add	a0,a0,-48 # 80007dc0 <rodata_start+0x1dc0>
    80001df8:	cc1ff0ef          	jal	80001ab8 <printf>
    80001dfc:	00813083          	ld	ra,8(sp)
    80001e00:	00006517          	auipc	a0,0x6
    80001e04:	fd050513          	add	a0,a0,-48 # 80007dd0 <rodata_start+0x1dd0>
    80001e08:	01010113          	add	sp,sp,16
    80001e0c:	cadff06f          	j	80001ab8 <printf>

0000000080001e10 <uart_putc>:
    80001e10:	10000737          	lui	a4,0x10000
    80001e14:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80001e18:	0207f793          	and	a5,a5,32
    80001e1c:	fe078ce3          	beqz	a5,80001e14 <uart_putc+0x4>
    80001e20:	00a70023          	sb	a0,0(a4)
    80001e24:	00008067          	ret

0000000080001e28 <uart_puts>:
    80001e28:	00054683          	lbu	a3,0(a0)
    80001e2c:	02068263          	beqz	a3,80001e50 <uart_puts+0x28>
    80001e30:	10000737          	lui	a4,0x10000
    80001e34:	00150513          	add	a0,a0,1
    80001e38:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80001e3c:	0207f793          	and	a5,a5,32
    80001e40:	fe078ce3          	beqz	a5,80001e38 <uart_puts+0x10>
    80001e44:	00d70023          	sb	a3,0(a4)
    80001e48:	00054683          	lbu	a3,0(a0)
    80001e4c:	fe0694e3          	bnez	a3,80001e34 <uart_puts+0xc>
    80001e50:	00008067          	ret

0000000080001e54 <pmm_init>:
    80001e54:	000017b7          	lui	a5,0x1
    80001e58:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001e5c:	00f50533          	add	a0,a0,a5
    80001e60:	fffff737          	lui	a4,0xfffff
    80001e64:	00e57533          	and	a0,a0,a4
    80001e68:	00e5f5b3          	and	a1,a1,a4
    80001e6c:	00424797          	auipc	a5,0x424
    80001e70:	3ca7b223          	sd	a0,964(a5) # 80426230 <mem_start>
    80001e74:	00424797          	auipc	a5,0x424
    80001e78:	3ab7ba23          	sd	a1,948(a5) # 80426228 <mem_end>
    80001e7c:	00424797          	auipc	a5,0x424
    80001e80:	3a07be23          	sd	zero,956(a5) # 80426238 <freelist>
    80001e84:	02b57e63          	bgeu	a0,a1,80001ec0 <pmm_init+0x6c>
    80001e88:	02050e63          	beqz	a0,80001ec4 <pmm_init+0x70>
    80001e8c:	00050793          	mv	a5,a0
    80001e90:	00000613          	li	a2,0
    80001e94:	00000693          	li	a3,0
    80001e98:	00a7e863          	bltu	a5,a0,80001ea8 <pmm_init+0x54>
    80001e9c:	00d7b023          	sd	a3,0(a5)
    80001ea0:	00100613          	li	a2,1
    80001ea4:	00078693          	mv	a3,a5
    80001ea8:	00001737          	lui	a4,0x1
    80001eac:	00e787b3          	add	a5,a5,a4
    80001eb0:	feb7e4e3          	bltu	a5,a1,80001e98 <pmm_init+0x44>
    80001eb4:	00060663          	beqz	a2,80001ec0 <pmm_init+0x6c>
    80001eb8:	00424797          	auipc	a5,0x424
    80001ebc:	38d7b023          	sd	a3,896(a5) # 80426238 <freelist>
    80001ec0:	00008067          	ret
    80001ec4:	00000793          	li	a5,0
    80001ec8:	00000613          	li	a2,0
    80001ecc:	00000693          	li	a3,0
    80001ed0:	fd9ff06f          	j	80001ea8 <pmm_init+0x54>

0000000080001ed4 <alloc_page>:
    80001ed4:	00424797          	auipc	a5,0x424
    80001ed8:	36478793          	add	a5,a5,868 # 80426238 <freelist>
    80001edc:	0007b503          	ld	a0,0(a5)
    80001ee0:	00050663          	beqz	a0,80001eec <alloc_page+0x18>
    80001ee4:	00053703          	ld	a4,0(a0)
    80001ee8:	00e7b023          	sd	a4,0(a5)
    80001eec:	00008067          	ret

0000000080001ef0 <free_page>:
    80001ef0:	02050c63          	beqz	a0,80001f28 <free_page+0x38>
    80001ef4:	00424797          	auipc	a5,0x424
    80001ef8:	33c7b783          	ld	a5,828(a5) # 80426230 <mem_start>
    80001efc:	02f56663          	bltu	a0,a5,80001f28 <free_page+0x38>
    80001f00:	00424797          	auipc	a5,0x424
    80001f04:	3287b783          	ld	a5,808(a5) # 80426228 <mem_end>
    80001f08:	02f57063          	bgeu	a0,a5,80001f28 <free_page+0x38>
    80001f0c:	03451793          	sll	a5,a0,0x34
    80001f10:	00079c63          	bnez	a5,80001f28 <free_page+0x38>
    80001f14:	00424797          	auipc	a5,0x424
    80001f18:	32478793          	add	a5,a5,804 # 80426238 <freelist>
    80001f1c:	0007b703          	ld	a4,0(a5)
    80001f20:	00a7b023          	sd	a0,0(a5)
    80001f24:	00e53023          	sd	a4,0(a0)
    80001f28:	00008067          	ret

0000000080001f2c <alloc_pages>:
    80001f2c:	00050613          	mv	a2,a0
    80001f30:	08a05863          	blez	a0,80001fc0 <alloc_pages+0x94>
    80001f34:	00424317          	auipc	t1,0x424
    80001f38:	30430313          	add	t1,t1,772 # 80426238 <freelist>
    80001f3c:	00100793          	li	a5,1
    80001f40:	00033803          	ld	a6,0(t1)
    80001f44:	06f50463          	beq	a0,a5,80001fac <alloc_pages+0x80>
    80001f48:	06080c63          	beqz	a6,80001fc0 <alloc_pages+0x94>
    80001f4c:	00083503          	ld	a0,0(a6)
    80001f50:	00080793          	mv	a5,a6
    80001f54:	00100713          	li	a4,1
    80001f58:	00000893          	li	a7,0
    80001f5c:	000015b7          	lui	a1,0x1
    80001f60:	0200006f          	j	80001f80 <alloc_pages+0x54>
    80001f64:	02d50463          	beq	a0,a3,80001f8c <alloc_pages+0x60>
    80001f68:	00053683          	ld	a3,0(a0)
    80001f6c:	00078893          	mv	a7,a5
    80001f70:	00050813          	mv	a6,a0
    80001f74:	00100713          	li	a4,1
    80001f78:	00050793          	mv	a5,a0
    80001f7c:	00068513          	mv	a0,a3
    80001f80:	00b786b3          	add	a3,a5,a1
    80001f84:	fe0510e3          	bnez	a0,80001f64 <alloc_pages+0x38>
    80001f88:	00008067          	ret
    80001f8c:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80001f90:	00053683          	ld	a3,0(a0)
    80001f94:	fee612e3          	bne	a2,a4,80001f78 <alloc_pages+0x4c>
    80001f98:	02088863          	beqz	a7,80001fc8 <alloc_pages+0x9c>
    80001f9c:	00d8b023          	sd	a3,0(a7)
    80001fa0:	00053023          	sd	zero,0(a0)
    80001fa4:	00080513          	mv	a0,a6
    80001fa8:	00008067          	ret
    80001fac:	00080663          	beqz	a6,80001fb8 <alloc_pages+0x8c>
    80001fb0:	00083783          	ld	a5,0(a6)
    80001fb4:	00f33023          	sd	a5,0(t1)
    80001fb8:	00080513          	mv	a0,a6
    80001fbc:	00008067          	ret
    80001fc0:	00000513          	li	a0,0
    80001fc4:	00008067          	ret
    80001fc8:	00053023          	sd	zero,0(a0)
    80001fcc:	00d33023          	sd	a3,0(t1)
    80001fd0:	00080513          	mv	a0,a6
    80001fd4:	00008067          	ret

0000000080001fd8 <walk_lookup>:
    80001fd8:	01e5d793          	srl	a5,a1,0x1e
    80001fdc:	1ff7f793          	and	a5,a5,511
    80001fe0:	00379793          	sll	a5,a5,0x3
    80001fe4:	00f50533          	add	a0,a0,a5
    80001fe8:	00053703          	ld	a4,0(a0)
    80001fec:	00177793          	and	a5,a4,1
    80001ff0:	04078a63          	beqz	a5,80002044 <walk_lookup+0x6c>
    80001ff4:	00e77793          	and	a5,a4,14
    80001ff8:	04079663          	bnez	a5,80002044 <walk_lookup+0x6c>
    80001ffc:	0155d793          	srl	a5,a1,0x15
    80002000:	00a75713          	srl	a4,a4,0xa
    80002004:	1ff7f793          	and	a5,a5,511
    80002008:	00c71713          	sll	a4,a4,0xc
    8000200c:	00379793          	sll	a5,a5,0x3
    80002010:	00e787b3          	add	a5,a5,a4
    80002014:	0007b503          	ld	a0,0(a5)
    80002018:	00157793          	and	a5,a0,1
    8000201c:	02078463          	beqz	a5,80002044 <walk_lookup+0x6c>
    80002020:	00e57793          	and	a5,a0,14
    80002024:	02079063          	bnez	a5,80002044 <walk_lookup+0x6c>
    80002028:	00c5d593          	srl	a1,a1,0xc
    8000202c:	00a55513          	srl	a0,a0,0xa
    80002030:	1ff5f593          	and	a1,a1,511
    80002034:	00359593          	sll	a1,a1,0x3
    80002038:	00c51513          	sll	a0,a0,0xc
    8000203c:	00b50533          	add	a0,a0,a1
    80002040:	00008067          	ret
    80002044:	00000513          	li	a0,0
    80002048:	00008067          	ret

000000008000204c <free_swap_slot.part.0>:
    8000204c:	0055579b          	srlw	a5,a0,0x5
    80002050:	0000f617          	auipc	a2,0xf
    80002054:	fb060613          	add	a2,a2,-80 # 80011000 <swap_mgr>
    80002058:	00279793          	sll	a5,a5,0x2
    8000205c:	00f607b3          	add	a5,a2,a5
    80002060:	0007a583          	lw	a1,0(a5)
    80002064:	00100713          	li	a4,1
    80002068:	00a7173b          	sllw	a4,a4,a0
    8000206c:	00e5f6b3          	and	a3,a1,a4
    80002070:	0006869b          	sext.w	a3,a3
    80002074:	02068463          	beqz	a3,8000209c <free_swap_slot.part.0+0x50>
    80002078:	08862683          	lw	a3,136(a2)
    8000207c:	fff74713          	not	a4,a4
    80002080:	08062803          	lw	a6,128(a2)
    80002084:	00e5f5b3          	and	a1,a1,a4
    80002088:	fff6871b          	addw	a4,a3,-1
    8000208c:	00b7a023          	sw	a1,0(a5)
    80002090:	08e62423          	sw	a4,136(a2)
    80002094:	01057463          	bgeu	a0,a6,8000209c <free_swap_slot.part.0+0x50>
    80002098:	08a62023          	sw	a0,128(a2)
    8000209c:	00008067          	ret

00000000800020a0 <uvmunmap.part.0>:
    800020a0:	fc010113          	add	sp,sp,-64
    800020a4:	03213023          	sd	s2,32(sp)
    800020a8:	00c61913          	sll	s2,a2,0xc
    800020ac:	02113c23          	sd	ra,56(sp)
    800020b0:	02813823          	sd	s0,48(sp)
    800020b4:	02913423          	sd	s1,40(sp)
    800020b8:	01313c23          	sd	s3,24(sp)
    800020bc:	01413823          	sd	s4,16(sp)
    800020c0:	01513423          	sd	s5,8(sp)
    800020c4:	00b90933          	add	s2,s2,a1
    800020c8:	0525f863          	bgeu	a1,s2,80002118 <uvmunmap.part.0+0x78>
    800020cc:	00058493          	mv	s1,a1
    800020d0:	00050993          	mv	s3,a0
    800020d4:	00068a93          	mv	s5,a3
    800020d8:	00001a37          	lui	s4,0x1
    800020dc:	00048593          	mv	a1,s1
    800020e0:	00098513          	mv	a0,s3
    800020e4:	ef5ff0ef          	jal	80001fd8 <walk_lookup>
    800020e8:	00050413          	mv	s0,a0
    800020ec:	014484b3          	add	s1,s1,s4
    800020f0:	02050263          	beqz	a0,80002114 <uvmunmap.part.0+0x74>
    800020f4:	00053783          	ld	a5,0(a0)
    800020f8:	00a7d713          	srl	a4,a5,0xa
    800020fc:	0017f793          	and	a5,a5,1
    80002100:	00c71513          	sll	a0,a4,0xc
    80002104:	00078863          	beqz	a5,80002114 <uvmunmap.part.0+0x74>
    80002108:	00050663          	beqz	a0,80002114 <uvmunmap.part.0+0x74>
    8000210c:	020a9863          	bnez	s5,8000213c <uvmunmap.part.0+0x9c>
    80002110:	00043023          	sd	zero,0(s0)
    80002114:	fd24e4e3          	bltu	s1,s2,800020dc <uvmunmap.part.0+0x3c>
    80002118:	03813083          	ld	ra,56(sp)
    8000211c:	03013403          	ld	s0,48(sp)
    80002120:	02813483          	ld	s1,40(sp)
    80002124:	02013903          	ld	s2,32(sp)
    80002128:	01813983          	ld	s3,24(sp)
    8000212c:	01013a03          	ld	s4,16(sp)
    80002130:	00813a83          	ld	s5,8(sp)
    80002134:	04010113          	add	sp,sp,64
    80002138:	00008067          	ret
    8000213c:	db5ff0ef          	jal	80001ef0 <free_page>
    80002140:	00043023          	sd	zero,0(s0)
    80002144:	fd1ff06f          	j	80002114 <uvmunmap.part.0+0x74>

0000000080002148 <create_pagetable>:
    80002148:	ff010113          	add	sp,sp,-16
    8000214c:	00113423          	sd	ra,8(sp)
    80002150:	d85ff0ef          	jal	80001ed4 <alloc_page>
    80002154:	00050e63          	beqz	a0,80002170 <create_pagetable+0x28>
    80002158:	00001737          	lui	a4,0x1
    8000215c:	00050793          	mv	a5,a0
    80002160:	00e50733          	add	a4,a0,a4
    80002164:	0007b023          	sd	zero,0(a5)
    80002168:	00878793          	add	a5,a5,8
    8000216c:	fee79ce3          	bne	a5,a4,80002164 <create_pagetable+0x1c>
    80002170:	00813083          	ld	ra,8(sp)
    80002174:	01010113          	add	sp,sp,16
    80002178:	00008067          	ret

000000008000217c <map_page>:
    8000217c:	00c5e7b3          	or	a5,a1,a2
    80002180:	03479713          	sll	a4,a5,0x34
    80002184:	20071863          	bnez	a4,80002394 <map_page+0x218>
    80002188:	fc010113          	add	sp,sp,-64
    8000218c:	02913423          	sd	s1,40(sp)
    80002190:	03213023          	sd	s2,32(sp)
    80002194:	01313c23          	sd	s3,24(sp)
    80002198:	01413823          	sd	s4,16(sp)
    8000219c:	01513423          	sd	s5,8(sp)
    800021a0:	01613023          	sd	s6,0(sp)
    800021a4:	02113c23          	sd	ra,56(sp)
    800021a8:	02813823          	sd	s0,48(sp)
    800021ac:	00058493          	mv	s1,a1
    800021b0:	00060913          	mv	s2,a2
    800021b4:	00050a13          	mv	s4,a0
    800021b8:	00068993          	mv	s3,a3
    800021bc:	00050813          	mv	a6,a0
    800021c0:	00200a93          	li	s5,2
    800021c4:	00200793          	li	a5,2
    800021c8:	00100b13          	li	s6,1
    800021cc:	0037941b          	sllw	s0,a5,0x3
    800021d0:	00f4043b          	addw	s0,s0,a5
    800021d4:	00c4041b          	addw	s0,s0,12
    800021d8:	0084d433          	srl	s0,s1,s0
    800021dc:	1ff47413          	and	s0,s0,511
    800021e0:	00341413          	sll	s0,s0,0x3
    800021e4:	00880433          	add	s0,a6,s0
    800021e8:	00043783          	ld	a5,0(s0)
    800021ec:	0017f713          	and	a4,a5,1
    800021f0:	14070e63          	beqz	a4,8000234c <map_page+0x1d0>
    800021f4:	00e7f713          	and	a4,a5,14
    800021f8:	18071a63          	bnez	a4,8000238c <map_page+0x210>
    800021fc:	00a7d793          	srl	a5,a5,0xa
    80002200:	00c79813          	sll	a6,a5,0xc
    80002204:	00100793          	li	a5,1
    80002208:	016a8663          	beq	s5,s6,80002214 <map_page+0x98>
    8000220c:	00100a93          	li	s5,1
    80002210:	fbdff06f          	j	800021cc <map_page+0x50>
    80002214:	00c4d793          	srl	a5,s1,0xc
    80002218:	1ff7f793          	and	a5,a5,511
    8000221c:	00379793          	sll	a5,a5,0x3
    80002220:	00f80833          	add	a6,a6,a5
    80002224:	16080463          	beqz	a6,8000238c <map_page+0x210>
    80002228:	00083783          	ld	a5,0(a6)
    8000222c:	0017f793          	and	a5,a5,1
    80002230:	14079e63          	bnez	a5,8000238c <map_page+0x210>
    80002234:	00c95793          	srl	a5,s2,0xc
    80002238:	00a79793          	sll	a5,a5,0xa
    8000223c:	00412597          	auipc	a1,0x412
    80002240:	e5458593          	add	a1,a1,-428 # 80414090 <lru_mgr+0x3000>
    80002244:	0145a703          	lw	a4,20(a1)
    80002248:	0137e7b3          	or	a5,a5,s3
    8000224c:	0017e793          	or	a5,a5,1
    80002250:	00f83023          	sd	a5,0(a6)
    80002254:	0c070663          	beqz	a4,80002320 <map_page+0x1a4>
    80002258:	0040f717          	auipc	a4,0x40f
    8000225c:	e5c70713          	add	a4,a4,-420 # 804110b4 <lru_mgr+0x24>
    80002260:	00000793          	li	a5,0
    80002264:	10000693          	li	a3,256
    80002268:	00c0006f          	j	80002274 <map_page+0xf8>
    8000226c:	0017879b          	addw	a5,a5,1
    80002270:	0ad78863          	beq	a5,a3,80002320 <map_page+0x1a4>
    80002274:	00072803          	lw	a6,0(a4)
    80002278:	03070713          	add	a4,a4,48
    8000227c:	fe0818e3          	bnez	a6,8000226c <map_page+0xf0>
    80002280:	00178813          	add	a6,a5,1
    80002284:	00181513          	sll	a0,a6,0x1
    80002288:	00179713          	sll	a4,a5,0x1
    8000228c:	01050533          	add	a0,a0,a6
    80002290:	0040f617          	auipc	a2,0x40f
    80002294:	e0060613          	add	a2,a2,-512 # 80411090 <lru_mgr>
    80002298:	00f706b3          	add	a3,a4,a5
    8000229c:	00451513          	sll	a0,a0,0x4
    800022a0:	00469693          	sll	a3,a3,0x4
    800022a4:	00a60533          	add	a0,a2,a0
    800022a8:	fffff337          	lui	t1,0xfffff
    800022ac:	00d608b3          	add	a7,a2,a3
    800022b0:	0064f4b3          	and	s1,s1,t1
    800022b4:	01453423          	sd	s4,8(a0)
    800022b8:	fff00513          	li	a0,-1
    800022bc:	01068693          	add	a3,a3,16
    800022c0:	0098b823          	sd	s1,16(a7)
    800022c4:	0128bc23          	sd	s2,24(a7)
    800022c8:	02a8a023          	sw	a0,32(a7)
    800022cc:	0049f993          	and	s3,s3,4
    800022d0:	00d606b3          	add	a3,a2,a3
    800022d4:	00098463          	beqz	s3,800022dc <map_page+0x160>
    800022d8:	00500a93          	li	s5,5
    800022dc:	00181513          	sll	a0,a6,0x1
    800022e0:	00f707b3          	add	a5,a4,a5
    800022e4:	00063883          	ld	a7,0(a2)
    800022e8:	01050733          	add	a4,a0,a6
    800022ec:	00479793          	sll	a5,a5,0x4
    800022f0:	00471713          	sll	a4,a4,0x4
    800022f4:	00f607b3          	add	a5,a2,a5
    800022f8:	00e60733          	add	a4,a2,a4
    800022fc:	0357a223          	sw	s5,36(a5)
    80002300:	01173023          	sd	a7,0(a4)
    80002304:	0207b423          	sd	zero,40(a5)
    80002308:	06088e63          	beqz	a7,80002384 <map_page+0x208>
    8000230c:	00d8bc23          	sd	a3,24(a7)
    80002310:	0105a783          	lw	a5,16(a1)
    80002314:	00d63023          	sd	a3,0(a2)
    80002318:	0017879b          	addw	a5,a5,1
    8000231c:	00f5a823          	sw	a5,16(a1)
    80002320:	00000513          	li	a0,0
    80002324:	03813083          	ld	ra,56(sp)
    80002328:	03013403          	ld	s0,48(sp)
    8000232c:	02813483          	ld	s1,40(sp)
    80002330:	02013903          	ld	s2,32(sp)
    80002334:	01813983          	ld	s3,24(sp)
    80002338:	01013a03          	ld	s4,16(sp)
    8000233c:	00813a83          	ld	s5,8(sp)
    80002340:	00013b03          	ld	s6,0(sp)
    80002344:	04010113          	add	sp,sp,64
    80002348:	00008067          	ret
    8000234c:	b89ff0ef          	jal	80001ed4 <alloc_page>
    80002350:	00050813          	mv	a6,a0
    80002354:	02050c63          	beqz	a0,8000238c <map_page+0x210>
    80002358:	00001737          	lui	a4,0x1
    8000235c:	00e50733          	add	a4,a0,a4
    80002360:	00050793          	mv	a5,a0
    80002364:	0007b023          	sd	zero,0(a5)
    80002368:	00878793          	add	a5,a5,8
    8000236c:	fee79ce3          	bne	a5,a4,80002364 <map_page+0x1e8>
    80002370:	00c85793          	srl	a5,a6,0xc
    80002374:	00a79793          	sll	a5,a5,0xa
    80002378:	0017e793          	or	a5,a5,1
    8000237c:	00f43023          	sd	a5,0(s0)
    80002380:	e85ff06f          	j	80002204 <map_page+0x88>
    80002384:	00d63423          	sd	a3,8(a2)
    80002388:	f89ff06f          	j	80002310 <map_page+0x194>
    8000238c:	fff00513          	li	a0,-1
    80002390:	f95ff06f          	j	80002324 <map_page+0x1a8>
    80002394:	fff00513          	li	a0,-1
    80002398:	00008067          	ret

000000008000239c <map_region>:
    8000239c:	000017b7          	lui	a5,0x1
    800023a0:	fc010113          	add	sp,sp,-64
    800023a4:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800023a8:	02913423          	sd	s1,40(sp)
    800023ac:	00f684b3          	add	s1,a3,a5
    800023b0:	00b484b3          	add	s1,s1,a1
    800023b4:	fffff7b7          	lui	a5,0xfffff
    800023b8:	02113c23          	sd	ra,56(sp)
    800023bc:	02813823          	sd	s0,48(sp)
    800023c0:	03213023          	sd	s2,32(sp)
    800023c4:	01313c23          	sd	s3,24(sp)
    800023c8:	01413823          	sd	s4,16(sp)
    800023cc:	01513423          	sd	s5,8(sp)
    800023d0:	00f4f4b3          	and	s1,s1,a5
    800023d4:	0495f263          	bgeu	a1,s1,80002418 <map_region+0x7c>
    800023d8:	00058413          	mv	s0,a1
    800023dc:	00050993          	mv	s3,a0
    800023e0:	00070a13          	mv	s4,a4
    800023e4:	40b60933          	sub	s2,a2,a1
    800023e8:	00001ab7          	lui	s5,0x1
    800023ec:	0080006f          	j	800023f4 <map_region+0x58>
    800023f0:	02947463          	bgeu	s0,s1,80002418 <map_region+0x7c>
    800023f4:	00890633          	add	a2,s2,s0
    800023f8:	00040593          	mv	a1,s0
    800023fc:	000a0693          	mv	a3,s4
    80002400:	00098513          	mv	a0,s3
    80002404:	d79ff0ef          	jal	8000217c <map_page>
    80002408:	01540433          	add	s0,s0,s5
    8000240c:	fe0502e3          	beqz	a0,800023f0 <map_region+0x54>
    80002410:	fff00513          	li	a0,-1
    80002414:	0080006f          	j	8000241c <map_region+0x80>
    80002418:	00000513          	li	a0,0
    8000241c:	03813083          	ld	ra,56(sp)
    80002420:	03013403          	ld	s0,48(sp)
    80002424:	02813483          	ld	s1,40(sp)
    80002428:	02013903          	ld	s2,32(sp)
    8000242c:	01813983          	ld	s3,24(sp)
    80002430:	01013a03          	ld	s4,16(sp)
    80002434:	00813a83          	ld	s5,8(sp)
    80002438:	04010113          	add	sp,sp,64
    8000243c:	00008067          	ret

0000000080002440 <destroy_pagetable>:
    80002440:	f0010113          	add	sp,sp,-256
    80002444:	000017b7          	lui	a5,0x1
    80002448:	0e813823          	sd	s0,240(sp)
    8000244c:	0f213023          	sd	s2,224(sp)
    80002450:	0d613023          	sd	s6,192(sp)
    80002454:	0b713c23          	sd	s7,184(sp)
    80002458:	0e113c23          	sd	ra,248(sp)
    8000245c:	0e913423          	sd	s1,232(sp)
    80002460:	0d313c23          	sd	s3,216(sp)
    80002464:	0d413823          	sd	s4,208(sp)
    80002468:	0d513423          	sd	s5,200(sp)
    8000246c:	0b813823          	sd	s8,176(sp)
    80002470:	0b913423          	sd	s9,168(sp)
    80002474:	0ba13023          	sd	s10,160(sp)
    80002478:	09b13c23          	sd	s11,152(sp)
    8000247c:	00050413          	mv	s0,a0
    80002480:	00050913          	mv	s2,a0
    80002484:	00f50b33          	add	s6,a0,a5
    80002488:	00001bb7          	lui	s7,0x1
    8000248c:	00c0006f          	j	80002498 <destroy_pagetable+0x58>
    80002490:	00890913          	add	s2,s2,8
    80002494:	2d690063          	beq	s2,s6,80002754 <destroy_pagetable+0x314>
    80002498:	00093783          	ld	a5,0(s2)
    8000249c:	00100713          	li	a4,1
    800024a0:	00f7f693          	and	a3,a5,15
    800024a4:	fee696e3          	bne	a3,a4,80002490 <destroy_pagetable+0x50>
    800024a8:	00a7d793          	srl	a5,a5,0xa
    800024ac:	00c79a13          	sll	s4,a5,0xc
    800024b0:	017a0cb3          	add	s9,s4,s7
    800024b4:	00100d93          	li	s11,1
    800024b8:	000a0a93          	mv	s5,s4
    800024bc:	00040493          	mv	s1,s0
    800024c0:	00c0006f          	j	800024cc <destroy_pagetable+0x8c>
    800024c4:	008a0a13          	add	s4,s4,8 # 1008 <_entry-0x7fffeff8>
    800024c8:	279a0c63          	beq	s4,s9,80002740 <destroy_pagetable+0x300>
    800024cc:	000a3783          	ld	a5,0(s4)
    800024d0:	00f7f713          	and	a4,a5,15
    800024d4:	ffb718e3          	bne	a4,s11,800024c4 <destroy_pagetable+0x84>
    800024d8:	00a7d793          	srl	a5,a5,0xa
    800024dc:	00c79993          	sll	s3,a5,0xc
    800024e0:	00098c13          	mv	s8,s3
    800024e4:	01798d33          	add	s10,s3,s7
    800024e8:	00098413          	mv	s0,s3
    800024ec:	00c0006f          	j	800024f8 <destroy_pagetable+0xb8>
    800024f0:	00840413          	add	s0,s0,8
    800024f4:	23a40e63          	beq	s0,s10,80002730 <destroy_pagetable+0x2f0>
    800024f8:	00043783          	ld	a5,0(s0)
    800024fc:	00f7f713          	and	a4,a5,15
    80002500:	ffb718e3          	bne	a4,s11,800024f0 <destroy_pagetable+0xb0>
    80002504:	00a7d793          	srl	a5,a5,0xa
    80002508:	00c79793          	sll	a5,a5,0xc
    8000250c:	00048713          	mv	a4,s1
    80002510:	03513c23          	sd	s5,56(sp)
    80002514:	00090493          	mv	s1,s2
    80002518:	017789b3          	add	s3,a5,s7
    8000251c:	02813823          	sd	s0,48(sp)
    80002520:	00078a93          	mv	s5,a5
    80002524:	00070913          	mv	s2,a4
    80002528:	00c0006f          	j	80002534 <destroy_pagetable+0xf4>
    8000252c:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80002530:	1cf98e63          	beq	s3,a5,8000270c <destroy_pagetable+0x2cc>
    80002534:	0007b703          	ld	a4,0(a5)
    80002538:	00f77693          	and	a3,a4,15
    8000253c:	ffb698e3          	bne	a3,s11,8000252c <destroy_pagetable+0xec>
    80002540:	00a75713          	srl	a4,a4,0xa
    80002544:	00c71713          	sll	a4,a4,0xc
    80002548:	017706b3          	add	a3,a4,s7
    8000254c:	05313423          	sd	s3,72(sp)
    80002550:	00d13423          	sd	a3,8(sp)
    80002554:	05813023          	sd	s8,64(sp)
    80002558:	00070993          	mv	s3,a4
    8000255c:	04f13823          	sd	a5,80(sp)
    80002560:	0100006f          	j	80002570 <destroy_pagetable+0x130>
    80002564:	00813783          	ld	a5,8(sp)
    80002568:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    8000256c:	16e78e63          	beq	a5,a4,800026e8 <destroy_pagetable+0x2a8>
    80002570:	00073783          	ld	a5,0(a4)
    80002574:	00f7f693          	and	a3,a5,15
    80002578:	ffb696e3          	bne	a3,s11,80002564 <destroy_pagetable+0x124>
    8000257c:	00a7d793          	srl	a5,a5,0xa
    80002580:	00c79793          	sll	a5,a5,0xc
    80002584:	017786b3          	add	a3,a5,s7
    80002588:	000a8c13          	mv	s8,s5
    8000258c:	00d13c23          	sd	a3,24(sp)
    80002590:	00078a93          	mv	s5,a5
    80002594:	04e13c23          	sd	a4,88(sp)
    80002598:	07213023          	sd	s2,96(sp)
    8000259c:	0100006f          	j	800025ac <destroy_pagetable+0x16c>
    800025a0:	01813703          	ld	a4,24(sp)
    800025a4:	00878793          	add	a5,a5,8
    800025a8:	10f70c63          	beq	a4,a5,800026c0 <destroy_pagetable+0x280>
    800025ac:	0007b703          	ld	a4,0(a5)
    800025b0:	00f77693          	and	a3,a4,15
    800025b4:	ffb696e3          	bne	a3,s11,800025a0 <destroy_pagetable+0x160>
    800025b8:	00a75713          	srl	a4,a4,0xa
    800025bc:	00c71913          	sll	s2,a4,0xc
    800025c0:	01790733          	add	a4,s2,s7
    800025c4:	07213423          	sd	s2,104(sp)
    800025c8:	00090413          	mv	s0,s2
    800025cc:	02e13023          	sd	a4,32(sp)
    800025d0:	06f13823          	sd	a5,112(sp)
    800025d4:	00048913          	mv	s2,s1
    800025d8:	0100006f          	j	800025e8 <destroy_pagetable+0x1a8>
    800025dc:	02013783          	ld	a5,32(sp)
    800025e0:	00840413          	add	s0,s0,8
    800025e4:	0a878c63          	beq	a5,s0,8000269c <destroy_pagetable+0x25c>
    800025e8:	00043783          	ld	a5,0(s0)
    800025ec:	00f7f693          	and	a3,a5,15
    800025f0:	ffb696e3          	bne	a3,s11,800025dc <destroy_pagetable+0x19c>
    800025f4:	00a7d793          	srl	a5,a5,0xa
    800025f8:	00c79493          	sll	s1,a5,0xc
    800025fc:	017487b3          	add	a5,s1,s7
    80002600:	00913823          	sd	s1,16(sp)
    80002604:	02f13423          	sd	a5,40(sp)
    80002608:	06813c23          	sd	s0,120(sp)
    8000260c:	0100006f          	j	8000261c <destroy_pagetable+0x1dc>
    80002610:	02813783          	ld	a5,40(sp)
    80002614:	00848493          	add	s1,s1,8
    80002618:	06978663          	beq	a5,s1,80002684 <destroy_pagetable+0x244>
    8000261c:	0004b783          	ld	a5,0(s1)
    80002620:	00f7f693          	and	a3,a5,15
    80002624:	ffb696e3          	bne	a3,s11,80002610 <destroy_pagetable+0x1d0>
    80002628:	00a7d793          	srl	a5,a5,0xa
    8000262c:	00c79413          	sll	s0,a5,0xc
    80002630:	017406b3          	add	a3,s0,s7
    80002634:	09213023          	sd	s2,128(sp)
    80002638:	09613423          	sd	s6,136(sp)
    8000263c:	00040913          	mv	s2,s0
    80002640:	000a0b13          	mv	s6,s4
    80002644:	00048a13          	mv	s4,s1
    80002648:	00068493          	mv	s1,a3
    8000264c:	00043783          	ld	a5,0(s0)
    80002650:	00840413          	add	s0,s0,8
    80002654:	00f7f713          	and	a4,a5,15
    80002658:	13b70e63          	beq	a4,s11,80002794 <destroy_pagetable+0x354>
    8000265c:	fe8498e3          	bne	s1,s0,8000264c <destroy_pagetable+0x20c>
    80002660:	00090513          	mv	a0,s2
    80002664:	000a0493          	mv	s1,s4
    80002668:	08013903          	ld	s2,128(sp)
    8000266c:	000b0a13          	mv	s4,s6
    80002670:	08813b03          	ld	s6,136(sp)
    80002674:	87dff0ef          	jal	80001ef0 <free_page>
    80002678:	02813783          	ld	a5,40(sp)
    8000267c:	00848493          	add	s1,s1,8
    80002680:	f8979ee3          	bne	a5,s1,8000261c <destroy_pagetable+0x1dc>
    80002684:	01013503          	ld	a0,16(sp)
    80002688:	07813403          	ld	s0,120(sp)
    8000268c:	865ff0ef          	jal	80001ef0 <free_page>
    80002690:	02013783          	ld	a5,32(sp)
    80002694:	00840413          	add	s0,s0,8
    80002698:	f48798e3          	bne	a5,s0,800025e8 <destroy_pagetable+0x1a8>
    8000269c:	07013783          	ld	a5,112(sp)
    800026a0:	06813503          	ld	a0,104(sp)
    800026a4:	00090493          	mv	s1,s2
    800026a8:	00f13823          	sd	a5,16(sp)
    800026ac:	845ff0ef          	jal	80001ef0 <free_page>
    800026b0:	01013783          	ld	a5,16(sp)
    800026b4:	01813703          	ld	a4,24(sp)
    800026b8:	00878793          	add	a5,a5,8
    800026bc:	eef718e3          	bne	a4,a5,800025ac <destroy_pagetable+0x16c>
    800026c0:	05813703          	ld	a4,88(sp)
    800026c4:	000a8513          	mv	a0,s5
    800026c8:	06013903          	ld	s2,96(sp)
    800026cc:	00e13823          	sd	a4,16(sp)
    800026d0:	821ff0ef          	jal	80001ef0 <free_page>
    800026d4:	01013703          	ld	a4,16(sp)
    800026d8:	00813783          	ld	a5,8(sp)
    800026dc:	000c0a93          	mv	s5,s8
    800026e0:	00870713          	add	a4,a4,8
    800026e4:	e8e796e3          	bne	a5,a4,80002570 <destroy_pagetable+0x130>
    800026e8:	05013783          	ld	a5,80(sp)
    800026ec:	00098513          	mv	a0,s3
    800026f0:	04013c03          	ld	s8,64(sp)
    800026f4:	00f13423          	sd	a5,8(sp)
    800026f8:	04813983          	ld	s3,72(sp)
    800026fc:	ff4ff0ef          	jal	80001ef0 <free_page>
    80002700:	00813783          	ld	a5,8(sp)
    80002704:	00878793          	add	a5,a5,8
    80002708:	e2f996e3          	bne	s3,a5,80002534 <destroy_pagetable+0xf4>
    8000270c:	03013403          	ld	s0,48(sp)
    80002710:	00090793          	mv	a5,s2
    80002714:	000a8513          	mv	a0,s5
    80002718:	00840413          	add	s0,s0,8
    8000271c:	03813a83          	ld	s5,56(sp)
    80002720:	00048913          	mv	s2,s1
    80002724:	00078493          	mv	s1,a5
    80002728:	fc8ff0ef          	jal	80001ef0 <free_page>
    8000272c:	dda416e3          	bne	s0,s10,800024f8 <destroy_pagetable+0xb8>
    80002730:	000c0513          	mv	a0,s8
    80002734:	008a0a13          	add	s4,s4,8
    80002738:	fb8ff0ef          	jal	80001ef0 <free_page>
    8000273c:	d99a18e3          	bne	s4,s9,800024cc <destroy_pagetable+0x8c>
    80002740:	000a8513          	mv	a0,s5
    80002744:	00890913          	add	s2,s2,8
    80002748:	00048413          	mv	s0,s1
    8000274c:	fa4ff0ef          	jal	80001ef0 <free_page>
    80002750:	d56914e3          	bne	s2,s6,80002498 <destroy_pagetable+0x58>
    80002754:	00040513          	mv	a0,s0
    80002758:	0f013403          	ld	s0,240(sp)
    8000275c:	0f813083          	ld	ra,248(sp)
    80002760:	0e813483          	ld	s1,232(sp)
    80002764:	0e013903          	ld	s2,224(sp)
    80002768:	0d813983          	ld	s3,216(sp)
    8000276c:	0d013a03          	ld	s4,208(sp)
    80002770:	0c813a83          	ld	s5,200(sp)
    80002774:	0c013b03          	ld	s6,192(sp)
    80002778:	0b813b83          	ld	s7,184(sp)
    8000277c:	0b013c03          	ld	s8,176(sp)
    80002780:	0a813c83          	ld	s9,168(sp)
    80002784:	0a013d03          	ld	s10,160(sp)
    80002788:	09813d83          	ld	s11,152(sp)
    8000278c:	10010113          	add	sp,sp,256
    80002790:	f60ff06f          	j	80001ef0 <free_page>
    80002794:	00a7d793          	srl	a5,a5,0xa
    80002798:	00c79513          	sll	a0,a5,0xc
    8000279c:	ca5ff0ef          	jal	80002440 <destroy_pagetable>
    800027a0:	ea8496e3          	bne	s1,s0,8000264c <destroy_pagetable+0x20c>
    800027a4:	ebdff06f          	j	80002660 <destroy_pagetable+0x220>

00000000800027a8 <kvminithart>:
    800027a8:	00424797          	auipc	a5,0x424
    800027ac:	a987b783          	ld	a5,-1384(a5) # 80426240 <kernel_pagetable>
    800027b0:	fff00713          	li	a4,-1
    800027b4:	03f71713          	sll	a4,a4,0x3f
    800027b8:	00c7d793          	srl	a5,a5,0xc
    800027bc:	00e7e7b3          	or	a5,a5,a4
    800027c0:	18079073          	csrw	satp,a5
    800027c4:	12000073          	sfence.vma
    800027c8:	00008067          	ret

00000000800027cc <dump_pagetable>:
    800027cc:	fb010113          	add	sp,sp,-80
    800027d0:	03213823          	sd	s2,48(sp)
    800027d4:	03313423          	sd	s3,40(sp)
    800027d8:	04113423          	sd	ra,72(sp)
    800027dc:	04813023          	sd	s0,64(sp)
    800027e0:	02913c23          	sd	s1,56(sp)
    800027e4:	03413023          	sd	s4,32(sp)
    800027e8:	01513c23          	sd	s5,24(sp)
    800027ec:	01613823          	sd	s6,16(sp)
    800027f0:	01713423          	sd	s7,8(sp)
    800027f4:	00058993          	mv	s3,a1
    800027f8:	00050913          	mv	s2,a0
    800027fc:	28b05263          	blez	a1,80002a80 <dump_pagetable+0x2b4>
    80002800:	00000413          	li	s0,0
    80002804:	0014041b          	addw	s0,s0,1
    80002808:	02000513          	li	a0,32
    8000280c:	e04ff0ef          	jal	80001e10 <uart_putc>
    80002810:	fe899ae3          	bne	s3,s0,80002804 <dump_pagetable+0x38>
    80002814:	00005517          	auipc	a0,0x5
    80002818:	77c50513          	add	a0,a0,1916 # 80007f90 <digits+0x18>
    8000281c:	e0cff0ef          	jal	80001e28 <uart_puts>
    80002820:	00900793          	li	a5,9
    80002824:	2737d463          	bge	a5,s3,80002a8c <dump_pagetable+0x2c0>
    80002828:	00a00413          	li	s0,10
    8000282c:	0289c53b          	divw	a0,s3,s0
    80002830:	0305051b          	addw	a0,a0,48
    80002834:	0ff57513          	zext.b	a0,a0
    80002838:	dd8ff0ef          	jal	80001e10 <uart_putc>
    8000283c:	0289e53b          	remw	a0,s3,s0
    80002840:	0305051b          	addw	a0,a0,48
    80002844:	0ff57513          	zext.b	a0,a0
    80002848:	dc8ff0ef          	jal	80001e10 <uart_putc>
    8000284c:	00005517          	auipc	a0,0x5
    80002850:	75c50513          	add	a0,a0,1884 # 80007fa8 <digits+0x30>
    80002854:	fff00b13          	li	s6,-1
    80002858:	dd0ff0ef          	jal	80001e28 <uart_puts>
    8000285c:	00000493          	li	s1,0
    80002860:	00cb5b13          	srl	s6,s6,0xc
    80002864:	00900a13          	li	s4,9
    80002868:	ffc00a93          	li	s5,-4
    8000286c:	0140006f          	j	80002880 <dump_pagetable+0xb4>
    80002870:	0014849b          	addw	s1,s1,1
    80002874:	20000793          	li	a5,512
    80002878:	00890913          	add	s2,s2,8
    8000287c:	0cf48063          	beq	s1,a5,8000293c <dump_pagetable+0x170>
    80002880:	00093783          	ld	a5,0(s2)
    80002884:	0017f793          	and	a5,a5,1
    80002888:	fe0784e3          	beqz	a5,80002870 <dump_pagetable+0xa4>
    8000288c:	00000413          	li	s0,0
    80002890:	0009ca63          	bltz	s3,800028a4 <dump_pagetable+0xd8>
    80002894:	0014041b          	addw	s0,s0,1
    80002898:	02000513          	li	a0,32
    8000289c:	d74ff0ef          	jal	80001e10 <uart_putc>
    800028a0:	fe89dae3          	bge	s3,s0,80002894 <dump_pagetable+0xc8>
    800028a4:	00005517          	auipc	a0,0x5
    800028a8:	70c50513          	add	a0,a0,1804 # 80007fb0 <digits+0x38>
    800028ac:	d7cff0ef          	jal	80001e28 <uart_puts>
    800028b0:	06300793          	li	a5,99
    800028b4:	1697d263          	bge	a5,s1,80002a18 <dump_pagetable+0x24c>
    800028b8:	06400413          	li	s0,100
    800028bc:	0284c53b          	divw	a0,s1,s0
    800028c0:	00a00b93          	li	s7,10
    800028c4:	0305051b          	addw	a0,a0,48
    800028c8:	0ff57513          	zext.b	a0,a0
    800028cc:	d44ff0ef          	jal	80001e10 <uart_putc>
    800028d0:	0284e53b          	remw	a0,s1,s0
    800028d4:	0375453b          	divw	a0,a0,s7
    800028d8:	0305051b          	addw	a0,a0,48
    800028dc:	0ff57513          	zext.b	a0,a0
    800028e0:	d30ff0ef          	jal	80001e10 <uart_putc>
    800028e4:	0374e53b          	remw	a0,s1,s7
    800028e8:	0305051b          	addw	a0,a0,48
    800028ec:	0ff57513          	zext.b	a0,a0
    800028f0:	d20ff0ef          	jal	80001e10 <uart_putc>
    800028f4:	00005517          	auipc	a0,0x5
    800028f8:	6c450513          	add	a0,a0,1732 # 80007fb8 <digits+0x40>
    800028fc:	d2cff0ef          	jal	80001e28 <uart_puts>
    80002900:	00093b83          	ld	s7,0(s2)
    80002904:	00ebf793          	and	a5,s7,14
    80002908:	06079063          	bnez	a5,80002968 <dump_pagetable+0x19c>
    8000290c:	00005517          	auipc	a0,0x5
    80002910:	6c450513          	add	a0,a0,1732 # 80007fd0 <digits+0x58>
    80002914:	d14ff0ef          	jal	80001e28 <uart_puts>
    80002918:	00093503          	ld	a0,0(s2)
    8000291c:	0019859b          	addw	a1,s3,1
    80002920:	0014849b          	addw	s1,s1,1
    80002924:	00a55513          	srl	a0,a0,0xa
    80002928:	00c51513          	sll	a0,a0,0xc
    8000292c:	ea1ff0ef          	jal	800027cc <dump_pagetable>
    80002930:	20000793          	li	a5,512
    80002934:	00890913          	add	s2,s2,8
    80002938:	f4f494e3          	bne	s1,a5,80002880 <dump_pagetable+0xb4>
    8000293c:	04813083          	ld	ra,72(sp)
    80002940:	04013403          	ld	s0,64(sp)
    80002944:	03813483          	ld	s1,56(sp)
    80002948:	03013903          	ld	s2,48(sp)
    8000294c:	02813983          	ld	s3,40(sp)
    80002950:	02013a03          	ld	s4,32(sp)
    80002954:	01813a83          	ld	s5,24(sp)
    80002958:	01013b03          	ld	s6,16(sp)
    8000295c:	00813b83          	ld	s7,8(sp)
    80002960:	05010113          	add	sp,sp,80
    80002964:	00008067          	ret
    80002968:	00005517          	auipc	a0,0x5
    8000296c:	65850513          	add	a0,a0,1624 # 80007fc0 <digits+0x48>
    80002970:	cb8ff0ef          	jal	80001e28 <uart_puts>
    80002974:	00abdb93          	srl	s7,s7,0xa
    80002978:	016bfbb3          	and	s7,s7,s6
    8000297c:	00000713          	li	a4,0
    80002980:	03c00413          	li	s0,60
    80002984:	008bd7b3          	srl	a5,s7,s0
    80002988:	00f7f793          	and	a5,a5,15
    8000298c:	00e7e733          	or	a4,a5,a4
    80002990:	00071e63          	bnez	a4,800029ac <dump_pagetable+0x1e0>
    80002994:	02040c63          	beqz	s0,800029cc <dump_pagetable+0x200>
    80002998:	ffc4041b          	addw	s0,s0,-4
    8000299c:	008bd7b3          	srl	a5,s7,s0
    800029a0:	00f7f793          	and	a5,a5,15
    800029a4:	00e7e733          	or	a4,a5,a4
    800029a8:	fe0706e3          	beqz	a4,80002994 <dump_pagetable+0x1c8>
    800029ac:	ffc4041b          	addw	s0,s0,-4
    800029b0:	03778513          	add	a0,a5,55
    800029b4:	0ff7f713          	zext.b	a4,a5
    800029b8:	04fa5c63          	bge	s4,a5,80002a10 <dump_pagetable+0x244>
    800029bc:	c54ff0ef          	jal	80001e10 <uart_putc>
    800029c0:	01540a63          	beq	s0,s5,800029d4 <dump_pagetable+0x208>
    800029c4:	00100713          	li	a4,1
    800029c8:	fbdff06f          	j	80002984 <dump_pagetable+0x1b8>
    800029cc:	03000513          	li	a0,48
    800029d0:	c40ff0ef          	jal	80001e10 <uart_putc>
    800029d4:	00005517          	auipc	a0,0x5
    800029d8:	5f450513          	add	a0,a0,1524 # 80007fc8 <digits+0x50>
    800029dc:	c4cff0ef          	jal	80001e28 <uart_puts>
    800029e0:	00093783          	ld	a5,0(s2)
    800029e4:	0027f713          	and	a4,a5,2
    800029e8:	08071463          	bnez	a4,80002a70 <dump_pagetable+0x2a4>
    800029ec:	0047f713          	and	a4,a5,4
    800029f0:	06071863          	bnez	a4,80002a60 <dump_pagetable+0x294>
    800029f4:	0087f713          	and	a4,a5,8
    800029f8:	04071c63          	bnez	a4,80002a50 <dump_pagetable+0x284>
    800029fc:	0107f793          	and	a5,a5,16
    80002a00:	04079263          	bnez	a5,80002a44 <dump_pagetable+0x278>
    80002a04:	00a00513          	li	a0,10
    80002a08:	c08ff0ef          	jal	80001e10 <uart_putc>
    80002a0c:	e65ff06f          	j	80002870 <dump_pagetable+0xa4>
    80002a10:	03070513          	add	a0,a4,48
    80002a14:	fa9ff06f          	j	800029bc <dump_pagetable+0x1f0>
    80002a18:	089a5263          	bge	s4,s1,80002a9c <dump_pagetable+0x2d0>
    80002a1c:	00a00413          	li	s0,10
    80002a20:	0284c53b          	divw	a0,s1,s0
    80002a24:	0305051b          	addw	a0,a0,48
    80002a28:	0ff57513          	zext.b	a0,a0
    80002a2c:	be4ff0ef          	jal	80001e10 <uart_putc>
    80002a30:	0284e53b          	remw	a0,s1,s0
    80002a34:	0305051b          	addw	a0,a0,48
    80002a38:	0ff57513          	zext.b	a0,a0
    80002a3c:	bd4ff0ef          	jal	80001e10 <uart_putc>
    80002a40:	eb5ff06f          	j	800028f4 <dump_pagetable+0x128>
    80002a44:	05500513          	li	a0,85
    80002a48:	bc8ff0ef          	jal	80001e10 <uart_putc>
    80002a4c:	fb9ff06f          	j	80002a04 <dump_pagetable+0x238>
    80002a50:	05800513          	li	a0,88
    80002a54:	bbcff0ef          	jal	80001e10 <uart_putc>
    80002a58:	00093783          	ld	a5,0(s2)
    80002a5c:	fa1ff06f          	j	800029fc <dump_pagetable+0x230>
    80002a60:	05700513          	li	a0,87
    80002a64:	bacff0ef          	jal	80001e10 <uart_putc>
    80002a68:	00093783          	ld	a5,0(s2)
    80002a6c:	f89ff06f          	j	800029f4 <dump_pagetable+0x228>
    80002a70:	05200513          	li	a0,82
    80002a74:	b9cff0ef          	jal	80001e10 <uart_putc>
    80002a78:	00093783          	ld	a5,0(s2)
    80002a7c:	f71ff06f          	j	800029ec <dump_pagetable+0x220>
    80002a80:	00005517          	auipc	a0,0x5
    80002a84:	51050513          	add	a0,a0,1296 # 80007f90 <digits+0x18>
    80002a88:	ba0ff0ef          	jal	80001e28 <uart_puts>
    80002a8c:	0309851b          	addw	a0,s3,48
    80002a90:	0ff57513          	zext.b	a0,a0
    80002a94:	b7cff0ef          	jal	80001e10 <uart_putc>
    80002a98:	db5ff06f          	j	8000284c <dump_pagetable+0x80>
    80002a9c:	0304851b          	addw	a0,s1,48
    80002aa0:	0ff57513          	zext.b	a0,a0
    80002aa4:	b6cff0ef          	jal	80001e10 <uart_putc>
    80002aa8:	e4dff06f          	j	800028f4 <dump_pagetable+0x128>

0000000080002aac <init_page_replacement>:
    80002aac:	00100713          	li	a4,1
    80002ab0:	02a71713          	sll	a4,a4,0x2a
    80002ab4:	0000e797          	auipc	a5,0xe
    80002ab8:	54c78793          	add	a5,a5,1356 # 80011000 <swap_mgr>
    80002abc:	08e7b023          	sd	a4,128(a5)
    80002ac0:	0000e717          	auipc	a4,0xe
    80002ac4:	5c072423          	sw	zero,1480(a4) # 80011088 <swap_mgr+0x88>
    80002ac8:	0000e717          	auipc	a4,0xe
    80002acc:	5b870713          	add	a4,a4,1464 # 80011080 <swap_mgr+0x80>
    80002ad0:	0007a023          	sw	zero,0(a5)
    80002ad4:	00478793          	add	a5,a5,4
    80002ad8:	fee79ce3          	bne	a5,a4,80002ad0 <init_page_replacement+0x24>
    80002adc:	0040e797          	auipc	a5,0x40e
    80002ae0:	5a07ba23          	sd	zero,1460(a5) # 80411090 <lru_mgr>
    80002ae4:	0040e797          	auipc	a5,0x40e
    80002ae8:	5a07ba23          	sd	zero,1460(a5) # 80411098 <lru_mgr+0x8>
    80002aec:	00100793          	li	a5,1
    80002af0:	02879793          	sll	a5,a5,0x28
    80002af4:	00411717          	auipc	a4,0x411
    80002af8:	5af73623          	sd	a5,1452(a4) # 804140a0 <lru_mgr+0x3010>
    80002afc:	fff00713          	li	a4,-1
    80002b00:	0040e797          	auipc	a5,0x40e
    80002b04:	5a078793          	add	a5,a5,1440 # 804110a0 <lru_mgr+0x10>
    80002b08:	00411697          	auipc	a3,0x411
    80002b0c:	59868693          	add	a3,a3,1432 # 804140a0 <lru_mgr+0x3010>
    80002b10:	02075713          	srl	a4,a4,0x20
    80002b14:	0007b023          	sd	zero,0(a5)
    80002b18:	0007b423          	sd	zero,8(a5)
    80002b1c:	00e7b823          	sd	a4,16(a5)
    80002b20:	0007bc23          	sd	zero,24(a5)
    80002b24:	0207b023          	sd	zero,32(a5)
    80002b28:	0207b423          	sd	zero,40(a5)
    80002b2c:	03078793          	add	a5,a5,48
    80002b30:	fed792e3          	bne	a5,a3,80002b14 <init_page_replacement+0x68>
    80002b34:	00008067          	ret

0000000080002b38 <kvminit>:
    80002b38:	fd010113          	add	sp,sp,-48
    80002b3c:	02113423          	sd	ra,40(sp)
    80002b40:	02813023          	sd	s0,32(sp)
    80002b44:	00913c23          	sd	s1,24(sp)
    80002b48:	01213823          	sd	s2,16(sp)
    80002b4c:	01313423          	sd	s3,8(sp)
    80002b50:	01413023          	sd	s4,0(sp)
    80002b54:	f59ff0ef          	jal	80002aac <init_page_replacement>
    80002b58:	b7cff0ef          	jal	80001ed4 <alloc_page>
    80002b5c:	00001737          	lui	a4,0x1
    80002b60:	00e50733          	add	a4,a0,a4
    80002b64:	00050413          	mv	s0,a0
    80002b68:	00050793          	mv	a5,a0
    80002b6c:	1a050663          	beqz	a0,80002d18 <kvminit+0x1e0>
    80002b70:	0007b023          	sd	zero,0(a5)
    80002b74:	00878793          	add	a5,a5,8
    80002b78:	fef71ce3          	bne	a4,a5,80002b70 <kvminit+0x38>
    80002b7c:	00423917          	auipc	s2,0x423
    80002b80:	6c490913          	add	s2,s2,1732 # 80426240 <kernel_pagetable>
    80002b84:	00004997          	auipc	s3,0x4
    80002b88:	2cf98993          	add	s3,s3,719 # 80006e53 <rodata_start+0xe53>
    80002b8c:	fffff7b7          	lui	a5,0xfffff
    80002b90:	00893023          	sd	s0,0(s2)
    80002b94:	ffffd497          	auipc	s1,0xffffd
    80002b98:	46c48493          	add	s1,s1,1132 # 80000000 <_entry>
    80002b9c:	00f9f9b3          	and	s3,s3,a5
    80002ba0:	0334f863          	bgeu	s1,s3,80002bd0 <kvminit+0x98>
    80002ba4:	00001a37          	lui	s4,0x1
    80002ba8:	0080006f          	j	80002bb0 <kvminit+0x78>
    80002bac:	0334f063          	bgeu	s1,s3,80002bcc <kvminit+0x94>
    80002bb0:	00048613          	mv	a2,s1
    80002bb4:	00048593          	mv	a1,s1
    80002bb8:	00a00693          	li	a3,10
    80002bbc:	00040513          	mv	a0,s0
    80002bc0:	dbcff0ef          	jal	8000217c <map_page>
    80002bc4:	014484b3          	add	s1,s1,s4
    80002bc8:	fe0502e3          	beqz	a0,80002bac <kvminit+0x74>
    80002bcc:	00093403          	ld	s0,0(s2)
    80002bd0:	00007997          	auipc	s3,0x7
    80002bd4:	07798993          	add	s3,s3,119 # 80009c47 <data_end+0xc43>
    80002bd8:	fffff7b7          	lui	a5,0xfffff
    80002bdc:	00003497          	auipc	s1,0x3
    80002be0:	42448493          	add	s1,s1,1060 # 80006000 <rodata_start>
    80002be4:	00f9f9b3          	and	s3,s3,a5
    80002be8:	0334f863          	bgeu	s1,s3,80002c18 <kvminit+0xe0>
    80002bec:	00001a37          	lui	s4,0x1
    80002bf0:	0080006f          	j	80002bf8 <kvminit+0xc0>
    80002bf4:	0334f063          	bgeu	s1,s3,80002c14 <kvminit+0xdc>
    80002bf8:	00048613          	mv	a2,s1
    80002bfc:	00048593          	mv	a1,s1
    80002c00:	00200693          	li	a3,2
    80002c04:	00040513          	mv	a0,s0
    80002c08:	d74ff0ef          	jal	8000217c <map_page>
    80002c0c:	014484b3          	add	s1,s1,s4
    80002c10:	fe0502e3          	beqz	a0,80002bf4 <kvminit+0xbc>
    80002c14:	00093403          	ld	s0,0(s2)
    80002c18:	00007997          	auipc	s3,0x7
    80002c1c:	3eb98993          	add	s3,s3,1003 # 8000a003 <data_end+0xfff>
    80002c20:	fffff7b7          	lui	a5,0xfffff
    80002c24:	00006497          	auipc	s1,0x6
    80002c28:	3dc48493          	add	s1,s1,988 # 80009000 <nextpid>
    80002c2c:	00f9f9b3          	and	s3,s3,a5
    80002c30:	0334f863          	bgeu	s1,s3,80002c60 <kvminit+0x128>
    80002c34:	00001a37          	lui	s4,0x1
    80002c38:	0080006f          	j	80002c40 <kvminit+0x108>
    80002c3c:	0334f063          	bgeu	s1,s3,80002c5c <kvminit+0x124>
    80002c40:	00048613          	mv	a2,s1
    80002c44:	00048593          	mv	a1,s1
    80002c48:	00600693          	li	a3,6
    80002c4c:	00040513          	mv	a0,s0
    80002c50:	d2cff0ef          	jal	8000217c <map_page>
    80002c54:	014484b3          	add	s1,s1,s4
    80002c58:	fe0502e3          	beqz	a0,80002c3c <kvminit+0x104>
    80002c5c:	00093403          	ld	s0,0(s2)
    80002c60:	00424997          	auipc	s3,0x424
    80002c64:	60f98993          	add	s3,s3,1551 # 8042726f <bss_end+0xfff>
    80002c68:	fffff7b7          	lui	a5,0xfffff
    80002c6c:	0000d497          	auipc	s1,0xd
    80002c70:	39448493          	add	s1,s1,916 # 80010000 <bss_start>
    80002c74:	00f9f9b3          	and	s3,s3,a5
    80002c78:	0334f863          	bgeu	s1,s3,80002ca8 <kvminit+0x170>
    80002c7c:	00001a37          	lui	s4,0x1
    80002c80:	0080006f          	j	80002c88 <kvminit+0x150>
    80002c84:	0334f063          	bgeu	s1,s3,80002ca4 <kvminit+0x16c>
    80002c88:	00048613          	mv	a2,s1
    80002c8c:	00048593          	mv	a1,s1
    80002c90:	00600693          	li	a3,6
    80002c94:	00040513          	mv	a0,s0
    80002c98:	ce4ff0ef          	jal	8000217c <map_page>
    80002c9c:	014484b3          	add	s1,s1,s4
    80002ca0:	fe0502e3          	beqz	a0,80002c84 <kvminit+0x14c>
    80002ca4:	00093403          	ld	s0,0(s2)
    80002ca8:	01100993          	li	s3,17
    80002cac:	00423497          	auipc	s1,0x423
    80002cb0:	5c448493          	add	s1,s1,1476 # 80426270 <bss_end>
    80002cb4:	01b99993          	sll	s3,s3,0x1b
    80002cb8:	0334f863          	bgeu	s1,s3,80002ce8 <kvminit+0x1b0>
    80002cbc:	00001a37          	lui	s4,0x1
    80002cc0:	0080006f          	j	80002cc8 <kvminit+0x190>
    80002cc4:	0334f063          	bgeu	s1,s3,80002ce4 <kvminit+0x1ac>
    80002cc8:	00048613          	mv	a2,s1
    80002ccc:	00048593          	mv	a1,s1
    80002cd0:	00600693          	li	a3,6
    80002cd4:	00040513          	mv	a0,s0
    80002cd8:	ca4ff0ef          	jal	8000217c <map_page>
    80002cdc:	014484b3          	add	s1,s1,s4
    80002ce0:	fe0502e3          	beqz	a0,80002cc4 <kvminit+0x18c>
    80002ce4:	00093403          	ld	s0,0(s2)
    80002ce8:	00040513          	mv	a0,s0
    80002cec:	02013403          	ld	s0,32(sp)
    80002cf0:	02813083          	ld	ra,40(sp)
    80002cf4:	01813483          	ld	s1,24(sp)
    80002cf8:	01013903          	ld	s2,16(sp)
    80002cfc:	00813983          	ld	s3,8(sp)
    80002d00:	00013a03          	ld	s4,0(sp)
    80002d04:	00600693          	li	a3,6
    80002d08:	10000637          	lui	a2,0x10000
    80002d0c:	100005b7          	lui	a1,0x10000
    80002d10:	03010113          	add	sp,sp,48
    80002d14:	c68ff06f          	j	8000217c <map_page>
    80002d18:	02813083          	ld	ra,40(sp)
    80002d1c:	02013403          	ld	s0,32(sp)
    80002d20:	00423797          	auipc	a5,0x423
    80002d24:	5207b023          	sd	zero,1312(a5) # 80426240 <kernel_pagetable>
    80002d28:	01813483          	ld	s1,24(sp)
    80002d2c:	01013903          	ld	s2,16(sp)
    80002d30:	00813983          	ld	s3,8(sp)
    80002d34:	00013a03          	ld	s4,0(sp)
    80002d38:	03010113          	add	sp,sp,48
    80002d3c:	00008067          	ret

0000000080002d40 <alloc_swap_slot>:
    80002d40:	0000e617          	auipc	a2,0xe
    80002d44:	2c060613          	add	a2,a2,704 # 80011000 <swap_mgr>
    80002d48:	08862803          	lw	a6,136(a2)
    80002d4c:	08462883          	lw	a7,132(a2)
    80002d50:	fff00513          	li	a0,-1
    80002d54:	0d187663          	bgeu	a6,a7,80002e20 <alloc_swap_slot+0xe0>
    80002d58:	08062303          	lw	t1,128(a2)
    80002d5c:	07137863          	bgeu	t1,a7,80002dcc <alloc_swap_slot+0x8c>
    80002d60:	0053579b          	srlw	a5,t1,0x5
    80002d64:	00279793          	sll	a5,a5,0x2
    80002d68:	00f607b3          	add	a5,a2,a5
    80002d6c:	0007a683          	lw	a3,0(a5)
    80002d70:	00100593          	li	a1,1
    80002d74:	006595bb          	sllw	a1,a1,t1
    80002d78:	00b6f7b3          	and	a5,a3,a1
    80002d7c:	0007879b          	sext.w	a5,a5
    80002d80:	0053571b          	srlw	a4,t1,0x5
    80002d84:	00030513          	mv	a0,t1
    80002d88:	08078e63          	beqz	a5,80002e24 <alloc_swap_slot+0xe4>
    80002d8c:	00100e13          	li	t3,1
    80002d90:	01c0006f          	j	80002dac <alloc_swap_slot+0x6c>
    80002d94:	0006a683          	lw	a3,0(a3)
    80002d98:	0007859b          	sext.w	a1,a5
    80002d9c:	0057571b          	srlw	a4,a4,0x5
    80002da0:	00f6f7b3          	and	a5,a3,a5
    80002da4:	0007879b          	sext.w	a5,a5
    80002da8:	06078e63          	beqz	a5,80002e24 <alloc_swap_slot+0xe4>
    80002dac:	0015071b          	addw	a4,a0,1
    80002db0:	0057579b          	srlw	a5,a4,0x5
    80002db4:	00279793          	sll	a5,a5,0x2
    80002db8:	0007051b          	sext.w	a0,a4
    80002dbc:	00f606b3          	add	a3,a2,a5
    80002dc0:	00ee17bb          	sllw	a5,t3,a4
    80002dc4:	fca898e3          	bne	a7,a0,80002d94 <alloc_swap_slot+0x54>
    80002dc8:	04030a63          	beqz	t1,80002e1c <alloc_swap_slot+0xdc>
    80002dcc:	00062683          	lw	a3,0(a2)
    80002dd0:	0016f513          	and	a0,a3,1
    80002dd4:	0a050063          	beqz	a0,80002e74 <alloc_swap_slot+0x134>
    80002dd8:	00000513          	li	a0,0
    80002ddc:	00100e13          	li	t3,1
    80002de0:	01c0006f          	j	80002dfc <alloc_swap_slot+0xbc>
    80002de4:	0006a683          	lw	a3,0(a3)
    80002de8:	00078e9b          	sext.w	t4,a5
    80002dec:	0057571b          	srlw	a4,a4,0x5
    80002df0:	00f6f7b3          	and	a5,a3,a5
    80002df4:	0007879b          	sext.w	a5,a5
    80002df8:	04078a63          	beqz	a5,80002e4c <alloc_swap_slot+0x10c>
    80002dfc:	0015071b          	addw	a4,a0,1
    80002e00:	0057579b          	srlw	a5,a4,0x5
    80002e04:	00279793          	sll	a5,a5,0x2
    80002e08:	0005059b          	sext.w	a1,a0
    80002e0c:	0007051b          	sext.w	a0,a4
    80002e10:	00f606b3          	add	a3,a2,a5
    80002e14:	00ee17bb          	sllw	a5,t3,a4
    80002e18:	fca316e3          	bne	t1,a0,80002de4 <alloc_swap_slot+0xa4>
    80002e1c:	fff00513          	li	a0,-1
    80002e20:	00008067          	ret
    80002e24:	0015079b          	addw	a5,a0,1
    80002e28:	0317f7bb          	remuw	a5,a5,a7
    80002e2c:	00271713          	sll	a4,a4,0x2
    80002e30:	00e60733          	add	a4,a2,a4
    80002e34:	00b6e6b3          	or	a3,a3,a1
    80002e38:	0018081b          	addw	a6,a6,1
    80002e3c:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    80002e40:	09062423          	sw	a6,136(a2)
    80002e44:	08f62023          	sw	a5,128(a2)
    80002e48:	00008067          	ret
    80002e4c:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    80002e50:	0315f5bb          	remuw	a1,a1,a7
    80002e54:	00271713          	sll	a4,a4,0x2
    80002e58:	00e60733          	add	a4,a2,a4
    80002e5c:	01d6e6b3          	or	a3,a3,t4
    80002e60:	0018081b          	addw	a6,a6,1
    80002e64:	00d72023          	sw	a3,0(a4)
    80002e68:	09062423          	sw	a6,136(a2)
    80002e6c:	08b62023          	sw	a1,128(a2)
    80002e70:	00008067          	ret
    80002e74:	00000713          	li	a4,0
    80002e78:	00100593          	li	a1,1
    80002e7c:	00100e93          	li	t4,1
    80002e80:	fd1ff06f          	j	80002e50 <alloc_swap_slot+0x110>

0000000080002e84 <free_swap_slot>:
    80002e84:	0000e717          	auipc	a4,0xe
    80002e88:	17c70713          	add	a4,a4,380 # 80011000 <swap_mgr>
    80002e8c:	08472783          	lw	a5,132(a4)
    80002e90:	04f57663          	bgeu	a0,a5,80002edc <free_swap_slot+0x58>
    80002e94:	0055579b          	srlw	a5,a0,0x5
    80002e98:	00279793          	sll	a5,a5,0x2
    80002e9c:	00f707b3          	add	a5,a4,a5
    80002ea0:	0007a583          	lw	a1,0(a5)
    80002ea4:	00100693          	li	a3,1
    80002ea8:	00a696bb          	sllw	a3,a3,a0
    80002eac:	00d5f633          	and	a2,a1,a3
    80002eb0:	0006061b          	sext.w	a2,a2
    80002eb4:	02060463          	beqz	a2,80002edc <free_swap_slot+0x58>
    80002eb8:	08872603          	lw	a2,136(a4)
    80002ebc:	fff6c693          	not	a3,a3
    80002ec0:	08072803          	lw	a6,128(a4)
    80002ec4:	00d5f5b3          	and	a1,a1,a3
    80002ec8:	fff6069b          	addw	a3,a2,-1
    80002ecc:	00b7a023          	sw	a1,0(a5)
    80002ed0:	08d72423          	sw	a3,136(a4)
    80002ed4:	01057463          	bgeu	a0,a6,80002edc <free_swap_slot+0x58>
    80002ed8:	08a72023          	sw	a0,128(a4)
    80002edc:	00008067          	ret

0000000080002ee0 <find_page_desc>:
    80002ee0:	fffff7b7          	lui	a5,0xfffff
    80002ee4:	00f57533          	and	a0,a0,a5
    80002ee8:	00000713          	li	a4,0
    80002eec:	0040e797          	auipc	a5,0x40e
    80002ef0:	1b478793          	add	a5,a5,436 # 804110a0 <lru_mgr+0x10>
    80002ef4:	10000613          	li	a2,256
    80002ef8:	0100006f          	j	80002f08 <find_page_desc+0x28>
    80002efc:	0017071b          	addw	a4,a4,1
    80002f00:	03078793          	add	a5,a5,48
    80002f04:	02c70a63          	beq	a4,a2,80002f38 <find_page_desc+0x58>
    80002f08:	0007b683          	ld	a3,0(a5)
    80002f0c:	fea698e3          	bne	a3,a0,80002efc <find_page_desc+0x1c>
    80002f10:	0147a683          	lw	a3,20(a5)
    80002f14:	0016f693          	and	a3,a3,1
    80002f18:	fe0682e3          	beqz	a3,80002efc <find_page_desc+0x1c>
    80002f1c:	00171513          	sll	a0,a4,0x1
    80002f20:	00e50533          	add	a0,a0,a4
    80002f24:	0040e797          	auipc	a5,0x40e
    80002f28:	17c78793          	add	a5,a5,380 # 804110a0 <lru_mgr+0x10>
    80002f2c:	00451513          	sll	a0,a0,0x4
    80002f30:	00f50533          	add	a0,a0,a5
    80002f34:	00008067          	ret
    80002f38:	00000513          	li	a0,0
    80002f3c:	00008067          	ret

0000000080002f40 <lru_add_page>:
    80002f40:	02050c63          	beqz	a0,80002f78 <lru_add_page+0x38>
    80002f44:	0040e717          	auipc	a4,0x40e
    80002f48:	14c70713          	add	a4,a4,332 # 80411090 <lru_mgr>
    80002f4c:	00073783          	ld	a5,0(a4)
    80002f50:	00053c23          	sd	zero,24(a0)
    80002f54:	02f53023          	sd	a5,32(a0)
    80002f58:	02078263          	beqz	a5,80002f7c <lru_add_page+0x3c>
    80002f5c:	00a7bc23          	sd	a0,24(a5)
    80002f60:	00411697          	auipc	a3,0x411
    80002f64:	13068693          	add	a3,a3,304 # 80414090 <lru_mgr+0x3000>
    80002f68:	0106a783          	lw	a5,16(a3)
    80002f6c:	00a73023          	sd	a0,0(a4)
    80002f70:	0017879b          	addw	a5,a5,1
    80002f74:	00f6a823          	sw	a5,16(a3)
    80002f78:	00008067          	ret
    80002f7c:	00a73423          	sd	a0,8(a4)
    80002f80:	fe1ff06f          	j	80002f60 <lru_add_page+0x20>

0000000080002f84 <lru_remove_page>:
    80002f84:	02050c63          	beqz	a0,80002fbc <lru_remove_page+0x38>
    80002f88:	01853783          	ld	a5,24(a0)
    80002f8c:	02053703          	ld	a4,32(a0)
    80002f90:	02078863          	beqz	a5,80002fc0 <lru_remove_page+0x3c>
    80002f94:	02e7b023          	sd	a4,32(a5)
    80002f98:	02070a63          	beqz	a4,80002fcc <lru_remove_page+0x48>
    80002f9c:	00f73c23          	sd	a5,24(a4)
    80002fa0:	00411717          	auipc	a4,0x411
    80002fa4:	0f070713          	add	a4,a4,240 # 80414090 <lru_mgr+0x3000>
    80002fa8:	01072783          	lw	a5,16(a4)
    80002fac:	02053023          	sd	zero,32(a0)
    80002fb0:	00053c23          	sd	zero,24(a0)
    80002fb4:	fff7879b          	addw	a5,a5,-1
    80002fb8:	00f72823          	sw	a5,16(a4)
    80002fbc:	00008067          	ret
    80002fc0:	0040e697          	auipc	a3,0x40e
    80002fc4:	0ce6b823          	sd	a4,208(a3) # 80411090 <lru_mgr>
    80002fc8:	fc071ae3          	bnez	a4,80002f9c <lru_remove_page+0x18>
    80002fcc:	0040e717          	auipc	a4,0x40e
    80002fd0:	0cf73623          	sd	a5,204(a4) # 80411098 <lru_mgr+0x8>
    80002fd4:	fcdff06f          	j	80002fa0 <lru_remove_page+0x1c>

0000000080002fd8 <lru_touch_page>:
    80002fd8:	fffff7b7          	lui	a5,0xfffff
    80002fdc:	00f57533          	and	a0,a0,a5
    80002fe0:	00000713          	li	a4,0
    80002fe4:	0040e797          	auipc	a5,0x40e
    80002fe8:	0bc78793          	add	a5,a5,188 # 804110a0 <lru_mgr+0x10>
    80002fec:	10000613          	li	a2,256
    80002ff0:	0100006f          	j	80003000 <lru_touch_page+0x28>
    80002ff4:	0017071b          	addw	a4,a4,1
    80002ff8:	03078793          	add	a5,a5,48
    80002ffc:	0ac70663          	beq	a4,a2,800030a8 <lru_touch_page+0xd0>
    80003000:	0007b683          	ld	a3,0(a5)
    80003004:	fea698e3          	bne	a3,a0,80002ff4 <lru_touch_page+0x1c>
    80003008:	0147a683          	lw	a3,20(a5)
    8000300c:	0016f693          	and	a3,a3,1
    80003010:	fe0682e3          	beqz	a3,80002ff4 <lru_touch_page+0x1c>
    80003014:	00171613          	sll	a2,a4,0x1
    80003018:	00e607b3          	add	a5,a2,a4
    8000301c:	0040e597          	auipc	a1,0x40e
    80003020:	07458593          	add	a1,a1,116 # 80411090 <lru_mgr>
    80003024:	00479793          	sll	a5,a5,0x4
    80003028:	00170513          	add	a0,a4,1
    8000302c:	00f58833          	add	a6,a1,a5
    80003030:	00151693          	sll	a3,a0,0x1
    80003034:	00a686b3          	add	a3,a3,a0
    80003038:	02883803          	ld	a6,40(a6)
    8000303c:	00469693          	sll	a3,a3,0x4
    80003040:	01078793          	add	a5,a5,16
    80003044:	00d586b3          	add	a3,a1,a3
    80003048:	0006b683          	ld	a3,0(a3)
    8000304c:	00f587b3          	add	a5,a1,a5
    80003050:	04080e63          	beqz	a6,800030ac <lru_touch_page+0xd4>
    80003054:	02d83023          	sd	a3,32(a6)
    80003058:	0005b883          	ld	a7,0(a1)
    8000305c:	04068c63          	beqz	a3,800030b4 <lru_touch_page+0xdc>
    80003060:	0106bc23          	sd	a6,24(a3)
    80003064:	00151693          	sll	a3,a0,0x1
    80003068:	00e60733          	add	a4,a2,a4
    8000306c:	00a686b3          	add	a3,a3,a0
    80003070:	00469693          	sll	a3,a3,0x4
    80003074:	00471713          	sll	a4,a4,0x4
    80003078:	00e58733          	add	a4,a1,a4
    8000307c:	00d586b3          	add	a3,a1,a3
    80003080:	00411617          	auipc	a2,0x411
    80003084:	01060613          	add	a2,a2,16 # 80414090 <lru_mgr+0x3000>
    80003088:	02073423          	sd	zero,40(a4)
    8000308c:	0116b023          	sd	a7,0(a3)
    80003090:	01062703          	lw	a4,16(a2)
    80003094:	02088463          	beqz	a7,800030bc <lru_touch_page+0xe4>
    80003098:	00f8bc23          	sd	a5,24(a7)
    8000309c:	00f5b023          	sd	a5,0(a1)
    800030a0:	00e62823          	sw	a4,16(a2)
    800030a4:	00008067          	ret
    800030a8:	00008067          	ret
    800030ac:	00068893          	mv	a7,a3
    800030b0:	fa0698e3          	bnez	a3,80003060 <lru_touch_page+0x88>
    800030b4:	0105b423          	sd	a6,8(a1)
    800030b8:	fadff06f          	j	80003064 <lru_touch_page+0x8c>
    800030bc:	00f5b423          	sd	a5,8(a1)
    800030c0:	00f5b023          	sd	a5,0(a1)
    800030c4:	00e62823          	sw	a4,16(a2)
    800030c8:	00008067          	ret

00000000800030cc <find_victim_page>:
    800030cc:	0040e517          	auipc	a0,0x40e
    800030d0:	fcc53503          	ld	a0,-52(a0) # 80411098 <lru_mgr+0x8>
    800030d4:	00008067          	ret

00000000800030d8 <swap_out_page>:
    800030d8:	16050263          	beqz	a0,8000323c <swap_out_page+0x164>
    800030dc:	fd010113          	add	sp,sp,-48
    800030e0:	00913c23          	sd	s1,24(sp)
    800030e4:	01452483          	lw	s1,20(a0)
    800030e8:	02813023          	sd	s0,32(sp)
    800030ec:	01313423          	sd	s3,8(sp)
    800030f0:	02113423          	sd	ra,40(sp)
    800030f4:	01213823          	sd	s2,16(sp)
    800030f8:	0014f793          	and	a5,s1,1
    800030fc:	00050413          	mv	s0,a0
    80003100:	00048993          	mv	s3,s1
    80003104:	12078863          	beqz	a5,80003234 <swap_out_page+0x15c>
    80003108:	c39ff0ef          	jal	80002d40 <alloc_swap_slot>
    8000310c:	0005091b          	sext.w	s2,a0
    80003110:	fff00793          	li	a5,-1
    80003114:	12f90063          	beq	s2,a5,80003234 <swap_out_page+0x15c>
    80003118:	0049f993          	and	s3,s3,4
    8000311c:	04098663          	beqz	s3,80003168 <swap_out_page+0x90>
    80003120:	00843683          	ld	a3,8(s0)
    80003124:	00c9171b          	sllw	a4,s2,0xc
    80003128:	0000e797          	auipc	a5,0xe
    8000312c:	f6878793          	add	a5,a5,-152 # 80011090 <swap_area>
    80003130:	02071713          	sll	a4,a4,0x20
    80003134:	02075713          	srl	a4,a4,0x20
    80003138:	40f686b3          	sub	a3,a3,a5
    8000313c:	0000f617          	auipc	a2,0xf
    80003140:	f5460613          	add	a2,a2,-172 # 80012090 <swap_area+0x1000>
    80003144:	00f707b3          	add	a5,a4,a5
    80003148:	00e60633          	add	a2,a2,a4
    8000314c:	40e686b3          	sub	a3,a3,a4
    80003150:	00f68733          	add	a4,a3,a5
    80003154:	00074703          	lbu	a4,0(a4)
    80003158:	00178793          	add	a5,a5,1
    8000315c:	fee78fa3          	sb	a4,-1(a5)
    80003160:	fec798e3          	bne	a5,a2,80003150 <swap_out_page+0x78>
    80003164:	01442483          	lw	s1,20(s0)
    80003168:	00043583          	ld	a1,0(s0)
    8000316c:	02843503          	ld	a0,40(s0)
    80003170:	e69fe0ef          	jal	80001fd8 <walk_lookup>
    80003174:	00050863          	beqz	a0,80003184 <swap_out_page+0xac>
    80003178:	00053783          	ld	a5,0(a0)
    8000317c:	0017f713          	and	a4,a5,1
    80003180:	08071063          	bnez	a4,80003200 <swap_out_page+0x128>
    80003184:	ffe4f793          	and	a5,s1,-2
    80003188:	0027e793          	or	a5,a5,2
    8000318c:	02091913          	sll	s2,s2,0x20
    80003190:	02079793          	sll	a5,a5,0x20
    80003194:	00843503          	ld	a0,8(s0)
    80003198:	02095913          	srl	s2,s2,0x20
    8000319c:	00f96933          	or	s2,s2,a5
    800031a0:	01243823          	sd	s2,16(s0)
    800031a4:	d4dfe0ef          	jal	80001ef0 <free_page>
    800031a8:	01843783          	ld	a5,24(s0)
    800031ac:	00043423          	sd	zero,8(s0)
    800031b0:	02043703          	ld	a4,32(s0)
    800031b4:	06078463          	beqz	a5,8000321c <swap_out_page+0x144>
    800031b8:	02e7b023          	sd	a4,32(a5)
    800031bc:	06070663          	beqz	a4,80003228 <swap_out_page+0x150>
    800031c0:	00f73c23          	sd	a5,24(a4)
    800031c4:	00411717          	auipc	a4,0x411
    800031c8:	ecc70713          	add	a4,a4,-308 # 80414090 <lru_mgr+0x3000>
    800031cc:	01072783          	lw	a5,16(a4)
    800031d0:	02043023          	sd	zero,32(s0)
    800031d4:	00043c23          	sd	zero,24(s0)
    800031d8:	fff7879b          	addw	a5,a5,-1
    800031dc:	00f72823          	sw	a5,16(a4)
    800031e0:	00000513          	li	a0,0
    800031e4:	02813083          	ld	ra,40(sp)
    800031e8:	02013403          	ld	s0,32(sp)
    800031ec:	01813483          	ld	s1,24(sp)
    800031f0:	01013903          	ld	s2,16(sp)
    800031f4:	00813983          	ld	s3,8(sp)
    800031f8:	03010113          	add	sp,sp,48
    800031fc:	00008067          	ret
    80003200:	00a9171b          	sllw	a4,s2,0xa
    80003204:	02071713          	sll	a4,a4,0x20
    80003208:	ffe7f793          	and	a5,a5,-2
    8000320c:	02075713          	srl	a4,a4,0x20
    80003210:	00e7e7b3          	or	a5,a5,a4
    80003214:	00f53023          	sd	a5,0(a0)
    80003218:	f6dff06f          	j	80003184 <swap_out_page+0xac>
    8000321c:	0040e697          	auipc	a3,0x40e
    80003220:	e6e6ba23          	sd	a4,-396(a3) # 80411090 <lru_mgr>
    80003224:	f8071ee3          	bnez	a4,800031c0 <swap_out_page+0xe8>
    80003228:	0040e717          	auipc	a4,0x40e
    8000322c:	e6f73823          	sd	a5,-400(a4) # 80411098 <lru_mgr+0x8>
    80003230:	f95ff06f          	j	800031c4 <swap_out_page+0xec>
    80003234:	fff00513          	li	a0,-1
    80003238:	fadff06f          	j	800031e4 <swap_out_page+0x10c>
    8000323c:	fff00513          	li	a0,-1
    80003240:	00008067          	ret

0000000080003244 <swap_in_page>:
    80003244:	12050263          	beqz	a0,80003368 <swap_in_page+0x124>
    80003248:	01452783          	lw	a5,20(a0)
    8000324c:	fe010113          	add	sp,sp,-32
    80003250:	00813823          	sd	s0,16(sp)
    80003254:	00113c23          	sd	ra,24(sp)
    80003258:	00913423          	sd	s1,8(sp)
    8000325c:	0027f793          	and	a5,a5,2
    80003260:	00050413          	mv	s0,a0
    80003264:	0e078e63          	beqz	a5,80003360 <swap_in_page+0x11c>
    80003268:	01052703          	lw	a4,16(a0)
    8000326c:	0000e797          	auipc	a5,0xe
    80003270:	e2478793          	add	a5,a5,-476 # 80011090 <swap_area>
    80003274:	40f58633          	sub	a2,a1,a5
    80003278:	00c7171b          	sllw	a4,a4,0xc
    8000327c:	02071713          	sll	a4,a4,0x20
    80003280:	02075713          	srl	a4,a4,0x20
    80003284:	0000f817          	auipc	a6,0xf
    80003288:	e0c80813          	add	a6,a6,-500 # 80012090 <swap_area+0x1000>
    8000328c:	00058493          	mv	s1,a1
    80003290:	00f707b3          	add	a5,a4,a5
    80003294:	00e80833          	add	a6,a6,a4
    80003298:	40e60633          	sub	a2,a2,a4
    8000329c:	0007c683          	lbu	a3,0(a5)
    800032a0:	00f60733          	add	a4,a2,a5
    800032a4:	00178793          	add	a5,a5,1
    800032a8:	00d70023          	sb	a3,0(a4)
    800032ac:	ff0798e3          	bne	a5,a6,8000329c <swap_in_page+0x58>
    800032b0:	00043583          	ld	a1,0(s0)
    800032b4:	02843503          	ld	a0,40(s0)
    800032b8:	d21fe0ef          	jal	80001fd8 <walk_lookup>
    800032bc:	02050063          	beqz	a0,800032dc <swap_in_page+0x98>
    800032c0:	00053703          	ld	a4,0(a0)
    800032c4:	00c4d793          	srl	a5,s1,0xc
    800032c8:	00a79793          	sll	a5,a5,0xa
    800032cc:	01e77713          	and	a4,a4,30
    800032d0:	00e7e7b3          	or	a5,a5,a4
    800032d4:	0017e793          	or	a5,a5,1
    800032d8:	00f53023          	sd	a5,0(a0)
    800032dc:	01442783          	lw	a5,20(s0)
    800032e0:	01042503          	lw	a0,16(s0)
    800032e4:	00943423          	sd	s1,8(s0)
    800032e8:	ffd7f793          	and	a5,a5,-3
    800032ec:	0017e793          	or	a5,a5,1
    800032f0:	00f42a23          	sw	a5,20(s0)
    800032f4:	0000e797          	auipc	a5,0xe
    800032f8:	d907a783          	lw	a5,-624(a5) # 80011084 <swap_mgr+0x84>
    800032fc:	00f57463          	bgeu	a0,a5,80003304 <swap_in_page+0xc0>
    80003300:	d4dfe0ef          	jal	8000204c <free_swap_slot.part.0>
    80003304:	0040e717          	auipc	a4,0x40e
    80003308:	d8c70713          	add	a4,a4,-628 # 80411090 <lru_mgr>
    8000330c:	00073783          	ld	a5,0(a4)
    80003310:	fff00693          	li	a3,-1
    80003314:	00d42823          	sw	a3,16(s0)
    80003318:	02f43023          	sd	a5,32(s0)
    8000331c:	00043c23          	sd	zero,24(s0)
    80003320:	02078c63          	beqz	a5,80003358 <swap_in_page+0x114>
    80003324:	0087bc23          	sd	s0,24(a5)
    80003328:	00411697          	auipc	a3,0x411
    8000332c:	d6868693          	add	a3,a3,-664 # 80414090 <lru_mgr+0x3000>
    80003330:	0106a783          	lw	a5,16(a3)
    80003334:	00873023          	sd	s0,0(a4)
    80003338:	00000513          	li	a0,0
    8000333c:	0017879b          	addw	a5,a5,1
    80003340:	00f6a823          	sw	a5,16(a3)
    80003344:	01813083          	ld	ra,24(sp)
    80003348:	01013403          	ld	s0,16(sp)
    8000334c:	00813483          	ld	s1,8(sp)
    80003350:	02010113          	add	sp,sp,32
    80003354:	00008067          	ret
    80003358:	00873423          	sd	s0,8(a4)
    8000335c:	fcdff06f          	j	80003328 <swap_in_page+0xe4>
    80003360:	fff00513          	li	a0,-1
    80003364:	fe1ff06f          	j	80003344 <swap_in_page+0x100>
    80003368:	fff00513          	li	a0,-1
    8000336c:	00008067          	ret

0000000080003370 <handle_page_fault>:
    80003370:	fd010113          	add	sp,sp,-48
    80003374:	fffff7b7          	lui	a5,0xfffff
    80003378:	02813023          	sd	s0,32(sp)
    8000337c:	00f5f433          	and	s0,a1,a5
    80003380:	00040593          	mv	a1,s0
    80003384:	01213823          	sd	s2,16(sp)
    80003388:	02113423          	sd	ra,40(sp)
    8000338c:	00913c23          	sd	s1,24(sp)
    80003390:	01313423          	sd	s3,8(sp)
    80003394:	00050913          	mv	s2,a0
    80003398:	c41fe0ef          	jal	80001fd8 <walk_lookup>
    8000339c:	12050c63          	beqz	a0,800034d4 <handle_page_fault+0x164>
    800033a0:	00053483          	ld	s1,0(a0)
    800033a4:	0014f793          	and	a5,s1,1
    800033a8:	12079663          	bnez	a5,800034d4 <handle_page_fault+0x164>
    800033ac:	12048463          	beqz	s1,800034d4 <handle_page_fault+0x164>
    800033b0:	00a4d493          	srl	s1,s1,0xa
    800033b4:	b21fe0ef          	jal	80001ed4 <alloc_page>
    800033b8:	0004849b          	sext.w	s1,s1
    800033bc:	00050993          	mv	s3,a0
    800033c0:	0e050a63          	beqz	a0,800034b4 <handle_page_fault+0x144>
    800033c4:	0040e797          	auipc	a5,0x40e
    800033c8:	cdc78793          	add	a5,a5,-804 # 804110a0 <lru_mgr+0x10>
    800033cc:	00000713          	li	a4,0
    800033d0:	10000613          	li	a2,256
    800033d4:	0100006f          	j	800033e4 <handle_page_fault+0x74>
    800033d8:	0017071b          	addw	a4,a4,1
    800033dc:	03078793          	add	a5,a5,48
    800033e0:	06c70063          	beq	a4,a2,80003440 <handle_page_fault+0xd0>
    800033e4:	0007b683          	ld	a3,0(a5)
    800033e8:	fe8698e3          	bne	a3,s0,800033d8 <handle_page_fault+0x68>
    800033ec:	0147a683          	lw	a3,20(a5)
    800033f0:	0026f693          	and	a3,a3,2
    800033f4:	fe0682e3          	beqz	a3,800033d8 <handle_page_fault+0x68>
    800033f8:	0107a683          	lw	a3,16(a5)
    800033fc:	fc969ee3          	bne	a3,s1,800033d8 <handle_page_fault+0x68>
    80003400:	00171513          	sll	a0,a4,0x1
    80003404:	00e50533          	add	a0,a0,a4
    80003408:	00451513          	sll	a0,a0,0x4
    8000340c:	0040e797          	auipc	a5,0x40e
    80003410:	c9478793          	add	a5,a5,-876 # 804110a0 <lru_mgr+0x10>
    80003414:	00f50533          	add	a0,a0,a5
    80003418:	00098593          	mv	a1,s3
    8000341c:	e29ff0ef          	jal	80003244 <swap_in_page>
    80003420:	0a051e63          	bnez	a0,800034dc <handle_page_fault+0x16c>
    80003424:	02813083          	ld	ra,40(sp)
    80003428:	02013403          	ld	s0,32(sp)
    8000342c:	01813483          	ld	s1,24(sp)
    80003430:	01013903          	ld	s2,16(sp)
    80003434:	00813983          	ld	s3,8(sp)
    80003438:	03010113          	add	sp,sp,48
    8000343c:	00008067          	ret
    80003440:	0040e717          	auipc	a4,0x40e
    80003444:	c7470713          	add	a4,a4,-908 # 804110b4 <lru_mgr+0x24>
    80003448:	00000793          	li	a5,0
    8000344c:	10000613          	li	a2,256
    80003450:	00c0006f          	j	8000345c <handle_page_fault+0xec>
    80003454:	0017879b          	addw	a5,a5,1
    80003458:	08c78263          	beq	a5,a2,800034dc <handle_page_fault+0x16c>
    8000345c:	00072683          	lw	a3,0(a4)
    80003460:	03070713          	add	a4,a4,48
    80003464:	fe0698e3          	bnez	a3,80003454 <handle_page_fault+0xe4>
    80003468:	00178613          	add	a2,a5,1
    8000346c:	00179713          	sll	a4,a5,0x1
    80003470:	00161693          	sll	a3,a2,0x1
    80003474:	00f707b3          	add	a5,a4,a5
    80003478:	00479793          	sll	a5,a5,0x4
    8000347c:	00c68733          	add	a4,a3,a2
    80003480:	0040e617          	auipc	a2,0x40e
    80003484:	c1060613          	add	a2,a2,-1008 # 80411090 <lru_mgr>
    80003488:	00f606b3          	add	a3,a2,a5
    8000348c:	00471713          	sll	a4,a4,0x4
    80003490:	01078793          	add	a5,a5,16
    80003494:	00e60733          	add	a4,a2,a4
    80003498:	00c78533          	add	a0,a5,a2
    8000349c:	00200793          	li	a5,2
    800034a0:	0086b823          	sd	s0,16(a3)
    800034a4:	01273423          	sd	s2,8(a4)
    800034a8:	0296a023          	sw	s1,32(a3)
    800034ac:	02f6a223          	sw	a5,36(a3)
    800034b0:	f69ff06f          	j	80003418 <handle_page_fault+0xa8>
    800034b4:	0040e517          	auipc	a0,0x40e
    800034b8:	be453503          	ld	a0,-1052(a0) # 80411098 <lru_mgr+0x8>
    800034bc:	00050c63          	beqz	a0,800034d4 <handle_page_fault+0x164>
    800034c0:	c19ff0ef          	jal	800030d8 <swap_out_page>
    800034c4:	00051863          	bnez	a0,800034d4 <handle_page_fault+0x164>
    800034c8:	a0dfe0ef          	jal	80001ed4 <alloc_page>
    800034cc:	00050993          	mv	s3,a0
    800034d0:	ee051ae3          	bnez	a0,800033c4 <handle_page_fault+0x54>
    800034d4:	fff00513          	li	a0,-1
    800034d8:	f4dff06f          	j	80003424 <handle_page_fault+0xb4>
    800034dc:	00098513          	mv	a0,s3
    800034e0:	a11fe0ef          	jal	80001ef0 <free_page>
    800034e4:	fff00513          	li	a0,-1
    800034e8:	f3dff06f          	j	80003424 <handle_page_fault+0xb4>

00000000800034ec <va2pa_with_replacement>:
    800034ec:	fe010113          	add	sp,sp,-32
    800034f0:	00913423          	sd	s1,8(sp)
    800034f4:	01213023          	sd	s2,0(sp)
    800034f8:	00113c23          	sd	ra,24(sp)
    800034fc:	00813823          	sd	s0,16(sp)
    80003500:	00050493          	mv	s1,a0
    80003504:	00058913          	mv	s2,a1
    80003508:	ad1fe0ef          	jal	80001fd8 <walk_lookup>
    8000350c:	00050a63          	beqz	a0,80003520 <va2pa_with_replacement+0x34>
    80003510:	00053403          	ld	s0,0(a0)
    80003514:	00147793          	and	a5,s0,1
    80003518:	06079663          	bnez	a5,80003584 <va2pa_with_replacement+0x98>
    8000351c:	02041063          	bnez	s0,8000353c <va2pa_with_replacement+0x50>
    80003520:	00000513          	li	a0,0
    80003524:	01813083          	ld	ra,24(sp)
    80003528:	01013403          	ld	s0,16(sp)
    8000352c:	00813483          	ld	s1,8(sp)
    80003530:	00013903          	ld	s2,0(sp)
    80003534:	02010113          	add	sp,sp,32
    80003538:	00008067          	ret
    8000353c:	00600613          	li	a2,6
    80003540:	00090593          	mv	a1,s2
    80003544:	00048513          	mv	a0,s1
    80003548:	e29ff0ef          	jal	80003370 <handle_page_fault>
    8000354c:	fc051ae3          	bnez	a0,80003520 <va2pa_with_replacement+0x34>
    80003550:	00090593          	mv	a1,s2
    80003554:	00048513          	mv	a0,s1
    80003558:	a81fe0ef          	jal	80001fd8 <walk_lookup>
    8000355c:	fc0502e3          	beqz	a0,80003520 <va2pa_with_replacement+0x34>
    80003560:	00053783          	ld	a5,0(a0)
    80003564:	0017f713          	and	a4,a5,1
    80003568:	fa070ce3          	beqz	a4,80003520 <va2pa_with_replacement+0x34>
    8000356c:	00a7d793          	srl	a5,a5,0xa
    80003570:	03491593          	sll	a1,s2,0x34
    80003574:	00c79513          	sll	a0,a5,0xc
    80003578:	0345d593          	srl	a1,a1,0x34
    8000357c:	00b50533          	add	a0,a0,a1
    80003580:	fa5ff06f          	j	80003524 <va2pa_with_replacement+0x38>
    80003584:	00090513          	mv	a0,s2
    80003588:	a51ff0ef          	jal	80002fd8 <lru_touch_page>
    8000358c:	01813083          	ld	ra,24(sp)
    80003590:	00a45513          	srl	a0,s0,0xa
    80003594:	01013403          	ld	s0,16(sp)
    80003598:	03491593          	sll	a1,s2,0x34
    8000359c:	00c51513          	sll	a0,a0,0xc
    800035a0:	0345d593          	srl	a1,a1,0x34
    800035a4:	00813483          	ld	s1,8(sp)
    800035a8:	00013903          	ld	s2,0(sp)
    800035ac:	00b50533          	add	a0,a0,a1
    800035b0:	02010113          	add	sp,sp,32
    800035b4:	00008067          	ret

00000000800035b8 <safe_copyout>:
    800035b8:	14068063          	beqz	a3,800036f8 <safe_copyout+0x140>
    800035bc:	fb010113          	add	sp,sp,-80
    800035c0:	02913c23          	sd	s1,56(sp)
    800035c4:	03213823          	sd	s2,48(sp)
    800035c8:	03313423          	sd	s3,40(sp)
    800035cc:	03413023          	sd	s4,32(sp)
    800035d0:	01513c23          	sd	s5,24(sp)
    800035d4:	01613823          	sd	s6,16(sp)
    800035d8:	01713423          	sd	s7,8(sp)
    800035dc:	01813023          	sd	s8,0(sp)
    800035e0:	04113423          	sd	ra,72(sp)
    800035e4:	04813023          	sd	s0,64(sp)
    800035e8:	00068b13          	mv	s6,a3
    800035ec:	00050993          	mv	s3,a0
    800035f0:	00058c13          	mv	s8,a1
    800035f4:	00060b93          	mv	s7,a2
    800035f8:	fffffa37          	lui	s4,0xfffff
    800035fc:	00001937          	lui	s2,0x1
    80003600:	10000493          	li	s1,256
    80003604:	0040ea97          	auipc	s5,0x40e
    80003608:	a8ca8a93          	add	s5,s5,-1396 # 80411090 <lru_mgr>
    8000360c:	014c7433          	and	s0,s8,s4
    80003610:	00040593          	mv	a1,s0
    80003614:	00098513          	mv	a0,s3
    80003618:	ed5ff0ef          	jal	800034ec <va2pa_with_replacement>
    8000361c:	0c050a63          	beqz	a0,800036f0 <safe_copyout+0x138>
    80003620:	41840833          	sub	a6,s0,s8
    80003624:	01280833          	add	a6,a6,s2
    80003628:	010b7463          	bgeu	s6,a6,80003630 <safe_copyout+0x78>
    8000362c:	000b0813          	mv	a6,s6
    80003630:	01850733          	add	a4,a0,s8
    80003634:	40870733          	sub	a4,a4,s0
    80003638:	01780533          	add	a0,a6,s7
    8000363c:	000b8793          	mv	a5,s7
    80003640:	41770733          	sub	a4,a4,s7
    80003644:	0a080263          	beqz	a6,800036e8 <safe_copyout+0x130>
    80003648:	0007c583          	lbu	a1,0(a5)
    8000364c:	00f70633          	add	a2,a4,a5
    80003650:	00178793          	add	a5,a5,1
    80003654:	00b60023          	sb	a1,0(a2)
    80003658:	fef518e3          	bne	a0,a5,80003648 <safe_copyout+0x90>
    8000365c:	0040e797          	auipc	a5,0x40e
    80003660:	a4478793          	add	a5,a5,-1468 # 804110a0 <lru_mgr+0x10>
    80003664:	00000713          	li	a4,0
    80003668:	0100006f          	j	80003678 <safe_copyout+0xc0>
    8000366c:	0017071b          	addw	a4,a4,1
    80003670:	03078793          	add	a5,a5,48
    80003674:	02970863          	beq	a4,s1,800036a4 <safe_copyout+0xec>
    80003678:	0007b603          	ld	a2,0(a5)
    8000367c:	fec418e3          	bne	s0,a2,8000366c <safe_copyout+0xb4>
    80003680:	0147a603          	lw	a2,20(a5)
    80003684:	00167593          	and	a1,a2,1
    80003688:	fe0582e3          	beqz	a1,8000366c <safe_copyout+0xb4>
    8000368c:	00171793          	sll	a5,a4,0x1
    80003690:	00e787b3          	add	a5,a5,a4
    80003694:	00479793          	sll	a5,a5,0x4
    80003698:	00fa87b3          	add	a5,s5,a5
    8000369c:	00466613          	or	a2,a2,4
    800036a0:	02c7a223          	sw	a2,36(a5)
    800036a4:	410b0b33          	sub	s6,s6,a6
    800036a8:	00050b93          	mv	s7,a0
    800036ac:	01240c33          	add	s8,s0,s2
    800036b0:	f40b1ee3          	bnez	s6,8000360c <safe_copyout+0x54>
    800036b4:	00000513          	li	a0,0
    800036b8:	04813083          	ld	ra,72(sp)
    800036bc:	04013403          	ld	s0,64(sp)
    800036c0:	03813483          	ld	s1,56(sp)
    800036c4:	03013903          	ld	s2,48(sp)
    800036c8:	02813983          	ld	s3,40(sp)
    800036cc:	02013a03          	ld	s4,32(sp)
    800036d0:	01813a83          	ld	s5,24(sp)
    800036d4:	01013b03          	ld	s6,16(sp)
    800036d8:	00813b83          	ld	s7,8(sp)
    800036dc:	00013c03          	ld	s8,0(sp)
    800036e0:	05010113          	add	sp,sp,80
    800036e4:	00008067          	ret
    800036e8:	000b8513          	mv	a0,s7
    800036ec:	f71ff06f          	j	8000365c <safe_copyout+0xa4>
    800036f0:	fff00513          	li	a0,-1
    800036f4:	fc5ff06f          	j	800036b8 <safe_copyout+0x100>
    800036f8:	00000513          	li	a0,0
    800036fc:	00008067          	ret

0000000080003700 <safe_copyin>:
    80003700:	0e068863          	beqz	a3,800037f0 <safe_copyin+0xf0>
    80003704:	fc010113          	add	sp,sp,-64
    80003708:	02813823          	sd	s0,48(sp)
    8000370c:	02913423          	sd	s1,40(sp)
    80003710:	03213023          	sd	s2,32(sp)
    80003714:	01313c23          	sd	s3,24(sp)
    80003718:	01513423          	sd	s5,8(sp)
    8000371c:	01613023          	sd	s6,0(sp)
    80003720:	02113c23          	sd	ra,56(sp)
    80003724:	01413823          	sd	s4,16(sp)
    80003728:	00068b13          	mv	s6,a3
    8000372c:	00050493          	mv	s1,a0
    80003730:	00058993          	mv	s3,a1
    80003734:	00060a93          	mv	s5,a2
    80003738:	fffff937          	lui	s2,0xfffff
    8000373c:	00001437          	lui	s0,0x1
    80003740:	012afa33          	and	s4,s5,s2
    80003744:	000a0593          	mv	a1,s4
    80003748:	00048513          	mv	a0,s1
    8000374c:	da1ff0ef          	jal	800034ec <va2pa_with_replacement>
    80003750:	08050c63          	beqz	a0,800037e8 <safe_copyin+0xe8>
    80003754:	415a08b3          	sub	a7,s4,s5
    80003758:	008888b3          	add	a7,a7,s0
    8000375c:	011b7463          	bgeu	s6,a7,80003764 <safe_copyin+0x64>
    80003760:	000b0893          	mv	a7,s6
    80003764:	01550533          	add	a0,a0,s5
    80003768:	41450533          	sub	a0,a0,s4
    8000376c:	06088063          	beqz	a7,800037cc <safe_copyin+0xcc>
    80003770:	00098793          	mv	a5,s3
    80003774:	01198833          	add	a6,s3,a7
    80003778:	41350733          	sub	a4,a0,s3
    8000377c:	00f70633          	add	a2,a4,a5
    80003780:	00064603          	lbu	a2,0(a2)
    80003784:	00178793          	add	a5,a5,1
    80003788:	fec78fa3          	sb	a2,-1(a5)
    8000378c:	fef818e3          	bne	a6,a5,8000377c <safe_copyin+0x7c>
    80003790:	411b0b33          	sub	s6,s6,a7
    80003794:	00080993          	mv	s3,a6
    80003798:	008a0ab3          	add	s5,s4,s0
    8000379c:	fa0b12e3          	bnez	s6,80003740 <safe_copyin+0x40>
    800037a0:	00000513          	li	a0,0
    800037a4:	03813083          	ld	ra,56(sp)
    800037a8:	03013403          	ld	s0,48(sp)
    800037ac:	02813483          	ld	s1,40(sp)
    800037b0:	02013903          	ld	s2,32(sp)
    800037b4:	01813983          	ld	s3,24(sp)
    800037b8:	01013a03          	ld	s4,16(sp)
    800037bc:	00813a83          	ld	s5,8(sp)
    800037c0:	00013b03          	ld	s6,0(sp)
    800037c4:	04010113          	add	sp,sp,64
    800037c8:	00008067          	ret
    800037cc:	00001ab7          	lui	s5,0x1
    800037d0:	015a0ab3          	add	s5,s4,s5
    800037d4:	012afa33          	and	s4,s5,s2
    800037d8:	000a0593          	mv	a1,s4
    800037dc:	00048513          	mv	a0,s1
    800037e0:	d0dff0ef          	jal	800034ec <va2pa_with_replacement>
    800037e4:	f60518e3          	bnez	a0,80003754 <safe_copyin+0x54>
    800037e8:	fff00513          	li	a0,-1
    800037ec:	fb9ff06f          	j	800037a4 <safe_copyin+0xa4>
    800037f0:	00000513          	li	a0,0
    800037f4:	00008067          	ret

00000000800037f8 <test_page_replacement>:
    800037f8:	f4010113          	add	sp,sp,-192
    800037fc:	00004517          	auipc	a0,0x4
    80003800:	7e450513          	add	a0,a0,2020 # 80007fe0 <digits+0x68>
    80003804:	0a113c23          	sd	ra,184(sp)
    80003808:	0a813823          	sd	s0,176(sp)
    8000380c:	0a913423          	sd	s1,168(sp)
    80003810:	0b213023          	sd	s2,160(sp)
    80003814:	09313c23          	sd	s3,152(sp)
    80003818:	e10fe0ef          	jal	80001e28 <uart_puts>
    8000381c:	00004517          	auipc	a0,0x4
    80003820:	7ec50513          	add	a0,a0,2028 # 80008008 <digits+0x90>
    80003824:	e04fe0ef          	jal	80001e28 <uart_puts>
    80003828:	d18ff0ef          	jal	80002d40 <alloc_swap_slot>
    8000382c:	0005049b          	sext.w	s1,a0
    80003830:	d10ff0ef          	jal	80002d40 <alloc_swap_slot>
    80003834:	0005041b          	sext.w	s0,a0
    80003838:	d08ff0ef          	jal	80002d40 <alloc_swap_slot>
    8000383c:	fff00793          	li	a5,-1
    80003840:	02f48663          	beq	s1,a5,8000386c <test_page_replacement+0x74>
    80003844:	1cf40c63          	beq	s0,a5,80003a1c <test_page_replacement+0x224>
    80003848:	0005051b          	sext.w	a0,a0
    8000384c:	02f50063          	beq	a0,a5,8000386c <test_page_replacement+0x74>
    80003850:	00848e63          	beq	s1,s0,8000386c <test_page_replacement+0x74>
    80003854:	00a40c63          	beq	s0,a0,8000386c <test_page_replacement+0x74>
    80003858:	00a48a63          	beq	s1,a0,8000386c <test_page_replacement+0x74>
    8000385c:	00004517          	auipc	a0,0x4
    80003860:	7d450513          	add	a0,a0,2004 # 80008030 <digits+0xb8>
    80003864:	dc4fe0ef          	jal	80001e28 <uart_puts>
    80003868:	0100006f          	j	80003878 <test_page_replacement+0x80>
    8000386c:	00004517          	auipc	a0,0x4
    80003870:	7e450513          	add	a0,a0,2020 # 80008050 <digits+0xd8>
    80003874:	db4fe0ef          	jal	80001e28 <uart_puts>
    80003878:	0000e797          	auipc	a5,0xe
    8000387c:	80c7a783          	lw	a5,-2036(a5) # 80011084 <swap_mgr+0x84>
    80003880:	00f47663          	bgeu	s0,a5,8000388c <test_page_replacement+0x94>
    80003884:	00040513          	mv	a0,s0
    80003888:	fc4fe0ef          	jal	8000204c <free_swap_slot.part.0>
    8000388c:	cb4ff0ef          	jal	80002d40 <alloc_swap_slot>
    80003890:	0005051b          	sext.w	a0,a0
    80003894:	14a40c63          	beq	s0,a0,800039ec <test_page_replacement+0x1f4>
    80003898:	00005517          	auipc	a0,0x5
    8000389c:	80050513          	add	a0,a0,-2048 # 80008098 <digits+0x120>
    800038a0:	d88fe0ef          	jal	80001e28 <uart_puts>
    800038a4:	00005517          	auipc	a0,0x5
    800038a8:	81c50513          	add	a0,a0,-2020 # 800080c0 <digits+0x148>
    800038ac:	d7cfe0ef          	jal	80001e28 <uart_puts>
    800038b0:	00080737          	lui	a4,0x80
    800038b4:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    800038b8:	00010637          	lui	a2,0x10
    800038bc:	00c71713          	sll	a4,a4,0xc
    800038c0:	fff00793          	li	a5,-1
    800038c4:	01f7d793          	srl	a5,a5,0x1f
    800038c8:	00c13023          	sd	a2,0(sp)
    800038cc:	02e13c23          	sd	a4,56(sp)
    800038d0:	00100613          	li	a2,1
    800038d4:	00012737          	lui	a4,0x12
    800038d8:	01f61613          	sll	a2,a2,0x1f
    800038dc:	00f13823          	sd	a5,16(sp)
    800038e0:	04f13023          	sd	a5,64(sp)
    800038e4:	06e13023          	sd	a4,96(sp)
    800038e8:	06f13823          	sd	a5,112(sp)
    800038ec:	40001737          	lui	a4,0x40001
    800038f0:	03010793          	add	a5,sp,48
    800038f4:	00423697          	auipc	a3,0x423
    800038f8:	94c6b683          	ld	a3,-1716(a3) # 80426240 <kernel_pagetable>
    800038fc:	00171713          	sll	a4,a4,0x1
    80003900:	0040d417          	auipc	s0,0x40d
    80003904:	79040413          	add	s0,s0,1936 # 80411090 <lru_mgr>
    80003908:	00010493          	mv	s1,sp
    8000390c:	06010993          	add	s3,sp,96
    80003910:	00c13423          	sd	a2,8(sp)
    80003914:	00f13c23          	sd	a5,24(sp)
    80003918:	00011637          	lui	a2,0x11
    8000391c:	08f13023          	sd	a5,128(sp)
    80003920:	00410917          	auipc	s2,0x410
    80003924:	77090913          	add	s2,s2,1904 # 80414090 <lru_mgr+0x3000>
    80003928:	00300793          	li	a5,3
    8000392c:	00004517          	auipc	a0,0x4
    80003930:	7b450513          	add	a0,a0,1972 # 800080e0 <digits+0x168>
    80003934:	06e13423          	sd	a4,104(sp)
    80003938:	00f92823          	sw	a5,16(s2)
    8000393c:	02013023          	sd	zero,32(sp)
    80003940:	02d13423          	sd	a3,40(sp)
    80003944:	02c13823          	sd	a2,48(sp)
    80003948:	04d13c23          	sd	a3,88(sp)
    8000394c:	06013c23          	sd	zero,120(sp)
    80003950:	08d13423          	sd	a3,136(sp)
    80003954:	00943423          	sd	s1,8(s0)
    80003958:	04913823          	sd	s1,80(sp)
    8000395c:	05313423          	sd	s3,72(sp)
    80003960:	01343023          	sd	s3,0(s0)
    80003964:	cc4fe0ef          	jal	80001e28 <uart_puts>
    80003968:	04813783          	ld	a5,72(sp)
    8000396c:	05013703          	ld	a4,80(sp)
    80003970:	08078a63          	beqz	a5,80003a04 <test_page_replacement+0x20c>
    80003974:	02e7b023          	sd	a4,32(a5)
    80003978:	08070263          	beqz	a4,800039fc <test_page_replacement+0x204>
    8000397c:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    80003980:	01092783          	lw	a5,16(s2)
    80003984:	04013823          	sd	zero,80(sp)
    80003988:	04013423          	sd	zero,72(sp)
    8000398c:	fff7871b          	addw	a4,a5,-1
    80003990:	00e92823          	sw	a4,16(s2)
    80003994:	00200793          	li	a5,2
    80003998:	00f71663          	bne	a4,a5,800039a4 <test_page_replacement+0x1ac>
    8000399c:	00043783          	ld	a5,0(s0)
    800039a0:	09378663          	beq	a5,s3,80003a2c <test_page_replacement+0x234>
    800039a4:	00004517          	auipc	a0,0x4
    800039a8:	77c50513          	add	a0,a0,1916 # 80008120 <digits+0x1a8>
    800039ac:	c7cfe0ef          	jal	80001e28 <uart_puts>
    800039b0:	00843783          	ld	a5,8(s0)
    800039b4:	04978c63          	beq	a5,s1,80003a0c <test_page_replacement+0x214>
    800039b8:	00004517          	auipc	a0,0x4
    800039bc:	7a850513          	add	a0,a0,1960 # 80008160 <digits+0x1e8>
    800039c0:	c68fe0ef          	jal	80001e28 <uart_puts>
    800039c4:	00004517          	auipc	a0,0x4
    800039c8:	7bc50513          	add	a0,a0,1980 # 80008180 <digits+0x208>
    800039cc:	c5cfe0ef          	jal	80001e28 <uart_puts>
    800039d0:	0b813083          	ld	ra,184(sp)
    800039d4:	0b013403          	ld	s0,176(sp)
    800039d8:	0a813483          	ld	s1,168(sp)
    800039dc:	0a013903          	ld	s2,160(sp)
    800039e0:	09813983          	ld	s3,152(sp)
    800039e4:	0c010113          	add	sp,sp,192
    800039e8:	00008067          	ret
    800039ec:	00004517          	auipc	a0,0x4
    800039f0:	68450513          	add	a0,a0,1668 # 80008070 <digits+0xf8>
    800039f4:	c34fe0ef          	jal	80001e28 <uart_puts>
    800039f8:	eadff06f          	j	800038a4 <test_page_replacement+0xac>
    800039fc:	00f43423          	sd	a5,8(s0)
    80003a00:	f81ff06f          	j	80003980 <test_page_replacement+0x188>
    80003a04:	00e43023          	sd	a4,0(s0)
    80003a08:	f71ff06f          	j	80003978 <test_page_replacement+0x180>
    80003a0c:	00004517          	auipc	a0,0x4
    80003a10:	73450513          	add	a0,a0,1844 # 80008140 <digits+0x1c8>
    80003a14:	c14fe0ef          	jal	80001e28 <uart_puts>
    80003a18:	fadff06f          	j	800039c4 <test_page_replacement+0x1cc>
    80003a1c:	00004517          	auipc	a0,0x4
    80003a20:	63450513          	add	a0,a0,1588 # 80008050 <digits+0xd8>
    80003a24:	c04fe0ef          	jal	80001e28 <uart_puts>
    80003a28:	e65ff06f          	j	8000388c <test_page_replacement+0x94>
    80003a2c:	00843783          	ld	a5,8(s0)
    80003a30:	f6979ae3          	bne	a5,s1,800039a4 <test_page_replacement+0x1ac>
    80003a34:	00004517          	auipc	a0,0x4
    80003a38:	6cc50513          	add	a0,a0,1740 # 80008100 <digits+0x188>
    80003a3c:	becfe0ef          	jal	80001e28 <uart_puts>
    80003a40:	f71ff06f          	j	800039b0 <test_page_replacement+0x1b8>

0000000080003a44 <walkaddr>:
    80003a44:	fff00793          	li	a5,-1
    80003a48:	0197d793          	srl	a5,a5,0x19
    80003a4c:	04b7e463          	bltu	a5,a1,80003a94 <walkaddr+0x50>
    80003a50:	ff010113          	add	sp,sp,-16
    80003a54:	00113423          	sd	ra,8(sp)
    80003a58:	d80fe0ef          	jal	80001fd8 <walk_lookup>
    80003a5c:	04050063          	beqz	a0,80003a9c <walkaddr+0x58>
    80003a60:	00053783          	ld	a5,0(a0)
    80003a64:	01100713          	li	a4,17
    80003a68:	00000513          	li	a0,0
    80003a6c:	0117f693          	and	a3,a5,17
    80003a70:	00e68863          	beq	a3,a4,80003a80 <walkaddr+0x3c>
    80003a74:	00813083          	ld	ra,8(sp)
    80003a78:	01010113          	add	sp,sp,16
    80003a7c:	00008067          	ret
    80003a80:	00813083          	ld	ra,8(sp)
    80003a84:	00a7d793          	srl	a5,a5,0xa
    80003a88:	00c79513          	sll	a0,a5,0xc
    80003a8c:	01010113          	add	sp,sp,16
    80003a90:	00008067          	ret
    80003a94:	00000513          	li	a0,0
    80003a98:	00008067          	ret
    80003a9c:	00813083          	ld	ra,8(sp)
    80003aa0:	00000513          	li	a0,0
    80003aa4:	01010113          	add	sp,sp,16
    80003aa8:	00008067          	ret

0000000080003aac <copyin>:
    80003aac:	10068863          	beqz	a3,80003bbc <copyin+0x110>
    80003ab0:	fb010113          	add	sp,sp,-80
    80003ab4:	02913c23          	sd	s1,56(sp)
    80003ab8:	01513c23          	sd	s5,24(sp)
    80003abc:	fff00493          	li	s1,-1
    80003ac0:	fffffab7          	lui	s5,0xfffff
    80003ac4:	04813023          	sd	s0,64(sp)
    80003ac8:	04113423          	sd	ra,72(sp)
    80003acc:	03213823          	sd	s2,48(sp)
    80003ad0:	03313423          	sd	s3,40(sp)
    80003ad4:	03413023          	sd	s4,32(sp)
    80003ad8:	01613823          	sd	s6,16(sp)
    80003adc:	01713423          	sd	s7,8(sp)
    80003ae0:	01567ab3          	and	s5,a2,s5
    80003ae4:	0194d493          	srl	s1,s1,0x19
    80003ae8:	00060413          	mv	s0,a2
    80003aec:	0354ea63          	bltu	s1,s5,80003b20 <copyin+0x74>
    80003af0:	00068b13          	mv	s6,a3
    80003af4:	00050913          	mv	s2,a0
    80003af8:	00058b93          	mv	s7,a1
    80003afc:	01100a13          	li	s4,17
    80003b00:	000019b7          	lui	s3,0x1
    80003b04:	000a8593          	mv	a1,s5
    80003b08:	00090513          	mv	a0,s2
    80003b0c:	cccfe0ef          	jal	80001fd8 <walk_lookup>
    80003b10:	00050863          	beqz	a0,80003b20 <copyin+0x74>
    80003b14:	00053783          	ld	a5,0(a0)
    80003b18:	0117f713          	and	a4,a5,17
    80003b1c:	03470a63          	beq	a4,s4,80003b50 <copyin+0xa4>
    80003b20:	fff00513          	li	a0,-1
    80003b24:	04813083          	ld	ra,72(sp)
    80003b28:	04013403          	ld	s0,64(sp)
    80003b2c:	03813483          	ld	s1,56(sp)
    80003b30:	03013903          	ld	s2,48(sp)
    80003b34:	02813983          	ld	s3,40(sp)
    80003b38:	02013a03          	ld	s4,32(sp)
    80003b3c:	01813a83          	ld	s5,24(sp)
    80003b40:	01013b03          	ld	s6,16(sp)
    80003b44:	00813b83          	ld	s7,8(sp)
    80003b48:	05010113          	add	sp,sp,80
    80003b4c:	00008067          	ret
    80003b50:	00a7d793          	srl	a5,a5,0xa
    80003b54:	00c79793          	sll	a5,a5,0xc
    80003b58:	fc0784e3          	beqz	a5,80003b20 <copyin+0x74>
    80003b5c:	013a85b3          	add	a1,s5,s3
    80003b60:	408586b3          	sub	a3,a1,s0
    80003b64:	00db7463          	bgeu	s6,a3,80003b6c <copyin+0xc0>
    80003b68:	000b0693          	mv	a3,s6
    80003b6c:	41540733          	sub	a4,s0,s5
    80003b70:	00f70733          	add	a4,a4,a5
    80003b74:	01768833          	add	a6,a3,s7
    80003b78:	000b8793          	mv	a5,s7
    80003b7c:	41770733          	sub	a4,a4,s7
    80003b80:	02068263          	beqz	a3,80003ba4 <copyin+0xf8>
    80003b84:	00f70633          	add	a2,a4,a5
    80003b88:	00064603          	lbu	a2,0(a2) # 11000 <_entry-0x7ffef000>
    80003b8c:	00178793          	add	a5,a5,1
    80003b90:	fec78fa3          	sb	a2,-1(a5)
    80003b94:	fef818e3          	bne	a6,a5,80003b84 <copyin+0xd8>
    80003b98:	40db0b33          	sub	s6,s6,a3
    80003b9c:	00080b93          	mv	s7,a6
    80003ba0:	000b0a63          	beqz	s6,80003bb4 <copyin+0x108>
    80003ba4:	f6b4eee3          	bltu	s1,a1,80003b20 <copyin+0x74>
    80003ba8:	00058a93          	mv	s5,a1
    80003bac:	00058413          	mv	s0,a1
    80003bb0:	f55ff06f          	j	80003b04 <copyin+0x58>
    80003bb4:	00000513          	li	a0,0
    80003bb8:	f6dff06f          	j	80003b24 <copyin+0x78>
    80003bbc:	00000513          	li	a0,0
    80003bc0:	00008067          	ret

0000000080003bc4 <copyout>:
    80003bc4:	10068863          	beqz	a3,80003cd4 <copyout+0x110>
    80003bc8:	fb010113          	add	sp,sp,-80
    80003bcc:	02913c23          	sd	s1,56(sp)
    80003bd0:	01513c23          	sd	s5,24(sp)
    80003bd4:	fff00493          	li	s1,-1
    80003bd8:	fffffab7          	lui	s5,0xfffff
    80003bdc:	04813023          	sd	s0,64(sp)
    80003be0:	04113423          	sd	ra,72(sp)
    80003be4:	03213823          	sd	s2,48(sp)
    80003be8:	03313423          	sd	s3,40(sp)
    80003bec:	03413023          	sd	s4,32(sp)
    80003bf0:	01613823          	sd	s6,16(sp)
    80003bf4:	01713423          	sd	s7,8(sp)
    80003bf8:	0155fab3          	and	s5,a1,s5
    80003bfc:	0194d493          	srl	s1,s1,0x19
    80003c00:	00058413          	mv	s0,a1
    80003c04:	0354ea63          	bltu	s1,s5,80003c38 <copyout+0x74>
    80003c08:	00068b13          	mv	s6,a3
    80003c0c:	00050913          	mv	s2,a0
    80003c10:	00060b93          	mv	s7,a2
    80003c14:	01100a13          	li	s4,17
    80003c18:	000019b7          	lui	s3,0x1
    80003c1c:	000a8593          	mv	a1,s5
    80003c20:	00090513          	mv	a0,s2
    80003c24:	bb4fe0ef          	jal	80001fd8 <walk_lookup>
    80003c28:	00050863          	beqz	a0,80003c38 <copyout+0x74>
    80003c2c:	00053783          	ld	a5,0(a0)
    80003c30:	0117f713          	and	a4,a5,17
    80003c34:	03470a63          	beq	a4,s4,80003c68 <copyout+0xa4>
    80003c38:	fff00513          	li	a0,-1
    80003c3c:	04813083          	ld	ra,72(sp)
    80003c40:	04013403          	ld	s0,64(sp)
    80003c44:	03813483          	ld	s1,56(sp)
    80003c48:	03013903          	ld	s2,48(sp)
    80003c4c:	02813983          	ld	s3,40(sp)
    80003c50:	02013a03          	ld	s4,32(sp)
    80003c54:	01813a83          	ld	s5,24(sp)
    80003c58:	01013b03          	ld	s6,16(sp)
    80003c5c:	00813b83          	ld	s7,8(sp)
    80003c60:	05010113          	add	sp,sp,80
    80003c64:	00008067          	ret
    80003c68:	00a7d793          	srl	a5,a5,0xa
    80003c6c:	00c79793          	sll	a5,a5,0xc
    80003c70:	fc0784e3          	beqz	a5,80003c38 <copyout+0x74>
    80003c74:	013a8533          	add	a0,s5,s3
    80003c78:	408506b3          	sub	a3,a0,s0
    80003c7c:	00db7463          	bgeu	s6,a3,80003c84 <copyout+0xc0>
    80003c80:	000b0693          	mv	a3,s6
    80003c84:	41540733          	sub	a4,s0,s5
    80003c88:	00f70733          	add	a4,a4,a5
    80003c8c:	01768833          	add	a6,a3,s7
    80003c90:	000b8793          	mv	a5,s7
    80003c94:	41770733          	sub	a4,a4,s7
    80003c98:	02068263          	beqz	a3,80003cbc <copyout+0xf8>
    80003c9c:	0007c583          	lbu	a1,0(a5)
    80003ca0:	00f70633          	add	a2,a4,a5
    80003ca4:	00178793          	add	a5,a5,1
    80003ca8:	00b60023          	sb	a1,0(a2)
    80003cac:	fef818e3          	bne	a6,a5,80003c9c <copyout+0xd8>
    80003cb0:	40db0b33          	sub	s6,s6,a3
    80003cb4:	00080b93          	mv	s7,a6
    80003cb8:	000b0a63          	beqz	s6,80003ccc <copyout+0x108>
    80003cbc:	f6a4eee3          	bltu	s1,a0,80003c38 <copyout+0x74>
    80003cc0:	00050a93          	mv	s5,a0
    80003cc4:	00050413          	mv	s0,a0
    80003cc8:	f55ff06f          	j	80003c1c <copyout+0x58>
    80003ccc:	00000513          	li	a0,0
    80003cd0:	f6dff06f          	j	80003c3c <copyout+0x78>
    80003cd4:	00000513          	li	a0,0
    80003cd8:	00008067          	ret

0000000080003cdc <uvmunmap>:
    80003cdc:	03459793          	sll	a5,a1,0x34
    80003ce0:	00079463          	bnez	a5,80003ce8 <uvmunmap+0xc>
    80003ce4:	bbcfe06f          	j	800020a0 <uvmunmap.part.0>
    80003ce8:	00008067          	ret

0000000080003cec <uvmdealloc>:
    80003cec:	06b67863          	bgeu	a2,a1,80003d5c <uvmdealloc+0x70>
    80003cf0:	000017b7          	lui	a5,0x1
    80003cf4:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003cf8:	ff010113          	add	sp,sp,-16
    80003cfc:	fffff6b7          	lui	a3,0xfffff
    80003d00:	00f60733          	add	a4,a2,a5
    80003d04:	00f587b3          	add	a5,a1,a5
    80003d08:	00813023          	sd	s0,0(sp)
    80003d0c:	00113423          	sd	ra,8(sp)
    80003d10:	00d775b3          	and	a1,a4,a3
    80003d14:	00d7f7b3          	and	a5,a5,a3
    80003d18:	00060413          	mv	s0,a2
    80003d1c:	00f5ec63          	bltu	a1,a5,80003d34 <uvmdealloc+0x48>
    80003d20:	00813083          	ld	ra,8(sp)
    80003d24:	00040513          	mv	a0,s0
    80003d28:	00013403          	ld	s0,0(sp)
    80003d2c:	01010113          	add	sp,sp,16
    80003d30:	00008067          	ret
    80003d34:	40b787b3          	sub	a5,a5,a1
    80003d38:	00c7d793          	srl	a5,a5,0xc
    80003d3c:	00100693          	li	a3,1
    80003d40:	0007861b          	sext.w	a2,a5
    80003d44:	b5cfe0ef          	jal	800020a0 <uvmunmap.part.0>
    80003d48:	00813083          	ld	ra,8(sp)
    80003d4c:	00040513          	mv	a0,s0
    80003d50:	00013403          	ld	s0,0(sp)
    80003d54:	01010113          	add	sp,sp,16
    80003d58:	00008067          	ret
    80003d5c:	00058513          	mv	a0,a1
    80003d60:	00008067          	ret

0000000080003d64 <uvmalloc>:
    80003d64:	0eb66463          	bltu	a2,a1,80003e4c <uvmalloc+0xe8>
    80003d68:	00001737          	lui	a4,0x1
    80003d6c:	fff70713          	add	a4,a4,-1 # fff <_entry-0x7ffff001>
    80003d70:	fc010113          	add	sp,sp,-64
    80003d74:	00e587b3          	add	a5,a1,a4
    80003d78:	fffff737          	lui	a4,0xfffff
    80003d7c:	02913423          	sd	s1,40(sp)
    80003d80:	03213023          	sd	s2,32(sp)
    80003d84:	01313c23          	sd	s3,24(sp)
    80003d88:	01413823          	sd	s4,16(sp)
    80003d8c:	01513423          	sd	s5,8(sp)
    80003d90:	00e7f933          	and	s2,a5,a4
    80003d94:	02113c23          	sd	ra,56(sp)
    80003d98:	02813823          	sd	s0,48(sp)
    80003d9c:	00060a93          	mv	s5,a2
    80003da0:	00050a13          	mv	s4,a0
    80003da4:	00090493          	mv	s1,s2
    80003da8:	000019b7          	lui	s3,0x1
    80003dac:	04c97263          	bgeu	s2,a2,80003df0 <uvmalloc+0x8c>
    80003db0:	924fe0ef          	jal	80001ed4 <alloc_page>
    80003db4:	00050413          	mv	s0,a0
    80003db8:	06050463          	beqz	a0,80003e20 <uvmalloc+0xbc>
    80003dbc:	01350733          	add	a4,a0,s3
    80003dc0:	00050793          	mv	a5,a0
    80003dc4:	00078023          	sb	zero,0(a5)
    80003dc8:	00178793          	add	a5,a5,1
    80003dcc:	fef71ce3          	bne	a4,a5,80003dc4 <uvmalloc+0x60>
    80003dd0:	01e00693          	li	a3,30
    80003dd4:	00040613          	mv	a2,s0
    80003dd8:	00048593          	mv	a1,s1
    80003ddc:	000a0513          	mv	a0,s4
    80003de0:	b9cfe0ef          	jal	8000217c <map_page>
    80003de4:	02051a63          	bnez	a0,80003e18 <uvmalloc+0xb4>
    80003de8:	013484b3          	add	s1,s1,s3
    80003dec:	fd54e2e3          	bltu	s1,s5,80003db0 <uvmalloc+0x4c>
    80003df0:	000a8513          	mv	a0,s5
    80003df4:	03813083          	ld	ra,56(sp)
    80003df8:	03013403          	ld	s0,48(sp)
    80003dfc:	02813483          	ld	s1,40(sp)
    80003e00:	02013903          	ld	s2,32(sp)
    80003e04:	01813983          	ld	s3,24(sp)
    80003e08:	01013a03          	ld	s4,16(sp)
    80003e0c:	00813a83          	ld	s5,8(sp)
    80003e10:	04010113          	add	sp,sp,64
    80003e14:	00008067          	ret
    80003e18:	00040513          	mv	a0,s0
    80003e1c:	8d4fe0ef          	jal	80001ef0 <free_page>
    80003e20:	02997263          	bgeu	s2,s1,80003e44 <uvmalloc+0xe0>
    80003e24:	000017b7          	lui	a5,0x1
    80003e28:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003e2c:	fffff737          	lui	a4,0xfffff
    80003e30:	00f905b3          	add	a1,s2,a5
    80003e34:	00f487b3          	add	a5,s1,a5
    80003e38:	00e5f5b3          	and	a1,a1,a4
    80003e3c:	00e7f7b3          	and	a5,a5,a4
    80003e40:	00f5ea63          	bltu	a1,a5,80003e54 <uvmalloc+0xf0>
    80003e44:	00000513          	li	a0,0
    80003e48:	fadff06f          	j	80003df4 <uvmalloc+0x90>
    80003e4c:	00058513          	mv	a0,a1
    80003e50:	00008067          	ret
    80003e54:	40b787b3          	sub	a5,a5,a1
    80003e58:	00c7d613          	srl	a2,a5,0xc
    80003e5c:	000a0513          	mv	a0,s4
    80003e60:	00100693          	li	a3,1
    80003e64:	0006061b          	sext.w	a2,a2
    80003e68:	a38fe0ef          	jal	800020a0 <uvmunmap.part.0>
    80003e6c:	00000513          	li	a0,0
    80003e70:	f85ff06f          	j	80003df4 <uvmalloc+0x90>

0000000080003e74 <freewalk>:
    80003e74:	f0010113          	add	sp,sp,-256
    80003e78:	000017b7          	lui	a5,0x1
    80003e7c:	0e813823          	sd	s0,240(sp)
    80003e80:	0f213023          	sd	s2,224(sp)
    80003e84:	0d613023          	sd	s6,192(sp)
    80003e88:	0b713c23          	sd	s7,184(sp)
    80003e8c:	0e113c23          	sd	ra,248(sp)
    80003e90:	0e913423          	sd	s1,232(sp)
    80003e94:	0d313c23          	sd	s3,216(sp)
    80003e98:	0d413823          	sd	s4,208(sp)
    80003e9c:	0d513423          	sd	s5,200(sp)
    80003ea0:	0b813823          	sd	s8,176(sp)
    80003ea4:	0b913423          	sd	s9,168(sp)
    80003ea8:	0ba13023          	sd	s10,160(sp)
    80003eac:	09b13c23          	sd	s11,152(sp)
    80003eb0:	00050413          	mv	s0,a0
    80003eb4:	00050913          	mv	s2,a0
    80003eb8:	00f50b33          	add	s6,a0,a5
    80003ebc:	00001bb7          	lui	s7,0x1
    80003ec0:	00c0006f          	j	80003ecc <freewalk+0x58>
    80003ec4:	00890913          	add	s2,s2,8
    80003ec8:	2f690e63          	beq	s2,s6,800041c4 <freewalk+0x350>
    80003ecc:	00093783          	ld	a5,0(s2)
    80003ed0:	00100713          	li	a4,1
    80003ed4:	00f7f693          	and	a3,a5,15
    80003ed8:	fee696e3          	bne	a3,a4,80003ec4 <freewalk+0x50>
    80003edc:	00a7d793          	srl	a5,a5,0xa
    80003ee0:	00c79a13          	sll	s4,a5,0xc
    80003ee4:	017a0cb3          	add	s9,s4,s7
    80003ee8:	00100d93          	li	s11,1
    80003eec:	000a0a93          	mv	s5,s4
    80003ef0:	00040493          	mv	s1,s0
    80003ef4:	00c0006f          	j	80003f00 <freewalk+0x8c>
    80003ef8:	008a0a13          	add	s4,s4,8 # fffffffffffff008 <bss_end+0xffffffff7fbd8d98>
    80003efc:	2b9a0863          	beq	s4,s9,800041ac <freewalk+0x338>
    80003f00:	000a3783          	ld	a5,0(s4)
    80003f04:	00f7f713          	and	a4,a5,15
    80003f08:	ffb718e3          	bne	a4,s11,80003ef8 <freewalk+0x84>
    80003f0c:	00a7d793          	srl	a5,a5,0xa
    80003f10:	00c79993          	sll	s3,a5,0xc
    80003f14:	00098c13          	mv	s8,s3
    80003f18:	01798d33          	add	s10,s3,s7
    80003f1c:	00098413          	mv	s0,s3
    80003f20:	00c0006f          	j	80003f2c <freewalk+0xb8>
    80003f24:	00840413          	add	s0,s0,8
    80003f28:	27a40863          	beq	s0,s10,80004198 <freewalk+0x324>
    80003f2c:	00043783          	ld	a5,0(s0)
    80003f30:	00f7f713          	and	a4,a5,15
    80003f34:	ffb718e3          	bne	a4,s11,80003f24 <freewalk+0xb0>
    80003f38:	00a7d793          	srl	a5,a5,0xa
    80003f3c:	00c79793          	sll	a5,a5,0xc
    80003f40:	00048713          	mv	a4,s1
    80003f44:	03513823          	sd	s5,48(sp)
    80003f48:	00090493          	mv	s1,s2
    80003f4c:	017789b3          	add	s3,a5,s7
    80003f50:	00078a93          	mv	s5,a5
    80003f54:	00070913          	mv	s2,a4
    80003f58:	00c0006f          	j	80003f64 <freewalk+0xf0>
    80003f5c:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80003f60:	20f98a63          	beq	s3,a5,80004174 <freewalk+0x300>
    80003f64:	0007b703          	ld	a4,0(a5)
    80003f68:	00f77693          	and	a3,a4,15
    80003f6c:	ffb698e3          	bne	a3,s11,80003f5c <freewalk+0xe8>
    80003f70:	00a75713          	srl	a4,a4,0xa
    80003f74:	00c71713          	sll	a4,a4,0xc
    80003f78:	017706b3          	add	a3,a4,s7
    80003f7c:	05313023          	sd	s3,64(sp)
    80003f80:	00d13423          	sd	a3,8(sp)
    80003f84:	02813c23          	sd	s0,56(sp)
    80003f88:	04f13423          	sd	a5,72(sp)
    80003f8c:	00070993          	mv	s3,a4
    80003f90:	0100006f          	j	80003fa0 <freewalk+0x12c>
    80003f94:	00813783          	ld	a5,8(sp)
    80003f98:	00870713          	add	a4,a4,8 # fffffffffffff008 <bss_end+0xffffffff7fbd8d98>
    80003f9c:	1ae78863          	beq	a5,a4,8000414c <freewalk+0x2d8>
    80003fa0:	00073783          	ld	a5,0(a4)
    80003fa4:	00f7f693          	and	a3,a5,15
    80003fa8:	ffb696e3          	bne	a3,s11,80003f94 <freewalk+0x120>
    80003fac:	00a7d793          	srl	a5,a5,0xa
    80003fb0:	00c79793          	sll	a5,a5,0xc
    80003fb4:	017786b3          	add	a3,a5,s7
    80003fb8:	05813823          	sd	s8,80(sp)
    80003fbc:	00d13c23          	sd	a3,24(sp)
    80003fc0:	000a8c13          	mv	s8,s5
    80003fc4:	04e13c23          	sd	a4,88(sp)
    80003fc8:	00078a93          	mv	s5,a5
    80003fcc:	07213023          	sd	s2,96(sp)
    80003fd0:	0100006f          	j	80003fe0 <freewalk+0x16c>
    80003fd4:	01813703          	ld	a4,24(sp)
    80003fd8:	00878793          	add	a5,a5,8
    80003fdc:	14f70063          	beq	a4,a5,8000411c <freewalk+0x2a8>
    80003fe0:	0007b703          	ld	a4,0(a5)
    80003fe4:	00f77693          	and	a3,a4,15
    80003fe8:	ffb696e3          	bne	a3,s11,80003fd4 <freewalk+0x160>
    80003fec:	00a75713          	srl	a4,a4,0xa
    80003ff0:	00c71913          	sll	s2,a4,0xc
    80003ff4:	01790733          	add	a4,s2,s7
    80003ff8:	07213423          	sd	s2,104(sp)
    80003ffc:	00090413          	mv	s0,s2
    80004000:	02e13023          	sd	a4,32(sp)
    80004004:	06f13823          	sd	a5,112(sp)
    80004008:	00048913          	mv	s2,s1
    8000400c:	0100006f          	j	8000401c <freewalk+0x1a8>
    80004010:	02013783          	ld	a5,32(sp)
    80004014:	00840413          	add	s0,s0,8
    80004018:	0c878e63          	beq	a5,s0,800040f4 <freewalk+0x280>
    8000401c:	00043783          	ld	a5,0(s0)
    80004020:	00f7f693          	and	a3,a5,15
    80004024:	ffb696e3          	bne	a3,s11,80004010 <freewalk+0x19c>
    80004028:	00a7d793          	srl	a5,a5,0xa
    8000402c:	00c79493          	sll	s1,a5,0xc
    80004030:	017487b3          	add	a5,s1,s7
    80004034:	00913823          	sd	s1,16(sp)
    80004038:	02f13423          	sd	a5,40(sp)
    8000403c:	06813c23          	sd	s0,120(sp)
    80004040:	0100006f          	j	80004050 <freewalk+0x1dc>
    80004044:	02813783          	ld	a5,40(sp)
    80004048:	00848493          	add	s1,s1,8
    8000404c:	08978663          	beq	a5,s1,800040d8 <freewalk+0x264>
    80004050:	0004b783          	ld	a5,0(s1)
    80004054:	00f7f693          	and	a3,a5,15
    80004058:	ffb696e3          	bne	a3,s11,80004044 <freewalk+0x1d0>
    8000405c:	00a7d793          	srl	a5,a5,0xa
    80004060:	00c79413          	sll	s0,a5,0xc
    80004064:	017406b3          	add	a3,s0,s7
    80004068:	09213023          	sd	s2,128(sp)
    8000406c:	09613423          	sd	s6,136(sp)
    80004070:	00040913          	mv	s2,s0
    80004074:	000a0b13          	mv	s6,s4
    80004078:	00048a13          	mv	s4,s1
    8000407c:	00068493          	mv	s1,a3
    80004080:	00c0006f          	j	8000408c <freewalk+0x218>
    80004084:	00840413          	add	s0,s0,8
    80004088:	02848463          	beq	s1,s0,800040b0 <freewalk+0x23c>
    8000408c:	00043783          	ld	a5,0(s0)
    80004090:	00f7f713          	and	a4,a5,15
    80004094:	ffb718e3          	bne	a4,s11,80004084 <freewalk+0x210>
    80004098:	00a7d793          	srl	a5,a5,0xa
    8000409c:	00c79513          	sll	a0,a5,0xc
    800040a0:	dd5ff0ef          	jal	80003e74 <freewalk>
    800040a4:	00840413          	add	s0,s0,8
    800040a8:	fe043c23          	sd	zero,-8(s0)
    800040ac:	fe8490e3          	bne	s1,s0,8000408c <freewalk+0x218>
    800040b0:	00090513          	mv	a0,s2
    800040b4:	000a0493          	mv	s1,s4
    800040b8:	08013903          	ld	s2,128(sp)
    800040bc:	000b0a13          	mv	s4,s6
    800040c0:	08813b03          	ld	s6,136(sp)
    800040c4:	e2dfd0ef          	jal	80001ef0 <free_page>
    800040c8:	02813783          	ld	a5,40(sp)
    800040cc:	0004b023          	sd	zero,0(s1)
    800040d0:	00848493          	add	s1,s1,8
    800040d4:	f6979ee3          	bne	a5,s1,80004050 <freewalk+0x1dc>
    800040d8:	01013503          	ld	a0,16(sp)
    800040dc:	07813403          	ld	s0,120(sp)
    800040e0:	e11fd0ef          	jal	80001ef0 <free_page>
    800040e4:	02013783          	ld	a5,32(sp)
    800040e8:	00043023          	sd	zero,0(s0)
    800040ec:	00840413          	add	s0,s0,8
    800040f0:	f28796e3          	bne	a5,s0,8000401c <freewalk+0x1a8>
    800040f4:	07013783          	ld	a5,112(sp)
    800040f8:	06813503          	ld	a0,104(sp)
    800040fc:	00090493          	mv	s1,s2
    80004100:	00f13823          	sd	a5,16(sp)
    80004104:	dedfd0ef          	jal	80001ef0 <free_page>
    80004108:	01013783          	ld	a5,16(sp)
    8000410c:	01813703          	ld	a4,24(sp)
    80004110:	0007b023          	sd	zero,0(a5)
    80004114:	00878793          	add	a5,a5,8
    80004118:	ecf714e3          	bne	a4,a5,80003fe0 <freewalk+0x16c>
    8000411c:	05813703          	ld	a4,88(sp)
    80004120:	000a8513          	mv	a0,s5
    80004124:	06013903          	ld	s2,96(sp)
    80004128:	00e13823          	sd	a4,16(sp)
    8000412c:	000c0a93          	mv	s5,s8
    80004130:	05013c03          	ld	s8,80(sp)
    80004134:	dbdfd0ef          	jal	80001ef0 <free_page>
    80004138:	01013703          	ld	a4,16(sp)
    8000413c:	00813783          	ld	a5,8(sp)
    80004140:	00073023          	sd	zero,0(a4)
    80004144:	00870713          	add	a4,a4,8
    80004148:	e4e79ce3          	bne	a5,a4,80003fa0 <freewalk+0x12c>
    8000414c:	04813783          	ld	a5,72(sp)
    80004150:	00098513          	mv	a0,s3
    80004154:	03813403          	ld	s0,56(sp)
    80004158:	00f13423          	sd	a5,8(sp)
    8000415c:	04013983          	ld	s3,64(sp)
    80004160:	d91fd0ef          	jal	80001ef0 <free_page>
    80004164:	00813783          	ld	a5,8(sp)
    80004168:	0007b023          	sd	zero,0(a5)
    8000416c:	00878793          	add	a5,a5,8
    80004170:	def99ae3          	bne	s3,a5,80003f64 <freewalk+0xf0>
    80004174:	00090793          	mv	a5,s2
    80004178:	000a8513          	mv	a0,s5
    8000417c:	00048913          	mv	s2,s1
    80004180:	03013a83          	ld	s5,48(sp)
    80004184:	00078493          	mv	s1,a5
    80004188:	00840413          	add	s0,s0,8
    8000418c:	d65fd0ef          	jal	80001ef0 <free_page>
    80004190:	fe043c23          	sd	zero,-8(s0)
    80004194:	d9a41ce3          	bne	s0,s10,80003f2c <freewalk+0xb8>
    80004198:	000c0513          	mv	a0,s8
    8000419c:	d55fd0ef          	jal	80001ef0 <free_page>
    800041a0:	008a0a13          	add	s4,s4,8
    800041a4:	fe0a3c23          	sd	zero,-8(s4)
    800041a8:	d59a1ce3          	bne	s4,s9,80003f00 <freewalk+0x8c>
    800041ac:	000a8513          	mv	a0,s5
    800041b0:	d41fd0ef          	jal	80001ef0 <free_page>
    800041b4:	00890913          	add	s2,s2,8
    800041b8:	fe093c23          	sd	zero,-8(s2)
    800041bc:	00048413          	mv	s0,s1
    800041c0:	d16916e3          	bne	s2,s6,80003ecc <freewalk+0x58>
    800041c4:	00040513          	mv	a0,s0
    800041c8:	0f013403          	ld	s0,240(sp)
    800041cc:	0f813083          	ld	ra,248(sp)
    800041d0:	0e813483          	ld	s1,232(sp)
    800041d4:	0e013903          	ld	s2,224(sp)
    800041d8:	0d813983          	ld	s3,216(sp)
    800041dc:	0d013a03          	ld	s4,208(sp)
    800041e0:	0c813a83          	ld	s5,200(sp)
    800041e4:	0c013b03          	ld	s6,192(sp)
    800041e8:	0b813b83          	ld	s7,184(sp)
    800041ec:	0b013c03          	ld	s8,176(sp)
    800041f0:	0a813c83          	ld	s9,168(sp)
    800041f4:	0a013d03          	ld	s10,160(sp)
    800041f8:	09813d83          	ld	s11,152(sp)
    800041fc:	10010113          	add	sp,sp,256
    80004200:	cf1fd06f          	j	80001ef0 <free_page>

0000000080004204 <uvmfree>:
    80004204:	00059463          	bnez	a1,8000420c <uvmfree+0x8>
    80004208:	00008067          	ret
    8000420c:	000017b7          	lui	a5,0x1
    80004210:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80004214:	00f585b3          	add	a1,a1,a5
    80004218:	00c5d613          	srl	a2,a1,0xc
    8000421c:	00100693          	li	a3,1
    80004220:	00000593          	li	a1,0
    80004224:	e7dfd06f          	j	800020a0 <uvmunmap.part.0>

0000000080004228 <proc_pagetable>:
    80004228:	ff010113          	add	sp,sp,-16
    8000422c:	00113423          	sd	ra,8(sp)
    80004230:	02050863          	beqz	a0,80004260 <proc_pagetable+0x38>
    80004234:	ca1fd0ef          	jal	80001ed4 <alloc_page>
    80004238:	00001737          	lui	a4,0x1
    8000423c:	00050793          	mv	a5,a0
    80004240:	00e50733          	add	a4,a0,a4
    80004244:	02050863          	beqz	a0,80004274 <proc_pagetable+0x4c>
    80004248:	0007b023          	sd	zero,0(a5)
    8000424c:	00878793          	add	a5,a5,8
    80004250:	fef71ce3          	bne	a4,a5,80004248 <proc_pagetable+0x20>
    80004254:	00813083          	ld	ra,8(sp)
    80004258:	01010113          	add	sp,sp,16
    8000425c:	00008067          	ret
    80004260:	00004517          	auipc	a0,0x4
    80004264:	f4850513          	add	a0,a0,-184 # 800081a8 <digits+0x230>
    80004268:	bc1fd0ef          	jal	80001e28 <uart_puts>
    8000426c:	00000513          	li	a0,0
    80004270:	fe5ff06f          	j	80004254 <proc_pagetable+0x2c>
    80004274:	00004517          	auipc	a0,0x4
    80004278:	f5450513          	add	a0,a0,-172 # 800081c8 <digits+0x250>
    8000427c:	badfd0ef          	jal	80001e28 <uart_puts>
    80004280:	00000513          	li	a0,0
    80004284:	fd1ff06f          	j	80004254 <proc_pagetable+0x2c>

0000000080004288 <proc_freepagetable>:
    80004288:	fd010113          	add	sp,sp,-48
    8000428c:	01313423          	sd	s3,8(sp)
    80004290:	02113423          	sd	ra,40(sp)
    80004294:	02813023          	sd	s0,32(sp)
    80004298:	00913c23          	sd	s1,24(sp)
    8000429c:	01213823          	sd	s2,16(sp)
    800042a0:	00050993          	mv	s3,a0
    800042a4:	06059263          	bnez	a1,80004308 <proc_freepagetable+0x80>
    800042a8:	000014b7          	lui	s1,0x1
    800042ac:	00098413          	mv	s0,s3
    800042b0:	009984b3          	add	s1,s3,s1
    800042b4:	00100913          	li	s2,1
    800042b8:	00c0006f          	j	800042c4 <proc_freepagetable+0x3c>
    800042bc:	00840413          	add	s0,s0,8
    800042c0:	02940463          	beq	s0,s1,800042e8 <proc_freepagetable+0x60>
    800042c4:	00043503          	ld	a0,0(s0)
    800042c8:	00f57793          	and	a5,a0,15
    800042cc:	ff2798e3          	bne	a5,s2,800042bc <proc_freepagetable+0x34>
    800042d0:	00a55513          	srl	a0,a0,0xa
    800042d4:	00c51513          	sll	a0,a0,0xc
    800042d8:	b9dff0ef          	jal	80003e74 <freewalk>
    800042dc:	00840413          	add	s0,s0,8
    800042e0:	fe043c23          	sd	zero,-8(s0)
    800042e4:	fe9410e3          	bne	s0,s1,800042c4 <proc_freepagetable+0x3c>
    800042e8:	02013403          	ld	s0,32(sp)
    800042ec:	02813083          	ld	ra,40(sp)
    800042f0:	01813483          	ld	s1,24(sp)
    800042f4:	01013903          	ld	s2,16(sp)
    800042f8:	00098513          	mv	a0,s3
    800042fc:	00813983          	ld	s3,8(sp)
    80004300:	03010113          	add	sp,sp,48
    80004304:	bedfd06f          	j	80001ef0 <free_page>
    80004308:	000017b7          	lui	a5,0x1
    8000430c:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80004310:	00f58633          	add	a2,a1,a5
    80004314:	00100693          	li	a3,1
    80004318:	00c65613          	srl	a2,a2,0xc
    8000431c:	00000593          	li	a1,0
    80004320:	d81fd0ef          	jal	800020a0 <uvmunmap.part.0>
    80004324:	f85ff06f          	j	800042a8 <proc_freepagetable+0x20>

0000000080004328 <uvmcopy>:
    80004328:	10060463          	beqz	a2,80004430 <uvmcopy+0x108>
    8000432c:	fb010113          	add	sp,sp,-80
    80004330:	02913c23          	sd	s1,56(sp)
    80004334:	03213823          	sd	s2,48(sp)
    80004338:	03313423          	sd	s3,40(sp)
    8000433c:	03413023          	sd	s4,32(sp)
    80004340:	01513c23          	sd	s5,24(sp)
    80004344:	04113423          	sd	ra,72(sp)
    80004348:	04813023          	sd	s0,64(sp)
    8000434c:	01613823          	sd	s6,16(sp)
    80004350:	01713423          	sd	s7,8(sp)
    80004354:	00060a13          	mv	s4,a2
    80004358:	00050a93          	mv	s5,a0
    8000435c:	00058993          	mv	s3,a1
    80004360:	00000493          	li	s1,0
    80004364:	00001937          	lui	s2,0x1
    80004368:	00048593          	mv	a1,s1
    8000436c:	000a8513          	mv	a0,s5
    80004370:	c69fd0ef          	jal	80001fd8 <walk_lookup>
    80004374:	06050c63          	beqz	a0,800043ec <uvmcopy+0xc4>
    80004378:	00053b83          	ld	s7,0(a0)
    8000437c:	001bf793          	and	a5,s7,1
    80004380:	06078663          	beqz	a5,800043ec <uvmcopy+0xc4>
    80004384:	00abd593          	srl	a1,s7,0xa
    80004388:	00c59413          	sll	s0,a1,0xc
    8000438c:	b49fd0ef          	jal	80001ed4 <alloc_page>
    80004390:	3ffbfb93          	and	s7,s7,1023
    80004394:	00050b13          	mv	s6,a0
    80004398:	04050a63          	beqz	a0,800043ec <uvmcopy+0xc4>
    8000439c:	01250833          	add	a6,a0,s2
    800043a0:	00050793          	mv	a5,a0
    800043a4:	40a405b3          	sub	a1,s0,a0
    800043a8:	00f58733          	add	a4,a1,a5
    800043ac:	00074703          	lbu	a4,0(a4) # 1000 <_entry-0x7ffff000>
    800043b0:	00178793          	add	a5,a5,1
    800043b4:	fee78fa3          	sb	a4,-1(a5)
    800043b8:	ff0798e3          	bne	a5,a6,800043a8 <uvmcopy+0x80>
    800043bc:	000b8693          	mv	a3,s7
    800043c0:	000b0613          	mv	a2,s6
    800043c4:	00048593          	mv	a1,s1
    800043c8:	00098513          	mv	a0,s3
    800043cc:	db1fd0ef          	jal	8000217c <map_page>
    800043d0:	00051a63          	bnez	a0,800043e4 <uvmcopy+0xbc>
    800043d4:	012484b3          	add	s1,s1,s2
    800043d8:	f944e8e3          	bltu	s1,s4,80004368 <uvmcopy+0x40>
    800043dc:	00000513          	li	a0,0
    800043e0:	0240006f          	j	80004404 <uvmcopy+0xdc>
    800043e4:	000b0513          	mv	a0,s6
    800043e8:	b09fd0ef          	jal	80001ef0 <free_page>
    800043ec:	00098513          	mv	a0,s3
    800043f0:	00100693          	li	a3,1
    800043f4:	00c4d613          	srl	a2,s1,0xc
    800043f8:	00000593          	li	a1,0
    800043fc:	ca5fd0ef          	jal	800020a0 <uvmunmap.part.0>
    80004400:	fff00513          	li	a0,-1
    80004404:	04813083          	ld	ra,72(sp)
    80004408:	04013403          	ld	s0,64(sp)
    8000440c:	03813483          	ld	s1,56(sp)
    80004410:	03013903          	ld	s2,48(sp)
    80004414:	02813983          	ld	s3,40(sp)
    80004418:	02013a03          	ld	s4,32(sp)
    8000441c:	01813a83          	ld	s5,24(sp)
    80004420:	01013b03          	ld	s6,16(sp)
    80004424:	00813b83          	ld	s7,8(sp)
    80004428:	05010113          	add	sp,sp,80
    8000442c:	00008067          	ret
    80004430:	00000513          	li	a0,0
    80004434:	00008067          	ret

0000000080004438 <handle_timer_interrupt>:
    80004438:	ff010113          	add	sp,sp,-16
    8000443c:	00422597          	auipc	a1,0x422
    80004440:	e145b583          	ld	a1,-492(a1) # 80426250 <ticks>
    80004444:	00004517          	auipc	a0,0x4
    80004448:	dbc50513          	add	a0,a0,-580 # 80008200 <digits+0x288>
    8000444c:	00113423          	sd	ra,8(sp)
    80004450:	e68fd0ef          	jal	80001ab8 <printf>
    80004454:	00813083          	ld	ra,8(sp)
    80004458:	00100793          	li	a5,1
    8000445c:	00422717          	auipc	a4,0x422
    80004460:	e0f72423          	sw	a5,-504(a4) # 80426264 <need_resched>
    80004464:	01010113          	add	sp,sp,16
    80004468:	00008067          	ret

000000008000446c <handle_external_interrupt>:
    8000446c:	00004517          	auipc	a0,0x4
    80004470:	dbc50513          	add	a0,a0,-580 # 80008228 <digits+0x2b0>
    80004474:	e44fd06f          	j	80001ab8 <printf>

0000000080004478 <handle_software_interrupt>:
    80004478:	00004517          	auipc	a0,0x4
    8000447c:	de050513          	add	a0,a0,-544 # 80008258 <digits+0x2e0>
    80004480:	e38fd06f          	j	80001ab8 <printf>

0000000080004484 <get_ticks>:
    80004484:	00422517          	auipc	a0,0x422
    80004488:	dcc53503          	ld	a0,-564(a0) # 80426250 <ticks>
    8000448c:	00008067          	ret

0000000080004490 <machine_timer_handler>:
    80004490:	00422797          	auipc	a5,0x422
    80004494:	db878793          	add	a5,a5,-584 # 80426248 <m_mode_ticks>
    80004498:	0007b703          	ld	a4,0(a5)
    8000449c:	ff010113          	add	sp,sp,-16
    800044a0:	00113423          	sd	ra,8(sp)
    800044a4:	00170713          	add	a4,a4,1
    800044a8:	00e7b023          	sd	a4,0(a5)
    800044ac:	00422697          	auipc	a3,0x422
    800044b0:	da468693          	add	a3,a3,-604 # 80426250 <ticks>
    800044b4:	0006b703          	ld	a4,0(a3)
    800044b8:	00004517          	auipc	a0,0x4
    800044bc:	dd050513          	add	a0,a0,-560 # 80008288 <digits+0x310>
    800044c0:	00170713          	add	a4,a4,1
    800044c4:	00e6b023          	sd	a4,0(a3)
    800044c8:	0007b583          	ld	a1,0(a5)
    800044cc:	decfd0ef          	jal	80001ab8 <printf>
    800044d0:	0200c7b7          	lui	a5,0x200c
    800044d4:	ff87b783          	ld	a5,-8(a5) # 200bff8 <_entry-0x7dff4008>
    800044d8:	000f4737          	lui	a4,0xf4
    800044dc:	00813083          	ld	ra,8(sp)
    800044e0:	24070713          	add	a4,a4,576 # f4240 <_entry-0x7ff0bdc0>
    800044e4:	00e787b3          	add	a5,a5,a4
    800044e8:	02004737          	lui	a4,0x2004
    800044ec:	00f73023          	sd	a5,0(a4) # 2004000 <_entry-0x7dffc000>
    800044f0:	01010113          	add	sp,sp,16
    800044f4:	00008067          	ret

00000000800044f8 <alloc_trapframe>:
    800044f8:	00410597          	auipc	a1,0x410
    800044fc:	bb058593          	add	a1,a1,-1104 # 804140a8 <trapframe_used>
    80004500:	00058793          	mv	a5,a1
    80004504:	00000713          	li	a4,0
    80004508:	10000613          	li	a2,256
    8000450c:	00c0006f          	j	80004518 <alloc_trapframe+0x20>
    80004510:	0017071b          	addw	a4,a4,1
    80004514:	02c70e63          	beq	a4,a2,80004550 <alloc_trapframe+0x58>
    80004518:	0007a683          	lw	a3,0(a5)
    8000451c:	00478793          	add	a5,a5,4
    80004520:	fe0698e3          	bnez	a3,80004510 <alloc_trapframe+0x18>
    80004524:	00271793          	sll	a5,a4,0x2
    80004528:	00471513          	sll	a0,a4,0x4
    8000452c:	00f585b3          	add	a1,a1,a5
    80004530:	00e50533          	add	a0,a0,a4
    80004534:	00100793          	li	a5,1
    80004538:	00f5a023          	sw	a5,0(a1)
    8000453c:	00451513          	sll	a0,a0,0x4
    80004540:	00410797          	auipc	a5,0x410
    80004544:	fe878793          	add	a5,a5,-24 # 80414528 <trapframe_pool>
    80004548:	00f50533          	add	a0,a0,a5
    8000454c:	00008067          	ret
    80004550:	00000513          	li	a0,0
    80004554:	00008067          	ret

0000000080004558 <free_trapframe>:
    80004558:	00410797          	auipc	a5,0x410
    8000455c:	fd078793          	add	a5,a5,-48 # 80414528 <trapframe_pool>
    80004560:	02f56c63          	bltu	a0,a5,80004598 <free_trapframe+0x40>
    80004564:	00421717          	auipc	a4,0x421
    80004568:	fc470713          	add	a4,a4,-60 # 80425528 <cpus>
    8000456c:	02e57663          	bgeu	a0,a4,80004598 <free_trapframe+0x40>
    80004570:	40f507b3          	sub	a5,a0,a5
    80004574:	00004717          	auipc	a4,0x4
    80004578:	6cc73703          	ld	a4,1740(a4) # 80008c40 <digits+0xcc8>
    8000457c:	4047d793          	sra	a5,a5,0x4
    80004580:	02e787b3          	mul	a5,a5,a4
    80004584:	00410717          	auipc	a4,0x410
    80004588:	b2470713          	add	a4,a4,-1244 # 804140a8 <trapframe_used>
    8000458c:	00279793          	sll	a5,a5,0x2
    80004590:	00f707b3          	add	a5,a4,a5
    80004594:	0007a023          	sw	zero,0(a5)
    80004598:	00008067          	ret

000000008000459c <intr_on>:
    8000459c:	100027f3          	csrr	a5,sstatus
    800045a0:	0027e793          	or	a5,a5,2
    800045a4:	10079073          	csrw	sstatus,a5
    800045a8:	00008067          	ret

00000000800045ac <intr_off>:
    800045ac:	100027f3          	csrr	a5,sstatus
    800045b0:	ffd7f793          	and	a5,a5,-3
    800045b4:	10079073          	csrw	sstatus,a5
    800045b8:	00008067          	ret

00000000800045bc <intr_get>:
    800045bc:	10002573          	csrr	a0,sstatus
    800045c0:	00155513          	srl	a0,a0,0x1
    800045c4:	00157513          	and	a0,a0,1
    800045c8:	00008067          	ret

00000000800045cc <set_stvec>:
    800045cc:	00a585b3          	add	a1,a1,a0
    800045d0:	10559073          	csrw	stvec,a1
    800045d4:	00008067          	ret

00000000800045d8 <trap_init>:
    800045d8:	ff010113          	add	sp,sp,-16
    800045dc:	00004517          	auipc	a0,0x4
    800045e0:	cdc50513          	add	a0,a0,-804 # 800082b8 <digits+0x340>
    800045e4:	00113423          	sd	ra,8(sp)
    800045e8:	841fd0ef          	jal	80001e28 <uart_puts>
    800045ec:	00410617          	auipc	a2,0x410
    800045f0:	abc60613          	add	a2,a2,-1348 # 804140a8 <trapframe_used>
    800045f4:	00060793          	mv	a5,a2
    800045f8:	00410717          	auipc	a4,0x410
    800045fc:	eb070713          	add	a4,a4,-336 # 804144a8 <trap_handlers>
    80004600:	0007a023          	sw	zero,0(a5)
    80004604:	00478793          	add	a5,a5,4
    80004608:	fee79ce3          	bne	a5,a4,80004600 <trap_init+0x28>
    8000460c:	00410797          	auipc	a5,0x410
    80004610:	e9c78793          	add	a5,a5,-356 # 804144a8 <trap_handlers>
    80004614:	00410697          	auipc	a3,0x410
    80004618:	f1468693          	add	a3,a3,-236 # 80414528 <trapframe_pool>
    8000461c:	00078713          	mv	a4,a5
    80004620:	00073023          	sd	zero,0(a4)
    80004624:	00870713          	add	a4,a4,8
    80004628:	fee69ce3          	bne	a3,a4,80004620 <trap_init+0x48>
    8000462c:	00000717          	auipc	a4,0x0
    80004630:	e0c70713          	add	a4,a4,-500 # 80004438 <handle_timer_interrupt>
    80004634:	42e63423          	sd	a4,1064(a2)
    80004638:	00000717          	auipc	a4,0x0
    8000463c:	e3470713          	add	a4,a4,-460 # 8000446c <handle_external_interrupt>
    80004640:	44e63423          	sd	a4,1096(a2)
    80004644:	00000717          	auipc	a4,0x0
    80004648:	e3470713          	add	a4,a4,-460 # 80004478 <handle_software_interrupt>
    8000464c:	40e63423          	sd	a4,1032(a2)
    80004650:	00000593          	li	a1,0
    80004654:	0007b703          	ld	a4,0(a5)
    80004658:	00878793          	add	a5,a5,8
    8000465c:	00070463          	beqz	a4,80004664 <trap_init+0x8c>
    80004660:	0015859b          	addw	a1,a1,1
    80004664:	fef698e3          	bne	a3,a5,80004654 <trap_init+0x7c>
    80004668:	00004517          	auipc	a0,0x4
    8000466c:	c7850513          	add	a0,a0,-904 # 800082e0 <digits+0x368>
    80004670:	c48fd0ef          	jal	80001ab8 <printf>
    80004674:	00813083          	ld	ra,8(sp)
    80004678:	00004517          	auipc	a0,0x4
    8000467c:	c9850513          	add	a0,a0,-872 # 80008310 <digits+0x398>
    80004680:	01010113          	add	sp,sp,16
    80004684:	fa4fd06f          	j	80001e28 <uart_puts>

0000000080004688 <trap_init_hart>:
    80004688:	ff010113          	add	sp,sp,-16
    8000468c:	00004517          	auipc	a0,0x4
    80004690:	ca450513          	add	a0,a0,-860 # 80008330 <digits+0x3b8>
    80004694:	00113423          	sd	ra,8(sp)
    80004698:	f90fd0ef          	jal	80001e28 <uart_puts>
    8000469c:	00001797          	auipc	a5,0x1
    800046a0:	4e478793          	add	a5,a5,1252 # 80005b80 <kernelvec>
    800046a4:	10579073          	csrw	stvec,a5
    800046a8:	104027f3          	csrr	a5,sie
    800046ac:	2227e793          	or	a5,a5,546
    800046b0:	10479073          	csrw	sie,a5
    800046b4:	100027f3          	csrr	a5,sstatus
    800046b8:	0027e793          	or	a5,a5,2
    800046bc:	10079073          	csrw	sstatus,a5
    800046c0:	00813083          	ld	ra,8(sp)
    800046c4:	00004517          	auipc	a0,0x4
    800046c8:	c9450513          	add	a0,a0,-876 # 80008358 <digits+0x3e0>
    800046cc:	01010113          	add	sp,sp,16
    800046d0:	f58fd06f          	j	80001e28 <uart_puts>

00000000800046d4 <set_next_timer>:
    800046d4:	0200c7b7          	lui	a5,0x200c
    800046d8:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    800046dc:	000f4637          	lui	a2,0xf4
    800046e0:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800046e4:	00c58633          	add	a2,a1,a2
    800046e8:	020047b7          	lui	a5,0x2004
    800046ec:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    800046f0:	00004517          	auipc	a0,0x4
    800046f4:	c9050513          	add	a0,a0,-880 # 80008380 <digits+0x408>
    800046f8:	bc0fd06f          	j	80001ab8 <printf>

00000000800046fc <timerinit>:
    800046fc:	ff010113          	add	sp,sp,-16
    80004700:	00004517          	auipc	a0,0x4
    80004704:	cb050513          	add	a0,a0,-848 # 800083b0 <digits+0x438>
    80004708:	00113423          	sd	ra,8(sp)
    8000470c:	f1cfd0ef          	jal	80001e28 <uart_puts>
    80004710:	0200c7b7          	lui	a5,0x200c
    80004714:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80004718:	000f4637          	lui	a2,0xf4
    8000471c:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004720:	00c58633          	add	a2,a1,a2
    80004724:	020047b7          	lui	a5,0x2004
    80004728:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    8000472c:	00004517          	auipc	a0,0x4
    80004730:	c5450513          	add	a0,a0,-940 # 80008380 <digits+0x408>
    80004734:	b84fd0ef          	jal	80001ab8 <printf>
    80004738:	00813083          	ld	ra,8(sp)
    8000473c:	00004517          	auipc	a0,0x4
    80004740:	c9450513          	add	a0,a0,-876 # 800083d0 <digits+0x458>
    80004744:	01010113          	add	sp,sp,16
    80004748:	ee0fd06f          	j	80001e28 <uart_puts>

000000008000474c <devintr>:
    8000474c:	142025f3          	csrr	a1,scause
    80004750:	1005da63          	bgez	a1,80004864 <devintr+0x118>
    80004754:	ff010113          	add	sp,sp,-16
    80004758:	00113423          	sd	ra,8(sp)
    8000475c:	00813023          	sd	s0,0(sp)
    80004760:	00f5f593          	and	a1,a1,15
    80004764:	00500793          	li	a5,5
    80004768:	08f58663          	beq	a1,a5,800047f4 <devintr+0xa8>
    8000476c:	00900793          	li	a5,9
    80004770:	06f58263          	beq	a1,a5,800047d4 <devintr+0x88>
    80004774:	00100793          	li	a5,1
    80004778:	02f58263          	beq	a1,a5,8000479c <devintr+0x50>
    8000477c:	00004517          	auipc	a0,0x4
    80004780:	cdc50513          	add	a0,a0,-804 # 80008458 <digits+0x4e0>
    80004784:	b34fd0ef          	jal	80001ab8 <printf>
    80004788:	00813083          	ld	ra,8(sp)
    8000478c:	00013403          	ld	s0,0(sp)
    80004790:	00000513          	li	a0,0
    80004794:	01010113          	add	sp,sp,16
    80004798:	00008067          	ret
    8000479c:	00004517          	auipc	a0,0x4
    800047a0:	c9c50513          	add	a0,a0,-868 # 80008438 <digits+0x4c0>
    800047a4:	e84fd0ef          	jal	80001e28 <uart_puts>
    800047a8:	144027f3          	csrr	a5,sip
    800047ac:	ffd7f793          	and	a5,a5,-3
    800047b0:	14479073          	csrw	sip,a5
    800047b4:	00004517          	auipc	a0,0x4
    800047b8:	aa450513          	add	a0,a0,-1372 # 80008258 <digits+0x2e0>
    800047bc:	afcfd0ef          	jal	80001ab8 <printf>
    800047c0:	00100513          	li	a0,1
    800047c4:	00813083          	ld	ra,8(sp)
    800047c8:	00013403          	ld	s0,0(sp)
    800047cc:	01010113          	add	sp,sp,16
    800047d0:	00008067          	ret
    800047d4:	00004517          	auipc	a0,0x4
    800047d8:	c4450513          	add	a0,a0,-956 # 80008418 <digits+0x4a0>
    800047dc:	e4cfd0ef          	jal	80001e28 <uart_puts>
    800047e0:	00004517          	auipc	a0,0x4
    800047e4:	a4850513          	add	a0,a0,-1464 # 80008228 <digits+0x2b0>
    800047e8:	ad0fd0ef          	jal	80001ab8 <printf>
    800047ec:	00100513          	li	a0,1
    800047f0:	fd5ff06f          	j	800047c4 <devintr+0x78>
    800047f4:	00422417          	auipc	s0,0x422
    800047f8:	a5c40413          	add	s0,s0,-1444 # 80426250 <ticks>
    800047fc:	00043783          	ld	a5,0(s0)
    80004800:	000f4637          	lui	a2,0xf4
    80004804:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004808:	00178793          	add	a5,a5,1
    8000480c:	00f43023          	sd	a5,0(s0)
    80004810:	0200c7b7          	lui	a5,0x200c
    80004814:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80004818:	020047b7          	lui	a5,0x2004
    8000481c:	00004517          	auipc	a0,0x4
    80004820:	b6450513          	add	a0,a0,-1180 # 80008380 <digits+0x408>
    80004824:	00c58633          	add	a2,a1,a2
    80004828:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    8000482c:	a8cfd0ef          	jal	80001ab8 <printf>
    80004830:	00043583          	ld	a1,0(s0)
    80004834:	00004517          	auipc	a0,0x4
    80004838:	bbc50513          	add	a0,a0,-1092 # 800083f0 <digits+0x478>
    8000483c:	a7cfd0ef          	jal	80001ab8 <printf>
    80004840:	00043583          	ld	a1,0(s0)
    80004844:	00004517          	auipc	a0,0x4
    80004848:	9bc50513          	add	a0,a0,-1604 # 80008200 <digits+0x288>
    8000484c:	a6cfd0ef          	jal	80001ab8 <printf>
    80004850:	00100793          	li	a5,1
    80004854:	00422717          	auipc	a4,0x422
    80004858:	a0f72823          	sw	a5,-1520(a4) # 80426264 <need_resched>
    8000485c:	00100513          	li	a0,1
    80004860:	f65ff06f          	j	800047c4 <devintr+0x78>
    80004864:	00000513          	li	a0,0
    80004868:	00008067          	ret

000000008000486c <usertrap>:
    8000486c:	142025f3          	csrr	a1,scause
    80004870:	0405c463          	bltz	a1,800048b8 <usertrap+0x4c>
    80004874:	00d00793          	li	a5,13
    80004878:	02b7e063          	bltu	a5,a1,80004898 <usertrap+0x2c>
    8000487c:	00b00793          	li	a5,11
    80004880:	02b7e663          	bltu	a5,a1,800048ac <usertrap+0x40>
    80004884:	00800793          	li	a5,8
    80004888:	00f59c63          	bne	a1,a5,800048a0 <usertrap+0x34>
    8000488c:	00004517          	auipc	a0,0x4
    80004890:	c1450513          	add	a0,a0,-1004 # 800084a0 <digits+0x528>
    80004894:	d94fd06f          	j	80001e28 <uart_puts>
    80004898:	00f00793          	li	a5,15
    8000489c:	00f58863          	beq	a1,a5,800048ac <usertrap+0x40>
    800048a0:	00004517          	auipc	a0,0x4
    800048a4:	c3850513          	add	a0,a0,-968 # 800084d8 <digits+0x560>
    800048a8:	a10fd06f          	j	80001ab8 <printf>
    800048ac:	00004517          	auipc	a0,0x4
    800048b0:	c0c50513          	add	a0,a0,-1012 # 800084b8 <digits+0x540>
    800048b4:	d74fd06f          	j	80001e28 <uart_puts>
    800048b8:	ff010113          	add	sp,sp,-16
    800048bc:	00113423          	sd	ra,8(sp)
    800048c0:	e8dff0ef          	jal	8000474c <devintr>
    800048c4:	00050863          	beqz	a0,800048d4 <usertrap+0x68>
    800048c8:	00813083          	ld	ra,8(sp)
    800048cc:	01010113          	add	sp,sp,16
    800048d0:	00008067          	ret
    800048d4:	00813083          	ld	ra,8(sp)
    800048d8:	00004517          	auipc	a0,0x4
    800048dc:	ba050513          	add	a0,a0,-1120 # 80008478 <digits+0x500>
    800048e0:	01010113          	add	sp,sp,16
    800048e4:	9d4fd06f          	j	80001ab8 <printf>

00000000800048e8 <handle_syscall>:
    800048e8:	06050a63          	beqz	a0,8000495c <handle_syscall+0x74>
    800048ec:	ff010113          	add	sp,sp,-16
    800048f0:	00813023          	sd	s0,0(sp)
    800048f4:	08853403          	ld	s0,136(a0)
    800048f8:	00004517          	auipc	a0,0x4
    800048fc:	c4050513          	add	a0,a0,-960 # 80008538 <digits+0x5c0>
    80004900:	00113423          	sd	ra,8(sp)
    80004904:	00040593          	mv	a1,s0
    80004908:	9b0fd0ef          	jal	80001ab8 <printf>
    8000490c:	00200793          	li	a5,2
    80004910:	06f40a63          	beq	s0,a5,80004984 <handle_syscall+0x9c>
    80004914:	0287e463          	bltu	a5,s0,8000493c <handle_syscall+0x54>
    80004918:	00004517          	auipc	a0,0x4
    8000491c:	c6850513          	add	a0,a0,-920 # 80008580 <digits+0x608>
    80004920:	02041663          	bnez	s0,8000494c <handle_syscall+0x64>
    80004924:	00013403          	ld	s0,0(sp)
    80004928:	00813083          	ld	ra,8(sp)
    8000492c:	00004517          	auipc	a0,0x4
    80004930:	c3450513          	add	a0,a0,-972 # 80008560 <digits+0x5e8>
    80004934:	01010113          	add	sp,sp,16
    80004938:	980fd06f          	j	80001ab8 <printf>
    8000493c:	00300793          	li	a5,3
    80004940:	00004517          	auipc	a0,0x4
    80004944:	c8050513          	add	a0,a0,-896 # 800085c0 <digits+0x648>
    80004948:	02f41063          	bne	s0,a5,80004968 <handle_syscall+0x80>
    8000494c:	00013403          	ld	s0,0(sp)
    80004950:	00813083          	ld	ra,8(sp)
    80004954:	01010113          	add	sp,sp,16
    80004958:	960fd06f          	j	80001ab8 <printf>
    8000495c:	00004517          	auipc	a0,0x4
    80004960:	bac50513          	add	a0,a0,-1108 # 80008508 <digits+0x590>
    80004964:	cc4fd06f          	j	80001e28 <uart_puts>
    80004968:	00040593          	mv	a1,s0
    8000496c:	00013403          	ld	s0,0(sp)
    80004970:	00813083          	ld	ra,8(sp)
    80004974:	00004517          	auipc	a0,0x4
    80004978:	c6c50513          	add	a0,a0,-916 # 800085e0 <digits+0x668>
    8000497c:	01010113          	add	sp,sp,16
    80004980:	938fd06f          	j	80001ab8 <printf>
    80004984:	00013403          	ld	s0,0(sp)
    80004988:	00813083          	ld	ra,8(sp)
    8000498c:	00004517          	auipc	a0,0x4
    80004990:	c1450513          	add	a0,a0,-1004 # 800085a0 <digits+0x628>
    80004994:	01010113          	add	sp,sp,16
    80004998:	920fd06f          	j	80001ab8 <printf>

000000008000499c <handle_exception>:
    8000499c:	14202773          	csrr	a4,scause
    800049a0:	141025f3          	csrr	a1,sepc
    800049a4:	00f00793          	li	a5,15
    800049a8:	16e7e263          	bltu	a5,a4,80004b0c <handle_exception+0x170>
    800049ac:	00004697          	auipc	a3,0x4
    800049b0:	f0068693          	add	a3,a3,-256 # 800088ac <digits+0x934>
    800049b4:	00271793          	sll	a5,a4,0x2
    800049b8:	00d787b3          	add	a5,a5,a3
    800049bc:	0007a783          	lw	a5,0(a5)
    800049c0:	ff010113          	add	sp,sp,-16
    800049c4:	00813023          	sd	s0,0(sp)
    800049c8:	00d787b3          	add	a5,a5,a3
    800049cc:	00113423          	sd	ra,8(sp)
    800049d0:	00050413          	mv	s0,a0
    800049d4:	00078067          	jr	a5
    800049d8:	00013403          	ld	s0,0(sp)
    800049dc:	00813083          	ld	ra,8(sp)
    800049e0:	00058613          	mv	a2,a1
    800049e4:	00070593          	mv	a1,a4
    800049e8:	00004517          	auipc	a0,0x4
    800049ec:	e7050513          	add	a0,a0,-400 # 80008858 <digits+0x8e0>
    800049f0:	01010113          	add	sp,sp,16
    800049f4:	8c4fd06f          	j	80001ab8 <printf>
    800049f8:	00004517          	auipc	a0,0x4
    800049fc:	cf850513          	add	a0,a0,-776 # 800086f0 <digits+0x778>
    80004a00:	8b8fd0ef          	jal	80001ab8 <printf>
    80004a04:	10040e63          	beqz	s0,80004b20 <handle_exception+0x184>
    80004a08:	10043583          	ld	a1,256(s0)
    80004a0c:	00004517          	auipc	a0,0x4
    80004a10:	d4450513          	add	a0,a0,-700 # 80008750 <digits+0x7d8>
    80004a14:	00013403          	ld	s0,0(sp)
    80004a18:	00813083          	ld	ra,8(sp)
    80004a1c:	01010113          	add	sp,sp,16
    80004a20:	898fd06f          	j	80001ab8 <printf>
    80004a24:	00004517          	auipc	a0,0x4
    80004a28:	d5c50513          	add	a0,a0,-676 # 80008780 <digits+0x808>
    80004a2c:	88cfd0ef          	jal	80001ab8 <printf>
    80004a30:	00004517          	auipc	a0,0x4
    80004a34:	d7050513          	add	a0,a0,-656 # 800087a0 <digits+0x828>
    80004a38:	08040c63          	beqz	s0,80004ad0 <handle_exception+0x134>
    80004a3c:	10043583          	ld	a1,256(s0)
    80004a40:	00004517          	auipc	a0,0x4
    80004a44:	d9050513          	add	a0,a0,-624 # 800087d0 <digits+0x858>
    80004a48:	fcdff06f          	j	80004a14 <handle_exception+0x78>
    80004a4c:	00013403          	ld	s0,0(sp)
    80004a50:	00813083          	ld	ra,8(sp)
    80004a54:	00004517          	auipc	a0,0x4
    80004a58:	da450513          	add	a0,a0,-604 # 800087f8 <digits+0x880>
    80004a5c:	01010113          	add	sp,sp,16
    80004a60:	858fd06f          	j	80001ab8 <printf>
    80004a64:	00013403          	ld	s0,0(sp)
    80004a68:	00813083          	ld	ra,8(sp)
    80004a6c:	00004517          	auipc	a0,0x4
    80004a70:	dbc50513          	add	a0,a0,-580 # 80008828 <digits+0x8b0>
    80004a74:	01010113          	add	sp,sp,16
    80004a78:	840fd06f          	j	80001ab8 <printf>
    80004a7c:	00013403          	ld	s0,0(sp)
    80004a80:	00813083          	ld	ra,8(sp)
    80004a84:	01010113          	add	sp,sp,16
    80004a88:	e61ff06f          	j	800048e8 <handle_syscall>
    80004a8c:	00004517          	auipc	a0,0x4
    80004a90:	b7450513          	add	a0,a0,-1164 # 80008600 <digits+0x688>
    80004a94:	824fd0ef          	jal	80001ab8 <printf>
    80004a98:	02040863          	beqz	s0,80004ac8 <handle_exception+0x12c>
    80004a9c:	143025f3          	csrr	a1,stval
    80004aa0:	00013403          	ld	s0,0(sp)
    80004aa4:	00813083          	ld	ra,8(sp)
    80004aa8:	00004517          	auipc	a0,0x4
    80004aac:	bb850513          	add	a0,a0,-1096 # 80008660 <digits+0x6e8>
    80004ab0:	01010113          	add	sp,sp,16
    80004ab4:	804fd06f          	j	80001ab8 <printf>
    80004ab8:	00004517          	auipc	a0,0x4
    80004abc:	bd850513          	add	a0,a0,-1064 # 80008690 <digits+0x718>
    80004ac0:	ff9fc0ef          	jal	80001ab8 <printf>
    80004ac4:	fc041ce3          	bnez	s0,80004a9c <handle_exception+0x100>
    80004ac8:	00004517          	auipc	a0,0x4
    80004acc:	b6050513          	add	a0,a0,-1184 # 80008628 <digits+0x6b0>
    80004ad0:	00013403          	ld	s0,0(sp)
    80004ad4:	00813083          	ld	ra,8(sp)
    80004ad8:	01010113          	add	sp,sp,16
    80004adc:	b4cfd06f          	j	80001e28 <uart_puts>
    80004ae0:	00004517          	auipc	a0,0x4
    80004ae4:	bc850513          	add	a0,a0,-1080 # 800086a8 <digits+0x730>
    80004ae8:	fd1fc0ef          	jal	80001ab8 <printf>
    80004aec:	fc040ee3          	beqz	s0,80004ac8 <handle_exception+0x12c>
    80004af0:	143025f3          	csrr	a1,stval
    80004af4:	00013403          	ld	s0,0(sp)
    80004af8:	00813083          	ld	ra,8(sp)
    80004afc:	00004517          	auipc	a0,0x4
    80004b00:	bcc50513          	add	a0,a0,-1076 # 800086c8 <digits+0x750>
    80004b04:	01010113          	add	sp,sp,16
    80004b08:	fb1fc06f          	j	80001ab8 <printf>
    80004b0c:	00058613          	mv	a2,a1
    80004b10:	00004517          	auipc	a0,0x4
    80004b14:	d4850513          	add	a0,a0,-696 # 80008858 <digits+0x8e0>
    80004b18:	00070593          	mv	a1,a4
    80004b1c:	f9dfc06f          	j	80001ab8 <printf>
    80004b20:	00004517          	auipc	a0,0x4
    80004b24:	bf850513          	add	a0,a0,-1032 # 80008718 <digits+0x7a0>
    80004b28:	fa9ff06f          	j	80004ad0 <handle_exception+0x134>

0000000080004b2c <kerneltrap>:
    80004b2c:	ff010113          	add	sp,sp,-16
    80004b30:	00113423          	sd	ra,8(sp)
    80004b34:	00813023          	sd	s0,0(sp)
    80004b38:	14202473          	csrr	s0,scause
    80004b3c:	14102573          	csrr	a0,sepc
    80004b40:	00044a63          	bltz	s0,80004b54 <kerneltrap+0x28>
    80004b44:	00013403          	ld	s0,0(sp)
    80004b48:	00813083          	ld	ra,8(sp)
    80004b4c:	01010113          	add	sp,sp,16
    80004b50:	e4dff06f          	j	8000499c <handle_exception>
    80004b54:	bf9ff0ef          	jal	8000474c <devintr>
    80004b58:	00050a63          	beqz	a0,80004b6c <kerneltrap+0x40>
    80004b5c:	00813083          	ld	ra,8(sp)
    80004b60:	00013403          	ld	s0,0(sp)
    80004b64:	01010113          	add	sp,sp,16
    80004b68:	00008067          	ret
    80004b6c:	00f47593          	and	a1,s0,15
    80004b70:	00013403          	ld	s0,0(sp)
    80004b74:	00813083          	ld	ra,8(sp)
    80004b78:	00004517          	auipc	a0,0x4
    80004b7c:	d0850513          	add	a0,a0,-760 # 80008880 <digits+0x908>
    80004b80:	01010113          	add	sp,sp,16
    80004b84:	f35fc06f          	j	80001ab8 <printf>

0000000080004b88 <handle_trap_page_fault>:
    80004b88:	00058793          	mv	a5,a1
    80004b8c:	02050263          	beqz	a0,80004bb0 <handle_trap_page_fault+0x28>
    80004b90:	143025f3          	csrr	a1,stval
    80004b94:	00078863          	beqz	a5,80004ba4 <handle_trap_page_fault+0x1c>
    80004b98:	00004517          	auipc	a0,0x4
    80004b9c:	b3050513          	add	a0,a0,-1232 # 800086c8 <digits+0x750>
    80004ba0:	f19fc06f          	j	80001ab8 <printf>
    80004ba4:	00004517          	auipc	a0,0x4
    80004ba8:	abc50513          	add	a0,a0,-1348 # 80008660 <digits+0x6e8>
    80004bac:	f0dfc06f          	j	80001ab8 <printf>
    80004bb0:	00004517          	auipc	a0,0x4
    80004bb4:	a7850513          	add	a0,a0,-1416 # 80008628 <digits+0x6b0>
    80004bb8:	a70fd06f          	j	80001e28 <uart_puts>

0000000080004bbc <handle_illegal_instruction>:
    80004bbc:	00050a63          	beqz	a0,80004bd0 <handle_illegal_instruction+0x14>
    80004bc0:	10053583          	ld	a1,256(a0)
    80004bc4:	00004517          	auipc	a0,0x4
    80004bc8:	b8c50513          	add	a0,a0,-1140 # 80008750 <digits+0x7d8>
    80004bcc:	eedfc06f          	j	80001ab8 <printf>
    80004bd0:	00004517          	auipc	a0,0x4
    80004bd4:	b4850513          	add	a0,a0,-1208 # 80008718 <digits+0x7a0>
    80004bd8:	a50fd06f          	j	80001e28 <uart_puts>

0000000080004bdc <handle_breakpoint>:
    80004bdc:	00050a63          	beqz	a0,80004bf0 <handle_breakpoint+0x14>
    80004be0:	10053583          	ld	a1,256(a0)
    80004be4:	00004517          	auipc	a0,0x4
    80004be8:	bec50513          	add	a0,a0,-1044 # 800087d0 <digits+0x858>
    80004bec:	ecdfc06f          	j	80001ab8 <printf>
    80004bf0:	00004517          	auipc	a0,0x4
    80004bf4:	bb050513          	add	a0,a0,-1104 # 800087a0 <digits+0x828>
    80004bf8:	a30fd06f          	j	80001e28 <uart_puts>

0000000080004bfc <proc_init>:
    80004bfc:	ff010113          	add	sp,sp,-16
    80004c00:	00004517          	auipc	a0,0x4
    80004c04:	cf050513          	add	a0,a0,-784 # 800088f0 <digits+0x978>
    80004c08:	00113423          	sd	ra,8(sp)
    80004c0c:	a1cfd0ef          	jal	80001e28 <uart_puts>
    80004c10:	00421797          	auipc	a5,0x421
    80004c14:	99878793          	add	a5,a5,-1640 # 804255a8 <proc>
    80004c18:	00421697          	auipc	a3,0x421
    80004c1c:	61068693          	add	a3,a3,1552 # 80426228 <mem_end>
    80004c20:	00078713          	mv	a4,a5
    80004c24:	00073023          	sd	zero,0(a4)
    80004c28:	00870713          	add	a4,a4,8
    80004c2c:	fed71ce3          	bne	a4,a3,80004c24 <proc_init+0x28>
    80004c30:	00100713          	li	a4,1
    80004c34:	00004617          	auipc	a2,0x4
    80004c38:	3ce62623          	sw	a4,972(a2) # 80009000 <nextpid>
    80004c3c:	00421717          	auipc	a4,0x421
    80004c40:	62073623          	sd	zero,1580(a4) # 80426268 <current_proc>
    80004c44:	0007a023          	sw	zero,0(a5)
    80004c48:	0007a223          	sw	zero,4(a5)
    80004c4c:	0007a423          	sw	zero,8(a5)
    80004c50:	0007a623          	sw	zero,12(a5)
    80004c54:	0c878793          	add	a5,a5,200
    80004c58:	fed796e3          	bne	a5,a3,80004c44 <proc_init+0x48>
    80004c5c:	00813083          	ld	ra,8(sp)
    80004c60:	00004517          	auipc	a0,0x4
    80004c64:	cb850513          	add	a0,a0,-840 # 80008918 <digits+0x9a0>
    80004c68:	01010113          	add	sp,sp,16
    80004c6c:	9bcfd06f          	j	80001e28 <uart_puts>

0000000080004c70 <alloc_proc>:
    80004c70:	fd010113          	add	sp,sp,-48
    80004c74:	02113423          	sd	ra,40(sp)
    80004c78:	02813023          	sd	s0,32(sp)
    80004c7c:	00913c23          	sd	s1,24(sp)
    80004c80:	01213823          	sd	s2,16(sp)
    80004c84:	01313423          	sd	s3,8(sp)
    80004c88:	00421717          	auipc	a4,0x421
    80004c8c:	5d870713          	add	a4,a4,1496 # 80426260 <proc_lock>
    80004c90:	00100693          	li	a3,1
    80004c94:	00068793          	mv	a5,a3
    80004c98:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80004c9c:	0007879b          	sext.w	a5,a5
    80004ca0:	fe079ae3          	bnez	a5,80004c94 <alloc_proc+0x24>
    80004ca4:	00421997          	auipc	s3,0x421
    80004ca8:	90498993          	add	s3,s3,-1788 # 804255a8 <proc>
    80004cac:	00098793          	mv	a5,s3
    80004cb0:	00000413          	li	s0,0
    80004cb4:	01000613          	li	a2,16
    80004cb8:	0007a683          	lw	a3,0(a5)
    80004cbc:	0c878793          	add	a5,a5,200
    80004cc0:	02068463          	beqz	a3,80004ce8 <alloc_proc+0x78>
    80004cc4:	0014041b          	addw	s0,s0,1
    80004cc8:	fec418e3          	bne	s0,a2,80004cb8 <alloc_proc+0x48>
    80004ccc:	0f50000f          	fence	iorw,ow
    80004cd0:	0807202f          	amoswap.w	zero,zero,(a4)
    80004cd4:	00004517          	auipc	a0,0x4
    80004cd8:	c6c50513          	add	a0,a0,-916 # 80008940 <digits+0x9c8>
    80004cdc:	94cfd0ef          	jal	80001e28 <uart_puts>
    80004ce0:	00000913          	li	s2,0
    80004ce4:	0cc0006f          	j	80004db0 <alloc_proc+0x140>
    80004ce8:	0c800493          	li	s1,200
    80004cec:	029404b3          	mul	s1,s0,s1
    80004cf0:	00004697          	auipc	a3,0x4
    80004cf4:	31068693          	add	a3,a3,784 # 80009000 <nextpid>
    80004cf8:	0006a783          	lw	a5,0(a3)
    80004cfc:	0017861b          	addw	a2,a5,1
    80004d00:	00c6a023          	sw	a2,0(a3)
    80004d04:	00100693          	li	a3,1
    80004d08:	00998933          	add	s2,s3,s1
    80004d0c:	00d92023          	sw	a3,0(s2) # 1000 <_entry-0x7ffff000>
    80004d10:	00f92223          	sw	a5,4(s2)
    80004d14:	00093423          	sd	zero,8(s2)
    80004d18:	00093823          	sd	zero,16(s2)
    80004d1c:	0a093823          	sd	zero,176(s2)
    80004d20:	0a093c23          	sd	zero,184(s2)
    80004d24:	02093023          	sd	zero,32(s2)
    80004d28:	0f50000f          	fence	iorw,ow
    80004d2c:	0807202f          	amoswap.w	zero,zero,(a4)
    80004d30:	fc8ff0ef          	jal	800044f8 <alloc_trapframe>
    80004d34:	02a93823          	sd	a0,48(s2)
    80004d38:	08050c63          	beqz	a0,80004dd0 <alloc_proc+0x160>
    80004d3c:	998fd0ef          	jal	80001ed4 <alloc_page>
    80004d40:	000017b7          	lui	a5,0x1
    80004d44:	02a93423          	sd	a0,40(s2)
    80004d48:	00f507b3          	add	a5,a0,a5
    80004d4c:	0c050263          	beqz	a0,80004e10 <alloc_proc+0x1a0>
    80004d50:	00050023          	sb	zero,0(a0)
    80004d54:	00150513          	add	a0,a0,1
    80004d58:	fef51ce3          	bne	a0,a5,80004d50 <alloc_proc+0xe0>
    80004d5c:	04048793          	add	a5,s1,64 # 1040 <_entry-0x7fffefc0>
    80004d60:	00f987b3          	add	a5,s3,a5
    80004d64:	07078713          	add	a4,a5,112 # 1070 <_entry-0x7fffef90>
    80004d68:	0007b023          	sd	zero,0(a5)
    80004d6c:	00878793          	add	a5,a5,8
    80004d70:	fee79ce3          	bne	a5,a4,80004d68 <alloc_proc+0xf8>
    80004d74:	0c800793          	li	a5,200
    80004d78:	02f40433          	mul	s0,s0,a5
    80004d7c:	00001737          	lui	a4,0x1
    80004d80:	00090513          	mv	a0,s2
    80004d84:	008989b3          	add	s3,s3,s0
    80004d88:	0289b783          	ld	a5,40(s3)
    80004d8c:	00e787b3          	add	a5,a5,a4
    80004d90:	04f9b423          	sd	a5,72(s3)
    80004d94:	c94ff0ef          	jal	80004228 <proc_pagetable>
    80004d98:	00a9bc23          	sd	a0,24(s3)
    80004d9c:	04050663          	beqz	a0,80004de8 <alloc_proc+0x178>
    80004da0:	0049a583          	lw	a1,4(s3)
    80004da4:	00004517          	auipc	a0,0x4
    80004da8:	c3450513          	add	a0,a0,-972 # 800089d8 <digits+0xa60>
    80004dac:	d0dfc0ef          	jal	80001ab8 <printf>
    80004db0:	02813083          	ld	ra,40(sp)
    80004db4:	02013403          	ld	s0,32(sp)
    80004db8:	01813483          	ld	s1,24(sp)
    80004dbc:	00813983          	ld	s3,8(sp)
    80004dc0:	00090513          	mv	a0,s2
    80004dc4:	01013903          	ld	s2,16(sp)
    80004dc8:	03010113          	add	sp,sp,48
    80004dcc:	00008067          	ret
    80004dd0:	00004517          	auipc	a0,0x4
    80004dd4:	b9050513          	add	a0,a0,-1136 # 80008960 <digits+0x9e8>
    80004dd8:	850fd0ef          	jal	80001e28 <uart_puts>
    80004ddc:	00092023          	sw	zero,0(s2)
    80004de0:	00000913          	li	s2,0
    80004de4:	fcdff06f          	j	80004db0 <alloc_proc+0x140>
    80004de8:	00004517          	auipc	a0,0x4
    80004dec:	bc850513          	add	a0,a0,-1080 # 800089b0 <digits+0xa38>
    80004df0:	838fd0ef          	jal	80001e28 <uart_puts>
    80004df4:	0289b503          	ld	a0,40(s3)
    80004df8:	00000913          	li	s2,0
    80004dfc:	8f4fd0ef          	jal	80001ef0 <free_page>
    80004e00:	0309b503          	ld	a0,48(s3)
    80004e04:	f54ff0ef          	jal	80004558 <free_trapframe>
    80004e08:	0009a023          	sw	zero,0(s3)
    80004e0c:	fa5ff06f          	j	80004db0 <alloc_proc+0x140>
    80004e10:	00004517          	auipc	a0,0x4
    80004e14:	b7850513          	add	a0,a0,-1160 # 80008988 <digits+0xa10>
    80004e18:	810fd0ef          	jal	80001e28 <uart_puts>
    80004e1c:	03093503          	ld	a0,48(s2)
    80004e20:	f38ff0ef          	jal	80004558 <free_trapframe>
    80004e24:	00092023          	sw	zero,0(s2)
    80004e28:	00000913          	li	s2,0
    80004e2c:	f85ff06f          	j	80004db0 <alloc_proc+0x140>

0000000080004e30 <free_proc>:
    80004e30:	06050863          	beqz	a0,80004ea0 <free_proc+0x70>
    80004e34:	ff010113          	add	sp,sp,-16
    80004e38:	00813023          	sd	s0,0(sp)
    80004e3c:	00050413          	mv	s0,a0
    80004e40:	03053503          	ld	a0,48(a0)
    80004e44:	00113423          	sd	ra,8(sp)
    80004e48:	00050663          	beqz	a0,80004e54 <free_proc+0x24>
    80004e4c:	f0cff0ef          	jal	80004558 <free_trapframe>
    80004e50:	02043823          	sd	zero,48(s0)
    80004e54:	02843503          	ld	a0,40(s0)
    80004e58:	00050663          	beqz	a0,80004e64 <free_proc+0x34>
    80004e5c:	894fd0ef          	jal	80001ef0 <free_page>
    80004e60:	02043423          	sd	zero,40(s0)
    80004e64:	01843503          	ld	a0,24(s0)
    80004e68:	00050863          	beqz	a0,80004e78 <free_proc+0x48>
    80004e6c:	02043583          	ld	a1,32(s0)
    80004e70:	c18ff0ef          	jal	80004288 <proc_freepagetable>
    80004e74:	00043c23          	sd	zero,24(s0)
    80004e78:	00043023          	sd	zero,0(s0)
    80004e7c:	00813083          	ld	ra,8(sp)
    80004e80:	02043023          	sd	zero,32(s0)
    80004e84:	0a043823          	sd	zero,176(s0)
    80004e88:	0a043c23          	sd	zero,184(s0)
    80004e8c:	00043823          	sd	zero,16(s0)
    80004e90:	00042423          	sw	zero,8(s0)
    80004e94:	00013403          	ld	s0,0(sp)
    80004e98:	01010113          	add	sp,sp,16
    80004e9c:	00008067          	ret
    80004ea0:	00008067          	ret

0000000080004ea4 <find_proc>:
    80004ea4:	00420597          	auipc	a1,0x420
    80004ea8:	70458593          	add	a1,a1,1796 # 804255a8 <proc>
    80004eac:	00058793          	mv	a5,a1
    80004eb0:	00000713          	li	a4,0
    80004eb4:	01000613          	li	a2,16
    80004eb8:	0100006f          	j	80004ec8 <find_proc+0x24>
    80004ebc:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80004ec0:	0c878793          	add	a5,a5,200
    80004ec4:	02c70263          	beq	a4,a2,80004ee8 <find_proc+0x44>
    80004ec8:	0047a683          	lw	a3,4(a5)
    80004ecc:	fea698e3          	bne	a3,a0,80004ebc <find_proc+0x18>
    80004ed0:	0007a683          	lw	a3,0(a5)
    80004ed4:	fe0684e3          	beqz	a3,80004ebc <find_proc+0x18>
    80004ed8:	0c800793          	li	a5,200
    80004edc:	02f70733          	mul	a4,a4,a5
    80004ee0:	00e58533          	add	a0,a1,a4
    80004ee4:	00008067          	ret
    80004ee8:	00000513          	li	a0,0
    80004eec:	00008067          	ret

0000000080004ef0 <proc_set_kernel_stack>:
    80004ef0:	00050a63          	beqz	a0,80004f04 <proc_set_kernel_stack+0x14>
    80004ef4:	000017b7          	lui	a5,0x1
    80004ef8:	00f587b3          	add	a5,a1,a5
    80004efc:	02b53423          	sd	a1,40(a0)
    80004f00:	04f53423          	sd	a5,72(a0)
    80004f04:	00008067          	ret

0000000080004f08 <proc_mark_runnable>:
    80004f08:	02050263          	beqz	a0,80004f2c <proc_mark_runnable+0x24>
    80004f0c:	00052783          	lw	a5,0(a0)
    80004f10:	00100713          	li	a4,1
    80004f14:	ffe7869b          	addw	a3,a5,-2 # ffe <_entry-0x7ffff002>
    80004f18:	00d77a63          	bgeu	a4,a3,80004f2c <proc_mark_runnable+0x24>
    80004f1c:	00500713          	li	a4,5
    80004f20:	00e78663          	beq	a5,a4,80004f2c <proc_mark_runnable+0x24>
    80004f24:	00200793          	li	a5,2
    80004f28:	00f52023          	sw	a5,0(a0)
    80004f2c:	00008067          	ret

0000000080004f30 <proc_mark_sleeping>:
    80004f30:	00050863          	beqz	a0,80004f40 <proc_mark_sleeping+0x10>
    80004f34:	00052703          	lw	a4,0(a0)
    80004f38:	00300793          	li	a5,3
    80004f3c:	00f70463          	beq	a4,a5,80004f44 <proc_mark_sleeping+0x14>
    80004f40:	00008067          	ret
    80004f44:	00400793          	li	a5,4
    80004f48:	00f52023          	sw	a5,0(a0)
    80004f4c:	0ab53c23          	sd	a1,184(a0)
    80004f50:	00008067          	ret

0000000080004f54 <proc_mark_zombie>:
    80004f54:	00050c63          	beqz	a0,80004f6c <proc_mark_zombie+0x18>
    80004f58:	00052703          	lw	a4,0(a0)
    80004f5c:	00500793          	li	a5,5
    80004f60:	00f70663          	beq	a4,a5,80004f6c <proc_mark_zombie+0x18>
    80004f64:	00f52023          	sw	a5,0(a0)
    80004f68:	00b52823          	sw	a1,16(a0)
    80004f6c:	00008067          	ret

0000000080004f70 <get_pid>:
    80004f70:	00421797          	auipc	a5,0x421
    80004f74:	2f87b783          	ld	a5,760(a5) # 80426268 <current_proc>
    80004f78:	00078663          	beqz	a5,80004f84 <get_pid+0x14>
    80004f7c:	0047a503          	lw	a0,4(a5)
    80004f80:	00008067          	ret
    80004f84:	fff00513          	li	a0,-1
    80004f88:	00008067          	ret

0000000080004f8c <get_current_proc>:
    80004f8c:	00421517          	auipc	a0,0x421
    80004f90:	2dc53503          	ld	a0,732(a0) # 80426268 <current_proc>
    80004f94:	00008067          	ret

0000000080004f98 <set_current_proc>:
    80004f98:	00421797          	auipc	a5,0x421
    80004f9c:	2ca7b823          	sd	a0,720(a5) # 80426268 <current_proc>
    80004fa0:	00008067          	ret

0000000080004fa4 <get_uid>:
    80004fa4:	00421797          	auipc	a5,0x421
    80004fa8:	2c47b783          	ld	a5,708(a5) # 80426268 <current_proc>
    80004fac:	00000513          	li	a0,0
    80004fb0:	00078463          	beqz	a5,80004fb8 <get_uid+0x14>
    80004fb4:	00c7a503          	lw	a0,12(a5)
    80004fb8:	00008067          	ret

0000000080004fbc <set_uid>:
    80004fbc:	ff010113          	add	sp,sp,-16
    80004fc0:	00113423          	sd	ra,8(sp)
    80004fc4:	00813023          	sd	s0,0(sp)
    80004fc8:	00421797          	auipc	a5,0x421
    80004fcc:	2a07b783          	ld	a5,672(a5) # 80426268 <current_proc>
    80004fd0:	04078863          	beqz	a5,80005020 <set_uid+0x64>
    80004fd4:	00c7a403          	lw	s0,12(a5)
    80004fd8:	04041863          	bnez	s0,80005028 <set_uid+0x6c>
    80004fdc:	00700713          	li	a4,7
    80004fe0:	00050593          	mv	a1,a0
    80004fe4:	02a76663          	bltu	a4,a0,80005010 <set_uid+0x54>
    80004fe8:	0047a603          	lw	a2,4(a5)
    80004fec:	00a7a623          	sw	a0,12(a5)
    80004ff0:	00004517          	auipc	a0,0x4
    80004ff4:	a7050513          	add	a0,a0,-1424 # 80008a60 <digits+0xae8>
    80004ff8:	ac1fc0ef          	jal	80001ab8 <printf>
    80004ffc:	00813083          	ld	ra,8(sp)
    80005000:	00040513          	mv	a0,s0
    80005004:	00013403          	ld	s0,0(sp)
    80005008:	01010113          	add	sp,sp,16
    8000500c:	00008067          	ret
    80005010:	00700613          	li	a2,7
    80005014:	00004517          	auipc	a0,0x4
    80005018:	a2450513          	add	a0,a0,-1500 # 80008a38 <digits+0xac0>
    8000501c:	a9dfc0ef          	jal	80001ab8 <printf>
    80005020:	fff00413          	li	s0,-1
    80005024:	fd9ff06f          	j	80004ffc <set_uid+0x40>
    80005028:	00004517          	auipc	a0,0x4
    8000502c:	9d850513          	add	a0,a0,-1576 # 80008a00 <digits+0xa88>
    80005030:	a89fc0ef          	jal	80001ab8 <printf>
    80005034:	fff00413          	li	s0,-1
    80005038:	fc5ff06f          	j	80004ffc <set_uid+0x40>

000000008000503c <count_user_procs>:
    8000503c:	00050593          	mv	a1,a0
    80005040:	00421697          	auipc	a3,0x421
    80005044:	22068693          	add	a3,a3,544 # 80426260 <proc_lock>
    80005048:	00100713          	li	a4,1
    8000504c:	00070793          	mv	a5,a4
    80005050:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80005054:	0007879b          	sext.w	a5,a5
    80005058:	fe079ae3          	bnez	a5,8000504c <count_user_procs+0x10>
    8000505c:	00420797          	auipc	a5,0x420
    80005060:	54c78793          	add	a5,a5,1356 # 804255a8 <proc>
    80005064:	00421617          	auipc	a2,0x421
    80005068:	1c460613          	add	a2,a2,452 # 80426228 <mem_end>
    8000506c:	00000513          	li	a0,0
    80005070:	0007a703          	lw	a4,0(a5)
    80005074:	00070863          	beqz	a4,80005084 <count_user_procs+0x48>
    80005078:	00c7a703          	lw	a4,12(a5)
    8000507c:	00b71463          	bne	a4,a1,80005084 <count_user_procs+0x48>
    80005080:	0015051b          	addw	a0,a0,1
    80005084:	0c878793          	add	a5,a5,200
    80005088:	fef614e3          	bne	a2,a5,80005070 <count_user_procs+0x34>
    8000508c:	0f50000f          	fence	iorw,ow
    80005090:	0806a02f          	amoswap.w	zero,zero,(a3)
    80005094:	00008067          	ret

0000000080005098 <can_fork>:
    80005098:	00050593          	mv	a1,a0
    8000509c:	00421697          	auipc	a3,0x421
    800050a0:	1c468693          	add	a3,a3,452 # 80426260 <proc_lock>
    800050a4:	00100713          	li	a4,1
    800050a8:	00070793          	mv	a5,a4
    800050ac:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    800050b0:	0007879b          	sext.w	a5,a5
    800050b4:	fe079ae3          	bnez	a5,800050a8 <can_fork+0x10>
    800050b8:	00420797          	auipc	a5,0x420
    800050bc:	4f078793          	add	a5,a5,1264 # 804255a8 <proc>
    800050c0:	00421817          	auipc	a6,0x421
    800050c4:	16880813          	add	a6,a6,360 # 80426228 <mem_end>
    800050c8:	00000613          	li	a2,0
    800050cc:	0007a703          	lw	a4,0(a5)
    800050d0:	00070863          	beqz	a4,800050e0 <can_fork+0x48>
    800050d4:	00c7a703          	lw	a4,12(a5)
    800050d8:	00b71463          	bne	a4,a1,800050e0 <can_fork+0x48>
    800050dc:	0016061b          	addw	a2,a2,1
    800050e0:	0c878793          	add	a5,a5,200
    800050e4:	ff0794e3          	bne	a5,a6,800050cc <can_fork+0x34>
    800050e8:	0f50000f          	fence	iorw,ow
    800050ec:	0806a02f          	amoswap.w	zero,zero,(a3)
    800050f0:	00300793          	li	a5,3
    800050f4:	00100513          	li	a0,1
    800050f8:	00c7c463          	blt	a5,a2,80005100 <can_fork+0x68>
    800050fc:	00008067          	ret
    80005100:	ff010113          	add	sp,sp,-16
    80005104:	00400693          	li	a3,4
    80005108:	00004517          	auipc	a0,0x4
    8000510c:	98850513          	add	a0,a0,-1656 # 80008a90 <digits+0xb18>
    80005110:	00113423          	sd	ra,8(sp)
    80005114:	9a5fc0ef          	jal	80001ab8 <printf>
    80005118:	00813083          	ld	ra,8(sp)
    8000511c:	00000513          	li	a0,0
    80005120:	01010113          	add	sp,sp,16
    80005124:	00008067          	ret

0000000080005128 <setup_user_stack>:
    80005128:	08050c63          	beqz	a0,800051c0 <setup_user_stack+0x98>
    8000512c:	01853783          	ld	a5,24(a0)
    80005130:	fe010113          	add	sp,sp,-32
    80005134:	00813823          	sd	s0,16(sp)
    80005138:	00113c23          	sd	ra,24(sp)
    8000513c:	00913423          	sd	s1,8(sp)
    80005140:	00050413          	mv	s0,a0
    80005144:	06078a63          	beqz	a5,800051b8 <setup_user_stack+0x90>
    80005148:	d8dfc0ef          	jal	80001ed4 <alloc_page>
    8000514c:	00050493          	mv	s1,a0
    80005150:	06050463          	beqz	a0,800051b8 <setup_user_stack+0x90>
    80005154:	00001737          	lui	a4,0x1
    80005158:	00e50733          	add	a4,a0,a4
    8000515c:	00050793          	mv	a5,a0
    80005160:	00078023          	sb	zero,0(a5)
    80005164:	00178793          	add	a5,a5,1
    80005168:	fee79ce3          	bne	a5,a4,80005160 <setup_user_stack+0x38>
    8000516c:	040005b7          	lui	a1,0x4000
    80005170:	01843503          	ld	a0,24(s0)
    80005174:	ffd58593          	add	a1,a1,-3 # 3fffffd <_entry-0x7c000003>
    80005178:	01600693          	li	a3,22
    8000517c:	00048613          	mv	a2,s1
    80005180:	00c59593          	sll	a1,a1,0xc
    80005184:	ff9fc0ef          	jal	8000217c <map_page>
    80005188:	02051463          	bnez	a0,800051b0 <setup_user_stack+0x88>
    8000518c:	020007b7          	lui	a5,0x2000
    80005190:	fff78793          	add	a5,a5,-1 # 1ffffff <_entry-0x7e000001>
    80005194:	00d79793          	sll	a5,a5,0xd
    80005198:	02f43c23          	sd	a5,56(s0)
    8000519c:	01813083          	ld	ra,24(sp)
    800051a0:	01013403          	ld	s0,16(sp)
    800051a4:	00813483          	ld	s1,8(sp)
    800051a8:	02010113          	add	sp,sp,32
    800051ac:	00008067          	ret
    800051b0:	00048513          	mv	a0,s1
    800051b4:	d3dfc0ef          	jal	80001ef0 <free_page>
    800051b8:	fff00513          	li	a0,-1
    800051bc:	fe1ff06f          	j	8000519c <setup_user_stack+0x74>
    800051c0:	fff00513          	li	a0,-1
    800051c4:	00008067          	ret

00000000800051c8 <load_user_program>:
    800051c8:	0e050063          	beqz	a0,800052a8 <load_user_program+0xe0>
    800051cc:	fd010113          	add	sp,sp,-48
    800051d0:	01213823          	sd	s2,16(sp)
    800051d4:	02113423          	sd	ra,40(sp)
    800051d8:	02813023          	sd	s0,32(sp)
    800051dc:	00913c23          	sd	s1,24(sp)
    800051e0:	01313423          	sd	s3,8(sp)
    800051e4:	01413023          	sd	s4,0(sp)
    800051e8:	00058913          	mv	s2,a1
    800051ec:	0a058a63          	beqz	a1,800052a0 <load_user_program+0xd8>
    800051f0:	00060493          	mv	s1,a2
    800051f4:	0a060663          	beqz	a2,800052a0 <load_user_program+0xd8>
    800051f8:	02053a03          	ld	s4,32(a0)
    800051fc:	00050413          	mv	s0,a0
    80005200:	01853503          	ld	a0,24(a0)
    80005204:	01460633          	add	a2,a2,s4
    80005208:	000a0593          	mv	a1,s4
    8000520c:	b59fe0ef          	jal	80003d64 <uvmalloc>
    80005210:	00050993          	mv	s3,a0
    80005214:	08050663          	beqz	a0,800052a0 <load_user_program+0xd8>
    80005218:	01843503          	ld	a0,24(s0)
    8000521c:	03343023          	sd	s3,32(s0)
    80005220:	00048693          	mv	a3,s1
    80005224:	00090613          	mv	a2,s2
    80005228:	00000593          	li	a1,0
    8000522c:	999fe0ef          	jal	80003bc4 <copyout>
    80005230:	04054e63          	bltz	a0,8000528c <load_user_program+0xc4>
    80005234:	00040513          	mv	a0,s0
    80005238:	ef1ff0ef          	jal	80005128 <setup_user_stack>
    8000523c:	04054863          	bltz	a0,8000528c <load_user_program+0xc4>
    80005240:	03043783          	ld	a5,48(s0)
    80005244:	11078713          	add	a4,a5,272
    80005248:	02078063          	beqz	a5,80005268 <load_user_program+0xa0>
    8000524c:	00078023          	sb	zero,0(a5)
    80005250:	00178793          	add	a5,a5,1
    80005254:	fee79ce3          	bne	a5,a4,8000524c <load_user_program+0x84>
    80005258:	03043783          	ld	a5,48(s0)
    8000525c:	03843703          	ld	a4,56(s0)
    80005260:	1007b023          	sd	zero,256(a5)
    80005264:	00e7b823          	sd	a4,16(a5)
    80005268:	00000513          	li	a0,0
    8000526c:	02813083          	ld	ra,40(sp)
    80005270:	02013403          	ld	s0,32(sp)
    80005274:	01813483          	ld	s1,24(sp)
    80005278:	01013903          	ld	s2,16(sp)
    8000527c:	00813983          	ld	s3,8(sp)
    80005280:	00013a03          	ld	s4,0(sp)
    80005284:	03010113          	add	sp,sp,48
    80005288:	00008067          	ret
    8000528c:	01843503          	ld	a0,24(s0)
    80005290:	000a0613          	mv	a2,s4
    80005294:	00098593          	mv	a1,s3
    80005298:	a55fe0ef          	jal	80003cec <uvmdealloc>
    8000529c:	03443023          	sd	s4,32(s0)
    800052a0:	fff00513          	li	a0,-1
    800052a4:	fc9ff06f          	j	8000526c <load_user_program+0xa4>
    800052a8:	fff00513          	li	a0,-1
    800052ac:	00008067          	ret

00000000800052b0 <scheduler>:
    800052b0:	fa010113          	add	sp,sp,-96
    800052b4:	04813823          	sd	s0,80(sp)
    800052b8:	00421417          	auipc	s0,0x421
    800052bc:	fa440413          	add	s0,s0,-92 # 8042625c <scheduler_initialized>
    800052c0:	00042783          	lw	a5,0(s0)
    800052c4:	04113c23          	sd	ra,88(sp)
    800052c8:	04913423          	sd	s1,72(sp)
    800052cc:	05213023          	sd	s2,64(sp)
    800052d0:	03313c23          	sd	s3,56(sp)
    800052d4:	03413823          	sd	s4,48(sp)
    800052d8:	03513423          	sd	s5,40(sp)
    800052dc:	03613023          	sd	s6,32(sp)
    800052e0:	01713c23          	sd	s7,24(sp)
    800052e4:	01813823          	sd	s8,16(sp)
    800052e8:	01913423          	sd	s9,8(sp)
    800052ec:	01a13023          	sd	s10,0(sp)
    800052f0:	0e078463          	beqz	a5,800053d8 <scheduler+0x128>
    800052f4:	00421497          	auipc	s1,0x421
    800052f8:	f6448493          	add	s1,s1,-156 # 80426258 <last_index.0>
    800052fc:	00420c17          	auipc	s8,0x420
    80005300:	2acc0c13          	add	s8,s8,684 # 804255a8 <proc>
    80005304:	00420b17          	auipc	s6,0x420
    80005308:	224b0b13          	add	s6,s6,548 # 80425528 <cpus>
    8000530c:	00421a97          	auipc	s5,0x421
    80005310:	f5ca8a93          	add	s5,s5,-164 # 80426268 <current_proc>
    80005314:	0c800d13          	li	s10,200
    80005318:	00200c93          	li	s9,2
    8000531c:	00300a13          	li	s4,3
    80005320:	00003997          	auipc	s3,0x3
    80005324:	7c898993          	add	s3,s3,1992 # 80008ae8 <digits+0xb70>
    80005328:	00420917          	auipc	s2,0x420
    8000532c:	21090913          	add	s2,s2,528 # 80425538 <scheduler_context>
    80005330:	a6cff0ef          	jal	8000459c <intr_on>
    80005334:	0004a783          	lw	a5,0(s1)
    80005338:	0107861b          	addw	a2,a5,16
    8000533c:	0080006f          	j	80005344 <scheduler+0x94>
    80005340:	fef608e3          	beq	a2,a5,80005330 <scheduler+0x80>
    80005344:	41f7d71b          	sraw	a4,a5,0x1f
    80005348:	01c7571b          	srlw	a4,a4,0x1c
    8000534c:	00f7043b          	addw	s0,a4,a5
    80005350:	00f47413          	and	s0,s0,15
    80005354:	40e40bbb          	subw	s7,s0,a4
    80005358:	000b8413          	mv	s0,s7
    8000535c:	03ab8bb3          	mul	s7,s7,s10
    80005360:	0017879b          	addw	a5,a5,1
    80005364:	017c0733          	add	a4,s8,s7
    80005368:	00072683          	lw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    8000536c:	fd969ae3          	bne	a3,s9,80005340 <scheduler+0x90>
    80005370:	00472583          	lw	a1,4(a4)
    80005374:	00098513          	mv	a0,s3
    80005378:	01472023          	sw	s4,0(a4)
    8000537c:	00eb3023          	sd	a4,0(s6)
    80005380:	00eab023          	sd	a4,0(s5)
    80005384:	00421797          	auipc	a5,0x421
    80005388:	ee07a023          	sw	zero,-288(a5) # 80426264 <need_resched>
    8000538c:	f2cfc0ef          	jal	80001ab8 <printf>
    80005390:	a1cff0ef          	jal	800045ac <intr_off>
    80005394:	040b8593          	add	a1,s7,64 # 1040 <_entry-0x7fffefc0>
    80005398:	00bc05b3          	add	a1,s8,a1
    8000539c:	00090513          	mv	a0,s2
    800053a0:	241000ef          	jal	80005de0 <switch_context>
    800053a4:	0014041b          	addw	s0,s0,1
    800053a8:	9f4ff0ef          	jal	8000459c <intr_on>
    800053ac:	41f4571b          	sraw	a4,s0,0x1f
    800053b0:	01c7571b          	srlw	a4,a4,0x1c
    800053b4:	00e4043b          	addw	s0,s0,a4
    800053b8:	00f47793          	and	a5,s0,15
    800053bc:	40e787bb          	subw	a5,a5,a4
    800053c0:	00f4a023          	sw	a5,0(s1)
    800053c4:	00420717          	auipc	a4,0x420
    800053c8:	16073223          	sd	zero,356(a4) # 80425528 <cpus>
    800053cc:	00421717          	auipc	a4,0x421
    800053d0:	e8073e23          	sd	zero,-356(a4) # 80426268 <current_proc>
    800053d4:	f5dff06f          	j	80005330 <scheduler+0x80>
    800053d8:	00003517          	auipc	a0,0x3
    800053dc:	6f050513          	add	a0,a0,1776 # 80008ac8 <digits+0xb50>
    800053e0:	a49fc0ef          	jal	80001e28 <uart_puts>
    800053e4:	00100793          	li	a5,1
    800053e8:	00f42023          	sw	a5,0(s0)
    800053ec:	f09ff06f          	j	800052f4 <scheduler+0x44>

00000000800053f0 <yield>:
    800053f0:	fe010113          	add	sp,sp,-32
    800053f4:	00813823          	sd	s0,16(sp)
    800053f8:	00113c23          	sd	ra,24(sp)
    800053fc:	00913423          	sd	s1,8(sp)
    80005400:	00421417          	auipc	s0,0x421
    80005404:	e6843403          	ld	s0,-408(s0) # 80426268 <current_proc>
    80005408:	06040263          	beqz	s0,8000546c <yield+0x7c>
    8000540c:	9b0ff0ef          	jal	800045bc <intr_get>
    80005410:	00050493          	mv	s1,a0
    80005414:	998ff0ef          	jal	800045ac <intr_off>
    80005418:	00421717          	auipc	a4,0x421
    8000541c:	e4870713          	add	a4,a4,-440 # 80426260 <proc_lock>
    80005420:	00100693          	li	a3,1
    80005424:	00068793          	mv	a5,a3
    80005428:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    8000542c:	0007879b          	sext.w	a5,a5
    80005430:	fe079ae3          	bnez	a5,80005424 <yield+0x34>
    80005434:	00042683          	lw	a3,0(s0)
    80005438:	00300793          	li	a5,3
    8000543c:	04f68263          	beq	a3,a5,80005480 <yield+0x90>
    80005440:	0f50000f          	fence	iorw,ow
    80005444:	0807202f          	amoswap.w	zero,zero,(a4)
    80005448:	00442583          	lw	a1,4(s0)
    8000544c:	00003517          	auipc	a0,0x3
    80005450:	6cc50513          	add	a0,a0,1740 # 80008b18 <digits+0xba0>
    80005454:	e64fc0ef          	jal	80001ab8 <printf>
    80005458:	00420597          	auipc	a1,0x420
    8000545c:	0e058593          	add	a1,a1,224 # 80425538 <scheduler_context>
    80005460:	04040513          	add	a0,s0,64
    80005464:	17d000ef          	jal	80005de0 <switch_context>
    80005468:	02049263          	bnez	s1,8000548c <yield+0x9c>
    8000546c:	01813083          	ld	ra,24(sp)
    80005470:	01013403          	ld	s0,16(sp)
    80005474:	00813483          	ld	s1,8(sp)
    80005478:	02010113          	add	sp,sp,32
    8000547c:	00008067          	ret
    80005480:	00200793          	li	a5,2
    80005484:	00f42023          	sw	a5,0(s0)
    80005488:	fb9ff06f          	j	80005440 <yield+0x50>
    8000548c:	01013403          	ld	s0,16(sp)
    80005490:	01813083          	ld	ra,24(sp)
    80005494:	00813483          	ld	s1,8(sp)
    80005498:	02010113          	add	sp,sp,32
    8000549c:	900ff06f          	j	8000459c <intr_on>

00000000800054a0 <fork>:
    800054a0:	fe010113          	add	sp,sp,-32
    800054a4:	00913423          	sd	s1,8(sp)
    800054a8:	00113c23          	sd	ra,24(sp)
    800054ac:	00813823          	sd	s0,16(sp)
    800054b0:	00421497          	auipc	s1,0x421
    800054b4:	db84b483          	ld	s1,-584(s1) # 80426268 <current_proc>
    800054b8:	14048463          	beqz	s1,80005600 <fork+0x160>
    800054bc:	00c4a403          	lw	s0,12(s1)
    800054c0:	00040513          	mv	a0,s0
    800054c4:	b79ff0ef          	jal	8000503c <count_user_procs>
    800054c8:	00300793          	li	a5,3
    800054cc:	0ea7c463          	blt	a5,a0,800055b4 <fork+0x114>
    800054d0:	fa0ff0ef          	jal	80004c70 <alloc_proc>
    800054d4:	00050413          	mv	s0,a0
    800054d8:	12050e63          	beqz	a0,80005614 <fork+0x174>
    800054dc:	00c4a783          	lw	a5,12(s1)
    800054e0:	01853583          	ld	a1,24(a0)
    800054e4:	0204b603          	ld	a2,32(s1)
    800054e8:	0184b503          	ld	a0,24(s1)
    800054ec:	00f42623          	sw	a5,12(s0)
    800054f0:	e39fe0ef          	jal	80004328 <uvmcopy>
    800054f4:	0e054863          	bltz	a0,800055e4 <fork+0x144>
    800054f8:	0204b703          	ld	a4,32(s1)
    800054fc:	00421797          	auipc	a5,0x421
    80005500:	d6478793          	add	a5,a5,-668 # 80426260 <proc_lock>
    80005504:	00100693          	li	a3,1
    80005508:	02e43023          	sd	a4,32(s0)
    8000550c:	00068713          	mv	a4,a3
    80005510:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    80005514:	0007071b          	sext.w	a4,a4
    80005518:	fe071ae3          	bnez	a4,8000550c <fork+0x6c>
    8000551c:	0044a703          	lw	a4,4(s1)
    80005520:	0a943823          	sd	s1,176(s0)
    80005524:	00e42423          	sw	a4,8(s0)
    80005528:	0f50000f          	fence	iorw,ow
    8000552c:	0807a02f          	amoswap.w	zero,zero,(a5)
    80005530:	0304b703          	ld	a4,48(s1)
    80005534:	02070663          	beqz	a4,80005560 <fork+0xc0>
    80005538:	03043683          	ld	a3,48(s0)
    8000553c:	02068263          	beqz	a3,80005560 <fork+0xc0>
    80005540:	11070593          	add	a1,a4,272
    80005544:	00074603          	lbu	a2,0(a4)
    80005548:	00170713          	add	a4,a4,1
    8000554c:	00168693          	add	a3,a3,1
    80005550:	fec68fa3          	sb	a2,-1(a3)
    80005554:	feb718e3          	bne	a4,a1,80005544 <fork+0xa4>
    80005558:	03043703          	ld	a4,48(s0)
    8000555c:	04073823          	sd	zero,80(a4)
    80005560:	00100693          	li	a3,1
    80005564:	00068713          	mv	a4,a3
    80005568:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    8000556c:	0007071b          	sext.w	a4,a4
    80005570:	fe071ae3          	bnez	a4,80005564 <fork+0xc4>
    80005574:	00200713          	li	a4,2
    80005578:	00e42023          	sw	a4,0(s0)
    8000557c:	0f50000f          	fence	iorw,ow
    80005580:	0807a02f          	amoswap.w	zero,zero,(a5)
    80005584:	00c42683          	lw	a3,12(s0)
    80005588:	0044a603          	lw	a2,4(s1)
    8000558c:	00442583          	lw	a1,4(s0)
    80005590:	00003517          	auipc	a0,0x3
    80005594:	62850513          	add	a0,a0,1576 # 80008bb8 <digits+0xc40>
    80005598:	d20fc0ef          	jal	80001ab8 <printf>
    8000559c:	00442503          	lw	a0,4(s0)
    800055a0:	01813083          	ld	ra,24(sp)
    800055a4:	01013403          	ld	s0,16(sp)
    800055a8:	00813483          	ld	s1,8(sp)
    800055ac:	02010113          	add	sp,sp,32
    800055b0:	00008067          	ret
    800055b4:	00050613          	mv	a2,a0
    800055b8:	00400693          	li	a3,4
    800055bc:	00040593          	mv	a1,s0
    800055c0:	00003517          	auipc	a0,0x3
    800055c4:	4d050513          	add	a0,a0,1232 # 80008a90 <digits+0xb18>
    800055c8:	cf0fc0ef          	jal	80001ab8 <printf>
    800055cc:	fff00513          	li	a0,-1
    800055d0:	01813083          	ld	ra,24(sp)
    800055d4:	01013403          	ld	s0,16(sp)
    800055d8:	00813483          	ld	s1,8(sp)
    800055dc:	02010113          	add	sp,sp,32
    800055e0:	00008067          	ret
    800055e4:	00003517          	auipc	a0,0x3
    800055e8:	5ac50513          	add	a0,a0,1452 # 80008b90 <digits+0xc18>
    800055ec:	83dfc0ef          	jal	80001e28 <uart_puts>
    800055f0:	00040513          	mv	a0,s0
    800055f4:	83dff0ef          	jal	80004e30 <free_proc>
    800055f8:	fff00513          	li	a0,-1
    800055fc:	fd5ff06f          	j	800055d0 <fork+0x130>
    80005600:	00003517          	auipc	a0,0x3
    80005604:	53850513          	add	a0,a0,1336 # 80008b38 <digits+0xbc0>
    80005608:	821fc0ef          	jal	80001e28 <uart_puts>
    8000560c:	fff00513          	li	a0,-1
    80005610:	fc1ff06f          	j	800055d0 <fork+0x130>
    80005614:	00003517          	auipc	a0,0x3
    80005618:	54c50513          	add	a0,a0,1356 # 80008b60 <digits+0xbe8>
    8000561c:	80dfc0ef          	jal	80001e28 <uart_puts>
    80005620:	fff00513          	li	a0,-1
    80005624:	fadff06f          	j	800055d0 <fork+0x130>

0000000080005628 <growproc>:
    80005628:	ff010113          	add	sp,sp,-16
    8000562c:	00813023          	sd	s0,0(sp)
    80005630:	00113423          	sd	ra,8(sp)
    80005634:	00421417          	auipc	s0,0x421
    80005638:	c3443403          	ld	s0,-972(s0) # 80426268 <current_proc>
    8000563c:	04040063          	beqz	s0,8000567c <growproc+0x54>
    80005640:	02043583          	ld	a1,32(s0)
    80005644:	00050613          	mv	a2,a0
    80005648:	02a04063          	bgtz	a0,80005668 <growproc+0x40>
    8000564c:	02051c63          	bnez	a0,80005684 <growproc+0x5c>
    80005650:	02b43023          	sd	a1,32(s0)
    80005654:	00000513          	li	a0,0
    80005658:	00813083          	ld	ra,8(sp)
    8000565c:	00013403          	ld	s0,0(sp)
    80005660:	01010113          	add	sp,sp,16
    80005664:	00008067          	ret
    80005668:	01843503          	ld	a0,24(s0)
    8000566c:	00b60633          	add	a2,a2,a1
    80005670:	ef4fe0ef          	jal	80003d64 <uvmalloc>
    80005674:	00050593          	mv	a1,a0
    80005678:	fc051ce3          	bnez	a0,80005650 <growproc+0x28>
    8000567c:	fff00513          	li	a0,-1
    80005680:	fd9ff06f          	j	80005658 <growproc+0x30>
    80005684:	01843503          	ld	a0,24(s0)
    80005688:	00b60633          	add	a2,a2,a1
    8000568c:	e60fe0ef          	jal	80003cec <uvmdealloc>
    80005690:	00050593          	mv	a1,a0
    80005694:	fbdff06f          	j	80005650 <growproc+0x28>

0000000080005698 <exit>:
    80005698:	00421697          	auipc	a3,0x421
    8000569c:	bd06b683          	ld	a3,-1072(a3) # 80426268 <current_proc>
    800056a0:	08068e63          	beqz	a3,8000573c <exit+0xa4>
    800056a4:	ff010113          	add	sp,sp,-16
    800056a8:	00813023          	sd	s0,0(sp)
    800056ac:	00113423          	sd	ra,8(sp)
    800056b0:	00050613          	mv	a2,a0
    800056b4:	00421417          	auipc	s0,0x421
    800056b8:	bac40413          	add	s0,s0,-1108 # 80426260 <proc_lock>
    800056bc:	00100713          	li	a4,1
    800056c0:	00070793          	mv	a5,a4
    800056c4:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800056c8:	0007879b          	sext.w	a5,a5
    800056cc:	fe079ae3          	bnez	a5,800056c0 <exit+0x28>
    800056d0:	00500793          	li	a5,5
    800056d4:	00f6a023          	sw	a5,0(a3)
    800056d8:	00c6a823          	sw	a2,16(a3)
    800056dc:	00420797          	auipc	a5,0x420
    800056e0:	f7c78793          	add	a5,a5,-132 # 80425658 <proc+0xb0>
    800056e4:	00421597          	auipc	a1,0x421
    800056e8:	bf458593          	add	a1,a1,-1036 # 804262d8 <bss_end+0x68>
    800056ec:	00100513          	li	a0,1
    800056f0:	00c0006f          	j	800056fc <exit+0x64>
    800056f4:	0c878793          	add	a5,a5,200
    800056f8:	00b78e63          	beq	a5,a1,80005714 <exit+0x7c>
    800056fc:	0007b703          	ld	a4,0(a5)
    80005700:	fed71ae3          	bne	a4,a3,800056f4 <exit+0x5c>
    80005704:	0007b023          	sd	zero,0(a5)
    80005708:	f4a7ac23          	sw	a0,-168(a5)
    8000570c:	0c878793          	add	a5,a5,200
    80005710:	feb796e3          	bne	a5,a1,800056fc <exit+0x64>
    80005714:	0046a583          	lw	a1,4(a3)
    80005718:	00003517          	auipc	a0,0x3
    8000571c:	4d850513          	add	a0,a0,1240 # 80008bf0 <digits+0xc78>
    80005720:	b98fc0ef          	jal	80001ab8 <printf>
    80005724:	0f50000f          	fence	iorw,ow
    80005728:	0804202f          	amoswap.w	zero,zero,(s0)
    8000572c:	00013403          	ld	s0,0(sp)
    80005730:	00813083          	ld	ra,8(sp)
    80005734:	01010113          	add	sp,sp,16
    80005738:	cb9ff06f          	j	800053f0 <yield>
    8000573c:	00008067          	ret

0000000080005740 <wait>:
    80005740:	fb010113          	add	sp,sp,-80
    80005744:	01813023          	sd	s8,0(sp)
    80005748:	00421c17          	auipc	s8,0x421
    8000574c:	b20c0c13          	add	s8,s8,-1248 # 80426268 <current_proc>
    80005750:	02913c23          	sd	s1,56(sp)
    80005754:	000c3483          	ld	s1,0(s8)
    80005758:	04113423          	sd	ra,72(sp)
    8000575c:	04813023          	sd	s0,64(sp)
    80005760:	03213823          	sd	s2,48(sp)
    80005764:	03313423          	sd	s3,40(sp)
    80005768:	03413023          	sd	s4,32(sp)
    8000576c:	01513c23          	sd	s5,24(sp)
    80005770:	01613823          	sd	s6,16(sp)
    80005774:	01713423          	sd	s7,8(sp)
    80005778:	10048063          	beqz	s1,80005878 <wait+0x138>
    8000577c:	00050913          	mv	s2,a0
    80005780:	00421417          	auipc	s0,0x421
    80005784:	ae040413          	add	s0,s0,-1312 # 80426260 <proc_lock>
    80005788:	00100a13          	li	s4,1
    8000578c:	00500b93          	li	s7,5
    80005790:	01000a93          	li	s5,16
    80005794:	00421b17          	auipc	s6,0x421
    80005798:	a94b0b13          	add	s6,s6,-1388 # 80426228 <mem_end>
    8000579c:	00400993          	li	s3,4
    800057a0:	000a0793          	mv	a5,s4
    800057a4:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800057a8:	0007879b          	sext.w	a5,a5
    800057ac:	fe079ae3          	bnez	a5,800057a0 <wait+0x60>
    800057b0:	00420797          	auipc	a5,0x420
    800057b4:	df878793          	add	a5,a5,-520 # 804255a8 <proc>
    800057b8:	00078593          	mv	a1,a5
    800057bc:	00078713          	mv	a4,a5
    800057c0:	00000693          	li	a3,0
    800057c4:	0100006f          	j	800057d4 <wait+0x94>
    800057c8:	0016869b          	addw	a3,a3,1
    800057cc:	0c870713          	add	a4,a4,200
    800057d0:	09568863          	beq	a3,s5,80005860 <wait+0x120>
    800057d4:	0b073603          	ld	a2,176(a4)
    800057d8:	fe9618e3          	bne	a2,s1,800057c8 <wait+0x88>
    800057dc:	00072603          	lw	a2,0(a4)
    800057e0:	ff7614e3          	bne	a2,s7,800057c8 <wait+0x88>
    800057e4:	0c800793          	li	a5,200
    800057e8:	02f686b3          	mul	a3,a3,a5
    800057ec:	00d58533          	add	a0,a1,a3
    800057f0:	00452483          	lw	s1,4(a0)
    800057f4:	00090663          	beqz	s2,80005800 <wait+0xc0>
    800057f8:	01052783          	lw	a5,16(a0)
    800057fc:	00f92023          	sw	a5,0(s2)
    80005800:	e30ff0ef          	jal	80004e30 <free_proc>
    80005804:	00048593          	mv	a1,s1
    80005808:	00003517          	auipc	a0,0x3
    8000580c:	41850513          	add	a0,a0,1048 # 80008c20 <digits+0xca8>
    80005810:	aa8fc0ef          	jal	80001ab8 <printf>
    80005814:	0f50000f          	fence	iorw,ow
    80005818:	0804202f          	amoswap.w	zero,zero,(s0)
    8000581c:	04813083          	ld	ra,72(sp)
    80005820:	04013403          	ld	s0,64(sp)
    80005824:	03013903          	ld	s2,48(sp)
    80005828:	02813983          	ld	s3,40(sp)
    8000582c:	02013a03          	ld	s4,32(sp)
    80005830:	01813a83          	ld	s5,24(sp)
    80005834:	01013b03          	ld	s6,16(sp)
    80005838:	00813b83          	ld	s7,8(sp)
    8000583c:	00013c03          	ld	s8,0(sp)
    80005840:	00048513          	mv	a0,s1
    80005844:	03813483          	ld	s1,56(sp)
    80005848:	05010113          	add	sp,sp,80
    8000584c:	00008067          	ret
    80005850:	0007a703          	lw	a4,0(a5)
    80005854:	02071663          	bnez	a4,80005880 <wait+0x140>
    80005858:	0c878793          	add	a5,a5,200
    8000585c:	01678a63          	beq	a5,s6,80005870 <wait+0x130>
    80005860:	0b07b703          	ld	a4,176(a5)
    80005864:	fe9706e3          	beq	a4,s1,80005850 <wait+0x110>
    80005868:	0c878793          	add	a5,a5,200
    8000586c:	ff679ae3          	bne	a5,s6,80005860 <wait+0x120>
    80005870:	0f50000f          	fence	iorw,ow
    80005874:	0804202f          	amoswap.w	zero,zero,(s0)
    80005878:	fff00493          	li	s1,-1
    8000587c:	fa1ff06f          	j	8000581c <wait+0xdc>
    80005880:	0f50000f          	fence	iorw,ow
    80005884:	0804202f          	amoswap.w	zero,zero,(s0)
    80005888:	000c3703          	ld	a4,0(s8)
    8000588c:	f0070ae3          	beqz	a4,800057a0 <wait+0x60>
    80005890:	000a0793          	mv	a5,s4
    80005894:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80005898:	0007879b          	sext.w	a5,a5
    8000589c:	fe079ae3          	bnez	a5,80005890 <wait+0x150>
    800058a0:	01372023          	sw	s3,0(a4)
    800058a4:	0a973c23          	sd	s1,184(a4)
    800058a8:	0f50000f          	fence	iorw,ow
    800058ac:	0804202f          	amoswap.w	zero,zero,(s0)
    800058b0:	b41ff0ef          	jal	800053f0 <yield>
    800058b4:	eedff06f          	j	800057a0 <wait+0x60>

00000000800058b8 <kill>:
    800058b8:	00420597          	auipc	a1,0x420
    800058bc:	cf058593          	add	a1,a1,-784 # 804255a8 <proc>
    800058c0:	00058793          	mv	a5,a1
    800058c4:	00000713          	li	a4,0
    800058c8:	01000613          	li	a2,16
    800058cc:	0100006f          	j	800058dc <kill+0x24>
    800058d0:	0017071b          	addw	a4,a4,1
    800058d4:	0c878793          	add	a5,a5,200
    800058d8:	06c70263          	beq	a4,a2,8000593c <kill+0x84>
    800058dc:	0047a683          	lw	a3,4(a5)
    800058e0:	fea698e3          	bne	a3,a0,800058d0 <kill+0x18>
    800058e4:	0007a683          	lw	a3,0(a5)
    800058e8:	fe0684e3          	beqz	a3,800058d0 <kill+0x18>
    800058ec:	00421697          	auipc	a3,0x421
    800058f0:	97468693          	add	a3,a3,-1676 # 80426260 <proc_lock>
    800058f4:	00100613          	li	a2,1
    800058f8:	00060793          	mv	a5,a2
    800058fc:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80005900:	0007879b          	sext.w	a5,a5
    80005904:	fe079ae3          	bnez	a5,800058f8 <kill+0x40>
    80005908:	0c800793          	li	a5,200
    8000590c:	02f70733          	mul	a4,a4,a5
    80005910:	00100613          	li	a2,1
    80005914:	00400793          	li	a5,4
    80005918:	00e585b3          	add	a1,a1,a4
    8000591c:	0005a703          	lw	a4,0(a1)
    80005920:	00c5aa23          	sw	a2,20(a1)
    80005924:	00f71663          	bne	a4,a5,80005930 <kill+0x78>
    80005928:	00200793          	li	a5,2
    8000592c:	00f5a023          	sw	a5,0(a1)
    80005930:	0f50000f          	fence	iorw,ow
    80005934:	0806a02f          	amoswap.w	zero,zero,(a3)
    80005938:	00008067          	ret
    8000593c:	00008067          	ret

0000000080005940 <sleep>:
    80005940:	00421617          	auipc	a2,0x421
    80005944:	92863603          	ld	a2,-1752(a2) # 80426268 <current_proc>
    80005948:	02060c63          	beqz	a2,80005980 <sleep+0x40>
    8000594c:	00421717          	auipc	a4,0x421
    80005950:	91470713          	add	a4,a4,-1772 # 80426260 <proc_lock>
    80005954:	00100693          	li	a3,1
    80005958:	00068793          	mv	a5,a3
    8000595c:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80005960:	0007879b          	sext.w	a5,a5
    80005964:	fe079ae3          	bnez	a5,80005958 <sleep+0x18>
    80005968:	00400793          	li	a5,4
    8000596c:	00f62023          	sw	a5,0(a2)
    80005970:	0aa63c23          	sd	a0,184(a2)
    80005974:	0f50000f          	fence	iorw,ow
    80005978:	0807202f          	amoswap.w	zero,zero,(a4)
    8000597c:	a75ff06f          	j	800053f0 <yield>
    80005980:	00008067          	ret

0000000080005984 <wakeup>:
    80005984:	00421697          	auipc	a3,0x421
    80005988:	8dc68693          	add	a3,a3,-1828 # 80426260 <proc_lock>
    8000598c:	00100713          	li	a4,1
    80005990:	00070793          	mv	a5,a4
    80005994:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80005998:	0007879b          	sext.w	a5,a5
    8000599c:	fe079ae3          	bnez	a5,80005990 <wakeup+0xc>
    800059a0:	00420797          	auipc	a5,0x420
    800059a4:	c0878793          	add	a5,a5,-1016 # 804255a8 <proc>
    800059a8:	00421597          	auipc	a1,0x421
    800059ac:	88058593          	add	a1,a1,-1920 # 80426228 <mem_end>
    800059b0:	00400613          	li	a2,4
    800059b4:	00200813          	li	a6,2
    800059b8:	00c0006f          	j	800059c4 <wakeup+0x40>
    800059bc:	0c878793          	add	a5,a5,200
    800059c0:	02f58063          	beq	a1,a5,800059e0 <wakeup+0x5c>
    800059c4:	0007a703          	lw	a4,0(a5)
    800059c8:	fec71ae3          	bne	a4,a2,800059bc <wakeup+0x38>
    800059cc:	0b87b703          	ld	a4,184(a5)
    800059d0:	fea716e3          	bne	a4,a0,800059bc <wakeup+0x38>
    800059d4:	0107a023          	sw	a6,0(a5)
    800059d8:	0c878793          	add	a5,a5,200
    800059dc:	fef594e3          	bne	a1,a5,800059c4 <wakeup+0x40>
    800059e0:	0f50000f          	fence	iorw,ow
    800059e4:	0806a02f          	amoswap.w	zero,zero,(a3)
    800059e8:	00008067          	ret

00000000800059ec <wakeup_one>:
    800059ec:	00421617          	auipc	a2,0x421
    800059f0:	87460613          	add	a2,a2,-1932 # 80426260 <proc_lock>
    800059f4:	00100713          	li	a4,1
    800059f8:	00070793          	mv	a5,a4
    800059fc:	0cf627af          	amoswap.w.aq	a5,a5,(a2)
    80005a00:	0007879b          	sext.w	a5,a5
    80005a04:	fe079ae3          	bnez	a5,800059f8 <wakeup_one+0xc>
    80005a08:	00420897          	auipc	a7,0x420
    80005a0c:	ba088893          	add	a7,a7,-1120 # 804255a8 <proc>
    80005a10:	00088793          	mv	a5,a7
    80005a14:	00000713          	li	a4,0
    80005a18:	00400593          	li	a1,4
    80005a1c:	01000813          	li	a6,16
    80005a20:	0100006f          	j	80005a30 <wakeup_one+0x44>
    80005a24:	0017071b          	addw	a4,a4,1
    80005a28:	0c878793          	add	a5,a5,200
    80005a2c:	03070463          	beq	a4,a6,80005a54 <wakeup_one+0x68>
    80005a30:	0007a683          	lw	a3,0(a5)
    80005a34:	feb698e3          	bne	a3,a1,80005a24 <wakeup_one+0x38>
    80005a38:	0b87b683          	ld	a3,184(a5)
    80005a3c:	fea694e3          	bne	a3,a0,80005a24 <wakeup_one+0x38>
    80005a40:	0c800793          	li	a5,200
    80005a44:	02f70733          	mul	a4,a4,a5
    80005a48:	00200793          	li	a5,2
    80005a4c:	00e888b3          	add	a7,a7,a4
    80005a50:	00f8a023          	sw	a5,0(a7)
    80005a54:	0f50000f          	fence	iorw,ow
    80005a58:	0806202f          	amoswap.w	zero,zero,(a2)
    80005a5c:	00008067          	ret

0000000080005a60 <machinevec>:
    80005a60:	f0810113          	add	sp,sp,-248
    80005a64:	00113023          	sd	ra,0(sp)
    80005a68:	00313823          	sd	gp,16(sp)
    80005a6c:	00413c23          	sd	tp,24(sp)
    80005a70:	02513023          	sd	t0,32(sp)
    80005a74:	02613423          	sd	t1,40(sp)
    80005a78:	02713823          	sd	t2,48(sp)
    80005a7c:	02813c23          	sd	s0,56(sp)
    80005a80:	04913023          	sd	s1,64(sp)
    80005a84:	04a13423          	sd	a0,72(sp)
    80005a88:	04b13823          	sd	a1,80(sp)
    80005a8c:	04c13c23          	sd	a2,88(sp)
    80005a90:	06d13023          	sd	a3,96(sp)
    80005a94:	06e13423          	sd	a4,104(sp)
    80005a98:	06f13823          	sd	a5,112(sp)
    80005a9c:	07013c23          	sd	a6,120(sp)
    80005aa0:	09113023          	sd	a7,128(sp)
    80005aa4:	09213423          	sd	s2,136(sp)
    80005aa8:	09313823          	sd	s3,144(sp)
    80005aac:	09413c23          	sd	s4,152(sp)
    80005ab0:	0b513023          	sd	s5,160(sp)
    80005ab4:	0b613423          	sd	s6,168(sp)
    80005ab8:	0b713823          	sd	s7,176(sp)
    80005abc:	0b813c23          	sd	s8,184(sp)
    80005ac0:	0d913023          	sd	s9,192(sp)
    80005ac4:	0da13423          	sd	s10,200(sp)
    80005ac8:	0db13823          	sd	s11,208(sp)
    80005acc:	0dc13c23          	sd	t3,216(sp)
    80005ad0:	0fd13023          	sd	t4,224(sp)
    80005ad4:	0fe13423          	sd	t5,232(sp)
    80005ad8:	0ff13823          	sd	t6,240(sp)
    80005adc:	0f810293          	add	t0,sp,248
    80005ae0:	00513423          	sd	t0,8(sp)
    80005ae4:	34202573          	csrr	a0,mcause
    80005ae8:	fff0029b          	addw	t0,zero,-1
    80005aec:	03f29293          	sll	t0,t0,0x3f
    80005af0:	00728293          	add	t0,t0,7
    80005af4:	00551663          	bne	a0,t0,80005b00 <interrupt_return>
    80005af8:	999fe0ef          	jal	80004490 <machine_timer_handler>
    80005afc:	0040006f          	j	80005b00 <interrupt_return>

0000000080005b00 <interrupt_return>:
    80005b00:	00013083          	ld	ra,0(sp)
    80005b04:	01013183          	ld	gp,16(sp)
    80005b08:	01813203          	ld	tp,24(sp)
    80005b0c:	02013283          	ld	t0,32(sp)
    80005b10:	02813303          	ld	t1,40(sp)
    80005b14:	03013383          	ld	t2,48(sp)
    80005b18:	03813403          	ld	s0,56(sp)
    80005b1c:	04013483          	ld	s1,64(sp)
    80005b20:	04813503          	ld	a0,72(sp)
    80005b24:	05013583          	ld	a1,80(sp)
    80005b28:	05813603          	ld	a2,88(sp)
    80005b2c:	06013683          	ld	a3,96(sp)
    80005b30:	06813703          	ld	a4,104(sp)
    80005b34:	07013783          	ld	a5,112(sp)
    80005b38:	07813803          	ld	a6,120(sp)
    80005b3c:	08013883          	ld	a7,128(sp)
    80005b40:	08813903          	ld	s2,136(sp)
    80005b44:	09013983          	ld	s3,144(sp)
    80005b48:	09813a03          	ld	s4,152(sp)
    80005b4c:	0a013a83          	ld	s5,160(sp)
    80005b50:	0a813b03          	ld	s6,168(sp)
    80005b54:	0b013b83          	ld	s7,176(sp)
    80005b58:	0b813c03          	ld	s8,184(sp)
    80005b5c:	0c013c83          	ld	s9,192(sp)
    80005b60:	0c813d03          	ld	s10,200(sp)
    80005b64:	0d013d83          	ld	s11,208(sp)
    80005b68:	0d813e03          	ld	t3,216(sp)
    80005b6c:	0e013e83          	ld	t4,224(sp)
    80005b70:	0e813f03          	ld	t5,232(sp)
    80005b74:	0f013f83          	ld	t6,240(sp)
    80005b78:	00813103          	ld	sp,8(sp)
    80005b7c:	30200073          	mret

0000000080005b80 <kernelvec>:
    80005b80:	ef010113          	add	sp,sp,-272
    80005b84:	00013023          	sd	zero,0(sp)
    80005b88:	00113423          	sd	ra,8(sp)
    80005b8c:	00313c23          	sd	gp,24(sp)
    80005b90:	02413023          	sd	tp,32(sp)
    80005b94:	02513423          	sd	t0,40(sp)
    80005b98:	02613823          	sd	t1,48(sp)
    80005b9c:	02713c23          	sd	t2,56(sp)
    80005ba0:	04813023          	sd	s0,64(sp)
    80005ba4:	04913423          	sd	s1,72(sp)
    80005ba8:	04a13823          	sd	a0,80(sp)
    80005bac:	04b13c23          	sd	a1,88(sp)
    80005bb0:	06c13023          	sd	a2,96(sp)
    80005bb4:	06d13423          	sd	a3,104(sp)
    80005bb8:	06e13823          	sd	a4,112(sp)
    80005bbc:	06f13c23          	sd	a5,120(sp)
    80005bc0:	09013023          	sd	a6,128(sp)
    80005bc4:	09113423          	sd	a7,136(sp)
    80005bc8:	09213823          	sd	s2,144(sp)
    80005bcc:	09313c23          	sd	s3,152(sp)
    80005bd0:	0b413023          	sd	s4,160(sp)
    80005bd4:	0b513423          	sd	s5,168(sp)
    80005bd8:	0b613823          	sd	s6,176(sp)
    80005bdc:	0b713c23          	sd	s7,184(sp)
    80005be0:	0d813023          	sd	s8,192(sp)
    80005be4:	0d913423          	sd	s9,200(sp)
    80005be8:	0da13823          	sd	s10,208(sp)
    80005bec:	0db13c23          	sd	s11,216(sp)
    80005bf0:	0fc13023          	sd	t3,224(sp)
    80005bf4:	0fd13423          	sd	t4,232(sp)
    80005bf8:	0fe13823          	sd	t5,240(sp)
    80005bfc:	0ff13c23          	sd	t6,248(sp)
    80005c00:	11010293          	add	t0,sp,272
    80005c04:	00513823          	sd	t0,16(sp)
    80005c08:	141022f3          	csrr	t0,sepc
    80005c0c:	10513023          	sd	t0,256(sp)
    80005c10:	142022f3          	csrr	t0,scause
    80005c14:	10513423          	sd	t0,264(sp)
    80005c18:	f15fe0ef          	jal	80004b2c <kerneltrap>
    80005c1c:	00813083          	ld	ra,8(sp)
    80005c20:	01813183          	ld	gp,24(sp)
    80005c24:	02013203          	ld	tp,32(sp)
    80005c28:	02813283          	ld	t0,40(sp)
    80005c2c:	03013303          	ld	t1,48(sp)
    80005c30:	03813383          	ld	t2,56(sp)
    80005c34:	04013403          	ld	s0,64(sp)
    80005c38:	04813483          	ld	s1,72(sp)
    80005c3c:	05013503          	ld	a0,80(sp)
    80005c40:	05813583          	ld	a1,88(sp)
    80005c44:	06013603          	ld	a2,96(sp)
    80005c48:	06813683          	ld	a3,104(sp)
    80005c4c:	07013703          	ld	a4,112(sp)
    80005c50:	07813783          	ld	a5,120(sp)
    80005c54:	08013803          	ld	a6,128(sp)
    80005c58:	08813883          	ld	a7,136(sp)
    80005c5c:	09013903          	ld	s2,144(sp)
    80005c60:	09813983          	ld	s3,152(sp)
    80005c64:	0a013a03          	ld	s4,160(sp)
    80005c68:	0a813a83          	ld	s5,168(sp)
    80005c6c:	0b013b03          	ld	s6,176(sp)
    80005c70:	0b813b83          	ld	s7,184(sp)
    80005c74:	0c013c03          	ld	s8,192(sp)
    80005c78:	0c813c83          	ld	s9,200(sp)
    80005c7c:	0d013d03          	ld	s10,208(sp)
    80005c80:	0d813d83          	ld	s11,216(sp)
    80005c84:	0e013e03          	ld	t3,224(sp)
    80005c88:	0e813e83          	ld	t4,232(sp)
    80005c8c:	0f013f03          	ld	t5,240(sp)
    80005c90:	0f813f83          	ld	t6,248(sp)
    80005c94:	10013283          	ld	t0,256(sp)
    80005c98:	14129073          	csrw	sepc,t0
    80005c9c:	10813283          	ld	t0,264(sp)
    80005ca0:	14229073          	csrw	scause,t0
    80005ca4:	01013103          	ld	sp,16(sp)
    80005ca8:	10200073          	sret
    80005cac:	0000                	.2byte	0x0
	...

0000000080005cb0 <uservec>:
    80005cb0:	00010293          	mv	t0,sp
    80005cb4:	ef010113          	add	sp,sp,-272
    80005cb8:	00513823          	sd	t0,16(sp)
    80005cbc:	00113423          	sd	ra,8(sp)
    80005cc0:	00313c23          	sd	gp,24(sp)
    80005cc4:	02413023          	sd	tp,32(sp)
    80005cc8:	02513423          	sd	t0,40(sp)
    80005ccc:	02613823          	sd	t1,48(sp)
    80005cd0:	02713c23          	sd	t2,56(sp)
    80005cd4:	04813023          	sd	s0,64(sp)
    80005cd8:	04913423          	sd	s1,72(sp)
    80005cdc:	04a13823          	sd	a0,80(sp)
    80005ce0:	04b13c23          	sd	a1,88(sp)
    80005ce4:	06c13023          	sd	a2,96(sp)
    80005ce8:	06d13423          	sd	a3,104(sp)
    80005cec:	06e13823          	sd	a4,112(sp)
    80005cf0:	06f13c23          	sd	a5,120(sp)
    80005cf4:	09013023          	sd	a6,128(sp)
    80005cf8:	09113423          	sd	a7,136(sp)
    80005cfc:	09213823          	sd	s2,144(sp)
    80005d00:	09313c23          	sd	s3,152(sp)
    80005d04:	0b413023          	sd	s4,160(sp)
    80005d08:	0b513423          	sd	s5,168(sp)
    80005d0c:	0b613823          	sd	s6,176(sp)
    80005d10:	0b713c23          	sd	s7,184(sp)
    80005d14:	0d813023          	sd	s8,192(sp)
    80005d18:	0d913423          	sd	s9,200(sp)
    80005d1c:	0da13823          	sd	s10,208(sp)
    80005d20:	0db13c23          	sd	s11,216(sp)
    80005d24:	0fc13023          	sd	t3,224(sp)
    80005d28:	0fd13423          	sd	t4,232(sp)
    80005d2c:	0fe13823          	sd	t5,240(sp)
    80005d30:	0ff13c23          	sd	t6,248(sp)
    80005d34:	10002373          	csrr	t1,sstatus
    80005d38:	10613023          	sd	t1,256(sp)
    80005d3c:	14102373          	csrr	t1,sepc
    80005d40:	10613423          	sd	t1,264(sp)
    80005d44:	b29fe0ef          	jal	8000486c <usertrap>
    80005d48:	00813083          	ld	ra,8(sp)
    80005d4c:	01813183          	ld	gp,24(sp)
    80005d50:	02013203          	ld	tp,32(sp)
    80005d54:	02813283          	ld	t0,40(sp)
    80005d58:	03013303          	ld	t1,48(sp)
    80005d5c:	03813383          	ld	t2,56(sp)
    80005d60:	04013403          	ld	s0,64(sp)
    80005d64:	04813483          	ld	s1,72(sp)
    80005d68:	05013503          	ld	a0,80(sp)
    80005d6c:	05813583          	ld	a1,88(sp)
    80005d70:	06013603          	ld	a2,96(sp)
    80005d74:	06813683          	ld	a3,104(sp)
    80005d78:	07013703          	ld	a4,112(sp)
    80005d7c:	07813783          	ld	a5,120(sp)
    80005d80:	08013803          	ld	a6,128(sp)
    80005d84:	08813883          	ld	a7,136(sp)
    80005d88:	09013903          	ld	s2,144(sp)
    80005d8c:	09813983          	ld	s3,152(sp)
    80005d90:	0a013a03          	ld	s4,160(sp)
    80005d94:	0a813a83          	ld	s5,168(sp)
    80005d98:	0b013b03          	ld	s6,176(sp)
    80005d9c:	0b813b83          	ld	s7,184(sp)
    80005da0:	0c013c03          	ld	s8,192(sp)
    80005da4:	0c813c83          	ld	s9,200(sp)
    80005da8:	0d013d03          	ld	s10,208(sp)
    80005dac:	0d813d83          	ld	s11,216(sp)
    80005db0:	0e013e03          	ld	t3,224(sp)
    80005db4:	0e813e83          	ld	t4,232(sp)
    80005db8:	0f013f03          	ld	t5,240(sp)
    80005dbc:	0f813f83          	ld	t6,248(sp)
    80005dc0:	10013303          	ld	t1,256(sp)
    80005dc4:	10031073          	csrw	sstatus,t1
    80005dc8:	10813303          	ld	t1,264(sp)
    80005dcc:	14131073          	csrw	sepc,t1
    80005dd0:	01013103          	ld	sp,16(sp)
    80005dd4:	10200073          	sret
	...

0000000080005de0 <switch_context>:
    80005de0:	00153023          	sd	ra,0(a0)
    80005de4:	00253423          	sd	sp,8(a0)
    80005de8:	00853823          	sd	s0,16(a0)
    80005dec:	00953c23          	sd	s1,24(a0)
    80005df0:	03253023          	sd	s2,32(a0)
    80005df4:	03353423          	sd	s3,40(a0)
    80005df8:	03453823          	sd	s4,48(a0)
    80005dfc:	03553c23          	sd	s5,56(a0)
    80005e00:	05653023          	sd	s6,64(a0)
    80005e04:	05753423          	sd	s7,72(a0)
    80005e08:	05853823          	sd	s8,80(a0)
    80005e0c:	05953c23          	sd	s9,88(a0)
    80005e10:	07a53023          	sd	s10,96(a0)
    80005e14:	07b53423          	sd	s11,104(a0)
    80005e18:	0005b083          	ld	ra,0(a1)
    80005e1c:	0085b103          	ld	sp,8(a1)
    80005e20:	0105b403          	ld	s0,16(a1)
    80005e24:	0185b483          	ld	s1,24(a1)
    80005e28:	0205b903          	ld	s2,32(a1)
    80005e2c:	0285b983          	ld	s3,40(a1)
    80005e30:	0305ba03          	ld	s4,48(a1)
    80005e34:	0385ba83          	ld	s5,56(a1)
    80005e38:	0405bb03          	ld	s6,64(a1)
    80005e3c:	0485bb83          	ld	s7,72(a1)
    80005e40:	0505bc03          	ld	s8,80(a1)
    80005e44:	0585bc83          	ld	s9,88(a1)
    80005e48:	0605bd03          	ld	s10,96(a1)
    80005e4c:	0685bd83          	ld	s11,104(a1)
    80005e50:	00008067          	ret
