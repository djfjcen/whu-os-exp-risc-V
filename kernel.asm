
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
    80000020:	b8428293          	add	t0,t0,-1148 # 80005ba0 <machinevec>
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
    80000064:	b1030313          	add	t1,t1,-1264 # 80426b70 <bss_end>

0000000080000068 <bss_clear>:
    80000068:	00628863          	beq	t0,t1,80000078 <bss_done>
    8000006c:	0002b023          	sd	zero,0(t0)
    80000070:	00828293          	add	t0,t0,8
    80000074:	ff5ff06f          	j	80000068 <bss_clear>

0000000080000078 <bss_done>:
    80000078:	2e5000ef          	jal	80000b5c <main>

000000008000007c <loop>:
    8000007c:	0000006f          	j	8000007c <loop>

0000000080000080 <simulate_syscall_test>:
    80000080:	fd010113          	add	sp,sp,-48
    80000084:	00006517          	auipc	a0,0x6
    80000088:	f8c50513          	add	a0,a0,-116 # 80006010 <rodata_start+0x10>
    8000008c:	02113423          	sd	ra,40(sp)
    80000090:	02813023          	sd	s0,32(sp)
    80000094:	00913c23          	sd	s1,24(sp)
    80000098:	01213823          	sd	s2,16(sp)
    8000009c:	01313423          	sd	s3,8(sp)
    800000a0:	534010ef          	jal	800015d4 <uart_puts>
    800000a4:	00006517          	auipc	a0,0x6
    800000a8:	03c50513          	add	a0,a0,60 # 800060e0 <rodata_start+0xe0>
    800000ac:	528010ef          	jal	800015d4 <uart_puts>
    800000b0:	00006517          	auipc	a0,0x6
    800000b4:	09050513          	add	a0,a0,144 # 80006140 <rodata_start+0x140>
    800000b8:	51c010ef          	jal	800015d4 <uart_puts>
    800000bc:	520040ef          	jal	800045dc <alloc_proc>
    800000c0:	60050e63          	beqz	a0,800006dc <simulate_syscall_test+0x65c>
    800000c4:	00050413          	mv	s0,a0
    800000c8:	03d040ef          	jal	80004904 <set_current_proc>
    800000cc:	00442583          	lw	a1,4(s0)
    800000d0:	00300793          	li	a5,3
    800000d4:	00f42023          	sw	a5,0(s0)
    800000d8:	00006517          	auipc	a0,0x6
    800000dc:	15050513          	add	a0,a0,336 # 80006228 <rodata_start+0x228>
    800000e0:	184010ef          	jal	80001264 <printf>
    800000e4:	00006517          	auipc	a0,0x6
    800000e8:	16450513          	add	a0,a0,356 # 80006248 <rodata_start+0x248>
    800000ec:	4e8010ef          	jal	800015d4 <uart_puts>
    800000f0:	00006517          	auipc	a0,0x6
    800000f4:	18050513          	add	a0,a0,384 # 80006270 <rodata_start+0x270>
    800000f8:	4dc010ef          	jal	800015d4 <uart_puts>
    800000fc:	04043783          	ld	a5,64(s0)
    80000100:	00b00713          	li	a4,11
    80000104:	00b00593          	li	a1,11
    80000108:	08e7b423          	sd	a4,136(a5)
    8000010c:	00006517          	auipc	a0,0x6
    80000110:	19c50513          	add	a0,a0,412 # 800062a8 <rodata_start+0x2a8>
    80000114:	150010ef          	jal	80001264 <printf>
    80000118:	5a0050ef          	jal	800056b8 <syscall>
    8000011c:	04043783          	ld	a5,64(s0)
    80000120:	00006517          	auipc	a0,0x6
    80000124:	1a850513          	add	a0,a0,424 # 800062c8 <rodata_start+0x2c8>
    80000128:	0507b583          	ld	a1,80(a5)
    8000012c:	138010ef          	jal	80001264 <printf>
    80000130:	04043703          	ld	a4,64(s0)
    80000134:	00442783          	lw	a5,4(s0)
    80000138:	05073703          	ld	a4,80(a4)
    8000013c:	56f70463          	beq	a4,a5,800006a4 <simulate_syscall_test+0x624>
    80000140:	00006517          	auipc	a0,0x6
    80000144:	1c050513          	add	a0,a0,448 # 80006300 <rodata_start+0x300>
    80000148:	48c010ef          	jal	800015d4 <uart_puts>
    8000014c:	00006517          	auipc	a0,0x6
    80000150:	1d450513          	add	a0,a0,468 # 80006320 <rodata_start+0x320>
    80000154:	480010ef          	jal	800015d4 <uart_puts>
    80000158:	00006517          	auipc	a0,0x6
    8000015c:	11850513          	add	a0,a0,280 # 80006270 <rodata_start+0x270>
    80000160:	474010ef          	jal	800015d4 <uart_puts>
    80000164:	04043783          	ld	a5,64(s0)
    80000168:	00e00713          	li	a4,14
    8000016c:	00e00593          	li	a1,14
    80000170:	08e7b423          	sd	a4,136(a5)
    80000174:	00006517          	auipc	a0,0x6
    80000178:	1d450513          	add	a0,a0,468 # 80006348 <rodata_start+0x348>
    8000017c:	0e8010ef          	jal	80001264 <printf>
    80000180:	538050ef          	jal	800056b8 <syscall>
    80000184:	04043783          	ld	a5,64(s0)
    80000188:	00006517          	auipc	a0,0x6
    8000018c:	1e050513          	add	a0,a0,480 # 80006368 <rodata_start+0x368>
    80000190:	00001937          	lui	s2,0x1
    80000194:	0507b583          	ld	a1,80(a5)
    80000198:	0cc010ef          	jal	80001264 <printf>
    8000019c:	00006517          	auipc	a0,0x6
    800001a0:	1fc50513          	add	a0,a0,508 # 80006398 <rodata_start+0x398>
    800001a4:	430010ef          	jal	800015d4 <uart_puts>
    800001a8:	00006517          	auipc	a0,0x6
    800001ac:	21050513          	add	a0,a0,528 # 800063b8 <rodata_start+0x3b8>
    800001b0:	424010ef          	jal	800015d4 <uart_puts>
    800001b4:	00006517          	auipc	a0,0x6
    800001b8:	0bc50513          	add	a0,a0,188 # 80006270 <rodata_start+0x270>
    800001bc:	418010ef          	jal	800015d4 <uart_puts>
    800001c0:	03043483          	ld	s1,48(s0)
    800001c4:	00006517          	auipc	a0,0x6
    800001c8:	22450513          	add	a0,a0,548 # 800063e8 <rodata_start+0x3e8>
    800001cc:	00048593          	mv	a1,s1
    800001d0:	094010ef          	jal	80001264 <printf>
    800001d4:	04043783          	ld	a5,64(s0)
    800001d8:	00c00713          	li	a4,12
    800001dc:	00c00593          	li	a1,12
    800001e0:	08e7b423          	sd	a4,136(a5)
    800001e4:	0527b823          	sd	s2,80(a5)
    800001e8:	00006517          	auipc	a0,0x6
    800001ec:	22850513          	add	a0,a0,552 # 80006410 <rodata_start+0x410>
    800001f0:	074010ef          	jal	80001264 <printf>
    800001f4:	00006517          	auipc	a0,0x6
    800001f8:	23c50513          	add	a0,a0,572 # 80006430 <rodata_start+0x430>
    800001fc:	068010ef          	jal	80001264 <printf>
    80000200:	4b8050ef          	jal	800056b8 <syscall>
    80000204:	04043783          	ld	a5,64(s0)
    80000208:	00006517          	auipc	a0,0x6
    8000020c:	25050513          	add	a0,a0,592 # 80006458 <rodata_start+0x458>
    80000210:	012484b3          	add	s1,s1,s2
    80000214:	0507b583          	ld	a1,80(a5)
    80000218:	04c010ef          	jal	80001264 <printf>
    8000021c:	03043583          	ld	a1,48(s0)
    80000220:	00006517          	auipc	a0,0x6
    80000224:	26850513          	add	a0,a0,616 # 80006488 <rodata_start+0x488>
    80000228:	03c010ef          	jal	80001264 <printf>
    8000022c:	03043783          	ld	a5,48(s0)
    80000230:	46978263          	beq	a5,s1,80000694 <simulate_syscall_test+0x614>
    80000234:	00006517          	auipc	a0,0x6
    80000238:	29c50513          	add	a0,a0,668 # 800064d0 <rodata_start+0x4d0>
    8000023c:	398010ef          	jal	800015d4 <uart_puts>
    80000240:	00006517          	auipc	a0,0x6
    80000244:	2b050513          	add	a0,a0,688 # 800064f0 <rodata_start+0x4f0>
    80000248:	38c010ef          	jal	800015d4 <uart_puts>
    8000024c:	00006517          	auipc	a0,0x6
    80000250:	02450513          	add	a0,a0,36 # 80006270 <rodata_start+0x270>
    80000254:	380010ef          	jal	800015d4 <uart_puts>
    80000258:	04043783          	ld	a5,64(s0)
    8000025c:	00100713          	li	a4,1
    80000260:	00100593          	li	a1,1
    80000264:	08e7b423          	sd	a4,136(a5)
    80000268:	00006517          	auipc	a0,0x6
    8000026c:	2b050513          	add	a0,a0,688 # 80006518 <rodata_start+0x518>
    80000270:	7f5000ef          	jal	80001264 <printf>
    80000274:	00442583          	lw	a1,4(s0)
    80000278:	00006517          	auipc	a0,0x6
    8000027c:	2c050513          	add	a0,a0,704 # 80006538 <rodata_start+0x538>
    80000280:	7e5000ef          	jal	80001264 <printf>
    80000284:	434050ef          	jal	800056b8 <syscall>
    80000288:	04043783          	ld	a5,64(s0)
    8000028c:	0507a483          	lw	s1,80(a5)
    80000290:	2a904663          	bgtz	s1,8000053c <simulate_syscall_test+0x4bc>
    80000294:	46049663          	bnez	s1,80000700 <simulate_syscall_test+0x680>
    80000298:	00006517          	auipc	a0,0x6
    8000029c:	39850513          	add	a0,a0,920 # 80006630 <rodata_start+0x630>
    800002a0:	334010ef          	jal	800015d4 <uart_puts>
    800002a4:	00006517          	auipc	a0,0x6
    800002a8:	fcc50513          	add	a0,a0,-52 # 80006270 <rodata_start+0x270>
    800002ac:	328010ef          	jal	800015d4 <uart_puts>
    800002b0:	2b1030ef          	jal	80003d60 <get_ticks>
    800002b4:	00050593          	mv	a1,a0
    800002b8:	00006517          	auipc	a0,0x6
    800002bc:	3a050513          	add	a0,a0,928 # 80006658 <rodata_start+0x658>
    800002c0:	7a5000ef          	jal	80001264 <printf>
    800002c4:	04043783          	ld	a5,64(s0)
    800002c8:	00d00713          	li	a4,13
    800002cc:	00d00593          	li	a1,13
    800002d0:	08e7b423          	sd	a4,136(a5)
    800002d4:	00500713          	li	a4,5
    800002d8:	04e7b823          	sd	a4,80(a5)
    800002dc:	00006517          	auipc	a0,0x6
    800002e0:	39c50513          	add	a0,a0,924 # 80006678 <rodata_start+0x678>
    800002e4:	781000ef          	jal	80001264 <printf>
    800002e8:	00006517          	auipc	a0,0x6
    800002ec:	3b050513          	add	a0,a0,944 # 80006698 <rodata_start+0x698>
    800002f0:	775000ef          	jal	80001264 <printf>
    800002f4:	00006517          	auipc	a0,0x6
    800002f8:	3cc50513          	add	a0,a0,972 # 800066c0 <rodata_start+0x6c0>
    800002fc:	769000ef          	jal	80001264 <printf>
    80000300:	3b8050ef          	jal	800056b8 <syscall>
    80000304:	25d030ef          	jal	80003d60 <get_ticks>
    80000308:	00050593          	mv	a1,a0
    8000030c:	00006517          	auipc	a0,0x6
    80000310:	3f450513          	add	a0,a0,1012 # 80006700 <rodata_start+0x700>
    80000314:	751000ef          	jal	80001264 <printf>
    80000318:	04043783          	ld	a5,64(s0)
    8000031c:	00006517          	auipc	a0,0x6
    80000320:	40450513          	add	a0,a0,1028 # 80006720 <rodata_start+0x720>
    80000324:	0507b583          	ld	a1,80(a5)
    80000328:	73d000ef          	jal	80001264 <printf>
    8000032c:	00006517          	auipc	a0,0x6
    80000330:	40c50513          	add	a0,a0,1036 # 80006738 <rodata_start+0x738>
    80000334:	2a0010ef          	jal	800015d4 <uart_puts>
    80000338:	00006517          	auipc	a0,0x6
    8000033c:	42050513          	add	a0,a0,1056 # 80006758 <rodata_start+0x758>
    80000340:	294010ef          	jal	800015d4 <uart_puts>
    80000344:	00006517          	auipc	a0,0x6
    80000348:	f2c50513          	add	a0,a0,-212 # 80006270 <rodata_start+0x270>
    8000034c:	288010ef          	jal	800015d4 <uart_puts>
    80000350:	28c040ef          	jal	800045dc <alloc_proc>
    80000354:	00050493          	mv	s1,a0
    80000358:	08050c63          	beqz	a0,800003f0 <simulate_syscall_test+0x370>
    8000035c:	00452583          	lw	a1,4(a0)
    80000360:	00200793          	li	a5,2
    80000364:	00f52023          	sw	a5,0(a0)
    80000368:	00006517          	auipc	a0,0x6
    8000036c:	41850513          	add	a0,a0,1048 # 80006780 <rodata_start+0x780>
    80000370:	6f5000ef          	jal	80001264 <printf>
    80000374:	04043783          	ld	a5,64(s0)
    80000378:	0044a703          	lw	a4,4(s1)
    8000037c:	00600693          	li	a3,6
    80000380:	08d7b423          	sd	a3,136(a5)
    80000384:	04e7b823          	sd	a4,80(a5)
    80000388:	00600593          	li	a1,6
    8000038c:	00006517          	auipc	a0,0x6
    80000390:	41450513          	add	a0,a0,1044 # 800067a0 <rodata_start+0x7a0>
    80000394:	6d1000ef          	jal	80001264 <printf>
    80000398:	0044a583          	lw	a1,4(s1)
    8000039c:	00006517          	auipc	a0,0x6
    800003a0:	42450513          	add	a0,a0,1060 # 800067c0 <rodata_start+0x7c0>
    800003a4:	6c1000ef          	jal	80001264 <printf>
    800003a8:	310050ef          	jal	800056b8 <syscall>
    800003ac:	04043783          	ld	a5,64(s0)
    800003b0:	0507b783          	ld	a5,80(a5)
    800003b4:	30079063          	bnez	a5,800006b4 <simulate_syscall_test+0x634>
    800003b8:	00006517          	auipc	a0,0x6
    800003bc:	42850513          	add	a0,a0,1064 # 800067e0 <rodata_start+0x7e0>
    800003c0:	6a5000ef          	jal	80001264 <printf>
    800003c4:	0144a583          	lw	a1,20(s1)
    800003c8:	00006517          	auipc	a0,0x6
    800003cc:	43850513          	add	a0,a0,1080 # 80006800 <rodata_start+0x800>
    800003d0:	695000ef          	jal	80001264 <printf>
    800003d4:	0144a783          	lw	a5,20(s1)
    800003d8:	2e078a63          	beqz	a5,800006cc <simulate_syscall_test+0x64c>
    800003dc:	00006517          	auipc	a0,0x6
    800003e0:	44c50513          	add	a0,a0,1100 # 80006828 <rodata_start+0x828>
    800003e4:	1f0010ef          	jal	800015d4 <uart_puts>
    800003e8:	00048513          	mv	a0,s1
    800003ec:	3b0040ef          	jal	8000479c <free_proc>
    800003f0:	00006517          	auipc	a0,0x6
    800003f4:	4a850513          	add	a0,a0,1192 # 80006898 <rodata_start+0x898>
    800003f8:	1dc010ef          	jal	800015d4 <uart_puts>
    800003fc:	00006517          	auipc	a0,0x6
    80000400:	e7450513          	add	a0,a0,-396 # 80006270 <rodata_start+0x270>
    80000404:	1d0010ef          	jal	800015d4 <uart_puts>
    80000408:	04043783          	ld	a5,64(s0)
    8000040c:	00100713          	li	a4,1
    80000410:	08e7b423          	sd	a4,136(a5)
    80000414:	2a4050ef          	jal	800056b8 <syscall>
    80000418:	04043783          	ld	a5,64(s0)
    8000041c:	0507a483          	lw	s1,80(a5)
    80000420:	18904e63          	bgtz	s1,800005bc <simulate_syscall_test+0x53c>
    80000424:	00006517          	auipc	a0,0x6
    80000428:	59450513          	add	a0,a0,1428 # 800069b8 <rodata_start+0x9b8>
    8000042c:	1a8010ef          	jal	800015d4 <uart_puts>
    80000430:	00006517          	auipc	a0,0x6
    80000434:	e4050513          	add	a0,a0,-448 # 80006270 <rodata_start+0x270>
    80000438:	19c010ef          	jal	800015d4 <uart_puts>
    8000043c:	04043783          	ld	a5,64(s0)
    80000440:	00500713          	li	a4,5
    80000444:	00500593          	li	a1,5
    80000448:	08e7b423          	sd	a4,136(a5)
    8000044c:	00006517          	auipc	a0,0x6
    80000450:	59c50513          	add	a0,a0,1436 # 800069e8 <rodata_start+0x9e8>
    80000454:	611000ef          	jal	80001264 <printf>
    80000458:	260050ef          	jal	800056b8 <syscall>
    8000045c:	04043783          	ld	a5,64(s0)
    80000460:	00006517          	auipc	a0,0x6
    80000464:	5b850513          	add	a0,a0,1464 # 80006a18 <rodata_start+0xa18>
    80000468:	0507b583          	ld	a1,80(a5)
    8000046c:	5f9000ef          	jal	80001264 <printf>
    80000470:	04043703          	ld	a4,64(s0)
    80000474:	fff00793          	li	a5,-1
    80000478:	05073703          	ld	a4,80(a4)
    8000047c:	20f70463          	beq	a4,a5,80000684 <simulate_syscall_test+0x604>
    80000480:	00006517          	auipc	a0,0x6
    80000484:	5f050513          	add	a0,a0,1520 # 80006a70 <rodata_start+0xa70>
    80000488:	14c010ef          	jal	800015d4 <uart_puts>
    8000048c:	00006517          	auipc	a0,0x6
    80000490:	5fc50513          	add	a0,a0,1532 # 80006a88 <rodata_start+0xa88>
    80000494:	140010ef          	jal	800015d4 <uart_puts>
    80000498:	00006517          	auipc	a0,0x6
    8000049c:	dd850513          	add	a0,a0,-552 # 80006270 <rodata_start+0x270>
    800004a0:	134010ef          	jal	800015d4 <uart_puts>
    800004a4:	04043783          	ld	a5,64(s0)
    800004a8:	3e700713          	li	a4,999
    800004ac:	00006517          	auipc	a0,0x6
    800004b0:	60c50513          	add	a0,a0,1548 # 80006ab8 <rodata_start+0xab8>
    800004b4:	08e7b423          	sd	a4,136(a5)
    800004b8:	5ad000ef          	jal	80001264 <printf>
    800004bc:	1fc050ef          	jal	800056b8 <syscall>
    800004c0:	04043783          	ld	a5,64(s0)
    800004c4:	00006517          	auipc	a0,0x6
    800004c8:	55450513          	add	a0,a0,1364 # 80006a18 <rodata_start+0xa18>
    800004cc:	0507b583          	ld	a1,80(a5)
    800004d0:	595000ef          	jal	80001264 <printf>
    800004d4:	04043703          	ld	a4,64(s0)
    800004d8:	fff00793          	li	a5,-1
    800004dc:	05073703          	ld	a4,80(a4)
    800004e0:	18f70a63          	beq	a4,a5,80000674 <simulate_syscall_test+0x5f4>
    800004e4:	00006517          	auipc	a0,0x6
    800004e8:	58c50513          	add	a0,a0,1420 # 80006a70 <rodata_start+0xa70>
    800004ec:	0e8010ef          	jal	800015d4 <uart_puts>
    800004f0:	00000513          	li	a0,0
    800004f4:	410040ef          	jal	80004904 <set_current_proc>
    800004f8:	00040513          	mv	a0,s0
    800004fc:	2a0040ef          	jal	8000479c <free_proc>
    80000500:	00006517          	auipc	a0,0x6
    80000504:	b1050513          	add	a0,a0,-1264 # 80006010 <rodata_start+0x10>
    80000508:	0cc010ef          	jal	800015d4 <uart_puts>
    8000050c:	00006517          	auipc	a0,0x6
    80000510:	60c50513          	add	a0,a0,1548 # 80006b18 <rodata_start+0xb18>
    80000514:	0c0010ef          	jal	800015d4 <uart_puts>
    80000518:	02013403          	ld	s0,32(sp)
    8000051c:	02813083          	ld	ra,40(sp)
    80000520:	01813483          	ld	s1,24(sp)
    80000524:	01013903          	ld	s2,16(sp)
    80000528:	00813983          	ld	s3,8(sp)
    8000052c:	00006517          	auipc	a0,0x6
    80000530:	c1450513          	add	a0,a0,-1004 # 80006140 <rodata_start+0x140>
    80000534:	03010113          	add	sp,sp,48
    80000538:	09c0106f          	j	800015d4 <uart_puts>
    8000053c:	00048593          	mv	a1,s1
    80000540:	00006517          	auipc	a0,0x6
    80000544:	01050513          	add	a0,a0,16 # 80006550 <rodata_start+0x550>
    80000548:	51d000ef          	jal	80001264 <printf>
    8000054c:	00048513          	mv	a0,s1
    80000550:	2c0040ef          	jal	80004810 <find_proc>
    80000554:	00050493          	mv	s1,a0
    80000558:	1a050c63          	beqz	a0,80000710 <simulate_syscall_test+0x690>
    8000055c:	00052583          	lw	a1,0(a0)
    80000560:	00200613          	li	a2,2
    80000564:	00006517          	auipc	a0,0x6
    80000568:	01450513          	add	a0,a0,20 # 80006578 <rodata_start+0x578>
    8000056c:	4f9000ef          	jal	80001264 <printf>
    80000570:	0084a583          	lw	a1,8(s1)
    80000574:	00006517          	auipc	a0,0x6
    80000578:	02c50513          	add	a0,a0,44 # 800065a0 <rodata_start+0x5a0>
    8000057c:	4e9000ef          	jal	80001264 <printf>
    80000580:	0c04b783          	ld	a5,192(s1)
    80000584:	00006597          	auipc	a1,0x6
    80000588:	a7c58593          	add	a1,a1,-1412 # 80006000 <rodata_start>
    8000058c:	00878663          	beq	a5,s0,80000598 <simulate_syscall_test+0x518>
    80000590:	00006597          	auipc	a1,0x6
    80000594:	a7858593          	add	a1,a1,-1416 # 80006008 <rodata_start+0x8>
    80000598:	00006517          	auipc	a0,0x6
    8000059c:	02850513          	add	a0,a0,40 # 800065c0 <rodata_start+0x5c0>
    800005a0:	4c5000ef          	jal	80001264 <printf>
    800005a4:	00048513          	mv	a0,s1
    800005a8:	1f4040ef          	jal	8000479c <free_proc>
    800005ac:	00006517          	auipc	a0,0x6
    800005b0:	02c50513          	add	a0,a0,44 # 800065d8 <rodata_start+0x5d8>
    800005b4:	020010ef          	jal	800015d4 <uart_puts>
    800005b8:	ce1ff06f          	j	80000298 <simulate_syscall_test+0x218>
    800005bc:	00048513          	mv	a0,s1
    800005c0:	250040ef          	jal	80004810 <find_proc>
    800005c4:	00050913          	mv	s2,a0
    800005c8:	e4050ee3          	beqz	a0,80000424 <simulate_syscall_test+0x3a4>
    800005cc:	00048593          	mv	a1,s1
    800005d0:	00006517          	auipc	a0,0x6
    800005d4:	2f850513          	add	a0,a0,760 # 800068c8 <rodata_start+0x8c8>
    800005d8:	48d000ef          	jal	80001264 <printf>
    800005dc:	00090513          	mv	a0,s2
    800005e0:	324040ef          	jal	80004904 <set_current_proc>
    800005e4:	04093783          	ld	a5,64(s2) # 1040 <_entry-0x7fffefc0>
    800005e8:	00200713          	li	a4,2
    800005ec:	02a00993          	li	s3,42
    800005f0:	08e7b423          	sd	a4,136(a5)
    800005f4:	0537b823          	sd	s3,80(a5)
    800005f8:	00006517          	auipc	a0,0x6
    800005fc:	2f050513          	add	a0,a0,752 # 800068e8 <rodata_start+0x8e8>
    80000600:	465000ef          	jal	80001264 <printf>
    80000604:	00500793          	li	a5,5
    80000608:	02a00593          	li	a1,42
    8000060c:	00f92023          	sw	a5,0(s2)
    80000610:	01392823          	sw	s3,16(s2)
    80000614:	00006517          	auipc	a0,0x6
    80000618:	2f450513          	add	a0,a0,756 # 80006908 <rodata_start+0x908>
    8000061c:	449000ef          	jal	80001264 <printf>
    80000620:	00040513          	mv	a0,s0
    80000624:	2e0040ef          	jal	80004904 <set_current_proc>
    80000628:	04043783          	ld	a5,64(s0)
    8000062c:	00300713          	li	a4,3
    80000630:	00006517          	auipc	a0,0x6
    80000634:	30850513          	add	a0,a0,776 # 80006938 <rodata_start+0x938>
    80000638:	08e7b423          	sd	a4,136(a5)
    8000063c:	0407b823          	sd	zero,80(a5)
    80000640:	425000ef          	jal	80001264 <printf>
    80000644:	074050ef          	jal	800056b8 <syscall>
    80000648:	04043783          	ld	a5,64(s0)
    8000064c:	00006517          	auipc	a0,0x6
    80000650:	30450513          	add	a0,a0,772 # 80006950 <rodata_start+0x950>
    80000654:	0507a903          	lw	s2,80(a5)
    80000658:	00090593          	mv	a1,s2
    8000065c:	409000ef          	jal	80001264 <printf>
    80000660:	0d248063          	beq	s1,s2,80000720 <simulate_syscall_test+0x6a0>
    80000664:	00006517          	auipc	a0,0x6
    80000668:	32c50513          	add	a0,a0,812 # 80006990 <rodata_start+0x990>
    8000066c:	769000ef          	jal	800015d4 <uart_puts>
    80000670:	db5ff06f          	j	80000424 <simulate_syscall_test+0x3a4>
    80000674:	00006517          	auipc	a0,0x6
    80000678:	47450513          	add	a0,a0,1140 # 80006ae8 <rodata_start+0xae8>
    8000067c:	759000ef          	jal	800015d4 <uart_puts>
    80000680:	e71ff06f          	j	800004f0 <simulate_syscall_test+0x470>
    80000684:	00006517          	auipc	a0,0x6
    80000688:	3bc50513          	add	a0,a0,956 # 80006a40 <rodata_start+0xa40>
    8000068c:	749000ef          	jal	800015d4 <uart_puts>
    80000690:	dfdff06f          	j	8000048c <simulate_syscall_test+0x40c>
    80000694:	00006517          	auipc	a0,0x6
    80000698:	e1c50513          	add	a0,a0,-484 # 800064b0 <rodata_start+0x4b0>
    8000069c:	739000ef          	jal	800015d4 <uart_puts>
    800006a0:	ba1ff06f          	j	80000240 <simulate_syscall_test+0x1c0>
    800006a4:	00006517          	auipc	a0,0x6
    800006a8:	c3c50513          	add	a0,a0,-964 # 800062e0 <rodata_start+0x2e0>
    800006ac:	729000ef          	jal	800015d4 <uart_puts>
    800006b0:	a9dff06f          	j	8000014c <simulate_syscall_test+0xcc>
    800006b4:	00006517          	auipc	a0,0x6
    800006b8:	1cc50513          	add	a0,a0,460 # 80006880 <rodata_start+0x880>
    800006bc:	719000ef          	jal	800015d4 <uart_puts>
    800006c0:	00048513          	mv	a0,s1
    800006c4:	0d8040ef          	jal	8000479c <free_proc>
    800006c8:	d29ff06f          	j	800003f0 <simulate_syscall_test+0x370>
    800006cc:	00006517          	auipc	a0,0x6
    800006d0:	18c50513          	add	a0,a0,396 # 80006858 <rodata_start+0x858>
    800006d4:	701000ef          	jal	800015d4 <uart_puts>
    800006d8:	fe9ff06f          	j	800006c0 <simulate_syscall_test+0x640>
    800006dc:	02013403          	ld	s0,32(sp)
    800006e0:	02813083          	ld	ra,40(sp)
    800006e4:	01813483          	ld	s1,24(sp)
    800006e8:	01013903          	ld	s2,16(sp)
    800006ec:	00813983          	ld	s3,8(sp)
    800006f0:	00006517          	auipc	a0,0x6
    800006f4:	b2050513          	add	a0,a0,-1248 # 80006210 <rodata_start+0x210>
    800006f8:	03010113          	add	sp,sp,48
    800006fc:	6d90006f          	j	800015d4 <uart_puts>
    80000700:	00006517          	auipc	a0,0x6
    80000704:	f1850513          	add	a0,a0,-232 # 80006618 <rodata_start+0x618>
    80000708:	6cd000ef          	jal	800015d4 <uart_puts>
    8000070c:	b8dff06f          	j	80000298 <simulate_syscall_test+0x218>
    80000710:	00006517          	auipc	a0,0x6
    80000714:	ee850513          	add	a0,a0,-280 # 800065f8 <rodata_start+0x5f8>
    80000718:	6bd000ef          	jal	800015d4 <uart_puts>
    8000071c:	b7dff06f          	j	80000298 <simulate_syscall_test+0x218>
    80000720:	00006517          	auipc	a0,0x6
    80000724:	24850513          	add	a0,a0,584 # 80006968 <rodata_start+0x968>
    80000728:	6ad000ef          	jal	800015d4 <uart_puts>
    8000072c:	cf9ff06f          	j	80000424 <simulate_syscall_test+0x3a4>

0000000080000730 <test_argument_extraction>:
    80000730:	fc010113          	add	sp,sp,-64
    80000734:	00006517          	auipc	a0,0x6
    80000738:	8dc50513          	add	a0,a0,-1828 # 80006010 <rodata_start+0x10>
    8000073c:	02113c23          	sd	ra,56(sp)
    80000740:	02813823          	sd	s0,48(sp)
    80000744:	02913423          	sd	s1,40(sp)
    80000748:	68d000ef          	jal	800015d4 <uart_puts>
    8000074c:	00006517          	auipc	a0,0x6
    80000750:	42450513          	add	a0,a0,1060 # 80006b70 <rodata_start+0xb70>
    80000754:	681000ef          	jal	800015d4 <uart_puts>
    80000758:	00006517          	auipc	a0,0x6
    8000075c:	9e850513          	add	a0,a0,-1560 # 80006140 <rodata_start+0x140>
    80000760:	675000ef          	jal	800015d4 <uart_puts>
    80000764:	679030ef          	jal	800045dc <alloc_proc>
    80000768:	22050263          	beqz	a0,8000098c <test_argument_extraction+0x25c>
    8000076c:	00050413          	mv	s0,a0
    80000770:	194040ef          	jal	80004904 <set_current_proc>
    80000774:	00300793          	li	a5,3
    80000778:	00f42023          	sw	a5,0(s0)
    8000077c:	00006517          	auipc	a0,0x6
    80000780:	44c50513          	add	a0,a0,1100 # 80006bc8 <rodata_start+0xbc8>
    80000784:	651000ef          	jal	800015d4 <uart_puts>
    80000788:	00006517          	auipc	a0,0x6
    8000078c:	ae850513          	add	a0,a0,-1304 # 80006270 <rodata_start+0x270>
    80000790:	645000ef          	jal	800015d4 <uart_puts>
    80000794:	04043783          	ld	a5,64(s0)
    80000798:	0c800713          	li	a4,200
    8000079c:	06400493          	li	s1,100
    800007a0:	04e7bc23          	sd	a4,88(a5)
    800007a4:	12c00713          	li	a4,300
    800007a8:	0497b823          	sd	s1,80(a5)
    800007ac:	06e7b023          	sd	a4,96(a5)
    800007b0:	00010593          	mv	a1,sp
    800007b4:	00000513          	li	a0,0
    800007b8:	441040ef          	jal	800053f8 <argint>
    800007bc:	00051663          	bnez	a0,800007c8 <test_argument_extraction+0x98>
    800007c0:	00012783          	lw	a5,0(sp)
    800007c4:	16978c63          	beq	a5,s1,8000093c <test_argument_extraction+0x20c>
    800007c8:	00006517          	auipc	a0,0x6
    800007cc:	44850513          	add	a0,a0,1096 # 80006c10 <rodata_start+0xc10>
    800007d0:	605000ef          	jal	800015d4 <uart_puts>
    800007d4:	00410593          	add	a1,sp,4
    800007d8:	00100513          	li	a0,1
    800007dc:	41d040ef          	jal	800053f8 <argint>
    800007e0:	00051863          	bnez	a0,800007f0 <test_argument_extraction+0xc0>
    800007e4:	00412703          	lw	a4,4(sp)
    800007e8:	0c800793          	li	a5,200
    800007ec:	16f70263          	beq	a4,a5,80000950 <test_argument_extraction+0x220>
    800007f0:	00006517          	auipc	a0,0x6
    800007f4:	45050513          	add	a0,a0,1104 # 80006c40 <rodata_start+0xc40>
    800007f8:	5dd000ef          	jal	800015d4 <uart_puts>
    800007fc:	00810593          	add	a1,sp,8
    80000800:	00200513          	li	a0,2
    80000804:	3f5040ef          	jal	800053f8 <argint>
    80000808:	00051863          	bnez	a0,80000818 <test_argument_extraction+0xe8>
    8000080c:	00812703          	lw	a4,8(sp)
    80000810:	12c00793          	li	a5,300
    80000814:	14f70863          	beq	a4,a5,80000964 <test_argument_extraction+0x234>
    80000818:	00006517          	auipc	a0,0x6
    8000081c:	45850513          	add	a0,a0,1112 # 80006c70 <rodata_start+0xc70>
    80000820:	5b5000ef          	jal	800015d4 <uart_puts>
    80000824:	00006517          	auipc	a0,0x6
    80000828:	46c50513          	add	a0,a0,1132 # 80006c90 <rodata_start+0xc90>
    8000082c:	5a9000ef          	jal	800015d4 <uart_puts>
    80000830:	00006517          	auipc	a0,0x6
    80000834:	a4050513          	add	a0,a0,-1472 # 80006270 <rodata_start+0x270>
    80000838:	59d000ef          	jal	800015d4 <uart_puts>
    8000083c:	04043783          	ld	a5,64(s0)
    80000840:	000014b7          	lui	s1,0x1
    80000844:	00002737          	lui	a4,0x2
    80000848:	0497b823          	sd	s1,80(a5)
    8000084c:	04e7bc23          	sd	a4,88(a5)
    80000850:	01010593          	add	a1,sp,16
    80000854:	00000513          	li	a0,0
    80000858:	4d9040ef          	jal	80005530 <argaddr>
    8000085c:	00051663          	bnez	a0,80000868 <test_argument_extraction+0x138>
    80000860:	01013783          	ld	a5,16(sp)
    80000864:	10978a63          	beq	a5,s1,80000978 <test_argument_extraction+0x248>
    80000868:	00006517          	auipc	a0,0x6
    8000086c:	47850513          	add	a0,a0,1144 # 80006ce0 <rodata_start+0xce0>
    80000870:	565000ef          	jal	800015d4 <uart_puts>
    80000874:	01810593          	add	a1,sp,24
    80000878:	00100513          	li	a0,1
    8000087c:	4b5040ef          	jal	80005530 <argaddr>
    80000880:	00051863          	bnez	a0,80000890 <test_argument_extraction+0x160>
    80000884:	01813703          	ld	a4,24(sp)
    80000888:	000027b7          	lui	a5,0x2
    8000088c:	08f70e63          	beq	a4,a5,80000928 <test_argument_extraction+0x1f8>
    80000890:	00006517          	auipc	a0,0x6
    80000894:	49050513          	add	a0,a0,1168 # 80006d20 <rodata_start+0xd20>
    80000898:	53d000ef          	jal	800015d4 <uart_puts>
    8000089c:	00006517          	auipc	a0,0x6
    800008a0:	4a450513          	add	a0,a0,1188 # 80006d40 <rodata_start+0xd40>
    800008a4:	531000ef          	jal	800015d4 <uart_puts>
    800008a8:	00006517          	auipc	a0,0x6
    800008ac:	9c850513          	add	a0,a0,-1592 # 80006270 <rodata_start+0x270>
    800008b0:	525000ef          	jal	800015d4 <uart_puts>
    800008b4:	00c10593          	add	a1,sp,12
    800008b8:	00600513          	li	a0,6
    800008bc:	33d040ef          	jal	800053f8 <argint>
    800008c0:	04054c63          	bltz	a0,80000918 <test_argument_extraction+0x1e8>
    800008c4:	00006517          	auipc	a0,0x6
    800008c8:	4ec50513          	add	a0,a0,1260 # 80006db0 <rodata_start+0xdb0>
    800008cc:	509000ef          	jal	800015d4 <uart_puts>
    800008d0:	00000513          	li	a0,0
    800008d4:	030040ef          	jal	80004904 <set_current_proc>
    800008d8:	00040513          	mv	a0,s0
    800008dc:	6c1030ef          	jal	8000479c <free_proc>
    800008e0:	00006517          	auipc	a0,0x6
    800008e4:	4f850513          	add	a0,a0,1272 # 80006dd8 <rodata_start+0xdd8>
    800008e8:	4ed000ef          	jal	800015d4 <uart_puts>
    800008ec:	00006517          	auipc	a0,0x6
    800008f0:	5bc50513          	add	a0,a0,1468 # 80006ea8 <rodata_start+0xea8>
    800008f4:	4e1000ef          	jal	800015d4 <uart_puts>
    800008f8:	00006517          	auipc	a0,0x6
    800008fc:	84850513          	add	a0,a0,-1976 # 80006140 <rodata_start+0x140>
    80000900:	4d5000ef          	jal	800015d4 <uart_puts>
    80000904:	03813083          	ld	ra,56(sp)
    80000908:	03013403          	ld	s0,48(sp)
    8000090c:	02813483          	ld	s1,40(sp)
    80000910:	04010113          	add	sp,sp,64
    80000914:	00008067          	ret
    80000918:	00006517          	auipc	a0,0x6
    8000091c:	46050513          	add	a0,a0,1120 # 80006d78 <rodata_start+0xd78>
    80000920:	4b5000ef          	jal	800015d4 <uart_puts>
    80000924:	fadff06f          	j	800008d0 <test_argument_extraction+0x1a0>
    80000928:	000025b7          	lui	a1,0x2
    8000092c:	00006517          	auipc	a0,0x6
    80000930:	3d450513          	add	a0,a0,980 # 80006d00 <rodata_start+0xd00>
    80000934:	131000ef          	jal	80001264 <printf>
    80000938:	f65ff06f          	j	8000089c <test_argument_extraction+0x16c>
    8000093c:	06400593          	li	a1,100
    80000940:	00006517          	auipc	a0,0x6
    80000944:	2b850513          	add	a0,a0,696 # 80006bf8 <rodata_start+0xbf8>
    80000948:	11d000ef          	jal	80001264 <printf>
    8000094c:	e89ff06f          	j	800007d4 <test_argument_extraction+0xa4>
    80000950:	0c800593          	li	a1,200
    80000954:	00006517          	auipc	a0,0x6
    80000958:	2d450513          	add	a0,a0,724 # 80006c28 <rodata_start+0xc28>
    8000095c:	109000ef          	jal	80001264 <printf>
    80000960:	e9dff06f          	j	800007fc <test_argument_extraction+0xcc>
    80000964:	12c00593          	li	a1,300
    80000968:	00006517          	auipc	a0,0x6
    8000096c:	2f050513          	add	a0,a0,752 # 80006c58 <rodata_start+0xc58>
    80000970:	0f5000ef          	jal	80001264 <printf>
    80000974:	eb1ff06f          	j	80000824 <test_argument_extraction+0xf4>
    80000978:	000015b7          	lui	a1,0x1
    8000097c:	00006517          	auipc	a0,0x6
    80000980:	34450513          	add	a0,a0,836 # 80006cc0 <rodata_start+0xcc0>
    80000984:	0e1000ef          	jal	80001264 <printf>
    80000988:	eedff06f          	j	80000874 <test_argument_extraction+0x144>
    8000098c:	03013403          	ld	s0,48(sp)
    80000990:	03813083          	ld	ra,56(sp)
    80000994:	02813483          	ld	s1,40(sp)
    80000998:	00006517          	auipc	a0,0x6
    8000099c:	87850513          	add	a0,a0,-1928 # 80006210 <rodata_start+0x210>
    800009a0:	04010113          	add	sp,sp,64
    800009a4:	4310006f          	j	800015d4 <uart_puts>

00000000800009a8 <test_syscall_mechanism>:
    800009a8:	ff010113          	add	sp,sp,-16
    800009ac:	00005517          	auipc	a0,0x5
    800009b0:	66450513          	add	a0,a0,1636 # 80006010 <rodata_start+0x10>
    800009b4:	00113423          	sd	ra,8(sp)
    800009b8:	41d000ef          	jal	800015d4 <uart_puts>
    800009bc:	00006517          	auipc	a0,0x6
    800009c0:	54450513          	add	a0,a0,1348 # 80006f00 <rodata_start+0xf00>
    800009c4:	411000ef          	jal	800015d4 <uart_puts>
    800009c8:	00005517          	auipc	a0,0x5
    800009cc:	77850513          	add	a0,a0,1912 # 80006140 <rodata_start+0x140>
    800009d0:	405000ef          	jal	800015d4 <uart_puts>
    800009d4:	00006517          	auipc	a0,0x6
    800009d8:	58450513          	add	a0,a0,1412 # 80006f58 <rodata_start+0xf58>
    800009dc:	3f9000ef          	jal	800015d4 <uart_puts>
    800009e0:	00006517          	auipc	a0,0x6
    800009e4:	89050513          	add	a0,a0,-1904 # 80006270 <rodata_start+0x270>
    800009e8:	3ed000ef          	jal	800015d4 <uart_puts>
    800009ec:	00006517          	auipc	a0,0x6
    800009f0:	59c50513          	add	a0,a0,1436 # 80006f88 <rodata_start+0xf88>
    800009f4:	3e1000ef          	jal	800015d4 <uart_puts>
    800009f8:	00006517          	auipc	a0,0x6
    800009fc:	5c850513          	add	a0,a0,1480 # 80006fc0 <rodata_start+0xfc0>
    80000a00:	3d5000ef          	jal	800015d4 <uart_puts>
    80000a04:	00006517          	auipc	a0,0x6
    80000a08:	5f450513          	add	a0,a0,1524 # 80006ff8 <rodata_start+0xff8>
    80000a0c:	3c9000ef          	jal	800015d4 <uart_puts>
    80000a10:	00006517          	auipc	a0,0x6
    80000a14:	61050513          	add	a0,a0,1552 # 80007020 <rodata_start+0x1020>
    80000a18:	3bd000ef          	jal	800015d4 <uart_puts>
    80000a1c:	00006517          	auipc	a0,0x6
    80000a20:	63c50513          	add	a0,a0,1596 # 80007058 <rodata_start+0x1058>
    80000a24:	3b1000ef          	jal	800015d4 <uart_puts>
    80000a28:	00006517          	auipc	a0,0x6
    80000a2c:	65850513          	add	a0,a0,1624 # 80007080 <rodata_start+0x1080>
    80000a30:	3a5000ef          	jal	800015d4 <uart_puts>
    80000a34:	00006517          	auipc	a0,0x6
    80000a38:	67c50513          	add	a0,a0,1660 # 800070b0 <rodata_start+0x10b0>
    80000a3c:	399000ef          	jal	800015d4 <uart_puts>
    80000a40:	00006517          	auipc	a0,0x6
    80000a44:	6a050513          	add	a0,a0,1696 # 800070e0 <rodata_start+0x10e0>
    80000a48:	38d000ef          	jal	800015d4 <uart_puts>
    80000a4c:	00006517          	auipc	a0,0x6
    80000a50:	6cc50513          	add	a0,a0,1740 # 80007118 <rodata_start+0x1118>
    80000a54:	381000ef          	jal	800015d4 <uart_puts>
    80000a58:	00006517          	auipc	a0,0x6
    80000a5c:	70050513          	add	a0,a0,1792 # 80007158 <rodata_start+0x1158>
    80000a60:	375000ef          	jal	800015d4 <uart_puts>
    80000a64:	00006517          	auipc	a0,0x6
    80000a68:	71c50513          	add	a0,a0,1820 # 80007180 <rodata_start+0x1180>
    80000a6c:	369000ef          	jal	800015d4 <uart_puts>
    80000a70:	00006517          	auipc	a0,0x6
    80000a74:	74850513          	add	a0,a0,1864 # 800071b8 <rodata_start+0x11b8>
    80000a78:	35d000ef          	jal	800015d4 <uart_puts>
    80000a7c:	00006517          	auipc	a0,0x6
    80000a80:	76450513          	add	a0,a0,1892 # 800071e0 <rodata_start+0x11e0>
    80000a84:	351000ef          	jal	800015d4 <uart_puts>
    80000a88:	00006517          	auipc	a0,0x6
    80000a8c:	78850513          	add	a0,a0,1928 # 80007210 <rodata_start+0x1210>
    80000a90:	345000ef          	jal	800015d4 <uart_puts>
    80000a94:	00005517          	auipc	a0,0x5
    80000a98:	7dc50513          	add	a0,a0,2012 # 80006270 <rodata_start+0x270>
    80000a9c:	339000ef          	jal	800015d4 <uart_puts>
    80000aa0:	00006517          	auipc	a0,0x6
    80000aa4:	79050513          	add	a0,a0,1936 # 80007230 <rodata_start+0x1230>
    80000aa8:	32d000ef          	jal	800015d4 <uart_puts>
    80000aac:	00006517          	auipc	a0,0x6
    80000ab0:	7b450513          	add	a0,a0,1972 # 80007260 <rodata_start+0x1260>
    80000ab4:	321000ef          	jal	800015d4 <uart_puts>
    80000ab8:	00006517          	auipc	a0,0x6
    80000abc:	7d050513          	add	a0,a0,2000 # 80007288 <rodata_start+0x1288>
    80000ac0:	315000ef          	jal	800015d4 <uart_puts>
    80000ac4:	00006517          	auipc	a0,0x6
    80000ac8:	7f450513          	add	a0,a0,2036 # 800072b8 <rodata_start+0x12b8>
    80000acc:	309000ef          	jal	800015d4 <uart_puts>
    80000ad0:	00007517          	auipc	a0,0x7
    80000ad4:	81850513          	add	a0,a0,-2024 # 800072e8 <rodata_start+0x12e8>
    80000ad8:	2fd000ef          	jal	800015d4 <uart_puts>
    80000adc:	00007517          	auipc	a0,0x7
    80000ae0:	83c50513          	add	a0,a0,-1988 # 80007318 <rodata_start+0x1318>
    80000ae4:	2f1000ef          	jal	800015d4 <uart_puts>
    80000ae8:	00007517          	auipc	a0,0x7
    80000aec:	85850513          	add	a0,a0,-1960 # 80007340 <rodata_start+0x1340>
    80000af0:	2e5000ef          	jal	800015d4 <uart_puts>
    80000af4:	00007517          	auipc	a0,0x7
    80000af8:	87450513          	add	a0,a0,-1932 # 80007368 <rodata_start+0x1368>
    80000afc:	2d9000ef          	jal	800015d4 <uart_puts>
    80000b00:	00007517          	auipc	a0,0x7
    80000b04:	89850513          	add	a0,a0,-1896 # 80007398 <rodata_start+0x1398>
    80000b08:	2cd000ef          	jal	800015d4 <uart_puts>
    80000b0c:	00005517          	auipc	a0,0x5
    80000b10:	76450513          	add	a0,a0,1892 # 80006270 <rodata_start+0x270>
    80000b14:	2c1000ef          	jal	800015d4 <uart_puts>
    80000b18:	00007517          	auipc	a0,0x7
    80000b1c:	8a050513          	add	a0,a0,-1888 # 800073b8 <rodata_start+0x13b8>
    80000b20:	2b5000ef          	jal	800015d4 <uart_puts>
    80000b24:	00007517          	auipc	a0,0x7
    80000b28:	8cc50513          	add	a0,a0,-1844 # 800073f0 <rodata_start+0x13f0>
    80000b2c:	2a9000ef          	jal	800015d4 <uart_puts>
    80000b30:	00006517          	auipc	a0,0x6
    80000b34:	2a850513          	add	a0,a0,680 # 80006dd8 <rodata_start+0xdd8>
    80000b38:	29d000ef          	jal	800015d4 <uart_puts>
    80000b3c:	00007517          	auipc	a0,0x7
    80000b40:	8e450513          	add	a0,a0,-1820 # 80007420 <rodata_start+0x1420>
    80000b44:	291000ef          	jal	800015d4 <uart_puts>
    80000b48:	00813083          	ld	ra,8(sp)
    80000b4c:	00005517          	auipc	a0,0x5
    80000b50:	5f450513          	add	a0,a0,1524 # 80006140 <rodata_start+0x140>
    80000b54:	01010113          	add	sp,sp,16
    80000b58:	27d0006f          	j	800015d4 <uart_puts>

0000000080000b5c <main>:
    80000b5c:	ff010113          	add	sp,sp,-16
    80000b60:	00006517          	auipc	a0,0x6
    80000b64:	cf050513          	add	a0,a0,-784 # 80006850 <rodata_start+0x850>
    80000b68:	00113423          	sd	ra,8(sp)
    80000b6c:	269000ef          	jal	800015d4 <uart_puts>
    80000b70:	00007517          	auipc	a0,0x7
    80000b74:	90850513          	add	a0,a0,-1784 # 80007478 <rodata_start+0x1478>
    80000b78:	25d000ef          	jal	800015d4 <uart_puts>
    80000b7c:	00007517          	auipc	a0,0x7
    80000b80:	9c450513          	add	a0,a0,-1596 # 80007540 <rodata_start+0x1540>
    80000b84:	251000ef          	jal	800015d4 <uart_puts>
    80000b88:	00007517          	auipc	a0,0x7
    80000b8c:	a0050513          	add	a0,a0,-1536 # 80007588 <rodata_start+0x1588>
    80000b90:	245000ef          	jal	800015d4 <uart_puts>
    80000b94:	00007517          	auipc	a0,0x7
    80000b98:	a4c50513          	add	a0,a0,-1460 # 800075e0 <rodata_start+0x15e0>
    80000b9c:	239000ef          	jal	800015d4 <uart_puts>
    80000ba0:	00007517          	auipc	a0,0x7
    80000ba4:	9a050513          	add	a0,a0,-1632 # 80007540 <rodata_start+0x1540>
    80000ba8:	22d000ef          	jal	800015d4 <uart_puts>
    80000bac:	00007517          	auipc	a0,0x7
    80000bb0:	a8c50513          	add	a0,a0,-1396 # 80007638 <rodata_start+0x1638>
    80000bb4:	221000ef          	jal	800015d4 <uart_puts>
    80000bb8:	00007517          	auipc	a0,0x7
    80000bbc:	b5050513          	add	a0,a0,-1200 # 80007708 <rodata_start+0x1708>
    80000bc0:	215000ef          	jal	800015d4 <uart_puts>
    80000bc4:	01100593          	li	a1,17
    80000bc8:	02001537          	lui	a0,0x2001
    80000bcc:	01b59593          	sll	a1,a1,0x1b
    80000bd0:	00651513          	sll	a0,a0,0x6
    80000bd4:	22d000ef          	jal	80001600 <pmm_init>
    80000bd8:	00007517          	auipc	a0,0x7
    80000bdc:	b6850513          	add	a0,a0,-1176 # 80007740 <rodata_start+0x1740>
    80000be0:	1f5000ef          	jal	800015d4 <uart_puts>
    80000be4:	00007517          	auipc	a0,0x7
    80000be8:	b9c50513          	add	a0,a0,-1124 # 80007780 <rodata_start+0x1780>
    80000bec:	1e9000ef          	jal	800015d4 <uart_puts>
    80000bf0:	6f4010ef          	jal	800022e4 <kvminit>
    80000bf4:	360010ef          	jal	80001f54 <kvminithart>
    80000bf8:	00007517          	auipc	a0,0x7
    80000bfc:	bc050513          	add	a0,a0,-1088 # 800077b8 <rodata_start+0x17b8>
    80000c00:	1d5000ef          	jal	800015d4 <uart_puts>
    80000c04:	00007517          	auipc	a0,0x7
    80000c08:	bf450513          	add	a0,a0,-1036 # 800077f8 <rodata_start+0x17f8>
    80000c0c:	1c9000ef          	jal	800015d4 <uart_puts>
    80000c10:	2a0030ef          	jal	80003eb0 <trap_init>
    80000c14:	34c030ef          	jal	80003f60 <trap_init_hart>
    80000c18:	00007517          	auipc	a0,0x7
    80000c1c:	c1050513          	add	a0,a0,-1008 # 80007828 <rodata_start+0x1828>
    80000c20:	1b5000ef          	jal	800015d4 <uart_puts>
    80000c24:	00007517          	auipc	a0,0x7
    80000c28:	c3c50513          	add	a0,a0,-964 # 80007860 <rodata_start+0x1860>
    80000c2c:	1a9000ef          	jal	800015d4 <uart_puts>
    80000c30:	139030ef          	jal	80004568 <proc_init>
    80000c34:	00007517          	auipc	a0,0x7
    80000c38:	c5c50513          	add	a0,a0,-932 # 80007890 <rodata_start+0x1890>
    80000c3c:	199000ef          	jal	800015d4 <uart_puts>
    80000c40:	00007517          	auipc	a0,0x7
    80000c44:	c8850513          	add	a0,a0,-888 # 800078c8 <rodata_start+0x18c8>
    80000c48:	18d000ef          	jal	800015d4 <uart_puts>
    80000c4c:	00007517          	auipc	a0,0x7
    80000c50:	d4450513          	add	a0,a0,-700 # 80007990 <rodata_start+0x1990>
    80000c54:	181000ef          	jal	800015d4 <uart_puts>
    80000c58:	00007517          	auipc	a0,0x7
    80000c5c:	c7050513          	add	a0,a0,-912 # 800078c8 <rodata_start+0x18c8>
    80000c60:	175000ef          	jal	800015d4 <uart_puts>
    80000c64:	d45ff0ef          	jal	800009a8 <test_syscall_mechanism>
    80000c68:	ac9ff0ef          	jal	80000730 <test_argument_extraction>
    80000c6c:	c14ff0ef          	jal	80000080 <simulate_syscall_test>
    80000c70:	00007517          	auipc	a0,0x7
    80000c74:	d5050513          	add	a0,a0,-688 # 800079c0 <rodata_start+0x19c0>
    80000c78:	15d000ef          	jal	800015d4 <uart_puts>
    80000c7c:	00007517          	auipc	a0,0x7
    80000c80:	e0c50513          	add	a0,a0,-500 # 80007a88 <rodata_start+0x1a88>
    80000c84:	151000ef          	jal	800015d4 <uart_puts>
    80000c88:	00007517          	auipc	a0,0x7
    80000c8c:	e3050513          	add	a0,a0,-464 # 80007ab8 <rodata_start+0x1ab8>
    80000c90:	145000ef          	jal	800015d4 <uart_puts>
    80000c94:	00007517          	auipc	a0,0x7
    80000c98:	eec50513          	add	a0,a0,-276 # 80007b80 <rodata_start+0x1b80>
    80000c9c:	139000ef          	jal	800015d4 <uart_puts>
    80000ca0:	00007517          	auipc	a0,0x7
    80000ca4:	f0050513          	add	a0,a0,-256 # 80007ba0 <rodata_start+0x1ba0>
    80000ca8:	12d000ef          	jal	800015d4 <uart_puts>
    80000cac:	00007517          	auipc	a0,0x7
    80000cb0:	f2450513          	add	a0,a0,-220 # 80007bd0 <rodata_start+0x1bd0>
    80000cb4:	121000ef          	jal	800015d4 <uart_puts>
    80000cb8:	00007517          	auipc	a0,0x7
    80000cbc:	f6850513          	add	a0,a0,-152 # 80007c20 <rodata_start+0x1c20>
    80000cc0:	115000ef          	jal	800015d4 <uart_puts>
    80000cc4:	00007517          	auipc	a0,0x7
    80000cc8:	f9450513          	add	a0,a0,-108 # 80007c58 <rodata_start+0x1c58>
    80000ccc:	109000ef          	jal	800015d4 <uart_puts>
    80000cd0:	00007517          	auipc	a0,0x7
    80000cd4:	fb850513          	add	a0,a0,-72 # 80007c88 <rodata_start+0x1c88>
    80000cd8:	0fd000ef          	jal	800015d4 <uart_puts>
    80000cdc:	00007517          	auipc	a0,0x7
    80000ce0:	fdc50513          	add	a0,a0,-36 # 80007cb8 <rodata_start+0x1cb8>
    80000ce4:	0f1000ef          	jal	800015d4 <uart_puts>
    80000ce8:	0000006f          	j	80000ce8 <main+0x18c>

0000000080000cec <print_number>:
    80000cec:	0c050663          	beqz	a0,80000db8 <print_number+0xcc>
    80000cf0:	fd010113          	add	sp,sp,-48
    80000cf4:	02113423          	sd	ra,40(sp)
    80000cf8:	02813023          	sd	s0,32(sp)
    80000cfc:	08061a63          	bnez	a2,80000d90 <print_number+0xa4>
    80000d00:	0005071b          	sext.w	a4,a0
    80000d04:	00000613          	li	a2,0
    80000d08:	0005859b          	sext.w	a1,a1
    80000d0c:	00010fa3          	sb	zero,31(sp)
    80000d10:	01e10813          	add	a6,sp,30
    80000d14:	01f00693          	li	a3,31
    80000d18:	00007317          	auipc	t1,0x7
    80000d1c:	29030313          	add	t1,t1,656 # 80007fa8 <digits>
    80000d20:	02b777bb          	remuw	a5,a4,a1
    80000d24:	fff80813          	add	a6,a6,-1
    80000d28:	0007089b          	sext.w	a7,a4
    80000d2c:	00068e13          	mv	t3,a3
    80000d30:	fff6869b          	addw	a3,a3,-1
    80000d34:	02079793          	sll	a5,a5,0x20
    80000d38:	0207d793          	srl	a5,a5,0x20
    80000d3c:	00f307b3          	add	a5,t1,a5
    80000d40:	0007c503          	lbu	a0,0(a5) # 2000 <_entry-0x7fffe000>
    80000d44:	02b7573b          	divuw	a4,a4,a1
    80000d48:	00a800a3          	sb	a0,1(a6)
    80000d4c:	fcb8fae3          	bgeu	a7,a1,80000d20 <print_number+0x34>
    80000d50:	04060a63          	beqz	a2,80000da4 <print_number+0xb8>
    80000d54:	ffee069b          	addw	a3,t3,-2
    80000d58:	02068793          	add	a5,a3,32
    80000d5c:	002787b3          	add	a5,a5,sp
    80000d60:	02d00713          	li	a4,45
    80000d64:	fee78023          	sb	a4,-32(a5)
    80000d68:	02d00513          	li	a0,45
    80000d6c:	00d10433          	add	s0,sp,a3
    80000d70:	00140413          	add	s0,s0,1
    80000d74:	049000ef          	jal	800015bc <uart_putc>
    80000d78:	00044503          	lbu	a0,0(s0)
    80000d7c:	fe051ae3          	bnez	a0,80000d70 <print_number+0x84>
    80000d80:	02813083          	ld	ra,40(sp)
    80000d84:	02013403          	ld	s0,32(sp)
    80000d88:	03010113          	add	sp,sp,48
    80000d8c:	00008067          	ret
    80000d90:	f60558e3          	bgez	a0,80000d00 <print_number+0x14>
    80000d94:	80000737          	lui	a4,0x80000
    80000d98:	f6e508e3          	beq	a0,a4,80000d08 <print_number+0x1c>
    80000d9c:	40a0073b          	negw	a4,a0
    80000da0:	f69ff06f          	j	80000d08 <print_number+0x1c>
    80000da4:	fc0514e3          	bnez	a0,80000d6c <print_number+0x80>
    80000da8:	02813083          	ld	ra,40(sp)
    80000dac:	02013403          	ld	s0,32(sp)
    80000db0:	03010113          	add	sp,sp,48
    80000db4:	00008067          	ret
    80000db8:	03000513          	li	a0,48
    80000dbc:	0010006f          	j	800015bc <uart_putc>

0000000080000dc0 <print_number_long.part.0>:
    80000dc0:	fd010113          	add	sp,sp,-48
    80000dc4:	02113423          	sd	ra,40(sp)
    80000dc8:	02813023          	sd	s0,32(sp)
    80000dcc:	00050793          	mv	a5,a0
    80000dd0:	00060463          	beqz	a2,80000dd8 <print_number_long.part.0+0x18>
    80000dd4:	08054c63          	bltz	a0,80000e6c <print_number_long.part.0+0xac>
    80000dd8:	00000613          	li	a2,0
    80000ddc:	00010fa3          	sb	zero,31(sp)
    80000de0:	01e10813          	add	a6,sp,30
    80000de4:	01f00693          	li	a3,31
    80000de8:	00007317          	auipc	t1,0x7
    80000dec:	1c030313          	add	t1,t1,448 # 80007fa8 <digits>
    80000df0:	02b7f733          	remu	a4,a5,a1
    80000df4:	fff80813          	add	a6,a6,-1
    80000df8:	00078893          	mv	a7,a5
    80000dfc:	00068e13          	mv	t3,a3
    80000e00:	fff6869b          	addw	a3,a3,-1
    80000e04:	00e30733          	add	a4,t1,a4
    80000e08:	00074503          	lbu	a0,0(a4) # ffffffff80000000 <bss_end+0xfffffffeffbd9490>
    80000e0c:	02b7d7b3          	divu	a5,a5,a1
    80000e10:	00a800a3          	sb	a0,1(a6)
    80000e14:	fcb8fee3          	bgeu	a7,a1,80000df0 <print_number_long.part.0+0x30>
    80000e18:	04060063          	beqz	a2,80000e58 <print_number_long.part.0+0x98>
    80000e1c:	ffee069b          	addw	a3,t3,-2
    80000e20:	02068793          	add	a5,a3,32
    80000e24:	002787b3          	add	a5,a5,sp
    80000e28:	02d00713          	li	a4,45
    80000e2c:	fee78023          	sb	a4,-32(a5)
    80000e30:	02d00513          	li	a0,45
    80000e34:	00d10433          	add	s0,sp,a3
    80000e38:	00140413          	add	s0,s0,1
    80000e3c:	780000ef          	jal	800015bc <uart_putc>
    80000e40:	00044503          	lbu	a0,0(s0)
    80000e44:	fe051ae3          	bnez	a0,80000e38 <print_number_long.part.0+0x78>
    80000e48:	02813083          	ld	ra,40(sp)
    80000e4c:	02013403          	ld	s0,32(sp)
    80000e50:	03010113          	add	sp,sp,48
    80000e54:	00008067          	ret
    80000e58:	fc051ee3          	bnez	a0,80000e34 <print_number_long.part.0+0x74>
    80000e5c:	02813083          	ld	ra,40(sp)
    80000e60:	02013403          	ld	s0,32(sp)
    80000e64:	03010113          	add	sp,sp,48
    80000e68:	00008067          	ret
    80000e6c:	40a007b3          	neg	a5,a0
    80000e70:	f6dff06f          	j	80000ddc <print_number_long.part.0+0x1c>

0000000080000e74 <clear_screen>:
    80000e74:	00007517          	auipc	a0,0x7
    80000e78:	e5c50513          	add	a0,a0,-420 # 80007cd0 <rodata_start+0x1cd0>
    80000e7c:	7580006f          	j	800015d4 <uart_puts>

0000000080000e80 <clear_line>:
    80000e80:	00007517          	auipc	a0,0x7
    80000e84:	e5850513          	add	a0,a0,-424 # 80007cd8 <rodata_start+0x1cd8>
    80000e88:	74c0006f          	j	800015d4 <uart_puts>

0000000080000e8c <goto_xy>:
    80000e8c:	fd010113          	add	sp,sp,-48
    80000e90:	00913c23          	sd	s1,24(sp)
    80000e94:	00050493          	mv	s1,a0
    80000e98:	01b00513          	li	a0,27
    80000e9c:	02113423          	sd	ra,40(sp)
    80000ea0:	02813023          	sd	s0,32(sp)
    80000ea4:	01213823          	sd	s2,16(sp)
    80000ea8:	00058413          	mv	s0,a1
    80000eac:	01313423          	sd	s3,8(sp)
    80000eb0:	70c000ef          	jal	800015bc <uart_putc>
    80000eb4:	05b00513          	li	a0,91
    80000eb8:	704000ef          	jal	800015bc <uart_putc>
    80000ebc:	06300793          	li	a5,99
    80000ec0:	0c87cc63          	blt	a5,s0,80000f98 <goto_xy+0x10c>
    80000ec4:	00900793          	li	a5,9
    80000ec8:	0487ce63          	blt	a5,s0,80000f24 <goto_xy+0x98>
    80000ecc:	12805a63          	blez	s0,80001000 <goto_xy+0x174>
    80000ed0:	0304041b          	addw	s0,s0,48
    80000ed4:	0ff47513          	zext.b	a0,s0
    80000ed8:	6e4000ef          	jal	800015bc <uart_putc>
    80000edc:	03b00513          	li	a0,59
    80000ee0:	6dc000ef          	jal	800015bc <uart_putc>
    80000ee4:	06300793          	li	a5,99
    80000ee8:	0697c863          	blt	a5,s1,80000f58 <goto_xy+0xcc>
    80000eec:	00900793          	li	a5,9
    80000ef0:	0e97c463          	blt	a5,s1,80000fd8 <goto_xy+0x14c>
    80000ef4:	10905c63          	blez	s1,8000100c <goto_xy+0x180>
    80000ef8:	0304851b          	addw	a0,s1,48 # 1030 <_entry-0x7fffefd0>
    80000efc:	0ff57513          	zext.b	a0,a0
    80000f00:	6bc000ef          	jal	800015bc <uart_putc>
    80000f04:	02013403          	ld	s0,32(sp)
    80000f08:	02813083          	ld	ra,40(sp)
    80000f0c:	01813483          	ld	s1,24(sp)
    80000f10:	01013903          	ld	s2,16(sp)
    80000f14:	00813983          	ld	s3,8(sp)
    80000f18:	04800513          	li	a0,72
    80000f1c:	03010113          	add	sp,sp,48
    80000f20:	69c0006f          	j	800015bc <uart_putc>
    80000f24:	00a00913          	li	s2,10
    80000f28:	0324453b          	divw	a0,s0,s2
    80000f2c:	0305051b          	addw	a0,a0,48
    80000f30:	0ff57513          	zext.b	a0,a0
    80000f34:	688000ef          	jal	800015bc <uart_putc>
    80000f38:	0324643b          	remw	s0,s0,s2
    80000f3c:	0304041b          	addw	s0,s0,48
    80000f40:	0ff47513          	zext.b	a0,s0
    80000f44:	678000ef          	jal	800015bc <uart_putc>
    80000f48:	03b00513          	li	a0,59
    80000f4c:	670000ef          	jal	800015bc <uart_putc>
    80000f50:	06300793          	li	a5,99
    80000f54:	f897dce3          	bge	a5,s1,80000eec <goto_xy+0x60>
    80000f58:	06400413          	li	s0,100
    80000f5c:	0284c53b          	divw	a0,s1,s0
    80000f60:	00a00913          	li	s2,10
    80000f64:	0305051b          	addw	a0,a0,48
    80000f68:	0ff57513          	zext.b	a0,a0
    80000f6c:	650000ef          	jal	800015bc <uart_putc>
    80000f70:	0284e53b          	remw	a0,s1,s0
    80000f74:	0325453b          	divw	a0,a0,s2
    80000f78:	0305051b          	addw	a0,a0,48
    80000f7c:	0ff57513          	zext.b	a0,a0
    80000f80:	63c000ef          	jal	800015bc <uart_putc>
    80000f84:	0324e53b          	remw	a0,s1,s2
    80000f88:	0305051b          	addw	a0,a0,48
    80000f8c:	0ff57513          	zext.b	a0,a0
    80000f90:	62c000ef          	jal	800015bc <uart_putc>
    80000f94:	f71ff06f          	j	80000f04 <goto_xy+0x78>
    80000f98:	06400913          	li	s2,100
    80000f9c:	0324453b          	divw	a0,s0,s2
    80000fa0:	00a00993          	li	s3,10
    80000fa4:	0305051b          	addw	a0,a0,48
    80000fa8:	0ff57513          	zext.b	a0,a0
    80000fac:	610000ef          	jal	800015bc <uart_putc>
    80000fb0:	0324653b          	remw	a0,s0,s2
    80000fb4:	0335453b          	divw	a0,a0,s3
    80000fb8:	0305051b          	addw	a0,a0,48
    80000fbc:	0ff57513          	zext.b	a0,a0
    80000fc0:	5fc000ef          	jal	800015bc <uart_putc>
    80000fc4:	0334643b          	remw	s0,s0,s3
    80000fc8:	0304041b          	addw	s0,s0,48
    80000fcc:	0ff47513          	zext.b	a0,s0
    80000fd0:	5ec000ef          	jal	800015bc <uart_putc>
    80000fd4:	f09ff06f          	j	80000edc <goto_xy+0x50>
    80000fd8:	00a00413          	li	s0,10
    80000fdc:	0284c53b          	divw	a0,s1,s0
    80000fe0:	0305051b          	addw	a0,a0,48
    80000fe4:	0ff57513          	zext.b	a0,a0
    80000fe8:	5d4000ef          	jal	800015bc <uart_putc>
    80000fec:	0284e53b          	remw	a0,s1,s0
    80000ff0:	0305051b          	addw	a0,a0,48
    80000ff4:	0ff57513          	zext.b	a0,a0
    80000ff8:	5c4000ef          	jal	800015bc <uart_putc>
    80000ffc:	f09ff06f          	j	80000f04 <goto_xy+0x78>
    80001000:	03100513          	li	a0,49
    80001004:	5b8000ef          	jal	800015bc <uart_putc>
    80001008:	ed5ff06f          	j	80000edc <goto_xy+0x50>
    8000100c:	03100513          	li	a0,49
    80001010:	5ac000ef          	jal	800015bc <uart_putc>
    80001014:	ef1ff06f          	j	80000f04 <goto_xy+0x78>

0000000080001018 <printf_color>:
    80001018:	f8010113          	add	sp,sp,-128
    8000101c:	02913c23          	sd	s1,56(sp)
    80001020:	00050493          	mv	s1,a0
    80001024:	01b00513          	li	a0,27
    80001028:	06f13423          	sd	a5,104(sp)
    8000102c:	04113423          	sd	ra,72(sp)
    80001030:	04813023          	sd	s0,64(sp)
    80001034:	04c13823          	sd	a2,80(sp)
    80001038:	04d13c23          	sd	a3,88(sp)
    8000103c:	06e13023          	sd	a4,96(sp)
    80001040:	07013823          	sd	a6,112(sp)
    80001044:	07113c23          	sd	a7,120(sp)
    80001048:	00058413          	mv	s0,a1
    8000104c:	03213823          	sd	s2,48(sp)
    80001050:	03313423          	sd	s3,40(sp)
    80001054:	03413023          	sd	s4,32(sp)
    80001058:	01513c23          	sd	s5,24(sp)
    8000105c:	560000ef          	jal	800015bc <uart_putc>
    80001060:	05b00513          	li	a0,91
    80001064:	558000ef          	jal	800015bc <uart_putc>
    80001068:	06300793          	li	a5,99
    8000106c:	1a97e063          	bltu	a5,s1,8000120c <printf_color+0x1f4>
    80001070:	00900793          	li	a5,9
    80001074:	1497e663          	bltu	a5,s1,800011c0 <printf_color+0x1a8>
    80001078:	0304851b          	addw	a0,s1,48
    8000107c:	0ff57513          	zext.b	a0,a0
    80001080:	53c000ef          	jal	800015bc <uart_putc>
    80001084:	06d00513          	li	a0,109
    80001088:	534000ef          	jal	800015bc <uart_putc>
    8000108c:	1c040863          	beqz	s0,8000125c <printf_color+0x244>
    80001090:	00044503          	lbu	a0,0(s0)
    80001094:	05010793          	add	a5,sp,80
    80001098:	00f13423          	sd	a5,8(sp)
    8000109c:	00000a93          	li	s5,0
    800010a0:	06050463          	beqz	a0,80001108 <printf_color+0xf0>
    800010a4:	02500913          	li	s2,37
    800010a8:	02000a13          	li	s4,32
    800010ac:	00007997          	auipc	s3,0x7
    800010b0:	d6c98993          	add	s3,s3,-660 # 80007e18 <rodata_start+0x1e18>
    800010b4:	00140493          	add	s1,s0,1
    800010b8:	13251863          	bne	a0,s2,800011e8 <printf_color+0x1d0>
    800010bc:	00144783          	lbu	a5,1(s0)
    800010c0:	14078063          	beqz	a5,80001200 <printf_color+0x1e8>
    800010c4:	13278863          	beq	a5,s2,800011f4 <printf_color+0x1dc>
    800010c8:	fa87879b          	addw	a5,a5,-88
    800010cc:	0ff7f793          	zext.b	a5,a5
    800010d0:	00fa6c63          	bltu	s4,a5,800010e8 <printf_color+0xd0>
    800010d4:	00279793          	sll	a5,a5,0x2
    800010d8:	013787b3          	add	a5,a5,s3
    800010dc:	0007a783          	lw	a5,0(a5)
    800010e0:	013787b3          	add	a5,a5,s3
    800010e4:	00078067          	jr	a5
    800010e8:	02500513          	li	a0,37
    800010ec:	4d0000ef          	jal	800015bc <uart_putc>
    800010f0:	00144503          	lbu	a0,1(s0)
    800010f4:	ffe00a93          	li	s5,-2
    800010f8:	4c4000ef          	jal	800015bc <uart_putc>
    800010fc:	0014c503          	lbu	a0,1(s1)
    80001100:	00148413          	add	s0,s1,1
    80001104:	fa0518e3          	bnez	a0,800010b4 <printf_color+0x9c>
    80001108:	00007517          	auipc	a0,0x7
    8000110c:	be050513          	add	a0,a0,-1056 # 80007ce8 <rodata_start+0x1ce8>
    80001110:	4c4000ef          	jal	800015d4 <uart_puts>
    80001114:	04813083          	ld	ra,72(sp)
    80001118:	04013403          	ld	s0,64(sp)
    8000111c:	03813483          	ld	s1,56(sp)
    80001120:	03013903          	ld	s2,48(sp)
    80001124:	02813983          	ld	s3,40(sp)
    80001128:	02013a03          	ld	s4,32(sp)
    8000112c:	000a8513          	mv	a0,s5
    80001130:	01813a83          	ld	s5,24(sp)
    80001134:	08010113          	add	sp,sp,128
    80001138:	00008067          	ret
    8000113c:	00813783          	ld	a5,8(sp)
    80001140:	00000613          	li	a2,0
    80001144:	01000593          	li	a1,16
    80001148:	0007a503          	lw	a0,0(a5)
    8000114c:	00878793          	add	a5,a5,8
    80001150:	00f13423          	sd	a5,8(sp)
    80001154:	b99ff0ef          	jal	80000cec <print_number>
    80001158:	fa5ff06f          	j	800010fc <printf_color+0xe4>
    8000115c:	00813783          	ld	a5,8(sp)
    80001160:	0007c503          	lbu	a0,0(a5)
    80001164:	00878793          	add	a5,a5,8
    80001168:	00f13423          	sd	a5,8(sp)
    8000116c:	450000ef          	jal	800015bc <uart_putc>
    80001170:	f8dff06f          	j	800010fc <printf_color+0xe4>
    80001174:	00813783          	ld	a5,8(sp)
    80001178:	0007b403          	ld	s0,0(a5)
    8000117c:	00878793          	add	a5,a5,8
    80001180:	00f13423          	sd	a5,8(sp)
    80001184:	00041863          	bnez	s0,80001194 <printf_color+0x17c>
    80001188:	0c40006f          	j	8000124c <printf_color+0x234>
    8000118c:	00140413          	add	s0,s0,1
    80001190:	42c000ef          	jal	800015bc <uart_putc>
    80001194:	00044503          	lbu	a0,0(s0)
    80001198:	fe051ae3          	bnez	a0,8000118c <printf_color+0x174>
    8000119c:	f61ff06f          	j	800010fc <printf_color+0xe4>
    800011a0:	00813783          	ld	a5,8(sp)
    800011a4:	00100613          	li	a2,1
    800011a8:	00a00593          	li	a1,10
    800011ac:	0007a503          	lw	a0,0(a5)
    800011b0:	00878793          	add	a5,a5,8
    800011b4:	00f13423          	sd	a5,8(sp)
    800011b8:	b35ff0ef          	jal	80000cec <print_number>
    800011bc:	f41ff06f          	j	800010fc <printf_color+0xe4>
    800011c0:	00a00913          	li	s2,10
    800011c4:	0324d53b          	divuw	a0,s1,s2
    800011c8:	0305051b          	addw	a0,a0,48
    800011cc:	0ff57513          	zext.b	a0,a0
    800011d0:	3ec000ef          	jal	800015bc <uart_putc>
    800011d4:	0324f53b          	remuw	a0,s1,s2
    800011d8:	0305051b          	addw	a0,a0,48
    800011dc:	07f57513          	and	a0,a0,127
    800011e0:	3dc000ef          	jal	800015bc <uart_putc>
    800011e4:	ea1ff06f          	j	80001084 <printf_color+0x6c>
    800011e8:	3d4000ef          	jal	800015bc <uart_putc>
    800011ec:	00040493          	mv	s1,s0
    800011f0:	f0dff06f          	j	800010fc <printf_color+0xe4>
    800011f4:	02500513          	li	a0,37
    800011f8:	3c4000ef          	jal	800015bc <uart_putc>
    800011fc:	f01ff06f          	j	800010fc <printf_color+0xe4>
    80001200:	02500513          	li	a0,37
    80001204:	3b8000ef          	jal	800015bc <uart_putc>
    80001208:	f01ff06f          	j	80001108 <printf_color+0xf0>
    8000120c:	06400913          	li	s2,100
    80001210:	0324d53b          	divuw	a0,s1,s2
    80001214:	00a00993          	li	s3,10
    80001218:	0305051b          	addw	a0,a0,48
    8000121c:	0ff57513          	zext.b	a0,a0
    80001220:	39c000ef          	jal	800015bc <uart_putc>
    80001224:	0324f53b          	remuw	a0,s1,s2
    80001228:	0335553b          	divuw	a0,a0,s3
    8000122c:	0305051b          	addw	a0,a0,48
    80001230:	0ff57513          	zext.b	a0,a0
    80001234:	388000ef          	jal	800015bc <uart_putc>
    80001238:	0334f53b          	remuw	a0,s1,s3
    8000123c:	0305051b          	addw	a0,a0,48
    80001240:	07f57513          	and	a0,a0,127
    80001244:	378000ef          	jal	800015bc <uart_putc>
    80001248:	e3dff06f          	j	80001084 <printf_color+0x6c>
    8000124c:	00007517          	auipc	a0,0x7
    80001250:	a9450513          	add	a0,a0,-1388 # 80007ce0 <rodata_start+0x1ce0>
    80001254:	380000ef          	jal	800015d4 <uart_puts>
    80001258:	ea5ff06f          	j	800010fc <printf_color+0xe4>
    8000125c:	fff00a93          	li	s5,-1
    80001260:	eb5ff06f          	j	80001114 <printf_color+0xfc>

0000000080001264 <printf>:
    80001264:	f6010113          	add	sp,sp,-160
    80001268:	04113c23          	sd	ra,88(sp)
    8000126c:	04813823          	sd	s0,80(sp)
    80001270:	04913423          	sd	s1,72(sp)
    80001274:	05213023          	sd	s2,64(sp)
    80001278:	03313c23          	sd	s3,56(sp)
    8000127c:	03413823          	sd	s4,48(sp)
    80001280:	03513423          	sd	s5,40(sp)
    80001284:	03613023          	sd	s6,32(sp)
    80001288:	01713c23          	sd	s7,24(sp)
    8000128c:	06b13423          	sd	a1,104(sp)
    80001290:	06c13823          	sd	a2,112(sp)
    80001294:	06d13c23          	sd	a3,120(sp)
    80001298:	08e13023          	sd	a4,128(sp)
    8000129c:	08f13423          	sd	a5,136(sp)
    800012a0:	09013823          	sd	a6,144(sp)
    800012a4:	09113c23          	sd	a7,152(sp)
    800012a8:	20050c63          	beqz	a0,800014c0 <printf+0x25c>
    800012ac:	00050413          	mv	s0,a0
    800012b0:	00054503          	lbu	a0,0(a0)
    800012b4:	06810793          	add	a5,sp,104
    800012b8:	00f13423          	sd	a5,8(sp)
    800012bc:	00000b13          	li	s6,0
    800012c0:	06050c63          	beqz	a0,80001338 <printf+0xd4>
    800012c4:	02500493          	li	s1,37
    800012c8:	06c00993          	li	s3,108
    800012cc:	02000a13          	li	s4,32
    800012d0:	00007917          	auipc	s2,0x7
    800012d4:	bcc90913          	add	s2,s2,-1076 # 80007e9c <rodata_start+0x1e9c>
    800012d8:	00007a97          	auipc	s5,0x7
    800012dc:	c48a8a93          	add	s5,s5,-952 # 80007f20 <rodata_start+0x1f20>
    800012e0:	04951463          	bne	a0,s1,80001328 <printf+0xc4>
    800012e4:	00144783          	lbu	a5,1(s0)
    800012e8:	18078e63          	beqz	a5,80001484 <printf+0x220>
    800012ec:	11378063          	beq	a5,s3,800013ec <printf+0x188>
    800012f0:	00140413          	add	s0,s0,1
    800012f4:	16978863          	beq	a5,s1,80001464 <printf+0x200>
    800012f8:	fa87879b          	addw	a5,a5,-88
    800012fc:	0ff7f793          	zext.b	a5,a5
    80001300:	00fa6c63          	bltu	s4,a5,80001318 <printf+0xb4>
    80001304:	00279793          	sll	a5,a5,0x2
    80001308:	012787b3          	add	a5,a5,s2
    8000130c:	0007a783          	lw	a5,0(a5)
    80001310:	012787b3          	add	a5,a5,s2
    80001314:	00078067          	jr	a5
    80001318:	02500513          	li	a0,37
    8000131c:	2a0000ef          	jal	800015bc <uart_putc>
    80001320:	00044503          	lbu	a0,0(s0)
    80001324:	ffe00b13          	li	s6,-2
    80001328:	294000ef          	jal	800015bc <uart_putc>
    8000132c:	00144503          	lbu	a0,1(s0)
    80001330:	00140413          	add	s0,s0,1
    80001334:	fa0516e3          	bnez	a0,800012e0 <printf+0x7c>
    80001338:	05813083          	ld	ra,88(sp)
    8000133c:	05013403          	ld	s0,80(sp)
    80001340:	04813483          	ld	s1,72(sp)
    80001344:	04013903          	ld	s2,64(sp)
    80001348:	03813983          	ld	s3,56(sp)
    8000134c:	03013a03          	ld	s4,48(sp)
    80001350:	02813a83          	ld	s5,40(sp)
    80001354:	01813b83          	ld	s7,24(sp)
    80001358:	000b0513          	mv	a0,s6
    8000135c:	02013b03          	ld	s6,32(sp)
    80001360:	0a010113          	add	sp,sp,160
    80001364:	00008067          	ret
    80001368:	00813783          	ld	a5,8(sp)
    8000136c:	00000613          	li	a2,0
    80001370:	01000593          	li	a1,16
    80001374:	0007a503          	lw	a0,0(a5)
    80001378:	00878793          	add	a5,a5,8
    8000137c:	00f13423          	sd	a5,8(sp)
    80001380:	96dff0ef          	jal	80000cec <print_number>
    80001384:	fa9ff06f          	j	8000132c <printf+0xc8>
    80001388:	00813783          	ld	a5,8(sp)
    8000138c:	0007c503          	lbu	a0,0(a5)
    80001390:	00878793          	add	a5,a5,8
    80001394:	00f13423          	sd	a5,8(sp)
    80001398:	224000ef          	jal	800015bc <uart_putc>
    8000139c:	f91ff06f          	j	8000132c <printf+0xc8>
    800013a0:	00813783          	ld	a5,8(sp)
    800013a4:	0007bb83          	ld	s7,0(a5)
    800013a8:	00878793          	add	a5,a5,8
    800013ac:	00f13423          	sd	a5,8(sp)
    800013b0:	000b9863          	bnez	s7,800013c0 <printf+0x15c>
    800013b4:	0e80006f          	j	8000149c <printf+0x238>
    800013b8:	001b8b93          	add	s7,s7,1
    800013bc:	200000ef          	jal	800015bc <uart_putc>
    800013c0:	000bc503          	lbu	a0,0(s7)
    800013c4:	fe051ae3          	bnez	a0,800013b8 <printf+0x154>
    800013c8:	f65ff06f          	j	8000132c <printf+0xc8>
    800013cc:	00813783          	ld	a5,8(sp)
    800013d0:	00100613          	li	a2,1
    800013d4:	00a00593          	li	a1,10
    800013d8:	0007a503          	lw	a0,0(a5)
    800013dc:	00878793          	add	a5,a5,8
    800013e0:	00f13423          	sd	a5,8(sp)
    800013e4:	909ff0ef          	jal	80000cec <print_number>
    800013e8:	f45ff06f          	j	8000132c <printf+0xc8>
    800013ec:	00244783          	lbu	a5,2(s0)
    800013f0:	00240413          	add	s0,s0,2
    800013f4:	0a078c63          	beqz	a5,800014ac <printf+0x248>
    800013f8:	06978663          	beq	a5,s1,80001464 <printf+0x200>
    800013fc:	fa87879b          	addw	a5,a5,-88
    80001400:	0ff7f793          	zext.b	a5,a5
    80001404:	06fa6663          	bltu	s4,a5,80001470 <printf+0x20c>
    80001408:	00279793          	sll	a5,a5,0x2
    8000140c:	015787b3          	add	a5,a5,s5
    80001410:	0007a783          	lw	a5,0(a5)
    80001414:	015787b3          	add	a5,a5,s5
    80001418:	00078067          	jr	a5
    8000141c:	00813783          	ld	a5,8(sp)
    80001420:	0007b503          	ld	a0,0(a5)
    80001424:	00878793          	add	a5,a5,8
    80001428:	00f13423          	sd	a5,8(sp)
    8000142c:	06050263          	beqz	a0,80001490 <printf+0x22c>
    80001430:	00000613          	li	a2,0
    80001434:	01000593          	li	a1,16
    80001438:	989ff0ef          	jal	80000dc0 <print_number_long.part.0>
    8000143c:	ef1ff06f          	j	8000132c <printf+0xc8>
    80001440:	00813783          	ld	a5,8(sp)
    80001444:	0007b503          	ld	a0,0(a5)
    80001448:	00878793          	add	a5,a5,8
    8000144c:	00f13423          	sd	a5,8(sp)
    80001450:	04050063          	beqz	a0,80001490 <printf+0x22c>
    80001454:	00100613          	li	a2,1
    80001458:	00a00593          	li	a1,10
    8000145c:	965ff0ef          	jal	80000dc0 <print_number_long.part.0>
    80001460:	ecdff06f          	j	8000132c <printf+0xc8>
    80001464:	02500513          	li	a0,37
    80001468:	154000ef          	jal	800015bc <uart_putc>
    8000146c:	ec1ff06f          	j	8000132c <printf+0xc8>
    80001470:	02500513          	li	a0,37
    80001474:	148000ef          	jal	800015bc <uart_putc>
    80001478:	06c00513          	li	a0,108
    8000147c:	140000ef          	jal	800015bc <uart_putc>
    80001480:	ea1ff06f          	j	80001320 <printf+0xbc>
    80001484:	02500513          	li	a0,37
    80001488:	134000ef          	jal	800015bc <uart_putc>
    8000148c:	eadff06f          	j	80001338 <printf+0xd4>
    80001490:	03000513          	li	a0,48
    80001494:	128000ef          	jal	800015bc <uart_putc>
    80001498:	e95ff06f          	j	8000132c <printf+0xc8>
    8000149c:	00007517          	auipc	a0,0x7
    800014a0:	84450513          	add	a0,a0,-1980 # 80007ce0 <rodata_start+0x1ce0>
    800014a4:	130000ef          	jal	800015d4 <uart_puts>
    800014a8:	e85ff06f          	j	8000132c <printf+0xc8>
    800014ac:	02500513          	li	a0,37
    800014b0:	10c000ef          	jal	800015bc <uart_putc>
    800014b4:	06c00513          	li	a0,108
    800014b8:	104000ef          	jal	800015bc <uart_putc>
    800014bc:	e7dff06f          	j	80001338 <printf+0xd4>
    800014c0:	fff00b13          	li	s6,-1
    800014c4:	e75ff06f          	j	80001338 <printf+0xd4>

00000000800014c8 <test_printf_basic>:
    800014c8:	ff010113          	add	sp,sp,-16
    800014cc:	02a00593          	li	a1,42
    800014d0:	00007517          	auipc	a0,0x7
    800014d4:	82050513          	add	a0,a0,-2016 # 80007cf0 <rodata_start+0x1cf0>
    800014d8:	00113423          	sd	ra,8(sp)
    800014dc:	d89ff0ef          	jal	80001264 <printf>
    800014e0:	f8500593          	li	a1,-123
    800014e4:	00007517          	auipc	a0,0x7
    800014e8:	82450513          	add	a0,a0,-2012 # 80007d08 <rodata_start+0x1d08>
    800014ec:	d79ff0ef          	jal	80001264 <printf>
    800014f0:	00000593          	li	a1,0
    800014f4:	00007517          	auipc	a0,0x7
    800014f8:	82c50513          	add	a0,a0,-2004 # 80007d20 <rodata_start+0x1d20>
    800014fc:	d69ff0ef          	jal	80001264 <printf>
    80001500:	000015b7          	lui	a1,0x1
    80001504:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80001508:	00007517          	auipc	a0,0x7
    8000150c:	83050513          	add	a0,a0,-2000 # 80007d38 <rodata_start+0x1d38>
    80001510:	d55ff0ef          	jal	80001264 <printf>
    80001514:	00007597          	auipc	a1,0x7
    80001518:	83c58593          	add	a1,a1,-1988 # 80007d50 <rodata_start+0x1d50>
    8000151c:	00007517          	auipc	a0,0x7
    80001520:	83c50513          	add	a0,a0,-1988 # 80007d58 <rodata_start+0x1d58>
    80001524:	d41ff0ef          	jal	80001264 <printf>
    80001528:	05800593          	li	a1,88
    8000152c:	00007517          	auipc	a0,0x7
    80001530:	84450513          	add	a0,a0,-1980 # 80007d70 <rodata_start+0x1d70>
    80001534:	d31ff0ef          	jal	80001264 <printf>
    80001538:	00813083          	ld	ra,8(sp)
    8000153c:	00007517          	auipc	a0,0x7
    80001540:	84c50513          	add	a0,a0,-1972 # 80007d88 <rodata_start+0x1d88>
    80001544:	01010113          	add	sp,sp,16
    80001548:	d1dff06f          	j	80001264 <printf>

000000008000154c <test_printf_edge_cases>:
    8000154c:	800005b7          	lui	a1,0x80000
    80001550:	ff010113          	add	sp,sp,-16
    80001554:	fff5c593          	not	a1,a1
    80001558:	00007517          	auipc	a0,0x7
    8000155c:	84850513          	add	a0,a0,-1976 # 80007da0 <rodata_start+0x1da0>
    80001560:	00113423          	sd	ra,8(sp)
    80001564:	d01ff0ef          	jal	80001264 <printf>
    80001568:	800005b7          	lui	a1,0x80000
    8000156c:	00007517          	auipc	a0,0x7
    80001570:	84450513          	add	a0,a0,-1980 # 80007db0 <rodata_start+0x1db0>
    80001574:	cf1ff0ef          	jal	80001264 <printf>
    80001578:	00000593          	li	a1,0
    8000157c:	00007517          	auipc	a0,0x7
    80001580:	84450513          	add	a0,a0,-1980 # 80007dc0 <rodata_start+0x1dc0>
    80001584:	ce1ff0ef          	jal	80001264 <printf>
    80001588:	00005597          	auipc	a1,0x5
    8000158c:	42858593          	add	a1,a1,1064 # 800069b0 <rodata_start+0x9b0>
    80001590:	00007517          	auipc	a0,0x7
    80001594:	84850513          	add	a0,a0,-1976 # 80007dd8 <rodata_start+0x1dd8>
    80001598:	ccdff0ef          	jal	80001264 <printf>
    8000159c:	00007517          	auipc	a0,0x7
    800015a0:	85450513          	add	a0,a0,-1964 # 80007df0 <rodata_start+0x1df0>
    800015a4:	cc1ff0ef          	jal	80001264 <printf>
    800015a8:	00813083          	ld	ra,8(sp)
    800015ac:	00007517          	auipc	a0,0x7
    800015b0:	85450513          	add	a0,a0,-1964 # 80007e00 <rodata_start+0x1e00>
    800015b4:	01010113          	add	sp,sp,16
    800015b8:	cadff06f          	j	80001264 <printf>

00000000800015bc <uart_putc>:
    800015bc:	10000737          	lui	a4,0x10000
    800015c0:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800015c4:	0207f793          	and	a5,a5,32
    800015c8:	fe078ce3          	beqz	a5,800015c0 <uart_putc+0x4>
    800015cc:	00a70023          	sb	a0,0(a4)
    800015d0:	00008067          	ret

00000000800015d4 <uart_puts>:
    800015d4:	00054683          	lbu	a3,0(a0)
    800015d8:	02068263          	beqz	a3,800015fc <uart_puts+0x28>
    800015dc:	10000737          	lui	a4,0x10000
    800015e0:	00150513          	add	a0,a0,1
    800015e4:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800015e8:	0207f793          	and	a5,a5,32
    800015ec:	fe078ce3          	beqz	a5,800015e4 <uart_puts+0x10>
    800015f0:	00d70023          	sb	a3,0(a4)
    800015f4:	00054683          	lbu	a3,0(a0)
    800015f8:	fe0694e3          	bnez	a3,800015e0 <uart_puts+0xc>
    800015fc:	00008067          	ret

0000000080001600 <pmm_init>:
    80001600:	000017b7          	lui	a5,0x1
    80001604:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001608:	00f50533          	add	a0,a0,a5
    8000160c:	fffff737          	lui	a4,0xfffff
    80001610:	00e57533          	and	a0,a0,a4
    80001614:	00e5f5b3          	and	a1,a1,a4
    80001618:	00425797          	auipc	a5,0x425
    8000161c:	50a7bc23          	sd	a0,1304(a5) # 80426b30 <mem_start>
    80001620:	00425797          	auipc	a5,0x425
    80001624:	50b7b423          	sd	a1,1288(a5) # 80426b28 <mem_end>
    80001628:	00425797          	auipc	a5,0x425
    8000162c:	5007b823          	sd	zero,1296(a5) # 80426b38 <freelist>
    80001630:	02b57e63          	bgeu	a0,a1,8000166c <pmm_init+0x6c>
    80001634:	02050e63          	beqz	a0,80001670 <pmm_init+0x70>
    80001638:	00050793          	mv	a5,a0
    8000163c:	00000613          	li	a2,0
    80001640:	00000693          	li	a3,0
    80001644:	00a7e863          	bltu	a5,a0,80001654 <pmm_init+0x54>
    80001648:	00d7b023          	sd	a3,0(a5)
    8000164c:	00100613          	li	a2,1
    80001650:	00078693          	mv	a3,a5
    80001654:	00001737          	lui	a4,0x1
    80001658:	00e787b3          	add	a5,a5,a4
    8000165c:	feb7e4e3          	bltu	a5,a1,80001644 <pmm_init+0x44>
    80001660:	00060663          	beqz	a2,8000166c <pmm_init+0x6c>
    80001664:	00425797          	auipc	a5,0x425
    80001668:	4cd7ba23          	sd	a3,1236(a5) # 80426b38 <freelist>
    8000166c:	00008067          	ret
    80001670:	00000793          	li	a5,0
    80001674:	00000613          	li	a2,0
    80001678:	00000693          	li	a3,0
    8000167c:	fd9ff06f          	j	80001654 <pmm_init+0x54>

0000000080001680 <alloc_page>:
    80001680:	00425797          	auipc	a5,0x425
    80001684:	4b878793          	add	a5,a5,1208 # 80426b38 <freelist>
    80001688:	0007b503          	ld	a0,0(a5)
    8000168c:	00050663          	beqz	a0,80001698 <alloc_page+0x18>
    80001690:	00053703          	ld	a4,0(a0)
    80001694:	00e7b023          	sd	a4,0(a5)
    80001698:	00008067          	ret

000000008000169c <free_page>:
    8000169c:	02050c63          	beqz	a0,800016d4 <free_page+0x38>
    800016a0:	00425797          	auipc	a5,0x425
    800016a4:	4907b783          	ld	a5,1168(a5) # 80426b30 <mem_start>
    800016a8:	02f56663          	bltu	a0,a5,800016d4 <free_page+0x38>
    800016ac:	00425797          	auipc	a5,0x425
    800016b0:	47c7b783          	ld	a5,1148(a5) # 80426b28 <mem_end>
    800016b4:	02f57063          	bgeu	a0,a5,800016d4 <free_page+0x38>
    800016b8:	03451793          	sll	a5,a0,0x34
    800016bc:	00079c63          	bnez	a5,800016d4 <free_page+0x38>
    800016c0:	00425797          	auipc	a5,0x425
    800016c4:	47878793          	add	a5,a5,1144 # 80426b38 <freelist>
    800016c8:	0007b703          	ld	a4,0(a5)
    800016cc:	00a7b023          	sd	a0,0(a5)
    800016d0:	00e53023          	sd	a4,0(a0)
    800016d4:	00008067          	ret

00000000800016d8 <alloc_pages>:
    800016d8:	00050613          	mv	a2,a0
    800016dc:	08a05863          	blez	a0,8000176c <alloc_pages+0x94>
    800016e0:	00425317          	auipc	t1,0x425
    800016e4:	45830313          	add	t1,t1,1112 # 80426b38 <freelist>
    800016e8:	00100793          	li	a5,1
    800016ec:	00033803          	ld	a6,0(t1)
    800016f0:	06f50463          	beq	a0,a5,80001758 <alloc_pages+0x80>
    800016f4:	06080c63          	beqz	a6,8000176c <alloc_pages+0x94>
    800016f8:	00083503          	ld	a0,0(a6)
    800016fc:	00080793          	mv	a5,a6
    80001700:	00100713          	li	a4,1
    80001704:	00000893          	li	a7,0
    80001708:	000015b7          	lui	a1,0x1
    8000170c:	0200006f          	j	8000172c <alloc_pages+0x54>
    80001710:	02d50463          	beq	a0,a3,80001738 <alloc_pages+0x60>
    80001714:	00053683          	ld	a3,0(a0)
    80001718:	00078893          	mv	a7,a5
    8000171c:	00050813          	mv	a6,a0
    80001720:	00100713          	li	a4,1
    80001724:	00050793          	mv	a5,a0
    80001728:	00068513          	mv	a0,a3
    8000172c:	00b786b3          	add	a3,a5,a1
    80001730:	fe0510e3          	bnez	a0,80001710 <alloc_pages+0x38>
    80001734:	00008067          	ret
    80001738:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    8000173c:	00053683          	ld	a3,0(a0)
    80001740:	fee612e3          	bne	a2,a4,80001724 <alloc_pages+0x4c>
    80001744:	02088863          	beqz	a7,80001774 <alloc_pages+0x9c>
    80001748:	00d8b023          	sd	a3,0(a7)
    8000174c:	00053023          	sd	zero,0(a0)
    80001750:	00080513          	mv	a0,a6
    80001754:	00008067          	ret
    80001758:	00080663          	beqz	a6,80001764 <alloc_pages+0x8c>
    8000175c:	00083783          	ld	a5,0(a6)
    80001760:	00f33023          	sd	a5,0(t1)
    80001764:	00080513          	mv	a0,a6
    80001768:	00008067          	ret
    8000176c:	00000513          	li	a0,0
    80001770:	00008067          	ret
    80001774:	00053023          	sd	zero,0(a0)
    80001778:	00d33023          	sd	a3,0(t1)
    8000177c:	00080513          	mv	a0,a6
    80001780:	00008067          	ret

0000000080001784 <walk_lookup>:
    80001784:	01e5d793          	srl	a5,a1,0x1e
    80001788:	1ff7f793          	and	a5,a5,511
    8000178c:	00379793          	sll	a5,a5,0x3
    80001790:	00f50533          	add	a0,a0,a5
    80001794:	00053703          	ld	a4,0(a0)
    80001798:	00177793          	and	a5,a4,1
    8000179c:	04078a63          	beqz	a5,800017f0 <walk_lookup+0x6c>
    800017a0:	00e77793          	and	a5,a4,14
    800017a4:	04079663          	bnez	a5,800017f0 <walk_lookup+0x6c>
    800017a8:	0155d793          	srl	a5,a1,0x15
    800017ac:	00a75713          	srl	a4,a4,0xa
    800017b0:	1ff7f793          	and	a5,a5,511
    800017b4:	00c71713          	sll	a4,a4,0xc
    800017b8:	00379793          	sll	a5,a5,0x3
    800017bc:	00e787b3          	add	a5,a5,a4
    800017c0:	0007b503          	ld	a0,0(a5)
    800017c4:	00157793          	and	a5,a0,1
    800017c8:	02078463          	beqz	a5,800017f0 <walk_lookup+0x6c>
    800017cc:	00e57793          	and	a5,a0,14
    800017d0:	02079063          	bnez	a5,800017f0 <walk_lookup+0x6c>
    800017d4:	00c5d593          	srl	a1,a1,0xc
    800017d8:	00a55513          	srl	a0,a0,0xa
    800017dc:	1ff5f593          	and	a1,a1,511
    800017e0:	00359593          	sll	a1,a1,0x3
    800017e4:	00c51513          	sll	a0,a0,0xc
    800017e8:	00b50533          	add	a0,a0,a1
    800017ec:	00008067          	ret
    800017f0:	00000513          	li	a0,0
    800017f4:	00008067          	ret

00000000800017f8 <free_swap_slot.part.0>:
    800017f8:	0055579b          	srlw	a5,a0,0x5
    800017fc:	00010617          	auipc	a2,0x10
    80001800:	80460613          	add	a2,a2,-2044 # 80011000 <swap_mgr>
    80001804:	00279793          	sll	a5,a5,0x2
    80001808:	00f607b3          	add	a5,a2,a5
    8000180c:	0007a583          	lw	a1,0(a5)
    80001810:	00100713          	li	a4,1
    80001814:	00a7173b          	sllw	a4,a4,a0
    80001818:	00e5f6b3          	and	a3,a1,a4
    8000181c:	0006869b          	sext.w	a3,a3
    80001820:	02068463          	beqz	a3,80001848 <free_swap_slot.part.0+0x50>
    80001824:	08862683          	lw	a3,136(a2)
    80001828:	fff74713          	not	a4,a4
    8000182c:	08062803          	lw	a6,128(a2)
    80001830:	00e5f5b3          	and	a1,a1,a4
    80001834:	fff6871b          	addw	a4,a3,-1
    80001838:	00b7a023          	sw	a1,0(a5)
    8000183c:	08e62423          	sw	a4,136(a2)
    80001840:	01057463          	bgeu	a0,a6,80001848 <free_swap_slot.part.0+0x50>
    80001844:	08a62023          	sw	a0,128(a2)
    80001848:	00008067          	ret

000000008000184c <uvmunmap.part.0>:
    8000184c:	fc010113          	add	sp,sp,-64
    80001850:	03213023          	sd	s2,32(sp)
    80001854:	00c61913          	sll	s2,a2,0xc
    80001858:	02113c23          	sd	ra,56(sp)
    8000185c:	02813823          	sd	s0,48(sp)
    80001860:	02913423          	sd	s1,40(sp)
    80001864:	01313c23          	sd	s3,24(sp)
    80001868:	01413823          	sd	s4,16(sp)
    8000186c:	01513423          	sd	s5,8(sp)
    80001870:	00b90933          	add	s2,s2,a1
    80001874:	0525f863          	bgeu	a1,s2,800018c4 <uvmunmap.part.0+0x78>
    80001878:	00058493          	mv	s1,a1
    8000187c:	00050993          	mv	s3,a0
    80001880:	00068a93          	mv	s5,a3
    80001884:	00001a37          	lui	s4,0x1
    80001888:	00048593          	mv	a1,s1
    8000188c:	00098513          	mv	a0,s3
    80001890:	ef5ff0ef          	jal	80001784 <walk_lookup>
    80001894:	00050413          	mv	s0,a0
    80001898:	014484b3          	add	s1,s1,s4
    8000189c:	02050263          	beqz	a0,800018c0 <uvmunmap.part.0+0x74>
    800018a0:	00053783          	ld	a5,0(a0)
    800018a4:	00a7d713          	srl	a4,a5,0xa
    800018a8:	0017f793          	and	a5,a5,1
    800018ac:	00c71513          	sll	a0,a4,0xc
    800018b0:	00078863          	beqz	a5,800018c0 <uvmunmap.part.0+0x74>
    800018b4:	00050663          	beqz	a0,800018c0 <uvmunmap.part.0+0x74>
    800018b8:	020a9863          	bnez	s5,800018e8 <uvmunmap.part.0+0x9c>
    800018bc:	00043023          	sd	zero,0(s0)
    800018c0:	fd24e4e3          	bltu	s1,s2,80001888 <uvmunmap.part.0+0x3c>
    800018c4:	03813083          	ld	ra,56(sp)
    800018c8:	03013403          	ld	s0,48(sp)
    800018cc:	02813483          	ld	s1,40(sp)
    800018d0:	02013903          	ld	s2,32(sp)
    800018d4:	01813983          	ld	s3,24(sp)
    800018d8:	01013a03          	ld	s4,16(sp)
    800018dc:	00813a83          	ld	s5,8(sp)
    800018e0:	04010113          	add	sp,sp,64
    800018e4:	00008067          	ret
    800018e8:	db5ff0ef          	jal	8000169c <free_page>
    800018ec:	00043023          	sd	zero,0(s0)
    800018f0:	fd1ff06f          	j	800018c0 <uvmunmap.part.0+0x74>

00000000800018f4 <create_pagetable>:
    800018f4:	ff010113          	add	sp,sp,-16
    800018f8:	00113423          	sd	ra,8(sp)
    800018fc:	d85ff0ef          	jal	80001680 <alloc_page>
    80001900:	00050e63          	beqz	a0,8000191c <create_pagetable+0x28>
    80001904:	00001737          	lui	a4,0x1
    80001908:	00050793          	mv	a5,a0
    8000190c:	00e50733          	add	a4,a0,a4
    80001910:	0007b023          	sd	zero,0(a5)
    80001914:	00878793          	add	a5,a5,8
    80001918:	fee79ce3          	bne	a5,a4,80001910 <create_pagetable+0x1c>
    8000191c:	00813083          	ld	ra,8(sp)
    80001920:	01010113          	add	sp,sp,16
    80001924:	00008067          	ret

0000000080001928 <map_page>:
    80001928:	00c5e7b3          	or	a5,a1,a2
    8000192c:	03479713          	sll	a4,a5,0x34
    80001930:	20071863          	bnez	a4,80001b40 <map_page+0x218>
    80001934:	fc010113          	add	sp,sp,-64
    80001938:	02913423          	sd	s1,40(sp)
    8000193c:	03213023          	sd	s2,32(sp)
    80001940:	01313c23          	sd	s3,24(sp)
    80001944:	01413823          	sd	s4,16(sp)
    80001948:	01513423          	sd	s5,8(sp)
    8000194c:	01613023          	sd	s6,0(sp)
    80001950:	02113c23          	sd	ra,56(sp)
    80001954:	02813823          	sd	s0,48(sp)
    80001958:	00058493          	mv	s1,a1
    8000195c:	00060913          	mv	s2,a2
    80001960:	00050a13          	mv	s4,a0
    80001964:	00068993          	mv	s3,a3
    80001968:	00050813          	mv	a6,a0
    8000196c:	00200a93          	li	s5,2
    80001970:	00200793          	li	a5,2
    80001974:	00100b13          	li	s6,1
    80001978:	0037941b          	sllw	s0,a5,0x3
    8000197c:	00f4043b          	addw	s0,s0,a5
    80001980:	00c4041b          	addw	s0,s0,12
    80001984:	0084d433          	srl	s0,s1,s0
    80001988:	1ff47413          	and	s0,s0,511
    8000198c:	00341413          	sll	s0,s0,0x3
    80001990:	00880433          	add	s0,a6,s0
    80001994:	00043783          	ld	a5,0(s0)
    80001998:	0017f713          	and	a4,a5,1
    8000199c:	14070e63          	beqz	a4,80001af8 <map_page+0x1d0>
    800019a0:	00e7f713          	and	a4,a5,14
    800019a4:	18071a63          	bnez	a4,80001b38 <map_page+0x210>
    800019a8:	00a7d793          	srl	a5,a5,0xa
    800019ac:	00c79813          	sll	a6,a5,0xc
    800019b0:	00100793          	li	a5,1
    800019b4:	016a8663          	beq	s5,s6,800019c0 <map_page+0x98>
    800019b8:	00100a93          	li	s5,1
    800019bc:	fbdff06f          	j	80001978 <map_page+0x50>
    800019c0:	00c4d793          	srl	a5,s1,0xc
    800019c4:	1ff7f793          	and	a5,a5,511
    800019c8:	00379793          	sll	a5,a5,0x3
    800019cc:	00f80833          	add	a6,a6,a5
    800019d0:	16080463          	beqz	a6,80001b38 <map_page+0x210>
    800019d4:	00083783          	ld	a5,0(a6)
    800019d8:	0017f793          	and	a5,a5,1
    800019dc:	14079e63          	bnez	a5,80001b38 <map_page+0x210>
    800019e0:	00c95793          	srl	a5,s2,0xc
    800019e4:	00a79793          	sll	a5,a5,0xa
    800019e8:	00412597          	auipc	a1,0x412
    800019ec:	6a858593          	add	a1,a1,1704 # 80414090 <lru_mgr+0x3000>
    800019f0:	0145a703          	lw	a4,20(a1)
    800019f4:	0137e7b3          	or	a5,a5,s3
    800019f8:	0017e793          	or	a5,a5,1
    800019fc:	00f83023          	sd	a5,0(a6)
    80001a00:	0c070663          	beqz	a4,80001acc <map_page+0x1a4>
    80001a04:	0040f717          	auipc	a4,0x40f
    80001a08:	6b070713          	add	a4,a4,1712 # 804110b4 <lru_mgr+0x24>
    80001a0c:	00000793          	li	a5,0
    80001a10:	10000693          	li	a3,256
    80001a14:	00c0006f          	j	80001a20 <map_page+0xf8>
    80001a18:	0017879b          	addw	a5,a5,1
    80001a1c:	0ad78863          	beq	a5,a3,80001acc <map_page+0x1a4>
    80001a20:	00072803          	lw	a6,0(a4)
    80001a24:	03070713          	add	a4,a4,48
    80001a28:	fe0818e3          	bnez	a6,80001a18 <map_page+0xf0>
    80001a2c:	00178813          	add	a6,a5,1
    80001a30:	00181513          	sll	a0,a6,0x1
    80001a34:	00179713          	sll	a4,a5,0x1
    80001a38:	01050533          	add	a0,a0,a6
    80001a3c:	0040f617          	auipc	a2,0x40f
    80001a40:	65460613          	add	a2,a2,1620 # 80411090 <lru_mgr>
    80001a44:	00f706b3          	add	a3,a4,a5
    80001a48:	00451513          	sll	a0,a0,0x4
    80001a4c:	00469693          	sll	a3,a3,0x4
    80001a50:	00a60533          	add	a0,a2,a0
    80001a54:	fffff337          	lui	t1,0xfffff
    80001a58:	00d608b3          	add	a7,a2,a3
    80001a5c:	0064f4b3          	and	s1,s1,t1
    80001a60:	01453423          	sd	s4,8(a0)
    80001a64:	fff00513          	li	a0,-1
    80001a68:	01068693          	add	a3,a3,16
    80001a6c:	0098b823          	sd	s1,16(a7)
    80001a70:	0128bc23          	sd	s2,24(a7)
    80001a74:	02a8a023          	sw	a0,32(a7)
    80001a78:	0049f993          	and	s3,s3,4
    80001a7c:	00d606b3          	add	a3,a2,a3
    80001a80:	00098463          	beqz	s3,80001a88 <map_page+0x160>
    80001a84:	00500a93          	li	s5,5
    80001a88:	00181513          	sll	a0,a6,0x1
    80001a8c:	00f707b3          	add	a5,a4,a5
    80001a90:	00063883          	ld	a7,0(a2)
    80001a94:	01050733          	add	a4,a0,a6
    80001a98:	00479793          	sll	a5,a5,0x4
    80001a9c:	00471713          	sll	a4,a4,0x4
    80001aa0:	00f607b3          	add	a5,a2,a5
    80001aa4:	00e60733          	add	a4,a2,a4
    80001aa8:	0357a223          	sw	s5,36(a5)
    80001aac:	01173023          	sd	a7,0(a4)
    80001ab0:	0207b423          	sd	zero,40(a5)
    80001ab4:	06088e63          	beqz	a7,80001b30 <map_page+0x208>
    80001ab8:	00d8bc23          	sd	a3,24(a7)
    80001abc:	0105a783          	lw	a5,16(a1)
    80001ac0:	00d63023          	sd	a3,0(a2)
    80001ac4:	0017879b          	addw	a5,a5,1
    80001ac8:	00f5a823          	sw	a5,16(a1)
    80001acc:	00000513          	li	a0,0
    80001ad0:	03813083          	ld	ra,56(sp)
    80001ad4:	03013403          	ld	s0,48(sp)
    80001ad8:	02813483          	ld	s1,40(sp)
    80001adc:	02013903          	ld	s2,32(sp)
    80001ae0:	01813983          	ld	s3,24(sp)
    80001ae4:	01013a03          	ld	s4,16(sp)
    80001ae8:	00813a83          	ld	s5,8(sp)
    80001aec:	00013b03          	ld	s6,0(sp)
    80001af0:	04010113          	add	sp,sp,64
    80001af4:	00008067          	ret
    80001af8:	b89ff0ef          	jal	80001680 <alloc_page>
    80001afc:	00050813          	mv	a6,a0
    80001b00:	02050c63          	beqz	a0,80001b38 <map_page+0x210>
    80001b04:	00001737          	lui	a4,0x1
    80001b08:	00e50733          	add	a4,a0,a4
    80001b0c:	00050793          	mv	a5,a0
    80001b10:	0007b023          	sd	zero,0(a5)
    80001b14:	00878793          	add	a5,a5,8
    80001b18:	fee79ce3          	bne	a5,a4,80001b10 <map_page+0x1e8>
    80001b1c:	00c85793          	srl	a5,a6,0xc
    80001b20:	00a79793          	sll	a5,a5,0xa
    80001b24:	0017e793          	or	a5,a5,1
    80001b28:	00f43023          	sd	a5,0(s0)
    80001b2c:	e85ff06f          	j	800019b0 <map_page+0x88>
    80001b30:	00d63423          	sd	a3,8(a2)
    80001b34:	f89ff06f          	j	80001abc <map_page+0x194>
    80001b38:	fff00513          	li	a0,-1
    80001b3c:	f95ff06f          	j	80001ad0 <map_page+0x1a8>
    80001b40:	fff00513          	li	a0,-1
    80001b44:	00008067          	ret

0000000080001b48 <map_region>:
    80001b48:	000017b7          	lui	a5,0x1
    80001b4c:	fc010113          	add	sp,sp,-64
    80001b50:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001b54:	02913423          	sd	s1,40(sp)
    80001b58:	00f684b3          	add	s1,a3,a5
    80001b5c:	00b484b3          	add	s1,s1,a1
    80001b60:	fffff7b7          	lui	a5,0xfffff
    80001b64:	02113c23          	sd	ra,56(sp)
    80001b68:	02813823          	sd	s0,48(sp)
    80001b6c:	03213023          	sd	s2,32(sp)
    80001b70:	01313c23          	sd	s3,24(sp)
    80001b74:	01413823          	sd	s4,16(sp)
    80001b78:	01513423          	sd	s5,8(sp)
    80001b7c:	00f4f4b3          	and	s1,s1,a5
    80001b80:	0495f263          	bgeu	a1,s1,80001bc4 <map_region+0x7c>
    80001b84:	00058413          	mv	s0,a1
    80001b88:	00050993          	mv	s3,a0
    80001b8c:	00070a13          	mv	s4,a4
    80001b90:	40b60933          	sub	s2,a2,a1
    80001b94:	00001ab7          	lui	s5,0x1
    80001b98:	0080006f          	j	80001ba0 <map_region+0x58>
    80001b9c:	02947463          	bgeu	s0,s1,80001bc4 <map_region+0x7c>
    80001ba0:	00890633          	add	a2,s2,s0
    80001ba4:	00040593          	mv	a1,s0
    80001ba8:	000a0693          	mv	a3,s4
    80001bac:	00098513          	mv	a0,s3
    80001bb0:	d79ff0ef          	jal	80001928 <map_page>
    80001bb4:	01540433          	add	s0,s0,s5
    80001bb8:	fe0502e3          	beqz	a0,80001b9c <map_region+0x54>
    80001bbc:	fff00513          	li	a0,-1
    80001bc0:	0080006f          	j	80001bc8 <map_region+0x80>
    80001bc4:	00000513          	li	a0,0
    80001bc8:	03813083          	ld	ra,56(sp)
    80001bcc:	03013403          	ld	s0,48(sp)
    80001bd0:	02813483          	ld	s1,40(sp)
    80001bd4:	02013903          	ld	s2,32(sp)
    80001bd8:	01813983          	ld	s3,24(sp)
    80001bdc:	01013a03          	ld	s4,16(sp)
    80001be0:	00813a83          	ld	s5,8(sp)
    80001be4:	04010113          	add	sp,sp,64
    80001be8:	00008067          	ret

0000000080001bec <destroy_pagetable>:
    80001bec:	f0010113          	add	sp,sp,-256
    80001bf0:	000017b7          	lui	a5,0x1
    80001bf4:	0e813823          	sd	s0,240(sp)
    80001bf8:	0f213023          	sd	s2,224(sp)
    80001bfc:	0d613023          	sd	s6,192(sp)
    80001c00:	0b713c23          	sd	s7,184(sp)
    80001c04:	0e113c23          	sd	ra,248(sp)
    80001c08:	0e913423          	sd	s1,232(sp)
    80001c0c:	0d313c23          	sd	s3,216(sp)
    80001c10:	0d413823          	sd	s4,208(sp)
    80001c14:	0d513423          	sd	s5,200(sp)
    80001c18:	0b813823          	sd	s8,176(sp)
    80001c1c:	0b913423          	sd	s9,168(sp)
    80001c20:	0ba13023          	sd	s10,160(sp)
    80001c24:	09b13c23          	sd	s11,152(sp)
    80001c28:	00050413          	mv	s0,a0
    80001c2c:	00050913          	mv	s2,a0
    80001c30:	00f50b33          	add	s6,a0,a5
    80001c34:	00001bb7          	lui	s7,0x1
    80001c38:	00c0006f          	j	80001c44 <destroy_pagetable+0x58>
    80001c3c:	00890913          	add	s2,s2,8
    80001c40:	2d690063          	beq	s2,s6,80001f00 <destroy_pagetable+0x314>
    80001c44:	00093783          	ld	a5,0(s2)
    80001c48:	00100713          	li	a4,1
    80001c4c:	00f7f693          	and	a3,a5,15
    80001c50:	fee696e3          	bne	a3,a4,80001c3c <destroy_pagetable+0x50>
    80001c54:	00a7d793          	srl	a5,a5,0xa
    80001c58:	00c79a13          	sll	s4,a5,0xc
    80001c5c:	017a0cb3          	add	s9,s4,s7
    80001c60:	00100d93          	li	s11,1
    80001c64:	000a0a93          	mv	s5,s4
    80001c68:	00040493          	mv	s1,s0
    80001c6c:	00c0006f          	j	80001c78 <destroy_pagetable+0x8c>
    80001c70:	008a0a13          	add	s4,s4,8 # 1008 <_entry-0x7fffeff8>
    80001c74:	279a0c63          	beq	s4,s9,80001eec <destroy_pagetable+0x300>
    80001c78:	000a3783          	ld	a5,0(s4)
    80001c7c:	00f7f713          	and	a4,a5,15
    80001c80:	ffb718e3          	bne	a4,s11,80001c70 <destroy_pagetable+0x84>
    80001c84:	00a7d793          	srl	a5,a5,0xa
    80001c88:	00c79993          	sll	s3,a5,0xc
    80001c8c:	00098c13          	mv	s8,s3
    80001c90:	01798d33          	add	s10,s3,s7
    80001c94:	00098413          	mv	s0,s3
    80001c98:	00c0006f          	j	80001ca4 <destroy_pagetable+0xb8>
    80001c9c:	00840413          	add	s0,s0,8
    80001ca0:	23a40e63          	beq	s0,s10,80001edc <destroy_pagetable+0x2f0>
    80001ca4:	00043783          	ld	a5,0(s0)
    80001ca8:	00f7f713          	and	a4,a5,15
    80001cac:	ffb718e3          	bne	a4,s11,80001c9c <destroy_pagetable+0xb0>
    80001cb0:	00a7d793          	srl	a5,a5,0xa
    80001cb4:	00c79793          	sll	a5,a5,0xc
    80001cb8:	00048713          	mv	a4,s1
    80001cbc:	03513c23          	sd	s5,56(sp)
    80001cc0:	00090493          	mv	s1,s2
    80001cc4:	017789b3          	add	s3,a5,s7
    80001cc8:	02813823          	sd	s0,48(sp)
    80001ccc:	00078a93          	mv	s5,a5
    80001cd0:	00070913          	mv	s2,a4
    80001cd4:	00c0006f          	j	80001ce0 <destroy_pagetable+0xf4>
    80001cd8:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80001cdc:	1cf98e63          	beq	s3,a5,80001eb8 <destroy_pagetable+0x2cc>
    80001ce0:	0007b703          	ld	a4,0(a5)
    80001ce4:	00f77693          	and	a3,a4,15
    80001ce8:	ffb698e3          	bne	a3,s11,80001cd8 <destroy_pagetable+0xec>
    80001cec:	00a75713          	srl	a4,a4,0xa
    80001cf0:	00c71713          	sll	a4,a4,0xc
    80001cf4:	017706b3          	add	a3,a4,s7
    80001cf8:	05313423          	sd	s3,72(sp)
    80001cfc:	00d13423          	sd	a3,8(sp)
    80001d00:	05813023          	sd	s8,64(sp)
    80001d04:	00070993          	mv	s3,a4
    80001d08:	04f13823          	sd	a5,80(sp)
    80001d0c:	0100006f          	j	80001d1c <destroy_pagetable+0x130>
    80001d10:	00813783          	ld	a5,8(sp)
    80001d14:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    80001d18:	16e78e63          	beq	a5,a4,80001e94 <destroy_pagetable+0x2a8>
    80001d1c:	00073783          	ld	a5,0(a4)
    80001d20:	00f7f693          	and	a3,a5,15
    80001d24:	ffb696e3          	bne	a3,s11,80001d10 <destroy_pagetable+0x124>
    80001d28:	00a7d793          	srl	a5,a5,0xa
    80001d2c:	00c79793          	sll	a5,a5,0xc
    80001d30:	017786b3          	add	a3,a5,s7
    80001d34:	000a8c13          	mv	s8,s5
    80001d38:	00d13c23          	sd	a3,24(sp)
    80001d3c:	00078a93          	mv	s5,a5
    80001d40:	04e13c23          	sd	a4,88(sp)
    80001d44:	07213023          	sd	s2,96(sp)
    80001d48:	0100006f          	j	80001d58 <destroy_pagetable+0x16c>
    80001d4c:	01813703          	ld	a4,24(sp)
    80001d50:	00878793          	add	a5,a5,8
    80001d54:	10f70c63          	beq	a4,a5,80001e6c <destroy_pagetable+0x280>
    80001d58:	0007b703          	ld	a4,0(a5)
    80001d5c:	00f77693          	and	a3,a4,15
    80001d60:	ffb696e3          	bne	a3,s11,80001d4c <destroy_pagetable+0x160>
    80001d64:	00a75713          	srl	a4,a4,0xa
    80001d68:	00c71913          	sll	s2,a4,0xc
    80001d6c:	01790733          	add	a4,s2,s7
    80001d70:	07213423          	sd	s2,104(sp)
    80001d74:	00090413          	mv	s0,s2
    80001d78:	02e13023          	sd	a4,32(sp)
    80001d7c:	06f13823          	sd	a5,112(sp)
    80001d80:	00048913          	mv	s2,s1
    80001d84:	0100006f          	j	80001d94 <destroy_pagetable+0x1a8>
    80001d88:	02013783          	ld	a5,32(sp)
    80001d8c:	00840413          	add	s0,s0,8
    80001d90:	0a878c63          	beq	a5,s0,80001e48 <destroy_pagetable+0x25c>
    80001d94:	00043783          	ld	a5,0(s0)
    80001d98:	00f7f693          	and	a3,a5,15
    80001d9c:	ffb696e3          	bne	a3,s11,80001d88 <destroy_pagetable+0x19c>
    80001da0:	00a7d793          	srl	a5,a5,0xa
    80001da4:	00c79493          	sll	s1,a5,0xc
    80001da8:	017487b3          	add	a5,s1,s7
    80001dac:	00913823          	sd	s1,16(sp)
    80001db0:	02f13423          	sd	a5,40(sp)
    80001db4:	06813c23          	sd	s0,120(sp)
    80001db8:	0100006f          	j	80001dc8 <destroy_pagetable+0x1dc>
    80001dbc:	02813783          	ld	a5,40(sp)
    80001dc0:	00848493          	add	s1,s1,8
    80001dc4:	06978663          	beq	a5,s1,80001e30 <destroy_pagetable+0x244>
    80001dc8:	0004b783          	ld	a5,0(s1)
    80001dcc:	00f7f693          	and	a3,a5,15
    80001dd0:	ffb696e3          	bne	a3,s11,80001dbc <destroy_pagetable+0x1d0>
    80001dd4:	00a7d793          	srl	a5,a5,0xa
    80001dd8:	00c79413          	sll	s0,a5,0xc
    80001ddc:	017406b3          	add	a3,s0,s7
    80001de0:	09213023          	sd	s2,128(sp)
    80001de4:	09613423          	sd	s6,136(sp)
    80001de8:	00040913          	mv	s2,s0
    80001dec:	000a0b13          	mv	s6,s4
    80001df0:	00048a13          	mv	s4,s1
    80001df4:	00068493          	mv	s1,a3
    80001df8:	00043783          	ld	a5,0(s0)
    80001dfc:	00840413          	add	s0,s0,8
    80001e00:	00f7f713          	and	a4,a5,15
    80001e04:	13b70e63          	beq	a4,s11,80001f40 <destroy_pagetable+0x354>
    80001e08:	fe8498e3          	bne	s1,s0,80001df8 <destroy_pagetable+0x20c>
    80001e0c:	00090513          	mv	a0,s2
    80001e10:	000a0493          	mv	s1,s4
    80001e14:	08013903          	ld	s2,128(sp)
    80001e18:	000b0a13          	mv	s4,s6
    80001e1c:	08813b03          	ld	s6,136(sp)
    80001e20:	87dff0ef          	jal	8000169c <free_page>
    80001e24:	02813783          	ld	a5,40(sp)
    80001e28:	00848493          	add	s1,s1,8
    80001e2c:	f8979ee3          	bne	a5,s1,80001dc8 <destroy_pagetable+0x1dc>
    80001e30:	01013503          	ld	a0,16(sp)
    80001e34:	07813403          	ld	s0,120(sp)
    80001e38:	865ff0ef          	jal	8000169c <free_page>
    80001e3c:	02013783          	ld	a5,32(sp)
    80001e40:	00840413          	add	s0,s0,8
    80001e44:	f48798e3          	bne	a5,s0,80001d94 <destroy_pagetable+0x1a8>
    80001e48:	07013783          	ld	a5,112(sp)
    80001e4c:	06813503          	ld	a0,104(sp)
    80001e50:	00090493          	mv	s1,s2
    80001e54:	00f13823          	sd	a5,16(sp)
    80001e58:	845ff0ef          	jal	8000169c <free_page>
    80001e5c:	01013783          	ld	a5,16(sp)
    80001e60:	01813703          	ld	a4,24(sp)
    80001e64:	00878793          	add	a5,a5,8
    80001e68:	eef718e3          	bne	a4,a5,80001d58 <destroy_pagetable+0x16c>
    80001e6c:	05813703          	ld	a4,88(sp)
    80001e70:	000a8513          	mv	a0,s5
    80001e74:	06013903          	ld	s2,96(sp)
    80001e78:	00e13823          	sd	a4,16(sp)
    80001e7c:	821ff0ef          	jal	8000169c <free_page>
    80001e80:	01013703          	ld	a4,16(sp)
    80001e84:	00813783          	ld	a5,8(sp)
    80001e88:	000c0a93          	mv	s5,s8
    80001e8c:	00870713          	add	a4,a4,8
    80001e90:	e8e796e3          	bne	a5,a4,80001d1c <destroy_pagetable+0x130>
    80001e94:	05013783          	ld	a5,80(sp)
    80001e98:	00098513          	mv	a0,s3
    80001e9c:	04013c03          	ld	s8,64(sp)
    80001ea0:	00f13423          	sd	a5,8(sp)
    80001ea4:	04813983          	ld	s3,72(sp)
    80001ea8:	ff4ff0ef          	jal	8000169c <free_page>
    80001eac:	00813783          	ld	a5,8(sp)
    80001eb0:	00878793          	add	a5,a5,8
    80001eb4:	e2f996e3          	bne	s3,a5,80001ce0 <destroy_pagetable+0xf4>
    80001eb8:	03013403          	ld	s0,48(sp)
    80001ebc:	00090793          	mv	a5,s2
    80001ec0:	000a8513          	mv	a0,s5
    80001ec4:	00840413          	add	s0,s0,8
    80001ec8:	03813a83          	ld	s5,56(sp)
    80001ecc:	00048913          	mv	s2,s1
    80001ed0:	00078493          	mv	s1,a5
    80001ed4:	fc8ff0ef          	jal	8000169c <free_page>
    80001ed8:	dda416e3          	bne	s0,s10,80001ca4 <destroy_pagetable+0xb8>
    80001edc:	000c0513          	mv	a0,s8
    80001ee0:	008a0a13          	add	s4,s4,8
    80001ee4:	fb8ff0ef          	jal	8000169c <free_page>
    80001ee8:	d99a18e3          	bne	s4,s9,80001c78 <destroy_pagetable+0x8c>
    80001eec:	000a8513          	mv	a0,s5
    80001ef0:	00890913          	add	s2,s2,8
    80001ef4:	00048413          	mv	s0,s1
    80001ef8:	fa4ff0ef          	jal	8000169c <free_page>
    80001efc:	d56914e3          	bne	s2,s6,80001c44 <destroy_pagetable+0x58>
    80001f00:	00040513          	mv	a0,s0
    80001f04:	0f013403          	ld	s0,240(sp)
    80001f08:	0f813083          	ld	ra,248(sp)
    80001f0c:	0e813483          	ld	s1,232(sp)
    80001f10:	0e013903          	ld	s2,224(sp)
    80001f14:	0d813983          	ld	s3,216(sp)
    80001f18:	0d013a03          	ld	s4,208(sp)
    80001f1c:	0c813a83          	ld	s5,200(sp)
    80001f20:	0c013b03          	ld	s6,192(sp)
    80001f24:	0b813b83          	ld	s7,184(sp)
    80001f28:	0b013c03          	ld	s8,176(sp)
    80001f2c:	0a813c83          	ld	s9,168(sp)
    80001f30:	0a013d03          	ld	s10,160(sp)
    80001f34:	09813d83          	ld	s11,152(sp)
    80001f38:	10010113          	add	sp,sp,256
    80001f3c:	f60ff06f          	j	8000169c <free_page>
    80001f40:	00a7d793          	srl	a5,a5,0xa
    80001f44:	00c79513          	sll	a0,a5,0xc
    80001f48:	ca5ff0ef          	jal	80001bec <destroy_pagetable>
    80001f4c:	ea8496e3          	bne	s1,s0,80001df8 <destroy_pagetable+0x20c>
    80001f50:	ebdff06f          	j	80001e0c <destroy_pagetable+0x220>

0000000080001f54 <kvminithart>:
    80001f54:	00425797          	auipc	a5,0x425
    80001f58:	bec7b783          	ld	a5,-1044(a5) # 80426b40 <kernel_pagetable>
    80001f5c:	fff00713          	li	a4,-1
    80001f60:	03f71713          	sll	a4,a4,0x3f
    80001f64:	00c7d793          	srl	a5,a5,0xc
    80001f68:	00e7e7b3          	or	a5,a5,a4
    80001f6c:	18079073          	csrw	satp,a5
    80001f70:	12000073          	sfence.vma
    80001f74:	00008067          	ret

0000000080001f78 <dump_pagetable>:
    80001f78:	fb010113          	add	sp,sp,-80
    80001f7c:	03213823          	sd	s2,48(sp)
    80001f80:	03313423          	sd	s3,40(sp)
    80001f84:	04113423          	sd	ra,72(sp)
    80001f88:	04813023          	sd	s0,64(sp)
    80001f8c:	02913c23          	sd	s1,56(sp)
    80001f90:	03413023          	sd	s4,32(sp)
    80001f94:	01513c23          	sd	s5,24(sp)
    80001f98:	01613823          	sd	s6,16(sp)
    80001f9c:	01713423          	sd	s7,8(sp)
    80001fa0:	00058993          	mv	s3,a1
    80001fa4:	00050913          	mv	s2,a0
    80001fa8:	28b05263          	blez	a1,8000222c <dump_pagetable+0x2b4>
    80001fac:	00000413          	li	s0,0
    80001fb0:	0014041b          	addw	s0,s0,1
    80001fb4:	02000513          	li	a0,32
    80001fb8:	e04ff0ef          	jal	800015bc <uart_putc>
    80001fbc:	fe899ae3          	bne	s3,s0,80001fb0 <dump_pagetable+0x38>
    80001fc0:	00006517          	auipc	a0,0x6
    80001fc4:	00050513          	mv	a0,a0
    80001fc8:	e0cff0ef          	jal	800015d4 <uart_puts>
    80001fcc:	00900793          	li	a5,9
    80001fd0:	2737d463          	bge	a5,s3,80002238 <dump_pagetable+0x2c0>
    80001fd4:	00a00413          	li	s0,10
    80001fd8:	0289c53b          	divw	a0,s3,s0
    80001fdc:	0305051b          	addw	a0,a0,48 # ffffffff80007ff0 <bss_end+0xfffffffeffbe1480>
    80001fe0:	0ff57513          	zext.b	a0,a0
    80001fe4:	dd8ff0ef          	jal	800015bc <uart_putc>
    80001fe8:	0289e53b          	remw	a0,s3,s0
    80001fec:	0305051b          	addw	a0,a0,48
    80001ff0:	0ff57513          	zext.b	a0,a0
    80001ff4:	dc8ff0ef          	jal	800015bc <uart_putc>
    80001ff8:	00006517          	auipc	a0,0x6
    80001ffc:	fe050513          	add	a0,a0,-32 # 80007fd8 <digits+0x30>
    80002000:	fff00b13          	li	s6,-1
    80002004:	dd0ff0ef          	jal	800015d4 <uart_puts>
    80002008:	00000493          	li	s1,0
    8000200c:	00cb5b13          	srl	s6,s6,0xc
    80002010:	00900a13          	li	s4,9
    80002014:	ffc00a93          	li	s5,-4
    80002018:	0140006f          	j	8000202c <dump_pagetable+0xb4>
    8000201c:	0014849b          	addw	s1,s1,1
    80002020:	20000793          	li	a5,512
    80002024:	00890913          	add	s2,s2,8
    80002028:	0cf48063          	beq	s1,a5,800020e8 <dump_pagetable+0x170>
    8000202c:	00093783          	ld	a5,0(s2)
    80002030:	0017f793          	and	a5,a5,1
    80002034:	fe0784e3          	beqz	a5,8000201c <dump_pagetable+0xa4>
    80002038:	00000413          	li	s0,0
    8000203c:	0009ca63          	bltz	s3,80002050 <dump_pagetable+0xd8>
    80002040:	0014041b          	addw	s0,s0,1
    80002044:	02000513          	li	a0,32
    80002048:	d74ff0ef          	jal	800015bc <uart_putc>
    8000204c:	fe89dae3          	bge	s3,s0,80002040 <dump_pagetable+0xc8>
    80002050:	00006517          	auipc	a0,0x6
    80002054:	f9050513          	add	a0,a0,-112 # 80007fe0 <digits+0x38>
    80002058:	d7cff0ef          	jal	800015d4 <uart_puts>
    8000205c:	06300793          	li	a5,99
    80002060:	1697d263          	bge	a5,s1,800021c4 <dump_pagetable+0x24c>
    80002064:	06400413          	li	s0,100
    80002068:	0284c53b          	divw	a0,s1,s0
    8000206c:	00a00b93          	li	s7,10
    80002070:	0305051b          	addw	a0,a0,48
    80002074:	0ff57513          	zext.b	a0,a0
    80002078:	d44ff0ef          	jal	800015bc <uart_putc>
    8000207c:	0284e53b          	remw	a0,s1,s0
    80002080:	0375453b          	divw	a0,a0,s7
    80002084:	0305051b          	addw	a0,a0,48
    80002088:	0ff57513          	zext.b	a0,a0
    8000208c:	d30ff0ef          	jal	800015bc <uart_putc>
    80002090:	0374e53b          	remw	a0,s1,s7
    80002094:	0305051b          	addw	a0,a0,48
    80002098:	0ff57513          	zext.b	a0,a0
    8000209c:	d20ff0ef          	jal	800015bc <uart_putc>
    800020a0:	00006517          	auipc	a0,0x6
    800020a4:	f4850513          	add	a0,a0,-184 # 80007fe8 <digits+0x40>
    800020a8:	d2cff0ef          	jal	800015d4 <uart_puts>
    800020ac:	00093b83          	ld	s7,0(s2)
    800020b0:	00ebf793          	and	a5,s7,14
    800020b4:	06079063          	bnez	a5,80002114 <dump_pagetable+0x19c>
    800020b8:	00006517          	auipc	a0,0x6
    800020bc:	f4850513          	add	a0,a0,-184 # 80008000 <digits+0x58>
    800020c0:	d14ff0ef          	jal	800015d4 <uart_puts>
    800020c4:	00093503          	ld	a0,0(s2)
    800020c8:	0019859b          	addw	a1,s3,1
    800020cc:	0014849b          	addw	s1,s1,1
    800020d0:	00a55513          	srl	a0,a0,0xa
    800020d4:	00c51513          	sll	a0,a0,0xc
    800020d8:	ea1ff0ef          	jal	80001f78 <dump_pagetable>
    800020dc:	20000793          	li	a5,512
    800020e0:	00890913          	add	s2,s2,8
    800020e4:	f4f494e3          	bne	s1,a5,8000202c <dump_pagetable+0xb4>
    800020e8:	04813083          	ld	ra,72(sp)
    800020ec:	04013403          	ld	s0,64(sp)
    800020f0:	03813483          	ld	s1,56(sp)
    800020f4:	03013903          	ld	s2,48(sp)
    800020f8:	02813983          	ld	s3,40(sp)
    800020fc:	02013a03          	ld	s4,32(sp)
    80002100:	01813a83          	ld	s5,24(sp)
    80002104:	01013b03          	ld	s6,16(sp)
    80002108:	00813b83          	ld	s7,8(sp)
    8000210c:	05010113          	add	sp,sp,80
    80002110:	00008067          	ret
    80002114:	00006517          	auipc	a0,0x6
    80002118:	edc50513          	add	a0,a0,-292 # 80007ff0 <digits+0x48>
    8000211c:	cb8ff0ef          	jal	800015d4 <uart_puts>
    80002120:	00abdb93          	srl	s7,s7,0xa
    80002124:	016bfbb3          	and	s7,s7,s6
    80002128:	00000713          	li	a4,0
    8000212c:	03c00413          	li	s0,60
    80002130:	008bd7b3          	srl	a5,s7,s0
    80002134:	00f7f793          	and	a5,a5,15
    80002138:	00e7e733          	or	a4,a5,a4
    8000213c:	00071e63          	bnez	a4,80002158 <dump_pagetable+0x1e0>
    80002140:	02040c63          	beqz	s0,80002178 <dump_pagetable+0x200>
    80002144:	ffc4041b          	addw	s0,s0,-4
    80002148:	008bd7b3          	srl	a5,s7,s0
    8000214c:	00f7f793          	and	a5,a5,15
    80002150:	00e7e733          	or	a4,a5,a4
    80002154:	fe0706e3          	beqz	a4,80002140 <dump_pagetable+0x1c8>
    80002158:	ffc4041b          	addw	s0,s0,-4
    8000215c:	03778513          	add	a0,a5,55
    80002160:	0ff7f713          	zext.b	a4,a5
    80002164:	04fa5c63          	bge	s4,a5,800021bc <dump_pagetable+0x244>
    80002168:	c54ff0ef          	jal	800015bc <uart_putc>
    8000216c:	01540a63          	beq	s0,s5,80002180 <dump_pagetable+0x208>
    80002170:	00100713          	li	a4,1
    80002174:	fbdff06f          	j	80002130 <dump_pagetable+0x1b8>
    80002178:	03000513          	li	a0,48
    8000217c:	c40ff0ef          	jal	800015bc <uart_putc>
    80002180:	00006517          	auipc	a0,0x6
    80002184:	e7850513          	add	a0,a0,-392 # 80007ff8 <digits+0x50>
    80002188:	c4cff0ef          	jal	800015d4 <uart_puts>
    8000218c:	00093783          	ld	a5,0(s2)
    80002190:	0027f713          	and	a4,a5,2
    80002194:	08071463          	bnez	a4,8000221c <dump_pagetable+0x2a4>
    80002198:	0047f713          	and	a4,a5,4
    8000219c:	06071863          	bnez	a4,8000220c <dump_pagetable+0x294>
    800021a0:	0087f713          	and	a4,a5,8
    800021a4:	04071c63          	bnez	a4,800021fc <dump_pagetable+0x284>
    800021a8:	0107f793          	and	a5,a5,16
    800021ac:	04079263          	bnez	a5,800021f0 <dump_pagetable+0x278>
    800021b0:	00a00513          	li	a0,10
    800021b4:	c08ff0ef          	jal	800015bc <uart_putc>
    800021b8:	e65ff06f          	j	8000201c <dump_pagetable+0xa4>
    800021bc:	03070513          	add	a0,a4,48
    800021c0:	fa9ff06f          	j	80002168 <dump_pagetable+0x1f0>
    800021c4:	089a5263          	bge	s4,s1,80002248 <dump_pagetable+0x2d0>
    800021c8:	00a00413          	li	s0,10
    800021cc:	0284c53b          	divw	a0,s1,s0
    800021d0:	0305051b          	addw	a0,a0,48
    800021d4:	0ff57513          	zext.b	a0,a0
    800021d8:	be4ff0ef          	jal	800015bc <uart_putc>
    800021dc:	0284e53b          	remw	a0,s1,s0
    800021e0:	0305051b          	addw	a0,a0,48
    800021e4:	0ff57513          	zext.b	a0,a0
    800021e8:	bd4ff0ef          	jal	800015bc <uart_putc>
    800021ec:	eb5ff06f          	j	800020a0 <dump_pagetable+0x128>
    800021f0:	05500513          	li	a0,85
    800021f4:	bc8ff0ef          	jal	800015bc <uart_putc>
    800021f8:	fb9ff06f          	j	800021b0 <dump_pagetable+0x238>
    800021fc:	05800513          	li	a0,88
    80002200:	bbcff0ef          	jal	800015bc <uart_putc>
    80002204:	00093783          	ld	a5,0(s2)
    80002208:	fa1ff06f          	j	800021a8 <dump_pagetable+0x230>
    8000220c:	05700513          	li	a0,87
    80002210:	bacff0ef          	jal	800015bc <uart_putc>
    80002214:	00093783          	ld	a5,0(s2)
    80002218:	f89ff06f          	j	800021a0 <dump_pagetable+0x228>
    8000221c:	05200513          	li	a0,82
    80002220:	b9cff0ef          	jal	800015bc <uart_putc>
    80002224:	00093783          	ld	a5,0(s2)
    80002228:	f71ff06f          	j	80002198 <dump_pagetable+0x220>
    8000222c:	00006517          	auipc	a0,0x6
    80002230:	d9450513          	add	a0,a0,-620 # 80007fc0 <digits+0x18>
    80002234:	ba0ff0ef          	jal	800015d4 <uart_puts>
    80002238:	0309851b          	addw	a0,s3,48
    8000223c:	0ff57513          	zext.b	a0,a0
    80002240:	b7cff0ef          	jal	800015bc <uart_putc>
    80002244:	db5ff06f          	j	80001ff8 <dump_pagetable+0x80>
    80002248:	0304851b          	addw	a0,s1,48
    8000224c:	0ff57513          	zext.b	a0,a0
    80002250:	b6cff0ef          	jal	800015bc <uart_putc>
    80002254:	e4dff06f          	j	800020a0 <dump_pagetable+0x128>

0000000080002258 <init_page_replacement>:
    80002258:	00100713          	li	a4,1
    8000225c:	02a71713          	sll	a4,a4,0x2a
    80002260:	0000f797          	auipc	a5,0xf
    80002264:	da078793          	add	a5,a5,-608 # 80011000 <swap_mgr>
    80002268:	08e7b023          	sd	a4,128(a5)
    8000226c:	0000f717          	auipc	a4,0xf
    80002270:	e0072e23          	sw	zero,-484(a4) # 80011088 <swap_mgr+0x88>
    80002274:	0000f717          	auipc	a4,0xf
    80002278:	e0c70713          	add	a4,a4,-500 # 80011080 <swap_mgr+0x80>
    8000227c:	0007a023          	sw	zero,0(a5)
    80002280:	00478793          	add	a5,a5,4
    80002284:	fee79ce3          	bne	a5,a4,8000227c <init_page_replacement+0x24>
    80002288:	0040f797          	auipc	a5,0x40f
    8000228c:	e007b423          	sd	zero,-504(a5) # 80411090 <lru_mgr>
    80002290:	0040f797          	auipc	a5,0x40f
    80002294:	e007b423          	sd	zero,-504(a5) # 80411098 <lru_mgr+0x8>
    80002298:	00100793          	li	a5,1
    8000229c:	02879793          	sll	a5,a5,0x28
    800022a0:	00412717          	auipc	a4,0x412
    800022a4:	e0f73023          	sd	a5,-512(a4) # 804140a0 <lru_mgr+0x3010>
    800022a8:	fff00713          	li	a4,-1
    800022ac:	0040f797          	auipc	a5,0x40f
    800022b0:	df478793          	add	a5,a5,-524 # 804110a0 <lru_mgr+0x10>
    800022b4:	00412697          	auipc	a3,0x412
    800022b8:	dec68693          	add	a3,a3,-532 # 804140a0 <lru_mgr+0x3010>
    800022bc:	02075713          	srl	a4,a4,0x20
    800022c0:	0007b023          	sd	zero,0(a5)
    800022c4:	0007b423          	sd	zero,8(a5)
    800022c8:	00e7b823          	sd	a4,16(a5)
    800022cc:	0007bc23          	sd	zero,24(a5)
    800022d0:	0207b023          	sd	zero,32(a5)
    800022d4:	0207b423          	sd	zero,40(a5)
    800022d8:	03078793          	add	a5,a5,48
    800022dc:	fed792e3          	bne	a5,a3,800022c0 <init_page_replacement+0x68>
    800022e0:	00008067          	ret

00000000800022e4 <kvminit>:
    800022e4:	fd010113          	add	sp,sp,-48
    800022e8:	02113423          	sd	ra,40(sp)
    800022ec:	02813023          	sd	s0,32(sp)
    800022f0:	00913c23          	sd	s1,24(sp)
    800022f4:	01213823          	sd	s2,16(sp)
    800022f8:	01313423          	sd	s3,8(sp)
    800022fc:	01413023          	sd	s4,0(sp)
    80002300:	f59ff0ef          	jal	80002258 <init_page_replacement>
    80002304:	b7cff0ef          	jal	80001680 <alloc_page>
    80002308:	00001737          	lui	a4,0x1
    8000230c:	00e50733          	add	a4,a0,a4
    80002310:	00050413          	mv	s0,a0
    80002314:	00050793          	mv	a5,a0
    80002318:	1a050663          	beqz	a0,800024c4 <kvminit+0x1e0>
    8000231c:	0007b023          	sd	zero,0(a5)
    80002320:	00878793          	add	a5,a5,8
    80002324:	fef71ce3          	bne	a4,a5,8000231c <kvminit+0x38>
    80002328:	00425917          	auipc	s2,0x425
    8000232c:	81890913          	add	s2,s2,-2024 # 80426b40 <kernel_pagetable>
    80002330:	00005997          	auipc	s3,0x5
    80002334:	c6398993          	add	s3,s3,-925 # 80006f93 <rodata_start+0xf93>
    80002338:	fffff7b7          	lui	a5,0xfffff
    8000233c:	00893023          	sd	s0,0(s2)
    80002340:	ffffe497          	auipc	s1,0xffffe
    80002344:	cc048493          	add	s1,s1,-832 # 80000000 <_entry>
    80002348:	00f9f9b3          	and	s3,s3,a5
    8000234c:	0334f863          	bgeu	s1,s3,8000237c <kvminit+0x98>
    80002350:	00001a37          	lui	s4,0x1
    80002354:	0080006f          	j	8000235c <kvminit+0x78>
    80002358:	0334f063          	bgeu	s1,s3,80002378 <kvminit+0x94>
    8000235c:	00048613          	mv	a2,s1
    80002360:	00048593          	mv	a1,s1
    80002364:	00a00693          	li	a3,10
    80002368:	00040513          	mv	a0,s0
    8000236c:	dbcff0ef          	jal	80001928 <map_page>
    80002370:	014484b3          	add	s1,s1,s4
    80002374:	fe0502e3          	beqz	a0,80002358 <kvminit+0x74>
    80002378:	00093403          	ld	s0,0(s2)
    8000237c:	00008997          	auipc	s3,0x8
    80002380:	d3b98993          	add	s3,s3,-709 # 8000a0b7 <_binary_user_initcode_end+0xa7>
    80002384:	fffff7b7          	lui	a5,0xfffff
    80002388:	00004497          	auipc	s1,0x4
    8000238c:	c7848493          	add	s1,s1,-904 # 80006000 <rodata_start>
    80002390:	00f9f9b3          	and	s3,s3,a5
    80002394:	0334f863          	bgeu	s1,s3,800023c4 <kvminit+0xe0>
    80002398:	00001a37          	lui	s4,0x1
    8000239c:	0080006f          	j	800023a4 <kvminit+0xc0>
    800023a0:	0334f063          	bgeu	s1,s3,800023c0 <kvminit+0xdc>
    800023a4:	00048613          	mv	a2,s1
    800023a8:	00048593          	mv	a1,s1
    800023ac:	00200693          	li	a3,2
    800023b0:	00040513          	mv	a0,s0
    800023b4:	d74ff0ef          	jal	80001928 <map_page>
    800023b8:	014484b3          	add	s1,s1,s4
    800023bc:	fe0502e3          	beqz	a0,800023a0 <kvminit+0xbc>
    800023c0:	00093403          	ld	s0,0(s2)
    800023c4:	00009997          	auipc	s3,0x9
    800023c8:	c4b98993          	add	s3,s3,-949 # 8000b00f <_binary_user_initcode_end+0xfff>
    800023cc:	fffff7b7          	lui	a5,0xfffff
    800023d0:	00008497          	auipc	s1,0x8
    800023d4:	c3048493          	add	s1,s1,-976 # 8000a000 <nextpid>
    800023d8:	00f9f9b3          	and	s3,s3,a5
    800023dc:	0334f863          	bgeu	s1,s3,8000240c <kvminit+0x128>
    800023e0:	00001a37          	lui	s4,0x1
    800023e4:	0080006f          	j	800023ec <kvminit+0x108>
    800023e8:	0334f063          	bgeu	s1,s3,80002408 <kvminit+0x124>
    800023ec:	00048613          	mv	a2,s1
    800023f0:	00048593          	mv	a1,s1
    800023f4:	00600693          	li	a3,6
    800023f8:	00040513          	mv	a0,s0
    800023fc:	d2cff0ef          	jal	80001928 <map_page>
    80002400:	014484b3          	add	s1,s1,s4
    80002404:	fe0502e3          	beqz	a0,800023e8 <kvminit+0x104>
    80002408:	00093403          	ld	s0,0(s2)
    8000240c:	00425997          	auipc	s3,0x425
    80002410:	76398993          	add	s3,s3,1891 # 80427b6f <bss_end+0xfff>
    80002414:	fffff7b7          	lui	a5,0xfffff
    80002418:	0000e497          	auipc	s1,0xe
    8000241c:	be848493          	add	s1,s1,-1048 # 80010000 <bss_start>
    80002420:	00f9f9b3          	and	s3,s3,a5
    80002424:	0334f863          	bgeu	s1,s3,80002454 <kvminit+0x170>
    80002428:	00001a37          	lui	s4,0x1
    8000242c:	0080006f          	j	80002434 <kvminit+0x150>
    80002430:	0334f063          	bgeu	s1,s3,80002450 <kvminit+0x16c>
    80002434:	00048613          	mv	a2,s1
    80002438:	00048593          	mv	a1,s1
    8000243c:	00600693          	li	a3,6
    80002440:	00040513          	mv	a0,s0
    80002444:	ce4ff0ef          	jal	80001928 <map_page>
    80002448:	014484b3          	add	s1,s1,s4
    8000244c:	fe0502e3          	beqz	a0,80002430 <kvminit+0x14c>
    80002450:	00093403          	ld	s0,0(s2)
    80002454:	01100993          	li	s3,17
    80002458:	00424497          	auipc	s1,0x424
    8000245c:	71848493          	add	s1,s1,1816 # 80426b70 <bss_end>
    80002460:	01b99993          	sll	s3,s3,0x1b
    80002464:	0334f863          	bgeu	s1,s3,80002494 <kvminit+0x1b0>
    80002468:	00001a37          	lui	s4,0x1
    8000246c:	0080006f          	j	80002474 <kvminit+0x190>
    80002470:	0334f063          	bgeu	s1,s3,80002490 <kvminit+0x1ac>
    80002474:	00048613          	mv	a2,s1
    80002478:	00048593          	mv	a1,s1
    8000247c:	00600693          	li	a3,6
    80002480:	00040513          	mv	a0,s0
    80002484:	ca4ff0ef          	jal	80001928 <map_page>
    80002488:	014484b3          	add	s1,s1,s4
    8000248c:	fe0502e3          	beqz	a0,80002470 <kvminit+0x18c>
    80002490:	00093403          	ld	s0,0(s2)
    80002494:	00040513          	mv	a0,s0
    80002498:	02013403          	ld	s0,32(sp)
    8000249c:	02813083          	ld	ra,40(sp)
    800024a0:	01813483          	ld	s1,24(sp)
    800024a4:	01013903          	ld	s2,16(sp)
    800024a8:	00813983          	ld	s3,8(sp)
    800024ac:	00013a03          	ld	s4,0(sp)
    800024b0:	00600693          	li	a3,6
    800024b4:	10000637          	lui	a2,0x10000
    800024b8:	100005b7          	lui	a1,0x10000
    800024bc:	03010113          	add	sp,sp,48
    800024c0:	c68ff06f          	j	80001928 <map_page>
    800024c4:	02813083          	ld	ra,40(sp)
    800024c8:	02013403          	ld	s0,32(sp)
    800024cc:	00424797          	auipc	a5,0x424
    800024d0:	6607ba23          	sd	zero,1652(a5) # 80426b40 <kernel_pagetable>
    800024d4:	01813483          	ld	s1,24(sp)
    800024d8:	01013903          	ld	s2,16(sp)
    800024dc:	00813983          	ld	s3,8(sp)
    800024e0:	00013a03          	ld	s4,0(sp)
    800024e4:	03010113          	add	sp,sp,48
    800024e8:	00008067          	ret

00000000800024ec <alloc_swap_slot>:
    800024ec:	0000f617          	auipc	a2,0xf
    800024f0:	b1460613          	add	a2,a2,-1260 # 80011000 <swap_mgr>
    800024f4:	08862803          	lw	a6,136(a2)
    800024f8:	08462883          	lw	a7,132(a2)
    800024fc:	fff00513          	li	a0,-1
    80002500:	0d187663          	bgeu	a6,a7,800025cc <alloc_swap_slot+0xe0>
    80002504:	08062303          	lw	t1,128(a2)
    80002508:	07137863          	bgeu	t1,a7,80002578 <alloc_swap_slot+0x8c>
    8000250c:	0053579b          	srlw	a5,t1,0x5
    80002510:	00279793          	sll	a5,a5,0x2
    80002514:	00f607b3          	add	a5,a2,a5
    80002518:	0007a683          	lw	a3,0(a5)
    8000251c:	00100593          	li	a1,1
    80002520:	006595bb          	sllw	a1,a1,t1
    80002524:	00b6f7b3          	and	a5,a3,a1
    80002528:	0007879b          	sext.w	a5,a5
    8000252c:	0053571b          	srlw	a4,t1,0x5
    80002530:	00030513          	mv	a0,t1
    80002534:	08078e63          	beqz	a5,800025d0 <alloc_swap_slot+0xe4>
    80002538:	00100e13          	li	t3,1
    8000253c:	01c0006f          	j	80002558 <alloc_swap_slot+0x6c>
    80002540:	0006a683          	lw	a3,0(a3)
    80002544:	0007859b          	sext.w	a1,a5
    80002548:	0057571b          	srlw	a4,a4,0x5
    8000254c:	00f6f7b3          	and	a5,a3,a5
    80002550:	0007879b          	sext.w	a5,a5
    80002554:	06078e63          	beqz	a5,800025d0 <alloc_swap_slot+0xe4>
    80002558:	0015071b          	addw	a4,a0,1
    8000255c:	0057579b          	srlw	a5,a4,0x5
    80002560:	00279793          	sll	a5,a5,0x2
    80002564:	0007051b          	sext.w	a0,a4
    80002568:	00f606b3          	add	a3,a2,a5
    8000256c:	00ee17bb          	sllw	a5,t3,a4
    80002570:	fca898e3          	bne	a7,a0,80002540 <alloc_swap_slot+0x54>
    80002574:	04030a63          	beqz	t1,800025c8 <alloc_swap_slot+0xdc>
    80002578:	00062683          	lw	a3,0(a2)
    8000257c:	0016f513          	and	a0,a3,1
    80002580:	0a050063          	beqz	a0,80002620 <alloc_swap_slot+0x134>
    80002584:	00000513          	li	a0,0
    80002588:	00100e13          	li	t3,1
    8000258c:	01c0006f          	j	800025a8 <alloc_swap_slot+0xbc>
    80002590:	0006a683          	lw	a3,0(a3)
    80002594:	00078e9b          	sext.w	t4,a5
    80002598:	0057571b          	srlw	a4,a4,0x5
    8000259c:	00f6f7b3          	and	a5,a3,a5
    800025a0:	0007879b          	sext.w	a5,a5
    800025a4:	04078a63          	beqz	a5,800025f8 <alloc_swap_slot+0x10c>
    800025a8:	0015071b          	addw	a4,a0,1
    800025ac:	0057579b          	srlw	a5,a4,0x5
    800025b0:	00279793          	sll	a5,a5,0x2
    800025b4:	0005059b          	sext.w	a1,a0
    800025b8:	0007051b          	sext.w	a0,a4
    800025bc:	00f606b3          	add	a3,a2,a5
    800025c0:	00ee17bb          	sllw	a5,t3,a4
    800025c4:	fca316e3          	bne	t1,a0,80002590 <alloc_swap_slot+0xa4>
    800025c8:	fff00513          	li	a0,-1
    800025cc:	00008067          	ret
    800025d0:	0015079b          	addw	a5,a0,1
    800025d4:	0317f7bb          	remuw	a5,a5,a7
    800025d8:	00271713          	sll	a4,a4,0x2
    800025dc:	00e60733          	add	a4,a2,a4
    800025e0:	00b6e6b3          	or	a3,a3,a1
    800025e4:	0018081b          	addw	a6,a6,1
    800025e8:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    800025ec:	09062423          	sw	a6,136(a2)
    800025f0:	08f62023          	sw	a5,128(a2)
    800025f4:	00008067          	ret
    800025f8:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    800025fc:	0315f5bb          	remuw	a1,a1,a7
    80002600:	00271713          	sll	a4,a4,0x2
    80002604:	00e60733          	add	a4,a2,a4
    80002608:	01d6e6b3          	or	a3,a3,t4
    8000260c:	0018081b          	addw	a6,a6,1
    80002610:	00d72023          	sw	a3,0(a4)
    80002614:	09062423          	sw	a6,136(a2)
    80002618:	08b62023          	sw	a1,128(a2)
    8000261c:	00008067          	ret
    80002620:	00000713          	li	a4,0
    80002624:	00100593          	li	a1,1
    80002628:	00100e93          	li	t4,1
    8000262c:	fd1ff06f          	j	800025fc <alloc_swap_slot+0x110>

0000000080002630 <free_swap_slot>:
    80002630:	0000f717          	auipc	a4,0xf
    80002634:	9d070713          	add	a4,a4,-1584 # 80011000 <swap_mgr>
    80002638:	08472783          	lw	a5,132(a4)
    8000263c:	04f57663          	bgeu	a0,a5,80002688 <free_swap_slot+0x58>
    80002640:	0055579b          	srlw	a5,a0,0x5
    80002644:	00279793          	sll	a5,a5,0x2
    80002648:	00f707b3          	add	a5,a4,a5
    8000264c:	0007a583          	lw	a1,0(a5)
    80002650:	00100693          	li	a3,1
    80002654:	00a696bb          	sllw	a3,a3,a0
    80002658:	00d5f633          	and	a2,a1,a3
    8000265c:	0006061b          	sext.w	a2,a2
    80002660:	02060463          	beqz	a2,80002688 <free_swap_slot+0x58>
    80002664:	08872603          	lw	a2,136(a4)
    80002668:	fff6c693          	not	a3,a3
    8000266c:	08072803          	lw	a6,128(a4)
    80002670:	00d5f5b3          	and	a1,a1,a3
    80002674:	fff6069b          	addw	a3,a2,-1
    80002678:	00b7a023          	sw	a1,0(a5)
    8000267c:	08d72423          	sw	a3,136(a4)
    80002680:	01057463          	bgeu	a0,a6,80002688 <free_swap_slot+0x58>
    80002684:	08a72023          	sw	a0,128(a4)
    80002688:	00008067          	ret

000000008000268c <find_page_desc>:
    8000268c:	fffff7b7          	lui	a5,0xfffff
    80002690:	00f57533          	and	a0,a0,a5
    80002694:	00000713          	li	a4,0
    80002698:	0040f797          	auipc	a5,0x40f
    8000269c:	a0878793          	add	a5,a5,-1528 # 804110a0 <lru_mgr+0x10>
    800026a0:	10000613          	li	a2,256
    800026a4:	0100006f          	j	800026b4 <find_page_desc+0x28>
    800026a8:	0017071b          	addw	a4,a4,1
    800026ac:	03078793          	add	a5,a5,48
    800026b0:	02c70a63          	beq	a4,a2,800026e4 <find_page_desc+0x58>
    800026b4:	0007b683          	ld	a3,0(a5)
    800026b8:	fea698e3          	bne	a3,a0,800026a8 <find_page_desc+0x1c>
    800026bc:	0147a683          	lw	a3,20(a5)
    800026c0:	0016f693          	and	a3,a3,1
    800026c4:	fe0682e3          	beqz	a3,800026a8 <find_page_desc+0x1c>
    800026c8:	00171513          	sll	a0,a4,0x1
    800026cc:	00e50533          	add	a0,a0,a4
    800026d0:	0040f797          	auipc	a5,0x40f
    800026d4:	9d078793          	add	a5,a5,-1584 # 804110a0 <lru_mgr+0x10>
    800026d8:	00451513          	sll	a0,a0,0x4
    800026dc:	00f50533          	add	a0,a0,a5
    800026e0:	00008067          	ret
    800026e4:	00000513          	li	a0,0
    800026e8:	00008067          	ret

00000000800026ec <lru_add_page>:
    800026ec:	02050c63          	beqz	a0,80002724 <lru_add_page+0x38>
    800026f0:	0040f717          	auipc	a4,0x40f
    800026f4:	9a070713          	add	a4,a4,-1632 # 80411090 <lru_mgr>
    800026f8:	00073783          	ld	a5,0(a4)
    800026fc:	00053c23          	sd	zero,24(a0)
    80002700:	02f53023          	sd	a5,32(a0)
    80002704:	02078263          	beqz	a5,80002728 <lru_add_page+0x3c>
    80002708:	00a7bc23          	sd	a0,24(a5)
    8000270c:	00412697          	auipc	a3,0x412
    80002710:	98468693          	add	a3,a3,-1660 # 80414090 <lru_mgr+0x3000>
    80002714:	0106a783          	lw	a5,16(a3)
    80002718:	00a73023          	sd	a0,0(a4)
    8000271c:	0017879b          	addw	a5,a5,1
    80002720:	00f6a823          	sw	a5,16(a3)
    80002724:	00008067          	ret
    80002728:	00a73423          	sd	a0,8(a4)
    8000272c:	fe1ff06f          	j	8000270c <lru_add_page+0x20>

0000000080002730 <lru_remove_page>:
    80002730:	02050c63          	beqz	a0,80002768 <lru_remove_page+0x38>
    80002734:	01853783          	ld	a5,24(a0)
    80002738:	02053703          	ld	a4,32(a0)
    8000273c:	02078863          	beqz	a5,8000276c <lru_remove_page+0x3c>
    80002740:	02e7b023          	sd	a4,32(a5)
    80002744:	02070a63          	beqz	a4,80002778 <lru_remove_page+0x48>
    80002748:	00f73c23          	sd	a5,24(a4)
    8000274c:	00412717          	auipc	a4,0x412
    80002750:	94470713          	add	a4,a4,-1724 # 80414090 <lru_mgr+0x3000>
    80002754:	01072783          	lw	a5,16(a4)
    80002758:	02053023          	sd	zero,32(a0)
    8000275c:	00053c23          	sd	zero,24(a0)
    80002760:	fff7879b          	addw	a5,a5,-1
    80002764:	00f72823          	sw	a5,16(a4)
    80002768:	00008067          	ret
    8000276c:	0040f697          	auipc	a3,0x40f
    80002770:	92e6b223          	sd	a4,-1756(a3) # 80411090 <lru_mgr>
    80002774:	fc071ae3          	bnez	a4,80002748 <lru_remove_page+0x18>
    80002778:	0040f717          	auipc	a4,0x40f
    8000277c:	92f73023          	sd	a5,-1760(a4) # 80411098 <lru_mgr+0x8>
    80002780:	fcdff06f          	j	8000274c <lru_remove_page+0x1c>

0000000080002784 <lru_touch_page>:
    80002784:	fffff7b7          	lui	a5,0xfffff
    80002788:	00f57533          	and	a0,a0,a5
    8000278c:	00000713          	li	a4,0
    80002790:	0040f797          	auipc	a5,0x40f
    80002794:	91078793          	add	a5,a5,-1776 # 804110a0 <lru_mgr+0x10>
    80002798:	10000613          	li	a2,256
    8000279c:	0100006f          	j	800027ac <lru_touch_page+0x28>
    800027a0:	0017071b          	addw	a4,a4,1
    800027a4:	03078793          	add	a5,a5,48
    800027a8:	0ac70663          	beq	a4,a2,80002854 <lru_touch_page+0xd0>
    800027ac:	0007b683          	ld	a3,0(a5)
    800027b0:	fea698e3          	bne	a3,a0,800027a0 <lru_touch_page+0x1c>
    800027b4:	0147a683          	lw	a3,20(a5)
    800027b8:	0016f693          	and	a3,a3,1
    800027bc:	fe0682e3          	beqz	a3,800027a0 <lru_touch_page+0x1c>
    800027c0:	00171613          	sll	a2,a4,0x1
    800027c4:	00e607b3          	add	a5,a2,a4
    800027c8:	0040f597          	auipc	a1,0x40f
    800027cc:	8c858593          	add	a1,a1,-1848 # 80411090 <lru_mgr>
    800027d0:	00479793          	sll	a5,a5,0x4
    800027d4:	00170513          	add	a0,a4,1
    800027d8:	00f58833          	add	a6,a1,a5
    800027dc:	00151693          	sll	a3,a0,0x1
    800027e0:	00a686b3          	add	a3,a3,a0
    800027e4:	02883803          	ld	a6,40(a6)
    800027e8:	00469693          	sll	a3,a3,0x4
    800027ec:	01078793          	add	a5,a5,16
    800027f0:	00d586b3          	add	a3,a1,a3
    800027f4:	0006b683          	ld	a3,0(a3)
    800027f8:	00f587b3          	add	a5,a1,a5
    800027fc:	04080e63          	beqz	a6,80002858 <lru_touch_page+0xd4>
    80002800:	02d83023          	sd	a3,32(a6)
    80002804:	0005b883          	ld	a7,0(a1)
    80002808:	04068c63          	beqz	a3,80002860 <lru_touch_page+0xdc>
    8000280c:	0106bc23          	sd	a6,24(a3)
    80002810:	00151693          	sll	a3,a0,0x1
    80002814:	00e60733          	add	a4,a2,a4
    80002818:	00a686b3          	add	a3,a3,a0
    8000281c:	00469693          	sll	a3,a3,0x4
    80002820:	00471713          	sll	a4,a4,0x4
    80002824:	00e58733          	add	a4,a1,a4
    80002828:	00d586b3          	add	a3,a1,a3
    8000282c:	00412617          	auipc	a2,0x412
    80002830:	86460613          	add	a2,a2,-1948 # 80414090 <lru_mgr+0x3000>
    80002834:	02073423          	sd	zero,40(a4)
    80002838:	0116b023          	sd	a7,0(a3)
    8000283c:	01062703          	lw	a4,16(a2)
    80002840:	02088463          	beqz	a7,80002868 <lru_touch_page+0xe4>
    80002844:	00f8bc23          	sd	a5,24(a7)
    80002848:	00f5b023          	sd	a5,0(a1)
    8000284c:	00e62823          	sw	a4,16(a2)
    80002850:	00008067          	ret
    80002854:	00008067          	ret
    80002858:	00068893          	mv	a7,a3
    8000285c:	fa0698e3          	bnez	a3,8000280c <lru_touch_page+0x88>
    80002860:	0105b423          	sd	a6,8(a1)
    80002864:	fadff06f          	j	80002810 <lru_touch_page+0x8c>
    80002868:	00f5b423          	sd	a5,8(a1)
    8000286c:	00f5b023          	sd	a5,0(a1)
    80002870:	00e62823          	sw	a4,16(a2)
    80002874:	00008067          	ret

0000000080002878 <find_victim_page>:
    80002878:	0040f517          	auipc	a0,0x40f
    8000287c:	82053503          	ld	a0,-2016(a0) # 80411098 <lru_mgr+0x8>
    80002880:	00008067          	ret

0000000080002884 <swap_out_page>:
    80002884:	16050263          	beqz	a0,800029e8 <swap_out_page+0x164>
    80002888:	fd010113          	add	sp,sp,-48
    8000288c:	00913c23          	sd	s1,24(sp)
    80002890:	01452483          	lw	s1,20(a0)
    80002894:	02813023          	sd	s0,32(sp)
    80002898:	01313423          	sd	s3,8(sp)
    8000289c:	02113423          	sd	ra,40(sp)
    800028a0:	01213823          	sd	s2,16(sp)
    800028a4:	0014f793          	and	a5,s1,1
    800028a8:	00050413          	mv	s0,a0
    800028ac:	00048993          	mv	s3,s1
    800028b0:	12078863          	beqz	a5,800029e0 <swap_out_page+0x15c>
    800028b4:	c39ff0ef          	jal	800024ec <alloc_swap_slot>
    800028b8:	0005091b          	sext.w	s2,a0
    800028bc:	fff00793          	li	a5,-1
    800028c0:	12f90063          	beq	s2,a5,800029e0 <swap_out_page+0x15c>
    800028c4:	0049f993          	and	s3,s3,4
    800028c8:	04098663          	beqz	s3,80002914 <swap_out_page+0x90>
    800028cc:	00843683          	ld	a3,8(s0)
    800028d0:	00c9171b          	sllw	a4,s2,0xc
    800028d4:	0000e797          	auipc	a5,0xe
    800028d8:	7bc78793          	add	a5,a5,1980 # 80011090 <swap_area>
    800028dc:	02071713          	sll	a4,a4,0x20
    800028e0:	02075713          	srl	a4,a4,0x20
    800028e4:	40f686b3          	sub	a3,a3,a5
    800028e8:	0000f617          	auipc	a2,0xf
    800028ec:	7a860613          	add	a2,a2,1960 # 80012090 <swap_area+0x1000>
    800028f0:	00f707b3          	add	a5,a4,a5
    800028f4:	00e60633          	add	a2,a2,a4
    800028f8:	40e686b3          	sub	a3,a3,a4
    800028fc:	00f68733          	add	a4,a3,a5
    80002900:	00074703          	lbu	a4,0(a4)
    80002904:	00178793          	add	a5,a5,1
    80002908:	fee78fa3          	sb	a4,-1(a5)
    8000290c:	fec798e3          	bne	a5,a2,800028fc <swap_out_page+0x78>
    80002910:	01442483          	lw	s1,20(s0)
    80002914:	00043583          	ld	a1,0(s0)
    80002918:	02843503          	ld	a0,40(s0)
    8000291c:	e69fe0ef          	jal	80001784 <walk_lookup>
    80002920:	00050863          	beqz	a0,80002930 <swap_out_page+0xac>
    80002924:	00053783          	ld	a5,0(a0)
    80002928:	0017f713          	and	a4,a5,1
    8000292c:	08071063          	bnez	a4,800029ac <swap_out_page+0x128>
    80002930:	ffe4f793          	and	a5,s1,-2
    80002934:	0027e793          	or	a5,a5,2
    80002938:	02091913          	sll	s2,s2,0x20
    8000293c:	02079793          	sll	a5,a5,0x20
    80002940:	00843503          	ld	a0,8(s0)
    80002944:	02095913          	srl	s2,s2,0x20
    80002948:	00f96933          	or	s2,s2,a5
    8000294c:	01243823          	sd	s2,16(s0)
    80002950:	d4dfe0ef          	jal	8000169c <free_page>
    80002954:	01843783          	ld	a5,24(s0)
    80002958:	00043423          	sd	zero,8(s0)
    8000295c:	02043703          	ld	a4,32(s0)
    80002960:	06078463          	beqz	a5,800029c8 <swap_out_page+0x144>
    80002964:	02e7b023          	sd	a4,32(a5)
    80002968:	06070663          	beqz	a4,800029d4 <swap_out_page+0x150>
    8000296c:	00f73c23          	sd	a5,24(a4)
    80002970:	00411717          	auipc	a4,0x411
    80002974:	72070713          	add	a4,a4,1824 # 80414090 <lru_mgr+0x3000>
    80002978:	01072783          	lw	a5,16(a4)
    8000297c:	02043023          	sd	zero,32(s0)
    80002980:	00043c23          	sd	zero,24(s0)
    80002984:	fff7879b          	addw	a5,a5,-1
    80002988:	00f72823          	sw	a5,16(a4)
    8000298c:	00000513          	li	a0,0
    80002990:	02813083          	ld	ra,40(sp)
    80002994:	02013403          	ld	s0,32(sp)
    80002998:	01813483          	ld	s1,24(sp)
    8000299c:	01013903          	ld	s2,16(sp)
    800029a0:	00813983          	ld	s3,8(sp)
    800029a4:	03010113          	add	sp,sp,48
    800029a8:	00008067          	ret
    800029ac:	00a9171b          	sllw	a4,s2,0xa
    800029b0:	02071713          	sll	a4,a4,0x20
    800029b4:	ffe7f793          	and	a5,a5,-2
    800029b8:	02075713          	srl	a4,a4,0x20
    800029bc:	00e7e7b3          	or	a5,a5,a4
    800029c0:	00f53023          	sd	a5,0(a0)
    800029c4:	f6dff06f          	j	80002930 <swap_out_page+0xac>
    800029c8:	0040e697          	auipc	a3,0x40e
    800029cc:	6ce6b423          	sd	a4,1736(a3) # 80411090 <lru_mgr>
    800029d0:	f8071ee3          	bnez	a4,8000296c <swap_out_page+0xe8>
    800029d4:	0040e717          	auipc	a4,0x40e
    800029d8:	6cf73223          	sd	a5,1732(a4) # 80411098 <lru_mgr+0x8>
    800029dc:	f95ff06f          	j	80002970 <swap_out_page+0xec>
    800029e0:	fff00513          	li	a0,-1
    800029e4:	fadff06f          	j	80002990 <swap_out_page+0x10c>
    800029e8:	fff00513          	li	a0,-1
    800029ec:	00008067          	ret

00000000800029f0 <swap_in_page>:
    800029f0:	12050263          	beqz	a0,80002b14 <swap_in_page+0x124>
    800029f4:	01452783          	lw	a5,20(a0)
    800029f8:	fe010113          	add	sp,sp,-32
    800029fc:	00813823          	sd	s0,16(sp)
    80002a00:	00113c23          	sd	ra,24(sp)
    80002a04:	00913423          	sd	s1,8(sp)
    80002a08:	0027f793          	and	a5,a5,2
    80002a0c:	00050413          	mv	s0,a0
    80002a10:	0e078e63          	beqz	a5,80002b0c <swap_in_page+0x11c>
    80002a14:	01052703          	lw	a4,16(a0)
    80002a18:	0000e797          	auipc	a5,0xe
    80002a1c:	67878793          	add	a5,a5,1656 # 80011090 <swap_area>
    80002a20:	40f58633          	sub	a2,a1,a5
    80002a24:	00c7171b          	sllw	a4,a4,0xc
    80002a28:	02071713          	sll	a4,a4,0x20
    80002a2c:	02075713          	srl	a4,a4,0x20
    80002a30:	0000f817          	auipc	a6,0xf
    80002a34:	66080813          	add	a6,a6,1632 # 80012090 <swap_area+0x1000>
    80002a38:	00058493          	mv	s1,a1
    80002a3c:	00f707b3          	add	a5,a4,a5
    80002a40:	00e80833          	add	a6,a6,a4
    80002a44:	40e60633          	sub	a2,a2,a4
    80002a48:	0007c683          	lbu	a3,0(a5)
    80002a4c:	00f60733          	add	a4,a2,a5
    80002a50:	00178793          	add	a5,a5,1
    80002a54:	00d70023          	sb	a3,0(a4)
    80002a58:	ff0798e3          	bne	a5,a6,80002a48 <swap_in_page+0x58>
    80002a5c:	00043583          	ld	a1,0(s0)
    80002a60:	02843503          	ld	a0,40(s0)
    80002a64:	d21fe0ef          	jal	80001784 <walk_lookup>
    80002a68:	02050063          	beqz	a0,80002a88 <swap_in_page+0x98>
    80002a6c:	00053703          	ld	a4,0(a0)
    80002a70:	00c4d793          	srl	a5,s1,0xc
    80002a74:	00a79793          	sll	a5,a5,0xa
    80002a78:	01e77713          	and	a4,a4,30
    80002a7c:	00e7e7b3          	or	a5,a5,a4
    80002a80:	0017e793          	or	a5,a5,1
    80002a84:	00f53023          	sd	a5,0(a0)
    80002a88:	01442783          	lw	a5,20(s0)
    80002a8c:	01042503          	lw	a0,16(s0)
    80002a90:	00943423          	sd	s1,8(s0)
    80002a94:	ffd7f793          	and	a5,a5,-3
    80002a98:	0017e793          	or	a5,a5,1
    80002a9c:	00f42a23          	sw	a5,20(s0)
    80002aa0:	0000e797          	auipc	a5,0xe
    80002aa4:	5e47a783          	lw	a5,1508(a5) # 80011084 <swap_mgr+0x84>
    80002aa8:	00f57463          	bgeu	a0,a5,80002ab0 <swap_in_page+0xc0>
    80002aac:	d4dfe0ef          	jal	800017f8 <free_swap_slot.part.0>
    80002ab0:	0040e717          	auipc	a4,0x40e
    80002ab4:	5e070713          	add	a4,a4,1504 # 80411090 <lru_mgr>
    80002ab8:	00073783          	ld	a5,0(a4)
    80002abc:	fff00693          	li	a3,-1
    80002ac0:	00d42823          	sw	a3,16(s0)
    80002ac4:	02f43023          	sd	a5,32(s0)
    80002ac8:	00043c23          	sd	zero,24(s0)
    80002acc:	02078c63          	beqz	a5,80002b04 <swap_in_page+0x114>
    80002ad0:	0087bc23          	sd	s0,24(a5)
    80002ad4:	00411697          	auipc	a3,0x411
    80002ad8:	5bc68693          	add	a3,a3,1468 # 80414090 <lru_mgr+0x3000>
    80002adc:	0106a783          	lw	a5,16(a3)
    80002ae0:	00873023          	sd	s0,0(a4)
    80002ae4:	00000513          	li	a0,0
    80002ae8:	0017879b          	addw	a5,a5,1
    80002aec:	00f6a823          	sw	a5,16(a3)
    80002af0:	01813083          	ld	ra,24(sp)
    80002af4:	01013403          	ld	s0,16(sp)
    80002af8:	00813483          	ld	s1,8(sp)
    80002afc:	02010113          	add	sp,sp,32
    80002b00:	00008067          	ret
    80002b04:	00873423          	sd	s0,8(a4)
    80002b08:	fcdff06f          	j	80002ad4 <swap_in_page+0xe4>
    80002b0c:	fff00513          	li	a0,-1
    80002b10:	fe1ff06f          	j	80002af0 <swap_in_page+0x100>
    80002b14:	fff00513          	li	a0,-1
    80002b18:	00008067          	ret

0000000080002b1c <handle_page_fault>:
    80002b1c:	fd010113          	add	sp,sp,-48
    80002b20:	fffff7b7          	lui	a5,0xfffff
    80002b24:	02813023          	sd	s0,32(sp)
    80002b28:	00f5f433          	and	s0,a1,a5
    80002b2c:	00040593          	mv	a1,s0
    80002b30:	01213823          	sd	s2,16(sp)
    80002b34:	02113423          	sd	ra,40(sp)
    80002b38:	00913c23          	sd	s1,24(sp)
    80002b3c:	01313423          	sd	s3,8(sp)
    80002b40:	00050913          	mv	s2,a0
    80002b44:	c41fe0ef          	jal	80001784 <walk_lookup>
    80002b48:	12050c63          	beqz	a0,80002c80 <handle_page_fault+0x164>
    80002b4c:	00053483          	ld	s1,0(a0)
    80002b50:	0014f793          	and	a5,s1,1
    80002b54:	12079663          	bnez	a5,80002c80 <handle_page_fault+0x164>
    80002b58:	12048463          	beqz	s1,80002c80 <handle_page_fault+0x164>
    80002b5c:	00a4d493          	srl	s1,s1,0xa
    80002b60:	b21fe0ef          	jal	80001680 <alloc_page>
    80002b64:	0004849b          	sext.w	s1,s1
    80002b68:	00050993          	mv	s3,a0
    80002b6c:	0e050a63          	beqz	a0,80002c60 <handle_page_fault+0x144>
    80002b70:	0040e797          	auipc	a5,0x40e
    80002b74:	53078793          	add	a5,a5,1328 # 804110a0 <lru_mgr+0x10>
    80002b78:	00000713          	li	a4,0
    80002b7c:	10000613          	li	a2,256
    80002b80:	0100006f          	j	80002b90 <handle_page_fault+0x74>
    80002b84:	0017071b          	addw	a4,a4,1
    80002b88:	03078793          	add	a5,a5,48
    80002b8c:	06c70063          	beq	a4,a2,80002bec <handle_page_fault+0xd0>
    80002b90:	0007b683          	ld	a3,0(a5)
    80002b94:	fe8698e3          	bne	a3,s0,80002b84 <handle_page_fault+0x68>
    80002b98:	0147a683          	lw	a3,20(a5)
    80002b9c:	0026f693          	and	a3,a3,2
    80002ba0:	fe0682e3          	beqz	a3,80002b84 <handle_page_fault+0x68>
    80002ba4:	0107a683          	lw	a3,16(a5)
    80002ba8:	fc969ee3          	bne	a3,s1,80002b84 <handle_page_fault+0x68>
    80002bac:	00171513          	sll	a0,a4,0x1
    80002bb0:	00e50533          	add	a0,a0,a4
    80002bb4:	00451513          	sll	a0,a0,0x4
    80002bb8:	0040e797          	auipc	a5,0x40e
    80002bbc:	4e878793          	add	a5,a5,1256 # 804110a0 <lru_mgr+0x10>
    80002bc0:	00f50533          	add	a0,a0,a5
    80002bc4:	00098593          	mv	a1,s3
    80002bc8:	e29ff0ef          	jal	800029f0 <swap_in_page>
    80002bcc:	0a051e63          	bnez	a0,80002c88 <handle_page_fault+0x16c>
    80002bd0:	02813083          	ld	ra,40(sp)
    80002bd4:	02013403          	ld	s0,32(sp)
    80002bd8:	01813483          	ld	s1,24(sp)
    80002bdc:	01013903          	ld	s2,16(sp)
    80002be0:	00813983          	ld	s3,8(sp)
    80002be4:	03010113          	add	sp,sp,48
    80002be8:	00008067          	ret
    80002bec:	0040e717          	auipc	a4,0x40e
    80002bf0:	4c870713          	add	a4,a4,1224 # 804110b4 <lru_mgr+0x24>
    80002bf4:	00000793          	li	a5,0
    80002bf8:	10000613          	li	a2,256
    80002bfc:	00c0006f          	j	80002c08 <handle_page_fault+0xec>
    80002c00:	0017879b          	addw	a5,a5,1
    80002c04:	08c78263          	beq	a5,a2,80002c88 <handle_page_fault+0x16c>
    80002c08:	00072683          	lw	a3,0(a4)
    80002c0c:	03070713          	add	a4,a4,48
    80002c10:	fe0698e3          	bnez	a3,80002c00 <handle_page_fault+0xe4>
    80002c14:	00178613          	add	a2,a5,1
    80002c18:	00179713          	sll	a4,a5,0x1
    80002c1c:	00161693          	sll	a3,a2,0x1
    80002c20:	00f707b3          	add	a5,a4,a5
    80002c24:	00479793          	sll	a5,a5,0x4
    80002c28:	00c68733          	add	a4,a3,a2
    80002c2c:	0040e617          	auipc	a2,0x40e
    80002c30:	46460613          	add	a2,a2,1124 # 80411090 <lru_mgr>
    80002c34:	00f606b3          	add	a3,a2,a5
    80002c38:	00471713          	sll	a4,a4,0x4
    80002c3c:	01078793          	add	a5,a5,16
    80002c40:	00e60733          	add	a4,a2,a4
    80002c44:	00c78533          	add	a0,a5,a2
    80002c48:	00200793          	li	a5,2
    80002c4c:	0086b823          	sd	s0,16(a3)
    80002c50:	01273423          	sd	s2,8(a4)
    80002c54:	0296a023          	sw	s1,32(a3)
    80002c58:	02f6a223          	sw	a5,36(a3)
    80002c5c:	f69ff06f          	j	80002bc4 <handle_page_fault+0xa8>
    80002c60:	0040e517          	auipc	a0,0x40e
    80002c64:	43853503          	ld	a0,1080(a0) # 80411098 <lru_mgr+0x8>
    80002c68:	00050c63          	beqz	a0,80002c80 <handle_page_fault+0x164>
    80002c6c:	c19ff0ef          	jal	80002884 <swap_out_page>
    80002c70:	00051863          	bnez	a0,80002c80 <handle_page_fault+0x164>
    80002c74:	a0dfe0ef          	jal	80001680 <alloc_page>
    80002c78:	00050993          	mv	s3,a0
    80002c7c:	ee051ae3          	bnez	a0,80002b70 <handle_page_fault+0x54>
    80002c80:	fff00513          	li	a0,-1
    80002c84:	f4dff06f          	j	80002bd0 <handle_page_fault+0xb4>
    80002c88:	00098513          	mv	a0,s3
    80002c8c:	a11fe0ef          	jal	8000169c <free_page>
    80002c90:	fff00513          	li	a0,-1
    80002c94:	f3dff06f          	j	80002bd0 <handle_page_fault+0xb4>

0000000080002c98 <va2pa_with_replacement>:
    80002c98:	fe010113          	add	sp,sp,-32
    80002c9c:	00913423          	sd	s1,8(sp)
    80002ca0:	01213023          	sd	s2,0(sp)
    80002ca4:	00113c23          	sd	ra,24(sp)
    80002ca8:	00813823          	sd	s0,16(sp)
    80002cac:	00050493          	mv	s1,a0
    80002cb0:	00058913          	mv	s2,a1
    80002cb4:	ad1fe0ef          	jal	80001784 <walk_lookup>
    80002cb8:	00050a63          	beqz	a0,80002ccc <va2pa_with_replacement+0x34>
    80002cbc:	00053403          	ld	s0,0(a0)
    80002cc0:	00147793          	and	a5,s0,1
    80002cc4:	06079663          	bnez	a5,80002d30 <va2pa_with_replacement+0x98>
    80002cc8:	02041063          	bnez	s0,80002ce8 <va2pa_with_replacement+0x50>
    80002ccc:	00000513          	li	a0,0
    80002cd0:	01813083          	ld	ra,24(sp)
    80002cd4:	01013403          	ld	s0,16(sp)
    80002cd8:	00813483          	ld	s1,8(sp)
    80002cdc:	00013903          	ld	s2,0(sp)
    80002ce0:	02010113          	add	sp,sp,32
    80002ce4:	00008067          	ret
    80002ce8:	00600613          	li	a2,6
    80002cec:	00090593          	mv	a1,s2
    80002cf0:	00048513          	mv	a0,s1
    80002cf4:	e29ff0ef          	jal	80002b1c <handle_page_fault>
    80002cf8:	fc051ae3          	bnez	a0,80002ccc <va2pa_with_replacement+0x34>
    80002cfc:	00090593          	mv	a1,s2
    80002d00:	00048513          	mv	a0,s1
    80002d04:	a81fe0ef          	jal	80001784 <walk_lookup>
    80002d08:	fc0502e3          	beqz	a0,80002ccc <va2pa_with_replacement+0x34>
    80002d0c:	00053783          	ld	a5,0(a0)
    80002d10:	0017f713          	and	a4,a5,1
    80002d14:	fa070ce3          	beqz	a4,80002ccc <va2pa_with_replacement+0x34>
    80002d18:	00a7d793          	srl	a5,a5,0xa
    80002d1c:	03491593          	sll	a1,s2,0x34
    80002d20:	00c79513          	sll	a0,a5,0xc
    80002d24:	0345d593          	srl	a1,a1,0x34
    80002d28:	00b50533          	add	a0,a0,a1
    80002d2c:	fa5ff06f          	j	80002cd0 <va2pa_with_replacement+0x38>
    80002d30:	00090513          	mv	a0,s2
    80002d34:	a51ff0ef          	jal	80002784 <lru_touch_page>
    80002d38:	01813083          	ld	ra,24(sp)
    80002d3c:	00a45513          	srl	a0,s0,0xa
    80002d40:	01013403          	ld	s0,16(sp)
    80002d44:	03491593          	sll	a1,s2,0x34
    80002d48:	00c51513          	sll	a0,a0,0xc
    80002d4c:	0345d593          	srl	a1,a1,0x34
    80002d50:	00813483          	ld	s1,8(sp)
    80002d54:	00013903          	ld	s2,0(sp)
    80002d58:	00b50533          	add	a0,a0,a1
    80002d5c:	02010113          	add	sp,sp,32
    80002d60:	00008067          	ret

0000000080002d64 <safe_copyout>:
    80002d64:	14068063          	beqz	a3,80002ea4 <safe_copyout+0x140>
    80002d68:	fb010113          	add	sp,sp,-80
    80002d6c:	02913c23          	sd	s1,56(sp)
    80002d70:	03213823          	sd	s2,48(sp)
    80002d74:	03313423          	sd	s3,40(sp)
    80002d78:	03413023          	sd	s4,32(sp)
    80002d7c:	01513c23          	sd	s5,24(sp)
    80002d80:	01613823          	sd	s6,16(sp)
    80002d84:	01713423          	sd	s7,8(sp)
    80002d88:	01813023          	sd	s8,0(sp)
    80002d8c:	04113423          	sd	ra,72(sp)
    80002d90:	04813023          	sd	s0,64(sp)
    80002d94:	00068b13          	mv	s6,a3
    80002d98:	00050993          	mv	s3,a0
    80002d9c:	00058c13          	mv	s8,a1
    80002da0:	00060b93          	mv	s7,a2
    80002da4:	fffffa37          	lui	s4,0xfffff
    80002da8:	00001937          	lui	s2,0x1
    80002dac:	10000493          	li	s1,256
    80002db0:	0040ea97          	auipc	s5,0x40e
    80002db4:	2e0a8a93          	add	s5,s5,736 # 80411090 <lru_mgr>
    80002db8:	014c7433          	and	s0,s8,s4
    80002dbc:	00040593          	mv	a1,s0
    80002dc0:	00098513          	mv	a0,s3
    80002dc4:	ed5ff0ef          	jal	80002c98 <va2pa_with_replacement>
    80002dc8:	0c050a63          	beqz	a0,80002e9c <safe_copyout+0x138>
    80002dcc:	41840833          	sub	a6,s0,s8
    80002dd0:	01280833          	add	a6,a6,s2
    80002dd4:	010b7463          	bgeu	s6,a6,80002ddc <safe_copyout+0x78>
    80002dd8:	000b0813          	mv	a6,s6
    80002ddc:	01850733          	add	a4,a0,s8
    80002de0:	40870733          	sub	a4,a4,s0
    80002de4:	01780533          	add	a0,a6,s7
    80002de8:	000b8793          	mv	a5,s7
    80002dec:	41770733          	sub	a4,a4,s7
    80002df0:	0a080263          	beqz	a6,80002e94 <safe_copyout+0x130>
    80002df4:	0007c583          	lbu	a1,0(a5)
    80002df8:	00f70633          	add	a2,a4,a5
    80002dfc:	00178793          	add	a5,a5,1
    80002e00:	00b60023          	sb	a1,0(a2)
    80002e04:	fef518e3          	bne	a0,a5,80002df4 <safe_copyout+0x90>
    80002e08:	0040e797          	auipc	a5,0x40e
    80002e0c:	29878793          	add	a5,a5,664 # 804110a0 <lru_mgr+0x10>
    80002e10:	00000713          	li	a4,0
    80002e14:	0100006f          	j	80002e24 <safe_copyout+0xc0>
    80002e18:	0017071b          	addw	a4,a4,1
    80002e1c:	03078793          	add	a5,a5,48
    80002e20:	02970863          	beq	a4,s1,80002e50 <safe_copyout+0xec>
    80002e24:	0007b603          	ld	a2,0(a5)
    80002e28:	fec418e3          	bne	s0,a2,80002e18 <safe_copyout+0xb4>
    80002e2c:	0147a603          	lw	a2,20(a5)
    80002e30:	00167593          	and	a1,a2,1
    80002e34:	fe0582e3          	beqz	a1,80002e18 <safe_copyout+0xb4>
    80002e38:	00171793          	sll	a5,a4,0x1
    80002e3c:	00e787b3          	add	a5,a5,a4
    80002e40:	00479793          	sll	a5,a5,0x4
    80002e44:	00fa87b3          	add	a5,s5,a5
    80002e48:	00466613          	or	a2,a2,4
    80002e4c:	02c7a223          	sw	a2,36(a5)
    80002e50:	410b0b33          	sub	s6,s6,a6
    80002e54:	00050b93          	mv	s7,a0
    80002e58:	01240c33          	add	s8,s0,s2
    80002e5c:	f40b1ee3          	bnez	s6,80002db8 <safe_copyout+0x54>
    80002e60:	00000513          	li	a0,0
    80002e64:	04813083          	ld	ra,72(sp)
    80002e68:	04013403          	ld	s0,64(sp)
    80002e6c:	03813483          	ld	s1,56(sp)
    80002e70:	03013903          	ld	s2,48(sp)
    80002e74:	02813983          	ld	s3,40(sp)
    80002e78:	02013a03          	ld	s4,32(sp)
    80002e7c:	01813a83          	ld	s5,24(sp)
    80002e80:	01013b03          	ld	s6,16(sp)
    80002e84:	00813b83          	ld	s7,8(sp)
    80002e88:	00013c03          	ld	s8,0(sp)
    80002e8c:	05010113          	add	sp,sp,80
    80002e90:	00008067          	ret
    80002e94:	000b8513          	mv	a0,s7
    80002e98:	f71ff06f          	j	80002e08 <safe_copyout+0xa4>
    80002e9c:	fff00513          	li	a0,-1
    80002ea0:	fc5ff06f          	j	80002e64 <safe_copyout+0x100>
    80002ea4:	00000513          	li	a0,0
    80002ea8:	00008067          	ret

0000000080002eac <safe_copyin>:
    80002eac:	0e068863          	beqz	a3,80002f9c <safe_copyin+0xf0>
    80002eb0:	fc010113          	add	sp,sp,-64
    80002eb4:	02813823          	sd	s0,48(sp)
    80002eb8:	02913423          	sd	s1,40(sp)
    80002ebc:	03213023          	sd	s2,32(sp)
    80002ec0:	01313c23          	sd	s3,24(sp)
    80002ec4:	01513423          	sd	s5,8(sp)
    80002ec8:	01613023          	sd	s6,0(sp)
    80002ecc:	02113c23          	sd	ra,56(sp)
    80002ed0:	01413823          	sd	s4,16(sp)
    80002ed4:	00068b13          	mv	s6,a3
    80002ed8:	00050493          	mv	s1,a0
    80002edc:	00058993          	mv	s3,a1
    80002ee0:	00060a93          	mv	s5,a2
    80002ee4:	fffff937          	lui	s2,0xfffff
    80002ee8:	00001437          	lui	s0,0x1
    80002eec:	012afa33          	and	s4,s5,s2
    80002ef0:	000a0593          	mv	a1,s4
    80002ef4:	00048513          	mv	a0,s1
    80002ef8:	da1ff0ef          	jal	80002c98 <va2pa_with_replacement>
    80002efc:	08050c63          	beqz	a0,80002f94 <safe_copyin+0xe8>
    80002f00:	415a08b3          	sub	a7,s4,s5
    80002f04:	008888b3          	add	a7,a7,s0
    80002f08:	011b7463          	bgeu	s6,a7,80002f10 <safe_copyin+0x64>
    80002f0c:	000b0893          	mv	a7,s6
    80002f10:	01550533          	add	a0,a0,s5
    80002f14:	41450533          	sub	a0,a0,s4
    80002f18:	06088063          	beqz	a7,80002f78 <safe_copyin+0xcc>
    80002f1c:	00098793          	mv	a5,s3
    80002f20:	01198833          	add	a6,s3,a7
    80002f24:	41350733          	sub	a4,a0,s3
    80002f28:	00f70633          	add	a2,a4,a5
    80002f2c:	00064603          	lbu	a2,0(a2)
    80002f30:	00178793          	add	a5,a5,1
    80002f34:	fec78fa3          	sb	a2,-1(a5)
    80002f38:	fef818e3          	bne	a6,a5,80002f28 <safe_copyin+0x7c>
    80002f3c:	411b0b33          	sub	s6,s6,a7
    80002f40:	00080993          	mv	s3,a6
    80002f44:	008a0ab3          	add	s5,s4,s0
    80002f48:	fa0b12e3          	bnez	s6,80002eec <safe_copyin+0x40>
    80002f4c:	00000513          	li	a0,0
    80002f50:	03813083          	ld	ra,56(sp)
    80002f54:	03013403          	ld	s0,48(sp)
    80002f58:	02813483          	ld	s1,40(sp)
    80002f5c:	02013903          	ld	s2,32(sp)
    80002f60:	01813983          	ld	s3,24(sp)
    80002f64:	01013a03          	ld	s4,16(sp)
    80002f68:	00813a83          	ld	s5,8(sp)
    80002f6c:	00013b03          	ld	s6,0(sp)
    80002f70:	04010113          	add	sp,sp,64
    80002f74:	00008067          	ret
    80002f78:	00001ab7          	lui	s5,0x1
    80002f7c:	015a0ab3          	add	s5,s4,s5
    80002f80:	012afa33          	and	s4,s5,s2
    80002f84:	000a0593          	mv	a1,s4
    80002f88:	00048513          	mv	a0,s1
    80002f8c:	d0dff0ef          	jal	80002c98 <va2pa_with_replacement>
    80002f90:	f60518e3          	bnez	a0,80002f00 <safe_copyin+0x54>
    80002f94:	fff00513          	li	a0,-1
    80002f98:	fb9ff06f          	j	80002f50 <safe_copyin+0xa4>
    80002f9c:	00000513          	li	a0,0
    80002fa0:	00008067          	ret

0000000080002fa4 <test_page_replacement>:
    80002fa4:	f4010113          	add	sp,sp,-192
    80002fa8:	00005517          	auipc	a0,0x5
    80002fac:	06850513          	add	a0,a0,104 # 80008010 <digits+0x68>
    80002fb0:	0a113c23          	sd	ra,184(sp)
    80002fb4:	0a813823          	sd	s0,176(sp)
    80002fb8:	0a913423          	sd	s1,168(sp)
    80002fbc:	0b213023          	sd	s2,160(sp)
    80002fc0:	09313c23          	sd	s3,152(sp)
    80002fc4:	e10fe0ef          	jal	800015d4 <uart_puts>
    80002fc8:	00005517          	auipc	a0,0x5
    80002fcc:	07050513          	add	a0,a0,112 # 80008038 <digits+0x90>
    80002fd0:	e04fe0ef          	jal	800015d4 <uart_puts>
    80002fd4:	d18ff0ef          	jal	800024ec <alloc_swap_slot>
    80002fd8:	0005049b          	sext.w	s1,a0
    80002fdc:	d10ff0ef          	jal	800024ec <alloc_swap_slot>
    80002fe0:	0005041b          	sext.w	s0,a0
    80002fe4:	d08ff0ef          	jal	800024ec <alloc_swap_slot>
    80002fe8:	fff00793          	li	a5,-1
    80002fec:	02f48663          	beq	s1,a5,80003018 <test_page_replacement+0x74>
    80002ff0:	1cf40c63          	beq	s0,a5,800031c8 <test_page_replacement+0x224>
    80002ff4:	0005051b          	sext.w	a0,a0
    80002ff8:	02f50063          	beq	a0,a5,80003018 <test_page_replacement+0x74>
    80002ffc:	00848e63          	beq	s1,s0,80003018 <test_page_replacement+0x74>
    80003000:	00a40c63          	beq	s0,a0,80003018 <test_page_replacement+0x74>
    80003004:	00a48a63          	beq	s1,a0,80003018 <test_page_replacement+0x74>
    80003008:	00005517          	auipc	a0,0x5
    8000300c:	05850513          	add	a0,a0,88 # 80008060 <digits+0xb8>
    80003010:	dc4fe0ef          	jal	800015d4 <uart_puts>
    80003014:	0100006f          	j	80003024 <test_page_replacement+0x80>
    80003018:	00005517          	auipc	a0,0x5
    8000301c:	06850513          	add	a0,a0,104 # 80008080 <digits+0xd8>
    80003020:	db4fe0ef          	jal	800015d4 <uart_puts>
    80003024:	0000e797          	auipc	a5,0xe
    80003028:	0607a783          	lw	a5,96(a5) # 80011084 <swap_mgr+0x84>
    8000302c:	00f47663          	bgeu	s0,a5,80003038 <test_page_replacement+0x94>
    80003030:	00040513          	mv	a0,s0
    80003034:	fc4fe0ef          	jal	800017f8 <free_swap_slot.part.0>
    80003038:	cb4ff0ef          	jal	800024ec <alloc_swap_slot>
    8000303c:	0005051b          	sext.w	a0,a0
    80003040:	14a40c63          	beq	s0,a0,80003198 <test_page_replacement+0x1f4>
    80003044:	00005517          	auipc	a0,0x5
    80003048:	08450513          	add	a0,a0,132 # 800080c8 <digits+0x120>
    8000304c:	d88fe0ef          	jal	800015d4 <uart_puts>
    80003050:	00005517          	auipc	a0,0x5
    80003054:	0a050513          	add	a0,a0,160 # 800080f0 <digits+0x148>
    80003058:	d7cfe0ef          	jal	800015d4 <uart_puts>
    8000305c:	00080737          	lui	a4,0x80
    80003060:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    80003064:	00010637          	lui	a2,0x10
    80003068:	00c71713          	sll	a4,a4,0xc
    8000306c:	fff00793          	li	a5,-1
    80003070:	01f7d793          	srl	a5,a5,0x1f
    80003074:	00c13023          	sd	a2,0(sp)
    80003078:	02e13c23          	sd	a4,56(sp)
    8000307c:	00100613          	li	a2,1
    80003080:	00012737          	lui	a4,0x12
    80003084:	01f61613          	sll	a2,a2,0x1f
    80003088:	00f13823          	sd	a5,16(sp)
    8000308c:	04f13023          	sd	a5,64(sp)
    80003090:	06e13023          	sd	a4,96(sp)
    80003094:	06f13823          	sd	a5,112(sp)
    80003098:	40001737          	lui	a4,0x40001
    8000309c:	03010793          	add	a5,sp,48
    800030a0:	00424697          	auipc	a3,0x424
    800030a4:	aa06b683          	ld	a3,-1376(a3) # 80426b40 <kernel_pagetable>
    800030a8:	00171713          	sll	a4,a4,0x1
    800030ac:	0040e417          	auipc	s0,0x40e
    800030b0:	fe440413          	add	s0,s0,-28 # 80411090 <lru_mgr>
    800030b4:	00010493          	mv	s1,sp
    800030b8:	06010993          	add	s3,sp,96
    800030bc:	00c13423          	sd	a2,8(sp)
    800030c0:	00f13c23          	sd	a5,24(sp)
    800030c4:	00011637          	lui	a2,0x11
    800030c8:	08f13023          	sd	a5,128(sp)
    800030cc:	00411917          	auipc	s2,0x411
    800030d0:	fc490913          	add	s2,s2,-60 # 80414090 <lru_mgr+0x3000>
    800030d4:	00300793          	li	a5,3
    800030d8:	00005517          	auipc	a0,0x5
    800030dc:	03850513          	add	a0,a0,56 # 80008110 <digits+0x168>
    800030e0:	06e13423          	sd	a4,104(sp)
    800030e4:	00f92823          	sw	a5,16(s2)
    800030e8:	02013023          	sd	zero,32(sp)
    800030ec:	02d13423          	sd	a3,40(sp)
    800030f0:	02c13823          	sd	a2,48(sp)
    800030f4:	04d13c23          	sd	a3,88(sp)
    800030f8:	06013c23          	sd	zero,120(sp)
    800030fc:	08d13423          	sd	a3,136(sp)
    80003100:	00943423          	sd	s1,8(s0)
    80003104:	04913823          	sd	s1,80(sp)
    80003108:	05313423          	sd	s3,72(sp)
    8000310c:	01343023          	sd	s3,0(s0)
    80003110:	cc4fe0ef          	jal	800015d4 <uart_puts>
    80003114:	04813783          	ld	a5,72(sp)
    80003118:	05013703          	ld	a4,80(sp)
    8000311c:	08078a63          	beqz	a5,800031b0 <test_page_replacement+0x20c>
    80003120:	02e7b023          	sd	a4,32(a5)
    80003124:	08070263          	beqz	a4,800031a8 <test_page_replacement+0x204>
    80003128:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    8000312c:	01092783          	lw	a5,16(s2)
    80003130:	04013823          	sd	zero,80(sp)
    80003134:	04013423          	sd	zero,72(sp)
    80003138:	fff7871b          	addw	a4,a5,-1
    8000313c:	00e92823          	sw	a4,16(s2)
    80003140:	00200793          	li	a5,2
    80003144:	00f71663          	bne	a4,a5,80003150 <test_page_replacement+0x1ac>
    80003148:	00043783          	ld	a5,0(s0)
    8000314c:	09378663          	beq	a5,s3,800031d8 <test_page_replacement+0x234>
    80003150:	00005517          	auipc	a0,0x5
    80003154:	00050513          	mv	a0,a0
    80003158:	c7cfe0ef          	jal	800015d4 <uart_puts>
    8000315c:	00843783          	ld	a5,8(s0)
    80003160:	04978c63          	beq	a5,s1,800031b8 <test_page_replacement+0x214>
    80003164:	00005517          	auipc	a0,0x5
    80003168:	02c50513          	add	a0,a0,44 # 80008190 <digits+0x1e8>
    8000316c:	c68fe0ef          	jal	800015d4 <uart_puts>
    80003170:	00005517          	auipc	a0,0x5
    80003174:	04050513          	add	a0,a0,64 # 800081b0 <digits+0x208>
    80003178:	c5cfe0ef          	jal	800015d4 <uart_puts>
    8000317c:	0b813083          	ld	ra,184(sp)
    80003180:	0b013403          	ld	s0,176(sp)
    80003184:	0a813483          	ld	s1,168(sp)
    80003188:	0a013903          	ld	s2,160(sp)
    8000318c:	09813983          	ld	s3,152(sp)
    80003190:	0c010113          	add	sp,sp,192
    80003194:	00008067          	ret
    80003198:	00005517          	auipc	a0,0x5
    8000319c:	f0850513          	add	a0,a0,-248 # 800080a0 <digits+0xf8>
    800031a0:	c34fe0ef          	jal	800015d4 <uart_puts>
    800031a4:	eadff06f          	j	80003050 <test_page_replacement+0xac>
    800031a8:	00f43423          	sd	a5,8(s0)
    800031ac:	f81ff06f          	j	8000312c <test_page_replacement+0x188>
    800031b0:	00e43023          	sd	a4,0(s0)
    800031b4:	f71ff06f          	j	80003124 <test_page_replacement+0x180>
    800031b8:	00005517          	auipc	a0,0x5
    800031bc:	fb850513          	add	a0,a0,-72 # 80008170 <digits+0x1c8>
    800031c0:	c14fe0ef          	jal	800015d4 <uart_puts>
    800031c4:	fadff06f          	j	80003170 <test_page_replacement+0x1cc>
    800031c8:	00005517          	auipc	a0,0x5
    800031cc:	eb850513          	add	a0,a0,-328 # 80008080 <digits+0xd8>
    800031d0:	c04fe0ef          	jal	800015d4 <uart_puts>
    800031d4:	e65ff06f          	j	80003038 <test_page_replacement+0x94>
    800031d8:	00843783          	ld	a5,8(s0)
    800031dc:	f6979ae3          	bne	a5,s1,80003150 <test_page_replacement+0x1ac>
    800031e0:	00005517          	auipc	a0,0x5
    800031e4:	f5050513          	add	a0,a0,-176 # 80008130 <digits+0x188>
    800031e8:	becfe0ef          	jal	800015d4 <uart_puts>
    800031ec:	f71ff06f          	j	8000315c <test_page_replacement+0x1b8>

00000000800031f0 <walkaddr>:
    800031f0:	fff00793          	li	a5,-1
    800031f4:	0197d793          	srl	a5,a5,0x19
    800031f8:	04b7e463          	bltu	a5,a1,80003240 <walkaddr+0x50>
    800031fc:	ff010113          	add	sp,sp,-16
    80003200:	00113423          	sd	ra,8(sp)
    80003204:	d80fe0ef          	jal	80001784 <walk_lookup>
    80003208:	04050063          	beqz	a0,80003248 <walkaddr+0x58>
    8000320c:	00053783          	ld	a5,0(a0)
    80003210:	01100713          	li	a4,17
    80003214:	00000513          	li	a0,0
    80003218:	0117f693          	and	a3,a5,17
    8000321c:	00e68863          	beq	a3,a4,8000322c <walkaddr+0x3c>
    80003220:	00813083          	ld	ra,8(sp)
    80003224:	01010113          	add	sp,sp,16
    80003228:	00008067          	ret
    8000322c:	00813083          	ld	ra,8(sp)
    80003230:	00a7d793          	srl	a5,a5,0xa
    80003234:	00c79513          	sll	a0,a5,0xc
    80003238:	01010113          	add	sp,sp,16
    8000323c:	00008067          	ret
    80003240:	00000513          	li	a0,0
    80003244:	00008067          	ret
    80003248:	00813083          	ld	ra,8(sp)
    8000324c:	00000513          	li	a0,0
    80003250:	01010113          	add	sp,sp,16
    80003254:	00008067          	ret

0000000080003258 <copyin>:
    80003258:	10068863          	beqz	a3,80003368 <copyin+0x110>
    8000325c:	fb010113          	add	sp,sp,-80
    80003260:	02913c23          	sd	s1,56(sp)
    80003264:	01513c23          	sd	s5,24(sp)
    80003268:	fff00493          	li	s1,-1
    8000326c:	fffffab7          	lui	s5,0xfffff
    80003270:	04813023          	sd	s0,64(sp)
    80003274:	04113423          	sd	ra,72(sp)
    80003278:	03213823          	sd	s2,48(sp)
    8000327c:	03313423          	sd	s3,40(sp)
    80003280:	03413023          	sd	s4,32(sp)
    80003284:	01613823          	sd	s6,16(sp)
    80003288:	01713423          	sd	s7,8(sp)
    8000328c:	01567ab3          	and	s5,a2,s5
    80003290:	0194d493          	srl	s1,s1,0x19
    80003294:	00060413          	mv	s0,a2
    80003298:	0354ea63          	bltu	s1,s5,800032cc <copyin+0x74>
    8000329c:	00068b13          	mv	s6,a3
    800032a0:	00050913          	mv	s2,a0
    800032a4:	00058b93          	mv	s7,a1
    800032a8:	01100a13          	li	s4,17
    800032ac:	000019b7          	lui	s3,0x1
    800032b0:	000a8593          	mv	a1,s5
    800032b4:	00090513          	mv	a0,s2
    800032b8:	cccfe0ef          	jal	80001784 <walk_lookup>
    800032bc:	00050863          	beqz	a0,800032cc <copyin+0x74>
    800032c0:	00053783          	ld	a5,0(a0)
    800032c4:	0117f713          	and	a4,a5,17
    800032c8:	03470a63          	beq	a4,s4,800032fc <copyin+0xa4>
    800032cc:	fff00513          	li	a0,-1
    800032d0:	04813083          	ld	ra,72(sp)
    800032d4:	04013403          	ld	s0,64(sp)
    800032d8:	03813483          	ld	s1,56(sp)
    800032dc:	03013903          	ld	s2,48(sp)
    800032e0:	02813983          	ld	s3,40(sp)
    800032e4:	02013a03          	ld	s4,32(sp)
    800032e8:	01813a83          	ld	s5,24(sp)
    800032ec:	01013b03          	ld	s6,16(sp)
    800032f0:	00813b83          	ld	s7,8(sp)
    800032f4:	05010113          	add	sp,sp,80
    800032f8:	00008067          	ret
    800032fc:	00a7d793          	srl	a5,a5,0xa
    80003300:	00c79793          	sll	a5,a5,0xc
    80003304:	fc0784e3          	beqz	a5,800032cc <copyin+0x74>
    80003308:	013a85b3          	add	a1,s5,s3
    8000330c:	408586b3          	sub	a3,a1,s0
    80003310:	00db7463          	bgeu	s6,a3,80003318 <copyin+0xc0>
    80003314:	000b0693          	mv	a3,s6
    80003318:	41540733          	sub	a4,s0,s5
    8000331c:	00f70733          	add	a4,a4,a5
    80003320:	01768833          	add	a6,a3,s7
    80003324:	000b8793          	mv	a5,s7
    80003328:	41770733          	sub	a4,a4,s7
    8000332c:	02068263          	beqz	a3,80003350 <copyin+0xf8>
    80003330:	00f70633          	add	a2,a4,a5
    80003334:	00064603          	lbu	a2,0(a2) # 11000 <_entry-0x7ffef000>
    80003338:	00178793          	add	a5,a5,1
    8000333c:	fec78fa3          	sb	a2,-1(a5)
    80003340:	fef818e3          	bne	a6,a5,80003330 <copyin+0xd8>
    80003344:	40db0b33          	sub	s6,s6,a3
    80003348:	00080b93          	mv	s7,a6
    8000334c:	000b0a63          	beqz	s6,80003360 <copyin+0x108>
    80003350:	f6b4eee3          	bltu	s1,a1,800032cc <copyin+0x74>
    80003354:	00058a93          	mv	s5,a1
    80003358:	00058413          	mv	s0,a1
    8000335c:	f55ff06f          	j	800032b0 <copyin+0x58>
    80003360:	00000513          	li	a0,0
    80003364:	f6dff06f          	j	800032d0 <copyin+0x78>
    80003368:	00000513          	li	a0,0
    8000336c:	00008067          	ret

0000000080003370 <copyout>:
    80003370:	10068863          	beqz	a3,80003480 <copyout+0x110>
    80003374:	fb010113          	add	sp,sp,-80
    80003378:	02913c23          	sd	s1,56(sp)
    8000337c:	01513c23          	sd	s5,24(sp)
    80003380:	fff00493          	li	s1,-1
    80003384:	fffffab7          	lui	s5,0xfffff
    80003388:	04813023          	sd	s0,64(sp)
    8000338c:	04113423          	sd	ra,72(sp)
    80003390:	03213823          	sd	s2,48(sp)
    80003394:	03313423          	sd	s3,40(sp)
    80003398:	03413023          	sd	s4,32(sp)
    8000339c:	01613823          	sd	s6,16(sp)
    800033a0:	01713423          	sd	s7,8(sp)
    800033a4:	0155fab3          	and	s5,a1,s5
    800033a8:	0194d493          	srl	s1,s1,0x19
    800033ac:	00058413          	mv	s0,a1
    800033b0:	0354ea63          	bltu	s1,s5,800033e4 <copyout+0x74>
    800033b4:	00068b13          	mv	s6,a3
    800033b8:	00050913          	mv	s2,a0
    800033bc:	00060b93          	mv	s7,a2
    800033c0:	01100a13          	li	s4,17
    800033c4:	000019b7          	lui	s3,0x1
    800033c8:	000a8593          	mv	a1,s5
    800033cc:	00090513          	mv	a0,s2
    800033d0:	bb4fe0ef          	jal	80001784 <walk_lookup>
    800033d4:	00050863          	beqz	a0,800033e4 <copyout+0x74>
    800033d8:	00053783          	ld	a5,0(a0)
    800033dc:	0117f713          	and	a4,a5,17
    800033e0:	03470a63          	beq	a4,s4,80003414 <copyout+0xa4>
    800033e4:	fff00513          	li	a0,-1
    800033e8:	04813083          	ld	ra,72(sp)
    800033ec:	04013403          	ld	s0,64(sp)
    800033f0:	03813483          	ld	s1,56(sp)
    800033f4:	03013903          	ld	s2,48(sp)
    800033f8:	02813983          	ld	s3,40(sp)
    800033fc:	02013a03          	ld	s4,32(sp)
    80003400:	01813a83          	ld	s5,24(sp)
    80003404:	01013b03          	ld	s6,16(sp)
    80003408:	00813b83          	ld	s7,8(sp)
    8000340c:	05010113          	add	sp,sp,80
    80003410:	00008067          	ret
    80003414:	00a7d793          	srl	a5,a5,0xa
    80003418:	00c79793          	sll	a5,a5,0xc
    8000341c:	fc0784e3          	beqz	a5,800033e4 <copyout+0x74>
    80003420:	013a8533          	add	a0,s5,s3
    80003424:	408506b3          	sub	a3,a0,s0
    80003428:	00db7463          	bgeu	s6,a3,80003430 <copyout+0xc0>
    8000342c:	000b0693          	mv	a3,s6
    80003430:	41540733          	sub	a4,s0,s5
    80003434:	00f70733          	add	a4,a4,a5
    80003438:	01768833          	add	a6,a3,s7
    8000343c:	000b8793          	mv	a5,s7
    80003440:	41770733          	sub	a4,a4,s7
    80003444:	02068263          	beqz	a3,80003468 <copyout+0xf8>
    80003448:	0007c583          	lbu	a1,0(a5)
    8000344c:	00f70633          	add	a2,a4,a5
    80003450:	00178793          	add	a5,a5,1
    80003454:	00b60023          	sb	a1,0(a2)
    80003458:	fef818e3          	bne	a6,a5,80003448 <copyout+0xd8>
    8000345c:	40db0b33          	sub	s6,s6,a3
    80003460:	00080b93          	mv	s7,a6
    80003464:	000b0a63          	beqz	s6,80003478 <copyout+0x108>
    80003468:	f6a4eee3          	bltu	s1,a0,800033e4 <copyout+0x74>
    8000346c:	00050a93          	mv	s5,a0
    80003470:	00050413          	mv	s0,a0
    80003474:	f55ff06f          	j	800033c8 <copyout+0x58>
    80003478:	00000513          	li	a0,0
    8000347c:	f6dff06f          	j	800033e8 <copyout+0x78>
    80003480:	00000513          	li	a0,0
    80003484:	00008067          	ret

0000000080003488 <copyinstr>:
    80003488:	12068463          	beqz	a3,800035b0 <copyinstr+0x128>
    8000348c:	fb010113          	add	sp,sp,-80
    80003490:	02913c23          	sd	s1,56(sp)
    80003494:	01513c23          	sd	s5,24(sp)
    80003498:	fff00493          	li	s1,-1
    8000349c:	fffffab7          	lui	s5,0xfffff
    800034a0:	04813023          	sd	s0,64(sp)
    800034a4:	04113423          	sd	ra,72(sp)
    800034a8:	03213823          	sd	s2,48(sp)
    800034ac:	03313423          	sd	s3,40(sp)
    800034b0:	03413023          	sd	s4,32(sp)
    800034b4:	01613823          	sd	s6,16(sp)
    800034b8:	01713423          	sd	s7,8(sp)
    800034bc:	01567ab3          	and	s5,a2,s5
    800034c0:	0194d493          	srl	s1,s1,0x19
    800034c4:	00060413          	mv	s0,a2
    800034c8:	0354ea63          	bltu	s1,s5,800034fc <copyinstr+0x74>
    800034cc:	00068b93          	mv	s7,a3
    800034d0:	00050913          	mv	s2,a0
    800034d4:	00058b13          	mv	s6,a1
    800034d8:	01100a13          	li	s4,17
    800034dc:	000019b7          	lui	s3,0x1
    800034e0:	000a8593          	mv	a1,s5
    800034e4:	00090513          	mv	a0,s2
    800034e8:	a9cfe0ef          	jal	80001784 <walk_lookup>
    800034ec:	00050863          	beqz	a0,800034fc <copyinstr+0x74>
    800034f0:	00053783          	ld	a5,0(a0)
    800034f4:	0117f713          	and	a4,a5,17
    800034f8:	03470a63          	beq	a4,s4,8000352c <copyinstr+0xa4>
    800034fc:	fff00513          	li	a0,-1
    80003500:	04813083          	ld	ra,72(sp)
    80003504:	04013403          	ld	s0,64(sp)
    80003508:	03813483          	ld	s1,56(sp)
    8000350c:	03013903          	ld	s2,48(sp)
    80003510:	02813983          	ld	s3,40(sp)
    80003514:	02013a03          	ld	s4,32(sp)
    80003518:	01813a83          	ld	s5,24(sp)
    8000351c:	01013b03          	ld	s6,16(sp)
    80003520:	00813b83          	ld	s7,8(sp)
    80003524:	05010113          	add	sp,sp,80
    80003528:	00008067          	ret
    8000352c:	00a7d793          	srl	a5,a5,0xa
    80003530:	00c79793          	sll	a5,a5,0xc
    80003534:	fc0784e3          	beqz	a5,800034fc <copyinstr+0x74>
    80003538:	013a86b3          	add	a3,s5,s3
    8000353c:	40868833          	sub	a6,a3,s0
    80003540:	010bf463          	bgeu	s7,a6,80003548 <copyinstr+0xc0>
    80003544:	000b8813          	mv	a6,s7
    80003548:	41540433          	sub	s0,s0,s5
    8000354c:	00f40433          	add	s0,s0,a5
    80003550:	000b0793          	mv	a5,s6
    80003554:	04080463          	beqz	a6,8000359c <copyinstr+0x114>
    80003558:	41640633          	sub	a2,s0,s6
    8000355c:	01680833          	add	a6,a6,s6
    80003560:	0100006f          	j	80003570 <copyinstr+0xe8>
    80003564:	00e78023          	sb	a4,0(a5)
    80003568:	00178793          	add	a5,a5,1
    8000356c:	03078063          	beq	a5,a6,8000358c <copyinstr+0x104>
    80003570:	00c78733          	add	a4,a5,a2
    80003574:	00074703          	lbu	a4,0(a4)
    80003578:	00078513          	mv	a0,a5
    8000357c:	fe0714e3          	bnez	a4,80003564 <copyinstr+0xdc>
    80003580:	00078023          	sb	zero,0(a5)
    80003584:	00000513          	li	a0,0
    80003588:	f79ff06f          	j	80003500 <copyinstr+0x78>
    8000358c:	fffb8713          	add	a4,s7,-1 # fff <_entry-0x7ffff001>
    80003590:	01670733          	add	a4,a4,s6
    80003594:	40a70bb3          	sub	s7,a4,a0
    80003598:	f6e502e3          	beq	a0,a4,800034fc <copyinstr+0x74>
    8000359c:	f6d4e0e3          	bltu	s1,a3,800034fc <copyinstr+0x74>
    800035a0:	00068a93          	mv	s5,a3
    800035a4:	00068413          	mv	s0,a3
    800035a8:	00078b13          	mv	s6,a5
    800035ac:	f35ff06f          	j	800034e0 <copyinstr+0x58>
    800035b0:	fff00513          	li	a0,-1
    800035b4:	00008067          	ret

00000000800035b8 <uvmunmap>:
    800035b8:	03459793          	sll	a5,a1,0x34
    800035bc:	00079463          	bnez	a5,800035c4 <uvmunmap+0xc>
    800035c0:	a8cfe06f          	j	8000184c <uvmunmap.part.0>
    800035c4:	00008067          	ret

00000000800035c8 <uvmdealloc>:
    800035c8:	06b67863          	bgeu	a2,a1,80003638 <uvmdealloc+0x70>
    800035cc:	000017b7          	lui	a5,0x1
    800035d0:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800035d4:	ff010113          	add	sp,sp,-16
    800035d8:	fffff6b7          	lui	a3,0xfffff
    800035dc:	00f60733          	add	a4,a2,a5
    800035e0:	00f587b3          	add	a5,a1,a5
    800035e4:	00813023          	sd	s0,0(sp)
    800035e8:	00113423          	sd	ra,8(sp)
    800035ec:	00d775b3          	and	a1,a4,a3
    800035f0:	00d7f7b3          	and	a5,a5,a3
    800035f4:	00060413          	mv	s0,a2
    800035f8:	00f5ec63          	bltu	a1,a5,80003610 <uvmdealloc+0x48>
    800035fc:	00813083          	ld	ra,8(sp)
    80003600:	00040513          	mv	a0,s0
    80003604:	00013403          	ld	s0,0(sp)
    80003608:	01010113          	add	sp,sp,16
    8000360c:	00008067          	ret
    80003610:	40b787b3          	sub	a5,a5,a1
    80003614:	00c7d793          	srl	a5,a5,0xc
    80003618:	00100693          	li	a3,1
    8000361c:	0007861b          	sext.w	a2,a5
    80003620:	a2cfe0ef          	jal	8000184c <uvmunmap.part.0>
    80003624:	00813083          	ld	ra,8(sp)
    80003628:	00040513          	mv	a0,s0
    8000362c:	00013403          	ld	s0,0(sp)
    80003630:	01010113          	add	sp,sp,16
    80003634:	00008067          	ret
    80003638:	00058513          	mv	a0,a1
    8000363c:	00008067          	ret

0000000080003640 <uvmalloc>:
    80003640:	0eb66463          	bltu	a2,a1,80003728 <uvmalloc+0xe8>
    80003644:	00001737          	lui	a4,0x1
    80003648:	fff70713          	add	a4,a4,-1 # fff <_entry-0x7ffff001>
    8000364c:	fc010113          	add	sp,sp,-64
    80003650:	00e587b3          	add	a5,a1,a4
    80003654:	fffff737          	lui	a4,0xfffff
    80003658:	02913423          	sd	s1,40(sp)
    8000365c:	03213023          	sd	s2,32(sp)
    80003660:	01313c23          	sd	s3,24(sp)
    80003664:	01413823          	sd	s4,16(sp)
    80003668:	01513423          	sd	s5,8(sp)
    8000366c:	00e7f933          	and	s2,a5,a4
    80003670:	02113c23          	sd	ra,56(sp)
    80003674:	02813823          	sd	s0,48(sp)
    80003678:	00060a93          	mv	s5,a2
    8000367c:	00050a13          	mv	s4,a0
    80003680:	00090493          	mv	s1,s2
    80003684:	000019b7          	lui	s3,0x1
    80003688:	04c97263          	bgeu	s2,a2,800036cc <uvmalloc+0x8c>
    8000368c:	ff5fd0ef          	jal	80001680 <alloc_page>
    80003690:	00050413          	mv	s0,a0
    80003694:	06050463          	beqz	a0,800036fc <uvmalloc+0xbc>
    80003698:	01350733          	add	a4,a0,s3
    8000369c:	00050793          	mv	a5,a0
    800036a0:	00078023          	sb	zero,0(a5)
    800036a4:	00178793          	add	a5,a5,1
    800036a8:	fef71ce3          	bne	a4,a5,800036a0 <uvmalloc+0x60>
    800036ac:	01e00693          	li	a3,30
    800036b0:	00040613          	mv	a2,s0
    800036b4:	00048593          	mv	a1,s1
    800036b8:	000a0513          	mv	a0,s4
    800036bc:	a6cfe0ef          	jal	80001928 <map_page>
    800036c0:	02051a63          	bnez	a0,800036f4 <uvmalloc+0xb4>
    800036c4:	013484b3          	add	s1,s1,s3
    800036c8:	fd54e2e3          	bltu	s1,s5,8000368c <uvmalloc+0x4c>
    800036cc:	000a8513          	mv	a0,s5
    800036d0:	03813083          	ld	ra,56(sp)
    800036d4:	03013403          	ld	s0,48(sp)
    800036d8:	02813483          	ld	s1,40(sp)
    800036dc:	02013903          	ld	s2,32(sp)
    800036e0:	01813983          	ld	s3,24(sp)
    800036e4:	01013a03          	ld	s4,16(sp)
    800036e8:	00813a83          	ld	s5,8(sp)
    800036ec:	04010113          	add	sp,sp,64
    800036f0:	00008067          	ret
    800036f4:	00040513          	mv	a0,s0
    800036f8:	fa5fd0ef          	jal	8000169c <free_page>
    800036fc:	02997263          	bgeu	s2,s1,80003720 <uvmalloc+0xe0>
    80003700:	000017b7          	lui	a5,0x1
    80003704:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003708:	fffff737          	lui	a4,0xfffff
    8000370c:	00f905b3          	add	a1,s2,a5
    80003710:	00f487b3          	add	a5,s1,a5
    80003714:	00e5f5b3          	and	a1,a1,a4
    80003718:	00e7f7b3          	and	a5,a5,a4
    8000371c:	00f5ea63          	bltu	a1,a5,80003730 <uvmalloc+0xf0>
    80003720:	00000513          	li	a0,0
    80003724:	fadff06f          	j	800036d0 <uvmalloc+0x90>
    80003728:	00058513          	mv	a0,a1
    8000372c:	00008067          	ret
    80003730:	40b787b3          	sub	a5,a5,a1
    80003734:	00c7d613          	srl	a2,a5,0xc
    80003738:	000a0513          	mv	a0,s4
    8000373c:	00100693          	li	a3,1
    80003740:	0006061b          	sext.w	a2,a2
    80003744:	908fe0ef          	jal	8000184c <uvmunmap.part.0>
    80003748:	00000513          	li	a0,0
    8000374c:	f85ff06f          	j	800036d0 <uvmalloc+0x90>

0000000080003750 <freewalk>:
    80003750:	f0010113          	add	sp,sp,-256
    80003754:	000017b7          	lui	a5,0x1
    80003758:	0e813823          	sd	s0,240(sp)
    8000375c:	0f213023          	sd	s2,224(sp)
    80003760:	0d613023          	sd	s6,192(sp)
    80003764:	0b713c23          	sd	s7,184(sp)
    80003768:	0e113c23          	sd	ra,248(sp)
    8000376c:	0e913423          	sd	s1,232(sp)
    80003770:	0d313c23          	sd	s3,216(sp)
    80003774:	0d413823          	sd	s4,208(sp)
    80003778:	0d513423          	sd	s5,200(sp)
    8000377c:	0b813823          	sd	s8,176(sp)
    80003780:	0b913423          	sd	s9,168(sp)
    80003784:	0ba13023          	sd	s10,160(sp)
    80003788:	09b13c23          	sd	s11,152(sp)
    8000378c:	00050413          	mv	s0,a0
    80003790:	00050913          	mv	s2,a0
    80003794:	00f50b33          	add	s6,a0,a5
    80003798:	00001bb7          	lui	s7,0x1
    8000379c:	00c0006f          	j	800037a8 <freewalk+0x58>
    800037a0:	00890913          	add	s2,s2,8
    800037a4:	2f690e63          	beq	s2,s6,80003aa0 <freewalk+0x350>
    800037a8:	00093783          	ld	a5,0(s2)
    800037ac:	00100713          	li	a4,1
    800037b0:	00f7f693          	and	a3,a5,15
    800037b4:	fee696e3          	bne	a3,a4,800037a0 <freewalk+0x50>
    800037b8:	00a7d793          	srl	a5,a5,0xa
    800037bc:	00c79a13          	sll	s4,a5,0xc
    800037c0:	017a0cb3          	add	s9,s4,s7
    800037c4:	00100d93          	li	s11,1
    800037c8:	000a0a93          	mv	s5,s4
    800037cc:	00040493          	mv	s1,s0
    800037d0:	00c0006f          	j	800037dc <freewalk+0x8c>
    800037d4:	008a0a13          	add	s4,s4,8 # fffffffffffff008 <bss_end+0xffffffff7fbd8498>
    800037d8:	2b9a0863          	beq	s4,s9,80003a88 <freewalk+0x338>
    800037dc:	000a3783          	ld	a5,0(s4)
    800037e0:	00f7f713          	and	a4,a5,15
    800037e4:	ffb718e3          	bne	a4,s11,800037d4 <freewalk+0x84>
    800037e8:	00a7d793          	srl	a5,a5,0xa
    800037ec:	00c79993          	sll	s3,a5,0xc
    800037f0:	00098c13          	mv	s8,s3
    800037f4:	01798d33          	add	s10,s3,s7
    800037f8:	00098413          	mv	s0,s3
    800037fc:	00c0006f          	j	80003808 <freewalk+0xb8>
    80003800:	00840413          	add	s0,s0,8
    80003804:	27a40863          	beq	s0,s10,80003a74 <freewalk+0x324>
    80003808:	00043783          	ld	a5,0(s0)
    8000380c:	00f7f713          	and	a4,a5,15
    80003810:	ffb718e3          	bne	a4,s11,80003800 <freewalk+0xb0>
    80003814:	00a7d793          	srl	a5,a5,0xa
    80003818:	00c79793          	sll	a5,a5,0xc
    8000381c:	00048713          	mv	a4,s1
    80003820:	03513823          	sd	s5,48(sp)
    80003824:	00090493          	mv	s1,s2
    80003828:	017789b3          	add	s3,a5,s7
    8000382c:	00078a93          	mv	s5,a5
    80003830:	00070913          	mv	s2,a4
    80003834:	00c0006f          	j	80003840 <freewalk+0xf0>
    80003838:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    8000383c:	20f98a63          	beq	s3,a5,80003a50 <freewalk+0x300>
    80003840:	0007b703          	ld	a4,0(a5)
    80003844:	00f77693          	and	a3,a4,15
    80003848:	ffb698e3          	bne	a3,s11,80003838 <freewalk+0xe8>
    8000384c:	00a75713          	srl	a4,a4,0xa
    80003850:	00c71713          	sll	a4,a4,0xc
    80003854:	017706b3          	add	a3,a4,s7
    80003858:	05313023          	sd	s3,64(sp)
    8000385c:	00d13423          	sd	a3,8(sp)
    80003860:	02813c23          	sd	s0,56(sp)
    80003864:	04f13423          	sd	a5,72(sp)
    80003868:	00070993          	mv	s3,a4
    8000386c:	0100006f          	j	8000387c <freewalk+0x12c>
    80003870:	00813783          	ld	a5,8(sp)
    80003874:	00870713          	add	a4,a4,8 # fffffffffffff008 <bss_end+0xffffffff7fbd8498>
    80003878:	1ae78863          	beq	a5,a4,80003a28 <freewalk+0x2d8>
    8000387c:	00073783          	ld	a5,0(a4)
    80003880:	00f7f693          	and	a3,a5,15
    80003884:	ffb696e3          	bne	a3,s11,80003870 <freewalk+0x120>
    80003888:	00a7d793          	srl	a5,a5,0xa
    8000388c:	00c79793          	sll	a5,a5,0xc
    80003890:	017786b3          	add	a3,a5,s7
    80003894:	05813823          	sd	s8,80(sp)
    80003898:	00d13c23          	sd	a3,24(sp)
    8000389c:	000a8c13          	mv	s8,s5
    800038a0:	04e13c23          	sd	a4,88(sp)
    800038a4:	00078a93          	mv	s5,a5
    800038a8:	07213023          	sd	s2,96(sp)
    800038ac:	0100006f          	j	800038bc <freewalk+0x16c>
    800038b0:	01813703          	ld	a4,24(sp)
    800038b4:	00878793          	add	a5,a5,8
    800038b8:	14f70063          	beq	a4,a5,800039f8 <freewalk+0x2a8>
    800038bc:	0007b703          	ld	a4,0(a5)
    800038c0:	00f77693          	and	a3,a4,15
    800038c4:	ffb696e3          	bne	a3,s11,800038b0 <freewalk+0x160>
    800038c8:	00a75713          	srl	a4,a4,0xa
    800038cc:	00c71913          	sll	s2,a4,0xc
    800038d0:	01790733          	add	a4,s2,s7
    800038d4:	07213423          	sd	s2,104(sp)
    800038d8:	00090413          	mv	s0,s2
    800038dc:	02e13023          	sd	a4,32(sp)
    800038e0:	06f13823          	sd	a5,112(sp)
    800038e4:	00048913          	mv	s2,s1
    800038e8:	0100006f          	j	800038f8 <freewalk+0x1a8>
    800038ec:	02013783          	ld	a5,32(sp)
    800038f0:	00840413          	add	s0,s0,8
    800038f4:	0c878e63          	beq	a5,s0,800039d0 <freewalk+0x280>
    800038f8:	00043783          	ld	a5,0(s0)
    800038fc:	00f7f693          	and	a3,a5,15
    80003900:	ffb696e3          	bne	a3,s11,800038ec <freewalk+0x19c>
    80003904:	00a7d793          	srl	a5,a5,0xa
    80003908:	00c79493          	sll	s1,a5,0xc
    8000390c:	017487b3          	add	a5,s1,s7
    80003910:	00913823          	sd	s1,16(sp)
    80003914:	02f13423          	sd	a5,40(sp)
    80003918:	06813c23          	sd	s0,120(sp)
    8000391c:	0100006f          	j	8000392c <freewalk+0x1dc>
    80003920:	02813783          	ld	a5,40(sp)
    80003924:	00848493          	add	s1,s1,8
    80003928:	08978663          	beq	a5,s1,800039b4 <freewalk+0x264>
    8000392c:	0004b783          	ld	a5,0(s1)
    80003930:	00f7f693          	and	a3,a5,15
    80003934:	ffb696e3          	bne	a3,s11,80003920 <freewalk+0x1d0>
    80003938:	00a7d793          	srl	a5,a5,0xa
    8000393c:	00c79413          	sll	s0,a5,0xc
    80003940:	017406b3          	add	a3,s0,s7
    80003944:	09213023          	sd	s2,128(sp)
    80003948:	09613423          	sd	s6,136(sp)
    8000394c:	00040913          	mv	s2,s0
    80003950:	000a0b13          	mv	s6,s4
    80003954:	00048a13          	mv	s4,s1
    80003958:	00068493          	mv	s1,a3
    8000395c:	00c0006f          	j	80003968 <freewalk+0x218>
    80003960:	00840413          	add	s0,s0,8
    80003964:	02848463          	beq	s1,s0,8000398c <freewalk+0x23c>
    80003968:	00043783          	ld	a5,0(s0)
    8000396c:	00f7f713          	and	a4,a5,15
    80003970:	ffb718e3          	bne	a4,s11,80003960 <freewalk+0x210>
    80003974:	00a7d793          	srl	a5,a5,0xa
    80003978:	00c79513          	sll	a0,a5,0xc
    8000397c:	dd5ff0ef          	jal	80003750 <freewalk>
    80003980:	00840413          	add	s0,s0,8
    80003984:	fe043c23          	sd	zero,-8(s0)
    80003988:	fe8490e3          	bne	s1,s0,80003968 <freewalk+0x218>
    8000398c:	00090513          	mv	a0,s2
    80003990:	000a0493          	mv	s1,s4
    80003994:	08013903          	ld	s2,128(sp)
    80003998:	000b0a13          	mv	s4,s6
    8000399c:	08813b03          	ld	s6,136(sp)
    800039a0:	cfdfd0ef          	jal	8000169c <free_page>
    800039a4:	02813783          	ld	a5,40(sp)
    800039a8:	0004b023          	sd	zero,0(s1)
    800039ac:	00848493          	add	s1,s1,8
    800039b0:	f6979ee3          	bne	a5,s1,8000392c <freewalk+0x1dc>
    800039b4:	01013503          	ld	a0,16(sp)
    800039b8:	07813403          	ld	s0,120(sp)
    800039bc:	ce1fd0ef          	jal	8000169c <free_page>
    800039c0:	02013783          	ld	a5,32(sp)
    800039c4:	00043023          	sd	zero,0(s0)
    800039c8:	00840413          	add	s0,s0,8
    800039cc:	f28796e3          	bne	a5,s0,800038f8 <freewalk+0x1a8>
    800039d0:	07013783          	ld	a5,112(sp)
    800039d4:	06813503          	ld	a0,104(sp)
    800039d8:	00090493          	mv	s1,s2
    800039dc:	00f13823          	sd	a5,16(sp)
    800039e0:	cbdfd0ef          	jal	8000169c <free_page>
    800039e4:	01013783          	ld	a5,16(sp)
    800039e8:	01813703          	ld	a4,24(sp)
    800039ec:	0007b023          	sd	zero,0(a5)
    800039f0:	00878793          	add	a5,a5,8
    800039f4:	ecf714e3          	bne	a4,a5,800038bc <freewalk+0x16c>
    800039f8:	05813703          	ld	a4,88(sp)
    800039fc:	000a8513          	mv	a0,s5
    80003a00:	06013903          	ld	s2,96(sp)
    80003a04:	00e13823          	sd	a4,16(sp)
    80003a08:	000c0a93          	mv	s5,s8
    80003a0c:	05013c03          	ld	s8,80(sp)
    80003a10:	c8dfd0ef          	jal	8000169c <free_page>
    80003a14:	01013703          	ld	a4,16(sp)
    80003a18:	00813783          	ld	a5,8(sp)
    80003a1c:	00073023          	sd	zero,0(a4)
    80003a20:	00870713          	add	a4,a4,8
    80003a24:	e4e79ce3          	bne	a5,a4,8000387c <freewalk+0x12c>
    80003a28:	04813783          	ld	a5,72(sp)
    80003a2c:	00098513          	mv	a0,s3
    80003a30:	03813403          	ld	s0,56(sp)
    80003a34:	00f13423          	sd	a5,8(sp)
    80003a38:	04013983          	ld	s3,64(sp)
    80003a3c:	c61fd0ef          	jal	8000169c <free_page>
    80003a40:	00813783          	ld	a5,8(sp)
    80003a44:	0007b023          	sd	zero,0(a5)
    80003a48:	00878793          	add	a5,a5,8
    80003a4c:	def99ae3          	bne	s3,a5,80003840 <freewalk+0xf0>
    80003a50:	00090793          	mv	a5,s2
    80003a54:	000a8513          	mv	a0,s5
    80003a58:	00048913          	mv	s2,s1
    80003a5c:	03013a83          	ld	s5,48(sp)
    80003a60:	00078493          	mv	s1,a5
    80003a64:	00840413          	add	s0,s0,8
    80003a68:	c35fd0ef          	jal	8000169c <free_page>
    80003a6c:	fe043c23          	sd	zero,-8(s0)
    80003a70:	d9a41ce3          	bne	s0,s10,80003808 <freewalk+0xb8>
    80003a74:	000c0513          	mv	a0,s8
    80003a78:	c25fd0ef          	jal	8000169c <free_page>
    80003a7c:	008a0a13          	add	s4,s4,8
    80003a80:	fe0a3c23          	sd	zero,-8(s4)
    80003a84:	d59a1ce3          	bne	s4,s9,800037dc <freewalk+0x8c>
    80003a88:	000a8513          	mv	a0,s5
    80003a8c:	c11fd0ef          	jal	8000169c <free_page>
    80003a90:	00890913          	add	s2,s2,8
    80003a94:	fe093c23          	sd	zero,-8(s2)
    80003a98:	00048413          	mv	s0,s1
    80003a9c:	d16916e3          	bne	s2,s6,800037a8 <freewalk+0x58>
    80003aa0:	00040513          	mv	a0,s0
    80003aa4:	0f013403          	ld	s0,240(sp)
    80003aa8:	0f813083          	ld	ra,248(sp)
    80003aac:	0e813483          	ld	s1,232(sp)
    80003ab0:	0e013903          	ld	s2,224(sp)
    80003ab4:	0d813983          	ld	s3,216(sp)
    80003ab8:	0d013a03          	ld	s4,208(sp)
    80003abc:	0c813a83          	ld	s5,200(sp)
    80003ac0:	0c013b03          	ld	s6,192(sp)
    80003ac4:	0b813b83          	ld	s7,184(sp)
    80003ac8:	0b013c03          	ld	s8,176(sp)
    80003acc:	0a813c83          	ld	s9,168(sp)
    80003ad0:	0a013d03          	ld	s10,160(sp)
    80003ad4:	09813d83          	ld	s11,152(sp)
    80003ad8:	10010113          	add	sp,sp,256
    80003adc:	bc1fd06f          	j	8000169c <free_page>

0000000080003ae0 <uvmfree>:
    80003ae0:	00059463          	bnez	a1,80003ae8 <uvmfree+0x8>
    80003ae4:	00008067          	ret
    80003ae8:	000017b7          	lui	a5,0x1
    80003aec:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003af0:	00f585b3          	add	a1,a1,a5
    80003af4:	00c5d613          	srl	a2,a1,0xc
    80003af8:	00100693          	li	a3,1
    80003afc:	00000593          	li	a1,0
    80003b00:	d4dfd06f          	j	8000184c <uvmunmap.part.0>

0000000080003b04 <proc_pagetable>:
    80003b04:	ff010113          	add	sp,sp,-16
    80003b08:	00113423          	sd	ra,8(sp)
    80003b0c:	02050863          	beqz	a0,80003b3c <proc_pagetable+0x38>
    80003b10:	b71fd0ef          	jal	80001680 <alloc_page>
    80003b14:	00001737          	lui	a4,0x1
    80003b18:	00050793          	mv	a5,a0
    80003b1c:	00e50733          	add	a4,a0,a4
    80003b20:	02050863          	beqz	a0,80003b50 <proc_pagetable+0x4c>
    80003b24:	0007b023          	sd	zero,0(a5)
    80003b28:	00878793          	add	a5,a5,8
    80003b2c:	fef71ce3          	bne	a4,a5,80003b24 <proc_pagetable+0x20>
    80003b30:	00813083          	ld	ra,8(sp)
    80003b34:	01010113          	add	sp,sp,16
    80003b38:	00008067          	ret
    80003b3c:	00004517          	auipc	a0,0x4
    80003b40:	69c50513          	add	a0,a0,1692 # 800081d8 <digits+0x230>
    80003b44:	a91fd0ef          	jal	800015d4 <uart_puts>
    80003b48:	00000513          	li	a0,0
    80003b4c:	fe5ff06f          	j	80003b30 <proc_pagetable+0x2c>
    80003b50:	00004517          	auipc	a0,0x4
    80003b54:	6a850513          	add	a0,a0,1704 # 800081f8 <digits+0x250>
    80003b58:	a7dfd0ef          	jal	800015d4 <uart_puts>
    80003b5c:	00000513          	li	a0,0
    80003b60:	fd1ff06f          	j	80003b30 <proc_pagetable+0x2c>

0000000080003b64 <proc_freepagetable>:
    80003b64:	fd010113          	add	sp,sp,-48
    80003b68:	01313423          	sd	s3,8(sp)
    80003b6c:	02113423          	sd	ra,40(sp)
    80003b70:	02813023          	sd	s0,32(sp)
    80003b74:	00913c23          	sd	s1,24(sp)
    80003b78:	01213823          	sd	s2,16(sp)
    80003b7c:	00050993          	mv	s3,a0
    80003b80:	06059263          	bnez	a1,80003be4 <proc_freepagetable+0x80>
    80003b84:	000014b7          	lui	s1,0x1
    80003b88:	00098413          	mv	s0,s3
    80003b8c:	009984b3          	add	s1,s3,s1
    80003b90:	00100913          	li	s2,1
    80003b94:	00c0006f          	j	80003ba0 <proc_freepagetable+0x3c>
    80003b98:	00840413          	add	s0,s0,8
    80003b9c:	02940463          	beq	s0,s1,80003bc4 <proc_freepagetable+0x60>
    80003ba0:	00043503          	ld	a0,0(s0)
    80003ba4:	00f57793          	and	a5,a0,15
    80003ba8:	ff2798e3          	bne	a5,s2,80003b98 <proc_freepagetable+0x34>
    80003bac:	00a55513          	srl	a0,a0,0xa
    80003bb0:	00c51513          	sll	a0,a0,0xc
    80003bb4:	b9dff0ef          	jal	80003750 <freewalk>
    80003bb8:	00840413          	add	s0,s0,8
    80003bbc:	fe043c23          	sd	zero,-8(s0)
    80003bc0:	fe9410e3          	bne	s0,s1,80003ba0 <proc_freepagetable+0x3c>
    80003bc4:	02013403          	ld	s0,32(sp)
    80003bc8:	02813083          	ld	ra,40(sp)
    80003bcc:	01813483          	ld	s1,24(sp)
    80003bd0:	01013903          	ld	s2,16(sp)
    80003bd4:	00098513          	mv	a0,s3
    80003bd8:	00813983          	ld	s3,8(sp)
    80003bdc:	03010113          	add	sp,sp,48
    80003be0:	abdfd06f          	j	8000169c <free_page>
    80003be4:	000017b7          	lui	a5,0x1
    80003be8:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80003bec:	00f58633          	add	a2,a1,a5
    80003bf0:	00100693          	li	a3,1
    80003bf4:	00c65613          	srl	a2,a2,0xc
    80003bf8:	00000593          	li	a1,0
    80003bfc:	c51fd0ef          	jal	8000184c <uvmunmap.part.0>
    80003c00:	f85ff06f          	j	80003b84 <proc_freepagetable+0x20>

0000000080003c04 <uvmcopy>:
    80003c04:	10060463          	beqz	a2,80003d0c <uvmcopy+0x108>
    80003c08:	fb010113          	add	sp,sp,-80
    80003c0c:	02913c23          	sd	s1,56(sp)
    80003c10:	03213823          	sd	s2,48(sp)
    80003c14:	03313423          	sd	s3,40(sp)
    80003c18:	03413023          	sd	s4,32(sp)
    80003c1c:	01513c23          	sd	s5,24(sp)
    80003c20:	04113423          	sd	ra,72(sp)
    80003c24:	04813023          	sd	s0,64(sp)
    80003c28:	01613823          	sd	s6,16(sp)
    80003c2c:	01713423          	sd	s7,8(sp)
    80003c30:	00060a13          	mv	s4,a2
    80003c34:	00050a93          	mv	s5,a0
    80003c38:	00058993          	mv	s3,a1
    80003c3c:	00000493          	li	s1,0
    80003c40:	00001937          	lui	s2,0x1
    80003c44:	00048593          	mv	a1,s1
    80003c48:	000a8513          	mv	a0,s5
    80003c4c:	b39fd0ef          	jal	80001784 <walk_lookup>
    80003c50:	06050c63          	beqz	a0,80003cc8 <uvmcopy+0xc4>
    80003c54:	00053b83          	ld	s7,0(a0)
    80003c58:	001bf793          	and	a5,s7,1
    80003c5c:	06078663          	beqz	a5,80003cc8 <uvmcopy+0xc4>
    80003c60:	00abd593          	srl	a1,s7,0xa
    80003c64:	00c59413          	sll	s0,a1,0xc
    80003c68:	a19fd0ef          	jal	80001680 <alloc_page>
    80003c6c:	3ffbfb93          	and	s7,s7,1023
    80003c70:	00050b13          	mv	s6,a0
    80003c74:	04050a63          	beqz	a0,80003cc8 <uvmcopy+0xc4>
    80003c78:	01250833          	add	a6,a0,s2
    80003c7c:	00050793          	mv	a5,a0
    80003c80:	40a405b3          	sub	a1,s0,a0
    80003c84:	00f58733          	add	a4,a1,a5
    80003c88:	00074703          	lbu	a4,0(a4) # 1000 <_entry-0x7ffff000>
    80003c8c:	00178793          	add	a5,a5,1
    80003c90:	fee78fa3          	sb	a4,-1(a5)
    80003c94:	ff0798e3          	bne	a5,a6,80003c84 <uvmcopy+0x80>
    80003c98:	000b8693          	mv	a3,s7
    80003c9c:	000b0613          	mv	a2,s6
    80003ca0:	00048593          	mv	a1,s1
    80003ca4:	00098513          	mv	a0,s3
    80003ca8:	c81fd0ef          	jal	80001928 <map_page>
    80003cac:	00051a63          	bnez	a0,80003cc0 <uvmcopy+0xbc>
    80003cb0:	012484b3          	add	s1,s1,s2
    80003cb4:	f944e8e3          	bltu	s1,s4,80003c44 <uvmcopy+0x40>
    80003cb8:	00000513          	li	a0,0
    80003cbc:	0240006f          	j	80003ce0 <uvmcopy+0xdc>
    80003cc0:	000b0513          	mv	a0,s6
    80003cc4:	9d9fd0ef          	jal	8000169c <free_page>
    80003cc8:	00098513          	mv	a0,s3
    80003ccc:	00100693          	li	a3,1
    80003cd0:	00c4d613          	srl	a2,s1,0xc
    80003cd4:	00000593          	li	a1,0
    80003cd8:	b75fd0ef          	jal	8000184c <uvmunmap.part.0>
    80003cdc:	fff00513          	li	a0,-1
    80003ce0:	04813083          	ld	ra,72(sp)
    80003ce4:	04013403          	ld	s0,64(sp)
    80003ce8:	03813483          	ld	s1,56(sp)
    80003cec:	03013903          	ld	s2,48(sp)
    80003cf0:	02813983          	ld	s3,40(sp)
    80003cf4:	02013a03          	ld	s4,32(sp)
    80003cf8:	01813a83          	ld	s5,24(sp)
    80003cfc:	01013b03          	ld	s6,16(sp)
    80003d00:	00813b83          	ld	s7,8(sp)
    80003d04:	05010113          	add	sp,sp,80
    80003d08:	00008067          	ret
    80003d0c:	00000513          	li	a0,0
    80003d10:	00008067          	ret

0000000080003d14 <handle_timer_interrupt>:
    80003d14:	ff010113          	add	sp,sp,-16
    80003d18:	00423597          	auipc	a1,0x423
    80003d1c:	e385b583          	ld	a1,-456(a1) # 80426b50 <ticks>
    80003d20:	00004517          	auipc	a0,0x4
    80003d24:	51050513          	add	a0,a0,1296 # 80008230 <digits+0x288>
    80003d28:	00113423          	sd	ra,8(sp)
    80003d2c:	d38fd0ef          	jal	80001264 <printf>
    80003d30:	00813083          	ld	ra,8(sp)
    80003d34:	00100793          	li	a5,1
    80003d38:	00423717          	auipc	a4,0x423
    80003d3c:	e2f72623          	sw	a5,-468(a4) # 80426b64 <need_resched>
    80003d40:	01010113          	add	sp,sp,16
    80003d44:	00008067          	ret

0000000080003d48 <handle_external_interrupt>:
    80003d48:	00004517          	auipc	a0,0x4
    80003d4c:	51050513          	add	a0,a0,1296 # 80008258 <digits+0x2b0>
    80003d50:	d14fd06f          	j	80001264 <printf>

0000000080003d54 <handle_software_interrupt>:
    80003d54:	00004517          	auipc	a0,0x4
    80003d58:	53450513          	add	a0,a0,1332 # 80008288 <digits+0x2e0>
    80003d5c:	d08fd06f          	j	80001264 <printf>

0000000080003d60 <get_ticks>:
    80003d60:	00423517          	auipc	a0,0x423
    80003d64:	df053503          	ld	a0,-528(a0) # 80426b50 <ticks>
    80003d68:	00008067          	ret

0000000080003d6c <machine_timer_handler>:
    80003d6c:	00423797          	auipc	a5,0x423
    80003d70:	ddc78793          	add	a5,a5,-548 # 80426b48 <m_mode_ticks>
    80003d74:	0007b703          	ld	a4,0(a5)
    80003d78:	ff010113          	add	sp,sp,-16
    80003d7c:	00113423          	sd	ra,8(sp)
    80003d80:	00170713          	add	a4,a4,1
    80003d84:	00e7b023          	sd	a4,0(a5)
    80003d88:	00423697          	auipc	a3,0x423
    80003d8c:	dc868693          	add	a3,a3,-568 # 80426b50 <ticks>
    80003d90:	0006b703          	ld	a4,0(a3)
    80003d94:	00004517          	auipc	a0,0x4
    80003d98:	52450513          	add	a0,a0,1316 # 800082b8 <digits+0x310>
    80003d9c:	00170713          	add	a4,a4,1
    80003da0:	00e6b023          	sd	a4,0(a3)
    80003da4:	0007b583          	ld	a1,0(a5)
    80003da8:	cbcfd0ef          	jal	80001264 <printf>
    80003dac:	0200c7b7          	lui	a5,0x200c
    80003db0:	ff87b783          	ld	a5,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80003db4:	000f4737          	lui	a4,0xf4
    80003db8:	00813083          	ld	ra,8(sp)
    80003dbc:	24070713          	add	a4,a4,576 # f4240 <_entry-0x7ff0bdc0>
    80003dc0:	00e787b3          	add	a5,a5,a4
    80003dc4:	02004737          	lui	a4,0x2004
    80003dc8:	00f73023          	sd	a5,0(a4) # 2004000 <_entry-0x7dffc000>
    80003dcc:	01010113          	add	sp,sp,16
    80003dd0:	00008067          	ret

0000000080003dd4 <alloc_trapframe>:
    80003dd4:	00410597          	auipc	a1,0x410
    80003dd8:	2d458593          	add	a1,a1,724 # 804140a8 <trapframe_used>
    80003ddc:	00058713          	mv	a4,a1
    80003de0:	00000793          	li	a5,0
    80003de4:	10000613          	li	a2,256
    80003de8:	00c0006f          	j	80003df4 <alloc_trapframe+0x20>
    80003dec:	0017879b          	addw	a5,a5,1
    80003df0:	02c78c63          	beq	a5,a2,80003e28 <alloc_trapframe+0x54>
    80003df4:	00072683          	lw	a3,0(a4)
    80003df8:	00470713          	add	a4,a4,4
    80003dfc:	fe0698e3          	bnez	a3,80003dec <alloc_trapframe+0x18>
    80003e00:	11800513          	li	a0,280
    80003e04:	02a78533          	mul	a0,a5,a0
    80003e08:	00279793          	sll	a5,a5,0x2
    80003e0c:	00f585b3          	add	a1,a1,a5
    80003e10:	00100793          	li	a5,1
    80003e14:	00f5a023          	sw	a5,0(a1)
    80003e18:	00410797          	auipc	a5,0x410
    80003e1c:	71078793          	add	a5,a5,1808 # 80414528 <trapframe_pool>
    80003e20:	00f50533          	add	a0,a0,a5
    80003e24:	00008067          	ret
    80003e28:	00000513          	li	a0,0
    80003e2c:	00008067          	ret

0000000080003e30 <free_trapframe>:
    80003e30:	00410797          	auipc	a5,0x410
    80003e34:	6f878793          	add	a5,a5,1784 # 80414528 <trapframe_pool>
    80003e38:	02f56c63          	bltu	a0,a5,80003e70 <free_trapframe+0x40>
    80003e3c:	00422717          	auipc	a4,0x422
    80003e40:	eec70713          	add	a4,a4,-276 # 80425d28 <cpus>
    80003e44:	02e57663          	bgeu	a0,a4,80003e70 <free_trapframe+0x40>
    80003e48:	40f507b3          	sub	a5,a0,a5
    80003e4c:	00005717          	auipc	a4,0x5
    80003e50:	26473703          	ld	a4,612(a4) # 800090b0 <syscall_names+0x350>
    80003e54:	4037d793          	sra	a5,a5,0x3
    80003e58:	02e787b3          	mul	a5,a5,a4
    80003e5c:	00410717          	auipc	a4,0x410
    80003e60:	24c70713          	add	a4,a4,588 # 804140a8 <trapframe_used>
    80003e64:	00279793          	sll	a5,a5,0x2
    80003e68:	00f707b3          	add	a5,a4,a5
    80003e6c:	0007a023          	sw	zero,0(a5)
    80003e70:	00008067          	ret

0000000080003e74 <intr_on>:
    80003e74:	100027f3          	csrr	a5,sstatus
    80003e78:	0027e793          	or	a5,a5,2
    80003e7c:	10079073          	csrw	sstatus,a5
    80003e80:	00008067          	ret

0000000080003e84 <intr_off>:
    80003e84:	100027f3          	csrr	a5,sstatus
    80003e88:	ffd7f793          	and	a5,a5,-3
    80003e8c:	10079073          	csrw	sstatus,a5
    80003e90:	00008067          	ret

0000000080003e94 <intr_get>:
    80003e94:	10002573          	csrr	a0,sstatus
    80003e98:	00155513          	srl	a0,a0,0x1
    80003e9c:	00157513          	and	a0,a0,1
    80003ea0:	00008067          	ret

0000000080003ea4 <set_stvec>:
    80003ea4:	00a585b3          	add	a1,a1,a0
    80003ea8:	10559073          	csrw	stvec,a1
    80003eac:	00008067          	ret

0000000080003eb0 <trap_init>:
    80003eb0:	ff010113          	add	sp,sp,-16
    80003eb4:	00004517          	auipc	a0,0x4
    80003eb8:	43450513          	add	a0,a0,1076 # 800082e8 <digits+0x340>
    80003ebc:	00113423          	sd	ra,8(sp)
    80003ec0:	f14fd0ef          	jal	800015d4 <uart_puts>
    80003ec4:	00410617          	auipc	a2,0x410
    80003ec8:	1e460613          	add	a2,a2,484 # 804140a8 <trapframe_used>
    80003ecc:	00060793          	mv	a5,a2
    80003ed0:	00410717          	auipc	a4,0x410
    80003ed4:	5d870713          	add	a4,a4,1496 # 804144a8 <trap_handlers>
    80003ed8:	0007a023          	sw	zero,0(a5)
    80003edc:	00478793          	add	a5,a5,4
    80003ee0:	fee79ce3          	bne	a5,a4,80003ed8 <trap_init+0x28>
    80003ee4:	00410797          	auipc	a5,0x410
    80003ee8:	5c478793          	add	a5,a5,1476 # 804144a8 <trap_handlers>
    80003eec:	00410697          	auipc	a3,0x410
    80003ef0:	63c68693          	add	a3,a3,1596 # 80414528 <trapframe_pool>
    80003ef4:	00078713          	mv	a4,a5
    80003ef8:	00073023          	sd	zero,0(a4)
    80003efc:	00870713          	add	a4,a4,8
    80003f00:	fee69ce3          	bne	a3,a4,80003ef8 <trap_init+0x48>
    80003f04:	00000717          	auipc	a4,0x0
    80003f08:	e1070713          	add	a4,a4,-496 # 80003d14 <handle_timer_interrupt>
    80003f0c:	42e63423          	sd	a4,1064(a2)
    80003f10:	00000717          	auipc	a4,0x0
    80003f14:	e3870713          	add	a4,a4,-456 # 80003d48 <handle_external_interrupt>
    80003f18:	44e63423          	sd	a4,1096(a2)
    80003f1c:	00000717          	auipc	a4,0x0
    80003f20:	e3870713          	add	a4,a4,-456 # 80003d54 <handle_software_interrupt>
    80003f24:	40e63423          	sd	a4,1032(a2)
    80003f28:	00000593          	li	a1,0
    80003f2c:	0007b703          	ld	a4,0(a5)
    80003f30:	00878793          	add	a5,a5,8
    80003f34:	00070463          	beqz	a4,80003f3c <trap_init+0x8c>
    80003f38:	0015859b          	addw	a1,a1,1
    80003f3c:	fef698e3          	bne	a3,a5,80003f2c <trap_init+0x7c>
    80003f40:	00004517          	auipc	a0,0x4
    80003f44:	3d050513          	add	a0,a0,976 # 80008310 <digits+0x368>
    80003f48:	b1cfd0ef          	jal	80001264 <printf>
    80003f4c:	00813083          	ld	ra,8(sp)
    80003f50:	00004517          	auipc	a0,0x4
    80003f54:	3f050513          	add	a0,a0,1008 # 80008340 <digits+0x398>
    80003f58:	01010113          	add	sp,sp,16
    80003f5c:	e78fd06f          	j	800015d4 <uart_puts>

0000000080003f60 <trap_init_hart>:
    80003f60:	ff010113          	add	sp,sp,-16
    80003f64:	00004517          	auipc	a0,0x4
    80003f68:	3fc50513          	add	a0,a0,1020 # 80008360 <digits+0x3b8>
    80003f6c:	00113423          	sd	ra,8(sp)
    80003f70:	e64fd0ef          	jal	800015d4 <uart_puts>
    80003f74:	00002797          	auipc	a5,0x2
    80003f78:	d4c78793          	add	a5,a5,-692 # 80005cc0 <kernelvec>
    80003f7c:	10579073          	csrw	stvec,a5
    80003f80:	104027f3          	csrr	a5,sie
    80003f84:	2227e793          	or	a5,a5,546
    80003f88:	10479073          	csrw	sie,a5
    80003f8c:	100027f3          	csrr	a5,sstatus
    80003f90:	0027e793          	or	a5,a5,2
    80003f94:	10079073          	csrw	sstatus,a5
    80003f98:	00813083          	ld	ra,8(sp)
    80003f9c:	00004517          	auipc	a0,0x4
    80003fa0:	3ec50513          	add	a0,a0,1004 # 80008388 <digits+0x3e0>
    80003fa4:	01010113          	add	sp,sp,16
    80003fa8:	e2cfd06f          	j	800015d4 <uart_puts>

0000000080003fac <set_next_timer>:
    80003fac:	0200c7b7          	lui	a5,0x200c
    80003fb0:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80003fb4:	000f4637          	lui	a2,0xf4
    80003fb8:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003fbc:	00c58633          	add	a2,a1,a2
    80003fc0:	020047b7          	lui	a5,0x2004
    80003fc4:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80003fc8:	00004517          	auipc	a0,0x4
    80003fcc:	3e850513          	add	a0,a0,1000 # 800083b0 <digits+0x408>
    80003fd0:	a94fd06f          	j	80001264 <printf>

0000000080003fd4 <timerinit>:
    80003fd4:	ff010113          	add	sp,sp,-16
    80003fd8:	00004517          	auipc	a0,0x4
    80003fdc:	40850513          	add	a0,a0,1032 # 800083e0 <digits+0x438>
    80003fe0:	00113423          	sd	ra,8(sp)
    80003fe4:	df0fd0ef          	jal	800015d4 <uart_puts>
    80003fe8:	0200c7b7          	lui	a5,0x200c
    80003fec:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80003ff0:	000f4637          	lui	a2,0xf4
    80003ff4:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003ff8:	00c58633          	add	a2,a1,a2
    80003ffc:	020047b7          	lui	a5,0x2004
    80004000:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80004004:	00004517          	auipc	a0,0x4
    80004008:	3ac50513          	add	a0,a0,940 # 800083b0 <digits+0x408>
    8000400c:	a58fd0ef          	jal	80001264 <printf>
    80004010:	00813083          	ld	ra,8(sp)
    80004014:	00004517          	auipc	a0,0x4
    80004018:	3ec50513          	add	a0,a0,1004 # 80008400 <digits+0x458>
    8000401c:	01010113          	add	sp,sp,16
    80004020:	db4fd06f          	j	800015d4 <uart_puts>

0000000080004024 <devintr>:
    80004024:	142025f3          	csrr	a1,scause
    80004028:	1005da63          	bgez	a1,8000413c <devintr+0x118>
    8000402c:	ff010113          	add	sp,sp,-16
    80004030:	00113423          	sd	ra,8(sp)
    80004034:	00813023          	sd	s0,0(sp)
    80004038:	00f5f593          	and	a1,a1,15
    8000403c:	00500793          	li	a5,5
    80004040:	08f58663          	beq	a1,a5,800040cc <devintr+0xa8>
    80004044:	00900793          	li	a5,9
    80004048:	06f58263          	beq	a1,a5,800040ac <devintr+0x88>
    8000404c:	00100793          	li	a5,1
    80004050:	02f58263          	beq	a1,a5,80004074 <devintr+0x50>
    80004054:	00004517          	auipc	a0,0x4
    80004058:	43450513          	add	a0,a0,1076 # 80008488 <digits+0x4e0>
    8000405c:	a08fd0ef          	jal	80001264 <printf>
    80004060:	00813083          	ld	ra,8(sp)
    80004064:	00013403          	ld	s0,0(sp)
    80004068:	00000513          	li	a0,0
    8000406c:	01010113          	add	sp,sp,16
    80004070:	00008067          	ret
    80004074:	00004517          	auipc	a0,0x4
    80004078:	3f450513          	add	a0,a0,1012 # 80008468 <digits+0x4c0>
    8000407c:	d58fd0ef          	jal	800015d4 <uart_puts>
    80004080:	144027f3          	csrr	a5,sip
    80004084:	ffd7f793          	and	a5,a5,-3
    80004088:	14479073          	csrw	sip,a5
    8000408c:	00004517          	auipc	a0,0x4
    80004090:	1fc50513          	add	a0,a0,508 # 80008288 <digits+0x2e0>
    80004094:	9d0fd0ef          	jal	80001264 <printf>
    80004098:	00100513          	li	a0,1
    8000409c:	00813083          	ld	ra,8(sp)
    800040a0:	00013403          	ld	s0,0(sp)
    800040a4:	01010113          	add	sp,sp,16
    800040a8:	00008067          	ret
    800040ac:	00004517          	auipc	a0,0x4
    800040b0:	39c50513          	add	a0,a0,924 # 80008448 <digits+0x4a0>
    800040b4:	d20fd0ef          	jal	800015d4 <uart_puts>
    800040b8:	00004517          	auipc	a0,0x4
    800040bc:	1a050513          	add	a0,a0,416 # 80008258 <digits+0x2b0>
    800040c0:	9a4fd0ef          	jal	80001264 <printf>
    800040c4:	00100513          	li	a0,1
    800040c8:	fd5ff06f          	j	8000409c <devintr+0x78>
    800040cc:	00423417          	auipc	s0,0x423
    800040d0:	a8440413          	add	s0,s0,-1404 # 80426b50 <ticks>
    800040d4:	00043783          	ld	a5,0(s0)
    800040d8:	000f4637          	lui	a2,0xf4
    800040dc:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800040e0:	00178793          	add	a5,a5,1
    800040e4:	00f43023          	sd	a5,0(s0)
    800040e8:	0200c7b7          	lui	a5,0x200c
    800040ec:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    800040f0:	020047b7          	lui	a5,0x2004
    800040f4:	00004517          	auipc	a0,0x4
    800040f8:	2bc50513          	add	a0,a0,700 # 800083b0 <digits+0x408>
    800040fc:	00c58633          	add	a2,a1,a2
    80004100:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80004104:	960fd0ef          	jal	80001264 <printf>
    80004108:	00043583          	ld	a1,0(s0)
    8000410c:	00004517          	auipc	a0,0x4
    80004110:	31450513          	add	a0,a0,788 # 80008420 <digits+0x478>
    80004114:	950fd0ef          	jal	80001264 <printf>
    80004118:	00043583          	ld	a1,0(s0)
    8000411c:	00004517          	auipc	a0,0x4
    80004120:	11450513          	add	a0,a0,276 # 80008230 <digits+0x288>
    80004124:	940fd0ef          	jal	80001264 <printf>
    80004128:	00100793          	li	a5,1
    8000412c:	00423717          	auipc	a4,0x423
    80004130:	a2f72c23          	sw	a5,-1480(a4) # 80426b64 <need_resched>
    80004134:	00100513          	li	a0,1
    80004138:	f65ff06f          	j	8000409c <devintr+0x78>
    8000413c:	00000513          	li	a0,0
    80004140:	00008067          	ret

0000000080004144 <handle_exception>:
    80004144:	14202773          	csrr	a4,scause
    80004148:	141025f3          	csrr	a1,sepc
    8000414c:	00f00793          	li	a5,15
    80004150:	16e7e663          	bltu	a5,a4,800042bc <handle_exception+0x178>
    80004154:	00004697          	auipc	a3,0x4
    80004158:	78068693          	add	a3,a3,1920 # 800088d4 <digits+0x92c>
    8000415c:	00271793          	sll	a5,a4,0x2
    80004160:	00d787b3          	add	a5,a5,a3
    80004164:	0007a783          	lw	a5,0(a5)
    80004168:	ff010113          	add	sp,sp,-16
    8000416c:	00813023          	sd	s0,0(sp)
    80004170:	00d787b3          	add	a5,a5,a3
    80004174:	00113423          	sd	ra,8(sp)
    80004178:	00050413          	mv	s0,a0
    8000417c:	00078067          	jr	a5
    80004180:	00013403          	ld	s0,0(sp)
    80004184:	00813083          	ld	ra,8(sp)
    80004188:	00058613          	mv	a2,a1
    8000418c:	00070593          	mv	a1,a4
    80004190:	00004517          	auipc	a0,0x4
    80004194:	5a050513          	add	a0,a0,1440 # 80008730 <digits+0x788>
    80004198:	01010113          	add	sp,sp,16
    8000419c:	8c8fd06f          	j	80001264 <printf>
    800041a0:	00004517          	auipc	a0,0x4
    800041a4:	42850513          	add	a0,a0,1064 # 800085c8 <digits+0x620>
    800041a8:	8bcfd0ef          	jal	80001264 <printf>
    800041ac:	12040263          	beqz	s0,800042d0 <handle_exception+0x18c>
    800041b0:	10043583          	ld	a1,256(s0)
    800041b4:	00004517          	auipc	a0,0x4
    800041b8:	47450513          	add	a0,a0,1140 # 80008628 <digits+0x680>
    800041bc:	00013403          	ld	s0,0(sp)
    800041c0:	00813083          	ld	ra,8(sp)
    800041c4:	01010113          	add	sp,sp,16
    800041c8:	89cfd06f          	j	80001264 <printf>
    800041cc:	00004517          	auipc	a0,0x4
    800041d0:	48c50513          	add	a0,a0,1164 # 80008658 <digits+0x6b0>
    800041d4:	890fd0ef          	jal	80001264 <printf>
    800041d8:	00004517          	auipc	a0,0x4
    800041dc:	4a050513          	add	a0,a0,1184 # 80008678 <digits+0x6d0>
    800041e0:	0a040063          	beqz	s0,80004280 <handle_exception+0x13c>
    800041e4:	10043583          	ld	a1,256(s0)
    800041e8:	00004517          	auipc	a0,0x4
    800041ec:	4c050513          	add	a0,a0,1216 # 800086a8 <digits+0x700>
    800041f0:	fcdff06f          	j	800041bc <handle_exception+0x78>
    800041f4:	00013403          	ld	s0,0(sp)
    800041f8:	00813083          	ld	ra,8(sp)
    800041fc:	00004517          	auipc	a0,0x4
    80004200:	4d450513          	add	a0,a0,1236 # 800086d0 <digits+0x728>
    80004204:	01010113          	add	sp,sp,16
    80004208:	85cfd06f          	j	80001264 <printf>
    8000420c:	00013403          	ld	s0,0(sp)
    80004210:	00813083          	ld	ra,8(sp)
    80004214:	00004517          	auipc	a0,0x4
    80004218:	4ec50513          	add	a0,a0,1260 # 80008700 <digits+0x758>
    8000421c:	01010113          	add	sp,sp,16
    80004220:	844fd06f          	j	80001264 <printf>
    80004224:	00013403          	ld	s0,0(sp)
    80004228:	00813083          	ld	ra,8(sp)
    8000422c:	00004517          	auipc	a0,0x4
    80004230:	27c50513          	add	a0,a0,636 # 800084a8 <digits+0x500>
    80004234:	01010113          	add	sp,sp,16
    80004238:	82cfd06f          	j	80001264 <printf>
    8000423c:	00004517          	auipc	a0,0x4
    80004240:	29c50513          	add	a0,a0,668 # 800084d8 <digits+0x530>
    80004244:	820fd0ef          	jal	80001264 <printf>
    80004248:	02040863          	beqz	s0,80004278 <handle_exception+0x134>
    8000424c:	143025f3          	csrr	a1,stval
    80004250:	00013403          	ld	s0,0(sp)
    80004254:	00813083          	ld	ra,8(sp)
    80004258:	00004517          	auipc	a0,0x4
    8000425c:	2e050513          	add	a0,a0,736 # 80008538 <digits+0x590>
    80004260:	01010113          	add	sp,sp,16
    80004264:	800fd06f          	j	80001264 <printf>
    80004268:	00004517          	auipc	a0,0x4
    8000426c:	30050513          	add	a0,a0,768 # 80008568 <digits+0x5c0>
    80004270:	ff5fc0ef          	jal	80001264 <printf>
    80004274:	fc041ce3          	bnez	s0,8000424c <handle_exception+0x108>
    80004278:	00004517          	auipc	a0,0x4
    8000427c:	28850513          	add	a0,a0,648 # 80008500 <digits+0x558>
    80004280:	00013403          	ld	s0,0(sp)
    80004284:	00813083          	ld	ra,8(sp)
    80004288:	01010113          	add	sp,sp,16
    8000428c:	b48fd06f          	j	800015d4 <uart_puts>
    80004290:	00004517          	auipc	a0,0x4
    80004294:	2f050513          	add	a0,a0,752 # 80008580 <digits+0x5d8>
    80004298:	fcdfc0ef          	jal	80001264 <printf>
    8000429c:	fc040ee3          	beqz	s0,80004278 <handle_exception+0x134>
    800042a0:	143025f3          	csrr	a1,stval
    800042a4:	00013403          	ld	s0,0(sp)
    800042a8:	00813083          	ld	ra,8(sp)
    800042ac:	00004517          	auipc	a0,0x4
    800042b0:	2f450513          	add	a0,a0,756 # 800085a0 <digits+0x5f8>
    800042b4:	01010113          	add	sp,sp,16
    800042b8:	fadfc06f          	j	80001264 <printf>
    800042bc:	00058613          	mv	a2,a1
    800042c0:	00004517          	auipc	a0,0x4
    800042c4:	47050513          	add	a0,a0,1136 # 80008730 <digits+0x788>
    800042c8:	00070593          	mv	a1,a4
    800042cc:	f99fc06f          	j	80001264 <printf>
    800042d0:	00004517          	auipc	a0,0x4
    800042d4:	32050513          	add	a0,a0,800 # 800085f0 <digits+0x648>
    800042d8:	fa9ff06f          	j	80004280 <handle_exception+0x13c>

00000000800042dc <kerneltrap>:
    800042dc:	ff010113          	add	sp,sp,-16
    800042e0:	00113423          	sd	ra,8(sp)
    800042e4:	00813023          	sd	s0,0(sp)
    800042e8:	14202473          	csrr	s0,scause
    800042ec:	14102573          	csrr	a0,sepc
    800042f0:	00044a63          	bltz	s0,80004304 <kerneltrap+0x28>
    800042f4:	00013403          	ld	s0,0(sp)
    800042f8:	00813083          	ld	ra,8(sp)
    800042fc:	01010113          	add	sp,sp,16
    80004300:	e45ff06f          	j	80004144 <handle_exception>
    80004304:	d21ff0ef          	jal	80004024 <devintr>
    80004308:	00050a63          	beqz	a0,8000431c <kerneltrap+0x40>
    8000430c:	00813083          	ld	ra,8(sp)
    80004310:	00013403          	ld	s0,0(sp)
    80004314:	01010113          	add	sp,sp,16
    80004318:	00008067          	ret
    8000431c:	00f47593          	and	a1,s0,15
    80004320:	00013403          	ld	s0,0(sp)
    80004324:	00813083          	ld	ra,8(sp)
    80004328:	00004517          	auipc	a0,0x4
    8000432c:	43050513          	add	a0,a0,1072 # 80008758 <digits+0x7b0>
    80004330:	01010113          	add	sp,sp,16
    80004334:	f31fc06f          	j	80001264 <printf>

0000000080004338 <handle_syscall>:
    80004338:	00050863          	beqz	a0,80004348 <handle_syscall+0x10>
    8000433c:	00004517          	auipc	a0,0x4
    80004340:	47c50513          	add	a0,a0,1148 # 800087b8 <digits+0x810>
    80004344:	f21fc06f          	j	80001264 <printf>
    80004348:	00004517          	auipc	a0,0x4
    8000434c:	44050513          	add	a0,a0,1088 # 80008788 <digits+0x7e0>
    80004350:	a84fd06f          	j	800015d4 <uart_puts>

0000000080004354 <handle_trap_page_fault>:
    80004354:	00058793          	mv	a5,a1
    80004358:	02050263          	beqz	a0,8000437c <handle_trap_page_fault+0x28>
    8000435c:	143025f3          	csrr	a1,stval
    80004360:	00078863          	beqz	a5,80004370 <handle_trap_page_fault+0x1c>
    80004364:	00004517          	auipc	a0,0x4
    80004368:	23c50513          	add	a0,a0,572 # 800085a0 <digits+0x5f8>
    8000436c:	ef9fc06f          	j	80001264 <printf>
    80004370:	00004517          	auipc	a0,0x4
    80004374:	1c850513          	add	a0,a0,456 # 80008538 <digits+0x590>
    80004378:	eedfc06f          	j	80001264 <printf>
    8000437c:	00004517          	auipc	a0,0x4
    80004380:	18450513          	add	a0,a0,388 # 80008500 <digits+0x558>
    80004384:	a50fd06f          	j	800015d4 <uart_puts>

0000000080004388 <handle_illegal_instruction>:
    80004388:	00050a63          	beqz	a0,8000439c <handle_illegal_instruction+0x14>
    8000438c:	10053583          	ld	a1,256(a0)
    80004390:	00004517          	auipc	a0,0x4
    80004394:	29850513          	add	a0,a0,664 # 80008628 <digits+0x680>
    80004398:	ecdfc06f          	j	80001264 <printf>
    8000439c:	00004517          	auipc	a0,0x4
    800043a0:	25450513          	add	a0,a0,596 # 800085f0 <digits+0x648>
    800043a4:	a30fd06f          	j	800015d4 <uart_puts>

00000000800043a8 <handle_breakpoint>:
    800043a8:	00050a63          	beqz	a0,800043bc <handle_breakpoint+0x14>
    800043ac:	10053583          	ld	a1,256(a0)
    800043b0:	00004517          	auipc	a0,0x4
    800043b4:	2f850513          	add	a0,a0,760 # 800086a8 <digits+0x700>
    800043b8:	eadfc06f          	j	80001264 <printf>
    800043bc:	00004517          	auipc	a0,0x4
    800043c0:	2bc50513          	add	a0,a0,700 # 80008678 <digits+0x6d0>
    800043c4:	a10fd06f          	j	800015d4 <uart_puts>

00000000800043c8 <usertrapret>:
    800043c8:	ff010113          	add	sp,sp,-16
    800043cc:	00113423          	sd	ra,8(sp)
    800043d0:	01c010ef          	jal	800053ec <myproc>
    800043d4:	02050e63          	beqz	a0,80004410 <usertrapret+0x48>
    800043d8:	04053703          	ld	a4,64(a0)
    800043dc:	02070a63          	beqz	a4,80004410 <usertrapret+0x48>
    800043e0:	100027f3          	csrr	a5,sstatus
    800043e4:	ffd7f793          	and	a5,a5,-3
    800043e8:	10079073          	csrw	sstatus,a5
    800043ec:	10073783          	ld	a5,256(a4)
    800043f0:	14179073          	csrw	sepc,a5
    800043f4:	100027f3          	csrr	a5,sstatus
    800043f8:	eff7f793          	and	a5,a5,-257
    800043fc:	0207e793          	or	a5,a5,32
    80004400:	10079073          	csrw	sstatus,a5
    80004404:	00813083          	ld	ra,8(sp)
    80004408:	01010113          	add	sp,sp,16
    8000440c:	00008067          	ret
    80004410:	00813083          	ld	ra,8(sp)
    80004414:	00004517          	auipc	a0,0x4
    80004418:	3ec50513          	add	a0,a0,1004 # 80008800 <digits+0x858>
    8000441c:	01010113          	add	sp,sp,16
    80004420:	e45fc06f          	j	80001264 <printf>

0000000080004424 <usertrap>:
    80004424:	fe010113          	add	sp,sp,-32
    80004428:	00113c23          	sd	ra,24(sp)
    8000442c:	00813823          	sd	s0,16(sp)
    80004430:	00913423          	sd	s1,8(sp)
    80004434:	142024f3          	csrr	s1,scause
    80004438:	7b5000ef          	jal	800053ec <myproc>
    8000443c:	0c050463          	beqz	a0,80004504 <usertrap+0xe0>
    80004440:	04053783          	ld	a5,64(a0)
    80004444:	00050413          	mv	s0,a0
    80004448:	0a078e63          	beqz	a5,80004504 <usertrap+0xe0>
    8000444c:	14102773          	csrr	a4,sepc
    80004450:	10e7b023          	sd	a4,256(a5)
    80004454:	0e04c463          	bltz	s1,8000453c <usertrap+0x118>
    80004458:	00d00693          	li	a3,13
    8000445c:	0496ee63          	bltu	a3,s1,800044b8 <usertrap+0x94>
    80004460:	00b00693          	li	a3,11
    80004464:	0496ee63          	bltu	a3,s1,800044c0 <usertrap+0x9c>
    80004468:	00800693          	li	a3,8
    8000446c:	0ad49a63          	bne	s1,a3,80004520 <usertrap+0xfc>
    80004470:	01452683          	lw	a3,20(a0)
    80004474:	0e069063          	bnez	a3,80004554 <usertrap+0x130>
    80004478:	00470713          	add	a4,a4,4
    8000447c:	10e7b023          	sd	a4,256(a5)
    80004480:	100027f3          	csrr	a5,sstatus
    80004484:	0027e793          	or	a5,a5,2
    80004488:	10079073          	csrw	sstatus,a5
    8000448c:	22c010ef          	jal	800056b8 <syscall>
    80004490:	01442783          	lw	a5,20(s0)
    80004494:	04079263          	bnez	a5,800044d8 <usertrap+0xb4>
    80004498:	00422797          	auipc	a5,0x422
    8000449c:	6cc7a783          	lw	a5,1740(a5) # 80426b64 <need_resched>
    800044a0:	04079663          	bnez	a5,800044ec <usertrap+0xc8>
    800044a4:	01013403          	ld	s0,16(sp)
    800044a8:	01813083          	ld	ra,24(sp)
    800044ac:	00813483          	ld	s1,8(sp)
    800044b0:	02010113          	add	sp,sp,32
    800044b4:	f15ff06f          	j	800043c8 <usertrapret>
    800044b8:	00f00793          	li	a5,15
    800044bc:	06f49263          	bne	s1,a5,80004520 <usertrap+0xfc>
    800044c0:	143025f3          	csrr	a1,stval
    800044c4:	00004517          	auipc	a0,0x4
    800044c8:	3b450513          	add	a0,a0,948 # 80008878 <digits+0x8d0>
    800044cc:	d99fc0ef          	jal	80001264 <printf>
    800044d0:	00100793          	li	a5,1
    800044d4:	00f42a23          	sw	a5,20(s0)
    800044d8:	fff00513          	li	a0,-1
    800044dc:	329000ef          	jal	80005004 <exit>
    800044e0:	00422797          	auipc	a5,0x422
    800044e4:	6847a783          	lw	a5,1668(a5) # 80426b64 <need_resched>
    800044e8:	fa078ee3          	beqz	a5,800044a4 <usertrap+0x80>
    800044ec:	071000ef          	jal	80004d5c <yield>
    800044f0:	01013403          	ld	s0,16(sp)
    800044f4:	01813083          	ld	ra,24(sp)
    800044f8:	00813483          	ld	s1,8(sp)
    800044fc:	02010113          	add	sp,sp,32
    80004500:	ec9ff06f          	j	800043c8 <usertrapret>
    80004504:	01013403          	ld	s0,16(sp)
    80004508:	01813083          	ld	ra,24(sp)
    8000450c:	00813483          	ld	s1,8(sp)
    80004510:	00004517          	auipc	a0,0x4
    80004514:	31850513          	add	a0,a0,792 # 80008828 <digits+0x880>
    80004518:	02010113          	add	sp,sp,32
    8000451c:	d49fc06f          	j	80001264 <printf>
    80004520:	00048593          	mv	a1,s1
    80004524:	00004517          	auipc	a0,0x4
    80004528:	38450513          	add	a0,a0,900 # 800088a8 <digits+0x900>
    8000452c:	d39fc0ef          	jal	80001264 <printf>
    80004530:	00100793          	li	a5,1
    80004534:	00f42a23          	sw	a5,20(s0)
    80004538:	fa1ff06f          	j	800044d8 <usertrap+0xb4>
    8000453c:	ae9ff0ef          	jal	80004024 <devintr>
    80004540:	f40518e3          	bnez	a0,80004490 <usertrap+0x6c>
    80004544:	00004517          	auipc	a0,0x4
    80004548:	30c50513          	add	a0,a0,780 # 80008850 <digits+0x8a8>
    8000454c:	d19fc0ef          	jal	80001264 <printf>
    80004550:	f41ff06f          	j	80004490 <usertrap+0x6c>
    80004554:	fff00513          	li	a0,-1
    80004558:	2ad000ef          	jal	80005004 <exit>
    8000455c:	04043783          	ld	a5,64(s0)
    80004560:	1007b703          	ld	a4,256(a5)
    80004564:	f15ff06f          	j	80004478 <usertrap+0x54>

0000000080004568 <proc_init>:
    80004568:	ff010113          	add	sp,sp,-16
    8000456c:	00004517          	auipc	a0,0x4
    80004570:	3ac50513          	add	a0,a0,940 # 80008918 <digits+0x970>
    80004574:	00113423          	sd	ra,8(sp)
    80004578:	85cfd0ef          	jal	800015d4 <uart_puts>
    8000457c:	00422797          	auipc	a5,0x422
    80004580:	82c78793          	add	a5,a5,-2004 # 80425da8 <proc>
    80004584:	00422697          	auipc	a3,0x422
    80004588:	5a468693          	add	a3,a3,1444 # 80426b28 <mem_end>
    8000458c:	00078713          	mv	a4,a5
    80004590:	00073023          	sd	zero,0(a4)
    80004594:	00870713          	add	a4,a4,8
    80004598:	fed71ce3          	bne	a4,a3,80004590 <proc_init+0x28>
    8000459c:	00100713          	li	a4,1
    800045a0:	00006617          	auipc	a2,0x6
    800045a4:	a6e62023          	sw	a4,-1440(a2) # 8000a000 <nextpid>
    800045a8:	00422717          	auipc	a4,0x422
    800045ac:	5c073023          	sd	zero,1472(a4) # 80426b68 <current_proc>
    800045b0:	0007a023          	sw	zero,0(a5)
    800045b4:	0007a223          	sw	zero,4(a5)
    800045b8:	0007a423          	sw	zero,8(a5)
    800045bc:	0007a623          	sw	zero,12(a5)
    800045c0:	0d878793          	add	a5,a5,216
    800045c4:	fed796e3          	bne	a5,a3,800045b0 <proc_init+0x48>
    800045c8:	00813083          	ld	ra,8(sp)
    800045cc:	00004517          	auipc	a0,0x4
    800045d0:	37450513          	add	a0,a0,884 # 80008940 <digits+0x998>
    800045d4:	01010113          	add	sp,sp,16
    800045d8:	ffdfc06f          	j	800015d4 <uart_puts>

00000000800045dc <alloc_proc>:
    800045dc:	fd010113          	add	sp,sp,-48
    800045e0:	02113423          	sd	ra,40(sp)
    800045e4:	02813023          	sd	s0,32(sp)
    800045e8:	00913c23          	sd	s1,24(sp)
    800045ec:	01213823          	sd	s2,16(sp)
    800045f0:	01313423          	sd	s3,8(sp)
    800045f4:	00422717          	auipc	a4,0x422
    800045f8:	56c70713          	add	a4,a4,1388 # 80426b60 <proc_lock>
    800045fc:	00100693          	li	a3,1
    80004600:	00068793          	mv	a5,a3
    80004604:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80004608:	0007879b          	sext.w	a5,a5
    8000460c:	fe079ae3          	bnez	a5,80004600 <alloc_proc+0x24>
    80004610:	00421997          	auipc	s3,0x421
    80004614:	79898993          	add	s3,s3,1944 # 80425da8 <proc>
    80004618:	00098793          	mv	a5,s3
    8000461c:	00000413          	li	s0,0
    80004620:	01000613          	li	a2,16
    80004624:	0007a683          	lw	a3,0(a5)
    80004628:	0d878793          	add	a5,a5,216
    8000462c:	02068463          	beqz	a3,80004654 <alloc_proc+0x78>
    80004630:	0014041b          	addw	s0,s0,1
    80004634:	fec418e3          	bne	s0,a2,80004624 <alloc_proc+0x48>
    80004638:	0f50000f          	fence	iorw,ow
    8000463c:	0807202f          	amoswap.w	zero,zero,(a4)
    80004640:	00004517          	auipc	a0,0x4
    80004644:	32850513          	add	a0,a0,808 # 80008968 <digits+0x9c0>
    80004648:	f8dfc0ef          	jal	800015d4 <uart_puts>
    8000464c:	00000913          	li	s2,0
    80004650:	0cc0006f          	j	8000471c <alloc_proc+0x140>
    80004654:	0d800493          	li	s1,216
    80004658:	029404b3          	mul	s1,s0,s1
    8000465c:	00006697          	auipc	a3,0x6
    80004660:	9a468693          	add	a3,a3,-1628 # 8000a000 <nextpid>
    80004664:	0006a783          	lw	a5,0(a3)
    80004668:	0017861b          	addw	a2,a5,1
    8000466c:	00c6a023          	sw	a2,0(a3)
    80004670:	00100693          	li	a3,1
    80004674:	00998933          	add	s2,s3,s1
    80004678:	00d92023          	sw	a3,0(s2) # 1000 <_entry-0x7ffff000>
    8000467c:	00f92223          	sw	a5,4(s2)
    80004680:	00093423          	sd	zero,8(s2)
    80004684:	00093823          	sd	zero,16(s2)
    80004688:	0c093023          	sd	zero,192(s2)
    8000468c:	0c093423          	sd	zero,200(s2)
    80004690:	02093823          	sd	zero,48(s2)
    80004694:	0f50000f          	fence	iorw,ow
    80004698:	0807202f          	amoswap.w	zero,zero,(a4)
    8000469c:	f38ff0ef          	jal	80003dd4 <alloc_trapframe>
    800046a0:	04a93023          	sd	a0,64(s2)
    800046a4:	08050c63          	beqz	a0,8000473c <alloc_proc+0x160>
    800046a8:	fd9fc0ef          	jal	80001680 <alloc_page>
    800046ac:	000017b7          	lui	a5,0x1
    800046b0:	02a93c23          	sd	a0,56(s2)
    800046b4:	00f507b3          	add	a5,a0,a5
    800046b8:	0c050263          	beqz	a0,8000477c <alloc_proc+0x1a0>
    800046bc:	00050023          	sb	zero,0(a0)
    800046c0:	00150513          	add	a0,a0,1
    800046c4:	fef51ce3          	bne	a0,a5,800046bc <alloc_proc+0xe0>
    800046c8:	05048793          	add	a5,s1,80 # 1050 <_entry-0x7fffefb0>
    800046cc:	00f987b3          	add	a5,s3,a5
    800046d0:	07078713          	add	a4,a5,112 # 1070 <_entry-0x7fffef90>
    800046d4:	0007b023          	sd	zero,0(a5)
    800046d8:	00878793          	add	a5,a5,8
    800046dc:	fee79ce3          	bne	a5,a4,800046d4 <alloc_proc+0xf8>
    800046e0:	0d800793          	li	a5,216
    800046e4:	02f40433          	mul	s0,s0,a5
    800046e8:	00001737          	lui	a4,0x1
    800046ec:	00090513          	mv	a0,s2
    800046f0:	008989b3          	add	s3,s3,s0
    800046f4:	0389b783          	ld	a5,56(s3)
    800046f8:	00e787b3          	add	a5,a5,a4
    800046fc:	04f9bc23          	sd	a5,88(s3)
    80004700:	c04ff0ef          	jal	80003b04 <proc_pagetable>
    80004704:	02a9b423          	sd	a0,40(s3)
    80004708:	04050663          	beqz	a0,80004754 <alloc_proc+0x178>
    8000470c:	0049a583          	lw	a1,4(s3)
    80004710:	00004517          	auipc	a0,0x4
    80004714:	2f050513          	add	a0,a0,752 # 80008a00 <digits+0xa58>
    80004718:	b4dfc0ef          	jal	80001264 <printf>
    8000471c:	02813083          	ld	ra,40(sp)
    80004720:	02013403          	ld	s0,32(sp)
    80004724:	01813483          	ld	s1,24(sp)
    80004728:	00813983          	ld	s3,8(sp)
    8000472c:	00090513          	mv	a0,s2
    80004730:	01013903          	ld	s2,16(sp)
    80004734:	03010113          	add	sp,sp,48
    80004738:	00008067          	ret
    8000473c:	00004517          	auipc	a0,0x4
    80004740:	24c50513          	add	a0,a0,588 # 80008988 <digits+0x9e0>
    80004744:	e91fc0ef          	jal	800015d4 <uart_puts>
    80004748:	00092023          	sw	zero,0(s2)
    8000474c:	00000913          	li	s2,0
    80004750:	fcdff06f          	j	8000471c <alloc_proc+0x140>
    80004754:	00004517          	auipc	a0,0x4
    80004758:	28450513          	add	a0,a0,644 # 800089d8 <digits+0xa30>
    8000475c:	e79fc0ef          	jal	800015d4 <uart_puts>
    80004760:	0389b503          	ld	a0,56(s3)
    80004764:	00000913          	li	s2,0
    80004768:	f35fc0ef          	jal	8000169c <free_page>
    8000476c:	0409b503          	ld	a0,64(s3)
    80004770:	ec0ff0ef          	jal	80003e30 <free_trapframe>
    80004774:	0009a023          	sw	zero,0(s3)
    80004778:	fa5ff06f          	j	8000471c <alloc_proc+0x140>
    8000477c:	00004517          	auipc	a0,0x4
    80004780:	23450513          	add	a0,a0,564 # 800089b0 <digits+0xa08>
    80004784:	e51fc0ef          	jal	800015d4 <uart_puts>
    80004788:	04093503          	ld	a0,64(s2)
    8000478c:	ea4ff0ef          	jal	80003e30 <free_trapframe>
    80004790:	00092023          	sw	zero,0(s2)
    80004794:	00000913          	li	s2,0
    80004798:	f85ff06f          	j	8000471c <alloc_proc+0x140>

000000008000479c <free_proc>:
    8000479c:	06050863          	beqz	a0,8000480c <free_proc+0x70>
    800047a0:	ff010113          	add	sp,sp,-16
    800047a4:	00813023          	sd	s0,0(sp)
    800047a8:	00050413          	mv	s0,a0
    800047ac:	04053503          	ld	a0,64(a0)
    800047b0:	00113423          	sd	ra,8(sp)
    800047b4:	00050663          	beqz	a0,800047c0 <free_proc+0x24>
    800047b8:	e78ff0ef          	jal	80003e30 <free_trapframe>
    800047bc:	04043023          	sd	zero,64(s0)
    800047c0:	03843503          	ld	a0,56(s0)
    800047c4:	00050663          	beqz	a0,800047d0 <free_proc+0x34>
    800047c8:	ed5fc0ef          	jal	8000169c <free_page>
    800047cc:	02043c23          	sd	zero,56(s0)
    800047d0:	02843503          	ld	a0,40(s0)
    800047d4:	00050863          	beqz	a0,800047e4 <free_proc+0x48>
    800047d8:	03043583          	ld	a1,48(s0)
    800047dc:	b88ff0ef          	jal	80003b64 <proc_freepagetable>
    800047e0:	02043423          	sd	zero,40(s0)
    800047e4:	00043023          	sd	zero,0(s0)
    800047e8:	00813083          	ld	ra,8(sp)
    800047ec:	02043823          	sd	zero,48(s0)
    800047f0:	0c043023          	sd	zero,192(s0)
    800047f4:	0c043423          	sd	zero,200(s0)
    800047f8:	00043823          	sd	zero,16(s0)
    800047fc:	00042423          	sw	zero,8(s0)
    80004800:	00013403          	ld	s0,0(sp)
    80004804:	01010113          	add	sp,sp,16
    80004808:	00008067          	ret
    8000480c:	00008067          	ret

0000000080004810 <find_proc>:
    80004810:	00421597          	auipc	a1,0x421
    80004814:	59858593          	add	a1,a1,1432 # 80425da8 <proc>
    80004818:	00058793          	mv	a5,a1
    8000481c:	00000713          	li	a4,0
    80004820:	01000613          	li	a2,16
    80004824:	0100006f          	j	80004834 <find_proc+0x24>
    80004828:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    8000482c:	0d878793          	add	a5,a5,216
    80004830:	02c70263          	beq	a4,a2,80004854 <find_proc+0x44>
    80004834:	0047a683          	lw	a3,4(a5)
    80004838:	fea698e3          	bne	a3,a0,80004828 <find_proc+0x18>
    8000483c:	0007a683          	lw	a3,0(a5)
    80004840:	fe0684e3          	beqz	a3,80004828 <find_proc+0x18>
    80004844:	0d800793          	li	a5,216
    80004848:	02f70733          	mul	a4,a4,a5
    8000484c:	00e58533          	add	a0,a1,a4
    80004850:	00008067          	ret
    80004854:	00000513          	li	a0,0
    80004858:	00008067          	ret

000000008000485c <proc_set_kernel_stack>:
    8000485c:	00050a63          	beqz	a0,80004870 <proc_set_kernel_stack+0x14>
    80004860:	000017b7          	lui	a5,0x1
    80004864:	00f587b3          	add	a5,a1,a5
    80004868:	02b53c23          	sd	a1,56(a0)
    8000486c:	04f53c23          	sd	a5,88(a0)
    80004870:	00008067          	ret

0000000080004874 <proc_mark_runnable>:
    80004874:	02050263          	beqz	a0,80004898 <proc_mark_runnable+0x24>
    80004878:	00052783          	lw	a5,0(a0)
    8000487c:	00100713          	li	a4,1
    80004880:	ffe7869b          	addw	a3,a5,-2 # ffe <_entry-0x7ffff002>
    80004884:	00d77a63          	bgeu	a4,a3,80004898 <proc_mark_runnable+0x24>
    80004888:	00500713          	li	a4,5
    8000488c:	00e78663          	beq	a5,a4,80004898 <proc_mark_runnable+0x24>
    80004890:	00200793          	li	a5,2
    80004894:	00f52023          	sw	a5,0(a0)
    80004898:	00008067          	ret

000000008000489c <proc_mark_sleeping>:
    8000489c:	00050863          	beqz	a0,800048ac <proc_mark_sleeping+0x10>
    800048a0:	00052703          	lw	a4,0(a0)
    800048a4:	00300793          	li	a5,3
    800048a8:	00f70463          	beq	a4,a5,800048b0 <proc_mark_sleeping+0x14>
    800048ac:	00008067          	ret
    800048b0:	00400793          	li	a5,4
    800048b4:	00f52023          	sw	a5,0(a0)
    800048b8:	0cb53423          	sd	a1,200(a0)
    800048bc:	00008067          	ret

00000000800048c0 <proc_mark_zombie>:
    800048c0:	00050c63          	beqz	a0,800048d8 <proc_mark_zombie+0x18>
    800048c4:	00052703          	lw	a4,0(a0)
    800048c8:	00500793          	li	a5,5
    800048cc:	00f70663          	beq	a4,a5,800048d8 <proc_mark_zombie+0x18>
    800048d0:	00f52023          	sw	a5,0(a0)
    800048d4:	00b52823          	sw	a1,16(a0)
    800048d8:	00008067          	ret

00000000800048dc <get_pid>:
    800048dc:	00422797          	auipc	a5,0x422
    800048e0:	28c7b783          	ld	a5,652(a5) # 80426b68 <current_proc>
    800048e4:	00078663          	beqz	a5,800048f0 <get_pid+0x14>
    800048e8:	0047a503          	lw	a0,4(a5)
    800048ec:	00008067          	ret
    800048f0:	fff00513          	li	a0,-1
    800048f4:	00008067          	ret

00000000800048f8 <get_current_proc>:
    800048f8:	00422517          	auipc	a0,0x422
    800048fc:	27053503          	ld	a0,624(a0) # 80426b68 <current_proc>
    80004900:	00008067          	ret

0000000080004904 <set_current_proc>:
    80004904:	00422797          	auipc	a5,0x422
    80004908:	26a7b223          	sd	a0,612(a5) # 80426b68 <current_proc>
    8000490c:	00008067          	ret

0000000080004910 <get_uid>:
    80004910:	00422797          	auipc	a5,0x422
    80004914:	2587b783          	ld	a5,600(a5) # 80426b68 <current_proc>
    80004918:	00000513          	li	a0,0
    8000491c:	00078463          	beqz	a5,80004924 <get_uid+0x14>
    80004920:	00c7a503          	lw	a0,12(a5)
    80004924:	00008067          	ret

0000000080004928 <set_uid>:
    80004928:	ff010113          	add	sp,sp,-16
    8000492c:	00113423          	sd	ra,8(sp)
    80004930:	00813023          	sd	s0,0(sp)
    80004934:	00422797          	auipc	a5,0x422
    80004938:	2347b783          	ld	a5,564(a5) # 80426b68 <current_proc>
    8000493c:	04078863          	beqz	a5,8000498c <set_uid+0x64>
    80004940:	00c7a403          	lw	s0,12(a5)
    80004944:	04041863          	bnez	s0,80004994 <set_uid+0x6c>
    80004948:	00700713          	li	a4,7
    8000494c:	00050593          	mv	a1,a0
    80004950:	02a76663          	bltu	a4,a0,8000497c <set_uid+0x54>
    80004954:	0047a603          	lw	a2,4(a5)
    80004958:	00a7a623          	sw	a0,12(a5)
    8000495c:	00004517          	auipc	a0,0x4
    80004960:	12c50513          	add	a0,a0,300 # 80008a88 <digits+0xae0>
    80004964:	901fc0ef          	jal	80001264 <printf>
    80004968:	00813083          	ld	ra,8(sp)
    8000496c:	00040513          	mv	a0,s0
    80004970:	00013403          	ld	s0,0(sp)
    80004974:	01010113          	add	sp,sp,16
    80004978:	00008067          	ret
    8000497c:	00700613          	li	a2,7
    80004980:	00004517          	auipc	a0,0x4
    80004984:	0e050513          	add	a0,a0,224 # 80008a60 <digits+0xab8>
    80004988:	8ddfc0ef          	jal	80001264 <printf>
    8000498c:	fff00413          	li	s0,-1
    80004990:	fd9ff06f          	j	80004968 <set_uid+0x40>
    80004994:	00004517          	auipc	a0,0x4
    80004998:	09450513          	add	a0,a0,148 # 80008a28 <digits+0xa80>
    8000499c:	8c9fc0ef          	jal	80001264 <printf>
    800049a0:	fff00413          	li	s0,-1
    800049a4:	fc5ff06f          	j	80004968 <set_uid+0x40>

00000000800049a8 <count_user_procs>:
    800049a8:	00050593          	mv	a1,a0
    800049ac:	00422697          	auipc	a3,0x422
    800049b0:	1b468693          	add	a3,a3,436 # 80426b60 <proc_lock>
    800049b4:	00100713          	li	a4,1
    800049b8:	00070793          	mv	a5,a4
    800049bc:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    800049c0:	0007879b          	sext.w	a5,a5
    800049c4:	fe079ae3          	bnez	a5,800049b8 <count_user_procs+0x10>
    800049c8:	00421797          	auipc	a5,0x421
    800049cc:	3e078793          	add	a5,a5,992 # 80425da8 <proc>
    800049d0:	00422617          	auipc	a2,0x422
    800049d4:	15860613          	add	a2,a2,344 # 80426b28 <mem_end>
    800049d8:	00000513          	li	a0,0
    800049dc:	0007a703          	lw	a4,0(a5)
    800049e0:	00070863          	beqz	a4,800049f0 <count_user_procs+0x48>
    800049e4:	00c7a703          	lw	a4,12(a5)
    800049e8:	00b71463          	bne	a4,a1,800049f0 <count_user_procs+0x48>
    800049ec:	0015051b          	addw	a0,a0,1
    800049f0:	0d878793          	add	a5,a5,216
    800049f4:	fef614e3          	bne	a2,a5,800049dc <count_user_procs+0x34>
    800049f8:	0f50000f          	fence	iorw,ow
    800049fc:	0806a02f          	amoswap.w	zero,zero,(a3)
    80004a00:	00008067          	ret

0000000080004a04 <can_fork>:
    80004a04:	00050593          	mv	a1,a0
    80004a08:	00422697          	auipc	a3,0x422
    80004a0c:	15868693          	add	a3,a3,344 # 80426b60 <proc_lock>
    80004a10:	00100713          	li	a4,1
    80004a14:	00070793          	mv	a5,a4
    80004a18:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80004a1c:	0007879b          	sext.w	a5,a5
    80004a20:	fe079ae3          	bnez	a5,80004a14 <can_fork+0x10>
    80004a24:	00421797          	auipc	a5,0x421
    80004a28:	38478793          	add	a5,a5,900 # 80425da8 <proc>
    80004a2c:	00422817          	auipc	a6,0x422
    80004a30:	0fc80813          	add	a6,a6,252 # 80426b28 <mem_end>
    80004a34:	00000613          	li	a2,0
    80004a38:	0007a703          	lw	a4,0(a5)
    80004a3c:	00070863          	beqz	a4,80004a4c <can_fork+0x48>
    80004a40:	00c7a703          	lw	a4,12(a5)
    80004a44:	00b71463          	bne	a4,a1,80004a4c <can_fork+0x48>
    80004a48:	0016061b          	addw	a2,a2,1
    80004a4c:	0d878793          	add	a5,a5,216
    80004a50:	ff0794e3          	bne	a5,a6,80004a38 <can_fork+0x34>
    80004a54:	0f50000f          	fence	iorw,ow
    80004a58:	0806a02f          	amoswap.w	zero,zero,(a3)
    80004a5c:	00300793          	li	a5,3
    80004a60:	00100513          	li	a0,1
    80004a64:	00c7c463          	blt	a5,a2,80004a6c <can_fork+0x68>
    80004a68:	00008067          	ret
    80004a6c:	ff010113          	add	sp,sp,-16
    80004a70:	00400693          	li	a3,4
    80004a74:	00004517          	auipc	a0,0x4
    80004a78:	04450513          	add	a0,a0,68 # 80008ab8 <digits+0xb10>
    80004a7c:	00113423          	sd	ra,8(sp)
    80004a80:	fe4fc0ef          	jal	80001264 <printf>
    80004a84:	00813083          	ld	ra,8(sp)
    80004a88:	00000513          	li	a0,0
    80004a8c:	01010113          	add	sp,sp,16
    80004a90:	00008067          	ret

0000000080004a94 <setup_user_stack>:
    80004a94:	08050c63          	beqz	a0,80004b2c <setup_user_stack+0x98>
    80004a98:	02853783          	ld	a5,40(a0)
    80004a9c:	fe010113          	add	sp,sp,-32
    80004aa0:	00813823          	sd	s0,16(sp)
    80004aa4:	00113c23          	sd	ra,24(sp)
    80004aa8:	00913423          	sd	s1,8(sp)
    80004aac:	00050413          	mv	s0,a0
    80004ab0:	06078a63          	beqz	a5,80004b24 <setup_user_stack+0x90>
    80004ab4:	bcdfc0ef          	jal	80001680 <alloc_page>
    80004ab8:	00050493          	mv	s1,a0
    80004abc:	06050463          	beqz	a0,80004b24 <setup_user_stack+0x90>
    80004ac0:	00001737          	lui	a4,0x1
    80004ac4:	00e50733          	add	a4,a0,a4
    80004ac8:	00050793          	mv	a5,a0
    80004acc:	00078023          	sb	zero,0(a5)
    80004ad0:	00178793          	add	a5,a5,1
    80004ad4:	fee79ce3          	bne	a5,a4,80004acc <setup_user_stack+0x38>
    80004ad8:	040005b7          	lui	a1,0x4000
    80004adc:	02843503          	ld	a0,40(s0)
    80004ae0:	ffd58593          	add	a1,a1,-3 # 3fffffd <_entry-0x7c000003>
    80004ae4:	01600693          	li	a3,22
    80004ae8:	00048613          	mv	a2,s1
    80004aec:	00c59593          	sll	a1,a1,0xc
    80004af0:	e39fc0ef          	jal	80001928 <map_page>
    80004af4:	02051463          	bnez	a0,80004b1c <setup_user_stack+0x88>
    80004af8:	020007b7          	lui	a5,0x2000
    80004afc:	fff78793          	add	a5,a5,-1 # 1ffffff <_entry-0x7e000001>
    80004b00:	00d79793          	sll	a5,a5,0xd
    80004b04:	04f43423          	sd	a5,72(s0)
    80004b08:	01813083          	ld	ra,24(sp)
    80004b0c:	01013403          	ld	s0,16(sp)
    80004b10:	00813483          	ld	s1,8(sp)
    80004b14:	02010113          	add	sp,sp,32
    80004b18:	00008067          	ret
    80004b1c:	00048513          	mv	a0,s1
    80004b20:	b7dfc0ef          	jal	8000169c <free_page>
    80004b24:	fff00513          	li	a0,-1
    80004b28:	fe1ff06f          	j	80004b08 <setup_user_stack+0x74>
    80004b2c:	fff00513          	li	a0,-1
    80004b30:	00008067          	ret

0000000080004b34 <load_user_program>:
    80004b34:	0e050063          	beqz	a0,80004c14 <load_user_program+0xe0>
    80004b38:	fd010113          	add	sp,sp,-48
    80004b3c:	01213823          	sd	s2,16(sp)
    80004b40:	02113423          	sd	ra,40(sp)
    80004b44:	02813023          	sd	s0,32(sp)
    80004b48:	00913c23          	sd	s1,24(sp)
    80004b4c:	01313423          	sd	s3,8(sp)
    80004b50:	01413023          	sd	s4,0(sp)
    80004b54:	00058913          	mv	s2,a1
    80004b58:	0a058a63          	beqz	a1,80004c0c <load_user_program+0xd8>
    80004b5c:	00060493          	mv	s1,a2
    80004b60:	0a060663          	beqz	a2,80004c0c <load_user_program+0xd8>
    80004b64:	03053a03          	ld	s4,48(a0)
    80004b68:	00050413          	mv	s0,a0
    80004b6c:	02853503          	ld	a0,40(a0)
    80004b70:	01460633          	add	a2,a2,s4
    80004b74:	000a0593          	mv	a1,s4
    80004b78:	ac9fe0ef          	jal	80003640 <uvmalloc>
    80004b7c:	00050993          	mv	s3,a0
    80004b80:	08050663          	beqz	a0,80004c0c <load_user_program+0xd8>
    80004b84:	02843503          	ld	a0,40(s0)
    80004b88:	03343823          	sd	s3,48(s0)
    80004b8c:	00048693          	mv	a3,s1
    80004b90:	00090613          	mv	a2,s2
    80004b94:	00000593          	li	a1,0
    80004b98:	fd8fe0ef          	jal	80003370 <copyout>
    80004b9c:	04054e63          	bltz	a0,80004bf8 <load_user_program+0xc4>
    80004ba0:	00040513          	mv	a0,s0
    80004ba4:	ef1ff0ef          	jal	80004a94 <setup_user_stack>
    80004ba8:	04054863          	bltz	a0,80004bf8 <load_user_program+0xc4>
    80004bac:	04043783          	ld	a5,64(s0)
    80004bb0:	11878713          	add	a4,a5,280
    80004bb4:	02078063          	beqz	a5,80004bd4 <load_user_program+0xa0>
    80004bb8:	00078023          	sb	zero,0(a5)
    80004bbc:	00178793          	add	a5,a5,1
    80004bc0:	fee79ce3          	bne	a5,a4,80004bb8 <load_user_program+0x84>
    80004bc4:	04043783          	ld	a5,64(s0)
    80004bc8:	04843703          	ld	a4,72(s0)
    80004bcc:	1007b023          	sd	zero,256(a5)
    80004bd0:	00e7b823          	sd	a4,16(a5)
    80004bd4:	00000513          	li	a0,0
    80004bd8:	02813083          	ld	ra,40(sp)
    80004bdc:	02013403          	ld	s0,32(sp)
    80004be0:	01813483          	ld	s1,24(sp)
    80004be4:	01013903          	ld	s2,16(sp)
    80004be8:	00813983          	ld	s3,8(sp)
    80004bec:	00013a03          	ld	s4,0(sp)
    80004bf0:	03010113          	add	sp,sp,48
    80004bf4:	00008067          	ret
    80004bf8:	02843503          	ld	a0,40(s0)
    80004bfc:	000a0613          	mv	a2,s4
    80004c00:	00098593          	mv	a1,s3
    80004c04:	9c5fe0ef          	jal	800035c8 <uvmdealloc>
    80004c08:	03443823          	sd	s4,48(s0)
    80004c0c:	fff00513          	li	a0,-1
    80004c10:	fc9ff06f          	j	80004bd8 <load_user_program+0xa4>
    80004c14:	fff00513          	li	a0,-1
    80004c18:	00008067          	ret

0000000080004c1c <scheduler>:
    80004c1c:	fa010113          	add	sp,sp,-96
    80004c20:	04813823          	sd	s0,80(sp)
    80004c24:	00422417          	auipc	s0,0x422
    80004c28:	f3840413          	add	s0,s0,-200 # 80426b5c <scheduler_initialized>
    80004c2c:	00042783          	lw	a5,0(s0)
    80004c30:	04113c23          	sd	ra,88(sp)
    80004c34:	04913423          	sd	s1,72(sp)
    80004c38:	05213023          	sd	s2,64(sp)
    80004c3c:	03313c23          	sd	s3,56(sp)
    80004c40:	03413823          	sd	s4,48(sp)
    80004c44:	03513423          	sd	s5,40(sp)
    80004c48:	03613023          	sd	s6,32(sp)
    80004c4c:	01713c23          	sd	s7,24(sp)
    80004c50:	01813823          	sd	s8,16(sp)
    80004c54:	01913423          	sd	s9,8(sp)
    80004c58:	01a13023          	sd	s10,0(sp)
    80004c5c:	0e078463          	beqz	a5,80004d44 <scheduler+0x128>
    80004c60:	00422497          	auipc	s1,0x422
    80004c64:	ef848493          	add	s1,s1,-264 # 80426b58 <last_index.0>
    80004c68:	00421c17          	auipc	s8,0x421
    80004c6c:	140c0c13          	add	s8,s8,320 # 80425da8 <proc>
    80004c70:	00421b17          	auipc	s6,0x421
    80004c74:	0b8b0b13          	add	s6,s6,184 # 80425d28 <cpus>
    80004c78:	00422a97          	auipc	s5,0x422
    80004c7c:	ef0a8a93          	add	s5,s5,-272 # 80426b68 <current_proc>
    80004c80:	0d800d13          	li	s10,216
    80004c84:	00200c93          	li	s9,2
    80004c88:	00300a13          	li	s4,3
    80004c8c:	00004997          	auipc	s3,0x4
    80004c90:	e8498993          	add	s3,s3,-380 # 80008b10 <digits+0xb68>
    80004c94:	00421917          	auipc	s2,0x421
    80004c98:	0a490913          	add	s2,s2,164 # 80425d38 <scheduler_context>
    80004c9c:	9d8ff0ef          	jal	80003e74 <intr_on>
    80004ca0:	0004a783          	lw	a5,0(s1)
    80004ca4:	0107861b          	addw	a2,a5,16
    80004ca8:	0080006f          	j	80004cb0 <scheduler+0x94>
    80004cac:	fef608e3          	beq	a2,a5,80004c9c <scheduler+0x80>
    80004cb0:	41f7d71b          	sraw	a4,a5,0x1f
    80004cb4:	01c7571b          	srlw	a4,a4,0x1c
    80004cb8:	00f7043b          	addw	s0,a4,a5
    80004cbc:	00f47413          	and	s0,s0,15
    80004cc0:	40e40bbb          	subw	s7,s0,a4
    80004cc4:	000b8413          	mv	s0,s7
    80004cc8:	03ab8bb3          	mul	s7,s7,s10
    80004ccc:	0017879b          	addw	a5,a5,1
    80004cd0:	017c0733          	add	a4,s8,s7
    80004cd4:	00072683          	lw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    80004cd8:	fd969ae3          	bne	a3,s9,80004cac <scheduler+0x90>
    80004cdc:	00472583          	lw	a1,4(a4)
    80004ce0:	00098513          	mv	a0,s3
    80004ce4:	01472023          	sw	s4,0(a4)
    80004ce8:	00eb3023          	sd	a4,0(s6)
    80004cec:	00eab023          	sd	a4,0(s5)
    80004cf0:	00422797          	auipc	a5,0x422
    80004cf4:	e607aa23          	sw	zero,-396(a5) # 80426b64 <need_resched>
    80004cf8:	d6cfc0ef          	jal	80001264 <printf>
    80004cfc:	988ff0ef          	jal	80003e84 <intr_off>
    80004d00:	050b8593          	add	a1,s7,80 # 1050 <_entry-0x7fffefb0>
    80004d04:	00bc05b3          	add	a1,s8,a1
    80004d08:	00090513          	mv	a0,s2
    80004d0c:	214010ef          	jal	80005f20 <switch_context>
    80004d10:	0014041b          	addw	s0,s0,1
    80004d14:	960ff0ef          	jal	80003e74 <intr_on>
    80004d18:	41f4571b          	sraw	a4,s0,0x1f
    80004d1c:	01c7571b          	srlw	a4,a4,0x1c
    80004d20:	00e4043b          	addw	s0,s0,a4
    80004d24:	00f47793          	and	a5,s0,15
    80004d28:	40e787bb          	subw	a5,a5,a4
    80004d2c:	00f4a023          	sw	a5,0(s1)
    80004d30:	00421717          	auipc	a4,0x421
    80004d34:	fe073c23          	sd	zero,-8(a4) # 80425d28 <cpus>
    80004d38:	00422717          	auipc	a4,0x422
    80004d3c:	e2073823          	sd	zero,-464(a4) # 80426b68 <current_proc>
    80004d40:	f5dff06f          	j	80004c9c <scheduler+0x80>
    80004d44:	00004517          	auipc	a0,0x4
    80004d48:	dac50513          	add	a0,a0,-596 # 80008af0 <digits+0xb48>
    80004d4c:	889fc0ef          	jal	800015d4 <uart_puts>
    80004d50:	00100793          	li	a5,1
    80004d54:	00f42023          	sw	a5,0(s0)
    80004d58:	f09ff06f          	j	80004c60 <scheduler+0x44>

0000000080004d5c <yield>:
    80004d5c:	fe010113          	add	sp,sp,-32
    80004d60:	00813823          	sd	s0,16(sp)
    80004d64:	00113c23          	sd	ra,24(sp)
    80004d68:	00913423          	sd	s1,8(sp)
    80004d6c:	00422417          	auipc	s0,0x422
    80004d70:	dfc43403          	ld	s0,-516(s0) # 80426b68 <current_proc>
    80004d74:	06040263          	beqz	s0,80004dd8 <yield+0x7c>
    80004d78:	91cff0ef          	jal	80003e94 <intr_get>
    80004d7c:	00050493          	mv	s1,a0
    80004d80:	904ff0ef          	jal	80003e84 <intr_off>
    80004d84:	00422717          	auipc	a4,0x422
    80004d88:	ddc70713          	add	a4,a4,-548 # 80426b60 <proc_lock>
    80004d8c:	00100693          	li	a3,1
    80004d90:	00068793          	mv	a5,a3
    80004d94:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80004d98:	0007879b          	sext.w	a5,a5
    80004d9c:	fe079ae3          	bnez	a5,80004d90 <yield+0x34>
    80004da0:	00042683          	lw	a3,0(s0)
    80004da4:	00300793          	li	a5,3
    80004da8:	04f68263          	beq	a3,a5,80004dec <yield+0x90>
    80004dac:	0f50000f          	fence	iorw,ow
    80004db0:	0807202f          	amoswap.w	zero,zero,(a4)
    80004db4:	00442583          	lw	a1,4(s0)
    80004db8:	00004517          	auipc	a0,0x4
    80004dbc:	d8850513          	add	a0,a0,-632 # 80008b40 <digits+0xb98>
    80004dc0:	ca4fc0ef          	jal	80001264 <printf>
    80004dc4:	00421597          	auipc	a1,0x421
    80004dc8:	f7458593          	add	a1,a1,-140 # 80425d38 <scheduler_context>
    80004dcc:	05040513          	add	a0,s0,80
    80004dd0:	150010ef          	jal	80005f20 <switch_context>
    80004dd4:	02049263          	bnez	s1,80004df8 <yield+0x9c>
    80004dd8:	01813083          	ld	ra,24(sp)
    80004ddc:	01013403          	ld	s0,16(sp)
    80004de0:	00813483          	ld	s1,8(sp)
    80004de4:	02010113          	add	sp,sp,32
    80004de8:	00008067          	ret
    80004dec:	00200793          	li	a5,2
    80004df0:	00f42023          	sw	a5,0(s0)
    80004df4:	fb9ff06f          	j	80004dac <yield+0x50>
    80004df8:	01013403          	ld	s0,16(sp)
    80004dfc:	01813083          	ld	ra,24(sp)
    80004e00:	00813483          	ld	s1,8(sp)
    80004e04:	02010113          	add	sp,sp,32
    80004e08:	86cff06f          	j	80003e74 <intr_on>

0000000080004e0c <fork>:
    80004e0c:	fe010113          	add	sp,sp,-32
    80004e10:	00913423          	sd	s1,8(sp)
    80004e14:	00113c23          	sd	ra,24(sp)
    80004e18:	00813823          	sd	s0,16(sp)
    80004e1c:	00422497          	auipc	s1,0x422
    80004e20:	d4c4b483          	ld	s1,-692(s1) # 80426b68 <current_proc>
    80004e24:	14048463          	beqz	s1,80004f6c <fork+0x160>
    80004e28:	00c4a403          	lw	s0,12(s1)
    80004e2c:	00040513          	mv	a0,s0
    80004e30:	b79ff0ef          	jal	800049a8 <count_user_procs>
    80004e34:	00300793          	li	a5,3
    80004e38:	0ea7c463          	blt	a5,a0,80004f20 <fork+0x114>
    80004e3c:	fa0ff0ef          	jal	800045dc <alloc_proc>
    80004e40:	00050413          	mv	s0,a0
    80004e44:	12050e63          	beqz	a0,80004f80 <fork+0x174>
    80004e48:	00c4a783          	lw	a5,12(s1)
    80004e4c:	02853583          	ld	a1,40(a0)
    80004e50:	0304b603          	ld	a2,48(s1)
    80004e54:	0284b503          	ld	a0,40(s1)
    80004e58:	00f42623          	sw	a5,12(s0)
    80004e5c:	da9fe0ef          	jal	80003c04 <uvmcopy>
    80004e60:	0e054863          	bltz	a0,80004f50 <fork+0x144>
    80004e64:	0304b703          	ld	a4,48(s1)
    80004e68:	00422797          	auipc	a5,0x422
    80004e6c:	cf878793          	add	a5,a5,-776 # 80426b60 <proc_lock>
    80004e70:	00100693          	li	a3,1
    80004e74:	02e43823          	sd	a4,48(s0)
    80004e78:	00068713          	mv	a4,a3
    80004e7c:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    80004e80:	0007071b          	sext.w	a4,a4
    80004e84:	fe071ae3          	bnez	a4,80004e78 <fork+0x6c>
    80004e88:	0044a703          	lw	a4,4(s1)
    80004e8c:	0c943023          	sd	s1,192(s0)
    80004e90:	00e42423          	sw	a4,8(s0)
    80004e94:	0f50000f          	fence	iorw,ow
    80004e98:	0807a02f          	amoswap.w	zero,zero,(a5)
    80004e9c:	0404b703          	ld	a4,64(s1)
    80004ea0:	02070663          	beqz	a4,80004ecc <fork+0xc0>
    80004ea4:	04043683          	ld	a3,64(s0)
    80004ea8:	02068263          	beqz	a3,80004ecc <fork+0xc0>
    80004eac:	11870593          	add	a1,a4,280
    80004eb0:	00074603          	lbu	a2,0(a4)
    80004eb4:	00170713          	add	a4,a4,1
    80004eb8:	00168693          	add	a3,a3,1
    80004ebc:	fec68fa3          	sb	a2,-1(a3)
    80004ec0:	feb718e3          	bne	a4,a1,80004eb0 <fork+0xa4>
    80004ec4:	04043703          	ld	a4,64(s0)
    80004ec8:	04073823          	sd	zero,80(a4)
    80004ecc:	00100693          	li	a3,1
    80004ed0:	00068713          	mv	a4,a3
    80004ed4:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    80004ed8:	0007071b          	sext.w	a4,a4
    80004edc:	fe071ae3          	bnez	a4,80004ed0 <fork+0xc4>
    80004ee0:	00200713          	li	a4,2
    80004ee4:	00e42023          	sw	a4,0(s0)
    80004ee8:	0f50000f          	fence	iorw,ow
    80004eec:	0807a02f          	amoswap.w	zero,zero,(a5)
    80004ef0:	00c42683          	lw	a3,12(s0)
    80004ef4:	0044a603          	lw	a2,4(s1)
    80004ef8:	00442583          	lw	a1,4(s0)
    80004efc:	00004517          	auipc	a0,0x4
    80004f00:	ce450513          	add	a0,a0,-796 # 80008be0 <digits+0xc38>
    80004f04:	b60fc0ef          	jal	80001264 <printf>
    80004f08:	00442503          	lw	a0,4(s0)
    80004f0c:	01813083          	ld	ra,24(sp)
    80004f10:	01013403          	ld	s0,16(sp)
    80004f14:	00813483          	ld	s1,8(sp)
    80004f18:	02010113          	add	sp,sp,32
    80004f1c:	00008067          	ret
    80004f20:	00050613          	mv	a2,a0
    80004f24:	00400693          	li	a3,4
    80004f28:	00040593          	mv	a1,s0
    80004f2c:	00004517          	auipc	a0,0x4
    80004f30:	b8c50513          	add	a0,a0,-1140 # 80008ab8 <digits+0xb10>
    80004f34:	b30fc0ef          	jal	80001264 <printf>
    80004f38:	fff00513          	li	a0,-1
    80004f3c:	01813083          	ld	ra,24(sp)
    80004f40:	01013403          	ld	s0,16(sp)
    80004f44:	00813483          	ld	s1,8(sp)
    80004f48:	02010113          	add	sp,sp,32
    80004f4c:	00008067          	ret
    80004f50:	00004517          	auipc	a0,0x4
    80004f54:	c6850513          	add	a0,a0,-920 # 80008bb8 <digits+0xc10>
    80004f58:	e7cfc0ef          	jal	800015d4 <uart_puts>
    80004f5c:	00040513          	mv	a0,s0
    80004f60:	83dff0ef          	jal	8000479c <free_proc>
    80004f64:	fff00513          	li	a0,-1
    80004f68:	fd5ff06f          	j	80004f3c <fork+0x130>
    80004f6c:	00004517          	auipc	a0,0x4
    80004f70:	bf450513          	add	a0,a0,-1036 # 80008b60 <digits+0xbb8>
    80004f74:	e60fc0ef          	jal	800015d4 <uart_puts>
    80004f78:	fff00513          	li	a0,-1
    80004f7c:	fc1ff06f          	j	80004f3c <fork+0x130>
    80004f80:	00004517          	auipc	a0,0x4
    80004f84:	c0850513          	add	a0,a0,-1016 # 80008b88 <digits+0xbe0>
    80004f88:	e4cfc0ef          	jal	800015d4 <uart_puts>
    80004f8c:	fff00513          	li	a0,-1
    80004f90:	fadff06f          	j	80004f3c <fork+0x130>

0000000080004f94 <growproc>:
    80004f94:	ff010113          	add	sp,sp,-16
    80004f98:	00813023          	sd	s0,0(sp)
    80004f9c:	00113423          	sd	ra,8(sp)
    80004fa0:	00422417          	auipc	s0,0x422
    80004fa4:	bc843403          	ld	s0,-1080(s0) # 80426b68 <current_proc>
    80004fa8:	04040063          	beqz	s0,80004fe8 <growproc+0x54>
    80004fac:	03043583          	ld	a1,48(s0)
    80004fb0:	00050613          	mv	a2,a0
    80004fb4:	02a04063          	bgtz	a0,80004fd4 <growproc+0x40>
    80004fb8:	02051c63          	bnez	a0,80004ff0 <growproc+0x5c>
    80004fbc:	02b43823          	sd	a1,48(s0)
    80004fc0:	00000513          	li	a0,0
    80004fc4:	00813083          	ld	ra,8(sp)
    80004fc8:	00013403          	ld	s0,0(sp)
    80004fcc:	01010113          	add	sp,sp,16
    80004fd0:	00008067          	ret
    80004fd4:	02843503          	ld	a0,40(s0)
    80004fd8:	00b60633          	add	a2,a2,a1
    80004fdc:	e64fe0ef          	jal	80003640 <uvmalloc>
    80004fe0:	00050593          	mv	a1,a0
    80004fe4:	fc051ce3          	bnez	a0,80004fbc <growproc+0x28>
    80004fe8:	fff00513          	li	a0,-1
    80004fec:	fd9ff06f          	j	80004fc4 <growproc+0x30>
    80004ff0:	02843503          	ld	a0,40(s0)
    80004ff4:	00b60633          	add	a2,a2,a1
    80004ff8:	dd0fe0ef          	jal	800035c8 <uvmdealloc>
    80004ffc:	00050593          	mv	a1,a0
    80005000:	fbdff06f          	j	80004fbc <growproc+0x28>

0000000080005004 <exit>:
    80005004:	00422697          	auipc	a3,0x422
    80005008:	b646b683          	ld	a3,-1180(a3) # 80426b68 <current_proc>
    8000500c:	08068e63          	beqz	a3,800050a8 <exit+0xa4>
    80005010:	ff010113          	add	sp,sp,-16
    80005014:	00813023          	sd	s0,0(sp)
    80005018:	00113423          	sd	ra,8(sp)
    8000501c:	00050613          	mv	a2,a0
    80005020:	00422417          	auipc	s0,0x422
    80005024:	b4040413          	add	s0,s0,-1216 # 80426b60 <proc_lock>
    80005028:	00100713          	li	a4,1
    8000502c:	00070793          	mv	a5,a4
    80005030:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80005034:	0007879b          	sext.w	a5,a5
    80005038:	fe079ae3          	bnez	a5,8000502c <exit+0x28>
    8000503c:	00500793          	li	a5,5
    80005040:	00f6a023          	sw	a5,0(a3)
    80005044:	00c6a823          	sw	a2,16(a3)
    80005048:	00421797          	auipc	a5,0x421
    8000504c:	e2078793          	add	a5,a5,-480 # 80425e68 <proc+0xc0>
    80005050:	00422597          	auipc	a1,0x422
    80005054:	b9858593          	add	a1,a1,-1128 # 80426be8 <bss_end+0x78>
    80005058:	00100513          	li	a0,1
    8000505c:	00c0006f          	j	80005068 <exit+0x64>
    80005060:	0d878793          	add	a5,a5,216
    80005064:	00b78e63          	beq	a5,a1,80005080 <exit+0x7c>
    80005068:	0007b703          	ld	a4,0(a5)
    8000506c:	fed71ae3          	bne	a4,a3,80005060 <exit+0x5c>
    80005070:	0007b023          	sd	zero,0(a5)
    80005074:	f4a7a423          	sw	a0,-184(a5)
    80005078:	0d878793          	add	a5,a5,216
    8000507c:	feb796e3          	bne	a5,a1,80005068 <exit+0x64>
    80005080:	0046a583          	lw	a1,4(a3)
    80005084:	00004517          	auipc	a0,0x4
    80005088:	b9450513          	add	a0,a0,-1132 # 80008c18 <digits+0xc70>
    8000508c:	9d8fc0ef          	jal	80001264 <printf>
    80005090:	0f50000f          	fence	iorw,ow
    80005094:	0804202f          	amoswap.w	zero,zero,(s0)
    80005098:	00013403          	ld	s0,0(sp)
    8000509c:	00813083          	ld	ra,8(sp)
    800050a0:	01010113          	add	sp,sp,16
    800050a4:	cb9ff06f          	j	80004d5c <yield>
    800050a8:	00008067          	ret

00000000800050ac <wait>:
    800050ac:	fb010113          	add	sp,sp,-80
    800050b0:	01813023          	sd	s8,0(sp)
    800050b4:	00422c17          	auipc	s8,0x422
    800050b8:	ab4c0c13          	add	s8,s8,-1356 # 80426b68 <current_proc>
    800050bc:	02913c23          	sd	s1,56(sp)
    800050c0:	000c3483          	ld	s1,0(s8)
    800050c4:	04113423          	sd	ra,72(sp)
    800050c8:	04813023          	sd	s0,64(sp)
    800050cc:	03213823          	sd	s2,48(sp)
    800050d0:	03313423          	sd	s3,40(sp)
    800050d4:	03413023          	sd	s4,32(sp)
    800050d8:	01513c23          	sd	s5,24(sp)
    800050dc:	01613823          	sd	s6,16(sp)
    800050e0:	01713423          	sd	s7,8(sp)
    800050e4:	10048c63          	beqz	s1,800051fc <wait+0x150>
    800050e8:	00050913          	mv	s2,a0
    800050ec:	00422417          	auipc	s0,0x422
    800050f0:	a7440413          	add	s0,s0,-1420 # 80426b60 <proc_lock>
    800050f4:	00100a13          	li	s4,1
    800050f8:	00500b93          	li	s7,5
    800050fc:	01000a93          	li	s5,16
    80005100:	00422b17          	auipc	s6,0x422
    80005104:	a28b0b13          	add	s6,s6,-1496 # 80426b28 <mem_end>
    80005108:	00400993          	li	s3,4
    8000510c:	000a0793          	mv	a5,s4
    80005110:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80005114:	0007879b          	sext.w	a5,a5
    80005118:	fe079ae3          	bnez	a5,8000510c <wait+0x60>
    8000511c:	00421797          	auipc	a5,0x421
    80005120:	c8c78793          	add	a5,a5,-884 # 80425da8 <proc>
    80005124:	00078613          	mv	a2,a5
    80005128:	00078713          	mv	a4,a5
    8000512c:	00000693          	li	a3,0
    80005130:	0100006f          	j	80005140 <wait+0x94>
    80005134:	0016869b          	addw	a3,a3,1
    80005138:	0d870713          	add	a4,a4,216
    8000513c:	0b568463          	beq	a3,s5,800051e4 <wait+0x138>
    80005140:	0c073803          	ld	a6,192(a4)
    80005144:	fe9818e3          	bne	a6,s1,80005134 <wait+0x88>
    80005148:	00072583          	lw	a1,0(a4)
    8000514c:	ff7594e3          	bne	a1,s7,80005134 <wait+0x88>
    80005150:	0d800793          	li	a5,216
    80005154:	02f686b3          	mul	a3,a3,a5
    80005158:	00d60a33          	add	s4,a2,a3
    8000515c:	004a2983          	lw	s3,4(s4)
    80005160:	02090063          	beqz	s2,80005180 <wait+0xd4>
    80005164:	0284b503          	ld	a0,40(s1)
    80005168:	01068793          	add	a5,a3,16
    8000516c:	00f60633          	add	a2,a2,a5
    80005170:	00400693          	li	a3,4
    80005174:	00090593          	mv	a1,s2
    80005178:	9f8fe0ef          	jal	80003370 <copyout>
    8000517c:	06054c63          	bltz	a0,800051f4 <wait+0x148>
    80005180:	000a0513          	mv	a0,s4
    80005184:	e18ff0ef          	jal	8000479c <free_proc>
    80005188:	00098593          	mv	a1,s3
    8000518c:	00004517          	auipc	a0,0x4
    80005190:	abc50513          	add	a0,a0,-1348 # 80008c48 <digits+0xca0>
    80005194:	8d0fc0ef          	jal	80001264 <printf>
    80005198:	0f50000f          	fence	iorw,ow
    8000519c:	0804202f          	amoswap.w	zero,zero,(s0)
    800051a0:	04813083          	ld	ra,72(sp)
    800051a4:	04013403          	ld	s0,64(sp)
    800051a8:	03813483          	ld	s1,56(sp)
    800051ac:	03013903          	ld	s2,48(sp)
    800051b0:	02013a03          	ld	s4,32(sp)
    800051b4:	01813a83          	ld	s5,24(sp)
    800051b8:	01013b03          	ld	s6,16(sp)
    800051bc:	00813b83          	ld	s7,8(sp)
    800051c0:	00013c03          	ld	s8,0(sp)
    800051c4:	00098513          	mv	a0,s3
    800051c8:	02813983          	ld	s3,40(sp)
    800051cc:	05010113          	add	sp,sp,80
    800051d0:	00008067          	ret
    800051d4:	0007a703          	lw	a4,0(a5)
    800051d8:	02071663          	bnez	a4,80005204 <wait+0x158>
    800051dc:	0d878793          	add	a5,a5,216
    800051e0:	01678a63          	beq	a5,s6,800051f4 <wait+0x148>
    800051e4:	0c07b703          	ld	a4,192(a5)
    800051e8:	fe9706e3          	beq	a4,s1,800051d4 <wait+0x128>
    800051ec:	0d878793          	add	a5,a5,216
    800051f0:	ff679ae3          	bne	a5,s6,800051e4 <wait+0x138>
    800051f4:	0f50000f          	fence	iorw,ow
    800051f8:	0804202f          	amoswap.w	zero,zero,(s0)
    800051fc:	fff00993          	li	s3,-1
    80005200:	fa1ff06f          	j	800051a0 <wait+0xf4>
    80005204:	0f50000f          	fence	iorw,ow
    80005208:	0804202f          	amoswap.w	zero,zero,(s0)
    8000520c:	000c3703          	ld	a4,0(s8)
    80005210:	ee070ee3          	beqz	a4,8000510c <wait+0x60>
    80005214:	000a0793          	mv	a5,s4
    80005218:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    8000521c:	0007879b          	sext.w	a5,a5
    80005220:	fe079ae3          	bnez	a5,80005214 <wait+0x168>
    80005224:	01372023          	sw	s3,0(a4)
    80005228:	0c973423          	sd	s1,200(a4)
    8000522c:	0f50000f          	fence	iorw,ow
    80005230:	0804202f          	amoswap.w	zero,zero,(s0)
    80005234:	b29ff0ef          	jal	80004d5c <yield>
    80005238:	ed5ff06f          	j	8000510c <wait+0x60>

000000008000523c <kill>:
    8000523c:	00421597          	auipc	a1,0x421
    80005240:	b6c58593          	add	a1,a1,-1172 # 80425da8 <proc>
    80005244:	00058793          	mv	a5,a1
    80005248:	00000713          	li	a4,0
    8000524c:	01000613          	li	a2,16
    80005250:	0100006f          	j	80005260 <kill+0x24>
    80005254:	0017071b          	addw	a4,a4,1
    80005258:	0d878793          	add	a5,a5,216
    8000525c:	06c70463          	beq	a4,a2,800052c4 <kill+0x88>
    80005260:	0047a683          	lw	a3,4(a5)
    80005264:	fea698e3          	bne	a3,a0,80005254 <kill+0x18>
    80005268:	0007a683          	lw	a3,0(a5)
    8000526c:	fe0684e3          	beqz	a3,80005254 <kill+0x18>
    80005270:	00422697          	auipc	a3,0x422
    80005274:	8f068693          	add	a3,a3,-1808 # 80426b60 <proc_lock>
    80005278:	00100613          	li	a2,1
    8000527c:	00060793          	mv	a5,a2
    80005280:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80005284:	0007879b          	sext.w	a5,a5
    80005288:	fe079ae3          	bnez	a5,8000527c <kill+0x40>
    8000528c:	0d800793          	li	a5,216
    80005290:	02f70733          	mul	a4,a4,a5
    80005294:	00400613          	li	a2,4
    80005298:	00e587b3          	add	a5,a1,a4
    8000529c:	0007a703          	lw	a4,0(a5)
    800052a0:	00100593          	li	a1,1
    800052a4:	00b7aa23          	sw	a1,20(a5)
    800052a8:	00c71663          	bne	a4,a2,800052b4 <kill+0x78>
    800052ac:	00200713          	li	a4,2
    800052b0:	00e7a023          	sw	a4,0(a5)
    800052b4:	0f50000f          	fence	iorw,ow
    800052b8:	0806a02f          	amoswap.w	zero,zero,(a3)
    800052bc:	00000513          	li	a0,0
    800052c0:	00008067          	ret
    800052c4:	fff00513          	li	a0,-1
    800052c8:	00008067          	ret

00000000800052cc <sleep>:
    800052cc:	00422617          	auipc	a2,0x422
    800052d0:	89c63603          	ld	a2,-1892(a2) # 80426b68 <current_proc>
    800052d4:	02060c63          	beqz	a2,8000530c <sleep+0x40>
    800052d8:	00422717          	auipc	a4,0x422
    800052dc:	88870713          	add	a4,a4,-1912 # 80426b60 <proc_lock>
    800052e0:	00100693          	li	a3,1
    800052e4:	00068793          	mv	a5,a3
    800052e8:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    800052ec:	0007879b          	sext.w	a5,a5
    800052f0:	fe079ae3          	bnez	a5,800052e4 <sleep+0x18>
    800052f4:	00400793          	li	a5,4
    800052f8:	00f62023          	sw	a5,0(a2)
    800052fc:	0ca63423          	sd	a0,200(a2)
    80005300:	0f50000f          	fence	iorw,ow
    80005304:	0807202f          	amoswap.w	zero,zero,(a4)
    80005308:	a55ff06f          	j	80004d5c <yield>
    8000530c:	00008067          	ret

0000000080005310 <wakeup>:
    80005310:	00422697          	auipc	a3,0x422
    80005314:	85068693          	add	a3,a3,-1968 # 80426b60 <proc_lock>
    80005318:	00100713          	li	a4,1
    8000531c:	00070793          	mv	a5,a4
    80005320:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80005324:	0007879b          	sext.w	a5,a5
    80005328:	fe079ae3          	bnez	a5,8000531c <wakeup+0xc>
    8000532c:	00421797          	auipc	a5,0x421
    80005330:	a7c78793          	add	a5,a5,-1412 # 80425da8 <proc>
    80005334:	00421597          	auipc	a1,0x421
    80005338:	7f458593          	add	a1,a1,2036 # 80426b28 <mem_end>
    8000533c:	00400613          	li	a2,4
    80005340:	00200813          	li	a6,2
    80005344:	00c0006f          	j	80005350 <wakeup+0x40>
    80005348:	0d878793          	add	a5,a5,216
    8000534c:	02f58063          	beq	a1,a5,8000536c <wakeup+0x5c>
    80005350:	0007a703          	lw	a4,0(a5)
    80005354:	fec71ae3          	bne	a4,a2,80005348 <wakeup+0x38>
    80005358:	0c87b703          	ld	a4,200(a5)
    8000535c:	fea716e3          	bne	a4,a0,80005348 <wakeup+0x38>
    80005360:	0107a023          	sw	a6,0(a5)
    80005364:	0d878793          	add	a5,a5,216
    80005368:	fef594e3          	bne	a1,a5,80005350 <wakeup+0x40>
    8000536c:	0f50000f          	fence	iorw,ow
    80005370:	0806a02f          	amoswap.w	zero,zero,(a3)
    80005374:	00008067          	ret

0000000080005378 <wakeup_one>:
    80005378:	00421617          	auipc	a2,0x421
    8000537c:	7e860613          	add	a2,a2,2024 # 80426b60 <proc_lock>
    80005380:	00100713          	li	a4,1
    80005384:	00070793          	mv	a5,a4
    80005388:	0cf627af          	amoswap.w.aq	a5,a5,(a2)
    8000538c:	0007879b          	sext.w	a5,a5
    80005390:	fe079ae3          	bnez	a5,80005384 <wakeup_one+0xc>
    80005394:	00421897          	auipc	a7,0x421
    80005398:	a1488893          	add	a7,a7,-1516 # 80425da8 <proc>
    8000539c:	00088793          	mv	a5,a7
    800053a0:	00000713          	li	a4,0
    800053a4:	00400593          	li	a1,4
    800053a8:	01000813          	li	a6,16
    800053ac:	0100006f          	j	800053bc <wakeup_one+0x44>
    800053b0:	0017071b          	addw	a4,a4,1
    800053b4:	0d878793          	add	a5,a5,216
    800053b8:	03070463          	beq	a4,a6,800053e0 <wakeup_one+0x68>
    800053bc:	0007a683          	lw	a3,0(a5)
    800053c0:	feb698e3          	bne	a3,a1,800053b0 <wakeup_one+0x38>
    800053c4:	0c87b683          	ld	a3,200(a5)
    800053c8:	fea694e3          	bne	a3,a0,800053b0 <wakeup_one+0x38>
    800053cc:	0d800793          	li	a5,216
    800053d0:	02f70733          	mul	a4,a4,a5
    800053d4:	00200793          	li	a5,2
    800053d8:	00e888b3          	add	a7,a7,a4
    800053dc:	00f8a023          	sw	a5,0(a7)
    800053e0:	0f50000f          	fence	iorw,ow
    800053e4:	0806202f          	amoswap.w	zero,zero,(a2)
    800053e8:	00008067          	ret

00000000800053ec <myproc>:
    800053ec:	00421517          	auipc	a0,0x421
    800053f0:	77c53503          	ld	a0,1916(a0) # 80426b68 <current_proc>
    800053f4:	00008067          	ret

00000000800053f8 <argint>:
    800053f8:	fe010113          	add	sp,sp,-32
    800053fc:	00813823          	sd	s0,16(sp)
    80005400:	00913423          	sd	s1,8(sp)
    80005404:	00113c23          	sd	ra,24(sp)
    80005408:	00050413          	mv	s0,a0
    8000540c:	00058493          	mv	s1,a1
    80005410:	fddff0ef          	jal	800053ec <myproc>
    80005414:	06050c63          	beqz	a0,8000548c <argint+0x94>
    80005418:	04053683          	ld	a3,64(a0)
    8000541c:	06068863          	beqz	a3,8000548c <argint+0x94>
    80005420:	00500793          	li	a5,5
    80005424:	0687e463          	bltu	a5,s0,8000548c <argint+0x94>
    80005428:	00004717          	auipc	a4,0x4
    8000542c:	84070713          	add	a4,a4,-1984 # 80008c68 <digits+0xcc0>
    80005430:	00241413          	sll	s0,s0,0x2
    80005434:	00e40433          	add	s0,s0,a4
    80005438:	00042783          	lw	a5,0(s0)
    8000543c:	00e787b3          	add	a5,a5,a4
    80005440:	00078067          	jr	a5
    80005444:	0706a783          	lw	a5,112(a3)
    80005448:	00f4a023          	sw	a5,0(s1)
    8000544c:	00000513          	li	a0,0
    80005450:	01813083          	ld	ra,24(sp)
    80005454:	01013403          	ld	s0,16(sp)
    80005458:	00813483          	ld	s1,8(sp)
    8000545c:	02010113          	add	sp,sp,32
    80005460:	00008067          	ret
    80005464:	0786a783          	lw	a5,120(a3)
    80005468:	fe1ff06f          	j	80005448 <argint+0x50>
    8000546c:	0506a783          	lw	a5,80(a3)
    80005470:	fd9ff06f          	j	80005448 <argint+0x50>
    80005474:	0586a783          	lw	a5,88(a3)
    80005478:	fd1ff06f          	j	80005448 <argint+0x50>
    8000547c:	0606a783          	lw	a5,96(a3)
    80005480:	fc9ff06f          	j	80005448 <argint+0x50>
    80005484:	0686a783          	lw	a5,104(a3)
    80005488:	fc1ff06f          	j	80005448 <argint+0x50>
    8000548c:	fff00513          	li	a0,-1
    80005490:	fc1ff06f          	j	80005450 <argint+0x58>

0000000080005494 <argraw>:
    80005494:	fe010113          	add	sp,sp,-32
    80005498:	00813823          	sd	s0,16(sp)
    8000549c:	00913423          	sd	s1,8(sp)
    800054a0:	00113c23          	sd	ra,24(sp)
    800054a4:	00050413          	mv	s0,a0
    800054a8:	00058493          	mv	s1,a1
    800054ac:	f41ff0ef          	jal	800053ec <myproc>
    800054b0:	06050c63          	beqz	a0,80005528 <argraw+0x94>
    800054b4:	04053683          	ld	a3,64(a0)
    800054b8:	06068863          	beqz	a3,80005528 <argraw+0x94>
    800054bc:	00500793          	li	a5,5
    800054c0:	0687e463          	bltu	a5,s0,80005528 <argraw+0x94>
    800054c4:	00003717          	auipc	a4,0x3
    800054c8:	7bc70713          	add	a4,a4,1980 # 80008c80 <digits+0xcd8>
    800054cc:	00241413          	sll	s0,s0,0x2
    800054d0:	00e40433          	add	s0,s0,a4
    800054d4:	00042783          	lw	a5,0(s0)
    800054d8:	00e787b3          	add	a5,a5,a4
    800054dc:	00078067          	jr	a5
    800054e0:	0706b783          	ld	a5,112(a3)
    800054e4:	00f4b023          	sd	a5,0(s1)
    800054e8:	00000513          	li	a0,0
    800054ec:	01813083          	ld	ra,24(sp)
    800054f0:	01013403          	ld	s0,16(sp)
    800054f4:	00813483          	ld	s1,8(sp)
    800054f8:	02010113          	add	sp,sp,32
    800054fc:	00008067          	ret
    80005500:	0786b783          	ld	a5,120(a3)
    80005504:	fe1ff06f          	j	800054e4 <argraw+0x50>
    80005508:	0506b783          	ld	a5,80(a3)
    8000550c:	fd9ff06f          	j	800054e4 <argraw+0x50>
    80005510:	0586b783          	ld	a5,88(a3)
    80005514:	fd1ff06f          	j	800054e4 <argraw+0x50>
    80005518:	0606b783          	ld	a5,96(a3)
    8000551c:	fc9ff06f          	j	800054e4 <argraw+0x50>
    80005520:	0686b783          	ld	a5,104(a3)
    80005524:	fc1ff06f          	j	800054e4 <argraw+0x50>
    80005528:	fff00513          	li	a0,-1
    8000552c:	fc1ff06f          	j	800054ec <argraw+0x58>

0000000080005530 <argaddr>:
    80005530:	fe010113          	add	sp,sp,-32
    80005534:	00813823          	sd	s0,16(sp)
    80005538:	00913423          	sd	s1,8(sp)
    8000553c:	00113c23          	sd	ra,24(sp)
    80005540:	00050413          	mv	s0,a0
    80005544:	00058493          	mv	s1,a1
    80005548:	ea5ff0ef          	jal	800053ec <myproc>
    8000554c:	06050c63          	beqz	a0,800055c4 <argaddr+0x94>
    80005550:	04053683          	ld	a3,64(a0)
    80005554:	06068863          	beqz	a3,800055c4 <argaddr+0x94>
    80005558:	00500793          	li	a5,5
    8000555c:	0687e463          	bltu	a5,s0,800055c4 <argaddr+0x94>
    80005560:	00003717          	auipc	a4,0x3
    80005564:	73870713          	add	a4,a4,1848 # 80008c98 <digits+0xcf0>
    80005568:	00241413          	sll	s0,s0,0x2
    8000556c:	00e40433          	add	s0,s0,a4
    80005570:	00042783          	lw	a5,0(s0)
    80005574:	00e787b3          	add	a5,a5,a4
    80005578:	00078067          	jr	a5
    8000557c:	0706b783          	ld	a5,112(a3)
    80005580:	00f4b023          	sd	a5,0(s1)
    80005584:	00000513          	li	a0,0
    80005588:	01813083          	ld	ra,24(sp)
    8000558c:	01013403          	ld	s0,16(sp)
    80005590:	00813483          	ld	s1,8(sp)
    80005594:	02010113          	add	sp,sp,32
    80005598:	00008067          	ret
    8000559c:	0786b783          	ld	a5,120(a3)
    800055a0:	fe1ff06f          	j	80005580 <argaddr+0x50>
    800055a4:	0506b783          	ld	a5,80(a3)
    800055a8:	fd9ff06f          	j	80005580 <argaddr+0x50>
    800055ac:	0586b783          	ld	a5,88(a3)
    800055b0:	fd1ff06f          	j	80005580 <argaddr+0x50>
    800055b4:	0606b783          	ld	a5,96(a3)
    800055b8:	fc9ff06f          	j	80005580 <argaddr+0x50>
    800055bc:	0686b783          	ld	a5,104(a3)
    800055c0:	fc1ff06f          	j	80005580 <argaddr+0x50>
    800055c4:	fff00513          	li	a0,-1
    800055c8:	fc1ff06f          	j	80005588 <argaddr+0x58>

00000000800055cc <argstr>:
    800055cc:	fd010113          	add	sp,sp,-48
    800055d0:	02813023          	sd	s0,32(sp)
    800055d4:	00058413          	mv	s0,a1
    800055d8:	00810593          	add	a1,sp,8
    800055dc:	00913c23          	sd	s1,24(sp)
    800055e0:	02113423          	sd	ra,40(sp)
    800055e4:	01213823          	sd	s2,16(sp)
    800055e8:	00060493          	mv	s1,a2
    800055ec:	ea9ff0ef          	jal	80005494 <argraw>
    800055f0:	02054e63          	bltz	a0,8000562c <argstr+0x60>
    800055f4:	00813903          	ld	s2,8(sp)
    800055f8:	df5ff0ef          	jal	800053ec <myproc>
    800055fc:	02050863          	beqz	a0,8000562c <argstr+0x60>
    80005600:	02853503          	ld	a0,40(a0)
    80005604:	02050463          	beqz	a0,8000562c <argstr+0x60>
    80005608:	00040593          	mv	a1,s0
    8000560c:	02013403          	ld	s0,32(sp)
    80005610:	02813083          	ld	ra,40(sp)
    80005614:	00048693          	mv	a3,s1
    80005618:	00090613          	mv	a2,s2
    8000561c:	01813483          	ld	s1,24(sp)
    80005620:	01013903          	ld	s2,16(sp)
    80005624:	03010113          	add	sp,sp,48
    80005628:	e61fd06f          	j	80003488 <copyinstr>
    8000562c:	02813083          	ld	ra,40(sp)
    80005630:	02013403          	ld	s0,32(sp)
    80005634:	01813483          	ld	s1,24(sp)
    80005638:	01013903          	ld	s2,16(sp)
    8000563c:	fff00513          	li	a0,-1
    80005640:	03010113          	add	sp,sp,48
    80005644:	00008067          	ret

0000000080005648 <fetchstr>:
    80005648:	fe010113          	add	sp,sp,-32
    8000564c:	00813823          	sd	s0,16(sp)
    80005650:	00913423          	sd	s1,8(sp)
    80005654:	01213023          	sd	s2,0(sp)
    80005658:	00113c23          	sd	ra,24(sp)
    8000565c:	00050493          	mv	s1,a0
    80005660:	00058413          	mv	s0,a1
    80005664:	00060913          	mv	s2,a2
    80005668:	d85ff0ef          	jal	800053ec <myproc>
    8000566c:	02050863          	beqz	a0,8000569c <fetchstr+0x54>
    80005670:	02853503          	ld	a0,40(a0)
    80005674:	02050463          	beqz	a0,8000569c <fetchstr+0x54>
    80005678:	00040593          	mv	a1,s0
    8000567c:	01013403          	ld	s0,16(sp)
    80005680:	01813083          	ld	ra,24(sp)
    80005684:	00090693          	mv	a3,s2
    80005688:	00048613          	mv	a2,s1
    8000568c:	00013903          	ld	s2,0(sp)
    80005690:	00813483          	ld	s1,8(sp)
    80005694:	02010113          	add	sp,sp,32
    80005698:	df1fd06f          	j	80003488 <copyinstr>
    8000569c:	01813083          	ld	ra,24(sp)
    800056a0:	01013403          	ld	s0,16(sp)
    800056a4:	00813483          	ld	s1,8(sp)
    800056a8:	00013903          	ld	s2,0(sp)
    800056ac:	fff00513          	li	a0,-1
    800056b0:	02010113          	add	sp,sp,32
    800056b4:	00008067          	ret

00000000800056b8 <syscall>:
    800056b8:	fe010113          	add	sp,sp,-32
    800056bc:	00113c23          	sd	ra,24(sp)
    800056c0:	00813823          	sd	s0,16(sp)
    800056c4:	00913423          	sd	s1,8(sp)
    800056c8:	01213023          	sd	s2,0(sp)
    800056cc:	d21ff0ef          	jal	800053ec <myproc>
    800056d0:	0a050863          	beqz	a0,80005780 <syscall+0xc8>
    800056d4:	04053483          	ld	s1,64(a0)
    800056d8:	00050413          	mv	s0,a0
    800056dc:	0a048263          	beqz	s1,80005780 <syscall+0xc8>
    800056e0:	0884b683          	ld	a3,136(s1)
    800056e4:	01400793          	li	a5,20
    800056e8:	fff6871b          	addw	a4,a3,-1
    800056ec:	0006869b          	sext.w	a3,a3
    800056f0:	04e7ec63          	bltu	a5,a4,80005748 <syscall+0x90>
    800056f4:	00369793          	sll	a5,a3,0x3
    800056f8:	00003917          	auipc	s2,0x3
    800056fc:	5b890913          	add	s2,s2,1464 # 80008cb0 <syscalls>
    80005700:	00f90933          	add	s2,s2,a5
    80005704:	00093783          	ld	a5,0(s2)
    80005708:	04078063          	beqz	a5,80005748 <syscall+0x90>
    8000570c:	000780e7          	jalr	a5
    80005710:	0b093603          	ld	a2,176(s2)
    80005714:	04a4b823          	sd	a0,80(s1)
    80005718:	04060863          	beqz	a2,80005768 <syscall+0xb0>
    8000571c:	04043783          	ld	a5,64(s0)
    80005720:	00442583          	lw	a1,4(s0)
    80005724:	01013403          	ld	s0,16(sp)
    80005728:	01813083          	ld	ra,24(sp)
    8000572c:	00813483          	ld	s1,8(sp)
    80005730:	00013903          	ld	s2,0(sp)
    80005734:	0507b683          	ld	a3,80(a5)
    80005738:	00003517          	auipc	a0,0x3
    8000573c:	70050513          	add	a0,a0,1792 # 80008e38 <syscall_names+0xd8>
    80005740:	02010113          	add	sp,sp,32
    80005744:	b21fb06f          	j	80001264 <printf>
    80005748:	00442583          	lw	a1,4(s0)
    8000574c:	01840613          	add	a2,s0,24
    80005750:	00003517          	auipc	a0,0x3
    80005754:	6f850513          	add	a0,a0,1784 # 80008e48 <syscall_names+0xe8>
    80005758:	b0dfb0ef          	jal	80001264 <printf>
    8000575c:	04043783          	ld	a5,64(s0)
    80005760:	fff00713          	li	a4,-1
    80005764:	04e7b823          	sd	a4,80(a5)
    80005768:	01813083          	ld	ra,24(sp)
    8000576c:	01013403          	ld	s0,16(sp)
    80005770:	00813483          	ld	s1,8(sp)
    80005774:	00013903          	ld	s2,0(sp)
    80005778:	02010113          	add	sp,sp,32
    8000577c:	00008067          	ret
    80005780:	01013403          	ld	s0,16(sp)
    80005784:	01813083          	ld	ra,24(sp)
    80005788:	00813483          	ld	s1,8(sp)
    8000578c:	00013903          	ld	s2,0(sp)
    80005790:	00003517          	auipc	a0,0x3
    80005794:	68050513          	add	a0,a0,1664 # 80008e10 <syscall_names+0xb0>
    80005798:	02010113          	add	sp,sp,32
    8000579c:	ac9fb06f          	j	80001264 <printf>

00000000800057a0 <sys_fork>:
    800057a0:	ff010113          	add	sp,sp,-16
    800057a4:	00113423          	sd	ra,8(sp)
    800057a8:	e64ff0ef          	jal	80004e0c <fork>
    800057ac:	00813083          	ld	ra,8(sp)
    800057b0:	01010113          	add	sp,sp,16
    800057b4:	00008067          	ret

00000000800057b8 <sys_exit>:
    800057b8:	fe010113          	add	sp,sp,-32
    800057bc:	00c10593          	add	a1,sp,12
    800057c0:	00000513          	li	a0,0
    800057c4:	00113c23          	sd	ra,24(sp)
    800057c8:	c31ff0ef          	jal	800053f8 <argint>
    800057cc:	fff00793          	li	a5,-1
    800057d0:	00054863          	bltz	a0,800057e0 <sys_exit+0x28>
    800057d4:	00c12503          	lw	a0,12(sp)
    800057d8:	82dff0ef          	jal	80005004 <exit>
    800057dc:	00000793          	li	a5,0
    800057e0:	01813083          	ld	ra,24(sp)
    800057e4:	00078513          	mv	a0,a5
    800057e8:	02010113          	add	sp,sp,32
    800057ec:	00008067          	ret

00000000800057f0 <sys_wait>:
    800057f0:	fe010113          	add	sp,sp,-32
    800057f4:	00810593          	add	a1,sp,8
    800057f8:	00000513          	li	a0,0
    800057fc:	00113c23          	sd	ra,24(sp)
    80005800:	d31ff0ef          	jal	80005530 <argaddr>
    80005804:	00050793          	mv	a5,a0
    80005808:	fff00513          	li	a0,-1
    8000580c:	0007c663          	bltz	a5,80005818 <sys_wait+0x28>
    80005810:	00813503          	ld	a0,8(sp)
    80005814:	899ff0ef          	jal	800050ac <wait>
    80005818:	01813083          	ld	ra,24(sp)
    8000581c:	02010113          	add	sp,sp,32
    80005820:	00008067          	ret

0000000080005824 <sys_getpid>:
    80005824:	ff010113          	add	sp,sp,-16
    80005828:	00113423          	sd	ra,8(sp)
    8000582c:	bc1ff0ef          	jal	800053ec <myproc>
    80005830:	00813083          	ld	ra,8(sp)
    80005834:	00452503          	lw	a0,4(a0)
    80005838:	01010113          	add	sp,sp,16
    8000583c:	00008067          	ret

0000000080005840 <sys_sbrk>:
    80005840:	fd010113          	add	sp,sp,-48
    80005844:	02813023          	sd	s0,32(sp)
    80005848:	02113423          	sd	ra,40(sp)
    8000584c:	00913c23          	sd	s1,24(sp)
    80005850:	b9dff0ef          	jal	800053ec <myproc>
    80005854:	00050413          	mv	s0,a0
    80005858:	00c10593          	add	a1,sp,12
    8000585c:	00000513          	li	a0,0
    80005860:	b99ff0ef          	jal	800053f8 <argint>
    80005864:	06054463          	bltz	a0,800058cc <sys_sbrk+0x8c>
    80005868:	03043483          	ld	s1,48(s0)
    8000586c:	00c12783          	lw	a5,12(sp)
    80005870:	00978633          	add	a2,a5,s1
    80005874:	02f04663          	bgtz	a5,800058a0 <sys_sbrk+0x60>
    80005878:	00048713          	mv	a4,s1
    8000587c:	04079063          	bnez	a5,800058bc <sys_sbrk+0x7c>
    80005880:	00e787b3          	add	a5,a5,a4
    80005884:	02813083          	ld	ra,40(sp)
    80005888:	02f43823          	sd	a5,48(s0)
    8000588c:	02013403          	ld	s0,32(sp)
    80005890:	00048513          	mv	a0,s1
    80005894:	01813483          	ld	s1,24(sp)
    80005898:	03010113          	add	sp,sp,48
    8000589c:	00008067          	ret
    800058a0:	02843503          	ld	a0,40(s0)
    800058a4:	00048593          	mv	a1,s1
    800058a8:	d99fd0ef          	jal	80003640 <uvmalloc>
    800058ac:	02050063          	beqz	a0,800058cc <sys_sbrk+0x8c>
    800058b0:	03043703          	ld	a4,48(s0)
    800058b4:	00c12783          	lw	a5,12(sp)
    800058b8:	fc9ff06f          	j	80005880 <sys_sbrk+0x40>
    800058bc:	02843503          	ld	a0,40(s0)
    800058c0:	00048593          	mv	a1,s1
    800058c4:	d05fd0ef          	jal	800035c8 <uvmdealloc>
    800058c8:	fe0514e3          	bnez	a0,800058b0 <sys_sbrk+0x70>
    800058cc:	02813083          	ld	ra,40(sp)
    800058d0:	02013403          	ld	s0,32(sp)
    800058d4:	fff00493          	li	s1,-1
    800058d8:	00048513          	mv	a0,s1
    800058dc:	01813483          	ld	s1,24(sp)
    800058e0:	03010113          	add	sp,sp,48
    800058e4:	00008067          	ret

00000000800058e8 <sys_sleep>:
    800058e8:	fe010113          	add	sp,sp,-32
    800058ec:	00c10593          	add	a1,sp,12
    800058f0:	00000513          	li	a0,0
    800058f4:	00113c23          	sd	ra,24(sp)
    800058f8:	00813823          	sd	s0,16(sp)
    800058fc:	afdff0ef          	jal	800053f8 <argint>
    80005900:	04054263          	bltz	a0,80005944 <sys_sleep+0x5c>
    80005904:	c5cfe0ef          	jal	80003d60 <get_ticks>
    80005908:	00050413          	mv	s0,a0
    8000590c:	0140006f          	j	80005920 <sys_sleep+0x38>
    80005910:	addff0ef          	jal	800053ec <myproc>
    80005914:	01452783          	lw	a5,20(a0)
    80005918:	02079663          	bnez	a5,80005944 <sys_sleep+0x5c>
    8000591c:	c40ff0ef          	jal	80004d5c <yield>
    80005920:	c40fe0ef          	jal	80003d60 <get_ticks>
    80005924:	00c12783          	lw	a5,12(sp)
    80005928:	40850533          	sub	a0,a0,s0
    8000592c:	fef562e3          	bltu	a0,a5,80005910 <sys_sleep+0x28>
    80005930:	01813083          	ld	ra,24(sp)
    80005934:	01013403          	ld	s0,16(sp)
    80005938:	00000513          	li	a0,0
    8000593c:	02010113          	add	sp,sp,32
    80005940:	00008067          	ret
    80005944:	01813083          	ld	ra,24(sp)
    80005948:	01013403          	ld	s0,16(sp)
    8000594c:	fff00513          	li	a0,-1
    80005950:	02010113          	add	sp,sp,32
    80005954:	00008067          	ret

0000000080005958 <sys_kill>:
    80005958:	fe010113          	add	sp,sp,-32
    8000595c:	00c10593          	add	a1,sp,12
    80005960:	00000513          	li	a0,0
    80005964:	00113c23          	sd	ra,24(sp)
    80005968:	a91ff0ef          	jal	800053f8 <argint>
    8000596c:	00050793          	mv	a5,a0
    80005970:	fff00513          	li	a0,-1
    80005974:	0007c663          	bltz	a5,80005980 <sys_kill+0x28>
    80005978:	00c12503          	lw	a0,12(sp)
    8000597c:	8c1ff0ef          	jal	8000523c <kill>
    80005980:	01813083          	ld	ra,24(sp)
    80005984:	02010113          	add	sp,sp,32
    80005988:	00008067          	ret

000000008000598c <sys_uptime>:
    8000598c:	bd4fe06f          	j	80003d60 <get_ticks>

0000000080005990 <sys_pipe>:
    80005990:	ff010113          	add	sp,sp,-16
    80005994:	00003517          	auipc	a0,0x3
    80005998:	57c50513          	add	a0,a0,1404 # 80008f10 <syscall_names+0x1b0>
    8000599c:	00113423          	sd	ra,8(sp)
    800059a0:	8c5fb0ef          	jal	80001264 <printf>
    800059a4:	00813083          	ld	ra,8(sp)
    800059a8:	fff00513          	li	a0,-1
    800059ac:	01010113          	add	sp,sp,16
    800059b0:	00008067          	ret

00000000800059b4 <sys_read>:
    800059b4:	ff010113          	add	sp,sp,-16
    800059b8:	00003517          	auipc	a0,0x3
    800059bc:	57850513          	add	a0,a0,1400 # 80008f30 <syscall_names+0x1d0>
    800059c0:	00113423          	sd	ra,8(sp)
    800059c4:	8a1fb0ef          	jal	80001264 <printf>
    800059c8:	00813083          	ld	ra,8(sp)
    800059cc:	fff00513          	li	a0,-1
    800059d0:	01010113          	add	sp,sp,16
    800059d4:	00008067          	ret

00000000800059d8 <sys_exec>:
    800059d8:	ff010113          	add	sp,sp,-16
    800059dc:	00003517          	auipc	a0,0x3
    800059e0:	57450513          	add	a0,a0,1396 # 80008f50 <syscall_names+0x1f0>
    800059e4:	00113423          	sd	ra,8(sp)
    800059e8:	87dfb0ef          	jal	80001264 <printf>
    800059ec:	00813083          	ld	ra,8(sp)
    800059f0:	fff00513          	li	a0,-1
    800059f4:	01010113          	add	sp,sp,16
    800059f8:	00008067          	ret

00000000800059fc <sys_fstat>:
    800059fc:	ff010113          	add	sp,sp,-16
    80005a00:	00003517          	auipc	a0,0x3
    80005a04:	57050513          	add	a0,a0,1392 # 80008f70 <syscall_names+0x210>
    80005a08:	00113423          	sd	ra,8(sp)
    80005a0c:	859fb0ef          	jal	80001264 <printf>
    80005a10:	00813083          	ld	ra,8(sp)
    80005a14:	fff00513          	li	a0,-1
    80005a18:	01010113          	add	sp,sp,16
    80005a1c:	00008067          	ret

0000000080005a20 <sys_chdir>:
    80005a20:	ff010113          	add	sp,sp,-16
    80005a24:	00003517          	auipc	a0,0x3
    80005a28:	56c50513          	add	a0,a0,1388 # 80008f90 <syscall_names+0x230>
    80005a2c:	00113423          	sd	ra,8(sp)
    80005a30:	835fb0ef          	jal	80001264 <printf>
    80005a34:	00813083          	ld	ra,8(sp)
    80005a38:	fff00513          	li	a0,-1
    80005a3c:	01010113          	add	sp,sp,16
    80005a40:	00008067          	ret

0000000080005a44 <sys_dup>:
    80005a44:	ff010113          	add	sp,sp,-16
    80005a48:	00003517          	auipc	a0,0x3
    80005a4c:	56850513          	add	a0,a0,1384 # 80008fb0 <syscall_names+0x250>
    80005a50:	00113423          	sd	ra,8(sp)
    80005a54:	811fb0ef          	jal	80001264 <printf>
    80005a58:	00813083          	ld	ra,8(sp)
    80005a5c:	fff00513          	li	a0,-1
    80005a60:	01010113          	add	sp,sp,16
    80005a64:	00008067          	ret

0000000080005a68 <sys_open>:
    80005a68:	ff010113          	add	sp,sp,-16
    80005a6c:	00003517          	auipc	a0,0x3
    80005a70:	56450513          	add	a0,a0,1380 # 80008fd0 <syscall_names+0x270>
    80005a74:	00113423          	sd	ra,8(sp)
    80005a78:	fecfb0ef          	jal	80001264 <printf>
    80005a7c:	00813083          	ld	ra,8(sp)
    80005a80:	fff00513          	li	a0,-1
    80005a84:	01010113          	add	sp,sp,16
    80005a88:	00008067          	ret

0000000080005a8c <sys_write>:
    80005a8c:	fe010113          	add	sp,sp,-32
    80005a90:	00810593          	add	a1,sp,8
    80005a94:	00100513          	li	a0,1
    80005a98:	00113c23          	sd	ra,24(sp)
    80005a9c:	a95ff0ef          	jal	80005530 <argaddr>
    80005aa0:	02054c63          	bltz	a0,80005ad8 <sys_write+0x4c>
    80005aa4:	00410593          	add	a1,sp,4
    80005aa8:	00200513          	li	a0,2
    80005aac:	94dff0ef          	jal	800053f8 <argint>
    80005ab0:	02054463          	bltz	a0,80005ad8 <sys_write+0x4c>
    80005ab4:	00412603          	lw	a2,4(sp)
    80005ab8:	00813583          	ld	a1,8(sp)
    80005abc:	00003517          	auipc	a0,0x3
    80005ac0:	53450513          	add	a0,a0,1332 # 80008ff0 <syscall_names+0x290>
    80005ac4:	fa0fb0ef          	jal	80001264 <printf>
    80005ac8:	01813083          	ld	ra,24(sp)
    80005acc:	00412503          	lw	a0,4(sp)
    80005ad0:	02010113          	add	sp,sp,32
    80005ad4:	00008067          	ret
    80005ad8:	01813083          	ld	ra,24(sp)
    80005adc:	fff00513          	li	a0,-1
    80005ae0:	02010113          	add	sp,sp,32
    80005ae4:	00008067          	ret

0000000080005ae8 <sys_mknod>:
    80005ae8:	ff010113          	add	sp,sp,-16
    80005aec:	00003517          	auipc	a0,0x3
    80005af0:	52450513          	add	a0,a0,1316 # 80009010 <syscall_names+0x2b0>
    80005af4:	00113423          	sd	ra,8(sp)
    80005af8:	f6cfb0ef          	jal	80001264 <printf>
    80005afc:	00813083          	ld	ra,8(sp)
    80005b00:	fff00513          	li	a0,-1
    80005b04:	01010113          	add	sp,sp,16
    80005b08:	00008067          	ret

0000000080005b0c <sys_unlink>:
    80005b0c:	ff010113          	add	sp,sp,-16
    80005b10:	00003517          	auipc	a0,0x3
    80005b14:	52050513          	add	a0,a0,1312 # 80009030 <syscall_names+0x2d0>
    80005b18:	00113423          	sd	ra,8(sp)
    80005b1c:	f48fb0ef          	jal	80001264 <printf>
    80005b20:	00813083          	ld	ra,8(sp)
    80005b24:	fff00513          	li	a0,-1
    80005b28:	01010113          	add	sp,sp,16
    80005b2c:	00008067          	ret

0000000080005b30 <sys_link>:
    80005b30:	ff010113          	add	sp,sp,-16
    80005b34:	00003517          	auipc	a0,0x3
    80005b38:	51c50513          	add	a0,a0,1308 # 80009050 <syscall_names+0x2f0>
    80005b3c:	00113423          	sd	ra,8(sp)
    80005b40:	f24fb0ef          	jal	80001264 <printf>
    80005b44:	00813083          	ld	ra,8(sp)
    80005b48:	fff00513          	li	a0,-1
    80005b4c:	01010113          	add	sp,sp,16
    80005b50:	00008067          	ret

0000000080005b54 <sys_mkdir>:
    80005b54:	ff010113          	add	sp,sp,-16
    80005b58:	00003517          	auipc	a0,0x3
    80005b5c:	51850513          	add	a0,a0,1304 # 80009070 <syscall_names+0x310>
    80005b60:	00113423          	sd	ra,8(sp)
    80005b64:	f00fb0ef          	jal	80001264 <printf>
    80005b68:	00813083          	ld	ra,8(sp)
    80005b6c:	fff00513          	li	a0,-1
    80005b70:	01010113          	add	sp,sp,16
    80005b74:	00008067          	ret

0000000080005b78 <sys_close>:
    80005b78:	ff010113          	add	sp,sp,-16
    80005b7c:	00003517          	auipc	a0,0x3
    80005b80:	51450513          	add	a0,a0,1300 # 80009090 <syscall_names+0x330>
    80005b84:	00113423          	sd	ra,8(sp)
    80005b88:	edcfb0ef          	jal	80001264 <printf>
    80005b8c:	00813083          	ld	ra,8(sp)
    80005b90:	fff00513          	li	a0,-1
    80005b94:	01010113          	add	sp,sp,16
    80005b98:	00008067          	ret
    80005b9c:	0000                	.2byte	0x0
	...

0000000080005ba0 <machinevec>:
    80005ba0:	f0810113          	add	sp,sp,-248
    80005ba4:	00113023          	sd	ra,0(sp)
    80005ba8:	00313823          	sd	gp,16(sp)
    80005bac:	00413c23          	sd	tp,24(sp)
    80005bb0:	02513023          	sd	t0,32(sp)
    80005bb4:	02613423          	sd	t1,40(sp)
    80005bb8:	02713823          	sd	t2,48(sp)
    80005bbc:	02813c23          	sd	s0,56(sp)
    80005bc0:	04913023          	sd	s1,64(sp)
    80005bc4:	04a13423          	sd	a0,72(sp)
    80005bc8:	04b13823          	sd	a1,80(sp)
    80005bcc:	04c13c23          	sd	a2,88(sp)
    80005bd0:	06d13023          	sd	a3,96(sp)
    80005bd4:	06e13423          	sd	a4,104(sp)
    80005bd8:	06f13823          	sd	a5,112(sp)
    80005bdc:	07013c23          	sd	a6,120(sp)
    80005be0:	09113023          	sd	a7,128(sp)
    80005be4:	09213423          	sd	s2,136(sp)
    80005be8:	09313823          	sd	s3,144(sp)
    80005bec:	09413c23          	sd	s4,152(sp)
    80005bf0:	0b513023          	sd	s5,160(sp)
    80005bf4:	0b613423          	sd	s6,168(sp)
    80005bf8:	0b713823          	sd	s7,176(sp)
    80005bfc:	0b813c23          	sd	s8,184(sp)
    80005c00:	0d913023          	sd	s9,192(sp)
    80005c04:	0da13423          	sd	s10,200(sp)
    80005c08:	0db13823          	sd	s11,208(sp)
    80005c0c:	0dc13c23          	sd	t3,216(sp)
    80005c10:	0fd13023          	sd	t4,224(sp)
    80005c14:	0fe13423          	sd	t5,232(sp)
    80005c18:	0ff13823          	sd	t6,240(sp)
    80005c1c:	0f810293          	add	t0,sp,248
    80005c20:	00513423          	sd	t0,8(sp)
    80005c24:	34202573          	csrr	a0,mcause
    80005c28:	fff0029b          	addw	t0,zero,-1
    80005c2c:	03f29293          	sll	t0,t0,0x3f
    80005c30:	00728293          	add	t0,t0,7
    80005c34:	00551663          	bne	a0,t0,80005c40 <interrupt_return>
    80005c38:	934fe0ef          	jal	80003d6c <machine_timer_handler>
    80005c3c:	0040006f          	j	80005c40 <interrupt_return>

0000000080005c40 <interrupt_return>:
    80005c40:	00013083          	ld	ra,0(sp)
    80005c44:	01013183          	ld	gp,16(sp)
    80005c48:	01813203          	ld	tp,24(sp)
    80005c4c:	02013283          	ld	t0,32(sp)
    80005c50:	02813303          	ld	t1,40(sp)
    80005c54:	03013383          	ld	t2,48(sp)
    80005c58:	03813403          	ld	s0,56(sp)
    80005c5c:	04013483          	ld	s1,64(sp)
    80005c60:	04813503          	ld	a0,72(sp)
    80005c64:	05013583          	ld	a1,80(sp)
    80005c68:	05813603          	ld	a2,88(sp)
    80005c6c:	06013683          	ld	a3,96(sp)
    80005c70:	06813703          	ld	a4,104(sp)
    80005c74:	07013783          	ld	a5,112(sp)
    80005c78:	07813803          	ld	a6,120(sp)
    80005c7c:	08013883          	ld	a7,128(sp)
    80005c80:	08813903          	ld	s2,136(sp)
    80005c84:	09013983          	ld	s3,144(sp)
    80005c88:	09813a03          	ld	s4,152(sp)
    80005c8c:	0a013a83          	ld	s5,160(sp)
    80005c90:	0a813b03          	ld	s6,168(sp)
    80005c94:	0b013b83          	ld	s7,176(sp)
    80005c98:	0b813c03          	ld	s8,184(sp)
    80005c9c:	0c013c83          	ld	s9,192(sp)
    80005ca0:	0c813d03          	ld	s10,200(sp)
    80005ca4:	0d013d83          	ld	s11,208(sp)
    80005ca8:	0d813e03          	ld	t3,216(sp)
    80005cac:	0e013e83          	ld	t4,224(sp)
    80005cb0:	0e813f03          	ld	t5,232(sp)
    80005cb4:	0f013f83          	ld	t6,240(sp)
    80005cb8:	00813103          	ld	sp,8(sp)
    80005cbc:	30200073          	mret

0000000080005cc0 <kernelvec>:
    80005cc0:	ef010113          	add	sp,sp,-272
    80005cc4:	00013023          	sd	zero,0(sp)
    80005cc8:	00113423          	sd	ra,8(sp)
    80005ccc:	00313c23          	sd	gp,24(sp)
    80005cd0:	02413023          	sd	tp,32(sp)
    80005cd4:	02513423          	sd	t0,40(sp)
    80005cd8:	02613823          	sd	t1,48(sp)
    80005cdc:	02713c23          	sd	t2,56(sp)
    80005ce0:	04813023          	sd	s0,64(sp)
    80005ce4:	04913423          	sd	s1,72(sp)
    80005ce8:	04a13823          	sd	a0,80(sp)
    80005cec:	04b13c23          	sd	a1,88(sp)
    80005cf0:	06c13023          	sd	a2,96(sp)
    80005cf4:	06d13423          	sd	a3,104(sp)
    80005cf8:	06e13823          	sd	a4,112(sp)
    80005cfc:	06f13c23          	sd	a5,120(sp)
    80005d00:	09013023          	sd	a6,128(sp)
    80005d04:	09113423          	sd	a7,136(sp)
    80005d08:	09213823          	sd	s2,144(sp)
    80005d0c:	09313c23          	sd	s3,152(sp)
    80005d10:	0b413023          	sd	s4,160(sp)
    80005d14:	0b513423          	sd	s5,168(sp)
    80005d18:	0b613823          	sd	s6,176(sp)
    80005d1c:	0b713c23          	sd	s7,184(sp)
    80005d20:	0d813023          	sd	s8,192(sp)
    80005d24:	0d913423          	sd	s9,200(sp)
    80005d28:	0da13823          	sd	s10,208(sp)
    80005d2c:	0db13c23          	sd	s11,216(sp)
    80005d30:	0fc13023          	sd	t3,224(sp)
    80005d34:	0fd13423          	sd	t4,232(sp)
    80005d38:	0fe13823          	sd	t5,240(sp)
    80005d3c:	0ff13c23          	sd	t6,248(sp)
    80005d40:	11010293          	add	t0,sp,272
    80005d44:	00513823          	sd	t0,16(sp)
    80005d48:	141022f3          	csrr	t0,sepc
    80005d4c:	10513023          	sd	t0,256(sp)
    80005d50:	142022f3          	csrr	t0,scause
    80005d54:	10513423          	sd	t0,264(sp)
    80005d58:	d84fe0ef          	jal	800042dc <kerneltrap>
    80005d5c:	00813083          	ld	ra,8(sp)
    80005d60:	01813183          	ld	gp,24(sp)
    80005d64:	02013203          	ld	tp,32(sp)
    80005d68:	02813283          	ld	t0,40(sp)
    80005d6c:	03013303          	ld	t1,48(sp)
    80005d70:	03813383          	ld	t2,56(sp)
    80005d74:	04013403          	ld	s0,64(sp)
    80005d78:	04813483          	ld	s1,72(sp)
    80005d7c:	05013503          	ld	a0,80(sp)
    80005d80:	05813583          	ld	a1,88(sp)
    80005d84:	06013603          	ld	a2,96(sp)
    80005d88:	06813683          	ld	a3,104(sp)
    80005d8c:	07013703          	ld	a4,112(sp)
    80005d90:	07813783          	ld	a5,120(sp)
    80005d94:	08013803          	ld	a6,128(sp)
    80005d98:	08813883          	ld	a7,136(sp)
    80005d9c:	09013903          	ld	s2,144(sp)
    80005da0:	09813983          	ld	s3,152(sp)
    80005da4:	0a013a03          	ld	s4,160(sp)
    80005da8:	0a813a83          	ld	s5,168(sp)
    80005dac:	0b013b03          	ld	s6,176(sp)
    80005db0:	0b813b83          	ld	s7,184(sp)
    80005db4:	0c013c03          	ld	s8,192(sp)
    80005db8:	0c813c83          	ld	s9,200(sp)
    80005dbc:	0d013d03          	ld	s10,208(sp)
    80005dc0:	0d813d83          	ld	s11,216(sp)
    80005dc4:	0e013e03          	ld	t3,224(sp)
    80005dc8:	0e813e83          	ld	t4,232(sp)
    80005dcc:	0f013f03          	ld	t5,240(sp)
    80005dd0:	0f813f83          	ld	t6,248(sp)
    80005dd4:	10013283          	ld	t0,256(sp)
    80005dd8:	14129073          	csrw	sepc,t0
    80005ddc:	10813283          	ld	t0,264(sp)
    80005de0:	14229073          	csrw	scause,t0
    80005de4:	01013103          	ld	sp,16(sp)
    80005de8:	10200073          	sret
    80005dec:	0000                	.2byte	0x0
	...

0000000080005df0 <uservec>:
    80005df0:	00010293          	mv	t0,sp
    80005df4:	ef010113          	add	sp,sp,-272
    80005df8:	00513823          	sd	t0,16(sp)
    80005dfc:	00113423          	sd	ra,8(sp)
    80005e00:	00313c23          	sd	gp,24(sp)
    80005e04:	02413023          	sd	tp,32(sp)
    80005e08:	02513423          	sd	t0,40(sp)
    80005e0c:	02613823          	sd	t1,48(sp)
    80005e10:	02713c23          	sd	t2,56(sp)
    80005e14:	04813023          	sd	s0,64(sp)
    80005e18:	04913423          	sd	s1,72(sp)
    80005e1c:	04a13823          	sd	a0,80(sp)
    80005e20:	04b13c23          	sd	a1,88(sp)
    80005e24:	06c13023          	sd	a2,96(sp)
    80005e28:	06d13423          	sd	a3,104(sp)
    80005e2c:	06e13823          	sd	a4,112(sp)
    80005e30:	06f13c23          	sd	a5,120(sp)
    80005e34:	09013023          	sd	a6,128(sp)
    80005e38:	09113423          	sd	a7,136(sp)
    80005e3c:	09213823          	sd	s2,144(sp)
    80005e40:	09313c23          	sd	s3,152(sp)
    80005e44:	0b413023          	sd	s4,160(sp)
    80005e48:	0b513423          	sd	s5,168(sp)
    80005e4c:	0b613823          	sd	s6,176(sp)
    80005e50:	0b713c23          	sd	s7,184(sp)
    80005e54:	0d813023          	sd	s8,192(sp)
    80005e58:	0d913423          	sd	s9,200(sp)
    80005e5c:	0da13823          	sd	s10,208(sp)
    80005e60:	0db13c23          	sd	s11,216(sp)
    80005e64:	0fc13023          	sd	t3,224(sp)
    80005e68:	0fd13423          	sd	t4,232(sp)
    80005e6c:	0fe13823          	sd	t5,240(sp)
    80005e70:	0ff13c23          	sd	t6,248(sp)
    80005e74:	10002373          	csrr	t1,sstatus
    80005e78:	10613023          	sd	t1,256(sp)
    80005e7c:	14102373          	csrr	t1,sepc
    80005e80:	10613423          	sd	t1,264(sp)
    80005e84:	da0fe0ef          	jal	80004424 <usertrap>
    80005e88:	00813083          	ld	ra,8(sp)
    80005e8c:	01813183          	ld	gp,24(sp)
    80005e90:	02013203          	ld	tp,32(sp)
    80005e94:	02813283          	ld	t0,40(sp)
    80005e98:	03013303          	ld	t1,48(sp)
    80005e9c:	03813383          	ld	t2,56(sp)
    80005ea0:	04013403          	ld	s0,64(sp)
    80005ea4:	04813483          	ld	s1,72(sp)
    80005ea8:	05013503          	ld	a0,80(sp)
    80005eac:	05813583          	ld	a1,88(sp)
    80005eb0:	06013603          	ld	a2,96(sp)
    80005eb4:	06813683          	ld	a3,104(sp)
    80005eb8:	07013703          	ld	a4,112(sp)
    80005ebc:	07813783          	ld	a5,120(sp)
    80005ec0:	08013803          	ld	a6,128(sp)
    80005ec4:	08813883          	ld	a7,136(sp)
    80005ec8:	09013903          	ld	s2,144(sp)
    80005ecc:	09813983          	ld	s3,152(sp)
    80005ed0:	0a013a03          	ld	s4,160(sp)
    80005ed4:	0a813a83          	ld	s5,168(sp)
    80005ed8:	0b013b03          	ld	s6,176(sp)
    80005edc:	0b813b83          	ld	s7,184(sp)
    80005ee0:	0c013c03          	ld	s8,192(sp)
    80005ee4:	0c813c83          	ld	s9,200(sp)
    80005ee8:	0d013d03          	ld	s10,208(sp)
    80005eec:	0d813d83          	ld	s11,216(sp)
    80005ef0:	0e013e03          	ld	t3,224(sp)
    80005ef4:	0e813e83          	ld	t4,232(sp)
    80005ef8:	0f013f03          	ld	t5,240(sp)
    80005efc:	0f813f83          	ld	t6,248(sp)
    80005f00:	10013303          	ld	t1,256(sp)
    80005f04:	10031073          	csrw	sstatus,t1
    80005f08:	10813303          	ld	t1,264(sp)
    80005f0c:	14131073          	csrw	sepc,t1
    80005f10:	01013103          	ld	sp,16(sp)
    80005f14:	10200073          	sret
	...

0000000080005f20 <switch_context>:
    80005f20:	00153023          	sd	ra,0(a0)
    80005f24:	00253423          	sd	sp,8(a0)
    80005f28:	00853823          	sd	s0,16(a0)
    80005f2c:	00953c23          	sd	s1,24(a0)
    80005f30:	03253023          	sd	s2,32(a0)
    80005f34:	03353423          	sd	s3,40(a0)
    80005f38:	03453823          	sd	s4,48(a0)
    80005f3c:	03553c23          	sd	s5,56(a0)
    80005f40:	05653023          	sd	s6,64(a0)
    80005f44:	05753423          	sd	s7,72(a0)
    80005f48:	05853823          	sd	s8,80(a0)
    80005f4c:	05953c23          	sd	s9,88(a0)
    80005f50:	07a53023          	sd	s10,96(a0)
    80005f54:	07b53423          	sd	s11,104(a0)
    80005f58:	0005b083          	ld	ra,0(a1)
    80005f5c:	0085b103          	ld	sp,8(a1)
    80005f60:	0105b403          	ld	s0,16(a1)
    80005f64:	0185b483          	ld	s1,24(a1)
    80005f68:	0205b903          	ld	s2,32(a1)
    80005f6c:	0285b983          	ld	s3,40(a1)
    80005f70:	0305ba03          	ld	s4,48(a1)
    80005f74:	0385ba83          	ld	s5,56(a1)
    80005f78:	0405bb03          	ld	s6,64(a1)
    80005f7c:	0485bb83          	ld	s7,72(a1)
    80005f80:	0505bc03          	ld	s8,80(a1)
    80005f84:	0585bc83          	ld	s9,88(a1)
    80005f88:	0605bd03          	ld	s10,96(a1)
    80005f8c:	0685bd83          	ld	s11,104(a1)
    80005f90:	00008067          	ret
