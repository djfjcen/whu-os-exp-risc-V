
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
    80000020:	68428293          	add	t0,t0,1668 # 800046a0 <machinevec>
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
    80000078:	72d000ef          	jal	80000fa4 <main>

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
    800000a0:	72d030ef          	jal	80003fcc <get_pid>
    800000a4:	00050913          	mv	s2,a0
    800000a8:	00000493          	li	s1,0
    800000ac:	00005a17          	auipc	s4,0x5
    800000b0:	f54a0a13          	add	s4,s4,-172 # 80005000 <rodata_start>
    800000b4:	69f40413          	add	s0,s0,1695 # 1869f <_entry-0x7ffe7961>
    800000b8:	00500993          	li	s3,5
    800000bc:	00048613          	mv	a2,s1
    800000c0:	00090593          	mv	a1,s2
    800000c4:	000a0513          	mv	a0,s4
    800000c8:	51c010ef          	jal	800015e4 <printf>
    800000cc:	00012623          	sw	zero,12(sp)
    800000d0:	00c12783          	lw	a5,12(sp)
    800000d4:	00f44c63          	blt	s0,a5,800000ec <rr_worker+0x6c>
    800000d8:	00c12783          	lw	a5,12(sp)
    800000dc:	0017879b          	addw	a5,a5,1
    800000e0:	00f12623          	sw	a5,12(sp)
    800000e4:	00c12783          	lw	a5,12(sp)
    800000e8:	fef458e3          	bge	s0,a5,800000d8 <rr_worker+0x58>
    800000ec:	0014849b          	addw	s1,s1,1
    800000f0:	050040ef          	jal	80004140 <yield>
    800000f4:	fd3494e3          	bne	s1,s3,800000bc <rr_worker+0x3c>
    800000f8:	00090593          	mv	a1,s2
    800000fc:	00005517          	auipc	a0,0x5
    80000100:	f2450513          	add	a0,a0,-220 # 80005020 <rodata_start+0x20>
    80000104:	4e0010ef          	jal	800015e4 <printf>
    80000108:	03013403          	ld	s0,48(sp)
    8000010c:	03813083          	ld	ra,56(sp)
    80000110:	02813483          	ld	s1,40(sp)
    80000114:	02013903          	ld	s2,32(sp)
    80000118:	01813983          	ld	s3,24(sp)
    8000011c:	01013a03          	ld	s4,16(sp)
    80000120:	00000513          	li	a0,0
    80000124:	04010113          	add	sp,sp,64
    80000128:	1ac0406f          	j	800042d4 <exit>

000000008000012c <test_process_allocation>:
    8000012c:	fe010113          	add	sp,sp,-32
    80000130:	00005517          	auipc	a0,0x5
    80000134:	f1050513          	add	a0,a0,-240 # 80005040 <rodata_start+0x40>
    80000138:	00113c23          	sd	ra,24(sp)
    8000013c:	00813823          	sd	s0,16(sp)
    80000140:	00913423          	sd	s1,8(sp)
    80000144:	01213023          	sd	s2,0(sp)
    80000148:	00d010ef          	jal	80001954 <uart_puts>
    8000014c:	431030ef          	jal	80003d7c <alloc_proc>
    80000150:	00050413          	mv	s0,a0
    80000154:	429030ef          	jal	80003d7c <alloc_proc>
    80000158:	00050493          	mv	s1,a0
    8000015c:	421030ef          	jal	80003d7c <alloc_proc>
    80000160:	0a040663          	beqz	s0,8000020c <test_process_allocation+0xe0>
    80000164:	0a048463          	beqz	s1,8000020c <test_process_allocation+0xe0>
    80000168:	00050913          	mv	s2,a0
    8000016c:	0a050063          	beqz	a0,8000020c <test_process_allocation+0xe0>
    80000170:	00452683          	lw	a3,4(a0)
    80000174:	0044a603          	lw	a2,4(s1)
    80000178:	00442583          	lw	a1,4(s0)
    8000017c:	00005517          	auipc	a0,0x5
    80000180:	f0450513          	add	a0,a0,-252 # 80005080 <rodata_start+0x80>
    80000184:	460010ef          	jal	800015e4 <printf>
    80000188:	00042783          	lw	a5,0(s0)
    8000018c:	00100713          	li	a4,1
    80000190:	00e79a63          	bne	a5,a4,800001a4 <test_process_allocation+0x78>
    80000194:	0004a703          	lw	a4,0(s1)
    80000198:	00f71663          	bne	a4,a5,800001a4 <test_process_allocation+0x78>
    8000019c:	00092783          	lw	a5,0(s2)
    800001a0:	0ae78463          	beq	a5,a4,80000248 <test_process_allocation+0x11c>
    800001a4:	00005517          	auipc	a0,0x5
    800001a8:	f3c50513          	add	a0,a0,-196 # 800050e0 <rodata_start+0xe0>
    800001ac:	7a8010ef          	jal	80001954 <uart_puts>
    800001b0:	00040513          	mv	a0,s0
    800001b4:	541030ef          	jal	80003ef4 <free_proc>
    800001b8:	00048513          	mv	a0,s1
    800001bc:	539030ef          	jal	80003ef4 <free_proc>
    800001c0:	00090513          	mv	a0,s2
    800001c4:	531030ef          	jal	80003ef4 <free_proc>
    800001c8:	00042783          	lw	a5,0(s0)
    800001cc:	00079a63          	bnez	a5,800001e0 <test_process_allocation+0xb4>
    800001d0:	0004a783          	lw	a5,0(s1)
    800001d4:	00079663          	bnez	a5,800001e0 <test_process_allocation+0xb4>
    800001d8:	00092783          	lw	a5,0(s2)
    800001dc:	04078e63          	beqz	a5,80000238 <test_process_allocation+0x10c>
    800001e0:	00005517          	auipc	a0,0x5
    800001e4:	f3050513          	add	a0,a0,-208 # 80005110 <rodata_start+0x110>
    800001e8:	76c010ef          	jal	80001954 <uart_puts>
    800001ec:	01013403          	ld	s0,16(sp)
    800001f0:	01813083          	ld	ra,24(sp)
    800001f4:	00813483          	ld	s1,8(sp)
    800001f8:	00013903          	ld	s2,0(sp)
    800001fc:	00005517          	auipc	a0,0x5
    80000200:	f4450513          	add	a0,a0,-188 # 80005140 <rodata_start+0x140>
    80000204:	02010113          	add	sp,sp,32
    80000208:	74c0106f          	j	80001954 <uart_puts>
    8000020c:	00005517          	auipc	a0,0x5
    80000210:	f1c50513          	add	a0,a0,-228 # 80005128 <rodata_start+0x128>
    80000214:	740010ef          	jal	80001954 <uart_puts>
    80000218:	01013403          	ld	s0,16(sp)
    8000021c:	01813083          	ld	ra,24(sp)
    80000220:	00813483          	ld	s1,8(sp)
    80000224:	00013903          	ld	s2,0(sp)
    80000228:	00005517          	auipc	a0,0x5
    8000022c:	f1850513          	add	a0,a0,-232 # 80005140 <rodata_start+0x140>
    80000230:	02010113          	add	sp,sp,32
    80000234:	7200106f          	j	80001954 <uart_puts>
    80000238:	00005517          	auipc	a0,0x5
    8000023c:	ec050513          	add	a0,a0,-320 # 800050f8 <rodata_start+0xf8>
    80000240:	714010ef          	jal	80001954 <uart_puts>
    80000244:	fd5ff06f          	j	80000218 <test_process_allocation+0xec>
    80000248:	00005517          	auipc	a0,0x5
    8000024c:	e7050513          	add	a0,a0,-400 # 800050b8 <rodata_start+0xb8>
    80000250:	704010ef          	jal	80001954 <uart_puts>
    80000254:	f5dff06f          	j	800001b0 <test_process_allocation+0x84>

0000000080000258 <test_process_find>:
    80000258:	fe010113          	add	sp,sp,-32
    8000025c:	00005517          	auipc	a0,0x5
    80000260:	efc50513          	add	a0,a0,-260 # 80005158 <rodata_start+0x158>
    80000264:	00113c23          	sd	ra,24(sp)
    80000268:	00813823          	sd	s0,16(sp)
    8000026c:	00913423          	sd	s1,8(sp)
    80000270:	6e4010ef          	jal	80001954 <uart_puts>
    80000274:	309030ef          	jal	80003d7c <alloc_proc>
    80000278:	08050863          	beqz	a0,80000308 <test_process_find+0xb0>
    8000027c:	00452483          	lw	s1,4(a0)
    80000280:	00050413          	mv	s0,a0
    80000284:	00005517          	auipc	a0,0x5
    80000288:	f2450513          	add	a0,a0,-220 # 800051a8 <rodata_start+0x1a8>
    8000028c:	00048593          	mv	a1,s1
    80000290:	354010ef          	jal	800015e4 <printf>
    80000294:	00048513          	mv	a0,s1
    80000298:	469030ef          	jal	80003f00 <find_proc>
    8000029c:	00050663          	beqz	a0,800002a8 <test_process_find+0x50>
    800002a0:	00452783          	lw	a5,4(a0)
    800002a4:	08978063          	beq	a5,s1,80000324 <test_process_find+0xcc>
    800002a8:	00005517          	auipc	a0,0x5
    800002ac:	f3850513          	add	a0,a0,-200 # 800051e0 <rodata_start+0x1e0>
    800002b0:	6a4010ef          	jal	80001954 <uart_puts>
    800002b4:	00040513          	mv	a0,s0
    800002b8:	43d030ef          	jal	80003ef4 <free_proc>
    800002bc:	00048513          	mv	a0,s1
    800002c0:	441030ef          	jal	80003f00 <find_proc>
    800002c4:	00050663          	beqz	a0,800002d0 <test_process_find+0x78>
    800002c8:	00052783          	lw	a5,0(a0)
    800002cc:	02079663          	bnez	a5,800002f8 <test_process_find+0xa0>
    800002d0:	00005517          	auipc	a0,0x5
    800002d4:	f2850513          	add	a0,a0,-216 # 800051f8 <rodata_start+0x1f8>
    800002d8:	67c010ef          	jal	80001954 <uart_puts>
    800002dc:	01013403          	ld	s0,16(sp)
    800002e0:	01813083          	ld	ra,24(sp)
    800002e4:	00813483          	ld	s1,8(sp)
    800002e8:	00005517          	auipc	a0,0x5
    800002ec:	e5850513          	add	a0,a0,-424 # 80005140 <rodata_start+0x140>
    800002f0:	02010113          	add	sp,sp,32
    800002f4:	6600106f          	j	80001954 <uart_puts>
    800002f8:	00005517          	auipc	a0,0x5
    800002fc:	f3850513          	add	a0,a0,-200 # 80005230 <rodata_start+0x230>
    80000300:	654010ef          	jal	80001954 <uart_puts>
    80000304:	fd9ff06f          	j	800002dc <test_process_find+0x84>
    80000308:	01013403          	ld	s0,16(sp)
    8000030c:	01813083          	ld	ra,24(sp)
    80000310:	00813483          	ld	s1,8(sp)
    80000314:	00005517          	auipc	a0,0x5
    80000318:	e7c50513          	add	a0,a0,-388 # 80005190 <rodata_start+0x190>
    8000031c:	02010113          	add	sp,sp,32
    80000320:	6340106f          	j	80001954 <uart_puts>
    80000324:	00048593          	mv	a1,s1
    80000328:	00005517          	auipc	a0,0x5
    8000032c:	e9850513          	add	a0,a0,-360 # 800051c0 <rodata_start+0x1c0>
    80000330:	2b4010ef          	jal	800015e4 <printf>
    80000334:	f81ff06f          	j	800002b4 <test_process_find+0x5c>

0000000080000338 <test_process_state_transition>:
    80000338:	fe010113          	add	sp,sp,-32
    8000033c:	00005517          	auipc	a0,0x5
    80000340:	f2450513          	add	a0,a0,-220 # 80005260 <rodata_start+0x260>
    80000344:	00113c23          	sd	ra,24(sp)
    80000348:	00813823          	sd	s0,16(sp)
    8000034c:	00913423          	sd	s1,8(sp)
    80000350:	604010ef          	jal	80001954 <uart_puts>
    80000354:	229030ef          	jal	80003d7c <alloc_proc>
    80000358:	0c050a63          	beqz	a0,8000042c <test_process_state_transition+0xf4>
    8000035c:	00052583          	lw	a1,0(a0)
    80000360:	00050413          	mv	s0,a0
    80000364:	00100613          	li	a2,1
    80000368:	00005517          	auipc	a0,0x5
    8000036c:	f3850513          	add	a0,a0,-200 # 800052a0 <rodata_start+0x2a0>
    80000370:	274010ef          	jal	800015e4 <printf>
    80000374:	00040513          	mv	a0,s0
    80000378:	3ed030ef          	jal	80003f64 <proc_mark_runnable>
    8000037c:	00042703          	lw	a4,0(s0)
    80000380:	00200793          	li	a5,2
    80000384:	0cf70263          	beq	a4,a5,80000448 <test_process_state_transition+0x110>
    80000388:	00300793          	li	a5,3
    8000038c:	000014b7          	lui	s1,0x1
    80000390:	00f42023          	sw	a5,0(s0)
    80000394:	23448593          	add	a1,s1,564 # 1234 <_entry-0x7fffedcc>
    80000398:	00040513          	mv	a0,s0
    8000039c:	3f1030ef          	jal	80003f8c <proc_mark_sleeping>
    800003a0:	00042583          	lw	a1,0(s0)
    800003a4:	00400793          	li	a5,4
    800003a8:	00f59863          	bne	a1,a5,800003b8 <test_process_state_transition+0x80>
    800003ac:	0b843783          	ld	a5,184(s0)
    800003b0:	23448493          	add	s1,s1,564
    800003b4:	06978463          	beq	a5,s1,8000041c <test_process_state_transition+0xe4>
    800003b8:	00005517          	auipc	a0,0x5
    800003bc:	f4850513          	add	a0,a0,-184 # 80005300 <rodata_start+0x300>
    800003c0:	224010ef          	jal	800015e4 <printf>
    800003c4:	02a00593          	li	a1,42
    800003c8:	00040513          	mv	a0,s0
    800003cc:	3e5030ef          	jal	80003fb0 <proc_mark_zombie>
    800003d0:	00042703          	lw	a4,0(s0)
    800003d4:	00500793          	li	a5,5
    800003d8:	02f70463          	beq	a4,a5,80000400 <test_process_state_transition+0xc8>
    800003dc:	00040513          	mv	a0,s0
    800003e0:	315030ef          	jal	80003ef4 <free_proc>
    800003e4:	01013403          	ld	s0,16(sp)
    800003e8:	01813083          	ld	ra,24(sp)
    800003ec:	00813483          	ld	s1,8(sp)
    800003f0:	00005517          	auipc	a0,0x5
    800003f4:	d5050513          	add	a0,a0,-688 # 80005140 <rodata_start+0x140>
    800003f8:	02010113          	add	sp,sp,32
    800003fc:	5580106f          	j	80001954 <uart_puts>
    80000400:	00c42703          	lw	a4,12(s0)
    80000404:	02a00793          	li	a5,42
    80000408:	fcf71ae3          	bne	a4,a5,800003dc <test_process_state_transition+0xa4>
    8000040c:	00005517          	auipc	a0,0x5
    80000410:	f2450513          	add	a0,a0,-220 # 80005330 <rodata_start+0x330>
    80000414:	540010ef          	jal	80001954 <uart_puts>
    80000418:	fc5ff06f          	j	800003dc <test_process_state_transition+0xa4>
    8000041c:	00005517          	auipc	a0,0x5
    80000420:	ec450513          	add	a0,a0,-316 # 800052e0 <rodata_start+0x2e0>
    80000424:	530010ef          	jal	80001954 <uart_puts>
    80000428:	f9dff06f          	j	800003c4 <test_process_state_transition+0x8c>
    8000042c:	01013403          	ld	s0,16(sp)
    80000430:	01813083          	ld	ra,24(sp)
    80000434:	00813483          	ld	s1,8(sp)
    80000438:	00005517          	auipc	a0,0x5
    8000043c:	d5850513          	add	a0,a0,-680 # 80005190 <rodata_start+0x190>
    80000440:	02010113          	add	sp,sp,32
    80000444:	5100106f          	j	80001954 <uart_puts>
    80000448:	00005517          	auipc	a0,0x5
    8000044c:	e7850513          	add	a0,a0,-392 # 800052c0 <rodata_start+0x2c0>
    80000450:	504010ef          	jal	80001954 <uart_puts>
    80000454:	f35ff06f          	j	80000388 <test_process_state_transition+0x50>

0000000080000458 <test_simple_fork>:
    80000458:	fe010113          	add	sp,sp,-32
    8000045c:	00005517          	auipc	a0,0x5
    80000460:	ef450513          	add	a0,a0,-268 # 80005350 <rodata_start+0x350>
    80000464:	00113c23          	sd	ra,24(sp)
    80000468:	00813823          	sd	s0,16(sp)
    8000046c:	00913423          	sd	s1,8(sp)
    80000470:	4e4010ef          	jal	80001954 <uart_puts>
    80000474:	109030ef          	jal	80003d7c <alloc_proc>
    80000478:	0a050463          	beqz	a0,80000520 <test_simple_fork+0xc8>
    8000047c:	00300793          	li	a5,3
    80000480:	00f52023          	sw	a5,0(a0)
    80000484:	00050413          	mv	s0,a0
    80000488:	36d030ef          	jal	80003ff4 <set_current_proc>
    8000048c:	00442583          	lw	a1,4(s0)
    80000490:	00005517          	auipc	a0,0x5
    80000494:	f2050513          	add	a0,a0,-224 # 800053b0 <rodata_start+0x3b0>
    80000498:	14c010ef          	jal	800015e4 <printf>
    8000049c:	555030ef          	jal	800041f0 <fork>
    800004a0:	00050493          	mv	s1,a0
    800004a4:	06a05663          	blez	a0,80000510 <test_simple_fork+0xb8>
    800004a8:	00050593          	mv	a1,a0
    800004ac:	00005517          	auipc	a0,0x5
    800004b0:	f1c50513          	add	a0,a0,-228 # 800053c8 <rodata_start+0x3c8>
    800004b4:	130010ef          	jal	800015e4 <printf>
    800004b8:	00048513          	mv	a0,s1
    800004bc:	245030ef          	jal	80003f00 <find_proc>
    800004c0:	00050493          	mv	s1,a0
    800004c4:	02050063          	beqz	a0,800004e4 <test_simple_fork+0x8c>
    800004c8:	0b053783          	ld	a5,176(a0)
    800004cc:	06878863          	beq	a5,s0,8000053c <test_simple_fork+0xe4>
    800004d0:	0004a703          	lw	a4,0(s1)
    800004d4:	00200793          	li	a5,2
    800004d8:	08f70063          	beq	a4,a5,80000558 <test_simple_fork+0x100>
    800004dc:	00048513          	mv	a0,s1
    800004e0:	215030ef          	jal	80003ef4 <free_proc>
    800004e4:	00040513          	mv	a0,s0
    800004e8:	20d030ef          	jal	80003ef4 <free_proc>
    800004ec:	00000513          	li	a0,0
    800004f0:	305030ef          	jal	80003ff4 <set_current_proc>
    800004f4:	01013403          	ld	s0,16(sp)
    800004f8:	01813083          	ld	ra,24(sp)
    800004fc:	00813483          	ld	s1,8(sp)
    80000500:	00005517          	auipc	a0,0x5
    80000504:	c4050513          	add	a0,a0,-960 # 80005140 <rodata_start+0x140>
    80000508:	02010113          	add	sp,sp,32
    8000050c:	4480106f          	j	80001954 <uart_puts>
    80000510:	00005517          	auipc	a0,0x5
    80000514:	f2050513          	add	a0,a0,-224 # 80005430 <rodata_start+0x430>
    80000518:	43c010ef          	jal	80001954 <uart_puts>
    8000051c:	fc9ff06f          	j	800004e4 <test_simple_fork+0x8c>
    80000520:	01013403          	ld	s0,16(sp)
    80000524:	01813083          	ld	ra,24(sp)
    80000528:	00813483          	ld	s1,8(sp)
    8000052c:	00005517          	auipc	a0,0x5
    80000530:	e6450513          	add	a0,a0,-412 # 80005390 <rodata_start+0x390>
    80000534:	02010113          	add	sp,sp,32
    80000538:	41c0106f          	j	80001954 <uart_puts>
    8000053c:	00852703          	lw	a4,8(a0)
    80000540:	00442783          	lw	a5,4(s0)
    80000544:	f8f716e3          	bne	a4,a5,800004d0 <test_simple_fork+0x78>
    80000548:	00005517          	auipc	a0,0x5
    8000054c:	ea850513          	add	a0,a0,-344 # 800053f0 <rodata_start+0x3f0>
    80000550:	404010ef          	jal	80001954 <uart_puts>
    80000554:	f7dff06f          	j	800004d0 <test_simple_fork+0x78>
    80000558:	00005517          	auipc	a0,0x5
    8000055c:	eb850513          	add	a0,a0,-328 # 80005410 <rodata_start+0x410>
    80000560:	3f4010ef          	jal	80001954 <uart_puts>
    80000564:	f79ff06f          	j	800004dc <test_simple_fork+0x84>

0000000080000568 <test_scheduler_basic>:
    80000568:	fb010113          	add	sp,sp,-80
    8000056c:	04813023          	sd	s0,64(sp)
    80000570:	00005517          	auipc	a0,0x5
    80000574:	ed050513          	add	a0,a0,-304 # 80005440 <rodata_start+0x440>
    80000578:	00810413          	add	s0,sp,8
    8000057c:	02913c23          	sd	s1,56(sp)
    80000580:	03213823          	sd	s2,48(sp)
    80000584:	03313423          	sd	s3,40(sp)
    80000588:	03413023          	sd	s4,32(sp)
    8000058c:	04113423          	sd	ra,72(sp)
    80000590:	02010913          	add	s2,sp,32
    80000594:	3c0010ef          	jal	80001954 <uart_puts>
    80000598:	00040493          	mv	s1,s0
    8000059c:	00200a13          	li	s4,2
    800005a0:	00005997          	auipc	s3,0x5
    800005a4:	ee098993          	add	s3,s3,-288 # 80005480 <rodata_start+0x480>
    800005a8:	7d4030ef          	jal	80003d7c <alloc_proc>
    800005ac:	00a4b023          	sd	a0,0(s1)
    800005b0:	00050793          	mv	a5,a0
    800005b4:	00848493          	add	s1,s1,8
    800005b8:	00098513          	mv	a0,s3
    800005bc:	00078863          	beqz	a5,800005cc <test_scheduler_basic+0x64>
    800005c0:	0047a583          	lw	a1,4(a5)
    800005c4:	0147a023          	sw	s4,0(a5)
    800005c8:	01c010ef          	jal	800015e4 <printf>
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
    800005f8:	00005517          	auipc	a0,0x5
    800005fc:	ea050513          	add	a0,a0,-352 # 80005498 <rodata_start+0x498>
    80000600:	7e5000ef          	jal	800015e4 <printf>
    80000604:	00043503          	ld	a0,0(s0)
    80000608:	00840413          	add	s0,s0,8
    8000060c:	00050463          	beqz	a0,80000614 <test_scheduler_basic+0xac>
    80000610:	0e5030ef          	jal	80003ef4 <free_proc>
    80000614:	ff2418e3          	bne	s0,s2,80000604 <test_scheduler_basic+0x9c>
    80000618:	04013403          	ld	s0,64(sp)
    8000061c:	04813083          	ld	ra,72(sp)
    80000620:	03813483          	ld	s1,56(sp)
    80000624:	03013903          	ld	s2,48(sp)
    80000628:	02813983          	ld	s3,40(sp)
    8000062c:	02013a03          	ld	s4,32(sp)
    80000630:	00005517          	auipc	a0,0x5
    80000634:	b1050513          	add	a0,a0,-1264 # 80005140 <rodata_start+0x140>
    80000638:	05010113          	add	sp,sp,80
    8000063c:	3180106f          	j	80001954 <uart_puts>
    80000640:	0015859b          	addw	a1,a1,1
    80000644:	fac792e3          	bne	a5,a2,800005e8 <test_scheduler_basic+0x80>
    80000648:	fb1ff06f          	j	800005f8 <test_scheduler_basic+0x90>

000000008000064c <run_process_management_tests>:
    8000064c:	ff010113          	add	sp,sp,-16
    80000650:	00005517          	auipc	a0,0x5
    80000654:	cd850513          	add	a0,a0,-808 # 80005328 <rodata_start+0x328>
    80000658:	00113423          	sd	ra,8(sp)
    8000065c:	2f8010ef          	jal	80001954 <uart_puts>
    80000660:	00005517          	auipc	a0,0x5
    80000664:	e6050513          	add	a0,a0,-416 # 800054c0 <rodata_start+0x4c0>
    80000668:	2ec010ef          	jal	80001954 <uart_puts>
    8000066c:	00005517          	auipc	a0,0x5
    80000670:	f1c50513          	add	a0,a0,-228 # 80005588 <rodata_start+0x588>
    80000674:	2e0010ef          	jal	80001954 <uart_puts>
    80000678:	00005517          	auipc	a0,0x5
    8000067c:	f7050513          	add	a0,a0,-144 # 800055e8 <rodata_start+0x5e8>
    80000680:	2d4010ef          	jal	80001954 <uart_puts>
    80000684:	aa9ff0ef          	jal	8000012c <test_process_allocation>
    80000688:	bd1ff0ef          	jal	80000258 <test_process_find>
    8000068c:	cadff0ef          	jal	80000338 <test_process_state_transition>
    80000690:	dc9ff0ef          	jal	80000458 <test_simple_fork>
    80000694:	ed5ff0ef          	jal	80000568 <test_scheduler_basic>
    80000698:	00005517          	auipc	a0,0x5
    8000069c:	c9050513          	add	a0,a0,-880 # 80005328 <rodata_start+0x328>
    800006a0:	2b4010ef          	jal	80001954 <uart_puts>
    800006a4:	00005517          	auipc	a0,0x5
    800006a8:	e1c50513          	add	a0,a0,-484 # 800054c0 <rodata_start+0x4c0>
    800006ac:	2a8010ef          	jal	80001954 <uart_puts>
    800006b0:	00005517          	auipc	a0,0x5
    800006b4:	00050513          	mv	a0,a0
    800006b8:	29c010ef          	jal	80001954 <uart_puts>
    800006bc:	00005517          	auipc	a0,0x5
    800006c0:	04c50513          	add	a0,a0,76 # 80005708 <rodata_start+0x708>
    800006c4:	290010ef          	jal	80001954 <uart_puts>
    800006c8:	00005517          	auipc	a0,0x5
    800006cc:	11050513          	add	a0,a0,272 # 800057d8 <rodata_start+0x7d8>
    800006d0:	284010ef          	jal	80001954 <uart_puts>
    800006d4:	00005517          	auipc	a0,0x5
    800006d8:	11c50513          	add	a0,a0,284 # 800057f0 <rodata_start+0x7f0>
    800006dc:	278010ef          	jal	80001954 <uart_puts>
    800006e0:	00005517          	auipc	a0,0x5
    800006e4:	14050513          	add	a0,a0,320 # 80005820 <rodata_start+0x820>
    800006e8:	26c010ef          	jal	80001954 <uart_puts>
    800006ec:	00005517          	auipc	a0,0x5
    800006f0:	15450513          	add	a0,a0,340 # 80005840 <rodata_start+0x840>
    800006f4:	260010ef          	jal	80001954 <uart_puts>
    800006f8:	00005517          	auipc	a0,0x5
    800006fc:	16850513          	add	a0,a0,360 # 80005860 <rodata_start+0x860>
    80000700:	254010ef          	jal	80001954 <uart_puts>
    80000704:	00813083          	ld	ra,8(sp)
    80000708:	00005517          	auipc	a0,0x5
    8000070c:	18850513          	add	a0,a0,392 # 80005890 <rodata_start+0x890>
    80000710:	01010113          	add	sp,sp,16
    80000714:	2400106f          	j	80001954 <uart_puts>

0000000080000718 <test_round_robin_scheduler>:
    80000718:	fa010113          	add	sp,sp,-96
    8000071c:	04813823          	sd	s0,80(sp)
    80000720:	00005517          	auipc	a0,0x5
    80000724:	19050513          	add	a0,a0,400 # 800058b0 <rodata_start+0x8b0>
    80000728:	00810413          	add	s0,sp,8
    8000072c:	04913423          	sd	s1,72(sp)
    80000730:	05213023          	sd	s2,64(sp)
    80000734:	03313c23          	sd	s3,56(sp)
    80000738:	03413823          	sd	s4,48(sp)
    8000073c:	03513423          	sd	s5,40(sp)
    80000740:	03613023          	sd	s6,32(sp)
    80000744:	04113c23          	sd	ra,88(sp)
    80000748:	00040913          	mv	s2,s0
    8000074c:	208010ef          	jal	80001954 <uart_puts>
    80000750:	00000493          	li	s1,0
    80000754:	00000b17          	auipc	s6,0x0
    80000758:	92cb0b13          	add	s6,s6,-1748 # 80000080 <rr_worker>
    8000075c:	00200a93          	li	s5,2
    80000760:	00005a17          	auipc	s4,0x5
    80000764:	1b8a0a13          	add	s4,s4,440 # 80005918 <rodata_start+0x918>
    80000768:	00300993          	li	s3,3
    8000076c:	610030ef          	jal	80003d7c <alloc_proc>
    80000770:	00050793          	mv	a5,a0
    80000774:	00a93023          	sd	a0,0(s2)
    80000778:	000a0513          	mv	a0,s4
    8000077c:	06078c63          	beqz	a5,800007f4 <test_round_robin_scheduler+0xdc>
    80000780:	0047a583          	lw	a1,4(a5)
    80000784:	0567b023          	sd	s6,64(a5)
    80000788:	0157a023          	sw	s5,0(a5)
    8000078c:	659000ef          	jal	800015e4 <printf>
    80000790:	0014849b          	addw	s1,s1,1
    80000794:	00890913          	add	s2,s2,8
    80000798:	fd349ae3          	bne	s1,s3,8000076c <test_round_robin_scheduler+0x54>
    8000079c:	00005517          	auipc	a0,0x5
    800007a0:	19c50513          	add	a0,a0,412 # 80005938 <rodata_start+0x938>
    800007a4:	1b0010ef          	jal	80001954 <uart_puts>
    800007a8:	01840493          	add	s1,s0,24
    800007ac:	055030ef          	jal	80004000 <scheduler>
    800007b0:	00043503          	ld	a0,0(s0)
    800007b4:	00840413          	add	s0,s0,8
    800007b8:	00050463          	beqz	a0,800007c0 <test_round_robin_scheduler+0xa8>
    800007bc:	738030ef          	jal	80003ef4 <free_proc>
    800007c0:	fe9418e3          	bne	s0,s1,800007b0 <test_round_robin_scheduler+0x98>
    800007c4:	05013403          	ld	s0,80(sp)
    800007c8:	05813083          	ld	ra,88(sp)
    800007cc:	04813483          	ld	s1,72(sp)
    800007d0:	04013903          	ld	s2,64(sp)
    800007d4:	03813983          	ld	s3,56(sp)
    800007d8:	03013a03          	ld	s4,48(sp)
    800007dc:	02813a83          	ld	s5,40(sp)
    800007e0:	02013b03          	ld	s6,32(sp)
    800007e4:	00005517          	auipc	a0,0x5
    800007e8:	19450513          	add	a0,a0,404 # 80005978 <rodata_start+0x978>
    800007ec:	06010113          	add	sp,sp,96
    800007f0:	1640106f          	j	80001954 <uart_puts>
    800007f4:	00048593          	mv	a1,s1
    800007f8:	00005517          	auipc	a0,0x5
    800007fc:	10050513          	add	a0,a0,256 # 800058f8 <rodata_start+0x8f8>
    80000800:	5e5000ef          	jal	800015e4 <printf>
    80000804:	f8dff06f          	j	80000790 <test_round_robin_scheduler+0x78>

0000000080000808 <test_trap_initialization>:
    80000808:	ff010113          	add	sp,sp,-16
    8000080c:	00005517          	auipc	a0,0x5
    80000810:	19450513          	add	a0,a0,404 # 800059a0 <rodata_start+0x9a0>
    80000814:	00113423          	sd	ra,8(sp)
    80000818:	00813023          	sd	s0,0(sp)
    8000081c:	138010ef          	jal	80001954 <uart_puts>
    80000820:	649020ef          	jal	80003668 <trap_init>
    80000824:	6f5020ef          	jal	80003718 <trap_init_hart>
    80000828:	10502473          	csrr	s0,stvec
    8000082c:	00005517          	auipc	a0,0x5
    80000830:	1b450513          	add	a0,a0,436 # 800059e0 <rodata_start+0x9e0>
    80000834:	00040593          	mv	a1,s0
    80000838:	5ad000ef          	jal	800015e4 <printf>
    8000083c:	02040c63          	beqz	s0,80000874 <test_trap_initialization+0x6c>
    80000840:	00005517          	auipc	a0,0x5
    80000844:	1c050513          	add	a0,a0,448 # 80005a00 <rodata_start+0xa00>
    80000848:	10c010ef          	jal	80001954 <uart_puts>
    8000084c:	104025f3          	csrr	a1,sie
    80000850:	00005517          	auipc	a0,0x5
    80000854:	1f850513          	add	a0,a0,504 # 80005a48 <rodata_start+0xa48>
    80000858:	58d000ef          	jal	800015e4 <printf>
    8000085c:	00013403          	ld	s0,0(sp)
    80000860:	00813083          	ld	ra,8(sp)
    80000864:	00005517          	auipc	a0,0x5
    80000868:	21450513          	add	a0,a0,532 # 80005a78 <rodata_start+0xa78>
    8000086c:	01010113          	add	sp,sp,16
    80000870:	0e40106f          	j	80001954 <uart_puts>
    80000874:	00005517          	auipc	a0,0x5
    80000878:	1ac50513          	add	a0,a0,428 # 80005a20 <rodata_start+0xa20>
    8000087c:	0d8010ef          	jal	80001954 <uart_puts>
    80000880:	fcdff06f          	j	8000084c <test_trap_initialization+0x44>

0000000080000884 <test_interrupt_control>:
    80000884:	ff010113          	add	sp,sp,-16
    80000888:	00005517          	auipc	a0,0x5
    8000088c:	20850513          	add	a0,a0,520 # 80005a90 <rodata_start+0xa90>
    80000890:	00113423          	sd	ra,8(sp)
    80000894:	00813023          	sd	s0,0(sp)
    80000898:	0bc010ef          	jal	80001954 <uart_puts>
    8000089c:	00005517          	auipc	a0,0x5
    800008a0:	23450513          	add	a0,a0,564 # 80005ad0 <rodata_start+0xad0>
    800008a4:	0b0010ef          	jal	80001954 <uart_puts>
    800008a8:	595020ef          	jal	8000363c <intr_off>
    800008ac:	5a1020ef          	jal	8000364c <intr_get>
    800008b0:	00050413          	mv	s0,a0
    800008b4:	00050593          	mv	a1,a0
    800008b8:	00005517          	auipc	a0,0x5
    800008bc:	23050513          	add	a0,a0,560 # 80005ae8 <rodata_start+0xae8>
    800008c0:	525000ef          	jal	800015e4 <printf>
    800008c4:	06041063          	bnez	s0,80000924 <test_interrupt_control+0xa0>
    800008c8:	00005517          	auipc	a0,0x5
    800008cc:	24050513          	add	a0,a0,576 # 80005b08 <rodata_start+0xb08>
    800008d0:	084010ef          	jal	80001954 <uart_puts>
    800008d4:	00005517          	auipc	a0,0x5
    800008d8:	26450513          	add	a0,a0,612 # 80005b38 <rodata_start+0xb38>
    800008dc:	078010ef          	jal	80001954 <uart_puts>
    800008e0:	54d020ef          	jal	8000362c <intr_on>
    800008e4:	569020ef          	jal	8000364c <intr_get>
    800008e8:	00050413          	mv	s0,a0
    800008ec:	00050593          	mv	a1,a0
    800008f0:	00005517          	auipc	a0,0x5
    800008f4:	26050513          	add	a0,a0,608 # 80005b50 <rodata_start+0xb50>
    800008f8:	4ed000ef          	jal	800015e4 <printf>
    800008fc:	02040c63          	beqz	s0,80000934 <test_interrupt_control+0xb0>
    80000900:	00005517          	auipc	a0,0x5
    80000904:	27050513          	add	a0,a0,624 # 80005b70 <rodata_start+0xb70>
    80000908:	04c010ef          	jal	80001954 <uart_puts>
    8000090c:	00013403          	ld	s0,0(sp)
    80000910:	00813083          	ld	ra,8(sp)
    80000914:	00005517          	auipc	a0,0x5
    80000918:	28c50513          	add	a0,a0,652 # 80005ba0 <rodata_start+0xba0>
    8000091c:	01010113          	add	sp,sp,16
    80000920:	0340106f          	j	80001954 <uart_puts>
    80000924:	00005517          	auipc	a0,0x5
    80000928:	1fc50513          	add	a0,a0,508 # 80005b20 <rodata_start+0xb20>
    8000092c:	028010ef          	jal	80001954 <uart_puts>
    80000930:	fa5ff06f          	j	800008d4 <test_interrupt_control+0x50>
    80000934:	00005517          	auipc	a0,0x5
    80000938:	25450513          	add	a0,a0,596 # 80005b88 <rodata_start+0xb88>
    8000093c:	018010ef          	jal	80001954 <uart_puts>
    80000940:	00013403          	ld	s0,0(sp)
    80000944:	00813083          	ld	ra,8(sp)
    80000948:	00005517          	auipc	a0,0x5
    8000094c:	25850513          	add	a0,a0,600 # 80005ba0 <rodata_start+0xba0>
    80000950:	01010113          	add	sp,sp,16
    80000954:	0000106f          	j	80001954 <uart_puts>

