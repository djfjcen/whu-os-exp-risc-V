
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
    80000020:	67428293          	add	t0,t0,1652 # 80004690 <machinevec>
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
    80000078:	71d000ef          	jal	80000f94 <main>

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
    800000a0:	729030ef          	jal	80003fc8 <get_pid>
    800000a4:	00050913          	mv	s2,a0
    800000a8:	00000493          	li	s1,0
    800000ac:	00005a17          	auipc	s4,0x5
    800000b0:	f54a0a13          	add	s4,s4,-172 # 80005000 <rodata_start>
    800000b4:	69f40413          	add	s0,s0,1695 # 1869f <_entry-0x7ffe7961>
    800000b8:	00500993          	li	s3,5
    800000bc:	00048613          	mv	a2,s1
    800000c0:	00090593          	mv	a1,s2
    800000c4:	000a0513          	mv	a0,s4
    800000c8:	50c010ef          	jal	800015d4 <printf>
    800000cc:	00012623          	sw	zero,12(sp)
    800000d0:	00c12783          	lw	a5,12(sp)
    800000d4:	00f44c63          	blt	s0,a5,800000ec <rr_worker+0x6c>
    800000d8:	00c12783          	lw	a5,12(sp)
    800000dc:	0017879b          	addw	a5,a5,1
    800000e0:	00f12623          	sw	a5,12(sp)
    800000e4:	00c12783          	lw	a5,12(sp)
    800000e8:	fef458e3          	bge	s0,a5,800000d8 <rr_worker+0x58>
    800000ec:	0014849b          	addw	s1,s1,1
    800000f0:	05c040ef          	jal	8000414c <yield>
    800000f4:	fd3494e3          	bne	s1,s3,800000bc <rr_worker+0x3c>
    800000f8:	00090593          	mv	a1,s2
    800000fc:	00005517          	auipc	a0,0x5
    80000100:	f2450513          	add	a0,a0,-220 # 80005020 <rodata_start+0x20>
    80000104:	4d0010ef          	jal	800015d4 <printf>
    80000108:	03013403          	ld	s0,48(sp)
    8000010c:	03813083          	ld	ra,56(sp)
    80000110:	02813483          	ld	s1,40(sp)
    80000114:	02013903          	ld	s2,32(sp)
    80000118:	01813983          	ld	s3,24(sp)
    8000011c:	01013a03          	ld	s4,16(sp)
    80000120:	00000513          	li	a0,0
    80000124:	04010113          	add	sp,sp,64
    80000128:	1a00406f          	j	800042c8 <exit>

000000008000012c <test_process_allocation>:
    8000012c:	fe010113          	add	sp,sp,-32
    80000130:	00005517          	auipc	a0,0x5
    80000134:	f1050513          	add	a0,a0,-240 # 80005040 <rodata_start+0x40>
    80000138:	00113c23          	sd	ra,24(sp)
    8000013c:	00813823          	sd	s0,16(sp)
    80000140:	00913423          	sd	s1,8(sp)
    80000144:	01213023          	sd	s2,0(sp)
    80000148:	7fc010ef          	jal	80001944 <uart_puts>
    8000014c:	42d030ef          	jal	80003d78 <alloc_proc>
    80000150:	00050413          	mv	s0,a0
    80000154:	425030ef          	jal	80003d78 <alloc_proc>
    80000158:	00050493          	mv	s1,a0
    8000015c:	41d030ef          	jal	80003d78 <alloc_proc>
    80000160:	0a040663          	beqz	s0,8000020c <test_process_allocation+0xe0>
    80000164:	0a048463          	beqz	s1,8000020c <test_process_allocation+0xe0>
    80000168:	00050913          	mv	s2,a0
    8000016c:	0a050063          	beqz	a0,8000020c <test_process_allocation+0xe0>
    80000170:	00452683          	lw	a3,4(a0)
    80000174:	0044a603          	lw	a2,4(s1)
    80000178:	00442583          	lw	a1,4(s0)
    8000017c:	00005517          	auipc	a0,0x5
    80000180:	f0450513          	add	a0,a0,-252 # 80005080 <rodata_start+0x80>
    80000184:	450010ef          	jal	800015d4 <printf>
    80000188:	00042783          	lw	a5,0(s0)
    8000018c:	00100713          	li	a4,1
    80000190:	00e79a63          	bne	a5,a4,800001a4 <test_process_allocation+0x78>
    80000194:	0004a703          	lw	a4,0(s1)
    80000198:	00f71663          	bne	a4,a5,800001a4 <test_process_allocation+0x78>
    8000019c:	00092783          	lw	a5,0(s2)
    800001a0:	0ae78463          	beq	a5,a4,80000248 <test_process_allocation+0x11c>
    800001a4:	00005517          	auipc	a0,0x5
    800001a8:	f3c50513          	add	a0,a0,-196 # 800050e0 <rodata_start+0xe0>
    800001ac:	798010ef          	jal	80001944 <uart_puts>
    800001b0:	00040513          	mv	a0,s0
    800001b4:	53d030ef          	jal	80003ef0 <free_proc>
    800001b8:	00048513          	mv	a0,s1
    800001bc:	535030ef          	jal	80003ef0 <free_proc>
    800001c0:	00090513          	mv	a0,s2
    800001c4:	52d030ef          	jal	80003ef0 <free_proc>
    800001c8:	00042783          	lw	a5,0(s0)
    800001cc:	00079a63          	bnez	a5,800001e0 <test_process_allocation+0xb4>
    800001d0:	0004a783          	lw	a5,0(s1)
    800001d4:	00079663          	bnez	a5,800001e0 <test_process_allocation+0xb4>
    800001d8:	00092783          	lw	a5,0(s2)
    800001dc:	04078e63          	beqz	a5,80000238 <test_process_allocation+0x10c>
    800001e0:	00005517          	auipc	a0,0x5
    800001e4:	f3050513          	add	a0,a0,-208 # 80005110 <rodata_start+0x110>
    800001e8:	75c010ef          	jal	80001944 <uart_puts>
    800001ec:	01013403          	ld	s0,16(sp)
    800001f0:	01813083          	ld	ra,24(sp)
    800001f4:	00813483          	ld	s1,8(sp)
    800001f8:	00013903          	ld	s2,0(sp)
    800001fc:	00005517          	auipc	a0,0x5
    80000200:	f4450513          	add	a0,a0,-188 # 80005140 <rodata_start+0x140>
    80000204:	02010113          	add	sp,sp,32
    80000208:	73c0106f          	j	80001944 <uart_puts>
    8000020c:	00005517          	auipc	a0,0x5
    80000210:	f1c50513          	add	a0,a0,-228 # 80005128 <rodata_start+0x128>
    80000214:	730010ef          	jal	80001944 <uart_puts>
    80000218:	01013403          	ld	s0,16(sp)
    8000021c:	01813083          	ld	ra,24(sp)
    80000220:	00813483          	ld	s1,8(sp)
    80000224:	00013903          	ld	s2,0(sp)
    80000228:	00005517          	auipc	a0,0x5
    8000022c:	f1850513          	add	a0,a0,-232 # 80005140 <rodata_start+0x140>
    80000230:	02010113          	add	sp,sp,32
    80000234:	7100106f          	j	80001944 <uart_puts>
    80000238:	00005517          	auipc	a0,0x5
    8000023c:	ec050513          	add	a0,a0,-320 # 800050f8 <rodata_start+0xf8>
    80000240:	704010ef          	jal	80001944 <uart_puts>
    80000244:	fd5ff06f          	j	80000218 <test_process_allocation+0xec>
    80000248:	00005517          	auipc	a0,0x5
    8000024c:	e7050513          	add	a0,a0,-400 # 800050b8 <rodata_start+0xb8>
    80000250:	6f4010ef          	jal	80001944 <uart_puts>
    80000254:	f5dff06f          	j	800001b0 <test_process_allocation+0x84>

0000000080000258 <test_process_find>:
    80000258:	fe010113          	add	sp,sp,-32
    8000025c:	00005517          	auipc	a0,0x5
    80000260:	efc50513          	add	a0,a0,-260 # 80005158 <rodata_start+0x158>
    80000264:	00113c23          	sd	ra,24(sp)
    80000268:	00813823          	sd	s0,16(sp)
    8000026c:	00913423          	sd	s1,8(sp)
    80000270:	6d4010ef          	jal	80001944 <uart_puts>
    80000274:	305030ef          	jal	80003d78 <alloc_proc>
    80000278:	08050863          	beqz	a0,80000308 <test_process_find+0xb0>
    8000027c:	00452483          	lw	s1,4(a0)
    80000280:	00050413          	mv	s0,a0
    80000284:	00005517          	auipc	a0,0x5
    80000288:	f2450513          	add	a0,a0,-220 # 800051a8 <rodata_start+0x1a8>
    8000028c:	00048593          	mv	a1,s1
    80000290:	344010ef          	jal	800015d4 <printf>
    80000294:	00048513          	mv	a0,s1
    80000298:	465030ef          	jal	80003efc <find_proc>
    8000029c:	00050663          	beqz	a0,800002a8 <test_process_find+0x50>
    800002a0:	00452783          	lw	a5,4(a0)
    800002a4:	08978063          	beq	a5,s1,80000324 <test_process_find+0xcc>
    800002a8:	00005517          	auipc	a0,0x5
    800002ac:	f3850513          	add	a0,a0,-200 # 800051e0 <rodata_start+0x1e0>
    800002b0:	694010ef          	jal	80001944 <uart_puts>
    800002b4:	00040513          	mv	a0,s0
    800002b8:	439030ef          	jal	80003ef0 <free_proc>
    800002bc:	00048513          	mv	a0,s1
    800002c0:	43d030ef          	jal	80003efc <find_proc>
    800002c4:	00050663          	beqz	a0,800002d0 <test_process_find+0x78>
    800002c8:	00052783          	lw	a5,0(a0)
    800002cc:	02079663          	bnez	a5,800002f8 <test_process_find+0xa0>
    800002d0:	00005517          	auipc	a0,0x5
    800002d4:	f2850513          	add	a0,a0,-216 # 800051f8 <rodata_start+0x1f8>
    800002d8:	66c010ef          	jal	80001944 <uart_puts>
    800002dc:	01013403          	ld	s0,16(sp)
    800002e0:	01813083          	ld	ra,24(sp)
    800002e4:	00813483          	ld	s1,8(sp)
    800002e8:	00005517          	auipc	a0,0x5
    800002ec:	e5850513          	add	a0,a0,-424 # 80005140 <rodata_start+0x140>
    800002f0:	02010113          	add	sp,sp,32
    800002f4:	6500106f          	j	80001944 <uart_puts>
    800002f8:	00005517          	auipc	a0,0x5
    800002fc:	f3850513          	add	a0,a0,-200 # 80005230 <rodata_start+0x230>
    80000300:	644010ef          	jal	80001944 <uart_puts>
    80000304:	fd9ff06f          	j	800002dc <test_process_find+0x84>
    80000308:	01013403          	ld	s0,16(sp)
    8000030c:	01813083          	ld	ra,24(sp)
    80000310:	00813483          	ld	s1,8(sp)
    80000314:	00005517          	auipc	a0,0x5
    80000318:	e7c50513          	add	a0,a0,-388 # 80005190 <rodata_start+0x190>
    8000031c:	02010113          	add	sp,sp,32
    80000320:	6240106f          	j	80001944 <uart_puts>
    80000324:	00048593          	mv	a1,s1
    80000328:	00005517          	auipc	a0,0x5
    8000032c:	e9850513          	add	a0,a0,-360 # 800051c0 <rodata_start+0x1c0>
    80000330:	2a4010ef          	jal	800015d4 <printf>
    80000334:	f81ff06f          	j	800002b4 <test_process_find+0x5c>

0000000080000338 <test_process_state_transition>:
    80000338:	fe010113          	add	sp,sp,-32
    8000033c:	00005517          	auipc	a0,0x5
    80000340:	f2450513          	add	a0,a0,-220 # 80005260 <rodata_start+0x260>
    80000344:	00113c23          	sd	ra,24(sp)
    80000348:	00813823          	sd	s0,16(sp)
    8000034c:	00913423          	sd	s1,8(sp)
    80000350:	5f4010ef          	jal	80001944 <uart_puts>
    80000354:	225030ef          	jal	80003d78 <alloc_proc>
    80000358:	0c050a63          	beqz	a0,8000042c <test_process_state_transition+0xf4>
    8000035c:	00052583          	lw	a1,0(a0)
    80000360:	00050413          	mv	s0,a0
    80000364:	00100613          	li	a2,1
    80000368:	00005517          	auipc	a0,0x5
    8000036c:	f3850513          	add	a0,a0,-200 # 800052a0 <rodata_start+0x2a0>
    80000370:	264010ef          	jal	800015d4 <printf>
    80000374:	00040513          	mv	a0,s0
    80000378:	3e9030ef          	jal	80003f60 <proc_mark_runnable>
    8000037c:	00042703          	lw	a4,0(s0)
    80000380:	00200793          	li	a5,2
    80000384:	0cf70263          	beq	a4,a5,80000448 <test_process_state_transition+0x110>
    80000388:	00300793          	li	a5,3
    8000038c:	000014b7          	lui	s1,0x1
    80000390:	00f42023          	sw	a5,0(s0)
    80000394:	23448593          	add	a1,s1,564 # 1234 <_entry-0x7fffedcc>
    80000398:	00040513          	mv	a0,s0
    8000039c:	3ed030ef          	jal	80003f88 <proc_mark_sleeping>
    800003a0:	00042583          	lw	a1,0(s0)
    800003a4:	00400793          	li	a5,4
    800003a8:	00f59863          	bne	a1,a5,800003b8 <test_process_state_transition+0x80>
    800003ac:	0b843783          	ld	a5,184(s0)
    800003b0:	23448493          	add	s1,s1,564
    800003b4:	06978463          	beq	a5,s1,8000041c <test_process_state_transition+0xe4>
    800003b8:	00005517          	auipc	a0,0x5
    800003bc:	f4850513          	add	a0,a0,-184 # 80005300 <rodata_start+0x300>
    800003c0:	214010ef          	jal	800015d4 <printf>
    800003c4:	02a00593          	li	a1,42
    800003c8:	00040513          	mv	a0,s0
    800003cc:	3e1030ef          	jal	80003fac <proc_mark_zombie>
    800003d0:	00042703          	lw	a4,0(s0)
    800003d4:	00500793          	li	a5,5
    800003d8:	02f70463          	beq	a4,a5,80000400 <test_process_state_transition+0xc8>
    800003dc:	00040513          	mv	a0,s0
    800003e0:	311030ef          	jal	80003ef0 <free_proc>
    800003e4:	01013403          	ld	s0,16(sp)
    800003e8:	01813083          	ld	ra,24(sp)
    800003ec:	00813483          	ld	s1,8(sp)
    800003f0:	00005517          	auipc	a0,0x5
    800003f4:	d5050513          	add	a0,a0,-688 # 80005140 <rodata_start+0x140>
    800003f8:	02010113          	add	sp,sp,32
    800003fc:	5480106f          	j	80001944 <uart_puts>
    80000400:	00c42703          	lw	a4,12(s0)
    80000404:	02a00793          	li	a5,42
    80000408:	fcf71ae3          	bne	a4,a5,800003dc <test_process_state_transition+0xa4>
    8000040c:	00005517          	auipc	a0,0x5
    80000410:	f2450513          	add	a0,a0,-220 # 80005330 <rodata_start+0x330>
    80000414:	530010ef          	jal	80001944 <uart_puts>
    80000418:	fc5ff06f          	j	800003dc <test_process_state_transition+0xa4>
    8000041c:	00005517          	auipc	a0,0x5
    80000420:	ec450513          	add	a0,a0,-316 # 800052e0 <rodata_start+0x2e0>
    80000424:	520010ef          	jal	80001944 <uart_puts>
    80000428:	f9dff06f          	j	800003c4 <test_process_state_transition+0x8c>
    8000042c:	01013403          	ld	s0,16(sp)
    80000430:	01813083          	ld	ra,24(sp)
    80000434:	00813483          	ld	s1,8(sp)
    80000438:	00005517          	auipc	a0,0x5
    8000043c:	d5850513          	add	a0,a0,-680 # 80005190 <rodata_start+0x190>
    80000440:	02010113          	add	sp,sp,32
    80000444:	5000106f          	j	80001944 <uart_puts>
    80000448:	00005517          	auipc	a0,0x5
    8000044c:	e7850513          	add	a0,a0,-392 # 800052c0 <rodata_start+0x2c0>
    80000450:	4f4010ef          	jal	80001944 <uart_puts>
    80000454:	f35ff06f          	j	80000388 <test_process_state_transition+0x50>

0000000080000458 <test_simple_fork>:
    80000458:	fe010113          	add	sp,sp,-32
    8000045c:	00005517          	auipc	a0,0x5
    80000460:	ef450513          	add	a0,a0,-268 # 80005350 <rodata_start+0x350>
    80000464:	00113c23          	sd	ra,24(sp)
    80000468:	00813823          	sd	s0,16(sp)
    8000046c:	00913423          	sd	s1,8(sp)
    80000470:	4d4010ef          	jal	80001944 <uart_puts>
    80000474:	105030ef          	jal	80003d78 <alloc_proc>
    80000478:	08050c63          	beqz	a0,80000510 <test_simple_fork+0xb8>
    8000047c:	00300793          	li	a5,3
    80000480:	00f52023          	sw	a5,0(a0)
    80000484:	00050413          	mv	s0,a0
    80000488:	369030ef          	jal	80003ff0 <set_current_proc>
    8000048c:	00442583          	lw	a1,4(s0)
    80000490:	00005517          	auipc	a0,0x5
    80000494:	f2050513          	add	a0,a0,-224 # 800053b0 <rodata_start+0x3b0>
    80000498:	13c010ef          	jal	800015d4 <printf>
    8000049c:	549030ef          	jal	800041e4 <fork>
    800004a0:	00050493          	mv	s1,a0
    800004a4:	04a05e63          	blez	a0,80000500 <test_simple_fork+0xa8>
    800004a8:	00050593          	mv	a1,a0
    800004ac:	00005517          	auipc	a0,0x5
    800004b0:	f1c50513          	add	a0,a0,-228 # 800053c8 <rodata_start+0x3c8>
    800004b4:	120010ef          	jal	800015d4 <printf>
    800004b8:	00048513          	mv	a0,s1
    800004bc:	241030ef          	jal	80003efc <find_proc>
    800004c0:	00050493          	mv	s1,a0
    800004c4:	00050c63          	beqz	a0,800004dc <test_simple_fork+0x84>
    800004c8:	0b053783          	ld	a5,176(a0)
    800004cc:	06878063          	beq	a5,s0,8000052c <test_simple_fork+0xd4>
    800004d0:	0004a703          	lw	a4,0(s1)
    800004d4:	00200793          	li	a5,2
    800004d8:	06f70863          	beq	a4,a5,80000548 <test_simple_fork+0xf0>
    800004dc:	00040513          	mv	a0,s0
    800004e0:	211030ef          	jal	80003ef0 <free_proc>
    800004e4:	01013403          	ld	s0,16(sp)
    800004e8:	01813083          	ld	ra,24(sp)
    800004ec:	00813483          	ld	s1,8(sp)
    800004f0:	00005517          	auipc	a0,0x5
    800004f4:	c5050513          	add	a0,a0,-944 # 80005140 <rodata_start+0x140>
    800004f8:	02010113          	add	sp,sp,32
    800004fc:	4480106f          	j	80001944 <uart_puts>
    80000500:	00005517          	auipc	a0,0x5
    80000504:	f3050513          	add	a0,a0,-208 # 80005430 <rodata_start+0x430>
    80000508:	43c010ef          	jal	80001944 <uart_puts>
    8000050c:	fd1ff06f          	j	800004dc <test_simple_fork+0x84>
    80000510:	01013403          	ld	s0,16(sp)
    80000514:	01813083          	ld	ra,24(sp)
    80000518:	00813483          	ld	s1,8(sp)
    8000051c:	00005517          	auipc	a0,0x5
    80000520:	e7450513          	add	a0,a0,-396 # 80005390 <rodata_start+0x390>
    80000524:	02010113          	add	sp,sp,32
    80000528:	41c0106f          	j	80001944 <uart_puts>
    8000052c:	00852703          	lw	a4,8(a0)
    80000530:	00442783          	lw	a5,4(s0)
    80000534:	f8f71ee3          	bne	a4,a5,800004d0 <test_simple_fork+0x78>
    80000538:	00005517          	auipc	a0,0x5
    8000053c:	eb850513          	add	a0,a0,-328 # 800053f0 <rodata_start+0x3f0>
    80000540:	404010ef          	jal	80001944 <uart_puts>
    80000544:	f8dff06f          	j	800004d0 <test_simple_fork+0x78>
    80000548:	00005517          	auipc	a0,0x5
    8000054c:	ec850513          	add	a0,a0,-312 # 80005410 <rodata_start+0x410>
    80000550:	3f4010ef          	jal	80001944 <uart_puts>
    80000554:	f89ff06f          	j	800004dc <test_simple_fork+0x84>

0000000080000558 <test_scheduler_basic>:
    80000558:	fb010113          	add	sp,sp,-80
    8000055c:	04813023          	sd	s0,64(sp)
    80000560:	00005517          	auipc	a0,0x5
    80000564:	ee050513          	add	a0,a0,-288 # 80005440 <rodata_start+0x440>
    80000568:	00810413          	add	s0,sp,8
    8000056c:	02913c23          	sd	s1,56(sp)
    80000570:	03213823          	sd	s2,48(sp)
    80000574:	03313423          	sd	s3,40(sp)
    80000578:	03413023          	sd	s4,32(sp)
    8000057c:	04113423          	sd	ra,72(sp)
    80000580:	02010913          	add	s2,sp,32
    80000584:	3c0010ef          	jal	80001944 <uart_puts>
    80000588:	00040493          	mv	s1,s0
    8000058c:	00200a13          	li	s4,2
    80000590:	00005997          	auipc	s3,0x5
    80000594:	ef098993          	add	s3,s3,-272 # 80005480 <rodata_start+0x480>
    80000598:	7e0030ef          	jal	80003d78 <alloc_proc>
    8000059c:	00a4b023          	sd	a0,0(s1)
    800005a0:	00050793          	mv	a5,a0
    800005a4:	00848493          	add	s1,s1,8
    800005a8:	00098513          	mv	a0,s3
    800005ac:	00078863          	beqz	a5,800005bc <test_scheduler_basic+0x64>
    800005b0:	0047a583          	lw	a1,4(a5)
    800005b4:	0147a023          	sw	s4,0(a5)
    800005b8:	01c010ef          	jal	800015d4 <printf>
    800005bc:	fd249ee3          	bne	s1,s2,80000598 <test_scheduler_basic+0x40>
    800005c0:	00425797          	auipc	a5,0x425
    800005c4:	fe878793          	add	a5,a5,-24 # 804255a8 <proc>
    800005c8:	00426617          	auipc	a2,0x426
    800005cc:	c6060613          	add	a2,a2,-928 # 80426228 <mem_end>
    800005d0:	00000593          	li	a1,0
    800005d4:	00200693          	li	a3,2
    800005d8:	0007a703          	lw	a4,0(a5)
    800005dc:	0c878793          	add	a5,a5,200
    800005e0:	04d70863          	beq	a4,a3,80000630 <test_scheduler_basic+0xd8>
    800005e4:	fec79ae3          	bne	a5,a2,800005d8 <test_scheduler_basic+0x80>
    800005e8:	00005517          	auipc	a0,0x5
    800005ec:	eb050513          	add	a0,a0,-336 # 80005498 <rodata_start+0x498>
    800005f0:	7e5000ef          	jal	800015d4 <printf>
    800005f4:	00043503          	ld	a0,0(s0)
    800005f8:	00840413          	add	s0,s0,8
    800005fc:	00050463          	beqz	a0,80000604 <test_scheduler_basic+0xac>
    80000600:	0f1030ef          	jal	80003ef0 <free_proc>
    80000604:	ff2418e3          	bne	s0,s2,800005f4 <test_scheduler_basic+0x9c>
    80000608:	04013403          	ld	s0,64(sp)
    8000060c:	04813083          	ld	ra,72(sp)
    80000610:	03813483          	ld	s1,56(sp)
    80000614:	03013903          	ld	s2,48(sp)
    80000618:	02813983          	ld	s3,40(sp)
    8000061c:	02013a03          	ld	s4,32(sp)
    80000620:	00005517          	auipc	a0,0x5
    80000624:	b2050513          	add	a0,a0,-1248 # 80005140 <rodata_start+0x140>
    80000628:	05010113          	add	sp,sp,80
    8000062c:	3180106f          	j	80001944 <uart_puts>
    80000630:	0015859b          	addw	a1,a1,1
    80000634:	fac792e3          	bne	a5,a2,800005d8 <test_scheduler_basic+0x80>
    80000638:	fb1ff06f          	j	800005e8 <test_scheduler_basic+0x90>

000000008000063c <run_process_management_tests>:
    8000063c:	ff010113          	add	sp,sp,-16
    80000640:	00005517          	auipc	a0,0x5
    80000644:	ce850513          	add	a0,a0,-792 # 80005328 <rodata_start+0x328>
    80000648:	00113423          	sd	ra,8(sp)
    8000064c:	2f8010ef          	jal	80001944 <uart_puts>
    80000650:	00005517          	auipc	a0,0x5
    80000654:	e7050513          	add	a0,a0,-400 # 800054c0 <rodata_start+0x4c0>
    80000658:	2ec010ef          	jal	80001944 <uart_puts>
    8000065c:	00005517          	auipc	a0,0x5
    80000660:	f2c50513          	add	a0,a0,-212 # 80005588 <rodata_start+0x588>
    80000664:	2e0010ef          	jal	80001944 <uart_puts>
    80000668:	00005517          	auipc	a0,0x5
    8000066c:	f8050513          	add	a0,a0,-128 # 800055e8 <rodata_start+0x5e8>
    80000670:	2d4010ef          	jal	80001944 <uart_puts>
    80000674:	ab9ff0ef          	jal	8000012c <test_process_allocation>
    80000678:	be1ff0ef          	jal	80000258 <test_process_find>
    8000067c:	cbdff0ef          	jal	80000338 <test_process_state_transition>
    80000680:	dd9ff0ef          	jal	80000458 <test_simple_fork>
    80000684:	ed5ff0ef          	jal	80000558 <test_scheduler_basic>
    80000688:	00005517          	auipc	a0,0x5
    8000068c:	ca050513          	add	a0,a0,-864 # 80005328 <rodata_start+0x328>
    80000690:	2b4010ef          	jal	80001944 <uart_puts>
    80000694:	00005517          	auipc	a0,0x5
    80000698:	e2c50513          	add	a0,a0,-468 # 800054c0 <rodata_start+0x4c0>
    8000069c:	2a8010ef          	jal	80001944 <uart_puts>
    800006a0:	00005517          	auipc	a0,0x5
    800006a4:	01050513          	add	a0,a0,16 # 800056b0 <rodata_start+0x6b0>
    800006a8:	29c010ef          	jal	80001944 <uart_puts>
    800006ac:	00005517          	auipc	a0,0x5
    800006b0:	05c50513          	add	a0,a0,92 # 80005708 <rodata_start+0x708>
    800006b4:	290010ef          	jal	80001944 <uart_puts>
    800006b8:	00005517          	auipc	a0,0x5
    800006bc:	12050513          	add	a0,a0,288 # 800057d8 <rodata_start+0x7d8>
    800006c0:	284010ef          	jal	80001944 <uart_puts>
    800006c4:	00005517          	auipc	a0,0x5
    800006c8:	12c50513          	add	a0,a0,300 # 800057f0 <rodata_start+0x7f0>
    800006cc:	278010ef          	jal	80001944 <uart_puts>
    800006d0:	00005517          	auipc	a0,0x5
    800006d4:	15050513          	add	a0,a0,336 # 80005820 <rodata_start+0x820>
    800006d8:	26c010ef          	jal	80001944 <uart_puts>
    800006dc:	00005517          	auipc	a0,0x5
    800006e0:	16450513          	add	a0,a0,356 # 80005840 <rodata_start+0x840>
    800006e4:	260010ef          	jal	80001944 <uart_puts>
    800006e8:	00005517          	auipc	a0,0x5
    800006ec:	17850513          	add	a0,a0,376 # 80005860 <rodata_start+0x860>
    800006f0:	254010ef          	jal	80001944 <uart_puts>
    800006f4:	00813083          	ld	ra,8(sp)
    800006f8:	00005517          	auipc	a0,0x5
    800006fc:	19850513          	add	a0,a0,408 # 80005890 <rodata_start+0x890>
    80000700:	01010113          	add	sp,sp,16
    80000704:	2400106f          	j	80001944 <uart_puts>

0000000080000708 <test_round_robin_scheduler>:
    80000708:	fa010113          	add	sp,sp,-96
    8000070c:	04813823          	sd	s0,80(sp)
    80000710:	00005517          	auipc	a0,0x5
    80000714:	1a050513          	add	a0,a0,416 # 800058b0 <rodata_start+0x8b0>
    80000718:	00810413          	add	s0,sp,8
    8000071c:	04913423          	sd	s1,72(sp)
    80000720:	05213023          	sd	s2,64(sp)
    80000724:	03313c23          	sd	s3,56(sp)
    80000728:	03413823          	sd	s4,48(sp)
    8000072c:	03513423          	sd	s5,40(sp)
    80000730:	03613023          	sd	s6,32(sp)
    80000734:	04113c23          	sd	ra,88(sp)
    80000738:	00040913          	mv	s2,s0
    8000073c:	208010ef          	jal	80001944 <uart_puts>
    80000740:	00000493          	li	s1,0
    80000744:	00000b17          	auipc	s6,0x0
    80000748:	93cb0b13          	add	s6,s6,-1732 # 80000080 <rr_worker>
    8000074c:	00200a93          	li	s5,2
    80000750:	00005a17          	auipc	s4,0x5
    80000754:	1c8a0a13          	add	s4,s4,456 # 80005918 <rodata_start+0x918>
    80000758:	00300993          	li	s3,3
    8000075c:	61c030ef          	jal	80003d78 <alloc_proc>
    80000760:	00050793          	mv	a5,a0
    80000764:	00a93023          	sd	a0,0(s2)
    80000768:	000a0513          	mv	a0,s4
    8000076c:	06078c63          	beqz	a5,800007e4 <test_round_robin_scheduler+0xdc>
    80000770:	0047a583          	lw	a1,4(a5)
    80000774:	0567b023          	sd	s6,64(a5)
    80000778:	0157a023          	sw	s5,0(a5)
    8000077c:	659000ef          	jal	800015d4 <printf>
    80000780:	0014849b          	addw	s1,s1,1
    80000784:	00890913          	add	s2,s2,8
    80000788:	fd349ae3          	bne	s1,s3,8000075c <test_round_robin_scheduler+0x54>
    8000078c:	00005517          	auipc	a0,0x5
    80000790:	1ac50513          	add	a0,a0,428 # 80005938 <rodata_start+0x938>
    80000794:	1b0010ef          	jal	80001944 <uart_puts>
    80000798:	01840493          	add	s1,s0,24
    8000079c:	061030ef          	jal	80003ffc <scheduler>
    800007a0:	00043503          	ld	a0,0(s0)
    800007a4:	00840413          	add	s0,s0,8
    800007a8:	00050463          	beqz	a0,800007b0 <test_round_robin_scheduler+0xa8>
    800007ac:	744030ef          	jal	80003ef0 <free_proc>
    800007b0:	fe9418e3          	bne	s0,s1,800007a0 <test_round_robin_scheduler+0x98>
    800007b4:	05013403          	ld	s0,80(sp)
    800007b8:	05813083          	ld	ra,88(sp)
    800007bc:	04813483          	ld	s1,72(sp)
    800007c0:	04013903          	ld	s2,64(sp)
    800007c4:	03813983          	ld	s3,56(sp)
    800007c8:	03013a03          	ld	s4,48(sp)
    800007cc:	02813a83          	ld	s5,40(sp)
    800007d0:	02013b03          	ld	s6,32(sp)
    800007d4:	00005517          	auipc	a0,0x5
    800007d8:	1a450513          	add	a0,a0,420 # 80005978 <rodata_start+0x978>
    800007dc:	06010113          	add	sp,sp,96
    800007e0:	1640106f          	j	80001944 <uart_puts>
    800007e4:	00048593          	mv	a1,s1
    800007e8:	00005517          	auipc	a0,0x5
    800007ec:	11050513          	add	a0,a0,272 # 800058f8 <rodata_start+0x8f8>
    800007f0:	5e5000ef          	jal	800015d4 <printf>
    800007f4:	f8dff06f          	j	80000780 <test_round_robin_scheduler+0x78>

00000000800007f8 <test_trap_initialization>:
    800007f8:	ff010113          	add	sp,sp,-16
    800007fc:	00005517          	auipc	a0,0x5
    80000800:	1a450513          	add	a0,a0,420 # 800059a0 <rodata_start+0x9a0>
    80000804:	00113423          	sd	ra,8(sp)
    80000808:	00813023          	sd	s0,0(sp)
    8000080c:	138010ef          	jal	80001944 <uart_puts>
    80000810:	66d020ef          	jal	8000367c <trap_init>
    80000814:	719020ef          	jal	8000372c <trap_init_hart>
    80000818:	10502473          	csrr	s0,stvec
    8000081c:	00005517          	auipc	a0,0x5
    80000820:	1c450513          	add	a0,a0,452 # 800059e0 <rodata_start+0x9e0>
    80000824:	00040593          	mv	a1,s0
    80000828:	5ad000ef          	jal	800015d4 <printf>
    8000082c:	02040c63          	beqz	s0,80000864 <test_trap_initialization+0x6c>
    80000830:	00005517          	auipc	a0,0x5
    80000834:	1d050513          	add	a0,a0,464 # 80005a00 <rodata_start+0xa00>
    80000838:	10c010ef          	jal	80001944 <uart_puts>
    8000083c:	104025f3          	csrr	a1,sie
    80000840:	00005517          	auipc	a0,0x5
    80000844:	20850513          	add	a0,a0,520 # 80005a48 <rodata_start+0xa48>
    80000848:	58d000ef          	jal	800015d4 <printf>
    8000084c:	00013403          	ld	s0,0(sp)
    80000850:	00813083          	ld	ra,8(sp)
    80000854:	00005517          	auipc	a0,0x5
    80000858:	22450513          	add	a0,a0,548 # 80005a78 <rodata_start+0xa78>
    8000085c:	01010113          	add	sp,sp,16
    80000860:	0e40106f          	j	80001944 <uart_puts>
    80000864:	00005517          	auipc	a0,0x5
    80000868:	1bc50513          	add	a0,a0,444 # 80005a20 <rodata_start+0xa20>
    8000086c:	0d8010ef          	jal	80001944 <uart_puts>
    80000870:	fcdff06f          	j	8000083c <test_trap_initialization+0x44>

0000000080000874 <test_interrupt_control>:
    80000874:	ff010113          	add	sp,sp,-16
    80000878:	00005517          	auipc	a0,0x5
    8000087c:	21850513          	add	a0,a0,536 # 80005a90 <rodata_start+0xa90>
    80000880:	00113423          	sd	ra,8(sp)
    80000884:	00813023          	sd	s0,0(sp)
    80000888:	0bc010ef          	jal	80001944 <uart_puts>
    8000088c:	00005517          	auipc	a0,0x5
    80000890:	24450513          	add	a0,a0,580 # 80005ad0 <rodata_start+0xad0>
    80000894:	0b0010ef          	jal	80001944 <uart_puts>
    80000898:	5b9020ef          	jal	80003650 <intr_off>
    8000089c:	5c5020ef          	jal	80003660 <intr_get>
    800008a0:	00050413          	mv	s0,a0
    800008a4:	00050593          	mv	a1,a0
    800008a8:	00005517          	auipc	a0,0x5
    800008ac:	24050513          	add	a0,a0,576 # 80005ae8 <rodata_start+0xae8>
    800008b0:	525000ef          	jal	800015d4 <printf>
    800008b4:	06041063          	bnez	s0,80000914 <test_interrupt_control+0xa0>
    800008b8:	00005517          	auipc	a0,0x5
    800008bc:	25050513          	add	a0,a0,592 # 80005b08 <rodata_start+0xb08>
    800008c0:	084010ef          	jal	80001944 <uart_puts>
    800008c4:	00005517          	auipc	a0,0x5
    800008c8:	27450513          	add	a0,a0,628 # 80005b38 <rodata_start+0xb38>
    800008cc:	078010ef          	jal	80001944 <uart_puts>
    800008d0:	571020ef          	jal	80003640 <intr_on>
    800008d4:	58d020ef          	jal	80003660 <intr_get>
    800008d8:	00050413          	mv	s0,a0
    800008dc:	00050593          	mv	a1,a0
    800008e0:	00005517          	auipc	a0,0x5
    800008e4:	27050513          	add	a0,a0,624 # 80005b50 <rodata_start+0xb50>
    800008e8:	4ed000ef          	jal	800015d4 <printf>
    800008ec:	02040c63          	beqz	s0,80000924 <test_interrupt_control+0xb0>
    800008f0:	00005517          	auipc	a0,0x5
    800008f4:	28050513          	add	a0,a0,640 # 80005b70 <rodata_start+0xb70>
    800008f8:	04c010ef          	jal	80001944 <uart_puts>
    800008fc:	00013403          	ld	s0,0(sp)
    80000900:	00813083          	ld	ra,8(sp)
    80000904:	00005517          	auipc	a0,0x5
    80000908:	29c50513          	add	a0,a0,668 # 80005ba0 <rodata_start+0xba0>
    8000090c:	01010113          	add	sp,sp,16
    80000910:	0340106f          	j	80001944 <uart_puts>
    80000914:	00005517          	auipc	a0,0x5
    80000918:	20c50513          	add	a0,a0,524 # 80005b20 <rodata_start+0xb20>
    8000091c:	028010ef          	jal	80001944 <uart_puts>
    80000920:	fa5ff06f          	j	800008c4 <test_interrupt_control+0x50>
    80000924:	00005517          	auipc	a0,0x5
    80000928:	26450513          	add	a0,a0,612 # 80005b88 <rodata_start+0xb88>
    8000092c:	018010ef          	jal	80001944 <uart_puts>
    80000930:	00013403          	ld	s0,0(sp)
    80000934:	00813083          	ld	ra,8(sp)
    80000938:	00005517          	auipc	a0,0x5
    8000093c:	26850513          	add	a0,a0,616 # 80005ba0 <rodata_start+0xba0>
    80000940:	01010113          	add	sp,sp,16
    80000944:	0000106f          	j	80001944 <uart_puts>

