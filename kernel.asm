
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
    8000001c:	00008297          	auipc	t0,0x8
    80000020:	88428293          	add	t0,t0,-1916 # 800078a0 <machinevec>
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
    80000060:	00427317          	auipc	t1,0x427
    80000064:	41030313          	add	t1,t1,1040 # 80427470 <bss_end>

0000000080000068 <bss_clear>:
    80000068:	00628863          	beq	t0,t1,80000078 <bss_done>
    8000006c:	0002b023          	sd	zero,0(t0)
    80000070:	00828293          	add	t0,t0,8
    80000074:	ff5ff06f          	j	80000068 <bss_clear>

0000000080000078 <bss_done>:
    80000078:	0b5020ef          	jal	8000292c <main>

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
    800000a0:	025060ef          	jal	800068c4 <get_pid>
    800000a4:	00050913          	mv	s2,a0
    800000a8:	00000493          	li	s1,0
    800000ac:	00008a17          	auipc	s4,0x8
    800000b0:	f54a0a13          	add	s4,s4,-172 # 80008000 <rodata_start>
    800000b4:	69f40413          	add	s0,s0,1695 # 1869f <_entry-0x7ffe7961>
    800000b8:	00500993          	li	s3,5
    800000bc:	00048613          	mv	a2,s1
    800000c0:	00090593          	mv	a1,s2
    800000c4:	000a0513          	mv	a0,s4
    800000c8:	6a5020ef          	jal	80002f6c <printf>
    800000cc:	00012623          	sw	zero,12(sp)
    800000d0:	00c12783          	lw	a5,12(sp)
    800000d4:	00f44c63          	blt	s0,a5,800000ec <rr_worker+0x6c>
    800000d8:	00c12783          	lw	a5,12(sp)
    800000dc:	0017879b          	addw	a5,a5,1
    800000e0:	00f12623          	sw	a5,12(sp)
    800000e4:	00c12783          	lw	a5,12(sp)
    800000e8:	fef458e3          	bge	s0,a5,800000d8 <rr_worker+0x58>
    800000ec:	0014849b          	addw	s1,s1,1
    800000f0:	2b1060ef          	jal	80006ba0 <yield>
    800000f4:	fd3494e3          	bne	s1,s3,800000bc <rr_worker+0x3c>
    800000f8:	00090593          	mv	a1,s2
    800000fc:	00008517          	auipc	a0,0x8
    80000100:	f2450513          	add	a0,a0,-220 # 80008020 <rodata_start+0x20>
    80000104:	669020ef          	jal	80002f6c <printf>
    80000108:	03013403          	ld	s0,48(sp)
    8000010c:	03813083          	ld	ra,56(sp)
    80000110:	02813483          	ld	s1,40(sp)
    80000114:	02013903          	ld	s2,32(sp)
    80000118:	01813983          	ld	s3,24(sp)
    8000011c:	01013a03          	ld	s4,16(sp)
    80000120:	00000513          	li	a0,0
    80000124:	04010113          	add	sp,sp,64
    80000128:	4790606f          	j	80006da0 <exit>

000000008000012c <test_sys_getpid>:
    8000012c:	fe010113          	add	sp,sp,-32
    80000130:	00008517          	auipc	a0,0x8
    80000134:	f1050513          	add	a0,a0,-240 # 80008040 <rodata_start+0x40>
    80000138:	00113c23          	sd	ra,24(sp)
    8000013c:	00813823          	sd	s0,16(sp)
    80000140:	00913423          	sd	s1,8(sp)
    80000144:	198030ef          	jal	800032dc <uart_puts>
    80000148:	4c0060ef          	jal	80006608 <alloc_proc>
    8000014c:	08050663          	beqz	a0,800001d8 <test_sys_getpid+0xac>
    80000150:	00300793          	li	a5,3
    80000154:	00f52223          	sw	a5,4(a0)
    80000158:	00050413          	mv	s0,a0
    8000015c:	79c060ef          	jal	800068f8 <set_current_proc>
    80000160:	00842583          	lw	a1,8(s0)
    80000164:	00008517          	auipc	a0,0x8
    80000168:	f3450513          	add	a0,a0,-204 # 80008098 <rodata_start+0x98>
    8000016c:	601020ef          	jal	80002f6c <printf>
    80000170:	72d060ef          	jal	8000709c <sys_getpid>
    80000174:	00050593          	mv	a1,a0
    80000178:	00050493          	mv	s1,a0
    8000017c:	00008517          	auipc	a0,0x8
    80000180:	f2c50513          	add	a0,a0,-212 # 800080a8 <rodata_start+0xa8>
    80000184:	5e9020ef          	jal	80002f6c <printf>
    80000188:	00842783          	lw	a5,8(s0)
    8000018c:	02978e63          	beq	a5,s1,800001c8 <test_sys_getpid+0x9c>
    80000190:	00008517          	auipc	a0,0x8
    80000194:	f6050513          	add	a0,a0,-160 # 800080f0 <rodata_start+0xf0>
    80000198:	144030ef          	jal	800032dc <uart_puts>
    8000019c:	00000513          	li	a0,0
    800001a0:	758060ef          	jal	800068f8 <set_current_proc>
    800001a4:	00040513          	mv	a0,s0
    800001a8:	63c060ef          	jal	800067e4 <free_proc>
    800001ac:	01013403          	ld	s0,16(sp)
    800001b0:	01813083          	ld	ra,24(sp)
    800001b4:	00813483          	ld	s1,8(sp)
    800001b8:	00008517          	auipc	a0,0x8
    800001bc:	f6050513          	add	a0,a0,-160 # 80008118 <rodata_start+0x118>
    800001c0:	02010113          	add	sp,sp,32
    800001c4:	1180306f          	j	800032dc <uart_puts>
    800001c8:	00008517          	auipc	a0,0x8
    800001cc:	f0050513          	add	a0,a0,-256 # 800080c8 <rodata_start+0xc8>
    800001d0:	10c030ef          	jal	800032dc <uart_puts>
    800001d4:	fc9ff06f          	j	8000019c <test_sys_getpid+0x70>
    800001d8:	01013403          	ld	s0,16(sp)
    800001dc:	01813083          	ld	ra,24(sp)
    800001e0:	00813483          	ld	s1,8(sp)
    800001e4:	00008517          	auipc	a0,0x8
    800001e8:	e9c50513          	add	a0,a0,-356 # 80008080 <rodata_start+0x80>
    800001ec:	02010113          	add	sp,sp,32
    800001f0:	0ec0306f          	j	800032dc <uart_puts>

00000000800001f4 <test_sys_uptime>:
    800001f4:	fd010113          	add	sp,sp,-48
    800001f8:	00008517          	auipc	a0,0x8
    800001fc:	f3850513          	add	a0,a0,-200 # 80008130 <rodata_start+0x130>
    80000200:	02113423          	sd	ra,40(sp)
    80000204:	02813023          	sd	s0,32(sp)
    80000208:	00913c23          	sd	s1,24(sp)
    8000020c:	01213823          	sd	s2,16(sp)
    80000210:	0cc030ef          	jal	800032dc <uart_puts>
    80000214:	3f4060ef          	jal	80006608 <alloc_proc>
    80000218:	0a050e63          	beqz	a0,800002d4 <test_sys_uptime+0xe0>
    8000021c:	00300793          	li	a5,3
    80000220:	00f52223          	sw	a5,4(a0)
    80000224:	00050413          	mv	s0,a0
    80000228:	6d0060ef          	jal	800068f8 <set_current_proc>
    8000022c:	030070ef          	jal	8000725c <sys_uptime>
    80000230:	00050593          	mv	a1,a0
    80000234:	00050913          	mv	s2,a0
    80000238:	00008517          	auipc	a0,0x8
    8000023c:	f3850513          	add	a0,a0,-200 # 80008170 <rodata_start+0x170>
    80000240:	52d020ef          	jal	80002f6c <printf>
    80000244:	00012623          	sw	zero,12(sp)
    80000248:	00c12783          	lw	a5,12(sp)
    8000024c:	000f4737          	lui	a4,0xf4
    80000250:	23f70713          	add	a4,a4,575 # f423f <_entry-0x7ff0bdc1>
    80000254:	00f74c63          	blt	a4,a5,8000026c <test_sys_uptime+0x78>
    80000258:	00c12783          	lw	a5,12(sp)
    8000025c:	0017879b          	addw	a5,a5,1
    80000260:	00f12623          	sw	a5,12(sp)
    80000264:	00c12783          	lw	a5,12(sp)
    80000268:	fef758e3          	bge	a4,a5,80000258 <test_sys_uptime+0x64>
    8000026c:	7f1060ef          	jal	8000725c <sys_uptime>
    80000270:	00050493          	mv	s1,a0
    80000274:	00050593          	mv	a1,a0
    80000278:	00008517          	auipc	a0,0x8
    8000027c:	f1850513          	add	a0,a0,-232 # 80008190 <rodata_start+0x190>
    80000280:	4ed020ef          	jal	80002f6c <printf>
    80000284:	0524f063          	bgeu	s1,s2,800002c4 <test_sys_uptime+0xd0>
    80000288:	00008517          	auipc	a0,0x8
    8000028c:	f5850513          	add	a0,a0,-168 # 800081e0 <rodata_start+0x1e0>
    80000290:	04c030ef          	jal	800032dc <uart_puts>
    80000294:	00000513          	li	a0,0
    80000298:	660060ef          	jal	800068f8 <set_current_proc>
    8000029c:	00040513          	mv	a0,s0
    800002a0:	544060ef          	jal	800067e4 <free_proc>
    800002a4:	02013403          	ld	s0,32(sp)
    800002a8:	02813083          	ld	ra,40(sp)
    800002ac:	01813483          	ld	s1,24(sp)
    800002b0:	01013903          	ld	s2,16(sp)
    800002b4:	00008517          	auipc	a0,0x8
    800002b8:	f4c50513          	add	a0,a0,-180 # 80008200 <rodata_start+0x200>
    800002bc:	03010113          	add	sp,sp,48
    800002c0:	01c0306f          	j	800032dc <uart_puts>
    800002c4:	00008517          	auipc	a0,0x8
    800002c8:	eec50513          	add	a0,a0,-276 # 800081b0 <rodata_start+0x1b0>
    800002cc:	010030ef          	jal	800032dc <uart_puts>
    800002d0:	fc5ff06f          	j	80000294 <test_sys_uptime+0xa0>
    800002d4:	02013403          	ld	s0,32(sp)
    800002d8:	02813083          	ld	ra,40(sp)
    800002dc:	01813483          	ld	s1,24(sp)
    800002e0:	01013903          	ld	s2,16(sp)
    800002e4:	00008517          	auipc	a0,0x8
    800002e8:	d9c50513          	add	a0,a0,-612 # 80008080 <rodata_start+0x80>
    800002ec:	03010113          	add	sp,sp,48
    800002f0:	7ed0206f          	j	800032dc <uart_puts>

00000000800002f4 <test_sys_fork>:
    800002f4:	fe010113          	add	sp,sp,-32
    800002f8:	00008517          	auipc	a0,0x8
    800002fc:	f2050513          	add	a0,a0,-224 # 80008218 <rodata_start+0x218>
    80000300:	00113c23          	sd	ra,24(sp)
    80000304:	00813823          	sd	s0,16(sp)
    80000308:	00913423          	sd	s1,8(sp)
    8000030c:	7d1020ef          	jal	800032dc <uart_puts>
    80000310:	2f8060ef          	jal	80006608 <alloc_proc>
    80000314:	0e050463          	beqz	a0,800003fc <test_sys_fork+0x108>
    80000318:	00300793          	li	a5,3
    8000031c:	00f52223          	sw	a5,4(a0)
    80000320:	00050413          	mv	s0,a0
    80000324:	5d4060ef          	jal	800068f8 <set_current_proc>
    80000328:	00842583          	lw	a1,8(s0)
    8000032c:	00008517          	auipc	a0,0x8
    80000330:	f4450513          	add	a0,a0,-188 # 80008270 <rodata_start+0x270>
    80000334:	439020ef          	jal	80002f6c <printf>
    80000338:	575060ef          	jal	800070ac <sys_fork>
    8000033c:	0005049b          	sext.w	s1,a0
    80000340:	04904063          	bgtz	s1,80000380 <test_sys_fork+0x8c>
    80000344:	08049c63          	bnez	s1,800003dc <test_sys_fork+0xe8>
    80000348:	00008517          	auipc	a0,0x8
    8000034c:	03850513          	add	a0,a0,56 # 80008380 <rodata_start+0x380>
    80000350:	78d020ef          	jal	800032dc <uart_puts>
    80000354:	00000513          	li	a0,0
    80000358:	5a0060ef          	jal	800068f8 <set_current_proc>
    8000035c:	00040513          	mv	a0,s0
    80000360:	484060ef          	jal	800067e4 <free_proc>
    80000364:	01013403          	ld	s0,16(sp)
    80000368:	01813083          	ld	ra,24(sp)
    8000036c:	00813483          	ld	s1,8(sp)
    80000370:	00008517          	auipc	a0,0x8
    80000374:	06050513          	add	a0,a0,96 # 800083d0 <rodata_start+0x3d0>
    80000378:	02010113          	add	sp,sp,32
    8000037c:	7610206f          	j	800032dc <uart_puts>
    80000380:	00048593          	mv	a1,s1
    80000384:	00008517          	auipc	a0,0x8
    80000388:	f0450513          	add	a0,a0,-252 # 80008288 <rodata_start+0x288>
    8000038c:	3e1020ef          	jal	80002f6c <printf>
    80000390:	00048513          	mv	a0,s1
    80000394:	45c060ef          	jal	800067f0 <find_proc>
    80000398:	00050493          	mv	s1,a0
    8000039c:	08050663          	beqz	a0,80000428 <test_sys_fork+0x134>
    800003a0:	00c52583          	lw	a1,12(a0)
    800003a4:	00842603          	lw	a2,8(s0)
    800003a8:	04c58263          	beq	a1,a2,800003ec <test_sys_fork+0xf8>
    800003ac:	00008517          	auipc	a0,0x8
    800003b0:	f3450513          	add	a0,a0,-204 # 800082e0 <rodata_start+0x2e0>
    800003b4:	3b9020ef          	jal	80002f6c <printf>
    800003b8:	0044a583          	lw	a1,4(s1)
    800003bc:	00200793          	li	a5,2
    800003c0:	04f58c63          	beq	a1,a5,80000418 <test_sys_fork+0x124>
    800003c4:	00008517          	auipc	a0,0x8
    800003c8:	f7c50513          	add	a0,a0,-132 # 80008340 <rodata_start+0x340>
    800003cc:	3a1020ef          	jal	80002f6c <printf>
    800003d0:	00048513          	mv	a0,s1
    800003d4:	410060ef          	jal	800067e4 <free_proc>
    800003d8:	f7dff06f          	j	80000354 <test_sys_fork+0x60>
    800003dc:	00008517          	auipc	a0,0x8
    800003e0:	fdc50513          	add	a0,a0,-36 # 800083b8 <rodata_start+0x3b8>
    800003e4:	6f9020ef          	jal	800032dc <uart_puts>
    800003e8:	f6dff06f          	j	80000354 <test_sys_fork+0x60>
    800003ec:	00008517          	auipc	a0,0x8
    800003f0:	ecc50513          	add	a0,a0,-308 # 800082b8 <rodata_start+0x2b8>
    800003f4:	6e9020ef          	jal	800032dc <uart_puts>
    800003f8:	fc1ff06f          	j	800003b8 <test_sys_fork+0xc4>
    800003fc:	01013403          	ld	s0,16(sp)
    80000400:	01813083          	ld	ra,24(sp)
    80000404:	00813483          	ld	s1,8(sp)
    80000408:	00008517          	auipc	a0,0x8
    8000040c:	e4850513          	add	a0,a0,-440 # 80008250 <rodata_start+0x250>
    80000410:	02010113          	add	sp,sp,32
    80000414:	6c90206f          	j	800032dc <uart_puts>
    80000418:	00008517          	auipc	a0,0x8
    8000041c:	f0050513          	add	a0,a0,-256 # 80008318 <rodata_start+0x318>
    80000420:	6bd020ef          	jal	800032dc <uart_puts>
    80000424:	fadff06f          	j	800003d0 <test_sys_fork+0xdc>
    80000428:	00008517          	auipc	a0,0x8
    8000042c:	f3850513          	add	a0,a0,-200 # 80008360 <rodata_start+0x360>
    80000430:	6ad020ef          	jal	800032dc <uart_puts>
    80000434:	f21ff06f          	j	80000354 <test_sys_fork+0x60>

0000000080000438 <test_sys_sbrk>:
    80000438:	fe010113          	add	sp,sp,-32
    8000043c:	00008517          	auipc	a0,0x8
    80000440:	fac50513          	add	a0,a0,-84 # 800083e8 <rodata_start+0x3e8>
    80000444:	00113c23          	sd	ra,24(sp)
    80000448:	00813823          	sd	s0,16(sp)
    8000044c:	00913423          	sd	s1,8(sp)
    80000450:	01213023          	sd	s2,0(sp)
    80000454:	689020ef          	jal	800032dc <uart_puts>
    80000458:	1b0060ef          	jal	80006608 <alloc_proc>
    8000045c:	12050063          	beqz	a0,8000057c <test_sys_sbrk+0x144>
    80000460:	00300793          	li	a5,3
    80000464:	00f52223          	sw	a5,4(a0)
    80000468:	000017b7          	lui	a5,0x1
    8000046c:	02f53c23          	sd	a5,56(a0)
    80000470:	00050413          	mv	s0,a0
    80000474:	484060ef          	jal	800068f8 <set_current_proc>
    80000478:	04843783          	ld	a5,72(s0)
    8000047c:	12078063          	beqz	a5,8000059c <test_sys_sbrk+0x164>
    80000480:	03843583          	ld	a1,56(s0)
    80000484:	00008517          	auipc	a0,0x8
    80000488:	f9c50513          	add	a0,a0,-100 # 80008420 <rodata_start+0x420>
    8000048c:	00001937          	lui	s2,0x1
    80000490:	2dd020ef          	jal	80002f6c <printf>
    80000494:	04843783          	ld	a5,72(s0)
    80000498:	0727b823          	sd	s2,112(a5) # 1070 <_entry-0x7fffef90>
    8000049c:	495060ef          	jal	80007130 <sys_sbrk>
    800004a0:	00050593          	mv	a1,a0
    800004a4:	00050493          	mv	s1,a0
    800004a8:	00008517          	auipc	a0,0x8
    800004ac:	f9850513          	add	a0,a0,-104 # 80008440 <rodata_start+0x440>
    800004b0:	2bd020ef          	jal	80002f6c <printf>
    800004b4:	03843583          	ld	a1,56(s0)
    800004b8:	00008517          	auipc	a0,0x8
    800004bc:	fa850513          	add	a0,a0,-88 # 80008460 <rodata_start+0x460>
    800004c0:	2ad020ef          	jal	80002f6c <printf>
    800004c4:	01249863          	bne	s1,s2,800004d4 <test_sys_sbrk+0x9c>
    800004c8:	03843703          	ld	a4,56(s0)
    800004cc:	000027b7          	lui	a5,0x2
    800004d0:	08f70e63          	beq	a4,a5,8000056c <test_sys_sbrk+0x134>
    800004d4:	00008517          	auipc	a0,0x8
    800004d8:	fc450513          	add	a0,a0,-60 # 80008498 <rodata_start+0x498>
    800004dc:	601020ef          	jal	800032dc <uart_puts>
    800004e0:	04843783          	ld	a5,72(s0)
    800004e4:	80000713          	li	a4,-2048
    800004e8:	06e7b823          	sd	a4,112(a5) # 2070 <_entry-0x7fffdf90>
    800004ec:	445060ef          	jal	80007130 <sys_sbrk>
    800004f0:	00050593          	mv	a1,a0
    800004f4:	00008517          	auipc	a0,0x8
    800004f8:	fbc50513          	add	a0,a0,-68 # 800084b0 <rodata_start+0x4b0>
    800004fc:	271020ef          	jal	80002f6c <printf>
    80000500:	03843583          	ld	a1,56(s0)
    80000504:	00008517          	auipc	a0,0x8
    80000508:	fcc50513          	add	a0,a0,-52 # 800084d0 <rodata_start+0x4d0>
    8000050c:	261020ef          	jal	80002f6c <printf>
    80000510:	03843703          	ld	a4,56(s0)
    80000514:	000027b7          	lui	a5,0x2
    80000518:	80078793          	add	a5,a5,-2048 # 1800 <_entry-0x7fffe800>
    8000051c:	04f70063          	beq	a4,a5,8000055c <test_sys_sbrk+0x124>
    80000520:	00008517          	auipc	a0,0x8
    80000524:	fe850513          	add	a0,a0,-24 # 80008508 <rodata_start+0x508>
    80000528:	5b5020ef          	jal	800032dc <uart_puts>
    8000052c:	00000513          	li	a0,0
    80000530:	3c8060ef          	jal	800068f8 <set_current_proc>
    80000534:	00040513          	mv	a0,s0
    80000538:	2ac060ef          	jal	800067e4 <free_proc>
    8000053c:	01013403          	ld	s0,16(sp)
    80000540:	01813083          	ld	ra,24(sp)
    80000544:	00813483          	ld	s1,8(sp)
    80000548:	00013903          	ld	s2,0(sp)
    8000054c:	00008517          	auipc	a0,0x8
    80000550:	fd450513          	add	a0,a0,-44 # 80008520 <rodata_start+0x520>
    80000554:	02010113          	add	sp,sp,32
    80000558:	5850206f          	j	800032dc <uart_puts>
    8000055c:	00008517          	auipc	a0,0x8
    80000560:	f9450513          	add	a0,a0,-108 # 800084f0 <rodata_start+0x4f0>
    80000564:	579020ef          	jal	800032dc <uart_puts>
    80000568:	fc5ff06f          	j	8000052c <test_sys_sbrk+0xf4>
    8000056c:	00008517          	auipc	a0,0x8
    80000570:	f1450513          	add	a0,a0,-236 # 80008480 <rodata_start+0x480>
    80000574:	569020ef          	jal	800032dc <uart_puts>
    80000578:	f69ff06f          	j	800004e0 <test_sys_sbrk+0xa8>
    8000057c:	01013403          	ld	s0,16(sp)
    80000580:	01813083          	ld	ra,24(sp)
    80000584:	00813483          	ld	s1,8(sp)
    80000588:	00013903          	ld	s2,0(sp)
    8000058c:	00008517          	auipc	a0,0x8
    80000590:	af450513          	add	a0,a0,-1292 # 80008080 <rodata_start+0x80>
    80000594:	02010113          	add	sp,sp,32
    80000598:	5450206f          	j	800032dc <uart_puts>
    8000059c:	598050ef          	jal	80005b34 <alloc_trapframe>
    800005a0:	04a43423          	sd	a0,72(s0)
    800005a4:	eddff06f          	j	80000480 <test_sys_sbrk+0x48>

00000000800005a8 <test_syscall_dispatch>:
    800005a8:	ff010113          	add	sp,sp,-16
    800005ac:	00008517          	auipc	a0,0x8
    800005b0:	f8c50513          	add	a0,a0,-116 # 80008538 <rodata_start+0x538>
    800005b4:	00113423          	sd	ra,8(sp)
    800005b8:	00813023          	sd	s0,0(sp)
    800005bc:	521020ef          	jal	800032dc <uart_puts>
    800005c0:	048060ef          	jal	80006608 <alloc_proc>
    800005c4:	12050463          	beqz	a0,800006ec <test_syscall_dispatch+0x144>
    800005c8:	00300793          	li	a5,3
    800005cc:	00f52223          	sw	a5,4(a0)
    800005d0:	00050413          	mv	s0,a0
    800005d4:	324060ef          	jal	800068f8 <set_current_proc>
    800005d8:	04843783          	ld	a5,72(s0)
    800005dc:	12078463          	beqz	a5,80000704 <test_syscall_dispatch+0x15c>
    800005e0:	00008517          	auipc	a0,0x8
    800005e4:	f9050513          	add	a0,a0,-112 # 80008570 <rodata_start+0x570>
    800005e8:	4f5020ef          	jal	800032dc <uart_puts>
    800005ec:	04843783          	ld	a5,72(s0)
    800005f0:	00b00713          	li	a4,11
    800005f4:	0ae7b423          	sd	a4,168(a5)
    800005f8:	208070ef          	jal	80007800 <syscall>
    800005fc:	04843783          	ld	a5,72(s0)
    80000600:	00842603          	lw	a2,8(s0)
    80000604:	00008517          	auipc	a0,0x8
    80000608:	f8c50513          	add	a0,a0,-116 # 80008590 <rodata_start+0x590>
    8000060c:	0707b583          	ld	a1,112(a5)
    80000610:	15d020ef          	jal	80002f6c <printf>
    80000614:	04843703          	ld	a4,72(s0)
    80000618:	00842783          	lw	a5,8(s0)
    8000061c:	07073703          	ld	a4,112(a4)
    80000620:	0af70663          	beq	a4,a5,800006cc <test_syscall_dispatch+0x124>
    80000624:	00008517          	auipc	a0,0x8
    80000628:	fac50513          	add	a0,a0,-84 # 800085d0 <rodata_start+0x5d0>
    8000062c:	4b1020ef          	jal	800032dc <uart_puts>
    80000630:	00008517          	auipc	a0,0x8
    80000634:	fc050513          	add	a0,a0,-64 # 800085f0 <rodata_start+0x5f0>
    80000638:	4a5020ef          	jal	800032dc <uart_puts>
    8000063c:	04843783          	ld	a5,72(s0)
    80000640:	00e00713          	li	a4,14
    80000644:	0ae7b423          	sd	a4,168(a5)
    80000648:	1b8070ef          	jal	80007800 <syscall>
    8000064c:	04843783          	ld	a5,72(s0)
    80000650:	00008517          	auipc	a0,0x8
    80000654:	fc050513          	add	a0,a0,-64 # 80008610 <rodata_start+0x610>
    80000658:	0707b583          	ld	a1,112(a5)
    8000065c:	111020ef          	jal	80002f6c <printf>
    80000660:	00008517          	auipc	a0,0x8
    80000664:	fd850513          	add	a0,a0,-40 # 80008638 <rodata_start+0x638>
    80000668:	475020ef          	jal	800032dc <uart_puts>
    8000066c:	00008517          	auipc	a0,0x8
    80000670:	fec50513          	add	a0,a0,-20 # 80008658 <rodata_start+0x658>
    80000674:	469020ef          	jal	800032dc <uart_puts>
    80000678:	04843783          	ld	a5,72(s0)
    8000067c:	3e700713          	li	a4,999
    80000680:	0ae7b423          	sd	a4,168(a5)
    80000684:	17c070ef          	jal	80007800 <syscall>
    80000688:	04843703          	ld	a4,72(s0)
    8000068c:	fff00793          	li	a5,-1
    80000690:	07073703          	ld	a4,112(a4)
    80000694:	04f70463          	beq	a4,a5,800006dc <test_syscall_dispatch+0x134>
    80000698:	00008517          	auipc	a0,0x8
    8000069c:	00850513          	add	a0,a0,8 # 800086a0 <rodata_start+0x6a0>
    800006a0:	43d020ef          	jal	800032dc <uart_puts>
    800006a4:	00000513          	li	a0,0
    800006a8:	250060ef          	jal	800068f8 <set_current_proc>
    800006ac:	00040513          	mv	a0,s0
    800006b0:	134060ef          	jal	800067e4 <free_proc>
    800006b4:	00013403          	ld	s0,0(sp)
    800006b8:	00813083          	ld	ra,8(sp)
    800006bc:	00008517          	auipc	a0,0x8
    800006c0:	00c50513          	add	a0,a0,12 # 800086c8 <rodata_start+0x6c8>
    800006c4:	01010113          	add	sp,sp,16
    800006c8:	4150206f          	j	800032dc <uart_puts>
    800006cc:	00008517          	auipc	a0,0x8
    800006d0:	ee450513          	add	a0,a0,-284 # 800085b0 <rodata_start+0x5b0>
    800006d4:	409020ef          	jal	800032dc <uart_puts>
    800006d8:	f59ff06f          	j	80000630 <test_syscall_dispatch+0x88>
    800006dc:	00008517          	auipc	a0,0x8
    800006e0:	f9c50513          	add	a0,a0,-100 # 80008678 <rodata_start+0x678>
    800006e4:	3f9020ef          	jal	800032dc <uart_puts>
    800006e8:	fbdff06f          	j	800006a4 <test_syscall_dispatch+0xfc>
    800006ec:	00013403          	ld	s0,0(sp)
    800006f0:	00813083          	ld	ra,8(sp)
    800006f4:	00008517          	auipc	a0,0x8
    800006f8:	98c50513          	add	a0,a0,-1652 # 80008080 <rodata_start+0x80>
    800006fc:	01010113          	add	sp,sp,16
    80000700:	3dd0206f          	j	800032dc <uart_puts>
    80000704:	430050ef          	jal	80005b34 <alloc_trapframe>
    80000708:	04a43423          	sd	a0,72(s0)
    8000070c:	ed5ff06f          	j	800005e0 <test_syscall_dispatch+0x38>

0000000080000710 <test_arg_functions>:
    80000710:	fb010113          	add	sp,sp,-80
    80000714:	00008517          	auipc	a0,0x8
    80000718:	fcc50513          	add	a0,a0,-52 # 800086e0 <rodata_start+0x6e0>
    8000071c:	04113423          	sd	ra,72(sp)
    80000720:	04813023          	sd	s0,64(sp)
    80000724:	02913c23          	sd	s1,56(sp)
    80000728:	03213823          	sd	s2,48(sp)
    8000072c:	03313423          	sd	s3,40(sp)
    80000730:	03413023          	sd	s4,32(sp)
    80000734:	3a9020ef          	jal	800032dc <uart_puts>
    80000738:	6d1050ef          	jal	80006608 <alloc_proc>
    8000073c:	18050863          	beqz	a0,800008cc <test_arg_functions+0x1bc>
    80000740:	00300793          	li	a5,3
    80000744:	00f52223          	sw	a5,4(a0)
    80000748:	00050413          	mv	s0,a0
    8000074c:	1ac060ef          	jal	800068f8 <set_current_proc>
    80000750:	04843503          	ld	a0,72(s0)
    80000754:	1a050063          	beqz	a0,800008f4 <test_arg_functions+0x1e4>
    80000758:	02a00493          	li	s1,42
    8000075c:	06400913          	li	s2,100
    80000760:	000019b7          	lui	s3,0x1
    80000764:	fff00a13          	li	s4,-1
    80000768:	00010593          	mv	a1,sp
    8000076c:	06953823          	sd	s1,112(a0)
    80000770:	07253c23          	sd	s2,120(a0)
    80000774:	09353023          	sd	s3,128(a0)
    80000778:	09453423          	sd	s4,136(a0)
    8000077c:	00000513          	li	a0,0
    80000780:	559060ef          	jal	800074d8 <argint>
    80000784:	00410593          	add	a1,sp,4
    80000788:	00100513          	li	a0,1
    8000078c:	54d060ef          	jal	800074d8 <argint>
    80000790:	00810593          	add	a1,sp,8
    80000794:	00200513          	li	a0,2
    80000798:	541060ef          	jal	800074d8 <argint>
    8000079c:	00c10593          	add	a1,sp,12
    800007a0:	00300513          	li	a0,3
    800007a4:	535060ef          	jal	800074d8 <argint>
    800007a8:	00012583          	lw	a1,0(sp)
    800007ac:	00008517          	auipc	a0,0x8
    800007b0:	f6c50513          	add	a0,a0,-148 # 80008718 <rodata_start+0x718>
    800007b4:	7b8020ef          	jal	80002f6c <printf>
    800007b8:	00412583          	lw	a1,4(sp)
    800007bc:	00008517          	auipc	a0,0x8
    800007c0:	f7c50513          	add	a0,a0,-132 # 80008738 <rodata_start+0x738>
    800007c4:	7a8020ef          	jal	80002f6c <printf>
    800007c8:	00812583          	lw	a1,8(sp)
    800007cc:	00008517          	auipc	a0,0x8
    800007d0:	f8c50513          	add	a0,a0,-116 # 80008758 <rodata_start+0x758>
    800007d4:	798020ef          	jal	80002f6c <printf>
    800007d8:	00c12583          	lw	a1,12(sp)
    800007dc:	00008517          	auipc	a0,0x8
    800007e0:	f9c50513          	add	a0,a0,-100 # 80008778 <rodata_start+0x778>
    800007e4:	788020ef          	jal	80002f6c <printf>
    800007e8:	00012783          	lw	a5,0(sp)
    800007ec:	00979663          	bne	a5,s1,800007f8 <test_arg_functions+0xe8>
    800007f0:	00412783          	lw	a5,4(sp)
    800007f4:	0b278463          	beq	a5,s2,8000089c <test_arg_functions+0x18c>
    800007f8:	00008517          	auipc	a0,0x8
    800007fc:	fc050513          	add	a0,a0,-64 # 800087b8 <rodata_start+0x7b8>
    80000800:	2dd020ef          	jal	800032dc <uart_puts>
    80000804:	01010593          	add	a1,sp,16
    80000808:	00000513          	li	a0,0
    8000080c:	5ed060ef          	jal	800075f8 <argaddr>
    80000810:	01810593          	add	a1,sp,24
    80000814:	00100513          	li	a0,1
    80000818:	5e1060ef          	jal	800075f8 <argaddr>
    8000081c:	01013583          	ld	a1,16(sp)
    80000820:	00008517          	auipc	a0,0x8
    80000824:	fb850513          	add	a0,a0,-72 # 800087d8 <rodata_start+0x7d8>
    80000828:	744020ef          	jal	80002f6c <printf>
    8000082c:	01813583          	ld	a1,24(sp)
    80000830:	00008517          	auipc	a0,0x8
    80000834:	fd050513          	add	a0,a0,-48 # 80008800 <rodata_start+0x800>
    80000838:	734020ef          	jal	80002f6c <printf>
    8000083c:	01013703          	ld	a4,16(sp)
    80000840:	02a00793          	li	a5,42
    80000844:	00f71863          	bne	a4,a5,80000854 <test_arg_functions+0x144>
    80000848:	01813703          	ld	a4,24(sp)
    8000084c:	06400793          	li	a5,100
    80000850:	06f70663          	beq	a4,a5,800008bc <test_arg_functions+0x1ac>
    80000854:	00008517          	auipc	a0,0x8
    80000858:	ff450513          	add	a0,a0,-12 # 80008848 <rodata_start+0x848>
    8000085c:	281020ef          	jal	800032dc <uart_puts>
    80000860:	00000513          	li	a0,0
    80000864:	094060ef          	jal	800068f8 <set_current_proc>
    80000868:	00040513          	mv	a0,s0
    8000086c:	779050ef          	jal	800067e4 <free_proc>
    80000870:	00008517          	auipc	a0,0x8
    80000874:	ff850513          	add	a0,a0,-8 # 80008868 <rodata_start+0x868>
    80000878:	265020ef          	jal	800032dc <uart_puts>
    8000087c:	04813083          	ld	ra,72(sp)
    80000880:	04013403          	ld	s0,64(sp)
    80000884:	03813483          	ld	s1,56(sp)
    80000888:	03013903          	ld	s2,48(sp)
    8000088c:	02813983          	ld	s3,40(sp)
    80000890:	02013a03          	ld	s4,32(sp)
    80000894:	05010113          	add	sp,sp,80
    80000898:	00008067          	ret
    8000089c:	00812783          	lw	a5,8(sp)
    800008a0:	f5379ce3          	bne	a5,s3,800007f8 <test_arg_functions+0xe8>
    800008a4:	00c12783          	lw	a5,12(sp)
    800008a8:	f54798e3          	bne	a5,s4,800007f8 <test_arg_functions+0xe8>
    800008ac:	00008517          	auipc	a0,0x8
    800008b0:	eec50513          	add	a0,a0,-276 # 80008798 <rodata_start+0x798>
    800008b4:	229020ef          	jal	800032dc <uart_puts>
    800008b8:	f4dff06f          	j	80000804 <test_arg_functions+0xf4>
    800008bc:	00008517          	auipc	a0,0x8
    800008c0:	f6c50513          	add	a0,a0,-148 # 80008828 <rodata_start+0x828>
    800008c4:	219020ef          	jal	800032dc <uart_puts>
    800008c8:	f99ff06f          	j	80000860 <test_arg_functions+0x150>
    800008cc:	04013403          	ld	s0,64(sp)
    800008d0:	04813083          	ld	ra,72(sp)
    800008d4:	03813483          	ld	s1,56(sp)
    800008d8:	03013903          	ld	s2,48(sp)
    800008dc:	02813983          	ld	s3,40(sp)
    800008e0:	02013a03          	ld	s4,32(sp)
    800008e4:	00007517          	auipc	a0,0x7
    800008e8:	79c50513          	add	a0,a0,1948 # 80008080 <rodata_start+0x80>
    800008ec:	05010113          	add	sp,sp,80
    800008f0:	1ed0206f          	j	800032dc <uart_puts>
    800008f4:	240050ef          	jal	80005b34 <alloc_trapframe>
    800008f8:	04a43423          	sd	a0,72(s0)
    800008fc:	e5dff06f          	j	80000758 <test_arg_functions+0x48>

0000000080000900 <test_syscall_performance>:
    80000900:	fe010113          	add	sp,sp,-32
    80000904:	00008517          	auipc	a0,0x8
    80000908:	f7c50513          	add	a0,a0,-132 # 80008880 <rodata_start+0x880>
    8000090c:	00113c23          	sd	ra,24(sp)
    80000910:	00813823          	sd	s0,16(sp)
    80000914:	00913423          	sd	s1,8(sp)
    80000918:	01213023          	sd	s2,0(sp)
    8000091c:	1c1020ef          	jal	800032dc <uart_puts>
    80000920:	4e9050ef          	jal	80006608 <alloc_proc>
    80000924:	0c050263          	beqz	a0,800009e8 <test_syscall_performance+0xe8>
    80000928:	00300793          	li	a5,3
    8000092c:	00f52223          	sw	a5,4(a0)
    80000930:	00050493          	mv	s1,a0
    80000934:	7c5050ef          	jal	800068f8 <set_current_proc>
    80000938:	0484b783          	ld	a5,72(s1)
    8000093c:	0c078663          	beqz	a5,80000a08 <test_syscall_performance+0x108>
    80000940:	00008517          	auipc	a0,0x8
    80000944:	f8050513          	add	a0,a0,-128 # 800088c0 <rodata_start+0x8c0>
    80000948:	195020ef          	jal	800032dc <uart_puts>
    8000094c:	174050ef          	jal	80005ac0 <get_ticks>
    80000950:	00002437          	lui	s0,0x2
    80000954:	00050913          	mv	s2,a0
    80000958:	71040413          	add	s0,s0,1808 # 2710 <_entry-0x7fffd8f0>
    8000095c:	fff4041b          	addw	s0,s0,-1
    80000960:	73c060ef          	jal	8000709c <sys_getpid>
    80000964:	fe041ce3          	bnez	s0,8000095c <test_syscall_performance+0x5c>
    80000968:	158050ef          	jal	80005ac0 <get_ticks>
    8000096c:	41250933          	sub	s2,a0,s2
    80000970:	00090593          	mv	a1,s2
    80000974:	00008517          	auipc	a0,0x8
    80000978:	f7450513          	add	a0,a0,-140 # 800088e8 <rodata_start+0x8e8>
    8000097c:	5f0020ef          	jal	80002f6c <printf>
    80000980:	000027b7          	lui	a5,0x2
    80000984:	71078793          	add	a5,a5,1808 # 2710 <_entry-0x7fffd8f0>
    80000988:	02f97733          	remu	a4,s2,a5
    8000098c:	00008517          	auipc	a0,0x8
    80000990:	f8c50513          	add	a0,a0,-116 # 80008918 <rodata_start+0x918>
    80000994:	00271613          	sll	a2,a4,0x2
    80000998:	00e60633          	add	a2,a2,a4
    8000099c:	00161613          	sll	a2,a2,0x1
    800009a0:	02f955b3          	divu	a1,s2,a5
    800009a4:	02f65633          	divu	a2,a2,a5
    800009a8:	5c4020ef          	jal	80002f6c <printf>
    800009ac:	00008517          	auipc	a0,0x8
    800009b0:	f9450513          	add	a0,a0,-108 # 80008940 <rodata_start+0x940>
    800009b4:	129020ef          	jal	800032dc <uart_puts>
    800009b8:	00000513          	li	a0,0
    800009bc:	73d050ef          	jal	800068f8 <set_current_proc>
    800009c0:	00048513          	mv	a0,s1
    800009c4:	621050ef          	jal	800067e4 <free_proc>
    800009c8:	01013403          	ld	s0,16(sp)
    800009cc:	01813083          	ld	ra,24(sp)
    800009d0:	00813483          	ld	s1,8(sp)
    800009d4:	00013903          	ld	s2,0(sp)
    800009d8:	00008517          	auipc	a0,0x8
    800009dc:	f8050513          	add	a0,a0,-128 # 80008958 <rodata_start+0x958>
    800009e0:	02010113          	add	sp,sp,32
    800009e4:	0f90206f          	j	800032dc <uart_puts>
    800009e8:	01013403          	ld	s0,16(sp)
    800009ec:	01813083          	ld	ra,24(sp)
    800009f0:	00813483          	ld	s1,8(sp)
    800009f4:	00013903          	ld	s2,0(sp)
    800009f8:	00007517          	auipc	a0,0x7
    800009fc:	68850513          	add	a0,a0,1672 # 80008080 <rodata_start+0x80>
    80000a00:	02010113          	add	sp,sp,32
    80000a04:	0d90206f          	j	800032dc <uart_puts>
    80000a08:	12c050ef          	jal	80005b34 <alloc_trapframe>
    80000a0c:	04a4b423          	sd	a0,72(s1)
    80000a10:	f31ff06f          	j	80000940 <test_syscall_performance+0x40>

0000000080000a14 <test_process_memory>:
    80000a14:	fd010113          	add	sp,sp,-48
    80000a18:	00008517          	auipc	a0,0x8
    80000a1c:	f5850513          	add	a0,a0,-168 # 80008970 <rodata_start+0x970>
    80000a20:	02113423          	sd	ra,40(sp)
    80000a24:	02813023          	sd	s0,32(sp)
    80000a28:	00913c23          	sd	s1,24(sp)
    80000a2c:	01213823          	sd	s2,16(sp)
    80000a30:	01313423          	sd	s3,8(sp)
    80000a34:	0a9020ef          	jal	800032dc <uart_puts>
    80000a38:	3d1050ef          	jal	80006608 <alloc_proc>
    80000a3c:	10050663          	beqz	a0,80000b48 <test_process_memory+0x134>
    80000a40:	03053783          	ld	a5,48(a0)
    80000a44:	00050413          	mv	s0,a0
    80000a48:	0c078a63          	beqz	a5,80000b1c <test_process_memory+0x108>
    80000a4c:	00852583          	lw	a1,8(a0)
    80000a50:	00008517          	auipc	a0,0x8
    80000a54:	f7850513          	add	a0,a0,-136 # 800089c8 <rodata_start+0x9c8>
    80000a58:	00002937          	lui	s2,0x2
    80000a5c:	510020ef          	jal	80002f6c <printf>
    80000a60:	03843983          	ld	s3,56(s0)
    80000a64:	03043503          	ld	a0,48(s0)
    80000a68:	01298933          	add	s2,s3,s2
    80000a6c:	00090613          	mv	a2,s2
    80000a70:	00098593          	mv	a1,s3
    80000a74:	7a4040ef          	jal	80005218 <uvmalloc>
    80000a78:	00050493          	mv	s1,a0
    80000a7c:	06a90663          	beq	s2,a0,80000ae8 <test_process_memory+0xd4>
    80000a80:	00008517          	auipc	a0,0x8
    80000a84:	fa050513          	add	a0,a0,-96 # 80008a20 <rodata_start+0xa20>
    80000a88:	055020ef          	jal	800032dc <uart_puts>
    80000a8c:	03843483          	ld	s1,56(s0)
    80000a90:	03043503          	ld	a0,48(s0)
    80000a94:	fffff937          	lui	s2,0xfffff
    80000a98:	01248633          	add	a2,s1,s2
    80000a9c:	00048593          	mv	a1,s1
    80000aa0:	700040ef          	jal	800051a0 <uvmdealloc>
    80000aa4:	03843583          	ld	a1,56(s0)
    80000aa8:	01258933          	add	s2,a1,s2
    80000aac:	04a90c63          	beq	s2,a0,80000b04 <test_process_memory+0xf0>
    80000ab0:	00008517          	auipc	a0,0x8
    80000ab4:	fb850513          	add	a0,a0,-72 # 80008a68 <rodata_start+0xa68>
    80000ab8:	025020ef          	jal	800032dc <uart_puts>
    80000abc:	00040513          	mv	a0,s0
    80000ac0:	525050ef          	jal	800067e4 <free_proc>
    80000ac4:	00008517          	auipc	a0,0x8
    80000ac8:	fbc50513          	add	a0,a0,-68 # 80008a80 <rodata_start+0xa80>
    80000acc:	02013403          	ld	s0,32(sp)
    80000ad0:	02813083          	ld	ra,40(sp)
    80000ad4:	01813483          	ld	s1,24(sp)
    80000ad8:	01013903          	ld	s2,16(sp)
    80000adc:	00813983          	ld	s3,8(sp)
    80000ae0:	03010113          	add	sp,sp,48
    80000ae4:	7f80206f          	j	800032dc <uart_puts>
    80000ae8:	00050613          	mv	a2,a0
    80000aec:	00098593          	mv	a1,s3
    80000af0:	00008517          	auipc	a0,0x8
    80000af4:	f0050513          	add	a0,a0,-256 # 800089f0 <rodata_start+0x9f0>
    80000af8:	474020ef          	jal	80002f6c <printf>
    80000afc:	02943c23          	sd	s1,56(s0)
    80000b00:	f91ff06f          	j	80000a90 <test_process_memory+0x7c>
    80000b04:	00090613          	mv	a2,s2
    80000b08:	00008517          	auipc	a0,0x8
    80000b0c:	f3050513          	add	a0,a0,-208 # 80008a38 <rodata_start+0xa38>
    80000b10:	45c020ef          	jal	80002f6c <printf>
    80000b14:	03243c23          	sd	s2,56(s0)
    80000b18:	fa5ff06f          	j	80000abc <test_process_memory+0xa8>
    80000b1c:	00008517          	auipc	a0,0x8
    80000b20:	e8c50513          	add	a0,a0,-372 # 800089a8 <rodata_start+0x9a8>
    80000b24:	7b8020ef          	jal	800032dc <uart_puts>
    80000b28:	00040513          	mv	a0,s0
    80000b2c:	02013403          	ld	s0,32(sp)
    80000b30:	02813083          	ld	ra,40(sp)
    80000b34:	01813483          	ld	s1,24(sp)
    80000b38:	01013903          	ld	s2,16(sp)
    80000b3c:	00813983          	ld	s3,8(sp)
    80000b40:	03010113          	add	sp,sp,48
    80000b44:	4a10506f          	j	800067e4 <free_proc>
    80000b48:	00008517          	auipc	a0,0x8
    80000b4c:	e4850513          	add	a0,a0,-440 # 80008990 <rodata_start+0x990>
    80000b50:	f7dff06f          	j	80000acc <test_process_memory+0xb8>

0000000080000b54 <test_uid_limits>:
    80000b54:	f5010113          	add	sp,sp,-176
    80000b58:	00008517          	auipc	a0,0x8
    80000b5c:	f5050513          	add	a0,a0,-176 # 80008aa8 <rodata_start+0xaa8>
    80000b60:	0a113423          	sd	ra,168(sp)
    80000b64:	0a813023          	sd	s0,160(sp)
    80000b68:	09213823          	sd	s2,144(sp)
    80000b6c:	08913c23          	sd	s1,152(sp)
    80000b70:	09313423          	sd	s3,136(sp)
    80000b74:	09413023          	sd	s4,128(sp)
    80000b78:	07513c23          	sd	s5,120(sp)
    80000b7c:	07613823          	sd	s6,112(sp)
    80000b80:	07713423          	sd	s7,104(sp)
    80000b84:	07813023          	sd	s8,96(sp)
    80000b88:	05913c23          	sd	s9,88(sp)
    80000b8c:	05a13823          	sd	s10,80(sp)
    80000b90:	74c020ef          	jal	800032dc <uart_puts>
    80000b94:	275050ef          	jal	80006608 <alloc_proc>
    80000b98:	00050413          	mv	s0,a0
    80000b9c:	00000913          	li	s2,0
    80000ba0:	02050063          	beqz	a0,80000bc0 <test_uid_limits+0x6c>
    80000ba4:	01052603          	lw	a2,16(a0)
    80000ba8:	00852583          	lw	a1,8(a0)
    80000bac:	00008517          	auipc	a0,0x8
    80000bb0:	f2450513          	add	a0,a0,-220 # 80008ad0 <rodata_start+0xad0>
    80000bb4:	00100913          	li	s2,1
    80000bb8:	3b4020ef          	jal	80002f6c <printf>
    80000bbc:	00813023          	sd	s0,0(sp)
    80000bc0:	00427b17          	auipc	s6,0x427
    80000bc4:	8a8b0b13          	add	s6,s6,-1880 # 80427468 <current_proc>
    80000bc8:	00100513          	li	a0,1
    80000bcc:	000b3c83          	ld	s9,0(s6)
    80000bd0:	008b3023          	sd	s0,0(s6)
    80000bd4:	549050ef          	jal	8000691c <set_uid>
    80000bd8:	0e050463          	beqz	a0,80000cc0 <test_uid_limits+0x16c>
    80000bdc:	00400593          	li	a1,4
    80000be0:	00008517          	auipc	a0,0x8
    80000be4:	f4850513          	add	a0,a0,-184 # 80008b28 <rodata_start+0xb28>
    80000be8:	00391a13          	sll	s4,s2,0x3
    80000bec:	00200b93          	li	s7,2
    80000bf0:	37c020ef          	jal	80002f6c <printf>
    80000bf4:	01410a33          	add	s4,sp,s4
    80000bf8:	0099099b          	addw	s3,s2,9 # fffffffffffff009 <bss_end+0xffffffff7fbd7b99>
    80000bfc:	412b8bbb          	subw	s7,s7,s2
    80000c00:	00400a93          	li	s5,4
    80000c04:	00008c17          	auipc	s8,0x8
    80000c08:	fd4c0c13          	add	s8,s8,-44 # 80008bd8 <rodata_start+0xbd8>
    80000c0c:	1fd050ef          	jal	80006608 <alloc_proc>
    80000c10:	00050413          	mv	s0,a0
    80000c14:	012b8d3b          	addw	s10,s7,s2
    80000c18:	0a050e63          	beqz	a0,80000cd4 <test_uid_limits+0x180>
    80000c1c:	000b3783          	ld	a5,0(s6)
    80000c20:	0107a503          	lw	a0,16(a5)
    80000c24:	00a42823          	sw	a0,16(s0)
    80000c28:	575050ef          	jal	8000699c <count_user_procs>
    80000c2c:	00050493          	mv	s1,a0
    80000c30:	000d0593          	mv	a1,s10
    80000c34:	000c0513          	mv	a0,s8
    80000c38:	00048713          	mv	a4,s1
    80000c3c:	0a9acc63          	blt	s5,s1,80000cf4 <test_uid_limits+0x1a0>
    80000c40:	01042683          	lw	a3,16(s0)
    80000c44:	00842603          	lw	a2,8(s0)
    80000c48:	008a0a13          	add	s4,s4,8
    80000c4c:	0019091b          	addw	s2,s2,1
    80000c50:	31c020ef          	jal	80002f6c <printf>
    80000c54:	fe8a3c23          	sd	s0,-8(s4)
    80000c58:	0b548e63          	beq	s1,s5,80000d14 <test_uid_limits+0x1c0>
    80000c5c:	fb3918e3          	bne	s2,s3,80000c0c <test_uid_limits+0xb8>
    80000c60:	019b3023          	sd	s9,0(s6)
    80000c64:	00010413          	mv	s0,sp
    80000c68:	00399993          	sll	s3,s3,0x3
    80000c6c:	013409b3          	add	s3,s0,s3
    80000c70:	00043503          	ld	a0,0(s0)
    80000c74:	00840413          	add	s0,s0,8
    80000c78:	36d050ef          	jal	800067e4 <free_proc>
    80000c7c:	ff341ae3          	bne	s0,s3,80000c70 <test_uid_limits+0x11c>
    80000c80:	0a013403          	ld	s0,160(sp)
    80000c84:	0a813083          	ld	ra,168(sp)
    80000c88:	09813483          	ld	s1,152(sp)
    80000c8c:	09013903          	ld	s2,144(sp)
    80000c90:	08813983          	ld	s3,136(sp)
    80000c94:	08013a03          	ld	s4,128(sp)
    80000c98:	07813a83          	ld	s5,120(sp)
    80000c9c:	07013b03          	ld	s6,112(sp)
    80000ca0:	06813b83          	ld	s7,104(sp)
    80000ca4:	06013c03          	ld	s8,96(sp)
    80000ca8:	05813c83          	ld	s9,88(sp)
    80000cac:	05013d03          	ld	s10,80(sp)
    80000cb0:	00008517          	auipc	a0,0x8
    80000cb4:	fa850513          	add	a0,a0,-88 # 80008c58 <rodata_start+0xc58>
    80000cb8:	0b010113          	add	sp,sp,176
    80000cbc:	6200206f          	j	800032dc <uart_puts>
    80000cc0:	00842583          	lw	a1,8(s0)
    80000cc4:	00008517          	auipc	a0,0x8
    80000cc8:	e3450513          	add	a0,a0,-460 # 80008af8 <rodata_start+0xaf8>
    80000ccc:	2a0020ef          	jal	80002f6c <printf>
    80000cd0:	f0dff06f          	j	80000bdc <test_uid_limits+0x88>
    80000cd4:	000d0593          	mv	a1,s10
    80000cd8:	00008517          	auipc	a0,0x8
    80000cdc:	e8850513          	add	a0,a0,-376 # 80008b60 <rodata_start+0xb60>
    80000ce0:	28c020ef          	jal	80002f6c <printf>
    80000ce4:	019b3023          	sd	s9,0(s6)
    80000ce8:	00090993          	mv	s3,s2
    80000cec:	f6091ce3          	bnez	s2,80000c64 <test_uid_limits+0x110>
    80000cf0:	f91ff06f          	j	80000c80 <test_uid_limits+0x12c>
    80000cf4:	01042603          	lw	a2,16(s0)
    80000cf8:	fff4869b          	addw	a3,s1,-1
    80000cfc:	00008517          	auipc	a0,0x8
    80000d00:	e9450513          	add	a0,a0,-364 # 80008b90 <rodata_start+0xb90>
    80000d04:	268020ef          	jal	80002f6c <printf>
    80000d08:	00040513          	mv	a0,s0
    80000d0c:	2d9050ef          	jal	800067e4 <free_proc>
    80000d10:	fd5ff06f          	j	80000ce4 <test_uid_limits+0x190>
    80000d14:	01042583          	lw	a1,16(s0)
    80000d18:	00400613          	li	a2,4
    80000d1c:	00008517          	auipc	a0,0x8
    80000d20:	f0c50513          	add	a0,a0,-244 # 80008c28 <rodata_start+0xc28>
    80000d24:	248020ef          	jal	80002f6c <printf>
    80000d28:	00090993          	mv	s3,s2
    80000d2c:	019b3023          	sd	s9,0(s6)
    80000d30:	f35ff06f          	j	80000c64 <test_uid_limits+0x110>

0000000080000d34 <test_process_allocation>:
    80000d34:	fe010113          	add	sp,sp,-32
    80000d38:	00008517          	auipc	a0,0x8
    80000d3c:	f4050513          	add	a0,a0,-192 # 80008c78 <rodata_start+0xc78>
    80000d40:	00113c23          	sd	ra,24(sp)
    80000d44:	00813823          	sd	s0,16(sp)
    80000d48:	00913423          	sd	s1,8(sp)
    80000d4c:	01213023          	sd	s2,0(sp)
    80000d50:	58c020ef          	jal	800032dc <uart_puts>
    80000d54:	0b5050ef          	jal	80006608 <alloc_proc>
    80000d58:	00050413          	mv	s0,a0
    80000d5c:	0ad050ef          	jal	80006608 <alloc_proc>
    80000d60:	00050493          	mv	s1,a0
    80000d64:	0a5050ef          	jal	80006608 <alloc_proc>
    80000d68:	0a040663          	beqz	s0,80000e14 <test_process_allocation+0xe0>
    80000d6c:	0a048463          	beqz	s1,80000e14 <test_process_allocation+0xe0>
    80000d70:	00050913          	mv	s2,a0
    80000d74:	0a050063          	beqz	a0,80000e14 <test_process_allocation+0xe0>
    80000d78:	00852683          	lw	a3,8(a0)
    80000d7c:	0084a603          	lw	a2,8(s1)
    80000d80:	00842583          	lw	a1,8(s0)
    80000d84:	00008517          	auipc	a0,0x8
    80000d88:	f3450513          	add	a0,a0,-204 # 80008cb8 <rodata_start+0xcb8>
    80000d8c:	1e0020ef          	jal	80002f6c <printf>
    80000d90:	00442783          	lw	a5,4(s0)
    80000d94:	00100713          	li	a4,1
    80000d98:	00e79a63          	bne	a5,a4,80000dac <test_process_allocation+0x78>
    80000d9c:	0044a703          	lw	a4,4(s1)
    80000da0:	00f71663          	bne	a4,a5,80000dac <test_process_allocation+0x78>
    80000da4:	00492783          	lw	a5,4(s2)
    80000da8:	0ae78463          	beq	a5,a4,80000e50 <test_process_allocation+0x11c>
    80000dac:	00008517          	auipc	a0,0x8
    80000db0:	f6c50513          	add	a0,a0,-148 # 80008d18 <rodata_start+0xd18>
    80000db4:	528020ef          	jal	800032dc <uart_puts>
    80000db8:	00040513          	mv	a0,s0
    80000dbc:	229050ef          	jal	800067e4 <free_proc>
    80000dc0:	00048513          	mv	a0,s1
    80000dc4:	221050ef          	jal	800067e4 <free_proc>
    80000dc8:	00090513          	mv	a0,s2
    80000dcc:	219050ef          	jal	800067e4 <free_proc>
    80000dd0:	00442783          	lw	a5,4(s0)
    80000dd4:	00079a63          	bnez	a5,80000de8 <test_process_allocation+0xb4>
    80000dd8:	0044a783          	lw	a5,4(s1)
    80000ddc:	00079663          	bnez	a5,80000de8 <test_process_allocation+0xb4>
    80000de0:	00492783          	lw	a5,4(s2)
    80000de4:	04078e63          	beqz	a5,80000e40 <test_process_allocation+0x10c>
    80000de8:	00008517          	auipc	a0,0x8
    80000dec:	f6050513          	add	a0,a0,-160 # 80008d48 <rodata_start+0xd48>
    80000df0:	4ec020ef          	jal	800032dc <uart_puts>
    80000df4:	01013403          	ld	s0,16(sp)
    80000df8:	01813083          	ld	ra,24(sp)
    80000dfc:	00813483          	ld	s1,8(sp)
    80000e00:	00013903          	ld	s2,0(sp)
    80000e04:	00008517          	auipc	a0,0x8
    80000e08:	f5c50513          	add	a0,a0,-164 # 80008d60 <rodata_start+0xd60>
    80000e0c:	02010113          	add	sp,sp,32
    80000e10:	4cc0206f          	j	800032dc <uart_puts>
    80000e14:	00008517          	auipc	a0,0x8
    80000e18:	b7c50513          	add	a0,a0,-1156 # 80008990 <rodata_start+0x990>
    80000e1c:	4c0020ef          	jal	800032dc <uart_puts>
    80000e20:	01013403          	ld	s0,16(sp)
    80000e24:	01813083          	ld	ra,24(sp)
    80000e28:	00813483          	ld	s1,8(sp)
    80000e2c:	00013903          	ld	s2,0(sp)
    80000e30:	00008517          	auipc	a0,0x8
    80000e34:	f3050513          	add	a0,a0,-208 # 80008d60 <rodata_start+0xd60>
    80000e38:	02010113          	add	sp,sp,32
    80000e3c:	4a00206f          	j	800032dc <uart_puts>
    80000e40:	00008517          	auipc	a0,0x8
    80000e44:	ef050513          	add	a0,a0,-272 # 80008d30 <rodata_start+0xd30>
    80000e48:	494020ef          	jal	800032dc <uart_puts>
    80000e4c:	fd5ff06f          	j	80000e20 <test_process_allocation+0xec>
    80000e50:	00008517          	auipc	a0,0x8
    80000e54:	ea050513          	add	a0,a0,-352 # 80008cf0 <rodata_start+0xcf0>
    80000e58:	484020ef          	jal	800032dc <uart_puts>
    80000e5c:	f5dff06f          	j	80000db8 <test_process_allocation+0x84>

0000000080000e60 <test_process_find>:
    80000e60:	fe010113          	add	sp,sp,-32
    80000e64:	00008517          	auipc	a0,0x8
    80000e68:	f1450513          	add	a0,a0,-236 # 80008d78 <rodata_start+0xd78>
    80000e6c:	00113c23          	sd	ra,24(sp)
    80000e70:	00813823          	sd	s0,16(sp)
    80000e74:	00913423          	sd	s1,8(sp)
    80000e78:	464020ef          	jal	800032dc <uart_puts>
    80000e7c:	78c050ef          	jal	80006608 <alloc_proc>
    80000e80:	08050863          	beqz	a0,80000f10 <test_process_find+0xb0>
    80000e84:	00852483          	lw	s1,8(a0)
    80000e88:	00050413          	mv	s0,a0
    80000e8c:	00008517          	auipc	a0,0x8
    80000e90:	f3c50513          	add	a0,a0,-196 # 80008dc8 <rodata_start+0xdc8>
    80000e94:	00048593          	mv	a1,s1
    80000e98:	0d4020ef          	jal	80002f6c <printf>
    80000e9c:	00048513          	mv	a0,s1
    80000ea0:	151050ef          	jal	800067f0 <find_proc>
    80000ea4:	00050663          	beqz	a0,80000eb0 <test_process_find+0x50>
    80000ea8:	00852783          	lw	a5,8(a0)
    80000eac:	08978063          	beq	a5,s1,80000f2c <test_process_find+0xcc>
    80000eb0:	00008517          	auipc	a0,0x8
    80000eb4:	f5050513          	add	a0,a0,-176 # 80008e00 <rodata_start+0xe00>
    80000eb8:	424020ef          	jal	800032dc <uart_puts>
    80000ebc:	00040513          	mv	a0,s0
    80000ec0:	125050ef          	jal	800067e4 <free_proc>
    80000ec4:	00048513          	mv	a0,s1
    80000ec8:	129050ef          	jal	800067f0 <find_proc>
    80000ecc:	00050663          	beqz	a0,80000ed8 <test_process_find+0x78>
    80000ed0:	00452783          	lw	a5,4(a0)
    80000ed4:	02079663          	bnez	a5,80000f00 <test_process_find+0xa0>
    80000ed8:	00008517          	auipc	a0,0x8
    80000edc:	f4050513          	add	a0,a0,-192 # 80008e18 <rodata_start+0xe18>
    80000ee0:	3fc020ef          	jal	800032dc <uart_puts>
    80000ee4:	01013403          	ld	s0,16(sp)
    80000ee8:	01813083          	ld	ra,24(sp)
    80000eec:	00813483          	ld	s1,8(sp)
    80000ef0:	00008517          	auipc	a0,0x8
    80000ef4:	e7050513          	add	a0,a0,-400 # 80008d60 <rodata_start+0xd60>
    80000ef8:	02010113          	add	sp,sp,32
    80000efc:	3e00206f          	j	800032dc <uart_puts>
    80000f00:	00008517          	auipc	a0,0x8
    80000f04:	f5050513          	add	a0,a0,-176 # 80008e50 <rodata_start+0xe50>
    80000f08:	3d4020ef          	jal	800032dc <uart_puts>
    80000f0c:	fd9ff06f          	j	80000ee4 <test_process_find+0x84>
    80000f10:	01013403          	ld	s0,16(sp)
    80000f14:	01813083          	ld	ra,24(sp)
    80000f18:	00813483          	ld	s1,8(sp)
    80000f1c:	00008517          	auipc	a0,0x8
    80000f20:	e9450513          	add	a0,a0,-364 # 80008db0 <rodata_start+0xdb0>
    80000f24:	02010113          	add	sp,sp,32
    80000f28:	3b40206f          	j	800032dc <uart_puts>
    80000f2c:	00048593          	mv	a1,s1
    80000f30:	00008517          	auipc	a0,0x8
    80000f34:	eb050513          	add	a0,a0,-336 # 80008de0 <rodata_start+0xde0>
    80000f38:	034020ef          	jal	80002f6c <printf>
    80000f3c:	f81ff06f          	j	80000ebc <test_process_find+0x5c>

0000000080000f40 <test_process_state_transition>:
    80000f40:	fe010113          	add	sp,sp,-32
    80000f44:	00008517          	auipc	a0,0x8
    80000f48:	f3c50513          	add	a0,a0,-196 # 80008e80 <rodata_start+0xe80>
    80000f4c:	00113c23          	sd	ra,24(sp)
    80000f50:	00813823          	sd	s0,16(sp)
    80000f54:	00913423          	sd	s1,8(sp)
    80000f58:	384020ef          	jal	800032dc <uart_puts>
    80000f5c:	6ac050ef          	jal	80006608 <alloc_proc>
    80000f60:	0c050a63          	beqz	a0,80001034 <test_process_state_transition+0xf4>
    80000f64:	00452583          	lw	a1,4(a0)
    80000f68:	00050413          	mv	s0,a0
    80000f6c:	00100613          	li	a2,1
    80000f70:	00008517          	auipc	a0,0x8
    80000f74:	f5050513          	add	a0,a0,-176 # 80008ec0 <rodata_start+0xec0>
    80000f78:	7f5010ef          	jal	80002f6c <printf>
    80000f7c:	00040513          	mv	a0,s0
    80000f80:	0dd050ef          	jal	8000685c <proc_mark_runnable>
    80000f84:	00442703          	lw	a4,4(s0)
    80000f88:	00200793          	li	a5,2
    80000f8c:	0cf70263          	beq	a4,a5,80001050 <test_process_state_transition+0x110>
    80000f90:	00300793          	li	a5,3
    80000f94:	000014b7          	lui	s1,0x1
    80000f98:	00f42223          	sw	a5,4(s0)
    80000f9c:	23448593          	add	a1,s1,564 # 1234 <_entry-0x7fffedcc>
    80000fa0:	00040513          	mv	a0,s0
    80000fa4:	0e1050ef          	jal	80006884 <proc_mark_sleeping>
    80000fa8:	00442583          	lw	a1,4(s0)
    80000fac:	00400793          	li	a5,4
    80000fb0:	00f59863          	bne	a1,a5,80000fc0 <test_process_state_transition+0x80>
    80000fb4:	0d043783          	ld	a5,208(s0)
    80000fb8:	23448493          	add	s1,s1,564
    80000fbc:	06978463          	beq	a5,s1,80001024 <test_process_state_transition+0xe4>
    80000fc0:	00008517          	auipc	a0,0x8
    80000fc4:	f6050513          	add	a0,a0,-160 # 80008f20 <rodata_start+0xf20>
    80000fc8:	7a5010ef          	jal	80002f6c <printf>
    80000fcc:	02a00593          	li	a1,42
    80000fd0:	00040513          	mv	a0,s0
    80000fd4:	0d5050ef          	jal	800068a8 <proc_mark_zombie>
    80000fd8:	00442703          	lw	a4,4(s0)
    80000fdc:	00500793          	li	a5,5
    80000fe0:	02f70463          	beq	a4,a5,80001008 <test_process_state_transition+0xc8>
    80000fe4:	00040513          	mv	a0,s0
    80000fe8:	7fc050ef          	jal	800067e4 <free_proc>
    80000fec:	01013403          	ld	s0,16(sp)
    80000ff0:	01813083          	ld	ra,24(sp)
    80000ff4:	00813483          	ld	s1,8(sp)
    80000ff8:	00008517          	auipc	a0,0x8
    80000ffc:	d6850513          	add	a0,a0,-664 # 80008d60 <rodata_start+0xd60>
    80001000:	02010113          	add	sp,sp,32
    80001004:	2d80206f          	j	800032dc <uart_puts>
    80001008:	02442703          	lw	a4,36(s0)
    8000100c:	02a00793          	li	a5,42
    80001010:	fcf71ae3          	bne	a4,a5,80000fe4 <test_process_state_transition+0xa4>
    80001014:	00008517          	auipc	a0,0x8
    80001018:	f3c50513          	add	a0,a0,-196 # 80008f50 <rodata_start+0xf50>
    8000101c:	2c0020ef          	jal	800032dc <uart_puts>
    80001020:	fc5ff06f          	j	80000fe4 <test_process_state_transition+0xa4>
    80001024:	00008517          	auipc	a0,0x8
    80001028:	edc50513          	add	a0,a0,-292 # 80008f00 <rodata_start+0xf00>
    8000102c:	2b0020ef          	jal	800032dc <uart_puts>
    80001030:	f9dff06f          	j	80000fcc <test_process_state_transition+0x8c>
    80001034:	01013403          	ld	s0,16(sp)
    80001038:	01813083          	ld	ra,24(sp)
    8000103c:	00813483          	ld	s1,8(sp)
    80001040:	00008517          	auipc	a0,0x8
    80001044:	d7050513          	add	a0,a0,-656 # 80008db0 <rodata_start+0xdb0>
    80001048:	02010113          	add	sp,sp,32
    8000104c:	2900206f          	j	800032dc <uart_puts>
    80001050:	00008517          	auipc	a0,0x8
    80001054:	e9050513          	add	a0,a0,-368 # 80008ee0 <rodata_start+0xee0>
    80001058:	284020ef          	jal	800032dc <uart_puts>
    8000105c:	f35ff06f          	j	80000f90 <test_process_state_transition+0x50>

0000000080001060 <test_simple_fork>:
    80001060:	fe010113          	add	sp,sp,-32
    80001064:	00008517          	auipc	a0,0x8
    80001068:	f0c50513          	add	a0,a0,-244 # 80008f70 <rodata_start+0xf70>
    8000106c:	00113c23          	sd	ra,24(sp)
    80001070:	00813823          	sd	s0,16(sp)
    80001074:	00913423          	sd	s1,8(sp)
    80001078:	264020ef          	jal	800032dc <uart_puts>
    8000107c:	58c050ef          	jal	80006608 <alloc_proc>
    80001080:	0a050463          	beqz	a0,80001128 <test_simple_fork+0xc8>
    80001084:	00300793          	li	a5,3
    80001088:	00f52223          	sw	a5,4(a0)
    8000108c:	00050413          	mv	s0,a0
    80001090:	069050ef          	jal	800068f8 <set_current_proc>
    80001094:	00842583          	lw	a1,8(s0)
    80001098:	00008517          	auipc	a0,0x8
    8000109c:	f3850513          	add	a0,a0,-200 # 80008fd0 <rodata_start+0xfd0>
    800010a0:	6cd010ef          	jal	80002f6c <printf>
    800010a4:	3ad050ef          	jal	80006c50 <fork>
    800010a8:	00050493          	mv	s1,a0
    800010ac:	06a05663          	blez	a0,80001118 <test_simple_fork+0xb8>
    800010b0:	00050593          	mv	a1,a0
    800010b4:	00008517          	auipc	a0,0x8
    800010b8:	f3450513          	add	a0,a0,-204 # 80008fe8 <rodata_start+0xfe8>
    800010bc:	6b1010ef          	jal	80002f6c <printf>
    800010c0:	00048513          	mv	a0,s1
    800010c4:	72c050ef          	jal	800067f0 <find_proc>
    800010c8:	00050493          	mv	s1,a0
    800010cc:	02050063          	beqz	a0,800010ec <test_simple_fork+0x8c>
    800010d0:	0c853783          	ld	a5,200(a0)
    800010d4:	06878863          	beq	a5,s0,80001144 <test_simple_fork+0xe4>
    800010d8:	0044a703          	lw	a4,4(s1)
    800010dc:	00200793          	li	a5,2
    800010e0:	08f70063          	beq	a4,a5,80001160 <test_simple_fork+0x100>
    800010e4:	00048513          	mv	a0,s1
    800010e8:	6fc050ef          	jal	800067e4 <free_proc>
    800010ec:	00040513          	mv	a0,s0
    800010f0:	6f4050ef          	jal	800067e4 <free_proc>
    800010f4:	00000513          	li	a0,0
    800010f8:	001050ef          	jal	800068f8 <set_current_proc>
    800010fc:	01013403          	ld	s0,16(sp)
    80001100:	01813083          	ld	ra,24(sp)
    80001104:	00813483          	ld	s1,8(sp)
    80001108:	00008517          	auipc	a0,0x8
    8000110c:	c5850513          	add	a0,a0,-936 # 80008d60 <rodata_start+0xd60>
    80001110:	02010113          	add	sp,sp,32
    80001114:	1c80206f          	j	800032dc <uart_puts>
    80001118:	00008517          	auipc	a0,0x8
    8000111c:	f3850513          	add	a0,a0,-200 # 80009050 <rodata_start+0x1050>
    80001120:	1bc020ef          	jal	800032dc <uart_puts>
    80001124:	fc9ff06f          	j	800010ec <test_simple_fork+0x8c>
    80001128:	01013403          	ld	s0,16(sp)
    8000112c:	01813083          	ld	ra,24(sp)
    80001130:	00813483          	ld	s1,8(sp)
    80001134:	00008517          	auipc	a0,0x8
    80001138:	e7c50513          	add	a0,a0,-388 # 80008fb0 <rodata_start+0xfb0>
    8000113c:	02010113          	add	sp,sp,32
    80001140:	19c0206f          	j	800032dc <uart_puts>
    80001144:	00c52703          	lw	a4,12(a0)
    80001148:	00842783          	lw	a5,8(s0)
    8000114c:	f8f716e3          	bne	a4,a5,800010d8 <test_simple_fork+0x78>
    80001150:	00008517          	auipc	a0,0x8
    80001154:	ec050513          	add	a0,a0,-320 # 80009010 <rodata_start+0x1010>
    80001158:	184020ef          	jal	800032dc <uart_puts>
    8000115c:	f7dff06f          	j	800010d8 <test_simple_fork+0x78>
    80001160:	00008517          	auipc	a0,0x8
    80001164:	ed050513          	add	a0,a0,-304 # 80009030 <rodata_start+0x1030>
    80001168:	174020ef          	jal	800032dc <uart_puts>
    8000116c:	f79ff06f          	j	800010e4 <test_simple_fork+0x84>

0000000080001170 <test_scheduler_basic>:
    80001170:	fb010113          	add	sp,sp,-80
    80001174:	04813023          	sd	s0,64(sp)
    80001178:	00008517          	auipc	a0,0x8
    8000117c:	ee850513          	add	a0,a0,-280 # 80009060 <rodata_start+0x1060>
    80001180:	00810413          	add	s0,sp,8
    80001184:	02913c23          	sd	s1,56(sp)
    80001188:	03213823          	sd	s2,48(sp)
    8000118c:	03313423          	sd	s3,40(sp)
    80001190:	03413023          	sd	s4,32(sp)
    80001194:	04113423          	sd	ra,72(sp)
    80001198:	02010913          	add	s2,sp,32
    8000119c:	140020ef          	jal	800032dc <uart_puts>
    800011a0:	00040493          	mv	s1,s0
    800011a4:	00200a13          	li	s4,2
    800011a8:	00008997          	auipc	s3,0x8
    800011ac:	ef898993          	add	s3,s3,-264 # 800090a0 <rodata_start+0x10a0>
    800011b0:	458050ef          	jal	80006608 <alloc_proc>
    800011b4:	00a4b023          	sd	a0,0(s1)
    800011b8:	00050793          	mv	a5,a0
    800011bc:	00848493          	add	s1,s1,8
    800011c0:	00098513          	mv	a0,s3
    800011c4:	00078863          	beqz	a5,800011d4 <test_scheduler_basic+0x64>
    800011c8:	0087a583          	lw	a1,8(a5)
    800011cc:	0147a223          	sw	s4,4(a5)
    800011d0:	59d010ef          	jal	80002f6c <printf>
    800011d4:	fd249ee3          	bne	s1,s2,800011b0 <test_scheduler_basic+0x40>
    800011d8:	00425797          	auipc	a5,0x425
    800011dc:	44478793          	add	a5,a5,1092 # 8042661c <proc+0x4>
    800011e0:	00426617          	auipc	a2,0x426
    800011e4:	23c60613          	add	a2,a2,572 # 8042741c <tickslock+0x4>
    800011e8:	00000593          	li	a1,0
    800011ec:	00200693          	li	a3,2
    800011f0:	0007a703          	lw	a4,0(a5)
    800011f4:	0e078793          	add	a5,a5,224
    800011f8:	04d70863          	beq	a4,a3,80001248 <test_scheduler_basic+0xd8>
    800011fc:	fec79ae3          	bne	a5,a2,800011f0 <test_scheduler_basic+0x80>
    80001200:	00008517          	auipc	a0,0x8
    80001204:	eb850513          	add	a0,a0,-328 # 800090b8 <rodata_start+0x10b8>
    80001208:	565010ef          	jal	80002f6c <printf>
    8000120c:	00043503          	ld	a0,0(s0)
    80001210:	00840413          	add	s0,s0,8
    80001214:	00050463          	beqz	a0,8000121c <test_scheduler_basic+0xac>
    80001218:	5cc050ef          	jal	800067e4 <free_proc>
    8000121c:	ff2418e3          	bne	s0,s2,8000120c <test_scheduler_basic+0x9c>
    80001220:	04013403          	ld	s0,64(sp)
    80001224:	04813083          	ld	ra,72(sp)
    80001228:	03813483          	ld	s1,56(sp)
    8000122c:	03013903          	ld	s2,48(sp)
    80001230:	02813983          	ld	s3,40(sp)
    80001234:	02013a03          	ld	s4,32(sp)
    80001238:	00008517          	auipc	a0,0x8
    8000123c:	b2850513          	add	a0,a0,-1240 # 80008d60 <rodata_start+0xd60>
    80001240:	05010113          	add	sp,sp,80
    80001244:	0980206f          	j	800032dc <uart_puts>
    80001248:	0015859b          	addw	a1,a1,1
    8000124c:	fac792e3          	bne	a5,a2,800011f0 <test_scheduler_basic+0x80>
    80001250:	fb1ff06f          	j	80001200 <test_scheduler_basic+0x90>

0000000080001254 <run_process_management_tests>:
    80001254:	ff010113          	add	sp,sp,-16
    80001258:	00008517          	auipc	a0,0x8
    8000125c:	cf050513          	add	a0,a0,-784 # 80008f48 <rodata_start+0xf48>
    80001260:	00113423          	sd	ra,8(sp)
    80001264:	078020ef          	jal	800032dc <uart_puts>
    80001268:	00008517          	auipc	a0,0x8
    8000126c:	e7850513          	add	a0,a0,-392 # 800090e0 <rodata_start+0x10e0>
    80001270:	06c020ef          	jal	800032dc <uart_puts>
    80001274:	00008517          	auipc	a0,0x8
    80001278:	f3450513          	add	a0,a0,-204 # 800091a8 <rodata_start+0x11a8>
    8000127c:	060020ef          	jal	800032dc <uart_puts>
    80001280:	00008517          	auipc	a0,0x8
    80001284:	f8850513          	add	a0,a0,-120 # 80009208 <rodata_start+0x1208>
    80001288:	054020ef          	jal	800032dc <uart_puts>
    8000128c:	aa9ff0ef          	jal	80000d34 <test_process_allocation>
    80001290:	bd1ff0ef          	jal	80000e60 <test_process_find>
    80001294:	cadff0ef          	jal	80000f40 <test_process_state_transition>
    80001298:	dc9ff0ef          	jal	80001060 <test_simple_fork>
    8000129c:	ed5ff0ef          	jal	80001170 <test_scheduler_basic>
    800012a0:	00008517          	auipc	a0,0x8
    800012a4:	ca850513          	add	a0,a0,-856 # 80008f48 <rodata_start+0xf48>
    800012a8:	034020ef          	jal	800032dc <uart_puts>
    800012ac:	00008517          	auipc	a0,0x8
    800012b0:	e3450513          	add	a0,a0,-460 # 800090e0 <rodata_start+0x10e0>
    800012b4:	028020ef          	jal	800032dc <uart_puts>
    800012b8:	00008517          	auipc	a0,0x8
    800012bc:	01850513          	add	a0,a0,24 # 800092d0 <rodata_start+0x12d0>
    800012c0:	01c020ef          	jal	800032dc <uart_puts>
    800012c4:	00008517          	auipc	a0,0x8
    800012c8:	06450513          	add	a0,a0,100 # 80009328 <rodata_start+0x1328>
    800012cc:	010020ef          	jal	800032dc <uart_puts>
    800012d0:	00008517          	auipc	a0,0x8
    800012d4:	12850513          	add	a0,a0,296 # 800093f8 <rodata_start+0x13f8>
    800012d8:	004020ef          	jal	800032dc <uart_puts>
    800012dc:	00008517          	auipc	a0,0x8
    800012e0:	13450513          	add	a0,a0,308 # 80009410 <rodata_start+0x1410>
    800012e4:	7f9010ef          	jal	800032dc <uart_puts>
    800012e8:	00008517          	auipc	a0,0x8
    800012ec:	15850513          	add	a0,a0,344 # 80009440 <rodata_start+0x1440>
    800012f0:	7ed010ef          	jal	800032dc <uart_puts>
    800012f4:	00008517          	auipc	a0,0x8
    800012f8:	16c50513          	add	a0,a0,364 # 80009460 <rodata_start+0x1460>
    800012fc:	7e1010ef          	jal	800032dc <uart_puts>
    80001300:	00008517          	auipc	a0,0x8
    80001304:	18050513          	add	a0,a0,384 # 80009480 <rodata_start+0x1480>
    80001308:	7d5010ef          	jal	800032dc <uart_puts>
    8000130c:	00813083          	ld	ra,8(sp)
    80001310:	00008517          	auipc	a0,0x8
    80001314:	1a050513          	add	a0,a0,416 # 800094b0 <rodata_start+0x14b0>
    80001318:	01010113          	add	sp,sp,16
    8000131c:	7c10106f          	j	800032dc <uart_puts>

0000000080001320 <test_round_robin_scheduler>:
    80001320:	fa010113          	add	sp,sp,-96
    80001324:	04813823          	sd	s0,80(sp)
    80001328:	00008517          	auipc	a0,0x8
    8000132c:	1a850513          	add	a0,a0,424 # 800094d0 <rodata_start+0x14d0>
    80001330:	00810413          	add	s0,sp,8
    80001334:	04913423          	sd	s1,72(sp)
    80001338:	05213023          	sd	s2,64(sp)
    8000133c:	03313c23          	sd	s3,56(sp)
    80001340:	03413823          	sd	s4,48(sp)
    80001344:	03513423          	sd	s5,40(sp)
    80001348:	03613023          	sd	s6,32(sp)
    8000134c:	04113c23          	sd	ra,88(sp)
    80001350:	00040913          	mv	s2,s0
    80001354:	789010ef          	jal	800032dc <uart_puts>
    80001358:	00000493          	li	s1,0
    8000135c:	fffffb17          	auipc	s6,0xfffff
    80001360:	d24b0b13          	add	s6,s6,-732 # 80000080 <rr_worker>
    80001364:	00200a93          	li	s5,2
    80001368:	00008a17          	auipc	s4,0x8
    8000136c:	1d0a0a13          	add	s4,s4,464 # 80009538 <rodata_start+0x1538>
    80001370:	00300993          	li	s3,3
    80001374:	294050ef          	jal	80006608 <alloc_proc>
    80001378:	00050793          	mv	a5,a0
    8000137c:	00a93023          	sd	a0,0(s2)
    80001380:	000a0513          	mv	a0,s4
    80001384:	06078c63          	beqz	a5,800013fc <test_round_robin_scheduler+0xdc>
    80001388:	0087a583          	lw	a1,8(a5)
    8000138c:	0567bc23          	sd	s6,88(a5)
    80001390:	0157a223          	sw	s5,4(a5)
    80001394:	3d9010ef          	jal	80002f6c <printf>
    80001398:	0014849b          	addw	s1,s1,1
    8000139c:	00890913          	add	s2,s2,8
    800013a0:	fd349ae3          	bne	s1,s3,80001374 <test_round_robin_scheduler+0x54>
    800013a4:	00008517          	auipc	a0,0x8
    800013a8:	1b450513          	add	a0,a0,436 # 80009558 <rodata_start+0x1558>
    800013ac:	731010ef          	jal	800032dc <uart_puts>
    800013b0:	01840493          	add	s1,s0,24
    800013b4:	6ac050ef          	jal	80006a60 <scheduler>
    800013b8:	00043503          	ld	a0,0(s0)
    800013bc:	00840413          	add	s0,s0,8
    800013c0:	00050463          	beqz	a0,800013c8 <test_round_robin_scheduler+0xa8>
    800013c4:	420050ef          	jal	800067e4 <free_proc>
    800013c8:	fe9418e3          	bne	s0,s1,800013b8 <test_round_robin_scheduler+0x98>
    800013cc:	05013403          	ld	s0,80(sp)
    800013d0:	05813083          	ld	ra,88(sp)
    800013d4:	04813483          	ld	s1,72(sp)
    800013d8:	04013903          	ld	s2,64(sp)
    800013dc:	03813983          	ld	s3,56(sp)
    800013e0:	03013a03          	ld	s4,48(sp)
    800013e4:	02813a83          	ld	s5,40(sp)
    800013e8:	02013b03          	ld	s6,32(sp)
    800013ec:	00008517          	auipc	a0,0x8
    800013f0:	1ac50513          	add	a0,a0,428 # 80009598 <rodata_start+0x1598>
    800013f4:	06010113          	add	sp,sp,96
    800013f8:	6e50106f          	j	800032dc <uart_puts>
    800013fc:	00048593          	mv	a1,s1
    80001400:	00008517          	auipc	a0,0x8
    80001404:	11850513          	add	a0,a0,280 # 80009518 <rodata_start+0x1518>
    80001408:	365010ef          	jal	80002f6c <printf>
    8000140c:	f8dff06f          	j	80001398 <test_round_robin_scheduler+0x78>

0000000080001410 <test_trap_initialization>:
    80001410:	ff010113          	add	sp,sp,-16
    80001414:	00008517          	auipc	a0,0x8
    80001418:	1ac50513          	add	a0,a0,428 # 800095c0 <rodata_start+0x15c0>
    8000141c:	00113423          	sd	ra,8(sp)
    80001420:	00813023          	sd	s0,0(sp)
    80001424:	6b9010ef          	jal	800032dc <uart_puts>
    80001428:	7ec040ef          	jal	80005c14 <trap_init>
    8000142c:	099040ef          	jal	80005cc4 <trap_init_hart>
    80001430:	10502473          	csrr	s0,stvec
    80001434:	00008517          	auipc	a0,0x8
    80001438:	1cc50513          	add	a0,a0,460 # 80009600 <rodata_start+0x1600>
    8000143c:	00040593          	mv	a1,s0
    80001440:	32d010ef          	jal	80002f6c <printf>
    80001444:	02040c63          	beqz	s0,8000147c <test_trap_initialization+0x6c>
    80001448:	00008517          	auipc	a0,0x8
    8000144c:	1d850513          	add	a0,a0,472 # 80009620 <rodata_start+0x1620>
    80001450:	68d010ef          	jal	800032dc <uart_puts>
    80001454:	104025f3          	csrr	a1,sie
    80001458:	00008517          	auipc	a0,0x8
    8000145c:	21050513          	add	a0,a0,528 # 80009668 <rodata_start+0x1668>
    80001460:	30d010ef          	jal	80002f6c <printf>
    80001464:	00013403          	ld	s0,0(sp)
    80001468:	00813083          	ld	ra,8(sp)
    8000146c:	00007517          	auipc	a0,0x7
    80001470:	cac50513          	add	a0,a0,-852 # 80008118 <rodata_start+0x118>
    80001474:	01010113          	add	sp,sp,16
    80001478:	6650106f          	j	800032dc <uart_puts>
    8000147c:	00008517          	auipc	a0,0x8
    80001480:	1c450513          	add	a0,a0,452 # 80009640 <rodata_start+0x1640>
    80001484:	659010ef          	jal	800032dc <uart_puts>
    80001488:	fcdff06f          	j	80001454 <test_trap_initialization+0x44>

000000008000148c <test_interrupt_control>:
    8000148c:	ff010113          	add	sp,sp,-16
    80001490:	00008517          	auipc	a0,0x8
    80001494:	20850513          	add	a0,a0,520 # 80009698 <rodata_start+0x1698>
    80001498:	00113423          	sd	ra,8(sp)
    8000149c:	00813023          	sd	s0,0(sp)
    800014a0:	63d010ef          	jal	800032dc <uart_puts>
    800014a4:	00008517          	auipc	a0,0x8
    800014a8:	23450513          	add	a0,a0,564 # 800096d8 <rodata_start+0x16d8>
    800014ac:	631010ef          	jal	800032dc <uart_puts>
    800014b0:	738040ef          	jal	80005be8 <intr_off>
    800014b4:	744040ef          	jal	80005bf8 <intr_get>
    800014b8:	00050413          	mv	s0,a0
    800014bc:	00050593          	mv	a1,a0
    800014c0:	00008517          	auipc	a0,0x8
    800014c4:	23050513          	add	a0,a0,560 # 800096f0 <rodata_start+0x16f0>
    800014c8:	2a5010ef          	jal	80002f6c <printf>
    800014cc:	06041063          	bnez	s0,8000152c <test_interrupt_control+0xa0>
    800014d0:	00008517          	auipc	a0,0x8
    800014d4:	24050513          	add	a0,a0,576 # 80009710 <rodata_start+0x1710>
    800014d8:	605010ef          	jal	800032dc <uart_puts>
    800014dc:	00008517          	auipc	a0,0x8
    800014e0:	26450513          	add	a0,a0,612 # 80009740 <rodata_start+0x1740>
    800014e4:	5f9010ef          	jal	800032dc <uart_puts>
    800014e8:	6f0040ef          	jal	80005bd8 <intr_on>
    800014ec:	70c040ef          	jal	80005bf8 <intr_get>
    800014f0:	00050413          	mv	s0,a0
    800014f4:	00050593          	mv	a1,a0
    800014f8:	00008517          	auipc	a0,0x8
    800014fc:	26050513          	add	a0,a0,608 # 80009758 <rodata_start+0x1758>
    80001500:	26d010ef          	jal	80002f6c <printf>
    80001504:	02040c63          	beqz	s0,8000153c <test_interrupt_control+0xb0>
    80001508:	00008517          	auipc	a0,0x8
    8000150c:	27050513          	add	a0,a0,624 # 80009778 <rodata_start+0x1778>
    80001510:	5cd010ef          	jal	800032dc <uart_puts>
    80001514:	00013403          	ld	s0,0(sp)
    80001518:	00813083          	ld	ra,8(sp)
    8000151c:	00007517          	auipc	a0,0x7
    80001520:	ce450513          	add	a0,a0,-796 # 80008200 <rodata_start+0x200>
    80001524:	01010113          	add	sp,sp,16
    80001528:	5b50106f          	j	800032dc <uart_puts>
    8000152c:	00008517          	auipc	a0,0x8
    80001530:	1fc50513          	add	a0,a0,508 # 80009728 <rodata_start+0x1728>
    80001534:	5a9010ef          	jal	800032dc <uart_puts>
    80001538:	fa5ff06f          	j	800014dc <test_interrupt_control+0x50>
    8000153c:	00008517          	auipc	a0,0x8
    80001540:	25450513          	add	a0,a0,596 # 80009790 <rodata_start+0x1790>
    80001544:	599010ef          	jal	800032dc <uart_puts>
    80001548:	00013403          	ld	s0,0(sp)
    8000154c:	00813083          	ld	ra,8(sp)
    80001550:	00007517          	auipc	a0,0x7
    80001554:	cb050513          	add	a0,a0,-848 # 80008200 <rodata_start+0x200>
    80001558:	01010113          	add	sp,sp,16
    8000155c:	5810106f          	j	800032dc <uart_puts>

0000000080001560 <test_trapframe_allocation>:
    80001560:	fe010113          	add	sp,sp,-32
    80001564:	00008517          	auipc	a0,0x8
    80001568:	24450513          	add	a0,a0,580 # 800097a8 <rodata_start+0x17a8>
    8000156c:	00113c23          	sd	ra,24(sp)
    80001570:	00813823          	sd	s0,16(sp)
    80001574:	00913423          	sd	s1,8(sp)
    80001578:	01213023          	sd	s2,0(sp)
    8000157c:	561010ef          	jal	800032dc <uart_puts>
    80001580:	00008517          	auipc	a0,0x8
    80001584:	26850513          	add	a0,a0,616 # 800097e8 <rodata_start+0x17e8>
    80001588:	555010ef          	jal	800032dc <uart_puts>
    8000158c:	5a8040ef          	jal	80005b34 <alloc_trapframe>
    80001590:	00050413          	mv	s0,a0
    80001594:	5a0040ef          	jal	80005b34 <alloc_trapframe>
    80001598:	00050493          	mv	s1,a0
    8000159c:	598040ef          	jal	80005b34 <alloc_trapframe>
    800015a0:	10040863          	beqz	s0,800016b0 <test_trapframe_allocation+0x150>
    800015a4:	10048663          	beqz	s1,800016b0 <test_trapframe_allocation+0x150>
    800015a8:	00050913          	mv	s2,a0
    800015ac:	10050263          	beqz	a0,800016b0 <test_trapframe_allocation+0x150>
    800015b0:	00008517          	auipc	a0,0x8
    800015b4:	25050513          	add	a0,a0,592 # 80009800 <rodata_start+0x1800>
    800015b8:	1b5010ef          	jal	80002f6c <printf>
    800015bc:	00040593          	mv	a1,s0
    800015c0:	00008517          	auipc	a0,0x8
    800015c4:	26050513          	add	a0,a0,608 # 80009820 <rodata_start+0x1820>
    800015c8:	1a5010ef          	jal	80002f6c <printf>
    800015cc:	00048593          	mv	a1,s1
    800015d0:	00008517          	auipc	a0,0x8
    800015d4:	26050513          	add	a0,a0,608 # 80009830 <rodata_start+0x1830>
    800015d8:	195010ef          	jal	80002f6c <printf>
    800015dc:	00090593          	mv	a1,s2
    800015e0:	00008517          	auipc	a0,0x8
    800015e4:	26050513          	add	a0,a0,608 # 80009840 <rodata_start+0x1840>
    800015e8:	185010ef          	jal	80002f6c <printf>
    800015ec:	00940463          	beq	s0,s1,800015f4 <test_trapframe_allocation+0x94>
    800015f0:	0f249663          	bne	s1,s2,800016dc <test_trapframe_allocation+0x17c>
    800015f4:	00008517          	auipc	a0,0x8
    800015f8:	27c50513          	add	a0,a0,636 # 80009870 <rodata_start+0x1870>
    800015fc:	4e1010ef          	jal	800032dc <uart_puts>
    80001600:	00008517          	auipc	a0,0x8
    80001604:	2a050513          	add	a0,a0,672 # 800098a0 <rodata_start+0x18a0>
    80001608:	4d5010ef          	jal	800032dc <uart_puts>
    8000160c:	21d957b7          	lui	a5,0x21d95
    80001610:	00279793          	sll	a5,a5,0x2
    80001614:	32178793          	add	a5,a5,801 # 21d95321 <_entry-0x5e26acdf>
    80001618:	12345737          	lui	a4,0x12345
    8000161c:	67870713          	add	a4,a4,1656 # 12345678 <_entry-0x6dcba988>
    80001620:	02f43823          	sd	a5,48(s0)
    80001624:	02a00793          	li	a5,42
    80001628:	02e43423          	sd	a4,40(s0)
    8000162c:	06f43823          	sd	a5,112(s0)
    80001630:	00008517          	auipc	a0,0x8
    80001634:	29050513          	add	a0,a0,656 # 800098c0 <rodata_start+0x18c0>
    80001638:	4a5010ef          	jal	800032dc <uart_puts>
    8000163c:	00008517          	auipc	a0,0x8
    80001640:	2a450513          	add	a0,a0,676 # 800098e0 <rodata_start+0x18e0>
    80001644:	499010ef          	jal	800032dc <uart_puts>
    80001648:	00040513          	mv	a0,s0
    8000164c:	548040ef          	jal	80005b94 <free_trapframe>
    80001650:	00048513          	mv	a0,s1
    80001654:	540040ef          	jal	80005b94 <free_trapframe>
    80001658:	00090513          	mv	a0,s2
    8000165c:	538040ef          	jal	80005b94 <free_trapframe>
    80001660:	00008517          	auipc	a0,0x8
    80001664:	29850513          	add	a0,a0,664 # 800098f8 <rodata_start+0x18f8>
    80001668:	475010ef          	jal	800032dc <uart_puts>
    8000166c:	4c8040ef          	jal	80005b34 <alloc_trapframe>
    80001670:	00050413          	mv	s0,a0
    80001674:	04050463          	beqz	a0,800016bc <test_trapframe_allocation+0x15c>
    80001678:	00050593          	mv	a1,a0
    8000167c:	00008517          	auipc	a0,0x8
    80001680:	29c50513          	add	a0,a0,668 # 80009918 <rodata_start+0x1918>
    80001684:	0e9010ef          	jal	80002f6c <printf>
    80001688:	00040513          	mv	a0,s0
    8000168c:	508040ef          	jal	80005b94 <free_trapframe>
    80001690:	01013403          	ld	s0,16(sp)
    80001694:	01813083          	ld	ra,24(sp)
    80001698:	00813483          	ld	s1,8(sp)
    8000169c:	00013903          	ld	s2,0(sp)
    800016a0:	00007517          	auipc	a0,0x7
    800016a4:	d3050513          	add	a0,a0,-720 # 800083d0 <rodata_start+0x3d0>
    800016a8:	02010113          	add	sp,sp,32
    800016ac:	4310106f          	j	800032dc <uart_puts>
    800016b0:	00008517          	auipc	a0,0x8
    800016b4:	29850513          	add	a0,a0,664 # 80009948 <rodata_start+0x1948>
    800016b8:	425010ef          	jal	800032dc <uart_puts>
    800016bc:	01013403          	ld	s0,16(sp)
    800016c0:	01813083          	ld	ra,24(sp)
    800016c4:	00813483          	ld	s1,8(sp)
    800016c8:	00013903          	ld	s2,0(sp)
    800016cc:	00007517          	auipc	a0,0x7
    800016d0:	d0450513          	add	a0,a0,-764 # 800083d0 <rodata_start+0x3d0>
    800016d4:	02010113          	add	sp,sp,32
    800016d8:	4050106f          	j	800032dc <uart_puts>
    800016dc:	00008517          	auipc	a0,0x8
    800016e0:	17450513          	add	a0,a0,372 # 80009850 <rodata_start+0x1850>
    800016e4:	3f9010ef          	jal	800032dc <uart_puts>
    800016e8:	f19ff06f          	j	80001600 <test_trapframe_allocation+0xa0>

00000000800016ec <test_csr_operations>:
    800016ec:	ff010113          	add	sp,sp,-16
    800016f0:	00008517          	auipc	a0,0x8
    800016f4:	27850513          	add	a0,a0,632 # 80009968 <rodata_start+0x1968>
    800016f8:	00113423          	sd	ra,8(sp)
    800016fc:	00813023          	sd	s0,0(sp)
    80001700:	3dd010ef          	jal	800032dc <uart_puts>
    80001704:	10002473          	csrr	s0,sstatus
    80001708:	00008517          	auipc	a0,0x8
    8000170c:	29850513          	add	a0,a0,664 # 800099a0 <rodata_start+0x19a0>
    80001710:	00040593          	mv	a1,s0
    80001714:	059010ef          	jal	80002f6c <printf>
    80001718:	142025f3          	csrr	a1,scause
    8000171c:	00008517          	auipc	a0,0x8
    80001720:	29c50513          	add	a0,a0,668 # 800099b8 <rodata_start+0x19b8>
    80001724:	049010ef          	jal	80002f6c <printf>
    80001728:	141025f3          	csrr	a1,sepc
    8000172c:	00008517          	auipc	a0,0x8
    80001730:	2a450513          	add	a0,a0,676 # 800099d0 <rodata_start+0x19d0>
    80001734:	039010ef          	jal	80002f6c <printf>
    80001738:	00008517          	auipc	a0,0x8
    8000173c:	2b050513          	add	a0,a0,688 # 800099e8 <rodata_start+0x19e8>
    80001740:	39d010ef          	jal	800032dc <uart_puts>
    80001744:	00000793          	li	a5,0
    80001748:	10079073          	csrw	sstatus,a5
    8000174c:	100025f3          	csrr	a1,sstatus
    80001750:	00008517          	auipc	a0,0x8
    80001754:	2b050513          	add	a0,a0,688 # 80009a00 <rodata_start+0x1a00>
    80001758:	015010ef          	jal	80002f6c <printf>
    8000175c:	10041073          	csrw	sstatus,s0
    80001760:	00008517          	auipc	a0,0x8
    80001764:	2b850513          	add	a0,a0,696 # 80009a18 <rodata_start+0x1a18>
    80001768:	375010ef          	jal	800032dc <uart_puts>
    8000176c:	00013403          	ld	s0,0(sp)
    80001770:	00813083          	ld	ra,8(sp)
    80001774:	00007517          	auipc	a0,0x7
    80001778:	dac50513          	add	a0,a0,-596 # 80008520 <rodata_start+0x520>
    8000177c:	01010113          	add	sp,sp,16
    80001780:	35d0106f          	j	800032dc <uart_puts>

0000000080001784 <test_exception_definitions>:
    80001784:	ff010113          	add	sp,sp,-16
    80001788:	00008517          	auipc	a0,0x8
    8000178c:	2a850513          	add	a0,a0,680 # 80009a30 <rodata_start+0x1a30>
    80001790:	00113423          	sd	ra,8(sp)
    80001794:	349010ef          	jal	800032dc <uart_puts>
    80001798:	00008517          	auipc	a0,0x8
    8000179c:	2d850513          	add	a0,a0,728 # 80009a70 <rodata_start+0x1a70>
    800017a0:	7cc010ef          	jal	80002f6c <printf>
    800017a4:	00200593          	li	a1,2
    800017a8:	00008517          	auipc	a0,0x8
    800017ac:	2e050513          	add	a0,a0,736 # 80009a88 <rodata_start+0x1a88>
    800017b0:	7bc010ef          	jal	80002f6c <printf>
    800017b4:	00d00593          	li	a1,13
    800017b8:	00008517          	auipc	a0,0x8
    800017bc:	2f050513          	add	a0,a0,752 # 80009aa8 <rodata_start+0x1aa8>
    800017c0:	7ac010ef          	jal	80002f6c <printf>
    800017c4:	00f00593          	li	a1,15
    800017c8:	00008517          	auipc	a0,0x8
    800017cc:	30050513          	add	a0,a0,768 # 80009ac8 <rodata_start+0x1ac8>
    800017d0:	79c010ef          	jal	80002f6c <printf>
    800017d4:	00800593          	li	a1,8
    800017d8:	00008517          	auipc	a0,0x8
    800017dc:	31050513          	add	a0,a0,784 # 80009ae8 <rodata_start+0x1ae8>
    800017e0:	78c010ef          	jal	80002f6c <printf>
    800017e4:	00008517          	auipc	a0,0x8
    800017e8:	31c50513          	add	a0,a0,796 # 80009b00 <rodata_start+0x1b00>
    800017ec:	780010ef          	jal	80002f6c <printf>
    800017f0:	00500593          	li	a1,5
    800017f4:	00008517          	auipc	a0,0x8
    800017f8:	32450513          	add	a0,a0,804 # 80009b18 <rodata_start+0x1b18>
    800017fc:	770010ef          	jal	80002f6c <printf>
    80001800:	00700593          	li	a1,7
    80001804:	00008517          	auipc	a0,0x8
    80001808:	32c50513          	add	a0,a0,812 # 80009b30 <rodata_start+0x1b30>
    8000180c:	760010ef          	jal	80002f6c <printf>
    80001810:	00900593          	li	a1,9
    80001814:	00008517          	auipc	a0,0x8
    80001818:	33450513          	add	a0,a0,820 # 80009b48 <rodata_start+0x1b48>
    8000181c:	750010ef          	jal	80002f6c <printf>
    80001820:	00008517          	auipc	a0,0x8
    80001824:	34050513          	add	a0,a0,832 # 80009b60 <rodata_start+0x1b60>
    80001828:	2b5010ef          	jal	800032dc <uart_puts>
    8000182c:	00813083          	ld	ra,8(sp)
    80001830:	00007517          	auipc	a0,0x7
    80001834:	e9850513          	add	a0,a0,-360 # 800086c8 <rodata_start+0x6c8>
    80001838:	01010113          	add	sp,sp,16
    8000183c:	2a10106f          	j	800032dc <uart_puts>

0000000080001840 <test_trapframe_structure>:
    80001840:	ff010113          	add	sp,sp,-16
    80001844:	00008517          	auipc	a0,0x8
    80001848:	34450513          	add	a0,a0,836 # 80009b88 <rodata_start+0x1b88>
    8000184c:	00113423          	sd	ra,8(sp)
    80001850:	28d010ef          	jal	800032dc <uart_puts>
    80001854:	12000593          	li	a1,288
    80001858:	00008517          	auipc	a0,0x8
    8000185c:	36850513          	add	a0,a0,872 # 80009bc0 <rodata_start+0x1bc0>
    80001860:	70c010ef          	jal	80002f6c <printf>
    80001864:	00008517          	auipc	a0,0x8
    80001868:	38450513          	add	a0,a0,900 # 80009be8 <rodata_start+0x1be8>
    8000186c:	700010ef          	jal	80002f6c <printf>
    80001870:	00008517          	auipc	a0,0x8
    80001874:	3a850513          	add	a0,a0,936 # 80009c18 <rodata_start+0x1c18>
    80001878:	6f4010ef          	jal	80002f6c <printf>
    8000187c:	00800593          	li	a1,8
    80001880:	00008517          	auipc	a0,0x8
    80001884:	3b050513          	add	a0,a0,944 # 80009c30 <rodata_start+0x1c30>
    80001888:	6e4010ef          	jal	80002f6c <printf>
    8000188c:	00800593          	li	a1,8
    80001890:	00008517          	auipc	a0,0x8
    80001894:	3b850513          	add	a0,a0,952 # 80009c48 <rodata_start+0x1c48>
    80001898:	6d4010ef          	jal	80002f6c <printf>
    8000189c:	00800593          	li	a1,8
    800018a0:	00008517          	auipc	a0,0x8
    800018a4:	3c850513          	add	a0,a0,968 # 80009c68 <rodata_start+0x1c68>
    800018a8:	6c4010ef          	jal	80002f6c <printf>
    800018ac:	02400693          	li	a3,36
    800018b0:	00800613          	li	a2,8
    800018b4:	12000593          	li	a1,288
    800018b8:	00008517          	auipc	a0,0x8
    800018bc:	3d050513          	add	a0,a0,976 # 80009c88 <rodata_start+0x1c88>
    800018c0:	6ac010ef          	jal	80002f6c <printf>
    800018c4:	00008517          	auipc	a0,0x8
    800018c8:	3ec50513          	add	a0,a0,1004 # 80009cb0 <rodata_start+0x1cb0>
    800018cc:	211010ef          	jal	800032dc <uart_puts>
    800018d0:	00813083          	ld	ra,8(sp)
    800018d4:	00007517          	auipc	a0,0x7
    800018d8:	f9450513          	add	a0,a0,-108 # 80008868 <rodata_start+0x868>
    800018dc:	01010113          	add	sp,sp,16
    800018e0:	1fd0106f          	j	800032dc <uart_puts>

00000000800018e4 <test_interrupt_handlers>:
    800018e4:	ff010113          	add	sp,sp,-16
    800018e8:	00008517          	auipc	a0,0x8
    800018ec:	3f050513          	add	a0,a0,1008 # 80009cd8 <rodata_start+0x1cd8>
    800018f0:	00113423          	sd	ra,8(sp)
    800018f4:	1e9010ef          	jal	800032dc <uart_puts>
    800018f8:	00008517          	auipc	a0,0x8
    800018fc:	42050513          	add	a0,a0,1056 # 80009d18 <rodata_start+0x1d18>
    80001900:	1dd010ef          	jal	800032dc <uart_puts>
    80001904:	00413797          	auipc	a5,0x413
    80001908:	ba478793          	add	a5,a5,-1116 # 804144a8 <trap_handlers>
    8000190c:	00413697          	auipc	a3,0x413
    80001910:	c1c68693          	add	a3,a3,-996 # 80414528 <trapframe_pool>
    80001914:	00000593          	li	a1,0
    80001918:	0007b703          	ld	a4,0(a5)
    8000191c:	00878793          	add	a5,a5,8
    80001920:	00070463          	beqz	a4,80001928 <test_interrupt_handlers+0x44>
    80001924:	0015859b          	addw	a1,a1,1
    80001928:	fed798e3          	bne	a5,a3,80001918 <test_interrupt_handlers+0x34>
    8000192c:	00008517          	auipc	a0,0x8
    80001930:	40c50513          	add	a0,a0,1036 # 80009d38 <rodata_start+0x1d38>
    80001934:	638010ef          	jal	80002f6c <printf>
    80001938:	00008517          	auipc	a0,0x8
    8000193c:	42850513          	add	a0,a0,1064 # 80009d60 <rodata_start+0x1d60>
    80001940:	19d010ef          	jal	800032dc <uart_puts>
    80001944:	00813083          	ld	ra,8(sp)
    80001948:	00007517          	auipc	a0,0x7
    8000194c:	01050513          	add	a0,a0,16 # 80008958 <rodata_start+0x958>
    80001950:	01010113          	add	sp,sp,16
    80001954:	1890106f          	j	800032dc <uart_puts>

0000000080001958 <test_user_kernel_transition>:
    80001958:	fe010113          	add	sp,sp,-32
    8000195c:	00008517          	auipc	a0,0x8
    80001960:	43450513          	add	a0,a0,1076 # 80009d90 <rodata_start+0x1d90>
    80001964:	00113c23          	sd	ra,24(sp)
    80001968:	00813823          	sd	s0,16(sp)
    8000196c:	00913423          	sd	s1,8(sp)
    80001970:	16d010ef          	jal	800032dc <uart_puts>
    80001974:	495040ef          	jal	80006608 <alloc_proc>
    80001978:	2e050c63          	beqz	a0,80001c70 <test_user_kernel_transition+0x318>
    8000197c:	00050413          	mv	s0,a0
    80001980:	209010ef          	jal	80003388 <alloc_page>
    80001984:	04a43423          	sd	a0,72(s0)
    80001988:	00050793          	mv	a5,a0
    8000198c:	12050713          	add	a4,a0,288
    80001990:	2e050e63          	beqz	a0,80001c8c <test_user_kernel_transition+0x334>
    80001994:	0007b023          	sd	zero,0(a5)
    80001998:	00878793          	add	a5,a5,8
    8000199c:	fee79ce3          	bne	a5,a4,80001994 <test_user_kernel_transition+0x3c>
    800019a0:	00300793          	li	a5,3
    800019a4:	00f42223          	sw	a5,4(s0)
    800019a8:	06400793          	li	a5,100
    800019ac:	00f42423          	sw	a5,8(s0)
    800019b0:	00040513          	mv	a0,s0
    800019b4:	745040ef          	jal	800068f8 <set_current_proc>
    800019b8:	00842583          	lw	a1,8(s0)
    800019bc:	00008517          	auipc	a0,0x8
    800019c0:	43c50513          	add	a0,a0,1084 # 80009df8 <rodata_start+0x1df8>
    800019c4:	5a8010ef          	jal	80002f6c <printf>
    800019c8:	04843583          	ld	a1,72(s0)
    800019cc:	00008517          	auipc	a0,0x8
    800019d0:	45450513          	add	a0,a0,1108 # 80009e20 <rodata_start+0x1e20>
    800019d4:	598010ef          	jal	80002f6c <printf>
    800019d8:	00008517          	auipc	a0,0x8
    800019dc:	46850513          	add	a0,a0,1128 # 80009e40 <rodata_start+0x1e40>
    800019e0:	0fd010ef          	jal	800032dc <uart_puts>
    800019e4:	04843783          	ld	a5,72(s0)
    800019e8:	00b00713          	li	a4,11
    800019ec:	00001637          	lui	a2,0x1
    800019f0:	0ae7b423          	sd	a4,168(a5)
    800019f4:	00001737          	lui	a4,0x1
    800019f8:	00e7bc23          	sd	a4,24(a5)
    800019fc:	00b00593          	li	a1,11
    80001a00:	0607b823          	sd	zero,112(a5)
    80001a04:	00008517          	auipc	a0,0x8
    80001a08:	47450513          	add	a0,a0,1140 # 80009e78 <rodata_start+0x1e78>
    80001a0c:	560010ef          	jal	80002f6c <printf>
    80001a10:	5f1050ef          	jal	80007800 <syscall>
    80001a14:	04843783          	ld	a5,72(s0)
    80001a18:	00842603          	lw	a2,8(s0)
    80001a1c:	00008517          	auipc	a0,0x8
    80001a20:	48c50513          	add	a0,a0,1164 # 80009ea8 <rodata_start+0x1ea8>
    80001a24:	0707b583          	ld	a1,112(a5)
    80001a28:	544010ef          	jal	80002f6c <printf>
    80001a2c:	04843703          	ld	a4,72(s0)
    80001a30:	00842783          	lw	a5,8(s0)
    80001a34:	07073703          	ld	a4,112(a4) # 1070 <_entry-0x7fffef90>
    80001a38:	20f70463          	beq	a4,a5,80001c40 <test_user_kernel_transition+0x2e8>
    80001a3c:	00008517          	auipc	a0,0x8
    80001a40:	4bc50513          	add	a0,a0,1212 # 80009ef8 <rodata_start+0x1ef8>
    80001a44:	099010ef          	jal	800032dc <uart_puts>
    80001a48:	00008517          	auipc	a0,0x8
    80001a4c:	4d050513          	add	a0,a0,1232 # 80009f18 <rodata_start+0x1f18>
    80001a50:	08d010ef          	jal	800032dc <uart_puts>
    80001a54:	04843783          	ld	a5,72(s0)
    80001a58:	00e00713          	li	a4,14
    80001a5c:	00e00593          	li	a1,14
    80001a60:	0ae7b423          	sd	a4,168(a5)
    80001a64:	0607b823          	sd	zero,112(a5)
    80001a68:	00008517          	auipc	a0,0x8
    80001a6c:	4e850513          	add	a0,a0,1256 # 80009f50 <rodata_start+0x1f50>
    80001a70:	4fc010ef          	jal	80002f6c <printf>
    80001a74:	58d050ef          	jal	80007800 <syscall>
    80001a78:	04843783          	ld	a5,72(s0)
    80001a7c:	00008517          	auipc	a0,0x8
    80001a80:	4f450513          	add	a0,a0,1268 # 80009f70 <rodata_start+0x1f70>
    80001a84:	0707b583          	ld	a1,112(a5)
    80001a88:	4e4010ef          	jal	80002f6c <printf>
    80001a8c:	00008517          	auipc	a0,0x8
    80001a90:	50c50513          	add	a0,a0,1292 # 80009f98 <rodata_start+0x1f98>
    80001a94:	049010ef          	jal	800032dc <uart_puts>
    80001a98:	00008517          	auipc	a0,0x8
    80001a9c:	53050513          	add	a0,a0,1328 # 80009fc8 <rodata_start+0x1fc8>
    80001aa0:	03d010ef          	jal	800032dc <uart_puts>
    80001aa4:	04843783          	ld	a5,72(s0)
    80001aa8:	00001737          	lui	a4,0x1
    80001aac:	02e43c23          	sd	a4,56(s0)
    80001ab0:	00c00713          	li	a4,12
    80001ab4:	0ae7b423          	sd	a4,168(a5)
    80001ab8:	40000713          	li	a4,1024
    80001abc:	06e7b823          	sd	a4,112(a5)
    80001ac0:	40000613          	li	a2,1024
    80001ac4:	00c00593          	li	a1,12
    80001ac8:	00008517          	auipc	a0,0x8
    80001acc:	54050513          	add	a0,a0,1344 # 8000a008 <rodata_start+0x2008>
    80001ad0:	49c010ef          	jal	80002f6c <printf>
    80001ad4:	03843583          	ld	a1,56(s0)
    80001ad8:	00008517          	auipc	a0,0x8
    80001adc:	56050513          	add	a0,a0,1376 # 8000a038 <rodata_start+0x2038>
    80001ae0:	48c010ef          	jal	80002f6c <printf>
    80001ae4:	03843483          	ld	s1,56(s0)
    80001ae8:	519050ef          	jal	80007800 <syscall>
    80001aec:	04843783          	ld	a5,72(s0)
    80001af0:	00008517          	auipc	a0,0x8
    80001af4:	56850513          	add	a0,a0,1384 # 8000a058 <rodata_start+0x2058>
    80001af8:	0707b583          	ld	a1,112(a5)
    80001afc:	470010ef          	jal	80002f6c <printf>
    80001b00:	03843583          	ld	a1,56(s0)
    80001b04:	00008517          	auipc	a0,0x8
    80001b08:	57c50513          	add	a0,a0,1404 # 8000a080 <rodata_start+0x2080>
    80001b0c:	460010ef          	jal	80002f6c <printf>
    80001b10:	04843783          	ld	a5,72(s0)
    80001b14:	0707b783          	ld	a5,112(a5)
    80001b18:	14978463          	beq	a5,s1,80001c60 <test_user_kernel_transition+0x308>
    80001b1c:	00008517          	auipc	a0,0x8
    80001b20:	5a450513          	add	a0,a0,1444 # 8000a0c0 <rodata_start+0x20c0>
    80001b24:	7b8010ef          	jal	800032dc <uart_puts>
    80001b28:	00008517          	auipc	a0,0x8
    80001b2c:	5b850513          	add	a0,a0,1464 # 8000a0e0 <rodata_start+0x20e0>
    80001b30:	7ac010ef          	jal	800032dc <uart_puts>
    80001b34:	04843783          	ld	a5,72(s0)
    80001b38:	3e700713          	li	a4,999
    80001b3c:	3e700593          	li	a1,999
    80001b40:	0ae7b423          	sd	a4,168(a5)
    80001b44:	0607b823          	sd	zero,112(a5)
    80001b48:	00008517          	auipc	a0,0x8
    80001b4c:	5d050513          	add	a0,a0,1488 # 8000a118 <rodata_start+0x2118>
    80001b50:	41c010ef          	jal	80002f6c <printf>
    80001b54:	4ad050ef          	jal	80007800 <syscall>
    80001b58:	04843783          	ld	a5,72(s0)
    80001b5c:	00008517          	auipc	a0,0x8
    80001b60:	5e450513          	add	a0,a0,1508 # 8000a140 <rodata_start+0x2140>
    80001b64:	0707b583          	ld	a1,112(a5)
    80001b68:	404010ef          	jal	80002f6c <printf>
    80001b6c:	04843703          	ld	a4,72(s0)
    80001b70:	fff00793          	li	a5,-1
    80001b74:	07073703          	ld	a4,112(a4) # 1070 <_entry-0x7fffef90>
    80001b78:	0cf70c63          	beq	a4,a5,80001c50 <test_user_kernel_transition+0x2f8>
    80001b7c:	00008517          	auipc	a0,0x8
    80001b80:	60450513          	add	a0,a0,1540 # 8000a180 <rodata_start+0x2180>
    80001b84:	758010ef          	jal	800032dc <uart_puts>
    80001b88:	00008517          	auipc	a0,0x8
    80001b8c:	62050513          	add	a0,a0,1568 # 8000a1a8 <rodata_start+0x21a8>
    80001b90:	74c010ef          	jal	800032dc <uart_puts>
    80001b94:	12000593          	li	a1,288
    80001b98:	00008517          	auipc	a0,0x8
    80001b9c:	64850513          	add	a0,a0,1608 # 8000a1e0 <rodata_start+0x21e0>
    80001ba0:	3cc010ef          	jal	80002f6c <printf>
    80001ba4:	00000593          	li	a1,0
    80001ba8:	00008517          	auipc	a0,0x8
    80001bac:	65850513          	add	a0,a0,1624 # 8000a200 <rodata_start+0x2200>
    80001bb0:	3bc010ef          	jal	80002f6c <printf>
    80001bb4:	00800593          	li	a1,8
    80001bb8:	00008517          	auipc	a0,0x8
    80001bbc:	67050513          	add	a0,a0,1648 # 8000a228 <rodata_start+0x2228>
    80001bc0:	3ac010ef          	jal	80002f6c <printf>
    80001bc4:	01000593          	li	a1,16
    80001bc8:	00008517          	auipc	a0,0x8
    80001bcc:	68850513          	add	a0,a0,1672 # 8000a250 <rodata_start+0x2250>
    80001bd0:	39c010ef          	jal	80002f6c <printf>
    80001bd4:	07000593          	li	a1,112
    80001bd8:	00008517          	auipc	a0,0x8
    80001bdc:	6a050513          	add	a0,a0,1696 # 8000a278 <rodata_start+0x2278>
    80001be0:	38c010ef          	jal	80002f6c <printf>
    80001be4:	0a800593          	li	a1,168
    80001be8:	00008517          	auipc	a0,0x8
    80001bec:	6b050513          	add	a0,a0,1712 # 8000a298 <rodata_start+0x2298>
    80001bf0:	37c010ef          	jal	80002f6c <printf>
    80001bf4:	00008517          	auipc	a0,0x8
    80001bf8:	6c450513          	add	a0,a0,1732 # 8000a2b8 <rodata_start+0x22b8>
    80001bfc:	6e0010ef          	jal	800032dc <uart_puts>
    80001c00:	00000513          	li	a0,0
    80001c04:	4f5040ef          	jal	800068f8 <set_current_proc>
    80001c08:	04843503          	ld	a0,72(s0)
    80001c0c:	798010ef          	jal	800033a4 <free_page>
    80001c10:	00040513          	mv	a0,s0
    80001c14:	3d1040ef          	jal	800067e4 <free_proc>
    80001c18:	00008517          	auipc	a0,0x8
    80001c1c:	6e050513          	add	a0,a0,1760 # 8000a2f8 <rodata_start+0x22f8>
    80001c20:	6bc010ef          	jal	800032dc <uart_puts>
    80001c24:	01013403          	ld	s0,16(sp)
    80001c28:	01813083          	ld	ra,24(sp)
    80001c2c:	00813483          	ld	s1,8(sp)
    80001c30:	00008517          	auipc	a0,0x8
    80001c34:	6f850513          	add	a0,a0,1784 # 8000a328 <rodata_start+0x2328>
    80001c38:	02010113          	add	sp,sp,32
    80001c3c:	6a00106f          	j	800032dc <uart_puts>
    80001c40:	00008517          	auipc	a0,0x8
    80001c44:	28850513          	add	a0,a0,648 # 80009ec8 <rodata_start+0x1ec8>
    80001c48:	694010ef          	jal	800032dc <uart_puts>
    80001c4c:	dfdff06f          	j	80001a48 <test_user_kernel_transition+0xf0>
    80001c50:	00008517          	auipc	a0,0x8
    80001c54:	50850513          	add	a0,a0,1288 # 8000a158 <rodata_start+0x2158>
    80001c58:	684010ef          	jal	800032dc <uart_puts>
    80001c5c:	f2dff06f          	j	80001b88 <test_user_kernel_transition+0x230>
    80001c60:	00008517          	auipc	a0,0x8
    80001c64:	43850513          	add	a0,a0,1080 # 8000a098 <rodata_start+0x2098>
    80001c68:	674010ef          	jal	800032dc <uart_puts>
    80001c6c:	ebdff06f          	j	80001b28 <test_user_kernel_transition+0x1d0>
    80001c70:	01013403          	ld	s0,16(sp)
    80001c74:	01813083          	ld	ra,24(sp)
    80001c78:	00813483          	ld	s1,8(sp)
    80001c7c:	00006517          	auipc	a0,0x6
    80001c80:	40450513          	add	a0,a0,1028 # 80008080 <rodata_start+0x80>
    80001c84:	02010113          	add	sp,sp,32
    80001c88:	6540106f          	j	800032dc <uart_puts>
    80001c8c:	00008517          	auipc	a0,0x8
    80001c90:	14c50513          	add	a0,a0,332 # 80009dd8 <rodata_start+0x1dd8>
    80001c94:	648010ef          	jal	800032dc <uart_puts>
    80001c98:	00040513          	mv	a0,s0
    80001c9c:	01013403          	ld	s0,16(sp)
    80001ca0:	01813083          	ld	ra,24(sp)
    80001ca4:	00813483          	ld	s1,8(sp)
    80001ca8:	02010113          	add	sp,sp,32
    80001cac:	3390406f          	j	800067e4 <free_proc>

0000000080001cb0 <test_real_syscall_mechanism>:
    80001cb0:	f9010113          	add	sp,sp,-112
    80001cb4:	00008517          	auipc	a0,0x8
    80001cb8:	68c50513          	add	a0,a0,1676 # 8000a340 <rodata_start+0x2340>
    80001cbc:	06113423          	sd	ra,104(sp)
    80001cc0:	06813023          	sd	s0,96(sp)
    80001cc4:	04913c23          	sd	s1,88(sp)
    80001cc8:	05213823          	sd	s2,80(sp)
    80001ccc:	05313423          	sd	s3,72(sp)
    80001cd0:	05413023          	sd	s4,64(sp)
    80001cd4:	03513c23          	sd	s5,56(sp)
    80001cd8:	03613823          	sd	s6,48(sp)
    80001cdc:	03713423          	sd	s7,40(sp)
    80001ce0:	03813023          	sd	s8,32(sp)
    80001ce4:	5f8010ef          	jal	800032dc <uart_puts>
    80001ce8:	00008517          	auipc	a0,0x8
    80001cec:	6a050513          	add	a0,a0,1696 # 8000a388 <rodata_start+0x2388>
    80001cf0:	5ec010ef          	jal	800032dc <uart_puts>
    80001cf4:	00008517          	auipc	a0,0x8
    80001cf8:	6cc50513          	add	a0,a0,1740 # 8000a3c0 <rodata_start+0x23c0>
    80001cfc:	5e0010ef          	jal	800032dc <uart_puts>
    80001d00:	109040ef          	jal	80006608 <alloc_proc>
    80001d04:	76050063          	beqz	a0,80002464 <test_real_syscall_mechanism+0x7b4>
    80001d08:	00050413          	mv	s0,a0
    80001d0c:	67c010ef          	jal	80003388 <alloc_page>
    80001d10:	04a43423          	sd	a0,72(s0)
    80001d14:	00050613          	mv	a2,a0
    80001d18:	12050713          	add	a4,a0,288
    80001d1c:	00050793          	mv	a5,a0
    80001d20:	78050e63          	beqz	a0,800024bc <test_real_syscall_mechanism+0x80c>
    80001d24:	0007b023          	sd	zero,0(a5)
    80001d28:	00878793          	add	a5,a5,8
    80001d2c:	fee79ce3          	bne	a5,a4,80001d24 <test_real_syscall_mechanism+0x74>
    80001d30:	00300793          	li	a5,3
    80001d34:	00f42223          	sw	a5,4(s0)
    80001d38:	0c800793          	li	a5,200
    80001d3c:	0c800593          	li	a1,200
    80001d40:	00f42423          	sw	a5,8(s0)
    80001d44:	00008517          	auipc	a0,0x8
    80001d48:	6a450513          	add	a0,a0,1700 # 8000a3e8 <rodata_start+0x23e8>
    80001d4c:	220010ef          	jal	80002f6c <printf>
    80001d50:	00008517          	auipc	a0,0x8
    80001d54:	6c850513          	add	a0,a0,1736 # 8000a418 <rodata_start+0x2418>
    80001d58:	584010ef          	jal	800032dc <uart_puts>
    80001d5c:	0a1010ef          	jal	800035fc <create_pagetable>
    80001d60:	02a43823          	sd	a0,48(s0)
    80001d64:	00050593          	mv	a1,a0
    80001d68:	74050263          	beqz	a0,800024ac <test_real_syscall_mechanism+0x7fc>
    80001d6c:	00008517          	auipc	a0,0x8
    80001d70:	6f450513          	add	a0,a0,1780 # 8000a460 <rodata_start+0x2460>
    80001d74:	1f8010ef          	jal	80002f6c <printf>
    80001d78:	00008517          	auipc	a0,0x8
    80001d7c:	71050513          	add	a0,a0,1808 # 8000a488 <rodata_start+0x2488>
    80001d80:	55c010ef          	jal	800032dc <uart_puts>
    80001d84:	00006597          	auipc	a1,0x6
    80001d88:	d6c58593          	add	a1,a1,-660 # 80007af0 <uservec>
    80001d8c:	fffff4b7          	lui	s1,0xfffff
    80001d90:	00008517          	auipc	a0,0x8
    80001d94:	73850513          	add	a0,a0,1848 # 8000a4c8 <rodata_start+0x24c8>
    80001d98:	0095f4b3          	and	s1,a1,s1
    80001d9c:	1d0010ef          	jal	80002f6c <printf>
    80001da0:	00048593          	mv	a1,s1
    80001da4:	00008517          	auipc	a0,0x8
    80001da8:	74450513          	add	a0,a0,1860 # 8000a4e8 <rodata_start+0x24e8>
    80001dac:	1c0010ef          	jal	80002f6c <printf>
    80001db0:	03043503          	ld	a0,48(s0)
    80001db4:	00a00693          	li	a3,10
    80001db8:	00048613          	mv	a2,s1
    80001dbc:	00048593          	mv	a1,s1
    80001dc0:	071010ef          	jal	80003630 <map_page>
    80001dc4:	64051063          	bnez	a0,80002404 <test_real_syscall_mechanism+0x754>
    80001dc8:	00048593          	mv	a1,s1
    80001dcc:	00008517          	auipc	a0,0x8
    80001dd0:	76450513          	add	a0,a0,1892 # 8000a530 <rodata_start+0x2530>
    80001dd4:	198010ef          	jal	80002f6c <printf>
    80001dd8:	00008517          	auipc	a0,0x8
    80001ddc:	78850513          	add	a0,a0,1928 # 8000a560 <rodata_start+0x2560>
    80001de0:	4fc010ef          	jal	800032dc <uart_puts>
    80001de4:	04843483          	ld	s1,72(s0)
    80001de8:	00008517          	auipc	a0,0x8
    80001dec:	7b050513          	add	a0,a0,1968 # 8000a598 <rodata_start+0x2598>
    80001df0:	00048593          	mv	a1,s1
    80001df4:	178010ef          	jal	80002f6c <printf>
    80001df8:	03043503          	ld	a0,48(s0)
    80001dfc:	00600693          	li	a3,6
    80001e00:	00048613          	mv	a2,s1
    80001e04:	00048593          	mv	a1,s1
    80001e08:	029010ef          	jal	80003630 <map_page>
    80001e0c:	68051863          	bnez	a0,8000249c <test_real_syscall_mechanism+0x7ec>
    80001e10:	00048593          	mv	a1,s1
    80001e14:	00008517          	auipc	a0,0x8
    80001e18:	7c450513          	add	a0,a0,1988 # 8000a5d8 <rodata_start+0x25d8>
    80001e1c:	150010ef          	jal	80002f6c <printf>
    80001e20:	00008517          	auipc	a0,0x8
    80001e24:	7e850513          	add	a0,a0,2024 # 8000a608 <rodata_start+0x2608>
    80001e28:	4b4010ef          	jal	800032dc <uart_puts>
    80001e2c:	03043503          	ld	a0,48(s0)
    80001e30:	00600693          	li	a3,6
    80001e34:	10000637          	lui	a2,0x10000
    80001e38:	100005b7          	lui	a1,0x10000
    80001e3c:	7f4010ef          	jal	80003630 <map_page>
    80001e40:	60051a63          	bnez	a0,80002454 <test_real_syscall_mechanism+0x7a4>
    80001e44:	00009517          	auipc	a0,0x9
    80001e48:	80c50513          	add	a0,a0,-2036 # 8000a650 <rodata_start+0x2650>
    80001e4c:	490010ef          	jal	800032dc <uart_puts>
    80001e50:	00009517          	auipc	a0,0x9
    80001e54:	81850513          	add	a0,a0,-2024 # 8000a668 <rodata_start+0x2668>
    80001e58:	484010ef          	jal	800032dc <uart_puts>
    80001e5c:	52c010ef          	jal	80003388 <alloc_page>
    80001e60:	00050493          	mv	s1,a0
    80001e64:	68050c63          	beqz	a0,800024fc <test_real_syscall_mechanism+0x84c>
    80001e68:	00006917          	auipc	s2,0x6
    80001e6c:	e5890913          	add	s2,s2,-424 # 80007cc0 <user_test_getpid>
    80001e70:	00006997          	auipc	s3,0x6
    80001e74:	e9898993          	add	s3,s3,-360 # 80007d08 <user_test_end>
    80001e78:	412989b3          	sub	s3,s3,s2
    80001e7c:	00098593          	mv	a1,s3
    80001e80:	00009517          	auipc	a0,0x9
    80001e84:	84850513          	add	a0,a0,-1976 # 8000a6c8 <rodata_start+0x26c8>
    80001e88:	0e4010ef          	jal	80002f6c <printf>
    80001e8c:	00001737          	lui	a4,0x1
    80001e90:	00e48733          	add	a4,s1,a4
    80001e94:	00048793          	mv	a5,s1
    80001e98:	00078023          	sb	zero,0(a5)
    80001e9c:	00178793          	add	a5,a5,1
    80001ea0:	fee79ce3          	bne	a5,a4,80001e98 <test_real_syscall_mechanism+0x1e8>
    80001ea4:	6a098063          	beqz	s3,80002544 <test_real_syscall_mechanism+0x894>
    80001ea8:	00001637          	lui	a2,0x1
    80001eac:	00100793          	li	a5,1
    80001eb0:	00160613          	add	a2,a2,1 # 1001 <_entry-0x7fffefff>
    80001eb4:	00c0006f          	j	80001ec0 <test_real_syscall_mechanism+0x210>
    80001eb8:	00178793          	add	a5,a5,1
    80001ebc:	00c78c63          	beq	a5,a2,80001ed4 <test_real_syscall_mechanism+0x224>
    80001ec0:	00f90733          	add	a4,s2,a5
    80001ec4:	fff74683          	lbu	a3,-1(a4) # fff <_entry-0x7ffff001>
    80001ec8:	00f48733          	add	a4,s1,a5
    80001ecc:	fed70fa3          	sb	a3,-1(a4)
    80001ed0:	fef994e3          	bne	s3,a5,80001eb8 <test_real_syscall_mechanism+0x208>
    80001ed4:	00009517          	auipc	a0,0x9
    80001ed8:	81450513          	add	a0,a0,-2028 # 8000a6e8 <rodata_start+0x26e8>
    80001edc:	400010ef          	jal	800032dc <uart_puts>
    80001ee0:	00009797          	auipc	a5,0x9
    80001ee4:	55078793          	add	a5,a5,1360 # 8000b430 <rodata_start+0x3430>
    80001ee8:	0007bc03          	ld	s8,0(a5)
    80001eec:	0087bb83          	ld	s7,8(a5)
    80001ef0:	0107cb03          	lbu	s6,16(a5)
    80001ef4:	00f48a93          	add	s5,s1,15 # fffffffffffff00f <bss_end+0xffffffff7fbd7b9f>
    80001ef8:	013489b3          	add	s3,s1,s3
    80001efc:	00048913          	mv	s2,s1
    80001f00:	02000a13          	li	s4,32
    80001f04:	00c0006f          	j	80001f10 <test_real_syscall_mechanism+0x260>
    80001f08:	00190913          	add	s2,s2,1
    80001f0c:	05390863          	beq	s2,s3,80001f5c <test_real_syscall_mechanism+0x2ac>
    80001f10:	00094783          	lbu	a5,0(s2)
    80001f14:	01813423          	sd	s8,8(sp)
    80001f18:	01713823          	sd	s7,16(sp)
    80001f1c:	00f7f713          	and	a4,a5,15
    80001f20:	02070713          	add	a4,a4,32
    80001f24:	0047d793          	srl	a5,a5,0x4
    80001f28:	00270733          	add	a4,a4,sp
    80001f2c:	02078793          	add	a5,a5,32
    80001f30:	fe874703          	lbu	a4,-24(a4)
    80001f34:	002787b3          	add	a5,a5,sp
    80001f38:	fe87c783          	lbu	a5,-24(a5)
    80001f3c:	0087171b          	sllw	a4,a4,0x8
    80001f40:	00010513          	mv	a0,sp
    80001f44:	00e7e7b3          	or	a5,a5,a4
    80001f48:	01610c23          	sb	s6,24(sp)
    80001f4c:	00f11023          	sh	a5,0(sp)
    80001f50:	01411123          	sh	s4,2(sp)
    80001f54:	388010ef          	jal	800032dc <uart_puts>
    80001f58:	fb2a98e3          	bne	s5,s2,80001f08 <test_real_syscall_mechanism+0x258>
    80001f5c:	00007517          	auipc	a0,0x7
    80001f60:	fec50513          	add	a0,a0,-20 # 80008f48 <rodata_start+0xf48>
    80001f64:	378010ef          	jal	800032dc <uart_puts>
    80001f68:	03043503          	ld	a0,48(s0)
    80001f6c:	01a00693          	li	a3,26
    80001f70:	00048613          	mv	a2,s1
    80001f74:	000015b7          	lui	a1,0x1
    80001f78:	6b8010ef          	jal	80003630 <map_page>
    80001f7c:	56051863          	bnez	a0,800024ec <test_real_syscall_mechanism+0x83c>
    80001f80:	00048613          	mv	a2,s1
    80001f84:	000015b7          	lui	a1,0x1
    80001f88:	00008517          	auipc	a0,0x8
    80001f8c:	7a850513          	add	a0,a0,1960 # 8000a730 <rodata_start+0x2730>
    80001f90:	7dd000ef          	jal	80002f6c <printf>
    80001f94:	00008517          	auipc	a0,0x8
    80001f98:	7d450513          	add	a0,a0,2004 # 8000a768 <rodata_start+0x2768>
    80001f9c:	340010ef          	jal	800032dc <uart_puts>
    80001fa0:	3e8010ef          	jal	80003388 <alloc_page>
    80001fa4:	00001737          	lui	a4,0x1
    80001fa8:	00050913          	mv	s2,a0
    80001fac:	00e50733          	add	a4,a0,a4
    80001fb0:	00050793          	mv	a5,a0
    80001fb4:	58050063          	beqz	a0,80002534 <test_real_syscall_mechanism+0x884>
    80001fb8:	00078023          	sb	zero,0(a5)
    80001fbc:	00178793          	add	a5,a5,1
    80001fc0:	fee79ce3          	bne	a5,a4,80001fb8 <test_real_syscall_mechanism+0x308>
    80001fc4:	03043503          	ld	a0,48(s0)
    80001fc8:	01600693          	li	a3,22
    80001fcc:	00090613          	mv	a2,s2
    80001fd0:	000105b7          	lui	a1,0x10
    80001fd4:	65c010ef          	jal	80003630 <map_page>
    80001fd8:	52051a63          	bnez	a0,8000250c <test_real_syscall_mechanism+0x85c>
    80001fdc:	00090613          	mv	a2,s2
    80001fe0:	000105b7          	lui	a1,0x10
    80001fe4:	00008517          	auipc	a0,0x8
    80001fe8:	7fc50513          	add	a0,a0,2044 # 8000a7e0 <rodata_start+0x27e0>
    80001fec:	781000ef          	jal	80002f6c <printf>
    80001ff0:	00009517          	auipc	a0,0x9
    80001ff4:	82850513          	add	a0,a0,-2008 # 8000a818 <rodata_start+0x2818>
    80001ff8:	2e4010ef          	jal	800032dc <uart_puts>
    80001ffc:	38c010ef          	jal	80003388 <alloc_page>
    80002000:	00050993          	mv	s3,a0
    80002004:	4c050463          	beqz	a0,800024cc <test_real_syscall_mechanism+0x81c>
    80002008:	00050593          	mv	a1,a0
    8000200c:	04a43023          	sd	a0,64(s0)
    80002010:	00009517          	auipc	a0,0x9
    80002014:	84850513          	add	a0,a0,-1976 # 8000a858 <rodata_start+0x2858>
    80002018:	755000ef          	jal	80002f6c <printf>
    8000201c:	00009517          	auipc	a0,0x9
    80002020:	86450513          	add	a0,a0,-1948 # 8000a880 <rodata_start+0x2880>
    80002024:	2b8010ef          	jal	800032dc <uart_puts>
    80002028:	00425a17          	auipc	s4,0x425
    8000202c:	410a0a13          	add	s4,s4,1040 # 80427438 <kernel_pagetable>
    80002030:	000a3583          	ld	a1,0(s4)
    80002034:	00009517          	auipc	a0,0x9
    80002038:	87c50513          	add	a0,a0,-1924 # 8000a8b0 <rodata_start+0x28b0>
    8000203c:	731000ef          	jal	80002f6c <printf>
    80002040:	000a3603          	ld	a2,0(s4)
    80002044:	50060863          	beqz	a2,80002554 <test_real_syscall_mechanism+0x8a4>
    80002048:	04843683          	ld	a3,72(s0)
    8000204c:	00068793          	mv	a5,a3
    80002050:	12068713          	add	a4,a3,288
    80002054:	0007b023          	sd	zero,0(a5)
    80002058:	00878793          	add	a5,a5,8
    8000205c:	fef71ce3          	bne	a4,a5,80002054 <test_real_syscall_mechanism+0x3a4>
    80002060:	fff00a93          	li	s5,-1
    80002064:	00c65613          	srl	a2,a2,0xc
    80002068:	000017b7          	lui	a5,0x1
    8000206c:	03fa9713          	sll	a4,s5,0x3f
    80002070:	00e665b3          	or	a1,a2,a4
    80002074:	00f98733          	add	a4,s3,a5
    80002078:	00e6b423          	sd	a4,8(a3)
    8000207c:	00f6bc23          	sd	a5,24(a3)
    80002080:	00004717          	auipc	a4,0x4
    80002084:	ebc70713          	add	a4,a4,-324 # 80005f3c <usertrap>
    80002088:	000117b7          	lui	a5,0x11
    8000208c:	00b6b023          	sd	a1,0(a3)
    80002090:	02f6b823          	sd	a5,48(a3)
    80002094:	00e6b823          	sd	a4,16(a3)
    80002098:	0206b023          	sd	zero,32(a3)
    8000209c:	00009517          	auipc	a0,0x9
    800020a0:	85c50513          	add	a0,a0,-1956 # 8000a8f8 <rodata_start+0x28f8>
    800020a4:	6c9000ef          	jal	80002f6c <printf>
    800020a8:	04843783          	ld	a5,72(s0)
    800020ac:	00009517          	auipc	a0,0x9
    800020b0:	86450513          	add	a0,a0,-1948 # 8000a910 <rodata_start+0x2910>
    800020b4:	00425a17          	auipc	s4,0x425
    800020b8:	38ca0a13          	add	s4,s4,908 # 80427440 <syscall_test_count>
    800020bc:	0087b583          	ld	a1,8(a5) # 11008 <_entry-0x7ffeeff8>
    800020c0:	6ad000ef          	jal	80002f6c <printf>
    800020c4:	04843783          	ld	a5,72(s0)
    800020c8:	00009517          	auipc	a0,0x9
    800020cc:	86050513          	add	a0,a0,-1952 # 8000a928 <rodata_start+0x2928>
    800020d0:	0107b583          	ld	a1,16(a5)
    800020d4:	699000ef          	jal	80002f6c <printf>
    800020d8:	04843783          	ld	a5,72(s0)
    800020dc:	00009517          	auipc	a0,0x9
    800020e0:	86450513          	add	a0,a0,-1948 # 8000a940 <rodata_start+0x2940>
    800020e4:	0187b583          	ld	a1,24(a5)
    800020e8:	685000ef          	jal	80002f6c <printf>
    800020ec:	04843783          	ld	a5,72(s0)
    800020f0:	00009517          	auipc	a0,0x9
    800020f4:	87050513          	add	a0,a0,-1936 # 8000a960 <rodata_start+0x2960>
    800020f8:	0307b583          	ld	a1,48(a5)
    800020fc:	671000ef          	jal	80002f6c <printf>
    80002100:	00009517          	auipc	a0,0x9
    80002104:	88050513          	add	a0,a0,-1920 # 8000a980 <rodata_start+0x2980>
    80002108:	1d4010ef          	jal	800032dc <uart_puts>
    8000210c:	00009517          	auipc	a0,0x9
    80002110:	89450513          	add	a0,a0,-1900 # 8000a9a0 <rodata_start+0x29a0>
    80002114:	1c8010ef          	jal	800032dc <uart_puts>
    80002118:	00040513          	mv	a0,s0
    8000211c:	7dc040ef          	jal	800068f8 <set_current_proc>
    80002120:	00006517          	auipc	a0,0x6
    80002124:	9d050513          	add	a0,a0,-1584 # 80007af0 <uservec>
    80002128:	149030ef          	jal	80005a70 <w_stvec>
    8000212c:	13d030ef          	jal	80005a68 <r_stvec>
    80002130:	00050593          	mv	a1,a0
    80002134:	00009517          	auipc	a0,0x9
    80002138:	8ac50513          	add	a0,a0,-1876 # 8000a9e0 <rodata_start+0x29e0>
    8000213c:	631000ef          	jal	80002f6c <printf>
    80002140:	00009517          	auipc	a0,0x9
    80002144:	8c050513          	add	a0,a0,-1856 # 8000aa00 <rodata_start+0x2a00>
    80002148:	194010ef          	jal	800032dc <uart_puts>
    8000214c:	00009517          	auipc	a0,0x9
    80002150:	8e450513          	add	a0,a0,-1820 # 8000aa30 <rodata_start+0x2a30>
    80002154:	188010ef          	jal	800032dc <uart_puts>
    80002158:	00009517          	auipc	a0,0x9
    8000215c:	91050513          	add	a0,a0,-1776 # 8000aa68 <rodata_start+0x2a68>
    80002160:	17c010ef          	jal	800032dc <uart_puts>
    80002164:	00009517          	auipc	a0,0x9
    80002168:	94c50513          	add	a0,a0,-1716 # 8000aab0 <rodata_start+0x2ab0>
    8000216c:	170010ef          	jal	800032dc <uart_puts>
    80002170:	00009517          	auipc	a0,0x9
    80002174:	98050513          	add	a0,a0,-1664 # 8000aaf0 <rodata_start+0x2af0>
    80002178:	164010ef          	jal	800032dc <uart_puts>
    8000217c:	00009517          	auipc	a0,0x9
    80002180:	99c50513          	add	a0,a0,-1636 # 8000ab18 <rodata_start+0x2b18>
    80002184:	158010ef          	jal	800032dc <uart_puts>
    80002188:	00009517          	auipc	a0,0x9
    8000218c:	9c050513          	add	a0,a0,-1600 # 8000ab48 <rodata_start+0x2b48>
    80002190:	00425797          	auipc	a5,0x425
    80002194:	2a07a823          	sw	zero,688(a5) # 80427440 <syscall_test_count>
    80002198:	144010ef          	jal	800032dc <uart_puts>
    8000219c:	00009517          	auipc	a0,0x9
    800021a0:	9dc50513          	add	a0,a0,-1572 # 8000ab78 <rodata_start+0x2b78>
    800021a4:	138010ef          	jal	800032dc <uart_puts>
    800021a8:	00009517          	auipc	a0,0x9
    800021ac:	9e850513          	add	a0,a0,-1560 # 8000ab90 <rodata_start+0x2b90>
    800021b0:	12c010ef          	jal	800032dc <uart_puts>
    800021b4:	00009517          	auipc	a0,0x9
    800021b8:	a0450513          	add	a0,a0,-1532 # 8000abb8 <rodata_start+0x2bb8>
    800021bc:	120010ef          	jal	800032dc <uart_puts>
    800021c0:	00009517          	auipc	a0,0x9
    800021c4:	a2850513          	add	a0,a0,-1496 # 8000abe8 <rodata_start+0x2be8>
    800021c8:	114010ef          	jal	800032dc <uart_puts>
    800021cc:	00009517          	auipc	a0,0x9
    800021d0:	a4450513          	add	a0,a0,-1468 # 8000ac10 <rodata_start+0x2c10>
    800021d4:	108010ef          	jal	800032dc <uart_puts>
    800021d8:	00009517          	auipc	a0,0x9
    800021dc:	a6850513          	add	a0,a0,-1432 # 8000ac40 <rodata_start+0x2c40>
    800021e0:	0fc010ef          	jal	800032dc <uart_puts>
    800021e4:	00009517          	auipc	a0,0x9
    800021e8:	a9c50513          	add	a0,a0,-1380 # 8000ac80 <rodata_start+0x2c80>
    800021ec:	0f0010ef          	jal	800032dc <uart_puts>
    800021f0:	00009517          	auipc	a0,0x9
    800021f4:	ab050513          	add	a0,a0,-1360 # 8000aca0 <rodata_start+0x2ca0>
    800021f8:	0e4010ef          	jal	800032dc <uart_puts>
    800021fc:	00009517          	auipc	a0,0x9
    80002200:	ad450513          	add	a0,a0,-1324 # 8000acd0 <rodata_start+0x2cd0>
    80002204:	0d8010ef          	jal	800032dc <uart_puts>
    80002208:	00009517          	auipc	a0,0x9
    8000220c:	ae050513          	add	a0,a0,-1312 # 8000ace8 <rodata_start+0x2ce8>
    80002210:	0cc010ef          	jal	800032dc <uart_puts>
    80002214:	00009517          	auipc	a0,0x9
    80002218:	af450513          	add	a0,a0,-1292 # 8000ad08 <rodata_start+0x2d08>
    8000221c:	0c0010ef          	jal	800032dc <uart_puts>
    80002220:	00009517          	auipc	a0,0x9
    80002224:	b2050513          	add	a0,a0,-1248 # 8000ad40 <rodata_start+0x2d40>
    80002228:	0b4010ef          	jal	800032dc <uart_puts>
    8000222c:	00009517          	auipc	a0,0x9
    80002230:	b3450513          	add	a0,a0,-1228 # 8000ad60 <rodata_start+0x2d60>
    80002234:	0a8010ef          	jal	800032dc <uart_puts>
    80002238:	00009517          	auipc	a0,0x9
    8000223c:	b3850513          	add	a0,a0,-1224 # 8000ad70 <rodata_start+0x2d70>
    80002240:	09c010ef          	jal	800032dc <uart_puts>
    80002244:	00009517          	auipc	a0,0x9
    80002248:	b5c50513          	add	a0,a0,-1188 # 8000ada0 <rodata_start+0x2da0>
    8000224c:	090010ef          	jal	800032dc <uart_puts>
    80002250:	00009517          	auipc	a0,0x9
    80002254:	b7850513          	add	a0,a0,-1160 # 8000adc8 <rodata_start+0x2dc8>
    80002258:	084010ef          	jal	800032dc <uart_puts>
    8000225c:	00009517          	auipc	a0,0x9
    80002260:	b9c50513          	add	a0,a0,-1124 # 8000adf8 <rodata_start+0x2df8>
    80002264:	078010ef          	jal	800032dc <uart_puts>
    80002268:	00009517          	auipc	a0,0x9
    8000226c:	bb850513          	add	a0,a0,-1096 # 8000ae20 <rodata_start+0x2e20>
    80002270:	06c010ef          	jal	800032dc <uart_puts>
    80002274:	00009517          	auipc	a0,0x9
    80002278:	bd450513          	add	a0,a0,-1068 # 8000ae48 <rodata_start+0x2e48>
    8000227c:	060010ef          	jal	800032dc <uart_puts>
    80002280:	00009517          	auipc	a0,0x9
    80002284:	be850513          	add	a0,a0,-1048 # 8000ae68 <rodata_start+0x2e68>
    80002288:	054010ef          	jal	800032dc <uart_puts>
    8000228c:	00009517          	auipc	a0,0x9
    80002290:	c1c50513          	add	a0,a0,-996 # 8000aea8 <rodata_start+0x2ea8>
    80002294:	00425797          	auipc	a5,0x425
    80002298:	1a07a623          	sw	zero,428(a5) # 80427440 <syscall_test_count>
    8000229c:	040010ef          	jal	800032dc <uart_puts>
    800022a0:	00009517          	auipc	a0,0x9
    800022a4:	c2050513          	add	a0,a0,-992 # 8000aec0 <rodata_start+0x2ec0>
    800022a8:	034010ef          	jal	800032dc <uart_puts>
    800022ac:	3fd030ef          	jal	80005ea8 <usertrapret>
    800022b0:	00009517          	auipc	a0,0x9
    800022b4:	86850513          	add	a0,a0,-1944 # 8000ab18 <rodata_start+0x2b18>
    800022b8:	024010ef          	jal	800032dc <uart_puts>
    800022bc:	00009517          	auipc	a0,0x9
    800022c0:	c3450513          	add	a0,a0,-972 # 8000aef0 <rodata_start+0x2ef0>
    800022c4:	018010ef          	jal	800032dc <uart_puts>
    800022c8:	00009517          	auipc	a0,0x9
    800022cc:	c5050513          	add	a0,a0,-944 # 8000af18 <rodata_start+0x2f18>
    800022d0:	00c010ef          	jal	800032dc <uart_puts>
    800022d4:	00425597          	auipc	a1,0x425
    800022d8:	16c5a583          	lw	a1,364(a1) # 80427440 <syscall_test_count>
    800022dc:	00009517          	auipc	a0,0x9
    800022e0:	c6450513          	add	a0,a0,-924 # 8000af40 <rodata_start+0x2f40>
    800022e4:	489000ef          	jal	80002f6c <printf>
    800022e8:	00425797          	auipc	a5,0x425
    800022ec:	1587a783          	lw	a5,344(a5) # 80427440 <syscall_test_count>
    800022f0:	23578663          	beq	a5,s5,8000251c <test_real_syscall_mechanism+0x86c>
    800022f4:	04843783          	ld	a5,72(s0)
    800022f8:	00842603          	lw	a2,8(s0)
    800022fc:	00009517          	auipc	a0,0x9
    80002300:	c9450513          	add	a0,a0,-876 # 8000af90 <rodata_start+0x2f90>
    80002304:	0707b583          	ld	a1,112(a5)
    80002308:	465000ef          	jal	80002f6c <printf>
    8000230c:	000a2783          	lw	a5,0(s4)
    80002310:	00f05a63          	blez	a5,80002324 <test_real_syscall_mechanism+0x674>
    80002314:	04843703          	ld	a4,72(s0)
    80002318:	00842783          	lw	a5,8(s0)
    8000231c:	07073703          	ld	a4,112(a4)
    80002320:	24f70663          	beq	a4,a5,8000256c <test_real_syscall_mechanism+0x8bc>
    80002324:	00009517          	auipc	a0,0x9
    80002328:	e4c50513          	add	a0,a0,-436 # 8000b170 <rodata_start+0x3170>
    8000232c:	7b1000ef          	jal	800032dc <uart_puts>
    80002330:	00009517          	auipc	a0,0x9
    80002334:	e7850513          	add	a0,a0,-392 # 8000b1a8 <rodata_start+0x31a8>
    80002338:	7a5000ef          	jal	800032dc <uart_puts>
    8000233c:	00000513          	li	a0,0
    80002340:	5b8040ef          	jal	800068f8 <set_current_proc>
    80002344:	00098513          	mv	a0,s3
    80002348:	05c010ef          	jal	800033a4 <free_page>
    8000234c:	00090513          	mv	a0,s2
    80002350:	054010ef          	jal	800033a4 <free_page>
    80002354:	00048513          	mv	a0,s1
    80002358:	04c010ef          	jal	800033a4 <free_page>
    8000235c:	03043503          	ld	a0,48(s0)
    80002360:	594010ef          	jal	800038f4 <destroy_pagetable>
    80002364:	04843503          	ld	a0,72(s0)
    80002368:	03c010ef          	jal	800033a4 <free_page>
    8000236c:	00040513          	mv	a0,s0
    80002370:	474040ef          	jal	800067e4 <free_proc>
    80002374:	00009517          	auipc	a0,0x9
    80002378:	e5450513          	add	a0,a0,-428 # 8000b1c8 <rodata_start+0x31c8>
    8000237c:	761000ef          	jal	800032dc <uart_puts>
    80002380:	00009517          	auipc	a0,0x9
    80002384:	e6050513          	add	a0,a0,-416 # 8000b1e0 <rodata_start+0x31e0>
    80002388:	755000ef          	jal	800032dc <uart_puts>
    8000238c:	00009517          	auipc	a0,0x9
    80002390:	e8450513          	add	a0,a0,-380 # 8000b210 <rodata_start+0x3210>
    80002394:	749000ef          	jal	800032dc <uart_puts>
    80002398:	00007517          	auipc	a0,0x7
    8000239c:	bb050513          	add	a0,a0,-1104 # 80008f48 <rodata_start+0xf48>
    800023a0:	73d000ef          	jal	800032dc <uart_puts>
    800023a4:	00007517          	auipc	a0,0x7
    800023a8:	d3c50513          	add	a0,a0,-708 # 800090e0 <rodata_start+0x10e0>
    800023ac:	731000ef          	jal	800032dc <uart_puts>
    800023b0:	00009517          	auipc	a0,0x9
    800023b4:	e7850513          	add	a0,a0,-392 # 8000b228 <rodata_start+0x3228>
    800023b8:	725000ef          	jal	800032dc <uart_puts>
    800023bc:	00009517          	auipc	a0,0x9
    800023c0:	ec450513          	add	a0,a0,-316 # 8000b280 <rodata_start+0x3280>
    800023c4:	719000ef          	jal	800032dc <uart_puts>
    800023c8:	00009517          	auipc	a0,0x9
    800023cc:	f1050513          	add	a0,a0,-240 # 8000b2d8 <rodata_start+0x32d8>
    800023d0:	70d000ef          	jal	800032dc <uart_puts>
    800023d4:	00009517          	auipc	a0,0x9
    800023d8:	f5450513          	add	a0,a0,-172 # 8000b328 <rodata_start+0x3328>
    800023dc:	701000ef          	jal	800032dc <uart_puts>
    800023e0:	00009517          	auipc	a0,0x9
    800023e4:	fa050513          	add	a0,a0,-96 # 8000b380 <rodata_start+0x3380>
    800023e8:	6f5000ef          	jal	800032dc <uart_puts>
    800023ec:	00009517          	auipc	a0,0x9
    800023f0:	fec50513          	add	a0,a0,-20 # 8000b3d8 <rodata_start+0x33d8>
    800023f4:	6e9000ef          	jal	800032dc <uart_puts>
    800023f8:	00007517          	auipc	a0,0x7
    800023fc:	e1050513          	add	a0,a0,-496 # 80009208 <rodata_start+0x1208>
    80002400:	06c0006f          	j	8000246c <test_real_syscall_mechanism+0x7bc>
    80002404:	00008517          	auipc	a0,0x8
    80002408:	10450513          	add	a0,a0,260 # 8000a508 <rodata_start+0x2508>
    8000240c:	6d1000ef          	jal	800032dc <uart_puts>
    80002410:	03043503          	ld	a0,48(s0)
    80002414:	4e0010ef          	jal	800038f4 <destroy_pagetable>
    80002418:	04843503          	ld	a0,72(s0)
    8000241c:	789000ef          	jal	800033a4 <free_page>
    80002420:	00040513          	mv	a0,s0
    80002424:	06013403          	ld	s0,96(sp)
    80002428:	06813083          	ld	ra,104(sp)
    8000242c:	05813483          	ld	s1,88(sp)
    80002430:	05013903          	ld	s2,80(sp)
    80002434:	04813983          	ld	s3,72(sp)
    80002438:	04013a03          	ld	s4,64(sp)
    8000243c:	03813a83          	ld	s5,56(sp)
    80002440:	03013b03          	ld	s6,48(sp)
    80002444:	02813b83          	ld	s7,40(sp)
    80002448:	02013c03          	ld	s8,32(sp)
    8000244c:	07010113          	add	sp,sp,112
    80002450:	3940406f          	j	800067e4 <free_proc>
    80002454:	00008517          	auipc	a0,0x8
    80002458:	1e450513          	add	a0,a0,484 # 8000a638 <rodata_start+0x2638>
    8000245c:	681000ef          	jal	800032dc <uart_puts>
    80002460:	fb1ff06f          	j	80002410 <test_real_syscall_mechanism+0x760>
    80002464:	00006517          	auipc	a0,0x6
    80002468:	c1c50513          	add	a0,a0,-996 # 80008080 <rodata_start+0x80>
    8000246c:	06013403          	ld	s0,96(sp)
    80002470:	06813083          	ld	ra,104(sp)
    80002474:	05813483          	ld	s1,88(sp)
    80002478:	05013903          	ld	s2,80(sp)
    8000247c:	04813983          	ld	s3,72(sp)
    80002480:	04013a03          	ld	s4,64(sp)
    80002484:	03813a83          	ld	s5,56(sp)
    80002488:	03013b03          	ld	s6,48(sp)
    8000248c:	02813b83          	ld	s7,40(sp)
    80002490:	02013c03          	ld	s8,32(sp)
    80002494:	07010113          	add	sp,sp,112
    80002498:	6450006f          	j	800032dc <uart_puts>
    8000249c:	00008517          	auipc	a0,0x8
    800024a0:	11c50513          	add	a0,a0,284 # 8000a5b8 <rodata_start+0x25b8>
    800024a4:	639000ef          	jal	800032dc <uart_puts>
    800024a8:	f69ff06f          	j	80002410 <test_real_syscall_mechanism+0x760>
    800024ac:	00008517          	auipc	a0,0x8
    800024b0:	f9450513          	add	a0,a0,-108 # 8000a440 <rodata_start+0x2440>
    800024b4:	629000ef          	jal	800032dc <uart_puts>
    800024b8:	f61ff06f          	j	80002418 <test_real_syscall_mechanism+0x768>
    800024bc:	00008517          	auipc	a0,0x8
    800024c0:	91c50513          	add	a0,a0,-1764 # 80009dd8 <rodata_start+0x1dd8>
    800024c4:	619000ef          	jal	800032dc <uart_puts>
    800024c8:	f59ff06f          	j	80002420 <test_real_syscall_mechanism+0x770>
    800024cc:	00008517          	auipc	a0,0x8
    800024d0:	36c50513          	add	a0,a0,876 # 8000a838 <rodata_start+0x2838>
    800024d4:	609000ef          	jal	800032dc <uart_puts>
    800024d8:	00090513          	mv	a0,s2
    800024dc:	6c9000ef          	jal	800033a4 <free_page>
    800024e0:	00048513          	mv	a0,s1
    800024e4:	6c1000ef          	jal	800033a4 <free_page>
    800024e8:	f29ff06f          	j	80002410 <test_real_syscall_mechanism+0x760>
    800024ec:	00008517          	auipc	a0,0x8
    800024f0:	21c50513          	add	a0,a0,540 # 8000a708 <rodata_start+0x2708>
    800024f4:	5e9000ef          	jal	800032dc <uart_puts>
    800024f8:	fe9ff06f          	j	800024e0 <test_real_syscall_mechanism+0x830>
    800024fc:	00008517          	auipc	a0,0x8
    80002500:	1a450513          	add	a0,a0,420 # 8000a6a0 <rodata_start+0x26a0>
    80002504:	5d9000ef          	jal	800032dc <uart_puts>
    80002508:	f09ff06f          	j	80002410 <test_real_syscall_mechanism+0x760>
    8000250c:	00008517          	auipc	a0,0x8
    80002510:	2b450513          	add	a0,a0,692 # 8000a7c0 <rodata_start+0x27c0>
    80002514:	5c9000ef          	jal	800032dc <uart_puts>
    80002518:	fc1ff06f          	j	800024d8 <test_real_syscall_mechanism+0x828>
    8000251c:	00009517          	auipc	a0,0x9
    80002520:	a4450513          	add	a0,a0,-1468 # 8000af60 <rodata_start+0x2f60>
    80002524:	5b9000ef          	jal	800032dc <uart_puts>
    80002528:	00100793          	li	a5,1
    8000252c:	00fa2023          	sw	a5,0(s4)
    80002530:	dc5ff06f          	j	800022f4 <test_real_syscall_mechanism+0x644>
    80002534:	00008517          	auipc	a0,0x8
    80002538:	26c50513          	add	a0,a0,620 # 8000a7a0 <rodata_start+0x27a0>
    8000253c:	5a1000ef          	jal	800032dc <uart_puts>
    80002540:	fa1ff06f          	j	800024e0 <test_real_syscall_mechanism+0x830>
    80002544:	00008517          	auipc	a0,0x8
    80002548:	1a450513          	add	a0,a0,420 # 8000a6e8 <rodata_start+0x26e8>
    8000254c:	591000ef          	jal	800032dc <uart_puts>
    80002550:	a0dff06f          	j	80001f5c <test_real_syscall_mechanism+0x2ac>
    80002554:	00008517          	auipc	a0,0x8
    80002558:	38450513          	add	a0,a0,900 # 8000a8d8 <rodata_start+0x28d8>
    8000255c:	581000ef          	jal	800032dc <uart_puts>
    80002560:	00098513          	mv	a0,s3
    80002564:	641000ef          	jal	800033a4 <free_page>
    80002568:	f71ff06f          	j	800024d8 <test_real_syscall_mechanism+0x828>
    8000256c:	00009517          	auipc	a0,0x9
    80002570:	a5450513          	add	a0,a0,-1452 # 8000afc0 <rodata_start+0x2fc0>
    80002574:	569000ef          	jal	800032dc <uart_puts>
    80002578:	00009517          	auipc	a0,0x9
    8000257c:	a7850513          	add	a0,a0,-1416 # 8000aff0 <rodata_start+0x2ff0>
    80002580:	55d000ef          	jal	800032dc <uart_puts>
    80002584:	00007517          	auipc	a0,0x7
    80002588:	9c450513          	add	a0,a0,-1596 # 80008f48 <rodata_start+0xf48>
    8000258c:	551000ef          	jal	800032dc <uart_puts>
    80002590:	00009517          	auipc	a0,0x9
    80002594:	a7850513          	add	a0,a0,-1416 # 8000b008 <rodata_start+0x3008>
    80002598:	545000ef          	jal	800032dc <uart_puts>
    8000259c:	00009517          	auipc	a0,0x9
    800025a0:	afc50513          	add	a0,a0,-1284 # 8000b098 <rodata_start+0x3098>
    800025a4:	539000ef          	jal	800032dc <uart_puts>
    800025a8:	00009517          	auipc	a0,0x9
    800025ac:	b3850513          	add	a0,a0,-1224 # 8000b0e0 <rodata_start+0x30e0>
    800025b0:	52d000ef          	jal	800032dc <uart_puts>
    800025b4:	d7dff06f          	j	80002330 <test_real_syscall_mechanism+0x680>

00000000800025b8 <run_syscall_tests>:
    800025b8:	ff010113          	add	sp,sp,-16
    800025bc:	00007517          	auipc	a0,0x7
    800025c0:	98c50513          	add	a0,a0,-1652 # 80008f48 <rodata_start+0xf48>
    800025c4:	00113423          	sd	ra,8(sp)
    800025c8:	515000ef          	jal	800032dc <uart_puts>
    800025cc:	00007517          	auipc	a0,0x7
    800025d0:	b1450513          	add	a0,a0,-1260 # 800090e0 <rodata_start+0x10e0>
    800025d4:	509000ef          	jal	800032dc <uart_puts>
    800025d8:	00009517          	auipc	a0,0x9
    800025dc:	e7050513          	add	a0,a0,-400 # 8000b448 <rodata_start+0x3448>
    800025e0:	4fd000ef          	jal	800032dc <uart_puts>
    800025e4:	00007517          	auipc	a0,0x7
    800025e8:	c2450513          	add	a0,a0,-988 # 80009208 <rodata_start+0x1208>
    800025ec:	4f1000ef          	jal	800032dc <uart_puts>
    800025f0:	b3dfd0ef          	jal	8000012c <test_sys_getpid>
    800025f4:	c01fd0ef          	jal	800001f4 <test_sys_uptime>
    800025f8:	cfdfd0ef          	jal	800002f4 <test_sys_fork>
    800025fc:	e3dfd0ef          	jal	80000438 <test_sys_sbrk>
    80002600:	fa9fd0ef          	jal	800005a8 <test_syscall_dispatch>
    80002604:	90cfe0ef          	jal	80000710 <test_arg_functions>
    80002608:	af8fe0ef          	jal	80000900 <test_syscall_performance>
    8000260c:	b4cff0ef          	jal	80001958 <test_user_kernel_transition>
    80002610:	ea0ff0ef          	jal	80001cb0 <test_real_syscall_mechanism>
    80002614:	c00fe0ef          	jal	80000a14 <test_process_memory>
    80002618:	d3cfe0ef          	jal	80000b54 <test_uid_limits>
    8000261c:	00007517          	auipc	a0,0x7
    80002620:	92c50513          	add	a0,a0,-1748 # 80008f48 <rodata_start+0xf48>
    80002624:	4b9000ef          	jal	800032dc <uart_puts>
    80002628:	00007517          	auipc	a0,0x7
    8000262c:	ab850513          	add	a0,a0,-1352 # 800090e0 <rodata_start+0x10e0>
    80002630:	4ad000ef          	jal	800032dc <uart_puts>
    80002634:	00009517          	auipc	a0,0x9
    80002638:	e7450513          	add	a0,a0,-396 # 8000b4a8 <rodata_start+0x34a8>
    8000263c:	4a1000ef          	jal	800032dc <uart_puts>
    80002640:	00007517          	auipc	a0,0x7
    80002644:	ce850513          	add	a0,a0,-792 # 80009328 <rodata_start+0x1328>
    80002648:	495000ef          	jal	800032dc <uart_puts>
    8000264c:	00007517          	auipc	a0,0x7
    80002650:	dac50513          	add	a0,a0,-596 # 800093f8 <rodata_start+0x13f8>
    80002654:	489000ef          	jal	800032dc <uart_puts>
    80002658:	00009517          	auipc	a0,0x9
    8000265c:	ea850513          	add	a0,a0,-344 # 8000b500 <rodata_start+0x3500>
    80002660:	47d000ef          	jal	800032dc <uart_puts>
    80002664:	00009517          	auipc	a0,0x9
    80002668:	ecc50513          	add	a0,a0,-308 # 8000b530 <rodata_start+0x3530>
    8000266c:	471000ef          	jal	800032dc <uart_puts>
    80002670:	00009517          	auipc	a0,0x9
    80002674:	f0050513          	add	a0,a0,-256 # 8000b570 <rodata_start+0x3570>
    80002678:	465000ef          	jal	800032dc <uart_puts>
    8000267c:	00009517          	auipc	a0,0x9
    80002680:	f2450513          	add	a0,a0,-220 # 8000b5a0 <rodata_start+0x35a0>
    80002684:	459000ef          	jal	800032dc <uart_puts>
    80002688:	00009517          	auipc	a0,0x9
    8000268c:	f4850513          	add	a0,a0,-184 # 8000b5d0 <rodata_start+0x35d0>
    80002690:	44d000ef          	jal	800032dc <uart_puts>
    80002694:	00009517          	auipc	a0,0x9
    80002698:	f6450513          	add	a0,a0,-156 # 8000b5f8 <rodata_start+0x35f8>
    8000269c:	441000ef          	jal	800032dc <uart_puts>
    800026a0:	00009517          	auipc	a0,0x9
    800026a4:	f8050513          	add	a0,a0,-128 # 8000b620 <rodata_start+0x3620>
    800026a8:	435000ef          	jal	800032dc <uart_puts>
    800026ac:	00009517          	auipc	a0,0x9
    800026b0:	f9c50513          	add	a0,a0,-100 # 8000b648 <rodata_start+0x3648>
    800026b4:	429000ef          	jal	800032dc <uart_puts>
    800026b8:	00009517          	auipc	a0,0x9
    800026bc:	fc050513          	add	a0,a0,-64 # 8000b678 <rodata_start+0x3678>
    800026c0:	41d000ef          	jal	800032dc <uart_puts>
    800026c4:	00813083          	ld	ra,8(sp)
    800026c8:	00009517          	auipc	a0,0x9
    800026cc:	fd850513          	add	a0,a0,-40 # 8000b6a0 <rodata_start+0x36a0>
    800026d0:	01010113          	add	sp,sp,16
    800026d4:	4090006f          	j	800032dc <uart_puts>

00000000800026d8 <test_timer_interrupt>:
    800026d8:	fd010113          	add	sp,sp,-48
    800026dc:	00009517          	auipc	a0,0x9
    800026e0:	ff450513          	add	a0,a0,-12 # 8000b6d0 <rodata_start+0x36d0>
    800026e4:	02113423          	sd	ra,40(sp)
    800026e8:	02813023          	sd	s0,32(sp)
    800026ec:	00913c23          	sd	s1,24(sp)
    800026f0:	3ed000ef          	jal	800032dc <uart_puts>
    800026f4:	00009517          	auipc	a0,0x9
    800026f8:	01450513          	add	a0,a0,20 # 8000b708 <rodata_start+0x3708>
    800026fc:	3e1000ef          	jal	800032dc <uart_puts>
    80002700:	00009517          	auipc	a0,0x9
    80002704:	03850513          	add	a0,a0,56 # 8000b738 <rodata_start+0x3738>
    80002708:	3d5000ef          	jal	800032dc <uart_puts>
    8000270c:	00425417          	auipc	s0,0x425
    80002710:	d4440413          	add	s0,s0,-700 # 80427450 <ticks>
    80002714:	00009517          	auipc	a0,0x9
    80002718:	05450513          	add	a0,a0,84 # 8000b768 <rodata_start+0x3768>
    8000271c:	3c1000ef          	jal	800032dc <uart_puts>
    80002720:	00043483          	ld	s1,0(s0)
    80002724:	00009517          	auipc	a0,0x9
    80002728:	07450513          	add	a0,a0,116 # 8000b798 <rodata_start+0x3798>
    8000272c:	00048593          	mv	a1,s1
    80002730:	03d000ef          	jal	80002f6c <printf>
    80002734:	4a4030ef          	jal	80005bd8 <intr_on>
    80002738:	00009517          	auipc	a0,0x9
    8000273c:	07850513          	add	a0,a0,120 # 8000b7b0 <rodata_start+0x37b0>
    80002740:	39d000ef          	jal	800032dc <uart_puts>
    80002744:	00009517          	auipc	a0,0x9
    80002748:	08450513          	add	a0,a0,132 # 8000b7c8 <rodata_start+0x37c8>
    8000274c:	391000ef          	jal	800032dc <uart_puts>
    80002750:	00043783          	ld	a5,0(s0)
    80002754:	00000593          	li	a1,0
    80002758:	00f13423          	sd	a5,8(sp)
    8000275c:	00813783          	ld	a5,8(sp)
    80002760:	00043703          	ld	a4,0(s0)
    80002764:	02f71263          	bne	a4,a5,80002788 <test_timer_interrupt+0xb0>
    80002768:	05f5e6b7          	lui	a3,0x5f5e
    8000276c:	10068693          	add	a3,a3,256 # 5f5e100 <_entry-0x7a0a1f00>
    80002770:	0080006f          	j	80002778 <test_timer_interrupt+0xa0>
    80002774:	00d58a63          	beq	a1,a3,80002788 <test_timer_interrupt+0xb0>
    80002778:	00813703          	ld	a4,8(sp)
    8000277c:	00043783          	ld	a5,0(s0)
    80002780:	0015859b          	addw	a1,a1,1
    80002784:	fef708e3          	beq	a4,a5,80002774 <test_timer_interrupt+0x9c>
    80002788:	00009517          	auipc	a0,0x9
    8000278c:	05850513          	add	a0,a0,88 # 8000b7e0 <rodata_start+0x37e0>
    80002790:	7dc000ef          	jal	80002f6c <printf>
    80002794:	00043583          	ld	a1,0(s0)
    80002798:	00009517          	auipc	a0,0x9
    8000279c:	06050513          	add	a0,a0,96 # 8000b7f8 <rodata_start+0x37f8>
    800027a0:	7cc000ef          	jal	80002f6c <printf>
    800027a4:	00043783          	ld	a5,0(s0)
    800027a8:	04f4f063          	bgeu	s1,a5,800027e8 <test_timer_interrupt+0x110>
    800027ac:	00043583          	ld	a1,0(s0)
    800027b0:	00009517          	auipc	a0,0x9
    800027b4:	06050513          	add	a0,a0,96 # 8000b810 <rodata_start+0x3810>
    800027b8:	409585b3          	sub	a1,a1,s1
    800027bc:	7b0000ef          	jal	80002f6c <printf>
    800027c0:	00009517          	auipc	a0,0x9
    800027c4:	08850513          	add	a0,a0,136 # 8000b848 <rodata_start+0x3848>
    800027c8:	315000ef          	jal	800032dc <uart_puts>
    800027cc:	02013403          	ld	s0,32(sp)
    800027d0:	02813083          	ld	ra,40(sp)
    800027d4:	01813483          	ld	s1,24(sp)
    800027d8:	00009517          	auipc	a0,0x9
    800027dc:	a3850513          	add	a0,a0,-1480 # 8000b210 <rodata_start+0x3210>
    800027e0:	03010113          	add	sp,sp,48
    800027e4:	2f90006f          	j	800032dc <uart_puts>
    800027e8:	00009517          	auipc	a0,0x9
    800027ec:	08850513          	add	a0,a0,136 # 8000b870 <rodata_start+0x3870>
    800027f0:	2ed000ef          	jal	800032dc <uart_puts>
    800027f4:	02013403          	ld	s0,32(sp)
    800027f8:	02813083          	ld	ra,40(sp)
    800027fc:	01813483          	ld	s1,24(sp)
    80002800:	00009517          	auipc	a0,0x9
    80002804:	a1050513          	add	a0,a0,-1520 # 8000b210 <rodata_start+0x3210>
    80002808:	03010113          	add	sp,sp,48
    8000280c:	2d10006f          	j	800032dc <uart_puts>

0000000080002810 <test_repeated_initialization>:
    80002810:	fe010113          	add	sp,sp,-32
    80002814:	00009517          	auipc	a0,0x9
    80002818:	07c50513          	add	a0,a0,124 # 8000b890 <rodata_start+0x3890>
    8000281c:	00113c23          	sd	ra,24(sp)
    80002820:	00813823          	sd	s0,16(sp)
    80002824:	00913423          	sd	s1,8(sp)
    80002828:	01213023          	sd	s2,0(sp)
    8000282c:	2b1000ef          	jal	800032dc <uart_puts>
    80002830:	00009517          	auipc	a0,0x9
    80002834:	0a050513          	add	a0,a0,160 # 8000b8d0 <rodata_start+0x38d0>
    80002838:	2a5000ef          	jal	800032dc <uart_puts>
    8000283c:	00000413          	li	s0,0
    80002840:	00009917          	auipc	s2,0x9
    80002844:	0a890913          	add	s2,s2,168 # 8000b8e8 <rodata_start+0x38e8>
    80002848:	00500493          	li	s1,5
    8000284c:	3c8030ef          	jal	80005c14 <trap_init>
    80002850:	0014041b          	addw	s0,s0,1
    80002854:	470030ef          	jal	80005cc4 <trap_init_hart>
    80002858:	00040593          	mv	a1,s0
    8000285c:	00090513          	mv	a0,s2
    80002860:	70c000ef          	jal	80002f6c <printf>
    80002864:	fe9414e3          	bne	s0,s1,8000284c <test_repeated_initialization+0x3c>
    80002868:	00009517          	auipc	a0,0x9
    8000286c:	0a050513          	add	a0,a0,160 # 8000b908 <rodata_start+0x3908>
    80002870:	26d000ef          	jal	800032dc <uart_puts>
    80002874:	01013403          	ld	s0,16(sp)
    80002878:	01813083          	ld	ra,24(sp)
    8000287c:	00813483          	ld	s1,8(sp)
    80002880:	00013903          	ld	s2,0(sp)
    80002884:	00008517          	auipc	a0,0x8
    80002888:	aa450513          	add	a0,a0,-1372 # 8000a328 <rodata_start+0x2328>
    8000288c:	02010113          	add	sp,sp,32
    80002890:	24d0006f          	j	800032dc <uart_puts>

0000000080002894 <run_all_system_tests>:
    80002894:	ff010113          	add	sp,sp,-16
    80002898:	00006517          	auipc	a0,0x6
    8000289c:	6b050513          	add	a0,a0,1712 # 80008f48 <rodata_start+0xf48>
    800028a0:	00113423          	sd	ra,8(sp)
    800028a4:	239000ef          	jal	800032dc <uart_puts>
    800028a8:	00007517          	auipc	a0,0x7
    800028ac:	83850513          	add	a0,a0,-1992 # 800090e0 <rodata_start+0x10e0>
    800028b0:	22d000ef          	jal	800032dc <uart_puts>
    800028b4:	00009517          	auipc	a0,0x9
    800028b8:	07c50513          	add	a0,a0,124 # 8000b930 <rodata_start+0x3930>
    800028bc:	221000ef          	jal	800032dc <uart_puts>
    800028c0:	00007517          	auipc	a0,0x7
    800028c4:	94850513          	add	a0,a0,-1720 # 80009208 <rodata_start+0x1208>
    800028c8:	215000ef          	jal	800032dc <uart_puts>
    800028cc:	b45fe0ef          	jal	80001410 <test_trap_initialization>
    800028d0:	bbdfe0ef          	jal	8000148c <test_interrupt_control>
    800028d4:	c8dfe0ef          	jal	80001560 <test_trapframe_allocation>
    800028d8:	e15fe0ef          	jal	800016ec <test_csr_operations>
    800028dc:	ea9fe0ef          	jal	80001784 <test_exception_definitions>
    800028e0:	f61fe0ef          	jal	80001840 <test_trapframe_structure>
    800028e4:	800ff0ef          	jal	800018e4 <test_interrupt_handlers>
    800028e8:	df1ff0ef          	jal	800026d8 <test_timer_interrupt>
    800028ec:	f25ff0ef          	jal	80002810 <test_repeated_initialization>
    800028f0:	00006517          	auipc	a0,0x6
    800028f4:	65850513          	add	a0,a0,1624 # 80008f48 <rodata_start+0xf48>
    800028f8:	1e5000ef          	jal	800032dc <uart_puts>
    800028fc:	00006517          	auipc	a0,0x6
    80002900:	7e450513          	add	a0,a0,2020 # 800090e0 <rodata_start+0x10e0>
    80002904:	1d9000ef          	jal	800032dc <uart_puts>
    80002908:	00009517          	auipc	a0,0x9
    8000290c:	08850513          	add	a0,a0,136 # 8000b990 <rodata_start+0x3990>
    80002910:	1cd000ef          	jal	800032dc <uart_puts>
    80002914:	00813083          	ld	ra,8(sp)
    80002918:	00007517          	auipc	a0,0x7
    8000291c:	a1050513          	add	a0,a0,-1520 # 80009328 <rodata_start+0x1328>
    80002920:	01010113          	add	sp,sp,16
    80002924:	1b90006f          	j	800032dc <uart_puts>

0000000080002928 <run_interrupt_exception_tests>:
    80002928:	f6dff06f          	j	80002894 <run_all_system_tests>

000000008000292c <main>:
    8000292c:	ff010113          	add	sp,sp,-16
    80002930:	00009517          	auipc	a0,0x9
    80002934:	0b850513          	add	a0,a0,184 # 8000b9e8 <rodata_start+0x39e8>
    80002938:	00113423          	sd	ra,8(sp)
    8000293c:	1a1000ef          	jal	800032dc <uart_puts>
    80002940:	01100593          	li	a1,17
    80002944:	02001537          	lui	a0,0x2001
    80002948:	01b59593          	sll	a1,a1,0x1b
    8000294c:	00651513          	sll	a0,a0,0x6
    80002950:	1b9000ef          	jal	80003308 <pmm_init>
    80002954:	00009517          	auipc	a0,0x9
    80002958:	0cc50513          	add	a0,a0,204 # 8000ba20 <rodata_start+0x3a20>
    8000295c:	181000ef          	jal	800032dc <uart_puts>
    80002960:	00009517          	auipc	a0,0x9
    80002964:	0f850513          	add	a0,a0,248 # 8000ba58 <rodata_start+0x3a58>
    80002968:	175000ef          	jal	800032dc <uart_puts>
    8000296c:	680010ef          	jal	80003fec <kvminit>
    80002970:	2ec010ef          	jal	80003c5c <kvminithart>
    80002974:	00009517          	auipc	a0,0x9
    80002978:	11c50513          	add	a0,a0,284 # 8000ba90 <rodata_start+0x3a90>
    8000297c:	161000ef          	jal	800032dc <uart_puts>
    80002980:	00009517          	auipc	a0,0x9
    80002984:	14850513          	add	a0,a0,328 # 8000bac8 <rodata_start+0x3ac8>
    80002988:	155000ef          	jal	800032dc <uart_puts>
    8000298c:	288030ef          	jal	80005c14 <trap_init>
    80002990:	334030ef          	jal	80005cc4 <trap_init_hart>
    80002994:	00009517          	auipc	a0,0x9
    80002998:	16c50513          	add	a0,a0,364 # 8000bb00 <rodata_start+0x3b00>
    8000299c:	141000ef          	jal	800032dc <uart_puts>
    800029a0:	00009517          	auipc	a0,0x9
    800029a4:	19050513          	add	a0,a0,400 # 8000bb30 <rodata_start+0x3b30>
    800029a8:	135000ef          	jal	800032dc <uart_puts>
    800029ac:	38c030ef          	jal	80005d38 <timerinit>
    800029b0:	00009517          	auipc	a0,0x9
    800029b4:	1b850513          	add	a0,a0,440 # 8000bb68 <rodata_start+0x3b68>
    800029b8:	125000ef          	jal	800032dc <uart_puts>
    800029bc:	00009517          	auipc	a0,0x9
    800029c0:	1dc50513          	add	a0,a0,476 # 8000bb98 <rodata_start+0x3b98>
    800029c4:	119000ef          	jal	800032dc <uart_puts>
    800029c8:	3c9030ef          	jal	80006590 <proc_init>
    800029cc:	00009517          	auipc	a0,0x9
    800029d0:	20450513          	add	a0,a0,516 # 8000bbd0 <rodata_start+0x3bd0>
    800029d4:	109000ef          	jal	800032dc <uart_puts>
    800029d8:	be1ff0ef          	jal	800025b8 <run_syscall_tests>
    800029dc:	00009517          	auipc	a0,0x9
    800029e0:	22450513          	add	a0,a0,548 # 8000bc00 <rodata_start+0x3c00>
    800029e4:	0f9000ef          	jal	800032dc <uart_puts>
    800029e8:	10500073          	wfi
    800029ec:	10500073          	wfi
    800029f0:	ff9ff06f          	j	800029e8 <main+0xbc>

00000000800029f4 <print_number>:
    800029f4:	0c050663          	beqz	a0,80002ac0 <print_number+0xcc>
    800029f8:	fd010113          	add	sp,sp,-48
    800029fc:	02113423          	sd	ra,40(sp)
    80002a00:	02813023          	sd	s0,32(sp)
    80002a04:	08061a63          	bnez	a2,80002a98 <print_number+0xa4>
    80002a08:	0005071b          	sext.w	a4,a0
    80002a0c:	00000613          	li	a2,0
    80002a10:	0005859b          	sext.w	a1,a1
    80002a14:	00010fa3          	sb	zero,31(sp)
    80002a18:	01e10813          	add	a6,sp,30
    80002a1c:	01f00693          	li	a3,31
    80002a20:	00009317          	auipc	t1,0x9
    80002a24:	4e830313          	add	t1,t1,1256 # 8000bf08 <digits>
    80002a28:	02b777bb          	remuw	a5,a4,a1
    80002a2c:	fff80813          	add	a6,a6,-1
    80002a30:	0007089b          	sext.w	a7,a4
    80002a34:	00068e13          	mv	t3,a3
    80002a38:	fff6869b          	addw	a3,a3,-1
    80002a3c:	02079793          	sll	a5,a5,0x20
    80002a40:	0207d793          	srl	a5,a5,0x20
    80002a44:	00f307b3          	add	a5,t1,a5
    80002a48:	0007c503          	lbu	a0,0(a5)
    80002a4c:	02b7573b          	divuw	a4,a4,a1
    80002a50:	00a800a3          	sb	a0,1(a6)
    80002a54:	fcb8fae3          	bgeu	a7,a1,80002a28 <print_number+0x34>
    80002a58:	04060a63          	beqz	a2,80002aac <print_number+0xb8>
    80002a5c:	ffee069b          	addw	a3,t3,-2
    80002a60:	02068793          	add	a5,a3,32
    80002a64:	002787b3          	add	a5,a5,sp
    80002a68:	02d00713          	li	a4,45
    80002a6c:	fee78023          	sb	a4,-32(a5)
    80002a70:	02d00513          	li	a0,45
    80002a74:	00d10433          	add	s0,sp,a3
    80002a78:	00140413          	add	s0,s0,1
    80002a7c:	049000ef          	jal	800032c4 <uart_putc>
    80002a80:	00044503          	lbu	a0,0(s0)
    80002a84:	fe051ae3          	bnez	a0,80002a78 <print_number+0x84>
    80002a88:	02813083          	ld	ra,40(sp)
    80002a8c:	02013403          	ld	s0,32(sp)
    80002a90:	03010113          	add	sp,sp,48
    80002a94:	00008067          	ret
    80002a98:	f60558e3          	bgez	a0,80002a08 <print_number+0x14>
    80002a9c:	80000737          	lui	a4,0x80000
    80002aa0:	f6e508e3          	beq	a0,a4,80002a10 <print_number+0x1c>
    80002aa4:	40a0073b          	negw	a4,a0
    80002aa8:	f69ff06f          	j	80002a10 <print_number+0x1c>
    80002aac:	fc0514e3          	bnez	a0,80002a74 <print_number+0x80>
    80002ab0:	02813083          	ld	ra,40(sp)
    80002ab4:	02013403          	ld	s0,32(sp)
    80002ab8:	03010113          	add	sp,sp,48
    80002abc:	00008067          	ret
    80002ac0:	03000513          	li	a0,48
    80002ac4:	0010006f          	j	800032c4 <uart_putc>

0000000080002ac8 <print_number_long.part.0>:
    80002ac8:	fd010113          	add	sp,sp,-48
    80002acc:	02113423          	sd	ra,40(sp)
    80002ad0:	02813023          	sd	s0,32(sp)
    80002ad4:	00050793          	mv	a5,a0
    80002ad8:	00060463          	beqz	a2,80002ae0 <print_number_long.part.0+0x18>
    80002adc:	08054c63          	bltz	a0,80002b74 <print_number_long.part.0+0xac>
    80002ae0:	00000613          	li	a2,0
    80002ae4:	00010fa3          	sb	zero,31(sp)
    80002ae8:	01e10813          	add	a6,sp,30
    80002aec:	01f00693          	li	a3,31
    80002af0:	00009317          	auipc	t1,0x9
    80002af4:	41830313          	add	t1,t1,1048 # 8000bf08 <digits>
    80002af8:	02b7f733          	remu	a4,a5,a1
    80002afc:	fff80813          	add	a6,a6,-1
    80002b00:	00078893          	mv	a7,a5
    80002b04:	00068e13          	mv	t3,a3
    80002b08:	fff6869b          	addw	a3,a3,-1
    80002b0c:	00e30733          	add	a4,t1,a4
    80002b10:	00074503          	lbu	a0,0(a4) # ffffffff80000000 <bss_end+0xfffffffeffbd8b90>
    80002b14:	02b7d7b3          	divu	a5,a5,a1
    80002b18:	00a800a3          	sb	a0,1(a6)
    80002b1c:	fcb8fee3          	bgeu	a7,a1,80002af8 <print_number_long.part.0+0x30>
    80002b20:	04060063          	beqz	a2,80002b60 <print_number_long.part.0+0x98>
    80002b24:	ffee069b          	addw	a3,t3,-2
    80002b28:	02068793          	add	a5,a3,32
    80002b2c:	002787b3          	add	a5,a5,sp
    80002b30:	02d00713          	li	a4,45
    80002b34:	fee78023          	sb	a4,-32(a5)
    80002b38:	02d00513          	li	a0,45
    80002b3c:	00d10433          	add	s0,sp,a3
    80002b40:	00140413          	add	s0,s0,1
    80002b44:	780000ef          	jal	800032c4 <uart_putc>
    80002b48:	00044503          	lbu	a0,0(s0)
    80002b4c:	fe051ae3          	bnez	a0,80002b40 <print_number_long.part.0+0x78>
    80002b50:	02813083          	ld	ra,40(sp)
    80002b54:	02013403          	ld	s0,32(sp)
    80002b58:	03010113          	add	sp,sp,48
    80002b5c:	00008067          	ret
    80002b60:	fc051ee3          	bnez	a0,80002b3c <print_number_long.part.0+0x74>
    80002b64:	02813083          	ld	ra,40(sp)
    80002b68:	02013403          	ld	s0,32(sp)
    80002b6c:	03010113          	add	sp,sp,48
    80002b70:	00008067          	ret
    80002b74:	40a007b3          	neg	a5,a0
    80002b78:	f6dff06f          	j	80002ae4 <print_number_long.part.0+0x1c>

0000000080002b7c <clear_screen>:
    80002b7c:	00009517          	auipc	a0,0x9
    80002b80:	0b450513          	add	a0,a0,180 # 8000bc30 <rodata_start+0x3c30>
    80002b84:	7580006f          	j	800032dc <uart_puts>

0000000080002b88 <clear_line>:
    80002b88:	00009517          	auipc	a0,0x9
    80002b8c:	0b050513          	add	a0,a0,176 # 8000bc38 <rodata_start+0x3c38>
    80002b90:	74c0006f          	j	800032dc <uart_puts>

0000000080002b94 <goto_xy>:
    80002b94:	fd010113          	add	sp,sp,-48
    80002b98:	00913c23          	sd	s1,24(sp)
    80002b9c:	00050493          	mv	s1,a0
    80002ba0:	01b00513          	li	a0,27
    80002ba4:	02113423          	sd	ra,40(sp)
    80002ba8:	02813023          	sd	s0,32(sp)
    80002bac:	01213823          	sd	s2,16(sp)
    80002bb0:	00058413          	mv	s0,a1
    80002bb4:	01313423          	sd	s3,8(sp)
    80002bb8:	70c000ef          	jal	800032c4 <uart_putc>
    80002bbc:	05b00513          	li	a0,91
    80002bc0:	704000ef          	jal	800032c4 <uart_putc>
    80002bc4:	06300793          	li	a5,99
    80002bc8:	0c87cc63          	blt	a5,s0,80002ca0 <goto_xy+0x10c>
    80002bcc:	00900793          	li	a5,9
    80002bd0:	0487ce63          	blt	a5,s0,80002c2c <goto_xy+0x98>
    80002bd4:	12805a63          	blez	s0,80002d08 <goto_xy+0x174>
    80002bd8:	0304041b          	addw	s0,s0,48
    80002bdc:	0ff47513          	zext.b	a0,s0
    80002be0:	6e4000ef          	jal	800032c4 <uart_putc>
    80002be4:	03b00513          	li	a0,59
    80002be8:	6dc000ef          	jal	800032c4 <uart_putc>
    80002bec:	06300793          	li	a5,99
    80002bf0:	0697c863          	blt	a5,s1,80002c60 <goto_xy+0xcc>
    80002bf4:	00900793          	li	a5,9
    80002bf8:	0e97c463          	blt	a5,s1,80002ce0 <goto_xy+0x14c>
    80002bfc:	10905c63          	blez	s1,80002d14 <goto_xy+0x180>
    80002c00:	0304851b          	addw	a0,s1,48
    80002c04:	0ff57513          	zext.b	a0,a0
    80002c08:	6bc000ef          	jal	800032c4 <uart_putc>
    80002c0c:	02013403          	ld	s0,32(sp)
    80002c10:	02813083          	ld	ra,40(sp)
    80002c14:	01813483          	ld	s1,24(sp)
    80002c18:	01013903          	ld	s2,16(sp)
    80002c1c:	00813983          	ld	s3,8(sp)
    80002c20:	04800513          	li	a0,72
    80002c24:	03010113          	add	sp,sp,48
    80002c28:	69c0006f          	j	800032c4 <uart_putc>
    80002c2c:	00a00913          	li	s2,10
    80002c30:	0324453b          	divw	a0,s0,s2
    80002c34:	0305051b          	addw	a0,a0,48
    80002c38:	0ff57513          	zext.b	a0,a0
    80002c3c:	688000ef          	jal	800032c4 <uart_putc>
    80002c40:	0324643b          	remw	s0,s0,s2
    80002c44:	0304041b          	addw	s0,s0,48
    80002c48:	0ff47513          	zext.b	a0,s0
    80002c4c:	678000ef          	jal	800032c4 <uart_putc>
    80002c50:	03b00513          	li	a0,59
    80002c54:	670000ef          	jal	800032c4 <uart_putc>
    80002c58:	06300793          	li	a5,99
    80002c5c:	f897dce3          	bge	a5,s1,80002bf4 <goto_xy+0x60>
    80002c60:	06400413          	li	s0,100
    80002c64:	0284c53b          	divw	a0,s1,s0
    80002c68:	00a00913          	li	s2,10
    80002c6c:	0305051b          	addw	a0,a0,48
    80002c70:	0ff57513          	zext.b	a0,a0
    80002c74:	650000ef          	jal	800032c4 <uart_putc>
    80002c78:	0284e53b          	remw	a0,s1,s0
    80002c7c:	0325453b          	divw	a0,a0,s2
    80002c80:	0305051b          	addw	a0,a0,48
    80002c84:	0ff57513          	zext.b	a0,a0
    80002c88:	63c000ef          	jal	800032c4 <uart_putc>
    80002c8c:	0324e53b          	remw	a0,s1,s2
    80002c90:	0305051b          	addw	a0,a0,48
    80002c94:	0ff57513          	zext.b	a0,a0
    80002c98:	62c000ef          	jal	800032c4 <uart_putc>
    80002c9c:	f71ff06f          	j	80002c0c <goto_xy+0x78>
    80002ca0:	06400913          	li	s2,100
    80002ca4:	0324453b          	divw	a0,s0,s2
    80002ca8:	00a00993          	li	s3,10
    80002cac:	0305051b          	addw	a0,a0,48
    80002cb0:	0ff57513          	zext.b	a0,a0
    80002cb4:	610000ef          	jal	800032c4 <uart_putc>
    80002cb8:	0324653b          	remw	a0,s0,s2
    80002cbc:	0335453b          	divw	a0,a0,s3
    80002cc0:	0305051b          	addw	a0,a0,48
    80002cc4:	0ff57513          	zext.b	a0,a0
    80002cc8:	5fc000ef          	jal	800032c4 <uart_putc>
    80002ccc:	0334643b          	remw	s0,s0,s3
    80002cd0:	0304041b          	addw	s0,s0,48
    80002cd4:	0ff47513          	zext.b	a0,s0
    80002cd8:	5ec000ef          	jal	800032c4 <uart_putc>
    80002cdc:	f09ff06f          	j	80002be4 <goto_xy+0x50>
    80002ce0:	00a00413          	li	s0,10
    80002ce4:	0284c53b          	divw	a0,s1,s0
    80002ce8:	0305051b          	addw	a0,a0,48
    80002cec:	0ff57513          	zext.b	a0,a0
    80002cf0:	5d4000ef          	jal	800032c4 <uart_putc>
    80002cf4:	0284e53b          	remw	a0,s1,s0
    80002cf8:	0305051b          	addw	a0,a0,48
    80002cfc:	0ff57513          	zext.b	a0,a0
    80002d00:	5c4000ef          	jal	800032c4 <uart_putc>
    80002d04:	f09ff06f          	j	80002c0c <goto_xy+0x78>
    80002d08:	03100513          	li	a0,49
    80002d0c:	5b8000ef          	jal	800032c4 <uart_putc>
    80002d10:	ed5ff06f          	j	80002be4 <goto_xy+0x50>
    80002d14:	03100513          	li	a0,49
    80002d18:	5ac000ef          	jal	800032c4 <uart_putc>
    80002d1c:	ef1ff06f          	j	80002c0c <goto_xy+0x78>

0000000080002d20 <printf_color>:
    80002d20:	f8010113          	add	sp,sp,-128
    80002d24:	02913c23          	sd	s1,56(sp)
    80002d28:	00050493          	mv	s1,a0
    80002d2c:	01b00513          	li	a0,27
    80002d30:	06f13423          	sd	a5,104(sp)
    80002d34:	04113423          	sd	ra,72(sp)
    80002d38:	04813023          	sd	s0,64(sp)
    80002d3c:	04c13823          	sd	a2,80(sp)
    80002d40:	04d13c23          	sd	a3,88(sp)
    80002d44:	06e13023          	sd	a4,96(sp)
    80002d48:	07013823          	sd	a6,112(sp)
    80002d4c:	07113c23          	sd	a7,120(sp)
    80002d50:	00058413          	mv	s0,a1
    80002d54:	03213823          	sd	s2,48(sp)
    80002d58:	03313423          	sd	s3,40(sp)
    80002d5c:	03413023          	sd	s4,32(sp)
    80002d60:	01513c23          	sd	s5,24(sp)
    80002d64:	560000ef          	jal	800032c4 <uart_putc>
    80002d68:	05b00513          	li	a0,91
    80002d6c:	558000ef          	jal	800032c4 <uart_putc>
    80002d70:	06300793          	li	a5,99
    80002d74:	1a97e063          	bltu	a5,s1,80002f14 <printf_color+0x1f4>
    80002d78:	00900793          	li	a5,9
    80002d7c:	1497e663          	bltu	a5,s1,80002ec8 <printf_color+0x1a8>
    80002d80:	0304851b          	addw	a0,s1,48
    80002d84:	0ff57513          	zext.b	a0,a0
    80002d88:	53c000ef          	jal	800032c4 <uart_putc>
    80002d8c:	06d00513          	li	a0,109
    80002d90:	534000ef          	jal	800032c4 <uart_putc>
    80002d94:	1c040863          	beqz	s0,80002f64 <printf_color+0x244>
    80002d98:	00044503          	lbu	a0,0(s0)
    80002d9c:	05010793          	add	a5,sp,80
    80002da0:	00f13423          	sd	a5,8(sp)
    80002da4:	00000a93          	li	s5,0
    80002da8:	06050463          	beqz	a0,80002e10 <printf_color+0xf0>
    80002dac:	02500913          	li	s2,37
    80002db0:	02000a13          	li	s4,32
    80002db4:	00009997          	auipc	s3,0x9
    80002db8:	fc498993          	add	s3,s3,-60 # 8000bd78 <rodata_start+0x3d78>
    80002dbc:	00140493          	add	s1,s0,1
    80002dc0:	13251863          	bne	a0,s2,80002ef0 <printf_color+0x1d0>
    80002dc4:	00144783          	lbu	a5,1(s0)
    80002dc8:	14078063          	beqz	a5,80002f08 <printf_color+0x1e8>
    80002dcc:	13278863          	beq	a5,s2,80002efc <printf_color+0x1dc>
    80002dd0:	fa87879b          	addw	a5,a5,-88
    80002dd4:	0ff7f793          	zext.b	a5,a5
    80002dd8:	00fa6c63          	bltu	s4,a5,80002df0 <printf_color+0xd0>
    80002ddc:	00279793          	sll	a5,a5,0x2
    80002de0:	013787b3          	add	a5,a5,s3
    80002de4:	0007a783          	lw	a5,0(a5)
    80002de8:	013787b3          	add	a5,a5,s3
    80002dec:	00078067          	jr	a5
    80002df0:	02500513          	li	a0,37
    80002df4:	4d0000ef          	jal	800032c4 <uart_putc>
    80002df8:	00144503          	lbu	a0,1(s0)
    80002dfc:	ffe00a93          	li	s5,-2
    80002e00:	4c4000ef          	jal	800032c4 <uart_putc>
    80002e04:	0014c503          	lbu	a0,1(s1)
    80002e08:	00148413          	add	s0,s1,1
    80002e0c:	fa0518e3          	bnez	a0,80002dbc <printf_color+0x9c>
    80002e10:	00009517          	auipc	a0,0x9
    80002e14:	e3850513          	add	a0,a0,-456 # 8000bc48 <rodata_start+0x3c48>
    80002e18:	4c4000ef          	jal	800032dc <uart_puts>
    80002e1c:	04813083          	ld	ra,72(sp)
    80002e20:	04013403          	ld	s0,64(sp)
    80002e24:	03813483          	ld	s1,56(sp)
    80002e28:	03013903          	ld	s2,48(sp)
    80002e2c:	02813983          	ld	s3,40(sp)
    80002e30:	02013a03          	ld	s4,32(sp)
    80002e34:	000a8513          	mv	a0,s5
    80002e38:	01813a83          	ld	s5,24(sp)
    80002e3c:	08010113          	add	sp,sp,128
    80002e40:	00008067          	ret
    80002e44:	00813783          	ld	a5,8(sp)
    80002e48:	00000613          	li	a2,0
    80002e4c:	01000593          	li	a1,16
    80002e50:	0007a503          	lw	a0,0(a5)
    80002e54:	00878793          	add	a5,a5,8
    80002e58:	00f13423          	sd	a5,8(sp)
    80002e5c:	b99ff0ef          	jal	800029f4 <print_number>
    80002e60:	fa5ff06f          	j	80002e04 <printf_color+0xe4>
    80002e64:	00813783          	ld	a5,8(sp)
    80002e68:	0007c503          	lbu	a0,0(a5)
    80002e6c:	00878793          	add	a5,a5,8
    80002e70:	00f13423          	sd	a5,8(sp)
    80002e74:	450000ef          	jal	800032c4 <uart_putc>
    80002e78:	f8dff06f          	j	80002e04 <printf_color+0xe4>
    80002e7c:	00813783          	ld	a5,8(sp)
    80002e80:	0007b403          	ld	s0,0(a5)
    80002e84:	00878793          	add	a5,a5,8
    80002e88:	00f13423          	sd	a5,8(sp)
    80002e8c:	00041863          	bnez	s0,80002e9c <printf_color+0x17c>
    80002e90:	0c40006f          	j	80002f54 <printf_color+0x234>
    80002e94:	00140413          	add	s0,s0,1
    80002e98:	42c000ef          	jal	800032c4 <uart_putc>
    80002e9c:	00044503          	lbu	a0,0(s0)
    80002ea0:	fe051ae3          	bnez	a0,80002e94 <printf_color+0x174>
    80002ea4:	f61ff06f          	j	80002e04 <printf_color+0xe4>
    80002ea8:	00813783          	ld	a5,8(sp)
    80002eac:	00100613          	li	a2,1
    80002eb0:	00a00593          	li	a1,10
    80002eb4:	0007a503          	lw	a0,0(a5)
    80002eb8:	00878793          	add	a5,a5,8
    80002ebc:	00f13423          	sd	a5,8(sp)
    80002ec0:	b35ff0ef          	jal	800029f4 <print_number>
    80002ec4:	f41ff06f          	j	80002e04 <printf_color+0xe4>
    80002ec8:	00a00913          	li	s2,10
    80002ecc:	0324d53b          	divuw	a0,s1,s2
    80002ed0:	0305051b          	addw	a0,a0,48
    80002ed4:	0ff57513          	zext.b	a0,a0
    80002ed8:	3ec000ef          	jal	800032c4 <uart_putc>
    80002edc:	0324f53b          	remuw	a0,s1,s2
    80002ee0:	0305051b          	addw	a0,a0,48
    80002ee4:	07f57513          	and	a0,a0,127
    80002ee8:	3dc000ef          	jal	800032c4 <uart_putc>
    80002eec:	ea1ff06f          	j	80002d8c <printf_color+0x6c>
    80002ef0:	3d4000ef          	jal	800032c4 <uart_putc>
    80002ef4:	00040493          	mv	s1,s0
    80002ef8:	f0dff06f          	j	80002e04 <printf_color+0xe4>
    80002efc:	02500513          	li	a0,37
    80002f00:	3c4000ef          	jal	800032c4 <uart_putc>
    80002f04:	f01ff06f          	j	80002e04 <printf_color+0xe4>
    80002f08:	02500513          	li	a0,37
    80002f0c:	3b8000ef          	jal	800032c4 <uart_putc>
    80002f10:	f01ff06f          	j	80002e10 <printf_color+0xf0>
    80002f14:	06400913          	li	s2,100
    80002f18:	0324d53b          	divuw	a0,s1,s2
    80002f1c:	00a00993          	li	s3,10
    80002f20:	0305051b          	addw	a0,a0,48
    80002f24:	0ff57513          	zext.b	a0,a0
    80002f28:	39c000ef          	jal	800032c4 <uart_putc>
    80002f2c:	0324f53b          	remuw	a0,s1,s2
    80002f30:	0335553b          	divuw	a0,a0,s3
    80002f34:	0305051b          	addw	a0,a0,48
    80002f38:	0ff57513          	zext.b	a0,a0
    80002f3c:	388000ef          	jal	800032c4 <uart_putc>
    80002f40:	0334f53b          	remuw	a0,s1,s3
    80002f44:	0305051b          	addw	a0,a0,48
    80002f48:	07f57513          	and	a0,a0,127
    80002f4c:	378000ef          	jal	800032c4 <uart_putc>
    80002f50:	e3dff06f          	j	80002d8c <printf_color+0x6c>
    80002f54:	00009517          	auipc	a0,0x9
    80002f58:	cec50513          	add	a0,a0,-788 # 8000bc40 <rodata_start+0x3c40>
    80002f5c:	380000ef          	jal	800032dc <uart_puts>
    80002f60:	ea5ff06f          	j	80002e04 <printf_color+0xe4>
    80002f64:	fff00a93          	li	s5,-1
    80002f68:	eb5ff06f          	j	80002e1c <printf_color+0xfc>

0000000080002f6c <printf>:
    80002f6c:	f6010113          	add	sp,sp,-160
    80002f70:	04113c23          	sd	ra,88(sp)
    80002f74:	04813823          	sd	s0,80(sp)
    80002f78:	04913423          	sd	s1,72(sp)
    80002f7c:	05213023          	sd	s2,64(sp)
    80002f80:	03313c23          	sd	s3,56(sp)
    80002f84:	03413823          	sd	s4,48(sp)
    80002f88:	03513423          	sd	s5,40(sp)
    80002f8c:	03613023          	sd	s6,32(sp)
    80002f90:	01713c23          	sd	s7,24(sp)
    80002f94:	06b13423          	sd	a1,104(sp)
    80002f98:	06c13823          	sd	a2,112(sp)
    80002f9c:	06d13c23          	sd	a3,120(sp)
    80002fa0:	08e13023          	sd	a4,128(sp)
    80002fa4:	08f13423          	sd	a5,136(sp)
    80002fa8:	09013823          	sd	a6,144(sp)
    80002fac:	09113c23          	sd	a7,152(sp)
    80002fb0:	20050c63          	beqz	a0,800031c8 <printf+0x25c>
    80002fb4:	00050413          	mv	s0,a0
    80002fb8:	00054503          	lbu	a0,0(a0)
    80002fbc:	06810793          	add	a5,sp,104
    80002fc0:	00f13423          	sd	a5,8(sp)
    80002fc4:	00000b13          	li	s6,0
    80002fc8:	06050c63          	beqz	a0,80003040 <printf+0xd4>
    80002fcc:	02500493          	li	s1,37
    80002fd0:	06c00993          	li	s3,108
    80002fd4:	02000a13          	li	s4,32
    80002fd8:	00009917          	auipc	s2,0x9
    80002fdc:	e2490913          	add	s2,s2,-476 # 8000bdfc <rodata_start+0x3dfc>
    80002fe0:	00009a97          	auipc	s5,0x9
    80002fe4:	ea0a8a93          	add	s5,s5,-352 # 8000be80 <rodata_start+0x3e80>
    80002fe8:	04951463          	bne	a0,s1,80003030 <printf+0xc4>
    80002fec:	00144783          	lbu	a5,1(s0)
    80002ff0:	18078e63          	beqz	a5,8000318c <printf+0x220>
    80002ff4:	11378063          	beq	a5,s3,800030f4 <printf+0x188>
    80002ff8:	00140413          	add	s0,s0,1
    80002ffc:	16978863          	beq	a5,s1,8000316c <printf+0x200>
    80003000:	fa87879b          	addw	a5,a5,-88
    80003004:	0ff7f793          	zext.b	a5,a5
    80003008:	00fa6c63          	bltu	s4,a5,80003020 <printf+0xb4>
    8000300c:	00279793          	sll	a5,a5,0x2
    80003010:	012787b3          	add	a5,a5,s2
    80003014:	0007a783          	lw	a5,0(a5)
    80003018:	012787b3          	add	a5,a5,s2
    8000301c:	00078067          	jr	a5
    80003020:	02500513          	li	a0,37
    80003024:	2a0000ef          	jal	800032c4 <uart_putc>
    80003028:	00044503          	lbu	a0,0(s0)
    8000302c:	ffe00b13          	li	s6,-2
    80003030:	294000ef          	jal	800032c4 <uart_putc>
    80003034:	00144503          	lbu	a0,1(s0)
    80003038:	00140413          	add	s0,s0,1
    8000303c:	fa0516e3          	bnez	a0,80002fe8 <printf+0x7c>
    80003040:	05813083          	ld	ra,88(sp)
    80003044:	05013403          	ld	s0,80(sp)
    80003048:	04813483          	ld	s1,72(sp)
    8000304c:	04013903          	ld	s2,64(sp)
    80003050:	03813983          	ld	s3,56(sp)
    80003054:	03013a03          	ld	s4,48(sp)
    80003058:	02813a83          	ld	s5,40(sp)
    8000305c:	01813b83          	ld	s7,24(sp)
    80003060:	000b0513          	mv	a0,s6
    80003064:	02013b03          	ld	s6,32(sp)
    80003068:	0a010113          	add	sp,sp,160
    8000306c:	00008067          	ret
    80003070:	00813783          	ld	a5,8(sp)
    80003074:	00000613          	li	a2,0
    80003078:	01000593          	li	a1,16
    8000307c:	0007a503          	lw	a0,0(a5)
    80003080:	00878793          	add	a5,a5,8
    80003084:	00f13423          	sd	a5,8(sp)
    80003088:	96dff0ef          	jal	800029f4 <print_number>
    8000308c:	fa9ff06f          	j	80003034 <printf+0xc8>
    80003090:	00813783          	ld	a5,8(sp)
    80003094:	0007c503          	lbu	a0,0(a5)
    80003098:	00878793          	add	a5,a5,8
    8000309c:	00f13423          	sd	a5,8(sp)
    800030a0:	224000ef          	jal	800032c4 <uart_putc>
    800030a4:	f91ff06f          	j	80003034 <printf+0xc8>
    800030a8:	00813783          	ld	a5,8(sp)
    800030ac:	0007bb83          	ld	s7,0(a5)
    800030b0:	00878793          	add	a5,a5,8
    800030b4:	00f13423          	sd	a5,8(sp)
    800030b8:	000b9863          	bnez	s7,800030c8 <printf+0x15c>
    800030bc:	0e80006f          	j	800031a4 <printf+0x238>
    800030c0:	001b8b93          	add	s7,s7,1
    800030c4:	200000ef          	jal	800032c4 <uart_putc>
    800030c8:	000bc503          	lbu	a0,0(s7)
    800030cc:	fe051ae3          	bnez	a0,800030c0 <printf+0x154>
    800030d0:	f65ff06f          	j	80003034 <printf+0xc8>
    800030d4:	00813783          	ld	a5,8(sp)
    800030d8:	00100613          	li	a2,1
    800030dc:	00a00593          	li	a1,10
    800030e0:	0007a503          	lw	a0,0(a5)
    800030e4:	00878793          	add	a5,a5,8
    800030e8:	00f13423          	sd	a5,8(sp)
    800030ec:	909ff0ef          	jal	800029f4 <print_number>
    800030f0:	f45ff06f          	j	80003034 <printf+0xc8>
    800030f4:	00244783          	lbu	a5,2(s0)
    800030f8:	00240413          	add	s0,s0,2
    800030fc:	0a078c63          	beqz	a5,800031b4 <printf+0x248>
    80003100:	06978663          	beq	a5,s1,8000316c <printf+0x200>
    80003104:	fa87879b          	addw	a5,a5,-88
    80003108:	0ff7f793          	zext.b	a5,a5
    8000310c:	06fa6663          	bltu	s4,a5,80003178 <printf+0x20c>
    80003110:	00279793          	sll	a5,a5,0x2
    80003114:	015787b3          	add	a5,a5,s5
    80003118:	0007a783          	lw	a5,0(a5)
    8000311c:	015787b3          	add	a5,a5,s5
    80003120:	00078067          	jr	a5
    80003124:	00813783          	ld	a5,8(sp)
    80003128:	0007b503          	ld	a0,0(a5)
    8000312c:	00878793          	add	a5,a5,8
    80003130:	00f13423          	sd	a5,8(sp)
    80003134:	06050263          	beqz	a0,80003198 <printf+0x22c>
    80003138:	00000613          	li	a2,0
    8000313c:	01000593          	li	a1,16
    80003140:	989ff0ef          	jal	80002ac8 <print_number_long.part.0>
    80003144:	ef1ff06f          	j	80003034 <printf+0xc8>
    80003148:	00813783          	ld	a5,8(sp)
    8000314c:	0007b503          	ld	a0,0(a5)
    80003150:	00878793          	add	a5,a5,8
    80003154:	00f13423          	sd	a5,8(sp)
    80003158:	04050063          	beqz	a0,80003198 <printf+0x22c>
    8000315c:	00100613          	li	a2,1
    80003160:	00a00593          	li	a1,10
    80003164:	965ff0ef          	jal	80002ac8 <print_number_long.part.0>
    80003168:	ecdff06f          	j	80003034 <printf+0xc8>
    8000316c:	02500513          	li	a0,37
    80003170:	154000ef          	jal	800032c4 <uart_putc>
    80003174:	ec1ff06f          	j	80003034 <printf+0xc8>
    80003178:	02500513          	li	a0,37
    8000317c:	148000ef          	jal	800032c4 <uart_putc>
    80003180:	06c00513          	li	a0,108
    80003184:	140000ef          	jal	800032c4 <uart_putc>
    80003188:	ea1ff06f          	j	80003028 <printf+0xbc>
    8000318c:	02500513          	li	a0,37
    80003190:	134000ef          	jal	800032c4 <uart_putc>
    80003194:	eadff06f          	j	80003040 <printf+0xd4>
    80003198:	03000513          	li	a0,48
    8000319c:	128000ef          	jal	800032c4 <uart_putc>
    800031a0:	e95ff06f          	j	80003034 <printf+0xc8>
    800031a4:	00009517          	auipc	a0,0x9
    800031a8:	a9c50513          	add	a0,a0,-1380 # 8000bc40 <rodata_start+0x3c40>
    800031ac:	130000ef          	jal	800032dc <uart_puts>
    800031b0:	e85ff06f          	j	80003034 <printf+0xc8>
    800031b4:	02500513          	li	a0,37
    800031b8:	10c000ef          	jal	800032c4 <uart_putc>
    800031bc:	06c00513          	li	a0,108
    800031c0:	104000ef          	jal	800032c4 <uart_putc>
    800031c4:	e7dff06f          	j	80003040 <printf+0xd4>
    800031c8:	fff00b13          	li	s6,-1
    800031cc:	e75ff06f          	j	80003040 <printf+0xd4>

00000000800031d0 <test_printf_basic>:
    800031d0:	ff010113          	add	sp,sp,-16
    800031d4:	02a00593          	li	a1,42
    800031d8:	00009517          	auipc	a0,0x9
    800031dc:	a7850513          	add	a0,a0,-1416 # 8000bc50 <rodata_start+0x3c50>
    800031e0:	00113423          	sd	ra,8(sp)
    800031e4:	d89ff0ef          	jal	80002f6c <printf>
    800031e8:	f8500593          	li	a1,-123
    800031ec:	00009517          	auipc	a0,0x9
    800031f0:	a7c50513          	add	a0,a0,-1412 # 8000bc68 <rodata_start+0x3c68>
    800031f4:	d79ff0ef          	jal	80002f6c <printf>
    800031f8:	00000593          	li	a1,0
    800031fc:	00009517          	auipc	a0,0x9
    80003200:	a8450513          	add	a0,a0,-1404 # 8000bc80 <rodata_start+0x3c80>
    80003204:	d69ff0ef          	jal	80002f6c <printf>
    80003208:	000015b7          	lui	a1,0x1
    8000320c:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80003210:	00009517          	auipc	a0,0x9
    80003214:	a8850513          	add	a0,a0,-1400 # 8000bc98 <rodata_start+0x3c98>
    80003218:	d55ff0ef          	jal	80002f6c <printf>
    8000321c:	00009597          	auipc	a1,0x9
    80003220:	a9458593          	add	a1,a1,-1388 # 8000bcb0 <rodata_start+0x3cb0>
    80003224:	00009517          	auipc	a0,0x9
    80003228:	a9450513          	add	a0,a0,-1388 # 8000bcb8 <rodata_start+0x3cb8>
    8000322c:	d41ff0ef          	jal	80002f6c <printf>
    80003230:	05800593          	li	a1,88
    80003234:	00009517          	auipc	a0,0x9
    80003238:	a9c50513          	add	a0,a0,-1380 # 8000bcd0 <rodata_start+0x3cd0>
    8000323c:	d31ff0ef          	jal	80002f6c <printf>
    80003240:	00813083          	ld	ra,8(sp)
    80003244:	00009517          	auipc	a0,0x9
    80003248:	aa450513          	add	a0,a0,-1372 # 8000bce8 <rodata_start+0x3ce8>
    8000324c:	01010113          	add	sp,sp,16
    80003250:	d1dff06f          	j	80002f6c <printf>

0000000080003254 <test_printf_edge_cases>:
    80003254:	800005b7          	lui	a1,0x80000
    80003258:	ff010113          	add	sp,sp,-16
    8000325c:	fff5c593          	not	a1,a1
    80003260:	00009517          	auipc	a0,0x9
    80003264:	aa050513          	add	a0,a0,-1376 # 8000bd00 <rodata_start+0x3d00>
    80003268:	00113423          	sd	ra,8(sp)
    8000326c:	d01ff0ef          	jal	80002f6c <printf>
    80003270:	800005b7          	lui	a1,0x80000
    80003274:	00009517          	auipc	a0,0x9
    80003278:	a9c50513          	add	a0,a0,-1380 # 8000bd10 <rodata_start+0x3d10>
    8000327c:	cf1ff0ef          	jal	80002f6c <printf>
    80003280:	00000593          	li	a1,0
    80003284:	00009517          	auipc	a0,0x9
    80003288:	a9c50513          	add	a0,a0,-1380 # 8000bd20 <rodata_start+0x3d20>
    8000328c:	ce1ff0ef          	jal	80002f6c <printf>
    80003290:	00006597          	auipc	a1,0x6
    80003294:	16058593          	add	a1,a1,352 # 800093f0 <rodata_start+0x13f0>
    80003298:	00009517          	auipc	a0,0x9
    8000329c:	aa050513          	add	a0,a0,-1376 # 8000bd38 <rodata_start+0x3d38>
    800032a0:	ccdff0ef          	jal	80002f6c <printf>
    800032a4:	00009517          	auipc	a0,0x9
    800032a8:	aac50513          	add	a0,a0,-1364 # 8000bd50 <rodata_start+0x3d50>
    800032ac:	cc1ff0ef          	jal	80002f6c <printf>
    800032b0:	00813083          	ld	ra,8(sp)
    800032b4:	00009517          	auipc	a0,0x9
    800032b8:	aac50513          	add	a0,a0,-1364 # 8000bd60 <rodata_start+0x3d60>
    800032bc:	01010113          	add	sp,sp,16
    800032c0:	cadff06f          	j	80002f6c <printf>

00000000800032c4 <uart_putc>:
    800032c4:	10000737          	lui	a4,0x10000
    800032c8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800032cc:	0207f793          	and	a5,a5,32
    800032d0:	fe078ce3          	beqz	a5,800032c8 <uart_putc+0x4>
    800032d4:	00a70023          	sb	a0,0(a4)
    800032d8:	00008067          	ret

00000000800032dc <uart_puts>:
    800032dc:	00054683          	lbu	a3,0(a0)
    800032e0:	02068263          	beqz	a3,80003304 <uart_puts+0x28>
    800032e4:	10000737          	lui	a4,0x10000
    800032e8:	00150513          	add	a0,a0,1
    800032ec:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800032f0:	0207f793          	and	a5,a5,32
    800032f4:	fe078ce3          	beqz	a5,800032ec <uart_puts+0x10>
    800032f8:	00d70023          	sb	a3,0(a4)
    800032fc:	00054683          	lbu	a3,0(a0)
    80003300:	fe0694e3          	bnez	a3,800032e8 <uart_puts+0xc>
    80003304:	00008067          	ret

0000000080003308 <pmm_init>:
    80003308:	000017b7          	lui	a5,0x1
    8000330c:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003310:	00f50533          	add	a0,a0,a5
    80003314:	fffff737          	lui	a4,0xfffff
    80003318:	00e57533          	and	a0,a0,a4
    8000331c:	00e5f5b3          	and	a1,a1,a4
    80003320:	00424797          	auipc	a5,0x424
    80003324:	10a7b423          	sd	a0,264(a5) # 80427428 <mem_start>
    80003328:	00424797          	auipc	a5,0x424
    8000332c:	0eb7bc23          	sd	a1,248(a5) # 80427420 <mem_end>
    80003330:	00424797          	auipc	a5,0x424
    80003334:	1007b023          	sd	zero,256(a5) # 80427430 <freelist>
    80003338:	02b57e63          	bgeu	a0,a1,80003374 <pmm_init+0x6c>
    8000333c:	02050e63          	beqz	a0,80003378 <pmm_init+0x70>
    80003340:	00050793          	mv	a5,a0
    80003344:	00000613          	li	a2,0
    80003348:	00000693          	li	a3,0
    8000334c:	00a7e863          	bltu	a5,a0,8000335c <pmm_init+0x54>
    80003350:	00d7b023          	sd	a3,0(a5)
    80003354:	00100613          	li	a2,1
    80003358:	00078693          	mv	a3,a5
    8000335c:	00001737          	lui	a4,0x1
    80003360:	00e787b3          	add	a5,a5,a4
    80003364:	feb7e4e3          	bltu	a5,a1,8000334c <pmm_init+0x44>
    80003368:	00060663          	beqz	a2,80003374 <pmm_init+0x6c>
    8000336c:	00424797          	auipc	a5,0x424
    80003370:	0cd7b223          	sd	a3,196(a5) # 80427430 <freelist>
    80003374:	00008067          	ret
    80003378:	00000793          	li	a5,0
    8000337c:	00000613          	li	a2,0
    80003380:	00000693          	li	a3,0
    80003384:	fd9ff06f          	j	8000335c <pmm_init+0x54>

0000000080003388 <alloc_page>:
    80003388:	00424797          	auipc	a5,0x424
    8000338c:	0a878793          	add	a5,a5,168 # 80427430 <freelist>
    80003390:	0007b503          	ld	a0,0(a5)
    80003394:	00050663          	beqz	a0,800033a0 <alloc_page+0x18>
    80003398:	00053703          	ld	a4,0(a0)
    8000339c:	00e7b023          	sd	a4,0(a5)
    800033a0:	00008067          	ret

00000000800033a4 <free_page>:
    800033a4:	02050c63          	beqz	a0,800033dc <free_page+0x38>
    800033a8:	00424797          	auipc	a5,0x424
    800033ac:	0807b783          	ld	a5,128(a5) # 80427428 <mem_start>
    800033b0:	02f56663          	bltu	a0,a5,800033dc <free_page+0x38>
    800033b4:	00424797          	auipc	a5,0x424
    800033b8:	06c7b783          	ld	a5,108(a5) # 80427420 <mem_end>
    800033bc:	02f57063          	bgeu	a0,a5,800033dc <free_page+0x38>
    800033c0:	03451793          	sll	a5,a0,0x34
    800033c4:	00079c63          	bnez	a5,800033dc <free_page+0x38>
    800033c8:	00424797          	auipc	a5,0x424
    800033cc:	06878793          	add	a5,a5,104 # 80427430 <freelist>
    800033d0:	0007b703          	ld	a4,0(a5)
    800033d4:	00a7b023          	sd	a0,0(a5)
    800033d8:	00e53023          	sd	a4,0(a0)
    800033dc:	00008067          	ret

00000000800033e0 <alloc_pages>:
    800033e0:	00050613          	mv	a2,a0
    800033e4:	08a05863          	blez	a0,80003474 <alloc_pages+0x94>
    800033e8:	00424317          	auipc	t1,0x424
    800033ec:	04830313          	add	t1,t1,72 # 80427430 <freelist>
    800033f0:	00100793          	li	a5,1
    800033f4:	00033803          	ld	a6,0(t1)
    800033f8:	06f50463          	beq	a0,a5,80003460 <alloc_pages+0x80>
    800033fc:	06080c63          	beqz	a6,80003474 <alloc_pages+0x94>
    80003400:	00083503          	ld	a0,0(a6)
    80003404:	00080793          	mv	a5,a6
    80003408:	00100713          	li	a4,1
    8000340c:	00000893          	li	a7,0
    80003410:	000015b7          	lui	a1,0x1
    80003414:	0200006f          	j	80003434 <alloc_pages+0x54>
    80003418:	02d50463          	beq	a0,a3,80003440 <alloc_pages+0x60>
    8000341c:	00053683          	ld	a3,0(a0)
    80003420:	00078893          	mv	a7,a5
    80003424:	00050813          	mv	a6,a0
    80003428:	00100713          	li	a4,1
    8000342c:	00050793          	mv	a5,a0
    80003430:	00068513          	mv	a0,a3
    80003434:	00b786b3          	add	a3,a5,a1
    80003438:	fe0510e3          	bnez	a0,80003418 <alloc_pages+0x38>
    8000343c:	00008067          	ret
    80003440:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80003444:	00053683          	ld	a3,0(a0)
    80003448:	fee612e3          	bne	a2,a4,8000342c <alloc_pages+0x4c>
    8000344c:	02088863          	beqz	a7,8000347c <alloc_pages+0x9c>
    80003450:	00d8b023          	sd	a3,0(a7)
    80003454:	00053023          	sd	zero,0(a0)
    80003458:	00080513          	mv	a0,a6
    8000345c:	00008067          	ret
    80003460:	00080663          	beqz	a6,8000346c <alloc_pages+0x8c>
    80003464:	00083783          	ld	a5,0(a6)
    80003468:	00f33023          	sd	a5,0(t1)
    8000346c:	00080513          	mv	a0,a6
    80003470:	00008067          	ret
    80003474:	00000513          	li	a0,0
    80003478:	00008067          	ret
    8000347c:	00053023          	sd	zero,0(a0)
    80003480:	00d33023          	sd	a3,0(t1)
    80003484:	00080513          	mv	a0,a6
    80003488:	00008067          	ret

000000008000348c <walk_lookup>:
    8000348c:	01e5d793          	srl	a5,a1,0x1e
    80003490:	1ff7f793          	and	a5,a5,511
    80003494:	00379793          	sll	a5,a5,0x3
    80003498:	00f50533          	add	a0,a0,a5
    8000349c:	00053703          	ld	a4,0(a0)
    800034a0:	00177793          	and	a5,a4,1
    800034a4:	04078a63          	beqz	a5,800034f8 <walk_lookup+0x6c>
    800034a8:	00e77793          	and	a5,a4,14
    800034ac:	04079663          	bnez	a5,800034f8 <walk_lookup+0x6c>
    800034b0:	0155d793          	srl	a5,a1,0x15
    800034b4:	00a75713          	srl	a4,a4,0xa
    800034b8:	1ff7f793          	and	a5,a5,511
    800034bc:	00c71713          	sll	a4,a4,0xc
    800034c0:	00379793          	sll	a5,a5,0x3
    800034c4:	00e787b3          	add	a5,a5,a4
    800034c8:	0007b503          	ld	a0,0(a5)
    800034cc:	00157793          	and	a5,a0,1
    800034d0:	02078463          	beqz	a5,800034f8 <walk_lookup+0x6c>
    800034d4:	00e57793          	and	a5,a0,14
    800034d8:	02079063          	bnez	a5,800034f8 <walk_lookup+0x6c>
    800034dc:	00c5d593          	srl	a1,a1,0xc
    800034e0:	00a55513          	srl	a0,a0,0xa
    800034e4:	1ff5f593          	and	a1,a1,511
    800034e8:	00359593          	sll	a1,a1,0x3
    800034ec:	00c51513          	sll	a0,a0,0xc
    800034f0:	00b50533          	add	a0,a0,a1
    800034f4:	00008067          	ret
    800034f8:	00000513          	li	a0,0
    800034fc:	00008067          	ret

0000000080003500 <free_swap_slot.part.0>:
    80003500:	0055579b          	srlw	a5,a0,0x5
    80003504:	0000e617          	auipc	a2,0xe
    80003508:	afc60613          	add	a2,a2,-1284 # 80011000 <swap_mgr>
    8000350c:	00279793          	sll	a5,a5,0x2
    80003510:	00f607b3          	add	a5,a2,a5
    80003514:	0007a583          	lw	a1,0(a5)
    80003518:	00100713          	li	a4,1
    8000351c:	00a7173b          	sllw	a4,a4,a0
    80003520:	00e5f6b3          	and	a3,a1,a4
    80003524:	0006869b          	sext.w	a3,a3
    80003528:	02068463          	beqz	a3,80003550 <free_swap_slot.part.0+0x50>
    8000352c:	08862683          	lw	a3,136(a2)
    80003530:	fff74713          	not	a4,a4
    80003534:	08062803          	lw	a6,128(a2)
    80003538:	00e5f5b3          	and	a1,a1,a4
    8000353c:	fff6871b          	addw	a4,a3,-1
    80003540:	00b7a023          	sw	a1,0(a5)
    80003544:	08e62423          	sw	a4,136(a2)
    80003548:	01057463          	bgeu	a0,a6,80003550 <free_swap_slot.part.0+0x50>
    8000354c:	08a62023          	sw	a0,128(a2)
    80003550:	00008067          	ret

0000000080003554 <uvmunmap.part.0>:
    80003554:	fc010113          	add	sp,sp,-64
    80003558:	03213023          	sd	s2,32(sp)
    8000355c:	00c61913          	sll	s2,a2,0xc
    80003560:	02113c23          	sd	ra,56(sp)
    80003564:	02813823          	sd	s0,48(sp)
    80003568:	02913423          	sd	s1,40(sp)
    8000356c:	01313c23          	sd	s3,24(sp)
    80003570:	01413823          	sd	s4,16(sp)
    80003574:	01513423          	sd	s5,8(sp)
    80003578:	00b90933          	add	s2,s2,a1
    8000357c:	0525f863          	bgeu	a1,s2,800035cc <uvmunmap.part.0+0x78>
    80003580:	00058493          	mv	s1,a1
    80003584:	00050993          	mv	s3,a0
    80003588:	00068a93          	mv	s5,a3
    8000358c:	00001a37          	lui	s4,0x1
    80003590:	00048593          	mv	a1,s1
    80003594:	00098513          	mv	a0,s3
    80003598:	ef5ff0ef          	jal	8000348c <walk_lookup>
    8000359c:	00050413          	mv	s0,a0
    800035a0:	014484b3          	add	s1,s1,s4
    800035a4:	02050263          	beqz	a0,800035c8 <uvmunmap.part.0+0x74>
    800035a8:	00053783          	ld	a5,0(a0)
    800035ac:	00a7d713          	srl	a4,a5,0xa
    800035b0:	0017f793          	and	a5,a5,1
    800035b4:	00c71513          	sll	a0,a4,0xc
    800035b8:	00078863          	beqz	a5,800035c8 <uvmunmap.part.0+0x74>
    800035bc:	00050663          	beqz	a0,800035c8 <uvmunmap.part.0+0x74>
    800035c0:	020a9863          	bnez	s5,800035f0 <uvmunmap.part.0+0x9c>
    800035c4:	00043023          	sd	zero,0(s0)
    800035c8:	fd24e4e3          	bltu	s1,s2,80003590 <uvmunmap.part.0+0x3c>
    800035cc:	03813083          	ld	ra,56(sp)
    800035d0:	03013403          	ld	s0,48(sp)
    800035d4:	02813483          	ld	s1,40(sp)
    800035d8:	02013903          	ld	s2,32(sp)
    800035dc:	01813983          	ld	s3,24(sp)
    800035e0:	01013a03          	ld	s4,16(sp)
    800035e4:	00813a83          	ld	s5,8(sp)
    800035e8:	04010113          	add	sp,sp,64
    800035ec:	00008067          	ret
    800035f0:	db5ff0ef          	jal	800033a4 <free_page>
    800035f4:	00043023          	sd	zero,0(s0)
    800035f8:	fd1ff06f          	j	800035c8 <uvmunmap.part.0+0x74>

00000000800035fc <create_pagetable>:
    800035fc:	ff010113          	add	sp,sp,-16
    80003600:	00113423          	sd	ra,8(sp)
    80003604:	d85ff0ef          	jal	80003388 <alloc_page>
    80003608:	00050e63          	beqz	a0,80003624 <create_pagetable+0x28>
    8000360c:	00001737          	lui	a4,0x1
    80003610:	00050793          	mv	a5,a0
    80003614:	00e50733          	add	a4,a0,a4
    80003618:	0007b023          	sd	zero,0(a5)
    8000361c:	00878793          	add	a5,a5,8
    80003620:	fee79ce3          	bne	a5,a4,80003618 <create_pagetable+0x1c>
    80003624:	00813083          	ld	ra,8(sp)
    80003628:	01010113          	add	sp,sp,16
    8000362c:	00008067          	ret

0000000080003630 <map_page>:
    80003630:	00c5e7b3          	or	a5,a1,a2
    80003634:	03479713          	sll	a4,a5,0x34
    80003638:	20071863          	bnez	a4,80003848 <map_page+0x218>
    8000363c:	fc010113          	add	sp,sp,-64
    80003640:	02913423          	sd	s1,40(sp)
    80003644:	03213023          	sd	s2,32(sp)
    80003648:	01313c23          	sd	s3,24(sp)
    8000364c:	01413823          	sd	s4,16(sp)
    80003650:	01513423          	sd	s5,8(sp)
    80003654:	01613023          	sd	s6,0(sp)
    80003658:	02113c23          	sd	ra,56(sp)
    8000365c:	02813823          	sd	s0,48(sp)
    80003660:	00058493          	mv	s1,a1
    80003664:	00060913          	mv	s2,a2
    80003668:	00050a13          	mv	s4,a0
    8000366c:	00068993          	mv	s3,a3
    80003670:	00050813          	mv	a6,a0
    80003674:	00200a93          	li	s5,2
    80003678:	00200793          	li	a5,2
    8000367c:	00100b13          	li	s6,1
    80003680:	0037941b          	sllw	s0,a5,0x3
    80003684:	00f4043b          	addw	s0,s0,a5
    80003688:	00c4041b          	addw	s0,s0,12
    8000368c:	0084d433          	srl	s0,s1,s0
    80003690:	1ff47413          	and	s0,s0,511
    80003694:	00341413          	sll	s0,s0,0x3
    80003698:	00880433          	add	s0,a6,s0
    8000369c:	00043783          	ld	a5,0(s0)
    800036a0:	0017f713          	and	a4,a5,1
    800036a4:	14070e63          	beqz	a4,80003800 <map_page+0x1d0>
    800036a8:	00e7f713          	and	a4,a5,14
    800036ac:	18071a63          	bnez	a4,80003840 <map_page+0x210>
    800036b0:	00a7d793          	srl	a5,a5,0xa
    800036b4:	00c79813          	sll	a6,a5,0xc
    800036b8:	00100793          	li	a5,1
    800036bc:	016a8663          	beq	s5,s6,800036c8 <map_page+0x98>
    800036c0:	00100a93          	li	s5,1
    800036c4:	fbdff06f          	j	80003680 <map_page+0x50>
    800036c8:	00c4d793          	srl	a5,s1,0xc
    800036cc:	1ff7f793          	and	a5,a5,511
    800036d0:	00379793          	sll	a5,a5,0x3
    800036d4:	00f80833          	add	a6,a6,a5
    800036d8:	16080463          	beqz	a6,80003840 <map_page+0x210>
    800036dc:	00083783          	ld	a5,0(a6)
    800036e0:	0017f793          	and	a5,a5,1
    800036e4:	14079e63          	bnez	a5,80003840 <map_page+0x210>
    800036e8:	00c95793          	srl	a5,s2,0xc
    800036ec:	00a79793          	sll	a5,a5,0xa
    800036f0:	00411597          	auipc	a1,0x411
    800036f4:	9a058593          	add	a1,a1,-1632 # 80414090 <lru_mgr+0x3000>
    800036f8:	0145a703          	lw	a4,20(a1)
    800036fc:	0137e7b3          	or	a5,a5,s3
    80003700:	0017e793          	or	a5,a5,1
    80003704:	00f83023          	sd	a5,0(a6)
    80003708:	0c070663          	beqz	a4,800037d4 <map_page+0x1a4>
    8000370c:	0040e717          	auipc	a4,0x40e
    80003710:	9a870713          	add	a4,a4,-1624 # 804110b4 <lru_mgr+0x24>
    80003714:	00000793          	li	a5,0
    80003718:	10000693          	li	a3,256
    8000371c:	00c0006f          	j	80003728 <map_page+0xf8>
    80003720:	0017879b          	addw	a5,a5,1
    80003724:	0ad78863          	beq	a5,a3,800037d4 <map_page+0x1a4>
    80003728:	00072803          	lw	a6,0(a4)
    8000372c:	03070713          	add	a4,a4,48
    80003730:	fe0818e3          	bnez	a6,80003720 <map_page+0xf0>
    80003734:	00178813          	add	a6,a5,1
    80003738:	00181513          	sll	a0,a6,0x1
    8000373c:	00179713          	sll	a4,a5,0x1
    80003740:	01050533          	add	a0,a0,a6
    80003744:	0040e617          	auipc	a2,0x40e
    80003748:	94c60613          	add	a2,a2,-1716 # 80411090 <lru_mgr>
    8000374c:	00f706b3          	add	a3,a4,a5
    80003750:	00451513          	sll	a0,a0,0x4
    80003754:	00469693          	sll	a3,a3,0x4
    80003758:	00a60533          	add	a0,a2,a0
    8000375c:	fffff337          	lui	t1,0xfffff
    80003760:	00d608b3          	add	a7,a2,a3
    80003764:	0064f4b3          	and	s1,s1,t1
    80003768:	01453423          	sd	s4,8(a0)
    8000376c:	fff00513          	li	a0,-1
    80003770:	01068693          	add	a3,a3,16
    80003774:	0098b823          	sd	s1,16(a7)
    80003778:	0128bc23          	sd	s2,24(a7)
    8000377c:	02a8a023          	sw	a0,32(a7)
    80003780:	0049f993          	and	s3,s3,4
    80003784:	00d606b3          	add	a3,a2,a3
    80003788:	00098463          	beqz	s3,80003790 <map_page+0x160>
    8000378c:	00500a93          	li	s5,5
    80003790:	00181513          	sll	a0,a6,0x1
    80003794:	00f707b3          	add	a5,a4,a5
    80003798:	00063883          	ld	a7,0(a2)
    8000379c:	01050733          	add	a4,a0,a6
    800037a0:	00479793          	sll	a5,a5,0x4
    800037a4:	00471713          	sll	a4,a4,0x4
    800037a8:	00f607b3          	add	a5,a2,a5
    800037ac:	00e60733          	add	a4,a2,a4
    800037b0:	0357a223          	sw	s5,36(a5)
    800037b4:	01173023          	sd	a7,0(a4)
    800037b8:	0207b423          	sd	zero,40(a5)
    800037bc:	06088e63          	beqz	a7,80003838 <map_page+0x208>
    800037c0:	00d8bc23          	sd	a3,24(a7)
    800037c4:	0105a783          	lw	a5,16(a1)
    800037c8:	00d63023          	sd	a3,0(a2)
    800037cc:	0017879b          	addw	a5,a5,1
    800037d0:	00f5a823          	sw	a5,16(a1)
    800037d4:	00000513          	li	a0,0
    800037d8:	03813083          	ld	ra,56(sp)
    800037dc:	03013403          	ld	s0,48(sp)
    800037e0:	02813483          	ld	s1,40(sp)
    800037e4:	02013903          	ld	s2,32(sp)
    800037e8:	01813983          	ld	s3,24(sp)
    800037ec:	01013a03          	ld	s4,16(sp)
    800037f0:	00813a83          	ld	s5,8(sp)
    800037f4:	00013b03          	ld	s6,0(sp)
    800037f8:	04010113          	add	sp,sp,64
    800037fc:	00008067          	ret
    80003800:	b89ff0ef          	jal	80003388 <alloc_page>
    80003804:	00050813          	mv	a6,a0
    80003808:	02050c63          	beqz	a0,80003840 <map_page+0x210>
    8000380c:	00001737          	lui	a4,0x1
    80003810:	00e50733          	add	a4,a0,a4
    80003814:	00050793          	mv	a5,a0
    80003818:	0007b023          	sd	zero,0(a5)
    8000381c:	00878793          	add	a5,a5,8
    80003820:	fee79ce3          	bne	a5,a4,80003818 <map_page+0x1e8>
    80003824:	00c85793          	srl	a5,a6,0xc
    80003828:	00a79793          	sll	a5,a5,0xa
    8000382c:	0017e793          	or	a5,a5,1
    80003830:	00f43023          	sd	a5,0(s0)
    80003834:	e85ff06f          	j	800036b8 <map_page+0x88>
    80003838:	00d63423          	sd	a3,8(a2)
    8000383c:	f89ff06f          	j	800037c4 <map_page+0x194>
    80003840:	fff00513          	li	a0,-1
    80003844:	f95ff06f          	j	800037d8 <map_page+0x1a8>
    80003848:	fff00513          	li	a0,-1
    8000384c:	00008067          	ret

0000000080003850 <map_region>:
    80003850:	000017b7          	lui	a5,0x1
    80003854:	fc010113          	add	sp,sp,-64
    80003858:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000385c:	02913423          	sd	s1,40(sp)
    80003860:	00f684b3          	add	s1,a3,a5
    80003864:	00b484b3          	add	s1,s1,a1
    80003868:	fffff7b7          	lui	a5,0xfffff
    8000386c:	02113c23          	sd	ra,56(sp)
    80003870:	02813823          	sd	s0,48(sp)
    80003874:	03213023          	sd	s2,32(sp)
    80003878:	01313c23          	sd	s3,24(sp)
    8000387c:	01413823          	sd	s4,16(sp)
    80003880:	01513423          	sd	s5,8(sp)
    80003884:	00f4f4b3          	and	s1,s1,a5
    80003888:	0495f263          	bgeu	a1,s1,800038cc <map_region+0x7c>
    8000388c:	00058413          	mv	s0,a1
    80003890:	00050993          	mv	s3,a0
    80003894:	00070a13          	mv	s4,a4
    80003898:	40b60933          	sub	s2,a2,a1
    8000389c:	00001ab7          	lui	s5,0x1
    800038a0:	0080006f          	j	800038a8 <map_region+0x58>
    800038a4:	02947463          	bgeu	s0,s1,800038cc <map_region+0x7c>
    800038a8:	00890633          	add	a2,s2,s0
    800038ac:	00040593          	mv	a1,s0
    800038b0:	000a0693          	mv	a3,s4
    800038b4:	00098513          	mv	a0,s3
    800038b8:	d79ff0ef          	jal	80003630 <map_page>
    800038bc:	01540433          	add	s0,s0,s5
    800038c0:	fe0502e3          	beqz	a0,800038a4 <map_region+0x54>
    800038c4:	fff00513          	li	a0,-1
    800038c8:	0080006f          	j	800038d0 <map_region+0x80>
    800038cc:	00000513          	li	a0,0
    800038d0:	03813083          	ld	ra,56(sp)
    800038d4:	03013403          	ld	s0,48(sp)
    800038d8:	02813483          	ld	s1,40(sp)
    800038dc:	02013903          	ld	s2,32(sp)
    800038e0:	01813983          	ld	s3,24(sp)
    800038e4:	01013a03          	ld	s4,16(sp)
    800038e8:	00813a83          	ld	s5,8(sp)
    800038ec:	04010113          	add	sp,sp,64
    800038f0:	00008067          	ret

00000000800038f4 <destroy_pagetable>:
    800038f4:	f0010113          	add	sp,sp,-256
    800038f8:	000017b7          	lui	a5,0x1
    800038fc:	0e813823          	sd	s0,240(sp)
    80003900:	0f213023          	sd	s2,224(sp)
    80003904:	0d613023          	sd	s6,192(sp)
    80003908:	0b713c23          	sd	s7,184(sp)
    8000390c:	0e113c23          	sd	ra,248(sp)
    80003910:	0e913423          	sd	s1,232(sp)
    80003914:	0d313c23          	sd	s3,216(sp)
    80003918:	0d413823          	sd	s4,208(sp)
    8000391c:	0d513423          	sd	s5,200(sp)
    80003920:	0b813823          	sd	s8,176(sp)
    80003924:	0b913423          	sd	s9,168(sp)
    80003928:	0ba13023          	sd	s10,160(sp)
    8000392c:	09b13c23          	sd	s11,152(sp)
    80003930:	00050413          	mv	s0,a0
    80003934:	00050913          	mv	s2,a0
    80003938:	00f50b33          	add	s6,a0,a5
    8000393c:	00001bb7          	lui	s7,0x1
    80003940:	00c0006f          	j	8000394c <destroy_pagetable+0x58>
    80003944:	00890913          	add	s2,s2,8
    80003948:	2d690063          	beq	s2,s6,80003c08 <destroy_pagetable+0x314>
    8000394c:	00093783          	ld	a5,0(s2)
    80003950:	00100713          	li	a4,1
    80003954:	00f7f693          	and	a3,a5,15
    80003958:	fee696e3          	bne	a3,a4,80003944 <destroy_pagetable+0x50>
    8000395c:	00a7d793          	srl	a5,a5,0xa
    80003960:	00c79a13          	sll	s4,a5,0xc
    80003964:	017a0cb3          	add	s9,s4,s7
    80003968:	00100d93          	li	s11,1
    8000396c:	000a0a93          	mv	s5,s4
    80003970:	00040493          	mv	s1,s0
    80003974:	00c0006f          	j	80003980 <destroy_pagetable+0x8c>
    80003978:	008a0a13          	add	s4,s4,8 # 1008 <_entry-0x7fffeff8>
    8000397c:	279a0c63          	beq	s4,s9,80003bf4 <destroy_pagetable+0x300>
    80003980:	000a3783          	ld	a5,0(s4)
    80003984:	00f7f713          	and	a4,a5,15
    80003988:	ffb718e3          	bne	a4,s11,80003978 <destroy_pagetable+0x84>
    8000398c:	00a7d793          	srl	a5,a5,0xa
    80003990:	00c79993          	sll	s3,a5,0xc
    80003994:	00098c13          	mv	s8,s3
    80003998:	01798d33          	add	s10,s3,s7
    8000399c:	00098413          	mv	s0,s3
    800039a0:	00c0006f          	j	800039ac <destroy_pagetable+0xb8>
    800039a4:	00840413          	add	s0,s0,8
    800039a8:	23a40e63          	beq	s0,s10,80003be4 <destroy_pagetable+0x2f0>
    800039ac:	00043783          	ld	a5,0(s0)
    800039b0:	00f7f713          	and	a4,a5,15
    800039b4:	ffb718e3          	bne	a4,s11,800039a4 <destroy_pagetable+0xb0>
    800039b8:	00a7d793          	srl	a5,a5,0xa
    800039bc:	00c79793          	sll	a5,a5,0xc
    800039c0:	00048713          	mv	a4,s1
    800039c4:	03513c23          	sd	s5,56(sp)
    800039c8:	00090493          	mv	s1,s2
    800039cc:	017789b3          	add	s3,a5,s7
    800039d0:	02813823          	sd	s0,48(sp)
    800039d4:	00078a93          	mv	s5,a5
    800039d8:	00070913          	mv	s2,a4
    800039dc:	00c0006f          	j	800039e8 <destroy_pagetable+0xf4>
    800039e0:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    800039e4:	1cf98e63          	beq	s3,a5,80003bc0 <destroy_pagetable+0x2cc>
    800039e8:	0007b703          	ld	a4,0(a5)
    800039ec:	00f77693          	and	a3,a4,15
    800039f0:	ffb698e3          	bne	a3,s11,800039e0 <destroy_pagetable+0xec>
    800039f4:	00a75713          	srl	a4,a4,0xa
    800039f8:	00c71713          	sll	a4,a4,0xc
    800039fc:	017706b3          	add	a3,a4,s7
    80003a00:	05313423          	sd	s3,72(sp)
    80003a04:	00d13423          	sd	a3,8(sp)
    80003a08:	05813023          	sd	s8,64(sp)
    80003a0c:	00070993          	mv	s3,a4
    80003a10:	04f13823          	sd	a5,80(sp)
    80003a14:	0100006f          	j	80003a24 <destroy_pagetable+0x130>
    80003a18:	00813783          	ld	a5,8(sp)
    80003a1c:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    80003a20:	16e78e63          	beq	a5,a4,80003b9c <destroy_pagetable+0x2a8>
    80003a24:	00073783          	ld	a5,0(a4)
    80003a28:	00f7f693          	and	a3,a5,15
    80003a2c:	ffb696e3          	bne	a3,s11,80003a18 <destroy_pagetable+0x124>
    80003a30:	00a7d793          	srl	a5,a5,0xa
    80003a34:	00c79793          	sll	a5,a5,0xc
    80003a38:	017786b3          	add	a3,a5,s7
    80003a3c:	000a8c13          	mv	s8,s5
    80003a40:	00d13c23          	sd	a3,24(sp)
    80003a44:	00078a93          	mv	s5,a5
    80003a48:	04e13c23          	sd	a4,88(sp)
    80003a4c:	07213023          	sd	s2,96(sp)
    80003a50:	0100006f          	j	80003a60 <destroy_pagetable+0x16c>
    80003a54:	01813703          	ld	a4,24(sp)
    80003a58:	00878793          	add	a5,a5,8
    80003a5c:	10f70c63          	beq	a4,a5,80003b74 <destroy_pagetable+0x280>
    80003a60:	0007b703          	ld	a4,0(a5)
    80003a64:	00f77693          	and	a3,a4,15
    80003a68:	ffb696e3          	bne	a3,s11,80003a54 <destroy_pagetable+0x160>
    80003a6c:	00a75713          	srl	a4,a4,0xa
    80003a70:	00c71913          	sll	s2,a4,0xc
    80003a74:	01790733          	add	a4,s2,s7
    80003a78:	07213423          	sd	s2,104(sp)
    80003a7c:	00090413          	mv	s0,s2
    80003a80:	02e13023          	sd	a4,32(sp)
    80003a84:	06f13823          	sd	a5,112(sp)
    80003a88:	00048913          	mv	s2,s1
    80003a8c:	0100006f          	j	80003a9c <destroy_pagetable+0x1a8>
    80003a90:	02013783          	ld	a5,32(sp)
    80003a94:	00840413          	add	s0,s0,8
    80003a98:	0a878c63          	beq	a5,s0,80003b50 <destroy_pagetable+0x25c>
    80003a9c:	00043783          	ld	a5,0(s0)
    80003aa0:	00f7f693          	and	a3,a5,15
    80003aa4:	ffb696e3          	bne	a3,s11,80003a90 <destroy_pagetable+0x19c>
    80003aa8:	00a7d793          	srl	a5,a5,0xa
    80003aac:	00c79493          	sll	s1,a5,0xc
    80003ab0:	017487b3          	add	a5,s1,s7
    80003ab4:	00913823          	sd	s1,16(sp)
    80003ab8:	02f13423          	sd	a5,40(sp)
    80003abc:	06813c23          	sd	s0,120(sp)
    80003ac0:	0100006f          	j	80003ad0 <destroy_pagetable+0x1dc>
    80003ac4:	02813783          	ld	a5,40(sp)
    80003ac8:	00848493          	add	s1,s1,8
    80003acc:	06978663          	beq	a5,s1,80003b38 <destroy_pagetable+0x244>
    80003ad0:	0004b783          	ld	a5,0(s1)
    80003ad4:	00f7f693          	and	a3,a5,15
    80003ad8:	ffb696e3          	bne	a3,s11,80003ac4 <destroy_pagetable+0x1d0>
    80003adc:	00a7d793          	srl	a5,a5,0xa
    80003ae0:	00c79413          	sll	s0,a5,0xc
    80003ae4:	017406b3          	add	a3,s0,s7
    80003ae8:	09213023          	sd	s2,128(sp)
    80003aec:	09613423          	sd	s6,136(sp)
    80003af0:	00040913          	mv	s2,s0
    80003af4:	000a0b13          	mv	s6,s4
    80003af8:	00048a13          	mv	s4,s1
    80003afc:	00068493          	mv	s1,a3
    80003b00:	00043783          	ld	a5,0(s0)
    80003b04:	00840413          	add	s0,s0,8
    80003b08:	00f7f713          	and	a4,a5,15
    80003b0c:	13b70e63          	beq	a4,s11,80003c48 <destroy_pagetable+0x354>
    80003b10:	fe8498e3          	bne	s1,s0,80003b00 <destroy_pagetable+0x20c>
    80003b14:	00090513          	mv	a0,s2
    80003b18:	000a0493          	mv	s1,s4
    80003b1c:	08013903          	ld	s2,128(sp)
    80003b20:	000b0a13          	mv	s4,s6
    80003b24:	08813b03          	ld	s6,136(sp)
    80003b28:	87dff0ef          	jal	800033a4 <free_page>
    80003b2c:	02813783          	ld	a5,40(sp)
    80003b30:	00848493          	add	s1,s1,8
    80003b34:	f8979ee3          	bne	a5,s1,80003ad0 <destroy_pagetable+0x1dc>
    80003b38:	01013503          	ld	a0,16(sp)
    80003b3c:	07813403          	ld	s0,120(sp)
    80003b40:	865ff0ef          	jal	800033a4 <free_page>
    80003b44:	02013783          	ld	a5,32(sp)
    80003b48:	00840413          	add	s0,s0,8
    80003b4c:	f48798e3          	bne	a5,s0,80003a9c <destroy_pagetable+0x1a8>
    80003b50:	07013783          	ld	a5,112(sp)
    80003b54:	06813503          	ld	a0,104(sp)
    80003b58:	00090493          	mv	s1,s2
    80003b5c:	00f13823          	sd	a5,16(sp)
    80003b60:	845ff0ef          	jal	800033a4 <free_page>
    80003b64:	01013783          	ld	a5,16(sp)
    80003b68:	01813703          	ld	a4,24(sp)
    80003b6c:	00878793          	add	a5,a5,8
    80003b70:	eef718e3          	bne	a4,a5,80003a60 <destroy_pagetable+0x16c>
    80003b74:	05813703          	ld	a4,88(sp)
    80003b78:	000a8513          	mv	a0,s5
    80003b7c:	06013903          	ld	s2,96(sp)
    80003b80:	00e13823          	sd	a4,16(sp)
    80003b84:	821ff0ef          	jal	800033a4 <free_page>
    80003b88:	01013703          	ld	a4,16(sp)
    80003b8c:	00813783          	ld	a5,8(sp)
    80003b90:	000c0a93          	mv	s5,s8
    80003b94:	00870713          	add	a4,a4,8
    80003b98:	e8e796e3          	bne	a5,a4,80003a24 <destroy_pagetable+0x130>
    80003b9c:	05013783          	ld	a5,80(sp)
    80003ba0:	00098513          	mv	a0,s3
    80003ba4:	04013c03          	ld	s8,64(sp)
    80003ba8:	00f13423          	sd	a5,8(sp)
    80003bac:	04813983          	ld	s3,72(sp)
    80003bb0:	ff4ff0ef          	jal	800033a4 <free_page>
    80003bb4:	00813783          	ld	a5,8(sp)
    80003bb8:	00878793          	add	a5,a5,8
    80003bbc:	e2f996e3          	bne	s3,a5,800039e8 <destroy_pagetable+0xf4>
    80003bc0:	03013403          	ld	s0,48(sp)
    80003bc4:	00090793          	mv	a5,s2
    80003bc8:	000a8513          	mv	a0,s5
    80003bcc:	00840413          	add	s0,s0,8
    80003bd0:	03813a83          	ld	s5,56(sp)
    80003bd4:	00048913          	mv	s2,s1
    80003bd8:	00078493          	mv	s1,a5
    80003bdc:	fc8ff0ef          	jal	800033a4 <free_page>
    80003be0:	dda416e3          	bne	s0,s10,800039ac <destroy_pagetable+0xb8>
    80003be4:	000c0513          	mv	a0,s8
    80003be8:	008a0a13          	add	s4,s4,8
    80003bec:	fb8ff0ef          	jal	800033a4 <free_page>
    80003bf0:	d99a18e3          	bne	s4,s9,80003980 <destroy_pagetable+0x8c>
    80003bf4:	000a8513          	mv	a0,s5
    80003bf8:	00890913          	add	s2,s2,8
    80003bfc:	00048413          	mv	s0,s1
    80003c00:	fa4ff0ef          	jal	800033a4 <free_page>
    80003c04:	d56914e3          	bne	s2,s6,8000394c <destroy_pagetable+0x58>
    80003c08:	00040513          	mv	a0,s0
    80003c0c:	0f013403          	ld	s0,240(sp)
    80003c10:	0f813083          	ld	ra,248(sp)
    80003c14:	0e813483          	ld	s1,232(sp)
    80003c18:	0e013903          	ld	s2,224(sp)
    80003c1c:	0d813983          	ld	s3,216(sp)
    80003c20:	0d013a03          	ld	s4,208(sp)
    80003c24:	0c813a83          	ld	s5,200(sp)
    80003c28:	0c013b03          	ld	s6,192(sp)
    80003c2c:	0b813b83          	ld	s7,184(sp)
    80003c30:	0b013c03          	ld	s8,176(sp)
    80003c34:	0a813c83          	ld	s9,168(sp)
    80003c38:	0a013d03          	ld	s10,160(sp)
    80003c3c:	09813d83          	ld	s11,152(sp)
    80003c40:	10010113          	add	sp,sp,256
    80003c44:	f60ff06f          	j	800033a4 <free_page>
    80003c48:	00a7d793          	srl	a5,a5,0xa
    80003c4c:	00c79513          	sll	a0,a5,0xc
    80003c50:	ca5ff0ef          	jal	800038f4 <destroy_pagetable>
    80003c54:	ea8496e3          	bne	s1,s0,80003b00 <destroy_pagetable+0x20c>
    80003c58:	ebdff06f          	j	80003b14 <destroy_pagetable+0x220>

0000000080003c5c <kvminithart>:
    80003c5c:	00423797          	auipc	a5,0x423
    80003c60:	7dc7b783          	ld	a5,2012(a5) # 80427438 <kernel_pagetable>
    80003c64:	fff00713          	li	a4,-1
    80003c68:	03f71713          	sll	a4,a4,0x3f
    80003c6c:	00c7d793          	srl	a5,a5,0xc
    80003c70:	00e7e7b3          	or	a5,a5,a4
    80003c74:	18079073          	csrw	satp,a5
    80003c78:	12000073          	sfence.vma
    80003c7c:	00008067          	ret

0000000080003c80 <dump_pagetable>:
    80003c80:	fb010113          	add	sp,sp,-80
    80003c84:	03213823          	sd	s2,48(sp)
    80003c88:	03313423          	sd	s3,40(sp)
    80003c8c:	04113423          	sd	ra,72(sp)
    80003c90:	04813023          	sd	s0,64(sp)
    80003c94:	02913c23          	sd	s1,56(sp)
    80003c98:	03413023          	sd	s4,32(sp)
    80003c9c:	01513c23          	sd	s5,24(sp)
    80003ca0:	01613823          	sd	s6,16(sp)
    80003ca4:	01713423          	sd	s7,8(sp)
    80003ca8:	00058993          	mv	s3,a1
    80003cac:	00050913          	mv	s2,a0
    80003cb0:	28b05263          	blez	a1,80003f34 <dump_pagetable+0x2b4>
    80003cb4:	00000413          	li	s0,0
    80003cb8:	0014041b          	addw	s0,s0,1
    80003cbc:	02000513          	li	a0,32
    80003cc0:	e04ff0ef          	jal	800032c4 <uart_putc>
    80003cc4:	fe899ae3          	bne	s3,s0,80003cb8 <dump_pagetable+0x38>
    80003cc8:	00008517          	auipc	a0,0x8
    80003ccc:	25850513          	add	a0,a0,600 # 8000bf20 <digits+0x18>
    80003cd0:	e0cff0ef          	jal	800032dc <uart_puts>
    80003cd4:	00900793          	li	a5,9
    80003cd8:	2737d463          	bge	a5,s3,80003f40 <dump_pagetable+0x2c0>
    80003cdc:	00a00413          	li	s0,10
    80003ce0:	0289c53b          	divw	a0,s3,s0
    80003ce4:	0305051b          	addw	a0,a0,48
    80003ce8:	0ff57513          	zext.b	a0,a0
    80003cec:	dd8ff0ef          	jal	800032c4 <uart_putc>
    80003cf0:	0289e53b          	remw	a0,s3,s0
    80003cf4:	0305051b          	addw	a0,a0,48
    80003cf8:	0ff57513          	zext.b	a0,a0
    80003cfc:	dc8ff0ef          	jal	800032c4 <uart_putc>
    80003d00:	00008517          	auipc	a0,0x8
    80003d04:	23850513          	add	a0,a0,568 # 8000bf38 <digits+0x30>
    80003d08:	fff00b13          	li	s6,-1
    80003d0c:	dd0ff0ef          	jal	800032dc <uart_puts>
    80003d10:	00000493          	li	s1,0
    80003d14:	00cb5b13          	srl	s6,s6,0xc
    80003d18:	00900a13          	li	s4,9
    80003d1c:	ffc00a93          	li	s5,-4
    80003d20:	0140006f          	j	80003d34 <dump_pagetable+0xb4>
    80003d24:	0014849b          	addw	s1,s1,1
    80003d28:	20000793          	li	a5,512
    80003d2c:	00890913          	add	s2,s2,8
    80003d30:	0cf48063          	beq	s1,a5,80003df0 <dump_pagetable+0x170>
    80003d34:	00093783          	ld	a5,0(s2)
    80003d38:	0017f793          	and	a5,a5,1
    80003d3c:	fe0784e3          	beqz	a5,80003d24 <dump_pagetable+0xa4>
    80003d40:	00000413          	li	s0,0
    80003d44:	0009ca63          	bltz	s3,80003d58 <dump_pagetable+0xd8>
    80003d48:	0014041b          	addw	s0,s0,1
    80003d4c:	02000513          	li	a0,32
    80003d50:	d74ff0ef          	jal	800032c4 <uart_putc>
    80003d54:	fe89dae3          	bge	s3,s0,80003d48 <dump_pagetable+0xc8>
    80003d58:	00008517          	auipc	a0,0x8
    80003d5c:	1e850513          	add	a0,a0,488 # 8000bf40 <digits+0x38>
    80003d60:	d7cff0ef          	jal	800032dc <uart_puts>
    80003d64:	06300793          	li	a5,99
    80003d68:	1697d263          	bge	a5,s1,80003ecc <dump_pagetable+0x24c>
    80003d6c:	06400413          	li	s0,100
    80003d70:	0284c53b          	divw	a0,s1,s0
    80003d74:	00a00b93          	li	s7,10
    80003d78:	0305051b          	addw	a0,a0,48
    80003d7c:	0ff57513          	zext.b	a0,a0
    80003d80:	d44ff0ef          	jal	800032c4 <uart_putc>
    80003d84:	0284e53b          	remw	a0,s1,s0
    80003d88:	0375453b          	divw	a0,a0,s7
    80003d8c:	0305051b          	addw	a0,a0,48
    80003d90:	0ff57513          	zext.b	a0,a0
    80003d94:	d30ff0ef          	jal	800032c4 <uart_putc>
    80003d98:	0374e53b          	remw	a0,s1,s7
    80003d9c:	0305051b          	addw	a0,a0,48
    80003da0:	0ff57513          	zext.b	a0,a0
    80003da4:	d20ff0ef          	jal	800032c4 <uart_putc>
    80003da8:	00008517          	auipc	a0,0x8
    80003dac:	1a050513          	add	a0,a0,416 # 8000bf48 <digits+0x40>
    80003db0:	d2cff0ef          	jal	800032dc <uart_puts>
    80003db4:	00093b83          	ld	s7,0(s2)
    80003db8:	00ebf793          	and	a5,s7,14
    80003dbc:	06079063          	bnez	a5,80003e1c <dump_pagetable+0x19c>
    80003dc0:	00008517          	auipc	a0,0x8
    80003dc4:	1a050513          	add	a0,a0,416 # 8000bf60 <digits+0x58>
    80003dc8:	d14ff0ef          	jal	800032dc <uart_puts>
    80003dcc:	00093503          	ld	a0,0(s2)
    80003dd0:	0019859b          	addw	a1,s3,1
    80003dd4:	0014849b          	addw	s1,s1,1
    80003dd8:	00a55513          	srl	a0,a0,0xa
    80003ddc:	00c51513          	sll	a0,a0,0xc
    80003de0:	ea1ff0ef          	jal	80003c80 <dump_pagetable>
    80003de4:	20000793          	li	a5,512
    80003de8:	00890913          	add	s2,s2,8
    80003dec:	f4f494e3          	bne	s1,a5,80003d34 <dump_pagetable+0xb4>
    80003df0:	04813083          	ld	ra,72(sp)
    80003df4:	04013403          	ld	s0,64(sp)
    80003df8:	03813483          	ld	s1,56(sp)
    80003dfc:	03013903          	ld	s2,48(sp)
    80003e00:	02813983          	ld	s3,40(sp)
    80003e04:	02013a03          	ld	s4,32(sp)
    80003e08:	01813a83          	ld	s5,24(sp)
    80003e0c:	01013b03          	ld	s6,16(sp)
    80003e10:	00813b83          	ld	s7,8(sp)
    80003e14:	05010113          	add	sp,sp,80
    80003e18:	00008067          	ret
    80003e1c:	00008517          	auipc	a0,0x8
    80003e20:	13450513          	add	a0,a0,308 # 8000bf50 <digits+0x48>
    80003e24:	cb8ff0ef          	jal	800032dc <uart_puts>
    80003e28:	00abdb93          	srl	s7,s7,0xa
    80003e2c:	016bfbb3          	and	s7,s7,s6
    80003e30:	00000713          	li	a4,0
    80003e34:	03c00413          	li	s0,60
    80003e38:	008bd7b3          	srl	a5,s7,s0
    80003e3c:	00f7f793          	and	a5,a5,15
    80003e40:	00e7e733          	or	a4,a5,a4
    80003e44:	00071e63          	bnez	a4,80003e60 <dump_pagetable+0x1e0>
    80003e48:	02040c63          	beqz	s0,80003e80 <dump_pagetable+0x200>
    80003e4c:	ffc4041b          	addw	s0,s0,-4
    80003e50:	008bd7b3          	srl	a5,s7,s0
    80003e54:	00f7f793          	and	a5,a5,15
    80003e58:	00e7e733          	or	a4,a5,a4
    80003e5c:	fe0706e3          	beqz	a4,80003e48 <dump_pagetable+0x1c8>
    80003e60:	ffc4041b          	addw	s0,s0,-4
    80003e64:	03778513          	add	a0,a5,55
    80003e68:	0ff7f713          	zext.b	a4,a5
    80003e6c:	04fa5c63          	bge	s4,a5,80003ec4 <dump_pagetable+0x244>
    80003e70:	c54ff0ef          	jal	800032c4 <uart_putc>
    80003e74:	01540a63          	beq	s0,s5,80003e88 <dump_pagetable+0x208>
    80003e78:	00100713          	li	a4,1
    80003e7c:	fbdff06f          	j	80003e38 <dump_pagetable+0x1b8>
    80003e80:	03000513          	li	a0,48
    80003e84:	c40ff0ef          	jal	800032c4 <uart_putc>
    80003e88:	00008517          	auipc	a0,0x8
    80003e8c:	0d050513          	add	a0,a0,208 # 8000bf58 <digits+0x50>
    80003e90:	c4cff0ef          	jal	800032dc <uart_puts>
    80003e94:	00093783          	ld	a5,0(s2)
    80003e98:	0027f713          	and	a4,a5,2
    80003e9c:	08071463          	bnez	a4,80003f24 <dump_pagetable+0x2a4>
    80003ea0:	0047f713          	and	a4,a5,4
    80003ea4:	06071863          	bnez	a4,80003f14 <dump_pagetable+0x294>
    80003ea8:	0087f713          	and	a4,a5,8
    80003eac:	04071c63          	bnez	a4,80003f04 <dump_pagetable+0x284>
    80003eb0:	0107f793          	and	a5,a5,16
    80003eb4:	04079263          	bnez	a5,80003ef8 <dump_pagetable+0x278>
    80003eb8:	00a00513          	li	a0,10
    80003ebc:	c08ff0ef          	jal	800032c4 <uart_putc>
    80003ec0:	e65ff06f          	j	80003d24 <dump_pagetable+0xa4>
    80003ec4:	03070513          	add	a0,a4,48
    80003ec8:	fa9ff06f          	j	80003e70 <dump_pagetable+0x1f0>
    80003ecc:	089a5263          	bge	s4,s1,80003f50 <dump_pagetable+0x2d0>
    80003ed0:	00a00413          	li	s0,10
    80003ed4:	0284c53b          	divw	a0,s1,s0
    80003ed8:	0305051b          	addw	a0,a0,48
    80003edc:	0ff57513          	zext.b	a0,a0
    80003ee0:	be4ff0ef          	jal	800032c4 <uart_putc>
    80003ee4:	0284e53b          	remw	a0,s1,s0
    80003ee8:	0305051b          	addw	a0,a0,48
    80003eec:	0ff57513          	zext.b	a0,a0
    80003ef0:	bd4ff0ef          	jal	800032c4 <uart_putc>
    80003ef4:	eb5ff06f          	j	80003da8 <dump_pagetable+0x128>
    80003ef8:	05500513          	li	a0,85
    80003efc:	bc8ff0ef          	jal	800032c4 <uart_putc>
    80003f00:	fb9ff06f          	j	80003eb8 <dump_pagetable+0x238>
    80003f04:	05800513          	li	a0,88
    80003f08:	bbcff0ef          	jal	800032c4 <uart_putc>
    80003f0c:	00093783          	ld	a5,0(s2)
    80003f10:	fa1ff06f          	j	80003eb0 <dump_pagetable+0x230>
    80003f14:	05700513          	li	a0,87
    80003f18:	bacff0ef          	jal	800032c4 <uart_putc>
    80003f1c:	00093783          	ld	a5,0(s2)
    80003f20:	f89ff06f          	j	80003ea8 <dump_pagetable+0x228>
    80003f24:	05200513          	li	a0,82
    80003f28:	b9cff0ef          	jal	800032c4 <uart_putc>
    80003f2c:	00093783          	ld	a5,0(s2)
    80003f30:	f71ff06f          	j	80003ea0 <dump_pagetable+0x220>
    80003f34:	00008517          	auipc	a0,0x8
    80003f38:	fec50513          	add	a0,a0,-20 # 8000bf20 <digits+0x18>
    80003f3c:	ba0ff0ef          	jal	800032dc <uart_puts>
    80003f40:	0309851b          	addw	a0,s3,48
    80003f44:	0ff57513          	zext.b	a0,a0
    80003f48:	b7cff0ef          	jal	800032c4 <uart_putc>
    80003f4c:	db5ff06f          	j	80003d00 <dump_pagetable+0x80>
    80003f50:	0304851b          	addw	a0,s1,48
    80003f54:	0ff57513          	zext.b	a0,a0
    80003f58:	b6cff0ef          	jal	800032c4 <uart_putc>
    80003f5c:	e4dff06f          	j	80003da8 <dump_pagetable+0x128>

0000000080003f60 <init_page_replacement>:
    80003f60:	00100713          	li	a4,1
    80003f64:	02a71713          	sll	a4,a4,0x2a
    80003f68:	0000d797          	auipc	a5,0xd
    80003f6c:	09878793          	add	a5,a5,152 # 80011000 <swap_mgr>
    80003f70:	08e7b023          	sd	a4,128(a5)
    80003f74:	0000d717          	auipc	a4,0xd
    80003f78:	10072a23          	sw	zero,276(a4) # 80011088 <swap_mgr+0x88>
    80003f7c:	0000d717          	auipc	a4,0xd
    80003f80:	10470713          	add	a4,a4,260 # 80011080 <swap_mgr+0x80>
    80003f84:	0007a023          	sw	zero,0(a5)
    80003f88:	00478793          	add	a5,a5,4
    80003f8c:	fee79ce3          	bne	a5,a4,80003f84 <init_page_replacement+0x24>
    80003f90:	0040d797          	auipc	a5,0x40d
    80003f94:	1007b023          	sd	zero,256(a5) # 80411090 <lru_mgr>
    80003f98:	0040d797          	auipc	a5,0x40d
    80003f9c:	1007b023          	sd	zero,256(a5) # 80411098 <lru_mgr+0x8>
    80003fa0:	00100793          	li	a5,1
    80003fa4:	02879793          	sll	a5,a5,0x28
    80003fa8:	00410717          	auipc	a4,0x410
    80003fac:	0ef73c23          	sd	a5,248(a4) # 804140a0 <lru_mgr+0x3010>
    80003fb0:	fff00713          	li	a4,-1
    80003fb4:	0040d797          	auipc	a5,0x40d
    80003fb8:	0ec78793          	add	a5,a5,236 # 804110a0 <lru_mgr+0x10>
    80003fbc:	00410697          	auipc	a3,0x410
    80003fc0:	0e468693          	add	a3,a3,228 # 804140a0 <lru_mgr+0x3010>
    80003fc4:	02075713          	srl	a4,a4,0x20
    80003fc8:	0007b023          	sd	zero,0(a5)
    80003fcc:	0007b423          	sd	zero,8(a5)
    80003fd0:	00e7b823          	sd	a4,16(a5)
    80003fd4:	0007bc23          	sd	zero,24(a5)
    80003fd8:	0207b023          	sd	zero,32(a5)
    80003fdc:	0207b423          	sd	zero,40(a5)
    80003fe0:	03078793          	add	a5,a5,48
    80003fe4:	fed792e3          	bne	a5,a3,80003fc8 <init_page_replacement+0x68>
    80003fe8:	00008067          	ret

0000000080003fec <kvminit>:
    80003fec:	fd010113          	add	sp,sp,-48
    80003ff0:	02113423          	sd	ra,40(sp)
    80003ff4:	02813023          	sd	s0,32(sp)
    80003ff8:	00913c23          	sd	s1,24(sp)
    80003ffc:	01213823          	sd	s2,16(sp)
    80004000:	01313423          	sd	s3,8(sp)
    80004004:	01413023          	sd	s4,0(sp)
    80004008:	f59ff0ef          	jal	80003f60 <init_page_replacement>
    8000400c:	b7cff0ef          	jal	80003388 <alloc_page>
    80004010:	00001737          	lui	a4,0x1
    80004014:	00e50733          	add	a4,a0,a4
    80004018:	00050413          	mv	s0,a0
    8000401c:	00050793          	mv	a5,a0
    80004020:	1a050663          	beqz	a0,800041cc <kvminit+0x1e0>
    80004024:	0007b023          	sd	zero,0(a5)
    80004028:	00878793          	add	a5,a5,8
    8000402c:	fef71ce3          	bne	a4,a5,80004024 <kvminit+0x38>
    80004030:	00423917          	auipc	s2,0x423
    80004034:	40890913          	add	s2,s2,1032 # 80427438 <kernel_pagetable>
    80004038:	00005997          	auipc	s3,0x5
    8000403c:	cdb98993          	add	s3,s3,-805 # 80008d13 <rodata_start+0xd13>
    80004040:	fffff7b7          	lui	a5,0xfffff
    80004044:	00893023          	sd	s0,0(s2)
    80004048:	ffffc497          	auipc	s1,0xffffc
    8000404c:	fb848493          	add	s1,s1,-72 # 80000000 <_entry>
    80004050:	00f9f9b3          	and	s3,s3,a5
    80004054:	0334f863          	bgeu	s1,s3,80004084 <kvminit+0x98>
    80004058:	00001a37          	lui	s4,0x1
    8000405c:	0080006f          	j	80004064 <kvminit+0x78>
    80004060:	0334f063          	bgeu	s1,s3,80004080 <kvminit+0x94>
    80004064:	00048613          	mv	a2,s1
    80004068:	00048593          	mv	a1,s1
    8000406c:	00a00693          	li	a3,10
    80004070:	00040513          	mv	a0,s0
    80004074:	dbcff0ef          	jal	80003630 <map_page>
    80004078:	014484b3          	add	s1,s1,s4
    8000407c:	fe0502e3          	beqz	a0,80004060 <kvminit+0x74>
    80004080:	00093403          	ld	s0,0(s2)
    80004084:	0000a997          	auipc	s3,0xa
    80004088:	e0b98993          	add	s3,s3,-501 # 8000de8f <data_end+0xe8b>
    8000408c:	fffff7b7          	lui	a5,0xfffff
    80004090:	00004497          	auipc	s1,0x4
    80004094:	f7048493          	add	s1,s1,-144 # 80008000 <rodata_start>
    80004098:	00f9f9b3          	and	s3,s3,a5
    8000409c:	0334f863          	bgeu	s1,s3,800040cc <kvminit+0xe0>
    800040a0:	00001a37          	lui	s4,0x1
    800040a4:	0080006f          	j	800040ac <kvminit+0xc0>
    800040a8:	0334f063          	bgeu	s1,s3,800040c8 <kvminit+0xdc>
    800040ac:	00048613          	mv	a2,s1
    800040b0:	00048593          	mv	a1,s1
    800040b4:	00200693          	li	a3,2
    800040b8:	00040513          	mv	a0,s0
    800040bc:	d74ff0ef          	jal	80003630 <map_page>
    800040c0:	014484b3          	add	s1,s1,s4
    800040c4:	fe0502e3          	beqz	a0,800040a8 <kvminit+0xbc>
    800040c8:	00093403          	ld	s0,0(s2)
    800040cc:	0000a997          	auipc	s3,0xa
    800040d0:	f3798993          	add	s3,s3,-201 # 8000e003 <data_end+0xfff>
    800040d4:	fffff7b7          	lui	a5,0xfffff
    800040d8:	00009497          	auipc	s1,0x9
    800040dc:	f2848493          	add	s1,s1,-216 # 8000d000 <nextpid>
    800040e0:	00f9f9b3          	and	s3,s3,a5
    800040e4:	0334f863          	bgeu	s1,s3,80004114 <kvminit+0x128>
    800040e8:	00001a37          	lui	s4,0x1
    800040ec:	0080006f          	j	800040f4 <kvminit+0x108>
    800040f0:	0334f063          	bgeu	s1,s3,80004110 <kvminit+0x124>
    800040f4:	00048613          	mv	a2,s1
    800040f8:	00048593          	mv	a1,s1
    800040fc:	00600693          	li	a3,6
    80004100:	00040513          	mv	a0,s0
    80004104:	d2cff0ef          	jal	80003630 <map_page>
    80004108:	014484b3          	add	s1,s1,s4
    8000410c:	fe0502e3          	beqz	a0,800040f0 <kvminit+0x104>
    80004110:	00093403          	ld	s0,0(s2)
    80004114:	00424997          	auipc	s3,0x424
    80004118:	35b98993          	add	s3,s3,859 # 8042846f <bss_end+0xfff>
    8000411c:	fffff7b7          	lui	a5,0xfffff
    80004120:	0000c497          	auipc	s1,0xc
    80004124:	ee048493          	add	s1,s1,-288 # 80010000 <bss_start>
    80004128:	00f9f9b3          	and	s3,s3,a5
    8000412c:	0334f863          	bgeu	s1,s3,8000415c <kvminit+0x170>
    80004130:	00001a37          	lui	s4,0x1
    80004134:	0080006f          	j	8000413c <kvminit+0x150>
    80004138:	0334f063          	bgeu	s1,s3,80004158 <kvminit+0x16c>
    8000413c:	00048613          	mv	a2,s1
    80004140:	00048593          	mv	a1,s1
    80004144:	00600693          	li	a3,6
    80004148:	00040513          	mv	a0,s0
    8000414c:	ce4ff0ef          	jal	80003630 <map_page>
    80004150:	014484b3          	add	s1,s1,s4
    80004154:	fe0502e3          	beqz	a0,80004138 <kvminit+0x14c>
    80004158:	00093403          	ld	s0,0(s2)
    8000415c:	01100993          	li	s3,17
    80004160:	00423497          	auipc	s1,0x423
    80004164:	31048493          	add	s1,s1,784 # 80427470 <bss_end>
    80004168:	01b99993          	sll	s3,s3,0x1b
    8000416c:	0334f863          	bgeu	s1,s3,8000419c <kvminit+0x1b0>
    80004170:	00001a37          	lui	s4,0x1
    80004174:	0080006f          	j	8000417c <kvminit+0x190>
    80004178:	0334f063          	bgeu	s1,s3,80004198 <kvminit+0x1ac>
    8000417c:	00048613          	mv	a2,s1
    80004180:	00048593          	mv	a1,s1
    80004184:	00600693          	li	a3,6
    80004188:	00040513          	mv	a0,s0
    8000418c:	ca4ff0ef          	jal	80003630 <map_page>
    80004190:	014484b3          	add	s1,s1,s4
    80004194:	fe0502e3          	beqz	a0,80004178 <kvminit+0x18c>
    80004198:	00093403          	ld	s0,0(s2)
    8000419c:	00040513          	mv	a0,s0
    800041a0:	02013403          	ld	s0,32(sp)
    800041a4:	02813083          	ld	ra,40(sp)
    800041a8:	01813483          	ld	s1,24(sp)
    800041ac:	01013903          	ld	s2,16(sp)
    800041b0:	00813983          	ld	s3,8(sp)
    800041b4:	00013a03          	ld	s4,0(sp)
    800041b8:	00600693          	li	a3,6
    800041bc:	10000637          	lui	a2,0x10000
    800041c0:	100005b7          	lui	a1,0x10000
    800041c4:	03010113          	add	sp,sp,48
    800041c8:	c68ff06f          	j	80003630 <map_page>
    800041cc:	02813083          	ld	ra,40(sp)
    800041d0:	02013403          	ld	s0,32(sp)
    800041d4:	00423797          	auipc	a5,0x423
    800041d8:	2607b223          	sd	zero,612(a5) # 80427438 <kernel_pagetable>
    800041dc:	01813483          	ld	s1,24(sp)
    800041e0:	01013903          	ld	s2,16(sp)
    800041e4:	00813983          	ld	s3,8(sp)
    800041e8:	00013a03          	ld	s4,0(sp)
    800041ec:	03010113          	add	sp,sp,48
    800041f0:	00008067          	ret

00000000800041f4 <alloc_swap_slot>:
    800041f4:	0000d617          	auipc	a2,0xd
    800041f8:	e0c60613          	add	a2,a2,-500 # 80011000 <swap_mgr>
    800041fc:	08862803          	lw	a6,136(a2)
    80004200:	08462883          	lw	a7,132(a2)
    80004204:	fff00513          	li	a0,-1
    80004208:	0d187663          	bgeu	a6,a7,800042d4 <alloc_swap_slot+0xe0>
    8000420c:	08062303          	lw	t1,128(a2)
    80004210:	07137863          	bgeu	t1,a7,80004280 <alloc_swap_slot+0x8c>
    80004214:	0053579b          	srlw	a5,t1,0x5
    80004218:	00279793          	sll	a5,a5,0x2
    8000421c:	00f607b3          	add	a5,a2,a5
    80004220:	0007a683          	lw	a3,0(a5)
    80004224:	00100593          	li	a1,1
    80004228:	006595bb          	sllw	a1,a1,t1
    8000422c:	00b6f7b3          	and	a5,a3,a1
    80004230:	0007879b          	sext.w	a5,a5
    80004234:	0053571b          	srlw	a4,t1,0x5
    80004238:	00030513          	mv	a0,t1
    8000423c:	08078e63          	beqz	a5,800042d8 <alloc_swap_slot+0xe4>
    80004240:	00100e13          	li	t3,1
    80004244:	01c0006f          	j	80004260 <alloc_swap_slot+0x6c>
    80004248:	0006a683          	lw	a3,0(a3)
    8000424c:	0007859b          	sext.w	a1,a5
    80004250:	0057571b          	srlw	a4,a4,0x5
    80004254:	00f6f7b3          	and	a5,a3,a5
    80004258:	0007879b          	sext.w	a5,a5
    8000425c:	06078e63          	beqz	a5,800042d8 <alloc_swap_slot+0xe4>
    80004260:	0015071b          	addw	a4,a0,1
    80004264:	0057579b          	srlw	a5,a4,0x5
    80004268:	00279793          	sll	a5,a5,0x2
    8000426c:	0007051b          	sext.w	a0,a4
    80004270:	00f606b3          	add	a3,a2,a5
    80004274:	00ee17bb          	sllw	a5,t3,a4
    80004278:	fca898e3          	bne	a7,a0,80004248 <alloc_swap_slot+0x54>
    8000427c:	04030a63          	beqz	t1,800042d0 <alloc_swap_slot+0xdc>
    80004280:	00062683          	lw	a3,0(a2)
    80004284:	0016f513          	and	a0,a3,1
    80004288:	0a050063          	beqz	a0,80004328 <alloc_swap_slot+0x134>
    8000428c:	00000513          	li	a0,0
    80004290:	00100e13          	li	t3,1
    80004294:	01c0006f          	j	800042b0 <alloc_swap_slot+0xbc>
    80004298:	0006a683          	lw	a3,0(a3)
    8000429c:	00078e9b          	sext.w	t4,a5
    800042a0:	0057571b          	srlw	a4,a4,0x5
    800042a4:	00f6f7b3          	and	a5,a3,a5
    800042a8:	0007879b          	sext.w	a5,a5
    800042ac:	04078a63          	beqz	a5,80004300 <alloc_swap_slot+0x10c>
    800042b0:	0015071b          	addw	a4,a0,1
    800042b4:	0057579b          	srlw	a5,a4,0x5
    800042b8:	00279793          	sll	a5,a5,0x2
    800042bc:	0005059b          	sext.w	a1,a0
    800042c0:	0007051b          	sext.w	a0,a4
    800042c4:	00f606b3          	add	a3,a2,a5
    800042c8:	00ee17bb          	sllw	a5,t3,a4
    800042cc:	fca316e3          	bne	t1,a0,80004298 <alloc_swap_slot+0xa4>
    800042d0:	fff00513          	li	a0,-1
    800042d4:	00008067          	ret
    800042d8:	0015079b          	addw	a5,a0,1
    800042dc:	0317f7bb          	remuw	a5,a5,a7
    800042e0:	00271713          	sll	a4,a4,0x2
    800042e4:	00e60733          	add	a4,a2,a4
    800042e8:	00b6e6b3          	or	a3,a3,a1
    800042ec:	0018081b          	addw	a6,a6,1
    800042f0:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    800042f4:	09062423          	sw	a6,136(a2)
    800042f8:	08f62023          	sw	a5,128(a2)
    800042fc:	00008067          	ret
    80004300:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    80004304:	0315f5bb          	remuw	a1,a1,a7
    80004308:	00271713          	sll	a4,a4,0x2
    8000430c:	00e60733          	add	a4,a2,a4
    80004310:	01d6e6b3          	or	a3,a3,t4
    80004314:	0018081b          	addw	a6,a6,1
    80004318:	00d72023          	sw	a3,0(a4)
    8000431c:	09062423          	sw	a6,136(a2)
    80004320:	08b62023          	sw	a1,128(a2)
    80004324:	00008067          	ret
    80004328:	00000713          	li	a4,0
    8000432c:	00100593          	li	a1,1
    80004330:	00100e93          	li	t4,1
    80004334:	fd1ff06f          	j	80004304 <alloc_swap_slot+0x110>

0000000080004338 <free_swap_slot>:
    80004338:	0000d717          	auipc	a4,0xd
    8000433c:	cc870713          	add	a4,a4,-824 # 80011000 <swap_mgr>
    80004340:	08472783          	lw	a5,132(a4)
    80004344:	04f57663          	bgeu	a0,a5,80004390 <free_swap_slot+0x58>
    80004348:	0055579b          	srlw	a5,a0,0x5
    8000434c:	00279793          	sll	a5,a5,0x2
    80004350:	00f707b3          	add	a5,a4,a5
    80004354:	0007a583          	lw	a1,0(a5)
    80004358:	00100693          	li	a3,1
    8000435c:	00a696bb          	sllw	a3,a3,a0
    80004360:	00d5f633          	and	a2,a1,a3
    80004364:	0006061b          	sext.w	a2,a2
    80004368:	02060463          	beqz	a2,80004390 <free_swap_slot+0x58>
    8000436c:	08872603          	lw	a2,136(a4)
    80004370:	fff6c693          	not	a3,a3
    80004374:	08072803          	lw	a6,128(a4)
    80004378:	00d5f5b3          	and	a1,a1,a3
    8000437c:	fff6069b          	addw	a3,a2,-1
    80004380:	00b7a023          	sw	a1,0(a5)
    80004384:	08d72423          	sw	a3,136(a4)
    80004388:	01057463          	bgeu	a0,a6,80004390 <free_swap_slot+0x58>
    8000438c:	08a72023          	sw	a0,128(a4)
    80004390:	00008067          	ret

0000000080004394 <find_page_desc>:
    80004394:	fffff7b7          	lui	a5,0xfffff
    80004398:	00f57533          	and	a0,a0,a5
    8000439c:	00000713          	li	a4,0
    800043a0:	0040d797          	auipc	a5,0x40d
    800043a4:	d0078793          	add	a5,a5,-768 # 804110a0 <lru_mgr+0x10>
    800043a8:	10000613          	li	a2,256
    800043ac:	0100006f          	j	800043bc <find_page_desc+0x28>
    800043b0:	0017071b          	addw	a4,a4,1
    800043b4:	03078793          	add	a5,a5,48
    800043b8:	02c70a63          	beq	a4,a2,800043ec <find_page_desc+0x58>
    800043bc:	0007b683          	ld	a3,0(a5)
    800043c0:	fea698e3          	bne	a3,a0,800043b0 <find_page_desc+0x1c>
    800043c4:	0147a683          	lw	a3,20(a5)
    800043c8:	0016f693          	and	a3,a3,1
    800043cc:	fe0682e3          	beqz	a3,800043b0 <find_page_desc+0x1c>
    800043d0:	00171513          	sll	a0,a4,0x1
    800043d4:	00e50533          	add	a0,a0,a4
    800043d8:	0040d797          	auipc	a5,0x40d
    800043dc:	cc878793          	add	a5,a5,-824 # 804110a0 <lru_mgr+0x10>
    800043e0:	00451513          	sll	a0,a0,0x4
    800043e4:	00f50533          	add	a0,a0,a5
    800043e8:	00008067          	ret
    800043ec:	00000513          	li	a0,0
    800043f0:	00008067          	ret

00000000800043f4 <lru_add_page>:
    800043f4:	02050c63          	beqz	a0,8000442c <lru_add_page+0x38>
    800043f8:	0040d717          	auipc	a4,0x40d
    800043fc:	c9870713          	add	a4,a4,-872 # 80411090 <lru_mgr>
    80004400:	00073783          	ld	a5,0(a4)
    80004404:	00053c23          	sd	zero,24(a0)
    80004408:	02f53023          	sd	a5,32(a0)
    8000440c:	02078263          	beqz	a5,80004430 <lru_add_page+0x3c>
    80004410:	00a7bc23          	sd	a0,24(a5)
    80004414:	00410697          	auipc	a3,0x410
    80004418:	c7c68693          	add	a3,a3,-900 # 80414090 <lru_mgr+0x3000>
    8000441c:	0106a783          	lw	a5,16(a3)
    80004420:	00a73023          	sd	a0,0(a4)
    80004424:	0017879b          	addw	a5,a5,1
    80004428:	00f6a823          	sw	a5,16(a3)
    8000442c:	00008067          	ret
    80004430:	00a73423          	sd	a0,8(a4)
    80004434:	fe1ff06f          	j	80004414 <lru_add_page+0x20>

0000000080004438 <lru_remove_page>:
    80004438:	02050c63          	beqz	a0,80004470 <lru_remove_page+0x38>
    8000443c:	01853783          	ld	a5,24(a0)
    80004440:	02053703          	ld	a4,32(a0)
    80004444:	02078863          	beqz	a5,80004474 <lru_remove_page+0x3c>
    80004448:	02e7b023          	sd	a4,32(a5)
    8000444c:	02070a63          	beqz	a4,80004480 <lru_remove_page+0x48>
    80004450:	00f73c23          	sd	a5,24(a4)
    80004454:	00410717          	auipc	a4,0x410
    80004458:	c3c70713          	add	a4,a4,-964 # 80414090 <lru_mgr+0x3000>
    8000445c:	01072783          	lw	a5,16(a4)
    80004460:	02053023          	sd	zero,32(a0)
    80004464:	00053c23          	sd	zero,24(a0)
    80004468:	fff7879b          	addw	a5,a5,-1
    8000446c:	00f72823          	sw	a5,16(a4)
    80004470:	00008067          	ret
    80004474:	0040d697          	auipc	a3,0x40d
    80004478:	c0e6be23          	sd	a4,-996(a3) # 80411090 <lru_mgr>
    8000447c:	fc071ae3          	bnez	a4,80004450 <lru_remove_page+0x18>
    80004480:	0040d717          	auipc	a4,0x40d
    80004484:	c0f73c23          	sd	a5,-1000(a4) # 80411098 <lru_mgr+0x8>
    80004488:	fcdff06f          	j	80004454 <lru_remove_page+0x1c>

000000008000448c <lru_touch_page>:
    8000448c:	fffff7b7          	lui	a5,0xfffff
    80004490:	00f57533          	and	a0,a0,a5
    80004494:	00000713          	li	a4,0
    80004498:	0040d797          	auipc	a5,0x40d
    8000449c:	c0878793          	add	a5,a5,-1016 # 804110a0 <lru_mgr+0x10>
    800044a0:	10000613          	li	a2,256
    800044a4:	0100006f          	j	800044b4 <lru_touch_page+0x28>
    800044a8:	0017071b          	addw	a4,a4,1
    800044ac:	03078793          	add	a5,a5,48
    800044b0:	0ac70663          	beq	a4,a2,8000455c <lru_touch_page+0xd0>
    800044b4:	0007b683          	ld	a3,0(a5)
    800044b8:	fea698e3          	bne	a3,a0,800044a8 <lru_touch_page+0x1c>
    800044bc:	0147a683          	lw	a3,20(a5)
    800044c0:	0016f693          	and	a3,a3,1
    800044c4:	fe0682e3          	beqz	a3,800044a8 <lru_touch_page+0x1c>
    800044c8:	00171613          	sll	a2,a4,0x1
    800044cc:	00e607b3          	add	a5,a2,a4
    800044d0:	0040d597          	auipc	a1,0x40d
    800044d4:	bc058593          	add	a1,a1,-1088 # 80411090 <lru_mgr>
    800044d8:	00479793          	sll	a5,a5,0x4
    800044dc:	00170513          	add	a0,a4,1
    800044e0:	00f58833          	add	a6,a1,a5
    800044e4:	00151693          	sll	a3,a0,0x1
    800044e8:	00a686b3          	add	a3,a3,a0
    800044ec:	02883803          	ld	a6,40(a6)
    800044f0:	00469693          	sll	a3,a3,0x4
    800044f4:	01078793          	add	a5,a5,16
    800044f8:	00d586b3          	add	a3,a1,a3
    800044fc:	0006b683          	ld	a3,0(a3)
    80004500:	00f587b3          	add	a5,a1,a5
    80004504:	04080e63          	beqz	a6,80004560 <lru_touch_page+0xd4>
    80004508:	02d83023          	sd	a3,32(a6)
    8000450c:	0005b883          	ld	a7,0(a1)
    80004510:	04068c63          	beqz	a3,80004568 <lru_touch_page+0xdc>
    80004514:	0106bc23          	sd	a6,24(a3)
    80004518:	00151693          	sll	a3,a0,0x1
    8000451c:	00e60733          	add	a4,a2,a4
    80004520:	00a686b3          	add	a3,a3,a0
    80004524:	00469693          	sll	a3,a3,0x4
    80004528:	00471713          	sll	a4,a4,0x4
    8000452c:	00e58733          	add	a4,a1,a4
    80004530:	00d586b3          	add	a3,a1,a3
    80004534:	00410617          	auipc	a2,0x410
    80004538:	b5c60613          	add	a2,a2,-1188 # 80414090 <lru_mgr+0x3000>
    8000453c:	02073423          	sd	zero,40(a4)
    80004540:	0116b023          	sd	a7,0(a3)
    80004544:	01062703          	lw	a4,16(a2)
    80004548:	02088463          	beqz	a7,80004570 <lru_touch_page+0xe4>
    8000454c:	00f8bc23          	sd	a5,24(a7)
    80004550:	00f5b023          	sd	a5,0(a1)
    80004554:	00e62823          	sw	a4,16(a2)
    80004558:	00008067          	ret
    8000455c:	00008067          	ret
    80004560:	00068893          	mv	a7,a3
    80004564:	fa0698e3          	bnez	a3,80004514 <lru_touch_page+0x88>
    80004568:	0105b423          	sd	a6,8(a1)
    8000456c:	fadff06f          	j	80004518 <lru_touch_page+0x8c>
    80004570:	00f5b423          	sd	a5,8(a1)
    80004574:	00f5b023          	sd	a5,0(a1)
    80004578:	00e62823          	sw	a4,16(a2)
    8000457c:	00008067          	ret

0000000080004580 <find_victim_page>:
    80004580:	0040d517          	auipc	a0,0x40d
    80004584:	b1853503          	ld	a0,-1256(a0) # 80411098 <lru_mgr+0x8>
    80004588:	00008067          	ret

000000008000458c <swap_out_page>:
    8000458c:	16050263          	beqz	a0,800046f0 <swap_out_page+0x164>
    80004590:	fd010113          	add	sp,sp,-48
    80004594:	00913c23          	sd	s1,24(sp)
    80004598:	01452483          	lw	s1,20(a0)
    8000459c:	02813023          	sd	s0,32(sp)
    800045a0:	01313423          	sd	s3,8(sp)
    800045a4:	02113423          	sd	ra,40(sp)
    800045a8:	01213823          	sd	s2,16(sp)
    800045ac:	0014f793          	and	a5,s1,1
    800045b0:	00050413          	mv	s0,a0
    800045b4:	00048993          	mv	s3,s1
    800045b8:	12078863          	beqz	a5,800046e8 <swap_out_page+0x15c>
    800045bc:	c39ff0ef          	jal	800041f4 <alloc_swap_slot>
    800045c0:	0005091b          	sext.w	s2,a0
    800045c4:	fff00793          	li	a5,-1
    800045c8:	12f90063          	beq	s2,a5,800046e8 <swap_out_page+0x15c>
    800045cc:	0049f993          	and	s3,s3,4
    800045d0:	04098663          	beqz	s3,8000461c <swap_out_page+0x90>
    800045d4:	00843683          	ld	a3,8(s0)
    800045d8:	00c9171b          	sllw	a4,s2,0xc
    800045dc:	0000d797          	auipc	a5,0xd
    800045e0:	ab478793          	add	a5,a5,-1356 # 80011090 <swap_area>
    800045e4:	02071713          	sll	a4,a4,0x20
    800045e8:	02075713          	srl	a4,a4,0x20
    800045ec:	40f686b3          	sub	a3,a3,a5
    800045f0:	0000e617          	auipc	a2,0xe
    800045f4:	aa060613          	add	a2,a2,-1376 # 80012090 <swap_area+0x1000>
    800045f8:	00f707b3          	add	a5,a4,a5
    800045fc:	00e60633          	add	a2,a2,a4
    80004600:	40e686b3          	sub	a3,a3,a4
    80004604:	00f68733          	add	a4,a3,a5
    80004608:	00074703          	lbu	a4,0(a4)
    8000460c:	00178793          	add	a5,a5,1
    80004610:	fee78fa3          	sb	a4,-1(a5)
    80004614:	fec798e3          	bne	a5,a2,80004604 <swap_out_page+0x78>
    80004618:	01442483          	lw	s1,20(s0)
    8000461c:	00043583          	ld	a1,0(s0)
    80004620:	02843503          	ld	a0,40(s0)
    80004624:	e69fe0ef          	jal	8000348c <walk_lookup>
    80004628:	00050863          	beqz	a0,80004638 <swap_out_page+0xac>
    8000462c:	00053783          	ld	a5,0(a0)
    80004630:	0017f713          	and	a4,a5,1
    80004634:	08071063          	bnez	a4,800046b4 <swap_out_page+0x128>
    80004638:	ffe4f793          	and	a5,s1,-2
    8000463c:	0027e793          	or	a5,a5,2
    80004640:	02091913          	sll	s2,s2,0x20
    80004644:	02079793          	sll	a5,a5,0x20
    80004648:	00843503          	ld	a0,8(s0)
    8000464c:	02095913          	srl	s2,s2,0x20
    80004650:	00f96933          	or	s2,s2,a5
    80004654:	01243823          	sd	s2,16(s0)
    80004658:	d4dfe0ef          	jal	800033a4 <free_page>
    8000465c:	01843783          	ld	a5,24(s0)
    80004660:	00043423          	sd	zero,8(s0)
    80004664:	02043703          	ld	a4,32(s0)
    80004668:	06078463          	beqz	a5,800046d0 <swap_out_page+0x144>
    8000466c:	02e7b023          	sd	a4,32(a5)
    80004670:	06070663          	beqz	a4,800046dc <swap_out_page+0x150>
    80004674:	00f73c23          	sd	a5,24(a4)
    80004678:	00410717          	auipc	a4,0x410
    8000467c:	a1870713          	add	a4,a4,-1512 # 80414090 <lru_mgr+0x3000>
    80004680:	01072783          	lw	a5,16(a4)
    80004684:	02043023          	sd	zero,32(s0)
    80004688:	00043c23          	sd	zero,24(s0)
    8000468c:	fff7879b          	addw	a5,a5,-1
    80004690:	00f72823          	sw	a5,16(a4)
    80004694:	00000513          	li	a0,0
    80004698:	02813083          	ld	ra,40(sp)
    8000469c:	02013403          	ld	s0,32(sp)
    800046a0:	01813483          	ld	s1,24(sp)
    800046a4:	01013903          	ld	s2,16(sp)
    800046a8:	00813983          	ld	s3,8(sp)
    800046ac:	03010113          	add	sp,sp,48
    800046b0:	00008067          	ret
    800046b4:	00a9171b          	sllw	a4,s2,0xa
    800046b8:	02071713          	sll	a4,a4,0x20
    800046bc:	ffe7f793          	and	a5,a5,-2
    800046c0:	02075713          	srl	a4,a4,0x20
    800046c4:	00e7e7b3          	or	a5,a5,a4
    800046c8:	00f53023          	sd	a5,0(a0)
    800046cc:	f6dff06f          	j	80004638 <swap_out_page+0xac>
    800046d0:	0040d697          	auipc	a3,0x40d
    800046d4:	9ce6b023          	sd	a4,-1600(a3) # 80411090 <lru_mgr>
    800046d8:	f8071ee3          	bnez	a4,80004674 <swap_out_page+0xe8>
    800046dc:	0040d717          	auipc	a4,0x40d
    800046e0:	9af73e23          	sd	a5,-1604(a4) # 80411098 <lru_mgr+0x8>
    800046e4:	f95ff06f          	j	80004678 <swap_out_page+0xec>
    800046e8:	fff00513          	li	a0,-1
    800046ec:	fadff06f          	j	80004698 <swap_out_page+0x10c>
    800046f0:	fff00513          	li	a0,-1
    800046f4:	00008067          	ret

00000000800046f8 <swap_in_page>:
    800046f8:	12050263          	beqz	a0,8000481c <swap_in_page+0x124>
    800046fc:	01452783          	lw	a5,20(a0)
    80004700:	fe010113          	add	sp,sp,-32
    80004704:	00813823          	sd	s0,16(sp)
    80004708:	00113c23          	sd	ra,24(sp)
    8000470c:	00913423          	sd	s1,8(sp)
    80004710:	0027f793          	and	a5,a5,2
    80004714:	00050413          	mv	s0,a0
    80004718:	0e078e63          	beqz	a5,80004814 <swap_in_page+0x11c>
    8000471c:	01052703          	lw	a4,16(a0)
    80004720:	0000d797          	auipc	a5,0xd
    80004724:	97078793          	add	a5,a5,-1680 # 80011090 <swap_area>
    80004728:	40f58633          	sub	a2,a1,a5
    8000472c:	00c7171b          	sllw	a4,a4,0xc
    80004730:	02071713          	sll	a4,a4,0x20
    80004734:	02075713          	srl	a4,a4,0x20
    80004738:	0000e817          	auipc	a6,0xe
    8000473c:	95880813          	add	a6,a6,-1704 # 80012090 <swap_area+0x1000>
    80004740:	00058493          	mv	s1,a1
    80004744:	00f707b3          	add	a5,a4,a5
    80004748:	00e80833          	add	a6,a6,a4
    8000474c:	40e60633          	sub	a2,a2,a4
    80004750:	0007c683          	lbu	a3,0(a5)
    80004754:	00f60733          	add	a4,a2,a5
    80004758:	00178793          	add	a5,a5,1
    8000475c:	00d70023          	sb	a3,0(a4)
    80004760:	ff0798e3          	bne	a5,a6,80004750 <swap_in_page+0x58>
    80004764:	00043583          	ld	a1,0(s0)
    80004768:	02843503          	ld	a0,40(s0)
    8000476c:	d21fe0ef          	jal	8000348c <walk_lookup>
    80004770:	02050063          	beqz	a0,80004790 <swap_in_page+0x98>
    80004774:	00053703          	ld	a4,0(a0)
    80004778:	00c4d793          	srl	a5,s1,0xc
    8000477c:	00a79793          	sll	a5,a5,0xa
    80004780:	01e77713          	and	a4,a4,30
    80004784:	00e7e7b3          	or	a5,a5,a4
    80004788:	0017e793          	or	a5,a5,1
    8000478c:	00f53023          	sd	a5,0(a0)
    80004790:	01442783          	lw	a5,20(s0)
    80004794:	01042503          	lw	a0,16(s0)
    80004798:	00943423          	sd	s1,8(s0)
    8000479c:	ffd7f793          	and	a5,a5,-3
    800047a0:	0017e793          	or	a5,a5,1
    800047a4:	00f42a23          	sw	a5,20(s0)
    800047a8:	0000d797          	auipc	a5,0xd
    800047ac:	8dc7a783          	lw	a5,-1828(a5) # 80011084 <swap_mgr+0x84>
    800047b0:	00f57463          	bgeu	a0,a5,800047b8 <swap_in_page+0xc0>
    800047b4:	d4dfe0ef          	jal	80003500 <free_swap_slot.part.0>
    800047b8:	0040d717          	auipc	a4,0x40d
    800047bc:	8d870713          	add	a4,a4,-1832 # 80411090 <lru_mgr>
    800047c0:	00073783          	ld	a5,0(a4)
    800047c4:	fff00693          	li	a3,-1
    800047c8:	00d42823          	sw	a3,16(s0)
    800047cc:	02f43023          	sd	a5,32(s0)
    800047d0:	00043c23          	sd	zero,24(s0)
    800047d4:	02078c63          	beqz	a5,8000480c <swap_in_page+0x114>
    800047d8:	0087bc23          	sd	s0,24(a5)
    800047dc:	00410697          	auipc	a3,0x410
    800047e0:	8b468693          	add	a3,a3,-1868 # 80414090 <lru_mgr+0x3000>
    800047e4:	0106a783          	lw	a5,16(a3)
    800047e8:	00873023          	sd	s0,0(a4)
    800047ec:	00000513          	li	a0,0
    800047f0:	0017879b          	addw	a5,a5,1
    800047f4:	00f6a823          	sw	a5,16(a3)
    800047f8:	01813083          	ld	ra,24(sp)
    800047fc:	01013403          	ld	s0,16(sp)
    80004800:	00813483          	ld	s1,8(sp)
    80004804:	02010113          	add	sp,sp,32
    80004808:	00008067          	ret
    8000480c:	00873423          	sd	s0,8(a4)
    80004810:	fcdff06f          	j	800047dc <swap_in_page+0xe4>
    80004814:	fff00513          	li	a0,-1
    80004818:	fe1ff06f          	j	800047f8 <swap_in_page+0x100>
    8000481c:	fff00513          	li	a0,-1
    80004820:	00008067          	ret

0000000080004824 <handle_page_fault>:
    80004824:	fd010113          	add	sp,sp,-48
    80004828:	fffff7b7          	lui	a5,0xfffff
    8000482c:	02813023          	sd	s0,32(sp)
    80004830:	00f5f433          	and	s0,a1,a5
    80004834:	00040593          	mv	a1,s0
    80004838:	01213823          	sd	s2,16(sp)
    8000483c:	02113423          	sd	ra,40(sp)
    80004840:	00913c23          	sd	s1,24(sp)
    80004844:	01313423          	sd	s3,8(sp)
    80004848:	00050913          	mv	s2,a0
    8000484c:	c41fe0ef          	jal	8000348c <walk_lookup>
    80004850:	12050c63          	beqz	a0,80004988 <handle_page_fault+0x164>
    80004854:	00053483          	ld	s1,0(a0)
    80004858:	0014f793          	and	a5,s1,1
    8000485c:	12079663          	bnez	a5,80004988 <handle_page_fault+0x164>
    80004860:	12048463          	beqz	s1,80004988 <handle_page_fault+0x164>
    80004864:	00a4d493          	srl	s1,s1,0xa
    80004868:	b21fe0ef          	jal	80003388 <alloc_page>
    8000486c:	0004849b          	sext.w	s1,s1
    80004870:	00050993          	mv	s3,a0
    80004874:	0e050a63          	beqz	a0,80004968 <handle_page_fault+0x144>
    80004878:	0040d797          	auipc	a5,0x40d
    8000487c:	82878793          	add	a5,a5,-2008 # 804110a0 <lru_mgr+0x10>
    80004880:	00000713          	li	a4,0
    80004884:	10000613          	li	a2,256
    80004888:	0100006f          	j	80004898 <handle_page_fault+0x74>
    8000488c:	0017071b          	addw	a4,a4,1
    80004890:	03078793          	add	a5,a5,48
    80004894:	06c70063          	beq	a4,a2,800048f4 <handle_page_fault+0xd0>
    80004898:	0007b683          	ld	a3,0(a5)
    8000489c:	fe8698e3          	bne	a3,s0,8000488c <handle_page_fault+0x68>
    800048a0:	0147a683          	lw	a3,20(a5)
    800048a4:	0026f693          	and	a3,a3,2
    800048a8:	fe0682e3          	beqz	a3,8000488c <handle_page_fault+0x68>
    800048ac:	0107a683          	lw	a3,16(a5)
    800048b0:	fc969ee3          	bne	a3,s1,8000488c <handle_page_fault+0x68>
    800048b4:	00171513          	sll	a0,a4,0x1
    800048b8:	00e50533          	add	a0,a0,a4
    800048bc:	00451513          	sll	a0,a0,0x4
    800048c0:	0040c797          	auipc	a5,0x40c
    800048c4:	7e078793          	add	a5,a5,2016 # 804110a0 <lru_mgr+0x10>
    800048c8:	00f50533          	add	a0,a0,a5
    800048cc:	00098593          	mv	a1,s3
    800048d0:	e29ff0ef          	jal	800046f8 <swap_in_page>
    800048d4:	0a051e63          	bnez	a0,80004990 <handle_page_fault+0x16c>
    800048d8:	02813083          	ld	ra,40(sp)
    800048dc:	02013403          	ld	s0,32(sp)
    800048e0:	01813483          	ld	s1,24(sp)
    800048e4:	01013903          	ld	s2,16(sp)
    800048e8:	00813983          	ld	s3,8(sp)
    800048ec:	03010113          	add	sp,sp,48
    800048f0:	00008067          	ret
    800048f4:	0040c717          	auipc	a4,0x40c
    800048f8:	7c070713          	add	a4,a4,1984 # 804110b4 <lru_mgr+0x24>
    800048fc:	00000793          	li	a5,0
    80004900:	10000613          	li	a2,256
    80004904:	00c0006f          	j	80004910 <handle_page_fault+0xec>
    80004908:	0017879b          	addw	a5,a5,1
    8000490c:	08c78263          	beq	a5,a2,80004990 <handle_page_fault+0x16c>
    80004910:	00072683          	lw	a3,0(a4)
    80004914:	03070713          	add	a4,a4,48
    80004918:	fe0698e3          	bnez	a3,80004908 <handle_page_fault+0xe4>
    8000491c:	00178613          	add	a2,a5,1
    80004920:	00179713          	sll	a4,a5,0x1
    80004924:	00161693          	sll	a3,a2,0x1
    80004928:	00f707b3          	add	a5,a4,a5
    8000492c:	00479793          	sll	a5,a5,0x4
    80004930:	00c68733          	add	a4,a3,a2
    80004934:	0040c617          	auipc	a2,0x40c
    80004938:	75c60613          	add	a2,a2,1884 # 80411090 <lru_mgr>
    8000493c:	00f606b3          	add	a3,a2,a5
    80004940:	00471713          	sll	a4,a4,0x4
    80004944:	01078793          	add	a5,a5,16
    80004948:	00e60733          	add	a4,a2,a4
    8000494c:	00c78533          	add	a0,a5,a2
    80004950:	00200793          	li	a5,2
    80004954:	0086b823          	sd	s0,16(a3)
    80004958:	01273423          	sd	s2,8(a4)
    8000495c:	0296a023          	sw	s1,32(a3)
    80004960:	02f6a223          	sw	a5,36(a3)
    80004964:	f69ff06f          	j	800048cc <handle_page_fault+0xa8>
    80004968:	0040c517          	auipc	a0,0x40c
    8000496c:	73053503          	ld	a0,1840(a0) # 80411098 <lru_mgr+0x8>
    80004970:	00050c63          	beqz	a0,80004988 <handle_page_fault+0x164>
    80004974:	c19ff0ef          	jal	8000458c <swap_out_page>
    80004978:	00051863          	bnez	a0,80004988 <handle_page_fault+0x164>
    8000497c:	a0dfe0ef          	jal	80003388 <alloc_page>
    80004980:	00050993          	mv	s3,a0
    80004984:	ee051ae3          	bnez	a0,80004878 <handle_page_fault+0x54>
    80004988:	fff00513          	li	a0,-1
    8000498c:	f4dff06f          	j	800048d8 <handle_page_fault+0xb4>
    80004990:	00098513          	mv	a0,s3
    80004994:	a11fe0ef          	jal	800033a4 <free_page>
    80004998:	fff00513          	li	a0,-1
    8000499c:	f3dff06f          	j	800048d8 <handle_page_fault+0xb4>

00000000800049a0 <va2pa_with_replacement>:
    800049a0:	fe010113          	add	sp,sp,-32
    800049a4:	00913423          	sd	s1,8(sp)
    800049a8:	01213023          	sd	s2,0(sp)
    800049ac:	00113c23          	sd	ra,24(sp)
    800049b0:	00813823          	sd	s0,16(sp)
    800049b4:	00050493          	mv	s1,a0
    800049b8:	00058913          	mv	s2,a1
    800049bc:	ad1fe0ef          	jal	8000348c <walk_lookup>
    800049c0:	00050a63          	beqz	a0,800049d4 <va2pa_with_replacement+0x34>
    800049c4:	00053403          	ld	s0,0(a0)
    800049c8:	00147793          	and	a5,s0,1
    800049cc:	06079663          	bnez	a5,80004a38 <va2pa_with_replacement+0x98>
    800049d0:	02041063          	bnez	s0,800049f0 <va2pa_with_replacement+0x50>
    800049d4:	00000513          	li	a0,0
    800049d8:	01813083          	ld	ra,24(sp)
    800049dc:	01013403          	ld	s0,16(sp)
    800049e0:	00813483          	ld	s1,8(sp)
    800049e4:	00013903          	ld	s2,0(sp)
    800049e8:	02010113          	add	sp,sp,32
    800049ec:	00008067          	ret
    800049f0:	00600613          	li	a2,6
    800049f4:	00090593          	mv	a1,s2
    800049f8:	00048513          	mv	a0,s1
    800049fc:	e29ff0ef          	jal	80004824 <handle_page_fault>
    80004a00:	fc051ae3          	bnez	a0,800049d4 <va2pa_with_replacement+0x34>
    80004a04:	00090593          	mv	a1,s2
    80004a08:	00048513          	mv	a0,s1
    80004a0c:	a81fe0ef          	jal	8000348c <walk_lookup>
    80004a10:	fc0502e3          	beqz	a0,800049d4 <va2pa_with_replacement+0x34>
    80004a14:	00053783          	ld	a5,0(a0)
    80004a18:	0017f713          	and	a4,a5,1
    80004a1c:	fa070ce3          	beqz	a4,800049d4 <va2pa_with_replacement+0x34>
    80004a20:	00a7d793          	srl	a5,a5,0xa
    80004a24:	03491593          	sll	a1,s2,0x34
    80004a28:	00c79513          	sll	a0,a5,0xc
    80004a2c:	0345d593          	srl	a1,a1,0x34
    80004a30:	00b50533          	add	a0,a0,a1
    80004a34:	fa5ff06f          	j	800049d8 <va2pa_with_replacement+0x38>
    80004a38:	00090513          	mv	a0,s2
    80004a3c:	a51ff0ef          	jal	8000448c <lru_touch_page>
    80004a40:	01813083          	ld	ra,24(sp)
    80004a44:	00a45513          	srl	a0,s0,0xa
    80004a48:	01013403          	ld	s0,16(sp)
    80004a4c:	03491593          	sll	a1,s2,0x34
    80004a50:	00c51513          	sll	a0,a0,0xc
    80004a54:	0345d593          	srl	a1,a1,0x34
    80004a58:	00813483          	ld	s1,8(sp)
    80004a5c:	00013903          	ld	s2,0(sp)
    80004a60:	00b50533          	add	a0,a0,a1
    80004a64:	02010113          	add	sp,sp,32
    80004a68:	00008067          	ret

0000000080004a6c <safe_copyout>:
    80004a6c:	14068063          	beqz	a3,80004bac <safe_copyout+0x140>
    80004a70:	fb010113          	add	sp,sp,-80
    80004a74:	02913c23          	sd	s1,56(sp)
    80004a78:	03213823          	sd	s2,48(sp)
    80004a7c:	03313423          	sd	s3,40(sp)
    80004a80:	03413023          	sd	s4,32(sp)
    80004a84:	01513c23          	sd	s5,24(sp)
    80004a88:	01613823          	sd	s6,16(sp)
    80004a8c:	01713423          	sd	s7,8(sp)
    80004a90:	01813023          	sd	s8,0(sp)
    80004a94:	04113423          	sd	ra,72(sp)
    80004a98:	04813023          	sd	s0,64(sp)
    80004a9c:	00068b13          	mv	s6,a3
    80004aa0:	00050993          	mv	s3,a0
    80004aa4:	00058c13          	mv	s8,a1
    80004aa8:	00060b93          	mv	s7,a2
    80004aac:	fffffa37          	lui	s4,0xfffff
    80004ab0:	00001937          	lui	s2,0x1
    80004ab4:	10000493          	li	s1,256
    80004ab8:	0040ca97          	auipc	s5,0x40c
    80004abc:	5d8a8a93          	add	s5,s5,1496 # 80411090 <lru_mgr>
    80004ac0:	014c7433          	and	s0,s8,s4
    80004ac4:	00040593          	mv	a1,s0
    80004ac8:	00098513          	mv	a0,s3
    80004acc:	ed5ff0ef          	jal	800049a0 <va2pa_with_replacement>
    80004ad0:	0c050a63          	beqz	a0,80004ba4 <safe_copyout+0x138>
    80004ad4:	41840833          	sub	a6,s0,s8
    80004ad8:	01280833          	add	a6,a6,s2
    80004adc:	010b7463          	bgeu	s6,a6,80004ae4 <safe_copyout+0x78>
    80004ae0:	000b0813          	mv	a6,s6
    80004ae4:	01850733          	add	a4,a0,s8
    80004ae8:	40870733          	sub	a4,a4,s0
    80004aec:	01780533          	add	a0,a6,s7
    80004af0:	000b8793          	mv	a5,s7
    80004af4:	41770733          	sub	a4,a4,s7
    80004af8:	0a080263          	beqz	a6,80004b9c <safe_copyout+0x130>
    80004afc:	0007c583          	lbu	a1,0(a5)
    80004b00:	00f70633          	add	a2,a4,a5
    80004b04:	00178793          	add	a5,a5,1
    80004b08:	00b60023          	sb	a1,0(a2)
    80004b0c:	fef518e3          	bne	a0,a5,80004afc <safe_copyout+0x90>
    80004b10:	0040c797          	auipc	a5,0x40c
    80004b14:	59078793          	add	a5,a5,1424 # 804110a0 <lru_mgr+0x10>
    80004b18:	00000713          	li	a4,0
    80004b1c:	0100006f          	j	80004b2c <safe_copyout+0xc0>
    80004b20:	0017071b          	addw	a4,a4,1
    80004b24:	03078793          	add	a5,a5,48
    80004b28:	02970863          	beq	a4,s1,80004b58 <safe_copyout+0xec>
    80004b2c:	0007b603          	ld	a2,0(a5)
    80004b30:	fec418e3          	bne	s0,a2,80004b20 <safe_copyout+0xb4>
    80004b34:	0147a603          	lw	a2,20(a5)
    80004b38:	00167593          	and	a1,a2,1
    80004b3c:	fe0582e3          	beqz	a1,80004b20 <safe_copyout+0xb4>
    80004b40:	00171793          	sll	a5,a4,0x1
    80004b44:	00e787b3          	add	a5,a5,a4
    80004b48:	00479793          	sll	a5,a5,0x4
    80004b4c:	00fa87b3          	add	a5,s5,a5
    80004b50:	00466613          	or	a2,a2,4
    80004b54:	02c7a223          	sw	a2,36(a5)
    80004b58:	410b0b33          	sub	s6,s6,a6
    80004b5c:	00050b93          	mv	s7,a0
    80004b60:	01240c33          	add	s8,s0,s2
    80004b64:	f40b1ee3          	bnez	s6,80004ac0 <safe_copyout+0x54>
    80004b68:	00000513          	li	a0,0
    80004b6c:	04813083          	ld	ra,72(sp)
    80004b70:	04013403          	ld	s0,64(sp)
    80004b74:	03813483          	ld	s1,56(sp)
    80004b78:	03013903          	ld	s2,48(sp)
    80004b7c:	02813983          	ld	s3,40(sp)
    80004b80:	02013a03          	ld	s4,32(sp)
    80004b84:	01813a83          	ld	s5,24(sp)
    80004b88:	01013b03          	ld	s6,16(sp)
    80004b8c:	00813b83          	ld	s7,8(sp)
    80004b90:	00013c03          	ld	s8,0(sp)
    80004b94:	05010113          	add	sp,sp,80
    80004b98:	00008067          	ret
    80004b9c:	000b8513          	mv	a0,s7
    80004ba0:	f71ff06f          	j	80004b10 <safe_copyout+0xa4>
    80004ba4:	fff00513          	li	a0,-1
    80004ba8:	fc5ff06f          	j	80004b6c <safe_copyout+0x100>
    80004bac:	00000513          	li	a0,0
    80004bb0:	00008067          	ret

0000000080004bb4 <safe_copyin>:
    80004bb4:	0e068863          	beqz	a3,80004ca4 <safe_copyin+0xf0>
    80004bb8:	fc010113          	add	sp,sp,-64
    80004bbc:	02813823          	sd	s0,48(sp)
    80004bc0:	02913423          	sd	s1,40(sp)
    80004bc4:	03213023          	sd	s2,32(sp)
    80004bc8:	01313c23          	sd	s3,24(sp)
    80004bcc:	01513423          	sd	s5,8(sp)
    80004bd0:	01613023          	sd	s6,0(sp)
    80004bd4:	02113c23          	sd	ra,56(sp)
    80004bd8:	01413823          	sd	s4,16(sp)
    80004bdc:	00068b13          	mv	s6,a3
    80004be0:	00050493          	mv	s1,a0
    80004be4:	00058993          	mv	s3,a1
    80004be8:	00060a93          	mv	s5,a2
    80004bec:	fffff937          	lui	s2,0xfffff
    80004bf0:	00001437          	lui	s0,0x1
    80004bf4:	012afa33          	and	s4,s5,s2
    80004bf8:	000a0593          	mv	a1,s4
    80004bfc:	00048513          	mv	a0,s1
    80004c00:	da1ff0ef          	jal	800049a0 <va2pa_with_replacement>
    80004c04:	08050c63          	beqz	a0,80004c9c <safe_copyin+0xe8>
    80004c08:	415a08b3          	sub	a7,s4,s5
    80004c0c:	008888b3          	add	a7,a7,s0
    80004c10:	011b7463          	bgeu	s6,a7,80004c18 <safe_copyin+0x64>
    80004c14:	000b0893          	mv	a7,s6
    80004c18:	01550533          	add	a0,a0,s5
    80004c1c:	41450533          	sub	a0,a0,s4
    80004c20:	06088063          	beqz	a7,80004c80 <safe_copyin+0xcc>
    80004c24:	00098793          	mv	a5,s3
    80004c28:	01198833          	add	a6,s3,a7
    80004c2c:	41350733          	sub	a4,a0,s3
    80004c30:	00f70633          	add	a2,a4,a5
    80004c34:	00064603          	lbu	a2,0(a2)
    80004c38:	00178793          	add	a5,a5,1
    80004c3c:	fec78fa3          	sb	a2,-1(a5)
    80004c40:	fef818e3          	bne	a6,a5,80004c30 <safe_copyin+0x7c>
    80004c44:	411b0b33          	sub	s6,s6,a7
    80004c48:	00080993          	mv	s3,a6
    80004c4c:	008a0ab3          	add	s5,s4,s0
    80004c50:	fa0b12e3          	bnez	s6,80004bf4 <safe_copyin+0x40>
    80004c54:	00000513          	li	a0,0
    80004c58:	03813083          	ld	ra,56(sp)
    80004c5c:	03013403          	ld	s0,48(sp)
    80004c60:	02813483          	ld	s1,40(sp)
    80004c64:	02013903          	ld	s2,32(sp)
    80004c68:	01813983          	ld	s3,24(sp)
    80004c6c:	01013a03          	ld	s4,16(sp)
    80004c70:	00813a83          	ld	s5,8(sp)
    80004c74:	00013b03          	ld	s6,0(sp)
    80004c78:	04010113          	add	sp,sp,64
    80004c7c:	00008067          	ret
    80004c80:	00001ab7          	lui	s5,0x1
    80004c84:	015a0ab3          	add	s5,s4,s5
    80004c88:	012afa33          	and	s4,s5,s2
    80004c8c:	000a0593          	mv	a1,s4
    80004c90:	00048513          	mv	a0,s1
    80004c94:	d0dff0ef          	jal	800049a0 <va2pa_with_replacement>
    80004c98:	f60518e3          	bnez	a0,80004c08 <safe_copyin+0x54>
    80004c9c:	fff00513          	li	a0,-1
    80004ca0:	fb9ff06f          	j	80004c58 <safe_copyin+0xa4>
    80004ca4:	00000513          	li	a0,0
    80004ca8:	00008067          	ret

0000000080004cac <test_page_replacement>:
    80004cac:	f4010113          	add	sp,sp,-192
    80004cb0:	00007517          	auipc	a0,0x7
    80004cb4:	2c050513          	add	a0,a0,704 # 8000bf70 <digits+0x68>
    80004cb8:	0a113c23          	sd	ra,184(sp)
    80004cbc:	0a813823          	sd	s0,176(sp)
    80004cc0:	0a913423          	sd	s1,168(sp)
    80004cc4:	0b213023          	sd	s2,160(sp)
    80004cc8:	09313c23          	sd	s3,152(sp)
    80004ccc:	e10fe0ef          	jal	800032dc <uart_puts>
    80004cd0:	00007517          	auipc	a0,0x7
    80004cd4:	2c850513          	add	a0,a0,712 # 8000bf98 <digits+0x90>
    80004cd8:	e04fe0ef          	jal	800032dc <uart_puts>
    80004cdc:	d18ff0ef          	jal	800041f4 <alloc_swap_slot>
    80004ce0:	0005049b          	sext.w	s1,a0
    80004ce4:	d10ff0ef          	jal	800041f4 <alloc_swap_slot>
    80004ce8:	0005041b          	sext.w	s0,a0
    80004cec:	d08ff0ef          	jal	800041f4 <alloc_swap_slot>
    80004cf0:	fff00793          	li	a5,-1
    80004cf4:	02f48663          	beq	s1,a5,80004d20 <test_page_replacement+0x74>
    80004cf8:	1cf40c63          	beq	s0,a5,80004ed0 <test_page_replacement+0x224>
    80004cfc:	0005051b          	sext.w	a0,a0
    80004d00:	02f50063          	beq	a0,a5,80004d20 <test_page_replacement+0x74>
    80004d04:	00848e63          	beq	s1,s0,80004d20 <test_page_replacement+0x74>
    80004d08:	00a40c63          	beq	s0,a0,80004d20 <test_page_replacement+0x74>
    80004d0c:	00a48a63          	beq	s1,a0,80004d20 <test_page_replacement+0x74>
    80004d10:	00007517          	auipc	a0,0x7
    80004d14:	2b050513          	add	a0,a0,688 # 8000bfc0 <digits+0xb8>
    80004d18:	dc4fe0ef          	jal	800032dc <uart_puts>
    80004d1c:	0100006f          	j	80004d2c <test_page_replacement+0x80>
    80004d20:	00007517          	auipc	a0,0x7
    80004d24:	2c050513          	add	a0,a0,704 # 8000bfe0 <digits+0xd8>
    80004d28:	db4fe0ef          	jal	800032dc <uart_puts>
    80004d2c:	0000c797          	auipc	a5,0xc
    80004d30:	3587a783          	lw	a5,856(a5) # 80011084 <swap_mgr+0x84>
    80004d34:	00f47663          	bgeu	s0,a5,80004d40 <test_page_replacement+0x94>
    80004d38:	00040513          	mv	a0,s0
    80004d3c:	fc4fe0ef          	jal	80003500 <free_swap_slot.part.0>
    80004d40:	cb4ff0ef          	jal	800041f4 <alloc_swap_slot>
    80004d44:	0005051b          	sext.w	a0,a0
    80004d48:	14a40c63          	beq	s0,a0,80004ea0 <test_page_replacement+0x1f4>
    80004d4c:	00007517          	auipc	a0,0x7
    80004d50:	2dc50513          	add	a0,a0,732 # 8000c028 <digits+0x120>
    80004d54:	d88fe0ef          	jal	800032dc <uart_puts>
    80004d58:	00007517          	auipc	a0,0x7
    80004d5c:	2f850513          	add	a0,a0,760 # 8000c050 <digits+0x148>
    80004d60:	d7cfe0ef          	jal	800032dc <uart_puts>
    80004d64:	00080737          	lui	a4,0x80
    80004d68:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    80004d6c:	00010637          	lui	a2,0x10
    80004d70:	00c71713          	sll	a4,a4,0xc
    80004d74:	fff00793          	li	a5,-1
    80004d78:	01f7d793          	srl	a5,a5,0x1f
    80004d7c:	00c13023          	sd	a2,0(sp)
    80004d80:	02e13c23          	sd	a4,56(sp)
    80004d84:	00100613          	li	a2,1
    80004d88:	00012737          	lui	a4,0x12
    80004d8c:	01f61613          	sll	a2,a2,0x1f
    80004d90:	00f13823          	sd	a5,16(sp)
    80004d94:	04f13023          	sd	a5,64(sp)
    80004d98:	06e13023          	sd	a4,96(sp)
    80004d9c:	06f13823          	sd	a5,112(sp)
    80004da0:	40001737          	lui	a4,0x40001
    80004da4:	03010793          	add	a5,sp,48
    80004da8:	00422697          	auipc	a3,0x422
    80004dac:	6906b683          	ld	a3,1680(a3) # 80427438 <kernel_pagetable>
    80004db0:	00171713          	sll	a4,a4,0x1
    80004db4:	0040c417          	auipc	s0,0x40c
    80004db8:	2dc40413          	add	s0,s0,732 # 80411090 <lru_mgr>
    80004dbc:	00010493          	mv	s1,sp
    80004dc0:	06010993          	add	s3,sp,96
    80004dc4:	00c13423          	sd	a2,8(sp)
    80004dc8:	00f13c23          	sd	a5,24(sp)
    80004dcc:	00011637          	lui	a2,0x11
    80004dd0:	08f13023          	sd	a5,128(sp)
    80004dd4:	0040f917          	auipc	s2,0x40f
    80004dd8:	2bc90913          	add	s2,s2,700 # 80414090 <lru_mgr+0x3000>
    80004ddc:	00300793          	li	a5,3
    80004de0:	00007517          	auipc	a0,0x7
    80004de4:	29050513          	add	a0,a0,656 # 8000c070 <digits+0x168>
    80004de8:	06e13423          	sd	a4,104(sp)
    80004dec:	00f92823          	sw	a5,16(s2)
    80004df0:	02013023          	sd	zero,32(sp)
    80004df4:	02d13423          	sd	a3,40(sp)
    80004df8:	02c13823          	sd	a2,48(sp)
    80004dfc:	04d13c23          	sd	a3,88(sp)
    80004e00:	06013c23          	sd	zero,120(sp)
    80004e04:	08d13423          	sd	a3,136(sp)
    80004e08:	00943423          	sd	s1,8(s0)
    80004e0c:	04913823          	sd	s1,80(sp)
    80004e10:	05313423          	sd	s3,72(sp)
    80004e14:	01343023          	sd	s3,0(s0)
    80004e18:	cc4fe0ef          	jal	800032dc <uart_puts>
    80004e1c:	04813783          	ld	a5,72(sp)
    80004e20:	05013703          	ld	a4,80(sp)
    80004e24:	08078a63          	beqz	a5,80004eb8 <test_page_replacement+0x20c>
    80004e28:	02e7b023          	sd	a4,32(a5)
    80004e2c:	08070263          	beqz	a4,80004eb0 <test_page_replacement+0x204>
    80004e30:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    80004e34:	01092783          	lw	a5,16(s2)
    80004e38:	04013823          	sd	zero,80(sp)
    80004e3c:	04013423          	sd	zero,72(sp)
    80004e40:	fff7871b          	addw	a4,a5,-1
    80004e44:	00e92823          	sw	a4,16(s2)
    80004e48:	00200793          	li	a5,2
    80004e4c:	00f71663          	bne	a4,a5,80004e58 <test_page_replacement+0x1ac>
    80004e50:	00043783          	ld	a5,0(s0)
    80004e54:	09378663          	beq	a5,s3,80004ee0 <test_page_replacement+0x234>
    80004e58:	00007517          	auipc	a0,0x7
    80004e5c:	25850513          	add	a0,a0,600 # 8000c0b0 <digits+0x1a8>
    80004e60:	c7cfe0ef          	jal	800032dc <uart_puts>
    80004e64:	00843783          	ld	a5,8(s0)
    80004e68:	04978c63          	beq	a5,s1,80004ec0 <test_page_replacement+0x214>
    80004e6c:	00007517          	auipc	a0,0x7
    80004e70:	28450513          	add	a0,a0,644 # 8000c0f0 <digits+0x1e8>
    80004e74:	c68fe0ef          	jal	800032dc <uart_puts>
    80004e78:	00007517          	auipc	a0,0x7
    80004e7c:	29850513          	add	a0,a0,664 # 8000c110 <digits+0x208>
    80004e80:	c5cfe0ef          	jal	800032dc <uart_puts>
    80004e84:	0b813083          	ld	ra,184(sp)
    80004e88:	0b013403          	ld	s0,176(sp)
    80004e8c:	0a813483          	ld	s1,168(sp)
    80004e90:	0a013903          	ld	s2,160(sp)
    80004e94:	09813983          	ld	s3,152(sp)
    80004e98:	0c010113          	add	sp,sp,192
    80004e9c:	00008067          	ret
    80004ea0:	00007517          	auipc	a0,0x7
    80004ea4:	16050513          	add	a0,a0,352 # 8000c000 <digits+0xf8>
    80004ea8:	c34fe0ef          	jal	800032dc <uart_puts>
    80004eac:	eadff06f          	j	80004d58 <test_page_replacement+0xac>
    80004eb0:	00f43423          	sd	a5,8(s0)
    80004eb4:	f81ff06f          	j	80004e34 <test_page_replacement+0x188>
    80004eb8:	00e43023          	sd	a4,0(s0)
    80004ebc:	f71ff06f          	j	80004e2c <test_page_replacement+0x180>
    80004ec0:	00007517          	auipc	a0,0x7
    80004ec4:	21050513          	add	a0,a0,528 # 8000c0d0 <digits+0x1c8>
    80004ec8:	c14fe0ef          	jal	800032dc <uart_puts>
    80004ecc:	fadff06f          	j	80004e78 <test_page_replacement+0x1cc>
    80004ed0:	00007517          	auipc	a0,0x7
    80004ed4:	11050513          	add	a0,a0,272 # 8000bfe0 <digits+0xd8>
    80004ed8:	c04fe0ef          	jal	800032dc <uart_puts>
    80004edc:	e65ff06f          	j	80004d40 <test_page_replacement+0x94>
    80004ee0:	00843783          	ld	a5,8(s0)
    80004ee4:	f6979ae3          	bne	a5,s1,80004e58 <test_page_replacement+0x1ac>
    80004ee8:	00007517          	auipc	a0,0x7
    80004eec:	1a850513          	add	a0,a0,424 # 8000c090 <digits+0x188>
    80004ef0:	becfe0ef          	jal	800032dc <uart_puts>
    80004ef4:	f71ff06f          	j	80004e64 <test_page_replacement+0x1b8>

0000000080004ef8 <walkaddr>:
    80004ef8:	fff00793          	li	a5,-1
    80004efc:	0197d793          	srl	a5,a5,0x19
    80004f00:	04b7e463          	bltu	a5,a1,80004f48 <walkaddr+0x50>
    80004f04:	ff010113          	add	sp,sp,-16
    80004f08:	00113423          	sd	ra,8(sp)
    80004f0c:	d80fe0ef          	jal	8000348c <walk_lookup>
    80004f10:	04050063          	beqz	a0,80004f50 <walkaddr+0x58>
    80004f14:	00053783          	ld	a5,0(a0)
    80004f18:	01100713          	li	a4,17
    80004f1c:	00000513          	li	a0,0
    80004f20:	0117f693          	and	a3,a5,17
    80004f24:	00e68863          	beq	a3,a4,80004f34 <walkaddr+0x3c>
    80004f28:	00813083          	ld	ra,8(sp)
    80004f2c:	01010113          	add	sp,sp,16
    80004f30:	00008067          	ret
    80004f34:	00813083          	ld	ra,8(sp)
    80004f38:	00a7d793          	srl	a5,a5,0xa
    80004f3c:	00c79513          	sll	a0,a5,0xc
    80004f40:	01010113          	add	sp,sp,16
    80004f44:	00008067          	ret
    80004f48:	00000513          	li	a0,0
    80004f4c:	00008067          	ret
    80004f50:	00813083          	ld	ra,8(sp)
    80004f54:	00000513          	li	a0,0
    80004f58:	01010113          	add	sp,sp,16
    80004f5c:	00008067          	ret

0000000080004f60 <copyin>:
    80004f60:	10068863          	beqz	a3,80005070 <copyin+0x110>
    80004f64:	fb010113          	add	sp,sp,-80
    80004f68:	02913c23          	sd	s1,56(sp)
    80004f6c:	01513c23          	sd	s5,24(sp)
    80004f70:	fff00493          	li	s1,-1
    80004f74:	fffffab7          	lui	s5,0xfffff
    80004f78:	04813023          	sd	s0,64(sp)
    80004f7c:	04113423          	sd	ra,72(sp)
    80004f80:	03213823          	sd	s2,48(sp)
    80004f84:	03313423          	sd	s3,40(sp)
    80004f88:	03413023          	sd	s4,32(sp)
    80004f8c:	01613823          	sd	s6,16(sp)
    80004f90:	01713423          	sd	s7,8(sp)
    80004f94:	01567ab3          	and	s5,a2,s5
    80004f98:	0194d493          	srl	s1,s1,0x19
    80004f9c:	00060413          	mv	s0,a2
    80004fa0:	0354ea63          	bltu	s1,s5,80004fd4 <copyin+0x74>
    80004fa4:	00068b13          	mv	s6,a3
    80004fa8:	00050913          	mv	s2,a0
    80004fac:	00058b93          	mv	s7,a1
    80004fb0:	01100a13          	li	s4,17
    80004fb4:	000019b7          	lui	s3,0x1
    80004fb8:	000a8593          	mv	a1,s5
    80004fbc:	00090513          	mv	a0,s2
    80004fc0:	cccfe0ef          	jal	8000348c <walk_lookup>
    80004fc4:	00050863          	beqz	a0,80004fd4 <copyin+0x74>
    80004fc8:	00053783          	ld	a5,0(a0)
    80004fcc:	0117f713          	and	a4,a5,17
    80004fd0:	03470a63          	beq	a4,s4,80005004 <copyin+0xa4>
    80004fd4:	fff00513          	li	a0,-1
    80004fd8:	04813083          	ld	ra,72(sp)
    80004fdc:	04013403          	ld	s0,64(sp)
    80004fe0:	03813483          	ld	s1,56(sp)
    80004fe4:	03013903          	ld	s2,48(sp)
    80004fe8:	02813983          	ld	s3,40(sp)
    80004fec:	02013a03          	ld	s4,32(sp)
    80004ff0:	01813a83          	ld	s5,24(sp)
    80004ff4:	01013b03          	ld	s6,16(sp)
    80004ff8:	00813b83          	ld	s7,8(sp)
    80004ffc:	05010113          	add	sp,sp,80
    80005000:	00008067          	ret
    80005004:	00a7d793          	srl	a5,a5,0xa
    80005008:	00c79793          	sll	a5,a5,0xc
    8000500c:	fc0784e3          	beqz	a5,80004fd4 <copyin+0x74>
    80005010:	013a85b3          	add	a1,s5,s3
    80005014:	408586b3          	sub	a3,a1,s0
    80005018:	00db7463          	bgeu	s6,a3,80005020 <copyin+0xc0>
    8000501c:	000b0693          	mv	a3,s6
    80005020:	41540733          	sub	a4,s0,s5
    80005024:	00f70733          	add	a4,a4,a5
    80005028:	01768833          	add	a6,a3,s7
    8000502c:	000b8793          	mv	a5,s7
    80005030:	41770733          	sub	a4,a4,s7
    80005034:	02068263          	beqz	a3,80005058 <copyin+0xf8>
    80005038:	00f70633          	add	a2,a4,a5
    8000503c:	00064603          	lbu	a2,0(a2) # 11000 <_entry-0x7ffef000>
    80005040:	00178793          	add	a5,a5,1
    80005044:	fec78fa3          	sb	a2,-1(a5)
    80005048:	fef818e3          	bne	a6,a5,80005038 <copyin+0xd8>
    8000504c:	40db0b33          	sub	s6,s6,a3
    80005050:	00080b93          	mv	s7,a6
    80005054:	000b0a63          	beqz	s6,80005068 <copyin+0x108>
    80005058:	f6b4eee3          	bltu	s1,a1,80004fd4 <copyin+0x74>
    8000505c:	00058a93          	mv	s5,a1
    80005060:	00058413          	mv	s0,a1
    80005064:	f55ff06f          	j	80004fb8 <copyin+0x58>
    80005068:	00000513          	li	a0,0
    8000506c:	f6dff06f          	j	80004fd8 <copyin+0x78>
    80005070:	00000513          	li	a0,0
    80005074:	00008067          	ret

0000000080005078 <copyout>:
    80005078:	10068863          	beqz	a3,80005188 <copyout+0x110>
    8000507c:	fb010113          	add	sp,sp,-80
    80005080:	02913c23          	sd	s1,56(sp)
    80005084:	01513c23          	sd	s5,24(sp)
    80005088:	fff00493          	li	s1,-1
    8000508c:	fffffab7          	lui	s5,0xfffff
    80005090:	04813023          	sd	s0,64(sp)
    80005094:	04113423          	sd	ra,72(sp)
    80005098:	03213823          	sd	s2,48(sp)
    8000509c:	03313423          	sd	s3,40(sp)
    800050a0:	03413023          	sd	s4,32(sp)
    800050a4:	01613823          	sd	s6,16(sp)
    800050a8:	01713423          	sd	s7,8(sp)
    800050ac:	0155fab3          	and	s5,a1,s5
    800050b0:	0194d493          	srl	s1,s1,0x19
    800050b4:	00058413          	mv	s0,a1
    800050b8:	0354ea63          	bltu	s1,s5,800050ec <copyout+0x74>
    800050bc:	00068b13          	mv	s6,a3
    800050c0:	00050913          	mv	s2,a0
    800050c4:	00060b93          	mv	s7,a2
    800050c8:	01100a13          	li	s4,17
    800050cc:	000019b7          	lui	s3,0x1
    800050d0:	000a8593          	mv	a1,s5
    800050d4:	00090513          	mv	a0,s2
    800050d8:	bb4fe0ef          	jal	8000348c <walk_lookup>
    800050dc:	00050863          	beqz	a0,800050ec <copyout+0x74>
    800050e0:	00053783          	ld	a5,0(a0)
    800050e4:	0117f713          	and	a4,a5,17
    800050e8:	03470a63          	beq	a4,s4,8000511c <copyout+0xa4>
    800050ec:	fff00513          	li	a0,-1
    800050f0:	04813083          	ld	ra,72(sp)
    800050f4:	04013403          	ld	s0,64(sp)
    800050f8:	03813483          	ld	s1,56(sp)
    800050fc:	03013903          	ld	s2,48(sp)
    80005100:	02813983          	ld	s3,40(sp)
    80005104:	02013a03          	ld	s4,32(sp)
    80005108:	01813a83          	ld	s5,24(sp)
    8000510c:	01013b03          	ld	s6,16(sp)
    80005110:	00813b83          	ld	s7,8(sp)
    80005114:	05010113          	add	sp,sp,80
    80005118:	00008067          	ret
    8000511c:	00a7d793          	srl	a5,a5,0xa
    80005120:	00c79793          	sll	a5,a5,0xc
    80005124:	fc0784e3          	beqz	a5,800050ec <copyout+0x74>
    80005128:	013a8533          	add	a0,s5,s3
    8000512c:	408506b3          	sub	a3,a0,s0
    80005130:	00db7463          	bgeu	s6,a3,80005138 <copyout+0xc0>
    80005134:	000b0693          	mv	a3,s6
    80005138:	41540733          	sub	a4,s0,s5
    8000513c:	00f70733          	add	a4,a4,a5
    80005140:	01768833          	add	a6,a3,s7
    80005144:	000b8793          	mv	a5,s7
    80005148:	41770733          	sub	a4,a4,s7
    8000514c:	02068263          	beqz	a3,80005170 <copyout+0xf8>
    80005150:	0007c583          	lbu	a1,0(a5)
    80005154:	00f70633          	add	a2,a4,a5
    80005158:	00178793          	add	a5,a5,1
    8000515c:	00b60023          	sb	a1,0(a2)
    80005160:	fef818e3          	bne	a6,a5,80005150 <copyout+0xd8>
    80005164:	40db0b33          	sub	s6,s6,a3
    80005168:	00080b93          	mv	s7,a6
    8000516c:	000b0a63          	beqz	s6,80005180 <copyout+0x108>
    80005170:	f6a4eee3          	bltu	s1,a0,800050ec <copyout+0x74>
    80005174:	00050a93          	mv	s5,a0
    80005178:	00050413          	mv	s0,a0
    8000517c:	f55ff06f          	j	800050d0 <copyout+0x58>
    80005180:	00000513          	li	a0,0
    80005184:	f6dff06f          	j	800050f0 <copyout+0x78>
    80005188:	00000513          	li	a0,0
    8000518c:	00008067          	ret

0000000080005190 <uvmunmap>:
    80005190:	03459793          	sll	a5,a1,0x34
    80005194:	00079463          	bnez	a5,8000519c <uvmunmap+0xc>
    80005198:	bbcfe06f          	j	80003554 <uvmunmap.part.0>
    8000519c:	00008067          	ret

00000000800051a0 <uvmdealloc>:
    800051a0:	06b67863          	bgeu	a2,a1,80005210 <uvmdealloc+0x70>
    800051a4:	000017b7          	lui	a5,0x1
    800051a8:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800051ac:	ff010113          	add	sp,sp,-16
    800051b0:	fffff6b7          	lui	a3,0xfffff
    800051b4:	00f60733          	add	a4,a2,a5
    800051b8:	00f587b3          	add	a5,a1,a5
    800051bc:	00813023          	sd	s0,0(sp)
    800051c0:	00113423          	sd	ra,8(sp)
    800051c4:	00d775b3          	and	a1,a4,a3
    800051c8:	00d7f7b3          	and	a5,a5,a3
    800051cc:	00060413          	mv	s0,a2
    800051d0:	00f5ec63          	bltu	a1,a5,800051e8 <uvmdealloc+0x48>
    800051d4:	00813083          	ld	ra,8(sp)
    800051d8:	00040513          	mv	a0,s0
    800051dc:	00013403          	ld	s0,0(sp)
    800051e0:	01010113          	add	sp,sp,16
    800051e4:	00008067          	ret
    800051e8:	40b787b3          	sub	a5,a5,a1
    800051ec:	00c7d793          	srl	a5,a5,0xc
    800051f0:	00100693          	li	a3,1
    800051f4:	0007861b          	sext.w	a2,a5
    800051f8:	b5cfe0ef          	jal	80003554 <uvmunmap.part.0>
    800051fc:	00813083          	ld	ra,8(sp)
    80005200:	00040513          	mv	a0,s0
    80005204:	00013403          	ld	s0,0(sp)
    80005208:	01010113          	add	sp,sp,16
    8000520c:	00008067          	ret
    80005210:	00058513          	mv	a0,a1
    80005214:	00008067          	ret

0000000080005218 <uvmalloc>:
    80005218:	0eb66463          	bltu	a2,a1,80005300 <uvmalloc+0xe8>
    8000521c:	00001737          	lui	a4,0x1
    80005220:	fff70713          	add	a4,a4,-1 # fff <_entry-0x7ffff001>
    80005224:	fc010113          	add	sp,sp,-64
    80005228:	00e587b3          	add	a5,a1,a4
    8000522c:	fffff737          	lui	a4,0xfffff
    80005230:	02913423          	sd	s1,40(sp)
    80005234:	03213023          	sd	s2,32(sp)
    80005238:	01313c23          	sd	s3,24(sp)
    8000523c:	01413823          	sd	s4,16(sp)
    80005240:	01513423          	sd	s5,8(sp)
    80005244:	00e7f933          	and	s2,a5,a4
    80005248:	02113c23          	sd	ra,56(sp)
    8000524c:	02813823          	sd	s0,48(sp)
    80005250:	00060a93          	mv	s5,a2
    80005254:	00050a13          	mv	s4,a0
    80005258:	00090493          	mv	s1,s2
    8000525c:	000019b7          	lui	s3,0x1
    80005260:	04c97263          	bgeu	s2,a2,800052a4 <uvmalloc+0x8c>
    80005264:	924fe0ef          	jal	80003388 <alloc_page>
    80005268:	00050413          	mv	s0,a0
    8000526c:	06050463          	beqz	a0,800052d4 <uvmalloc+0xbc>
    80005270:	01350733          	add	a4,a0,s3
    80005274:	00050793          	mv	a5,a0
    80005278:	00078023          	sb	zero,0(a5)
    8000527c:	00178793          	add	a5,a5,1
    80005280:	fef71ce3          	bne	a4,a5,80005278 <uvmalloc+0x60>
    80005284:	01e00693          	li	a3,30
    80005288:	00040613          	mv	a2,s0
    8000528c:	00048593          	mv	a1,s1
    80005290:	000a0513          	mv	a0,s4
    80005294:	b9cfe0ef          	jal	80003630 <map_page>
    80005298:	02051a63          	bnez	a0,800052cc <uvmalloc+0xb4>
    8000529c:	013484b3          	add	s1,s1,s3
    800052a0:	fd54e2e3          	bltu	s1,s5,80005264 <uvmalloc+0x4c>
    800052a4:	000a8513          	mv	a0,s5
    800052a8:	03813083          	ld	ra,56(sp)
    800052ac:	03013403          	ld	s0,48(sp)
    800052b0:	02813483          	ld	s1,40(sp)
    800052b4:	02013903          	ld	s2,32(sp)
    800052b8:	01813983          	ld	s3,24(sp)
    800052bc:	01013a03          	ld	s4,16(sp)
    800052c0:	00813a83          	ld	s5,8(sp)
    800052c4:	04010113          	add	sp,sp,64
    800052c8:	00008067          	ret
    800052cc:	00040513          	mv	a0,s0
    800052d0:	8d4fe0ef          	jal	800033a4 <free_page>
    800052d4:	02997263          	bgeu	s2,s1,800052f8 <uvmalloc+0xe0>
    800052d8:	000017b7          	lui	a5,0x1
    800052dc:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800052e0:	fffff737          	lui	a4,0xfffff
    800052e4:	00f905b3          	add	a1,s2,a5
    800052e8:	00f487b3          	add	a5,s1,a5
    800052ec:	00e5f5b3          	and	a1,a1,a4
    800052f0:	00e7f7b3          	and	a5,a5,a4
    800052f4:	00f5ea63          	bltu	a1,a5,80005308 <uvmalloc+0xf0>
    800052f8:	00000513          	li	a0,0
    800052fc:	fadff06f          	j	800052a8 <uvmalloc+0x90>
    80005300:	00058513          	mv	a0,a1
    80005304:	00008067          	ret
    80005308:	40b787b3          	sub	a5,a5,a1
    8000530c:	00c7d613          	srl	a2,a5,0xc
    80005310:	000a0513          	mv	a0,s4
    80005314:	00100693          	li	a3,1
    80005318:	0006061b          	sext.w	a2,a2
    8000531c:	a38fe0ef          	jal	80003554 <uvmunmap.part.0>
    80005320:	00000513          	li	a0,0
    80005324:	f85ff06f          	j	800052a8 <uvmalloc+0x90>

0000000080005328 <freewalk>:
    80005328:	f0010113          	add	sp,sp,-256
    8000532c:	000017b7          	lui	a5,0x1
    80005330:	0e813823          	sd	s0,240(sp)
    80005334:	0f213023          	sd	s2,224(sp)
    80005338:	0d613023          	sd	s6,192(sp)
    8000533c:	0b713c23          	sd	s7,184(sp)
    80005340:	0e113c23          	sd	ra,248(sp)
    80005344:	0e913423          	sd	s1,232(sp)
    80005348:	0d313c23          	sd	s3,216(sp)
    8000534c:	0d413823          	sd	s4,208(sp)
    80005350:	0d513423          	sd	s5,200(sp)
    80005354:	0b813823          	sd	s8,176(sp)
    80005358:	0b913423          	sd	s9,168(sp)
    8000535c:	0ba13023          	sd	s10,160(sp)
    80005360:	09b13c23          	sd	s11,152(sp)
    80005364:	00050413          	mv	s0,a0
    80005368:	00050913          	mv	s2,a0
    8000536c:	00f50b33          	add	s6,a0,a5
    80005370:	00001bb7          	lui	s7,0x1
    80005374:	00c0006f          	j	80005380 <freewalk+0x58>
    80005378:	00890913          	add	s2,s2,8
    8000537c:	2f690e63          	beq	s2,s6,80005678 <freewalk+0x350>
    80005380:	00093783          	ld	a5,0(s2)
    80005384:	00100713          	li	a4,1
    80005388:	00f7f693          	and	a3,a5,15
    8000538c:	fee696e3          	bne	a3,a4,80005378 <freewalk+0x50>
    80005390:	00a7d793          	srl	a5,a5,0xa
    80005394:	00c79a13          	sll	s4,a5,0xc
    80005398:	017a0cb3          	add	s9,s4,s7
    8000539c:	00100d93          	li	s11,1
    800053a0:	000a0a93          	mv	s5,s4
    800053a4:	00040493          	mv	s1,s0
    800053a8:	00c0006f          	j	800053b4 <freewalk+0x8c>
    800053ac:	008a0a13          	add	s4,s4,8 # fffffffffffff008 <bss_end+0xffffffff7fbd7b98>
    800053b0:	2b9a0863          	beq	s4,s9,80005660 <freewalk+0x338>
    800053b4:	000a3783          	ld	a5,0(s4)
    800053b8:	00f7f713          	and	a4,a5,15
    800053bc:	ffb718e3          	bne	a4,s11,800053ac <freewalk+0x84>
    800053c0:	00a7d793          	srl	a5,a5,0xa
    800053c4:	00c79993          	sll	s3,a5,0xc
    800053c8:	00098c13          	mv	s8,s3
    800053cc:	01798d33          	add	s10,s3,s7
    800053d0:	00098413          	mv	s0,s3
    800053d4:	00c0006f          	j	800053e0 <freewalk+0xb8>
    800053d8:	00840413          	add	s0,s0,8
    800053dc:	27a40863          	beq	s0,s10,8000564c <freewalk+0x324>
    800053e0:	00043783          	ld	a5,0(s0)
    800053e4:	00f7f713          	and	a4,a5,15
    800053e8:	ffb718e3          	bne	a4,s11,800053d8 <freewalk+0xb0>
    800053ec:	00a7d793          	srl	a5,a5,0xa
    800053f0:	00c79793          	sll	a5,a5,0xc
    800053f4:	00048713          	mv	a4,s1
    800053f8:	03513823          	sd	s5,48(sp)
    800053fc:	00090493          	mv	s1,s2
    80005400:	017789b3          	add	s3,a5,s7
    80005404:	00078a93          	mv	s5,a5
    80005408:	00070913          	mv	s2,a4
    8000540c:	00c0006f          	j	80005418 <freewalk+0xf0>
    80005410:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80005414:	20f98a63          	beq	s3,a5,80005628 <freewalk+0x300>
    80005418:	0007b703          	ld	a4,0(a5)
    8000541c:	00f77693          	and	a3,a4,15
    80005420:	ffb698e3          	bne	a3,s11,80005410 <freewalk+0xe8>
    80005424:	00a75713          	srl	a4,a4,0xa
    80005428:	00c71713          	sll	a4,a4,0xc
    8000542c:	017706b3          	add	a3,a4,s7
    80005430:	05313023          	sd	s3,64(sp)
    80005434:	00d13423          	sd	a3,8(sp)
    80005438:	02813c23          	sd	s0,56(sp)
    8000543c:	04f13423          	sd	a5,72(sp)
    80005440:	00070993          	mv	s3,a4
    80005444:	0100006f          	j	80005454 <freewalk+0x12c>
    80005448:	00813783          	ld	a5,8(sp)
    8000544c:	00870713          	add	a4,a4,8 # fffffffffffff008 <bss_end+0xffffffff7fbd7b98>
    80005450:	1ae78863          	beq	a5,a4,80005600 <freewalk+0x2d8>
    80005454:	00073783          	ld	a5,0(a4)
    80005458:	00f7f693          	and	a3,a5,15
    8000545c:	ffb696e3          	bne	a3,s11,80005448 <freewalk+0x120>
    80005460:	00a7d793          	srl	a5,a5,0xa
    80005464:	00c79793          	sll	a5,a5,0xc
    80005468:	017786b3          	add	a3,a5,s7
    8000546c:	05813823          	sd	s8,80(sp)
    80005470:	00d13c23          	sd	a3,24(sp)
    80005474:	000a8c13          	mv	s8,s5
    80005478:	04e13c23          	sd	a4,88(sp)
    8000547c:	00078a93          	mv	s5,a5
    80005480:	07213023          	sd	s2,96(sp)
    80005484:	0100006f          	j	80005494 <freewalk+0x16c>
    80005488:	01813703          	ld	a4,24(sp)
    8000548c:	00878793          	add	a5,a5,8
    80005490:	14f70063          	beq	a4,a5,800055d0 <freewalk+0x2a8>
    80005494:	0007b703          	ld	a4,0(a5)
    80005498:	00f77693          	and	a3,a4,15
    8000549c:	ffb696e3          	bne	a3,s11,80005488 <freewalk+0x160>
    800054a0:	00a75713          	srl	a4,a4,0xa
    800054a4:	00c71913          	sll	s2,a4,0xc
    800054a8:	01790733          	add	a4,s2,s7
    800054ac:	07213423          	sd	s2,104(sp)
    800054b0:	00090413          	mv	s0,s2
    800054b4:	02e13023          	sd	a4,32(sp)
    800054b8:	06f13823          	sd	a5,112(sp)
    800054bc:	00048913          	mv	s2,s1
    800054c0:	0100006f          	j	800054d0 <freewalk+0x1a8>
    800054c4:	02013783          	ld	a5,32(sp)
    800054c8:	00840413          	add	s0,s0,8
    800054cc:	0c878e63          	beq	a5,s0,800055a8 <freewalk+0x280>
    800054d0:	00043783          	ld	a5,0(s0)
    800054d4:	00f7f693          	and	a3,a5,15
    800054d8:	ffb696e3          	bne	a3,s11,800054c4 <freewalk+0x19c>
    800054dc:	00a7d793          	srl	a5,a5,0xa
    800054e0:	00c79493          	sll	s1,a5,0xc
    800054e4:	017487b3          	add	a5,s1,s7
    800054e8:	00913823          	sd	s1,16(sp)
    800054ec:	02f13423          	sd	a5,40(sp)
    800054f0:	06813c23          	sd	s0,120(sp)
    800054f4:	0100006f          	j	80005504 <freewalk+0x1dc>
    800054f8:	02813783          	ld	a5,40(sp)
    800054fc:	00848493          	add	s1,s1,8
    80005500:	08978663          	beq	a5,s1,8000558c <freewalk+0x264>
    80005504:	0004b783          	ld	a5,0(s1)
    80005508:	00f7f693          	and	a3,a5,15
    8000550c:	ffb696e3          	bne	a3,s11,800054f8 <freewalk+0x1d0>
    80005510:	00a7d793          	srl	a5,a5,0xa
    80005514:	00c79413          	sll	s0,a5,0xc
    80005518:	017406b3          	add	a3,s0,s7
    8000551c:	09213023          	sd	s2,128(sp)
    80005520:	09613423          	sd	s6,136(sp)
    80005524:	00040913          	mv	s2,s0
    80005528:	000a0b13          	mv	s6,s4
    8000552c:	00048a13          	mv	s4,s1
    80005530:	00068493          	mv	s1,a3
    80005534:	00c0006f          	j	80005540 <freewalk+0x218>
    80005538:	00840413          	add	s0,s0,8
    8000553c:	02848463          	beq	s1,s0,80005564 <freewalk+0x23c>
    80005540:	00043783          	ld	a5,0(s0)
    80005544:	00f7f713          	and	a4,a5,15
    80005548:	ffb718e3          	bne	a4,s11,80005538 <freewalk+0x210>
    8000554c:	00a7d793          	srl	a5,a5,0xa
    80005550:	00c79513          	sll	a0,a5,0xc
    80005554:	dd5ff0ef          	jal	80005328 <freewalk>
    80005558:	00840413          	add	s0,s0,8
    8000555c:	fe043c23          	sd	zero,-8(s0)
    80005560:	fe8490e3          	bne	s1,s0,80005540 <freewalk+0x218>
    80005564:	00090513          	mv	a0,s2
    80005568:	000a0493          	mv	s1,s4
    8000556c:	08013903          	ld	s2,128(sp)
    80005570:	000b0a13          	mv	s4,s6
    80005574:	08813b03          	ld	s6,136(sp)
    80005578:	e2dfd0ef          	jal	800033a4 <free_page>
    8000557c:	02813783          	ld	a5,40(sp)
    80005580:	0004b023          	sd	zero,0(s1)
    80005584:	00848493          	add	s1,s1,8
    80005588:	f6979ee3          	bne	a5,s1,80005504 <freewalk+0x1dc>
    8000558c:	01013503          	ld	a0,16(sp)
    80005590:	07813403          	ld	s0,120(sp)
    80005594:	e11fd0ef          	jal	800033a4 <free_page>
    80005598:	02013783          	ld	a5,32(sp)
    8000559c:	00043023          	sd	zero,0(s0)
    800055a0:	00840413          	add	s0,s0,8
    800055a4:	f28796e3          	bne	a5,s0,800054d0 <freewalk+0x1a8>
    800055a8:	07013783          	ld	a5,112(sp)
    800055ac:	06813503          	ld	a0,104(sp)
    800055b0:	00090493          	mv	s1,s2
    800055b4:	00f13823          	sd	a5,16(sp)
    800055b8:	dedfd0ef          	jal	800033a4 <free_page>
    800055bc:	01013783          	ld	a5,16(sp)
    800055c0:	01813703          	ld	a4,24(sp)
    800055c4:	0007b023          	sd	zero,0(a5)
    800055c8:	00878793          	add	a5,a5,8
    800055cc:	ecf714e3          	bne	a4,a5,80005494 <freewalk+0x16c>
    800055d0:	05813703          	ld	a4,88(sp)
    800055d4:	000a8513          	mv	a0,s5
    800055d8:	06013903          	ld	s2,96(sp)
    800055dc:	00e13823          	sd	a4,16(sp)
    800055e0:	000c0a93          	mv	s5,s8
    800055e4:	05013c03          	ld	s8,80(sp)
    800055e8:	dbdfd0ef          	jal	800033a4 <free_page>
    800055ec:	01013703          	ld	a4,16(sp)
    800055f0:	00813783          	ld	a5,8(sp)
    800055f4:	00073023          	sd	zero,0(a4)
    800055f8:	00870713          	add	a4,a4,8
    800055fc:	e4e79ce3          	bne	a5,a4,80005454 <freewalk+0x12c>
    80005600:	04813783          	ld	a5,72(sp)
    80005604:	00098513          	mv	a0,s3
    80005608:	03813403          	ld	s0,56(sp)
    8000560c:	00f13423          	sd	a5,8(sp)
    80005610:	04013983          	ld	s3,64(sp)
    80005614:	d91fd0ef          	jal	800033a4 <free_page>
    80005618:	00813783          	ld	a5,8(sp)
    8000561c:	0007b023          	sd	zero,0(a5)
    80005620:	00878793          	add	a5,a5,8
    80005624:	def99ae3          	bne	s3,a5,80005418 <freewalk+0xf0>
    80005628:	00090793          	mv	a5,s2
    8000562c:	000a8513          	mv	a0,s5
    80005630:	00048913          	mv	s2,s1
    80005634:	03013a83          	ld	s5,48(sp)
    80005638:	00078493          	mv	s1,a5
    8000563c:	00840413          	add	s0,s0,8
    80005640:	d65fd0ef          	jal	800033a4 <free_page>
    80005644:	fe043c23          	sd	zero,-8(s0)
    80005648:	d9a41ce3          	bne	s0,s10,800053e0 <freewalk+0xb8>
    8000564c:	000c0513          	mv	a0,s8
    80005650:	d55fd0ef          	jal	800033a4 <free_page>
    80005654:	008a0a13          	add	s4,s4,8
    80005658:	fe0a3c23          	sd	zero,-8(s4)
    8000565c:	d59a1ce3          	bne	s4,s9,800053b4 <freewalk+0x8c>
    80005660:	000a8513          	mv	a0,s5
    80005664:	d41fd0ef          	jal	800033a4 <free_page>
    80005668:	00890913          	add	s2,s2,8
    8000566c:	fe093c23          	sd	zero,-8(s2)
    80005670:	00048413          	mv	s0,s1
    80005674:	d16916e3          	bne	s2,s6,80005380 <freewalk+0x58>
    80005678:	00040513          	mv	a0,s0
    8000567c:	0f013403          	ld	s0,240(sp)
    80005680:	0f813083          	ld	ra,248(sp)
    80005684:	0e813483          	ld	s1,232(sp)
    80005688:	0e013903          	ld	s2,224(sp)
    8000568c:	0d813983          	ld	s3,216(sp)
    80005690:	0d013a03          	ld	s4,208(sp)
    80005694:	0c813a83          	ld	s5,200(sp)
    80005698:	0c013b03          	ld	s6,192(sp)
    8000569c:	0b813b83          	ld	s7,184(sp)
    800056a0:	0b013c03          	ld	s8,176(sp)
    800056a4:	0a813c83          	ld	s9,168(sp)
    800056a8:	0a013d03          	ld	s10,160(sp)
    800056ac:	09813d83          	ld	s11,152(sp)
    800056b0:	10010113          	add	sp,sp,256
    800056b4:	cf1fd06f          	j	800033a4 <free_page>

00000000800056b8 <uvmfree>:
    800056b8:	00059463          	bnez	a1,800056c0 <uvmfree+0x8>
    800056bc:	00008067          	ret
    800056c0:	000017b7          	lui	a5,0x1
    800056c4:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800056c8:	00f585b3          	add	a1,a1,a5
    800056cc:	00c5d613          	srl	a2,a1,0xc
    800056d0:	00100693          	li	a3,1
    800056d4:	00000593          	li	a1,0
    800056d8:	e7dfd06f          	j	80003554 <uvmunmap.part.0>

00000000800056dc <proc_pagetable>:
    800056dc:	ff010113          	add	sp,sp,-16
    800056e0:	00113423          	sd	ra,8(sp)
    800056e4:	02050863          	beqz	a0,80005714 <proc_pagetable+0x38>
    800056e8:	ca1fd0ef          	jal	80003388 <alloc_page>
    800056ec:	00001737          	lui	a4,0x1
    800056f0:	00050793          	mv	a5,a0
    800056f4:	00e50733          	add	a4,a0,a4
    800056f8:	02050863          	beqz	a0,80005728 <proc_pagetable+0x4c>
    800056fc:	0007b023          	sd	zero,0(a5)
    80005700:	00878793          	add	a5,a5,8
    80005704:	fef71ce3          	bne	a4,a5,800056fc <proc_pagetable+0x20>
    80005708:	00813083          	ld	ra,8(sp)
    8000570c:	01010113          	add	sp,sp,16
    80005710:	00008067          	ret
    80005714:	00007517          	auipc	a0,0x7
    80005718:	a2450513          	add	a0,a0,-1500 # 8000c138 <digits+0x230>
    8000571c:	bc1fd0ef          	jal	800032dc <uart_puts>
    80005720:	00000513          	li	a0,0
    80005724:	fe5ff06f          	j	80005708 <proc_pagetable+0x2c>
    80005728:	00007517          	auipc	a0,0x7
    8000572c:	a3050513          	add	a0,a0,-1488 # 8000c158 <digits+0x250>
    80005730:	badfd0ef          	jal	800032dc <uart_puts>
    80005734:	00000513          	li	a0,0
    80005738:	fd1ff06f          	j	80005708 <proc_pagetable+0x2c>

000000008000573c <proc_freepagetable>:
    8000573c:	fd010113          	add	sp,sp,-48
    80005740:	01313423          	sd	s3,8(sp)
    80005744:	02113423          	sd	ra,40(sp)
    80005748:	02813023          	sd	s0,32(sp)
    8000574c:	00913c23          	sd	s1,24(sp)
    80005750:	01213823          	sd	s2,16(sp)
    80005754:	00050993          	mv	s3,a0
    80005758:	06059263          	bnez	a1,800057bc <proc_freepagetable+0x80>
    8000575c:	000014b7          	lui	s1,0x1
    80005760:	00098413          	mv	s0,s3
    80005764:	009984b3          	add	s1,s3,s1
    80005768:	00100913          	li	s2,1
    8000576c:	00c0006f          	j	80005778 <proc_freepagetable+0x3c>
    80005770:	00840413          	add	s0,s0,8
    80005774:	02940463          	beq	s0,s1,8000579c <proc_freepagetable+0x60>
    80005778:	00043503          	ld	a0,0(s0)
    8000577c:	00f57793          	and	a5,a0,15
    80005780:	ff2798e3          	bne	a5,s2,80005770 <proc_freepagetable+0x34>
    80005784:	00a55513          	srl	a0,a0,0xa
    80005788:	00c51513          	sll	a0,a0,0xc
    8000578c:	b9dff0ef          	jal	80005328 <freewalk>
    80005790:	00840413          	add	s0,s0,8
    80005794:	fe043c23          	sd	zero,-8(s0)
    80005798:	fe9410e3          	bne	s0,s1,80005778 <proc_freepagetable+0x3c>
    8000579c:	02013403          	ld	s0,32(sp)
    800057a0:	02813083          	ld	ra,40(sp)
    800057a4:	01813483          	ld	s1,24(sp)
    800057a8:	01013903          	ld	s2,16(sp)
    800057ac:	00098513          	mv	a0,s3
    800057b0:	00813983          	ld	s3,8(sp)
    800057b4:	03010113          	add	sp,sp,48
    800057b8:	bedfd06f          	j	800033a4 <free_page>
    800057bc:	000017b7          	lui	a5,0x1
    800057c0:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800057c4:	00f58633          	add	a2,a1,a5
    800057c8:	00100693          	li	a3,1
    800057cc:	00c65613          	srl	a2,a2,0xc
    800057d0:	00000593          	li	a1,0
    800057d4:	d81fd0ef          	jal	80003554 <uvmunmap.part.0>
    800057d8:	f85ff06f          	j	8000575c <proc_freepagetable+0x20>

00000000800057dc <uvmcopy>:
    800057dc:	10060463          	beqz	a2,800058e4 <uvmcopy+0x108>
    800057e0:	fb010113          	add	sp,sp,-80
    800057e4:	02913c23          	sd	s1,56(sp)
    800057e8:	03213823          	sd	s2,48(sp)
    800057ec:	03313423          	sd	s3,40(sp)
    800057f0:	03413023          	sd	s4,32(sp)
    800057f4:	01513c23          	sd	s5,24(sp)
    800057f8:	04113423          	sd	ra,72(sp)
    800057fc:	04813023          	sd	s0,64(sp)
    80005800:	01613823          	sd	s6,16(sp)
    80005804:	01713423          	sd	s7,8(sp)
    80005808:	00060a13          	mv	s4,a2
    8000580c:	00050a93          	mv	s5,a0
    80005810:	00058993          	mv	s3,a1
    80005814:	00000493          	li	s1,0
    80005818:	00001937          	lui	s2,0x1
    8000581c:	00048593          	mv	a1,s1
    80005820:	000a8513          	mv	a0,s5
    80005824:	c69fd0ef          	jal	8000348c <walk_lookup>
    80005828:	06050c63          	beqz	a0,800058a0 <uvmcopy+0xc4>
    8000582c:	00053b83          	ld	s7,0(a0)
    80005830:	001bf793          	and	a5,s7,1
    80005834:	06078663          	beqz	a5,800058a0 <uvmcopy+0xc4>
    80005838:	00abd593          	srl	a1,s7,0xa
    8000583c:	00c59413          	sll	s0,a1,0xc
    80005840:	b49fd0ef          	jal	80003388 <alloc_page>
    80005844:	3ffbfb93          	and	s7,s7,1023
    80005848:	00050b13          	mv	s6,a0
    8000584c:	04050a63          	beqz	a0,800058a0 <uvmcopy+0xc4>
    80005850:	01250833          	add	a6,a0,s2
    80005854:	00050793          	mv	a5,a0
    80005858:	40a405b3          	sub	a1,s0,a0
    8000585c:	00f58733          	add	a4,a1,a5
    80005860:	00074703          	lbu	a4,0(a4) # 1000 <_entry-0x7ffff000>
    80005864:	00178793          	add	a5,a5,1
    80005868:	fee78fa3          	sb	a4,-1(a5)
    8000586c:	ff0798e3          	bne	a5,a6,8000585c <uvmcopy+0x80>
    80005870:	000b8693          	mv	a3,s7
    80005874:	000b0613          	mv	a2,s6
    80005878:	00048593          	mv	a1,s1
    8000587c:	00098513          	mv	a0,s3
    80005880:	db1fd0ef          	jal	80003630 <map_page>
    80005884:	00051a63          	bnez	a0,80005898 <uvmcopy+0xbc>
    80005888:	012484b3          	add	s1,s1,s2
    8000588c:	f944e8e3          	bltu	s1,s4,8000581c <uvmcopy+0x40>
    80005890:	00000513          	li	a0,0
    80005894:	0240006f          	j	800058b8 <uvmcopy+0xdc>
    80005898:	000b0513          	mv	a0,s6
    8000589c:	b09fd0ef          	jal	800033a4 <free_page>
    800058a0:	00098513          	mv	a0,s3
    800058a4:	00100693          	li	a3,1
    800058a8:	00c4d613          	srl	a2,s1,0xc
    800058ac:	00000593          	li	a1,0
    800058b0:	ca5fd0ef          	jal	80003554 <uvmunmap.part.0>
    800058b4:	fff00513          	li	a0,-1
    800058b8:	04813083          	ld	ra,72(sp)
    800058bc:	04013403          	ld	s0,64(sp)
    800058c0:	03813483          	ld	s1,56(sp)
    800058c4:	03013903          	ld	s2,48(sp)
    800058c8:	02813983          	ld	s3,40(sp)
    800058cc:	02013a03          	ld	s4,32(sp)
    800058d0:	01813a83          	ld	s5,24(sp)
    800058d4:	01013b03          	ld	s6,16(sp)
    800058d8:	00813b83          	ld	s7,8(sp)
    800058dc:	05010113          	add	sp,sp,80
    800058e0:	00008067          	ret
    800058e4:	00000513          	li	a0,0
    800058e8:	00008067          	ret

00000000800058ec <copyinstr>:
    800058ec:	12068463          	beqz	a3,80005a14 <copyinstr+0x128>
    800058f0:	fb010113          	add	sp,sp,-80
    800058f4:	02913c23          	sd	s1,56(sp)
    800058f8:	01513c23          	sd	s5,24(sp)
    800058fc:	fff00493          	li	s1,-1
    80005900:	fffffab7          	lui	s5,0xfffff
    80005904:	04813023          	sd	s0,64(sp)
    80005908:	04113423          	sd	ra,72(sp)
    8000590c:	03213823          	sd	s2,48(sp)
    80005910:	03313423          	sd	s3,40(sp)
    80005914:	03413023          	sd	s4,32(sp)
    80005918:	01613823          	sd	s6,16(sp)
    8000591c:	01713423          	sd	s7,8(sp)
    80005920:	01567ab3          	and	s5,a2,s5
    80005924:	0194d493          	srl	s1,s1,0x19
    80005928:	00060413          	mv	s0,a2
    8000592c:	0354ea63          	bltu	s1,s5,80005960 <copyinstr+0x74>
    80005930:	00068b93          	mv	s7,a3
    80005934:	00050913          	mv	s2,a0
    80005938:	00058b13          	mv	s6,a1
    8000593c:	01100a13          	li	s4,17
    80005940:	000019b7          	lui	s3,0x1
    80005944:	000a8593          	mv	a1,s5
    80005948:	00090513          	mv	a0,s2
    8000594c:	b41fd0ef          	jal	8000348c <walk_lookup>
    80005950:	00050863          	beqz	a0,80005960 <copyinstr+0x74>
    80005954:	00053783          	ld	a5,0(a0)
    80005958:	0117f713          	and	a4,a5,17
    8000595c:	03470a63          	beq	a4,s4,80005990 <copyinstr+0xa4>
    80005960:	fff00513          	li	a0,-1
    80005964:	04813083          	ld	ra,72(sp)
    80005968:	04013403          	ld	s0,64(sp)
    8000596c:	03813483          	ld	s1,56(sp)
    80005970:	03013903          	ld	s2,48(sp)
    80005974:	02813983          	ld	s3,40(sp)
    80005978:	02013a03          	ld	s4,32(sp)
    8000597c:	01813a83          	ld	s5,24(sp)
    80005980:	01013b03          	ld	s6,16(sp)
    80005984:	00813b83          	ld	s7,8(sp)
    80005988:	05010113          	add	sp,sp,80
    8000598c:	00008067          	ret
    80005990:	00a7d793          	srl	a5,a5,0xa
    80005994:	00c79793          	sll	a5,a5,0xc
    80005998:	fc0784e3          	beqz	a5,80005960 <copyinstr+0x74>
    8000599c:	013a86b3          	add	a3,s5,s3
    800059a0:	40868833          	sub	a6,a3,s0
    800059a4:	010bf463          	bgeu	s7,a6,800059ac <copyinstr+0xc0>
    800059a8:	000b8813          	mv	a6,s7
    800059ac:	41540433          	sub	s0,s0,s5
    800059b0:	00f40433          	add	s0,s0,a5
    800059b4:	000b0793          	mv	a5,s6
    800059b8:	04080463          	beqz	a6,80005a00 <copyinstr+0x114>
    800059bc:	41640633          	sub	a2,s0,s6
    800059c0:	01680833          	add	a6,a6,s6
    800059c4:	0100006f          	j	800059d4 <copyinstr+0xe8>
    800059c8:	00e78023          	sb	a4,0(a5)
    800059cc:	00178793          	add	a5,a5,1
    800059d0:	03078063          	beq	a5,a6,800059f0 <copyinstr+0x104>
    800059d4:	00c78733          	add	a4,a5,a2
    800059d8:	00074703          	lbu	a4,0(a4)
    800059dc:	00078513          	mv	a0,a5
    800059e0:	fe0714e3          	bnez	a4,800059c8 <copyinstr+0xdc>
    800059e4:	00078023          	sb	zero,0(a5)
    800059e8:	00000513          	li	a0,0
    800059ec:	f79ff06f          	j	80005964 <copyinstr+0x78>
    800059f0:	fffb8713          	add	a4,s7,-1 # fff <_entry-0x7ffff001>
    800059f4:	01670733          	add	a4,a4,s6
    800059f8:	40a70bb3          	sub	s7,a4,a0
    800059fc:	f6e502e3          	beq	a0,a4,80005960 <copyinstr+0x74>
    80005a00:	f6d4e0e3          	bltu	s1,a3,80005960 <copyinstr+0x74>
    80005a04:	00068a93          	mv	s5,a3
    80005a08:	00068413          	mv	s0,a3
    80005a0c:	00078b13          	mv	s6,a5
    80005a10:	f35ff06f          	j	80005944 <copyinstr+0x58>
    80005a14:	fff00513          	li	a0,-1
    80005a18:	00008067          	ret

0000000080005a1c <handle_timer_interrupt>:
    80005a1c:	ff010113          	add	sp,sp,-16
    80005a20:	00422597          	auipc	a1,0x422
    80005a24:	a305b583          	ld	a1,-1488(a1) # 80427450 <ticks>
    80005a28:	00006517          	auipc	a0,0x6
    80005a2c:	76850513          	add	a0,a0,1896 # 8000c190 <digits+0x288>
    80005a30:	00113423          	sd	ra,8(sp)
    80005a34:	d38fd0ef          	jal	80002f6c <printf>
    80005a38:	00813083          	ld	ra,8(sp)
    80005a3c:	00100793          	li	a5,1
    80005a40:	00422717          	auipc	a4,0x422
    80005a44:	a2f72223          	sw	a5,-1500(a4) # 80427464 <need_resched>
    80005a48:	01010113          	add	sp,sp,16
    80005a4c:	00008067          	ret

0000000080005a50 <handle_external_interrupt>:
    80005a50:	00006517          	auipc	a0,0x6
    80005a54:	76850513          	add	a0,a0,1896 # 8000c1b8 <digits+0x2b0>
    80005a58:	d14fd06f          	j	80002f6c <printf>

0000000080005a5c <handle_software_interrupt>:
    80005a5c:	00006517          	auipc	a0,0x6
    80005a60:	78c50513          	add	a0,a0,1932 # 8000c1e8 <digits+0x2e0>
    80005a64:	d08fd06f          	j	80002f6c <printf>

0000000080005a68 <r_stvec>:
    80005a68:	10502573          	csrr	a0,stvec
    80005a6c:	00008067          	ret

0000000080005a70 <w_stvec>:
    80005a70:	10551073          	csrw	stvec,a0
    80005a74:	00008067          	ret

0000000080005a78 <r_sscratch>:
    80005a78:	14002573          	csrr	a0,sscratch
    80005a7c:	00008067          	ret

0000000080005a80 <w_sscratch>:
    80005a80:	14051073          	csrw	sscratch,a0
    80005a84:	00008067          	ret

0000000080005a88 <get_current_trapframe>:
    80005a88:	ff010113          	add	sp,sp,-16
    80005a8c:	00113423          	sd	ra,8(sp)
    80005a90:	65d000ef          	jal	800068ec <myproc>
    80005a94:	00050a63          	beqz	a0,80005aa8 <get_current_trapframe+0x20>
    80005a98:	00813083          	ld	ra,8(sp)
    80005a9c:	04853503          	ld	a0,72(a0)
    80005aa0:	01010113          	add	sp,sp,16
    80005aa4:	00008067          	ret
    80005aa8:	00006597          	auipc	a1,0x6
    80005aac:	77058593          	add	a1,a1,1904 # 8000c218 <digits+0x310>
    80005ab0:	00006517          	auipc	a0,0x6
    80005ab4:	79050513          	add	a0,a0,1936 # 8000c240 <digits+0x338>
    80005ab8:	cb4fd0ef          	jal	80002f6c <printf>
    80005abc:	0000006f          	j	80005abc <get_current_trapframe+0x34>

0000000080005ac0 <get_ticks>:
    80005ac0:	00422517          	auipc	a0,0x422
    80005ac4:	99053503          	ld	a0,-1648(a0) # 80427450 <ticks>
    80005ac8:	00008067          	ret

0000000080005acc <machine_timer_handler>:
    80005acc:	00422797          	auipc	a5,0x422
    80005ad0:	97c78793          	add	a5,a5,-1668 # 80427448 <m_mode_ticks>
    80005ad4:	0007b703          	ld	a4,0(a5)
    80005ad8:	ff010113          	add	sp,sp,-16
    80005adc:	00113423          	sd	ra,8(sp)
    80005ae0:	00170713          	add	a4,a4,1
    80005ae4:	00e7b023          	sd	a4,0(a5)
    80005ae8:	00422697          	auipc	a3,0x422
    80005aec:	96868693          	add	a3,a3,-1688 # 80427450 <ticks>
    80005af0:	0006b703          	ld	a4,0(a3)
    80005af4:	00006517          	auipc	a0,0x6
    80005af8:	75c50513          	add	a0,a0,1884 # 8000c250 <digits+0x348>
    80005afc:	00170713          	add	a4,a4,1
    80005b00:	00e6b023          	sd	a4,0(a3)
    80005b04:	0007b583          	ld	a1,0(a5)
    80005b08:	c64fd0ef          	jal	80002f6c <printf>
    80005b0c:	0200c7b7          	lui	a5,0x200c
    80005b10:	ff87b783          	ld	a5,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80005b14:	000f4737          	lui	a4,0xf4
    80005b18:	00813083          	ld	ra,8(sp)
    80005b1c:	24070713          	add	a4,a4,576 # f4240 <_entry-0x7ff0bdc0>
    80005b20:	00e787b3          	add	a5,a5,a4
    80005b24:	02004737          	lui	a4,0x2004
    80005b28:	00f73023          	sd	a5,0(a4) # 2004000 <_entry-0x7dffc000>
    80005b2c:	01010113          	add	sp,sp,16
    80005b30:	00008067          	ret

0000000080005b34 <alloc_trapframe>:
    80005b34:	0040e597          	auipc	a1,0x40e
    80005b38:	57458593          	add	a1,a1,1396 # 804140a8 <trapframe_used>
    80005b3c:	00058793          	mv	a5,a1
    80005b40:	00000713          	li	a4,0
    80005b44:	10000613          	li	a2,256
    80005b48:	00c0006f          	j	80005b54 <alloc_trapframe+0x20>
    80005b4c:	0017071b          	addw	a4,a4,1
    80005b50:	02c70e63          	beq	a4,a2,80005b8c <alloc_trapframe+0x58>
    80005b54:	0007a683          	lw	a3,0(a5)
    80005b58:	00478793          	add	a5,a5,4
    80005b5c:	fe0698e3          	bnez	a3,80005b4c <alloc_trapframe+0x18>
    80005b60:	00271793          	sll	a5,a4,0x2
    80005b64:	00371513          	sll	a0,a4,0x3
    80005b68:	00f585b3          	add	a1,a1,a5
    80005b6c:	00e50533          	add	a0,a0,a4
    80005b70:	00100793          	li	a5,1
    80005b74:	00f5a023          	sw	a5,0(a1)
    80005b78:	00551513          	sll	a0,a0,0x5
    80005b7c:	0040f797          	auipc	a5,0x40f
    80005b80:	9ac78793          	add	a5,a5,-1620 # 80414528 <trapframe_pool>
    80005b84:	00f50533          	add	a0,a0,a5
    80005b88:	00008067          	ret
    80005b8c:	00000513          	li	a0,0
    80005b90:	00008067          	ret

0000000080005b94 <free_trapframe>:
    80005b94:	0040f797          	auipc	a5,0x40f
    80005b98:	99478793          	add	a5,a5,-1644 # 80414528 <trapframe_pool>
    80005b9c:	02f56c63          	bltu	a0,a5,80005bd4 <free_trapframe+0x40>
    80005ba0:	00421717          	auipc	a4,0x421
    80005ba4:	98870713          	add	a4,a4,-1656 # 80426528 <cpus>
    80005ba8:	02e57663          	bgeu	a0,a4,80005bd4 <free_trapframe+0x40>
    80005bac:	40f507b3          	sub	a5,a0,a5
    80005bb0:	00007717          	auipc	a4,0x7
    80005bb4:	2d873703          	ld	a4,728(a4) # 8000ce88 <syscalls+0xd0>
    80005bb8:	4057d793          	sra	a5,a5,0x5
    80005bbc:	02e787b3          	mul	a5,a5,a4
    80005bc0:	0040e717          	auipc	a4,0x40e
    80005bc4:	4e870713          	add	a4,a4,1256 # 804140a8 <trapframe_used>
    80005bc8:	00279793          	sll	a5,a5,0x2
    80005bcc:	00f707b3          	add	a5,a4,a5
    80005bd0:	0007a023          	sw	zero,0(a5)
    80005bd4:	00008067          	ret

0000000080005bd8 <intr_on>:
    80005bd8:	100027f3          	csrr	a5,sstatus
    80005bdc:	0027e793          	or	a5,a5,2
    80005be0:	10079073          	csrw	sstatus,a5
    80005be4:	00008067          	ret

0000000080005be8 <intr_off>:
    80005be8:	100027f3          	csrr	a5,sstatus
    80005bec:	ffd7f793          	and	a5,a5,-3
    80005bf0:	10079073          	csrw	sstatus,a5
    80005bf4:	00008067          	ret

0000000080005bf8 <intr_get>:
    80005bf8:	10002573          	csrr	a0,sstatus
    80005bfc:	00155513          	srl	a0,a0,0x1
    80005c00:	00157513          	and	a0,a0,1
    80005c04:	00008067          	ret

0000000080005c08 <set_stvec>:
    80005c08:	00a585b3          	add	a1,a1,a0
    80005c0c:	10559073          	csrw	stvec,a1
    80005c10:	00008067          	ret

0000000080005c14 <trap_init>:
    80005c14:	ff010113          	add	sp,sp,-16
    80005c18:	00006517          	auipc	a0,0x6
    80005c1c:	66850513          	add	a0,a0,1640 # 8000c280 <digits+0x378>
    80005c20:	00113423          	sd	ra,8(sp)
    80005c24:	eb8fd0ef          	jal	800032dc <uart_puts>
    80005c28:	0040e617          	auipc	a2,0x40e
    80005c2c:	48060613          	add	a2,a2,1152 # 804140a8 <trapframe_used>
    80005c30:	00060793          	mv	a5,a2
    80005c34:	0040f717          	auipc	a4,0x40f
    80005c38:	87470713          	add	a4,a4,-1932 # 804144a8 <trap_handlers>
    80005c3c:	0007a023          	sw	zero,0(a5)
    80005c40:	00478793          	add	a5,a5,4
    80005c44:	fee79ce3          	bne	a5,a4,80005c3c <trap_init+0x28>
    80005c48:	0040f797          	auipc	a5,0x40f
    80005c4c:	86078793          	add	a5,a5,-1952 # 804144a8 <trap_handlers>
    80005c50:	0040f697          	auipc	a3,0x40f
    80005c54:	8d868693          	add	a3,a3,-1832 # 80414528 <trapframe_pool>
    80005c58:	00078713          	mv	a4,a5
    80005c5c:	00073023          	sd	zero,0(a4)
    80005c60:	00870713          	add	a4,a4,8
    80005c64:	fee69ce3          	bne	a3,a4,80005c5c <trap_init+0x48>
    80005c68:	00000717          	auipc	a4,0x0
    80005c6c:	db470713          	add	a4,a4,-588 # 80005a1c <handle_timer_interrupt>
    80005c70:	42e63423          	sd	a4,1064(a2)
    80005c74:	00000717          	auipc	a4,0x0
    80005c78:	ddc70713          	add	a4,a4,-548 # 80005a50 <handle_external_interrupt>
    80005c7c:	44e63423          	sd	a4,1096(a2)
    80005c80:	00000717          	auipc	a4,0x0
    80005c84:	ddc70713          	add	a4,a4,-548 # 80005a5c <handle_software_interrupt>
    80005c88:	40e63423          	sd	a4,1032(a2)
    80005c8c:	00000593          	li	a1,0
    80005c90:	0007b703          	ld	a4,0(a5)
    80005c94:	00878793          	add	a5,a5,8
    80005c98:	00070463          	beqz	a4,80005ca0 <trap_init+0x8c>
    80005c9c:	0015859b          	addw	a1,a1,1
    80005ca0:	fef698e3          	bne	a3,a5,80005c90 <trap_init+0x7c>
    80005ca4:	00006517          	auipc	a0,0x6
    80005ca8:	60450513          	add	a0,a0,1540 # 8000c2a8 <digits+0x3a0>
    80005cac:	ac0fd0ef          	jal	80002f6c <printf>
    80005cb0:	00813083          	ld	ra,8(sp)
    80005cb4:	00006517          	auipc	a0,0x6
    80005cb8:	62450513          	add	a0,a0,1572 # 8000c2d8 <digits+0x3d0>
    80005cbc:	01010113          	add	sp,sp,16
    80005cc0:	e1cfd06f          	j	800032dc <uart_puts>

0000000080005cc4 <trap_init_hart>:
    80005cc4:	ff010113          	add	sp,sp,-16
    80005cc8:	00006517          	auipc	a0,0x6
    80005ccc:	63050513          	add	a0,a0,1584 # 8000c2f8 <digits+0x3f0>
    80005cd0:	00113423          	sd	ra,8(sp)
    80005cd4:	e08fd0ef          	jal	800032dc <uart_puts>
    80005cd8:	00002797          	auipc	a5,0x2
    80005cdc:	ce878793          	add	a5,a5,-792 # 800079c0 <kernelvec>
    80005ce0:	10579073          	csrw	stvec,a5
    80005ce4:	104027f3          	csrr	a5,sie
    80005ce8:	2227e793          	or	a5,a5,546
    80005cec:	10479073          	csrw	sie,a5
    80005cf0:	100027f3          	csrr	a5,sstatus
    80005cf4:	0027e793          	or	a5,a5,2
    80005cf8:	10079073          	csrw	sstatus,a5
    80005cfc:	00813083          	ld	ra,8(sp)
    80005d00:	00006517          	auipc	a0,0x6
    80005d04:	62050513          	add	a0,a0,1568 # 8000c320 <digits+0x418>
    80005d08:	01010113          	add	sp,sp,16
    80005d0c:	dd0fd06f          	j	800032dc <uart_puts>

0000000080005d10 <set_next_timer>:
    80005d10:	0200c7b7          	lui	a5,0x200c
    80005d14:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80005d18:	000f4637          	lui	a2,0xf4
    80005d1c:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005d20:	00c58633          	add	a2,a1,a2
    80005d24:	020047b7          	lui	a5,0x2004
    80005d28:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80005d2c:	00006517          	auipc	a0,0x6
    80005d30:	61c50513          	add	a0,a0,1564 # 8000c348 <digits+0x440>
    80005d34:	a38fd06f          	j	80002f6c <printf>

0000000080005d38 <timerinit>:
    80005d38:	ff010113          	add	sp,sp,-16
    80005d3c:	00006517          	auipc	a0,0x6
    80005d40:	63c50513          	add	a0,a0,1596 # 8000c378 <digits+0x470>
    80005d44:	00113423          	sd	ra,8(sp)
    80005d48:	d94fd0ef          	jal	800032dc <uart_puts>
    80005d4c:	0200c7b7          	lui	a5,0x200c
    80005d50:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80005d54:	000f4637          	lui	a2,0xf4
    80005d58:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005d5c:	00c58633          	add	a2,a1,a2
    80005d60:	020047b7          	lui	a5,0x2004
    80005d64:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80005d68:	00006517          	auipc	a0,0x6
    80005d6c:	5e050513          	add	a0,a0,1504 # 8000c348 <digits+0x440>
    80005d70:	9fcfd0ef          	jal	80002f6c <printf>
    80005d74:	00813083          	ld	ra,8(sp)
    80005d78:	00006517          	auipc	a0,0x6
    80005d7c:	62050513          	add	a0,a0,1568 # 8000c398 <digits+0x490>
    80005d80:	01010113          	add	sp,sp,16
    80005d84:	d58fd06f          	j	800032dc <uart_puts>

0000000080005d88 <devintr>:
    80005d88:	142025f3          	csrr	a1,scause
    80005d8c:	1005da63          	bgez	a1,80005ea0 <devintr+0x118>
    80005d90:	ff010113          	add	sp,sp,-16
    80005d94:	00113423          	sd	ra,8(sp)
    80005d98:	00813023          	sd	s0,0(sp)
    80005d9c:	00f5f593          	and	a1,a1,15
    80005da0:	00500793          	li	a5,5
    80005da4:	08f58663          	beq	a1,a5,80005e30 <devintr+0xa8>
    80005da8:	00900793          	li	a5,9
    80005dac:	06f58263          	beq	a1,a5,80005e10 <devintr+0x88>
    80005db0:	00100793          	li	a5,1
    80005db4:	02f58263          	beq	a1,a5,80005dd8 <devintr+0x50>
    80005db8:	00006517          	auipc	a0,0x6
    80005dbc:	66850513          	add	a0,a0,1640 # 8000c420 <digits+0x518>
    80005dc0:	9acfd0ef          	jal	80002f6c <printf>
    80005dc4:	00813083          	ld	ra,8(sp)
    80005dc8:	00013403          	ld	s0,0(sp)
    80005dcc:	00000513          	li	a0,0
    80005dd0:	01010113          	add	sp,sp,16
    80005dd4:	00008067          	ret
    80005dd8:	00006517          	auipc	a0,0x6
    80005ddc:	62850513          	add	a0,a0,1576 # 8000c400 <digits+0x4f8>
    80005de0:	cfcfd0ef          	jal	800032dc <uart_puts>
    80005de4:	144027f3          	csrr	a5,sip
    80005de8:	ffd7f793          	and	a5,a5,-3
    80005dec:	14479073          	csrw	sip,a5
    80005df0:	00006517          	auipc	a0,0x6
    80005df4:	3f850513          	add	a0,a0,1016 # 8000c1e8 <digits+0x2e0>
    80005df8:	974fd0ef          	jal	80002f6c <printf>
    80005dfc:	00100513          	li	a0,1
    80005e00:	00813083          	ld	ra,8(sp)
    80005e04:	00013403          	ld	s0,0(sp)
    80005e08:	01010113          	add	sp,sp,16
    80005e0c:	00008067          	ret
    80005e10:	00006517          	auipc	a0,0x6
    80005e14:	5d050513          	add	a0,a0,1488 # 8000c3e0 <digits+0x4d8>
    80005e18:	cc4fd0ef          	jal	800032dc <uart_puts>
    80005e1c:	00006517          	auipc	a0,0x6
    80005e20:	39c50513          	add	a0,a0,924 # 8000c1b8 <digits+0x2b0>
    80005e24:	948fd0ef          	jal	80002f6c <printf>
    80005e28:	00100513          	li	a0,1
    80005e2c:	fd5ff06f          	j	80005e00 <devintr+0x78>
    80005e30:	00421417          	auipc	s0,0x421
    80005e34:	62040413          	add	s0,s0,1568 # 80427450 <ticks>
    80005e38:	00043783          	ld	a5,0(s0)
    80005e3c:	000f4637          	lui	a2,0xf4
    80005e40:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005e44:	00178793          	add	a5,a5,1
    80005e48:	00f43023          	sd	a5,0(s0)
    80005e4c:	0200c7b7          	lui	a5,0x200c
    80005e50:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80005e54:	020047b7          	lui	a5,0x2004
    80005e58:	00006517          	auipc	a0,0x6
    80005e5c:	4f050513          	add	a0,a0,1264 # 8000c348 <digits+0x440>
    80005e60:	00c58633          	add	a2,a1,a2
    80005e64:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80005e68:	904fd0ef          	jal	80002f6c <printf>
    80005e6c:	00043583          	ld	a1,0(s0)
    80005e70:	00006517          	auipc	a0,0x6
    80005e74:	54850513          	add	a0,a0,1352 # 8000c3b8 <digits+0x4b0>
    80005e78:	8f4fd0ef          	jal	80002f6c <printf>
    80005e7c:	00043583          	ld	a1,0(s0)
    80005e80:	00006517          	auipc	a0,0x6
    80005e84:	31050513          	add	a0,a0,784 # 8000c190 <digits+0x288>
    80005e88:	8e4fd0ef          	jal	80002f6c <printf>
    80005e8c:	00100793          	li	a5,1
    80005e90:	00421717          	auipc	a4,0x421
    80005e94:	5cf72a23          	sw	a5,1492(a4) # 80427464 <need_resched>
    80005e98:	00100513          	li	a0,1
    80005e9c:	f65ff06f          	j	80005e00 <devintr+0x78>
    80005ea0:	00000513          	li	a0,0
    80005ea4:	00008067          	ret

0000000080005ea8 <usertrapret>:
    80005ea8:	ff010113          	add	sp,sp,-16
    80005eac:	00113423          	sd	ra,8(sp)
    80005eb0:	23d000ef          	jal	800068ec <myproc>
    80005eb4:	100027f3          	csrr	a5,sstatus
    80005eb8:	ffd7f793          	and	a5,a5,-3
    80005ebc:	10079073          	csrw	sstatus,a5
    80005ec0:	00002797          	auipc	a5,0x2
    80005ec4:	c3078793          	add	a5,a5,-976 # 80007af0 <uservec>
    80005ec8:	10579073          	csrw	stvec,a5
    80005ecc:	18002773          	csrr	a4,satp
    80005ed0:	04853783          	ld	a5,72(a0)
    80005ed4:	00070463          	beqz	a4,80005edc <usertrapret+0x34>
    80005ed8:	00e7b023          	sd	a4,0(a5)
    80005edc:	04053703          	ld	a4,64(a0)
    80005ee0:	000016b7          	lui	a3,0x1
    80005ee4:	00d70733          	add	a4,a4,a3
    80005ee8:	00e7b423          	sd	a4,8(a5)
    80005eec:	00000717          	auipc	a4,0x0
    80005ef0:	05070713          	add	a4,a4,80 # 80005f3c <usertrap>
    80005ef4:	00e7b823          	sd	a4,16(a5)
    80005ef8:	00020713          	mv	a4,tp
    80005efc:	02e7b023          	sd	a4,32(a5)
    80005f00:	10002773          	csrr	a4,sstatus
    80005f04:	eff77713          	and	a4,a4,-257
    80005f08:	02076713          	or	a4,a4,32
    80005f0c:	10071073          	csrw	sstatus,a4
    80005f10:	0187b703          	ld	a4,24(a5)
    80005f14:	14171073          	csrw	sepc,a4
    80005f18:	14079073          	csrw	sscratch,a5
    80005f1c:	03053503          	ld	a0,48(a0)
    80005f20:	00813083          	ld	ra,8(sp)
    80005f24:	fff00793          	li	a5,-1
    80005f28:	00c55513          	srl	a0,a0,0xc
    80005f2c:	03f79793          	sll	a5,a5,0x3f
    80005f30:	00f56533          	or	a0,a0,a5
    80005f34:	01010113          	add	sp,sp,16
    80005f38:	4650106f          	j	80007b9c <userret>

0000000080005f3c <usertrap>:
    80005f3c:	fe010113          	add	sp,sp,-32
    80005f40:	01213023          	sd	s2,0(sp)
    80005f44:	00113c23          	sd	ra,24(sp)
    80005f48:	00813823          	sd	s0,16(sp)
    80005f4c:	00913423          	sd	s1,8(sp)
    80005f50:	10000937          	lui	s2,0x10000
    80005f54:	05400793          	li	a5,84
    80005f58:	00f90023          	sb	a5,0(s2) # 10000000 <_entry-0x70000000>
    80005f5c:	142024f3          	csrr	s1,scause
    80005f60:	18d000ef          	jal	800068ec <myproc>
    80005f64:	00050413          	mv	s0,a0
    80005f68:	14102673          	csrr	a2,sepc
    80005f6c:	00006517          	auipc	a0,0x6
    80005f70:	54c50513          	add	a0,a0,1356 # 8000c4b8 <digits+0x5b0>
    80005f74:	00048593          	mv	a1,s1
    80005f78:	ff5fc0ef          	jal	80002f6c <printf>
    80005f7c:	100027f3          	csrr	a5,sstatus
    80005f80:	1007f793          	and	a5,a5,256
    80005f84:	1e079463          	bnez	a5,8000616c <usertrap+0x230>
    80005f88:	00002797          	auipc	a5,0x2
    80005f8c:	a3878793          	add	a5,a5,-1480 # 800079c0 <kernelvec>
    80005f90:	10579073          	csrw	stvec,a5
    80005f94:	00800793          	li	a5,8
    80005f98:	0ef48463          	beq	s1,a5,80006080 <usertrap+0x144>
    80005f9c:	00300793          	li	a5,3
    80005fa0:	0af49463          	bne	s1,a5,80006048 <usertrap+0x10c>
    80005fa4:	00006717          	auipc	a4,0x6
    80005fa8:	49c70713          	add	a4,a4,1180 # 8000c440 <digits+0x538>
    80005fac:	00a00793          	li	a5,10
    80005fb0:	100006b7          	lui	a3,0x10000
    80005fb4:	00f68023          	sb	a5,0(a3) # 10000000 <_entry-0x70000000>
    80005fb8:	00174783          	lbu	a5,1(a4)
    80005fbc:	00170713          	add	a4,a4,1
    80005fc0:	fe079ae3          	bnez	a5,80005fb4 <usertrap+0x78>
    80005fc4:	04200793          	li	a5,66
    80005fc8:	00f68023          	sb	a5,0(a3)
    80005fcc:	00a00793          	li	a5,10
    80005fd0:	00f68023          	sb	a5,0(a3)
    80005fd4:	00006717          	auipc	a4,0x6
    80005fd8:	48c70713          	add	a4,a4,1164 # 8000c460 <digits+0x558>
    80005fdc:	05400793          	li	a5,84
    80005fe0:	100006b7          	lui	a3,0x10000
    80005fe4:	00f68023          	sb	a5,0(a3) # 10000000 <_entry-0x70000000>
    80005fe8:	00174783          	lbu	a5,1(a4)
    80005fec:	00170713          	add	a4,a4,1
    80005ff0:	fe079ae3          	bnez	a5,80005fe4 <usertrap+0xa8>
    80005ff4:	00006717          	auipc	a4,0x6
    80005ff8:	49c70713          	add	a4,a4,1180 # 8000c490 <digits+0x588>
    80005ffc:	05300793          	li	a5,83
    80006000:	100006b7          	lui	a3,0x10000
    80006004:	00f68023          	sb	a5,0(a3) # 10000000 <_entry-0x70000000>
    80006008:	00174783          	lbu	a5,1(a4)
    8000600c:	00170713          	add	a4,a4,1
    80006010:	fe079ae3          	bnez	a5,80006004 <usertrap+0xc8>
    80006014:	00100793          	li	a5,1
    80006018:	02f42423          	sw	a5,40(s0)
    8000601c:	fff00513          	li	a0,-1
    80006020:	fff00793          	li	a5,-1
    80006024:	00421717          	auipc	a4,0x421
    80006028:	40f72e23          	sw	a5,1052(a4) # 80427440 <syscall_test_count>
    8000602c:	575000ef          	jal	80006da0 <exit>
    80006030:	01013403          	ld	s0,16(sp)
    80006034:	01813083          	ld	ra,24(sp)
    80006038:	00813483          	ld	s1,8(sp)
    8000603c:	00013903          	ld	s2,0(sp)
    80006040:	02010113          	add	sp,sp,32
    80006044:	e65ff06f          	j	80005ea8 <usertrapret>
    80006048:	d41ff0ef          	jal	80005d88 <devintr>
    8000604c:	00050493          	mv	s1,a0
    80006050:	0c050663          	beqz	a0,8000611c <usertrap+0x1e0>
    80006054:	02842783          	lw	a5,40(s0)
    80006058:	0a079c63          	bnez	a5,80006110 <usertrap+0x1d4>
    8000605c:	00200793          	li	a5,2
    80006060:	fcf498e3          	bne	s1,a5,80006030 <usertrap+0xf4>
    80006064:	33d000ef          	jal	80006ba0 <yield>
    80006068:	01013403          	ld	s0,16(sp)
    8000606c:	01813083          	ld	ra,24(sp)
    80006070:	00813483          	ld	s1,8(sp)
    80006074:	00013903          	ld	s2,0(sp)
    80006078:	02010113          	add	sp,sp,32
    8000607c:	e2dff06f          	j	80005ea8 <usertrapret>
    80006080:	05300793          	li	a5,83
    80006084:	00f90023          	sb	a5,0(s2)
    80006088:	04843783          	ld	a5,72(s0)
    8000608c:	00800593          	li	a1,8
    80006090:	00006517          	auipc	a0,0x6
    80006094:	47850513          	add	a0,a0,1144 # 8000c508 <digits+0x600>
    80006098:	0187b603          	ld	a2,24(a5)
    8000609c:	ed1fc0ef          	jal	80002f6c <printf>
    800060a0:	04843783          	ld	a5,72(s0)
    800060a4:	00006517          	auipc	a0,0x6
    800060a8:	49c50513          	add	a0,a0,1180 # 8000c540 <digits+0x638>
    800060ac:	0a87b583          	ld	a1,168(a5)
    800060b0:	ebdfc0ef          	jal	80002f6c <printf>
    800060b4:	04843703          	ld	a4,72(s0)
    800060b8:	01873783          	ld	a5,24(a4)
    800060bc:	00478793          	add	a5,a5,4
    800060c0:	00f73c23          	sd	a5,24(a4)
    800060c4:	100027f3          	csrr	a5,sstatus
    800060c8:	0027e793          	or	a5,a5,2
    800060cc:	10079073          	csrw	sstatus,a5
    800060d0:	730010ef          	jal	80007800 <syscall>
    800060d4:	04843783          	ld	a5,72(s0)
    800060d8:	00006517          	auipc	a0,0x6
    800060dc:	49050513          	add	a0,a0,1168 # 8000c568 <digits+0x660>
    800060e0:	0707b583          	ld	a1,112(a5)
    800060e4:	e89fc0ef          	jal	80002f6c <printf>
    800060e8:	00421797          	auipc	a5,0x421
    800060ec:	3587a783          	lw	a5,856(a5) # 80427440 <syscall_test_count>
    800060f0:	02842703          	lw	a4,40(s0)
    800060f4:	0017879b          	addw	a5,a5,1
    800060f8:	00421697          	auipc	a3,0x421
    800060fc:	34f6a423          	sw	a5,840(a3) # 80427440 <syscall_test_count>
    80006100:	f20708e3          	beqz	a4,80006030 <usertrap+0xf4>
    80006104:	fff00513          	li	a0,-1
    80006108:	499000ef          	jal	80006da0 <exit>
    8000610c:	f25ff06f          	j	80006030 <usertrap+0xf4>
    80006110:	fff00513          	li	a0,-1
    80006114:	48d000ef          	jal	80006da0 <exit>
    80006118:	f45ff06f          	j	8000605c <usertrap+0x120>
    8000611c:	142025f3          	csrr	a1,scause
    80006120:	00842603          	lw	a2,8(s0)
    80006124:	00006517          	auipc	a0,0x6
    80006128:	47c50513          	add	a0,a0,1148 # 8000c5a0 <digits+0x698>
    8000612c:	e41fc0ef          	jal	80002f6c <printf>
    80006130:	141025f3          	csrr	a1,sepc
    80006134:	14302673          	csrr	a2,stval
    80006138:	00006517          	auipc	a0,0x6
    8000613c:	49050513          	add	a0,a0,1168 # 8000c5c8 <digits+0x6c0>
    80006140:	e2dfc0ef          	jal	80002f6c <printf>
    80006144:	00100793          	li	a5,1
    80006148:	02f42423          	sw	a5,40(s0)
    8000614c:	fff00513          	li	a0,-1
    80006150:	451000ef          	jal	80006da0 <exit>
    80006154:	01013403          	ld	s0,16(sp)
    80006158:	01813083          	ld	ra,24(sp)
    8000615c:	00813483          	ld	s1,8(sp)
    80006160:	00013903          	ld	s2,0(sp)
    80006164:	02010113          	add	sp,sp,32
    80006168:	d41ff06f          	j	80005ea8 <usertrapret>
    8000616c:	00006597          	auipc	a1,0x6
    80006170:	37c58593          	add	a1,a1,892 # 8000c4e8 <digits+0x5e0>
    80006174:	00006517          	auipc	a0,0x6
    80006178:	0cc50513          	add	a0,a0,204 # 8000c240 <digits+0x338>
    8000617c:	df1fc0ef          	jal	80002f6c <printf>
    80006180:	0000006f          	j	80006180 <usertrap+0x244>

0000000080006184 <handle_syscall>:
    80006184:	06050a63          	beqz	a0,800061f8 <handle_syscall+0x74>
    80006188:	ff010113          	add	sp,sp,-16
    8000618c:	00813023          	sd	s0,0(sp)
    80006190:	0a853403          	ld	s0,168(a0)
    80006194:	00006517          	auipc	a0,0x6
    80006198:	48450513          	add	a0,a0,1156 # 8000c618 <digits+0x710>
    8000619c:	00113423          	sd	ra,8(sp)
    800061a0:	00040593          	mv	a1,s0
    800061a4:	dc9fc0ef          	jal	80002f6c <printf>
    800061a8:	00200793          	li	a5,2
    800061ac:	06f40a63          	beq	s0,a5,80006220 <handle_syscall+0x9c>
    800061b0:	0287e463          	bltu	a5,s0,800061d8 <handle_syscall+0x54>
    800061b4:	00006517          	auipc	a0,0x6
    800061b8:	4ac50513          	add	a0,a0,1196 # 8000c660 <digits+0x758>
    800061bc:	02041663          	bnez	s0,800061e8 <handle_syscall+0x64>
    800061c0:	00013403          	ld	s0,0(sp)
    800061c4:	00813083          	ld	ra,8(sp)
    800061c8:	00006517          	auipc	a0,0x6
    800061cc:	47850513          	add	a0,a0,1144 # 8000c640 <digits+0x738>
    800061d0:	01010113          	add	sp,sp,16
    800061d4:	d99fc06f          	j	80002f6c <printf>
    800061d8:	00300793          	li	a5,3
    800061dc:	00006517          	auipc	a0,0x6
    800061e0:	4c450513          	add	a0,a0,1220 # 8000c6a0 <digits+0x798>
    800061e4:	02f41063          	bne	s0,a5,80006204 <handle_syscall+0x80>
    800061e8:	00013403          	ld	s0,0(sp)
    800061ec:	00813083          	ld	ra,8(sp)
    800061f0:	01010113          	add	sp,sp,16
    800061f4:	d79fc06f          	j	80002f6c <printf>
    800061f8:	00006517          	auipc	a0,0x6
    800061fc:	3f050513          	add	a0,a0,1008 # 8000c5e8 <digits+0x6e0>
    80006200:	8dcfd06f          	j	800032dc <uart_puts>
    80006204:	00040593          	mv	a1,s0
    80006208:	00013403          	ld	s0,0(sp)
    8000620c:	00813083          	ld	ra,8(sp)
    80006210:	00006517          	auipc	a0,0x6
    80006214:	4b050513          	add	a0,a0,1200 # 8000c6c0 <digits+0x7b8>
    80006218:	01010113          	add	sp,sp,16
    8000621c:	d51fc06f          	j	80002f6c <printf>
    80006220:	00013403          	ld	s0,0(sp)
    80006224:	00813083          	ld	ra,8(sp)
    80006228:	00006517          	auipc	a0,0x6
    8000622c:	45850513          	add	a0,a0,1112 # 8000c680 <digits+0x778>
    80006230:	01010113          	add	sp,sp,16
    80006234:	d39fc06f          	j	80002f6c <printf>

0000000080006238 <handle_exception>:
    80006238:	14202773          	csrr	a4,scause
    8000623c:	141025f3          	csrr	a1,sepc
    80006240:	00f00793          	li	a5,15
    80006244:	16e7e263          	bltu	a5,a4,800063a8 <handle_exception+0x170>
    80006248:	00006697          	auipc	a3,0x6
    8000624c:	79468693          	add	a3,a3,1940 # 8000c9dc <digits+0xad4>
    80006250:	00271793          	sll	a5,a4,0x2
    80006254:	00d787b3          	add	a5,a5,a3
    80006258:	0007a783          	lw	a5,0(a5)
    8000625c:	ff010113          	add	sp,sp,-16
    80006260:	00813023          	sd	s0,0(sp)
    80006264:	00d787b3          	add	a5,a5,a3
    80006268:	00113423          	sd	ra,8(sp)
    8000626c:	00050413          	mv	s0,a0
    80006270:	00078067          	jr	a5
    80006274:	00013403          	ld	s0,0(sp)
    80006278:	00813083          	ld	ra,8(sp)
    8000627c:	00058613          	mv	a2,a1
    80006280:	00070593          	mv	a1,a4
    80006284:	00006517          	auipc	a0,0x6
    80006288:	6b450513          	add	a0,a0,1716 # 8000c938 <digits+0xa30>
    8000628c:	01010113          	add	sp,sp,16
    80006290:	cddfc06f          	j	80002f6c <printf>
    80006294:	00006517          	auipc	a0,0x6
    80006298:	53c50513          	add	a0,a0,1340 # 8000c7d0 <digits+0x8c8>
    8000629c:	cd1fc0ef          	jal	80002f6c <printf>
    800062a0:	10040e63          	beqz	s0,800063bc <handle_exception+0x184>
    800062a4:	01843583          	ld	a1,24(s0)
    800062a8:	00006517          	auipc	a0,0x6
    800062ac:	58850513          	add	a0,a0,1416 # 8000c830 <digits+0x928>
    800062b0:	00013403          	ld	s0,0(sp)
    800062b4:	00813083          	ld	ra,8(sp)
    800062b8:	01010113          	add	sp,sp,16
    800062bc:	cb1fc06f          	j	80002f6c <printf>
    800062c0:	00006517          	auipc	a0,0x6
    800062c4:	5a050513          	add	a0,a0,1440 # 8000c860 <digits+0x958>
    800062c8:	ca5fc0ef          	jal	80002f6c <printf>
    800062cc:	00006517          	auipc	a0,0x6
    800062d0:	5b450513          	add	a0,a0,1460 # 8000c880 <digits+0x978>
    800062d4:	08040c63          	beqz	s0,8000636c <handle_exception+0x134>
    800062d8:	01843583          	ld	a1,24(s0)
    800062dc:	00006517          	auipc	a0,0x6
    800062e0:	5d450513          	add	a0,a0,1492 # 8000c8b0 <digits+0x9a8>
    800062e4:	fcdff06f          	j	800062b0 <handle_exception+0x78>
    800062e8:	00013403          	ld	s0,0(sp)
    800062ec:	00813083          	ld	ra,8(sp)
    800062f0:	00006517          	auipc	a0,0x6
    800062f4:	5e850513          	add	a0,a0,1512 # 8000c8d8 <digits+0x9d0>
    800062f8:	01010113          	add	sp,sp,16
    800062fc:	c71fc06f          	j	80002f6c <printf>
    80006300:	00013403          	ld	s0,0(sp)
    80006304:	00813083          	ld	ra,8(sp)
    80006308:	00006517          	auipc	a0,0x6
    8000630c:	60050513          	add	a0,a0,1536 # 8000c908 <digits+0xa00>
    80006310:	01010113          	add	sp,sp,16
    80006314:	c59fc06f          	j	80002f6c <printf>
    80006318:	00013403          	ld	s0,0(sp)
    8000631c:	00813083          	ld	ra,8(sp)
    80006320:	01010113          	add	sp,sp,16
    80006324:	e61ff06f          	j	80006184 <handle_syscall>
    80006328:	00006517          	auipc	a0,0x6
    8000632c:	3b850513          	add	a0,a0,952 # 8000c6e0 <digits+0x7d8>
    80006330:	c3dfc0ef          	jal	80002f6c <printf>
    80006334:	02040863          	beqz	s0,80006364 <handle_exception+0x12c>
    80006338:	143025f3          	csrr	a1,stval
    8000633c:	00013403          	ld	s0,0(sp)
    80006340:	00813083          	ld	ra,8(sp)
    80006344:	00006517          	auipc	a0,0x6
    80006348:	3fc50513          	add	a0,a0,1020 # 8000c740 <digits+0x838>
    8000634c:	01010113          	add	sp,sp,16
    80006350:	c1dfc06f          	j	80002f6c <printf>
    80006354:	00006517          	auipc	a0,0x6
    80006358:	41c50513          	add	a0,a0,1052 # 8000c770 <digits+0x868>
    8000635c:	c11fc0ef          	jal	80002f6c <printf>
    80006360:	fc041ce3          	bnez	s0,80006338 <handle_exception+0x100>
    80006364:	00006517          	auipc	a0,0x6
    80006368:	3a450513          	add	a0,a0,932 # 8000c708 <digits+0x800>
    8000636c:	00013403          	ld	s0,0(sp)
    80006370:	00813083          	ld	ra,8(sp)
    80006374:	01010113          	add	sp,sp,16
    80006378:	f65fc06f          	j	800032dc <uart_puts>
    8000637c:	00006517          	auipc	a0,0x6
    80006380:	40c50513          	add	a0,a0,1036 # 8000c788 <digits+0x880>
    80006384:	be9fc0ef          	jal	80002f6c <printf>
    80006388:	fc040ee3          	beqz	s0,80006364 <handle_exception+0x12c>
    8000638c:	143025f3          	csrr	a1,stval
    80006390:	00013403          	ld	s0,0(sp)
    80006394:	00813083          	ld	ra,8(sp)
    80006398:	00006517          	auipc	a0,0x6
    8000639c:	41050513          	add	a0,a0,1040 # 8000c7a8 <digits+0x8a0>
    800063a0:	01010113          	add	sp,sp,16
    800063a4:	bc9fc06f          	j	80002f6c <printf>
    800063a8:	00058613          	mv	a2,a1
    800063ac:	00006517          	auipc	a0,0x6
    800063b0:	58c50513          	add	a0,a0,1420 # 8000c938 <digits+0xa30>
    800063b4:	00070593          	mv	a1,a4
    800063b8:	bb5fc06f          	j	80002f6c <printf>
    800063bc:	00006517          	auipc	a0,0x6
    800063c0:	43c50513          	add	a0,a0,1084 # 8000c7f8 <digits+0x8f0>
    800063c4:	fa9ff06f          	j	8000636c <handle_exception+0x134>

00000000800063c8 <kerneltrap>:
    800063c8:	fe010113          	add	sp,sp,-32
    800063cc:	00113c23          	sd	ra,24(sp)
    800063d0:	00813823          	sd	s0,16(sp)
    800063d4:	00913423          	sd	s1,8(sp)
    800063d8:	14202473          	csrr	s0,scause
    800063dc:	141024f3          	csrr	s1,sepc
    800063e0:	00006517          	auipc	a0,0x6
    800063e4:	58050513          	add	a0,a0,1408 # 8000c960 <digits+0xa58>
    800063e8:	00048613          	mv	a2,s1
    800063ec:	00040593          	mv	a1,s0
    800063f0:	b7dfc0ef          	jal	80002f6c <printf>
    800063f4:	02044663          	bltz	s0,80006420 <kerneltrap+0x58>
    800063f8:	00040593          	mv	a1,s0
    800063fc:	00006517          	auipc	a0,0x6
    80006400:	5bc50513          	add	a0,a0,1468 # 8000c9b8 <digits+0xab0>
    80006404:	b69fc0ef          	jal	80002f6c <printf>
    80006408:	01013403          	ld	s0,16(sp)
    8000640c:	01813083          	ld	ra,24(sp)
    80006410:	00048513          	mv	a0,s1
    80006414:	00813483          	ld	s1,8(sp)
    80006418:	02010113          	add	sp,sp,32
    8000641c:	e1dff06f          	j	80006238 <handle_exception>
    80006420:	969ff0ef          	jal	80005d88 <devintr>
    80006424:	00050c63          	beqz	a0,8000643c <kerneltrap+0x74>
    80006428:	01813083          	ld	ra,24(sp)
    8000642c:	01013403          	ld	s0,16(sp)
    80006430:	00813483          	ld	s1,8(sp)
    80006434:	02010113          	add	sp,sp,32
    80006438:	00008067          	ret
    8000643c:	00f47593          	and	a1,s0,15
    80006440:	01013403          	ld	s0,16(sp)
    80006444:	01813083          	ld	ra,24(sp)
    80006448:	00813483          	ld	s1,8(sp)
    8000644c:	00006517          	auipc	a0,0x6
    80006450:	53c50513          	add	a0,a0,1340 # 8000c988 <digits+0xa80>
    80006454:	02010113          	add	sp,sp,32
    80006458:	b15fc06f          	j	80002f6c <printf>

000000008000645c <handle_trap_page_fault>:
    8000645c:	00058793          	mv	a5,a1
    80006460:	02050263          	beqz	a0,80006484 <handle_trap_page_fault+0x28>
    80006464:	143025f3          	csrr	a1,stval
    80006468:	00078863          	beqz	a5,80006478 <handle_trap_page_fault+0x1c>
    8000646c:	00006517          	auipc	a0,0x6
    80006470:	33c50513          	add	a0,a0,828 # 8000c7a8 <digits+0x8a0>
    80006474:	af9fc06f          	j	80002f6c <printf>
    80006478:	00006517          	auipc	a0,0x6
    8000647c:	2c850513          	add	a0,a0,712 # 8000c740 <digits+0x838>
    80006480:	aedfc06f          	j	80002f6c <printf>
    80006484:	00006517          	auipc	a0,0x6
    80006488:	28450513          	add	a0,a0,644 # 8000c708 <digits+0x800>
    8000648c:	e51fc06f          	j	800032dc <uart_puts>

0000000080006490 <handle_illegal_instruction>:
    80006490:	00050a63          	beqz	a0,800064a4 <handle_illegal_instruction+0x14>
    80006494:	01853583          	ld	a1,24(a0)
    80006498:	00006517          	auipc	a0,0x6
    8000649c:	39850513          	add	a0,a0,920 # 8000c830 <digits+0x928>
    800064a0:	acdfc06f          	j	80002f6c <printf>
    800064a4:	00006517          	auipc	a0,0x6
    800064a8:	35450513          	add	a0,a0,852 # 8000c7f8 <digits+0x8f0>
    800064ac:	e31fc06f          	j	800032dc <uart_puts>

00000000800064b0 <handle_breakpoint>:
    800064b0:	00050a63          	beqz	a0,800064c4 <handle_breakpoint+0x14>
    800064b4:	01853583          	ld	a1,24(a0)
    800064b8:	00006517          	auipc	a0,0x6
    800064bc:	3f850513          	add	a0,a0,1016 # 8000c8b0 <digits+0x9a8>
    800064c0:	aadfc06f          	j	80002f6c <printf>
    800064c4:	00006517          	auipc	a0,0x6
    800064c8:	3bc50513          	add	a0,a0,956 # 8000c880 <digits+0x978>
    800064cc:	e11fc06f          	j	800032dc <uart_puts>

00000000800064d0 <free_proc.part.0>:
    800064d0:	fe010113          	add	sp,sp,-32
    800064d4:	00813823          	sd	s0,16(sp)
    800064d8:	00913423          	sd	s1,8(sp)
    800064dc:	00113c23          	sd	ra,24(sp)
    800064e0:	00050493          	mv	s1,a0
    800064e4:	00421417          	auipc	s0,0x421
    800064e8:	f7c40413          	add	s0,s0,-132 # 80427460 <proc_lock>
    800064ec:	00100713          	li	a4,1
    800064f0:	00070793          	mv	a5,a4
    800064f4:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800064f8:	0007879b          	sext.w	a5,a5
    800064fc:	fe079ae3          	bnez	a5,800064f0 <free_proc.part.0+0x20>
    80006500:	0484b503          	ld	a0,72(s1) # 1048 <_entry-0x7fffefb8>
    80006504:	00050663          	beqz	a0,80006510 <free_proc.part.0+0x40>
    80006508:	e8cff0ef          	jal	80005b94 <free_trapframe>
    8000650c:	0404b423          	sd	zero,72(s1)
    80006510:	0404b503          	ld	a0,64(s1)
    80006514:	00050663          	beqz	a0,80006520 <free_proc.part.0+0x50>
    80006518:	e8dfc0ef          	jal	800033a4 <free_page>
    8000651c:	0404b023          	sd	zero,64(s1)
    80006520:	0304b503          	ld	a0,48(s1)
    80006524:	00050863          	beqz	a0,80006534 <free_proc.part.0+0x64>
    80006528:	0384b583          	ld	a1,56(s1)
    8000652c:	a10ff0ef          	jal	8000573c <proc_freepagetable>
    80006530:	0204b823          	sd	zero,48(s1)
    80006534:	0204bc23          	sd	zero,56(s1)
    80006538:	0004a223          	sw	zero,4(s1)
    8000653c:	0004a423          	sw	zero,8(s1)
    80006540:	0f50000f          	fence	iorw,ow
    80006544:	0804202f          	amoswap.w	zero,zero,(s0)
    80006548:	01813083          	ld	ra,24(sp)
    8000654c:	01013403          	ld	s0,16(sp)
    80006550:	00813483          	ld	s1,8(sp)
    80006554:	02010113          	add	sp,sp,32
    80006558:	00008067          	ret

000000008000655c <strlen>:
    8000655c:	00054783          	lbu	a5,0(a0)
    80006560:	02078463          	beqz	a5,80006588 <strlen+0x2c>
    80006564:	00150513          	add	a0,a0,1
    80006568:	00050793          	mv	a5,a0
    8000656c:	0007c703          	lbu	a4,0(a5)
    80006570:	00078693          	mv	a3,a5
    80006574:	00178793          	add	a5,a5,1
    80006578:	fe071ae3          	bnez	a4,8000656c <strlen+0x10>
    8000657c:	40a6853b          	subw	a0,a3,a0
    80006580:	0015051b          	addw	a0,a0,1
    80006584:	00008067          	ret
    80006588:	00000513          	li	a0,0
    8000658c:	00008067          	ret

0000000080006590 <proc_init>:
    80006590:	ff010113          	add	sp,sp,-16
    80006594:	00006517          	auipc	a0,0x6
    80006598:	48c50513          	add	a0,a0,1164 # 8000ca20 <digits+0xb18>
    8000659c:	00113423          	sd	ra,8(sp)
    800065a0:	d3dfc0ef          	jal	800032dc <uart_puts>
    800065a4:	00421717          	auipc	a4,0x421
    800065a8:	e7470713          	add	a4,a4,-396 # 80427418 <tickslock>
    800065ac:	00420797          	auipc	a5,0x420
    800065b0:	06c78793          	add	a5,a5,108 # 80426618 <proc>
    800065b4:	0007b023          	sd	zero,0(a5)
    800065b8:	00878793          	add	a5,a5,8
    800065bc:	fee79ce3          	bne	a5,a4,800065b4 <proc_init+0x24>
    800065c0:	00100793          	li	a5,1
    800065c4:	00007717          	auipc	a4,0x7
    800065c8:	a2f72e23          	sw	a5,-1476(a4) # 8000d000 <nextpid>
    800065cc:	00421797          	auipc	a5,0x421
    800065d0:	e807be23          	sd	zero,-356(a5) # 80427468 <current_proc>
    800065d4:	00420797          	auipc	a5,0x420
    800065d8:	04878793          	add	a5,a5,72 # 8042661c <proc+0x4>
    800065dc:	00421717          	auipc	a4,0x421
    800065e0:	e4070713          	add	a4,a4,-448 # 8042741c <tickslock+0x4>
    800065e4:	0007a023          	sw	zero,0(a5)
    800065e8:	0007b223          	sd	zero,4(a5)
    800065ec:	0e078793          	add	a5,a5,224
    800065f0:	fee79ae3          	bne	a5,a4,800065e4 <proc_init+0x54>
    800065f4:	00813083          	ld	ra,8(sp)
    800065f8:	00006517          	auipc	a0,0x6
    800065fc:	45050513          	add	a0,a0,1104 # 8000ca48 <digits+0xb40>
    80006600:	01010113          	add	sp,sp,16
    80006604:	cd9fc06f          	j	800032dc <uart_puts>

0000000080006608 <alloc_proc>:
    80006608:	fc010113          	add	sp,sp,-64
    8000660c:	02913423          	sd	s1,40(sp)
    80006610:	02113c23          	sd	ra,56(sp)
    80006614:	02813823          	sd	s0,48(sp)
    80006618:	03213023          	sd	s2,32(sp)
    8000661c:	01313c23          	sd	s3,24(sp)
    80006620:	01413823          	sd	s4,16(sp)
    80006624:	01513423          	sd	s5,8(sp)
    80006628:	00421497          	auipc	s1,0x421
    8000662c:	e3848493          	add	s1,s1,-456 # 80427460 <proc_lock>
    80006630:	00100713          	li	a4,1
    80006634:	00070793          	mv	a5,a4
    80006638:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    8000663c:	0007879b          	sext.w	a5,a5
    80006640:	fe079ae3          	bnez	a5,80006634 <alloc_proc+0x2c>
    80006644:	00420797          	auipc	a5,0x420
    80006648:	fd878793          	add	a5,a5,-40 # 8042661c <proc+0x4>
    8000664c:	00000413          	li	s0,0
    80006650:	01000693          	li	a3,16
    80006654:	0007a703          	lw	a4,0(a5)
    80006658:	0e078793          	add	a5,a5,224
    8000665c:	02070463          	beqz	a4,80006684 <alloc_proc+0x7c>
    80006660:	0014041b          	addw	s0,s0,1
    80006664:	fed418e3          	bne	s0,a3,80006654 <alloc_proc+0x4c>
    80006668:	0f50000f          	fence	iorw,ow
    8000666c:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006670:	00006517          	auipc	a0,0x6
    80006674:	4a050513          	add	a0,a0,1184 # 8000cb10 <digits+0xc08>
    80006678:	c65fc0ef          	jal	800032dc <uart_puts>
    8000667c:	00000993          	li	s3,0
    80006680:	0c40006f          	j	80006744 <alloc_proc+0x13c>
    80006684:	00007697          	auipc	a3,0x7
    80006688:	97c68693          	add	a3,a3,-1668 # 8000d000 <nextpid>
    8000668c:	0006a703          	lw	a4,0(a3)
    80006690:	00341a93          	sll	s5,s0,0x3
    80006694:	408a8933          	sub	s2,s5,s0
    80006698:	00591913          	sll	s2,s2,0x5
    8000669c:	00420a17          	auipc	s4,0x420
    800066a0:	f7ca0a13          	add	s4,s4,-132 # 80426618 <proc>
    800066a4:	012a09b3          	add	s3,s4,s2
    800066a8:	0017079b          	addw	a5,a4,1
    800066ac:	00100613          	li	a2,1
    800066b0:	00c9a223          	sw	a2,4(s3) # 1004 <_entry-0x7fffeffc>
    800066b4:	00f6a023          	sw	a5,0(a3)
    800066b8:	00e9a423          	sw	a4,8(s3)
    800066bc:	0009a623          	sw	zero,12(s3)
    800066c0:	0009a823          	sw	zero,16(s3)
    800066c4:	0209a423          	sw	zero,40(s3)
    800066c8:	0209a223          	sw	zero,36(s3)
    800066cc:	c68ff0ef          	jal	80005b34 <alloc_trapframe>
    800066d0:	04a9b423          	sd	a0,72(s3)
    800066d4:	0c050863          	beqz	a0,800067a4 <alloc_proc+0x19c>
    800066d8:	cb1fc0ef          	jal	80003388 <alloc_page>
    800066dc:	05890793          	add	a5,s2,88
    800066e0:	00fa07b3          	add	a5,s4,a5
    800066e4:	04a9b023          	sd	a0,64(s3)
    800066e8:	07078713          	add	a4,a5,112
    800066ec:	0c050a63          	beqz	a0,800067c0 <alloc_proc+0x1b8>
    800066f0:	0007b023          	sd	zero,0(a5)
    800066f4:	00878793          	add	a5,a5,8
    800066f8:	fee79ce3          	bne	a5,a4,800066f0 <alloc_proc+0xe8>
    800066fc:	408a8ab3          	sub	s5,s5,s0
    80006700:	005a9a93          	sll	s5,s5,0x5
    80006704:	015a0a33          	add	s4,s4,s5
    80006708:	040a3783          	ld	a5,64(s4)
    8000670c:	00001737          	lui	a4,0x1
    80006710:	00098513          	mv	a0,s3
    80006714:	00e787b3          	add	a5,a5,a4
    80006718:	06fa3023          	sd	a5,96(s4)
    8000671c:	fc1fe0ef          	jal	800056dc <proc_pagetable>
    80006720:	02aa3823          	sd	a0,48(s4)
    80006724:	04050463          	beqz	a0,8000676c <alloc_proc+0x164>
    80006728:	008a2583          	lw	a1,8(s4)
    8000672c:	00006517          	auipc	a0,0x6
    80006730:	3bc50513          	add	a0,a0,956 # 8000cae8 <digits+0xbe0>
    80006734:	020a3c23          	sd	zero,56(s4)
    80006738:	835fc0ef          	jal	80002f6c <printf>
    8000673c:	0f50000f          	fence	iorw,ow
    80006740:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006744:	03813083          	ld	ra,56(sp)
    80006748:	03013403          	ld	s0,48(sp)
    8000674c:	02813483          	ld	s1,40(sp)
    80006750:	02013903          	ld	s2,32(sp)
    80006754:	01013a03          	ld	s4,16(sp)
    80006758:	00813a83          	ld	s5,8(sp)
    8000675c:	00098513          	mv	a0,s3
    80006760:	01813983          	ld	s3,24(sp)
    80006764:	04010113          	add	sp,sp,64
    80006768:	00008067          	ret
    8000676c:	00006517          	auipc	a0,0x6
    80006770:	35450513          	add	a0,a0,852 # 8000cac0 <digits+0xbb8>
    80006774:	b69fc0ef          	jal	800032dc <uart_puts>
    80006778:	048a3503          	ld	a0,72(s4)
    8000677c:	c18ff0ef          	jal	80005b94 <free_trapframe>
    80006780:	040a3503          	ld	a0,64(s4)
    80006784:	c21fc0ef          	jal	800033a4 <free_page>
    80006788:	040a3423          	sd	zero,72(s4)
    8000678c:	040a3023          	sd	zero,64(s4)
    80006790:	000a2223          	sw	zero,4(s4)
    80006794:	0f50000f          	fence	iorw,ow
    80006798:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000679c:	00000993          	li	s3,0
    800067a0:	fa5ff06f          	j	80006744 <alloc_proc+0x13c>
    800067a4:	00006517          	auipc	a0,0x6
    800067a8:	2cc50513          	add	a0,a0,716 # 8000ca70 <digits+0xb68>
    800067ac:	b31fc0ef          	jal	800032dc <uart_puts>
    800067b0:	0f50000f          	fence	iorw,ow
    800067b4:	0804a02f          	amoswap.w	zero,zero,(s1)
    800067b8:	00000993          	li	s3,0
    800067bc:	f89ff06f          	j	80006744 <alloc_proc+0x13c>
    800067c0:	00006517          	auipc	a0,0x6
    800067c4:	2d850513          	add	a0,a0,728 # 8000ca98 <digits+0xb90>
    800067c8:	b15fc0ef          	jal	800032dc <uart_puts>
    800067cc:	0489b503          	ld	a0,72(s3)
    800067d0:	bc4ff0ef          	jal	80005b94 <free_trapframe>
    800067d4:	0f50000f          	fence	iorw,ow
    800067d8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800067dc:	00000993          	li	s3,0
    800067e0:	f65ff06f          	j	80006744 <alloc_proc+0x13c>

00000000800067e4 <free_proc>:
    800067e4:	00050463          	beqz	a0,800067ec <free_proc+0x8>
    800067e8:	ce9ff06f          	j	800064d0 <free_proc.part.0>
    800067ec:	00008067          	ret

00000000800067f0 <find_proc>:
    800067f0:	00420797          	auipc	a5,0x420
    800067f4:	e2c78793          	add	a5,a5,-468 # 8042661c <proc+0x4>
    800067f8:	00000713          	li	a4,0
    800067fc:	01000613          	li	a2,16
    80006800:	0100006f          	j	80006810 <find_proc+0x20>
    80006804:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80006808:	0e078793          	add	a5,a5,224
    8000680c:	02c70863          	beq	a4,a2,8000683c <find_proc+0x4c>
    80006810:	0047a683          	lw	a3,4(a5)
    80006814:	fea698e3          	bne	a3,a0,80006804 <find_proc+0x14>
    80006818:	0007a683          	lw	a3,0(a5)
    8000681c:	fe0684e3          	beqz	a3,80006804 <find_proc+0x14>
    80006820:	00371513          	sll	a0,a4,0x3
    80006824:	40e50533          	sub	a0,a0,a4
    80006828:	00420797          	auipc	a5,0x420
    8000682c:	df078793          	add	a5,a5,-528 # 80426618 <proc>
    80006830:	00551513          	sll	a0,a0,0x5
    80006834:	00f50533          	add	a0,a0,a5
    80006838:	00008067          	ret
    8000683c:	00000513          	li	a0,0
    80006840:	00008067          	ret

0000000080006844 <proc_set_kernel_stack>:
    80006844:	00050a63          	beqz	a0,80006858 <proc_set_kernel_stack+0x14>
    80006848:	000017b7          	lui	a5,0x1
    8000684c:	00f587b3          	add	a5,a1,a5
    80006850:	04b53023          	sd	a1,64(a0)
    80006854:	06f53023          	sd	a5,96(a0)
    80006858:	00008067          	ret

000000008000685c <proc_mark_runnable>:
    8000685c:	02050263          	beqz	a0,80006880 <proc_mark_runnable+0x24>
    80006860:	00452783          	lw	a5,4(a0)
    80006864:	00100713          	li	a4,1
    80006868:	ffe7869b          	addw	a3,a5,-2 # ffe <_entry-0x7ffff002>
    8000686c:	00d77a63          	bgeu	a4,a3,80006880 <proc_mark_runnable+0x24>
    80006870:	00500713          	li	a4,5
    80006874:	00e78663          	beq	a5,a4,80006880 <proc_mark_runnable+0x24>
    80006878:	00200793          	li	a5,2
    8000687c:	00f52223          	sw	a5,4(a0)
    80006880:	00008067          	ret

0000000080006884 <proc_mark_sleeping>:
    80006884:	00050863          	beqz	a0,80006894 <proc_mark_sleeping+0x10>
    80006888:	00452703          	lw	a4,4(a0)
    8000688c:	00300793          	li	a5,3
    80006890:	00f70463          	beq	a4,a5,80006898 <proc_mark_sleeping+0x14>
    80006894:	00008067          	ret
    80006898:	00400793          	li	a5,4
    8000689c:	00f52223          	sw	a5,4(a0)
    800068a0:	0cb53823          	sd	a1,208(a0)
    800068a4:	00008067          	ret

00000000800068a8 <proc_mark_zombie>:
    800068a8:	00050c63          	beqz	a0,800068c0 <proc_mark_zombie+0x18>
    800068ac:	00452703          	lw	a4,4(a0)
    800068b0:	00500793          	li	a5,5
    800068b4:	00f70663          	beq	a4,a5,800068c0 <proc_mark_zombie+0x18>
    800068b8:	00f52223          	sw	a5,4(a0)
    800068bc:	02b52223          	sw	a1,36(a0)
    800068c0:	00008067          	ret

00000000800068c4 <get_pid>:
    800068c4:	00421797          	auipc	a5,0x421
    800068c8:	ba47b783          	ld	a5,-1116(a5) # 80427468 <current_proc>
    800068cc:	00078663          	beqz	a5,800068d8 <get_pid+0x14>
    800068d0:	0087a503          	lw	a0,8(a5)
    800068d4:	00008067          	ret
    800068d8:	fff00513          	li	a0,-1
    800068dc:	00008067          	ret

00000000800068e0 <get_current_proc>:
    800068e0:	00421517          	auipc	a0,0x421
    800068e4:	b8853503          	ld	a0,-1144(a0) # 80427468 <current_proc>
    800068e8:	00008067          	ret

00000000800068ec <myproc>:
    800068ec:	00421517          	auipc	a0,0x421
    800068f0:	b7c53503          	ld	a0,-1156(a0) # 80427468 <current_proc>
    800068f4:	00008067          	ret

00000000800068f8 <set_current_proc>:
    800068f8:	00421797          	auipc	a5,0x421
    800068fc:	b6a7b823          	sd	a0,-1168(a5) # 80427468 <current_proc>
    80006900:	00008067          	ret

0000000080006904 <get_uid>:
    80006904:	00421797          	auipc	a5,0x421
    80006908:	b647b783          	ld	a5,-1180(a5) # 80427468 <current_proc>
    8000690c:	00000513          	li	a0,0
    80006910:	00078463          	beqz	a5,80006918 <get_uid+0x14>
    80006914:	0107a503          	lw	a0,16(a5)
    80006918:	00008067          	ret

000000008000691c <set_uid>:
    8000691c:	ff010113          	add	sp,sp,-16
    80006920:	00113423          	sd	ra,8(sp)
    80006924:	00813023          	sd	s0,0(sp)
    80006928:	00421797          	auipc	a5,0x421
    8000692c:	b407b783          	ld	a5,-1216(a5) # 80427468 <current_proc>
    80006930:	04078863          	beqz	a5,80006980 <set_uid+0x64>
    80006934:	0107a403          	lw	s0,16(a5)
    80006938:	04041863          	bnez	s0,80006988 <set_uid+0x6c>
    8000693c:	00700713          	li	a4,7
    80006940:	00050593          	mv	a1,a0
    80006944:	02a76663          	bltu	a4,a0,80006970 <set_uid+0x54>
    80006948:	0087a603          	lw	a2,8(a5)
    8000694c:	00a7a823          	sw	a0,16(a5)
    80006950:	00006517          	auipc	a0,0x6
    80006954:	24050513          	add	a0,a0,576 # 8000cb90 <digits+0xc88>
    80006958:	e14fc0ef          	jal	80002f6c <printf>
    8000695c:	00813083          	ld	ra,8(sp)
    80006960:	00040513          	mv	a0,s0
    80006964:	00013403          	ld	s0,0(sp)
    80006968:	01010113          	add	sp,sp,16
    8000696c:	00008067          	ret
    80006970:	00700613          	li	a2,7
    80006974:	00006517          	auipc	a0,0x6
    80006978:	1f450513          	add	a0,a0,500 # 8000cb68 <digits+0xc60>
    8000697c:	df0fc0ef          	jal	80002f6c <printf>
    80006980:	fff00413          	li	s0,-1
    80006984:	fd9ff06f          	j	8000695c <set_uid+0x40>
    80006988:	00006517          	auipc	a0,0x6
    8000698c:	1a850513          	add	a0,a0,424 # 8000cb30 <digits+0xc28>
    80006990:	ddcfc0ef          	jal	80002f6c <printf>
    80006994:	fff00413          	li	s0,-1
    80006998:	fc5ff06f          	j	8000695c <set_uid+0x40>

000000008000699c <count_user_procs>:
    8000699c:	00050593          	mv	a1,a0
    800069a0:	00420717          	auipc	a4,0x420
    800069a4:	c7870713          	add	a4,a4,-904 # 80426618 <proc>
    800069a8:	00421617          	auipc	a2,0x421
    800069ac:	a7060613          	add	a2,a2,-1424 # 80427418 <tickslock>
    800069b0:	00000513          	li	a0,0
    800069b4:	00100693          	li	a3,1
    800069b8:	00068793          	mv	a5,a3
    800069bc:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    800069c0:	0007879b          	sext.w	a5,a5
    800069c4:	fe079ae3          	bnez	a5,800069b8 <count_user_procs+0x1c>
    800069c8:	00472783          	lw	a5,4(a4)
    800069cc:	00078863          	beqz	a5,800069dc <count_user_procs+0x40>
    800069d0:	01072783          	lw	a5,16(a4)
    800069d4:	00b79463          	bne	a5,a1,800069dc <count_user_procs+0x40>
    800069d8:	0015051b          	addw	a0,a0,1
    800069dc:	0f50000f          	fence	iorw,ow
    800069e0:	0807202f          	amoswap.w	zero,zero,(a4)
    800069e4:	0e070713          	add	a4,a4,224
    800069e8:	fcc718e3          	bne	a4,a2,800069b8 <count_user_procs+0x1c>
    800069ec:	00008067          	ret

00000000800069f0 <can_fork>:
    800069f0:	ff010113          	add	sp,sp,-16
    800069f4:	00813023          	sd	s0,0(sp)
    800069f8:	00113423          	sd	ra,8(sp)
    800069fc:	00050413          	mv	s0,a0
    80006a00:	f9dff0ef          	jal	8000699c <count_user_procs>
    80006a04:	00300793          	li	a5,3
    80006a08:	00a7cc63          	blt	a5,a0,80006a20 <can_fork+0x30>
    80006a0c:	00813083          	ld	ra,8(sp)
    80006a10:	00013403          	ld	s0,0(sp)
    80006a14:	00100513          	li	a0,1
    80006a18:	01010113          	add	sp,sp,16
    80006a1c:	00008067          	ret
    80006a20:	00050613          	mv	a2,a0
    80006a24:	00040593          	mv	a1,s0
    80006a28:	00400693          	li	a3,4
    80006a2c:	00006517          	auipc	a0,0x6
    80006a30:	19450513          	add	a0,a0,404 # 8000cbc0 <digits+0xcb8>
    80006a34:	d38fc0ef          	jal	80002f6c <printf>
    80006a38:	00813083          	ld	ra,8(sp)
    80006a3c:	00013403          	ld	s0,0(sp)
    80006a40:	00000513          	li	a0,0
    80006a44:	01010113          	add	sp,sp,16
    80006a48:	00008067          	ret

0000000080006a4c <allocuvm>:
    80006a4c:	00060513          	mv	a0,a2
    80006a50:	00008067          	ret

0000000080006a54 <deallocuvm>:
    80006a54:	00060513          	mv	a0,a2
    80006a58:	00008067          	ret

0000000080006a5c <switchuvm>:
    80006a5c:	00008067          	ret

0000000080006a60 <scheduler>:
    80006a60:	fa010113          	add	sp,sp,-96
    80006a64:	04813823          	sd	s0,80(sp)
    80006a68:	00421417          	auipc	s0,0x421
    80006a6c:	9f440413          	add	s0,s0,-1548 # 8042745c <scheduler_initialized>
    80006a70:	00042783          	lw	a5,0(s0)
    80006a74:	04113c23          	sd	ra,88(sp)
    80006a78:	04913423          	sd	s1,72(sp)
    80006a7c:	05213023          	sd	s2,64(sp)
    80006a80:	03313c23          	sd	s3,56(sp)
    80006a84:	03413823          	sd	s4,48(sp)
    80006a88:	03513423          	sd	s5,40(sp)
    80006a8c:	03613023          	sd	s6,32(sp)
    80006a90:	01713c23          	sd	s7,24(sp)
    80006a94:	01813823          	sd	s8,16(sp)
    80006a98:	01913423          	sd	s9,8(sp)
    80006a9c:	0e078663          	beqz	a5,80006b88 <scheduler+0x128>
    80006aa0:	00421497          	auipc	s1,0x421
    80006aa4:	9b848493          	add	s1,s1,-1608 # 80427458 <last_index.0>
    80006aa8:	00420c17          	auipc	s8,0x420
    80006aac:	b70c0c13          	add	s8,s8,-1168 # 80426618 <proc>
    80006ab0:	00420b17          	auipc	s6,0x420
    80006ab4:	a78b0b13          	add	s6,s6,-1416 # 80426528 <cpus>
    80006ab8:	00421a97          	auipc	s5,0x421
    80006abc:	9b0a8a93          	add	s5,s5,-1616 # 80427468 <current_proc>
    80006ac0:	00200c93          	li	s9,2
    80006ac4:	00300a13          	li	s4,3
    80006ac8:	00006997          	auipc	s3,0x6
    80006acc:	15098993          	add	s3,s3,336 # 8000cc18 <digits+0xd10>
    80006ad0:	00420917          	auipc	s2,0x420
    80006ad4:	ad890913          	add	s2,s2,-1320 # 804265a8 <scheduler_context>
    80006ad8:	900ff0ef          	jal	80005bd8 <intr_on>
    80006adc:	0004a783          	lw	a5,0(s1)
    80006ae0:	0107861b          	addw	a2,a5,16
    80006ae4:	0080006f          	j	80006aec <scheduler+0x8c>
    80006ae8:	fef608e3          	beq	a2,a5,80006ad8 <scheduler+0x78>
    80006aec:	41f7d71b          	sraw	a4,a5,0x1f
    80006af0:	01c7571b          	srlw	a4,a4,0x1c
    80006af4:	00f7043b          	addw	s0,a4,a5
    80006af8:	00f47413          	and	s0,s0,15
    80006afc:	40e4073b          	subw	a4,s0,a4
    80006b00:	00371b93          	sll	s7,a4,0x3
    80006b04:	40eb8bb3          	sub	s7,s7,a4
    80006b08:	005b9b93          	sll	s7,s7,0x5
    80006b0c:	00070413          	mv	s0,a4
    80006b10:	017c0733          	add	a4,s8,s7
    80006b14:	00472683          	lw	a3,4(a4)
    80006b18:	0017879b          	addw	a5,a5,1
    80006b1c:	fd9696e3          	bne	a3,s9,80006ae8 <scheduler+0x88>
    80006b20:	00872583          	lw	a1,8(a4)
    80006b24:	00098513          	mv	a0,s3
    80006b28:	01472223          	sw	s4,4(a4)
    80006b2c:	00eb3023          	sd	a4,0(s6)
    80006b30:	00eab023          	sd	a4,0(s5)
    80006b34:	00421797          	auipc	a5,0x421
    80006b38:	9207a823          	sw	zero,-1744(a5) # 80427464 <need_resched>
    80006b3c:	c30fc0ef          	jal	80002f6c <printf>
    80006b40:	8a8ff0ef          	jal	80005be8 <intr_off>
    80006b44:	058b8593          	add	a1,s7,88
    80006b48:	00bc05b3          	add	a1,s8,a1
    80006b4c:	00090513          	mv	a0,s2
    80006b50:	0f0010ef          	jal	80007c40 <switch_context>
    80006b54:	0014041b          	addw	s0,s0,1
    80006b58:	880ff0ef          	jal	80005bd8 <intr_on>
    80006b5c:	41f4571b          	sraw	a4,s0,0x1f
    80006b60:	01c7571b          	srlw	a4,a4,0x1c
    80006b64:	00e4043b          	addw	s0,s0,a4
    80006b68:	00f47793          	and	a5,s0,15
    80006b6c:	40e787bb          	subw	a5,a5,a4
    80006b70:	00f4a023          	sw	a5,0(s1)
    80006b74:	00420717          	auipc	a4,0x420
    80006b78:	9a073a23          	sd	zero,-1612(a4) # 80426528 <cpus>
    80006b7c:	00421717          	auipc	a4,0x421
    80006b80:	8e073623          	sd	zero,-1812(a4) # 80427468 <current_proc>
    80006b84:	f55ff06f          	j	80006ad8 <scheduler+0x78>
    80006b88:	00006517          	auipc	a0,0x6
    80006b8c:	07050513          	add	a0,a0,112 # 8000cbf8 <digits+0xcf0>
    80006b90:	f4cfc0ef          	jal	800032dc <uart_puts>
    80006b94:	00100793          	li	a5,1
    80006b98:	00f42023          	sw	a5,0(s0)
    80006b9c:	f05ff06f          	j	80006aa0 <scheduler+0x40>

0000000080006ba0 <yield>:
    80006ba0:	fe010113          	add	sp,sp,-32
    80006ba4:	00813823          	sd	s0,16(sp)
    80006ba8:	00113c23          	sd	ra,24(sp)
    80006bac:	00913423          	sd	s1,8(sp)
    80006bb0:	00421417          	auipc	s0,0x421
    80006bb4:	8b843403          	ld	s0,-1864(s0) # 80427468 <current_proc>
    80006bb8:	06040263          	beqz	s0,80006c1c <yield+0x7c>
    80006bbc:	83cff0ef          	jal	80005bf8 <intr_get>
    80006bc0:	00050493          	mv	s1,a0
    80006bc4:	824ff0ef          	jal	80005be8 <intr_off>
    80006bc8:	00421717          	auipc	a4,0x421
    80006bcc:	89870713          	add	a4,a4,-1896 # 80427460 <proc_lock>
    80006bd0:	00100693          	li	a3,1
    80006bd4:	00068793          	mv	a5,a3
    80006bd8:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80006bdc:	0007879b          	sext.w	a5,a5
    80006be0:	fe079ae3          	bnez	a5,80006bd4 <yield+0x34>
    80006be4:	00442683          	lw	a3,4(s0)
    80006be8:	00300793          	li	a5,3
    80006bec:	04f68263          	beq	a3,a5,80006c30 <yield+0x90>
    80006bf0:	0f50000f          	fence	iorw,ow
    80006bf4:	0807202f          	amoswap.w	zero,zero,(a4)
    80006bf8:	00842583          	lw	a1,8(s0)
    80006bfc:	00006517          	auipc	a0,0x6
    80006c00:	04c50513          	add	a0,a0,76 # 8000cc48 <digits+0xd40>
    80006c04:	b68fc0ef          	jal	80002f6c <printf>
    80006c08:	00420597          	auipc	a1,0x420
    80006c0c:	9a058593          	add	a1,a1,-1632 # 804265a8 <scheduler_context>
    80006c10:	05840513          	add	a0,s0,88
    80006c14:	02c010ef          	jal	80007c40 <switch_context>
    80006c18:	02049263          	bnez	s1,80006c3c <yield+0x9c>
    80006c1c:	01813083          	ld	ra,24(sp)
    80006c20:	01013403          	ld	s0,16(sp)
    80006c24:	00813483          	ld	s1,8(sp)
    80006c28:	02010113          	add	sp,sp,32
    80006c2c:	00008067          	ret
    80006c30:	00200793          	li	a5,2
    80006c34:	00f42223          	sw	a5,4(s0)
    80006c38:	fb9ff06f          	j	80006bf0 <yield+0x50>
    80006c3c:	01013403          	ld	s0,16(sp)
    80006c40:	01813083          	ld	ra,24(sp)
    80006c44:	00813483          	ld	s1,8(sp)
    80006c48:	02010113          	add	sp,sp,32
    80006c4c:	f8dfe06f          	j	80005bd8 <intr_on>

0000000080006c50 <fork>:
    80006c50:	fe010113          	add	sp,sp,-32
    80006c54:	00913423          	sd	s1,8(sp)
    80006c58:	00113c23          	sd	ra,24(sp)
    80006c5c:	00813823          	sd	s0,16(sp)
    80006c60:	00421497          	auipc	s1,0x421
    80006c64:	8084b483          	ld	s1,-2040(s1) # 80427468 <current_proc>
    80006c68:	10048863          	beqz	s1,80006d78 <fork+0x128>
    80006c6c:	0104a403          	lw	s0,16(s1)
    80006c70:	00040513          	mv	a0,s0
    80006c74:	d29ff0ef          	jal	8000699c <count_user_procs>
    80006c78:	00300793          	li	a5,3
    80006c7c:	0aa7c863          	blt	a5,a0,80006d2c <fork+0xdc>
    80006c80:	989ff0ef          	jal	80006608 <alloc_proc>
    80006c84:	00050413          	mv	s0,a0
    80006c88:	10050263          	beqz	a0,80006d8c <fork+0x13c>
    80006c8c:	0104a703          	lw	a4,16(s1)
    80006c90:	0084a783          	lw	a5,8(s1)
    80006c94:	0384b603          	ld	a2,56(s1)
    80006c98:	00e52823          	sw	a4,16(a0)
    80006c9c:	0c953423          	sd	s1,200(a0)
    80006ca0:	00f52623          	sw	a5,12(a0)
    80006ca4:	02c53c23          	sd	a2,56(a0)
    80006ca8:	00060e63          	beqz	a2,80006cc4 <fork+0x74>
    80006cac:	0304b503          	ld	a0,48(s1)
    80006cb0:	00050a63          	beqz	a0,80006cc4 <fork+0x74>
    80006cb4:	03043583          	ld	a1,48(s0)
    80006cb8:	00058663          	beqz	a1,80006cc4 <fork+0x74>
    80006cbc:	b21fe0ef          	jal	800057dc <uvmcopy>
    80006cc0:	08054e63          	bltz	a0,80006d5c <fork+0x10c>
    80006cc4:	0484b783          	ld	a5,72(s1)
    80006cc8:	02078663          	beqz	a5,80006cf4 <fork+0xa4>
    80006ccc:	04843703          	ld	a4,72(s0)
    80006cd0:	02070263          	beqz	a4,80006cf4 <fork+0xa4>
    80006cd4:	12078613          	add	a2,a5,288
    80006cd8:	0007c683          	lbu	a3,0(a5)
    80006cdc:	00178793          	add	a5,a5,1
    80006ce0:	00170713          	add	a4,a4,1
    80006ce4:	fed70fa3          	sb	a3,-1(a4)
    80006ce8:	fec798e3          	bne	a5,a2,80006cd8 <fork+0x88>
    80006cec:	04843783          	ld	a5,72(s0)
    80006cf0:	0607b823          	sd	zero,112(a5)
    80006cf4:	0084a603          	lw	a2,8(s1)
    80006cf8:	01042683          	lw	a3,16(s0)
    80006cfc:	00842583          	lw	a1,8(s0)
    80006d00:	00200793          	li	a5,2
    80006d04:	00f42223          	sw	a5,4(s0)
    80006d08:	00006517          	auipc	a0,0x6
    80006d0c:	fe050513          	add	a0,a0,-32 # 8000cce8 <digits+0xde0>
    80006d10:	a5cfc0ef          	jal	80002f6c <printf>
    80006d14:	00842503          	lw	a0,8(s0)
    80006d18:	01813083          	ld	ra,24(sp)
    80006d1c:	01013403          	ld	s0,16(sp)
    80006d20:	00813483          	ld	s1,8(sp)
    80006d24:	02010113          	add	sp,sp,32
    80006d28:	00008067          	ret
    80006d2c:	00050613          	mv	a2,a0
    80006d30:	00400693          	li	a3,4
    80006d34:	00040593          	mv	a1,s0
    80006d38:	00006517          	auipc	a0,0x6
    80006d3c:	e8850513          	add	a0,a0,-376 # 8000cbc0 <digits+0xcb8>
    80006d40:	a2cfc0ef          	jal	80002f6c <printf>
    80006d44:	fff00513          	li	a0,-1
    80006d48:	01813083          	ld	ra,24(sp)
    80006d4c:	01013403          	ld	s0,16(sp)
    80006d50:	00813483          	ld	s1,8(sp)
    80006d54:	02010113          	add	sp,sp,32
    80006d58:	00008067          	ret
    80006d5c:	00006517          	auipc	a0,0x6
    80006d60:	f6450513          	add	a0,a0,-156 # 8000ccc0 <digits+0xdb8>
    80006d64:	d78fc0ef          	jal	800032dc <uart_puts>
    80006d68:	00040513          	mv	a0,s0
    80006d6c:	f64ff0ef          	jal	800064d0 <free_proc.part.0>
    80006d70:	fff00513          	li	a0,-1
    80006d74:	fd5ff06f          	j	80006d48 <fork+0xf8>
    80006d78:	00006517          	auipc	a0,0x6
    80006d7c:	ef050513          	add	a0,a0,-272 # 8000cc68 <digits+0xd60>
    80006d80:	d5cfc0ef          	jal	800032dc <uart_puts>
    80006d84:	fff00513          	li	a0,-1
    80006d88:	fc1ff06f          	j	80006d48 <fork+0xf8>
    80006d8c:	00006517          	auipc	a0,0x6
    80006d90:	f0450513          	add	a0,a0,-252 # 8000cc90 <digits+0xd88>
    80006d94:	d48fc0ef          	jal	800032dc <uart_puts>
    80006d98:	fff00513          	li	a0,-1
    80006d9c:	fadff06f          	j	80006d48 <fork+0xf8>

0000000080006da0 <exit>:
    80006da0:	00420697          	auipc	a3,0x420
    80006da4:	6c86b683          	ld	a3,1736(a3) # 80427468 <current_proc>
    80006da8:	08068e63          	beqz	a3,80006e44 <exit+0xa4>
    80006dac:	ff010113          	add	sp,sp,-16
    80006db0:	00813023          	sd	s0,0(sp)
    80006db4:	00113423          	sd	ra,8(sp)
    80006db8:	00050613          	mv	a2,a0
    80006dbc:	00420417          	auipc	s0,0x420
    80006dc0:	6a440413          	add	s0,s0,1700 # 80427460 <proc_lock>
    80006dc4:	00100713          	li	a4,1
    80006dc8:	00070793          	mv	a5,a4
    80006dcc:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80006dd0:	0007879b          	sext.w	a5,a5
    80006dd4:	fe079ae3          	bnez	a5,80006dc8 <exit+0x28>
    80006dd8:	00500793          	li	a5,5
    80006ddc:	00f6a223          	sw	a5,4(a3)
    80006de0:	02c6a223          	sw	a2,36(a3)
    80006de4:	00420797          	auipc	a5,0x420
    80006de8:	8fc78793          	add	a5,a5,-1796 # 804266e0 <proc+0xc8>
    80006dec:	00420597          	auipc	a1,0x420
    80006df0:	6f458593          	add	a1,a1,1780 # 804274e0 <bss_end+0x70>
    80006df4:	00100513          	li	a0,1
    80006df8:	00c0006f          	j	80006e04 <exit+0x64>
    80006dfc:	0e078793          	add	a5,a5,224
    80006e00:	00b78e63          	beq	a5,a1,80006e1c <exit+0x7c>
    80006e04:	0007b703          	ld	a4,0(a5)
    80006e08:	fed71ae3          	bne	a4,a3,80006dfc <exit+0x5c>
    80006e0c:	0007b023          	sd	zero,0(a5)
    80006e10:	f4a7a223          	sw	a0,-188(a5)
    80006e14:	0e078793          	add	a5,a5,224
    80006e18:	feb796e3          	bne	a5,a1,80006e04 <exit+0x64>
    80006e1c:	0086a583          	lw	a1,8(a3)
    80006e20:	00006517          	auipc	a0,0x6
    80006e24:	f0050513          	add	a0,a0,-256 # 8000cd20 <digits+0xe18>
    80006e28:	944fc0ef          	jal	80002f6c <printf>
    80006e2c:	0f50000f          	fence	iorw,ow
    80006e30:	0804202f          	amoswap.w	zero,zero,(s0)
    80006e34:	00013403          	ld	s0,0(sp)
    80006e38:	00813083          	ld	ra,8(sp)
    80006e3c:	01010113          	add	sp,sp,16
    80006e40:	d61ff06f          	j	80006ba0 <yield>
    80006e44:	00008067          	ret

0000000080006e48 <wait>:
    80006e48:	fa010113          	add	sp,sp,-96
    80006e4c:	04913423          	sd	s1,72(sp)
    80006e50:	00420497          	auipc	s1,0x420
    80006e54:	61848493          	add	s1,s1,1560 # 80427468 <current_proc>
    80006e58:	03413823          	sd	s4,48(sp)
    80006e5c:	0004ba03          	ld	s4,0(s1)
    80006e60:	04113c23          	sd	ra,88(sp)
    80006e64:	04813823          	sd	s0,80(sp)
    80006e68:	05213023          	sd	s2,64(sp)
    80006e6c:	03313c23          	sd	s3,56(sp)
    80006e70:	03513423          	sd	s5,40(sp)
    80006e74:	03613023          	sd	s6,32(sp)
    80006e78:	01713c23          	sd	s7,24(sp)
    80006e7c:	01813823          	sd	s8,16(sp)
    80006e80:	01913423          	sd	s9,8(sp)
    80006e84:	100a0663          	beqz	s4,80006f90 <wait+0x148>
    80006e88:	00050913          	mv	s2,a0
    80006e8c:	00420417          	auipc	s0,0x420
    80006e90:	5d440413          	add	s0,s0,1492 # 80427460 <proc_lock>
    80006e94:	00100a93          	li	s5,1
    80006e98:	00500c13          	li	s8,5
    80006e9c:	01000b13          	li	s6,16
    80006ea0:	00420b97          	auipc	s7,0x420
    80006ea4:	57cb8b93          	add	s7,s7,1404 # 8042741c <tickslock+0x4>
    80006ea8:	00400993          	li	s3,4
    80006eac:	000a8793          	mv	a5,s5
    80006eb0:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80006eb4:	0007879b          	sext.w	a5,a5
    80006eb8:	fe079ae3          	bnez	a5,80006eac <wait+0x64>
    80006ebc:	0041f797          	auipc	a5,0x41f
    80006ec0:	76078793          	add	a5,a5,1888 # 8042661c <proc+0x4>
    80006ec4:	00078713          	mv	a4,a5
    80006ec8:	00000693          	li	a3,0
    80006ecc:	0100006f          	j	80006edc <wait+0x94>
    80006ed0:	0016869b          	addw	a3,a3,1
    80006ed4:	0e070713          	add	a4,a4,224
    80006ed8:	0b668063          	beq	a3,s6,80006f78 <wait+0x130>
    80006edc:	0c473603          	ld	a2,196(a4)
    80006ee0:	ff4618e3          	bne	a2,s4,80006ed0 <wait+0x88>
    80006ee4:	00072603          	lw	a2,0(a4)
    80006ee8:	ff8614e3          	bne	a2,s8,80006ed0 <wait+0x88>
    80006eec:	00369513          	sll	a0,a3,0x3
    80006ef0:	40d50533          	sub	a0,a0,a3
    80006ef4:	00551513          	sll	a0,a0,0x5
    80006ef8:	0041f797          	auipc	a5,0x41f
    80006efc:	72078793          	add	a5,a5,1824 # 80426618 <proc>
    80006f00:	00f50533          	add	a0,a0,a5
    80006f04:	00852483          	lw	s1,8(a0)
    80006f08:	00090663          	beqz	s2,80006f14 <wait+0xcc>
    80006f0c:	02452783          	lw	a5,36(a0)
    80006f10:	00f92023          	sw	a5,0(s2)
    80006f14:	dbcff0ef          	jal	800064d0 <free_proc.part.0>
    80006f18:	00048593          	mv	a1,s1
    80006f1c:	00006517          	auipc	a0,0x6
    80006f20:	e3450513          	add	a0,a0,-460 # 8000cd50 <digits+0xe48>
    80006f24:	848fc0ef          	jal	80002f6c <printf>
    80006f28:	0f50000f          	fence	iorw,ow
    80006f2c:	0804202f          	amoswap.w	zero,zero,(s0)
    80006f30:	05813083          	ld	ra,88(sp)
    80006f34:	05013403          	ld	s0,80(sp)
    80006f38:	04013903          	ld	s2,64(sp)
    80006f3c:	03813983          	ld	s3,56(sp)
    80006f40:	03013a03          	ld	s4,48(sp)
    80006f44:	02813a83          	ld	s5,40(sp)
    80006f48:	02013b03          	ld	s6,32(sp)
    80006f4c:	01813b83          	ld	s7,24(sp)
    80006f50:	01013c03          	ld	s8,16(sp)
    80006f54:	00813c83          	ld	s9,8(sp)
    80006f58:	00048513          	mv	a0,s1
    80006f5c:	04813483          	ld	s1,72(sp)
    80006f60:	06010113          	add	sp,sp,96
    80006f64:	00008067          	ret
    80006f68:	0007a703          	lw	a4,0(a5)
    80006f6c:	02071663          	bnez	a4,80006f98 <wait+0x150>
    80006f70:	0e078793          	add	a5,a5,224
    80006f74:	01778a63          	beq	a5,s7,80006f88 <wait+0x140>
    80006f78:	0c47b703          	ld	a4,196(a5)
    80006f7c:	ff4706e3          	beq	a4,s4,80006f68 <wait+0x120>
    80006f80:	0e078793          	add	a5,a5,224
    80006f84:	ff779ae3          	bne	a5,s7,80006f78 <wait+0x130>
    80006f88:	0f50000f          	fence	iorw,ow
    80006f8c:	0804202f          	amoswap.w	zero,zero,(s0)
    80006f90:	fff00493          	li	s1,-1
    80006f94:	f9dff06f          	j	80006f30 <wait+0xe8>
    80006f98:	0004bc83          	ld	s9,0(s1)
    80006f9c:	0f50000f          	fence	iorw,ow
    80006fa0:	0804202f          	amoswap.w	zero,zero,(s0)
    80006fa4:	0d4cb823          	sd	s4,208(s9)
    80006fa8:	013ca223          	sw	s3,4(s9)
    80006fac:	bf5ff0ef          	jal	80006ba0 <yield>
    80006fb0:	0c0cb823          	sd	zero,208(s9)
    80006fb4:	000a8793          	mv	a5,s5
    80006fb8:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80006fbc:	0007879b          	sext.w	a5,a5
    80006fc0:	fe079ae3          	bnez	a5,80006fb4 <wait+0x16c>
    80006fc4:	0f50000f          	fence	iorw,ow
    80006fc8:	0804202f          	amoswap.w	zero,zero,(s0)
    80006fcc:	ee1ff06f          	j	80006eac <wait+0x64>

0000000080006fd0 <kill>:
    80006fd0:	0041f797          	auipc	a5,0x41f
    80006fd4:	64c78793          	add	a5,a5,1612 # 8042661c <proc+0x4>
    80006fd8:	00000713          	li	a4,0
    80006fdc:	01000613          	li	a2,16
    80006fe0:	0100006f          	j	80006ff0 <kill+0x20>
    80006fe4:	0017071b          	addw	a4,a4,1
    80006fe8:	0e078793          	add	a5,a5,224
    80006fec:	06c70863          	beq	a4,a2,8000705c <kill+0x8c>
    80006ff0:	0047a683          	lw	a3,4(a5)
    80006ff4:	fea698e3          	bne	a3,a0,80006fe4 <kill+0x14>
    80006ff8:	0007a683          	lw	a3,0(a5)
    80006ffc:	fe0684e3          	beqz	a3,80006fe4 <kill+0x14>
    80007000:	00420697          	auipc	a3,0x420
    80007004:	46068693          	add	a3,a3,1120 # 80427460 <proc_lock>
    80007008:	00100613          	li	a2,1
    8000700c:	00060793          	mv	a5,a2
    80007010:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80007014:	0007879b          	sext.w	a5,a5
    80007018:	fe079ae3          	bnez	a5,8000700c <kill+0x3c>
    8000701c:	00371793          	sll	a5,a4,0x3
    80007020:	40e787b3          	sub	a5,a5,a4
    80007024:	00579793          	sll	a5,a5,0x5
    80007028:	0041f717          	auipc	a4,0x41f
    8000702c:	5f070713          	add	a4,a4,1520 # 80426618 <proc>
    80007030:	00f707b3          	add	a5,a4,a5
    80007034:	0047a603          	lw	a2,4(a5)
    80007038:	00100713          	li	a4,1
    8000703c:	02e7a423          	sw	a4,40(a5)
    80007040:	00400713          	li	a4,4
    80007044:	00e61663          	bne	a2,a4,80007050 <kill+0x80>
    80007048:	00200713          	li	a4,2
    8000704c:	00e7a223          	sw	a4,4(a5)
    80007050:	0f50000f          	fence	iorw,ow
    80007054:	0806a02f          	amoswap.w	zero,zero,(a3)
    80007058:	00008067          	ret
    8000705c:	00008067          	ret

0000000080007060 <growproc>:
    80007060:	00420717          	auipc	a4,0x420
    80007064:	40873703          	ld	a4,1032(a4) # 80427468 <current_proc>
    80007068:	03873783          	ld	a5,56(a4)
    8000706c:	00a05c63          	blez	a0,80007084 <growproc+0x24>
    80007070:	00a787b3          	add	a5,a5,a0
    80007074:	02078063          	beqz	a5,80007094 <growproc+0x34>
    80007078:	02f73c23          	sd	a5,56(a4)
    8000707c:	00000513          	li	a0,0
    80007080:	00008067          	ret
    80007084:	fe0516e3          	bnez	a0,80007070 <growproc+0x10>
    80007088:	02f73c23          	sd	a5,56(a4)
    8000708c:	00000513          	li	a0,0
    80007090:	00008067          	ret
    80007094:	fff00513          	li	a0,-1
    80007098:	00008067          	ret

000000008000709c <sys_getpid>:
    8000709c:	00420797          	auipc	a5,0x420
    800070a0:	3cc7b783          	ld	a5,972(a5) # 80427468 <current_proc>
    800070a4:	0087a503          	lw	a0,8(a5)
    800070a8:	00008067          	ret

00000000800070ac <sys_fork>:
    800070ac:	ff010113          	add	sp,sp,-16
    800070b0:	00113423          	sd	ra,8(sp)
    800070b4:	b9dff0ef          	jal	80006c50 <fork>
    800070b8:	00813083          	ld	ra,8(sp)
    800070bc:	01010113          	add	sp,sp,16
    800070c0:	00008067          	ret

00000000800070c4 <sys_exit>:
    800070c4:	fe010113          	add	sp,sp,-32
    800070c8:	00c10593          	add	a1,sp,12
    800070cc:	00000513          	li	a0,0
    800070d0:	00113c23          	sd	ra,24(sp)
    800070d4:	404000ef          	jal	800074d8 <argint>
    800070d8:	fff00793          	li	a5,-1
    800070dc:	00054863          	bltz	a0,800070ec <sys_exit+0x28>
    800070e0:	00c12503          	lw	a0,12(sp)
    800070e4:	cbdff0ef          	jal	80006da0 <exit>
    800070e8:	00000793          	li	a5,0
    800070ec:	01813083          	ld	ra,24(sp)
    800070f0:	00078513          	mv	a0,a5
    800070f4:	02010113          	add	sp,sp,32
    800070f8:	00008067          	ret

00000000800070fc <sys_wait>:
    800070fc:	fe010113          	add	sp,sp,-32
    80007100:	00810593          	add	a1,sp,8
    80007104:	00000513          	li	a0,0
    80007108:	00113c23          	sd	ra,24(sp)
    8000710c:	4ec000ef          	jal	800075f8 <argaddr>
    80007110:	00050793          	mv	a5,a0
    80007114:	fff00513          	li	a0,-1
    80007118:	0007c663          	bltz	a5,80007124 <sys_wait+0x28>
    8000711c:	00813503          	ld	a0,8(sp)
    80007120:	d29ff0ef          	jal	80006e48 <wait>
    80007124:	01813083          	ld	ra,24(sp)
    80007128:	02010113          	add	sp,sp,32
    8000712c:	00008067          	ret

0000000080007130 <sys_sbrk>:
    80007130:	fe010113          	add	sp,sp,-32
    80007134:	00c10593          	add	a1,sp,12
    80007138:	00000513          	li	a0,0
    8000713c:	00113c23          	sd	ra,24(sp)
    80007140:	398000ef          	jal	800074d8 <argint>
    80007144:	fff00713          	li	a4,-1
    80007148:	02054663          	bltz	a0,80007174 <sys_sbrk+0x44>
    8000714c:	00420617          	auipc	a2,0x420
    80007150:	31c63603          	ld	a2,796(a2) # 80427468 <current_proc>
    80007154:	03863783          	ld	a5,56(a2)
    80007158:	00c12683          	lw	a3,12(sp)
    8000715c:	0007859b          	sext.w	a1,a5
    80007160:	02d05263          	blez	a3,80007184 <sys_sbrk+0x54>
    80007164:	00d787b3          	add	a5,a5,a3
    80007168:	00078663          	beqz	a5,80007174 <sys_sbrk+0x44>
    8000716c:	02f63c23          	sd	a5,56(a2)
    80007170:	00058713          	mv	a4,a1
    80007174:	01813083          	ld	ra,24(sp)
    80007178:	00070513          	mv	a0,a4
    8000717c:	02010113          	add	sp,sp,32
    80007180:	00008067          	ret
    80007184:	fe0684e3          	beqz	a3,8000716c <sys_sbrk+0x3c>
    80007188:	fddff06f          	j	80007164 <sys_sbrk+0x34>

000000008000718c <sleep>:
    8000718c:	fe010113          	add	sp,sp,-32
    80007190:	00913423          	sd	s1,8(sp)
    80007194:	00113c23          	sd	ra,24(sp)
    80007198:	00813823          	sd	s0,16(sp)
    8000719c:	00420497          	auipc	s1,0x420
    800071a0:	2cc4b483          	ld	s1,716(s1) # 80427468 <current_proc>
    800071a4:	04058663          	beqz	a1,800071f0 <sleep+0x64>
    800071a8:	00058413          	mv	s0,a1
    800071ac:	0f50000f          	fence	iorw,ow
    800071b0:	0805a02f          	amoswap.w	zero,zero,(a1)
    800071b4:	00400793          	li	a5,4
    800071b8:	0ca4b823          	sd	a0,208(s1)
    800071bc:	00f4a223          	sw	a5,4(s1)
    800071c0:	9e1ff0ef          	jal	80006ba0 <yield>
    800071c4:	00100713          	li	a4,1
    800071c8:	0c04b823          	sd	zero,208(s1)
    800071cc:	00070793          	mv	a5,a4
    800071d0:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800071d4:	0007879b          	sext.w	a5,a5
    800071d8:	fe079ae3          	bnez	a5,800071cc <sleep+0x40>
    800071dc:	01813083          	ld	ra,24(sp)
    800071e0:	01013403          	ld	s0,16(sp)
    800071e4:	00813483          	ld	s1,8(sp)
    800071e8:	02010113          	add	sp,sp,32
    800071ec:	00008067          	ret
    800071f0:	00400793          	li	a5,4
    800071f4:	0ca4b823          	sd	a0,208(s1)
    800071f8:	00f4a223          	sw	a5,4(s1)
    800071fc:	9a5ff0ef          	jal	80006ba0 <yield>
    80007200:	01813083          	ld	ra,24(sp)
    80007204:	01013403          	ld	s0,16(sp)
    80007208:	0c04b823          	sd	zero,208(s1)
    8000720c:	00813483          	ld	s1,8(sp)
    80007210:	02010113          	add	sp,sp,32
    80007214:	00008067          	ret

0000000080007218 <wakeup>:
    80007218:	0041f797          	auipc	a5,0x41f
    8000721c:	40078793          	add	a5,a5,1024 # 80426618 <proc>
    80007220:	00420617          	auipc	a2,0x420
    80007224:	1f860613          	add	a2,a2,504 # 80427418 <tickslock>
    80007228:	00400693          	li	a3,4
    8000722c:	00200593          	li	a1,2
    80007230:	00c0006f          	j	8000723c <wakeup+0x24>
    80007234:	0e078793          	add	a5,a5,224
    80007238:	02c78063          	beq	a5,a2,80007258 <wakeup+0x40>
    8000723c:	0047a703          	lw	a4,4(a5)
    80007240:	fed71ae3          	bne	a4,a3,80007234 <wakeup+0x1c>
    80007244:	0d07b703          	ld	a4,208(a5)
    80007248:	fea716e3          	bne	a4,a0,80007234 <wakeup+0x1c>
    8000724c:	00b7a223          	sw	a1,4(a5)
    80007250:	0e078793          	add	a5,a5,224
    80007254:	fec794e3          	bne	a5,a2,8000723c <wakeup+0x24>
    80007258:	00008067          	ret

000000008000725c <sys_uptime>:
    8000725c:	00420717          	auipc	a4,0x420
    80007260:	1bc70713          	add	a4,a4,444 # 80427418 <tickslock>
    80007264:	00100693          	li	a3,1
    80007268:	00068793          	mv	a5,a3
    8000726c:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80007270:	0007879b          	sext.w	a5,a5
    80007274:	fe079ae3          	bnez	a5,80007268 <sys_uptime+0xc>
    80007278:	00420517          	auipc	a0,0x420
    8000727c:	1d853503          	ld	a0,472(a0) # 80427450 <ticks>
    80007280:	0f50000f          	fence	iorw,ow
    80007284:	0807202f          	amoswap.w	zero,zero,(a4)
    80007288:	00008067          	ret

000000008000728c <sys_sleep>:
    8000728c:	fb010113          	add	sp,sp,-80
    80007290:	00c10593          	add	a1,sp,12
    80007294:	00000513          	li	a0,0
    80007298:	04113423          	sd	ra,72(sp)
    8000729c:	04813023          	sd	s0,64(sp)
    800072a0:	02913c23          	sd	s1,56(sp)
    800072a4:	03213823          	sd	s2,48(sp)
    800072a8:	03313423          	sd	s3,40(sp)
    800072ac:	03413023          	sd	s4,32(sp)
    800072b0:	01513c23          	sd	s5,24(sp)
    800072b4:	01613823          	sd	s6,16(sp)
    800072b8:	220000ef          	jal	800074d8 <argint>
    800072bc:	0c054663          	bltz	a0,80007388 <sys_sleep+0xfc>
    800072c0:	00420417          	auipc	s0,0x420
    800072c4:	15840413          	add	s0,s0,344 # 80427418 <tickslock>
    800072c8:	00100713          	li	a4,1
    800072cc:	00070793          	mv	a5,a4
    800072d0:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800072d4:	0007879b          	sext.w	a5,a5
    800072d8:	fe079ae3          	bnez	a5,800072cc <sys_sleep+0x40>
    800072dc:	00420997          	auipc	s3,0x420
    800072e0:	17498993          	add	s3,s3,372 # 80427450 <ticks>
    800072e4:	0009ba03          	ld	s4,0(s3)
    800072e8:	0009b783          	ld	a5,0(s3)
    800072ec:	00c12703          	lw	a4,12(sp)
    800072f0:	414787b3          	sub	a5,a5,s4
    800072f4:	04e7fc63          	bgeu	a5,a4,8000734c <sys_sleep+0xc0>
    800072f8:	00420a97          	auipc	s5,0x420
    800072fc:	170a8a93          	add	s5,s5,368 # 80427468 <current_proc>
    80007300:	00400b13          	li	s6,4
    80007304:	00100493          	li	s1,1
    80007308:	000ab903          	ld	s2,0(s5)
    8000730c:	02892783          	lw	a5,40(s2)
    80007310:	06079863          	bnez	a5,80007380 <sys_sleep+0xf4>
    80007314:	0f50000f          	fence	iorw,ow
    80007318:	0804202f          	amoswap.w	zero,zero,(s0)
    8000731c:	0c893823          	sd	s0,208(s2)
    80007320:	01692223          	sw	s6,4(s2)
    80007324:	87dff0ef          	jal	80006ba0 <yield>
    80007328:	0c093823          	sd	zero,208(s2)
    8000732c:	00048793          	mv	a5,s1
    80007330:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80007334:	0007879b          	sext.w	a5,a5
    80007338:	fe079ae3          	bnez	a5,8000732c <sys_sleep+0xa0>
    8000733c:	0009b783          	ld	a5,0(s3)
    80007340:	00c12703          	lw	a4,12(sp)
    80007344:	414787b3          	sub	a5,a5,s4
    80007348:	fce7e0e3          	bltu	a5,a4,80007308 <sys_sleep+0x7c>
    8000734c:	0f50000f          	fence	iorw,ow
    80007350:	0804202f          	amoswap.w	zero,zero,(s0)
    80007354:	00000513          	li	a0,0
    80007358:	04813083          	ld	ra,72(sp)
    8000735c:	04013403          	ld	s0,64(sp)
    80007360:	03813483          	ld	s1,56(sp)
    80007364:	03013903          	ld	s2,48(sp)
    80007368:	02813983          	ld	s3,40(sp)
    8000736c:	02013a03          	ld	s4,32(sp)
    80007370:	01813a83          	ld	s5,24(sp)
    80007374:	01013b03          	ld	s6,16(sp)
    80007378:	05010113          	add	sp,sp,80
    8000737c:	00008067          	ret
    80007380:	0f50000f          	fence	iorw,ow
    80007384:	0804202f          	amoswap.w	zero,zero,(s0)
    80007388:	fff00513          	li	a0,-1
    8000738c:	fcdff06f          	j	80007358 <sys_sleep+0xcc>

0000000080007390 <sys_read>:
    80007390:	fff00513          	li	a0,-1
    80007394:	00008067          	ret

0000000080007398 <sys_write>:
    80007398:	fff00513          	li	a0,-1
    8000739c:	00008067          	ret

00000000800073a0 <sys_open>:
    800073a0:	fff00513          	li	a0,-1
    800073a4:	00008067          	ret

00000000800073a8 <sys_close>:
    800073a8:	fff00513          	li	a0,-1
    800073ac:	00008067          	ret

00000000800073b0 <sys_pipe>:
    800073b0:	fff00513          	li	a0,-1
    800073b4:	00008067          	ret

00000000800073b8 <sys_kill>:
    800073b8:	fff00513          	li	a0,-1
    800073bc:	00008067          	ret

00000000800073c0 <sys_exec>:
    800073c0:	fff00513          	li	a0,-1
    800073c4:	00008067          	ret

00000000800073c8 <sys_fstat>:
    800073c8:	fff00513          	li	a0,-1
    800073cc:	00008067          	ret

00000000800073d0 <sys_chdir>:
    800073d0:	fff00513          	li	a0,-1
    800073d4:	00008067          	ret

00000000800073d8 <sys_dup>:
    800073d8:	fff00513          	li	a0,-1
    800073dc:	00008067          	ret

00000000800073e0 <sys_mknod>:
    800073e0:	fff00513          	li	a0,-1
    800073e4:	00008067          	ret

00000000800073e8 <sys_unlink>:
    800073e8:	fff00513          	li	a0,-1
    800073ec:	00008067          	ret

00000000800073f0 <sys_link>:
    800073f0:	fff00513          	li	a0,-1
    800073f4:	00008067          	ret

00000000800073f8 <sys_mkdir>:
    800073f8:	fff00513          	li	a0,-1
    800073fc:	00008067          	ret

0000000080007400 <fetchaddr>:
    80007400:	fe010113          	add	sp,sp,-32
    80007404:	00813823          	sd	s0,16(sp)
    80007408:	00913423          	sd	s1,8(sp)
    8000740c:	00113c23          	sd	ra,24(sp)
    80007410:	00050413          	mv	s0,a0
    80007414:	00058493          	mv	s1,a1
    80007418:	cd4ff0ef          	jal	800068ec <myproc>
    8000741c:	03853783          	ld	a5,56(a0)
    80007420:	02f47e63          	bgeu	s0,a5,8000745c <fetchaddr+0x5c>
    80007424:	00840713          	add	a4,s0,8
    80007428:	02e7ea63          	bltu	a5,a4,8000745c <fetchaddr+0x5c>
    8000742c:	03053503          	ld	a0,48(a0)
    80007430:	00800693          	li	a3,8
    80007434:	00040613          	mv	a2,s0
    80007438:	00048593          	mv	a1,s1
    8000743c:	b25fd0ef          	jal	80004f60 <copyin>
    80007440:	00a03533          	snez	a0,a0
    80007444:	40a00533          	neg	a0,a0
    80007448:	01813083          	ld	ra,24(sp)
    8000744c:	01013403          	ld	s0,16(sp)
    80007450:	00813483          	ld	s1,8(sp)
    80007454:	02010113          	add	sp,sp,32
    80007458:	00008067          	ret
    8000745c:	fff00513          	li	a0,-1
    80007460:	fe9ff06f          	j	80007448 <fetchaddr+0x48>

0000000080007464 <fetchstr>:
    80007464:	fe010113          	add	sp,sp,-32
    80007468:	00813823          	sd	s0,16(sp)
    8000746c:	00913423          	sd	s1,8(sp)
    80007470:	01213023          	sd	s2,0(sp)
    80007474:	00113c23          	sd	ra,24(sp)
    80007478:	00060913          	mv	s2,a2
    8000747c:	00050493          	mv	s1,a0
    80007480:	00058413          	mv	s0,a1
    80007484:	c68ff0ef          	jal	800068ec <myproc>
    80007488:	03053503          	ld	a0,48(a0)
    8000748c:	00090693          	mv	a3,s2
    80007490:	00048613          	mv	a2,s1
    80007494:	00040593          	mv	a1,s0
    80007498:	c54fe0ef          	jal	800058ec <copyinstr>
    8000749c:	02054063          	bltz	a0,800074bc <fetchstr+0x58>
    800074a0:	00040513          	mv	a0,s0
    800074a4:	01013403          	ld	s0,16(sp)
    800074a8:	01813083          	ld	ra,24(sp)
    800074ac:	00813483          	ld	s1,8(sp)
    800074b0:	00013903          	ld	s2,0(sp)
    800074b4:	02010113          	add	sp,sp,32
    800074b8:	8a4ff06f          	j	8000655c <strlen>
    800074bc:	01813083          	ld	ra,24(sp)
    800074c0:	01013403          	ld	s0,16(sp)
    800074c4:	00813483          	ld	s1,8(sp)
    800074c8:	00013903          	ld	s2,0(sp)
    800074cc:	fff00513          	li	a0,-1
    800074d0:	02010113          	add	sp,sp,32
    800074d4:	00008067          	ret

00000000800074d8 <argint>:
    800074d8:	fe010113          	add	sp,sp,-32
    800074dc:	00813823          	sd	s0,16(sp)
    800074e0:	00913423          	sd	s1,8(sp)
    800074e4:	00113c23          	sd	ra,24(sp)
    800074e8:	00050413          	mv	s0,a0
    800074ec:	00058493          	mv	s1,a1
    800074f0:	bfcff0ef          	jal	800068ec <myproc>
    800074f4:	00500793          	li	a5,5
    800074f8:	0e87ec63          	bltu	a5,s0,800075f0 <argint+0x118>
    800074fc:	00006717          	auipc	a4,0x6
    80007500:	87470713          	add	a4,a4,-1932 # 8000cd70 <digits+0xe68>
    80007504:	00241413          	sll	s0,s0,0x2
    80007508:	00e40433          	add	s0,s0,a4
    8000750c:	00042783          	lw	a5,0(s0)
    80007510:	00e787b3          	add	a5,a5,a4
    80007514:	00078067          	jr	a5
    80007518:	04853783          	ld	a5,72(a0)
    8000751c:	0907a783          	lw	a5,144(a5)
    80007520:	01813083          	ld	ra,24(sp)
    80007524:	01013403          	ld	s0,16(sp)
    80007528:	00f4a023          	sw	a5,0(s1)
    8000752c:	00000513          	li	a0,0
    80007530:	00813483          	ld	s1,8(sp)
    80007534:	02010113          	add	sp,sp,32
    80007538:	00008067          	ret
    8000753c:	04853783          	ld	a5,72(a0)
    80007540:	01813083          	ld	ra,24(sp)
    80007544:	01013403          	ld	s0,16(sp)
    80007548:	0987a783          	lw	a5,152(a5)
    8000754c:	00000513          	li	a0,0
    80007550:	00f4a023          	sw	a5,0(s1)
    80007554:	00813483          	ld	s1,8(sp)
    80007558:	02010113          	add	sp,sp,32
    8000755c:	00008067          	ret
    80007560:	04853783          	ld	a5,72(a0)
    80007564:	01813083          	ld	ra,24(sp)
    80007568:	01013403          	ld	s0,16(sp)
    8000756c:	0707a783          	lw	a5,112(a5)
    80007570:	00000513          	li	a0,0
    80007574:	00f4a023          	sw	a5,0(s1)
    80007578:	00813483          	ld	s1,8(sp)
    8000757c:	02010113          	add	sp,sp,32
    80007580:	00008067          	ret
    80007584:	04853783          	ld	a5,72(a0)
    80007588:	01813083          	ld	ra,24(sp)
    8000758c:	01013403          	ld	s0,16(sp)
    80007590:	0787a783          	lw	a5,120(a5)
    80007594:	00000513          	li	a0,0
    80007598:	00f4a023          	sw	a5,0(s1)
    8000759c:	00813483          	ld	s1,8(sp)
    800075a0:	02010113          	add	sp,sp,32
    800075a4:	00008067          	ret
    800075a8:	04853783          	ld	a5,72(a0)
    800075ac:	01813083          	ld	ra,24(sp)
    800075b0:	01013403          	ld	s0,16(sp)
    800075b4:	0807a783          	lw	a5,128(a5)
    800075b8:	00000513          	li	a0,0
    800075bc:	00f4a023          	sw	a5,0(s1)
    800075c0:	00813483          	ld	s1,8(sp)
    800075c4:	02010113          	add	sp,sp,32
    800075c8:	00008067          	ret
    800075cc:	04853783          	ld	a5,72(a0)
    800075d0:	01813083          	ld	ra,24(sp)
    800075d4:	01013403          	ld	s0,16(sp)
    800075d8:	0887a783          	lw	a5,136(a5)
    800075dc:	00000513          	li	a0,0
    800075e0:	00f4a023          	sw	a5,0(s1)
    800075e4:	00813483          	ld	s1,8(sp)
    800075e8:	02010113          	add	sp,sp,32
    800075ec:	00008067          	ret
    800075f0:	fff00793          	li	a5,-1
    800075f4:	f2dff06f          	j	80007520 <argint+0x48>

00000000800075f8 <argaddr>:
    800075f8:	fe010113          	add	sp,sp,-32
    800075fc:	00813823          	sd	s0,16(sp)
    80007600:	00913423          	sd	s1,8(sp)
    80007604:	00113c23          	sd	ra,24(sp)
    80007608:	00050413          	mv	s0,a0
    8000760c:	00058493          	mv	s1,a1
    80007610:	adcff0ef          	jal	800068ec <myproc>
    80007614:	00500793          	li	a5,5
    80007618:	0e87ec63          	bltu	a5,s0,80007710 <argaddr+0x118>
    8000761c:	00005717          	auipc	a4,0x5
    80007620:	76c70713          	add	a4,a4,1900 # 8000cd88 <digits+0xe80>
    80007624:	00241413          	sll	s0,s0,0x2
    80007628:	00e40433          	add	s0,s0,a4
    8000762c:	00042783          	lw	a5,0(s0)
    80007630:	00e787b3          	add	a5,a5,a4
    80007634:	00078067          	jr	a5
    80007638:	04853783          	ld	a5,72(a0)
    8000763c:	0907b783          	ld	a5,144(a5)
    80007640:	01813083          	ld	ra,24(sp)
    80007644:	01013403          	ld	s0,16(sp)
    80007648:	00f4b023          	sd	a5,0(s1)
    8000764c:	00000513          	li	a0,0
    80007650:	00813483          	ld	s1,8(sp)
    80007654:	02010113          	add	sp,sp,32
    80007658:	00008067          	ret
    8000765c:	04853783          	ld	a5,72(a0)
    80007660:	01813083          	ld	ra,24(sp)
    80007664:	01013403          	ld	s0,16(sp)
    80007668:	0987b783          	ld	a5,152(a5)
    8000766c:	00000513          	li	a0,0
    80007670:	00f4b023          	sd	a5,0(s1)
    80007674:	00813483          	ld	s1,8(sp)
    80007678:	02010113          	add	sp,sp,32
    8000767c:	00008067          	ret
    80007680:	04853783          	ld	a5,72(a0)
    80007684:	01813083          	ld	ra,24(sp)
    80007688:	01013403          	ld	s0,16(sp)
    8000768c:	0707b783          	ld	a5,112(a5)
    80007690:	00000513          	li	a0,0
    80007694:	00f4b023          	sd	a5,0(s1)
    80007698:	00813483          	ld	s1,8(sp)
    8000769c:	02010113          	add	sp,sp,32
    800076a0:	00008067          	ret
    800076a4:	04853783          	ld	a5,72(a0)
    800076a8:	01813083          	ld	ra,24(sp)
    800076ac:	01013403          	ld	s0,16(sp)
    800076b0:	0787b783          	ld	a5,120(a5)
    800076b4:	00000513          	li	a0,0
    800076b8:	00f4b023          	sd	a5,0(s1)
    800076bc:	00813483          	ld	s1,8(sp)
    800076c0:	02010113          	add	sp,sp,32
    800076c4:	00008067          	ret
    800076c8:	04853783          	ld	a5,72(a0)
    800076cc:	01813083          	ld	ra,24(sp)
    800076d0:	01013403          	ld	s0,16(sp)
    800076d4:	0807b783          	ld	a5,128(a5)
    800076d8:	00000513          	li	a0,0
    800076dc:	00f4b023          	sd	a5,0(s1)
    800076e0:	00813483          	ld	s1,8(sp)
    800076e4:	02010113          	add	sp,sp,32
    800076e8:	00008067          	ret
    800076ec:	04853783          	ld	a5,72(a0)
    800076f0:	01813083          	ld	ra,24(sp)
    800076f4:	01013403          	ld	s0,16(sp)
    800076f8:	0887b783          	ld	a5,136(a5)
    800076fc:	00000513          	li	a0,0
    80007700:	00f4b023          	sd	a5,0(s1)
    80007704:	00813483          	ld	s1,8(sp)
    80007708:	02010113          	add	sp,sp,32
    8000770c:	00008067          	ret
    80007710:	fff00793          	li	a5,-1
    80007714:	f2dff06f          	j	80007640 <argaddr+0x48>

0000000080007718 <argstr>:
    80007718:	fe010113          	add	sp,sp,-32
    8000771c:	00813823          	sd	s0,16(sp)
    80007720:	00913423          	sd	s1,8(sp)
    80007724:	01213023          	sd	s2,0(sp)
    80007728:	00113c23          	sd	ra,24(sp)
    8000772c:	00050413          	mv	s0,a0
    80007730:	00058493          	mv	s1,a1
    80007734:	00060913          	mv	s2,a2
    80007738:	9b4ff0ef          	jal	800068ec <myproc>
    8000773c:	00500793          	li	a5,5
    80007740:	0a87ec63          	bltu	a5,s0,800077f8 <argstr+0xe0>
    80007744:	00005717          	auipc	a4,0x5
    80007748:	65c70713          	add	a4,a4,1628 # 8000cda0 <digits+0xe98>
    8000774c:	00241413          	sll	s0,s0,0x2
    80007750:	00e40433          	add	s0,s0,a4
    80007754:	00042783          	lw	a5,0(s0)
    80007758:	00e787b3          	add	a5,a5,a4
    8000775c:	00078067          	jr	a5
    80007760:	04853783          	ld	a5,72(a0)
    80007764:	0907b403          	ld	s0,144(a5)
    80007768:	984ff0ef          	jal	800068ec <myproc>
    8000776c:	03053503          	ld	a0,48(a0)
    80007770:	00090693          	mv	a3,s2
    80007774:	00040613          	mv	a2,s0
    80007778:	00048593          	mv	a1,s1
    8000777c:	970fe0ef          	jal	800058ec <copyinstr>
    80007780:	04054e63          	bltz	a0,800077dc <argstr+0xc4>
    80007784:	01013403          	ld	s0,16(sp)
    80007788:	01813083          	ld	ra,24(sp)
    8000778c:	00013903          	ld	s2,0(sp)
    80007790:	00048513          	mv	a0,s1
    80007794:	00813483          	ld	s1,8(sp)
    80007798:	02010113          	add	sp,sp,32
    8000779c:	dc1fe06f          	j	8000655c <strlen>
    800077a0:	04853783          	ld	a5,72(a0)
    800077a4:	0987b403          	ld	s0,152(a5)
    800077a8:	fc1ff06f          	j	80007768 <argstr+0x50>
    800077ac:	04853783          	ld	a5,72(a0)
    800077b0:	0707b403          	ld	s0,112(a5)
    800077b4:	fb5ff06f          	j	80007768 <argstr+0x50>
    800077b8:	04853783          	ld	a5,72(a0)
    800077bc:	0787b403          	ld	s0,120(a5)
    800077c0:	fa9ff06f          	j	80007768 <argstr+0x50>
    800077c4:	04853783          	ld	a5,72(a0)
    800077c8:	0807b403          	ld	s0,128(a5)
    800077cc:	f9dff06f          	j	80007768 <argstr+0x50>
    800077d0:	04853783          	ld	a5,72(a0)
    800077d4:	0887b403          	ld	s0,136(a5)
    800077d8:	f91ff06f          	j	80007768 <argstr+0x50>
    800077dc:	01813083          	ld	ra,24(sp)
    800077e0:	01013403          	ld	s0,16(sp)
    800077e4:	00813483          	ld	s1,8(sp)
    800077e8:	00013903          	ld	s2,0(sp)
    800077ec:	fff00513          	li	a0,-1
    800077f0:	02010113          	add	sp,sp,32
    800077f4:	00008067          	ret
    800077f8:	fff00413          	li	s0,-1
    800077fc:	f6dff06f          	j	80007768 <argstr+0x50>

0000000080007800 <syscall>:
    80007800:	fe010113          	add	sp,sp,-32
    80007804:	00813823          	sd	s0,16(sp)
    80007808:	00913423          	sd	s1,8(sp)
    8000780c:	00113c23          	sd	ra,24(sp)
    80007810:	8dcff0ef          	jal	800068ec <myproc>
    80007814:	04853483          	ld	s1,72(a0)
    80007818:	01400793          	li	a5,20
    8000781c:	00050413          	mv	s0,a0
    80007820:	0a84b683          	ld	a3,168(s1)
    80007824:	fff6871b          	addw	a4,a3,-1
    80007828:	0006869b          	sext.w	a3,a3
    8000782c:	02e7ec63          	bltu	a5,a4,80007864 <syscall+0x64>
    80007830:	00369713          	sll	a4,a3,0x3
    80007834:	00005797          	auipc	a5,0x5
    80007838:	58478793          	add	a5,a5,1412 # 8000cdb8 <syscalls>
    8000783c:	00e787b3          	add	a5,a5,a4
    80007840:	0007b783          	ld	a5,0(a5)
    80007844:	02078063          	beqz	a5,80007864 <syscall+0x64>
    80007848:	000780e7          	jalr	a5
    8000784c:	01813083          	ld	ra,24(sp)
    80007850:	01013403          	ld	s0,16(sp)
    80007854:	06a4b823          	sd	a0,112(s1)
    80007858:	00813483          	ld	s1,8(sp)
    8000785c:	02010113          	add	sp,sp,32
    80007860:	00008067          	ret
    80007864:	00842583          	lw	a1,8(s0)
    80007868:	01440613          	add	a2,s0,20
    8000786c:	00005517          	auipc	a0,0x5
    80007870:	5fc50513          	add	a0,a0,1532 # 8000ce68 <syscalls+0xb0>
    80007874:	ef8fb0ef          	jal	80002f6c <printf>
    80007878:	04843783          	ld	a5,72(s0)
    8000787c:	01813083          	ld	ra,24(sp)
    80007880:	01013403          	ld	s0,16(sp)
    80007884:	fff00713          	li	a4,-1
    80007888:	06e7b823          	sd	a4,112(a5)
    8000788c:	00813483          	ld	s1,8(sp)
    80007890:	02010113          	add	sp,sp,32
    80007894:	00008067          	ret
	...

00000000800078a0 <machinevec>:
    800078a0:	f0810113          	add	sp,sp,-248
    800078a4:	00113023          	sd	ra,0(sp)
    800078a8:	00313823          	sd	gp,16(sp)
    800078ac:	00413c23          	sd	tp,24(sp)
    800078b0:	02513023          	sd	t0,32(sp)
    800078b4:	02613423          	sd	t1,40(sp)
    800078b8:	02713823          	sd	t2,48(sp)
    800078bc:	02813c23          	sd	s0,56(sp)
    800078c0:	04913023          	sd	s1,64(sp)
    800078c4:	04a13423          	sd	a0,72(sp)
    800078c8:	04b13823          	sd	a1,80(sp)
    800078cc:	04c13c23          	sd	a2,88(sp)
    800078d0:	06d13023          	sd	a3,96(sp)
    800078d4:	06e13423          	sd	a4,104(sp)
    800078d8:	06f13823          	sd	a5,112(sp)
    800078dc:	07013c23          	sd	a6,120(sp)
    800078e0:	09113023          	sd	a7,128(sp)
    800078e4:	09213423          	sd	s2,136(sp)
    800078e8:	09313823          	sd	s3,144(sp)
    800078ec:	09413c23          	sd	s4,152(sp)
    800078f0:	0b513023          	sd	s5,160(sp)
    800078f4:	0b613423          	sd	s6,168(sp)
    800078f8:	0b713823          	sd	s7,176(sp)
    800078fc:	0b813c23          	sd	s8,184(sp)
    80007900:	0d913023          	sd	s9,192(sp)
    80007904:	0da13423          	sd	s10,200(sp)
    80007908:	0db13823          	sd	s11,208(sp)
    8000790c:	0dc13c23          	sd	t3,216(sp)
    80007910:	0fd13023          	sd	t4,224(sp)
    80007914:	0fe13423          	sd	t5,232(sp)
    80007918:	0ff13823          	sd	t6,240(sp)
    8000791c:	0f810293          	add	t0,sp,248
    80007920:	00513423          	sd	t0,8(sp)
    80007924:	34202573          	csrr	a0,mcause
    80007928:	fff0029b          	addw	t0,zero,-1
    8000792c:	03f29293          	sll	t0,t0,0x3f
    80007930:	00728293          	add	t0,t0,7
    80007934:	00551663          	bne	a0,t0,80007940 <interrupt_return>
    80007938:	994fe0ef          	jal	80005acc <machine_timer_handler>
    8000793c:	0040006f          	j	80007940 <interrupt_return>

0000000080007940 <interrupt_return>:
    80007940:	00013083          	ld	ra,0(sp)
    80007944:	01013183          	ld	gp,16(sp)
    80007948:	01813203          	ld	tp,24(sp)
    8000794c:	02013283          	ld	t0,32(sp)
    80007950:	02813303          	ld	t1,40(sp)
    80007954:	03013383          	ld	t2,48(sp)
    80007958:	03813403          	ld	s0,56(sp)
    8000795c:	04013483          	ld	s1,64(sp)
    80007960:	04813503          	ld	a0,72(sp)
    80007964:	05013583          	ld	a1,80(sp)
    80007968:	05813603          	ld	a2,88(sp)
    8000796c:	06013683          	ld	a3,96(sp)
    80007970:	06813703          	ld	a4,104(sp)
    80007974:	07013783          	ld	a5,112(sp)
    80007978:	07813803          	ld	a6,120(sp)
    8000797c:	08013883          	ld	a7,128(sp)
    80007980:	08813903          	ld	s2,136(sp)
    80007984:	09013983          	ld	s3,144(sp)
    80007988:	09813a03          	ld	s4,152(sp)
    8000798c:	0a013a83          	ld	s5,160(sp)
    80007990:	0a813b03          	ld	s6,168(sp)
    80007994:	0b013b83          	ld	s7,176(sp)
    80007998:	0b813c03          	ld	s8,184(sp)
    8000799c:	0c013c83          	ld	s9,192(sp)
    800079a0:	0c813d03          	ld	s10,200(sp)
    800079a4:	0d013d83          	ld	s11,208(sp)
    800079a8:	0d813e03          	ld	t3,216(sp)
    800079ac:	0e013e83          	ld	t4,224(sp)
    800079b0:	0e813f03          	ld	t5,232(sp)
    800079b4:	0f013f83          	ld	t6,240(sp)
    800079b8:	00813103          	ld	sp,8(sp)
    800079bc:	30200073          	mret

00000000800079c0 <kernelvec>:
    800079c0:	ef010113          	add	sp,sp,-272
    800079c4:	00013023          	sd	zero,0(sp)
    800079c8:	00113423          	sd	ra,8(sp)
    800079cc:	00313c23          	sd	gp,24(sp)
    800079d0:	02413023          	sd	tp,32(sp)
    800079d4:	02513423          	sd	t0,40(sp)
    800079d8:	02613823          	sd	t1,48(sp)
    800079dc:	02713c23          	sd	t2,56(sp)
    800079e0:	04813023          	sd	s0,64(sp)
    800079e4:	04913423          	sd	s1,72(sp)
    800079e8:	04a13823          	sd	a0,80(sp)
    800079ec:	04b13c23          	sd	a1,88(sp)
    800079f0:	06c13023          	sd	a2,96(sp)
    800079f4:	06d13423          	sd	a3,104(sp)
    800079f8:	06e13823          	sd	a4,112(sp)
    800079fc:	06f13c23          	sd	a5,120(sp)
    80007a00:	09013023          	sd	a6,128(sp)
    80007a04:	09113423          	sd	a7,136(sp)
    80007a08:	09213823          	sd	s2,144(sp)
    80007a0c:	09313c23          	sd	s3,152(sp)
    80007a10:	0b413023          	sd	s4,160(sp)
    80007a14:	0b513423          	sd	s5,168(sp)
    80007a18:	0b613823          	sd	s6,176(sp)
    80007a1c:	0b713c23          	sd	s7,184(sp)
    80007a20:	0d813023          	sd	s8,192(sp)
    80007a24:	0d913423          	sd	s9,200(sp)
    80007a28:	0da13823          	sd	s10,208(sp)
    80007a2c:	0db13c23          	sd	s11,216(sp)
    80007a30:	0fc13023          	sd	t3,224(sp)
    80007a34:	0fd13423          	sd	t4,232(sp)
    80007a38:	0fe13823          	sd	t5,240(sp)
    80007a3c:	0ff13c23          	sd	t6,248(sp)
    80007a40:	11010293          	add	t0,sp,272
    80007a44:	00513823          	sd	t0,16(sp)
    80007a48:	141022f3          	csrr	t0,sepc
    80007a4c:	10513023          	sd	t0,256(sp)
    80007a50:	142022f3          	csrr	t0,scause
    80007a54:	10513423          	sd	t0,264(sp)
    80007a58:	971fe0ef          	jal	800063c8 <kerneltrap>
    80007a5c:	00813083          	ld	ra,8(sp)
    80007a60:	01813183          	ld	gp,24(sp)
    80007a64:	02013203          	ld	tp,32(sp)
    80007a68:	02813283          	ld	t0,40(sp)
    80007a6c:	03013303          	ld	t1,48(sp)
    80007a70:	03813383          	ld	t2,56(sp)
    80007a74:	04013403          	ld	s0,64(sp)
    80007a78:	04813483          	ld	s1,72(sp)
    80007a7c:	05013503          	ld	a0,80(sp)
    80007a80:	05813583          	ld	a1,88(sp)
    80007a84:	06013603          	ld	a2,96(sp)
    80007a88:	06813683          	ld	a3,104(sp)
    80007a8c:	07013703          	ld	a4,112(sp)
    80007a90:	07813783          	ld	a5,120(sp)
    80007a94:	08013803          	ld	a6,128(sp)
    80007a98:	08813883          	ld	a7,136(sp)
    80007a9c:	09013903          	ld	s2,144(sp)
    80007aa0:	09813983          	ld	s3,152(sp)
    80007aa4:	0a013a03          	ld	s4,160(sp)
    80007aa8:	0a813a83          	ld	s5,168(sp)
    80007aac:	0b013b03          	ld	s6,176(sp)
    80007ab0:	0b813b83          	ld	s7,184(sp)
    80007ab4:	0c013c03          	ld	s8,192(sp)
    80007ab8:	0c813c83          	ld	s9,200(sp)
    80007abc:	0d013d03          	ld	s10,208(sp)
    80007ac0:	0d813d83          	ld	s11,216(sp)
    80007ac4:	0e013e03          	ld	t3,224(sp)
    80007ac8:	0e813e83          	ld	t4,232(sp)
    80007acc:	0f013f03          	ld	t5,240(sp)
    80007ad0:	0f813f83          	ld	t6,248(sp)
    80007ad4:	10013283          	ld	t0,256(sp)
    80007ad8:	14129073          	csrw	sepc,t0
    80007adc:	10813283          	ld	t0,264(sp)
    80007ae0:	14229073          	csrw	scause,t0
    80007ae4:	01013103          	ld	sp,16(sp)
    80007ae8:	10200073          	sret
    80007aec:	0000                	.2byte	0x0
	...

0000000080007af0 <uservec>:
    80007af0:	100002b7          	lui	t0,0x10000
    80007af4:	05600313          	li	t1,86
    80007af8:	00628023          	sb	t1,0(t0) # 10000000 <_entry-0x70000000>
    80007afc:	14051573          	csrrw	a0,sscratch,a0
    80007b00:	02153423          	sd	ra,40(a0)
    80007b04:	02253823          	sd	sp,48(a0)
    80007b08:	02353c23          	sd	gp,56(a0)
    80007b0c:	04453023          	sd	tp,64(a0)
    80007b10:	04553423          	sd	t0,72(a0)
    80007b14:	04653823          	sd	t1,80(a0)
    80007b18:	04753c23          	sd	t2,88(a0)
    80007b1c:	06853023          	sd	s0,96(a0)
    80007b20:	06953423          	sd	s1,104(a0)
    80007b24:	06b53c23          	sd	a1,120(a0)
    80007b28:	08c53023          	sd	a2,128(a0)
    80007b2c:	08d53423          	sd	a3,136(a0)
    80007b30:	08e53823          	sd	a4,144(a0)
    80007b34:	08f53c23          	sd	a5,152(a0)
    80007b38:	0b053023          	sd	a6,160(a0)
    80007b3c:	0b153423          	sd	a7,168(a0)
    80007b40:	0b253823          	sd	s2,176(a0)
    80007b44:	0b353c23          	sd	s3,184(a0)
    80007b48:	0d453023          	sd	s4,192(a0)
    80007b4c:	0d553423          	sd	s5,200(a0)
    80007b50:	0d653823          	sd	s6,208(a0)
    80007b54:	0d753c23          	sd	s7,216(a0)
    80007b58:	0f853023          	sd	s8,224(a0)
    80007b5c:	0f953423          	sd	s9,232(a0)
    80007b60:	0fa53823          	sd	s10,240(a0)
    80007b64:	0fb53c23          	sd	s11,248(a0)
    80007b68:	11c53023          	sd	t3,256(a0)
    80007b6c:	11d53423          	sd	t4,264(a0)
    80007b70:	11e53823          	sd	t5,272(a0)
    80007b74:	11f53c23          	sd	t6,280(a0)
    80007b78:	140022f3          	csrr	t0,sscratch
    80007b7c:	06553823          	sd	t0,112(a0)
    80007b80:	00853103          	ld	sp,8(a0)
    80007b84:	02053203          	ld	tp,32(a0)
    80007b88:	01053283          	ld	t0,16(a0)
    80007b8c:	00053303          	ld	t1,0(a0)
    80007b90:	18031073          	csrw	satp,t1
    80007b94:	12000073          	sfence.vma
    80007b98:	00028067          	jr	t0

0000000080007b9c <userret>:
    80007b9c:	18051073          	csrw	satp,a0
    80007ba0:	12000073          	sfence.vma
    80007ba4:	14002573          	csrr	a0,sscratch
    80007ba8:	02853083          	ld	ra,40(a0)
    80007bac:	03053103          	ld	sp,48(a0)
    80007bb0:	03853183          	ld	gp,56(a0)
    80007bb4:	04053203          	ld	tp,64(a0)
    80007bb8:	04853283          	ld	t0,72(a0)
    80007bbc:	05053303          	ld	t1,80(a0)
    80007bc0:	05853383          	ld	t2,88(a0)
    80007bc4:	06053403          	ld	s0,96(a0)
    80007bc8:	06853483          	ld	s1,104(a0)
    80007bcc:	07853583          	ld	a1,120(a0)
    80007bd0:	08053603          	ld	a2,128(a0)
    80007bd4:	08853683          	ld	a3,136(a0)
    80007bd8:	09053703          	ld	a4,144(a0)
    80007bdc:	09853783          	ld	a5,152(a0)
    80007be0:	0a053803          	ld	a6,160(a0)
    80007be4:	0a853883          	ld	a7,168(a0)
    80007be8:	0b053903          	ld	s2,176(a0)
    80007bec:	0b853983          	ld	s3,184(a0)
    80007bf0:	0c053a03          	ld	s4,192(a0)
    80007bf4:	0c853a83          	ld	s5,200(a0)
    80007bf8:	0d053b03          	ld	s6,208(a0)
    80007bfc:	0d853b83          	ld	s7,216(a0)
    80007c00:	0e053c03          	ld	s8,224(a0)
    80007c04:	0e853c83          	ld	s9,232(a0)
    80007c08:	0f053d03          	ld	s10,240(a0)
    80007c0c:	0f853d83          	ld	s11,248(a0)
    80007c10:	10053e03          	ld	t3,256(a0)
    80007c14:	10853e83          	ld	t4,264(a0)
    80007c18:	11053f03          	ld	t5,272(a0)
    80007c1c:	11853f83          	ld	t6,280(a0)
    80007c20:	07053283          	ld	t0,112(a0)
    80007c24:	14051073          	csrw	sscratch,a0
    80007c28:	00028513          	mv	a0,t0
    80007c2c:	10200073          	sret
	...

0000000080007c40 <switch_context>:
    80007c40:	00153023          	sd	ra,0(a0)
    80007c44:	00253423          	sd	sp,8(a0)
    80007c48:	00853823          	sd	s0,16(a0)
    80007c4c:	00953c23          	sd	s1,24(a0)
    80007c50:	03253023          	sd	s2,32(a0)
    80007c54:	03353423          	sd	s3,40(a0)
    80007c58:	03453823          	sd	s4,48(a0)
    80007c5c:	03553c23          	sd	s5,56(a0)
    80007c60:	05653023          	sd	s6,64(a0)
    80007c64:	05753423          	sd	s7,72(a0)
    80007c68:	05853823          	sd	s8,80(a0)
    80007c6c:	05953c23          	sd	s9,88(a0)
    80007c70:	07a53023          	sd	s10,96(a0)
    80007c74:	07b53423          	sd	s11,104(a0)
    80007c78:	0005b083          	ld	ra,0(a1)
    80007c7c:	0085b103          	ld	sp,8(a1)
    80007c80:	0105b403          	ld	s0,16(a1)
    80007c84:	0185b483          	ld	s1,24(a1)
    80007c88:	0205b903          	ld	s2,32(a1)
    80007c8c:	0285b983          	ld	s3,40(a1)
    80007c90:	0305ba03          	ld	s4,48(a1)
    80007c94:	0385ba83          	ld	s5,56(a1)
    80007c98:	0405bb03          	ld	s6,64(a1)
    80007c9c:	0485bb83          	ld	s7,72(a1)
    80007ca0:	0505bc03          	ld	s8,80(a1)
    80007ca4:	0585bc83          	ld	s9,88(a1)
    80007ca8:	0605bd03          	ld	s10,96(a1)
    80007cac:	0685bd83          	ld	s11,104(a1)
    80007cb0:	00008067          	ret
	...

0000000080007cc0 <user_test_getpid>:
    80007cc0:	00b00893          	li	a7,11
    80007cc4:	00000073          	ecall
    80007cc8:	100002b7          	lui	t0,0x10000
    80007ccc:	05500313          	li	t1,85
    80007cd0:	00628023          	sb	t1,0(t0) # 10000000 <_entry-0x70000000>
    80007cd4:	04b00313          	li	t1,75
    80007cd8:	00628023          	sb	t1,0(t0)
    80007cdc:	00100073          	ebreak

0000000080007ce0 <user_test_uptime>:
    80007ce0:	00e00893          	li	a7,14
    80007ce4:	00000073          	ecall
    80007ce8:	ff9ff06f          	j	80007ce0 <user_test_uptime>

0000000080007cec <user_test_sbrk>:
    80007cec:	00c00893          	li	a7,12
    80007cf0:	40000513          	li	a0,1024
    80007cf4:	00000073          	ecall
    80007cf8:	ff5ff06f          	j	80007cec <user_test_sbrk>

0000000080007cfc <user_test_invalid>:
    80007cfc:	3e700893          	li	a7,999
    80007d00:	00000073          	ecall
    80007d04:	ff9ff06f          	j	80007cfc <user_test_invalid>

0000000080007d08 <user_test_end>:
    80007d08:	00000013          	nop
	...