0000000080000958 <test_trapframe_allocation>:
    80000958:	fe010113          	add	sp,sp,-32
    8000095c:	00005517          	auipc	a0,0x5
    80000960:	25c50513          	add	a0,a0,604 # 80005bb8 <rodata_start+0xbb8>
    80000964:	00113c23          	sd	ra,24(sp)
    80000968:	00813823          	sd	s0,16(sp)
    8000096c:	00913423          	sd	s1,8(sp)
    80000970:	01213023          	sd	s2,0(sp)
    80000974:	7e1000ef          	jal	80001954 <uart_puts>
    80000978:	00005517          	auipc	a0,0x5
    8000097c:	28050513          	add	a0,a0,640 # 80005bf8 <rodata_start+0xbf8>
    80000980:	7d5000ef          	jal	80001954 <uart_puts>
    80000984:	405020ef          	jal	80003588 <alloc_trapframe>
    80000988:	00050413          	mv	s0,a0
    8000098c:	3fd020ef          	jal	80003588 <alloc_trapframe>
    80000990:	00050493          	mv	s1,a0
    80000994:	3f5020ef          	jal	80003588 <alloc_trapframe>
    80000998:	10040863          	beqz	s0,80000aa8 <test_trapframe_allocation+0x150>
    8000099c:	10048663          	beqz	s1,80000aa8 <test_trapframe_allocation+0x150>
    800009a0:	00050913          	mv	s2,a0
    800009a4:	10050263          	beqz	a0,80000aa8 <test_trapframe_allocation+0x150>
    800009a8:	00005517          	auipc	a0,0x5
    800009ac:	26850513          	add	a0,a0,616 # 80005c10 <rodata_start+0xc10>
    800009b0:	435000ef          	jal	800015e4 <printf>
    800009b4:	00040593          	mv	a1,s0
    800009b8:	00005517          	auipc	a0,0x5
    800009bc:	27850513          	add	a0,a0,632 # 80005c30 <rodata_start+0xc30>
    800009c0:	425000ef          	jal	800015e4 <printf>
    800009c4:	00048593          	mv	a1,s1
    800009c8:	00005517          	auipc	a0,0x5
    800009cc:	27850513          	add	a0,a0,632 # 80005c40 <rodata_start+0xc40>
    800009d0:	415000ef          	jal	800015e4 <printf>
    800009d4:	00090593          	mv	a1,s2
    800009d8:	00005517          	auipc	a0,0x5
    800009dc:	27850513          	add	a0,a0,632 # 80005c50 <rodata_start+0xc50>
    800009e0:	405000ef          	jal	800015e4 <printf>
    800009e4:	00940463          	beq	s0,s1,800009ec <test_trapframe_allocation+0x94>
    800009e8:	0f249663          	bne	s1,s2,80000ad4 <test_trapframe_allocation+0x17c>
    800009ec:	00005517          	auipc	a0,0x5
    800009f0:	29450513          	add	a0,a0,660 # 80005c80 <rodata_start+0xc80>
    800009f4:	761000ef          	jal	80001954 <uart_puts>
    800009f8:	00005517          	auipc	a0,0x5
    800009fc:	2b850513          	add	a0,a0,696 # 80005cb0 <rodata_start+0xcb0>
    80000a00:	755000ef          	jal	80001954 <uart_puts>
    80000a04:	21d957b7          	lui	a5,0x21d95
    80000a08:	00279793          	sll	a5,a5,0x2
    80000a0c:	32178793          	add	a5,a5,801 # 21d95321 <_entry-0x5e26acdf>
    80000a10:	12345737          	lui	a4,0x12345
    80000a14:	67870713          	add	a4,a4,1656 # 12345678 <_entry-0x6dcba988>
    80000a18:	00f43823          	sd	a5,16(s0)
    80000a1c:	02a00793          	li	a5,42
    80000a20:	00e43423          	sd	a4,8(s0)
    80000a24:	04f43823          	sd	a5,80(s0)
    80000a28:	00005517          	auipc	a0,0x5
    80000a2c:	2a850513          	add	a0,a0,680 # 80005cd0 <rodata_start+0xcd0>
    80000a30:	725000ef          	jal	80001954 <uart_puts>
    80000a34:	00005517          	auipc	a0,0x5
    80000a38:	2bc50513          	add	a0,a0,700 # 80005cf0 <rodata_start+0xcf0>
    80000a3c:	719000ef          	jal	80001954 <uart_puts>
    80000a40:	00040513          	mv	a0,s0
    80000a44:	3a5020ef          	jal	800035e8 <free_trapframe>
    80000a48:	00048513          	mv	a0,s1
    80000a4c:	39d020ef          	jal	800035e8 <free_trapframe>
    80000a50:	00090513          	mv	a0,s2
    80000a54:	395020ef          	jal	800035e8 <free_trapframe>
    80000a58:	00005517          	auipc	a0,0x5
    80000a5c:	2b050513          	add	a0,a0,688 # 80005d08 <rodata_start+0xd08>
    80000a60:	6f5000ef          	jal	80001954 <uart_puts>
    80000a64:	325020ef          	jal	80003588 <alloc_trapframe>
    80000a68:	00050413          	mv	s0,a0
    80000a6c:	04050463          	beqz	a0,80000ab4 <test_trapframe_allocation+0x15c>
    80000a70:	00050593          	mv	a1,a0
    80000a74:	00005517          	auipc	a0,0x5
    80000a78:	2b450513          	add	a0,a0,692 # 80005d28 <rodata_start+0xd28>
    80000a7c:	369000ef          	jal	800015e4 <printf>
    80000a80:	00040513          	mv	a0,s0
    80000a84:	365020ef          	jal	800035e8 <free_trapframe>
    80000a88:	01013403          	ld	s0,16(sp)
    80000a8c:	01813083          	ld	ra,24(sp)
    80000a90:	00813483          	ld	s1,8(sp)
    80000a94:	00013903          	ld	s2,0(sp)
    80000a98:	00005517          	auipc	a0,0x5
    80000a9c:	2e050513          	add	a0,a0,736 # 80005d78 <rodata_start+0xd78>
    80000aa0:	02010113          	add	sp,sp,32
    80000aa4:	6b10006f          	j	80001954 <uart_puts>
    80000aa8:	00005517          	auipc	a0,0x5
    80000aac:	2b050513          	add	a0,a0,688 # 80005d58 <rodata_start+0xd58>
    80000ab0:	6a5000ef          	jal	80001954 <uart_puts>
    80000ab4:	01013403          	ld	s0,16(sp)
    80000ab8:	01813083          	ld	ra,24(sp)
    80000abc:	00813483          	ld	s1,8(sp)
    80000ac0:	00013903          	ld	s2,0(sp)
    80000ac4:	00005517          	auipc	a0,0x5
    80000ac8:	2b450513          	add	a0,a0,692 # 80005d78 <rodata_start+0xd78>
    80000acc:	02010113          	add	sp,sp,32
    80000ad0:	6850006f          	j	80001954 <uart_puts>
    80000ad4:	00005517          	auipc	a0,0x5
    80000ad8:	18c50513          	add	a0,a0,396 # 80005c60 <rodata_start+0xc60>
    80000adc:	679000ef          	jal	80001954 <uart_puts>
    80000ae0:	f19ff06f          	j	800009f8 <test_trapframe_allocation+0xa0>

0000000080000ae4 <test_csr_operations>:
    80000ae4:	ff010113          	add	sp,sp,-16
    80000ae8:	00005517          	auipc	a0,0x5
    80000aec:	2a850513          	add	a0,a0,680 # 80005d90 <rodata_start+0xd90>
    80000af0:	00113423          	sd	ra,8(sp)
    80000af4:	00813023          	sd	s0,0(sp)
    80000af8:	65d000ef          	jal	80001954 <uart_puts>
    80000afc:	10002473          	csrr	s0,sstatus
    80000b00:	00005517          	auipc	a0,0x5
    80000b04:	2c850513          	add	a0,a0,712 # 80005dc8 <rodata_start+0xdc8>
    80000b08:	00040593          	mv	a1,s0
    80000b0c:	2d9000ef          	jal	800015e4 <printf>
    80000b10:	142025f3          	csrr	a1,scause
    80000b14:	00005517          	auipc	a0,0x5
    80000b18:	2cc50513          	add	a0,a0,716 # 80005de0 <rodata_start+0xde0>
    80000b1c:	2c9000ef          	jal	800015e4 <printf>
    80000b20:	141025f3          	csrr	a1,sepc
    80000b24:	00005517          	auipc	a0,0x5
    80000b28:	2d450513          	add	a0,a0,724 # 80005df8 <rodata_start+0xdf8>
    80000b2c:	2b9000ef          	jal	800015e4 <printf>
    80000b30:	00005517          	auipc	a0,0x5
    80000b34:	2e050513          	add	a0,a0,736 # 80005e10 <rodata_start+0xe10>
    80000b38:	61d000ef          	jal	80001954 <uart_puts>
    80000b3c:	00000793          	li	a5,0
    80000b40:	10079073          	csrw	sstatus,a5
    80000b44:	100025f3          	csrr	a1,sstatus
    80000b48:	00005517          	auipc	a0,0x5
    80000b4c:	2e050513          	add	a0,a0,736 # 80005e28 <rodata_start+0xe28>
    80000b50:	295000ef          	jal	800015e4 <printf>
    80000b54:	10041073          	csrw	sstatus,s0
    80000b58:	00005517          	auipc	a0,0x5
    80000b5c:	2e850513          	add	a0,a0,744 # 80005e40 <rodata_start+0xe40>
    80000b60:	5f5000ef          	jal	80001954 <uart_puts>
    80000b64:	00013403          	ld	s0,0(sp)
    80000b68:	00813083          	ld	ra,8(sp)
    80000b6c:	00005517          	auipc	a0,0x5
    80000b70:	2ec50513          	add	a0,a0,748 # 80005e58 <rodata_start+0xe58>
    80000b74:	01010113          	add	sp,sp,16
    80000b78:	5dd0006f          	j	80001954 <uart_puts>

0000000080000b7c <test_exception_definitions>:
    80000b7c:	ff010113          	add	sp,sp,-16
    80000b80:	00005517          	auipc	a0,0x5
    80000b84:	2f050513          	add	a0,a0,752 # 80005e70 <rodata_start+0xe70>
    80000b88:	00113423          	sd	ra,8(sp)
    80000b8c:	5c9000ef          	jal	80001954 <uart_puts>
    80000b90:	00005517          	auipc	a0,0x5
    80000b94:	32050513          	add	a0,a0,800 # 80005eb0 <rodata_start+0xeb0>
    80000b98:	24d000ef          	jal	800015e4 <printf>
    80000b9c:	00200593          	li	a1,2
    80000ba0:	00005517          	auipc	a0,0x5
    80000ba4:	32850513          	add	a0,a0,808 # 80005ec8 <rodata_start+0xec8>
    80000ba8:	23d000ef          	jal	800015e4 <printf>
    80000bac:	00d00593          	li	a1,13
    80000bb0:	00005517          	auipc	a0,0x5
    80000bb4:	33850513          	add	a0,a0,824 # 80005ee8 <rodata_start+0xee8>
    80000bb8:	22d000ef          	jal	800015e4 <printf>
    80000bbc:	00f00593          	li	a1,15
    80000bc0:	00005517          	auipc	a0,0x5
    80000bc4:	34850513          	add	a0,a0,840 # 80005f08 <rodata_start+0xf08>
    80000bc8:	21d000ef          	jal	800015e4 <printf>
    80000bcc:	00800593          	li	a1,8
    80000bd0:	00005517          	auipc	a0,0x5
    80000bd4:	35850513          	add	a0,a0,856 # 80005f28 <rodata_start+0xf28>
    80000bd8:	20d000ef          	jal	800015e4 <printf>
    80000bdc:	00005517          	auipc	a0,0x5
    80000be0:	36450513          	add	a0,a0,868 # 80005f40 <rodata_start+0xf40>
    80000be4:	201000ef          	jal	800015e4 <printf>
    80000be8:	00500593          	li	a1,5
    80000bec:	00005517          	auipc	a0,0x5
    80000bf0:	36c50513          	add	a0,a0,876 # 80005f58 <rodata_start+0xf58>
    80000bf4:	1f1000ef          	jal	800015e4 <printf>
    80000bf8:	00700593          	li	a1,7
    80000bfc:	00005517          	auipc	a0,0x5
    80000c00:	37450513          	add	a0,a0,884 # 80005f70 <rodata_start+0xf70>
    80000c04:	1e1000ef          	jal	800015e4 <printf>
    80000c08:	00900593          	li	a1,9
    80000c0c:	00005517          	auipc	a0,0x5
    80000c10:	37c50513          	add	a0,a0,892 # 80005f88 <rodata_start+0xf88>
    80000c14:	1d1000ef          	jal	800015e4 <printf>
    80000c18:	00005517          	auipc	a0,0x5
    80000c1c:	38850513          	add	a0,a0,904 # 80005fa0 <rodata_start+0xfa0>
    80000c20:	535000ef          	jal	80001954 <uart_puts>
    80000c24:	00813083          	ld	ra,8(sp)
    80000c28:	00005517          	auipc	a0,0x5
    80000c2c:	3a050513          	add	a0,a0,928 # 80005fc8 <rodata_start+0xfc8>
    80000c30:	01010113          	add	sp,sp,16
    80000c34:	5210006f          	j	80001954 <uart_puts>

0000000080000c38 <test_trapframe_structure>:
    80000c38:	ff010113          	add	sp,sp,-16
    80000c3c:	00005517          	auipc	a0,0x5
    80000c40:	3a450513          	add	a0,a0,932 # 80005fe0 <rodata_start+0xfe0>
    80000c44:	00113423          	sd	ra,8(sp)
    80000c48:	50d000ef          	jal	80001954 <uart_puts>
    80000c4c:	11000593          	li	a1,272
    80000c50:	00005517          	auipc	a0,0x5
    80000c54:	3c850513          	add	a0,a0,968 # 80006018 <rodata_start+0x1018>
    80000c58:	18d000ef          	jal	800015e4 <printf>
    80000c5c:	00005517          	auipc	a0,0x5
    80000c60:	3e450513          	add	a0,a0,996 # 80006040 <rodata_start+0x1040>
    80000c64:	181000ef          	jal	800015e4 <printf>
    80000c68:	00005517          	auipc	a0,0x5
    80000c6c:	40850513          	add	a0,a0,1032 # 80006070 <rodata_start+0x1070>
    80000c70:	175000ef          	jal	800015e4 <printf>
    80000c74:	00800593          	li	a1,8
    80000c78:	00005517          	auipc	a0,0x5
    80000c7c:	41050513          	add	a0,a0,1040 # 80006088 <rodata_start+0x1088>
    80000c80:	165000ef          	jal	800015e4 <printf>
    80000c84:	00800593          	li	a1,8
    80000c88:	00005517          	auipc	a0,0x5
    80000c8c:	41850513          	add	a0,a0,1048 # 800060a0 <rodata_start+0x10a0>
    80000c90:	155000ef          	jal	800015e4 <printf>
    80000c94:	00800593          	li	a1,8
    80000c98:	00005517          	auipc	a0,0x5
    80000c9c:	42850513          	add	a0,a0,1064 # 800060c0 <rodata_start+0x10c0>
    80000ca0:	145000ef          	jal	800015e4 <printf>
    80000ca4:	02200693          	li	a3,34
    80000ca8:	00800613          	li	a2,8
    80000cac:	11000593          	li	a1,272
    80000cb0:	00005517          	auipc	a0,0x5
    80000cb4:	43050513          	add	a0,a0,1072 # 800060e0 <rodata_start+0x10e0>
    80000cb8:	12d000ef          	jal	800015e4 <printf>
    80000cbc:	00005517          	auipc	a0,0x5
    80000cc0:	44c50513          	add	a0,a0,1100 # 80006108 <rodata_start+0x1108>
    80000cc4:	491000ef          	jal	80001954 <uart_puts>
    80000cc8:	00813083          	ld	ra,8(sp)
    80000ccc:	00005517          	auipc	a0,0x5
    80000cd0:	46450513          	add	a0,a0,1124 # 80006130 <rodata_start+0x1130>
    80000cd4:	01010113          	add	sp,sp,16
    80000cd8:	47d0006f          	j	80001954 <uart_puts>

0000000080000cdc <test_interrupt_handlers>:
    80000cdc:	ff010113          	add	sp,sp,-16
    80000ce0:	00005517          	auipc	a0,0x5
    80000ce4:	46850513          	add	a0,a0,1128 # 80006148 <rodata_start+0x1148>
    80000ce8:	00113423          	sd	ra,8(sp)
    80000cec:	469000ef          	jal	80001954 <uart_puts>
    80000cf0:	00005517          	auipc	a0,0x5
    80000cf4:	49850513          	add	a0,a0,1176 # 80006188 <rodata_start+0x1188>
    80000cf8:	45d000ef          	jal	80001954 <uart_puts>
    80000cfc:	00413797          	auipc	a5,0x413
    80000d00:	7ac78793          	add	a5,a5,1964 # 804144a8 <trap_handlers>
    80000d04:	00414697          	auipc	a3,0x414
    80000d08:	82468693          	add	a3,a3,-2012 # 80414528 <trapframe_pool>
    80000d0c:	00000593          	li	a1,0
    80000d10:	0007b703          	ld	a4,0(a5)
    80000d14:	00878793          	add	a5,a5,8
    80000d18:	00070463          	beqz	a4,80000d20 <test_interrupt_handlers+0x44>
    80000d1c:	0015859b          	addw	a1,a1,1
    80000d20:	fed798e3          	bne	a5,a3,80000d10 <test_interrupt_handlers+0x34>
    80000d24:	00005517          	auipc	a0,0x5
    80000d28:	48450513          	add	a0,a0,1156 # 800061a8 <rodata_start+0x11a8>
    80000d2c:	0b9000ef          	jal	800015e4 <printf>
    80000d30:	00005517          	auipc	a0,0x5
    80000d34:	4a050513          	add	a0,a0,1184 # 800061d0 <rodata_start+0x11d0>
    80000d38:	41d000ef          	jal	80001954 <uart_puts>
    80000d3c:	00813083          	ld	ra,8(sp)
    80000d40:	00005517          	auipc	a0,0x5
    80000d44:	4c050513          	add	a0,a0,1216 # 80006200 <rodata_start+0x1200>
    80000d48:	01010113          	add	sp,sp,16
    80000d4c:	4090006f          	j	80001954 <uart_puts>

0000000080000d50 <test_timer_interrupt>:
    80000d50:	fd010113          	add	sp,sp,-48
    80000d54:	00005517          	auipc	a0,0x5
    80000d58:	4c450513          	add	a0,a0,1220 # 80006218 <rodata_start+0x1218>
    80000d5c:	02113423          	sd	ra,40(sp)
    80000d60:	02813023          	sd	s0,32(sp)
    80000d64:	00913c23          	sd	s1,24(sp)
    80000d68:	3ed000ef          	jal	80001954 <uart_puts>
    80000d6c:	00005517          	auipc	a0,0x5
    80000d70:	4e450513          	add	a0,a0,1252 # 80006250 <rodata_start+0x1250>
    80000d74:	3e1000ef          	jal	80001954 <uart_puts>
    80000d78:	00005517          	auipc	a0,0x5
    80000d7c:	50850513          	add	a0,a0,1288 # 80006280 <rodata_start+0x1280>
    80000d80:	3d5000ef          	jal	80001954 <uart_puts>
    80000d84:	00425417          	auipc	s0,0x425
    80000d88:	4cc40413          	add	s0,s0,1228 # 80426250 <ticks>
    80000d8c:	00005517          	auipc	a0,0x5
    80000d90:	52450513          	add	a0,a0,1316 # 800062b0 <rodata_start+0x12b0>
    80000d94:	3c1000ef          	jal	80001954 <uart_puts>
    80000d98:	00043483          	ld	s1,0(s0)
    80000d9c:	00005517          	auipc	a0,0x5
    80000da0:	54450513          	add	a0,a0,1348 # 800062e0 <rodata_start+0x12e0>
    80000da4:	00048593          	mv	a1,s1
    80000da8:	03d000ef          	jal	800015e4 <printf>
    80000dac:	081020ef          	jal	8000362c <intr_on>
    80000db0:	00005517          	auipc	a0,0x5
    80000db4:	54850513          	add	a0,a0,1352 # 800062f8 <rodata_start+0x12f8>
    80000db8:	39d000ef          	jal	80001954 <uart_puts>
    80000dbc:	00005517          	auipc	a0,0x5
    80000dc0:	55450513          	add	a0,a0,1364 # 80006310 <rodata_start+0x1310>
    80000dc4:	391000ef          	jal	80001954 <uart_puts>
    80000dc8:	00043783          	ld	a5,0(s0)
    80000dcc:	00000593          	li	a1,0
    80000dd0:	00f13423          	sd	a5,8(sp)
    80000dd4:	00813783          	ld	a5,8(sp)
    80000dd8:	00043703          	ld	a4,0(s0)
    80000ddc:	02f71263          	bne	a4,a5,80000e00 <test_timer_interrupt+0xb0>
    80000de0:	05f5e6b7          	lui	a3,0x5f5e
    80000de4:	10068693          	add	a3,a3,256 # 5f5e100 <_entry-0x7a0a1f00>
    80000de8:	0080006f          	j	80000df0 <test_timer_interrupt+0xa0>
    80000dec:	00d58a63          	beq	a1,a3,80000e00 <test_timer_interrupt+0xb0>
    80000df0:	00813703          	ld	a4,8(sp)
    80000df4:	00043783          	ld	a5,0(s0)
    80000df8:	0015859b          	addw	a1,a1,1
    80000dfc:	fef708e3          	beq	a4,a5,80000dec <test_timer_interrupt+0x9c>
    80000e00:	00005517          	auipc	a0,0x5
    80000e04:	52850513          	add	a0,a0,1320 # 80006328 <rodata_start+0x1328>
    80000e08:	7dc000ef          	jal	800015e4 <printf>
    80000e0c:	00043583          	ld	a1,0(s0)
    80000e10:	00005517          	auipc	a0,0x5
    80000e14:	53050513          	add	a0,a0,1328 # 80006340 <rodata_start+0x1340>
    80000e18:	7cc000ef          	jal	800015e4 <printf>
    80000e1c:	00043783          	ld	a5,0(s0)
    80000e20:	04f4f063          	bgeu	s1,a5,80000e60 <test_timer_interrupt+0x110>
    80000e24:	00043583          	ld	a1,0(s0)
    80000e28:	00005517          	auipc	a0,0x5
    80000e2c:	53050513          	add	a0,a0,1328 # 80006358 <rodata_start+0x1358>
    80000e30:	409585b3          	sub	a1,a1,s1
    80000e34:	7b0000ef          	jal	800015e4 <printf>
    80000e38:	00005517          	auipc	a0,0x5
    80000e3c:	55850513          	add	a0,a0,1368 # 80006390 <rodata_start+0x1390>
    80000e40:	315000ef          	jal	80001954 <uart_puts>
    80000e44:	02013403          	ld	s0,32(sp)
    80000e48:	02813083          	ld	ra,40(sp)
    80000e4c:	01813483          	ld	s1,24(sp)
    80000e50:	00005517          	auipc	a0,0x5
    80000e54:	58850513          	add	a0,a0,1416 # 800063d8 <rodata_start+0x13d8>
    80000e58:	03010113          	add	sp,sp,48
    80000e5c:	2f90006f          	j	80001954 <uart_puts>
    80000e60:	00005517          	auipc	a0,0x5
    80000e64:	55850513          	add	a0,a0,1368 # 800063b8 <rodata_start+0x13b8>
    80000e68:	2ed000ef          	jal	80001954 <uart_puts>
    80000e6c:	02013403          	ld	s0,32(sp)
    80000e70:	02813083          	ld	ra,40(sp)
    80000e74:	01813483          	ld	s1,24(sp)
    80000e78:	00005517          	auipc	a0,0x5
    80000e7c:	56050513          	add	a0,a0,1376 # 800063d8 <rodata_start+0x13d8>
    80000e80:	03010113          	add	sp,sp,48
    80000e84:	2d10006f          	j	80001954 <uart_puts>

0000000080000e88 <test_repeated_initialization>:
    80000e88:	fe010113          	add	sp,sp,-32
    80000e8c:	00005517          	auipc	a0,0x5
    80000e90:	56450513          	add	a0,a0,1380 # 800063f0 <rodata_start+0x13f0>
    80000e94:	00113c23          	sd	ra,24(sp)
    80000e98:	00813823          	sd	s0,16(sp)
    80000e9c:	00913423          	sd	s1,8(sp)
    80000ea0:	01213023          	sd	s2,0(sp)
    80000ea4:	2b1000ef          	jal	80001954 <uart_puts>
    80000ea8:	00005517          	auipc	a0,0x5
    80000eac:	58850513          	add	a0,a0,1416 # 80006430 <rodata_start+0x1430>
    80000eb0:	2a5000ef          	jal	80001954 <uart_puts>
    80000eb4:	00000413          	li	s0,0
    80000eb8:	00005917          	auipc	s2,0x5
    80000ebc:	59090913          	add	s2,s2,1424 # 80006448 <rodata_start+0x1448>
    80000ec0:	00500493          	li	s1,5
    80000ec4:	7a4020ef          	jal	80003668 <trap_init>
    80000ec8:	0014041b          	addw	s0,s0,1
    80000ecc:	04d020ef          	jal	80003718 <trap_init_hart>
    80000ed0:	00040593          	mv	a1,s0
    80000ed4:	00090513          	mv	a0,s2
    80000ed8:	70c000ef          	jal	800015e4 <printf>
    80000edc:	fe9414e3          	bne	s0,s1,80000ec4 <test_repeated_initialization+0x3c>
    80000ee0:	00005517          	auipc	a0,0x5
    80000ee4:	58850513          	add	a0,a0,1416 # 80006468 <rodata_start+0x1468>
    80000ee8:	26d000ef          	jal	80001954 <uart_puts>
    80000eec:	01013403          	ld	s0,16(sp)
    80000ef0:	01813083          	ld	ra,24(sp)
    80000ef4:	00813483          	ld	s1,8(sp)
    80000ef8:	00013903          	ld	s2,0(sp)
    80000efc:	00005517          	auipc	a0,0x5
    80000f00:	59450513          	add	a0,a0,1428 # 80006490 <rodata_start+0x1490>
    80000f04:	02010113          	add	sp,sp,32
    80000f08:	24d0006f          	j	80001954 <uart_puts>

0000000080000f0c <run_all_system_tests>:
    80000f0c:	ff010113          	add	sp,sp,-16
    80000f10:	00004517          	auipc	a0,0x4
    80000f14:	41850513          	add	a0,a0,1048 # 80005328 <rodata_start+0x328>
    80000f18:	00113423          	sd	ra,8(sp)
    80000f1c:	239000ef          	jal	80001954 <uart_puts>
    80000f20:	00004517          	auipc	a0,0x4
    80000f24:	5a050513          	add	a0,a0,1440 # 800054c0 <rodata_start+0x4c0>
    80000f28:	22d000ef          	jal	80001954 <uart_puts>
    80000f2c:	00005517          	auipc	a0,0x5
    80000f30:	57c50513          	add	a0,a0,1404 # 800064a8 <rodata_start+0x14a8>
    80000f34:	221000ef          	jal	80001954 <uart_puts>
    80000f38:	00004517          	auipc	a0,0x4
    80000f3c:	6b050513          	add	a0,a0,1712 # 800055e8 <rodata_start+0x5e8>
    80000f40:	215000ef          	jal	80001954 <uart_puts>
    80000f44:	8c5ff0ef          	jal	80000808 <test_trap_initialization>
    80000f48:	93dff0ef          	jal	80000884 <test_interrupt_control>
    80000f4c:	a0dff0ef          	jal	80000958 <test_trapframe_allocation>
    80000f50:	b95ff0ef          	jal	80000ae4 <test_csr_operations>
    80000f54:	c29ff0ef          	jal	80000b7c <test_exception_definitions>
    80000f58:	ce1ff0ef          	jal	80000c38 <test_trapframe_structure>
    80000f5c:	d81ff0ef          	jal	80000cdc <test_interrupt_handlers>
    80000f60:	df1ff0ef          	jal	80000d50 <test_timer_interrupt>
    80000f64:	f25ff0ef          	jal	80000e88 <test_repeated_initialization>
    80000f68:	00004517          	auipc	a0,0x4
    80000f6c:	3c050513          	add	a0,a0,960 # 80005328 <rodata_start+0x328>
    80000f70:	1e5000ef          	jal	80001954 <uart_puts>
    80000f74:	00004517          	auipc	a0,0x4
    80000f78:	54c50513          	add	a0,a0,1356 # 800054c0 <rodata_start+0x4c0>
    80000f7c:	1d9000ef          	jal	80001954 <uart_puts>
    80000f80:	00005517          	auipc	a0,0x5
    80000f84:	58850513          	add	a0,a0,1416 # 80006508 <rodata_start+0x1508>
    80000f88:	1cd000ef          	jal	80001954 <uart_puts>
    80000f8c:	00813083          	ld	ra,8(sp)
    80000f90:	00004517          	auipc	a0,0x4
    80000f94:	77850513          	add	a0,a0,1912 # 80005708 <rodata_start+0x708>
    80000f98:	01010113          	add	sp,sp,16
    80000f9c:	1b90006f          	j	80001954 <uart_puts>

0000000080000fa0 <run_interrupt_exception_tests>:
    80000fa0:	f6dff06f          	j	80000f0c <run_all_system_tests>

0000000080000fa4 <main>:
    80000fa4:	ff010113          	add	sp,sp,-16
    80000fa8:	00004517          	auipc	a0,0x4
    80000fac:	51850513          	add	a0,a0,1304 # 800054c0 <rodata_start+0x4c0>
    80000fb0:	00113423          	sd	ra,8(sp)
    80000fb4:	1a1000ef          	jal	80001954 <uart_puts>
    80000fb8:	00005517          	auipc	a0,0x5
    80000fbc:	5a850513          	add	a0,a0,1448 # 80006560 <rodata_start+0x1560>
    80000fc0:	195000ef          	jal	80001954 <uart_puts>
    80000fc4:	00004517          	auipc	a0,0x4
    80000fc8:	74450513          	add	a0,a0,1860 # 80005708 <rodata_start+0x708>
    80000fcc:	189000ef          	jal	80001954 <uart_puts>
    80000fd0:	00005517          	auipc	a0,0x5
    80000fd4:	5e850513          	add	a0,a0,1512 # 800065b8 <rodata_start+0x15b8>
    80000fd8:	17d000ef          	jal	80001954 <uart_puts>
    80000fdc:	01100593          	li	a1,17
    80000fe0:	02001537          	lui	a0,0x2001
    80000fe4:	01b59593          	sll	a1,a1,0x1b
    80000fe8:	00651513          	sll	a0,a0,0x6
    80000fec:	195000ef          	jal	80001980 <pmm_init>
    80000ff0:	00005517          	auipc	a0,0x5
    80000ff4:	60050513          	add	a0,a0,1536 # 800065f0 <rodata_start+0x15f0>
    80000ff8:	15d000ef          	jal	80001954 <uart_puts>
    80000ffc:	00005517          	auipc	a0,0x5
    80001000:	62c50513          	add	a0,a0,1580 # 80006628 <rodata_start+0x1628>
    80001004:	151000ef          	jal	80001954 <uart_puts>
    80001008:	660020ef          	jal	80003668 <trap_init>
    8000100c:	70c020ef          	jal	80003718 <trap_init_hart>
    80001010:	00005517          	auipc	a0,0x5
    80001014:	65050513          	add	a0,a0,1616 # 80006660 <rodata_start+0x1660>
    80001018:	13d000ef          	jal	80001954 <uart_puts>
    8000101c:	00005517          	auipc	a0,0x5
    80001020:	67450513          	add	a0,a0,1652 # 80006690 <rodata_start+0x1690>
    80001024:	131000ef          	jal	80001954 <uart_puts>
    80001028:	764020ef          	jal	8000378c <timerinit>
    8000102c:	00005517          	auipc	a0,0x5
    80001030:	69c50513          	add	a0,a0,1692 # 800066c8 <rodata_start+0x16c8>
    80001034:	121000ef          	jal	80001954 <uart_puts>
    80001038:	00005517          	auipc	a0,0x5
    8000103c:	6c050513          	add	a0,a0,1728 # 800066f8 <rodata_start+0x16f8>
    80001040:	115000ef          	jal	80001954 <uart_puts>
    80001044:	4c9020ef          	jal	80003d0c <proc_init>
    80001048:	00005517          	auipc	a0,0x5
    8000104c:	6e850513          	add	a0,a0,1768 # 80006730 <rodata_start+0x1730>
    80001050:	105000ef          	jal	80001954 <uart_puts>
    80001054:	df8ff0ef          	jal	8000064c <run_process_management_tests>
    80001058:	ec0ff0ef          	jal	80000718 <test_round_robin_scheduler>
    8000105c:	00005517          	auipc	a0,0x5
    80001060:	70450513          	add	a0,a0,1796 # 80006760 <rodata_start+0x1760>
    80001064:	0f1000ef          	jal	80001954 <uart_puts>
    80001068:	0000006f          	j	80001068 <main+0xc4>

000000008000106c <print_number>:
    8000106c:	0c050663          	beqz	a0,80001138 <print_number+0xcc>
    80001070:	fd010113          	add	sp,sp,-48
    80001074:	02113423          	sd	ra,40(sp)
    80001078:	02813023          	sd	s0,32(sp)
    8000107c:	08061a63          	bnez	a2,80001110 <print_number+0xa4>
    80001080:	0005071b          	sext.w	a4,a0
    80001084:	00000613          	li	a2,0
    80001088:	0005859b          	sext.w	a1,a1
    8000108c:	00010fa3          	sb	zero,31(sp)
    80001090:	01e10813          	add	a6,sp,30
    80001094:	01f00693          	li	a3,31
    80001098:	00006317          	auipc	t1,0x6
    8000109c:	9d830313          	add	t1,t1,-1576 # 80006a70 <digits>
    800010a0:	02b777bb          	remuw	a5,a4,a1
    800010a4:	fff80813          	add	a6,a6,-1
    800010a8:	0007089b          	sext.w	a7,a4
    800010ac:	00068e13          	mv	t3,a3
    800010b0:	fff6869b          	addw	a3,a3,-1
    800010b4:	02079793          	sll	a5,a5,0x20
    800010b8:	0207d793          	srl	a5,a5,0x20
    800010bc:	00f307b3          	add	a5,t1,a5
    800010c0:	0007c503          	lbu	a0,0(a5)
    800010c4:	02b7573b          	divuw	a4,a4,a1
    800010c8:	00a800a3          	sb	a0,1(a6)
    800010cc:	fcb8fae3          	bgeu	a7,a1,800010a0 <print_number+0x34>
    800010d0:	04060a63          	beqz	a2,80001124 <print_number+0xb8>
    800010d4:	ffee069b          	addw	a3,t3,-2
    800010d8:	02068793          	add	a5,a3,32
    800010dc:	002787b3          	add	a5,a5,sp
    800010e0:	02d00713          	li	a4,45
    800010e4:	fee78023          	sb	a4,-32(a5)
    800010e8:	02d00513          	li	a0,45
    800010ec:	00d10433          	add	s0,sp,a3
    800010f0:	00140413          	add	s0,s0,1
    800010f4:	049000ef          	jal	8000193c <uart_putc>
    800010f8:	00044503          	lbu	a0,0(s0)
    800010fc:	fe051ae3          	bnez	a0,800010f0 <print_number+0x84>
    80001100:	02813083          	ld	ra,40(sp)
    80001104:	02013403          	ld	s0,32(sp)
    80001108:	03010113          	add	sp,sp,48
    8000110c:	00008067          	ret
    80001110:	f60558e3          	bgez	a0,80001080 <print_number+0x14>
    80001114:	80000737          	lui	a4,0x80000
    80001118:	f6e508e3          	beq	a0,a4,80001088 <print_number+0x1c>
    8000111c:	40a0073b          	negw	a4,a0
    80001120:	f69ff06f          	j	80001088 <print_number+0x1c>
    80001124:	fc0514e3          	bnez	a0,800010ec <print_number+0x80>
    80001128:	02813083          	ld	ra,40(sp)
    8000112c:	02013403          	ld	s0,32(sp)
    80001130:	03010113          	add	sp,sp,48
    80001134:	00008067          	ret
    80001138:	03000513          	li	a0,48
    8000113c:	0010006f          	j	8000193c <uart_putc>

0000000080001140 <print_number_long.part.0>:
    80001140:	fd010113          	add	sp,sp,-48
    80001144:	02113423          	sd	ra,40(sp)
    80001148:	02813023          	sd	s0,32(sp)
    8000114c:	00050793          	mv	a5,a0
    80001150:	00060463          	beqz	a2,80001158 <print_number_long.part.0+0x18>
    80001154:	08054c63          	bltz	a0,800011ec <print_number_long.part.0+0xac>
    80001158:	00000613          	li	a2,0
    8000115c:	00010fa3          	sb	zero,31(sp)
    80001160:	01e10813          	add	a6,sp,30
    80001164:	01f00693          	li	a3,31
    80001168:	00006317          	auipc	t1,0x6
    8000116c:	90830313          	add	t1,t1,-1784 # 80006a70 <digits>
    80001170:	02b7f733          	remu	a4,a5,a1
    80001174:	fff80813          	add	a6,a6,-1
    80001178:	00078893          	mv	a7,a5
    8000117c:	00068e13          	mv	t3,a3
    80001180:	fff6869b          	addw	a3,a3,-1
    80001184:	00e30733          	add	a4,t1,a4
    80001188:	00074503          	lbu	a0,0(a4) # ffffffff80000000 <bss_end+0xfffffffeffbd9d90>
    8000118c:	02b7d7b3          	divu	a5,a5,a1
    80001190:	00a800a3          	sb	a0,1(a6)
    80001194:	fcb8fee3          	bgeu	a7,a1,80001170 <print_number_long.part.0+0x30>
    80001198:	04060063          	beqz	a2,800011d8 <print_number_long.part.0+0x98>
    8000119c:	ffee069b          	addw	a3,t3,-2
    800011a0:	02068793          	add	a5,a3,32
    800011a4:	002787b3          	add	a5,a5,sp
    800011a8:	02d00713          	li	a4,45
    800011ac:	fee78023          	sb	a4,-32(a5)
    800011b0:	02d00513          	li	a0,45
    800011b4:	00d10433          	add	s0,sp,a3
    800011b8:	00140413          	add	s0,s0,1
    800011bc:	780000ef          	jal	8000193c <uart_putc>
    800011c0:	00044503          	lbu	a0,0(s0)
    800011c4:	fe051ae3          	bnez	a0,800011b8 <print_number_long.part.0+0x78>
    800011c8:	02813083          	ld	ra,40(sp)
    800011cc:	02013403          	ld	s0,32(sp)
    800011d0:	03010113          	add	sp,sp,48
    800011d4:	00008067          	ret
    800011d8:	fc051ee3          	bnez	a0,800011b4 <print_number_long.part.0+0x74>
    800011dc:	02813083          	ld	ra,40(sp)
    800011e0:	02013403          	ld	s0,32(sp)
    800011e4:	03010113          	add	sp,sp,48
    800011e8:	00008067          	ret
    800011ec:	40a007b3          	neg	a5,a0
    800011f0:	f6dff06f          	j	8000115c <print_number_long.part.0+0x1c>

00000000800011f4 <clear_screen>:
    800011f4:	00005517          	auipc	a0,0x5
    800011f8:	5a450513          	add	a0,a0,1444 # 80006798 <rodata_start+0x1798>
    800011fc:	7580006f          	j	80001954 <uart_puts>

0000000080001200 <clear_line>:
    80001200:	00005517          	auipc	a0,0x5
    80001204:	5a050513          	add	a0,a0,1440 # 800067a0 <rodata_start+0x17a0>
    80001208:	74c0006f          	j	80001954 <uart_puts>