0000000080000948 <test_trapframe_allocation>:
    80000948:	fe010113          	add	sp,sp,-32
    8000094c:	00005517          	auipc	a0,0x5
    80000950:	26c50513          	add	a0,a0,620 # 80005bb8 <rodata_start+0xbb8>
    80000954:	00113c23          	sd	ra,24(sp)
    80000958:	00813823          	sd	s0,16(sp)
    8000095c:	00913423          	sd	s1,8(sp)
    80000960:	01213023          	sd	s2,0(sp)
    80000964:	7e1000ef          	jal	80001944 <uart_puts>
    80000968:	00005517          	auipc	a0,0x5
    8000096c:	29050513          	add	a0,a0,656 # 80005bf8 <rodata_start+0xbf8>
    80000970:	7d5000ef          	jal	80001944 <uart_puts>
    80000974:	429020ef          	jal	8000359c <alloc_trapframe>
    80000978:	00050413          	mv	s0,a0
    8000097c:	421020ef          	jal	8000359c <alloc_trapframe>
    80000980:	00050493          	mv	s1,a0
    80000984:	419020ef          	jal	8000359c <alloc_trapframe>
    80000988:	10040863          	beqz	s0,80000a98 <test_trapframe_allocation+0x150>
    8000098c:	10048663          	beqz	s1,80000a98 <test_trapframe_allocation+0x150>
    80000990:	00050913          	mv	s2,a0
    80000994:	10050263          	beqz	a0,80000a98 <test_trapframe_allocation+0x150>
    80000998:	00005517          	auipc	a0,0x5
    8000099c:	27850513          	add	a0,a0,632 # 80005c10 <rodata_start+0xc10>
    800009a0:	435000ef          	jal	800015d4 <printf>
    800009a4:	00040593          	mv	a1,s0
    800009a8:	00005517          	auipc	a0,0x5
    800009ac:	28850513          	add	a0,a0,648 # 80005c30 <rodata_start+0xc30>
    800009b0:	425000ef          	jal	800015d4 <printf>
    800009b4:	00048593          	mv	a1,s1
    800009b8:	00005517          	auipc	a0,0x5
    800009bc:	28850513          	add	a0,a0,648 # 80005c40 <rodata_start+0xc40>
    800009c0:	415000ef          	jal	800015d4 <printf>
    800009c4:	00090593          	mv	a1,s2
    800009c8:	00005517          	auipc	a0,0x5
    800009cc:	28850513          	add	a0,a0,648 # 80005c50 <rodata_start+0xc50>
    800009d0:	405000ef          	jal	800015d4 <printf>
    800009d4:	00940463          	beq	s0,s1,800009dc <test_trapframe_allocation+0x94>
    800009d8:	0f249663          	bne	s1,s2,80000ac4 <test_trapframe_allocation+0x17c>
    800009dc:	00005517          	auipc	a0,0x5
    800009e0:	2a450513          	add	a0,a0,676 # 80005c80 <rodata_start+0xc80>
    800009e4:	761000ef          	jal	80001944 <uart_puts>
    800009e8:	00005517          	auipc	a0,0x5
    800009ec:	2c850513          	add	a0,a0,712 # 80005cb0 <rodata_start+0xcb0>
    800009f0:	755000ef          	jal	80001944 <uart_puts>
    800009f4:	21d957b7          	lui	a5,0x21d95
    800009f8:	00279793          	sll	a5,a5,0x2
    800009fc:	32178793          	add	a5,a5,801 # 21d95321 <_entry-0x5e26acdf>
    80000a00:	12345737          	lui	a4,0x12345
    80000a04:	67870713          	add	a4,a4,1656 # 12345678 <_entry-0x6dcba988>
    80000a08:	00f43823          	sd	a5,16(s0)
    80000a0c:	02a00793          	li	a5,42
    80000a10:	00e43423          	sd	a4,8(s0)
    80000a14:	04f43823          	sd	a5,80(s0)
    80000a18:	00005517          	auipc	a0,0x5
    80000a1c:	2b850513          	add	a0,a0,696 # 80005cd0 <rodata_start+0xcd0>
    80000a20:	725000ef          	jal	80001944 <uart_puts>
    80000a24:	00005517          	auipc	a0,0x5
    80000a28:	2cc50513          	add	a0,a0,716 # 80005cf0 <rodata_start+0xcf0>
    80000a2c:	719000ef          	jal	80001944 <uart_puts>
    80000a30:	00040513          	mv	a0,s0
    80000a34:	3c9020ef          	jal	800035fc <free_trapframe>
    80000a38:	00048513          	mv	a0,s1
    80000a3c:	3c1020ef          	jal	800035fc <free_trapframe>
    80000a40:	00090513          	mv	a0,s2
    80000a44:	3b9020ef          	jal	800035fc <free_trapframe>
    80000a48:	00005517          	auipc	a0,0x5
    80000a4c:	2c050513          	add	a0,a0,704 # 80005d08 <rodata_start+0xd08>
    80000a50:	6f5000ef          	jal	80001944 <uart_puts>
    80000a54:	349020ef          	jal	8000359c <alloc_trapframe>
    80000a58:	00050413          	mv	s0,a0
    80000a5c:	04050463          	beqz	a0,80000aa4 <test_trapframe_allocation+0x15c>
    80000a60:	00050593          	mv	a1,a0
    80000a64:	00005517          	auipc	a0,0x5
    80000a68:	2c450513          	add	a0,a0,708 # 80005d28 <rodata_start+0xd28>
    80000a6c:	369000ef          	jal	800015d4 <printf>
    80000a70:	00040513          	mv	a0,s0
    80000a74:	389020ef          	jal	800035fc <free_trapframe>
    80000a78:	01013403          	ld	s0,16(sp)
    80000a7c:	01813083          	ld	ra,24(sp)
    80000a80:	00813483          	ld	s1,8(sp)
    80000a84:	00013903          	ld	s2,0(sp)
    80000a88:	00005517          	auipc	a0,0x5
    80000a8c:	2f050513          	add	a0,a0,752 # 80005d78 <rodata_start+0xd78>
    80000a90:	02010113          	add	sp,sp,32
    80000a94:	6b10006f          	j	80001944 <uart_puts>
    80000a98:	00005517          	auipc	a0,0x5
    80000a9c:	2c050513          	add	a0,a0,704 # 80005d58 <rodata_start+0xd58>
    80000aa0:	6a5000ef          	jal	80001944 <uart_puts>
    80000aa4:	01013403          	ld	s0,16(sp)
    80000aa8:	01813083          	ld	ra,24(sp)
    80000aac:	00813483          	ld	s1,8(sp)
    80000ab0:	00013903          	ld	s2,0(sp)
    80000ab4:	00005517          	auipc	a0,0x5
    80000ab8:	2c450513          	add	a0,a0,708 # 80005d78 <rodata_start+0xd78>
    80000abc:	02010113          	add	sp,sp,32
    80000ac0:	6850006f          	j	80001944 <uart_puts>
    80000ac4:	00005517          	auipc	a0,0x5
    80000ac8:	19c50513          	add	a0,a0,412 # 80005c60 <rodata_start+0xc60>
    80000acc:	679000ef          	jal	80001944 <uart_puts>
    80000ad0:	f19ff06f          	j	800009e8 <test_trapframe_allocation+0xa0>

0000000080000ad4 <test_csr_operations>:
    80000ad4:	ff010113          	add	sp,sp,-16
    80000ad8:	00005517          	auipc	a0,0x5
    80000adc:	2b850513          	add	a0,a0,696 # 80005d90 <rodata_start+0xd90>
    80000ae0:	00113423          	sd	ra,8(sp)
    80000ae4:	00813023          	sd	s0,0(sp)
    80000ae8:	65d000ef          	jal	80001944 <uart_puts>
    80000aec:	10002473          	csrr	s0,sstatus
    80000af0:	00005517          	auipc	a0,0x5
    80000af4:	2d850513          	add	a0,a0,728 # 80005dc8 <rodata_start+0xdc8>
    80000af8:	00040593          	mv	a1,s0
    80000afc:	2d9000ef          	jal	800015d4 <printf>
    80000b00:	142025f3          	csrr	a1,scause
    80000b04:	00005517          	auipc	a0,0x5
    80000b08:	2dc50513          	add	a0,a0,732 # 80005de0 <rodata_start+0xde0>
    80000b0c:	2c9000ef          	jal	800015d4 <printf>
    80000b10:	141025f3          	csrr	a1,sepc
    80000b14:	00005517          	auipc	a0,0x5
    80000b18:	2e450513          	add	a0,a0,740 # 80005df8 <rodata_start+0xdf8>
    80000b1c:	2b9000ef          	jal	800015d4 <printf>
    80000b20:	00005517          	auipc	a0,0x5
    80000b24:	2f050513          	add	a0,a0,752 # 80005e10 <rodata_start+0xe10>
    80000b28:	61d000ef          	jal	80001944 <uart_puts>
    80000b2c:	00000793          	li	a5,0
    80000b30:	10079073          	csrw	sstatus,a5
    80000b34:	100025f3          	csrr	a1,sstatus
    80000b38:	00005517          	auipc	a0,0x5
    80000b3c:	2f050513          	add	a0,a0,752 # 80005e28 <rodata_start+0xe28>
    80000b40:	295000ef          	jal	800015d4 <printf>
    80000b44:	10041073          	csrw	sstatus,s0
    80000b48:	00005517          	auipc	a0,0x5
    80000b4c:	2f850513          	add	a0,a0,760 # 80005e40 <rodata_start+0xe40>
    80000b50:	5f5000ef          	jal	80001944 <uart_puts>
    80000b54:	00013403          	ld	s0,0(sp)
    80000b58:	00813083          	ld	ra,8(sp)
    80000b5c:	00005517          	auipc	a0,0x5
    80000b60:	2fc50513          	add	a0,a0,764 # 80005e58 <rodata_start+0xe58>
    80000b64:	01010113          	add	sp,sp,16
    80000b68:	5dd0006f          	j	80001944 <uart_puts>

0000000080000b6c <test_exception_definitions>:
    80000b6c:	ff010113          	add	sp,sp,-16
    80000b70:	00005517          	auipc	a0,0x5
    80000b74:	30050513          	add	a0,a0,768 # 80005e70 <rodata_start+0xe70>
    80000b78:	00113423          	sd	ra,8(sp)
    80000b7c:	5c9000ef          	jal	80001944 <uart_puts>
    80000b80:	00005517          	auipc	a0,0x5
    80000b84:	33050513          	add	a0,a0,816 # 80005eb0 <rodata_start+0xeb0>
    80000b88:	24d000ef          	jal	800015d4 <printf>
    80000b8c:	00200593          	li	a1,2
    80000b90:	00005517          	auipc	a0,0x5
    80000b94:	33850513          	add	a0,a0,824 # 80005ec8 <rodata_start+0xec8>
    80000b98:	23d000ef          	jal	800015d4 <printf>
    80000b9c:	00d00593          	li	a1,13
    80000ba0:	00005517          	auipc	a0,0x5
    80000ba4:	34850513          	add	a0,a0,840 # 80005ee8 <rodata_start+0xee8>
    80000ba8:	22d000ef          	jal	800015d4 <printf>
    80000bac:	00f00593          	li	a1,15
    80000bb0:	00005517          	auipc	a0,0x5
    80000bb4:	35850513          	add	a0,a0,856 # 80005f08 <rodata_start+0xf08>
    80000bb8:	21d000ef          	jal	800015d4 <printf>
    80000bbc:	00800593          	li	a1,8
    80000bc0:	00005517          	auipc	a0,0x5
    80000bc4:	36850513          	add	a0,a0,872 # 80005f28 <rodata_start+0xf28>
    80000bc8:	20d000ef          	jal	800015d4 <printf>
    80000bcc:	00005517          	auipc	a0,0x5
    80000bd0:	37450513          	add	a0,a0,884 # 80005f40 <rodata_start+0xf40>
    80000bd4:	201000ef          	jal	800015d4 <printf>
    80000bd8:	00500593          	li	a1,5
    80000bdc:	00005517          	auipc	a0,0x5
    80000be0:	37c50513          	add	a0,a0,892 # 80005f58 <rodata_start+0xf58>
    80000be4:	1f1000ef          	jal	800015d4 <printf>
    80000be8:	00700593          	li	a1,7
    80000bec:	00005517          	auipc	a0,0x5
    80000bf0:	38450513          	add	a0,a0,900 # 80005f70 <rodata_start+0xf70>
    80000bf4:	1e1000ef          	jal	800015d4 <printf>
    80000bf8:	00900593          	li	a1,9
    80000bfc:	00005517          	auipc	a0,0x5
    80000c00:	38c50513          	add	a0,a0,908 # 80005f88 <rodata_start+0xf88>
    80000c04:	1d1000ef          	jal	800015d4 <printf>
    80000c08:	00005517          	auipc	a0,0x5
    80000c0c:	39850513          	add	a0,a0,920 # 80005fa0 <rodata_start+0xfa0>
    80000c10:	535000ef          	jal	80001944 <uart_puts>
    80000c14:	00813083          	ld	ra,8(sp)
    80000c18:	00005517          	auipc	a0,0x5
    80000c1c:	3b050513          	add	a0,a0,944 # 80005fc8 <rodata_start+0xfc8>
    80000c20:	01010113          	add	sp,sp,16
    80000c24:	5210006f          	j	80001944 <uart_puts>

0000000080000c28 <test_trapframe_structure>:
    80000c28:	ff010113          	add	sp,sp,-16
    80000c2c:	00005517          	auipc	a0,0x5
    80000c30:	3b450513          	add	a0,a0,948 # 80005fe0 <rodata_start+0xfe0>
    80000c34:	00113423          	sd	ra,8(sp)
    80000c38:	50d000ef          	jal	80001944 <uart_puts>
    80000c3c:	11000593          	li	a1,272
    80000c40:	00005517          	auipc	a0,0x5
    80000c44:	3d850513          	add	a0,a0,984 # 80006018 <rodata_start+0x1018>
    80000c48:	18d000ef          	jal	800015d4 <printf>
    80000c4c:	00005517          	auipc	a0,0x5
    80000c50:	3f450513          	add	a0,a0,1012 # 80006040 <rodata_start+0x1040>
    80000c54:	181000ef          	jal	800015d4 <printf>
    80000c58:	00005517          	auipc	a0,0x5
    80000c5c:	41850513          	add	a0,a0,1048 # 80006070 <rodata_start+0x1070>
    80000c60:	175000ef          	jal	800015d4 <printf>
    80000c64:	00800593          	li	a1,8
    80000c68:	00005517          	auipc	a0,0x5
    80000c6c:	42050513          	add	a0,a0,1056 # 80006088 <rodata_start+0x1088>
    80000c70:	165000ef          	jal	800015d4 <printf>
    80000c74:	00800593          	li	a1,8
    80000c78:	00005517          	auipc	a0,0x5
    80000c7c:	42850513          	add	a0,a0,1064 # 800060a0 <rodata_start+0x10a0>
    80000c80:	155000ef          	jal	800015d4 <printf>
    80000c84:	00800593          	li	a1,8
    80000c88:	00005517          	auipc	a0,0x5
    80000c8c:	43850513          	add	a0,a0,1080 # 800060c0 <rodata_start+0x10c0>
    80000c90:	145000ef          	jal	800015d4 <printf>
    80000c94:	02200693          	li	a3,34
    80000c98:	00800613          	li	a2,8
    80000c9c:	11000593          	li	a1,272
    80000ca0:	00005517          	auipc	a0,0x5
    80000ca4:	44050513          	add	a0,a0,1088 # 800060e0 <rodata_start+0x10e0>
    80000ca8:	12d000ef          	jal	800015d4 <printf>
    80000cac:	00005517          	auipc	a0,0x5
    80000cb0:	45c50513          	add	a0,a0,1116 # 80006108 <rodata_start+0x1108>
    80000cb4:	491000ef          	jal	80001944 <uart_puts>
    80000cb8:	00813083          	ld	ra,8(sp)
    80000cbc:	00005517          	auipc	a0,0x5
    80000cc0:	47450513          	add	a0,a0,1140 # 80006130 <rodata_start+0x1130>
    80000cc4:	01010113          	add	sp,sp,16
    80000cc8:	47d0006f          	j	80001944 <uart_puts>

0000000080000ccc <test_interrupt_handlers>:
    80000ccc:	ff010113          	add	sp,sp,-16
    80000cd0:	00005517          	auipc	a0,0x5
    80000cd4:	47850513          	add	a0,a0,1144 # 80006148 <rodata_start+0x1148>
    80000cd8:	00113423          	sd	ra,8(sp)
    80000cdc:	469000ef          	jal	80001944 <uart_puts>
    80000ce0:	00005517          	auipc	a0,0x5
    80000ce4:	4a850513          	add	a0,a0,1192 # 80006188 <rodata_start+0x1188>
    80000ce8:	45d000ef          	jal	80001944 <uart_puts>
    80000cec:	00413797          	auipc	a5,0x413
    80000cf0:	7bc78793          	add	a5,a5,1980 # 804144a8 <trap_handlers>
    80000cf4:	00414697          	auipc	a3,0x414
    80000cf8:	83468693          	add	a3,a3,-1996 # 80414528 <trapframe_pool>
    80000cfc:	00000593          	li	a1,0
    80000d00:	0007b703          	ld	a4,0(a5)
    80000d04:	00878793          	add	a5,a5,8
    80000d08:	00070463          	beqz	a4,80000d10 <test_interrupt_handlers+0x44>
    80000d0c:	0015859b          	addw	a1,a1,1
    80000d10:	fed798e3          	bne	a5,a3,80000d00 <test_interrupt_handlers+0x34>
    80000d14:	00005517          	auipc	a0,0x5
    80000d18:	49450513          	add	a0,a0,1172 # 800061a8 <rodata_start+0x11a8>
    80000d1c:	0b9000ef          	jal	800015d4 <printf>
    80000d20:	00005517          	auipc	a0,0x5
    80000d24:	4b050513          	add	a0,a0,1200 # 800061d0 <rodata_start+0x11d0>
    80000d28:	41d000ef          	jal	80001944 <uart_puts>
    80000d2c:	00813083          	ld	ra,8(sp)
    80000d30:	00005517          	auipc	a0,0x5
    80000d34:	4d050513          	add	a0,a0,1232 # 80006200 <rodata_start+0x1200>
    80000d38:	01010113          	add	sp,sp,16
    80000d3c:	4090006f          	j	80001944 <uart_puts>

0000000080000d40 <test_timer_interrupt>:
    80000d40:	fd010113          	add	sp,sp,-48
    80000d44:	00005517          	auipc	a0,0x5
    80000d48:	4d450513          	add	a0,a0,1236 # 80006218 <rodata_start+0x1218>
    80000d4c:	02113423          	sd	ra,40(sp)
    80000d50:	02813023          	sd	s0,32(sp)
    80000d54:	00913c23          	sd	s1,24(sp)
    80000d58:	3ed000ef          	jal	80001944 <uart_puts>
    80000d5c:	00005517          	auipc	a0,0x5
    80000d60:	4f450513          	add	a0,a0,1268 # 80006250 <rodata_start+0x1250>
    80000d64:	3e1000ef          	jal	80001944 <uart_puts>
    80000d68:	00005517          	auipc	a0,0x5
    80000d6c:	51850513          	add	a0,a0,1304 # 80006280 <rodata_start+0x1280>
    80000d70:	3d5000ef          	jal	80001944 <uart_puts>
    80000d74:	00425417          	auipc	s0,0x425
    80000d78:	4dc40413          	add	s0,s0,1244 # 80426250 <ticks>
    80000d7c:	00005517          	auipc	a0,0x5
    80000d80:	53450513          	add	a0,a0,1332 # 800062b0 <rodata_start+0x12b0>
    80000d84:	3c1000ef          	jal	80001944 <uart_puts>
    80000d88:	00043483          	ld	s1,0(s0)
    80000d8c:	00005517          	auipc	a0,0x5
    80000d90:	55450513          	add	a0,a0,1364 # 800062e0 <rodata_start+0x12e0>
    80000d94:	00048593          	mv	a1,s1
    80000d98:	03d000ef          	jal	800015d4 <printf>
    80000d9c:	0a5020ef          	jal	80003640 <intr_on>
    80000da0:	00005517          	auipc	a0,0x5
    80000da4:	55850513          	add	a0,a0,1368 # 800062f8 <rodata_start+0x12f8>
    80000da8:	39d000ef          	jal	80001944 <uart_puts>
    80000dac:	00005517          	auipc	a0,0x5
    80000db0:	56450513          	add	a0,a0,1380 # 80006310 <rodata_start+0x1310>
    80000db4:	391000ef          	jal	80001944 <uart_puts>
    80000db8:	00043783          	ld	a5,0(s0)
    80000dbc:	00000593          	li	a1,0
    80000dc0:	00f13423          	sd	a5,8(sp)
    80000dc4:	00813783          	ld	a5,8(sp)
    80000dc8:	00043703          	ld	a4,0(s0)
    80000dcc:	02f71263          	bne	a4,a5,80000df0 <test_timer_interrupt+0xb0>
    80000dd0:	05f5e6b7          	lui	a3,0x5f5e
    80000dd4:	10068693          	add	a3,a3,256 # 5f5e100 <_entry-0x7a0a1f00>
    80000dd8:	0080006f          	j	80000de0 <test_timer_interrupt+0xa0>
    80000ddc:	00d58a63          	beq	a1,a3,80000df0 <test_timer_interrupt+0xb0>
    80000de0:	00813703          	ld	a4,8(sp)
    80000de4:	00043783          	ld	a5,0(s0)
    80000de8:	0015859b          	addw	a1,a1,1
    80000dec:	fef708e3          	beq	a4,a5,80000ddc <test_timer_interrupt+0x9c>
    80000df0:	00005517          	auipc	a0,0x5
    80000df4:	53850513          	add	a0,a0,1336 # 80006328 <rodata_start+0x1328>
    80000df8:	7dc000ef          	jal	800015d4 <printf>
    80000dfc:	00043583          	ld	a1,0(s0)
    80000e00:	00005517          	auipc	a0,0x5
    80000e04:	54050513          	add	a0,a0,1344 # 80006340 <rodata_start+0x1340>
    80000e08:	7cc000ef          	jal	800015d4 <printf>
    80000e0c:	00043783          	ld	a5,0(s0)
    80000e10:	04f4f063          	bgeu	s1,a5,80000e50 <test_timer_interrupt+0x110>
    80000e14:	00043583          	ld	a1,0(s0)
    80000e18:	00005517          	auipc	a0,0x5
    80000e1c:	54050513          	add	a0,a0,1344 # 80006358 <rodata_start+0x1358>
    80000e20:	409585b3          	sub	a1,a1,s1
    80000e24:	7b0000ef          	jal	800015d4 <printf>
    80000e28:	00005517          	auipc	a0,0x5
    80000e2c:	56850513          	add	a0,a0,1384 # 80006390 <rodata_start+0x1390>
    80000e30:	315000ef          	jal	80001944 <uart_puts>
    80000e34:	02013403          	ld	s0,32(sp)
    80000e38:	02813083          	ld	ra,40(sp)
    80000e3c:	01813483          	ld	s1,24(sp)
    80000e40:	00005517          	auipc	a0,0x5
    80000e44:	59850513          	add	a0,a0,1432 # 800063d8 <rodata_start+0x13d8>
    80000e48:	03010113          	add	sp,sp,48
    80000e4c:	2f90006f          	j	80001944 <uart_puts>
    80000e50:	00005517          	auipc	a0,0x5
    80000e54:	56850513          	add	a0,a0,1384 # 800063b8 <rodata_start+0x13b8>
    80000e58:	2ed000ef          	jal	80001944 <uart_puts>
    80000e5c:	02013403          	ld	s0,32(sp)
    80000e60:	02813083          	ld	ra,40(sp)
    80000e64:	01813483          	ld	s1,24(sp)
    80000e68:	00005517          	auipc	a0,0x5
    80000e6c:	57050513          	add	a0,a0,1392 # 800063d8 <rodata_start+0x13d8>
    80000e70:	03010113          	add	sp,sp,48
    80000e74:	2d10006f          	j	80001944 <uart_puts>

0000000080000e78 <test_repeated_initialization>:
    80000e78:	fe010113          	add	sp,sp,-32
    80000e7c:	00005517          	auipc	a0,0x5
    80000e80:	57450513          	add	a0,a0,1396 # 800063f0 <rodata_start+0x13f0>
    80000e84:	00113c23          	sd	ra,24(sp)
    80000e88:	00813823          	sd	s0,16(sp)
    80000e8c:	00913423          	sd	s1,8(sp)
    80000e90:	01213023          	sd	s2,0(sp)
    80000e94:	2b1000ef          	jal	80001944 <uart_puts>
    80000e98:	00005517          	auipc	a0,0x5
    80000e9c:	59850513          	add	a0,a0,1432 # 80006430 <rodata_start+0x1430>
    80000ea0:	2a5000ef          	jal	80001944 <uart_puts>
    80000ea4:	00000413          	li	s0,0
    80000ea8:	00005917          	auipc	s2,0x5
    80000eac:	5a090913          	add	s2,s2,1440 # 80006448 <rodata_start+0x1448>
    80000eb0:	00500493          	li	s1,5
    80000eb4:	7c8020ef          	jal	8000367c <trap_init>
    80000eb8:	0014041b          	addw	s0,s0,1
    80000ebc:	071020ef          	jal	8000372c <trap_init_hart>
    80000ec0:	00040593          	mv	a1,s0
    80000ec4:	00090513          	mv	a0,s2
    80000ec8:	70c000ef          	jal	800015d4 <printf>
    80000ecc:	fe9414e3          	bne	s0,s1,80000eb4 <test_repeated_initialization+0x3c>
    80000ed0:	00005517          	auipc	a0,0x5
    80000ed4:	59850513          	add	a0,a0,1432 # 80006468 <rodata_start+0x1468>
    80000ed8:	26d000ef          	jal	80001944 <uart_puts>
    80000edc:	01013403          	ld	s0,16(sp)
    80000ee0:	01813083          	ld	ra,24(sp)
    80000ee4:	00813483          	ld	s1,8(sp)
    80000ee8:	00013903          	ld	s2,0(sp)
    80000eec:	00005517          	auipc	a0,0x5
    80000ef0:	5a450513          	add	a0,a0,1444 # 80006490 <rodata_start+0x1490>
    80000ef4:	02010113          	add	sp,sp,32
    80000ef8:	24d0006f          	j	80001944 <uart_puts>

0000000080000efc <run_all_system_tests>:
    80000efc:	ff010113          	add	sp,sp,-16
    80000f00:	00004517          	auipc	a0,0x4
    80000f04:	42850513          	add	a0,a0,1064 # 80005328 <rodata_start+0x328>
    80000f08:	00113423          	sd	ra,8(sp)
    80000f0c:	239000ef          	jal	80001944 <uart_puts>
    80000f10:	00004517          	auipc	a0,0x4
    80000f14:	5b050513          	add	a0,a0,1456 # 800054c0 <rodata_start+0x4c0>
    80000f18:	22d000ef          	jal	80001944 <uart_puts>
    80000f1c:	00005517          	auipc	a0,0x5
    80000f20:	58c50513          	add	a0,a0,1420 # 800064a8 <rodata_start+0x14a8>
    80000f24:	221000ef          	jal	80001944 <uart_puts>
    80000f28:	00004517          	auipc	a0,0x4
    80000f2c:	6c050513          	add	a0,a0,1728 # 800055e8 <rodata_start+0x5e8>
    80000f30:	215000ef          	jal	80001944 <uart_puts>
    80000f34:	8c5ff0ef          	jal	800007f8 <test_trap_initialization>
    80000f38:	93dff0ef          	jal	80000874 <test_interrupt_control>
    80000f3c:	a0dff0ef          	jal	80000948 <test_trapframe_allocation>
    80000f40:	b95ff0ef          	jal	80000ad4 <test_csr_operations>
    80000f44:	c29ff0ef          	jal	80000b6c <test_exception_definitions>
    80000f48:	ce1ff0ef          	jal	80000c28 <test_trapframe_structure>
    80000f4c:	d81ff0ef          	jal	80000ccc <test_interrupt_handlers>
    80000f50:	df1ff0ef          	jal	80000d40 <test_timer_interrupt>
    80000f54:	f25ff0ef          	jal	80000e78 <test_repeated_initialization>
    80000f58:	00004517          	auipc	a0,0x4
    80000f5c:	3d050513          	add	a0,a0,976 # 80005328 <rodata_start+0x328>
    80000f60:	1e5000ef          	jal	80001944 <uart_puts>
    80000f64:	00004517          	auipc	a0,0x4
    80000f68:	55c50513          	add	a0,a0,1372 # 800054c0 <rodata_start+0x4c0>
    80000f6c:	1d9000ef          	jal	80001944 <uart_puts>
    80000f70:	00005517          	auipc	a0,0x5
    80000f74:	59850513          	add	a0,a0,1432 # 80006508 <rodata_start+0x1508>
    80000f78:	1cd000ef          	jal	80001944 <uart_puts>
    80000f7c:	00813083          	ld	ra,8(sp)
    80000f80:	00004517          	auipc	a0,0x4
    80000f84:	78850513          	add	a0,a0,1928 # 80005708 <rodata_start+0x708>
    80000f88:	01010113          	add	sp,sp,16
    80000f8c:	1b90006f          	j	80001944 <uart_puts>

0000000080000f90 <run_interrupt_exception_tests>:
    80000f90:	f6dff06f          	j	80000efc <run_all_system_tests>

0000000080000f94 <main>:
    80000f94:	ff010113          	add	sp,sp,-16
    80000f98:	00004517          	auipc	a0,0x4
    80000f9c:	52850513          	add	a0,a0,1320 # 800054c0 <rodata_start+0x4c0>
    80000fa0:	00113423          	sd	ra,8(sp)
    80000fa4:	1a1000ef          	jal	80001944 <uart_puts>
    80000fa8:	00005517          	auipc	a0,0x5
    80000fac:	5b850513          	add	a0,a0,1464 # 80006560 <rodata_start+0x1560>
    80000fb0:	195000ef          	jal	80001944 <uart_puts>
    80000fb4:	00004517          	auipc	a0,0x4
    80000fb8:	75450513          	add	a0,a0,1876 # 80005708 <rodata_start+0x708>
    80000fbc:	189000ef          	jal	80001944 <uart_puts>
    80000fc0:	00005517          	auipc	a0,0x5
    80000fc4:	5f850513          	add	a0,a0,1528 # 800065b8 <rodata_start+0x15b8>
    80000fc8:	17d000ef          	jal	80001944 <uart_puts>
    80000fcc:	01100593          	li	a1,17
    80000fd0:	02001537          	lui	a0,0x2001
    80000fd4:	01b59593          	sll	a1,a1,0x1b
    80000fd8:	00651513          	sll	a0,a0,0x6
    80000fdc:	195000ef          	jal	80001970 <pmm_init>
    80000fe0:	00005517          	auipc	a0,0x5
    80000fe4:	61050513          	add	a0,a0,1552 # 800065f0 <rodata_start+0x15f0>
    80000fe8:	15d000ef          	jal	80001944 <uart_puts>
    80000fec:	00005517          	auipc	a0,0x5
    80000ff0:	63c50513          	add	a0,a0,1596 # 80006628 <rodata_start+0x1628>
    80000ff4:	151000ef          	jal	80001944 <uart_puts>
    80000ff8:	684020ef          	jal	8000367c <trap_init>
    80000ffc:	730020ef          	jal	8000372c <trap_init_hart>
    80001000:	00005517          	auipc	a0,0x5
    80001004:	66050513          	add	a0,a0,1632 # 80006660 <rodata_start+0x1660>
    80001008:	13d000ef          	jal	80001944 <uart_puts>
    8000100c:	00005517          	auipc	a0,0x5
    80001010:	68450513          	add	a0,a0,1668 # 80006690 <rodata_start+0x1690>
    80001014:	131000ef          	jal	80001944 <uart_puts>
    80001018:	788020ef          	jal	800037a0 <timerinit>
    8000101c:	00005517          	auipc	a0,0x5
    80001020:	6ac50513          	add	a0,a0,1708 # 800066c8 <rodata_start+0x16c8>
    80001024:	121000ef          	jal	80001944 <uart_puts>
    80001028:	00005517          	auipc	a0,0x5
    8000102c:	6d050513          	add	a0,a0,1744 # 800066f8 <rodata_start+0x16f8>
    80001030:	115000ef          	jal	80001944 <uart_puts>
    80001034:	4d5020ef          	jal	80003d08 <proc_init>
    80001038:	00005517          	auipc	a0,0x5
    8000103c:	6f850513          	add	a0,a0,1784 # 80006730 <rodata_start+0x1730>
    80001040:	105000ef          	jal	80001944 <uart_puts>
    80001044:	df8ff0ef          	jal	8000063c <run_process_management_tests>
    80001048:	ec0ff0ef          	jal	80000708 <test_round_robin_scheduler>
    8000104c:	00005517          	auipc	a0,0x5
    80001050:	71450513          	add	a0,a0,1812 # 80006760 <rodata_start+0x1760>
    80001054:	0f1000ef          	jal	80001944 <uart_puts>
    80001058:	0000006f          	j	80001058 <main+0xc4>

000000008000105c <print_number>:
    8000105c:	0c050663          	beqz	a0,80001128 <print_number+0xcc>
    80001060:	fd010113          	add	sp,sp,-48
    80001064:	02113423          	sd	ra,40(sp)
    80001068:	02813023          	sd	s0,32(sp)
    8000106c:	08061a63          	bnez	a2,80001100 <print_number+0xa4>
    80001070:	0005071b          	sext.w	a4,a0
    80001074:	00000613          	li	a2,0
    80001078:	0005859b          	sext.w	a1,a1
    8000107c:	00010fa3          	sb	zero,31(sp)
    80001080:	01e10813          	add	a6,sp,30
    80001084:	01f00693          	li	a3,31
    80001088:	00006317          	auipc	t1,0x6
    8000108c:	9e830313          	add	t1,t1,-1560 # 80006a70 <digits>
    80001090:	02b777bb          	remuw	a5,a4,a1
    80001094:	fff80813          	add	a6,a6,-1
    80001098:	0007089b          	sext.w	a7,a4
    8000109c:	00068e13          	mv	t3,a3
    800010a0:	fff6869b          	addw	a3,a3,-1
    800010a4:	02079793          	sll	a5,a5,0x20
    800010a8:	0207d793          	srl	a5,a5,0x20
    800010ac:	00f307b3          	add	a5,t1,a5
    800010b0:	0007c503          	lbu	a0,0(a5)
    800010b4:	02b7573b          	divuw	a4,a4,a1
    800010b8:	00a800a3          	sb	a0,1(a6)
    800010bc:	fcb8fae3          	bgeu	a7,a1,80001090 <print_number+0x34>
    800010c0:	04060a63          	beqz	a2,80001114 <print_number+0xb8>
    800010c4:	ffee069b          	addw	a3,t3,-2
    800010c8:	02068793          	add	a5,a3,32
    800010cc:	002787b3          	add	a5,a5,sp
    800010d0:	02d00713          	li	a4,45
    800010d4:	fee78023          	sb	a4,-32(a5)
    800010d8:	02d00513          	li	a0,45
    800010dc:	00d10433          	add	s0,sp,a3
    800010e0:	00140413          	add	s0,s0,1
    800010e4:	049000ef          	jal	8000192c <uart_putc>
    800010e8:	00044503          	lbu	a0,0(s0)
    800010ec:	fe051ae3          	bnez	a0,800010e0 <print_number+0x84>
    800010f0:	02813083          	ld	ra,40(sp)
    800010f4:	02013403          	ld	s0,32(sp)
    800010f8:	03010113          	add	sp,sp,48
    800010fc:	00008067          	ret
    80001100:	f60558e3          	bgez	a0,80001070 <print_number+0x14>
    80001104:	80000737          	lui	a4,0x80000
    80001108:	f6e508e3          	beq	a0,a4,80001078 <print_number+0x1c>
    8000110c:	40a0073b          	negw	a4,a0
    80001110:	f69ff06f          	j	80001078 <print_number+0x1c>
    80001114:	fc0514e3          	bnez	a0,800010dc <print_number+0x80>
    80001118:	02813083          	ld	ra,40(sp)
    8000111c:	02013403          	ld	s0,32(sp)
    80001120:	03010113          	add	sp,sp,48
    80001124:	00008067          	ret
    80001128:	03000513          	li	a0,48
    8000112c:	0010006f          	j	8000192c <uart_putc>

0000000080001130 <print_number_long.part.0>:
    80001130:	fd010113          	add	sp,sp,-48
    80001134:	02113423          	sd	ra,40(sp)
    80001138:	02813023          	sd	s0,32(sp)
    8000113c:	00050793          	mv	a5,a0
    80001140:	00060463          	beqz	a2,80001148 <print_number_long.part.0+0x18>
    80001144:	08054c63          	bltz	a0,800011dc <print_number_long.part.0+0xac>
    80001148:	00000613          	li	a2,0
    8000114c:	00010fa3          	sb	zero,31(sp)
    80001150:	01e10813          	add	a6,sp,30
    80001154:	01f00693          	li	a3,31
    80001158:	00006317          	auipc	t1,0x6
    8000115c:	91830313          	add	t1,t1,-1768 # 80006a70 <digits>
    80001160:	02b7f733          	remu	a4,a5,a1
    80001164:	fff80813          	add	a6,a6,-1
    80001168:	00078893          	mv	a7,a5
    8000116c:	00068e13          	mv	t3,a3
    80001170:	fff6869b          	addw	a3,a3,-1
    80001174:	00e30733          	add	a4,t1,a4
    80001178:	00074503          	lbu	a0,0(a4) # ffffffff80000000 <bss_end+0xfffffffeffbd9d90>
    8000117c:	02b7d7b3          	divu	a5,a5,a1
    80001180:	00a800a3          	sb	a0,1(a6)
    80001184:	fcb8fee3          	bgeu	a7,a1,80001160 <print_number_long.part.0+0x30>
    80001188:	04060063          	beqz	a2,800011c8 <print_number_long.part.0+0x98>
    8000118c:	ffee069b          	addw	a3,t3,-2
    80001190:	02068793          	add	a5,a3,32
    80001194:	002787b3          	add	a5,a5,sp
    80001198:	02d00713          	li	a4,45
    8000119c:	fee78023          	sb	a4,-32(a5)
    800011a0:	02d00513          	li	a0,45
    800011a4:	00d10433          	add	s0,sp,a3
    800011a8:	00140413          	add	s0,s0,1
    800011ac:	780000ef          	jal	8000192c <uart_putc>
    800011b0:	00044503          	lbu	a0,0(s0)
    800011b4:	fe051ae3          	bnez	a0,800011a8 <print_number_long.part.0+0x78>
    800011b8:	02813083          	ld	ra,40(sp)
    800011bc:	02013403          	ld	s0,32(sp)
    800011c0:	03010113          	add	sp,sp,48
    800011c4:	00008067          	ret
    800011c8:	fc051ee3          	bnez	a0,800011a4 <print_number_long.part.0+0x74>
    800011cc:	02813083          	ld	ra,40(sp)
    800011d0:	02013403          	ld	s0,32(sp)
    800011d4:	03010113          	add	sp,sp,48
    800011d8:	00008067          	ret
    800011dc:	40a007b3          	neg	a5,a0
    800011e0:	f6dff06f          	j	8000114c <print_number_long.part.0+0x1c>

00000000800011e4 <clear_screen>:
    800011e4:	00005517          	auipc	a0,0x5
    800011e8:	5b450513          	add	a0,a0,1460 # 80006798 <rodata_start+0x1798>
    800011ec:	7580006f          	j	80001944 <uart_puts>

00000000800011f0 <clear_line>:
    800011f0:	00005517          	auipc	a0,0x5
    800011f4:	5b050513          	add	a0,a0,1456 # 800067a0 <rodata_start+0x17a0>
    800011f8:	74c0006f          	j	80001944 <uart_puts>

