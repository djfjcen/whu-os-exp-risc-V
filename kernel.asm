
kernel.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	100002b7          	lui	t0,0x10000
    80000004:	05300313          	li	t1,83
    80000008:	00628023          	sb	t1,0(t0) # 10000000 <_entry-0x70000000>
    8000000c:	00011117          	auipc	sp,0x11
    80000010:	ff410113          	add	sp,sp,-12 # 80011000 <full>
    80000014:	05000313          	li	t1,80
    80000018:	00628023          	sb	t1,0(t0)
    8000001c:	00007297          	auipc	t0,0x7
    80000020:	99428293          	add	t0,t0,-1644 # 800069b0 <machinevec>
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
    80000064:	39830313          	add	t1,t1,920 # 804263f8 <bss_end>

0000000080000068 <bss_clear>:
    80000068:	00628863          	beq	t0,t1,80000078 <bss_done>
    8000006c:	0002b023          	sd	zero,0(t0)
    80000070:	00828293          	add	t0,t0,8
    80000074:	ff5ff06f          	j	80000068 <bss_clear>

0000000080000078 <bss_done>:
    80000078:	0a4020ef          	jal	8000211c <main>

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
    800000a0:	375050ef          	jal	80005c14 <get_pid>
    800000a4:	00050913          	mv	s2,a0
    800000a8:	00000493          	li	s1,0
    800000ac:	00007a17          	auipc	s4,0x7
    800000b0:	f54a0a13          	add	s4,s4,-172 # 80007000 <rodata_start>
    800000b4:	69f40413          	add	s0,s0,1695 # 1869f <_entry-0x7ffe7961>
    800000b8:	00500993          	li	s3,5
    800000bc:	00048613          	mv	a2,s1
    800000c0:	00090593          	mv	a1,s2
    800000c4:	000a0513          	mv	a0,s4
    800000c8:	694020ef          	jal	8000275c <printf>
    800000cc:	00012623          	sw	zero,12(sp)
    800000d0:	00c12783          	lw	a5,12(sp)
    800000d4:	00f44c63          	blt	s0,a5,800000ec <rr_worker+0x6c>
    800000d8:	00c12783          	lw	a5,12(sp)
    800000dc:	0017879b          	addw	a5,a5,1
    800000e0:	00f12623          	sw	a5,12(sp)
    800000e4:	00c12783          	lw	a5,12(sp)
    800000e8:	fef458e3          	bge	s0,a5,800000d8 <rr_worker+0x58>
    800000ec:	0014849b          	addw	s1,s1,1
    800000f0:	7a5050ef          	jal	80006094 <yield>
    800000f4:	fd3494e3          	bne	s1,s3,800000bc <rr_worker+0x3c>
    800000f8:	00090593          	mv	a1,s2
    800000fc:	00007517          	auipc	a0,0x7
    80000100:	f2450513          	add	a0,a0,-220 # 80007020 <rodata_start+0x20>
    80000104:	658020ef          	jal	8000275c <printf>
    80000108:	03013403          	ld	s0,48(sp)
    8000010c:	03813083          	ld	ra,56(sp)
    80000110:	02813483          	ld	s1,40(sp)
    80000114:	02013903          	ld	s2,32(sp)
    80000118:	01813983          	ld	s3,24(sp)
    8000011c:	01013a03          	ld	s4,16(sp)
    80000120:	00000513          	li	a0,0
    80000124:	04010113          	add	sp,sp,64
    80000128:	25c0606f          	j	80006384 <exit>

000000008000012c <consumer>:
    8000012c:	f9010113          	add	sp,sp,-112
    80000130:	06813023          	sd	s0,96(sp)
    80000134:	04913c23          	sd	s1,88(sp)
    80000138:	05213823          	sd	s2,80(sp)
    8000013c:	05313423          	sd	s3,72(sp)
    80000140:	05413023          	sd	s4,64(sp)
    80000144:	03513c23          	sd	s5,56(sp)
    80000148:	03613823          	sd	s6,48(sp)
    8000014c:	03713423          	sd	s7,40(sp)
    80000150:	03813023          	sd	s8,32(sp)
    80000154:	01913c23          	sd	s9,24(sp)
    80000158:	06113423          	sd	ra,104(sp)
    8000015c:	00018cb7          	lui	s9,0x18
    80000160:	2b5050ef          	jal	80005c14 <get_pid>
    80000164:	00050913          	mv	s2,a0
    80000168:	00300493          	li	s1,3
    8000016c:	00011a17          	auipc	s4,0x11
    80000170:	e94a0a13          	add	s4,s4,-364 # 80011000 <full>
    80000174:	00426417          	auipc	s0,0x426
    80000178:	23440413          	add	s0,s0,564 # 804263a8 <out>
    8000017c:	00007c17          	auipc	s8,0x7
    80000180:	ec4c0c13          	add	s8,s8,-316 # 80007040 <rodata_start+0x40>
    80000184:	00011997          	auipc	s3,0x11
    80000188:	e9c98993          	add	s3,s3,-356 # 80011020 <mutex>
    8000018c:	00007b97          	auipc	s7,0x7
    80000190:	ed4b8b93          	add	s7,s7,-300 # 80007060 <rodata_start+0x60>
    80000194:	00500b13          	li	s6,5
    80000198:	00011a97          	auipc	s5,0x11
    8000019c:	ec0a8a93          	add	s5,s5,-320 # 80011058 <empty>
    800001a0:	69fc8c93          	add	s9,s9,1695 # 1869f <_entry-0x7ffe7961>
    800001a4:	00090593          	mv	a1,s2
    800001a8:	000c0513          	mv	a0,s8
    800001ac:	5b0020ef          	jal	8000275c <printf>
    800001b0:	000a0513          	mv	a0,s4
    800001b4:	5b0060ef          	jal	80006764 <sem_wait>
    800001b8:	00098513          	mv	a0,s3
    800001bc:	5a8060ef          	jal	80006764 <sem_wait>
    800001c0:	00042683          	lw	a3,0(s0)
    800001c4:	00090593          	mv	a1,s2
    800001c8:	000b8513          	mv	a0,s7
    800001cc:	00269793          	sll	a5,a3,0x2
    800001d0:	00fa07b3          	add	a5,s4,a5
    800001d4:	0407a603          	lw	a2,64(a5)
    800001d8:	584020ef          	jal	8000275c <printf>
    800001dc:	00042783          	lw	a5,0(s0)
    800001e0:	00098513          	mv	a0,s3
    800001e4:	0017879b          	addw	a5,a5,1
    800001e8:	0367e7bb          	remw	a5,a5,s6
    800001ec:	00f42023          	sw	a5,0(s0)
    800001f0:	690060ef          	jal	80006880 <sem_post>
    800001f4:	000a8513          	mv	a0,s5
    800001f8:	688060ef          	jal	80006880 <sem_post>
    800001fc:	00012623          	sw	zero,12(sp)
    80000200:	00c12783          	lw	a5,12(sp)
    80000204:	00fccc63          	blt	s9,a5,8000021c <consumer+0xf0>
    80000208:	00c12783          	lw	a5,12(sp)
    8000020c:	0017879b          	addw	a5,a5,1
    80000210:	00f12623          	sw	a5,12(sp)
    80000214:	00c12783          	lw	a5,12(sp)
    80000218:	fefcd8e3          	bge	s9,a5,80000208 <consumer+0xdc>
    8000021c:	fff4849b          	addw	s1,s1,-1
    80000220:	675050ef          	jal	80006094 <yield>
    80000224:	f80490e3          	bnez	s1,800001a4 <consumer+0x78>
    80000228:	00090593          	mv	a1,s2
    8000022c:	00007517          	auipc	a0,0x7
    80000230:	e6450513          	add	a0,a0,-412 # 80007090 <rodata_start+0x90>
    80000234:	528020ef          	jal	8000275c <printf>
    80000238:	06013403          	ld	s0,96(sp)
    8000023c:	06813083          	ld	ra,104(sp)
    80000240:	05813483          	ld	s1,88(sp)
    80000244:	05013903          	ld	s2,80(sp)
    80000248:	04813983          	ld	s3,72(sp)
    8000024c:	04013a03          	ld	s4,64(sp)
    80000250:	03813a83          	ld	s5,56(sp)
    80000254:	03013b03          	ld	s6,48(sp)
    80000258:	02813b83          	ld	s7,40(sp)
    8000025c:	02013c03          	ld	s8,32(sp)
    80000260:	01813c83          	ld	s9,24(sp)
    80000264:	00000513          	li	a0,0
    80000268:	07010113          	add	sp,sp,112
    8000026c:	1180606f          	j	80006384 <exit>

0000000080000270 <producer>:
    80000270:	f8010113          	add	sp,sp,-128
    80000274:	06813823          	sd	s0,112(sp)
    80000278:	06913423          	sd	s1,104(sp)
    8000027c:	07213023          	sd	s2,96(sp)
    80000280:	05313c23          	sd	s3,88(sp)
    80000284:	05413823          	sd	s4,80(sp)
    80000288:	05513423          	sd	s5,72(sp)
    8000028c:	05613023          	sd	s6,64(sp)
    80000290:	03713c23          	sd	s7,56(sp)
    80000294:	03813823          	sd	s8,48(sp)
    80000298:	03913423          	sd	s9,40(sp)
    8000029c:	03a13023          	sd	s10,32(sp)
    800002a0:	06400913          	li	s2,100
    800002a4:	06113c23          	sd	ra,120(sp)
    800002a8:	01b13c23          	sd	s11,24(sp)
    800002ac:	169050ef          	jal	80005c14 <get_pid>
    800002b0:	02a90d3b          	mulw	s10,s2,a0
    800002b4:	00018cb7          	lui	s9,0x18
    800002b8:	00050413          	mv	s0,a0
    800002bc:	00011a17          	auipc	s4,0x11
    800002c0:	d44a0a13          	add	s4,s4,-700 # 80011000 <full>
    800002c4:	00426497          	auipc	s1,0x426
    800002c8:	0e848493          	add	s1,s1,232 # 804263ac <in>
    800002cc:	00007c17          	auipc	s8,0x7
    800002d0:	df4c0c13          	add	s8,s8,-524 # 800070c0 <rodata_start+0xc0>
    800002d4:	00011b97          	auipc	s7,0x11
    800002d8:	d84b8b93          	add	s7,s7,-636 # 80011058 <empty>
    800002dc:	00011997          	auipc	s3,0x11
    800002e0:	d4498993          	add	s3,s3,-700 # 80011020 <mutex>
    800002e4:	00007b17          	auipc	s6,0x7
    800002e8:	e04b0b13          	add	s6,s6,-508 # 800070e8 <rodata_start+0xe8>
    800002ec:	00500a93          	li	s5,5
    800002f0:	69fc8c93          	add	s9,s9,1695 # 1869f <_entry-0x7ffe7961>
    800002f4:	003d091b          	addw	s2,s10,3
    800002f8:	000d0d9b          	sext.w	s11,s10
    800002fc:	000d8613          	mv	a2,s11
    80000300:	00040593          	mv	a1,s0
    80000304:	000c0513          	mv	a0,s8
    80000308:	454020ef          	jal	8000275c <printf>
    8000030c:	000b8513          	mv	a0,s7
    80000310:	454060ef          	jal	80006764 <sem_wait>
    80000314:	00098513          	mv	a0,s3
    80000318:	44c060ef          	jal	80006764 <sem_wait>
    8000031c:	0004a683          	lw	a3,0(s1)
    80000320:	000d8613          	mv	a2,s11
    80000324:	00040593          	mv	a1,s0
    80000328:	00269793          	sll	a5,a3,0x2
    8000032c:	00fa07b3          	add	a5,s4,a5
    80000330:	000b0513          	mv	a0,s6
    80000334:	05b7a023          	sw	s11,64(a5)
    80000338:	424020ef          	jal	8000275c <printf>
    8000033c:	0004a783          	lw	a5,0(s1)
    80000340:	00098513          	mv	a0,s3
    80000344:	0017879b          	addw	a5,a5,1
    80000348:	0357e7bb          	remw	a5,a5,s5
    8000034c:	00f4a023          	sw	a5,0(s1)
    80000350:	530060ef          	jal	80006880 <sem_post>
    80000354:	000a0513          	mv	a0,s4
    80000358:	528060ef          	jal	80006880 <sem_post>
    8000035c:	00012623          	sw	zero,12(sp)
    80000360:	00c12783          	lw	a5,12(sp)
    80000364:	00fccc63          	blt	s9,a5,8000037c <producer+0x10c>
    80000368:	00c12783          	lw	a5,12(sp)
    8000036c:	0017879b          	addw	a5,a5,1
    80000370:	00f12623          	sw	a5,12(sp)
    80000374:	00c12783          	lw	a5,12(sp)
    80000378:	fefcd8e3          	bge	s9,a5,80000368 <producer+0xf8>
    8000037c:	001d0d1b          	addw	s10,s10,1
    80000380:	515050ef          	jal	80006094 <yield>
    80000384:	f72d1ae3          	bne	s10,s2,800002f8 <producer+0x88>
    80000388:	00040593          	mv	a1,s0
    8000038c:	00007517          	auipc	a0,0x7
    80000390:	d9450513          	add	a0,a0,-620 # 80007120 <rodata_start+0x120>
    80000394:	3c8020ef          	jal	8000275c <printf>
    80000398:	07013403          	ld	s0,112(sp)
    8000039c:	07813083          	ld	ra,120(sp)
    800003a0:	06813483          	ld	s1,104(sp)
    800003a4:	06013903          	ld	s2,96(sp)
    800003a8:	05813983          	ld	s3,88(sp)
    800003ac:	05013a03          	ld	s4,80(sp)
    800003b0:	04813a83          	ld	s5,72(sp)
    800003b4:	04013b03          	ld	s6,64(sp)
    800003b8:	03813b83          	ld	s7,56(sp)
    800003bc:	03013c03          	ld	s8,48(sp)
    800003c0:	02813c83          	ld	s9,40(sp)
    800003c4:	02013d03          	ld	s10,32(sp)
    800003c8:	01813d83          	ld	s11,24(sp)
    800003cc:	00000513          	li	a0,0
    800003d0:	08010113          	add	sp,sp,128
    800003d4:	7b10506f          	j	80006384 <exit>

00000000800003d8 <writer>:
    800003d8:	f9010113          	add	sp,sp,-112
    800003dc:	06813023          	sd	s0,96(sp)
    800003e0:	04913c23          	sd	s1,88(sp)
    800003e4:	05313423          	sd	s3,72(sp)
    800003e8:	05413023          	sd	s4,64(sp)
    800003ec:	03513c23          	sd	s5,56(sp)
    800003f0:	03613823          	sd	s6,48(sp)
    800003f4:	03713423          	sd	s7,40(sp)
    800003f8:	03813023          	sd	s8,32(sp)
    800003fc:	01913c23          	sd	s9,24(sp)
    80000400:	06113423          	sd	ra,104(sp)
    80000404:	05213823          	sd	s2,80(sp)
    80000408:	01a13823          	sd	s10,16(sp)
    8000040c:	06400493          	li	s1,100
    80000410:	005050ef          	jal	80005c14 <get_pid>
    80000414:	02a484bb          	mulw	s1,s1,a0
    80000418:	00018cb7          	lui	s9,0x18
    8000041c:	00050413          	mv	s0,a0
    80000420:	00000793          	li	a5,0
    80000424:	00426a17          	auipc	s4,0x426
    80000428:	f80a0a13          	add	s4,s4,-128 # 804263a4 <shared_data>
    8000042c:	00007c17          	auipc	s8,0x7
    80000430:	d24c0c13          	add	s8,s8,-732 # 80007150 <rodata_start+0x150>
    80000434:	00011997          	auipc	s3,0x11
    80000438:	c4498993          	add	s3,s3,-956 # 80011078 <rw_mutex>
    8000043c:	00007b97          	auipc	s7,0x7
    80000440:	d3cb8b93          	add	s7,s7,-708 # 80007178 <rodata_start+0x178>
    80000444:	69fc8c93          	add	s9,s9,1695 # 1869f <_entry-0x7ffe7961>
    80000448:	00007b17          	auipc	s6,0x7
    8000044c:	d58b0b13          	add	s6,s6,-680 # 800071a0 <rodata_start+0x1a0>
    80000450:	00200a93          	li	s5,2
    80000454:	fff4849b          	addw	s1,s1,-1
    80000458:	00178913          	add	s2,a5,1
    8000045c:	00090613          	mv	a2,s2
    80000460:	00040593          	mv	a1,s0
    80000464:	000c0513          	mv	a0,s8
    80000468:	00178d1b          	addw	s10,a5,1
    8000046c:	2f0020ef          	jal	8000275c <printf>
    80000470:	00098513          	mv	a0,s3
    80000474:	2f0060ef          	jal	80006764 <sem_wait>
    80000478:	000a2603          	lw	a2,0(s4)
    8000047c:	01a486bb          	addw	a3,s1,s10
    80000480:	00040593          	mv	a1,s0
    80000484:	000b8513          	mv	a0,s7
    80000488:	00da2023          	sw	a3,0(s4)
    8000048c:	2d0020ef          	jal	8000275c <printf>
    80000490:	00012423          	sw	zero,8(sp)
    80000494:	00812783          	lw	a5,8(sp)
    80000498:	00fccc63          	blt	s9,a5,800004b0 <writer+0xd8>
    8000049c:	00812783          	lw	a5,8(sp)
    800004a0:	0017879b          	addw	a5,a5,1
    800004a4:	00f12423          	sw	a5,8(sp)
    800004a8:	00812783          	lw	a5,8(sp)
    800004ac:	fefcd8e3          	bge	s9,a5,8000049c <writer+0xc4>
    800004b0:	00098513          	mv	a0,s3
    800004b4:	3cc060ef          	jal	80006880 <sem_post>
    800004b8:	00040593          	mv	a1,s0
    800004bc:	000b0513          	mv	a0,s6
    800004c0:	29c020ef          	jal	8000275c <printf>
    800004c4:	00012623          	sw	zero,12(sp)
    800004c8:	00c12783          	lw	a5,12(sp)
    800004cc:	00fccc63          	blt	s9,a5,800004e4 <writer+0x10c>
    800004d0:	00c12783          	lw	a5,12(sp)
    800004d4:	0017879b          	addw	a5,a5,1
    800004d8:	00f12623          	sw	a5,12(sp)
    800004dc:	00c12783          	lw	a5,12(sp)
    800004e0:	fefcd8e3          	bge	s9,a5,800004d0 <writer+0xf8>
    800004e4:	3b1050ef          	jal	80006094 <yield>
    800004e8:	00100793          	li	a5,1
    800004ec:	f75916e3          	bne	s2,s5,80000458 <writer+0x80>
    800004f0:	00040593          	mv	a1,s0
    800004f4:	00007517          	auipc	a0,0x7
    800004f8:	ccc50513          	add	a0,a0,-820 # 800071c0 <rodata_start+0x1c0>
    800004fc:	260020ef          	jal	8000275c <printf>
    80000500:	06013403          	ld	s0,96(sp)
    80000504:	06813083          	ld	ra,104(sp)
    80000508:	05813483          	ld	s1,88(sp)
    8000050c:	05013903          	ld	s2,80(sp)
    80000510:	04813983          	ld	s3,72(sp)
    80000514:	04013a03          	ld	s4,64(sp)
    80000518:	03813a83          	ld	s5,56(sp)
    8000051c:	03013b03          	ld	s6,48(sp)
    80000520:	02813b83          	ld	s7,40(sp)
    80000524:	02013c03          	ld	s8,32(sp)
    80000528:	01813c83          	ld	s9,24(sp)
    8000052c:	01013d03          	ld	s10,16(sp)
    80000530:	00000513          	li	a0,0
    80000534:	07010113          	add	sp,sp,112
    80000538:	64d0506f          	j	80006384 <exit>

000000008000053c <reader>:
    8000053c:	f9010113          	add	sp,sp,-112
    80000540:	06813023          	sd	s0,96(sp)
    80000544:	04913c23          	sd	s1,88(sp)
    80000548:	05213823          	sd	s2,80(sp)
    8000054c:	05313423          	sd	s3,72(sp)
    80000550:	05413023          	sd	s4,64(sp)
    80000554:	03513c23          	sd	s5,56(sp)
    80000558:	03613823          	sd	s6,48(sp)
    8000055c:	03713423          	sd	s7,40(sp)
    80000560:	03813023          	sd	s8,32(sp)
    80000564:	01913c23          	sd	s9,24(sp)
    80000568:	01a13823          	sd	s10,16(sp)
    8000056c:	06113423          	sd	ra,104(sp)
    80000570:	0000cd37          	lui	s10,0xc
    80000574:	6a0050ef          	jal	80005c14 <get_pid>
    80000578:	00050493          	mv	s1,a0
    8000057c:	00000993          	li	s3,0
    80000580:	00426417          	auipc	s0,0x426
    80000584:	e2040413          	add	s0,s0,-480 # 804263a0 <read_count>
    80000588:	00426c97          	auipc	s9,0x426
    8000058c:	e1cc8c93          	add	s9,s9,-484 # 804263a4 <shared_data>
    80000590:	00007c17          	auipc	s8,0x7
    80000594:	c60c0c13          	add	s8,s8,-928 # 800071f0 <rodata_start+0x1f0>
    80000598:	00011917          	auipc	s2,0x11
    8000059c:	b0090913          	add	s2,s2,-1280 # 80011098 <read_mutex>
    800005a0:	00100b93          	li	s7,1
    800005a4:	00007b17          	auipc	s6,0x7
    800005a8:	ca4b0b13          	add	s6,s6,-860 # 80007248 <rodata_start+0x248>
    800005ac:	34fd0d13          	add	s10,s10,847 # c34f <_entry-0x7fff3cb1>
    800005b0:	00007a97          	auipc	s5,0x7
    800005b4:	d08a8a93          	add	s5,s5,-760 # 800072b8 <rodata_start+0x2b8>
    800005b8:	00300a13          	li	s4,3
    800005bc:	0019899b          	addw	s3,s3,1
    800005c0:	00098613          	mv	a2,s3
    800005c4:	00048593          	mv	a1,s1
    800005c8:	000c0513          	mv	a0,s8
    800005cc:	190020ef          	jal	8000275c <printf>
    800005d0:	00090513          	mv	a0,s2
    800005d4:	190060ef          	jal	80006764 <sem_wait>
    800005d8:	00042783          	lw	a5,0(s0)
    800005dc:	0017871b          	addw	a4,a5,1
    800005e0:	00e42023          	sw	a4,0(s0)
    800005e4:	11770063          	beq	a4,s7,800006e4 <reader+0x1a8>
    800005e8:	00090513          	mv	a0,s2
    800005ec:	294060ef          	jal	80006880 <sem_post>
    800005f0:	00042683          	lw	a3,0(s0)
    800005f4:	000ca603          	lw	a2,0(s9)
    800005f8:	00048593          	mv	a1,s1
    800005fc:	000b0513          	mv	a0,s6
    80000600:	15c020ef          	jal	8000275c <printf>
    80000604:	00012423          	sw	zero,8(sp)
    80000608:	00812783          	lw	a5,8(sp)
    8000060c:	00fd4c63          	blt	s10,a5,80000624 <reader+0xe8>
    80000610:	00812783          	lw	a5,8(sp)
    80000614:	0017879b          	addw	a5,a5,1
    80000618:	00f12423          	sw	a5,8(sp)
    8000061c:	00812783          	lw	a5,8(sp)
    80000620:	fefd58e3          	bge	s10,a5,80000610 <reader+0xd4>
    80000624:	00090513          	mv	a0,s2
    80000628:	13c060ef          	jal	80006764 <sem_wait>
    8000062c:	00042783          	lw	a5,0(s0)
    80000630:	fff7871b          	addw	a4,a5,-1
    80000634:	00e42023          	sw	a4,0(s0)
    80000638:	08070663          	beqz	a4,800006c4 <reader+0x188>
    8000063c:	00090513          	mv	a0,s2
    80000640:	240060ef          	jal	80006880 <sem_post>
    80000644:	00048593          	mv	a1,s1
    80000648:	000a8513          	mv	a0,s5
    8000064c:	110020ef          	jal	8000275c <printf>
    80000650:	00012623          	sw	zero,12(sp)
    80000654:	00c12783          	lw	a5,12(sp)
    80000658:	00fd4c63          	blt	s10,a5,80000670 <reader+0x134>
    8000065c:	00c12783          	lw	a5,12(sp)
    80000660:	0017879b          	addw	a5,a5,1
    80000664:	00f12623          	sw	a5,12(sp)
    80000668:	00c12783          	lw	a5,12(sp)
    8000066c:	fefd58e3          	bge	s10,a5,8000065c <reader+0x120>
    80000670:	225050ef          	jal	80006094 <yield>
    80000674:	f54994e3          	bne	s3,s4,800005bc <reader+0x80>
    80000678:	00048593          	mv	a1,s1
    8000067c:	00007517          	auipc	a0,0x7
    80000680:	c5c50513          	add	a0,a0,-932 # 800072d8 <rodata_start+0x2d8>
    80000684:	0d8020ef          	jal	8000275c <printf>
    80000688:	06013403          	ld	s0,96(sp)
    8000068c:	06813083          	ld	ra,104(sp)
    80000690:	05813483          	ld	s1,88(sp)
    80000694:	05013903          	ld	s2,80(sp)
    80000698:	04813983          	ld	s3,72(sp)
    8000069c:	04013a03          	ld	s4,64(sp)
    800006a0:	03813a83          	ld	s5,56(sp)
    800006a4:	03013b03          	ld	s6,48(sp)
    800006a8:	02813b83          	ld	s7,40(sp)
    800006ac:	02013c03          	ld	s8,32(sp)
    800006b0:	01813c83          	ld	s9,24(sp)
    800006b4:	01013d03          	ld	s10,16(sp)
    800006b8:	00000513          	li	a0,0
    800006bc:	07010113          	add	sp,sp,112
    800006c0:	4c50506f          	j	80006384 <exit>
    800006c4:	00048593          	mv	a1,s1
    800006c8:	00007517          	auipc	a0,0x7
    800006cc:	bb850513          	add	a0,a0,-1096 # 80007280 <rodata_start+0x280>
    800006d0:	08c020ef          	jal	8000275c <printf>
    800006d4:	00011517          	auipc	a0,0x11
    800006d8:	9a450513          	add	a0,a0,-1628 # 80011078 <rw_mutex>
    800006dc:	1a4060ef          	jal	80006880 <sem_post>
    800006e0:	f5dff06f          	j	8000063c <reader+0x100>
    800006e4:	00048593          	mv	a1,s1
    800006e8:	00007517          	auipc	a0,0x7
    800006ec:	b3050513          	add	a0,a0,-1232 # 80007218 <rodata_start+0x218>
    800006f0:	06c020ef          	jal	8000275c <printf>
    800006f4:	00011517          	auipc	a0,0x11
    800006f8:	98450513          	add	a0,a0,-1660 # 80011078 <rw_mutex>
    800006fc:	068060ef          	jal	80006764 <sem_wait>
    80000700:	ee9ff06f          	j	800005e8 <reader+0xac>

0000000080000704 <philosopher>:
    80000704:	f8010113          	add	sp,sp,-128
    80000708:	06813823          	sd	s0,112(sp)
    8000070c:	06913423          	sd	s1,104(sp)
    80000710:	07213023          	sd	s2,96(sp)
    80000714:	05313c23          	sd	s3,88(sp)
    80000718:	05413823          	sd	s4,80(sp)
    8000071c:	05513423          	sd	s5,72(sp)
    80000720:	03713c23          	sd	s7,56(sp)
    80000724:	03813823          	sd	s8,48(sp)
    80000728:	03913423          	sd	s9,40(sp)
    8000072c:	03a13023          	sd	s10,32(sp)
    80000730:	01b13c23          	sd	s11,24(sp)
    80000734:	06113c23          	sd	ra,120(sp)
    80000738:	05613023          	sd	s6,64(sp)
    8000073c:	4d8050ef          	jal	80005c14 <get_pid>
    80000740:	00500793          	li	a5,5
    80000744:	02f5643b          	remw	s0,a0,a5
    80000748:	00011a17          	auipc	s4,0x11
    8000074c:	970a0a13          	add	s4,s4,-1680 # 800110b8 <forks>
    80000750:	00018937          	lui	s2,0x18
    80000754:	000254b7          	lui	s1,0x25
    80000758:	00000b93          	li	s7,0
    8000075c:	00007d97          	auipc	s11,0x7
    80000760:	bacd8d93          	add	s11,s11,-1108 # 80007308 <rodata_start+0x308>
    80000764:	69f90913          	add	s2,s2,1695 # 1869f <_entry-0x7ffe7961>
    80000768:	00007d17          	auipc	s10,0x7
    8000076c:	bc0d0d13          	add	s10,s10,-1088 # 80007328 <rodata_start+0x328>
    80000770:	00007c97          	auipc	s9,0x7
    80000774:	c18c8c93          	add	s9,s9,-1000 # 80007388 <rodata_start+0x388>
    80000778:	00007c17          	auipc	s8,0x7
    8000077c:	be8c0c13          	add	s8,s8,-1048 # 80007360 <rodata_start+0x360>
    80000780:	9ef48493          	add	s1,s1,-1553 # 249ef <_entry-0x7ffdb611>
    80000784:	0014099b          	addw	s3,s0,1
    80000788:	02f9e9bb          	remw	s3,s3,a5
    8000078c:	00541a93          	sll	s5,s0,0x5
    80000790:	015a0ab3          	add	s5,s4,s5
    80000794:	00599793          	sll	a5,s3,0x5
    80000798:	00fa0a33          	add	s4,s4,a5
    8000079c:	00040593          	mv	a1,s0
    800007a0:	000d8513          	mv	a0,s11
    800007a4:	7b9010ef          	jal	8000275c <printf>
    800007a8:	00012423          	sw	zero,8(sp)
    800007ac:	00812783          	lw	a5,8(sp)
    800007b0:	00f94c63          	blt	s2,a5,800007c8 <philosopher+0xc4>
    800007b4:	00812783          	lw	a5,8(sp)
    800007b8:	0017879b          	addw	a5,a5,1
    800007bc:	00f12423          	sw	a5,8(sp)
    800007c0:	00812783          	lw	a5,8(sp)
    800007c4:	fef958e3          	bge	s2,a5,800007b4 <philosopher+0xb0>
    800007c8:	00098693          	mv	a3,s3
    800007cc:	00040613          	mv	a2,s0
    800007d0:	00040593          	mv	a1,s0
    800007d4:	000d0513          	mv	a0,s10
    800007d8:	785010ef          	jal	8000275c <printf>
    800007dc:	11345a63          	bge	s0,s3,800008f0 <philosopher+0x1ec>
    800007e0:	000a8513          	mv	a0,s5
    800007e4:	781050ef          	jal	80006764 <sem_wait>
    800007e8:	00040613          	mv	a2,s0
    800007ec:	00040593          	mv	a1,s0
    800007f0:	000c0513          	mv	a0,s8
    800007f4:	769010ef          	jal	8000275c <printf>
    800007f8:	000a0513          	mv	a0,s4
    800007fc:	769050ef          	jal	80006764 <sem_wait>
    80000800:	00098613          	mv	a2,s3
    80000804:	00040593          	mv	a1,s0
    80000808:	000c8513          	mv	a0,s9
    8000080c:	751010ef          	jal	8000275c <printf>
    80000810:	001b8b13          	add	s6,s7,1
    80000814:	000b0613          	mv	a2,s6
    80000818:	00040593          	mv	a1,s0
    8000081c:	00007517          	auipc	a0,0x7
    80000820:	b9450513          	add	a0,a0,-1132 # 800073b0 <rodata_start+0x3b0>
    80000824:	739010ef          	jal	8000275c <printf>
    80000828:	00012623          	sw	zero,12(sp)
    8000082c:	00c12783          	lw	a5,12(sp)
    80000830:	00f4cc63          	blt	s1,a5,80000848 <philosopher+0x144>
    80000834:	00c12783          	lw	a5,12(sp)
    80000838:	0017879b          	addw	a5,a5,1
    8000083c:	00f12623          	sw	a5,12(sp)
    80000840:	00c12783          	lw	a5,12(sp)
    80000844:	fef4d8e3          	bge	s1,a5,80000834 <philosopher+0x130>
    80000848:	000a8513          	mv	a0,s5
    8000084c:	034060ef          	jal	80006880 <sem_post>
    80000850:	00040613          	mv	a2,s0
    80000854:	00040593          	mv	a1,s0
    80000858:	00007517          	auipc	a0,0x7
    8000085c:	b8850513          	add	a0,a0,-1144 # 800073e0 <rodata_start+0x3e0>
    80000860:	6fd010ef          	jal	8000275c <printf>
    80000864:	000a0513          	mv	a0,s4
    80000868:	018060ef          	jal	80006880 <sem_post>
    8000086c:	00098613          	mv	a2,s3
    80000870:	00040593          	mv	a1,s0
    80000874:	00007517          	auipc	a0,0x7
    80000878:	b9450513          	add	a0,a0,-1132 # 80007408 <rodata_start+0x408>
    8000087c:	6e1010ef          	jal	8000275c <printf>
    80000880:	00040593          	mv	a1,s0
    80000884:	00007517          	auipc	a0,0x7
    80000888:	bac50513          	add	a0,a0,-1108 # 80007430 <rodata_start+0x430>
    8000088c:	6d1010ef          	jal	8000275c <printf>
    80000890:	005050ef          	jal	80006094 <yield>
    80000894:	00200793          	li	a5,2
    80000898:	00100b93          	li	s7,1
    8000089c:	f0fb10e3          	bne	s6,a5,8000079c <philosopher+0x98>
    800008a0:	00040593          	mv	a1,s0
    800008a4:	00007517          	auipc	a0,0x7
    800008a8:	bac50513          	add	a0,a0,-1108 # 80007450 <rodata_start+0x450>
    800008ac:	6b1010ef          	jal	8000275c <printf>
    800008b0:	07013403          	ld	s0,112(sp)
    800008b4:	07813083          	ld	ra,120(sp)
    800008b8:	06813483          	ld	s1,104(sp)
    800008bc:	06013903          	ld	s2,96(sp)
    800008c0:	05813983          	ld	s3,88(sp)
    800008c4:	05013a03          	ld	s4,80(sp)
    800008c8:	04813a83          	ld	s5,72(sp)
    800008cc:	04013b03          	ld	s6,64(sp)
    800008d0:	03813b83          	ld	s7,56(sp)
    800008d4:	03013c03          	ld	s8,48(sp)
    800008d8:	02813c83          	ld	s9,40(sp)
    800008dc:	02013d03          	ld	s10,32(sp)
    800008e0:	01813d83          	ld	s11,24(sp)
    800008e4:	00000513          	li	a0,0
    800008e8:	08010113          	add	sp,sp,128
    800008ec:	2990506f          	j	80006384 <exit>
    800008f0:	000a0513          	mv	a0,s4
    800008f4:	671050ef          	jal	80006764 <sem_wait>
    800008f8:	00098613          	mv	a2,s3
    800008fc:	00040593          	mv	a1,s0
    80000900:	000c8513          	mv	a0,s9
    80000904:	659010ef          	jal	8000275c <printf>
    80000908:	000a8513          	mv	a0,s5
    8000090c:	659050ef          	jal	80006764 <sem_wait>
    80000910:	00040613          	mv	a2,s0
    80000914:	00040593          	mv	a1,s0
    80000918:	000c0513          	mv	a0,s8
    8000091c:	641010ef          	jal	8000275c <printf>
    80000920:	ef1ff06f          	j	80000810 <philosopher+0x10c>

0000000080000924 <test_process_allocation>:
    80000924:	fe010113          	add	sp,sp,-32
    80000928:	00007517          	auipc	a0,0x7
    8000092c:	b5050513          	add	a0,a0,-1200 # 80007478 <rodata_start+0x478>
    80000930:	00113c23          	sd	ra,24(sp)
    80000934:	00813823          	sd	s0,16(sp)
    80000938:	00913423          	sd	s1,8(sp)
    8000093c:	01213023          	sd	s2,0(sp)
    80000940:	18c020ef          	jal	80002acc <uart_puts>
    80000944:	7d1040ef          	jal	80005914 <alloc_proc>
    80000948:	00050413          	mv	s0,a0
    8000094c:	7c9040ef          	jal	80005914 <alloc_proc>
    80000950:	00050493          	mv	s1,a0
    80000954:	7c1040ef          	jal	80005914 <alloc_proc>
    80000958:	0a040663          	beqz	s0,80000a04 <test_process_allocation+0xe0>
    8000095c:	0a048463          	beqz	s1,80000a04 <test_process_allocation+0xe0>
    80000960:	00050913          	mv	s2,a0
    80000964:	0a050063          	beqz	a0,80000a04 <test_process_allocation+0xe0>
    80000968:	00452683          	lw	a3,4(a0)
    8000096c:	0044a603          	lw	a2,4(s1)
    80000970:	00442583          	lw	a1,4(s0)
    80000974:	00007517          	auipc	a0,0x7
    80000978:	b4450513          	add	a0,a0,-1212 # 800074b8 <rodata_start+0x4b8>
    8000097c:	5e1010ef          	jal	8000275c <printf>
    80000980:	00042783          	lw	a5,0(s0)
    80000984:	00100713          	li	a4,1
    80000988:	00e79a63          	bne	a5,a4,8000099c <test_process_allocation+0x78>
    8000098c:	0004a703          	lw	a4,0(s1)
    80000990:	00f71663          	bne	a4,a5,8000099c <test_process_allocation+0x78>
    80000994:	00092783          	lw	a5,0(s2)
    80000998:	0ae78463          	beq	a5,a4,80000a40 <test_process_allocation+0x11c>
    8000099c:	00007517          	auipc	a0,0x7
    800009a0:	b7c50513          	add	a0,a0,-1156 # 80007518 <rodata_start+0x518>
    800009a4:	128020ef          	jal	80002acc <uart_puts>
    800009a8:	00040513          	mv	a0,s0
    800009ac:	128050ef          	jal	80005ad4 <free_proc>
    800009b0:	00048513          	mv	a0,s1
    800009b4:	120050ef          	jal	80005ad4 <free_proc>
    800009b8:	00090513          	mv	a0,s2
    800009bc:	118050ef          	jal	80005ad4 <free_proc>
    800009c0:	00042783          	lw	a5,0(s0)
    800009c4:	00079a63          	bnez	a5,800009d8 <test_process_allocation+0xb4>
    800009c8:	0004a783          	lw	a5,0(s1)
    800009cc:	00079663          	bnez	a5,800009d8 <test_process_allocation+0xb4>
    800009d0:	00092783          	lw	a5,0(s2)
    800009d4:	04078e63          	beqz	a5,80000a30 <test_process_allocation+0x10c>
    800009d8:	00007517          	auipc	a0,0x7
    800009dc:	b7050513          	add	a0,a0,-1168 # 80007548 <rodata_start+0x548>
    800009e0:	0ec020ef          	jal	80002acc <uart_puts>
    800009e4:	01013403          	ld	s0,16(sp)
    800009e8:	01813083          	ld	ra,24(sp)
    800009ec:	00813483          	ld	s1,8(sp)
    800009f0:	00013903          	ld	s2,0(sp)
    800009f4:	00007517          	auipc	a0,0x7
    800009f8:	b8450513          	add	a0,a0,-1148 # 80007578 <rodata_start+0x578>
    800009fc:	02010113          	add	sp,sp,32
    80000a00:	0cc0206f          	j	80002acc <uart_puts>
    80000a04:	00007517          	auipc	a0,0x7
    80000a08:	b5c50513          	add	a0,a0,-1188 # 80007560 <rodata_start+0x560>
    80000a0c:	0c0020ef          	jal	80002acc <uart_puts>
    80000a10:	01013403          	ld	s0,16(sp)
    80000a14:	01813083          	ld	ra,24(sp)
    80000a18:	00813483          	ld	s1,8(sp)
    80000a1c:	00013903          	ld	s2,0(sp)
    80000a20:	00007517          	auipc	a0,0x7
    80000a24:	b5850513          	add	a0,a0,-1192 # 80007578 <rodata_start+0x578>
    80000a28:	02010113          	add	sp,sp,32
    80000a2c:	0a00206f          	j	80002acc <uart_puts>
    80000a30:	00007517          	auipc	a0,0x7
    80000a34:	b0050513          	add	a0,a0,-1280 # 80007530 <rodata_start+0x530>
    80000a38:	094020ef          	jal	80002acc <uart_puts>
    80000a3c:	fd5ff06f          	j	80000a10 <test_process_allocation+0xec>
    80000a40:	00007517          	auipc	a0,0x7
    80000a44:	ab050513          	add	a0,a0,-1360 # 800074f0 <rodata_start+0x4f0>
    80000a48:	084020ef          	jal	80002acc <uart_puts>
    80000a4c:	f5dff06f          	j	800009a8 <test_process_allocation+0x84>

0000000080000a50 <test_process_find>:
    80000a50:	fe010113          	add	sp,sp,-32
    80000a54:	00007517          	auipc	a0,0x7
    80000a58:	b3c50513          	add	a0,a0,-1220 # 80007590 <rodata_start+0x590>
    80000a5c:	00113c23          	sd	ra,24(sp)
    80000a60:	00813823          	sd	s0,16(sp)
    80000a64:	00913423          	sd	s1,8(sp)
    80000a68:	064020ef          	jal	80002acc <uart_puts>
    80000a6c:	6a9040ef          	jal	80005914 <alloc_proc>
    80000a70:	08050863          	beqz	a0,80000b00 <test_process_find+0xb0>
    80000a74:	00452483          	lw	s1,4(a0)
    80000a78:	00050413          	mv	s0,a0
    80000a7c:	00007517          	auipc	a0,0x7
    80000a80:	b6450513          	add	a0,a0,-1180 # 800075e0 <rodata_start+0x5e0>
    80000a84:	00048593          	mv	a1,s1
    80000a88:	4d5010ef          	jal	8000275c <printf>
    80000a8c:	00048513          	mv	a0,s1
    80000a90:	0b8050ef          	jal	80005b48 <find_proc>
    80000a94:	00050663          	beqz	a0,80000aa0 <test_process_find+0x50>
    80000a98:	00452783          	lw	a5,4(a0)
    80000a9c:	08978063          	beq	a5,s1,80000b1c <test_process_find+0xcc>
    80000aa0:	00007517          	auipc	a0,0x7
    80000aa4:	b7850513          	add	a0,a0,-1160 # 80007618 <rodata_start+0x618>
    80000aa8:	024020ef          	jal	80002acc <uart_puts>
    80000aac:	00040513          	mv	a0,s0
    80000ab0:	024050ef          	jal	80005ad4 <free_proc>
    80000ab4:	00048513          	mv	a0,s1
    80000ab8:	090050ef          	jal	80005b48 <find_proc>
    80000abc:	00050663          	beqz	a0,80000ac8 <test_process_find+0x78>
    80000ac0:	00052783          	lw	a5,0(a0)
    80000ac4:	02079663          	bnez	a5,80000af0 <test_process_find+0xa0>
    80000ac8:	00007517          	auipc	a0,0x7
    80000acc:	b6850513          	add	a0,a0,-1176 # 80007630 <rodata_start+0x630>
    80000ad0:	7fd010ef          	jal	80002acc <uart_puts>
    80000ad4:	01013403          	ld	s0,16(sp)
    80000ad8:	01813083          	ld	ra,24(sp)
    80000adc:	00813483          	ld	s1,8(sp)
    80000ae0:	00007517          	auipc	a0,0x7
    80000ae4:	a9850513          	add	a0,a0,-1384 # 80007578 <rodata_start+0x578>
    80000ae8:	02010113          	add	sp,sp,32
    80000aec:	7e10106f          	j	80002acc <uart_puts>
    80000af0:	00007517          	auipc	a0,0x7
    80000af4:	b7850513          	add	a0,a0,-1160 # 80007668 <rodata_start+0x668>
    80000af8:	7d5010ef          	jal	80002acc <uart_puts>
    80000afc:	fd9ff06f          	j	80000ad4 <test_process_find+0x84>
    80000b00:	01013403          	ld	s0,16(sp)
    80000b04:	01813083          	ld	ra,24(sp)
    80000b08:	00813483          	ld	s1,8(sp)
    80000b0c:	00007517          	auipc	a0,0x7
    80000b10:	abc50513          	add	a0,a0,-1348 # 800075c8 <rodata_start+0x5c8>
    80000b14:	02010113          	add	sp,sp,32
    80000b18:	7b50106f          	j	80002acc <uart_puts>
    80000b1c:	00048593          	mv	a1,s1
    80000b20:	00007517          	auipc	a0,0x7
    80000b24:	ad850513          	add	a0,a0,-1320 # 800075f8 <rodata_start+0x5f8>
    80000b28:	435010ef          	jal	8000275c <printf>
    80000b2c:	f81ff06f          	j	80000aac <test_process_find+0x5c>

0000000080000b30 <test_process_state_transition>:
    80000b30:	fe010113          	add	sp,sp,-32
    80000b34:	00007517          	auipc	a0,0x7
    80000b38:	b6450513          	add	a0,a0,-1180 # 80007698 <rodata_start+0x698>
    80000b3c:	00113c23          	sd	ra,24(sp)
    80000b40:	00813823          	sd	s0,16(sp)
    80000b44:	00913423          	sd	s1,8(sp)
    80000b48:	785010ef          	jal	80002acc <uart_puts>
    80000b4c:	5c9040ef          	jal	80005914 <alloc_proc>
    80000b50:	0c050a63          	beqz	a0,80000c24 <test_process_state_transition+0xf4>
    80000b54:	00052583          	lw	a1,0(a0)
    80000b58:	00050413          	mv	s0,a0
    80000b5c:	00100613          	li	a2,1
    80000b60:	00007517          	auipc	a0,0x7
    80000b64:	b7850513          	add	a0,a0,-1160 # 800076d8 <rodata_start+0x6d8>
    80000b68:	3f5010ef          	jal	8000275c <printf>
    80000b6c:	00040513          	mv	a0,s0
    80000b70:	03c050ef          	jal	80005bac <proc_mark_runnable>
    80000b74:	00042703          	lw	a4,0(s0)
    80000b78:	00200793          	li	a5,2
    80000b7c:	0cf70263          	beq	a4,a5,80000c40 <test_process_state_transition+0x110>
    80000b80:	00300793          	li	a5,3
    80000b84:	000014b7          	lui	s1,0x1
    80000b88:	00f42023          	sw	a5,0(s0)
    80000b8c:	23448593          	add	a1,s1,564 # 1234 <_entry-0x7fffedcc>
    80000b90:	00040513          	mv	a0,s0
    80000b94:	040050ef          	jal	80005bd4 <proc_mark_sleeping>
    80000b98:	00042583          	lw	a1,0(s0)
    80000b9c:	00400793          	li	a5,4
    80000ba0:	00f59863          	bne	a1,a5,80000bb0 <test_process_state_transition+0x80>
    80000ba4:	0b843783          	ld	a5,184(s0)
    80000ba8:	23448493          	add	s1,s1,564
    80000bac:	06978463          	beq	a5,s1,80000c14 <test_process_state_transition+0xe4>
    80000bb0:	00007517          	auipc	a0,0x7
    80000bb4:	b8850513          	add	a0,a0,-1144 # 80007738 <rodata_start+0x738>
    80000bb8:	3a5010ef          	jal	8000275c <printf>
    80000bbc:	02a00593          	li	a1,42
    80000bc0:	00040513          	mv	a0,s0
    80000bc4:	034050ef          	jal	80005bf8 <proc_mark_zombie>
    80000bc8:	00042703          	lw	a4,0(s0)
    80000bcc:	00500793          	li	a5,5
    80000bd0:	02f70463          	beq	a4,a5,80000bf8 <test_process_state_transition+0xc8>
    80000bd4:	00040513          	mv	a0,s0
    80000bd8:	6fd040ef          	jal	80005ad4 <free_proc>
    80000bdc:	01013403          	ld	s0,16(sp)
    80000be0:	01813083          	ld	ra,24(sp)
    80000be4:	00813483          	ld	s1,8(sp)
    80000be8:	00007517          	auipc	a0,0x7
    80000bec:	99050513          	add	a0,a0,-1648 # 80007578 <rodata_start+0x578>
    80000bf0:	02010113          	add	sp,sp,32
    80000bf4:	6d90106f          	j	80002acc <uart_puts>
    80000bf8:	01042703          	lw	a4,16(s0)
    80000bfc:	02a00793          	li	a5,42
    80000c00:	fcf71ae3          	bne	a4,a5,80000bd4 <test_process_state_transition+0xa4>
    80000c04:	00007517          	auipc	a0,0x7
    80000c08:	b6450513          	add	a0,a0,-1180 # 80007768 <rodata_start+0x768>
    80000c0c:	6c1010ef          	jal	80002acc <uart_puts>
    80000c10:	fc5ff06f          	j	80000bd4 <test_process_state_transition+0xa4>
    80000c14:	00007517          	auipc	a0,0x7
    80000c18:	b0450513          	add	a0,a0,-1276 # 80007718 <rodata_start+0x718>
    80000c1c:	6b1010ef          	jal	80002acc <uart_puts>
    80000c20:	f9dff06f          	j	80000bbc <test_process_state_transition+0x8c>
    80000c24:	01013403          	ld	s0,16(sp)
    80000c28:	01813083          	ld	ra,24(sp)
    80000c2c:	00813483          	ld	s1,8(sp)
    80000c30:	00007517          	auipc	a0,0x7
    80000c34:	99850513          	add	a0,a0,-1640 # 800075c8 <rodata_start+0x5c8>
    80000c38:	02010113          	add	sp,sp,32
    80000c3c:	6910106f          	j	80002acc <uart_puts>
    80000c40:	00007517          	auipc	a0,0x7
    80000c44:	ab850513          	add	a0,a0,-1352 # 800076f8 <rodata_start+0x6f8>
    80000c48:	685010ef          	jal	80002acc <uart_puts>
    80000c4c:	f35ff06f          	j	80000b80 <test_process_state_transition+0x50>

0000000080000c50 <test_simple_fork>:
    80000c50:	fe010113          	add	sp,sp,-32
    80000c54:	00007517          	auipc	a0,0x7
    80000c58:	b3450513          	add	a0,a0,-1228 # 80007788 <rodata_start+0x788>
    80000c5c:	00113c23          	sd	ra,24(sp)
    80000c60:	00813823          	sd	s0,16(sp)
    80000c64:	00913423          	sd	s1,8(sp)
    80000c68:	665010ef          	jal	80002acc <uart_puts>
    80000c6c:	4a9040ef          	jal	80005914 <alloc_proc>
    80000c70:	0a050463          	beqz	a0,80000d18 <test_simple_fork+0xc8>
    80000c74:	00300793          	li	a5,3
    80000c78:	00f52023          	sw	a5,0(a0)
    80000c7c:	00050413          	mv	s0,a0
    80000c80:	7bd040ef          	jal	80005c3c <set_current_proc>
    80000c84:	00442583          	lw	a1,4(s0)
    80000c88:	00007517          	auipc	a0,0x7
    80000c8c:	b6050513          	add	a0,a0,-1184 # 800077e8 <rodata_start+0x7e8>
    80000c90:	2cd010ef          	jal	8000275c <printf>
    80000c94:	4b0050ef          	jal	80006144 <fork>
    80000c98:	00050493          	mv	s1,a0
    80000c9c:	06a05663          	blez	a0,80000d08 <test_simple_fork+0xb8>
    80000ca0:	00050593          	mv	a1,a0
    80000ca4:	00007517          	auipc	a0,0x7
    80000ca8:	b5c50513          	add	a0,a0,-1188 # 80007800 <rodata_start+0x800>
    80000cac:	2b1010ef          	jal	8000275c <printf>
    80000cb0:	00048513          	mv	a0,s1
    80000cb4:	695040ef          	jal	80005b48 <find_proc>
    80000cb8:	00050493          	mv	s1,a0
    80000cbc:	02050063          	beqz	a0,80000cdc <test_simple_fork+0x8c>
    80000cc0:	0b053783          	ld	a5,176(a0)
    80000cc4:	06878863          	beq	a5,s0,80000d34 <test_simple_fork+0xe4>
    80000cc8:	0004a703          	lw	a4,0(s1)
    80000ccc:	00200793          	li	a5,2
    80000cd0:	08f70063          	beq	a4,a5,80000d50 <test_simple_fork+0x100>
    80000cd4:	00048513          	mv	a0,s1
    80000cd8:	5fd040ef          	jal	80005ad4 <free_proc>
    80000cdc:	00040513          	mv	a0,s0
    80000ce0:	5f5040ef          	jal	80005ad4 <free_proc>
    80000ce4:	00000513          	li	a0,0
    80000ce8:	755040ef          	jal	80005c3c <set_current_proc>
    80000cec:	01013403          	ld	s0,16(sp)
    80000cf0:	01813083          	ld	ra,24(sp)
    80000cf4:	00813483          	ld	s1,8(sp)
    80000cf8:	00007517          	auipc	a0,0x7
    80000cfc:	88050513          	add	a0,a0,-1920 # 80007578 <rodata_start+0x578>
    80000d00:	02010113          	add	sp,sp,32
    80000d04:	5c90106f          	j	80002acc <uart_puts>
    80000d08:	00007517          	auipc	a0,0x7
    80000d0c:	b6050513          	add	a0,a0,-1184 # 80007868 <rodata_start+0x868>
    80000d10:	5bd010ef          	jal	80002acc <uart_puts>
    80000d14:	fc9ff06f          	j	80000cdc <test_simple_fork+0x8c>
    80000d18:	01013403          	ld	s0,16(sp)
    80000d1c:	01813083          	ld	ra,24(sp)
    80000d20:	00813483          	ld	s1,8(sp)
    80000d24:	00007517          	auipc	a0,0x7
    80000d28:	aa450513          	add	a0,a0,-1372 # 800077c8 <rodata_start+0x7c8>
    80000d2c:	02010113          	add	sp,sp,32
    80000d30:	59d0106f          	j	80002acc <uart_puts>
    80000d34:	00852703          	lw	a4,8(a0)
    80000d38:	00442783          	lw	a5,4(s0)
    80000d3c:	f8f716e3          	bne	a4,a5,80000cc8 <test_simple_fork+0x78>
    80000d40:	00007517          	auipc	a0,0x7
    80000d44:	ae850513          	add	a0,a0,-1304 # 80007828 <rodata_start+0x828>
    80000d48:	585010ef          	jal	80002acc <uart_puts>
    80000d4c:	f7dff06f          	j	80000cc8 <test_simple_fork+0x78>
    80000d50:	00007517          	auipc	a0,0x7
    80000d54:	af850513          	add	a0,a0,-1288 # 80007848 <rodata_start+0x848>
    80000d58:	575010ef          	jal	80002acc <uart_puts>
    80000d5c:	f79ff06f          	j	80000cd4 <test_simple_fork+0x84>

0000000080000d60 <test_scheduler_basic>:
    80000d60:	fb010113          	add	sp,sp,-80
    80000d64:	04813023          	sd	s0,64(sp)
    80000d68:	00007517          	auipc	a0,0x7
    80000d6c:	b1050513          	add	a0,a0,-1264 # 80007878 <rodata_start+0x878>
    80000d70:	00810413          	add	s0,sp,8
    80000d74:	02913c23          	sd	s1,56(sp)
    80000d78:	03213823          	sd	s2,48(sp)
    80000d7c:	03313423          	sd	s3,40(sp)
    80000d80:	03413023          	sd	s4,32(sp)
    80000d84:	04113423          	sd	ra,72(sp)
    80000d88:	02010913          	add	s2,sp,32
    80000d8c:	541010ef          	jal	80002acc <uart_puts>
    80000d90:	00040493          	mv	s1,s0
    80000d94:	00200a13          	li	s4,2
    80000d98:	00007997          	auipc	s3,0x7
    80000d9c:	b2098993          	add	s3,s3,-1248 # 800078b8 <rodata_start+0x8b8>
    80000da0:	375040ef          	jal	80005914 <alloc_proc>
    80000da4:	00a4b023          	sd	a0,0(s1)
    80000da8:	00050793          	mv	a5,a0
    80000dac:	00848493          	add	s1,s1,8
    80000db0:	00098513          	mv	a0,s3
    80000db4:	00078863          	beqz	a5,80000dc4 <test_scheduler_basic+0x64>
    80000db8:	0047a583          	lw	a1,4(a5)
    80000dbc:	0147a023          	sw	s4,0(a5)
    80000dc0:	19d010ef          	jal	8000275c <printf>
    80000dc4:	fd249ee3          	bne	s1,s2,80000da0 <test_scheduler_basic+0x40>
    80000dc8:	00425797          	auipc	a5,0x425
    80000dcc:	95878793          	add	a5,a5,-1704 # 80425720 <proc>
    80000dd0:	00425617          	auipc	a2,0x425
    80000dd4:	5d060613          	add	a2,a2,1488 # 804263a0 <read_count>
    80000dd8:	00000593          	li	a1,0
    80000ddc:	00200693          	li	a3,2
    80000de0:	0007a703          	lw	a4,0(a5)
    80000de4:	0c878793          	add	a5,a5,200
    80000de8:	04d70863          	beq	a4,a3,80000e38 <test_scheduler_basic+0xd8>
    80000dec:	fec79ae3          	bne	a5,a2,80000de0 <test_scheduler_basic+0x80>
    80000df0:	00007517          	auipc	a0,0x7
    80000df4:	ae050513          	add	a0,a0,-1312 # 800078d0 <rodata_start+0x8d0>
    80000df8:	165010ef          	jal	8000275c <printf>
    80000dfc:	00043503          	ld	a0,0(s0)
    80000e00:	00840413          	add	s0,s0,8
    80000e04:	00050463          	beqz	a0,80000e0c <test_scheduler_basic+0xac>
    80000e08:	4cd040ef          	jal	80005ad4 <free_proc>
    80000e0c:	ff2418e3          	bne	s0,s2,80000dfc <test_scheduler_basic+0x9c>
    80000e10:	04013403          	ld	s0,64(sp)
    80000e14:	04813083          	ld	ra,72(sp)
    80000e18:	03813483          	ld	s1,56(sp)
    80000e1c:	03013903          	ld	s2,48(sp)
    80000e20:	02813983          	ld	s3,40(sp)
    80000e24:	02013a03          	ld	s4,32(sp)
    80000e28:	00006517          	auipc	a0,0x6
    80000e2c:	75050513          	add	a0,a0,1872 # 80007578 <rodata_start+0x578>
    80000e30:	05010113          	add	sp,sp,80
    80000e34:	4990106f          	j	80002acc <uart_puts>
    80000e38:	0015859b          	addw	a1,a1,1
    80000e3c:	fac792e3          	bne	a5,a2,80000de0 <test_scheduler_basic+0x80>
    80000e40:	fb1ff06f          	j	80000df0 <test_scheduler_basic+0x90>

0000000080000e44 <test_process_memory>:
    80000e44:	fd010113          	add	sp,sp,-48
    80000e48:	00007517          	auipc	a0,0x7
    80000e4c:	ab050513          	add	a0,a0,-1360 # 800078f8 <rodata_start+0x8f8>
    80000e50:	02113423          	sd	ra,40(sp)
    80000e54:	02813023          	sd	s0,32(sp)
    80000e58:	00913c23          	sd	s1,24(sp)
    80000e5c:	01213823          	sd	s2,16(sp)
    80000e60:	01313423          	sd	s3,8(sp)
    80000e64:	469010ef          	jal	80002acc <uart_puts>
    80000e68:	2ad040ef          	jal	80005914 <alloc_proc>
    80000e6c:	10050663          	beqz	a0,80000f78 <test_process_memory+0x134>
    80000e70:	01853783          	ld	a5,24(a0)
    80000e74:	00050413          	mv	s0,a0
    80000e78:	0c078a63          	beqz	a5,80000f4c <test_process_memory+0x108>
    80000e7c:	00452583          	lw	a1,4(a0)
    80000e80:	00007517          	auipc	a0,0x7
    80000e84:	ab850513          	add	a0,a0,-1352 # 80007938 <rodata_start+0x938>
    80000e88:	00002937          	lui	s2,0x2
    80000e8c:	0d1010ef          	jal	8000275c <printf>
    80000e90:	02043983          	ld	s3,32(s0)
    80000e94:	01843503          	ld	a0,24(s0)
    80000e98:	01298933          	add	s2,s3,s2
    80000e9c:	00090613          	mv	a2,s2
    80000ea0:	00098593          	mv	a1,s3
    80000ea4:	365030ef          	jal	80004a08 <uvmalloc>
    80000ea8:	00050493          	mv	s1,a0
    80000eac:	06a90663          	beq	s2,a0,80000f18 <test_process_memory+0xd4>
    80000eb0:	00007517          	auipc	a0,0x7
    80000eb4:	ae050513          	add	a0,a0,-1312 # 80007990 <rodata_start+0x990>
    80000eb8:	415010ef          	jal	80002acc <uart_puts>
    80000ebc:	02043483          	ld	s1,32(s0)
    80000ec0:	01843503          	ld	a0,24(s0)
    80000ec4:	fffff937          	lui	s2,0xfffff
    80000ec8:	01248633          	add	a2,s1,s2
    80000ecc:	00048593          	mv	a1,s1
    80000ed0:	2c1030ef          	jal	80004990 <uvmdealloc>
    80000ed4:	02043583          	ld	a1,32(s0)
    80000ed8:	01258933          	add	s2,a1,s2
    80000edc:	04a90c63          	beq	s2,a0,80000f34 <test_process_memory+0xf0>
    80000ee0:	00007517          	auipc	a0,0x7
    80000ee4:	af850513          	add	a0,a0,-1288 # 800079d8 <rodata_start+0x9d8>
    80000ee8:	3e5010ef          	jal	80002acc <uart_puts>
    80000eec:	00040513          	mv	a0,s0
    80000ef0:	3e5040ef          	jal	80005ad4 <free_proc>
    80000ef4:	00007517          	auipc	a0,0x7
    80000ef8:	afc50513          	add	a0,a0,-1284 # 800079f0 <rodata_start+0x9f0>
    80000efc:	02013403          	ld	s0,32(sp)
    80000f00:	02813083          	ld	ra,40(sp)
    80000f04:	01813483          	ld	s1,24(sp)
    80000f08:	01013903          	ld	s2,16(sp)
    80000f0c:	00813983          	ld	s3,8(sp)
    80000f10:	03010113          	add	sp,sp,48
    80000f14:	3b90106f          	j	80002acc <uart_puts>
    80000f18:	00050613          	mv	a2,a0
    80000f1c:	00098593          	mv	a1,s3
    80000f20:	00007517          	auipc	a0,0x7
    80000f24:	a4050513          	add	a0,a0,-1472 # 80007960 <rodata_start+0x960>
    80000f28:	035010ef          	jal	8000275c <printf>
    80000f2c:	02943023          	sd	s1,32(s0)
    80000f30:	f91ff06f          	j	80000ec0 <test_process_memory+0x7c>
    80000f34:	00090613          	mv	a2,s2
    80000f38:	00007517          	auipc	a0,0x7
    80000f3c:	a7050513          	add	a0,a0,-1424 # 800079a8 <rodata_start+0x9a8>
    80000f40:	01d010ef          	jal	8000275c <printf>
    80000f44:	03243023          	sd	s2,32(s0)
    80000f48:	fa5ff06f          	j	80000eec <test_process_memory+0xa8>
    80000f4c:	00007517          	auipc	a0,0x7
    80000f50:	9cc50513          	add	a0,a0,-1588 # 80007918 <rodata_start+0x918>
    80000f54:	379010ef          	jal	80002acc <uart_puts>
    80000f58:	00040513          	mv	a0,s0
    80000f5c:	02013403          	ld	s0,32(sp)
    80000f60:	02813083          	ld	ra,40(sp)
    80000f64:	01813483          	ld	s1,24(sp)
    80000f68:	01013903          	ld	s2,16(sp)
    80000f6c:	00813983          	ld	s3,8(sp)
    80000f70:	03010113          	add	sp,sp,48
    80000f74:	3610406f          	j	80005ad4 <free_proc>
    80000f78:	00006517          	auipc	a0,0x6
    80000f7c:	5e850513          	add	a0,a0,1512 # 80007560 <rodata_start+0x560>
    80000f80:	f7dff06f          	j	80000efc <test_process_memory+0xb8>

0000000080000f84 <test_growproc>:
    80000f84:	fe010113          	add	sp,sp,-32
    80000f88:	00007517          	auipc	a0,0x7
    80000f8c:	a9050513          	add	a0,a0,-1392 # 80007a18 <rodata_start+0xa18>
    80000f90:	00113c23          	sd	ra,24(sp)
    80000f94:	00813823          	sd	s0,16(sp)
    80000f98:	00913423          	sd	s1,8(sp)
    80000f9c:	01213023          	sd	s2,0(sp)
    80000fa0:	32d010ef          	jal	80002acc <uart_puts>
    80000fa4:	171040ef          	jal	80005914 <alloc_proc>
    80000fa8:	0c050463          	beqz	a0,80001070 <test_growproc+0xec>
    80000fac:	00050413          	mv	s0,a0
    80000fb0:	01853503          	ld	a0,24(a0)
    80000fb4:	00001637          	lui	a2,0x1
    80000fb8:	00000593          	li	a1,0
    80000fbc:	24d030ef          	jal	80004a08 <uvmalloc>
    80000fc0:	00050593          	mv	a1,a0
    80000fc4:	02a43023          	sd	a0,32(s0)
    80000fc8:	00007517          	auipc	a0,0x7
    80000fcc:	a7050513          	add	a0,a0,-1424 # 80007a38 <rodata_start+0xa38>
    80000fd0:	78c010ef          	jal	8000275c <printf>
    80000fd4:	00425497          	auipc	s1,0x425
    80000fd8:	41c48493          	add	s1,s1,1052 # 804263f0 <current_proc>
    80000fdc:	00001537          	lui	a0,0x1
    80000fe0:	0004b903          	ld	s2,0(s1)
    80000fe4:	0084b023          	sd	s0,0(s1)
    80000fe8:	32c050ef          	jal	80006314 <growproc>
    80000fec:	04050c63          	beqz	a0,80001044 <test_growproc+0xc0>
    80000ff0:	00007517          	auipc	a0,0x7
    80000ff4:	aa050513          	add	a0,a0,-1376 # 80007a90 <rodata_start+0xa90>
    80000ff8:	2d5010ef          	jal	80002acc <uart_puts>
    80000ffc:	fffff537          	lui	a0,0xfffff
    80001000:	314050ef          	jal	80006314 <growproc>
    80001004:	04051e63          	bnez	a0,80001060 <test_growproc+0xdc>
    80001008:	02043583          	ld	a1,32(s0)
    8000100c:	00007517          	auipc	a0,0x7
    80001010:	aa450513          	add	a0,a0,-1372 # 80007ab0 <rodata_start+0xab0>
    80001014:	748010ef          	jal	8000275c <printf>
    80001018:	00040513          	mv	a0,s0
    8000101c:	0124b023          	sd	s2,0(s1)
    80001020:	2b5040ef          	jal	80005ad4 <free_proc>
    80001024:	01013403          	ld	s0,16(sp)
    80001028:	01813083          	ld	ra,24(sp)
    8000102c:	00813483          	ld	s1,8(sp)
    80001030:	00013903          	ld	s2,0(sp)
    80001034:	00007517          	auipc	a0,0x7
    80001038:	ad450513          	add	a0,a0,-1324 # 80007b08 <rodata_start+0xb08>
    8000103c:	02010113          	add	sp,sp,32
    80001040:	28d0106f          	j	80002acc <uart_puts>
    80001044:	02043583          	ld	a1,32(s0)
    80001048:	00007517          	auipc	a0,0x7
    8000104c:	a1050513          	add	a0,a0,-1520 # 80007a58 <rodata_start+0xa58>
    80001050:	70c010ef          	jal	8000275c <printf>
    80001054:	fffff537          	lui	a0,0xfffff
    80001058:	2bc050ef          	jal	80006314 <growproc>
    8000105c:	fa0506e3          	beqz	a0,80001008 <test_growproc+0x84>
    80001060:	00007517          	auipc	a0,0x7
    80001064:	a8850513          	add	a0,a0,-1400 # 80007ae8 <rodata_start+0xae8>
    80001068:	265010ef          	jal	80002acc <uart_puts>
    8000106c:	fadff06f          	j	80001018 <test_growproc+0x94>
    80001070:	01013403          	ld	s0,16(sp)
    80001074:	01813083          	ld	ra,24(sp)
    80001078:	00813483          	ld	s1,8(sp)
    8000107c:	00013903          	ld	s2,0(sp)
    80001080:	00006517          	auipc	a0,0x6
    80001084:	4e050513          	add	a0,a0,1248 # 80007560 <rodata_start+0x560>
    80001088:	02010113          	add	sp,sp,32
    8000108c:	2410106f          	j	80002acc <uart_puts>

0000000080001090 <test_uid_limits>:
    80001090:	f5010113          	add	sp,sp,-176
    80001094:	00007517          	auipc	a0,0x7
    80001098:	a9450513          	add	a0,a0,-1388 # 80007b28 <rodata_start+0xb28>
    8000109c:	0a113423          	sd	ra,168(sp)
    800010a0:	0a813023          	sd	s0,160(sp)
    800010a4:	09213823          	sd	s2,144(sp)
    800010a8:	08913c23          	sd	s1,152(sp)
    800010ac:	09313423          	sd	s3,136(sp)
    800010b0:	09413023          	sd	s4,128(sp)
    800010b4:	07513c23          	sd	s5,120(sp)
    800010b8:	07613823          	sd	s6,112(sp)
    800010bc:	07713423          	sd	s7,104(sp)
    800010c0:	07813023          	sd	s8,96(sp)
    800010c4:	05913c23          	sd	s9,88(sp)
    800010c8:	05a13823          	sd	s10,80(sp)
    800010cc:	201010ef          	jal	80002acc <uart_puts>
    800010d0:	045040ef          	jal	80005914 <alloc_proc>
    800010d4:	00050413          	mv	s0,a0
    800010d8:	00000913          	li	s2,0
    800010dc:	02050063          	beqz	a0,800010fc <test_uid_limits+0x6c>
    800010e0:	00c52603          	lw	a2,12(a0)
    800010e4:	00452583          	lw	a1,4(a0)
    800010e8:	00007517          	auipc	a0,0x7
    800010ec:	a6850513          	add	a0,a0,-1432 # 80007b50 <rodata_start+0xb50>
    800010f0:	00100913          	li	s2,1
    800010f4:	668010ef          	jal	8000275c <printf>
    800010f8:	00813023          	sd	s0,0(sp)
    800010fc:	00425a97          	auipc	s5,0x425
    80001100:	2f4a8a93          	add	s5,s5,756 # 804263f0 <current_proc>
    80001104:	00100513          	li	a0,1
    80001108:	000abc03          	ld	s8,0(s5)
    8000110c:	008ab023          	sd	s0,0(s5)
    80001110:	351040ef          	jal	80005c60 <set_uid>
    80001114:	12050063          	beqz	a0,80001234 <test_uid_limits+0x1a4>
    80001118:	00400593          	li	a1,4
    8000111c:	00007517          	auipc	a0,0x7
    80001120:	a8c50513          	add	a0,a0,-1396 # 80007ba8 <rodata_start+0xba8>
    80001124:	00391993          	sll	s3,s2,0x3
    80001128:	00200b13          	li	s6,2
    8000112c:	630010ef          	jal	8000275c <printf>
    80001130:	013109b3          	add	s3,sp,s3
    80001134:	00990b9b          	addw	s7,s2,9 # fffffffffffff009 <bss_end+0xffffffff7fbd8c11>
    80001138:	412b0b3b          	subw	s6,s6,s2
    8000113c:	00400a13          	li	s4,4
    80001140:	00007c97          	auipc	s9,0x7
    80001144:	b18c8c93          	add	s9,s9,-1256 # 80007c58 <rodata_start+0xc58>
    80001148:	7cc040ef          	jal	80005914 <alloc_proc>
    8000114c:	00050413          	mv	s0,a0
    80001150:	012b0d3b          	addw	s10,s6,s2
    80001154:	0e050a63          	beqz	a0,80001248 <test_uid_limits+0x1b8>
    80001158:	000ab783          	ld	a5,0(s5)
    8000115c:	00c7a503          	lw	a0,12(a5)
    80001160:	00a42623          	sw	a0,12(s0)
    80001164:	37d040ef          	jal	80005ce0 <count_user_procs>
    80001168:	00050493          	mv	s1,a0
    8000116c:	000d0593          	mv	a1,s10
    80001170:	000c8513          	mv	a0,s9
    80001174:	00048713          	mv	a4,s1
    80001178:	109a4063          	blt	s4,s1,80001278 <test_uid_limits+0x1e8>
    8000117c:	00c42683          	lw	a3,12(s0)
    80001180:	00442603          	lw	a2,4(s0)
    80001184:	00898993          	add	s3,s3,8
    80001188:	0019091b          	addw	s2,s2,1
    8000118c:	5d0010ef          	jal	8000275c <printf>
    80001190:	fe89bc23          	sd	s0,-8(s3)
    80001194:	13448063          	beq	s1,s4,800012b4 <test_uid_limits+0x224>
    80001198:	fb7918e3          	bne	s2,s7,80001148 <test_uid_limits+0xb8>
    8000119c:	00007517          	auipc	a0,0x7
    800011a0:	b3c50513          	add	a0,a0,-1220 # 80007cd8 <rodata_start+0xcd8>
    800011a4:	5b8010ef          	jal	8000275c <printf>
    800011a8:	00100513          	li	a0,1
    800011ac:	391040ef          	jal	80005d3c <can_fork>
    800011b0:	06050a63          	beqz	a0,80001224 <test_uid_limits+0x194>
    800011b4:	00007517          	auipc	a0,0x7
    800011b8:	b6c50513          	add	a0,a0,-1172 # 80007d20 <rodata_start+0xd20>
    800011bc:	111010ef          	jal	80002acc <uart_puts>
    800011c0:	00010413          	mv	s0,sp
    800011c4:	003b9493          	sll	s1,s7,0x3
    800011c8:	018ab023          	sd	s8,0(s5)
    800011cc:	009404b3          	add	s1,s0,s1
    800011d0:	000b8a63          	beqz	s7,800011e4 <test_uid_limits+0x154>
    800011d4:	00043503          	ld	a0,0(s0)
    800011d8:	00840413          	add	s0,s0,8
    800011dc:	0f9040ef          	jal	80005ad4 <free_proc>
    800011e0:	fe941ae3          	bne	s0,s1,800011d4 <test_uid_limits+0x144>
    800011e4:	0a013403          	ld	s0,160(sp)
    800011e8:	0a813083          	ld	ra,168(sp)
    800011ec:	09813483          	ld	s1,152(sp)
    800011f0:	09013903          	ld	s2,144(sp)
    800011f4:	08813983          	ld	s3,136(sp)
    800011f8:	08013a03          	ld	s4,128(sp)
    800011fc:	07813a83          	ld	s5,120(sp)
    80001200:	07013b03          	ld	s6,112(sp)
    80001204:	06813b83          	ld	s7,104(sp)
    80001208:	06013c03          	ld	s8,96(sp)
    8000120c:	05813c83          	ld	s9,88(sp)
    80001210:	05013d03          	ld	s10,80(sp)
    80001214:	00007517          	auipc	a0,0x7
    80001218:	b3450513          	add	a0,a0,-1228 # 80007d48 <rodata_start+0xd48>
    8000121c:	0b010113          	add	sp,sp,176
    80001220:	0ad0106f          	j	80002acc <uart_puts>
    80001224:	00007517          	auipc	a0,0x7
    80001228:	acc50513          	add	a0,a0,-1332 # 80007cf0 <rodata_start+0xcf0>
    8000122c:	0a1010ef          	jal	80002acc <uart_puts>
    80001230:	f91ff06f          	j	800011c0 <test_uid_limits+0x130>
    80001234:	00442583          	lw	a1,4(s0)
    80001238:	00007517          	auipc	a0,0x7
    8000123c:	94050513          	add	a0,a0,-1728 # 80007b78 <rodata_start+0xb78>
    80001240:	51c010ef          	jal	8000275c <printf>
    80001244:	ed5ff06f          	j	80001118 <test_uid_limits+0x88>
    80001248:	000d0593          	mv	a1,s10
    8000124c:	00007517          	auipc	a0,0x7
    80001250:	99450513          	add	a0,a0,-1644 # 80007be0 <rodata_start+0xbe0>
    80001254:	508010ef          	jal	8000275c <printf>
    80001258:	00007517          	auipc	a0,0x7
    8000125c:	a8050513          	add	a0,a0,-1408 # 80007cd8 <rodata_start+0xcd8>
    80001260:	4fc010ef          	jal	8000275c <printf>
    80001264:	00100513          	li	a0,1
    80001268:	00090b93          	mv	s7,s2
    8000126c:	2d1040ef          	jal	80005d3c <can_fork>
    80001270:	f40512e3          	bnez	a0,800011b4 <test_uid_limits+0x124>
    80001274:	fb1ff06f          	j	80001224 <test_uid_limits+0x194>
    80001278:	00c42603          	lw	a2,12(s0)
    8000127c:	fff4869b          	addw	a3,s1,-1
    80001280:	00007517          	auipc	a0,0x7
    80001284:	99050513          	add	a0,a0,-1648 # 80007c10 <rodata_start+0xc10>
    80001288:	4d4010ef          	jal	8000275c <printf>
    8000128c:	00040513          	mv	a0,s0
    80001290:	045040ef          	jal	80005ad4 <free_proc>
    80001294:	00007517          	auipc	a0,0x7
    80001298:	a4450513          	add	a0,a0,-1468 # 80007cd8 <rodata_start+0xcd8>
    8000129c:	4c0010ef          	jal	8000275c <printf>
    800012a0:	00100513          	li	a0,1
    800012a4:	00090b93          	mv	s7,s2
    800012a8:	295040ef          	jal	80005d3c <can_fork>
    800012ac:	f00514e3          	bnez	a0,800011b4 <test_uid_limits+0x124>
    800012b0:	f75ff06f          	j	80001224 <test_uid_limits+0x194>
    800012b4:	00c42583          	lw	a1,12(s0)
    800012b8:	00400613          	li	a2,4
    800012bc:	00007517          	auipc	a0,0x7
    800012c0:	9ec50513          	add	a0,a0,-1556 # 80007ca8 <rodata_start+0xca8>
    800012c4:	498010ef          	jal	8000275c <printf>
    800012c8:	00007517          	auipc	a0,0x7
    800012cc:	a1050513          	add	a0,a0,-1520 # 80007cd8 <rodata_start+0xcd8>
    800012d0:	48c010ef          	jal	8000275c <printf>
    800012d4:	00100513          	li	a0,1
    800012d8:	00090b93          	mv	s7,s2
    800012dc:	261040ef          	jal	80005d3c <can_fork>
    800012e0:	ec051ae3          	bnez	a0,800011b4 <test_uid_limits+0x124>
    800012e4:	f41ff06f          	j	80001224 <test_uid_limits+0x194>

00000000800012e8 <run_process_management_tests>:
    800012e8:	ff010113          	add	sp,sp,-16
    800012ec:	00007517          	auipc	a0,0x7
    800012f0:	59c50513          	add	a0,a0,1436 # 80008888 <rodata_start+0x1888>
    800012f4:	00113423          	sd	ra,8(sp)
    800012f8:	7d4010ef          	jal	80002acc <uart_puts>
    800012fc:	00007517          	auipc	a0,0x7
    80001300:	a6c50513          	add	a0,a0,-1428 # 80007d68 <rodata_start+0xd68>
    80001304:	7c8010ef          	jal	80002acc <uart_puts>
    80001308:	00007517          	auipc	a0,0x7
    8000130c:	b2850513          	add	a0,a0,-1240 # 80007e30 <rodata_start+0xe30>
    80001310:	7bc010ef          	jal	80002acc <uart_puts>
    80001314:	00007517          	auipc	a0,0x7
    80001318:	b7c50513          	add	a0,a0,-1156 # 80007e90 <rodata_start+0xe90>
    8000131c:	7b0010ef          	jal	80002acc <uart_puts>
    80001320:	e04ff0ef          	jal	80000924 <test_process_allocation>
    80001324:	f2cff0ef          	jal	80000a50 <test_process_find>
    80001328:	809ff0ef          	jal	80000b30 <test_process_state_transition>
    8000132c:	925ff0ef          	jal	80000c50 <test_simple_fork>
    80001330:	b15ff0ef          	jal	80000e44 <test_process_memory>
    80001334:	c51ff0ef          	jal	80000f84 <test_growproc>
    80001338:	d59ff0ef          	jal	80001090 <test_uid_limits>
    8000133c:	a25ff0ef          	jal	80000d60 <test_scheduler_basic>
    80001340:	00007517          	auipc	a0,0x7
    80001344:	54850513          	add	a0,a0,1352 # 80008888 <rodata_start+0x1888>
    80001348:	784010ef          	jal	80002acc <uart_puts>
    8000134c:	00007517          	auipc	a0,0x7
    80001350:	a1c50513          	add	a0,a0,-1508 # 80007d68 <rodata_start+0xd68>
    80001354:	778010ef          	jal	80002acc <uart_puts>
    80001358:	00007517          	auipc	a0,0x7
    8000135c:	c0050513          	add	a0,a0,-1024 # 80007f58 <rodata_start+0xf58>
    80001360:	76c010ef          	jal	80002acc <uart_puts>
    80001364:	00007517          	auipc	a0,0x7
    80001368:	c4c50513          	add	a0,a0,-948 # 80007fb0 <rodata_start+0xfb0>
    8000136c:	760010ef          	jal	80002acc <uart_puts>
    80001370:	00007517          	auipc	a0,0x7
    80001374:	d1050513          	add	a0,a0,-752 # 80008080 <rodata_start+0x1080>
    80001378:	754010ef          	jal	80002acc <uart_puts>
    8000137c:	00007517          	auipc	a0,0x7
    80001380:	d1c50513          	add	a0,a0,-740 # 80008098 <rodata_start+0x1098>
    80001384:	748010ef          	jal	80002acc <uart_puts>
    80001388:	00007517          	auipc	a0,0x7
    8000138c:	d6050513          	add	a0,a0,-672 # 800080e8 <rodata_start+0x10e8>
    80001390:	73c010ef          	jal	80002acc <uart_puts>
    80001394:	00007517          	auipc	a0,0x7
    80001398:	d7450513          	add	a0,a0,-652 # 80008108 <rodata_start+0x1108>
    8000139c:	730010ef          	jal	80002acc <uart_puts>
    800013a0:	00007517          	auipc	a0,0x7
    800013a4:	d8850513          	add	a0,a0,-632 # 80008128 <rodata_start+0x1128>
    800013a8:	724010ef          	jal	80002acc <uart_puts>
    800013ac:	00007517          	auipc	a0,0x7
    800013b0:	dac50513          	add	a0,a0,-596 # 80008158 <rodata_start+0x1158>
    800013b4:	718010ef          	jal	80002acc <uart_puts>
    800013b8:	00007517          	auipc	a0,0x7
    800013bc:	dd050513          	add	a0,a0,-560 # 80008188 <rodata_start+0x1188>
    800013c0:	70c010ef          	jal	80002acc <uart_puts>
    800013c4:	00007517          	auipc	a0,0x7
    800013c8:	de450513          	add	a0,a0,-540 # 800081a8 <rodata_start+0x11a8>
    800013cc:	700010ef          	jal	80002acc <uart_puts>
    800013d0:	00813083          	ld	ra,8(sp)
    800013d4:	00007517          	auipc	a0,0x7
    800013d8:	dfc50513          	add	a0,a0,-516 # 800081d0 <rodata_start+0x11d0>
    800013dc:	01010113          	add	sp,sp,16
    800013e0:	6ec0106f          	j	80002acc <uart_puts>

00000000800013e4 <test_round_robin_scheduler>:
    800013e4:	fa010113          	add	sp,sp,-96
    800013e8:	04813823          	sd	s0,80(sp)
    800013ec:	00007517          	auipc	a0,0x7
    800013f0:	e0450513          	add	a0,a0,-508 # 800081f0 <rodata_start+0x11f0>
    800013f4:	00810413          	add	s0,sp,8
    800013f8:	04913423          	sd	s1,72(sp)
    800013fc:	05213023          	sd	s2,64(sp)
    80001400:	03313c23          	sd	s3,56(sp)
    80001404:	03413823          	sd	s4,48(sp)
    80001408:	03513423          	sd	s5,40(sp)
    8000140c:	03613023          	sd	s6,32(sp)
    80001410:	04113c23          	sd	ra,88(sp)
    80001414:	00040913          	mv	s2,s0
    80001418:	6b4010ef          	jal	80002acc <uart_puts>
    8000141c:	00000493          	li	s1,0
    80001420:	fffffb17          	auipc	s6,0xfffff
    80001424:	c60b0b13          	add	s6,s6,-928 # 80000080 <rr_worker>
    80001428:	00200a93          	li	s5,2
    8000142c:	00007a17          	auipc	s4,0x7
    80001430:	e2ca0a13          	add	s4,s4,-468 # 80008258 <rodata_start+0x1258>
    80001434:	00300993          	li	s3,3
    80001438:	4dc040ef          	jal	80005914 <alloc_proc>
    8000143c:	00050793          	mv	a5,a0
    80001440:	00a93023          	sd	a0,0(s2)
    80001444:	000a0513          	mv	a0,s4
    80001448:	06078c63          	beqz	a5,800014c0 <test_round_robin_scheduler+0xdc>
    8000144c:	0047a583          	lw	a1,4(a5)
    80001450:	0567b023          	sd	s6,64(a5)
    80001454:	0157a023          	sw	s5,0(a5)
    80001458:	304010ef          	jal	8000275c <printf>
    8000145c:	0014849b          	addw	s1,s1,1
    80001460:	00890913          	add	s2,s2,8
    80001464:	fd349ae3          	bne	s1,s3,80001438 <test_round_robin_scheduler+0x54>
    80001468:	00007517          	auipc	a0,0x7
    8000146c:	e1050513          	add	a0,a0,-496 # 80008278 <rodata_start+0x1278>
    80001470:	65c010ef          	jal	80002acc <uart_puts>
    80001474:	01840493          	add	s1,s0,24
    80001478:	2dd040ef          	jal	80005f54 <scheduler>
    8000147c:	00043503          	ld	a0,0(s0)
    80001480:	00840413          	add	s0,s0,8
    80001484:	00050463          	beqz	a0,8000148c <test_round_robin_scheduler+0xa8>
    80001488:	64c040ef          	jal	80005ad4 <free_proc>
    8000148c:	fe9418e3          	bne	s0,s1,8000147c <test_round_robin_scheduler+0x98>
    80001490:	05013403          	ld	s0,80(sp)
    80001494:	05813083          	ld	ra,88(sp)
    80001498:	04813483          	ld	s1,72(sp)
    8000149c:	04013903          	ld	s2,64(sp)
    800014a0:	03813983          	ld	s3,56(sp)
    800014a4:	03013a03          	ld	s4,48(sp)
    800014a8:	02813a83          	ld	s5,40(sp)
    800014ac:	02013b03          	ld	s6,32(sp)
    800014b0:	00007517          	auipc	a0,0x7
    800014b4:	e0850513          	add	a0,a0,-504 # 800082b8 <rodata_start+0x12b8>
    800014b8:	06010113          	add	sp,sp,96
    800014bc:	6100106f          	j	80002acc <uart_puts>
    800014c0:	00048593          	mv	a1,s1
    800014c4:	00007517          	auipc	a0,0x7
    800014c8:	d7450513          	add	a0,a0,-652 # 80008238 <rodata_start+0x1238>
    800014cc:	290010ef          	jal	8000275c <printf>
    800014d0:	f8dff06f          	j	8000145c <test_round_robin_scheduler+0x78>

00000000800014d4 <test_producer_consumer>:
    800014d4:	ff010113          	add	sp,sp,-16
    800014d8:	00007517          	auipc	a0,0x7
    800014dc:	3b050513          	add	a0,a0,944 # 80008888 <rodata_start+0x1888>
    800014e0:	00113423          	sd	ra,8(sp)
    800014e4:	00813023          	sd	s0,0(sp)
    800014e8:	5e4010ef          	jal	80002acc <uart_puts>
    800014ec:	00007517          	auipc	a0,0x7
    800014f0:	87c50513          	add	a0,a0,-1924 # 80007d68 <rodata_start+0xd68>
    800014f4:	5d8010ef          	jal	80002acc <uart_puts>
    800014f8:	00007517          	auipc	a0,0x7
    800014fc:	de850513          	add	a0,a0,-536 # 800082e0 <rodata_start+0x12e0>
    80001500:	5cc010ef          	jal	80002acc <uart_puts>
    80001504:	00007517          	auipc	a0,0x7
    80001508:	aac50513          	add	a0,a0,-1364 # 80007fb0 <rodata_start+0xfb0>
    8000150c:	5c0010ef          	jal	80002acc <uart_puts>
    80001510:	00500593          	li	a1,5
    80001514:	00007517          	auipc	a0,0x7
    80001518:	e2450513          	add	a0,a0,-476 # 80008338 <rodata_start+0x1338>
    8000151c:	240010ef          	jal	8000275c <printf>
    80001520:	00007517          	auipc	a0,0x7
    80001524:	e3050513          	add	a0,a0,-464 # 80008350 <rodata_start+0x1350>
    80001528:	234010ef          	jal	8000275c <printf>
    8000152c:	00300593          	li	a1,3
    80001530:	00007517          	auipc	a0,0x7
    80001534:	e4850513          	add	a0,a0,-440 # 80008378 <rodata_start+0x1378>
    80001538:	224010ef          	jal	8000275c <printf>
    8000153c:	00300593          	li	a1,3
    80001540:	00007517          	auipc	a0,0x7
    80001544:	e6050513          	add	a0,a0,-416 # 800083a0 <rodata_start+0x13a0>
    80001548:	214010ef          	jal	8000275c <printf>
    8000154c:	00500593          	li	a1,5
    80001550:	00010517          	auipc	a0,0x10
    80001554:	b0850513          	add	a0,a0,-1272 # 80011058 <empty>
    80001558:	1f4050ef          	jal	8000674c <sem_init>
    8000155c:	00010417          	auipc	s0,0x10
    80001560:	aa440413          	add	s0,s0,-1372 # 80011000 <full>
    80001564:	00000593          	li	a1,0
    80001568:	00040513          	mv	a0,s0
    8000156c:	1e0050ef          	jal	8000674c <sem_init>
    80001570:	00100593          	li	a1,1
    80001574:	00010517          	auipc	a0,0x10
    80001578:	aac50513          	add	a0,a0,-1364 # 80011020 <mutex>
    8000157c:	1d0050ef          	jal	8000674c <sem_init>
    80001580:	02042683          	lw	a3,32(s0)
    80001584:	00042603          	lw	a2,0(s0)
    80001588:	05842583          	lw	a1,88(s0)
    8000158c:	00007517          	auipc	a0,0x7
    80001590:	e3c50513          	add	a0,a0,-452 # 800083c8 <rodata_start+0x13c8>
    80001594:	1c8010ef          	jal	8000275c <printf>
    80001598:	37c040ef          	jal	80005914 <alloc_proc>
    8000159c:	02050463          	beqz	a0,800015c4 <test_producer_consumer+0xf0>
    800015a0:	fffff797          	auipc	a5,0xfffff
    800015a4:	cd078793          	add	a5,a5,-816 # 80000270 <producer>
    800015a8:	00452583          	lw	a1,4(a0)
    800015ac:	04f53023          	sd	a5,64(a0)
    800015b0:	00200793          	li	a5,2
    800015b4:	00f52023          	sw	a5,0(a0)
    800015b8:	00007517          	auipc	a0,0x7
    800015bc:	e4850513          	add	a0,a0,-440 # 80008400 <rodata_start+0x1400>
    800015c0:	19c010ef          	jal	8000275c <printf>
    800015c4:	350040ef          	jal	80005914 <alloc_proc>
    800015c8:	02050463          	beqz	a0,800015f0 <test_producer_consumer+0x11c>
    800015cc:	fffff797          	auipc	a5,0xfffff
    800015d0:	ca478793          	add	a5,a5,-860 # 80000270 <producer>
    800015d4:	00452583          	lw	a1,4(a0)
    800015d8:	04f53023          	sd	a5,64(a0)
    800015dc:	00200793          	li	a5,2
    800015e0:	00f52023          	sw	a5,0(a0)
    800015e4:	00007517          	auipc	a0,0x7
    800015e8:	e1c50513          	add	a0,a0,-484 # 80008400 <rodata_start+0x1400>
    800015ec:	170010ef          	jal	8000275c <printf>
    800015f0:	324040ef          	jal	80005914 <alloc_proc>
    800015f4:	02050463          	beqz	a0,8000161c <test_producer_consumer+0x148>
    800015f8:	fffff797          	auipc	a5,0xfffff
    800015fc:	b3478793          	add	a5,a5,-1228 # 8000012c <consumer>
    80001600:	00452583          	lw	a1,4(a0)
    80001604:	04f53023          	sd	a5,64(a0)
    80001608:	00200793          	li	a5,2
    8000160c:	00f52023          	sw	a5,0(a0)
    80001610:	00007517          	auipc	a0,0x7
    80001614:	e1050513          	add	a0,a0,-496 # 80008420 <rodata_start+0x1420>
    80001618:	144010ef          	jal	8000275c <printf>
    8000161c:	2f8040ef          	jal	80005914 <alloc_proc>
    80001620:	02050463          	beqz	a0,80001648 <test_producer_consumer+0x174>
    80001624:	fffff797          	auipc	a5,0xfffff
    80001628:	b0878793          	add	a5,a5,-1272 # 8000012c <consumer>
    8000162c:	00452583          	lw	a1,4(a0)
    80001630:	04f53023          	sd	a5,64(a0)
    80001634:	00200793          	li	a5,2
    80001638:	00f52023          	sw	a5,0(a0)
    8000163c:	00007517          	auipc	a0,0x7
    80001640:	de450513          	add	a0,a0,-540 # 80008420 <rodata_start+0x1420>
    80001644:	118010ef          	jal	8000275c <printf>
    80001648:	00007517          	auipc	a0,0x7
    8000164c:	df850513          	add	a0,a0,-520 # 80008440 <rodata_start+0x1440>
    80001650:	47c010ef          	jal	80002acc <uart_puts>
    80001654:	00013403          	ld	s0,0(sp)
    80001658:	00813083          	ld	ra,8(sp)
    8000165c:	01010113          	add	sp,sp,16
    80001660:	0f50406f          	j	80005f54 <scheduler>

0000000080001664 <test_reader_writer>:
    80001664:	fd010113          	add	sp,sp,-48
    80001668:	00007517          	auipc	a0,0x7
    8000166c:	22050513          	add	a0,a0,544 # 80008888 <rodata_start+0x1888>
    80001670:	02113423          	sd	ra,40(sp)
    80001674:	02813023          	sd	s0,32(sp)
    80001678:	00913c23          	sd	s1,24(sp)
    8000167c:	01213823          	sd	s2,16(sp)
    80001680:	01313423          	sd	s3,8(sp)
    80001684:	448010ef          	jal	80002acc <uart_puts>
    80001688:	00006517          	auipc	a0,0x6
    8000168c:	6e050513          	add	a0,a0,1760 # 80007d68 <rodata_start+0xd68>
    80001690:	43c010ef          	jal	80002acc <uart_puts>
    80001694:	00007517          	auipc	a0,0x7
    80001698:	dd450513          	add	a0,a0,-556 # 80008468 <rodata_start+0x1468>
    8000169c:	430010ef          	jal	80002acc <uart_puts>
    800016a0:	00007517          	auipc	a0,0x7
    800016a4:	91050513          	add	a0,a0,-1776 # 80007fb0 <rodata_start+0xfb0>
    800016a8:	424010ef          	jal	80002acc <uart_puts>
    800016ac:	00425597          	auipc	a1,0x425
    800016b0:	cf85a583          	lw	a1,-776(a1) # 804263a4 <shared_data>
    800016b4:	00007517          	auipc	a0,0x7
    800016b8:	e1450513          	add	a0,a0,-492 # 800084c8 <rodata_start+0x14c8>
    800016bc:	0a0010ef          	jal	8000275c <printf>
    800016c0:	00007517          	auipc	a0,0x7
    800016c4:	e2850513          	add	a0,a0,-472 # 800084e8 <rodata_start+0x14e8>
    800016c8:	094010ef          	jal	8000275c <printf>
    800016cc:	00300593          	li	a1,3
    800016d0:	00007517          	auipc	a0,0x7
    800016d4:	e4050513          	add	a0,a0,-448 # 80008510 <rodata_start+0x1510>
    800016d8:	084010ef          	jal	8000275c <printf>
    800016dc:	00200593          	li	a1,2
    800016e0:	00007517          	auipc	a0,0x7
    800016e4:	e5050513          	add	a0,a0,-432 # 80008530 <rodata_start+0x1530>
    800016e8:	074010ef          	jal	8000275c <printf>
    800016ec:	00100593          	li	a1,1
    800016f0:	00010517          	auipc	a0,0x10
    800016f4:	98850513          	add	a0,a0,-1656 # 80011078 <rw_mutex>
    800016f8:	054050ef          	jal	8000674c <sem_init>
    800016fc:	00100593          	li	a1,1
    80001700:	00010517          	auipc	a0,0x10
    80001704:	99850513          	add	a0,a0,-1640 # 80011098 <read_mutex>
    80001708:	044050ef          	jal	8000674c <sem_init>
    8000170c:	00100593          	li	a1,1
    80001710:	00010517          	auipc	a0,0x10
    80001714:	a4850513          	add	a0,a0,-1464 # 80011158 <write_mutex>
    80001718:	034050ef          	jal	8000674c <sem_init>
    8000171c:	00010797          	auipc	a5,0x10
    80001720:	8e478793          	add	a5,a5,-1820 # 80011000 <full>
    80001724:	0987a603          	lw	a2,152(a5)
    80001728:	0787a583          	lw	a1,120(a5)
    8000172c:	00007517          	auipc	a0,0x7
    80001730:	e2450513          	add	a0,a0,-476 # 80008550 <rodata_start+0x1550>
    80001734:	00300413          	li	s0,3
    80001738:	024010ef          	jal	8000275c <printf>
    8000173c:	00007517          	auipc	a0,0x7
    80001740:	e4c50513          	add	a0,a0,-436 # 80008588 <rodata_start+0x1588>
    80001744:	388010ef          	jal	80002acc <uart_puts>
    80001748:	00007517          	auipc	a0,0x7
    8000174c:	e5050513          	add	a0,a0,-432 # 80008598 <rodata_start+0x1598>
    80001750:	37c010ef          	jal	80002acc <uart_puts>
    80001754:	00007517          	auipc	a0,0x7
    80001758:	e7c50513          	add	a0,a0,-388 # 800085d0 <rodata_start+0x15d0>
    8000175c:	370010ef          	jal	80002acc <uart_puts>
    80001760:	00007517          	auipc	a0,0x7
    80001764:	ea850513          	add	a0,a0,-344 # 80008608 <rodata_start+0x1608>
    80001768:	364010ef          	jal	80002acc <uart_puts>
    8000176c:	fffff997          	auipc	s3,0xfffff
    80001770:	dd098993          	add	s3,s3,-560 # 8000053c <reader>
    80001774:	00200913          	li	s2,2
    80001778:	00007497          	auipc	s1,0x7
    8000177c:	ed048493          	add	s1,s1,-304 # 80008648 <rodata_start+0x1648>
    80001780:	194040ef          	jal	80005914 <alloc_proc>
    80001784:	00050793          	mv	a5,a0
    80001788:	fff4041b          	addw	s0,s0,-1
    8000178c:	00048513          	mv	a0,s1
    80001790:	00078a63          	beqz	a5,800017a4 <test_reader_writer+0x140>
    80001794:	0047a583          	lw	a1,4(a5)
    80001798:	0537b023          	sd	s3,64(a5)
    8000179c:	0127a023          	sw	s2,0(a5)
    800017a0:	7bd000ef          	jal	8000275c <printf>
    800017a4:	fc041ee3          	bnez	s0,80001780 <test_reader_writer+0x11c>
    800017a8:	16c040ef          	jal	80005914 <alloc_proc>
    800017ac:	02050463          	beqz	a0,800017d4 <test_reader_writer+0x170>
    800017b0:	fffff797          	auipc	a5,0xfffff
    800017b4:	c2878793          	add	a5,a5,-984 # 800003d8 <writer>
    800017b8:	00452583          	lw	a1,4(a0)
    800017bc:	04f53023          	sd	a5,64(a0)
    800017c0:	00200793          	li	a5,2
    800017c4:	00f52023          	sw	a5,0(a0)
    800017c8:	00007517          	auipc	a0,0x7
    800017cc:	ea050513          	add	a0,a0,-352 # 80008668 <rodata_start+0x1668>
    800017d0:	78d000ef          	jal	8000275c <printf>
    800017d4:	140040ef          	jal	80005914 <alloc_proc>
    800017d8:	02050463          	beqz	a0,80001800 <test_reader_writer+0x19c>
    800017dc:	fffff797          	auipc	a5,0xfffff
    800017e0:	bfc78793          	add	a5,a5,-1028 # 800003d8 <writer>
    800017e4:	00452583          	lw	a1,4(a0)
    800017e8:	04f53023          	sd	a5,64(a0)
    800017ec:	00200793          	li	a5,2
    800017f0:	00f52023          	sw	a5,0(a0)
    800017f4:	00007517          	auipc	a0,0x7
    800017f8:	e7450513          	add	a0,a0,-396 # 80008668 <rodata_start+0x1668>
    800017fc:	761000ef          	jal	8000275c <printf>
    80001800:	00007517          	auipc	a0,0x7
    80001804:	e8850513          	add	a0,a0,-376 # 80008688 <rodata_start+0x1688>
    80001808:	2c4010ef          	jal	80002acc <uart_puts>
    8000180c:	02013403          	ld	s0,32(sp)
    80001810:	02813083          	ld	ra,40(sp)
    80001814:	01813483          	ld	s1,24(sp)
    80001818:	01013903          	ld	s2,16(sp)
    8000181c:	00813983          	ld	s3,8(sp)
    80001820:	03010113          	add	sp,sp,48
    80001824:	7300406f          	j	80005f54 <scheduler>

0000000080001828 <test_dining_philosophers>:
    80001828:	fd010113          	add	sp,sp,-48
    8000182c:	00007517          	auipc	a0,0x7
    80001830:	05c50513          	add	a0,a0,92 # 80008888 <rodata_start+0x1888>
    80001834:	02113423          	sd	ra,40(sp)
    80001838:	02813023          	sd	s0,32(sp)
    8000183c:	00913c23          	sd	s1,24(sp)
    80001840:	01213823          	sd	s2,16(sp)
    80001844:	01313423          	sd	s3,8(sp)
    80001848:	01413023          	sd	s4,0(sp)
    8000184c:	280010ef          	jal	80002acc <uart_puts>
    80001850:	00006517          	auipc	a0,0x6
    80001854:	51850513          	add	a0,a0,1304 # 80007d68 <rodata_start+0xd68>
    80001858:	274010ef          	jal	80002acc <uart_puts>
    8000185c:	00007517          	auipc	a0,0x7
    80001860:	e4c50513          	add	a0,a0,-436 # 800086a8 <rodata_start+0x16a8>
    80001864:	268010ef          	jal	80002acc <uart_puts>
    80001868:	00006517          	auipc	a0,0x6
    8000186c:	74850513          	add	a0,a0,1864 # 80007fb0 <rodata_start+0xfb0>
    80001870:	25c010ef          	jal	80002acc <uart_puts>
    80001874:	00500593          	li	a1,5
    80001878:	00007517          	auipc	a0,0x7
    8000187c:	e8850513          	add	a0,a0,-376 # 80008700 <rodata_start+0x1700>
    80001880:	6dd000ef          	jal	8000275c <printf>
    80001884:	00200593          	li	a1,2
    80001888:	00007517          	auipc	a0,0x7
    8000188c:	e9050513          	add	a0,a0,-368 # 80008718 <rodata_start+0x1718>
    80001890:	6cd000ef          	jal	8000275c <printf>
    80001894:	00010497          	auipc	s1,0x10
    80001898:	82448493          	add	s1,s1,-2012 # 800110b8 <forks>
    8000189c:	00000413          	li	s0,0
    800018a0:	00007997          	auipc	s3,0x7
    800018a4:	e9898993          	add	s3,s3,-360 # 80008738 <rodata_start+0x1738>
    800018a8:	00500913          	li	s2,5
    800018ac:	00048513          	mv	a0,s1
    800018b0:	00100593          	li	a1,1
    800018b4:	699040ef          	jal	8000674c <sem_init>
    800018b8:	00040593          	mv	a1,s0
    800018bc:	00098513          	mv	a0,s3
    800018c0:	0014041b          	addw	s0,s0,1
    800018c4:	699000ef          	jal	8000275c <printf>
    800018c8:	02048493          	add	s1,s1,32
    800018cc:	ff2410e3          	bne	s0,s2,800018ac <test_dining_philosophers+0x84>
    800018d0:	00007517          	auipc	a0,0x7
    800018d4:	e8050513          	add	a0,a0,-384 # 80008750 <rodata_start+0x1750>
    800018d8:	1f4010ef          	jal	80002acc <uart_puts>
    800018dc:	00007517          	auipc	a0,0x7
    800018e0:	e8450513          	add	a0,a0,-380 # 80008760 <rodata_start+0x1760>
    800018e4:	1e8010ef          	jal	80002acc <uart_puts>
    800018e8:	00007517          	auipc	a0,0x7
    800018ec:	ea050513          	add	a0,a0,-352 # 80008788 <rodata_start+0x1788>
    800018f0:	1dc010ef          	jal	80002acc <uart_puts>
    800018f4:	00007517          	auipc	a0,0x7
    800018f8:	ecc50513          	add	a0,a0,-308 # 800087c0 <rodata_start+0x17c0>
    800018fc:	1d0010ef          	jal	80002acc <uart_puts>
    80001900:	00007517          	auipc	a0,0x7
    80001904:	f0050513          	add	a0,a0,-256 # 80008800 <rodata_start+0x1800>
    80001908:	1c4010ef          	jal	80002acc <uart_puts>
    8000190c:	00000413          	li	s0,0
    80001910:	fffffa17          	auipc	s4,0xfffff
    80001914:	df4a0a13          	add	s4,s4,-524 # 80000704 <philosopher>
    80001918:	00200993          	li	s3,2
    8000191c:	00007917          	auipc	s2,0x7
    80001920:	f1c90913          	add	s2,s2,-228 # 80008838 <rodata_start+0x1838>
    80001924:	00500493          	li	s1,5
    80001928:	7ed030ef          	jal	80005914 <alloc_proc>
    8000192c:	00050793          	mv	a5,a0
    80001930:	00040613          	mv	a2,s0
    80001934:	00090513          	mv	a0,s2
    80001938:	0014041b          	addw	s0,s0,1
    8000193c:	00078a63          	beqz	a5,80001950 <test_dining_philosophers+0x128>
    80001940:	0047a583          	lw	a1,4(a5)
    80001944:	0547b023          	sd	s4,64(a5)
    80001948:	0137a023          	sw	s3,0(a5)
    8000194c:	611000ef          	jal	8000275c <printf>
    80001950:	fc941ce3          	bne	s0,s1,80001928 <test_dining_philosophers+0x100>
    80001954:	00007517          	auipc	a0,0x7
    80001958:	f1450513          	add	a0,a0,-236 # 80008868 <rodata_start+0x1868>
    8000195c:	170010ef          	jal	80002acc <uart_puts>
    80001960:	02013403          	ld	s0,32(sp)
    80001964:	02813083          	ld	ra,40(sp)
    80001968:	01813483          	ld	s1,24(sp)
    8000196c:	01013903          	ld	s2,16(sp)
    80001970:	00813983          	ld	s3,8(sp)
    80001974:	00013a03          	ld	s4,0(sp)
    80001978:	03010113          	add	sp,sp,48
    8000197c:	5d80406f          	j	80005f54 <scheduler>

0000000080001980 <test_trap_initialization>:
    80001980:	ff010113          	add	sp,sp,-16
    80001984:	00007517          	auipc	a0,0x7
    80001988:	f0c50513          	add	a0,a0,-244 # 80008890 <rodata_start+0x1890>
    8000198c:	00113423          	sd	ra,8(sp)
    80001990:	00813023          	sd	s0,0(sp)
    80001994:	138010ef          	jal	80002acc <uart_puts>
    80001998:	0e5030ef          	jal	8000527c <trap_init>
    8000199c:	191030ef          	jal	8000532c <trap_init_hart>
    800019a0:	10502473          	csrr	s0,stvec
    800019a4:	00007517          	auipc	a0,0x7
    800019a8:	f2c50513          	add	a0,a0,-212 # 800088d0 <rodata_start+0x18d0>
    800019ac:	00040593          	mv	a1,s0
    800019b0:	5ad000ef          	jal	8000275c <printf>
    800019b4:	02040c63          	beqz	s0,800019ec <test_trap_initialization+0x6c>
    800019b8:	00007517          	auipc	a0,0x7
    800019bc:	f3850513          	add	a0,a0,-200 # 800088f0 <rodata_start+0x18f0>
    800019c0:	10c010ef          	jal	80002acc <uart_puts>
    800019c4:	104025f3          	csrr	a1,sie
    800019c8:	00007517          	auipc	a0,0x7
    800019cc:	f7050513          	add	a0,a0,-144 # 80008938 <rodata_start+0x1938>
    800019d0:	58d000ef          	jal	8000275c <printf>
    800019d4:	00013403          	ld	s0,0(sp)
    800019d8:	00813083          	ld	ra,8(sp)
    800019dc:	00007517          	auipc	a0,0x7
    800019e0:	f8c50513          	add	a0,a0,-116 # 80008968 <rodata_start+0x1968>
    800019e4:	01010113          	add	sp,sp,16
    800019e8:	0e40106f          	j	80002acc <uart_puts>
    800019ec:	00007517          	auipc	a0,0x7
    800019f0:	f2450513          	add	a0,a0,-220 # 80008910 <rodata_start+0x1910>
    800019f4:	0d8010ef          	jal	80002acc <uart_puts>
    800019f8:	fcdff06f          	j	800019c4 <test_trap_initialization+0x44>

00000000800019fc <test_interrupt_control>:
    800019fc:	ff010113          	add	sp,sp,-16
    80001a00:	00007517          	auipc	a0,0x7
    80001a04:	f8050513          	add	a0,a0,-128 # 80008980 <rodata_start+0x1980>
    80001a08:	00113423          	sd	ra,8(sp)
    80001a0c:	00813023          	sd	s0,0(sp)
    80001a10:	0bc010ef          	jal	80002acc <uart_puts>
    80001a14:	00007517          	auipc	a0,0x7
    80001a18:	fac50513          	add	a0,a0,-84 # 800089c0 <rodata_start+0x19c0>
    80001a1c:	0b0010ef          	jal	80002acc <uart_puts>
    80001a20:	031030ef          	jal	80005250 <intr_off>
    80001a24:	03d030ef          	jal	80005260 <intr_get>
    80001a28:	00050413          	mv	s0,a0
    80001a2c:	00050593          	mv	a1,a0
    80001a30:	00007517          	auipc	a0,0x7
    80001a34:	fa850513          	add	a0,a0,-88 # 800089d8 <rodata_start+0x19d8>
    80001a38:	525000ef          	jal	8000275c <printf>
    80001a3c:	06041063          	bnez	s0,80001a9c <test_interrupt_control+0xa0>
    80001a40:	00007517          	auipc	a0,0x7
    80001a44:	fb850513          	add	a0,a0,-72 # 800089f8 <rodata_start+0x19f8>
    80001a48:	084010ef          	jal	80002acc <uart_puts>
    80001a4c:	00007517          	auipc	a0,0x7
    80001a50:	fdc50513          	add	a0,a0,-36 # 80008a28 <rodata_start+0x1a28>
    80001a54:	078010ef          	jal	80002acc <uart_puts>
    80001a58:	7e8030ef          	jal	80005240 <intr_on>
    80001a5c:	005030ef          	jal	80005260 <intr_get>
    80001a60:	00050413          	mv	s0,a0
    80001a64:	00050593          	mv	a1,a0
    80001a68:	00007517          	auipc	a0,0x7
    80001a6c:	fd850513          	add	a0,a0,-40 # 80008a40 <rodata_start+0x1a40>
    80001a70:	4ed000ef          	jal	8000275c <printf>
    80001a74:	02040c63          	beqz	s0,80001aac <test_interrupt_control+0xb0>
    80001a78:	00007517          	auipc	a0,0x7
    80001a7c:	fe850513          	add	a0,a0,-24 # 80008a60 <rodata_start+0x1a60>
    80001a80:	04c010ef          	jal	80002acc <uart_puts>
    80001a84:	00013403          	ld	s0,0(sp)
    80001a88:	00813083          	ld	ra,8(sp)
    80001a8c:	00007517          	auipc	a0,0x7
    80001a90:	00450513          	add	a0,a0,4 # 80008a90 <rodata_start+0x1a90>
    80001a94:	01010113          	add	sp,sp,16
    80001a98:	0340106f          	j	80002acc <uart_puts>
    80001a9c:	00007517          	auipc	a0,0x7
    80001aa0:	f7450513          	add	a0,a0,-140 # 80008a10 <rodata_start+0x1a10>
    80001aa4:	028010ef          	jal	80002acc <uart_puts>
    80001aa8:	fa5ff06f          	j	80001a4c <test_interrupt_control+0x50>
    80001aac:	00007517          	auipc	a0,0x7
    80001ab0:	fcc50513          	add	a0,a0,-52 # 80008a78 <rodata_start+0x1a78>
    80001ab4:	018010ef          	jal	80002acc <uart_puts>
    80001ab8:	00013403          	ld	s0,0(sp)
    80001abc:	00813083          	ld	ra,8(sp)
    80001ac0:	00007517          	auipc	a0,0x7
    80001ac4:	fd050513          	add	a0,a0,-48 # 80008a90 <rodata_start+0x1a90>
    80001ac8:	01010113          	add	sp,sp,16
    80001acc:	0000106f          	j	80002acc <uart_puts>

0000000080001ad0 <test_trapframe_allocation>:
    80001ad0:	fe010113          	add	sp,sp,-32
    80001ad4:	00007517          	auipc	a0,0x7
    80001ad8:	fd450513          	add	a0,a0,-44 # 80008aa8 <rodata_start+0x1aa8>
    80001adc:	00113c23          	sd	ra,24(sp)
    80001ae0:	00813823          	sd	s0,16(sp)
    80001ae4:	00913423          	sd	s1,8(sp)
    80001ae8:	01213023          	sd	s2,0(sp)
    80001aec:	7e1000ef          	jal	80002acc <uart_puts>
    80001af0:	00007517          	auipc	a0,0x7
    80001af4:	ff850513          	add	a0,a0,-8 # 80008ae8 <rodata_start+0x1ae8>
    80001af8:	7d5000ef          	jal	80002acc <uart_puts>
    80001afc:	6a0030ef          	jal	8000519c <alloc_trapframe>
    80001b00:	00050413          	mv	s0,a0
    80001b04:	698030ef          	jal	8000519c <alloc_trapframe>
    80001b08:	00050493          	mv	s1,a0
    80001b0c:	690030ef          	jal	8000519c <alloc_trapframe>
    80001b10:	10040863          	beqz	s0,80001c20 <test_trapframe_allocation+0x150>
    80001b14:	10048663          	beqz	s1,80001c20 <test_trapframe_allocation+0x150>
    80001b18:	00050913          	mv	s2,a0
    80001b1c:	10050263          	beqz	a0,80001c20 <test_trapframe_allocation+0x150>
    80001b20:	00007517          	auipc	a0,0x7
    80001b24:	fe050513          	add	a0,a0,-32 # 80008b00 <rodata_start+0x1b00>
    80001b28:	435000ef          	jal	8000275c <printf>
    80001b2c:	00040593          	mv	a1,s0
    80001b30:	00007517          	auipc	a0,0x7
    80001b34:	ff050513          	add	a0,a0,-16 # 80008b20 <rodata_start+0x1b20>
    80001b38:	425000ef          	jal	8000275c <printf>
    80001b3c:	00048593          	mv	a1,s1
    80001b40:	00007517          	auipc	a0,0x7
    80001b44:	ff050513          	add	a0,a0,-16 # 80008b30 <rodata_start+0x1b30>
    80001b48:	415000ef          	jal	8000275c <printf>
    80001b4c:	00090593          	mv	a1,s2
    80001b50:	00007517          	auipc	a0,0x7
    80001b54:	ff050513          	add	a0,a0,-16 # 80008b40 <rodata_start+0x1b40>
    80001b58:	405000ef          	jal	8000275c <printf>
    80001b5c:	00940463          	beq	s0,s1,80001b64 <test_trapframe_allocation+0x94>
    80001b60:	0f249663          	bne	s1,s2,80001c4c <test_trapframe_allocation+0x17c>
    80001b64:	00007517          	auipc	a0,0x7
    80001b68:	00c50513          	add	a0,a0,12 # 80008b70 <rodata_start+0x1b70>
    80001b6c:	761000ef          	jal	80002acc <uart_puts>
    80001b70:	00007517          	auipc	a0,0x7
    80001b74:	03050513          	add	a0,a0,48 # 80008ba0 <rodata_start+0x1ba0>
    80001b78:	755000ef          	jal	80002acc <uart_puts>
    80001b7c:	21d957b7          	lui	a5,0x21d95
    80001b80:	00279793          	sll	a5,a5,0x2
    80001b84:	32178793          	add	a5,a5,801 # 21d95321 <_entry-0x5e26acdf>
    80001b88:	12345737          	lui	a4,0x12345
    80001b8c:	67870713          	add	a4,a4,1656 # 12345678 <_entry-0x6dcba988>
    80001b90:	00f43823          	sd	a5,16(s0)
    80001b94:	02a00793          	li	a5,42
    80001b98:	00e43423          	sd	a4,8(s0)
    80001b9c:	04f43823          	sd	a5,80(s0)
    80001ba0:	00007517          	auipc	a0,0x7
    80001ba4:	02050513          	add	a0,a0,32 # 80008bc0 <rodata_start+0x1bc0>
    80001ba8:	725000ef          	jal	80002acc <uart_puts>
    80001bac:	00007517          	auipc	a0,0x7
    80001bb0:	03450513          	add	a0,a0,52 # 80008be0 <rodata_start+0x1be0>
    80001bb4:	719000ef          	jal	80002acc <uart_puts>
    80001bb8:	00040513          	mv	a0,s0
    80001bbc:	640030ef          	jal	800051fc <free_trapframe>
    80001bc0:	00048513          	mv	a0,s1
    80001bc4:	638030ef          	jal	800051fc <free_trapframe>
    80001bc8:	00090513          	mv	a0,s2
    80001bcc:	630030ef          	jal	800051fc <free_trapframe>
    80001bd0:	00007517          	auipc	a0,0x7
    80001bd4:	02850513          	add	a0,a0,40 # 80008bf8 <rodata_start+0x1bf8>
    80001bd8:	6f5000ef          	jal	80002acc <uart_puts>
    80001bdc:	5c0030ef          	jal	8000519c <alloc_trapframe>
    80001be0:	00050413          	mv	s0,a0
    80001be4:	04050463          	beqz	a0,80001c2c <test_trapframe_allocation+0x15c>
    80001be8:	00050593          	mv	a1,a0
    80001bec:	00007517          	auipc	a0,0x7
    80001bf0:	02c50513          	add	a0,a0,44 # 80008c18 <rodata_start+0x1c18>
    80001bf4:	369000ef          	jal	8000275c <printf>
    80001bf8:	00040513          	mv	a0,s0
    80001bfc:	600030ef          	jal	800051fc <free_trapframe>
    80001c00:	01013403          	ld	s0,16(sp)
    80001c04:	01813083          	ld	ra,24(sp)
    80001c08:	00813483          	ld	s1,8(sp)
    80001c0c:	00013903          	ld	s2,0(sp)
    80001c10:	00007517          	auipc	a0,0x7
    80001c14:	05850513          	add	a0,a0,88 # 80008c68 <rodata_start+0x1c68>
    80001c18:	02010113          	add	sp,sp,32
    80001c1c:	6b10006f          	j	80002acc <uart_puts>
    80001c20:	00007517          	auipc	a0,0x7
    80001c24:	02850513          	add	a0,a0,40 # 80008c48 <rodata_start+0x1c48>
    80001c28:	6a5000ef          	jal	80002acc <uart_puts>
    80001c2c:	01013403          	ld	s0,16(sp)
    80001c30:	01813083          	ld	ra,24(sp)
    80001c34:	00813483          	ld	s1,8(sp)
    80001c38:	00013903          	ld	s2,0(sp)
    80001c3c:	00007517          	auipc	a0,0x7
    80001c40:	02c50513          	add	a0,a0,44 # 80008c68 <rodata_start+0x1c68>
    80001c44:	02010113          	add	sp,sp,32
    80001c48:	6850006f          	j	80002acc <uart_puts>
    80001c4c:	00007517          	auipc	a0,0x7
    80001c50:	f0450513          	add	a0,a0,-252 # 80008b50 <rodata_start+0x1b50>
    80001c54:	679000ef          	jal	80002acc <uart_puts>
    80001c58:	f19ff06f          	j	80001b70 <test_trapframe_allocation+0xa0>

0000000080001c5c <test_csr_operations>:
    80001c5c:	ff010113          	add	sp,sp,-16
    80001c60:	00007517          	auipc	a0,0x7
    80001c64:	02050513          	add	a0,a0,32 # 80008c80 <rodata_start+0x1c80>
    80001c68:	00113423          	sd	ra,8(sp)
    80001c6c:	00813023          	sd	s0,0(sp)
    80001c70:	65d000ef          	jal	80002acc <uart_puts>
    80001c74:	10002473          	csrr	s0,sstatus
    80001c78:	00007517          	auipc	a0,0x7
    80001c7c:	04050513          	add	a0,a0,64 # 80008cb8 <rodata_start+0x1cb8>
    80001c80:	00040593          	mv	a1,s0
    80001c84:	2d9000ef          	jal	8000275c <printf>
    80001c88:	142025f3          	csrr	a1,scause
    80001c8c:	00007517          	auipc	a0,0x7
    80001c90:	04450513          	add	a0,a0,68 # 80008cd0 <rodata_start+0x1cd0>
    80001c94:	2c9000ef          	jal	8000275c <printf>
    80001c98:	141025f3          	csrr	a1,sepc
    80001c9c:	00007517          	auipc	a0,0x7
    80001ca0:	04c50513          	add	a0,a0,76 # 80008ce8 <rodata_start+0x1ce8>
    80001ca4:	2b9000ef          	jal	8000275c <printf>
    80001ca8:	00007517          	auipc	a0,0x7
    80001cac:	05850513          	add	a0,a0,88 # 80008d00 <rodata_start+0x1d00>
    80001cb0:	61d000ef          	jal	80002acc <uart_puts>
    80001cb4:	00000793          	li	a5,0
    80001cb8:	10079073          	csrw	sstatus,a5
    80001cbc:	100025f3          	csrr	a1,sstatus
    80001cc0:	00007517          	auipc	a0,0x7
    80001cc4:	05850513          	add	a0,a0,88 # 80008d18 <rodata_start+0x1d18>
    80001cc8:	295000ef          	jal	8000275c <printf>
    80001ccc:	10041073          	csrw	sstatus,s0
    80001cd0:	00007517          	auipc	a0,0x7
    80001cd4:	06050513          	add	a0,a0,96 # 80008d30 <rodata_start+0x1d30>
    80001cd8:	5f5000ef          	jal	80002acc <uart_puts>
    80001cdc:	00013403          	ld	s0,0(sp)
    80001ce0:	00813083          	ld	ra,8(sp)
    80001ce4:	00007517          	auipc	a0,0x7
    80001ce8:	06450513          	add	a0,a0,100 # 80008d48 <rodata_start+0x1d48>
    80001cec:	01010113          	add	sp,sp,16
    80001cf0:	5dd0006f          	j	80002acc <uart_puts>

0000000080001cf4 <test_exception_definitions>:
    80001cf4:	ff010113          	add	sp,sp,-16
    80001cf8:	00007517          	auipc	a0,0x7
    80001cfc:	06850513          	add	a0,a0,104 # 80008d60 <rodata_start+0x1d60>
    80001d00:	00113423          	sd	ra,8(sp)
    80001d04:	5c9000ef          	jal	80002acc <uart_puts>
    80001d08:	00007517          	auipc	a0,0x7
    80001d0c:	09850513          	add	a0,a0,152 # 80008da0 <rodata_start+0x1da0>
    80001d10:	24d000ef          	jal	8000275c <printf>
    80001d14:	00200593          	li	a1,2
    80001d18:	00007517          	auipc	a0,0x7
    80001d1c:	0a050513          	add	a0,a0,160 # 80008db8 <rodata_start+0x1db8>
    80001d20:	23d000ef          	jal	8000275c <printf>
    80001d24:	00d00593          	li	a1,13
    80001d28:	00007517          	auipc	a0,0x7
    80001d2c:	0b050513          	add	a0,a0,176 # 80008dd8 <rodata_start+0x1dd8>
    80001d30:	22d000ef          	jal	8000275c <printf>
    80001d34:	00f00593          	li	a1,15
    80001d38:	00007517          	auipc	a0,0x7
    80001d3c:	0c050513          	add	a0,a0,192 # 80008df8 <rodata_start+0x1df8>
    80001d40:	21d000ef          	jal	8000275c <printf>
    80001d44:	00800593          	li	a1,8
    80001d48:	00007517          	auipc	a0,0x7
    80001d4c:	0d050513          	add	a0,a0,208 # 80008e18 <rodata_start+0x1e18>
    80001d50:	20d000ef          	jal	8000275c <printf>
    80001d54:	00007517          	auipc	a0,0x7
    80001d58:	0dc50513          	add	a0,a0,220 # 80008e30 <rodata_start+0x1e30>
    80001d5c:	201000ef          	jal	8000275c <printf>
    80001d60:	00500593          	li	a1,5
    80001d64:	00007517          	auipc	a0,0x7
    80001d68:	0e450513          	add	a0,a0,228 # 80008e48 <rodata_start+0x1e48>
    80001d6c:	1f1000ef          	jal	8000275c <printf>
    80001d70:	00700593          	li	a1,7
    80001d74:	00007517          	auipc	a0,0x7
    80001d78:	0ec50513          	add	a0,a0,236 # 80008e60 <rodata_start+0x1e60>
    80001d7c:	1e1000ef          	jal	8000275c <printf>
    80001d80:	00900593          	li	a1,9
    80001d84:	00007517          	auipc	a0,0x7
    80001d88:	0f450513          	add	a0,a0,244 # 80008e78 <rodata_start+0x1e78>
    80001d8c:	1d1000ef          	jal	8000275c <printf>
    80001d90:	00007517          	auipc	a0,0x7
    80001d94:	10050513          	add	a0,a0,256 # 80008e90 <rodata_start+0x1e90>
    80001d98:	535000ef          	jal	80002acc <uart_puts>
    80001d9c:	00813083          	ld	ra,8(sp)
    80001da0:	00007517          	auipc	a0,0x7
    80001da4:	11850513          	add	a0,a0,280 # 80008eb8 <rodata_start+0x1eb8>
    80001da8:	01010113          	add	sp,sp,16
    80001dac:	5210006f          	j	80002acc <uart_puts>

0000000080001db0 <test_trapframe_structure>:
    80001db0:	ff010113          	add	sp,sp,-16
    80001db4:	00007517          	auipc	a0,0x7
    80001db8:	11c50513          	add	a0,a0,284 # 80008ed0 <rodata_start+0x1ed0>
    80001dbc:	00113423          	sd	ra,8(sp)
    80001dc0:	50d000ef          	jal	80002acc <uart_puts>
    80001dc4:	11000593          	li	a1,272
    80001dc8:	00007517          	auipc	a0,0x7
    80001dcc:	14050513          	add	a0,a0,320 # 80008f08 <rodata_start+0x1f08>
    80001dd0:	18d000ef          	jal	8000275c <printf>
    80001dd4:	00007517          	auipc	a0,0x7
    80001dd8:	15c50513          	add	a0,a0,348 # 80008f30 <rodata_start+0x1f30>
    80001ddc:	181000ef          	jal	8000275c <printf>
    80001de0:	00007517          	auipc	a0,0x7
    80001de4:	18050513          	add	a0,a0,384 # 80008f60 <rodata_start+0x1f60>
    80001de8:	175000ef          	jal	8000275c <printf>
    80001dec:	00800593          	li	a1,8
    80001df0:	00007517          	auipc	a0,0x7
    80001df4:	18850513          	add	a0,a0,392 # 80008f78 <rodata_start+0x1f78>
    80001df8:	165000ef          	jal	8000275c <printf>
    80001dfc:	00800593          	li	a1,8
    80001e00:	00007517          	auipc	a0,0x7
    80001e04:	19050513          	add	a0,a0,400 # 80008f90 <rodata_start+0x1f90>
    80001e08:	155000ef          	jal	8000275c <printf>
    80001e0c:	00800593          	li	a1,8
    80001e10:	00007517          	auipc	a0,0x7
    80001e14:	1a050513          	add	a0,a0,416 # 80008fb0 <rodata_start+0x1fb0>
    80001e18:	145000ef          	jal	8000275c <printf>
    80001e1c:	02200693          	li	a3,34
    80001e20:	00800613          	li	a2,8
    80001e24:	11000593          	li	a1,272
    80001e28:	00007517          	auipc	a0,0x7
    80001e2c:	1a850513          	add	a0,a0,424 # 80008fd0 <rodata_start+0x1fd0>
    80001e30:	12d000ef          	jal	8000275c <printf>
    80001e34:	00007517          	auipc	a0,0x7
    80001e38:	1c450513          	add	a0,a0,452 # 80008ff8 <rodata_start+0x1ff8>
    80001e3c:	491000ef          	jal	80002acc <uart_puts>
    80001e40:	00813083          	ld	ra,8(sp)
    80001e44:	00007517          	auipc	a0,0x7
    80001e48:	1dc50513          	add	a0,a0,476 # 80009020 <rodata_start+0x2020>
    80001e4c:	01010113          	add	sp,sp,16
    80001e50:	47d0006f          	j	80002acc <uart_puts>

0000000080001e54 <test_interrupt_handlers>:
    80001e54:	ff010113          	add	sp,sp,-16
    80001e58:	00007517          	auipc	a0,0x7
    80001e5c:	1e050513          	add	a0,a0,480 # 80009038 <rodata_start+0x2038>
    80001e60:	00113423          	sd	ra,8(sp)
    80001e64:	469000ef          	jal	80002acc <uart_puts>
    80001e68:	00007517          	auipc	a0,0x7
    80001e6c:	21050513          	add	a0,a0,528 # 80009078 <rodata_start+0x2078>
    80001e70:	45d000ef          	jal	80002acc <uart_puts>
    80001e74:	00412797          	auipc	a5,0x412
    80001e78:	7ac78793          	add	a5,a5,1964 # 80414620 <trap_handlers>
    80001e7c:	00413697          	auipc	a3,0x413
    80001e80:	82468693          	add	a3,a3,-2012 # 804146a0 <trapframe_pool>
    80001e84:	00000593          	li	a1,0
    80001e88:	0007b703          	ld	a4,0(a5)
    80001e8c:	00878793          	add	a5,a5,8
    80001e90:	00070463          	beqz	a4,80001e98 <test_interrupt_handlers+0x44>
    80001e94:	0015859b          	addw	a1,a1,1
    80001e98:	fed798e3          	bne	a5,a3,80001e88 <test_interrupt_handlers+0x34>
    80001e9c:	00007517          	auipc	a0,0x7
    80001ea0:	1fc50513          	add	a0,a0,508 # 80009098 <rodata_start+0x2098>
    80001ea4:	0b9000ef          	jal	8000275c <printf>
    80001ea8:	00007517          	auipc	a0,0x7
    80001eac:	21850513          	add	a0,a0,536 # 800090c0 <rodata_start+0x20c0>
    80001eb0:	41d000ef          	jal	80002acc <uart_puts>
    80001eb4:	00813083          	ld	ra,8(sp)
    80001eb8:	00007517          	auipc	a0,0x7
    80001ebc:	23850513          	add	a0,a0,568 # 800090f0 <rodata_start+0x20f0>
    80001ec0:	01010113          	add	sp,sp,16
    80001ec4:	4090006f          	j	80002acc <uart_puts>

0000000080001ec8 <test_timer_interrupt>:
    80001ec8:	fd010113          	add	sp,sp,-48
    80001ecc:	00007517          	auipc	a0,0x7
    80001ed0:	23c50513          	add	a0,a0,572 # 80009108 <rodata_start+0x2108>
    80001ed4:	02113423          	sd	ra,40(sp)
    80001ed8:	02813023          	sd	s0,32(sp)
    80001edc:	00913c23          	sd	s1,24(sp)
    80001ee0:	3ed000ef          	jal	80002acc <uart_puts>
    80001ee4:	00007517          	auipc	a0,0x7
    80001ee8:	25c50513          	add	a0,a0,604 # 80009140 <rodata_start+0x2140>
    80001eec:	3e1000ef          	jal	80002acc <uart_puts>
    80001ef0:	00007517          	auipc	a0,0x7
    80001ef4:	28050513          	add	a0,a0,640 # 80009170 <rodata_start+0x2170>
    80001ef8:	3d5000ef          	jal	80002acc <uart_puts>
    80001efc:	00424417          	auipc	s0,0x424
    80001f00:	4dc40413          	add	s0,s0,1244 # 804263d8 <ticks>
    80001f04:	00007517          	auipc	a0,0x7
    80001f08:	29c50513          	add	a0,a0,668 # 800091a0 <rodata_start+0x21a0>
    80001f0c:	3c1000ef          	jal	80002acc <uart_puts>
    80001f10:	00043483          	ld	s1,0(s0)
    80001f14:	00007517          	auipc	a0,0x7
    80001f18:	2bc50513          	add	a0,a0,700 # 800091d0 <rodata_start+0x21d0>
    80001f1c:	00048593          	mv	a1,s1
    80001f20:	03d000ef          	jal	8000275c <printf>
    80001f24:	31c030ef          	jal	80005240 <intr_on>
    80001f28:	00007517          	auipc	a0,0x7
    80001f2c:	2c050513          	add	a0,a0,704 # 800091e8 <rodata_start+0x21e8>
    80001f30:	39d000ef          	jal	80002acc <uart_puts>
    80001f34:	00007517          	auipc	a0,0x7
    80001f38:	2cc50513          	add	a0,a0,716 # 80009200 <rodata_start+0x2200>
    80001f3c:	391000ef          	jal	80002acc <uart_puts>
    80001f40:	00043783          	ld	a5,0(s0)
    80001f44:	00000593          	li	a1,0
    80001f48:	00f13423          	sd	a5,8(sp)
    80001f4c:	00813783          	ld	a5,8(sp)
    80001f50:	00043703          	ld	a4,0(s0)
    80001f54:	02f71263          	bne	a4,a5,80001f78 <test_timer_interrupt+0xb0>
    80001f58:	05f5e6b7          	lui	a3,0x5f5e
    80001f5c:	10068693          	add	a3,a3,256 # 5f5e100 <_entry-0x7a0a1f00>
    80001f60:	0080006f          	j	80001f68 <test_timer_interrupt+0xa0>
    80001f64:	00d58a63          	beq	a1,a3,80001f78 <test_timer_interrupt+0xb0>
    80001f68:	00813703          	ld	a4,8(sp)
    80001f6c:	00043783          	ld	a5,0(s0)
    80001f70:	0015859b          	addw	a1,a1,1
    80001f74:	fef708e3          	beq	a4,a5,80001f64 <test_timer_interrupt+0x9c>
    80001f78:	00007517          	auipc	a0,0x7
    80001f7c:	2a050513          	add	a0,a0,672 # 80009218 <rodata_start+0x2218>
    80001f80:	7dc000ef          	jal	8000275c <printf>
    80001f84:	00043583          	ld	a1,0(s0)
    80001f88:	00007517          	auipc	a0,0x7
    80001f8c:	2a850513          	add	a0,a0,680 # 80009230 <rodata_start+0x2230>
    80001f90:	7cc000ef          	jal	8000275c <printf>
    80001f94:	00043783          	ld	a5,0(s0)
    80001f98:	04f4f063          	bgeu	s1,a5,80001fd8 <test_timer_interrupt+0x110>
    80001f9c:	00043583          	ld	a1,0(s0)
    80001fa0:	00007517          	auipc	a0,0x7
    80001fa4:	2a850513          	add	a0,a0,680 # 80009248 <rodata_start+0x2248>
    80001fa8:	409585b3          	sub	a1,a1,s1
    80001fac:	7b0000ef          	jal	8000275c <printf>
    80001fb0:	00007517          	auipc	a0,0x7
    80001fb4:	2d050513          	add	a0,a0,720 # 80009280 <rodata_start+0x2280>
    80001fb8:	315000ef          	jal	80002acc <uart_puts>
    80001fbc:	02013403          	ld	s0,32(sp)
    80001fc0:	02813083          	ld	ra,40(sp)
    80001fc4:	01813483          	ld	s1,24(sp)
    80001fc8:	00007517          	auipc	a0,0x7
    80001fcc:	30050513          	add	a0,a0,768 # 800092c8 <rodata_start+0x22c8>
    80001fd0:	03010113          	add	sp,sp,48
    80001fd4:	2f90006f          	j	80002acc <uart_puts>
    80001fd8:	00007517          	auipc	a0,0x7
    80001fdc:	2d050513          	add	a0,a0,720 # 800092a8 <rodata_start+0x22a8>
    80001fe0:	2ed000ef          	jal	80002acc <uart_puts>
    80001fe4:	02013403          	ld	s0,32(sp)
    80001fe8:	02813083          	ld	ra,40(sp)
    80001fec:	01813483          	ld	s1,24(sp)
    80001ff0:	00007517          	auipc	a0,0x7
    80001ff4:	2d850513          	add	a0,a0,728 # 800092c8 <rodata_start+0x22c8>
    80001ff8:	03010113          	add	sp,sp,48
    80001ffc:	2d10006f          	j	80002acc <uart_puts>

0000000080002000 <test_repeated_initialization>:
    80002000:	fe010113          	add	sp,sp,-32
    80002004:	00007517          	auipc	a0,0x7
    80002008:	2dc50513          	add	a0,a0,732 # 800092e0 <rodata_start+0x22e0>
    8000200c:	00113c23          	sd	ra,24(sp)
    80002010:	00813823          	sd	s0,16(sp)
    80002014:	00913423          	sd	s1,8(sp)
    80002018:	01213023          	sd	s2,0(sp)
    8000201c:	2b1000ef          	jal	80002acc <uart_puts>
    80002020:	00007517          	auipc	a0,0x7
    80002024:	30050513          	add	a0,a0,768 # 80009320 <rodata_start+0x2320>
    80002028:	2a5000ef          	jal	80002acc <uart_puts>
    8000202c:	00000413          	li	s0,0
    80002030:	00007917          	auipc	s2,0x7
    80002034:	30890913          	add	s2,s2,776 # 80009338 <rodata_start+0x2338>
    80002038:	00500493          	li	s1,5
    8000203c:	240030ef          	jal	8000527c <trap_init>
    80002040:	0014041b          	addw	s0,s0,1
    80002044:	2e8030ef          	jal	8000532c <trap_init_hart>
    80002048:	00040593          	mv	a1,s0
    8000204c:	00090513          	mv	a0,s2
    80002050:	70c000ef          	jal	8000275c <printf>
    80002054:	fe9414e3          	bne	s0,s1,8000203c <test_repeated_initialization+0x3c>
    80002058:	00007517          	auipc	a0,0x7
    8000205c:	30050513          	add	a0,a0,768 # 80009358 <rodata_start+0x2358>
    80002060:	26d000ef          	jal	80002acc <uart_puts>
    80002064:	01013403          	ld	s0,16(sp)
    80002068:	01813083          	ld	ra,24(sp)
    8000206c:	00813483          	ld	s1,8(sp)
    80002070:	00013903          	ld	s2,0(sp)
    80002074:	00007517          	auipc	a0,0x7
    80002078:	30c50513          	add	a0,a0,780 # 80009380 <rodata_start+0x2380>
    8000207c:	02010113          	add	sp,sp,32
    80002080:	24d0006f          	j	80002acc <uart_puts>

0000000080002084 <run_all_system_tests>:
    80002084:	ff010113          	add	sp,sp,-16
    80002088:	00007517          	auipc	a0,0x7
    8000208c:	80050513          	add	a0,a0,-2048 # 80008888 <rodata_start+0x1888>
    80002090:	00113423          	sd	ra,8(sp)
    80002094:	239000ef          	jal	80002acc <uart_puts>
    80002098:	00006517          	auipc	a0,0x6
    8000209c:	cd050513          	add	a0,a0,-816 # 80007d68 <rodata_start+0xd68>
    800020a0:	22d000ef          	jal	80002acc <uart_puts>
    800020a4:	00007517          	auipc	a0,0x7
    800020a8:	2f450513          	add	a0,a0,756 # 80009398 <rodata_start+0x2398>
    800020ac:	221000ef          	jal	80002acc <uart_puts>
    800020b0:	00006517          	auipc	a0,0x6
    800020b4:	de050513          	add	a0,a0,-544 # 80007e90 <rodata_start+0xe90>
    800020b8:	215000ef          	jal	80002acc <uart_puts>
    800020bc:	8c5ff0ef          	jal	80001980 <test_trap_initialization>
    800020c0:	93dff0ef          	jal	800019fc <test_interrupt_control>
    800020c4:	a0dff0ef          	jal	80001ad0 <test_trapframe_allocation>
    800020c8:	b95ff0ef          	jal	80001c5c <test_csr_operations>
    800020cc:	c29ff0ef          	jal	80001cf4 <test_exception_definitions>
    800020d0:	ce1ff0ef          	jal	80001db0 <test_trapframe_structure>
    800020d4:	d81ff0ef          	jal	80001e54 <test_interrupt_handlers>
    800020d8:	df1ff0ef          	jal	80001ec8 <test_timer_interrupt>
    800020dc:	f25ff0ef          	jal	80002000 <test_repeated_initialization>
    800020e0:	00006517          	auipc	a0,0x6
    800020e4:	7a850513          	add	a0,a0,1960 # 80008888 <rodata_start+0x1888>
    800020e8:	1e5000ef          	jal	80002acc <uart_puts>
    800020ec:	00006517          	auipc	a0,0x6
    800020f0:	c7c50513          	add	a0,a0,-900 # 80007d68 <rodata_start+0xd68>
    800020f4:	1d9000ef          	jal	80002acc <uart_puts>
    800020f8:	00007517          	auipc	a0,0x7
    800020fc:	30050513          	add	a0,a0,768 # 800093f8 <rodata_start+0x23f8>
    80002100:	1cd000ef          	jal	80002acc <uart_puts>
    80002104:	00813083          	ld	ra,8(sp)
    80002108:	00006517          	auipc	a0,0x6
    8000210c:	ea850513          	add	a0,a0,-344 # 80007fb0 <rodata_start+0xfb0>
    80002110:	01010113          	add	sp,sp,16
    80002114:	1b90006f          	j	80002acc <uart_puts>

0000000080002118 <run_interrupt_exception_tests>:
    80002118:	f6dff06f          	j	80002084 <run_all_system_tests>

000000008000211c <main>:
    8000211c:	ff010113          	add	sp,sp,-16
    80002120:	00006517          	auipc	a0,0x6
    80002124:	c4850513          	add	a0,a0,-952 # 80007d68 <rodata_start+0xd68>
    80002128:	00113423          	sd	ra,8(sp)
    8000212c:	1a1000ef          	jal	80002acc <uart_puts>
    80002130:	00007517          	auipc	a0,0x7
    80002134:	32050513          	add	a0,a0,800 # 80009450 <rodata_start+0x2450>
    80002138:	195000ef          	jal	80002acc <uart_puts>
    8000213c:	00006517          	auipc	a0,0x6
    80002140:	e7450513          	add	a0,a0,-396 # 80007fb0 <rodata_start+0xfb0>
    80002144:	189000ef          	jal	80002acc <uart_puts>
    80002148:	00007517          	auipc	a0,0x7
    8000214c:	36050513          	add	a0,a0,864 # 800094a8 <rodata_start+0x24a8>
    80002150:	17d000ef          	jal	80002acc <uart_puts>
    80002154:	01100593          	li	a1,17
    80002158:	02001537          	lui	a0,0x2001
    8000215c:	01b59593          	sll	a1,a1,0x1b
    80002160:	00651513          	sll	a0,a0,0x6
    80002164:	195000ef          	jal	80002af8 <pmm_init>
    80002168:	00007517          	auipc	a0,0x7
    8000216c:	37850513          	add	a0,a0,888 # 800094e0 <rodata_start+0x24e0>
    80002170:	15d000ef          	jal	80002acc <uart_puts>
    80002174:	00007517          	auipc	a0,0x7
    80002178:	3a450513          	add	a0,a0,932 # 80009518 <rodata_start+0x2518>
    8000217c:	151000ef          	jal	80002acc <uart_puts>
    80002180:	0fc030ef          	jal	8000527c <trap_init>
    80002184:	1a8030ef          	jal	8000532c <trap_init_hart>
    80002188:	00007517          	auipc	a0,0x7
    8000218c:	3c850513          	add	a0,a0,968 # 80009550 <rodata_start+0x2550>
    80002190:	13d000ef          	jal	80002acc <uart_puts>
    80002194:	00007517          	auipc	a0,0x7
    80002198:	3ec50513          	add	a0,a0,1004 # 80009580 <rodata_start+0x2580>
    8000219c:	131000ef          	jal	80002acc <uart_puts>
    800021a0:	200030ef          	jal	800053a0 <timerinit>
    800021a4:	00007517          	auipc	a0,0x7
    800021a8:	41450513          	add	a0,a0,1044 # 800095b8 <rodata_start+0x25b8>
    800021ac:	121000ef          	jal	80002acc <uart_puts>
    800021b0:	00007517          	auipc	a0,0x7
    800021b4:	43850513          	add	a0,a0,1080 # 800095e8 <rodata_start+0x25e8>
    800021b8:	115000ef          	jal	80002acc <uart_puts>
    800021bc:	6e4030ef          	jal	800058a0 <proc_init>
    800021c0:	00007517          	auipc	a0,0x7
    800021c4:	46050513          	add	a0,a0,1120 # 80009620 <rodata_start+0x2620>
    800021c8:	105000ef          	jal	80002acc <uart_puts>
    800021cc:	91cff0ef          	jal	800012e8 <run_process_management_tests>
    800021d0:	b04ff0ef          	jal	800014d4 <test_producer_consumer>
    800021d4:	00007517          	auipc	a0,0x7
    800021d8:	47c50513          	add	a0,a0,1148 # 80009650 <rodata_start+0x2650>
    800021dc:	0f1000ef          	jal	80002acc <uart_puts>
    800021e0:	0000006f          	j	800021e0 <main+0xc4>

00000000800021e4 <print_number>:
    800021e4:	0c050663          	beqz	a0,800022b0 <print_number+0xcc>
    800021e8:	fd010113          	add	sp,sp,-48
    800021ec:	02113423          	sd	ra,40(sp)
    800021f0:	02813023          	sd	s0,32(sp)
    800021f4:	08061a63          	bnez	a2,80002288 <print_number+0xa4>
    800021f8:	0005071b          	sext.w	a4,a0
    800021fc:	00000613          	li	a2,0
    80002200:	0005859b          	sext.w	a1,a1
    80002204:	00010fa3          	sb	zero,31(sp)
    80002208:	01e10813          	add	a6,sp,30
    8000220c:	01f00693          	li	a3,31
    80002210:	00007317          	auipc	t1,0x7
    80002214:	75030313          	add	t1,t1,1872 # 80009960 <digits>
    80002218:	02b777bb          	remuw	a5,a4,a1
    8000221c:	fff80813          	add	a6,a6,-1
    80002220:	0007089b          	sext.w	a7,a4
    80002224:	00068e13          	mv	t3,a3
    80002228:	fff6869b          	addw	a3,a3,-1
    8000222c:	02079793          	sll	a5,a5,0x20
    80002230:	0207d793          	srl	a5,a5,0x20
    80002234:	00f307b3          	add	a5,t1,a5
    80002238:	0007c503          	lbu	a0,0(a5)
    8000223c:	02b7573b          	divuw	a4,a4,a1
    80002240:	00a800a3          	sb	a0,1(a6)
    80002244:	fcb8fae3          	bgeu	a7,a1,80002218 <print_number+0x34>
    80002248:	04060a63          	beqz	a2,8000229c <print_number+0xb8>
    8000224c:	ffee069b          	addw	a3,t3,-2
    80002250:	02068793          	add	a5,a3,32
    80002254:	002787b3          	add	a5,a5,sp
    80002258:	02d00713          	li	a4,45
    8000225c:	fee78023          	sb	a4,-32(a5)
    80002260:	02d00513          	li	a0,45
    80002264:	00d10433          	add	s0,sp,a3
    80002268:	00140413          	add	s0,s0,1
    8000226c:	049000ef          	jal	80002ab4 <uart_putc>
    80002270:	00044503          	lbu	a0,0(s0)
    80002274:	fe051ae3          	bnez	a0,80002268 <print_number+0x84>
    80002278:	02813083          	ld	ra,40(sp)
    8000227c:	02013403          	ld	s0,32(sp)
    80002280:	03010113          	add	sp,sp,48
    80002284:	00008067          	ret
    80002288:	f60558e3          	bgez	a0,800021f8 <print_number+0x14>
    8000228c:	80000737          	lui	a4,0x80000
    80002290:	f6e508e3          	beq	a0,a4,80002200 <print_number+0x1c>
    80002294:	40a0073b          	negw	a4,a0
    80002298:	f69ff06f          	j	80002200 <print_number+0x1c>
    8000229c:	fc0514e3          	bnez	a0,80002264 <print_number+0x80>
    800022a0:	02813083          	ld	ra,40(sp)
    800022a4:	02013403          	ld	s0,32(sp)
    800022a8:	03010113          	add	sp,sp,48
    800022ac:	00008067          	ret
    800022b0:	03000513          	li	a0,48
    800022b4:	0010006f          	j	80002ab4 <uart_putc>

00000000800022b8 <print_number_long.part.0>:
    800022b8:	fd010113          	add	sp,sp,-48
    800022bc:	02113423          	sd	ra,40(sp)
    800022c0:	02813023          	sd	s0,32(sp)
    800022c4:	00050793          	mv	a5,a0
    800022c8:	00060463          	beqz	a2,800022d0 <print_number_long.part.0+0x18>
    800022cc:	08054c63          	bltz	a0,80002364 <print_number_long.part.0+0xac>
    800022d0:	00000613          	li	a2,0
    800022d4:	00010fa3          	sb	zero,31(sp)
    800022d8:	01e10813          	add	a6,sp,30
    800022dc:	01f00693          	li	a3,31
    800022e0:	00007317          	auipc	t1,0x7
    800022e4:	68030313          	add	t1,t1,1664 # 80009960 <digits>
    800022e8:	02b7f733          	remu	a4,a5,a1
    800022ec:	fff80813          	add	a6,a6,-1
    800022f0:	00078893          	mv	a7,a5
    800022f4:	00068e13          	mv	t3,a3
    800022f8:	fff6869b          	addw	a3,a3,-1
    800022fc:	00e30733          	add	a4,t1,a4
    80002300:	00074503          	lbu	a0,0(a4) # ffffffff80000000 <bss_end+0xfffffffeffbd9c08>
    80002304:	02b7d7b3          	divu	a5,a5,a1
    80002308:	00a800a3          	sb	a0,1(a6)
    8000230c:	fcb8fee3          	bgeu	a7,a1,800022e8 <print_number_long.part.0+0x30>
    80002310:	04060063          	beqz	a2,80002350 <print_number_long.part.0+0x98>
    80002314:	ffee069b          	addw	a3,t3,-2
    80002318:	02068793          	add	a5,a3,32
    8000231c:	002787b3          	add	a5,a5,sp
    80002320:	02d00713          	li	a4,45
    80002324:	fee78023          	sb	a4,-32(a5)
    80002328:	02d00513          	li	a0,45
    8000232c:	00d10433          	add	s0,sp,a3
    80002330:	00140413          	add	s0,s0,1
    80002334:	780000ef          	jal	80002ab4 <uart_putc>
    80002338:	00044503          	lbu	a0,0(s0)
    8000233c:	fe051ae3          	bnez	a0,80002330 <print_number_long.part.0+0x78>
    80002340:	02813083          	ld	ra,40(sp)
    80002344:	02013403          	ld	s0,32(sp)
    80002348:	03010113          	add	sp,sp,48
    8000234c:	00008067          	ret
    80002350:	fc051ee3          	bnez	a0,8000232c <print_number_long.part.0+0x74>
    80002354:	02813083          	ld	ra,40(sp)
    80002358:	02013403          	ld	s0,32(sp)
    8000235c:	03010113          	add	sp,sp,48
    80002360:	00008067          	ret
    80002364:	40a007b3          	neg	a5,a0
    80002368:	f6dff06f          	j	800022d4 <print_number_long.part.0+0x1c>

000000008000236c <clear_screen>:
    8000236c:	00007517          	auipc	a0,0x7
    80002370:	31c50513          	add	a0,a0,796 # 80009688 <rodata_start+0x2688>
    80002374:	7580006f          	j	80002acc <uart_puts>

0000000080002378 <clear_line>:
    80002378:	00007517          	auipc	a0,0x7
    8000237c:	31850513          	add	a0,a0,792 # 80009690 <rodata_start+0x2690>
    80002380:	74c0006f          	j	80002acc <uart_puts>

0000000080002384 <goto_xy>:
    80002384:	fd010113          	add	sp,sp,-48
    80002388:	00913c23          	sd	s1,24(sp)
    8000238c:	00050493          	mv	s1,a0
    80002390:	01b00513          	li	a0,27
    80002394:	02113423          	sd	ra,40(sp)
    80002398:	02813023          	sd	s0,32(sp)
    8000239c:	01213823          	sd	s2,16(sp)
    800023a0:	00058413          	mv	s0,a1
    800023a4:	01313423          	sd	s3,8(sp)
    800023a8:	70c000ef          	jal	80002ab4 <uart_putc>
    800023ac:	05b00513          	li	a0,91
    800023b0:	704000ef          	jal	80002ab4 <uart_putc>
    800023b4:	06300793          	li	a5,99
    800023b8:	0c87cc63          	blt	a5,s0,80002490 <goto_xy+0x10c>
    800023bc:	00900793          	li	a5,9
    800023c0:	0487ce63          	blt	a5,s0,8000241c <goto_xy+0x98>
    800023c4:	12805a63          	blez	s0,800024f8 <goto_xy+0x174>
    800023c8:	0304041b          	addw	s0,s0,48
    800023cc:	0ff47513          	zext.b	a0,s0
    800023d0:	6e4000ef          	jal	80002ab4 <uart_putc>
    800023d4:	03b00513          	li	a0,59
    800023d8:	6dc000ef          	jal	80002ab4 <uart_putc>
    800023dc:	06300793          	li	a5,99
    800023e0:	0697c863          	blt	a5,s1,80002450 <goto_xy+0xcc>
    800023e4:	00900793          	li	a5,9
    800023e8:	0e97c463          	blt	a5,s1,800024d0 <goto_xy+0x14c>
    800023ec:	10905c63          	blez	s1,80002504 <goto_xy+0x180>
    800023f0:	0304851b          	addw	a0,s1,48
    800023f4:	0ff57513          	zext.b	a0,a0
    800023f8:	6bc000ef          	jal	80002ab4 <uart_putc>
    800023fc:	02013403          	ld	s0,32(sp)
    80002400:	02813083          	ld	ra,40(sp)
    80002404:	01813483          	ld	s1,24(sp)
    80002408:	01013903          	ld	s2,16(sp)
    8000240c:	00813983          	ld	s3,8(sp)
    80002410:	04800513          	li	a0,72
    80002414:	03010113          	add	sp,sp,48
    80002418:	69c0006f          	j	80002ab4 <uart_putc>
    8000241c:	00a00913          	li	s2,10
    80002420:	0324453b          	divw	a0,s0,s2
    80002424:	0305051b          	addw	a0,a0,48
    80002428:	0ff57513          	zext.b	a0,a0
    8000242c:	688000ef          	jal	80002ab4 <uart_putc>
    80002430:	0324643b          	remw	s0,s0,s2
    80002434:	0304041b          	addw	s0,s0,48
    80002438:	0ff47513          	zext.b	a0,s0
    8000243c:	678000ef          	jal	80002ab4 <uart_putc>
    80002440:	03b00513          	li	a0,59
    80002444:	670000ef          	jal	80002ab4 <uart_putc>
    80002448:	06300793          	li	a5,99
    8000244c:	f897dce3          	bge	a5,s1,800023e4 <goto_xy+0x60>
    80002450:	06400413          	li	s0,100
    80002454:	0284c53b          	divw	a0,s1,s0
    80002458:	00a00913          	li	s2,10
    8000245c:	0305051b          	addw	a0,a0,48
    80002460:	0ff57513          	zext.b	a0,a0
    80002464:	650000ef          	jal	80002ab4 <uart_putc>
    80002468:	0284e53b          	remw	a0,s1,s0
    8000246c:	0325453b          	divw	a0,a0,s2
    80002470:	0305051b          	addw	a0,a0,48
    80002474:	0ff57513          	zext.b	a0,a0
    80002478:	63c000ef          	jal	80002ab4 <uart_putc>
    8000247c:	0324e53b          	remw	a0,s1,s2
    80002480:	0305051b          	addw	a0,a0,48
    80002484:	0ff57513          	zext.b	a0,a0
    80002488:	62c000ef          	jal	80002ab4 <uart_putc>
    8000248c:	f71ff06f          	j	800023fc <goto_xy+0x78>
    80002490:	06400913          	li	s2,100
    80002494:	0324453b          	divw	a0,s0,s2
    80002498:	00a00993          	li	s3,10
    8000249c:	0305051b          	addw	a0,a0,48
    800024a0:	0ff57513          	zext.b	a0,a0
    800024a4:	610000ef          	jal	80002ab4 <uart_putc>
    800024a8:	0324653b          	remw	a0,s0,s2
    800024ac:	0335453b          	divw	a0,a0,s3
    800024b0:	0305051b          	addw	a0,a0,48
    800024b4:	0ff57513          	zext.b	a0,a0
    800024b8:	5fc000ef          	jal	80002ab4 <uart_putc>
    800024bc:	0334643b          	remw	s0,s0,s3
    800024c0:	0304041b          	addw	s0,s0,48
    800024c4:	0ff47513          	zext.b	a0,s0
    800024c8:	5ec000ef          	jal	80002ab4 <uart_putc>
    800024cc:	f09ff06f          	j	800023d4 <goto_xy+0x50>
    800024d0:	00a00413          	li	s0,10
    800024d4:	0284c53b          	divw	a0,s1,s0
    800024d8:	0305051b          	addw	a0,a0,48
    800024dc:	0ff57513          	zext.b	a0,a0
    800024e0:	5d4000ef          	jal	80002ab4 <uart_putc>
    800024e4:	0284e53b          	remw	a0,s1,s0
    800024e8:	0305051b          	addw	a0,a0,48
    800024ec:	0ff57513          	zext.b	a0,a0
    800024f0:	5c4000ef          	jal	80002ab4 <uart_putc>
    800024f4:	f09ff06f          	j	800023fc <goto_xy+0x78>
    800024f8:	03100513          	li	a0,49
    800024fc:	5b8000ef          	jal	80002ab4 <uart_putc>
    80002500:	ed5ff06f          	j	800023d4 <goto_xy+0x50>
    80002504:	03100513          	li	a0,49
    80002508:	5ac000ef          	jal	80002ab4 <uart_putc>
    8000250c:	ef1ff06f          	j	800023fc <goto_xy+0x78>

0000000080002510 <printf_color>:
    80002510:	f8010113          	add	sp,sp,-128
    80002514:	02913c23          	sd	s1,56(sp)
    80002518:	00050493          	mv	s1,a0
    8000251c:	01b00513          	li	a0,27
    80002520:	06f13423          	sd	a5,104(sp)
    80002524:	04113423          	sd	ra,72(sp)
    80002528:	04813023          	sd	s0,64(sp)
    8000252c:	04c13823          	sd	a2,80(sp)
    80002530:	04d13c23          	sd	a3,88(sp)
    80002534:	06e13023          	sd	a4,96(sp)
    80002538:	07013823          	sd	a6,112(sp)
    8000253c:	07113c23          	sd	a7,120(sp)
    80002540:	00058413          	mv	s0,a1
    80002544:	03213823          	sd	s2,48(sp)
    80002548:	03313423          	sd	s3,40(sp)
    8000254c:	03413023          	sd	s4,32(sp)
    80002550:	01513c23          	sd	s5,24(sp)
    80002554:	560000ef          	jal	80002ab4 <uart_putc>
    80002558:	05b00513          	li	a0,91
    8000255c:	558000ef          	jal	80002ab4 <uart_putc>
    80002560:	06300793          	li	a5,99
    80002564:	1a97e063          	bltu	a5,s1,80002704 <printf_color+0x1f4>
    80002568:	00900793          	li	a5,9
    8000256c:	1497e663          	bltu	a5,s1,800026b8 <printf_color+0x1a8>
    80002570:	0304851b          	addw	a0,s1,48
    80002574:	0ff57513          	zext.b	a0,a0
    80002578:	53c000ef          	jal	80002ab4 <uart_putc>
    8000257c:	06d00513          	li	a0,109
    80002580:	534000ef          	jal	80002ab4 <uart_putc>
    80002584:	1c040863          	beqz	s0,80002754 <printf_color+0x244>
    80002588:	00044503          	lbu	a0,0(s0)
    8000258c:	05010793          	add	a5,sp,80
    80002590:	00f13423          	sd	a5,8(sp)
    80002594:	00000a93          	li	s5,0
    80002598:	06050463          	beqz	a0,80002600 <printf_color+0xf0>
    8000259c:	02500913          	li	s2,37
    800025a0:	02000a13          	li	s4,32
    800025a4:	00007997          	auipc	s3,0x7
    800025a8:	22c98993          	add	s3,s3,556 # 800097d0 <rodata_start+0x27d0>
    800025ac:	00140493          	add	s1,s0,1
    800025b0:	13251863          	bne	a0,s2,800026e0 <printf_color+0x1d0>
    800025b4:	00144783          	lbu	a5,1(s0)
    800025b8:	14078063          	beqz	a5,800026f8 <printf_color+0x1e8>
    800025bc:	13278863          	beq	a5,s2,800026ec <printf_color+0x1dc>
    800025c0:	fa87879b          	addw	a5,a5,-88
    800025c4:	0ff7f793          	zext.b	a5,a5
    800025c8:	00fa6c63          	bltu	s4,a5,800025e0 <printf_color+0xd0>
    800025cc:	00279793          	sll	a5,a5,0x2
    800025d0:	013787b3          	add	a5,a5,s3
    800025d4:	0007a783          	lw	a5,0(a5)
    800025d8:	013787b3          	add	a5,a5,s3
    800025dc:	00078067          	jr	a5
    800025e0:	02500513          	li	a0,37
    800025e4:	4d0000ef          	jal	80002ab4 <uart_putc>
    800025e8:	00144503          	lbu	a0,1(s0)
    800025ec:	ffe00a93          	li	s5,-2
    800025f0:	4c4000ef          	jal	80002ab4 <uart_putc>
    800025f4:	0014c503          	lbu	a0,1(s1)
    800025f8:	00148413          	add	s0,s1,1
    800025fc:	fa0518e3          	bnez	a0,800025ac <printf_color+0x9c>
    80002600:	00007517          	auipc	a0,0x7
    80002604:	0a050513          	add	a0,a0,160 # 800096a0 <rodata_start+0x26a0>
    80002608:	4c4000ef          	jal	80002acc <uart_puts>
    8000260c:	04813083          	ld	ra,72(sp)
    80002610:	04013403          	ld	s0,64(sp)
    80002614:	03813483          	ld	s1,56(sp)
    80002618:	03013903          	ld	s2,48(sp)
    8000261c:	02813983          	ld	s3,40(sp)
    80002620:	02013a03          	ld	s4,32(sp)
    80002624:	000a8513          	mv	a0,s5
    80002628:	01813a83          	ld	s5,24(sp)
    8000262c:	08010113          	add	sp,sp,128
    80002630:	00008067          	ret
    80002634:	00813783          	ld	a5,8(sp)
    80002638:	00000613          	li	a2,0
    8000263c:	01000593          	li	a1,16
    80002640:	0007a503          	lw	a0,0(a5)
    80002644:	00878793          	add	a5,a5,8
    80002648:	00f13423          	sd	a5,8(sp)
    8000264c:	b99ff0ef          	jal	800021e4 <print_number>
    80002650:	fa5ff06f          	j	800025f4 <printf_color+0xe4>
    80002654:	00813783          	ld	a5,8(sp)
    80002658:	0007c503          	lbu	a0,0(a5)
    8000265c:	00878793          	add	a5,a5,8
    80002660:	00f13423          	sd	a5,8(sp)
    80002664:	450000ef          	jal	80002ab4 <uart_putc>
    80002668:	f8dff06f          	j	800025f4 <printf_color+0xe4>
    8000266c:	00813783          	ld	a5,8(sp)
    80002670:	0007b403          	ld	s0,0(a5)
    80002674:	00878793          	add	a5,a5,8
    80002678:	00f13423          	sd	a5,8(sp)
    8000267c:	00041863          	bnez	s0,8000268c <printf_color+0x17c>
    80002680:	0c40006f          	j	80002744 <printf_color+0x234>
    80002684:	00140413          	add	s0,s0,1
    80002688:	42c000ef          	jal	80002ab4 <uart_putc>
    8000268c:	00044503          	lbu	a0,0(s0)
    80002690:	fe051ae3          	bnez	a0,80002684 <printf_color+0x174>
    80002694:	f61ff06f          	j	800025f4 <printf_color+0xe4>
    80002698:	00813783          	ld	a5,8(sp)
    8000269c:	00100613          	li	a2,1
    800026a0:	00a00593          	li	a1,10
    800026a4:	0007a503          	lw	a0,0(a5)
    800026a8:	00878793          	add	a5,a5,8
    800026ac:	00f13423          	sd	a5,8(sp)
    800026b0:	b35ff0ef          	jal	800021e4 <print_number>
    800026b4:	f41ff06f          	j	800025f4 <printf_color+0xe4>
    800026b8:	00a00913          	li	s2,10
    800026bc:	0324d53b          	divuw	a0,s1,s2
    800026c0:	0305051b          	addw	a0,a0,48
    800026c4:	0ff57513          	zext.b	a0,a0
    800026c8:	3ec000ef          	jal	80002ab4 <uart_putc>
    800026cc:	0324f53b          	remuw	a0,s1,s2
    800026d0:	0305051b          	addw	a0,a0,48
    800026d4:	07f57513          	and	a0,a0,127
    800026d8:	3dc000ef          	jal	80002ab4 <uart_putc>
    800026dc:	ea1ff06f          	j	8000257c <printf_color+0x6c>
    800026e0:	3d4000ef          	jal	80002ab4 <uart_putc>
    800026e4:	00040493          	mv	s1,s0
    800026e8:	f0dff06f          	j	800025f4 <printf_color+0xe4>
    800026ec:	02500513          	li	a0,37
    800026f0:	3c4000ef          	jal	80002ab4 <uart_putc>
    800026f4:	f01ff06f          	j	800025f4 <printf_color+0xe4>
    800026f8:	02500513          	li	a0,37
    800026fc:	3b8000ef          	jal	80002ab4 <uart_putc>
    80002700:	f01ff06f          	j	80002600 <printf_color+0xf0>
    80002704:	06400913          	li	s2,100
    80002708:	0324d53b          	divuw	a0,s1,s2
    8000270c:	00a00993          	li	s3,10
    80002710:	0305051b          	addw	a0,a0,48
    80002714:	0ff57513          	zext.b	a0,a0
    80002718:	39c000ef          	jal	80002ab4 <uart_putc>
    8000271c:	0324f53b          	remuw	a0,s1,s2
    80002720:	0335553b          	divuw	a0,a0,s3
    80002724:	0305051b          	addw	a0,a0,48
    80002728:	0ff57513          	zext.b	a0,a0
    8000272c:	388000ef          	jal	80002ab4 <uart_putc>
    80002730:	0334f53b          	remuw	a0,s1,s3
    80002734:	0305051b          	addw	a0,a0,48
    80002738:	07f57513          	and	a0,a0,127
    8000273c:	378000ef          	jal	80002ab4 <uart_putc>
    80002740:	e3dff06f          	j	8000257c <printf_color+0x6c>
    80002744:	00007517          	auipc	a0,0x7
    80002748:	f5450513          	add	a0,a0,-172 # 80009698 <rodata_start+0x2698>
    8000274c:	380000ef          	jal	80002acc <uart_puts>
    80002750:	ea5ff06f          	j	800025f4 <printf_color+0xe4>
    80002754:	fff00a93          	li	s5,-1
    80002758:	eb5ff06f          	j	8000260c <printf_color+0xfc>

000000008000275c <printf>:
    8000275c:	f6010113          	add	sp,sp,-160
    80002760:	04113c23          	sd	ra,88(sp)
    80002764:	04813823          	sd	s0,80(sp)
    80002768:	04913423          	sd	s1,72(sp)
    8000276c:	05213023          	sd	s2,64(sp)
    80002770:	03313c23          	sd	s3,56(sp)
    80002774:	03413823          	sd	s4,48(sp)
    80002778:	03513423          	sd	s5,40(sp)
    8000277c:	03613023          	sd	s6,32(sp)
    80002780:	01713c23          	sd	s7,24(sp)
    80002784:	06b13423          	sd	a1,104(sp)
    80002788:	06c13823          	sd	a2,112(sp)
    8000278c:	06d13c23          	sd	a3,120(sp)
    80002790:	08e13023          	sd	a4,128(sp)
    80002794:	08f13423          	sd	a5,136(sp)
    80002798:	09013823          	sd	a6,144(sp)
    8000279c:	09113c23          	sd	a7,152(sp)
    800027a0:	20050c63          	beqz	a0,800029b8 <printf+0x25c>
    800027a4:	00050413          	mv	s0,a0
    800027a8:	00054503          	lbu	a0,0(a0)
    800027ac:	06810793          	add	a5,sp,104
    800027b0:	00f13423          	sd	a5,8(sp)
    800027b4:	00000b13          	li	s6,0
    800027b8:	06050c63          	beqz	a0,80002830 <printf+0xd4>
    800027bc:	02500493          	li	s1,37
    800027c0:	06c00993          	li	s3,108
    800027c4:	02000a13          	li	s4,32
    800027c8:	00007917          	auipc	s2,0x7
    800027cc:	08c90913          	add	s2,s2,140 # 80009854 <rodata_start+0x2854>
    800027d0:	00007a97          	auipc	s5,0x7
    800027d4:	108a8a93          	add	s5,s5,264 # 800098d8 <rodata_start+0x28d8>
    800027d8:	04951463          	bne	a0,s1,80002820 <printf+0xc4>
    800027dc:	00144783          	lbu	a5,1(s0)
    800027e0:	18078e63          	beqz	a5,8000297c <printf+0x220>
    800027e4:	11378063          	beq	a5,s3,800028e4 <printf+0x188>
    800027e8:	00140413          	add	s0,s0,1
    800027ec:	16978863          	beq	a5,s1,8000295c <printf+0x200>
    800027f0:	fa87879b          	addw	a5,a5,-88
    800027f4:	0ff7f793          	zext.b	a5,a5
    800027f8:	00fa6c63          	bltu	s4,a5,80002810 <printf+0xb4>
    800027fc:	00279793          	sll	a5,a5,0x2
    80002800:	012787b3          	add	a5,a5,s2
    80002804:	0007a783          	lw	a5,0(a5)
    80002808:	012787b3          	add	a5,a5,s2
    8000280c:	00078067          	jr	a5
    80002810:	02500513          	li	a0,37
    80002814:	2a0000ef          	jal	80002ab4 <uart_putc>
    80002818:	00044503          	lbu	a0,0(s0)
    8000281c:	ffe00b13          	li	s6,-2
    80002820:	294000ef          	jal	80002ab4 <uart_putc>
    80002824:	00144503          	lbu	a0,1(s0)
    80002828:	00140413          	add	s0,s0,1
    8000282c:	fa0516e3          	bnez	a0,800027d8 <printf+0x7c>
    80002830:	05813083          	ld	ra,88(sp)
    80002834:	05013403          	ld	s0,80(sp)
    80002838:	04813483          	ld	s1,72(sp)
    8000283c:	04013903          	ld	s2,64(sp)
    80002840:	03813983          	ld	s3,56(sp)
    80002844:	03013a03          	ld	s4,48(sp)
    80002848:	02813a83          	ld	s5,40(sp)
    8000284c:	01813b83          	ld	s7,24(sp)
    80002850:	000b0513          	mv	a0,s6
    80002854:	02013b03          	ld	s6,32(sp)
    80002858:	0a010113          	add	sp,sp,160
    8000285c:	00008067          	ret
    80002860:	00813783          	ld	a5,8(sp)
    80002864:	00000613          	li	a2,0
    80002868:	01000593          	li	a1,16
    8000286c:	0007a503          	lw	a0,0(a5)
    80002870:	00878793          	add	a5,a5,8
    80002874:	00f13423          	sd	a5,8(sp)
    80002878:	96dff0ef          	jal	800021e4 <print_number>
    8000287c:	fa9ff06f          	j	80002824 <printf+0xc8>
    80002880:	00813783          	ld	a5,8(sp)
    80002884:	0007c503          	lbu	a0,0(a5)
    80002888:	00878793          	add	a5,a5,8
    8000288c:	00f13423          	sd	a5,8(sp)
    80002890:	224000ef          	jal	80002ab4 <uart_putc>
    80002894:	f91ff06f          	j	80002824 <printf+0xc8>
    80002898:	00813783          	ld	a5,8(sp)
    8000289c:	0007bb83          	ld	s7,0(a5)
    800028a0:	00878793          	add	a5,a5,8
    800028a4:	00f13423          	sd	a5,8(sp)
    800028a8:	000b9863          	bnez	s7,800028b8 <printf+0x15c>
    800028ac:	0e80006f          	j	80002994 <printf+0x238>
    800028b0:	001b8b93          	add	s7,s7,1
    800028b4:	200000ef          	jal	80002ab4 <uart_putc>
    800028b8:	000bc503          	lbu	a0,0(s7)
    800028bc:	fe051ae3          	bnez	a0,800028b0 <printf+0x154>
    800028c0:	f65ff06f          	j	80002824 <printf+0xc8>
    800028c4:	00813783          	ld	a5,8(sp)
    800028c8:	00100613          	li	a2,1
    800028cc:	00a00593          	li	a1,10
    800028d0:	0007a503          	lw	a0,0(a5)
    800028d4:	00878793          	add	a5,a5,8
    800028d8:	00f13423          	sd	a5,8(sp)
    800028dc:	909ff0ef          	jal	800021e4 <print_number>
    800028e0:	f45ff06f          	j	80002824 <printf+0xc8>
    800028e4:	00244783          	lbu	a5,2(s0)
    800028e8:	00240413          	add	s0,s0,2
    800028ec:	0a078c63          	beqz	a5,800029a4 <printf+0x248>
    800028f0:	06978663          	beq	a5,s1,8000295c <printf+0x200>
    800028f4:	fa87879b          	addw	a5,a5,-88
    800028f8:	0ff7f793          	zext.b	a5,a5
    800028fc:	06fa6663          	bltu	s4,a5,80002968 <printf+0x20c>
    80002900:	00279793          	sll	a5,a5,0x2
    80002904:	015787b3          	add	a5,a5,s5
    80002908:	0007a783          	lw	a5,0(a5)
    8000290c:	015787b3          	add	a5,a5,s5
    80002910:	00078067          	jr	a5
    80002914:	00813783          	ld	a5,8(sp)
    80002918:	0007b503          	ld	a0,0(a5)
    8000291c:	00878793          	add	a5,a5,8
    80002920:	00f13423          	sd	a5,8(sp)
    80002924:	06050263          	beqz	a0,80002988 <printf+0x22c>
    80002928:	00000613          	li	a2,0
    8000292c:	01000593          	li	a1,16
    80002930:	989ff0ef          	jal	800022b8 <print_number_long.part.0>
    80002934:	ef1ff06f          	j	80002824 <printf+0xc8>
    80002938:	00813783          	ld	a5,8(sp)
    8000293c:	0007b503          	ld	a0,0(a5)
    80002940:	00878793          	add	a5,a5,8
    80002944:	00f13423          	sd	a5,8(sp)
    80002948:	04050063          	beqz	a0,80002988 <printf+0x22c>
    8000294c:	00100613          	li	a2,1
    80002950:	00a00593          	li	a1,10
    80002954:	965ff0ef          	jal	800022b8 <print_number_long.part.0>
    80002958:	ecdff06f          	j	80002824 <printf+0xc8>
    8000295c:	02500513          	li	a0,37
    80002960:	154000ef          	jal	80002ab4 <uart_putc>
    80002964:	ec1ff06f          	j	80002824 <printf+0xc8>
    80002968:	02500513          	li	a0,37
    8000296c:	148000ef          	jal	80002ab4 <uart_putc>
    80002970:	06c00513          	li	a0,108
    80002974:	140000ef          	jal	80002ab4 <uart_putc>
    80002978:	ea1ff06f          	j	80002818 <printf+0xbc>
    8000297c:	02500513          	li	a0,37
    80002980:	134000ef          	jal	80002ab4 <uart_putc>
    80002984:	eadff06f          	j	80002830 <printf+0xd4>
    80002988:	03000513          	li	a0,48
    8000298c:	128000ef          	jal	80002ab4 <uart_putc>
    80002990:	e95ff06f          	j	80002824 <printf+0xc8>
    80002994:	00007517          	auipc	a0,0x7
    80002998:	d0450513          	add	a0,a0,-764 # 80009698 <rodata_start+0x2698>
    8000299c:	130000ef          	jal	80002acc <uart_puts>
    800029a0:	e85ff06f          	j	80002824 <printf+0xc8>
    800029a4:	02500513          	li	a0,37
    800029a8:	10c000ef          	jal	80002ab4 <uart_putc>
    800029ac:	06c00513          	li	a0,108
    800029b0:	104000ef          	jal	80002ab4 <uart_putc>
    800029b4:	e7dff06f          	j	80002830 <printf+0xd4>
    800029b8:	fff00b13          	li	s6,-1
    800029bc:	e75ff06f          	j	80002830 <printf+0xd4>

00000000800029c0 <test_printf_basic>:
    800029c0:	ff010113          	add	sp,sp,-16
    800029c4:	02a00593          	li	a1,42
    800029c8:	00007517          	auipc	a0,0x7
    800029cc:	ce050513          	add	a0,a0,-800 # 800096a8 <rodata_start+0x26a8>
    800029d0:	00113423          	sd	ra,8(sp)
    800029d4:	d89ff0ef          	jal	8000275c <printf>
    800029d8:	f8500593          	li	a1,-123
    800029dc:	00007517          	auipc	a0,0x7
    800029e0:	ce450513          	add	a0,a0,-796 # 800096c0 <rodata_start+0x26c0>
    800029e4:	d79ff0ef          	jal	8000275c <printf>
    800029e8:	00000593          	li	a1,0
    800029ec:	00007517          	auipc	a0,0x7
    800029f0:	cec50513          	add	a0,a0,-788 # 800096d8 <rodata_start+0x26d8>
    800029f4:	d69ff0ef          	jal	8000275c <printf>
    800029f8:	000015b7          	lui	a1,0x1
    800029fc:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80002a00:	00007517          	auipc	a0,0x7
    80002a04:	cf050513          	add	a0,a0,-784 # 800096f0 <rodata_start+0x26f0>
    80002a08:	d55ff0ef          	jal	8000275c <printf>
    80002a0c:	00007597          	auipc	a1,0x7
    80002a10:	cfc58593          	add	a1,a1,-772 # 80009708 <rodata_start+0x2708>
    80002a14:	00007517          	auipc	a0,0x7
    80002a18:	cfc50513          	add	a0,a0,-772 # 80009710 <rodata_start+0x2710>
    80002a1c:	d41ff0ef          	jal	8000275c <printf>
    80002a20:	05800593          	li	a1,88
    80002a24:	00007517          	auipc	a0,0x7
    80002a28:	d0450513          	add	a0,a0,-764 # 80009728 <rodata_start+0x2728>
    80002a2c:	d31ff0ef          	jal	8000275c <printf>
    80002a30:	00813083          	ld	ra,8(sp)
    80002a34:	00007517          	auipc	a0,0x7
    80002a38:	d0c50513          	add	a0,a0,-756 # 80009740 <rodata_start+0x2740>
    80002a3c:	01010113          	add	sp,sp,16
    80002a40:	d1dff06f          	j	8000275c <printf>

0000000080002a44 <test_printf_edge_cases>:
    80002a44:	800005b7          	lui	a1,0x80000
    80002a48:	ff010113          	add	sp,sp,-16
    80002a4c:	fff5c593          	not	a1,a1
    80002a50:	00007517          	auipc	a0,0x7
    80002a54:	d0850513          	add	a0,a0,-760 # 80009758 <rodata_start+0x2758>
    80002a58:	00113423          	sd	ra,8(sp)
    80002a5c:	d01ff0ef          	jal	8000275c <printf>
    80002a60:	800005b7          	lui	a1,0x80000
    80002a64:	00007517          	auipc	a0,0x7
    80002a68:	d0450513          	add	a0,a0,-764 # 80009768 <rodata_start+0x2768>
    80002a6c:	cf1ff0ef          	jal	8000275c <printf>
    80002a70:	00000593          	li	a1,0
    80002a74:	00007517          	auipc	a0,0x7
    80002a78:	d0450513          	add	a0,a0,-764 # 80009778 <rodata_start+0x2778>
    80002a7c:	ce1ff0ef          	jal	8000275c <printf>
    80002a80:	00006597          	auipc	a1,0x6
    80002a84:	b0058593          	add	a1,a1,-1280 # 80008580 <rodata_start+0x1580>
    80002a88:	00007517          	auipc	a0,0x7
    80002a8c:	d0850513          	add	a0,a0,-760 # 80009790 <rodata_start+0x2790>
    80002a90:	ccdff0ef          	jal	8000275c <printf>
    80002a94:	00007517          	auipc	a0,0x7
    80002a98:	d1450513          	add	a0,a0,-748 # 800097a8 <rodata_start+0x27a8>
    80002a9c:	cc1ff0ef          	jal	8000275c <printf>
    80002aa0:	00813083          	ld	ra,8(sp)
    80002aa4:	00007517          	auipc	a0,0x7
    80002aa8:	d1450513          	add	a0,a0,-748 # 800097b8 <rodata_start+0x27b8>
    80002aac:	01010113          	add	sp,sp,16
    80002ab0:	cadff06f          	j	8000275c <printf>

0000000080002ab4 <uart_putc>:
    80002ab4:	10000737          	lui	a4,0x10000
    80002ab8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002abc:	0207f793          	and	a5,a5,32
    80002ac0:	fe078ce3          	beqz	a5,80002ab8 <uart_putc+0x4>
    80002ac4:	00a70023          	sb	a0,0(a4)
    80002ac8:	00008067          	ret

0000000080002acc <uart_puts>:
    80002acc:	00054683          	lbu	a3,0(a0)
    80002ad0:	02068263          	beqz	a3,80002af4 <uart_puts+0x28>
    80002ad4:	10000737          	lui	a4,0x10000
    80002ad8:	00150513          	add	a0,a0,1
    80002adc:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002ae0:	0207f793          	and	a5,a5,32
    80002ae4:	fe078ce3          	beqz	a5,80002adc <uart_puts+0x10>
    80002ae8:	00d70023          	sb	a3,0(a4)
    80002aec:	00054683          	lbu	a3,0(a0)
    80002af0:	fe0694e3          	bnez	a3,80002ad8 <uart_puts+0xc>
    80002af4:	00008067          	ret

0000000080002af8 <pmm_init>:
    80002af8:	000017b7          	lui	a5,0x1
    80002afc:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80002b00:	00f50533          	add	a0,a0,a5
    80002b04:	fffff737          	lui	a4,0xfffff
    80002b08:	00e57533          	and	a0,a0,a4
    80002b0c:	00e5f5b3          	and	a1,a1,a4
    80002b10:	00424797          	auipc	a5,0x424
    80002b14:	8aa7b423          	sd	a0,-1880(a5) # 804263b8 <mem_start>
    80002b18:	00424797          	auipc	a5,0x424
    80002b1c:	88b7bc23          	sd	a1,-1896(a5) # 804263b0 <mem_end>
    80002b20:	00424797          	auipc	a5,0x424
    80002b24:	8a07b023          	sd	zero,-1888(a5) # 804263c0 <freelist>
    80002b28:	02b57e63          	bgeu	a0,a1,80002b64 <pmm_init+0x6c>
    80002b2c:	02050e63          	beqz	a0,80002b68 <pmm_init+0x70>
    80002b30:	00050793          	mv	a5,a0
    80002b34:	00000613          	li	a2,0
    80002b38:	00000693          	li	a3,0
    80002b3c:	00a7e863          	bltu	a5,a0,80002b4c <pmm_init+0x54>
    80002b40:	00d7b023          	sd	a3,0(a5)
    80002b44:	00100613          	li	a2,1
    80002b48:	00078693          	mv	a3,a5
    80002b4c:	00001737          	lui	a4,0x1
    80002b50:	00e787b3          	add	a5,a5,a4
    80002b54:	feb7e4e3          	bltu	a5,a1,80002b3c <pmm_init+0x44>
    80002b58:	00060663          	beqz	a2,80002b64 <pmm_init+0x6c>
    80002b5c:	00424797          	auipc	a5,0x424
    80002b60:	86d7b223          	sd	a3,-1948(a5) # 804263c0 <freelist>
    80002b64:	00008067          	ret
    80002b68:	00000793          	li	a5,0
    80002b6c:	00000613          	li	a2,0
    80002b70:	00000693          	li	a3,0
    80002b74:	fd9ff06f          	j	80002b4c <pmm_init+0x54>

0000000080002b78 <alloc_page>:
    80002b78:	00424797          	auipc	a5,0x424
    80002b7c:	84878793          	add	a5,a5,-1976 # 804263c0 <freelist>
    80002b80:	0007b503          	ld	a0,0(a5)
    80002b84:	00050663          	beqz	a0,80002b90 <alloc_page+0x18>
    80002b88:	00053703          	ld	a4,0(a0)
    80002b8c:	00e7b023          	sd	a4,0(a5)
    80002b90:	00008067          	ret

0000000080002b94 <free_page>:
    80002b94:	02050c63          	beqz	a0,80002bcc <free_page+0x38>
    80002b98:	00424797          	auipc	a5,0x424
    80002b9c:	8207b783          	ld	a5,-2016(a5) # 804263b8 <mem_start>
    80002ba0:	02f56663          	bltu	a0,a5,80002bcc <free_page+0x38>
    80002ba4:	00424797          	auipc	a5,0x424
    80002ba8:	80c7b783          	ld	a5,-2036(a5) # 804263b0 <mem_end>
    80002bac:	02f57063          	bgeu	a0,a5,80002bcc <free_page+0x38>
    80002bb0:	03451793          	sll	a5,a0,0x34
    80002bb4:	00079c63          	bnez	a5,80002bcc <free_page+0x38>
    80002bb8:	00424797          	auipc	a5,0x424
    80002bbc:	80878793          	add	a5,a5,-2040 # 804263c0 <freelist>
    80002bc0:	0007b703          	ld	a4,0(a5)
    80002bc4:	00a7b023          	sd	a0,0(a5)
    80002bc8:	00e53023          	sd	a4,0(a0)
    80002bcc:	00008067          	ret

0000000080002bd0 <alloc_pages>:
    80002bd0:	00050613          	mv	a2,a0
    80002bd4:	08a05863          	blez	a0,80002c64 <alloc_pages+0x94>
    80002bd8:	00423317          	auipc	t1,0x423
    80002bdc:	7e830313          	add	t1,t1,2024 # 804263c0 <freelist>
    80002be0:	00100793          	li	a5,1
    80002be4:	00033803          	ld	a6,0(t1)
    80002be8:	06f50463          	beq	a0,a5,80002c50 <alloc_pages+0x80>
    80002bec:	06080c63          	beqz	a6,80002c64 <alloc_pages+0x94>
    80002bf0:	00083503          	ld	a0,0(a6)
    80002bf4:	00080793          	mv	a5,a6
    80002bf8:	00100713          	li	a4,1
    80002bfc:	00000893          	li	a7,0
    80002c00:	000015b7          	lui	a1,0x1
    80002c04:	0200006f          	j	80002c24 <alloc_pages+0x54>
    80002c08:	02d50463          	beq	a0,a3,80002c30 <alloc_pages+0x60>
    80002c0c:	00053683          	ld	a3,0(a0)
    80002c10:	00078893          	mv	a7,a5
    80002c14:	00050813          	mv	a6,a0
    80002c18:	00100713          	li	a4,1
    80002c1c:	00050793          	mv	a5,a0
    80002c20:	00068513          	mv	a0,a3
    80002c24:	00b786b3          	add	a3,a5,a1
    80002c28:	fe0510e3          	bnez	a0,80002c08 <alloc_pages+0x38>
    80002c2c:	00008067          	ret
    80002c30:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80002c34:	00053683          	ld	a3,0(a0)
    80002c38:	fee612e3          	bne	a2,a4,80002c1c <alloc_pages+0x4c>
    80002c3c:	02088863          	beqz	a7,80002c6c <alloc_pages+0x9c>
    80002c40:	00d8b023          	sd	a3,0(a7)
    80002c44:	00053023          	sd	zero,0(a0)
    80002c48:	00080513          	mv	a0,a6
    80002c4c:	00008067          	ret
    80002c50:	00080663          	beqz	a6,80002c5c <alloc_pages+0x8c>
    80002c54:	00083783          	ld	a5,0(a6)
    80002c58:	00f33023          	sd	a5,0(t1)
    80002c5c:	00080513          	mv	a0,a6
    80002c60:	00008067          	ret
    80002c64:	00000513          	li	a0,0
    80002c68:	00008067          	ret
    80002c6c:	00053023          	sd	zero,0(a0)
    80002c70:	00d33023          	sd	a3,0(t1)
    80002c74:	00080513          	mv	a0,a6
    80002c78:	00008067          	ret

0000000080002c7c <walk_lookup>:
    80002c7c:	01e5d793          	srl	a5,a1,0x1e
    80002c80:	1ff7f793          	and	a5,a5,511
    80002c84:	00379793          	sll	a5,a5,0x3
    80002c88:	00f50533          	add	a0,a0,a5
    80002c8c:	00053703          	ld	a4,0(a0)
    80002c90:	00177793          	and	a5,a4,1
    80002c94:	04078a63          	beqz	a5,80002ce8 <walk_lookup+0x6c>
    80002c98:	00e77793          	and	a5,a4,14
    80002c9c:	04079663          	bnez	a5,80002ce8 <walk_lookup+0x6c>
    80002ca0:	0155d793          	srl	a5,a1,0x15
    80002ca4:	00a75713          	srl	a4,a4,0xa
    80002ca8:	1ff7f793          	and	a5,a5,511
    80002cac:	00c71713          	sll	a4,a4,0xc
    80002cb0:	00379793          	sll	a5,a5,0x3
    80002cb4:	00e787b3          	add	a5,a5,a4
    80002cb8:	0007b503          	ld	a0,0(a5)
    80002cbc:	00157793          	and	a5,a0,1
    80002cc0:	02078463          	beqz	a5,80002ce8 <walk_lookup+0x6c>
    80002cc4:	00e57793          	and	a5,a0,14
    80002cc8:	02079063          	bnez	a5,80002ce8 <walk_lookup+0x6c>
    80002ccc:	00c5d593          	srl	a1,a1,0xc
    80002cd0:	00a55513          	srl	a0,a0,0xa
    80002cd4:	1ff5f593          	and	a1,a1,511
    80002cd8:	00359593          	sll	a1,a1,0x3
    80002cdc:	00c51513          	sll	a0,a0,0xc
    80002ce0:	00b50533          	add	a0,a0,a1
    80002ce4:	00008067          	ret
    80002ce8:	00000513          	li	a0,0
    80002cec:	00008067          	ret

0000000080002cf0 <free_swap_slot.part.0>:
    80002cf0:	0055579b          	srlw	a5,a0,0x5
    80002cf4:	0000e617          	auipc	a2,0xe
    80002cf8:	48460613          	add	a2,a2,1156 # 80011178 <swap_mgr>
    80002cfc:	00279793          	sll	a5,a5,0x2
    80002d00:	00f607b3          	add	a5,a2,a5
    80002d04:	0007a583          	lw	a1,0(a5)
    80002d08:	00100713          	li	a4,1
    80002d0c:	00a7173b          	sllw	a4,a4,a0
    80002d10:	00e5f6b3          	and	a3,a1,a4
    80002d14:	0006869b          	sext.w	a3,a3
    80002d18:	02068463          	beqz	a3,80002d40 <free_swap_slot.part.0+0x50>
    80002d1c:	08862683          	lw	a3,136(a2)
    80002d20:	fff74713          	not	a4,a4
    80002d24:	08062803          	lw	a6,128(a2)
    80002d28:	00e5f5b3          	and	a1,a1,a4
    80002d2c:	fff6871b          	addw	a4,a3,-1
    80002d30:	00b7a023          	sw	a1,0(a5)
    80002d34:	08e62423          	sw	a4,136(a2)
    80002d38:	01057463          	bgeu	a0,a6,80002d40 <free_swap_slot.part.0+0x50>
    80002d3c:	08a62023          	sw	a0,128(a2)
    80002d40:	00008067          	ret

0000000080002d44 <uvmunmap.part.0>:
    80002d44:	fc010113          	add	sp,sp,-64
    80002d48:	03213023          	sd	s2,32(sp)
    80002d4c:	00c61913          	sll	s2,a2,0xc
    80002d50:	02113c23          	sd	ra,56(sp)
    80002d54:	02813823          	sd	s0,48(sp)
    80002d58:	02913423          	sd	s1,40(sp)
    80002d5c:	01313c23          	sd	s3,24(sp)
    80002d60:	01413823          	sd	s4,16(sp)
    80002d64:	01513423          	sd	s5,8(sp)
    80002d68:	00b90933          	add	s2,s2,a1
    80002d6c:	0525f863          	bgeu	a1,s2,80002dbc <uvmunmap.part.0+0x78>
    80002d70:	00058493          	mv	s1,a1
    80002d74:	00050993          	mv	s3,a0
    80002d78:	00068a93          	mv	s5,a3
    80002d7c:	00001a37          	lui	s4,0x1
    80002d80:	00048593          	mv	a1,s1
    80002d84:	00098513          	mv	a0,s3
    80002d88:	ef5ff0ef          	jal	80002c7c <walk_lookup>
    80002d8c:	00050413          	mv	s0,a0
    80002d90:	014484b3          	add	s1,s1,s4
    80002d94:	02050263          	beqz	a0,80002db8 <uvmunmap.part.0+0x74>
    80002d98:	00053783          	ld	a5,0(a0)
    80002d9c:	00a7d713          	srl	a4,a5,0xa
    80002da0:	0017f793          	and	a5,a5,1
    80002da4:	00c71513          	sll	a0,a4,0xc
    80002da8:	00078863          	beqz	a5,80002db8 <uvmunmap.part.0+0x74>
    80002dac:	00050663          	beqz	a0,80002db8 <uvmunmap.part.0+0x74>
    80002db0:	020a9863          	bnez	s5,80002de0 <uvmunmap.part.0+0x9c>
    80002db4:	00043023          	sd	zero,0(s0)
    80002db8:	fd24e4e3          	bltu	s1,s2,80002d80 <uvmunmap.part.0+0x3c>
    80002dbc:	03813083          	ld	ra,56(sp)
    80002dc0:	03013403          	ld	s0,48(sp)
    80002dc4:	02813483          	ld	s1,40(sp)
    80002dc8:	02013903          	ld	s2,32(sp)
    80002dcc:	01813983          	ld	s3,24(sp)
    80002dd0:	01013a03          	ld	s4,16(sp)
    80002dd4:	00813a83          	ld	s5,8(sp)
    80002dd8:	04010113          	add	sp,sp,64
    80002ddc:	00008067          	ret
    80002de0:	db5ff0ef          	jal	80002b94 <free_page>
    80002de4:	00043023          	sd	zero,0(s0)
    80002de8:	fd1ff06f          	j	80002db8 <uvmunmap.part.0+0x74>

0000000080002dec <create_pagetable>:
    80002dec:	ff010113          	add	sp,sp,-16
    80002df0:	00113423          	sd	ra,8(sp)
    80002df4:	d85ff0ef          	jal	80002b78 <alloc_page>
    80002df8:	00050e63          	beqz	a0,80002e14 <create_pagetable+0x28>
    80002dfc:	00001737          	lui	a4,0x1
    80002e00:	00050793          	mv	a5,a0
    80002e04:	00e50733          	add	a4,a0,a4
    80002e08:	0007b023          	sd	zero,0(a5)
    80002e0c:	00878793          	add	a5,a5,8
    80002e10:	fee79ce3          	bne	a5,a4,80002e08 <create_pagetable+0x1c>
    80002e14:	00813083          	ld	ra,8(sp)
    80002e18:	01010113          	add	sp,sp,16
    80002e1c:	00008067          	ret

0000000080002e20 <map_page>:
    80002e20:	00c5e7b3          	or	a5,a1,a2
    80002e24:	03479713          	sll	a4,a5,0x34
    80002e28:	20071863          	bnez	a4,80003038 <map_page+0x218>
    80002e2c:	fc010113          	add	sp,sp,-64
    80002e30:	02913423          	sd	s1,40(sp)
    80002e34:	03213023          	sd	s2,32(sp)
    80002e38:	01313c23          	sd	s3,24(sp)
    80002e3c:	01413823          	sd	s4,16(sp)
    80002e40:	01513423          	sd	s5,8(sp)
    80002e44:	01613023          	sd	s6,0(sp)
    80002e48:	02113c23          	sd	ra,56(sp)
    80002e4c:	02813823          	sd	s0,48(sp)
    80002e50:	00058493          	mv	s1,a1
    80002e54:	00060913          	mv	s2,a2
    80002e58:	00050a13          	mv	s4,a0
    80002e5c:	00068993          	mv	s3,a3
    80002e60:	00050813          	mv	a6,a0
    80002e64:	00200a93          	li	s5,2
    80002e68:	00200793          	li	a5,2
    80002e6c:	00100b13          	li	s6,1
    80002e70:	0037941b          	sllw	s0,a5,0x3
    80002e74:	00f4043b          	addw	s0,s0,a5
    80002e78:	00c4041b          	addw	s0,s0,12
    80002e7c:	0084d433          	srl	s0,s1,s0
    80002e80:	1ff47413          	and	s0,s0,511
    80002e84:	00341413          	sll	s0,s0,0x3
    80002e88:	00880433          	add	s0,a6,s0
    80002e8c:	00043783          	ld	a5,0(s0)
    80002e90:	0017f713          	and	a4,a5,1
    80002e94:	14070e63          	beqz	a4,80002ff0 <map_page+0x1d0>
    80002e98:	00e7f713          	and	a4,a5,14
    80002e9c:	18071a63          	bnez	a4,80003030 <map_page+0x210>
    80002ea0:	00a7d793          	srl	a5,a5,0xa
    80002ea4:	00c79813          	sll	a6,a5,0xc
    80002ea8:	00100793          	li	a5,1
    80002eac:	016a8663          	beq	s5,s6,80002eb8 <map_page+0x98>
    80002eb0:	00100a93          	li	s5,1
    80002eb4:	fbdff06f          	j	80002e70 <map_page+0x50>
    80002eb8:	00c4d793          	srl	a5,s1,0xc
    80002ebc:	1ff7f793          	and	a5,a5,511
    80002ec0:	00379793          	sll	a5,a5,0x3
    80002ec4:	00f80833          	add	a6,a6,a5
    80002ec8:	16080463          	beqz	a6,80003030 <map_page+0x210>
    80002ecc:	00083783          	ld	a5,0(a6)
    80002ed0:	0017f793          	and	a5,a5,1
    80002ed4:	14079e63          	bnez	a5,80003030 <map_page+0x210>
    80002ed8:	00c95793          	srl	a5,s2,0xc
    80002edc:	00a79793          	sll	a5,a5,0xa
    80002ee0:	00411597          	auipc	a1,0x411
    80002ee4:	32858593          	add	a1,a1,808 # 80414208 <lru_mgr+0x3000>
    80002ee8:	0145a703          	lw	a4,20(a1)
    80002eec:	0137e7b3          	or	a5,a5,s3
    80002ef0:	0017e793          	or	a5,a5,1
    80002ef4:	00f83023          	sd	a5,0(a6)
    80002ef8:	0c070663          	beqz	a4,80002fc4 <map_page+0x1a4>
    80002efc:	0040e717          	auipc	a4,0x40e
    80002f00:	33070713          	add	a4,a4,816 # 8041122c <lru_mgr+0x24>
    80002f04:	00000793          	li	a5,0
    80002f08:	10000693          	li	a3,256
    80002f0c:	00c0006f          	j	80002f18 <map_page+0xf8>
    80002f10:	0017879b          	addw	a5,a5,1
    80002f14:	0ad78863          	beq	a5,a3,80002fc4 <map_page+0x1a4>
    80002f18:	00072803          	lw	a6,0(a4)
    80002f1c:	03070713          	add	a4,a4,48
    80002f20:	fe0818e3          	bnez	a6,80002f10 <map_page+0xf0>
    80002f24:	00178813          	add	a6,a5,1
    80002f28:	00181513          	sll	a0,a6,0x1
    80002f2c:	00179713          	sll	a4,a5,0x1
    80002f30:	01050533          	add	a0,a0,a6
    80002f34:	0040e617          	auipc	a2,0x40e
    80002f38:	2d460613          	add	a2,a2,724 # 80411208 <lru_mgr>
    80002f3c:	00f706b3          	add	a3,a4,a5
    80002f40:	00451513          	sll	a0,a0,0x4
    80002f44:	00469693          	sll	a3,a3,0x4
    80002f48:	00a60533          	add	a0,a2,a0
    80002f4c:	fffff337          	lui	t1,0xfffff
    80002f50:	00d608b3          	add	a7,a2,a3
    80002f54:	0064f4b3          	and	s1,s1,t1
    80002f58:	01453423          	sd	s4,8(a0)
    80002f5c:	fff00513          	li	a0,-1
    80002f60:	01068693          	add	a3,a3,16
    80002f64:	0098b823          	sd	s1,16(a7)
    80002f68:	0128bc23          	sd	s2,24(a7)
    80002f6c:	02a8a023          	sw	a0,32(a7)
    80002f70:	0049f993          	and	s3,s3,4
    80002f74:	00d606b3          	add	a3,a2,a3
    80002f78:	00098463          	beqz	s3,80002f80 <map_page+0x160>
    80002f7c:	00500a93          	li	s5,5
    80002f80:	00181513          	sll	a0,a6,0x1
    80002f84:	00f707b3          	add	a5,a4,a5
    80002f88:	00063883          	ld	a7,0(a2)
    80002f8c:	01050733          	add	a4,a0,a6
    80002f90:	00479793          	sll	a5,a5,0x4
    80002f94:	00471713          	sll	a4,a4,0x4
    80002f98:	00f607b3          	add	a5,a2,a5
    80002f9c:	00e60733          	add	a4,a2,a4
    80002fa0:	0357a223          	sw	s5,36(a5)
    80002fa4:	01173023          	sd	a7,0(a4)
    80002fa8:	0207b423          	sd	zero,40(a5)
    80002fac:	06088e63          	beqz	a7,80003028 <map_page+0x208>
    80002fb0:	00d8bc23          	sd	a3,24(a7)
    80002fb4:	0105a783          	lw	a5,16(a1)
    80002fb8:	00d63023          	sd	a3,0(a2)
    80002fbc:	0017879b          	addw	a5,a5,1
    80002fc0:	00f5a823          	sw	a5,16(a1)
    80002fc4:	00000513          	li	a0,0
    80002fc8:	03813083          	ld	ra,56(sp)
    80002fcc:	03013403          	ld	s0,48(sp)
    80002fd0:	02813483          	ld	s1,40(sp)
    80002fd4:	02013903          	ld	s2,32(sp)
    80002fd8:	01813983          	ld	s3,24(sp)
    80002fdc:	01013a03          	ld	s4,16(sp)
    80002fe0:	00813a83          	ld	s5,8(sp)
    80002fe4:	00013b03          	ld	s6,0(sp)
    80002fe8:	04010113          	add	sp,sp,64
    80002fec:	00008067          	ret
    80002ff0:	b89ff0ef          	jal	80002b78 <alloc_page>
    80002ff4:	00050813          	mv	a6,a0
    80002ff8:	02050c63          	beqz	a0,80003030 <map_page+0x210>
    80002ffc:	00001737          	lui	a4,0x1
    80003000:	00e50733          	add	a4,a0,a4
    80003004:	00050793          	mv	a5,a0
    80003008:	0007b023          	sd	zero,0(a5)
    8000300c:	00878793          	add	a5,a5,8
    80003010:	fee79ce3          	bne	a5,a4,80003008 <map_page+0x1e8>
    80003014:	00c85793          	srl	a5,a6,0xc
    80003018:	00a79793          	sll	a5,a5,0xa
    8000301c:	0017e793          	or	a5,a5,1
    80003020:	00f43023          	sd	a5,0(s0)
    80003024:	e85ff06f          	j	80002ea8 <map_page+0x88>
    80003028:	00d63423          	sd	a3,8(a2)
    8000302c:	f89ff06f          	j	80002fb4 <map_page+0x194>
    80003030:	fff00513          	li	a0,-1
    80003034:	f95ff06f          	j	80002fc8 <map_page+0x1a8>
    80003038:	fff00513          	li	a0,-1
    8000303c:	00008067          	ret

0000000080003040 <map_region>:
    80003040:	000017b7          	lui	a5,0x1
    80003044:	fc010113          	add	sp,sp,-64
    80003048:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000304c:	02913423          	sd	s1,40(sp)
    80003050:	00f684b3          	add	s1,a3,a5
    80003054:	00b484b3          	add	s1,s1,a1
    80003058:	fffff7b7          	lui	a5,0xfffff
    8000305c:	02113c23          	sd	ra,56(sp)
    80003060:	02813823          	sd	s0,48(sp)
    80003064:	03213023          	sd	s2,32(sp)
    80003068:	01313c23          	sd	s3,24(sp)
    8000306c:	01413823          	sd	s4,16(sp)
    80003070:	01513423          	sd	s5,8(sp)
    80003074:	00f4f4b3          	and	s1,s1,a5
    80003078:	0495f263          	bgeu	a1,s1,800030bc <map_region+0x7c>
    8000307c:	00058413          	mv	s0,a1
    80003080:	00050993          	mv	s3,a0
    80003084:	00070a13          	mv	s4,a4
    80003088:	40b60933          	sub	s2,a2,a1
    8000308c:	00001ab7          	lui	s5,0x1
    80003090:	0080006f          	j	80003098 <map_region+0x58>
    80003094:	02947463          	bgeu	s0,s1,800030bc <map_region+0x7c>
    80003098:	00890633          	add	a2,s2,s0
    8000309c:	00040593          	mv	a1,s0
    800030a0:	000a0693          	mv	a3,s4
    800030a4:	00098513          	mv	a0,s3
    800030a8:	d79ff0ef          	jal	80002e20 <map_page>
    800030ac:	01540433          	add	s0,s0,s5
    800030b0:	fe0502e3          	beqz	a0,80003094 <map_region+0x54>
    800030b4:	fff00513          	li	a0,-1
    800030b8:	0080006f          	j	800030c0 <map_region+0x80>
    800030bc:	00000513          	li	a0,0
    800030c0:	03813083          	ld	ra,56(sp)
    800030c4:	03013403          	ld	s0,48(sp)
    800030c8:	02813483          	ld	s1,40(sp)
    800030cc:	02013903          	ld	s2,32(sp)
    800030d0:	01813983          	ld	s3,24(sp)
    800030d4:	01013a03          	ld	s4,16(sp)
    800030d8:	00813a83          	ld	s5,8(sp)
    800030dc:	04010113          	add	sp,sp,64
    800030e0:	00008067          	ret

00000000800030e4 <destroy_pagetable>:
    800030e4:	f0010113          	add	sp,sp,-256
    800030e8:	000017b7          	lui	a5,0x1
    800030ec:	0e813823          	sd	s0,240(sp)
    800030f0:	0f213023          	sd	s2,224(sp)
    800030f4:	0d613023          	sd	s6,192(sp)
    800030f8:	0b713c23          	sd	s7,184(sp)
    800030fc:	0e113c23          	sd	ra,248(sp)
    80003100:	0e913423          	sd	s1,232(sp)
    80003104:	0d313c23          	sd	s3,216(sp)
    80003108:	0d413823          	sd	s4,208(sp)
    8000310c:	0d513423          	sd	s5,200(sp)
    80003110:	0b813823          	sd	s8,176(sp)
    80003114:	0b913423          	sd	s9,168(sp)
    80003118:	0ba13023          	sd	s10,160(sp)
    8000311c:	09b13c23          	sd	s11,152(sp)
    80003120:	00050413          	mv	s0,a0
    80003124:	00050913          	mv	s2,a0
    80003128:	00f50b33          	add	s6,a0,a5
    8000312c:	00001bb7          	lui	s7,0x1
    80003130:	00c0006f          	j	8000313c <destroy_pagetable+0x58>
    80003134:	00890913          	add	s2,s2,8
    80003138:	2d690063          	beq	s2,s6,800033f8 <destroy_pagetable+0x314>
    8000313c:	00093783          	ld	a5,0(s2)
    80003140:	00100713          	li	a4,1
    80003144:	00f7f693          	and	a3,a5,15
    80003148:	fee696e3          	bne	a3,a4,80003134 <destroy_pagetable+0x50>
    8000314c:	00a7d793          	srl	a5,a5,0xa
    80003150:	00c79a13          	sll	s4,a5,0xc
    80003154:	017a0cb3          	add	s9,s4,s7
    80003158:	00100d93          	li	s11,1
    8000315c:	000a0a93          	mv	s5,s4
    80003160:	00040493          	mv	s1,s0
    80003164:	00c0006f          	j	80003170 <destroy_pagetable+0x8c>
    80003168:	008a0a13          	add	s4,s4,8 # 1008 <_entry-0x7fffeff8>
    8000316c:	279a0c63          	beq	s4,s9,800033e4 <destroy_pagetable+0x300>
    80003170:	000a3783          	ld	a5,0(s4)
    80003174:	00f7f713          	and	a4,a5,15
    80003178:	ffb718e3          	bne	a4,s11,80003168 <destroy_pagetable+0x84>
    8000317c:	00a7d793          	srl	a5,a5,0xa
    80003180:	00c79993          	sll	s3,a5,0xc
    80003184:	00098c13          	mv	s8,s3
    80003188:	01798d33          	add	s10,s3,s7
    8000318c:	00098413          	mv	s0,s3
    80003190:	00c0006f          	j	8000319c <destroy_pagetable+0xb8>
    80003194:	00840413          	add	s0,s0,8
    80003198:	23a40e63          	beq	s0,s10,800033d4 <destroy_pagetable+0x2f0>
    8000319c:	00043783          	ld	a5,0(s0)
    800031a0:	00f7f713          	and	a4,a5,15
    800031a4:	ffb718e3          	bne	a4,s11,80003194 <destroy_pagetable+0xb0>
    800031a8:	00a7d793          	srl	a5,a5,0xa
    800031ac:	00c79793          	sll	a5,a5,0xc
    800031b0:	00048713          	mv	a4,s1
    800031b4:	03513c23          	sd	s5,56(sp)
    800031b8:	00090493          	mv	s1,s2
    800031bc:	017789b3          	add	s3,a5,s7
    800031c0:	02813823          	sd	s0,48(sp)
    800031c4:	00078a93          	mv	s5,a5
    800031c8:	00070913          	mv	s2,a4
    800031cc:	00c0006f          	j	800031d8 <destroy_pagetable+0xf4>
    800031d0:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    800031d4:	1cf98e63          	beq	s3,a5,800033b0 <destroy_pagetable+0x2cc>
    800031d8:	0007b703          	ld	a4,0(a5)
    800031dc:	00f77693          	and	a3,a4,15
    800031e0:	ffb698e3          	bne	a3,s11,800031d0 <destroy_pagetable+0xec>
    800031e4:	00a75713          	srl	a4,a4,0xa
    800031e8:	00c71713          	sll	a4,a4,0xc
    800031ec:	017706b3          	add	a3,a4,s7
    800031f0:	05313423          	sd	s3,72(sp)
    800031f4:	00d13423          	sd	a3,8(sp)
    800031f8:	05813023          	sd	s8,64(sp)
    800031fc:	00070993          	mv	s3,a4
    80003200:	04f13823          	sd	a5,80(sp)
    80003204:	0100006f          	j	80003214 <destroy_pagetable+0x130>
    80003208:	00813783          	ld	a5,8(sp)
    8000320c:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    80003210:	16e78e63          	beq	a5,a4,8000338c <destroy_pagetable+0x2a8>
    80003214:	00073783          	ld	a5,0(a4)
    80003218:	00f7f693          	and	a3,a5,15
    8000321c:	ffb696e3          	bne	a3,s11,80003208 <destroy_pagetable+0x124>
    80003220:	00a7d793          	srl	a5,a5,0xa
    80003224:	00c79793          	sll	a5,a5,0xc
    80003228:	017786b3          	add	a3,a5,s7
    8000322c:	000a8c13          	mv	s8,s5
    80003230:	00d13c23          	sd	a3,24(sp)
    80003234:	00078a93          	mv	s5,a5
    80003238:	04e13c23          	sd	a4,88(sp)
    8000323c:	07213023          	sd	s2,96(sp)
    80003240:	0100006f          	j	80003250 <destroy_pagetable+0x16c>
    80003244:	01813703          	ld	a4,24(sp)
    80003248:	00878793          	add	a5,a5,8
    8000324c:	10f70c63          	beq	a4,a5,80003364 <destroy_pagetable+0x280>
    80003250:	0007b703          	ld	a4,0(a5)
    80003254:	00f77693          	and	a3,a4,15
    80003258:	ffb696e3          	bne	a3,s11,80003244 <destroy_pagetable+0x160>
    8000325c:	00a75713          	srl	a4,a4,0xa
    80003260:	00c71913          	sll	s2,a4,0xc
    80003264:	01790733          	add	a4,s2,s7
    80003268:	07213423          	sd	s2,104(sp)
    8000326c:	00090413          	mv	s0,s2
    80003270:	02e13023          	sd	a4,32(sp)
    80003274:	06f13823          	sd	a5,112(sp)
    80003278:	00048913          	mv	s2,s1
    8000327c:	0100006f          	j	8000328c <destroy_pagetable+0x1a8>
    80003280:	02013783          	ld	a5,32(sp)
    80003284:	00840413          	add	s0,s0,8
    80003288:	0a878c63          	beq	a5,s0,80003340 <destroy_pagetable+0x25c>
    8000328c:	00043783          	ld	a5,0(s0)
    80003290:	00f7f693          	and	a3,a5,15
    80003294:	ffb696e3          	bne	a3,s11,80003280 <destroy_pagetable+0x19c>
    80003298:	00a7d793          	srl	a5,a5,0xa
    8000329c:	00c79493          	sll	s1,a5,0xc
    800032a0:	017487b3          	add	a5,s1,s7
    800032a4:	00913823          	sd	s1,16(sp)
    800032a8:	02f13423          	sd	a5,40(sp)
    800032ac:	06813c23          	sd	s0,120(sp)
    800032b0:	0100006f          	j	800032c0 <destroy_pagetable+0x1dc>
    800032b4:	02813783          	ld	a5,40(sp)
    800032b8:	00848493          	add	s1,s1,8
    800032bc:	06978663          	beq	a5,s1,80003328 <destroy_pagetable+0x244>
    800032c0:	0004b783          	ld	a5,0(s1)
    800032c4:	00f7f693          	and	a3,a5,15
    800032c8:	ffb696e3          	bne	a3,s11,800032b4 <destroy_pagetable+0x1d0>
    800032cc:	00a7d793          	srl	a5,a5,0xa
    800032d0:	00c79413          	sll	s0,a5,0xc
    800032d4:	017406b3          	add	a3,s0,s7
    800032d8:	09213023          	sd	s2,128(sp)
    800032dc:	09613423          	sd	s6,136(sp)
    800032e0:	00040913          	mv	s2,s0
    800032e4:	000a0b13          	mv	s6,s4
    800032e8:	00048a13          	mv	s4,s1
    800032ec:	00068493          	mv	s1,a3
    800032f0:	00043783          	ld	a5,0(s0)
    800032f4:	00840413          	add	s0,s0,8
    800032f8:	00f7f713          	and	a4,a5,15
    800032fc:	13b70e63          	beq	a4,s11,80003438 <destroy_pagetable+0x354>
    80003300:	fe8498e3          	bne	s1,s0,800032f0 <destroy_pagetable+0x20c>
    80003304:	00090513          	mv	a0,s2
    80003308:	000a0493          	mv	s1,s4
    8000330c:	08013903          	ld	s2,128(sp)
    80003310:	000b0a13          	mv	s4,s6
    80003314:	08813b03          	ld	s6,136(sp)
    80003318:	87dff0ef          	jal	80002b94 <free_page>
    8000331c:	02813783          	ld	a5,40(sp)
    80003320:	00848493          	add	s1,s1,8
    80003324:	f8979ee3          	bne	a5,s1,800032c0 <destroy_pagetable+0x1dc>
    80003328:	01013503          	ld	a0,16(sp)
    8000332c:	07813403          	ld	s0,120(sp)
    80003330:	865ff0ef          	jal	80002b94 <free_page>
    80003334:	02013783          	ld	a5,32(sp)
    80003338:	00840413          	add	s0,s0,8
    8000333c:	f48798e3          	bne	a5,s0,8000328c <destroy_pagetable+0x1a8>
    80003340:	07013783          	ld	a5,112(sp)
    80003344:	06813503          	ld	a0,104(sp)
    80003348:	00090493          	mv	s1,s2
    8000334c:	00f13823          	sd	a5,16(sp)
    80003350:	845ff0ef          	jal	80002b94 <free_page>
    80003354:	01013783          	ld	a5,16(sp)
    80003358:	01813703          	ld	a4,24(sp)
    8000335c:	00878793          	add	a5,a5,8
    80003360:	eef718e3          	bne	a4,a5,80003250 <destroy_pagetable+0x16c>
    80003364:	05813703          	ld	a4,88(sp)
    80003368:	000a8513          	mv	a0,s5
    8000336c:	06013903          	ld	s2,96(sp)
    80003370:	00e13823          	sd	a4,16(sp)
    80003374:	821ff0ef          	jal	80002b94 <free_page>
    80003378:	01013703          	ld	a4,16(sp)
    8000337c:	00813783          	ld	a5,8(sp)
    80003380:	000c0a93          	mv	s5,s8
    80003384:	00870713          	add	a4,a4,8
    80003388:	e8e796e3          	bne	a5,a4,80003214 <destroy_pagetable+0x130>
    8000338c:	05013783          	ld	a5,80(sp)
    80003390:	00098513          	mv	a0,s3
    80003394:	04013c03          	ld	s8,64(sp)
    80003398:	00f13423          	sd	a5,8(sp)
    8000339c:	04813983          	ld	s3,72(sp)
    800033a0:	ff4ff0ef          	jal	80002b94 <free_page>
    800033a4:	00813783          	ld	a5,8(sp)
    800033a8:	00878793          	add	a5,a5,8
    800033ac:	e2f996e3          	bne	s3,a5,800031d8 <destroy_pagetable+0xf4>
    800033b0:	03013403          	ld	s0,48(sp)
    800033b4:	00090793          	mv	a5,s2
    800033b8:	000a8513          	mv	a0,s5
    800033bc:	00840413          	add	s0,s0,8
    800033c0:	03813a83          	ld	s5,56(sp)
    800033c4:	00048913          	mv	s2,s1
    800033c8:	00078493          	mv	s1,a5
    800033cc:	fc8ff0ef          	jal	80002b94 <free_page>
    800033d0:	dda416e3          	bne	s0,s10,8000319c <destroy_pagetable+0xb8>
    800033d4:	000c0513          	mv	a0,s8
    800033d8:	008a0a13          	add	s4,s4,8
    800033dc:	fb8ff0ef          	jal	80002b94 <free_page>
    800033e0:	d99a18e3          	bne	s4,s9,80003170 <destroy_pagetable+0x8c>
    800033e4:	000a8513          	mv	a0,s5
    800033e8:	00890913          	add	s2,s2,8
    800033ec:	00048413          	mv	s0,s1
    800033f0:	fa4ff0ef          	jal	80002b94 <free_page>
    800033f4:	d56914e3          	bne	s2,s6,8000313c <destroy_pagetable+0x58>
    800033f8:	00040513          	mv	a0,s0
    800033fc:	0f013403          	ld	s0,240(sp)
    80003400:	0f813083          	ld	ra,248(sp)
    80003404:	0e813483          	ld	s1,232(sp)
    80003408:	0e013903          	ld	s2,224(sp)
    8000340c:	0d813983          	ld	s3,216(sp)
    80003410:	0d013a03          	ld	s4,208(sp)
    80003414:	0c813a83          	ld	s5,200(sp)
    80003418:	0c013b03          	ld	s6,192(sp)
    8000341c:	0b813b83          	ld	s7,184(sp)
    80003420:	0b013c03          	ld	s8,176(sp)
    80003424:	0a813c83          	ld	s9,168(sp)
    80003428:	0a013d03          	ld	s10,160(sp)
    8000342c:	09813d83          	ld	s11,152(sp)
    80003430:	10010113          	add	sp,sp,256
    80003434:	f60ff06f          	j	80002b94 <free_page>
    80003438:	00a7d793          	srl	a5,a5,0xa
    8000343c:	00c79513          	sll	a0,a5,0xc
    80003440:	ca5ff0ef          	jal	800030e4 <destroy_pagetable>
    80003444:	ea8496e3          	bne	s1,s0,800032f0 <destroy_pagetable+0x20c>
    80003448:	ebdff06f          	j	80003304 <destroy_pagetable+0x220>

000000008000344c <kvminithart>:
    8000344c:	00423797          	auipc	a5,0x423
    80003450:	f7c7b783          	ld	a5,-132(a5) # 804263c8 <kernel_pagetable>
    80003454:	fff00713          	li	a4,-1
    80003458:	03f71713          	sll	a4,a4,0x3f
    8000345c:	00c7d793          	srl	a5,a5,0xc
    80003460:	00e7e7b3          	or	a5,a5,a4
    80003464:	18079073          	csrw	satp,a5
    80003468:	12000073          	sfence.vma
    8000346c:	00008067          	ret

0000000080003470 <dump_pagetable>:
    80003470:	fb010113          	add	sp,sp,-80
    80003474:	03213823          	sd	s2,48(sp)
    80003478:	03313423          	sd	s3,40(sp)
    8000347c:	04113423          	sd	ra,72(sp)
    80003480:	04813023          	sd	s0,64(sp)
    80003484:	02913c23          	sd	s1,56(sp)
    80003488:	03413023          	sd	s4,32(sp)
    8000348c:	01513c23          	sd	s5,24(sp)
    80003490:	01613823          	sd	s6,16(sp)
    80003494:	01713423          	sd	s7,8(sp)
    80003498:	00058993          	mv	s3,a1
    8000349c:	00050913          	mv	s2,a0
    800034a0:	28b05263          	blez	a1,80003724 <dump_pagetable+0x2b4>
    800034a4:	00000413          	li	s0,0
    800034a8:	0014041b          	addw	s0,s0,1
    800034ac:	02000513          	li	a0,32
    800034b0:	e04ff0ef          	jal	80002ab4 <uart_putc>
    800034b4:	fe899ae3          	bne	s3,s0,800034a8 <dump_pagetable+0x38>
    800034b8:	00006517          	auipc	a0,0x6
    800034bc:	4c050513          	add	a0,a0,1216 # 80009978 <digits+0x18>
    800034c0:	e0cff0ef          	jal	80002acc <uart_puts>
    800034c4:	00900793          	li	a5,9
    800034c8:	2737d463          	bge	a5,s3,80003730 <dump_pagetable+0x2c0>
    800034cc:	00a00413          	li	s0,10
    800034d0:	0289c53b          	divw	a0,s3,s0
    800034d4:	0305051b          	addw	a0,a0,48
    800034d8:	0ff57513          	zext.b	a0,a0
    800034dc:	dd8ff0ef          	jal	80002ab4 <uart_putc>
    800034e0:	0289e53b          	remw	a0,s3,s0
    800034e4:	0305051b          	addw	a0,a0,48
    800034e8:	0ff57513          	zext.b	a0,a0
    800034ec:	dc8ff0ef          	jal	80002ab4 <uart_putc>
    800034f0:	00006517          	auipc	a0,0x6
    800034f4:	4a050513          	add	a0,a0,1184 # 80009990 <digits+0x30>
    800034f8:	fff00b13          	li	s6,-1
    800034fc:	dd0ff0ef          	jal	80002acc <uart_puts>
    80003500:	00000493          	li	s1,0
    80003504:	00cb5b13          	srl	s6,s6,0xc
    80003508:	00900a13          	li	s4,9
    8000350c:	ffc00a93          	li	s5,-4
    80003510:	0140006f          	j	80003524 <dump_pagetable+0xb4>
    80003514:	0014849b          	addw	s1,s1,1
    80003518:	20000793          	li	a5,512
    8000351c:	00890913          	add	s2,s2,8
    80003520:	0cf48063          	beq	s1,a5,800035e0 <dump_pagetable+0x170>
    80003524:	00093783          	ld	a5,0(s2)
    80003528:	0017f793          	and	a5,a5,1
    8000352c:	fe0784e3          	beqz	a5,80003514 <dump_pagetable+0xa4>
    80003530:	00000413          	li	s0,0
    80003534:	0009ca63          	bltz	s3,80003548 <dump_pagetable+0xd8>
    80003538:	0014041b          	addw	s0,s0,1
    8000353c:	02000513          	li	a0,32
    80003540:	d74ff0ef          	jal	80002ab4 <uart_putc>
    80003544:	fe89dae3          	bge	s3,s0,80003538 <dump_pagetable+0xc8>
    80003548:	00006517          	auipc	a0,0x6
    8000354c:	45050513          	add	a0,a0,1104 # 80009998 <digits+0x38>
    80003550:	d7cff0ef          	jal	80002acc <uart_puts>
    80003554:	06300793          	li	a5,99
    80003558:	1697d263          	bge	a5,s1,800036bc <dump_pagetable+0x24c>
    8000355c:	06400413          	li	s0,100
    80003560:	0284c53b          	divw	a0,s1,s0
    80003564:	00a00b93          	li	s7,10
    80003568:	0305051b          	addw	a0,a0,48
    8000356c:	0ff57513          	zext.b	a0,a0
    80003570:	d44ff0ef          	jal	80002ab4 <uart_putc>
    80003574:	0284e53b          	remw	a0,s1,s0
    80003578:	0375453b          	divw	a0,a0,s7
    8000357c:	0305051b          	addw	a0,a0,48
    80003580:	0ff57513          	zext.b	a0,a0
    80003584:	d30ff0ef          	jal	80002ab4 <uart_putc>
    80003588:	0374e53b          	remw	a0,s1,s7
    8000358c:	0305051b          	addw	a0,a0,48
    80003590:	0ff57513          	zext.b	a0,a0
    80003594:	d20ff0ef          	jal	80002ab4 <uart_putc>
    80003598:	00006517          	auipc	a0,0x6
    8000359c:	40850513          	add	a0,a0,1032 # 800099a0 <digits+0x40>
    800035a0:	d2cff0ef          	jal	80002acc <uart_puts>
    800035a4:	00093b83          	ld	s7,0(s2)
    800035a8:	00ebf793          	and	a5,s7,14
    800035ac:	06079063          	bnez	a5,8000360c <dump_pagetable+0x19c>
    800035b0:	00006517          	auipc	a0,0x6
    800035b4:	40850513          	add	a0,a0,1032 # 800099b8 <digits+0x58>
    800035b8:	d14ff0ef          	jal	80002acc <uart_puts>
    800035bc:	00093503          	ld	a0,0(s2)
    800035c0:	0019859b          	addw	a1,s3,1
    800035c4:	0014849b          	addw	s1,s1,1
    800035c8:	00a55513          	srl	a0,a0,0xa
    800035cc:	00c51513          	sll	a0,a0,0xc
    800035d0:	ea1ff0ef          	jal	80003470 <dump_pagetable>
    800035d4:	20000793          	li	a5,512
    800035d8:	00890913          	add	s2,s2,8
    800035dc:	f4f494e3          	bne	s1,a5,80003524 <dump_pagetable+0xb4>
    800035e0:	04813083          	ld	ra,72(sp)
    800035e4:	04013403          	ld	s0,64(sp)
    800035e8:	03813483          	ld	s1,56(sp)
    800035ec:	03013903          	ld	s2,48(sp)
    800035f0:	02813983          	ld	s3,40(sp)
    800035f4:	02013a03          	ld	s4,32(sp)
    800035f8:	01813a83          	ld	s5,24(sp)
    800035fc:	01013b03          	ld	s6,16(sp)
    80003600:	00813b83          	ld	s7,8(sp)
    80003604:	05010113          	add	sp,sp,80
    80003608:	00008067          	ret
    8000360c:	00006517          	auipc	a0,0x6
    80003610:	39c50513          	add	a0,a0,924 # 800099a8 <digits+0x48>
    80003614:	cb8ff0ef          	jal	80002acc <uart_puts>
    80003618:	00abdb93          	srl	s7,s7,0xa
    8000361c:	016bfbb3          	and	s7,s7,s6
    80003620:	00000713          	li	a4,0
    80003624:	03c00413          	li	s0,60
    80003628:	008bd7b3          	srl	a5,s7,s0
    8000362c:	00f7f793          	and	a5,a5,15
    80003630:	00e7e733          	or	a4,a5,a4
    80003634:	00071e63          	bnez	a4,80003650 <dump_pagetable+0x1e0>
    80003638:	02040c63          	beqz	s0,80003670 <dump_pagetable+0x200>
    8000363c:	ffc4041b          	addw	s0,s0,-4
    80003640:	008bd7b3          	srl	a5,s7,s0
    80003644:	00f7f793          	and	a5,a5,15
    80003648:	00e7e733          	or	a4,a5,a4
    8000364c:	fe0706e3          	beqz	a4,80003638 <dump_pagetable+0x1c8>
    80003650:	ffc4041b          	addw	s0,s0,-4
    80003654:	03778513          	add	a0,a5,55
    80003658:	0ff7f713          	zext.b	a4,a5
    8000365c:	04fa5c63          	bge	s4,a5,800036b4 <dump_pagetable+0x244>
    80003660:	c54ff0ef          	jal	80002ab4 <uart_putc>
    80003664:	01540a63          	beq	s0,s5,80003678 <dump_pagetable+0x208>
    80003668:	00100713          	li	a4,1
    8000366c:	fbdff06f          	j	80003628 <dump_pagetable+0x1b8>
    80003670:	03000513          	li	a0,48
    80003674:	c40ff0ef          	jal	80002ab4 <uart_putc>
    80003678:	00006517          	auipc	a0,0x6
    8000367c:	33850513          	add	a0,a0,824 # 800099b0 <digits+0x50>
    80003680:	c4cff0ef          	jal	80002acc <uart_puts>
    80003684:	00093783          	ld	a5,0(s2)
    80003688:	0027f713          	and	a4,a5,2
    8000368c:	08071463          	bnez	a4,80003714 <dump_pagetable+0x2a4>
    80003690:	0047f713          	and	a4,a5,4
    80003694:	06071863          	bnez	a4,80003704 <dump_pagetable+0x294>
    80003698:	0087f713          	and	a4,a5,8
    8000369c:	04071c63          	bnez	a4,800036f4 <dump_pagetable+0x284>
    800036a0:	0107f793          	and	a5,a5,16
    800036a4:	04079263          	bnez	a5,800036e8 <dump_pagetable+0x278>
    800036a8:	00a00513          	li	a0,10
    800036ac:	c08ff0ef          	jal	80002ab4 <uart_putc>
    800036b0:	e65ff06f          	j	80003514 <dump_pagetable+0xa4>
    800036b4:	03070513          	add	a0,a4,48
    800036b8:	fa9ff06f          	j	80003660 <dump_pagetable+0x1f0>
    800036bc:	089a5263          	bge	s4,s1,80003740 <dump_pagetable+0x2d0>
    800036c0:	00a00413          	li	s0,10
    800036c4:	0284c53b          	divw	a0,s1,s0
    800036c8:	0305051b          	addw	a0,a0,48
    800036cc:	0ff57513          	zext.b	a0,a0
    800036d0:	be4ff0ef          	jal	80002ab4 <uart_putc>
    800036d4:	0284e53b          	remw	a0,s1,s0
    800036d8:	0305051b          	addw	a0,a0,48
    800036dc:	0ff57513          	zext.b	a0,a0
    800036e0:	bd4ff0ef          	jal	80002ab4 <uart_putc>
    800036e4:	eb5ff06f          	j	80003598 <dump_pagetable+0x128>
    800036e8:	05500513          	li	a0,85
    800036ec:	bc8ff0ef          	jal	80002ab4 <uart_putc>
    800036f0:	fb9ff06f          	j	800036a8 <dump_pagetable+0x238>
    800036f4:	05800513          	li	a0,88
    800036f8:	bbcff0ef          	jal	80002ab4 <uart_putc>
    800036fc:	00093783          	ld	a5,0(s2)
    80003700:	fa1ff06f          	j	800036a0 <dump_pagetable+0x230>
    80003704:	05700513          	li	a0,87
    80003708:	bacff0ef          	jal	80002ab4 <uart_putc>
    8000370c:	00093783          	ld	a5,0(s2)
    80003710:	f89ff06f          	j	80003698 <dump_pagetable+0x228>
    80003714:	05200513          	li	a0,82
    80003718:	b9cff0ef          	jal	80002ab4 <uart_putc>
    8000371c:	00093783          	ld	a5,0(s2)
    80003720:	f71ff06f          	j	80003690 <dump_pagetable+0x220>
    80003724:	00006517          	auipc	a0,0x6
    80003728:	25450513          	add	a0,a0,596 # 80009978 <digits+0x18>
    8000372c:	ba0ff0ef          	jal	80002acc <uart_puts>
    80003730:	0309851b          	addw	a0,s3,48
    80003734:	0ff57513          	zext.b	a0,a0
    80003738:	b7cff0ef          	jal	80002ab4 <uart_putc>
    8000373c:	db5ff06f          	j	800034f0 <dump_pagetable+0x80>
    80003740:	0304851b          	addw	a0,s1,48
    80003744:	0ff57513          	zext.b	a0,a0
    80003748:	b6cff0ef          	jal	80002ab4 <uart_putc>
    8000374c:	e4dff06f          	j	80003598 <dump_pagetable+0x128>

0000000080003750 <init_page_replacement>:
    80003750:	00100713          	li	a4,1
    80003754:	02a71713          	sll	a4,a4,0x2a
    80003758:	0000e797          	auipc	a5,0xe
    8000375c:	a2078793          	add	a5,a5,-1504 # 80011178 <swap_mgr>
    80003760:	08e7b023          	sd	a4,128(a5)
    80003764:	0000e717          	auipc	a4,0xe
    80003768:	a8072e23          	sw	zero,-1380(a4) # 80011200 <swap_mgr+0x88>
    8000376c:	0000e717          	auipc	a4,0xe
    80003770:	a8c70713          	add	a4,a4,-1396 # 800111f8 <swap_mgr+0x80>
    80003774:	0007a023          	sw	zero,0(a5)
    80003778:	00478793          	add	a5,a5,4
    8000377c:	fee79ce3          	bne	a5,a4,80003774 <init_page_replacement+0x24>
    80003780:	0040e797          	auipc	a5,0x40e
    80003784:	a807b423          	sd	zero,-1400(a5) # 80411208 <lru_mgr>
    80003788:	0040e797          	auipc	a5,0x40e
    8000378c:	a807b423          	sd	zero,-1400(a5) # 80411210 <lru_mgr+0x8>
    80003790:	00100793          	li	a5,1
    80003794:	02879793          	sll	a5,a5,0x28
    80003798:	00411717          	auipc	a4,0x411
    8000379c:	a8f73023          	sd	a5,-1408(a4) # 80414218 <lru_mgr+0x3010>
    800037a0:	fff00713          	li	a4,-1
    800037a4:	0040e797          	auipc	a5,0x40e
    800037a8:	a7478793          	add	a5,a5,-1420 # 80411218 <lru_mgr+0x10>
    800037ac:	00411697          	auipc	a3,0x411
    800037b0:	a6c68693          	add	a3,a3,-1428 # 80414218 <lru_mgr+0x3010>
    800037b4:	02075713          	srl	a4,a4,0x20
    800037b8:	0007b023          	sd	zero,0(a5)
    800037bc:	0007b423          	sd	zero,8(a5)
    800037c0:	00e7b823          	sd	a4,16(a5)
    800037c4:	0007bc23          	sd	zero,24(a5)
    800037c8:	0207b023          	sd	zero,32(a5)
    800037cc:	0207b423          	sd	zero,40(a5)
    800037d0:	03078793          	add	a5,a5,48
    800037d4:	fed792e3          	bne	a5,a3,800037b8 <init_page_replacement+0x68>
    800037d8:	00008067          	ret

00000000800037dc <kvminit>:
    800037dc:	fd010113          	add	sp,sp,-48
    800037e0:	02113423          	sd	ra,40(sp)
    800037e4:	02813023          	sd	s0,32(sp)
    800037e8:	00913c23          	sd	s1,24(sp)
    800037ec:	01213823          	sd	s2,16(sp)
    800037f0:	01313423          	sd	s3,8(sp)
    800037f4:	01413023          	sd	s4,0(sp)
    800037f8:	f59ff0ef          	jal	80003750 <init_page_replacement>
    800037fc:	b7cff0ef          	jal	80002b78 <alloc_page>
    80003800:	00001737          	lui	a4,0x1
    80003804:	00e50733          	add	a4,a0,a4
    80003808:	00050413          	mv	s0,a0
    8000380c:	00050793          	mv	a5,a0
    80003810:	1a050663          	beqz	a0,800039bc <kvminit+0x1e0>
    80003814:	0007b023          	sd	zero,0(a5)
    80003818:	00878793          	add	a5,a5,8
    8000381c:	fef71ce3          	bne	a4,a5,80003814 <kvminit+0x38>
    80003820:	00423917          	auipc	s2,0x423
    80003824:	ba890913          	add	s2,s2,-1112 # 804263c8 <kernel_pagetable>
    80003828:	00004997          	auipc	s3,0x4
    8000382c:	57b98993          	add	s3,s3,1403 # 80007da3 <rodata_start+0xda3>
    80003830:	fffff7b7          	lui	a5,0xfffff
    80003834:	00893023          	sd	s0,0(s2)
    80003838:	ffffc497          	auipc	s1,0xffffc
    8000383c:	7c848493          	add	s1,s1,1992 # 80000000 <_entry>
    80003840:	00f9f9b3          	and	s3,s3,a5
    80003844:	0334f863          	bgeu	s1,s3,80003874 <kvminit+0x98>
    80003848:	00001a37          	lui	s4,0x1
    8000384c:	0080006f          	j	80003854 <kvminit+0x78>
    80003850:	0334f063          	bgeu	s1,s3,80003870 <kvminit+0x94>
    80003854:	00048613          	mv	a2,s1
    80003858:	00048593          	mv	a1,s1
    8000385c:	00a00693          	li	a3,10
    80003860:	00040513          	mv	a0,s0
    80003864:	dbcff0ef          	jal	80002e20 <map_page>
    80003868:	014484b3          	add	s1,s1,s4
    8000386c:	fe0502e3          	beqz	a0,80003850 <kvminit+0x74>
    80003870:	00093403          	ld	s0,0(s2)
    80003874:	00008997          	auipc	s3,0x8
    80003878:	e6b98993          	add	s3,s3,-405 # 8000b6df <data_end+0x6db>
    8000387c:	fffff7b7          	lui	a5,0xfffff
    80003880:	00003497          	auipc	s1,0x3
    80003884:	78048493          	add	s1,s1,1920 # 80007000 <rodata_start>
    80003888:	00f9f9b3          	and	s3,s3,a5
    8000388c:	0334f863          	bgeu	s1,s3,800038bc <kvminit+0xe0>
    80003890:	00001a37          	lui	s4,0x1
    80003894:	0080006f          	j	8000389c <kvminit+0xc0>
    80003898:	0334f063          	bgeu	s1,s3,800038b8 <kvminit+0xdc>
    8000389c:	00048613          	mv	a2,s1
    800038a0:	00048593          	mv	a1,s1
    800038a4:	00200693          	li	a3,2
    800038a8:	00040513          	mv	a0,s0
    800038ac:	d74ff0ef          	jal	80002e20 <map_page>
    800038b0:	014484b3          	add	s1,s1,s4
    800038b4:	fe0502e3          	beqz	a0,80003898 <kvminit+0xbc>
    800038b8:	00093403          	ld	s0,0(s2)
    800038bc:	00008997          	auipc	s3,0x8
    800038c0:	74798993          	add	s3,s3,1863 # 8000c003 <data_end+0xfff>
    800038c4:	fffff7b7          	lui	a5,0xfffff
    800038c8:	00007497          	auipc	s1,0x7
    800038cc:	73848493          	add	s1,s1,1848 # 8000b000 <nextpid>
    800038d0:	00f9f9b3          	and	s3,s3,a5
    800038d4:	0334f863          	bgeu	s1,s3,80003904 <kvminit+0x128>
    800038d8:	00001a37          	lui	s4,0x1
    800038dc:	0080006f          	j	800038e4 <kvminit+0x108>
    800038e0:	0334f063          	bgeu	s1,s3,80003900 <kvminit+0x124>
    800038e4:	00048613          	mv	a2,s1
    800038e8:	00048593          	mv	a1,s1
    800038ec:	00600693          	li	a3,6
    800038f0:	00040513          	mv	a0,s0
    800038f4:	d2cff0ef          	jal	80002e20 <map_page>
    800038f8:	014484b3          	add	s1,s1,s4
    800038fc:	fe0502e3          	beqz	a0,800038e0 <kvminit+0x104>
    80003900:	00093403          	ld	s0,0(s2)
    80003904:	00424997          	auipc	s3,0x424
    80003908:	af398993          	add	s3,s3,-1293 # 804273f7 <bss_end+0xfff>
    8000390c:	fffff7b7          	lui	a5,0xfffff
    80003910:	0000c497          	auipc	s1,0xc
    80003914:	6f048493          	add	s1,s1,1776 # 80010000 <bss_start>
    80003918:	00f9f9b3          	and	s3,s3,a5
    8000391c:	0334f863          	bgeu	s1,s3,8000394c <kvminit+0x170>
    80003920:	00001a37          	lui	s4,0x1
    80003924:	0080006f          	j	8000392c <kvminit+0x150>
    80003928:	0334f063          	bgeu	s1,s3,80003948 <kvminit+0x16c>
    8000392c:	00048613          	mv	a2,s1
    80003930:	00048593          	mv	a1,s1
    80003934:	00600693          	li	a3,6
    80003938:	00040513          	mv	a0,s0
    8000393c:	ce4ff0ef          	jal	80002e20 <map_page>
    80003940:	014484b3          	add	s1,s1,s4
    80003944:	fe0502e3          	beqz	a0,80003928 <kvminit+0x14c>
    80003948:	00093403          	ld	s0,0(s2)
    8000394c:	01100993          	li	s3,17
    80003950:	00423497          	auipc	s1,0x423
    80003954:	aa848493          	add	s1,s1,-1368 # 804263f8 <bss_end>
    80003958:	01b99993          	sll	s3,s3,0x1b
    8000395c:	0334f863          	bgeu	s1,s3,8000398c <kvminit+0x1b0>
    80003960:	00001a37          	lui	s4,0x1
    80003964:	0080006f          	j	8000396c <kvminit+0x190>
    80003968:	0334f063          	bgeu	s1,s3,80003988 <kvminit+0x1ac>
    8000396c:	00048613          	mv	a2,s1
    80003970:	00048593          	mv	a1,s1
    80003974:	00600693          	li	a3,6
    80003978:	00040513          	mv	a0,s0
    8000397c:	ca4ff0ef          	jal	80002e20 <map_page>
    80003980:	014484b3          	add	s1,s1,s4
    80003984:	fe0502e3          	beqz	a0,80003968 <kvminit+0x18c>
    80003988:	00093403          	ld	s0,0(s2)
    8000398c:	00040513          	mv	a0,s0
    80003990:	02013403          	ld	s0,32(sp)
    80003994:	02813083          	ld	ra,40(sp)
    80003998:	01813483          	ld	s1,24(sp)
    8000399c:	01013903          	ld	s2,16(sp)
    800039a0:	00813983          	ld	s3,8(sp)
    800039a4:	00013a03          	ld	s4,0(sp)
    800039a8:	00600693          	li	a3,6
    800039ac:	10000637          	lui	a2,0x10000
    800039b0:	100005b7          	lui	a1,0x10000
    800039b4:	03010113          	add	sp,sp,48
    800039b8:	c68ff06f          	j	80002e20 <map_page>
    800039bc:	02813083          	ld	ra,40(sp)
    800039c0:	02013403          	ld	s0,32(sp)
    800039c4:	00423797          	auipc	a5,0x423
    800039c8:	a007b223          	sd	zero,-1532(a5) # 804263c8 <kernel_pagetable>
    800039cc:	01813483          	ld	s1,24(sp)
    800039d0:	01013903          	ld	s2,16(sp)
    800039d4:	00813983          	ld	s3,8(sp)
    800039d8:	00013a03          	ld	s4,0(sp)
    800039dc:	03010113          	add	sp,sp,48
    800039e0:	00008067          	ret

00000000800039e4 <alloc_swap_slot>:
    800039e4:	0000d617          	auipc	a2,0xd
    800039e8:	79460613          	add	a2,a2,1940 # 80011178 <swap_mgr>
    800039ec:	08862803          	lw	a6,136(a2)
    800039f0:	08462883          	lw	a7,132(a2)
    800039f4:	fff00513          	li	a0,-1
    800039f8:	0d187663          	bgeu	a6,a7,80003ac4 <alloc_swap_slot+0xe0>
    800039fc:	08062303          	lw	t1,128(a2)
    80003a00:	07137863          	bgeu	t1,a7,80003a70 <alloc_swap_slot+0x8c>
    80003a04:	0053579b          	srlw	a5,t1,0x5
    80003a08:	00279793          	sll	a5,a5,0x2
    80003a0c:	00f607b3          	add	a5,a2,a5
    80003a10:	0007a683          	lw	a3,0(a5)
    80003a14:	00100593          	li	a1,1
    80003a18:	006595bb          	sllw	a1,a1,t1
    80003a1c:	00b6f7b3          	and	a5,a3,a1
    80003a20:	0007879b          	sext.w	a5,a5
    80003a24:	0053571b          	srlw	a4,t1,0x5
    80003a28:	00030513          	mv	a0,t1
    80003a2c:	08078e63          	beqz	a5,80003ac8 <alloc_swap_slot+0xe4>
    80003a30:	00100e13          	li	t3,1
    80003a34:	01c0006f          	j	80003a50 <alloc_swap_slot+0x6c>
    80003a38:	0006a683          	lw	a3,0(a3)
    80003a3c:	0007859b          	sext.w	a1,a5
    80003a40:	0057571b          	srlw	a4,a4,0x5
    80003a44:	00f6f7b3          	and	a5,a3,a5
    80003a48:	0007879b          	sext.w	a5,a5
    80003a4c:	06078e63          	beqz	a5,80003ac8 <alloc_swap_slot+0xe4>
    80003a50:	0015071b          	addw	a4,a0,1
    80003a54:	0057579b          	srlw	a5,a4,0x5
    80003a58:	00279793          	sll	a5,a5,0x2
    80003a5c:	0007051b          	sext.w	a0,a4
    80003a60:	00f606b3          	add	a3,a2,a5
    80003a64:	00ee17bb          	sllw	a5,t3,a4
    80003a68:	fca898e3          	bne	a7,a0,80003a38 <alloc_swap_slot+0x54>
    80003a6c:	04030a63          	beqz	t1,80003ac0 <alloc_swap_slot+0xdc>
    80003a70:	00062683          	lw	a3,0(a2)
    80003a74:	0016f513          	and	a0,a3,1
    80003a78:	0a050063          	beqz	a0,80003b18 <alloc_swap_slot+0x134>
    80003a7c:	00000513          	li	a0,0
    80003a80:	00100e13          	li	t3,1
    80003a84:	01c0006f          	j	80003aa0 <alloc_swap_slot+0xbc>
    80003a88:	0006a683          	lw	a3,0(a3)
    80003a8c:	00078e9b          	sext.w	t4,a5
    80003a90:	0057571b          	srlw	a4,a4,0x5
    80003a94:	00f6f7b3          	and	a5,a3,a5
    80003a98:	0007879b          	sext.w	a5,a5
    80003a9c:	04078a63          	beqz	a5,80003af0 <alloc_swap_slot+0x10c>
    80003aa0:	0015071b          	addw	a4,a0,1
    80003aa4:	0057579b          	srlw	a5,a4,0x5
    80003aa8:	00279793          	sll	a5,a5,0x2
    80003aac:	0005059b          	sext.w	a1,a0
    80003ab0:	0007051b          	sext.w	a0,a4
    80003ab4:	00f606b3          	add	a3,a2,a5
    80003ab8:	00ee17bb          	sllw	a5,t3,a4
    80003abc:	fca316e3          	bne	t1,a0,80003a88 <alloc_swap_slot+0xa4>
    80003ac0:	fff00513          	li	a0,-1
    80003ac4:	00008067          	ret
    80003ac8:	0015079b          	addw	a5,a0,1
    80003acc:	0317f7bb          	remuw	a5,a5,a7
    80003ad0:	00271713          	sll	a4,a4,0x2
    80003ad4:	00e60733          	add	a4,a2,a4
    80003ad8:	00b6e6b3          	or	a3,a3,a1
    80003adc:	0018081b          	addw	a6,a6,1
    80003ae0:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    80003ae4:	09062423          	sw	a6,136(a2)
    80003ae8:	08f62023          	sw	a5,128(a2)
    80003aec:	00008067          	ret
    80003af0:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    80003af4:	0315f5bb          	remuw	a1,a1,a7
    80003af8:	00271713          	sll	a4,a4,0x2
    80003afc:	00e60733          	add	a4,a2,a4
    80003b00:	01d6e6b3          	or	a3,a3,t4
    80003b04:	0018081b          	addw	a6,a6,1
    80003b08:	00d72023          	sw	a3,0(a4)
    80003b0c:	09062423          	sw	a6,136(a2)
    80003b10:	08b62023          	sw	a1,128(a2)
    80003b14:	00008067          	ret
    80003b18:	00000713          	li	a4,0
    80003b1c:	00100593          	li	a1,1
    80003b20:	00100e93          	li	t4,1
    80003b24:	fd1ff06f          	j	80003af4 <alloc_swap_slot+0x110>

0000000080003b28 <free_swap_slot>:
    80003b28:	0000d717          	auipc	a4,0xd
    80003b2c:	65070713          	add	a4,a4,1616 # 80011178 <swap_mgr>
    80003b30:	08472783          	lw	a5,132(a4)
    80003b34:	04f57663          	bgeu	a0,a5,80003b80 <free_swap_slot+0x58>
    80003b38:	0055579b          	srlw	a5,a0,0x5
    80003b3c:	00279793          	sll	a5,a5,0x2
    80003b40:	00f707b3          	add	a5,a4,a5
    80003b44:	0007a583          	lw	a1,0(a5)
    80003b48:	00100693          	li	a3,1
    80003b4c:	00a696bb          	sllw	a3,a3,a0
    80003b50:	00d5f633          	and	a2,a1,a3
    80003b54:	0006061b          	sext.w	a2,a2
    80003b58:	02060463          	beqz	a2,80003b80 <free_swap_slot+0x58>
    80003b5c:	08872603          	lw	a2,136(a4)
    80003b60:	fff6c693          	not	a3,a3
    80003b64:	08072803          	lw	a6,128(a4)
    80003b68:	00d5f5b3          	and	a1,a1,a3
    80003b6c:	fff6069b          	addw	a3,a2,-1
    80003b70:	00b7a023          	sw	a1,0(a5)
    80003b74:	08d72423          	sw	a3,136(a4)
    80003b78:	01057463          	bgeu	a0,a6,80003b80 <free_swap_slot+0x58>
    80003b7c:	08a72023          	sw	a0,128(a4)
    80003b80:	00008067          	ret

0000000080003b84 <find_page_desc>:
    80003b84:	fffff7b7          	lui	a5,0xfffff
    80003b88:	00f57533          	and	a0,a0,a5
    80003b8c:	00000713          	li	a4,0
    80003b90:	0040d797          	auipc	a5,0x40d
    80003b94:	68878793          	add	a5,a5,1672 # 80411218 <lru_mgr+0x10>
    80003b98:	10000613          	li	a2,256
    80003b9c:	0100006f          	j	80003bac <find_page_desc+0x28>
    80003ba0:	0017071b          	addw	a4,a4,1
    80003ba4:	03078793          	add	a5,a5,48
    80003ba8:	02c70a63          	beq	a4,a2,80003bdc <find_page_desc+0x58>
    80003bac:	0007b683          	ld	a3,0(a5)
    80003bb0:	fea698e3          	bne	a3,a0,80003ba0 <find_page_desc+0x1c>
    80003bb4:	0147a683          	lw	a3,20(a5)
    80003bb8:	0016f693          	and	a3,a3,1
    80003bbc:	fe0682e3          	beqz	a3,80003ba0 <find_page_desc+0x1c>
    80003bc0:	00171513          	sll	a0,a4,0x1
    80003bc4:	00e50533          	add	a0,a0,a4
    80003bc8:	0040d797          	auipc	a5,0x40d
    80003bcc:	65078793          	add	a5,a5,1616 # 80411218 <lru_mgr+0x10>
    80003bd0:	00451513          	sll	a0,a0,0x4
    80003bd4:	00f50533          	add	a0,a0,a5
    80003bd8:	00008067          	ret
    80003bdc:	00000513          	li	a0,0
    80003be0:	00008067          	ret

0000000080003be4 <lru_add_page>:
    80003be4:	02050c63          	beqz	a0,80003c1c <lru_add_page+0x38>
    80003be8:	0040d717          	auipc	a4,0x40d
    80003bec:	62070713          	add	a4,a4,1568 # 80411208 <lru_mgr>
    80003bf0:	00073783          	ld	a5,0(a4)
    80003bf4:	00053c23          	sd	zero,24(a0)
    80003bf8:	02f53023          	sd	a5,32(a0)
    80003bfc:	02078263          	beqz	a5,80003c20 <lru_add_page+0x3c>
    80003c00:	00a7bc23          	sd	a0,24(a5)
    80003c04:	00410697          	auipc	a3,0x410
    80003c08:	60468693          	add	a3,a3,1540 # 80414208 <lru_mgr+0x3000>
    80003c0c:	0106a783          	lw	a5,16(a3)
    80003c10:	00a73023          	sd	a0,0(a4)
    80003c14:	0017879b          	addw	a5,a5,1
    80003c18:	00f6a823          	sw	a5,16(a3)
    80003c1c:	00008067          	ret
    80003c20:	00a73423          	sd	a0,8(a4)
    80003c24:	fe1ff06f          	j	80003c04 <lru_add_page+0x20>

0000000080003c28 <lru_remove_page>:
    80003c28:	02050c63          	beqz	a0,80003c60 <lru_remove_page+0x38>
    80003c2c:	01853783          	ld	a5,24(a0)
    80003c30:	02053703          	ld	a4,32(a0)
    80003c34:	02078863          	beqz	a5,80003c64 <lru_remove_page+0x3c>
    80003c38:	02e7b023          	sd	a4,32(a5)
    80003c3c:	02070a63          	beqz	a4,80003c70 <lru_remove_page+0x48>
    80003c40:	00f73c23          	sd	a5,24(a4)
    80003c44:	00410717          	auipc	a4,0x410
    80003c48:	5c470713          	add	a4,a4,1476 # 80414208 <lru_mgr+0x3000>
    80003c4c:	01072783          	lw	a5,16(a4)
    80003c50:	02053023          	sd	zero,32(a0)
    80003c54:	00053c23          	sd	zero,24(a0)
    80003c58:	fff7879b          	addw	a5,a5,-1
    80003c5c:	00f72823          	sw	a5,16(a4)
    80003c60:	00008067          	ret
    80003c64:	0040d697          	auipc	a3,0x40d
    80003c68:	5ae6b223          	sd	a4,1444(a3) # 80411208 <lru_mgr>
    80003c6c:	fc071ae3          	bnez	a4,80003c40 <lru_remove_page+0x18>
    80003c70:	0040d717          	auipc	a4,0x40d
    80003c74:	5af73023          	sd	a5,1440(a4) # 80411210 <lru_mgr+0x8>
    80003c78:	fcdff06f          	j	80003c44 <lru_remove_page+0x1c>

0000000080003c7c <lru_touch_page>:
    80003c7c:	fffff7b7          	lui	a5,0xfffff
    80003c80:	00f57533          	and	a0,a0,a5
    80003c84:	00000713          	li	a4,0
    80003c88:	0040d797          	auipc	a5,0x40d
    80003c8c:	59078793          	add	a5,a5,1424 # 80411218 <lru_mgr+0x10>
    80003c90:	10000613          	li	a2,256
    80003c94:	0100006f          	j	80003ca4 <lru_touch_page+0x28>
    80003c98:	0017071b          	addw	a4,a4,1
    80003c9c:	03078793          	add	a5,a5,48
    80003ca0:	0ac70663          	beq	a4,a2,80003d4c <lru_touch_page+0xd0>
    80003ca4:	0007b683          	ld	a3,0(a5)
    80003ca8:	fea698e3          	bne	a3,a0,80003c98 <lru_touch_page+0x1c>
    80003cac:	0147a683          	lw	a3,20(a5)
    80003cb0:	0016f693          	and	a3,a3,1
    80003cb4:	fe0682e3          	beqz	a3,80003c98 <lru_touch_page+0x1c>
    80003cb8:	00171613          	sll	a2,a4,0x1
    80003cbc:	00e607b3          	add	a5,a2,a4
    80003cc0:	0040d597          	auipc	a1,0x40d
    80003cc4:	54858593          	add	a1,a1,1352 # 80411208 <lru_mgr>
    80003cc8:	00479793          	sll	a5,a5,0x4
    80003ccc:	00170513          	add	a0,a4,1
    80003cd0:	00f58833          	add	a6,a1,a5
    80003cd4:	00151693          	sll	a3,a0,0x1
    80003cd8:	00a686b3          	add	a3,a3,a0
    80003cdc:	02883803          	ld	a6,40(a6)
    80003ce0:	00469693          	sll	a3,a3,0x4
    80003ce4:	01078793          	add	a5,a5,16
    80003ce8:	00d586b3          	add	a3,a1,a3
    80003cec:	0006b683          	ld	a3,0(a3)
    80003cf0:	00f587b3          	add	a5,a1,a5
    80003cf4:	04080e63          	beqz	a6,80003d50 <lru_touch_page+0xd4>
    80003cf8:	02d83023          	sd	a3,32(a6)
    80003cfc:	0005b883          	ld	a7,0(a1)
    80003d00:	04068c63          	beqz	a3,80003d58 <lru_touch_page+0xdc>
    80003d04:	0106bc23          	sd	a6,24(a3)
    80003d08:	00151693          	sll	a3,a0,0x1
    80003d0c:	00e60733          	add	a4,a2,a4
    80003d10:	00a686b3          	add	a3,a3,a0
    80003d14:	00469693          	sll	a3,a3,0x4
    80003d18:	00471713          	sll	a4,a4,0x4
    80003d1c:	00e58733          	add	a4,a1,a4
    80003d20:	00d586b3          	add	a3,a1,a3
    80003d24:	00410617          	auipc	a2,0x410
    80003d28:	4e460613          	add	a2,a2,1252 # 80414208 <lru_mgr+0x3000>
    80003d2c:	02073423          	sd	zero,40(a4)
    80003d30:	0116b023          	sd	a7,0(a3)
    80003d34:	01062703          	lw	a4,16(a2)
    80003d38:	02088463          	beqz	a7,80003d60 <lru_touch_page+0xe4>
    80003d3c:	00f8bc23          	sd	a5,24(a7)
    80003d40:	00f5b023          	sd	a5,0(a1)
    80003d44:	00e62823          	sw	a4,16(a2)
    80003d48:	00008067          	ret
    80003d4c:	00008067          	ret
    80003d50:	00068893          	mv	a7,a3
    80003d54:	fa0698e3          	bnez	a3,80003d04 <lru_touch_page+0x88>
    80003d58:	0105b423          	sd	a6,8(a1)
    80003d5c:	fadff06f          	j	80003d08 <lru_touch_page+0x8c>
    80003d60:	00f5b423          	sd	a5,8(a1)
    80003d64:	00f5b023          	sd	a5,0(a1)
    80003d68:	00e62823          	sw	a4,16(a2)
    80003d6c:	00008067          	ret

0000000080003d70 <find_victim_page>:
    80003d70:	0040d517          	auipc	a0,0x40d
    80003d74:	4a053503          	ld	a0,1184(a0) # 80411210 <lru_mgr+0x8>
    80003d78:	00008067          	ret

0000000080003d7c <swap_out_page>:
    80003d7c:	16050263          	beqz	a0,80003ee0 <swap_out_page+0x164>
    80003d80:	fd010113          	add	sp,sp,-48
    80003d84:	00913c23          	sd	s1,24(sp)
    80003d88:	01452483          	lw	s1,20(a0)
    80003d8c:	02813023          	sd	s0,32(sp)
    80003d90:	01313423          	sd	s3,8(sp)
    80003d94:	02113423          	sd	ra,40(sp)
    80003d98:	01213823          	sd	s2,16(sp)
    80003d9c:	0014f793          	and	a5,s1,1
    80003da0:	00050413          	mv	s0,a0
    80003da4:	00048993          	mv	s3,s1
    80003da8:	12078863          	beqz	a5,80003ed8 <swap_out_page+0x15c>
    80003dac:	c39ff0ef          	jal	800039e4 <alloc_swap_slot>
    80003db0:	0005091b          	sext.w	s2,a0
    80003db4:	fff00793          	li	a5,-1
    80003db8:	12f90063          	beq	s2,a5,80003ed8 <swap_out_page+0x15c>
    80003dbc:	0049f993          	and	s3,s3,4
    80003dc0:	04098663          	beqz	s3,80003e0c <swap_out_page+0x90>
    80003dc4:	00843683          	ld	a3,8(s0)
    80003dc8:	00c9171b          	sllw	a4,s2,0xc
    80003dcc:	0000d797          	auipc	a5,0xd
    80003dd0:	43c78793          	add	a5,a5,1084 # 80011208 <swap_area>
    80003dd4:	02071713          	sll	a4,a4,0x20
    80003dd8:	02075713          	srl	a4,a4,0x20
    80003ddc:	40f686b3          	sub	a3,a3,a5
    80003de0:	0000e617          	auipc	a2,0xe
    80003de4:	42860613          	add	a2,a2,1064 # 80012208 <swap_area+0x1000>
    80003de8:	00f707b3          	add	a5,a4,a5
    80003dec:	00e60633          	add	a2,a2,a4
    80003df0:	40e686b3          	sub	a3,a3,a4
    80003df4:	00f68733          	add	a4,a3,a5
    80003df8:	00074703          	lbu	a4,0(a4)
    80003dfc:	00178793          	add	a5,a5,1
    80003e00:	fee78fa3          	sb	a4,-1(a5)
    80003e04:	fec798e3          	bne	a5,a2,80003df4 <swap_out_page+0x78>
    80003e08:	01442483          	lw	s1,20(s0)
    80003e0c:	00043583          	ld	a1,0(s0)
    80003e10:	02843503          	ld	a0,40(s0)
    80003e14:	e69fe0ef          	jal	80002c7c <walk_lookup>
    80003e18:	00050863          	beqz	a0,80003e28 <swap_out_page+0xac>
    80003e1c:	00053783          	ld	a5,0(a0)
    80003e20:	0017f713          	and	a4,a5,1
    80003e24:	08071063          	bnez	a4,80003ea4 <swap_out_page+0x128>
    80003e28:	ffe4f793          	and	a5,s1,-2
    80003e2c:	0027e793          	or	a5,a5,2
    80003e30:	02091913          	sll	s2,s2,0x20
    80003e34:	02079793          	sll	a5,a5,0x20
    80003e38:	00843503          	ld	a0,8(s0)
    80003e3c:	02095913          	srl	s2,s2,0x20
    80003e40:	00f96933          	or	s2,s2,a5
    80003e44:	01243823          	sd	s2,16(s0)
    80003e48:	d4dfe0ef          	jal	80002b94 <free_page>
    80003e4c:	01843783          	ld	a5,24(s0)
    80003e50:	00043423          	sd	zero,8(s0)
    80003e54:	02043703          	ld	a4,32(s0)
    80003e58:	06078463          	beqz	a5,80003ec0 <swap_out_page+0x144>
    80003e5c:	02e7b023          	sd	a4,32(a5)
    80003e60:	06070663          	beqz	a4,80003ecc <swap_out_page+0x150>
    80003e64:	00f73c23          	sd	a5,24(a4)
    80003e68:	00410717          	auipc	a4,0x410
    80003e6c:	3a070713          	add	a4,a4,928 # 80414208 <lru_mgr+0x3000>
    80003e70:	01072783          	lw	a5,16(a4)
    80003e74:	02043023          	sd	zero,32(s0)
    80003e78:	00043c23          	sd	zero,24(s0)
    80003e7c:	fff7879b          	addw	a5,a5,-1
    80003e80:	00f72823          	sw	a5,16(a4)
    80003e84:	00000513          	li	a0,0
    80003e88:	02813083          	ld	ra,40(sp)
    80003e8c:	02013403          	ld	s0,32(sp)
    80003e90:	01813483          	ld	s1,24(sp)
    80003e94:	01013903          	ld	s2,16(sp)
    80003e98:	00813983          	ld	s3,8(sp)
    80003e9c:	03010113          	add	sp,sp,48
    80003ea0:	00008067          	ret
    80003ea4:	00a9171b          	sllw	a4,s2,0xa
    80003ea8:	02071713          	sll	a4,a4,0x20
    80003eac:	ffe7f793          	and	a5,a5,-2
    80003eb0:	02075713          	srl	a4,a4,0x20
    80003eb4:	00e7e7b3          	or	a5,a5,a4
    80003eb8:	00f53023          	sd	a5,0(a0)
    80003ebc:	f6dff06f          	j	80003e28 <swap_out_page+0xac>
    80003ec0:	0040d697          	auipc	a3,0x40d
    80003ec4:	34e6b423          	sd	a4,840(a3) # 80411208 <lru_mgr>
    80003ec8:	f8071ee3          	bnez	a4,80003e64 <swap_out_page+0xe8>
    80003ecc:	0040d717          	auipc	a4,0x40d
    80003ed0:	34f73223          	sd	a5,836(a4) # 80411210 <lru_mgr+0x8>
    80003ed4:	f95ff06f          	j	80003e68 <swap_out_page+0xec>
    80003ed8:	fff00513          	li	a0,-1
    80003edc:	fadff06f          	j	80003e88 <swap_out_page+0x10c>
    80003ee0:	fff00513          	li	a0,-1
    80003ee4:	00008067          	ret

0000000080003ee8 <swap_in_page>:
    80003ee8:	12050263          	beqz	a0,8000400c <swap_in_page+0x124>
    80003eec:	01452783          	lw	a5,20(a0)
    80003ef0:	fe010113          	add	sp,sp,-32
    80003ef4:	00813823          	sd	s0,16(sp)
    80003ef8:	00113c23          	sd	ra,24(sp)
    80003efc:	00913423          	sd	s1,8(sp)
    80003f00:	0027f793          	and	a5,a5,2
    80003f04:	00050413          	mv	s0,a0
    80003f08:	0e078e63          	beqz	a5,80004004 <swap_in_page+0x11c>
    80003f0c:	01052703          	lw	a4,16(a0)
    80003f10:	0000d797          	auipc	a5,0xd
    80003f14:	2f878793          	add	a5,a5,760 # 80011208 <swap_area>
    80003f18:	40f58633          	sub	a2,a1,a5
    80003f1c:	00c7171b          	sllw	a4,a4,0xc
    80003f20:	02071713          	sll	a4,a4,0x20
    80003f24:	02075713          	srl	a4,a4,0x20
    80003f28:	0000e817          	auipc	a6,0xe
    80003f2c:	2e080813          	add	a6,a6,736 # 80012208 <swap_area+0x1000>
    80003f30:	00058493          	mv	s1,a1
    80003f34:	00f707b3          	add	a5,a4,a5
    80003f38:	00e80833          	add	a6,a6,a4
    80003f3c:	40e60633          	sub	a2,a2,a4
    80003f40:	0007c683          	lbu	a3,0(a5)
    80003f44:	00f60733          	add	a4,a2,a5
    80003f48:	00178793          	add	a5,a5,1
    80003f4c:	00d70023          	sb	a3,0(a4)
    80003f50:	ff0798e3          	bne	a5,a6,80003f40 <swap_in_page+0x58>
    80003f54:	00043583          	ld	a1,0(s0)
    80003f58:	02843503          	ld	a0,40(s0)
    80003f5c:	d21fe0ef          	jal	80002c7c <walk_lookup>
    80003f60:	02050063          	beqz	a0,80003f80 <swap_in_page+0x98>
    80003f64:	00053703          	ld	a4,0(a0)
    80003f68:	00c4d793          	srl	a5,s1,0xc
    80003f6c:	00a79793          	sll	a5,a5,0xa
    80003f70:	01e77713          	and	a4,a4,30
    80003f74:	00e7e7b3          	or	a5,a5,a4
    80003f78:	0017e793          	or	a5,a5,1
    80003f7c:	00f53023          	sd	a5,0(a0)
    80003f80:	01442783          	lw	a5,20(s0)
    80003f84:	01042503          	lw	a0,16(s0)
    80003f88:	00943423          	sd	s1,8(s0)
    80003f8c:	ffd7f793          	and	a5,a5,-3
    80003f90:	0017e793          	or	a5,a5,1
    80003f94:	00f42a23          	sw	a5,20(s0)
    80003f98:	0000d797          	auipc	a5,0xd
    80003f9c:	2647a783          	lw	a5,612(a5) # 800111fc <swap_mgr+0x84>
    80003fa0:	00f57463          	bgeu	a0,a5,80003fa8 <swap_in_page+0xc0>
    80003fa4:	d4dfe0ef          	jal	80002cf0 <free_swap_slot.part.0>
    80003fa8:	0040d717          	auipc	a4,0x40d
    80003fac:	26070713          	add	a4,a4,608 # 80411208 <lru_mgr>
    80003fb0:	00073783          	ld	a5,0(a4)
    80003fb4:	fff00693          	li	a3,-1
    80003fb8:	00d42823          	sw	a3,16(s0)
    80003fbc:	02f43023          	sd	a5,32(s0)
    80003fc0:	00043c23          	sd	zero,24(s0)
    80003fc4:	02078c63          	beqz	a5,80003ffc <swap_in_page+0x114>
    80003fc8:	0087bc23          	sd	s0,24(a5)
    80003fcc:	00410697          	auipc	a3,0x410
    80003fd0:	23c68693          	add	a3,a3,572 # 80414208 <lru_mgr+0x3000>
    80003fd4:	0106a783          	lw	a5,16(a3)
    80003fd8:	00873023          	sd	s0,0(a4)
    80003fdc:	00000513          	li	a0,0
    80003fe0:	0017879b          	addw	a5,a5,1
    80003fe4:	00f6a823          	sw	a5,16(a3)
    80003fe8:	01813083          	ld	ra,24(sp)
    80003fec:	01013403          	ld	s0,16(sp)
    80003ff0:	00813483          	ld	s1,8(sp)
    80003ff4:	02010113          	add	sp,sp,32
    80003ff8:	00008067          	ret
    80003ffc:	00873423          	sd	s0,8(a4)
    80004000:	fcdff06f          	j	80003fcc <swap_in_page+0xe4>
    80004004:	fff00513          	li	a0,-1
    80004008:	fe1ff06f          	j	80003fe8 <swap_in_page+0x100>
    8000400c:	fff00513          	li	a0,-1
    80004010:	00008067          	ret

0000000080004014 <handle_page_fault>:
    80004014:	fd010113          	add	sp,sp,-48
    80004018:	fffff7b7          	lui	a5,0xfffff
    8000401c:	02813023          	sd	s0,32(sp)
    80004020:	00f5f433          	and	s0,a1,a5
    80004024:	00040593          	mv	a1,s0
    80004028:	01213823          	sd	s2,16(sp)
    8000402c:	02113423          	sd	ra,40(sp)
    80004030:	00913c23          	sd	s1,24(sp)
    80004034:	01313423          	sd	s3,8(sp)
    80004038:	00050913          	mv	s2,a0
    8000403c:	c41fe0ef          	jal	80002c7c <walk_lookup>
    80004040:	12050c63          	beqz	a0,80004178 <handle_page_fault+0x164>
    80004044:	00053483          	ld	s1,0(a0)
    80004048:	0014f793          	and	a5,s1,1
    8000404c:	12079663          	bnez	a5,80004178 <handle_page_fault+0x164>
    80004050:	12048463          	beqz	s1,80004178 <handle_page_fault+0x164>
    80004054:	00a4d493          	srl	s1,s1,0xa
    80004058:	b21fe0ef          	jal	80002b78 <alloc_page>
    8000405c:	0004849b          	sext.w	s1,s1
    80004060:	00050993          	mv	s3,a0
    80004064:	0e050a63          	beqz	a0,80004158 <handle_page_fault+0x144>
    80004068:	0040d797          	auipc	a5,0x40d
    8000406c:	1b078793          	add	a5,a5,432 # 80411218 <lru_mgr+0x10>
    80004070:	00000713          	li	a4,0
    80004074:	10000613          	li	a2,256
    80004078:	0100006f          	j	80004088 <handle_page_fault+0x74>
    8000407c:	0017071b          	addw	a4,a4,1
    80004080:	03078793          	add	a5,a5,48
    80004084:	06c70063          	beq	a4,a2,800040e4 <handle_page_fault+0xd0>
    80004088:	0007b683          	ld	a3,0(a5)
    8000408c:	fe8698e3          	bne	a3,s0,8000407c <handle_page_fault+0x68>
    80004090:	0147a683          	lw	a3,20(a5)
    80004094:	0026f693          	and	a3,a3,2
    80004098:	fe0682e3          	beqz	a3,8000407c <handle_page_fault+0x68>
    8000409c:	0107a683          	lw	a3,16(a5)
    800040a0:	fc969ee3          	bne	a3,s1,8000407c <handle_page_fault+0x68>
    800040a4:	00171513          	sll	a0,a4,0x1
    800040a8:	00e50533          	add	a0,a0,a4
    800040ac:	00451513          	sll	a0,a0,0x4
    800040b0:	0040d797          	auipc	a5,0x40d
    800040b4:	16878793          	add	a5,a5,360 # 80411218 <lru_mgr+0x10>
    800040b8:	00f50533          	add	a0,a0,a5
    800040bc:	00098593          	mv	a1,s3
    800040c0:	e29ff0ef          	jal	80003ee8 <swap_in_page>
    800040c4:	0a051e63          	bnez	a0,80004180 <handle_page_fault+0x16c>
    800040c8:	02813083          	ld	ra,40(sp)
    800040cc:	02013403          	ld	s0,32(sp)
    800040d0:	01813483          	ld	s1,24(sp)
    800040d4:	01013903          	ld	s2,16(sp)
    800040d8:	00813983          	ld	s3,8(sp)
    800040dc:	03010113          	add	sp,sp,48
    800040e0:	00008067          	ret
    800040e4:	0040d717          	auipc	a4,0x40d
    800040e8:	14870713          	add	a4,a4,328 # 8041122c <lru_mgr+0x24>
    800040ec:	00000793          	li	a5,0
    800040f0:	10000613          	li	a2,256
    800040f4:	00c0006f          	j	80004100 <handle_page_fault+0xec>
    800040f8:	0017879b          	addw	a5,a5,1
    800040fc:	08c78263          	beq	a5,a2,80004180 <handle_page_fault+0x16c>
    80004100:	00072683          	lw	a3,0(a4)
    80004104:	03070713          	add	a4,a4,48
    80004108:	fe0698e3          	bnez	a3,800040f8 <handle_page_fault+0xe4>
    8000410c:	00178613          	add	a2,a5,1
    80004110:	00179713          	sll	a4,a5,0x1
    80004114:	00161693          	sll	a3,a2,0x1
    80004118:	00f707b3          	add	a5,a4,a5
    8000411c:	00479793          	sll	a5,a5,0x4
    80004120:	00c68733          	add	a4,a3,a2
    80004124:	0040d617          	auipc	a2,0x40d
    80004128:	0e460613          	add	a2,a2,228 # 80411208 <lru_mgr>
    8000412c:	00f606b3          	add	a3,a2,a5
    80004130:	00471713          	sll	a4,a4,0x4
    80004134:	01078793          	add	a5,a5,16
    80004138:	00e60733          	add	a4,a2,a4
    8000413c:	00c78533          	add	a0,a5,a2
    80004140:	00200793          	li	a5,2
    80004144:	0086b823          	sd	s0,16(a3)
    80004148:	01273423          	sd	s2,8(a4)
    8000414c:	0296a023          	sw	s1,32(a3)
    80004150:	02f6a223          	sw	a5,36(a3)
    80004154:	f69ff06f          	j	800040bc <handle_page_fault+0xa8>
    80004158:	0040d517          	auipc	a0,0x40d
    8000415c:	0b853503          	ld	a0,184(a0) # 80411210 <lru_mgr+0x8>
    80004160:	00050c63          	beqz	a0,80004178 <handle_page_fault+0x164>
    80004164:	c19ff0ef          	jal	80003d7c <swap_out_page>
    80004168:	00051863          	bnez	a0,80004178 <handle_page_fault+0x164>
    8000416c:	a0dfe0ef          	jal	80002b78 <alloc_page>
    80004170:	00050993          	mv	s3,a0
    80004174:	ee051ae3          	bnez	a0,80004068 <handle_page_fault+0x54>
    80004178:	fff00513          	li	a0,-1
    8000417c:	f4dff06f          	j	800040c8 <handle_page_fault+0xb4>
    80004180:	00098513          	mv	a0,s3
    80004184:	a11fe0ef          	jal	80002b94 <free_page>
    80004188:	fff00513          	li	a0,-1
    8000418c:	f3dff06f          	j	800040c8 <handle_page_fault+0xb4>

0000000080004190 <va2pa_with_replacement>:
    80004190:	fe010113          	add	sp,sp,-32
    80004194:	00913423          	sd	s1,8(sp)
    80004198:	01213023          	sd	s2,0(sp)
    8000419c:	00113c23          	sd	ra,24(sp)
    800041a0:	00813823          	sd	s0,16(sp)
    800041a4:	00050493          	mv	s1,a0
    800041a8:	00058913          	mv	s2,a1
    800041ac:	ad1fe0ef          	jal	80002c7c <walk_lookup>
    800041b0:	00050a63          	beqz	a0,800041c4 <va2pa_with_replacement+0x34>
    800041b4:	00053403          	ld	s0,0(a0)
    800041b8:	00147793          	and	a5,s0,1
    800041bc:	06079663          	bnez	a5,80004228 <va2pa_with_replacement+0x98>
    800041c0:	02041063          	bnez	s0,800041e0 <va2pa_with_replacement+0x50>
    800041c4:	00000513          	li	a0,0
    800041c8:	01813083          	ld	ra,24(sp)
    800041cc:	01013403          	ld	s0,16(sp)
    800041d0:	00813483          	ld	s1,8(sp)
    800041d4:	00013903          	ld	s2,0(sp)
    800041d8:	02010113          	add	sp,sp,32
    800041dc:	00008067          	ret
    800041e0:	00600613          	li	a2,6
    800041e4:	00090593          	mv	a1,s2
    800041e8:	00048513          	mv	a0,s1
    800041ec:	e29ff0ef          	jal	80004014 <handle_page_fault>
    800041f0:	fc051ae3          	bnez	a0,800041c4 <va2pa_with_replacement+0x34>
    800041f4:	00090593          	mv	a1,s2
    800041f8:	00048513          	mv	a0,s1
    800041fc:	a81fe0ef          	jal	80002c7c <walk_lookup>
    80004200:	fc0502e3          	beqz	a0,800041c4 <va2pa_with_replacement+0x34>
    80004204:	00053783          	ld	a5,0(a0)
    80004208:	0017f713          	and	a4,a5,1
    8000420c:	fa070ce3          	beqz	a4,800041c4 <va2pa_with_replacement+0x34>
    80004210:	00a7d793          	srl	a5,a5,0xa
    80004214:	03491593          	sll	a1,s2,0x34
    80004218:	00c79513          	sll	a0,a5,0xc
    8000421c:	0345d593          	srl	a1,a1,0x34
    80004220:	00b50533          	add	a0,a0,a1
    80004224:	fa5ff06f          	j	800041c8 <va2pa_with_replacement+0x38>
    80004228:	00090513          	mv	a0,s2
    8000422c:	a51ff0ef          	jal	80003c7c <lru_touch_page>
    80004230:	01813083          	ld	ra,24(sp)
    80004234:	00a45513          	srl	a0,s0,0xa
    80004238:	01013403          	ld	s0,16(sp)
    8000423c:	03491593          	sll	a1,s2,0x34
    80004240:	00c51513          	sll	a0,a0,0xc
    80004244:	0345d593          	srl	a1,a1,0x34
    80004248:	00813483          	ld	s1,8(sp)
    8000424c:	00013903          	ld	s2,0(sp)
    80004250:	00b50533          	add	a0,a0,a1
    80004254:	02010113          	add	sp,sp,32
    80004258:	00008067          	ret

000000008000425c <safe_copyout>:
    8000425c:	14068063          	beqz	a3,8000439c <safe_copyout+0x140>
    80004260:	fb010113          	add	sp,sp,-80
    80004264:	02913c23          	sd	s1,56(sp)
    80004268:	03213823          	sd	s2,48(sp)
    8000426c:	03313423          	sd	s3,40(sp)
    80004270:	03413023          	sd	s4,32(sp)
    80004274:	01513c23          	sd	s5,24(sp)
    80004278:	01613823          	sd	s6,16(sp)
    8000427c:	01713423          	sd	s7,8(sp)
    80004280:	01813023          	sd	s8,0(sp)
    80004284:	04113423          	sd	ra,72(sp)
    80004288:	04813023          	sd	s0,64(sp)
    8000428c:	00068b13          	mv	s6,a3
    80004290:	00050993          	mv	s3,a0
    80004294:	00058c13          	mv	s8,a1
    80004298:	00060b93          	mv	s7,a2
    8000429c:	fffffa37          	lui	s4,0xfffff
    800042a0:	00001937          	lui	s2,0x1
    800042a4:	10000493          	li	s1,256
    800042a8:	0040da97          	auipc	s5,0x40d
    800042ac:	f60a8a93          	add	s5,s5,-160 # 80411208 <lru_mgr>
    800042b0:	014c7433          	and	s0,s8,s4
    800042b4:	00040593          	mv	a1,s0
    800042b8:	00098513          	mv	a0,s3
    800042bc:	ed5ff0ef          	jal	80004190 <va2pa_with_replacement>
    800042c0:	0c050a63          	beqz	a0,80004394 <safe_copyout+0x138>
    800042c4:	41840833          	sub	a6,s0,s8
    800042c8:	01280833          	add	a6,a6,s2
    800042cc:	010b7463          	bgeu	s6,a6,800042d4 <safe_copyout+0x78>
    800042d0:	000b0813          	mv	a6,s6
    800042d4:	01850733          	add	a4,a0,s8
    800042d8:	40870733          	sub	a4,a4,s0
    800042dc:	01780533          	add	a0,a6,s7
    800042e0:	000b8793          	mv	a5,s7
    800042e4:	41770733          	sub	a4,a4,s7
    800042e8:	0a080263          	beqz	a6,8000438c <safe_copyout+0x130>
    800042ec:	0007c583          	lbu	a1,0(a5)
    800042f0:	00f70633          	add	a2,a4,a5
    800042f4:	00178793          	add	a5,a5,1
    800042f8:	00b60023          	sb	a1,0(a2)
    800042fc:	fef518e3          	bne	a0,a5,800042ec <safe_copyout+0x90>
    80004300:	0040d797          	auipc	a5,0x40d
    80004304:	f1878793          	add	a5,a5,-232 # 80411218 <lru_mgr+0x10>
    80004308:	00000713          	li	a4,0
    8000430c:	0100006f          	j	8000431c <safe_copyout+0xc0>
    80004310:	0017071b          	addw	a4,a4,1
    80004314:	03078793          	add	a5,a5,48
    80004318:	02970863          	beq	a4,s1,80004348 <safe_copyout+0xec>
    8000431c:	0007b603          	ld	a2,0(a5)
    80004320:	fec418e3          	bne	s0,a2,80004310 <safe_copyout+0xb4>
    80004324:	0147a603          	lw	a2,20(a5)
    80004328:	00167593          	and	a1,a2,1
    8000432c:	fe0582e3          	beqz	a1,80004310 <safe_copyout+0xb4>
    80004330:	00171793          	sll	a5,a4,0x1
    80004334:	00e787b3          	add	a5,a5,a4
    80004338:	00479793          	sll	a5,a5,0x4
    8000433c:	00fa87b3          	add	a5,s5,a5
    80004340:	00466613          	or	a2,a2,4
    80004344:	02c7a223          	sw	a2,36(a5)
    80004348:	410b0b33          	sub	s6,s6,a6
    8000434c:	00050b93          	mv	s7,a0
    80004350:	01240c33          	add	s8,s0,s2
    80004354:	f40b1ee3          	bnez	s6,800042b0 <safe_copyout+0x54>
    80004358:	00000513          	li	a0,0
    8000435c:	04813083          	ld	ra,72(sp)
    80004360:	04013403          	ld	s0,64(sp)
    80004364:	03813483          	ld	s1,56(sp)
    80004368:	03013903          	ld	s2,48(sp)
    8000436c:	02813983          	ld	s3,40(sp)
    80004370:	02013a03          	ld	s4,32(sp)
    80004374:	01813a83          	ld	s5,24(sp)
    80004378:	01013b03          	ld	s6,16(sp)
    8000437c:	00813b83          	ld	s7,8(sp)
    80004380:	00013c03          	ld	s8,0(sp)
    80004384:	05010113          	add	sp,sp,80
    80004388:	00008067          	ret
    8000438c:	000b8513          	mv	a0,s7
    80004390:	f71ff06f          	j	80004300 <safe_copyout+0xa4>
    80004394:	fff00513          	li	a0,-1
    80004398:	fc5ff06f          	j	8000435c <safe_copyout+0x100>
    8000439c:	00000513          	li	a0,0
    800043a0:	00008067          	ret

00000000800043a4 <safe_copyin>:
    800043a4:	0e068863          	beqz	a3,80004494 <safe_copyin+0xf0>
    800043a8:	fc010113          	add	sp,sp,-64
    800043ac:	02813823          	sd	s0,48(sp)
    800043b0:	02913423          	sd	s1,40(sp)
    800043b4:	03213023          	sd	s2,32(sp)
    800043b8:	01313c23          	sd	s3,24(sp)
    800043bc:	01513423          	sd	s5,8(sp)
    800043c0:	01613023          	sd	s6,0(sp)
    800043c4:	02113c23          	sd	ra,56(sp)
    800043c8:	01413823          	sd	s4,16(sp)
    800043cc:	00068b13          	mv	s6,a3
    800043d0:	00050493          	mv	s1,a0
    800043d4:	00058993          	mv	s3,a1
    800043d8:	00060a93          	mv	s5,a2
    800043dc:	fffff937          	lui	s2,0xfffff
    800043e0:	00001437          	lui	s0,0x1
    800043e4:	012afa33          	and	s4,s5,s2
    800043e8:	000a0593          	mv	a1,s4
    800043ec:	00048513          	mv	a0,s1
    800043f0:	da1ff0ef          	jal	80004190 <va2pa_with_replacement>
    800043f4:	08050c63          	beqz	a0,8000448c <safe_copyin+0xe8>
    800043f8:	415a08b3          	sub	a7,s4,s5
    800043fc:	008888b3          	add	a7,a7,s0
    80004400:	011b7463          	bgeu	s6,a7,80004408 <safe_copyin+0x64>
    80004404:	000b0893          	mv	a7,s6
    80004408:	01550533          	add	a0,a0,s5
    8000440c:	41450533          	sub	a0,a0,s4
    80004410:	06088063          	beqz	a7,80004470 <safe_copyin+0xcc>
    80004414:	00098793          	mv	a5,s3
    80004418:	01198833          	add	a6,s3,a7
    8000441c:	41350733          	sub	a4,a0,s3
    80004420:	00f70633          	add	a2,a4,a5
    80004424:	00064603          	lbu	a2,0(a2)
    80004428:	00178793          	add	a5,a5,1
    8000442c:	fec78fa3          	sb	a2,-1(a5)
    80004430:	fef818e3          	bne	a6,a5,80004420 <safe_copyin+0x7c>
    80004434:	411b0b33          	sub	s6,s6,a7
    80004438:	00080993          	mv	s3,a6
    8000443c:	008a0ab3          	add	s5,s4,s0
    80004440:	fa0b12e3          	bnez	s6,800043e4 <safe_copyin+0x40>
    80004444:	00000513          	li	a0,0
    80004448:	03813083          	ld	ra,56(sp)
    8000444c:	03013403          	ld	s0,48(sp)
    80004450:	02813483          	ld	s1,40(sp)
    80004454:	02013903          	ld	s2,32(sp)
    80004458:	01813983          	ld	s3,24(sp)
    8000445c:	01013a03          	ld	s4,16(sp)
    80004460:	00813a83          	ld	s5,8(sp)
    80004464:	00013b03          	ld	s6,0(sp)
    80004468:	04010113          	add	sp,sp,64
    8000446c:	00008067          	ret
    80004470:	00001ab7          	lui	s5,0x1
    80004474:	015a0ab3          	add	s5,s4,s5
    80004478:	012afa33          	and	s4,s5,s2
    8000447c:	000a0593          	mv	a1,s4
    80004480:	00048513          	mv	a0,s1
    80004484:	d0dff0ef          	jal	80004190 <va2pa_with_replacement>
    80004488:	f60518e3          	bnez	a0,800043f8 <safe_copyin+0x54>
    8000448c:	fff00513          	li	a0,-1
    80004490:	fb9ff06f          	j	80004448 <safe_copyin+0xa4>
    80004494:	00000513          	li	a0,0
    80004498:	00008067          	ret

000000008000449c <test_page_replacement>:
    8000449c:	f4010113          	add	sp,sp,-192
    800044a0:	00005517          	auipc	a0,0x5
    800044a4:	52850513          	add	a0,a0,1320 # 800099c8 <digits+0x68>
    800044a8:	0a113c23          	sd	ra,184(sp)
    800044ac:	0a813823          	sd	s0,176(sp)
    800044b0:	0a913423          	sd	s1,168(sp)
    800044b4:	0b213023          	sd	s2,160(sp)
    800044b8:	09313c23          	sd	s3,152(sp)
    800044bc:	e10fe0ef          	jal	80002acc <uart_puts>
    800044c0:	00005517          	auipc	a0,0x5
    800044c4:	53050513          	add	a0,a0,1328 # 800099f0 <digits+0x90>
    800044c8:	e04fe0ef          	jal	80002acc <uart_puts>
    800044cc:	d18ff0ef          	jal	800039e4 <alloc_swap_slot>
    800044d0:	0005049b          	sext.w	s1,a0
    800044d4:	d10ff0ef          	jal	800039e4 <alloc_swap_slot>
    800044d8:	0005041b          	sext.w	s0,a0
    800044dc:	d08ff0ef          	jal	800039e4 <alloc_swap_slot>
    800044e0:	fff00793          	li	a5,-1
    800044e4:	02f48663          	beq	s1,a5,80004510 <test_page_replacement+0x74>
    800044e8:	1cf40c63          	beq	s0,a5,800046c0 <test_page_replacement+0x224>
    800044ec:	0005051b          	sext.w	a0,a0
    800044f0:	02f50063          	beq	a0,a5,80004510 <test_page_replacement+0x74>
    800044f4:	00848e63          	beq	s1,s0,80004510 <test_page_replacement+0x74>
    800044f8:	00a40c63          	beq	s0,a0,80004510 <test_page_replacement+0x74>
    800044fc:	00a48a63          	beq	s1,a0,80004510 <test_page_replacement+0x74>
    80004500:	00005517          	auipc	a0,0x5
    80004504:	51850513          	add	a0,a0,1304 # 80009a18 <digits+0xb8>
    80004508:	dc4fe0ef          	jal	80002acc <uart_puts>
    8000450c:	0100006f          	j	8000451c <test_page_replacement+0x80>
    80004510:	00005517          	auipc	a0,0x5
    80004514:	52850513          	add	a0,a0,1320 # 80009a38 <digits+0xd8>
    80004518:	db4fe0ef          	jal	80002acc <uart_puts>
    8000451c:	0000d797          	auipc	a5,0xd
    80004520:	ce07a783          	lw	a5,-800(a5) # 800111fc <swap_mgr+0x84>
    80004524:	00f47663          	bgeu	s0,a5,80004530 <test_page_replacement+0x94>
    80004528:	00040513          	mv	a0,s0
    8000452c:	fc4fe0ef          	jal	80002cf0 <free_swap_slot.part.0>
    80004530:	cb4ff0ef          	jal	800039e4 <alloc_swap_slot>
    80004534:	0005051b          	sext.w	a0,a0
    80004538:	14a40c63          	beq	s0,a0,80004690 <test_page_replacement+0x1f4>
    8000453c:	00005517          	auipc	a0,0x5
    80004540:	54450513          	add	a0,a0,1348 # 80009a80 <digits+0x120>
    80004544:	d88fe0ef          	jal	80002acc <uart_puts>
    80004548:	00005517          	auipc	a0,0x5
    8000454c:	56050513          	add	a0,a0,1376 # 80009aa8 <digits+0x148>
    80004550:	d7cfe0ef          	jal	80002acc <uart_puts>
    80004554:	00080737          	lui	a4,0x80
    80004558:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    8000455c:	00010637          	lui	a2,0x10
    80004560:	00c71713          	sll	a4,a4,0xc
    80004564:	fff00793          	li	a5,-1
    80004568:	01f7d793          	srl	a5,a5,0x1f
    8000456c:	00c13023          	sd	a2,0(sp)
    80004570:	02e13c23          	sd	a4,56(sp)
    80004574:	00100613          	li	a2,1
    80004578:	00012737          	lui	a4,0x12
    8000457c:	01f61613          	sll	a2,a2,0x1f
    80004580:	00f13823          	sd	a5,16(sp)
    80004584:	04f13023          	sd	a5,64(sp)
    80004588:	06e13023          	sd	a4,96(sp)
    8000458c:	06f13823          	sd	a5,112(sp)
    80004590:	40001737          	lui	a4,0x40001
    80004594:	03010793          	add	a5,sp,48
    80004598:	00422697          	auipc	a3,0x422
    8000459c:	e306b683          	ld	a3,-464(a3) # 804263c8 <kernel_pagetable>
    800045a0:	00171713          	sll	a4,a4,0x1
    800045a4:	0040d417          	auipc	s0,0x40d
    800045a8:	c6440413          	add	s0,s0,-924 # 80411208 <lru_mgr>
    800045ac:	00010493          	mv	s1,sp
    800045b0:	06010993          	add	s3,sp,96
    800045b4:	00c13423          	sd	a2,8(sp)
    800045b8:	00f13c23          	sd	a5,24(sp)
    800045bc:	00011637          	lui	a2,0x11
    800045c0:	08f13023          	sd	a5,128(sp)
    800045c4:	00410917          	auipc	s2,0x410
    800045c8:	c4490913          	add	s2,s2,-956 # 80414208 <lru_mgr+0x3000>
    800045cc:	00300793          	li	a5,3
    800045d0:	00005517          	auipc	a0,0x5
    800045d4:	4f850513          	add	a0,a0,1272 # 80009ac8 <digits+0x168>
    800045d8:	06e13423          	sd	a4,104(sp)
    800045dc:	00f92823          	sw	a5,16(s2)
    800045e0:	02013023          	sd	zero,32(sp)
    800045e4:	02d13423          	sd	a3,40(sp)
    800045e8:	02c13823          	sd	a2,48(sp)
    800045ec:	04d13c23          	sd	a3,88(sp)
    800045f0:	06013c23          	sd	zero,120(sp)
    800045f4:	08d13423          	sd	a3,136(sp)
    800045f8:	00943423          	sd	s1,8(s0)
    800045fc:	04913823          	sd	s1,80(sp)
    80004600:	05313423          	sd	s3,72(sp)
    80004604:	01343023          	sd	s3,0(s0)
    80004608:	cc4fe0ef          	jal	80002acc <uart_puts>
    8000460c:	04813783          	ld	a5,72(sp)
    80004610:	05013703          	ld	a4,80(sp)
    80004614:	08078a63          	beqz	a5,800046a8 <test_page_replacement+0x20c>
    80004618:	02e7b023          	sd	a4,32(a5)
    8000461c:	08070263          	beqz	a4,800046a0 <test_page_replacement+0x204>
    80004620:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    80004624:	01092783          	lw	a5,16(s2)
    80004628:	04013823          	sd	zero,80(sp)
    8000462c:	04013423          	sd	zero,72(sp)
    80004630:	fff7871b          	addw	a4,a5,-1
    80004634:	00e92823          	sw	a4,16(s2)
    80004638:	00200793          	li	a5,2
    8000463c:	00f71663          	bne	a4,a5,80004648 <test_page_replacement+0x1ac>
    80004640:	00043783          	ld	a5,0(s0)
    80004644:	09378663          	beq	a5,s3,800046d0 <test_page_replacement+0x234>
    80004648:	00005517          	auipc	a0,0x5
    8000464c:	4c050513          	add	a0,a0,1216 # 80009b08 <digits+0x1a8>
    80004650:	c7cfe0ef          	jal	80002acc <uart_puts>
    80004654:	00843783          	ld	a5,8(s0)
    80004658:	04978c63          	beq	a5,s1,800046b0 <test_page_replacement+0x214>
    8000465c:	00005517          	auipc	a0,0x5
    80004660:	4ec50513          	add	a0,a0,1260 # 80009b48 <digits+0x1e8>
    80004664:	c68fe0ef          	jal	80002acc <uart_puts>
    80004668:	00005517          	auipc	a0,0x5
    8000466c:	50050513          	add	a0,a0,1280 # 80009b68 <digits+0x208>
    80004670:	c5cfe0ef          	jal	80002acc <uart_puts>
    80004674:	0b813083          	ld	ra,184(sp)
    80004678:	0b013403          	ld	s0,176(sp)
    8000467c:	0a813483          	ld	s1,168(sp)
    80004680:	0a013903          	ld	s2,160(sp)
    80004684:	09813983          	ld	s3,152(sp)
    80004688:	0c010113          	add	sp,sp,192
    8000468c:	00008067          	ret
    80004690:	00005517          	auipc	a0,0x5
    80004694:	3c850513          	add	a0,a0,968 # 80009a58 <digits+0xf8>
    80004698:	c34fe0ef          	jal	80002acc <uart_puts>
    8000469c:	eadff06f          	j	80004548 <test_page_replacement+0xac>
    800046a0:	00f43423          	sd	a5,8(s0)
    800046a4:	f81ff06f          	j	80004624 <test_page_replacement+0x188>
    800046a8:	00e43023          	sd	a4,0(s0)
    800046ac:	f71ff06f          	j	8000461c <test_page_replacement+0x180>
    800046b0:	00005517          	auipc	a0,0x5
    800046b4:	47850513          	add	a0,a0,1144 # 80009b28 <digits+0x1c8>
    800046b8:	c14fe0ef          	jal	80002acc <uart_puts>
    800046bc:	fadff06f          	j	80004668 <test_page_replacement+0x1cc>
    800046c0:	00005517          	auipc	a0,0x5
    800046c4:	37850513          	add	a0,a0,888 # 80009a38 <digits+0xd8>
    800046c8:	c04fe0ef          	jal	80002acc <uart_puts>
    800046cc:	e65ff06f          	j	80004530 <test_page_replacement+0x94>
    800046d0:	00843783          	ld	a5,8(s0)
    800046d4:	f6979ae3          	bne	a5,s1,80004648 <test_page_replacement+0x1ac>
    800046d8:	00005517          	auipc	a0,0x5
    800046dc:	41050513          	add	a0,a0,1040 # 80009ae8 <digits+0x188>
    800046e0:	becfe0ef          	jal	80002acc <uart_puts>
    800046e4:	f71ff06f          	j	80004654 <test_page_replacement+0x1b8>

00000000800046e8 <walkaddr>:
    800046e8:	fff00793          	li	a5,-1
    800046ec:	0197d793          	srl	a5,a5,0x19
    800046f0:	04b7e463          	bltu	a5,a1,80004738 <walkaddr+0x50>
    800046f4:	ff010113          	add	sp,sp,-16
    800046f8:	00113423          	sd	ra,8(sp)
    800046fc:	d80fe0ef          	jal	80002c7c <walk_lookup>
    80004700:	04050063          	beqz	a0,80004740 <walkaddr+0x58>
    80004704:	00053783          	ld	a5,0(a0)
    80004708:	01100713          	li	a4,17
    8000470c:	00000513          	li	a0,0
    80004710:	0117f693          	and	a3,a5,17
    80004714:	00e68863          	beq	a3,a4,80004724 <walkaddr+0x3c>
    80004718:	00813083          	ld	ra,8(sp)
    8000471c:	01010113          	add	sp,sp,16
    80004720:	00008067          	ret
    80004724:	00813083          	ld	ra,8(sp)
    80004728:	00a7d793          	srl	a5,a5,0xa
    8000472c:	00c79513          	sll	a0,a5,0xc
    80004730:	01010113          	add	sp,sp,16
    80004734:	00008067          	ret
    80004738:	00000513          	li	a0,0
    8000473c:	00008067          	ret
    80004740:	00813083          	ld	ra,8(sp)
    80004744:	00000513          	li	a0,0
    80004748:	01010113          	add	sp,sp,16
    8000474c:	00008067          	ret

0000000080004750 <copyin>:
    80004750:	10068863          	beqz	a3,80004860 <copyin+0x110>
    80004754:	fb010113          	add	sp,sp,-80
    80004758:	02913c23          	sd	s1,56(sp)
    8000475c:	01513c23          	sd	s5,24(sp)
    80004760:	fff00493          	li	s1,-1
    80004764:	fffffab7          	lui	s5,0xfffff
    80004768:	04813023          	sd	s0,64(sp)
    8000476c:	04113423          	sd	ra,72(sp)
    80004770:	03213823          	sd	s2,48(sp)
    80004774:	03313423          	sd	s3,40(sp)
    80004778:	03413023          	sd	s4,32(sp)
    8000477c:	01613823          	sd	s6,16(sp)
    80004780:	01713423          	sd	s7,8(sp)
    80004784:	01567ab3          	and	s5,a2,s5
    80004788:	0194d493          	srl	s1,s1,0x19
    8000478c:	00060413          	mv	s0,a2
    80004790:	0354ea63          	bltu	s1,s5,800047c4 <copyin+0x74>
    80004794:	00068b13          	mv	s6,a3
    80004798:	00050913          	mv	s2,a0
    8000479c:	00058b93          	mv	s7,a1
    800047a0:	01100a13          	li	s4,17
    800047a4:	000019b7          	lui	s3,0x1
    800047a8:	000a8593          	mv	a1,s5
    800047ac:	00090513          	mv	a0,s2
    800047b0:	cccfe0ef          	jal	80002c7c <walk_lookup>
    800047b4:	00050863          	beqz	a0,800047c4 <copyin+0x74>
    800047b8:	00053783          	ld	a5,0(a0)
    800047bc:	0117f713          	and	a4,a5,17
    800047c0:	03470a63          	beq	a4,s4,800047f4 <copyin+0xa4>
    800047c4:	fff00513          	li	a0,-1
    800047c8:	04813083          	ld	ra,72(sp)
    800047cc:	04013403          	ld	s0,64(sp)
    800047d0:	03813483          	ld	s1,56(sp)
    800047d4:	03013903          	ld	s2,48(sp)
    800047d8:	02813983          	ld	s3,40(sp)
    800047dc:	02013a03          	ld	s4,32(sp)
    800047e0:	01813a83          	ld	s5,24(sp)
    800047e4:	01013b03          	ld	s6,16(sp)
    800047e8:	00813b83          	ld	s7,8(sp)
    800047ec:	05010113          	add	sp,sp,80
    800047f0:	00008067          	ret
    800047f4:	00a7d793          	srl	a5,a5,0xa
    800047f8:	00c79793          	sll	a5,a5,0xc
    800047fc:	fc0784e3          	beqz	a5,800047c4 <copyin+0x74>
    80004800:	013a85b3          	add	a1,s5,s3
    80004804:	408586b3          	sub	a3,a1,s0
    80004808:	00db7463          	bgeu	s6,a3,80004810 <copyin+0xc0>
    8000480c:	000b0693          	mv	a3,s6
    80004810:	41540733          	sub	a4,s0,s5
    80004814:	00f70733          	add	a4,a4,a5
    80004818:	01768833          	add	a6,a3,s7
    8000481c:	000b8793          	mv	a5,s7
    80004820:	41770733          	sub	a4,a4,s7
    80004824:	02068263          	beqz	a3,80004848 <copyin+0xf8>
    80004828:	00f70633          	add	a2,a4,a5
    8000482c:	00064603          	lbu	a2,0(a2) # 11000 <_entry-0x7ffef000>
    80004830:	00178793          	add	a5,a5,1
    80004834:	fec78fa3          	sb	a2,-1(a5)
    80004838:	fef818e3          	bne	a6,a5,80004828 <copyin+0xd8>
    8000483c:	40db0b33          	sub	s6,s6,a3
    80004840:	00080b93          	mv	s7,a6
    80004844:	000b0a63          	beqz	s6,80004858 <copyin+0x108>
    80004848:	f6b4eee3          	bltu	s1,a1,800047c4 <copyin+0x74>
    8000484c:	00058a93          	mv	s5,a1
    80004850:	00058413          	mv	s0,a1
    80004854:	f55ff06f          	j	800047a8 <copyin+0x58>
    80004858:	00000513          	li	a0,0
    8000485c:	f6dff06f          	j	800047c8 <copyin+0x78>
    80004860:	00000513          	li	a0,0
    80004864:	00008067          	ret

0000000080004868 <copyout>:
    80004868:	10068863          	beqz	a3,80004978 <copyout+0x110>
    8000486c:	fb010113          	add	sp,sp,-80
    80004870:	02913c23          	sd	s1,56(sp)
    80004874:	01513c23          	sd	s5,24(sp)
    80004878:	fff00493          	li	s1,-1
    8000487c:	fffffab7          	lui	s5,0xfffff
    80004880:	04813023          	sd	s0,64(sp)
    80004884:	04113423          	sd	ra,72(sp)
    80004888:	03213823          	sd	s2,48(sp)
    8000488c:	03313423          	sd	s3,40(sp)
    80004890:	03413023          	sd	s4,32(sp)
    80004894:	01613823          	sd	s6,16(sp)
    80004898:	01713423          	sd	s7,8(sp)
    8000489c:	0155fab3          	and	s5,a1,s5
    800048a0:	0194d493          	srl	s1,s1,0x19
    800048a4:	00058413          	mv	s0,a1
    800048a8:	0354ea63          	bltu	s1,s5,800048dc <copyout+0x74>
    800048ac:	00068b13          	mv	s6,a3
    800048b0:	00050913          	mv	s2,a0
    800048b4:	00060b93          	mv	s7,a2
    800048b8:	01100a13          	li	s4,17
    800048bc:	000019b7          	lui	s3,0x1
    800048c0:	000a8593          	mv	a1,s5
    800048c4:	00090513          	mv	a0,s2
    800048c8:	bb4fe0ef          	jal	80002c7c <walk_lookup>
    800048cc:	00050863          	beqz	a0,800048dc <copyout+0x74>
    800048d0:	00053783          	ld	a5,0(a0)
    800048d4:	0117f713          	and	a4,a5,17
    800048d8:	03470a63          	beq	a4,s4,8000490c <copyout+0xa4>
    800048dc:	fff00513          	li	a0,-1
    800048e0:	04813083          	ld	ra,72(sp)
    800048e4:	04013403          	ld	s0,64(sp)
    800048e8:	03813483          	ld	s1,56(sp)
    800048ec:	03013903          	ld	s2,48(sp)
    800048f0:	02813983          	ld	s3,40(sp)
    800048f4:	02013a03          	ld	s4,32(sp)
    800048f8:	01813a83          	ld	s5,24(sp)
    800048fc:	01013b03          	ld	s6,16(sp)
    80004900:	00813b83          	ld	s7,8(sp)
    80004904:	05010113          	add	sp,sp,80
    80004908:	00008067          	ret
    8000490c:	00a7d793          	srl	a5,a5,0xa
    80004910:	00c79793          	sll	a5,a5,0xc
    80004914:	fc0784e3          	beqz	a5,800048dc <copyout+0x74>
    80004918:	013a8533          	add	a0,s5,s3
    8000491c:	408506b3          	sub	a3,a0,s0
    80004920:	00db7463          	bgeu	s6,a3,80004928 <copyout+0xc0>
    80004924:	000b0693          	mv	a3,s6
    80004928:	41540733          	sub	a4,s0,s5
    8000492c:	00f70733          	add	a4,a4,a5
    80004930:	01768833          	add	a6,a3,s7
    80004934:	000b8793          	mv	a5,s7
    80004938:	41770733          	sub	a4,a4,s7
    8000493c:	02068263          	beqz	a3,80004960 <copyout+0xf8>
    80004940:	0007c583          	lbu	a1,0(a5)
    80004944:	00f70633          	add	a2,a4,a5
    80004948:	00178793          	add	a5,a5,1
    8000494c:	00b60023          	sb	a1,0(a2)
    80004950:	fef818e3          	bne	a6,a5,80004940 <copyout+0xd8>
    80004954:	40db0b33          	sub	s6,s6,a3
    80004958:	00080b93          	mv	s7,a6
    8000495c:	000b0a63          	beqz	s6,80004970 <copyout+0x108>
    80004960:	f6a4eee3          	bltu	s1,a0,800048dc <copyout+0x74>
    80004964:	00050a93          	mv	s5,a0
    80004968:	00050413          	mv	s0,a0
    8000496c:	f55ff06f          	j	800048c0 <copyout+0x58>
    80004970:	00000513          	li	a0,0
    80004974:	f6dff06f          	j	800048e0 <copyout+0x78>
    80004978:	00000513          	li	a0,0
    8000497c:	00008067          	ret

0000000080004980 <uvmunmap>:
    80004980:	03459793          	sll	a5,a1,0x34
    80004984:	00079463          	bnez	a5,8000498c <uvmunmap+0xc>
    80004988:	bbcfe06f          	j	80002d44 <uvmunmap.part.0>
    8000498c:	00008067          	ret

0000000080004990 <uvmdealloc>:
    80004990:	06b67863          	bgeu	a2,a1,80004a00 <uvmdealloc+0x70>
    80004994:	000017b7          	lui	a5,0x1
    80004998:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000499c:	ff010113          	add	sp,sp,-16
    800049a0:	fffff6b7          	lui	a3,0xfffff
    800049a4:	00f60733          	add	a4,a2,a5
    800049a8:	00f587b3          	add	a5,a1,a5
    800049ac:	00813023          	sd	s0,0(sp)
    800049b0:	00113423          	sd	ra,8(sp)
    800049b4:	00d775b3          	and	a1,a4,a3
    800049b8:	00d7f7b3          	and	a5,a5,a3
    800049bc:	00060413          	mv	s0,a2
    800049c0:	00f5ec63          	bltu	a1,a5,800049d8 <uvmdealloc+0x48>
    800049c4:	00813083          	ld	ra,8(sp)
    800049c8:	00040513          	mv	a0,s0
    800049cc:	00013403          	ld	s0,0(sp)
    800049d0:	01010113          	add	sp,sp,16
    800049d4:	00008067          	ret
    800049d8:	40b787b3          	sub	a5,a5,a1
    800049dc:	00c7d793          	srl	a5,a5,0xc
    800049e0:	00100693          	li	a3,1
    800049e4:	0007861b          	sext.w	a2,a5
    800049e8:	b5cfe0ef          	jal	80002d44 <uvmunmap.part.0>
    800049ec:	00813083          	ld	ra,8(sp)
    800049f0:	00040513          	mv	a0,s0
    800049f4:	00013403          	ld	s0,0(sp)
    800049f8:	01010113          	add	sp,sp,16
    800049fc:	00008067          	ret
    80004a00:	00058513          	mv	a0,a1
    80004a04:	00008067          	ret

0000000080004a08 <uvmalloc>:
    80004a08:	0eb66463          	bltu	a2,a1,80004af0 <uvmalloc+0xe8>
    80004a0c:	00001737          	lui	a4,0x1
    80004a10:	fff70713          	add	a4,a4,-1 # fff <_entry-0x7ffff001>
    80004a14:	fc010113          	add	sp,sp,-64
    80004a18:	00e587b3          	add	a5,a1,a4
    80004a1c:	fffff737          	lui	a4,0xfffff
    80004a20:	02913423          	sd	s1,40(sp)
    80004a24:	03213023          	sd	s2,32(sp)
    80004a28:	01313c23          	sd	s3,24(sp)
    80004a2c:	01413823          	sd	s4,16(sp)
    80004a30:	01513423          	sd	s5,8(sp)
    80004a34:	00e7f933          	and	s2,a5,a4
    80004a38:	02113c23          	sd	ra,56(sp)
    80004a3c:	02813823          	sd	s0,48(sp)
    80004a40:	00060a93          	mv	s5,a2
    80004a44:	00050a13          	mv	s4,a0
    80004a48:	00090493          	mv	s1,s2
    80004a4c:	000019b7          	lui	s3,0x1
    80004a50:	04c97263          	bgeu	s2,a2,80004a94 <uvmalloc+0x8c>
    80004a54:	924fe0ef          	jal	80002b78 <alloc_page>
    80004a58:	00050413          	mv	s0,a0
    80004a5c:	06050463          	beqz	a0,80004ac4 <uvmalloc+0xbc>
    80004a60:	01350733          	add	a4,a0,s3
    80004a64:	00050793          	mv	a5,a0
    80004a68:	00078023          	sb	zero,0(a5)
    80004a6c:	00178793          	add	a5,a5,1
    80004a70:	fef71ce3          	bne	a4,a5,80004a68 <uvmalloc+0x60>
    80004a74:	01e00693          	li	a3,30
    80004a78:	00040613          	mv	a2,s0
    80004a7c:	00048593          	mv	a1,s1
    80004a80:	000a0513          	mv	a0,s4
    80004a84:	b9cfe0ef          	jal	80002e20 <map_page>
    80004a88:	02051a63          	bnez	a0,80004abc <uvmalloc+0xb4>
    80004a8c:	013484b3          	add	s1,s1,s3
    80004a90:	fd54e2e3          	bltu	s1,s5,80004a54 <uvmalloc+0x4c>
    80004a94:	000a8513          	mv	a0,s5
    80004a98:	03813083          	ld	ra,56(sp)
    80004a9c:	03013403          	ld	s0,48(sp)
    80004aa0:	02813483          	ld	s1,40(sp)
    80004aa4:	02013903          	ld	s2,32(sp)
    80004aa8:	01813983          	ld	s3,24(sp)
    80004aac:	01013a03          	ld	s4,16(sp)
    80004ab0:	00813a83          	ld	s5,8(sp)
    80004ab4:	04010113          	add	sp,sp,64
    80004ab8:	00008067          	ret
    80004abc:	00040513          	mv	a0,s0
    80004ac0:	8d4fe0ef          	jal	80002b94 <free_page>
    80004ac4:	02997263          	bgeu	s2,s1,80004ae8 <uvmalloc+0xe0>
    80004ac8:	000017b7          	lui	a5,0x1
    80004acc:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80004ad0:	fffff737          	lui	a4,0xfffff
    80004ad4:	00f905b3          	add	a1,s2,a5
    80004ad8:	00f487b3          	add	a5,s1,a5
    80004adc:	00e5f5b3          	and	a1,a1,a4
    80004ae0:	00e7f7b3          	and	a5,a5,a4
    80004ae4:	00f5ea63          	bltu	a1,a5,80004af8 <uvmalloc+0xf0>
    80004ae8:	00000513          	li	a0,0
    80004aec:	fadff06f          	j	80004a98 <uvmalloc+0x90>
    80004af0:	00058513          	mv	a0,a1
    80004af4:	00008067          	ret
    80004af8:	40b787b3          	sub	a5,a5,a1
    80004afc:	00c7d613          	srl	a2,a5,0xc
    80004b00:	000a0513          	mv	a0,s4
    80004b04:	00100693          	li	a3,1
    80004b08:	0006061b          	sext.w	a2,a2
    80004b0c:	a38fe0ef          	jal	80002d44 <uvmunmap.part.0>
    80004b10:	00000513          	li	a0,0
    80004b14:	f85ff06f          	j	80004a98 <uvmalloc+0x90>

0000000080004b18 <freewalk>:
    80004b18:	f0010113          	add	sp,sp,-256
    80004b1c:	000017b7          	lui	a5,0x1
    80004b20:	0e813823          	sd	s0,240(sp)
    80004b24:	0f213023          	sd	s2,224(sp)
    80004b28:	0d613023          	sd	s6,192(sp)
    80004b2c:	0b713c23          	sd	s7,184(sp)
    80004b30:	0e113c23          	sd	ra,248(sp)
    80004b34:	0e913423          	sd	s1,232(sp)
    80004b38:	0d313c23          	sd	s3,216(sp)
    80004b3c:	0d413823          	sd	s4,208(sp)
    80004b40:	0d513423          	sd	s5,200(sp)
    80004b44:	0b813823          	sd	s8,176(sp)
    80004b48:	0b913423          	sd	s9,168(sp)
    80004b4c:	0ba13023          	sd	s10,160(sp)
    80004b50:	09b13c23          	sd	s11,152(sp)
    80004b54:	00050413          	mv	s0,a0
    80004b58:	00050913          	mv	s2,a0
    80004b5c:	00f50b33          	add	s6,a0,a5
    80004b60:	00001bb7          	lui	s7,0x1
    80004b64:	00c0006f          	j	80004b70 <freewalk+0x58>
    80004b68:	00890913          	add	s2,s2,8
    80004b6c:	2f690e63          	beq	s2,s6,80004e68 <freewalk+0x350>
    80004b70:	00093783          	ld	a5,0(s2)
    80004b74:	00100713          	li	a4,1
    80004b78:	00f7f693          	and	a3,a5,15
    80004b7c:	fee696e3          	bne	a3,a4,80004b68 <freewalk+0x50>
    80004b80:	00a7d793          	srl	a5,a5,0xa
    80004b84:	00c79a13          	sll	s4,a5,0xc
    80004b88:	017a0cb3          	add	s9,s4,s7
    80004b8c:	00100d93          	li	s11,1
    80004b90:	000a0a93          	mv	s5,s4
    80004b94:	00040493          	mv	s1,s0
    80004b98:	00c0006f          	j	80004ba4 <freewalk+0x8c>
    80004b9c:	008a0a13          	add	s4,s4,8 # fffffffffffff008 <bss_end+0xffffffff7fbd8c10>
    80004ba0:	2b9a0863          	beq	s4,s9,80004e50 <freewalk+0x338>
    80004ba4:	000a3783          	ld	a5,0(s4)
    80004ba8:	00f7f713          	and	a4,a5,15
    80004bac:	ffb718e3          	bne	a4,s11,80004b9c <freewalk+0x84>
    80004bb0:	00a7d793          	srl	a5,a5,0xa
    80004bb4:	00c79993          	sll	s3,a5,0xc
    80004bb8:	00098c13          	mv	s8,s3
    80004bbc:	01798d33          	add	s10,s3,s7
    80004bc0:	00098413          	mv	s0,s3
    80004bc4:	00c0006f          	j	80004bd0 <freewalk+0xb8>
    80004bc8:	00840413          	add	s0,s0,8
    80004bcc:	27a40863          	beq	s0,s10,80004e3c <freewalk+0x324>
    80004bd0:	00043783          	ld	a5,0(s0)
    80004bd4:	00f7f713          	and	a4,a5,15
    80004bd8:	ffb718e3          	bne	a4,s11,80004bc8 <freewalk+0xb0>
    80004bdc:	00a7d793          	srl	a5,a5,0xa
    80004be0:	00c79793          	sll	a5,a5,0xc
    80004be4:	00048713          	mv	a4,s1
    80004be8:	03513823          	sd	s5,48(sp)
    80004bec:	00090493          	mv	s1,s2
    80004bf0:	017789b3          	add	s3,a5,s7
    80004bf4:	00078a93          	mv	s5,a5
    80004bf8:	00070913          	mv	s2,a4
    80004bfc:	00c0006f          	j	80004c08 <freewalk+0xf0>
    80004c00:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80004c04:	20f98a63          	beq	s3,a5,80004e18 <freewalk+0x300>
    80004c08:	0007b703          	ld	a4,0(a5)
    80004c0c:	00f77693          	and	a3,a4,15
    80004c10:	ffb698e3          	bne	a3,s11,80004c00 <freewalk+0xe8>
    80004c14:	00a75713          	srl	a4,a4,0xa
    80004c18:	00c71713          	sll	a4,a4,0xc
    80004c1c:	017706b3          	add	a3,a4,s7
    80004c20:	05313023          	sd	s3,64(sp)
    80004c24:	00d13423          	sd	a3,8(sp)
    80004c28:	02813c23          	sd	s0,56(sp)
    80004c2c:	04f13423          	sd	a5,72(sp)
    80004c30:	00070993          	mv	s3,a4
    80004c34:	0100006f          	j	80004c44 <freewalk+0x12c>
    80004c38:	00813783          	ld	a5,8(sp)
    80004c3c:	00870713          	add	a4,a4,8 # fffffffffffff008 <bss_end+0xffffffff7fbd8c10>
    80004c40:	1ae78863          	beq	a5,a4,80004df0 <freewalk+0x2d8>
    80004c44:	00073783          	ld	a5,0(a4)
    80004c48:	00f7f693          	and	a3,a5,15
    80004c4c:	ffb696e3          	bne	a3,s11,80004c38 <freewalk+0x120>
    80004c50:	00a7d793          	srl	a5,a5,0xa
    80004c54:	00c79793          	sll	a5,a5,0xc
    80004c58:	017786b3          	add	a3,a5,s7
    80004c5c:	05813823          	sd	s8,80(sp)
    80004c60:	00d13c23          	sd	a3,24(sp)
    80004c64:	000a8c13          	mv	s8,s5
    80004c68:	04e13c23          	sd	a4,88(sp)
    80004c6c:	00078a93          	mv	s5,a5
    80004c70:	07213023          	sd	s2,96(sp)
    80004c74:	0100006f          	j	80004c84 <freewalk+0x16c>
    80004c78:	01813703          	ld	a4,24(sp)
    80004c7c:	00878793          	add	a5,a5,8
    80004c80:	14f70063          	beq	a4,a5,80004dc0 <freewalk+0x2a8>
    80004c84:	0007b703          	ld	a4,0(a5)
    80004c88:	00f77693          	and	a3,a4,15
    80004c8c:	ffb696e3          	bne	a3,s11,80004c78 <freewalk+0x160>
    80004c90:	00a75713          	srl	a4,a4,0xa
    80004c94:	00c71913          	sll	s2,a4,0xc
    80004c98:	01790733          	add	a4,s2,s7
    80004c9c:	07213423          	sd	s2,104(sp)
    80004ca0:	00090413          	mv	s0,s2
    80004ca4:	02e13023          	sd	a4,32(sp)
    80004ca8:	06f13823          	sd	a5,112(sp)
    80004cac:	00048913          	mv	s2,s1
    80004cb0:	0100006f          	j	80004cc0 <freewalk+0x1a8>
    80004cb4:	02013783          	ld	a5,32(sp)
    80004cb8:	00840413          	add	s0,s0,8
    80004cbc:	0c878e63          	beq	a5,s0,80004d98 <freewalk+0x280>
    80004cc0:	00043783          	ld	a5,0(s0)
    80004cc4:	00f7f693          	and	a3,a5,15
    80004cc8:	ffb696e3          	bne	a3,s11,80004cb4 <freewalk+0x19c>
    80004ccc:	00a7d793          	srl	a5,a5,0xa
    80004cd0:	00c79493          	sll	s1,a5,0xc
    80004cd4:	017487b3          	add	a5,s1,s7
    80004cd8:	00913823          	sd	s1,16(sp)
    80004cdc:	02f13423          	sd	a5,40(sp)
    80004ce0:	06813c23          	sd	s0,120(sp)
    80004ce4:	0100006f          	j	80004cf4 <freewalk+0x1dc>
    80004ce8:	02813783          	ld	a5,40(sp)
    80004cec:	00848493          	add	s1,s1,8
    80004cf0:	08978663          	beq	a5,s1,80004d7c <freewalk+0x264>
    80004cf4:	0004b783          	ld	a5,0(s1)
    80004cf8:	00f7f693          	and	a3,a5,15
    80004cfc:	ffb696e3          	bne	a3,s11,80004ce8 <freewalk+0x1d0>
    80004d00:	00a7d793          	srl	a5,a5,0xa
    80004d04:	00c79413          	sll	s0,a5,0xc
    80004d08:	017406b3          	add	a3,s0,s7
    80004d0c:	09213023          	sd	s2,128(sp)
    80004d10:	09613423          	sd	s6,136(sp)
    80004d14:	00040913          	mv	s2,s0
    80004d18:	000a0b13          	mv	s6,s4
    80004d1c:	00048a13          	mv	s4,s1
    80004d20:	00068493          	mv	s1,a3
    80004d24:	00c0006f          	j	80004d30 <freewalk+0x218>
    80004d28:	00840413          	add	s0,s0,8
    80004d2c:	02848463          	beq	s1,s0,80004d54 <freewalk+0x23c>
    80004d30:	00043783          	ld	a5,0(s0)
    80004d34:	00f7f713          	and	a4,a5,15
    80004d38:	ffb718e3          	bne	a4,s11,80004d28 <freewalk+0x210>
    80004d3c:	00a7d793          	srl	a5,a5,0xa
    80004d40:	00c79513          	sll	a0,a5,0xc
    80004d44:	dd5ff0ef          	jal	80004b18 <freewalk>
    80004d48:	00840413          	add	s0,s0,8
    80004d4c:	fe043c23          	sd	zero,-8(s0)
    80004d50:	fe8490e3          	bne	s1,s0,80004d30 <freewalk+0x218>
    80004d54:	00090513          	mv	a0,s2
    80004d58:	000a0493          	mv	s1,s4
    80004d5c:	08013903          	ld	s2,128(sp)
    80004d60:	000b0a13          	mv	s4,s6
    80004d64:	08813b03          	ld	s6,136(sp)
    80004d68:	e2dfd0ef          	jal	80002b94 <free_page>
    80004d6c:	02813783          	ld	a5,40(sp)
    80004d70:	0004b023          	sd	zero,0(s1)
    80004d74:	00848493          	add	s1,s1,8
    80004d78:	f6979ee3          	bne	a5,s1,80004cf4 <freewalk+0x1dc>
    80004d7c:	01013503          	ld	a0,16(sp)
    80004d80:	07813403          	ld	s0,120(sp)
    80004d84:	e11fd0ef          	jal	80002b94 <free_page>
    80004d88:	02013783          	ld	a5,32(sp)
    80004d8c:	00043023          	sd	zero,0(s0)
    80004d90:	00840413          	add	s0,s0,8
    80004d94:	f28796e3          	bne	a5,s0,80004cc0 <freewalk+0x1a8>
    80004d98:	07013783          	ld	a5,112(sp)
    80004d9c:	06813503          	ld	a0,104(sp)
    80004da0:	00090493          	mv	s1,s2
    80004da4:	00f13823          	sd	a5,16(sp)
    80004da8:	dedfd0ef          	jal	80002b94 <free_page>
    80004dac:	01013783          	ld	a5,16(sp)
    80004db0:	01813703          	ld	a4,24(sp)
    80004db4:	0007b023          	sd	zero,0(a5)
    80004db8:	00878793          	add	a5,a5,8
    80004dbc:	ecf714e3          	bne	a4,a5,80004c84 <freewalk+0x16c>
    80004dc0:	05813703          	ld	a4,88(sp)
    80004dc4:	000a8513          	mv	a0,s5
    80004dc8:	06013903          	ld	s2,96(sp)
    80004dcc:	00e13823          	sd	a4,16(sp)
    80004dd0:	000c0a93          	mv	s5,s8
    80004dd4:	05013c03          	ld	s8,80(sp)
    80004dd8:	dbdfd0ef          	jal	80002b94 <free_page>
    80004ddc:	01013703          	ld	a4,16(sp)
    80004de0:	00813783          	ld	a5,8(sp)
    80004de4:	00073023          	sd	zero,0(a4)
    80004de8:	00870713          	add	a4,a4,8
    80004dec:	e4e79ce3          	bne	a5,a4,80004c44 <freewalk+0x12c>
    80004df0:	04813783          	ld	a5,72(sp)
    80004df4:	00098513          	mv	a0,s3
    80004df8:	03813403          	ld	s0,56(sp)
    80004dfc:	00f13423          	sd	a5,8(sp)
    80004e00:	04013983          	ld	s3,64(sp)
    80004e04:	d91fd0ef          	jal	80002b94 <free_page>
    80004e08:	00813783          	ld	a5,8(sp)
    80004e0c:	0007b023          	sd	zero,0(a5)
    80004e10:	00878793          	add	a5,a5,8
    80004e14:	def99ae3          	bne	s3,a5,80004c08 <freewalk+0xf0>
    80004e18:	00090793          	mv	a5,s2
    80004e1c:	000a8513          	mv	a0,s5
    80004e20:	00048913          	mv	s2,s1
    80004e24:	03013a83          	ld	s5,48(sp)
    80004e28:	00078493          	mv	s1,a5
    80004e2c:	00840413          	add	s0,s0,8
    80004e30:	d65fd0ef          	jal	80002b94 <free_page>
    80004e34:	fe043c23          	sd	zero,-8(s0)
    80004e38:	d9a41ce3          	bne	s0,s10,80004bd0 <freewalk+0xb8>
    80004e3c:	000c0513          	mv	a0,s8
    80004e40:	d55fd0ef          	jal	80002b94 <free_page>
    80004e44:	008a0a13          	add	s4,s4,8
    80004e48:	fe0a3c23          	sd	zero,-8(s4)
    80004e4c:	d59a1ce3          	bne	s4,s9,80004ba4 <freewalk+0x8c>
    80004e50:	000a8513          	mv	a0,s5
    80004e54:	d41fd0ef          	jal	80002b94 <free_page>
    80004e58:	00890913          	add	s2,s2,8
    80004e5c:	fe093c23          	sd	zero,-8(s2)
    80004e60:	00048413          	mv	s0,s1
    80004e64:	d16916e3          	bne	s2,s6,80004b70 <freewalk+0x58>
    80004e68:	00040513          	mv	a0,s0
    80004e6c:	0f013403          	ld	s0,240(sp)
    80004e70:	0f813083          	ld	ra,248(sp)
    80004e74:	0e813483          	ld	s1,232(sp)
    80004e78:	0e013903          	ld	s2,224(sp)
    80004e7c:	0d813983          	ld	s3,216(sp)
    80004e80:	0d013a03          	ld	s4,208(sp)
    80004e84:	0c813a83          	ld	s5,200(sp)
    80004e88:	0c013b03          	ld	s6,192(sp)
    80004e8c:	0b813b83          	ld	s7,184(sp)
    80004e90:	0b013c03          	ld	s8,176(sp)
    80004e94:	0a813c83          	ld	s9,168(sp)
    80004e98:	0a013d03          	ld	s10,160(sp)
    80004e9c:	09813d83          	ld	s11,152(sp)
    80004ea0:	10010113          	add	sp,sp,256
    80004ea4:	cf1fd06f          	j	80002b94 <free_page>

0000000080004ea8 <uvmfree>:
    80004ea8:	00059463          	bnez	a1,80004eb0 <uvmfree+0x8>
    80004eac:	00008067          	ret
    80004eb0:	000017b7          	lui	a5,0x1
    80004eb4:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80004eb8:	00f585b3          	add	a1,a1,a5
    80004ebc:	00c5d613          	srl	a2,a1,0xc
    80004ec0:	00100693          	li	a3,1
    80004ec4:	00000593          	li	a1,0
    80004ec8:	e7dfd06f          	j	80002d44 <uvmunmap.part.0>

0000000080004ecc <proc_pagetable>:
    80004ecc:	ff010113          	add	sp,sp,-16
    80004ed0:	00113423          	sd	ra,8(sp)
    80004ed4:	02050863          	beqz	a0,80004f04 <proc_pagetable+0x38>
    80004ed8:	ca1fd0ef          	jal	80002b78 <alloc_page>
    80004edc:	00001737          	lui	a4,0x1
    80004ee0:	00050793          	mv	a5,a0
    80004ee4:	00e50733          	add	a4,a0,a4
    80004ee8:	02050863          	beqz	a0,80004f18 <proc_pagetable+0x4c>
    80004eec:	0007b023          	sd	zero,0(a5)
    80004ef0:	00878793          	add	a5,a5,8
    80004ef4:	fef71ce3          	bne	a4,a5,80004eec <proc_pagetable+0x20>
    80004ef8:	00813083          	ld	ra,8(sp)
    80004efc:	01010113          	add	sp,sp,16
    80004f00:	00008067          	ret
    80004f04:	00005517          	auipc	a0,0x5
    80004f08:	c8c50513          	add	a0,a0,-884 # 80009b90 <digits+0x230>
    80004f0c:	bc1fd0ef          	jal	80002acc <uart_puts>
    80004f10:	00000513          	li	a0,0
    80004f14:	fe5ff06f          	j	80004ef8 <proc_pagetable+0x2c>
    80004f18:	00005517          	auipc	a0,0x5
    80004f1c:	c9850513          	add	a0,a0,-872 # 80009bb0 <digits+0x250>
    80004f20:	badfd0ef          	jal	80002acc <uart_puts>
    80004f24:	00000513          	li	a0,0
    80004f28:	fd1ff06f          	j	80004ef8 <proc_pagetable+0x2c>

0000000080004f2c <proc_freepagetable>:
    80004f2c:	fd010113          	add	sp,sp,-48
    80004f30:	01313423          	sd	s3,8(sp)
    80004f34:	02113423          	sd	ra,40(sp)
    80004f38:	02813023          	sd	s0,32(sp)
    80004f3c:	00913c23          	sd	s1,24(sp)
    80004f40:	01213823          	sd	s2,16(sp)
    80004f44:	00050993          	mv	s3,a0
    80004f48:	06059263          	bnez	a1,80004fac <proc_freepagetable+0x80>
    80004f4c:	000014b7          	lui	s1,0x1
    80004f50:	00098413          	mv	s0,s3
    80004f54:	009984b3          	add	s1,s3,s1
    80004f58:	00100913          	li	s2,1
    80004f5c:	00c0006f          	j	80004f68 <proc_freepagetable+0x3c>
    80004f60:	00840413          	add	s0,s0,8
    80004f64:	02940463          	beq	s0,s1,80004f8c <proc_freepagetable+0x60>
    80004f68:	00043503          	ld	a0,0(s0)
    80004f6c:	00f57793          	and	a5,a0,15
    80004f70:	ff2798e3          	bne	a5,s2,80004f60 <proc_freepagetable+0x34>
    80004f74:	00a55513          	srl	a0,a0,0xa
    80004f78:	00c51513          	sll	a0,a0,0xc
    80004f7c:	b9dff0ef          	jal	80004b18 <freewalk>
    80004f80:	00840413          	add	s0,s0,8
    80004f84:	fe043c23          	sd	zero,-8(s0)
    80004f88:	fe9410e3          	bne	s0,s1,80004f68 <proc_freepagetable+0x3c>
    80004f8c:	02013403          	ld	s0,32(sp)
    80004f90:	02813083          	ld	ra,40(sp)
    80004f94:	01813483          	ld	s1,24(sp)
    80004f98:	01013903          	ld	s2,16(sp)
    80004f9c:	00098513          	mv	a0,s3
    80004fa0:	00813983          	ld	s3,8(sp)
    80004fa4:	03010113          	add	sp,sp,48
    80004fa8:	bedfd06f          	j	80002b94 <free_page>
    80004fac:	000017b7          	lui	a5,0x1
    80004fb0:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80004fb4:	00f58633          	add	a2,a1,a5
    80004fb8:	00100693          	li	a3,1
    80004fbc:	00c65613          	srl	a2,a2,0xc
    80004fc0:	00000593          	li	a1,0
    80004fc4:	d81fd0ef          	jal	80002d44 <uvmunmap.part.0>
    80004fc8:	f85ff06f          	j	80004f4c <proc_freepagetable+0x20>

0000000080004fcc <uvmcopy>:
    80004fcc:	10060463          	beqz	a2,800050d4 <uvmcopy+0x108>
    80004fd0:	fb010113          	add	sp,sp,-80
    80004fd4:	02913c23          	sd	s1,56(sp)
    80004fd8:	03213823          	sd	s2,48(sp)
    80004fdc:	03313423          	sd	s3,40(sp)
    80004fe0:	03413023          	sd	s4,32(sp)
    80004fe4:	01513c23          	sd	s5,24(sp)
    80004fe8:	04113423          	sd	ra,72(sp)
    80004fec:	04813023          	sd	s0,64(sp)
    80004ff0:	01613823          	sd	s6,16(sp)
    80004ff4:	01713423          	sd	s7,8(sp)
    80004ff8:	00060a13          	mv	s4,a2
    80004ffc:	00050a93          	mv	s5,a0
    80005000:	00058993          	mv	s3,a1
    80005004:	00000493          	li	s1,0
    80005008:	00001937          	lui	s2,0x1
    8000500c:	00048593          	mv	a1,s1
    80005010:	000a8513          	mv	a0,s5
    80005014:	c69fd0ef          	jal	80002c7c <walk_lookup>
    80005018:	06050c63          	beqz	a0,80005090 <uvmcopy+0xc4>
    8000501c:	00053b83          	ld	s7,0(a0)
    80005020:	001bf793          	and	a5,s7,1
    80005024:	06078663          	beqz	a5,80005090 <uvmcopy+0xc4>
    80005028:	00abd593          	srl	a1,s7,0xa
    8000502c:	00c59413          	sll	s0,a1,0xc
    80005030:	b49fd0ef          	jal	80002b78 <alloc_page>
    80005034:	3ffbfb93          	and	s7,s7,1023
    80005038:	00050b13          	mv	s6,a0
    8000503c:	04050a63          	beqz	a0,80005090 <uvmcopy+0xc4>
    80005040:	01250833          	add	a6,a0,s2
    80005044:	00050793          	mv	a5,a0
    80005048:	40a405b3          	sub	a1,s0,a0
    8000504c:	00f58733          	add	a4,a1,a5
    80005050:	00074703          	lbu	a4,0(a4) # 1000 <_entry-0x7ffff000>
    80005054:	00178793          	add	a5,a5,1
    80005058:	fee78fa3          	sb	a4,-1(a5)
    8000505c:	ff0798e3          	bne	a5,a6,8000504c <uvmcopy+0x80>
    80005060:	000b8693          	mv	a3,s7
    80005064:	000b0613          	mv	a2,s6
    80005068:	00048593          	mv	a1,s1
    8000506c:	00098513          	mv	a0,s3
    80005070:	db1fd0ef          	jal	80002e20 <map_page>
    80005074:	00051a63          	bnez	a0,80005088 <uvmcopy+0xbc>
    80005078:	012484b3          	add	s1,s1,s2
    8000507c:	f944e8e3          	bltu	s1,s4,8000500c <uvmcopy+0x40>
    80005080:	00000513          	li	a0,0
    80005084:	0240006f          	j	800050a8 <uvmcopy+0xdc>
    80005088:	000b0513          	mv	a0,s6
    8000508c:	b09fd0ef          	jal	80002b94 <free_page>
    80005090:	00098513          	mv	a0,s3
    80005094:	00100693          	li	a3,1
    80005098:	00c4d613          	srl	a2,s1,0xc
    8000509c:	00000593          	li	a1,0
    800050a0:	ca5fd0ef          	jal	80002d44 <uvmunmap.part.0>
    800050a4:	fff00513          	li	a0,-1
    800050a8:	04813083          	ld	ra,72(sp)
    800050ac:	04013403          	ld	s0,64(sp)
    800050b0:	03813483          	ld	s1,56(sp)
    800050b4:	03013903          	ld	s2,48(sp)
    800050b8:	02813983          	ld	s3,40(sp)
    800050bc:	02013a03          	ld	s4,32(sp)
    800050c0:	01813a83          	ld	s5,24(sp)
    800050c4:	01013b03          	ld	s6,16(sp)
    800050c8:	00813b83          	ld	s7,8(sp)
    800050cc:	05010113          	add	sp,sp,80
    800050d0:	00008067          	ret
    800050d4:	00000513          	li	a0,0
    800050d8:	00008067          	ret

00000000800050dc <handle_timer_interrupt>:
    800050dc:	ff010113          	add	sp,sp,-16
    800050e0:	00421597          	auipc	a1,0x421
    800050e4:	2f85b583          	ld	a1,760(a1) # 804263d8 <ticks>
    800050e8:	00005517          	auipc	a0,0x5
    800050ec:	b0050513          	add	a0,a0,-1280 # 80009be8 <digits+0x288>
    800050f0:	00113423          	sd	ra,8(sp)
    800050f4:	e68fd0ef          	jal	8000275c <printf>
    800050f8:	00813083          	ld	ra,8(sp)
    800050fc:	00100793          	li	a5,1
    80005100:	00421717          	auipc	a4,0x421
    80005104:	2ef72623          	sw	a5,748(a4) # 804263ec <need_resched>
    80005108:	01010113          	add	sp,sp,16
    8000510c:	00008067          	ret

0000000080005110 <handle_external_interrupt>:
    80005110:	00005517          	auipc	a0,0x5
    80005114:	b0050513          	add	a0,a0,-1280 # 80009c10 <digits+0x2b0>
    80005118:	e44fd06f          	j	8000275c <printf>

000000008000511c <handle_software_interrupt>:
    8000511c:	00005517          	auipc	a0,0x5
    80005120:	b2450513          	add	a0,a0,-1244 # 80009c40 <digits+0x2e0>
    80005124:	e38fd06f          	j	8000275c <printf>

0000000080005128 <get_ticks>:
    80005128:	00421517          	auipc	a0,0x421
    8000512c:	2b053503          	ld	a0,688(a0) # 804263d8 <ticks>
    80005130:	00008067          	ret

0000000080005134 <machine_timer_handler>:
    80005134:	00421797          	auipc	a5,0x421
    80005138:	29c78793          	add	a5,a5,668 # 804263d0 <m_mode_ticks>
    8000513c:	0007b703          	ld	a4,0(a5)
    80005140:	ff010113          	add	sp,sp,-16
    80005144:	00113423          	sd	ra,8(sp)
    80005148:	00170713          	add	a4,a4,1
    8000514c:	00e7b023          	sd	a4,0(a5)
    80005150:	00421697          	auipc	a3,0x421
    80005154:	28868693          	add	a3,a3,648 # 804263d8 <ticks>
    80005158:	0006b703          	ld	a4,0(a3)
    8000515c:	00005517          	auipc	a0,0x5
    80005160:	b1450513          	add	a0,a0,-1260 # 80009c70 <digits+0x310>
    80005164:	00170713          	add	a4,a4,1
    80005168:	00e6b023          	sd	a4,0(a3)
    8000516c:	0007b583          	ld	a1,0(a5)
    80005170:	decfd0ef          	jal	8000275c <printf>
    80005174:	0200c7b7          	lui	a5,0x200c
    80005178:	ff87b783          	ld	a5,-8(a5) # 200bff8 <_entry-0x7dff4008>
    8000517c:	000f4737          	lui	a4,0xf4
    80005180:	00813083          	ld	ra,8(sp)
    80005184:	24070713          	add	a4,a4,576 # f4240 <_entry-0x7ff0bdc0>
    80005188:	00e787b3          	add	a5,a5,a4
    8000518c:	02004737          	lui	a4,0x2004
    80005190:	00f73023          	sd	a5,0(a4) # 2004000 <_entry-0x7dffc000>
    80005194:	01010113          	add	sp,sp,16
    80005198:	00008067          	ret

000000008000519c <alloc_trapframe>:
    8000519c:	0040f597          	auipc	a1,0x40f
    800051a0:	08458593          	add	a1,a1,132 # 80414220 <trapframe_used>
    800051a4:	00058793          	mv	a5,a1
    800051a8:	00000713          	li	a4,0
    800051ac:	10000613          	li	a2,256
    800051b0:	00c0006f          	j	800051bc <alloc_trapframe+0x20>
    800051b4:	0017071b          	addw	a4,a4,1
    800051b8:	02c70e63          	beq	a4,a2,800051f4 <alloc_trapframe+0x58>
    800051bc:	0007a683          	lw	a3,0(a5)
    800051c0:	00478793          	add	a5,a5,4
    800051c4:	fe0698e3          	bnez	a3,800051b4 <alloc_trapframe+0x18>
    800051c8:	00271793          	sll	a5,a4,0x2
    800051cc:	00471513          	sll	a0,a4,0x4
    800051d0:	00f585b3          	add	a1,a1,a5
    800051d4:	00e50533          	add	a0,a0,a4
    800051d8:	00100793          	li	a5,1
    800051dc:	00f5a023          	sw	a5,0(a1)
    800051e0:	00451513          	sll	a0,a0,0x4
    800051e4:	0040f797          	auipc	a5,0x40f
    800051e8:	4bc78793          	add	a5,a5,1212 # 804146a0 <trapframe_pool>
    800051ec:	00f50533          	add	a0,a0,a5
    800051f0:	00008067          	ret
    800051f4:	00000513          	li	a0,0
    800051f8:	00008067          	ret

00000000800051fc <free_trapframe>:
    800051fc:	0040f797          	auipc	a5,0x40f
    80005200:	4a478793          	add	a5,a5,1188 # 804146a0 <trapframe_pool>
    80005204:	02f56c63          	bltu	a0,a5,8000523c <free_trapframe+0x40>
    80005208:	00420717          	auipc	a4,0x420
    8000520c:	49870713          	add	a4,a4,1176 # 804256a0 <cpus>
    80005210:	02e57663          	bgeu	a0,a4,8000523c <free_trapframe+0x40>
    80005214:	40f507b3          	sub	a5,a0,a5
    80005218:	00005717          	auipc	a4,0x5
    8000521c:	4c073703          	ld	a4,1216(a4) # 8000a6d8 <digits+0xd78>
    80005220:	4047d793          	sra	a5,a5,0x4
    80005224:	02e787b3          	mul	a5,a5,a4
    80005228:	0040f717          	auipc	a4,0x40f
    8000522c:	ff870713          	add	a4,a4,-8 # 80414220 <trapframe_used>
    80005230:	00279793          	sll	a5,a5,0x2
    80005234:	00f707b3          	add	a5,a4,a5
    80005238:	0007a023          	sw	zero,0(a5)
    8000523c:	00008067          	ret

0000000080005240 <intr_on>:
    80005240:	100027f3          	csrr	a5,sstatus
    80005244:	0027e793          	or	a5,a5,2
    80005248:	10079073          	csrw	sstatus,a5
    8000524c:	00008067          	ret

0000000080005250 <intr_off>:
    80005250:	100027f3          	csrr	a5,sstatus
    80005254:	ffd7f793          	and	a5,a5,-3
    80005258:	10079073          	csrw	sstatus,a5
    8000525c:	00008067          	ret

0000000080005260 <intr_get>:
    80005260:	10002573          	csrr	a0,sstatus
    80005264:	00155513          	srl	a0,a0,0x1
    80005268:	00157513          	and	a0,a0,1
    8000526c:	00008067          	ret

0000000080005270 <set_stvec>:
    80005270:	00a585b3          	add	a1,a1,a0
    80005274:	10559073          	csrw	stvec,a1
    80005278:	00008067          	ret

000000008000527c <trap_init>:
    8000527c:	ff010113          	add	sp,sp,-16
    80005280:	00005517          	auipc	a0,0x5
    80005284:	a2050513          	add	a0,a0,-1504 # 80009ca0 <digits+0x340>
    80005288:	00113423          	sd	ra,8(sp)
    8000528c:	841fd0ef          	jal	80002acc <uart_puts>
    80005290:	0040f617          	auipc	a2,0x40f
    80005294:	f9060613          	add	a2,a2,-112 # 80414220 <trapframe_used>
    80005298:	00060793          	mv	a5,a2
    8000529c:	0040f717          	auipc	a4,0x40f
    800052a0:	38470713          	add	a4,a4,900 # 80414620 <trap_handlers>
    800052a4:	0007a023          	sw	zero,0(a5)
    800052a8:	00478793          	add	a5,a5,4
    800052ac:	fee79ce3          	bne	a5,a4,800052a4 <trap_init+0x28>
    800052b0:	0040f797          	auipc	a5,0x40f
    800052b4:	37078793          	add	a5,a5,880 # 80414620 <trap_handlers>
    800052b8:	0040f697          	auipc	a3,0x40f
    800052bc:	3e868693          	add	a3,a3,1000 # 804146a0 <trapframe_pool>
    800052c0:	00078713          	mv	a4,a5
    800052c4:	00073023          	sd	zero,0(a4)
    800052c8:	00870713          	add	a4,a4,8
    800052cc:	fee69ce3          	bne	a3,a4,800052c4 <trap_init+0x48>
    800052d0:	00000717          	auipc	a4,0x0
    800052d4:	e0c70713          	add	a4,a4,-500 # 800050dc <handle_timer_interrupt>
    800052d8:	42e63423          	sd	a4,1064(a2)
    800052dc:	00000717          	auipc	a4,0x0
    800052e0:	e3470713          	add	a4,a4,-460 # 80005110 <handle_external_interrupt>
    800052e4:	44e63423          	sd	a4,1096(a2)
    800052e8:	00000717          	auipc	a4,0x0
    800052ec:	e3470713          	add	a4,a4,-460 # 8000511c <handle_software_interrupt>
    800052f0:	40e63423          	sd	a4,1032(a2)
    800052f4:	00000593          	li	a1,0
    800052f8:	0007b703          	ld	a4,0(a5)
    800052fc:	00878793          	add	a5,a5,8
    80005300:	00070463          	beqz	a4,80005308 <trap_init+0x8c>
    80005304:	0015859b          	addw	a1,a1,1
    80005308:	fef698e3          	bne	a3,a5,800052f8 <trap_init+0x7c>
    8000530c:	00005517          	auipc	a0,0x5
    80005310:	9bc50513          	add	a0,a0,-1604 # 80009cc8 <digits+0x368>
    80005314:	c48fd0ef          	jal	8000275c <printf>
    80005318:	00813083          	ld	ra,8(sp)
    8000531c:	00005517          	auipc	a0,0x5
    80005320:	9dc50513          	add	a0,a0,-1572 # 80009cf8 <digits+0x398>
    80005324:	01010113          	add	sp,sp,16
    80005328:	fa4fd06f          	j	80002acc <uart_puts>

000000008000532c <trap_init_hart>:
    8000532c:	ff010113          	add	sp,sp,-16
    80005330:	00005517          	auipc	a0,0x5
    80005334:	9e850513          	add	a0,a0,-1560 # 80009d18 <digits+0x3b8>
    80005338:	00113423          	sd	ra,8(sp)
    8000533c:	f90fd0ef          	jal	80002acc <uart_puts>
    80005340:	00001797          	auipc	a5,0x1
    80005344:	79078793          	add	a5,a5,1936 # 80006ad0 <kernelvec>
    80005348:	10579073          	csrw	stvec,a5
    8000534c:	104027f3          	csrr	a5,sie
    80005350:	2227e793          	or	a5,a5,546
    80005354:	10479073          	csrw	sie,a5
    80005358:	100027f3          	csrr	a5,sstatus
    8000535c:	0027e793          	or	a5,a5,2
    80005360:	10079073          	csrw	sstatus,a5
    80005364:	00813083          	ld	ra,8(sp)
    80005368:	00005517          	auipc	a0,0x5
    8000536c:	9d850513          	add	a0,a0,-1576 # 80009d40 <digits+0x3e0>
    80005370:	01010113          	add	sp,sp,16
    80005374:	f58fd06f          	j	80002acc <uart_puts>

0000000080005378 <set_next_timer>:
    80005378:	0200c7b7          	lui	a5,0x200c
    8000537c:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    80005380:	000f4637          	lui	a2,0xf4
    80005384:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005388:	00c58633          	add	a2,a1,a2
    8000538c:	020047b7          	lui	a5,0x2004
    80005390:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    80005394:	00005517          	auipc	a0,0x5
    80005398:	9d450513          	add	a0,a0,-1580 # 80009d68 <digits+0x408>
    8000539c:	bc0fd06f          	j	8000275c <printf>

00000000800053a0 <timerinit>:
    800053a0:	ff010113          	add	sp,sp,-16
    800053a4:	00005517          	auipc	a0,0x5
    800053a8:	9f450513          	add	a0,a0,-1548 # 80009d98 <digits+0x438>
    800053ac:	00113423          	sd	ra,8(sp)
    800053b0:	f1cfd0ef          	jal	80002acc <uart_puts>
    800053b4:	0200c7b7          	lui	a5,0x200c
    800053b8:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    800053bc:	000f4637          	lui	a2,0xf4
    800053c0:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800053c4:	00c58633          	add	a2,a1,a2
    800053c8:	020047b7          	lui	a5,0x2004
    800053cc:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    800053d0:	00005517          	auipc	a0,0x5
    800053d4:	99850513          	add	a0,a0,-1640 # 80009d68 <digits+0x408>
    800053d8:	b84fd0ef          	jal	8000275c <printf>
    800053dc:	00813083          	ld	ra,8(sp)
    800053e0:	00005517          	auipc	a0,0x5
    800053e4:	9d850513          	add	a0,a0,-1576 # 80009db8 <digits+0x458>
    800053e8:	01010113          	add	sp,sp,16
    800053ec:	ee0fd06f          	j	80002acc <uart_puts>

00000000800053f0 <devintr>:
    800053f0:	142025f3          	csrr	a1,scause
    800053f4:	1005da63          	bgez	a1,80005508 <devintr+0x118>
    800053f8:	ff010113          	add	sp,sp,-16
    800053fc:	00113423          	sd	ra,8(sp)
    80005400:	00813023          	sd	s0,0(sp)
    80005404:	00f5f593          	and	a1,a1,15
    80005408:	00500793          	li	a5,5
    8000540c:	08f58663          	beq	a1,a5,80005498 <devintr+0xa8>
    80005410:	00900793          	li	a5,9
    80005414:	06f58263          	beq	a1,a5,80005478 <devintr+0x88>
    80005418:	00100793          	li	a5,1
    8000541c:	02f58263          	beq	a1,a5,80005440 <devintr+0x50>
    80005420:	00005517          	auipc	a0,0x5
    80005424:	a2050513          	add	a0,a0,-1504 # 80009e40 <digits+0x4e0>
    80005428:	b34fd0ef          	jal	8000275c <printf>
    8000542c:	00813083          	ld	ra,8(sp)
    80005430:	00013403          	ld	s0,0(sp)
    80005434:	00000513          	li	a0,0
    80005438:	01010113          	add	sp,sp,16
    8000543c:	00008067          	ret
    80005440:	00005517          	auipc	a0,0x5
    80005444:	9e050513          	add	a0,a0,-1568 # 80009e20 <digits+0x4c0>
    80005448:	e84fd0ef          	jal	80002acc <uart_puts>
    8000544c:	144027f3          	csrr	a5,sip
    80005450:	ffd7f793          	and	a5,a5,-3
    80005454:	14479073          	csrw	sip,a5
    80005458:	00004517          	auipc	a0,0x4
    8000545c:	7e850513          	add	a0,a0,2024 # 80009c40 <digits+0x2e0>
    80005460:	afcfd0ef          	jal	8000275c <printf>
    80005464:	00100513          	li	a0,1
    80005468:	00813083          	ld	ra,8(sp)
    8000546c:	00013403          	ld	s0,0(sp)
    80005470:	01010113          	add	sp,sp,16
    80005474:	00008067          	ret
    80005478:	00005517          	auipc	a0,0x5
    8000547c:	98850513          	add	a0,a0,-1656 # 80009e00 <digits+0x4a0>
    80005480:	e4cfd0ef          	jal	80002acc <uart_puts>
    80005484:	00004517          	auipc	a0,0x4
    80005488:	78c50513          	add	a0,a0,1932 # 80009c10 <digits+0x2b0>
    8000548c:	ad0fd0ef          	jal	8000275c <printf>
    80005490:	00100513          	li	a0,1
    80005494:	fd5ff06f          	j	80005468 <devintr+0x78>
    80005498:	00421417          	auipc	s0,0x421
    8000549c:	f4040413          	add	s0,s0,-192 # 804263d8 <ticks>
    800054a0:	00043783          	ld	a5,0(s0)
    800054a4:	000f4637          	lui	a2,0xf4
    800054a8:	24060613          	add	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800054ac:	00178793          	add	a5,a5,1
    800054b0:	00f43023          	sd	a5,0(s0)
    800054b4:	0200c7b7          	lui	a5,0x200c
    800054b8:	ff87b583          	ld	a1,-8(a5) # 200bff8 <_entry-0x7dff4008>
    800054bc:	020047b7          	lui	a5,0x2004
    800054c0:	00005517          	auipc	a0,0x5
    800054c4:	8a850513          	add	a0,a0,-1880 # 80009d68 <digits+0x408>
    800054c8:	00c58633          	add	a2,a1,a2
    800054cc:	00c7b023          	sd	a2,0(a5) # 2004000 <_entry-0x7dffc000>
    800054d0:	a8cfd0ef          	jal	8000275c <printf>
    800054d4:	00043583          	ld	a1,0(s0)
    800054d8:	00005517          	auipc	a0,0x5
    800054dc:	90050513          	add	a0,a0,-1792 # 80009dd8 <digits+0x478>
    800054e0:	a7cfd0ef          	jal	8000275c <printf>
    800054e4:	00043583          	ld	a1,0(s0)
    800054e8:	00004517          	auipc	a0,0x4
    800054ec:	70050513          	add	a0,a0,1792 # 80009be8 <digits+0x288>
    800054f0:	a6cfd0ef          	jal	8000275c <printf>
    800054f4:	00100793          	li	a5,1
    800054f8:	00421717          	auipc	a4,0x421
    800054fc:	eef72a23          	sw	a5,-268(a4) # 804263ec <need_resched>
    80005500:	00100513          	li	a0,1
    80005504:	f65ff06f          	j	80005468 <devintr+0x78>
    80005508:	00000513          	li	a0,0
    8000550c:	00008067          	ret

0000000080005510 <usertrap>:
    80005510:	142025f3          	csrr	a1,scause
    80005514:	0405c463          	bltz	a1,8000555c <usertrap+0x4c>
    80005518:	00d00793          	li	a5,13
    8000551c:	02b7e063          	bltu	a5,a1,8000553c <usertrap+0x2c>
    80005520:	00b00793          	li	a5,11
    80005524:	02b7e663          	bltu	a5,a1,80005550 <usertrap+0x40>
    80005528:	00800793          	li	a5,8
    8000552c:	00f59c63          	bne	a1,a5,80005544 <usertrap+0x34>
    80005530:	00005517          	auipc	a0,0x5
    80005534:	95850513          	add	a0,a0,-1704 # 80009e88 <digits+0x528>
    80005538:	d94fd06f          	j	80002acc <uart_puts>
    8000553c:	00f00793          	li	a5,15
    80005540:	00f58863          	beq	a1,a5,80005550 <usertrap+0x40>
    80005544:	00005517          	auipc	a0,0x5
    80005548:	97c50513          	add	a0,a0,-1668 # 80009ec0 <digits+0x560>
    8000554c:	a10fd06f          	j	8000275c <printf>
    80005550:	00005517          	auipc	a0,0x5
    80005554:	95050513          	add	a0,a0,-1712 # 80009ea0 <digits+0x540>
    80005558:	d74fd06f          	j	80002acc <uart_puts>
    8000555c:	ff010113          	add	sp,sp,-16
    80005560:	00113423          	sd	ra,8(sp)
    80005564:	e8dff0ef          	jal	800053f0 <devintr>
    80005568:	00050863          	beqz	a0,80005578 <usertrap+0x68>
    8000556c:	00813083          	ld	ra,8(sp)
    80005570:	01010113          	add	sp,sp,16
    80005574:	00008067          	ret
    80005578:	00813083          	ld	ra,8(sp)
    8000557c:	00005517          	auipc	a0,0x5
    80005580:	8e450513          	add	a0,a0,-1820 # 80009e60 <digits+0x500>
    80005584:	01010113          	add	sp,sp,16
    80005588:	9d4fd06f          	j	8000275c <printf>

000000008000558c <handle_syscall>:
    8000558c:	06050a63          	beqz	a0,80005600 <handle_syscall+0x74>
    80005590:	ff010113          	add	sp,sp,-16
    80005594:	00813023          	sd	s0,0(sp)
    80005598:	08853403          	ld	s0,136(a0)
    8000559c:	00005517          	auipc	a0,0x5
    800055a0:	98450513          	add	a0,a0,-1660 # 80009f20 <digits+0x5c0>
    800055a4:	00113423          	sd	ra,8(sp)
    800055a8:	00040593          	mv	a1,s0
    800055ac:	9b0fd0ef          	jal	8000275c <printf>
    800055b0:	00200793          	li	a5,2
    800055b4:	06f40a63          	beq	s0,a5,80005628 <handle_syscall+0x9c>
    800055b8:	0287e463          	bltu	a5,s0,800055e0 <handle_syscall+0x54>
    800055bc:	00005517          	auipc	a0,0x5
    800055c0:	9ac50513          	add	a0,a0,-1620 # 80009f68 <digits+0x608>
    800055c4:	02041663          	bnez	s0,800055f0 <handle_syscall+0x64>
    800055c8:	00013403          	ld	s0,0(sp)
    800055cc:	00813083          	ld	ra,8(sp)
    800055d0:	00005517          	auipc	a0,0x5
    800055d4:	97850513          	add	a0,a0,-1672 # 80009f48 <digits+0x5e8>
    800055d8:	01010113          	add	sp,sp,16
    800055dc:	980fd06f          	j	8000275c <printf>
    800055e0:	00300793          	li	a5,3
    800055e4:	00005517          	auipc	a0,0x5
    800055e8:	9c450513          	add	a0,a0,-1596 # 80009fa8 <digits+0x648>
    800055ec:	02f41063          	bne	s0,a5,8000560c <handle_syscall+0x80>
    800055f0:	00013403          	ld	s0,0(sp)
    800055f4:	00813083          	ld	ra,8(sp)
    800055f8:	01010113          	add	sp,sp,16
    800055fc:	960fd06f          	j	8000275c <printf>
    80005600:	00005517          	auipc	a0,0x5
    80005604:	8f050513          	add	a0,a0,-1808 # 80009ef0 <digits+0x590>
    80005608:	cc4fd06f          	j	80002acc <uart_puts>
    8000560c:	00040593          	mv	a1,s0
    80005610:	00013403          	ld	s0,0(sp)
    80005614:	00813083          	ld	ra,8(sp)
    80005618:	00005517          	auipc	a0,0x5
    8000561c:	9b050513          	add	a0,a0,-1616 # 80009fc8 <digits+0x668>
    80005620:	01010113          	add	sp,sp,16
    80005624:	938fd06f          	j	8000275c <printf>
    80005628:	00013403          	ld	s0,0(sp)
    8000562c:	00813083          	ld	ra,8(sp)
    80005630:	00005517          	auipc	a0,0x5
    80005634:	95850513          	add	a0,a0,-1704 # 80009f88 <digits+0x628>
    80005638:	01010113          	add	sp,sp,16
    8000563c:	920fd06f          	j	8000275c <printf>

0000000080005640 <handle_exception>:
    80005640:	14202773          	csrr	a4,scause
    80005644:	141025f3          	csrr	a1,sepc
    80005648:	00f00793          	li	a5,15
    8000564c:	16e7e263          	bltu	a5,a4,800057b0 <handle_exception+0x170>
    80005650:	00005697          	auipc	a3,0x5
    80005654:	c4468693          	add	a3,a3,-956 # 8000a294 <digits+0x934>
    80005658:	00271793          	sll	a5,a4,0x2
    8000565c:	00d787b3          	add	a5,a5,a3
    80005660:	0007a783          	lw	a5,0(a5)
    80005664:	ff010113          	add	sp,sp,-16
    80005668:	00813023          	sd	s0,0(sp)
    8000566c:	00d787b3          	add	a5,a5,a3
    80005670:	00113423          	sd	ra,8(sp)
    80005674:	00050413          	mv	s0,a0
    80005678:	00078067          	jr	a5
    8000567c:	00013403          	ld	s0,0(sp)
    80005680:	00813083          	ld	ra,8(sp)
    80005684:	00058613          	mv	a2,a1
    80005688:	00070593          	mv	a1,a4
    8000568c:	00005517          	auipc	a0,0x5
    80005690:	bb450513          	add	a0,a0,-1100 # 8000a240 <digits+0x8e0>
    80005694:	01010113          	add	sp,sp,16
    80005698:	8c4fd06f          	j	8000275c <printf>
    8000569c:	00005517          	auipc	a0,0x5
    800056a0:	a3c50513          	add	a0,a0,-1476 # 8000a0d8 <digits+0x778>
    800056a4:	8b8fd0ef          	jal	8000275c <printf>
    800056a8:	10040e63          	beqz	s0,800057c4 <handle_exception+0x184>
    800056ac:	10043583          	ld	a1,256(s0)
    800056b0:	00005517          	auipc	a0,0x5
    800056b4:	a8850513          	add	a0,a0,-1400 # 8000a138 <digits+0x7d8>
    800056b8:	00013403          	ld	s0,0(sp)
    800056bc:	00813083          	ld	ra,8(sp)
    800056c0:	01010113          	add	sp,sp,16
    800056c4:	898fd06f          	j	8000275c <printf>
    800056c8:	00005517          	auipc	a0,0x5
    800056cc:	aa050513          	add	a0,a0,-1376 # 8000a168 <digits+0x808>
    800056d0:	88cfd0ef          	jal	8000275c <printf>
    800056d4:	00005517          	auipc	a0,0x5
    800056d8:	ab450513          	add	a0,a0,-1356 # 8000a188 <digits+0x828>
    800056dc:	08040c63          	beqz	s0,80005774 <handle_exception+0x134>
    800056e0:	10043583          	ld	a1,256(s0)
    800056e4:	00005517          	auipc	a0,0x5
    800056e8:	ad450513          	add	a0,a0,-1324 # 8000a1b8 <digits+0x858>
    800056ec:	fcdff06f          	j	800056b8 <handle_exception+0x78>
    800056f0:	00013403          	ld	s0,0(sp)
    800056f4:	00813083          	ld	ra,8(sp)
    800056f8:	00005517          	auipc	a0,0x5
    800056fc:	ae850513          	add	a0,a0,-1304 # 8000a1e0 <digits+0x880>
    80005700:	01010113          	add	sp,sp,16
    80005704:	858fd06f          	j	8000275c <printf>
    80005708:	00013403          	ld	s0,0(sp)
    8000570c:	00813083          	ld	ra,8(sp)
    80005710:	00005517          	auipc	a0,0x5
    80005714:	b0050513          	add	a0,a0,-1280 # 8000a210 <digits+0x8b0>
    80005718:	01010113          	add	sp,sp,16
    8000571c:	840fd06f          	j	8000275c <printf>
    80005720:	00013403          	ld	s0,0(sp)
    80005724:	00813083          	ld	ra,8(sp)
    80005728:	01010113          	add	sp,sp,16
    8000572c:	e61ff06f          	j	8000558c <handle_syscall>
    80005730:	00005517          	auipc	a0,0x5
    80005734:	8b850513          	add	a0,a0,-1864 # 80009fe8 <digits+0x688>
    80005738:	824fd0ef          	jal	8000275c <printf>
    8000573c:	02040863          	beqz	s0,8000576c <handle_exception+0x12c>
    80005740:	143025f3          	csrr	a1,stval
    80005744:	00013403          	ld	s0,0(sp)
    80005748:	00813083          	ld	ra,8(sp)
    8000574c:	00005517          	auipc	a0,0x5
    80005750:	8fc50513          	add	a0,a0,-1796 # 8000a048 <digits+0x6e8>
    80005754:	01010113          	add	sp,sp,16
    80005758:	804fd06f          	j	8000275c <printf>
    8000575c:	00005517          	auipc	a0,0x5
    80005760:	91c50513          	add	a0,a0,-1764 # 8000a078 <digits+0x718>
    80005764:	ff9fc0ef          	jal	8000275c <printf>
    80005768:	fc041ce3          	bnez	s0,80005740 <handle_exception+0x100>
    8000576c:	00005517          	auipc	a0,0x5
    80005770:	8a450513          	add	a0,a0,-1884 # 8000a010 <digits+0x6b0>
    80005774:	00013403          	ld	s0,0(sp)
    80005778:	00813083          	ld	ra,8(sp)
    8000577c:	01010113          	add	sp,sp,16
    80005780:	b4cfd06f          	j	80002acc <uart_puts>
    80005784:	00005517          	auipc	a0,0x5
    80005788:	90c50513          	add	a0,a0,-1780 # 8000a090 <digits+0x730>
    8000578c:	fd1fc0ef          	jal	8000275c <printf>
    80005790:	fc040ee3          	beqz	s0,8000576c <handle_exception+0x12c>
    80005794:	143025f3          	csrr	a1,stval
    80005798:	00013403          	ld	s0,0(sp)
    8000579c:	00813083          	ld	ra,8(sp)
    800057a0:	00005517          	auipc	a0,0x5
    800057a4:	91050513          	add	a0,a0,-1776 # 8000a0b0 <digits+0x750>
    800057a8:	01010113          	add	sp,sp,16
    800057ac:	fb1fc06f          	j	8000275c <printf>
    800057b0:	00058613          	mv	a2,a1
    800057b4:	00005517          	auipc	a0,0x5
    800057b8:	a8c50513          	add	a0,a0,-1396 # 8000a240 <digits+0x8e0>
    800057bc:	00070593          	mv	a1,a4
    800057c0:	f9dfc06f          	j	8000275c <printf>
    800057c4:	00005517          	auipc	a0,0x5
    800057c8:	93c50513          	add	a0,a0,-1732 # 8000a100 <digits+0x7a0>
    800057cc:	fa9ff06f          	j	80005774 <handle_exception+0x134>

00000000800057d0 <kerneltrap>:
    800057d0:	ff010113          	add	sp,sp,-16
    800057d4:	00113423          	sd	ra,8(sp)
    800057d8:	00813023          	sd	s0,0(sp)
    800057dc:	14202473          	csrr	s0,scause
    800057e0:	14102573          	csrr	a0,sepc
    800057e4:	00044a63          	bltz	s0,800057f8 <kerneltrap+0x28>
    800057e8:	00013403          	ld	s0,0(sp)
    800057ec:	00813083          	ld	ra,8(sp)
    800057f0:	01010113          	add	sp,sp,16
    800057f4:	e4dff06f          	j	80005640 <handle_exception>
    800057f8:	bf9ff0ef          	jal	800053f0 <devintr>
    800057fc:	00050a63          	beqz	a0,80005810 <kerneltrap+0x40>
    80005800:	00813083          	ld	ra,8(sp)
    80005804:	00013403          	ld	s0,0(sp)
    80005808:	01010113          	add	sp,sp,16
    8000580c:	00008067          	ret
    80005810:	00f47593          	and	a1,s0,15
    80005814:	00013403          	ld	s0,0(sp)
    80005818:	00813083          	ld	ra,8(sp)
    8000581c:	00005517          	auipc	a0,0x5
    80005820:	a4c50513          	add	a0,a0,-1460 # 8000a268 <digits+0x908>
    80005824:	01010113          	add	sp,sp,16
    80005828:	f35fc06f          	j	8000275c <printf>

000000008000582c <handle_trap_page_fault>:
    8000582c:	00058793          	mv	a5,a1
    80005830:	02050263          	beqz	a0,80005854 <handle_trap_page_fault+0x28>
    80005834:	143025f3          	csrr	a1,stval
    80005838:	00078863          	beqz	a5,80005848 <handle_trap_page_fault+0x1c>
    8000583c:	00005517          	auipc	a0,0x5
    80005840:	87450513          	add	a0,a0,-1932 # 8000a0b0 <digits+0x750>
    80005844:	f19fc06f          	j	8000275c <printf>
    80005848:	00005517          	auipc	a0,0x5
    8000584c:	80050513          	add	a0,a0,-2048 # 8000a048 <digits+0x6e8>
    80005850:	f0dfc06f          	j	8000275c <printf>
    80005854:	00004517          	auipc	a0,0x4
    80005858:	7bc50513          	add	a0,a0,1980 # 8000a010 <digits+0x6b0>
    8000585c:	a70fd06f          	j	80002acc <uart_puts>

0000000080005860 <handle_illegal_instruction>:
    80005860:	00050a63          	beqz	a0,80005874 <handle_illegal_instruction+0x14>
    80005864:	10053583          	ld	a1,256(a0)
    80005868:	00005517          	auipc	a0,0x5
    8000586c:	8d050513          	add	a0,a0,-1840 # 8000a138 <digits+0x7d8>
    80005870:	eedfc06f          	j	8000275c <printf>
    80005874:	00005517          	auipc	a0,0x5
    80005878:	88c50513          	add	a0,a0,-1908 # 8000a100 <digits+0x7a0>
    8000587c:	a50fd06f          	j	80002acc <uart_puts>

0000000080005880 <handle_breakpoint>:
    80005880:	00050a63          	beqz	a0,80005894 <handle_breakpoint+0x14>
    80005884:	10053583          	ld	a1,256(a0)
    80005888:	00005517          	auipc	a0,0x5
    8000588c:	93050513          	add	a0,a0,-1744 # 8000a1b8 <digits+0x858>
    80005890:	ecdfc06f          	j	8000275c <printf>
    80005894:	00005517          	auipc	a0,0x5
    80005898:	8f450513          	add	a0,a0,-1804 # 8000a188 <digits+0x828>
    8000589c:	a30fd06f          	j	80002acc <uart_puts>

00000000800058a0 <proc_init>:
    800058a0:	ff010113          	add	sp,sp,-16
    800058a4:	00005517          	auipc	a0,0x5
    800058a8:	a3450513          	add	a0,a0,-1484 # 8000a2d8 <digits+0x978>
    800058ac:	00113423          	sd	ra,8(sp)
    800058b0:	a1cfd0ef          	jal	80002acc <uart_puts>
    800058b4:	00420797          	auipc	a5,0x420
    800058b8:	e6c78793          	add	a5,a5,-404 # 80425720 <proc>
    800058bc:	00421697          	auipc	a3,0x421
    800058c0:	ae468693          	add	a3,a3,-1308 # 804263a0 <read_count>
    800058c4:	00078713          	mv	a4,a5
    800058c8:	00073023          	sd	zero,0(a4)
    800058cc:	00870713          	add	a4,a4,8
    800058d0:	fed71ce3          	bne	a4,a3,800058c8 <proc_init+0x28>
    800058d4:	00100713          	li	a4,1
    800058d8:	00005617          	auipc	a2,0x5
    800058dc:	72e62423          	sw	a4,1832(a2) # 8000b000 <nextpid>
    800058e0:	00421717          	auipc	a4,0x421
    800058e4:	b0073823          	sd	zero,-1264(a4) # 804263f0 <current_proc>
    800058e8:	0007a023          	sw	zero,0(a5)
    800058ec:	0007a223          	sw	zero,4(a5)
    800058f0:	0007a423          	sw	zero,8(a5)
    800058f4:	0007a623          	sw	zero,12(a5)
    800058f8:	0c878793          	add	a5,a5,200
    800058fc:	fed796e3          	bne	a5,a3,800058e8 <proc_init+0x48>
    80005900:	00813083          	ld	ra,8(sp)
    80005904:	00005517          	auipc	a0,0x5
    80005908:	9fc50513          	add	a0,a0,-1540 # 8000a300 <digits+0x9a0>
    8000590c:	01010113          	add	sp,sp,16
    80005910:	9bcfd06f          	j	80002acc <uart_puts>

0000000080005914 <alloc_proc>:
    80005914:	fd010113          	add	sp,sp,-48
    80005918:	02113423          	sd	ra,40(sp)
    8000591c:	02813023          	sd	s0,32(sp)
    80005920:	00913c23          	sd	s1,24(sp)
    80005924:	01213823          	sd	s2,16(sp)
    80005928:	01313423          	sd	s3,8(sp)
    8000592c:	00421717          	auipc	a4,0x421
    80005930:	abc70713          	add	a4,a4,-1348 # 804263e8 <proc_lock>
    80005934:	00100693          	li	a3,1
    80005938:	00068793          	mv	a5,a3
    8000593c:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80005940:	0007879b          	sext.w	a5,a5
    80005944:	fe079ae3          	bnez	a5,80005938 <alloc_proc+0x24>
    80005948:	00420997          	auipc	s3,0x420
    8000594c:	dd898993          	add	s3,s3,-552 # 80425720 <proc>
    80005950:	00098793          	mv	a5,s3
    80005954:	00000413          	li	s0,0
    80005958:	01000613          	li	a2,16
    8000595c:	0007a683          	lw	a3,0(a5)
    80005960:	0c878793          	add	a5,a5,200
    80005964:	02068463          	beqz	a3,8000598c <alloc_proc+0x78>
    80005968:	0014041b          	addw	s0,s0,1
    8000596c:	fec418e3          	bne	s0,a2,8000595c <alloc_proc+0x48>
    80005970:	0f50000f          	fence	iorw,ow
    80005974:	0807202f          	amoswap.w	zero,zero,(a4)
    80005978:	00005517          	auipc	a0,0x5
    8000597c:	9b050513          	add	a0,a0,-1616 # 8000a328 <digits+0x9c8>
    80005980:	94cfd0ef          	jal	80002acc <uart_puts>
    80005984:	00000913          	li	s2,0
    80005988:	0cc0006f          	j	80005a54 <alloc_proc+0x140>
    8000598c:	0c800493          	li	s1,200
    80005990:	029404b3          	mul	s1,s0,s1
    80005994:	00005697          	auipc	a3,0x5
    80005998:	66c68693          	add	a3,a3,1644 # 8000b000 <nextpid>
    8000599c:	0006a783          	lw	a5,0(a3)
    800059a0:	0017861b          	addw	a2,a5,1
    800059a4:	00c6a023          	sw	a2,0(a3)
    800059a8:	00100693          	li	a3,1
    800059ac:	00998933          	add	s2,s3,s1
    800059b0:	00d92023          	sw	a3,0(s2) # 1000 <_entry-0x7ffff000>
    800059b4:	00f92223          	sw	a5,4(s2)
    800059b8:	00093423          	sd	zero,8(s2)
    800059bc:	00093823          	sd	zero,16(s2)
    800059c0:	0a093823          	sd	zero,176(s2)
    800059c4:	0a093c23          	sd	zero,184(s2)
    800059c8:	02093023          	sd	zero,32(s2)
    800059cc:	0f50000f          	fence	iorw,ow
    800059d0:	0807202f          	amoswap.w	zero,zero,(a4)
    800059d4:	fc8ff0ef          	jal	8000519c <alloc_trapframe>
    800059d8:	02a93823          	sd	a0,48(s2)
    800059dc:	08050c63          	beqz	a0,80005a74 <alloc_proc+0x160>
    800059e0:	998fd0ef          	jal	80002b78 <alloc_page>
    800059e4:	000017b7          	lui	a5,0x1
    800059e8:	02a93423          	sd	a0,40(s2)
    800059ec:	00f507b3          	add	a5,a0,a5
    800059f0:	0c050263          	beqz	a0,80005ab4 <alloc_proc+0x1a0>
    800059f4:	00050023          	sb	zero,0(a0)
    800059f8:	00150513          	add	a0,a0,1
    800059fc:	fef51ce3          	bne	a0,a5,800059f4 <alloc_proc+0xe0>
    80005a00:	04048793          	add	a5,s1,64 # 1040 <_entry-0x7fffefc0>
    80005a04:	00f987b3          	add	a5,s3,a5
    80005a08:	07078713          	add	a4,a5,112 # 1070 <_entry-0x7fffef90>
    80005a0c:	0007b023          	sd	zero,0(a5)
    80005a10:	00878793          	add	a5,a5,8
    80005a14:	fee79ce3          	bne	a5,a4,80005a0c <alloc_proc+0xf8>
    80005a18:	0c800793          	li	a5,200
    80005a1c:	02f40433          	mul	s0,s0,a5
    80005a20:	00001737          	lui	a4,0x1
    80005a24:	00090513          	mv	a0,s2
    80005a28:	008989b3          	add	s3,s3,s0
    80005a2c:	0289b783          	ld	a5,40(s3)
    80005a30:	00e787b3          	add	a5,a5,a4
    80005a34:	04f9b423          	sd	a5,72(s3)
    80005a38:	c94ff0ef          	jal	80004ecc <proc_pagetable>
    80005a3c:	00a9bc23          	sd	a0,24(s3)
    80005a40:	04050663          	beqz	a0,80005a8c <alloc_proc+0x178>
    80005a44:	0049a583          	lw	a1,4(s3)
    80005a48:	00005517          	auipc	a0,0x5
    80005a4c:	97850513          	add	a0,a0,-1672 # 8000a3c0 <digits+0xa60>
    80005a50:	d0dfc0ef          	jal	8000275c <printf>
    80005a54:	02813083          	ld	ra,40(sp)
    80005a58:	02013403          	ld	s0,32(sp)
    80005a5c:	01813483          	ld	s1,24(sp)
    80005a60:	00813983          	ld	s3,8(sp)
    80005a64:	00090513          	mv	a0,s2
    80005a68:	01013903          	ld	s2,16(sp)
    80005a6c:	03010113          	add	sp,sp,48
    80005a70:	00008067          	ret
    80005a74:	00005517          	auipc	a0,0x5
    80005a78:	8d450513          	add	a0,a0,-1836 # 8000a348 <digits+0x9e8>
    80005a7c:	850fd0ef          	jal	80002acc <uart_puts>
    80005a80:	00092023          	sw	zero,0(s2)
    80005a84:	00000913          	li	s2,0
    80005a88:	fcdff06f          	j	80005a54 <alloc_proc+0x140>
    80005a8c:	00005517          	auipc	a0,0x5
    80005a90:	90c50513          	add	a0,a0,-1780 # 8000a398 <digits+0xa38>
    80005a94:	838fd0ef          	jal	80002acc <uart_puts>
    80005a98:	0289b503          	ld	a0,40(s3)
    80005a9c:	00000913          	li	s2,0
    80005aa0:	8f4fd0ef          	jal	80002b94 <free_page>
    80005aa4:	0309b503          	ld	a0,48(s3)
    80005aa8:	f54ff0ef          	jal	800051fc <free_trapframe>
    80005aac:	0009a023          	sw	zero,0(s3)
    80005ab0:	fa5ff06f          	j	80005a54 <alloc_proc+0x140>
    80005ab4:	00005517          	auipc	a0,0x5
    80005ab8:	8bc50513          	add	a0,a0,-1860 # 8000a370 <digits+0xa10>
    80005abc:	810fd0ef          	jal	80002acc <uart_puts>
    80005ac0:	03093503          	ld	a0,48(s2)
    80005ac4:	f38ff0ef          	jal	800051fc <free_trapframe>
    80005ac8:	00092023          	sw	zero,0(s2)
    80005acc:	00000913          	li	s2,0
    80005ad0:	f85ff06f          	j	80005a54 <alloc_proc+0x140>

0000000080005ad4 <free_proc>:
    80005ad4:	06050863          	beqz	a0,80005b44 <free_proc+0x70>
    80005ad8:	ff010113          	add	sp,sp,-16
    80005adc:	00813023          	sd	s0,0(sp)
    80005ae0:	00050413          	mv	s0,a0
    80005ae4:	03053503          	ld	a0,48(a0)
    80005ae8:	00113423          	sd	ra,8(sp)
    80005aec:	00050663          	beqz	a0,80005af8 <free_proc+0x24>
    80005af0:	f0cff0ef          	jal	800051fc <free_trapframe>
    80005af4:	02043823          	sd	zero,48(s0)
    80005af8:	02843503          	ld	a0,40(s0)
    80005afc:	00050663          	beqz	a0,80005b08 <free_proc+0x34>
    80005b00:	894fd0ef          	jal	80002b94 <free_page>
    80005b04:	02043423          	sd	zero,40(s0)
    80005b08:	01843503          	ld	a0,24(s0)
    80005b0c:	00050863          	beqz	a0,80005b1c <free_proc+0x48>
    80005b10:	02043583          	ld	a1,32(s0)
    80005b14:	c18ff0ef          	jal	80004f2c <proc_freepagetable>
    80005b18:	00043c23          	sd	zero,24(s0)
    80005b1c:	00043023          	sd	zero,0(s0)
    80005b20:	00813083          	ld	ra,8(sp)
    80005b24:	02043023          	sd	zero,32(s0)
    80005b28:	0a043823          	sd	zero,176(s0)
    80005b2c:	0a043c23          	sd	zero,184(s0)
    80005b30:	00043823          	sd	zero,16(s0)
    80005b34:	00042423          	sw	zero,8(s0)
    80005b38:	00013403          	ld	s0,0(sp)
    80005b3c:	01010113          	add	sp,sp,16
    80005b40:	00008067          	ret
    80005b44:	00008067          	ret

0000000080005b48 <find_proc>:
    80005b48:	00420597          	auipc	a1,0x420
    80005b4c:	bd858593          	add	a1,a1,-1064 # 80425720 <proc>
    80005b50:	00058793          	mv	a5,a1
    80005b54:	00000713          	li	a4,0
    80005b58:	01000613          	li	a2,16
    80005b5c:	0100006f          	j	80005b6c <find_proc+0x24>
    80005b60:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80005b64:	0c878793          	add	a5,a5,200
    80005b68:	02c70263          	beq	a4,a2,80005b8c <find_proc+0x44>
    80005b6c:	0047a683          	lw	a3,4(a5)
    80005b70:	fea698e3          	bne	a3,a0,80005b60 <find_proc+0x18>
    80005b74:	0007a683          	lw	a3,0(a5)
    80005b78:	fe0684e3          	beqz	a3,80005b60 <find_proc+0x18>
    80005b7c:	0c800793          	li	a5,200
    80005b80:	02f70733          	mul	a4,a4,a5
    80005b84:	00e58533          	add	a0,a1,a4
    80005b88:	00008067          	ret
    80005b8c:	00000513          	li	a0,0
    80005b90:	00008067          	ret

0000000080005b94 <proc_set_kernel_stack>:
    80005b94:	00050a63          	beqz	a0,80005ba8 <proc_set_kernel_stack+0x14>
    80005b98:	000017b7          	lui	a5,0x1
    80005b9c:	00f587b3          	add	a5,a1,a5
    80005ba0:	02b53423          	sd	a1,40(a0)
    80005ba4:	04f53423          	sd	a5,72(a0)
    80005ba8:	00008067          	ret

0000000080005bac <proc_mark_runnable>:
    80005bac:	02050263          	beqz	a0,80005bd0 <proc_mark_runnable+0x24>
    80005bb0:	00052783          	lw	a5,0(a0)
    80005bb4:	00100713          	li	a4,1
    80005bb8:	ffe7869b          	addw	a3,a5,-2 # ffe <_entry-0x7ffff002>
    80005bbc:	00d77a63          	bgeu	a4,a3,80005bd0 <proc_mark_runnable+0x24>
    80005bc0:	00500713          	li	a4,5
    80005bc4:	00e78663          	beq	a5,a4,80005bd0 <proc_mark_runnable+0x24>
    80005bc8:	00200793          	li	a5,2
    80005bcc:	00f52023          	sw	a5,0(a0)
    80005bd0:	00008067          	ret

0000000080005bd4 <proc_mark_sleeping>:
    80005bd4:	00050863          	beqz	a0,80005be4 <proc_mark_sleeping+0x10>
    80005bd8:	00052703          	lw	a4,0(a0)
    80005bdc:	00300793          	li	a5,3
    80005be0:	00f70463          	beq	a4,a5,80005be8 <proc_mark_sleeping+0x14>
    80005be4:	00008067          	ret
    80005be8:	00400793          	li	a5,4
    80005bec:	00f52023          	sw	a5,0(a0)
    80005bf0:	0ab53c23          	sd	a1,184(a0)
    80005bf4:	00008067          	ret

0000000080005bf8 <proc_mark_zombie>:
    80005bf8:	00050c63          	beqz	a0,80005c10 <proc_mark_zombie+0x18>
    80005bfc:	00052703          	lw	a4,0(a0)
    80005c00:	00500793          	li	a5,5
    80005c04:	00f70663          	beq	a4,a5,80005c10 <proc_mark_zombie+0x18>
    80005c08:	00f52023          	sw	a5,0(a0)
    80005c0c:	00b52823          	sw	a1,16(a0)
    80005c10:	00008067          	ret

0000000080005c14 <get_pid>:
    80005c14:	00420797          	auipc	a5,0x420
    80005c18:	7dc7b783          	ld	a5,2012(a5) # 804263f0 <current_proc>
    80005c1c:	00078663          	beqz	a5,80005c28 <get_pid+0x14>
    80005c20:	0047a503          	lw	a0,4(a5)
    80005c24:	00008067          	ret
    80005c28:	fff00513          	li	a0,-1
    80005c2c:	00008067          	ret

0000000080005c30 <get_current_proc>:
    80005c30:	00420517          	auipc	a0,0x420
    80005c34:	7c053503          	ld	a0,1984(a0) # 804263f0 <current_proc>
    80005c38:	00008067          	ret

0000000080005c3c <set_current_proc>:
    80005c3c:	00420797          	auipc	a5,0x420
    80005c40:	7aa7ba23          	sd	a0,1972(a5) # 804263f0 <current_proc>
    80005c44:	00008067          	ret

0000000080005c48 <get_uid>:
    80005c48:	00420797          	auipc	a5,0x420
    80005c4c:	7a87b783          	ld	a5,1960(a5) # 804263f0 <current_proc>
    80005c50:	00000513          	li	a0,0
    80005c54:	00078463          	beqz	a5,80005c5c <get_uid+0x14>
    80005c58:	00c7a503          	lw	a0,12(a5)
    80005c5c:	00008067          	ret

0000000080005c60 <set_uid>:
    80005c60:	ff010113          	add	sp,sp,-16
    80005c64:	00113423          	sd	ra,8(sp)
    80005c68:	00813023          	sd	s0,0(sp)
    80005c6c:	00420797          	auipc	a5,0x420
    80005c70:	7847b783          	ld	a5,1924(a5) # 804263f0 <current_proc>
    80005c74:	04078863          	beqz	a5,80005cc4 <set_uid+0x64>
    80005c78:	00c7a403          	lw	s0,12(a5)
    80005c7c:	04041863          	bnez	s0,80005ccc <set_uid+0x6c>
    80005c80:	00700713          	li	a4,7
    80005c84:	00050593          	mv	a1,a0
    80005c88:	02a76663          	bltu	a4,a0,80005cb4 <set_uid+0x54>
    80005c8c:	0047a603          	lw	a2,4(a5)
    80005c90:	00a7a623          	sw	a0,12(a5)
    80005c94:	00004517          	auipc	a0,0x4
    80005c98:	7b450513          	add	a0,a0,1972 # 8000a448 <digits+0xae8>
    80005c9c:	ac1fc0ef          	jal	8000275c <printf>
    80005ca0:	00813083          	ld	ra,8(sp)
    80005ca4:	00040513          	mv	a0,s0
    80005ca8:	00013403          	ld	s0,0(sp)
    80005cac:	01010113          	add	sp,sp,16
    80005cb0:	00008067          	ret
    80005cb4:	00700613          	li	a2,7
    80005cb8:	00004517          	auipc	a0,0x4
    80005cbc:	76850513          	add	a0,a0,1896 # 8000a420 <digits+0xac0>
    80005cc0:	a9dfc0ef          	jal	8000275c <printf>
    80005cc4:	fff00413          	li	s0,-1
    80005cc8:	fd9ff06f          	j	80005ca0 <set_uid+0x40>
    80005ccc:	00004517          	auipc	a0,0x4
    80005cd0:	71c50513          	add	a0,a0,1820 # 8000a3e8 <digits+0xa88>
    80005cd4:	a89fc0ef          	jal	8000275c <printf>
    80005cd8:	fff00413          	li	s0,-1
    80005cdc:	fc5ff06f          	j	80005ca0 <set_uid+0x40>

0000000080005ce0 <count_user_procs>:
    80005ce0:	00050593          	mv	a1,a0
    80005ce4:	00420697          	auipc	a3,0x420
    80005ce8:	70468693          	add	a3,a3,1796 # 804263e8 <proc_lock>
    80005cec:	00100713          	li	a4,1
    80005cf0:	00070793          	mv	a5,a4
    80005cf4:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80005cf8:	0007879b          	sext.w	a5,a5
    80005cfc:	fe079ae3          	bnez	a5,80005cf0 <count_user_procs+0x10>
    80005d00:	00420797          	auipc	a5,0x420
    80005d04:	a2078793          	add	a5,a5,-1504 # 80425720 <proc>
    80005d08:	00420617          	auipc	a2,0x420
    80005d0c:	69860613          	add	a2,a2,1688 # 804263a0 <read_count>
    80005d10:	00000513          	li	a0,0
    80005d14:	0007a703          	lw	a4,0(a5)
    80005d18:	00070863          	beqz	a4,80005d28 <count_user_procs+0x48>
    80005d1c:	00c7a703          	lw	a4,12(a5)
    80005d20:	00b71463          	bne	a4,a1,80005d28 <count_user_procs+0x48>
    80005d24:	0015051b          	addw	a0,a0,1
    80005d28:	0c878793          	add	a5,a5,200
    80005d2c:	fef614e3          	bne	a2,a5,80005d14 <count_user_procs+0x34>
    80005d30:	0f50000f          	fence	iorw,ow
    80005d34:	0806a02f          	amoswap.w	zero,zero,(a3)
    80005d38:	00008067          	ret

0000000080005d3c <can_fork>:
    80005d3c:	00050593          	mv	a1,a0
    80005d40:	00420697          	auipc	a3,0x420
    80005d44:	6a868693          	add	a3,a3,1704 # 804263e8 <proc_lock>
    80005d48:	00100713          	li	a4,1
    80005d4c:	00070793          	mv	a5,a4
    80005d50:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80005d54:	0007879b          	sext.w	a5,a5
    80005d58:	fe079ae3          	bnez	a5,80005d4c <can_fork+0x10>
    80005d5c:	00420797          	auipc	a5,0x420
    80005d60:	9c478793          	add	a5,a5,-1596 # 80425720 <proc>
    80005d64:	00420817          	auipc	a6,0x420
    80005d68:	63c80813          	add	a6,a6,1596 # 804263a0 <read_count>
    80005d6c:	00000613          	li	a2,0
    80005d70:	0007a703          	lw	a4,0(a5)
    80005d74:	00070863          	beqz	a4,80005d84 <can_fork+0x48>
    80005d78:	00c7a703          	lw	a4,12(a5)
    80005d7c:	00b71463          	bne	a4,a1,80005d84 <can_fork+0x48>
    80005d80:	0016061b          	addw	a2,a2,1
    80005d84:	0c878793          	add	a5,a5,200
    80005d88:	ff0794e3          	bne	a5,a6,80005d70 <can_fork+0x34>
    80005d8c:	0f50000f          	fence	iorw,ow
    80005d90:	0806a02f          	amoswap.w	zero,zero,(a3)
    80005d94:	00300793          	li	a5,3
    80005d98:	00100513          	li	a0,1
    80005d9c:	00c7c463          	blt	a5,a2,80005da4 <can_fork+0x68>
    80005da0:	00008067          	ret
    80005da4:	ff010113          	add	sp,sp,-16
    80005da8:	00400693          	li	a3,4
    80005dac:	00004517          	auipc	a0,0x4
    80005db0:	6cc50513          	add	a0,a0,1740 # 8000a478 <digits+0xb18>
    80005db4:	00113423          	sd	ra,8(sp)
    80005db8:	9a5fc0ef          	jal	8000275c <printf>
    80005dbc:	00813083          	ld	ra,8(sp)
    80005dc0:	00000513          	li	a0,0
    80005dc4:	01010113          	add	sp,sp,16
    80005dc8:	00008067          	ret

0000000080005dcc <setup_user_stack>:
    80005dcc:	08050c63          	beqz	a0,80005e64 <setup_user_stack+0x98>
    80005dd0:	01853783          	ld	a5,24(a0)
    80005dd4:	fe010113          	add	sp,sp,-32
    80005dd8:	00813823          	sd	s0,16(sp)
    80005ddc:	00113c23          	sd	ra,24(sp)
    80005de0:	00913423          	sd	s1,8(sp)
    80005de4:	00050413          	mv	s0,a0
    80005de8:	06078a63          	beqz	a5,80005e5c <setup_user_stack+0x90>
    80005dec:	d8dfc0ef          	jal	80002b78 <alloc_page>
    80005df0:	00050493          	mv	s1,a0
    80005df4:	06050463          	beqz	a0,80005e5c <setup_user_stack+0x90>
    80005df8:	00001737          	lui	a4,0x1
    80005dfc:	00e50733          	add	a4,a0,a4
    80005e00:	00050793          	mv	a5,a0
    80005e04:	00078023          	sb	zero,0(a5)
    80005e08:	00178793          	add	a5,a5,1
    80005e0c:	fee79ce3          	bne	a5,a4,80005e04 <setup_user_stack+0x38>
    80005e10:	040005b7          	lui	a1,0x4000
    80005e14:	01843503          	ld	a0,24(s0)
    80005e18:	ffd58593          	add	a1,a1,-3 # 3fffffd <_entry-0x7c000003>
    80005e1c:	01600693          	li	a3,22
    80005e20:	00048613          	mv	a2,s1
    80005e24:	00c59593          	sll	a1,a1,0xc
    80005e28:	ff9fc0ef          	jal	80002e20 <map_page>
    80005e2c:	02051463          	bnez	a0,80005e54 <setup_user_stack+0x88>
    80005e30:	020007b7          	lui	a5,0x2000
    80005e34:	fff78793          	add	a5,a5,-1 # 1ffffff <_entry-0x7e000001>
    80005e38:	00d79793          	sll	a5,a5,0xd
    80005e3c:	02f43c23          	sd	a5,56(s0)
    80005e40:	01813083          	ld	ra,24(sp)
    80005e44:	01013403          	ld	s0,16(sp)
    80005e48:	00813483          	ld	s1,8(sp)
    80005e4c:	02010113          	add	sp,sp,32
    80005e50:	00008067          	ret
    80005e54:	00048513          	mv	a0,s1
    80005e58:	d3dfc0ef          	jal	80002b94 <free_page>
    80005e5c:	fff00513          	li	a0,-1
    80005e60:	fe1ff06f          	j	80005e40 <setup_user_stack+0x74>
    80005e64:	fff00513          	li	a0,-1
    80005e68:	00008067          	ret

0000000080005e6c <load_user_program>:
    80005e6c:	0e050063          	beqz	a0,80005f4c <load_user_program+0xe0>
    80005e70:	fd010113          	add	sp,sp,-48
    80005e74:	01213823          	sd	s2,16(sp)
    80005e78:	02113423          	sd	ra,40(sp)
    80005e7c:	02813023          	sd	s0,32(sp)
    80005e80:	00913c23          	sd	s1,24(sp)
    80005e84:	01313423          	sd	s3,8(sp)
    80005e88:	01413023          	sd	s4,0(sp)
    80005e8c:	00058913          	mv	s2,a1
    80005e90:	0a058a63          	beqz	a1,80005f44 <load_user_program+0xd8>
    80005e94:	00060493          	mv	s1,a2
    80005e98:	0a060663          	beqz	a2,80005f44 <load_user_program+0xd8>
    80005e9c:	02053a03          	ld	s4,32(a0)
    80005ea0:	00050413          	mv	s0,a0
    80005ea4:	01853503          	ld	a0,24(a0)
    80005ea8:	01460633          	add	a2,a2,s4
    80005eac:	000a0593          	mv	a1,s4
    80005eb0:	b59fe0ef          	jal	80004a08 <uvmalloc>
    80005eb4:	00050993          	mv	s3,a0
    80005eb8:	08050663          	beqz	a0,80005f44 <load_user_program+0xd8>
    80005ebc:	01843503          	ld	a0,24(s0)
    80005ec0:	03343023          	sd	s3,32(s0)
    80005ec4:	00048693          	mv	a3,s1
    80005ec8:	00090613          	mv	a2,s2
    80005ecc:	00000593          	li	a1,0
    80005ed0:	999fe0ef          	jal	80004868 <copyout>
    80005ed4:	04054e63          	bltz	a0,80005f30 <load_user_program+0xc4>
    80005ed8:	00040513          	mv	a0,s0
    80005edc:	ef1ff0ef          	jal	80005dcc <setup_user_stack>
    80005ee0:	04054863          	bltz	a0,80005f30 <load_user_program+0xc4>
    80005ee4:	03043783          	ld	a5,48(s0)
    80005ee8:	11078713          	add	a4,a5,272
    80005eec:	02078063          	beqz	a5,80005f0c <load_user_program+0xa0>
    80005ef0:	00078023          	sb	zero,0(a5)
    80005ef4:	00178793          	add	a5,a5,1
    80005ef8:	fee79ce3          	bne	a5,a4,80005ef0 <load_user_program+0x84>
    80005efc:	03043783          	ld	a5,48(s0)
    80005f00:	03843703          	ld	a4,56(s0)
    80005f04:	1007b023          	sd	zero,256(a5)
    80005f08:	00e7b823          	sd	a4,16(a5)
    80005f0c:	00000513          	li	a0,0
    80005f10:	02813083          	ld	ra,40(sp)
    80005f14:	02013403          	ld	s0,32(sp)
    80005f18:	01813483          	ld	s1,24(sp)
    80005f1c:	01013903          	ld	s2,16(sp)
    80005f20:	00813983          	ld	s3,8(sp)
    80005f24:	00013a03          	ld	s4,0(sp)
    80005f28:	03010113          	add	sp,sp,48
    80005f2c:	00008067          	ret
    80005f30:	01843503          	ld	a0,24(s0)
    80005f34:	000a0613          	mv	a2,s4
    80005f38:	00098593          	mv	a1,s3
    80005f3c:	a55fe0ef          	jal	80004990 <uvmdealloc>
    80005f40:	03443023          	sd	s4,32(s0)
    80005f44:	fff00513          	li	a0,-1
    80005f48:	fc9ff06f          	j	80005f10 <load_user_program+0xa4>
    80005f4c:	fff00513          	li	a0,-1
    80005f50:	00008067          	ret

0000000080005f54 <scheduler>:
    80005f54:	fa010113          	add	sp,sp,-96
    80005f58:	04813823          	sd	s0,80(sp)
    80005f5c:	00420417          	auipc	s0,0x420
    80005f60:	48840413          	add	s0,s0,1160 # 804263e4 <scheduler_initialized>
    80005f64:	00042783          	lw	a5,0(s0)
    80005f68:	04113c23          	sd	ra,88(sp)
    80005f6c:	04913423          	sd	s1,72(sp)
    80005f70:	05213023          	sd	s2,64(sp)
    80005f74:	03313c23          	sd	s3,56(sp)
    80005f78:	03413823          	sd	s4,48(sp)
    80005f7c:	03513423          	sd	s5,40(sp)
    80005f80:	03613023          	sd	s6,32(sp)
    80005f84:	01713c23          	sd	s7,24(sp)
    80005f88:	01813823          	sd	s8,16(sp)
    80005f8c:	01913423          	sd	s9,8(sp)
    80005f90:	01a13023          	sd	s10,0(sp)
    80005f94:	0e078463          	beqz	a5,8000607c <scheduler+0x128>
    80005f98:	00420497          	auipc	s1,0x420
    80005f9c:	44848493          	add	s1,s1,1096 # 804263e0 <last_index.0>
    80005fa0:	0041fc17          	auipc	s8,0x41f
    80005fa4:	780c0c13          	add	s8,s8,1920 # 80425720 <proc>
    80005fa8:	0041fb17          	auipc	s6,0x41f
    80005fac:	6f8b0b13          	add	s6,s6,1784 # 804256a0 <cpus>
    80005fb0:	00420a97          	auipc	s5,0x420
    80005fb4:	440a8a93          	add	s5,s5,1088 # 804263f0 <current_proc>
    80005fb8:	0c800d13          	li	s10,200
    80005fbc:	00200c93          	li	s9,2
    80005fc0:	00300a13          	li	s4,3
    80005fc4:	00004997          	auipc	s3,0x4
    80005fc8:	50c98993          	add	s3,s3,1292 # 8000a4d0 <digits+0xb70>
    80005fcc:	0041f917          	auipc	s2,0x41f
    80005fd0:	6e490913          	add	s2,s2,1764 # 804256b0 <scheduler_context>
    80005fd4:	a6cff0ef          	jal	80005240 <intr_on>
    80005fd8:	0004a783          	lw	a5,0(s1)
    80005fdc:	0107861b          	addw	a2,a5,16
    80005fe0:	0080006f          	j	80005fe8 <scheduler+0x94>
    80005fe4:	fef608e3          	beq	a2,a5,80005fd4 <scheduler+0x80>
    80005fe8:	41f7d71b          	sraw	a4,a5,0x1f
    80005fec:	01c7571b          	srlw	a4,a4,0x1c
    80005ff0:	00f7043b          	addw	s0,a4,a5
    80005ff4:	00f47413          	and	s0,s0,15
    80005ff8:	40e40bbb          	subw	s7,s0,a4
    80005ffc:	000b8413          	mv	s0,s7
    80006000:	03ab8bb3          	mul	s7,s7,s10
    80006004:	0017879b          	addw	a5,a5,1
    80006008:	017c0733          	add	a4,s8,s7
    8000600c:	00072683          	lw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    80006010:	fd969ae3          	bne	a3,s9,80005fe4 <scheduler+0x90>
    80006014:	00472583          	lw	a1,4(a4)
    80006018:	00098513          	mv	a0,s3
    8000601c:	01472023          	sw	s4,0(a4)
    80006020:	00eb3023          	sd	a4,0(s6)
    80006024:	00eab023          	sd	a4,0(s5)
    80006028:	00420797          	auipc	a5,0x420
    8000602c:	3c07a223          	sw	zero,964(a5) # 804263ec <need_resched>
    80006030:	f2cfc0ef          	jal	8000275c <printf>
    80006034:	a1cff0ef          	jal	80005250 <intr_off>
    80006038:	040b8593          	add	a1,s7,64 # 1040 <_entry-0x7fffefc0>
    8000603c:	00bc05b3          	add	a1,s8,a1
    80006040:	00090513          	mv	a0,s2
    80006044:	4ed000ef          	jal	80006d30 <switch_context>
    80006048:	0014041b          	addw	s0,s0,1
    8000604c:	9f4ff0ef          	jal	80005240 <intr_on>
    80006050:	41f4571b          	sraw	a4,s0,0x1f
    80006054:	01c7571b          	srlw	a4,a4,0x1c
    80006058:	00e4043b          	addw	s0,s0,a4
    8000605c:	00f47793          	and	a5,s0,15
    80006060:	40e787bb          	subw	a5,a5,a4
    80006064:	00f4a023          	sw	a5,0(s1)
    80006068:	0041f717          	auipc	a4,0x41f
    8000606c:	62073c23          	sd	zero,1592(a4) # 804256a0 <cpus>
    80006070:	00420717          	auipc	a4,0x420
    80006074:	38073023          	sd	zero,896(a4) # 804263f0 <current_proc>
    80006078:	f5dff06f          	j	80005fd4 <scheduler+0x80>
    8000607c:	00004517          	auipc	a0,0x4
    80006080:	43450513          	add	a0,a0,1076 # 8000a4b0 <digits+0xb50>
    80006084:	a49fc0ef          	jal	80002acc <uart_puts>
    80006088:	00100793          	li	a5,1
    8000608c:	00f42023          	sw	a5,0(s0)
    80006090:	f09ff06f          	j	80005f98 <scheduler+0x44>

0000000080006094 <yield>:
    80006094:	fe010113          	add	sp,sp,-32
    80006098:	00813823          	sd	s0,16(sp)
    8000609c:	00113c23          	sd	ra,24(sp)
    800060a0:	00913423          	sd	s1,8(sp)
    800060a4:	00420417          	auipc	s0,0x420
    800060a8:	34c43403          	ld	s0,844(s0) # 804263f0 <current_proc>
    800060ac:	06040263          	beqz	s0,80006110 <yield+0x7c>
    800060b0:	9b0ff0ef          	jal	80005260 <intr_get>
    800060b4:	00050493          	mv	s1,a0
    800060b8:	998ff0ef          	jal	80005250 <intr_off>
    800060bc:	00420717          	auipc	a4,0x420
    800060c0:	32c70713          	add	a4,a4,812 # 804263e8 <proc_lock>
    800060c4:	00100693          	li	a3,1
    800060c8:	00068793          	mv	a5,a3
    800060cc:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    800060d0:	0007879b          	sext.w	a5,a5
    800060d4:	fe079ae3          	bnez	a5,800060c8 <yield+0x34>
    800060d8:	00042683          	lw	a3,0(s0)
    800060dc:	00300793          	li	a5,3
    800060e0:	04f68263          	beq	a3,a5,80006124 <yield+0x90>
    800060e4:	0f50000f          	fence	iorw,ow
    800060e8:	0807202f          	amoswap.w	zero,zero,(a4)
    800060ec:	00442583          	lw	a1,4(s0)
    800060f0:	00004517          	auipc	a0,0x4
    800060f4:	41050513          	add	a0,a0,1040 # 8000a500 <digits+0xba0>
    800060f8:	e64fc0ef          	jal	8000275c <printf>
    800060fc:	0041f597          	auipc	a1,0x41f
    80006100:	5b458593          	add	a1,a1,1460 # 804256b0 <scheduler_context>
    80006104:	04040513          	add	a0,s0,64
    80006108:	429000ef          	jal	80006d30 <switch_context>
    8000610c:	02049263          	bnez	s1,80006130 <yield+0x9c>
    80006110:	01813083          	ld	ra,24(sp)
    80006114:	01013403          	ld	s0,16(sp)
    80006118:	00813483          	ld	s1,8(sp)
    8000611c:	02010113          	add	sp,sp,32
    80006120:	00008067          	ret
    80006124:	00200793          	li	a5,2
    80006128:	00f42023          	sw	a5,0(s0)
    8000612c:	fb9ff06f          	j	800060e4 <yield+0x50>
    80006130:	01013403          	ld	s0,16(sp)
    80006134:	01813083          	ld	ra,24(sp)
    80006138:	00813483          	ld	s1,8(sp)
    8000613c:	02010113          	add	sp,sp,32
    80006140:	900ff06f          	j	80005240 <intr_on>

0000000080006144 <fork>:
    80006144:	fe010113          	add	sp,sp,-32
    80006148:	01213023          	sd	s2,0(sp)
    8000614c:	00113c23          	sd	ra,24(sp)
    80006150:	00813823          	sd	s0,16(sp)
    80006154:	00913423          	sd	s1,8(sp)
    80006158:	00420917          	auipc	s2,0x420
    8000615c:	29893903          	ld	s2,664(s2) # 804263f0 <current_proc>
    80006160:	18090663          	beqz	s2,800062ec <fork+0x1a8>
    80006164:	00c92583          	lw	a1,12(s2)
    80006168:	00420417          	auipc	s0,0x420
    8000616c:	28040413          	add	s0,s0,640 # 804263e8 <proc_lock>
    80006170:	00100713          	li	a4,1
    80006174:	00070793          	mv	a5,a4
    80006178:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    8000617c:	0007879b          	sext.w	a5,a5
    80006180:	fe079ae3          	bnez	a5,80006174 <fork+0x30>
    80006184:	0041f797          	auipc	a5,0x41f
    80006188:	59c78793          	add	a5,a5,1436 # 80425720 <proc>
    8000618c:	00420697          	auipc	a3,0x420
    80006190:	21468693          	add	a3,a3,532 # 804263a0 <read_count>
    80006194:	00000613          	li	a2,0
    80006198:	0007a703          	lw	a4,0(a5)
    8000619c:	00070863          	beqz	a4,800061ac <fork+0x68>
    800061a0:	00c7a703          	lw	a4,12(a5)
    800061a4:	00b71463          	bne	a4,a1,800061ac <fork+0x68>
    800061a8:	0016061b          	addw	a2,a2,1
    800061ac:	0c878793          	add	a5,a5,200
    800061b0:	fef694e3          	bne	a3,a5,80006198 <fork+0x54>
    800061b4:	0f50000f          	fence	iorw,ow
    800061b8:	0804202f          	amoswap.w	zero,zero,(s0)
    800061bc:	00300793          	li	a5,3
    800061c0:	0ec7c263          	blt	a5,a2,800062a4 <fork+0x160>
    800061c4:	f50ff0ef          	jal	80005914 <alloc_proc>
    800061c8:	00050493          	mv	s1,a0
    800061cc:	12050a63          	beqz	a0,80006300 <fork+0x1bc>
    800061d0:	00c92783          	lw	a5,12(s2)
    800061d4:	01853583          	ld	a1,24(a0)
    800061d8:	02093603          	ld	a2,32(s2)
    800061dc:	01893503          	ld	a0,24(s2)
    800061e0:	00f4a623          	sw	a5,12(s1)
    800061e4:	de9fe0ef          	jal	80004fcc <uvmcopy>
    800061e8:	0e054463          	bltz	a0,800062d0 <fork+0x18c>
    800061ec:	02093783          	ld	a5,32(s2)
    800061f0:	00100713          	li	a4,1
    800061f4:	02f4b023          	sd	a5,32(s1)
    800061f8:	00070793          	mv	a5,a4
    800061fc:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80006200:	0007879b          	sext.w	a5,a5
    80006204:	fe079ae3          	bnez	a5,800061f8 <fork+0xb4>
    80006208:	00492783          	lw	a5,4(s2)
    8000620c:	0b24b823          	sd	s2,176(s1)
    80006210:	00f4a423          	sw	a5,8(s1)
    80006214:	0f50000f          	fence	iorw,ow
    80006218:	0804202f          	amoswap.w	zero,zero,(s0)
    8000621c:	03093783          	ld	a5,48(s2)
    80006220:	02078663          	beqz	a5,8000624c <fork+0x108>
    80006224:	0304b703          	ld	a4,48(s1)
    80006228:	02070263          	beqz	a4,8000624c <fork+0x108>
    8000622c:	11078613          	add	a2,a5,272
    80006230:	0007c683          	lbu	a3,0(a5)
    80006234:	00178793          	add	a5,a5,1
    80006238:	00170713          	add	a4,a4,1
    8000623c:	fed70fa3          	sb	a3,-1(a4)
    80006240:	fec798e3          	bne	a5,a2,80006230 <fork+0xec>
    80006244:	0304b783          	ld	a5,48(s1)
    80006248:	0407b823          	sd	zero,80(a5)
    8000624c:	00100713          	li	a4,1
    80006250:	00070793          	mv	a5,a4
    80006254:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80006258:	0007879b          	sext.w	a5,a5
    8000625c:	fe079ae3          	bnez	a5,80006250 <fork+0x10c>
    80006260:	00200793          	li	a5,2
    80006264:	00f4a023          	sw	a5,0(s1)
    80006268:	0f50000f          	fence	iorw,ow
    8000626c:	0804202f          	amoswap.w	zero,zero,(s0)
    80006270:	00c4a683          	lw	a3,12(s1)
    80006274:	00492603          	lw	a2,4(s2)
    80006278:	0044a583          	lw	a1,4(s1)
    8000627c:	00004517          	auipc	a0,0x4
    80006280:	32450513          	add	a0,a0,804 # 8000a5a0 <digits+0xc40>
    80006284:	cd8fc0ef          	jal	8000275c <printf>
    80006288:	01813083          	ld	ra,24(sp)
    8000628c:	01013403          	ld	s0,16(sp)
    80006290:	0044a503          	lw	a0,4(s1)
    80006294:	00013903          	ld	s2,0(sp)
    80006298:	00813483          	ld	s1,8(sp)
    8000629c:	02010113          	add	sp,sp,32
    800062a0:	00008067          	ret
    800062a4:	00400693          	li	a3,4
    800062a8:	00004517          	auipc	a0,0x4
    800062ac:	1d050513          	add	a0,a0,464 # 8000a478 <digits+0xb18>
    800062b0:	cacfc0ef          	jal	8000275c <printf>
    800062b4:	fff00513          	li	a0,-1
    800062b8:	01813083          	ld	ra,24(sp)
    800062bc:	01013403          	ld	s0,16(sp)
    800062c0:	00813483          	ld	s1,8(sp)
    800062c4:	00013903          	ld	s2,0(sp)
    800062c8:	02010113          	add	sp,sp,32
    800062cc:	00008067          	ret
    800062d0:	00004517          	auipc	a0,0x4
    800062d4:	2a850513          	add	a0,a0,680 # 8000a578 <digits+0xc18>
    800062d8:	ff4fc0ef          	jal	80002acc <uart_puts>
    800062dc:	00048513          	mv	a0,s1
    800062e0:	ff4ff0ef          	jal	80005ad4 <free_proc>
    800062e4:	fff00513          	li	a0,-1
    800062e8:	fd1ff06f          	j	800062b8 <fork+0x174>
    800062ec:	00004517          	auipc	a0,0x4
    800062f0:	23450513          	add	a0,a0,564 # 8000a520 <digits+0xbc0>
    800062f4:	fd8fc0ef          	jal	80002acc <uart_puts>
    800062f8:	fff00513          	li	a0,-1
    800062fc:	fbdff06f          	j	800062b8 <fork+0x174>
    80006300:	00004517          	auipc	a0,0x4
    80006304:	24850513          	add	a0,a0,584 # 8000a548 <digits+0xbe8>
    80006308:	fc4fc0ef          	jal	80002acc <uart_puts>
    8000630c:	fff00513          	li	a0,-1
    80006310:	fa9ff06f          	j	800062b8 <fork+0x174>

0000000080006314 <growproc>:
    80006314:	ff010113          	add	sp,sp,-16
    80006318:	00813023          	sd	s0,0(sp)
    8000631c:	00113423          	sd	ra,8(sp)
    80006320:	00420417          	auipc	s0,0x420
    80006324:	0d043403          	ld	s0,208(s0) # 804263f0 <current_proc>
    80006328:	04040063          	beqz	s0,80006368 <growproc+0x54>
    8000632c:	02043583          	ld	a1,32(s0)
    80006330:	00050613          	mv	a2,a0
    80006334:	02a04063          	bgtz	a0,80006354 <growproc+0x40>
    80006338:	02051c63          	bnez	a0,80006370 <growproc+0x5c>
    8000633c:	02b43023          	sd	a1,32(s0)
    80006340:	00000513          	li	a0,0
    80006344:	00813083          	ld	ra,8(sp)
    80006348:	00013403          	ld	s0,0(sp)
    8000634c:	01010113          	add	sp,sp,16
    80006350:	00008067          	ret
    80006354:	01843503          	ld	a0,24(s0)
    80006358:	00b60633          	add	a2,a2,a1
    8000635c:	eacfe0ef          	jal	80004a08 <uvmalloc>
    80006360:	00050593          	mv	a1,a0
    80006364:	fc051ce3          	bnez	a0,8000633c <growproc+0x28>
    80006368:	fff00513          	li	a0,-1
    8000636c:	fd9ff06f          	j	80006344 <growproc+0x30>
    80006370:	01843503          	ld	a0,24(s0)
    80006374:	00b60633          	add	a2,a2,a1
    80006378:	e18fe0ef          	jal	80004990 <uvmdealloc>
    8000637c:	00050593          	mv	a1,a0
    80006380:	fbdff06f          	j	8000633c <growproc+0x28>

0000000080006384 <exit>:
    80006384:	00420697          	auipc	a3,0x420
    80006388:	06c6b683          	ld	a3,108(a3) # 804263f0 <current_proc>
    8000638c:	08068e63          	beqz	a3,80006428 <exit+0xa4>
    80006390:	ff010113          	add	sp,sp,-16
    80006394:	00813023          	sd	s0,0(sp)
    80006398:	00113423          	sd	ra,8(sp)
    8000639c:	00050613          	mv	a2,a0
    800063a0:	00420417          	auipc	s0,0x420
    800063a4:	04840413          	add	s0,s0,72 # 804263e8 <proc_lock>
    800063a8:	00100713          	li	a4,1
    800063ac:	00070793          	mv	a5,a4
    800063b0:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800063b4:	0007879b          	sext.w	a5,a5
    800063b8:	fe079ae3          	bnez	a5,800063ac <exit+0x28>
    800063bc:	00500793          	li	a5,5
    800063c0:	00f6a023          	sw	a5,0(a3)
    800063c4:	00c6a823          	sw	a2,16(a3)
    800063c8:	0041f797          	auipc	a5,0x41f
    800063cc:	40878793          	add	a5,a5,1032 # 804257d0 <proc+0xb0>
    800063d0:	00420597          	auipc	a1,0x420
    800063d4:	08058593          	add	a1,a1,128 # 80426450 <bss_end+0x58>
    800063d8:	00100513          	li	a0,1
    800063dc:	00c0006f          	j	800063e8 <exit+0x64>
    800063e0:	0c878793          	add	a5,a5,200
    800063e4:	00b78e63          	beq	a5,a1,80006400 <exit+0x7c>
    800063e8:	0007b703          	ld	a4,0(a5)
    800063ec:	fed71ae3          	bne	a4,a3,800063e0 <exit+0x5c>
    800063f0:	0007b023          	sd	zero,0(a5)
    800063f4:	f4a7ac23          	sw	a0,-168(a5)
    800063f8:	0c878793          	add	a5,a5,200
    800063fc:	feb796e3          	bne	a5,a1,800063e8 <exit+0x64>
    80006400:	0046a583          	lw	a1,4(a3)
    80006404:	00004517          	auipc	a0,0x4
    80006408:	1d450513          	add	a0,a0,468 # 8000a5d8 <digits+0xc78>
    8000640c:	b50fc0ef          	jal	8000275c <printf>
    80006410:	0f50000f          	fence	iorw,ow
    80006414:	0804202f          	amoswap.w	zero,zero,(s0)
    80006418:	00013403          	ld	s0,0(sp)
    8000641c:	00813083          	ld	ra,8(sp)
    80006420:	01010113          	add	sp,sp,16
    80006424:	c71ff06f          	j	80006094 <yield>
    80006428:	00008067          	ret

000000008000642c <wait>:
    8000642c:	fb010113          	add	sp,sp,-80
    80006430:	01813023          	sd	s8,0(sp)
    80006434:	00420c17          	auipc	s8,0x420
    80006438:	fbcc0c13          	add	s8,s8,-68 # 804263f0 <current_proc>
    8000643c:	02913c23          	sd	s1,56(sp)
    80006440:	000c3483          	ld	s1,0(s8)
    80006444:	04113423          	sd	ra,72(sp)
    80006448:	04813023          	sd	s0,64(sp)
    8000644c:	03213823          	sd	s2,48(sp)
    80006450:	03313423          	sd	s3,40(sp)
    80006454:	03413023          	sd	s4,32(sp)
    80006458:	01513c23          	sd	s5,24(sp)
    8000645c:	01613823          	sd	s6,16(sp)
    80006460:	01713423          	sd	s7,8(sp)
    80006464:	10048063          	beqz	s1,80006564 <wait+0x138>
    80006468:	00050913          	mv	s2,a0
    8000646c:	00420417          	auipc	s0,0x420
    80006470:	f7c40413          	add	s0,s0,-132 # 804263e8 <proc_lock>
    80006474:	00100a13          	li	s4,1
    80006478:	00500b93          	li	s7,5
    8000647c:	01000a93          	li	s5,16
    80006480:	00420b17          	auipc	s6,0x420
    80006484:	f20b0b13          	add	s6,s6,-224 # 804263a0 <read_count>
    80006488:	00400993          	li	s3,4
    8000648c:	000a0793          	mv	a5,s4
    80006490:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80006494:	0007879b          	sext.w	a5,a5
    80006498:	fe079ae3          	bnez	a5,8000648c <wait+0x60>
    8000649c:	0041f797          	auipc	a5,0x41f
    800064a0:	28478793          	add	a5,a5,644 # 80425720 <proc>
    800064a4:	00078593          	mv	a1,a5
    800064a8:	00078713          	mv	a4,a5
    800064ac:	00000693          	li	a3,0
    800064b0:	0100006f          	j	800064c0 <wait+0x94>
    800064b4:	0016869b          	addw	a3,a3,1
    800064b8:	0c870713          	add	a4,a4,200
    800064bc:	09568863          	beq	a3,s5,8000654c <wait+0x120>
    800064c0:	0b073603          	ld	a2,176(a4)
    800064c4:	fe9618e3          	bne	a2,s1,800064b4 <wait+0x88>
    800064c8:	00072603          	lw	a2,0(a4)
    800064cc:	ff7614e3          	bne	a2,s7,800064b4 <wait+0x88>
    800064d0:	0c800793          	li	a5,200
    800064d4:	02f686b3          	mul	a3,a3,a5
    800064d8:	00d58533          	add	a0,a1,a3
    800064dc:	00452483          	lw	s1,4(a0)
    800064e0:	00090663          	beqz	s2,800064ec <wait+0xc0>
    800064e4:	01052783          	lw	a5,16(a0)
    800064e8:	00f92023          	sw	a5,0(s2)
    800064ec:	de8ff0ef          	jal	80005ad4 <free_proc>
    800064f0:	00048593          	mv	a1,s1
    800064f4:	00004517          	auipc	a0,0x4
    800064f8:	11450513          	add	a0,a0,276 # 8000a608 <digits+0xca8>
    800064fc:	a60fc0ef          	jal	8000275c <printf>
    80006500:	0f50000f          	fence	iorw,ow
    80006504:	0804202f          	amoswap.w	zero,zero,(s0)
    80006508:	04813083          	ld	ra,72(sp)
    8000650c:	04013403          	ld	s0,64(sp)
    80006510:	03013903          	ld	s2,48(sp)
    80006514:	02813983          	ld	s3,40(sp)
    80006518:	02013a03          	ld	s4,32(sp)
    8000651c:	01813a83          	ld	s5,24(sp)
    80006520:	01013b03          	ld	s6,16(sp)
    80006524:	00813b83          	ld	s7,8(sp)
    80006528:	00013c03          	ld	s8,0(sp)
    8000652c:	00048513          	mv	a0,s1
    80006530:	03813483          	ld	s1,56(sp)
    80006534:	05010113          	add	sp,sp,80
    80006538:	00008067          	ret
    8000653c:	0007a703          	lw	a4,0(a5)
    80006540:	02071663          	bnez	a4,8000656c <wait+0x140>
    80006544:	0c878793          	add	a5,a5,200
    80006548:	01678a63          	beq	a5,s6,8000655c <wait+0x130>
    8000654c:	0b07b703          	ld	a4,176(a5)
    80006550:	fe9706e3          	beq	a4,s1,8000653c <wait+0x110>
    80006554:	0c878793          	add	a5,a5,200
    80006558:	ff679ae3          	bne	a5,s6,8000654c <wait+0x120>
    8000655c:	0f50000f          	fence	iorw,ow
    80006560:	0804202f          	amoswap.w	zero,zero,(s0)
    80006564:	fff00493          	li	s1,-1
    80006568:	fa1ff06f          	j	80006508 <wait+0xdc>
    8000656c:	0f50000f          	fence	iorw,ow
    80006570:	0804202f          	amoswap.w	zero,zero,(s0)
    80006574:	000c3703          	ld	a4,0(s8)
    80006578:	f0070ae3          	beqz	a4,8000648c <wait+0x60>
    8000657c:	000a0793          	mv	a5,s4
    80006580:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    80006584:	0007879b          	sext.w	a5,a5
    80006588:	fe079ae3          	bnez	a5,8000657c <wait+0x150>
    8000658c:	01372023          	sw	s3,0(a4)
    80006590:	0a973c23          	sd	s1,184(a4)
    80006594:	0f50000f          	fence	iorw,ow
    80006598:	0804202f          	amoswap.w	zero,zero,(s0)
    8000659c:	af9ff0ef          	jal	80006094 <yield>
    800065a0:	eedff06f          	j	8000648c <wait+0x60>

00000000800065a4 <kill>:
    800065a4:	0041f597          	auipc	a1,0x41f
    800065a8:	17c58593          	add	a1,a1,380 # 80425720 <proc>
    800065ac:	00058793          	mv	a5,a1
    800065b0:	00000713          	li	a4,0
    800065b4:	01000613          	li	a2,16
    800065b8:	0100006f          	j	800065c8 <kill+0x24>
    800065bc:	0017071b          	addw	a4,a4,1
    800065c0:	0c878793          	add	a5,a5,200
    800065c4:	06c70263          	beq	a4,a2,80006628 <kill+0x84>
    800065c8:	0047a683          	lw	a3,4(a5)
    800065cc:	fea698e3          	bne	a3,a0,800065bc <kill+0x18>
    800065d0:	0007a683          	lw	a3,0(a5)
    800065d4:	fe0684e3          	beqz	a3,800065bc <kill+0x18>
    800065d8:	00420697          	auipc	a3,0x420
    800065dc:	e1068693          	add	a3,a3,-496 # 804263e8 <proc_lock>
    800065e0:	00100613          	li	a2,1
    800065e4:	00060793          	mv	a5,a2
    800065e8:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    800065ec:	0007879b          	sext.w	a5,a5
    800065f0:	fe079ae3          	bnez	a5,800065e4 <kill+0x40>
    800065f4:	0c800793          	li	a5,200
    800065f8:	02f70733          	mul	a4,a4,a5
    800065fc:	00100613          	li	a2,1
    80006600:	00400793          	li	a5,4
    80006604:	00e585b3          	add	a1,a1,a4
    80006608:	0005a703          	lw	a4,0(a1)
    8000660c:	00c5aa23          	sw	a2,20(a1)
    80006610:	00f71663          	bne	a4,a5,8000661c <kill+0x78>
    80006614:	00200793          	li	a5,2
    80006618:	00f5a023          	sw	a5,0(a1)
    8000661c:	0f50000f          	fence	iorw,ow
    80006620:	0806a02f          	amoswap.w	zero,zero,(a3)
    80006624:	00008067          	ret
    80006628:	00008067          	ret

000000008000662c <sleep>:
    8000662c:	00420617          	auipc	a2,0x420
    80006630:	dc463603          	ld	a2,-572(a2) # 804263f0 <current_proc>
    80006634:	02060c63          	beqz	a2,8000666c <sleep+0x40>
    80006638:	00420717          	auipc	a4,0x420
    8000663c:	db070713          	add	a4,a4,-592 # 804263e8 <proc_lock>
    80006640:	00100693          	li	a3,1
    80006644:	00068793          	mv	a5,a3
    80006648:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    8000664c:	0007879b          	sext.w	a5,a5
    80006650:	fe079ae3          	bnez	a5,80006644 <sleep+0x18>
    80006654:	00400793          	li	a5,4
    80006658:	00f62023          	sw	a5,0(a2)
    8000665c:	0aa63c23          	sd	a0,184(a2)
    80006660:	0f50000f          	fence	iorw,ow
    80006664:	0807202f          	amoswap.w	zero,zero,(a4)
    80006668:	a2dff06f          	j	80006094 <yield>
    8000666c:	00008067          	ret

0000000080006670 <wakeup>:
    80006670:	00420697          	auipc	a3,0x420
    80006674:	d7868693          	add	a3,a3,-648 # 804263e8 <proc_lock>
    80006678:	00100713          	li	a4,1
    8000667c:	00070793          	mv	a5,a4
    80006680:	0cf6a7af          	amoswap.w.aq	a5,a5,(a3)
    80006684:	0007879b          	sext.w	a5,a5
    80006688:	fe079ae3          	bnez	a5,8000667c <wakeup+0xc>
    8000668c:	0041f797          	auipc	a5,0x41f
    80006690:	09478793          	add	a5,a5,148 # 80425720 <proc>
    80006694:	00420597          	auipc	a1,0x420
    80006698:	d0c58593          	add	a1,a1,-756 # 804263a0 <read_count>
    8000669c:	00400613          	li	a2,4
    800066a0:	00200813          	li	a6,2
    800066a4:	00c0006f          	j	800066b0 <wakeup+0x40>
    800066a8:	0c878793          	add	a5,a5,200
    800066ac:	02f58063          	beq	a1,a5,800066cc <wakeup+0x5c>
    800066b0:	0007a703          	lw	a4,0(a5)
    800066b4:	fec71ae3          	bne	a4,a2,800066a8 <wakeup+0x38>
    800066b8:	0b87b703          	ld	a4,184(a5)
    800066bc:	fea716e3          	bne	a4,a0,800066a8 <wakeup+0x38>
    800066c0:	0107a023          	sw	a6,0(a5)
    800066c4:	0c878793          	add	a5,a5,200
    800066c8:	fef594e3          	bne	a1,a5,800066b0 <wakeup+0x40>
    800066cc:	0f50000f          	fence	iorw,ow
    800066d0:	0806a02f          	amoswap.w	zero,zero,(a3)
    800066d4:	00008067          	ret

00000000800066d8 <wakeup_one>:
    800066d8:	00420617          	auipc	a2,0x420
    800066dc:	d1060613          	add	a2,a2,-752 # 804263e8 <proc_lock>
    800066e0:	00100713          	li	a4,1
    800066e4:	00070793          	mv	a5,a4
    800066e8:	0cf627af          	amoswap.w.aq	a5,a5,(a2)
    800066ec:	0007879b          	sext.w	a5,a5
    800066f0:	fe079ae3          	bnez	a5,800066e4 <wakeup_one+0xc>
    800066f4:	0041f897          	auipc	a7,0x41f
    800066f8:	02c88893          	add	a7,a7,44 # 80425720 <proc>
    800066fc:	00088793          	mv	a5,a7
    80006700:	00000713          	li	a4,0
    80006704:	00400593          	li	a1,4
    80006708:	01000813          	li	a6,16
    8000670c:	0100006f          	j	8000671c <wakeup_one+0x44>
    80006710:	0017071b          	addw	a4,a4,1
    80006714:	0c878793          	add	a5,a5,200
    80006718:	03070463          	beq	a4,a6,80006740 <wakeup_one+0x68>
    8000671c:	0007a683          	lw	a3,0(a5)
    80006720:	feb698e3          	bne	a3,a1,80006710 <wakeup_one+0x38>
    80006724:	0b87b683          	ld	a3,184(a5)
    80006728:	fea694e3          	bne	a3,a0,80006710 <wakeup_one+0x38>
    8000672c:	0c800793          	li	a5,200
    80006730:	02f70733          	mul	a4,a4,a5
    80006734:	00200793          	li	a5,2
    80006738:	00e888b3          	add	a7,a7,a4
    8000673c:	00f8a023          	sw	a5,0(a7)
    80006740:	0f50000f          	fence	iorw,ow
    80006744:	0806202f          	amoswap.w	zero,zero,(a2)
    80006748:	00008067          	ret

000000008000674c <sem_init>:
    8000674c:	00050a63          	beqz	a0,80006760 <sem_init+0x14>
    80006750:	00b52023          	sw	a1,0(a0)
    80006754:	00a53423          	sd	a0,8(a0)
    80006758:	00053823          	sd	zero,16(a0)
    8000675c:	00053c23          	sd	zero,24(a0)
    80006760:	00008067          	ret

0000000080006764 <sem_wait>:
    80006764:	10050c63          	beqz	a0,8000687c <sem_wait+0x118>
    80006768:	fc010113          	add	sp,sp,-64
    8000676c:	01313c23          	sd	s3,24(sp)
    80006770:	02113c23          	sd	ra,56(sp)
    80006774:	02813823          	sd	s0,48(sp)
    80006778:	02913423          	sd	s1,40(sp)
    8000677c:	03213023          	sd	s2,32(sp)
    80006780:	01413823          	sd	s4,16(sp)
    80006784:	01513423          	sd	s5,8(sp)
    80006788:	00420997          	auipc	s3,0x420
    8000678c:	c689b983          	ld	s3,-920(s3) # 804263f0 <current_proc>
    80006790:	0a098e63          	beqz	s3,8000684c <sem_wait+0xe8>
    80006794:	00050913          	mv	s2,a0
    80006798:	00420417          	auipc	s0,0x420
    8000679c:	c5040413          	add	s0,s0,-944 # 804263e8 <proc_lock>
    800067a0:	00100713          	li	a4,1
    800067a4:	00070793          	mv	a5,a4
    800067a8:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800067ac:	0007879b          	sext.w	a5,a5
    800067b0:	fe079ae3          	bnez	a5,800067a4 <sem_wait+0x40>
    800067b4:	00092783          	lw	a5,0(s2)
    800067b8:	06f04a63          	bgtz	a5,8000682c <sem_wait+0xc8>
    800067bc:	00400a93          	li	s5,4
    800067c0:	00004a17          	auipc	s4,0x4
    800067c4:	e68a0a13          	add	s4,s4,-408 # 8000a628 <digits+0xcc8>
    800067c8:	00100493          	li	s1,1
    800067cc:	bacfc0ef          	jal	80002b78 <alloc_page>
    800067d0:	00050e63          	beqz	a0,800067ec <sem_wait+0x88>
    800067d4:	01893783          	ld	a5,24(s2)
    800067d8:	01353023          	sd	s3,0(a0)
    800067dc:	00053423          	sd	zero,8(a0)
    800067e0:	08078863          	beqz	a5,80006870 <sem_wait+0x10c>
    800067e4:	00a7b423          	sd	a0,8(a5)
    800067e8:	00a93c23          	sd	a0,24(s2)
    800067ec:	00893783          	ld	a5,8(s2)
    800067f0:	0159a023          	sw	s5,0(s3)
    800067f4:	0af9bc23          	sd	a5,184(s3)
    800067f8:	0f50000f          	fence	iorw,ow
    800067fc:	0804202f          	amoswap.w	zero,zero,(s0)
    80006800:	00092603          	lw	a2,0(s2)
    80006804:	0049a583          	lw	a1,4(s3)
    80006808:	000a0513          	mv	a0,s4
    8000680c:	f51fb0ef          	jal	8000275c <printf>
    80006810:	885ff0ef          	jal	80006094 <yield>
    80006814:	00048793          	mv	a5,s1
    80006818:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    8000681c:	0007879b          	sext.w	a5,a5
    80006820:	fe079ae3          	bnez	a5,80006814 <sem_wait+0xb0>
    80006824:	00092783          	lw	a5,0(s2)
    80006828:	faf052e3          	blez	a5,800067cc <sem_wait+0x68>
    8000682c:	0049a583          	lw	a1,4(s3)
    80006830:	fff7861b          	addw	a2,a5,-1
    80006834:	00c92023          	sw	a2,0(s2)
    80006838:	00004517          	auipc	a0,0x4
    8000683c:	e2050513          	add	a0,a0,-480 # 8000a658 <digits+0xcf8>
    80006840:	f1dfb0ef          	jal	8000275c <printf>
    80006844:	0f50000f          	fence	iorw,ow
    80006848:	0804202f          	amoswap.w	zero,zero,(s0)
    8000684c:	03813083          	ld	ra,56(sp)
    80006850:	03013403          	ld	s0,48(sp)
    80006854:	02813483          	ld	s1,40(sp)
    80006858:	02013903          	ld	s2,32(sp)
    8000685c:	01813983          	ld	s3,24(sp)
    80006860:	01013a03          	ld	s4,16(sp)
    80006864:	00813a83          	ld	s5,8(sp)
    80006868:	04010113          	add	sp,sp,64
    8000686c:	00008067          	ret
    80006870:	00a93c23          	sd	a0,24(s2)
    80006874:	00a93823          	sd	a0,16(s2)
    80006878:	f75ff06f          	j	800067ec <sem_wait+0x88>
    8000687c:	00008067          	ret

0000000080006880 <sem_post>:
    80006880:	08050e63          	beqz	a0,8000691c <sem_post+0x9c>
    80006884:	fe010113          	add	sp,sp,-32
    80006888:	00813823          	sd	s0,16(sp)
    8000688c:	00913423          	sd	s1,8(sp)
    80006890:	00113c23          	sd	ra,24(sp)
    80006894:	01213023          	sd	s2,0(sp)
    80006898:	00050493          	mv	s1,a0
    8000689c:	00420417          	auipc	s0,0x420
    800068a0:	b4c40413          	add	s0,s0,-1204 # 804263e8 <proc_lock>
    800068a4:	00100713          	li	a4,1
    800068a8:	00070793          	mv	a5,a4
    800068ac:	0cf427af          	amoswap.w.aq	a5,a5,(s0)
    800068b0:	0007879b          	sext.w	a5,a5
    800068b4:	fe079ae3          	bnez	a5,800068a8 <sem_post+0x28>
    800068b8:	0004a583          	lw	a1,0(s1)
    800068bc:	00004517          	auipc	a0,0x4
    800068c0:	dcc50513          	add	a0,a0,-564 # 8000a688 <digits+0xd28>
    800068c4:	0015859b          	addw	a1,a1,1
    800068c8:	00b4a023          	sw	a1,0(s1)
    800068cc:	e91fb0ef          	jal	8000275c <printf>
    800068d0:	0104b503          	ld	a0,16(s1)
    800068d4:	02050463          	beqz	a0,800068fc <sem_post+0x7c>
    800068d8:	00853783          	ld	a5,8(a0)
    800068dc:	00053903          	ld	s2,0(a0)
    800068e0:	00f4b823          	sd	a5,16(s1)
    800068e4:	02078e63          	beqz	a5,80006920 <sem_post+0xa0>
    800068e8:	aacfc0ef          	jal	80002b94 <free_page>
    800068ec:	00090863          	beqz	s2,800068fc <sem_post+0x7c>
    800068f0:	00092703          	lw	a4,0(s2)
    800068f4:	00400793          	li	a5,4
    800068f8:	02f70c63          	beq	a4,a5,80006930 <sem_post+0xb0>
    800068fc:	0f50000f          	fence	iorw,ow
    80006900:	0804202f          	amoswap.w	zero,zero,(s0)
    80006904:	01813083          	ld	ra,24(sp)
    80006908:	01013403          	ld	s0,16(sp)
    8000690c:	00813483          	ld	s1,8(sp)
    80006910:	00013903          	ld	s2,0(sp)
    80006914:	02010113          	add	sp,sp,32
    80006918:	00008067          	ret
    8000691c:	00008067          	ret
    80006920:	0004bc23          	sd	zero,24(s1)
    80006924:	a70fc0ef          	jal	80002b94 <free_page>
    80006928:	fc0914e3          	bnez	s2,800068f0 <sem_post+0x70>
    8000692c:	fd1ff06f          	j	800068fc <sem_post+0x7c>
    80006930:	0b893703          	ld	a4,184(s2)
    80006934:	0084b783          	ld	a5,8(s1)
    80006938:	fcf712e3          	bne	a4,a5,800068fc <sem_post+0x7c>
    8000693c:	00492583          	lw	a1,4(s2)
    80006940:	00200793          	li	a5,2
    80006944:	00f92023          	sw	a5,0(s2)
    80006948:	0a093c23          	sd	zero,184(s2)
    8000694c:	00004517          	auipc	a0,0x4
    80006950:	d6c50513          	add	a0,a0,-660 # 8000a6b8 <digits+0xd58>
    80006954:	e09fb0ef          	jal	8000275c <printf>
    80006958:	fa5ff06f          	j	800068fc <sem_post+0x7c>

000000008000695c <sem_trywait>:
    8000695c:	04050463          	beqz	a0,800069a4 <sem_trywait+0x48>
    80006960:	00420717          	auipc	a4,0x420
    80006964:	a8870713          	add	a4,a4,-1400 # 804263e8 <proc_lock>
    80006968:	00100693          	li	a3,1
    8000696c:	00068793          	mv	a5,a3
    80006970:	0cf727af          	amoswap.w.aq	a5,a5,(a4)
    80006974:	0007879b          	sext.w	a5,a5
    80006978:	fe079ae3          	bnez	a5,8000696c <sem_trywait+0x10>
    8000697c:	00052783          	lw	a5,0(a0)
    80006980:	00f05e63          	blez	a5,8000699c <sem_trywait+0x40>
    80006984:	fff7879b          	addw	a5,a5,-1
    80006988:	00f52023          	sw	a5,0(a0)
    8000698c:	0f50000f          	fence	iorw,ow
    80006990:	0807202f          	amoswap.w	zero,zero,(a4)
    80006994:	00000513          	li	a0,0
    80006998:	00008067          	ret
    8000699c:	0f50000f          	fence	iorw,ow
    800069a0:	0807202f          	amoswap.w	zero,zero,(a4)
    800069a4:	fff00513          	li	a0,-1
    800069a8:	00008067          	ret
    800069ac:	0000                	.2byte	0x0
	...

00000000800069b0 <machinevec>:
    800069b0:	f0810113          	add	sp,sp,-248
    800069b4:	00113023          	sd	ra,0(sp)
    800069b8:	00313823          	sd	gp,16(sp)
    800069bc:	00413c23          	sd	tp,24(sp)
    800069c0:	02513023          	sd	t0,32(sp)
    800069c4:	02613423          	sd	t1,40(sp)
    800069c8:	02713823          	sd	t2,48(sp)
    800069cc:	02813c23          	sd	s0,56(sp)
    800069d0:	04913023          	sd	s1,64(sp)
    800069d4:	04a13423          	sd	a0,72(sp)
    800069d8:	04b13823          	sd	a1,80(sp)
    800069dc:	04c13c23          	sd	a2,88(sp)
    800069e0:	06d13023          	sd	a3,96(sp)
    800069e4:	06e13423          	sd	a4,104(sp)
    800069e8:	06f13823          	sd	a5,112(sp)
    800069ec:	07013c23          	sd	a6,120(sp)
    800069f0:	09113023          	sd	a7,128(sp)
    800069f4:	09213423          	sd	s2,136(sp)
    800069f8:	09313823          	sd	s3,144(sp)
    800069fc:	09413c23          	sd	s4,152(sp)
    80006a00:	0b513023          	sd	s5,160(sp)
    80006a04:	0b613423          	sd	s6,168(sp)
    80006a08:	0b713823          	sd	s7,176(sp)
    80006a0c:	0b813c23          	sd	s8,184(sp)
    80006a10:	0d913023          	sd	s9,192(sp)
    80006a14:	0da13423          	sd	s10,200(sp)
    80006a18:	0db13823          	sd	s11,208(sp)
    80006a1c:	0dc13c23          	sd	t3,216(sp)
    80006a20:	0fd13023          	sd	t4,224(sp)
    80006a24:	0fe13423          	sd	t5,232(sp)
    80006a28:	0ff13823          	sd	t6,240(sp)
    80006a2c:	0f810293          	add	t0,sp,248
    80006a30:	00513423          	sd	t0,8(sp)
    80006a34:	34202573          	csrr	a0,mcause
    80006a38:	fff0029b          	addw	t0,zero,-1
    80006a3c:	03f29293          	sll	t0,t0,0x3f
    80006a40:	00728293          	add	t0,t0,7
    80006a44:	00551663          	bne	a0,t0,80006a50 <interrupt_return>
    80006a48:	eecfe0ef          	jal	80005134 <machine_timer_handler>
    80006a4c:	0040006f          	j	80006a50 <interrupt_return>

0000000080006a50 <interrupt_return>:
    80006a50:	00013083          	ld	ra,0(sp)
    80006a54:	01013183          	ld	gp,16(sp)
    80006a58:	01813203          	ld	tp,24(sp)
    80006a5c:	02013283          	ld	t0,32(sp)
    80006a60:	02813303          	ld	t1,40(sp)
    80006a64:	03013383          	ld	t2,48(sp)
    80006a68:	03813403          	ld	s0,56(sp)
    80006a6c:	04013483          	ld	s1,64(sp)
    80006a70:	04813503          	ld	a0,72(sp)
    80006a74:	05013583          	ld	a1,80(sp)
    80006a78:	05813603          	ld	a2,88(sp)
    80006a7c:	06013683          	ld	a3,96(sp)
    80006a80:	06813703          	ld	a4,104(sp)
    80006a84:	07013783          	ld	a5,112(sp)
    80006a88:	07813803          	ld	a6,120(sp)
    80006a8c:	08013883          	ld	a7,128(sp)
    80006a90:	08813903          	ld	s2,136(sp)
    80006a94:	09013983          	ld	s3,144(sp)
    80006a98:	09813a03          	ld	s4,152(sp)
    80006a9c:	0a013a83          	ld	s5,160(sp)
    80006aa0:	0a813b03          	ld	s6,168(sp)
    80006aa4:	0b013b83          	ld	s7,176(sp)
    80006aa8:	0b813c03          	ld	s8,184(sp)
    80006aac:	0c013c83          	ld	s9,192(sp)
    80006ab0:	0c813d03          	ld	s10,200(sp)
    80006ab4:	0d013d83          	ld	s11,208(sp)
    80006ab8:	0d813e03          	ld	t3,216(sp)
    80006abc:	0e013e83          	ld	t4,224(sp)
    80006ac0:	0e813f03          	ld	t5,232(sp)
    80006ac4:	0f013f83          	ld	t6,240(sp)
    80006ac8:	00813103          	ld	sp,8(sp)
    80006acc:	30200073          	mret

0000000080006ad0 <kernelvec>:
    80006ad0:	ef010113          	add	sp,sp,-272
    80006ad4:	00013023          	sd	zero,0(sp)
    80006ad8:	00113423          	sd	ra,8(sp)
    80006adc:	00313c23          	sd	gp,24(sp)
    80006ae0:	02413023          	sd	tp,32(sp)
    80006ae4:	02513423          	sd	t0,40(sp)
    80006ae8:	02613823          	sd	t1,48(sp)
    80006aec:	02713c23          	sd	t2,56(sp)
    80006af0:	04813023          	sd	s0,64(sp)
    80006af4:	04913423          	sd	s1,72(sp)
    80006af8:	04a13823          	sd	a0,80(sp)
    80006afc:	04b13c23          	sd	a1,88(sp)
    80006b00:	06c13023          	sd	a2,96(sp)
    80006b04:	06d13423          	sd	a3,104(sp)
    80006b08:	06e13823          	sd	a4,112(sp)
    80006b0c:	06f13c23          	sd	a5,120(sp)
    80006b10:	09013023          	sd	a6,128(sp)
    80006b14:	09113423          	sd	a7,136(sp)
    80006b18:	09213823          	sd	s2,144(sp)
    80006b1c:	09313c23          	sd	s3,152(sp)
    80006b20:	0b413023          	sd	s4,160(sp)
    80006b24:	0b513423          	sd	s5,168(sp)
    80006b28:	0b613823          	sd	s6,176(sp)
    80006b2c:	0b713c23          	sd	s7,184(sp)
    80006b30:	0d813023          	sd	s8,192(sp)
    80006b34:	0d913423          	sd	s9,200(sp)
    80006b38:	0da13823          	sd	s10,208(sp)
    80006b3c:	0db13c23          	sd	s11,216(sp)
    80006b40:	0fc13023          	sd	t3,224(sp)
    80006b44:	0fd13423          	sd	t4,232(sp)
    80006b48:	0fe13823          	sd	t5,240(sp)
    80006b4c:	0ff13c23          	sd	t6,248(sp)
    80006b50:	11010293          	add	t0,sp,272
    80006b54:	00513823          	sd	t0,16(sp)
    80006b58:	141022f3          	csrr	t0,sepc
    80006b5c:	10513023          	sd	t0,256(sp)
    80006b60:	142022f3          	csrr	t0,scause
    80006b64:	10513423          	sd	t0,264(sp)
    80006b68:	c69fe0ef          	jal	800057d0 <kerneltrap>
    80006b6c:	00813083          	ld	ra,8(sp)
    80006b70:	01813183          	ld	gp,24(sp)
    80006b74:	02013203          	ld	tp,32(sp)
    80006b78:	02813283          	ld	t0,40(sp)
    80006b7c:	03013303          	ld	t1,48(sp)
    80006b80:	03813383          	ld	t2,56(sp)
    80006b84:	04013403          	ld	s0,64(sp)
    80006b88:	04813483          	ld	s1,72(sp)
    80006b8c:	05013503          	ld	a0,80(sp)
    80006b90:	05813583          	ld	a1,88(sp)
    80006b94:	06013603          	ld	a2,96(sp)
    80006b98:	06813683          	ld	a3,104(sp)
    80006b9c:	07013703          	ld	a4,112(sp)
    80006ba0:	07813783          	ld	a5,120(sp)
    80006ba4:	08013803          	ld	a6,128(sp)
    80006ba8:	08813883          	ld	a7,136(sp)
    80006bac:	09013903          	ld	s2,144(sp)
    80006bb0:	09813983          	ld	s3,152(sp)
    80006bb4:	0a013a03          	ld	s4,160(sp)
    80006bb8:	0a813a83          	ld	s5,168(sp)
    80006bbc:	0b013b03          	ld	s6,176(sp)
    80006bc0:	0b813b83          	ld	s7,184(sp)
    80006bc4:	0c013c03          	ld	s8,192(sp)
    80006bc8:	0c813c83          	ld	s9,200(sp)
    80006bcc:	0d013d03          	ld	s10,208(sp)
    80006bd0:	0d813d83          	ld	s11,216(sp)
    80006bd4:	0e013e03          	ld	t3,224(sp)
    80006bd8:	0e813e83          	ld	t4,232(sp)
    80006bdc:	0f013f03          	ld	t5,240(sp)
    80006be0:	0f813f83          	ld	t6,248(sp)
    80006be4:	10013283          	ld	t0,256(sp)
    80006be8:	14129073          	csrw	sepc,t0
    80006bec:	10813283          	ld	t0,264(sp)
    80006bf0:	14229073          	csrw	scause,t0
    80006bf4:	01013103          	ld	sp,16(sp)
    80006bf8:	10200073          	sret
    80006bfc:	0000                	.2byte	0x0
	...

0000000080006c00 <uservec>:
    80006c00:	00010293          	mv	t0,sp
    80006c04:	ef010113          	add	sp,sp,-272
    80006c08:	00513823          	sd	t0,16(sp)
    80006c0c:	00113423          	sd	ra,8(sp)
    80006c10:	00313c23          	sd	gp,24(sp)
    80006c14:	02413023          	sd	tp,32(sp)
    80006c18:	02513423          	sd	t0,40(sp)
    80006c1c:	02613823          	sd	t1,48(sp)
    80006c20:	02713c23          	sd	t2,56(sp)
    80006c24:	04813023          	sd	s0,64(sp)
    80006c28:	04913423          	sd	s1,72(sp)
    80006c2c:	04a13823          	sd	a0,80(sp)
    80006c30:	04b13c23          	sd	a1,88(sp)
    80006c34:	06c13023          	sd	a2,96(sp)
    80006c38:	06d13423          	sd	a3,104(sp)
    80006c3c:	06e13823          	sd	a4,112(sp)
    80006c40:	06f13c23          	sd	a5,120(sp)
    80006c44:	09013023          	sd	a6,128(sp)
    80006c48:	09113423          	sd	a7,136(sp)
    80006c4c:	09213823          	sd	s2,144(sp)
    80006c50:	09313c23          	sd	s3,152(sp)
    80006c54:	0b413023          	sd	s4,160(sp)
    80006c58:	0b513423          	sd	s5,168(sp)
    80006c5c:	0b613823          	sd	s6,176(sp)
    80006c60:	0b713c23          	sd	s7,184(sp)
    80006c64:	0d813023          	sd	s8,192(sp)
    80006c68:	0d913423          	sd	s9,200(sp)
    80006c6c:	0da13823          	sd	s10,208(sp)
    80006c70:	0db13c23          	sd	s11,216(sp)
    80006c74:	0fc13023          	sd	t3,224(sp)
    80006c78:	0fd13423          	sd	t4,232(sp)
    80006c7c:	0fe13823          	sd	t5,240(sp)
    80006c80:	0ff13c23          	sd	t6,248(sp)
    80006c84:	10002373          	csrr	t1,sstatus
    80006c88:	10613023          	sd	t1,256(sp)
    80006c8c:	14102373          	csrr	t1,sepc
    80006c90:	10613423          	sd	t1,264(sp)
    80006c94:	87dfe0ef          	jal	80005510 <usertrap>
    80006c98:	00813083          	ld	ra,8(sp)
    80006c9c:	01813183          	ld	gp,24(sp)
    80006ca0:	02013203          	ld	tp,32(sp)
    80006ca4:	02813283          	ld	t0,40(sp)
    80006ca8:	03013303          	ld	t1,48(sp)
    80006cac:	03813383          	ld	t2,56(sp)
    80006cb0:	04013403          	ld	s0,64(sp)
    80006cb4:	04813483          	ld	s1,72(sp)
    80006cb8:	05013503          	ld	a0,80(sp)
    80006cbc:	05813583          	ld	a1,88(sp)
    80006cc0:	06013603          	ld	a2,96(sp)
    80006cc4:	06813683          	ld	a3,104(sp)
    80006cc8:	07013703          	ld	a4,112(sp)
    80006ccc:	07813783          	ld	a5,120(sp)
    80006cd0:	08013803          	ld	a6,128(sp)
    80006cd4:	08813883          	ld	a7,136(sp)
    80006cd8:	09013903          	ld	s2,144(sp)
    80006cdc:	09813983          	ld	s3,152(sp)
    80006ce0:	0a013a03          	ld	s4,160(sp)
    80006ce4:	0a813a83          	ld	s5,168(sp)
    80006ce8:	0b013b03          	ld	s6,176(sp)
    80006cec:	0b813b83          	ld	s7,184(sp)
    80006cf0:	0c013c03          	ld	s8,192(sp)
    80006cf4:	0c813c83          	ld	s9,200(sp)
    80006cf8:	0d013d03          	ld	s10,208(sp)
    80006cfc:	0d813d83          	ld	s11,216(sp)
    80006d00:	0e013e03          	ld	t3,224(sp)
    80006d04:	0e813e83          	ld	t4,232(sp)
    80006d08:	0f013f03          	ld	t5,240(sp)
    80006d0c:	0f813f83          	ld	t6,248(sp)
    80006d10:	10013303          	ld	t1,256(sp)
    80006d14:	10031073          	csrw	sstatus,t1
    80006d18:	10813303          	ld	t1,264(sp)
    80006d1c:	14131073          	csrw	sepc,t1
    80006d20:	01013103          	ld	sp,16(sp)
    80006d24:	10200073          	sret
	...

0000000080006d30 <switch_context>:
    80006d30:	00153023          	sd	ra,0(a0)
    80006d34:	00253423          	sd	sp,8(a0)
    80006d38:	00853823          	sd	s0,16(a0)
    80006d3c:	00953c23          	sd	s1,24(a0)
    80006d40:	03253023          	sd	s2,32(a0)
    80006d44:	03353423          	sd	s3,40(a0)
    80006d48:	03453823          	sd	s4,48(a0)
    80006d4c:	03553c23          	sd	s5,56(a0)
    80006d50:	05653023          	sd	s6,64(a0)
    80006d54:	05753423          	sd	s7,72(a0)
    80006d58:	05853823          	sd	s8,80(a0)
    80006d5c:	05953c23          	sd	s9,88(a0)
    80006d60:	07a53023          	sd	s10,96(a0)
    80006d64:	07b53423          	sd	s11,104(a0)
    80006d68:	0005b083          	ld	ra,0(a1)
    80006d6c:	0085b103          	ld	sp,8(a1)
    80006d70:	0105b403          	ld	s0,16(a1)
    80006d74:	0185b483          	ld	s1,24(a1)
    80006d78:	0205b903          	ld	s2,32(a1)
    80006d7c:	0285b983          	ld	s3,40(a1)
    80006d80:	0305ba03          	ld	s4,48(a1)
    80006d84:	0385ba83          	ld	s5,56(a1)
    80006d88:	0405bb03          	ld	s6,64(a1)
    80006d8c:	0485bb83          	ld	s7,72(a1)
    80006d90:	0505bc03          	ld	s8,80(a1)
    80006d94:	0585bc83          	ld	s9,88(a1)
    80006d98:	0605bd03          	ld	s10,96(a1)
    80006d9c:	0685bd83          	ld	s11,104(a1)
    80006da0:	00008067          	ret