000000008000120c <goto_xy>:
    8000120c:	fd010113          	add	sp,sp,-48
    80001210:	00913c23          	sd	s1,24(sp)
    80001214:	00050493          	mv	s1,a0
    80001218:	01b00513          	li	a0,27
    8000121c:	02113423          	sd	ra,40(sp)
    80001220:	02813023          	sd	s0,32(sp)
    80001224:	01213823          	sd	s2,16(sp)
    80001228:	00058413          	mv	s0,a1
    8000122c:	01313423          	sd	s3,8(sp)
    80001230:	70c000ef          	jal	8000193c <uart_putc>
    80001234:	05b00513          	li	a0,91
    80001238:	704000ef          	jal	8000193c <uart_putc>
    8000123c:	06300793          	li	a5,99
    80001240:	0c87cc63          	blt	a5,s0,80001318 <goto_xy+0x10c>
    80001244:	00900793          	li	a5,9
    80001248:	0487ce63          	blt	a5,s0,800012a4 <goto_xy+0x98>
    8000124c:	12805a63          	blez	s0,80001380 <goto_xy+0x174>
    80001250:	0304041b          	addw	s0,s0,48
    80001254:	0ff47513          	zext.b	a0,s0
    80001258:	6e4000ef          	jal	8000193c <uart_putc>
    8000125c:	03b00513          	li	a0,59
    80001260:	6dc000ef          	jal	8000193c <uart_putc>
    80001264:	06300793          	li	a5,99
    80001268:	0697c863          	blt	a5,s1,800012d8 <goto_xy+0xcc>
    8000126c:	00900793          	li	a5,9
    80001270:	0e97c463          	blt	a5,s1,80001358 <goto_xy+0x14c>
    80001274:	10905c63          	blez	s1,8000138c <goto_xy+0x180>
    80001278:	0304851b          	addw	a0,s1,48
    8000127c:	0ff57513          	zext.b	a0,a0
    80001280:	6bc000ef          	jal	8000193c <uart_putc>
    80001284:	02013403          	ld	s0,32(sp)
    80001288:	02813083          	ld	ra,40(sp)
    8000128c:	01813483          	ld	s1,24(sp)
    80001290:	01013903          	ld	s2,16(sp)
    80001294:	00813983          	ld	s3,8(sp)
    80001298:	04800513          	li	a0,72
    8000129c:	03010113          	add	sp,sp,48
    800012a0:	69c0006f          	j	8000193c <uart_putc>
    800012a4:	00a00913          	li	s2,10
    800012a8:	0324453b          	divw	a0,s0,s2
    800012ac:	0305051b          	addw	a0,a0,48
    800012b0:	0ff57513          	zext.b	a0,a0
    800012b4:	688000ef          	jal	8000193c <uart_putc>
    800012b8:	0324643b          	remw	s0,s0,s2
    800012bc:	0304041b          	addw	s0,s0,48
    800012c0:	0ff47513          	zext.b	a0,s0
    800012c4:	678000ef          	jal	8000193c <uart_putc>
    800012c8:	03b00513          	li	a0,59
    800012cc:	670000ef          	jal	8000193c <uart_putc>
    800012d0:	06300793          	li	a5,99
    800012d4:	f897dce3          	bge	a5,s1,8000126c <goto_xy+0x60>
    800012d8:	06400413          	li	s0,100
    800012dc:	0284c53b          	divw	a0,s1,s0
    800012e0:	00a00913          	li	s2,10
    800012e4:	0305051b          	addw	a0,a0,48
    800012e8:	0ff57513          	zext.b	a0,a0
    800012ec:	650000ef          	jal	8000193c <uart_putc>
    800012f0:	0284e53b          	remw	a0,s1,s0
    800012f4:	0325453b          	divw	a0,a0,s2
    800012f8:	0305051b          	addw	a0,a0,48
    800012fc:	0ff57513          	zext.b	a0,a0
    80001300:	63c000ef          	jal	8000193c <uart_putc>
    80001304:	0324e53b          	remw	a0,s1,s2
    80001308:	0305051b          	addw	a0,a0,48
    8000130c:	0ff57513          	zext.b	a0,a0
    80001310:	62c000ef          	jal	8000193c <uart_putc>
    80001314:	f71ff06f          	j	80001284 <goto_xy+0x78>
    80001318:	06400913          	li	s2,100
    8000131c:	0324453b          	divw	a0,s0,s2
    80001320:	00a00993          	li	s3,10
    80001324:	0305051b          	addw	a0,a0,48
    80001328:	0ff57513          	zext.b	a0,a0
    8000132c:	610000ef          	jal	8000193c <uart_putc>
    80001330:	0324653b          	remw	a0,s0,s2
    80001334:	0335453b          	divw	a0,a0,s3
    80001338:	0305051b          	addw	a0,a0,48
    8000133c:	0ff57513          	zext.b	a0,a0
    80001340:	5fc000ef          	jal	8000193c <uart_putc>
    80001344:	0334643b          	remw	s0,s0,s3
    80001348:	0304041b          	addw	s0,s0,48
    8000134c:	0ff47513          	zext.b	a0,s0
    80001350:	5ec000ef          	jal	8000193c <uart_putc>
    80001354:	f09ff06f          	j	8000125c <goto_xy+0x50>
    80001358:	00a00413          	li	s0,10
    8000135c:	0284c53b          	divw	a0,s1,s0
    80001360:	0305051b          	addw	a0,a0,48
    80001364:	0ff57513          	zext.b	a0,a0
    80001368:	5d4000ef          	jal	8000193c <uart_putc>
    8000136c:	0284e53b          	remw	a0,s1,s0
    80001370:	0305051b          	addw	a0,a0,48
    80001374:	0ff57513          	zext.b	a0,a0
    80001378:	5c4000ef          	jal	8000193c <uart_putc>
    8000137c:	f09ff06f          	j	80001284 <goto_xy+0x78>
    80001380:	03100513          	li	a0,49
    80001384:	5b8000ef          	jal	8000193c <uart_putc>
    80001388:	ed5ff06f          	j	8000125c <goto_xy+0x50>
    8000138c:	03100513          	li	a0,49
    80001390:	5ac000ef          	jal	8000193c <uart_putc>
    80001394:	ef1ff06f          	j	80001284 <goto_xy+0x78>

0000000080001398 <printf_color>:
    80001398:	f8010113          	add	sp,sp,-128
    8000139c:	02913c23          	sd	s1,56(sp)
    800013a0:	00050493          	mv	s1,a0
    800013a4:	01b00513          	li	a0,27
    800013a8:	06f13423          	sd	a5,104(sp)
    800013ac:	04113423          	sd	ra,72(sp)
    800013b0:	04813023          	sd	s0,64(sp)
    800013b4:	04c13823          	sd	a2,80(sp)
    800013b8:	04d13c23          	sd	a3,88(sp)
    800013bc:	06e13023          	sd	a4,96(sp)
    800013c0:	07013823          	sd	a6,112(sp)
    800013c4:	07113c23          	sd	a7,120(sp)
    800013c8:	00058413          	mv	s0,a1
    800013cc:	03213823          	sd	s2,48(sp)
    800013d0:	03313423          	sd	s3,40(sp)
    800013d4:	03413023          	sd	s4,32(sp)
    800013d8:	01513c23          	sd	s5,24(sp)
    800013dc:	560000ef          	jal	8000193c <uart_putc>
    800013e0:	05b00513          	li	a0,91
    800013e4:	558000ef          	jal	8000193c <uart_putc>
    800013e8:	06300793          	li	a5,99
    800013ec:	1a97e063          	bltu	a5,s1,8000158c <printf_color+0x1f4>
    800013f0:	00900793          	li	a5,9
    800013f4:	1497e663          	bltu	a5,s1,80001540 <printf_color+0x1a8>
    800013f8:	0304851b          	addw	a0,s1,48
    800013fc:	0ff57513          	zext.b	a0,a0
    80001400:	53c000ef          	jal	8000193c <uart_putc>
    80001404:	06d00513          	li	a0,109
    80001408:	534000ef          	jal	8000193c <uart_putc>
    8000140c:	1c040863          	beqz	s0,800015dc <printf_color+0x244>
    80001410:	00044503          	lbu	a0,0(s0)
    80001414:	05010793          	add	a5,sp,80
    80001418:	00f13423          	sd	a5,8(sp)
    8000141c:	00000a93          	li	s5,0
    80001420:	06050463          	beqz	a0,80001488 <printf_color+0xf0>
    80001424:	02500913          	li	s2,37
    80001428:	02000a13          	li	s4,32
    8000142c:	00005997          	auipc	s3,0x5
    80001430:	4b498993          	add	s3,s3,1204 # 800068e0 <rodata_start+0x18e0>
    80001434:	00140493          	add	s1,s0,1
    80001438:	13251863          	bne	a0,s2,80001568 <printf_color+0x1d0>
    8000143c:	00144783          	lbu	a5,1(s0)
    80001440:	14078063          	beqz	a5,80001580 <printf_color+0x1e8>
    80001444:	13278863          	beq	a5,s2,80001574 <printf_color+0x1dc>
    80001448:	fa87879b          	addw	a5,a5,-88
    8000144c:	0ff7f793          	zext.b	a5,a5
    80001450:	00fa6c63          	bltu	s4,a5,80001468 <printf_color+0xd0>
    80001454:	00279793          	sll	a5,a5,0x2
    80001458:	013787b3          	add	a5,a5,s3
    8000145c:	0007a783          	lw	a5,0(a5)
    80001460:	013787b3          	add	a5,a5,s3
    80001464:	00078067          	jr	a5
    80001468:	02500513          	li	a0,37
    8000146c:	4d0000ef          	jal	8000193c <uart_putc>
    80001470:	00144503          	lbu	a0,1(s0)
    80001474:	ffe00a93          	li	s5,-2
    80001478:	4c4000ef          	jal	8000193c <uart_putc>
    8000147c:	0014c503          	lbu	a0,1(s1)
    80001480:	00148413          	add	s0,s1,1
    80001484:	fa0518e3          	bnez	a0,80001434 <printf_color+0x9c>
    80001488:	00005517          	auipc	a0,0x5
    8000148c:	32850513          	add	a0,a0,808 # 800067b0 <rodata_start+0x17b0>
    80001490:	4c4000ef          	jal	80001954 <uart_puts>
    80001494:	04813083          	ld	ra,72(sp)
    80001498:	04013403          	ld	s0,64(sp)
    8000149c:	03813483          	ld	s1,56(sp)
    800014a0:	03013903          	ld	s2,48(sp)
    800014a4:	02813983          	ld	s3,40(sp)
    800014a8:	02013a03          	ld	s4,32(sp)
    800014ac:	000a8513          	mv	a0,s5
    800014b0:	01813a83          	ld	s5,24(sp)
    800014b4:	08010113          	add	sp,sp,128
    800014b8:	00008067          	ret
    800014bc:	00813783          	ld	a5,8(sp)
    800014c0:	00000613          	li	a2,0
    800014c4:	01000593          	li	a1,16
    800014c8:	0007a503          	lw	a0,0(a5)
    800014cc:	00878793          	add	a5,a5,8
    800014d0:	00f13423          	sd	a5,8(sp)
    800014d4:	b99ff0ef          	jal	8000106c <print_number>
    800014d8:	fa5ff06f          	j	8000147c <printf_color+0xe4>
    800014dc:	00813783          	ld	a5,8(sp)
    800014e0:	0007c503          	lbu	a0,0(a5)
    800014e4:	00878793          	add	a5,a5,8
    800014e8:	00f13423          	sd	a5,8(sp)
    800014ec:	450000ef          	jal	8000193c <uart_putc>
    800014f0:	f8dff06f          	j	8000147c <printf_color+0xe4>
    800014f4:	00813783          	ld	a5,8(sp)
    800014f8:	0007b403          	ld	s0,0(a5)
    800014fc:	00878793          	add	a5,a5,8
    80001500:	00f13423          	sd	a5,8(sp)
    80001504:	00041863          	bnez	s0,80001514 <printf_color+0x17c>
    80001508:	0c40006f          	j	800015cc <printf_color+0x234>
    8000150c:	00140413          	add	s0,s0,1
    80001510:	42c000ef          	jal	8000193c <uart_putc>
    80001514:	00044503          	lbu	a0,0(s0)
    80001518:	fe051ae3          	bnez	a0,8000150c <printf_color+0x174>
    8000151c:	f61ff06f          	j	8000147c <printf_color+0xe4>
    80001520:	00813783          	ld	a5,8(sp)
    80001524:	00100613          	li	a2,1
    80001528:	00a00593          	li	a1,10
    8000152c:	0007a503          	lw	a0,0(a5)
    80001530:	00878793          	add	a5,a5,8
    80001534:	00f13423          	sd	a5,8(sp)
    80001538:	b35ff0ef          	jal	8000106c <print_number>
    8000153c:	f41ff06f          	j	8000147c <printf_color+0xe4>
    80001540:	00a00913          	li	s2,10
    80001544:	0324d53b          	divuw	a0,s1,s2
    80001548:	0305051b          	addw	a0,a0,48
    8000154c:	0ff57513          	zext.b	a0,a0
    80001550:	3ec000ef          	jal	8000193c <uart_putc>
    80001554:	0324f53b          	remuw	a0,s1,s2
    80001558:	0305051b          	addw	a0,a0,48
    8000155c:	07f57513          	and	a0,a0,127
    80001560:	3dc000ef          	jal	8000193c <uart_putc>
    80001564:	ea1ff06f          	j	80001404 <printf_color+0x6c>
    80001568:	3d4000ef          	jal	8000193c <uart_putc>
    8000156c:	00040493          	mv	s1,s0
    80001570:	f0dff06f          	j	8000147c <printf_color+0xe4>
    80001574:	02500513          	li	a0,37
    80001578:	3c4000ef          	jal	8000193c <uart_putc>
    8000157c:	f01ff06f          	j	8000147c <printf_color+0xe4>
    80001580:	02500513          	li	a0,37
    80001584:	3b8000ef          	jal	8000193c <uart_putc>
    80001588:	f01ff06f          	j	80001488 <printf_color+0xf0>
    8000158c:	06400913          	li	s2,100
    80001590:	0324d53b          	divuw	a0,s1,s2
    80001594:	00a00993          	li	s3,10
    80001598:	0305051b          	addw	a0,a0,48
    8000159c:	0ff57513          	zext.b	a0,a0
    800015a0:	39c000ef          	jal	8000193c <uart_putc>
    800015a4:	0324f53b          	remuw	a0,s1,s2
    800015a8:	0335553b          	divuw	a0,a0,s3
    800015ac:	0305051b          	addw	a0,a0,48
    800015b0:	0ff57513          	zext.b	a0,a0
    800015b4:	388000ef          	jal	8000193c <uart_putc>
    800015b8:	0334f53b          	remuw	a0,s1,s3
    800015bc:	0305051b          	addw	a0,a0,48
    800015c0:	07f57513          	and	a0,a0,127
    800015c4:	378000ef          	jal	8000193c <uart_putc>
    800015c8:	e3dff06f          	j	80001404 <printf_color+0x6c>
    800015cc:	00005517          	auipc	a0,0x5
    800015d0:	1dc50513          	add	a0,a0,476 # 800067a8 <rodata_start+0x17a8>
    800015d4:	380000ef          	jal	80001954 <uart_puts>
    800015d8:	ea5ff06f          	j	8000147c <printf_color+0xe4>
    800015dc:	fff00a93          	li	s5,-1
    800015e0:	eb5ff06f          	j	80001494 <printf_color+0xfc>

00000000800015e4 <printf>:
    800015e4:	f6010113          	add	sp,sp,-160
    800015e8:	04113c23          	sd	ra,88(sp)
    800015ec:	04813823          	sd	s0,80(sp)
    800015f0:	04913423          	sd	s1,72(sp)
    800015f4:	05213023          	sd	s2,64(sp)
    800015f8:	03313c23          	sd	s3,56(sp)
    800015fc:	03413823          	sd	s4,48(sp)
    80001600:	03513423          	sd	s5,40(sp)
    80001604:	03613023          	sd	s6,32(sp)
    80001608:	01713c23          	sd	s7,24(sp)
    8000160c:	06b13423          	sd	a1,104(sp)
    80001610:	06c13823          	sd	a2,112(sp)
    80001614:	06d13c23          	sd	a3,120(sp)
    80001618:	08e13023          	sd	a4,128(sp)
    8000161c:	08f13423          	sd	a5,136(sp)
    80001620:	09013823          	sd	a6,144(sp)
    80001624:	09113c23          	sd	a7,152(sp)
    80001628:	20050c63          	beqz	a0,80001840 <printf+0x25c>
    8000162c:	00050413          	mv	s0,a0
    80001630:	00054503          	lbu	a0,0(a0)
    80001634:	06810793          	add	a5,sp,104
    80001638:	00f13423          	sd	a5,8(sp)
    8000163c:	00000b13          	li	s6,0
    80001640:	06050c63          	beqz	a0,800016b8 <printf+0xd4>
    80001644:	02500493          	li	s1,37
    80001648:	06c00993          	li	s3,108
    8000164c:	02000a13          	li	s4,32
    80001650:	00005917          	auipc	s2,0x5
    80001654:	31490913          	add	s2,s2,788 # 80006964 <rodata_start+0x1964>
    80001658:	00005a97          	auipc	s5,0x5
    8000165c:	390a8a93          	add	s5,s5,912 # 800069e8 <rodata_start+0x19e8>
    80001660:	04951463          	bne	a0,s1,800016a8 <printf+0xc4>
    80001664:	00144783          	lbu	a5,1(s0)
    80001668:	18078e63          	beqz	a5,80001804 <printf+0x220>
    8000166c:	11378063          	beq	a5,s3,8000176c <printf+0x188>
    80001670:	00140413          	add	s0,s0,1
    80001674:	16978863          	beq	a5,s1,800017e4 <printf+0x200>
    80001678:	fa87879b          	addw	a5,a5,-88
    8000167c:	0ff7f793          	zext.b	a5,a5
    80001680:	00fa6c63          	bltu	s4,a5,80001698 <printf+0xb4>
    80001684:	00279793          	sll	a5,a5,0x2
    80001688:	012787b3          	add	a5,a5,s2
    8000168c:	0007a783          	lw	a5,0(a5)
    80001690:	012787b3          	add	a5,a5,s2
    80001694:	00078067          	jr	a5
    80001698:	02500513          	li	a0,37
    8000169c:	2a0000ef          	jal	8000193c <uart_putc>
    800016a0:	00044503          	lbu	a0,0(s0)
    800016a4:	ffe00b13          	li	s6,-2
    800016a8:	294000ef          	jal	8000193c <uart_putc>
    800016ac:	00144503          	lbu	a0,1(s0)
    800016b0:	00140413          	add	s0,s0,1
    800016b4:	fa0516e3          	bnez	a0,80001660 <printf+0x7c>
    800016b8:	05813083          	ld	ra,88(sp)
    800016bc:	05013403          	ld	s0,80(sp)
    800016c0:	04813483          	ld	s1,72(sp)
    800016c4:	04013903          	ld	s2,64(sp)
    800016c8:	03813983          	ld	s3,56(sp)
    800016cc:	03013a03          	ld	s4,48(sp)
    800016d0:	02813a83          	ld	s5,40(sp)
    800016d4:	01813b83          	ld	s7,24(sp)
    800016d8:	000b0513          	mv	a0,s6
    800016dc:	02013b03          	ld	s6,32(sp)
    800016e0:	0a010113          	add	sp,sp,160
    800016e4:	00008067          	ret
    800016e8:	00813783          	ld	a5,8(sp)
    800016ec:	00000613          	li	a2,0
    800016f0:	01000593          	li	a1,16
    800016f4:	0007a503          	lw	a0,0(a5)
    800016f8:	00878793          	add	a5,a5,8
    800016fc:	00f13423          	sd	a5,8(sp)
    80001700:	96dff0ef          	jal	8000106c <print_number>
    80001704:	fa9ff06f          	j	800016ac <printf+0xc8>
    80001708:	00813783          	ld	a5,8(sp)
    8000170c:	0007c503          	lbu	a0,0(a5)
    80001710:	00878793          	add	a5,a5,8
    80001714:	00f13423          	sd	a5,8(sp)
    80001718:	224000ef          	jal	8000193c <uart_putc>
    8000171c:	f91ff06f          	j	800016ac <printf+0xc8>
    80001720:	00813783          	ld	a5,8(sp)
    80001724:	0007bb83          	ld	s7,0(a5)
    80001728:	00878793          	add	a5,a5,8
    8000172c:	00f13423          	sd	a5,8(sp)
    80001730:	000b9863          	bnez	s7,80001740 <printf+0x15c>
    80001734:	0e80006f          	j	8000181c <printf+0x238>
    80001738:	001b8b93          	add	s7,s7,1
    8000173c:	200000ef          	jal	8000193c <uart_putc>
    80001740:	000bc503          	lbu	a0,0(s7)
    80001744:	fe051ae3          	bnez	a0,80001738 <printf+0x154>
    80001748:	f65ff06f          	j	800016ac <printf+0xc8>
    8000174c:	00813783          	ld	a5,8(sp)
    80001750:	00100613          	li	a2,1
    80001754:	00a00593          	li	a1,10
    80001758:	0007a503          	lw	a0,0(a5)
    8000175c:	00878793          	add	a5,a5,8
    80001760:	00f13423          	sd	a5,8(sp)
    80001764:	909ff0ef          	jal	8000106c <print_number>
    80001768:	f45ff06f          	j	800016ac <printf+0xc8>
    8000176c:	00244783          	lbu	a5,2(s0)
    80001770:	00240413          	add	s0,s0,2
    80001774:	0a078c63          	beqz	a5,8000182c <printf+0x248>
    80001778:	06978663          	beq	a5,s1,800017e4 <printf+0x200>
    8000177c:	fa87879b          	addw	a5,a5,-88
    80001780:	0ff7f793          	zext.b	a5,a5
    80001784:	06fa6663          	bltu	s4,a5,800017f0 <printf+0x20c>
    80001788:	00279793          	sll	a5,a5,0x2
    8000178c:	015787b3          	add	a5,a5,s5
    80001790:	0007a783          	lw	a5,0(a5)
    80001794:	015787b3          	add	a5,a5,s5
    80001798:	00078067          	jr	a5
    8000179c:	00813783          	ld	a5,8(sp)
    800017a0:	0007b503          	ld	a0,0(a5)
    800017a4:	00878793          	add	a5,a5,8
    800017a8:	00f13423          	sd	a5,8(sp)
    800017ac:	06050263          	beqz	a0,80001810 <printf+0x22c>
    800017b0:	00000613          	li	a2,0
    800017b4:	01000593          	li	a1,16
    800017b8:	989ff0ef          	jal	80001140 <print_number_long.part.0>
    800017bc:	ef1ff06f          	j	800016ac <printf+0xc8>
    800017c0:	00813783          	ld	a5,8(sp)
    800017c4:	0007b503          	ld	a0,0(a5)
    800017c8:	00878793          	add	a5,a5,8
    800017cc:	00f13423          	sd	a5,8(sp)
    800017d0:	04050063          	beqz	a0,80001810 <printf+0x22c>
    800017d4:	00100613          	li	a2,1
    800017d8:	00a00593          	li	a1,10
    800017dc:	965ff0ef          	jal	80001140 <print_number_long.part.0>
    800017e0:	ecdff06f          	j	800016ac <printf+0xc8>
    800017e4:	02500513          	li	a0,37
    800017e8:	154000ef          	jal	8000193c <uart_putc>
    800017ec:	ec1ff06f          	j	800016ac <printf+0xc8>
    800017f0:	02500513          	li	a0,37
    800017f4:	148000ef          	jal	8000193c <uart_putc>
    800017f8:	06c00513          	li	a0,108
    800017fc:	140000ef          	jal	8000193c <uart_putc>
    80001800:	ea1ff06f          	j	800016a0 <printf+0xbc>
    80001804:	02500513          	li	a0,37
    80001808:	134000ef          	jal	8000193c <uart_putc>
    8000180c:	eadff06f          	j	800016b8 <printf+0xd4>
    80001810:	03000513          	li	a0,48
    80001814:	128000ef          	jal	8000193c <uart_putc>
    80001818:	e95ff06f          	j	800016ac <printf+0xc8>
    8000181c:	00005517          	auipc	a0,0x5
    80001820:	f8c50513          	add	a0,a0,-116 # 800067a8 <rodata_start+0x17a8>
    80001824:	130000ef          	jal	80001954 <uart_puts>
    80001828:	e85ff06f          	j	800016ac <printf+0xc8>
    8000182c:	02500513          	li	a0,37
    80001830:	10c000ef          	jal	8000193c <uart_putc>
    80001834:	06c00513          	li	a0,108
    80001838:	104000ef          	jal	8000193c <uart_putc>
    8000183c:	e7dff06f          	j	800016b8 <printf+0xd4>
    80001840:	fff00b13          	li	s6,-1
    80001844:	e75ff06f          	j	800016b8 <printf+0xd4>

0000000080001848 <test_printf_basic>:
    80001848:	ff010113          	add	sp,sp,-16
    8000184c:	02a00593          	li	a1,42
    80001850:	00005517          	auipc	a0,0x5
    80001854:	f6850513          	add	a0,a0,-152 # 800067b8 <rodata_start+0x17b8>
    80001858:	00113423          	sd	ra,8(sp)
    8000185c:	d89ff0ef          	jal	800015e4 <printf>
    80001860:	f8500593          	li	a1,-123
    80001864:	00005517          	auipc	a0,0x5
    80001868:	f6c50513          	add	a0,a0,-148 # 800067d0 <rodata_start+0x17d0>
    8000186c:	d79ff0ef          	jal	800015e4 <printf>
    80001870:	00000593          	li	a1,0
    80001874:	00005517          	auipc	a0,0x5
    80001878:	f7450513          	add	a0,a0,-140 # 800067e8 <rodata_start+0x17e8>
    8000187c:	d69ff0ef          	jal	800015e4 <printf>
    80001880:	000015b7          	lui	a1,0x1
    80001884:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80001888:	00005517          	auipc	a0,0x5
    8000188c:	f7850513          	add	a0,a0,-136 # 80006800 <rodata_start+0x1800>
    80001890:	d55ff0ef          	jal	800015e4 <printf>
    80001894:	00005597          	auipc	a1,0x5
    80001898:	f8458593          	add	a1,a1,-124 # 80006818 <rodata_start+0x1818>
    8000189c:	00005517          	auipc	a0,0x5
    800018a0:	f8450513          	add	a0,a0,-124 # 80006820 <rodata_start+0x1820>
    800018a4:	d41ff0ef          	jal	800015e4 <printf>
    800018a8:	05800593          	li	a1,88
    800018ac:	00005517          	auipc	a0,0x5
    800018b0:	f8c50513          	add	a0,a0,-116 # 80006838 <rodata_start+0x1838>
    800018b4:	d31ff0ef          	jal	800015e4 <printf>
    800018b8:	00813083          	ld	ra,8(sp)
    800018bc:	00005517          	auipc	a0,0x5
    800018c0:	f9450513          	add	a0,a0,-108 # 80006850 <rodata_start+0x1850>
    800018c4:	01010113          	add	sp,sp,16
    800018c8:	d1dff06f          	j	800015e4 <printf>

00000000800018cc <test_printf_edge_cases>:
    800018cc:	800005b7          	lui	a1,0x80000
    800018d0:	ff010113          	add	sp,sp,-16
    800018d4:	fff5c593          	not	a1,a1
    800018d8:	00005517          	auipc	a0,0x5
    800018dc:	f9050513          	add	a0,a0,-112 # 80006868 <rodata_start+0x1868>
    800018e0:	00113423          	sd	ra,8(sp)
    800018e4:	d01ff0ef          	jal	800015e4 <printf>
    800018e8:	800005b7          	lui	a1,0x80000
    800018ec:	00005517          	auipc	a0,0x5
    800018f0:	f8c50513          	add	a0,a0,-116 # 80006878 <rodata_start+0x1878>
    800018f4:	cf1ff0ef          	jal	800015e4 <printf>
    800018f8:	00000593          	li	a1,0
    800018fc:	00005517          	auipc	a0,0x5
    80001900:	f8c50513          	add	a0,a0,-116 # 80006888 <rodata_start+0x1888>
    80001904:	ce1ff0ef          	jal	800015e4 <printf>
    80001908:	00004597          	auipc	a1,0x4
    8000190c:	ec858593          	add	a1,a1,-312 # 800057d0 <rodata_start+0x7d0>
    80001910:	00005517          	auipc	a0,0x5
    80001914:	f9050513          	add	a0,a0,-112 # 800068a0 <rodata_start+0x18a0>
    80001918:	ccdff0ef          	jal	800015e4 <printf>
    8000191c:	00005517          	auipc	a0,0x5
    80001920:	f9c50513          	add	a0,a0,-100 # 800068b8 <rodata_start+0x18b8>
    80001924:	cc1ff0ef          	jal	800015e4 <printf>
    80001928:	00813083          	ld	ra,8(sp)
    8000192c:	00005517          	auipc	a0,0x5
    80001930:	f9c50513          	add	a0,a0,-100 # 800068c8 <rodata_start+0x18c8>
    80001934:	01010113          	add	sp,sp,16
    80001938:	cadff06f          	j	800015e4 <printf>

000000008000193c <uart_putc>:
    8000193c:	10000737          	lui	a4,0x10000
    80001940:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80001944:	0207f793          	and	a5,a5,32
    80001948:	fe078ce3          	beqz	a5,80001940 <uart_putc+0x4>
    8000194c:	00a70023          	sb	a0,0(a4)
    80001950:	00008067          	ret

0000000080001954 <uart_puts>:
    80001954:	00054683          	lbu	a3,0(a0)
    80001958:	02068263          	beqz	a3,8000197c <uart_puts+0x28>
    8000195c:	10000737          	lui	a4,0x10000
    80001960:	00150513          	add	a0,a0,1
    80001964:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80001968:	0207f793          	and	a5,a5,32
    8000196c:	fe078ce3          	beqz	a5,80001964 <uart_puts+0x10>
    80001970:	00d70023          	sb	a3,0(a4)
    80001974:	00054683          	lbu	a3,0(a0)
    80001978:	fe0694e3          	bnez	a3,80001960 <uart_puts+0xc>
    8000197c:	00008067          	ret

0000000080001980 <pmm_init>:
    80001980:	000017b7          	lui	a5,0x1
    80001984:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001988:	00f50533          	add	a0,a0,a5
    8000198c:	fffff737          	lui	a4,0xfffff
    80001990:	00e57533          	and	a0,a0,a4
    80001994:	00e5f5b3          	and	a1,a1,a4
    80001998:	00425797          	auipc	a5,0x425
    8000199c:	88a7bc23          	sd	a0,-1896(a5) # 80426230 <mem_start>
    800019a0:	00425797          	auipc	a5,0x425
    800019a4:	88b7b423          	sd	a1,-1912(a5) # 80426228 <mem_end>
    800019a8:	00425797          	auipc	a5,0x425
    800019ac:	8807b823          	sd	zero,-1904(a5) # 80426238 <freelist>
    800019b0:	02b57e63          	bgeu	a0,a1,800019ec <pmm_init+0x6c>
    800019b4:	02050e63          	beqz	a0,800019f0 <pmm_init+0x70>
    800019b8:	00050793          	mv	a5,a0
    800019bc:	00000613          	li	a2,0
    800019c0:	00000693          	li	a3,0
    800019c4:	00a7e863          	bltu	a5,a0,800019d4 <pmm_init+0x54>
    800019c8:	00d7b023          	sd	a3,0(a5)
    800019cc:	00100613          	li	a2,1
    800019d0:	00078693          	mv	a3,a5
    800019d4:	00001737          	lui	a4,0x1
    800019d8:	00e787b3          	add	a5,a5,a4
    800019dc:	feb7e4e3          	bltu	a5,a1,800019c4 <pmm_init+0x44>
    800019e0:	00060663          	beqz	a2,800019ec <pmm_init+0x6c>
    800019e4:	00425797          	auipc	a5,0x425
    800019e8:	84d7ba23          	sd	a3,-1964(a5) # 80426238 <freelist>
    800019ec:	00008067          	ret
    800019f0:	00000793          	li	a5,0
    800019f4:	00000613          	li	a2,0
    800019f8:	00000693          	li	a3,0
    800019fc:	fd9ff06f          	j	800019d4 <pmm_init+0x54>

0000000080001a00 <alloc_page>:
    80001a00:	00425797          	auipc	a5,0x425
    80001a04:	83878793          	add	a5,a5,-1992 # 80426238 <freelist>
    80001a08:	0007b503          	ld	a0,0(a5)
    80001a0c:	00050663          	beqz	a0,80001a18 <alloc_page+0x18>
    80001a10:	00053703          	ld	a4,0(a0)
    80001a14:	00e7b023          	sd	a4,0(a5)
    80001a18:	00008067          	ret

0000000080001a1c <free_page>:
    80001a1c:	02050c63          	beqz	a0,80001a54 <free_page+0x38>
    80001a20:	00425797          	auipc	a5,0x425
    80001a24:	8107b783          	ld	a5,-2032(a5) # 80426230 <mem_start>
    80001a28:	02f56663          	bltu	a0,a5,80001a54 <free_page+0x38>
    80001a2c:	00424797          	auipc	a5,0x424
    80001a30:	7fc7b783          	ld	a5,2044(a5) # 80426228 <mem_end>
    80001a34:	02f57063          	bgeu	a0,a5,80001a54 <free_page+0x38>
    80001a38:	03451793          	sll	a5,a0,0x34
    80001a3c:	00079c63          	bnez	a5,80001a54 <free_page+0x38>
    80001a40:	00424797          	auipc	a5,0x424
    80001a44:	7f878793          	add	a5,a5,2040 # 80426238 <freelist>
    80001a48:	0007b703          	ld	a4,0(a5)
    80001a4c:	00a7b023          	sd	a0,0(a5)
    80001a50:	00e53023          	sd	a4,0(a0)
    80001a54:	00008067          	ret

0000000080001a58 <alloc_pages>:
    80001a58:	00050613          	mv	a2,a0
    80001a5c:	08a05863          	blez	a0,80001aec <alloc_pages+0x94>
    80001a60:	00424317          	auipc	t1,0x424
    80001a64:	7d830313          	add	t1,t1,2008 # 80426238 <freelist>
    80001a68:	00100793          	li	a5,1
    80001a6c:	00033803          	ld	a6,0(t1)
    80001a70:	06f50463          	beq	a0,a5,80001ad8 <alloc_pages+0x80>
    80001a74:	06080c63          	beqz	a6,80001aec <alloc_pages+0x94>
    80001a78:	00083503          	ld	a0,0(a6)
    80001a7c:	00080793          	mv	a5,a6
    80001a80:	00100713          	li	a4,1
    80001a84:	00000893          	li	a7,0
    80001a88:	000015b7          	lui	a1,0x1
    80001a8c:	0200006f          	j	80001aac <alloc_pages+0x54>
    80001a90:	02d50463          	beq	a0,a3,80001ab8 <alloc_pages+0x60>
    80001a94:	00053683          	ld	a3,0(a0)
    80001a98:	00078893          	mv	a7,a5
    80001a9c:	00050813          	mv	a6,a0
    80001aa0:	00100713          	li	a4,1
    80001aa4:	00050793          	mv	a5,a0
    80001aa8:	00068513          	mv	a0,a3
    80001aac:	00b786b3          	add	a3,a5,a1
    80001ab0:	fe0510e3          	bnez	a0,80001a90 <alloc_pages+0x38>
    80001ab4:	00008067          	ret
    80001ab8:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80001abc:	00053683          	ld	a3,0(a0)
    80001ac0:	fee612e3          	bne	a2,a4,80001aa4 <alloc_pages+0x4c>
    80001ac4:	02088863          	beqz	a7,80001af4 <alloc_pages+0x9c>
    80001ac8:	00d8b023          	sd	a3,0(a7)
    80001acc:	00053023          	sd	zero,0(a0)
    80001ad0:	00080513          	mv	a0,a6
    80001ad4:	00008067          	ret
    80001ad8:	00080663          	beqz	a6,80001ae4 <alloc_pages+0x8c>
    80001adc:	00083783          	ld	a5,0(a6)
    80001ae0:	00f33023          	sd	a5,0(t1)
    80001ae4:	00080513          	mv	a0,a6
    80001ae8:	00008067          	ret
    80001aec:	00000513          	li	a0,0
    80001af0:	00008067          	ret
    80001af4:	00053023          	sd	zero,0(a0)
    80001af8:	00d33023          	sd	a3,0(t1)
    80001afc:	00080513          	mv	a0,a6
    80001b00:	00008067          	ret

0000000080001b04 <walk_lookup>:
    80001b04:	01e5d793          	srl	a5,a1,0x1e
    80001b08:	1ff7f793          	and	a5,a5,511
    80001b0c:	00379793          	sll	a5,a5,0x3
    80001b10:	00f50533          	add	a0,a0,a5
    80001b14:	00053703          	ld	a4,0(a0)
    80001b18:	00177793          	and	a5,a4,1
    80001b1c:	04078a63          	beqz	a5,80001b70 <walk_lookup+0x6c>
    80001b20:	00e77793          	and	a5,a4,14
    80001b24:	04079663          	bnez	a5,80001b70 <walk_lookup+0x6c>
    80001b28:	0155d793          	srl	a5,a1,0x15
    80001b2c:	00a75713          	srl	a4,a4,0xa
    80001b30:	1ff7f793          	and	a5,a5,511
    80001b34:	00c71713          	sll	a4,a4,0xc
    80001b38:	00379793          	sll	a5,a5,0x3
    80001b3c:	00e787b3          	add	a5,a5,a4
    80001b40:	0007b503          	ld	a0,0(a5)
    80001b44:	00157793          	and	a5,a0,1
    80001b48:	02078463          	beqz	a5,80001b70 <walk_lookup+0x6c>
    80001b4c:	00e57793          	and	a5,a0,14
    80001b50:	02079063          	bnez	a5,80001b70 <walk_lookup+0x6c>
    80001b54:	00c5d593          	srl	a1,a1,0xc
    80001b58:	00a55513          	srl	a0,a0,0xa
    80001b5c:	1ff5f593          	and	a1,a1,511
    80001b60:	00359593          	sll	a1,a1,0x3
    80001b64:	00c51513          	sll	a0,a0,0xc
    80001b68:	00b50533          	add	a0,a0,a1
    80001b6c:	00008067          	ret
    80001b70:	00000513          	li	a0,0
    80001b74:	00008067          	ret

0000000080001b78 <free_swap_slot.part.0>:
    80001b78:	0055579b          	srlw	a5,a0,0x5
    80001b7c:	0000f617          	auipc	a2,0xf
    80001b80:	48460613          	add	a2,a2,1156 # 80011000 <swap_mgr>
    80001b84:	00279793          	sll	a5,a5,0x2
    80001b88:	00f607b3          	add	a5,a2,a5
    80001b8c:	0007a583          	lw	a1,0(a5)
    80001b90:	00100713          	li	a4,1
    80001b94:	00a7173b          	sllw	a4,a4,a0
    80001b98:	00e5f6b3          	and	a3,a1,a4
    80001b9c:	0006869b          	sext.w	a3,a3
    80001ba0:	02068463          	beqz	a3,80001bc8 <free_swap_slot.part.0+0x50>
    80001ba4:	08862683          	lw	a3,136(a2)
    80001ba8:	fff74713          	not	a4,a4
    80001bac:	08062803          	lw	a6,128(a2)
    80001bb0:	00e5f5b3          	and	a1,a1,a4
    80001bb4:	fff6871b          	addw	a4,a3,-1
    80001bb8:	00b7a023          	sw	a1,0(a5)
    80001bbc:	08e62423          	sw	a4,136(a2)
    80001bc0:	01057463          	bgeu	a0,a6,80001bc8 <free_swap_slot.part.0+0x50>
    80001bc4:	08a62023          	sw	a0,128(a2)
    80001bc8:	00008067          	ret