00000000800011fc <goto_xy>:
    800011fc:	fd010113          	add	sp,sp,-48
    80001200:	00913c23          	sd	s1,24(sp)
    80001204:	00050493          	mv	s1,a0
    80001208:	01b00513          	li	a0,27
    8000120c:	02113423          	sd	ra,40(sp)
    80001210:	02813023          	sd	s0,32(sp)
    80001214:	01213823          	sd	s2,16(sp)
    80001218:	00058413          	mv	s0,a1
    8000121c:	01313423          	sd	s3,8(sp)
    80001220:	70c000ef          	jal	8000192c <uart_putc>
    80001224:	05b00513          	li	a0,91
    80001228:	704000ef          	jal	8000192c <uart_putc>
    8000122c:	06300793          	li	a5,99
    80001230:	0c87cc63          	blt	a5,s0,80001308 <goto_xy+0x10c>
    80001234:	00900793          	li	a5,9
    80001238:	0487ce63          	blt	a5,s0,80001294 <goto_xy+0x98>
    8000123c:	12805a63          	blez	s0,80001370 <goto_xy+0x174>
    80001240:	0304041b          	addw	s0,s0,48
    80001244:	0ff47513          	zext.b	a0,s0
    80001248:	6e4000ef          	jal	8000192c <uart_putc>
    8000124c:	03b00513          	li	a0,59
    80001250:	6dc000ef          	jal	8000192c <uart_putc>
    80001254:	06300793          	li	a5,99
    80001258:	0697c863          	blt	a5,s1,800012c8 <goto_xy+0xcc>
    8000125c:	00900793          	li	a5,9
    80001260:	0e97c463          	blt	a5,s1,80001348 <goto_xy+0x14c>
    80001264:	10905c63          	blez	s1,8000137c <goto_xy+0x180>
    80001268:	0304851b          	addw	a0,s1,48
    8000126c:	0ff57513          	zext.b	a0,a0
    80001270:	6bc000ef          	jal	8000192c <uart_putc>
    80001274:	02013403          	ld	s0,32(sp)
    80001278:	02813083          	ld	ra,40(sp)
    8000127c:	01813483          	ld	s1,24(sp)
    80001280:	01013903          	ld	s2,16(sp)
    80001284:	00813983          	ld	s3,8(sp)
    80001288:	04800513          	li	a0,72
    8000128c:	03010113          	add	sp,sp,48
    80001290:	69c0006f          	j	8000192c <uart_putc>
    80001294:	00a00913          	li	s2,10
    80001298:	0324453b          	divw	a0,s0,s2
    8000129c:	0305051b          	addw	a0,a0,48
    800012a0:	0ff57513          	zext.b	a0,a0
    800012a4:	688000ef          	jal	8000192c <uart_putc>
    800012a8:	0324643b          	remw	s0,s0,s2
    800012ac:	0304041b          	addw	s0,s0,48
    800012b0:	0ff47513          	zext.b	a0,s0
    800012b4:	678000ef          	jal	8000192c <uart_putc>
    800012b8:	03b00513          	li	a0,59
    800012bc:	670000ef          	jal	8000192c <uart_putc>
    800012c0:	06300793          	li	a5,99
    800012c4:	f897dce3          	bge	a5,s1,8000125c <goto_xy+0x60>
    800012c8:	06400413          	li	s0,100
    800012cc:	0284c53b          	divw	a0,s1,s0
    800012d0:	00a00913          	li	s2,10
    800012d4:	0305051b          	addw	a0,a0,48
    800012d8:	0ff57513          	zext.b	a0,a0
    800012dc:	650000ef          	jal	8000192c <uart_putc>
    800012e0:	0284e53b          	remw	a0,s1,s0
    800012e4:	0325453b          	divw	a0,a0,s2
    800012e8:	0305051b          	addw	a0,a0,48
    800012ec:	0ff57513          	zext.b	a0,a0
    800012f0:	63c000ef          	jal	8000192c <uart_putc>
    800012f4:	0324e53b          	remw	a0,s1,s2
    800012f8:	0305051b          	addw	a0,a0,48
    800012fc:	0ff57513          	zext.b	a0,a0
    80001300:	62c000ef          	jal	8000192c <uart_putc>
    80001304:	f71ff06f          	j	80001274 <goto_xy+0x78>
    80001308:	06400913          	li	s2,100
    8000130c:	0324453b          	divw	a0,s0,s2
    80001310:	00a00993          	li	s3,10
    80001314:	0305051b          	addw	a0,a0,48
    80001318:	0ff57513          	zext.b	a0,a0
    8000131c:	610000ef          	jal	8000192c <uart_putc>
    80001320:	0324653b          	remw	a0,s0,s2
    80001324:	0335453b          	divw	a0,a0,s3
    80001328:	0305051b          	addw	a0,a0,48
    8000132c:	0ff57513          	zext.b	a0,a0
    80001330:	5fc000ef          	jal	8000192c <uart_putc>
    80001334:	0334643b          	remw	s0,s0,s3
    80001338:	0304041b          	addw	s0,s0,48
    8000133c:	0ff47513          	zext.b	a0,s0
    80001340:	5ec000ef          	jal	8000192c <uart_putc>
    80001344:	f09ff06f          	j	8000124c <goto_xy+0x50>
    80001348:	00a00413          	li	s0,10
    8000134c:	0284c53b          	divw	a0,s1,s0
    80001350:	0305051b          	addw	a0,a0,48
    80001354:	0ff57513          	zext.b	a0,a0
    80001358:	5d4000ef          	jal	8000192c <uart_putc>
    8000135c:	0284e53b          	remw	a0,s1,s0
    80001360:	0305051b          	addw	a0,a0,48
    80001364:	0ff57513          	zext.b	a0,a0
    80001368:	5c4000ef          	jal	8000192c <uart_putc>
    8000136c:	f09ff06f          	j	80001274 <goto_xy+0x78>
    80001370:	03100513          	li	a0,49
    80001374:	5b8000ef          	jal	8000192c <uart_putc>
    80001378:	ed5ff06f          	j	8000124c <goto_xy+0x50>
    8000137c:	03100513          	li	a0,49
    80001380:	5ac000ef          	jal	8000192c <uart_putc>
    80001384:	ef1ff06f          	j	80001274 <goto_xy+0x78>

0000000080001388 <printf_color>:
    80001388:	f8010113          	add	sp,sp,-128
    8000138c:	02913c23          	sd	s1,56(sp)
    80001390:	00050493          	mv	s1,a0
    80001394:	01b00513          	li	a0,27
    80001398:	06f13423          	sd	a5,104(sp)
    8000139c:	04113423          	sd	ra,72(sp)
    800013a0:	04813023          	sd	s0,64(sp)
    800013a4:	04c13823          	sd	a2,80(sp)
    800013a8:	04d13c23          	sd	a3,88(sp)
    800013ac:	06e13023          	sd	a4,96(sp)
    800013b0:	07013823          	sd	a6,112(sp)
    800013b4:	07113c23          	sd	a7,120(sp)
    800013b8:	00058413          	mv	s0,a1
    800013bc:	03213823          	sd	s2,48(sp)
    800013c0:	03313423          	sd	s3,40(sp)
    800013c4:	03413023          	sd	s4,32(sp)
    800013c8:	01513c23          	sd	s5,24(sp)
    800013cc:	560000ef          	jal	8000192c <uart_putc>
    800013d0:	05b00513          	li	a0,91
    800013d4:	558000ef          	jal	8000192c <uart_putc>
    800013d8:	06300793          	li	a5,99
    800013dc:	1a97e063          	bltu	a5,s1,8000157c <printf_color+0x1f4>
    800013e0:	00900793          	li	a5,9
    800013e4:	1497e663          	bltu	a5,s1,80001530 <printf_color+0x1a8>
    800013e8:	0304851b          	addw	a0,s1,48
    800013ec:	0ff57513          	zext.b	a0,a0
    800013f0:	53c000ef          	jal	8000192c <uart_putc>
    800013f4:	06d00513          	li	a0,109
    800013f8:	534000ef          	jal	8000192c <uart_putc>
    800013fc:	1c040863          	beqz	s0,800015cc <printf_color+0x244>
    80001400:	00044503          	lbu	a0,0(s0)
    80001404:	05010793          	add	a5,sp,80
    80001408:	00f13423          	sd	a5,8(sp)
    8000140c:	00000a93          	li	s5,0
    80001410:	06050463          	beqz	a0,80001478 <printf_color+0xf0>
    80001414:	02500913          	li	s2,37
    80001418:	02000a13          	li	s4,32
    8000141c:	00005997          	auipc	s3,0x5
    80001420:	4c498993          	add	s3,s3,1220 # 800068e0 <rodata_start+0x18e0>
    80001424:	00140493          	add	s1,s0,1
    80001428:	13251863          	bne	a0,s2,80001558 <printf_color+0x1d0>
    8000142c:	00144783          	lbu	a5,1(s0)
    80001430:	14078063          	beqz	a5,80001570 <printf_color+0x1e8>
    80001434:	13278863          	beq	a5,s2,80001564 <printf_color+0x1dc>
    80001438:	fa87879b          	addw	a5,a5,-88
    8000143c:	0ff7f793          	zext.b	a5,a5
    80001440:	00fa6c63          	bltu	s4,a5,80001458 <printf_color+0xd0>
    80001444:	00279793          	sll	a5,a5,0x2
    80001448:	013787b3          	add	a5,a5,s3
    8000144c:	0007a783          	lw	a5,0(a5)
    80001450:	013787b3          	add	a5,a5,s3
    80001454:	00078067          	jr	a5
    80001458:	02500513          	li	a0,37
    8000145c:	4d0000ef          	jal	8000192c <uart_putc>
    80001460:	00144503          	lbu	a0,1(s0)
    80001464:	ffe00a93          	li	s5,-2
    80001468:	4c4000ef          	jal	8000192c <uart_putc>
    8000146c:	0014c503          	lbu	a0,1(s1)
    80001470:	00148413          	add	s0,s1,1
    80001474:	fa0518e3          	bnez	a0,80001424 <printf_color+0x9c>
    80001478:	00005517          	auipc	a0,0x5
    8000147c:	33850513          	add	a0,a0,824 # 800067b0 <rodata_start+0x17b0>
    80001480:	4c4000ef          	jal	80001944 <uart_puts>
    80001484:	04813083          	ld	ra,72(sp)
    80001488:	04013403          	ld	s0,64(sp)
    8000148c:	03813483          	ld	s1,56(sp)
    80001490:	03013903          	ld	s2,48(sp)
    80001494:	02813983          	ld	s3,40(sp)
    80001498:	02013a03          	ld	s4,32(sp)
    8000149c:	000a8513          	mv	a0,s5
    800014a0:	01813a83          	ld	s5,24(sp)
    800014a4:	08010113          	add	sp,sp,128
    800014a8:	00008067          	ret
    800014ac:	00813783          	ld	a5,8(sp)
    800014b0:	00000613          	li	a2,0
    800014b4:	01000593          	li	a1,16
    800014b8:	0007a503          	lw	a0,0(a5)
    800014bc:	00878793          	add	a5,a5,8
    800014c0:	00f13423          	sd	a5,8(sp)
    800014c4:	b99ff0ef          	jal	8000105c <print_number>
    800014c8:	fa5ff06f          	j	8000146c <printf_color+0xe4>
    800014cc:	00813783          	ld	a5,8(sp)
    800014d0:	0007c503          	lbu	a0,0(a5)
    800014d4:	00878793          	add	a5,a5,8
    800014d8:	00f13423          	sd	a5,8(sp)
    800014dc:	450000ef          	jal	8000192c <uart_putc>
    800014e0:	f8dff06f          	j	8000146c <printf_color+0xe4>
    800014e4:	00813783          	ld	a5,8(sp)
    800014e8:	0007b403          	ld	s0,0(a5)
    800014ec:	00878793          	add	a5,a5,8
    800014f0:	00f13423          	sd	a5,8(sp)
    800014f4:	00041863          	bnez	s0,80001504 <printf_color+0x17c>
    800014f8:	0c40006f          	j	800015bc <printf_color+0x234>
    800014fc:	00140413          	add	s0,s0,1
    80001500:	42c000ef          	jal	8000192c <uart_putc>
    80001504:	00044503          	lbu	a0,0(s0)
    80001508:	fe051ae3          	bnez	a0,800014fc <printf_color+0x174>
    8000150c:	f61ff06f          	j	8000146c <printf_color+0xe4>
    80001510:	00813783          	ld	a5,8(sp)
    80001514:	00100613          	li	a2,1
    80001518:	00a00593          	li	a1,10
    8000151c:	0007a503          	lw	a0,0(a5)
    80001520:	00878793          	add	a5,a5,8
    80001524:	00f13423          	sd	a5,8(sp)
    80001528:	b35ff0ef          	jal	8000105c <print_number>
    8000152c:	f41ff06f          	j	8000146c <printf_color+0xe4>
    80001530:	00a00913          	li	s2,10
    80001534:	0324d53b          	divuw	a0,s1,s2
    80001538:	0305051b          	addw	a0,a0,48
    8000153c:	0ff57513          	zext.b	a0,a0
    80001540:	3ec000ef          	jal	8000192c <uart_putc>
    80001544:	0324f53b          	remuw	a0,s1,s2
    80001548:	0305051b          	addw	a0,a0,48
    8000154c:	07f57513          	and	a0,a0,127
    80001550:	3dc000ef          	jal	8000192c <uart_putc>
    80001554:	ea1ff06f          	j	800013f4 <printf_color+0x6c>
    80001558:	3d4000ef          	jal	8000192c <uart_putc>
    8000155c:	00040493          	mv	s1,s0
    80001560:	f0dff06f          	j	8000146c <printf_color+0xe4>
    80001564:	02500513          	li	a0,37
    80001568:	3c4000ef          	jal	8000192c <uart_putc>
    8000156c:	f01ff06f          	j	8000146c <printf_color+0xe4>
    80001570:	02500513          	li	a0,37
    80001574:	3b8000ef          	jal	8000192c <uart_putc>
    80001578:	f01ff06f          	j	80001478 <printf_color+0xf0>
    8000157c:	06400913          	li	s2,100
    80001580:	0324d53b          	divuw	a0,s1,s2
    80001584:	00a00993          	li	s3,10
    80001588:	0305051b          	addw	a0,a0,48
    8000158c:	0ff57513          	zext.b	a0,a0
    80001590:	39c000ef          	jal	8000192c <uart_putc>
    80001594:	0324f53b          	remuw	a0,s1,s2
    80001598:	0335553b          	divuw	a0,a0,s3
    8000159c:	0305051b          	addw	a0,a0,48
    800015a0:	0ff57513          	zext.b	a0,a0
    800015a4:	388000ef          	jal	8000192c <uart_putc>
    800015a8:	0334f53b          	remuw	a0,s1,s3
    800015ac:	0305051b          	addw	a0,a0,48
    800015b0:	07f57513          	and	a0,a0,127
    800015b4:	378000ef          	jal	8000192c <uart_putc>
    800015b8:	e3dff06f          	j	800013f4 <printf_color+0x6c>
    800015bc:	00005517          	auipc	a0,0x5
    800015c0:	1ec50513          	add	a0,a0,492 # 800067a8 <rodata_start+0x17a8>
    800015c4:	380000ef          	jal	80001944 <uart_puts>
    800015c8:	ea5ff06f          	j	8000146c <printf_color+0xe4>
    800015cc:	fff00a93          	li	s5,-1
    800015d0:	eb5ff06f          	j	80001484 <printf_color+0xfc>

00000000800015d4 <printf>:
    800015d4:	f6010113          	add	sp,sp,-160
    800015d8:	04113c23          	sd	ra,88(sp)
    800015dc:	04813823          	sd	s0,80(sp)
    800015e0:	04913423          	sd	s1,72(sp)
    800015e4:	05213023          	sd	s2,64(sp)
    800015e8:	03313c23          	sd	s3,56(sp)
    800015ec:	03413823          	sd	s4,48(sp)
    800015f0:	03513423          	sd	s5,40(sp)
    800015f4:	03613023          	sd	s6,32(sp)
    800015f8:	01713c23          	sd	s7,24(sp)
    800015fc:	06b13423          	sd	a1,104(sp)
    80001600:	06c13823          	sd	a2,112(sp)
    80001604:	06d13c23          	sd	a3,120(sp)
    80001608:	08e13023          	sd	a4,128(sp)
    8000160c:	08f13423          	sd	a5,136(sp)
    80001610:	09013823          	sd	a6,144(sp)
    80001614:	09113c23          	sd	a7,152(sp)
    80001618:	20050c63          	beqz	a0,80001830 <printf+0x25c>
    8000161c:	00050413          	mv	s0,a0
    80001620:	00054503          	lbu	a0,0(a0)
    80001624:	06810793          	add	a5,sp,104
    80001628:	00f13423          	sd	a5,8(sp)
    8000162c:	00000b13          	li	s6,0
    80001630:	06050c63          	beqz	a0,800016a8 <printf+0xd4>
    80001634:	02500493          	li	s1,37
    80001638:	06c00993          	li	s3,108
    8000163c:	02000a13          	li	s4,32
    80001640:	00005917          	auipc	s2,0x5
    80001644:	32490913          	add	s2,s2,804 # 80006964 <rodata_start+0x1964>
    80001648:	00005a97          	auipc	s5,0x5
    8000164c:	3a0a8a93          	add	s5,s5,928 # 800069e8 <rodata_start+0x19e8>
    80001650:	04951463          	bne	a0,s1,80001698 <printf+0xc4>
    80001654:	00144783          	lbu	a5,1(s0)
    80001658:	18078e63          	beqz	a5,800017f4 <printf+0x220>
    8000165c:	11378063          	beq	a5,s3,8000175c <printf+0x188>
    80001660:	00140413          	add	s0,s0,1
    80001664:	16978863          	beq	a5,s1,800017d4 <printf+0x200>
    80001668:	fa87879b          	addw	a5,a5,-88
    8000166c:	0ff7f793          	zext.b	a5,a5
    80001670:	00fa6c63          	bltu	s4,a5,80001688 <printf+0xb4>
    80001674:	00279793          	sll	a5,a5,0x2
    80001678:	012787b3          	add	a5,a5,s2
    8000167c:	0007a783          	lw	a5,0(a5)
    80001680:	012787b3          	add	a5,a5,s2
    80001684:	00078067          	jr	a5
    80001688:	02500513          	li	a0,37
    8000168c:	2a0000ef          	jal	8000192c <uart_putc>
    80001690:	00044503          	lbu	a0,0(s0)
    80001694:	ffe00b13          	li	s6,-2
    80001698:	294000ef          	jal	8000192c <uart_putc>
    8000169c:	00144503          	lbu	a0,1(s0)
    800016a0:	00140413          	add	s0,s0,1
    800016a4:	fa0516e3          	bnez	a0,80001650 <printf+0x7c>
    800016a8:	05813083          	ld	ra,88(sp)
    800016ac:	05013403          	ld	s0,80(sp)
    800016b0:	04813483          	ld	s1,72(sp)
    800016b4:	04013903          	ld	s2,64(sp)
    800016b8:	03813983          	ld	s3,56(sp)
    800016bc:	03013a03          	ld	s4,48(sp)
    800016c0:	02813a83          	ld	s5,40(sp)
    800016c4:	01813b83          	ld	s7,24(sp)
    800016c8:	000b0513          	mv	a0,s6
    800016cc:	02013b03          	ld	s6,32(sp)
    800016d0:	0a010113          	add	sp,sp,160
    800016d4:	00008067          	ret
    800016d8:	00813783          	ld	a5,8(sp)
    800016dc:	00000613          	li	a2,0
    800016e0:	01000593          	li	a1,16
    800016e4:	0007a503          	lw	a0,0(a5)
    800016e8:	00878793          	add	a5,a5,8
    800016ec:	00f13423          	sd	a5,8(sp)
    800016f0:	96dff0ef          	jal	8000105c <print_number>
    800016f4:	fa9ff06f          	j	8000169c <printf+0xc8>
    800016f8:	00813783          	ld	a5,8(sp)
    800016fc:	0007c503          	lbu	a0,0(a5)
    80001700:	00878793          	add	a5,a5,8
    80001704:	00f13423          	sd	a5,8(sp)
    80001708:	224000ef          	jal	8000192c <uart_putc>
    8000170c:	f91ff06f          	j	8000169c <printf+0xc8>
    80001710:	00813783          	ld	a5,8(sp)
    80001714:	0007bb83          	ld	s7,0(a5)
    80001718:	00878793          	add	a5,a5,8
    8000171c:	00f13423          	sd	a5,8(sp)
    80001720:	000b9863          	bnez	s7,80001730 <printf+0x15c>
    80001724:	0e80006f          	j	8000180c <printf+0x238>
    80001728:	001b8b93          	add	s7,s7,1
    8000172c:	200000ef          	jal	8000192c <uart_putc>
    80001730:	000bc503          	lbu	a0,0(s7)
    80001734:	fe051ae3          	bnez	a0,80001728 <printf+0x154>
    80001738:	f65ff06f          	j	8000169c <printf+0xc8>
    8000173c:	00813783          	ld	a5,8(sp)
    80001740:	00100613          	li	a2,1
    80001744:	00a00593          	li	a1,10
    80001748:	0007a503          	lw	a0,0(a5)
    8000174c:	00878793          	add	a5,a5,8
    80001750:	00f13423          	sd	a5,8(sp)
    80001754:	909ff0ef          	jal	8000105c <print_number>
    80001758:	f45ff06f          	j	8000169c <printf+0xc8>
    8000175c:	00244783          	lbu	a5,2(s0)
    80001760:	00240413          	add	s0,s0,2
    80001764:	0a078c63          	beqz	a5,8000181c <printf+0x248>
    80001768:	06978663          	beq	a5,s1,800017d4 <printf+0x200>
    8000176c:	fa87879b          	addw	a5,a5,-88
    80001770:	0ff7f793          	zext.b	a5,a5
    80001774:	06fa6663          	bltu	s4,a5,800017e0 <printf+0x20c>
    80001778:	00279793          	sll	a5,a5,0x2
    8000177c:	015787b3          	add	a5,a5,s5
    80001780:	0007a783          	lw	a5,0(a5)
    80001784:	015787b3          	add	a5,a5,s5
    80001788:	00078067          	jr	a5
    8000178c:	00813783          	ld	a5,8(sp)
    80001790:	0007b503          	ld	a0,0(a5)
    80001794:	00878793          	add	a5,a5,8
    80001798:	00f13423          	sd	a5,8(sp)
    8000179c:	06050263          	beqz	a0,80001800 <printf+0x22c>
    800017a0:	00000613          	li	a2,0
    800017a4:	01000593          	li	a1,16
    800017a8:	989ff0ef          	jal	80001130 <print_number_long.part.0>
    800017ac:	ef1ff06f          	j	8000169c <printf+0xc8>
    800017b0:	00813783          	ld	a5,8(sp)
    800017b4:	0007b503          	ld	a0,0(a5)
    800017b8:	00878793          	add	a5,a5,8
    800017bc:	00f13423          	sd	a5,8(sp)
    800017c0:	04050063          	beqz	a0,80001800 <printf+0x22c>
    800017c4:	00100613          	li	a2,1
    800017c8:	00a00593          	li	a1,10
    800017cc:	965ff0ef          	jal	80001130 <print_number_long.part.0>
    800017d0:	ecdff06f          	j	8000169c <printf+0xc8>
    800017d4:	02500513          	li	a0,37
    800017d8:	154000ef          	jal	8000192c <uart_putc>
    800017dc:	ec1ff06f          	j	8000169c <printf+0xc8>
    800017e0:	02500513          	li	a0,37
    800017e4:	148000ef          	jal	8000192c <uart_putc>
    800017e8:	06c00513          	li	a0,108
    800017ec:	140000ef          	jal	8000192c <uart_putc>
    800017f0:	ea1ff06f          	j	80001690 <printf+0xbc>
    800017f4:	02500513          	li	a0,37
    800017f8:	134000ef          	jal	8000192c <uart_putc>
    800017fc:	eadff06f          	j	800016a8 <printf+0xd4>
    80001800:	03000513          	li	a0,48
    80001804:	128000ef          	jal	8000192c <uart_putc>
    80001808:	e95ff06f          	j	8000169c <printf+0xc8>
    8000180c:	00005517          	auipc	a0,0x5
    80001810:	f9c50513          	add	a0,a0,-100 # 800067a8 <rodata_start+0x17a8>
    80001814:	130000ef          	jal	80001944 <uart_puts>
    80001818:	e85ff06f          	j	8000169c <printf+0xc8>
    8000181c:	02500513          	li	a0,37
    80001820:	10c000ef          	jal	8000192c <uart_putc>
    80001824:	06c00513          	li	a0,108
    80001828:	104000ef          	jal	8000192c <uart_putc>
    8000182c:	e7dff06f          	j	800016a8 <printf+0xd4>
    80001830:	fff00b13          	li	s6,-1
    80001834:	e75ff06f          	j	800016a8 <printf+0xd4>

0000000080001838 <test_printf_basic>:
    80001838:	ff010113          	add	sp,sp,-16
    8000183c:	02a00593          	li	a1,42
    80001840:	00005517          	auipc	a0,0x5
    80001844:	f7850513          	add	a0,a0,-136 # 800067b8 <rodata_start+0x17b8>
    80001848:	00113423          	sd	ra,8(sp)
    8000184c:	d89ff0ef          	jal	800015d4 <printf>
    80001850:	f8500593          	li	a1,-123
    80001854:	00005517          	auipc	a0,0x5
    80001858:	f7c50513          	add	a0,a0,-132 # 800067d0 <rodata_start+0x17d0>
    8000185c:	d79ff0ef          	jal	800015d4 <printf>
    80001860:	00000593          	li	a1,0
    80001864:	00005517          	auipc	a0,0x5
    80001868:	f8450513          	add	a0,a0,-124 # 800067e8 <rodata_start+0x17e8>
    8000186c:	d69ff0ef          	jal	800015d4 <printf>
    80001870:	000015b7          	lui	a1,0x1
    80001874:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80001878:	00005517          	auipc	a0,0x5
    8000187c:	f8850513          	add	a0,a0,-120 # 80006800 <rodata_start+0x1800>
    80001880:	d55ff0ef          	jal	800015d4 <printf>
    80001884:	00005597          	auipc	a1,0x5
    80001888:	f9458593          	add	a1,a1,-108 # 80006818 <rodata_start+0x1818>
    8000188c:	00005517          	auipc	a0,0x5
    80001890:	f9450513          	add	a0,a0,-108 # 80006820 <rodata_start+0x1820>
    80001894:	d41ff0ef          	jal	800015d4 <printf>
    80001898:	05800593          	li	a1,88
    8000189c:	00005517          	auipc	a0,0x5
    800018a0:	f9c50513          	add	a0,a0,-100 # 80006838 <rodata_start+0x1838>
    800018a4:	d31ff0ef          	jal	800015d4 <printf>
    800018a8:	00813083          	ld	ra,8(sp)
    800018ac:	00005517          	auipc	a0,0x5
    800018b0:	fa450513          	add	a0,a0,-92 # 80006850 <rodata_start+0x1850>
    800018b4:	01010113          	add	sp,sp,16
    800018b8:	d1dff06f          	j	800015d4 <printf>

00000000800018bc <test_printf_edge_cases>:
    800018bc:	800005b7          	lui	a1,0x80000
    800018c0:	ff010113          	add	sp,sp,-16
    800018c4:	fff5c593          	not	a1,a1
    800018c8:	00005517          	auipc	a0,0x5
    800018cc:	fa050513          	add	a0,a0,-96 # 80006868 <rodata_start+0x1868>
    800018d0:	00113423          	sd	ra,8(sp)
    800018d4:	d01ff0ef          	jal	800015d4 <printf>
    800018d8:	800005b7          	lui	a1,0x80000
    800018dc:	00005517          	auipc	a0,0x5
    800018e0:	f9c50513          	add	a0,a0,-100 # 80006878 <rodata_start+0x1878>
    800018e4:	cf1ff0ef          	jal	800015d4 <printf>
    800018e8:	00000593          	li	a1,0
    800018ec:	00005517          	auipc	a0,0x5
    800018f0:	f9c50513          	add	a0,a0,-100 # 80006888 <rodata_start+0x1888>
    800018f4:	ce1ff0ef          	jal	800015d4 <printf>
    800018f8:	00004597          	auipc	a1,0x4
    800018fc:	ed858593          	add	a1,a1,-296 # 800057d0 <rodata_start+0x7d0>
    80001900:	00005517          	auipc	a0,0x5
    80001904:	fa050513          	add	a0,a0,-96 # 800068a0 <rodata_start+0x18a0>
    80001908:	ccdff0ef          	jal	800015d4 <printf>
    8000190c:	00005517          	auipc	a0,0x5
    80001910:	fac50513          	add	a0,a0,-84 # 800068b8 <rodata_start+0x18b8>
    80001914:	cc1ff0ef          	jal	800015d4 <printf>
    80001918:	00813083          	ld	ra,8(sp)
    8000191c:	00005517          	auipc	a0,0x5
    80001920:	fac50513          	add	a0,a0,-84 # 800068c8 <rodata_start+0x18c8>
    80001924:	01010113          	add	sp,sp,16
    80001928:	cadff06f          	j	800015d4 <printf>

000000008000192c <uart_putc>:
    8000192c:	10000737          	lui	a4,0x10000
    80001930:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80001934:	0207f793          	and	a5,a5,32
    80001938:	fe078ce3          	beqz	a5,80001930 <uart_putc+0x4>
    8000193c:	00a70023          	sb	a0,0(a4)
    80001940:	00008067          	ret

0000000080001944 <uart_puts>:
    80001944:	00054683          	lbu	a3,0(a0)
    80001948:	02068263          	beqz	a3,8000196c <uart_puts+0x28>
    8000194c:	10000737          	lui	a4,0x10000
    80001950:	00150513          	add	a0,a0,1
    80001954:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80001958:	0207f793          	and	a5,a5,32
    8000195c:	fe078ce3          	beqz	a5,80001954 <uart_puts+0x10>
    80001960:	00d70023          	sb	a3,0(a4)
    80001964:	00054683          	lbu	a3,0(a0)
    80001968:	fe0694e3          	bnez	a3,80001950 <uart_puts+0xc>
    8000196c:	00008067          	ret

0000000080001970 <pmm_init>:
    80001970:	000017b7          	lui	a5,0x1
    80001974:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001978:	00f50533          	add	a0,a0,a5
    8000197c:	fffff737          	lui	a4,0xfffff
    80001980:	00e57533          	and	a0,a0,a4
    80001984:	00e5f5b3          	and	a1,a1,a4
    80001988:	00425797          	auipc	a5,0x425
    8000198c:	8aa7b423          	sd	a0,-1880(a5) # 80426230 <mem_start>
    80001990:	00425797          	auipc	a5,0x425
    80001994:	88b7bc23          	sd	a1,-1896(a5) # 80426228 <mem_end>
    80001998:	00425797          	auipc	a5,0x425
    8000199c:	8a07b023          	sd	zero,-1888(a5) # 80426238 <freelist>
    800019a0:	02b57e63          	bgeu	a0,a1,800019dc <pmm_init+0x6c>
    800019a4:	02050e63          	beqz	a0,800019e0 <pmm_init+0x70>
    800019a8:	00050793          	mv	a5,a0
    800019ac:	00000613          	li	a2,0
    800019b0:	00000693          	li	a3,0
    800019b4:	00a7e863          	bltu	a5,a0,800019c4 <pmm_init+0x54>
    800019b8:	00d7b023          	sd	a3,0(a5)
    800019bc:	00100613          	li	a2,1
    800019c0:	00078693          	mv	a3,a5
    800019c4:	00001737          	lui	a4,0x1
    800019c8:	00e787b3          	add	a5,a5,a4
    800019cc:	feb7e4e3          	bltu	a5,a1,800019b4 <pmm_init+0x44>
    800019d0:	00060663          	beqz	a2,800019dc <pmm_init+0x6c>
    800019d4:	00425797          	auipc	a5,0x425
    800019d8:	86d7b223          	sd	a3,-1948(a5) # 80426238 <freelist>
    800019dc:	00008067          	ret
    800019e0:	00000793          	li	a5,0
    800019e4:	00000613          	li	a2,0
    800019e8:	00000693          	li	a3,0
    800019ec:	fd9ff06f          	j	800019c4 <pmm_init+0x54>

00000000800019f0 <alloc_page>:
    800019f0:	00425797          	auipc	a5,0x425
    800019f4:	84878793          	add	a5,a5,-1976 # 80426238 <freelist>
    800019f8:	0007b503          	ld	a0,0(a5)
    800019fc:	00050663          	beqz	a0,80001a08 <alloc_page+0x18>
    80001a00:	00053703          	ld	a4,0(a0)
    80001a04:	00e7b023          	sd	a4,0(a5)
    80001a08:	00008067          	ret

0000000080001a0c <free_page>:
    80001a0c:	02050c63          	beqz	a0,80001a44 <free_page+0x38>
    80001a10:	00425797          	auipc	a5,0x425
    80001a14:	8207b783          	ld	a5,-2016(a5) # 80426230 <mem_start>
    80001a18:	02f56663          	bltu	a0,a5,80001a44 <free_page+0x38>
    80001a1c:	00425797          	auipc	a5,0x425
    80001a20:	80c7b783          	ld	a5,-2036(a5) # 80426228 <mem_end>
    80001a24:	02f57063          	bgeu	a0,a5,80001a44 <free_page+0x38>
    80001a28:	03451793          	sll	a5,a0,0x34
    80001a2c:	00079c63          	bnez	a5,80001a44 <free_page+0x38>
    80001a30:	00425797          	auipc	a5,0x425
    80001a34:	80878793          	add	a5,a5,-2040 # 80426238 <freelist>
    80001a38:	0007b703          	ld	a4,0(a5)
    80001a3c:	00a7b023          	sd	a0,0(a5)
    80001a40:	00e53023          	sd	a4,0(a0)
    80001a44:	00008067          	ret

0000000080001a48 <alloc_pages>:
    80001a48:	00050613          	mv	a2,a0
    80001a4c:	08a05863          	blez	a0,80001adc <alloc_pages+0x94>
    80001a50:	00424317          	auipc	t1,0x424
    80001a54:	7e830313          	add	t1,t1,2024 # 80426238 <freelist>
    80001a58:	00100793          	li	a5,1
    80001a5c:	00033803          	ld	a6,0(t1)
    80001a60:	06f50463          	beq	a0,a5,80001ac8 <alloc_pages+0x80>
    80001a64:	06080c63          	beqz	a6,80001adc <alloc_pages+0x94>
    80001a68:	00083503          	ld	a0,0(a6)
    80001a6c:	00080793          	mv	a5,a6
    80001a70:	00100713          	li	a4,1
    80001a74:	00000893          	li	a7,0
    80001a78:	000015b7          	lui	a1,0x1
    80001a7c:	0200006f          	j	80001a9c <alloc_pages+0x54>
    80001a80:	02d50463          	beq	a0,a3,80001aa8 <alloc_pages+0x60>
    80001a84:	00053683          	ld	a3,0(a0)
    80001a88:	00078893          	mv	a7,a5
    80001a8c:	00050813          	mv	a6,a0
    80001a90:	00100713          	li	a4,1
    80001a94:	00050793          	mv	a5,a0
    80001a98:	00068513          	mv	a0,a3
    80001a9c:	00b786b3          	add	a3,a5,a1
    80001aa0:	fe0510e3          	bnez	a0,80001a80 <alloc_pages+0x38>
    80001aa4:	00008067          	ret
    80001aa8:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80001aac:	00053683          	ld	a3,0(a0)
    80001ab0:	fee612e3          	bne	a2,a4,80001a94 <alloc_pages+0x4c>
    80001ab4:	02088863          	beqz	a7,80001ae4 <alloc_pages+0x9c>
    80001ab8:	00d8b023          	sd	a3,0(a7)
    80001abc:	00053023          	sd	zero,0(a0)
    80001ac0:	00080513          	mv	a0,a6
    80001ac4:	00008067          	ret
    80001ac8:	00080663          	beqz	a6,80001ad4 <alloc_pages+0x8c>
    80001acc:	00083783          	ld	a5,0(a6)
    80001ad0:	00f33023          	sd	a5,0(t1)
    80001ad4:	00080513          	mv	a0,a6
    80001ad8:	00008067          	ret
    80001adc:	00000513          	li	a0,0
    80001ae0:	00008067          	ret
    80001ae4:	00053023          	sd	zero,0(a0)
    80001ae8:	00d33023          	sd	a3,0(t1)
    80001aec:	00080513          	mv	a0,a6
    80001af0:	00008067          	ret

0000000080001af4 <walk_lookup>:
    80001af4:	01e5d793          	srl	a5,a1,0x1e
    80001af8:	1ff7f793          	and	a5,a5,511
    80001afc:	00379793          	sll	a5,a5,0x3
    80001b00:	00f50533          	add	a0,a0,a5
    80001b04:	00053703          	ld	a4,0(a0)
    80001b08:	00177793          	and	a5,a4,1
    80001b0c:	04078a63          	beqz	a5,80001b60 <walk_lookup+0x6c>
    80001b10:	00e77793          	and	a5,a4,14
    80001b14:	04079663          	bnez	a5,80001b60 <walk_lookup+0x6c>
    80001b18:	0155d793          	srl	a5,a1,0x15
    80001b1c:	00a75713          	srl	a4,a4,0xa
    80001b20:	1ff7f793          	and	a5,a5,511
    80001b24:	00c71713          	sll	a4,a4,0xc
    80001b28:	00379793          	sll	a5,a5,0x3
    80001b2c:	00e787b3          	add	a5,a5,a4
    80001b30:	0007b503          	ld	a0,0(a5)
    80001b34:	00157793          	and	a5,a0,1
    80001b38:	02078463          	beqz	a5,80001b60 <walk_lookup+0x6c>
    80001b3c:	00e57793          	and	a5,a0,14
    80001b40:	02079063          	bnez	a5,80001b60 <walk_lookup+0x6c>
    80001b44:	00c5d593          	srl	a1,a1,0xc
    80001b48:	00a55513          	srl	a0,a0,0xa
    80001b4c:	1ff5f593          	and	a1,a1,511
    80001b50:	00359593          	sll	a1,a1,0x3
    80001b54:	00c51513          	sll	a0,a0,0xc
    80001b58:	00b50533          	add	a0,a0,a1
    80001b5c:	00008067          	ret
    80001b60:	00000513          	li	a0,0
    80001b64:	00008067          	ret

0000000080001b68 <free_swap_slot.part.0>:
    80001b68:	0055579b          	srlw	a5,a0,0x5
    80001b6c:	0000f617          	auipc	a2,0xf
    80001b70:	49460613          	add	a2,a2,1172 # 80011000 <swap_mgr>
    80001b74:	00279793          	sll	a5,a5,0x2
    80001b78:	00f607b3          	add	a5,a2,a5
    80001b7c:	0007a583          	lw	a1,0(a5)
    80001b80:	00100713          	li	a4,1
    80001b84:	00a7173b          	sllw	a4,a4,a0
    80001b88:	00e5f6b3          	and	a3,a1,a4
    80001b8c:	0006869b          	sext.w	a3,a3
    80001b90:	02068463          	beqz	a3,80001bb8 <free_swap_slot.part.0+0x50>
    80001b94:	08862683          	lw	a3,136(a2)
    80001b98:	fff74713          	not	a4,a4
    80001b9c:	08062803          	lw	a6,128(a2)
    80001ba0:	00e5f5b3          	and	a1,a1,a4
    80001ba4:	fff6871b          	addw	a4,a3,-1
    80001ba8:	00b7a023          	sw	a1,0(a5)
    80001bac:	08e62423          	sw	a4,136(a2)
    80001bb0:	01057463          	bgeu	a0,a6,80001bb8 <free_swap_slot.part.0+0x50>
    80001bb4:	08a62023          	sw	a0,128(a2)
    80001bb8:	00008067          	ret

