
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
    8000001c:	00007297          	auipc	t0,0x7
    80000020:	8a428293          	add	t0,t0,-1884 # 800068c0 <machinevec>
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
    80000064:	39030313          	add	t1,t1,912 # 804273f0 <bss_end>

0000000080000068 <bss_clear>:
    80000068:	00628863          	beq	t0,t1,80000078 <bss_done>
    8000006c:	0002b023          	sd	zero,0(t0)
    80000070:	00828293          	add	t0,t0,8
    80000074:	ff5ff06f          	j	80000068 <bss_clear>

0000000080000078 <bss_done>:
    80000078:	574020ef          	jal	800025ec <main>

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
    800000a0:	201050ef          	jal	80005aa0 <get_pid>
    800000a4:	00050913          	mv	s2,a0
    800000a8:	00000493          	li	s1,0
    800000ac:	00007a17          	auipc	s4,0x7
    800000b0:	f54a0a13          	add	s4,s4,-172 # 80007000 <rodata_start>
    800000b4:	69f40413          	add	s0,s0,1695 # 1869f <_entry-0x7ffe7961>
    800000b8:	00500993          	li	s3,5
    800000bc:	00048613          	mv	a2,s1
    800000c0:	00090593          	mv	a1,s2
    800000c4:	000a0513          	mv	a0,s4
    800000c8:	365020ef          	jal	80002c2c <printf>
    800000cc:	00012623          	sw	zero,12(sp)
    800000d0:	00c12783          	lw	a5,12(sp)
    800000d4:	00f44c63          	blt	s0,a5,800000ec <rr_worker+0x6c>
    800000d8:	00c12783          	lw	a5,12(sp)
    800000dc:	0017879b          	addw	a5,a5,1
    800000e0:	00f12623          	sw	a5,12(sp)
    800000e4:	00c12783          	lw	a5,12(sp)
    800000e8:	fef458e3          	bge	s0,a5,800000d8 <rr_worker+0x58>
    800000ec:	0014849b          	addw	s1,s1,1
    800000f0:	345050ef          	jal	80005c34 <yield>
    800000f4:	fd3494e3          	bne	s1,s3,800000bc <rr_worker+0x3c>
    800000f8:	00090593          	mv	a1,s2
    800000fc:	00007517          	auipc	a0,0x7
    80000100:	f2450513          	add	a0,a0,-220 # 80007020 <rodata_start+0x20>
    80000104:	329020ef          	jal	80002c2c <printf>
    80000108:	03013403          	ld	s0,48(sp)
    8000010c:	03813083          	ld	ra,56(sp)
    80000110:	02813483          	ld	s1,40(sp)
    80000114:	02013903          	ld	s2,32(sp)
    80000118:	01813983          	ld	s3,24(sp)
    8000011c:	01013a03          	ld	s4,16(sp)
    80000120:	00000513          	li	a0,0
    80000124:	04010113          	add	sp,sp,64
    80000128:	4a10506f          	j	80005dc8 <exit>

000000008000012c <test_sys_getpid>:
    8000012c:	fe010113          	add	sp,sp,-32
    80000130:	00007517          	auipc	a0,0x7
    80000134:	f1050513          	add	a0,a0,-240 # 80007040 <rodata_start+0x40>
    80000138:	00113c23          	sd	ra,24(sp)
    8000013c:	00813823          	sd	s0,16(sp)
    80000140:	00913423          	sd	s1,8(sp)
    80000144:	659020ef          	jal	80002f9c <uart_puts>
    80000148:	700050ef          	jal	80005848 <alloc_proc>
    8000014c:	08050663          	beqz	a0,800001d8 <test_sys_getpid+0xac>
    80000150:	00300793          	li	a5,3
    80000154:	00f52223          	sw	a5,4(a0)
    80000158:	00050413          	mv	s0,a0
    8000015c:	179050ef          	jal	80005ad4 <set_current_proc>
    80000160:	00842583          	lw	a1,8(s0)
    80000164:	00007517          	auipc	a0,0x7
    80000168:	f3450513          	add	a0,a0,-204 # 80007098 <rodata_start+0x98>
    8000016c:	2c1020ef          	jal	80002c2c <printf>
    80000170:	74d050ef          	jal	800060bc <sys_getpid>
    80000174:	00050593          	mv	a1,a0
    80000178:	00050493          	mv	s1,a0
    8000017c:	00007517          	auipc	a0,0x7
    80000180:	f2c50513          	add	a0,a0,-212 # 800070a8 <rodata_start+0xa8>
    80000184:	2a9020ef          	jal	80002c2c <printf>
    80000188:	00842783          	lw	a5,8(s0)
    8000018c:	02978e63          	beq	a5,s1,800001c8 <test_sys_getpid+0x9c>
    80000190:	00007517          	auipc	a0,0x7
    80000194:	f6050513          	add	a0,a0,-160 # 800070f0 <rodata_start+0xf0>
    80000198:	605020ef          	jal	80002f9c <uart_puts>
    8000019c:	00000513          	li	a0,0
    800001a0:	135050ef          	jal	80005ad4 <set_current_proc>
    800001a4:	00040513          	mv	a0,s0
    800001a8:	01d050ef          	jal	800059c4 <free_proc>
    800001ac:	01013403          	ld	s0,16(sp)
    800001b0:	01813083          	ld	ra,24(sp)
    800001b4:	00813483          	ld	s1,8(sp)
    800001b8:	00007517          	auipc	a0,0x7
    800001bc:	f6050513          	add	a0,a0,-160 # 80007118 <rodata_start+0x118>
    800001c0:	02010113          	add	sp,sp,32
    800001c4:	5d90206f          	j	80002f9c <uart_puts>
    800001c8:	00007517          	auipc	a0,0x7
    800001cc:	f0050513          	add	a0,a0,-256 # 800070c8 <rodata_start+0xc8>
    800001d0:	5cd020ef          	jal	80002f9c <uart_puts>
    800001d4:	fc9ff06f          	j	8000019c <test_sys_getpid+0x70>
    800001d8:	01013403          	ld	s0,16(sp)
    800001dc:	01813083          	ld	ra,24(sp)
    800001e0:	00813483          	ld	s1,8(sp)
    800001e4:	00007517          	auipc	a0,0x7
    800001e8:	e9c50513          	add	a0,a0,-356 # 80007080 <rodata_start+0x80>
    800001ec:	02010113          	add	sp,sp,32
    800001f0:	5ad0206f          	j	80002f9c <uart_puts>

00000000800001f4 <test_sys_uptime>:
    800001f4:	fd010113          	add	sp,sp,-48
    800001f8:	00007517          	auipc	a0,0x7
    800001fc:	f3850513          	add	a0,a0,-200 # 80007130 <rodata_start+0x130>
    80000200:	02113423          	sd	ra,40(sp)
    80000204:	02813023          	sd	s0,32(sp)
    80000208:	00913c23          	sd	s1,24(sp)
    8000020c:	01213823          	sd	s2,16(sp)
    80000210:	58d020ef          	jal	80002f9c <uart_puts>
    80000214:	634050ef          	jal	80005848 <alloc_proc>
    80000218:	0a050e63          	beqz	a0,800002d4 <test_sys_uptime+0xe0>
    8000021c:	00300793          	li	a5,3
    80000220:	00f52223          	sw	a5,4(a0)
    80000224:	00050413          	mv	s0,a0
    80000228:	0ad050ef          	jal	80005ad4 <set_current_proc>
    8000022c:	050060ef          	jal	8000627c <sys_uptime>
    80000230:	00050593          	mv	a1,a0
    80000234:	00050913          	mv	s2,a0
    80000238:	00007517          	auipc	a0,0x7
    8000023c:	f3850513          	add	a0,a0,-200 # 80007170 <rodata_start+0x170>
    80000240:	1ed020ef          	jal	80002c2c <printf>
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
    8000026c:	010060ef          	jal	8000627c <sys_uptime>
    80000270:	00050493          	mv	s1,a0
    80000274:	00050593          	mv	a1,a0
    80000278:	00007517          	auipc	a0,0x7
    8000027c:	f1850513          	add	a0,a0,-232 # 80007190 <rodata_start+0x190>
    80000280:	1ad020ef          	jal	80002c2c <printf>
    80000284:	0524f063          	bgeu	s1,s2,800002c4 <test_sys_uptime+0xd0>
    80000288:	00007517          	auipc	a0,0x7
    8000028c:	f5850513          	add	a0,a0,-168 # 800071e0 <rodata_start+0x1e0>
    80000290:	50d020ef          	jal	80002f9c <uart_puts>
    80000294:	00000513          	li	a0,0
    80000298:	03d050ef          	jal	80005ad4 <set_current_proc>
    8000029c:	00040513          	mv	a0,s0
    800002a0:	724050ef          	jal	800059c4 <free_proc>
    800002a4:	02013403          	ld	s0,32(sp)
    800002a8:	02813083          	ld	ra,40(sp)
    800002ac:	01813483          	ld	s1,24(sp)
    800002b0:	01013903          	ld	s2,16(sp)
    800002b4:	00007517          	auipc	a0,0x7
    800002b8:	f4c50513          	add	a0,a0,-180 # 80007200 <rodata_start+0x200>
    800002bc:	03010113          	add	sp,sp,48
    800002c0:	4dd0206f          	j	80002f9c <uart_puts>
    800002c4:	00007517          	auipc	a0,0x7
    800002c8:	eec50513          	add	a0,a0,-276 # 800071b0 <rodata_start+0x1b0>
    800002cc:	4d1020ef          	jal	80002f9c <uart_puts>
    800002d0:	fc5ff06f          	j	80000294 <test_sys_uptime+0xa0>
    800002d4:	02013403          	ld	s0,32(sp)
    800002d8:	02813083          	ld	ra,40(sp)
    800002dc:	01813483          	ld	s1,24(sp)
    800002e0:	01013903          	ld	s2,16(sp)
    800002e4:	00007517          	auipc	a0,0x7
    800002e8:	d9c50513          	add	a0,a0,-612 # 80007080 <rodata_start+0x80>
    800002ec:	03010113          	add	sp,sp,48
    800002f0:	4ad0206f          	j	80002f9c <uart_puts>

00000000800002f4 <test_sys_fork>:
    800002f4:	fe010113          	add	sp,sp,-32
    800002f8:	00007517          	auipc	a0,0x7
    800002fc:	f2050513          	add	a0,a0,-224 # 80007218 <rodata_start+0x218>
    80000300:	00113c23          	sd	ra,24(sp)
    80000304:	00813823          	sd	s0,16(sp)
    80000308:	00913423          	sd	s1,8(sp)
    8000030c:	491020ef          	jal	80002f9c <uart_puts>
    80000310:	538050ef          	jal	80005848 <alloc_proc>
    80000314:	0e050463          	beqz	a0,800003fc <test_sys_fork+0x108>
    80000318:	00300793          	li	a5,3
    8000031c:	00f52223          	sw	a5,4(a0)
    80000320:	00050413          	mv	s0,a0
    80000324:	7b0050ef          	jal	80005ad4 <set_current_proc>
    80000328:	00842583          	lw	a1,8(s0)
    8000032c:	00007517          	auipc	a0,0x7
    80000330:	f4450513          	add	a0,a0,-188 # 80007270 <rodata_start+0x270>
    80000334:	0f9020ef          	jal	80002c2c <printf>
    80000338:	595050ef          	jal	800060cc <sys_fork>
    8000033c:	0005049b          	sext.w	s1,a0
    80000340:	04904063          	bgtz	s1,80000380 <test_sys_fork+0x8c>
    80000344:	08049c63          	bnez	s1,800003dc <test_sys_fork+0xe8>
    80000348:	00007517          	auipc	a0,0x7
    8000034c:	03850513          	add	a0,a0,56 # 80007380 <rodata_start+0x380>
    80000350:	44d020ef          	jal	80002f9c <uart_puts>
    80000354:	00000513          	li	a0,0
    80000358:	77c050ef          	jal	80005ad4 <set_current_proc>
    8000035c:	00040513          	mv	a0,s0
    80000360:	664050ef          	jal	800059c4 <free_proc>
    80000364:	01013403          	ld	s0,16(sp)
    80000368:	01813083          	ld	ra,24(sp)
    8000036c:	00813483          	ld	s1,8(sp)
    80000370:	00007517          	auipc	a0,0x7
    80000374:	06050513          	add	a0,a0,96 # 800073d0 <rodata_start+0x3d0>
    80000378:	02010113          	add	sp,sp,32
    8000037c:	4210206f          	j	80002f9c <uart_puts>
    80000380:	00048593          	mv	a1,s1
    80000384:	00007517          	auipc	a0,0x7
    80000388:	f0450513          	add	a0,a0,-252 # 80007288 <rodata_start+0x288>
    8000038c:	0a1020ef          	jal	80002c2c <printf>
    80000390:	00048513          	mv	a0,s1
    80000394:	63c050ef          	jal	800059d0 <find_proc>
    80000398:	00050493          	mv	s1,a0
    8000039c:	08050663          	beqz	a0,80000428 <test_sys_fork+0x134>
    800003a0:	00c52583          	lw	a1,12(a0)
    800003a4:	00842603          	lw	a2,8(s0)
    800003a8:	04c58263          	beq	a1,a2,800003ec <test_sys_fork+0xf8>
    800003ac:	00007517          	auipc	a0,0x7
    800003b0:	f3450513          	add	a0,a0,-204 # 800072e0 <rodata_start+0x2e0>
    800003b4:	079020ef          	jal	80002c2c <printf>
    800003b8:	0044a583          	lw	a1,4(s1)
    800003bc:	00200793          	li	a5,2
    800003c0:	04f58c63          	beq	a1,a5,80000418 <test_sys_fork+0x124>
    800003c4:	00007517          	auipc	a0,0x7
    800003c8:	f7c50513          	add	a0,a0,-132 # 80007340 <rodata_start+0x340>
    800003cc:	061020ef          	jal	80002c2c <printf>
    800003d0:	00048513          	mv	a0,s1
    800003d4:	5f0050ef          	jal	800059c4 <free_proc>
    800003d8:	f7dff06f          	j	80000354 <test_sys_fork+0x60>
    800003dc:	00007517          	auipc	a0,0x7
    800003e0:	fdc50513          	add	a0,a0,-36 # 800073b8 <rodata_start+0x3b8>
    800003e4:	3b9020ef          	jal	80002f9c <uart_puts>
    800003e8:	f6dff06f          	j	80000354 <test_sys_fork+0x60>
    800003ec:	00007517          	auipc	a0,0x7
    800003f0:	ecc50513          	add	a0,a0,-308 # 800072b8 <rodata_start+0x2b8>
    800003f4:	3a9020ef          	jal	80002f9c <uart_puts>
    800003f8:	fc1ff06f          	j	800003b8 <test_sys_fork+0xc4>
    800003fc:	01013403          	ld	s0,16(sp)
    80000400:	01813083          	ld	ra,24(sp)
    80000404:	00813483          	ld	s1,8(sp)
    80000408:	00007517          	auipc	a0,0x7
    8000040c:	e4850513          	add	a0,a0,-440 # 80007250 <rodata_start+0x250>
    80000410:	02010113          	add	sp,sp,32
    80000414:	3890206f          	j	80002f9c <uart_puts>
    80000418:	00007517          	auipc	a0,0x7
    8000041c:	f0050513          	add	a0,a0,-256 # 80007318 <rodata_start+0x318>
    80000420:	37d020ef          	jal	80002f9c <uart_puts>
    80000424:	fadff06f          	j	800003d0 <test_sys_fork+0xdc>
    80000428:	00007517          	auipc	a0,0x7
    8000042c:	f3850513          	add	a0,a0,-200 # 80007360 <rodata_start+0x360>
    80000430:	36d020ef          	jal	80002f9c <uart_puts>
    80000434:	f21ff06f          	j	80000354 <test_sys_fork+0x60>

0000000080000438 <test_sys_sbrk>:
    80000438:	fe010113          	add	sp,sp,-32
    8000043c:	00007517          	auipc	a0,0x7
    80000440:	fac50513          	add	a0,a0,-84 # 800073e8 <rodata_start+0x3e8>
    80000444:	00113c23          	sd	ra,24(sp)
    80000448:	00813823          	sd	s0,16(sp)
    8000044c:	00913423          	sd	s1,8(sp)
    80000450:	01213023          	sd	s2,0(sp)
    80000454:	349020ef          	jal	80002f9c <uart_puts>
    80000458:	3f0050ef          	jal	80005848 <alloc_proc>
    8000045c:	12050063          	beqz	a0,8000057c <test_sys_sbrk+0x144>
    80000460:	00300793          	li	a5,3
    80000464:	00f52223          	sw	a5,4(a0)
    80000468:	000017b7          	lui	a5,0x1
    8000046c:	02f53823          	sd	a5,48(a0)
    80000470:	00050413          	mv	s0,a0
    80000474:	660050ef          	jal	80005ad4 <set_current_proc>
    80000478:	04043783          	ld	a5,64(s0)
    8000047c:	12078063          	beqz	a5,8000059c <test_sys_sbrk+0x164>
    80000480:	03043583          	ld	a1,48(s0)
    80000484:	00007517          	auipc	a0,0x7
    80000488:	f9c50513          	add	a0,a0,-100 # 80007420 <rodata_start+0x420>
    8000048c:	00001937          	lui	s2,0x1
    80000490:	79c020ef          	jal	80002c2c <printf>
    80000494:	04043783          	ld	a5,64(s0)
    80000498:	0727b823          	sd	s2,112(a5) # 1070 <_entry-0x7fffef90>
    8000049c:	4b5050ef          	jal	80006150 <sys_sbrk>
    800004a0:	00050593          	mv	a1,a0
    800004a4:	00050493          	mv	s1,a0
    800004a8:	00007517          	auipc	a0,0x7
    800004ac:	f9850513          	add	a0,a0,-104 # 80007440 <rodata_start+0x440>
    800004b0:	77c020ef          	jal	80002c2c <printf>
    800004b4:	03043583          	ld	a1,48(s0)
    800004b8:	00007517          	auipc	a0,0x7
    800004bc:	fa850513          	add	a0,a0,-88 # 80007460 <rodata_start+0x460>
    800004c0:	76c020ef          	jal	80002c2c <printf>
    800004c4:	01249863          	bne	s1,s2,800004d4 <test_sys_sbrk+0x9c>
    800004c8:	03043703          	ld	a4,48(s0)
    800004cc:	000027b7          	lui	a5,0x2
    800004d0:	08f70e63          	beq	a4,a5,8000056c <test_sys_sbrk+0x134>
    800004d4:	00007517          	auipc	a0,0x7
    800004d8:	fc450513          	add	a0,a0,-60 # 80007498 <rodata_start+0x498>
    800004dc:	2c1020ef          	jal	80002f9c <uart_puts>
    800004e0:	04043783          	ld	a5,64(s0)
    800004e4:	80000713          	li	a4,-2048
    800004e8:	06e7b823          	sd	a4,112(a5) # 2070 <_entry-0x7fffdf90>
    800004ec:	465050ef          	jal	80006150 <sys_sbrk>
    800004f0:	00050593          	mv	a1,a0
    800004f4:	00007517          	auipc	a0,0x7
    800004f8:	fbc50513          	add	a0,a0,-68 # 800074b0 <rodata_start+0x4b0>
    800004fc:	730020ef          	jal	80002c2c <printf>
    80000500:	03043583          	ld	a1,48(s0)
    80000504:	00007517          	auipc	a0,0x7
    80000508:	fcc50513          	add	a0,a0,-52 # 800074d0 <rodata_start+0x4d0>
    8000050c:	720020ef          	jal	80002c2c <printf>
    80000510:	03043703          	ld	a4,48(s0)
    80000514:	000027b7          	lui	a5,0x2
    80000518:	80078793          	add	a5,a5,-2048 # 1800 <_entry-0x7fffe800>
    8000051c:	04f70063          	beq	a4,a5,8000055c <test_sys_sbrk+0x124>
    80000520:	00007517          	auipc	a0,0x7
    80000524:	fe850513          	add	a0,a0,-24 # 80007508 <rodata_start+0x508>
    80000528:	275020ef          	jal	80002f9c <uart_puts>
    8000052c:	00000513          	li	a0,0
    80000530:	5a4050ef          	jal	80005ad4 <set_current_proc>
    80000534:	00040513          	mv	a0,s0
    80000538:	48c050ef          	jal	800059c4 <free_proc>
    8000053c:	01013403          	ld	s0,16(sp)
    80000540:	01813083          	ld	ra,24(sp)
    80000544:	00813483          	ld	s1,8(sp)
    80000548:	00013903          	ld	s2,0(sp)
    8000054c:	00007517          	auipc	a0,0x7
    80000550:	fd450513          	add	a0,a0,-44 # 80007520 <rodata_start+0x520>
    80000554:	02010113          	add	sp,sp,32
    80000558:	2450206f          	j	80002f9c <uart_puts>
    8000055c:	00007517          	auipc	a0,0x7
    80000560:	f9450513          	add	a0,a0,-108 # 800074f0 <rodata_start+0x4f0>
    80000564:	239020ef          	jal	80002f9c <uart_puts>
    80000568:	fc5ff06f          	j	8000052c <test_sys_sbrk+0xf4>
    8000056c:	00007517          	auipc	a0,0x7
    80000570:	f1450513          	add	a0,a0,-236 # 80007480 <rodata_start+0x480>
    80000574:	229020ef          	jal	80002f9c <uart_puts>
    80000578:	f69ff06f          	j	800004e0 <test_sys_sbrk+0xa8>
    8000057c:	01013403          	ld	s0,16(sp)
    80000580:	01813083          	ld	ra,24(sp)
    80000584:	00813483          	ld	s1,8(sp)
    80000588:	00013903          	ld	s2,0(sp)
    8000058c:	00007517          	auipc	a0,0x7
    80000590:	af450513          	add	a0,a0,-1292 # 80007080 <rodata_start+0x80>
    80000594:	02010113          	add	sp,sp,32
    80000598:	2050206f          	j	80002f9c <uart_puts>
    8000059c:	7e0040ef          	jal	80004d7c <alloc_trapframe>
    800005a0:	04a43023          	sd	a0,64(s0)
    800005a4:	eddff06f          	j	80000480 <test_sys_sbrk+0x48>

00000000800005a8 <test_syscall_dispatch>:
    800005a8:	ff010113          	add	sp,sp,-16
    800005ac:	00007517          	auipc	a0,0x7
    800005b0:	f8c50513          	add	a0,a0,-116 # 80007538 <rodata_start+0x538>
    800005b4:	00113423          	sd	ra,8(sp)
    800005b8:	00813023          	sd	s0,0(sp)
    800005bc:	1e1020ef          	jal	80002f9c <uart_puts>
    800005c0:	288050ef          	jal	80005848 <alloc_proc>
    800005c4:	12050463          	beqz	a0,800006ec <test_syscall_dispatch+0x144>
    800005c8:	00300793          	li	a5,3
    800005cc:	00f52223          	sw	a5,4(a0)
    800005d0:	00050413          	mv	s0,a0
    800005d4:	500050ef          	jal	80005ad4 <set_current_proc>
    800005d8:	04043783          	ld	a5,64(s0)
    800005dc:	12078463          	beqz	a5,80000704 <test_syscall_dispatch+0x15c>
    800005e0:	00007517          	auipc	a0,0x7
    800005e4:	f9050513          	add	a0,a0,-112 # 80007570 <rodata_start+0x570>
    800005e8:	1b5020ef          	jal	80002f9c <uart_puts>
    800005ec:	04043783          	ld	a5,64(s0)
    800005f0:	00b00713          	li	a4,11
    800005f4:	0ae7b423          	sd	a4,168(a5)
    800005f8:	228060ef          	jal	80006820 <syscall>
    800005fc:	04043783          	ld	a5,64(s0)
    80000600:	00842603          	lw	a2,8(s0)
    80000604:	00007517          	auipc	a0,0x7
    80000608:	f8c50513          	add	a0,a0,-116 # 80007590 <rodata_start+0x590>
    8000060c:	0707b583          	ld	a1,112(a5)
    80000610:	61c020ef          	jal	80002c2c <printf>
    80000614:	04043703          	ld	a4,64(s0)
    80000618:	00842783          	lw	a5,8(s0)
    8000061c:	07073703          	ld	a4,112(a4)
    80000620:	0af70663          	beq	a4,a5,800006cc <test_syscall_dispatch+0x124>
    80000624:	00007517          	auipc	a0,0x7
    80000628:	fac50513          	add	a0,a0,-84 # 800075d0 <rodata_start+0x5d0>
    8000062c:	171020ef          	jal	80002f9c <uart_puts>
    80000630:	00007517          	auipc	a0,0x7
    80000634:	fc050513          	add	a0,a0,-64 # 800075f0 <rodata_start+0x5f0>
    80000638:	165020ef          	jal	80002f9c <uart_puts>
    8000063c:	04043783          	ld	a5,64(s0)
    80000640:	00e00713          	li	a4,14
    80000644:	0ae7b423          	sd	a4,168(a5)
    80000648:	1d8060ef          	jal	80006820 <syscall>
    8000064c:	04043783          	ld	a5,64(s0)
    80000650:	00007517          	auipc	a0,0x7
    80000654:	fc050513          	add	a0,a0,-64 # 80007610 <rodata_start+0x610>
    80000658:	0707b583          	ld	a1,112(a5)
    8000065c:	5d0020ef          	jal	80002c2c <printf>
    80000660:	00007517          	auipc	a0,0x7
    80000664:	fd850513          	add	a0,a0,-40 # 80007638 <rodata_start+0x638>
    80000668:	135020ef          	jal	80002f9c <uart_puts>
    8000066c:	00007517          	auipc	a0,0x7
    80000670:	fec50513          	add	a0,a0,-20 # 80007658 <rodata_start+0x658>
    80000674:	129020ef          	jal	80002f9c <uart_puts>
    80000678:	04043783          	ld	a5,64(s0)
    8000067c:	3e700713          	li	a4,999
    80000680:	0ae7b423          	sd	a4,168(a5)
    80000684:	19c060ef          	jal	80006820 <syscall>
    80000688:	04043703          	ld	a4,64(s0)
    8000068c:	fff00793          	li	a5,-1
    80000690:	07073703          	ld	a4,112(a4)
    80000694:	04f70463          	beq	a4,a5,800006dc <test_syscall_dispatch+0x134>
    80000698:	00007517          	auipc	a0,0x7
    8000069c:	00850513          	add	a0,a0,8 # 800076a0 <rodata_start+0x6a0>
    800006a0:	0fd020ef          	jal	80002f9c <uart_puts>
    800006a4:	00000513          	li	a0,0
    800006a8:	42c050ef          	jal	80005ad4 <set_current_proc>
    800006ac:	00040513          	mv	a0,s0
    800006b0:	314050ef          	jal	800059c4 <free_proc>
    800006b4:	00013403          	ld	s0,0(sp)
    800006b8:	00813083          	ld	ra,8(sp)
    800006bc:	00007517          	auipc	a0,0x7
    800006c0:	00c50513          	add	a0,a0,12 # 800076c8 <rodata_start+0x6c8>
    800006c4:	01010113          	add	sp,sp,16
    800006c8:	0d50206f          	j	80002f9c <uart_puts>
    800006cc:	00007517          	auipc	a0,0x7
    800006d0:	ee450513          	add	a0,a0,-284 # 800075b0 <rodata_start+0x5b0>
    800006d4:	0c9020ef          	jal	80002f9c <uart_puts>
    800006d8:	f59ff06f          	j	80000630 <test_syscall_dispatch+0x88>
    800006dc:	00007517          	auipc	a0,0x7
    800006e0:	f9c50513          	add	a0,a0,-100 # 80007678 <rodata_start+0x678>
    800006e4:	0b9020ef          	jal	80002f9c <uart_puts>
    800006e8:	fbdff06f          	j	800006a4 <test_syscall_dispatch+0xfc>
    800006ec:	00013403          	ld	s0,0(sp)
    800006f0:	00813083          	ld	ra,8(sp)
    800006f4:	00007517          	auipc	a0,0x7
    800006f8:	98c50513          	add	a0,a0,-1652 # 80007080 <rodata_start+0x80>
    800006fc:	01010113          	add	sp,sp,16
    80000700:	09d0206f          	j	80002f9c <uart_puts>
    80000704:	678040ef          	jal	80004d7c <alloc_trapframe>
    80000708:	04a43023          	sd	a0,64(s0)
    8000070c:	ed5ff06f          	j	800005e0 <test_syscall_dispatch+0x38>

0000000080000710 <test_arg_functions>:
    80000710:	fb010113          	add	sp,sp,-80
    80000714:	00007517          	auipc	a0,0x7
    80000718:	fcc50513          	add	a0,a0,-52 # 800076e0 <rodata_start+0x6e0>
    8000071c:	04113423          	sd	ra,72(sp)
    80000720:	04813023          	sd	s0,64(sp)
    80000724:	02913c23          	sd	s1,56(sp)
    80000728:	03213823          	sd	s2,48(sp)
    8000072c:	03313423          	sd	s3,40(sp)
    80000730:	03413023          	sd	s4,32(sp)
    80000734:	069020ef          	jal	80002f9c <uart_puts>
    80000738:	110050ef          	jal	80005848 <alloc_proc>
    8000073c:	18050863          	beqz	a0,800008cc <test_arg_functions+0x1bc>
    80000740:	00300793          	li	a5,3
    80000744:	00f52223          	sw	a5,4(a0)
    80000748:	00050413          	mv	s0,a0
    8000074c:	388050ef          	jal	80005ad4 <set_current_proc>
    80000750:	04043503          	ld	a0,64(s0)
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
    80000780:	579050ef          	jal	800064f8 <argint>
    80000784:	00410593          	add	a1,sp,4
    80000788:	00100513          	li	a0,1
    8000078c:	56d050ef          	jal	800064f8 <argint>
    80000790:	00810593          	add	a1,sp,8
    80000794:	00200513          	li	a0,2
    80000798:	561050ef          	jal	800064f8 <argint>
    8000079c:	00c10593          	add	a1,sp,12
    800007a0:	00300513          	li	a0,3
    800007a4:	555050ef          	jal	800064f8 <argint>
    800007a8:	00012583          	lw	a1,0(sp)
    800007ac:	00007517          	auipc	a0,0x7
    800007b0:	f6c50513          	add	a0,a0,-148 # 80007718 <rodata_start+0x718>
    800007b4:	478020ef          	jal	80002c2c <printf>
    800007b8:	00412583          	lw	a1,4(sp)
    800007bc:	00007517          	auipc	a0,0x7
    800007c0:	f7c50513          	add	a0,a0,-132 # 80007738 <rodata_start+0x738>
    800007c4:	468020ef          	jal	80002c2c <printf>
    800007c8:	00812583          	lw	a1,8(sp)
    800007cc:	00007517          	auipc	a0,0x7
    800007d0:	f8c50513          	add	a0,a0,-116 # 80007758 <rodata_start+0x758>
    800007d4:	458020ef          	jal	80002c2c <printf>
    800007d8:	00c12583          	lw	a1,12(sp)
    800007dc:	00007517          	auipc	a0,0x7
    800007e0:	f9c50513          	add	a0,a0,-100 # 80007778 <rodata_start+0x778>
    800007e4:	448020ef          	jal	80002c2c <printf>
    800007e8:	00012783          	lw	a5,0(sp)
    800007ec:	00979663          	bne	a5,s1,800007f8 <test_arg_functions+0xe8>
    800007f0:	00412783          	lw	a5,4(sp)
    800007f4:	0b278463          	beq	a5,s2,8000089c <test_arg_functions+0x18c>
    800007f8:	00007517          	auipc	a0,0x7
    800007fc:	fc050513          	add	a0,a0,-64 # 800077b8 <rodata_start+0x7b8>
    80000800:	79c020ef          	jal	80002f9c <uart_puts>
    80000804:	01010593          	add	a1,sp,16
    80000808:	00000513          	li	a0,0
    8000080c:	60d050ef          	jal	80006618 <argaddr>
    80000810:	01810593          	add	a1,sp,24
    80000814:	00100513          	li	a0,1
    80000818:	601050ef          	jal	80006618 <argaddr>
    8000081c:	01013583          	ld	a1,16(sp)
    80000820:	00007517          	auipc	a0,0x7
    80000824:	fb850513          	add	a0,a0,-72 # 800077d8 <rodata_start+0x7d8>
    80000828:	404020ef          	jal	80002c2c <printf>
    8000082c:	01813583          	ld	a1,24(sp)
    80000830:	00007517          	auipc	a0,0x7
    80000834:	fd050513          	add	a0,a0,-48 # 80007800 <rodata_start+0x800>
    80000838:	3f4020ef          	jal	80002c2c <printf>
    8000083c:	01013703          	ld	a4,16(sp)
    80000840:	02a00793          	li	a5,42
    80000844:	00f71863          	bne	a4,a5,80000854 <test_arg_functions+0x144>
    80000848:	01813703          	ld	a4,24(sp)
    8000084c:	06400793          	li	a5,100
    80000850:	06f70663          	beq	a4,a5,800008bc <test_arg_functions+0x1ac>
    80000854:	00007517          	auipc	a0,0x7
    80000858:	ff450513          	add	a0,a0,-12 # 80007848 <rodata_start+0x848>
    8000085c:	740020ef          	jal	80002f9c <uart_puts>
    80000860:	00000513          	li	a0,0
    80000864:	270050ef          	jal	80005ad4 <set_current_proc>
    80000868:	00040513          	mv	a0,s0
    8000086c:	158050ef          	jal	800059c4 <free_proc>
    80000870:	00007517          	auipc	a0,0x7
    80000874:	ff850513          	add	a0,a0,-8 # 80007868 <rodata_start+0x868>
    80000878:	724020ef          	jal	80002f9c <uart_puts>
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
    800008ac:	00007517          	auipc	a0,0x7
    800008b0:	eec50513          	add	a0,a0,-276 # 80007798 <rodata_start+0x798>
    800008b4:	6e8020ef          	jal	80002f9c <uart_puts>
    800008b8:	f4dff06f          	j	80000804 <test_arg_functions+0xf4>
    800008bc:	00007517          	auipc	a0,0x7
    800008c0:	f6c50513          	add	a0,a0,-148 # 80007828 <rodata_start+0x828>
    800008c4:	6d8020ef          	jal	80002f9c <uart_puts>
    800008c8:	f99ff06f          	j	80000860 <test_arg_functions+0x150>
    800008cc:	04013403          	ld	s0,64(sp)
    800008d0:	04813083          	ld	ra,72(sp)
    800008d4:	03813483          	ld	s1,56(sp)
    800008d8:	03013903          	ld	s2,48(sp)
    800008dc:	02813983          	ld	s3,40(sp)
    800008e0:	02013a03          	ld	s4,32(sp)
    800008e4:	00006517          	auipc	a0,0x6
    800008e8:	79c50513          	add	a0,a0,1948 # 80007080 <rodata_start+0x80>
    800008ec:	05010113          	add	sp,sp,80
    800008f0:	6ac0206f          	j	80002f9c <uart_puts>
    800008f4:	488040ef          	jal	80004d7c <alloc_trapframe>
    800008f8:	04a43023          	sd	a0,64(s0)
    800008fc:	e5dff06f          	j	80000758 <test_arg_functions+0x48>

0000000080000900 <test_syscall_performance>:
    80000900:	fe010113          	add	sp,sp,-32
    80000904:	00007517          	auipc	a0,0x7
    80000908:	f7c50513          	add	a0,a0,-132 # 80007880 <rodata_start+0x880>
    8000090c:	00113c23          	sd	ra,24(sp)
    80000910:	00813823          	sd	s0,16(sp)
    80000914:	00913423          	sd	s1,8(sp)
    80000918:	01213023          	sd	s2,0(sp)
    8000091c:	680020ef          	jal	80002f9c <uart_puts>
    80000920:	729040ef          	jal	80005848 <alloc_proc>
    80000924:	0c050263          	beqz	a0,800009e8 <test_syscall_performance+0xe8>
    80000928:	00300793          	li	a5,3
    8000092c:	00f52223          	sw	a5,4(a0)
    80000930:	00050493          	mv	s1,a0
    80000934:	1a0050ef          	jal	80005ad4 <set_current_proc>
    80000938:	0404b783          	ld	a5,64(s1)
    8000093c:	0c078663          	beqz	a5,80000a08 <test_syscall_performance+0x108>
    80000940:	00007517          	auipc	a0,0x7
    80000944:	f8050513          	add	a0,a0,-128 # 800078c0 <rodata_start+0x8c0>
    80000948:	654020ef          	jal	80002f9c <uart_puts>
    8000094c:	3bc040ef          	jal	80004d08 <get_ticks>
    80000950:	00002437          	lui	s0,0x2
    80000954:	00050913          	mv	s2,a0
    80000958:	71040413          	add	s0,s0,1808 # 2710 <_entry-0x7fffd8f0>
    8000095c:	fff4041b          	addw	s0,s0,-1
    80000960:	75c050ef          	jal	800060bc <sys_getpid>
    80000964:	fe041ce3          	bnez	s0,8000095c <test_syscall_performance+0x5c>
    80000968:	3a0040ef          	jal	80004d08 <get_ticks>
    8000096c:	41250933          	sub	s2,a0,s2
    80000970:	00090593          	mv	a1,s2
    80000974:	00007517          	auipc	a0,0x7
    80000978:	f7450513          	add	a0,a0,-140 # 800078e8 <rodata_start+0x8e8>
    8000097c:	2b0020ef          	jal	80002c2c <printf>
    80000980:	000027b7          	lui	a5,0x2
    80000984:	71078793          	add	a5,a5,1808 # 2710 <_entry-0x7fffd8f0>
    80000988:	02f97733          	remu	a4,s2,a5
    8000098c:	00007517          	auipc	a0,0x7
    80000990:	f8c50513          	add	a0,a0,-116 # 80007918 <rodata_start+0x918>
    80000994:	00271613          	sll	a2,a4,0x2
    80000998:	00e60633          	add	a2,a2,a4
    8000099c:	00161613          	sll	a2,a2,0x1
    800009a0:	02f955b3          	divu	a1,s2,a5
    800009a4:	02f65633          	divu	a2,a2,a5
    800009a8:	284020ef          	jal	80002c2c <printf>
    800009ac:	00007517          	auipc	a0,0x7
    800009b0:	f9450513          	add	a0,a0,-108 # 80007940 <rodata_start+0x940>
    800009b4:	5e8020ef          	jal	80002f9c <uart_puts>
    800009b8:	00000513          	li	a0,0
    800009bc:	118050ef          	jal	80005ad4 <set_current_proc>
    800009c0:	00048513          	mv	a0,s1
    800009c4:	000050ef          	jal	800059c4 <free_proc>
    800009c8:	01013403          	ld	s0,16(sp)
    800009cc:	01813083          	ld	ra,24(sp)
    800009d0:	00813483          	ld	s1,8(sp)
    800009d4:	00013903          	ld	s2,0(sp)
    800009d8:	00007517          	auipc	a0,0x7
    800009dc:	f8050513          	add	a0,a0,-128 # 80007958 <rodata_start+0x958>
    800009e0:	02010113          	add	sp,sp,32
    800009e4:	5b80206f          	j	80002f9c <uart_puts>
    800009e8:	01013403          	ld	s0,16(sp)
    800009ec:	01813083          	ld	ra,24(sp)
    800009f0:	00813483          	ld	s1,8(sp)
    800009f4:	00013903          	ld	s2,0(sp)
    800009f8:	00006517          	auipc	a0,0x6
    800009fc:	68850513          	add	a0,a0,1672 # 80007080 <rodata_start+0x80>
    80000a00:	02010113          	add	sp,sp,32
    80000a04:	5980206f          	j	80002f9c <uart_puts>
    80000a08:	374040ef          	jal	80004d7c <alloc_trapframe>
    80000a0c:	04a4b023          	sd	a0,64(s1)
    80000a10:	f31ff06f          	j	80000940 <test_syscall_performance+0x40>

0000000080000a14 <test_process_allocation>:
    80000a14:	fe010113          	add	sp,sp,-32
    80000a18:	00007517          	auipc	a0,0x7
    80000a1c:	f5850513          	add	a0,a0,-168 # 80007970 <rodata_start+0x970>
    80000a20:	00113c23          	sd	ra,24(sp)
    80000a24:	00813823          	sd	s0,16(sp)
    80000a28:	00913423          	sd	s1,8(sp)
    80000a2c:	01213023          	sd	s2,0(sp)
    80000a30:	56c020ef          	jal	80002f9c <uart_puts>
    80000a34:	615040ef          	jal	80005848 <alloc_proc>
    80000a38:	00050413          	mv	s0,a0
    80000a3c:	60d040ef          	jal	80005848 <alloc_proc>
    80000a40:	00050493          	mv	s1,a0
    80000a44:	605040ef          	jal	80005848 <alloc_proc>
    80000a48:	0a040663          	beqz	s0,80000af4 <test_process_allocation+0xe0>
    80000a4c:	0a048463          	beqz	s1,80000af4 <test_process_allocation+0xe0>
    80000a50:	00050913          	mv	s2,a0
    80000a54:	0a050063          	beqz	a0,80000af4 <test_process_allocation+0xe0>
    80000a58:	00852683          	lw	a3,8(a0)
    80000a5c:	0084a603          	lw	a2,8(s1)
    80000a60:	00842583          	lw	a1,8(s0)
    80000a64:	00007517          	auipc	a0,0x7
    80000a68:	f4c50513          	add	a0,a0,-180 # 800079b0 <rodata_start+0x9b0>
    80000a6c:	1c0020ef          	jal	80002c2c <printf>
    80000a70:	00442783          	lw	a5,4(s0)
    80000a74:	00100713          	li	a4,1
    80000a78:	00e79a63          	bne	a5,a4,80000a8c <test_process_allocation+0x78>
    80000a7c:	0044a703          	lw	a4,4(s1)
    80000a80:	00f71663          	bne	a4,a5,80000a8c <test_process_allocation+0x78>
    80000a84:	00492783          	lw	a5,4(s2) # 1004 <_entry-0x7fffeffc>
    80000a88:	0ae78463          	beq	a5,a4,80000b30 <test_process_allocation+0x11c>
    80000a8c:	00007517          	auipc	a0,0x7
    80000a90:	f8450513          	add	a0,a0,-124 # 80007a10 <rodata_start+0xa10>
    80000a94:	508020ef          	jal	80002f9c <uart_puts>
    80000a98:	00040513          	mv	a0,s0
    80000a9c:	729040ef          	jal	800059c4 <free_proc>
    80000aa0:	00048513          	mv	a0,s1
    80000aa4:	721040ef          	jal	800059c4 <free_proc>
    80000aa8:	00090513          	mv	a0,s2
    80000aac:	719040ef          	jal	800059c4 <free_proc>
    80000ab0:	00442783          	lw	a5,4(s0)
    80000ab4:	00079a63          	bnez	a5,80000ac8 <test_process_allocation+0xb4>
    80000ab8:	0044a783          	lw	a5,4(s1)
    80000abc:	00079663          	bnez	a5,80000ac8 <test_process_allocation+0xb4>
    80000ac0:	00492783          	lw	a5,4(s2)
    80000ac4:	04078e63          	beqz	a5,80000b20 <test_process_allocation+0x10c>
    80000ac8:	00007517          	auipc	a0,0x7
    80000acc:	f7850513          	add	a0,a0,-136 # 80007a40 <rodata_start+0xa40>
    80000ad0:	4cc020ef          	jal	80002f9c <uart_puts>
    80000ad4:	01013403          	ld	s0,16(sp)
    80000ad8:	01813083          	ld	ra,24(sp)
    80000adc:	00813483          	ld	s1,8(sp)
    80000ae0:	00013903          	ld	s2,0(sp)
    80000ae4:	00007517          	auipc	a0,0x7
    80000ae8:	f8c50513          	add	a0,a0,-116 # 80007a70 <rodata_start+0xa70>
    80000aec:	02010113          	add	sp,sp,32
    80000af0:	4ac0206f          	j	80002f9c <uart_puts>
    80000af4:	00007517          	auipc	a0,0x7
    80000af8:	f6450513          	add	a0,a0,-156 # 80007a58 <rodata_start+0xa58>
    80000afc:	4a0020ef          	jal	80002f9c <uart_puts>
    80000b00:	01013403          	ld	s0,16(sp)
    80000b04:	01813083          	ld	ra,24(sp)
    80000b08:	00813483          	ld	s1,8(sp)
    80000b0c:	00013903          	ld	s2,0(sp)
    80000b10:	00007517          	auipc	a0,0x7
    80000b14:	f6050513          	add	a0,a0,-160 # 80007a70 <rodata_start+0xa70>
    80000b18:	02010113          	add	sp,sp,32
    80000b1c:	4800206f          	j	80002f9c <uart_puts>
    80000b20:	00007517          	auipc	a0,0x7
    80000b24:	f0850513          	add	a0,a0,-248 # 80007a28 <rodata_start+0xa28>
    80000b28:	474020ef          	jal	80002f9c <uart_puts>
    80000b2c:	fd5ff06f          	j	80000b00 <test_process_allocation+0xec>
    80000b30:	00007517          	auipc	a0,0x7
    80000b34:	eb850513          	add	a0,a0,-328 # 800079e8 <rodata_start+0x9e8>
    80000b38:	464020ef          	jal	80002f9c <uart_puts>
    80000b3c:	f5dff06f          	j	80000a98 <test_process_allocation+0x84>

0000000080000b40 <test_process_find>:
    80000b40:	fe010113          	add	sp,sp,-32
    80000b44:	00007517          	auipc	a0,0x7
    80000b48:	f4450513          	add	a0,a0,-188 # 80007a88 <rodata_start+0xa88>
    80000b4c:	00113c23          	sd	ra,24(sp)
    80000b50:	00813823          	sd	s0,16(sp)
    80000b54:	00913423          	sd	s1,8(sp)
    80000b58:	444020ef          	jal	80002f9c <uart_puts>
    80000b5c:	4ed040ef          	jal	80005848 <alloc_proc>
    80000b60:	08050863          	beqz	a0,80000bf0 <test_process_find+0xb0>
    80000b64:	00852483          	lw	s1,8(a0)
    80000b68:	00050413          	mv	s0,a0
    80000b6c:	00007517          	auipc	a0,0x7
    80000b70:	f6c50513          	add	a0,a0,-148 # 80007ad8 <rodata_start+0xad8>
    80000b74:	00048593          	mv	a1,s1
    80000b78:	0b4020ef          	jal	80002c2c <printf>
    80000b7c:	00048513          	mv	a0,s1
    80000b80:	651040ef          	jal	800059d0 <find_proc>
    80000b84:	00050663          	beqz	a0,80000b90 <test_process_find+0x50>
    80000b88:	00852783          	lw	a5,8(a0)
    80000b8c:	08978063          	beq	a5,s1,80000c0c <test_process_find+0xcc>
    80000b90:	00007517          	auipc	a0,0x7
    80000b94:	f8050513          	add	a0,a0,-128 # 80007b10 <rodata_start+0xb10>
    80000b98:	404020ef          	jal	80002f9c <uart_puts>
    80000b9c:	00040513          	mv	a0,s0
    80000ba0:	625040ef          	jal	800059c4 <free_proc>
    80000ba4:	00048513          	mv	a0,s1
    80000ba8:	629040ef          	jal	800059d0 <find_proc>
    80000bac:	00050663          	beqz	a0,80000bb8 <test_process_find+0x78>
    80000bb0:	00452783          	lw	a5,4(a0)
    80000bb4:	02079663          	bnez	a5,80000be0 <test_process_find+0xa0>
    80000bb8:	00007517          	auipc	a0,0x7
    80000bbc:	f7050513          	add	a0,a0,-144 # 80007b28 <rodata_start+0xb28>
    80000bc0:	3dc020ef          	jal	80002f9c <uart_puts>
    80000bc4:	01013403          	ld	s0,16(sp)
    80000bc8:	01813083          	ld	ra,24(sp)
    80000bcc:	00813483          	ld	s1,8(sp)
    80000bd0:	00007517          	auipc	a0,0x7
    80000bd4:	ea050513          	add	a0,a0,-352 # 80007a70 <rodata_start+0xa70>
    80000bd8:	02010113          	add	sp,sp,32
    80000bdc:	3c00206f          	j	80002f9c <uart_puts>
    80000be0:	00007517          	auipc	a0,0x7
    80000be4:	f8050513          	add	a0,a0,-128 # 80007b60 <rodata_start+0xb60>
    80000be8:	3b4020ef          	jal	80002f9c <uart_puts>
    80000bec:	fd9ff06f          	j	80000bc4 <test_process_find+0x84>
    80000bf0:	01013403          	ld	s0,16(sp)
    80000bf4:	01813083          	ld	ra,24(sp)
    80000bf8:	00813483          	ld	s1,8(sp)
    80000bfc:	00007517          	auipc	a0,0x7
    80000c00:	ec450513          	add	a0,a0,-316 # 80007ac0 <rodata_start+0xac0>
    80000c04:	02010113          	add	sp,sp,32
    80000c08:	3940206f          	j	80002f9c <uart_puts>
    80000c0c:	00048593          	mv	a1,s1
    80000c10:	00007517          	auipc	a0,0x7
    80000c14:	ee050513          	add	a0,a0,-288 # 80007af0 <rodata_start+0xaf0>
    80000c18:	014020ef          	jal	80002c2c <printf>
    80000c1c:	f81ff06f          	j	80000b9c <test_process_find+0x5c>

0000000080000c20 <test_process_state_transition>:
    80000c20:	fe010113          	add	sp,sp,-32
    80000c24:	00007517          	auipc	a0,0x7
    80000c28:	f6c50513          	add	a0,a0,-148 # 80007b90 <rodata_start+0xb90>
    80000c2c:	00113c23          	sd	ra,24(sp)
    80000c30:	00813823          	sd	s0,16(sp)
    80000c34:	00913423          	sd	s1,8(sp)
    80000c38:	364020ef          	jal	80002f9c <uart_puts>
    80000c3c:	40d040ef          	jal	80005848 <alloc_proc>
    80000c40:	0c050a63          	beqz	a0,80000d14 <test_process_state_transition+0xf4>
    80000c44:	00452583          	lw	a1,4(a0)
    80000c48:	00050413          	mv	s0,a0
    80000c4c:	00100613          	li	a2,1
    80000c50:	00007517          	auipc	a0,0x7
    80000c54:	f8050513          	add	a0,a0,-128 # 80007bd0 <rodata_start+0xbd0>
    80000c58:	7d5010ef          	jal	80002c2c <printf>
    80000c5c:	00040513          	mv	a0,s0
    80000c60:	5d9040ef          	jal	80005a38 <proc_mark_runnable>
    80000c64:	00442703          	lw	a4,4(s0)
    80000c68:	00200793          	li	a5,2
    80000c6c:	0cf70263          	beq	a4,a5,80000d30 <test_process_state_transition+0x110>
    80000c70:	00300793          	li	a5,3
    80000c74:	000014b7          	lui	s1,0x1
    80000c78:	00f42223          	sw	a5,4(s0)
    80000c7c:	23448593          	add	a1,s1,564 # 1234 <_entry-0x7fffedcc>
    80000c80:	00040513          	mv	a0,s0
    80000c84:	5dd040ef          	jal	80005a60 <proc_mark_sleeping>
    80000c88:	00442583          	lw	a1,4(s0)
    80000c8c:	00400793          	li	a5,4
    80000c90:	00f59863          	bne	a1,a5,80000ca0 <test_process_state_transition+0x80>
    80000c94:	0c843783          	ld	a5,200(s0)
    80000c98:	23448493          	add	s1,s1,564
    80000c9c:	06978463          	beq	a5,s1,80000d04 <test_process_state_transition+0xe4>
    80000ca0:	00007517          	auipc	a0,0x7
    80000ca4:	f9050513          	add	a0,a0,-112 # 80007c30 <rodata_start+0xc30>
    80000ca8:	785010ef          	jal	80002c2c <printf>
    80000cac:	02a00593          	li	a1,42
    80000cb0:	00040513          	mv	a0,s0
    80000cb4:	5d1040ef          	jal	80005a84 <proc_mark_zombie>
    80000cb8:	00442703          	lw	a4,4(s0)
    80000cbc:	00500793          	li	a5,5
    80000cc0:	02f70463          	beq	a4,a5,80000ce8 <test_process_state_transition+0xc8>
    80000cc4:	00040513          	mv	a0,s0
    80000cc8:	4fd040ef          	jal	800059c4 <free_proc>
    80000ccc:	01013403          	ld	s0,16(sp)
    80000cd0:	01813083          	ld	ra,24(sp)
    80000cd4:	00813483          	ld	s1,8(sp)
    80000cd8:	00007517          	auipc	a0,0x7
    80000cdc:	d9850513          	add	a0,a0,-616 # 80007a70 <rodata_start+0xa70>
    80000ce0:	02010113          	add	sp,sp,32
    80000ce4:	2b80206f          	j	80002f9c <uart_puts>
    80000ce8:	02042703          	lw	a4,32(s0)
    80000cec:	02a00793          	li	a5,42
    80000cf0:	fcf71ae3          	bne	a4,a5,80000cc4 <test_process_state_transition+0xa4>
    80000cf4:	00007517          	auipc	a0,0x7
    80000cf8:	f6c50513          	add	a0,a0,-148 # 80007c60 <rodata_start+0xc60>
    80000cfc:	2a0020ef          	jal	80002f9c <uart_puts>
    80000d00:	fc5ff06f          	j	80000cc4 <test_process_state_transition+0xa4>
    80000d04:	00007517          	auipc	a0,0x7
    80000d08:	f0c50513          	add	a0,a0,-244 # 80007c10 <rodata_start+0xc10>
    80000d0c:	290020ef          	jal	80002f9c <uart_puts>
    80000d10:	f9dff06f          	j	80000cac <test_process_state_transition+0x8c>
    80000d14:	01013403          	ld	s0,16(sp)
    80000d18:	01813083          	ld	ra,24(sp)
    80000d1c:	00813483          	ld	s1,8(sp)
    80000d20:	00007517          	auipc	a0,0x7
    80000d24:	da050513          	add	a0,a0,-608 # 80007ac0 <rodata_start+0xac0>
    80000d28:	02010113          	add	sp,sp,32
    80000d2c:	2700206f          	j	80002f9c <uart_puts>
    80000d30:	00007517          	auipc	a0,0x7
    80000d34:	ec050513          	add	a0,a0,-320 # 80007bf0 <rodata_start+0xbf0>
    80000d38:	264020ef          	jal	80002f9c <uart_puts>
    80000d3c:	f35ff06f          	j	80000c70 <test_process_state_transition+0x50>

0000000080000d40 <test_simple_fork>:
    80000d40:	fe010113          	add	sp,sp,-32
    80000d44:	00007517          	auipc	a0,0x7
    80000d48:	f3c50513          	add	a0,a0,-196 # 80007c80 <rodata_start+0xc80>
    80000d4c:	00113c23          	sd	ra,24(sp)
    80000d50:	00813823          	sd	s0,16(sp)
    80000d54:	00913423          	sd	s1,8(sp)
    80000d58:	244020ef          	jal	80002f9c <uart_puts>
    80000d5c:	2ed040ef          	jal	80005848 <alloc_proc>
    80000d60:	0a050463          	beqz	a0,80000e08 <test_simple_fork+0xc8>
    80000d64:	00300793          	li	a5,3
    80000d68:	00f52223          	sw	a5,4(a0)
    80000d6c:	00050413          	mv	s0,a0
    80000d70:	565040ef          	jal	80005ad4 <set_current_proc>
    80000d74:	00842583          	lw	a1,8(s0)
    80000d78:	00007517          	auipc	a0,0x7
    80000d7c:	f6850513          	add	a0,a0,-152 # 80007ce0 <rodata_start+0xce0>
    80000d80:	6ad010ef          	jal	80002c2c <printf>
    80000d84:	761040ef          	jal	80005ce4 <fork>
    80000d88:	00050493          	mv	s1,a0
    80000d8c:	06a05663          	blez	a0,80000df8 <test_simple_fork+0xb8>
    80000d90:	00050593          	mv	a1,a0
    80000d94:	00007517          	auipc	a0,0x7
    80000d98:	f6450513          	add	a0,a0,-156 # 80007cf8 <rodata_start+0xcf8>
    80000d9c:	691010ef          	jal	80002c2c <printf>
    80000da0:	00048513          	mv	a0,s1
    80000da4:	42d040ef          	jal	800059d0 <find_proc>
    80000da8:	00050493          	mv	s1,a0
    80000dac:	02050063          	beqz	a0,80000dcc <test_simple_fork+0x8c>
    80000db0:	0c053783          	ld	a5,192(a0)
    80000db4:	06878863          	beq	a5,s0,80000e24 <test_simple_fork+0xe4>
    80000db8:	0044a703          	lw	a4,4(s1)
    80000dbc:	00200793          	li	a5,2
    80000dc0:	08f70063          	beq	a4,a5,80000e40 <test_simple_fork+0x100>
    80000dc4:	00048513          	mv	a0,s1
    80000dc8:	3fd040ef          	jal	800059c4 <free_proc>
    80000dcc:	00040513          	mv	a0,s0
    80000dd0:	3f5040ef          	jal	800059c4 <free_proc>
    80000dd4:	00000513          	li	a0,0
    80000dd8:	4fd040ef          	jal	80005ad4 <set_current_proc>
    80000ddc:	01013403          	ld	s0,16(sp)
    80000de0:	01813083          	ld	ra,24(sp)
    80000de4:	00813483          	ld	s1,8(sp)
    80000de8:	00007517          	auipc	a0,0x7
    80000dec:	c8850513          	add	a0,a0,-888 # 80007a70 <rodata_start+0xa70>
    80000df0:	02010113          	add	sp,sp,32
    80000df4:	1a80206f          	j	80002f9c <uart_puts>
    80000df8:	00007517          	auipc	a0,0x7
    80000dfc:	f6850513          	add	a0,a0,-152 # 80007d60 <rodata_start+0xd60>
    80000e00:	19c020ef          	jal	80002f9c <uart_puts>
    80000e04:	fc9ff06f          	j	80000dcc <test_simple_fork+0x8c>
    80000e08:	01013403          	ld	s0,16(sp)
    80000e0c:	01813083          	ld	ra,24(sp)
    80000e10:	00813483          	ld	s1,8(sp)
    80000e14:	00007517          	auipc	a0,0x7
    80000e18:	eac50513          	add	a0,a0,-340 # 80007cc0 <rodata_start+0xcc0>
    80000e1c:	02010113          	add	sp,sp,32
    80000e20:	17c0206f          	j	80002f9c <uart_puts>
    80000e24:	00c52703          	lw	a4,12(a0)
    80000e28:	00842783          	lw	a5,8(s0)
    80000e2c:	f8f716e3          	bne	a4,a5,80000db8 <test_simple_fork+0x78>
    80000e30:	00007517          	auipc	a0,0x7
    80000e34:	ef050513          	add	a0,a0,-272 # 80007d20 <rodata_start+0xd20>
    80000e38:	164020ef          	jal	80002f9c <uart_puts>
    80000e3c:	f7dff06f          	j	80000db8 <test_simple_fork+0x78>
    80000e40:	00007517          	auipc	a0,0x7
    80000e44:	f0050513          	add	a0,a0,-256 # 80007d40 <rodata_start+0xd40>
    80000e48:	154020ef          	jal	80002f9c <uart_puts>
    80000e4c:	f79ff06f          	j	80000dc4 <test_simple_fork+0x84>

0000000080000e50 <test_scheduler_basic>:
    80000e50:	fb010113          	add	sp,sp,-80
    80000e54:	04813023          	sd	s0,64(sp)
    80000e58:	00007517          	auipc	a0,0x7
    80000e5c:	f1850513          	add	a0,a0,-232 # 80007d70 <rodata_start+0xd70>
    80000e60:	00810413          	add	s0,sp,8
    80000e64:	02913c23          	sd	s1,56(sp)
    80000e68:	03213823          	sd	s2,48(sp)
    80000e6c:	03313423          	sd	s3,40(sp)
    80000e70:	03413023          	sd	s4,32(sp)
    80000e74:	04113423          	sd	ra,72(sp)
    80000e78:	02010913          	add	s2,sp,32
    80000e7c:	120020ef          	jal	80002f9c <uart_puts>
    80000e80:	00040493          	mv	s1,s0
    80000e84:	00200a13          	li	s4,2
    80000e88:	00007997          	auipc	s3,0x7
    80000e8c:	f2898993          	add	s3,s3,-216 # 80007db0 <rodata_start+0xdb0>
    80000e90:	1b9040ef          	jal	80005848 <alloc_proc>
    80000e94:	00a4b023          	sd	a0,0(s1)
    80000e98:	00050793          	mv	a5,a0
    80000e9c:	00848493          	add	s1,s1,8
    80000ea0:	00098513          	mv	a0,s3
    80000ea4:	00078863          	beqz	a5,80000eb4 <test_scheduler_basic+0x64>
    80000ea8:	0087a583          	lw	a1,8(a5)
    80000eac:	0147a223          	sw	s4,4(a5)
    80000eb0:	57d010ef          	jal	80002c2c <printf>
    80000eb4:	fd249ee3          	bne	s1,s2,80000e90 <test_scheduler_basic+0x40>
    80000eb8:	00425797          	auipc	a5,0x425
    80000ebc:	76478793          	add	a5,a5,1892 # 8042661c <proc+0x4>
    80000ec0:	00426617          	auipc	a2,0x426
    80000ec4:	4dc60613          	add	a2,a2,1244 # 8042739c <tickslock+0x4>
    80000ec8:	00000593          	li	a1,0
    80000ecc:	00200693          	li	a3,2
    80000ed0:	0007a703          	lw	a4,0(a5)
    80000ed4:	0d878793          	add	a5,a5,216
    80000ed8:	04d70863          	beq	a4,a3,80000f28 <test_scheduler_basic+0xd8>
    80000edc:	fec79ae3          	bne	a5,a2,80000ed0 <test_scheduler_basic+0x80>
    80000ee0:	00007517          	auipc	a0,0x7
    80000ee4:	ee850513          	add	a0,a0,-280 # 80007dc8 <rodata_start+0xdc8>
    80000ee8:	545010ef          	jal	80002c2c <printf>
    80000eec:	00043503          	ld	a0,0(s0)
    80000ef0:	00840413          	add	s0,s0,8
    80000ef4:	00050463          	beqz	a0,80000efc <test_scheduler_basic+0xac>
    80000ef8:	2cd040ef          	jal	800059c4 <free_proc>
    80000efc:	ff2418e3          	bne	s0,s2,80000eec <test_scheduler_basic+0x9c>
    80000f00:	04013403          	ld	s0,64(sp)
    80000f04:	04813083          	ld	ra,72(sp)
    80000f08:	03813483          	ld	s1,56(sp)
    80000f0c:	03013903          	ld	s2,48(sp)
    80000f10:	02813983          	ld	s3,40(sp)
    80000f14:	02013a03          	ld	s4,32(sp)
    80000f18:	00007517          	auipc	a0,0x7
    80000f1c:	b5850513          	add	a0,a0,-1192 # 80007a70 <rodata_start+0xa70>
    80000f20:	05010113          	add	sp,sp,80
    80000f24:	0780206f          	j	80002f9c <uart_puts>
    80000f28:	0015859b          	addw	a1,a1,1
    80000f2c:	fac792e3          	bne	a5,a2,80000ed0 <test_scheduler_basic+0x80>
    80000f30:	fb1ff06f          	j	80000ee0 <test_scheduler_basic+0x90>

0000000080000f34 <run_process_management_tests>:
    80000f34:	ff010113          	add	sp,sp,-16
    80000f38:	00007517          	auipc	a0,0x7
    80000f3c:	d2050513          	add	a0,a0,-736 # 80007c58 <rodata_start+0xc58>
    80000f40:	00113423          	sd	ra,8(sp)
    80000f44:	058020ef          	jal	80002f9c <uart_puts>
    80000f48:	00007517          	auipc	a0,0x7
    80000f4c:	ea850513          	add	a0,a0,-344 # 80007df0 <rodata_start+0xdf0>
    80000f50:	04c020ef          	jal	80002f9c <uart_puts>
    80000f54:	00007517          	auipc	a0,0x7
    80000f58:	f6450513          	add	a0,a0,-156 # 80007eb8 <rodata_start+0xeb8>
    80000f5c:	040020ef          	jal	80002f9c <uart_puts>
    80000f60:	00007517          	auipc	a0,0x7
    80000f64:	fb850513          	add	a0,a0,-72 # 80007f18 <rodata_start+0xf18>
    80000f68:	034020ef          	jal	80002f9c <uart_puts>
    80000f6c:	aa9ff0ef          	jal	80000a14 <test_process_allocation>
    80000f70:	bd1ff0ef          	jal	80000b40 <test_process_find>
    80000f74:	cadff0ef          	jal	80000c20 <test_process_state_transition>
    80000f78:	dc9ff0ef          	jal	80000d40 <test_simple_fork>
    80000f7c:	ed5ff0ef          	jal	80000e50 <test_scheduler_basic>
    80000f80:	00007517          	auipc	a0,0x7
    80000f84:	cd850513          	add	a0,a0,-808 # 80007c58 <rodata_start+0xc58>
    80000f88:	014020ef          	jal	80002f9c <uart_puts>
    80000f8c:	00007517          	auipc	a0,0x7
    80000f90:	e6450513          	add	a0,a0,-412 # 80007df0 <rodata_start+0xdf0>
    80000f94:	008020ef          	jal	80002f9c <uart_puts>
    80000f98:	00007517          	auipc	a0,0x7
    80000f9c:	04850513          	add	a0,a0,72 # 80007fe0 <rodata_start+0xfe0>
    80000fa0:	7fd010ef          	jal	80002f9c <uart_puts>
    80000fa4:	00007517          	auipc	a0,0x7
    80000fa8:	09450513          	add	a0,a0,148 # 80008038 <rodata_start+0x1038>
    80000fac:	7f1010ef          	jal	80002f9c <uart_puts>
    80000fb0:	00007517          	auipc	a0,0x7
    80000fb4:	15850513          	add	a0,a0,344 # 80008108 <rodata_start+0x1108>
    80000fb8:	7e5010ef          	jal	80002f9c <uart_puts>
    80000fbc:	00007517          	auipc	a0,0x7
    80000fc0:	16450513          	add	a0,a0,356 # 80008120 <rodata_start+0x1120>
    80000fc4:	7d9010ef          	jal	80002f9c <uart_puts>
    80000fc8:	00007517          	auipc	a0,0x7
    80000fcc:	18850513          	add	a0,a0,392 # 80008150 <rodata_start+0x1150>
    80000fd0:	7cd010ef          	jal	80002f9c <uart_puts>
    80000fd4:	00007517          	auipc	a0,0x7
    80000fd8:	19c50513          	add	a0,a0,412 # 80008170 <rodata_start+0x1170>
    80000fdc:	7c1010ef          	jal	80002f9c <uart_puts>
    80000fe0:	00007517          	auipc	a0,0x7
    80000fe4:	1b050513          	add	a0,a0,432 # 80008190 <rodata_start+0x1190>
    80000fe8:	7b5010ef          	jal	80002f9c <uart_puts>
    80000fec:	00813083          	ld	ra,8(sp)
    80000ff0:	00007517          	auipc	a0,0x7
    80000ff4:	1d050513          	add	a0,a0,464 # 800081c0 <rodata_start+0x11c0>
    80000ff8:	01010113          	add	sp,sp,16
    80000ffc:	7a10106f          	j	80002f9c <uart_puts>

0000000080001000 <test_round_robin_scheduler>:
    80001000:	fa010113          	add	sp,sp,-96
    80001004:	04813823          	sd	s0,80(sp)
    80001008:	00007517          	auipc	a0,0x7
    8000100c:	1d850513          	add	a0,a0,472 # 800081e0 <rodata_start+0x11e0>
    80001010:	00810413          	add	s0,sp,8
    80001014:	04913423          	sd	s1,72(sp)
    80001018:	05213023          	sd	s2,64(sp)
    8000101c:	03313c23          	sd	s3,56(sp)
    80001020:	03413823          	sd	s4,48(sp)
    80001024:	03513423          	sd	s5,40(sp)
    80001028:	03613023          	sd	s6,32(sp)
    8000102c:	04113c23          	sd	ra,88(sp)
    80001030:	00040913          	mv	s2,s0
    80001034:	769010ef          	jal	80002f9c <uart_puts>
    80001038:	00000493          	li	s1,0
    8000103c:	fffffb17          	auipc	s6,0xfffff
    80001040:	044b0b13          	add	s6,s6,68 # 80000080 <rr_worker>
    80001044:	00200a93          	li	s5,2
    80001048:	00007a17          	auipc	s4,0x7
    8000104c:	200a0a13          	add	s4,s4,512 # 80008248 <rodata_start+0x1248>
    80001050:	00300993          	li	s3,3
    80001054:	7f4040ef          	jal	80005848 <alloc_proc>
    80001058:	00050793          	mv	a5,a0
    8000105c:	00a93023          	sd	a0,0(s2)
    80001060:	000a0513          	mv	a0,s4
    80001064:	06078c63          	beqz	a5,800010dc <test_round_robin_scheduler+0xdc>
    80001068:	0087a583          	lw	a1,8(a5)
    8000106c:	0567b823          	sd	s6,80(a5)
    80001070:	0157a223          	sw	s5,4(a5)
    80001074:	3b9010ef          	jal	80002c2c <printf>
    80001078:	0014849b          	addw	s1,s1,1
    8000107c:	00890913          	add	s2,s2,8
    80001080:	fd349ae3          	bne	s1,s3,80001054 <test_round_robin_scheduler+0x54>
    80001084:	00007517          	auipc	a0,0x7
    80001088:	1e450513          	add	a0,a0,484 # 80008268 <rodata_start+0x1268>
    8000108c:	711010ef          	jal	80002f9c <uart_puts>
    80001090:	01840493          	add	s1,s0,24
    80001094:	261040ef          	jal	80005af4 <scheduler>
    80001098:	00043503          	ld	a0,0(s0)
    8000109c:	00840413          	add	s0,s0,8
    800010a0:	00050463          	beqz	a0,800010a8 <test_round_robin_scheduler+0xa8>
    800010a4:	121040ef          	jal	800059c4 <free_proc>
    800010a8:	fe9418e3          	bne	s0,s1,80001098 <test_round_robin_scheduler+0x98>
    800010ac:	05013403          	ld	s0,80(sp)
    800010b0:	05813083          	ld	ra,88(sp)
    800010b4:	04813483          	ld	s1,72(sp)
    800010b8:	04013903          	ld	s2,64(sp)
    800010bc:	03813983          	ld	s3,56(sp)
    800010c0:	03013a03          	ld	s4,48(sp)
    800010c4:	02813a83          	ld	s5,40(sp)
    800010c8:	02013b03          	ld	s6,32(sp)
    800010cc:	00007517          	auipc	a0,0x7
    800010d0:	1dc50513          	add	a0,a0,476 # 800082a8 <rodata_start+0x12a8>
    800010d4:	06010113          	add	sp,sp,96
    800010d8:	6c50106f          	j	80002f9c <uart_puts>
    800010dc:	00048593          	mv	a1,s1
    800010e0:	00007517          	auipc	a0,0x7
    800010e4:	14850513          	add	a0,a0,328 # 80008228 <rodata_start+0x1228>
    800010e8:	345010ef          	jal	80002c2c <printf>
    800010ec:	f8dff06f          	j	80001078 <test_round_robin_scheduler+0x78>

00000000800010f0 <test_trap_initialization>:
    800010f0:	ff010113          	add	sp,sp,-16
    800010f4:	00007517          	auipc	a0,0x7
    800010f8:	1dc50513          	add	a0,a0,476 # 800082d0 <rodata_start+0x12d0>
    800010fc:	00113423          	sd	ra,8(sp)
    80001100:	00813023          	sd	s0,0(sp)
    80001104:	699010ef          	jal	80002f9c <uart_puts>
    80001108:	555030ef          	jal	80004e5c <trap_init>
    8000110c:	601030ef          	jal	80004f0c <trap_init_hart>
    80001110:	10502473          	csrr	s0,stvec
    80001114:	00007517          	auipc	a0,0x7
    80001118:	1fc50513          	add	a0,a0,508 # 80008310 <rodata_start+0x1310>
    8000111c:	00040593          	mv	a1,s0
    80001120:	30d010ef          	jal	80002c2c <printf>
    80001124:	02040c63          	beqz	s0,8000115c <test_trap_initialization+0x6c>
    80001128:	00007517          	auipc	a0,0x7
    8000112c:	20850513          	add	a0,a0,520 # 80008330 <rodata_start+0x1330>
    80001130:	66d010ef          	jal	80002f9c <uart_puts>
    80001134:	104025f3          	csrr	a1,sie
    80001138:	00007517          	auipc	a0,0x7
    8000113c:	24050513          	add	a0,a0,576 # 80008378 <rodata_start+0x1378>
    80001140:	2ed010ef          	jal	80002c2c <printf>
    80001144:	00013403          	ld	s0,0(sp)
    80001148:	00813083          	ld	ra,8(sp)
    8000114c:	00006517          	auipc	a0,0x6
    80001150:	fcc50513          	add	a0,a0,-52 # 80007118 <rodata_start+0x118>
    80001154:	01010113          	add	sp,sp,16
    80001158:	6450106f          	j	80002f9c <uart_puts>
    8000115c:	00007517          	auipc	a0,0x7
    80001160:	1f450513          	add	a0,a0,500 # 80008350 <rodata_start+0x1350>
    80001164:	639010ef          	jal	80002f9c <uart_puts>
    80001168:	fcdff06f          	j	80001134 <test_trap_initialization+0x44>

000000008000116c <test_interrupt_control>:
    8000116c:	ff010113          	add	sp,sp,-16
    80001170:	00007517          	auipc	a0,0x7
    80001174:	23850513          	add	a0,a0,568 # 800083a8 <rodata_start+0x13a8>
    80001178:	00113423          	sd	ra,8(sp)
    8000117c:	00813023          	sd	s0,0(sp)
    80001180:	61d010ef          	jal	80002f9c <uart_puts>
    80001184:	00007517          	auipc	a0,0x7
    80001188:	26450513          	add	a0,a0,612 # 800083e8 <rodata_start+0x13e8>
    8000118c:	611010ef          	jal	80002f9c <uart_puts>
    80001190:	4a1030ef          	jal	80004e30 <intr_off>
    80001194:	4ad030ef          	jal	80004e40 <intr_get>
    80001198:	00050413          	mv	s0,a0
    8000119c:	00050593          	mv	a1,a0
    800011a0:	00007517          	auipc	a0,0x7
    800011a4:	26050513          	add	a0,a0,608 # 80008400 <rodata_start+0x1400>
    800011a8:	285010ef          	jal	80002c2c <printf>
    800011ac:	06041063          	bnez	s0,8000120c <test_interrupt_control+0xa0>
    800011b0:	00007517          	auipc	a0,0x7
    800011b4:	27050513          	add	a0,a0,624 # 80008420 <rodata_start+0x1420>
    800011b8:	5e5010ef          	jal	80002f9c <uart_puts>
    800011bc:	00007517          	auipc	a0,0x7
    800011c0:	29450513          	add	a0,a0,660 # 80008450 <rodata_start+0x1450>
    800011c4:	5d9010ef          	jal	80002f9c <uart_puts>
    800011c8:	459030ef          	jal	80004e20 <intr_on>
    800011cc:	475030ef          	jal	80004e40 <intr_get>
    800011d0:	00050413          	mv	s0,a0
    800011d4:	00050593          	mv	a1,a0
    800011d8:	00007517          	auipc	a0,0x7
    800011dc:	29050513          	add	a0,a0,656 # 80008468 <rodata_start+0x1468>
    800011e0:	24d010ef          	jal	80002c2c <printf>
    800011e4:	02040c63          	beqz	s0,8000121c <test_interrupt_control+0xb0>
    800011e8:	00007517          	auipc	a0,0x7
    800011ec:	2a050513          	add	a0,a0,672 # 80008488 <rodata_start+0x1488>
    800011f0:	5ad010ef          	jal	80002f9c <uart_puts>
    800011f4:	00013403          	ld	s0,0(sp)
    800011f8:	00813083          	ld	ra,8(sp)
    800011fc:	00006517          	auipc	a0,0x6
    80001200:	00450513          	add	a0,a0,4 # 80007200 <rodata_start+0x200>
    80001204:	01010113          	add	sp,sp,16
    80001208:	5950106f          	j	80002f9c <uart_puts>
    8000120c:	00007517          	auipc	a0,0x7
    80001210:	22c50513          	add	a0,a0,556 # 80008438 <rodata_start+0x1438>
    80001214:	589010ef          	jal	80002f9c <uart_puts>
    80001218:	fa5ff06f          	j	800011bc <test_interrupt_control+0x50>
    8000121c:	00007517          	auipc	a0,0x7
    80001220:	28450513          	add	a0,a0,644 # 800084a0 <rodata_start+0x14a0>
    80001224:	579010ef          	jal	80002f9c <uart_puts>
    80001228:	00013403          	ld	s0,0(sp)
    8000122c:	00813083          	ld	ra,8(sp)
    80001230:	00006517          	auipc	a0,0x6
    80001234:	fd050513          	add	a0,a0,-48 # 80007200 <rodata_start+0x200>
    80001238:	01010113          	add	sp,sp,16
    8000123c:	5610106f          	j	80002f9c <uart_puts>

0000000080001240 <test_trapframe_allocation>:
    80001240:	fe010113          	add	sp,sp,-32
    80001244:	00007517          	auipc	a0,0x7
    80001248:	27450513          	add	a0,a0,628 # 800084b8 <rodata_start+0x14b8>
    8000124c:	00113c23          	sd	ra,24(sp)
    80001250:	00813823          	sd	s0,16(sp)
    80001254:	00913423          	sd	s1,8(sp)
    80001258:	01213023          	sd	s2,0(sp)
    8000125c:	541010ef          	jal	80002f9c <uart_puts>
    80001260:	00007517          	auipc	a0,0x7
    80001264:	29850513          	add	a0,a0,664 # 800084f8 <rodata_start+0x14f8>
    80001268:	535010ef          	jal	80002f9c <uart_puts>
    8000126c:	311030ef          	jal	80004d7c <alloc_trapframe>
    80001270:	00050413          	mv	s0,a0
    80001274:	309030ef          	jal	80004d7c <alloc_trapframe>
    80001278:	00050493          	mv	s1,a0
    8000127c:	301030ef          	jal	80004d7c <alloc_trapframe>
    80001280:	10040863          	beqz	s0,80001390 <test_trapframe_allocation+0x150>
    80001284:	10048663          	beqz	s1,80001390 <test_trapframe_allocation+0x150>
    80001288:	00050913          	mv	s2,a0
    8000128c:	10050263          	beqz	a0,80001390 <test_trapframe_allocation+0x150>
    80001290:	00007517          	auipc	a0,0x7
    80001294:	28050513          	add	a0,a0,640 # 80008510 <rodata_start+0x1510>
    80001298:	195010ef          	jal	80002c2c <printf>
    8000129c:	00040593          	mv	a1,s0
    800012a0:	00007517          	auipc	a0,0x7
    800012a4:	29050513          	add	a0,a0,656 # 80008530 <rodata_start+0x1530>
    800012a8:	185010ef          	jal	80002c2c <printf>
    800012ac:	00048593          	mv	a1,s1
    800012b0:	00007517          	auipc	a0,0x7
    800012b4:	29050513          	add	a0,a0,656 # 80008540 <rodata_start+0x1540>
    800012b8:	175010ef          	jal	80002c2c <printf>
    800012bc:	00090593          	mv	a1,s2
    800012c0:	00007517          	auipc	a0,0x7
    800012c4:	29050513          	add	a0,a0,656 # 80008550 <rodata_start+0x1550>
    800012c8:	165010ef          	jal	80002c2c <printf>
    800012cc:	00940463          	beq	s0,s1,800012d4 <test_trapframe_allocation+0x94>
    800012d0:	0f249663          	bne	s1,s2,800013bc <test_trapframe_allocation+0x17c>
    800012d4:	00007517          	auipc	a0,0x7
    800012d8:	2ac50513          	add	a0,a0,684 # 80008580 <rodata_start+0x1580>
    800012dc:	4c1010ef          	jal	80002f9c <uart_puts>
    800012e0:	00007517          	auipc	a0,0x7
    800012e4:	2d050513          	add	a0,a0,720 # 800085b0 <rodata_start+0x15b0>
    800012e8:	4b5010ef          	jal	80002f9c <uart_puts>
    800012ec:	21d957b7          	lui	a5,0x21d95
    800012f0:	00279793          	sll	a5,a5,0x2
    800012f4:	32178793          	add	a5,a5,801 # 21d95321 <_entry-0x5e26acdf>
    800012f8:	12345737          	lui	a4,0x12345
    800012fc:	67870713          	add	a4,a4,1656 # 12345678 <_entry-0x6dcba988>
    80001300:	02f43823          	sd	a5,48(s0)
    80001304:	02a00793          	li	a5,42
    80001308:	02e43423          	sd	a4,40(s0)
    8000130c:	06f43823          	sd	a5,112(s0)
    80001310:	00007517          	auipc	a0,0x7
    80001314:	2c050513          	add	a0,a0,704 # 800085d0 <rodata_start+0x15d0>
    80001318:	485010ef          	jal	80002f9c <uart_puts>
    8000131c:	00007517          	auipc	a0,0x7
    80001320:	2d450513          	add	a0,a0,724 # 800085f0 <rodata_start+0x15f0>
    80001324:	479010ef          	jal	80002f9c <uart_puts>
    80001328:	00040513          	mv	a0,s0
    8000132c:	2b1030ef          	jal	80004ddc <free_trapframe>
    80001330:	00048513          	mv	a0,s1
    80001334:	2a9030ef          	jal	80004ddc <free_trapframe>
    80001338:	00090513          	mv	a0,s2
    8000133c:	2a1030ef          	jal	80004ddc <free_trapframe>
    80001340:	00007517          	auipc	a0,0x7
    80001344:	2c850513          	add	a0,a0,712 # 80008608 <rodata_start+0x1608>
    80001348:	455010ef          	jal	80002f9c <uart_puts>
    8000134c:	231030ef          	jal	80004d7c <alloc_trapframe>
    80001350:	00050413          	mv	s0,a0
    80001354:	04050463          	beqz	a0,8000139c <test_trapframe_allocation+0x15c>
    80001358:	00050593          	mv	a1,a0
    8000135c:	00007517          	auipc	a0,0x7
    80001360:	2cc50513          	add	a0,a0,716 # 80008628 <rodata_start+0x1628>
    80001364:	0c9010ef          	jal	80002c2c <printf>
    80001368:	00040513          	mv	a0,s0
    8000136c:	271030ef          	jal	80004ddc <free_trapframe>
    80001370:	01013403          	ld	s0,16(sp)
    80001374:	01813083          	ld	ra,24(sp)
    80001378:	00813483          	ld	s1,8(sp)
    8000137c:	00013903          	ld	s2,0(sp)
    80001380:	00006517          	auipc	a0,0x6
    80001384:	05050513          	add	a0,a0,80 # 800073d0 <rodata_start+0x3d0>
    80001388:	02010113          	add	sp,sp,32
    8000138c:	4110106f          	j	80002f9c <uart_puts>
    80001390:	00007517          	auipc	a0,0x7
    80001394:	2c850513          	add	a0,a0,712 # 80008658 <rodata_start+0x1658>
    80001398:	405010ef          	jal	80002f9c <uart_puts>
    8000139c:	01013403          	ld	s0,16(sp)
    800013a0:	01813083          	ld	ra,24(sp)
    800013a4:	00813483          	ld	s1,8(sp)
    800013a8:	00013903          	ld	s2,0(sp)
    800013ac:	00006517          	auipc	a0,0x6
    800013b0:	02450513          	add	a0,a0,36 # 800073d0 <rodata_start+0x3d0>
    800013b4:	02010113          	add	sp,sp,32
    800013b8:	3e50106f          	j	80002f9c <uart_puts>
    800013bc:	00007517          	auipc	a0,0x7
    800013c0:	1a450513          	add	a0,a0,420 # 80008560 <rodata_start+0x1560>
    800013c4:	3d9010ef          	jal	80002f9c <uart_puts>
    800013c8:	f19ff06f          	j	800012e0 <test_trapframe_allocation+0xa0>

00000000800013cc <test_csr_operations>:
    800013cc:	ff010113          	add	sp,sp,-16
    800013d0:	00007517          	auipc	a0,0x7
    800013d4:	2a850513          	add	a0,a0,680 # 80008678 <rodata_start+0x1678>
    800013d8:	00113423          	sd	ra,8(sp)
    800013dc:	00813023          	sd	s0,0(sp)
    800013e0:	3bd010ef          	jal	80002f9c <uart_puts>
    800013e4:	10002473          	csrr	s0,sstatus
    800013e8:	00007517          	auipc	a0,0x7
    800013ec:	2c850513          	add	a0,a0,712 # 800086b0 <rodata_start+0x16b0>
    800013f0:	00040593          	mv	a1,s0
    800013f4:	039010ef          	jal	80002c2c <printf>
    800013f8:	142025f3          	csrr	a1,scause
    800013fc:	00007517          	auipc	a0,0x7
    80001400:	2cc50513          	add	a0,a0,716 # 800086c8 <rodata_start+0x16c8>
    80001404:	029010ef          	jal	80002c2c <printf>
    80001408:	141025f3          	csrr	a1,sepc
    8000140c:	00007517          	auipc	a0,0x7
    80001410:	2d450513          	add	a0,a0,724 # 800086e0 <rodata_start+0x16e0>
    80001414:	019010ef          	jal	80002c2c <printf>
    80001418:	00007517          	auipc	a0,0x7
    8000141c:	2e050513          	add	a0,a0,736 # 800086f8 <rodata_start+0x16f8>
    80001420:	37d010ef          	jal	80002f9c <uart_puts>
    80001424:	00000793          	li	a5,0
    80001428:	10079073          	csrw	sstatus,a5
    8000142c:	100025f3          	csrr	a1,sstatus
    80001430:	00007517          	auipc	a0,0x7
    80001434:	2e050513          	add	a0,a0,736 # 80008710 <rodata_start+0x1710>
    80001438:	7f4010ef          	jal	80002c2c <printf>
    8000143c:	10041073          	csrw	sstatus,s0
    80001440:	00007517          	auipc	a0,0x7
    80001444:	2e850513          	add	a0,a0,744 # 80008728 <rodata_start+0x1728>
    80001448:	355010ef          	jal	80002f9c <uart_puts>
    8000144c:	00013403          	ld	s0,0(sp)
    80001450:	00813083          	ld	ra,8(sp)
    80001454:	00006517          	auipc	a0,0x6
    80001458:	0cc50513          	add	a0,a0,204 # 80007520 <rodata_start+0x520>
    8000145c:	01010113          	add	sp,sp,16
    80001460:	33d0106f          	j	80002f9c <uart_puts>

0000000080001464 <test_exception_definitions>:
    80001464:	ff010113          	add	sp,sp,-16
    80001468:	00007517          	auipc	a0,0x7
    8000146c:	2d850513          	add	a0,a0,728 # 80008740 <rodata_start+0x1740>
    80001470:	00113423          	sd	ra,8(sp)
    80001474:	329010ef          	jal	80002f9c <uart_puts>
    80001478:	00007517          	auipc	a0,0x7
    8000147c:	30850513          	add	a0,a0,776 # 80008780 <rodata_start+0x1780>
    80001480:	7ac010ef          	jal	80002c2c <printf>
    80001484:	00200593          	li	a1,2
    80001488:	00007517          	auipc	a0,0x7
    8000148c:	31050513          	add	a0,a0,784 # 80008798 <rodata_start+0x1798>
    80001490:	79c010ef          	jal	80002c2c <printf>
    80001494:	00d00593          	li	a1,13
    80001498:	00007517          	auipc	a0,0x7
    8000149c:	32050513          	add	a0,a0,800 # 800087b8 <rodata_start+0x17b8>
    800014a0:	78c010ef          	jal	80002c2c <printf>
    800014a4:	00f00593          	li	a1,15
    800014a8:	00007517          	auipc	a0,0x7
    800014ac:	33050513          	add	a0,a0,816 # 800087d8 <rodata_start+0x17d8>
    800014b0:	77c010ef          	jal	80002c2c <printf>
    800014b4:	00800593          	li	a1,8
    800014b8:	00007517          	auipc	a0,0x7
    800014bc:	34050513          	add	a0,a0,832 # 800087f8 <rodata_start+0x17f8>
    800014c0:	76c010ef          	jal	80002c2c <printf>
    800014c4:	00007517          	auipc	a0,0x7
    800014c8:	34c50513          	add	a0,a0,844 # 80008810 <rodata_start+0x1810>
    800014cc:	760010ef          	jal	80002c2c <printf>
    800014d0:	00500593          	li	a1,5
    800014d4:	00007517          	auipc	a0,0x7
    800014d8:	35450513          	add	a0,a0,852 # 80008828 <rodata_start+0x1828>
    800014dc:	750010ef          	jal	80002c2c <printf>
    800014e0:	00700593          	li	a1,7
    800014e4:	00007517          	auipc	a0,0x7
    800014e8:	35c50513          	add	a0,a0,860 # 80008840 <rodata_start+0x1840>
    800014ec:	740010ef          	jal	80002c2c <printf>
    800014f0:	00900593          	li	a1,9
    800014f4:	00007517          	auipc	a0,0x7
    800014f8:	36450513          	add	a0,a0,868 # 80008858 <rodata_start+0x1858>
    800014fc:	730010ef          	jal	80002c2c <printf>
    80001500:	00007517          	auipc	a0,0x7
    80001504:	37050513          	add	a0,a0,880 # 80008870 <rodata_start+0x1870>
    80001508:	295010ef          	jal	80002f9c <uart_puts>
    8000150c:	00813083          	ld	ra,8(sp)
    80001510:	00006517          	auipc	a0,0x6
    80001514:	1b850513          	add	a0,a0,440 # 800076c8 <rodata_start+0x6c8>
    80001518:	01010113          	add	sp,sp,16
    8000151c:	2810106f          	j	80002f9c <uart_puts>

0000000080001520 <test_trapframe_structure>:
    80001520:	ff010113          	add	sp,sp,-16
    80001524:	00007517          	auipc	a0,0x7
    80001528:	37450513          	add	a0,a0,884 # 80008898 <rodata_start+0x1898>
    8000152c:	00113423          	sd	ra,8(sp)
    80001530:	26d010ef          	jal	80002f9c <uart_puts>
    80001534:	12000593          	li	a1,288
    80001538:	00007517          	auipc	a0,0x7
    8000153c:	39850513          	add	a0,a0,920 # 800088d0 <rodata_start+0x18d0>
    80001540:	6ec010ef          	jal	80002c2c <printf>
    80001544:	00007517          	auipc	a0,0x7
    80001548:	3b450513          	add	a0,a0,948 # 800088f8 <rodata_start+0x18f8>
    8000154c:	6e0010ef          	jal	80002c2c <printf>
    80001550:	00007517          	auipc	a0,0x7
    80001554:	3d850513          	add	a0,a0,984 # 80008928 <rodata_start+0x1928>
    80001558:	6d4010ef          	jal	80002c2c <printf>
    8000155c:	00800593          	li	a1,8
    80001560:	00007517          	auipc	a0,0x7
    80001564:	3e050513          	add	a0,a0,992 # 80008940 <rodata_start+0x1940>
    80001568:	6c4010ef          	jal	80002c2c <printf>
    8000156c:	00800593          	li	a1,8
    80001570:	00007517          	auipc	a0,0x7
    80001574:	3e850513          	add	a0,a0,1000 # 80008958 <rodata_start+0x1958>
    80001578:	6b4010ef          	jal	80002c2c <printf>
    8000157c:	00800593          	li	a1,8
    80001580:	00007517          	auipc	a0,0x7
    80001584:	3f850513          	add	a0,a0,1016 # 80008978 <rodata_start+0x1978>
    80001588:	6a4010ef          	jal	80002c2c <printf>
    8000158c:	02400693          	li	a3,36
    80001590:	00800613          	li	a2,8
    80001594:	12000593          	li	a1,288
    80001598:	00007517          	auipc	a0,0x7
    8000159c:	40050513          	add	a0,a0,1024 # 80008998 <rodata_start+0x1998>
    800015a0:	68c010ef          	jal	80002c2c <printf>
    800015a4:	00007517          	auipc	a0,0x7
    800015a8:	41c50513          	add	a0,a0,1052 # 800089c0 <rodata_start+0x19c0>
    800015ac:	1f1010ef          	jal	80002f9c <uart_puts>
    800015b0:	00813083          	ld	ra,8(sp)
    800015b4:	00006517          	auipc	a0,0x6
    800015b8:	2b450513          	add	a0,a0,692 # 80007868 <rodata_start+0x868>
    800015bc:	01010113          	add	sp,sp,16
    800015c0:	1dd0106f          	j	80002f9c <uart_puts>

00000000800015c4 <test_interrupt_handlers>:
    800015c4:	ff010113          	add	sp,sp,-16
    800015c8:	00007517          	auipc	a0,0x7
    800015cc:	42050513          	add	a0,a0,1056 # 800089e8 <rodata_start+0x19e8>
    800015d0:	00113423          	sd	ra,8(sp)
    800015d4:	1c9010ef          	jal	80002f9c <uart_puts>
    800015d8:	00007517          	auipc	a0,0x7
    800015dc:	45050513          	add	a0,a0,1104 # 80008a28 <rodata_start+0x1a28>
    800015e0:	1bd010ef          	jal	80002f9c <uart_puts>
    800015e4:	00413797          	auipc	a5,0x413
    800015e8:	ec478793          	add	a5,a5,-316 # 804144a8 <trap_handlers>
    800015ec:	00413697          	auipc	a3,0x413
    800015f0:	f3c68693          	add	a3,a3,-196 # 80414528 <trapframe_pool>
    800015f4:	00000593          	li	a1,0
    800015f8:	0007b703          	ld	a4,0(a5)
    800015fc:	00878793          	add	a5,a5,8
    80001600:	00070463          	beqz	a4,80001608 <test_interrupt_handlers+0x44>
    80001604:	0015859b          	addw	a1,a1,1
    80001608:	fed798e3          	bne	a5,a3,800015f8 <test_interrupt_handlers+0x34>
    8000160c:	00007517          	auipc	a0,0x7
    80001610:	43c50513          	add	a0,a0,1084 # 80008a48 <rodata_start+0x1a48>
    80001614:	618010ef          	jal	80002c2c <printf>
    80001618:	00007517          	auipc	a0,0x7
    8000161c:	45850513          	add	a0,a0,1112 # 80008a70 <rodata_start+0x1a70>
    80001620:	17d010ef          	jal	80002f9c <uart_puts>
    80001624:	00813083          	ld	ra,8(sp)
    80001628:	00006517          	auipc	a0,0x6
    8000162c:	33050513          	add	a0,a0,816 # 80007958 <rodata_start+0x958>
    80001630:	01010113          	add	sp,sp,16
    80001634:	1690106f          	j	80002f9c <uart_puts>

0000000080001638 <test_user_kernel_transition>:
    80001638:	fe010113          	add	sp,sp,-32
    8000163c:	00007517          	auipc	a0,0x7
    80001640:	46450513          	add	a0,a0,1124 # 80008aa0 <rodata_start+0x1aa0>
    80001644:	00113c23          	sd	ra,24(sp)
    80001648:	00813823          	sd	s0,16(sp)
    8000164c:	00913423          	sd	s1,8(sp)
    80001650:	14d010ef          	jal	80002f9c <uart_puts>
    80001654:	1f4040ef          	jal	80005848 <alloc_proc>
    80001658:	2e050c63          	beqz	a0,80001950 <test_user_kernel_transition+0x318>
    8000165c:	00050413          	mv	s0,a0
    80001660:	1e9010ef          	jal	80003048 <alloc_page>
    80001664:	04a43023          	sd	a0,64(s0)
    80001668:	00050793          	mv	a5,a0
    8000166c:	12050713          	add	a4,a0,288
    80001670:	2e050e63          	beqz	a0,8000196c <test_user_kernel_transition+0x334>
    80001674:	0007b023          	sd	zero,0(a5)
    80001678:	00878793          	add	a5,a5,8
    8000167c:	fee79ce3          	bne	a5,a4,80001674 <test_user_kernel_transition+0x3c>
    80001680:	00300793          	li	a5,3
    80001684:	00f42223          	sw	a5,4(s0)
    80001688:	06400793          	li	a5,100
    8000168c:	00f42423          	sw	a5,8(s0)
    80001690:	00040513          	mv	a0,s0
    80001694:	440040ef          	jal	80005ad4 <set_current_proc>
    80001698:	00842583          	lw	a1,8(s0)
    8000169c:	00007517          	auipc	a0,0x7
    800016a0:	46c50513          	add	a0,a0,1132 # 80008b08 <rodata_start+0x1b08>
    800016a4:	588010ef          	jal	80002c2c <printf>
    800016a8:	04043583          	ld	a1,64(s0)
    800016ac:	00007517          	auipc	a0,0x7
    800016b0:	48450513          	add	a0,a0,1156 # 80008b30 <rodata_start+0x1b30>
    800016b4:	578010ef          	jal	80002c2c <printf>
    800016b8:	00007517          	auipc	a0,0x7
    800016bc:	49850513          	add	a0,a0,1176 # 80008b50 <rodata_start+0x1b50>
    800016c0:	0dd010ef          	jal	80002f9c <uart_puts>
    800016c4:	04043783          	ld	a5,64(s0)
    800016c8:	00b00713          	li	a4,11
    800016cc:	00001637          	lui	a2,0x1
    800016d0:	0ae7b423          	sd	a4,168(a5)
    800016d4:	00001737          	lui	a4,0x1
    800016d8:	00e7bc23          	sd	a4,24(a5)
    800016dc:	00b00593          	li	a1,11
    800016e0:	0607b823          	sd	zero,112(a5)
    800016e4:	00007517          	auipc	a0,0x7
    800016e8:	4a450513          	add	a0,a0,1188 # 80008b88 <rodata_start+0x1b88>
    800016ec:	540010ef          	jal	80002c2c <printf>
    800016f0:	130050ef          	jal	80006820 <syscall>
    800016f4:	04043783          	ld	a5,64(s0)
    800016f8:	00842603          	lw	a2,8(s0)
    800016fc:	00007517          	auipc	a0,0x7
    80001700:	4bc50513          	add	a0,a0,1212 # 80008bb8 <rodata_start+0x1bb8>
    80001704:	0707b583          	ld	a1,112(a5)
    80001708:	524010ef          	jal	80002c2c <printf>
    8000170c:	04043703          	ld	a4,64(s0)
    80001710:	00842783          	lw	a5,8(s0)
    80001714:	07073703          	ld	a4,112(a4) # 1070 <_entry-0x7fffef90>
    80001718:	20f70463          	beq	a4,a5,80001920 <test_user_kernel_transition+0x2e8>
    8000171c:	00007517          	auipc	a0,0x7
    80001720:	4ec50513          	add	a0,a0,1260 # 80008c08 <rodata_start+0x1c08>
    80001724:	079010ef          	jal	80002f9c <uart_puts>
    80001728:	00007517          	auipc	a0,0x7
    8000172c:	50050513          	add	a0,a0,1280 # 80008c28 <rodata_start+0x1c28>
    80001730:	06d010ef          	jal	80002f9c <uart_puts>
    80001734:	04043783          	ld	a5,64(s0)
    80001738:	00e00713          	li	a4,14
    8000173c:	00e00593          	li	a1,14
    80001740:	0ae7b423          	sd	a4,168(a5)
    80001744:	0607b823          	sd	zero,112(a5)
    80001748:	00007517          	auipc	a0,0x7
    8000174c:	51850513          	add	a0,a0,1304 # 80008c60 <rodata_start+0x1c60>
    80001750:	4dc010ef          	jal	80002c2c <printf>
    80001754:	0cc050ef          	jal	80006820 <syscall>
    80001758:	04043783          	ld	a5,64(s0)
    8000175c:	00007517          	auipc	a0,0x7
    80001760:	52450513          	add	a0,a0,1316 # 80008c80 <rodata_start+0x1c80>
    80001764:	0707b583          	ld	a1,112(a5)
    80001768:	4c4010ef          	jal	80002c2c <printf>
    8000176c:	00007517          	auipc	a0,0x7
    80001770:	53c50513          	add	a0,a0,1340 # 80008ca8 <rodata_start+0x1ca8>
    80001774:	029010ef          	jal	80002f9c <uart_puts>
    80001778:	00007517          	auipc	a0,0x7
    8000177c:	56050513          	add	a0,a0,1376 # 80008cd8 <rodata_start+0x1cd8>
    80001780:	01d010ef          	jal	80002f9c <uart_puts>
    80001784:	04043783          	ld	a5,64(s0)
    80001788:	00001737          	lui	a4,0x1
    8000178c:	02e43823          	sd	a4,48(s0)
    80001790:	00c00713          	li	a4,12
    80001794:	0ae7b423          	sd	a4,168(a5)
    80001798:	40000713          	li	a4,1024
    8000179c:	06e7b823          	sd	a4,112(a5)
    800017a0:	40000613          	li	a2,1024
    800017a4:	00c00593          	li	a1,12
    800017a8:	00007517          	auipc	a0,0x7
    800017ac:	57050513          	add	a0,a0,1392 # 80008d18 <rodata_start+0x1d18>
    800017b0:	47c010ef          	jal	80002c2c <printf>
    800017b4:	03043583          	ld	a1,48(s0)
    800017b8:	00007517          	auipc	a0,0x7
    800017bc:	59050513          	add	a0,a0,1424 # 80008d48 <rodata_start+0x1d48>
    800017c0:	46c010ef          	jal	80002c2c <printf>
    800017c4:	03043483          	ld	s1,48(s0)
    800017c8:	058050ef          	jal	80006820 <syscall>
    800017cc:	04043783          	ld	a5,64(s0)
    800017d0:	00007517          	auipc	a0,0x7
    800017d4:	59850513          	add	a0,a0,1432 # 80008d68 <rodata_start+0x1d68>
    800017d8:	0707b583          	ld	a1,112(a5)
    800017dc:	450010ef          	jal	80002c2c <printf>
    800017e0:	03043583          	ld	a1,48(s0)
    800017e4:	00007517          	auipc	a0,0x7
    800017e8:	5ac50513          	add	a0,a0,1452 # 80008d90 <rodata_start+0x1d90>
    800017ec:	440010ef          	jal	80002c2c <printf>
    800017f0:	04043783          	ld	a5,64(s0)
    800017f4:	0707b783          	ld	a5,112(a5)
    800017f8:	14978463          	beq	a5,s1,80001940 <test_user_kernel_transition+0x308>
    800017fc:	00007517          	auipc	a0,0x7
    80001800:	5d450513          	add	a0,a0,1492 # 80008dd0 <rodata_start+0x1dd0>
    80001804:	798010ef          	jal	80002f9c <uart_puts>
    80001808:	00007517          	auipc	a0,0x7
    8000180c:	5e850513          	add	a0,a0,1512 # 80008df0 <rodata_start+0x1df0>
    80001810:	78c010ef          	jal	80002f9c <uart_puts>
    80001814:	04043783          	ld	a5,64(s0)
    80001818:	3e700713          	li	a4,999
    8000181c:	3e700593          	li	a1,999
    80001820:	0ae7b423          	sd	a4,168(a5)
    80001824:	0607b823          	sd	zero,112(a5)
    80001828:	00007517          	auipc	a0,0x7
    8000182c:	60050513          	add	a0,a0,1536 # 80008e28 <rodata_start+0x1e28>
    80001830:	3fc010ef          	jal	80002c2c <printf>
    80001834:	7ed040ef          	jal	80006820 <syscall>
    80001838:	04043783          	ld	a5,64(s0)
    8000183c:	00007517          	auipc	a0,0x7
    80001840:	61450513          	add	a0,a0,1556 # 80008e50 <rodata_start+0x1e50>
    80001844:	0707b583          	ld	a1,112(a5)
    80001848:	3e4010ef          	jal	80002c2c <printf>
    8000184c:	04043703          	ld	a4,64(s0)
    80001850:	fff00793          	li	a5,-1
    80001854:	07073703          	ld	a4,112(a4) # 1070 <_entry-0x7fffef90>
    80001858:	0cf70c63          	beq	a4,a5,80001930 <test_user_kernel_transition+0x2f8>
    8000185c:	00007517          	auipc	a0,0x7
    80001860:	63450513          	add	a0,a0,1588 # 80008e90 <rodata_start+0x1e90>
    80001864:	738010ef          	jal	80002f9c <uart_puts>
    80001868:	00007517          	auipc	a0,0x7
    8000186c:	65050513          	add	a0,a0,1616 # 80008eb8 <rodata_start+0x1eb8>
    80001870:	72c010ef          	jal	80002f9c <uart_puts>
    80001874:	12000593          	li	a1,288
    80001878:	00007517          	auipc	a0,0x7
    8000187c:	67850513          	add	a0,a0,1656 # 80008ef0 <rodata_start+0x1ef0>
    80001880:	3ac010ef          	jal	80002c2c <printf>
    80001884:	00000593          	li	a1,0
    80001888:	00007517          	auipc	a0,0x7
    8000188c:	68850513          	add	a0,a0,1672 # 80008f10 <rodata_start+0x1f10>
    80001890:	39c010ef          	jal	80002c2c <printf>
    80001894:	00800593          	li	a1,8
    80001898:	00007517          	auipc	a0,0x7
    8000189c:	6a050513          	add	a0,a0,1696 # 80008f38 <rodata_start+0x1f38>
    800018a0:	38c010ef          	jal	80002c2c <printf>
    800018a4:	01000593          	li	a1,16
    800018a8:	00007517          	auipc	a0,0x7
    800018ac:	6b850513          	add	a0,a0,1720 # 80008f60 <rodata_start+0x1f60>
    800018b0:	37c010ef          	jal	80002c2c <printf>
    800018b4:	07000593          	li	a1,112
    800018b8:	00007517          	auipc	a0,0x7
    800018bc:	6d050513          	add	a0,a0,1744 # 80008f88 <rodata_start+0x1f88>
    800018c0:	36c010ef          	jal	80002c2c <printf>
    800018c4:	0a800593          	li	a1,168
    800018c8:	00007517          	auipc	a0,0x7
    800018cc:	6e050513          	add	a0,a0,1760 # 80008fa8 <rodata_start+0x1fa8>
    800018d0:	35c010ef          	jal	80002c2c <printf>
    800018d4:	00007517          	auipc	a0,0x7
    800018d8:	6f450513          	add	a0,a0,1780 # 80008fc8 <rodata_start+0x1fc8>
    800018dc:	6c0010ef          	jal	80002f9c <uart_puts>
    800018e0:	00000513          	li	a0,0
    800018e4:	1f0040ef          	jal	80005ad4 <set_current_proc>
    800018e8:	04043503          	ld	a0,64(s0)
    800018ec:	778010ef          	jal	80003064 <free_page>
    800018f0:	00040513          	mv	a0,s0
    800018f4:	0d0040ef          	jal	800059c4 <free_proc>
    800018f8:	00007517          	auipc	a0,0x7
    800018fc:	71050513          	add	a0,a0,1808 # 80009008 <rodata_start+0x2008>
    80001900:	69c010ef          	jal	80002f9c <uart_puts>
    80001904:	01013403          	ld	s0,16(sp)
    80001908:	01813083          	ld	ra,24(sp)
    8000190c:	00813483          	ld	s1,8(sp)
    80001910:	00007517          	auipc	a0,0x7
    80001914:	72850513          	add	a0,a0,1832 # 80009038 <rodata_start+0x2038>
    80001918:	02010113          	add	sp,sp,32
    8000191c:	6800106f          	j	80002f9c <uart_puts>
    80001920:	00007517          	auipc	a0,0x7
    80001924:	2b850513          	add	a0,a0,696 # 80008bd8 <rodata_start+0x1bd8>
    80001928:	674010ef          	jal	80002f9c <uart_puts>
    8000192c:	dfdff06f          	j	80001728 <test_user_kernel_transition+0xf0>
    80001930:	00007517          	auipc	a0,0x7
    80001934:	53850513          	add	a0,a0,1336 # 80008e68 <rodata_start+0x1e68>
    80001938:	664010ef          	jal	80002f9c <uart_puts>
    8000193c:	f2dff06f          	j	80001868 <test_user_kernel_transition+0x230>
    80001940:	00007517          	auipc	a0,0x7
    80001944:	46850513          	add	a0,a0,1128 # 80008da8 <rodata_start+0x1da8>
    80001948:	654010ef          	jal	80002f9c <uart_puts>
    8000194c:	ebdff06f          	j	80001808 <test_user_kernel_transition+0x1d0>
    80001950:	01013403          	ld	s0,16(sp)
    80001954:	01813083          	ld	ra,24(sp)
    80001958:	00813483          	ld	s1,8(sp)
    8000195c:	00005517          	auipc	a0,0x5
    80001960:	72450513          	add	a0,a0,1828 # 80007080 <rodata_start+0x80>
    80001964:	02010113          	add	sp,sp,32
    80001968:	6340106f          	j	80002f9c <uart_puts>
    8000196c:	00007517          	auipc	a0,0x7
    80001970:	17c50513          	add	a0,a0,380 # 80008ae8 <rodata_start+0x1ae8>
    80001974:	628010ef          	jal	80002f9c <uart_puts>
    80001978:	00040513          	mv	a0,s0
    8000197c:	01013403          	ld	s0,16(sp)
    80001980:	01813083          	ld	ra,24(sp)
    80001984:	00813483          	ld	s1,8(sp)
    80001988:	02010113          	add	sp,sp,32
    8000198c:	0380406f          	j	800059c4 <free_proc>

0000000080001990 <test_real_syscall_mechanism>:
    80001990:	f9010113          	add	sp,sp,-112
    80001994:	00007517          	auipc	a0,0x7
    80001998:	6bc50513          	add	a0,a0,1724 # 80009050 <rodata_start+0x2050>
    8000199c:	06113423          	sd	ra,104(sp)
    800019a0:	06813023          	sd	s0,96(sp)
    800019a4:	04913c23          	sd	s1,88(sp)
    800019a8:	05213823          	sd	s2,80(sp)
    800019ac:	05313423          	sd	s3,72(sp)
    800019b0:	05413023          	sd	s4,64(sp)
    800019b4:	03513c23          	sd	s5,56(sp)
    800019b8:	03613823          	sd	s6,48(sp)
    800019bc:	03713423          	sd	s7,40(sp)
    800019c0:	03813023          	sd	s8,32(sp)
    800019c4:	5d8010ef          	jal	80002f9c <uart_puts>
    800019c8:	00007517          	auipc	a0,0x7
    800019cc:	6d050513          	add	a0,a0,1744 # 80009098 <rodata_start+0x2098>
    800019d0:	5cc010ef          	jal	80002f9c <uart_puts>
    800019d4:	00007517          	auipc	a0,0x7
    800019d8:	6fc50513          	add	a0,a0,1788 # 800090d0 <rodata_start+0x20d0>
    800019dc:	5c0010ef          	jal	80002f9c <uart_puts>
    800019e0:	669030ef          	jal	80005848 <alloc_proc>
    800019e4:	76050063          	beqz	a0,80002144 <test_real_syscall_mechanism+0x7b4>
    800019e8:	00050413          	mv	s0,a0
    800019ec:	65c010ef          	jal	80003048 <alloc_page>
    800019f0:	04a43023          	sd	a0,64(s0)
    800019f4:	00050613          	mv	a2,a0
    800019f8:	12050713          	add	a4,a0,288
    800019fc:	00050793          	mv	a5,a0
    80001a00:	78050e63          	beqz	a0,8000219c <test_real_syscall_mechanism+0x80c>
    80001a04:	0007b023          	sd	zero,0(a5)
    80001a08:	00878793          	add	a5,a5,8
    80001a0c:	fee79ce3          	bne	a5,a4,80001a04 <test_real_syscall_mechanism+0x74>
    80001a10:	00300793          	li	a5,3
    80001a14:	00f42223          	sw	a5,4(s0)
    80001a18:	0c800793          	li	a5,200
    80001a1c:	0c800593          	li	a1,200
    80001a20:	00f42423          	sw	a5,8(s0)
    80001a24:	00007517          	auipc	a0,0x7
    80001a28:	6d450513          	add	a0,a0,1748 # 800090f8 <rodata_start+0x20f8>
    80001a2c:	200010ef          	jal	80002c2c <printf>
    80001a30:	00007517          	auipc	a0,0x7
    80001a34:	6f850513          	add	a0,a0,1784 # 80009128 <rodata_start+0x2128>
    80001a38:	564010ef          	jal	80002f9c <uart_puts>
    80001a3c:	7d8010ef          	jal	80003214 <create_pagetable>
    80001a40:	02a43423          	sd	a0,40(s0)
    80001a44:	00050593          	mv	a1,a0
    80001a48:	74050263          	beqz	a0,8000218c <test_real_syscall_mechanism+0x7fc>
    80001a4c:	00007517          	auipc	a0,0x7
    80001a50:	72450513          	add	a0,a0,1828 # 80009170 <rodata_start+0x2170>
    80001a54:	1d8010ef          	jal	80002c2c <printf>
    80001a58:	00007517          	auipc	a0,0x7
    80001a5c:	74050513          	add	a0,a0,1856 # 80009198 <rodata_start+0x2198>
    80001a60:	53c010ef          	jal	80002f9c <uart_puts>
    80001a64:	00005597          	auipc	a1,0x5
    80001a68:	0ac58593          	add	a1,a1,172 # 80006b10 <uservec>
    80001a6c:	fffff4b7          	lui	s1,0xfffff
    80001a70:	00007517          	auipc	a0,0x7
    80001a74:	76850513          	add	a0,a0,1896 # 800091d8 <rodata_start+0x21d8>
    80001a78:	0095f4b3          	and	s1,a1,s1
    80001a7c:	1b0010ef          	jal	80002c2c <printf>
    80001a80:	00048593          	mv	a1,s1
    80001a84:	00007517          	auipc	a0,0x7
    80001a88:	77450513          	add	a0,a0,1908 # 800091f8 <rodata_start+0x21f8>
    80001a8c:	1a0010ef          	jal	80002c2c <printf>
    80001a90:	02843503          	ld	a0,40(s0)
    80001a94:	00a00693          	li	a3,10
    80001a98:	00048613          	mv	a2,s1
    80001a9c:	00048593          	mv	a1,s1
    80001aa0:	7a8010ef          	jal	80003248 <map_page>
    80001aa4:	64051063          	bnez	a0,800020e4 <test_real_syscall_mechanism+0x754>
    80001aa8:	00048593          	mv	a1,s1
    80001aac:	00007517          	auipc	a0,0x7
    80001ab0:	79450513          	add	a0,a0,1940 # 80009240 <rodata_start+0x2240>
    80001ab4:	178010ef          	jal	80002c2c <printf>
    80001ab8:	00007517          	auipc	a0,0x7
    80001abc:	7b850513          	add	a0,a0,1976 # 80009270 <rodata_start+0x2270>
    80001ac0:	4dc010ef          	jal	80002f9c <uart_puts>
    80001ac4:	04043483          	ld	s1,64(s0)
    80001ac8:	00007517          	auipc	a0,0x7
    80001acc:	7e050513          	add	a0,a0,2016 # 800092a8 <rodata_start+0x22a8>
    80001ad0:	00048593          	mv	a1,s1
    80001ad4:	158010ef          	jal	80002c2c <printf>
    80001ad8:	02843503          	ld	a0,40(s0)
    80001adc:	00600693          	li	a3,6
    80001ae0:	00048613          	mv	a2,s1
    80001ae4:	00048593          	mv	a1,s1
    80001ae8:	760010ef          	jal	80003248 <map_page>
    80001aec:	68051863          	bnez	a0,8000217c <test_real_syscall_mechanism+0x7ec>
    80001af0:	00048593          	mv	a1,s1
    80001af4:	00007517          	auipc	a0,0x7
    80001af8:	7f450513          	add	a0,a0,2036 # 800092e8 <rodata_start+0x22e8>
    80001afc:	130010ef          	jal	80002c2c <printf>
    80001b00:	00008517          	auipc	a0,0x8
    80001b04:	81850513          	add	a0,a0,-2024 # 80009318 <rodata_start+0x2318>
    80001b08:	494010ef          	jal	80002f9c <uart_puts>
    80001b0c:	02843503          	ld	a0,40(s0)
    80001b10:	00600693          	li	a3,6
    80001b14:	10000637          	lui	a2,0x10000
    80001b18:	100005b7          	lui	a1,0x10000
    80001b1c:	72c010ef          	jal	80003248 <map_page>
    80001b20:	60051a63          	bnez	a0,80002134 <test_real_syscall_mechanism+0x7a4>
    80001b24:	00008517          	auipc	a0,0x8
    80001b28:	83c50513          	add	a0,a0,-1988 # 80009360 <rodata_start+0x2360>
    80001b2c:	470010ef          	jal	80002f9c <uart_puts>
    80001b30:	00008517          	auipc	a0,0x8
    80001b34:	84850513          	add	a0,a0,-1976 # 80009378 <rodata_start+0x2378>
    80001b38:	464010ef          	jal	80002f9c <uart_puts>
    80001b3c:	50c010ef          	jal	80003048 <alloc_page>
    80001b40:	00050493          	mv	s1,a0
    80001b44:	68050c63          	beqz	a0,800021dc <test_real_syscall_mechanism+0x84c>
    80001b48:	00005917          	auipc	s2,0x5
    80001b4c:	19890913          	add	s2,s2,408 # 80006ce0 <user_test_getpid>
    80001b50:	00005997          	auipc	s3,0x5
    80001b54:	1d898993          	add	s3,s3,472 # 80006d28 <user_test_end>
    80001b58:	412989b3          	sub	s3,s3,s2
    80001b5c:	00098593          	mv	a1,s3
    80001b60:	00008517          	auipc	a0,0x8
    80001b64:	87850513          	add	a0,a0,-1928 # 800093d8 <rodata_start+0x23d8>
    80001b68:	0c4010ef          	jal	80002c2c <printf>
    80001b6c:	00001737          	lui	a4,0x1
    80001b70:	00e48733          	add	a4,s1,a4
    80001b74:	00048793          	mv	a5,s1
    80001b78:	00078023          	sb	zero,0(a5)
    80001b7c:	00178793          	add	a5,a5,1
    80001b80:	fee79ce3          	bne	a5,a4,80001b78 <test_real_syscall_mechanism+0x1e8>
    80001b84:	6a098063          	beqz	s3,80002224 <test_real_syscall_mechanism+0x894>
    80001b88:	00001637          	lui	a2,0x1
    80001b8c:	00100793          	li	a5,1
    80001b90:	00160613          	add	a2,a2,1 # 1001 <_entry-0x7fffefff>
    80001b94:	00c0006f          	j	80001ba0 <test_real_syscall_mechanism+0x210>
    80001b98:	00178793          	add	a5,a5,1
    80001b9c:	00c78c63          	beq	a5,a2,80001bb4 <test_real_syscall_mechanism+0x224>
    80001ba0:	00f90733          	add	a4,s2,a5
    80001ba4:	fff74683          	lbu	a3,-1(a4) # fff <_entry-0x7ffff001>
    80001ba8:	00f48733          	add	a4,s1,a5
    80001bac:	fed70fa3          	sb	a3,-1(a4)
    80001bb0:	fef994e3          	bne	s3,a5,80001b98 <test_real_syscall_mechanism+0x208>
    80001bb4:	00008517          	auipc	a0,0x8
    80001bb8:	84450513          	add	a0,a0,-1980 # 800093f8 <rodata_start+0x23f8>
    80001bbc:	3e0010ef          	jal	80002f9c <uart_puts>
    80001bc0:	00008797          	auipc	a5,0x8
    80001bc4:	58078793          	add	a5,a5,1408 # 8000a140 <rodata_start+0x3140>
    80001bc8:	0007bc03          	ld	s8,0(a5)
    80001bcc:	0087bb83          	ld	s7,8(a5)
    80001bd0:	0107cb03          	lbu	s6,16(a5)
    80001bd4:	00f48a93          	add	s5,s1,15 # fffffffffffff00f <bss_end+0xffffffff7fbd7c1f>
    80001bd8:	013489b3          	add	s3,s1,s3
    80001bdc:	00048913          	mv	s2,s1
    80001be0:	02000a13          	li	s4,32
    80001be4:	00c0006f          	j	80001bf0 <test_real_syscall_mechanism+0x260>
    80001be8:	00190913          	add	s2,s2,1
    80001bec:	05390863          	beq	s2,s3,80001c3c <test_real_syscall_mechanism+0x2ac>
    80001bf0:	00094783          	lbu	a5,0(s2)
    80001bf4:	01813423          	sd	s8,8(sp)
    80001bf8:	01713823          	sd	s7,16(sp)
    80001bfc:	00f7f713          	and	a4,a5,15
    80001c00:	02070713          	add	a4,a4,32
    80001c04:	0047d793          	srl	a5,a5,0x4
    80001c08:	00270733          	add	a4,a4,sp
    80001c0c:	02078793          	add	a5,a5,32
    80001c10:	fe874703          	lbu	a4,-24(a4)
    80001c14:	002787b3          	add	a5,a5,sp
    80001c18:	fe87c783          	lbu	a5,-24(a5)
    80001c1c:	0087171b          	sllw	a4,a4,0x8
    80001c20:	00010513          	mv	a0,sp
    80001c24:	00e7e7b3          	or	a5,a5,a4
    80001c28:	01610c23          	sb	s6,24(sp)
    80001c2c:	00f11023          	sh	a5,0(sp)
    80001c30:	01411123          	sh	s4,2(sp)
    80001c34:	368010ef          	jal	80002f9c <uart_puts>
    80001c38:	fb2a98e3          	bne	s5,s2,80001be8 <test_real_syscall_mechanism+0x258>
    80001c3c:	00006517          	auipc	a0,0x6
    80001c40:	01c50513          	add	a0,a0,28 # 80007c58 <rodata_start+0xc58>
    80001c44:	358010ef          	jal	80002f9c <uart_puts>
    80001c48:	02843503          	ld	a0,40(s0)
    80001c4c:	01a00693          	li	a3,26
    80001c50:	00048613          	mv	a2,s1
    80001c54:	000015b7          	lui	a1,0x1
    80001c58:	5f0010ef          	jal	80003248 <map_page>
    80001c5c:	56051863          	bnez	a0,800021cc <test_real_syscall_mechanism+0x83c>
    80001c60:	00048613          	mv	a2,s1
    80001c64:	000015b7          	lui	a1,0x1
    80001c68:	00007517          	auipc	a0,0x7
    80001c6c:	7d850513          	add	a0,a0,2008 # 80009440 <rodata_start+0x2440>
    80001c70:	7bd000ef          	jal	80002c2c <printf>
    80001c74:	00008517          	auipc	a0,0x8
    80001c78:	80450513          	add	a0,a0,-2044 # 80009478 <rodata_start+0x2478>
    80001c7c:	320010ef          	jal	80002f9c <uart_puts>
    80001c80:	3c8010ef          	jal	80003048 <alloc_page>
    80001c84:	00001737          	lui	a4,0x1
    80001c88:	00050913          	mv	s2,a0
    80001c8c:	00e50733          	add	a4,a0,a4
    80001c90:	00050793          	mv	a5,a0
    80001c94:	58050063          	beqz	a0,80002214 <test_real_syscall_mechanism+0x884>
    80001c98:	00078023          	sb	zero,0(a5)
    80001c9c:	00178793          	add	a5,a5,1
    80001ca0:	fee79ce3          	bne	a5,a4,80001c98 <test_real_syscall_mechanism+0x308>
    80001ca4:	02843503          	ld	a0,40(s0)
    80001ca8:	01600693          	li	a3,22
    80001cac:	00090613          	mv	a2,s2
    80001cb0:	000105b7          	lui	a1,0x10
    80001cb4:	594010ef          	jal	80003248 <map_page>
    80001cb8:	52051a63          	bnez	a0,800021ec <test_real_syscall_mechanism+0x85c>
    80001cbc:	00090613          	mv	a2,s2
    80001cc0:	000105b7          	lui	a1,0x10
    80001cc4:	00008517          	auipc	a0,0x8
    80001cc8:	82c50513          	add	a0,a0,-2004 # 800094f0 <rodata_start+0x24f0>
    80001ccc:	761000ef          	jal	80002c2c <printf>
    80001cd0:	00008517          	auipc	a0,0x8
    80001cd4:	85850513          	add	a0,a0,-1960 # 80009528 <rodata_start+0x2528>
    80001cd8:	2c4010ef          	jal	80002f9c <uart_puts>
    80001cdc:	36c010ef          	jal	80003048 <alloc_page>
    80001ce0:	00050993          	mv	s3,a0
    80001ce4:	4c050463          	beqz	a0,800021ac <test_real_syscall_mechanism+0x81c>
    80001ce8:	00050593          	mv	a1,a0
    80001cec:	02a43c23          	sd	a0,56(s0)
    80001cf0:	00008517          	auipc	a0,0x8
    80001cf4:	87850513          	add	a0,a0,-1928 # 80009568 <rodata_start+0x2568>
    80001cf8:	735000ef          	jal	80002c2c <printf>
    80001cfc:	00008517          	auipc	a0,0x8
    80001d00:	89450513          	add	a0,a0,-1900 # 80009590 <rodata_start+0x2590>
    80001d04:	298010ef          	jal	80002f9c <uart_puts>
    80001d08:	00425a17          	auipc	s4,0x425
    80001d0c:	6b0a0a13          	add	s4,s4,1712 # 804273b8 <kernel_pagetable>
    80001d10:	000a3583          	ld	a1,0(s4)
    80001d14:	00008517          	auipc	a0,0x8
    80001d18:	8ac50513          	add	a0,a0,-1876 # 800095c0 <rodata_start+0x25c0>
    80001d1c:	711000ef          	jal	80002c2c <printf>
    80001d20:	000a3603          	ld	a2,0(s4)
    80001d24:	50060863          	beqz	a2,80002234 <test_real_syscall_mechanism+0x8a4>
    80001d28:	04043683          	ld	a3,64(s0)
    80001d2c:	00068793          	mv	a5,a3
    80001d30:	12068713          	add	a4,a3,288
    80001d34:	0007b023          	sd	zero,0(a5)
    80001d38:	00878793          	add	a5,a5,8
    80001d3c:	fef71ce3          	bne	a4,a5,80001d34 <test_real_syscall_mechanism+0x3a4>
    80001d40:	fff00a93          	li	s5,-1
    80001d44:	00c65613          	srl	a2,a2,0xc
    80001d48:	000017b7          	lui	a5,0x1
    80001d4c:	03fa9713          	sll	a4,s5,0x3f
    80001d50:	00e665b3          	or	a1,a2,a4
    80001d54:	00f98733          	add	a4,s3,a5
    80001d58:	00e6b423          	sd	a4,8(a3)
    80001d5c:	00f6bc23          	sd	a5,24(a3)
    80001d60:	00003717          	auipc	a4,0x3
    80001d64:	42470713          	add	a4,a4,1060 # 80005184 <usertrap>
    80001d68:	000117b7          	lui	a5,0x11
    80001d6c:	00b6b023          	sd	a1,0(a3)
    80001d70:	02f6b823          	sd	a5,48(a3)
    80001d74:	00e6b823          	sd	a4,16(a3)
    80001d78:	0206b023          	sd	zero,32(a3)
    80001d7c:	00008517          	auipc	a0,0x8
    80001d80:	88c50513          	add	a0,a0,-1908 # 80009608 <rodata_start+0x2608>
    80001d84:	6a9000ef          	jal	80002c2c <printf>
    80001d88:	04043783          	ld	a5,64(s0)
    80001d8c:	00008517          	auipc	a0,0x8
    80001d90:	89450513          	add	a0,a0,-1900 # 80009620 <rodata_start+0x2620>
    80001d94:	00425a17          	auipc	s4,0x425
    80001d98:	62ca0a13          	add	s4,s4,1580 # 804273c0 <syscall_test_count>
    80001d9c:	0087b583          	ld	a1,8(a5) # 11008 <_entry-0x7ffeeff8>
    80001da0:	68d000ef          	jal	80002c2c <printf>
    80001da4:	04043783          	ld	a5,64(s0)
    80001da8:	00008517          	auipc	a0,0x8
    80001dac:	89050513          	add	a0,a0,-1904 # 80009638 <rodata_start+0x2638>
    80001db0:	0107b583          	ld	a1,16(a5)
    80001db4:	679000ef          	jal	80002c2c <printf>
    80001db8:	04043783          	ld	a5,64(s0)
    80001dbc:	00008517          	auipc	a0,0x8
    80001dc0:	89450513          	add	a0,a0,-1900 # 80009650 <rodata_start+0x2650>
    80001dc4:	0187b583          	ld	a1,24(a5)
    80001dc8:	665000ef          	jal	80002c2c <printf>
    80001dcc:	04043783          	ld	a5,64(s0)
    80001dd0:	00008517          	auipc	a0,0x8
    80001dd4:	8a050513          	add	a0,a0,-1888 # 80009670 <rodata_start+0x2670>
    80001dd8:	0307b583          	ld	a1,48(a5)
    80001ddc:	651000ef          	jal	80002c2c <printf>
    80001de0:	00008517          	auipc	a0,0x8
    80001de4:	8b050513          	add	a0,a0,-1872 # 80009690 <rodata_start+0x2690>
    80001de8:	1b4010ef          	jal	80002f9c <uart_puts>
    80001dec:	00008517          	auipc	a0,0x8
    80001df0:	8c450513          	add	a0,a0,-1852 # 800096b0 <rodata_start+0x26b0>
    80001df4:	1a8010ef          	jal	80002f9c <uart_puts>
    80001df8:	00040513          	mv	a0,s0
    80001dfc:	4d9030ef          	jal	80005ad4 <set_current_proc>
    80001e00:	00005517          	auipc	a0,0x5
    80001e04:	d1050513          	add	a0,a0,-752 # 80006b10 <uservec>
    80001e08:	6b1020ef          	jal	80004cb8 <w_stvec>
    80001e0c:	6a5020ef          	jal	80004cb0 <r_stvec>
    80001e10:	00050593          	mv	a1,a0
    80001e14:	00008517          	auipc	a0,0x8
    80001e18:	8dc50513          	add	a0,a0,-1828 # 800096f0 <rodata_start+0x26f0>
    80001e1c:	611000ef          	jal	80002c2c <printf>
    80001e20:	00008517          	auipc	a0,0x8
    80001e24:	8f050513          	add	a0,a0,-1808 # 80009710 <rodata_start+0x2710>
    80001e28:	174010ef          	jal	80002f9c <uart_puts>
    80001e2c:	00008517          	auipc	a0,0x8
    80001e30:	91450513          	add	a0,a0,-1772 # 80009740 <rodata_start+0x2740>
    80001e34:	168010ef          	jal	80002f9c <uart_puts>
    80001e38:	00008517          	auipc	a0,0x8
    80001e3c:	94050513          	add	a0,a0,-1728 # 80009778 <rodata_start+0x2778>
    80001e40:	15c010ef          	jal	80002f9c <uart_puts>
    80001e44:	00008517          	auipc	a0,0x8
    80001e48:	97c50513          	add	a0,a0,-1668 # 800097c0 <rodata_start+0x27c0>
    80001e4c:	150010ef          	jal	80002f9c <uart_puts>
    80001e50:	00008517          	auipc	a0,0x8
    80001e54:	9b050513          	add	a0,a0,-1616 # 80009800 <rodata_start+0x2800>
    80001e58:	144010ef          	jal	80002f9c <uart_puts>
    80001e5c:	00008517          	auipc	a0,0x8
    80001e60:	9cc50513          	add	a0,a0,-1588 # 80009828 <rodata_start+0x2828>
    80001e64:	138010ef          	jal	80002f9c <uart_puts>
    80001e68:	00008517          	auipc	a0,0x8
    80001e6c:	9f050513          	add	a0,a0,-1552 # 80009858 <rodata_start+0x2858>
    80001e70:	00425797          	auipc	a5,0x425
    80001e74:	5407a823          	sw	zero,1360(a5) # 804273c0 <syscall_test_count>
    80001e78:	124010ef          	jal	80002f9c <uart_puts>
    80001e7c:	00008517          	auipc	a0,0x8
    80001e80:	a0c50513          	add	a0,a0,-1524 # 80009888 <rodata_start+0x2888>
    80001e84:	118010ef          	jal	80002f9c <uart_puts>
    80001e88:	00008517          	auipc	a0,0x8
    80001e8c:	a1850513          	add	a0,a0,-1512 # 800098a0 <rodata_start+0x28a0>
    80001e90:	10c010ef          	jal	80002f9c <uart_puts>
    80001e94:	00008517          	auipc	a0,0x8
    80001e98:	a3450513          	add	a0,a0,-1484 # 800098c8 <rodata_start+0x28c8>
    80001e9c:	100010ef          	jal	80002f9c <uart_puts>
    80001ea0:	00008517          	auipc	a0,0x8
    80001ea4:	a5850513          	add	a0,a0,-1448 # 800098f8 <rodata_start+0x28f8>
    80001ea8:	0f4010ef          	jal	80002f9c <uart_puts>
    80001eac:	00008517          	auipc	a0,0x8
    80001eb0:	a7450513          	add	a0,a0,-1420 # 80009920 <rodata_start+0x2920>
    80001eb4:	0e8010ef          	jal	80002f9c <uart_puts>
    80001eb8:	00008517          	auipc	a0,0x8
    80001ebc:	a9850513          	add	a0,a0,-1384 # 80009950 <rodata_start+0x2950>
    80001ec0:	0dc010ef          	jal	80002f9c <uart_puts>
    80001ec4:	00008517          	auipc	a0,0x8
    80001ec8:	acc50513          	add	a0,a0,-1332 # 80009990 <rodata_start+0x2990>
    80001ecc:	0d0010ef          	jal	80002f9c <uart_puts>
    80001ed0:	00008517          	auipc	a0,0x8
    80001ed4:	ae050513          	add	a0,a0,-1312 # 800099b0 <rodata_start+0x29b0>
    80001ed8:	0c4010ef          	jal	80002f9c <uart_puts>
    80001edc:	00008517          	auipc	a0,0x8
    80001ee0:	b0450513          	add	a0,a0,-1276 # 800099e0 <rodata_start+0x29e0>
    80001ee4:	0b8010ef          	jal	80002f9c <uart_puts>
    80001ee8:	00008517          	auipc	a0,0x8
    80001eec:	b1050513          	add	a0,a0,-1264 # 800099f8 <rodata_start+0x29f8>
    80001ef0:	0ac010ef          	jal	80002f9c <uart_puts>
    80001ef4:	00008517          	auipc	a0,0x8
    80001ef8:	b2450513          	add	a0,a0,-1244 # 80009a18 <rodata_start+0x2a18>
    80001efc:	0a0010ef          	jal	80002f9c <uart_puts>
    80001f00:	00008517          	auipc	a0,0x8
    80001f04:	b5050513          	add	a0,a0,-1200 # 80009a50 <rodata_start+0x2a50>
    80001f08:	094010ef          	jal	80002f9c <uart_puts>
    80001f0c:	00008517          	auipc	a0,0x8
    80001f10:	b6450513          	add	a0,a0,-1180 # 80009a70 <rodata_start+0x2a70>
    80001f14:	088010ef          	jal	80002f9c <uart_puts>
    80001f18:	00008517          	auipc	a0,0x8
    80001f1c:	b6850513          	add	a0,a0,-1176 # 80009a80 <rodata_start+0x2a80>
    80001f20:	07c010ef          	jal	80002f9c <uart_puts>
    80001f24:	00008517          	auipc	a0,0x8
    80001f28:	b8c50513          	add	a0,a0,-1140 # 80009ab0 <rodata_start+0x2ab0>
    80001f2c:	070010ef          	jal	80002f9c <uart_puts>
    80001f30:	00008517          	auipc	a0,0x8
    80001f34:	ba850513          	add	a0,a0,-1112 # 80009ad8 <rodata_start+0x2ad8>
    80001f38:	064010ef          	jal	80002f9c <uart_puts>
    80001f3c:	00008517          	auipc	a0,0x8
    80001f40:	bcc50513          	add	a0,a0,-1076 # 80009b08 <rodata_start+0x2b08>
    80001f44:	058010ef          	jal	80002f9c <uart_puts>
    80001f48:	00008517          	auipc	a0,0x8
    80001f4c:	be850513          	add	a0,a0,-1048 # 80009b30 <rodata_start+0x2b30>
    80001f50:	04c010ef          	jal	80002f9c <uart_puts>
    80001f54:	00008517          	auipc	a0,0x8
    80001f58:	c0450513          	add	a0,a0,-1020 # 80009b58 <rodata_start+0x2b58>
    80001f5c:	040010ef          	jal	80002f9c <uart_puts>
    80001f60:	00008517          	auipc	a0,0x8
    80001f64:	c1850513          	add	a0,a0,-1000 # 80009b78 <rodata_start+0x2b78>
    80001f68:	034010ef          	jal	80002f9c <uart_puts>
    80001f6c:	00008517          	auipc	a0,0x8
    80001f70:	c4c50513          	add	a0,a0,-948 # 80009bb8 <rodata_start+0x2bb8>
    80001f74:	00425797          	auipc	a5,0x425
    80001f78:	4407a623          	sw	zero,1100(a5) # 804273c0 <syscall_test_count>
    80001f7c:	020010ef          	jal	80002f9c <uart_puts>
    80001f80:	00008517          	auipc	a0,0x8
    80001f84:	c5050513          	add	a0,a0,-944 # 80009bd0 <rodata_start+0x2bd0>
    80001f88:	014010ef          	jal	80002f9c <uart_puts>
    80001f8c:	164030ef          	jal	800050f0 <usertrapret>
    80001f90:	00008517          	auipc	a0,0x8
    80001f94:	89850513          	add	a0,a0,-1896 # 80009828 <rodata_start+0x2828>
    80001f98:	004010ef          	jal	80002f9c <uart_puts>
    80001f9c:	00008517          	auipc	a0,0x8
    80001fa0:	c6450513          	add	a0,a0,-924 # 80009c00 <rodata_start+0x2c00>
    80001fa4:	7f9000ef          	jal	80002f9c <uart_puts>
    80001fa8:	00008517          	auipc	a0,0x8
    80001fac:	c8050513          	add	a0,a0,-896 # 80009c28 <rodata_start+0x2c28>
    80001fb0:	7ed000ef          	jal	80002f9c <uart_puts>
    80001fb4:	00425597          	auipc	a1,0x425
    80001fb8:	40c5a583          	lw	a1,1036(a1) # 804273c0 <syscall_test_count>
    80001fbc:	00008517          	auipc	a0,0x8
    80001fc0:	c9450513          	add	a0,a0,-876 # 80009c50 <rodata_start+0x2c50>
    80001fc4:	469000ef          	jal	80002c2c <printf>
    80001fc8:	00425797          	auipc	a5,0x425
    80001fcc:	3f87a783          	lw	a5,1016(a5) # 804273c0 <syscall_test_count>
    80001fd0:	23578663          	beq	a5,s5,800021fc <test_real_syscall_mechanism+0x86c>
    80001fd4:	04043783          	ld	a5,64(s0)
    80001fd8:	00842603          	lw	a2,8(s0)
    80001fdc:	00008517          	auipc	a0,0x8
    80001fe0:	cc450513          	add	a0,a0,-828 # 80009ca0 <rodata_start+0x2ca0>
    80001fe4:	0707b583          	ld	a1,112(a5)
    80001fe8:	445000ef          	jal	80002c2c <printf>
    80001fec:	000a2783          	lw	a5,0(s4)
    80001ff0:	00f05a63          	blez	a5,80002004 <test_real_syscall_mechanism+0x674>
    80001ff4:	04043703          	ld	a4,64(s0)
    80001ff8:	00842783          	lw	a5,8(s0)
    80001ffc:	07073703          	ld	a4,112(a4)
    80002000:	24f70663          	beq	a4,a5,8000224c <test_real_syscall_mechanism+0x8bc>
    80002004:	00008517          	auipc	a0,0x8
    80002008:	e7c50513          	add	a0,a0,-388 # 80009e80 <rodata_start+0x2e80>
    8000200c:	791000ef          	jal	80002f9c <uart_puts>
    80002010:	00008517          	auipc	a0,0x8
    80002014:	ea850513          	add	a0,a0,-344 # 80009eb8 <rodata_start+0x2eb8>
    80002018:	785000ef          	jal	80002f9c <uart_puts>
    8000201c:	00000513          	li	a0,0
    80002020:	2b5030ef          	jal	80005ad4 <set_current_proc>
    80002024:	00098513          	mv	a0,s3
    80002028:	03c010ef          	jal	80003064 <free_page>
    8000202c:	00090513          	mv	a0,s2
    80002030:	034010ef          	jal	80003064 <free_page>
    80002034:	00048513          	mv	a0,s1
    80002038:	02c010ef          	jal	80003064 <free_page>
    8000203c:	02843503          	ld	a0,40(s0)
    80002040:	4cc010ef          	jal	8000350c <destroy_pagetable>
    80002044:	04043503          	ld	a0,64(s0)
    80002048:	01c010ef          	jal	80003064 <free_page>
    8000204c:	00040513          	mv	a0,s0
    80002050:	175030ef          	jal	800059c4 <free_proc>
    80002054:	00008517          	auipc	a0,0x8
    80002058:	e8450513          	add	a0,a0,-380 # 80009ed8 <rodata_start+0x2ed8>
    8000205c:	741000ef          	jal	80002f9c <uart_puts>
    80002060:	00008517          	auipc	a0,0x8
    80002064:	e9050513          	add	a0,a0,-368 # 80009ef0 <rodata_start+0x2ef0>
    80002068:	735000ef          	jal	80002f9c <uart_puts>
    8000206c:	00008517          	auipc	a0,0x8
    80002070:	eb450513          	add	a0,a0,-332 # 80009f20 <rodata_start+0x2f20>
    80002074:	729000ef          	jal	80002f9c <uart_puts>
    80002078:	00006517          	auipc	a0,0x6
    8000207c:	be050513          	add	a0,a0,-1056 # 80007c58 <rodata_start+0xc58>
    80002080:	71d000ef          	jal	80002f9c <uart_puts>
    80002084:	00006517          	auipc	a0,0x6
    80002088:	d6c50513          	add	a0,a0,-660 # 80007df0 <rodata_start+0xdf0>
    8000208c:	711000ef          	jal	80002f9c <uart_puts>
    80002090:	00008517          	auipc	a0,0x8
    80002094:	ea850513          	add	a0,a0,-344 # 80009f38 <rodata_start+0x2f38>
    80002098:	705000ef          	jal	80002f9c <uart_puts>
    8000209c:	00008517          	auipc	a0,0x8
    800020a0:	ef450513          	add	a0,a0,-268 # 80009f90 <rodata_start+0x2f90>
    800020a4:	6f9000ef          	jal	80002f9c <uart_puts>
    800020a8:	00008517          	auipc	a0,0x8
    800020ac:	f4050513          	add	a0,a0,-192 # 80009fe8 <rodata_start+0x2fe8>
    800020b0:	6ed000ef          	jal	80002f9c <uart_puts>
    800020b4:	00008517          	auipc	a0,0x8
    800020b8:	f8450513          	add	a0,a0,-124 # 8000a038 <rodata_start+0x3038>
    800020bc:	6e1000ef          	jal	80002f9c <uart_puts>
    800020c0:	00008517          	auipc	a0,0x8
    800020c4:	fd050513          	add	a0,a0,-48 # 8000a090 <rodata_start+0x3090>
    800020c8:	6d5000ef          	jal	80002f9c <uart_puts>
    800020cc:	00008517          	auipc	a0,0x8
    800020d0:	01c50513          	add	a0,a0,28 # 8000a0e8 <rodata_start+0x30e8>
    800020d4:	6c9000ef          	jal	80002f9c <uart_puts>
    800020d8:	00006517          	auipc	a0,0x6
    800020dc:	e4050513          	add	a0,a0,-448 # 80007f18 <rodata_start+0xf18>
    800020e0:	06c0006f          	j	8000214c <test_real_syscall_mechanism+0x7bc>
    800020e4:	00007517          	auipc	a0,0x7
    800020e8:	13450513          	add	a0,a0,308 # 80009218 <rodata_start+0x2218>
    800020ec:	6b1000ef          	jal	80002f9c <uart_puts>
    800020f0:	02843503          	ld	a0,40(s0)
    800020f4:	418010ef          	jal	8000350c <destroy_pagetable>
    800020f8:	04043503          	ld	a0,64(s0)
    800020fc:	769000ef          	jal	80003064 <free_page>
    80002100:	00040513          	mv	a0,s0
    80002104:	06013403          	ld	s0,96(sp)
    80002108:	06813083          	ld	ra,104(sp)
    8000210c:	05813483          	ld	s1,88(sp)
    80002110:	05013903          	ld	s2,80(sp)
    80002114:	04813983          	ld	s3,72(sp)
    80002118:	04013a03          	ld	s4,64(sp)
    8000211c:	03813a83          	ld	s5,56(sp)
    80002120:	03013b03          	ld	s6,48(sp)
    80002124:	02813b83          	ld	s7,40(sp)
    80002128:	02013c03          	ld	s8,32(sp)
    8000212c:	07010113          	add	sp,sp,112
    80002130:	0950306f          	j	800059c4 <free_proc>
    80002134:	00007517          	auipc	a0,0x7
    80002138:	21450513          	add	a0,a0,532 # 80009348 <rodata_start+0x2348>
    8000213c:	661000ef          	jal	80002f9c <uart_puts>
    80002140:	fb1ff06f          	j	800020f0 <test_real_syscall_mechanism+0x760>
    80002144:	00005517          	auipc	a0,0x5
    80002148:	f3c50513          	add	a0,a0,-196 # 80007080 <rodata_start+0x80>
    8000214c:	06013403          	ld	s0,96(sp)
    80002150:	06813083          	ld	ra,104(sp)
    80002154:	05813483          	ld	s1,88(sp)
    80002158:	05013903          	ld	s2,80(sp)
    8000215c:	04813983          	ld	s3,72(sp)
    80002160:	04013a03          	ld	s4,64(sp)
    80002164:	03813a83          	ld	s5,56(sp)
    80002168:	03013b03          	ld	s6,48(sp)
    8000216c:	02813b83          	ld	s7,40(sp)
    80002170:	02013c03          	ld	s8,32(sp)
    80002174:	07010113          	add	sp,sp,112
    80002178:	6250006f          	j	80002f9c <uart_puts>
    8000217c:	00007517          	auipc	a0,0x7
    80002180:	14c50513          	add	a0,a0,332 # 800092c8 <rodata_start+0x22c8>
    80002184:	619000ef          	jal	80002f9c <uart_puts>
    80002188:	f69ff06f          	j	800020f0 <test_real_syscall_mechanism+0x760>
    8000218c:	00007517          	auipc	a0,0x7
    80002190:	fc450513          	add	a0,a0,-60 # 80009150 <rodata_start+0x2150>
    80002194:	609000ef          	jal	80002f9c <uart_puts>
    80002198:	f61ff06f          	j	800020f8 <test_real_syscall_mechanism+0x768>
    8000219c:	00007517          	auipc	a0,0x7
    800021a0:	94c50513          	add	a0,a0,-1716 # 80008ae8 <rodata_start+0x1ae8>
    800021a4:	5f9000ef          	jal	80002f9c <uart_puts>
    800021a8:	f59ff06f          	j	80002100 <test_real_syscall_mechanism+0x770>
    800021ac:	00007517          	auipc	a0,0x7
    800021b0:	39c50513          	add	a0,a0,924 # 80009548 <rodata_start+0x2548>
    800021b4:	5e9000ef          	jal	80002f9c <uart_puts>
    800021b8:	00090513          	mv	a0,s2
    800021bc:	6a9000ef          	jal	80003064 <free_page>
    800021c0:	00048513          	mv	a0,s1
    800021c4:	6a1000ef          	jal	80003064 <free_page>
    800021c8:	f29ff06f          	j	800020f0 <test_real_syscall_mechanism+0x760>
    800021cc:	00007517          	auipc	a0,0x7
    800021d0:	24c50513          	add	a0,a0,588 # 80009418 <rodata_start+0x2418>
    800021d4:	5c9000ef          	jal	80002f9c <uart_puts>
    800021d8:	fe9ff06f          	j	800021c0 <test_real_syscall_mechanism+0x830>
    800021dc:	00007517          	auipc	a0,0x7
    800021e0:	1d450513          	add	a0,a0,468 # 800093b0 <rodata_start+0x23b0>
    800021e4:	5b9000ef          	jal	80002f9c <uart_puts>
    800021e8:	f09ff06f          	j	800020f0 <test_real_syscall_mechanism+0x760>
    800021ec:	00007517          	auipc	a0,0x7
    800021f0:	2e450513          	add	a0,a0,740 # 800094d0 <rodata_start+0x24d0>
    800021f4:	5a9000ef          	jal	80002f9c <uart_puts>
    800021f8:	fc1ff06f          	j	800021b8 <test_real_syscall_mechanism+0x828>
    800021fc:	00008517          	auipc	a0,0x8
    80002200:	a7450513          	add	a0,a0,-1420 # 80009c70 <rodata_start+0x2c70>
    80002204:	599000ef          	jal	80002f9c <uart_puts>
    80002208:	00100793          	li	a5,1
    8000220c:	00fa2023          	sw	a5,0(s4)
    80002210:	dc5ff06f          	j	80001fd4 <test_real_syscall_mechanism+0x644>
    80002214:	00007517          	auipc	a0,0x7
    80002218:	29c50513          	add	a0,a0,668 # 800094b0 <rodata_start+0x24b0>
    8000221c:	581000ef          	jal	80002f9c <uart_puts>
    80002220:	fa1ff06f          	j	800021c0 <test_real_syscall_mechanism+0x830>
    80002224:	00007517          	auipc	a0,0x7
    80002228:	1d450513          	add	a0,a0,468 # 800093f8 <rodata_start+0x23f8>
    8000222c:	571000ef          	jal	80002f9c <uart_puts>
    80002230:	a0dff06f          	j	80001c3c <test_real_syscall_mechanism+0x2ac>
    80002234:	00007517          	auipc	a0,0x7
    80002238:	3b450513          	add	a0,a0,948 # 800095e8 <rodata_start+0x25e8>
    8000223c:	561000ef          	jal	80002f9c <uart_puts>
    80002240:	00098513          	mv	a0,s3
    80002244:	621000ef          	jal	80003064 <free_page>
    80002248:	f71ff06f          	j	800021b8 <test_real_syscall_mechanism+0x828>
    8000224c:	00008517          	auipc	a0,0x8
    80002250:	a8450513          	add	a0,a0,-1404 # 80009cd0 <rodata_start+0x2cd0>
    80002254:	549000ef          	jal	80002f9c <uart_puts>
    80002258:	00008517          	auipc	a0,0x8
    8000225c:	aa850513          	add	a0,a0,-1368 # 80009d00 <rodata_start+0x2d00>
    80002260:	53d000ef          	jal	80002f9c <uart_puts>
    80002264:	00006517          	auipc	a0,0x6
    80002268:	9f450513          	add	a0,a0,-1548 # 80007c58 <rodata_start+0xc58>
    8000226c:	531000ef          	jal	80002f9c <uart_puts>
    80002270:	00008517          	auipc	a0,0x8
    80002274:	aa850513          	add	a0,a0,-1368 # 80009d18 <rodata_start+0x2d18>
    80002278:	525000ef          	jal	80002f9c <uart_puts>
    8000227c:	00008517          	auipc	a0,0x8
    80002280:	b2c50513          	add	a0,a0,-1236 # 80009da8 <rodata_start+0x2da8>
    80002284:	519000ef          	jal	80002f9c <uart_puts>
    80002288:	00008517          	auipc	a0,0x8
    8000228c:	b6850513          	add	a0,a0,-1176 # 80009df0 <rodata_start+0x2df0>
    80002290:	50d000ef          	jal	80002f9c <uart_puts>
    80002294:	d7dff06f          	j	80002010 <test_real_syscall_mechanism+0x680>

0000000080002298 <run_syscall_tests>:
    80002298:	ff010113          	add	sp,sp,-16
    8000229c:	00006517          	auipc	a0,0x6
    800022a0:	9bc50513          	add	a0,a0,-1604 # 80007c58 <rodata_start+0xc58>
    800022a4:	00113423          	sd	ra,8(sp)
    800022a8:	4f5000ef          	jal	80002f9c <uart_puts>
    800022ac:	00006517          	auipc	a0,0x6
    800022b0:	b4450513          	add	a0,a0,-1212 # 80007df0 <rodata_start+0xdf0>
    800022b4:	4e9000ef          	jal	80002f9c <uart_puts>
    800022b8:	00008517          	auipc	a0,0x8
    800022bc:	ea050513          	add	a0,a0,-352 # 8000a158 <rodata_start+0x3158>
    800022c0:	4dd000ef          	jal	80002f9c <uart_puts>
    800022c4:	00006517          	auipc	a0,0x6
    800022c8:	c5450513          	add	a0,a0,-940 # 80007f18 <rodata_start+0xf18>
    800022cc:	4d1000ef          	jal	80002f9c <uart_puts>
    800022d0:	e5dfd0ef          	jal	8000012c <test_sys_getpid>
    800022d4:	f21fd0ef          	jal	800001f4 <test_sys_uptime>
    800022d8:	81cfe0ef          	jal	800002f4 <test_sys_fork>
    800022dc:	95cfe0ef          	jal	80000438 <test_sys_sbrk>
    800022e0:	ac8fe0ef          	jal	800005a8 <test_syscall_dispatch>
    800022e4:	c2cfe0ef          	jal	80000710 <test_arg_functions>
    800022e8:	e18fe0ef          	jal	80000900 <test_syscall_performance>
    800022ec:	b4cff0ef          	jal	80001638 <test_user_kernel_transition>
    800022f0:	ea0ff0ef          	jal	80001990 <test_real_syscall_mechanism>
    800022f4:	00006517          	auipc	a0,0x6
    800022f8:	96450513          	add	a0,a0,-1692 # 80007c58 <rodata_start+0xc58>
    800022fc:	4a1000ef          	jal	80002f9c <uart_puts>
    80002300:	00006517          	auipc	a0,0x6
    80002304:	af050513          	add	a0,a0,-1296 # 80007df0 <rodata_start+0xdf0>
    80002308:	495000ef          	jal	80002f9c <uart_puts>
    8000230c:	00008517          	auipc	a0,0x8
    80002310:	eac50513          	add	a0,a0,-340 # 8000a1b8 <rodata_start+0x31b8>
    80002314:	489000ef          	jal	80002f9c <uart_puts>
    80002318:	00006517          	auipc	a0,0x6
    8000231c:	d2050513          	add	a0,a0,-736 # 80008038 <rodata_start+0x1038>
    80002320:	47d000ef          	jal	80002f9c <uart_puts>
    80002324:	00006517          	auipc	a0,0x6
    80002328:	de450513          	add	a0,a0,-540 # 80008108 <rodata_start+0x1108>
    8000232c:	471000ef          	jal	80002f9c <uart_puts>
    80002330:	00008517          	auipc	a0,0x8
    80002334:	ee050513          	add	a0,a0,-288 # 8000a210 <rodata_start+0x3210>
    80002338:	465000ef          	jal	80002f9c <uart_puts>
    8000233c:	00008517          	auipc	a0,0x8
    80002340:	f0450513          	add	a0,a0,-252 # 8000a240 <rodata_start+0x3240>
    80002344:	459000ef          	jal	80002f9c <uart_puts>
    80002348:	00008517          	auipc	a0,0x8
    8000234c:	f3850513          	add	a0,a0,-200 # 8000a280 <rodata_start+0x3280>
    80002350:	44d000ef          	jal	80002f9c <uart_puts>
    80002354:	00008517          	auipc	a0,0x8
    80002358:	f5c50513          	add	a0,a0,-164 # 8000a2b0 <rodata_start+0x32b0>
    8000235c:	441000ef          	jal	80002f9c <uart_puts>
    80002360:	00008517          	auipc	a0,0x8
    80002364:	f8050513          	add	a0,a0,-128 # 8000a2e0 <rodata_start+0x32e0>
    80002368:	435000ef          	jal	80002f9c <uart_puts>
    8000236c:	00008517          	auipc	a0,0x8
    80002370:	f9c50513          	add	a0,a0,-100 # 8000a308 <rodata_start+0x3308>
    80002374:	429000ef          	jal	80002f9c <uart_puts>
    80002378:	00008517          	auipc	a0,0x8
    8000237c:	fb850513          	add	a0,a0,-72 # 8000a330 <rodata_start+0x3330>
    80002380:	41d000ef          	jal	80002f9c <uart_puts>
    80002384:	00813083          	ld	ra,8(sp)
    80002388:	00008517          	auipc	a0,0x8
    8000238c:	fd050513          	add	a0,a0,-48 # 8000a358 <rodata_start+0x3358>
    80002390:	01010113          	add	sp,sp,16
    80002394:	4090006f          	j	80002f9c <uart_puts>

0000000080002398 <test_timer_interrupt>:
    80002398:	fd010113          	add	sp,sp,-48
    8000239c:	00008517          	auipc	a0,0x8
    800023a0:	fec50513          	add	a0,a0,-20 # 8000a388 <rodata_start+0x3388>
    800023a4:	02113423          	sd	ra,40(sp)
    800023a8:	02813023          	sd	s0,32(sp)
    800023ac:	00913c23          	sd	s1,24(sp)
    800023b0:	3ed000ef          	jal	80002f9c <uart_puts>
    800023b4:	00008517          	auipc	a0,0x8
    800023b8:	00c50513          	add	a0,a0,12 # 8000a3c0 <rodata_start+0x33c0>
    800023bc:	3e1000ef          	jal	80002f9c <uart_puts>
    800023c0:	00008517          	auipc	a0,0x8
    800023c4:	03050513          	add	a0,a0,48 # 8000a3f0 <rodata_start+0x33f0>
    800023c8:	3d5000ef          	jal	80002f9c <uart_puts>
    800023cc:	00425417          	auipc	s0,0x425
    800023d0:	00440413          	add	s0,s0,4 # 804273d0 <ticks>
    800023d4:	00008517          	auipc	a0,0x8
    800023d8:	04c50513          	add	a0,a0,76 # 8000a420 <rodata_start+0x3420>
    800023dc:	3c1000ef          	jal	80002f9c <uart_puts>
    800023e0:	00043483          	ld	s1,0(s0)
    800023e4:	00008517          	auipc	a0,0x8
    800023e8:	06c50513          	add	a0,a0,108 # 8000a450 <rodata_start+0x3450>
    800023ec:	00048593          	mv	a1,s1
    800023f0:	03d000ef          	jal	80002c2c <printf>
    800023f4:	22d020ef          	jal	80004e20 <intr_on>
    800023f8:	00008517          	auipc	a0,0x8
    800023fc:	07050513          	add	a0,a0,112 # 8000a468 <rodata_start+0x3468>
    80002400:	39d000ef          	jal	80002f9c <uart_puts>
    80002404:	00008517          	auipc	a0,0x8
    80002408:	07c50513          	add	a0,a0,124 # 8000a480 <rodata_start+0x3480>
    8000240c:	391000ef          	jal	80002f9c <uart_puts>
    80002410:	00043783          	ld	a5,0(s0)
    80002414:	00000593          	li	a1,0
    80002418:	00f13423          	sd	a5,8(sp)
    8000241c:	00813783          	ld	a5,8(sp)
    80002420:	00043703          	ld	a4,0(s0)
    80002424:	02f71263          	bne	a4,a5,80002448 <test_timer_interrupt+0xb0>
    80002428:	05f5e6b7          	lui	a3,0x5f5e
    8000242c:	10068693          	add	a3,a3,256 # 5f5e100 <_entry-0x7a0a1f00>
    80002430:	0080006f          	j	80002438 <test_timer_interrupt+0xa0>
    80002434:	00d58a63          	beq	a1,a3,80002448 <test_timer_interrupt+0xb0>
    80002438:	00813703          	ld	a4,8(sp)
    8000243c:	00043783          	ld	a5,0(s0)
    80002440:	0015859b          	addw	a1,a1,1
    80002444:	fef708e3          	beq	a4,a5,80002434 <test_timer_interrupt+0x9c>
    80002448:	00008517          	auipc	a0,0x8
    8000244c:	05050513          	add	a0,a0,80 # 8000a498 <rodata_start+0x3498>
    80002450:	7dc000ef          	jal	80002c2c <printf>
    80002454:	00043583          	ld	a1,0(s0)
    80002458:	00008517          	auipc	a0,0x8
    8000245c:	05850513          	add	a0,a0,88 # 8000a4b0 <rodata_start+0x34b0>
    80002460:	7cc000ef          	jal	80002c2c <printf>
    80002464:	00043783          	ld	a5,0(s0)
    80002468:	04f4f063          	bgeu	s1,a5,800024a8 <test_timer_interrupt+0x110>
    8000246c:	00043583          	ld	a1,0(s0)
    80002470:	00008517          	auipc	a0,0x8
    80002474:	05850513          	add	a0,a0,88 # 8000a4c8 <rodata_start+0x34c8>
    80002478:	409585b3          	sub	a1,a1,s1
    8000247c:	7b0000ef          	jal	80002c2c <printf>
    80002480:	00008517          	auipc	a0,0x8
    80002484:	08050513          	add	a0,a0,128 # 8000a500 <rodata_start+0x3500>
    80002488:	315000ef          	jal	80002f9c <uart_puts>
    8000248c:	02013403          	ld	s0,32(sp)
    80002490:	02813083          	ld	ra,40(sp)
    80002494:	01813483          	ld	s1,24(sp)
    80002498:	00008517          	auipc	a0,0x8
    8000249c:	a8850513          	add	a0,a0,-1400 # 80009f20 <rodata_start+0x2f20>
    800024a0:	03010113          	add	sp,sp,48
    800024a4:	2f90006f          	j	80002f9c <uart_puts>
    800024a8:	00008517          	auipc	a0,0x8
    800024ac:	08050513          	add	a0,a0,128 # 8000a528 <rodata_start+0x3528>
    800024b0:	2ed000ef          	jal	80002f9c <uart_puts>
    800024b4:	02013403          	ld	s0,32(sp)
    800024b8:	02813083          	ld	ra,40(sp)
    800024bc:	01813483          	ld	s1,24(sp)
    800024c0:	00008517          	auipc	a0,0x8
    800024c4:	a6050513          	add	a0,a0,-1440 # 80009f20 <rodata_start+0x2f20>
    800024c8:	03010113          	add	sp,sp,48
    800024cc:	2d10006f          	j	80002f9c <uart_puts>

00000000800024d0 <test_repeated_initialization>:
    800024d0:	fe010113          	add	sp,sp,-32
    800024d4:	00008517          	auipc	a0,0x8
    800024d8:	07450513          	add	a0,a0,116 # 8000a548 <rodata_start+0x3548>
    800024dc:	00113c23          	sd	ra,24(sp)
    800024e0:	00813823          	sd	s0,16(sp)
    800024e4:	00913423          	sd	s1,8(sp)
    800024e8:	01213023          	sd	s2,0(sp)
    800024ec:	2b1000ef          	jal	80002f9c <uart_puts>
    800024f0:	00008517          	auipc	a0,0x8
    800024f4:	09850513          	add	a0,a0,152 # 8000a588 <rodata_start+0x3588>
    800024f8:	2a5000ef          	jal	80002f9c <uart_puts>
    800024fc:	00000413          	li	s0,0
    80002500:	00008917          	auipc	s2,0x8
    80002504:	0a090913          	add	s2,s2,160 # 8000a5a0 <rodata_start+0x35a0>
    80002508:	00500493          	li	s1,5
    8000250c:	151020ef          	jal	80004e5c <trap_init>
    80002510:	0014041b          	addw	s0,s0,1
    80002514:	1f9020ef          	jal	80004f0c <trap_init_hart>
    80002518:	00040593          	mv	a1,s0
    8000251c:	00090513          	mv	a0,s2
    80002520:	70c000ef          	jal	80002c2c <printf>
    80002524:	fe9414e3          	bne	s0,s1,8000250c <test_repeated_initialization+0x3c>
    80002528:	00008517          	auipc	a0,0x8
    8000252c:	09850513          	add	a0,a0,152 # 8000a5c0 <rodata_start+0x35c0>
    80002530:	26d000ef          	jal	80002f9c <uart_puts>
    80002534:	01013403          	ld	s0,16(sp)
    80002538:	01813083          	ld	ra,24(sp)
    8000253c:	00813483          	ld	s1,8(sp)
    80002540:	00013903          	ld	s2,0(sp)
    80002544:	00007517          	auipc	a0,0x7
    80002548:	af450513          	add	a0,a0,-1292 # 80009038 <rodata_start+0x2038>
    8000254c:	02010113          	add	sp,sp,32
    80002550:	24d0006f          	j	80002f9c <uart_puts>

0000000080002554 <run_all_system_tests>:
    80002554:	ff010113          	add	sp,sp,-16
    80002558:	00005517          	auipc	a0,0x5
    8000255c:	70050513          	add	a0,a0,1792 # 80007c58 <rodata_start+0xc58>
    80002560:	00113423          	sd	ra,8(sp)
    80002564:	239000ef          	jal	80002f9c <uart_puts>
    80002568:	00006517          	auipc	a0,0x6
    8000256c:	88850513          	add	a0,a0,-1912 # 80007df0 <rodata_start+0xdf0>
    80002570:	22d000ef          	jal	80002f9c <uart_puts>
    80002574:	00008517          	auipc	a0,0x8
    80002578:	07450513          	add	a0,a0,116 # 8000a5e8 <rodata_start+0x35e8>
    8000257c:	221000ef          	jal	80002f9c <uart_puts>
    80002580:	00006517          	auipc	a0,0x6
    80002584:	99850513          	add	a0,a0,-1640 # 80007f18 <rodata_start+0xf18>
    80002588:	215000ef          	jal	80002f9c <uart_puts>
    8000258c:	b65fe0ef          	jal	800010f0 <test_trap_initialization>
    80002590:	bddfe0ef          	jal	8000116c <test_interrupt_control>
    80002594:	cadfe0ef          	jal	80001240 <test_trapframe_allocation>
    80002598:	e35fe0ef          	jal	800013cc <test_csr_operations>
    8000259c:	ec9fe0ef          	jal	80001464 <test_exception_definitions>
    800025a0:	f81fe0ef          	jal	80001520 <test_trapframe_structure>
    800025a4:	820ff0ef          	jal	800015c4 <test_interrupt_handlers>
    800025a8:	df1ff0ef          	jal	80002398 <test_timer_interrupt>
    800025ac:	f25ff0ef          	jal	800024d0 <test_repeated_initialization>
    800025b0:	00005517          	auipc	a0,0x5
    800025b4:	6a850513          	add	a0,a0,1704 # 80007c58 <rodata_start+0xc58>
    800025b8:	1e5000ef          	jal	80002f9c <uart_puts>
    800025bc:	00006517          	auipc	a0,0x6
    800025c0:	83450513          	add	a0,a0,-1996 # 80007df0 <rodata_start+0xdf0>
    800025c4:	1d9000ef          	jal	80002f9c <uart_puts>
    800025c8:	00008517          	auipc	a0,0x8
    800025cc:	08050513          	add	a0,a0,128 # 8000a648 <rodata_start+0x3648>
    800025d0:	1cd000ef          	jal	80002f9c <uart_puts>
    800025d4:	00813083          	ld	ra,8(sp)
    800025d8:	00006517          	auipc	a0,0x6
    800025dc:	a6050513          	add	a0,a0,-1440 # 80008038 <rodata_start+0x1038>
    800025e0:	01010113          	add	sp,sp,16
    800025e4:	1b90006f          	j	80002f9c <uart_puts>

00000000800025e8 <run_interrupt_exception_tests>:
    800025e8:	f6dff06f          	j	80002554 <run_all_system_tests>

00000000800025ec <main>:
    800025ec:	ff010113          	add	sp,sp,-16
    800025f0:	00008517          	auipc	a0,0x8
    800025f4:	0b050513          	add	a0,a0,176 # 8000a6a0 <rodata_start+0x36a0>
    800025f8:	00113423          	sd	ra,8(sp)
    800025fc:	1a1000ef          	jal	80002f9c <uart_puts>
    80002600:	01100593          	li	a1,17
    80002604:	02001537          	lui	a0,0x2001
    80002608:	01b59593          	sll	a1,a1,0x1b
    8000260c:	00651513          	sll	a0,a0,0x6
    80002610:	1b9000ef          	jal	80002fc8 <pmm_init>
    80002614:	00008517          	auipc	a0,0x8
    80002618:	0c450513          	add	a0,a0,196 # 8000a6d8 <rodata_start+0x36d8>
    8000261c:	181000ef          	jal	80002f9c <uart_puts>
    80002620:	00008517          	auipc	a0,0x8
    80002624:	0f050513          	add	a0,a0,240 # 8000a710 <rodata_start+0x3710>
    80002628:	175000ef          	jal	80002f9c <uart_puts>
    8000262c:	5d8010ef          	jal	80003c04 <kvminit>
    80002630:	244010ef          	jal	80003874 <kvminithart>
    80002634:	00008517          	auipc	a0,0x8
    80002638:	11450513          	add	a0,a0,276 # 8000a748 <rodata_start+0x3748>
    8000263c:	161000ef          	jal	80002f9c <uart_puts>
    80002640:	00008517          	auipc	a0,0x8
    80002644:	14050513          	add	a0,a0,320 # 8000a780 <rodata_start+0x3780>
    80002648:	155000ef          	jal	80002f9c <uart_puts>
    8000264c:	011020ef          	jal	80004e5c <trap_init>
    80002650:	0bd020ef          	jal	80004f0c <trap_init_hart>
    80002654:	00008517          	auipc	a0,0x8
    80002658:	16450513          	add	a0,a0,356 # 8000a7b8 <rodata_start+0x37b8>
    8000265c:	141000ef          	jal	80002f9c <uart_puts>
    80002660:	00008517          	auipc	a0,0x8
    80002664:	18850513          	add	a0,a0,392 # 8000a7e8 <rodata_start+0x37e8>
    80002668:	135000ef          	jal	80002f9c <uart_puts>
    8000266c:	115020ef          	jal	80004f80 <timerinit>
    80002670:	00008517          	auipc	a0,0x8
    80002674:	1b050513          	add	a0,a0,432 # 8000a820 <rodata_start+0x3820>
    80002678:	125000ef          	jal	80002f9c <uart_puts>
    8000267c:	00008517          	auipc	a0,0x8
    80002680:	1d450513          	add	a0,a0,468 # 8000a850 <rodata_start+0x3850>
    80002684:	119000ef          	jal	80002f9c <uart_puts>
    80002688:	148030ef          	jal	800057d0 <proc_init>
    8000268c:	00008517          	auipc	a0,0x8
    80002690:	1fc50513          	add	a0,a0,508 # 8000a888 <rodata_start+0x3888>
    80002694:	109000ef          	jal	80002f9c <uart_puts>
    80002698:	c01ff0ef          	jal	80002298 <run_syscall_tests>
    8000269c:	00008517          	auipc	a0,0x8
    800026a0:	21c50513          	add	a0,a0,540 # 8000a8b8 <rodata_start+0x38b8>
    800026a4:	0f9000ef          	jal	80002f9c <uart_puts>
    800026a8:	10500073          	wfi
    800026ac:	10500073          	wfi
    800026b0:	ff9ff06f          	j	800026a8 <main+0xbc>

00000000800026b4 <print_number>:
    800026b4:	0c050663          	beqz	a0,80002780 <print_number+0xcc>
    800026b8:	fd010113          	add	sp,sp,-48
    800026bc:	02113423          	sd	ra,40(sp)
    800026c0:	02813023          	sd	s0,32(sp)
    800026c4:	08061a63          	bnez	a2,80002758 <print_number+0xa4>
    800026c8:	0005071b          	sext.w	a4,a0
    800026cc:	00000613          	li	a2,0
    800026d0:	0005859b          	sext.w	a1,a1
    800026d4:	00010fa3          	sb	zero,31(sp)
    800026d8:	01e10813          	add	a6,sp,30
    800026dc:	01f00693          	li	a3,31
    800026e0:	00008317          	auipc	t1,0x8
    800026e4:	4e030313          	add	t1,t1,1248 # 8000abc0 <digits>
    800026e8:	02b777bb          	remuw	a5,a4,a1
    800026ec:	fff80813          	add	a6,a6,-1
    800026f0:	0007089b          	sext.w	a7,a4
    800026f4:	00068e13          	mv	t3,a3
    800026f8:	fff6869b          	addw	a3,a3,-1
    800026fc:	02079793          	sll	a5,a5,0x20
    80002700:	0207d793          	srl	a5,a5,0x20
    80002704:	00f307b3          	add	a5,t1,a5
    80002708:	0007c503          	lbu	a0,0(a5)
    8000270c:	02b7573b          	divuw	a4,a4,a1
    80002710:	00a800a3          	sb	a0,1(a6)
    80002714:	fcb8fae3          	bgeu	a7,a1,800026e8 <print_number+0x34>
    80002718:	04060a63          	beqz	a2,8000276c <print_number+0xb8>
    8000271c:	ffee069b          	addw	a3,t3,-2
    80002720:	02068793          	add	a5,a3,32
    80002724:	002787b3          	add	a5,a5,sp
    80002728:	02d00713          	li	a4,45
    8000272c:	fee78023          	sb	a4,-32(a5)
    80002730:	02d00513          	li	a0,45
    80002734:	00d10433          	add	s0,sp,a3
    80002738:	00140413          	add	s0,s0,1
    8000273c:	049000ef          	jal	80002f84 <uart_putc>
    80002740:	00044503          	lbu	a0,0(s0)
    80002744:	fe051ae3          	bnez	a0,80002738 <print_number+0x84>
    80002748:	02813083          	ld	ra,40(sp)
    8000274c:	02013403          	ld	s0,32(sp)
    80002750:	03010113          	add	sp,sp,48
    80002754:	00008067          	ret
    80002758:	f60558e3          	bgez	a0,800026c8 <print_number+0x14>
    8000275c:	80000737          	lui	a4,0x80000
    80002760:	f6e508e3          	beq	a0,a4,800026d0 <print_number+0x1c>
    80002764:	40a0073b          	negw	a4,a0
    80002768:	f69ff06f          	j	800026d0 <print_number+0x1c>
    8000276c:	fc0514e3          	bnez	a0,80002734 <print_number+0x80>
    80002770:	02813083          	ld	ra,40(sp)
    80002774:	02013403          	ld	s0,32(sp)
    80002778:	03010113          	add	sp,sp,48
    8000277c:	00008067          	ret
    80002780:	03000513          	li	a0,48
    80002784:	0010006f          	j	80002f84 <uart_putc>

0000000080002788 <print_number_long.part.0>:
    80002788:	fd010113          	add	sp,sp,-48
    8000278c:	02113423          	sd	ra,40(sp)
    80002790:	02813023          	sd	s0,32(sp)
    80002794:	00050793          	mv	a5,a0
    80002798:	00060463          	beqz	a2,800027a0 <print_number_long.part.0+0x18>
    8000279c:	08054c63          	bltz	a0,80002834 <print_number_long.part.0+0xac>
    800027a0:	00000613          	li	a2,0
    800027a4:	00010fa3          	sb	zero,31(sp)
    800027a8:	01e10813          	add	a6,sp,30
    800027ac:	01f00693          	li	a3,31
    800027b0:	00008317          	auipc	t1,0x8
    800027b4:	41030313          	add	t1,t1,1040 # 8000abc0 <digits>
    800027b8:	02b7f733          	remu	a4,a5,a1
    800027bc:	fff80813          	add	a6,a6,-1
    800027c0:	00078893          	mv	a7,a5
    800027c4:	00068e13          	mv	t3,a3
    800027c8:	fff6869b          	addw	a3,a3,-1
    800027cc:	00e30733          	add	a4,t1,a4
    800027d0:	00074503          	lbu	a0,0(a4) # ffffffff80000000 <bss_end+0xfffffffeffbd8c10>
    800027d4:	02b7d7b3          	divu	a5,a5,a1
    800027d8:	00a800a3          	sb	a0,1(a6)
    800027dc:	fcb8fee3          	bgeu	a7,a1,800027b8 <print_number_long.part.0+0x30>
    800027e0:	04060063          	beqz	a2,80002820 <print_number_long.part.0+0x98>
    800027e4:	ffee069b          	addw	a3,t3,-2
    800027e8:	02068793          	add	a5,a3,32
    800027ec:	002787b3          	add	a5,a5,sp
    800027f0:	02d00713          	li	a4,45
    800027f4:	fee78023          	sb	a4,-32(a5)
    800027f8:	02d00513          	li	a0,45
    800027fc:	00d10433          	add	s0,sp,a3
    80002800:	00140413          	add	s0,s0,1
    80002804:	780000ef          	jal	80002f84 <uart_putc>
    80002808:	00044503          	lbu	a0,0(s0)
    8000280c:	fe051ae3          	bnez	a0,80002800 <print_number_long.part.0+0x78>
    80002810:	02813083          	ld	ra,40(sp)
    80002814:	02013403          	ld	s0,32(sp)
    80002818:	03010113          	add	sp,sp,48
    8000281c:	00008067          	ret
    80002820:	fc051ee3          	bnez	a0,800027fc <print_number_long.part.0+0x74>
    80002824:	02813083          	ld	ra,40(sp)
    80002828:	02013403          	ld	s0,32(sp)
    8000282c:	03010113          	add	sp,sp,48
    80002830:	00008067          	ret
    80002834:	40a007b3          	neg	a5,a0
    80002838:	f6dff06f          	j	800027a4 <print_number_long.part.0+0x1c>

000000008000283c <clear_screen>:
    8000283c:	00008517          	auipc	a0,0x8
    80002840:	0ac50513          	add	a0,a0,172 # 8000a8e8 <rodata_start+0x38e8>
    80002844:	7580006f          	j	80002f9c <uart_puts>

0000000080002848 <clear_line>:
    80002848:	00008517          	auipc	a0,0x8
    8000284c:	0a850513          	add	a0,a0,168 # 8000a8f0 <rodata_start+0x38f0>
    80002850:	74c0006f          	j	80002f9c <uart_puts>

0000000080002854 <goto_xy>:
    80002854:	fd010113          	add	sp,sp,-48
    80002858:	00913c23          	sd	s1,24(sp)
    8000285c:	00050493          	mv	s1,a0
    80002860:	01b00513          	li	a0,27
    80002864:	02113423          	sd	ra,40(sp)
    80002868:	02813023          	sd	s0,32(sp)
    8000286c:	01213823          	sd	s2,16(sp)
    80002870:	00058413          	mv	s0,a1
    80002874:	01313423          	sd	s3,8(sp)
    80002878:	70c000ef          	jal	80002f84 <uart_putc>
    8000287c:	05b00513          	li	a0,91
    80002880:	704000ef          	jal	80002f84 <uart_putc>
    80002884:	06300793          	li	a5,99
    80002888:	0c87cc63          	blt	a5,s0,80002960 <goto_xy+0x10c>
    8000288c:	00900793          	li	a5,9
    80002890:	0487ce63          	blt	a5,s0,800028ec <goto_xy+0x98>
    80002894:	12805a63          	blez	s0,800029c8 <goto_xy+0x174>
    80002898:	0304041b          	addw	s0,s0,48
    8000289c:	0ff47513          	zext.b	a0,s0
    800028a0:	6e4000ef          	jal	80002f84 <uart_putc>
    800028a4:	03b00513          	li	a0,59
    800028a8:	6dc000ef          	jal	80002f84 <uart_putc>
    800028ac:	06300793          	li	a5,99
    800028b0:	0697c863          	blt	a5,s1,80002920 <goto_xy+0xcc>
    800028b4:	00900793          	li	a5,9
    800028b8:	0e97c463          	blt	a5,s1,800029a0 <goto_xy+0x14c>
    800028bc:	10905c63          	blez	s1,800029d4 <goto_xy+0x180>
    800028c0:	0304851b          	addw	a0,s1,48
    800028c4:	0ff57513          	zext.b	a0,a0
    800028c8:	6bc000ef          	jal	80002f84 <uart_putc>
    800028cc:	02013403          	ld	s0,32(sp)
    800028d0:	02813083          	ld	ra,40(sp)
    800028d4:	01813483          	ld	s1,24(sp)
    800028d8:	01013903          	ld	s2,16(sp)
    800028dc:	00813983          	ld	s3,8(sp)
    800028e0:	04800513          	li	a0,72
    800028e4:	03010113          	add	sp,sp,48
    800028e8:	69c0006f          	j	80002f84 <uart_putc>
    800028ec:	00a00913          	li	s2,10
    800028f0:	0324453b          	divw	a0,s0,s2
    800028f4:	0305051b          	addw	a0,a0,48
    800028f8:	0ff57513          	zext.b	a0,a0
    800028fc:	688000ef          	jal	80002f84 <uart_putc>
    80002900:	0324643b          	remw	s0,s0,s2
    80002904:	0304041b          	addw	s0,s0,48
    80002908:	0ff47513          	zext.b	a0,s0
    8000290c:	678000ef          	jal	80002f84 <uart_putc>
    80002910:	03b00513          	li	a0,59
    80002914:	670000ef          	jal	80002f84 <uart_putc>
    80002918:	06300793          	li	a5,99
    8000291c:	f897dce3          	bge	a5,s1,800028b4 <goto_xy+0x60>
    80002920:	06400413          	li	s0,100
    80002924:	0284c53b          	divw	a0,s1,s0
    80002928:	00a00913          	li	s2,10
    8000292c:	0305051b          	addw	a0,a0,48
    80002930:	0ff57513          	zext.b	a0,a0
    80002934:	650000ef          	jal	80002f84 <uart_putc>
    80002938:	0284e53b          	remw	a0,s1,s0
    8000293c:	0325453b          	divw	a0,a0,s2
    80002940:	0305051b          	addw	a0,a0,48
    80002944:	0ff57513          	zext.b	a0,a0
    80002948:	63c000ef          	jal	80002f84 <uart_putc>
    8000294c:	0324e53b          	remw	a0,s1,s2
    80002950:	0305051b          	addw	a0,a0,48
    80002954:	0ff57513          	zext.b	a0,a0
    80002958:	62c000ef          	jal	80002f84 <uart_putc>
    8000295c:	f71ff06f          	j	800028cc <goto_xy+0x78>
    80002960:	06400913          	li	s2,100
    80002964:	0324453b          	divw	a0,s0,s2
    80002968:	00a00993          	li	s3,10
    8000296c:	0305051b          	addw	a0,a0,48
    80002970:	0ff57513          	zext.b	a0,a0
    80002974:	610000ef          	jal	80002f84 <uart_putc>
    80002978:	0324653b          	remw	a0,s0,s2
    8000297c:	0335453b          	divw	a0,a0,s3
    80002980:	0305051b          	addw	a0,a0,48
    80002984:	0ff57513          	zext.b	a0,a0
    80002988:	5fc000ef          	jal	80002f84 <uart_putc>
    8000298c:	0334643b          	remw	s0,s0,s3
    80002990:	0304041b          	addw	s0,s0,48
    80002994:	0ff47513          	zext.b	a0,s0
    80002998:	5ec000ef          	jal	80002f84 <uart_putc>
    8000299c:	f09ff06f          	j	800028a4 <goto_xy+0x50>
    800029a0:	00a00413          	li	s0,10
    800029a4:	0284c53b          	divw	a0,s1,s0
    800029a8:	0305051b          	addw	a0,a0,48
    800029ac:	0ff57513          	zext.b	a0,a0
    800029b0:	5d4000ef          	jal	80002f84 <uart_putc>
    800029b4:	0284e53b          	remw	a0,s1,s0
    800029b8:	0305051b          	addw	a0,a0,48
    800029bc:	0ff57513          	zext.b	a0,a0
    800029c0:	5c4000ef          	jal	80002f84 <uart_putc>
    800029c4:	f09ff06f          	j	800028cc <goto_xy+0x78>
    800029c8:	03100513          	li	a0,49
    800029cc:	5b8000ef          	jal	80002f84 <uart_putc>
    800029d0:	ed5ff06f          	j	800028a4 <goto_xy+0x50>
    800029d4:	03100513          	li	a0,49
    800029d8:	5ac000ef          	jal	80002f84 <uart_putc>
    800029dc:	ef1ff06f          	j	800028cc <goto_xy+0x78>

00000000800029e0 <printf_color>:
    800029e0:	f8010113          	add	sp,sp,-128
    800029e4:	02913c23          	sd	s1,56(sp)
    800029e8:	00050493          	mv	s1,a0
    800029ec:	01b00513          	li	a0,27
    800029f0:	06f13423          	sd	a5,104(sp)
    800029f4:	04113423          	sd	ra,72(sp)
    800029f8:	04813023          	sd	s0,64(sp)
    800029fc:	04c13823          	sd	a2,80(sp)
    80002a00:	04d13c23          	sd	a3,88(sp)
    80002a04:	06e13023          	sd	a4,96(sp)
    80002a08:	07013823          	sd	a6,112(sp)
    80002a0c:	07113c23          	sd	a7,120(sp)
    80002a10:	00058413          	mv	s0,a1
    80002a14:	03213823          	sd	s2,48(sp)
    80002a18:	03313423          	sd	s3,40(sp)
    80002a1c:	03413023          	sd	s4,32(sp)
    80002a20:	01513c23          	sd	s5,24(sp)
    80002a24:	560000ef          	jal	80002f84 <uart_putc>
    80002a28:	05b00513          	li	a0,91
    80002a2c:	558000ef          	jal	80002f84 <uart_putc>
    80002a30:	06300793          	li	a5,99
    80002a34:	1a97e063          	bltu	a5,s1,80002bd4 <printf_color+0x1f4>
    80002a38:	00900793          	li	a5,9
    80002a3c:	1497e663          	bltu	a5,s1,80002b88 <printf_color+0x1a8>
    80002a40:	0304851b          	addw	a0,s1,48
    80002a44:	0ff57513          	zext.b	a0,a0
    80002a48:	53c000ef          	jal	80002f84 <uart_putc>
    80002a4c:	06d00513          	li	a0,109
    80002a50:	534000ef          	jal	80002f84 <uart_putc>
    80002a54:	1c040863          	beqz	s0,80002c24 <printf_color+0x244>
    80002a58:	00044503          	lbu	a0,0(s0)
    80002a5c:	05010793          	add	a5,sp,80
    80002a60:	00f13423          	sd	a5,8(sp)
    80002a64:	00000a93          	li	s5,0
    80002a68:	06050463          	beqz	a0,80002ad0 <printf_color+0xf0>
    80002a6c:	02500913          	li	s2,37
    80002a70:	02000a13          	li	s4,32
    80002a74:	00008997          	auipc	s3,0x8
    80002a78:	fbc98993          	add	s3,s3,-68 # 8000aa30 <rodata_start+0x3a30>
    80002a7c:	00140493          	add	s1,s0,1
    80002a80:	13251863          	bne	a0,s2,80002bb0 <printf_color+0x1d0>
    80002a84:	00144783          	lbu	a5,1(s0)
    80002a88:	14078063          	beqz	a5,80002bc8 <printf_color+0x1e8>
    80002a8c:	13278863          	beq	a5,s2,80002bbc <printf_color+0x1dc>
    80002a90:	fa87879b          	addw	a5,a5,-88
    80002a94:	0ff7f793          	zext.b	a5,a5
    80002a98:	00fa6c63          	bltu	s4,a5,80002ab0 <printf_color+0xd0>
    80002a9c:	00279793          	sll	a5,a5,0x2
    80002aa0:	013787b3          	add	a5,a5,s3
    80002aa4:	0007a783          	lw	a5,0(a5)
    80002aa8:	013787b3          	add	a5,a5,s3
    80002aac:	00078067          	jr	a5
    80002ab0:	02500513          	li	a0,37
    80002ab4:	4d0000ef          	jal	80002f84 <uart_putc>
    80002ab8:	00144503          	lbu	a0,1(s0)
    80002abc:	ffe00a93          	li	s5,-2
    80002ac0:	4c4000ef          	jal	80002f84 <uart_putc>
    80002ac4:	0014c503          	lbu	a0,1(s1)
    80002ac8:	00148413          	add	s0,s1,1
    80002acc:	fa0518e3          	bnez	a0,80002a7c <printf_color+0x9c>
    80002ad0:	00008517          	auipc	a0,0x8
    80002ad4:	e3050513          	add	a0,a0,-464 # 8000a900 <rodata_start+0x3900>
    80002ad8:	4c4000ef          	jal	80002f9c <uart_puts>
    80002adc:	04813083          	ld	ra,72(sp)
    80002ae0:	04013403          	ld	s0,64(sp)
    80002ae4:	03813483          	ld	s1,56(sp)
    80002ae8:	03013903          	ld	s2,48(sp)
    80002aec:	02813983          	ld	s3,40(sp)
    80002af0:	02013a03          	ld	s4,32(sp)
    80002af4:	000a8513          	mv	a0,s5
    80002af8:	01813a83          	ld	s5,24(sp)
    80002afc:	08010113          	add	sp,sp,128
    80002b00:	00008067          	ret
    80002b04:	00813783          	ld	a5,8(sp)
    80002b08:	00000613          	li	a2,0
    80002b0c:	01000593          	li	a1,16
    80002b10:	0007a503          	lw	a0,0(a5)
    80002b14:	00878793          	add	a5,a5,8
    80002b18:	00f13423          	sd	a5,8(sp)
    80002b1c:	b99ff0ef          	jal	800026b4 <print_number>
    80002b20:	fa5ff06f          	j	80002ac4 <printf_color+0xe4>
    80002b24:	00813783          	ld	a5,8(sp)
    80002b28:	0007c503          	lbu	a0,0(a5)
    80002b2c:	00878793          	add	a5,a5,8
    80002b30:	00f13423          	sd	a5,8(sp)
    80002b34:	450000ef          	jal	80002f84 <uart_putc>
    80002b38:	f8dff06f          	j	80002ac4 <printf_color+0xe4>
    80002b3c:	00813783          	ld	a5,8(sp)
    80002b40:	0007b403          	ld	s0,0(a5)
    80002b44:	00878793          	add	a5,a5,8
    80002b48:	00f13423          	sd	a5,8(sp)
    80002b4c:	00041863          	bnez	s0,80002b5c <printf_color+0x17c>
    80002b50:	0c40006f          	j	80002c14 <printf_color+0x234>
    80002b54:	00140413          	add	s0,s0,1
    80002b58:	42c000ef          	jal	80002f84 <uart_putc>
    80002b5c:	00044503          	lbu	a0,0(s0)
    80002b60:	fe051ae3          	bnez	a0,80002b54 <printf_color+0x174>
    80002b64:	f61ff06f          	j	80002ac4 <printf_color+0xe4>
    80002b68:	00813783          	ld	a5,8(sp)
    80002b6c:	00100613          	li	a2,1
    80002b70:	00a00593          	li	a1,10
    80002b74:	0007a503          	lw	a0,0(a5)
    80002b78:	00878793          	add	a5,a5,8
    80002b7c:	00f13423          	sd	a5,8(sp)
    80002b80:	b35ff0ef          	jal	800026b4 <print_number>
    80002b84:	f41ff06f          	j	80002ac4 <printf_color+0xe4>
    80002b88:	00a00913          	li	s2,10
    80002b8c:	0324d53b          	divuw	a0,s1,s2
    80002b90:	0305051b          	addw	a0,a0,48
    80002b94:	0ff57513          	zext.b	a0,a0
    80002b98:	3ec000ef          	jal	80002f84 <uart_putc>
    80002b9c:	0324f53b          	remuw	a0,s1,s2
    80002ba0:	0305051b          	addw	a0,a0,48
    80002ba4:	07f57513          	and	a0,a0,127
    80002ba8:	3dc000ef          	jal	80002f84 <uart_putc>
    80002bac:	ea1ff06f          	j	80002a4c <printf_color+0x6c>
    80002bb0:	3d4000ef          	jal	80002f84 <uart_putc>
    80002bb4:	00040493          	mv	s1,s0
    80002bb8:	f0dff06f          	j	80002ac4 <printf_color+0xe4>
    80002bbc:	02500513          	li	a0,37
    80002bc0:	3c4000ef          	jal	80002f84 <uart_putc>
    80002bc4:	f01ff06f          	j	80002ac4 <printf_color+0xe4>
    80002bc8:	02500513          	li	a0,37
    80002bcc:	3b8000ef          	jal	80002f84 <uart_putc>
    80002bd0:	f01ff06f          	j	80002ad0 <printf_color+0xf0>
    80002bd4:	06400913          	li	s2,100
    80002bd8:	0324d53b          	divuw	a0,s1,s2
    80002bdc:	00a00993          	li	s3,10
    80002be0:	0305051b          	addw	a0,a0,48
    80002be4:	0ff57513          	zext.b	a0,a0
    80002be8:	39c000ef          	jal	80002f84 <uart_putc>
    80002bec:	0324f53b          	remuw	a0,s1,s2
    80002bf0:	0335553b          	divuw	a0,a0,s3
    80002bf4:	0305051b          	addw	a0,a0,48
    80002bf8:	0ff57513          	zext.b	a0,a0
    80002bfc:	388000ef          	jal	80002f84 <uart_putc>
    80002c00:	0334f53b          	remuw	a0,s1,s3
    80002c04:	0305051b          	addw	a0,a0,48
    80002c08:	07f57513          	and	a0,a0,127
    80002c0c:	378000ef          	jal	80002f84 <uart_putc>
    80002c10:	e3dff06f          	j	80002a4c <printf_color+0x6c>
    80002c14:	00008517          	auipc	a0,0x8
    80002c18:	ce450513          	add	a0,a0,-796 # 8000a8f8 <rodata_start+0x38f8>
    80002c1c:	380000ef          	jal	80002f9c <uart_puts>
    80002c20:	ea5ff06f          	j	80002ac4 <printf_color+0xe4>
    80002c24:	fff00a93          	li	s5,-1
    80002c28:	eb5ff06f          	j	80002adc <printf_color+0xfc>

0000000080002c2c <printf>:
    80002c2c:	f6010113          	add	sp,sp,-160
    80002c30:	04113c23          	sd	ra,88(sp)
    80002c34:	04813823          	sd	s0,80(sp)
    80002c38:	04913423          	sd	s1,72(sp)
    80002c3c:	05213023          	sd	s2,64(sp)
    80002c40:	03313c23          	sd	s3,56(sp)
    80002c44:	03413823          	sd	s4,48(sp)
    80002c48:	03513423          	sd	s5,40(sp)
    80002c4c:	03613023          	sd	s6,32(sp)
    80002c50:	01713c23          	sd	s7,24(sp)
    80002c54:	06b13423          	sd	a1,104(sp)
    80002c58:	06c13823          	sd	a2,112(sp)
    80002c5c:	06d13c23          	sd	a3,120(sp)
    80002c60:	08e13023          	sd	a4,128(sp)
    80002c64:	08f13423          	sd	a5,136(sp)
    80002c68:	09013823          	sd	a6,144(sp)
    80002c6c:	09113c23          	sd	a7,152(sp)
    80002c70:	20050c63          	beqz	a0,80002e88 <printf+0x25c>
    80002c74:	00050413          	mv	s0,a0
    80002c78:	00054503          	lbu	a0,0(a0)
    80002c7c:	06810793          	add	a5,sp,104
    80002c80:	00f13423          	sd	a5,8(sp)
    80002c84:	00000b13          	li	s6,0
    80002c88:	06050c63          	beqz	a0,80002d00 <printf+0xd4>
    80002c8c:	02500493          	li	s1,37
    80002c90:	06c00993          	li	s3,108
    80002c94:	02000a13          	li	s4,32
    80002c98:	00008917          	auipc	s2,0x8
    80002c9c:	e1c90913          	add	s2,s2,-484 # 8000aab4 <rodata_start+0x3ab4>
    80002ca0:	00008a97          	auipc	s5,0x8
    80002ca4:	e98a8a93          	add	s5,s5,-360 # 8000ab38 <rodata_start+0x3b38>
    80002ca8:	04951463          	bne	a0,s1,80002cf0 <printf+0xc4>
    80002cac:	00144783          	lbu	a5,1(s0)
    80002cb0:	18078e63          	beqz	a5,80002e4c <printf+0x220>
    80002cb4:	11378063          	beq	a5,s3,80002db4 <printf+0x188>
    80002cb8:	00140413          	add	s0,s0,1
    80002cbc:	16978863          	beq	a5,s1,80002e2c <printf+0x200>
    80002cc0:	fa87879b          	addw	a5,a5,-88
    80002cc4:	0ff7f793          	zext.b	a5,a5
    80002cc8:	00fa6c63          	bltu	s4,a5,80002ce0 <printf+0xb4>
    80002ccc:	00279793          	sll	a5,a5,0x2
    80002cd0:	012787b3          	add	a5,a5,s2
    80002cd4:	0007a783          	lw	a5,0(a5)
    80002cd8:	012787b3          	add	a5,a5,s2
    80002cdc:	00078067          	jr	a5
    80002ce0:	02500513          	li	a0,37
    80002ce4:	2a0000ef          	jal	80002f84 <uart_putc>
    80002ce8:	00044503          	lbu	a0,0(s0)
    80002cec:	ffe00b13          	li	s6,-2
    80002cf0:	294000ef          	jal	80002f84 <uart_putc>
    80002cf4:	00144503          	lbu	a0,1(s0)
    80002cf8:	00140413          	add	s0,s0,1
    80002cfc:	fa0516e3          	bnez	a0,80002ca8 <printf+0x7c>
    80002d00:	05813083          	ld	ra,88(sp)
    80002d04:	05013403          	ld	s0,80(sp)
    80002d08:	04813483          	ld	s1,72(sp)
    80002d0c:	04013903          	ld	s2,64(sp)
    80002d10:	03813983          	ld	s3,56(sp)
    80002d14:	03013a03          	ld	s4,48(sp)
    80002d18:	02813a83          	ld	s5,40(sp)
    80002d1c:	01813b83          	ld	s7,24(sp)
    80002d20:	000b0513          	mv	a0,s6
    80002d24:	02013b03          	ld	s6,32(sp)
    80002d28:	0a010113          	add	sp,sp,160
    80002d2c:	00008067          	ret
    80002d30:	00813783          	ld	a5,8(sp)
    80002d34:	00000613          	li	a2,0
    80002d38:	01000593          	li	a1,16
    80002d3c:	0007a503          	lw	a0,0(a5)
    80002d40:	00878793          	add	a5,a5,8
    80002d44:	00f13423          	sd	a5,8(sp)
    80002d48:	96dff0ef          	jal	800026b4 <print_number>
    80002d4c:	fa9ff06f          	j	80002cf4 <printf+0xc8>
    80002d50:	00813783          	ld	a5,8(sp)
    80002d54:	0007c503          	lbu	a0,0(a5)
    80002d58:	00878793          	add	a5,a5,8
    80002d5c:	00f13423          	sd	a5,8(sp)
    80002d60:	224000ef          	jal	80002f84 <uart_putc>
    80002d64:	f91ff06f          	j	80002cf4 <printf+0xc8>
    80002d68:	00813783          	ld	a5,8(sp)
    80002d6c:	0007bb83          	ld	s7,0(a5)
    80002d70:	00878793          	add	a5,a5,8
    80002d74:	00f13423          	sd	a5,8(sp)
    80002d78:	000b9863          	bnez	s7,80002d88 <printf+0x15c>
    80002d7c:	0e80006f          	j	80002e64 <printf+0x238>
    80002d80:	001b8b93          	add	s7,s7,1
    80002d84:	200000ef          	jal	80002f84 <uart_putc>
    80002d88:	000bc503          	lbu	a0,0(s7)
    80002d8c:	fe051ae3          	bnez	a0,80002d80 <printf+0x154>
    80002d90:	f65ff06f          	j	80002cf4 <printf+0xc8>
    80002d94:	00813783          	ld	a5,8(sp)
    80002d98:	00100613          	li	a2,1
    80002d9c:	00a00593          	li	a1,10
    80002da0:	0007a503          	lw	a0,0(a5)
    80002da4:	00878793          	add	a5,a5,8
    80002da8:	00f13423          	sd	a5,8(sp)
    80002dac:	909ff0ef          	jal	800026b4 <print_number>
    80002db0:	f45ff06f          	j	80002cf4 <printf+0xc8>
    80002db4:	00244783          	lbu	a5,2(s0)
    80002db8:	00240413          	add	s0,s0,2
    80002dbc:	0a078c63          	beqz	a5,80002e74 <printf+0x248>
    80002dc0:	06978663          	beq	a5,s1,80002e2c <printf+0x200>
    80002dc4:	fa87879b          	addw	a5,a5,-88
    80002dc8:	0ff7f793          	zext.b	a5,a5
    80002dcc:	06fa6663          	bltu	s4,a5,80002e38 <printf+0x20c>
    80002dd0:	00279793          	sll	a5,a5,0x2
    80002dd4:	015787b3          	add	a5,a5,s5
    80002dd8:	0007a783          	lw	a5,0(a5)
    80002ddc:	015787b3          	add	a5,a5,s5
    80002de0:	00078067          	jr	a5
    80002de4:	00813783          	ld	a5,8(sp)
    80002de8:	0007b503          	ld	a0,0(a5)
    80002dec:	00878793          	add	a5,a5,8
    80002df0:	00f13423          	sd	a5,8(sp)
    80002df4:	06050263          	beqz	a0,80002e58 <printf+0x22c>
    80002df8:	00000613          	li	a2,0
    80002dfc:	01000593          	li	a1,16
    80002e00:	989ff0ef          	jal	80002788 <print_number_long.part.0>
    80002e04:	ef1ff06f          	j	80002cf4 <printf+0xc8>
    80002e08:	00813783          	ld	a5,8(sp)
    80002e0c:	0007b503          	ld	a0,0(a5)
    80002e10:	00878793          	add	a5,a5,8
    80002e14:	00f13423          	sd	a5,8(sp)
    80002e18:	04050063          	beqz	a0,80002e58 <printf+0x22c>
    80002e1c:	00100613          	li	a2,1
    80002e20:	00a00593          	li	a1,10
    80002e24:	965ff0ef          	jal	80002788 <print_number_long.part.0>
    80002e28:	ecdff06f          	j	80002cf4 <printf+0xc8>
    80002e2c:	02500513          	li	a0,37
    80002e30:	154000ef          	jal	80002f84 <uart_putc>
    80002e34:	ec1ff06f          	j	80002cf4 <printf+0xc8>
    80002e38:	02500513          	li	a0,37
    80002e3c:	148000ef          	jal	80002f84 <uart_putc>
    80002e40:	06c00513          	li	a0,108
    80002e44:	140000ef          	jal	80002f84 <uart_putc>
    80002e48:	ea1ff06f          	j	80002ce8 <printf+0xbc>
    80002e4c:	02500513          	li	a0,37
    80002e50:	134000ef          	jal	80002f84 <uart_putc>
    80002e54:	eadff06f          	j	80002d00 <printf+0xd4>
    80002e58:	03000513          	li	a0,48
    80002e5c:	128000ef          	jal	80002f84 <uart_putc>
    80002e60:	e95ff06f          	j	80002cf4 <printf+0xc8>
    80002e64:	00008517          	auipc	a0,0x8
    80002e68:	a9450513          	add	a0,a0,-1388 # 8000a8f8 <rodata_start+0x38f8>
    80002e6c:	130000ef          	jal	80002f9c <uart_puts>
    80002e70:	e85ff06f          	j	80002cf4 <printf+0xc8>
    80002e74:	02500513          	li	a0,37
    80002e78:	10c000ef          	jal	80002f84 <uart_putc>
    80002e7c:	06c00513          	li	a0,108
    80002e80:	104000ef          	jal	80002f84 <uart_putc>
    80002e84:	e7dff06f          	j	80002d00 <printf+0xd4>
    80002e88:	fff00b13          	li	s6,-1
    80002e8c:	e75ff06f          	j	80002d00 <printf+0xd4>

0000000080002e90 <test_printf_basic>:
    80002e90:	ff010113          	add	sp,sp,-16
    80002e94:	02a00593          	li	a1,42
    80002e98:	00008517          	auipc	a0,0x8
    80002e9c:	a7050513          	add	a0,a0,-1424 # 8000a908 <rodata_start+0x3908>
    80002ea0:	00113423          	sd	ra,8(sp)
    80002ea4:	d89ff0ef          	jal	80002c2c <printf>
    80002ea8:	f8500593          	li	a1,-123
    80002eac:	00008517          	auipc	a0,0x8
    80002eb0:	a7450513          	add	a0,a0,-1420 # 8000a920 <rodata_start+0x3920>
    80002eb4:	d79ff0ef          	jal	80002c2c <printf>
    80002eb8:	00000593          	li	a1,0
    80002ebc:	00008517          	auipc	a0,0x8
    80002ec0:	a7c50513          	add	a0,a0,-1412 # 8000a938 <rodata_start+0x3938>
    80002ec4:	d69ff0ef          	jal	80002c2c <printf>
    80002ec8:	000015b7          	lui	a1,0x1
    80002ecc:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80002ed0:	00008517          	auipc	a0,0x8
    80002ed4:	a8050513          	add	a0,a0,-1408 # 8000a950 <rodata_start+0x3950>
    80002ed8:	d55ff0ef          	jal	80002c2c <printf>
    80002edc:	00008597          	auipc	a1,0x8
    80002ee0:	a8c58593          	add	a1,a1,-1396 # 8000a968 <rodata_start+0x3968>
    80002ee4:	00008517          	auipc	a0,0x8
    80002ee8:	a8c50513          	add	a0,a0,-1396 # 8000a970 <rodata_start+0x3970>
    80002eec:	d41ff0ef          	jal	80002c2c <printf>
    80002ef0:	05800593          	li	a1,88
    80002ef4:	00008517          	auipc	a0,0x8
    80002ef8:	a9450513          	add	a0,a0,-1388 # 8000a988 <rodata_start+0x3988>
    80002efc:	d31ff0ef          	jal	80002c2c <printf>
    80002f00:	00813083          	ld	ra,8(sp)
    80002f04:	00008517          	auipc	a0,0x8
    80002f08:	a9c50513          	add	a0,a0,-1380 # 8000a9a0 <rodata_start+0x39a0>
    80002f0c:	01010113          	add	sp,sp,16
    80002f10:	d1dff06f          	j	80002c2c <printf>

0000000080002f14 <test_printf_edge_cases>:
    80002f14:	800005b7          	lui	a1,0x80000
    80002f18:	ff010113          	add	sp,sp,-16
    80002f1c:	fff5c593          	not	a1,a1
    80002f20:	00008517          	auipc	a0,0x8
    80002f24:	a9850513          	add	a0,a0,-1384 # 8000a9b8 <rodata_start+0x39b8>
    80002f28:	00113423          	sd	ra,8(sp)
    80002f2c:	d01ff0ef          	jal	80002c2c <printf>
    80002f30:	800005b7          	lui	a1,0x80000
    80002f34:	00008517          	auipc	a0,0x8
    80002f38:	a9450513          	add	a0,a0,-1388 # 8000a9c8 <rodata_start+0x39c8>
    80002f3c:	cf1ff0ef          	jal	80002c2c <printf>
    80002f40:	00000593          	li	a1,0
    80002f44:	00008517          	auipc	a0,0x8
    80002f48:	a9450513          	add	a0,a0,-1388 # 8000a9d8 <rodata_start+0x39d8>
    80002f4c:	ce1ff0ef          	jal	80002c2c <printf>
    80002f50:	00005597          	auipc	a1,0x5
    80002f54:	1b058593          	add	a1,a1,432 # 80008100 <rodata_start+0x1100>
    80002f58:	00008517          	auipc	a0,0x8
    80002f5c:	a9850513          	add	a0,a0,-1384 # 8000a9f0 <rodata_start+0x39f0>
    80002f60:	ccdff0ef          	jal	80002c2c <printf>
    80002f64:	00008517          	auipc	a0,0x8
    80002f68:	aa450513          	add	a0,a0,-1372 # 8000aa08 <rodata_start+0x3a08>
    80002f6c:	cc1ff0ef          	jal	80002c2c <printf>
    80002f70:	00813083          	ld	ra,8(sp)
    80002f74:	00008517          	auipc	a0,0x8
    80002f78:	aa450513          	add	a0,a0,-1372 # 8000aa18 <rodata_start+0x3a18>
    80002f7c:	01010113          	add	sp,sp,16
    80002f80:	cadff06f          	j	80002c2c <printf>

0000000080002f84 <uart_putc>:
    80002f84:	10000737          	lui	a4,0x10000
    80002f88:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002f8c:	0207f793          	and	a5,a5,32
    80002f90:	fe078ce3          	beqz	a5,80002f88 <uart_putc+0x4>
    80002f94:	00a70023          	sb	a0,0(a4)
    80002f98:	00008067          	ret

0000000080002f9c <uart_puts>:
    80002f9c:	00054683          	lbu	a3,0(a0)
    80002fa0:	02068263          	beqz	a3,80002fc4 <uart_puts+0x28>
    80002fa4:	10000737          	lui	a4,0x10000
    80002fa8:	00150513          	add	a0,a0,1
    80002fac:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002fb0:	0207f793          	and	a5,a5,32
    80002fb4:	fe078ce3          	beqz	a5,80002fac <uart_puts+0x10>
    80002fb8:	00d70023          	sb	a3,0(a4)
    80002fbc:	00054683          	lbu	a3,0(a0)
    80002fc0:	fe0694e3          	bnez	a3,80002fa8 <uart_puts+0xc>
    80002fc4:	00008067          	ret

0000000080002fc8 <pmm_init>:
    80002fc8:	000017b7          	lui	a5,0x1
    80002fcc:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80002fd0:	00f50533          	add	a0,a0,a5
    80002fd4:	fffff737          	lui	a4,0xfffff
    80002fd8:	00e57533          	and	a0,a0,a4
    80002fdc:	00e5f5b3          	and	a1,a1,a4
    80002fe0:	00424797          	auipc	a5,0x424
    80002fe4:	3ca7b423          	sd	a0,968(a5) # 804273a8 <mem_start>
    80002fe8:	00424797          	auipc	a5,0x424
    80002fec:	3ab7bc23          	sd	a1,952(a5) # 804273a0 <mem_end>
    80002ff0:	00424797          	auipc	a5,0x424
    80002ff4:	3c07b023          	sd	zero,960(a5) # 804273b0 <freelist>
    80002ff8:	02b57e63          	bgeu	a0,a1,80003034 <pmm_init+0x6c>
    80002ffc:	02050e63          	beqz	a0,80003038 <pmm_init+0x70>
    80003000:	00050793          	mv	a5,a0
    80003004:	00000613          	li	a2,0
    80003008:	00000693          	li	a3,0
    8000300c:	00a7e863          	bltu	a5,a0,8000301c <pmm_init+0x54>
    80003010:	00d7b023          	sd	a3,0(a5)
    80003014:	00100613          	li	a2,1
    80003018:	00078693          	mv	a3,a5
    8000301c:	00001737          	lui	a4,0x1
    80003020:	00e787b3          	add	a5,a5,a4
    80003024:	feb7e4e3          	bltu	a5,a1,8000300c <pmm_init+0x44>
    80003028:	00060663          	beqz	a2,80003034 <pmm_init+0x6c>
    8000302c:	00424797          	auipc	a5,0x424
    80003030:	38d7b223          	sd	a3,900(a5) # 804273b0 <freelist>
    80003034:	00008067          	ret
    80003038:	00000793          	li	a5,0
    8000303c:	00000613          	li	a2,0
    80003040:	00000693          	li	a3,0
    80003044:	fd9ff06f          	j	8000301c <pmm_init+0x54>

0000000080003048 <alloc_page>:
    80003048:	00424797          	auipc	a5,0x424
    8000304c:	36878793          	add	a5,a5,872 # 804273b0 <freelist>
    80003050:	0007b503          	ld	a0,0(a5)
    80003054:	00050663          	beqz	a0,80003060 <alloc_page+0x18>
    80003058:	00053703          	ld	a4,0(a0)
    8000305c:	00e7b023          	sd	a4,0(a5)
    80003060:	00008067          	ret

0000000080003064 <free_page>:
    80003064:	02050c63          	beqz	a0,8000309c <free_page+0x38>
    80003068:	00424797          	auipc	a5,0x424
    8000306c:	3407b783          	ld	a5,832(a5) # 804273a8 <mem_start>
    80003070:	02f56663          	bltu	a0,a5,8000309c <free_page+0x38>
    80003074:	00424797          	auipc	a5,0x424
    80003078:	32c7b783          	ld	a5,812(a5) # 804273a0 <mem_end>
    8000307c:	02f57063          	bgeu	a0,a5,8000309c <free_page+0x38>
    80003080:	03451793          	sll	a5,a0,0x34
    80003084:	00079c63          	bnez	a5,8000309c <free_page+0x38>
    80003088:	00424797          	auipc	a5,0x424
    8000308c:	32878793          	add	a5,a5,808 # 804273b0 <freelist>
    80003090:	0007b703          	ld	a4,0(a5)
    80003094:	00a7b023          	sd	a0,0(a5)
    80003098:	00e53023          	sd	a4,0(a0)
    8000309c:	00008067          	ret

00000000800030a0 <alloc_pages>:
    800030a0:	00050613          	mv	a2,a0
    800030a4:	08a05863          	blez	a0,80003134 <alloc_pages+0x94>
    800030a8:	00424317          	auipc	t1,0x424
    800030ac:	30830313          	add	t1,t1,776 # 804273b0 <freelist>
    800030b0:	00100793          	li	a5,1
    800030b4:	00033803          	ld	a6,0(t1)
    800030b8:	06f50463          	beq	a0,a5,80003120 <alloc_pages+0x80>
    800030bc:	06080c63          	beqz	a6,80003134 <alloc_pages+0x94>
    800030c0:	00083503          	ld	a0,0(a6)
    800030c4:	00080793          	mv	a5,a6
    800030c8:	00100713          	li	a4,1
    800030cc:	00000893          	li	a7,0
    800030d0:	000015b7          	lui	a1,0x1
    800030d4:	0200006f          	j	800030f4 <alloc_pages+0x54>
    800030d8:	02d50463          	beq	a0,a3,80003100 <alloc_pages+0x60>
    800030dc:	00053683          	ld	a3,0(a0)
    800030e0:	00078893          	mv	a7,a5
    800030e4:	00050813          	mv	a6,a0
    800030e8:	00100713          	li	a4,1
    800030ec:	00050793          	mv	a5,a0
    800030f0:	00068513          	mv	a0,a3
    800030f4:	00b786b3          	add	a3,a5,a1
    800030f8:	fe0510e3          	bnez	a0,800030d8 <alloc_pages+0x38>
    800030fc:	00008067          	ret
    80003100:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80003104:	00053683          	ld	a3,0(a0)
    80003108:	fee612e3          	bne	a2,a4,800030ec <alloc_pages+0x4c>
    8000310c:	02088863          	beqz	a7,8000313c <alloc_pages+0x9c>
    80003110:	00d8b023          	sd	a3,0(a7)
    80003114:	00053023          	sd	zero,0(a0)
    80003118:	00080513          	mv	a0,a6
    8000311c:	00008067          	ret
    80003120:	00080663          	beqz	a6,8000312c <alloc_pages+0x8c>
    80003124:	00083783          	ld	a5,0(a6)
    80003128:	00f33023          	sd	a5,0(t1)
    8000312c:	00080513          	mv	a0,a6
    80003130:	00008067          	ret
    80003134:	00000513          	li	a0,0
    80003138:	00008067          	ret
    8000313c:	00053023          	sd	zero,0(a0)
    80003140:	00d33023          	sd	a3,0(t1)
    80003144:	00080513          	mv	a0,a6
    80003148:	00008067          	ret

000000008000314c <walk_lookup>:
    8000314c:	01e5d793          	srl	a5,a1,0x1e
    80003150:	1ff7f793          	and	a5,a5,511
    80003154:	00379793          	sll	a5,a5,0x3
    80003158:	00f50533          	add	a0,a0,a5
    8000315c:	00053703          	ld	a4,0(a0)
    80003160:	00177793          	and	a5,a4,1
    80003164:	04078a63          	beqz	a5,800031b8 <walk_lookup+0x6c>
    80003168:	00e77793          	and	a5,a4,14
    8000316c:	04079663          	bnez	a5,800031b8 <walk_lookup+0x6c>
    80003170:	0155d793          	srl	a5,a1,0x15
    80003174:	00a75713          	srl	a4,a4,0xa
    80003178:	1ff7f793          	and	a5,a5,511
    8000317c:	00c71713          	sll	a4,a4,0xc
    80003180:	00379793          	sll	a5,a5,0x3
    80003184:	00e787b3          	add	a5,a5,a4
    80003188:	0007b503          	ld	a0,0(a5)
    8000318c:	00157793          	and	a5,a0,1
    80003190:	02078463          	beqz	a5,800031b8 <walk_lookup+0x6c>
    80003194:	00e57793          	and	a5,a0,14
    80003198:	02079063          	bnez	a5,800031b8 <walk_lookup+0x6c>
    8000319c:	00c5d593          	srl	a1,a1,0xc
    800031a0:	00a55513          	srl	a0,a0,0xa
    800031a4:	1ff5f593          	and	a1,a1,511
    800031a8:	00359593          	sll	a1,a1,0x3
    800031ac:	00c51513          	sll	a0,a0,0xc
    800031b0:	00b50533          	add	a0,a0,a1
    800031b4:	00008067          	ret
    800031b8:	00000513          	li	a0,0
    800031bc:	00008067          	ret

00000000800031c0 <free_swap_slot.part.0>:
    800031c0:	0055579b          	srlw	a5,a0,0x5
    800031c4:	0000e617          	auipc	a2,0xe
    800031c8:	e3c60613          	add	a2,a2,-452 # 80011000 <swap_mgr>
    800031cc:	00279793          	sll	a5,a5,0x2
    800031d0:	00f607b3          	add	a5,a2,a5
    800031d4:	0007a583          	lw	a1,0(a5)
    800031d8:	00100713          	li	a4,1
    800031dc:	00a7173b          	sllw	a4,a4,a0
    800031e0:	00e5f6b3          	and	a3,a1,a4
    800031e4:	0006869b          	sext.w	a3,a3
    800031e8:	02068463          	beqz	a3,80003210 <free_swap_slot.part.0+0x50>
    800031ec:	08862683          	lw	a3,136(a2)
    800031f0:	fff74713          	not	a4,a4
    800031f4:	08062803          	lw	a6,128(a2)
    800031f8:	00e5f5b3          	and	a1,a1,a4
    800031fc:	fff6871b          	addw	a4,a3,-1
    80003200:	00b7a023          	sw	a1,0(a5)
    80003204:	08e62423          	sw	a4,136(a2)
    80003208:	01057463          	bgeu	a0,a6,80003210 <free_swap_slot.part.0+0x50>
    8000320c:	08a62023          	sw	a0,128(a2)
    80003210:	00008067          	ret

0000000080003214 <create_pagetable>:
    80003214:	ff010113          	add	sp,sp,-16
    80003218:	00113423          	sd	ra,8(sp)
    8000321c:	e2dff0ef          	jal	80003048 <alloc_page>
    80003220:	00050e63          	beqz	a0,8000323c <create_pagetable+0x28>
    80003224:	00001737          	lui	a4,0x1
    80003228:	00050793          	mv	a5,a0
    8000322c:	00e50733          	add	a4,a0,a4
    80003230:	0007b023          	sd	zero,0(a5)
    80003234:	00878793          	add	a5,a5,8
    80003238:	fee79ce3          	bne	a5,a4,80003230 <create_pagetable+0x1c>
    8000323c:	00813083          	ld	ra,8(sp)
    80003240:	01010113          	add	sp,sp,16
    80003244:	00008067          	ret

0000000080003248 <map_page>:
    80003248:	00c5e7b3          	or	a5,a1,a2
    8000324c:	03479713          	sll	a4,a5,0x34
    80003250:	20071863          	bnez	a4,80003460 <map_page+0x218>
    80003254:	fc010113          	add	sp,sp,-64
    80003258:	02913423          	sd	s1,40(sp)
    8000325c:	03213023          	sd	s2,32(sp)
    80003260:	01313c23          	sd	s3,24(sp)
    80003264:	01413823          	sd	s4,16(sp)
    80003268:	01513423          	sd	s5,8(sp)
    8000326c:	01613023          	sd	s6,0(sp)
    80003270:	02113c23          	sd	ra,56(sp)
    80003274:	02813823          	sd	s0,48(sp)
    80003278:	00058493          	mv	s1,a1
    8000327c:	00060913          	mv	s2,a2
    80003280:	00050a13          	mv	s4,a0
    80003284:	00068993          	mv	s3,a3
    80003288:	00050813          	mv	a6,a0
    8000328c:	00200a93          	li	s5,2
    80003290:	00200793          	li	a5,2
    80003294:	00100b13          	li	s6,1
    80003298:	0037941b          	sllw	s0,a5,0x3
    8000329c:	00f4043b          	addw	s0,s0,a5
    800032a0:	00c4041b          	addw	s0,s0,12
    800032a4:	0084d433          	srl	s0,s1,s0
    800032a8:	1ff47413          	and	s0,s0,511
    800032ac:	00341413          	sll	s0,s0,0x3
    800032b0:	00880433          	add	s0,a6,s0
    800032b4:	00043783          	ld	a5,0(s0)
    800032b8:	0017f713          	and	a4,a5,1
    800032bc:	14070e63          	beqz	a4,80003418 <map_page+0x1d0>
    800032c0:	00e7f713          	and	a4,a5,14
    800032c4:	18071a63          	bnez	a4,80003458 <map_page+0x210>
    800032c8:	00a7d793          	srl	a5,a5,0xa
    800032cc:	00c79813          	sll	a6,a5,0xc
    800032d0:	00100793          	li	a5,1
    800032d4:	016a8663          	beq	s5,s6,800032e0 <map_page+0x98>
    800032d8:	00100a93          	li	s5,1
    800032dc:	fbdff06f          	j	80003298 <map_page+0x50>
    800032e0:	00c4d793          	srl	a5,s1,0xc
    800032e4:	1ff7f793          	and	a5,a5,511
    800032e8:	00379793          	sll	a5,a5,0x3
    800032ec:	00f80833          	add	a6,a6,a5
    800032f0:	16080463          	beqz	a6,80003458 <map_page+0x210>
    800032f4:	00083783          	ld	a5,0(a6)
    800032f8:	0017f793          	and	a5,a5,1
    800032fc:	14079e63          	bnez	a5,80003458 <map_page+0x210>
    80003300:	00c95793          	srl	a5,s2,0xc
    80003304:	00a79793          	sll	a5,a5,0xa
    80003308:	00411597          	auipc	a1,0x411
    8000330c:	d8858593          	add	a1,a1,-632 # 80414090 <lru_mgr+0x3000>
    80003310:	0145a703          	lw	a4,20(a1)
    80003314:	0137e7b3          	or	a5,a5,s3
    80003318:	0017e793          	or	a5,a5,1
    8000331c:	00f83023          	sd	a5,0(a6)
    80003320:	0c070663          	beqz	a4,800033ec <map_page+0x1a4>
    80003324:	0040e717          	auipc	a4,0x40e
    80003328:	d9070713          	add	a4,a4,-624 # 804110b4 <lru_mgr+0x24>
    8000332c:	00000793          	li	a5,0
    80003330:	10000693          	li	a3,256
    80003334:	00c0006f          	j	80003340 <map_page+0xf8>
    80003338:	0017879b          	addw	a5,a5,1
    8000333c:	0ad78863          	beq	a5,a3,800033ec <map_page+0x1a4>
    80003340:	00072803          	lw	a6,0(a4)
    80003344:	03070713          	add	a4,a4,48
    80003348:	fe0818e3          	bnez	a6,80003338 <map_page+0xf0>
    8000334c:	00178813          	add	a6,a5,1
    80003350:	00181513          	sll	a0,a6,0x1
    80003354:	00179713          	sll	a4,a5,0x1
    80003358:	01050533          	add	a0,a0,a6
    8000335c:	0040e617          	auipc	a2,0x40e
    80003360:	d3460613          	add	a2,a2,-716 # 80411090 <lru_mgr>
    80003364:	00f706b3          	add	a3,a4,a5
    80003368:	00451513          	sll	a0,a0,0x4
    8000336c:	00469693          	sll	a3,a3,0x4
    80003370:	00a60533          	add	a0,a2,a0
    80003374:	fffff337          	lui	t1,0xfffff
    80003378:	00d608b3          	add	a7,a2,a3
    8000337c:	0064f4b3          	and	s1,s1,t1
    80003380:	01453423          	sd	s4,8(a0)
    80003384:	fff00513          	li	a0,-1
    80003388:	01068693          	add	a3,a3,16
    8000338c:	0098b823          	sd	s1,16(a7)
    80003390:	0128bc23          	sd	s2,24(a7)
    80003394:	02a8a023          	sw	a0,32(a7)
    80003398:	0049f993          	and	s3,s3,4
    8000339c:	00d606b3          	add	a3,a2,a3
    800033a0:	00098463          	beqz	s3,800033a8 <map_page+0x160>
    800033a4:	00500a93          	li	s5,5
    800033a8:	00181513          	sll	a0,a6,0x1
    800033ac:	00f707b3          	add	a5,a4,a5
    800033b0:	00063883          	ld	a7,0(a2)
    800033b4:	01050733          	add	a4,a0,a6
    800033b8:	00479793          	sll	a5,a5,0x4
    800033bc:	00471713          	sll	a4,a4,0x4
    800033c0:	00f607b3          	add	a5,a2,a5
    800033c4:	00e60733          	add	a4,a2,a4
    800033c8:	0357a223          	sw	s5,36(a5)
    800033cc:	01173023          	sd	a7,0(a4)
    800033d0:	0207b423          	sd	zero,40(a5)
    800033d4:	06088e63          	beqz	a7,80003450 <map_page+0x208>
    800033d8:	00d8bc23          	sd	a3,24(a7)
    800033dc:	0105a783          	lw	a5,16(a1)
    800033e0:	00d63023          	sd	a3,0(a2)
    800033e4:	0017879b          	addw	a5,a5,1
    800033e8:	00f5a823          	sw	a5,16(a1)
    800033ec:	00000513          	li	a0,0
    800033f0:	03813083          	ld	ra,56(sp)
    800033f4:	03013403          	ld	s0,48(sp)
    800033f8:	02813483          	ld	s1,40(sp)
    800033fc:	02013903          	ld	s2,32(sp)
    80003400:	01813983          	ld	s3,24(sp)
    80003404:	01013a03          	ld	s4,16(sp)
    80003408:	00813a83          	ld	s5,8(sp)
    8000340c:	00013b03          	ld	s6,0(sp)
    80003410:	04010113          	add	sp,sp,64
    80003414:	00008067          	ret
    80003418:	c31ff0ef          	jal	80003048 <alloc_page>
    8000341c:	00050813          	mv	a6,a0
    80003420:	02050c63          	beqz	a0,80003458 <map_page+0x210>
    80003424:	00001737          	lui	a4,0x1
    80003428:	00e50733          	add	a4,a0,a4
    8000342c:	00050793          	mv	a5,a0
    80003430:	0007b023          	sd	zero,0(a5)
    80003434:	00878793          	add	a5,a5,8
    80003438:	fee79ce3          	bne	a5,a4,80003430 <map_page+0x1e8>
    8000343c:	00c85793          	srl	a5,a6,0xc
    80003440:	00a79793          	sll	a5,a5,0xa
    80003444:	0017e793          	or	a5,a5,1
    80003448:	00f43023          	sd	a5,0(s0)
    8000344c:	e85ff06f          	j	800032d0 <map_page+0x88>
    80003450:	00d63423          	sd	a3,8(a2)
    80003454:	f89ff06f          	j	800033dc <map_page+0x194>
    80003458:	fff00513          	li	a0,-1
    8000345c:	f95ff06f          	j	800033f0 <map_page+0x1a8>
    80003460:	fff00513          	li	a0,-1
    80003464:	00008067          	ret

0000000080003468 <map_region>:
    80003468:	000017b7          	lui	a5,0x1
    8000346c:	fc010113          	add	sp,sp,-64
    80003470:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003474:	02913423          	sd	s1,40(sp)
    80003478:	00f684b3          	add	s1,a3,a5
    8000347c:	00b484b3          	add	s1,s1,a1
    80003480:	fffff7b7          	lui	a5,0xfffff
    80003484:	02113c23          	sd	ra,56(sp)
    80003488:	02813823          	sd	s0,48(sp)
    8000348c:	03213023          	sd	s2,32(sp)
    80003490:	01313c23          	sd	s3,24(sp)
    80003494:	01413823          	sd	s4,16(sp)
    80003498:	01513423          	sd	s5,8(sp)
    8000349c:	00f4f4b3          	and	s1,s1,a5
    800034a0:	0495f263          	bgeu	a1,s1,800034e4 <map_region+0x7c>
    800034a4:	00058413          	mv	s0,a1
    800034a8:	00050993          	mv	s3,a0
    800034ac:	00070a13          	mv	s4,a4
    800034b0:	40b60933          	sub	s2,a2,a1
    800034b4:	00001ab7          	lui	s5,0x1
    800034b8:	0080006f          	j	800034c0 <map_region+0x58>
    800034bc:	02947463          	bgeu	s0,s1,800034e4 <map_region+0x7c>
    800034c0:	00890633          	add	a2,s2,s0
    800034c4:	00040593          	mv	a1,s0
    800034c8:	000a0693          	mv	a3,s4
    800034cc:	00098513          	mv	a0,s3
    800034d0:	d79ff0ef          	jal	80003248 <map_page>
    800034d4:	01540433          	add	s0,s0,s5
    800034d8:	fe0502e3          	beqz	a0,800034bc <map_region+0x54>
    800034dc:	fff00513          	li	a0,-1
    800034e0:	0080006f          	j	800034e8 <map_region+0x80>
    800034e4:	00000513          	li	a0,0
    800034e8:	03813083          	ld	ra,56(sp)
    800034ec:	03013403          	ld	s0,48(sp)
    800034f0:	02813483          	ld	s1,40(sp)
    800034f4:	02013903          	ld	s2,32(sp)
    800034f8:	01813983          	ld	s3,24(sp)
    800034fc:	01013a03          	ld	s4,16(sp)
    80003500:	00813a83          	ld	s5,8(sp)
    80003504:	04010113          	add	sp,sp,64
    80003508:	00008067          	ret

000000008000350c <destroy_pagetable>:
    8000350c:	f0010113          	add	sp,sp,-256
    80003510:	000017b7          	lui	a5,0x1
    80003514:	0e813823          	sd	s0,240(sp)
    80003518:	0f213023          	sd	s2,224(sp)
    8000351c:	0d613023          	sd	s6,192(sp)
    80003520:	0b713c23          	sd	s7,184(sp)
    80003524:	0e113c23          	sd	ra,248(sp)
    80003528:	0e913423          	sd	s1,232(sp)
    8000352c:	0d313c23          	sd	s3,216(sp)
    80003530:	0d413823          	sd	s4,208(sp)
    80003534:	0d513423          	sd	s5,200(sp)
    80003538:	0b813823          	sd	s8,176(sp)
    8000353c:	0b913423          	sd	s9,168(sp)
    80003540:	0ba13023          	sd	s10,160(sp)
    80003544:	09b13c23          	sd	s11,152(sp)
    80003548:	00050413          	mv	s0,a0
    8000354c:	00050913          	mv	s2,a0
    80003550:	00f50b33          	add	s6,a0,a5
    80003554:	00001bb7          	lui	s7,0x1
    80003558:	00c0006f          	j	80003564 <destroy_pagetable+0x58>
    8000355c:	00890913          	add	s2,s2,8
    80003560:	2d690063          	beq	s2,s6,80003820 <destroy_pagetable+0x314>
    80003564:	00093783          	ld	a5,0(s2)
    80003568:	00100713          	li	a4,1
    8000356c:	00f7f693          	and	a3,a5,15
    80003570:	fee696e3          	bne	a3,a4,8000355c <destroy_pagetable+0x50>
    80003574:	00a7d793          	srl	a5,a5,0xa
    80003578:	00c79a13          	sll	s4,a5,0xc
    8000357c:	017a0cb3          	add	s9,s4,s7
    80003580:	00100d93          	li	s11,1
    80003584:	000a0a93          	mv	s5,s4
    80003588:	00040493          	mv	s1,s0
    8000358c:	00c0006f          	j	80003598 <destroy_pagetable+0x8c>
    80003590:	008a0a13          	add	s4,s4,8
    80003594:	279a0c63          	beq	s4,s9,8000380c <destroy_pagetable+0x300>
    80003598:	000a3783          	ld	a5,0(s4)
    8000359c:	00f7f713          	and	a4,a5,15
    800035a0:	ffb718e3          	bne	a4,s11,80003590 <destroy_pagetable+0x84>
    800035a4:	00a7d793          	srl	a5,a5,0xa
    800035a8:	00c79993          	sll	s3,a5,0xc
    800035ac:	00098c13          	mv	s8,s3
    800035b0:	01798d33          	add	s10,s3,s7
    800035b4:	00098413          	mv	s0,s3
    800035b8:	00c0006f          	j	800035c4 <destroy_pagetable+0xb8>
    800035bc:	00840413          	add	s0,s0,8
    800035c0:	23a40e63          	beq	s0,s10,800037fc <destroy_pagetable+0x2f0>
    800035c4:	00043783          	ld	a5,0(s0)
    800035c8:	00f7f713          	and	a4,a5,15
    800035cc:	ffb718e3          	bne	a4,s11,800035bc <destroy_pagetable+0xb0>
    800035d0:	00a7d793          	srl	a5,a5,0xa
    800035d4:	00c79793          	sll	a5,a5,0xc
    800035d8:	00048713          	mv	a4,s1
    800035dc:	03513c23          	sd	s5,56(sp)
    800035e0:	00090493          	mv	s1,s2
    800035e4:	017789b3          	add	s3,a5,s7
    800035e8:	02813823          	sd	s0,48(sp)
    800035ec:	00078a93          	mv	s5,a5
    800035f0:	00070913          	mv	s2,a4
    800035f4:	00c0006f          	j	80003600 <destroy_pagetable+0xf4>
    800035f8:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    800035fc:	1cf98e63          	beq	s3,a5,800037d8 <destroy_pagetable+0x2cc>
    80003600:	0007b703          	ld	a4,0(a5)
    80003604:	00f77693          	and	a3,a4,15
    80003608:	ffb698e3          	bne	a3,s11,800035f8 <destroy_pagetable+0xec>
    8000360c:	00a75713          	srl	a4,a4,0xa
    80003610:	00c71713          	sll	a4,a4,0xc
    80003614:	017706b3          	add	a3,a4,s7
    80003618:	05313423          	sd	s3,72(sp)
    8000361c:	00d13423          	sd	a3,8(sp)
    80003620:	05813023          	sd	s8,64(sp)
    80003624:	00070993          	mv	s3,a4
    80003628:	04f13823          	sd	a5,80(sp)
    8000362c:	0100006f          	j	8000363c <destroy_pagetable+0x130>
    80003630:	00813783          	ld	a5,8(sp)
    80003634:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    80003638:	16e78e63          	beq	a5,a4,800037b4 <destroy_pagetable+0x2a8>
    8000363c:	00073783          	ld	a5,0(a4)
    80003640:	00f7f693          	and	a3,a5,15
    80003644:	ffb696e3          	bne	a3,s11,80003630 <destroy_pagetable+0x124>
    80003648:	00a7d793          	srl	a5,a5,0xa
    8000364c:	00c79793          	sll	a5,a5,0xc
    80003650:	017786b3          	add	a3,a5,s7
    80003654:	000a8c13          	mv	s8,s5
    80003658:	00d13c23          	sd	a3,24(sp)
    8000365c:	00078a93          	mv	s5,a5
    80003660:	04e13c23          	sd	a4,88(sp)
    80003664:	07213023          	sd	s2,96(sp)
    80003668:	0100006f          	j	80003678 <destroy_pagetable+0x16c>
    8000366c:	01813703          	ld	a4,24(sp)
    80003670:	00878793          	add	a5,a5,8
    80003674:	10f70c63          	beq	a4,a5,8000378c <destroy_pagetable+0x280>
    80003678:	0007b703          	ld	a4,0(a5)
    8000367c:	00f77693          	and	a3,a4,15
    80003680:	ffb696e3          	bne	a3,s11,8000366c <destroy_pagetable+0x160>
    80003684:	00a75713          	srl	a4,a4,0xa
    80003688:	00c71913          	sll	s2,a4,0xc
    8000368c:	01790733          	add	a4,s2,s7
    80003690:	07213423          	sd	s2,104(sp)
    80003694:	00090413          	mv	s0,s2
    80003698:	02e13023          	sd	a4,32(sp)
    8000369c:	06f13823          	sd	a5,112(sp)
    800036a0:	00048913          	mv	s2,s1
    800036a4:	0100006f          	j	800036b4 <destroy_pagetable+0x1a8>
    800036a8:	02013783          	ld	a5,32(sp)
    800036ac:	00840413          	add	s0,s0,8
    800036b0:	0a878c63          	beq	a5,s0,80003768 <destroy_pagetable+0x25c>
    800036b4:	00043783          	ld	a5,0(s0)
    800036b8:	00f7f693          	and	a3,a5,15
    800036bc:	ffb696e3          	bne	a3,s11,800036a8 <destroy_pagetable+0x19c>
    800036c0:	00a7d793          	srl	a5,a5,0xa
    800036c4:	00c79493          	sll	s1,a5,0xc
    800036c8:	017487b3          	add	a5,s1,s7
    800036cc:	00913823          	sd	s1,16(sp)
    800036d0:	02f13423          	sd	a5,40(sp)
    800036d4:	06813c23          	sd	s0,120(sp)
    800036d8:	0100006f          	j	800036e8 <destroy_pagetable+0x1dc>
    800036dc:	02813783          	ld	a5,40(sp)
    800036e0:	00848493          	add	s1,s1,8
    800036e4:	06978663          	beq	a5,s1,80003750 <destroy_pagetable+0x244>
    800036e8:	0004b783          	ld	a5,0(s1)
    800036ec:	00f7f693          	and	a3,a5,15
    800036f0:	ffb696e3          	bne	a3,s11,800036dc <destroy_pagetable+0x1d0>
    800036f4:	00a7d793          	srl	a5,a5,0xa
    800036f8:	00c79413          	sll	s0,a5,0xc
    800036fc:	017406b3          	add	a3,s0,s7
    80003700:	09213023          	sd	s2,128(sp)
    80003704:	09613423          	sd	s6,136(sp)
    80003708:	00040913          	mv	s2,s0
    8000370c:	000a0b13          	mv	s6,s4
    80003710:	00048a13          	mv	s4,s1
    80003714:	00068493          	mv	s1,a3
    80003718:	00043783          	ld	a5,0(s0)
    8000371c:	00840413          	add	s0,s0,8
    80003720:	00f7f713          	and	a4,a5,15
    80003724:	13b70e63          	beq	a4,s11,80003860 <destroy_pagetable+0x354>
    80003728:	fe8498e3          	bne	s1,s0,80003718 <destroy_pagetable+0x20c>
    8000372c:	00090513          	mv	a0,s2
    80003730:	000a0493          	mv	s1,s4
    80003734:	08013903          	ld	s2,128(sp)
    80003738:	000b0a13          	mv	s4,s6
    8000373c:	08813b03          	ld	s6,136(sp)
    80003740:	925ff0ef          	jal	80003064 <free_page>
    80003744:	02813783          	ld	a5,40(sp)
    80003748:	00848493          	add	s1,s1,8
    8000374c:	f8979ee3          	bne	a5,s1,800036e8 <destroy_pagetable+0x1dc>
    80003750:	01013503          	ld	a0,16(sp)
    80003754:	07813403          	ld	s0,120(sp)
    80003758:	90dff0ef          	jal	80003064 <free_page>
    8000375c:	02013783          	ld	a5,32(sp)
    80003760:	00840413          	add	s0,s0,8
    80003764:	f48798e3          	bne	a5,s0,800036b4 <destroy_pagetable+0x1a8>
    80003768:	07013783          	ld	a5,112(sp)
    8000376c:	06813503          	ld	a0,104(sp)
    80003770:	00090493          	mv	s1,s2
    80003774:	00f13823          	sd	a5,16(sp)
    80003778:	8edff0ef          	jal	80003064 <free_page>
    8000377c:	01013783          	ld	a5,16(sp)
    80003780:	01813703          	ld	a4,24(sp)
    80003784:	00878793          	add	a5,a5,8
    80003788:	eef718e3          	bne	a4,a5,80003678 <destroy_pagetable+0x16c>
    8000378c:	05813703          	ld	a4,88(sp)
    80003790:	000a8513          	mv	a0,s5
    80003794:	06013903          	ld	s2,96(sp)
    80003798:	00e13823          	sd	a4,16(sp)
    8000379c:	8c9ff0ef          	jal	80003064 <free_page>
    800037a0:	01013703          	ld	a4,16(sp)
    800037a4:	00813783          	ld	a5,8(sp)
    800037a8:	000c0a93          	mv	s5,s8
    800037ac:	00870713          	add	a4,a4,8
    800037b0:	e8e796e3          	bne	a5,a4,8000363c <destroy_pagetable+0x130>
    800037b4:	05013783          	ld	a5,80(sp)
    800037b8:	00098513          	mv	a0,s3
    800037bc:	04013c03          	ld	s8,64(sp)
    800037c0:	00f13423          	sd	a5,8(sp)
    800037c4:	04813983          	ld	s3,72(sp)
    800037c8:	89dff0ef          	jal	80003064 <free_page>
    800037cc:	00813783          	ld	a5,8(sp)
    800037d0:	00878793          	add	a5,a5,8
    800037d4:	e2f996e3          	bne	s3,a5,80003600 <destroy_pagetable+0xf4>
    800037d8:	03013403          	ld	s0,48(sp)
    800037dc:	00090793          	mv	a5,s2
    800037e0:	000a8513          	mv	a0,s5
    800037e4:	00840413          	add	s0,s0,8
    800037e8:	03813a83          	ld	s5,56(sp)
    800037ec:	00048913          	mv	s2,s1
    800037f0:	00078493          	mv	s1,a5
    800037f4:	871ff0ef          	jal	80003064 <free_page>
    800037f8:	dda416e3          	bne	s0,s10,800035c4 <destroy_pagetable+0xb8>
    800037fc:	000c0513          	mv	a0,s8
    80003800:	008a0a13          	add	s4,s4,8
    80003804:	861ff0ef          	jal	80003064 <free_page>
    80003808:	d99a18e3          	bne	s4,s9,80003598 <destroy_pagetable+0x8c>
    8000380c:	000a8513          	mv	a0,s5
    80003810:	00890913          	add	s2,s2,8
    80003814:	00048413          	mv	s0,s1
    80003818:	84dff0ef          	jal	80003064 <free_page>
    8000381c:	d56914e3          	bne	s2,s6,80003564 <destroy_pagetable+0x58>
    80003820:	00040513          	mv	a0,s0
    80003824:	0f013403          	ld	s0,240(sp)
    80003828:	0f813083          	ld	ra,248(sp)
    8000382c:	0e813483          	ld	s1,232(sp)
    80003830:	0e013903          	ld	s2,224(sp)
    80003834:	0d813983          	ld	s3,216(sp)
    80003838:	0d013a03          	ld	s4,208(sp)
    8000383c:	0c813a83          	ld	s5,200(sp)
    80003840:	0c013b03          	ld	s6,192(sp)
    80003844:	0b813b83          	ld	s7,184(sp)
    80003848:	0b013c03          	ld	s8,176(sp)
    8000384c:	0a813c83          	ld	s9,168(sp)
    80003850:	0a013d03          	ld	s10,160(sp)
    80003854:	09813d83          	ld	s11,152(sp)
    80003858:	10010113          	add	sp,sp,256
    8000385c:	809ff06f          	j	80003064 <free_page>
    80003860:	00a7d793          	srl	a5,a5,0xa
    80003864:	00c79513          	sll	a0,a5,0xc
    80003868:	ca5ff0ef          	jal	8000350c <destroy_pagetable>
    8000386c:	ea8496e3          	bne	s1,s0,80003718 <destroy_pagetable+0x20c>
    80003870:	ebdff06f          	j	8000372c <destroy_pagetable+0x220>

0000000080003874 <kvminithart>:
    80003874:	00424797          	auipc	a5,0x424
    80003878:	b447b783          	ld	a5,-1212(a5) # 804273b8 <kernel_pagetable>
    8000387c:	fff00713          	li	a4,-1
    80003880:	03f71713          	sll	a4,a4,0x3f
    80003884:	00c7d793          	srl	a5,a5,0xc
    80003888:	00e7e7b3          	or	a5,a5,a4
    8000388c:	18079073          	csrw	satp,a5
    80003890:	12000073          	sfence.vma
    80003894:	00008067          	ret

0000000080003898 <dump_pagetable>:
    80003898:	fb010113          	add	sp,sp,-80
    8000389c:	03213823          	sd	s2,48(sp)
    800038a0:	03313423          	sd	s3,40(sp)
    800038a4:	04113423          	sd	ra,72(sp)
    800038a8:	04813023          	sd	s0,64(sp)
    800038ac:	02913c23          	sd	s1,56(sp)
    800038b0:	03413023          	sd	s4,32(sp)
    800038b4:	01513c23          	sd	s5,24(sp)
    800038b8:	01613823          	sd	s6,16(sp)
    800038bc:	01713423          	sd	s7,8(sp)
    800038c0:	00058993          	mv	s3,a1
    800038c4:	00050913          	mv	s2,a0
    800038c8:	28b05263          	blez	a1,80003b4c <dump_pagetable+0x2b4>
    800038cc:	00000413          	li	s0,0
    800038d0:	0014041b          	addw	s0,s0,1
    800038d4:	02000513          	li	a0,32
    800038d8:	eacff0ef          	jal	80002f84 <uart_putc>
    800038dc:	fe899ae3          	bne	s3,s0,800038d0 <dump_pagetable+0x38>
    800038e0:	00007517          	auipc	a0,0x7
    800038e4:	2f850513          	add	a0,a0,760 # 8000abd8 <digits+0x18>
    800038e8:	eb4ff0ef          	jal	80002f9c <uart_puts>
    800038ec:	00900793          	li	a5,9
    800038f0:	2737d463          	bge	a5,s3,80003b58 <dump_pagetable+0x2c0>
    800038f4:	00a00413          	li	s0,10
    800038f8:	0289c53b          	divw	a0,s3,s0
    800038fc:	0305051b          	addw	a0,a0,48
    80003900:	0ff57513          	zext.b	a0,a0
    80003904:	e80ff0ef          	jal	80002f84 <uart_putc>
    80003908:	0289e53b          	remw	a0,s3,s0
    8000390c:	0305051b          	addw	a0,a0,48
    80003910:	0ff57513          	zext.b	a0,a0
    80003914:	e70ff0ef          	jal	80002f84 <uart_putc>
    80003918:	00007517          	auipc	a0,0x7
    8000391c:	2d850513          	add	a0,a0,728 # 8000abf0 <digits+0x30>
    80003920:	fff00b13          	li	s6,-1
    80003924:	e78ff0ef          	jal	80002f9c <uart_puts>
    80003928:	00000493          	li	s1,0
    8000392c:	00cb5b13          	srl	s6,s6,0xc
    80003930:	00900a13          	li	s4,9
    80003934:	ffc00a93          	li	s5,-4
    80003938:	0140006f          	j	8000394c <dump_pagetable+0xb4>
    8000393c:	0014849b          	addw	s1,s1,1
    80003940:	20000793          	li	a5,512
    80003944:	00890913          	add	s2,s2,8
    80003948:	0cf48063          	beq	s1,a5,80003a08 <dump_pagetable+0x170>
    8000394c:	00093783          	ld	a5,0(s2)
    80003950:	0017f793          	and	a5,a5,1
    80003954:	fe0784e3          	beqz	a5,8000393c <dump_pagetable+0xa4>
    80003958:	00000413          	li	s0,0
    8000395c:	0009ca63          	bltz	s3,80003970 <dump_pagetable+0xd8>
    80003960:	0014041b          	addw	s0,s0,1
    80003964:	02000513          	li	a0,32
    80003968:	e1cff0ef          	jal	80002f84 <uart_putc>
    8000396c:	fe89dae3          	bge	s3,s0,80003960 <dump_pagetable+0xc8>
    80003970:	00007517          	auipc	a0,0x7
    80003974:	28850513          	add	a0,a0,648 # 8000abf8 <digits+0x38>
    80003978:	e24ff0ef          	jal	80002f9c <uart_puts>
    8000397c:	06300793          	li	a5,99
    80003980:	1697d263          	bge	a5,s1,80003ae4 <dump_pagetable+0x24c>
    80003984:	06400413          	li	s0,100
    80003988:	0284c53b          	divw	a0,s1,s0
    8000398c:	00a00b93          	li	s7,10
    80003990:	0305051b          	addw	a0,a0,48
    80003994:	0ff57513          	zext.b	a0,a0
    80003998:	decff0ef          	jal	80002f84 <uart_putc>
    8000399c:	0284e53b          	remw	a0,s1,s0
    800039a0:	0375453b          	divw	a0,a0,s7
    800039a4:	0305051b          	addw	a0,a0,48
    800039a8:	0ff57513          	zext.b	a0,a0
    800039ac:	dd8ff0ef          	jal	80002f84 <uart_putc>
    800039b0:	0374e53b          	remw	a0,s1,s7
    800039b4:	0305051b          	addw	a0,a0,48
    800039b8:	0ff57513          	zext.b	a0,a0
    800039bc:	dc8ff0ef          	jal	80002f84 <uart_putc>
    800039c0:	00007517          	auipc	a0,0x7
    800039c4:	24050513          	add	a0,a0,576 # 8000ac00 <digits+0x40>
    800039c8:	dd4ff0ef          	jal	80002f9c <uart_puts>
    800039cc:	00093b83          	ld	s7,0(s2)
    800039d0:	00ebf793          	and	a5,s7,14
    800039d4:	06079063          	bnez	a5,80003a34 <dump_pagetable+0x19c>
    800039d8:	00007517          	auipc	a0,0x7
    800039dc:	24050513          	add	a0,a0,576 # 8000ac18 <digits+0x58>
    800039e0:	dbcff0ef          	jal	80002f9c <uart_puts>
    800039e4:	00093503          	ld	a0,0(s2)
    800039e8:	0019859b          	addw	a1,s3,1
    800039ec:	0014849b          	addw	s1,s1,1
    800039f0:	00a55513          	srl	a0,a0,0xa
    800039f4:	00c51513          	sll	a0,a0,0xc
    800039f8:	ea1ff0ef          	jal	80003898 <dump_pagetable>
    800039fc:	20000793          	li	a5,512
    80003a00:	00890913          	add	s2,s2,8
    80003a04:	f4f494e3          	bne	s1,a5,8000394c <dump_pagetable+0xb4>
    80003a08:	04813083          	ld	ra,72(sp)
    80003a0c:	04013403          	ld	s0,64(sp)
    80003a10:	03813483          	ld	s1,56(sp)
    80003a14:	03013903          	ld	s2,48(sp)
    80003a18:	02813983          	ld	s3,40(sp)
    80003a1c:	02013a03          	ld	s4,32(sp)
    80003a20:	01813a83          	ld	s5,24(sp)
    80003a24:	01013b03          	ld	s6,16(sp)
    80003a28:	00813b83          	ld	s7,8(sp)
    80003a2c:	05010113          	add	sp,sp,80
    80003a30:	00008067          	ret
    80003a34:	00007517          	auipc	a0,0x7
    80003a38:	1d450513          	add	a0,a0,468 # 8000ac08 <digits+0x48>
    80003a3c:	d60ff0ef          	jal	80002f9c <uart_puts>
    80003a40:	00abdb93          	srl	s7,s7,0xa
    80003a44:	016bfbb3          	and	s7,s7,s6
    80003a48:	00000713          	li	a4,0
    80003a4c:	03c00413          	li	s0,60
    80003a50:	008bd7b3          	srl	a5,s7,s0
    80003a54:	00f7f793          	and	a5,a5,15
    80003a58:	00e7e733          	or	a4,a5,a4
    80003a5c:	00071e63          	bnez	a4,80003a78 <dump_pagetable+0x1e0>
    80003a60:	02040c63          	beqz	s0,80003a98 <dump_pagetable+0x200>
    80003a64:	ffc4041b          	addw	s0,s0,-4
    80003a68:	008bd7b3          	srl	a5,s7,s0
    80003a6c:	00f7f793          	and	a5,a5,15
    80003a70:	00e7e733          	or	a4,a5,a4
    80003a74:	fe0706e3          	beqz	a4,80003a60 <dump_pagetable+0x1c8>
    80003a78:	ffc4041b          	addw	s0,s0,-4
    80003a7c:	03778513          	add	a0,a5,55
    80003a80:	0ff7f713          	zext.b	a4,a5
    80003a84:	04fa5c63          	bge	s4,a5,80003adc <dump_pagetable+0x244>
    80003a88:	cfcff0ef          	jal	80002f84 <uart_putc>
    80003a8c:	01540a63          	beq	s0,s5,80003aa0 <dump_pagetable+0x208>
    80003a90:	00100713          	li	a4,1
    80003a94:	fbdff06f          	j	80003a50 <dump_pagetable+0x1b8>
    80003a98:	03000513          	li	a0,48
    80003a9c:	ce8ff0ef          	jal	80002f84 <uart_putc>
    80003aa0:	00007517          	auipc	a0,0x7
    80003aa4:	17050513          	add	a0,a0,368 # 8000ac10 <digits+0x50>
    80003aa8:	cf4ff0ef          	jal	80002f9c <uart_puts>
    80003aac:	00093783          	ld	a5,0(s2)
    80003ab0:	0027f713          	and	a4,a5,2
    80003ab4:	08071463          	bnez	a4,80003b3c <dump_pagetable+0x2a4>
    80003ab8:	0047f713          	and	a4,a5,4
    80003abc:	06071863          	bnez	a4,80003b2c <dump_pagetable+0x294>
    80003ac0:	0087f713          	and	a4,a5,8
    80003ac4:	04071c63          	bnez	a4,80003b1c <dump_pagetable+0x284>
    80003ac8:	0107f793          	and	a5,a5,16
    80003acc:	04079263          	bnez	a5,80003b10 <dump_pagetable+0x278>
    80003ad0:	00a00513          	li	a0,10
    80003ad4:	cb0ff0ef          	jal	80002f84 <uart_putc>
    80003ad8:	e65ff06f          	j	8000393c <dump_pagetable+0xa4>
    80003adc:	03070513          	add	a0,a4,48
    80003ae0:	fa9ff06f          	j	80003a88 <dump_pagetable+0x1f0>
    80003ae4:	089a5263          	bge	s4,s1,80003b68 <dump_pagetable+0x2d0>
    80003ae8:	00a00413          	li	s0,10
    80003aec:	0284c53b          	divw	a0,s1,s0
    80003af0:	0305051b          	addw	a0,a0,48
    80003af4:	0ff57513          	zext.b	a0,a0
    80003af8:	c8cff0ef          	jal	80002f84 <uart_putc>
    80003afc:	0284e53b          	remw	a0,s1,s0
    80003b00:	0305051b          	addw	a0,a0,48
    80003b04:	0ff57513          	zext.b	a0,a0
    80003b08:	c7cff0ef          	jal	80002f84 <uart_putc>
    80003b0c:	eb5ff06f          	j	800039c0 <dump_pagetable+0x128>
    80003b10:	05500513          	li	a0,85
    80003b14:	c70ff0ef          	jal	80002f84 <uart_putc>
    80003b18:	fb9ff06f          	j	80003ad0 <dump_pagetable+0x238>
    80003b1c:	05800513          	li	a0,88
    80003b20:	c64ff0ef          	jal	80002f84 <uart_putc>
    80003b24:	00093783          	ld	a5,0(s2)
    80003b28:	fa1ff06f          	j	80003ac8 <dump_pagetable+0x230>
    80003b2c:	05700513          	li	a0,87
    80003b30:	c54ff0ef          	jal	80002f84 <uart_putc>
    80003b34:	00093783          	ld	a5,0(s2)
    80003b38:	f89ff06f          	j	80003ac0 <dump_pagetable+0x228>
    80003b3c:	05200513          	li	a0,82
    80003b40:	c44ff0ef          	jal	80002f84 <uart_putc>
    80003b44:	00093783          	ld	a5,0(s2)
    80003b48:	f71ff06f          	j	80003ab8 <dump_pagetable+0x220>
    80003b4c:	00007517          	auipc	a0,0x7
    80003b50:	08c50513          	add	a0,a0,140 # 8000abd8 <digits+0x18>
    80003b54:	c48ff0ef          	jal	80002f9c <uart_puts>
    80003b58:	0309851b          	addw	a0,s3,48
    80003b5c:	0ff57513          	zext.b	a0,a0
    80003b60:	c24ff0ef          	jal	80002f84 <uart_putc>
    80003b64:	db5ff06f          	j	80003918 <dump_pagetable+0x80>
    80003b68:	0304851b          	addw	a0,s1,48
    80003b6c:	0ff57513          	zext.b	a0,a0
    80003b70:	c14ff0ef          	jal	80002f84 <uart_putc>
    80003b74:	e4dff06f          	j	800039c0 <dump_pagetable+0x128>

0000000080003b78 <init_page_replacement>:
    80003b78:	00100713          	li	a4,1
    80003b7c:	02a71713          	sll	a4,a4,0x2a
    80003b80:	0000d797          	auipc	a5,0xd
    80003b84:	48078793          	add	a5,a5,1152 # 80011000 <swap_mgr>
    80003b88:	08e7b023          	sd	a4,128(a5)
    80003b8c:	0000d717          	auipc	a4,0xd
    80003b90:	4e072e23          	sw	zero,1276(a4) # 80011088 <swap_mgr+0x88>
    80003b94:	0000d717          	auipc	a4,0xd
    80003b98:	4ec70713          	add	a4,a4,1260 # 80011080 <swap_mgr+0x80>
    80003b9c:	0007a023          	sw	zero,0(a5)
    80003ba0:	00478793          	add	a5,a5,4
    80003ba4:	fee79ce3          	bne	a5,a4,80003b9c <init_page_replacement+0x24>
    80003ba8:	0040d797          	auipc	a5,0x40d
    80003bac:	4e07b423          	sd	zero,1256(a5) # 80411090 <lru_mgr>
    80003bb0:	0040d797          	auipc	a5,0x40d
    80003bb4:	4e07b423          	sd	zero,1256(a5) # 80411098 <lru_mgr+0x8>
    80003bb8:	00100793          	li	a5,1
    80003bbc:	02879793          	sll	a5,a5,0x28
    80003bc0:	00410717          	auipc	a4,0x410
    80003bc4:	4ef73023          	sd	a5,1248(a4) # 804140a0 <lru_mgr+0x3010>
    80003bc8:	fff00713          	li	a4,-1
    80003bcc:	0040d797          	auipc	a5,0x40d
    80003bd0:	4d478793          	add	a5,a5,1236 # 804110a0 <lru_mgr+0x10>
    80003bd4:	00410697          	auipc	a3,0x410
    80003bd8:	4cc68693          	add	a3,a3,1228 # 804140a0 <lru_mgr+0x3010>
    80003bdc:	02075713          	srl	a4,a4,0x20
    80003be0:	0007b023          	sd	zero,0(a5)
    80003be4:	0007b423          	sd	zero,8(a5)
    80003be8:	00e7b823          	sd	a4,16(a5)
    80003bec:	0007bc23          	sd	zero,24(a5)
    80003bf0:	0207b023          	sd	zero,32(a5)
    80003bf4:	0207b423          	sd	zero,40(a5)
    80003bf8:	03078793          	add	a5,a5,48
    80003bfc:	fed792e3          	bne	a5,a3,80003be0 <init_page_replacement+0x68>
    80003c00:	00008067          	ret

0000000080003c04 <kvminit>:
    80003c04:	fd010113          	add	sp,sp,-48
    80003c08:	02113423          	sd	ra,40(sp)
    80003c0c:	02813023          	sd	s0,32(sp)
    80003c10:	00913c23          	sd	s1,24(sp)
    80003c14:	01213823          	sd	s2,16(sp)
    80003c18:	01313423          	sd	s3,8(sp)
    80003c1c:	01413023          	sd	s4,0(sp)
    80003c20:	f59ff0ef          	jal	80003b78 <init_page_replacement>
    80003c24:	c24ff0ef          	jal	80003048 <alloc_page>
    80003c28:	00001737          	lui	a4,0x1
    80003c2c:	00e50733          	add	a4,a0,a4
    80003c30:	00050413          	mv	s0,a0
    80003c34:	00050793          	mv	a5,a0
    80003c38:	1a050663          	beqz	a0,80003de4 <kvminit+0x1e0>
    80003c3c:	0007b023          	sd	zero,0(a5)
    80003c40:	00878793          	add	a5,a5,8
    80003c44:	fef71ce3          	bne	a4,a5,80003c3c <kvminit+0x38>
    80003c48:	00423917          	auipc	s2,0x423
    80003c4c:	77090913          	add	s2,s2,1904 # 804273b8 <kernel_pagetable>
    80003c50:	00004997          	auipc	s3,0x4
    80003c54:	0e398993          	add	s3,s3,227 # 80007d33 <rodata_start+0xd33>
    80003c58:	fffff7b7          	lui	a5,0xfffff
    80003c5c:	00893023          	sd	s0,0(s2)
    80003c60:	ffffc497          	auipc	s1,0xffffc
    80003c64:	3a048493          	add	s1,s1,928 # 80000000 <_entry>
    80003c68:	00f9f9b3          	and	s3,s3,a5
    80003c6c:	0334f863          	bgeu	s1,s3,80003c9c <kvminit+0x98>
    80003c70:	00001a37          	lui	s4,0x1
    80003c74:	0080006f          	j	80003c7c <kvminit+0x78>
    80003c78:	0334f063          	bgeu	s1,s3,80003c98 <kvminit+0x94>
    80003c7c:	00048613          	mv	a2,s1
    80003c80:	00048593          	mv	a1,s1
    80003c84:	00a00693          	li	a3,10
    80003c88:	00040513          	mv	a0,s0
    80003c8c:	dbcff0ef          	jal	80003248 <map_page>
    80003c90:	014484b3          	add	s1,s1,s4
    80003c94:	fe0502e3          	beqz	a0,80003c78 <kvminit+0x74>
    80003c98:	00093403          	ld	s0,0(s2)
    80003c9c:	00009997          	auipc	s3,0x9
    80003ca0:	d3398993          	add	s3,s3,-717 # 8000c9cf <data_end+0x9cb>
    80003ca4:	fffff7b7          	lui	a5,0xfffff
    80003ca8:	00003497          	auipc	s1,0x3
    80003cac:	35848493          	add	s1,s1,856 # 80007000 <rodata_start>
    80003cb0:	00f9f9b3          	and	s3,s3,a5
    80003cb4:	0334f863          	bgeu	s1,s3,80003ce4 <kvminit+0xe0>
    80003cb8:	00001a37          	lui	s4,0x1
    80003cbc:	0080006f          	j	80003cc4 <kvminit+0xc0>
    80003cc0:	0334f063          	bgeu	s1,s3,80003ce0 <kvminit+0xdc>
    80003cc4:	00048613          	mv	a2,s1
    80003cc8:	00048593          	mv	a1,s1
    80003ccc:	00200693          	li	a3,2
    80003cd0:	00040513          	mv	a0,s0
    80003cd4:	d74ff0ef          	jal	80003248 <map_page>
    80003cd8:	014484b3          	add	s1,s1,s4
    80003cdc:	fe0502e3          	beqz	a0,80003cc0 <kvminit+0xbc>
    80003ce0:	00093403          	ld	s0,0(s2)
    80003ce4:	00009997          	auipc	s3,0x9
    80003ce8:	31f98993          	add	s3,s3,799 # 8000d003 <data_end+0xfff>
    80003cec:	fffff7b7          	lui	a5,0xfffff
    80003cf0:	00008497          	auipc	s1,0x8
    80003cf4:	31048493          	add	s1,s1,784 # 8000c000 <nextpid>
    80003cf8:	00f9f9b3          	and	s3,s3,a5
    80003cfc:	0334f863          	bgeu	s1,s3,80003d2c <kvminit+0x128>
    80003d00:	00001a37          	lui	s4,0x1
    80003d04:	0080006f          	j	80003d0c <kvminit+0x108>
    80003d08:	0334f063          	bgeu	s1,s3,80003d28 <kvminit+0x124>
    80003d0c:	00048613          	mv	a2,s1
    80003d10:	00048593          	mv	a1,s1
    80003d14:	00600693          	li	a3,6
    80003d18:	00040513          	mv	a0,s0
    80003d1c:	d2cff0ef          	jal	80003248 <map_page>
    80003d20:	014484b3          	add	s1,s1,s4
    80003d24:	fe0502e3          	beqz	a0,80003d08 <kvminit+0x104>
    80003d28:	00093403          	ld	s0,0(s2)
    80003d2c:	00424997          	auipc	s3,0x424
    80003d30:	6c398993          	add	s3,s3,1731 # 804283ef <bss_end+0xfff>
    80003d34:	fffff7b7          	lui	a5,0xfffff
    80003d38:	0000c497          	auipc	s1,0xc
    80003d3c:	2c848493          	add	s1,s1,712 # 80010000 <bss_start>
    80003d40:	00f9f9b3          	and	s3,s3,a5
    80003d44:	0334f863          	bgeu	s1,s3,80003d74 <kvminit+0x170>
    80003d48:	00001a37          	lui	s4,0x1
    80003d4c:	0080006f          	j	80003d54 <kvminit+0x150>
    80003d50:	0334f063          	bgeu	s1,s3,80003d70 <kvminit+0x16c>
    80003d54:	00048613          	mv	a2,s1
    80003d58:	00048593          	mv	a1,s1
    80003d5c:	00600693          	li	a3,6
    80003d60:	00040513          	mv	a0,s0
    80003d64:	ce4ff0ef          	jal	80003248 <map_page>
    80003d68:	014484b3          	add	s1,s1,s4
    80003d6c:	fe0502e3          	beqz	a0,80003d50 <kvminit+0x14c>
    80003d70:	00093403          	ld	s0,0(s2)
    80003d74:	01100993          	li	s3,17
    80003d78:	00423497          	auipc	s1,0x423
    80003d7c:	67848493          	add	s1,s1,1656 # 804273f0 <bss_end>
    80003d80:	01b99993          	sll	s3,s3,0x1b
    80003d84:	0334f863          	bgeu	s1,s3,80003db4 <kvminit+0x1b0>
    80003d88:	00001a37          	lui	s4,0x1
    80003d8c:	0080006f          	j	80003d94 <kvminit+0x190>
    80003d90:	0334f063          	bgeu	s1,s3,80003db0 <kvminit+0x1ac>
    80003d94:	00048613          	mv	a2,s1
    80003d98:	00048593          	mv	a1,s1
    80003d9c:	00600693          	li	a3,6
    80003da0:	00040513          	mv	a0,s0
    80003da4:	ca4ff0ef          	jal	80003248 <map_page>
    80003da8:	014484b3          	add	s1,s1,s4
    80003dac:	fe0502e3          	beqz	a0,80003d90 <kvminit+0x18c>
    80003db0:	00093403          	ld	s0,0(s2)
    80003db4:	00040513          	mv	a0,s0
    80003db8:	02013403          	ld	s0,32(sp)
    80003dbc:	02813083          	ld	ra,40(sp)
    80003dc0:	01813483          	ld	s1,24(sp)
    80003dc4:	01013903          	ld	s2,16(sp)
    80003dc8:	00813983          	ld	s3,8(sp)
    80003dcc:	00013a03          	ld	s4,0(sp)
    80003dd0:	00600693          	li	a3,6
    80003dd4:	10000637          	lui	a2,0x10000
    80003dd8:	100005b7          	lui	a1,0x10000
    80003ddc:	03010113          	add	sp,sp,48
    80003de0:	c68ff06f          	j	80003248 <map_page>
    80003de4:	02813083          	ld	ra,40(sp)
    80003de8:	02013403          	ld	s0,32(sp)
    80003dec:	00423797          	auipc	a5,0x423
    80003df0:	5c07b623          	sd	zero,1484(a5) # 804273b8 <kernel_pagetable>
    80003df4:	01813483          	ld	s1,24(sp)
    80003df8:	01013903          	ld	s2,16(sp)
    80003dfc:	00813983          	ld	s3,8(sp)
    80003e00:	00013a03          	ld	s4,0(sp)
    80003e04:	03010113          	add	sp,sp,48
    80003e08:	00008067          	ret

0000000080003e0c <alloc_swap_slot>:
    80003e0c:	0000d617          	auipc	a2,0xd
    80003e10:	1f460613          	add	a2,a2,500 # 80011000 <swap_mgr>
    80003e14:	08862803          	lw	a6,136(a2)
    80003e18:	08462883          	lw	a7,132(a2)
    80003e1c:	fff00513          	li	a0,-1
    80003e20:	0d187663          	bgeu	a6,a7,80003eec <alloc_swap_slot+0xe0>
    80003e24:	08062303          	lw	t1,128(a2)
    80003e28:	07137863          	bgeu	t1,a7,80003e98 <alloc_swap_slot+0x8c>
    80003e2c:	0053579b          	srlw	a5,t1,0x5
    80003e30:	00279793          	sll	a5,a5,0x2
    80003e34:	00f607b3          	add	a5,a2,a5
    80003e38:	0007a683          	lw	a3,0(a5)
    80003e3c:	00100593          	li	a1,1
    80003e40:	006595bb          	sllw	a1,a1,t1
    80003e44:	00b6f7b3          	and	a5,a3,a1
    80003e48:	0007879b          	sext.w	a5,a5
    80003e4c:	0053571b          	srlw	a4,t1,0x5
    80003e50:	00030513          	mv	a0,t1
    80003e54:	08078e63          	beqz	a5,80003ef0 <alloc_swap_slot+0xe4>
    80003e58:	00100e13          	li	t3,1
    80003e5c:	01c0006f          	j	80003e78 <alloc_swap_slot+0x6c>
    80003e60:	0006a683          	lw	a3,0(a3)
    80003e64:	0007859b          	sext.w	a1,a5
    80003e68:	0057571b          	srlw	a4,a4,0x5
    80003e6c:	00f6f7b3          	and	a5,a3,a5
    80003e70:	0007879b          	sext.w	a5,a5
    80003e74:	06078e63          	beqz	a5,80003ef0 <alloc_swap_slot+0xe4>
    80003e78:	0015071b          	addw	a4,a0,1
    80003e7c:	0057579b          	srlw	a5,a4,0x5
    80003e80:	00279793          	sll	a5,a5,0x2
    80003e84:	0007051b          	sext.w	a0,a4
    80003e88:	00f606b3          	add	a3,a2,a5
    80003e8c:	00ee17bb          	sllw	a5,t3,a4
    80003e90:	fca898e3          	bne	a7,a0,80003e60 <alloc_swap_slot+0x54>
    80003e94:	04030a63          	beqz	t1,80003ee8 <alloc_swap_slot+0xdc>
    80003e98:	00062683          	lw	a3,0(a2)
    80003e9c:	0016f513          	and	a0,a3,1
    80003ea0:	0a050063          	beqz	a0,80003f40 <alloc_swap_slot+0x134>
    80003ea4:	00000513          	li	a0,0
    80003ea8:	00100e13          	li	t3,1
    80003eac:	01c0006f          	j	80003ec8 <alloc_swap_slot+0xbc>
    80003eb0:	0006a683          	lw	a3,0(a3)
    80003eb4:	00078e9b          	sext.w	t4,a5
    80003eb8:	0057571b          	srlw	a4,a4,0x5
    80003ebc:	00f6f7b3          	and	a5,a3,a5
    80003ec0:	0007879b          	sext.w	a5,a5
    80003ec4:	04078a63          	beqz	a5,80003f18 <alloc_swap_slot+0x10c>
    80003ec8:	0015071b          	addw	a4,a0,1
    80003ecc:	0057579b          	srlw	a5,a4,0x5
    80003ed0:	00279793          	sll	a5,a5,0x2
    80003ed4:	0005059b          	sext.w	a1,a0
    80003ed8:	0007051b          	sext.w	a0,a4
    80003edc:	00f606b3          	add	a3,a2,a5
    80003ee0:	00ee17bb          	sllw	a5,t3,a4
    80003ee4:	fca316e3          	bne	t1,a0,80003eb0 <alloc_swap_slot+0xa4>
    80003ee8:	fff00513          	li	a0,-1
    80003eec:	00008067          	ret
    80003ef0:	0015079b          	addw	a5,a0,1
    80003ef4:	0317f7bb          	remuw	a5,a5,a7
    80003ef8:	00271713          	sll	a4,a4,0x2
    80003efc:	00e60733          	add	a4,a2,a4
    80003f00:	00b6e6b3          	or	a3,a3,a1
    80003f04:	0018081b          	addw	a6,a6,1
    80003f08:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    80003f0c:	09062423          	sw	a6,136(a2)
    80003f10:	08f62023          	sw	a5,128(a2)
    80003f14:	00008067          	ret
    80003f18:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    80003f1c:	0315f5bb          	remuw	a1,a1,a7
    80003f20:	00271713          	sll	a4,a4,0x2
    80003f24:	00e60733          	add	a4,a2,a4
    80003f28:	01d6e6b3          	or	a3,a3,t4
    80003f2c:	0018081b          	addw	a6,a6,1
    80003f30:	00d72023          	sw	a3,0(a4)
    80003f34:	09062423          	sw	a6,136(a2)
    80003f38:	08b62023          	sw	a1,128(a2)
    80003f3c:	00008067          	ret
    80003f40:	00000713          	li	a4,0
    80003f44:	00100593          	li	a1,1
    80003f48:	00100e93          	li	t4,1
    80003f4c:	fd1ff06f          	j	80003f1c <alloc_swap_slot+0x110>

0000000080003f50 <free_swap_slot>:
    80003f50:	0000d717          	auipc	a4,0xd
    80003f54:	0b070713          	add	a4,a4,176 # 80011000 <swap_mgr>
    80003f58:	08472783          	lw	a5,132(a4)
    80003f5c:	04f57663          	bgeu	a0,a5,80003fa8 <free_swap_slot+0x58>
    80003f60:	0055579b          	srlw	a5,a0,0x5
    80003f64:	00279793          	sll	a5,a5,0x2
    80003f68:	00f707b3          	add	a5,a4,a5
    80003f6c:	0007a583          	lw	a1,0(a5)
    80003f70:	00100693          	li	a3,1
    80003f74:	00a696bb          	sllw	a3,a3,a0
    80003f78:	00d5f633          	and	a2,a1,a3
    80003f7c:	0006061b          	sext.w	a2,a2
    80003f80:	02060463          	beqz	a2,80003fa8 <free_swap_slot+0x58>
    80003f84:	08872603          	lw	a2,136(a4)
    80003f88:	fff6c693          	not	a3,a3
    80003f8c:	08072803          	lw	a6,128(a4)
    80003f90:	00d5f5b3          	and	a1,a1,a3
    80003f94:	fff6069b          	addw	a3,a2,-1
    80003f98:	00b7a023          	sw	a1,0(a5)
    80003f9c:	08d72423          	sw	a3,136(a4)
    80003fa0:	01057463          	bgeu	a0,a6,80003fa8 <free_swap_slot+0x58>
    80003fa4:	08a72023          	sw	a0,128(a4)
    80003fa8:	00008067          	ret

0000000080003fac <find_page_desc>:
    80003fac:	fffff7b7          	lui	a5,0xfffff
    80003fb0:	00f57533          	and	a0,a0,a5
    80003fb4:	00000713          	li	a4,0
    80003fb8:	0040d797          	auipc	a5,0x40d
    80003fbc:	0e878793          	add	a5,a5,232 # 804110a0 <lru_mgr+0x10>
    80003fc0:	10000613          	li	a2,256
    80003fc4:	0100006f          	j	80003fd4 <find_page_desc+0x28>
    80003fc8:	0017071b          	addw	a4,a4,1
    80003fcc:	03078793          	add	a5,a5,48
    80003fd0:	02c70a63          	beq	a4,a2,80004004 <find_page_desc+0x58>
    80003fd4:	0007b683          	ld	a3,0(a5)
    80003fd8:	fea698e3          	bne	a3,a0,80003fc8 <find_page_desc+0x1c>
    80003fdc:	0147a683          	lw	a3,20(a5)
    80003fe0:	0016f693          	and	a3,a3,1
    80003fe4:	fe0682e3          	beqz	a3,80003fc8 <find_page_desc+0x1c>
    80003fe8:	00171513          	sll	a0,a4,0x1
    80003fec:	00e50533          	add	a0,a0,a4
    80003ff0:	0040d797          	auipc	a5,0x40d
    80003ff4:	0b078793          	add	a5,a5,176 # 804110a0 <lru_mgr+0x10>
    80003ff8:	00451513          	sll	a0,a0,0x4
    80003ffc:	00f50533          	add	a0,a0,a5
    80004000:	00008067          	ret
    80004004:	00000513          	li	a0,0
    80004008:	00008067          	ret

000000008000400c <lru_add_page>:
    8000400c:	02050c63          	beqz	a0,80004044 <lru_add_page+0x38>
    80004010:	0040d717          	auipc	a4,0x40d
    80004014:	08070713          	add	a4,a4,128 # 80411090 <lru_mgr>
    80004018:	00073783          	ld	a5,0(a4)
    8000401c:	00053c23          	sd	zero,24(a0)
    80004020:	02f53023          	sd	a5,32(a0)
    80004024:	02078263          	beqz	a5,80004048 <lru_add_page+0x3c>
    80004028:	00a7bc23          	sd	a0,24(a5)
    8000402c:	00410697          	auipc	a3,0x410
    80004030:	06468693          	add	a3,a3,100 # 80414090 <lru_mgr+0x3000>
    80004034:	0106a783          	lw	a5,16(a3)
    80004038:	00a73023          	sd	a0,0(a4)
    8000403c:	0017879b          	addw	a5,a5,1
    80004040:	00f6a823          	sw	a5,16(a3)
    80004044:	00008067          	ret
    80004048:	00a73423          	sd	a0,8(a4)
    8000404c:	fe1ff06f          	j	8000402c <lru_add_page+0x20>

0000000080004050 <lru_remove_page>:
    80004050:	02050c63          	beqz	a0,80004088 <lru_remove_page+0x38>
    80004054:	01853783          	ld	a5,24(a0)
    80004058:	02053703          	ld	a4,32(a0)
    8000405c:	02078863          	beqz	a5,8000408c <lru_remove_page+0x3c>
    80004060:	02e7b023          	sd	a4,32(a5)
    80004064:	02070a63          	beqz	a4,80004098 <lru_remove_page+0x48>
    80004068:	00f73c23          	sd	a5,24(a4)
    8000406c:	00410717          	auipc	a4,0x410
    80004070:	02470713          	add	a4,a4,36 # 80414090 <lru_mgr+0x3000>
    80004074:	01072783          	lw	a5,16(a4)
    80004078:	02053023          	sd	zero,32(a0)
    8000407c:	00053c23          	sd	zero,24(a0)
    80004080:	fff7879b          	addw	a5,a5,-1
    80004084:	00f72823          	sw	a5,16(a4)
    80004088:	00008067          	ret
    8000408c:	0040d697          	auipc	a3,0x40d
    80004090:	00e6b223          	sd	a4,4(a3) # 80411090 <lru_mgr>
    80004094:	fc071ae3          	bnez	a4,80004068 <lru_remove_page+0x18>
    80004098:	0040d717          	auipc	a4,0x40d
    8000409c:	00f73023          	sd	a5,0(a4) # 80411098 <lru_mgr+0x8>
    800040a0:	fcdff06f          	j	8000406c <lru_remove_page+0x1c>

00000000800040a4 <lru_touch_page>:
    800040a4:	fffff7b7          	lui	a5,0xfffff
    800040a8:	00f57533          	and	a0,a0,a5
    800040ac:	00000713          	li	a4,0
    800040b0:	0040d797          	auipc	a5,0x40d
    800040b4:	ff078793          	add	a5,a5,-16 # 804110a0 <lru_mgr+0x10>
    800040b8:	10000613          	li	a2,256
    800040bc:	0100006f          	j	800040cc <lru_touch_page+0x28>
    800040c0:	0017071b          	addw	a4,a4,1
    800040c4:	03078793          	add	a5,a5,48
    800040c8:	0ac70663          	beq	a4,a2,80004174 <lru_touch_page+0xd0>
    800040cc:	0007b683          	ld	a3,0(a5)
    800040d0:	fea698e3          	bne	a3,a0,800040c0 <lru_touch_page+0x1c>
    800040d4:	0147a683          	lw	a3,20(a5)
    800040d8:	0016f693          	and	a3,a3,1
    800040dc:	fe0682e3          	beqz	a3,800040c0 <lru_touch_page+0x1c>
    800040e0:	00171613          	sll	a2,a4,0x1
    800040e4:	00e607b3          	add	a5,a2,a4
    800040e8:	0040d597          	auipc	a1,0x40d
    800040ec:	fa858593          	add	a1,a1,-88 # 80411090 <lru_mgr>
    800040f0:	00479793          	sll	a5,a5,0x4
    800040f4:	00170513          	add	a0,a4,1
    800040f8:	00f58833          	add	a6,a1,a5
    800040fc:	00151693          	sll	a3,a0,0x1
    80004100:	00a686b3          	add	a3,a3,a0
    80004104:	02883803          	ld	a6,40(a6)
    80004108:	00469693          	sll	a3,a3,0x4
    8000410c:	01078793          	add	a5,a5,16
    80004110:	00d586b3          	add	a3,a1,a3
    80004114:	0006b683          	ld	a3,0(a3)
    80004118:	00f587b3          	add	a5,a1,a5
    8000411c:	04080e63          	beqz	a6,80004178 <lru_touch_page+0xd4>
    80004120:	02d83023          	sd	a3,32(a6)
    80004124:	0005b883          	ld	a7,0(a1)
    80004128:	04068c63          	beqz	a3,80004180 <lru_touch_page+0xdc>
    8000412c:	0106bc23          	sd	a6,24(a3)
    80004130:	00151693          	sll	a3,a0,0x1
    80004134:	00e60733          	add	a4,a2,a4
    80004138:	00a686b3          	add	a3,a3,a0
    8000413c:	00469693          	sll	a3,a3,0x4
    80004140:	00471713          	sll	a4,a4,0x4
    80004144:	00e58733          	add	a4,a1,a4
    80004148:	00d586b3          	add	a3,a1,a3
    8000414c:	00410617          	auipc	a2,0x410
    80004150:	f4460613          	add	a2,a2,-188 # 80414090 <lru_mgr+0x3000>
    80004154:	02073423          	sd	zero,40(a4)
    80004158:	0116b023          	sd	a7,0(a3)
    8000415c:	01062703          	lw	a4,16(a2)
    80004160:	02088463          	beqz	a7,80004188 <lru_touch_page+0xe4>
    80004164:	00f8bc23          	sd	a5,24(a7)
    80004168:	00f5b023          	sd	a5,0(a1)
    8000416c:	00e62823          	sw	a4,16(a2)
    80004170:	00008067          	ret
    80004174:	00008067          	ret
    80004178:	00068893          	mv	a7,a3
    8000417c:	fa0698e3          	bnez	a3,8000412c <lru_touch_page+0x88>
    80004180:	0105b423          	sd	a6,8(a1)
    80004184:	fadff06f          	j	80004130 <lru_touch_page+0x8c>
    80004188:	00f5b423          	sd	a5,8(a1)
    8000418c:	00f5b023          	sd	a5,0(a1)
    80004190:	00e62823          	sw	a4,16(a2)
    80004194:	00008067          	ret

0000000080004198 <find_victim_page>:
    80004198:	0040d517          	auipc	a0,0x40d
    8000419c:	f0053503          	ld	a0,-256(a0) # 80411098 <lru_mgr+0x8>
    800041a0:	00008067          	ret

00000000800041a4 <swap_out_page>:
    800041a4:	16050263          	beqz	a0,80004308 <swap_out_page+0x164>
    800041a8:	fd010113          	add	sp,sp,-48
    800041ac:	00913c23          	sd	s1,24(sp)
    800041b0:	01452483          	lw	s1,20(a0)
    800041b4:	02813023          	sd	s0,32(sp)
    800041b8:	01313423          	sd	s3,8(sp)
    800041bc:	02113423          	sd	ra,40(sp)
    800041c0:	01213823          	sd	s2,16(sp)
    800041c4:	0014f793          	and	a5,s1,1
    800041c8:	00050413          	mv	s0,a0
    800041cc:	00048993          	mv	s3,s1
    800041d0:	12078863          	beqz	a5,80004300 <swap_out_page+0x15c>
    800041d4:	c39ff0ef          	jal	80003e0c <alloc_swap_slot>
    800041d8:	0005091b          	sext.w	s2,a0
    800041dc:	fff00793          	li	a5,-1
    800041e0:	12f90063          	beq	s2,a5,80004300 <swap_out_page+0x15c>
    800041e4:	0049f993          	and	s3,s3,4
    800041e8:	04098663          	beqz	s3,80004234 <swap_out_page+0x90>
    800041ec:	00843683          	ld	a3,8(s0)
    800041f0:	00c9171b          	sllw	a4,s2,0xc
    800041f4:	0000d797          	auipc	a5,0xd
    800041f8:	e9c78793          	add	a5,a5,-356 # 80011090 <swap_area>
    800041fc:	02071713          	sll	a4,a4,0x20
    80004200:	02075713          	srl	a4,a4,0x20
    80004204:	40f686b3          	sub	a3,a3,a5
    80004208:	0000e617          	auipc	a2,0xe
    8000420c:	e8860613          	add	a2,a2,-376 # 80012090 <swap_area+0x1000>
    80004210:	00f707b3          	add	a5,a4,a5
    80004214:	00e60633          	add	a2,a2,a4
    80004218:	40e686b3          	sub	a3,a3,a4
    8000421c:	00f68733          	add	a4,a3,a5
    80004220:	00074703          	lbu	a4,0(a4)
    80004224:	00178793          	add	a5,a5,1
    80004228:	fee78fa3          	sb	a4,-1(a5)
    8000422c:	fec798e3          	bne	a5,a2,8000421c <swap_out_page+0x78>
    80004230:	01442483          	lw	s1,20(s0)
    80004234:	00043583          	ld	a1,0(s0)
    80004238:	02843503          	ld	a0,40(s0)
    8000423c:	f11fe0ef          	jal	8000314c <walk_lookup>
    80004240:	00050863          	beqz	a0,80004250 <swap_out_page+0xac>
    80004244:	00053783          	ld	a5,0(a0)
    80004248:	0017f713          	and	a4,a5,1
    8000424c:	08071063          	bnez	a4,800042cc <swap_out_page+0x128>
    80004250:	ffe4f793          	and	a5,s1,-2
    80004254:	0027e793          	or	a5,a5,2
    80004258:	02091913          	sll	s2,s2,0x20
    8000425c:	02079793          	sll	a5,a5,0x20
    80004260:	00843503          	ld	a0,8(s0)
    80004264:	02095913          	srl	s2,s2,0x20
    80004268:	00f96933          	or	s2,s2,a5
    8000426c:	01243823          	sd	s2,16(s0)
    80004270:	df5fe0ef          	jal	80003064 <free_page>
    80004274:	01843783          	ld	a5,24(s0)
    80004278:	00043423          	sd	zero,8(s0)
    8000427c:	02043703          	ld	a4,32(s0)
    80004280:	06078463          	beqz	a5,800042e8 <swap_out_page+0x144>
    80004284:	02e7b023          	sd	a4,32(a5)
    80004288:	06070663          	beqz	a4,800042f4 <swap_out_page+0x150>
    8000428c:	00f73c23          	sd	a5,24(a4)
    80004290:	00410717          	auipc	a4,0x410
    80004294:	e0070713          	add	a4,a4,-512 # 80414090 <lru_mgr+0x3000>
    80004298:	01072783          	lw	a5,16(a4)
    8000429c:	02043023          	sd	zero,32(s0)
    800042a0:	00043c23          	sd	zero,24(s0)
    800042a4:	fff7879b          	addw	a5,a5,-1
    800042a8:	00f72823          	sw	a5,16(a4)
    800042ac:	00000513          	li	a0,0
    800042b0:	02813083          	ld	ra,40(sp)
    800042b4:	02013403          	ld	s0,32(sp)
    800042b8:	01813483          	ld	s1,24(sp)
    800042bc:	01013903          	ld	s2,16(sp)
    800042c0:	00813983          	ld	s3,8(sp)
    800042c4:	03010113          	add	sp,sp,48
    800042c8:	00008067          	ret
    800042cc:	00a9171b          	sllw	a4,s2,0xa
    800042d0:	02071713          	sll	a4,a4,0x20
    800042d4:	ffe7f793          	and	a5,a5,-2
    800042d8:	02075713          	srl	a4,a4,0x20
    800042dc:	00e7e7b3          	or	a5,a5,a4
    800042e0:	00f53023          	sd	a5,0(a0)
    800042e4:	f6dff06f          	j	80004250 <swap_out_page+0xac>
    800042e8:	0040d697          	auipc	a3,0x40d
    800042ec:	dae6b423          	sd	a4,-600(a3) # 80411090 <lru_mgr>
    800042f0:	f8071ee3          	bnez	a4,8000428c <swap_out_page+0xe8>
    800042f4:	0040d717          	auipc	a4,0x40d
    800042f8:	daf73223          	sd	a5,-604(a4) # 80411098 <lru_mgr+0x8>
    800042fc:	f95ff06f          	j	80004290 <swap_out_page+0xec>
    80004300:	fff00513          	li	a0,-1
    80004304:	fadff06f          	j	800042b0 <swap_out_page+0x10c>
    80004308:	fff00513          	li	a0,-1
    8000430c:	00008067          	ret

0000000080004310 <swap_in_page>:
    80004310:	12050263          	beqz	a0,80004434 <swap_in_page+0x124>
    80004314:	01452783          	lw	a5,20(a0)
    80004318:	fe010113          	add	sp,sp,-32
    8000431c:	00813823          	sd	s0,16(sp)
    80004320:	00113c23          	sd	ra,24(sp)
    80004324:	00913423          	sd	s1,8(sp)
    80004328:	0027f793          	and	a5,a5,2
    8000432c:	00050413          	mv	s0,a0
    80004330:	0e078e63          	beqz	a5,8000442c <swap_in_page+0x11c>
    80004334:	01052703          	lw	a4,16(a0)
    80004338:	0000d797          	auipc	a5,0xd
    8000433c:	d5878793          	add	a5,a5,-680 # 80011090 <swap_area>
    80004340:	40f58633          	sub	a2,a1,a5
    80004344:	00c7171b          	sllw	a4,a4,0xc
    80004348:	02071713          	sll	a4,a4,0x20
    8000434c:	02075713          	srl	a4,a4,0x20
    80004350:	0000e817          	auipc	a6,0xe
    80004354:	d4080813          	add	a6,a6,-704 # 80012090 <swap_area+0x1000>
    80004358:	00058493          	mv	s1,a1
    8000435c:	00f707b3          	add	a5,a4,a5
    80004360:	00e80833          	add	a6,a6,a4
    80004364:	40e60633          	sub	a2,a2,a4
    80004368:	0007c683          	lbu	a3,0(a5)
    8000436c:	00f60733          	add	a4,a2,a5
    80004370:	00178793          	add	a5,a5,1
    80004374:	00d70023          	sb	a3,0(a4)
    80004378:	ff0798e3          	bne	a5,a6,80004368 <swap_in_page+0x58>
    8000437c:	00043583          	ld	a1,0(s0)
    80004380:	02843503          	ld	a0,40(s0)
    80004384:	dc9fe0ef          	jal	8000314c <walk_lookup>
    80004388:	02050063          	beqz	a0,800043a8 <swap_in_page+0x98>
    8000438c:	00053703          	ld	a4,0(a0)
    80004390:	00c4d793          	srl	a5,s1,0xc
    80004394:	00a79793          	sll	a5,a5,0xa
    80004398:	01e77713          	and	a4,a4,30
    8000439c:	00e7e7b3          	or	a5,a5,a4
    800043a0:	0017e793          	or	a5,a5,1
    800043a4:	00f53023          	sd	a5,0(a0)
    800043a8:	01442783          	lw	a5,20(s0)
    800043ac:	01042503          	lw	a0,16(s0)
    800043b0:	00943423          	sd	s1,8(s0)
    800043b4:	ffd7f793          	and	a5,a5,-3
    800043b8:	0017e793          	or	a5,a5,1
    800043bc:	00f42a23          	sw	a5,20(s0)
    800043c0:	0000d797          	auipc	a5,0xd
    800043c4:	cc47a783          	lw	a5,-828(a5) # 80011084 <swap_mgr+0x84>
    800043c8:	00f57463          	bgeu	a0,a5,800043d0 <swap_in_page+0xc0>
    800043cc:	df5fe0ef          	jal	800031c0 <free_swap_slot.part.0>
    800043d0:	0040d717          	auipc	a4,0x40d
    800043d4:	cc070713          	add	a4,a4,-832 # 80411090 <lru_mgr>
    800043d8:	00073783          	ld	a5,0(a4)
    800043dc:	fff00693          	li	a3,-1
    800043e0:	00d42823          	sw	a3,16(s0)
    800043e4:	02f43023          	sd	a5,32(s0)
    800043e8:	00043c23          	sd	zero,24(s0)
    800043ec:	02078c63          	beqz	a5,80004424 <swap_in_page+0x114>
    800043f0:	0087bc23          	sd	s0,24(a5)
    800043f4:	00410697          	auipc	a3,0x410
    800043f8:	c9c68693          	add	a3,a3,-868 # 80414090 <lru_mgr+0x3000>
    800043fc:	0106a783          	lw	a5,16(a3)
    80004400:	00873023          	sd	s0,0(a4)
    80004404:	00000513          	li	a0,0
    80004408:	0017879b          	addw	a5,a5,1
    8000440c:	00f6a823          	sw	a5,16(a3)
    80004410:	01813083          	ld	ra,24(sp)
    80004414:	01013403          	ld	s0,16(sp)
    80004418:	00813483          	ld	s1,8(sp)
    8000441c:	02010113          	add	sp,sp,32
    80004420:	00008067          	ret
    80004424:	00873423          	sd	s0,8(a4)
    80004428:	fcdff06f          	j	800043f4 <swap_in_page+0xe4>
    8000442c:	fff00513          	li	a0,-1
    80004430:	fe1ff06f          	j	80004410 <swap_in_page+0x100>
    80004434:	fff00513          	li	a0,-1
    80004438:	00008067          	ret

000000008000443c <handle_page_fault>:
    8000443c:	fd010113          	add	sp,sp,-48
    80004440:	fffff7b7          	lui	a5,0xfffff
    80004444:	02813023          	sd	s0,32(sp)
    80004448:	00f5f433          	and	s0,a1,a5
    8000444c:	00040593          	mv	a1,s0
    80004450:	01213823          	sd	s2,16(sp)
    80004454:	02113423          	sd	ra,40(sp)
    80004458:	00913c23          	sd	s1,24(sp)
    8000445c:	01313423          	sd	s3,8(sp)
    80004460:	00050913          	mv	s2,a0
    80004464:	ce9fe0ef          	jal	8000314c <walk_lookup>
    80004468:	12050c63          	beqz	a0,800045a0 <handle_page_fault+0x164>
    8000446c:	00053483          	ld	s1,0(a0)
    80004470:	0014f793          	and	a5,s1,1
    80004474:	12079663          	bnez	a5,800045a0 <handle_page_fault+0x164>
    80004478:	12048463          	beqz	s1,800045a0 <handle_page_fault+0x164>
    8000447c:	00a4d493          	srl	s1,s1,0xa
    80004480:	bc9fe0ef          	jal	80003048 <alloc_page>
    80004484:	0004849b          	sext.w	s1,s1
    80004488:	00050993          	mv	s3,a0
    8000448c:	0e050a63          	beqz	a0,80004580 <handle_page_fault+0x144>
    80004490:	0040d797          	auipc	a5,0x40d
    80004494:	c1078793          	add	a5,a5,-1008 # 804110a0 <lru_mgr+0x10>
    80004498:	00000713          	li	a4,0
    8000449c:	10000613          	li	a2,256
    800044a0:	0100006f          	j	800044b0 <handle_page_fault+0x74>
    800044a4:	0017071b          	addw	a4,a4,1
    800044a8:	03078793          	add	a5,a5,48
    800044ac:	06c70063          	beq	a4,a2,8000450c <handle_page_fault+0xd0>
    800044b0:	0007b683          	ld	a3,0(a5)
    800044b4:	fe8698e3          	bne	a3,s0,800044a4 <handle_page_fault+0x68>
    800044b8:	0147a683          	lw	a3,20(a5)
    800044bc:	0026f693          	and	a3,a3,2
    800044c0:	fe0682e3          	beqz	a3,800044a4 <handle_page_fault+0x68>
    800044c4:	0107a683          	lw	a3,16(a5)
    800044c8:	fc969ee3          	bne	a3,s1,800044a4 <handle_page_fault+0x68>
    800044cc:	00171513          	sll	a0,a4,0x1
    800044d0:	00e50533          	add	a0,a0,a4
    800044d4:	00451513          	sll	a0,a0,0x4
    800044d8:	0040d797          	auipc	a5,0x40d
    800044dc:	bc878793          	add	a5,a5,-1080 # 804110a0 <lru_mgr+0x10>
    800044e0:	00f50533          	add	a0,a0,a5
    800044e4:	00098593          	mv	a1,s3
    800044e8:	e29ff0ef          	jal	80004310 <swap_in_page>
    800044ec:	0a051e63          	bnez	a0,800045a8 <handle_page_fault+0x16c>
    800044f0:	02813083          	ld	ra,40(sp)
    800044f4:	02013403          	ld	s0,32(sp)
    800044f8:	01813483          	ld	s1,24(sp)
    800044fc:	01013903          	ld	s2,16(sp)
    80004500:	00813983          	ld	s3,8(sp)
    80004504:	03010113          	add	sp,sp,48
    80004508:	00008067          	ret
    8000450c:	0040d717          	auipc	a4,0x40d
    80004510:	ba870713          	add	a4,a4,-1112 # 804110b4 <lru_mgr+0x24>
    80004514:	00000793          	li	a5,0
    80004518:	10000613          	li	a2,256
    8000451c:	00c0006f          	j	80004528 <handle_page_fault+0xec>
    80004520:	0017879b          	addw	a5,a5,1
    80004524:	08c78263          	beq	a5,a2,800045a8 <handle_page_fault+0x16c>
    80004528:	00072683          	lw	a3,0(a4)
    8000452c:	03070713          	add	a4,a4,48
    80004530:	fe0698e3          	bnez	a3,80004520 <handle_page_fault+0xe4>
    80004534:	00178613          	add	a2,a5,1
    80004538:	00179713          	sll	a4,a5,0x1
    8000453c:	00161693          	sll	a3,a2,0x1
    80004540:	00f707b3          	add	a5,a4,a5
    80004544:	00479793          	sll	a5,a5,0x4
    80004548:	00c68733          	add	a4,a3,a2
    8000454c:	0040d617          	auipc	a2,0x40d
    80004550:	b4460613          	add	a2,a2,-1212 # 80411090 <lru_mgr>
    80004554:	00f606b3          	add	a3,a2,a5
    80004558:	00471713          	sll	a4,a4,0x4
    8000455c:	01078793          	add	a5,a5,16
    80004560:	00e60733          	add	a4,a2,a4
    80004564:	00c78533          	add	a0,a5,a2
    80004568:	00200793          	li	a5,2
    8000456c:	0086b823          	sd	s0,16(a3)
    80004570:	01273423          	sd	s2,8(a4)
    80004574:	0296a023          	sw	s1,32(a3)
    80004578:	02f6a223          	sw	a5,36(a3)
    8000457c:	f69ff06f          	j	800044e4 <handle_page_fault+0xa8>
    80004580:	0040d517          	auipc	a0,0x40d
    80004584:	b1853503          	ld	a0,-1256(a0) # 80411098 <lru_mgr+0x8>
    80004588:	00050c63          	beqz	a0,800045a0 <handle_page_fault+0x164>
    8000458c:	c19ff0ef          	jal	800041a4 <swap_out_page>
    80004590:	00051863          	bnez	a0,800045a0 <handle_page_fault+0x164>
    80004594:	ab5fe0ef          	jal	80003048 <alloc_page>
    80004598:	00050993          	mv	s3,a0
    8000459c:	ee051ae3          	bnez	a0,80004490 <handle_page_fault+0x54>
    800045a0:	fff00513          	li	a0,-1
    800045a4:	f4dff06f          	j	800044f0 <handle_page_fault+0xb4>
    800045a8:	00098513          	mv	a0,s3
    800045ac:	ab9fe0ef          	jal	80003064 <free_page>
    800045b0:	fff00513          	li	a0,-1
    800045b4:	f3dff06f          	j	800044f0 <handle_page_fault+0xb4>

00000000800045b8 <va2pa_with_replacement>:
    800045b8:	fe010113          	add	sp,sp,-32
    800045bc:	00913423          	sd	s1,8(sp)
    800045c0:	01213023          	sd	s2,0(sp)
    800045c4:	00113c23          	sd	ra,24(sp)
    800045c8:	00813823          	sd	s0,16(sp)
    800045cc:	00050493          	mv	s1,a0
    800045d0:	00058913          	mv	s2,a1
    800045d4:	b79fe0ef          	jal	8000314c <walk_lookup>
    800045d8:	00050a63          	beqz	a0,800045ec <va2pa_with_replacement+0x34>
    800045dc:	00053403          	ld	s0,0(a0)
    800045e0:	00147793          	and	a5,s0,1
    800045e4:	06079663          	bnez	a5,80004650 <va2pa_with_replacement+0x98>
    800045e8:	02041063          	bnez	s0,80004608 <va2pa_with_replacement+0x50>
    800045ec:	00000513          	li	a0,0
    800045f0:	01813083          	ld	ra,24(sp)
    800045f4:	01013403          	ld	s0,16(sp)
    800045f8:	00813483          	ld	s1,8(sp)
    800045fc:	00013903          	ld	s2,0(sp)
    80004600:	02010113          	add	sp,sp,32
    80004604:	00008067          	ret
    80004608:	00600613          	li	a2,6
    8000460c:	00090593          	mv	a1,s2
    80004610:	00048513          	mv	a0,s1
    80004614:	e29ff0ef          	jal	8000443c <handle_page_fault>
    80004618:	fc051ae3          	bnez	a0,800045ec <va2pa_with_replacement+0x34>
    8000461c:	00090593          	mv	a1,s2
    80004620:	00048513          	mv	a0,s1
    80004624:	b29fe0ef          	jal	8000314c <walk_lookup>
    80004628:	fc0502e3          	beqz	a0,800045ec <va2pa_with_replacement+0x34>
    8000462c:	00053783          	ld	a5,0(a0)
    80004630:	0017f713          	and	a4,a5,1
    80004634:	fa070ce3          	beqz	a4,800045ec <va2pa_with_replacement+0x34>
    80004638:	00a7d793          	srl	a5,a5,0xa
    8000463c:	03491593          	sll	a1,s2,0x34
    80004640:	00c79513          	sll	a0,a5,0xc
    80004644:	0345d593          	srl	a1,a1,0x34
    80004648:	00b50533          	add	a0,a0,a1
    8000464c:	fa5ff06f          	j	800045f0 <va2pa_with_replacement+0x38>
    80004650:	00090513          	mv	a0,s2
    80004654:	a51ff0ef          	jal	800040a4 <lru_touch_page>
    80004658:	01813083          	ld	ra,24(sp)
    8000465c:	00a45513          	srl	a0,s0,0xa
    80004660:	01013403          	ld	s0,16(sp)
    80004664:	03491593          	sll	a1,s2,0x34
    80004668:	00c51513          	sll	a0,a0,0xc
    8000466c:	0345d593          	srl	a1,a1,0x34
    80004670:	00813483          	ld	s1,8(sp)
    80004674:	00013903          	ld	s2,0(sp)
    80004678:	00b50533          	add	a0,a0,a1
    8000467c:	02010113          	add	sp,sp,32
    80004680:	00008067          	ret

0000000080004684 <safe_copyout>:
    80004684:	14068063          	beqz	a3,800047c4 <safe_copyout+0x140>
    80004688:	fb010113          	add	sp,sp,-80
    8000468c:	02913c23          	sd	s1,56(sp)
    80004690:	03213823          	sd	s2,48(sp)
    80004694:	03313423          	sd	s3,40(sp)
    80004698:	03413023          	sd	s4,32(sp)
    8000469c:	01513c23          	sd	s5,24(sp)
    800046a0:	01613823          	sd	s6,16(sp)
    800046a4:	01713423          	sd	s7,8(sp)
    800046a8:	01813023          	sd	s8,0(sp)
    800046ac:	04113423          	sd	ra,72(sp)
    800046b0:	04813023          	sd	s0,64(sp)
    800046b4:	00068b13          	mv	s6,a3
    800046b8:	00050993          	mv	s3,a0
    800046bc:	00058c13          	mv	s8,a1
    800046c0:	00060b93          	mv	s7,a2
    800046c4:	fffffa37          	lui	s4,0xfffff
    800046c8:	00001937          	lui	s2,0x1
    800046cc:	10000493          	li	s1,256
    800046d0:	0040da97          	auipc	s5,0x40d
    800046d4:	9c0a8a93          	add	s5,s5,-1600 # 80411090 <lru_mgr>
    800046d8:	014c7433          	and	s0,s8,s4
    800046dc:	00040593          	mv	a1,s0
    800046e0:	00098513          	mv	a0,s3
    800046e4:	ed5ff0ef          	jal	800045b8 <va2pa_with_replacement>
    800046e8:	0c050a63          	beqz	a0,800047bc <safe_copyout+0x138>
    800046ec:	41840833          	sub	a6,s0,s8
    800046f0:	01280833          	add	a6,a6,s2
    800046f4:	010b7463          	bgeu	s6,a6,800046fc <safe_copyout+0x78>
    800046f8:	000b0813          	mv	a6,s6
    800046fc:	01850733          	add	a4,a0,s8
    80004700:	40870733          	sub	a4,a4,s0
    80004704:	01780533          	add	a0,a6,s7
    80004708:	000b8793          	mv	a5,s7
    8000470c:	41770733          	sub	a4,a4,s7
    80004710:	0a080263          	beqz	a6,800047b4 <safe_copyout+0x130>
    80004714:	0007c583          	lbu	a1,0(a5)
    80004718:	00f70633          	add	a2,a4,a5
    8000471c:	00178793          	add	a5,a5,1
    80004720:	00b60023          	sb	a1,0(a2)
    80004724:	fef518e3          	bne	a0,a5,80004714 <safe_copyout+0x90>
    80004728:	0040d797          	auipc	a5,0x40d
    8000472c:	97878793          	add	a5,a5,-1672 # 804110a0 <lru_mgr+0x10>
    80004730:	00000713          	li	a4,0
    80004734:	0100006f          	j	80004744 <safe_copyout+0xc0>
    80004738:	0017071b          	addw	a4,a4,1
    8000473c:	03078793          	add	a5,a5,48
    80004740:	02970863          	beq	a4,s1,80004770 <safe_copyout+0xec>
    80004744:	0007b603          	ld	a2,0(a5)
    80004748:	fec418e3          	bne	s0,a2,80004738 <safe_copyout+0xb4>
    8000474c:	0147a603          	lw	a2,20(a5)
    80004750:	00167593          	and	a1,a2,1
    80004754:	fe0582e3          	beqz	a1,80004738 <safe_copyout+0xb4>
    80004758:	00171793          	sll	a5,a4,0x1
    8000475c:	00e787b3          	add	a5,a5,a4
    80004760:	00479793          	sll	a5,a5,0x4
    80004764:	00fa87b3          	add	a5,s5,a5
    80004768:	00466613          	or	a2,a2,4
    8000476c:	02c7a223          	sw	a2,36(a5)
    80004770:	410b0b33          	sub	s6,s6,a6
    80004774:	00050b93          	mv	s7,a0
    80004778:	01240c33          	add	s8,s0,s2
    8000477c:	f40b1ee3          	bnez	s6,800046d8 <safe_copyout+0x54>
    80004780:	00000513          	li	a0,0
    80004784:	04813083          	ld	ra,72(sp)
    80004788:	04013403          	ld	s0,64(sp)
    8000478c:	03813483          	ld	s1,56(sp)
    80004790:	03013903          	ld	s2,48(sp)
    80004794:	02813983          	ld	s3,40(sp)
    80004798:	02013a03          	ld	s4,32(sp)
    8000479c:	01813a83          	ld	s5,24(sp)
    800047a0:	01013b03          	ld	s6,16(sp)
    800047a4:	00813b83          	ld	s7,8(sp)
    800047a8:	00013c03          	ld	s8,0(sp)
    800047ac:	05010113          	add	sp,sp,80
    800047b0:	00008067          	ret
    800047b4:	000b8513          	mv	a0,s7
    800047b8:	f71ff06f          	j	80004728 <safe_copyout+0xa4>
    800047bc:	fff00513          	li	a0,-1
    800047c0:	fc5ff06f          	j	80004784 <safe_copyout+0x100>
    800047c4:	00000513          	li	a0,0
    800047c8:	00008067          	ret

00000000800047cc <safe_copyin>:
    800047cc:	0e068863          	beqz	a3,800048bc <safe_copyin+0xf0>
    800047d0:	fc010113          	add	sp,sp,-64
    800047d4:	02813823          	sd	s0,48(sp)
    800047d8:	02913423          	sd	s1,40(sp)
    800047dc:	03213023          	sd	s2,32(sp)
    800047e0:	01313c23          	sd	s3,24(sp)
    800047e4:	01513423          	sd	s5,8(sp)
    800047e8:	01613023          	sd	s6,0(sp)
    800047ec:	02113c23          	sd	ra,56(sp)
    800047f0:	01413823          	sd	s4,16(sp)
    800047f4:	00068b13          	mv	s6,a3
    800047f8:	00050493          	mv	s1,a0
    800047fc:	00058993          	mv	s3,a1
    80004800:	00060a93          	mv	s5,a2
    80004804:	fffff937          	lui	s2,0xfffff
    80004808:	00001437          	lui	s0,0x1
    8000480c:	012afa33          	and	s4,s5,s2
    80004810:	000a0593          	mv	a1,s4
    80004814:	00048513          	mv	a0,s1
    80004818:	da1ff0ef          	jal	800045b8 <va2pa_with_replacement>
    8000481c:	08050c63          	beqz	a0,800048b4 <safe_copyin+0xe8>
    80004820:	415a08b3          	sub	a7,s4,s5
    80004824:	008888b3          	add	a7,a7,s0
    80004828:	011b7463          	bgeu	s6,a7,80004830 <safe_copyin+0x64>
    8000482c:	000b0893          	mv	a7,s6
    80004830:	01550533          	add	a0,a0,s5
    80004834:	41450533          	sub	a0,a0,s4
    80004838:	06088063          	beqz	a7,80004898 <safe_copyin+0xcc>
    8000483c:	00098793          	mv	a5,s3
    80004840:	01198833          	add	a6,s3,a7
    80004844:	41350733          	sub	a4,a0,s3
    80004848:	00f70633          	add	a2,a4,a5
    8000484c:	00064603          	lbu	a2,0(a2)
    80004850:	00178793          	add	a5,a5,1
    80004854:	fec78fa3          	sb	a2,-1(a5)
    80004858:	fef818e3          	bne	a6,a5,80004848 <safe_copyin+0x7c>
    8000485c:	411b0b33          	sub	s6,s6,a7
    80004860:	00080993          	mv	s3,a6
    80004864:	008a0ab3          	add	s5,s4,s0
    80004868:	fa0b12e3          	bnez	s6,8000480c <safe_copyin+0x40>
    8000486c:	00000513          	li	a0,0
    80004870:	03813083          	ld	ra,56(sp)
    80004874:	03013403          	ld	s0,48(sp)
    80004878:	02813483          	ld	s1,40(sp)
    8000487c:	02013903          	ld	s2,32(sp)
    80004880:	01813983          	ld	s3,24(sp)
    80004884:	01013a03          	ld	s4,16(sp)
    80004888:	00813a83          	ld	s5,8(sp)
    8000488c:	00013b03          	ld	s6,0(sp)
    80004890:	04010113          	add	sp,sp,64
    80004894:	00008067          	ret
    80004898:	00001ab7          	lui	s5,0x1
    8000489c:	015a0ab3          	add	s5,s4,s5
    800048a0:	012afa33          	and	s4,s5,s2
    800048a4:	000a0593          	mv	a1,s4
    800048a8:	00048513          	mv	a0,s1
    800048ac:	d0dff0ef          	jal	800045b8 <va2pa_with_replacement>
    800048b0:	f60518e3          	bnez	a0,80004820 <safe_copyin+0x54>
    800048b4:	fff00513          	li	a0,-1
    800048b8:	fb9ff06f          	j	80004870 <safe_copyin+0xa4>
    800048bc:	00000513          	li	a0,0
    800048c0:	00008067          	ret

00000000800048c4 <test_page_replacement>:
    800048c4:	f4010113          	add	sp,sp,-192
    800048c8:	00006517          	auipc	a0,0x6
    800048cc:	36050513          	add	a0,a0,864 # 8000ac28 <digits+0x68>
    800048d0:	0a113c23          	sd	ra,184(sp)
    800048d4:	0a813823          	sd	s0,176(sp)
    800048d8:	0a913423          	sd	s1,168(sp)
    800048dc:	0b213023          	sd	s2,160(sp)
    800048e0:	09313c23          	sd	s3,152(sp)
    800048e4:	eb8fe0ef          	jal	80002f9c <uart_puts>
    800048e8:	00006517          	auipc	a0,0x6
    800048ec:	36850513          	add	a0,a0,872 # 8000ac50 <digits+0x90>
    800048f0:	eacfe0ef          	jal	80002f9c <uart_puts>
    800048f4:	d18ff0ef          	jal	80003e0c <alloc_swap_slot>
    800048f8:	0005049b          	sext.w	s1,a0
    800048fc:	d10ff0ef          	jal	80003e0c <alloc_swap_slot>
    80004900:	0005041b          	sext.w	s0,a0
    80004904:	d08ff0ef          	jal	80003e0c <alloc_swap_slot>
    80004908:	fff00793          	li	a5,-1
    8000490c:	02f48663          	beq	s1,a5,80004938 <test_page_replacement+0x74>
    80004910:	1cf40c63          	beq	s0,a5,80004ae8 <test_page_replacement+0x224>
    80004914:	0005051b          	sext.w	a0,a0
    80004918:	02f50063          	beq	a0,a5,80004938 <test_page_replacement+0x74>
    8000491c:	00848e63          	beq	s1,s0,80004938 <test_page_replacement+0x74>
    80004920:	00a40c63          	beq	s0,a0,80004938 <test_page_replacement+0x74>
    80004924:	00a48a63          	beq	s1,a0,80004938 <test_page_replacement+0x74>
    80004928:	00006517          	auipc	a0,0x6
    8000492c:	35050513          	add	a0,a0,848 # 8000ac78 <digits+0xb8>
    80004930:	e6cfe0ef          	jal	80002f9c <uart_puts>
    80004934:	0100006f          	j	80004944 <test_page_replacement+0x80>
    80004938:	00006517          	auipc	a0,0x6
    8000493c:	36050513          	add	a0,a0,864 # 8000ac98 <digits+0xd8>
    80004940:	e5cfe0ef          	jal	80002f9c <uart_puts>
    80004944:	0000c797          	auipc	a5,0xc
    80004948:	7407a783          	lw	a5,1856(a5) # 80011084 <swap_mgr+0x84>
    8000494c:	00f47663          	bgeu	s0,a5,80004958 <test_page_replacement+0x94>
    80004950:	00040513          	mv	a0,s0
    80004954:	86dfe0ef          	jal	800031c0 <free_swap_slot.part.0>
    80004958:	cb4ff0ef          	jal	80003e0c <alloc_swap_slot>
    8000495c:	0005051b          	sext.w	a0,a0
    80004960:	14a40c63          	beq	s0,a0,80004ab8 <test_page_replacement+0x1f4>
    80004964:	00006517          	auipc	a0,0x6
    80004968:	37c50513          	add	a0,a0,892 # 8000ace0 <digits+0x120>
    8000496c:	e30fe0ef          	jal	80002f9c <uart_puts>
    80004970:	00006517          	auipc	a0,0x6
    80004974:	39850513          	add	a0,a0,920 # 8000ad08 <digits+0x148>
    80004978:	e24fe0ef          	jal	80002f9c <uart_puts>
    8000497c:	00080737          	lui	a4,0x80
    80004980:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    80004984:	00010637          	lui	a2,0x10
    80004988:	00c71713          	sll	a4,a4,0xc
    8000498c:	fff00793          	li	a5,-1
    80004990:	01f7d793          	srl	a5,a5,0x1f
    80004994:	00c13023          	sd	a2,0(sp)
    80004998:	02e13c23          	sd	a4,56(sp)
    8000499c:	00100613          	li	a2,1
    800049a0:	00012737          	lui	a4,0x12
    800049a4:	01f61613          	sll	a2,a2,0x1f
    800049a8:	00f13823          	sd	a5,16(sp)
    800049ac:	04f13023          	sd	a5,64(sp)
    800049b0:	06e13023          	sd	a4,96(sp)
    800049b4:	06f13823          	sd	a5,112(sp)
    800049b8:	40001737          	lui	a4,0x40001
    800049bc:	03010793          	add	a5,sp,48
    800049c0:	00423697          	auipc	a3,0x423
    800049c4:	9f86b683          	ld	a3,-1544(a3) # 804273b8 <kernel_pagetable>
    800049c8:	00171713          	sll	a4,a4,0x1
    800049cc:	0040c417          	auipc	s0,0x40c
    800049d0:	6c440413          	add	s0,s0,1732 # 80411090 <lru_mgr>
    800049d4:	00010493          	mv	s1,sp
    800049d8:	06010993          	add	s3,sp,96
    800049dc:	00c13423          	sd	a2,8(sp)
    800049e0:	00f13c23          	sd	a5,24(sp)
    800049e4:	00011637          	lui	a2,0x11
    800049e8:	08f13023          	sd	a5,128(sp)
    800049ec:	0040f917          	auipc	s2,0x40f
    800049f0:	6a490913          	add	s2,s2,1700 # 80414090 <lru_mgr+0x3000>
    800049f4:	00300793          	li	a5,3
    800049f8:	00006517          	auipc	a0,0x6
    800049fc:	33050513          	add	a0,a0,816 # 8000ad28 <digits+0x168>
    80004a00:	06e13423          	sd	a4,104(sp)
    80004a04:	00f92823          	sw	a5,16(s2)
    80004a08:	02013023          	sd	zero,32(sp)
    80004a0c:	02d13423          	sd	a3,40(sp)
    80004a10:	02c13823          	sd	a2,48(sp)
    80004a14:	04d13c23          	sd	a3,88(sp)
    80004a18:	06013c23          	sd	zero,120(sp)
    80004a1c:	08d13423          	sd	a3,136(sp)
    80004a20:	00943423          	sd	s1,8(s0)
    80004a24:	04913823          	sd	s1,80(sp)
    80004a28:	05313423          	sd	s3,72(sp)
    80004a2c:	01343023          	sd	s3,0(s0)
    80004a30:	d6cfe0ef          	jal	80002f9c <uart_puts>
    80004a34:	04813783          	ld	a5,72(sp)
    80004a38:	05013703          	ld	a4,80(sp)
    80004a3c:	08078a63          	beqz	a5,80004ad0 <test_page_replacement+0x20c>
    80004a40:	02e7b023          	sd	a4,32(a5)
    80004a44:	08070263          	beqz	a4,80004ac8 <test_page_replacement+0x204>
    80004a48:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    80004a4c:	01092783          	lw	a5,16(s2)
    80004a50:	04013823          	sd	zero,80(sp)
    80004a54:	04013423          	sd	zero,72(sp)
    80004a58:	fff7871b          	addw	a4,a5,-1
    80004a5c:	00e92823          	sw	a4,16(s2)
    80004a60:	00200793          	li	a5,2
    80004a64:	00f71663          	bne	a4,a5,80004a70 <test_page_replacement+0x1ac>
    80004a68:	00043783          	ld	a5,0(s0)
    80004a6c:	09378663          	beq	a5,s3,80004af8 <test_page_replacement+0x234>
    80004a70:	00006517          	auipc	a0,0x6
    80004a74:	2f850513          	add	a0,a0,760 # 8000ad68 <digits+0x1a8>
    80004a78:	d24fe0ef          	jal	80002f9c <uart_puts>
    80004a7c:	00843783          	ld	a5,8(s0)
    80004a80:	04978c63          	beq	a5,s1,80004ad8 <test_page_replacement+0x214>
    80004a84:	00006517          	auipc	a0,0x6
    80004a88:	32450513          	add	a0,a0,804 # 8000ada8 <digits+0x1e8>
    80004a8c:	d10fe0ef          	jal	80002f9c <uart_puts>
    80004a90:	00006517          	auipc	a0,0x6
    80004a94:	33850513          	add	a0,a0,824 # 8000adc8 <digits+0x208>
    80004a98:	d04fe0ef          	jal	80002f9c <uart_puts>
    80004a9c:	0b813083          	ld	ra,184(sp)
    80004aa0:	0b013403          	ld	s0,176(sp)
    80004aa4:	0a813483          	ld	s1,168(sp)
    80004aa8:	0a013903          	ld	s2,160(sp)
    80004aac:	09813983          	ld	s3,152(sp)
    80004ab0:	0c010113          	add	sp,sp,192
    80004ab4:	00008067          	ret
    80004ab8:	00006517          	auipc	a0,0x6
    80004abc:	20050513          	add	a0,a0,512 # 8000acb8 <digits+0xf8>
    80004ac0:	cdcfe0ef          	jal	80002f9c <uart_puts>
    80004ac4:	eadff06f          	j	80004970 <test_page_replacement+0xac>
    80004ac8:	00f43423          	sd	a5,8(s0)
    80004acc:	f81ff06f          	j	80004a4c <test_page_replacement+0x188>
    80004ad0:	00e43023          	sd	a4,0(s0)
    80004ad4:	f71ff06f          	j	80004a44 <test_page_replacement+0x180>
    80004ad8:	00006517          	auipc	a0,0x6
    80004adc:	2b050513          	add	a0,a0,688 # 8000ad88 <digits+0x1c8>
    80004ae0:	cbcfe0ef          	jal	80002f9c <uart_puts>
    80004ae4:	fadff06f          	j	80004a90 <test_page_replacement+0x1cc>
    80004ae8:	00006517          	auipc	a0,0x6
    80004aec:	1b050513          	add	a0,a0,432 # 8000ac98 <digits+0xd8>
    80004af0:	cacfe0ef          	jal	80002f9c <uart_puts>
    80004af4:	e65ff06f          	j	80004958 <test_page_replacement+0x94>
    80004af8:	00843783          	ld	a5,8(s0)
    80004afc:	f6979ae3          	bne	a5,s1,80004a70 <test_page_replacement+0x1ac>
    80004b00:	00006517          	auipc	a0,0x6
    80004b04:	24850513          	add	a0,a0,584 # 8000ad48 <digits+0x188>
    80004b08:	c94fe0ef          	jal	80002f9c <uart_puts>
    80004b0c:	f71ff06f          	j	80004a7c <test_page_replacement+0x1b8>

0000000080004b10 <copyout>:
    80004b10:	04068863          	beqz	a3,80004b60 <copyout+0x50>
    80004b14:	fffffe37          	lui	t3,0xfffff
    80004b18:	00001337          	lui	t1,0x1
    80004b1c:	01c5f8b3          	and	a7,a1,t3
    80004b20:	40b88833          	sub	a6,a7,a1
    80004b24:	00680833          	add	a6,a6,t1
    80004b28:	0106f463          	bgeu	a3,a6,80004b30 <copyout+0x20>
    80004b2c:	00068813          	mv	a6,a3
    80004b30:	02080c63          	beqz	a6,80004b68 <copyout+0x58>
    80004b34:	00060793          	mv	a5,a2
    80004b38:	40f585b3          	sub	a1,a1,a5
    80004b3c:	00c80633          	add	a2,a6,a2
    80004b40:	0007c503          	lbu	a0,0(a5)
    80004b44:	00f58733          	add	a4,a1,a5
    80004b48:	00178793          	add	a5,a5,1
    80004b4c:	00a70023          	sb	a0,0(a4)
    80004b50:	fef618e3          	bne	a2,a5,80004b40 <copyout+0x30>
    80004b54:	410686b3          	sub	a3,a3,a6
    80004b58:	006885b3          	add	a1,a7,t1
    80004b5c:	fc0690e3          	bnez	a3,80004b1c <copyout+0xc>
    80004b60:	00000513          	li	a0,0
    80004b64:	00008067          	ret
    80004b68:	006885b3          	add	a1,a7,t1
    80004b6c:	fb1ff06f          	j	80004b1c <copyout+0xc>

0000000080004b70 <copyin>:
    80004b70:	04068863          	beqz	a3,80004bc0 <copyin+0x50>
    80004b74:	fffff337          	lui	t1,0xfffff
    80004b78:	000018b7          	lui	a7,0x1
    80004b7c:	00667833          	and	a6,a2,t1
    80004b80:	40c80533          	sub	a0,a6,a2
    80004b84:	01150533          	add	a0,a0,a7
    80004b88:	00a6f463          	bgeu	a3,a0,80004b90 <copyin+0x20>
    80004b8c:	00068513          	mv	a0,a3
    80004b90:	02050c63          	beqz	a0,80004bc8 <copyin+0x58>
    80004b94:	00058793          	mv	a5,a1
    80004b98:	40f60633          	sub	a2,a2,a5
    80004b9c:	00b505b3          	add	a1,a0,a1
    80004ba0:	00f60733          	add	a4,a2,a5
    80004ba4:	00074703          	lbu	a4,0(a4)
    80004ba8:	00178793          	add	a5,a5,1
    80004bac:	fee78fa3          	sb	a4,-1(a5)
    80004bb0:	fef598e3          	bne	a1,a5,80004ba0 <copyin+0x30>
    80004bb4:	40a686b3          	sub	a3,a3,a0
    80004bb8:	01180633          	add	a2,a6,a7
    80004bbc:	fc0690e3          	bnez	a3,80004b7c <copyin+0xc>
    80004bc0:	00000513          	li	a0,0
    80004bc4:	00008067          	ret
    80004bc8:	01180633          	add	a2,a6,a7
    80004bcc:	fb1ff06f          	j	80004b7c <copyin+0xc>

0000000080004bd0 <copyinstr>:
    80004bd0:	fffffe37          	lui	t3,0xfffff
    80004bd4:	00001337          	lui	t1,0x1
    80004bd8:	06068863          	beqz	a3,80004c48 <copyinstr+0x78>
    80004bdc:	01c678b3          	and	a7,a2,t3
    80004be0:	40c88533          	sub	a0,a7,a2
    80004be4:	00650533          	add	a0,a0,t1
    80004be8:	00a6f463          	bgeu	a3,a0,80004bf0 <copyinstr+0x20>
    80004bec:	00068513          	mv	a0,a3
    80004bf0:	06050063          	beqz	a0,80004c50 <copyinstr+0x80>
    80004bf4:	00058793          	mv	a5,a1
    80004bf8:	40b60633          	sub	a2,a2,a1
    80004bfc:	00a58533          	add	a0,a1,a0
    80004c00:	0100006f          	j	80004c10 <copyinstr+0x40>
    80004c04:	00e78023          	sb	a4,0(a5)
    80004c08:	00178793          	add	a5,a5,1
    80004c0c:	02a78063          	beq	a5,a0,80004c2c <copyinstr+0x5c>
    80004c10:	00c78733          	add	a4,a5,a2
    80004c14:	00074703          	lbu	a4,0(a4)
    80004c18:	00078813          	mv	a6,a5
    80004c1c:	fe0714e3          	bnez	a4,80004c04 <copyinstr+0x34>
    80004c20:	00078023          	sb	zero,0(a5)
    80004c24:	00000513          	li	a0,0
    80004c28:	00008067          	ret
    80004c2c:	fff68693          	add	a3,a3,-1
    80004c30:	00b685b3          	add	a1,a3,a1
    80004c34:	410586b3          	sub	a3,a1,a6
    80004c38:	00688633          	add	a2,a7,t1
    80004c3c:	00b80663          	beq	a6,a1,80004c48 <copyinstr+0x78>
    80004c40:	00078593          	mv	a1,a5
    80004c44:	f99ff06f          	j	80004bdc <copyinstr+0xc>
    80004c48:	fff00513          	li	a0,-1
    80004c4c:	00008067          	ret
    80004c50:	00001637          	lui	a2,0x1
    80004c54:	00058793          	mv	a5,a1
    80004c58:	00c88633          	add	a2,a7,a2
    80004c5c:	00078593          	mv	a1,a5
    80004c60:	f7dff06f          	j	80004bdc <copyinstr+0xc>

0000000080004c64 <handle_timer_interrupt>:
    80004c64:	ff010113          	add	sp,sp,-16
    80004c68:	00422597          	auipc	a1,0x422
    80004c6c:	7685b583          	ld	a1,1896(a1) # 804273d0 <ticks>
    80004c70:	00006517          	auipc	a0,0x6
    80004c74:	18050513          	add	a0,a0,384 # 8000adf0 <digits+0x230>
    80004c78:	00113423          	sd	ra,8(sp)
    80004c7c:	fb1fd0ef          	jal	80002c2c <printf>
    80004c80:	00813083          	ld	ra,8(sp)
    80004c84:	00100793          	li	a5,1
    80004c88:	00422717          	auipc	a4,0x422
    80004c8c:	74f72e23          	sw	a5,1884(a4) # 804273e4 <need_resched>
    80004c90:	01010113          	add	sp,sp,16
    80004c94:	00008067          	ret

0000000080004c98 <handle_external_interrupt>:
    80004c98:	00006517          	auipc	a0,0x6
    80004c9c:	18050513          	add	a0,a0,384 # 8000ae18 <digits+0x258>
    80004ca0:	f8dfd06f          	j	80002c2c <printf>

0000000080004ca4 <handle_software_interrupt>:
    80004ca4:	00006517          	auipc	a0,0x6
    80004ca8:	1a450513          	add	a0,a0,420 # 8000ae48 <digits+0x288>
    80004cac:	f81fd06f          	j	80002c2c <printf>

0000000080004cb0 <r_stvec>:
    80004cb0:	10502573          	csrr	a0,stvec
    80004cb4:	00008067          	ret

0000000080004cb8 <w_stvec>:
    80004cb8:	10551073          	csrw	stvec,a0
    80004cbc:	00008067          	ret

0000000080004cc0 <r_sscratch>:
    80004cc0:	14002573          	csrr	a0,sscratch
    80004cc4:	00008067          	ret

0000000080004cc8 <w_sscratch>:
    80004cc8:	14051073          	csrw	sscratch,a0
    80004ccc:	00008067          	ret

0000000080004cd0 <get_current_trapframe>:
    80004cd0:	ff010113          	add	sp,sp,-16
    80004cd4:	00113423          	sd	ra,8(sp)
    80004cd8:	5f1000ef          	jal	80005ac8 <myproc>
    80004cdc:	00050a63          	beqz	a0,80004cf0 <get_current_trapframe+0x20>
    80004ce0:	00813083          	ld	ra,8(sp)
    80004ce4:	04053503          	ld	a0,64(a0)
    80004ce8:	01010113          	add	sp,sp,16
    80004cec:	00008067          	ret
    80004cf0:	00006597          	auipc	a1,0x6
    80004cf4:	18858593          	add	a1,a1,392 # 8000ae78 <digits+0x2b8>
    80004cf8:	00006517          	auipc	a0,0x6
    80004cfc:	1a850513          	add	a0,a0,424 # 8000aea0 <digits+0x2e0>
    80004d00:	f2dfd0ef          	jal	80002c2c <printf>
    80004d04:	0000006f          	j	80004d04 <get_current_trapframe+0x34>

0000000080004d08 <get_ticks>:
    80004d08:	00422517          	auipc	a0,0x422
    80004d0c:	6c853503          	ld	a0,1736(a0) # 804273d0 <ticks>
    80004d10:	00008067          	ret

0000000080004d14 <machine_timer_handler>:
    80004d14:	00422797          	auipc	a5,0x422
    80004d18:	6b478793          	add	a5,a5,1716 # 804273c8 <m_mode_ticks>
    80004d1c:	0007b703          	ld	a4,0(a5)
    80004d20:	ff010113          	add	sp,sp,-16
    80004d24:	00113423          	sd	ra,8(sp)
    80004d28:	00170713          	add	a4,a4,1
    80004d2c:	00e7b023          	sd	a4,0(a5)
    80004d30:	00422697          	auipc	a3,0x422
    80004d34:	6a068693          	add	a3,a3,1696 # 804273d0 <ticks>
    80004d38:	0006b703          	ld	a4,0(a3)
    80004d3c:	00006517          	auipc	a0,0x6
    80004d40:	17450513          	add	a0,a0,372 # 8000aeb0 <digits+0x2f0>
    80004d44:	00170713          	add	a4,a4,1
    80004d48:	00e6b023          	sd	a4,0(a3)
    80004d4c:	0007b583          	ld	a1,0(a5)
    80004d50:	eddfd0ef          	jal	80002c2c <printf>
    80004d54:	0200c7b7          	lui	a5,0x200c
    80004d58:	ff87b783          	ld	a5,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80004d5c:	000f4737          	lui	a4,0xf4
    80004d60:	00813083          	ld	ra,8(sp)
    80004d64:	24070713          	add	a4,a4,576 # f4240 <_entry-0x7ff0bdc0>
    80004d68:	00e787b3          	add	a5,a5,a4
    80004d6c:	02004737          	lui	a4,0x2004
    80004d70:	00f73023          	sd	a5,0(a4) # 2004000 <_entry-0x7dffc000>
    80004d74:	01010113          	add	sp,sp,16
    80004d78:	00008067          	ret

0000000080004d7c <alloc_trapframe>:
    80004d7c:	0040f597          	auipc	a1,0x40f
    80004d80:	32c58593          	add	a1,a1,812 # 804140a8 <trapframe_used>
    80004d84:	00058793          	mv	a5,a1
    80004d88:	00000713          	li	a4,0
    80004d8c:	10000613          	li	a2,256
    80004d90:	00c0006f          	j	80004d9c <alloc_trapframe+0x20>
    80004d94:	0017071b          	addw	a4,a4,1
    80004d98:	02c70e63          	beq	a4,a2,80004dd4 <alloc_trapframe+0x58>
    80004d9c:	0007a683          	lw	a3,0(a5)
    80004da0:	00478793          	add	a5,a5,4
    80004da4:	fe0698e3          	bnez	a3,80004d94 <alloc_trapframe+0x18>
    80004da8:	00271793          	sll	a5,a4,0x2
    80004dac:	00371513          	sll	a0,a4,0x3
    80004db0:	00f585b3          	add	a1,a1,a5
    80004db4:	00e50533          	add	a0,a0,a4
    80004db8:	00100793          	li	a5,1
    80004dbc:	00f5a023          	sw	a5,0(a1)
    80004dc0:	00551513          	sll	a0,a0,0x5
    80004dc4:	0040f797          	auipc	a5,0x40f
    80004dc8:	76478793          	add	a5,a5,1892 # 80414528 <trapframe_pool>
    80004dcc:	00f50533          	add	a0,a0,a5
    80004dd0:	00008067          	ret
    80004dd4:	00000513          	li	a0,0
    80004dd8:	00008067          	ret

0000000080004ddc <free_trapframe>:
    80004ddc:	0040f797          	auipc	a5,0x40f
    80004de0:	74c78793          	add	a5,a5,1868 # 80414528 <trapframe_pool>
    80004de4:	02f56c63          	bltu	a0,a5,80004e1c <free_trapframe+0x40>
    80004de8:	00421717          	auipc	a4,0x421
    80004dec:	74070713          	add	a4,a4,1856 # 80426528 <cpus>
    80004df0:	02e57663          	bgeu	a0,a4,80004e1c <free_trapframe+0x40>
    80004df4:	40f507b3          	sub	a5,a0,a5
    80004df8:	00007717          	auipc	a4,0x7
    80004dfc:	bd073703          	ld	a4,-1072(a4) # 8000b9c8 <syscalls+0xd0>
    80004e00:	4057d793          	sra	a5,a5,0x5
    80004e04:	02e787b3          	mul	a5,a5,a4
    80004e08:	0040f717          	auipc	a4,0x40f
    80004e0c:	2a070713          	add	a4,a4,672 # 804140a8 <trapframe_used>
    80004e10:	00279793          	sll	a5,a5,0x2
    80004e14:	00f707b3          	add	a5,a4,a5
    80004e18:	0007a023          	sw	zero,0(a5)
    80004e1c:	00008067          	ret

0000000080004e20 <intr_on>:
    80004e20:	100027f3          	csrr	a5,sstatus
    80004e24:	0027e793          	or	a5,a5,2
    80004e28:	10079073          	csrw	sstatus,a5
    80004e2c:	00008067          	ret

0000000080004e30 <intr_off>:
    80004e30:	100027f3          	csrr	a5,sstatus
    80004e34:	ffd7f793          	and	a5,a5,-3
    80004e38:	10079073          	csrw	sstatus,a5
    80004e3c:	00008067          	ret

0000000080004e40 <intr_get>:
    80004e40:	10002573          	csrr	a0,sstatus
    80004e44:	00155513          	srl	a0,a0,0x1
    80004e48:	00157513          	and	a0,a0,1
    80004e4c:	00008067          	ret

0000000080004e50 <set_stvec>:
    80004e50:	00a585b3          	add	a1,a1,a0
    80004e54:	10559073          	csrw	stvec,a1
    80004e58:	00008067          	ret

0000000080004e5c <trap_init>:
    80004e5c:	ff010113          	add	sp,sp,-16
    80004e60:	00006517          	auipc	a0,0x6
    80004e64:	08050513          	add	a0,a0,128 # 8000aee0 <digits+0x320>
    80004e68:	00113423          	sd	ra,8(sp)
    80004e6c:	930fe0ef          	jal	80002f9c <uart_puts>
    80004e70:	0040f617          	auipc	a2,0x40f
    80004e74:	23860613          	add	a2,a2,568 # 804140a8 <trapframe_used>
    80004e78:	00060793          	mv	a5,a2
    80004e7c:	0040f717          	auipc	a4,0x40f
    80004e80:	62c70713          	add	a4,a4,1580 # 804144a8 <trap_handlers>
    80004e84:	0007a023          	sw	zero,0(a5)
    80004e88:	00478793          	add	a5,a5,4
    80004e8c:	fee79ce3          	bne	a5,a4,80004e84 <trap_init+0x28>
    80004e90:	0040f797          	auipc	a5,0x40f
    80004e94:	61878793          	add	a5,a5,1560 # 804144a8 <trap_handlers>
    80004e98:	0040f697          	auipc	a3,0x40f
    80004e9c:	69068693          	add	a3,a3,1680 # 80414528 <trapframe_pool>
    80004ea0:	00078713          	mv	a4,a5
    80004ea4:	00073023          	sd	zero,0(a4)
    80004ea8:	00870713          	add	a4,a4,8
    80004eac:	fee69ce3          	bne	a3,a4,80004ea4 <trap_init+0x48>
    80004eb0:	00000717          	auipc	a4,0x0
    80004eb4:	db470713          	add	a4,a4,-588 # 80004c64 <handle_timer_interrupt>
    80004eb8:	42e63423          	sd	a4,1064(a2)
    80004ebc:	00000717          	auipc	a4,0x0
    80004ec0:	ddc70713          	add	a4,a4,-548 # 80004c98 <handle_external_interrupt>
    80004ec4:	44e63423          	sd	a4,1096(a2)
    80004ec8:	00000717          	auipc	a4,0x0
    80004ecc:	ddc70713          	add	a4,a4,-548 # 80004ca4 <handle_software_interrupt>
    80004ed0:	40e63423          	sd	a4,1032(a2)
    80004ed4:	00000593          	li	a1,0
    80004ed8:	0007b703          	ld	a4,0(a5)
    80004edc:	00878793          	add	a5,a5,8
    80004ee0:	00070463          	beqz	a4,80004ee8 <trap_init+0x8c>
    80004ee4:	0015859b          	addw	a1,a1,1
    80004ee8:	fef698e3          	bne	a3,a5,80004ed8 <trap_init+0x7c>
    80004eec:	00006517          	auipc	a0,0x6
    80004ef0:	01c50513          	add	a0,a0,28 # 8000af08 <digits+0x348>
    80004ef4:	d39fd0ef          	jal	80002c2c <printf>
    80004ef8:	00813083          	ld	ra,8(sp)
    80004efc:	00006517          	auipc	a0,0x6
    80004f00:	03c50513          	add	a0,a0,60 # 8000af38 <digits+0x378>
    80004f04:	01010113          	add	sp,sp,16
    80004f08:	894fe06f          	j	80002f9c <uart_puts>

0000000080004f0c <trap_init_hart>:
    80004f0c:	ff010113          	add	sp,sp,-16
    80004f10:	00006517          	auipc	a0,0x6
    80004f14:	04850513          	add	a0,a0,72 # 8000af58 <digits+0x398>
    80004f18:	00113423          	sd	ra,8(sp)
    80004f1c:	880fe0ef          	jal	80002f9c <uart_puts>
    80004f20:	00002797          	auipc	a5,0x2
    80004f24:	ac078793          	add	a5,a5,-1344 # 800069e0 <kernelvec>
    80004f28:	10579073          	csrw	stvec,a5
    80004f2c:	104027f3          	csrr	a5,sie
    80004f30:	2227e793          	or	a5,a5,546
    80004f34:	10479073          	csrw	sie,a5
    80004f38:	100027f3          	csrr	a5,sstatus
    80004f3c:	0027e793          	or	a5,a5,2
    80004f40:	10079073          	csrw	sstatus,a5
    80004f44:	00813083          	ld	ra,8(sp)
    80004f48:	00006517          	auipc	a0,0x6
    80004f4c:	03850513          	add	a0,a0,56 # 8000af80 <digits+0x3c0>
    80004f50:	01010113          	add	sp,sp,16
    80004f54:	848fe06f          	j	80002f9c <uart_puts>

0000000080004f58 <set_next_timer>:
    80004f58:	0200c7b7          	lui	a5,0x200c
    80004f5c:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80004f60:	000f4637          	lui	a2,0xf4
    80004f64:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004f68:	00c58633          	add	a2,a1,a2
    80004f6c:	020047b7          	lui	a5,0x2004
    80004f70:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80004f74:	00006517          	auipc	a0,0x6
    80004f78:	03450513          	add	a0,a0,52 # 8000afa8 <digits+0x3e8>
    80004f7c:	cb1fd06f          	j	80002c2c <printf>

0000000080004f80 <timerinit>:
    80004f80:	ff010113          	add	sp,sp,-16
    80004f84:	00006517          	auipc	a0,0x6
    80004f88:	05450513          	add	a0,a0,84 # 8000afd8 <digits+0x418>
    80004f8c:	00113423          	sd	ra,8(sp)
    80004f90:	80cfe0ef          	jal	80002f9c <uart_puts>
    80004f94:	0200c7b7          	lui	a5,0x200c
    80004f98:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80004f9c:	000f4637          	lui	a2,0xf4
    80004fa0:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80004fa4:	00c58633          	add	a2,a1,a2
    80004fa8:	020047b7          	lui	a5,0x2004
    80004fac:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80004fb0:	00006517          	auipc	a0,0x6
    80004fb4:	ff850513          	add	a0,a0,-8 # 8000afa8 <digits+0x3e8>
    80004fb8:	c75fd0ef          	jal	80002c2c <printf>
    80004fbc:	00813083          	ld	ra,8(sp)
    80004fc0:	00006517          	auipc	a0,0x6
    80004fc4:	03850513          	add	a0,a0,56 # 8000aff8 <digits+0x438>
    80004fc8:	01010113          	add	sp,sp,16
    80004fcc:	fd1fd06f          	j	80002f9c <uart_puts>

0000000080004fd0 <devintr>:
    80004fd0:	142025f3          	csrr	a1,scause
    80004fd4:	1005da63          	bgez	a1,800050e8 <devintr+0x118>
    80004fd8:	ff010113          	add	sp,sp,-16
    80004fdc:	00113423          	sd	ra,8(sp)
    80004fe0:	00813023          	sd	s0,0(sp)
    80004fe4:	00f5f593          	and	a1,a1,15
    80004fe8:	00500793          	li	a5,5
    80004fec:	08f58663          	beq	a1,a5,80005078 <devintr+0xa8>
    80004ff0:	00900793          	li	a5,9
    80004ff4:	06f58263          	beq	a1,a5,80005058 <devintr+0x88>
    80004ff8:	00100793          	li	a5,1
    80004ffc:	02f58263          	beq	a1,a5,80005020 <devintr+0x50>
    80005000:	00006517          	auipc	a0,0x6
    80005004:	08050513          	add	a0,a0,128 # 8000b080 <digits+0x4c0>
    80005008:	c25fd0ef          	jal	80002c2c <printf>
    8000500c:	00813083          	ld	ra,8(sp)
    80005010:	00013403          	ld	s0,0(sp)
    80005014:	00000513          	li	a0,0
    80005018:	01010113          	add	sp,sp,16
    8000501c:	00008067          	ret
    80005020:	00006517          	auipc	a0,0x6
    80005024:	04050513          	add	a0,a0,64 # 8000b060 <digits+0x4a0>
    80005028:	f75fd0ef          	jal	80002f9c <uart_puts>
    8000502c:	144027f3          	csrr	a5,sip
    80005030:	ffd7f793          	and	a5,a5,-3
    80005034:	14479073          	csrw	sip,a5
    80005038:	00006517          	auipc	a0,0x6
    8000503c:	e1050513          	add	a0,a0,-496 # 8000ae48 <digits+0x288>
    80005040:	bedfd0ef          	jal	80002c2c <printf>
    80005044:	00100513          	li	a0,1
    80005048:	00813083          	ld	ra,8(sp)
    8000504c:	00013403          	ld	s0,0(sp)
    80005050:	01010113          	add	sp,sp,16
    80005054:	00008067          	ret
    80005058:	00006517          	auipc	a0,0x6
    8000505c:	fe850513          	add	a0,a0,-24 # 8000b040 <digits+0x480>
    80005060:	f3dfd0ef          	jal	80002f9c <uart_puts>
    80005064:	00006517          	auipc	a0,0x6
    80005068:	db450513          	add	a0,a0,-588 # 8000ae18 <digits+0x258>
    8000506c:	bc1fd0ef          	jal	80002c2c <printf>
    80005070:	00100513          	li	a0,1
    80005074:	fd5ff06f          	j	80005048 <devintr+0x78>
    80005078:	00422417          	auipc	s0,0x422
    8000507c:	35840413          	add	s0,s0,856 # 804273d0 <ticks>
    80005080:	00043783          	ld	a5,0(s0)
    80005084:	000f4637          	lui	a2,0xf4
    80005088:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000508c:	00178793          	add	a5,a5,1
    80005090:	00f43023          	sd	a5,0(s0)
    80005094:	0200c7b7          	lui	a5,0x200c
    80005098:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    8000509c:	020047b7          	lui	a5,0x2004
    800050a0:	00006517          	auipc	a0,0x6
    800050a4:	f0850513          	add	a0,a0,-248 # 8000afa8 <digits+0x3e8>
    800050a8:	00c58633          	add	a2,a1,a2
    800050ac:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    800050b0:	b7dfd0ef          	jal	80002c2c <printf>
    800050b4:	00043583          	ld	a1,0(s0)
    800050b8:	00006517          	auipc	a0,0x6
    800050bc:	f6050513          	add	a0,a0,-160 # 8000b018 <digits+0x458>
    800050c0:	b6dfd0ef          	jal	80002c2c <printf>
    800050c4:	00043583          	ld	a1,0(s0)
    800050c8:	00006517          	auipc	a0,0x6
    800050cc:	d2850513          	add	a0,a0,-728 # 8000adf0 <digits+0x230>
    800050d0:	b5dfd0ef          	jal	80002c2c <printf>
    800050d4:	00100793          	li	a5,1
    800050d8:	00422717          	auipc	a4,0x422
    800050dc:	30f72623          	sw	a5,780(a4) # 804273e4 <need_resched>
    800050e0:	00100513          	li	a0,1
    800050e4:	f65ff06f          	j	80005048 <devintr+0x78>
    800050e8:	00000513          	li	a0,0
    800050ec:	00008067          	ret

00000000800050f0 <usertrapret>:
    800050f0:	ff010113          	add	sp,sp,-16
    800050f4:	00113423          	sd	ra,8(sp)
    800050f8:	1d1000ef          	jal	80005ac8 <myproc>
    800050fc:	100027f3          	csrr	a5,sstatus
    80005100:	ffd7f793          	and	a5,a5,-3
    80005104:	10079073          	csrw	sstatus,a5
    80005108:	00002797          	auipc	a5,0x2
    8000510c:	a0878793          	add	a5,a5,-1528 # 80006b10 <uservec>
    80005110:	10579073          	csrw	stvec,a5
    80005114:	18002773          	csrr	a4,satp
    80005118:	04053783          	ld	a5,64(a0)
    8000511c:	00070463          	beqz	a4,80005124 <usertrapret+0x34>
    80005120:	00e7b023          	sd	a4,0(a5)
    80005124:	03853703          	ld	a4,56(a0)
    80005128:	000016b7          	lui	a3,0x1
    8000512c:	00d70733          	add	a4,a4,a3
    80005130:	00e7b423          	sd	a4,8(a5)
    80005134:	00000717          	auipc	a4,0x0
    80005138:	05070713          	add	a4,a4,80 # 80005184 <usertrap>
    8000513c:	00e7b823          	sd	a4,16(a5)
    80005140:	00020713          	mv	a4,tp
    80005144:	02e7b023          	sd	a4,32(a5)
    80005148:	10002773          	csrr	a4,sstatus
    8000514c:	eff77713          	and	a4,a4,-257
    80005150:	02076713          	or	a4,a4,32
    80005154:	10071073          	csrw	sstatus,a4
    80005158:	0187b703          	ld	a4,24(a5)
    8000515c:	14171073          	csrw	sepc,a4
    80005160:	14079073          	csrw	sscratch,a5
    80005164:	02853503          	ld	a0,40(a0)
    80005168:	00813083          	ld	ra,8(sp)
    8000516c:	fff00793          	li	a5,-1
    80005170:	00c55513          	srl	a0,a0,0xc
    80005174:	03f79793          	sll	a5,a5,0x3f
    80005178:	00f56533          	or	a0,a0,a5
    8000517c:	01010113          	add	sp,sp,16
    80005180:	23d0106f          	j	80006bbc <userret>

0000000080005184 <usertrap>:
    80005184:	fe010113          	add	sp,sp,-32
    80005188:	01213023          	sd	s2,0(sp)
    8000518c:	00113c23          	sd	ra,24(sp)
    80005190:	00813823          	sd	s0,16(sp)
    80005194:	00913423          	sd	s1,8(sp)
    80005198:	10000937          	lui	s2,0x10000
    8000519c:	05400793          	li	a5,84
    800051a0:	00f90023          	sb	a5,0(s2) # 10000000 <_entry-0x70000000>
    800051a4:	142024f3          	csrr	s1,scause
    800051a8:	121000ef          	jal	80005ac8 <myproc>
    800051ac:	00050413          	mv	s0,a0
    800051b0:	14102673          	csrr	a2,sepc
    800051b4:	00006517          	auipc	a0,0x6
    800051b8:	f6450513          	add	a0,a0,-156 # 8000b118 <digits+0x558>
    800051bc:	00048593          	mv	a1,s1
    800051c0:	a6dfd0ef          	jal	80002c2c <printf>
    800051c4:	100027f3          	csrr	a5,sstatus
    800051c8:	1007f793          	and	a5,a5,256
    800051cc:	1e079463          	bnez	a5,800053b4 <usertrap+0x230>
    800051d0:	00002797          	auipc	a5,0x2
    800051d4:	81078793          	add	a5,a5,-2032 # 800069e0 <kernelvec>
    800051d8:	10579073          	csrw	stvec,a5
    800051dc:	00800793          	li	a5,8
    800051e0:	0ef48463          	beq	s1,a5,800052c8 <usertrap+0x144>
    800051e4:	00300793          	li	a5,3
    800051e8:	0af49463          	bne	s1,a5,80005290 <usertrap+0x10c>
    800051ec:	00006717          	auipc	a4,0x6
    800051f0:	eb470713          	add	a4,a4,-332 # 8000b0a0 <digits+0x4e0>
    800051f4:	00a00793          	li	a5,10
    800051f8:	100006b7          	lui	a3,0x10000
    800051fc:	00f68023          	sb	a5,0(a3) # 10000000 <_entry-0x70000000>
    80005200:	00174783          	lbu	a5,1(a4)
    80005204:	00170713          	add	a4,a4,1
    80005208:	fe079ae3          	bnez	a5,800051fc <usertrap+0x78>
    8000520c:	04200793          	li	a5,66
    80005210:	00f68023          	sb	a5,0(a3)
    80005214:	00a00793          	li	a5,10
    80005218:	00f68023          	sb	a5,0(a3)
    8000521c:	00006717          	auipc	a4,0x6
    80005220:	ea470713          	add	a4,a4,-348 # 8000b0c0 <digits+0x500>
    80005224:	05400793          	li	a5,84
    80005228:	100006b7          	lui	a3,0x10000
    8000522c:	00f68023          	sb	a5,0(a3) # 10000000 <_entry-0x70000000>
    80005230:	00174783          	lbu	a5,1(a4)
    80005234:	00170713          	add	a4,a4,1
    80005238:	fe079ae3          	bnez	a5,8000522c <usertrap+0xa8>
    8000523c:	00006717          	auipc	a4,0x6
    80005240:	eb470713          	add	a4,a4,-332 # 8000b0f0 <digits+0x530>
    80005244:	05300793          	li	a5,83
    80005248:	100006b7          	lui	a3,0x10000
    8000524c:	00f68023          	sb	a5,0(a3) # 10000000 <_entry-0x70000000>
    80005250:	00174783          	lbu	a5,1(a4)
    80005254:	00170713          	add	a4,a4,1
    80005258:	fe079ae3          	bnez	a5,8000524c <usertrap+0xc8>
    8000525c:	00100793          	li	a5,1
    80005260:	02f42223          	sw	a5,36(s0)
    80005264:	fff00513          	li	a0,-1
    80005268:	fff00793          	li	a5,-1
    8000526c:	00422717          	auipc	a4,0x422
    80005270:	14f72a23          	sw	a5,340(a4) # 804273c0 <syscall_test_count>
    80005274:	355000ef          	jal	80005dc8 <exit>
    80005278:	01013403          	ld	s0,16(sp)
    8000527c:	01813083          	ld	ra,24(sp)
    80005280:	00813483          	ld	s1,8(sp)
    80005284:	00013903          	ld	s2,0(sp)
    80005288:	02010113          	add	sp,sp,32
    8000528c:	e65ff06f          	j	800050f0 <usertrapret>
    80005290:	d41ff0ef          	jal	80004fd0 <devintr>
    80005294:	00050493          	mv	s1,a0
    80005298:	0c050663          	beqz	a0,80005364 <usertrap+0x1e0>
    8000529c:	02442783          	lw	a5,36(s0)
    800052a0:	0a079c63          	bnez	a5,80005358 <usertrap+0x1d4>
    800052a4:	00200793          	li	a5,2
    800052a8:	fcf498e3          	bne	s1,a5,80005278 <usertrap+0xf4>
    800052ac:	189000ef          	jal	80005c34 <yield>
    800052b0:	01013403          	ld	s0,16(sp)
    800052b4:	01813083          	ld	ra,24(sp)
    800052b8:	00813483          	ld	s1,8(sp)
    800052bc:	00013903          	ld	s2,0(sp)
    800052c0:	02010113          	add	sp,sp,32
    800052c4:	e2dff06f          	j	800050f0 <usertrapret>
    800052c8:	05300793          	li	a5,83
    800052cc:	00f90023          	sb	a5,0(s2)
    800052d0:	04043783          	ld	a5,64(s0)
    800052d4:	00800593          	li	a1,8
    800052d8:	00006517          	auipc	a0,0x6
    800052dc:	e9050513          	add	a0,a0,-368 # 8000b168 <digits+0x5a8>
    800052e0:	0187b603          	ld	a2,24(a5)
    800052e4:	949fd0ef          	jal	80002c2c <printf>
    800052e8:	04043783          	ld	a5,64(s0)
    800052ec:	00006517          	auipc	a0,0x6
    800052f0:	eb450513          	add	a0,a0,-332 # 8000b1a0 <digits+0x5e0>
    800052f4:	0a87b583          	ld	a1,168(a5)
    800052f8:	935fd0ef          	jal	80002c2c <printf>
    800052fc:	04043703          	ld	a4,64(s0)
    80005300:	01873783          	ld	a5,24(a4)
    80005304:	00478793          	add	a5,a5,4
    80005308:	00f73c23          	sd	a5,24(a4)
    8000530c:	100027f3          	csrr	a5,sstatus
    80005310:	0027e793          	or	a5,a5,2
    80005314:	10079073          	csrw	sstatus,a5
    80005318:	508010ef          	jal	80006820 <syscall>
    8000531c:	04043783          	ld	a5,64(s0)
    80005320:	00006517          	auipc	a0,0x6
    80005324:	ea850513          	add	a0,a0,-344 # 8000b1c8 <digits+0x608>
    80005328:	0707b583          	ld	a1,112(a5)
    8000532c:	901fd0ef          	jal	80002c2c <printf>
    80005330:	00422797          	auipc	a5,0x422
    80005334:	0907a783          	lw	a5,144(a5) # 804273c0 <syscall_test_count>
    80005338:	02442703          	lw	a4,36(s0)
    8000533c:	0017879b          	addw	a5,a5,1
    80005340:	00422697          	auipc	a3,0x422
    80005344:	08f6a023          	sw	a5,128(a3) # 804273c0 <syscall_test_count>
    80005348:	f20708e3          	beqz	a4,80005278 <usertrap+0xf4>
    8000534c:	fff00513          	li	a0,-1
    80005350:	279000ef          	jal	80005dc8 <exit>
    80005354:	f25ff06f          	j	80005278 <usertrap+0xf4>
    80005358:	fff00513          	li	a0,-1
    8000535c:	26d000ef          	jal	80005dc8 <exit>
    80005360:	f45ff06f          	j	800052a4 <usertrap+0x120>
    80005364:	142025f3          	csrr	a1,scause
    80005368:	00842603          	lw	a2,8(s0)
    8000536c:	00006517          	auipc	a0,0x6
    80005370:	e9450513          	add	a0,a0,-364 # 8000b200 <digits+0x640>
    80005374:	8b9fd0ef          	jal	80002c2c <printf>
    80005378:	141025f3          	csrr	a1,sepc
    8000537c:	14302673          	csrr	a2,stval
    80005380:	00006517          	auipc	a0,0x6
    80005384:	ea850513          	add	a0,a0,-344 # 8000b228 <digits+0x668>
    80005388:	8a5fd0ef          	jal	80002c2c <printf>
    8000538c:	00100793          	li	a5,1
    80005390:	02f42223          	sw	a5,36(s0)
    80005394:	fff00513          	li	a0,-1
    80005398:	231000ef          	jal	80005dc8 <exit>
    8000539c:	01013403          	ld	s0,16(sp)
    800053a0:	01813083          	ld	ra,24(sp)
    800053a4:	00813483          	ld	s1,8(sp)
    800053a8:	00013903          	ld	s2,0(sp)
    800053ac:	02010113          	add	sp,sp,32
    800053b0:	d41ff06f          	j	800050f0 <usertrapret>
    800053b4:	00006597          	auipc	a1,0x6
    800053b8:	d9458593          	add	a1,a1,-620 # 8000b148 <digits+0x588>
    800053bc:	00006517          	auipc	a0,0x6
    800053c0:	ae450513          	add	a0,a0,-1308 # 8000aea0 <digits+0x2e0>
    800053c4:	869fd0ef          	jal	80002c2c <printf>
    800053c8:	0000006f          	j	800053c8 <usertrap+0x244>

00000000800053cc <handle_syscall>:
    800053cc:	06050a63          	beqz	a0,80005440 <handle_syscall+0x74>
    800053d0:	ff010113          	add	sp,sp,-16
    800053d4:	00813023          	sd	s0,0(sp)
    800053d8:	0a853403          	ld	s0,168(a0)
    800053dc:	00006517          	auipc	a0,0x6
    800053e0:	e9c50513          	add	a0,a0,-356 # 8000b278 <digits+0x6b8>
    800053e4:	00113423          	sd	ra,8(sp)
    800053e8:	00040593          	mv	a1,s0
    800053ec:	841fd0ef          	jal	80002c2c <printf>
    800053f0:	00200793          	li	a5,2
    800053f4:	06f40a63          	beq	s0,a5,80005468 <handle_syscall+0x9c>
    800053f8:	0287e463          	bltu	a5,s0,80005420 <handle_syscall+0x54>
    800053fc:	00006517          	auipc	a0,0x6
    80005400:	ec450513          	add	a0,a0,-316 # 8000b2c0 <digits+0x700>
    80005404:	02041663          	bnez	s0,80005430 <handle_syscall+0x64>
    80005408:	00013403          	ld	s0,0(sp)
    8000540c:	00813083          	ld	ra,8(sp)
    80005410:	00006517          	auipc	a0,0x6
    80005414:	e9050513          	add	a0,a0,-368 # 8000b2a0 <digits+0x6e0>
    80005418:	01010113          	add	sp,sp,16
    8000541c:	811fd06f          	j	80002c2c <printf>
    80005420:	00300793          	li	a5,3
    80005424:	00006517          	auipc	a0,0x6
    80005428:	edc50513          	add	a0,a0,-292 # 8000b300 <digits+0x740>
    8000542c:	02f41063          	bne	s0,a5,8000544c <handle_syscall+0x80>
    80005430:	00013403          	ld	s0,0(sp)
    80005434:	00813083          	ld	ra,8(sp)
    80005438:	01010113          	add	sp,sp,16
    8000543c:	ff0fd06f          	j	80002c2c <printf>
    80005440:	00006517          	auipc	a0,0x6
    80005444:	e0850513          	add	a0,a0,-504 # 8000b248 <digits+0x688>
    80005448:	b55fd06f          	j	80002f9c <uart_puts>
    8000544c:	00040593          	mv	a1,s0
    80005450:	00013403          	ld	s0,0(sp)
    80005454:	00813083          	ld	ra,8(sp)
    80005458:	00006517          	auipc	a0,0x6
    8000545c:	ec850513          	add	a0,a0,-312 # 8000b320 <digits+0x760>
    80005460:	01010113          	add	sp,sp,16
    80005464:	fc8fd06f          	j	80002c2c <printf>
    80005468:	00013403          	ld	s0,0(sp)
    8000546c:	00813083          	ld	ra,8(sp)
    80005470:	00006517          	auipc	a0,0x6
    80005474:	e7050513          	add	a0,a0,-400 # 8000b2e0 <digits+0x720>
    80005478:	01010113          	add	sp,sp,16
    8000547c:	fb0fd06f          	j	80002c2c <printf>

0000000080005480 <handle_exception>:
    80005480:	14202773          	csrr	a4,scause
    80005484:	141025f3          	csrr	a1,sepc
    80005488:	00f00793          	li	a5,15
    8000548c:	16e7e263          	bltu	a5,a4,800055f0 <handle_exception+0x170>
    80005490:	00006697          	auipc	a3,0x6
    80005494:	1ac68693          	add	a3,a3,428 # 8000b63c <digits+0xa7c>
    80005498:	00271793          	sll	a5,a4,0x2
    8000549c:	00d787b3          	add	a5,a5,a3
    800054a0:	0007a783          	lw	a5,0(a5)
    800054a4:	ff010113          	add	sp,sp,-16
    800054a8:	00813023          	sd	s0,0(sp)
    800054ac:	00d787b3          	add	a5,a5,a3
    800054b0:	00113423          	sd	ra,8(sp)
    800054b4:	00050413          	mv	s0,a0
    800054b8:	00078067          	jr	a5
    800054bc:	00013403          	ld	s0,0(sp)
    800054c0:	00813083          	ld	ra,8(sp)
    800054c4:	00058613          	mv	a2,a1
    800054c8:	00070593          	mv	a1,a4
    800054cc:	00006517          	auipc	a0,0x6
    800054d0:	0cc50513          	add	a0,a0,204 # 8000b598 <digits+0x9d8>
    800054d4:	01010113          	add	sp,sp,16
    800054d8:	f54fd06f          	j	80002c2c <printf>
    800054dc:	00006517          	auipc	a0,0x6
    800054e0:	f5450513          	add	a0,a0,-172 # 8000b430 <digits+0x870>
    800054e4:	f48fd0ef          	jal	80002c2c <printf>
    800054e8:	10040e63          	beqz	s0,80005604 <handle_exception+0x184>
    800054ec:	01843583          	ld	a1,24(s0)
    800054f0:	00006517          	auipc	a0,0x6
    800054f4:	fa050513          	add	a0,a0,-96 # 8000b490 <digits+0x8d0>
    800054f8:	00013403          	ld	s0,0(sp)
    800054fc:	00813083          	ld	ra,8(sp)
    80005500:	01010113          	add	sp,sp,16
    80005504:	f28fd06f          	j	80002c2c <printf>
    80005508:	00006517          	auipc	a0,0x6
    8000550c:	fb850513          	add	a0,a0,-72 # 8000b4c0 <digits+0x900>
    80005510:	f1cfd0ef          	jal	80002c2c <printf>
    80005514:	00006517          	auipc	a0,0x6
    80005518:	fcc50513          	add	a0,a0,-52 # 8000b4e0 <digits+0x920>
    8000551c:	08040c63          	beqz	s0,800055b4 <handle_exception+0x134>
    80005520:	01843583          	ld	a1,24(s0)
    80005524:	00006517          	auipc	a0,0x6
    80005528:	fec50513          	add	a0,a0,-20 # 8000b510 <digits+0x950>
    8000552c:	fcdff06f          	j	800054f8 <handle_exception+0x78>
    80005530:	00013403          	ld	s0,0(sp)
    80005534:	00813083          	ld	ra,8(sp)
    80005538:	00006517          	auipc	a0,0x6
    8000553c:	00050513          	mv	a0,a0
    80005540:	01010113          	add	sp,sp,16
    80005544:	ee8fd06f          	j	80002c2c <printf>
    80005548:	00013403          	ld	s0,0(sp)
    8000554c:	00813083          	ld	ra,8(sp)
    80005550:	00006517          	auipc	a0,0x6
    80005554:	01850513          	add	a0,a0,24 # 8000b568 <digits+0x9a8>
    80005558:	01010113          	add	sp,sp,16
    8000555c:	ed0fd06f          	j	80002c2c <printf>
    80005560:	00013403          	ld	s0,0(sp)
    80005564:	00813083          	ld	ra,8(sp)
    80005568:	01010113          	add	sp,sp,16
    8000556c:	e61ff06f          	j	800053cc <handle_syscall>
    80005570:	00006517          	auipc	a0,0x6
    80005574:	dd050513          	add	a0,a0,-560 # 8000b340 <digits+0x780>
    80005578:	eb4fd0ef          	jal	80002c2c <printf>
    8000557c:	02040863          	beqz	s0,800055ac <handle_exception+0x12c>
    80005580:	143025f3          	csrr	a1,stval
    80005584:	00013403          	ld	s0,0(sp)
    80005588:	00813083          	ld	ra,8(sp)
    8000558c:	00006517          	auipc	a0,0x6
    80005590:	e1450513          	add	a0,a0,-492 # 8000b3a0 <digits+0x7e0>
    80005594:	01010113          	add	sp,sp,16
    80005598:	e94fd06f          	j	80002c2c <printf>
    8000559c:	00006517          	auipc	a0,0x6
    800055a0:	e3450513          	add	a0,a0,-460 # 8000b3d0 <digits+0x810>
    800055a4:	e88fd0ef          	jal	80002c2c <printf>
    800055a8:	fc041ce3          	bnez	s0,80005580 <handle_exception+0x100>
    800055ac:	00006517          	auipc	a0,0x6
    800055b0:	dbc50513          	add	a0,a0,-580 # 8000b368 <digits+0x7a8>
    800055b4:	00013403          	ld	s0,0(sp)
    800055b8:	00813083          	ld	ra,8(sp)
    800055bc:	01010113          	add	sp,sp,16
    800055c0:	9ddfd06f          	j	80002f9c <uart_puts>
    800055c4:	00006517          	auipc	a0,0x6
    800055c8:	e2450513          	add	a0,a0,-476 # 8000b3e8 <digits+0x828>
    800055cc:	e60fd0ef          	jal	80002c2c <printf>
    800055d0:	fc040ee3          	beqz	s0,800055ac <handle_exception+0x12c>
    800055d4:	143025f3          	csrr	a1,stval
    800055d8:	00013403          	ld	s0,0(sp)
    800055dc:	00813083          	ld	ra,8(sp)
    800055e0:	00006517          	auipc	a0,0x6
    800055e4:	e2850513          	add	a0,a0,-472 # 8000b408 <digits+0x848>
    800055e8:	01010113          	add	sp,sp,16
    800055ec:	e40fd06f          	j	80002c2c <printf>
    800055f0:	00058613          	mv	a2,a1
    800055f4:	00006517          	auipc	a0,0x6
    800055f8:	fa450513          	add	a0,a0,-92 # 8000b598 <digits+0x9d8>
    800055fc:	00070593          	mv	a1,a4
    80005600:	e2cfd06f          	j	80002c2c <printf>
    80005604:	00006517          	auipc	a0,0x6
    80005608:	e5450513          	add	a0,a0,-428 # 8000b458 <digits+0x898>
    8000560c:	fa9ff06f          	j	800055b4 <handle_exception+0x134>

0000000080005610 <kerneltrap>:
    80005610:	fe010113          	add	sp,sp,-32
    80005614:	00113c23          	sd	ra,24(sp)
    80005618:	00813823          	sd	s0,16(sp)
    8000561c:	00913423          	sd	s1,8(sp)
    80005620:	14202473          	csrr	s0,scause
    80005624:	141024f3          	csrr	s1,sepc
    80005628:	00006517          	auipc	a0,0x6
    8000562c:	f9850513          	add	a0,a0,-104 # 8000b5c0 <digits+0xa00>
    80005630:	00048613          	mv	a2,s1
    80005634:	00040593          	mv	a1,s0
    80005638:	df4fd0ef          	jal	80002c2c <printf>
    8000563c:	02044663          	bltz	s0,80005668 <kerneltrap+0x58>
    80005640:	00040593          	mv	a1,s0
    80005644:	00006517          	auipc	a0,0x6
    80005648:	fd450513          	add	a0,a0,-44 # 8000b618 <digits+0xa58>
    8000564c:	de0fd0ef          	jal	80002c2c <printf>
    80005650:	01013403          	ld	s0,16(sp)
    80005654:	01813083          	ld	ra,24(sp)
    80005658:	00048513          	mv	a0,s1
    8000565c:	00813483          	ld	s1,8(sp)
    80005660:	02010113          	add	sp,sp,32
    80005664:	e1dff06f          	j	80005480 <handle_exception>
    80005668:	969ff0ef          	jal	80004fd0 <devintr>
    8000566c:	00050c63          	beqz	a0,80005684 <kerneltrap+0x74>
    80005670:	01813083          	ld	ra,24(sp)
    80005674:	01013403          	ld	s0,16(sp)
    80005678:	00813483          	ld	s1,8(sp)
    8000567c:	02010113          	add	sp,sp,32
    80005680:	00008067          	ret
    80005684:	00f47593          	and	a1,s0,15
    80005688:	01013403          	ld	s0,16(sp)
    8000568c:	01813083          	ld	ra,24(sp)
    80005690:	00813483          	ld	s1,8(sp)
    80005694:	00006517          	auipc	a0,0x6
    80005698:	f5450513          	add	a0,a0,-172 # 8000b5e8 <digits+0xa28>
    8000569c:	02010113          	add	sp,sp,32
    800056a0:	d8cfd06f          	j	80002c2c <printf>

00000000800056a4 <handle_trap_page_fault>:
    800056a4:	00058793          	mv	a5,a1
    800056a8:	02050263          	beqz	a0,800056cc <handle_trap_page_fault+0x28>
    800056ac:	143025f3          	csrr	a1,stval
    800056b0:	00078863          	beqz	a5,800056c0 <handle_trap_page_fault+0x1c>
    800056b4:	00006517          	auipc	a0,0x6
    800056b8:	d5450513          	add	a0,a0,-684 # 8000b408 <digits+0x848>
    800056bc:	d70fd06f          	j	80002c2c <printf>
    800056c0:	00006517          	auipc	a0,0x6
    800056c4:	ce050513          	add	a0,a0,-800 # 8000b3a0 <digits+0x7e0>
    800056c8:	d64fd06f          	j	80002c2c <printf>
    800056cc:	00006517          	auipc	a0,0x6
    800056d0:	c9c50513          	add	a0,a0,-868 # 8000b368 <digits+0x7a8>
    800056d4:	8c9fd06f          	j	80002f9c <uart_puts>

00000000800056d8 <handle_illegal_instruction>:
    800056d8:	00050a63          	beqz	a0,800056ec <handle_illegal_instruction+0x14>
    800056dc:	01853583          	ld	a1,24(a0)
    800056e0:	00006517          	auipc	a0,0x6
    800056e4:	db050513          	add	a0,a0,-592 # 8000b490 <digits+0x8d0>
    800056e8:	d44fd06f          	j	80002c2c <printf>
    800056ec:	00006517          	auipc	a0,0x6
    800056f0:	d6c50513          	add	a0,a0,-660 # 8000b458 <digits+0x898>
    800056f4:	8a9fd06f          	j	80002f9c <uart_puts>

00000000800056f8 <handle_breakpoint>:
    800056f8:	00050a63          	beqz	a0,8000570c <handle_breakpoint+0x14>
    800056fc:	01853583          	ld	a1,24(a0)
    80005700:	00006517          	auipc	a0,0x6
    80005704:	e1050513          	add	a0,a0,-496 # 8000b510 <digits+0x950>
    80005708:	d24fd06f          	j	80002c2c <printf>
    8000570c:	00006517          	auipc	a0,0x6
    80005710:	dd450513          	add	a0,a0,-556 # 8000b4e0 <digits+0x920>
    80005714:	889fd06f          	j	80002f9c <uart_puts>

0000000080005718 <free_proc.part.0>:
    80005718:	fe010113          	add	sp,sp,-32
    8000571c:	00813823          	sd	s0,16(sp)
    80005720:	00913423          	sd	s1,8(sp)
    80005724:	00113c23          	sd	ra,24(sp)
    80005728:	00050493          	mv	s1,a0
    8000572c:	00422417          	auipc	s0,0x422
    80005730:	cb440413          	add	s0,s0,-844 # 804273e0 <proc_lock>
    80005734:	00100713          	li	a4,1
    80005738:	00070793          	mv	a5,a4
    8000573c:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80005740:	0007879b          	sext.w	a5,a5
    80005744:	fe079ae3          	bnez	a5,80005738 <free_proc.part.0+0x20>
    80005748:	0404b503          	ld	a0,64(s1)
    8000574c:	00050663          	beqz	a0,80005758 <free_proc.part.0+0x40>
    80005750:	e8cff0ef          	jal	80004ddc <free_trapframe>
    80005754:	0404b023          	sd	zero,64(s1)
    80005758:	0384b503          	ld	a0,56(s1)
    8000575c:	00050663          	beqz	a0,80005768 <free_proc.part.0+0x50>
    80005760:	905fd0ef          	jal	80003064 <free_page>
    80005764:	0204bc23          	sd	zero,56(s1)
    80005768:	0284b503          	ld	a0,40(s1)
    8000576c:	00050663          	beqz	a0,80005778 <free_proc.part.0+0x60>
    80005770:	d9dfd0ef          	jal	8000350c <destroy_pagetable>
    80005774:	0204b423          	sd	zero,40(s1)
    80005778:	0004a223          	sw	zero,4(s1)
    8000577c:	0004a423          	sw	zero,8(s1)
    80005780:	0f50000f          	fence	iorw,ow
    80005784:	0804202f          	amoswap.w	zero,zero,(s0)
    80005788:	01813083          	ld	ra,24(sp)
    8000578c:	01013403          	ld	s0,16(sp)
    80005790:	00813483          	ld	s1,8(sp)
    80005794:	02010113          	add	sp,sp,32
    80005798:	00008067          	ret

000000008000579c <strlen>:
    8000579c:	00054783          	lbu	a5,0(a0)
    800057a0:	02078463          	beqz	a5,800057c8 <strlen+0x2c>
    800057a4:	00150513          	add	a0,a0,1
    800057a8:	00050793          	mv	a5,a0
    800057ac:	0007c703          	lbu	a4,0(a5)
    800057b0:	00078693          	mv	a3,a5
    800057b4:	00178793          	add	a5,a5,1
    800057b8:	fe071ae3          	bnez	a4,800057ac <strlen+0x10>
    800057bc:	40a6853b          	subw	a0,a3,a0
    800057c0:	0015051b          	addw	a0,a0,1
    800057c4:	00008067          	ret
    800057c8:	00000513          	li	a0,0
    800057cc:	00008067          	ret

00000000800057d0 <proc_init>:
    800057d0:	ff010113          	add	sp,sp,-16
    800057d4:	00006517          	auipc	a0,0x6
    800057d8:	eac50513          	add	a0,a0,-340 # 8000b680 <digits+0xac0>
    800057dc:	00113423          	sd	ra,8(sp)
    800057e0:	fbcfd0ef          	jal	80002f9c <uart_puts>
    800057e4:	00422717          	auipc	a4,0x422
    800057e8:	bb470713          	add	a4,a4,-1100 # 80427398 <tickslock>
    800057ec:	00421797          	auipc	a5,0x421
    800057f0:	e2c78793          	add	a5,a5,-468 # 80426618 <proc>
    800057f4:	0007b023          	sd	zero,0(a5)
    800057f8:	00878793          	add	a5,a5,8
    800057fc:	fee79ce3          	bne	a5,a4,800057f4 <proc_init+0x24>
    80005800:	00100793          	li	a5,1
    80005804:	00006717          	auipc	a4,0x6
    80005808:	7ef72e23          	sw	a5,2044(a4) # 8000c000 <nextpid>
    8000580c:	00422797          	auipc	a5,0x422
    80005810:	bc07be23          	sd	zero,-1060(a5) # 804273e8 <current_proc>
    80005814:	00421797          	auipc	a5,0x421
    80005818:	e0878793          	add	a5,a5,-504 # 8042661c <proc+0x4>
    8000581c:	00422717          	auipc	a4,0x422
    80005820:	b8070713          	add	a4,a4,-1152 # 8042739c <tickslock+0x4>
    80005824:	0007a023          	sw	zero,0(a5)
    80005828:	0007b223          	sd	zero,4(a5)
    8000582c:	0d878793          	add	a5,a5,216
    80005830:	fee79ae3          	bne	a5,a4,80005824 <proc_init+0x54>
    80005834:	00813083          	ld	ra,8(sp)
    80005838:	00006517          	auipc	a0,0x6
    8000583c:	e7050513          	add	a0,a0,-400 # 8000b6a8 <digits+0xae8>
    80005840:	01010113          	add	sp,sp,16
    80005844:	f58fd06f          	j	80002f9c <uart_puts>

0000000080005848 <alloc_proc>:
    80005848:	fd010113          	add	sp,sp,-48
    8000584c:	00913c23          	sd	s1,24(sp)
    80005850:	02113423          	sd	ra,40(sp)
    80005854:	02813023          	sd	s0,32(sp)
    80005858:	01213823          	sd	s2,16(sp)
    8000585c:	01313423          	sd	s3,8(sp)
    80005860:	01413023          	sd	s4,0(sp)
    80005864:	00422497          	auipc	s1,0x422
    80005868:	b7c48493          	add	s1,s1,-1156 # 804273e0 <proc_lock>
    8000586c:	00100713          	li	a4,1
    80005870:	00070793          	mv	a5,a4
    80005874:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005878:	0007879b          	sext.w	a5,a5
    8000587c:	fe079ae3          	bnez	a5,80005870 <alloc_proc+0x28>
    80005880:	00421797          	auipc	a5,0x421
    80005884:	d9c78793          	add	a5,a5,-612 # 8042661c <proc+0x4>
    80005888:	00000413          	li	s0,0
    8000588c:	01000693          	li	a3,16
    80005890:	0007a703          	lw	a4,0(a5)
    80005894:	0d878793          	add	a5,a5,216
    80005898:	02070463          	beqz	a4,800058c0 <alloc_proc+0x78>
    8000589c:	0014041b          	addw	s0,s0,1
    800058a0:	fed418e3          	bne	s0,a3,80005890 <alloc_proc+0x48>
    800058a4:	0f50000f          	fence	iorw,ow
    800058a8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800058ac:	00006517          	auipc	a0,0x6
    800058b0:	e9c50513          	add	a0,a0,-356 # 8000b748 <digits+0xb88>
    800058b4:	ee8fd0ef          	jal	80002f9c <uart_puts>
    800058b8:	00000993          	li	s3,0
    800058bc:	0a40006f          	j	80005960 <alloc_proc+0x118>
    800058c0:	0d800913          	li	s2,216
    800058c4:	03240933          	mul	s2,s0,s2
    800058c8:	00006717          	auipc	a4,0x6
    800058cc:	73870713          	add	a4,a4,1848 # 8000c000 <nextpid>
    800058d0:	00072783          	lw	a5,0(a4)
    800058d4:	00421a17          	auipc	s4,0x421
    800058d8:	d44a0a13          	add	s4,s4,-700 # 80426618 <proc>
    800058dc:	0017869b          	addw	a3,a5,1
    800058e0:	00d72023          	sw	a3,0(a4)
    800058e4:	00100713          	li	a4,1
    800058e8:	012a09b3          	add	s3,s4,s2
    800058ec:	0209b023          	sd	zero,32(s3)
    800058f0:	00e9a223          	sw	a4,4(s3)
    800058f4:	00f9a423          	sw	a5,8(s3)
    800058f8:	0009a623          	sw	zero,12(s3)
    800058fc:	c80ff0ef          	jal	80004d7c <alloc_trapframe>
    80005900:	04a9b023          	sd	a0,64(s3)
    80005904:	08050063          	beqz	a0,80005984 <alloc_proc+0x13c>
    80005908:	f40fd0ef          	jal	80003048 <alloc_page>
    8000590c:	05090793          	add	a5,s2,80
    80005910:	00fa07b3          	add	a5,s4,a5
    80005914:	02a9bc23          	sd	a0,56(s3)
    80005918:	07078713          	add	a4,a5,112
    8000591c:	08050263          	beqz	a0,800059a0 <alloc_proc+0x158>
    80005920:	0007b023          	sd	zero,0(a5)
    80005924:	00878793          	add	a5,a5,8
    80005928:	fee79ce3          	bne	a5,a4,80005920 <alloc_proc+0xd8>
    8000592c:	0d800793          	li	a5,216
    80005930:	02f40433          	mul	s0,s0,a5
    80005934:	00001737          	lui	a4,0x1
    80005938:	00006517          	auipc	a0,0x6
    8000593c:	de850513          	add	a0,a0,-536 # 8000b720 <digits+0xb60>
    80005940:	008a0a33          	add	s4,s4,s0
    80005944:	038a3783          	ld	a5,56(s4)
    80005948:	008a2583          	lw	a1,8(s4)
    8000594c:	00e787b3          	add	a5,a5,a4
    80005950:	04fa3c23          	sd	a5,88(s4)
    80005954:	ad8fd0ef          	jal	80002c2c <printf>
    80005958:	0f50000f          	fence	iorw,ow
    8000595c:	0804a02f          	amoswap.w	zero,zero,(s1)
    80005960:	02813083          	ld	ra,40(sp)
    80005964:	02013403          	ld	s0,32(sp)
    80005968:	01813483          	ld	s1,24(sp)
    8000596c:	01013903          	ld	s2,16(sp)
    80005970:	00013a03          	ld	s4,0(sp)
    80005974:	00098513          	mv	a0,s3
    80005978:	00813983          	ld	s3,8(sp)
    8000597c:	03010113          	add	sp,sp,48
    80005980:	00008067          	ret
    80005984:	00006517          	auipc	a0,0x6
    80005988:	d4c50513          	add	a0,a0,-692 # 8000b6d0 <digits+0xb10>
    8000598c:	e10fd0ef          	jal	80002f9c <uart_puts>
    80005990:	0f50000f          	fence	iorw,ow
    80005994:	0804a02f          	amoswap.w	zero,zero,(s1)
    80005998:	00000993          	li	s3,0
    8000599c:	fc5ff06f          	j	80005960 <alloc_proc+0x118>
    800059a0:	00006517          	auipc	a0,0x6
    800059a4:	d5850513          	add	a0,a0,-680 # 8000b6f8 <digits+0xb38>
    800059a8:	df4fd0ef          	jal	80002f9c <uart_puts>
    800059ac:	0409b503          	ld	a0,64(s3)
    800059b0:	c2cff0ef          	jal	80004ddc <free_trapframe>
    800059b4:	0f50000f          	fence	iorw,ow
    800059b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800059bc:	00000993          	li	s3,0
    800059c0:	fa1ff06f          	j	80005960 <alloc_proc+0x118>

00000000800059c4 <free_proc>:
    800059c4:	00050463          	beqz	a0,800059cc <free_proc+0x8>
    800059c8:	d51ff06f          	j	80005718 <free_proc.part.0>
    800059cc:	00008067          	ret

00000000800059d0 <find_proc>:
    800059d0:	00421797          	auipc	a5,0x421
    800059d4:	c4c78793          	add	a5,a5,-948 # 8042661c <proc+0x4>
    800059d8:	00000713          	li	a4,0
    800059dc:	01000613          	li	a2,16
    800059e0:	0100006f          	j	800059f0 <find_proc+0x20>
    800059e4:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    800059e8:	0d878793          	add	a5,a5,216
    800059ec:	02c70663          	beq	a4,a2,80005a18 <find_proc+0x48>
    800059f0:	0047a683          	lw	a3,4(a5)
    800059f4:	fea698e3          	bne	a3,a0,800059e4 <find_proc+0x14>
    800059f8:	0007a683          	lw	a3,0(a5)
    800059fc:	fe0684e3          	beqz	a3,800059e4 <find_proc+0x14>
    80005a00:	0d800793          	li	a5,216
    80005a04:	02f70733          	mul	a4,a4,a5
    80005a08:	00421797          	auipc	a5,0x421
    80005a0c:	c1078793          	add	a5,a5,-1008 # 80426618 <proc>
    80005a10:	00f70533          	add	a0,a4,a5
    80005a14:	00008067          	ret
    80005a18:	00000513          	li	a0,0
    80005a1c:	00008067          	ret

0000000080005a20 <proc_set_kernel_stack>:
    80005a20:	00050a63          	beqz	a0,80005a34 <proc_set_kernel_stack+0x14>
    80005a24:	000017b7          	lui	a5,0x1
    80005a28:	00f587b3          	add	a5,a1,a5
    80005a2c:	02b53c23          	sd	a1,56(a0)
    80005a30:	04f53c23          	sd	a5,88(a0)
    80005a34:	00008067          	ret

0000000080005a38 <proc_mark_runnable>:
    80005a38:	02050263          	beqz	a0,80005a5c <proc_mark_runnable+0x24>
    80005a3c:	00452783          	lw	a5,4(a0)
    80005a40:	00100713          	li	a4,1
    80005a44:	ffe7869b          	addw	a3,a5,-2 # ffe <_entry-0x7ffff002>
    80005a48:	00d77a63          	bgeu	a4,a3,80005a5c <proc_mark_runnable+0x24>
    80005a4c:	00500713          	li	a4,5
    80005a50:	00e78663          	beq	a5,a4,80005a5c <proc_mark_runnable+0x24>
    80005a54:	00200793          	li	a5,2
    80005a58:	00f52223          	sw	a5,4(a0)
    80005a5c:	00008067          	ret

0000000080005a60 <proc_mark_sleeping>:
    80005a60:	00050863          	beqz	a0,80005a70 <proc_mark_sleeping+0x10>
    80005a64:	00452703          	lw	a4,4(a0)
    80005a68:	00300793          	li	a5,3
    80005a6c:	00f70463          	beq	a4,a5,80005a74 <proc_mark_sleeping+0x14>
    80005a70:	00008067          	ret
    80005a74:	00400793          	li	a5,4
    80005a78:	00f52223          	sw	a5,4(a0)
    80005a7c:	0cb53423          	sd	a1,200(a0)
    80005a80:	00008067          	ret

0000000080005a84 <proc_mark_zombie>:
    80005a84:	00050c63          	beqz	a0,80005a9c <proc_mark_zombie+0x18>
    80005a88:	00452703          	lw	a4,4(a0)
    80005a8c:	00500793          	li	a5,5
    80005a90:	00f70663          	beq	a4,a5,80005a9c <proc_mark_zombie+0x18>
    80005a94:	00f52223          	sw	a5,4(a0)
    80005a98:	02b52023          	sw	a1,32(a0)
    80005a9c:	00008067          	ret

0000000080005aa0 <get_pid>:
    80005aa0:	00422797          	auipc	a5,0x422
    80005aa4:	9487b783          	ld	a5,-1720(a5) # 804273e8 <current_proc>
    80005aa8:	00078663          	beqz	a5,80005ab4 <get_pid+0x14>
    80005aac:	0087a503          	lw	a0,8(a5)
    80005ab0:	00008067          	ret
    80005ab4:	fff00513          	li	a0,-1
    80005ab8:	00008067          	ret

0000000080005abc <get_current_proc>:
    80005abc:	00422517          	auipc	a0,0x422
    80005ac0:	92c53503          	ld	a0,-1748(a0) # 804273e8 <current_proc>
    80005ac4:	00008067          	ret

0000000080005ac8 <myproc>:
    80005ac8:	00422517          	auipc	a0,0x422
    80005acc:	92053503          	ld	a0,-1760(a0) # 804273e8 <current_proc>
    80005ad0:	00008067          	ret

0000000080005ad4 <set_current_proc>:
    80005ad4:	00422797          	auipc	a5,0x422
    80005ad8:	90a7ba23          	sd	a0,-1772(a5) # 804273e8 <current_proc>
    80005adc:	00008067          	ret

0000000080005ae0 <allocuvm>:
    80005ae0:	00060513          	mv	a0,a2
    80005ae4:	00008067          	ret

0000000080005ae8 <deallocuvm>:
    80005ae8:	00060513          	mv	a0,a2
    80005aec:	00008067          	ret

0000000080005af0 <switchuvm>:
    80005af0:	00008067          	ret

0000000080005af4 <scheduler>:
    80005af4:	fa010113          	add	sp,sp,-96
    80005af8:	04813823          	sd	s0,80(sp)
    80005afc:	00422417          	auipc	s0,0x422
    80005b00:	8e040413          	add	s0,s0,-1824 # 804273dc <scheduler_initialized>
    80005b04:	00042783          	lw	a5,0(s0)
    80005b08:	04113c23          	sd	ra,88(sp)
    80005b0c:	04913423          	sd	s1,72(sp)
    80005b10:	05213023          	sd	s2,64(sp)
    80005b14:	03313c23          	sd	s3,56(sp)
    80005b18:	03413823          	sd	s4,48(sp)
    80005b1c:	03513423          	sd	s5,40(sp)
    80005b20:	03613023          	sd	s6,32(sp)
    80005b24:	01713c23          	sd	s7,24(sp)
    80005b28:	01813823          	sd	s8,16(sp)
    80005b2c:	01913423          	sd	s9,8(sp)
    80005b30:	01a13023          	sd	s10,0(sp)
    80005b34:	0e078463          	beqz	a5,80005c1c <scheduler+0x128>
    80005b38:	00422497          	auipc	s1,0x422
    80005b3c:	8a048493          	add	s1,s1,-1888 # 804273d8 <last_index.0>
    80005b40:	00421c17          	auipc	s8,0x421
    80005b44:	ad8c0c13          	add	s8,s8,-1320 # 80426618 <proc>
    80005b48:	00421b17          	auipc	s6,0x421
    80005b4c:	9e0b0b13          	add	s6,s6,-1568 # 80426528 <cpus>
    80005b50:	00422a97          	auipc	s5,0x422
    80005b54:	898a8a93          	add	s5,s5,-1896 # 804273e8 <current_proc>
    80005b58:	0d800d13          	li	s10,216
    80005b5c:	00200c93          	li	s9,2
    80005b60:	00300a13          	li	s4,3
    80005b64:	00006997          	auipc	s3,0x6
    80005b68:	c2498993          	add	s3,s3,-988 # 8000b788 <digits+0xbc8>
    80005b6c:	00421917          	auipc	s2,0x421
    80005b70:	a3c90913          	add	s2,s2,-1476 # 804265a8 <scheduler_context>
    80005b74:	aacff0ef          	jal	80004e20 <intr_on>
    80005b78:	0004a783          	lw	a5,0(s1)
    80005b7c:	0107861b          	addw	a2,a5,16
    80005b80:	0080006f          	j	80005b88 <scheduler+0x94>
    80005b84:	fef608e3          	beq	a2,a5,80005b74 <scheduler+0x80>
    80005b88:	41f7d71b          	sraw	a4,a5,0x1f
    80005b8c:	01c7571b          	srlw	a4,a4,0x1c
    80005b90:	00f7043b          	addw	s0,a4,a5
    80005b94:	00f47413          	and	s0,s0,15
    80005b98:	40e40bbb          	subw	s7,s0,a4
    80005b9c:	000b8413          	mv	s0,s7
    80005ba0:	03ab8bb3          	mul	s7,s7,s10
    80005ba4:	0017879b          	addw	a5,a5,1
    80005ba8:	017c0733          	add	a4,s8,s7
    80005bac:	00472683          	lw	a3,4(a4)
    80005bb0:	fd969ae3          	bne	a3,s9,80005b84 <scheduler+0x90>
    80005bb4:	00872583          	lw	a1,8(a4)
    80005bb8:	00098513          	mv	a0,s3
    80005bbc:	01472223          	sw	s4,4(a4)
    80005bc0:	00eb3023          	sd	a4,0(s6)
    80005bc4:	00eab023          	sd	a4,0(s5)
    80005bc8:	00422797          	auipc	a5,0x422
    80005bcc:	8007ae23          	sw	zero,-2020(a5) # 804273e4 <need_resched>
    80005bd0:	85cfd0ef          	jal	80002c2c <printf>
    80005bd4:	a5cff0ef          	jal	80004e30 <intr_off>
    80005bd8:	050b8593          	add	a1,s7,80 # 1050 <_entry-0x7fffefb0>
    80005bdc:	00bc05b3          	add	a1,s8,a1
    80005be0:	00090513          	mv	a0,s2
    80005be4:	07c010ef          	jal	80006c60 <switch_context>
    80005be8:	0014041b          	addw	s0,s0,1
    80005bec:	a34ff0ef          	jal	80004e20 <intr_on>
    80005bf0:	41f4571b          	sraw	a4,s0,0x1f
    80005bf4:	01c7571b          	srlw	a4,a4,0x1c
    80005bf8:	00e4043b          	addw	s0,s0,a4
    80005bfc:	00f47793          	and	a5,s0,15
    80005c00:	40e787bb          	subw	a5,a5,a4
    80005c04:	00f4a023          	sw	a5,0(s1)
    80005c08:	00421717          	auipc	a4,0x421
    80005c0c:	92073023          	sd	zero,-1760(a4) # 80426528 <cpus>
    80005c10:	00421717          	auipc	a4,0x421
    80005c14:	7c073c23          	sd	zero,2008(a4) # 804273e8 <current_proc>
    80005c18:	f5dff06f          	j	80005b74 <scheduler+0x80>
    80005c1c:	00006517          	auipc	a0,0x6
    80005c20:	b4c50513          	add	a0,a0,-1204 # 8000b768 <digits+0xba8>
    80005c24:	b78fd0ef          	jal	80002f9c <uart_puts>
    80005c28:	00100793          	li	a5,1
    80005c2c:	00f42023          	sw	a5,0(s0)
    80005c30:	f09ff06f          	j	80005b38 <scheduler+0x44>

0000000080005c34 <yield>:
    80005c34:	fe010113          	add	sp,sp,-32
    80005c38:	00813823          	sd	s0,16(sp)
    80005c3c:	00113c23          	sd	ra,24(sp)
    80005c40:	00913423          	sd	s1,8(sp)
    80005c44:	00421417          	auipc	s0,0x421
    80005c48:	7a443403          	ld	s0,1956(s0) # 804273e8 <current_proc>
    80005c4c:	06040263          	beqz	s0,80005cb0 <yield+0x7c>
    80005c50:	9f0ff0ef          	jal	80004e40 <intr_get>
    80005c54:	00050493          	mv	s1,a0
    80005c58:	9d8ff0ef          	jal	80004e30 <intr_off>
    80005c5c:	00421717          	auipc	a4,0x421
    80005c60:	78470713          	add	a4,a4,1924 # 804273e0 <proc_lock>
    80005c64:	00100693          	li	a3,1
    80005c68:	00068793          	mv	a5,a3
    80005c6c:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80005c70:	0007879b          	sext.w	a5,a5
    80005c74:	fe079ae3          	bnez	a5,80005c68 <yield+0x34>
    80005c78:	00442683          	lw	a3,4(s0)
    80005c7c:	00300793          	li	a5,3
    80005c80:	04f68263          	beq	a3,a5,80005cc4 <yield+0x90>
    80005c84:	0f50000f          	fence	iorw,ow
    80005c88:	0807202f          	amoswap.w	zero,zero,(a4)
    80005c8c:	00842583          	lw	a1,8(s0)
    80005c90:	00006517          	auipc	a0,0x6
    80005c94:	b2850513          	add	a0,a0,-1240 # 8000b7b8 <digits+0xbf8>
    80005c98:	f95fc0ef          	jal	80002c2c <printf>
    80005c9c:	00421597          	auipc	a1,0x421
    80005ca0:	90c58593          	add	a1,a1,-1780 # 804265a8 <scheduler_context>
    80005ca4:	05040513          	add	a0,s0,80
    80005ca8:	7b9000ef          	jal	80006c60 <switch_context>
    80005cac:	02049263          	bnez	s1,80005cd0 <yield+0x9c>
    80005cb0:	01813083          	ld	ra,24(sp)
    80005cb4:	01013403          	ld	s0,16(sp)
    80005cb8:	00813483          	ld	s1,8(sp)
    80005cbc:	02010113          	add	sp,sp,32
    80005cc0:	00008067          	ret
    80005cc4:	00200793          	li	a5,2
    80005cc8:	00f42223          	sw	a5,4(s0)
    80005ccc:	fb9ff06f          	j	80005c84 <yield+0x50>
    80005cd0:	01013403          	ld	s0,16(sp)
    80005cd4:	01813083          	ld	ra,24(sp)
    80005cd8:	00813483          	ld	s1,8(sp)
    80005cdc:	02010113          	add	sp,sp,32
    80005ce0:	940ff06f          	j	80004e20 <intr_on>

0000000080005ce4 <fork>:
    80005ce4:	fe010113          	add	sp,sp,-32
    80005ce8:	00913423          	sd	s1,8(sp)
    80005cec:	00113c23          	sd	ra,24(sp)
    80005cf0:	00813823          	sd	s0,16(sp)
    80005cf4:	00421497          	auipc	s1,0x421
    80005cf8:	6f44b483          	ld	s1,1780(s1) # 804273e8 <current_proc>
    80005cfc:	08048a63          	beqz	s1,80005d90 <fork+0xac>
    80005d00:	b49ff0ef          	jal	80005848 <alloc_proc>
    80005d04:	00050413          	mv	s0,a0
    80005d08:	08050e63          	beqz	a0,80005da4 <fork+0xc0>
    80005d0c:	0084a703          	lw	a4,8(s1)
    80005d10:	0284b783          	ld	a5,40(s1)
    80005d14:	0c953023          	sd	s1,192(a0)
    80005d18:	00e52623          	sw	a4,12(a0)
    80005d1c:	00078863          	beqz	a5,80005d2c <fork+0x48>
    80005d20:	cf4fd0ef          	jal	80003214 <create_pagetable>
    80005d24:	02a43423          	sd	a0,40(s0)
    80005d28:	08050863          	beqz	a0,80005db8 <fork+0xd4>
    80005d2c:	0404b783          	ld	a5,64(s1)
    80005d30:	02078663          	beqz	a5,80005d5c <fork+0x78>
    80005d34:	04043703          	ld	a4,64(s0)
    80005d38:	02070263          	beqz	a4,80005d5c <fork+0x78>
    80005d3c:	12078613          	add	a2,a5,288
    80005d40:	0007c683          	lbu	a3,0(a5)
    80005d44:	00178793          	add	a5,a5,1
    80005d48:	00170713          	add	a4,a4,1
    80005d4c:	fed70fa3          	sb	a3,-1(a4)
    80005d50:	fec798e3          	bne	a5,a2,80005d40 <fork+0x5c>
    80005d54:	04043783          	ld	a5,64(s0)
    80005d58:	0607b823          	sd	zero,112(a5)
    80005d5c:	0084a603          	lw	a2,8(s1)
    80005d60:	00842583          	lw	a1,8(s0)
    80005d64:	00200793          	li	a5,2
    80005d68:	00f42223          	sw	a5,4(s0)
    80005d6c:	00006517          	auipc	a0,0x6
    80005d70:	ac450513          	add	a0,a0,-1340 # 8000b830 <digits+0xc70>
    80005d74:	eb9fc0ef          	jal	80002c2c <printf>
    80005d78:	00842503          	lw	a0,8(s0)
    80005d7c:	01813083          	ld	ra,24(sp)
    80005d80:	01013403          	ld	s0,16(sp)
    80005d84:	00813483          	ld	s1,8(sp)
    80005d88:	02010113          	add	sp,sp,32
    80005d8c:	00008067          	ret
    80005d90:	00006517          	auipc	a0,0x6
    80005d94:	a4850513          	add	a0,a0,-1464 # 8000b7d8 <digits+0xc18>
    80005d98:	a04fd0ef          	jal	80002f9c <uart_puts>
    80005d9c:	fff00513          	li	a0,-1
    80005da0:	fddff06f          	j	80005d7c <fork+0x98>
    80005da4:	00006517          	auipc	a0,0x6
    80005da8:	a5c50513          	add	a0,a0,-1444 # 8000b800 <digits+0xc40>
    80005dac:	9f0fd0ef          	jal	80002f9c <uart_puts>
    80005db0:	fff00513          	li	a0,-1
    80005db4:	fc9ff06f          	j	80005d7c <fork+0x98>
    80005db8:	00040513          	mv	a0,s0
    80005dbc:	95dff0ef          	jal	80005718 <free_proc.part.0>
    80005dc0:	fff00513          	li	a0,-1
    80005dc4:	fb9ff06f          	j	80005d7c <fork+0x98>

0000000080005dc8 <exit>:
    80005dc8:	00421697          	auipc	a3,0x421
    80005dcc:	6206b683          	ld	a3,1568(a3) # 804273e8 <current_proc>
    80005dd0:	08068e63          	beqz	a3,80005e6c <exit+0xa4>
    80005dd4:	ff010113          	add	sp,sp,-16
    80005dd8:	00813023          	sd	s0,0(sp)
    80005ddc:	00113423          	sd	ra,8(sp)
    80005de0:	00050613          	mv	a2,a0
    80005de4:	00421417          	auipc	s0,0x421
    80005de8:	5fc40413          	add	s0,s0,1532 # 804273e0 <proc_lock>
    80005dec:	00100713          	li	a4,1
    80005df0:	00070793          	mv	a5,a4
    80005df4:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80005df8:	0007879b          	sext.w	a5,a5
    80005dfc:	fe079ae3          	bnez	a5,80005df0 <exit+0x28>
    80005e00:	00500793          	li	a5,5
    80005e04:	00f6a223          	sw	a5,4(a3)
    80005e08:	02c6a023          	sw	a2,32(a3)
    80005e0c:	00421797          	auipc	a5,0x421
    80005e10:	8cc78793          	add	a5,a5,-1844 # 804266d8 <proc+0xc0>
    80005e14:	00421597          	auipc	a1,0x421
    80005e18:	64458593          	add	a1,a1,1604 # 80427458 <bss_end+0x68>
    80005e1c:	00100513          	li	a0,1
    80005e20:	00c0006f          	j	80005e2c <exit+0x64>
    80005e24:	0d878793          	add	a5,a5,216
    80005e28:	00b78e63          	beq	a5,a1,80005e44 <exit+0x7c>
    80005e2c:	0007b703          	ld	a4,0(a5)
    80005e30:	fed71ae3          	bne	a4,a3,80005e24 <exit+0x5c>
    80005e34:	0007b023          	sd	zero,0(a5)
    80005e38:	f4a7a623          	sw	a0,-180(a5)
    80005e3c:	0d878793          	add	a5,a5,216
    80005e40:	feb796e3          	bne	a5,a1,80005e2c <exit+0x64>
    80005e44:	0086a583          	lw	a1,8(a3)
    80005e48:	00006517          	auipc	a0,0x6
    80005e4c:	a1850513          	add	a0,a0,-1512 # 8000b860 <digits+0xca0>
    80005e50:	dddfc0ef          	jal	80002c2c <printf>
    80005e54:	0f50000f          	fence	iorw,ow
    80005e58:	0804202f          	amoswap.w	zero,zero,(s0)
    80005e5c:	00013403          	ld	s0,0(sp)
    80005e60:	00813083          	ld	ra,8(sp)
    80005e64:	01010113          	add	sp,sp,16
    80005e68:	dcdff06f          	j	80005c34 <yield>
    80005e6c:	00008067          	ret

0000000080005e70 <wait>:
    80005e70:	fa010113          	add	sp,sp,-96
    80005e74:	05213023          	sd	s2,64(sp)
    80005e78:	00421917          	auipc	s2,0x421
    80005e7c:	57090913          	add	s2,s2,1392 # 804273e8 <current_proc>
    80005e80:	03413823          	sd	s4,48(sp)
    80005e84:	00093a03          	ld	s4,0(s2)
    80005e88:	04113c23          	sd	ra,88(sp)
    80005e8c:	04813823          	sd	s0,80(sp)
    80005e90:	04913423          	sd	s1,72(sp)
    80005e94:	03313c23          	sd	s3,56(sp)
    80005e98:	03513423          	sd	s5,40(sp)
    80005e9c:	03613023          	sd	s6,32(sp)
    80005ea0:	01713c23          	sd	s7,24(sp)
    80005ea4:	01813823          	sd	s8,16(sp)
    80005ea8:	01913423          	sd	s9,8(sp)
    80005eac:	100a0463          	beqz	s4,80005fb4 <wait+0x144>
    80005eb0:	00050493          	mv	s1,a0
    80005eb4:	00421417          	auipc	s0,0x421
    80005eb8:	52c40413          	add	s0,s0,1324 # 804273e0 <proc_lock>
    80005ebc:	00100a93          	li	s5,1
    80005ec0:	00500c13          	li	s8,5
    80005ec4:	01000b13          	li	s6,16
    80005ec8:	00421b97          	auipc	s7,0x421
    80005ecc:	4d4b8b93          	add	s7,s7,1236 # 8042739c <tickslock+0x4>
    80005ed0:	00400993          	li	s3,4
    80005ed4:	000a8793          	mv	a5,s5
    80005ed8:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80005edc:	0007879b          	sext.w	a5,a5
    80005ee0:	fe079ae3          	bnez	a5,80005ed4 <wait+0x64>
    80005ee4:	00420797          	auipc	a5,0x420
    80005ee8:	73878793          	add	a5,a5,1848 # 8042661c <proc+0x4>
    80005eec:	00078713          	mv	a4,a5
    80005ef0:	00000693          	li	a3,0
    80005ef4:	0100006f          	j	80005f04 <wait+0x94>
    80005ef8:	0016869b          	addw	a3,a3,1
    80005efc:	0d870713          	add	a4,a4,216
    80005f00:	09668e63          	beq	a3,s6,80005f9c <wait+0x12c>
    80005f04:	0bc73603          	ld	a2,188(a4)
    80005f08:	ff4618e3          	bne	a2,s4,80005ef8 <wait+0x88>
    80005f0c:	00072603          	lw	a2,0(a4)
    80005f10:	ff8614e3          	bne	a2,s8,80005ef8 <wait+0x88>
    80005f14:	0d800793          	li	a5,216
    80005f18:	02f686b3          	mul	a3,a3,a5
    80005f1c:	00420797          	auipc	a5,0x420
    80005f20:	6fc78793          	add	a5,a5,1788 # 80426618 <proc>
    80005f24:	00f68533          	add	a0,a3,a5
    80005f28:	00852903          	lw	s2,8(a0)
    80005f2c:	00048663          	beqz	s1,80005f38 <wait+0xc8>
    80005f30:	02052783          	lw	a5,32(a0)
    80005f34:	00f4a023          	sw	a5,0(s1)
    80005f38:	fe0ff0ef          	jal	80005718 <free_proc.part.0>
    80005f3c:	00090593          	mv	a1,s2
    80005f40:	00006517          	auipc	a0,0x6
    80005f44:	95050513          	add	a0,a0,-1712 # 8000b890 <digits+0xcd0>
    80005f48:	ce5fc0ef          	jal	80002c2c <printf>
    80005f4c:	0f50000f          	fence	iorw,ow
    80005f50:	0804202f          	amoswap.w	zero,zero,(s0)
    80005f54:	05813083          	ld	ra,88(sp)
    80005f58:	05013403          	ld	s0,80(sp)
    80005f5c:	04813483          	ld	s1,72(sp)
    80005f60:	03813983          	ld	s3,56(sp)
    80005f64:	03013a03          	ld	s4,48(sp)
    80005f68:	02813a83          	ld	s5,40(sp)
    80005f6c:	02013b03          	ld	s6,32(sp)
    80005f70:	01813b83          	ld	s7,24(sp)
    80005f74:	01013c03          	ld	s8,16(sp)
    80005f78:	00813c83          	ld	s9,8(sp)
    80005f7c:	00090513          	mv	a0,s2
    80005f80:	04013903          	ld	s2,64(sp)
    80005f84:	06010113          	add	sp,sp,96
    80005f88:	00008067          	ret
    80005f8c:	0007a703          	lw	a4,0(a5)
    80005f90:	02071663          	bnez	a4,80005fbc <wait+0x14c>
    80005f94:	0d878793          	add	a5,a5,216
    80005f98:	01778a63          	beq	a5,s7,80005fac <wait+0x13c>
    80005f9c:	0bc7b703          	ld	a4,188(a5)
    80005fa0:	ff4706e3          	beq	a4,s4,80005f8c <wait+0x11c>
    80005fa4:	0d878793          	add	a5,a5,216
    80005fa8:	ff779ae3          	bne	a5,s7,80005f9c <wait+0x12c>
    80005fac:	0f50000f          	fence	iorw,ow
    80005fb0:	0804202f          	amoswap.w	zero,zero,(s0)
    80005fb4:	fff00913          	li	s2,-1
    80005fb8:	f9dff06f          	j	80005f54 <wait+0xe4>
    80005fbc:	00093c83          	ld	s9,0(s2)
    80005fc0:	0f50000f          	fence	iorw,ow
    80005fc4:	0804202f          	amoswap.w	zero,zero,(s0)
    80005fc8:	0d4cb423          	sd	s4,200(s9)
    80005fcc:	013ca223          	sw	s3,4(s9)
    80005fd0:	c65ff0ef          	jal	80005c34 <yield>
    80005fd4:	0c0cb423          	sd	zero,200(s9)
    80005fd8:	000a8793          	mv	a5,s5
    80005fdc:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80005fe0:	0007879b          	sext.w	a5,a5
    80005fe4:	fe079ae3          	bnez	a5,80005fd8 <wait+0x168>
    80005fe8:	0f50000f          	fence	iorw,ow
    80005fec:	0804202f          	amoswap.w	zero,zero,(s0)
    80005ff0:	ee5ff06f          	j	80005ed4 <wait+0x64>

0000000080005ff4 <kill>:
    80005ff4:	00420797          	auipc	a5,0x420
    80005ff8:	62878793          	add	a5,a5,1576 # 8042661c <proc+0x4>
    80005ffc:	00000713          	li	a4,0
    80006000:	01000613          	li	a2,16
    80006004:	0100006f          	j	80006014 <kill+0x20>
    80006008:	0017071b          	addw	a4,a4,1
    8000600c:	0d878793          	add	a5,a5,216
    80006010:	06c70663          	beq	a4,a2,8000607c <kill+0x88>
    80006014:	0047a683          	lw	a3,4(a5)
    80006018:	fea698e3          	bne	a3,a0,80006008 <kill+0x14>
    8000601c:	0007a683          	lw	a3,0(a5)
    80006020:	fe0684e3          	beqz	a3,80006008 <kill+0x14>
    80006024:	00421697          	auipc	a3,0x421
    80006028:	3bc68693          	add	a3,a3,956 # 804273e0 <proc_lock>
    8000602c:	00100613          	li	a2,1
    80006030:	00060793          	mv	a5,a2
    80006034:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80006038:	0007879b          	sext.w	a5,a5
    8000603c:	fe079ae3          	bnez	a5,80006030 <kill+0x3c>
    80006040:	0d800793          	li	a5,216
    80006044:	02f70733          	mul	a4,a4,a5
    80006048:	00420797          	auipc	a5,0x420
    8000604c:	5d078793          	add	a5,a5,1488 # 80426618 <proc>
    80006050:	00100593          	li	a1,1
    80006054:	00400613          	li	a2,4
    80006058:	00e787b3          	add	a5,a5,a4
    8000605c:	0047a703          	lw	a4,4(a5)
    80006060:	02b7a223          	sw	a1,36(a5)
    80006064:	00c71663          	bne	a4,a2,80006070 <kill+0x7c>
    80006068:	00200713          	li	a4,2
    8000606c:	00e7a223          	sw	a4,4(a5)
    80006070:	0f50000f          	fence	iorw,ow
    80006074:	0806a02f          	amoswap.w	zero,zero,(a3)
    80006078:	00008067          	ret
    8000607c:	00008067          	ret

0000000080006080 <growproc>:
    80006080:	00421717          	auipc	a4,0x421
    80006084:	36873703          	ld	a4,872(a4) # 804273e8 <current_proc>
    80006088:	03073783          	ld	a5,48(a4)
    8000608c:	00a05c63          	blez	a0,800060a4 <growproc+0x24>
    80006090:	00a787b3          	add	a5,a5,a0
    80006094:	02078063          	beqz	a5,800060b4 <growproc+0x34>
    80006098:	02f73823          	sd	a5,48(a4)
    8000609c:	00000513          	li	a0,0
    800060a0:	00008067          	ret
    800060a4:	fe0516e3          	bnez	a0,80006090 <growproc+0x10>
    800060a8:	02f73823          	sd	a5,48(a4)
    800060ac:	00000513          	li	a0,0
    800060b0:	00008067          	ret
    800060b4:	fff00513          	li	a0,-1
    800060b8:	00008067          	ret

00000000800060bc <sys_getpid>:
    800060bc:	00421797          	auipc	a5,0x421
    800060c0:	32c7b783          	ld	a5,812(a5) # 804273e8 <current_proc>
    800060c4:	0087a503          	lw	a0,8(a5)
    800060c8:	00008067          	ret

00000000800060cc <sys_fork>:
    800060cc:	ff010113          	add	sp,sp,-16
    800060d0:	00113423          	sd	ra,8(sp)
    800060d4:	c11ff0ef          	jal	80005ce4 <fork>
    800060d8:	00813083          	ld	ra,8(sp)
    800060dc:	01010113          	add	sp,sp,16
    800060e0:	00008067          	ret

00000000800060e4 <sys_exit>:
    800060e4:	fe010113          	add	sp,sp,-32
    800060e8:	00c10593          	add	a1,sp,12
    800060ec:	00000513          	li	a0,0
    800060f0:	00113c23          	sd	ra,24(sp)
    800060f4:	404000ef          	jal	800064f8 <argint>
    800060f8:	fff00793          	li	a5,-1
    800060fc:	00054863          	bltz	a0,8000610c <sys_exit+0x28>
    80006100:	00c12503          	lw	a0,12(sp)
    80006104:	cc5ff0ef          	jal	80005dc8 <exit>
    80006108:	00000793          	li	a5,0
    8000610c:	01813083          	ld	ra,24(sp)
    80006110:	00078513          	mv	a0,a5
    80006114:	02010113          	add	sp,sp,32
    80006118:	00008067          	ret

000000008000611c <sys_wait>:
    8000611c:	fe010113          	add	sp,sp,-32
    80006120:	00810593          	add	a1,sp,8
    80006124:	00000513          	li	a0,0
    80006128:	00113c23          	sd	ra,24(sp)
    8000612c:	4ec000ef          	jal	80006618 <argaddr>
    80006130:	00050793          	mv	a5,a0
    80006134:	fff00513          	li	a0,-1
    80006138:	0007c663          	bltz	a5,80006144 <sys_wait+0x28>
    8000613c:	00813503          	ld	a0,8(sp)
    80006140:	d31ff0ef          	jal	80005e70 <wait>
    80006144:	01813083          	ld	ra,24(sp)
    80006148:	02010113          	add	sp,sp,32
    8000614c:	00008067          	ret

0000000080006150 <sys_sbrk>:
    80006150:	fe010113          	add	sp,sp,-32
    80006154:	00c10593          	add	a1,sp,12
    80006158:	00000513          	li	a0,0
    8000615c:	00113c23          	sd	ra,24(sp)
    80006160:	398000ef          	jal	800064f8 <argint>
    80006164:	fff00713          	li	a4,-1
    80006168:	02054663          	bltz	a0,80006194 <sys_sbrk+0x44>
    8000616c:	00421617          	auipc	a2,0x421
    80006170:	27c63603          	ld	a2,636(a2) # 804273e8 <current_proc>
    80006174:	03063783          	ld	a5,48(a2)
    80006178:	00c12683          	lw	a3,12(sp)
    8000617c:	0007859b          	sext.w	a1,a5
    80006180:	02d05263          	blez	a3,800061a4 <sys_sbrk+0x54>
    80006184:	00d787b3          	add	a5,a5,a3
    80006188:	00078663          	beqz	a5,80006194 <sys_sbrk+0x44>
    8000618c:	02f63823          	sd	a5,48(a2)
    80006190:	00058713          	mv	a4,a1
    80006194:	01813083          	ld	ra,24(sp)
    80006198:	00070513          	mv	a0,a4
    8000619c:	02010113          	add	sp,sp,32
    800061a0:	00008067          	ret
    800061a4:	fe0684e3          	beqz	a3,8000618c <sys_sbrk+0x3c>
    800061a8:	fddff06f          	j	80006184 <sys_sbrk+0x34>

00000000800061ac <sleep>:
    800061ac:	fe010113          	add	sp,sp,-32
    800061b0:	00913423          	sd	s1,8(sp)
    800061b4:	00113c23          	sd	ra,24(sp)
    800061b8:	00813823          	sd	s0,16(sp)
    800061bc:	00421497          	auipc	s1,0x421
    800061c0:	22c4b483          	ld	s1,556(s1) # 804273e8 <current_proc>
    800061c4:	04058663          	beqz	a1,80006210 <sleep+0x64>
    800061c8:	00058413          	mv	s0,a1
    800061cc:	0f50000f          	fence	iorw,ow
    800061d0:	0805a02f          	amoswap.w	zero,zero,(a1)
    800061d4:	00400793          	li	a5,4
    800061d8:	0ca4b423          	sd	a0,200(s1)
    800061dc:	00f4a223          	sw	a5,4(s1)
    800061e0:	a55ff0ef          	jal	80005c34 <yield>
    800061e4:	00100713          	li	a4,1
    800061e8:	0c04b423          	sd	zero,200(s1)
    800061ec:	00070793          	mv	a5,a4
    800061f0:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800061f4:	0007879b          	sext.w	a5,a5
    800061f8:	fe079ae3          	bnez	a5,800061ec <sleep+0x40>
    800061fc:	01813083          	ld	ra,24(sp)
    80006200:	01013403          	ld	s0,16(sp)
    80006204:	00813483          	ld	s1,8(sp)
    80006208:	02010113          	add	sp,sp,32
    8000620c:	00008067          	ret
    80006210:	00400793          	li	a5,4
    80006214:	0ca4b423          	sd	a0,200(s1)
    80006218:	00f4a223          	sw	a5,4(s1)
    8000621c:	a19ff0ef          	jal	80005c34 <yield>
    80006220:	01813083          	ld	ra,24(sp)
    80006224:	01013403          	ld	s0,16(sp)
    80006228:	0c04b423          	sd	zero,200(s1)
    8000622c:	00813483          	ld	s1,8(sp)
    80006230:	02010113          	add	sp,sp,32
    80006234:	00008067          	ret

0000000080006238 <wakeup>:
    80006238:	00420797          	auipc	a5,0x420
    8000623c:	3e078793          	add	a5,a5,992 # 80426618 <proc>
    80006240:	00421617          	auipc	a2,0x421
    80006244:	15860613          	add	a2,a2,344 # 80427398 <tickslock>
    80006248:	00400693          	li	a3,4
    8000624c:	00200593          	li	a1,2
    80006250:	00c0006f          	j	8000625c <wakeup+0x24>
    80006254:	0d878793          	add	a5,a5,216
    80006258:	02c78063          	beq	a5,a2,80006278 <wakeup+0x40>
    8000625c:	0047a703          	lw	a4,4(a5)
    80006260:	fed71ae3          	bne	a4,a3,80006254 <wakeup+0x1c>
    80006264:	0c87b703          	ld	a4,200(a5)
    80006268:	fea716e3          	bne	a4,a0,80006254 <wakeup+0x1c>
    8000626c:	00b7a223          	sw	a1,4(a5)
    80006270:	0d878793          	add	a5,a5,216
    80006274:	fec794e3          	bne	a5,a2,8000625c <wakeup+0x24>
    80006278:	00008067          	ret

000000008000627c <sys_uptime>:
    8000627c:	00421717          	auipc	a4,0x421
    80006280:	11c70713          	add	a4,a4,284 # 80427398 <tickslock>
    80006284:	00100693          	li	a3,1
    80006288:	00068793          	mv	a5,a3
    8000628c:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80006290:	0007879b          	sext.w	a5,a5
    80006294:	fe079ae3          	bnez	a5,80006288 <sys_uptime+0xc>
    80006298:	00421517          	auipc	a0,0x421
    8000629c:	13853503          	ld	a0,312(a0) # 804273d0 <ticks>
    800062a0:	0f50000f          	fence	iorw,ow
    800062a4:	0807202f          	amoswap.w	zero,zero,(a4)
    800062a8:	00008067          	ret

00000000800062ac <sys_sleep>:
    800062ac:	fb010113          	add	sp,sp,-80
    800062b0:	00c10593          	add	a1,sp,12
    800062b4:	00000513          	li	a0,0
    800062b8:	04113423          	sd	ra,72(sp)
    800062bc:	04813023          	sd	s0,64(sp)
    800062c0:	02913c23          	sd	s1,56(sp)
    800062c4:	03213823          	sd	s2,48(sp)
    800062c8:	03313423          	sd	s3,40(sp)
    800062cc:	03413023          	sd	s4,32(sp)
    800062d0:	01513c23          	sd	s5,24(sp)
    800062d4:	01613823          	sd	s6,16(sp)
    800062d8:	220000ef          	jal	800064f8 <argint>
    800062dc:	0c054663          	bltz	a0,800063a8 <sys_sleep+0xfc>
    800062e0:	00421417          	auipc	s0,0x421
    800062e4:	0b840413          	add	s0,s0,184 # 80427398 <tickslock>
    800062e8:	00100713          	li	a4,1
    800062ec:	00070793          	mv	a5,a4
    800062f0:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800062f4:	0007879b          	sext.w	a5,a5
    800062f8:	fe079ae3          	bnez	a5,800062ec <sys_sleep+0x40>
    800062fc:	00421997          	auipc	s3,0x421
    80006300:	0d498993          	add	s3,s3,212 # 804273d0 <ticks>
    80006304:	0009ba03          	ld	s4,0(s3)
    80006308:	0009b783          	ld	a5,0(s3)
    8000630c:	00c12703          	lw	a4,12(sp)
    80006310:	414787b3          	sub	a5,a5,s4
    80006314:	04e7fc63          	bgeu	a5,a4,8000636c <sys_sleep+0xc0>
    80006318:	00421a97          	auipc	s5,0x421
    8000631c:	0d0a8a93          	add	s5,s5,208 # 804273e8 <current_proc>
    80006320:	00400b13          	li	s6,4
    80006324:	00100493          	li	s1,1
    80006328:	000ab903          	ld	s2,0(s5)
    8000632c:	02492783          	lw	a5,36(s2)
    80006330:	06079863          	bnez	a5,800063a0 <sys_sleep+0xf4>
    80006334:	0f50000f          	fence	iorw,ow
    80006338:	0804202f          	amoswap.w	zero,zero,(s0)
    8000633c:	0c893423          	sd	s0,200(s2)
    80006340:	01692223          	sw	s6,4(s2)
    80006344:	8f1ff0ef          	jal	80005c34 <yield>
    80006348:	0c093423          	sd	zero,200(s2)
    8000634c:	00048793          	mv	a5,s1
    80006350:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80006354:	0007879b          	sext.w	a5,a5
    80006358:	fe079ae3          	bnez	a5,8000634c <sys_sleep+0xa0>
    8000635c:	0009b783          	ld	a5,0(s3)
    80006360:	00c12703          	lw	a4,12(sp)
    80006364:	414787b3          	sub	a5,a5,s4
    80006368:	fce7e0e3          	bltu	a5,a4,80006328 <sys_sleep+0x7c>
    8000636c:	0f50000f          	fence	iorw,ow
    80006370:	0804202f          	amoswap.w	zero,zero,(s0)
    80006374:	00000513          	li	a0,0
    80006378:	04813083          	ld	ra,72(sp)
    8000637c:	04013403          	ld	s0,64(sp)
    80006380:	03813483          	ld	s1,56(sp)
    80006384:	03013903          	ld	s2,48(sp)
    80006388:	02813983          	ld	s3,40(sp)
    8000638c:	02013a03          	ld	s4,32(sp)
    80006390:	01813a83          	ld	s5,24(sp)
    80006394:	01013b03          	ld	s6,16(sp)
    80006398:	05010113          	add	sp,sp,80
    8000639c:	00008067          	ret
    800063a0:	0f50000f          	fence	iorw,ow
    800063a4:	0804202f          	amoswap.w	zero,zero,(s0)
    800063a8:	fff00513          	li	a0,-1
    800063ac:	fcdff06f          	j	80006378 <sys_sleep+0xcc>

00000000800063b0 <sys_read>:
    800063b0:	fff00513          	li	a0,-1
    800063b4:	00008067          	ret

00000000800063b8 <sys_write>:
    800063b8:	fff00513          	li	a0,-1
    800063bc:	00008067          	ret

00000000800063c0 <sys_open>:
    800063c0:	fff00513          	li	a0,-1
    800063c4:	00008067          	ret

00000000800063c8 <sys_close>:
    800063c8:	fff00513          	li	a0,-1
    800063cc:	00008067          	ret

00000000800063d0 <sys_pipe>:
    800063d0:	fff00513          	li	a0,-1
    800063d4:	00008067          	ret

00000000800063d8 <sys_kill>:
    800063d8:	fff00513          	li	a0,-1
    800063dc:	00008067          	ret

00000000800063e0 <sys_exec>:
    800063e0:	fff00513          	li	a0,-1
    800063e4:	00008067          	ret

00000000800063e8 <sys_fstat>:
    800063e8:	fff00513          	li	a0,-1
    800063ec:	00008067          	ret

00000000800063f0 <sys_chdir>:
    800063f0:	fff00513          	li	a0,-1
    800063f4:	00008067          	ret

00000000800063f8 <sys_dup>:
    800063f8:	fff00513          	li	a0,-1
    800063fc:	00008067          	ret

0000000080006400 <sys_mknod>:
    80006400:	fff00513          	li	a0,-1
    80006404:	00008067          	ret

0000000080006408 <sys_unlink>:
    80006408:	fff00513          	li	a0,-1
    8000640c:	00008067          	ret

0000000080006410 <sys_link>:
    80006410:	fff00513          	li	a0,-1
    80006414:	00008067          	ret

0000000080006418 <sys_mkdir>:
    80006418:	fff00513          	li	a0,-1
    8000641c:	00008067          	ret

0000000080006420 <fetchaddr>:
    80006420:	fe010113          	add	sp,sp,-32
    80006424:	00813823          	sd	s0,16(sp)
    80006428:	00913423          	sd	s1,8(sp)
    8000642c:	00113c23          	sd	ra,24(sp)
    80006430:	00050413          	mv	s0,a0
    80006434:	00058493          	mv	s1,a1
    80006438:	e90ff0ef          	jal	80005ac8 <myproc>
    8000643c:	03053783          	ld	a5,48(a0)
    80006440:	02f47e63          	bgeu	s0,a5,8000647c <fetchaddr+0x5c>
    80006444:	00840713          	add	a4,s0,8
    80006448:	02e7ea63          	bltu	a5,a4,8000647c <fetchaddr+0x5c>
    8000644c:	02853503          	ld	a0,40(a0)
    80006450:	00800693          	li	a3,8
    80006454:	00040613          	mv	a2,s0
    80006458:	00048593          	mv	a1,s1
    8000645c:	f14fe0ef          	jal	80004b70 <copyin>
    80006460:	00a03533          	snez	a0,a0
    80006464:	40a00533          	neg	a0,a0
    80006468:	01813083          	ld	ra,24(sp)
    8000646c:	01013403          	ld	s0,16(sp)
    80006470:	00813483          	ld	s1,8(sp)
    80006474:	02010113          	add	sp,sp,32
    80006478:	00008067          	ret
    8000647c:	fff00513          	li	a0,-1
    80006480:	fe9ff06f          	j	80006468 <fetchaddr+0x48>

0000000080006484 <fetchstr>:
    80006484:	fe010113          	add	sp,sp,-32
    80006488:	00813823          	sd	s0,16(sp)
    8000648c:	00913423          	sd	s1,8(sp)
    80006490:	01213023          	sd	s2,0(sp)
    80006494:	00113c23          	sd	ra,24(sp)
    80006498:	00060913          	mv	s2,a2
    8000649c:	00050493          	mv	s1,a0
    800064a0:	00058413          	mv	s0,a1
    800064a4:	e24ff0ef          	jal	80005ac8 <myproc>
    800064a8:	02853503          	ld	a0,40(a0)
    800064ac:	00090693          	mv	a3,s2
    800064b0:	00048613          	mv	a2,s1
    800064b4:	00040593          	mv	a1,s0
    800064b8:	f18fe0ef          	jal	80004bd0 <copyinstr>
    800064bc:	02054063          	bltz	a0,800064dc <fetchstr+0x58>
    800064c0:	00040513          	mv	a0,s0
    800064c4:	01013403          	ld	s0,16(sp)
    800064c8:	01813083          	ld	ra,24(sp)
    800064cc:	00813483          	ld	s1,8(sp)
    800064d0:	00013903          	ld	s2,0(sp)
    800064d4:	02010113          	add	sp,sp,32
    800064d8:	ac4ff06f          	j	8000579c <strlen>
    800064dc:	01813083          	ld	ra,24(sp)
    800064e0:	01013403          	ld	s0,16(sp)
    800064e4:	00813483          	ld	s1,8(sp)
    800064e8:	00013903          	ld	s2,0(sp)
    800064ec:	fff00513          	li	a0,-1
    800064f0:	02010113          	add	sp,sp,32
    800064f4:	00008067          	ret

00000000800064f8 <argint>:
    800064f8:	fe010113          	add	sp,sp,-32
    800064fc:	00813823          	sd	s0,16(sp)
    80006500:	00913423          	sd	s1,8(sp)
    80006504:	00113c23          	sd	ra,24(sp)
    80006508:	00050413          	mv	s0,a0
    8000650c:	00058493          	mv	s1,a1
    80006510:	db8ff0ef          	jal	80005ac8 <myproc>
    80006514:	00500793          	li	a5,5
    80006518:	0e87ec63          	bltu	a5,s0,80006610 <argint+0x118>
    8000651c:	00005717          	auipc	a4,0x5
    80006520:	39470713          	add	a4,a4,916 # 8000b8b0 <digits+0xcf0>
    80006524:	00241413          	sll	s0,s0,0x2
    80006528:	00e40433          	add	s0,s0,a4
    8000652c:	00042783          	lw	a5,0(s0)
    80006530:	00e787b3          	add	a5,a5,a4
    80006534:	00078067          	jr	a5
    80006538:	04053783          	ld	a5,64(a0)
    8000653c:	0907a783          	lw	a5,144(a5)
    80006540:	01813083          	ld	ra,24(sp)
    80006544:	01013403          	ld	s0,16(sp)
    80006548:	00f4a023          	sw	a5,0(s1)
    8000654c:	00000513          	li	a0,0
    80006550:	00813483          	ld	s1,8(sp)
    80006554:	02010113          	add	sp,sp,32
    80006558:	00008067          	ret
    8000655c:	04053783          	ld	a5,64(a0)
    80006560:	01813083          	ld	ra,24(sp)
    80006564:	01013403          	ld	s0,16(sp)
    80006568:	0987a783          	lw	a5,152(a5)
    8000656c:	00000513          	li	a0,0
    80006570:	00f4a023          	sw	a5,0(s1)
    80006574:	00813483          	ld	s1,8(sp)
    80006578:	02010113          	add	sp,sp,32
    8000657c:	00008067          	ret
    80006580:	04053783          	ld	a5,64(a0)
    80006584:	01813083          	ld	ra,24(sp)
    80006588:	01013403          	ld	s0,16(sp)
    8000658c:	0707a783          	lw	a5,112(a5)
    80006590:	00000513          	li	a0,0
    80006594:	00f4a023          	sw	a5,0(s1)
    80006598:	00813483          	ld	s1,8(sp)
    8000659c:	02010113          	add	sp,sp,32
    800065a0:	00008067          	ret
    800065a4:	04053783          	ld	a5,64(a0)
    800065a8:	01813083          	ld	ra,24(sp)
    800065ac:	01013403          	ld	s0,16(sp)
    800065b0:	0787a783          	lw	a5,120(a5)
    800065b4:	00000513          	li	a0,0
    800065b8:	00f4a023          	sw	a5,0(s1)
    800065bc:	00813483          	ld	s1,8(sp)
    800065c0:	02010113          	add	sp,sp,32
    800065c4:	00008067          	ret
    800065c8:	04053783          	ld	a5,64(a0)
    800065cc:	01813083          	ld	ra,24(sp)
    800065d0:	01013403          	ld	s0,16(sp)
    800065d4:	0807a783          	lw	a5,128(a5)
    800065d8:	00000513          	li	a0,0
    800065dc:	00f4a023          	sw	a5,0(s1)
    800065e0:	00813483          	ld	s1,8(sp)
    800065e4:	02010113          	add	sp,sp,32
    800065e8:	00008067          	ret
    800065ec:	04053783          	ld	a5,64(a0)
    800065f0:	01813083          	ld	ra,24(sp)
    800065f4:	01013403          	ld	s0,16(sp)
    800065f8:	0887a783          	lw	a5,136(a5)
    800065fc:	00000513          	li	a0,0
    80006600:	00f4a023          	sw	a5,0(s1)
    80006604:	00813483          	ld	s1,8(sp)
    80006608:	02010113          	add	sp,sp,32
    8000660c:	00008067          	ret
    80006610:	fff00793          	li	a5,-1
    80006614:	f2dff06f          	j	80006540 <argint+0x48>

0000000080006618 <argaddr>:
    80006618:	fe010113          	add	sp,sp,-32
    8000661c:	00813823          	sd	s0,16(sp)
    80006620:	00913423          	sd	s1,8(sp)
    80006624:	00113c23          	sd	ra,24(sp)
    80006628:	00050413          	mv	s0,a0
    8000662c:	00058493          	mv	s1,a1
    80006630:	c98ff0ef          	jal	80005ac8 <myproc>
    80006634:	00500793          	li	a5,5
    80006638:	0e87ec63          	bltu	a5,s0,80006730 <argaddr+0x118>
    8000663c:	00005717          	auipc	a4,0x5
    80006640:	28c70713          	add	a4,a4,652 # 8000b8c8 <digits+0xd08>
    80006644:	00241413          	sll	s0,s0,0x2
    80006648:	00e40433          	add	s0,s0,a4
    8000664c:	00042783          	lw	a5,0(s0)
    80006650:	00e787b3          	add	a5,a5,a4
    80006654:	00078067          	jr	a5
    80006658:	04053783          	ld	a5,64(a0)
    8000665c:	0907b783          	ld	a5,144(a5)
    80006660:	01813083          	ld	ra,24(sp)
    80006664:	01013403          	ld	s0,16(sp)
    80006668:	00f4b023          	sd	a5,0(s1)
    8000666c:	00000513          	li	a0,0
    80006670:	00813483          	ld	s1,8(sp)
    80006674:	02010113          	add	sp,sp,32
    80006678:	00008067          	ret
    8000667c:	04053783          	ld	a5,64(a0)
    80006680:	01813083          	ld	ra,24(sp)
    80006684:	01013403          	ld	s0,16(sp)
    80006688:	0987b783          	ld	a5,152(a5)
    8000668c:	00000513          	li	a0,0
    80006690:	00f4b023          	sd	a5,0(s1)
    80006694:	00813483          	ld	s1,8(sp)
    80006698:	02010113          	add	sp,sp,32
    8000669c:	00008067          	ret
    800066a0:	04053783          	ld	a5,64(a0)
    800066a4:	01813083          	ld	ra,24(sp)
    800066a8:	01013403          	ld	s0,16(sp)
    800066ac:	0707b783          	ld	a5,112(a5)
    800066b0:	00000513          	li	a0,0
    800066b4:	00f4b023          	sd	a5,0(s1)
    800066b8:	00813483          	ld	s1,8(sp)
    800066bc:	02010113          	add	sp,sp,32
    800066c0:	00008067          	ret
    800066c4:	04053783          	ld	a5,64(a0)
    800066c8:	01813083          	ld	ra,24(sp)
    800066cc:	01013403          	ld	s0,16(sp)
    800066d0:	0787b783          	ld	a5,120(a5)
    800066d4:	00000513          	li	a0,0
    800066d8:	00f4b023          	sd	a5,0(s1)
    800066dc:	00813483          	ld	s1,8(sp)
    800066e0:	02010113          	add	sp,sp,32
    800066e4:	00008067          	ret
    800066e8:	04053783          	ld	a5,64(a0)
    800066ec:	01813083          	ld	ra,24(sp)
    800066f0:	01013403          	ld	s0,16(sp)
    800066f4:	0807b783          	ld	a5,128(a5)
    800066f8:	00000513          	li	a0,0
    800066fc:	00f4b023          	sd	a5,0(s1)
    80006700:	00813483          	ld	s1,8(sp)
    80006704:	02010113          	add	sp,sp,32
    80006708:	00008067          	ret
    8000670c:	04053783          	ld	a5,64(a0)
    80006710:	01813083          	ld	ra,24(sp)
    80006714:	01013403          	ld	s0,16(sp)
    80006718:	0887b783          	ld	a5,136(a5)
    8000671c:	00000513          	li	a0,0
    80006720:	00f4b023          	sd	a5,0(s1)
    80006724:	00813483          	ld	s1,8(sp)
    80006728:	02010113          	add	sp,sp,32
    8000672c:	00008067          	ret
    80006730:	fff00793          	li	a5,-1
    80006734:	f2dff06f          	j	80006660 <argaddr+0x48>

0000000080006738 <argstr>:
    80006738:	fe010113          	add	sp,sp,-32
    8000673c:	00813823          	sd	s0,16(sp)
    80006740:	00913423          	sd	s1,8(sp)
    80006744:	01213023          	sd	s2,0(sp)
    80006748:	00113c23          	sd	ra,24(sp)
    8000674c:	00050413          	mv	s0,a0
    80006750:	00058493          	mv	s1,a1
    80006754:	00060913          	mv	s2,a2
    80006758:	b70ff0ef          	jal	80005ac8 <myproc>
    8000675c:	00500793          	li	a5,5
    80006760:	0a87ec63          	bltu	a5,s0,80006818 <argstr+0xe0>
    80006764:	00005717          	auipc	a4,0x5
    80006768:	17c70713          	add	a4,a4,380 # 8000b8e0 <digits+0xd20>
    8000676c:	00241413          	sll	s0,s0,0x2
    80006770:	00e40433          	add	s0,s0,a4
    80006774:	00042783          	lw	a5,0(s0)
    80006778:	00e787b3          	add	a5,a5,a4
    8000677c:	00078067          	jr	a5
    80006780:	04053783          	ld	a5,64(a0)
    80006784:	0907b403          	ld	s0,144(a5)
    80006788:	b40ff0ef          	jal	80005ac8 <myproc>
    8000678c:	02853503          	ld	a0,40(a0)
    80006790:	00090693          	mv	a3,s2
    80006794:	00040613          	mv	a2,s0
    80006798:	00048593          	mv	a1,s1
    8000679c:	c34fe0ef          	jal	80004bd0 <copyinstr>
    800067a0:	04054e63          	bltz	a0,800067fc <argstr+0xc4>
    800067a4:	01013403          	ld	s0,16(sp)
    800067a8:	01813083          	ld	ra,24(sp)
    800067ac:	00013903          	ld	s2,0(sp)
    800067b0:	00048513          	mv	a0,s1
    800067b4:	00813483          	ld	s1,8(sp)
    800067b8:	02010113          	add	sp,sp,32
    800067bc:	fe1fe06f          	j	8000579c <strlen>
    800067c0:	04053783          	ld	a5,64(a0)
    800067c4:	0987b403          	ld	s0,152(a5)
    800067c8:	fc1ff06f          	j	80006788 <argstr+0x50>
    800067cc:	04053783          	ld	a5,64(a0)
    800067d0:	0707b403          	ld	s0,112(a5)
    800067d4:	fb5ff06f          	j	80006788 <argstr+0x50>
    800067d8:	04053783          	ld	a5,64(a0)
    800067dc:	0787b403          	ld	s0,120(a5)
    800067e0:	fa9ff06f          	j	80006788 <argstr+0x50>
    800067e4:	04053783          	ld	a5,64(a0)
    800067e8:	0807b403          	ld	s0,128(a5)
    800067ec:	f9dff06f          	j	80006788 <argstr+0x50>
    800067f0:	04053783          	ld	a5,64(a0)
    800067f4:	0887b403          	ld	s0,136(a5)
    800067f8:	f91ff06f          	j	80006788 <argstr+0x50>
    800067fc:	01813083          	ld	ra,24(sp)
    80006800:	01013403          	ld	s0,16(sp)
    80006804:	00813483          	ld	s1,8(sp)
    80006808:	00013903          	ld	s2,0(sp)
    8000680c:	fff00513          	li	a0,-1
    80006810:	02010113          	add	sp,sp,32
    80006814:	00008067          	ret
    80006818:	fff00413          	li	s0,-1
    8000681c:	f6dff06f          	j	80006788 <argstr+0x50>

0000000080006820 <syscall>:
    80006820:	fe010113          	add	sp,sp,-32
    80006824:	00813823          	sd	s0,16(sp)
    80006828:	00913423          	sd	s1,8(sp)
    8000682c:	00113c23          	sd	ra,24(sp)
    80006830:	a98ff0ef          	jal	80005ac8 <myproc>
    80006834:	04053483          	ld	s1,64(a0)
    80006838:	01400793          	li	a5,20
    8000683c:	00050413          	mv	s0,a0
    80006840:	0a84b683          	ld	a3,168(s1)
    80006844:	fff6871b          	addw	a4,a3,-1
    80006848:	0006869b          	sext.w	a3,a3
    8000684c:	02e7ec63          	bltu	a5,a4,80006884 <syscall+0x64>
    80006850:	00369713          	sll	a4,a3,0x3
    80006854:	00005797          	auipc	a5,0x5
    80006858:	0a478793          	add	a5,a5,164 # 8000b8f8 <syscalls>
    8000685c:	00e787b3          	add	a5,a5,a4
    80006860:	0007b783          	ld	a5,0(a5)
    80006864:	02078063          	beqz	a5,80006884 <syscall+0x64>
    80006868:	000780e7          	jalr	a5
    8000686c:	01813083          	ld	ra,24(sp)
    80006870:	01013403          	ld	s0,16(sp)
    80006874:	06a4b823          	sd	a0,112(s1)
    80006878:	00813483          	ld	s1,8(sp)
    8000687c:	02010113          	add	sp,sp,32
    80006880:	00008067          	ret
    80006884:	00842583          	lw	a1,8(s0)
    80006888:	01040613          	add	a2,s0,16
    8000688c:	00005517          	auipc	a0,0x5
    80006890:	11c50513          	add	a0,a0,284 # 8000b9a8 <syscalls+0xb0>
    80006894:	b98fc0ef          	jal	80002c2c <printf>
    80006898:	04043783          	ld	a5,64(s0)
    8000689c:	01813083          	ld	ra,24(sp)
    800068a0:	01013403          	ld	s0,16(sp)
    800068a4:	fff00713          	li	a4,-1
    800068a8:	06e7b823          	sd	a4,112(a5)
    800068ac:	00813483          	ld	s1,8(sp)
    800068b0:	02010113          	add	sp,sp,32
    800068b4:	00008067          	ret
	...

00000000800068c0 <machinevec>:
    800068c0:	f0810113          	add	sp,sp,-248
    800068c4:	00113023          	sd	ra,0(sp)
    800068c8:	00313823          	sd	gp,16(sp)
    800068cc:	00413c23          	sd	tp,24(sp)
    800068d0:	02513023          	sd	t0,32(sp)
    800068d4:	02613423          	sd	t1,40(sp)
    800068d8:	02713823          	sd	t2,48(sp)
    800068dc:	02813c23          	sd	s0,56(sp)
    800068e0:	04913023          	sd	s1,64(sp)
    800068e4:	04a13423          	sd	a0,72(sp)
    800068e8:	04b13823          	sd	a1,80(sp)
    800068ec:	04c13c23          	sd	a2,88(sp)
    800068f0:	06d13023          	sd	a3,96(sp)
    800068f4:	06e13423          	sd	a4,104(sp)
    800068f8:	06f13823          	sd	a5,112(sp)
    800068fc:	07013c23          	sd	a6,120(sp)
    80006900:	09113023          	sd	a7,128(sp)
    80006904:	09213423          	sd	s2,136(sp)
    80006908:	09313823          	sd	s3,144(sp)
    8000690c:	09413c23          	sd	s4,152(sp)
    80006910:	0b513023          	sd	s5,160(sp)
    80006914:	0b613423          	sd	s6,168(sp)
    80006918:	0b713823          	sd	s7,176(sp)
    8000691c:	0b813c23          	sd	s8,184(sp)
    80006920:	0d913023          	sd	s9,192(sp)
    80006924:	0da13423          	sd	s10,200(sp)
    80006928:	0db13823          	sd	s11,208(sp)
    8000692c:	0dc13c23          	sd	t3,216(sp)
    80006930:	0fd13023          	sd	t4,224(sp)
    80006934:	0fe13423          	sd	t5,232(sp)
    80006938:	0ff13823          	sd	t6,240(sp)
    8000693c:	0f810293          	add	t0,sp,248
    80006940:	00513423          	sd	t0,8(sp)
    80006944:	34202573          	csrr	a0,mcause
    80006948:	fff0029b          	addw	t0,zero,-1
    8000694c:	03f29293          	sll	t0,t0,0x3f
    80006950:	00728293          	add	t0,t0,7
    80006954:	00551663          	bne	a0,t0,80006960 <interrupt_return>
    80006958:	bbcfe0ef          	jal	80004d14 <machine_timer_handler>
    8000695c:	0040006f          	j	80006960 <interrupt_return>

0000000080006960 <interrupt_return>:
    80006960:	00013083          	ld	ra,0(sp)
    80006964:	01013183          	ld	gp,16(sp)
    80006968:	01813203          	ld	tp,24(sp)
    8000696c:	02013283          	ld	t0,32(sp)
    80006970:	02813303          	ld	t1,40(sp)
    80006974:	03013383          	ld	t2,48(sp)
    80006978:	03813403          	ld	s0,56(sp)
    8000697c:	04013483          	ld	s1,64(sp)
    80006980:	04813503          	ld	a0,72(sp)
    80006984:	05013583          	ld	a1,80(sp)
    80006988:	05813603          	ld	a2,88(sp)
    8000698c:	06013683          	ld	a3,96(sp)
    80006990:	06813703          	ld	a4,104(sp)
    80006994:	07013783          	ld	a5,112(sp)
    80006998:	07813803          	ld	a6,120(sp)
    8000699c:	08013883          	ld	a7,128(sp)
    800069a0:	08813903          	ld	s2,136(sp)
    800069a4:	09013983          	ld	s3,144(sp)
    800069a8:	09813a03          	ld	s4,152(sp)
    800069ac:	0a013a83          	ld	s5,160(sp)
    800069b0:	0a813b03          	ld	s6,168(sp)
    800069b4:	0b013b83          	ld	s7,176(sp)
    800069b8:	0b813c03          	ld	s8,184(sp)
    800069bc:	0c013c83          	ld	s9,192(sp)
    800069c0:	0c813d03          	ld	s10,200(sp)
    800069c4:	0d013d83          	ld	s11,208(sp)
    800069c8:	0d813e03          	ld	t3,216(sp)
    800069cc:	0e013e83          	ld	t4,224(sp)
    800069d0:	0e813f03          	ld	t5,232(sp)
    800069d4:	0f013f83          	ld	t6,240(sp)
    800069d8:	00813103          	ld	sp,8(sp)
    800069dc:	30200073          	mret

00000000800069e0 <kernelvec>:
    800069e0:	ef010113          	add	sp,sp,-272
    800069e4:	00013023          	sd	zero,0(sp)
    800069e8:	00113423          	sd	ra,8(sp)
    800069ec:	00313c23          	sd	gp,24(sp)
    800069f0:	02413023          	sd	tp,32(sp)
    800069f4:	02513423          	sd	t0,40(sp)
    800069f8:	02613823          	sd	t1,48(sp)
    800069fc:	02713c23          	sd	t2,56(sp)
    80006a00:	04813023          	sd	s0,64(sp)
    80006a04:	04913423          	sd	s1,72(sp)
    80006a08:	04a13823          	sd	a0,80(sp)
    80006a0c:	04b13c23          	sd	a1,88(sp)
    80006a10:	06c13023          	sd	a2,96(sp)
    80006a14:	06d13423          	sd	a3,104(sp)
    80006a18:	06e13823          	sd	a4,112(sp)
    80006a1c:	06f13c23          	sd	a5,120(sp)
    80006a20:	09013023          	sd	a6,128(sp)
    80006a24:	09113423          	sd	a7,136(sp)
    80006a28:	09213823          	sd	s2,144(sp)
    80006a2c:	09313c23          	sd	s3,152(sp)
    80006a30:	0b413023          	sd	s4,160(sp)
    80006a34:	0b513423          	sd	s5,168(sp)
    80006a38:	0b613823          	sd	s6,176(sp)
    80006a3c:	0b713c23          	sd	s7,184(sp)
    80006a40:	0d813023          	sd	s8,192(sp)
    80006a44:	0d913423          	sd	s9,200(sp)
    80006a48:	0da13823          	sd	s10,208(sp)
    80006a4c:	0db13c23          	sd	s11,216(sp)
    80006a50:	0fc13023          	sd	t3,224(sp)
    80006a54:	0fd13423          	sd	t4,232(sp)
    80006a58:	0fe13823          	sd	t5,240(sp)
    80006a5c:	0ff13c23          	sd	t6,248(sp)
    80006a60:	11010293          	add	t0,sp,272
    80006a64:	00513823          	sd	t0,16(sp)
    80006a68:	141022f3          	csrr	t0,sepc
    80006a6c:	10513023          	sd	t0,256(sp)
    80006a70:	142022f3          	csrr	t0,scause
    80006a74:	10513423          	sd	t0,264(sp)
    80006a78:	b99fe0ef          	jal	80005610 <kerneltrap>
    80006a7c:	00813083          	ld	ra,8(sp)
    80006a80:	01813183          	ld	gp,24(sp)
    80006a84:	02013203          	ld	tp,32(sp)
    80006a88:	02813283          	ld	t0,40(sp)
    80006a8c:	03013303          	ld	t1,48(sp)
    80006a90:	03813383          	ld	t2,56(sp)
    80006a94:	04013403          	ld	s0,64(sp)
    80006a98:	04813483          	ld	s1,72(sp)
    80006a9c:	05013503          	ld	a0,80(sp)
    80006aa0:	05813583          	ld	a1,88(sp)
    80006aa4:	06013603          	ld	a2,96(sp)
    80006aa8:	06813683          	ld	a3,104(sp)
    80006aac:	07013703          	ld	a4,112(sp)
    80006ab0:	07813783          	ld	a5,120(sp)
    80006ab4:	08013803          	ld	a6,128(sp)
    80006ab8:	08813883          	ld	a7,136(sp)
    80006abc:	09013903          	ld	s2,144(sp)
    80006ac0:	09813983          	ld	s3,152(sp)
    80006ac4:	0a013a03          	ld	s4,160(sp)
    80006ac8:	0a813a83          	ld	s5,168(sp)
    80006acc:	0b013b03          	ld	s6,176(sp)
    80006ad0:	0b813b83          	ld	s7,184(sp)
    80006ad4:	0c013c03          	ld	s8,192(sp)
    80006ad8:	0c813c83          	ld	s9,200(sp)
    80006adc:	0d013d03          	ld	s10,208(sp)
    80006ae0:	0d813d83          	ld	s11,216(sp)
    80006ae4:	0e013e03          	ld	t3,224(sp)
    80006ae8:	0e813e83          	ld	t4,232(sp)
    80006aec:	0f013f03          	ld	t5,240(sp)
    80006af0:	0f813f83          	ld	t6,248(sp)
    80006af4:	10013283          	ld	t0,256(sp)
    80006af8:	14129073          	csrw	sepc,t0
    80006afc:	10813283          	ld	t0,264(sp)
    80006b00:	14229073          	csrw	scause,t0
    80006b04:	01013103          	ld	sp,16(sp)
    80006b08:	10200073          	sret
    80006b0c:	0000                	.2byte	0x0
	...

0000000080006b10 <uservec>:
    80006b10:	100002b7          	lui	t0,0x10000
    80006b14:	05600313          	li	t1,86
    80006b18:	00628023          	sb	t1,0(t0) # 10000000 <_entry-0x70000000>
    80006b1c:	14051573          	csrrw	a0,sscratch,a0
    80006b20:	02153423          	sd	ra,40(a0)
    80006b24:	02253823          	sd	sp,48(a0)
    80006b28:	02353c23          	sd	gp,56(a0)
    80006b2c:	04453023          	sd	tp,64(a0)
    80006b30:	04553423          	sd	t0,72(a0)
    80006b34:	04653823          	sd	t1,80(a0)
    80006b38:	04753c23          	sd	t2,88(a0)
    80006b3c:	06853023          	sd	s0,96(a0)
    80006b40:	06953423          	sd	s1,104(a0)
    80006b44:	06b53c23          	sd	a1,120(a0)
    80006b48:	08c53023          	sd	a2,128(a0)
    80006b4c:	08d53423          	sd	a3,136(a0)
    80006b50:	08e53823          	sd	a4,144(a0)
    80006b54:	08f53c23          	sd	a5,152(a0)
    80006b58:	0b053023          	sd	a6,160(a0)
    80006b5c:	0b153423          	sd	a7,168(a0)
    80006b60:	0b253823          	sd	s2,176(a0)
    80006b64:	0b353c23          	sd	s3,184(a0)
    80006b68:	0d453023          	sd	s4,192(a0)
    80006b6c:	0d553423          	sd	s5,200(a0)
    80006b70:	0d653823          	sd	s6,208(a0)
    80006b74:	0d753c23          	sd	s7,216(a0)
    80006b78:	0f853023          	sd	s8,224(a0)
    80006b7c:	0f953423          	sd	s9,232(a0)
    80006b80:	0fa53823          	sd	s10,240(a0)
    80006b84:	0fb53c23          	sd	s11,248(a0)
    80006b88:	11c53023          	sd	t3,256(a0)
    80006b8c:	11d53423          	sd	t4,264(a0)
    80006b90:	11e53823          	sd	t5,272(a0)
    80006b94:	11f53c23          	sd	t6,280(a0)
    80006b98:	140022f3          	csrr	t0,sscratch
    80006b9c:	06553823          	sd	t0,112(a0)
    80006ba0:	00853103          	ld	sp,8(a0)
    80006ba4:	02053203          	ld	tp,32(a0)
    80006ba8:	01053283          	ld	t0,16(a0)
    80006bac:	00053303          	ld	t1,0(a0)
    80006bb0:	18031073          	csrw	satp,t1
    80006bb4:	12000073          	sfence.vma
    80006bb8:	00028067          	jr	t0

0000000080006bbc <userret>:
    80006bbc:	18051073          	csrw	satp,a0
    80006bc0:	12000073          	sfence.vma
    80006bc4:	14002573          	csrr	a0,sscratch
    80006bc8:	02853083          	ld	ra,40(a0)
    80006bcc:	03053103          	ld	sp,48(a0)
    80006bd0:	03853183          	ld	gp,56(a0)
    80006bd4:	04053203          	ld	tp,64(a0)
    80006bd8:	04853283          	ld	t0,72(a0)
    80006bdc:	05053303          	ld	t1,80(a0)
    80006be0:	05853383          	ld	t2,88(a0)
    80006be4:	06053403          	ld	s0,96(a0)
    80006be8:	06853483          	ld	s1,104(a0)
    80006bec:	07853583          	ld	a1,120(a0)
    80006bf0:	08053603          	ld	a2,128(a0)
    80006bf4:	08853683          	ld	a3,136(a0)
    80006bf8:	09053703          	ld	a4,144(a0)
    80006bfc:	09853783          	ld	a5,152(a0)
    80006c00:	0a053803          	ld	a6,160(a0)
    80006c04:	0a853883          	ld	a7,168(a0)
    80006c08:	0b053903          	ld	s2,176(a0)
    80006c0c:	0b853983          	ld	s3,184(a0)
    80006c10:	0c053a03          	ld	s4,192(a0)
    80006c14:	0c853a83          	ld	s5,200(a0)
    80006c18:	0d053b03          	ld	s6,208(a0)
    80006c1c:	0d853b83          	ld	s7,216(a0)
    80006c20:	0e053c03          	ld	s8,224(a0)
    80006c24:	0e853c83          	ld	s9,232(a0)
    80006c28:	0f053d03          	ld	s10,240(a0)
    80006c2c:	0f853d83          	ld	s11,248(a0)
    80006c30:	10053e03          	ld	t3,256(a0)
    80006c34:	10853e83          	ld	t4,264(a0)
    80006c38:	11053f03          	ld	t5,272(a0)
    80006c3c:	11853f83          	ld	t6,280(a0)
    80006c40:	07053283          	ld	t0,112(a0)
    80006c44:	14051073          	csrw	sscratch,a0
    80006c48:	00028513          	mv	a0,t0
    80006c4c:	10200073          	sret
	...

0000000080006c60 <switch_context>:
    80006c60:	00153023          	sd	ra,0(a0)
    80006c64:	00253423          	sd	sp,8(a0)
    80006c68:	00853823          	sd	s0,16(a0)
    80006c6c:	00953c23          	sd	s1,24(a0)
    80006c70:	03253023          	sd	s2,32(a0)
    80006c74:	03353423          	sd	s3,40(a0)
    80006c78:	03453823          	sd	s4,48(a0)
    80006c7c:	03553c23          	sd	s5,56(a0)
    80006c80:	05653023          	sd	s6,64(a0)
    80006c84:	05753423          	sd	s7,72(a0)
    80006c88:	05853823          	sd	s8,80(a0)
    80006c8c:	05953c23          	sd	s9,88(a0)
    80006c90:	07a53023          	sd	s10,96(a0)
    80006c94:	07b53423          	sd	s11,104(a0)
    80006c98:	0005b083          	ld	ra,0(a1)
    80006c9c:	0085b103          	ld	sp,8(a1)
    80006ca0:	0105b403          	ld	s0,16(a1)
    80006ca4:	0185b483          	ld	s1,24(a1)
    80006ca8:	0205b903          	ld	s2,32(a1)
    80006cac:	0285b983          	ld	s3,40(a1)
    80006cb0:	0305ba03          	ld	s4,48(a1)
    80006cb4:	0385ba83          	ld	s5,56(a1)
    80006cb8:	0405bb03          	ld	s6,64(a1)
    80006cbc:	0485bb83          	ld	s7,72(a1)
    80006cc0:	0505bc03          	ld	s8,80(a1)
    80006cc4:	0585bc83          	ld	s9,88(a1)
    80006cc8:	0605bd03          	ld	s10,96(a1)
    80006ccc:	0685bd83          	ld	s11,104(a1)
    80006cd0:	00008067          	ret
	...

0000000080006ce0 <user_test_getpid>:
    80006ce0:	00b00893          	li	a7,11
    80006ce4:	00000073          	ecall
    80006ce8:	100002b7          	lui	t0,0x10000
    80006cec:	05500313          	li	t1,85
    80006cf0:	00628023          	sb	t1,0(t0) # 10000000 <_entry-0x70000000>
    80006cf4:	04b00313          	li	t1,75
    80006cf8:	00628023          	sb	t1,0(t0)
    80006cfc:	00100073          	ebreak

0000000080006d00 <user_test_uptime>:
    80006d00:	00e00893          	li	a7,14
    80006d04:	00000073          	ecall
    80006d08:	ff9ff06f          	j	80006d00 <user_test_uptime>

0000000080006d0c <user_test_sbrk>:
    80006d0c:	00c00893          	li	a7,12
    80006d10:	40000513          	li	a0,1024
    80006d14:	00000073          	ecall
    80006d18:	ff5ff06f          	j	80006d0c <user_test_sbrk>

0000000080006d1c <user_test_invalid>:
    80006d1c:	3e700893          	li	a7,999
    80006d20:	00000073          	ecall
    80006d24:	ff9ff06f          	j	80006d1c <user_test_invalid>

0000000080006d28 <user_test_end>:
    80006d28:	00000013          	nop
	...