0000000080001bcc <create_pagetable>:
    80001bcc:	ff010113          	add	sp,sp,-16
    80001bd0:	00113423          	sd	ra,8(sp)
    80001bd4:	e2dff0ef          	jal	80001a00 <alloc_page>
    80001bd8:	00050e63          	beqz	a0,80001bf4 <create_pagetable+0x28>
    80001bdc:	00001737          	lui	a4,0x1
    80001be0:	00050793          	mv	a5,a0
    80001be4:	00e50733          	add	a4,a0,a4
    80001be8:	0007b023          	sd	zero,0(a5)
    80001bec:	00878793          	add	a5,a5,8
    80001bf0:	fee79ce3          	bne	a5,a4,80001be8 <create_pagetable+0x1c>
    80001bf4:	00813083          	ld	ra,8(sp)
    80001bf8:	01010113          	add	sp,sp,16
    80001bfc:	00008067          	ret

0000000080001c00 <map_page>:
    80001c00:	00c5e7b3          	or	a5,a1,a2
    80001c04:	03479713          	sll	a4,a5,0x34
    80001c08:	20071863          	bnez	a4,80001e18 <map_page+0x218>
    80001c0c:	fc010113          	add	sp,sp,-64
    80001c10:	02913423          	sd	s1,40(sp)
    80001c14:	03213023          	sd	s2,32(sp)
    80001c18:	01313c23          	sd	s3,24(sp)
    80001c1c:	01413823          	sd	s4,16(sp)
    80001c20:	01513423          	sd	s5,8(sp)
    80001c24:	01613023          	sd	s6,0(sp)
    80001c28:	02113c23          	sd	ra,56(sp)
    80001c2c:	02813823          	sd	s0,48(sp)
    80001c30:	00058493          	mv	s1,a1
    80001c34:	00060913          	mv	s2,a2
    80001c38:	00050a13          	mv	s4,a0
    80001c3c:	00068993          	mv	s3,a3
    80001c40:	00050813          	mv	a6,a0
    80001c44:	00200a93          	li	s5,2
    80001c48:	00200793          	li	a5,2
    80001c4c:	00100b13          	li	s6,1
    80001c50:	0037941b          	sllw	s0,a5,0x3
    80001c54:	00f4043b          	addw	s0,s0,a5
    80001c58:	00c4041b          	addw	s0,s0,12
    80001c5c:	0084d433          	srl	s0,s1,s0
    80001c60:	1ff47413          	and	s0,s0,511
    80001c64:	00341413          	sll	s0,s0,0x3
    80001c68:	00880433          	add	s0,a6,s0
    80001c6c:	00043783          	ld	a5,0(s0)
    80001c70:	0017f713          	and	a4,a5,1
    80001c74:	14070e63          	beqz	a4,80001dd0 <map_page+0x1d0>
    80001c78:	00e7f713          	and	a4,a5,14
    80001c7c:	18071a63          	bnez	a4,80001e10 <map_page+0x210>
    80001c80:	00a7d793          	srl	a5,a5,0xa
    80001c84:	00c79813          	sll	a6,a5,0xc
    80001c88:	00100793          	li	a5,1
    80001c8c:	016a8663          	beq	s5,s6,80001c98 <map_page+0x98>
    80001c90:	00100a93          	li	s5,1
    80001c94:	fbdff06f          	j	80001c50 <map_page+0x50>
    80001c98:	00c4d793          	srl	a5,s1,0xc
    80001c9c:	1ff7f793          	and	a5,a5,511
    80001ca0:	00379793          	sll	a5,a5,0x3
    80001ca4:	00f80833          	add	a6,a6,a5
    80001ca8:	16080463          	beqz	a6,80001e10 <map_page+0x210>
    80001cac:	00083783          	ld	a5,0(a6)
    80001cb0:	0017f793          	and	a5,a5,1
    80001cb4:	14079e63          	bnez	a5,80001e10 <map_page+0x210>
    80001cb8:	00c95793          	srl	a5,s2,0xc
    80001cbc:	00a79793          	sll	a5,a5,0xa
    80001cc0:	00412597          	auipc	a1,0x412
    80001cc4:	3d058593          	add	a1,a1,976 # 80414090 <lru_mgr+0x3000>
    80001cc8:	0145a703          	lw	a4,20(a1)
    80001ccc:	0137e7b3          	or	a5,a5,s3
    80001cd0:	0017e793          	or	a5,a5,1
    80001cd4:	00f83023          	sd	a5,0(a6)
    80001cd8:	0c070663          	beqz	a4,80001da4 <map_page+0x1a4>
    80001cdc:	0040f717          	auipc	a4,0x40f
    80001ce0:	3d870713          	add	a4,a4,984 # 804110b4 <lru_mgr+0x24>
    80001ce4:	00000793          	li	a5,0
    80001ce8:	10000693          	li	a3,256
    80001cec:	00c0006f          	j	80001cf8 <map_page+0xf8>
    80001cf0:	0017879b          	addw	a5,a5,1
    80001cf4:	0ad78863          	beq	a5,a3,80001da4 <map_page+0x1a4>
    80001cf8:	00072803          	lw	a6,0(a4)
    80001cfc:	03070713          	add	a4,a4,48
    80001d00:	fe0818e3          	bnez	a6,80001cf0 <map_page+0xf0>
    80001d04:	00178813          	add	a6,a5,1
    80001d08:	00181513          	sll	a0,a6,0x1
    80001d0c:	00179713          	sll	a4,a5,0x1
    80001d10:	01050533          	add	a0,a0,a6
    80001d14:	0040f617          	auipc	a2,0x40f
    80001d18:	37c60613          	add	a2,a2,892 # 80411090 <lru_mgr>
    80001d1c:	00f706b3          	add	a3,a4,a5
    80001d20:	00451513          	sll	a0,a0,0x4
    80001d24:	00469693          	sll	a3,a3,0x4
    80001d28:	00a60533          	add	a0,a2,a0
    80001d2c:	fffff337          	lui	t1,0xfffff
    80001d30:	00d608b3          	add	a7,a2,a3
    80001d34:	0064f4b3          	and	s1,s1,t1
    80001d38:	01453423          	sd	s4,8(a0)
    80001d3c:	fff00513          	li	a0,-1
    80001d40:	01068693          	add	a3,a3,16
    80001d44:	0098b823          	sd	s1,16(a7)
    80001d48:	0128bc23          	sd	s2,24(a7)
    80001d4c:	02a8a023          	sw	a0,32(a7)
    80001d50:	0049f993          	and	s3,s3,4
    80001d54:	00d606b3          	add	a3,a2,a3
    80001d58:	00098463          	beqz	s3,80001d60 <map_page+0x160>
    80001d5c:	00500a93          	li	s5,5
    80001d60:	00181513          	sll	a0,a6,0x1
    80001d64:	00f707b3          	add	a5,a4,a5
    80001d68:	00063883          	ld	a7,0(a2)
    80001d6c:	01050733          	add	a4,a0,a6
    80001d70:	00479793          	sll	a5,a5,0x4
    80001d74:	00471713          	sll	a4,a4,0x4
    80001d78:	00f607b3          	add	a5,a2,a5
    80001d7c:	00e60733          	add	a4,a2,a4
    80001d80:	0357a223          	sw	s5,36(a5)
    80001d84:	01173023          	sd	a7,0(a4)
    80001d88:	0207b423          	sd	zero,40(a5)
    80001d8c:	06088e63          	beqz	a7,80001e08 <map_page+0x208>
    80001d90:	00d8bc23          	sd	a3,24(a7)
    80001d94:	0105a783          	lw	a5,16(a1)
    80001d98:	00d63023          	sd	a3,0(a2)
    80001d9c:	0017879b          	addw	a5,a5,1
    80001da0:	00f5a823          	sw	a5,16(a1)
    80001da4:	00000513          	li	a0,0
    80001da8:	03813083          	ld	ra,56(sp)
    80001dac:	03013403          	ld	s0,48(sp)
    80001db0:	02813483          	ld	s1,40(sp)
    80001db4:	02013903          	ld	s2,32(sp)
    80001db8:	01813983          	ld	s3,24(sp)
    80001dbc:	01013a03          	ld	s4,16(sp)
    80001dc0:	00813a83          	ld	s5,8(sp)
    80001dc4:	00013b03          	ld	s6,0(sp)
    80001dc8:	04010113          	add	sp,sp,64
    80001dcc:	00008067          	ret
    80001dd0:	c31ff0ef          	jal	80001a00 <alloc_page>
    80001dd4:	00050813          	mv	a6,a0
    80001dd8:	02050c63          	beqz	a0,80001e10 <map_page+0x210>
    80001ddc:	00001737          	lui	a4,0x1
    80001de0:	00e50733          	add	a4,a0,a4
    80001de4:	00050793          	mv	a5,a0
    80001de8:	0007b023          	sd	zero,0(a5)
    80001dec:	00878793          	add	a5,a5,8
    80001df0:	fee79ce3          	bne	a5,a4,80001de8 <map_page+0x1e8>
    80001df4:	00c85793          	srl	a5,a6,0xc
    80001df8:	00a79793          	sll	a5,a5,0xa
    80001dfc:	0017e793          	or	a5,a5,1
    80001e00:	00f43023          	sd	a5,0(s0)
    80001e04:	e85ff06f          	j	80001c88 <map_page+0x88>
    80001e08:	00d63423          	sd	a3,8(a2)
    80001e0c:	f89ff06f          	j	80001d94 <map_page+0x194>
    80001e10:	fff00513          	li	a0,-1
    80001e14:	f95ff06f          	j	80001da8 <map_page+0x1a8>
    80001e18:	fff00513          	li	a0,-1
    80001e1c:	00008067          	ret

0000000080001e20 <map_region>:
    80001e20:	000017b7          	lui	a5,0x1
    80001e24:	fc010113          	add	sp,sp,-64
    80001e28:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001e2c:	02913423          	sd	s1,40(sp)
    80001e30:	00f684b3          	add	s1,a3,a5
    80001e34:	00b484b3          	add	s1,s1,a1
    80001e38:	fffff7b7          	lui	a5,0xfffff
    80001e3c:	02113c23          	sd	ra,56(sp)
    80001e40:	02813823          	sd	s0,48(sp)
    80001e44:	03213023          	sd	s2,32(sp)
    80001e48:	01313c23          	sd	s3,24(sp)
    80001e4c:	01413823          	sd	s4,16(sp)
    80001e50:	01513423          	sd	s5,8(sp)
    80001e54:	00f4f4b3          	and	s1,s1,a5
    80001e58:	0495f263          	bgeu	a1,s1,80001e9c <map_region+0x7c>
    80001e5c:	00058413          	mv	s0,a1
    80001e60:	00050993          	mv	s3,a0
    80001e64:	00070a13          	mv	s4,a4
    80001e68:	40b60933          	sub	s2,a2,a1
    80001e6c:	00001ab7          	lui	s5,0x1
    80001e70:	0080006f          	j	80001e78 <map_region+0x58>
    80001e74:	02947463          	bgeu	s0,s1,80001e9c <map_region+0x7c>
    80001e78:	00890633          	add	a2,s2,s0
    80001e7c:	00040593          	mv	a1,s0
    80001e80:	000a0693          	mv	a3,s4
    80001e84:	00098513          	mv	a0,s3
    80001e88:	d79ff0ef          	jal	80001c00 <map_page>
    80001e8c:	01540433          	add	s0,s0,s5
    80001e90:	fe0502e3          	beqz	a0,80001e74 <map_region+0x54>
    80001e94:	fff00513          	li	a0,-1
    80001e98:	0080006f          	j	80001ea0 <map_region+0x80>
    80001e9c:	00000513          	li	a0,0
    80001ea0:	03813083          	ld	ra,56(sp)
    80001ea4:	03013403          	ld	s0,48(sp)
    80001ea8:	02813483          	ld	s1,40(sp)
    80001eac:	02013903          	ld	s2,32(sp)
    80001eb0:	01813983          	ld	s3,24(sp)
    80001eb4:	01013a03          	ld	s4,16(sp)
    80001eb8:	00813a83          	ld	s5,8(sp)
    80001ebc:	04010113          	add	sp,sp,64
    80001ec0:	00008067          	ret

0000000080001ec4 <destroy_pagetable>:
    80001ec4:	f0010113          	add	sp,sp,-256
    80001ec8:	000017b7          	lui	a5,0x1
    80001ecc:	0e813823          	sd	s0,240(sp)
    80001ed0:	0f213023          	sd	s2,224(sp)
    80001ed4:	0d613023          	sd	s6,192(sp)
    80001ed8:	0b713c23          	sd	s7,184(sp)
    80001edc:	0e113c23          	sd	ra,248(sp)
    80001ee0:	0e913423          	sd	s1,232(sp)
    80001ee4:	0d313c23          	sd	s3,216(sp)
    80001ee8:	0d413823          	sd	s4,208(sp)
    80001eec:	0d513423          	sd	s5,200(sp)
    80001ef0:	0b813823          	sd	s8,176(sp)
    80001ef4:	0b913423          	sd	s9,168(sp)
    80001ef8:	0ba13023          	sd	s10,160(sp)
    80001efc:	09b13c23          	sd	s11,152(sp)
    80001f00:	00050413          	mv	s0,a0
    80001f04:	00050913          	mv	s2,a0
    80001f08:	00f50b33          	add	s6,a0,a5
    80001f0c:	00001bb7          	lui	s7,0x1
    80001f10:	00c0006f          	j	80001f1c <destroy_pagetable+0x58>
    80001f14:	00890913          	add	s2,s2,8
    80001f18:	2d690063          	beq	s2,s6,800021d8 <destroy_pagetable+0x314>
    80001f1c:	00093783          	ld	a5,0(s2)
    80001f20:	00100713          	li	a4,1
    80001f24:	00f7f693          	and	a3,a5,15
    80001f28:	fee696e3          	bne	a3,a4,80001f14 <destroy_pagetable+0x50>
    80001f2c:	00a7d793          	srl	a5,a5,0xa
    80001f30:	00c79a13          	sll	s4,a5,0xc
    80001f34:	017a0cb3          	add	s9,s4,s7
    80001f38:	00100d93          	li	s11,1
    80001f3c:	000a0a93          	mv	s5,s4
    80001f40:	00040493          	mv	s1,s0
    80001f44:	00c0006f          	j	80001f50 <destroy_pagetable+0x8c>
    80001f48:	008a0a13          	add	s4,s4,8
    80001f4c:	279a0c63          	beq	s4,s9,800021c4 <destroy_pagetable+0x300>
    80001f50:	000a3783          	ld	a5,0(s4)
    80001f54:	00f7f713          	and	a4,a5,15
    80001f58:	ffb718e3          	bne	a4,s11,80001f48 <destroy_pagetable+0x84>
    80001f5c:	00a7d793          	srl	a5,a5,0xa
    80001f60:	00c79993          	sll	s3,a5,0xc
    80001f64:	00098c13          	mv	s8,s3
    80001f68:	01798d33          	add	s10,s3,s7
    80001f6c:	00098413          	mv	s0,s3
    80001f70:	00c0006f          	j	80001f7c <destroy_pagetable+0xb8>
    80001f74:	00840413          	add	s0,s0,8
    80001f78:	23a40e63          	beq	s0,s10,800021b4 <destroy_pagetable+0x2f0>
    80001f7c:	00043783          	ld	a5,0(s0)
    80001f80:	00f7f713          	and	a4,a5,15
    80001f84:	ffb718e3          	bne	a4,s11,80001f74 <destroy_pagetable+0xb0>
    80001f88:	00a7d793          	srl	a5,a5,0xa
    80001f8c:	00c79793          	sll	a5,a5,0xc
    80001f90:	00048713          	mv	a4,s1
    80001f94:	03513c23          	sd	s5,56(sp)
    80001f98:	00090493          	mv	s1,s2
    80001f9c:	017789b3          	add	s3,a5,s7
    80001fa0:	02813823          	sd	s0,48(sp)
    80001fa4:	00078a93          	mv	s5,a5
    80001fa8:	00070913          	mv	s2,a4
    80001fac:	00c0006f          	j	80001fb8 <destroy_pagetable+0xf4>
    80001fb0:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80001fb4:	1cf98e63          	beq	s3,a5,80002190 <destroy_pagetable+0x2cc>
    80001fb8:	0007b703          	ld	a4,0(a5)
    80001fbc:	00f77693          	and	a3,a4,15
    80001fc0:	ffb698e3          	bne	a3,s11,80001fb0 <destroy_pagetable+0xec>
    80001fc4:	00a75713          	srl	a4,a4,0xa
    80001fc8:	00c71713          	sll	a4,a4,0xc
    80001fcc:	017706b3          	add	a3,a4,s7
    80001fd0:	05313423          	sd	s3,72(sp)
    80001fd4:	00d13423          	sd	a3,8(sp)
    80001fd8:	05813023          	sd	s8,64(sp)
    80001fdc:	00070993          	mv	s3,a4
    80001fe0:	04f13823          	sd	a5,80(sp)
    80001fe4:	0100006f          	j	80001ff4 <destroy_pagetable+0x130>
    80001fe8:	00813783          	ld	a5,8(sp)
    80001fec:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    80001ff0:	16e78e63          	beq	a5,a4,8000216c <destroy_pagetable+0x2a8>
    80001ff4:	00073783          	ld	a5,0(a4)
    80001ff8:	00f7f693          	and	a3,a5,15
    80001ffc:	ffb696e3          	bne	a3,s11,80001fe8 <destroy_pagetable+0x124>
    80002000:	00a7d793          	srl	a5,a5,0xa
    80002004:	00c79793          	sll	a5,a5,0xc
    80002008:	017786b3          	add	a3,a5,s7
    8000200c:	000a8c13          	mv	s8,s5
    80002010:	00d13c23          	sd	a3,24(sp)
    80002014:	00078a93          	mv	s5,a5
    80002018:	04e13c23          	sd	a4,88(sp)
    8000201c:	07213023          	sd	s2,96(sp)
    80002020:	0100006f          	j	80002030 <destroy_pagetable+0x16c>
    80002024:	01813703          	ld	a4,24(sp)
    80002028:	00878793          	add	a5,a5,8
    8000202c:	10f70c63          	beq	a4,a5,80002144 <destroy_pagetable+0x280>
    80002030:	0007b703          	ld	a4,0(a5)
    80002034:	00f77693          	and	a3,a4,15
    80002038:	ffb696e3          	bne	a3,s11,80002024 <destroy_pagetable+0x160>
    8000203c:	00a75713          	srl	a4,a4,0xa
    80002040:	00c71913          	sll	s2,a4,0xc
    80002044:	01790733          	add	a4,s2,s7
    80002048:	07213423          	sd	s2,104(sp)
    8000204c:	00090413          	mv	s0,s2
    80002050:	02e13023          	sd	a4,32(sp)
    80002054:	06f13823          	sd	a5,112(sp)
    80002058:	00048913          	mv	s2,s1
    8000205c:	0100006f          	j	8000206c <destroy_pagetable+0x1a8>
    80002060:	02013783          	ld	a5,32(sp)
    80002064:	00840413          	add	s0,s0,8
    80002068:	0a878c63          	beq	a5,s0,80002120 <destroy_pagetable+0x25c>
    8000206c:	00043783          	ld	a5,0(s0)
    80002070:	00f7f693          	and	a3,a5,15
    80002074:	ffb696e3          	bne	a3,s11,80002060 <destroy_pagetable+0x19c>
    80002078:	00a7d793          	srl	a5,a5,0xa
    8000207c:	00c79493          	sll	s1,a5,0xc
    80002080:	017487b3          	add	a5,s1,s7
    80002084:	00913823          	sd	s1,16(sp)
    80002088:	02f13423          	sd	a5,40(sp)
    8000208c:	06813c23          	sd	s0,120(sp)
    80002090:	0100006f          	j	800020a0 <destroy_pagetable+0x1dc>
    80002094:	02813783          	ld	a5,40(sp)
    80002098:	00848493          	add	s1,s1,8
    8000209c:	06978663          	beq	a5,s1,80002108 <destroy_pagetable+0x244>
    800020a0:	0004b783          	ld	a5,0(s1)
    800020a4:	00f7f693          	and	a3,a5,15
    800020a8:	ffb696e3          	bne	a3,s11,80002094 <destroy_pagetable+0x1d0>
    800020ac:	00a7d793          	srl	a5,a5,0xa
    800020b0:	00c79413          	sll	s0,a5,0xc
    800020b4:	017406b3          	add	a3,s0,s7
    800020b8:	09213023          	sd	s2,128(sp)
    800020bc:	09613423          	sd	s6,136(sp)
    800020c0:	00040913          	mv	s2,s0
    800020c4:	000a0b13          	mv	s6,s4
    800020c8:	00048a13          	mv	s4,s1
    800020cc:	00068493          	mv	s1,a3
    800020d0:	00043783          	ld	a5,0(s0)
    800020d4:	00840413          	add	s0,s0,8
    800020d8:	00f7f713          	and	a4,a5,15
    800020dc:	13b70e63          	beq	a4,s11,80002218 <destroy_pagetable+0x354>
    800020e0:	fe8498e3          	bne	s1,s0,800020d0 <destroy_pagetable+0x20c>
    800020e4:	00090513          	mv	a0,s2
    800020e8:	000a0493          	mv	s1,s4
    800020ec:	08013903          	ld	s2,128(sp)
    800020f0:	000b0a13          	mv	s4,s6
    800020f4:	08813b03          	ld	s6,136(sp)
    800020f8:	925ff0ef          	jal	80001a1c <free_page>
    800020fc:	02813783          	ld	a5,40(sp)
    80002100:	00848493          	add	s1,s1,8
    80002104:	f8979ee3          	bne	a5,s1,800020a0 <destroy_pagetable+0x1dc>
    80002108:	01013503          	ld	a0,16(sp)
    8000210c:	07813403          	ld	s0,120(sp)
    80002110:	90dff0ef          	jal	80001a1c <free_page>
    80002114:	02013783          	ld	a5,32(sp)
    80002118:	00840413          	add	s0,s0,8
    8000211c:	f48798e3          	bne	a5,s0,8000206c <destroy_pagetable+0x1a8>
    80002120:	07013783          	ld	a5,112(sp)
    80002124:	06813503          	ld	a0,104(sp)
    80002128:	00090493          	mv	s1,s2
    8000212c:	00f13823          	sd	a5,16(sp)
    80002130:	8edff0ef          	jal	80001a1c <free_page>
    80002134:	01013783          	ld	a5,16(sp)
    80002138:	01813703          	ld	a4,24(sp)
    8000213c:	00878793          	add	a5,a5,8
    80002140:	eef718e3          	bne	a4,a5,80002030 <destroy_pagetable+0x16c>
    80002144:	05813703          	ld	a4,88(sp)
    80002148:	000a8513          	mv	a0,s5
    8000214c:	06013903          	ld	s2,96(sp)
    80002150:	00e13823          	sd	a4,16(sp)
    80002154:	8c9ff0ef          	jal	80001a1c <free_page>
    80002158:	01013703          	ld	a4,16(sp)
    8000215c:	00813783          	ld	a5,8(sp)
    80002160:	000c0a93          	mv	s5,s8
    80002164:	00870713          	add	a4,a4,8
    80002168:	e8e796e3          	bne	a5,a4,80001ff4 <destroy_pagetable+0x130>
    8000216c:	05013783          	ld	a5,80(sp)
    80002170:	00098513          	mv	a0,s3
    80002174:	04013c03          	ld	s8,64(sp)
    80002178:	00f13423          	sd	a5,8(sp)
    8000217c:	04813983          	ld	s3,72(sp)
    80002180:	89dff0ef          	jal	80001a1c <free_page>
    80002184:	00813783          	ld	a5,8(sp)
    80002188:	00878793          	add	a5,a5,8
    8000218c:	e2f996e3          	bne	s3,a5,80001fb8 <destroy_pagetable+0xf4>
    80002190:	03013403          	ld	s0,48(sp)
    80002194:	00090793          	mv	a5,s2
    80002198:	000a8513          	mv	a0,s5
    8000219c:	00840413          	add	s0,s0,8
    800021a0:	03813a83          	ld	s5,56(sp)
    800021a4:	00048913          	mv	s2,s1
    800021a8:	00078493          	mv	s1,a5
    800021ac:	871ff0ef          	jal	80001a1c <free_page>
    800021b0:	dda416e3          	bne	s0,s10,80001f7c <destroy_pagetable+0xb8>
    800021b4:	000c0513          	mv	a0,s8
    800021b8:	008a0a13          	add	s4,s4,8
    800021bc:	861ff0ef          	jal	80001a1c <free_page>
    800021c0:	d99a18e3          	bne	s4,s9,80001f50 <destroy_pagetable+0x8c>
    800021c4:	000a8513          	mv	a0,s5
    800021c8:	00890913          	add	s2,s2,8
    800021cc:	00048413          	mv	s0,s1
    800021d0:	84dff0ef          	jal	80001a1c <free_page>
    800021d4:	d56914e3          	bne	s2,s6,80001f1c <destroy_pagetable+0x58>
    800021d8:	00040513          	mv	a0,s0
    800021dc:	0f013403          	ld	s0,240(sp)
    800021e0:	0f813083          	ld	ra,248(sp)
    800021e4:	0e813483          	ld	s1,232(sp)
    800021e8:	0e013903          	ld	s2,224(sp)
    800021ec:	0d813983          	ld	s3,216(sp)
    800021f0:	0d013a03          	ld	s4,208(sp)
    800021f4:	0c813a83          	ld	s5,200(sp)
    800021f8:	0c013b03          	ld	s6,192(sp)
    800021fc:	0b813b83          	ld	s7,184(sp)
    80002200:	0b013c03          	ld	s8,176(sp)
    80002204:	0a813c83          	ld	s9,168(sp)
    80002208:	0a013d03          	ld	s10,160(sp)
    8000220c:	09813d83          	ld	s11,152(sp)
    80002210:	10010113          	add	sp,sp,256
    80002214:	809ff06f          	j	80001a1c <free_page>
    80002218:	00a7d793          	srl	a5,a5,0xa
    8000221c:	00c79513          	sll	a0,a5,0xc
    80002220:	ca5ff0ef          	jal	80001ec4 <destroy_pagetable>
    80002224:	ea8496e3          	bne	s1,s0,800020d0 <destroy_pagetable+0x20c>
    80002228:	ebdff06f          	j	800020e4 <destroy_pagetable+0x220>

000000008000222c <kvminithart>:
    8000222c:	00424797          	auipc	a5,0x424
    80002230:	0147b783          	ld	a5,20(a5) # 80426240 <kernel_pagetable>
    80002234:	fff00713          	li	a4,-1
    80002238:	03f71713          	sll	a4,a4,0x3f
    8000223c:	00c7d793          	srl	a5,a5,0xc
    80002240:	00e7e7b3          	or	a5,a5,a4
    80002244:	18079073          	csrw	satp,a5
    80002248:	12000073          	sfence.vma
    8000224c:	00008067          	ret

0000000080002250 <dump_pagetable>:
    80002250:	fb010113          	add	sp,sp,-80
    80002254:	03213823          	sd	s2,48(sp)
    80002258:	03313423          	sd	s3,40(sp)
    8000225c:	04113423          	sd	ra,72(sp)
    80002260:	04813023          	sd	s0,64(sp)
    80002264:	02913c23          	sd	s1,56(sp)
    80002268:	03413023          	sd	s4,32(sp)
    8000226c:	01513c23          	sd	s5,24(sp)
    80002270:	01613823          	sd	s6,16(sp)
    80002274:	01713423          	sd	s7,8(sp)
    80002278:	00058993          	mv	s3,a1
    8000227c:	00050913          	mv	s2,a0
    80002280:	28b05263          	blez	a1,80002504 <dump_pagetable+0x2b4>
    80002284:	00000413          	li	s0,0
    80002288:	0014041b          	addw	s0,s0,1
    8000228c:	02000513          	li	a0,32
    80002290:	eacff0ef          	jal	8000193c <uart_putc>
    80002294:	fe899ae3          	bne	s3,s0,80002288 <dump_pagetable+0x38>
    80002298:	00004517          	auipc	a0,0x4
    8000229c:	7f050513          	add	a0,a0,2032 # 80006a88 <digits+0x18>
    800022a0:	eb4ff0ef          	jal	80001954 <uart_puts>
    800022a4:	00900793          	li	a5,9
    800022a8:	2737d463          	bge	a5,s3,80002510 <dump_pagetable+0x2c0>
    800022ac:	00a00413          	li	s0,10
    800022b0:	0289c53b          	divw	a0,s3,s0
    800022b4:	0305051b          	addw	a0,a0,48
    800022b8:	0ff57513          	zext.b	a0,a0
    800022bc:	e80ff0ef          	jal	8000193c <uart_putc>
    800022c0:	0289e53b          	remw	a0,s3,s0
    800022c4:	0305051b          	addw	a0,a0,48
    800022c8:	0ff57513          	zext.b	a0,a0
    800022cc:	e70ff0ef          	jal	8000193c <uart_putc>
    800022d0:	00004517          	auipc	a0,0x4
    800022d4:	7d050513          	add	a0,a0,2000 # 80006aa0 <digits+0x30>
    800022d8:	fff00b13          	li	s6,-1
    800022dc:	e78ff0ef          	jal	80001954 <uart_puts>
    800022e0:	00000493          	li	s1,0
    800022e4:	00cb5b13          	srl	s6,s6,0xc
    800022e8:	00900a13          	li	s4,9
    800022ec:	ffc00a93          	li	s5,-4
    800022f0:	0140006f          	j	80002304 <dump_pagetable+0xb4>
    800022f4:	0014849b          	addw	s1,s1,1
    800022f8:	20000793          	li	a5,512
    800022fc:	00890913          	add	s2,s2,8
    80002300:	0cf48063          	beq	s1,a5,800023c0 <dump_pagetable+0x170>
    80002304:	00093783          	ld	a5,0(s2)
    80002308:	0017f793          	and	a5,a5,1
    8000230c:	fe0784e3          	beqz	a5,800022f4 <dump_pagetable+0xa4>
    80002310:	00000413          	li	s0,0
    80002314:	0009ca63          	bltz	s3,80002328 <dump_pagetable+0xd8>
    80002318:	0014041b          	addw	s0,s0,1
    8000231c:	02000513          	li	a0,32
    80002320:	e1cff0ef          	jal	8000193c <uart_putc>
    80002324:	fe89dae3          	bge	s3,s0,80002318 <dump_pagetable+0xc8>
    80002328:	00004517          	auipc	a0,0x4
    8000232c:	78050513          	add	a0,a0,1920 # 80006aa8 <digits+0x38>
    80002330:	e24ff0ef          	jal	80001954 <uart_puts>
    80002334:	06300793          	li	a5,99
    80002338:	1697d263          	bge	a5,s1,8000249c <dump_pagetable+0x24c>
    8000233c:	06400413          	li	s0,100
    80002340:	0284c53b          	divw	a0,s1,s0
    80002344:	00a00b93          	li	s7,10
    80002348:	0305051b          	addw	a0,a0,48
    8000234c:	0ff57513          	zext.b	a0,a0
    80002350:	decff0ef          	jal	8000193c <uart_putc>
    80002354:	0284e53b          	remw	a0,s1,s0
    80002358:	0375453b          	divw	a0,a0,s7
    8000235c:	0305051b          	addw	a0,a0,48
    80002360:	0ff57513          	zext.b	a0,a0
    80002364:	dd8ff0ef          	jal	8000193c <uart_putc>
    80002368:	0374e53b          	remw	a0,s1,s7
    8000236c:	0305051b          	addw	a0,a0,48
    80002370:	0ff57513          	zext.b	a0,a0
    80002374:	dc8ff0ef          	jal	8000193c <uart_putc>
    80002378:	00004517          	auipc	a0,0x4
    8000237c:	73850513          	add	a0,a0,1848 # 80006ab0 <digits+0x40>
    80002380:	dd4ff0ef          	jal	80001954 <uart_puts>
    80002384:	00093b83          	ld	s7,0(s2)
    80002388:	00ebf793          	and	a5,s7,14
    8000238c:	06079063          	bnez	a5,800023ec <dump_pagetable+0x19c>
    80002390:	00004517          	auipc	a0,0x4
    80002394:	73850513          	add	a0,a0,1848 # 80006ac8 <digits+0x58>
    80002398:	dbcff0ef          	jal	80001954 <uart_puts>
    8000239c:	00093503          	ld	a0,0(s2)
    800023a0:	0019859b          	addw	a1,s3,1
    800023a4:	0014849b          	addw	s1,s1,1
    800023a8:	00a55513          	srl	a0,a0,0xa
    800023ac:	00c51513          	sll	a0,a0,0xc
    800023b0:	ea1ff0ef          	jal	80002250 <dump_pagetable>
    800023b4:	20000793          	li	a5,512
    800023b8:	00890913          	add	s2,s2,8
    800023bc:	f4f494e3          	bne	s1,a5,80002304 <dump_pagetable+0xb4>
    800023c0:	04813083          	ld	ra,72(sp)
    800023c4:	04013403          	ld	s0,64(sp)
    800023c8:	03813483          	ld	s1,56(sp)
    800023cc:	03013903          	ld	s2,48(sp)
    800023d0:	02813983          	ld	s3,40(sp)
    800023d4:	02013a03          	ld	s4,32(sp)
    800023d8:	01813a83          	ld	s5,24(sp)
    800023dc:	01013b03          	ld	s6,16(sp)
    800023e0:	00813b83          	ld	s7,8(sp)
    800023e4:	05010113          	add	sp,sp,80
    800023e8:	00008067          	ret
    800023ec:	00004517          	auipc	a0,0x4
    800023f0:	6cc50513          	add	a0,a0,1740 # 80006ab8 <digits+0x48>
    800023f4:	d60ff0ef          	jal	80001954 <uart_puts>
    800023f8:	00abdb93          	srl	s7,s7,0xa
    800023fc:	016bfbb3          	and	s7,s7,s6
    80002400:	00000713          	li	a4,0
    80002404:	03c00413          	li	s0,60
    80002408:	008bd7b3          	srl	a5,s7,s0
    8000240c:	00f7f793          	and	a5,a5,15
    80002410:	00e7e733          	or	a4,a5,a4
    80002414:	00071e63          	bnez	a4,80002430 <dump_pagetable+0x1e0>
    80002418:	02040c63          	beqz	s0,80002450 <dump_pagetable+0x200>
    8000241c:	ffc4041b          	addw	s0,s0,-4
    80002420:	008bd7b3          	srl	a5,s7,s0
    80002424:	00f7f793          	and	a5,a5,15
    80002428:	00e7e733          	or	a4,a5,a4
    8000242c:	fe0706e3          	beqz	a4,80002418 <dump_pagetable+0x1c8>
    80002430:	ffc4041b          	addw	s0,s0,-4
    80002434:	03778513          	add	a0,a5,55
    80002438:	0ff7f713          	zext.b	a4,a5
    8000243c:	04fa5c63          	bge	s4,a5,80002494 <dump_pagetable+0x244>
    80002440:	cfcff0ef          	jal	8000193c <uart_putc>
    80002444:	01540a63          	beq	s0,s5,80002458 <dump_pagetable+0x208>
    80002448:	00100713          	li	a4,1
    8000244c:	fbdff06f          	j	80002408 <dump_pagetable+0x1b8>
    80002450:	03000513          	li	a0,48
    80002454:	ce8ff0ef          	jal	8000193c <uart_putc>
    80002458:	00004517          	auipc	a0,0x4
    8000245c:	66850513          	add	a0,a0,1640 # 80006ac0 <digits+0x50>
    80002460:	cf4ff0ef          	jal	80001954 <uart_puts>
    80002464:	00093783          	ld	a5,0(s2)
    80002468:	0027f713          	and	a4,a5,2
    8000246c:	08071463          	bnez	a4,800024f4 <dump_pagetable+0x2a4>
    80002470:	0047f713          	and	a4,a5,4
    80002474:	06071863          	bnez	a4,800024e4 <dump_pagetable+0x294>
    80002478:	0087f713          	and	a4,a5,8
    8000247c:	04071c63          	bnez	a4,800024d4 <dump_pagetable+0x284>
    80002480:	0107f793          	and	a5,a5,16
    80002484:	04079263          	bnez	a5,800024c8 <dump_pagetable+0x278>
    80002488:	00a00513          	li	a0,10
    8000248c:	cb0ff0ef          	jal	8000193c <uart_putc>
    80002490:	e65ff06f          	j	800022f4 <dump_pagetable+0xa4>
    80002494:	03070513          	add	a0,a4,48
    80002498:	fa9ff06f          	j	80002440 <dump_pagetable+0x1f0>
    8000249c:	089a5263          	bge	s4,s1,80002520 <dump_pagetable+0x2d0>
    800024a0:	00a00413          	li	s0,10
    800024a4:	0284c53b          	divw	a0,s1,s0
    800024a8:	0305051b          	addw	a0,a0,48
    800024ac:	0ff57513          	zext.b	a0,a0
    800024b0:	c8cff0ef          	jal	8000193c <uart_putc>
    800024b4:	0284e53b          	remw	a0,s1,s0
    800024b8:	0305051b          	addw	a0,a0,48
    800024bc:	0ff57513          	zext.b	a0,a0
    800024c0:	c7cff0ef          	jal	8000193c <uart_putc>
    800024c4:	eb5ff06f          	j	80002378 <dump_pagetable+0x128>
    800024c8:	05500513          	li	a0,85
    800024cc:	c70ff0ef          	jal	8000193c <uart_putc>
    800024d0:	fb9ff06f          	j	80002488 <dump_pagetable+0x238>
    800024d4:	05800513          	li	a0,88
    800024d8:	c64ff0ef          	jal	8000193c <uart_putc>
    800024dc:	00093783          	ld	a5,0(s2)
    800024e0:	fa1ff06f          	j	80002480 <dump_pagetable+0x230>
    800024e4:	05700513          	li	a0,87
    800024e8:	c54ff0ef          	jal	8000193c <uart_putc>
    800024ec:	00093783          	ld	a5,0(s2)
    800024f0:	f89ff06f          	j	80002478 <dump_pagetable+0x228>
    800024f4:	05200513          	li	a0,82
    800024f8:	c44ff0ef          	jal	8000193c <uart_putc>
    800024fc:	00093783          	ld	a5,0(s2)
    80002500:	f71ff06f          	j	80002470 <dump_pagetable+0x220>
    80002504:	00004517          	auipc	a0,0x4
    80002508:	58450513          	add	a0,a0,1412 # 80006a88 <digits+0x18>
    8000250c:	c48ff0ef          	jal	80001954 <uart_puts>
    80002510:	0309851b          	addw	a0,s3,48
    80002514:	0ff57513          	zext.b	a0,a0
    80002518:	c24ff0ef          	jal	8000193c <uart_putc>
    8000251c:	db5ff06f          	j	800022d0 <dump_pagetable+0x80>
    80002520:	0304851b          	addw	a0,s1,48
    80002524:	0ff57513          	zext.b	a0,a0
    80002528:	c14ff0ef          	jal	8000193c <uart_putc>
    8000252c:	e4dff06f          	j	80002378 <dump_pagetable+0x128>