0000000080001bbc <create_pagetable>:
    80001bbc:	ff010113          	add	sp,sp,-16
    80001bc0:	00113423          	sd	ra,8(sp)
    80001bc4:	e2dff0ef          	jal	800019f0 <alloc_page>
    80001bc8:	00050e63          	beqz	a0,80001be4 <create_pagetable+0x28>
    80001bcc:	00001737          	lui	a4,0x1
    80001bd0:	00050793          	mv	a5,a0
    80001bd4:	00e50733          	add	a4,a0,a4
    80001bd8:	0007b023          	sd	zero,0(a5)
    80001bdc:	00878793          	add	a5,a5,8
    80001be0:	fee79ce3          	bne	a5,a4,80001bd8 <create_pagetable+0x1c>
    80001be4:	00813083          	ld	ra,8(sp)
    80001be8:	01010113          	add	sp,sp,16
    80001bec:	00008067          	ret

0000000080001bf0 <map_page>:
    80001bf0:	00c5e7b3          	or	a5,a1,a2
    80001bf4:	03479713          	sll	a4,a5,0x34
    80001bf8:	20071863          	bnez	a4,80001e08 <map_page+0x218>
    80001bfc:	fc010113          	add	sp,sp,-64
    80001c00:	02913423          	sd	s1,40(sp)
    80001c04:	03213023          	sd	s2,32(sp)
    80001c08:	01313c23          	sd	s3,24(sp)
    80001c0c:	01413823          	sd	s4,16(sp)
    80001c10:	01513423          	sd	s5,8(sp)
    80001c14:	01613023          	sd	s6,0(sp)
    80001c18:	02113c23          	sd	ra,56(sp)
    80001c1c:	02813823          	sd	s0,48(sp)
    80001c20:	00058493          	mv	s1,a1
    80001c24:	00060913          	mv	s2,a2
    80001c28:	00050a13          	mv	s4,a0
    80001c2c:	00068993          	mv	s3,a3
    80001c30:	00050813          	mv	a6,a0
    80001c34:	00200a93          	li	s5,2
    80001c38:	00200793          	li	a5,2
    80001c3c:	00100b13          	li	s6,1
    80001c40:	0037941b          	sllw	s0,a5,0x3
    80001c44:	00f4043b          	addw	s0,s0,a5
    80001c48:	00c4041b          	addw	s0,s0,12
    80001c4c:	0084d433          	srl	s0,s1,s0
    80001c50:	1ff47413          	and	s0,s0,511
    80001c54:	00341413          	sll	s0,s0,0x3
    80001c58:	00880433          	add	s0,a6,s0
    80001c5c:	00043783          	ld	a5,0(s0)
    80001c60:	0017f713          	and	a4,a5,1
    80001c64:	14070e63          	beqz	a4,80001dc0 <map_page+0x1d0>
    80001c68:	00e7f713          	and	a4,a5,14
    80001c6c:	18071a63          	bnez	a4,80001e00 <map_page+0x210>
    80001c70:	00a7d793          	srl	a5,a5,0xa
    80001c74:	00c79813          	sll	a6,a5,0xc
    80001c78:	00100793          	li	a5,1
    80001c7c:	016a8663          	beq	s5,s6,80001c88 <map_page+0x98>
    80001c80:	00100a93          	li	s5,1
    80001c84:	fbdff06f          	j	80001c40 <map_page+0x50>
    80001c88:	00c4d793          	srl	a5,s1,0xc
    80001c8c:	1ff7f793          	and	a5,a5,511
    80001c90:	00379793          	sll	a5,a5,0x3
    80001c94:	00f80833          	add	a6,a6,a5
    80001c98:	16080463          	beqz	a6,80001e00 <map_page+0x210>
    80001c9c:	00083783          	ld	a5,0(a6)
    80001ca0:	0017f793          	and	a5,a5,1
    80001ca4:	14079e63          	bnez	a5,80001e00 <map_page+0x210>
    80001ca8:	00c95793          	srl	a5,s2,0xc
    80001cac:	00a79793          	sll	a5,a5,0xa
    80001cb0:	00412597          	auipc	a1,0x412
    80001cb4:	3e058593          	add	a1,a1,992 # 80414090 <lru_mgr+0x3000>
    80001cb8:	0145a703          	lw	a4,20(a1)
    80001cbc:	0137e7b3          	or	a5,a5,s3
    80001cc0:	0017e793          	or	a5,a5,1
    80001cc4:	00f83023          	sd	a5,0(a6)
    80001cc8:	0c070663          	beqz	a4,80001d94 <map_page+0x1a4>
    80001ccc:	0040f717          	auipc	a4,0x40f
    80001cd0:	3e870713          	add	a4,a4,1000 # 804110b4 <lru_mgr+0x24>
    80001cd4:	00000793          	li	a5,0
    80001cd8:	10000693          	li	a3,256
    80001cdc:	00c0006f          	j	80001ce8 <map_page+0xf8>
    80001ce0:	0017879b          	addw	a5,a5,1
    80001ce4:	0ad78863          	beq	a5,a3,80001d94 <map_page+0x1a4>
    80001ce8:	00072803          	lw	a6,0(a4)
    80001cec:	03070713          	add	a4,a4,48
    80001cf0:	fe0818e3          	bnez	a6,80001ce0 <map_page+0xf0>
    80001cf4:	00178813          	add	a6,a5,1
    80001cf8:	00181513          	sll	a0,a6,0x1
    80001cfc:	00179713          	sll	a4,a5,0x1
    80001d00:	01050533          	add	a0,a0,a6
    80001d04:	0040f617          	auipc	a2,0x40f
    80001d08:	38c60613          	add	a2,a2,908 # 80411090 <lru_mgr>
    80001d0c:	00f706b3          	add	a3,a4,a5
    80001d10:	00451513          	sll	a0,a0,0x4
    80001d14:	00469693          	sll	a3,a3,0x4
    80001d18:	00a60533          	add	a0,a2,a0
    80001d1c:	fffff337          	lui	t1,0xfffff
    80001d20:	00d608b3          	add	a7,a2,a3
    80001d24:	0064f4b3          	and	s1,s1,t1
    80001d28:	01453423          	sd	s4,8(a0)
    80001d2c:	fff00513          	li	a0,-1
    80001d30:	01068693          	add	a3,a3,16
    80001d34:	0098b823          	sd	s1,16(a7)
    80001d38:	0128bc23          	sd	s2,24(a7)
    80001d3c:	02a8a023          	sw	a0,32(a7)
    80001d40:	0049f993          	and	s3,s3,4
    80001d44:	00d606b3          	add	a3,a2,a3
    80001d48:	00098463          	beqz	s3,80001d50 <map_page+0x160>
    80001d4c:	00500a93          	li	s5,5
    80001d50:	00181513          	sll	a0,a6,0x1
    80001d54:	00f707b3          	add	a5,a4,a5
    80001d58:	00063883          	ld	a7,0(a2)
    80001d5c:	01050733          	add	a4,a0,a6
    80001d60:	00479793          	sll	a5,a5,0x4
    80001d64:	00471713          	sll	a4,a4,0x4
    80001d68:	00f607b3          	add	a5,a2,a5
    80001d6c:	00e60733          	add	a4,a2,a4
    80001d70:	0357a223          	sw	s5,36(a5)
    80001d74:	01173023          	sd	a7,0(a4)
    80001d78:	0207b423          	sd	zero,40(a5)
    80001d7c:	06088e63          	beqz	a7,80001df8 <map_page+0x208>
    80001d80:	00d8bc23          	sd	a3,24(a7)
    80001d84:	0105a783          	lw	a5,16(a1)
    80001d88:	00d63023          	sd	a3,0(a2)
    80001d8c:	0017879b          	addw	a5,a5,1
    80001d90:	00f5a823          	sw	a5,16(a1)
    80001d94:	00000513          	li	a0,0
    80001d98:	03813083          	ld	ra,56(sp)
    80001d9c:	03013403          	ld	s0,48(sp)
    80001da0:	02813483          	ld	s1,40(sp)
    80001da4:	02013903          	ld	s2,32(sp)
    80001da8:	01813983          	ld	s3,24(sp)
    80001dac:	01013a03          	ld	s4,16(sp)
    80001db0:	00813a83          	ld	s5,8(sp)
    80001db4:	00013b03          	ld	s6,0(sp)
    80001db8:	04010113          	add	sp,sp,64
    80001dbc:	00008067          	ret
    80001dc0:	c31ff0ef          	jal	800019f0 <alloc_page>
    80001dc4:	00050813          	mv	a6,a0
    80001dc8:	02050c63          	beqz	a0,80001e00 <map_page+0x210>
    80001dcc:	00001737          	lui	a4,0x1
    80001dd0:	00e50733          	add	a4,a0,a4
    80001dd4:	00050793          	mv	a5,a0
    80001dd8:	0007b023          	sd	zero,0(a5)
    80001ddc:	00878793          	add	a5,a5,8
    80001de0:	fee79ce3          	bne	a5,a4,80001dd8 <map_page+0x1e8>
    80001de4:	00c85793          	srl	a5,a6,0xc
    80001de8:	00a79793          	sll	a5,a5,0xa
    80001dec:	0017e793          	or	a5,a5,1
    80001df0:	00f43023          	sd	a5,0(s0)
    80001df4:	e85ff06f          	j	80001c78 <map_page+0x88>
    80001df8:	00d63423          	sd	a3,8(a2)
    80001dfc:	f89ff06f          	j	80001d84 <map_page+0x194>
    80001e00:	fff00513          	li	a0,-1
    80001e04:	f95ff06f          	j	80001d98 <map_page+0x1a8>
    80001e08:	fff00513          	li	a0,-1
    80001e0c:	00008067          	ret

0000000080001e10 <map_region>:
    80001e10:	000017b7          	lui	a5,0x1
    80001e14:	fc010113          	add	sp,sp,-64
    80001e18:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001e1c:	02913423          	sd	s1,40(sp)
    80001e20:	00f684b3          	add	s1,a3,a5
    80001e24:	00b484b3          	add	s1,s1,a1
    80001e28:	fffff7b7          	lui	a5,0xfffff
    80001e2c:	02113c23          	sd	ra,56(sp)
    80001e30:	02813823          	sd	s0,48(sp)
    80001e34:	03213023          	sd	s2,32(sp)
    80001e38:	01313c23          	sd	s3,24(sp)
    80001e3c:	01413823          	sd	s4,16(sp)
    80001e40:	01513423          	sd	s5,8(sp)
    80001e44:	00f4f4b3          	and	s1,s1,a5
    80001e48:	0495f263          	bgeu	a1,s1,80001e8c <map_region+0x7c>
    80001e4c:	00058413          	mv	s0,a1
    80001e50:	00050993          	mv	s3,a0
    80001e54:	00070a13          	mv	s4,a4
    80001e58:	40b60933          	sub	s2,a2,a1
    80001e5c:	00001ab7          	lui	s5,0x1
    80001e60:	0080006f          	j	80001e68 <map_region+0x58>
    80001e64:	02947463          	bgeu	s0,s1,80001e8c <map_region+0x7c>
    80001e68:	00890633          	add	a2,s2,s0
    80001e6c:	00040593          	mv	a1,s0
    80001e70:	000a0693          	mv	a3,s4
    80001e74:	00098513          	mv	a0,s3
    80001e78:	d79ff0ef          	jal	80001bf0 <map_page>
    80001e7c:	01540433          	add	s0,s0,s5
    80001e80:	fe0502e3          	beqz	a0,80001e64 <map_region+0x54>
    80001e84:	fff00513          	li	a0,-1
    80001e88:	0080006f          	j	80001e90 <map_region+0x80>
    80001e8c:	00000513          	li	a0,0
    80001e90:	03813083          	ld	ra,56(sp)
    80001e94:	03013403          	ld	s0,48(sp)
    80001e98:	02813483          	ld	s1,40(sp)
    80001e9c:	02013903          	ld	s2,32(sp)
    80001ea0:	01813983          	ld	s3,24(sp)
    80001ea4:	01013a03          	ld	s4,16(sp)
    80001ea8:	00813a83          	ld	s5,8(sp)
    80001eac:	04010113          	add	sp,sp,64
    80001eb0:	00008067          	ret

0000000080001eb4 <destroy_pagetable>:
    80001eb4:	f0010113          	add	sp,sp,-256
    80001eb8:	000017b7          	lui	a5,0x1
    80001ebc:	0e813823          	sd	s0,240(sp)
    80001ec0:	0f213023          	sd	s2,224(sp)
    80001ec4:	0d613023          	sd	s6,192(sp)
    80001ec8:	0b713c23          	sd	s7,184(sp)
    80001ecc:	0e113c23          	sd	ra,248(sp)
    80001ed0:	0e913423          	sd	s1,232(sp)
    80001ed4:	0d313c23          	sd	s3,216(sp)
    80001ed8:	0d413823          	sd	s4,208(sp)
    80001edc:	0d513423          	sd	s5,200(sp)
    80001ee0:	0b813823          	sd	s8,176(sp)
    80001ee4:	0b913423          	sd	s9,168(sp)
    80001ee8:	0ba13023          	sd	s10,160(sp)
    80001eec:	09b13c23          	sd	s11,152(sp)
    80001ef0:	00050413          	mv	s0,a0
    80001ef4:	00050913          	mv	s2,a0
    80001ef8:	00f50b33          	add	s6,a0,a5
    80001efc:	00001bb7          	lui	s7,0x1
    80001f00:	00c0006f          	j	80001f0c <destroy_pagetable+0x58>
    80001f04:	00890913          	add	s2,s2,8
    80001f08:	2d690063          	beq	s2,s6,800021c8 <destroy_pagetable+0x314>
    80001f0c:	00093783          	ld	a5,0(s2)
    80001f10:	00100713          	li	a4,1
    80001f14:	00f7f693          	and	a3,a5,15
    80001f18:	fee696e3          	bne	a3,a4,80001f04 <destroy_pagetable+0x50>
    80001f1c:	00a7d793          	srl	a5,a5,0xa
    80001f20:	00c79a13          	sll	s4,a5,0xc
    80001f24:	017a0cb3          	add	s9,s4,s7
    80001f28:	00100d93          	li	s11,1
    80001f2c:	000a0a93          	mv	s5,s4
    80001f30:	00040493          	mv	s1,s0
    80001f34:	00c0006f          	j	80001f40 <destroy_pagetable+0x8c>
    80001f38:	008a0a13          	add	s4,s4,8
    80001f3c:	279a0c63          	beq	s4,s9,800021b4 <destroy_pagetable+0x300>
    80001f40:	000a3783          	ld	a5,0(s4)
    80001f44:	00f7f713          	and	a4,a5,15
    80001f48:	ffb718e3          	bne	a4,s11,80001f38 <destroy_pagetable+0x84>
    80001f4c:	00a7d793          	srl	a5,a5,0xa
    80001f50:	00c79993          	sll	s3,a5,0xc
    80001f54:	00098c13          	mv	s8,s3
    80001f58:	01798d33          	add	s10,s3,s7
    80001f5c:	00098413          	mv	s0,s3
    80001f60:	00c0006f          	j	80001f6c <destroy_pagetable+0xb8>
    80001f64:	00840413          	add	s0,s0,8
    80001f68:	23a40e63          	beq	s0,s10,800021a4 <destroy_pagetable+0x2f0>
    80001f6c:	00043783          	ld	a5,0(s0)
    80001f70:	00f7f713          	and	a4,a5,15
    80001f74:	ffb718e3          	bne	a4,s11,80001f64 <destroy_pagetable+0xb0>
    80001f78:	00a7d793          	srl	a5,a5,0xa
    80001f7c:	00c79793          	sll	a5,a5,0xc
    80001f80:	00048713          	mv	a4,s1
    80001f84:	03513c23          	sd	s5,56(sp)
    80001f88:	00090493          	mv	s1,s2
    80001f8c:	017789b3          	add	s3,a5,s7
    80001f90:	02813823          	sd	s0,48(sp)
    80001f94:	00078a93          	mv	s5,a5
    80001f98:	00070913          	mv	s2,a4
    80001f9c:	00c0006f          	j	80001fa8 <destroy_pagetable+0xf4>
    80001fa0:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80001fa4:	1cf98e63          	beq	s3,a5,80002180 <destroy_pagetable+0x2cc>
    80001fa8:	0007b703          	ld	a4,0(a5)
    80001fac:	00f77693          	and	a3,a4,15
    80001fb0:	ffb698e3          	bne	a3,s11,80001fa0 <destroy_pagetable+0xec>
    80001fb4:	00a75713          	srl	a4,a4,0xa
    80001fb8:	00c71713          	sll	a4,a4,0xc
    80001fbc:	017706b3          	add	a3,a4,s7
    80001fc0:	05313423          	sd	s3,72(sp)
    80001fc4:	00d13423          	sd	a3,8(sp)
    80001fc8:	05813023          	sd	s8,64(sp)
    80001fcc:	00070993          	mv	s3,a4
    80001fd0:	04f13823          	sd	a5,80(sp)
    80001fd4:	0100006f          	j	80001fe4 <destroy_pagetable+0x130>
    80001fd8:	00813783          	ld	a5,8(sp)
    80001fdc:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    80001fe0:	16e78e63          	beq	a5,a4,8000215c <destroy_pagetable+0x2a8>
    80001fe4:	00073783          	ld	a5,0(a4)
    80001fe8:	00f7f693          	and	a3,a5,15
    80001fec:	ffb696e3          	bne	a3,s11,80001fd8 <destroy_pagetable+0x124>
    80001ff0:	00a7d793          	srl	a5,a5,0xa
    80001ff4:	00c79793          	sll	a5,a5,0xc
    80001ff8:	017786b3          	add	a3,a5,s7
    80001ffc:	000a8c13          	mv	s8,s5
    80002000:	00d13c23          	sd	a3,24(sp)
    80002004:	00078a93          	mv	s5,a5
    80002008:	04e13c23          	sd	a4,88(sp)
    8000200c:	07213023          	sd	s2,96(sp)
    80002010:	0100006f          	j	80002020 <destroy_pagetable+0x16c>
    80002014:	01813703          	ld	a4,24(sp)
    80002018:	00878793          	add	a5,a5,8
    8000201c:	10f70c63          	beq	a4,a5,80002134 <destroy_pagetable+0x280>
    80002020:	0007b703          	ld	a4,0(a5)
    80002024:	00f77693          	and	a3,a4,15
    80002028:	ffb696e3          	bne	a3,s11,80002014 <destroy_pagetable+0x160>
    8000202c:	00a75713          	srl	a4,a4,0xa
    80002030:	00c71913          	sll	s2,a4,0xc
    80002034:	01790733          	add	a4,s2,s7
    80002038:	07213423          	sd	s2,104(sp)
    8000203c:	00090413          	mv	s0,s2
    80002040:	02e13023          	sd	a4,32(sp)
    80002044:	06f13823          	sd	a5,112(sp)
    80002048:	00048913          	mv	s2,s1
    8000204c:	0100006f          	j	8000205c <destroy_pagetable+0x1a8>
    80002050:	02013783          	ld	a5,32(sp)
    80002054:	00840413          	add	s0,s0,8
    80002058:	0a878c63          	beq	a5,s0,80002110 <destroy_pagetable+0x25c>
    8000205c:	00043783          	ld	a5,0(s0)
    80002060:	00f7f693          	and	a3,a5,15
    80002064:	ffb696e3          	bne	a3,s11,80002050 <destroy_pagetable+0x19c>
    80002068:	00a7d793          	srl	a5,a5,0xa
    8000206c:	00c79493          	sll	s1,a5,0xc
    80002070:	017487b3          	add	a5,s1,s7
    80002074:	00913823          	sd	s1,16(sp)
    80002078:	02f13423          	sd	a5,40(sp)
    8000207c:	06813c23          	sd	s0,120(sp)
    80002080:	0100006f          	j	80002090 <destroy_pagetable+0x1dc>
    80002084:	02813783          	ld	a5,40(sp)
    80002088:	00848493          	add	s1,s1,8
    8000208c:	06978663          	beq	a5,s1,800020f8 <destroy_pagetable+0x244>
    80002090:	0004b783          	ld	a5,0(s1)
    80002094:	00f7f693          	and	a3,a5,15
    80002098:	ffb696e3          	bne	a3,s11,80002084 <destroy_pagetable+0x1d0>
    8000209c:	00a7d793          	srl	a5,a5,0xa
    800020a0:	00c79413          	sll	s0,a5,0xc
    800020a4:	017406b3          	add	a3,s0,s7
    800020a8:	09213023          	sd	s2,128(sp)
    800020ac:	09613423          	sd	s6,136(sp)
    800020b0:	00040913          	mv	s2,s0
    800020b4:	000a0b13          	mv	s6,s4
    800020b8:	00048a13          	mv	s4,s1
    800020bc:	00068493          	mv	s1,a3
    800020c0:	00043783          	ld	a5,0(s0)
    800020c4:	00840413          	add	s0,s0,8
    800020c8:	00f7f713          	and	a4,a5,15
    800020cc:	13b70e63          	beq	a4,s11,80002208 <destroy_pagetable+0x354>
    800020d0:	fe8498e3          	bne	s1,s0,800020c0 <destroy_pagetable+0x20c>
    800020d4:	00090513          	mv	a0,s2
    800020d8:	000a0493          	mv	s1,s4
    800020dc:	08013903          	ld	s2,128(sp)
    800020e0:	000b0a13          	mv	s4,s6
    800020e4:	08813b03          	ld	s6,136(sp)
    800020e8:	925ff0ef          	jal	80001a0c <free_page>
    800020ec:	02813783          	ld	a5,40(sp)
    800020f0:	00848493          	add	s1,s1,8
    800020f4:	f8979ee3          	bne	a5,s1,80002090 <destroy_pagetable+0x1dc>
    800020f8:	01013503          	ld	a0,16(sp)
    800020fc:	07813403          	ld	s0,120(sp)
    80002100:	90dff0ef          	jal	80001a0c <free_page>
    80002104:	02013783          	ld	a5,32(sp)
    80002108:	00840413          	add	s0,s0,8
    8000210c:	f48798e3          	bne	a5,s0,8000205c <destroy_pagetable+0x1a8>
    80002110:	07013783          	ld	a5,112(sp)
    80002114:	06813503          	ld	a0,104(sp)
    80002118:	00090493          	mv	s1,s2
    8000211c:	00f13823          	sd	a5,16(sp)
    80002120:	8edff0ef          	jal	80001a0c <free_page>
    80002124:	01013783          	ld	a5,16(sp)
    80002128:	01813703          	ld	a4,24(sp)
    8000212c:	00878793          	add	a5,a5,8
    80002130:	eef718e3          	bne	a4,a5,80002020 <destroy_pagetable+0x16c>
    80002134:	05813703          	ld	a4,88(sp)
    80002138:	000a8513          	mv	a0,s5
    8000213c:	06013903          	ld	s2,96(sp)
    80002140:	00e13823          	sd	a4,16(sp)
    80002144:	8c9ff0ef          	jal	80001a0c <free_page>
    80002148:	01013703          	ld	a4,16(sp)
    8000214c:	00813783          	ld	a5,8(sp)
    80002150:	000c0a93          	mv	s5,s8
    80002154:	00870713          	add	a4,a4,8
    80002158:	e8e796e3          	bne	a5,a4,80001fe4 <destroy_pagetable+0x130>
    8000215c:	05013783          	ld	a5,80(sp)
    80002160:	00098513          	mv	a0,s3
    80002164:	04013c03          	ld	s8,64(sp)
    80002168:	00f13423          	sd	a5,8(sp)
    8000216c:	04813983          	ld	s3,72(sp)
    80002170:	89dff0ef          	jal	80001a0c <free_page>
    80002174:	00813783          	ld	a5,8(sp)
    80002178:	00878793          	add	a5,a5,8
    8000217c:	e2f996e3          	bne	s3,a5,80001fa8 <destroy_pagetable+0xf4>
    80002180:	03013403          	ld	s0,48(sp)
    80002184:	00090793          	mv	a5,s2
    80002188:	000a8513          	mv	a0,s5
    8000218c:	00840413          	add	s0,s0,8
    80002190:	03813a83          	ld	s5,56(sp)
    80002194:	00048913          	mv	s2,s1
    80002198:	00078493          	mv	s1,a5
    8000219c:	871ff0ef          	jal	80001a0c <free_page>
    800021a0:	dda416e3          	bne	s0,s10,80001f6c <destroy_pagetable+0xb8>
    800021a4:	000c0513          	mv	a0,s8
    800021a8:	008a0a13          	add	s4,s4,8
    800021ac:	861ff0ef          	jal	80001a0c <free_page>
    800021b0:	d99a18e3          	bne	s4,s9,80001f40 <destroy_pagetable+0x8c>
    800021b4:	000a8513          	mv	a0,s5
    800021b8:	00890913          	add	s2,s2,8
    800021bc:	00048413          	mv	s0,s1
    800021c0:	84dff0ef          	jal	80001a0c <free_page>
    800021c4:	d56914e3          	bne	s2,s6,80001f0c <destroy_pagetable+0x58>
    800021c8:	00040513          	mv	a0,s0
    800021cc:	0f013403          	ld	s0,240(sp)
    800021d0:	0f813083          	ld	ra,248(sp)
    800021d4:	0e813483          	ld	s1,232(sp)
    800021d8:	0e013903          	ld	s2,224(sp)
    800021dc:	0d813983          	ld	s3,216(sp)
    800021e0:	0d013a03          	ld	s4,208(sp)
    800021e4:	0c813a83          	ld	s5,200(sp)
    800021e8:	0c013b03          	ld	s6,192(sp)
    800021ec:	0b813b83          	ld	s7,184(sp)
    800021f0:	0b013c03          	ld	s8,176(sp)
    800021f4:	0a813c83          	ld	s9,168(sp)
    800021f8:	0a013d03          	ld	s10,160(sp)
    800021fc:	09813d83          	ld	s11,152(sp)
    80002200:	10010113          	add	sp,sp,256
    80002204:	809ff06f          	j	80001a0c <free_page>
    80002208:	00a7d793          	srl	a5,a5,0xa
    8000220c:	00c79513          	sll	a0,a5,0xc
    80002210:	ca5ff0ef          	jal	80001eb4 <destroy_pagetable>
    80002214:	ea8496e3          	bne	s1,s0,800020c0 <destroy_pagetable+0x20c>
    80002218:	ebdff06f          	j	800020d4 <destroy_pagetable+0x220>

000000008000221c <kvminithart>:
    8000221c:	00424797          	auipc	a5,0x424
    80002220:	0247b783          	ld	a5,36(a5) # 80426240 <kernel_pagetable>
    80002224:	fff00713          	li	a4,-1
    80002228:	03f71713          	sll	a4,a4,0x3f
    8000222c:	00c7d793          	srl	a5,a5,0xc
    80002230:	00e7e7b3          	or	a5,a5,a4
    80002234:	18079073          	csrw	satp,a5
    80002238:	12000073          	sfence.vma
    8000223c:	00008067          	ret

0000000080002240 <dump_pagetable>:
    80002240:	fb010113          	add	sp,sp,-80
    80002244:	03213823          	sd	s2,48(sp)
    80002248:	03313423          	sd	s3,40(sp)
    8000224c:	04113423          	sd	ra,72(sp)
    80002250:	04813023          	sd	s0,64(sp)
    80002254:	02913c23          	sd	s1,56(sp)
    80002258:	03413023          	sd	s4,32(sp)
    8000225c:	01513c23          	sd	s5,24(sp)
    80002260:	01613823          	sd	s6,16(sp)
    80002264:	01713423          	sd	s7,8(sp)
    80002268:	00058993          	mv	s3,a1
    8000226c:	00050913          	mv	s2,a0
    80002270:	28b05263          	blez	a1,800024f4 <dump_pagetable+0x2b4>
    80002274:	00000413          	li	s0,0
    80002278:	0014041b          	addw	s0,s0,1
    8000227c:	02000513          	li	a0,32
    80002280:	eacff0ef          	jal	8000192c <uart_putc>
    80002284:	fe899ae3          	bne	s3,s0,80002278 <dump_pagetable+0x38>
    80002288:	00005517          	auipc	a0,0x5
    8000228c:	80050513          	add	a0,a0,-2048 # 80006a88 <digits+0x18>
    80002290:	eb4ff0ef          	jal	80001944 <uart_puts>
    80002294:	00900793          	li	a5,9
    80002298:	2737d463          	bge	a5,s3,80002500 <dump_pagetable+0x2c0>
    8000229c:	00a00413          	li	s0,10
    800022a0:	0289c53b          	divw	a0,s3,s0
    800022a4:	0305051b          	addw	a0,a0,48
    800022a8:	0ff57513          	zext.b	a0,a0
    800022ac:	e80ff0ef          	jal	8000192c <uart_putc>
    800022b0:	0289e53b          	remw	a0,s3,s0
    800022b4:	0305051b          	addw	a0,a0,48
    800022b8:	0ff57513          	zext.b	a0,a0
    800022bc:	e70ff0ef          	jal	8000192c <uart_putc>
    800022c0:	00004517          	auipc	a0,0x4
    800022c4:	7e050513          	add	a0,a0,2016 # 80006aa0 <digits+0x30>
    800022c8:	fff00b13          	li	s6,-1
    800022cc:	e78ff0ef          	jal	80001944 <uart_puts>
    800022d0:	00000493          	li	s1,0
    800022d4:	00cb5b13          	srl	s6,s6,0xc
    800022d8:	00900a13          	li	s4,9
    800022dc:	ffc00a93          	li	s5,-4
    800022e0:	0140006f          	j	800022f4 <dump_pagetable+0xb4>
    800022e4:	0014849b          	addw	s1,s1,1
    800022e8:	20000793          	li	a5,512
    800022ec:	00890913          	add	s2,s2,8
    800022f0:	0cf48063          	beq	s1,a5,800023b0 <dump_pagetable+0x170>
    800022f4:	00093783          	ld	a5,0(s2)
    800022f8:	0017f793          	and	a5,a5,1
    800022fc:	fe0784e3          	beqz	a5,800022e4 <dump_pagetable+0xa4>
    80002300:	00000413          	li	s0,0
    80002304:	0009ca63          	bltz	s3,80002318 <dump_pagetable+0xd8>
    80002308:	0014041b          	addw	s0,s0,1
    8000230c:	02000513          	li	a0,32
    80002310:	e1cff0ef          	jal	8000192c <uart_putc>
    80002314:	fe89dae3          	bge	s3,s0,80002308 <dump_pagetable+0xc8>
    80002318:	00004517          	auipc	a0,0x4
    8000231c:	79050513          	add	a0,a0,1936 # 80006aa8 <digits+0x38>
    80002320:	e24ff0ef          	jal	80001944 <uart_puts>
    80002324:	06300793          	li	a5,99
    80002328:	1697d263          	bge	a5,s1,8000248c <dump_pagetable+0x24c>
    8000232c:	06400413          	li	s0,100
    80002330:	0284c53b          	divw	a0,s1,s0
    80002334:	00a00b93          	li	s7,10
    80002338:	0305051b          	addw	a0,a0,48
    8000233c:	0ff57513          	zext.b	a0,a0
    80002340:	decff0ef          	jal	8000192c <uart_putc>
    80002344:	0284e53b          	remw	a0,s1,s0
    80002348:	0375453b          	divw	a0,a0,s7
    8000234c:	0305051b          	addw	a0,a0,48
    80002350:	0ff57513          	zext.b	a0,a0
    80002354:	dd8ff0ef          	jal	8000192c <uart_putc>
    80002358:	0374e53b          	remw	a0,s1,s7
    8000235c:	0305051b          	addw	a0,a0,48
    80002360:	0ff57513          	zext.b	a0,a0
    80002364:	dc8ff0ef          	jal	8000192c <uart_putc>
    80002368:	00004517          	auipc	a0,0x4
    8000236c:	74850513          	add	a0,a0,1864 # 80006ab0 <digits+0x40>
    80002370:	dd4ff0ef          	jal	80001944 <uart_puts>
    80002374:	00093b83          	ld	s7,0(s2)
    80002378:	00ebf793          	and	a5,s7,14
    8000237c:	06079063          	bnez	a5,800023dc <dump_pagetable+0x19c>
    80002380:	00004517          	auipc	a0,0x4
    80002384:	74850513          	add	a0,a0,1864 # 80006ac8 <digits+0x58>
    80002388:	dbcff0ef          	jal	80001944 <uart_puts>
    8000238c:	00093503          	ld	a0,0(s2)
    80002390:	0019859b          	addw	a1,s3,1
    80002394:	0014849b          	addw	s1,s1,1
    80002398:	00a55513          	srl	a0,a0,0xa
    8000239c:	00c51513          	sll	a0,a0,0xc
    800023a0:	ea1ff0ef          	jal	80002240 <dump_pagetable>
    800023a4:	20000793          	li	a5,512
    800023a8:	00890913          	add	s2,s2,8
    800023ac:	f4f494e3          	bne	s1,a5,800022f4 <dump_pagetable+0xb4>
    800023b0:	04813083          	ld	ra,72(sp)
    800023b4:	04013403          	ld	s0,64(sp)
    800023b8:	03813483          	ld	s1,56(sp)
    800023bc:	03013903          	ld	s2,48(sp)
    800023c0:	02813983          	ld	s3,40(sp)
    800023c4:	02013a03          	ld	s4,32(sp)
    800023c8:	01813a83          	ld	s5,24(sp)
    800023cc:	01013b03          	ld	s6,16(sp)
    800023d0:	00813b83          	ld	s7,8(sp)
    800023d4:	05010113          	add	sp,sp,80
    800023d8:	00008067          	ret
    800023dc:	00004517          	auipc	a0,0x4
    800023e0:	6dc50513          	add	a0,a0,1756 # 80006ab8 <digits+0x48>
    800023e4:	d60ff0ef          	jal	80001944 <uart_puts>
    800023e8:	00abdb93          	srl	s7,s7,0xa
    800023ec:	016bfbb3          	and	s7,s7,s6
    800023f0:	00000713          	li	a4,0
    800023f4:	03c00413          	li	s0,60
    800023f8:	008bd7b3          	srl	a5,s7,s0
    800023fc:	00f7f793          	and	a5,a5,15
    80002400:	00e7e733          	or	a4,a5,a4
    80002404:	00071e63          	bnez	a4,80002420 <dump_pagetable+0x1e0>
    80002408:	02040c63          	beqz	s0,80002440 <dump_pagetable+0x200>
    8000240c:	ffc4041b          	addw	s0,s0,-4
    80002410:	008bd7b3          	srl	a5,s7,s0
    80002414:	00f7f793          	and	a5,a5,15
    80002418:	00e7e733          	or	a4,a5,a4
    8000241c:	fe0706e3          	beqz	a4,80002408 <dump_pagetable+0x1c8>
    80002420:	ffc4041b          	addw	s0,s0,-4
    80002424:	03778513          	add	a0,a5,55
    80002428:	0ff7f713          	zext.b	a4,a5
    8000242c:	04fa5c63          	bge	s4,a5,80002484 <dump_pagetable+0x244>
    80002430:	cfcff0ef          	jal	8000192c <uart_putc>
    80002434:	01540a63          	beq	s0,s5,80002448 <dump_pagetable+0x208>
    80002438:	00100713          	li	a4,1
    8000243c:	fbdff06f          	j	800023f8 <dump_pagetable+0x1b8>
    80002440:	03000513          	li	a0,48
    80002444:	ce8ff0ef          	jal	8000192c <uart_putc>
    80002448:	00004517          	auipc	a0,0x4
    8000244c:	67850513          	add	a0,a0,1656 # 80006ac0 <digits+0x50>
    80002450:	cf4ff0ef          	jal	80001944 <uart_puts>
    80002454:	00093783          	ld	a5,0(s2)
    80002458:	0027f713          	and	a4,a5,2
    8000245c:	08071463          	bnez	a4,800024e4 <dump_pagetable+0x2a4>
    80002460:	0047f713          	and	a4,a5,4
    80002464:	06071863          	bnez	a4,800024d4 <dump_pagetable+0x294>
    80002468:	0087f713          	and	a4,a5,8
    8000246c:	04071c63          	bnez	a4,800024c4 <dump_pagetable+0x284>
    80002470:	0107f793          	and	a5,a5,16
    80002474:	04079263          	bnez	a5,800024b8 <dump_pagetable+0x278>
    80002478:	00a00513          	li	a0,10
    8000247c:	cb0ff0ef          	jal	8000192c <uart_putc>
    80002480:	e65ff06f          	j	800022e4 <dump_pagetable+0xa4>
    80002484:	03070513          	add	a0,a4,48
    80002488:	fa9ff06f          	j	80002430 <dump_pagetable+0x1f0>
    8000248c:	089a5263          	bge	s4,s1,80002510 <dump_pagetable+0x2d0>
    80002490:	00a00413          	li	s0,10
    80002494:	0284c53b          	divw	a0,s1,s0
    80002498:	0305051b          	addw	a0,a0,48
    8000249c:	0ff57513          	zext.b	a0,a0
    800024a0:	c8cff0ef          	jal	8000192c <uart_putc>
    800024a4:	0284e53b          	remw	a0,s1,s0
    800024a8:	0305051b          	addw	a0,a0,48
    800024ac:	0ff57513          	zext.b	a0,a0
    800024b0:	c7cff0ef          	jal	8000192c <uart_putc>
    800024b4:	eb5ff06f          	j	80002368 <dump_pagetable+0x128>
    800024b8:	05500513          	li	a0,85
    800024bc:	c70ff0ef          	jal	8000192c <uart_putc>
    800024c0:	fb9ff06f          	j	80002478 <dump_pagetable+0x238>
    800024c4:	05800513          	li	a0,88
    800024c8:	c64ff0ef          	jal	8000192c <uart_putc>
    800024cc:	00093783          	ld	a5,0(s2)
    800024d0:	fa1ff06f          	j	80002470 <dump_pagetable+0x230>
    800024d4:	05700513          	li	a0,87
    800024d8:	c54ff0ef          	jal	8000192c <uart_putc>
    800024dc:	00093783          	ld	a5,0(s2)
    800024e0:	f89ff06f          	j	80002468 <dump_pagetable+0x228>
    800024e4:	05200513          	li	a0,82
    800024e8:	c44ff0ef          	jal	8000192c <uart_putc>
    800024ec:	00093783          	ld	a5,0(s2)
    800024f0:	f71ff06f          	j	80002460 <dump_pagetable+0x220>
    800024f4:	00004517          	auipc	a0,0x4
    800024f8:	59450513          	add	a0,a0,1428 # 80006a88 <digits+0x18>
    800024fc:	c48ff0ef          	jal	80001944 <uart_puts>
    80002500:	0309851b          	addw	a0,s3,48
    80002504:	0ff57513          	zext.b	a0,a0
    80002508:	c24ff0ef          	jal	8000192c <uart_putc>
    8000250c:	db5ff06f          	j	800022c0 <dump_pagetable+0x80>
    80002510:	0304851b          	addw	a0,s1,48
    80002514:	0ff57513          	zext.b	a0,a0
    80002518:	c14ff0ef          	jal	8000192c <uart_putc>
    8000251c:	e4dff06f          	j	80002368 <dump_pagetable+0x128>