0000000080002530 <init_page_replacement>:
    80002530:	00100713          	li	a4,1
    80002534:	02a71713          	sll	a4,a4,0x2a
    80002538:	0000f797          	auipc	a5,0xf
    8000253c:	ac878793          	add	a5,a5,-1336 # 80011000 <swap_mgr>
    80002540:	08e7b023          	sd	a4,128(a5)
    80002544:	0000f717          	auipc	a4,0xf
    80002548:	b4072223          	sw	zero,-1212(a4) # 80011088 <swap_mgr+0x88>
    8000254c:	0000f717          	auipc	a4,0xf
    80002550:	b3470713          	add	a4,a4,-1228 # 80011080 <swap_mgr+0x80>
    80002554:	0007a023          	sw	zero,0(a5)
    80002558:	00478793          	add	a5,a5,4
    8000255c:	fee79ce3          	bne	a5,a4,80002554 <init_page_replacement+0x24>
    80002560:	0040f797          	auipc	a5,0x40f
    80002564:	b207b823          	sd	zero,-1232(a5) # 80411090 <lru_mgr>
    80002568:	0040f797          	auipc	a5,0x40f
    8000256c:	b207b823          	sd	zero,-1232(a5) # 80411098 <lru_mgr+0x8>
    80002570:	00100793          	li	a5,1
    80002574:	02879793          	sll	a5,a5,0x28
    80002578:	00412717          	auipc	a4,0x412
    8000257c:	b2f73423          	sd	a5,-1240(a4) # 804140a0 <lru_mgr+0x3010>
    80002580:	fff00713          	li	a4,-1
    80002584:	0040f797          	auipc	a5,0x40f
    80002588:	b1c78793          	add	a5,a5,-1252 # 804110a0 <lru_mgr+0x10>
    8000258c:	00412697          	auipc	a3,0x412
    80002590:	b1468693          	add	a3,a3,-1260 # 804140a0 <lru_mgr+0x3010>
    80002594:	02075713          	srl	a4,a4,0x20
    80002598:	0007b023          	sd	zero,0(a5)
    8000259c:	0007b423          	sd	zero,8(a5)
    800025a0:	00e7b823          	sd	a4,16(a5)
    800025a4:	0007bc23          	sd	zero,24(a5)
    800025a8:	0207b023          	sd	zero,32(a5)
    800025ac:	0207b423          	sd	zero,40(a5)
    800025b0:	03078793          	add	a5,a5,48
    800025b4:	fed792e3          	bne	a5,a3,80002598 <init_page_replacement+0x68>
    800025b8:	00008067          	ret

00000000800025bc <kvminit>:
    800025bc:	fd010113          	add	sp,sp,-48
    800025c0:	02113423          	sd	ra,40(sp)
    800025c4:	02813023          	sd	s0,32(sp)
    800025c8:	00913c23          	sd	s1,24(sp)
    800025cc:	01213823          	sd	s2,16(sp)
    800025d0:	01313423          	sd	s3,8(sp)
    800025d4:	01413023          	sd	s4,0(sp)
    800025d8:	f59ff0ef          	jal	80002530 <init_page_replacement>
    800025dc:	c24ff0ef          	jal	80001a00 <alloc_page>
    800025e0:	00001737          	lui	a4,0x1
    800025e4:	00e50733          	add	a4,a0,a4
    800025e8:	00050413          	mv	s0,a0
    800025ec:	00050793          	mv	a5,a0
    800025f0:	1a050663          	beqz	a0,8000279c <kvminit+0x1e0>
    800025f4:	0007b023          	sd	zero,0(a5)
    800025f8:	00878793          	add	a5,a5,8
    800025fc:	fef71ce3          	bne	a4,a5,800025f4 <kvminit+0x38>
    80002600:	00424917          	auipc	s2,0x424
    80002604:	c4090913          	add	s2,s2,-960 # 80426240 <kernel_pagetable>
    80002608:	00003997          	auipc	s3,0x3
    8000260c:	48b98993          	add	s3,s3,1163 # 80005a93 <rodata_start+0xa93>
    80002610:	fffff7b7          	lui	a5,0xfffff
    80002614:	00893023          	sd	s0,0(s2)
    80002618:	ffffe497          	auipc	s1,0xffffe
    8000261c:	9e848493          	add	s1,s1,-1560 # 80000000 <_entry>
    80002620:	00f9f9b3          	and	s3,s3,a5
    80002624:	0334f863          	bgeu	s1,s3,80002654 <kvminit+0x98>
    80002628:	00001a37          	lui	s4,0x1
    8000262c:	0080006f          	j	80002634 <kvminit+0x78>
    80002630:	0334f063          	bgeu	s1,s3,80002650 <kvminit+0x94>
    80002634:	00048613          	mv	a2,s1
    80002638:	00048593          	mv	a1,s1
    8000263c:	00a00693          	li	a3,10
    80002640:	00040513          	mv	a0,s0
    80002644:	dbcff0ef          	jal	80001c00 <map_page>
    80002648:	014484b3          	add	s1,s1,s4
    8000264c:	fe0502e3          	beqz	a0,80002630 <kvminit+0x74>
    80002650:	00093403          	ld	s0,0(s2)
    80002654:	00006997          	auipc	s3,0x6
    80002658:	f7398993          	add	s3,s3,-141 # 800085c7 <data_end+0x5c3>
    8000265c:	fffff7b7          	lui	a5,0xfffff
    80002660:	00003497          	auipc	s1,0x3
    80002664:	9a048493          	add	s1,s1,-1632 # 80005000 <rodata_start>
    80002668:	00f9f9b3          	and	s3,s3,a5
    8000266c:	0334f863          	bgeu	s1,s3,8000269c <kvminit+0xe0>
    80002670:	00001a37          	lui	s4,0x1
    80002674:	0080006f          	j	8000267c <kvminit+0xc0>
    80002678:	0334f063          	bgeu	s1,s3,80002698 <kvminit+0xdc>
    8000267c:	00048613          	mv	a2,s1
    80002680:	00048593          	mv	a1,s1
    80002684:	00200693          	li	a3,2
    80002688:	00040513          	mv	a0,s0
    8000268c:	d74ff0ef          	jal	80001c00 <map_page>
    80002690:	014484b3          	add	s1,s1,s4
    80002694:	fe0502e3          	beqz	a0,80002678 <kvminit+0xbc>
    80002698:	00093403          	ld	s0,0(s2)
    8000269c:	00007997          	auipc	s3,0x7
    800026a0:	96798993          	add	s3,s3,-1689 # 80009003 <data_end+0xfff>
    800026a4:	fffff7b7          	lui	a5,0xfffff
    800026a8:	00006497          	auipc	s1,0x6
    800026ac:	95848493          	add	s1,s1,-1704 # 80008000 <nextpid>
    800026b0:	00f9f9b3          	and	s3,s3,a5
    800026b4:	0334f863          	bgeu	s1,s3,800026e4 <kvminit+0x128>
    800026b8:	00001a37          	lui	s4,0x1
    800026bc:	0080006f          	j	800026c4 <kvminit+0x108>
    800026c0:	0334f063          	bgeu	s1,s3,800026e0 <kvminit+0x124>
    800026c4:	00048613          	mv	a2,s1
    800026c8:	00048593          	mv	a1,s1
    800026cc:	00600693          	li	a3,6
    800026d0:	00040513          	mv	a0,s0
    800026d4:	d2cff0ef          	jal	80001c00 <map_page>
    800026d8:	014484b3          	add	s1,s1,s4
    800026dc:	fe0502e3          	beqz	a0,800026c0 <kvminit+0x104>
    800026e0:	00093403          	ld	s0,0(s2)
    800026e4:	00425997          	auipc	s3,0x425
    800026e8:	b8b98993          	add	s3,s3,-1141 # 8042726f <bss_end+0xfff>
    800026ec:	fffff7b7          	lui	a5,0xfffff
    800026f0:	0000e497          	auipc	s1,0xe
    800026f4:	91048493          	add	s1,s1,-1776 # 80010000 <bss_start>
    800026f8:	00f9f9b3          	and	s3,s3,a5
    800026fc:	0334f863          	bgeu	s1,s3,8000272c <kvminit+0x170>
    80002700:	00001a37          	lui	s4,0x1
    80002704:	0080006f          	j	8000270c <kvminit+0x150>
    80002708:	0334f063          	bgeu	s1,s3,80002728 <kvminit+0x16c>
    8000270c:	00048613          	mv	a2,s1
    80002710:	00048593          	mv	a1,s1
    80002714:	00600693          	li	a3,6
    80002718:	00040513          	mv	a0,s0
    8000271c:	ce4ff0ef          	jal	80001c00 <map_page>
    80002720:	014484b3          	add	s1,s1,s4
    80002724:	fe0502e3          	beqz	a0,80002708 <kvminit+0x14c>
    80002728:	00093403          	ld	s0,0(s2)
    8000272c:	01100993          	li	s3,17
    80002730:	00424497          	auipc	s1,0x424
    80002734:	b4048493          	add	s1,s1,-1216 # 80426270 <bss_end>
    80002738:	01b99993          	sll	s3,s3,0x1b
    8000273c:	0334f863          	bgeu	s1,s3,8000276c <kvminit+0x1b0>
    80002740:	00001a37          	lui	s4,0x1
    80002744:	0080006f          	j	8000274c <kvminit+0x190>
    80002748:	0334f063          	bgeu	s1,s3,80002768 <kvminit+0x1ac>
    8000274c:	00048613          	mv	a2,s1
    80002750:	00048593          	mv	a1,s1
    80002754:	00600693          	li	a3,6
    80002758:	00040513          	mv	a0,s0
    8000275c:	ca4ff0ef          	jal	80001c00 <map_page>
    80002760:	014484b3          	add	s1,s1,s4
    80002764:	fe0502e3          	beqz	a0,80002748 <kvminit+0x18c>
    80002768:	00093403          	ld	s0,0(s2)
    8000276c:	00040513          	mv	a0,s0
    80002770:	02013403          	ld	s0,32(sp)
    80002774:	02813083          	ld	ra,40(sp)
    80002778:	01813483          	ld	s1,24(sp)
    8000277c:	01013903          	ld	s2,16(sp)
    80002780:	00813983          	ld	s3,8(sp)
    80002784:	00013a03          	ld	s4,0(sp)
    80002788:	00600693          	li	a3,6
    8000278c:	10000637          	lui	a2,0x10000
    80002790:	100005b7          	lui	a1,0x10000
    80002794:	03010113          	add	sp,sp,48
    80002798:	c68ff06f          	j	80001c00 <map_page>
    8000279c:	02813083          	ld	ra,40(sp)
    800027a0:	02013403          	ld	s0,32(sp)
    800027a4:	00424797          	auipc	a5,0x424
    800027a8:	a807be23          	sd	zero,-1380(a5) # 80426240 <kernel_pagetable>
    800027ac:	01813483          	ld	s1,24(sp)
    800027b0:	01013903          	ld	s2,16(sp)
    800027b4:	00813983          	ld	s3,8(sp)
    800027b8:	00013a03          	ld	s4,0(sp)
    800027bc:	03010113          	add	sp,sp,48
    800027c0:	00008067          	ret

00000000800027c4 <alloc_swap_slot>:
    800027c4:	0000f617          	auipc	a2,0xf
    800027c8:	83c60613          	add	a2,a2,-1988 # 80011000 <swap_mgr>
    800027cc:	08862803          	lw	a6,136(a2)
    800027d0:	08462883          	lw	a7,132(a2)
    800027d4:	fff00513          	li	a0,-1
    800027d8:	0d187663          	bgeu	a6,a7,800028a4 <alloc_swap_slot+0xe0>
    800027dc:	08062303          	lw	t1,128(a2)
    800027e0:	07137863          	bgeu	t1,a7,80002850 <alloc_swap_slot+0x8c>
    800027e4:	0053579b          	srlw	a5,t1,0x5
    800027e8:	00279793          	sll	a5,a5,0x2
    800027ec:	00f607b3          	add	a5,a2,a5
    800027f0:	0007a683          	lw	a3,0(a5)
    800027f4:	00100593          	li	a1,1
    800027f8:	006595bb          	sllw	a1,a1,t1
    800027fc:	00b6f7b3          	and	a5,a3,a1
    80002800:	0007879b          	sext.w	a5,a5
    80002804:	0053571b          	srlw	a4,t1,0x5
    80002808:	00030513          	mv	a0,t1
    8000280c:	08078e63          	beqz	a5,800028a8 <alloc_swap_slot+0xe4>
    80002810:	00100e13          	li	t3,1
    80002814:	01c0006f          	j	80002830 <alloc_swap_slot+0x6c>
    80002818:	0006a683          	lw	a3,0(a3)
    8000281c:	0007859b          	sext.w	a1,a5
    80002820:	0057571b          	srlw	a4,a4,0x5
    80002824:	00f6f7b3          	and	a5,a3,a5
    80002828:	0007879b          	sext.w	a5,a5
    8000282c:	06078e63          	beqz	a5,800028a8 <alloc_swap_slot+0xe4>
    80002830:	0015071b          	addw	a4,a0,1
    80002834:	0057579b          	srlw	a5,a4,0x5
    80002838:	00279793          	sll	a5,a5,0x2
    8000283c:	0007051b          	sext.w	a0,a4
    80002840:	00f606b3          	add	a3,a2,a5
    80002844:	00ee17bb          	sllw	a5,t3,a4
    80002848:	fca898e3          	bne	a7,a0,80002818 <alloc_swap_slot+0x54>
    8000284c:	04030a63          	beqz	t1,800028a0 <alloc_swap_slot+0xdc>
    80002850:	00062683          	lw	a3,0(a2)
    80002854:	0016f513          	and	a0,a3,1
    80002858:	0a050063          	beqz	a0,800028f8 <alloc_swap_slot+0x134>
    8000285c:	00000513          	li	a0,0
    80002860:	00100e13          	li	t3,1
    80002864:	01c0006f          	j	80002880 <alloc_swap_slot+0xbc>
    80002868:	0006a683          	lw	a3,0(a3)
    8000286c:	00078e9b          	sext.w	t4,a5
    80002870:	0057571b          	srlw	a4,a4,0x5
    80002874:	00f6f7b3          	and	a5,a3,a5
    80002878:	0007879b          	sext.w	a5,a5
    8000287c:	04078a63          	beqz	a5,800028d0 <alloc_swap_slot+0x10c>
    80002880:	0015071b          	addw	a4,a0,1
    80002884:	0057579b          	srlw	a5,a4,0x5
    80002888:	00279793          	sll	a5,a5,0x2
    8000288c:	0005059b          	sext.w	a1,a0
    80002890:	0007051b          	sext.w	a0,a4
    80002894:	00f606b3          	add	a3,a2,a5
    80002898:	00ee17bb          	sllw	a5,t3,a4
    8000289c:	fca316e3          	bne	t1,a0,80002868 <alloc_swap_slot+0xa4>
    800028a0:	fff00513          	li	a0,-1
    800028a4:	00008067          	ret
    800028a8:	0015079b          	addw	a5,a0,1
    800028ac:	0317f7bb          	remuw	a5,a5,a7
    800028b0:	00271713          	sll	a4,a4,0x2
    800028b4:	00e60733          	add	a4,a2,a4
    800028b8:	00b6e6b3          	or	a3,a3,a1
    800028bc:	0018081b          	addw	a6,a6,1
    800028c0:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    800028c4:	09062423          	sw	a6,136(a2)
    800028c8:	08f62023          	sw	a5,128(a2)
    800028cc:	00008067          	ret
    800028d0:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    800028d4:	0315f5bb          	remuw	a1,a1,a7
    800028d8:	00271713          	sll	a4,a4,0x2
    800028dc:	00e60733          	add	a4,a2,a4
    800028e0:	01d6e6b3          	or	a3,a3,t4
    800028e4:	0018081b          	addw	a6,a6,1
    800028e8:	00d72023          	sw	a3,0(a4)
    800028ec:	09062423          	sw	a6,136(a2)
    800028f0:	08b62023          	sw	a1,128(a2)
    800028f4:	00008067          	ret
    800028f8:	00000713          	li	a4,0
    800028fc:	00100593          	li	a1,1
    80002900:	00100e93          	li	t4,1
    80002904:	fd1ff06f          	j	800028d4 <alloc_swap_slot+0x110>

0000000080002908 <free_swap_slot>:
    80002908:	0000e717          	auipc	a4,0xe
    8000290c:	6f870713          	add	a4,a4,1784 # 80011000 <swap_mgr>
    80002910:	08472783          	lw	a5,132(a4)
    80002914:	04f57663          	bgeu	a0,a5,80002960 <free_swap_slot+0x58>
    80002918:	0055579b          	srlw	a5,a0,0x5
    8000291c:	00279793          	sll	a5,a5,0x2
    80002920:	00f707b3          	add	a5,a4,a5
    80002924:	0007a583          	lw	a1,0(a5)
    80002928:	00100693          	li	a3,1
    8000292c:	00a696bb          	sllw	a3,a3,a0
    80002930:	00d5f633          	and	a2,a1,a3
    80002934:	0006061b          	sext.w	a2,a2
    80002938:	02060463          	beqz	a2,80002960 <free_swap_slot+0x58>
    8000293c:	08872603          	lw	a2,136(a4)
    80002940:	fff6c693          	not	a3,a3
    80002944:	08072803          	lw	a6,128(a4)
    80002948:	00d5f5b3          	and	a1,a1,a3
    8000294c:	fff6069b          	addw	a3,a2,-1
    80002950:	00b7a023          	sw	a1,0(a5)
    80002954:	08d72423          	sw	a3,136(a4)
    80002958:	01057463          	bgeu	a0,a6,80002960 <free_swap_slot+0x58>
    8000295c:	08a72023          	sw	a0,128(a4)
    80002960:	00008067          	ret

0000000080002964 <find_page_desc>:
    80002964:	fffff7b7          	lui	a5,0xfffff
    80002968:	00f57533          	and	a0,a0,a5
    8000296c:	00000713          	li	a4,0
    80002970:	0040e797          	auipc	a5,0x40e
    80002974:	73078793          	add	a5,a5,1840 # 804110a0 <lru_mgr+0x10>
    80002978:	10000613          	li	a2,256
    8000297c:	0100006f          	j	8000298c <find_page_desc+0x28>
    80002980:	0017071b          	addw	a4,a4,1
    80002984:	03078793          	add	a5,a5,48
    80002988:	02c70a63          	beq	a4,a2,800029bc <find_page_desc+0x58>
    8000298c:	0007b683          	ld	a3,0(a5)
    80002990:	fea698e3          	bne	a3,a0,80002980 <find_page_desc+0x1c>
    80002994:	0147a683          	lw	a3,20(a5)
    80002998:	0016f693          	and	a3,a3,1
    8000299c:	fe0682e3          	beqz	a3,80002980 <find_page_desc+0x1c>
    800029a0:	00171513          	sll	a0,a4,0x1
    800029a4:	00e50533          	add	a0,a0,a4
    800029a8:	0040e797          	auipc	a5,0x40e
    800029ac:	6f878793          	add	a5,a5,1784 # 804110a0 <lru_mgr+0x10>
    800029b0:	00451513          	sll	a0,a0,0x4
    800029b4:	00f50533          	add	a0,a0,a5
    800029b8:	00008067          	ret
    800029bc:	00000513          	li	a0,0
    800029c0:	00008067          	ret

00000000800029c4 <lru_add_page>:
    800029c4:	02050c63          	beqz	a0,800029fc <lru_add_page+0x38>
    800029c8:	0040e717          	auipc	a4,0x40e
    800029cc:	6c870713          	add	a4,a4,1736 # 80411090 <lru_mgr>
    800029d0:	00073783          	ld	a5,0(a4)
    800029d4:	00053c23          	sd	zero,24(a0)
    800029d8:	02f53023          	sd	a5,32(a0)
    800029dc:	02078263          	beqz	a5,80002a00 <lru_add_page+0x3c>
    800029e0:	00a7bc23          	sd	a0,24(a5)
    800029e4:	00411697          	auipc	a3,0x411
    800029e8:	6ac68693          	add	a3,a3,1708 # 80414090 <lru_mgr+0x3000>
    800029ec:	0106a783          	lw	a5,16(a3)
    800029f0:	00a73023          	sd	a0,0(a4)
    800029f4:	0017879b          	addw	a5,a5,1
    800029f8:	00f6a823          	sw	a5,16(a3)
    800029fc:	00008067          	ret
    80002a00:	00a73423          	sd	a0,8(a4)
    80002a04:	fe1ff06f          	j	800029e4 <lru_add_page+0x20>

0000000080002a08 <lru_remove_page>:
    80002a08:	02050c63          	beqz	a0,80002a40 <lru_remove_page+0x38>
    80002a0c:	01853783          	ld	a5,24(a0)
    80002a10:	02053703          	ld	a4,32(a0)
    80002a14:	02078863          	beqz	a5,80002a44 <lru_remove_page+0x3c>
    80002a18:	02e7b023          	sd	a4,32(a5)
    80002a1c:	02070a63          	beqz	a4,80002a50 <lru_remove_page+0x48>
    80002a20:	00f73c23          	sd	a5,24(a4)
    80002a24:	00411717          	auipc	a4,0x411
    80002a28:	66c70713          	add	a4,a4,1644 # 80414090 <lru_mgr+0x3000>
    80002a2c:	01072783          	lw	a5,16(a4)
    80002a30:	02053023          	sd	zero,32(a0)
    80002a34:	00053c23          	sd	zero,24(a0)
    80002a38:	fff7879b          	addw	a5,a5,-1
    80002a3c:	00f72823          	sw	a5,16(a4)
    80002a40:	00008067          	ret
    80002a44:	0040e697          	auipc	a3,0x40e
    80002a48:	64e6b623          	sd	a4,1612(a3) # 80411090 <lru_mgr>
    80002a4c:	fc071ae3          	bnez	a4,80002a20 <lru_remove_page+0x18>
    80002a50:	0040e717          	auipc	a4,0x40e
    80002a54:	64f73423          	sd	a5,1608(a4) # 80411098 <lru_mgr+0x8>
    80002a58:	fcdff06f          	j	80002a24 <lru_remove_page+0x1c>

0000000080002a5c <lru_touch_page>:
    80002a5c:	fffff7b7          	lui	a5,0xfffff
    80002a60:	00f57533          	and	a0,a0,a5
    80002a64:	00000713          	li	a4,0
    80002a68:	0040e797          	auipc	a5,0x40e
    80002a6c:	63878793          	add	a5,a5,1592 # 804110a0 <lru_mgr+0x10>
    80002a70:	10000613          	li	a2,256
    80002a74:	0100006f          	j	80002a84 <lru_touch_page+0x28>
    80002a78:	0017071b          	addw	a4,a4,1
    80002a7c:	03078793          	add	a5,a5,48
    80002a80:	0ac70663          	beq	a4,a2,80002b2c <lru_touch_page+0xd0>
    80002a84:	0007b683          	ld	a3,0(a5)
    80002a88:	fea698e3          	bne	a3,a0,80002a78 <lru_touch_page+0x1c>
    80002a8c:	0147a683          	lw	a3,20(a5)
    80002a90:	0016f693          	and	a3,a3,1
    80002a94:	fe0682e3          	beqz	a3,80002a78 <lru_touch_page+0x1c>
    80002a98:	00171613          	sll	a2,a4,0x1
    80002a9c:	00e607b3          	add	a5,a2,a4
    80002aa0:	0040e597          	auipc	a1,0x40e
    80002aa4:	5f058593          	add	a1,a1,1520 # 80411090 <lru_mgr>
    80002aa8:	00479793          	sll	a5,a5,0x4
    80002aac:	00170513          	add	a0,a4,1
    80002ab0:	00f58833          	add	a6,a1,a5
    80002ab4:	00151693          	sll	a3,a0,0x1
    80002ab8:	00a686b3          	add	a3,a3,a0
    80002abc:	02883803          	ld	a6,40(a6)
    80002ac0:	00469693          	sll	a3,a3,0x4
    80002ac4:	01078793          	add	a5,a5,16
    80002ac8:	00d586b3          	add	a3,a1,a3
    80002acc:	0006b683          	ld	a3,0(a3)
    80002ad0:	00f587b3          	add	a5,a1,a5
    80002ad4:	04080e63          	beqz	a6,80002b30 <lru_touch_page+0xd4>
    80002ad8:	02d83023          	sd	a3,32(a6)
    80002adc:	0005b883          	ld	a7,0(a1)
    80002ae0:	04068c63          	beqz	a3,80002b38 <lru_touch_page+0xdc>
    80002ae4:	0106bc23          	sd	a6,24(a3)
    80002ae8:	00151693          	sll	a3,a0,0x1
    80002aec:	00e60733          	add	a4,a2,a4
    80002af0:	00a686b3          	add	a3,a3,a0
    80002af4:	00469693          	sll	a3,a3,0x4
    80002af8:	00471713          	sll	a4,a4,0x4
    80002afc:	00e58733          	add	a4,a1,a4
    80002b00:	00d586b3          	add	a3,a1,a3
    80002b04:	00411617          	auipc	a2,0x411
    80002b08:	58c60613          	add	a2,a2,1420 # 80414090 <lru_mgr+0x3000>
    80002b0c:	02073423          	sd	zero,40(a4)
    80002b10:	0116b023          	sd	a7,0(a3)
    80002b14:	01062703          	lw	a4,16(a2)
    80002b18:	02088463          	beqz	a7,80002b40 <lru_touch_page+0xe4>
    80002b1c:	00f8bc23          	sd	a5,24(a7)
    80002b20:	00f5b023          	sd	a5,0(a1)
    80002b24:	00e62823          	sw	a4,16(a2)
    80002b28:	00008067          	ret
    80002b2c:	00008067          	ret
    80002b30:	00068893          	mv	a7,a3
    80002b34:	fa0698e3          	bnez	a3,80002ae4 <lru_touch_page+0x88>
    80002b38:	0105b423          	sd	a6,8(a1)
    80002b3c:	fadff06f          	j	80002ae8 <lru_touch_page+0x8c>
    80002b40:	00f5b423          	sd	a5,8(a1)
    80002b44:	00f5b023          	sd	a5,0(a1)
    80002b48:	00e62823          	sw	a4,16(a2)
    80002b4c:	00008067          	ret

0000000080002b50 <find_victim_page>:
    80002b50:	0040e517          	auipc	a0,0x40e
    80002b54:	54853503          	ld	a0,1352(a0) # 80411098 <lru_mgr+0x8>
    80002b58:	00008067          	ret

0000000080002b5c <swap_out_page>:
    80002b5c:	16050263          	beqz	a0,80002cc0 <swap_out_page+0x164>
    80002b60:	fd010113          	add	sp,sp,-48
    80002b64:	00913c23          	sd	s1,24(sp)
    80002b68:	01452483          	lw	s1,20(a0)
    80002b6c:	02813023          	sd	s0,32(sp)
    80002b70:	01313423          	sd	s3,8(sp)
    80002b74:	02113423          	sd	ra,40(sp)
    80002b78:	01213823          	sd	s2,16(sp)
    80002b7c:	0014f793          	and	a5,s1,1
    80002b80:	00050413          	mv	s0,a0
    80002b84:	00048993          	mv	s3,s1
    80002b88:	12078863          	beqz	a5,80002cb8 <swap_out_page+0x15c>
    80002b8c:	c39ff0ef          	jal	800027c4 <alloc_swap_slot>
    80002b90:	0005091b          	sext.w	s2,a0
    80002b94:	fff00793          	li	a5,-1
    80002b98:	12f90063          	beq	s2,a5,80002cb8 <swap_out_page+0x15c>
    80002b9c:	0049f993          	and	s3,s3,4
    80002ba0:	04098663          	beqz	s3,80002bec <swap_out_page+0x90>
    80002ba4:	00843683          	ld	a3,8(s0)
    80002ba8:	00c9171b          	sllw	a4,s2,0xc
    80002bac:	0000e797          	auipc	a5,0xe
    80002bb0:	4e478793          	add	a5,a5,1252 # 80011090 <swap_area>
    80002bb4:	02071713          	sll	a4,a4,0x20
    80002bb8:	02075713          	srl	a4,a4,0x20
    80002bbc:	40f686b3          	sub	a3,a3,a5
    80002bc0:	0000f617          	auipc	a2,0xf
    80002bc4:	4d060613          	add	a2,a2,1232 # 80012090 <swap_area+0x1000>
    80002bc8:	00f707b3          	add	a5,a4,a5
    80002bcc:	00e60633          	add	a2,a2,a4
    80002bd0:	40e686b3          	sub	a3,a3,a4
    80002bd4:	00f68733          	add	a4,a3,a5
    80002bd8:	00074703          	lbu	a4,0(a4)
    80002bdc:	00178793          	add	a5,a5,1
    80002be0:	fee78fa3          	sb	a4,-1(a5)
    80002be4:	fec798e3          	bne	a5,a2,80002bd4 <swap_out_page+0x78>
    80002be8:	01442483          	lw	s1,20(s0)
    80002bec:	00043583          	ld	a1,0(s0)
    80002bf0:	02843503          	ld	a0,40(s0)
    80002bf4:	f11fe0ef          	jal	80001b04 <walk_lookup>
    80002bf8:	00050863          	beqz	a0,80002c08 <swap_out_page+0xac>
    80002bfc:	00053783          	ld	a5,0(a0)
    80002c00:	0017f713          	and	a4,a5,1
    80002c04:	08071063          	bnez	a4,80002c84 <swap_out_page+0x128>
    80002c08:	ffe4f793          	and	a5,s1,-2
    80002c0c:	0027e793          	or	a5,a5,2
    80002c10:	02091913          	sll	s2,s2,0x20
    80002c14:	02079793          	sll	a5,a5,0x20
    80002c18:	00843503          	ld	a0,8(s0)
    80002c1c:	02095913          	srl	s2,s2,0x20
    80002c20:	00f96933          	or	s2,s2,a5
    80002c24:	01243823          	sd	s2,16(s0)
    80002c28:	df5fe0ef          	jal	80001a1c <free_page>
    80002c2c:	01843783          	ld	a5,24(s0)
    80002c30:	00043423          	sd	zero,8(s0)
    80002c34:	02043703          	ld	a4,32(s0)
    80002c38:	06078463          	beqz	a5,80002ca0 <swap_out_page+0x144>
    80002c3c:	02e7b023          	sd	a4,32(a5)
    80002c40:	06070663          	beqz	a4,80002cac <swap_out_page+0x150>
    80002c44:	00f73c23          	sd	a5,24(a4)
    80002c48:	00411717          	auipc	a4,0x411
    80002c4c:	44870713          	add	a4,a4,1096 # 80414090 <lru_mgr+0x3000>
    80002c50:	01072783          	lw	a5,16(a4)
    80002c54:	02043023          	sd	zero,32(s0)
    80002c58:	00043c23          	sd	zero,24(s0)
    80002c5c:	fff7879b          	addw	a5,a5,-1
    80002c60:	00f72823          	sw	a5,16(a4)
    80002c64:	00000513          	li	a0,0
    80002c68:	02813083          	ld	ra,40(sp)
    80002c6c:	02013403          	ld	s0,32(sp)
    80002c70:	01813483          	ld	s1,24(sp)
    80002c74:	01013903          	ld	s2,16(sp)
    80002c78:	00813983          	ld	s3,8(sp)
    80002c7c:	03010113          	add	sp,sp,48
    80002c80:	00008067          	ret
    80002c84:	00a9171b          	sllw	a4,s2,0xa
    80002c88:	02071713          	sll	a4,a4,0x20
    80002c8c:	ffe7f793          	and	a5,a5,-2
    80002c90:	02075713          	srl	a4,a4,0x20
    80002c94:	00e7e7b3          	or	a5,a5,a4
    80002c98:	00f53023          	sd	a5,0(a0)
    80002c9c:	f6dff06f          	j	80002c08 <swap_out_page+0xac>
    80002ca0:	0040e697          	auipc	a3,0x40e
    80002ca4:	3ee6b823          	sd	a4,1008(a3) # 80411090 <lru_mgr>
    80002ca8:	f8071ee3          	bnez	a4,80002c44 <swap_out_page+0xe8>
    80002cac:	0040e717          	auipc	a4,0x40e
    80002cb0:	3ef73623          	sd	a5,1004(a4) # 80411098 <lru_mgr+0x8>
    80002cb4:	f95ff06f          	j	80002c48 <swap_out_page+0xec>
    80002cb8:	fff00513          	li	a0,-1
    80002cbc:	fadff06f          	j	80002c68 <swap_out_page+0x10c>
    80002cc0:	fff00513          	li	a0,-1
    80002cc4:	00008067          	ret

0000000080002cc8 <swap_in_page>:
    80002cc8:	12050263          	beqz	a0,80002dec <swap_in_page+0x124>
    80002ccc:	01452783          	lw	a5,20(a0)
    80002cd0:	fe010113          	add	sp,sp,-32
    80002cd4:	00813823          	sd	s0,16(sp)
    80002cd8:	00113c23          	sd	ra,24(sp)
    80002cdc:	00913423          	sd	s1,8(sp)
    80002ce0:	0027f793          	and	a5,a5,2
    80002ce4:	00050413          	mv	s0,a0
    80002ce8:	0e078e63          	beqz	a5,80002de4 <swap_in_page+0x11c>
    80002cec:	01052703          	lw	a4,16(a0)
    80002cf0:	0000e797          	auipc	a5,0xe
    80002cf4:	3a078793          	add	a5,a5,928 # 80011090 <swap_area>
    80002cf8:	40f58633          	sub	a2,a1,a5
    80002cfc:	00c7171b          	sllw	a4,a4,0xc
    80002d00:	02071713          	sll	a4,a4,0x20
    80002d04:	02075713          	srl	a4,a4,0x20
    80002d08:	0000f817          	auipc	a6,0xf
    80002d0c:	38880813          	add	a6,a6,904 # 80012090 <swap_area+0x1000>
    80002d10:	00058493          	mv	s1,a1
    80002d14:	00f707b3          	add	a5,a4,a5
    80002d18:	00e80833          	add	a6,a6,a4
    80002d1c:	40e60633          	sub	a2,a2,a4
    80002d20:	0007c683          	lbu	a3,0(a5)
    80002d24:	00f60733          	add	a4,a2,a5
    80002d28:	00178793          	add	a5,a5,1
    80002d2c:	00d70023          	sb	a3,0(a4)
    80002d30:	ff0798e3          	bne	a5,a6,80002d20 <swap_in_page+0x58>
    80002d34:	00043583          	ld	a1,0(s0)
    80002d38:	02843503          	ld	a0,40(s0)
    80002d3c:	dc9fe0ef          	jal	80001b04 <walk_lookup>
    80002d40:	02050063          	beqz	a0,80002d60 <swap_in_page+0x98>
    80002d44:	00053703          	ld	a4,0(a0)
    80002d48:	00c4d793          	srl	a5,s1,0xc
    80002d4c:	00a79793          	sll	a5,a5,0xa
    80002d50:	01e77713          	and	a4,a4,30
    80002d54:	00e7e7b3          	or	a5,a5,a4
    80002d58:	0017e793          	or	a5,a5,1
    80002d5c:	00f53023          	sd	a5,0(a0)
    80002d60:	01442783          	lw	a5,20(s0)
    80002d64:	01042503          	lw	a0,16(s0)
    80002d68:	00943423          	sd	s1,8(s0)
    80002d6c:	ffd7f793          	and	a5,a5,-3
    80002d70:	0017e793          	or	a5,a5,1
    80002d74:	00f42a23          	sw	a5,20(s0)
    80002d78:	0000e797          	auipc	a5,0xe
    80002d7c:	30c7a783          	lw	a5,780(a5) # 80011084 <swap_mgr+0x84>
    80002d80:	00f57463          	bgeu	a0,a5,80002d88 <swap_in_page+0xc0>
    80002d84:	df5fe0ef          	jal	80001b78 <free_swap_slot.part.0>
    80002d88:	0040e717          	auipc	a4,0x40e
    80002d8c:	30870713          	add	a4,a4,776 # 80411090 <lru_mgr>
    80002d90:	00073783          	ld	a5,0(a4)
    80002d94:	fff00693          	li	a3,-1
    80002d98:	00d42823          	sw	a3,16(s0)
    80002d9c:	02f43023          	sd	a5,32(s0)
    80002da0:	00043c23          	sd	zero,24(s0)
    80002da4:	02078c63          	beqz	a5,80002ddc <swap_in_page+0x114>
    80002da8:	0087bc23          	sd	s0,24(a5)
    80002dac:	00411697          	auipc	a3,0x411
    80002db0:	2e468693          	add	a3,a3,740 # 80414090 <lru_mgr+0x3000>
    80002db4:	0106a783          	lw	a5,16(a3)
    80002db8:	00873023          	sd	s0,0(a4)
    80002dbc:	00000513          	li	a0,0
    80002dc0:	0017879b          	addw	a5,a5,1
    80002dc4:	00f6a823          	sw	a5,16(a3)
    80002dc8:	01813083          	ld	ra,24(sp)
    80002dcc:	01013403          	ld	s0,16(sp)
    80002dd0:	00813483          	ld	s1,8(sp)
    80002dd4:	02010113          	add	sp,sp,32
    80002dd8:	00008067          	ret
    80002ddc:	00873423          	sd	s0,8(a4)
    80002de0:	fcdff06f          	j	80002dac <swap_in_page+0xe4>
    80002de4:	fff00513          	li	a0,-1
    80002de8:	fe1ff06f          	j	80002dc8 <swap_in_page+0x100>
    80002dec:	fff00513          	li	a0,-1
    80002df0:	00008067          	ret

0000000080002df4 <handle_page_fault>:
    80002df4:	fd010113          	add	sp,sp,-48
    80002df8:	fffff7b7          	lui	a5,0xfffff
    80002dfc:	02813023          	sd	s0,32(sp)
    80002e00:	00f5f433          	and	s0,a1,a5
    80002e04:	00040593          	mv	a1,s0
    80002e08:	01213823          	sd	s2,16(sp)
    80002e0c:	02113423          	sd	ra,40(sp)
    80002e10:	00913c23          	sd	s1,24(sp)
    80002e14:	01313423          	sd	s3,8(sp)
    80002e18:	00050913          	mv	s2,a0
    80002e1c:	ce9fe0ef          	jal	80001b04 <walk_lookup>
    80002e20:	12050c63          	beqz	a0,80002f58 <handle_page_fault+0x164>
    80002e24:	00053483          	ld	s1,0(a0)
    80002e28:	0014f793          	and	a5,s1,1
    80002e2c:	12079663          	bnez	a5,80002f58 <handle_page_fault+0x164>
    80002e30:	12048463          	beqz	s1,80002f58 <handle_page_fault+0x164>
    80002e34:	00a4d493          	srl	s1,s1,0xa
    80002e38:	bc9fe0ef          	jal	80001a00 <alloc_page>
    80002e3c:	0004849b          	sext.w	s1,s1
    80002e40:	00050993          	mv	s3,a0
    80002e44:	0e050a63          	beqz	a0,80002f38 <handle_page_fault+0x144>
    80002e48:	0040e797          	auipc	a5,0x40e
    80002e4c:	25878793          	add	a5,a5,600 # 804110a0 <lru_mgr+0x10>
    80002e50:	00000713          	li	a4,0
    80002e54:	10000613          	li	a2,256
    80002e58:	0100006f          	j	80002e68 <handle_page_fault+0x74>
    80002e5c:	0017071b          	addw	a4,a4,1
    80002e60:	03078793          	add	a5,a5,48
    80002e64:	06c70063          	beq	a4,a2,80002ec4 <handle_page_fault+0xd0>
    80002e68:	0007b683          	ld	a3,0(a5)
    80002e6c:	fe8698e3          	bne	a3,s0,80002e5c <handle_page_fault+0x68>
    80002e70:	0147a683          	lw	a3,20(a5)
    80002e74:	0026f693          	and	a3,a3,2
    80002e78:	fe0682e3          	beqz	a3,80002e5c <handle_page_fault+0x68>
    80002e7c:	0107a683          	lw	a3,16(a5)
    80002e80:	fc969ee3          	bne	a3,s1,80002e5c <handle_page_fault+0x68>
    80002e84:	00171513          	sll	a0,a4,0x1
    80002e88:	00e50533          	add	a0,a0,a4
    80002e8c:	00451513          	sll	a0,a0,0x4
    80002e90:	0040e797          	auipc	a5,0x40e
    80002e94:	21078793          	add	a5,a5,528 # 804110a0 <lru_mgr+0x10>
    80002e98:	00f50533          	add	a0,a0,a5
    80002e9c:	00098593          	mv	a1,s3
    80002ea0:	e29ff0ef          	jal	80002cc8 <swap_in_page>
    80002ea4:	0a051e63          	bnez	a0,80002f60 <handle_page_fault+0x16c>
    80002ea8:	02813083          	ld	ra,40(sp)
    80002eac:	02013403          	ld	s0,32(sp)
    80002eb0:	01813483          	ld	s1,24(sp)
    80002eb4:	01013903          	ld	s2,16(sp)
    80002eb8:	00813983          	ld	s3,8(sp)
    80002ebc:	03010113          	add	sp,sp,48
    80002ec0:	00008067          	ret
    80002ec4:	0040e717          	auipc	a4,0x40e
    80002ec8:	1f070713          	add	a4,a4,496 # 804110b4 <lru_mgr+0x24>
    80002ecc:	00000793          	li	a5,0
    80002ed0:	10000613          	li	a2,256
    80002ed4:	00c0006f          	j	80002ee0 <handle_page_fault+0xec>
    80002ed8:	0017879b          	addw	a5,a5,1
    80002edc:	08c78263          	beq	a5,a2,80002f60 <handle_page_fault+0x16c>
    80002ee0:	00072683          	lw	a3,0(a4)
    80002ee4:	03070713          	add	a4,a4,48
    80002ee8:	fe0698e3          	bnez	a3,80002ed8 <handle_page_fault+0xe4>
    80002eec:	00178613          	add	a2,a5,1
    80002ef0:	00179713          	sll	a4,a5,0x1
    80002ef4:	00161693          	sll	a3,a2,0x1
    80002ef8:	00f707b3          	add	a5,a4,a5
    80002efc:	00479793          	sll	a5,a5,0x4
    80002f00:	00c68733          	add	a4,a3,a2
    80002f04:	0040e617          	auipc	a2,0x40e
    80002f08:	18c60613          	add	a2,a2,396 # 80411090 <lru_mgr>
    80002f0c:	00f606b3          	add	a3,a2,a5
    80002f10:	00471713          	sll	a4,a4,0x4
    80002f14:	01078793          	add	a5,a5,16
    80002f18:	00e60733          	add	a4,a2,a4
    80002f1c:	00c78533          	add	a0,a5,a2
    80002f20:	00200793          	li	a5,2
    80002f24:	0086b823          	sd	s0,16(a3)
    80002f28:	01273423          	sd	s2,8(a4)
    80002f2c:	0296a023          	sw	s1,32(a3)
    80002f30:	02f6a223          	sw	a5,36(a3)
    80002f34:	f69ff06f          	j	80002e9c <handle_page_fault+0xa8>
    80002f38:	0040e517          	auipc	a0,0x40e
    80002f3c:	16053503          	ld	a0,352(a0) # 80411098 <lru_mgr+0x8>
    80002f40:	00050c63          	beqz	a0,80002f58 <handle_page_fault+0x164>
    80002f44:	c19ff0ef          	jal	80002b5c <swap_out_page>
    80002f48:	00051863          	bnez	a0,80002f58 <handle_page_fault+0x164>
    80002f4c:	ab5fe0ef          	jal	80001a00 <alloc_page>
    80002f50:	00050993          	mv	s3,a0
    80002f54:	ee051ae3          	bnez	a0,80002e48 <handle_page_fault+0x54>
    80002f58:	fff00513          	li	a0,-1
    80002f5c:	f4dff06f          	j	80002ea8 <handle_page_fault+0xb4>
    80002f60:	00098513          	mv	a0,s3
    80002f64:	ab9fe0ef          	jal	80001a1c <free_page>
    80002f68:	fff00513          	li	a0,-1
    80002f6c:	f3dff06f          	j	80002ea8 <handle_page_fault+0xb4>

0000000080002f70 <va2pa_with_replacement>:
    80002f70:	fe010113          	add	sp,sp,-32
    80002f74:	00913423          	sd	s1,8(sp)
    80002f78:	01213023          	sd	s2,0(sp)
    80002f7c:	00113c23          	sd	ra,24(sp)
    80002f80:	00813823          	sd	s0,16(sp)
    80002f84:	00050493          	mv	s1,a0
    80002f88:	00058913          	mv	s2,a1
    80002f8c:	b79fe0ef          	jal	80001b04 <walk_lookup>
    80002f90:	00050a63          	beqz	a0,80002fa4 <va2pa_with_replacement+0x34>
    80002f94:	00053403          	ld	s0,0(a0)
    80002f98:	00147793          	and	a5,s0,1
    80002f9c:	06079663          	bnez	a5,80003008 <va2pa_with_replacement+0x98>
    80002fa0:	02041063          	bnez	s0,80002fc0 <va2pa_with_replacement+0x50>
    80002fa4:	00000513          	li	a0,0
    80002fa8:	01813083          	ld	ra,24(sp)
    80002fac:	01013403          	ld	s0,16(sp)
    80002fb0:	00813483          	ld	s1,8(sp)
    80002fb4:	00013903          	ld	s2,0(sp)
    80002fb8:	02010113          	add	sp,sp,32
    80002fbc:	00008067          	ret
    80002fc0:	00600613          	li	a2,6
    80002fc4:	00090593          	mv	a1,s2
    80002fc8:	00048513          	mv	a0,s1
    80002fcc:	e29ff0ef          	jal	80002df4 <handle_page_fault>
    80002fd0:	fc051ae3          	bnez	a0,80002fa4 <va2pa_with_replacement+0x34>
    80002fd4:	00090593          	mv	a1,s2
    80002fd8:	00048513          	mv	a0,s1
    80002fdc:	b29fe0ef          	jal	80001b04 <walk_lookup>
    80002fe0:	fc0502e3          	beqz	a0,80002fa4 <va2pa_with_replacement+0x34>
    80002fe4:	00053783          	ld	a5,0(a0)
    80002fe8:	0017f713          	and	a4,a5,1
    80002fec:	fa070ce3          	beqz	a4,80002fa4 <va2pa_with_replacement+0x34>
    80002ff0:	00a7d793          	srl	a5,a5,0xa
    80002ff4:	03491593          	sll	a1,s2,0x34
    80002ff8:	00c79513          	sll	a0,a5,0xc
    80002ffc:	0345d593          	srl	a1,a1,0x34
    80003000:	00b50533          	add	a0,a0,a1
    80003004:	fa5ff06f          	j	80002fa8 <va2pa_with_replacement+0x38>
    80003008:	00090513          	mv	a0,s2
    8000300c:	a51ff0ef          	jal	80002a5c <lru_touch_page>
    80003010:	01813083          	ld	ra,24(sp)
    80003014:	00a45513          	srl	a0,s0,0xa
    80003018:	01013403          	ld	s0,16(sp)
    8000301c:	03491593          	sll	a1,s2,0x34
    80003020:	00c51513          	sll	a0,a0,0xc
    80003024:	0345d593          	srl	a1,a1,0x34
    80003028:	00813483          	ld	s1,8(sp)
    8000302c:	00013903          	ld	s2,0(sp)
    80003030:	00b50533          	add	a0,a0,a1
    80003034:	02010113          	add	sp,sp,32
    80003038:	00008067          	ret

000000008000303c <safe_copyout>:
    8000303c:	14068063          	beqz	a3,8000317c <safe_copyout+0x140>
    80003040:	fb010113          	add	sp,sp,-80
    80003044:	02913c23          	sd	s1,56(sp)
    80003048:	03213823          	sd	s2,48(sp)
    8000304c:	03313423          	sd	s3,40(sp)
    80003050:	03413023          	sd	s4,32(sp)
    80003054:	01513c23          	sd	s5,24(sp)
    80003058:	01613823          	sd	s6,16(sp)
    8000305c:	01713423          	sd	s7,8(sp)
    80003060:	01813023          	sd	s8,0(sp)
    80003064:	04113423          	sd	ra,72(sp)
    80003068:	04813023          	sd	s0,64(sp)
    8000306c:	00068b13          	mv	s6,a3
    80003070:	00050993          	mv	s3,a0
    80003074:	00058c13          	mv	s8,a1
    80003078:	00060b93          	mv	s7,a2
    8000307c:	fffffa37          	lui	s4,0xfffff
    80003080:	00001937          	lui	s2,0x1
    80003084:	10000493          	li	s1,256
    80003088:	0040ea97          	auipc	s5,0x40e
    8000308c:	008a8a93          	add	s5,s5,8 # 80411090 <lru_mgr>
    80003090:	014c7433          	and	s0,s8,s4
    80003094:	00040593          	mv	a1,s0
    80003098:	00098513          	mv	a0,s3
    8000309c:	ed5ff0ef          	jal	80002f70 <va2pa_with_replacement>
    800030a0:	0c050a63          	beqz	a0,80003174 <safe_copyout+0x138>
    800030a4:	41840833          	sub	a6,s0,s8
    800030a8:	01280833          	add	a6,a6,s2
    800030ac:	010b7463          	bgeu	s6,a6,800030b4 <safe_copyout+0x78>
    800030b0:	000b0813          	mv	a6,s6
    800030b4:	01850733          	add	a4,a0,s8
    800030b8:	40870733          	sub	a4,a4,s0
    800030bc:	01780533          	add	a0,a6,s7
    800030c0:	000b8793          	mv	a5,s7
    800030c4:	41770733          	sub	a4,a4,s7
    800030c8:	0a080263          	beqz	a6,8000316c <safe_copyout+0x130>
    800030cc:	0007c583          	lbu	a1,0(a5)
    800030d0:	00f70633          	add	a2,a4,a5
    800030d4:	00178793          	add	a5,a5,1
    800030d8:	00b60023          	sb	a1,0(a2)
    800030dc:	fef518e3          	bne	a0,a5,800030cc <safe_copyout+0x90>
    800030e0:	0040e797          	auipc	a5,0x40e
    800030e4:	fc078793          	add	a5,a5,-64 # 804110a0 <lru_mgr+0x10>
    800030e8:	00000713          	li	a4,0
    800030ec:	0100006f          	j	800030fc <safe_copyout+0xc0>
    800030f0:	0017071b          	addw	a4,a4,1
    800030f4:	03078793          	add	a5,a5,48
    800030f8:	02970863          	beq	a4,s1,80003128 <safe_copyout+0xec>
    800030fc:	0007b603          	ld	a2,0(a5)
    80003100:	fec418e3          	bne	s0,a2,800030f0 <safe_copyout+0xb4>
    80003104:	0147a603          	lw	a2,20(a5)
    80003108:	00167593          	and	a1,a2,1
    8000310c:	fe0582e3          	beqz	a1,800030f0 <safe_copyout+0xb4>
    80003110:	00171793          	sll	a5,a4,0x1
    80003114:	00e787b3          	add	a5,a5,a4
    80003118:	00479793          	sll	a5,a5,0x4
    8000311c:	00fa87b3          	add	a5,s5,a5
    80003120:	00466613          	or	a2,a2,4
    80003124:	02c7a223          	sw	a2,36(a5)
    80003128:	410b0b33          	sub	s6,s6,a6
    8000312c:	00050b93          	mv	s7,a0
    80003130:	01240c33          	add	s8,s0,s2
    80003134:	f40b1ee3          	bnez	s6,80003090 <safe_copyout+0x54>
    80003138:	00000513          	li	a0,0
    8000313c:	04813083          	ld	ra,72(sp)
    80003140:	04013403          	ld	s0,64(sp)
    80003144:	03813483          	ld	s1,56(sp)
    80003148:	03013903          	ld	s2,48(sp)
    8000314c:	02813983          	ld	s3,40(sp)
    80003150:	02013a03          	ld	s4,32(sp)
    80003154:	01813a83          	ld	s5,24(sp)
    80003158:	01013b03          	ld	s6,16(sp)
    8000315c:	00813b83          	ld	s7,8(sp)
    80003160:	00013c03          	ld	s8,0(sp)
    80003164:	05010113          	add	sp,sp,80
    80003168:	00008067          	ret
    8000316c:	000b8513          	mv	a0,s7
    80003170:	f71ff06f          	j	800030e0 <safe_copyout+0xa4>
    80003174:	fff00513          	li	a0,-1
    80003178:	fc5ff06f          	j	8000313c <safe_copyout+0x100>
    8000317c:	00000513          	li	a0,0
    80003180:	00008067          	ret

0000000080003184 <safe_copyin>:
    80003184:	0e068863          	beqz	a3,80003274 <safe_copyin+0xf0>
    80003188:	fc010113          	add	sp,sp,-64
    8000318c:	02813823          	sd	s0,48(sp)
    80003190:	02913423          	sd	s1,40(sp)
    80003194:	03213023          	sd	s2,32(sp)
    80003198:	01313c23          	sd	s3,24(sp)
    8000319c:	01513423          	sd	s5,8(sp)
    800031a0:	01613023          	sd	s6,0(sp)
    800031a4:	02113c23          	sd	ra,56(sp)
    800031a8:	01413823          	sd	s4,16(sp)
    800031ac:	00068b13          	mv	s6,a3
    800031b0:	00050493          	mv	s1,a0
    800031b4:	00058993          	mv	s3,a1
    800031b8:	00060a93          	mv	s5,a2
    800031bc:	fffff937          	lui	s2,0xfffff
    800031c0:	00001437          	lui	s0,0x1
    800031c4:	012afa33          	and	s4,s5,s2
    800031c8:	000a0593          	mv	a1,s4
    800031cc:	00048513          	mv	a0,s1
    800031d0:	da1ff0ef          	jal	80002f70 <va2pa_with_replacement>
    800031d4:	08050c63          	beqz	a0,8000326c <safe_copyin+0xe8>
    800031d8:	415a08b3          	sub	a7,s4,s5
    800031dc:	008888b3          	add	a7,a7,s0
    800031e0:	011b7463          	bgeu	s6,a7,800031e8 <safe_copyin+0x64>
    800031e4:	000b0893          	mv	a7,s6
    800031e8:	01550533          	add	a0,a0,s5
    800031ec:	41450533          	sub	a0,a0,s4
    800031f0:	06088063          	beqz	a7,80003250 <safe_copyin+0xcc>
    800031f4:	00098793          	mv	a5,s3
    800031f8:	01198833          	add	a6,s3,a7
    800031fc:	41350733          	sub	a4,a0,s3
    80003200:	00f70633          	add	a2,a4,a5
    80003204:	00064603          	lbu	a2,0(a2)
    80003208:	00178793          	add	a5,a5,1
    8000320c:	fec78fa3          	sb	a2,-1(a5)
    80003210:	fef818e3          	bne	a6,a5,80003200 <safe_copyin+0x7c>
    80003214:	411b0b33          	sub	s6,s6,a7
    80003218:	00080993          	mv	s3,a6
    8000321c:	008a0ab3          	add	s5,s4,s0
    80003220:	fa0b12e3          	bnez	s6,800031c4 <safe_copyin+0x40>
    80003224:	00000513          	li	a0,0
    80003228:	03813083          	ld	ra,56(sp)
    8000322c:	03013403          	ld	s0,48(sp)
    80003230:	02813483          	ld	s1,40(sp)
    80003234:	02013903          	ld	s2,32(sp)
    80003238:	01813983          	ld	s3,24(sp)
    8000323c:	01013a03          	ld	s4,16(sp)
    80003240:	00813a83          	ld	s5,8(sp)
    80003244:	00013b03          	ld	s6,0(sp)
    80003248:	04010113          	add	sp,sp,64
    8000324c:	00008067          	ret
    80003250:	00001ab7          	lui	s5,0x1
    80003254:	015a0ab3          	add	s5,s4,s5
    80003258:	012afa33          	and	s4,s5,s2
    8000325c:	000a0593          	mv	a1,s4
    80003260:	00048513          	mv	a0,s1
    80003264:	d0dff0ef          	jal	80002f70 <va2pa_with_replacement>
    80003268:	f60518e3          	bnez	a0,800031d8 <safe_copyin+0x54>
    8000326c:	fff00513          	li	a0,-1
    80003270:	fb9ff06f          	j	80003228 <safe_copyin+0xa4>
    80003274:	00000513          	li	a0,0
    80003278:	00008067          	ret

000000008000327c <test_page_replacement>:
    8000327c:	f4010113          	add	sp,sp,-192
    80003280:	00004517          	auipc	a0,0x4
    80003284:	85850513          	add	a0,a0,-1960 # 80006ad8 <digits+0x68>
    80003288:	0a113c23          	sd	ra,184(sp)
    8000328c:	0a813823          	sd	s0,176(sp)
    80003290:	0a913423          	sd	s1,168(sp)
    80003294:	0b213023          	sd	s2,160(sp)
    80003298:	09313c23          	sd	s3,152(sp)
    8000329c:	eb8fe0ef          	jal	80001954 <uart_puts>
    800032a0:	00004517          	auipc	a0,0x4
    800032a4:	86050513          	add	a0,a0,-1952 # 80006b00 <digits+0x90>
    800032a8:	eacfe0ef          	jal	80001954 <uart_puts>
    800032ac:	d18ff0ef          	jal	800027c4 <alloc_swap_slot>
    800032b0:	0005049b          	sext.w	s1,a0
    800032b4:	d10ff0ef          	jal	800027c4 <alloc_swap_slot>
    800032b8:	0005041b          	sext.w	s0,a0
    800032bc:	d08ff0ef          	jal	800027c4 <alloc_swap_slot>
    800032c0:	fff00793          	li	a5,-1
    800032c4:	02f48663          	beq	s1,a5,800032f0 <test_page_replacement+0x74>
    800032c8:	1cf40c63          	beq	s0,a5,800034a0 <test_page_replacement+0x224>
    800032cc:	0005051b          	sext.w	a0,a0
    800032d0:	02f50063          	beq	a0,a5,800032f0 <test_page_replacement+0x74>
    800032d4:	00848e63          	beq	s1,s0,800032f0 <test_page_replacement+0x74>
    800032d8:	00a40c63          	beq	s0,a0,800032f0 <test_page_replacement+0x74>
    800032dc:	00a48a63          	beq	s1,a0,800032f0 <test_page_replacement+0x74>
    800032e0:	00004517          	auipc	a0,0x4
    800032e4:	84850513          	add	a0,a0,-1976 # 80006b28 <digits+0xb8>
    800032e8:	e6cfe0ef          	jal	80001954 <uart_puts>
    800032ec:	0100006f          	j	800032fc <test_page_replacement+0x80>
    800032f0:	00004517          	auipc	a0,0x4
    800032f4:	85850513          	add	a0,a0,-1960 # 80006b48 <digits+0xd8>
    800032f8:	e5cfe0ef          	jal	80001954 <uart_puts>
    800032fc:	0000e797          	auipc	a5,0xe
    80003300:	d887a783          	lw	a5,-632(a5) # 80011084 <swap_mgr+0x84>
    80003304:	00f47663          	bgeu	s0,a5,80003310 <test_page_replacement+0x94>
    80003308:	00040513          	mv	a0,s0
    8000330c:	86dfe0ef          	jal	80001b78 <free_swap_slot.part.0>
    80003310:	cb4ff0ef          	jal	800027c4 <alloc_swap_slot>
    80003314:	0005051b          	sext.w	a0,a0
    80003318:	14a40c63          	beq	s0,a0,80003470 <test_page_replacement+0x1f4>
    8000331c:	00004517          	auipc	a0,0x4
    80003320:	87450513          	add	a0,a0,-1932 # 80006b90 <digits+0x120>
    80003324:	e30fe0ef          	jal	80001954 <uart_puts>
    80003328:	00004517          	auipc	a0,0x4
    8000332c:	89050513          	add	a0,a0,-1904 # 80006bb8 <digits+0x148>
    80003330:	e24fe0ef          	jal	80001954 <uart_puts>
    80003334:	00080737          	lui	a4,0x80
    80003338:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    8000333c:	00010637          	lui	a2,0x10
    80003340:	00c71713          	sll	a4,a4,0xc
    80003344:	fff00793          	li	a5,-1
    80003348:	01f7d793          	srl	a5,a5,0x1f
    8000334c:	00c13023          	sd	a2,0(sp)
    80003350:	02e13c23          	sd	a4,56(sp)
    80003354:	00100613          	li	a2,1
    80003358:	00012737          	lui	a4,0x12
    8000335c:	01f61613          	sll	a2,a2,0x1f
    80003360:	00f13823          	sd	a5,16(sp)
    80003364:	04f13023          	sd	a5,64(sp)
    80003368:	06e13023          	sd	a4,96(sp)
    8000336c:	06f13823          	sd	a5,112(sp)
    80003370:	40001737          	lui	a4,0x40001
    80003374:	03010793          	add	a5,sp,48
    80003378:	00423697          	auipc	a3,0x423
    8000337c:	ec86b683          	ld	a3,-312(a3) # 80426240 <kernel_pagetable>
    80003380:	00171713          	sll	a4,a4,0x1
    80003384:	0040e417          	auipc	s0,0x40e
    80003388:	d0c40413          	add	s0,s0,-756 # 80411090 <lru_mgr>
    8000338c:	00010493          	mv	s1,sp
    80003390:	06010993          	add	s3,sp,96
    80003394:	00c13423          	sd	a2,8(sp)
    80003398:	00f13c23          	sd	a5,24(sp)
    8000339c:	00011637          	lui	a2,0x11
    800033a0:	08f13023          	sd	a5,128(sp)
    800033a4:	00411917          	auipc	s2,0x411
    800033a8:	cec90913          	add	s2,s2,-788 # 80414090 <lru_mgr+0x3000>
    800033ac:	00300793          	li	a5,3
    800033b0:	00004517          	auipc	a0,0x4
    800033b4:	82850513          	add	a0,a0,-2008 # 80006bd8 <digits+0x168>
    800033b8:	06e13423          	sd	a4,104(sp)
    800033bc:	00f92823          	sw	a5,16(s2)
    800033c0:	02013023          	sd	zero,32(sp)
    800033c4:	02d13423          	sd	a3,40(sp)
    800033c8:	02c13823          	sd	a2,48(sp)
    800033cc:	04d13c23          	sd	a3,88(sp)
    800033d0:	06013c23          	sd	zero,120(sp)
    800033d4:	08d13423          	sd	a3,136(sp)
    800033d8:	00943423          	sd	s1,8(s0)
    800033dc:	04913823          	sd	s1,80(sp)
    800033e0:	05313423          	sd	s3,72(sp)
    800033e4:	01343023          	sd	s3,0(s0)
    800033e8:	d6cfe0ef          	jal	80001954 <uart_puts>
    800033ec:	04813783          	ld	a5,72(sp)
    800033f0:	05013703          	ld	a4,80(sp)
    800033f4:	08078a63          	beqz	a5,80003488 <test_page_replacement+0x20c>
    800033f8:	02e7b023          	sd	a4,32(a5)
    800033fc:	08070263          	beqz	a4,80003480 <test_page_replacement+0x204>
    80003400:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    80003404:	01092783          	lw	a5,16(s2)
    80003408:	04013823          	sd	zero,80(sp)
    8000340c:	04013423          	sd	zero,72(sp)
    80003410:	fff7871b          	addw	a4,a5,-1
    80003414:	00e92823          	sw	a4,16(s2)
    80003418:	00200793          	li	a5,2
    8000341c:	00f71663          	bne	a4,a5,80003428 <test_page_replacement+0x1ac>
    80003420:	00043783          	ld	a5,0(s0)
    80003424:	09378663          	beq	a5,s3,800034b0 <test_page_replacement+0x234>
    80003428:	00003517          	auipc	a0,0x3
    8000342c:	7f050513          	add	a0,a0,2032 # 80006c18 <digits+0x1a8>
    80003430:	d24fe0ef          	jal	80001954 <uart_puts>
    80003434:	00843783          	ld	a5,8(s0)
    80003438:	04978c63          	beq	a5,s1,80003490 <test_page_replacement+0x214>
    8000343c:	00004517          	auipc	a0,0x4
    80003440:	81c50513          	add	a0,a0,-2020 # 80006c58 <digits+0x1e8>
    80003444:	d10fe0ef          	jal	80001954 <uart_puts>
    80003448:	00004517          	auipc	a0,0x4
    8000344c:	83050513          	add	a0,a0,-2000 # 80006c78 <digits+0x208>
    80003450:	d04fe0ef          	jal	80001954 <uart_puts>
    80003454:	0b813083          	ld	ra,184(sp)
    80003458:	0b013403          	ld	s0,176(sp)
    8000345c:	0a813483          	ld	s1,168(sp)
    80003460:	0a013903          	ld	s2,160(sp)
    80003464:	09813983          	ld	s3,152(sp)
    80003468:	0c010113          	add	sp,sp,192
    8000346c:	00008067          	ret
    80003470:	00003517          	auipc	a0,0x3
    80003474:	6f850513          	add	a0,a0,1784 # 80006b68 <digits+0xf8>
    80003478:	cdcfe0ef          	jal	80001954 <uart_puts>
    8000347c:	eadff06f          	j	80003328 <test_page_replacement+0xac>
    80003480:	00f43423          	sd	a5,8(s0)
    80003484:	f81ff06f          	j	80003404 <test_page_replacement+0x188>
    80003488:	00e43023          	sd	a4,0(s0)
    8000348c:	f71ff06f          	j	800033fc <test_page_replacement+0x180>
    80003490:	00003517          	auipc	a0,0x3
    80003494:	7a850513          	add	a0,a0,1960 # 80006c38 <digits+0x1c8>
    80003498:	cbcfe0ef          	jal	80001954 <uart_puts>
    8000349c:	fadff06f          	j	80003448 <test_page_replacement+0x1cc>
    800034a0:	00003517          	auipc	a0,0x3
    800034a4:	6a850513          	add	a0,a0,1704 # 80006b48 <digits+0xd8>
    800034a8:	cacfe0ef          	jal	80001954 <uart_puts>
    800034ac:	e65ff06f          	j	80003310 <test_page_replacement+0x94>
    800034b0:	00843783          	ld	a5,8(s0)
    800034b4:	f6979ae3          	bne	a5,s1,80003428 <test_page_replacement+0x1ac>
    800034b8:	00003517          	auipc	a0,0x3
    800034bc:	74050513          	add	a0,a0,1856 # 80006bf8 <digits+0x188>
    800034c0:	c94fe0ef          	jal	80001954 <uart_puts>
    800034c4:	f71ff06f          	j	80003434 <test_page_replacement+0x1b8>

00000000800034c8 <handle_timer_interrupt>:
    800034c8:	ff010113          	add	sp,sp,-16
    800034cc:	00423597          	auipc	a1,0x423
    800034d0:	d845b583          	ld	a1,-636(a1) # 80426250 <ticks>
    800034d4:	00003517          	auipc	a0,0x3
    800034d8:	7cc50513          	add	a0,a0,1996 # 80006ca0 <digits+0x230>
    800034dc:	00113423          	sd	ra,8(sp)
    800034e0:	904fe0ef          	jal	800015e4 <printf>
    800034e4:	00813083          	ld	ra,8(sp)
    800034e8:	00100793          	li	a5,1
    800034ec:	00423717          	auipc	a4,0x423
    800034f0:	d6f72c23          	sw	a5,-648(a4) # 80426264 <need_resched>
    800034f4:	01010113          	add	sp,sp,16
    800034f8:	00008067          	ret

00000000800034fc <handle_external_interrupt>:
    800034fc:	00003517          	auipc	a0,0x3
    80003500:	7cc50513          	add	a0,a0,1996 # 80006cc8 <digits+0x258>
    80003504:	8e0fe06f          	j	800015e4 <printf>

0000000080003508 <handle_software_interrupt>:
    80003508:	00003517          	auipc	a0,0x3
    8000350c:	7f050513          	add	a0,a0,2032 # 80006cf8 <digits+0x288>
    80003510:	8d4fe06f          	j	800015e4 <printf>

0000000080003514 <get_ticks>:
    80003514:	00423517          	auipc	a0,0x423
    80003518:	d3c53503          	ld	a0,-708(a0) # 80426250 <ticks>
    8000351c:	00008067          	ret

0000000080003520 <machine_timer_handler>:
    80003520:	00423797          	auipc	a5,0x423
    80003524:	d2878793          	add	a5,a5,-728 # 80426248 <m_mode_ticks>
    80003528:	0007b703          	ld	a4,0(a5)
    8000352c:	ff010113          	add	sp,sp,-16
    80003530:	00113423          	sd	ra,8(sp)
    80003534:	00170713          	add	a4,a4,1
    80003538:	00e7b023          	sd	a4,0(a5)
    8000353c:	00423697          	auipc	a3,0x423
    80003540:	d1468693          	add	a3,a3,-748 # 80426250 <ticks>
    80003544:	0006b703          	ld	a4,0(a3)
    80003548:	00003517          	auipc	a0,0x3
    8000354c:	7e050513          	add	a0,a0,2016 # 80006d28 <digits+0x2b8>
    80003550:	00170713          	add	a4,a4,1
    80003554:	00e6b023          	sd	a4,0(a3)
    80003558:	0007b583          	ld	a1,0(a5)
    8000355c:	888fe0ef          	jal	800015e4 <printf>
    80003560:	0200c7b7          	lui	a5,0x200c
    80003564:	ff87b783          	ld	a5,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80003568:	000f4737          	lui	a4,0xf4
    8000356c:	00813083          	ld	ra,8(sp)
    80003570:	24070713          	add	a4,a4,576 # f4240 <_entry-0x7ff0bdc0>
    80003574:	00e787b3          	add	a5,a5,a4
    80003578:	02004737          	lui	a4,0x2004
    8000357c:	00f73023          	sd	a5,0(a4) # 2004000 <_entry-0x7dffc000>
    80003580:	01010113          	add	sp,sp,16
    80003584:	00008067          	ret

0000000080003588 <alloc_trapframe>:
    80003588:	00411597          	auipc	a1,0x411
    8000358c:	b2058593          	add	a1,a1,-1248 # 804140a8 <trapframe_used>
    80003590:	00058793          	mv	a5,a1
    80003594:	00000713          	li	a4,0
    80003598:	10000613          	li	a2,256
    8000359c:	00c0006f          	j	800035a8 <alloc_trapframe+0x20>
    800035a0:	0017071b          	addw	a4,a4,1
    800035a4:	02c70e63          	beq	a4,a2,800035e0 <alloc_trapframe+0x58>
    800035a8:	0007a683          	lw	a3,0(a5)
    800035ac:	00478793          	add	a5,a5,4
    800035b0:	fe0698e3          	bnez	a3,800035a0 <alloc_trapframe+0x18>
    800035b4:	00271793          	sll	a5,a4,0x2
    800035b8:	00471513          	sll	a0,a4,0x4
    800035bc:	00f585b3          	add	a1,a1,a5
    800035c0:	00e50533          	add	a0,a0,a4
    800035c4:	00100793          	li	a5,1
    800035c8:	00f5a023          	sw	a5,0(a1)
    800035cc:	00451513          	sll	a0,a0,0x4
    800035d0:	00411797          	auipc	a5,0x411
    800035d4:	f5878793          	add	a5,a5,-168 # 80414528 <trapframe_pool>
    800035d8:	00f50533          	add	a0,a0,a5
    800035dc:	00008067          	ret
    800035e0:	00000513          	li	a0,0
    800035e4:	00008067          	ret

00000000800035e8 <free_trapframe>:
    800035e8:	00411797          	auipc	a5,0x411
    800035ec:	f4078793          	add	a5,a5,-192 # 80414528 <trapframe_pool>
    800035f0:	02f56c63          	bltu	a0,a5,80003628 <free_trapframe+0x40>
    800035f4:	00422717          	auipc	a4,0x422
    800035f8:	f3470713          	add	a4,a4,-204 # 80425528 <cpus>
    800035fc:	02e57663          	bgeu	a0,a4,80003628 <free_trapframe+0x40>
    80003600:	40f507b3          	sub	a5,a0,a5
    80003604:	00004717          	auipc	a4,0x4
    80003608:	fbc73703          	ld	a4,-68(a4) # 800075c0 <digits+0xb50>
    8000360c:	4047d793          	sra	a5,a5,0x4
    80003610:	02e787b3          	mul	a5,a5,a4
    80003614:	00411717          	auipc	a4,0x411
    80003618:	a9470713          	add	a4,a4,-1388 # 804140a8 <trapframe_used>
    8000361c:	00279793          	sll	a5,a5,0x2
    80003620:	00f707b3          	add	a5,a4,a5
    80003624:	0007a023          	sw	zero,0(a5)
    80003628:	00008067          	ret

000000008000362c <intr_on>:
    8000362c:	100027f3          	csrr	a5,sstatus
    80003630:	0027e793          	or	a5,a5,2
    80003634:	10079073          	csrw	sstatus,a5
    80003638:	00008067          	ret

000000008000363c <intr_off>:
    8000363c:	100027f3          	csrr	a5,sstatus
    80003640:	ffd7f793          	and	a5,a5,-3
    80003644:	10079073          	csrw	sstatus,a5
    80003648:	00008067          	ret

000000008000364c <intr_get>:
    8000364c:	10002573          	csrr	a0,sstatus
    80003650:	00155513          	srl	a0,a0,0x1
    80003654:	00157513          	and	a0,a0,1
    80003658:	00008067          	ret

000000008000365c <set_stvec>:
    8000365c:	00a585b3          	add	a1,a1,a0
    80003660:	10559073          	csrw	stvec,a1
    80003664:	00008067          	ret

0000000080003668 <trap_init>:
    80003668:	ff010113          	add	sp,sp,-16
    8000366c:	00003517          	auipc	a0,0x3
    80003670:	6ec50513          	add	a0,a0,1772 # 80006d58 <digits+0x2e8>
    80003674:	00113423          	sd	ra,8(sp)
    80003678:	adcfe0ef          	jal	80001954 <uart_puts>
    8000367c:	00411617          	auipc	a2,0x411
    80003680:	a2c60613          	add	a2,a2,-1492 # 804140a8 <trapframe_used>
    80003684:	00060793          	mv	a5,a2
    80003688:	00411717          	auipc	a4,0x411
    8000368c:	e2070713          	add	a4,a4,-480 # 804144a8 <trap_handlers>
    80003690:	0007a023          	sw	zero,0(a5)
    80003694:	00478793          	add	a5,a5,4
    80003698:	fee79ce3          	bne	a5,a4,80003690 <trap_init+0x28>
    8000369c:	00411797          	auipc	a5,0x411
    800036a0:	e0c78793          	add	a5,a5,-500 # 804144a8 <trap_handlers>
    800036a4:	00411697          	auipc	a3,0x411
    800036a8:	e8468693          	add	a3,a3,-380 # 80414528 <trapframe_pool>
    800036ac:	00078713          	mv	a4,a5
    800036b0:	00073023          	sd	zero,0(a4)
    800036b4:	00870713          	add	a4,a4,8
    800036b8:	fee69ce3          	bne	a3,a4,800036b0 <trap_init+0x48>
    800036bc:	00000717          	auipc	a4,0x0
    800036c0:	e0c70713          	add	a4,a4,-500 # 800034c8 <handle_timer_interrupt>
    800036c4:	42e63423          	sd	a4,1064(a2)
    800036c8:	00000717          	auipc	a4,0x0
    800036cc:	e3470713          	add	a4,a4,-460 # 800034fc <handle_external_interrupt>
    800036d0:	44e63423          	sd	a4,1096(a2)
    800036d4:	00000717          	auipc	a4,0x0
    800036d8:	e3470713          	add	a4,a4,-460 # 80003508 <handle_software_interrupt>
    800036dc:	40e63423          	sd	a4,1032(a2)
    800036e0:	00000593          	li	a1,0
    800036e4:	0007b703          	ld	a4,0(a5)
    800036e8:	00878793          	add	a5,a5,8
    800036ec:	00070463          	beqz	a4,800036f4 <trap_init+0x8c>
    800036f0:	0015859b          	addw	a1,a1,1
    800036f4:	fef698e3          	bne	a3,a5,800036e4 <trap_init+0x7c>
    800036f8:	00003517          	auipc	a0,0x3
    800036fc:	68850513          	add	a0,a0,1672 # 80006d80 <digits+0x310>
    80003700:	ee5fd0ef          	jal	800015e4 <printf>
    80003704:	00813083          	ld	ra,8(sp)
    80003708:	00003517          	auipc	a0,0x3
    8000370c:	6a850513          	add	a0,a0,1704 # 80006db0 <digits+0x340>
    80003710:	01010113          	add	sp,sp,16
    80003714:	a40fe06f          	j	80001954 <uart_puts>

0000000080003718 <trap_init_hart>:
    80003718:	ff010113          	add	sp,sp,-16
    8000371c:	00003517          	auipc	a0,0x3
    80003720:	6b450513          	add	a0,a0,1716 # 80006dd0 <digits+0x360>
    80003724:	00113423          	sd	ra,8(sp)
    80003728:	a2cfe0ef          	jal	80001954 <uart_puts>
    8000372c:	00001797          	auipc	a5,0x1
    80003730:	09478793          	add	a5,a5,148 # 800047c0 <kernelvec>
    80003734:	10579073          	csrw	stvec,a5
    80003738:	104027f3          	csrr	a5,sie
    8000373c:	2227e793          	or	a5,a5,546
    80003740:	10479073          	csrw	sie,a5
    80003744:	100027f3          	csrr	a5,sstatus
    80003748:	0027e793          	or	a5,a5,2
    8000374c:	10079073          	csrw	sstatus,a5
    80003750:	00813083          	ld	ra,8(sp)
    80003754:	00003517          	auipc	a0,0x3
    80003758:	6a450513          	add	a0,a0,1700 # 80006df8 <digits+0x388>
    8000375c:	01010113          	add	sp,sp,16
    80003760:	9f4fe06f          	j	80001954 <uart_puts>

0000000080003764 <set_next_timer>:
    80003764:	0200c7b7          	lui	a5,0x200c
    80003768:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    8000376c:	000f4637          	lui	a2,0xf4
    80003770:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003774:	00c58633          	add	a2,a1,a2
    80003778:	020047b7          	lui	a5,0x2004
    8000377c:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80003780:	00003517          	auipc	a0,0x3
    80003784:	6a050513          	add	a0,a0,1696 # 80006e20 <digits+0x3b0>
    80003788:	e5dfd06f          	j	800015e4 <printf>