0000000080002520 <init_page_replacement>:
    80002520:	00100713          	li	a4,1
    80002524:	02a71713          	sll	a4,a4,0x2a
    80002528:	0000f797          	auipc	a5,0xf
    8000252c:	ad878793          	add	a5,a5,-1320 # 80011000 <swap_mgr>
    80002530:	08e7b023          	sd	a4,128(a5)
    80002534:	0000f717          	auipc	a4,0xf
    80002538:	b4072a23          	sw	zero,-1196(a4) # 80011088 <swap_mgr+0x88>
    8000253c:	0000f717          	auipc	a4,0xf
    80002540:	b4470713          	add	a4,a4,-1212 # 80011080 <swap_mgr+0x80>
    80002544:	0007a023          	sw	zero,0(a5)
    80002548:	00478793          	add	a5,a5,4
    8000254c:	fee79ce3          	bne	a5,a4,80002544 <init_page_replacement+0x24>
    80002550:	0040f797          	auipc	a5,0x40f
    80002554:	b407b023          	sd	zero,-1216(a5) # 80411090 <lru_mgr>
    80002558:	0040f797          	auipc	a5,0x40f
    8000255c:	b407b023          	sd	zero,-1216(a5) # 80411098 <lru_mgr+0x8>
    80002560:	00100793          	li	a5,1
    80002564:	02879793          	sll	a5,a5,0x28
    80002568:	00412717          	auipc	a4,0x412
    8000256c:	b2f73c23          	sd	a5,-1224(a4) # 804140a0 <lru_mgr+0x3010>
    80002570:	fff00713          	li	a4,-1
    80002574:	0040f797          	auipc	a5,0x40f
    80002578:	b2c78793          	add	a5,a5,-1236 # 804110a0 <lru_mgr+0x10>
    8000257c:	00412697          	auipc	a3,0x412
    80002580:	b2468693          	add	a3,a3,-1244 # 804140a0 <lru_mgr+0x3010>
    80002584:	02075713          	srl	a4,a4,0x20
    80002588:	0007b023          	sd	zero,0(a5)
    8000258c:	0007b423          	sd	zero,8(a5)
    80002590:	00e7b823          	sd	a4,16(a5)
    80002594:	0007bc23          	sd	zero,24(a5)
    80002598:	0207b023          	sd	zero,32(a5)
    8000259c:	0207b423          	sd	zero,40(a5)
    800025a0:	03078793          	add	a5,a5,48
    800025a4:	fed792e3          	bne	a5,a3,80002588 <init_page_replacement+0x68>
    800025a8:	00008067          	ret

00000000800025ac <kvminit>:
    800025ac:	fd010113          	add	sp,sp,-48
    800025b0:	02113423          	sd	ra,40(sp)
    800025b4:	02813023          	sd	s0,32(sp)
    800025b8:	00913c23          	sd	s1,24(sp)
    800025bc:	01213823          	sd	s2,16(sp)
    800025c0:	01313423          	sd	s3,8(sp)
    800025c4:	01413023          	sd	s4,0(sp)
    800025c8:	f59ff0ef          	jal	80002520 <init_page_replacement>
    800025cc:	c24ff0ef          	jal	800019f0 <alloc_page>
    800025d0:	00001737          	lui	a4,0x1
    800025d4:	00e50733          	add	a4,a0,a4
    800025d8:	00050413          	mv	s0,a0
    800025dc:	00050793          	mv	a5,a0
    800025e0:	1a050663          	beqz	a0,8000278c <kvminit+0x1e0>
    800025e4:	0007b023          	sd	zero,0(a5)
    800025e8:	00878793          	add	a5,a5,8
    800025ec:	fef71ce3          	bne	a4,a5,800025e4 <kvminit+0x38>
    800025f0:	00424917          	auipc	s2,0x424
    800025f4:	c5090913          	add	s2,s2,-944 # 80426240 <kernel_pagetable>
    800025f8:	00003997          	auipc	s3,0x3
    800025fc:	48b98993          	add	s3,s3,1163 # 80005a83 <rodata_start+0xa83>
    80002600:	fffff7b7          	lui	a5,0xfffff
    80002604:	00893023          	sd	s0,0(s2)
    80002608:	ffffe497          	auipc	s1,0xffffe
    8000260c:	9f848493          	add	s1,s1,-1544 # 80000000 <_entry>
    80002610:	00f9f9b3          	and	s3,s3,a5
    80002614:	0334f863          	bgeu	s1,s3,80002644 <kvminit+0x98>
    80002618:	00001a37          	lui	s4,0x1
    8000261c:	0080006f          	j	80002624 <kvminit+0x78>
    80002620:	0334f063          	bgeu	s1,s3,80002640 <kvminit+0x94>
    80002624:	00048613          	mv	a2,s1
    80002628:	00048593          	mv	a1,s1
    8000262c:	00a00693          	li	a3,10
    80002630:	00040513          	mv	a0,s0
    80002634:	dbcff0ef          	jal	80001bf0 <map_page>
    80002638:	014484b3          	add	s1,s1,s4
    8000263c:	fe0502e3          	beqz	a0,80002620 <kvminit+0x74>
    80002640:	00093403          	ld	s0,0(s2)
    80002644:	00006997          	auipc	s3,0x6
    80002648:	fdb98993          	add	s3,s3,-37 # 8000861f <data_end+0x61b>
    8000264c:	fffff7b7          	lui	a5,0xfffff
    80002650:	00003497          	auipc	s1,0x3
    80002654:	9b048493          	add	s1,s1,-1616 # 80005000 <rodata_start>
    80002658:	00f9f9b3          	and	s3,s3,a5
    8000265c:	0334f863          	bgeu	s1,s3,8000268c <kvminit+0xe0>
    80002660:	00001a37          	lui	s4,0x1
    80002664:	0080006f          	j	8000266c <kvminit+0xc0>
    80002668:	0334f063          	bgeu	s1,s3,80002688 <kvminit+0xdc>
    8000266c:	00048613          	mv	a2,s1
    80002670:	00048593          	mv	a1,s1
    80002674:	00200693          	li	a3,2
    80002678:	00040513          	mv	a0,s0
    8000267c:	d74ff0ef          	jal	80001bf0 <map_page>
    80002680:	014484b3          	add	s1,s1,s4
    80002684:	fe0502e3          	beqz	a0,80002668 <kvminit+0xbc>
    80002688:	00093403          	ld	s0,0(s2)
    8000268c:	00007997          	auipc	s3,0x7
    80002690:	97798993          	add	s3,s3,-1673 # 80009003 <data_end+0xfff>
    80002694:	fffff7b7          	lui	a5,0xfffff
    80002698:	00006497          	auipc	s1,0x6
    8000269c:	96848493          	add	s1,s1,-1688 # 80008000 <nextpid>
    800026a0:	00f9f9b3          	and	s3,s3,a5
    800026a4:	0334f863          	bgeu	s1,s3,800026d4 <kvminit+0x128>
    800026a8:	00001a37          	lui	s4,0x1
    800026ac:	0080006f          	j	800026b4 <kvminit+0x108>
    800026b0:	0334f063          	bgeu	s1,s3,800026d0 <kvminit+0x124>
    800026b4:	00048613          	mv	a2,s1
    800026b8:	00048593          	mv	a1,s1
    800026bc:	00600693          	li	a3,6
    800026c0:	00040513          	mv	a0,s0
    800026c4:	d2cff0ef          	jal	80001bf0 <map_page>
    800026c8:	014484b3          	add	s1,s1,s4
    800026cc:	fe0502e3          	beqz	a0,800026b0 <kvminit+0x104>
    800026d0:	00093403          	ld	s0,0(s2)
    800026d4:	00425997          	auipc	s3,0x425
    800026d8:	b9b98993          	add	s3,s3,-1125 # 8042726f <bss_end+0xfff>
    800026dc:	fffff7b7          	lui	a5,0xfffff
    800026e0:	0000e497          	auipc	s1,0xe
    800026e4:	92048493          	add	s1,s1,-1760 # 80010000 <bss_start>
    800026e8:	00f9f9b3          	and	s3,s3,a5
    800026ec:	0334f863          	bgeu	s1,s3,8000271c <kvminit+0x170>
    800026f0:	00001a37          	lui	s4,0x1
    800026f4:	0080006f          	j	800026fc <kvminit+0x150>
    800026f8:	0334f063          	bgeu	s1,s3,80002718 <kvminit+0x16c>
    800026fc:	00048613          	mv	a2,s1
    80002700:	00048593          	mv	a1,s1
    80002704:	00600693          	li	a3,6
    80002708:	00040513          	mv	a0,s0
    8000270c:	ce4ff0ef          	jal	80001bf0 <map_page>
    80002710:	014484b3          	add	s1,s1,s4
    80002714:	fe0502e3          	beqz	a0,800026f8 <kvminit+0x14c>
    80002718:	00093403          	ld	s0,0(s2)
    8000271c:	01100993          	li	s3,17
    80002720:	00424497          	auipc	s1,0x424
    80002724:	b5048493          	add	s1,s1,-1200 # 80426270 <bss_end>
    80002728:	01b99993          	sll	s3,s3,0x1b
    8000272c:	0334f863          	bgeu	s1,s3,8000275c <kvminit+0x1b0>
    80002730:	00001a37          	lui	s4,0x1
    80002734:	0080006f          	j	8000273c <kvminit+0x190>
    80002738:	0334f063          	bgeu	s1,s3,80002758 <kvminit+0x1ac>
    8000273c:	00048613          	mv	a2,s1
    80002740:	00048593          	mv	a1,s1
    80002744:	00600693          	li	a3,6
    80002748:	00040513          	mv	a0,s0
    8000274c:	ca4ff0ef          	jal	80001bf0 <map_page>
    80002750:	014484b3          	add	s1,s1,s4
    80002754:	fe0502e3          	beqz	a0,80002738 <kvminit+0x18c>
    80002758:	00093403          	ld	s0,0(s2)
    8000275c:	00040513          	mv	a0,s0
    80002760:	02013403          	ld	s0,32(sp)
    80002764:	02813083          	ld	ra,40(sp)
    80002768:	01813483          	ld	s1,24(sp)
    8000276c:	01013903          	ld	s2,16(sp)
    80002770:	00813983          	ld	s3,8(sp)
    80002774:	00013a03          	ld	s4,0(sp)
    80002778:	00600693          	li	a3,6
    8000277c:	10000637          	lui	a2,0x10000
    80002780:	100005b7          	lui	a1,0x10000
    80002784:	03010113          	add	sp,sp,48
    80002788:	c68ff06f          	j	80001bf0 <map_page>
    8000278c:	02813083          	ld	ra,40(sp)
    80002790:	02013403          	ld	s0,32(sp)
    80002794:	00424797          	auipc	a5,0x424
    80002798:	aa07b623          	sd	zero,-1364(a5) # 80426240 <kernel_pagetable>
    8000279c:	01813483          	ld	s1,24(sp)
    800027a0:	01013903          	ld	s2,16(sp)
    800027a4:	00813983          	ld	s3,8(sp)
    800027a8:	00013a03          	ld	s4,0(sp)
    800027ac:	03010113          	add	sp,sp,48
    800027b0:	00008067          	ret

00000000800027b4 <alloc_swap_slot>:
    800027b4:	0000f617          	auipc	a2,0xf
    800027b8:	84c60613          	add	a2,a2,-1972 # 80011000 <swap_mgr>
    800027bc:	08862803          	lw	a6,136(a2)
    800027c0:	08462883          	lw	a7,132(a2)
    800027c4:	fff00513          	li	a0,-1
    800027c8:	0d187663          	bgeu	a6,a7,80002894 <alloc_swap_slot+0xe0>
    800027cc:	08062303          	lw	t1,128(a2)
    800027d0:	07137863          	bgeu	t1,a7,80002840 <alloc_swap_slot+0x8c>
    800027d4:	0053579b          	srlw	a5,t1,0x5
    800027d8:	00279793          	sll	a5,a5,0x2
    800027dc:	00f607b3          	add	a5,a2,a5
    800027e0:	0007a683          	lw	a3,0(a5)
    800027e4:	00100593          	li	a1,1
    800027e8:	006595bb          	sllw	a1,a1,t1
    800027ec:	00b6f7b3          	and	a5,a3,a1
    800027f0:	0007879b          	sext.w	a5,a5
    800027f4:	0053571b          	srlw	a4,t1,0x5
    800027f8:	00030513          	mv	a0,t1
    800027fc:	08078e63          	beqz	a5,80002898 <alloc_swap_slot+0xe4>
    80002800:	00100e13          	li	t3,1
    80002804:	01c0006f          	j	80002820 <alloc_swap_slot+0x6c>
    80002808:	0006a683          	lw	a3,0(a3)
    8000280c:	0007859b          	sext.w	a1,a5
    80002810:	0057571b          	srlw	a4,a4,0x5
    80002814:	00f6f7b3          	and	a5,a3,a5
    80002818:	0007879b          	sext.w	a5,a5
    8000281c:	06078e63          	beqz	a5,80002898 <alloc_swap_slot+0xe4>
    80002820:	0015071b          	addw	a4,a0,1
    80002824:	0057579b          	srlw	a5,a4,0x5
    80002828:	00279793          	sll	a5,a5,0x2
    8000282c:	0007051b          	sext.w	a0,a4
    80002830:	00f606b3          	add	a3,a2,a5
    80002834:	00ee17bb          	sllw	a5,t3,a4
    80002838:	fca898e3          	bne	a7,a0,80002808 <alloc_swap_slot+0x54>
    8000283c:	04030a63          	beqz	t1,80002890 <alloc_swap_slot+0xdc>
    80002840:	00062683          	lw	a3,0(a2)
    80002844:	0016f513          	and	a0,a3,1
    80002848:	0a050063          	beqz	a0,800028e8 <alloc_swap_slot+0x134>
    8000284c:	00000513          	li	a0,0
    80002850:	00100e13          	li	t3,1
    80002854:	01c0006f          	j	80002870 <alloc_swap_slot+0xbc>
    80002858:	0006a683          	lw	a3,0(a3)
    8000285c:	00078e9b          	sext.w	t4,a5
    80002860:	0057571b          	srlw	a4,a4,0x5
    80002864:	00f6f7b3          	and	a5,a3,a5
    80002868:	0007879b          	sext.w	a5,a5
    8000286c:	04078a63          	beqz	a5,800028c0 <alloc_swap_slot+0x10c>
    80002870:	0015071b          	addw	a4,a0,1
    80002874:	0057579b          	srlw	a5,a4,0x5
    80002878:	00279793          	sll	a5,a5,0x2
    8000287c:	0005059b          	sext.w	a1,a0
    80002880:	0007051b          	sext.w	a0,a4
    80002884:	00f606b3          	add	a3,a2,a5
    80002888:	00ee17bb          	sllw	a5,t3,a4
    8000288c:	fca316e3          	bne	t1,a0,80002858 <alloc_swap_slot+0xa4>
    80002890:	fff00513          	li	a0,-1
    80002894:	00008067          	ret
    80002898:	0015079b          	addw	a5,a0,1
    8000289c:	0317f7bb          	remuw	a5,a5,a7
    800028a0:	00271713          	sll	a4,a4,0x2
    800028a4:	00e60733          	add	a4,a2,a4
    800028a8:	00b6e6b3          	or	a3,a3,a1
    800028ac:	0018081b          	addw	a6,a6,1
    800028b0:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    800028b4:	09062423          	sw	a6,136(a2)
    800028b8:	08f62023          	sw	a5,128(a2)
    800028bc:	00008067          	ret
    800028c0:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    800028c4:	0315f5bb          	remuw	a1,a1,a7
    800028c8:	00271713          	sll	a4,a4,0x2
    800028cc:	00e60733          	add	a4,a2,a4
    800028d0:	01d6e6b3          	or	a3,a3,t4
    800028d4:	0018081b          	addw	a6,a6,1
    800028d8:	00d72023          	sw	a3,0(a4)
    800028dc:	09062423          	sw	a6,136(a2)
    800028e0:	08b62023          	sw	a1,128(a2)
    800028e4:	00008067          	ret
    800028e8:	00000713          	li	a4,0
    800028ec:	00100593          	li	a1,1
    800028f0:	00100e93          	li	t4,1
    800028f4:	fd1ff06f          	j	800028c4 <alloc_swap_slot+0x110>

00000000800028f8 <free_swap_slot>:
    800028f8:	0000e717          	auipc	a4,0xe
    800028fc:	70870713          	add	a4,a4,1800 # 80011000 <swap_mgr>
    80002900:	08472783          	lw	a5,132(a4)
    80002904:	04f57663          	bgeu	a0,a5,80002950 <free_swap_slot+0x58>
    80002908:	0055579b          	srlw	a5,a0,0x5
    8000290c:	00279793          	sll	a5,a5,0x2
    80002910:	00f707b3          	add	a5,a4,a5
    80002914:	0007a583          	lw	a1,0(a5)
    80002918:	00100693          	li	a3,1
    8000291c:	00a696bb          	sllw	a3,a3,a0
    80002920:	00d5f633          	and	a2,a1,a3
    80002924:	0006061b          	sext.w	a2,a2
    80002928:	02060463          	beqz	a2,80002950 <free_swap_slot+0x58>
    8000292c:	08872603          	lw	a2,136(a4)
    80002930:	fff6c693          	not	a3,a3
    80002934:	08072803          	lw	a6,128(a4)
    80002938:	00d5f5b3          	and	a1,a1,a3
    8000293c:	fff6069b          	addw	a3,a2,-1
    80002940:	00b7a023          	sw	a1,0(a5)
    80002944:	08d72423          	sw	a3,136(a4)
    80002948:	01057463          	bgeu	a0,a6,80002950 <free_swap_slot+0x58>
    8000294c:	08a72023          	sw	a0,128(a4)
    80002950:	00008067          	ret

0000000080002954 <find_page_desc>:
    80002954:	fffff7b7          	lui	a5,0xfffff
    80002958:	00f57533          	and	a0,a0,a5
    8000295c:	00000713          	li	a4,0
    80002960:	0040e797          	auipc	a5,0x40e
    80002964:	74078793          	add	a5,a5,1856 # 804110a0 <lru_mgr+0x10>
    80002968:	10000613          	li	a2,256
    8000296c:	0100006f          	j	8000297c <find_page_desc+0x28>
    80002970:	0017071b          	addw	a4,a4,1
    80002974:	03078793          	add	a5,a5,48
    80002978:	02c70a63          	beq	a4,a2,800029ac <find_page_desc+0x58>
    8000297c:	0007b683          	ld	a3,0(a5)
    80002980:	fea698e3          	bne	a3,a0,80002970 <find_page_desc+0x1c>
    80002984:	0147a683          	lw	a3,20(a5)
    80002988:	0016f693          	and	a3,a3,1
    8000298c:	fe0682e3          	beqz	a3,80002970 <find_page_desc+0x1c>
    80002990:	00171513          	sll	a0,a4,0x1
    80002994:	00e50533          	add	a0,a0,a4
    80002998:	0040e797          	auipc	a5,0x40e
    8000299c:	70878793          	add	a5,a5,1800 # 804110a0 <lru_mgr+0x10>
    800029a0:	00451513          	sll	a0,a0,0x4
    800029a4:	00f50533          	add	a0,a0,a5
    800029a8:	00008067          	ret
    800029ac:	00000513          	li	a0,0
    800029b0:	00008067          	ret

00000000800029b4 <lru_add_page>:
    800029b4:	02050c63          	beqz	a0,800029ec <lru_add_page+0x38>
    800029b8:	0040e717          	auipc	a4,0x40e
    800029bc:	6d870713          	add	a4,a4,1752 # 80411090 <lru_mgr>
    800029c0:	00073783          	ld	a5,0(a4)
    800029c4:	00053c23          	sd	zero,24(a0)
    800029c8:	02f53023          	sd	a5,32(a0)
    800029cc:	02078263          	beqz	a5,800029f0 <lru_add_page+0x3c>
    800029d0:	00a7bc23          	sd	a0,24(a5)
    800029d4:	00411697          	auipc	a3,0x411
    800029d8:	6bc68693          	add	a3,a3,1724 # 80414090 <lru_mgr+0x3000>
    800029dc:	0106a783          	lw	a5,16(a3)
    800029e0:	00a73023          	sd	a0,0(a4)
    800029e4:	0017879b          	addw	a5,a5,1
    800029e8:	00f6a823          	sw	a5,16(a3)
    800029ec:	00008067          	ret
    800029f0:	00a73423          	sd	a0,8(a4)
    800029f4:	fe1ff06f          	j	800029d4 <lru_add_page+0x20>

00000000800029f8 <lru_remove_page>:
    800029f8:	02050c63          	beqz	a0,80002a30 <lru_remove_page+0x38>
    800029fc:	01853783          	ld	a5,24(a0)
    80002a00:	02053703          	ld	a4,32(a0)
    80002a04:	02078863          	beqz	a5,80002a34 <lru_remove_page+0x3c>
    80002a08:	02e7b023          	sd	a4,32(a5)
    80002a0c:	02070a63          	beqz	a4,80002a40 <lru_remove_page+0x48>
    80002a10:	00f73c23          	sd	a5,24(a4)
    80002a14:	00411717          	auipc	a4,0x411
    80002a18:	67c70713          	add	a4,a4,1660 # 80414090 <lru_mgr+0x3000>
    80002a1c:	01072783          	lw	a5,16(a4)
    80002a20:	02053023          	sd	zero,32(a0)
    80002a24:	00053c23          	sd	zero,24(a0)
    80002a28:	fff7879b          	addw	a5,a5,-1
    80002a2c:	00f72823          	sw	a5,16(a4)
    80002a30:	00008067          	ret
    80002a34:	0040e697          	auipc	a3,0x40e
    80002a38:	64e6be23          	sd	a4,1628(a3) # 80411090 <lru_mgr>
    80002a3c:	fc071ae3          	bnez	a4,80002a10 <lru_remove_page+0x18>
    80002a40:	0040e717          	auipc	a4,0x40e
    80002a44:	64f73c23          	sd	a5,1624(a4) # 80411098 <lru_mgr+0x8>
    80002a48:	fcdff06f          	j	80002a14 <lru_remove_page+0x1c>

0000000080002a4c <lru_touch_page>:
    80002a4c:	fffff7b7          	lui	a5,0xfffff
    80002a50:	00f57533          	and	a0,a0,a5
    80002a54:	00000713          	li	a4,0
    80002a58:	0040e797          	auipc	a5,0x40e
    80002a5c:	64878793          	add	a5,a5,1608 # 804110a0 <lru_mgr+0x10>
    80002a60:	10000613          	li	a2,256
    80002a64:	0100006f          	j	80002a74 <lru_touch_page+0x28>
    80002a68:	0017071b          	addw	a4,a4,1
    80002a6c:	03078793          	add	a5,a5,48
    80002a70:	0ac70663          	beq	a4,a2,80002b1c <lru_touch_page+0xd0>
    80002a74:	0007b683          	ld	a3,0(a5)
    80002a78:	fea698e3          	bne	a3,a0,80002a68 <lru_touch_page+0x1c>
    80002a7c:	0147a683          	lw	a3,20(a5)
    80002a80:	0016f693          	and	a3,a3,1
    80002a84:	fe0682e3          	beqz	a3,80002a68 <lru_touch_page+0x1c>
    80002a88:	00171613          	sll	a2,a4,0x1
    80002a8c:	00e607b3          	add	a5,a2,a4
    80002a90:	0040e597          	auipc	a1,0x40e
    80002a94:	60058593          	add	a1,a1,1536 # 80411090 <lru_mgr>
    80002a98:	00479793          	sll	a5,a5,0x4
    80002a9c:	00170513          	add	a0,a4,1
    80002aa0:	00f58833          	add	a6,a1,a5
    80002aa4:	00151693          	sll	a3,a0,0x1
    80002aa8:	00a686b3          	add	a3,a3,a0
    80002aac:	02883803          	ld	a6,40(a6)
    80002ab0:	00469693          	sll	a3,a3,0x4
    80002ab4:	01078793          	add	a5,a5,16
    80002ab8:	00d586b3          	add	a3,a1,a3
    80002abc:	0006b683          	ld	a3,0(a3)
    80002ac0:	00f587b3          	add	a5,a1,a5
    80002ac4:	04080e63          	beqz	a6,80002b20 <lru_touch_page+0xd4>
    80002ac8:	02d83023          	sd	a3,32(a6)
    80002acc:	0005b883          	ld	a7,0(a1)
    80002ad0:	04068c63          	beqz	a3,80002b28 <lru_touch_page+0xdc>
    80002ad4:	0106bc23          	sd	a6,24(a3)
    80002ad8:	00151693          	sll	a3,a0,0x1
    80002adc:	00e60733          	add	a4,a2,a4
    80002ae0:	00a686b3          	add	a3,a3,a0
    80002ae4:	00469693          	sll	a3,a3,0x4
    80002ae8:	00471713          	sll	a4,a4,0x4
    80002aec:	00e58733          	add	a4,a1,a4
    80002af0:	00d586b3          	add	a3,a1,a3
    80002af4:	00411617          	auipc	a2,0x411
    80002af8:	59c60613          	add	a2,a2,1436 # 80414090 <lru_mgr+0x3000>
    80002afc:	02073423          	sd	zero,40(a4)
    80002b00:	0116b023          	sd	a7,0(a3)
    80002b04:	01062703          	lw	a4,16(a2)
    80002b08:	02088463          	beqz	a7,80002b30 <lru_touch_page+0xe4>
    80002b0c:	00f8bc23          	sd	a5,24(a7)
    80002b10:	00f5b023          	sd	a5,0(a1)
    80002b14:	00e62823          	sw	a4,16(a2)
    80002b18:	00008067          	ret
    80002b1c:	00008067          	ret
    80002b20:	00068893          	mv	a7,a3
    80002b24:	fa0698e3          	bnez	a3,80002ad4 <lru_touch_page+0x88>
    80002b28:	0105b423          	sd	a6,8(a1)
    80002b2c:	fadff06f          	j	80002ad8 <lru_touch_page+0x8c>
    80002b30:	00f5b423          	sd	a5,8(a1)
    80002b34:	00f5b023          	sd	a5,0(a1)
    80002b38:	00e62823          	sw	a4,16(a2)
    80002b3c:	00008067          	ret

0000000080002b40 <find_victim_page>:
    80002b40:	0040e517          	auipc	a0,0x40e
    80002b44:	55853503          	ld	a0,1368(a0) # 80411098 <lru_mgr+0x8>
    80002b48:	00008067          	ret

0000000080002b4c <swap_out_page>:
    80002b4c:	16050263          	beqz	a0,80002cb0 <swap_out_page+0x164>
    80002b50:	fd010113          	add	sp,sp,-48
    80002b54:	00913c23          	sd	s1,24(sp)
    80002b58:	01452483          	lw	s1,20(a0)
    80002b5c:	02813023          	sd	s0,32(sp)
    80002b60:	01313423          	sd	s3,8(sp)
    80002b64:	02113423          	sd	ra,40(sp)
    80002b68:	01213823          	sd	s2,16(sp)
    80002b6c:	0014f793          	and	a5,s1,1
    80002b70:	00050413          	mv	s0,a0
    80002b74:	00048993          	mv	s3,s1
    80002b78:	12078863          	beqz	a5,80002ca8 <swap_out_page+0x15c>
    80002b7c:	c39ff0ef          	jal	800027b4 <alloc_swap_slot>
    80002b80:	0005091b          	sext.w	s2,a0
    80002b84:	fff00793          	li	a5,-1
    80002b88:	12f90063          	beq	s2,a5,80002ca8 <swap_out_page+0x15c>
    80002b8c:	0049f993          	and	s3,s3,4
    80002b90:	04098663          	beqz	s3,80002bdc <swap_out_page+0x90>
    80002b94:	00843683          	ld	a3,8(s0)
    80002b98:	00c9171b          	sllw	a4,s2,0xc
    80002b9c:	0000e797          	auipc	a5,0xe
    80002ba0:	4f478793          	add	a5,a5,1268 # 80011090 <swap_area>
    80002ba4:	02071713          	sll	a4,a4,0x20
    80002ba8:	02075713          	srl	a4,a4,0x20
    80002bac:	40f686b3          	sub	a3,a3,a5
    80002bb0:	0000f617          	auipc	a2,0xf
    80002bb4:	4e060613          	add	a2,a2,1248 # 80012090 <swap_area+0x1000>
    80002bb8:	00f707b3          	add	a5,a4,a5
    80002bbc:	00e60633          	add	a2,a2,a4
    80002bc0:	40e686b3          	sub	a3,a3,a4
    80002bc4:	00f68733          	add	a4,a3,a5
    80002bc8:	00074703          	lbu	a4,0(a4)
    80002bcc:	00178793          	add	a5,a5,1
    80002bd0:	fee78fa3          	sb	a4,-1(a5)
    80002bd4:	fec798e3          	bne	a5,a2,80002bc4 <swap_out_page+0x78>
    80002bd8:	01442483          	lw	s1,20(s0)
    80002bdc:	00043583          	ld	a1,0(s0)
    80002be0:	02843503          	ld	a0,40(s0)
    80002be4:	f11fe0ef          	jal	80001af4 <walk_lookup>
    80002be8:	00050863          	beqz	a0,80002bf8 <swap_out_page+0xac>
    80002bec:	00053783          	ld	a5,0(a0)
    80002bf0:	0017f713          	and	a4,a5,1
    80002bf4:	08071063          	bnez	a4,80002c74 <swap_out_page+0x128>
    80002bf8:	ffe4f793          	and	a5,s1,-2
    80002bfc:	0027e793          	or	a5,a5,2
    80002c00:	02091913          	sll	s2,s2,0x20
    80002c04:	02079793          	sll	a5,a5,0x20
    80002c08:	00843503          	ld	a0,8(s0)
    80002c0c:	02095913          	srl	s2,s2,0x20
    80002c10:	00f96933          	or	s2,s2,a5
    80002c14:	01243823          	sd	s2,16(s0)
    80002c18:	df5fe0ef          	jal	80001a0c <free_page>
    80002c1c:	01843783          	ld	a5,24(s0)
    80002c20:	00043423          	sd	zero,8(s0)
    80002c24:	02043703          	ld	a4,32(s0)
    80002c28:	06078463          	beqz	a5,80002c90 <swap_out_page+0x144>
    80002c2c:	02e7b023          	sd	a4,32(a5)
    80002c30:	06070663          	beqz	a4,80002c9c <swap_out_page+0x150>
    80002c34:	00f73c23          	sd	a5,24(a4)
    80002c38:	00411717          	auipc	a4,0x411
    80002c3c:	45870713          	add	a4,a4,1112 # 80414090 <lru_mgr+0x3000>
    80002c40:	01072783          	lw	a5,16(a4)
    80002c44:	02043023          	sd	zero,32(s0)
    80002c48:	00043c23          	sd	zero,24(s0)
    80002c4c:	fff7879b          	addw	a5,a5,-1
    80002c50:	00f72823          	sw	a5,16(a4)
    80002c54:	00000513          	li	a0,0
    80002c58:	02813083          	ld	ra,40(sp)
    80002c5c:	02013403          	ld	s0,32(sp)
    80002c60:	01813483          	ld	s1,24(sp)
    80002c64:	01013903          	ld	s2,16(sp)
    80002c68:	00813983          	ld	s3,8(sp)
    80002c6c:	03010113          	add	sp,sp,48
    80002c70:	00008067          	ret
    80002c74:	00a9171b          	sllw	a4,s2,0xa
    80002c78:	02071713          	sll	a4,a4,0x20
    80002c7c:	ffe7f793          	and	a5,a5,-2
    80002c80:	02075713          	srl	a4,a4,0x20
    80002c84:	00e7e7b3          	or	a5,a5,a4
    80002c88:	00f53023          	sd	a5,0(a0)
    80002c8c:	f6dff06f          	j	80002bf8 <swap_out_page+0xac>
    80002c90:	0040e697          	auipc	a3,0x40e
    80002c94:	40e6b023          	sd	a4,1024(a3) # 80411090 <lru_mgr>
    80002c98:	f8071ee3          	bnez	a4,80002c34 <swap_out_page+0xe8>
    80002c9c:	0040e717          	auipc	a4,0x40e
    80002ca0:	3ef73e23          	sd	a5,1020(a4) # 80411098 <lru_mgr+0x8>
    80002ca4:	f95ff06f          	j	80002c38 <swap_out_page+0xec>
    80002ca8:	fff00513          	li	a0,-1
    80002cac:	fadff06f          	j	80002c58 <swap_out_page+0x10c>
    80002cb0:	fff00513          	li	a0,-1
    80002cb4:	00008067          	ret

0000000080002cb8 <swap_in_page>:
    80002cb8:	12050263          	beqz	a0,80002ddc <swap_in_page+0x124>
    80002cbc:	01452783          	lw	a5,20(a0)
    80002cc0:	fe010113          	add	sp,sp,-32
    80002cc4:	00813823          	sd	s0,16(sp)
    80002cc8:	00113c23          	sd	ra,24(sp)
    80002ccc:	00913423          	sd	s1,8(sp)
    80002cd0:	0027f793          	and	a5,a5,2
    80002cd4:	00050413          	mv	s0,a0
    80002cd8:	0e078e63          	beqz	a5,80002dd4 <swap_in_page+0x11c>
    80002cdc:	01052703          	lw	a4,16(a0)
    80002ce0:	0000e797          	auipc	a5,0xe
    80002ce4:	3b078793          	add	a5,a5,944 # 80011090 <swap_area>
    80002ce8:	40f58633          	sub	a2,a1,a5
    80002cec:	00c7171b          	sllw	a4,a4,0xc
    80002cf0:	02071713          	sll	a4,a4,0x20
    80002cf4:	02075713          	srl	a4,a4,0x20
    80002cf8:	0000f817          	auipc	a6,0xf
    80002cfc:	39880813          	add	a6,a6,920 # 80012090 <swap_area+0x1000>
    80002d00:	00058493          	mv	s1,a1
    80002d04:	00f707b3          	add	a5,a4,a5
    80002d08:	00e80833          	add	a6,a6,a4
    80002d0c:	40e60633          	sub	a2,a2,a4
    80002d10:	0007c683          	lbu	a3,0(a5)
    80002d14:	00f60733          	add	a4,a2,a5
    80002d18:	00178793          	add	a5,a5,1
    80002d1c:	00d70023          	sb	a3,0(a4)
    80002d20:	ff0798e3          	bne	a5,a6,80002d10 <swap_in_page+0x58>
    80002d24:	00043583          	ld	a1,0(s0)
    80002d28:	02843503          	ld	a0,40(s0)
    80002d2c:	dc9fe0ef          	jal	80001af4 <walk_lookup>
    80002d30:	02050063          	beqz	a0,80002d50 <swap_in_page+0x98>
    80002d34:	00053703          	ld	a4,0(a0)
    80002d38:	00c4d793          	srl	a5,s1,0xc
    80002d3c:	00a79793          	sll	a5,a5,0xa
    80002d40:	01e77713          	and	a4,a4,30
    80002d44:	00e7e7b3          	or	a5,a5,a4
    80002d48:	0017e793          	or	a5,a5,1
    80002d4c:	00f53023          	sd	a5,0(a0)
    80002d50:	01442783          	lw	a5,20(s0)
    80002d54:	01042503          	lw	a0,16(s0)
    80002d58:	00943423          	sd	s1,8(s0)
    80002d5c:	ffd7f793          	and	a5,a5,-3
    80002d60:	0017e793          	or	a5,a5,1
    80002d64:	00f42a23          	sw	a5,20(s0)
    80002d68:	0000e797          	auipc	a5,0xe
    80002d6c:	31c7a783          	lw	a5,796(a5) # 80011084 <swap_mgr+0x84>
    80002d70:	00f57463          	bgeu	a0,a5,80002d78 <swap_in_page+0xc0>
    80002d74:	df5fe0ef          	jal	80001b68 <free_swap_slot.part.0>
    80002d78:	0040e717          	auipc	a4,0x40e
    80002d7c:	31870713          	add	a4,a4,792 # 80411090 <lru_mgr>
    80002d80:	00073783          	ld	a5,0(a4)
    80002d84:	fff00693          	li	a3,-1
    80002d88:	00d42823          	sw	a3,16(s0)
    80002d8c:	02f43023          	sd	a5,32(s0)
    80002d90:	00043c23          	sd	zero,24(s0)
    80002d94:	02078c63          	beqz	a5,80002dcc <swap_in_page+0x114>
    80002d98:	0087bc23          	sd	s0,24(a5)
    80002d9c:	00411697          	auipc	a3,0x411
    80002da0:	2f468693          	add	a3,a3,756 # 80414090 <lru_mgr+0x3000>
    80002da4:	0106a783          	lw	a5,16(a3)
    80002da8:	00873023          	sd	s0,0(a4)
    80002dac:	00000513          	li	a0,0
    80002db0:	0017879b          	addw	a5,a5,1
    80002db4:	00f6a823          	sw	a5,16(a3)
    80002db8:	01813083          	ld	ra,24(sp)
    80002dbc:	01013403          	ld	s0,16(sp)
    80002dc0:	00813483          	ld	s1,8(sp)
    80002dc4:	02010113          	add	sp,sp,32
    80002dc8:	00008067          	ret
    80002dcc:	00873423          	sd	s0,8(a4)
    80002dd0:	fcdff06f          	j	80002d9c <swap_in_page+0xe4>
    80002dd4:	fff00513          	li	a0,-1
    80002dd8:	fe1ff06f          	j	80002db8 <swap_in_page+0x100>
    80002ddc:	fff00513          	li	a0,-1
    80002de0:	00008067          	ret