000000008000378c <timerinit>:
    8000378c:	ff010113          	add	sp,sp,-16
    80003790:	00003517          	auipc	a0,0x3
    80003794:	6c050513          	add	a0,a0,1728 # 80006e50 <digits+0x3e0>
    80003798:	00113423          	sd	ra,8(sp)
    8000379c:	9b8fe0ef          	jal	80001954 <uart_puts>
    800037a0:	0200c7b7          	lui	a5,0x200c
    800037a4:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    800037a8:	000f4637          	lui	a2,0xf4
    800037ac:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800037b0:	00c58633          	add	a2,a1,a2
    800037b4:	020047b7          	lui	a5,0x2004
    800037b8:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    800037bc:	00003517          	auipc	a0,0x3
    800037c0:	66450513          	add	a0,a0,1636 # 80006e20 <digits+0x3b0>
    800037c4:	e21fd0ef          	jal	800015e4 <printf>
    800037c8:	00813083          	ld	ra,8(sp)
    800037cc:	00003517          	auipc	a0,0x3
    800037d0:	6a450513          	add	a0,a0,1700 # 80006e70 <digits+0x400>
    800037d4:	01010113          	add	sp,sp,16
    800037d8:	97cfe06f          	j	80001954 <uart_puts>

00000000800037dc <devintr>:
    800037dc:	142025f3          	csrr	a1,scause
    800037e0:	1005da63          	bgez	a1,800038f4 <devintr+0x118>
    800037e4:	ff010113          	add	sp,sp,-16
    800037e8:	00113423          	sd	ra,8(sp)
    800037ec:	00813023          	sd	s0,0(sp)
    800037f0:	00f5f593          	and	a1,a1,15
    800037f4:	00500793          	li	a5,5
    800037f8:	08f58663          	beq	a1,a5,80003884 <devintr+0xa8>
    800037fc:	00900793          	li	a5,9
    80003800:	06f58263          	beq	a1,a5,80003864 <devintr+0x88>
    80003804:	00100793          	li	a5,1
    80003808:	02f58263          	beq	a1,a5,8000382c <devintr+0x50>
    8000380c:	00003517          	auipc	a0,0x3
    80003810:	6ec50513          	add	a0,a0,1772 # 80006ef8 <digits+0x488>
    80003814:	dd1fd0ef          	jal	800015e4 <printf>
    80003818:	00813083          	ld	ra,8(sp)
    8000381c:	00013403          	ld	s0,0(sp)
    80003820:	00000513          	li	a0,0
    80003824:	01010113          	add	sp,sp,16
    80003828:	00008067          	ret
    8000382c:	00003517          	auipc	a0,0x3
    80003830:	6ac50513          	add	a0,a0,1708 # 80006ed8 <digits+0x468>
    80003834:	920fe0ef          	jal	80001954 <uart_puts>
    80003838:	144027f3          	csrr	a5,sip
    8000383c:	ffd7f793          	and	a5,a5,-3
    80003840:	14479073          	csrw	sip,a5
    80003844:	00003517          	auipc	a0,0x3
    80003848:	4b450513          	add	a0,a0,1204 # 80006cf8 <digits+0x288>
    8000384c:	d99fd0ef          	jal	800015e4 <printf>
    80003850:	00100513          	li	a0,1
    80003854:	00813083          	ld	ra,8(sp)
    80003858:	00013403          	ld	s0,0(sp)
    8000385c:	01010113          	add	sp,sp,16
    80003860:	00008067          	ret
    80003864:	00003517          	auipc	a0,0x3
    80003868:	65450513          	add	a0,a0,1620 # 80006eb8 <digits+0x448>
    8000386c:	8e8fe0ef          	jal	80001954 <uart_puts>
    80003870:	00003517          	auipc	a0,0x3
    80003874:	45850513          	add	a0,a0,1112 # 80006cc8 <digits+0x258>
    80003878:	d6dfd0ef          	jal	800015e4 <printf>
    8000387c:	00100513          	li	a0,1
    80003880:	fd5ff06f          	j	80003854 <devintr+0x78>
    80003884:	00423417          	auipc	s0,0x423
    80003888:	9cc40413          	add	s0,s0,-1588 # 80426250 <ticks>
    8000388c:	00043783          	ld	a5,0(s0)
    80003890:	000f4637          	lui	a2,0xf4
    80003894:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003898:	00178793          	add	a5,a5,1
    8000389c:	00f43023          	sd	a5,0(s0)
    800038a0:	0200c7b7          	lui	a5,0x200c
    800038a4:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    800038a8:	020047b7          	lui	a5,0x2004
    800038ac:	00003517          	auipc	a0,0x3
    800038b0:	57450513          	add	a0,a0,1396 # 80006e20 <digits+0x3b0>
    800038b4:	00c58633          	add	a2,a1,a2
    800038b8:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    800038bc:	d29fd0ef          	jal	800015e4 <printf>
    800038c0:	00043583          	ld	a1,0(s0)
    800038c4:	00003517          	auipc	a0,0x3
    800038c8:	5cc50513          	add	a0,a0,1484 # 80006e90 <digits+0x420>
    800038cc:	d19fd0ef          	jal	800015e4 <printf>
    800038d0:	00043583          	ld	a1,0(s0)
    800038d4:	00003517          	auipc	a0,0x3
    800038d8:	3cc50513          	add	a0,a0,972 # 80006ca0 <digits+0x230>
    800038dc:	d09fd0ef          	jal	800015e4 <printf>
    800038e0:	00100793          	li	a5,1
    800038e4:	00423717          	auipc	a4,0x423
    800038e8:	98f72023          	sw	a5,-1664(a4) # 80426264 <need_resched>
    800038ec:	00100513          	li	a0,1
    800038f0:	f65ff06f          	j	80003854 <devintr+0x78>
    800038f4:	00000513          	li	a0,0
    800038f8:	00008067          	ret

00000000800038fc <usertrap>:
    800038fc:	142025f3          	csrr	a1,scause
    80003900:	0405c463          	bltz	a1,80003948 <usertrap+0x4c>
    80003904:	00d00793          	li	a5,13
    80003908:	02b7e063          	bltu	a5,a1,80003928 <usertrap+0x2c>
    8000390c:	00b00793          	li	a5,11
    80003910:	02b7e663          	bltu	a5,a1,8000393c <usertrap+0x40>
    80003914:	00800793          	li	a5,8
    80003918:	00f59c63          	bne	a1,a5,80003930 <usertrap+0x34>
    8000391c:	00003517          	auipc	a0,0x3
    80003920:	62450513          	add	a0,a0,1572 # 80006f40 <digits+0x4d0>
    80003924:	830fe06f          	j	80001954 <uart_puts>
    80003928:	00f00793          	li	a5,15
    8000392c:	00f58863          	beq	a1,a5,8000393c <usertrap+0x40>
    80003930:	00003517          	auipc	a0,0x3
    80003934:	64850513          	add	a0,a0,1608 # 80006f78 <digits+0x508>
    80003938:	cadfd06f          	j	800015e4 <printf>
    8000393c:	00003517          	auipc	a0,0x3
    80003940:	61c50513          	add	a0,a0,1564 # 80006f58 <digits+0x4e8>
    80003944:	810fe06f          	j	80001954 <uart_puts>
    80003948:	ff010113          	add	sp,sp,-16
    8000394c:	00113423          	sd	ra,8(sp)
    80003950:	e8dff0ef          	jal	800037dc <devintr>
    80003954:	00050863          	beqz	a0,80003964 <usertrap+0x68>
    80003958:	00813083          	ld	ra,8(sp)
    8000395c:	01010113          	add	sp,sp,16
    80003960:	00008067          	ret
    80003964:	00813083          	ld	ra,8(sp)
    80003968:	00003517          	auipc	a0,0x3
    8000396c:	5b050513          	add	a0,a0,1456 # 80006f18 <digits+0x4a8>
    80003970:	01010113          	add	sp,sp,16
    80003974:	c71fd06f          	j	800015e4 <printf>

0000000080003978 <handle_syscall>:
    80003978:	06050a63          	beqz	a0,800039ec <handle_syscall+0x74>
    8000397c:	ff010113          	add	sp,sp,-16
    80003980:	00813023          	sd	s0,0(sp)
    80003984:	08853403          	ld	s0,136(a0)
    80003988:	00003517          	auipc	a0,0x3
    8000398c:	65050513          	add	a0,a0,1616 # 80006fd8 <digits+0x568>
    80003990:	00113423          	sd	ra,8(sp)
    80003994:	00040593          	mv	a1,s0
    80003998:	c4dfd0ef          	jal	800015e4 <printf>
    8000399c:	00200793          	li	a5,2
    800039a0:	06f40a63          	beq	s0,a5,80003a14 <handle_syscall+0x9c>
    800039a4:	0287e463          	bltu	a5,s0,800039cc <handle_syscall+0x54>
    800039a8:	00003517          	auipc	a0,0x3
    800039ac:	67850513          	add	a0,a0,1656 # 80007020 <digits+0x5b0>
    800039b0:	02041663          	bnez	s0,800039dc <handle_syscall+0x64>
    800039b4:	00013403          	ld	s0,0(sp)
    800039b8:	00813083          	ld	ra,8(sp)
    800039bc:	00003517          	auipc	a0,0x3
    800039c0:	64450513          	add	a0,a0,1604 # 80007000 <digits+0x590>
    800039c4:	01010113          	add	sp,sp,16
    800039c8:	c1dfd06f          	j	800015e4 <printf>
    800039cc:	00300793          	li	a5,3
    800039d0:	00003517          	auipc	a0,0x3
    800039d4:	69050513          	add	a0,a0,1680 # 80007060 <digits+0x5f0>
    800039d8:	02f41063          	bne	s0,a5,800039f8 <handle_syscall+0x80>
    800039dc:	00013403          	ld	s0,0(sp)
    800039e0:	00813083          	ld	ra,8(sp)
    800039e4:	01010113          	add	sp,sp,16
    800039e8:	bfdfd06f          	j	800015e4 <printf>
    800039ec:	00003517          	auipc	a0,0x3
    800039f0:	5bc50513          	add	a0,a0,1468 # 80006fa8 <digits+0x538>
    800039f4:	f61fd06f          	j	80001954 <uart_puts>
    800039f8:	00040593          	mv	a1,s0
    800039fc:	00013403          	ld	s0,0(sp)
    80003a00:	00813083          	ld	ra,8(sp)
    80003a04:	00003517          	auipc	a0,0x3
    80003a08:	67c50513          	add	a0,a0,1660 # 80007080 <digits+0x610>
    80003a0c:	01010113          	add	sp,sp,16
    80003a10:	bd5fd06f          	j	800015e4 <printf>
    80003a14:	00013403          	ld	s0,0(sp)
    80003a18:	00813083          	ld	ra,8(sp)
    80003a1c:	00003517          	auipc	a0,0x3
    80003a20:	62450513          	add	a0,a0,1572 # 80007040 <digits+0x5d0>
    80003a24:	01010113          	add	sp,sp,16
    80003a28:	bbdfd06f          	j	800015e4 <printf>

0000000080003a2c <handle_exception>:
    80003a2c:	14202773          	csrr	a4,scause
    80003a30:	141025f3          	csrr	a1,sepc
    80003a34:	00f00793          	li	a5,15
    80003a38:	16e7e263          	bltu	a5,a4,80003b9c <handle_exception+0x170>
    80003a3c:	00004697          	auipc	a3,0x4
    80003a40:	91068693          	add	a3,a3,-1776 # 8000734c <digits+0x8dc>
    80003a44:	00271793          	sll	a5,a4,0x2
    80003a48:	00d787b3          	add	a5,a5,a3
    80003a4c:	0007a783          	lw	a5,0(a5)
    80003a50:	ff010113          	add	sp,sp,-16
    80003a54:	00813023          	sd	s0,0(sp)
    80003a58:	00d787b3          	add	a5,a5,a3
    80003a5c:	00113423          	sd	ra,8(sp)
    80003a60:	00050413          	mv	s0,a0
    80003a64:	00078067          	jr	a5
    80003a68:	00013403          	ld	s0,0(sp)
    80003a6c:	00813083          	ld	ra,8(sp)
    80003a70:	00058613          	mv	a2,a1
    80003a74:	00070593          	mv	a1,a4
    80003a78:	00004517          	auipc	a0,0x4
    80003a7c:	88050513          	add	a0,a0,-1920 # 800072f8 <digits+0x888>
    80003a80:	01010113          	add	sp,sp,16
    80003a84:	b61fd06f          	j	800015e4 <printf>
    80003a88:	00003517          	auipc	a0,0x3
    80003a8c:	70850513          	add	a0,a0,1800 # 80007190 <digits+0x720>
    80003a90:	b55fd0ef          	jal	800015e4 <printf>
    80003a94:	10040e63          	beqz	s0,80003bb0 <handle_exception+0x184>
    80003a98:	10043583          	ld	a1,256(s0)
    80003a9c:	00003517          	auipc	a0,0x3
    80003aa0:	75450513          	add	a0,a0,1876 # 800071f0 <digits+0x780>
    80003aa4:	00013403          	ld	s0,0(sp)
    80003aa8:	00813083          	ld	ra,8(sp)
    80003aac:	01010113          	add	sp,sp,16
    80003ab0:	b35fd06f          	j	800015e4 <printf>
    80003ab4:	00003517          	auipc	a0,0x3
    80003ab8:	76c50513          	add	a0,a0,1900 # 80007220 <digits+0x7b0>
    80003abc:	b29fd0ef          	jal	800015e4 <printf>
    80003ac0:	00003517          	auipc	a0,0x3
    80003ac4:	78050513          	add	a0,a0,1920 # 80007240 <digits+0x7d0>
    80003ac8:	08040c63          	beqz	s0,80003b60 <handle_exception+0x134>
    80003acc:	10043583          	ld	a1,256(s0)
    80003ad0:	00003517          	auipc	a0,0x3
    80003ad4:	7a050513          	add	a0,a0,1952 # 80007270 <digits+0x800>
    80003ad8:	fcdff06f          	j	80003aa4 <handle_exception+0x78>
    80003adc:	00013403          	ld	s0,0(sp)
    80003ae0:	00813083          	ld	ra,8(sp)
    80003ae4:	00003517          	auipc	a0,0x3
    80003ae8:	7b450513          	add	a0,a0,1972 # 80007298 <digits+0x828>
    80003aec:	01010113          	add	sp,sp,16
    80003af0:	af5fd06f          	j	800015e4 <printf>
    80003af4:	00013403          	ld	s0,0(sp)
    80003af8:	00813083          	ld	ra,8(sp)
    80003afc:	00003517          	auipc	a0,0x3
    80003b00:	7cc50513          	add	a0,a0,1996 # 800072c8 <digits+0x858>
    80003b04:	01010113          	add	sp,sp,16
    80003b08:	addfd06f          	j	800015e4 <printf>
    80003b0c:	00013403          	ld	s0,0(sp)
    80003b10:	00813083          	ld	ra,8(sp)
    80003b14:	01010113          	add	sp,sp,16
    80003b18:	e61ff06f          	j	80003978 <handle_syscall>
    80003b1c:	00003517          	auipc	a0,0x3
    80003b20:	58450513          	add	a0,a0,1412 # 800070a0 <digits+0x630>
    80003b24:	ac1fd0ef          	jal	800015e4 <printf>
    80003b28:	02040863          	beqz	s0,80003b58 <handle_exception+0x12c>
    80003b2c:	143025f3          	csrr	a1,stval
    80003b30:	00013403          	ld	s0,0(sp)
    80003b34:	00813083          	ld	ra,8(sp)
    80003b38:	00003517          	auipc	a0,0x3
    80003b3c:	5c850513          	add	a0,a0,1480 # 80007100 <digits+0x690>
    80003b40:	01010113          	add	sp,sp,16
    80003b44:	aa1fd06f          	j	800015e4 <printf>
    80003b48:	00003517          	auipc	a0,0x3
    80003b4c:	5e850513          	add	a0,a0,1512 # 80007130 <digits+0x6c0>
    80003b50:	a95fd0ef          	jal	800015e4 <printf>
    80003b54:	fc041ce3          	bnez	s0,80003b2c <handle_exception+0x100>
    80003b58:	00003517          	auipc	a0,0x3
    80003b5c:	57050513          	add	a0,a0,1392 # 800070c8 <digits+0x658>
    80003b60:	00013403          	ld	s0,0(sp)
    80003b64:	00813083          	ld	ra,8(sp)
    80003b68:	01010113          	add	sp,sp,16
    80003b6c:	de9fd06f          	j	80001954 <uart_puts>
    80003b70:	00003517          	auipc	a0,0x3
    80003b74:	5d850513          	add	a0,a0,1496 # 80007148 <digits+0x6d8>
    80003b78:	a6dfd0ef          	jal	800015e4 <printf>
    80003b7c:	fc040ee3          	beqz	s0,80003b58 <handle_exception+0x12c>
    80003b80:	143025f3          	csrr	a1,stval
    80003b84:	00013403          	ld	s0,0(sp)
    80003b88:	00813083          	ld	ra,8(sp)
    80003b8c:	00003517          	auipc	a0,0x3
    80003b90:	5dc50513          	add	a0,a0,1500 # 80007168 <digits+0x6f8>
    80003b94:	01010113          	add	sp,sp,16
    80003b98:	a4dfd06f          	j	800015e4 <printf>
    80003b9c:	00058613          	mv	a2,a1
    80003ba0:	00003517          	auipc	a0,0x3
    80003ba4:	75850513          	add	a0,a0,1880 # 800072f8 <digits+0x888>
    80003ba8:	00070593          	mv	a1,a4
    80003bac:	a39fd06f          	j	800015e4 <printf>
    80003bb0:	00003517          	auipc	a0,0x3
    80003bb4:	60850513          	add	a0,a0,1544 # 800071b8 <digits+0x748>
    80003bb8:	fa9ff06f          	j	80003b60 <handle_exception+0x134>

0000000080003bbc <kerneltrap>:
    80003bbc:	ff010113          	add	sp,sp,-16
    80003bc0:	00113423          	sd	ra,8(sp)
    80003bc4:	00813023          	sd	s0,0(sp)
    80003bc8:	14202473          	csrr	s0,scause
    80003bcc:	14102573          	csrr	a0,sepc
    80003bd0:	00044a63          	bltz	s0,80003be4 <kerneltrap+0x28>
    80003bd4:	00013403          	ld	s0,0(sp)
    80003bd8:	00813083          	ld	ra,8(sp)
    80003bdc:	01010113          	add	sp,sp,16
    80003be0:	e4dff06f          	j	80003a2c <handle_exception>
    80003be4:	bf9ff0ef          	jal	800037dc <devintr>
    80003be8:	00050a63          	beqz	a0,80003bfc <kerneltrap+0x40>
    80003bec:	00813083          	ld	ra,8(sp)
    80003bf0:	00013403          	ld	s0,0(sp)
    80003bf4:	01010113          	add	sp,sp,16
    80003bf8:	00008067          	ret
    80003bfc:	00f47593          	and	a1,s0,15
    80003c00:	00013403          	ld	s0,0(sp)
    80003c04:	00813083          	ld	ra,8(sp)
    80003c08:	00003517          	auipc	a0,0x3
    80003c0c:	71850513          	add	a0,a0,1816 # 80007320 <digits+0x8b0>
    80003c10:	01010113          	add	sp,sp,16
    80003c14:	9d1fd06f          	j	800015e4 <printf>

0000000080003c18 <handle_trap_page_fault>:
    80003c18:	00058793          	mv	a5,a1
    80003c1c:	02050263          	beqz	a0,80003c40 <handle_trap_page_fault+0x28>
    80003c20:	143025f3          	csrr	a1,stval
    80003c24:	00078863          	beqz	a5,80003c34 <handle_trap_page_fault+0x1c>
    80003c28:	00003517          	auipc	a0,0x3
    80003c2c:	54050513          	add	a0,a0,1344 # 80007168 <digits+0x6f8>
    80003c30:	9b5fd06f          	j	800015e4 <printf>
    80003c34:	00003517          	auipc	a0,0x3
    80003c38:	4cc50513          	add	a0,a0,1228 # 80007100 <digits+0x690>
    80003c3c:	9a9fd06f          	j	800015e4 <printf>
    80003c40:	00003517          	auipc	a0,0x3
    80003c44:	48850513          	add	a0,a0,1160 # 800070c8 <digits+0x658>
    80003c48:	d0dfd06f          	j	80001954 <uart_puts>

0000000080003c4c <handle_illegal_instruction>:
    80003c4c:	00050a63          	beqz	a0,80003c60 <handle_illegal_instruction+0x14>
    80003c50:	10053583          	ld	a1,256(a0)
    80003c54:	00003517          	auipc	a0,0x3
    80003c58:	59c50513          	add	a0,a0,1436 # 800071f0 <digits+0x780>
    80003c5c:	989fd06f          	j	800015e4 <printf>
    80003c60:	00003517          	auipc	a0,0x3
    80003c64:	55850513          	add	a0,a0,1368 # 800071b8 <digits+0x748>
    80003c68:	cedfd06f          	j	80001954 <uart_puts>

0000000080003c6c <handle_breakpoint>:
    80003c6c:	00050a63          	beqz	a0,80003c80 <handle_breakpoint+0x14>
    80003c70:	10053583          	ld	a1,256(a0)
    80003c74:	00003517          	auipc	a0,0x3
    80003c78:	5fc50513          	add	a0,a0,1532 # 80007270 <digits+0x800>
    80003c7c:	969fd06f          	j	800015e4 <printf>
    80003c80:	00003517          	auipc	a0,0x3
    80003c84:	5c050513          	add	a0,a0,1472 # 80007240 <digits+0x7d0>
    80003c88:	ccdfd06f          	j	80001954 <uart_puts>

0000000080003c8c <free_proc.part.0>:
    80003c8c:	fe010113          	add	sp,sp,-32
    80003c90:	00813823          	sd	s0,16(sp)
    80003c94:	00913423          	sd	s1,8(sp)
    80003c98:	00113c23          	sd	ra,24(sp)
    80003c9c:	00050493          	mv	s1,a0
    80003ca0:	00422417          	auipc	s0,0x422
    80003ca4:	5c040413          	add	s0,s0,1472 # 80426260 <proc_lock>
    80003ca8:	00100713          	li	a4,1
    80003cac:	00070793          	mv	a5,a4
    80003cb0:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80003cb4:	0007879b          	sext.w	a5,a5
    80003cb8:	fe079ae3          	bnez	a5,80003cac <free_proc.part.0+0x20>
    80003cbc:	0304b503          	ld	a0,48(s1)
    80003cc0:	00050663          	beqz	a0,80003ccc <free_proc.part.0+0x40>
    80003cc4:	925ff0ef          	jal	800035e8 <free_trapframe>
    80003cc8:	0204b823          	sd	zero,48(s1)
    80003ccc:	0284b503          	ld	a0,40(s1)
    80003cd0:	00050663          	beqz	a0,80003cdc <free_proc.part.0+0x50>
    80003cd4:	d49fd0ef          	jal	80001a1c <free_page>
    80003cd8:	0204b423          	sd	zero,40(s1)
    80003cdc:	0184b503          	ld	a0,24(s1)
    80003ce0:	00050663          	beqz	a0,80003cec <free_proc.part.0+0x60>
    80003ce4:	9e0fe0ef          	jal	80001ec4 <destroy_pagetable>
    80003ce8:	0004bc23          	sd	zero,24(s1)
    80003cec:	0004b023          	sd	zero,0(s1)
    80003cf0:	0f50000f          	fence	iorw,ow
    80003cf4:	0804202f          	amoswap.w	zero,zero,(s0)
    80003cf8:	01813083          	ld	ra,24(sp)
    80003cfc:	01013403          	ld	s0,16(sp)
    80003d00:	00813483          	ld	s1,8(sp)
    80003d04:	02010113          	add	sp,sp,32
    80003d08:	00008067          	ret

0000000080003d0c <proc_init>:
    80003d0c:	ff010113          	add	sp,sp,-16
    80003d10:	00003517          	auipc	a0,0x3
    80003d14:	68050513          	add	a0,a0,1664 # 80007390 <digits+0x920>
    80003d18:	00113423          	sd	ra,8(sp)
    80003d1c:	c39fd0ef          	jal	80001954 <uart_puts>
    80003d20:	00422797          	auipc	a5,0x422
    80003d24:	88878793          	add	a5,a5,-1912 # 804255a8 <proc>
    80003d28:	00422697          	auipc	a3,0x422
    80003d2c:	50068693          	add	a3,a3,1280 # 80426228 <mem_end>
    80003d30:	00078713          	mv	a4,a5
    80003d34:	00073023          	sd	zero,0(a4)
    80003d38:	00870713          	add	a4,a4,8
    80003d3c:	fed71ce3          	bne	a4,a3,80003d34 <proc_init+0x28>
    80003d40:	00100713          	li	a4,1
    80003d44:	00004617          	auipc	a2,0x4
    80003d48:	2ae62e23          	sw	a4,700(a2) # 80008000 <nextpid>
    80003d4c:	00422717          	auipc	a4,0x422
    80003d50:	50073e23          	sd	zero,1308(a4) # 80426268 <current_proc>
    80003d54:	0007a023          	sw	zero,0(a5)
    80003d58:	0007a223          	sw	zero,4(a5)
    80003d5c:	0007a423          	sw	zero,8(a5)
    80003d60:	0c878793          	add	a5,a5,200
    80003d64:	fed798e3          	bne	a5,a3,80003d54 <proc_init+0x48>
    80003d68:	00813083          	ld	ra,8(sp)
    80003d6c:	00003517          	auipc	a0,0x3
    80003d70:	64c50513          	add	a0,a0,1612 # 800073b8 <digits+0x948>
    80003d74:	01010113          	add	sp,sp,16
    80003d78:	bddfd06f          	j	80001954 <uart_puts>

0000000080003d7c <alloc_proc>:
    80003d7c:	fd010113          	add	sp,sp,-48
    80003d80:	00913c23          	sd	s1,24(sp)
    80003d84:	02113423          	sd	ra,40(sp)
    80003d88:	02813023          	sd	s0,32(sp)
    80003d8c:	01213823          	sd	s2,16(sp)
    80003d90:	01313423          	sd	s3,8(sp)
    80003d94:	01413023          	sd	s4,0(sp)
    80003d98:	00422497          	auipc	s1,0x422
    80003d9c:	4c848493          	add	s1,s1,1224 # 80426260 <proc_lock>
    80003da0:	00100713          	li	a4,1
    80003da4:	00070793          	mv	a5,a4
    80003da8:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003dac:	0007879b          	sext.w	a5,a5
    80003db0:	fe079ae3          	bnez	a5,80003da4 <alloc_proc+0x28>
    80003db4:	00421997          	auipc	s3,0x421
    80003db8:	7f498993          	add	s3,s3,2036 # 804255a8 <proc>
    80003dbc:	00098793          	mv	a5,s3
    80003dc0:	00000413          	li	s0,0
    80003dc4:	01000693          	li	a3,16
    80003dc8:	0007a703          	lw	a4,0(a5)
    80003dcc:	0c878793          	add	a5,a5,200
    80003dd0:	02070463          	beqz	a4,80003df8 <alloc_proc+0x7c>
    80003dd4:	0014041b          	addw	s0,s0,1
    80003dd8:	fed418e3          	bne	s0,a3,80003dc8 <alloc_proc+0x4c>
    80003ddc:	0f50000f          	fence	iorw,ow
    80003de0:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003de4:	00003517          	auipc	a0,0x3
    80003de8:	67450513          	add	a0,a0,1652 # 80007458 <digits+0x9e8>
    80003dec:	b69fd0ef          	jal	80001954 <uart_puts>
    80003df0:	00000a13          	li	s4,0
    80003df4:	09c0006f          	j	80003e90 <alloc_proc+0x114>
    80003df8:	0c800913          	li	s2,200
    80003dfc:	03240933          	mul	s2,s0,s2
    80003e00:	00004717          	auipc	a4,0x4
    80003e04:	20070713          	add	a4,a4,512 # 80008000 <nextpid>
    80003e08:	00072783          	lw	a5,0(a4)
    80003e0c:	0017869b          	addw	a3,a5,1
    80003e10:	00d72023          	sw	a3,0(a4)
    80003e14:	00100713          	li	a4,1
    80003e18:	01298a33          	add	s4,s3,s2
    80003e1c:	000a3423          	sd	zero,8(s4) # fffffffffffff008 <bss_end+0xffffffff7fbd8d98>
    80003e20:	00ea2023          	sw	a4,0(s4)
    80003e24:	00fa2223          	sw	a5,4(s4)
    80003e28:	000a2823          	sw	zero,16(s4)
    80003e2c:	f5cff0ef          	jal	80003588 <alloc_trapframe>
    80003e30:	02aa3823          	sd	a0,48(s4)
    80003e34:	08050063          	beqz	a0,80003eb4 <alloc_proc+0x138>
    80003e38:	bc9fd0ef          	jal	80001a00 <alloc_page>
    80003e3c:	04090793          	add	a5,s2,64
    80003e40:	00f987b3          	add	a5,s3,a5
    80003e44:	02aa3423          	sd	a0,40(s4)
    80003e48:	07078713          	add	a4,a5,112
    80003e4c:	08050263          	beqz	a0,80003ed0 <alloc_proc+0x154>
    80003e50:	0007b023          	sd	zero,0(a5)
    80003e54:	00878793          	add	a5,a5,8
    80003e58:	fee79ce3          	bne	a5,a4,80003e50 <alloc_proc+0xd4>
    80003e5c:	0c800793          	li	a5,200
    80003e60:	02f40433          	mul	s0,s0,a5
    80003e64:	00001737          	lui	a4,0x1
    80003e68:	00003517          	auipc	a0,0x3
    80003e6c:	5c850513          	add	a0,a0,1480 # 80007430 <digits+0x9c0>
    80003e70:	008989b3          	add	s3,s3,s0
    80003e74:	0289b783          	ld	a5,40(s3)
    80003e78:	0049a583          	lw	a1,4(s3)
    80003e7c:	00e787b3          	add	a5,a5,a4
    80003e80:	04f9b423          	sd	a5,72(s3)
    80003e84:	f60fd0ef          	jal	800015e4 <printf>
    80003e88:	0f50000f          	fence	iorw,ow
    80003e8c:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003e90:	02813083          	ld	ra,40(sp)
    80003e94:	02013403          	ld	s0,32(sp)
    80003e98:	01813483          	ld	s1,24(sp)
    80003e9c:	01013903          	ld	s2,16(sp)
    80003ea0:	00813983          	ld	s3,8(sp)
    80003ea4:	000a0513          	mv	a0,s4
    80003ea8:	00013a03          	ld	s4,0(sp)
    80003eac:	03010113          	add	sp,sp,48
    80003eb0:	00008067          	ret
    80003eb4:	00003517          	auipc	a0,0x3
    80003eb8:	52c50513          	add	a0,a0,1324 # 800073e0 <digits+0x970>
    80003ebc:	a99fd0ef          	jal	80001954 <uart_puts>
    80003ec0:	0f50000f          	fence	iorw,ow
    80003ec4:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003ec8:	00000a13          	li	s4,0
    80003ecc:	fc5ff06f          	j	80003e90 <alloc_proc+0x114>
    80003ed0:	00003517          	auipc	a0,0x3
    80003ed4:	53850513          	add	a0,a0,1336 # 80007408 <digits+0x998>
    80003ed8:	a7dfd0ef          	jal	80001954 <uart_puts>
    80003edc:	030a3503          	ld	a0,48(s4)
    80003ee0:	f08ff0ef          	jal	800035e8 <free_trapframe>
    80003ee4:	0f50000f          	fence	iorw,ow
    80003ee8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003eec:	00000a13          	li	s4,0
    80003ef0:	fa1ff06f          	j	80003e90 <alloc_proc+0x114>

0000000080003ef4 <free_proc>:
    80003ef4:	00050463          	beqz	a0,80003efc <free_proc+0x8>
    80003ef8:	d95ff06f          	j	80003c8c <free_proc.part.0>
    80003efc:	00008067          	ret

0000000080003f00 <find_proc>:
    80003f00:	00421597          	auipc	a1,0x421
    80003f04:	6a858593          	add	a1,a1,1704 # 804255a8 <proc>
    80003f08:	00058793          	mv	a5,a1
    80003f0c:	00000713          	li	a4,0
    80003f10:	01000613          	li	a2,16
    80003f14:	0100006f          	j	80003f24 <find_proc+0x24>
    80003f18:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80003f1c:	0c878793          	add	a5,a5,200
    80003f20:	02c70263          	beq	a4,a2,80003f44 <find_proc+0x44>
    80003f24:	0047a683          	lw	a3,4(a5)
    80003f28:	fea698e3          	bne	a3,a0,80003f18 <find_proc+0x18>
    80003f2c:	0007a683          	lw	a3,0(a5)
    80003f30:	fe0684e3          	beqz	a3,80003f18 <find_proc+0x18>
    80003f34:	0c800793          	li	a5,200
    80003f38:	02f70733          	mul	a4,a4,a5
    80003f3c:	00e58533          	add	a0,a1,a4
    80003f40:	00008067          	ret
    80003f44:	00000513          	li	a0,0
    80003f48:	00008067          	ret

0000000080003f4c <proc_set_kernel_stack>:
    80003f4c:	00050a63          	beqz	a0,80003f60 <proc_set_kernel_stack+0x14>
    80003f50:	000017b7          	lui	a5,0x1
    80003f54:	00f587b3          	add	a5,a1,a5
    80003f58:	02b53423          	sd	a1,40(a0)
    80003f5c:	04f53423          	sd	a5,72(a0)
    80003f60:	00008067          	ret

0000000080003f64 <proc_mark_runnable>:
    80003f64:	02050263          	beqz	a0,80003f88 <proc_mark_runnable+0x24>
    80003f68:	00052783          	lw	a5,0(a0)
    80003f6c:	00100713          	li	a4,1
    80003f70:	ffe7869b          	addw	a3,a5,-2 # ffe <_entry-0x7ffff002>
    80003f74:	00d77a63          	bgeu	a4,a3,80003f88 <proc_mark_runnable+0x24>
    80003f78:	00500713          	li	a4,5
    80003f7c:	00e78663          	beq	a5,a4,80003f88 <proc_mark_runnable+0x24>
    80003f80:	00200793          	li	a5,2
    80003f84:	00f52023          	sw	a5,0(a0)
    80003f88:	00008067          	ret

0000000080003f8c <proc_mark_sleeping>:
    80003f8c:	00050863          	beqz	a0,80003f9c <proc_mark_sleeping+0x10>
    80003f90:	00052703          	lw	a4,0(a0)
    80003f94:	00300793          	li	a5,3
    80003f98:	00f70463          	beq	a4,a5,80003fa0 <proc_mark_sleeping+0x14>
    80003f9c:	00008067          	ret
    80003fa0:	00400793          	li	a5,4
    80003fa4:	00f52023          	sw	a5,0(a0)
    80003fa8:	0ab53c23          	sd	a1,184(a0)
    80003fac:	00008067          	ret

0000000080003fb0 <proc_mark_zombie>:
    80003fb0:	00050c63          	beqz	a0,80003fc8 <proc_mark_zombie+0x18>
    80003fb4:	00052703          	lw	a4,0(a0)
    80003fb8:	00500793          	li	a5,5
    80003fbc:	00f70663          	beq	a4,a5,80003fc8 <proc_mark_zombie+0x18>
    80003fc0:	00f52023          	sw	a5,0(a0)
    80003fc4:	00b52623          	sw	a1,12(a0)
    80003fc8:	00008067          	ret

0000000080003fcc <get_pid>:
    80003fcc:	00422797          	auipc	a5,0x422
    80003fd0:	29c7b783          	ld	a5,668(a5) # 80426268 <current_proc>
    80003fd4:	00078663          	beqz	a5,80003fe0 <get_pid+0x14>
    80003fd8:	0047a503          	lw	a0,4(a5)
    80003fdc:	00008067          	ret
    80003fe0:	fff00513          	li	a0,-1
    80003fe4:	00008067          	ret

0000000080003fe8 <get_current_proc>:
    80003fe8:	00422517          	auipc	a0,0x422
    80003fec:	28053503          	ld	a0,640(a0) # 80426268 <current_proc>
    80003ff0:	00008067          	ret

0000000080003ff4 <set_current_proc>:
    80003ff4:	00422797          	auipc	a5,0x422
    80003ff8:	26a7ba23          	sd	a0,628(a5) # 80426268 <current_proc>
    80003ffc:	00008067          	ret

0000000080004000 <scheduler>:
    80004000:	fa010113          	add	sp,sp,-96
    80004004:	04813823          	sd	s0,80(sp)
    80004008:	00422417          	auipc	s0,0x422
    8000400c:	25440413          	add	s0,s0,596 # 8042625c <scheduler_initialized>
    80004010:	00042783          	lw	a5,0(s0)
    80004014:	04113c23          	sd	ra,88(sp)
    80004018:	04913423          	sd	s1,72(sp)
    8000401c:	05213023          	sd	s2,64(sp)
    80004020:	03313c23          	sd	s3,56(sp)
    80004024:	03413823          	sd	s4,48(sp)
    80004028:	03513423          	sd	s5,40(sp)
    8000402c:	03613023          	sd	s6,32(sp)
    80004030:	01713c23          	sd	s7,24(sp)
    80004034:	01813823          	sd	s8,16(sp)
    80004038:	01913423          	sd	s9,8(sp)
    8000403c:	01a13023          	sd	s10,0(sp)
    80004040:	0e078463          	beqz	a5,80004128 <scheduler+0x128>
    80004044:	00422497          	auipc	s1,0x422
    80004048:	21448493          	add	s1,s1,532 # 80426258 <last_index.0>
    8000404c:	00421c17          	auipc	s8,0x421
    80004050:	55cc0c13          	add	s8,s8,1372 # 804255a8 <proc>
    80004054:	00421b17          	auipc	s6,0x421
    80004058:	4d4b0b13          	add	s6,s6,1236 # 80425528 <cpus>
    8000405c:	00422a97          	auipc	s5,0x422
    80004060:	20ca8a93          	add	s5,s5,524 # 80426268 <current_proc>
    80004064:	0c800d13          	li	s10,200
    80004068:	00200c93          	li	s9,2
    8000406c:	00300a13          	li	s4,3
    80004070:	00003997          	auipc	s3,0x3
    80004074:	42898993          	add	s3,s3,1064 # 80007498 <digits+0xa28>
    80004078:	00421917          	auipc	s2,0x421
    8000407c:	4c090913          	add	s2,s2,1216 # 80425538 <scheduler_context>
    80004080:	dacff0ef          	jal	8000362c <intr_on>
    80004084:	0004a783          	lw	a5,0(s1)
    80004088:	0107861b          	addw	a2,a5,16
    8000408c:	0080006f          	j	80004094 <scheduler+0x94>
    80004090:	fef608e3          	beq	a2,a5,80004080 <scheduler+0x80>
    80004094:	41f7d71b          	sraw	a4,a5,0x1f
    80004098:	01c7571b          	srlw	a4,a4,0x1c
    8000409c:	00f7043b          	addw	s0,a4,a5
    800040a0:	00f47413          	and	s0,s0,15
    800040a4:	40e40bbb          	subw	s7,s0,a4
    800040a8:	000b8413          	mv	s0,s7
    800040ac:	03ab8bb3          	mul	s7,s7,s10
    800040b0:	0017879b          	addw	a5,a5,1
    800040b4:	017c0733          	add	a4,s8,s7
    800040b8:	00072683          	lw	a3,0(a4)
    800040bc:	fd969ae3          	bne	a3,s9,80004090 <scheduler+0x90>
    800040c0:	00472583          	lw	a1,4(a4)
    800040c4:	00098513          	mv	a0,s3
    800040c8:	01472023          	sw	s4,0(a4)
    800040cc:	00eb3023          	sd	a4,0(s6)
    800040d0:	00eab023          	sd	a4,0(s5)
    800040d4:	00422797          	auipc	a5,0x422
    800040d8:	1807a823          	sw	zero,400(a5) # 80426264 <need_resched>
    800040dc:	d08fd0ef          	jal	800015e4 <printf>
    800040e0:	d5cff0ef          	jal	8000363c <intr_off>
    800040e4:	040b8593          	add	a1,s7,64 # 1040 <_entry-0x7fffefc0>
    800040e8:	00bc05b3          	add	a1,s8,a1
    800040ec:	00090513          	mv	a0,s2
    800040f0:	131000ef          	jal	80004a20 <switch_context>
    800040f4:	0014041b          	addw	s0,s0,1
    800040f8:	d34ff0ef          	jal	8000362c <intr_on>
    800040fc:	41f4571b          	sraw	a4,s0,0x1f
    80004100:	01c7571b          	srlw	a4,a4,0x1c
    80004104:	00e4043b          	addw	s0,s0,a4
    80004108:	00f47793          	and	a5,s0,15
    8000410c:	40e787bb          	subw	a5,a5,a4
    80004110:	00f4a023          	sw	a5,0(s1)
    80004114:	00421717          	auipc	a4,0x421
    80004118:	40073a23          	sd	zero,1044(a4) # 80425528 <cpus>
    8000411c:	00422717          	auipc	a4,0x422
    80004120:	14073623          	sd	zero,332(a4) # 80426268 <current_proc>
    80004124:	f5dff06f          	j	80004080 <scheduler+0x80>
    80004128:	00003517          	auipc	a0,0x3
    8000412c:	35050513          	add	a0,a0,848 # 80007478 <digits+0xa08>
    80004130:	825fd0ef          	jal	80001954 <uart_puts>
    80004134:	00100793          	li	a5,1
    80004138:	00f42023          	sw	a5,0(s0)
    8000413c:	f09ff06f          	j	80004044 <scheduler+0x44>