0000000080002de4 <handle_page_fault>:
    80002de4:	fd010113          	add	sp,sp,-48
    80002de8:	fffff7b7          	lui	a5,0xfffff
    80002dec:	02813023          	sd	s0,32(sp)
    80002df0:	00f5f433          	and	s0,a1,a5
    80002df4:	00040593          	mv	a1,s0
    80002df8:	01213823          	sd	s2,16(sp)
    80002dfc:	02113423          	sd	ra,40(sp)
    80002e00:	00913c23          	sd	s1,24(sp)
    80002e04:	01313423          	sd	s3,8(sp)
    80002e08:	00050913          	mv	s2,a0
    80002e0c:	ce9fe0ef          	jal	80001af4 <walk_lookup>
    80002e10:	12050c63          	beqz	a0,80002f48 <handle_page_fault+0x164>
    80002e14:	00053483          	ld	s1,0(a0)
    80002e18:	0014f793          	and	a5,s1,1
    80002e1c:	12079663          	bnez	a5,80002f48 <handle_page_fault+0x164>
    80002e20:	12048463          	beqz	s1,80002f48 <handle_page_fault+0x164>
    80002e24:	00a4d493          	srl	s1,s1,0xa
    80002e28:	bc9fe0ef          	jal	800019f0 <alloc_page>
    80002e2c:	0004849b          	sext.w	s1,s1
    80002e30:	00050993          	mv	s3,a0
    80002e34:	0e050a63          	beqz	a0,80002f28 <handle_page_fault+0x144>
    80002e38:	0040e797          	auipc	a5,0x40e
    80002e3c:	26878793          	add	a5,a5,616 # 804110a0 <lru_mgr+0x10>
    80002e40:	00000713          	li	a4,0
    80002e44:	10000613          	li	a2,256
    80002e48:	0100006f          	j	80002e58 <handle_page_fault+0x74>
    80002e4c:	0017071b          	addw	a4,a4,1
    80002e50:	03078793          	add	a5,a5,48
    80002e54:	06c70063          	beq	a4,a2,80002eb4 <handle_page_fault+0xd0>
    80002e58:	0007b683          	ld	a3,0(a5)
    80002e5c:	fe8698e3          	bne	a3,s0,80002e4c <handle_page_fault+0x68>
    80002e60:	0147a683          	lw	a3,20(a5)
    80002e64:	0026f693          	and	a3,a3,2
    80002e68:	fe0682e3          	beqz	a3,80002e4c <handle_page_fault+0x68>
    80002e6c:	0107a683          	lw	a3,16(a5)
    80002e70:	fc969ee3          	bne	a3,s1,80002e4c <handle_page_fault+0x68>
    80002e74:	00171513          	sll	a0,a4,0x1
    80002e78:	00e50533          	add	a0,a0,a4
    80002e7c:	00451513          	sll	a0,a0,0x4
    80002e80:	0040e797          	auipc	a5,0x40e
    80002e84:	22078793          	add	a5,a5,544 # 804110a0 <lru_mgr+0x10>
    80002e88:	00f50533          	add	a0,a0,a5
    80002e8c:	00098593          	mv	a1,s3
    80002e90:	e29ff0ef          	jal	80002cb8 <swap_in_page>
    80002e94:	0a051e63          	bnez	a0,80002f50 <handle_page_fault+0x16c>
    80002e98:	02813083          	ld	ra,40(sp)
    80002e9c:	02013403          	ld	s0,32(sp)
    80002ea0:	01813483          	ld	s1,24(sp)
    80002ea4:	01013903          	ld	s2,16(sp)
    80002ea8:	00813983          	ld	s3,8(sp)
    80002eac:	03010113          	add	sp,sp,48
    80002eb0:	00008067          	ret
    80002eb4:	0040e717          	auipc	a4,0x40e
    80002eb8:	20070713          	add	a4,a4,512 # 804110b4 <lru_mgr+0x24>
    80002ebc:	00000793          	li	a5,0
    80002ec0:	10000613          	li	a2,256
    80002ec4:	00c0006f          	j	80002ed0 <handle_page_fault+0xec>
    80002ec8:	0017879b          	addw	a5,a5,1
    80002ecc:	08c78263          	beq	a5,a2,80002f50 <handle_page_fault+0x16c>
    80002ed0:	00072683          	lw	a3,0(a4)
    80002ed4:	03070713          	add	a4,a4,48
    80002ed8:	fe0698e3          	bnez	a3,80002ec8 <handle_page_fault+0xe4>
    80002edc:	00178613          	add	a2,a5,1
    80002ee0:	00179713          	sll	a4,a5,0x1
    80002ee4:	00161693          	sll	a3,a2,0x1
    80002ee8:	00f707b3          	add	a5,a4,a5
    80002eec:	00479793          	sll	a5,a5,0x4
    80002ef0:	00c68733          	add	a4,a3,a2
    80002ef4:	0040e617          	auipc	a2,0x40e
    80002ef8:	19c60613          	add	a2,a2,412 # 80411090 <lru_mgr>
    80002efc:	00f606b3          	add	a3,a2,a5
    80002f00:	00471713          	sll	a4,a4,0x4
    80002f04:	01078793          	add	a5,a5,16
    80002f08:	00e60733          	add	a4,a2,a4
    80002f0c:	00c78533          	add	a0,a5,a2
    80002f10:	00200793          	li	a5,2
    80002f14:	0086b823          	sd	s0,16(a3)
    80002f18:	01273423          	sd	s2,8(a4)
    80002f1c:	0296a023          	sw	s1,32(a3)
    80002f20:	02f6a223          	sw	a5,36(a3)
    80002f24:	f69ff06f          	j	80002e8c <handle_page_fault+0xa8>
    80002f28:	0040e517          	auipc	a0,0x40e
    80002f2c:	17053503          	ld	a0,368(a0) # 80411098 <lru_mgr+0x8>
    80002f30:	00050c63          	beqz	a0,80002f48 <handle_page_fault+0x164>
    80002f34:	c19ff0ef          	jal	80002b4c <swap_out_page>
    80002f38:	00051863          	bnez	a0,80002f48 <handle_page_fault+0x164>
    80002f3c:	ab5fe0ef          	jal	800019f0 <alloc_page>
    80002f40:	00050993          	mv	s3,a0
    80002f44:	ee051ae3          	bnez	a0,80002e38 <handle_page_fault+0x54>
    80002f48:	fff00513          	li	a0,-1
    80002f4c:	f4dff06f          	j	80002e98 <handle_page_fault+0xb4>
    80002f50:	00098513          	mv	a0,s3
    80002f54:	ab9fe0ef          	jal	80001a0c <free_page>
    80002f58:	fff00513          	li	a0,-1
    80002f5c:	f3dff06f          	j	80002e98 <handle_page_fault+0xb4>

0000000080002f60 <va2pa_with_replacement>:
    80002f60:	fe010113          	add	sp,sp,-32
    80002f64:	00913423          	sd	s1,8(sp)
    80002f68:	01213023          	sd	s2,0(sp)
    80002f6c:	00113c23          	sd	ra,24(sp)
    80002f70:	00813823          	sd	s0,16(sp)
    80002f74:	00050493          	mv	s1,a0
    80002f78:	00058913          	mv	s2,a1
    80002f7c:	b79fe0ef          	jal	80001af4 <walk_lookup>
    80002f80:	00050a63          	beqz	a0,80002f94 <va2pa_with_replacement+0x34>
    80002f84:	00053403          	ld	s0,0(a0)
    80002f88:	00147793          	and	a5,s0,1
    80002f8c:	06079663          	bnez	a5,80002ff8 <va2pa_with_replacement+0x98>
    80002f90:	02041063          	bnez	s0,80002fb0 <va2pa_with_replacement+0x50>
    80002f94:	00000513          	li	a0,0
    80002f98:	01813083          	ld	ra,24(sp)
    80002f9c:	01013403          	ld	s0,16(sp)
    80002fa0:	00813483          	ld	s1,8(sp)
    80002fa4:	00013903          	ld	s2,0(sp)
    80002fa8:	02010113          	add	sp,sp,32
    80002fac:	00008067          	ret
    80002fb0:	00600613          	li	a2,6
    80002fb4:	00090593          	mv	a1,s2
    80002fb8:	00048513          	mv	a0,s1
    80002fbc:	e29ff0ef          	jal	80002de4 <handle_page_fault>
    80002fc0:	fc051ae3          	bnez	a0,80002f94 <va2pa_with_replacement+0x34>
    80002fc4:	00090593          	mv	a1,s2
    80002fc8:	00048513          	mv	a0,s1
    80002fcc:	b29fe0ef          	jal	80001af4 <walk_lookup>
    80002fd0:	fc0502e3          	beqz	a0,80002f94 <va2pa_with_replacement+0x34>
    80002fd4:	00053783          	ld	a5,0(a0)
    80002fd8:	0017f713          	and	a4,a5,1
    80002fdc:	fa070ce3          	beqz	a4,80002f94 <va2pa_with_replacement+0x34>
    80002fe0:	00a7d793          	srl	a5,a5,0xa
    80002fe4:	03491593          	sll	a1,s2,0x34
    80002fe8:	00c79513          	sll	a0,a5,0xc
    80002fec:	0345d593          	srl	a1,a1,0x34
    80002ff0:	00b50533          	add	a0,a0,a1
    80002ff4:	fa5ff06f          	j	80002f98 <va2pa_with_replacement+0x38>
    80002ff8:	00090513          	mv	a0,s2
    80002ffc:	a51ff0ef          	jal	80002a4c <lru_touch_page>
    80003000:	01813083          	ld	ra,24(sp)
    80003004:	00a45513          	srl	a0,s0,0xa
    80003008:	01013403          	ld	s0,16(sp)
    8000300c:	03491593          	sll	a1,s2,0x34
    80003010:	00c51513          	sll	a0,a0,0xc
    80003014:	0345d593          	srl	a1,a1,0x34
    80003018:	00813483          	ld	s1,8(sp)
    8000301c:	00013903          	ld	s2,0(sp)
    80003020:	00b50533          	add	a0,a0,a1
    80003024:	02010113          	add	sp,sp,32
    80003028:	00008067          	ret

000000008000302c <safe_copyout>:
    8000302c:	14068063          	beqz	a3,8000316c <safe_copyout+0x140>
    80003030:	fb010113          	add	sp,sp,-80
    80003034:	02913c23          	sd	s1,56(sp)
    80003038:	03213823          	sd	s2,48(sp)
    8000303c:	03313423          	sd	s3,40(sp)
    80003040:	03413023          	sd	s4,32(sp)
    80003044:	01513c23          	sd	s5,24(sp)
    80003048:	01613823          	sd	s6,16(sp)
    8000304c:	01713423          	sd	s7,8(sp)
    80003050:	01813023          	sd	s8,0(sp)
    80003054:	04113423          	sd	ra,72(sp)
    80003058:	04813023          	sd	s0,64(sp)
    8000305c:	00068b13          	mv	s6,a3
    80003060:	00050993          	mv	s3,a0
    80003064:	00058c13          	mv	s8,a1
    80003068:	00060b93          	mv	s7,a2
    8000306c:	fffffa37          	lui	s4,0xfffff
    80003070:	00001937          	lui	s2,0x1
    80003074:	10000493          	li	s1,256
    80003078:	0040ea97          	auipc	s5,0x40e
    8000307c:	018a8a93          	add	s5,s5,24 # 80411090 <lru_mgr>
    80003080:	014c7433          	and	s0,s8,s4
    80003084:	00040593          	mv	a1,s0
    80003088:	00098513          	mv	a0,s3
    8000308c:	ed5ff0ef          	jal	80002f60 <va2pa_with_replacement>
    80003090:	0c050a63          	beqz	a0,80003164 <safe_copyout+0x138>
    80003094:	41840833          	sub	a6,s0,s8
    80003098:	01280833          	add	a6,a6,s2
    8000309c:	010b7463          	bgeu	s6,a6,800030a4 <safe_copyout+0x78>
    800030a0:	000b0813          	mv	a6,s6
    800030a4:	01850733          	add	a4,a0,s8
    800030a8:	40870733          	sub	a4,a4,s0
    800030ac:	01780533          	add	a0,a6,s7
    800030b0:	000b8793          	mv	a5,s7
    800030b4:	41770733          	sub	a4,a4,s7
    800030b8:	0a080263          	beqz	a6,8000315c <safe_copyout+0x130>
    800030bc:	0007c583          	lbu	a1,0(a5)
    800030c0:	00f70633          	add	a2,a4,a5
    800030c4:	00178793          	add	a5,a5,1
    800030c8:	00b60023          	sb	a1,0(a2)
    800030cc:	fef518e3          	bne	a0,a5,800030bc <safe_copyout+0x90>
    800030d0:	0040e797          	auipc	a5,0x40e
    800030d4:	fd078793          	add	a5,a5,-48 # 804110a0 <lru_mgr+0x10>
    800030d8:	00000713          	li	a4,0
    800030dc:	0100006f          	j	800030ec <safe_copyout+0xc0>
    800030e0:	0017071b          	addw	a4,a4,1
    800030e4:	03078793          	add	a5,a5,48
    800030e8:	02970863          	beq	a4,s1,80003118 <safe_copyout+0xec>
    800030ec:	0007b603          	ld	a2,0(a5)
    800030f0:	fec418e3          	bne	s0,a2,800030e0 <safe_copyout+0xb4>
    800030f4:	0147a603          	lw	a2,20(a5)
    800030f8:	00167593          	and	a1,a2,1
    800030fc:	fe0582e3          	beqz	a1,800030e0 <safe_copyout+0xb4>
    80003100:	00171793          	sll	a5,a4,0x1
    80003104:	00e787b3          	add	a5,a5,a4
    80003108:	00479793          	sll	a5,a5,0x4
    8000310c:	00fa87b3          	add	a5,s5,a5
    80003110:	00466613          	or	a2,a2,4
    80003114:	02c7a223          	sw	a2,36(a5)
    80003118:	410b0b33          	sub	s6,s6,a6
    8000311c:	00050b93          	mv	s7,a0
    80003120:	01240c33          	add	s8,s0,s2
    80003124:	f40b1ee3          	bnez	s6,80003080 <safe_copyout+0x54>
    80003128:	00000513          	li	a0,0
    8000312c:	04813083          	ld	ra,72(sp)
    80003130:	04013403          	ld	s0,64(sp)
    80003134:	03813483          	ld	s1,56(sp)
    80003138:	03013903          	ld	s2,48(sp)
    8000313c:	02813983          	ld	s3,40(sp)
    80003140:	02013a03          	ld	s4,32(sp)
    80003144:	01813a83          	ld	s5,24(sp)
    80003148:	01013b03          	ld	s6,16(sp)
    8000314c:	00813b83          	ld	s7,8(sp)
    80003150:	00013c03          	ld	s8,0(sp)
    80003154:	05010113          	add	sp,sp,80
    80003158:	00008067          	ret
    8000315c:	000b8513          	mv	a0,s7
    80003160:	f71ff06f          	j	800030d0 <safe_copyout+0xa4>
    80003164:	fff00513          	li	a0,-1
    80003168:	fc5ff06f          	j	8000312c <safe_copyout+0x100>
    8000316c:	00000513          	li	a0,0
    80003170:	00008067          	ret

0000000080003174 <safe_copyin>:
    80003174:	0e068863          	beqz	a3,80003264 <safe_copyin+0xf0>
    80003178:	fc010113          	add	sp,sp,-64
    8000317c:	02813823          	sd	s0,48(sp)
    80003180:	02913423          	sd	s1,40(sp)
    80003184:	03213023          	sd	s2,32(sp)
    80003188:	01313c23          	sd	s3,24(sp)
    8000318c:	01513423          	sd	s5,8(sp)
    80003190:	01613023          	sd	s6,0(sp)
    80003194:	02113c23          	sd	ra,56(sp)
    80003198:	01413823          	sd	s4,16(sp)
    8000319c:	00068b13          	mv	s6,a3
    800031a0:	00050493          	mv	s1,a0
    800031a4:	00058993          	mv	s3,a1
    800031a8:	00060a93          	mv	s5,a2
    800031ac:	fffff937          	lui	s2,0xfffff
    800031b0:	00001437          	lui	s0,0x1
    800031b4:	012afa33          	and	s4,s5,s2
    800031b8:	000a0593          	mv	a1,s4
    800031bc:	00048513          	mv	a0,s1
    800031c0:	da1ff0ef          	jal	80002f60 <va2pa_with_replacement>
    800031c4:	08050c63          	beqz	a0,8000325c <safe_copyin+0xe8>
    800031c8:	415a08b3          	sub	a7,s4,s5
    800031cc:	008888b3          	add	a7,a7,s0
    800031d0:	011b7463          	bgeu	s6,a7,800031d8 <safe_copyin+0x64>
    800031d4:	000b0893          	mv	a7,s6
    800031d8:	01550533          	add	a0,a0,s5
    800031dc:	41450533          	sub	a0,a0,s4
    800031e0:	06088063          	beqz	a7,80003240 <safe_copyin+0xcc>
    800031e4:	00098793          	mv	a5,s3
    800031e8:	01198833          	add	a6,s3,a7
    800031ec:	41350733          	sub	a4,a0,s3
    800031f0:	00f70633          	add	a2,a4,a5
    800031f4:	00064603          	lbu	a2,0(a2)
    800031f8:	00178793          	add	a5,a5,1
    800031fc:	fec78fa3          	sb	a2,-1(a5)
    80003200:	fef818e3          	bne	a6,a5,800031f0 <safe_copyin+0x7c>
    80003204:	411b0b33          	sub	s6,s6,a7
    80003208:	00080993          	mv	s3,a6
    8000320c:	008a0ab3          	add	s5,s4,s0
    80003210:	fa0b12e3          	bnez	s6,800031b4 <safe_copyin+0x40>
    80003214:	00000513          	li	a0,0
    80003218:	03813083          	ld	ra,56(sp)
    8000321c:	03013403          	ld	s0,48(sp)
    80003220:	02813483          	ld	s1,40(sp)
    80003224:	02013903          	ld	s2,32(sp)
    80003228:	01813983          	ld	s3,24(sp)
    8000322c:	01013a03          	ld	s4,16(sp)
    80003230:	00813a83          	ld	s5,8(sp)
    80003234:	00013b03          	ld	s6,0(sp)
    80003238:	04010113          	add	sp,sp,64
    8000323c:	00008067          	ret
    80003240:	00001ab7          	lui	s5,0x1
    80003244:	015a0ab3          	add	s5,s4,s5
    80003248:	012afa33          	and	s4,s5,s2
    8000324c:	000a0593          	mv	a1,s4
    80003250:	00048513          	mv	a0,s1
    80003254:	d0dff0ef          	jal	80002f60 <va2pa_with_replacement>
    80003258:	f60518e3          	bnez	a0,800031c8 <safe_copyin+0x54>
    8000325c:	fff00513          	li	a0,-1
    80003260:	fb9ff06f          	j	80003218 <safe_copyin+0xa4>
    80003264:	00000513          	li	a0,0
    80003268:	00008067          	ret

000000008000326c <test_page_replacement>:
    8000326c:	f4010113          	add	sp,sp,-192
    80003270:	00004517          	auipc	a0,0x4
    80003274:	86850513          	add	a0,a0,-1944 # 80006ad8 <digits+0x68>
    80003278:	0a113c23          	sd	ra,184(sp)
    8000327c:	0a813823          	sd	s0,176(sp)
    80003280:	0a913423          	sd	s1,168(sp)
    80003284:	0b213023          	sd	s2,160(sp)
    80003288:	09313c23          	sd	s3,152(sp)
    8000328c:	eb8fe0ef          	jal	80001944 <uart_puts>
    80003290:	00004517          	auipc	a0,0x4
    80003294:	87050513          	add	a0,a0,-1936 # 80006b00 <digits+0x90>
    80003298:	eacfe0ef          	jal	80001944 <uart_puts>
    8000329c:	d18ff0ef          	jal	800027b4 <alloc_swap_slot>
    800032a0:	0005049b          	sext.w	s1,a0
    800032a4:	d10ff0ef          	jal	800027b4 <alloc_swap_slot>
    800032a8:	0005041b          	sext.w	s0,a0
    800032ac:	d08ff0ef          	jal	800027b4 <alloc_swap_slot>
    800032b0:	fff00793          	li	a5,-1
    800032b4:	02f48663          	beq	s1,a5,800032e0 <test_page_replacement+0x74>
    800032b8:	1cf40c63          	beq	s0,a5,80003490 <test_page_replacement+0x224>
    800032bc:	0005051b          	sext.w	a0,a0
    800032c0:	02f50063          	beq	a0,a5,800032e0 <test_page_replacement+0x74>
    800032c4:	00848e63          	beq	s1,s0,800032e0 <test_page_replacement+0x74>
    800032c8:	00a40c63          	beq	s0,a0,800032e0 <test_page_replacement+0x74>
    800032cc:	00a48a63          	beq	s1,a0,800032e0 <test_page_replacement+0x74>
    800032d0:	00004517          	auipc	a0,0x4
    800032d4:	85850513          	add	a0,a0,-1960 # 80006b28 <digits+0xb8>
    800032d8:	e6cfe0ef          	jal	80001944 <uart_puts>
    800032dc:	0100006f          	j	800032ec <test_page_replacement+0x80>
    800032e0:	00004517          	auipc	a0,0x4
    800032e4:	86850513          	add	a0,a0,-1944 # 80006b48 <digits+0xd8>
    800032e8:	e5cfe0ef          	jal	80001944 <uart_puts>
    800032ec:	0000e797          	auipc	a5,0xe
    800032f0:	d987a783          	lw	a5,-616(a5) # 80011084 <swap_mgr+0x84>
    800032f4:	00f47663          	bgeu	s0,a5,80003300 <test_page_replacement+0x94>
    800032f8:	00040513          	mv	a0,s0
    800032fc:	86dfe0ef          	jal	80001b68 <free_swap_slot.part.0>
    80003300:	cb4ff0ef          	jal	800027b4 <alloc_swap_slot>
    80003304:	0005051b          	sext.w	a0,a0
    80003308:	14a40c63          	beq	s0,a0,80003460 <test_page_replacement+0x1f4>
    8000330c:	00004517          	auipc	a0,0x4
    80003310:	88450513          	add	a0,a0,-1916 # 80006b90 <digits+0x120>
    80003314:	e30fe0ef          	jal	80001944 <uart_puts>
    80003318:	00004517          	auipc	a0,0x4
    8000331c:	8a050513          	add	a0,a0,-1888 # 80006bb8 <digits+0x148>
    80003320:	e24fe0ef          	jal	80001944 <uart_puts>
    80003324:	00080737          	lui	a4,0x80
    80003328:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    8000332c:	00010637          	lui	a2,0x10
    80003330:	00c71713          	sll	a4,a4,0xc
    80003334:	fff00793          	li	a5,-1
    80003338:	01f7d793          	srl	a5,a5,0x1f
    8000333c:	00c13023          	sd	a2,0(sp)
    80003340:	02e13c23          	sd	a4,56(sp)
    80003344:	00100613          	li	a2,1
    80003348:	00012737          	lui	a4,0x12
    8000334c:	01f61613          	sll	a2,a2,0x1f
    80003350:	00f13823          	sd	a5,16(sp)
    80003354:	04f13023          	sd	a5,64(sp)
    80003358:	06e13023          	sd	a4,96(sp)
    8000335c:	06f13823          	sd	a5,112(sp)
    80003360:	40001737          	lui	a4,0x40001
    80003364:	03010793          	add	a5,sp,48
    80003368:	00423697          	auipc	a3,0x423
    8000336c:	ed86b683          	ld	a3,-296(a3) # 80426240 <kernel_pagetable>
    80003370:	00171713          	sll	a4,a4,0x1
    80003374:	0040e417          	auipc	s0,0x40e
    80003378:	d1c40413          	add	s0,s0,-740 # 80411090 <lru_mgr>
    8000337c:	00010493          	mv	s1,sp
    80003380:	06010993          	add	s3,sp,96
    80003384:	00c13423          	sd	a2,8(sp)
    80003388:	00f13c23          	sd	a5,24(sp)
    8000338c:	00011637          	lui	a2,0x11
    80003390:	08f13023          	sd	a5,128(sp)
    80003394:	00411917          	auipc	s2,0x411
    80003398:	cfc90913          	add	s2,s2,-772 # 80414090 <lru_mgr+0x3000>
    8000339c:	00300793          	li	a5,3
    800033a0:	00004517          	auipc	a0,0x4
    800033a4:	83850513          	add	a0,a0,-1992 # 80006bd8 <digits+0x168>
    800033a8:	06e13423          	sd	a4,104(sp)
    800033ac:	00f92823          	sw	a5,16(s2)
    800033b0:	02013023          	sd	zero,32(sp)
    800033b4:	02d13423          	sd	a3,40(sp)
    800033b8:	02c13823          	sd	a2,48(sp)
    800033bc:	04d13c23          	sd	a3,88(sp)
    800033c0:	06013c23          	sd	zero,120(sp)
    800033c4:	08d13423          	sd	a3,136(sp)
    800033c8:	00943423          	sd	s1,8(s0)
    800033cc:	04913823          	sd	s1,80(sp)
    800033d0:	05313423          	sd	s3,72(sp)
    800033d4:	01343023          	sd	s3,0(s0)
    800033d8:	d6cfe0ef          	jal	80001944 <uart_puts>
    800033dc:	04813783          	ld	a5,72(sp)
    800033e0:	05013703          	ld	a4,80(sp)
    800033e4:	08078a63          	beqz	a5,80003478 <test_page_replacement+0x20c>
    800033e8:	02e7b023          	sd	a4,32(a5)
    800033ec:	08070263          	beqz	a4,80003470 <test_page_replacement+0x204>
    800033f0:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    800033f4:	01092783          	lw	a5,16(s2)
    800033f8:	04013823          	sd	zero,80(sp)
    800033fc:	04013423          	sd	zero,72(sp)
    80003400:	fff7871b          	addw	a4,a5,-1
    80003404:	00e92823          	sw	a4,16(s2)
    80003408:	00200793          	li	a5,2
    8000340c:	00f71663          	bne	a4,a5,80003418 <test_page_replacement+0x1ac>
    80003410:	00043783          	ld	a5,0(s0)
    80003414:	09378663          	beq	a5,s3,800034a0 <test_page_replacement+0x234>
    80003418:	00004517          	auipc	a0,0x4
    8000341c:	80050513          	add	a0,a0,-2048 # 80006c18 <digits+0x1a8>
    80003420:	d24fe0ef          	jal	80001944 <uart_puts>
    80003424:	00843783          	ld	a5,8(s0)
    80003428:	04978c63          	beq	a5,s1,80003480 <test_page_replacement+0x214>
    8000342c:	00004517          	auipc	a0,0x4
    80003430:	82c50513          	add	a0,a0,-2004 # 80006c58 <digits+0x1e8>
    80003434:	d10fe0ef          	jal	80001944 <uart_puts>
    80003438:	00004517          	auipc	a0,0x4
    8000343c:	84050513          	add	a0,a0,-1984 # 80006c78 <digits+0x208>
    80003440:	d04fe0ef          	jal	80001944 <uart_puts>
    80003444:	0b813083          	ld	ra,184(sp)
    80003448:	0b013403          	ld	s0,176(sp)
    8000344c:	0a813483          	ld	s1,168(sp)
    80003450:	0a013903          	ld	s2,160(sp)
    80003454:	09813983          	ld	s3,152(sp)
    80003458:	0c010113          	add	sp,sp,192
    8000345c:	00008067          	ret
    80003460:	00003517          	auipc	a0,0x3
    80003464:	70850513          	add	a0,a0,1800 # 80006b68 <digits+0xf8>
    80003468:	cdcfe0ef          	jal	80001944 <uart_puts>
    8000346c:	eadff06f          	j	80003318 <test_page_replacement+0xac>
    80003470:	00f43423          	sd	a5,8(s0)
    80003474:	f81ff06f          	j	800033f4 <test_page_replacement+0x188>
    80003478:	00e43023          	sd	a4,0(s0)
    8000347c:	f71ff06f          	j	800033ec <test_page_replacement+0x180>
    80003480:	00003517          	auipc	a0,0x3
    80003484:	7b850513          	add	a0,a0,1976 # 80006c38 <digits+0x1c8>
    80003488:	cbcfe0ef          	jal	80001944 <uart_puts>
    8000348c:	fadff06f          	j	80003438 <test_page_replacement+0x1cc>
    80003490:	00003517          	auipc	a0,0x3
    80003494:	6b850513          	add	a0,a0,1720 # 80006b48 <digits+0xd8>
    80003498:	cacfe0ef          	jal	80001944 <uart_puts>
    8000349c:	e65ff06f          	j	80003300 <test_page_replacement+0x94>
    800034a0:	00843783          	ld	a5,8(s0)
    800034a4:	f6979ae3          	bne	a5,s1,80003418 <test_page_replacement+0x1ac>
    800034a8:	00003517          	auipc	a0,0x3
    800034ac:	75050513          	add	a0,a0,1872 # 80006bf8 <digits+0x188>
    800034b0:	c94fe0ef          	jal	80001944 <uart_puts>
    800034b4:	f71ff06f          	j	80003424 <test_page_replacement+0x1b8>

00000000800034b8 <handle_external_interrupt>:
    800034b8:	00003517          	auipc	a0,0x3
    800034bc:	7e850513          	add	a0,a0,2024 # 80006ca0 <digits+0x230>
    800034c0:	914fe06f          	j	800015d4 <printf>

00000000800034c4 <handle_software_interrupt>:
    800034c4:	00004517          	auipc	a0,0x4
    800034c8:	80c50513          	add	a0,a0,-2036 # 80006cd0 <digits+0x260>
    800034cc:	908fe06f          	j	800015d4 <printf>

00000000800034d0 <handle_timer_interrupt>:
    800034d0:	ff010113          	add	sp,sp,-16
    800034d4:	00423597          	auipc	a1,0x423
    800034d8:	d7c5b583          	ld	a1,-644(a1) # 80426250 <ticks>
    800034dc:	00004517          	auipc	a0,0x4
    800034e0:	82450513          	add	a0,a0,-2012 # 80006d00 <digits+0x290>
    800034e4:	00113423          	sd	ra,8(sp)
    800034e8:	8ecfe0ef          	jal	800015d4 <printf>
    800034ec:	2f9000ef          	jal	80003fe4 <get_current_proc>
    800034f0:	00050863          	beqz	a0,80003500 <handle_timer_interrupt+0x30>
    800034f4:	00052703          	lw	a4,0(a0)
    800034f8:	00300793          	li	a5,3
    800034fc:	00f70863          	beq	a4,a5,8000350c <handle_timer_interrupt+0x3c>
    80003500:	00813083          	ld	ra,8(sp)
    80003504:	01010113          	add	sp,sp,16
    80003508:	00008067          	ret
    8000350c:	00452583          	lw	a1,4(a0)
    80003510:	00004517          	auipc	a0,0x4
    80003514:	81850513          	add	a0,a0,-2024 # 80006d28 <digits+0x2b8>
    80003518:	8bcfe0ef          	jal	800015d4 <printf>
    8000351c:	00813083          	ld	ra,8(sp)
    80003520:	01010113          	add	sp,sp,16
    80003524:	4290006f          	j	8000414c <yield>

0000000080003528 <get_ticks>:
    80003528:	00423517          	auipc	a0,0x423
    8000352c:	d2853503          	ld	a0,-728(a0) # 80426250 <ticks>
    80003530:	00008067          	ret

0000000080003534 <machine_timer_handler>:
    80003534:	00423797          	auipc	a5,0x423
    80003538:	d1478793          	add	a5,a5,-748 # 80426248 <m_mode_ticks>
    8000353c:	0007b703          	ld	a4,0(a5)
    80003540:	ff010113          	add	sp,sp,-16
    80003544:	00113423          	sd	ra,8(sp)
    80003548:	00170713          	add	a4,a4,1
    8000354c:	00e7b023          	sd	a4,0(a5)
    80003550:	00423697          	auipc	a3,0x423
    80003554:	d0068693          	add	a3,a3,-768 # 80426250 <ticks>
    80003558:	0006b703          	ld	a4,0(a3)
    8000355c:	00003517          	auipc	a0,0x3
    80003560:	7fc50513          	add	a0,a0,2044 # 80006d58 <digits+0x2e8>
    80003564:	00170713          	add	a4,a4,1
    80003568:	00e6b023          	sd	a4,0(a3)
    8000356c:	0007b583          	ld	a1,0(a5)
    80003570:	864fe0ef          	jal	800015d4 <printf>
    80003574:	0200c7b7          	lui	a5,0x200c
    80003578:	ff87b783          	ld	a5,-8(a5) # 200bff8 <_entry-0x7dff4008>
    8000357c:	000f4737          	lui	a4,0xf4
    80003580:	00813083          	ld	ra,8(sp)
    80003584:	24070713          	add	a4,a4,576 # f4240 <_entry-0x7ff0bdc0>
    80003588:	00e787b3          	add	a5,a5,a4
    8000358c:	02004737          	lui	a4,0x2004
    80003590:	00f73023          	sd	a5,0(a4) # 2004000 <_entry-0x7dffc000>
    80003594:	01010113          	add	sp,sp,16
    80003598:	00008067          	ret

000000008000359c <alloc_trapframe>:
    8000359c:	00411597          	auipc	a1,0x411
    800035a0:	b0c58593          	add	a1,a1,-1268 # 804140a8 <trapframe_used>
    800035a4:	00058793          	mv	a5,a1
    800035a8:	00000713          	li	a4,0
    800035ac:	10000613          	li	a2,256
    800035b0:	00c0006f          	j	800035bc <alloc_trapframe+0x20>
    800035b4:	0017071b          	addw	a4,a4,1
    800035b8:	02c70e63          	beq	a4,a2,800035f4 <alloc_trapframe+0x58>
    800035bc:	0007a683          	lw	a3,0(a5)
    800035c0:	00478793          	add	a5,a5,4
    800035c4:	fe0698e3          	bnez	a3,800035b4 <alloc_trapframe+0x18>
    800035c8:	00271793          	sll	a5,a4,0x2
    800035cc:	00471513          	sll	a0,a4,0x4
    800035d0:	00f585b3          	add	a1,a1,a5
    800035d4:	00e50533          	add	a0,a0,a4
    800035d8:	00100793          	li	a5,1
    800035dc:	00f5a023          	sw	a5,0(a1)
    800035e0:	00451513          	sll	a0,a0,0x4
    800035e4:	00411797          	auipc	a5,0x411
    800035e8:	f4478793          	add	a5,a5,-188 # 80414528 <trapframe_pool>
    800035ec:	00f50533          	add	a0,a0,a5
    800035f0:	00008067          	ret
    800035f4:	00000513          	li	a0,0
    800035f8:	00008067          	ret

00000000800035fc <free_trapframe>:
    800035fc:	00411797          	auipc	a5,0x411
    80003600:	f2c78793          	add	a5,a5,-212 # 80414528 <trapframe_pool>
    80003604:	02f56c63          	bltu	a0,a5,8000363c <free_trapframe+0x40>
    80003608:	00422717          	auipc	a4,0x422
    8000360c:	f2070713          	add	a4,a4,-224 # 80425528 <cpus>
    80003610:	02e57663          	bgeu	a0,a4,8000363c <free_trapframe+0x40>
    80003614:	40f507b3          	sub	a5,a0,a5
    80003618:	00004717          	auipc	a4,0x4
    8000361c:	00073703          	ld	a4,0(a4) # 80007618 <digits+0xba8>
    80003620:	4047d793          	sra	a5,a5,0x4
    80003624:	02e787b3          	mul	a5,a5,a4
    80003628:	00411717          	auipc	a4,0x411
    8000362c:	a8070713          	add	a4,a4,-1408 # 804140a8 <trapframe_used>
    80003630:	00279793          	sll	a5,a5,0x2
    80003634:	00f707b3          	add	a5,a4,a5
    80003638:	0007a023          	sw	zero,0(a5)
    8000363c:	00008067          	ret

0000000080003640 <intr_on>:
    80003640:	100027f3          	csrr	a5,sstatus
    80003644:	0027e793          	or	a5,a5,2
    80003648:	10079073          	csrw	sstatus,a5
    8000364c:	00008067          	ret

0000000080003650 <intr_off>:
    80003650:	100027f3          	csrr	a5,sstatus
    80003654:	ffd7f793          	and	a5,a5,-3
    80003658:	10079073          	csrw	sstatus,a5
    8000365c:	00008067          	ret

0000000080003660 <intr_get>:
    80003660:	10002573          	csrr	a0,sstatus
    80003664:	00155513          	srl	a0,a0,0x1
    80003668:	00157513          	and	a0,a0,1
    8000366c:	00008067          	ret

0000000080003670 <set_stvec>:
    80003670:	00a585b3          	add	a1,a1,a0
    80003674:	10559073          	csrw	stvec,a1
    80003678:	00008067          	ret

000000008000367c <trap_init>:
    8000367c:	ff010113          	add	sp,sp,-16
    80003680:	00003517          	auipc	a0,0x3
    80003684:	70850513          	add	a0,a0,1800 # 80006d88 <digits+0x318>
    80003688:	00113423          	sd	ra,8(sp)
    8000368c:	ab8fe0ef          	jal	80001944 <uart_puts>
    80003690:	00411617          	auipc	a2,0x411
    80003694:	a1860613          	add	a2,a2,-1512 # 804140a8 <trapframe_used>
    80003698:	00060793          	mv	a5,a2
    8000369c:	00411717          	auipc	a4,0x411
    800036a0:	e0c70713          	add	a4,a4,-500 # 804144a8 <trap_handlers>
    800036a4:	0007a023          	sw	zero,0(a5)
    800036a8:	00478793          	add	a5,a5,4
    800036ac:	fee79ce3          	bne	a5,a4,800036a4 <trap_init+0x28>
    800036b0:	00411797          	auipc	a5,0x411
    800036b4:	df878793          	add	a5,a5,-520 # 804144a8 <trap_handlers>
    800036b8:	00411697          	auipc	a3,0x411
    800036bc:	e7068693          	add	a3,a3,-400 # 80414528 <trapframe_pool>
    800036c0:	00078713          	mv	a4,a5
    800036c4:	00073023          	sd	zero,0(a4)
    800036c8:	00870713          	add	a4,a4,8
    800036cc:	fee69ce3          	bne	a3,a4,800036c4 <trap_init+0x48>
    800036d0:	00000717          	auipc	a4,0x0
    800036d4:	e0070713          	add	a4,a4,-512 # 800034d0 <handle_timer_interrupt>
    800036d8:	42e63423          	sd	a4,1064(a2)
    800036dc:	00000717          	auipc	a4,0x0
    800036e0:	ddc70713          	add	a4,a4,-548 # 800034b8 <handle_external_interrupt>
    800036e4:	44e63423          	sd	a4,1096(a2)
    800036e8:	00000717          	auipc	a4,0x0
    800036ec:	ddc70713          	add	a4,a4,-548 # 800034c4 <handle_software_interrupt>
    800036f0:	40e63423          	sd	a4,1032(a2)
    800036f4:	00000593          	li	a1,0
    800036f8:	0007b703          	ld	a4,0(a5)
    800036fc:	00878793          	add	a5,a5,8
    80003700:	00070463          	beqz	a4,80003708 <trap_init+0x8c>
    80003704:	0015859b          	addw	a1,a1,1
    80003708:	fef698e3          	bne	a3,a5,800036f8 <trap_init+0x7c>
    8000370c:	00003517          	auipc	a0,0x3
    80003710:	6a450513          	add	a0,a0,1700 # 80006db0 <digits+0x340>
    80003714:	ec1fd0ef          	jal	800015d4 <printf>
    80003718:	00813083          	ld	ra,8(sp)
    8000371c:	00003517          	auipc	a0,0x3
    80003720:	6c450513          	add	a0,a0,1732 # 80006de0 <digits+0x370>
    80003724:	01010113          	add	sp,sp,16
    80003728:	a1cfe06f          	j	80001944 <uart_puts>

000000008000372c <trap_init_hart>:
    8000372c:	ff010113          	add	sp,sp,-16
    80003730:	00003517          	auipc	a0,0x3
    80003734:	6d050513          	add	a0,a0,1744 # 80006e00 <digits+0x390>
    80003738:	00113423          	sd	ra,8(sp)
    8000373c:	a08fe0ef          	jal	80001944 <uart_puts>
    80003740:	00001797          	auipc	a5,0x1
    80003744:	07078793          	add	a5,a5,112 # 800047b0 <kernelvec>
    80003748:	10579073          	csrw	stvec,a5
    8000374c:	104027f3          	csrr	a5,sie
    80003750:	2227e793          	or	a5,a5,546
    80003754:	10479073          	csrw	sie,a5
    80003758:	100027f3          	csrr	a5,sstatus
    8000375c:	0027e793          	or	a5,a5,2
    80003760:	10079073          	csrw	sstatus,a5
    80003764:	00813083          	ld	ra,8(sp)
    80003768:	00003517          	auipc	a0,0x3
    8000376c:	6c050513          	add	a0,a0,1728 # 80006e28 <digits+0x3b8>
    80003770:	01010113          	add	sp,sp,16
    80003774:	9d0fe06f          	j	80001944 <uart_puts>