0000000080004140 <yield>:
    80004140:	fe010113          	add	sp,sp,-32
    80004144:	00813823          	sd	s0,16(sp)
    80004148:	00113c23          	sd	ra,24(sp)
    8000414c:	00913423          	sd	s1,8(sp)
    80004150:	00422417          	auipc	s0,0x422
    80004154:	11843403          	ld	s0,280(s0) # 80426268 <current_proc>
    80004158:	06040263          	beqz	s0,800041bc <yield+0x7c>
    8000415c:	cf0ff0ef          	jal	8000364c <intr_get>
    80004160:	00050493          	mv	s1,a0
    80004164:	cd8ff0ef          	jal	8000363c <intr_off>
    80004168:	00422717          	auipc	a4,0x422
    8000416c:	0f870713          	add	a4,a4,248 # 80426260 <proc_lock>
    80004170:	00100693          	li	a3,1
    80004174:	00068793          	mv	a5,a3
    80004178:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    8000417c:	0007879b          	sext.w	a5,a5
    80004180:	fe079ae3          	bnez	a5,80004174 <yield+0x34>
    80004184:	00042683          	lw	a3,0(s0)
    80004188:	00300793          	li	a5,3
    8000418c:	04f68263          	beq	a3,a5,800041d0 <yield+0x90>
    80004190:	0f50000f          	fence	iorw,ow
    80004194:	0807202f          	amoswap.w	zero,zero,(a4)
    80004198:	00442583          	lw	a1,4(s0)
    8000419c:	00003517          	auipc	a0,0x3
    800041a0:	32c50513          	add	a0,a0,812 # 800074c8 <digits+0xa58>
    800041a4:	c40fd0ef          	jal	800015e4 <printf>
    800041a8:	00421597          	auipc	a1,0x421
    800041ac:	39058593          	add	a1,a1,912 # 80425538 <scheduler_context>
    800041b0:	04040513          	add	a0,s0,64
    800041b4:	06d000ef          	jal	80004a20 <switch_context>
    800041b8:	02049263          	bnez	s1,800041dc <yield+0x9c>
    800041bc:	01813083          	ld	ra,24(sp)
    800041c0:	01013403          	ld	s0,16(sp)
    800041c4:	00813483          	ld	s1,8(sp)
    800041c8:	02010113          	add	sp,sp,32
    800041cc:	00008067          	ret
    800041d0:	00200793          	li	a5,2
    800041d4:	00f42023          	sw	a5,0(s0)
    800041d8:	fb9ff06f          	j	80004190 <yield+0x50>
    800041dc:	01013403          	ld	s0,16(sp)
    800041e0:	01813083          	ld	ra,24(sp)
    800041e4:	00813483          	ld	s1,8(sp)
    800041e8:	02010113          	add	sp,sp,32
    800041ec:	c40ff06f          	j	8000362c <intr_on>

00000000800041f0 <fork>:
    800041f0:	fe010113          	add	sp,sp,-32
    800041f4:	00913423          	sd	s1,8(sp)
    800041f8:	00113c23          	sd	ra,24(sp)
    800041fc:	00813823          	sd	s0,16(sp)
    80004200:	00422497          	auipc	s1,0x422
    80004204:	0684b483          	ld	s1,104(s1) # 80426268 <current_proc>
    80004208:	08048a63          	beqz	s1,8000429c <fork+0xac>
    8000420c:	b71ff0ef          	jal	80003d7c <alloc_proc>
    80004210:	00050413          	mv	s0,a0
    80004214:	08050e63          	beqz	a0,800042b0 <fork+0xc0>
    80004218:	0044a703          	lw	a4,4(s1)
    8000421c:	0184b783          	ld	a5,24(s1)
    80004220:	0a953823          	sd	s1,176(a0)
    80004224:	00e52423          	sw	a4,8(a0)
    80004228:	00078863          	beqz	a5,80004238 <fork+0x48>
    8000422c:	9a1fd0ef          	jal	80001bcc <create_pagetable>
    80004230:	00a43c23          	sd	a0,24(s0)
    80004234:	08050863          	beqz	a0,800042c4 <fork+0xd4>
    80004238:	0304b783          	ld	a5,48(s1)
    8000423c:	02078663          	beqz	a5,80004268 <fork+0x78>
    80004240:	03043703          	ld	a4,48(s0)
    80004244:	02070263          	beqz	a4,80004268 <fork+0x78>
    80004248:	11078613          	add	a2,a5,272
    8000424c:	0007c683          	lbu	a3,0(a5)
    80004250:	00178793          	add	a5,a5,1
    80004254:	00170713          	add	a4,a4,1
    80004258:	fed70fa3          	sb	a3,-1(a4)
    8000425c:	fec798e3          	bne	a5,a2,8000424c <fork+0x5c>
    80004260:	03043783          	ld	a5,48(s0)
    80004264:	0407b823          	sd	zero,80(a5)
    80004268:	0044a603          	lw	a2,4(s1)
    8000426c:	00442583          	lw	a1,4(s0)
    80004270:	00200793          	li	a5,2
    80004274:	00f42023          	sw	a5,0(s0)
    80004278:	00003517          	auipc	a0,0x3
    8000427c:	2c850513          	add	a0,a0,712 # 80007540 <digits+0xad0>
    80004280:	b64fd0ef          	jal	800015e4 <printf>
    80004284:	00442503          	lw	a0,4(s0)
    80004288:	01813083          	ld	ra,24(sp)
    8000428c:	01013403          	ld	s0,16(sp)
    80004290:	00813483          	ld	s1,8(sp)
    80004294:	02010113          	add	sp,sp,32
    80004298:	00008067          	ret
    8000429c:	00003517          	auipc	a0,0x3
    800042a0:	24c50513          	add	a0,a0,588 # 800074e8 <digits+0xa78>
    800042a4:	eb0fd0ef          	jal	80001954 <uart_puts>
    800042a8:	fff00513          	li	a0,-1
    800042ac:	fddff06f          	j	80004288 <fork+0x98>
    800042b0:	00003517          	auipc	a0,0x3
    800042b4:	26050513          	add	a0,a0,608 # 80007510 <digits+0xaa0>
    800042b8:	e9cfd0ef          	jal	80001954 <uart_puts>
    800042bc:	fff00513          	li	a0,-1
    800042c0:	fc9ff06f          	j	80004288 <fork+0x98>
    800042c4:	00040513          	mv	a0,s0
    800042c8:	9c5ff0ef          	jal	80003c8c <free_proc.part.0>
    800042cc:	fff00513          	li	a0,-1
    800042d0:	fb9ff06f          	j	80004288 <fork+0x98>

00000000800042d4 <exit>:
    800042d4:	00422697          	auipc	a3,0x422
    800042d8:	f946b683          	ld	a3,-108(a3) # 80426268 <current_proc>
    800042dc:	08068e63          	beqz	a3,80004378 <exit+0xa4>
    800042e0:	ff010113          	add	sp,sp,-16
    800042e4:	00813023          	sd	s0,0(sp)
    800042e8:	00113423          	sd	ra,8(sp)
    800042ec:	00050613          	mv	a2,a0
    800042f0:	00422417          	auipc	s0,0x422
    800042f4:	f7040413          	add	s0,s0,-144 # 80426260 <proc_lock>
    800042f8:	00100713          	li	a4,1
    800042fc:	00070793          	mv	a5,a4
    80004300:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80004304:	0007879b          	sext.w	a5,a5
    80004308:	fe079ae3          	bnez	a5,800042fc <exit+0x28>
    8000430c:	00500793          	li	a5,5
    80004310:	00f6a023          	sw	a5,0(a3)
    80004314:	00c6a623          	sw	a2,12(a3)
    80004318:	00421797          	auipc	a5,0x421
    8000431c:	34078793          	add	a5,a5,832 # 80425658 <proc+0xb0>
    80004320:	00422597          	auipc	a1,0x422
    80004324:	fb858593          	add	a1,a1,-72 # 804262d8 <bss_end+0x68>
    80004328:	00100513          	li	a0,1
    8000432c:	00c0006f          	j	80004338 <exit+0x64>
    80004330:	0c878793          	add	a5,a5,200
    80004334:	00b78e63          	beq	a5,a1,80004350 <exit+0x7c>
    80004338:	0007b703          	ld	a4,0(a5)
    8000433c:	fed71ae3          	bne	a4,a3,80004330 <exit+0x5c>
    80004340:	0007b023          	sd	zero,0(a5)
    80004344:	f4a7ac23          	sw	a0,-168(a5)
    80004348:	0c878793          	add	a5,a5,200
    8000434c:	feb796e3          	bne	a5,a1,80004338 <exit+0x64>
    80004350:	0046a583          	lw	a1,4(a3)
    80004354:	00003517          	auipc	a0,0x3
    80004358:	21c50513          	add	a0,a0,540 # 80007570 <digits+0xb00>
    8000435c:	a88fd0ef          	jal	800015e4 <printf>
    80004360:	0f50000f          	fence	iorw,ow
    80004364:	0804202f          	amoswap.w	zero,zero,(s0)
    80004368:	00013403          	ld	s0,0(sp)
    8000436c:	00813083          	ld	ra,8(sp)
    80004370:	01010113          	add	sp,sp,16
    80004374:	dcdff06f          	j	80004140 <yield>
    80004378:	00008067          	ret

000000008000437c <wait>:
    8000437c:	fb010113          	add	sp,sp,-80
    80004380:	01813023          	sd	s8,0(sp)
    80004384:	00422c17          	auipc	s8,0x422
    80004388:	ee4c0c13          	add	s8,s8,-284 # 80426268 <current_proc>
    8000438c:	02913c23          	sd	s1,56(sp)
    80004390:	000c3483          	ld	s1,0(s8)
    80004394:	04113423          	sd	ra,72(sp)
    80004398:	04813023          	sd	s0,64(sp)
    8000439c:	03213823          	sd	s2,48(sp)
    800043a0:	03313423          	sd	s3,40(sp)
    800043a4:	03413023          	sd	s4,32(sp)
    800043a8:	01513c23          	sd	s5,24(sp)
    800043ac:	01613823          	sd	s6,16(sp)
    800043b0:	01713423          	sd	s7,8(sp)
    800043b4:	10048063          	beqz	s1,800044b4 <wait+0x138>
    800043b8:	00050913          	mv	s2,a0
    800043bc:	00422417          	auipc	s0,0x422
    800043c0:	ea440413          	add	s0,s0,-348 # 80426260 <proc_lock>
    800043c4:	00100a13          	li	s4,1
    800043c8:	00500b93          	li	s7,5
    800043cc:	01000a93          	li	s5,16
    800043d0:	00422b17          	auipc	s6,0x422
    800043d4:	e58b0b13          	add	s6,s6,-424 # 80426228 <mem_end>
    800043d8:	00400993          	li	s3,4
    800043dc:	000a0793          	mv	a5,s4
    800043e0:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800043e4:	0007879b          	sext.w	a5,a5
    800043e8:	fe079ae3          	bnez	a5,800043dc <wait+0x60>
    800043ec:	00421797          	auipc	a5,0x421
    800043f0:	1bc78793          	add	a5,a5,444 # 804255a8 <proc>
    800043f4:	00078593          	mv	a1,a5
    800043f8:	00078713          	mv	a4,a5
    800043fc:	00000693          	li	a3,0
    80004400:	0100006f          	j	80004410 <wait+0x94>
    80004404:	0016869b          	addw	a3,a3,1
    80004408:	0c870713          	add	a4,a4,200
    8000440c:	09568863          	beq	a3,s5,8000449c <wait+0x120>
    80004410:	0b073603          	ld	a2,176(a4)
    80004414:	fe9618e3          	bne	a2,s1,80004404 <wait+0x88>
    80004418:	00072603          	lw	a2,0(a4)
    8000441c:	ff7614e3          	bne	a2,s7,80004404 <wait+0x88>
    80004420:	0c800793          	li	a5,200
    80004424:	02f686b3          	mul	a3,a3,a5
    80004428:	00d58533          	add	a0,a1,a3
    8000442c:	00452483          	lw	s1,4(a0)
    80004430:	00090663          	beqz	s2,8000443c <wait+0xc0>
    80004434:	00c52783          	lw	a5,12(a0)
    80004438:	00f92023          	sw	a5,0(s2)
    8000443c:	851ff0ef          	jal	80003c8c <free_proc.part.0>
    80004440:	00048593          	mv	a1,s1
    80004444:	00003517          	auipc	a0,0x3
    80004448:	15c50513          	add	a0,a0,348 # 800075a0 <digits+0xb30>
    8000444c:	998fd0ef          	jal	800015e4 <printf>
    80004450:	0f50000f          	fence	iorw,ow
    80004454:	0804202f          	amoswap.w	zero,zero,(s0)
    80004458:	04813083          	ld	ra,72(sp)
    8000445c:	04013403          	ld	s0,64(sp)
    80004460:	03013903          	ld	s2,48(sp)
    80004464:	02813983          	ld	s3,40(sp)
    80004468:	02013a03          	ld	s4,32(sp)
    8000446c:	01813a83          	ld	s5,24(sp)
    80004470:	01013b03          	ld	s6,16(sp)
    80004474:	00813b83          	ld	s7,8(sp)
    80004478:	00013c03          	ld	s8,0(sp)
    8000447c:	00048513          	mv	a0,s1
    80004480:	03813483          	ld	s1,56(sp)
    80004484:	05010113          	add	sp,sp,80
    80004488:	00008067          	ret
    8000448c:	0007a703          	lw	a4,0(a5)
    80004490:	02071663          	bnez	a4,800044bc <wait+0x140>
    80004494:	0c878793          	add	a5,a5,200
    80004498:	01678a63          	beq	a5,s6,800044ac <wait+0x130>
    8000449c:	0b07b703          	ld	a4,176(a5)
    800044a0:	fe9706e3          	beq	a4,s1,8000448c <wait+0x110>
    800044a4:	0c878793          	add	a5,a5,200
    800044a8:	ff679ae3          	bne	a5,s6,8000449c <wait+0x120>
    800044ac:	0f50000f          	fence	iorw,ow
    800044b0:	0804202f          	amoswap.w	zero,zero,(s0)
    800044b4:	fff00493          	li	s1,-1
    800044b8:	fa1ff06f          	j	80004458 <wait+0xdc>
    800044bc:	0f50000f          	fence	iorw,ow
    800044c0:	0804202f          	amoswap.w	zero,zero,(s0)
    800044c4:	000c3703          	ld	a4,0(s8)
    800044c8:	f0070ae3          	beqz	a4,800043dc <wait+0x60>
    800044cc:	000a0793          	mv	a5,s4
    800044d0:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800044d4:	0007879b          	sext.w	a5,a5
    800044d8:	fe079ae3          	bnez	a5,800044cc <wait+0x150>
    800044dc:	01372023          	sw	s3,0(a4)
    800044e0:	0a973c23          	sd	s1,184(a4)
    800044e4:	0f50000f          	fence	iorw,ow
    800044e8:	0804202f          	amoswap.w	zero,zero,(s0)
    800044ec:	c55ff0ef          	jal	80004140 <yield>
    800044f0:	eedff06f          	j	800043dc <wait+0x60>

00000000800044f4 <kill>:
    800044f4:	00421597          	auipc	a1,0x421
    800044f8:	0b458593          	add	a1,a1,180 # 804255a8 <proc>
    800044fc:	00058793          	mv	a5,a1
    80004500:	00000713          	li	a4,0
    80004504:	01000613          	li	a2,16
    80004508:	0100006f          	j	80004518 <kill+0x24>
    8000450c:	0017071b          	addw	a4,a4,1
    80004510:	0c878793          	add	a5,a5,200
    80004514:	06c70263          	beq	a4,a2,80004578 <kill+0x84>
    80004518:	0047a683          	lw	a3,4(a5)
    8000451c:	fea698e3          	bne	a3,a0,8000450c <kill+0x18>
    80004520:	0007a683          	lw	a3,0(a5)
    80004524:	fe0684e3          	beqz	a3,8000450c <kill+0x18>
    80004528:	00422697          	auipc	a3,0x422
    8000452c:	d3868693          	add	a3,a3,-712 # 80426260 <proc_lock>
    80004530:	00100613          	li	a2,1
    80004534:	00060793          	mv	a5,a2
    80004538:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    8000453c:	0007879b          	sext.w	a5,a5
    80004540:	fe079ae3          	bnez	a5,80004534 <kill+0x40>
    80004544:	0c800793          	li	a5,200
    80004548:	02f70733          	mul	a4,a4,a5
    8000454c:	00100613          	li	a2,1
    80004550:	00400793          	li	a5,4
    80004554:	00e585b3          	add	a1,a1,a4
    80004558:	0005a703          	lw	a4,0(a1)
    8000455c:	00c5a823          	sw	a2,16(a1)
    80004560:	00f71663          	bne	a4,a5,8000456c <kill+0x78>
    80004564:	00200793          	li	a5,2
    80004568:	00f5a023          	sw	a5,0(a1)
    8000456c:	0f50000f          	fence	iorw,ow
    80004570:	0806a02f          	amoswap.w	zero,zero,(a3)
    80004574:	00008067          	ret
    80004578:	00008067          	ret

000000008000457c <sleep>:
    8000457c:	00422617          	auipc	a2,0x422
    80004580:	cec63603          	ld	a2,-788(a2) # 80426268 <current_proc>
    80004584:	02060c63          	beqz	a2,800045bc <sleep+0x40>
    80004588:	00422717          	auipc	a4,0x422
    8000458c:	cd870713          	add	a4,a4,-808 # 80426260 <proc_lock>
    80004590:	00100693          	li	a3,1
    80004594:	00068793          	mv	a5,a3
    80004598:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    8000459c:	0007879b          	sext.w	a5,a5
    800045a0:	fe079ae3          	bnez	a5,80004594 <sleep+0x18>
    800045a4:	00400793          	li	a5,4
    800045a8:	00f62023          	sw	a5,0(a2)
    800045ac:	0aa63c23          	sd	a0,184(a2)
    800045b0:	0f50000f          	fence	iorw,ow
    800045b4:	0807202f          	amoswap.w	zero,zero,(a4)
    800045b8:	b89ff06f          	j	80004140 <yield>
    800045bc:	00008067          	ret

00000000800045c0 <wakeup>:
    800045c0:	00422697          	auipc	a3,0x422
    800045c4:	ca068693          	add	a3,a3,-864 # 80426260 <proc_lock>
    800045c8:	00100713          	li	a4,1
    800045cc:	00070793          	mv	a5,a4
    800045d0:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    800045d4:	0007879b          	sext.w	a5,a5
    800045d8:	fe079ae3          	bnez	a5,800045cc <wakeup+0xc>
    800045dc:	00421797          	auipc	a5,0x421
    800045e0:	fcc78793          	add	a5,a5,-52 # 804255a8 <proc>
    800045e4:	00422597          	auipc	a1,0x422
    800045e8:	c4458593          	add	a1,a1,-956 # 80426228 <mem_end>
    800045ec:	00400613          	li	a2,4
    800045f0:	00200813          	li	a6,2
    800045f4:	00c0006f          	j	80004600 <wakeup+0x40>
    800045f8:	0c878793          	add	a5,a5,200
    800045fc:	02f58063          	beq	a1,a5,8000461c <wakeup+0x5c>
    80004600:	0007a703          	lw	a4,0(a5)
    80004604:	fec71ae3          	bne	a4,a2,800045f8 <wakeup+0x38>
    80004608:	0b87b703          	ld	a4,184(a5)
    8000460c:	fea716e3          	bne	a4,a0,800045f8 <wakeup+0x38>
    80004610:	0107a023          	sw	a6,0(a5)
    80004614:	0c878793          	add	a5,a5,200
    80004618:	fef594e3          	bne	a1,a5,80004600 <wakeup+0x40>
    8000461c:	0f50000f          	fence	iorw,ow
    80004620:	0806a02f          	amoswap.w	zero,zero,(a3)
    80004624:	00008067          	ret

0000000080004628 <wakeup_one>:
    80004628:	00422617          	auipc	a2,0x422
    8000462c:	c3860613          	add	a2,a2,-968 # 80426260 <proc_lock>
    80004630:	00100713          	li	a4,1
    80004634:	00070793          	mv	a5,a4
    80004638:	0cf627af          	amoswap.w.aq	a5,a5,(a2)
    8000463c:	0007879b          	sext.w	a5,a5
    80004640:	fe079ae3          	bnez	a5,80004634 <wakeup_one+0xc>
    80004644:	00421897          	auipc	a7,0x421
    80004648:	f6488893          	add	a7,a7,-156 # 804255a8 <proc>
    8000464c:	00088793          	mv	a5,a7
    80004650:	00000713          	li	a4,0
    80004654:	00400593          	li	a1,4
    80004658:	01000813          	li	a6,16
    8000465c:	0100006f          	j	8000466c <wakeup_one+0x44>
    80004660:	0017071b          	addw	a4,a4,1
    80004664:	0c878793          	add	a5,a5,200
    80004668:	03070463          	beq	a4,a6,80004690 <wakeup_one+0x68>
    8000466c:	0007a683          	lw	a3,0(a5)
    80004670:	feb698e3          	bne	a3,a1,80004660 <wakeup_one+0x38>
    80004674:	0b87b683          	ld	a3,184(a5)
    80004678:	fea694e3          	bne	a3,a0,80004660 <wakeup_one+0x38>
    8000467c:	0c800793          	li	a5,200
    80004680:	02f70733          	mul	a4,a4,a5
    80004684:	00200793          	li	a5,2
    80004688:	00e888b3          	add	a7,a7,a4
    8000468c:	00f8a023          	sw	a5,0(a7)
    80004690:	0f50000f          	fence	iorw,ow
    80004694:	0806202f          	amoswap.w	zero,zero,(a2)
    80004698:	00008067          	ret
    8000469c:	0000                	.2byte	0x0
	...

00000000800046a0 <machinevec>:
    800046a0:	f0810113          	add	sp,sp,-248
    800046a4:	00113023          	sd	ra,0(sp)
    800046a8:	00313823          	sd	gp,16(sp)
    800046ac:	00413c23          	sd	tp,24(sp)
    800046b0:	02513023          	sd	t0,32(sp)
    800046b4:	02613423          	sd	t1,40(sp)
    800046b8:	02713823          	sd	t2,48(sp)
    800046bc:	02813c23          	sd	s0,56(sp)
    800046c0:	04913023          	sd	s1,64(sp)
    800046c4:	04a13423          	sd	a0,72(sp)
    800046c8:	04b13823          	sd	a1,80(sp)
    800046cc:	04c13c23          	sd	a2,88(sp)
    800046d0:	06d13023          	sd	a3,96(sp)
    800046d4:	06e13423          	sd	a4,104(sp)
    800046d8:	06f13823          	sd	a5,112(sp)
    800046dc:	07013c23          	sd	a6,120(sp)
    800046e0:	09113023          	sd	a7,128(sp)
    800046e4:	09213423          	sd	s2,136(sp)
    800046e8:	09313823          	sd	s3,144(sp)
    800046ec:	09413c23          	sd	s4,152(sp)
    800046f0:	0b513023          	sd	s5,160(sp)
    800046f4:	0b613423          	sd	s6,168(sp)
    800046f8:	0b713823          	sd	s7,176(sp)
    800046fc:	0b813c23          	sd	s8,184(sp)
    80004700:	0d913023          	sd	s9,192(sp)
    80004704:	0da13423          	sd	s10,200(sp)
    80004708:	0db13823          	sd	s11,208(sp)
    8000470c:	0dc13c23          	sd	t3,216(sp)
    80004710:	0fd13023          	sd	t4,224(sp)
    80004714:	0fe13423          	sd	t5,232(sp)
    80004718:	0ff13823          	sd	t6,240(sp)
    8000471c:	0f810293          	add	t0,sp,248
    80004720:	00513423          	sd	t0,8(sp)
    80004724:	34202573          	csrr	a0,mcause
    80004728:	fff0029b          	addw	t0,zero,-1
    8000472c:	03f29293          	sll	t0,t0,0x3f
    80004730:	00728293          	add	t0,t0,7
    80004734:	00551663          	bne	a0,t0,80004740 <interrupt_return>
    80004738:	de9fe0ef          	jal	80003520 <machine_timer_handler>
    8000473c:	0040006f          	j	80004740 <interrupt_return>

0000000080004740 <interrupt_return>:
    80004740:	00013083          	ld	ra,0(sp)
    80004744:	01013183          	ld	gp,16(sp)
    80004748:	01813203          	ld	tp,24(sp)
    8000474c:	02013283          	ld	t0,32(sp)
    80004750:	02813303          	ld	t1,40(sp)
    80004754:	03013383          	ld	t2,48(sp)
    80004758:	03813403          	ld	s0,56(sp)
    8000475c:	04013483          	ld	s1,64(sp)
    80004760:	04813503          	ld	a0,72(sp)
    80004764:	05013583          	ld	a1,80(sp)
    80004768:	05813603          	ld	a2,88(sp)
    8000476c:	06013683          	ld	a3,96(sp)
    80004770:	06813703          	ld	a4,104(sp)
    80004774:	07013783          	ld	a5,112(sp)
    80004778:	07813803          	ld	a6,120(sp)
    8000477c:	08013883          	ld	a7,128(sp)
    80004780:	08813903          	ld	s2,136(sp)
    80004784:	09013983          	ld	s3,144(sp)
    80004788:	09813a03          	ld	s4,152(sp)
    8000478c:	0a013a83          	ld	s5,160(sp)
    80004790:	0a813b03          	ld	s6,168(sp)
    80004794:	0b013b83          	ld	s7,176(sp)
    80004798:	0b813c03          	ld	s8,184(sp)
    8000479c:	0c013c83          	ld	s9,192(sp)
    800047a0:	0c813d03          	ld	s10,200(sp)
    800047a4:	0d013d83          	ld	s11,208(sp)
    800047a8:	0d813e03          	ld	t3,216(sp)
    800047ac:	0e013e83          	ld	t4,224(sp)
    800047b0:	0e813f03          	ld	t5,232(sp)
    800047b4:	0f013f83          	ld	t6,240(sp)
    800047b8:	00813103          	ld	sp,8(sp)
    800047bc:	30200073          	mret

00000000800047c0 <kernelvec>:
    800047c0:	ef010113          	add	sp,sp,-272
    800047c4:	00013023          	sd	zero,0(sp)
    800047c8:	00113423          	sd	ra,8(sp)
    800047cc:	00313c23          	sd	gp,24(sp)
    800047d0:	02413023          	sd	tp,32(sp)
    800047d4:	02513423          	sd	t0,40(sp)
    800047d8:	02613823          	sd	t1,48(sp)
    800047dc:	02713c23          	sd	t2,56(sp)
    800047e0:	04813023          	sd	s0,64(sp)
    800047e4:	04913423          	sd	s1,72(sp)
    800047e8:	04a13823          	sd	a0,80(sp)
    800047ec:	04b13c23          	sd	a1,88(sp)
    800047f0:	06c13023          	sd	a2,96(sp)
    800047f4:	06d13423          	sd	a3,104(sp)
    800047f8:	06e13823          	sd	a4,112(sp)
    800047fc:	06f13c23          	sd	a5,120(sp)
    80004800:	09013023          	sd	a6,128(sp)
    80004804:	09113423          	sd	a7,136(sp)
    80004808:	09213823          	sd	s2,144(sp)
    8000480c:	09313c23          	sd	s3,152(sp)
    80004810:	0b413023          	sd	s4,160(sp)
    80004814:	0b513423          	sd	s5,168(sp)
    80004818:	0b613823          	sd	s6,176(sp)
    8000481c:	0b713c23          	sd	s7,184(sp)
    80004820:	0d813023          	sd	s8,192(sp)
    80004824:	0d913423          	sd	s9,200(sp)
    80004828:	0da13823          	sd	s10,208(sp)
    8000482c:	0db13c23          	sd	s11,216(sp)
    80004830:	0fc13023          	sd	t3,224(sp)
    80004834:	0fd13423          	sd	t4,232(sp)
    80004838:	0fe13823          	sd	t5,240(sp)
    8000483c:	0ff13c23          	sd	t6,248(sp)
    80004840:	11010293          	add	t0,sp,272
    80004844:	00513823          	sd	t0,16(sp)
    80004848:	141022f3          	csrr	t0,sepc
    8000484c:	10513023          	sd	t0,256(sp)
    80004850:	142022f3          	csrr	t0,scause
    80004854:	10513423          	sd	t0,264(sp)
    80004858:	b64ff0ef          	jal	80003bbc <kerneltrap>
    8000485c:	00813083          	ld	ra,8(sp)
    80004860:	01813183          	ld	gp,24(sp)
    80004864:	02013203          	ld	tp,32(sp)
    80004868:	02813283          	ld	t0,40(sp)
    8000486c:	03013303          	ld	t1,48(sp)
    80004870:	03813383          	ld	t2,56(sp)
    80004874:	04013403          	ld	s0,64(sp)
    80004878:	04813483          	ld	s1,72(sp)
    8000487c:	05013503          	ld	a0,80(sp)
    80004880:	05813583          	ld	a1,88(sp)
    80004884:	06013603          	ld	a2,96(sp)
    80004888:	06813683          	ld	a3,104(sp)
    8000488c:	07013703          	ld	a4,112(sp)
    80004890:	07813783          	ld	a5,120(sp)
    80004894:	08013803          	ld	a6,128(sp)
    80004898:	08813883          	ld	a7,136(sp)
    8000489c:	09013903          	ld	s2,144(sp)
    800048a0:	09813983          	ld	s3,152(sp)
    800048a4:	0a013a03          	ld	s4,160(sp)
    800048a8:	0a813a83          	ld	s5,168(sp)
    800048ac:	0b013b03          	ld	s6,176(sp)
    800048b0:	0b813b83          	ld	s7,184(sp)
    800048b4:	0c013c03          	ld	s8,192(sp)
    800048b8:	0c813c83          	ld	s9,200(sp)
    800048bc:	0d013d03          	ld	s10,208(sp)
    800048c0:	0d813d83          	ld	s11,216(sp)
    800048c4:	0e013e03          	ld	t3,224(sp)
    800048c8:	0e813e83          	ld	t4,232(sp)
    800048cc:	0f013f03          	ld	t5,240(sp)
    800048d0:	0f813f83          	ld	t6,248(sp)
    800048d4:	10013283          	ld	t0,256(sp)
    800048d8:	14129073          	csrw	sepc,t0
    800048dc:	10813283          	ld	t0,264(sp)
    800048e0:	14229073          	csrw	scause,t0
    800048e4:	01013103          	ld	sp,16(sp)
    800048e8:	10200073          	sret
    800048ec:	0000                	.2byte	0x0
	...

00000000800048f0 <uservec>:
    800048f0:	00010293          	mv	t0,sp
    800048f4:	ef010113          	add	sp,sp,-272
    800048f8:	00513823          	sd	t0,16(sp)
    800048fc:	00113423          	sd	ra,8(sp)
    80004900:	00313c23          	sd	gp,24(sp)
    80004904:	02413023          	sd	tp,32(sp)
    80004908:	02513423          	sd	t0,40(sp)
    8000490c:	02613823          	sd	t1,48(sp)
    80004910:	02713c23          	sd	t2,56(sp)
    80004914:	04813023          	sd	s0,64(sp)
    80004918:	04913423          	sd	s1,72(sp)
    8000491c:	04a13823          	sd	a0,80(sp)
    80004920:	04b13c23          	sd	a1,88(sp)
    80004924:	06c13023          	sd	a2,96(sp)
    80004928:	06d13423          	sd	a3,104(sp)
    8000492c:	06e13823          	sd	a4,112(sp)
    80004930:	06f13c23          	sd	a5,120(sp)
    80004934:	09013023          	sd	a6,128(sp)
    80004938:	09113423          	sd	a7,136(sp)
    8000493c:	09213823          	sd	s2,144(sp)
    80004940:	09313c23          	sd	s3,152(sp)
    80004944:	0b413023          	sd	s4,160(sp)
    80004948:	0b513423          	sd	s5,168(sp)
    8000494c:	0b613823          	sd	s6,176(sp)
    80004950:	0b713c23          	sd	s7,184(sp)
    80004954:	0d813023          	sd	s8,192(sp)
    80004958:	0d913423          	sd	s9,200(sp)
    8000495c:	0da13823          	sd	s10,208(sp)
    80004960:	0db13c23          	sd	s11,216(sp)
    80004964:	0fc13023          	sd	t3,224(sp)
    80004968:	0fd13423          	sd	t4,232(sp)
    8000496c:	0fe13823          	sd	t5,240(sp)
    80004970:	0ff13c23          	sd	t6,248(sp)
    80004974:	10002373          	csrr	t1,sstatus
    80004978:	10613023          	sd	t1,256(sp)
    8000497c:	14102373          	csrr	t1,sepc
    80004980:	10613423          	sd	t1,264(sp)
    80004984:	f79fe0ef          	jal	800038fc <usertrap>
    80004988:	00813083          	ld	ra,8(sp)
    8000498c:	01813183          	ld	gp,24(sp)
    80004990:	02013203          	ld	tp,32(sp)
    80004994:	02813283          	ld	t0,40(sp)
    80004998:	03013303          	ld	t1,48(sp)
    8000499c:	03813383          	ld	t2,56(sp)
    800049a0:	04013403          	ld	s0,64(sp)
    800049a4:	04813483          	ld	s1,72(sp)
    800049a8:	05013503          	ld	a0,80(sp)
    800049ac:	05813583          	ld	a1,88(sp)
    800049b0:	06013603          	ld	a2,96(sp)
    800049b4:	06813683          	ld	a3,104(sp)
    800049b8:	07013703          	ld	a4,112(sp)
    800049bc:	07813783          	ld	a5,120(sp)
    800049c0:	08013803          	ld	a6,128(sp)
    800049c4:	08813883          	ld	a7,136(sp)
    800049c8:	09013903          	ld	s2,144(sp)
    800049cc:	09813983          	ld	s3,152(sp)
    800049d0:	0a013a03          	ld	s4,160(sp)
    800049d4:	0a813a83          	ld	s5,168(sp)
    800049d8:	0b013b03          	ld	s6,176(sp)
    800049dc:	0b813b83          	ld	s7,184(sp)
    800049e0:	0c013c03          	ld	s8,192(sp)
    800049e4:	0c813c83          	ld	s9,200(sp)
    800049e8:	0d013d03          	ld	s10,208(sp)
    800049ec:	0d813d83          	ld	s11,216(sp)
    800049f0:	0e013e03          	ld	t3,224(sp)
    800049f4:	0e813e83          	ld	t4,232(sp)
    800049f8:	0f013f03          	ld	t5,240(sp)
    800049fc:	0f813f83          	ld	t6,248(sp)
    80004a00:	10013303          	ld	t1,256(sp)
    80004a04:	10031073          	csrw	sstatus,t1
    80004a08:	10813303          	ld	t1,264(sp)
    80004a0c:	14131073          	csrw	sepc,t1
    80004a10:	01013103          	ld	sp,16(sp)
    80004a14:	10200073          	sret
	...

0000000080004a20 <switch_context>:
    80004a20:	00153023          	sd	ra,0(a0)
    80004a24:	00253423          	sd	sp,8(a0)
    80004a28:	00853823          	sd	s0,16(a0)
    80004a2c:	00953c23          	sd	s1,24(a0)
    80004a30:	03253023          	sd	s2,32(a0)
    80004a34:	03353423          	sd	s3,40(a0)
    80004a38:	03453823          	sd	s4,48(a0)
    80004a3c:	03553c23          	sd	s5,56(a0)
    80004a40:	05653023          	sd	s6,64(a0)
    80004a44:	05753423          	sd	s7,72(a0)
    80004a48:	05853823          	sd	s8,80(a0)
    80004a4c:	05953c23          	sd	s9,88(a0)
    80004a50:	07a53023          	sd	s10,96(a0)
    80004a54:	07b53423          	sd	s11,104(a0)
    80004a58:	0005b083          	ld	ra,0(a1)
    80004a5c:	0085b103          	ld	sp,8(a1)
    80004a60:	0105b403          	ld	s0,16(a1)
    80004a64:	0185b483          	ld	s1,24(a1)
    80004a68:	0205b903          	ld	s2,32(a1)
    80004a6c:	0285b983          	ld	s3,40(a1)
    80004a70:	0305ba03          	ld	s4,48(a1)
    80004a74:	0385ba83          	ld	s5,56(a1)
    80004a78:	0405bb03          	ld	s6,64(a1)
    80004a7c:	0485bb83          	ld	s7,72(a1)
    80004a80:	0505bc03          	ld	s8,80(a1)
    80004a84:	0585bc83          	ld	s9,88(a1)
    80004a88:	0605bd03          	ld	s10,96(a1)
    80004a8c:	0685bd83          	ld	s11,104(a1)
    80004a90:	00008067          	ret