0000000080003778 <set_next_timer>:
    80003778:	0200c7b7          	lui	a5,0x200c
    8000377c:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80003780:	000f4637          	lui	a2,0xf4
    80003784:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003788:	00c58633          	add	a2,a1,a2
    8000378c:	020047b7          	lui	a5,0x2004
    80003790:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80003794:	00003517          	auipc	a0,0x3
    80003798:	6bc50513          	add	a0,a0,1724 # 80006e50 <digits+0x3e0>
    8000379c:	e39fd06f          	j	800015d4 <printf>

00000000800037a0 <timerinit>:
    800037a0:	ff010113          	add	sp,sp,-16
    800037a4:	00003517          	auipc	a0,0x3
    800037a8:	6dc50513          	add	a0,a0,1756 # 80006e80 <digits+0x410>
    800037ac:	00113423          	sd	ra,8(sp)
    800037b0:	994fe0ef          	jal	80001944 <uart_puts>
    800037b4:	0200c7b7          	lui	a5,0x200c
    800037b8:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    800037bc:	000f4637          	lui	a2,0xf4
    800037c0:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800037c4:	00c58633          	add	a2,a1,a2
    800037c8:	020047b7          	lui	a5,0x2004
    800037cc:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    800037d0:	00003517          	auipc	a0,0x3
    800037d4:	68050513          	add	a0,a0,1664 # 80006e50 <digits+0x3e0>
    800037d8:	dfdfd0ef          	jal	800015d4 <printf>
    800037dc:	00813083          	ld	ra,8(sp)
    800037e0:	00003517          	auipc	a0,0x3
    800037e4:	6c050513          	add	a0,a0,1728 # 80006ea0 <digits+0x430>
    800037e8:	01010113          	add	sp,sp,16
    800037ec:	958fe06f          	j	80001944 <uart_puts>

00000000800037f0 <devintr>:
    800037f0:	142025f3          	csrr	a1,scause
    800037f4:	0e05de63          	bgez	a1,800038f0 <devintr+0x100>
    800037f8:	ff010113          	add	sp,sp,-16
    800037fc:	00113423          	sd	ra,8(sp)
    80003800:	00813023          	sd	s0,0(sp)
    80003804:	00f5f593          	and	a1,a1,15
    80003808:	00500793          	li	a5,5
    8000380c:	08f58663          	beq	a1,a5,80003898 <devintr+0xa8>
    80003810:	00900793          	li	a5,9
    80003814:	06f58263          	beq	a1,a5,80003878 <devintr+0x88>
    80003818:	00100793          	li	a5,1
    8000381c:	02f58263          	beq	a1,a5,80003840 <devintr+0x50>
    80003820:	00003517          	auipc	a0,0x3
    80003824:	70850513          	add	a0,a0,1800 # 80006f28 <digits+0x4b8>
    80003828:	dadfd0ef          	jal	800015d4 <printf>
    8000382c:	00813083          	ld	ra,8(sp)
    80003830:	00013403          	ld	s0,0(sp)
    80003834:	00000513          	li	a0,0
    80003838:	01010113          	add	sp,sp,16
    8000383c:	00008067          	ret
    80003840:	00003517          	auipc	a0,0x3
    80003844:	6c850513          	add	a0,a0,1736 # 80006f08 <digits+0x498>
    80003848:	8fcfe0ef          	jal	80001944 <uart_puts>
    8000384c:	144027f3          	csrr	a5,sip
    80003850:	ffd7f793          	and	a5,a5,-3
    80003854:	14479073          	csrw	sip,a5
    80003858:	00003517          	auipc	a0,0x3
    8000385c:	47850513          	add	a0,a0,1144 # 80006cd0 <digits+0x260>
    80003860:	d75fd0ef          	jal	800015d4 <printf>
    80003864:	00100513          	li	a0,1
    80003868:	00813083          	ld	ra,8(sp)
    8000386c:	00013403          	ld	s0,0(sp)
    80003870:	01010113          	add	sp,sp,16
    80003874:	00008067          	ret
    80003878:	00003517          	auipc	a0,0x3
    8000387c:	67050513          	add	a0,a0,1648 # 80006ee8 <digits+0x478>
    80003880:	8c4fe0ef          	jal	80001944 <uart_puts>
    80003884:	00003517          	auipc	a0,0x3
    80003888:	41c50513          	add	a0,a0,1052 # 80006ca0 <digits+0x230>
    8000388c:	d49fd0ef          	jal	800015d4 <printf>
    80003890:	00100513          	li	a0,1
    80003894:	fd5ff06f          	j	80003868 <devintr+0x78>
    80003898:	00423417          	auipc	s0,0x423
    8000389c:	9b840413          	add	s0,s0,-1608 # 80426250 <ticks>
    800038a0:	00043783          	ld	a5,0(s0)
    800038a4:	000f4637          	lui	a2,0xf4
    800038a8:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800038ac:	00178793          	add	a5,a5,1
    800038b0:	00f43023          	sd	a5,0(s0)
    800038b4:	0200c7b7          	lui	a5,0x200c
    800038b8:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    800038bc:	020047b7          	lui	a5,0x2004
    800038c0:	00003517          	auipc	a0,0x3
    800038c4:	59050513          	add	a0,a0,1424 # 80006e50 <digits+0x3e0>
    800038c8:	00c58633          	add	a2,a1,a2
    800038cc:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    800038d0:	d05fd0ef          	jal	800015d4 <printf>
    800038d4:	00043583          	ld	a1,0(s0)
    800038d8:	00003517          	auipc	a0,0x3
    800038dc:	5e850513          	add	a0,a0,1512 # 80006ec0 <digits+0x450>
    800038e0:	cf5fd0ef          	jal	800015d4 <printf>
    800038e4:	bedff0ef          	jal	800034d0 <handle_timer_interrupt>
    800038e8:	00100513          	li	a0,1
    800038ec:	f7dff06f          	j	80003868 <devintr+0x78>
    800038f0:	00000513          	li	a0,0
    800038f4:	00008067          	ret

00000000800038f8 <usertrap>:
    800038f8:	142025f3          	csrr	a1,scause
    800038fc:	0405c463          	bltz	a1,80003944 <usertrap+0x4c>
    80003900:	00d00793          	li	a5,13
    80003904:	02b7e063          	bltu	a5,a1,80003924 <usertrap+0x2c>
    80003908:	00b00793          	li	a5,11
    8000390c:	02b7e663          	bltu	a5,a1,80003938 <usertrap+0x40>
    80003910:	00800793          	li	a5,8
    80003914:	00f59c63          	bne	a1,a5,8000392c <usertrap+0x34>
    80003918:	00003517          	auipc	a0,0x3
    8000391c:	65850513          	add	a0,a0,1624 # 80006f70 <digits+0x500>
    80003920:	824fe06f          	j	80001944 <uart_puts>
    80003924:	00f00793          	li	a5,15
    80003928:	00f58863          	beq	a1,a5,80003938 <usertrap+0x40>
    8000392c:	00003517          	auipc	a0,0x3
    80003930:	67c50513          	add	a0,a0,1660 # 80006fa8 <digits+0x538>
    80003934:	ca1fd06f          	j	800015d4 <printf>
    80003938:	00003517          	auipc	a0,0x3
    8000393c:	65050513          	add	a0,a0,1616 # 80006f88 <digits+0x518>
    80003940:	804fe06f          	j	80001944 <uart_puts>
    80003944:	ff010113          	add	sp,sp,-16
    80003948:	00113423          	sd	ra,8(sp)
    8000394c:	ea5ff0ef          	jal	800037f0 <devintr>
    80003950:	00050863          	beqz	a0,80003960 <usertrap+0x68>
    80003954:	00813083          	ld	ra,8(sp)
    80003958:	01010113          	add	sp,sp,16
    8000395c:	00008067          	ret
    80003960:	00813083          	ld	ra,8(sp)
    80003964:	00003517          	auipc	a0,0x3
    80003968:	5e450513          	add	a0,a0,1508 # 80006f48 <digits+0x4d8>
    8000396c:	01010113          	add	sp,sp,16
    80003970:	c65fd06f          	j	800015d4 <printf>

0000000080003974 <handle_syscall>:
    80003974:	06050a63          	beqz	a0,800039e8 <handle_syscall+0x74>
    80003978:	ff010113          	add	sp,sp,-16
    8000397c:	00813023          	sd	s0,0(sp)
    80003980:	08853403          	ld	s0,136(a0)
    80003984:	00003517          	auipc	a0,0x3
    80003988:	68450513          	add	a0,a0,1668 # 80007008 <digits+0x598>
    8000398c:	00113423          	sd	ra,8(sp)
    80003990:	00040593          	mv	a1,s0
    80003994:	c41fd0ef          	jal	800015d4 <printf>
    80003998:	00200793          	li	a5,2
    8000399c:	06f40a63          	beq	s0,a5,80003a10 <handle_syscall+0x9c>
    800039a0:	0287e463          	bltu	a5,s0,800039c8 <handle_syscall+0x54>
    800039a4:	00003517          	auipc	a0,0x3
    800039a8:	6ac50513          	add	a0,a0,1708 # 80007050 <digits+0x5e0>
    800039ac:	02041663          	bnez	s0,800039d8 <handle_syscall+0x64>
    800039b0:	00013403          	ld	s0,0(sp)
    800039b4:	00813083          	ld	ra,8(sp)
    800039b8:	00003517          	auipc	a0,0x3
    800039bc:	67850513          	add	a0,a0,1656 # 80007030 <digits+0x5c0>
    800039c0:	01010113          	add	sp,sp,16
    800039c4:	c11fd06f          	j	800015d4 <printf>
    800039c8:	00300793          	li	a5,3
    800039cc:	00003517          	auipc	a0,0x3
    800039d0:	6c450513          	add	a0,a0,1732 # 80007090 <digits+0x620>
    800039d4:	02f41063          	bne	s0,a5,800039f4 <handle_syscall+0x80>
    800039d8:	00013403          	ld	s0,0(sp)
    800039dc:	00813083          	ld	ra,8(sp)
    800039e0:	01010113          	add	sp,sp,16
    800039e4:	bf1fd06f          	j	800015d4 <printf>
    800039e8:	00003517          	auipc	a0,0x3
    800039ec:	5f050513          	add	a0,a0,1520 # 80006fd8 <digits+0x568>
    800039f0:	f55fd06f          	j	80001944 <uart_puts>
    800039f4:	00040593          	mv	a1,s0
    800039f8:	00013403          	ld	s0,0(sp)
    800039fc:	00813083          	ld	ra,8(sp)
    80003a00:	00003517          	auipc	a0,0x3
    80003a04:	6b050513          	add	a0,a0,1712 # 800070b0 <digits+0x640>
    80003a08:	01010113          	add	sp,sp,16
    80003a0c:	bc9fd06f          	j	800015d4 <printf>
    80003a10:	00013403          	ld	s0,0(sp)
    80003a14:	00813083          	ld	ra,8(sp)
    80003a18:	00003517          	auipc	a0,0x3
    80003a1c:	65850513          	add	a0,a0,1624 # 80007070 <digits+0x600>
    80003a20:	01010113          	add	sp,sp,16
    80003a24:	bb1fd06f          	j	800015d4 <printf>

0000000080003a28 <handle_exception>:
    80003a28:	14202773          	csrr	a4,scause
    80003a2c:	141025f3          	csrr	a1,sepc
    80003a30:	00f00793          	li	a5,15
    80003a34:	16e7e263          	bltu	a5,a4,80003b98 <handle_exception+0x170>
    80003a38:	00004697          	auipc	a3,0x4
    80003a3c:	94468693          	add	a3,a3,-1724 # 8000737c <digits+0x90c>
    80003a40:	00271793          	sll	a5,a4,0x2
    80003a44:	00d787b3          	add	a5,a5,a3
    80003a48:	0007a783          	lw	a5,0(a5)
    80003a4c:	ff010113          	add	sp,sp,-16
    80003a50:	00813023          	sd	s0,0(sp)
    80003a54:	00d787b3          	add	a5,a5,a3
    80003a58:	00113423          	sd	ra,8(sp)
    80003a5c:	00050413          	mv	s0,a0
    80003a60:	00078067          	jr	a5
    80003a64:	00013403          	ld	s0,0(sp)
    80003a68:	00813083          	ld	ra,8(sp)
    80003a6c:	00058613          	mv	a2,a1
    80003a70:	00070593          	mv	a1,a4
    80003a74:	00004517          	auipc	a0,0x4
    80003a78:	8b450513          	add	a0,a0,-1868 # 80007328 <digits+0x8b8>
    80003a7c:	01010113          	add	sp,sp,16
    80003a80:	b55fd06f          	j	800015d4 <printf>
    80003a84:	00003517          	auipc	a0,0x3
    80003a88:	73c50513          	add	a0,a0,1852 # 800071c0 <digits+0x750>
    80003a8c:	b49fd0ef          	jal	800015d4 <printf>
    80003a90:	10040e63          	beqz	s0,80003bac <handle_exception+0x184>
    80003a94:	10043583          	ld	a1,256(s0)
    80003a98:	00003517          	auipc	a0,0x3
    80003a9c:	78850513          	add	a0,a0,1928 # 80007220 <digits+0x7b0>
    80003aa0:	00013403          	ld	s0,0(sp)
    80003aa4:	00813083          	ld	ra,8(sp)
    80003aa8:	01010113          	add	sp,sp,16
    80003aac:	b29fd06f          	j	800015d4 <printf>
    80003ab0:	00003517          	auipc	a0,0x3
    80003ab4:	7a050513          	add	a0,a0,1952 # 80007250 <digits+0x7e0>
    80003ab8:	b1dfd0ef          	jal	800015d4 <printf>
    80003abc:	00003517          	auipc	a0,0x3
    80003ac0:	7b450513          	add	a0,a0,1972 # 80007270 <digits+0x800>
    80003ac4:	08040c63          	beqz	s0,80003b5c <handle_exception+0x134>
    80003ac8:	10043583          	ld	a1,256(s0)
    80003acc:	00003517          	auipc	a0,0x3
    80003ad0:	7d450513          	add	a0,a0,2004 # 800072a0 <digits+0x830>
    80003ad4:	fcdff06f          	j	80003aa0 <handle_exception+0x78>
    80003ad8:	00013403          	ld	s0,0(sp)
    80003adc:	00813083          	ld	ra,8(sp)
    80003ae0:	00003517          	auipc	a0,0x3
    80003ae4:	7e850513          	add	a0,a0,2024 # 800072c8 <digits+0x858>
    80003ae8:	01010113          	add	sp,sp,16
    80003aec:	ae9fd06f          	j	800015d4 <printf>
    80003af0:	00013403          	ld	s0,0(sp)
    80003af4:	00813083          	ld	ra,8(sp)
    80003af8:	00004517          	auipc	a0,0x4
    80003afc:	80050513          	add	a0,a0,-2048 # 800072f8 <digits+0x888>
    80003b00:	01010113          	add	sp,sp,16
    80003b04:	ad1fd06f          	j	800015d4 <printf>
    80003b08:	00013403          	ld	s0,0(sp)
    80003b0c:	00813083          	ld	ra,8(sp)
    80003b10:	01010113          	add	sp,sp,16
    80003b14:	e61ff06f          	j	80003974 <handle_syscall>
    80003b18:	00003517          	auipc	a0,0x3
    80003b1c:	5b850513          	add	a0,a0,1464 # 800070d0 <digits+0x660>
    80003b20:	ab5fd0ef          	jal	800015d4 <printf>
    80003b24:	02040863          	beqz	s0,80003b54 <handle_exception+0x12c>
    80003b28:	143025f3          	csrr	a1,stval
    80003b2c:	00013403          	ld	s0,0(sp)
    80003b30:	00813083          	ld	ra,8(sp)
    80003b34:	00003517          	auipc	a0,0x3
    80003b38:	5fc50513          	add	a0,a0,1532 # 80007130 <digits+0x6c0>
    80003b3c:	01010113          	add	sp,sp,16
    80003b40:	a95fd06f          	j	800015d4 <printf>
    80003b44:	00003517          	auipc	a0,0x3
    80003b48:	61c50513          	add	a0,a0,1564 # 80007160 <digits+0x6f0>
    80003b4c:	a89fd0ef          	jal	800015d4 <printf>
    80003b50:	fc041ce3          	bnez	s0,80003b28 <handle_exception+0x100>
    80003b54:	00003517          	auipc	a0,0x3
    80003b58:	5a450513          	add	a0,a0,1444 # 800070f8 <digits+0x688>
    80003b5c:	00013403          	ld	s0,0(sp)
    80003b60:	00813083          	ld	ra,8(sp)
    80003b64:	01010113          	add	sp,sp,16
    80003b68:	dddfd06f          	j	80001944 <uart_puts>
    80003b6c:	00003517          	auipc	a0,0x3
    80003b70:	60c50513          	add	a0,a0,1548 # 80007178 <digits+0x708>
    80003b74:	a61fd0ef          	jal	800015d4 <printf>
    80003b78:	fc040ee3          	beqz	s0,80003b54 <handle_exception+0x12c>
    80003b7c:	143025f3          	csrr	a1,stval
    80003b80:	00013403          	ld	s0,0(sp)
    80003b84:	00813083          	ld	ra,8(sp)
    80003b88:	00003517          	auipc	a0,0x3
    80003b8c:	61050513          	add	a0,a0,1552 # 80007198 <digits+0x728>
    80003b90:	01010113          	add	sp,sp,16
    80003b94:	a41fd06f          	j	800015d4 <printf>
    80003b98:	00058613          	mv	a2,a1
    80003b9c:	00003517          	auipc	a0,0x3
    80003ba0:	78c50513          	add	a0,a0,1932 # 80007328 <digits+0x8b8>
    80003ba4:	00070593          	mv	a1,a4
    80003ba8:	a2dfd06f          	j	800015d4 <printf>
    80003bac:	00003517          	auipc	a0,0x3
    80003bb0:	63c50513          	add	a0,a0,1596 # 800071e8 <digits+0x778>
    80003bb4:	fa9ff06f          	j	80003b5c <handle_exception+0x134>

0000000080003bb8 <kerneltrap>:
    80003bb8:	ff010113          	add	sp,sp,-16
    80003bbc:	00113423          	sd	ra,8(sp)
    80003bc0:	00813023          	sd	s0,0(sp)
    80003bc4:	14202473          	csrr	s0,scause
    80003bc8:	14102573          	csrr	a0,sepc
    80003bcc:	00044a63          	bltz	s0,80003be0 <kerneltrap+0x28>
    80003bd0:	00013403          	ld	s0,0(sp)
    80003bd4:	00813083          	ld	ra,8(sp)
    80003bd8:	01010113          	add	sp,sp,16
    80003bdc:	e4dff06f          	j	80003a28 <handle_exception>
    80003be0:	c11ff0ef          	jal	800037f0 <devintr>
    80003be4:	00050a63          	beqz	a0,80003bf8 <kerneltrap+0x40>
    80003be8:	00813083          	ld	ra,8(sp)
    80003bec:	00013403          	ld	s0,0(sp)
    80003bf0:	01010113          	add	sp,sp,16
    80003bf4:	00008067          	ret
    80003bf8:	00f47593          	and	a1,s0,15
    80003bfc:	00013403          	ld	s0,0(sp)
    80003c00:	00813083          	ld	ra,8(sp)
    80003c04:	00003517          	auipc	a0,0x3
    80003c08:	74c50513          	add	a0,a0,1868 # 80007350 <digits+0x8e0>
    80003c0c:	01010113          	add	sp,sp,16
    80003c10:	9c5fd06f          	j	800015d4 <printf>

0000000080003c14 <handle_trap_page_fault>:
    80003c14:	00058793          	mv	a5,a1
    80003c18:	02050263          	beqz	a0,80003c3c <handle_trap_page_fault+0x28>
    80003c1c:	143025f3          	csrr	a1,stval
    80003c20:	00078863          	beqz	a5,80003c30 <handle_trap_page_fault+0x1c>
    80003c24:	00003517          	auipc	a0,0x3
    80003c28:	57450513          	add	a0,a0,1396 # 80007198 <digits+0x728>
    80003c2c:	9a9fd06f          	j	800015d4 <printf>
    80003c30:	00003517          	auipc	a0,0x3
    80003c34:	50050513          	add	a0,a0,1280 # 80007130 <digits+0x6c0>
    80003c38:	99dfd06f          	j	800015d4 <printf>
    80003c3c:	00003517          	auipc	a0,0x3
    80003c40:	4bc50513          	add	a0,a0,1212 # 800070f8 <digits+0x688>
    80003c44:	d01fd06f          	j	80001944 <uart_puts>

0000000080003c48 <handle_illegal_instruction>:
    80003c48:	00050a63          	beqz	a0,80003c5c <handle_illegal_instruction+0x14>
    80003c4c:	10053583          	ld	a1,256(a0)
    80003c50:	00003517          	auipc	a0,0x3
    80003c54:	5d050513          	add	a0,a0,1488 # 80007220 <digits+0x7b0>
    80003c58:	97dfd06f          	j	800015d4 <printf>
    80003c5c:	00003517          	auipc	a0,0x3
    80003c60:	58c50513          	add	a0,a0,1420 # 800071e8 <digits+0x778>
    80003c64:	ce1fd06f          	j	80001944 <uart_puts>

0000000080003c68 <handle_breakpoint>:
    80003c68:	00050a63          	beqz	a0,80003c7c <handle_breakpoint+0x14>
    80003c6c:	10053583          	ld	a1,256(a0)
    80003c70:	00003517          	auipc	a0,0x3
    80003c74:	63050513          	add	a0,a0,1584 # 800072a0 <digits+0x830>
    80003c78:	95dfd06f          	j	800015d4 <printf>
    80003c7c:	00003517          	auipc	a0,0x3
    80003c80:	5f450513          	add	a0,a0,1524 # 80007270 <digits+0x800>
    80003c84:	cc1fd06f          	j	80001944 <uart_puts>

0000000080003c88 <free_proc.part.0>:
    80003c88:	fe010113          	add	sp,sp,-32
    80003c8c:	00813823          	sd	s0,16(sp)
    80003c90:	00913423          	sd	s1,8(sp)
    80003c94:	00113c23          	sd	ra,24(sp)
    80003c98:	00050493          	mv	s1,a0
    80003c9c:	00422417          	auipc	s0,0x422
    80003ca0:	5c440413          	add	s0,s0,1476 # 80426260 <proc_lock>
    80003ca4:	00100713          	li	a4,1
    80003ca8:	00070793          	mv	a5,a4
    80003cac:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80003cb0:	0007879b          	sext.w	a5,a5
    80003cb4:	fe079ae3          	bnez	a5,80003ca8 <free_proc.part.0+0x20>
    80003cb8:	0304b503          	ld	a0,48(s1)
    80003cbc:	00050663          	beqz	a0,80003cc8 <free_proc.part.0+0x40>
    80003cc0:	93dff0ef          	jal	800035fc <free_trapframe>
    80003cc4:	0204b823          	sd	zero,48(s1)
    80003cc8:	0284b503          	ld	a0,40(s1)
    80003ccc:	00050663          	beqz	a0,80003cd8 <free_proc.part.0+0x50>
    80003cd0:	d3dfd0ef          	jal	80001a0c <free_page>
    80003cd4:	0204b423          	sd	zero,40(s1)
    80003cd8:	0184b503          	ld	a0,24(s1)
    80003cdc:	00050663          	beqz	a0,80003ce8 <free_proc.part.0+0x60>
    80003ce0:	9d4fe0ef          	jal	80001eb4 <destroy_pagetable>
    80003ce4:	0004bc23          	sd	zero,24(s1)
    80003ce8:	0004b023          	sd	zero,0(s1)
    80003cec:	0f50000f          	fence	iorw,ow
    80003cf0:	0804202f          	amoswap.w	zero,zero,(s0)
    80003cf4:	01813083          	ld	ra,24(sp)
    80003cf8:	01013403          	ld	s0,16(sp)
    80003cfc:	00813483          	ld	s1,8(sp)
    80003d00:	02010113          	add	sp,sp,32
    80003d04:	00008067          	ret

0000000080003d08 <proc_init>:
    80003d08:	ff010113          	add	sp,sp,-16
    80003d0c:	00003517          	auipc	a0,0x3
    80003d10:	6b450513          	add	a0,a0,1716 # 800073c0 <digits+0x950>
    80003d14:	00113423          	sd	ra,8(sp)
    80003d18:	c2dfd0ef          	jal	80001944 <uart_puts>
    80003d1c:	00422797          	auipc	a5,0x422
    80003d20:	88c78793          	add	a5,a5,-1908 # 804255a8 <proc>
    80003d24:	00422697          	auipc	a3,0x422
    80003d28:	50468693          	add	a3,a3,1284 # 80426228 <mem_end>
    80003d2c:	00078713          	mv	a4,a5
    80003d30:	00073023          	sd	zero,0(a4)
    80003d34:	00870713          	add	a4,a4,8
    80003d38:	fed71ce3          	bne	a4,a3,80003d30 <proc_init+0x28>
    80003d3c:	00100713          	li	a4,1
    80003d40:	00004617          	auipc	a2,0x4
    80003d44:	2ce62023          	sw	a4,704(a2) # 80008000 <nextpid>
    80003d48:	00422717          	auipc	a4,0x422
    80003d4c:	52073023          	sd	zero,1312(a4) # 80426268 <current_proc>
    80003d50:	0007a023          	sw	zero,0(a5)
    80003d54:	0007a223          	sw	zero,4(a5)
    80003d58:	0007a423          	sw	zero,8(a5)
    80003d5c:	0c878793          	add	a5,a5,200
    80003d60:	fed798e3          	bne	a5,a3,80003d50 <proc_init+0x48>
    80003d64:	00813083          	ld	ra,8(sp)
    80003d68:	00003517          	auipc	a0,0x3
    80003d6c:	68050513          	add	a0,a0,1664 # 800073e8 <digits+0x978>
    80003d70:	01010113          	add	sp,sp,16
    80003d74:	bd1fd06f          	j	80001944 <uart_puts>

0000000080003d78 <alloc_proc>:
    80003d78:	fd010113          	add	sp,sp,-48
    80003d7c:	00913c23          	sd	s1,24(sp)
    80003d80:	02113423          	sd	ra,40(sp)
    80003d84:	02813023          	sd	s0,32(sp)
    80003d88:	01213823          	sd	s2,16(sp)
    80003d8c:	01313423          	sd	s3,8(sp)
    80003d90:	01413023          	sd	s4,0(sp)
    80003d94:	00422497          	auipc	s1,0x422
    80003d98:	4cc48493          	add	s1,s1,1228 # 80426260 <proc_lock>
    80003d9c:	00100713          	li	a4,1
    80003da0:	00070793          	mv	a5,a4
    80003da4:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003da8:	0007879b          	sext.w	a5,a5
    80003dac:	fe079ae3          	bnez	a5,80003da0 <alloc_proc+0x28>
    80003db0:	00421997          	auipc	s3,0x421
    80003db4:	7f898993          	add	s3,s3,2040 # 804255a8 <proc>
    80003db8:	00098793          	mv	a5,s3
    80003dbc:	00000413          	li	s0,0
    80003dc0:	01000693          	li	a3,16
    80003dc4:	0007a703          	lw	a4,0(a5)
    80003dc8:	0c878793          	add	a5,a5,200
    80003dcc:	02070463          	beqz	a4,80003df4 <alloc_proc+0x7c>
    80003dd0:	0014041b          	addw	s0,s0,1
    80003dd4:	fed418e3          	bne	s0,a3,80003dc4 <alloc_proc+0x4c>
    80003dd8:	0f50000f          	fence	iorw,ow
    80003ddc:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003de0:	00003517          	auipc	a0,0x3
    80003de4:	6a850513          	add	a0,a0,1704 # 80007488 <digits+0xa18>
    80003de8:	b5dfd0ef          	jal	80001944 <uart_puts>
    80003dec:	00000a13          	li	s4,0
    80003df0:	09c0006f          	j	80003e8c <alloc_proc+0x114>
    80003df4:	0c800913          	li	s2,200
    80003df8:	03240933          	mul	s2,s0,s2
    80003dfc:	00004717          	auipc	a4,0x4
    80003e00:	20470713          	add	a4,a4,516 # 80008000 <nextpid>
    80003e04:	00072783          	lw	a5,0(a4)
    80003e08:	0017869b          	addw	a3,a5,1
    80003e0c:	00d72023          	sw	a3,0(a4)
    80003e10:	00100713          	li	a4,1
    80003e14:	01298a33          	add	s4,s3,s2
    80003e18:	000a3423          	sd	zero,8(s4) # fffffffffffff008 <bss_end+0xffffffff7fbd8d98>
    80003e1c:	00ea2023          	sw	a4,0(s4)
    80003e20:	00fa2223          	sw	a5,4(s4)
    80003e24:	000a2823          	sw	zero,16(s4)
    80003e28:	f74ff0ef          	jal	8000359c <alloc_trapframe>
    80003e2c:	02aa3823          	sd	a0,48(s4)
    80003e30:	08050063          	beqz	a0,80003eb0 <alloc_proc+0x138>
    80003e34:	bbdfd0ef          	jal	800019f0 <alloc_page>
    80003e38:	04090793          	add	a5,s2,64
    80003e3c:	00f987b3          	add	a5,s3,a5
    80003e40:	02aa3423          	sd	a0,40(s4)
    80003e44:	07078713          	add	a4,a5,112
    80003e48:	08050263          	beqz	a0,80003ecc <alloc_proc+0x154>
    80003e4c:	0007b023          	sd	zero,0(a5)
    80003e50:	00878793          	add	a5,a5,8
    80003e54:	fee79ce3          	bne	a5,a4,80003e4c <alloc_proc+0xd4>
    80003e58:	0c800793          	li	a5,200
    80003e5c:	02f40433          	mul	s0,s0,a5
    80003e60:	00001737          	lui	a4,0x1
    80003e64:	00003517          	auipc	a0,0x3
    80003e68:	5fc50513          	add	a0,a0,1532 # 80007460 <digits+0x9f0>
    80003e6c:	008989b3          	add	s3,s3,s0
    80003e70:	0289b783          	ld	a5,40(s3)
    80003e74:	0049a583          	lw	a1,4(s3)
    80003e78:	00e787b3          	add	a5,a5,a4
    80003e7c:	04f9b423          	sd	a5,72(s3)
    80003e80:	f54fd0ef          	jal	800015d4 <printf>
    80003e84:	0f50000f          	fence	iorw,ow
    80003e88:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003e8c:	02813083          	ld	ra,40(sp)
    80003e90:	02013403          	ld	s0,32(sp)
    80003e94:	01813483          	ld	s1,24(sp)
    80003e98:	01013903          	ld	s2,16(sp)
    80003e9c:	00813983          	ld	s3,8(sp)
    80003ea0:	000a0513          	mv	a0,s4
    80003ea4:	00013a03          	ld	s4,0(sp)
    80003ea8:	03010113          	add	sp,sp,48
    80003eac:	00008067          	ret
    80003eb0:	00003517          	auipc	a0,0x3
    80003eb4:	56050513          	add	a0,a0,1376 # 80007410 <digits+0x9a0>
    80003eb8:	a8dfd0ef          	jal	80001944 <uart_puts>
    80003ebc:	0f50000f          	fence	iorw,ow
    80003ec0:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003ec4:	00000a13          	li	s4,0
    80003ec8:	fc5ff06f          	j	80003e8c <alloc_proc+0x114>
    80003ecc:	00003517          	auipc	a0,0x3
    80003ed0:	56c50513          	add	a0,a0,1388 # 80007438 <digits+0x9c8>
    80003ed4:	a71fd0ef          	jal	80001944 <uart_puts>
    80003ed8:	030a3503          	ld	a0,48(s4)
    80003edc:	f20ff0ef          	jal	800035fc <free_trapframe>
    80003ee0:	0f50000f          	fence	iorw,ow
    80003ee4:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003ee8:	00000a13          	li	s4,0
    80003eec:	fa1ff06f          	j	80003e8c <alloc_proc+0x114>

0000000080003ef0 <free_proc>:
    80003ef0:	00050463          	beqz	a0,80003ef8 <free_proc+0x8>
    80003ef4:	d95ff06f          	j	80003c88 <free_proc.part.0>
    80003ef8:	00008067          	ret

0000000080003efc <find_proc>:
    80003efc:	00421597          	auipc	a1,0x421
    80003f00:	6ac58593          	add	a1,a1,1708 # 804255a8 <proc>
    80003f04:	00058793          	mv	a5,a1
    80003f08:	00000713          	li	a4,0
    80003f0c:	01000613          	li	a2,16
    80003f10:	0100006f          	j	80003f20 <find_proc+0x24>
    80003f14:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80003f18:	0c878793          	add	a5,a5,200
    80003f1c:	02c70263          	beq	a4,a2,80003f40 <find_proc+0x44>
    80003f20:	0047a683          	lw	a3,4(a5)
    80003f24:	fea698e3          	bne	a3,a0,80003f14 <find_proc+0x18>
    80003f28:	0007a683          	lw	a3,0(a5)
    80003f2c:	fe0684e3          	beqz	a3,80003f14 <find_proc+0x18>
    80003f30:	0c800793          	li	a5,200
    80003f34:	02f70733          	mul	a4,a4,a5
    80003f38:	00e58533          	add	a0,a1,a4
    80003f3c:	00008067          	ret
    80003f40:	00000513          	li	a0,0
    80003f44:	00008067          	ret

0000000080003f48 <proc_set_kernel_stack>:
    80003f48:	00050a63          	beqz	a0,80003f5c <proc_set_kernel_stack+0x14>
    80003f4c:	000017b7          	lui	a5,0x1
    80003f50:	00f587b3          	add	a5,a1,a5
    80003f54:	02b53423          	sd	a1,40(a0)
    80003f58:	04f53423          	sd	a5,72(a0)
    80003f5c:	00008067          	ret

0000000080003f60 <proc_mark_runnable>:
    80003f60:	02050263          	beqz	a0,80003f84 <proc_mark_runnable+0x24>
    80003f64:	00052783          	lw	a5,0(a0)
    80003f68:	00100713          	li	a4,1
    80003f6c:	ffe7869b          	addw	a3,a5,-2 # ffe <_entry-0x7ffff002>
    80003f70:	00d77a63          	bgeu	a4,a3,80003f84 <proc_mark_runnable+0x24>
    80003f74:	00500713          	li	a4,5
    80003f78:	00e78663          	beq	a5,a4,80003f84 <proc_mark_runnable+0x24>
    80003f7c:	00200793          	li	a5,2
    80003f80:	00f52023          	sw	a5,0(a0)
    80003f84:	00008067          	ret

0000000080003f88 <proc_mark_sleeping>:
    80003f88:	00050863          	beqz	a0,80003f98 <proc_mark_sleeping+0x10>
    80003f8c:	00052703          	lw	a4,0(a0)
    80003f90:	00300793          	li	a5,3
    80003f94:	00f70463          	beq	a4,a5,80003f9c <proc_mark_sleeping+0x14>
    80003f98:	00008067          	ret
    80003f9c:	00400793          	li	a5,4
    80003fa0:	00f52023          	sw	a5,0(a0)
    80003fa4:	0ab53c23          	sd	a1,184(a0)
    80003fa8:	00008067          	ret

0000000080003fac <proc_mark_zombie>:
    80003fac:	00050c63          	beqz	a0,80003fc4 <proc_mark_zombie+0x18>
    80003fb0:	00052703          	lw	a4,0(a0)
    80003fb4:	00500793          	li	a5,5
    80003fb8:	00f70663          	beq	a4,a5,80003fc4 <proc_mark_zombie+0x18>
    80003fbc:	00f52023          	sw	a5,0(a0)
    80003fc0:	00b52623          	sw	a1,12(a0)
    80003fc4:	00008067          	ret

0000000080003fc8 <get_pid>:
    80003fc8:	00422797          	auipc	a5,0x422
    80003fcc:	2a07b783          	ld	a5,672(a5) # 80426268 <current_proc>
    80003fd0:	00078663          	beqz	a5,80003fdc <get_pid+0x14>
    80003fd4:	0047a503          	lw	a0,4(a5)
    80003fd8:	00008067          	ret
    80003fdc:	fff00513          	li	a0,-1
    80003fe0:	00008067          	ret

0000000080003fe4 <get_current_proc>:
    80003fe4:	00422517          	auipc	a0,0x422
    80003fe8:	28453503          	ld	a0,644(a0) # 80426268 <current_proc>
    80003fec:	00008067          	ret

0000000080003ff0 <set_current_proc>:
    80003ff0:	00422797          	auipc	a5,0x422
    80003ff4:	26a7bc23          	sd	a0,632(a5) # 80426268 <current_proc>
    80003ff8:	00008067          	ret

0000000080003ffc <scheduler>:
    80003ffc:	f9010113          	add	sp,sp,-112
    80004000:	06813023          	sd	s0,96(sp)
    80004004:	00422417          	auipc	s0,0x422
    80004008:	25840413          	add	s0,s0,600 # 8042625c <scheduler_initialized>
    8000400c:	00042783          	lw	a5,0(s0)
    80004010:	06113423          	sd	ra,104(sp)
    80004014:	04913c23          	sd	s1,88(sp)
    80004018:	05213823          	sd	s2,80(sp)
    8000401c:	05313423          	sd	s3,72(sp)
    80004020:	05413023          	sd	s4,64(sp)
    80004024:	03513c23          	sd	s5,56(sp)
    80004028:	03613823          	sd	s6,48(sp)
    8000402c:	03713423          	sd	s7,40(sp)
    80004030:	03813023          	sd	s8,32(sp)
    80004034:	01913c23          	sd	s9,24(sp)
    80004038:	01a13823          	sd	s10,16(sp)
    8000403c:	01b13423          	sd	s11,8(sp)
    80004040:	0e078a63          	beqz	a5,80004134 <scheduler+0x138>
    80004044:	00421797          	auipc	a5,0x421
    80004048:	4e07b223          	sd	zero,1252(a5) # 80425528 <cpus>
    8000404c:	00422497          	auipc	s1,0x422
    80004050:	20c48493          	add	s1,s1,524 # 80426258 <last_index.0>
    80004054:	dfcff0ef          	jal	80003650 <intr_off>
    80004058:	00421c97          	auipc	s9,0x421
    8000405c:	550c8c93          	add	s9,s9,1360 # 804255a8 <proc>
    80004060:	00421b17          	auipc	s6,0x421
    80004064:	4c8b0b13          	add	s6,s6,1224 # 80425528 <cpus>
    80004068:	00422a97          	auipc	s5,0x422
    8000406c:	200a8a93          	add	s5,s5,512 # 80426268 <current_proc>
    80004070:	0c800d93          	li	s11,200
    80004074:	00200d13          	li	s10,2
    80004078:	00300a13          	li	s4,3
    8000407c:	00003997          	auipc	s3,0x3
    80004080:	44c98993          	add	s3,s3,1100 # 800074c8 <digits+0xa58>
    80004084:	00421917          	auipc	s2,0x421
    80004088:	4b490913          	add	s2,s2,1204 # 80425538 <scheduler_context>
    8000408c:	00003b97          	auipc	s7,0x3
    80004090:	46cb8b93          	add	s7,s7,1132 # 800074f8 <digits+0xa88>
    80004094:	dacff0ef          	jal	80003640 <intr_on>
    80004098:	0004a783          	lw	a5,0(s1)
    8000409c:	0107861b          	addw	a2,a5,16
    800040a0:	41f7d71b          	sraw	a4,a5,0x1f
    800040a4:	01c7571b          	srlw	a4,a4,0x1c
    800040a8:	00f7043b          	addw	s0,a4,a5
    800040ac:	00f47413          	and	s0,s0,15
    800040b0:	40e40c3b          	subw	s8,s0,a4
    800040b4:	000c0413          	mv	s0,s8
    800040b8:	03bc0c33          	mul	s8,s8,s11
    800040bc:	0017879b          	addw	a5,a5,1
    800040c0:	018c8733          	add	a4,s9,s8
    800040c4:	00072683          	lw	a3,0(a4)
    800040c8:	01a68e63          	beq	a3,s10,800040e4 <scheduler+0xe8>
    800040cc:	fcf61ae3          	bne	a2,a5,800040a0 <scheduler+0xa4>
    800040d0:	c58ff0ef          	jal	80003528 <get_ticks>
    800040d4:	00050593          	mv	a1,a0
    800040d8:	000b8513          	mv	a0,s7
    800040dc:	cf8fd0ef          	jal	800015d4 <printf>
    800040e0:	fb5ff06f          	j	80004094 <scheduler+0x98>
    800040e4:	00472583          	lw	a1,4(a4)
    800040e8:	00098513          	mv	a0,s3
    800040ec:	01472023          	sw	s4,0(a4)
    800040f0:	00eb3023          	sd	a4,0(s6)
    800040f4:	00eab023          	sd	a4,0(s5)
    800040f8:	cdcfd0ef          	jal	800015d4 <printf>
    800040fc:	d54ff0ef          	jal	80003650 <intr_off>
    80004100:	040c0593          	add	a1,s8,64
    80004104:	00bc85b3          	add	a1,s9,a1
    80004108:	00090513          	mv	a0,s2
    8000410c:	105000ef          	jal	80004a10 <switch_context>
    80004110:	0014041b          	addw	s0,s0,1
    80004114:	d2cff0ef          	jal	80003640 <intr_on>
    80004118:	41f4579b          	sraw	a5,s0,0x1f
    8000411c:	01c7d79b          	srlw	a5,a5,0x1c
    80004120:	00f4043b          	addw	s0,s0,a5
    80004124:	00f47413          	and	s0,s0,15
    80004128:	40f4043b          	subw	s0,s0,a5
    8000412c:	0084a023          	sw	s0,0(s1)
    80004130:	f65ff06f          	j	80004094 <scheduler+0x98>
    80004134:	00003517          	auipc	a0,0x3
    80004138:	37450513          	add	a0,a0,884 # 800074a8 <digits+0xa38>
    8000413c:	809fd0ef          	jal	80001944 <uart_puts>
    80004140:	00100793          	li	a5,1
    80004144:	00f42023          	sw	a5,0(s0)
    80004148:	efdff06f          	j	80004044 <scheduler+0x48>

000000008000414c <yield>:
    8000414c:	ff010113          	add	sp,sp,-16
    80004150:	00813023          	sd	s0,0(sp)
    80004154:	00113423          	sd	ra,8(sp)
    80004158:	00422417          	auipc	s0,0x422
    8000415c:	11043403          	ld	s0,272(s0) # 80426268 <current_proc>
    80004160:	06040a63          	beqz	s0,800041d4 <yield+0x88>
    80004164:	cecff0ef          	jal	80003650 <intr_off>
    80004168:	00422717          	auipc	a4,0x422
    8000416c:	0f870713          	add	a4,a4,248 # 80426260 <proc_lock>
    80004170:	00100693          	li	a3,1
    80004174:	00068793          	mv	a5,a3
    80004178:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    8000417c:	0007879b          	sext.w	a5,a5
    80004180:	fe079ae3          	bnez	a5,80004174 <yield+0x28>
    80004184:	00042683          	lw	a3,0(s0)
    80004188:	00300793          	li	a5,3
    8000418c:	02f68e63          	beq	a3,a5,800041c8 <yield+0x7c>
    80004190:	0f50000f          	fence	iorw,ow
    80004194:	0807202f          	amoswap.w	zero,zero,(a4)
    80004198:	00442583          	lw	a1,4(s0)
    8000419c:	00003517          	auipc	a0,0x3
    800041a0:	38450513          	add	a0,a0,900 # 80007520 <digits+0xab0>
    800041a4:	c30fd0ef          	jal	800015d4 <printf>
    800041a8:	04040513          	add	a0,s0,64
    800041ac:	00421597          	auipc	a1,0x421
    800041b0:	38c58593          	add	a1,a1,908 # 80425538 <scheduler_context>
    800041b4:	05d000ef          	jal	80004a10 <switch_context>
    800041b8:	00013403          	ld	s0,0(sp)
    800041bc:	00813083          	ld	ra,8(sp)
    800041c0:	01010113          	add	sp,sp,16
    800041c4:	c7cff06f          	j	80003640 <intr_on>
    800041c8:	00200793          	li	a5,2
    800041cc:	00f42023          	sw	a5,0(s0)
    800041d0:	fc1ff06f          	j	80004190 <yield+0x44>
    800041d4:	00813083          	ld	ra,8(sp)
    800041d8:	00013403          	ld	s0,0(sp)
    800041dc:	01010113          	add	sp,sp,16
    800041e0:	00008067          	ret

00000000800041e4 <fork>:
    800041e4:	fe010113          	add	sp,sp,-32
    800041e8:	00913423          	sd	s1,8(sp)
    800041ec:	00113c23          	sd	ra,24(sp)
    800041f0:	00813823          	sd	s0,16(sp)
    800041f4:	00422497          	auipc	s1,0x422
    800041f8:	0744b483          	ld	s1,116(s1) # 80426268 <current_proc>
    800041fc:	08048a63          	beqz	s1,80004290 <fork+0xac>
    80004200:	b79ff0ef          	jal	80003d78 <alloc_proc>
    80004204:	00050413          	mv	s0,a0
    80004208:	08050e63          	beqz	a0,800042a4 <fork+0xc0>
    8000420c:	0044a703          	lw	a4,4(s1)
    80004210:	0184b783          	ld	a5,24(s1)
    80004214:	0a953823          	sd	s1,176(a0)
    80004218:	00e52423          	sw	a4,8(a0)
    8000421c:	00078863          	beqz	a5,8000422c <fork+0x48>
    80004220:	99dfd0ef          	jal	80001bbc <create_pagetable>
    80004224:	00a43c23          	sd	a0,24(s0)
    80004228:	08050863          	beqz	a0,800042b8 <fork+0xd4>
    8000422c:	0304b783          	ld	a5,48(s1)
    80004230:	02078663          	beqz	a5,8000425c <fork+0x78>
    80004234:	03043703          	ld	a4,48(s0)
    80004238:	02070263          	beqz	a4,8000425c <fork+0x78>
    8000423c:	11078613          	add	a2,a5,272
    80004240:	0007c683          	lbu	a3,0(a5)
    80004244:	00178793          	add	a5,a5,1
    80004248:	00170713          	add	a4,a4,1
    8000424c:	fed70fa3          	sb	a3,-1(a4)
    80004250:	fec798e3          	bne	a5,a2,80004240 <fork+0x5c>
    80004254:	03043783          	ld	a5,48(s0)
    80004258:	0407b823          	sd	zero,80(a5)
    8000425c:	0044a603          	lw	a2,4(s1)
    80004260:	00442583          	lw	a1,4(s0)
    80004264:	00200793          	li	a5,2
    80004268:	00f42023          	sw	a5,0(s0)
    8000426c:	00003517          	auipc	a0,0x3
    80004270:	32c50513          	add	a0,a0,812 # 80007598 <digits+0xb28>
    80004274:	b60fd0ef          	jal	800015d4 <printf>
    80004278:	00442503          	lw	a0,4(s0)
    8000427c:	01813083          	ld	ra,24(sp)
    80004280:	01013403          	ld	s0,16(sp)
    80004284:	00813483          	ld	s1,8(sp)
    80004288:	02010113          	add	sp,sp,32
    8000428c:	00008067          	ret
    80004290:	00003517          	auipc	a0,0x3
    80004294:	2b050513          	add	a0,a0,688 # 80007540 <digits+0xad0>
    80004298:	eacfd0ef          	jal	80001944 <uart_puts>
    8000429c:	fff00513          	li	a0,-1
    800042a0:	fddff06f          	j	8000427c <fork+0x98>
    800042a4:	00003517          	auipc	a0,0x3
    800042a8:	2c450513          	add	a0,a0,708 # 80007568 <digits+0xaf8>
    800042ac:	e98fd0ef          	jal	80001944 <uart_puts>
    800042b0:	fff00513          	li	a0,-1
    800042b4:	fc9ff06f          	j	8000427c <fork+0x98>
    800042b8:	00040513          	mv	a0,s0
    800042bc:	9cdff0ef          	jal	80003c88 <free_proc.part.0>
    800042c0:	fff00513          	li	a0,-1
    800042c4:	fb9ff06f          	j	8000427c <fork+0x98>

00000000800042c8 <exit>:
    800042c8:	00422697          	auipc	a3,0x422
    800042cc:	fa06b683          	ld	a3,-96(a3) # 80426268 <current_proc>
    800042d0:	08068e63          	beqz	a3,8000436c <exit+0xa4>
    800042d4:	ff010113          	add	sp,sp,-16
    800042d8:	00813023          	sd	s0,0(sp)
    800042dc:	00113423          	sd	ra,8(sp)
    800042e0:	00050613          	mv	a2,a0
    800042e4:	00422417          	auipc	s0,0x422
    800042e8:	f7c40413          	add	s0,s0,-132 # 80426260 <proc_lock>
    800042ec:	00100713          	li	a4,1
    800042f0:	00070793          	mv	a5,a4
    800042f4:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800042f8:	0007879b          	sext.w	a5,a5
    800042fc:	fe079ae3          	bnez	a5,800042f0 <exit+0x28>
    80004300:	00500793          	li	a5,5
    80004304:	00f6a023          	sw	a5,0(a3)
    80004308:	00c6a623          	sw	a2,12(a3)
    8000430c:	00421797          	auipc	a5,0x421
    80004310:	34c78793          	add	a5,a5,844 # 80425658 <proc+0xb0>
    80004314:	00422597          	auipc	a1,0x422
    80004318:	fc458593          	add	a1,a1,-60 # 804262d8 <bss_end+0x68>
    8000431c:	00100513          	li	a0,1
    80004320:	00c0006f          	j	8000432c <exit+0x64>
    80004324:	0c878793          	add	a5,a5,200
    80004328:	00b78e63          	beq	a5,a1,80004344 <exit+0x7c>
    8000432c:	0007b703          	ld	a4,0(a5)
    80004330:	fed71ae3          	bne	a4,a3,80004324 <exit+0x5c>
    80004334:	0007b023          	sd	zero,0(a5)
    80004338:	f4a7ac23          	sw	a0,-168(a5)
    8000433c:	0c878793          	add	a5,a5,200
    80004340:	feb796e3          	bne	a5,a1,8000432c <exit+0x64>
    80004344:	0046a583          	lw	a1,4(a3)
    80004348:	00003517          	auipc	a0,0x3
    8000434c:	28050513          	add	a0,a0,640 # 800075c8 <digits+0xb58>
    80004350:	a84fd0ef          	jal	800015d4 <printf>
    80004354:	0f50000f          	fence	iorw,ow
    80004358:	0804202f          	amoswap.w	zero,zero,(s0)
    8000435c:	00013403          	ld	s0,0(sp)
    80004360:	00813083          	ld	ra,8(sp)
    80004364:	01010113          	add	sp,sp,16
    80004368:	de5ff06f          	j	8000414c <yield>
    8000436c:	00008067          	ret

0000000080004370 <wait>:
    80004370:	fb010113          	add	sp,sp,-80
    80004374:	01813023          	sd	s8,0(sp)
    80004378:	00422c17          	auipc	s8,0x422
    8000437c:	ef0c0c13          	add	s8,s8,-272 # 80426268 <current_proc>
    80004380:	02913c23          	sd	s1,56(sp)
    80004384:	000c3483          	ld	s1,0(s8)
    80004388:	04113423          	sd	ra,72(sp)
    8000438c:	04813023          	sd	s0,64(sp)
    80004390:	03213823          	sd	s2,48(sp)
    80004394:	03313423          	sd	s3,40(sp)
    80004398:	03413023          	sd	s4,32(sp)
    8000439c:	01513c23          	sd	s5,24(sp)
    800043a0:	01613823          	sd	s6,16(sp)
    800043a4:	01713423          	sd	s7,8(sp)
    800043a8:	10048063          	beqz	s1,800044a8 <wait+0x138>
    800043ac:	00050913          	mv	s2,a0
    800043b0:	00422417          	auipc	s0,0x422
    800043b4:	eb040413          	add	s0,s0,-336 # 80426260 <proc_lock>
    800043b8:	00100a13          	li	s4,1
    800043bc:	00500b93          	li	s7,5
    800043c0:	01000a93          	li	s5,16
    800043c4:	00422b17          	auipc	s6,0x422
    800043c8:	e64b0b13          	add	s6,s6,-412 # 80426228 <mem_end>
    800043cc:	00400993          	li	s3,4
    800043d0:	000a0793          	mv	a5,s4
    800043d4:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800043d8:	0007879b          	sext.w	a5,a5
    800043dc:	fe079ae3          	bnez	a5,800043d0 <wait+0x60>
    800043e0:	00421797          	auipc	a5,0x421
    800043e4:	1c878793          	add	a5,a5,456 # 804255a8 <proc>
    800043e8:	00078593          	mv	a1,a5
    800043ec:	00078713          	mv	a4,a5
    800043f0:	00000693          	li	a3,0
    800043f4:	0100006f          	j	80004404 <wait+0x94>
    800043f8:	0016869b          	addw	a3,a3,1
    800043fc:	0c870713          	add	a4,a4,200
    80004400:	09568863          	beq	a3,s5,80004490 <wait+0x120>
    80004404:	0b073603          	ld	a2,176(a4)
    80004408:	fe9618e3          	bne	a2,s1,800043f8 <wait+0x88>
    8000440c:	00072603          	lw	a2,0(a4)
    80004410:	ff7614e3          	bne	a2,s7,800043f8 <wait+0x88>
    80004414:	0c800793          	li	a5,200
    80004418:	02f686b3          	mul	a3,a3,a5
    8000441c:	00d58533          	add	a0,a1,a3
    80004420:	00452483          	lw	s1,4(a0)
    80004424:	00090663          	beqz	s2,80004430 <wait+0xc0>
    80004428:	00c52783          	lw	a5,12(a0)
    8000442c:	00f92023          	sw	a5,0(s2)
    80004430:	859ff0ef          	jal	80003c88 <free_proc.part.0>
    80004434:	00048593          	mv	a1,s1
    80004438:	00003517          	auipc	a0,0x3
    8000443c:	1c050513          	add	a0,a0,448 # 800075f8 <digits+0xb88>
    80004440:	994fd0ef          	jal	800015d4 <printf>
    80004444:	0f50000f          	fence	iorw,ow
    80004448:	0804202f          	amoswap.w	zero,zero,(s0)
    8000444c:	04813083          	ld	ra,72(sp)
    80004450:	04013403          	ld	s0,64(sp)
    80004454:	03013903          	ld	s2,48(sp)
    80004458:	02813983          	ld	s3,40(sp)
    8000445c:	02013a03          	ld	s4,32(sp)
    80004460:	01813a83          	ld	s5,24(sp)
    80004464:	01013b03          	ld	s6,16(sp)
    80004468:	00813b83          	ld	s7,8(sp)
    8000446c:	00013c03          	ld	s8,0(sp)
    80004470:	00048513          	mv	a0,s1
    80004474:	03813483          	ld	s1,56(sp)
    80004478:	05010113          	add	sp,sp,80
    8000447c:	00008067          	ret
    80004480:	0007a703          	lw	a4,0(a5)
    80004484:	02071663          	bnez	a4,800044b0 <wait+0x140>
    80004488:	0c878793          	add	a5,a5,200
    8000448c:	01678a63          	beq	a5,s6,800044a0 <wait+0x130>
    80004490:	0b07b703          	ld	a4,176(a5)
    80004494:	fe9706e3          	beq	a4,s1,80004480 <wait+0x110>
    80004498:	0c878793          	add	a5,a5,200
    8000449c:	ff679ae3          	bne	a5,s6,80004490 <wait+0x120>
    800044a0:	0f50000f          	fence	iorw,ow
    800044a4:	0804202f          	amoswap.w	zero,zero,(s0)
    800044a8:	fff00493          	li	s1,-1
    800044ac:	fa1ff06f          	j	8000444c <wait+0xdc>
    800044b0:	0f50000f          	fence	iorw,ow
    800044b4:	0804202f          	amoswap.w	zero,zero,(s0)
    800044b8:	000c3703          	ld	a4,0(s8)
    800044bc:	f0070ae3          	beqz	a4,800043d0 <wait+0x60>
    800044c0:	000a0793          	mv	a5,s4
    800044c4:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800044c8:	0007879b          	sext.w	a5,a5
    800044cc:	fe079ae3          	bnez	a5,800044c0 <wait+0x150>
    800044d0:	01372023          	sw	s3,0(a4)
    800044d4:	0a973c23          	sd	s1,184(a4)
    800044d8:	0f50000f          	fence	iorw,ow
    800044dc:	0804202f          	amoswap.w	zero,zero,(s0)
    800044e0:	c6dff0ef          	jal	8000414c <yield>
    800044e4:	eedff06f          	j	800043d0 <wait+0x60>

00000000800044e8 <kill>:
    800044e8:	00421597          	auipc	a1,0x421
    800044ec:	0c058593          	add	a1,a1,192 # 804255a8 <proc>
    800044f0:	00058793          	mv	a5,a1
    800044f4:	00000713          	li	a4,0
    800044f8:	01000613          	li	a2,16
    800044fc:	0100006f          	j	8000450c <kill+0x24>
    80004500:	0017071b          	addw	a4,a4,1
    80004504:	0c878793          	add	a5,a5,200
    80004508:	06c70263          	beq	a4,a2,8000456c <kill+0x84>
    8000450c:	0047a683          	lw	a3,4(a5)
    80004510:	fea698e3          	bne	a3,a0,80004500 <kill+0x18>
    80004514:	0007a683          	lw	a3,0(a5)
    80004518:	fe0684e3          	beqz	a3,80004500 <kill+0x18>
    8000451c:	00422697          	auipc	a3,0x422
    80004520:	d4468693          	add	a3,a3,-700 # 80426260 <proc_lock>
    80004524:	00100613          	li	a2,1
    80004528:	00060793          	mv	a5,a2
    8000452c:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80004530:	0007879b          	sext.w	a5,a5
    80004534:	fe079ae3          	bnez	a5,80004528 <kill+0x40>
    80004538:	0c800793          	li	a5,200
    8000453c:	02f70733          	mul	a4,a4,a5
    80004540:	00100613          	li	a2,1
    80004544:	00400793          	li	a5,4
    80004548:	00e585b3          	add	a1,a1,a4
    8000454c:	0005a703          	lw	a4,0(a1)
    80004550:	00c5a823          	sw	a2,16(a1)
    80004554:	00f71663          	bne	a4,a5,80004560 <kill+0x78>
    80004558:	00200793          	li	a5,2
    8000455c:	00f5a023          	sw	a5,0(a1)
    80004560:	0f50000f          	fence	iorw,ow
    80004564:	0806a02f          	amoswap.w	zero,zero,(a3)
    80004568:	00008067          	ret
    8000456c:	00008067          	ret

0000000080004570 <sleep>:
    80004570:	00422617          	auipc	a2,0x422
    80004574:	cf863603          	ld	a2,-776(a2) # 80426268 <current_proc>
    80004578:	02060c63          	beqz	a2,800045b0 <sleep+0x40>
    8000457c:	00422717          	auipc	a4,0x422
    80004580:	ce470713          	add	a4,a4,-796 # 80426260 <proc_lock>
    80004584:	00100693          	li	a3,1
    80004588:	00068793          	mv	a5,a3
    8000458c:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80004590:	0007879b          	sext.w	a5,a5
    80004594:	fe079ae3          	bnez	a5,80004588 <sleep+0x18>
    80004598:	00400793          	li	a5,4
    8000459c:	00f62023          	sw	a5,0(a2)
    800045a0:	0aa63c23          	sd	a0,184(a2)
    800045a4:	0f50000f          	fence	iorw,ow
    800045a8:	0807202f          	amoswap.w	zero,zero,(a4)
    800045ac:	ba1ff06f          	j	8000414c <yield>
    800045b0:	00008067          	ret

00000000800045b4 <wakeup>:
    800045b4:	00422697          	auipc	a3,0x422
    800045b8:	cac68693          	add	a3,a3,-852 # 80426260 <proc_lock>
    800045bc:	00100713          	li	a4,1
    800045c0:	00070793          	mv	a5,a4
    800045c4:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    800045c8:	0007879b          	sext.w	a5,a5
    800045cc:	fe079ae3          	bnez	a5,800045c0 <wakeup+0xc>
    800045d0:	00421797          	auipc	a5,0x421
    800045d4:	fd878793          	add	a5,a5,-40 # 804255a8 <proc>
    800045d8:	00422597          	auipc	a1,0x422
    800045dc:	c5058593          	add	a1,a1,-944 # 80426228 <mem_end>
    800045e0:	00400613          	li	a2,4
    800045e4:	00200813          	li	a6,2
    800045e8:	00c0006f          	j	800045f4 <wakeup+0x40>
    800045ec:	0c878793          	add	a5,a5,200
    800045f0:	02f58063          	beq	a1,a5,80004610 <wakeup+0x5c>
    800045f4:	0007a703          	lw	a4,0(a5)
    800045f8:	fec71ae3          	bne	a4,a2,800045ec <wakeup+0x38>
    800045fc:	0b87b703          	ld	a4,184(a5)
    80004600:	fea716e3          	bne	a4,a0,800045ec <wakeup+0x38>
    80004604:	0107a023          	sw	a6,0(a5)
    80004608:	0c878793          	add	a5,a5,200
    8000460c:	fef594e3          	bne	a1,a5,800045f4 <wakeup+0x40>
    80004610:	0f50000f          	fence	iorw,ow
    80004614:	0806a02f          	amoswap.w	zero,zero,(a3)
    80004618:	00008067          	ret

000000008000461c <wakeup_one>:
    8000461c:	00422617          	auipc	a2,0x422
    80004620:	c4460613          	add	a2,a2,-956 # 80426260 <proc_lock>
    80004624:	00100713          	li	a4,1
    80004628:	00070793          	mv	a5,a4
    8000462c:	0cf627af          	amoswap.w.aq	a5,a5,(a2)
    80004630:	0007879b          	sext.w	a5,a5
    80004634:	fe079ae3          	bnez	a5,80004628 <wakeup_one+0xc>
    80004638:	00421897          	auipc	a7,0x421
    8000463c:	f7088893          	add	a7,a7,-144 # 804255a8 <proc>
    80004640:	00088793          	mv	a5,a7
    80004644:	00000713          	li	a4,0
    80004648:	00400593          	li	a1,4
    8000464c:	01000813          	li	a6,16
    80004650:	0100006f          	j	80004660 <wakeup_one+0x44>
    80004654:	0017071b          	addw	a4,a4,1
    80004658:	0c878793          	add	a5,a5,200
    8000465c:	03070463          	beq	a4,a6,80004684 <wakeup_one+0x68>
    80004660:	0007a683          	lw	a3,0(a5)
    80004664:	feb698e3          	bne	a3,a1,80004654 <wakeup_one+0x38>
    80004668:	0b87b683          	ld	a3,184(a5)
    8000466c:	fea694e3          	bne	a3,a0,80004654 <wakeup_one+0x38>
    80004670:	0c800793          	li	a5,200
    80004674:	02f70733          	mul	a4,a4,a5
    80004678:	00200793          	li	a5,2
    8000467c:	00e888b3          	add	a7,a7,a4
    80004680:	00f8a023          	sw	a5,0(a7)
    80004684:	0f50000f          	fence	iorw,ow
    80004688:	0806202f          	amoswap.w	zero,zero,(a2)
    8000468c:	00008067          	ret

0000000080004690 <machinevec>:
    80004690:	f0810113          	add	sp,sp,-248
    80004694:	00113023          	sd	ra,0(sp)
    80004698:	00313823          	sd	gp,16(sp)
    8000469c:	00413c23          	sd	tp,24(sp)
    800046a0:	02513023          	sd	t0,32(sp)
    800046a4:	02613423          	sd	t1,40(sp)
    800046a8:	02713823          	sd	t2,48(sp)
    800046ac:	02813c23          	sd	s0,56(sp)
    800046b0:	04913023          	sd	s1,64(sp)
    800046b4:	04a13423          	sd	a0,72(sp)
    800046b8:	04b13823          	sd	a1,80(sp)
    800046bc:	04c13c23          	sd	a2,88(sp)
    800046c0:	06d13023          	sd	a3,96(sp)
    800046c4:	06e13423          	sd	a4,104(sp)
    800046c8:	06f13823          	sd	a5,112(sp)
    800046cc:	07013c23          	sd	a6,120(sp)
    800046d0:	09113023          	sd	a7,128(sp)
    800046d4:	09213423          	sd	s2,136(sp)
    800046d8:	09313823          	sd	s3,144(sp)
    800046dc:	09413c23          	sd	s4,152(sp)
    800046e0:	0b513023          	sd	s5,160(sp)
    800046e4:	0b613423          	sd	s6,168(sp)
    800046e8:	0b713823          	sd	s7,176(sp)
    800046ec:	0b813c23          	sd	s8,184(sp)
    800046f0:	0d913023          	sd	s9,192(sp)
    800046f4:	0da13423          	sd	s10,200(sp)
    800046f8:	0db13823          	sd	s11,208(sp)
    800046fc:	0dc13c23          	sd	t3,216(sp)
    80004700:	0fd13023          	sd	t4,224(sp)
    80004704:	0fe13423          	sd	t5,232(sp)
    80004708:	0ff13823          	sd	t6,240(sp)
    8000470c:	0f810293          	add	t0,sp,248
    80004710:	00513423          	sd	t0,8(sp)
    80004714:	34202573          	csrr	a0,mcause
    80004718:	fff0029b          	addw	t0,zero,-1
    8000471c:	03f29293          	sll	t0,t0,0x3f
    80004720:	00728293          	add	t0,t0,7
    80004724:	00551663          	bne	a0,t0,80004730 <interrupt_return>
    80004728:	e0dfe0ef          	jal	80003534 <machine_timer_handler>
    8000472c:	0040006f          	j	80004730 <interrupt_return>

0000000080004730 <interrupt_return>:
    80004730:	00013083          	ld	ra,0(sp)
    80004734:	01013183          	ld	gp,16(sp)
    80004738:	01813203          	ld	tp,24(sp)
    8000473c:	02013283          	ld	t0,32(sp)
    80004740:	02813303          	ld	t1,40(sp)
    80004744:	03013383          	ld	t2,48(sp)
    80004748:	03813403          	ld	s0,56(sp)
    8000474c:	04013483          	ld	s1,64(sp)
    80004750:	04813503          	ld	a0,72(sp)
    80004754:	05013583          	ld	a1,80(sp)
    80004758:	05813603          	ld	a2,88(sp)
    8000475c:	06013683          	ld	a3,96(sp)
    80004760:	06813703          	ld	a4,104(sp)
    80004764:	07013783          	ld	a5,112(sp)
    80004768:	07813803          	ld	a6,120(sp)
    8000476c:	08013883          	ld	a7,128(sp)
    80004770:	08813903          	ld	s2,136(sp)
    80004774:	09013983          	ld	s3,144(sp)
    80004778:	09813a03          	ld	s4,152(sp)
    8000477c:	0a013a83          	ld	s5,160(sp)
    80004780:	0a813b03          	ld	s6,168(sp)
    80004784:	0b013b83          	ld	s7,176(sp)
    80004788:	0b813c03          	ld	s8,184(sp)
    8000478c:	0c013c83          	ld	s9,192(sp)
    80004790:	0c813d03          	ld	s10,200(sp)
    80004794:	0d013d83          	ld	s11,208(sp)
    80004798:	0d813e03          	ld	t3,216(sp)
    8000479c:	0e013e83          	ld	t4,224(sp)
    800047a0:	0e813f03          	ld	t5,232(sp)
    800047a4:	0f013f83          	ld	t6,240(sp)
    800047a8:	00813103          	ld	sp,8(sp)
    800047ac:	30200073          	mret

00000000800047b0 <kernelvec>:
    800047b0:	ef010113          	add	sp,sp,-272
    800047b4:	00013023          	sd	zero,0(sp)
    800047b8:	00113423          	sd	ra,8(sp)
    800047bc:	00313c23          	sd	gp,24(sp)
    800047c0:	02413023          	sd	tp,32(sp)
    800047c4:	02513423          	sd	t0,40(sp)
    800047c8:	02613823          	sd	t1,48(sp)
    800047cc:	02713c23          	sd	t2,56(sp)
    800047d0:	04813023          	sd	s0,64(sp)
    800047d4:	04913423          	sd	s1,72(sp)
    800047d8:	04a13823          	sd	a0,80(sp)
    800047dc:	04b13c23          	sd	a1,88(sp)
    800047e0:	06c13023          	sd	a2,96(sp)
    800047e4:	06d13423          	sd	a3,104(sp)
    800047e8:	06e13823          	sd	a4,112(sp)
    800047ec:	06f13c23          	sd	a5,120(sp)
    800047f0:	09013023          	sd	a6,128(sp)
    800047f4:	09113423          	sd	a7,136(sp)
    800047f8:	09213823          	sd	s2,144(sp)
    800047fc:	09313c23          	sd	s3,152(sp)
    80004800:	0b413023          	sd	s4,160(sp)
    80004804:	0b513423          	sd	s5,168(sp)
    80004808:	0b613823          	sd	s6,176(sp)
    8000480c:	0b713c23          	sd	s7,184(sp)
    80004810:	0d813023          	sd	s8,192(sp)
    80004814:	0d913423          	sd	s9,200(sp)
    80004818:	0da13823          	sd	s10,208(sp)
    8000481c:	0db13c23          	sd	s11,216(sp)
    80004820:	0fc13023          	sd	t3,224(sp)
    80004824:	0fd13423          	sd	t4,232(sp)
    80004828:	0fe13823          	sd	t5,240(sp)
    8000482c:	0ff13c23          	sd	t6,248(sp)
    80004830:	11010293          	add	t0,sp,272
    80004834:	00513823          	sd	t0,16(sp)
    80004838:	141022f3          	csrr	t0,sepc
    8000483c:	10513023          	sd	t0,256(sp)
    80004840:	142022f3          	csrr	t0,scause
    80004844:	10513423          	sd	t0,264(sp)
    80004848:	b70ff0ef          	jal	80003bb8 <kerneltrap>
    8000484c:	00813083          	ld	ra,8(sp)
    80004850:	01813183          	ld	gp,24(sp)
    80004854:	02013203          	ld	tp,32(sp)
    80004858:	02813283          	ld	t0,40(sp)
    8000485c:	03013303          	ld	t1,48(sp)
    80004860:	03813383          	ld	t2,56(sp)
    80004864:	04013403          	ld	s0,64(sp)
    80004868:	04813483          	ld	s1,72(sp)
    8000486c:	05013503          	ld	a0,80(sp)
    80004870:	05813583          	ld	a1,88(sp)
    80004874:	06013603          	ld	a2,96(sp)
    80004878:	06813683          	ld	a3,104(sp)
    8000487c:	07013703          	ld	a4,112(sp)
    80004880:	07813783          	ld	a5,120(sp)
    80004884:	08013803          	ld	a6,128(sp)
    80004888:	08813883          	ld	a7,136(sp)
    8000488c:	09013903          	ld	s2,144(sp)
    80004890:	09813983          	ld	s3,152(sp)
    80004894:	0a013a03          	ld	s4,160(sp)
    80004898:	0a813a83          	ld	s5,168(sp)
    8000489c:	0b013b03          	ld	s6,176(sp)
    800048a0:	0b813b83          	ld	s7,184(sp)
    800048a4:	0c013c03          	ld	s8,192(sp)
    800048a8:	0c813c83          	ld	s9,200(sp)
    800048ac:	0d013d03          	ld	s10,208(sp)
    800048b0:	0d813d83          	ld	s11,216(sp)
    800048b4:	0e013e03          	ld	t3,224(sp)
    800048b8:	0e813e83          	ld	t4,232(sp)
    800048bc:	0f013f03          	ld	t5,240(sp)
    800048c0:	0f813f83          	ld	t6,248(sp)
    800048c4:	10013283          	ld	t0,256(sp)
    800048c8:	14129073          	csrw	sepc,t0
    800048cc:	10813283          	ld	t0,264(sp)
    800048d0:	14229073          	csrw	scause,t0
    800048d4:	01013103          	ld	sp,16(sp)
    800048d8:	10200073          	sret
    800048dc:	0000                	.2byte	0x0
	...

00000000800048e0 <uservec>:
    800048e0:	00010293          	mv	t0,sp
    800048e4:	ef010113          	add	sp,sp,-272
    800048e8:	00513823          	sd	t0,16(sp)
    800048ec:	00113423          	sd	ra,8(sp)
    800048f0:	00313c23          	sd	gp,24(sp)
    800048f4:	02413023          	sd	tp,32(sp)
    800048f8:	02513423          	sd	t0,40(sp)
    800048fc:	02613823          	sd	t1,48(sp)
    80004900:	02713c23          	sd	t2,56(sp)
    80004904:	04813023          	sd	s0,64(sp)
    80004908:	04913423          	sd	s1,72(sp)
    8000490c:	04a13823          	sd	a0,80(sp)
    80004910:	04b13c23          	sd	a1,88(sp)
    80004914:	06c13023          	sd	a2,96(sp)
    80004918:	06d13423          	sd	a3,104(sp)
    8000491c:	06e13823          	sd	a4,112(sp)
    80004920:	06f13c23          	sd	a5,120(sp)
    80004924:	09013023          	sd	a6,128(sp)
    80004928:	09113423          	sd	a7,136(sp)
    8000492c:	09213823          	sd	s2,144(sp)
    80004930:	09313c23          	sd	s3,152(sp)
    80004934:	0b413023          	sd	s4,160(sp)
    80004938:	0b513423          	sd	s5,168(sp)
    8000493c:	0b613823          	sd	s6,176(sp)
    80004940:	0b713c23          	sd	s7,184(sp)
    80004944:	0d813023          	sd	s8,192(sp)
    80004948:	0d913423          	sd	s9,200(sp)
    8000494c:	0da13823          	sd	s10,208(sp)
    80004950:	0db13c23          	sd	s11,216(sp)
    80004954:	0fc13023          	sd	t3,224(sp)
    80004958:	0fd13423          	sd	t4,232(sp)
    8000495c:	0fe13823          	sd	t5,240(sp)
    80004960:	0ff13c23          	sd	t6,248(sp)
    80004964:	10002373          	csrr	t1,sstatus
    80004968:	10613023          	sd	t1,256(sp)
    8000496c:	14102373          	csrr	t1,sepc
    80004970:	10613423          	sd	t1,264(sp)
    80004974:	f85fe0ef          	jal	800038f8 <usertrap>
    80004978:	00813083          	ld	ra,8(sp)
    8000497c:	01813183          	ld	gp,24(sp)
    80004980:	02013203          	ld	tp,32(sp)
    80004984:	02813283          	ld	t0,40(sp)
    80004988:	03013303          	ld	t1,48(sp)
    8000498c:	03813383          	ld	t2,56(sp)
    80004990:	04013403          	ld	s0,64(sp)
    80004994:	04813483          	ld	s1,72(sp)
    80004998:	05013503          	ld	a0,80(sp)
    8000499c:	05813583          	ld	a1,88(sp)
    800049a0:	06013603          	ld	a2,96(sp)
    800049a4:	06813683          	ld	a3,104(sp)
    800049a8:	07013703          	ld	a4,112(sp)
    800049ac:	07813783          	ld	a5,120(sp)
    800049b0:	08013803          	ld	a6,128(sp)
    800049b4:	08813883          	ld	a7,136(sp)
    800049b8:	09013903          	ld	s2,144(sp)
    800049bc:	09813983          	ld	s3,152(sp)
    800049c0:	0a013a03          	ld	s4,160(sp)
    800049c4:	0a813a83          	ld	s5,168(sp)
    800049c8:	0b013b03          	ld	s6,176(sp)
    800049cc:	0b813b83          	ld	s7,184(sp)
    800049d0:	0c013c03          	ld	s8,192(sp)
    800049d4:	0c813c83          	ld	s9,200(sp)
    800049d8:	0d013d03          	ld	s10,208(sp)
    800049dc:	0d813d83          	ld	s11,216(sp)
    800049e0:	0e013e03          	ld	t3,224(sp)
    800049e4:	0e813e83          	ld	t4,232(sp)
    800049e8:	0f013f03          	ld	t5,240(sp)
    800049ec:	0f813f83          	ld	t6,248(sp)
    800049f0:	10013303          	ld	t1,256(sp)
    800049f4:	10031073          	csrw	sstatus,t1
    800049f8:	10813303          	ld	t1,264(sp)
    800049fc:	14131073          	csrw	sepc,t1
    80004a00:	01013103          	ld	sp,16(sp)
    80004a04:	10200073          	sret
	...

0000000080004a10 <switch_context>:
    80004a10:	00153023          	sd	ra,0(a0)
    80004a14:	00253423          	sd	sp,8(a0)
    80004a18:	00853823          	sd	s0,16(a0)
    80004a1c:	00953c23          	sd	s1,24(a0)
    80004a20:	03253023          	sd	s2,32(a0)
    80004a24:	03353423          	sd	s3,40(a0)
    80004a28:	03453823          	sd	s4,48(a0)
    80004a2c:	03553c23          	sd	s5,56(a0)
    80004a30:	05653023          	sd	s6,64(a0)
    80004a34:	05753423          	sd	s7,72(a0)
    80004a38:	05853823          	sd	s8,80(a0)
    80004a3c:	05953c23          	sd	s9,88(a0)
    80004a40:	07a53023          	sd	s10,96(a0)
    80004a44:	07b53423          	sd	s11,104(a0)
    80004a48:	0005b083          	ld	ra,0(a1)
    80004a4c:	0085b103          	ld	sp,8(a1)
    80004a50:	0105b403          	ld	s0,16(a1)
    80004a54:	0185b483          	ld	s1,24(a1)
    80004a58:	0205b903          	ld	s2,32(a1)
    80004a5c:	0285b983          	ld	s3,40(a1)
    80004a60:	0305ba03          	ld	s4,48(a1)
    80004a64:	0385ba83          	ld	s5,56(a1)
    80004a68:	0405bb03          	ld	s6,64(a1)
    80004a6c:	0485bb83          	ld	s7,72(a1)
    80004a70:	0505bc03          	ld	s8,80(a1)
    80004a74:	0585bc83          	ld	s9,88(a1)
    80004a78:	0605bd03          	ld	s10,96(a1)
    80004a7c:	0685bd83          	ld	s11,104(a1)
    80004a80:	00008067          	ret
