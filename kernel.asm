
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
    8000001c:	00010297          	auipc	t0,0x10
    80000020:	fe428293          	add	t0,t0,-28 # 80010000 <bss_start>
    80000024:	00418317          	auipc	t1,0x418
    80000028:	1e430313          	add	t1,t1,484 # 80418208 <bss_end>

000000008000002c <bss_clear>:
    8000002c:	00628863          	beq	t0,t1,8000003c <bss_done>
    80000030:	0002b023          	sd	zero,0(t0)
    80000034:	00828293          	add	t0,t0,8
    80000038:	ff5ff06f          	j	8000002c <bss_clear>

000000008000003c <bss_done>:
    8000003c:	321010ef          	jal	80001b5c <main>

0000000080000040 <loop>:
    80000040:	0000006f          	j	80000040 <loop>

0000000080000044 <software_interrupt_handler>:
    80000044:	ff010113          	add	sp,sp,-16
    80000048:	00008517          	auipc	a0,0x8
    8000004c:	fb850513          	add	a0,a0,-72 # 80008000 <rodata_start>
    80000050:	00113423          	sd	ra,8(sp)
    80000054:	3a4020ef          	jal	800023f8 <uart_puts>
    80000058:	00813083          	ld	ra,8(sp)
    8000005c:	00000513          	li	a0,0
    80000060:	01010113          	add	sp,sp,16
    80000064:	00008067          	ret

0000000080000068 <external_interrupt_handler>:
    80000068:	ff010113          	add	sp,sp,-16
    8000006c:	00008517          	auipc	a0,0x8
    80000070:	fbc50513          	add	a0,a0,-68 # 80008028 <rodata_start+0x28>
    80000074:	00113423          	sd	ra,8(sp)
    80000078:	380020ef          	jal	800023f8 <uart_puts>
    8000007c:	00813083          	ld	ra,8(sp)
    80000080:	00000513          	li	a0,0
    80000084:	01010113          	add	sp,sp,16
    80000088:	00008067          	ret

000000008000008c <task_a>:
    8000008c:	fb010113          	add	sp,sp,-80
    80000090:	04813023          	sd	s0,64(sp)
    80000094:	000f4437          	lui	s0,0xf4
    80000098:	02913c23          	sd	s1,56(sp)
    8000009c:	03213823          	sd	s2,48(sp)
    800000a0:	03313423          	sd	s3,40(sp)
    800000a4:	03413023          	sd	s4,32(sp)
    800000a8:	01513c23          	sd	s5,24(sp)
    800000ac:	04113423          	sd	ra,72(sp)
    800000b0:	00000493          	li	s1,0
    800000b4:	00008997          	auipc	s3,0x8
    800000b8:	f9c98993          	add	s3,s3,-100 # 80008050 <rodata_start+0x50>
    800000bc:	23f40413          	add	s0,s0,575 # f423f <_entry-0x7ff0bdc1>
    800000c0:	00500913          	li	s2,5
    800000c4:	00a00a13          	li	s4,10
    800000c8:	00008a97          	auipc	s5,0x8
    800000cc:	fa0a8a93          	add	s5,s5,-96 # 80008068 <rodata_start+0x68>
    800000d0:	00048593          	mv	a1,s1
    800000d4:	00098513          	mv	a0,s3
    800000d8:	070020ef          	jal	80002148 <printf>
    800000dc:	00012623          	sw	zero,12(sp)
    800000e0:	00c12783          	lw	a5,12(sp)
    800000e4:	00f44c63          	blt	s0,a5,800000fc <task_a+0x70>
    800000e8:	00c12783          	lw	a5,12(sp)
    800000ec:	0017879b          	addw	a5,a5,1
    800000f0:	00f12623          	sw	a5,12(sp)
    800000f4:	00c12783          	lw	a5,12(sp)
    800000f8:	fef458e3          	bge	s0,a5,800000e8 <task_a+0x5c>
    800000fc:	03248e63          	beq	s1,s2,80000138 <task_a+0xac>
    80000100:	0014849b          	addw	s1,s1,1
    80000104:	fd4496e3          	bne	s1,s4,800000d0 <task_a+0x44>
    80000108:	00008517          	auipc	a0,0x8
    8000010c:	f7850513          	add	a0,a0,-136 # 80008080 <rodata_start+0x80>
    80000110:	038020ef          	jal	80002148 <printf>
    80000114:	04013403          	ld	s0,64(sp)
    80000118:	04813083          	ld	ra,72(sp)
    8000011c:	03813483          	ld	s1,56(sp)
    80000120:	03013903          	ld	s2,48(sp)
    80000124:	02813983          	ld	s3,40(sp)
    80000128:	02013a03          	ld	s4,32(sp)
    8000012c:	01813a83          	ld	s5,24(sp)
    80000130:	05010113          	add	sp,sp,80
    80000134:	4990606f          	j	80006dcc <task_exit>
    80000138:	000a8513          	mv	a0,s5
    8000013c:	00c020ef          	jal	80002148 <printf>
    80000140:	45d060ef          	jal	80006d9c <task_yield>
    80000144:	00600493          	li	s1,6
    80000148:	f89ff06f          	j	800000d0 <task_a+0x44>

000000008000014c <task_c>:
    8000014c:	fc010113          	add	sp,sp,-64
    80000150:	02813823          	sd	s0,48(sp)
    80000154:	00125437          	lui	s0,0x125
    80000158:	02913423          	sd	s1,40(sp)
    8000015c:	03213023          	sd	s2,32(sp)
    80000160:	01313c23          	sd	s3,24(sp)
    80000164:	02113c23          	sd	ra,56(sp)
    80000168:	00000493          	li	s1,0
    8000016c:	00008997          	auipc	s3,0x8
    80000170:	f2c98993          	add	s3,s3,-212 # 80008098 <rodata_start+0x98>
    80000174:	f7f40413          	add	s0,s0,-129 # 124f7f <_entry-0x7fedb081>
    80000178:	00600913          	li	s2,6
    8000017c:	00048593          	mv	a1,s1
    80000180:	00098513          	mv	a0,s3
    80000184:	7c5010ef          	jal	80002148 <printf>
    80000188:	00012623          	sw	zero,12(sp)
    8000018c:	00c12783          	lw	a5,12(sp)
    80000190:	00f44c63          	blt	s0,a5,800001a8 <task_c+0x5c>
    80000194:	00c12783          	lw	a5,12(sp)
    80000198:	0017879b          	addw	a5,a5,1
    8000019c:	00f12623          	sw	a5,12(sp)
    800001a0:	00c12783          	lw	a5,12(sp)
    800001a4:	fef458e3          	bge	s0,a5,80000194 <task_c+0x48>
    800001a8:	0014849b          	addw	s1,s1,1
    800001ac:	fd2498e3          	bne	s1,s2,8000017c <task_c+0x30>
    800001b0:	00008517          	auipc	a0,0x8
    800001b4:	f0050513          	add	a0,a0,-256 # 800080b0 <rodata_start+0xb0>
    800001b8:	791010ef          	jal	80002148 <printf>
    800001bc:	03013403          	ld	s0,48(sp)
    800001c0:	03813083          	ld	ra,56(sp)
    800001c4:	02813483          	ld	s1,40(sp)
    800001c8:	02013903          	ld	s2,32(sp)
    800001cc:	01813983          	ld	s3,24(sp)
    800001d0:	04010113          	add	sp,sp,64
    800001d4:	3f90606f          	j	80006dcc <task_exit>

00000000800001d8 <task_b>:
    800001d8:	fc010113          	add	sp,sp,-64
    800001dc:	02813823          	sd	s0,48(sp)
    800001e0:	000c3437          	lui	s0,0xc3
    800001e4:	02913423          	sd	s1,40(sp)
    800001e8:	03213023          	sd	s2,32(sp)
    800001ec:	01313c23          	sd	s3,24(sp)
    800001f0:	01413823          	sd	s4,16(sp)
    800001f4:	02113c23          	sd	ra,56(sp)
    800001f8:	00000493          	li	s1,0
    800001fc:	00008997          	auipc	s3,0x8
    80000200:	ec498993          	add	s3,s3,-316 # 800080c0 <rodata_start+0xc0>
    80000204:	4ff40413          	add	s0,s0,1279 # c34ff <_entry-0x7ff3cb01>
    80000208:	00300913          	li	s2,3
    8000020c:	00800a13          	li	s4,8
    80000210:	00048593          	mv	a1,s1
    80000214:	00098513          	mv	a0,s3
    80000218:	731010ef          	jal	80002148 <printf>
    8000021c:	00012623          	sw	zero,12(sp)
    80000220:	00c12783          	lw	a5,12(sp)
    80000224:	00f44c63          	blt	s0,a5,8000023c <task_b+0x64>
    80000228:	00c12783          	lw	a5,12(sp)
    8000022c:	0017879b          	addw	a5,a5,1
    80000230:	00f12623          	sw	a5,12(sp)
    80000234:	00c12783          	lw	a5,12(sp)
    80000238:	fef458e3          	bge	s0,a5,80000228 <task_b+0x50>
    8000023c:	03248c63          	beq	s1,s2,80000274 <task_b+0x9c>
    80000240:	0014849b          	addw	s1,s1,1
    80000244:	fd4496e3          	bne	s1,s4,80000210 <task_b+0x38>
    80000248:	00008517          	auipc	a0,0x8
    8000024c:	eb050513          	add	a0,a0,-336 # 800080f8 <rodata_start+0xf8>
    80000250:	6f9010ef          	jal	80002148 <printf>
    80000254:	03013403          	ld	s0,48(sp)
    80000258:	03813083          	ld	ra,56(sp)
    8000025c:	02813483          	ld	s1,40(sp)
    80000260:	02013903          	ld	s2,32(sp)
    80000264:	01813983          	ld	s3,24(sp)
    80000268:	01013a03          	ld	s4,16(sp)
    8000026c:	04010113          	add	sp,sp,64
    80000270:	35d0606f          	j	80006dcc <task_exit>
    80000274:	00008517          	auipc	a0,0x8
    80000278:	e6450513          	add	a0,a0,-412 # 800080d8 <rodata_start+0xd8>
    8000027c:	6cd010ef          	jal	80002148 <printf>
    80000280:	00500513          	li	a0,5
    80000284:	3c1060ef          	jal	80006e44 <task_sleep>
    80000288:	00400493          	li	s1,4
    8000028c:	f85ff06f          	j	80000210 <task_b+0x38>

0000000080000290 <test_virtual_memory>:
    80000290:	ff010113          	add	sp,sp,-16
    80000294:	00008517          	auipc	a0,0x8
    80000298:	e7c50513          	add	a0,a0,-388 # 80008110 <rodata_start+0x110>
    8000029c:	00113423          	sd	ra,8(sp)
    800002a0:	158020ef          	jal	800023f8 <uart_puts>
    800002a4:	00008517          	auipc	a0,0x8
    800002a8:	e8c50513          	add	a0,a0,-372 # 80008130 <rodata_start+0x130>
    800002ac:	14c020ef          	jal	800023f8 <uart_puts>
    800002b0:	01100593          	li	a1,17
    800002b4:	40100513          	li	a0,1025
    800002b8:	01b59593          	sll	a1,a1,0x1b
    800002bc:	01551513          	sll	a0,a0,0x15
    800002c0:	164020ef          	jal	80002424 <pmm_init>
    800002c4:	00008517          	auipc	a0,0x8
    800002c8:	e9450513          	add	a0,a0,-364 # 80008158 <rodata_start+0x158>
    800002cc:	12c020ef          	jal	800023f8 <uart_puts>
    800002d0:	591020ef          	jal	80003060 <kvminit>
    800002d4:	00008517          	auipc	a0,0x8
    800002d8:	ea450513          	add	a0,a0,-348 # 80008178 <rodata_start+0x178>
    800002dc:	11c020ef          	jal	800023f8 <uart_puts>
    800002e0:	1f1020ef          	jal	80002cd0 <kvminithart>
    800002e4:	00008517          	auipc	a0,0x8
    800002e8:	eac50513          	add	a0,a0,-340 # 80008190 <rodata_start+0x190>
    800002ec:	10c020ef          	jal	800023f8 <uart_puts>
    800002f0:	00813083          	ld	ra,8(sp)
    800002f4:	00008517          	auipc	a0,0x8
    800002f8:	ebc50513          	add	a0,a0,-324 # 800081b0 <rodata_start+0x1b0>
    800002fc:	01010113          	add	sp,sp,16
    80000300:	0f80206f          	j	800023f8 <uart_puts>

0000000080000304 <test_timer_interrupt>:
    80000304:	fc010113          	add	sp,sp,-64
    80000308:	00008517          	auipc	a0,0x8
    8000030c:	ec850513          	add	a0,a0,-312 # 800081d0 <rodata_start+0x1d0>
    80000310:	02113c23          	sd	ra,56(sp)
    80000314:	02813823          	sd	s0,48(sp)
    80000318:	02913423          	sd	s1,40(sp)
    8000031c:	03213023          	sd	s2,32(sp)
    80000320:	01313c23          	sd	s3,24(sp)
    80000324:	01413823          	sd	s4,16(sp)
    80000328:	621010ef          	jal	80002148 <printf>
    8000032c:	00008517          	auipc	a0,0x8
    80000330:	ec450513          	add	a0,a0,-316 # 800081f0 <rodata_start+0x1f0>
    80000334:	000f4437          	lui	s0,0xf4
    80000338:	611010ef          	jal	80002148 <printf>
    8000033c:	00000493          	li	s1,0
    80000340:	00008a17          	auipc	s4,0x8
    80000344:	ed0a0a13          	add	s4,s4,-304 # 80008210 <rodata_start+0x210>
    80000348:	23f40413          	add	s0,s0,575 # f423f <_entry-0x7ff0bdc1>
    8000034c:	00008997          	auipc	s3,0x8
    80000350:	edc98993          	add	s3,s3,-292 # 80008228 <rodata_start+0x228>
    80000354:	00500913          	li	s2,5
    80000358:	0014849b          	addw	s1,s1,1
    8000035c:	00048593          	mv	a1,s1
    80000360:	000a0513          	mv	a0,s4
    80000364:	5e5010ef          	jal	80002148 <printf>
    80000368:	00012623          	sw	zero,12(sp)
    8000036c:	00c12783          	lw	a5,12(sp)
    80000370:	00f44c63          	blt	s0,a5,80000388 <test_timer_interrupt+0x84>
    80000374:	00c12783          	lw	a5,12(sp)
    80000378:	0017879b          	addw	a5,a5,1
    8000037c:	00f12623          	sw	a5,12(sp)
    80000380:	00c12783          	lw	a5,12(sp)
    80000384:	fef458e3          	bge	s0,a5,80000374 <test_timer_interrupt+0x70>
    80000388:	00048593          	mv	a1,s1
    8000038c:	00098513          	mv	a0,s3
    80000390:	5b9010ef          	jal	80002148 <printf>
    80000394:	fd2492e3          	bne	s1,s2,80000358 <test_timer_interrupt+0x54>
    80000398:	03013403          	ld	s0,48(sp)
    8000039c:	03813083          	ld	ra,56(sp)
    800003a0:	02813483          	ld	s1,40(sp)
    800003a4:	02013903          	ld	s2,32(sp)
    800003a8:	01813983          	ld	s3,24(sp)
    800003ac:	01013a03          	ld	s4,16(sp)
    800003b0:	00008517          	auipc	a0,0x8
    800003b4:	e9850513          	add	a0,a0,-360 # 80008248 <rodata_start+0x248>
    800003b8:	04010113          	add	sp,sp,64
    800003bc:	58d0106f          	j	80002148 <printf>

00000000800003c0 <test_exception_handling>:
    800003c0:	fe010113          	add	sp,sp,-32
    800003c4:	00008517          	auipc	a0,0x8
    800003c8:	eb450513          	add	a0,a0,-332 # 80008278 <rodata_start+0x278>
    800003cc:	00113c23          	sd	ra,24(sp)
    800003d0:	579010ef          	jal	80002148 <printf>
    800003d4:	00008517          	auipc	a0,0x8
    800003d8:	ec450513          	add	a0,a0,-316 # 80008298 <rodata_start+0x298>
    800003dc:	56d010ef          	jal	80002148 <printf>
    800003e0:	00008517          	auipc	a0,0x8
    800003e4:	ed850513          	add	a0,a0,-296 # 800082b8 <rodata_start+0x2b8>
    800003e8:	561010ef          	jal	80002148 <printf>
    800003ec:	00008517          	auipc	a0,0x8
    800003f0:	f0450513          	add	a0,a0,-252 # 800082f0 <rodata_start+0x2f0>
    800003f4:	555010ef          	jal	80002148 <printf>
    800003f8:	00008517          	auipc	a0,0x8
    800003fc:	f1850513          	add	a0,a0,-232 # 80008310 <rodata_start+0x310>
    80000400:	549010ef          	jal	80002148 <printf>
    80000404:	00008517          	auipc	a0,0x8
    80000408:	f3c50513          	add	a0,a0,-196 # 80008340 <rodata_start+0x340>
    8000040c:	53d010ef          	jal	80002148 <printf>
    80000410:	00008517          	auipc	a0,0x8
    80000414:	f5050513          	add	a0,a0,-176 # 80008360 <rodata_start+0x360>
    80000418:	531010ef          	jal	80002148 <printf>
    8000041c:	010007b7          	lui	a5,0x1000
    80000420:	00f13423          	sd	a5,8(sp)
    80000424:	00813583          	ld	a1,8(sp)
    80000428:	00008517          	auipc	a0,0x8
    8000042c:	f5850513          	add	a0,a0,-168 # 80008380 <rodata_start+0x380>
    80000430:	519010ef          	jal	80002148 <printf>
    80000434:	00008517          	auipc	a0,0x8
    80000438:	f6c50513          	add	a0,a0,-148 # 800083a0 <rodata_start+0x3a0>
    8000043c:	50d010ef          	jal	80002148 <printf>
    80000440:	00008517          	auipc	a0,0x8
    80000444:	f9050513          	add	a0,a0,-112 # 800083d0 <rodata_start+0x3d0>
    80000448:	501010ef          	jal	80002148 <printf>
    8000044c:	00008517          	auipc	a0,0x8
    80000450:	fa450513          	add	a0,a0,-92 # 800083f0 <rodata_start+0x3f0>
    80000454:	4f5010ef          	jal	80002148 <printf>
    80000458:	01813083          	ld	ra,24(sp)
    8000045c:	00008517          	auipc	a0,0x8
    80000460:	fcc50513          	add	a0,a0,-52 # 80008428 <rodata_start+0x428>
    80000464:	02010113          	add	sp,sp,32
    80000468:	4e10106f          	j	80002148 <printf>

000000008000046c <test_page_fault_exception>:
    8000046c:	fe010113          	add	sp,sp,-32
    80000470:	00008517          	auipc	a0,0x8
    80000474:	ef050513          	add	a0,a0,-272 # 80008360 <rodata_start+0x360>
    80000478:	00113c23          	sd	ra,24(sp)
    8000047c:	4cd010ef          	jal	80002148 <printf>
    80000480:	010007b7          	lui	a5,0x1000
    80000484:	00f13423          	sd	a5,8(sp)
    80000488:	00813583          	ld	a1,8(sp)
    8000048c:	00008517          	auipc	a0,0x8
    80000490:	ef450513          	add	a0,a0,-268 # 80008380 <rodata_start+0x380>
    80000494:	4b5010ef          	jal	80002148 <printf>
    80000498:	01813083          	ld	ra,24(sp)
    8000049c:	00008517          	auipc	a0,0x8
    800004a0:	f0450513          	add	a0,a0,-252 # 800083a0 <rodata_start+0x3a0>
    800004a4:	02010113          	add	sp,sp,32
    800004a8:	4a10106f          	j	80002148 <printf>

00000000800004ac <test_interrupt_overhead>:
    800004ac:	fb010113          	add	sp,sp,-80
    800004b0:	00008517          	auipc	a0,0x8
    800004b4:	f9850513          	add	a0,a0,-104 # 80008448 <rodata_start+0x448>
    800004b8:	04113423          	sd	ra,72(sp)
    800004bc:	04813023          	sd	s0,64(sp)
    800004c0:	02913c23          	sd	s1,56(sp)
    800004c4:	03213823          	sd	s2,48(sp)
    800004c8:	03313423          	sd	s3,40(sp)
    800004cc:	03413023          	sd	s4,32(sp)
    800004d0:	01513c23          	sd	s5,24(sp)
    800004d4:	475010ef          	jal	80002148 <printf>
    800004d8:	73d030ef          	jal	80004414 <disable_interrupts>
    800004dc:	789050ef          	jal	80006464 <get_system_time>
    800004e0:	00012023          	sw	zero,0(sp)
    800004e4:	00012703          	lw	a4,0(sp)
    800004e8:	3e700793          	li	a5,999
    800004ec:	00050413          	mv	s0,a0
    800004f0:	02e7c863          	blt	a5,a4,80000520 <test_interrupt_overhead+0x74>
    800004f4:	3e700693          	li	a3,999
    800004f8:	00012783          	lw	a5,0(sp)
    800004fc:	00012703          	lw	a4,0(sp)
    80000500:	02e787bb          	mulw	a5,a5,a4
    80000504:	00f12223          	sw	a5,4(sp)
    80000508:	00412783          	lw	a5,4(sp)
    8000050c:	00012783          	lw	a5,0(sp)
    80000510:	0017879b          	addw	a5,a5,1 # 1000001 <_entry-0x7effffff>
    80000514:	00f12023          	sw	a5,0(sp)
    80000518:	00012783          	lw	a5,0(sp)
    8000051c:	fcf6dee3          	bge	a3,a5,800004f8 <test_interrupt_overhead+0x4c>
    80000520:	745050ef          	jal	80006464 <get_system_time>
    80000524:	00050493          	mv	s1,a0
    80000528:	6e9030ef          	jal	80004410 <enable_interrupts>
    8000052c:	739050ef          	jal	80006464 <get_system_time>
    80000530:	00012423          	sw	zero,8(sp)
    80000534:	00812703          	lw	a4,8(sp)
    80000538:	3e700793          	li	a5,999
    8000053c:	408489b3          	sub	s3,s1,s0
    80000540:	00050913          	mv	s2,a0
    80000544:	04e7ce63          	blt	a5,a4,800005a0 <test_interrupt_overhead+0xf4>
    80000548:	06400a93          	li	s5,100
    8000054c:	3e700a13          	li	s4,999
    80000550:	0180006f          	j	80000568 <test_interrupt_overhead+0xbc>
    80000554:	00812783          	lw	a5,8(sp)
    80000558:	0017879b          	addw	a5,a5,1
    8000055c:	00f12423          	sw	a5,8(sp)
    80000560:	00812783          	lw	a5,8(sp)
    80000564:	02fa4e63          	blt	s4,a5,800005a0 <test_interrupt_overhead+0xf4>
    80000568:	00812783          	lw	a5,8(sp)
    8000056c:	00812703          	lw	a4,8(sp)
    80000570:	02e787bb          	mulw	a5,a5,a4
    80000574:	00f12623          	sw	a5,12(sp)
    80000578:	00c12783          	lw	a5,12(sp)
    8000057c:	00812783          	lw	a5,8(sp)
    80000580:	0357e7bb          	remw	a5,a5,s5
    80000584:	fc0798e3          	bnez	a5,80000554 <test_interrupt_overhead+0xa8>
    80000588:	219060ef          	jal	80006fa0 <schedule_from_timer>
    8000058c:	00812783          	lw	a5,8(sp)
    80000590:	0017879b          	addw	a5,a5,1
    80000594:	00f12423          	sw	a5,8(sp)
    80000598:	00812783          	lw	a5,8(sp)
    8000059c:	fcfa56e3          	bge	s4,a5,80000568 <test_interrupt_overhead+0xbc>
    800005a0:	6c5050ef          	jal	80006464 <get_system_time>
    800005a4:	41250933          	sub	s2,a0,s2
    800005a8:	00098593          	mv	a1,s3
    800005ac:	00008517          	auipc	a0,0x8
    800005b0:	ebc50513          	add	a0,a0,-324 # 80008468 <rodata_start+0x468>
    800005b4:	395010ef          	jal	80002148 <printf>
    800005b8:	00090593          	mv	a1,s2
    800005bc:	00008517          	auipc	a0,0x8
    800005c0:	ed450513          	add	a0,a0,-300 # 80008490 <rodata_start+0x490>
    800005c4:	385010ef          	jal	80002148 <printf>
    800005c8:	409405b3          	sub	a1,s0,s1
    800005cc:	012585b3          	add	a1,a1,s2
    800005d0:	06400613          	li	a2,100
    800005d4:	02c58633          	mul	a2,a1,a2
    800005d8:	00008517          	auipc	a0,0x8
    800005dc:	ee050513          	add	a0,a0,-288 # 800084b8 <rodata_start+0x4b8>
    800005e0:	03365633          	divu	a2,a2,s3
    800005e4:	365010ef          	jal	80002148 <printf>
    800005e8:	04013403          	ld	s0,64(sp)
    800005ec:	04813083          	ld	ra,72(sp)
    800005f0:	03813483          	ld	s1,56(sp)
    800005f4:	03013903          	ld	s2,48(sp)
    800005f8:	02813983          	ld	s3,40(sp)
    800005fc:	02013a03          	ld	s4,32(sp)
    80000600:	01813a83          	ld	s5,24(sp)
    80000604:	05010113          	add	sp,sp,80
    80000608:	3680406f          	j	80004970 <print_interrupt_stats>

000000008000060c <test_comprehensive_exception_handling>:
    8000060c:	ff010113          	add	sp,sp,-16
    80000610:	00008517          	auipc	a0,0x8
    80000614:	ed050513          	add	a0,a0,-304 # 800084e0 <rodata_start+0x4e0>
    80000618:	00113423          	sd	ra,8(sp)
    8000061c:	32d010ef          	jal	80002148 <printf>
    80000620:	00008517          	auipc	a0,0x8
    80000624:	ef050513          	add	a0,a0,-272 # 80008510 <rodata_start+0x510>
    80000628:	321010ef          	jal	80002148 <printf>
    8000062c:	00008517          	auipc	a0,0x8
    80000630:	f1c50513          	add	a0,a0,-228 # 80008548 <rodata_start+0x548>
    80000634:	315010ef          	jal	80002148 <printf>
    80000638:	00008517          	auipc	a0,0x8
    8000063c:	f4050513          	add	a0,a0,-192 # 80008578 <rodata_start+0x578>
    80000640:	309010ef          	jal	80002148 <printf>
    80000644:	cc1ff0ef          	jal	80000304 <test_timer_interrupt>
    80000648:	00008517          	auipc	a0,0x8
    8000064c:	74850513          	add	a0,a0,1864 # 80008d90 <rodata_start+0xd90>
    80000650:	2f9010ef          	jal	80002148 <printf>
    80000654:	00008517          	auipc	a0,0x8
    80000658:	f4450513          	add	a0,a0,-188 # 80008598 <rodata_start+0x598>
    8000065c:	2ed010ef          	jal	80002148 <printf>
    80000660:	d61ff0ef          	jal	800003c0 <test_exception_handling>
    80000664:	00008517          	auipc	a0,0x8
    80000668:	72c50513          	add	a0,a0,1836 # 80008d90 <rodata_start+0xd90>
    8000066c:	2dd010ef          	jal	80002148 <printf>
    80000670:	00008517          	auipc	a0,0x8
    80000674:	f4850513          	add	a0,a0,-184 # 800085b8 <rodata_start+0x5b8>
    80000678:	2d1010ef          	jal	80002148 <printf>
    8000067c:	e31ff0ef          	jal	800004ac <test_interrupt_overhead>
    80000680:	00008517          	auipc	a0,0x8
    80000684:	71050513          	add	a0,a0,1808 # 80008d90 <rodata_start+0xd90>
    80000688:	2c1010ef          	jal	80002148 <printf>
    8000068c:	00813083          	ld	ra,8(sp)
    80000690:	00008517          	auipc	a0,0x8
    80000694:	f4850513          	add	a0,a0,-184 # 800085d8 <rodata_start+0x5d8>
    80000698:	01010113          	add	sp,sp,16
    8000069c:	2ad0106f          	j	80002148 <printf>

00000000800006a0 <panic>:
    800006a0:	ff010113          	add	sp,sp,-16
    800006a4:	00813023          	sd	s0,0(sp)
    800006a8:	00050413          	mv	s0,a0
    800006ac:	00008517          	auipc	a0,0x8
    800006b0:	f4c50513          	add	a0,a0,-180 # 800085f8 <rodata_start+0x5f8>
    800006b4:	00113423          	sd	ra,8(sp)
    800006b8:	541010ef          	jal	800023f8 <uart_puts>
    800006bc:	00040513          	mv	a0,s0
    800006c0:	539010ef          	jal	800023f8 <uart_puts>
    800006c4:	00008517          	auipc	a0,0x8
    800006c8:	6cc50513          	add	a0,a0,1740 # 80008d90 <rodata_start+0xd90>
    800006cc:	52d010ef          	jal	800023f8 <uart_puts>
    800006d0:	545030ef          	jal	80004414 <disable_interrupts>
    800006d4:	10500073          	wfi
    800006d8:	10500073          	wfi
    800006dc:	ff9ff06f          	j	800006d4 <panic+0x34>

00000000800006e0 <pt_test>:
    800006e0:	fe010113          	add	sp,sp,-32
    800006e4:	00008517          	auipc	a0,0x8
    800006e8:	f2450513          	add	a0,a0,-220 # 80008608 <rodata_start+0x608>
    800006ec:	00113c23          	sd	ra,24(sp)
    800006f0:	00813823          	sd	s0,16(sp)
    800006f4:	00913423          	sd	s1,8(sp)
    800006f8:	501010ef          	jal	800023f8 <uart_puts>
    800006fc:	00008517          	auipc	a0,0x8
    80000700:	a3450513          	add	a0,a0,-1484 # 80008130 <rodata_start+0x130>
    80000704:	4f5010ef          	jal	800023f8 <uart_puts>
    80000708:	01100593          	li	a1,17
    8000070c:	40100513          	li	a0,1025
    80000710:	01b59593          	sll	a1,a1,0x1b
    80000714:	01551513          	sll	a0,a0,0x15
    80000718:	50d010ef          	jal	80002424 <pmm_init>
    8000071c:	00008517          	auipc	a0,0x8
    80000720:	f0c50513          	add	a0,a0,-244 # 80008628 <rodata_start+0x628>
    80000724:	4d5010ef          	jal	800023f8 <uart_puts>
    80000728:	749010ef          	jal	80002670 <create_pagetable>
    8000072c:	14050a63          	beqz	a0,80000880 <pt_test+0x1a0>
    80000730:	00050413          	mv	s0,a0
    80000734:	00008517          	auipc	a0,0x8
    80000738:	f2450513          	add	a0,a0,-220 # 80008658 <rodata_start+0x658>
    8000073c:	4bd010ef          	jal	800023f8 <uart_puts>
    80000740:	00008517          	auipc	a0,0x8
    80000744:	f3050513          	add	a0,a0,-208 # 80008670 <rodata_start+0x670>
    80000748:	4b1010ef          	jal	800023f8 <uart_puts>
    8000074c:	00100613          	li	a2,1
    80000750:	01f61613          	sll	a2,a2,0x1f
    80000754:	00a00693          	li	a3,10
    80000758:	00060593          	mv	a1,a2
    8000075c:	00040513          	mv	a0,s0
    80000760:	745010ef          	jal	800026a4 <map_page>
    80000764:	0c051263          	bnez	a0,80000828 <pt_test+0x148>
    80000768:	80000637          	lui	a2,0x80000
    8000076c:	800005b7          	lui	a1,0x80000
    80000770:	00008517          	auipc	a0,0x8
    80000774:	f3850513          	add	a0,a0,-200 # 800086a8 <rodata_start+0x6a8>
    80000778:	1d1010ef          	jal	80002148 <printf>
    8000077c:	40100613          	li	a2,1025
    80000780:	01561613          	sll	a2,a2,0x15
    80000784:	00600693          	li	a3,6
    80000788:	00060593          	mv	a1,a2
    8000078c:	00040513          	mv	a0,s0
    80000790:	715010ef          	jal	800026a4 <map_page>
    80000794:	0a050e63          	beqz	a0,80000850 <pt_test+0x170>
    80000798:	00008517          	auipc	a0,0x8
    8000079c:	f4850513          	add	a0,a0,-184 # 800086e0 <rodata_start+0x6e0>
    800007a0:	459010ef          	jal	800023f8 <uart_puts>
    800007a4:	080004b7          	lui	s1,0x8000
    800007a8:	fff48493          	add	s1,s1,-1 # 7ffffff <_entry-0x78000001>
    800007ac:	08100613          	li	a2,129
    800007b0:	01600693          	li	a3,22
    800007b4:	01861613          	sll	a2,a2,0x18
    800007b8:	00c49593          	sll	a1,s1,0xc
    800007bc:	00040513          	mv	a0,s0
    800007c0:	6e5010ef          	jal	800026a4 <map_page>
    800007c4:	0a050263          	beqz	a0,80000868 <pt_test+0x188>
    800007c8:	00008517          	auipc	a0,0x8
    800007cc:	f7050513          	add	a0,a0,-144 # 80008738 <rodata_start+0x738>
    800007d0:	429010ef          	jal	800023f8 <uart_puts>
    800007d4:	00008517          	auipc	a0,0x8
    800007d8:	fbc50513          	add	a0,a0,-68 # 80008790 <rodata_start+0x790>
    800007dc:	41d010ef          	jal	800023f8 <uart_puts>
    800007e0:	00000593          	li	a1,0
    800007e4:	00040513          	mv	a0,s0
    800007e8:	50c020ef          	jal	80002cf4 <dump_pagetable>
    800007ec:	00008517          	auipc	a0,0x8
    800007f0:	fb450513          	add	a0,a0,-76 # 800087a0 <rodata_start+0x7a0>
    800007f4:	405010ef          	jal	800023f8 <uart_puts>
    800007f8:	00040513          	mv	a0,s0
    800007fc:	16c020ef          	jal	80002968 <destroy_pagetable>
    80000800:	00008517          	auipc	a0,0x8
    80000804:	fb850513          	add	a0,a0,-72 # 800087b8 <rodata_start+0x7b8>
    80000808:	3f1010ef          	jal	800023f8 <uart_puts>
    8000080c:	01013403          	ld	s0,16(sp)
    80000810:	01813083          	ld	ra,24(sp)
    80000814:	00813483          	ld	s1,8(sp)
    80000818:	00008517          	auipc	a0,0x8
    8000081c:	fb850513          	add	a0,a0,-72 # 800087d0 <rodata_start+0x7d0>
    80000820:	02010113          	add	sp,sp,32
    80000824:	3d50106f          	j	800023f8 <uart_puts>
    80000828:	00008517          	auipc	a0,0x8
    8000082c:	e6050513          	add	a0,a0,-416 # 80008688 <rodata_start+0x688>
    80000830:	3c9010ef          	jal	800023f8 <uart_puts>
    80000834:	40100613          	li	a2,1025
    80000838:	01561613          	sll	a2,a2,0x15
    8000083c:	00600693          	li	a3,6
    80000840:	00060593          	mv	a1,a2
    80000844:	00040513          	mv	a0,s0
    80000848:	65d010ef          	jal	800026a4 <map_page>
    8000084c:	f40516e3          	bnez	a0,80000798 <pt_test+0xb8>
    80000850:	80200637          	lui	a2,0x80200
    80000854:	802005b7          	lui	a1,0x80200
    80000858:	00008517          	auipc	a0,0x8
    8000085c:	ea850513          	add	a0,a0,-344 # 80008700 <rodata_start+0x700>
    80000860:	0e9010ef          	jal	80002148 <printf>
    80000864:	f41ff06f          	j	800007a4 <pt_test+0xc4>
    80000868:	81000637          	lui	a2,0x81000
    8000086c:	00c49593          	sll	a1,s1,0xc
    80000870:	00008517          	auipc	a0,0x8
    80000874:	ee850513          	add	a0,a0,-280 # 80008758 <rodata_start+0x758>
    80000878:	0d1010ef          	jal	80002148 <printf>
    8000087c:	f59ff06f          	j	800007d4 <pt_test+0xf4>
    80000880:	01013403          	ld	s0,16(sp)
    80000884:	01813083          	ld	ra,24(sp)
    80000888:	00813483          	ld	s1,8(sp)
    8000088c:	00008517          	auipc	a0,0x8
    80000890:	db450513          	add	a0,a0,-588 # 80008640 <rodata_start+0x640>
    80000894:	02010113          	add	sp,sp,32
    80000898:	3610106f          	j	800023f8 <uart_puts>

000000008000089c <pmm_test>:
    8000089c:	fe010113          	add	sp,sp,-32
    800008a0:	00008517          	auipc	a0,0x8
    800008a4:	f5050513          	add	a0,a0,-176 # 800087f0 <rodata_start+0x7f0>
    800008a8:	00113c23          	sd	ra,24(sp)
    800008ac:	00813823          	sd	s0,16(sp)
    800008b0:	00913423          	sd	s1,8(sp)
    800008b4:	01213023          	sd	s2,0(sp)
    800008b8:	341010ef          	jal	800023f8 <uart_puts>
    800008bc:	00008517          	auipc	a0,0x8
    800008c0:	87450513          	add	a0,a0,-1932 # 80008130 <rodata_start+0x130>
    800008c4:	335010ef          	jal	800023f8 <uart_puts>
    800008c8:	01100593          	li	a1,17
    800008cc:	40100513          	li	a0,1025
    800008d0:	01b59593          	sll	a1,a1,0x1b
    800008d4:	01551513          	sll	a0,a0,0x15
    800008d8:	34d010ef          	jal	80002424 <pmm_init>
    800008dc:	00008517          	auipc	a0,0x8
    800008e0:	f3c50513          	add	a0,a0,-196 # 80008818 <rodata_start+0x818>
    800008e4:	315010ef          	jal	800023f8 <uart_puts>
    800008e8:	3bd010ef          	jal	800024a4 <alloc_page>
    800008ec:	00050593          	mv	a1,a0
    800008f0:	00050493          	mv	s1,a0
    800008f4:	00008517          	auipc	a0,0x8
    800008f8:	f3c50513          	add	a0,a0,-196 # 80008830 <rodata_start+0x830>
    800008fc:	04d010ef          	jal	80002148 <printf>
    80000900:	3a5010ef          	jal	800024a4 <alloc_page>
    80000904:	00050593          	mv	a1,a0
    80000908:	00050413          	mv	s0,a0
    8000090c:	00008517          	auipc	a0,0x8
    80000910:	f4450513          	add	a0,a0,-188 # 80008850 <rodata_start+0x850>
    80000914:	035010ef          	jal	80002148 <printf>
    80000918:	38d010ef          	jal	800024a4 <alloc_page>
    8000091c:	00050593          	mv	a1,a0
    80000920:	00050913          	mv	s2,a0
    80000924:	00008517          	auipc	a0,0x8
    80000928:	f4c50513          	add	a0,a0,-180 # 80008870 <rodata_start+0x870>
    8000092c:	01d010ef          	jal	80002148 <printf>
    80000930:	00008517          	auipc	a0,0x8
    80000934:	f6050513          	add	a0,a0,-160 # 80008890 <rodata_start+0x890>
    80000938:	2c1010ef          	jal	800023f8 <uart_puts>
    8000093c:	00048513          	mv	a0,s1
    80000940:	381010ef          	jal	800024c0 <free_page>
    80000944:	00008517          	auipc	a0,0x8
    80000948:	f6450513          	add	a0,a0,-156 # 800088a8 <rodata_start+0x8a8>
    8000094c:	2ad010ef          	jal	800023f8 <uart_puts>
    80000950:	00040513          	mv	a0,s0
    80000954:	36d010ef          	jal	800024c0 <free_page>
    80000958:	00008517          	auipc	a0,0x8
    8000095c:	f6850513          	add	a0,a0,-152 # 800088c0 <rodata_start+0x8c0>
    80000960:	299010ef          	jal	800023f8 <uart_puts>
    80000964:	00008517          	auipc	a0,0x8
    80000968:	f7450513          	add	a0,a0,-140 # 800088d8 <rodata_start+0x8d8>
    8000096c:	28d010ef          	jal	800023f8 <uart_puts>
    80000970:	335010ef          	jal	800024a4 <alloc_page>
    80000974:	00050593          	mv	a1,a0
    80000978:	00050493          	mv	s1,a0
    8000097c:	00008517          	auipc	a0,0x8
    80000980:	f7c50513          	add	a0,a0,-132 # 800088f8 <rodata_start+0x8f8>
    80000984:	7c4010ef          	jal	80002148 <printf>
    80000988:	31d010ef          	jal	800024a4 <alloc_page>
    8000098c:	00050593          	mv	a1,a0
    80000990:	00050413          	mv	s0,a0
    80000994:	00008517          	auipc	a0,0x8
    80000998:	f6450513          	add	a0,a0,-156 # 800088f8 <rodata_start+0x8f8>
    8000099c:	7ac010ef          	jal	80002148 <printf>
    800009a0:	00090513          	mv	a0,s2
    800009a4:	31d010ef          	jal	800024c0 <free_page>
    800009a8:	00048513          	mv	a0,s1
    800009ac:	315010ef          	jal	800024c0 <free_page>
    800009b0:	00040513          	mv	a0,s0
    800009b4:	30d010ef          	jal	800024c0 <free_page>
    800009b8:	00008517          	auipc	a0,0x8
    800009bc:	f6050513          	add	a0,a0,-160 # 80008918 <rodata_start+0x918>
    800009c0:	239010ef          	jal	800023f8 <uart_puts>
    800009c4:	01013403          	ld	s0,16(sp)
    800009c8:	01813083          	ld	ra,24(sp)
    800009cc:	00813483          	ld	s1,8(sp)
    800009d0:	00013903          	ld	s2,0(sp)
    800009d4:	00008517          	auipc	a0,0x8
    800009d8:	f6450513          	add	a0,a0,-156 # 80008938 <rodata_start+0x938>
    800009dc:	02010113          	add	sp,sp,32
    800009e0:	2190106f          	j	800023f8 <uart_puts>

00000000800009e4 <test_alloc_pages_gap2>:
    800009e4:	fa010113          	add	sp,sp,-96
    800009e8:	00008517          	auipc	a0,0x8
    800009ec:	f7850513          	add	a0,a0,-136 # 80008960 <rodata_start+0x960>
    800009f0:	04113c23          	sd	ra,88(sp)
    800009f4:	04813823          	sd	s0,80(sp)
    800009f8:	04913423          	sd	s1,72(sp)
    800009fc:	05213023          	sd	s2,64(sp)
    80000a00:	03313c23          	sd	s3,56(sp)
    80000a04:	03413823          	sd	s4,48(sp)
    80000a08:	03513423          	sd	s5,40(sp)
    80000a0c:	1ed010ef          	jal	800023f8 <uart_puts>
    80000a10:	00007517          	auipc	a0,0x7
    80000a14:	72050513          	add	a0,a0,1824 # 80008130 <rodata_start+0x130>
    80000a18:	1e1010ef          	jal	800023f8 <uart_puts>
    80000a1c:	01100593          	li	a1,17
    80000a20:	40100513          	li	a0,1025
    80000a24:	01b59593          	sll	a1,a1,0x1b
    80000a28:	01551513          	sll	a0,a0,0x15
    80000a2c:	1f9010ef          	jal	80002424 <pmm_init>
    80000a30:	275010ef          	jal	800024a4 <alloc_page>
    80000a34:	00050593          	mv	a1,a0
    80000a38:	00050993          	mv	s3,a0
    80000a3c:	00008517          	auipc	a0,0x8
    80000a40:	f5450513          	add	a0,a0,-172 # 80008990 <rodata_start+0x990>
    80000a44:	704010ef          	jal	80002148 <printf>
    80000a48:	00008517          	auipc	a0,0x8
    80000a4c:	f6050513          	add	a0,a0,-160 # 800089a8 <rodata_start+0x9a8>
    80000a50:	00810493          	add	s1,sp,8
    80000a54:	1a5010ef          	jal	800023f8 <uart_puts>
    80000a58:	00048913          	mv	s2,s1
    80000a5c:	00000413          	li	s0,0
    80000a60:	00008a97          	auipc	s5,0x8
    80000a64:	f60a8a93          	add	s5,s5,-160 # 800089c0 <rodata_start+0x9c0>
    80000a68:	00300a13          	li	s4,3
    80000a6c:	239010ef          	jal	800024a4 <alloc_page>
    80000a70:	00050613          	mv	a2,a0
    80000a74:	0014041b          	addw	s0,s0,1
    80000a78:	00c93023          	sd	a2,0(s2)
    80000a7c:	00040593          	mv	a1,s0
    80000a80:	000a8513          	mv	a0,s5
    80000a84:	6c4010ef          	jal	80002148 <printf>
    80000a88:	00890913          	add	s2,s2,8
    80000a8c:	ff4410e3          	bne	s0,s4,80000a6c <test_alloc_pages_gap2+0x88>
    80000a90:	00008517          	auipc	a0,0x8
    80000a94:	f5050513          	add	a0,a0,-176 # 800089e0 <rodata_start+0x9e0>
    80000a98:	161010ef          	jal	800023f8 <uart_puts>
    80000a9c:	00098513          	mv	a0,s3
    80000aa0:	221010ef          	jal	800024c0 <free_page>
    80000aa4:	00008517          	auipc	a0,0x8
    80000aa8:	f4c50513          	add	a0,a0,-180 # 800089f0 <rodata_start+0x9f0>
    80000aac:	14d010ef          	jal	800023f8 <uart_puts>
    80000ab0:	00000413          	li	s0,0
    80000ab4:	00008997          	auipc	s3,0x8
    80000ab8:	f5c98993          	add	s3,s3,-164 # 80008a10 <rodata_start+0xa10>
    80000abc:	00300913          	li	s2,3
    80000ac0:	0004b503          	ld	a0,0(s1)
    80000ac4:	0014041b          	addw	s0,s0,1
    80000ac8:	00848493          	add	s1,s1,8
    80000acc:	1f5010ef          	jal	800024c0 <free_page>
    80000ad0:	00040593          	mv	a1,s0
    80000ad4:	00098513          	mv	a0,s3
    80000ad8:	670010ef          	jal	80002148 <printf>
    80000adc:	ff2412e3          	bne	s0,s2,80000ac0 <test_alloc_pages_gap2+0xdc>
    80000ae0:	05013403          	ld	s0,80(sp)
    80000ae4:	05813083          	ld	ra,88(sp)
    80000ae8:	04813483          	ld	s1,72(sp)
    80000aec:	04013903          	ld	s2,64(sp)
    80000af0:	03813983          	ld	s3,56(sp)
    80000af4:	03013a03          	ld	s4,48(sp)
    80000af8:	02813a83          	ld	s5,40(sp)
    80000afc:	00008517          	auipc	a0,0x8
    80000b00:	f2c50513          	add	a0,a0,-212 # 80008a28 <rodata_start+0xa28>
    80000b04:	06010113          	add	sp,sp,96
    80000b08:	0f10106f          	j	800023f8 <uart_puts>

0000000080000b0c <test_alloc_pages_pattern>:
    80000b0c:	fa010113          	add	sp,sp,-96
    80000b10:	00008517          	auipc	a0,0x8
    80000b14:	f4850513          	add	a0,a0,-184 # 80008a58 <rodata_start+0xa58>
    80000b18:	04113c23          	sd	ra,88(sp)
    80000b1c:	04813823          	sd	s0,80(sp)
    80000b20:	04913423          	sd	s1,72(sp)
    80000b24:	05213023          	sd	s2,64(sp)
    80000b28:	03313c23          	sd	s3,56(sp)
    80000b2c:	0cd010ef          	jal	800023f8 <uart_puts>
    80000b30:	01100593          	li	a1,17
    80000b34:	40100513          	li	a0,1025
    80000b38:	01b59593          	sll	a1,a1,0x1b
    80000b3c:	01551513          	sll	a0,a0,0x15
    80000b40:	0e5010ef          	jal	80002424 <pmm_init>
    80000b44:	00810493          	add	s1,sp,8
    80000b48:	00000413          	li	s0,0
    80000b4c:	00008997          	auipc	s3,0x8
    80000b50:	f3498993          	add	s3,s3,-204 # 80008a80 <rodata_start+0xa80>
    80000b54:	00500913          	li	s2,5
    80000b58:	14d010ef          	jal	800024a4 <alloc_page>
    80000b5c:	00050613          	mv	a2,a0
    80000b60:	0014041b          	addw	s0,s0,1
    80000b64:	00c4b023          	sd	a2,0(s1)
    80000b68:	00040593          	mv	a1,s0
    80000b6c:	00098513          	mv	a0,s3
    80000b70:	5d8010ef          	jal	80002148 <printf>
    80000b74:	00848493          	add	s1,s1,8
    80000b78:	ff2410e3          	bne	s0,s2,80000b58 <test_alloc_pages_pattern+0x4c>
    80000b7c:	00813983          	ld	s3,8(sp)
    80000b80:	00098513          	mv	a0,s3
    80000b84:	13d010ef          	jal	800024c0 <free_page>
    80000b88:	01813903          	ld	s2,24(sp)
    80000b8c:	00090513          	mv	a0,s2
    80000b90:	131010ef          	jal	800024c0 <free_page>
    80000b94:	02013483          	ld	s1,32(sp)
    80000b98:	00048513          	mv	a0,s1
    80000b9c:	125010ef          	jal	800024c0 <free_page>
    80000ba0:	02813403          	ld	s0,40(sp)
    80000ba4:	00040513          	mv	a0,s0
    80000ba8:	119010ef          	jal	800024c0 <free_page>
    80000bac:	00098593          	mv	a1,s3
    80000bb0:	00008517          	auipc	a0,0x8
    80000bb4:	ee850513          	add	a0,a0,-280 # 80008a98 <rodata_start+0xa98>
    80000bb8:	590010ef          	jal	80002148 <printf>
    80000bbc:	00090593          	mv	a1,s2
    80000bc0:	00008517          	auipc	a0,0x8
    80000bc4:	ef050513          	add	a0,a0,-272 # 80008ab0 <rodata_start+0xab0>
    80000bc8:	580010ef          	jal	80002148 <printf>
    80000bcc:	00048593          	mv	a1,s1
    80000bd0:	00008517          	auipc	a0,0x8
    80000bd4:	ef850513          	add	a0,a0,-264 # 80008ac8 <rodata_start+0xac8>
    80000bd8:	570010ef          	jal	80002148 <printf>
    80000bdc:	00040593          	mv	a1,s0
    80000be0:	00008517          	auipc	a0,0x8
    80000be4:	f0050513          	add	a0,a0,-256 # 80008ae0 <rodata_start+0xae0>
    80000be8:	560010ef          	jal	80002148 <printf>
    80000bec:	00300513          	li	a0,3
    80000bf0:	10d010ef          	jal	800024fc <alloc_pages>
    80000bf4:	00050493          	mv	s1,a0
    80000bf8:	0a050263          	beqz	a0,80000c9c <test_alloc_pages_pattern+0x190>
    80000bfc:	00008517          	auipc	a0,0x8
    80000c00:	f1450513          	add	a0,a0,-236 # 80008b10 <rodata_start+0xb10>
    80000c04:	7f4010ef          	jal	800023f8 <uart_puts>
    80000c08:	03c00413          	li	s0,60
    80000c0c:	00900993          	li	s3,9
    80000c10:	ffc00913          	li	s2,-4
    80000c14:	0084d7b3          	srl	a5,s1,s0
    80000c18:	00f7f713          	and	a4,a5,15
    80000c1c:	ffc4041b          	addw	s0,s0,-4
    80000c20:	03770513          	add	a0,a4,55
    80000c24:	00e9c463          	blt	s3,a4,80000c2c <test_alloc_pages_pattern+0x120>
    80000c28:	03070513          	add	a0,a4,48
    80000c2c:	7b4010ef          	jal	800023e0 <uart_putc>
    80000c30:	ff2412e3          	bne	s0,s2,80000c14 <test_alloc_pages_pattern+0x108>
    80000c34:	00008517          	auipc	a0,0x8
    80000c38:	15c50513          	add	a0,a0,348 # 80008d90 <rodata_start+0xd90>
    80000c3c:	7bc010ef          	jal	800023f8 <uart_puts>
    80000c40:	00048613          	mv	a2,s1
    80000c44:	00100593          	li	a1,1
    80000c48:	00008517          	auipc	a0,0x8
    80000c4c:	ef050513          	add	a0,a0,-272 # 80008b38 <rodata_start+0xb38>
    80000c50:	4f8010ef          	jal	80002148 <printf>
    80000c54:	00001637          	lui	a2,0x1
    80000c58:	00c48633          	add	a2,s1,a2
    80000c5c:	00200593          	li	a1,2
    80000c60:	00008517          	auipc	a0,0x8
    80000c64:	ed850513          	add	a0,a0,-296 # 80008b38 <rodata_start+0xb38>
    80000c68:	4e0010ef          	jal	80002148 <printf>
    80000c6c:	00002637          	lui	a2,0x2
    80000c70:	05013403          	ld	s0,80(sp)
    80000c74:	05813083          	ld	ra,88(sp)
    80000c78:	04013903          	ld	s2,64(sp)
    80000c7c:	03813983          	ld	s3,56(sp)
    80000c80:	00c48633          	add	a2,s1,a2
    80000c84:	04813483          	ld	s1,72(sp)
    80000c88:	00300593          	li	a1,3
    80000c8c:	00008517          	auipc	a0,0x8
    80000c90:	eac50513          	add	a0,a0,-340 # 80008b38 <rodata_start+0xb38>
    80000c94:	06010113          	add	sp,sp,96
    80000c98:	4b00106f          	j	80002148 <printf>
    80000c9c:	05013403          	ld	s0,80(sp)
    80000ca0:	05813083          	ld	ra,88(sp)
    80000ca4:	04813483          	ld	s1,72(sp)
    80000ca8:	04013903          	ld	s2,64(sp)
    80000cac:	03813983          	ld	s3,56(sp)
    80000cb0:	00008517          	auipc	a0,0x8
    80000cb4:	e4850513          	add	a0,a0,-440 # 80008af8 <rodata_start+0xaf8>
    80000cb8:	06010113          	add	sp,sp,96
    80000cbc:	73c0106f          	j	800023f8 <uart_puts>

0000000080000cc0 <performance_test>:
    80000cc0:	fd010113          	add	sp,sp,-48
    80000cc4:	00008517          	auipc	a0,0x8
    80000cc8:	e9c50513          	add	a0,a0,-356 # 80008b60 <rodata_start+0xb60>
    80000ccc:	02813023          	sd	s0,32(sp)
    80000cd0:	00913c23          	sd	s1,24(sp)
    80000cd4:	01213823          	sd	s2,16(sp)
    80000cd8:	01313423          	sd	s3,8(sp)
    80000cdc:	02113423          	sd	ra,40(sp)
    80000ce0:	00000413          	li	s0,0
    80000ce4:	714010ef          	jal	800023f8 <uart_puts>
    80000ce8:	00009997          	auipc	s3,0x9
    80000cec:	02898993          	add	s3,s3,40 # 80009d10 <long_string>
    80000cf0:	00008917          	auipc	s2,0x8
    80000cf4:	e8890913          	add	s2,s2,-376 # 80008b78 <rodata_start+0xb78>
    80000cf8:	06400493          	li	s1,100
    80000cfc:	00040593          	mv	a1,s0
    80000d00:	00098613          	mv	a2,s3
    80000d04:	0014041b          	addw	s0,s0,1
    80000d08:	00090513          	mv	a0,s2
    80000d0c:	43c010ef          	jal	80002148 <printf>
    80000d10:	fe9416e3          	bne	s0,s1,80000cfc <performance_test+0x3c>
    80000d14:	02013403          	ld	s0,32(sp)
    80000d18:	02813083          	ld	ra,40(sp)
    80000d1c:	01813483          	ld	s1,24(sp)
    80000d20:	01013903          	ld	s2,16(sp)
    80000d24:	00813983          	ld	s3,8(sp)
    80000d28:	00008517          	auipc	a0,0x8
    80000d2c:	e6850513          	add	a0,a0,-408 # 80008b90 <rodata_start+0xb90>
    80000d30:	03010113          	add	sp,sp,48
    80000d34:	6c40106f          	j	800023f8 <uart_puts>

0000000080000d38 <basic_format_test>:
    80000d38:	ff010113          	add	sp,sp,-16
    80000d3c:	00008517          	auipc	a0,0x8
    80000d40:	e6c50513          	add	a0,a0,-404 # 80008ba8 <rodata_start+0xba8>
    80000d44:	00113423          	sd	ra,8(sp)
    80000d48:	6b0010ef          	jal	800023f8 <uart_puts>
    80000d4c:	000035b7          	lui	a1,0x3
    80000d50:	03958593          	add	a1,a1,57 # 3039 <_entry-0x7fffcfc7>
    80000d54:	00008517          	auipc	a0,0x8
    80000d58:	e7c50513          	add	a0,a0,-388 # 80008bd0 <rodata_start+0xbd0>
    80000d5c:	3ec010ef          	jal	80002148 <printf>
    80000d60:	fffe85b7          	lui	a1,0xfffe8
    80000d64:	e3358593          	add	a1,a1,-461 # fffffffffffe7e33 <bss_end+0xffffffff7fbcfc2b>
    80000d68:	00008517          	auipc	a0,0x8
    80000d6c:	e8050513          	add	a0,a0,-384 # 80008be8 <rodata_start+0xbe8>
    80000d70:	3d8010ef          	jal	80002148 <printf>
    80000d74:	deadc5b7          	lui	a1,0xdeadc
    80000d78:	eef58593          	add	a1,a1,-273 # ffffffffdeadbeef <bss_end+0xffffffff5e6c3ce7>
    80000d7c:	00008517          	auipc	a0,0x8
    80000d80:	e8450513          	add	a0,a0,-380 # 80008c00 <rodata_start+0xc00>
    80000d84:	3c4010ef          	jal	80002148 <printf>
    80000d88:	00008597          	auipc	a1,0x8
    80000d8c:	e9858593          	add	a1,a1,-360 # 80008c20 <rodata_start+0xc20>
    80000d90:	00008517          	auipc	a0,0x8
    80000d94:	ea050513          	add	a0,a0,-352 # 80008c30 <rodata_start+0xc30>
    80000d98:	3b0010ef          	jal	80002148 <printf>
    80000d9c:	04100593          	li	a1,65
    80000da0:	00008517          	auipc	a0,0x8
    80000da4:	ea850513          	add	a0,a0,-344 # 80008c48 <rodata_start+0xc48>
    80000da8:	3a0010ef          	jal	80002148 <printf>
    80000dac:	00008517          	auipc	a0,0x8
    80000db0:	eb450513          	add	a0,a0,-332 # 80008c60 <rodata_start+0xc60>
    80000db4:	394010ef          	jal	80002148 <printf>
    80000db8:	00000593          	li	a1,0
    80000dbc:	00008517          	auipc	a0,0x8
    80000dc0:	ebc50513          	add	a0,a0,-324 # 80008c78 <rodata_start+0xc78>
    80000dc4:	384010ef          	jal	80002148 <printf>
    80000dc8:	800005b7          	lui	a1,0x80000
    80000dcc:	fff5c593          	not	a1,a1
    80000dd0:	00008517          	auipc	a0,0x8
    80000dd4:	ec050513          	add	a0,a0,-320 # 80008c90 <rodata_start+0xc90>
    80000dd8:	370010ef          	jal	80002148 <printf>
    80000ddc:	800005b7          	lui	a1,0x80000
    80000de0:	00008517          	auipc	a0,0x8
    80000de4:	ec850513          	add	a0,a0,-312 # 80008ca8 <rodata_start+0xca8>
    80000de8:	360010ef          	jal	80002148 <printf>
    80000dec:	00813083          	ld	ra,8(sp)
    80000df0:	00008517          	auipc	a0,0x8
    80000df4:	ed050513          	add	a0,a0,-304 # 80008cc0 <rodata_start+0xcc0>
    80000df8:	01010113          	add	sp,sp,16
    80000dfc:	5fc0106f          	j	800023f8 <uart_puts>

0000000080000e00 <boundary_test>:
    80000e00:	ff010113          	add	sp,sp,-16
    80000e04:	00008517          	auipc	a0,0x8
    80000e08:	ee450513          	add	a0,a0,-284 # 80008ce8 <rodata_start+0xce8>
    80000e0c:	00113423          	sd	ra,8(sp)
    80000e10:	5e8010ef          	jal	800023f8 <uart_puts>
    80000e14:	00000593          	li	a1,0
    80000e18:	00008517          	auipc	a0,0x8
    80000e1c:	ef850513          	add	a0,a0,-264 # 80008d10 <rodata_start+0xd10>
    80000e20:	328010ef          	jal	80002148 <printf>
    80000e24:	00008597          	auipc	a1,0x8
    80000e28:	75c58593          	add	a1,a1,1884 # 80009580 <rodata_start+0x1580>
    80000e2c:	00008517          	auipc	a0,0x8
    80000e30:	efc50513          	add	a0,a0,-260 # 80008d28 <rodata_start+0xd28>
    80000e34:	314010ef          	jal	80002148 <printf>
    80000e38:	00008517          	auipc	a0,0x8
    80000e3c:	f0850513          	add	a0,a0,-248 # 80008d40 <rodata_start+0xd40>
    80000e40:	308010ef          	jal	80002148 <printf>
    80000e44:	00008517          	auipc	a0,0x8
    80000e48:	f1450513          	add	a0,a0,-236 # 80008d58 <rodata_start+0xd58>
    80000e4c:	2fc010ef          	jal	80002148 <printf>
    80000e50:	00813083          	ld	ra,8(sp)
    80000e54:	00008517          	auipc	a0,0x8
    80000e58:	f1c50513          	add	a0,a0,-228 # 80008d70 <rodata_start+0xd70>
    80000e5c:	01010113          	add	sp,sp,16
    80000e60:	5980106f          	j	800023f8 <uart_puts>

0000000080000e64 <color_test>:
    80000e64:	ff010113          	add	sp,sp,-16
    80000e68:	00008517          	auipc	a0,0x8
    80000e6c:	f3050513          	add	a0,a0,-208 # 80008d98 <rodata_start+0xd98>
    80000e70:	00113423          	sd	ra,8(sp)
    80000e74:	584010ef          	jal	800023f8 <uart_puts>
    80000e78:	00008597          	auipc	a1,0x8
    80000e7c:	f4058593          	add	a1,a1,-192 # 80008db8 <rodata_start+0xdb8>
    80000e80:	01f00513          	li	a0,31
    80000e84:	078010ef          	jal	80001efc <printf_color>
    80000e88:	00008597          	auipc	a1,0x8
    80000e8c:	f4058593          	add	a1,a1,-192 # 80008dc8 <rodata_start+0xdc8>
    80000e90:	02000513          	li	a0,32
    80000e94:	068010ef          	jal	80001efc <printf_color>
    80000e98:	00008597          	auipc	a1,0x8
    80000e9c:	f4058593          	add	a1,a1,-192 # 80008dd8 <rodata_start+0xdd8>
    80000ea0:	02200513          	li	a0,34
    80000ea4:	058010ef          	jal	80001efc <printf_color>
    80000ea8:	00008597          	auipc	a1,0x8
    80000eac:	f4058593          	add	a1,a1,-192 # 80008de8 <rodata_start+0xde8>
    80000eb0:	02100513          	li	a0,33
    80000eb4:	048010ef          	jal	80001efc <printf_color>
    80000eb8:	00008597          	auipc	a1,0x8
    80000ebc:	f4058593          	add	a1,a1,-192 # 80008df8 <rodata_start+0xdf8>
    80000ec0:	02300513          	li	a0,35
    80000ec4:	038010ef          	jal	80001efc <printf_color>
    80000ec8:	00008597          	auipc	a1,0x8
    80000ecc:	f4858593          	add	a1,a1,-184 # 80008e10 <rodata_start+0xe10>
    80000ed0:	02400513          	li	a0,36
    80000ed4:	028010ef          	jal	80001efc <printf_color>
    80000ed8:	00008597          	auipc	a1,0x8
    80000edc:	f4858593          	add	a1,a1,-184 # 80008e20 <rodata_start+0xe20>
    80000ee0:	02500513          	li	a0,37
    80000ee4:	018010ef          	jal	80001efc <printf_color>
    80000ee8:	06400613          	li	a2,100
    80000eec:	00008597          	auipc	a1,0x8
    80000ef0:	f4458593          	add	a1,a1,-188 # 80008e30 <rodata_start+0xe30>
    80000ef4:	01f00513          	li	a0,31
    80000ef8:	004010ef          	jal	80001efc <printf_color>
    80000efc:	00008617          	auipc	a2,0x8
    80000f00:	f4c60613          	add	a2,a2,-180 # 80008e48 <rodata_start+0xe48>
    80000f04:	00008597          	auipc	a1,0x8
    80000f08:	f4c58593          	add	a1,a1,-180 # 80008e50 <rodata_start+0xe50>
    80000f0c:	02000513          	li	a0,32
    80000f10:	7ed000ef          	jal	80001efc <printf_color>
    80000f14:	00813083          	ld	ra,8(sp)
    80000f18:	00008517          	auipc	a0,0x8
    80000f1c:	f5050513          	add	a0,a0,-176 # 80008e68 <rodata_start+0xe68>
    80000f20:	01010113          	add	sp,sp,16
    80000f24:	4d40106f          	j	800023f8 <uart_puts>

0000000080000f28 <screen_test>:
    80000f28:	fd010113          	add	sp,sp,-48
    80000f2c:	00008517          	auipc	a0,0x8
    80000f30:	f5c50513          	add	a0,a0,-164 # 80008e88 <rodata_start+0xe88>
    80000f34:	02113423          	sd	ra,40(sp)
    80000f38:	02813023          	sd	s0,32(sp)
    80000f3c:	00913c23          	sd	s1,24(sp)
    80000f40:	01213823          	sd	s2,16(sp)
    80000f44:	4b4010ef          	jal	800023f8 <uart_puts>
    80000f48:	00008517          	auipc	a0,0x8
    80000f4c:	f6850513          	add	a0,a0,-152 # 80008eb0 <rodata_start+0xeb0>
    80000f50:	4a8010ef          	jal	800023f8 <uart_puts>
    80000f54:	00000413          	li	s0,0
    80000f58:	00008917          	auipc	s2,0x8
    80000f5c:	f7090913          	add	s2,s2,-144 # 80008ec8 <rodata_start+0xec8>
    80000f60:	00500493          	li	s1,5
    80000f64:	00040593          	mv	a1,s0
    80000f68:	00090513          	mv	a0,s2
    80000f6c:	0014041b          	addw	s0,s0,1
    80000f70:	1d8010ef          	jal	80002148 <printf>
    80000f74:	fe9418e3          	bne	s0,s1,80000f64 <screen_test+0x3c>
    80000f78:	00012623          	sw	zero,12(sp)
    80000f7c:	00c12783          	lw	a5,12(sp)
    80000f80:	00018737          	lui	a4,0x18
    80000f84:	69f70713          	add	a4,a4,1695 # 1869f <_entry-0x7ffe7961>
    80000f88:	00f74c63          	blt	a4,a5,80000fa0 <screen_test+0x78>
    80000f8c:	00c12783          	lw	a5,12(sp)
    80000f90:	0017879b          	addw	a5,a5,1
    80000f94:	00f12623          	sw	a5,12(sp)
    80000f98:	00c12783          	lw	a5,12(sp)
    80000f9c:	fef758e3          	bge	a4,a5,80000f8c <screen_test+0x64>
    80000fa0:	5b9000ef          	jal	80001d58 <clear_screen>
    80000fa4:	00008517          	auipc	a0,0x8
    80000fa8:	f2c50513          	add	a0,a0,-212 # 80008ed0 <rodata_start+0xed0>
    80000fac:	44c010ef          	jal	800023f8 <uart_puts>
    80000fb0:	00008517          	auipc	a0,0x8
    80000fb4:	f5850513          	add	a0,a0,-168 # 80008f08 <rodata_start+0xf08>
    80000fb8:	440010ef          	jal	800023f8 <uart_puts>
    80000fbc:	00500593          	li	a1,5
    80000fc0:	00100513          	li	a0,1
    80000fc4:	5ad000ef          	jal	80001d70 <goto_xy>
    80000fc8:	00008517          	auipc	a0,0x8
    80000fcc:	f5850513          	add	a0,a0,-168 # 80008f20 <rodata_start+0xf20>
    80000fd0:	428010ef          	jal	800023f8 <uart_puts>
    80000fd4:	00500593          	li	a1,5
    80000fd8:	01400513          	li	a0,20
    80000fdc:	595000ef          	jal	80001d70 <goto_xy>
    80000fe0:	00008517          	auipc	a0,0x8
    80000fe4:	f5050513          	add	a0,a0,-176 # 80008f30 <rodata_start+0xf30>
    80000fe8:	410010ef          	jal	800023f8 <uart_puts>
    80000fec:	00700593          	li	a1,7
    80000ff0:	00100513          	li	a0,1
    80000ff4:	57d000ef          	jal	80001d70 <goto_xy>
    80000ff8:	00008597          	auipc	a1,0x8
    80000ffc:	f4858593          	add	a1,a1,-184 # 80008f40 <rodata_start+0xf40>
    80001000:	02400513          	li	a0,36
    80001004:	6f9000ef          	jal	80001efc <printf_color>
    80001008:	00900593          	li	a1,9
    8000100c:	00100513          	li	a0,1
    80001010:	561000ef          	jal	80001d70 <goto_xy>
    80001014:	00008517          	auipc	a0,0x8
    80001018:	f4450513          	add	a0,a0,-188 # 80008f58 <rodata_start+0xf58>
    8000101c:	3dc010ef          	jal	800023f8 <uart_puts>
    80001020:	00a00593          	li	a1,10
    80001024:	00100513          	li	a0,1
    80001028:	549000ef          	jal	80001d70 <goto_xy>
    8000102c:	539000ef          	jal	80001d64 <clear_line>
    80001030:	00008517          	auipc	a0,0x8
    80001034:	f4050513          	add	a0,a0,-192 # 80008f70 <rodata_start+0xf70>
    80001038:	3c0010ef          	jal	800023f8 <uart_puts>
    8000103c:	02013403          	ld	s0,32(sp)
    80001040:	02813083          	ld	ra,40(sp)
    80001044:	01813483          	ld	s1,24(sp)
    80001048:	01013903          	ld	s2,16(sp)
    8000104c:	00008517          	auipc	a0,0x8
    80001050:	f4c50513          	add	a0,a0,-180 # 80008f98 <rodata_start+0xf98>
    80001054:	03010113          	add	sp,sp,48
    80001058:	3a00106f          	j	800023f8 <uart_puts>

000000008000105c <error_recovery_test>:
    8000105c:	ff010113          	add	sp,sp,-16
    80001060:	00008517          	auipc	a0,0x8
    80001064:	f6050513          	add	a0,a0,-160 # 80008fc0 <rodata_start+0xfc0>
    80001068:	00113423          	sd	ra,8(sp)
    8000106c:	38c010ef          	jal	800023f8 <uart_puts>
    80001070:	00000513          	li	a0,0
    80001074:	0d4010ef          	jal	80002148 <printf>
    80001078:	02054863          	bltz	a0,800010a8 <error_recovery_test+0x4c>
    8000107c:	00008617          	auipc	a2,0x8
    80001080:	f8c60613          	add	a2,a2,-116 # 80009008 <rodata_start+0x1008>
    80001084:	02a00593          	li	a1,42
    80001088:	00008517          	auipc	a0,0x8
    8000108c:	f8850513          	add	a0,a0,-120 # 80009010 <rodata_start+0x1010>
    80001090:	0b8010ef          	jal	80002148 <printf>
    80001094:	00813083          	ld	ra,8(sp)
    80001098:	00008517          	auipc	a0,0x8
    8000109c:	f9850513          	add	a0,a0,-104 # 80009030 <rodata_start+0x1030>
    800010a0:	01010113          	add	sp,sp,16
    800010a4:	3540106f          	j	800023f8 <uart_puts>
    800010a8:	00008517          	auipc	a0,0x8
    800010ac:	f3850513          	add	a0,a0,-200 # 80008fe0 <rodata_start+0xfe0>
    800010b0:	348010ef          	jal	800023f8 <uart_puts>
    800010b4:	fc9ff06f          	j	8000107c <error_recovery_test+0x20>

00000000800010b8 <print_page_replacement_info>:
    800010b8:	ff010113          	add	sp,sp,-16
    800010bc:	00008517          	auipc	a0,0x8
    800010c0:	f9450513          	add	a0,a0,-108 # 80009050 <rodata_start+0x1050>
    800010c4:	00113423          	sd	ra,8(sp)
    800010c8:	330010ef          	jal	800023f8 <uart_puts>
    800010cc:	00008517          	auipc	a0,0x8
    800010d0:	fac50513          	add	a0,a0,-84 # 80009078 <rodata_start+0x1078>
    800010d4:	324010ef          	jal	800023f8 <uart_puts>
    800010d8:	00008517          	auipc	a0,0x8
    800010dc:	fb050513          	add	a0,a0,-80 # 80009088 <rodata_start+0x1088>
    800010e0:	318010ef          	jal	800023f8 <uart_puts>
    800010e4:	00008517          	auipc	a0,0x8
    800010e8:	fd450513          	add	a0,a0,-44 # 800090b8 <rodata_start+0x10b8>
    800010ec:	30c010ef          	jal	800023f8 <uart_puts>
    800010f0:	00008517          	auipc	a0,0x8
    800010f4:	ff050513          	add	a0,a0,-16 # 800090e0 <rodata_start+0x10e0>
    800010f8:	300010ef          	jal	800023f8 <uart_puts>
    800010fc:	00008517          	auipc	a0,0x8
    80001100:	ffc50513          	add	a0,a0,-4 # 800090f8 <rodata_start+0x10f8>
    80001104:	2f4010ef          	jal	800023f8 <uart_puts>
    80001108:	00008517          	auipc	a0,0x8
    8000110c:	01050513          	add	a0,a0,16 # 80009118 <rodata_start+0x1118>
    80001110:	2e8010ef          	jal	800023f8 <uart_puts>
    80001114:	00008517          	auipc	a0,0x8
    80001118:	02450513          	add	a0,a0,36 # 80009138 <rodata_start+0x1138>
    8000111c:	2dc010ef          	jal	800023f8 <uart_puts>
    80001120:	00008517          	auipc	a0,0x8
    80001124:	03050513          	add	a0,a0,48 # 80009150 <rodata_start+0x1150>
    80001128:	2d0010ef          	jal	800023f8 <uart_puts>
    8000112c:	00008517          	auipc	a0,0x8
    80001130:	04c50513          	add	a0,a0,76 # 80009178 <rodata_start+0x1178>
    80001134:	2c4010ef          	jal	800023f8 <uart_puts>
    80001138:	00008517          	auipc	a0,0x8
    8000113c:	07050513          	add	a0,a0,112 # 800091a8 <rodata_start+0x11a8>
    80001140:	2b8010ef          	jal	800023f8 <uart_puts>
    80001144:	00008517          	auipc	a0,0x8
    80001148:	09450513          	add	a0,a0,148 # 800091d8 <rodata_start+0x11d8>
    8000114c:	2ac010ef          	jal	800023f8 <uart_puts>
    80001150:	00008517          	auipc	a0,0x8
    80001154:	09850513          	add	a0,a0,152 # 800091e8 <rodata_start+0x11e8>
    80001158:	2a0010ef          	jal	800023f8 <uart_puts>
    8000115c:	00008517          	auipc	a0,0x8
    80001160:	0b450513          	add	a0,a0,180 # 80009210 <rodata_start+0x1210>
    80001164:	294010ef          	jal	800023f8 <uart_puts>
    80001168:	00008517          	auipc	a0,0x8
    8000116c:	0c850513          	add	a0,a0,200 # 80009230 <rodata_start+0x1230>
    80001170:	288010ef          	jal	800023f8 <uart_puts>
    80001174:	00008517          	auipc	a0,0x8
    80001178:	0e450513          	add	a0,a0,228 # 80009258 <rodata_start+0x1258>
    8000117c:	27c010ef          	jal	800023f8 <uart_puts>
    80001180:	00008517          	auipc	a0,0x8
    80001184:	10050513          	add	a0,a0,256 # 80009280 <rodata_start+0x1280>
    80001188:	270010ef          	jal	800023f8 <uart_puts>
    8000118c:	00008517          	auipc	a0,0x8
    80001190:	10450513          	add	a0,a0,260 # 80009290 <rodata_start+0x1290>
    80001194:	264010ef          	jal	800023f8 <uart_puts>
    80001198:	00008517          	auipc	a0,0x8
    8000119c:	13050513          	add	a0,a0,304 # 800092c8 <rodata_start+0x12c8>
    800011a0:	258010ef          	jal	800023f8 <uart_puts>
    800011a4:	00008517          	auipc	a0,0x8
    800011a8:	15c50513          	add	a0,a0,348 # 80009300 <rodata_start+0x1300>
    800011ac:	24c010ef          	jal	800023f8 <uart_puts>
    800011b0:	00008517          	auipc	a0,0x8
    800011b4:	19050513          	add	a0,a0,400 # 80009340 <rodata_start+0x1340>
    800011b8:	240010ef          	jal	800023f8 <uart_puts>
    800011bc:	00813083          	ld	ra,8(sp)
    800011c0:	00007517          	auipc	a0,0x7
    800011c4:	39050513          	add	a0,a0,912 # 80008550 <rodata_start+0x550>
    800011c8:	01010113          	add	sp,sp,16
    800011cc:	22c0106f          	j	800023f8 <uart_puts>

00000000800011d0 <demonstrate_page_replacement>:
    800011d0:	f5010113          	add	sp,sp,-176
    800011d4:	00008517          	auipc	a0,0x8
    800011d8:	19c50513          	add	a0,a0,412 # 80009370 <rodata_start+0x1370>
    800011dc:	0a113423          	sd	ra,168(sp)
    800011e0:	0a813023          	sd	s0,160(sp)
    800011e4:	08913c23          	sd	s1,152(sp)
    800011e8:	09213823          	sd	s2,144(sp)
    800011ec:	09313423          	sd	s3,136(sp)
    800011f0:	09413023          	sd	s4,128(sp)
    800011f4:	07513c23          	sd	s5,120(sp)
    800011f8:	07613823          	sd	s6,112(sp)
    800011fc:	07713423          	sd	s7,104(sp)
    80001200:	07813023          	sd	s8,96(sp)
    80001204:	05913c23          	sd	s9,88(sp)
    80001208:	05a13823          	sd	s10,80(sp)
    8000120c:	05b13423          	sd	s11,72(sp)
    80001210:	1e8010ef          	jal	800023f8 <uart_puts>
    80001214:	00008517          	auipc	a0,0x8
    80001218:	18450513          	add	a0,a0,388 # 80009398 <rodata_start+0x1398>
    8000121c:	1dc010ef          	jal	800023f8 <uart_puts>
    80001220:	5b5010ef          	jal	80002fd4 <init_page_replacement>
    80001224:	00008517          	auipc	a0,0x8
    80001228:	19450513          	add	a0,a0,404 # 800093b8 <rodata_start+0x13b8>
    8000122c:	1cc010ef          	jal	800023f8 <uart_puts>
    80001230:	440010ef          	jal	80002670 <create_pagetable>
    80001234:	24050863          	beqz	a0,80001484 <demonstrate_page_replacement+0x2b4>
    80001238:	00050b13          	mv	s6,a0
    8000123c:	00008517          	auipc	a0,0x8
    80001240:	1b450513          	add	a0,a0,436 # 800093f0 <rodata_start+0x13f0>
    80001244:	1b4010ef          	jal	800023f8 <uart_puts>
    80001248:	100007b7          	lui	a5,0x10000
    8000124c:	00f13023          	sd	a5,0(sp)
    80001250:	100017b7          	lui	a5,0x10001
    80001254:	00f13423          	sd	a5,8(sp)
    80001258:	100027b7          	lui	a5,0x10002
    8000125c:	02010913          	add	s2,sp,32
    80001260:	00010493          	mv	s1,sp
    80001264:	00f13823          	sd	a5,16(sp)
    80001268:	100037b7          	lui	a5,0x10003
    8000126c:	00f13c23          	sd	a5,24(sp)
    80001270:	04010b93          	add	s7,sp,64
    80001274:	00048a93          	mv	s5,s1
    80001278:	00090a13          	mv	s4,s2
    8000127c:	00008d17          	auipc	s10,0x8
    80001280:	1bcd0d13          	add	s10,s10,444 # 80009438 <rodata_start+0x1438>
    80001284:	0340006f          	j	800012b8 <demonstrate_page_replacement+0xe8>
    80001288:	000ab983          	ld	s3,0(s5)
    8000128c:	01600693          	li	a3,22
    80001290:	000b0513          	mv	a0,s6
    80001294:	00098593          	mv	a1,s3
    80001298:	40c010ef          	jal	800026a4 <map_page>
    8000129c:	00050413          	mv	s0,a0
    800012a0:	10050e63          	beqz	a0,800013bc <demonstrate_page_replacement+0x1ec>
    800012a4:	000d0513          	mv	a0,s10
    800012a8:	150010ef          	jal	800023f8 <uart_puts>
    800012ac:	008a0a13          	add	s4,s4,8
    800012b0:	008a8a93          	add	s5,s5,8
    800012b4:	037a0663          	beq	s4,s7,800012e0 <demonstrate_page_replacement+0x110>
    800012b8:	1ec010ef          	jal	800024a4 <alloc_page>
    800012bc:	00aa3023          	sd	a0,0(s4)
    800012c0:	00050613          	mv	a2,a0
    800012c4:	fc0512e3          	bnez	a0,80001288 <demonstrate_page_replacement+0xb8>
    800012c8:	00008517          	auipc	a0,0x8
    800012cc:	18850513          	add	a0,a0,392 # 80009450 <rodata_start+0x1450>
    800012d0:	008a0a13          	add	s4,s4,8
    800012d4:	124010ef          	jal	800023f8 <uart_puts>
    800012d8:	008a8a93          	add	s5,s5,8
    800012dc:	fd7a1ee3          	bne	s4,s7,800012b8 <demonstrate_page_replacement+0xe8>
    800012e0:	00008517          	auipc	a0,0x8
    800012e4:	19050513          	add	a0,a0,400 # 80009470 <rodata_start+0x1470>
    800012e8:	110010ef          	jal	800023f8 <uart_puts>
    800012ec:	02048413          	add	s0,s1,32
    800012f0:	0004b503          	ld	a0,0(s1)
    800012f4:	00848493          	add	s1,s1,8
    800012f8:	208020ef          	jal	80003500 <lru_touch_page>
    800012fc:	fe849ae3          	bne	s1,s0,800012f0 <demonstrate_page_replacement+0x120>
    80001300:	00008517          	auipc	a0,0x8
    80001304:	19850513          	add	a0,a0,408 # 80009498 <rodata_start+0x1498>
    80001308:	0f0010ef          	jal	800023f8 <uart_puts>
    8000130c:	215020ef          	jal	80003d20 <test_page_replacement>
    80001310:	00008517          	auipc	a0,0x8
    80001314:	1a850513          	add	a0,a0,424 # 800094b8 <rodata_start+0x14b8>
    80001318:	0e0010ef          	jal	800023f8 <uart_puts>
    8000131c:	100005b7          	lui	a1,0x10000
    80001320:	000b0513          	mv	a0,s6
    80001324:	6f0020ef          	jal	80003a14 <va2pa_with_replacement>
    80001328:	12051863          	bnez	a0,80001458 <demonstrate_page_replacement+0x288>
    8000132c:	00008517          	auipc	a0,0x8
    80001330:	1ac50513          	add	a0,a0,428 # 800094d8 <rodata_start+0x14d8>
    80001334:	0c4010ef          	jal	800023f8 <uart_puts>
    80001338:	100015b7          	lui	a1,0x10001
    8000133c:	000b0513          	mv	a0,s6
    80001340:	6d4020ef          	jal	80003a14 <va2pa_with_replacement>
    80001344:	12051863          	bnez	a0,80001474 <demonstrate_page_replacement+0x2a4>
    80001348:	00008517          	auipc	a0,0x8
    8000134c:	19050513          	add	a0,a0,400 # 800094d8 <rodata_start+0x14d8>
    80001350:	0a8010ef          	jal	800023f8 <uart_puts>
    80001354:	00008517          	auipc	a0,0x8
    80001358:	1c450513          	add	a0,a0,452 # 80009518 <rodata_start+0x1518>
    8000135c:	09c010ef          	jal	800023f8 <uart_puts>
    80001360:	00093503          	ld	a0,0(s2)
    80001364:	00890913          	add	s2,s2,8
    80001368:	0e051463          	bnez	a0,80001450 <demonstrate_page_replacement+0x280>
    8000136c:	ff791ae3          	bne	s2,s7,80001360 <demonstrate_page_replacement+0x190>
    80001370:	000b0513          	mv	a0,s6
    80001374:	5f4010ef          	jal	80002968 <destroy_pagetable>
    80001378:	00008517          	auipc	a0,0x8
    8000137c:	1b850513          	add	a0,a0,440 # 80009530 <rodata_start+0x1530>
    80001380:	0a013403          	ld	s0,160(sp)
    80001384:	0a813083          	ld	ra,168(sp)
    80001388:	09813483          	ld	s1,152(sp)
    8000138c:	09013903          	ld	s2,144(sp)
    80001390:	08813983          	ld	s3,136(sp)
    80001394:	08013a03          	ld	s4,128(sp)
    80001398:	07813a83          	ld	s5,120(sp)
    8000139c:	07013b03          	ld	s6,112(sp)
    800013a0:	06813b83          	ld	s7,104(sp)
    800013a4:	06013c03          	ld	s8,96(sp)
    800013a8:	05813c83          	ld	s9,88(sp)
    800013ac:	05013d03          	ld	s10,80(sp)
    800013b0:	04813d83          	ld	s11,72(sp)
    800013b4:	0b010113          	add	sp,sp,176
    800013b8:	0400106f          	j	800023f8 <uart_puts>
    800013bc:	00008517          	auipc	a0,0x8
    800013c0:	05450513          	add	a0,a0,84 # 80009410 <rodata_start+0x1410>
    800013c4:	034010ef          	jal	800023f8 <uart_puts>
    800013c8:	00009517          	auipc	a0,0x9
    800013cc:	53850513          	add	a0,a0,1336 # 8000a900 <digits+0x7c0>
    800013d0:	028010ef          	jal	800023f8 <uart_puts>
    800013d4:	03c00d93          	li	s11,60
    800013d8:	00900c93          	li	s9,9
    800013dc:	ffc00c13          	li	s8,-4
    800013e0:	01b9d7b3          	srl	a5,s3,s11
    800013e4:	00f7f793          	and	a5,a5,15
    800013e8:	0087e433          	or	s0,a5,s0
    800013ec:	0004041b          	sext.w	s0,s0
    800013f0:	02041063          	bnez	s0,80001410 <demonstrate_page_replacement+0x240>
    800013f4:	020d8e63          	beqz	s11,80001430 <demonstrate_page_replacement+0x260>
    800013f8:	ffcd8d9b          	addw	s11,s11,-4
    800013fc:	01b9d7b3          	srl	a5,s3,s11
    80001400:	00f7f793          	and	a5,a5,15
    80001404:	0087e433          	or	s0,a5,s0
    80001408:	0004041b          	sext.w	s0,s0
    8000140c:	fe0404e3          	beqz	s0,800013f4 <demonstrate_page_replacement+0x224>
    80001410:	ffcd8d9b          	addw	s11,s11,-4
    80001414:	03778513          	add	a0,a5,55 # 10003037 <_entry-0x6fffcfc9>
    80001418:	0ff7f693          	zext.b	a3,a5
    8000141c:	02fcd663          	bge	s9,a5,80001448 <demonstrate_page_replacement+0x278>
    80001420:	7c1000ef          	jal	800023e0 <uart_putc>
    80001424:	018d8a63          	beq	s11,s8,80001438 <demonstrate_page_replacement+0x268>
    80001428:	00100413          	li	s0,1
    8000142c:	fb5ff06f          	j	800013e0 <demonstrate_page_replacement+0x210>
    80001430:	03000513          	li	a0,48
    80001434:	7ad000ef          	jal	800023e0 <uart_putc>
    80001438:	00008517          	auipc	a0,0x8
    8000143c:	ff050513          	add	a0,a0,-16 # 80009428 <rodata_start+0x1428>
    80001440:	7b9000ef          	jal	800023f8 <uart_puts>
    80001444:	e69ff06f          	j	800012ac <demonstrate_page_replacement+0xdc>
    80001448:	03068513          	add	a0,a3,48
    8000144c:	fd5ff06f          	j	80001420 <demonstrate_page_replacement+0x250>
    80001450:	070010ef          	jal	800024c0 <free_page>
    80001454:	f19ff06f          	j	8000136c <demonstrate_page_replacement+0x19c>
    80001458:	00008517          	auipc	a0,0x8
    8000145c:	0a050513          	add	a0,a0,160 # 800094f8 <rodata_start+0x14f8>
    80001460:	799000ef          	jal	800023f8 <uart_puts>
    80001464:	100015b7          	lui	a1,0x10001
    80001468:	000b0513          	mv	a0,s6
    8000146c:	5a8020ef          	jal	80003a14 <va2pa_with_replacement>
    80001470:	ec050ce3          	beqz	a0,80001348 <demonstrate_page_replacement+0x178>
    80001474:	00008517          	auipc	a0,0x8
    80001478:	08450513          	add	a0,a0,132 # 800094f8 <rodata_start+0x14f8>
    8000147c:	77d000ef          	jal	800023f8 <uart_puts>
    80001480:	ed5ff06f          	j	80001354 <demonstrate_page_replacement+0x184>
    80001484:	00008517          	auipc	a0,0x8
    80001488:	f4c50513          	add	a0,a0,-180 # 800093d0 <rodata_start+0x13d0>
    8000148c:	ef5ff06f          	j	80001380 <demonstrate_page_replacement+0x1b0>

0000000080001490 <page_replacement_example>:
    80001490:	ff010113          	add	sp,sp,-16
    80001494:	00008517          	auipc	a0,0x8
    80001498:	0c450513          	add	a0,a0,196 # 80009558 <rodata_start+0x1558>
    8000149c:	00113423          	sd	ra,8(sp)
    800014a0:	759000ef          	jal	800023f8 <uart_puts>
    800014a4:	c15ff0ef          	jal	800010b8 <print_page_replacement_info>
    800014a8:	d29ff0ef          	jal	800011d0 <demonstrate_page_replacement>
    800014ac:	075020ef          	jal	80003d20 <test_page_replacement>
    800014b0:	00813083          	ld	ra,8(sp)
    800014b4:	00008517          	auipc	a0,0x8
    800014b8:	0d450513          	add	a0,a0,212 # 80009588 <rodata_start+0x1588>
    800014bc:	01010113          	add	sp,sp,16
    800014c0:	7390006f          	j	800023f8 <uart_puts>

00000000800014c4 <advanced_page_replacement_example>:
    800014c4:	ef010113          	add	sp,sp,-272
    800014c8:	00008517          	auipc	a0,0x8
    800014cc:	0f050513          	add	a0,a0,240 # 800095b8 <rodata_start+0x15b8>
    800014d0:	10113423          	sd	ra,264(sp)
    800014d4:	10813023          	sd	s0,256(sp)
    800014d8:	0e913c23          	sd	s1,248(sp)
    800014dc:	0f213823          	sd	s2,240(sp)
    800014e0:	0f313423          	sd	s3,232(sp)
    800014e4:	0f413023          	sd	s4,224(sp)
    800014e8:	0d513c23          	sd	s5,216(sp)
    800014ec:	0d613823          	sd	s6,208(sp)
    800014f0:	0d713423          	sd	s7,200(sp)
    800014f4:	0d813023          	sd	s8,192(sp)
    800014f8:	0b913c23          	sd	s9,184(sp)
    800014fc:	0ba13823          	sd	s10,176(sp)
    80001500:	6f9000ef          	jal	800023f8 <uart_puts>
    80001504:	16c010ef          	jal	80002670 <create_pagetable>
    80001508:	26050863          	beqz	a0,80001778 <advanced_page_replacement_example+0x2b4>
    8000150c:	00050493          	mv	s1,a0
    80001510:	00008517          	auipc	a0,0x8
    80001514:	0f850513          	add	a0,a0,248 # 80009608 <rodata_start+0x1608>
    80001518:	6e1000ef          	jal	800023f8 <uart_puts>
    8000151c:	00008797          	auipc	a5,0x8
    80001520:	7f478793          	add	a5,a5,2036 # 80009d10 <long_string>
    80001524:	1b87b583          	ld	a1,440(a5)
    80001528:	1c07b603          	ld	a2,448(a5)
    8000152c:	1c87b683          	ld	a3,456(a5)
    80001530:	1d07b703          	ld	a4,464(a5)
    80001534:	1d87b783          	ld	a5,472(a5)
    80001538:	03010a93          	add	s5,sp,48
    8000153c:	00810913          	add	s2,sp,8
    80001540:	03200a13          	li	s4,50
    80001544:	00b13423          	sd	a1,8(sp)
    80001548:	00c13823          	sd	a2,16(sp)
    8000154c:	00d13c23          	sd	a3,24(sp)
    80001550:	02e13023          	sd	a4,32(sp)
    80001554:	02f13423          	sd	a5,40(sp)
    80001558:	4150043b          	negw	s0,s5
    8000155c:	415a0a3b          	subw	s4,s4,s5
    80001560:	00090993          	mv	s3,s2
    80001564:	00008b17          	auipc	s6,0x8
    80001568:	10cb0b13          	add	s6,s6,268 # 80009670 <rodata_start+0x1670>
    8000156c:	0180006f          	j	80001584 <advanced_page_replacement_example+0xc0>
    80001570:	000b0513          	mv	a0,s6
    80001574:	685000ef          	jal	800023f8 <uart_puts>
    80001578:	00a4041b          	addw	s0,s0,10
    8000157c:	00898993          	add	s3,s3,8
    80001580:	09440063          	beq	s0,s4,80001600 <advanced_page_replacement_example+0x13c>
    80001584:	721000ef          	jal	800024a4 <alloc_page>
    80001588:	00050613          	mv	a2,a0
    8000158c:	fe0502e3          	beqz	a0,80001570 <advanced_page_replacement_example+0xac>
    80001590:	0009bb83          	ld	s7,0(s3)
    80001594:	01600693          	li	a3,22
    80001598:	00048513          	mv	a0,s1
    8000159c:	000b8593          	mv	a1,s7
    800015a0:	104010ef          	jal	800026a4 <map_page>
    800015a4:	fc0516e3          	bnez	a0,80001570 <advanced_page_replacement_example+0xac>
    800015a8:	03fa8613          	add	a2,s5,63
    800015ac:	000a8713          	mv	a4,s5
    800015b0:	01a00693          	li	a3,26
    800015b4:	008707bb          	addw	a5,a4,s0
    800015b8:	02d7e7bb          	remw	a5,a5,a3
    800015bc:	00170713          	add	a4,a4,1
    800015c0:	0417879b          	addw	a5,a5,65
    800015c4:	fef70fa3          	sb	a5,-1(a4)
    800015c8:	fec716e3          	bne	a4,a2,800015b4 <advanced_page_replacement_example+0xf0>
    800015cc:	04000693          	li	a3,64
    800015d0:	000a8613          	mv	a2,s5
    800015d4:	000b8593          	mv	a1,s7
    800015d8:	00048513          	mv	a0,s1
    800015dc:	060107a3          	sb	zero,111(sp)
    800015e0:	500020ef          	jal	80003ae0 <safe_copyout>
    800015e4:	18051263          	bnez	a0,80001768 <advanced_page_replacement_example+0x2a4>
    800015e8:	00008517          	auipc	a0,0x8
    800015ec:	04850513          	add	a0,a0,72 # 80009630 <rodata_start+0x1630>
    800015f0:	00a4041b          	addw	s0,s0,10
    800015f4:	605000ef          	jal	800023f8 <uart_puts>
    800015f8:	00898993          	add	s3,s3,8
    800015fc:	f94414e3          	bne	s0,s4,80001584 <advanced_page_replacement_example+0xc0>
    80001600:	00008517          	auipc	a0,0x8
    80001604:	08850513          	add	a0,a0,136 # 80009688 <rodata_start+0x1688>
    80001608:	5f1000ef          	jal	800023f8 <uart_puts>
    8000160c:	03100a93          	li	s5,49
    80001610:	00008d17          	auipc	s10,0x8
    80001614:	098d0d13          	add	s10,s10,152 # 800096a8 <rodata_start+0x16a8>
    80001618:	00007b97          	auipc	s7,0x7
    8000161c:	778b8b93          	add	s7,s7,1912 # 80008d90 <rodata_start+0xd90>
    80001620:	00008c17          	auipc	s8,0x8
    80001624:	0a0c0c13          	add	s8,s8,160 # 800096c0 <rodata_start+0x16c0>
    80001628:	03600b13          	li	s6,54
    8000162c:	03400c93          	li	s9,52
    80001630:	000d0513          	mv	a0,s10
    80001634:	5c5000ef          	jal	800023f8 <uart_puts>
    80001638:	000a8513          	mv	a0,s5
    8000163c:	5a5000ef          	jal	800023e0 <uart_putc>
    80001640:	000b8513          	mv	a0,s7
    80001644:	5b5000ef          	jal	800023f8 <uart_puts>
    80001648:	00090993          	mv	s3,s2
    8000164c:	03100413          	li	s0,49
    80001650:	0140006f          	j	80001664 <advanced_page_replacement_example+0x1a0>
    80001654:	0014041b          	addw	s0,s0,1
    80001658:	0ff47413          	zext.b	s0,s0
    8000165c:	00898993          	add	s3,s3,8
    80001660:	05640863          	beq	s0,s6,800016b0 <advanced_page_replacement_example+0x1ec>
    80001664:	0009ba03          	ld	s4,0(s3)
    80001668:	04000693          	li	a3,64
    8000166c:	07010593          	add	a1,sp,112
    80001670:	000a0613          	mv	a2,s4
    80001674:	00048513          	mv	a0,s1
    80001678:	5b0020ef          	jal	80003c28 <safe_copyin>
    8000167c:	fc051ce3          	bnez	a0,80001654 <advanced_page_replacement_example+0x190>
    80001680:	000c0513          	mv	a0,s8
    80001684:	575000ef          	jal	800023f8 <uart_puts>
    80001688:	00040513          	mv	a0,s0
    8000168c:	555000ef          	jal	800023e0 <uart_putc>
    80001690:	000b8513          	mv	a0,s7
    80001694:	565000ef          	jal	800023f8 <uart_puts>
    80001698:	0014041b          	addw	s0,s0,1
    8000169c:	000a0513          	mv	a0,s4
    800016a0:	0ff47413          	zext.b	s0,s0
    800016a4:	65d010ef          	jal	80003500 <lru_touch_page>
    800016a8:	00898993          	add	s3,s3,8
    800016ac:	fb641ce3          	bne	s0,s6,80001664 <advanced_page_replacement_example+0x1a0>
    800016b0:	001a8a9b          	addw	s5,s5,1
    800016b4:	0ffafa93          	zext.b	s5,s5
    800016b8:	f79a9ce3          	bne	s5,s9,80001630 <advanced_page_replacement_example+0x16c>
    800016bc:	00008517          	auipc	a0,0x8
    800016c0:	02450513          	add	a0,a0,36 # 800096e0 <rodata_start+0x16e0>
    800016c4:	535000ef          	jal	800023f8 <uart_puts>
    800016c8:	01890993          	add	s3,s2,24
    800016cc:	00008a17          	auipc	s4,0x8
    800016d0:	05ca0a13          	add	s4,s4,92 # 80009728 <rodata_start+0x1728>
    800016d4:	00008417          	auipc	s0,0x8
    800016d8:	02c40413          	add	s0,s0,44 # 80009700 <rodata_start+0x1700>
    800016dc:	00093583          	ld	a1,0(s2)
    800016e0:	00048513          	mv	a0,s1
    800016e4:	330020ef          	jal	80003a14 <va2pa_with_replacement>
    800016e8:	00050793          	mv	a5,a0
    800016ec:	00040513          	mv	a0,s0
    800016f0:	00079463          	bnez	a5,800016f8 <advanced_page_replacement_example+0x234>
    800016f4:	000a0513          	mv	a0,s4
    800016f8:	00890913          	add	s2,s2,8
    800016fc:	4fd000ef          	jal	800023f8 <uart_puts>
    80001700:	fd299ee3          	bne	s3,s2,800016dc <advanced_page_replacement_example+0x218>
    80001704:	00008517          	auipc	a0,0x8
    80001708:	03c50513          	add	a0,a0,60 # 80009740 <rodata_start+0x1740>
    8000170c:	4ed000ef          	jal	800023f8 <uart_puts>
    80001710:	00048513          	mv	a0,s1
    80001714:	254010ef          	jal	80002968 <destroy_pagetable>
    80001718:	00008517          	auipc	a0,0x8
    8000171c:	04050513          	add	a0,a0,64 # 80009758 <rodata_start+0x1758>
    80001720:	4d9000ef          	jal	800023f8 <uart_puts>
    80001724:	00008517          	auipc	a0,0x8
    80001728:	05450513          	add	a0,a0,84 # 80009778 <rodata_start+0x1778>
    8000172c:	4cd000ef          	jal	800023f8 <uart_puts>
    80001730:	10813083          	ld	ra,264(sp)
    80001734:	10013403          	ld	s0,256(sp)
    80001738:	0f813483          	ld	s1,248(sp)
    8000173c:	0f013903          	ld	s2,240(sp)
    80001740:	0e813983          	ld	s3,232(sp)
    80001744:	0e013a03          	ld	s4,224(sp)
    80001748:	0d813a83          	ld	s5,216(sp)
    8000174c:	0d013b03          	ld	s6,208(sp)
    80001750:	0c813b83          	ld	s7,200(sp)
    80001754:	0c013c03          	ld	s8,192(sp)
    80001758:	0b813c83          	ld	s9,184(sp)
    8000175c:	0b013d03          	ld	s10,176(sp)
    80001760:	11010113          	add	sp,sp,272
    80001764:	00008067          	ret
    80001768:	00008517          	auipc	a0,0x8
    8000176c:	ef050513          	add	a0,a0,-272 # 80009658 <rodata_start+0x1658>
    80001770:	489000ef          	jal	800023f8 <uart_puts>
    80001774:	e05ff06f          	j	80001578 <advanced_page_replacement_example+0xb4>
    80001778:	10013403          	ld	s0,256(sp)
    8000177c:	10813083          	ld	ra,264(sp)
    80001780:	0f813483          	ld	s1,248(sp)
    80001784:	0f013903          	ld	s2,240(sp)
    80001788:	0e813983          	ld	s3,232(sp)
    8000178c:	0e013a03          	ld	s4,224(sp)
    80001790:	0d813a83          	ld	s5,216(sp)
    80001794:	0d013b03          	ld	s6,208(sp)
    80001798:	0c813b83          	ld	s7,200(sp)
    8000179c:	0c013c03          	ld	s8,192(sp)
    800017a0:	0b813c83          	ld	s9,184(sp)
    800017a4:	0b013d03          	ld	s10,176(sp)
    800017a8:	00008517          	auipc	a0,0x8
    800017ac:	e3850513          	add	a0,a0,-456 # 800095e0 <rodata_start+0x15e0>
    800017b0:	11010113          	add	sp,sp,272
    800017b4:	4450006f          	j	800023f8 <uart_puts>

00000000800017b8 <test_interrupt_system>:
    800017b8:	fe010113          	add	sp,sp,-32
    800017bc:	00008517          	auipc	a0,0x8
    800017c0:	fe450513          	add	a0,a0,-28 # 800097a0 <rodata_start+0x17a0>
    800017c4:	00113c23          	sd	ra,24(sp)
    800017c8:	431000ef          	jal	800023f8 <uart_puts>
    800017cc:	00008517          	auipc	a0,0x8
    800017d0:	ff450513          	add	a0,a0,-12 # 800097c0 <rodata_start+0x17c0>
    800017d4:	425000ef          	jal	800023f8 <uart_puts>
    800017d8:	015020ef          	jal	80003fec <trap_init>
    800017dc:	00008517          	auipc	a0,0x8
    800017e0:	00450513          	add	a0,a0,4 # 800097e0 <rodata_start+0x17e0>
    800017e4:	415000ef          	jal	800023f8 <uart_puts>
    800017e8:	00100793          	li	a5,1
    800017ec:	00900713          	li	a4,9
    800017f0:	00008697          	auipc	a3,0x8
    800017f4:	01068693          	add	a3,a3,16 # 80009800 <rodata_start+0x1800>
    800017f8:	00000613          	li	a2,0
    800017fc:	00005597          	auipc	a1,0x5
    80001800:	e8058593          	add	a1,a1,-384 # 8000667c <timer_interrupt_handler>
    80001804:	00500513          	li	a0,5
    80001808:	091020ef          	jal	80004098 <register_interrupt>
    8000180c:	00200793          	li	a5,2
    80001810:	00100713          	li	a4,1
    80001814:	00008697          	auipc	a3,0x8
    80001818:	ffc68693          	add	a3,a3,-4 # 80009810 <rodata_start+0x1810>
    8000181c:	00000613          	li	a2,0
    80001820:	fffff597          	auipc	a1,0xfffff
    80001824:	82458593          	add	a1,a1,-2012 # 80000044 <software_interrupt_handler>
    80001828:	00100513          	li	a0,1
    8000182c:	06d020ef          	jal	80004098 <register_interrupt>
    80001830:	00100793          	li	a5,1
    80001834:	00300713          	li	a4,3
    80001838:	00008697          	auipc	a3,0x8
    8000183c:	ff068693          	add	a3,a3,-16 # 80009828 <rodata_start+0x1828>
    80001840:	00000613          	li	a2,0
    80001844:	fffff597          	auipc	a1,0xfffff
    80001848:	82458593          	add	a1,a1,-2012 # 80000068 <external_interrupt_handler>
    8000184c:	00900513          	li	a0,9
    80001850:	049020ef          	jal	80004098 <register_interrupt>
    80001854:	00008517          	auipc	a0,0x8
    80001858:	fec50513          	add	a0,a0,-20 # 80009840 <rodata_start+0x1840>
    8000185c:	39d000ef          	jal	800023f8 <uart_puts>
    80001860:	00500513          	li	a0,5
    80001864:	261020ef          	jal	800042c4 <enable_interrupt>
    80001868:	00100513          	li	a0,1
    8000186c:	259020ef          	jal	800042c4 <enable_interrupt>
    80001870:	00900513          	li	a0,9
    80001874:	251020ef          	jal	800042c4 <enable_interrupt>
    80001878:	00008517          	auipc	a0,0x8
    8000187c:	fe050513          	add	a0,a0,-32 # 80009858 <rodata_start+0x1858>
    80001880:	379000ef          	jal	800023f8 <uart_puts>
    80001884:	00008517          	auipc	a0,0x8
    80001888:	fec50513          	add	a0,a0,-20 # 80009870 <rodata_start+0x1870>
    8000188c:	36d000ef          	jal	800023f8 <uart_puts>
    80001890:	00500513          	li	a0,5
    80001894:	385020ef          	jal	80004418 <is_interrupt_enabled>
    80001898:	00a03533          	snez	a0,a0
    8000189c:	03050513          	add	a0,a0,48
    800018a0:	341000ef          	jal	800023e0 <uart_putc>
    800018a4:	00007517          	auipc	a0,0x7
    800018a8:	4ec50513          	add	a0,a0,1260 # 80008d90 <rodata_start+0xd90>
    800018ac:	34d000ef          	jal	800023f8 <uart_puts>
    800018b0:	00008517          	auipc	a0,0x8
    800018b4:	fe050513          	add	a0,a0,-32 # 80009890 <rodata_start+0x1890>
    800018b8:	341000ef          	jal	800023f8 <uart_puts>
    800018bc:	00100513          	li	a0,1
    800018c0:	359020ef          	jal	80004418 <is_interrupt_enabled>
    800018c4:	00a03533          	snez	a0,a0
    800018c8:	03050513          	add	a0,a0,48
    800018cc:	315000ef          	jal	800023e0 <uart_putc>
    800018d0:	00007517          	auipc	a0,0x7
    800018d4:	4c050513          	add	a0,a0,1216 # 80008d90 <rodata_start+0xd90>
    800018d8:	321000ef          	jal	800023f8 <uart_puts>
    800018dc:	00008517          	auipc	a0,0x8
    800018e0:	fd450513          	add	a0,a0,-44 # 800098b0 <rodata_start+0x18b0>
    800018e4:	315000ef          	jal	800023f8 <uart_puts>
    800018e8:	00000593          	li	a1,0
    800018ec:	00500513          	li	a0,5
    800018f0:	34d020ef          	jal	8000443c <set_interrupt_priority>
    800018f4:	00008517          	auipc	a0,0x8
    800018f8:	fdc50513          	add	a0,a0,-36 # 800098d0 <rodata_start+0x18d0>
    800018fc:	2fd000ef          	jal	800023f8 <uart_puts>
    80001900:	00008517          	auipc	a0,0x8
    80001904:	00050513          	mv	a0,a0
    80001908:	2f1000ef          	jal	800023f8 <uart_puts>
    8000190c:	00008517          	auipc	a0,0x8
    80001910:	01450513          	add	a0,a0,20 # 80009920 <rodata_start+0x1920>
    80001914:	2e5000ef          	jal	800023f8 <uart_puts>
    80001918:	2f9020ef          	jal	80004410 <enable_interrupts>
    8000191c:	00008517          	auipc	a0,0x8
    80001920:	01c50513          	add	a0,a0,28 # 80009938 <rodata_start+0x1938>
    80001924:	2d5000ef          	jal	800023f8 <uart_puts>
    80001928:	00008517          	auipc	a0,0x8
    8000192c:	02850513          	add	a0,a0,40 # 80009950 <rodata_start+0x1950>
    80001930:	2c9000ef          	jal	800023f8 <uart_puts>
    80001934:	00012623          	sw	zero,12(sp)
    80001938:	00c12783          	lw	a5,12(sp)
    8000193c:	000f4737          	lui	a4,0xf4
    80001940:	23f70713          	add	a4,a4,575 # f423f <_entry-0x7ff0bdc1>
    80001944:	00f74c63          	blt	a4,a5,8000195c <test_interrupt_system+0x1a4>
    80001948:	00c12783          	lw	a5,12(sp)
    8000194c:	0017879b          	addw	a5,a5,1
    80001950:	00f12623          	sw	a5,12(sp)
    80001954:	00c12783          	lw	a5,12(sp)
    80001958:	fef758e3          	bge	a4,a5,80001948 <test_interrupt_system+0x190>
    8000195c:	00008517          	auipc	a0,0x8
    80001960:	01450513          	add	a0,a0,20 # 80009970 <rodata_start+0x1970>
    80001964:	295000ef          	jal	800023f8 <uart_puts>
    80001968:	008030ef          	jal	80004970 <print_interrupt_stats>
    8000196c:	00008517          	auipc	a0,0x8
    80001970:	01c50513          	add	a0,a0,28 # 80009988 <rodata_start+0x1988>
    80001974:	285000ef          	jal	800023f8 <uart_puts>
    80001978:	00500513          	li	a0,5
    8000197c:	1ed020ef          	jal	80004368 <disable_interrupt>
    80001980:	00008517          	auipc	a0,0x8
    80001984:	02850513          	add	a0,a0,40 # 800099a8 <rodata_start+0x19a8>
    80001988:	271000ef          	jal	800023f8 <uart_puts>
    8000198c:	00008517          	auipc	a0,0x8
    80001990:	03c50513          	add	a0,a0,60 # 800099c8 <rodata_start+0x19c8>
    80001994:	265000ef          	jal	800023f8 <uart_puts>
    80001998:	ffffe597          	auipc	a1,0xffffe
    8000199c:	6ac58593          	add	a1,a1,1708 # 80000044 <software_interrupt_handler>
    800019a0:	00100513          	li	a0,1
    800019a4:	069020ef          	jal	8000420c <unregister_interrupt>
    800019a8:	00008517          	auipc	a0,0x8
    800019ac:	04050513          	add	a0,a0,64 # 800099e8 <rodata_start+0x19e8>
    800019b0:	249000ef          	jal	800023f8 <uart_puts>
    800019b4:	01813083          	ld	ra,24(sp)
    800019b8:	00008517          	auipc	a0,0x8
    800019bc:	05850513          	add	a0,a0,88 # 80009a10 <rodata_start+0x1a10>
    800019c0:	02010113          	add	sp,sp,32
    800019c4:	2350006f          	j	800023f8 <uart_puts>

00000000800019c8 <test_scheduler_system>:
    800019c8:	fc010113          	add	sp,sp,-64
    800019cc:	00008517          	auipc	a0,0x8
    800019d0:	06c50513          	add	a0,a0,108 # 80009a38 <rodata_start+0x1a38>
    800019d4:	02113c23          	sd	ra,56(sp)
    800019d8:	02813823          	sd	s0,48(sp)
    800019dc:	02913423          	sd	s1,40(sp)
    800019e0:	03213023          	sd	s2,32(sp)
    800019e4:	01313c23          	sd	s3,24(sp)
    800019e8:	01413823          	sd	s4,16(sp)
    800019ec:	20d000ef          	jal	800023f8 <uart_puts>
    800019f0:	170050ef          	jal	80006b60 <scheduler_init>
    800019f4:	105040ef          	jal	800062f8 <timer_init>
    800019f8:	00008517          	auipc	a0,0x8
    800019fc:	06050513          	add	a0,a0,96 # 80009a58 <rodata_start+0x1a58>
    80001a00:	1f9000ef          	jal	800023f8 <uart_puts>
    80001a04:	00100613          	li	a2,1
    80001a08:	00008597          	auipc	a1,0x8
    80001a0c:	06858593          	add	a1,a1,104 # 80009a70 <rodata_start+0x1a70>
    80001a10:	ffffe517          	auipc	a0,0xffffe
    80001a14:	67c50513          	add	a0,a0,1660 # 8000008c <task_a>
    80001a18:	761040ef          	jal	80006978 <create_task>
    80001a1c:	00200613          	li	a2,2
    80001a20:	00008597          	auipc	a1,0x8
    80001a24:	05858593          	add	a1,a1,88 # 80009a78 <rodata_start+0x1a78>
    80001a28:	00050913          	mv	s2,a0
    80001a2c:	ffffe517          	auipc	a0,0xffffe
    80001a30:	7ac50513          	add	a0,a0,1964 # 800001d8 <task_b>
    80001a34:	745040ef          	jal	80006978 <create_task>
    80001a38:	00050493          	mv	s1,a0
    80001a3c:	00000613          	li	a2,0
    80001a40:	00008597          	auipc	a1,0x8
    80001a44:	04058593          	add	a1,a1,64 # 80009a80 <rodata_start+0x1a80>
    80001a48:	ffffe517          	auipc	a0,0xffffe
    80001a4c:	70450513          	add	a0,a0,1796 # 8000014c <task_c>
    80001a50:	729040ef          	jal	80006978 <create_task>
    80001a54:	00050413          	mv	s0,a0
    80001a58:	0f204663          	bgtz	s2,80001b44 <test_scheduler_system+0x17c>
    80001a5c:	0c904a63          	bgtz	s1,80001b30 <test_scheduler_system+0x168>
    80001a60:	00805a63          	blez	s0,80001a74 <test_scheduler_system+0xac>
    80001a64:	00040593          	mv	a1,s0
    80001a68:	00008517          	auipc	a0,0x8
    80001a6c:	06050513          	add	a0,a0,96 # 80009ac8 <rodata_start+0x1ac8>
    80001a70:	6d8000ef          	jal	80002148 <printf>
    80001a74:	00008517          	auipc	a0,0x8
    80001a78:	07450513          	add	a0,a0,116 # 80009ae8 <rodata_start+0x1ae8>
    80001a7c:	17d000ef          	jal	800023f8 <uart_puts>
    80001a80:	00008517          	auipc	a0,0x8
    80001a84:	08850513          	add	a0,a0,136 # 80009b08 <rodata_start+0x1b08>
    80001a88:	000f4437          	lui	s0,0xf4
    80001a8c:	16d000ef          	jal	800023f8 <uart_puts>
    80001a90:	00000493          	li	s1,0
    80001a94:	00008997          	auipc	s3,0x8
    80001a98:	09498993          	add	s3,s3,148 # 80009b28 <rodata_start+0x1b28>
    80001a9c:	23f40413          	add	s0,s0,575 # f423f <_entry-0x7ff0bdc1>
    80001aa0:	00008a17          	auipc	s4,0x8
    80001aa4:	0b8a0a13          	add	s4,s4,184 # 80009b58 <rodata_start+0x1b58>
    80001aa8:	00a00913          	li	s2,10
    80001aac:	0014849b          	addw	s1,s1,1
    80001ab0:	00048593          	mv	a1,s1
    80001ab4:	00098513          	mv	a0,s3
    80001ab8:	690000ef          	jal	80002148 <printf>
    80001abc:	67c050ef          	jal	80007138 <print_task_list>
    80001ac0:	5a4050ef          	jal	80007064 <print_scheduler_stats>
    80001ac4:	00012623          	sw	zero,12(sp)
    80001ac8:	00c12783          	lw	a5,12(sp)
    80001acc:	00f44c63          	blt	s0,a5,80001ae4 <test_scheduler_system+0x11c>
    80001ad0:	00c12783          	lw	a5,12(sp)
    80001ad4:	0017879b          	addw	a5,a5,1
    80001ad8:	00f12623          	sw	a5,12(sp)
    80001adc:	00c12783          	lw	a5,12(sp)
    80001ae0:	fef458e3          	bge	s0,a5,80001ad0 <test_scheduler_system+0x108>
    80001ae4:	548050ef          	jal	8000702c <get_current_task>
    80001ae8:	00050a63          	beqz	a0,80001afc <test_scheduler_system+0x134>
    80001aec:	00052603          	lw	a2,0(a0)
    80001af0:	04450593          	add	a1,a0,68
    80001af4:	000a0513          	mv	a0,s4
    80001af8:	650000ef          	jal	80002148 <printf>
    80001afc:	fb2498e3          	bne	s1,s2,80001aac <test_scheduler_system+0xe4>
    80001b00:	00008517          	auipc	a0,0x8
    80001b04:	07850513          	add	a0,a0,120 # 80009b78 <rodata_start+0x1b78>
    80001b08:	0f1000ef          	jal	800023f8 <uart_puts>
    80001b0c:	558050ef          	jal	80007064 <print_scheduler_stats>
    80001b10:	03013403          	ld	s0,48(sp)
    80001b14:	03813083          	ld	ra,56(sp)
    80001b18:	02813483          	ld	s1,40(sp)
    80001b1c:	02013903          	ld	s2,32(sp)
    80001b20:	01813983          	ld	s3,24(sp)
    80001b24:	01013a03          	ld	s4,16(sp)
    80001b28:	04010113          	add	sp,sp,64
    80001b2c:	44d0406f          	j	80006778 <print_timer_stats>
    80001b30:	00048593          	mv	a1,s1
    80001b34:	00008517          	auipc	a0,0x8
    80001b38:	f7450513          	add	a0,a0,-140 # 80009aa8 <rodata_start+0x1aa8>
    80001b3c:	60c000ef          	jal	80002148 <printf>
    80001b40:	f21ff06f          	j	80001a60 <test_scheduler_system+0x98>
    80001b44:	00090593          	mv	a1,s2
    80001b48:	00008517          	auipc	a0,0x8
    80001b4c:	f4050513          	add	a0,a0,-192 # 80009a88 <rodata_start+0x1a88>
    80001b50:	5f8000ef          	jal	80002148 <printf>
    80001b54:	f09056e3          	blez	s1,80001a60 <test_scheduler_system+0x98>
    80001b58:	fd9ff06f          	j	80001b30 <test_scheduler_system+0x168>

0000000080001b5c <main>:
    80001b5c:	ff010113          	add	sp,sp,-16
    80001b60:	00008517          	auipc	a0,0x8
    80001b64:	03850513          	add	a0,a0,56 # 80009b98 <rodata_start+0x1b98>
    80001b68:	00113423          	sd	ra,8(sp)
    80001b6c:	08d000ef          	jal	800023f8 <uart_puts>
    80001b70:	f20fe0ef          	jal	80000290 <test_virtual_memory>
    80001b74:	d29fe0ef          	jal	8000089c <pmm_test>
    80001b78:	b69fe0ef          	jal	800006e0 <pt_test>
    80001b7c:	f91fe0ef          	jal	80000b0c <test_alloc_pages_pattern>
    80001b80:	00007517          	auipc	a0,0x7
    80001b84:	96050513          	add	a0,a0,-1696 # 800084e0 <rodata_start+0x4e0>
    80001b88:	071000ef          	jal	800023f8 <uart_puts>
    80001b8c:	00008517          	auipc	a0,0x8
    80001b90:	02450513          	add	a0,a0,36 # 80009bb0 <rodata_start+0x1bb0>
    80001b94:	065000ef          	jal	800023f8 <uart_puts>
    80001b98:	00007517          	auipc	a0,0x7
    80001b9c:	9b050513          	add	a0,a0,-1616 # 80008548 <rodata_start+0x548>
    80001ba0:	059000ef          	jal	800023f8 <uart_puts>
    80001ba4:	8edff0ef          	jal	80001490 <page_replacement_example>
    80001ba8:	91dff0ef          	jal	800014c4 <advanced_page_replacement_example>
    80001bac:	00007517          	auipc	a0,0x7
    80001bb0:	93450513          	add	a0,a0,-1740 # 800084e0 <rodata_start+0x4e0>
    80001bb4:	045000ef          	jal	800023f8 <uart_puts>
    80001bb8:	00008517          	auipc	a0,0x8
    80001bbc:	03050513          	add	a0,a0,48 # 80009be8 <rodata_start+0x1be8>
    80001bc0:	039000ef          	jal	800023f8 <uart_puts>
    80001bc4:	00007517          	auipc	a0,0x7
    80001bc8:	98450513          	add	a0,a0,-1660 # 80008548 <rodata_start+0x548>
    80001bcc:	02d000ef          	jal	800023f8 <uart_puts>
    80001bd0:	be9ff0ef          	jal	800017b8 <test_interrupt_system>
    80001bd4:	00007517          	auipc	a0,0x7
    80001bd8:	90c50513          	add	a0,a0,-1780 # 800084e0 <rodata_start+0x4e0>
    80001bdc:	01d000ef          	jal	800023f8 <uart_puts>
    80001be0:	00008517          	auipc	a0,0x8
    80001be4:	04050513          	add	a0,a0,64 # 80009c20 <rodata_start+0x1c20>
    80001be8:	011000ef          	jal	800023f8 <uart_puts>
    80001bec:	00007517          	auipc	a0,0x7
    80001bf0:	95c50513          	add	a0,a0,-1700 # 80008548 <rodata_start+0x548>
    80001bf4:	005000ef          	jal	800023f8 <uart_puts>
    80001bf8:	4ad020ef          	jal	800048a4 <test_context_switching>
    80001bfc:	00008517          	auipc	a0,0x8
    80001c00:	05c50513          	add	a0,a0,92 # 80009c58 <rodata_start+0x1c58>
    80001c04:	7f4000ef          	jal	800023f8 <uart_puts>
    80001c08:	2b4040ef          	jal	80005ebc <print_stack_stats>
    80001c0c:	00007517          	auipc	a0,0x7
    80001c10:	8d450513          	add	a0,a0,-1836 # 800084e0 <rodata_start+0x4e0>
    80001c14:	7e4000ef          	jal	800023f8 <uart_puts>
    80001c18:	00008517          	auipc	a0,0x8
    80001c1c:	05850513          	add	a0,a0,88 # 80009c70 <rodata_start+0x1c70>
    80001c20:	7d8000ef          	jal	800023f8 <uart_puts>
    80001c24:	00007517          	auipc	a0,0x7
    80001c28:	92450513          	add	a0,a0,-1756 # 80008548 <rodata_start+0x548>
    80001c2c:	7cc000ef          	jal	800023f8 <uart_puts>
    80001c30:	d99ff0ef          	jal	800019c8 <test_scheduler_system>
    80001c34:	00007517          	auipc	a0,0x7
    80001c38:	8ac50513          	add	a0,a0,-1876 # 800084e0 <rodata_start+0x4e0>
    80001c3c:	7bc000ef          	jal	800023f8 <uart_puts>
    80001c40:	00008517          	auipc	a0,0x8
    80001c44:	06850513          	add	a0,a0,104 # 80009ca8 <rodata_start+0x1ca8>
    80001c48:	7b0000ef          	jal	800023f8 <uart_puts>
    80001c4c:	00007517          	auipc	a0,0x7
    80001c50:	8fc50513          	add	a0,a0,-1796 # 80008548 <rodata_start+0x548>
    80001c54:	7a4000ef          	jal	800023f8 <uart_puts>
    80001c58:	9b5fe0ef          	jal	8000060c <test_comprehensive_exception_handling>
    80001c5c:	00007517          	auipc	a0,0x7
    80001c60:	88450513          	add	a0,a0,-1916 # 800084e0 <rodata_start+0x4e0>
    80001c64:	794000ef          	jal	800023f8 <uart_puts>
    80001c68:	00008517          	auipc	a0,0x8
    80001c6c:	07850513          	add	a0,a0,120 # 80009ce0 <rodata_start+0x1ce0>
    80001c70:	788000ef          	jal	800023f8 <uart_puts>
    80001c74:	00007517          	auipc	a0,0x7
    80001c78:	86c50513          	add	a0,a0,-1940 # 800084e0 <rodata_start+0x4e0>
    80001c7c:	77c000ef          	jal	800023f8 <uart_puts>
    80001c80:	0000006f          	j	80001c80 <main+0x124>

0000000080001c84 <print_number>:
    80001c84:	0c050663          	beqz	a0,80001d50 <print_number+0xcc>
    80001c88:	fd010113          	add	sp,sp,-48
    80001c8c:	02113423          	sd	ra,40(sp)
    80001c90:	02813023          	sd	s0,32(sp)
    80001c94:	08061a63          	bnez	a2,80001d28 <print_number+0xa4>
    80001c98:	0005071b          	sext.w	a4,a0
    80001c9c:	00000613          	li	a2,0
    80001ca0:	0005859b          	sext.w	a1,a1
    80001ca4:	00010fa3          	sb	zero,31(sp)
    80001ca8:	01e10813          	add	a6,sp,30
    80001cac:	01f00693          	li	a3,31
    80001cb0:	00008317          	auipc	t1,0x8
    80001cb4:	49030313          	add	t1,t1,1168 # 8000a140 <digits>
    80001cb8:	02b777bb          	remuw	a5,a4,a1
    80001cbc:	fff80813          	add	a6,a6,-1
    80001cc0:	0007089b          	sext.w	a7,a4
    80001cc4:	00068e13          	mv	t3,a3
    80001cc8:	fff6869b          	addw	a3,a3,-1
    80001ccc:	02079793          	sll	a5,a5,0x20
    80001cd0:	0207d793          	srl	a5,a5,0x20
    80001cd4:	00f307b3          	add	a5,t1,a5
    80001cd8:	0007c503          	lbu	a0,0(a5)
    80001cdc:	02b7573b          	divuw	a4,a4,a1
    80001ce0:	00a800a3          	sb	a0,1(a6)
    80001ce4:	fcb8fae3          	bgeu	a7,a1,80001cb8 <print_number+0x34>
    80001ce8:	04060a63          	beqz	a2,80001d3c <print_number+0xb8>
    80001cec:	ffee069b          	addw	a3,t3,-2
    80001cf0:	02068793          	add	a5,a3,32
    80001cf4:	002787b3          	add	a5,a5,sp
    80001cf8:	02d00713          	li	a4,45
    80001cfc:	fee78023          	sb	a4,-32(a5)
    80001d00:	02d00513          	li	a0,45
    80001d04:	00d10433          	add	s0,sp,a3
    80001d08:	00140413          	add	s0,s0,1
    80001d0c:	6d4000ef          	jal	800023e0 <uart_putc>
    80001d10:	00044503          	lbu	a0,0(s0)
    80001d14:	fe051ae3          	bnez	a0,80001d08 <print_number+0x84>
    80001d18:	02813083          	ld	ra,40(sp)
    80001d1c:	02013403          	ld	s0,32(sp)
    80001d20:	03010113          	add	sp,sp,48
    80001d24:	00008067          	ret
    80001d28:	f60558e3          	bgez	a0,80001c98 <print_number+0x14>
    80001d2c:	80000737          	lui	a4,0x80000
    80001d30:	f6e508e3          	beq	a0,a4,80001ca0 <print_number+0x1c>
    80001d34:	40a0073b          	negw	a4,a0
    80001d38:	f69ff06f          	j	80001ca0 <print_number+0x1c>
    80001d3c:	fc0514e3          	bnez	a0,80001d04 <print_number+0x80>
    80001d40:	02813083          	ld	ra,40(sp)
    80001d44:	02013403          	ld	s0,32(sp)
    80001d48:	03010113          	add	sp,sp,48
    80001d4c:	00008067          	ret
    80001d50:	03000513          	li	a0,48
    80001d54:	68c0006f          	j	800023e0 <uart_putc>

0000000080001d58 <clear_screen>:
    80001d58:	00008517          	auipc	a0,0x8
    80001d5c:	19850513          	add	a0,a0,408 # 80009ef0 <long_string+0x1e0>
    80001d60:	6980006f          	j	800023f8 <uart_puts>

0000000080001d64 <clear_line>:
    80001d64:	00008517          	auipc	a0,0x8
    80001d68:	19450513          	add	a0,a0,404 # 80009ef8 <long_string+0x1e8>
    80001d6c:	68c0006f          	j	800023f8 <uart_puts>

0000000080001d70 <goto_xy>:
    80001d70:	fd010113          	add	sp,sp,-48
    80001d74:	00913c23          	sd	s1,24(sp)
    80001d78:	00050493          	mv	s1,a0
    80001d7c:	01b00513          	li	a0,27
    80001d80:	02113423          	sd	ra,40(sp)
    80001d84:	02813023          	sd	s0,32(sp)
    80001d88:	01213823          	sd	s2,16(sp)
    80001d8c:	00058413          	mv	s0,a1
    80001d90:	01313423          	sd	s3,8(sp)
    80001d94:	64c000ef          	jal	800023e0 <uart_putc>
    80001d98:	05b00513          	li	a0,91
    80001d9c:	644000ef          	jal	800023e0 <uart_putc>
    80001da0:	06300793          	li	a5,99
    80001da4:	0c87cc63          	blt	a5,s0,80001e7c <goto_xy+0x10c>
    80001da8:	00900793          	li	a5,9
    80001dac:	0487ce63          	blt	a5,s0,80001e08 <goto_xy+0x98>
    80001db0:	12805a63          	blez	s0,80001ee4 <goto_xy+0x174>
    80001db4:	0304041b          	addw	s0,s0,48
    80001db8:	0ff47513          	zext.b	a0,s0
    80001dbc:	624000ef          	jal	800023e0 <uart_putc>
    80001dc0:	03b00513          	li	a0,59
    80001dc4:	61c000ef          	jal	800023e0 <uart_putc>
    80001dc8:	06300793          	li	a5,99
    80001dcc:	0697c863          	blt	a5,s1,80001e3c <goto_xy+0xcc>
    80001dd0:	00900793          	li	a5,9
    80001dd4:	0e97c463          	blt	a5,s1,80001ebc <goto_xy+0x14c>
    80001dd8:	10905c63          	blez	s1,80001ef0 <goto_xy+0x180>
    80001ddc:	0304851b          	addw	a0,s1,48
    80001de0:	0ff57513          	zext.b	a0,a0
    80001de4:	5fc000ef          	jal	800023e0 <uart_putc>
    80001de8:	02013403          	ld	s0,32(sp)
    80001dec:	02813083          	ld	ra,40(sp)
    80001df0:	01813483          	ld	s1,24(sp)
    80001df4:	01013903          	ld	s2,16(sp)
    80001df8:	00813983          	ld	s3,8(sp)
    80001dfc:	04800513          	li	a0,72
    80001e00:	03010113          	add	sp,sp,48
    80001e04:	5dc0006f          	j	800023e0 <uart_putc>
    80001e08:	00a00913          	li	s2,10
    80001e0c:	0324453b          	divw	a0,s0,s2
    80001e10:	0305051b          	addw	a0,a0,48
    80001e14:	0ff57513          	zext.b	a0,a0
    80001e18:	5c8000ef          	jal	800023e0 <uart_putc>
    80001e1c:	0324643b          	remw	s0,s0,s2
    80001e20:	0304041b          	addw	s0,s0,48
    80001e24:	0ff47513          	zext.b	a0,s0
    80001e28:	5b8000ef          	jal	800023e0 <uart_putc>
    80001e2c:	03b00513          	li	a0,59
    80001e30:	5b0000ef          	jal	800023e0 <uart_putc>
    80001e34:	06300793          	li	a5,99
    80001e38:	f897dce3          	bge	a5,s1,80001dd0 <goto_xy+0x60>
    80001e3c:	06400413          	li	s0,100
    80001e40:	0284c53b          	divw	a0,s1,s0
    80001e44:	00a00913          	li	s2,10
    80001e48:	0305051b          	addw	a0,a0,48
    80001e4c:	0ff57513          	zext.b	a0,a0
    80001e50:	590000ef          	jal	800023e0 <uart_putc>
    80001e54:	0284e53b          	remw	a0,s1,s0
    80001e58:	0325453b          	divw	a0,a0,s2
    80001e5c:	0305051b          	addw	a0,a0,48
    80001e60:	0ff57513          	zext.b	a0,a0
    80001e64:	57c000ef          	jal	800023e0 <uart_putc>
    80001e68:	0324e53b          	remw	a0,s1,s2
    80001e6c:	0305051b          	addw	a0,a0,48
    80001e70:	0ff57513          	zext.b	a0,a0
    80001e74:	56c000ef          	jal	800023e0 <uart_putc>
    80001e78:	f71ff06f          	j	80001de8 <goto_xy+0x78>
    80001e7c:	06400913          	li	s2,100
    80001e80:	0324453b          	divw	a0,s0,s2
    80001e84:	00a00993          	li	s3,10
    80001e88:	0305051b          	addw	a0,a0,48
    80001e8c:	0ff57513          	zext.b	a0,a0
    80001e90:	550000ef          	jal	800023e0 <uart_putc>
    80001e94:	0324653b          	remw	a0,s0,s2
    80001e98:	0335453b          	divw	a0,a0,s3
    80001e9c:	0305051b          	addw	a0,a0,48
    80001ea0:	0ff57513          	zext.b	a0,a0
    80001ea4:	53c000ef          	jal	800023e0 <uart_putc>
    80001ea8:	0334643b          	remw	s0,s0,s3
    80001eac:	0304041b          	addw	s0,s0,48
    80001eb0:	0ff47513          	zext.b	a0,s0
    80001eb4:	52c000ef          	jal	800023e0 <uart_putc>
    80001eb8:	f09ff06f          	j	80001dc0 <goto_xy+0x50>
    80001ebc:	00a00413          	li	s0,10
    80001ec0:	0284c53b          	divw	a0,s1,s0
    80001ec4:	0305051b          	addw	a0,a0,48
    80001ec8:	0ff57513          	zext.b	a0,a0
    80001ecc:	514000ef          	jal	800023e0 <uart_putc>
    80001ed0:	0284e53b          	remw	a0,s1,s0
    80001ed4:	0305051b          	addw	a0,a0,48
    80001ed8:	0ff57513          	zext.b	a0,a0
    80001edc:	504000ef          	jal	800023e0 <uart_putc>
    80001ee0:	f09ff06f          	j	80001de8 <goto_xy+0x78>
    80001ee4:	03100513          	li	a0,49
    80001ee8:	4f8000ef          	jal	800023e0 <uart_putc>
    80001eec:	ed5ff06f          	j	80001dc0 <goto_xy+0x50>
    80001ef0:	03100513          	li	a0,49
    80001ef4:	4ec000ef          	jal	800023e0 <uart_putc>
    80001ef8:	ef1ff06f          	j	80001de8 <goto_xy+0x78>

0000000080001efc <printf_color>:
    80001efc:	f8010113          	add	sp,sp,-128
    80001f00:	02913c23          	sd	s1,56(sp)
    80001f04:	00050493          	mv	s1,a0
    80001f08:	01b00513          	li	a0,27
    80001f0c:	06f13423          	sd	a5,104(sp)
    80001f10:	04113423          	sd	ra,72(sp)
    80001f14:	04813023          	sd	s0,64(sp)
    80001f18:	04c13823          	sd	a2,80(sp)
    80001f1c:	04d13c23          	sd	a3,88(sp)
    80001f20:	06e13023          	sd	a4,96(sp)
    80001f24:	07013823          	sd	a6,112(sp)
    80001f28:	07113c23          	sd	a7,120(sp)
    80001f2c:	00058413          	mv	s0,a1
    80001f30:	03213823          	sd	s2,48(sp)
    80001f34:	03313423          	sd	s3,40(sp)
    80001f38:	03413023          	sd	s4,32(sp)
    80001f3c:	01513c23          	sd	s5,24(sp)
    80001f40:	4a0000ef          	jal	800023e0 <uart_putc>
    80001f44:	05b00513          	li	a0,91
    80001f48:	498000ef          	jal	800023e0 <uart_putc>
    80001f4c:	06300793          	li	a5,99
    80001f50:	1a97e063          	bltu	a5,s1,800020f0 <printf_color+0x1f4>
    80001f54:	00900793          	li	a5,9
    80001f58:	1497e663          	bltu	a5,s1,800020a4 <printf_color+0x1a8>
    80001f5c:	0304851b          	addw	a0,s1,48
    80001f60:	0ff57513          	zext.b	a0,a0
    80001f64:	47c000ef          	jal	800023e0 <uart_putc>
    80001f68:	06d00513          	li	a0,109
    80001f6c:	474000ef          	jal	800023e0 <uart_putc>
    80001f70:	1c040863          	beqz	s0,80002140 <printf_color+0x244>
    80001f74:	00044503          	lbu	a0,0(s0)
    80001f78:	05010793          	add	a5,sp,80
    80001f7c:	00f13423          	sd	a5,8(sp)
    80001f80:	00000a93          	li	s5,0
    80001f84:	06050463          	beqz	a0,80001fec <printf_color+0xf0>
    80001f88:	02500913          	li	s2,37
    80001f8c:	02000a13          	li	s4,32
    80001f90:	00008997          	auipc	s3,0x8
    80001f94:	0a898993          	add	s3,s3,168 # 8000a038 <long_string+0x328>
    80001f98:	00140493          	add	s1,s0,1
    80001f9c:	13251863          	bne	a0,s2,800020cc <printf_color+0x1d0>
    80001fa0:	00144783          	lbu	a5,1(s0)
    80001fa4:	14078063          	beqz	a5,800020e4 <printf_color+0x1e8>
    80001fa8:	13278863          	beq	a5,s2,800020d8 <printf_color+0x1dc>
    80001fac:	fa87879b          	addw	a5,a5,-88
    80001fb0:	0ff7f793          	zext.b	a5,a5
    80001fb4:	00fa6c63          	bltu	s4,a5,80001fcc <printf_color+0xd0>
    80001fb8:	00279793          	sll	a5,a5,0x2
    80001fbc:	013787b3          	add	a5,a5,s3
    80001fc0:	0007a783          	lw	a5,0(a5)
    80001fc4:	013787b3          	add	a5,a5,s3
    80001fc8:	00078067          	jr	a5
    80001fcc:	02500513          	li	a0,37
    80001fd0:	410000ef          	jal	800023e0 <uart_putc>
    80001fd4:	00144503          	lbu	a0,1(s0)
    80001fd8:	ffe00a93          	li	s5,-2
    80001fdc:	404000ef          	jal	800023e0 <uart_putc>
    80001fe0:	0014c503          	lbu	a0,1(s1)
    80001fe4:	00148413          	add	s0,s1,1
    80001fe8:	fa0518e3          	bnez	a0,80001f98 <printf_color+0x9c>
    80001fec:	00008517          	auipc	a0,0x8
    80001ff0:	f1c50513          	add	a0,a0,-228 # 80009f08 <long_string+0x1f8>
    80001ff4:	404000ef          	jal	800023f8 <uart_puts>
    80001ff8:	04813083          	ld	ra,72(sp)
    80001ffc:	04013403          	ld	s0,64(sp)
    80002000:	03813483          	ld	s1,56(sp)
    80002004:	03013903          	ld	s2,48(sp)
    80002008:	02813983          	ld	s3,40(sp)
    8000200c:	02013a03          	ld	s4,32(sp)
    80002010:	000a8513          	mv	a0,s5
    80002014:	01813a83          	ld	s5,24(sp)
    80002018:	08010113          	add	sp,sp,128
    8000201c:	00008067          	ret
    80002020:	00813783          	ld	a5,8(sp)
    80002024:	00000613          	li	a2,0
    80002028:	01000593          	li	a1,16
    8000202c:	0007a503          	lw	a0,0(a5)
    80002030:	00878793          	add	a5,a5,8
    80002034:	00f13423          	sd	a5,8(sp)
    80002038:	c4dff0ef          	jal	80001c84 <print_number>
    8000203c:	fa5ff06f          	j	80001fe0 <printf_color+0xe4>
    80002040:	00813783          	ld	a5,8(sp)
    80002044:	0007c503          	lbu	a0,0(a5)
    80002048:	00878793          	add	a5,a5,8
    8000204c:	00f13423          	sd	a5,8(sp)
    80002050:	390000ef          	jal	800023e0 <uart_putc>
    80002054:	f8dff06f          	j	80001fe0 <printf_color+0xe4>
    80002058:	00813783          	ld	a5,8(sp)
    8000205c:	0007b403          	ld	s0,0(a5)
    80002060:	00878793          	add	a5,a5,8
    80002064:	00f13423          	sd	a5,8(sp)
    80002068:	00041863          	bnez	s0,80002078 <printf_color+0x17c>
    8000206c:	0c40006f          	j	80002130 <printf_color+0x234>
    80002070:	00140413          	add	s0,s0,1
    80002074:	36c000ef          	jal	800023e0 <uart_putc>
    80002078:	00044503          	lbu	a0,0(s0)
    8000207c:	fe051ae3          	bnez	a0,80002070 <printf_color+0x174>
    80002080:	f61ff06f          	j	80001fe0 <printf_color+0xe4>
    80002084:	00813783          	ld	a5,8(sp)
    80002088:	00100613          	li	a2,1
    8000208c:	00a00593          	li	a1,10
    80002090:	0007a503          	lw	a0,0(a5)
    80002094:	00878793          	add	a5,a5,8
    80002098:	00f13423          	sd	a5,8(sp)
    8000209c:	be9ff0ef          	jal	80001c84 <print_number>
    800020a0:	f41ff06f          	j	80001fe0 <printf_color+0xe4>
    800020a4:	00a00913          	li	s2,10
    800020a8:	0324d53b          	divuw	a0,s1,s2
    800020ac:	0305051b          	addw	a0,a0,48
    800020b0:	0ff57513          	zext.b	a0,a0
    800020b4:	32c000ef          	jal	800023e0 <uart_putc>
    800020b8:	0324f53b          	remuw	a0,s1,s2
    800020bc:	0305051b          	addw	a0,a0,48
    800020c0:	07f57513          	and	a0,a0,127
    800020c4:	31c000ef          	jal	800023e0 <uart_putc>
    800020c8:	ea1ff06f          	j	80001f68 <printf_color+0x6c>
    800020cc:	314000ef          	jal	800023e0 <uart_putc>
    800020d0:	00040493          	mv	s1,s0
    800020d4:	f0dff06f          	j	80001fe0 <printf_color+0xe4>
    800020d8:	02500513          	li	a0,37
    800020dc:	304000ef          	jal	800023e0 <uart_putc>
    800020e0:	f01ff06f          	j	80001fe0 <printf_color+0xe4>
    800020e4:	02500513          	li	a0,37
    800020e8:	2f8000ef          	jal	800023e0 <uart_putc>
    800020ec:	f01ff06f          	j	80001fec <printf_color+0xf0>
    800020f0:	06400913          	li	s2,100
    800020f4:	0324d53b          	divuw	a0,s1,s2
    800020f8:	00a00993          	li	s3,10
    800020fc:	0305051b          	addw	a0,a0,48
    80002100:	0ff57513          	zext.b	a0,a0
    80002104:	2dc000ef          	jal	800023e0 <uart_putc>
    80002108:	0324f53b          	remuw	a0,s1,s2
    8000210c:	0335553b          	divuw	a0,a0,s3
    80002110:	0305051b          	addw	a0,a0,48
    80002114:	0ff57513          	zext.b	a0,a0
    80002118:	2c8000ef          	jal	800023e0 <uart_putc>
    8000211c:	0334f53b          	remuw	a0,s1,s3
    80002120:	0305051b          	addw	a0,a0,48
    80002124:	07f57513          	and	a0,a0,127
    80002128:	2b8000ef          	jal	800023e0 <uart_putc>
    8000212c:	e3dff06f          	j	80001f68 <printf_color+0x6c>
    80002130:	00008517          	auipc	a0,0x8
    80002134:	dd050513          	add	a0,a0,-560 # 80009f00 <long_string+0x1f0>
    80002138:	2c0000ef          	jal	800023f8 <uart_puts>
    8000213c:	ea5ff06f          	j	80001fe0 <printf_color+0xe4>
    80002140:	fff00a93          	li	s5,-1
    80002144:	eb5ff06f          	j	80001ff8 <printf_color+0xfc>

0000000080002148 <printf>:
    80002148:	f7010113          	add	sp,sp,-144
    8000214c:	04113423          	sd	ra,72(sp)
    80002150:	04813023          	sd	s0,64(sp)
    80002154:	02913c23          	sd	s1,56(sp)
    80002158:	03213823          	sd	s2,48(sp)
    8000215c:	03313423          	sd	s3,40(sp)
    80002160:	03413023          	sd	s4,32(sp)
    80002164:	01513c23          	sd	s5,24(sp)
    80002168:	04b13c23          	sd	a1,88(sp)
    8000216c:	06c13023          	sd	a2,96(sp)
    80002170:	06d13423          	sd	a3,104(sp)
    80002174:	06e13823          	sd	a4,112(sp)
    80002178:	06f13c23          	sd	a5,120(sp)
    8000217c:	09013023          	sd	a6,128(sp)
    80002180:	09113423          	sd	a7,136(sp)
    80002184:	16050063          	beqz	a0,800022e4 <printf+0x19c>
    80002188:	00050413          	mv	s0,a0
    8000218c:	00054503          	lbu	a0,0(a0)
    80002190:	05810793          	add	a5,sp,88
    80002194:	00f13423          	sd	a5,8(sp)
    80002198:	00000a93          	li	s5,0
    8000219c:	06050463          	beqz	a0,80002204 <printf+0xbc>
    800021a0:	02500913          	li	s2,37
    800021a4:	02000a13          	li	s4,32
    800021a8:	00008997          	auipc	s3,0x8
    800021ac:	f1498993          	add	s3,s3,-236 # 8000a0bc <long_string+0x3ac>
    800021b0:	00140493          	add	s1,s0,1
    800021b4:	0f251e63          	bne	a0,s2,800022b0 <printf+0x168>
    800021b8:	00144783          	lbu	a5,1(s0)
    800021bc:	10078663          	beqz	a5,800022c8 <printf+0x180>
    800021c0:	0f278e63          	beq	a5,s2,800022bc <printf+0x174>
    800021c4:	fa87879b          	addw	a5,a5,-88
    800021c8:	0ff7f793          	zext.b	a5,a5
    800021cc:	00fa6c63          	bltu	s4,a5,800021e4 <printf+0x9c>
    800021d0:	00279793          	sll	a5,a5,0x2
    800021d4:	013787b3          	add	a5,a5,s3
    800021d8:	0007a783          	lw	a5,0(a5)
    800021dc:	013787b3          	add	a5,a5,s3
    800021e0:	00078067          	jr	a5
    800021e4:	02500513          	li	a0,37
    800021e8:	1f8000ef          	jal	800023e0 <uart_putc>
    800021ec:	00144503          	lbu	a0,1(s0)
    800021f0:	ffe00a93          	li	s5,-2
    800021f4:	1ec000ef          	jal	800023e0 <uart_putc>
    800021f8:	0014c503          	lbu	a0,1(s1)
    800021fc:	00148413          	add	s0,s1,1
    80002200:	fa0518e3          	bnez	a0,800021b0 <printf+0x68>
    80002204:	04813083          	ld	ra,72(sp)
    80002208:	04013403          	ld	s0,64(sp)
    8000220c:	03813483          	ld	s1,56(sp)
    80002210:	03013903          	ld	s2,48(sp)
    80002214:	02813983          	ld	s3,40(sp)
    80002218:	02013a03          	ld	s4,32(sp)
    8000221c:	000a8513          	mv	a0,s5
    80002220:	01813a83          	ld	s5,24(sp)
    80002224:	09010113          	add	sp,sp,144
    80002228:	00008067          	ret
    8000222c:	00813783          	ld	a5,8(sp)
    80002230:	00000613          	li	a2,0
    80002234:	01000593          	li	a1,16
    80002238:	0007a503          	lw	a0,0(a5)
    8000223c:	00878793          	add	a5,a5,8
    80002240:	00f13423          	sd	a5,8(sp)
    80002244:	a41ff0ef          	jal	80001c84 <print_number>
    80002248:	fb1ff06f          	j	800021f8 <printf+0xb0>
    8000224c:	00813783          	ld	a5,8(sp)
    80002250:	0007c503          	lbu	a0,0(a5)
    80002254:	00878793          	add	a5,a5,8
    80002258:	00f13423          	sd	a5,8(sp)
    8000225c:	184000ef          	jal	800023e0 <uart_putc>
    80002260:	f99ff06f          	j	800021f8 <printf+0xb0>
    80002264:	00813783          	ld	a5,8(sp)
    80002268:	0007b403          	ld	s0,0(a5)
    8000226c:	00878793          	add	a5,a5,8
    80002270:	00f13423          	sd	a5,8(sp)
    80002274:	00041863          	bnez	s0,80002284 <printf+0x13c>
    80002278:	05c0006f          	j	800022d4 <printf+0x18c>
    8000227c:	00140413          	add	s0,s0,1
    80002280:	160000ef          	jal	800023e0 <uart_putc>
    80002284:	00044503          	lbu	a0,0(s0)
    80002288:	fe051ae3          	bnez	a0,8000227c <printf+0x134>
    8000228c:	f6dff06f          	j	800021f8 <printf+0xb0>
    80002290:	00813783          	ld	a5,8(sp)
    80002294:	00100613          	li	a2,1
    80002298:	00a00593          	li	a1,10
    8000229c:	0007a503          	lw	a0,0(a5)
    800022a0:	00878793          	add	a5,a5,8
    800022a4:	00f13423          	sd	a5,8(sp)
    800022a8:	9ddff0ef          	jal	80001c84 <print_number>
    800022ac:	f4dff06f          	j	800021f8 <printf+0xb0>
    800022b0:	130000ef          	jal	800023e0 <uart_putc>
    800022b4:	00040493          	mv	s1,s0
    800022b8:	f41ff06f          	j	800021f8 <printf+0xb0>
    800022bc:	02500513          	li	a0,37
    800022c0:	120000ef          	jal	800023e0 <uart_putc>
    800022c4:	f35ff06f          	j	800021f8 <printf+0xb0>
    800022c8:	02500513          	li	a0,37
    800022cc:	114000ef          	jal	800023e0 <uart_putc>
    800022d0:	f35ff06f          	j	80002204 <printf+0xbc>
    800022d4:	00008517          	auipc	a0,0x8
    800022d8:	c2c50513          	add	a0,a0,-980 # 80009f00 <long_string+0x1f0>
    800022dc:	11c000ef          	jal	800023f8 <uart_puts>
    800022e0:	f19ff06f          	j	800021f8 <printf+0xb0>
    800022e4:	fff00a93          	li	s5,-1
    800022e8:	f1dff06f          	j	80002204 <printf+0xbc>

00000000800022ec <test_printf_basic>:
    800022ec:	ff010113          	add	sp,sp,-16
    800022f0:	02a00593          	li	a1,42
    800022f4:	00008517          	auipc	a0,0x8
    800022f8:	c1c50513          	add	a0,a0,-996 # 80009f10 <long_string+0x200>
    800022fc:	00113423          	sd	ra,8(sp)
    80002300:	e49ff0ef          	jal	80002148 <printf>
    80002304:	f8500593          	li	a1,-123
    80002308:	00008517          	auipc	a0,0x8
    8000230c:	c2050513          	add	a0,a0,-992 # 80009f28 <long_string+0x218>
    80002310:	e39ff0ef          	jal	80002148 <printf>
    80002314:	00000593          	li	a1,0
    80002318:	00008517          	auipc	a0,0x8
    8000231c:	c2850513          	add	a0,a0,-984 # 80009f40 <long_string+0x230>
    80002320:	e29ff0ef          	jal	80002148 <printf>
    80002324:	000015b7          	lui	a1,0x1
    80002328:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    8000232c:	00008517          	auipc	a0,0x8
    80002330:	c2c50513          	add	a0,a0,-980 # 80009f58 <long_string+0x248>
    80002334:	e15ff0ef          	jal	80002148 <printf>
    80002338:	00008597          	auipc	a1,0x8
    8000233c:	c3858593          	add	a1,a1,-968 # 80009f70 <long_string+0x260>
    80002340:	00008517          	auipc	a0,0x8
    80002344:	c3850513          	add	a0,a0,-968 # 80009f78 <long_string+0x268>
    80002348:	e01ff0ef          	jal	80002148 <printf>
    8000234c:	05800593          	li	a1,88
    80002350:	00008517          	auipc	a0,0x8
    80002354:	c4050513          	add	a0,a0,-960 # 80009f90 <long_string+0x280>
    80002358:	df1ff0ef          	jal	80002148 <printf>
    8000235c:	00813083          	ld	ra,8(sp)
    80002360:	00008517          	auipc	a0,0x8
    80002364:	c4850513          	add	a0,a0,-952 # 80009fa8 <long_string+0x298>
    80002368:	01010113          	add	sp,sp,16
    8000236c:	dddff06f          	j	80002148 <printf>

0000000080002370 <test_printf_edge_cases>:
    80002370:	800005b7          	lui	a1,0x80000
    80002374:	ff010113          	add	sp,sp,-16
    80002378:	fff5c593          	not	a1,a1
    8000237c:	00008517          	auipc	a0,0x8
    80002380:	c4450513          	add	a0,a0,-956 # 80009fc0 <long_string+0x2b0>
    80002384:	00113423          	sd	ra,8(sp)
    80002388:	dc1ff0ef          	jal	80002148 <printf>
    8000238c:	800005b7          	lui	a1,0x80000
    80002390:	00008517          	auipc	a0,0x8
    80002394:	c4050513          	add	a0,a0,-960 # 80009fd0 <long_string+0x2c0>
    80002398:	db1ff0ef          	jal	80002148 <printf>
    8000239c:	00000593          	li	a1,0
    800023a0:	00008517          	auipc	a0,0x8
    800023a4:	c4050513          	add	a0,a0,-960 # 80009fe0 <long_string+0x2d0>
    800023a8:	da1ff0ef          	jal	80002148 <printf>
    800023ac:	00007597          	auipc	a1,0x7
    800023b0:	1d458593          	add	a1,a1,468 # 80009580 <rodata_start+0x1580>
    800023b4:	00008517          	auipc	a0,0x8
    800023b8:	c4450513          	add	a0,a0,-956 # 80009ff8 <long_string+0x2e8>
    800023bc:	d8dff0ef          	jal	80002148 <printf>
    800023c0:	00008517          	auipc	a0,0x8
    800023c4:	c5050513          	add	a0,a0,-944 # 8000a010 <long_string+0x300>
    800023c8:	d81ff0ef          	jal	80002148 <printf>
    800023cc:	00813083          	ld	ra,8(sp)
    800023d0:	00008517          	auipc	a0,0x8
    800023d4:	c5050513          	add	a0,a0,-944 # 8000a020 <long_string+0x310>
    800023d8:	01010113          	add	sp,sp,16
    800023dc:	d6dff06f          	j	80002148 <printf>

00000000800023e0 <uart_putc>:
    800023e0:	10000737          	lui	a4,0x10000
    800023e4:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800023e8:	0207f793          	and	a5,a5,32
    800023ec:	fe078ce3          	beqz	a5,800023e4 <uart_putc+0x4>
    800023f0:	00a70023          	sb	a0,0(a4)
    800023f4:	00008067          	ret

00000000800023f8 <uart_puts>:
    800023f8:	00054683          	lbu	a3,0(a0)
    800023fc:	02068263          	beqz	a3,80002420 <uart_puts+0x28>
    80002400:	10000737          	lui	a4,0x10000
    80002404:	00150513          	add	a0,a0,1
    80002408:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000240c:	0207f793          	and	a5,a5,32
    80002410:	fe078ce3          	beqz	a5,80002408 <uart_puts+0x10>
    80002414:	00d70023          	sb	a3,0(a4)
    80002418:	00054683          	lbu	a3,0(a0)
    8000241c:	fe0694e3          	bnez	a3,80002404 <uart_puts+0xc>
    80002420:	00008067          	ret

0000000080002424 <pmm_init>:
    80002424:	000017b7          	lui	a5,0x1
    80002428:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    8000242c:	00f50533          	add	a0,a0,a5
    80002430:	fffff737          	lui	a4,0xfffff
    80002434:	00e57533          	and	a0,a0,a4
    80002438:	00e5f5b3          	and	a1,a1,a4
    8000243c:	00416797          	auipc	a5,0x416
    80002440:	d6a7be23          	sd	a0,-644(a5) # 804181b8 <mem_start>
    80002444:	00416797          	auipc	a5,0x416
    80002448:	d6b7b623          	sd	a1,-660(a5) # 804181b0 <mem_end>
    8000244c:	00416797          	auipc	a5,0x416
    80002450:	d607ba23          	sd	zero,-652(a5) # 804181c0 <freelist>
    80002454:	02b57e63          	bgeu	a0,a1,80002490 <pmm_init+0x6c>
    80002458:	02050e63          	beqz	a0,80002494 <pmm_init+0x70>
    8000245c:	00050793          	mv	a5,a0
    80002460:	00000613          	li	a2,0
    80002464:	00000693          	li	a3,0
    80002468:	00a7e863          	bltu	a5,a0,80002478 <pmm_init+0x54>
    8000246c:	00d7b023          	sd	a3,0(a5)
    80002470:	00100613          	li	a2,1
    80002474:	00078693          	mv	a3,a5
    80002478:	00001737          	lui	a4,0x1
    8000247c:	00e787b3          	add	a5,a5,a4
    80002480:	feb7e4e3          	bltu	a5,a1,80002468 <pmm_init+0x44>
    80002484:	00060663          	beqz	a2,80002490 <pmm_init+0x6c>
    80002488:	00416797          	auipc	a5,0x416
    8000248c:	d2d7bc23          	sd	a3,-712(a5) # 804181c0 <freelist>
    80002490:	00008067          	ret
    80002494:	00000793          	li	a5,0
    80002498:	00000613          	li	a2,0
    8000249c:	00000693          	li	a3,0
    800024a0:	fd9ff06f          	j	80002478 <pmm_init+0x54>

00000000800024a4 <alloc_page>:
    800024a4:	00416797          	auipc	a5,0x416
    800024a8:	d1c78793          	add	a5,a5,-740 # 804181c0 <freelist>
    800024ac:	0007b503          	ld	a0,0(a5)
    800024b0:	00050663          	beqz	a0,800024bc <alloc_page+0x18>
    800024b4:	00053703          	ld	a4,0(a0)
    800024b8:	00e7b023          	sd	a4,0(a5)
    800024bc:	00008067          	ret

00000000800024c0 <free_page>:
    800024c0:	02050c63          	beqz	a0,800024f8 <free_page+0x38>
    800024c4:	00416797          	auipc	a5,0x416
    800024c8:	cf47b783          	ld	a5,-780(a5) # 804181b8 <mem_start>
    800024cc:	02f56663          	bltu	a0,a5,800024f8 <free_page+0x38>
    800024d0:	00416797          	auipc	a5,0x416
    800024d4:	ce07b783          	ld	a5,-800(a5) # 804181b0 <mem_end>
    800024d8:	02f57063          	bgeu	a0,a5,800024f8 <free_page+0x38>
    800024dc:	03451793          	sll	a5,a0,0x34
    800024e0:	00079c63          	bnez	a5,800024f8 <free_page+0x38>
    800024e4:	00416797          	auipc	a5,0x416
    800024e8:	cdc78793          	add	a5,a5,-804 # 804181c0 <freelist>
    800024ec:	0007b703          	ld	a4,0(a5)
    800024f0:	00a7b023          	sd	a0,0(a5)
    800024f4:	00e53023          	sd	a4,0(a0)
    800024f8:	00008067          	ret

00000000800024fc <alloc_pages>:
    800024fc:	00050613          	mv	a2,a0
    80002500:	08a05863          	blez	a0,80002590 <alloc_pages+0x94>
    80002504:	00416317          	auipc	t1,0x416
    80002508:	cbc30313          	add	t1,t1,-836 # 804181c0 <freelist>
    8000250c:	00100793          	li	a5,1
    80002510:	00033803          	ld	a6,0(t1)
    80002514:	06f50463          	beq	a0,a5,8000257c <alloc_pages+0x80>
    80002518:	06080c63          	beqz	a6,80002590 <alloc_pages+0x94>
    8000251c:	00083503          	ld	a0,0(a6)
    80002520:	00080793          	mv	a5,a6
    80002524:	00100713          	li	a4,1
    80002528:	00000893          	li	a7,0
    8000252c:	000015b7          	lui	a1,0x1
    80002530:	0200006f          	j	80002550 <alloc_pages+0x54>
    80002534:	02d50463          	beq	a0,a3,8000255c <alloc_pages+0x60>
    80002538:	00053683          	ld	a3,0(a0)
    8000253c:	00078893          	mv	a7,a5
    80002540:	00050813          	mv	a6,a0
    80002544:	00100713          	li	a4,1
    80002548:	00050793          	mv	a5,a0
    8000254c:	00068513          	mv	a0,a3
    80002550:	00b786b3          	add	a3,a5,a1
    80002554:	fe0510e3          	bnez	a0,80002534 <alloc_pages+0x38>
    80002558:	00008067          	ret
    8000255c:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80002560:	00053683          	ld	a3,0(a0)
    80002564:	fee612e3          	bne	a2,a4,80002548 <alloc_pages+0x4c>
    80002568:	02088863          	beqz	a7,80002598 <alloc_pages+0x9c>
    8000256c:	00d8b023          	sd	a3,0(a7)
    80002570:	00053023          	sd	zero,0(a0)
    80002574:	00080513          	mv	a0,a6
    80002578:	00008067          	ret
    8000257c:	00080663          	beqz	a6,80002588 <alloc_pages+0x8c>
    80002580:	00083783          	ld	a5,0(a6)
    80002584:	00f33023          	sd	a5,0(t1)
    80002588:	00080513          	mv	a0,a6
    8000258c:	00008067          	ret
    80002590:	00000513          	li	a0,0
    80002594:	00008067          	ret
    80002598:	00053023          	sd	zero,0(a0)
    8000259c:	00d33023          	sd	a3,0(t1)
    800025a0:	00080513          	mv	a0,a6
    800025a4:	00008067          	ret

00000000800025a8 <walk_lookup>:
    800025a8:	01e5d793          	srl	a5,a1,0x1e
    800025ac:	1ff7f793          	and	a5,a5,511
    800025b0:	00379793          	sll	a5,a5,0x3
    800025b4:	00f50533          	add	a0,a0,a5
    800025b8:	00053703          	ld	a4,0(a0)
    800025bc:	00177793          	and	a5,a4,1
    800025c0:	04078a63          	beqz	a5,80002614 <walk_lookup+0x6c>
    800025c4:	00e77793          	and	a5,a4,14
    800025c8:	04079663          	bnez	a5,80002614 <walk_lookup+0x6c>
    800025cc:	0155d793          	srl	a5,a1,0x15
    800025d0:	00a75713          	srl	a4,a4,0xa
    800025d4:	1ff7f793          	and	a5,a5,511
    800025d8:	00c71713          	sll	a4,a4,0xc
    800025dc:	00379793          	sll	a5,a5,0x3
    800025e0:	00e787b3          	add	a5,a5,a4
    800025e4:	0007b503          	ld	a0,0(a5)
    800025e8:	00157793          	and	a5,a0,1
    800025ec:	02078463          	beqz	a5,80002614 <walk_lookup+0x6c>
    800025f0:	00e57793          	and	a5,a0,14
    800025f4:	02079063          	bnez	a5,80002614 <walk_lookup+0x6c>
    800025f8:	00c5d593          	srl	a1,a1,0xc
    800025fc:	00a55513          	srl	a0,a0,0xa
    80002600:	1ff5f593          	and	a1,a1,511
    80002604:	00359593          	sll	a1,a1,0x3
    80002608:	00c51513          	sll	a0,a0,0xc
    8000260c:	00b50533          	add	a0,a0,a1
    80002610:	00008067          	ret
    80002614:	00000513          	li	a0,0
    80002618:	00008067          	ret

000000008000261c <free_swap_slot.part.0>:
    8000261c:	0055579b          	srlw	a5,a0,0x5
    80002620:	0000f617          	auipc	a2,0xf
    80002624:	9e060613          	add	a2,a2,-1568 # 80011000 <swap_mgr>
    80002628:	00279793          	sll	a5,a5,0x2
    8000262c:	00f607b3          	add	a5,a2,a5
    80002630:	0007a583          	lw	a1,0(a5)
    80002634:	00100713          	li	a4,1
    80002638:	00a7173b          	sllw	a4,a4,a0
    8000263c:	00e5f6b3          	and	a3,a1,a4
    80002640:	0006869b          	sext.w	a3,a3
    80002644:	02068463          	beqz	a3,8000266c <free_swap_slot.part.0+0x50>
    80002648:	08862683          	lw	a3,136(a2)
    8000264c:	fff74713          	not	a4,a4
    80002650:	08062803          	lw	a6,128(a2)
    80002654:	00e5f5b3          	and	a1,a1,a4
    80002658:	fff6871b          	addw	a4,a3,-1
    8000265c:	00b7a023          	sw	a1,0(a5)
    80002660:	08e62423          	sw	a4,136(a2)
    80002664:	01057463          	bgeu	a0,a6,8000266c <free_swap_slot.part.0+0x50>
    80002668:	08a62023          	sw	a0,128(a2)
    8000266c:	00008067          	ret

0000000080002670 <create_pagetable>:
    80002670:	ff010113          	add	sp,sp,-16
    80002674:	00113423          	sd	ra,8(sp)
    80002678:	e2dff0ef          	jal	800024a4 <alloc_page>
    8000267c:	00050e63          	beqz	a0,80002698 <create_pagetable+0x28>
    80002680:	00001737          	lui	a4,0x1
    80002684:	00050793          	mv	a5,a0
    80002688:	00e50733          	add	a4,a0,a4
    8000268c:	0007b023          	sd	zero,0(a5)
    80002690:	00878793          	add	a5,a5,8
    80002694:	fee79ce3          	bne	a5,a4,8000268c <create_pagetable+0x1c>
    80002698:	00813083          	ld	ra,8(sp)
    8000269c:	01010113          	add	sp,sp,16
    800026a0:	00008067          	ret

00000000800026a4 <map_page>:
    800026a4:	00c5e7b3          	or	a5,a1,a2
    800026a8:	03479713          	sll	a4,a5,0x34
    800026ac:	20071863          	bnez	a4,800028bc <map_page+0x218>
    800026b0:	fc010113          	add	sp,sp,-64
    800026b4:	02913423          	sd	s1,40(sp)
    800026b8:	03213023          	sd	s2,32(sp)
    800026bc:	01313c23          	sd	s3,24(sp)
    800026c0:	01413823          	sd	s4,16(sp)
    800026c4:	01513423          	sd	s5,8(sp)
    800026c8:	01613023          	sd	s6,0(sp)
    800026cc:	02113c23          	sd	ra,56(sp)
    800026d0:	02813823          	sd	s0,48(sp)
    800026d4:	00058493          	mv	s1,a1
    800026d8:	00060913          	mv	s2,a2
    800026dc:	00050a13          	mv	s4,a0
    800026e0:	00068993          	mv	s3,a3
    800026e4:	00050813          	mv	a6,a0
    800026e8:	00200a93          	li	s5,2
    800026ec:	00200793          	li	a5,2
    800026f0:	00100b13          	li	s6,1
    800026f4:	0037941b          	sllw	s0,a5,0x3
    800026f8:	00f4043b          	addw	s0,s0,a5
    800026fc:	00c4041b          	addw	s0,s0,12
    80002700:	0084d433          	srl	s0,s1,s0
    80002704:	1ff47413          	and	s0,s0,511
    80002708:	00341413          	sll	s0,s0,0x3
    8000270c:	00880433          	add	s0,a6,s0
    80002710:	00043783          	ld	a5,0(s0)
    80002714:	0017f713          	and	a4,a5,1
    80002718:	14070e63          	beqz	a4,80002874 <map_page+0x1d0>
    8000271c:	00e7f713          	and	a4,a5,14
    80002720:	18071a63          	bnez	a4,800028b4 <map_page+0x210>
    80002724:	00a7d793          	srl	a5,a5,0xa
    80002728:	00c79813          	sll	a6,a5,0xc
    8000272c:	00100793          	li	a5,1
    80002730:	016a8663          	beq	s5,s6,8000273c <map_page+0x98>
    80002734:	00100a93          	li	s5,1
    80002738:	fbdff06f          	j	800026f4 <map_page+0x50>
    8000273c:	00c4d793          	srl	a5,s1,0xc
    80002740:	1ff7f793          	and	a5,a5,511
    80002744:	00379793          	sll	a5,a5,0x3
    80002748:	00f80833          	add	a6,a6,a5
    8000274c:	16080463          	beqz	a6,800028b4 <map_page+0x210>
    80002750:	00083783          	ld	a5,0(a6)
    80002754:	0017f793          	and	a5,a5,1
    80002758:	14079e63          	bnez	a5,800028b4 <map_page+0x210>
    8000275c:	00c95793          	srl	a5,s2,0xc
    80002760:	00a79793          	sll	a5,a5,0xa
    80002764:	00412597          	auipc	a1,0x412
    80002768:	92c58593          	add	a1,a1,-1748 # 80414090 <lru_mgr+0x3000>
    8000276c:	0145a703          	lw	a4,20(a1)
    80002770:	0137e7b3          	or	a5,a5,s3
    80002774:	0017e793          	or	a5,a5,1
    80002778:	00f83023          	sd	a5,0(a6)
    8000277c:	0c070663          	beqz	a4,80002848 <map_page+0x1a4>
    80002780:	0040f717          	auipc	a4,0x40f
    80002784:	93470713          	add	a4,a4,-1740 # 804110b4 <lru_mgr+0x24>
    80002788:	00000793          	li	a5,0
    8000278c:	10000693          	li	a3,256
    80002790:	00c0006f          	j	8000279c <map_page+0xf8>
    80002794:	0017879b          	addw	a5,a5,1
    80002798:	0ad78863          	beq	a5,a3,80002848 <map_page+0x1a4>
    8000279c:	00072803          	lw	a6,0(a4)
    800027a0:	03070713          	add	a4,a4,48
    800027a4:	fe0818e3          	bnez	a6,80002794 <map_page+0xf0>
    800027a8:	00178813          	add	a6,a5,1
    800027ac:	00181513          	sll	a0,a6,0x1
    800027b0:	00179713          	sll	a4,a5,0x1
    800027b4:	01050533          	add	a0,a0,a6
    800027b8:	0040f617          	auipc	a2,0x40f
    800027bc:	8d860613          	add	a2,a2,-1832 # 80411090 <lru_mgr>
    800027c0:	00f706b3          	add	a3,a4,a5
    800027c4:	00451513          	sll	a0,a0,0x4
    800027c8:	00469693          	sll	a3,a3,0x4
    800027cc:	00a60533          	add	a0,a2,a0
    800027d0:	fffff337          	lui	t1,0xfffff
    800027d4:	00d608b3          	add	a7,a2,a3
    800027d8:	0064f4b3          	and	s1,s1,t1
    800027dc:	01453423          	sd	s4,8(a0)
    800027e0:	fff00513          	li	a0,-1
    800027e4:	01068693          	add	a3,a3,16
    800027e8:	0098b823          	sd	s1,16(a7)
    800027ec:	0128bc23          	sd	s2,24(a7)
    800027f0:	02a8a023          	sw	a0,32(a7)
    800027f4:	0049f993          	and	s3,s3,4
    800027f8:	00d606b3          	add	a3,a2,a3
    800027fc:	00098463          	beqz	s3,80002804 <map_page+0x160>
    80002800:	00500a93          	li	s5,5
    80002804:	00181513          	sll	a0,a6,0x1
    80002808:	00f707b3          	add	a5,a4,a5
    8000280c:	00063883          	ld	a7,0(a2)
    80002810:	01050733          	add	a4,a0,a6
    80002814:	00479793          	sll	a5,a5,0x4
    80002818:	00471713          	sll	a4,a4,0x4
    8000281c:	00f607b3          	add	a5,a2,a5
    80002820:	00e60733          	add	a4,a2,a4
    80002824:	0357a223          	sw	s5,36(a5)
    80002828:	01173023          	sd	a7,0(a4)
    8000282c:	0207b423          	sd	zero,40(a5)
    80002830:	06088e63          	beqz	a7,800028ac <map_page+0x208>
    80002834:	00d8bc23          	sd	a3,24(a7)
    80002838:	0105a783          	lw	a5,16(a1)
    8000283c:	00d63023          	sd	a3,0(a2)
    80002840:	0017879b          	addw	a5,a5,1
    80002844:	00f5a823          	sw	a5,16(a1)
    80002848:	00000513          	li	a0,0
    8000284c:	03813083          	ld	ra,56(sp)
    80002850:	03013403          	ld	s0,48(sp)
    80002854:	02813483          	ld	s1,40(sp)
    80002858:	02013903          	ld	s2,32(sp)
    8000285c:	01813983          	ld	s3,24(sp)
    80002860:	01013a03          	ld	s4,16(sp)
    80002864:	00813a83          	ld	s5,8(sp)
    80002868:	00013b03          	ld	s6,0(sp)
    8000286c:	04010113          	add	sp,sp,64
    80002870:	00008067          	ret
    80002874:	c31ff0ef          	jal	800024a4 <alloc_page>
    80002878:	00050813          	mv	a6,a0
    8000287c:	02050c63          	beqz	a0,800028b4 <map_page+0x210>
    80002880:	00001737          	lui	a4,0x1
    80002884:	00e50733          	add	a4,a0,a4
    80002888:	00050793          	mv	a5,a0
    8000288c:	0007b023          	sd	zero,0(a5)
    80002890:	00878793          	add	a5,a5,8
    80002894:	fee79ce3          	bne	a5,a4,8000288c <map_page+0x1e8>
    80002898:	00c85793          	srl	a5,a6,0xc
    8000289c:	00a79793          	sll	a5,a5,0xa
    800028a0:	0017e793          	or	a5,a5,1
    800028a4:	00f43023          	sd	a5,0(s0)
    800028a8:	e85ff06f          	j	8000272c <map_page+0x88>
    800028ac:	00d63423          	sd	a3,8(a2)
    800028b0:	f89ff06f          	j	80002838 <map_page+0x194>
    800028b4:	fff00513          	li	a0,-1
    800028b8:	f95ff06f          	j	8000284c <map_page+0x1a8>
    800028bc:	fff00513          	li	a0,-1
    800028c0:	00008067          	ret

00000000800028c4 <map_region>:
    800028c4:	000017b7          	lui	a5,0x1
    800028c8:	fc010113          	add	sp,sp,-64
    800028cc:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800028d0:	02913423          	sd	s1,40(sp)
    800028d4:	00f684b3          	add	s1,a3,a5
    800028d8:	00b484b3          	add	s1,s1,a1
    800028dc:	fffff7b7          	lui	a5,0xfffff
    800028e0:	02113c23          	sd	ra,56(sp)
    800028e4:	02813823          	sd	s0,48(sp)
    800028e8:	03213023          	sd	s2,32(sp)
    800028ec:	01313c23          	sd	s3,24(sp)
    800028f0:	01413823          	sd	s4,16(sp)
    800028f4:	01513423          	sd	s5,8(sp)
    800028f8:	00f4f4b3          	and	s1,s1,a5
    800028fc:	0495f263          	bgeu	a1,s1,80002940 <map_region+0x7c>
    80002900:	00058413          	mv	s0,a1
    80002904:	00050993          	mv	s3,a0
    80002908:	00070a13          	mv	s4,a4
    8000290c:	40b60933          	sub	s2,a2,a1
    80002910:	00001ab7          	lui	s5,0x1
    80002914:	0080006f          	j	8000291c <map_region+0x58>
    80002918:	02947463          	bgeu	s0,s1,80002940 <map_region+0x7c>
    8000291c:	00890633          	add	a2,s2,s0
    80002920:	00040593          	mv	a1,s0
    80002924:	000a0693          	mv	a3,s4
    80002928:	00098513          	mv	a0,s3
    8000292c:	d79ff0ef          	jal	800026a4 <map_page>
    80002930:	01540433          	add	s0,s0,s5
    80002934:	fe0502e3          	beqz	a0,80002918 <map_region+0x54>
    80002938:	fff00513          	li	a0,-1
    8000293c:	0080006f          	j	80002944 <map_region+0x80>
    80002940:	00000513          	li	a0,0
    80002944:	03813083          	ld	ra,56(sp)
    80002948:	03013403          	ld	s0,48(sp)
    8000294c:	02813483          	ld	s1,40(sp)
    80002950:	02013903          	ld	s2,32(sp)
    80002954:	01813983          	ld	s3,24(sp)
    80002958:	01013a03          	ld	s4,16(sp)
    8000295c:	00813a83          	ld	s5,8(sp)
    80002960:	04010113          	add	sp,sp,64
    80002964:	00008067          	ret

0000000080002968 <destroy_pagetable>:
    80002968:	f0010113          	add	sp,sp,-256
    8000296c:	000017b7          	lui	a5,0x1
    80002970:	0e813823          	sd	s0,240(sp)
    80002974:	0f213023          	sd	s2,224(sp)
    80002978:	0d613023          	sd	s6,192(sp)
    8000297c:	0b713c23          	sd	s7,184(sp)
    80002980:	0e113c23          	sd	ra,248(sp)
    80002984:	0e913423          	sd	s1,232(sp)
    80002988:	0d313c23          	sd	s3,216(sp)
    8000298c:	0d413823          	sd	s4,208(sp)
    80002990:	0d513423          	sd	s5,200(sp)
    80002994:	0b813823          	sd	s8,176(sp)
    80002998:	0b913423          	sd	s9,168(sp)
    8000299c:	0ba13023          	sd	s10,160(sp)
    800029a0:	09b13c23          	sd	s11,152(sp)
    800029a4:	00050413          	mv	s0,a0
    800029a8:	00050913          	mv	s2,a0
    800029ac:	00f50b33          	add	s6,a0,a5
    800029b0:	00001bb7          	lui	s7,0x1
    800029b4:	00c0006f          	j	800029c0 <destroy_pagetable+0x58>
    800029b8:	00890913          	add	s2,s2,8
    800029bc:	2d690063          	beq	s2,s6,80002c7c <destroy_pagetable+0x314>
    800029c0:	00093783          	ld	a5,0(s2)
    800029c4:	00100713          	li	a4,1
    800029c8:	00f7f693          	and	a3,a5,15
    800029cc:	fee696e3          	bne	a3,a4,800029b8 <destroy_pagetable+0x50>
    800029d0:	00a7d793          	srl	a5,a5,0xa
    800029d4:	00c79a13          	sll	s4,a5,0xc
    800029d8:	017a0cb3          	add	s9,s4,s7
    800029dc:	00100d93          	li	s11,1
    800029e0:	000a0a93          	mv	s5,s4
    800029e4:	00040493          	mv	s1,s0
    800029e8:	00c0006f          	j	800029f4 <destroy_pagetable+0x8c>
    800029ec:	008a0a13          	add	s4,s4,8
    800029f0:	279a0c63          	beq	s4,s9,80002c68 <destroy_pagetable+0x300>
    800029f4:	000a3783          	ld	a5,0(s4)
    800029f8:	00f7f713          	and	a4,a5,15
    800029fc:	ffb718e3          	bne	a4,s11,800029ec <destroy_pagetable+0x84>
    80002a00:	00a7d793          	srl	a5,a5,0xa
    80002a04:	00c79993          	sll	s3,a5,0xc
    80002a08:	00098c13          	mv	s8,s3
    80002a0c:	01798d33          	add	s10,s3,s7
    80002a10:	00098413          	mv	s0,s3
    80002a14:	00c0006f          	j	80002a20 <destroy_pagetable+0xb8>
    80002a18:	00840413          	add	s0,s0,8
    80002a1c:	23a40e63          	beq	s0,s10,80002c58 <destroy_pagetable+0x2f0>
    80002a20:	00043783          	ld	a5,0(s0)
    80002a24:	00f7f713          	and	a4,a5,15
    80002a28:	ffb718e3          	bne	a4,s11,80002a18 <destroy_pagetable+0xb0>
    80002a2c:	00a7d793          	srl	a5,a5,0xa
    80002a30:	00c79793          	sll	a5,a5,0xc
    80002a34:	00048713          	mv	a4,s1
    80002a38:	03513c23          	sd	s5,56(sp)
    80002a3c:	00090493          	mv	s1,s2
    80002a40:	017789b3          	add	s3,a5,s7
    80002a44:	02813823          	sd	s0,48(sp)
    80002a48:	00078a93          	mv	s5,a5
    80002a4c:	00070913          	mv	s2,a4
    80002a50:	00c0006f          	j	80002a5c <destroy_pagetable+0xf4>
    80002a54:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80002a58:	1cf98e63          	beq	s3,a5,80002c34 <destroy_pagetable+0x2cc>
    80002a5c:	0007b703          	ld	a4,0(a5)
    80002a60:	00f77693          	and	a3,a4,15
    80002a64:	ffb698e3          	bne	a3,s11,80002a54 <destroy_pagetable+0xec>
    80002a68:	00a75713          	srl	a4,a4,0xa
    80002a6c:	00c71713          	sll	a4,a4,0xc
    80002a70:	017706b3          	add	a3,a4,s7
    80002a74:	05313423          	sd	s3,72(sp)
    80002a78:	00d13423          	sd	a3,8(sp)
    80002a7c:	05813023          	sd	s8,64(sp)
    80002a80:	00070993          	mv	s3,a4
    80002a84:	04f13823          	sd	a5,80(sp)
    80002a88:	0100006f          	j	80002a98 <destroy_pagetable+0x130>
    80002a8c:	00813783          	ld	a5,8(sp)
    80002a90:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    80002a94:	16e78e63          	beq	a5,a4,80002c10 <destroy_pagetable+0x2a8>
    80002a98:	00073783          	ld	a5,0(a4)
    80002a9c:	00f7f693          	and	a3,a5,15
    80002aa0:	ffb696e3          	bne	a3,s11,80002a8c <destroy_pagetable+0x124>
    80002aa4:	00a7d793          	srl	a5,a5,0xa
    80002aa8:	00c79793          	sll	a5,a5,0xc
    80002aac:	017786b3          	add	a3,a5,s7
    80002ab0:	000a8c13          	mv	s8,s5
    80002ab4:	00d13c23          	sd	a3,24(sp)
    80002ab8:	00078a93          	mv	s5,a5
    80002abc:	04e13c23          	sd	a4,88(sp)
    80002ac0:	07213023          	sd	s2,96(sp)
    80002ac4:	0100006f          	j	80002ad4 <destroy_pagetable+0x16c>
    80002ac8:	01813703          	ld	a4,24(sp)
    80002acc:	00878793          	add	a5,a5,8
    80002ad0:	10f70c63          	beq	a4,a5,80002be8 <destroy_pagetable+0x280>
    80002ad4:	0007b703          	ld	a4,0(a5)
    80002ad8:	00f77693          	and	a3,a4,15
    80002adc:	ffb696e3          	bne	a3,s11,80002ac8 <destroy_pagetable+0x160>
    80002ae0:	00a75713          	srl	a4,a4,0xa
    80002ae4:	00c71913          	sll	s2,a4,0xc
    80002ae8:	01790733          	add	a4,s2,s7
    80002aec:	07213423          	sd	s2,104(sp)
    80002af0:	00090413          	mv	s0,s2
    80002af4:	02e13023          	sd	a4,32(sp)
    80002af8:	06f13823          	sd	a5,112(sp)
    80002afc:	00048913          	mv	s2,s1
    80002b00:	0100006f          	j	80002b10 <destroy_pagetable+0x1a8>
    80002b04:	02013783          	ld	a5,32(sp)
    80002b08:	00840413          	add	s0,s0,8
    80002b0c:	0a878c63          	beq	a5,s0,80002bc4 <destroy_pagetable+0x25c>
    80002b10:	00043783          	ld	a5,0(s0)
    80002b14:	00f7f693          	and	a3,a5,15
    80002b18:	ffb696e3          	bne	a3,s11,80002b04 <destroy_pagetable+0x19c>
    80002b1c:	00a7d793          	srl	a5,a5,0xa
    80002b20:	00c79493          	sll	s1,a5,0xc
    80002b24:	017487b3          	add	a5,s1,s7
    80002b28:	00913823          	sd	s1,16(sp)
    80002b2c:	02f13423          	sd	a5,40(sp)
    80002b30:	06813c23          	sd	s0,120(sp)
    80002b34:	0100006f          	j	80002b44 <destroy_pagetable+0x1dc>
    80002b38:	02813783          	ld	a5,40(sp)
    80002b3c:	00848493          	add	s1,s1,8
    80002b40:	06978663          	beq	a5,s1,80002bac <destroy_pagetable+0x244>
    80002b44:	0004b783          	ld	a5,0(s1)
    80002b48:	00f7f693          	and	a3,a5,15
    80002b4c:	ffb696e3          	bne	a3,s11,80002b38 <destroy_pagetable+0x1d0>
    80002b50:	00a7d793          	srl	a5,a5,0xa
    80002b54:	00c79413          	sll	s0,a5,0xc
    80002b58:	017406b3          	add	a3,s0,s7
    80002b5c:	09213023          	sd	s2,128(sp)
    80002b60:	09613423          	sd	s6,136(sp)
    80002b64:	00040913          	mv	s2,s0
    80002b68:	000a0b13          	mv	s6,s4
    80002b6c:	00048a13          	mv	s4,s1
    80002b70:	00068493          	mv	s1,a3
    80002b74:	00043783          	ld	a5,0(s0)
    80002b78:	00840413          	add	s0,s0,8
    80002b7c:	00f7f713          	and	a4,a5,15
    80002b80:	13b70e63          	beq	a4,s11,80002cbc <destroy_pagetable+0x354>
    80002b84:	fe8498e3          	bne	s1,s0,80002b74 <destroy_pagetable+0x20c>
    80002b88:	00090513          	mv	a0,s2
    80002b8c:	000a0493          	mv	s1,s4
    80002b90:	08013903          	ld	s2,128(sp)
    80002b94:	000b0a13          	mv	s4,s6
    80002b98:	08813b03          	ld	s6,136(sp)
    80002b9c:	925ff0ef          	jal	800024c0 <free_page>
    80002ba0:	02813783          	ld	a5,40(sp)
    80002ba4:	00848493          	add	s1,s1,8
    80002ba8:	f8979ee3          	bne	a5,s1,80002b44 <destroy_pagetable+0x1dc>
    80002bac:	01013503          	ld	a0,16(sp)
    80002bb0:	07813403          	ld	s0,120(sp)
    80002bb4:	90dff0ef          	jal	800024c0 <free_page>
    80002bb8:	02013783          	ld	a5,32(sp)
    80002bbc:	00840413          	add	s0,s0,8
    80002bc0:	f48798e3          	bne	a5,s0,80002b10 <destroy_pagetable+0x1a8>
    80002bc4:	07013783          	ld	a5,112(sp)
    80002bc8:	06813503          	ld	a0,104(sp)
    80002bcc:	00090493          	mv	s1,s2
    80002bd0:	00f13823          	sd	a5,16(sp)
    80002bd4:	8edff0ef          	jal	800024c0 <free_page>
    80002bd8:	01013783          	ld	a5,16(sp)
    80002bdc:	01813703          	ld	a4,24(sp)
    80002be0:	00878793          	add	a5,a5,8
    80002be4:	eef718e3          	bne	a4,a5,80002ad4 <destroy_pagetable+0x16c>
    80002be8:	05813703          	ld	a4,88(sp)
    80002bec:	000a8513          	mv	a0,s5
    80002bf0:	06013903          	ld	s2,96(sp)
    80002bf4:	00e13823          	sd	a4,16(sp)
    80002bf8:	8c9ff0ef          	jal	800024c0 <free_page>
    80002bfc:	01013703          	ld	a4,16(sp)
    80002c00:	00813783          	ld	a5,8(sp)
    80002c04:	000c0a93          	mv	s5,s8
    80002c08:	00870713          	add	a4,a4,8
    80002c0c:	e8e796e3          	bne	a5,a4,80002a98 <destroy_pagetable+0x130>
    80002c10:	05013783          	ld	a5,80(sp)
    80002c14:	00098513          	mv	a0,s3
    80002c18:	04013c03          	ld	s8,64(sp)
    80002c1c:	00f13423          	sd	a5,8(sp)
    80002c20:	04813983          	ld	s3,72(sp)
    80002c24:	89dff0ef          	jal	800024c0 <free_page>
    80002c28:	00813783          	ld	a5,8(sp)
    80002c2c:	00878793          	add	a5,a5,8
    80002c30:	e2f996e3          	bne	s3,a5,80002a5c <destroy_pagetable+0xf4>
    80002c34:	03013403          	ld	s0,48(sp)
    80002c38:	00090793          	mv	a5,s2
    80002c3c:	000a8513          	mv	a0,s5
    80002c40:	00840413          	add	s0,s0,8
    80002c44:	03813a83          	ld	s5,56(sp)
    80002c48:	00048913          	mv	s2,s1
    80002c4c:	00078493          	mv	s1,a5
    80002c50:	871ff0ef          	jal	800024c0 <free_page>
    80002c54:	dda416e3          	bne	s0,s10,80002a20 <destroy_pagetable+0xb8>
    80002c58:	000c0513          	mv	a0,s8
    80002c5c:	008a0a13          	add	s4,s4,8
    80002c60:	861ff0ef          	jal	800024c0 <free_page>
    80002c64:	d99a18e3          	bne	s4,s9,800029f4 <destroy_pagetable+0x8c>
    80002c68:	000a8513          	mv	a0,s5
    80002c6c:	00890913          	add	s2,s2,8
    80002c70:	00048413          	mv	s0,s1
    80002c74:	84dff0ef          	jal	800024c0 <free_page>
    80002c78:	d56914e3          	bne	s2,s6,800029c0 <destroy_pagetable+0x58>
    80002c7c:	00040513          	mv	a0,s0
    80002c80:	0f013403          	ld	s0,240(sp)
    80002c84:	0f813083          	ld	ra,248(sp)
    80002c88:	0e813483          	ld	s1,232(sp)
    80002c8c:	0e013903          	ld	s2,224(sp)
    80002c90:	0d813983          	ld	s3,216(sp)
    80002c94:	0d013a03          	ld	s4,208(sp)
    80002c98:	0c813a83          	ld	s5,200(sp)
    80002c9c:	0c013b03          	ld	s6,192(sp)
    80002ca0:	0b813b83          	ld	s7,184(sp)
    80002ca4:	0b013c03          	ld	s8,176(sp)
    80002ca8:	0a813c83          	ld	s9,168(sp)
    80002cac:	0a013d03          	ld	s10,160(sp)
    80002cb0:	09813d83          	ld	s11,152(sp)
    80002cb4:	10010113          	add	sp,sp,256
    80002cb8:	809ff06f          	j	800024c0 <free_page>
    80002cbc:	00a7d793          	srl	a5,a5,0xa
    80002cc0:	00c79513          	sll	a0,a5,0xc
    80002cc4:	ca5ff0ef          	jal	80002968 <destroy_pagetable>
    80002cc8:	ea8496e3          	bne	s1,s0,80002b74 <destroy_pagetable+0x20c>
    80002ccc:	ebdff06f          	j	80002b88 <destroy_pagetable+0x220>

0000000080002cd0 <kvminithart>:
    80002cd0:	00415797          	auipc	a5,0x415
    80002cd4:	4f87b783          	ld	a5,1272(a5) # 804181c8 <kernel_pagetable>
    80002cd8:	fff00713          	li	a4,-1
    80002cdc:	03f71713          	sll	a4,a4,0x3f
    80002ce0:	00c7d793          	srl	a5,a5,0xc
    80002ce4:	00e7e7b3          	or	a5,a5,a4
    80002ce8:	18079073          	csrw	satp,a5
    80002cec:	12000073          	sfence.vma
    80002cf0:	00008067          	ret

0000000080002cf4 <dump_pagetable>:
    80002cf4:	fb010113          	add	sp,sp,-80
    80002cf8:	03213823          	sd	s2,48(sp)
    80002cfc:	03313423          	sd	s3,40(sp)
    80002d00:	04113423          	sd	ra,72(sp)
    80002d04:	04813023          	sd	s0,64(sp)
    80002d08:	02913c23          	sd	s1,56(sp)
    80002d0c:	03413023          	sd	s4,32(sp)
    80002d10:	01513c23          	sd	s5,24(sp)
    80002d14:	01613823          	sd	s6,16(sp)
    80002d18:	01713423          	sd	s7,8(sp)
    80002d1c:	00058993          	mv	s3,a1
    80002d20:	00050913          	mv	s2,a0
    80002d24:	28b05263          	blez	a1,80002fa8 <dump_pagetable+0x2b4>
    80002d28:	00000413          	li	s0,0
    80002d2c:	0014041b          	addw	s0,s0,1
    80002d30:	02000513          	li	a0,32
    80002d34:	eacff0ef          	jal	800023e0 <uart_putc>
    80002d38:	fe899ae3          	bne	s3,s0,80002d2c <dump_pagetable+0x38>
    80002d3c:	00007517          	auipc	a0,0x7
    80002d40:	41c50513          	add	a0,a0,1052 # 8000a158 <digits+0x18>
    80002d44:	eb4ff0ef          	jal	800023f8 <uart_puts>
    80002d48:	00900793          	li	a5,9
    80002d4c:	2737d463          	bge	a5,s3,80002fb4 <dump_pagetable+0x2c0>
    80002d50:	00a00413          	li	s0,10
    80002d54:	0289c53b          	divw	a0,s3,s0
    80002d58:	0305051b          	addw	a0,a0,48
    80002d5c:	0ff57513          	zext.b	a0,a0
    80002d60:	e80ff0ef          	jal	800023e0 <uart_putc>
    80002d64:	0289e53b          	remw	a0,s3,s0
    80002d68:	0305051b          	addw	a0,a0,48
    80002d6c:	0ff57513          	zext.b	a0,a0
    80002d70:	e70ff0ef          	jal	800023e0 <uart_putc>
    80002d74:	00006517          	auipc	a0,0x6
    80002d78:	b7c50513          	add	a0,a0,-1156 # 800088f0 <rodata_start+0x8f0>
    80002d7c:	fff00b13          	li	s6,-1
    80002d80:	e78ff0ef          	jal	800023f8 <uart_puts>
    80002d84:	00000493          	li	s1,0
    80002d88:	00cb5b13          	srl	s6,s6,0xc
    80002d8c:	00900a13          	li	s4,9
    80002d90:	ffc00a93          	li	s5,-4
    80002d94:	0140006f          	j	80002da8 <dump_pagetable+0xb4>
    80002d98:	0014849b          	addw	s1,s1,1
    80002d9c:	20000793          	li	a5,512
    80002da0:	00890913          	add	s2,s2,8
    80002da4:	0cf48063          	beq	s1,a5,80002e64 <dump_pagetable+0x170>
    80002da8:	00093783          	ld	a5,0(s2)
    80002dac:	0017f793          	and	a5,a5,1
    80002db0:	fe0784e3          	beqz	a5,80002d98 <dump_pagetable+0xa4>
    80002db4:	00000413          	li	s0,0
    80002db8:	0009ca63          	bltz	s3,80002dcc <dump_pagetable+0xd8>
    80002dbc:	0014041b          	addw	s0,s0,1
    80002dc0:	02000513          	li	a0,32
    80002dc4:	e1cff0ef          	jal	800023e0 <uart_putc>
    80002dc8:	fe89dae3          	bge	s3,s0,80002dbc <dump_pagetable+0xc8>
    80002dcc:	00007517          	auipc	a0,0x7
    80002dd0:	3a450513          	add	a0,a0,932 # 8000a170 <digits+0x30>
    80002dd4:	e24ff0ef          	jal	800023f8 <uart_puts>
    80002dd8:	06300793          	li	a5,99
    80002ddc:	1697d263          	bge	a5,s1,80002f40 <dump_pagetable+0x24c>
    80002de0:	06400413          	li	s0,100
    80002de4:	0284c53b          	divw	a0,s1,s0
    80002de8:	00a00b93          	li	s7,10
    80002dec:	0305051b          	addw	a0,a0,48
    80002df0:	0ff57513          	zext.b	a0,a0
    80002df4:	decff0ef          	jal	800023e0 <uart_putc>
    80002df8:	0284e53b          	remw	a0,s1,s0
    80002dfc:	0375453b          	divw	a0,a0,s7
    80002e00:	0305051b          	addw	a0,a0,48
    80002e04:	0ff57513          	zext.b	a0,a0
    80002e08:	dd8ff0ef          	jal	800023e0 <uart_putc>
    80002e0c:	0374e53b          	remw	a0,s1,s7
    80002e10:	0305051b          	addw	a0,a0,48
    80002e14:	0ff57513          	zext.b	a0,a0
    80002e18:	dc8ff0ef          	jal	800023e0 <uart_putc>
    80002e1c:	00007517          	auipc	a0,0x7
    80002e20:	a8c50513          	add	a0,a0,-1396 # 800098a8 <rodata_start+0x18a8>
    80002e24:	dd4ff0ef          	jal	800023f8 <uart_puts>
    80002e28:	00093b83          	ld	s7,0(s2)
    80002e2c:	00ebf793          	and	a5,s7,14
    80002e30:	06079063          	bnez	a5,80002e90 <dump_pagetable+0x19c>
    80002e34:	00007517          	auipc	a0,0x7
    80002e38:	35450513          	add	a0,a0,852 # 8000a188 <digits+0x48>
    80002e3c:	dbcff0ef          	jal	800023f8 <uart_puts>
    80002e40:	00093503          	ld	a0,0(s2)
    80002e44:	0019859b          	addw	a1,s3,1
    80002e48:	0014849b          	addw	s1,s1,1
    80002e4c:	00a55513          	srl	a0,a0,0xa
    80002e50:	00c51513          	sll	a0,a0,0xc
    80002e54:	ea1ff0ef          	jal	80002cf4 <dump_pagetable>
    80002e58:	20000793          	li	a5,512
    80002e5c:	00890913          	add	s2,s2,8
    80002e60:	f4f494e3          	bne	s1,a5,80002da8 <dump_pagetable+0xb4>
    80002e64:	04813083          	ld	ra,72(sp)
    80002e68:	04013403          	ld	s0,64(sp)
    80002e6c:	03813483          	ld	s1,56(sp)
    80002e70:	03013903          	ld	s2,48(sp)
    80002e74:	02813983          	ld	s3,40(sp)
    80002e78:	02013a03          	ld	s4,32(sp)
    80002e7c:	01813a83          	ld	s5,24(sp)
    80002e80:	01013b03          	ld	s6,16(sp)
    80002e84:	00813b83          	ld	s7,8(sp)
    80002e88:	05010113          	add	sp,sp,80
    80002e8c:	00008067          	ret
    80002e90:	00007517          	auipc	a0,0x7
    80002e94:	2e850513          	add	a0,a0,744 # 8000a178 <digits+0x38>
    80002e98:	d60ff0ef          	jal	800023f8 <uart_puts>
    80002e9c:	00abdb93          	srl	s7,s7,0xa
    80002ea0:	016bfbb3          	and	s7,s7,s6
    80002ea4:	00000713          	li	a4,0
    80002ea8:	03c00413          	li	s0,60
    80002eac:	008bd7b3          	srl	a5,s7,s0
    80002eb0:	00f7f793          	and	a5,a5,15
    80002eb4:	00e7e733          	or	a4,a5,a4
    80002eb8:	00071e63          	bnez	a4,80002ed4 <dump_pagetable+0x1e0>
    80002ebc:	02040c63          	beqz	s0,80002ef4 <dump_pagetable+0x200>
    80002ec0:	ffc4041b          	addw	s0,s0,-4
    80002ec4:	008bd7b3          	srl	a5,s7,s0
    80002ec8:	00f7f793          	and	a5,a5,15
    80002ecc:	00e7e733          	or	a4,a5,a4
    80002ed0:	fe0706e3          	beqz	a4,80002ebc <dump_pagetable+0x1c8>
    80002ed4:	ffc4041b          	addw	s0,s0,-4
    80002ed8:	03778513          	add	a0,a5,55
    80002edc:	0ff7f713          	zext.b	a4,a5
    80002ee0:	04fa5c63          	bge	s4,a5,80002f38 <dump_pagetable+0x244>
    80002ee4:	cfcff0ef          	jal	800023e0 <uart_putc>
    80002ee8:	01540a63          	beq	s0,s5,80002efc <dump_pagetable+0x208>
    80002eec:	00100713          	li	a4,1
    80002ef0:	fbdff06f          	j	80002eac <dump_pagetable+0x1b8>
    80002ef4:	03000513          	li	a0,48
    80002ef8:	ce8ff0ef          	jal	800023e0 <uart_putc>
    80002efc:	00007517          	auipc	a0,0x7
    80002f00:	28450513          	add	a0,a0,644 # 8000a180 <digits+0x40>
    80002f04:	cf4ff0ef          	jal	800023f8 <uart_puts>
    80002f08:	00093783          	ld	a5,0(s2)
    80002f0c:	0027f713          	and	a4,a5,2
    80002f10:	08071463          	bnez	a4,80002f98 <dump_pagetable+0x2a4>
    80002f14:	0047f713          	and	a4,a5,4
    80002f18:	06071863          	bnez	a4,80002f88 <dump_pagetable+0x294>
    80002f1c:	0087f713          	and	a4,a5,8
    80002f20:	04071c63          	bnez	a4,80002f78 <dump_pagetable+0x284>
    80002f24:	0107f793          	and	a5,a5,16
    80002f28:	04079263          	bnez	a5,80002f6c <dump_pagetable+0x278>
    80002f2c:	00a00513          	li	a0,10
    80002f30:	cb0ff0ef          	jal	800023e0 <uart_putc>
    80002f34:	e65ff06f          	j	80002d98 <dump_pagetable+0xa4>
    80002f38:	03070513          	add	a0,a4,48
    80002f3c:	fa9ff06f          	j	80002ee4 <dump_pagetable+0x1f0>
    80002f40:	089a5263          	bge	s4,s1,80002fc4 <dump_pagetable+0x2d0>
    80002f44:	00a00413          	li	s0,10
    80002f48:	0284c53b          	divw	a0,s1,s0
    80002f4c:	0305051b          	addw	a0,a0,48
    80002f50:	0ff57513          	zext.b	a0,a0
    80002f54:	c8cff0ef          	jal	800023e0 <uart_putc>
    80002f58:	0284e53b          	remw	a0,s1,s0
    80002f5c:	0305051b          	addw	a0,a0,48
    80002f60:	0ff57513          	zext.b	a0,a0
    80002f64:	c7cff0ef          	jal	800023e0 <uart_putc>
    80002f68:	eb5ff06f          	j	80002e1c <dump_pagetable+0x128>
    80002f6c:	05500513          	li	a0,85
    80002f70:	c70ff0ef          	jal	800023e0 <uart_putc>
    80002f74:	fb9ff06f          	j	80002f2c <dump_pagetable+0x238>
    80002f78:	05800513          	li	a0,88
    80002f7c:	c64ff0ef          	jal	800023e0 <uart_putc>
    80002f80:	00093783          	ld	a5,0(s2)
    80002f84:	fa1ff06f          	j	80002f24 <dump_pagetable+0x230>
    80002f88:	05700513          	li	a0,87
    80002f8c:	c54ff0ef          	jal	800023e0 <uart_putc>
    80002f90:	00093783          	ld	a5,0(s2)
    80002f94:	f89ff06f          	j	80002f1c <dump_pagetable+0x228>
    80002f98:	05200513          	li	a0,82
    80002f9c:	c44ff0ef          	jal	800023e0 <uart_putc>
    80002fa0:	00093783          	ld	a5,0(s2)
    80002fa4:	f71ff06f          	j	80002f14 <dump_pagetable+0x220>
    80002fa8:	00007517          	auipc	a0,0x7
    80002fac:	1b050513          	add	a0,a0,432 # 8000a158 <digits+0x18>
    80002fb0:	c48ff0ef          	jal	800023f8 <uart_puts>
    80002fb4:	0309851b          	addw	a0,s3,48
    80002fb8:	0ff57513          	zext.b	a0,a0
    80002fbc:	c24ff0ef          	jal	800023e0 <uart_putc>
    80002fc0:	db5ff06f          	j	80002d74 <dump_pagetable+0x80>
    80002fc4:	0304851b          	addw	a0,s1,48
    80002fc8:	0ff57513          	zext.b	a0,a0
    80002fcc:	c14ff0ef          	jal	800023e0 <uart_putc>
    80002fd0:	e4dff06f          	j	80002e1c <dump_pagetable+0x128>

0000000080002fd4 <init_page_replacement>:
    80002fd4:	00100713          	li	a4,1
    80002fd8:	02a71713          	sll	a4,a4,0x2a
    80002fdc:	0000e797          	auipc	a5,0xe
    80002fe0:	02478793          	add	a5,a5,36 # 80011000 <swap_mgr>
    80002fe4:	08e7b023          	sd	a4,128(a5)
    80002fe8:	0000e717          	auipc	a4,0xe
    80002fec:	0a072023          	sw	zero,160(a4) # 80011088 <swap_mgr+0x88>
    80002ff0:	0000e717          	auipc	a4,0xe
    80002ff4:	09070713          	add	a4,a4,144 # 80011080 <swap_mgr+0x80>
    80002ff8:	0007a023          	sw	zero,0(a5)
    80002ffc:	00478793          	add	a5,a5,4
    80003000:	fee79ce3          	bne	a5,a4,80002ff8 <init_page_replacement+0x24>
    80003004:	0040e797          	auipc	a5,0x40e
    80003008:	0807b623          	sd	zero,140(a5) # 80411090 <lru_mgr>
    8000300c:	0040e797          	auipc	a5,0x40e
    80003010:	0807b623          	sd	zero,140(a5) # 80411098 <lru_mgr+0x8>
    80003014:	00100793          	li	a5,1
    80003018:	02879793          	sll	a5,a5,0x28
    8000301c:	00411717          	auipc	a4,0x411
    80003020:	08f73223          	sd	a5,132(a4) # 804140a0 <lru_mgr+0x3010>
    80003024:	fff00713          	li	a4,-1
    80003028:	0040e797          	auipc	a5,0x40e
    8000302c:	07878793          	add	a5,a5,120 # 804110a0 <lru_mgr+0x10>
    80003030:	00411697          	auipc	a3,0x411
    80003034:	07068693          	add	a3,a3,112 # 804140a0 <lru_mgr+0x3010>
    80003038:	02075713          	srl	a4,a4,0x20
    8000303c:	0007b023          	sd	zero,0(a5)
    80003040:	0007b423          	sd	zero,8(a5)
    80003044:	00e7b823          	sd	a4,16(a5)
    80003048:	0007bc23          	sd	zero,24(a5)
    8000304c:	0207b023          	sd	zero,32(a5)
    80003050:	0207b423          	sd	zero,40(a5)
    80003054:	03078793          	add	a5,a5,48
    80003058:	fed792e3          	bne	a5,a3,8000303c <init_page_replacement+0x68>
    8000305c:	00008067          	ret

0000000080003060 <kvminit>:
    80003060:	fd010113          	add	sp,sp,-48
    80003064:	02113423          	sd	ra,40(sp)
    80003068:	02813023          	sd	s0,32(sp)
    8000306c:	00913c23          	sd	s1,24(sp)
    80003070:	01213823          	sd	s2,16(sp)
    80003074:	01313423          	sd	s3,8(sp)
    80003078:	01413023          	sd	s4,0(sp)
    8000307c:	f59ff0ef          	jal	80002fd4 <init_page_replacement>
    80003080:	c24ff0ef          	jal	800024a4 <alloc_page>
    80003084:	00001737          	lui	a4,0x1
    80003088:	00e50733          	add	a4,a0,a4
    8000308c:	00050413          	mv	s0,a0
    80003090:	00050793          	mv	a5,a0
    80003094:	1a050663          	beqz	a0,80003240 <kvminit+0x1e0>
    80003098:	0007b023          	sd	zero,0(a5)
    8000309c:	00878793          	add	a5,a5,8
    800030a0:	fef71ce3          	bne	a4,a5,80003098 <kvminit+0x38>
    800030a4:	00415917          	auipc	s2,0x415
    800030a8:	12490913          	add	s2,s2,292 # 804181c8 <kernel_pagetable>
    800030ac:	00005997          	auipc	s3,0x5
    800030b0:	18b98993          	add	s3,s3,395 # 80008237 <rodata_start+0x237>
    800030b4:	fffff7b7          	lui	a5,0xfffff
    800030b8:	00893023          	sd	s0,0(s2)
    800030bc:	ffffd497          	auipc	s1,0xffffd
    800030c0:	f4448493          	add	s1,s1,-188 # 80000000 <_entry>
    800030c4:	00f9f9b3          	and	s3,s3,a5
    800030c8:	0334f863          	bgeu	s1,s3,800030f8 <kvminit+0x98>
    800030cc:	00001a37          	lui	s4,0x1
    800030d0:	0080006f          	j	800030d8 <kvminit+0x78>
    800030d4:	0334f063          	bgeu	s1,s3,800030f4 <kvminit+0x94>
    800030d8:	00048613          	mv	a2,s1
    800030dc:	00048593          	mv	a1,s1
    800030e0:	00a00693          	li	a3,10
    800030e4:	00040513          	mv	a0,s0
    800030e8:	dbcff0ef          	jal	800026a4 <map_page>
    800030ec:	014484b3          	add	s1,s1,s4
    800030f0:	fe0502e3          	beqz	a0,800030d4 <kvminit+0x74>
    800030f4:	00093403          	ld	s0,0(s2)
    800030f8:	00009997          	auipc	s3,0x9
    800030fc:	46798993          	add	s3,s3,1127 # 8000c55f <data_end+0x55b>
    80003100:	fffff7b7          	lui	a5,0xfffff
    80003104:	00005497          	auipc	s1,0x5
    80003108:	efc48493          	add	s1,s1,-260 # 80008000 <rodata_start>
    8000310c:	00f9f9b3          	and	s3,s3,a5
    80003110:	0334f863          	bgeu	s1,s3,80003140 <kvminit+0xe0>
    80003114:	00001a37          	lui	s4,0x1
    80003118:	0080006f          	j	80003120 <kvminit+0xc0>
    8000311c:	0334f063          	bgeu	s1,s3,8000313c <kvminit+0xdc>
    80003120:	00048613          	mv	a2,s1
    80003124:	00048593          	mv	a1,s1
    80003128:	00200693          	li	a3,2
    8000312c:	00040513          	mv	a0,s0
    80003130:	d74ff0ef          	jal	800026a4 <map_page>
    80003134:	014484b3          	add	s1,s1,s4
    80003138:	fe0502e3          	beqz	a0,8000311c <kvminit+0xbc>
    8000313c:	00093403          	ld	s0,0(s2)
    80003140:	0000a997          	auipc	s3,0xa
    80003144:	ec398993          	add	s3,s3,-317 # 8000d003 <data_end+0xfff>
    80003148:	fffff7b7          	lui	a5,0xfffff
    8000314c:	00009497          	auipc	s1,0x9
    80003150:	eb448493          	add	s1,s1,-332 # 8000c000 <next_pid>
    80003154:	00f9f9b3          	and	s3,s3,a5
    80003158:	0334f863          	bgeu	s1,s3,80003188 <kvminit+0x128>
    8000315c:	00001a37          	lui	s4,0x1
    80003160:	0080006f          	j	80003168 <kvminit+0x108>
    80003164:	0334f063          	bgeu	s1,s3,80003184 <kvminit+0x124>
    80003168:	00048613          	mv	a2,s1
    8000316c:	00048593          	mv	a1,s1
    80003170:	00600693          	li	a3,6
    80003174:	00040513          	mv	a0,s0
    80003178:	d2cff0ef          	jal	800026a4 <map_page>
    8000317c:	014484b3          	add	s1,s1,s4
    80003180:	fe0502e3          	beqz	a0,80003164 <kvminit+0x104>
    80003184:	00093403          	ld	s0,0(s2)
    80003188:	00416997          	auipc	s3,0x416
    8000318c:	07f98993          	add	s3,s3,127 # 80419207 <bss_end+0xfff>
    80003190:	fffff7b7          	lui	a5,0xfffff
    80003194:	0000d497          	auipc	s1,0xd
    80003198:	e6c48493          	add	s1,s1,-404 # 80010000 <bss_start>
    8000319c:	00f9f9b3          	and	s3,s3,a5
    800031a0:	0334f863          	bgeu	s1,s3,800031d0 <kvminit+0x170>
    800031a4:	00001a37          	lui	s4,0x1
    800031a8:	0080006f          	j	800031b0 <kvminit+0x150>
    800031ac:	0334f063          	bgeu	s1,s3,800031cc <kvminit+0x16c>
    800031b0:	00048613          	mv	a2,s1
    800031b4:	00048593          	mv	a1,s1
    800031b8:	00600693          	li	a3,6
    800031bc:	00040513          	mv	a0,s0
    800031c0:	ce4ff0ef          	jal	800026a4 <map_page>
    800031c4:	014484b3          	add	s1,s1,s4
    800031c8:	fe0502e3          	beqz	a0,800031ac <kvminit+0x14c>
    800031cc:	00093403          	ld	s0,0(s2)
    800031d0:	01100993          	li	s3,17
    800031d4:	00415497          	auipc	s1,0x415
    800031d8:	03448493          	add	s1,s1,52 # 80418208 <bss_end>
    800031dc:	01b99993          	sll	s3,s3,0x1b
    800031e0:	0334f863          	bgeu	s1,s3,80003210 <kvminit+0x1b0>
    800031e4:	00001a37          	lui	s4,0x1
    800031e8:	0080006f          	j	800031f0 <kvminit+0x190>
    800031ec:	0334f063          	bgeu	s1,s3,8000320c <kvminit+0x1ac>
    800031f0:	00048613          	mv	a2,s1
    800031f4:	00048593          	mv	a1,s1
    800031f8:	00600693          	li	a3,6
    800031fc:	00040513          	mv	a0,s0
    80003200:	ca4ff0ef          	jal	800026a4 <map_page>
    80003204:	014484b3          	add	s1,s1,s4
    80003208:	fe0502e3          	beqz	a0,800031ec <kvminit+0x18c>
    8000320c:	00093403          	ld	s0,0(s2)
    80003210:	00040513          	mv	a0,s0
    80003214:	02013403          	ld	s0,32(sp)
    80003218:	02813083          	ld	ra,40(sp)
    8000321c:	01813483          	ld	s1,24(sp)
    80003220:	01013903          	ld	s2,16(sp)
    80003224:	00813983          	ld	s3,8(sp)
    80003228:	00013a03          	ld	s4,0(sp)
    8000322c:	00600693          	li	a3,6
    80003230:	10000637          	lui	a2,0x10000
    80003234:	100005b7          	lui	a1,0x10000
    80003238:	03010113          	add	sp,sp,48
    8000323c:	c68ff06f          	j	800026a4 <map_page>
    80003240:	02813083          	ld	ra,40(sp)
    80003244:	02013403          	ld	s0,32(sp)
    80003248:	00415797          	auipc	a5,0x415
    8000324c:	f807b023          	sd	zero,-128(a5) # 804181c8 <kernel_pagetable>
    80003250:	01813483          	ld	s1,24(sp)
    80003254:	01013903          	ld	s2,16(sp)
    80003258:	00813983          	ld	s3,8(sp)
    8000325c:	00013a03          	ld	s4,0(sp)
    80003260:	03010113          	add	sp,sp,48
    80003264:	00008067          	ret

0000000080003268 <alloc_swap_slot>:
    80003268:	0000e617          	auipc	a2,0xe
    8000326c:	d9860613          	add	a2,a2,-616 # 80011000 <swap_mgr>
    80003270:	08862803          	lw	a6,136(a2)
    80003274:	08462883          	lw	a7,132(a2)
    80003278:	fff00513          	li	a0,-1
    8000327c:	0d187663          	bgeu	a6,a7,80003348 <alloc_swap_slot+0xe0>
    80003280:	08062303          	lw	t1,128(a2)
    80003284:	07137863          	bgeu	t1,a7,800032f4 <alloc_swap_slot+0x8c>
    80003288:	0053579b          	srlw	a5,t1,0x5
    8000328c:	00279793          	sll	a5,a5,0x2
    80003290:	00f607b3          	add	a5,a2,a5
    80003294:	0007a683          	lw	a3,0(a5)
    80003298:	00100593          	li	a1,1
    8000329c:	006595bb          	sllw	a1,a1,t1
    800032a0:	00b6f7b3          	and	a5,a3,a1
    800032a4:	0007879b          	sext.w	a5,a5
    800032a8:	0053571b          	srlw	a4,t1,0x5
    800032ac:	00030513          	mv	a0,t1
    800032b0:	08078e63          	beqz	a5,8000334c <alloc_swap_slot+0xe4>
    800032b4:	00100e13          	li	t3,1
    800032b8:	01c0006f          	j	800032d4 <alloc_swap_slot+0x6c>
    800032bc:	0006a683          	lw	a3,0(a3)
    800032c0:	0007859b          	sext.w	a1,a5
    800032c4:	0057571b          	srlw	a4,a4,0x5
    800032c8:	00f6f7b3          	and	a5,a3,a5
    800032cc:	0007879b          	sext.w	a5,a5
    800032d0:	06078e63          	beqz	a5,8000334c <alloc_swap_slot+0xe4>
    800032d4:	0015071b          	addw	a4,a0,1
    800032d8:	0057579b          	srlw	a5,a4,0x5
    800032dc:	00279793          	sll	a5,a5,0x2
    800032e0:	0007051b          	sext.w	a0,a4
    800032e4:	00f606b3          	add	a3,a2,a5
    800032e8:	00ee17bb          	sllw	a5,t3,a4
    800032ec:	fca898e3          	bne	a7,a0,800032bc <alloc_swap_slot+0x54>
    800032f0:	04030a63          	beqz	t1,80003344 <alloc_swap_slot+0xdc>
    800032f4:	00062683          	lw	a3,0(a2)
    800032f8:	0016f513          	and	a0,a3,1
    800032fc:	0a050063          	beqz	a0,8000339c <alloc_swap_slot+0x134>
    80003300:	00000513          	li	a0,0
    80003304:	00100e13          	li	t3,1
    80003308:	01c0006f          	j	80003324 <alloc_swap_slot+0xbc>
    8000330c:	0006a683          	lw	a3,0(a3)
    80003310:	00078e9b          	sext.w	t4,a5
    80003314:	0057571b          	srlw	a4,a4,0x5
    80003318:	00f6f7b3          	and	a5,a3,a5
    8000331c:	0007879b          	sext.w	a5,a5
    80003320:	04078a63          	beqz	a5,80003374 <alloc_swap_slot+0x10c>
    80003324:	0015071b          	addw	a4,a0,1
    80003328:	0057579b          	srlw	a5,a4,0x5
    8000332c:	00279793          	sll	a5,a5,0x2
    80003330:	0005059b          	sext.w	a1,a0
    80003334:	0007051b          	sext.w	a0,a4
    80003338:	00f606b3          	add	a3,a2,a5
    8000333c:	00ee17bb          	sllw	a5,t3,a4
    80003340:	fca316e3          	bne	t1,a0,8000330c <alloc_swap_slot+0xa4>
    80003344:	fff00513          	li	a0,-1
    80003348:	00008067          	ret
    8000334c:	0015079b          	addw	a5,a0,1
    80003350:	0317f7bb          	remuw	a5,a5,a7
    80003354:	00271713          	sll	a4,a4,0x2
    80003358:	00e60733          	add	a4,a2,a4
    8000335c:	00b6e6b3          	or	a3,a3,a1
    80003360:	0018081b          	addw	a6,a6,1
    80003364:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    80003368:	09062423          	sw	a6,136(a2)
    8000336c:	08f62023          	sw	a5,128(a2)
    80003370:	00008067          	ret
    80003374:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    80003378:	0315f5bb          	remuw	a1,a1,a7
    8000337c:	00271713          	sll	a4,a4,0x2
    80003380:	00e60733          	add	a4,a2,a4
    80003384:	01d6e6b3          	or	a3,a3,t4
    80003388:	0018081b          	addw	a6,a6,1
    8000338c:	00d72023          	sw	a3,0(a4)
    80003390:	09062423          	sw	a6,136(a2)
    80003394:	08b62023          	sw	a1,128(a2)
    80003398:	00008067          	ret
    8000339c:	00000713          	li	a4,0
    800033a0:	00100593          	li	a1,1
    800033a4:	00100e93          	li	t4,1
    800033a8:	fd1ff06f          	j	80003378 <alloc_swap_slot+0x110>

00000000800033ac <free_swap_slot>:
    800033ac:	0000e717          	auipc	a4,0xe
    800033b0:	c5470713          	add	a4,a4,-940 # 80011000 <swap_mgr>
    800033b4:	08472783          	lw	a5,132(a4)
    800033b8:	04f57663          	bgeu	a0,a5,80003404 <free_swap_slot+0x58>
    800033bc:	0055579b          	srlw	a5,a0,0x5
    800033c0:	00279793          	sll	a5,a5,0x2
    800033c4:	00f707b3          	add	a5,a4,a5
    800033c8:	0007a583          	lw	a1,0(a5)
    800033cc:	00100693          	li	a3,1
    800033d0:	00a696bb          	sllw	a3,a3,a0
    800033d4:	00d5f633          	and	a2,a1,a3
    800033d8:	0006061b          	sext.w	a2,a2
    800033dc:	02060463          	beqz	a2,80003404 <free_swap_slot+0x58>
    800033e0:	08872603          	lw	a2,136(a4)
    800033e4:	fff6c693          	not	a3,a3
    800033e8:	08072803          	lw	a6,128(a4)
    800033ec:	00d5f5b3          	and	a1,a1,a3
    800033f0:	fff6069b          	addw	a3,a2,-1
    800033f4:	00b7a023          	sw	a1,0(a5)
    800033f8:	08d72423          	sw	a3,136(a4)
    800033fc:	01057463          	bgeu	a0,a6,80003404 <free_swap_slot+0x58>
    80003400:	08a72023          	sw	a0,128(a4)
    80003404:	00008067          	ret

0000000080003408 <find_page_desc>:
    80003408:	fffff7b7          	lui	a5,0xfffff
    8000340c:	00f57533          	and	a0,a0,a5
    80003410:	00000713          	li	a4,0
    80003414:	0040e797          	auipc	a5,0x40e
    80003418:	c8c78793          	add	a5,a5,-884 # 804110a0 <lru_mgr+0x10>
    8000341c:	10000613          	li	a2,256
    80003420:	0100006f          	j	80003430 <find_page_desc+0x28>
    80003424:	0017071b          	addw	a4,a4,1
    80003428:	03078793          	add	a5,a5,48
    8000342c:	02c70a63          	beq	a4,a2,80003460 <find_page_desc+0x58>
    80003430:	0007b683          	ld	a3,0(a5)
    80003434:	fea698e3          	bne	a3,a0,80003424 <find_page_desc+0x1c>
    80003438:	0147a683          	lw	a3,20(a5)
    8000343c:	0016f693          	and	a3,a3,1
    80003440:	fe0682e3          	beqz	a3,80003424 <find_page_desc+0x1c>
    80003444:	00171513          	sll	a0,a4,0x1
    80003448:	00e50533          	add	a0,a0,a4
    8000344c:	0040e797          	auipc	a5,0x40e
    80003450:	c5478793          	add	a5,a5,-940 # 804110a0 <lru_mgr+0x10>
    80003454:	00451513          	sll	a0,a0,0x4
    80003458:	00f50533          	add	a0,a0,a5
    8000345c:	00008067          	ret
    80003460:	00000513          	li	a0,0
    80003464:	00008067          	ret

0000000080003468 <lru_add_page>:
    80003468:	02050c63          	beqz	a0,800034a0 <lru_add_page+0x38>
    8000346c:	0040e717          	auipc	a4,0x40e
    80003470:	c2470713          	add	a4,a4,-988 # 80411090 <lru_mgr>
    80003474:	00073783          	ld	a5,0(a4)
    80003478:	00053c23          	sd	zero,24(a0)
    8000347c:	02f53023          	sd	a5,32(a0)
    80003480:	02078263          	beqz	a5,800034a4 <lru_add_page+0x3c>
    80003484:	00a7bc23          	sd	a0,24(a5)
    80003488:	00411697          	auipc	a3,0x411
    8000348c:	c0868693          	add	a3,a3,-1016 # 80414090 <lru_mgr+0x3000>
    80003490:	0106a783          	lw	a5,16(a3)
    80003494:	00a73023          	sd	a0,0(a4)
    80003498:	0017879b          	addw	a5,a5,1
    8000349c:	00f6a823          	sw	a5,16(a3)
    800034a0:	00008067          	ret
    800034a4:	00a73423          	sd	a0,8(a4)
    800034a8:	fe1ff06f          	j	80003488 <lru_add_page+0x20>

00000000800034ac <lru_remove_page>:
    800034ac:	02050c63          	beqz	a0,800034e4 <lru_remove_page+0x38>
    800034b0:	01853783          	ld	a5,24(a0)
    800034b4:	02053703          	ld	a4,32(a0)
    800034b8:	02078863          	beqz	a5,800034e8 <lru_remove_page+0x3c>
    800034bc:	02e7b023          	sd	a4,32(a5)
    800034c0:	02070a63          	beqz	a4,800034f4 <lru_remove_page+0x48>
    800034c4:	00f73c23          	sd	a5,24(a4)
    800034c8:	00411717          	auipc	a4,0x411
    800034cc:	bc870713          	add	a4,a4,-1080 # 80414090 <lru_mgr+0x3000>
    800034d0:	01072783          	lw	a5,16(a4)
    800034d4:	02053023          	sd	zero,32(a0)
    800034d8:	00053c23          	sd	zero,24(a0)
    800034dc:	fff7879b          	addw	a5,a5,-1
    800034e0:	00f72823          	sw	a5,16(a4)
    800034e4:	00008067          	ret
    800034e8:	0040e697          	auipc	a3,0x40e
    800034ec:	bae6b423          	sd	a4,-1112(a3) # 80411090 <lru_mgr>
    800034f0:	fc071ae3          	bnez	a4,800034c4 <lru_remove_page+0x18>
    800034f4:	0040e717          	auipc	a4,0x40e
    800034f8:	baf73223          	sd	a5,-1116(a4) # 80411098 <lru_mgr+0x8>
    800034fc:	fcdff06f          	j	800034c8 <lru_remove_page+0x1c>

0000000080003500 <lru_touch_page>:
    80003500:	fffff7b7          	lui	a5,0xfffff
    80003504:	00f57533          	and	a0,a0,a5
    80003508:	00000713          	li	a4,0
    8000350c:	0040e797          	auipc	a5,0x40e
    80003510:	b9478793          	add	a5,a5,-1132 # 804110a0 <lru_mgr+0x10>
    80003514:	10000613          	li	a2,256
    80003518:	0100006f          	j	80003528 <lru_touch_page+0x28>
    8000351c:	0017071b          	addw	a4,a4,1
    80003520:	03078793          	add	a5,a5,48
    80003524:	0ac70663          	beq	a4,a2,800035d0 <lru_touch_page+0xd0>
    80003528:	0007b683          	ld	a3,0(a5)
    8000352c:	fea698e3          	bne	a3,a0,8000351c <lru_touch_page+0x1c>
    80003530:	0147a683          	lw	a3,20(a5)
    80003534:	0016f693          	and	a3,a3,1
    80003538:	fe0682e3          	beqz	a3,8000351c <lru_touch_page+0x1c>
    8000353c:	00171613          	sll	a2,a4,0x1
    80003540:	00e607b3          	add	a5,a2,a4
    80003544:	0040e597          	auipc	a1,0x40e
    80003548:	b4c58593          	add	a1,a1,-1204 # 80411090 <lru_mgr>
    8000354c:	00479793          	sll	a5,a5,0x4
    80003550:	00170513          	add	a0,a4,1
    80003554:	00f58833          	add	a6,a1,a5
    80003558:	00151693          	sll	a3,a0,0x1
    8000355c:	00a686b3          	add	a3,a3,a0
    80003560:	02883803          	ld	a6,40(a6)
    80003564:	00469693          	sll	a3,a3,0x4
    80003568:	01078793          	add	a5,a5,16
    8000356c:	00d586b3          	add	a3,a1,a3
    80003570:	0006b683          	ld	a3,0(a3)
    80003574:	00f587b3          	add	a5,a1,a5
    80003578:	04080e63          	beqz	a6,800035d4 <lru_touch_page+0xd4>
    8000357c:	02d83023          	sd	a3,32(a6)
    80003580:	0005b883          	ld	a7,0(a1)
    80003584:	04068c63          	beqz	a3,800035dc <lru_touch_page+0xdc>
    80003588:	0106bc23          	sd	a6,24(a3)
    8000358c:	00151693          	sll	a3,a0,0x1
    80003590:	00e60733          	add	a4,a2,a4
    80003594:	00a686b3          	add	a3,a3,a0
    80003598:	00469693          	sll	a3,a3,0x4
    8000359c:	00471713          	sll	a4,a4,0x4
    800035a0:	00e58733          	add	a4,a1,a4
    800035a4:	00d586b3          	add	a3,a1,a3
    800035a8:	00411617          	auipc	a2,0x411
    800035ac:	ae860613          	add	a2,a2,-1304 # 80414090 <lru_mgr+0x3000>
    800035b0:	02073423          	sd	zero,40(a4)
    800035b4:	0116b023          	sd	a7,0(a3)
    800035b8:	01062703          	lw	a4,16(a2)
    800035bc:	02088463          	beqz	a7,800035e4 <lru_touch_page+0xe4>
    800035c0:	00f8bc23          	sd	a5,24(a7)
    800035c4:	00f5b023          	sd	a5,0(a1)
    800035c8:	00e62823          	sw	a4,16(a2)
    800035cc:	00008067          	ret
    800035d0:	00008067          	ret
    800035d4:	00068893          	mv	a7,a3
    800035d8:	fa0698e3          	bnez	a3,80003588 <lru_touch_page+0x88>
    800035dc:	0105b423          	sd	a6,8(a1)
    800035e0:	fadff06f          	j	8000358c <lru_touch_page+0x8c>
    800035e4:	00f5b423          	sd	a5,8(a1)
    800035e8:	00f5b023          	sd	a5,0(a1)
    800035ec:	00e62823          	sw	a4,16(a2)
    800035f0:	00008067          	ret

00000000800035f4 <find_victim_page>:
    800035f4:	0040e517          	auipc	a0,0x40e
    800035f8:	aa453503          	ld	a0,-1372(a0) # 80411098 <lru_mgr+0x8>
    800035fc:	00008067          	ret

0000000080003600 <swap_out_page>:
    80003600:	16050263          	beqz	a0,80003764 <swap_out_page+0x164>
    80003604:	fd010113          	add	sp,sp,-48
    80003608:	00913c23          	sd	s1,24(sp)
    8000360c:	01452483          	lw	s1,20(a0)
    80003610:	02813023          	sd	s0,32(sp)
    80003614:	01313423          	sd	s3,8(sp)
    80003618:	02113423          	sd	ra,40(sp)
    8000361c:	01213823          	sd	s2,16(sp)
    80003620:	0014f793          	and	a5,s1,1
    80003624:	00050413          	mv	s0,a0
    80003628:	00048993          	mv	s3,s1
    8000362c:	12078863          	beqz	a5,8000375c <swap_out_page+0x15c>
    80003630:	c39ff0ef          	jal	80003268 <alloc_swap_slot>
    80003634:	0005091b          	sext.w	s2,a0
    80003638:	fff00793          	li	a5,-1
    8000363c:	12f90063          	beq	s2,a5,8000375c <swap_out_page+0x15c>
    80003640:	0049f993          	and	s3,s3,4
    80003644:	04098663          	beqz	s3,80003690 <swap_out_page+0x90>
    80003648:	00843683          	ld	a3,8(s0)
    8000364c:	00c9171b          	sllw	a4,s2,0xc
    80003650:	0000e797          	auipc	a5,0xe
    80003654:	a4078793          	add	a5,a5,-1472 # 80011090 <swap_area>
    80003658:	02071713          	sll	a4,a4,0x20
    8000365c:	02075713          	srl	a4,a4,0x20
    80003660:	40f686b3          	sub	a3,a3,a5
    80003664:	0000f617          	auipc	a2,0xf
    80003668:	a2c60613          	add	a2,a2,-1492 # 80012090 <swap_area+0x1000>
    8000366c:	00f707b3          	add	a5,a4,a5
    80003670:	00e60633          	add	a2,a2,a4
    80003674:	40e686b3          	sub	a3,a3,a4
    80003678:	00f68733          	add	a4,a3,a5
    8000367c:	00074703          	lbu	a4,0(a4)
    80003680:	00178793          	add	a5,a5,1
    80003684:	fee78fa3          	sb	a4,-1(a5)
    80003688:	fec798e3          	bne	a5,a2,80003678 <swap_out_page+0x78>
    8000368c:	01442483          	lw	s1,20(s0)
    80003690:	00043583          	ld	a1,0(s0)
    80003694:	02843503          	ld	a0,40(s0)
    80003698:	f11fe0ef          	jal	800025a8 <walk_lookup>
    8000369c:	00050863          	beqz	a0,800036ac <swap_out_page+0xac>
    800036a0:	00053783          	ld	a5,0(a0)
    800036a4:	0017f713          	and	a4,a5,1
    800036a8:	08071063          	bnez	a4,80003728 <swap_out_page+0x128>
    800036ac:	ffe4f793          	and	a5,s1,-2
    800036b0:	0027e793          	or	a5,a5,2
    800036b4:	02091913          	sll	s2,s2,0x20
    800036b8:	02079793          	sll	a5,a5,0x20
    800036bc:	00843503          	ld	a0,8(s0)
    800036c0:	02095913          	srl	s2,s2,0x20
    800036c4:	00f96933          	or	s2,s2,a5
    800036c8:	01243823          	sd	s2,16(s0)
    800036cc:	df5fe0ef          	jal	800024c0 <free_page>
    800036d0:	01843783          	ld	a5,24(s0)
    800036d4:	00043423          	sd	zero,8(s0)
    800036d8:	02043703          	ld	a4,32(s0)
    800036dc:	06078463          	beqz	a5,80003744 <swap_out_page+0x144>
    800036e0:	02e7b023          	sd	a4,32(a5)
    800036e4:	06070663          	beqz	a4,80003750 <swap_out_page+0x150>
    800036e8:	00f73c23          	sd	a5,24(a4)
    800036ec:	00411717          	auipc	a4,0x411
    800036f0:	9a470713          	add	a4,a4,-1628 # 80414090 <lru_mgr+0x3000>
    800036f4:	01072783          	lw	a5,16(a4)
    800036f8:	02043023          	sd	zero,32(s0)
    800036fc:	00043c23          	sd	zero,24(s0)
    80003700:	fff7879b          	addw	a5,a5,-1
    80003704:	00f72823          	sw	a5,16(a4)
    80003708:	00000513          	li	a0,0
    8000370c:	02813083          	ld	ra,40(sp)
    80003710:	02013403          	ld	s0,32(sp)
    80003714:	01813483          	ld	s1,24(sp)
    80003718:	01013903          	ld	s2,16(sp)
    8000371c:	00813983          	ld	s3,8(sp)
    80003720:	03010113          	add	sp,sp,48
    80003724:	00008067          	ret
    80003728:	00a9171b          	sllw	a4,s2,0xa
    8000372c:	02071713          	sll	a4,a4,0x20
    80003730:	ffe7f793          	and	a5,a5,-2
    80003734:	02075713          	srl	a4,a4,0x20
    80003738:	00e7e7b3          	or	a5,a5,a4
    8000373c:	00f53023          	sd	a5,0(a0)
    80003740:	f6dff06f          	j	800036ac <swap_out_page+0xac>
    80003744:	0040e697          	auipc	a3,0x40e
    80003748:	94e6b623          	sd	a4,-1716(a3) # 80411090 <lru_mgr>
    8000374c:	f8071ee3          	bnez	a4,800036e8 <swap_out_page+0xe8>
    80003750:	0040e717          	auipc	a4,0x40e
    80003754:	94f73423          	sd	a5,-1720(a4) # 80411098 <lru_mgr+0x8>
    80003758:	f95ff06f          	j	800036ec <swap_out_page+0xec>
    8000375c:	fff00513          	li	a0,-1
    80003760:	fadff06f          	j	8000370c <swap_out_page+0x10c>
    80003764:	fff00513          	li	a0,-1
    80003768:	00008067          	ret

000000008000376c <swap_in_page>:
    8000376c:	12050263          	beqz	a0,80003890 <swap_in_page+0x124>
    80003770:	01452783          	lw	a5,20(a0)
    80003774:	fe010113          	add	sp,sp,-32
    80003778:	00813823          	sd	s0,16(sp)
    8000377c:	00113c23          	sd	ra,24(sp)
    80003780:	00913423          	sd	s1,8(sp)
    80003784:	0027f793          	and	a5,a5,2
    80003788:	00050413          	mv	s0,a0
    8000378c:	0e078e63          	beqz	a5,80003888 <swap_in_page+0x11c>
    80003790:	01052703          	lw	a4,16(a0)
    80003794:	0000e797          	auipc	a5,0xe
    80003798:	8fc78793          	add	a5,a5,-1796 # 80011090 <swap_area>
    8000379c:	40f58633          	sub	a2,a1,a5
    800037a0:	00c7171b          	sllw	a4,a4,0xc
    800037a4:	02071713          	sll	a4,a4,0x20
    800037a8:	02075713          	srl	a4,a4,0x20
    800037ac:	0000f817          	auipc	a6,0xf
    800037b0:	8e480813          	add	a6,a6,-1820 # 80012090 <swap_area+0x1000>
    800037b4:	00058493          	mv	s1,a1
    800037b8:	00f707b3          	add	a5,a4,a5
    800037bc:	00e80833          	add	a6,a6,a4
    800037c0:	40e60633          	sub	a2,a2,a4
    800037c4:	0007c683          	lbu	a3,0(a5)
    800037c8:	00f60733          	add	a4,a2,a5
    800037cc:	00178793          	add	a5,a5,1
    800037d0:	00d70023          	sb	a3,0(a4)
    800037d4:	ff0798e3          	bne	a5,a6,800037c4 <swap_in_page+0x58>
    800037d8:	00043583          	ld	a1,0(s0)
    800037dc:	02843503          	ld	a0,40(s0)
    800037e0:	dc9fe0ef          	jal	800025a8 <walk_lookup>
    800037e4:	02050063          	beqz	a0,80003804 <swap_in_page+0x98>
    800037e8:	00053703          	ld	a4,0(a0)
    800037ec:	00c4d793          	srl	a5,s1,0xc
    800037f0:	00a79793          	sll	a5,a5,0xa
    800037f4:	01e77713          	and	a4,a4,30
    800037f8:	00e7e7b3          	or	a5,a5,a4
    800037fc:	0017e793          	or	a5,a5,1
    80003800:	00f53023          	sd	a5,0(a0)
    80003804:	01442783          	lw	a5,20(s0)
    80003808:	01042503          	lw	a0,16(s0)
    8000380c:	00943423          	sd	s1,8(s0)
    80003810:	ffd7f793          	and	a5,a5,-3
    80003814:	0017e793          	or	a5,a5,1
    80003818:	00f42a23          	sw	a5,20(s0)
    8000381c:	0000e797          	auipc	a5,0xe
    80003820:	8687a783          	lw	a5,-1944(a5) # 80011084 <swap_mgr+0x84>
    80003824:	00f57463          	bgeu	a0,a5,8000382c <swap_in_page+0xc0>
    80003828:	df5fe0ef          	jal	8000261c <free_swap_slot.part.0>
    8000382c:	0040e717          	auipc	a4,0x40e
    80003830:	86470713          	add	a4,a4,-1948 # 80411090 <lru_mgr>
    80003834:	00073783          	ld	a5,0(a4)
    80003838:	fff00693          	li	a3,-1
    8000383c:	00d42823          	sw	a3,16(s0)
    80003840:	02f43023          	sd	a5,32(s0)
    80003844:	00043c23          	sd	zero,24(s0)
    80003848:	02078c63          	beqz	a5,80003880 <swap_in_page+0x114>
    8000384c:	0087bc23          	sd	s0,24(a5)
    80003850:	00411697          	auipc	a3,0x411
    80003854:	84068693          	add	a3,a3,-1984 # 80414090 <lru_mgr+0x3000>
    80003858:	0106a783          	lw	a5,16(a3)
    8000385c:	00873023          	sd	s0,0(a4)
    80003860:	00000513          	li	a0,0
    80003864:	0017879b          	addw	a5,a5,1
    80003868:	00f6a823          	sw	a5,16(a3)
    8000386c:	01813083          	ld	ra,24(sp)
    80003870:	01013403          	ld	s0,16(sp)
    80003874:	00813483          	ld	s1,8(sp)
    80003878:	02010113          	add	sp,sp,32
    8000387c:	00008067          	ret
    80003880:	00873423          	sd	s0,8(a4)
    80003884:	fcdff06f          	j	80003850 <swap_in_page+0xe4>
    80003888:	fff00513          	li	a0,-1
    8000388c:	fe1ff06f          	j	8000386c <swap_in_page+0x100>
    80003890:	fff00513          	li	a0,-1
    80003894:	00008067          	ret

0000000080003898 <handle_page_fault>:
    80003898:	fd010113          	add	sp,sp,-48
    8000389c:	fffff7b7          	lui	a5,0xfffff
    800038a0:	02813023          	sd	s0,32(sp)
    800038a4:	00f5f433          	and	s0,a1,a5
    800038a8:	00040593          	mv	a1,s0
    800038ac:	01213823          	sd	s2,16(sp)
    800038b0:	02113423          	sd	ra,40(sp)
    800038b4:	00913c23          	sd	s1,24(sp)
    800038b8:	01313423          	sd	s3,8(sp)
    800038bc:	00050913          	mv	s2,a0
    800038c0:	ce9fe0ef          	jal	800025a8 <walk_lookup>
    800038c4:	12050c63          	beqz	a0,800039fc <handle_page_fault+0x164>
    800038c8:	00053483          	ld	s1,0(a0)
    800038cc:	0014f793          	and	a5,s1,1
    800038d0:	12079663          	bnez	a5,800039fc <handle_page_fault+0x164>
    800038d4:	12048463          	beqz	s1,800039fc <handle_page_fault+0x164>
    800038d8:	00a4d493          	srl	s1,s1,0xa
    800038dc:	bc9fe0ef          	jal	800024a4 <alloc_page>
    800038e0:	0004849b          	sext.w	s1,s1
    800038e4:	00050993          	mv	s3,a0
    800038e8:	0e050a63          	beqz	a0,800039dc <handle_page_fault+0x144>
    800038ec:	0040d797          	auipc	a5,0x40d
    800038f0:	7b478793          	add	a5,a5,1972 # 804110a0 <lru_mgr+0x10>
    800038f4:	00000713          	li	a4,0
    800038f8:	10000613          	li	a2,256
    800038fc:	0100006f          	j	8000390c <handle_page_fault+0x74>
    80003900:	0017071b          	addw	a4,a4,1
    80003904:	03078793          	add	a5,a5,48
    80003908:	06c70063          	beq	a4,a2,80003968 <handle_page_fault+0xd0>
    8000390c:	0007b683          	ld	a3,0(a5)
    80003910:	fe8698e3          	bne	a3,s0,80003900 <handle_page_fault+0x68>
    80003914:	0147a683          	lw	a3,20(a5)
    80003918:	0026f693          	and	a3,a3,2
    8000391c:	fe0682e3          	beqz	a3,80003900 <handle_page_fault+0x68>
    80003920:	0107a683          	lw	a3,16(a5)
    80003924:	fc969ee3          	bne	a3,s1,80003900 <handle_page_fault+0x68>
    80003928:	00171513          	sll	a0,a4,0x1
    8000392c:	00e50533          	add	a0,a0,a4
    80003930:	00451513          	sll	a0,a0,0x4
    80003934:	0040d797          	auipc	a5,0x40d
    80003938:	76c78793          	add	a5,a5,1900 # 804110a0 <lru_mgr+0x10>
    8000393c:	00f50533          	add	a0,a0,a5
    80003940:	00098593          	mv	a1,s3
    80003944:	e29ff0ef          	jal	8000376c <swap_in_page>
    80003948:	0a051e63          	bnez	a0,80003a04 <handle_page_fault+0x16c>
    8000394c:	02813083          	ld	ra,40(sp)
    80003950:	02013403          	ld	s0,32(sp)
    80003954:	01813483          	ld	s1,24(sp)
    80003958:	01013903          	ld	s2,16(sp)
    8000395c:	00813983          	ld	s3,8(sp)
    80003960:	03010113          	add	sp,sp,48
    80003964:	00008067          	ret
    80003968:	0040d717          	auipc	a4,0x40d
    8000396c:	74c70713          	add	a4,a4,1868 # 804110b4 <lru_mgr+0x24>
    80003970:	00000793          	li	a5,0
    80003974:	10000613          	li	a2,256
    80003978:	00c0006f          	j	80003984 <handle_page_fault+0xec>
    8000397c:	0017879b          	addw	a5,a5,1
    80003980:	08c78263          	beq	a5,a2,80003a04 <handle_page_fault+0x16c>
    80003984:	00072683          	lw	a3,0(a4)
    80003988:	03070713          	add	a4,a4,48
    8000398c:	fe0698e3          	bnez	a3,8000397c <handle_page_fault+0xe4>
    80003990:	00178613          	add	a2,a5,1
    80003994:	00179713          	sll	a4,a5,0x1
    80003998:	00161693          	sll	a3,a2,0x1
    8000399c:	00f707b3          	add	a5,a4,a5
    800039a0:	00479793          	sll	a5,a5,0x4
    800039a4:	00c68733          	add	a4,a3,a2
    800039a8:	0040d617          	auipc	a2,0x40d
    800039ac:	6e860613          	add	a2,a2,1768 # 80411090 <lru_mgr>
    800039b0:	00f606b3          	add	a3,a2,a5
    800039b4:	00471713          	sll	a4,a4,0x4
    800039b8:	01078793          	add	a5,a5,16
    800039bc:	00e60733          	add	a4,a2,a4
    800039c0:	00c78533          	add	a0,a5,a2
    800039c4:	00200793          	li	a5,2
    800039c8:	0086b823          	sd	s0,16(a3)
    800039cc:	01273423          	sd	s2,8(a4)
    800039d0:	0296a023          	sw	s1,32(a3)
    800039d4:	02f6a223          	sw	a5,36(a3)
    800039d8:	f69ff06f          	j	80003940 <handle_page_fault+0xa8>
    800039dc:	0040d517          	auipc	a0,0x40d
    800039e0:	6bc53503          	ld	a0,1724(a0) # 80411098 <lru_mgr+0x8>
    800039e4:	00050c63          	beqz	a0,800039fc <handle_page_fault+0x164>
    800039e8:	c19ff0ef          	jal	80003600 <swap_out_page>
    800039ec:	00051863          	bnez	a0,800039fc <handle_page_fault+0x164>
    800039f0:	ab5fe0ef          	jal	800024a4 <alloc_page>
    800039f4:	00050993          	mv	s3,a0
    800039f8:	ee051ae3          	bnez	a0,800038ec <handle_page_fault+0x54>
    800039fc:	fff00513          	li	a0,-1
    80003a00:	f4dff06f          	j	8000394c <handle_page_fault+0xb4>
    80003a04:	00098513          	mv	a0,s3
    80003a08:	ab9fe0ef          	jal	800024c0 <free_page>
    80003a0c:	fff00513          	li	a0,-1
    80003a10:	f3dff06f          	j	8000394c <handle_page_fault+0xb4>

0000000080003a14 <va2pa_with_replacement>:
    80003a14:	fe010113          	add	sp,sp,-32
    80003a18:	00913423          	sd	s1,8(sp)
    80003a1c:	01213023          	sd	s2,0(sp)
    80003a20:	00113c23          	sd	ra,24(sp)
    80003a24:	00813823          	sd	s0,16(sp)
    80003a28:	00050493          	mv	s1,a0
    80003a2c:	00058913          	mv	s2,a1
    80003a30:	b79fe0ef          	jal	800025a8 <walk_lookup>
    80003a34:	00050a63          	beqz	a0,80003a48 <va2pa_with_replacement+0x34>
    80003a38:	00053403          	ld	s0,0(a0)
    80003a3c:	00147793          	and	a5,s0,1
    80003a40:	06079663          	bnez	a5,80003aac <va2pa_with_replacement+0x98>
    80003a44:	02041063          	bnez	s0,80003a64 <va2pa_with_replacement+0x50>
    80003a48:	00000513          	li	a0,0
    80003a4c:	01813083          	ld	ra,24(sp)
    80003a50:	01013403          	ld	s0,16(sp)
    80003a54:	00813483          	ld	s1,8(sp)
    80003a58:	00013903          	ld	s2,0(sp)
    80003a5c:	02010113          	add	sp,sp,32
    80003a60:	00008067          	ret
    80003a64:	00600613          	li	a2,6
    80003a68:	00090593          	mv	a1,s2
    80003a6c:	00048513          	mv	a0,s1
    80003a70:	e29ff0ef          	jal	80003898 <handle_page_fault>
    80003a74:	fc051ae3          	bnez	a0,80003a48 <va2pa_with_replacement+0x34>
    80003a78:	00090593          	mv	a1,s2
    80003a7c:	00048513          	mv	a0,s1
    80003a80:	b29fe0ef          	jal	800025a8 <walk_lookup>
    80003a84:	fc0502e3          	beqz	a0,80003a48 <va2pa_with_replacement+0x34>
    80003a88:	00053783          	ld	a5,0(a0)
    80003a8c:	0017f713          	and	a4,a5,1
    80003a90:	fa070ce3          	beqz	a4,80003a48 <va2pa_with_replacement+0x34>
    80003a94:	00a7d793          	srl	a5,a5,0xa
    80003a98:	03491593          	sll	a1,s2,0x34
    80003a9c:	00c79513          	sll	a0,a5,0xc
    80003aa0:	0345d593          	srl	a1,a1,0x34
    80003aa4:	00b50533          	add	a0,a0,a1
    80003aa8:	fa5ff06f          	j	80003a4c <va2pa_with_replacement+0x38>
    80003aac:	00090513          	mv	a0,s2
    80003ab0:	a51ff0ef          	jal	80003500 <lru_touch_page>
    80003ab4:	01813083          	ld	ra,24(sp)
    80003ab8:	00a45513          	srl	a0,s0,0xa
    80003abc:	01013403          	ld	s0,16(sp)
    80003ac0:	03491593          	sll	a1,s2,0x34
    80003ac4:	00c51513          	sll	a0,a0,0xc
    80003ac8:	0345d593          	srl	a1,a1,0x34
    80003acc:	00813483          	ld	s1,8(sp)
    80003ad0:	00013903          	ld	s2,0(sp)
    80003ad4:	00b50533          	add	a0,a0,a1
    80003ad8:	02010113          	add	sp,sp,32
    80003adc:	00008067          	ret

0000000080003ae0 <safe_copyout>:
    80003ae0:	14068063          	beqz	a3,80003c20 <safe_copyout+0x140>
    80003ae4:	fb010113          	add	sp,sp,-80
    80003ae8:	02913c23          	sd	s1,56(sp)
    80003aec:	03213823          	sd	s2,48(sp)
    80003af0:	03313423          	sd	s3,40(sp)
    80003af4:	03413023          	sd	s4,32(sp)
    80003af8:	01513c23          	sd	s5,24(sp)
    80003afc:	01613823          	sd	s6,16(sp)
    80003b00:	01713423          	sd	s7,8(sp)
    80003b04:	01813023          	sd	s8,0(sp)
    80003b08:	04113423          	sd	ra,72(sp)
    80003b0c:	04813023          	sd	s0,64(sp)
    80003b10:	00068b13          	mv	s6,a3
    80003b14:	00050993          	mv	s3,a0
    80003b18:	00058c13          	mv	s8,a1
    80003b1c:	00060b93          	mv	s7,a2
    80003b20:	fffffa37          	lui	s4,0xfffff
    80003b24:	00001937          	lui	s2,0x1
    80003b28:	10000493          	li	s1,256
    80003b2c:	0040da97          	auipc	s5,0x40d
    80003b30:	564a8a93          	add	s5,s5,1380 # 80411090 <lru_mgr>
    80003b34:	014c7433          	and	s0,s8,s4
    80003b38:	00040593          	mv	a1,s0
    80003b3c:	00098513          	mv	a0,s3
    80003b40:	ed5ff0ef          	jal	80003a14 <va2pa_with_replacement>
    80003b44:	0c050a63          	beqz	a0,80003c18 <safe_copyout+0x138>
    80003b48:	41840833          	sub	a6,s0,s8
    80003b4c:	01280833          	add	a6,a6,s2
    80003b50:	010b7463          	bgeu	s6,a6,80003b58 <safe_copyout+0x78>
    80003b54:	000b0813          	mv	a6,s6
    80003b58:	01850733          	add	a4,a0,s8
    80003b5c:	40870733          	sub	a4,a4,s0
    80003b60:	01780533          	add	a0,a6,s7
    80003b64:	000b8793          	mv	a5,s7
    80003b68:	41770733          	sub	a4,a4,s7
    80003b6c:	0a080263          	beqz	a6,80003c10 <safe_copyout+0x130>
    80003b70:	0007c583          	lbu	a1,0(a5)
    80003b74:	00f70633          	add	a2,a4,a5
    80003b78:	00178793          	add	a5,a5,1
    80003b7c:	00b60023          	sb	a1,0(a2)
    80003b80:	fef518e3          	bne	a0,a5,80003b70 <safe_copyout+0x90>
    80003b84:	0040d797          	auipc	a5,0x40d
    80003b88:	51c78793          	add	a5,a5,1308 # 804110a0 <lru_mgr+0x10>
    80003b8c:	00000713          	li	a4,0
    80003b90:	0100006f          	j	80003ba0 <safe_copyout+0xc0>
    80003b94:	0017071b          	addw	a4,a4,1
    80003b98:	03078793          	add	a5,a5,48
    80003b9c:	02970863          	beq	a4,s1,80003bcc <safe_copyout+0xec>
    80003ba0:	0007b603          	ld	a2,0(a5)
    80003ba4:	fec418e3          	bne	s0,a2,80003b94 <safe_copyout+0xb4>
    80003ba8:	0147a603          	lw	a2,20(a5)
    80003bac:	00167593          	and	a1,a2,1
    80003bb0:	fe0582e3          	beqz	a1,80003b94 <safe_copyout+0xb4>
    80003bb4:	00171793          	sll	a5,a4,0x1
    80003bb8:	00e787b3          	add	a5,a5,a4
    80003bbc:	00479793          	sll	a5,a5,0x4
    80003bc0:	00fa87b3          	add	a5,s5,a5
    80003bc4:	00466613          	or	a2,a2,4
    80003bc8:	02c7a223          	sw	a2,36(a5)
    80003bcc:	410b0b33          	sub	s6,s6,a6
    80003bd0:	00050b93          	mv	s7,a0
    80003bd4:	01240c33          	add	s8,s0,s2
    80003bd8:	f40b1ee3          	bnez	s6,80003b34 <safe_copyout+0x54>
    80003bdc:	00000513          	li	a0,0
    80003be0:	04813083          	ld	ra,72(sp)
    80003be4:	04013403          	ld	s0,64(sp)
    80003be8:	03813483          	ld	s1,56(sp)
    80003bec:	03013903          	ld	s2,48(sp)
    80003bf0:	02813983          	ld	s3,40(sp)
    80003bf4:	02013a03          	ld	s4,32(sp)
    80003bf8:	01813a83          	ld	s5,24(sp)
    80003bfc:	01013b03          	ld	s6,16(sp)
    80003c00:	00813b83          	ld	s7,8(sp)
    80003c04:	00013c03          	ld	s8,0(sp)
    80003c08:	05010113          	add	sp,sp,80
    80003c0c:	00008067          	ret
    80003c10:	000b8513          	mv	a0,s7
    80003c14:	f71ff06f          	j	80003b84 <safe_copyout+0xa4>
    80003c18:	fff00513          	li	a0,-1
    80003c1c:	fc5ff06f          	j	80003be0 <safe_copyout+0x100>
    80003c20:	00000513          	li	a0,0
    80003c24:	00008067          	ret

0000000080003c28 <safe_copyin>:
    80003c28:	0e068863          	beqz	a3,80003d18 <safe_copyin+0xf0>
    80003c2c:	fc010113          	add	sp,sp,-64
    80003c30:	02813823          	sd	s0,48(sp)
    80003c34:	02913423          	sd	s1,40(sp)
    80003c38:	03213023          	sd	s2,32(sp)
    80003c3c:	01313c23          	sd	s3,24(sp)
    80003c40:	01513423          	sd	s5,8(sp)
    80003c44:	01613023          	sd	s6,0(sp)
    80003c48:	02113c23          	sd	ra,56(sp)
    80003c4c:	01413823          	sd	s4,16(sp)
    80003c50:	00068b13          	mv	s6,a3
    80003c54:	00050493          	mv	s1,a0
    80003c58:	00058993          	mv	s3,a1
    80003c5c:	00060a93          	mv	s5,a2
    80003c60:	fffff937          	lui	s2,0xfffff
    80003c64:	00001437          	lui	s0,0x1
    80003c68:	012afa33          	and	s4,s5,s2
    80003c6c:	000a0593          	mv	a1,s4
    80003c70:	00048513          	mv	a0,s1
    80003c74:	da1ff0ef          	jal	80003a14 <va2pa_with_replacement>
    80003c78:	08050c63          	beqz	a0,80003d10 <safe_copyin+0xe8>
    80003c7c:	415a08b3          	sub	a7,s4,s5
    80003c80:	008888b3          	add	a7,a7,s0
    80003c84:	011b7463          	bgeu	s6,a7,80003c8c <safe_copyin+0x64>
    80003c88:	000b0893          	mv	a7,s6
    80003c8c:	01550533          	add	a0,a0,s5
    80003c90:	41450533          	sub	a0,a0,s4
    80003c94:	06088063          	beqz	a7,80003cf4 <safe_copyin+0xcc>
    80003c98:	00098793          	mv	a5,s3
    80003c9c:	01198833          	add	a6,s3,a7
    80003ca0:	41350733          	sub	a4,a0,s3
    80003ca4:	00f70633          	add	a2,a4,a5
    80003ca8:	00064603          	lbu	a2,0(a2)
    80003cac:	00178793          	add	a5,a5,1
    80003cb0:	fec78fa3          	sb	a2,-1(a5)
    80003cb4:	fef818e3          	bne	a6,a5,80003ca4 <safe_copyin+0x7c>
    80003cb8:	411b0b33          	sub	s6,s6,a7
    80003cbc:	00080993          	mv	s3,a6
    80003cc0:	008a0ab3          	add	s5,s4,s0
    80003cc4:	fa0b12e3          	bnez	s6,80003c68 <safe_copyin+0x40>
    80003cc8:	00000513          	li	a0,0
    80003ccc:	03813083          	ld	ra,56(sp)
    80003cd0:	03013403          	ld	s0,48(sp)
    80003cd4:	02813483          	ld	s1,40(sp)
    80003cd8:	02013903          	ld	s2,32(sp)
    80003cdc:	01813983          	ld	s3,24(sp)
    80003ce0:	01013a03          	ld	s4,16(sp)
    80003ce4:	00813a83          	ld	s5,8(sp)
    80003ce8:	00013b03          	ld	s6,0(sp)
    80003cec:	04010113          	add	sp,sp,64
    80003cf0:	00008067          	ret
    80003cf4:	00001ab7          	lui	s5,0x1
    80003cf8:	015a0ab3          	add	s5,s4,s5
    80003cfc:	012afa33          	and	s4,s5,s2
    80003d00:	000a0593          	mv	a1,s4
    80003d04:	00048513          	mv	a0,s1
    80003d08:	d0dff0ef          	jal	80003a14 <va2pa_with_replacement>
    80003d0c:	f60518e3          	bnez	a0,80003c7c <safe_copyin+0x54>
    80003d10:	fff00513          	li	a0,-1
    80003d14:	fb9ff06f          	j	80003ccc <safe_copyin+0xa4>
    80003d18:	00000513          	li	a0,0
    80003d1c:	00008067          	ret

0000000080003d20 <test_page_replacement>:
    80003d20:	f4010113          	add	sp,sp,-192
    80003d24:	00006517          	auipc	a0,0x6
    80003d28:	47450513          	add	a0,a0,1140 # 8000a198 <digits+0x58>
    80003d2c:	0a113c23          	sd	ra,184(sp)
    80003d30:	0a813823          	sd	s0,176(sp)
    80003d34:	0a913423          	sd	s1,168(sp)
    80003d38:	0b213023          	sd	s2,160(sp)
    80003d3c:	09313c23          	sd	s3,152(sp)
    80003d40:	eb8fe0ef          	jal	800023f8 <uart_puts>
    80003d44:	00006517          	auipc	a0,0x6
    80003d48:	47c50513          	add	a0,a0,1148 # 8000a1c0 <digits+0x80>
    80003d4c:	eacfe0ef          	jal	800023f8 <uart_puts>
    80003d50:	d18ff0ef          	jal	80003268 <alloc_swap_slot>
    80003d54:	0005049b          	sext.w	s1,a0
    80003d58:	d10ff0ef          	jal	80003268 <alloc_swap_slot>
    80003d5c:	0005041b          	sext.w	s0,a0
    80003d60:	d08ff0ef          	jal	80003268 <alloc_swap_slot>
    80003d64:	fff00793          	li	a5,-1
    80003d68:	02f48663          	beq	s1,a5,80003d94 <test_page_replacement+0x74>
    80003d6c:	1cf40c63          	beq	s0,a5,80003f44 <test_page_replacement+0x224>
    80003d70:	0005051b          	sext.w	a0,a0
    80003d74:	02f50063          	beq	a0,a5,80003d94 <test_page_replacement+0x74>
    80003d78:	00848e63          	beq	s1,s0,80003d94 <test_page_replacement+0x74>
    80003d7c:	00a40c63          	beq	s0,a0,80003d94 <test_page_replacement+0x74>
    80003d80:	00a48a63          	beq	s1,a0,80003d94 <test_page_replacement+0x74>
    80003d84:	00006517          	auipc	a0,0x6
    80003d88:	46450513          	add	a0,a0,1124 # 8000a1e8 <digits+0xa8>
    80003d8c:	e6cfe0ef          	jal	800023f8 <uart_puts>
    80003d90:	0100006f          	j	80003da0 <test_page_replacement+0x80>
    80003d94:	00006517          	auipc	a0,0x6
    80003d98:	47450513          	add	a0,a0,1140 # 8000a208 <digits+0xc8>
    80003d9c:	e5cfe0ef          	jal	800023f8 <uart_puts>
    80003da0:	0000d797          	auipc	a5,0xd
    80003da4:	2e47a783          	lw	a5,740(a5) # 80011084 <swap_mgr+0x84>
    80003da8:	00f47663          	bgeu	s0,a5,80003db4 <test_page_replacement+0x94>
    80003dac:	00040513          	mv	a0,s0
    80003db0:	86dfe0ef          	jal	8000261c <free_swap_slot.part.0>
    80003db4:	cb4ff0ef          	jal	80003268 <alloc_swap_slot>
    80003db8:	0005051b          	sext.w	a0,a0
    80003dbc:	14a40c63          	beq	s0,a0,80003f14 <test_page_replacement+0x1f4>
    80003dc0:	00006517          	auipc	a0,0x6
    80003dc4:	49050513          	add	a0,a0,1168 # 8000a250 <digits+0x110>
    80003dc8:	e30fe0ef          	jal	800023f8 <uart_puts>
    80003dcc:	00006517          	auipc	a0,0x6
    80003dd0:	4ac50513          	add	a0,a0,1196 # 8000a278 <digits+0x138>
    80003dd4:	e24fe0ef          	jal	800023f8 <uart_puts>
    80003dd8:	00080737          	lui	a4,0x80
    80003ddc:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    80003de0:	00010637          	lui	a2,0x10
    80003de4:	00c71713          	sll	a4,a4,0xc
    80003de8:	fff00793          	li	a5,-1
    80003dec:	01f7d793          	srl	a5,a5,0x1f
    80003df0:	00c13023          	sd	a2,0(sp)
    80003df4:	02e13c23          	sd	a4,56(sp)
    80003df8:	00100613          	li	a2,1
    80003dfc:	00012737          	lui	a4,0x12
    80003e00:	01f61613          	sll	a2,a2,0x1f
    80003e04:	00f13823          	sd	a5,16(sp)
    80003e08:	04f13023          	sd	a5,64(sp)
    80003e0c:	06e13023          	sd	a4,96(sp)
    80003e10:	06f13823          	sd	a5,112(sp)
    80003e14:	40001737          	lui	a4,0x40001
    80003e18:	03010793          	add	a5,sp,48
    80003e1c:	00414697          	auipc	a3,0x414
    80003e20:	3ac6b683          	ld	a3,940(a3) # 804181c8 <kernel_pagetable>
    80003e24:	00171713          	sll	a4,a4,0x1
    80003e28:	0040d417          	auipc	s0,0x40d
    80003e2c:	26840413          	add	s0,s0,616 # 80411090 <lru_mgr>
    80003e30:	00010493          	mv	s1,sp
    80003e34:	06010993          	add	s3,sp,96
    80003e38:	00c13423          	sd	a2,8(sp)
    80003e3c:	00f13c23          	sd	a5,24(sp)
    80003e40:	00011637          	lui	a2,0x11
    80003e44:	08f13023          	sd	a5,128(sp)
    80003e48:	00410917          	auipc	s2,0x410
    80003e4c:	24890913          	add	s2,s2,584 # 80414090 <lru_mgr+0x3000>
    80003e50:	00300793          	li	a5,3
    80003e54:	00006517          	auipc	a0,0x6
    80003e58:	44450513          	add	a0,a0,1092 # 8000a298 <digits+0x158>
    80003e5c:	06e13423          	sd	a4,104(sp)
    80003e60:	00f92823          	sw	a5,16(s2)
    80003e64:	02013023          	sd	zero,32(sp)
    80003e68:	02d13423          	sd	a3,40(sp)
    80003e6c:	02c13823          	sd	a2,48(sp)
    80003e70:	04d13c23          	sd	a3,88(sp)
    80003e74:	06013c23          	sd	zero,120(sp)
    80003e78:	08d13423          	sd	a3,136(sp)
    80003e7c:	00943423          	sd	s1,8(s0)
    80003e80:	04913823          	sd	s1,80(sp)
    80003e84:	05313423          	sd	s3,72(sp)
    80003e88:	01343023          	sd	s3,0(s0)
    80003e8c:	d6cfe0ef          	jal	800023f8 <uart_puts>
    80003e90:	04813783          	ld	a5,72(sp)
    80003e94:	05013703          	ld	a4,80(sp)
    80003e98:	08078a63          	beqz	a5,80003f2c <test_page_replacement+0x20c>
    80003e9c:	02e7b023          	sd	a4,32(a5)
    80003ea0:	08070263          	beqz	a4,80003f24 <test_page_replacement+0x204>
    80003ea4:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    80003ea8:	01092783          	lw	a5,16(s2)
    80003eac:	04013823          	sd	zero,80(sp)
    80003eb0:	04013423          	sd	zero,72(sp)
    80003eb4:	fff7871b          	addw	a4,a5,-1
    80003eb8:	00e92823          	sw	a4,16(s2)
    80003ebc:	00200793          	li	a5,2
    80003ec0:	00f71663          	bne	a4,a5,80003ecc <test_page_replacement+0x1ac>
    80003ec4:	00043783          	ld	a5,0(s0)
    80003ec8:	09378663          	beq	a5,s3,80003f54 <test_page_replacement+0x234>
    80003ecc:	00006517          	auipc	a0,0x6
    80003ed0:	40c50513          	add	a0,a0,1036 # 8000a2d8 <digits+0x198>
    80003ed4:	d24fe0ef          	jal	800023f8 <uart_puts>
    80003ed8:	00843783          	ld	a5,8(s0)
    80003edc:	04978c63          	beq	a5,s1,80003f34 <test_page_replacement+0x214>
    80003ee0:	00006517          	auipc	a0,0x6
    80003ee4:	43850513          	add	a0,a0,1080 # 8000a318 <digits+0x1d8>
    80003ee8:	d10fe0ef          	jal	800023f8 <uart_puts>
    80003eec:	00006517          	auipc	a0,0x6
    80003ef0:	44c50513          	add	a0,a0,1100 # 8000a338 <digits+0x1f8>
    80003ef4:	d04fe0ef          	jal	800023f8 <uart_puts>
    80003ef8:	0b813083          	ld	ra,184(sp)
    80003efc:	0b013403          	ld	s0,176(sp)
    80003f00:	0a813483          	ld	s1,168(sp)
    80003f04:	0a013903          	ld	s2,160(sp)
    80003f08:	09813983          	ld	s3,152(sp)
    80003f0c:	0c010113          	add	sp,sp,192
    80003f10:	00008067          	ret
    80003f14:	00006517          	auipc	a0,0x6
    80003f18:	31450513          	add	a0,a0,788 # 8000a228 <digits+0xe8>
    80003f1c:	cdcfe0ef          	jal	800023f8 <uart_puts>
    80003f20:	eadff06f          	j	80003dcc <test_page_replacement+0xac>
    80003f24:	00f43423          	sd	a5,8(s0)
    80003f28:	f81ff06f          	j	80003ea8 <test_page_replacement+0x188>
    80003f2c:	00e43023          	sd	a4,0(s0)
    80003f30:	f71ff06f          	j	80003ea0 <test_page_replacement+0x180>
    80003f34:	00006517          	auipc	a0,0x6
    80003f38:	3c450513          	add	a0,a0,964 # 8000a2f8 <digits+0x1b8>
    80003f3c:	cbcfe0ef          	jal	800023f8 <uart_puts>
    80003f40:	fadff06f          	j	80003eec <test_page_replacement+0x1cc>
    80003f44:	00006517          	auipc	a0,0x6
    80003f48:	2c450513          	add	a0,a0,708 # 8000a208 <digits+0xc8>
    80003f4c:	cacfe0ef          	jal	800023f8 <uart_puts>
    80003f50:	e65ff06f          	j	80003db4 <test_page_replacement+0x94>
    80003f54:	00843783          	ld	a5,8(s0)
    80003f58:	f6979ae3          	bne	a5,s1,80003ecc <test_page_replacement+0x1ac>
    80003f5c:	00006517          	auipc	a0,0x6
    80003f60:	35c50513          	add	a0,a0,860 # 8000a2b8 <digits+0x178>
    80003f64:	c94fe0ef          	jal	800023f8 <uart_puts>
    80003f68:	f71ff06f          	j	80003ed8 <test_page_replacement+0x1b8>

0000000080003f6c <print_decimal>:
    80003f6c:	06050c63          	beqz	a0,80003fe4 <print_decimal+0x78>
    80003f70:	fc010113          	add	sp,sp,-64
    80003f74:	02113c23          	sd	ra,56(sp)
    80003f78:	02813823          	sd	s0,48(sp)
    80003f7c:	02913423          	sd	s1,40(sp)
    80003f80:	00810693          	add	a3,sp,8
    80003f84:	00000713          	li	a4,0
    80003f88:	00a00613          	li	a2,10
    80003f8c:	00900813          	li	a6,9
    80003f90:	02c577b3          	remu	a5,a0,a2
    80003f94:	00168693          	add	a3,a3,1
    80003f98:	00050593          	mv	a1,a0
    80003f9c:	00070413          	mv	s0,a4
    80003fa0:	0017071b          	addw	a4,a4,1
    80003fa4:	0307879b          	addw	a5,a5,48
    80003fa8:	fef68fa3          	sb	a5,-1(a3)
    80003fac:	02c55533          	divu	a0,a0,a2
    80003fb0:	feb860e3          	bltu	a6,a1,80003f90 <print_decimal+0x24>
    80003fb4:	00810793          	add	a5,sp,8
    80003fb8:	00878433          	add	s0,a5,s0
    80003fbc:	fff78493          	add	s1,a5,-1
    80003fc0:	00044503          	lbu	a0,0(s0)
    80003fc4:	fff40413          	add	s0,s0,-1
    80003fc8:	c18fe0ef          	jal	800023e0 <uart_putc>
    80003fcc:	fe849ae3          	bne	s1,s0,80003fc0 <print_decimal+0x54>
    80003fd0:	03813083          	ld	ra,56(sp)
    80003fd4:	03013403          	ld	s0,48(sp)
    80003fd8:	02813483          	ld	s1,40(sp)
    80003fdc:	04010113          	add	sp,sp,64
    80003fe0:	00008067          	ret
    80003fe4:	03000513          	li	a0,48
    80003fe8:	bf8fe06f          	j	800023e0 <uart_putc>

0000000080003fec <trap_init>:
    80003fec:	ff010113          	add	sp,sp,-16
    80003ff0:	00006517          	auipc	a0,0x6
    80003ff4:	37050513          	add	a0,a0,880 # 8000a360 <digits+0x220>
    80003ff8:	00113423          	sd	ra,8(sp)
    80003ffc:	bfcfe0ef          	jal	800023f8 <uart_puts>
    80004000:	449010ef          	jal	80005c48 <init_interrupt_stack>
    80004004:	00410617          	auipc	a2,0x410
    80004008:	0a460613          	add	a2,a2,164 # 804140a8 <ic>
    8000400c:	00060793          	mv	a5,a2
    80004010:	00410717          	auipc	a4,0x410
    80004014:	2e070713          	add	a4,a4,736 # 804142f0 <stats+0x28>
    80004018:	00410697          	auipc	a3,0x410
    8000401c:	29068693          	add	a3,a3,656 # 804142a8 <ic+0x200>
    80004020:	0007b023          	sd	zero,0(a5)
    80004024:	00073023          	sd	zero,0(a4)
    80004028:	00878793          	add	a5,a5,8
    8000402c:	00870713          	add	a4,a4,8
    80004030:	fed798e3          	bne	a5,a3,80004020 <trap_init+0x34>
    80004034:	00410797          	auipc	a5,0x410
    80004038:	2607ba23          	sd	zero,628(a5) # 804142a8 <ic+0x200>
    8000403c:	00410797          	auipc	a5,0x410
    80004040:	2607ba23          	sd	zero,628(a5) # 804142b0 <ic+0x208>
    80004044:	fff00793          	li	a5,-1
    80004048:	02079793          	sll	a5,a5,0x20
    8000404c:	20f63823          	sd	a5,528(a2)
    80004050:	00410797          	auipc	a5,0x410
    80004054:	2607b823          	sd	zero,624(a5) # 804142c0 <ic+0x218>
    80004058:	00410797          	auipc	a5,0x410
    8000405c:	2607b823          	sd	zero,624(a5) # 804142c8 <stats>
    80004060:	00410797          	auipc	a5,0x410
    80004064:	2607b823          	sd	zero,624(a5) # 804142d0 <stats+0x8>
    80004068:	00410797          	auipc	a5,0x410
    8000406c:	2607b823          	sd	zero,624(a5) # 804142d8 <stats+0x10>
    80004070:	00410797          	auipc	a5,0x410
    80004074:	2607b823          	sd	zero,624(a5) # 804142e0 <stats+0x18>
    80004078:	00002797          	auipc	a5,0x2
    8000407c:	80878793          	add	a5,a5,-2040 # 80005880 <kernelvec>
    80004080:	10579073          	csrw	stvec,a5
    80004084:	00813083          	ld	ra,8(sp)
    80004088:	00006517          	auipc	a0,0x6
    8000408c:	2f850513          	add	a0,a0,760 # 8000a380 <digits+0x240>
    80004090:	01010113          	add	sp,sp,16
    80004094:	b64fe06f          	j	800023f8 <uart_puts>

0000000080004098 <register_interrupt>:
    80004098:	fc010113          	add	sp,sp,-64
    8000409c:	01313c23          	sd	s3,24(sp)
    800040a0:	00070993          	mv	s3,a4
    800040a4:	02071713          	sll	a4,a4,0x20
    800040a8:	03213023          	sd	s2,32(sp)
    800040ac:	01513423          	sd	s5,8(sp)
    800040b0:	02079793          	sll	a5,a5,0x20
    800040b4:	02075713          	srl	a4,a4,0x20
    800040b8:	00050913          	mv	s2,a0
    800040bc:	02113c23          	sd	ra,56(sp)
    800040c0:	02813823          	sd	s0,48(sp)
    800040c4:	02913423          	sd	s1,40(sp)
    800040c8:	01413823          	sd	s4,16(sp)
    800040cc:	01613023          	sd	s6,0(sp)
    800040d0:	03f00513          	li	a0,63
    800040d4:	00f76ab3          	or	s5,a4,a5
    800040d8:	13256663          	bltu	a0,s2,80004204 <register_interrupt+0x16c>
    800040dc:	00058a13          	mv	s4,a1
    800040e0:	12058263          	beqz	a1,80004204 <register_interrupt+0x16c>
    800040e4:	00060b13          	mv	s6,a2
    800040e8:	00068493          	mv	s1,a3
    800040ec:	bb8fe0ef          	jal	800024a4 <alloc_page>
    800040f0:	00050413          	mv	s0,a0
    800040f4:	10050863          	beqz	a0,80004204 <register_interrupt+0x16c>
    800040f8:	01453023          	sd	s4,0(a0)
    800040fc:	01653423          	sd	s6,8(a0)
    80004100:	03553823          	sd	s5,48(a0)
    80004104:	02052c23          	sw	zero,56(a0)
    80004108:	04053023          	sd	zero,64(a0)
    8000410c:	00000793          	li	a5,0
    80004110:	01f00713          	li	a4,31
    80004114:	00049a63          	bnez	s1,80004128 <register_interrupt+0x90>
    80004118:	0240006f          	j	8000413c <register_interrupt+0xa4>
    8000411c:	00c58823          	sb	a2,16(a1)
    80004120:	00178793          	add	a5,a5,1
    80004124:	0ce78663          	beq	a5,a4,800041f0 <register_interrupt+0x158>
    80004128:	00f48633          	add	a2,s1,a5
    8000412c:	00064603          	lbu	a2,0(a2)
    80004130:	00f405b3          	add	a1,s0,a5
    80004134:	fe0614e3          	bnez	a2,8000411c <register_interrupt+0x84>
    80004138:	0007879b          	sext.w	a5,a5
    8000413c:	00f407b3          	add	a5,s0,a5
    80004140:	00078823          	sb	zero,16(a5)
    80004144:	720010ef          	jal	80005864 <disable_interrupts_asm>
    80004148:	00391793          	sll	a5,s2,0x3
    8000414c:	00410717          	auipc	a4,0x410
    80004150:	f5c70713          	add	a4,a4,-164 # 804140a8 <ic>
    80004154:	00f70733          	add	a4,a4,a5
    80004158:	00073783          	ld	a5,0(a4)
    8000415c:	08078663          	beqz	a5,800041e8 <register_interrupt+0x150>
    80004160:	0029f993          	and	s3,s3,2
    80004164:	08098a63          	beqz	s3,800041f8 <register_interrupt+0x160>
    80004168:	00078713          	mv	a4,a5
    8000416c:	0407b783          	ld	a5,64(a5)
    80004170:	fe079ce3          	bnez	a5,80004168 <register_interrupt+0xd0>
    80004174:	04873023          	sd	s0,64(a4)
    80004178:	6f4010ef          	jal	8000586c <enable_interrupts_asm>
    8000417c:	00006517          	auipc	a0,0x6
    80004180:	22450513          	add	a0,a0,548 # 8000a3a0 <digits+0x260>
    80004184:	a74fe0ef          	jal	800023f8 <uart_puts>
    80004188:	00a00793          	li	a5,10
    8000418c:	02f9653b          	remw	a0,s2,a5
    80004190:	0305051b          	addw	a0,a0,48
    80004194:	0ff57513          	zext.b	a0,a0
    80004198:	a48fe0ef          	jal	800023e0 <uart_putc>
    8000419c:	00006517          	auipc	a0,0x6
    800041a0:	22450513          	add	a0,a0,548 # 8000a3c0 <digits+0x280>
    800041a4:	a54fe0ef          	jal	800023f8 <uart_puts>
    800041a8:	01040513          	add	a0,s0,16
    800041ac:	a4cfe0ef          	jal	800023f8 <uart_puts>
    800041b0:	00005517          	auipc	a0,0x5
    800041b4:	be050513          	add	a0,a0,-1056 # 80008d90 <rodata_start+0xd90>
    800041b8:	a40fe0ef          	jal	800023f8 <uart_puts>
    800041bc:	00000513          	li	a0,0
    800041c0:	03813083          	ld	ra,56(sp)
    800041c4:	03013403          	ld	s0,48(sp)
    800041c8:	02813483          	ld	s1,40(sp)
    800041cc:	02013903          	ld	s2,32(sp)
    800041d0:	01813983          	ld	s3,24(sp)
    800041d4:	01013a03          	ld	s4,16(sp)
    800041d8:	00813a83          	ld	s5,8(sp)
    800041dc:	00013b03          	ld	s6,0(sp)
    800041e0:	04010113          	add	sp,sp,64
    800041e4:	00008067          	ret
    800041e8:	00873023          	sd	s0,0(a4)
    800041ec:	f8dff06f          	j	80004178 <register_interrupt+0xe0>
    800041f0:	01f00793          	li	a5,31
    800041f4:	f49ff06f          	j	8000413c <register_interrupt+0xa4>
    800041f8:	674010ef          	jal	8000586c <enable_interrupts_asm>
    800041fc:	00040513          	mv	a0,s0
    80004200:	ac0fe0ef          	jal	800024c0 <free_page>
    80004204:	fff00513          	li	a0,-1
    80004208:	fb9ff06f          	j	800041c0 <register_interrupt+0x128>

000000008000420c <unregister_interrupt>:
    8000420c:	03f00793          	li	a5,63
    80004210:	0aa7e663          	bltu	a5,a0,800042bc <unregister_interrupt+0xb0>
    80004214:	fe010113          	add	sp,sp,-32
    80004218:	00813823          	sd	s0,16(sp)
    8000421c:	00113c23          	sd	ra,24(sp)
    80004220:	00913423          	sd	s1,8(sp)
    80004224:	00058413          	mv	s0,a1
    80004228:	06058863          	beqz	a1,80004298 <unregister_interrupt+0x8c>
    8000422c:	00050493          	mv	s1,a0
    80004230:	634010ef          	jal	80005864 <disable_interrupts_asm>
    80004234:	00410617          	auipc	a2,0x410
    80004238:	e7460613          	add	a2,a2,-396 # 804140a8 <ic>
    8000423c:	00349493          	sll	s1,s1,0x3
    80004240:	009607b3          	add	a5,a2,s1
    80004244:	0007b503          	ld	a0,0(a5)
    80004248:	04050663          	beqz	a0,80004294 <unregister_interrupt+0x88>
    8000424c:	00000693          	li	a3,0
    80004250:	0100006f          	j	80004260 <unregister_interrupt+0x54>
    80004254:	00050693          	mv	a3,a0
    80004258:	02078e63          	beqz	a5,80004294 <unregister_interrupt+0x88>
    8000425c:	00078513          	mv	a0,a5
    80004260:	00053703          	ld	a4,0(a0)
    80004264:	04053783          	ld	a5,64(a0)
    80004268:	fe8716e3          	bne	a4,s0,80004254 <unregister_interrupt+0x48>
    8000426c:	04068263          	beqz	a3,800042b0 <unregister_interrupt+0xa4>
    80004270:	04f6b023          	sd	a5,64(a3)
    80004274:	a4cfe0ef          	jal	800024c0 <free_page>
    80004278:	5f4010ef          	jal	8000586c <enable_interrupts_asm>
    8000427c:	01813083          	ld	ra,24(sp)
    80004280:	01013403          	ld	s0,16(sp)
    80004284:	00813483          	ld	s1,8(sp)
    80004288:	00000513          	li	a0,0
    8000428c:	02010113          	add	sp,sp,32
    80004290:	00008067          	ret
    80004294:	5d8010ef          	jal	8000586c <enable_interrupts_asm>
    80004298:	01813083          	ld	ra,24(sp)
    8000429c:	01013403          	ld	s0,16(sp)
    800042a0:	00813483          	ld	s1,8(sp)
    800042a4:	fff00513          	li	a0,-1
    800042a8:	02010113          	add	sp,sp,32
    800042ac:	00008067          	ret
    800042b0:	00960633          	add	a2,a2,s1
    800042b4:	00f63023          	sd	a5,0(a2)
    800042b8:	fbdff06f          	j	80004274 <unregister_interrupt+0x68>
    800042bc:	fff00513          	li	a0,-1
    800042c0:	00008067          	ret

00000000800042c4 <enable_interrupt>:
    800042c4:	03f00793          	li	a5,63
    800042c8:	00a7f463          	bgeu	a5,a0,800042d0 <enable_interrupt+0xc>
    800042cc:	00008067          	ret
    800042d0:	ff010113          	add	sp,sp,-16
    800042d4:	00813023          	sd	s0,0(sp)
    800042d8:	00113423          	sd	ra,8(sp)
    800042dc:	00050413          	mv	s0,a0
    800042e0:	584010ef          	jal	80005864 <disable_interrupts_asm>
    800042e4:	00410697          	auipc	a3,0x410
    800042e8:	dc468693          	add	a3,a3,-572 # 804140a8 <ic>
    800042ec:	2006b783          	ld	a5,512(a3)
    800042f0:	00100713          	li	a4,1
    800042f4:	00871633          	sll	a2,a4,s0
    800042f8:	00c7e7b3          	or	a5,a5,a2
    800042fc:	20f6b023          	sd	a5,512(a3)
    80004300:	00500793          	li	a5,5
    80004304:	02f40063          	beq	s0,a5,80004324 <enable_interrupt+0x60>
    80004308:	00900793          	li	a5,9
    8000430c:	04f40263          	beq	s0,a5,80004350 <enable_interrupt+0x8c>
    80004310:	02e40663          	beq	s0,a4,8000433c <enable_interrupt+0x78>
    80004314:	00013403          	ld	s0,0(sp)
    80004318:	00813083          	ld	ra,8(sp)
    8000431c:	01010113          	add	sp,sp,16
    80004320:	54c0106f          	j	8000586c <enable_interrupts_asm>
    80004324:	02000793          	li	a5,32
    80004328:	1047a7f3          	csrrs	a5,sie,a5
    8000432c:	00013403          	ld	s0,0(sp)
    80004330:	00813083          	ld	ra,8(sp)
    80004334:	01010113          	add	sp,sp,16
    80004338:	5340106f          	j	8000586c <enable_interrupts_asm>
    8000433c:	104167f3          	csrrs	a5,sie,2
    80004340:	00013403          	ld	s0,0(sp)
    80004344:	00813083          	ld	ra,8(sp)
    80004348:	01010113          	add	sp,sp,16
    8000434c:	5200106f          	j	8000586c <enable_interrupts_asm>
    80004350:	20000793          	li	a5,512
    80004354:	1047a7f3          	csrrs	a5,sie,a5
    80004358:	00013403          	ld	s0,0(sp)
    8000435c:	00813083          	ld	ra,8(sp)
    80004360:	01010113          	add	sp,sp,16
    80004364:	5080106f          	j	8000586c <enable_interrupts_asm>

0000000080004368 <disable_interrupt>:
    80004368:	03f00793          	li	a5,63
    8000436c:	00a7f463          	bgeu	a5,a0,80004374 <disable_interrupt+0xc>
    80004370:	00008067          	ret
    80004374:	ff010113          	add	sp,sp,-16
    80004378:	00813023          	sd	s0,0(sp)
    8000437c:	00113423          	sd	ra,8(sp)
    80004380:	00050413          	mv	s0,a0
    80004384:	4e0010ef          	jal	80005864 <disable_interrupts_asm>
    80004388:	00410697          	auipc	a3,0x410
    8000438c:	d2068693          	add	a3,a3,-736 # 804140a8 <ic>
    80004390:	2006b603          	ld	a2,512(a3)
    80004394:	00100713          	li	a4,1
    80004398:	008717b3          	sll	a5,a4,s0
    8000439c:	fff7c793          	not	a5,a5
    800043a0:	00c7f7b3          	and	a5,a5,a2
    800043a4:	20f6b023          	sd	a5,512(a3)
    800043a8:	00500793          	li	a5,5
    800043ac:	02f40063          	beq	s0,a5,800043cc <disable_interrupt+0x64>
    800043b0:	00900793          	li	a5,9
    800043b4:	04f40263          	beq	s0,a5,800043f8 <disable_interrupt+0x90>
    800043b8:	02e40663          	beq	s0,a4,800043e4 <disable_interrupt+0x7c>
    800043bc:	00013403          	ld	s0,0(sp)
    800043c0:	00813083          	ld	ra,8(sp)
    800043c4:	01010113          	add	sp,sp,16
    800043c8:	4a40106f          	j	8000586c <enable_interrupts_asm>
    800043cc:	02000793          	li	a5,32
    800043d0:	1047b7f3          	csrrc	a5,sie,a5
    800043d4:	00013403          	ld	s0,0(sp)
    800043d8:	00813083          	ld	ra,8(sp)
    800043dc:	01010113          	add	sp,sp,16
    800043e0:	48c0106f          	j	8000586c <enable_interrupts_asm>
    800043e4:	104177f3          	csrrc	a5,sie,2
    800043e8:	00013403          	ld	s0,0(sp)
    800043ec:	00813083          	ld	ra,8(sp)
    800043f0:	01010113          	add	sp,sp,16
    800043f4:	4780106f          	j	8000586c <enable_interrupts_asm>
    800043f8:	20000793          	li	a5,512
    800043fc:	1047b7f3          	csrrc	a5,sie,a5
    80004400:	00013403          	ld	s0,0(sp)
    80004404:	00813083          	ld	ra,8(sp)
    80004408:	01010113          	add	sp,sp,16
    8000440c:	4600106f          	j	8000586c <enable_interrupts_asm>

0000000080004410 <enable_interrupts>:
    80004410:	45c0106f          	j	8000586c <enable_interrupts_asm>

0000000080004414 <disable_interrupts>:
    80004414:	4500106f          	j	80005864 <disable_interrupts_asm>

0000000080004418 <is_interrupt_enabled>:
    80004418:	03f00793          	li	a5,63
    8000441c:	00a7ec63          	bltu	a5,a0,80004434 <is_interrupt_enabled+0x1c>
    80004420:	00410797          	auipc	a5,0x410
    80004424:	e887b783          	ld	a5,-376(a5) # 804142a8 <ic+0x200>
    80004428:	00a7d533          	srl	a0,a5,a0
    8000442c:	00157513          	and	a0,a0,1
    80004430:	00008067          	ret
    80004434:	00000513          	li	a0,0
    80004438:	00008067          	ret

000000008000443c <set_interrupt_priority>:
    8000443c:	03f00793          	li	a5,63
    80004440:	02a7e463          	bltu	a5,a0,80004468 <set_interrupt_priority+0x2c>
    80004444:	00351513          	sll	a0,a0,0x3
    80004448:	00410797          	auipc	a5,0x410
    8000444c:	c6078793          	add	a5,a5,-928 # 804140a8 <ic>
    80004450:	00a787b3          	add	a5,a5,a0
    80004454:	0007b783          	ld	a5,0(a5)
    80004458:	00078863          	beqz	a5,80004468 <set_interrupt_priority+0x2c>
    8000445c:	02b7aa23          	sw	a1,52(a5)
    80004460:	0407b783          	ld	a5,64(a5)
    80004464:	fe079ce3          	bnez	a5,8000445c <set_interrupt_priority+0x20>
    80004468:	00008067          	ret

000000008000446c <get_interrupt_priority>:
    8000446c:	03f00793          	li	a5,63
    80004470:	02a7e263          	bltu	a5,a0,80004494 <get_interrupt_priority+0x28>
    80004474:	00351513          	sll	a0,a0,0x3
    80004478:	00410797          	auipc	a5,0x410
    8000447c:	c3078793          	add	a5,a5,-976 # 804140a8 <ic>
    80004480:	00a787b3          	add	a5,a5,a0
    80004484:	0007b783          	ld	a5,0(a5)
    80004488:	00078663          	beqz	a5,80004494 <get_interrupt_priority+0x28>
    8000448c:	0347a503          	lw	a0,52(a5)
    80004490:	00008067          	ret
    80004494:	00400513          	li	a0,4
    80004498:	00008067          	ret

000000008000449c <handle_interrupt>:
    8000449c:	fb010113          	add	sp,sp,-80
    800044a0:	03213823          	sd	s2,48(sp)
    800044a4:	04113423          	sd	ra,72(sp)
    800044a8:	04813023          	sd	s0,64(sp)
    800044ac:	02913c23          	sd	s1,56(sp)
    800044b0:	03313423          	sd	s3,40(sp)
    800044b4:	03413023          	sd	s4,32(sp)
    800044b8:	01513c23          	sd	s5,24(sp)
    800044bc:	01613823          	sd	s6,16(sp)
    800044c0:	01713423          	sd	s7,8(sp)
    800044c4:	03f00793          	li	a5,63
    800044c8:	00410917          	auipc	s2,0x410
    800044cc:	be090913          	add	s2,s2,-1056 # 804140a8 <ic>
    800044d0:	10a7ee63          	bltu	a5,a0,800045ec <handle_interrupt+0x150>
    800044d4:	00410917          	auipc	s2,0x410
    800044d8:	bd490913          	add	s2,s2,-1068 # 804140a8 <ic>
    800044dc:	20093783          	ld	a5,512(s2)
    800044e0:	00050493          	mv	s1,a0
    800044e4:	00a7d7b3          	srl	a5,a5,a0
    800044e8:	0017f793          	and	a5,a5,1
    800044ec:	10078063          	beqz	a5,800045ec <handle_interrupt+0x150>
    800044f0:	00351a13          	sll	s4,a0,0x3
    800044f4:	014907b3          	add	a5,s2,s4
    800044f8:	0007b403          	ld	s0,0(a5)
    800044fc:	0e040863          	beqz	s0,800045ec <handle_interrupt+0x150>
    80004500:	21092703          	lw	a4,528(s2)
    80004504:	00450793          	add	a5,a0,4
    80004508:	00379793          	sll	a5,a5,0x3
    8000450c:	00f907b3          	add	a5,s2,a5
    80004510:	0017071b          	addw	a4,a4,1
    80004514:	00058993          	mv	s3,a1
    80004518:	2287b583          	ld	a1,552(a5)
    8000451c:	02071613          	sll	a2,a4,0x20
    80004520:	0005069b          	sext.w	a3,a0
    80004524:	02065613          	srl	a2,a2,0x20
    80004528:	02069693          	sll	a3,a3,0x20
    8000452c:	00d666b3          	or	a3,a2,a3
    80004530:	00158593          	add	a1,a1,1
    80004534:	21492a83          	lw	s5,532(s2)
    80004538:	21893b03          	ld	s6,536(s2)
    8000453c:	22b7b423          	sd	a1,552(a5)
    80004540:	0007061b          	sext.w	a2,a4
    80004544:	21393c23          	sd	s3,536(s2)
    80004548:	02071713          	sll	a4,a4,0x20
    8000454c:	20d93823          	sd	a3,528(s2)
    80004550:	00100793          	li	a5,1
    80004554:	02075713          	srl	a4,a4,0x20
    80004558:	00c7f863          	bgeu	a5,a2,80004568 <handle_interrupt+0xcc>
    8000455c:	22893783          	ld	a5,552(s2)
    80004560:	00178793          	add	a5,a5,1
    80004564:	22f93423          	sd	a5,552(s2)
    80004568:	23893783          	ld	a5,568(s2)
    8000456c:	00e7f463          	bgeu	a5,a4,80004574 <handle_interrupt+0xd8>
    80004570:	22e93c23          	sd	a4,568(s2)
    80004574:	03042783          	lw	a5,48(s0)
    80004578:	0087f793          	and	a5,a5,8
    8000457c:	0a079463          	bnez	a5,80004624 <handle_interrupt+0x188>
    80004580:	00000b93          	li	s7,0
    80004584:	00043783          	ld	a5,0(s0)
    80004588:	00843583          	ld	a1,8(s0)
    8000458c:	00098613          	mv	a2,s3
    80004590:	00048513          	mv	a0,s1
    80004594:	000780e7          	jalr	a5
    80004598:	00051a63          	bnez	a0,800045ac <handle_interrupt+0x110>
    8000459c:	03842783          	lw	a5,56(s0)
    800045a0:	00100b93          	li	s7,1
    800045a4:	0017879b          	addw	a5,a5,1
    800045a8:	02f42c23          	sw	a5,56(s0)
    800045ac:	04043403          	ld	s0,64(s0)
    800045b0:	fc041ae3          	bnez	s0,80004584 <handle_interrupt+0xe8>
    800045b4:	01490a33          	add	s4,s2,s4
    800045b8:	000a3783          	ld	a5,0(s4) # fffffffffffff000 <bss_end+0xffffffff7fbe6df8>
    800045bc:	0307a783          	lw	a5,48(a5)
    800045c0:	0087f793          	and	a5,a5,8
    800045c4:	06079463          	bnez	a5,8000462c <handle_interrupt+0x190>
    800045c8:	21092783          	lw	a5,528(s2)
    800045cc:	020a9a93          	sll	s5,s5,0x20
    800045d0:	21693c23          	sd	s6,536(s2)
    800045d4:	fff7879b          	addw	a5,a5,-1
    800045d8:	02079793          	sll	a5,a5,0x20
    800045dc:	0207d793          	srl	a5,a5,0x20
    800045e0:	0157e7b3          	or	a5,a5,s5
    800045e4:	20f93823          	sd	a5,528(s2)
    800045e8:	000b9863          	bnez	s7,800045f8 <handle_interrupt+0x15c>
    800045ec:	23093783          	ld	a5,560(s2)
    800045f0:	00178793          	add	a5,a5,1
    800045f4:	22f93823          	sd	a5,560(s2)
    800045f8:	04813083          	ld	ra,72(sp)
    800045fc:	04013403          	ld	s0,64(sp)
    80004600:	03813483          	ld	s1,56(sp)
    80004604:	03013903          	ld	s2,48(sp)
    80004608:	02813983          	ld	s3,40(sp)
    8000460c:	02013a03          	ld	s4,32(sp)
    80004610:	01813a83          	ld	s5,24(sp)
    80004614:	01013b03          	ld	s6,16(sp)
    80004618:	00813b83          	ld	s7,8(sp)
    8000461c:	05010113          	add	sp,sp,80
    80004620:	00008067          	ret
    80004624:	248010ef          	jal	8000586c <enable_interrupts_asm>
    80004628:	f59ff06f          	j	80004580 <handle_interrupt+0xe4>
    8000462c:	238010ef          	jal	80005864 <disable_interrupts_asm>
    80004630:	f99ff06f          	j	800045c8 <handle_interrupt+0x12c>

0000000080004634 <get_trap_name>:
    80004634:	00f00793          	li	a5,15
    80004638:	02a7e063          	bltu	a5,a0,80004658 <get_trap_name+0x24>
    8000463c:	00351513          	sll	a0,a0,0x3
    80004640:	00006797          	auipc	a5,0x6
    80004644:	6b078793          	add	a5,a5,1712 # 8000acf0 <trap_names>
    80004648:	00a787b3          	add	a5,a5,a0
    8000464c:	0007b503          	ld	a0,0(a5)
    80004650:	00050463          	beqz	a0,80004658 <get_trap_name+0x24>
    80004654:	00008067          	ret
    80004658:	00006517          	auipc	a0,0x6
    8000465c:	d7050513          	add	a0,a0,-656 # 8000a3c8 <digits+0x288>
    80004660:	00008067          	ret

0000000080004664 <dump_trap_frame>:
    80004664:	fd010113          	add	sp,sp,-48
    80004668:	02813023          	sd	s0,32(sp)
    8000466c:	00050413          	mv	s0,a0
    80004670:	00006517          	auipc	a0,0x6
    80004674:	d6850513          	add	a0,a0,-664 # 8000a3d8 <digits+0x298>
    80004678:	02113423          	sd	ra,40(sp)
    8000467c:	00913c23          	sd	s1,24(sp)
    80004680:	01213823          	sd	s2,16(sp)
    80004684:	01313423          	sd	s3,8(sp)
    80004688:	01413023          	sd	s4,0(sp)
    8000468c:	d6dfd0ef          	jal	800023f8 <uart_puts>
    80004690:	00006517          	auipc	a0,0x6
    80004694:	d6850513          	add	a0,a0,-664 # 8000a3f8 <digits+0x2b8>
    80004698:	d61fd0ef          	jal	800023f8 <uart_puts>
    8000469c:	10843a03          	ld	s4,264(s0)
    800046a0:	03c00493          	li	s1,60
    800046a4:	00900993          	li	s3,9
    800046a8:	ffc00913          	li	s2,-4
    800046ac:	009a57b3          	srl	a5,s4,s1
    800046b0:	00f7f713          	and	a4,a5,15
    800046b4:	ffc4849b          	addw	s1,s1,-4
    800046b8:	03770513          	add	a0,a4,55
    800046bc:	00e9c463          	blt	s3,a4,800046c4 <dump_trap_frame+0x60>
    800046c0:	03070513          	add	a0,a4,48
    800046c4:	d1dfd0ef          	jal	800023e0 <uart_putc>
    800046c8:	ff2492e3          	bne	s1,s2,800046ac <dump_trap_frame+0x48>
    800046cc:	00004517          	auipc	a0,0x4
    800046d0:	6c450513          	add	a0,a0,1732 # 80008d90 <rodata_start+0xd90>
    800046d4:	d25fd0ef          	jal	800023f8 <uart_puts>
    800046d8:	00006517          	auipc	a0,0x6
    800046dc:	d3050513          	add	a0,a0,-720 # 8000a408 <digits+0x2c8>
    800046e0:	d19fd0ef          	jal	800023f8 <uart_puts>
    800046e4:	10043a03          	ld	s4,256(s0)
    800046e8:	03c00493          	li	s1,60
    800046ec:	00900993          	li	s3,9
    800046f0:	ffc00913          	li	s2,-4
    800046f4:	009a57b3          	srl	a5,s4,s1
    800046f8:	00f7f713          	and	a4,a5,15
    800046fc:	ffc4849b          	addw	s1,s1,-4
    80004700:	03770513          	add	a0,a4,55
    80004704:	00e9c463          	blt	s3,a4,8000470c <dump_trap_frame+0xa8>
    80004708:	03070513          	add	a0,a4,48
    8000470c:	cd5fd0ef          	jal	800023e0 <uart_putc>
    80004710:	ff2492e3          	bne	s1,s2,800046f4 <dump_trap_frame+0x90>
    80004714:	00004517          	auipc	a0,0x4
    80004718:	67c50513          	add	a0,a0,1660 # 80008d90 <rodata_start+0xd90>
    8000471c:	cddfd0ef          	jal	800023f8 <uart_puts>
    80004720:	00006517          	auipc	a0,0x6
    80004724:	cf850513          	add	a0,a0,-776 # 8000a418 <digits+0x2d8>
    80004728:	cd1fd0ef          	jal	800023f8 <uart_puts>
    8000472c:	00843a03          	ld	s4,8(s0)
    80004730:	03c00493          	li	s1,60
    80004734:	00900993          	li	s3,9
    80004738:	ffc00913          	li	s2,-4
    8000473c:	009a57b3          	srl	a5,s4,s1
    80004740:	00f7f713          	and	a4,a5,15
    80004744:	ffc4849b          	addw	s1,s1,-4
    80004748:	03770513          	add	a0,a4,55
    8000474c:	00e9c463          	blt	s3,a4,80004754 <dump_trap_frame+0xf0>
    80004750:	03070513          	add	a0,a4,48
    80004754:	c8dfd0ef          	jal	800023e0 <uart_putc>
    80004758:	ff2492e3          	bne	s1,s2,8000473c <dump_trap_frame+0xd8>
    8000475c:	00004517          	auipc	a0,0x4
    80004760:	63450513          	add	a0,a0,1588 # 80008d90 <rodata_start+0xd90>
    80004764:	c95fd0ef          	jal	800023f8 <uart_puts>
    80004768:	00006517          	auipc	a0,0x6
    8000476c:	cc050513          	add	a0,a0,-832 # 8000a428 <digits+0x2e8>
    80004770:	c89fd0ef          	jal	800023f8 <uart_puts>
    80004774:	01043a03          	ld	s4,16(s0)
    80004778:	03c00493          	li	s1,60
    8000477c:	00900993          	li	s3,9
    80004780:	ffc00913          	li	s2,-4
    80004784:	009a57b3          	srl	a5,s4,s1
    80004788:	00f7f713          	and	a4,a5,15
    8000478c:	ffc4849b          	addw	s1,s1,-4
    80004790:	03770513          	add	a0,a4,55
    80004794:	00e9c463          	blt	s3,a4,8000479c <dump_trap_frame+0x138>
    80004798:	03070513          	add	a0,a4,48
    8000479c:	c45fd0ef          	jal	800023e0 <uart_putc>
    800047a0:	ff2492e3          	bne	s1,s2,80004784 <dump_trap_frame+0x120>
    800047a4:	00004517          	auipc	a0,0x4
    800047a8:	5ec50513          	add	a0,a0,1516 # 80008d90 <rodata_start+0xd90>
    800047ac:	c4dfd0ef          	jal	800023f8 <uart_puts>
    800047b0:	00006517          	auipc	a0,0x6
    800047b4:	c8850513          	add	a0,a0,-888 # 8000a438 <digits+0x2f8>
    800047b8:	c41fd0ef          	jal	800023f8 <uart_puts>
    800047bc:	01843a03          	ld	s4,24(s0)
    800047c0:	03c00493          	li	s1,60
    800047c4:	00900993          	li	s3,9
    800047c8:	ffc00913          	li	s2,-4
    800047cc:	009a57b3          	srl	a5,s4,s1
    800047d0:	00f7f713          	and	a4,a5,15
    800047d4:	ffc4849b          	addw	s1,s1,-4
    800047d8:	03770513          	add	a0,a4,55
    800047dc:	00e9c463          	blt	s3,a4,800047e4 <dump_trap_frame+0x180>
    800047e0:	03070513          	add	a0,a4,48
    800047e4:	bfdfd0ef          	jal	800023e0 <uart_putc>
    800047e8:	ff2492e3          	bne	s1,s2,800047cc <dump_trap_frame+0x168>
    800047ec:	00004517          	auipc	a0,0x4
    800047f0:	5a450513          	add	a0,a0,1444 # 80008d90 <rodata_start+0xd90>
    800047f4:	c05fd0ef          	jal	800023f8 <uart_puts>
    800047f8:	00006517          	auipc	a0,0x6
    800047fc:	c5050513          	add	a0,a0,-944 # 8000a448 <digits+0x308>
    80004800:	bf9fd0ef          	jal	800023f8 <uart_puts>
    80004804:	05043a03          	ld	s4,80(s0)
    80004808:	03c00493          	li	s1,60
    8000480c:	00900993          	li	s3,9
    80004810:	ffc00913          	li	s2,-4
    80004814:	009a57b3          	srl	a5,s4,s1
    80004818:	00f7f713          	and	a4,a5,15
    8000481c:	ffc4849b          	addw	s1,s1,-4
    80004820:	03770513          	add	a0,a4,55
    80004824:	00e9c463          	blt	s3,a4,8000482c <dump_trap_frame+0x1c8>
    80004828:	03070513          	add	a0,a4,48
    8000482c:	bb5fd0ef          	jal	800023e0 <uart_putc>
    80004830:	ff2492e3          	bne	s1,s2,80004814 <dump_trap_frame+0x1b0>
    80004834:	00004517          	auipc	a0,0x4
    80004838:	55c50513          	add	a0,a0,1372 # 80008d90 <rodata_start+0xd90>
    8000483c:	bbdfd0ef          	jal	800023f8 <uart_puts>
    80004840:	00006517          	auipc	a0,0x6
    80004844:	c1850513          	add	a0,a0,-1000 # 8000a458 <digits+0x318>
    80004848:	bb1fd0ef          	jal	800023f8 <uart_puts>
    8000484c:	00900913          	li	s2,9
    80004850:	05843983          	ld	s3,88(s0)
    80004854:	ffc00493          	li	s1,-4
    80004858:	03c00413          	li	s0,60
    8000485c:	0089d7b3          	srl	a5,s3,s0
    80004860:	00f7f713          	and	a4,a5,15
    80004864:	ffc4041b          	addw	s0,s0,-4
    80004868:	03770513          	add	a0,a4,55
    8000486c:	00e94463          	blt	s2,a4,80004874 <dump_trap_frame+0x210>
    80004870:	03070513          	add	a0,a4,48
    80004874:	b6dfd0ef          	jal	800023e0 <uart_putc>
    80004878:	fe9412e3          	bne	s0,s1,8000485c <dump_trap_frame+0x1f8>
    8000487c:	02013403          	ld	s0,32(sp)
    80004880:	02813083          	ld	ra,40(sp)
    80004884:	01813483          	ld	s1,24(sp)
    80004888:	01013903          	ld	s2,16(sp)
    8000488c:	00813983          	ld	s3,8(sp)
    80004890:	00013a03          	ld	s4,0(sp)
    80004894:	00004517          	auipc	a0,0x4
    80004898:	4fc50513          	add	a0,a0,1276 # 80008d90 <rodata_start+0xd90>
    8000489c:	03010113          	add	sp,sp,48
    800048a0:	b59fd06f          	j	800023f8 <uart_puts>

00000000800048a4 <test_context_switching>:
    800048a4:	ff010113          	add	sp,sp,-16
    800048a8:	00006517          	auipc	a0,0x6
    800048ac:	bc050513          	add	a0,a0,-1088 # 8000a468 <digits+0x328>
    800048b0:	00113423          	sd	ra,8(sp)
    800048b4:	b45fd0ef          	jal	800023f8 <uart_puts>
    800048b8:	00006517          	auipc	a0,0x6
    800048bc:	bd050513          	add	a0,a0,-1072 # 8000a488 <digits+0x348>
    800048c0:	b39fd0ef          	jal	800023f8 <uart_puts>
    800048c4:	00100613          	li	a2,1
    800048c8:	00000593          	li	a1,0
    800048cc:	00000513          	li	a0,0
    800048d0:	754010ef          	jal	80006024 <set_context_save_config>
    800048d4:	00006517          	auipc	a0,0x6
    800048d8:	bd450513          	add	a0,a0,-1068 # 8000a4a8 <digits+0x368>
    800048dc:	b1dfd0ef          	jal	800023f8 <uart_puts>
    800048e0:	00100613          	li	a2,1
    800048e4:	00100593          	li	a1,1
    800048e8:	00100513          	li	a0,1
    800048ec:	738010ef          	jal	80006024 <set_context_save_config>
    800048f0:	00006517          	auipc	a0,0x6
    800048f4:	bd850513          	add	a0,a0,-1064 # 8000a4c8 <digits+0x388>
    800048f8:	b01fd0ef          	jal	800023f8 <uart_puts>
    800048fc:	00100613          	li	a2,1
    80004900:	00100593          	li	a1,1
    80004904:	00200513          	li	a0,2
    80004908:	71c010ef          	jal	80006024 <set_context_save_config>
    8000490c:	00006517          	auipc	a0,0x6
    80004910:	bdc50513          	add	a0,a0,-1060 # 8000a4e8 <digits+0x3a8>
    80004914:	ae5fd0ef          	jal	800023f8 <uart_puts>
    80004918:	00006517          	auipc	a0,0x6
    8000491c:	be850513          	add	a0,a0,-1048 # 8000a500 <digits+0x3c0>
    80004920:	ad9fd0ef          	jal	800023f8 <uart_puts>
    80004924:	123457b7          	lui	a5,0x12345
    80004928:	67878793          	add	a5,a5,1656 # 12345678 <_entry-0x6dcba988>
    8000492c:	02f28263          	beq	t0,a5,80004950 <test_context_switching+0xac>
    80004930:	00006517          	auipc	a0,0x6
    80004934:	bf850513          	add	a0,a0,-1032 # 8000a528 <digits+0x3e8>
    80004938:	ac1fd0ef          	jal	800023f8 <uart_puts>
    8000493c:	00813083          	ld	ra,8(sp)
    80004940:	00006517          	auipc	a0,0x6
    80004944:	bf050513          	add	a0,a0,-1040 # 8000a530 <digits+0x3f0>
    80004948:	01010113          	add	sp,sp,16
    8000494c:	aadfd06f          	j	800023f8 <uart_puts>
    80004950:	00006517          	auipc	a0,0x6
    80004954:	bd050513          	add	a0,a0,-1072 # 8000a520 <digits+0x3e0>
    80004958:	aa1fd0ef          	jal	800023f8 <uart_puts>
    8000495c:	00813083          	ld	ra,8(sp)
    80004960:	00006517          	auipc	a0,0x6
    80004964:	bd050513          	add	a0,a0,-1072 # 8000a530 <digits+0x3f0>
    80004968:	01010113          	add	sp,sp,16
    8000496c:	a8dfd06f          	j	800023f8 <uart_puts>

0000000080004970 <print_interrupt_stats>:
    80004970:	fc010113          	add	sp,sp,-64
    80004974:	00006517          	auipc	a0,0x6
    80004978:	bdc50513          	add	a0,a0,-1060 # 8000a550 <digits+0x410>
    8000497c:	02113c23          	sd	ra,56(sp)
    80004980:	02813823          	sd	s0,48(sp)
    80004984:	02913423          	sd	s1,40(sp)
    80004988:	03213023          	sd	s2,32(sp)
    8000498c:	01313c23          	sd	s3,24(sp)
    80004990:	01413823          	sd	s4,16(sp)
    80004994:	01513423          	sd	s5,8(sp)
    80004998:	01613023          	sd	s6,0(sp)
    8000499c:	a5dfd0ef          	jal	800023f8 <uart_puts>
    800049a0:	00006517          	auipc	a0,0x6
    800049a4:	bd050513          	add	a0,a0,-1072 # 8000a570 <digits+0x430>
    800049a8:	0040f917          	auipc	s2,0x40f
    800049ac:	70090913          	add	s2,s2,1792 # 804140a8 <ic>
    800049b0:	a49fd0ef          	jal	800023f8 <uart_puts>
    800049b4:	22093503          	ld	a0,544(s2)
    800049b8:	00004a17          	auipc	s4,0x4
    800049bc:	3d8a0a13          	add	s4,s4,984 # 80008d90 <rodata_start+0xd90>
    800049c0:	00410497          	auipc	s1,0x410
    800049c4:	93048493          	add	s1,s1,-1744 # 804142f0 <stats+0x28>
    800049c8:	da4ff0ef          	jal	80003f6c <print_decimal>
    800049cc:	00004517          	auipc	a0,0x4
    800049d0:	3c450513          	add	a0,a0,964 # 80008d90 <rodata_start+0xd90>
    800049d4:	a25fd0ef          	jal	800023f8 <uart_puts>
    800049d8:	00006517          	auipc	a0,0x6
    800049dc:	ba850513          	add	a0,a0,-1112 # 8000a580 <digits+0x440>
    800049e0:	a19fd0ef          	jal	800023f8 <uart_puts>
    800049e4:	22893503          	ld	a0,552(s2)
    800049e8:	00000413          	li	s0,0
    800049ec:	00006b17          	auipc	s6,0x6
    800049f0:	becb0b13          	add	s6,s6,-1044 # 8000a5d8 <digits+0x498>
    800049f4:	d78ff0ef          	jal	80003f6c <print_decimal>
    800049f8:	00004517          	auipc	a0,0x4
    800049fc:	39850513          	add	a0,a0,920 # 80008d90 <rodata_start+0xd90>
    80004a00:	9f9fd0ef          	jal	800023f8 <uart_puts>
    80004a04:	00006517          	auipc	a0,0x6
    80004a08:	b9450513          	add	a0,a0,-1132 # 8000a598 <digits+0x458>
    80004a0c:	9edfd0ef          	jal	800023f8 <uart_puts>
    80004a10:	23093503          	ld	a0,560(s2)
    80004a14:	00a00993          	li	s3,10
    80004a18:	00005a97          	auipc	s5,0x5
    80004a1c:	e90a8a93          	add	s5,s5,-368 # 800098a8 <rodata_start+0x18a8>
    80004a20:	d4cff0ef          	jal	80003f6c <print_decimal>
    80004a24:	000a0513          	mv	a0,s4
    80004a28:	9d1fd0ef          	jal	800023f8 <uart_puts>
    80004a2c:	00006517          	auipc	a0,0x6
    80004a30:	b7c50513          	add	a0,a0,-1156 # 8000a5a8 <digits+0x468>
    80004a34:	9c5fd0ef          	jal	800023f8 <uart_puts>
    80004a38:	23893503          	ld	a0,568(s2)
    80004a3c:	04000913          	li	s2,64
    80004a40:	d2cff0ef          	jal	80003f6c <print_decimal>
    80004a44:	000a0513          	mv	a0,s4
    80004a48:	9b1fd0ef          	jal	800023f8 <uart_puts>
    80004a4c:	00006517          	auipc	a0,0x6
    80004a50:	b7450513          	add	a0,a0,-1164 # 8000a5c0 <digits+0x480>
    80004a54:	9a5fd0ef          	jal	800023f8 <uart_puts>
    80004a58:	0100006f          	j	80004a68 <print_interrupt_stats+0xf8>
    80004a5c:	0014041b          	addw	s0,s0,1
    80004a60:	00848493          	add	s1,s1,8
    80004a64:	05240c63          	beq	s0,s2,80004abc <print_interrupt_stats+0x14c>
    80004a68:	0004b783          	ld	a5,0(s1)
    80004a6c:	fe0788e3          	beqz	a5,80004a5c <print_interrupt_stats+0xec>
    80004a70:	000b0513          	mv	a0,s6
    80004a74:	985fd0ef          	jal	800023f8 <uart_puts>
    80004a78:	0334453b          	divw	a0,s0,s3
    80004a7c:	00848493          	add	s1,s1,8
    80004a80:	0305051b          	addw	a0,a0,48
    80004a84:	0ff57513          	zext.b	a0,a0
    80004a88:	959fd0ef          	jal	800023e0 <uart_putc>
    80004a8c:	0334653b          	remw	a0,s0,s3
    80004a90:	0014041b          	addw	s0,s0,1
    80004a94:	0305051b          	addw	a0,a0,48
    80004a98:	0ff57513          	zext.b	a0,a0
    80004a9c:	945fd0ef          	jal	800023e0 <uart_putc>
    80004aa0:	000a8513          	mv	a0,s5
    80004aa4:	955fd0ef          	jal	800023f8 <uart_puts>
    80004aa8:	ff84b503          	ld	a0,-8(s1)
    80004aac:	cc0ff0ef          	jal	80003f6c <print_decimal>
    80004ab0:	000a0513          	mv	a0,s4
    80004ab4:	945fd0ef          	jal	800023f8 <uart_puts>
    80004ab8:	fb2418e3          	bne	s0,s2,80004a68 <print_interrupt_stats+0xf8>
    80004abc:	03813083          	ld	ra,56(sp)
    80004ac0:	03013403          	ld	s0,48(sp)
    80004ac4:	02813483          	ld	s1,40(sp)
    80004ac8:	02013903          	ld	s2,32(sp)
    80004acc:	01813983          	ld	s3,24(sp)
    80004ad0:	01013a03          	ld	s4,16(sp)
    80004ad4:	00813a83          	ld	s5,8(sp)
    80004ad8:	00013b03          	ld	s6,0(sp)
    80004adc:	04010113          	add	sp,sp,64
    80004ae0:	00008067          	ret

0000000080004ae4 <kernel_panic_handler>:
    80004ae4:	ff010113          	add	sp,sp,-16
    80004ae8:	00006517          	auipc	a0,0x6
    80004aec:	af850513          	add	a0,a0,-1288 # 8000a5e0 <digits+0x4a0>
    80004af0:	00113423          	sd	ra,8(sp)
    80004af4:	905fd0ef          	jal	800023f8 <uart_puts>
    80004af8:	00006517          	auipc	a0,0x6
    80004afc:	b0050513          	add	a0,a0,-1280 # 8000a5f8 <digits+0x4b8>
    80004b00:	8f9fd0ef          	jal	800023f8 <uart_puts>
    80004b04:	00006517          	auipc	a0,0x6
    80004b08:	b1c50513          	add	a0,a0,-1252 # 8000a620 <digits+0x4e0>
    80004b0c:	8edfd0ef          	jal	800023f8 <uart_puts>
    80004b10:	00006517          	auipc	a0,0x6
    80004b14:	b3050513          	add	a0,a0,-1232 # 8000a640 <digits+0x500>
    80004b18:	8e1fd0ef          	jal	800023f8 <uart_puts>
    80004b1c:	e55ff0ef          	jal	80004970 <print_interrupt_stats>
    80004b20:	00006517          	auipc	a0,0x6
    80004b24:	b3850513          	add	a0,a0,-1224 # 8000a658 <digits+0x518>
    80004b28:	8d1fd0ef          	jal	800023f8 <uart_puts>
    80004b2c:	390010ef          	jal	80005ebc <print_stack_stats>
    80004b30:	00006517          	auipc	a0,0x6
    80004b34:	b3850513          	add	a0,a0,-1224 # 8000a668 <digits+0x528>
    80004b38:	8c1fd0ef          	jal	800023f8 <uart_puts>
    80004b3c:	529000ef          	jal	80005864 <disable_interrupts_asm>
    80004b40:	0000006f          	j	80004b40 <kernel_panic_handler+0x5c>

0000000080004b44 <handle_syscall>:
    80004b44:	fe010113          	add	sp,sp,-32
    80004b48:	00813823          	sd	s0,16(sp)
    80004b4c:	00050413          	mv	s0,a0
    80004b50:	00006517          	auipc	a0,0x6
    80004b54:	b3050513          	add	a0,a0,-1232 # 8000a680 <digits+0x540>
    80004b58:	00113c23          	sd	ra,24(sp)
    80004b5c:	00913423          	sd	s1,8(sp)
    80004b60:	899fd0ef          	jal	800023f8 <uart_puts>
    80004b64:	05043483          	ld	s1,80(s0)
    80004b68:	00006517          	auipc	a0,0x6
    80004b6c:	b3850513          	add	a0,a0,-1224 # 8000a6a0 <digits+0x560>
    80004b70:	889fd0ef          	jal	800023f8 <uart_puts>
    80004b74:	00048513          	mv	a0,s1
    80004b78:	bf4ff0ef          	jal	80003f6c <print_decimal>
    80004b7c:	00004517          	auipc	a0,0x4
    80004b80:	21450513          	add	a0,a0,532 # 80008d90 <rodata_start+0xd90>
    80004b84:	875fd0ef          	jal	800023f8 <uart_puts>
    80004b88:	00100793          	li	a5,1
    80004b8c:	04f48063          	beq	s1,a5,80004bcc <handle_syscall+0x88>
    80004b90:	00200793          	li	a5,2
    80004b94:	04f48663          	beq	s1,a5,80004be0 <handle_syscall+0x9c>
    80004b98:	00006517          	auipc	a0,0x6
    80004b9c:	b5050513          	add	a0,a0,-1200 # 8000a6e8 <digits+0x5a8>
    80004ba0:	859fd0ef          	jal	800023f8 <uart_puts>
    80004ba4:	fff00713          	li	a4,-1
    80004ba8:	10843783          	ld	a5,264(s0)
    80004bac:	01813083          	ld	ra,24(sp)
    80004bb0:	04e43823          	sd	a4,80(s0)
    80004bb4:	00478793          	add	a5,a5,4
    80004bb8:	10f43423          	sd	a5,264(s0)
    80004bbc:	01013403          	ld	s0,16(sp)
    80004bc0:	00813483          	ld	s1,8(sp)
    80004bc4:	02010113          	add	sp,sp,32
    80004bc8:	00008067          	ret
    80004bcc:	00006517          	auipc	a0,0x6
    80004bd0:	aec50513          	add	a0,a0,-1300 # 8000a6b8 <digits+0x578>
    80004bd4:	825fd0ef          	jal	800023f8 <uart_puts>
    80004bd8:	00000713          	li	a4,0
    80004bdc:	fcdff06f          	j	80004ba8 <handle_syscall+0x64>
    80004be0:	00006517          	auipc	a0,0x6
    80004be4:	af050513          	add	a0,a0,-1296 # 8000a6d0 <digits+0x590>
    80004be8:	811fd0ef          	jal	800023f8 <uart_puts>
    80004bec:	05843703          	ld	a4,88(s0)
    80004bf0:	fb9ff06f          	j	80004ba8 <handle_syscall+0x64>

0000000080004bf4 <handle_instruction_page_fault>:
    80004bf4:	fd010113          	add	sp,sp,-48
    80004bf8:	00006517          	auipc	a0,0x6
    80004bfc:	b1050513          	add	a0,a0,-1264 # 8000a708 <digits+0x5c8>
    80004c00:	02113423          	sd	ra,40(sp)
    80004c04:	02813023          	sd	s0,32(sp)
    80004c08:	00913c23          	sd	s1,24(sp)
    80004c0c:	01213823          	sd	s2,16(sp)
    80004c10:	01313423          	sd	s3,8(sp)
    80004c14:	fe4fd0ef          	jal	800023f8 <uart_puts>
    80004c18:	143024f3          	csrr	s1,stval
    80004c1c:	00006517          	auipc	a0,0x6
    80004c20:	b0450513          	add	a0,a0,-1276 # 8000a720 <digits+0x5e0>
    80004c24:	fd4fd0ef          	jal	800023f8 <uart_puts>
    80004c28:	03c00413          	li	s0,60
    80004c2c:	00900993          	li	s3,9
    80004c30:	ffc00913          	li	s2,-4
    80004c34:	0084d7b3          	srl	a5,s1,s0
    80004c38:	00f7f713          	and	a4,a5,15
    80004c3c:	ffc4041b          	addw	s0,s0,-4
    80004c40:	03770513          	add	a0,a4,55
    80004c44:	00e9c463          	blt	s3,a4,80004c4c <handle_instruction_page_fault+0x58>
    80004c48:	03070513          	add	a0,a4,48
    80004c4c:	f94fd0ef          	jal	800023e0 <uart_putc>
    80004c50:	ff2412e3          	bne	s0,s2,80004c34 <handle_instruction_page_fault+0x40>
    80004c54:	00004517          	auipc	a0,0x4
    80004c58:	13c50513          	add	a0,a0,316 # 80008d90 <rodata_start+0xd90>
    80004c5c:	f9cfd0ef          	jal	800023f8 <uart_puts>
    80004c60:	00a00613          	li	a2,10
    80004c64:	00048593          	mv	a1,s1
    80004c68:	00413517          	auipc	a0,0x413
    80004c6c:	56053503          	ld	a0,1376(a0) # 804181c8 <kernel_pagetable>
    80004c70:	c29fe0ef          	jal	80003898 <handle_page_fault>
    80004c74:	02050a63          	beqz	a0,80004ca8 <handle_instruction_page_fault+0xb4>
    80004c78:	00006517          	auipc	a0,0x6
    80004c7c:	ae050513          	add	a0,a0,-1312 # 8000a758 <digits+0x618>
    80004c80:	f78fd0ef          	jal	800023f8 <uart_puts>
    80004c84:	02013403          	ld	s0,32(sp)
    80004c88:	02813083          	ld	ra,40(sp)
    80004c8c:	01813483          	ld	s1,24(sp)
    80004c90:	01013903          	ld	s2,16(sp)
    80004c94:	00813983          	ld	s3,8(sp)
    80004c98:	00006517          	auipc	a0,0x6
    80004c9c:	ae050513          	add	a0,a0,-1312 # 8000a778 <digits+0x638>
    80004ca0:	03010113          	add	sp,sp,48
    80004ca4:	9fdfb06f          	j	800006a0 <panic>
    80004ca8:	02013403          	ld	s0,32(sp)
    80004cac:	02813083          	ld	ra,40(sp)
    80004cb0:	01813483          	ld	s1,24(sp)
    80004cb4:	01013903          	ld	s2,16(sp)
    80004cb8:	00813983          	ld	s3,8(sp)
    80004cbc:	00006517          	auipc	a0,0x6
    80004cc0:	a7c50513          	add	a0,a0,-1412 # 8000a738 <digits+0x5f8>
    80004cc4:	03010113          	add	sp,sp,48
    80004cc8:	f30fd06f          	j	800023f8 <uart_puts>

0000000080004ccc <handle_load_page_fault>:
    80004ccc:	fd010113          	add	sp,sp,-48
    80004cd0:	00006517          	auipc	a0,0x6
    80004cd4:	ac050513          	add	a0,a0,-1344 # 8000a790 <digits+0x650>
    80004cd8:	02113423          	sd	ra,40(sp)
    80004cdc:	02813023          	sd	s0,32(sp)
    80004ce0:	00913c23          	sd	s1,24(sp)
    80004ce4:	01213823          	sd	s2,16(sp)
    80004ce8:	01313423          	sd	s3,8(sp)
    80004cec:	f0cfd0ef          	jal	800023f8 <uart_puts>
    80004cf0:	143024f3          	csrr	s1,stval
    80004cf4:	00006517          	auipc	a0,0x6
    80004cf8:	a2c50513          	add	a0,a0,-1492 # 8000a720 <digits+0x5e0>
    80004cfc:	efcfd0ef          	jal	800023f8 <uart_puts>
    80004d00:	03c00413          	li	s0,60
    80004d04:	00900993          	li	s3,9
    80004d08:	ffc00913          	li	s2,-4
    80004d0c:	0084d7b3          	srl	a5,s1,s0
    80004d10:	00f7f713          	and	a4,a5,15
    80004d14:	ffc4041b          	addw	s0,s0,-4
    80004d18:	03770513          	add	a0,a4,55
    80004d1c:	00e9c463          	blt	s3,a4,80004d24 <handle_load_page_fault+0x58>
    80004d20:	03070513          	add	a0,a4,48
    80004d24:	ebcfd0ef          	jal	800023e0 <uart_putc>
    80004d28:	ff2412e3          	bne	s0,s2,80004d0c <handle_load_page_fault+0x40>
    80004d2c:	00004517          	auipc	a0,0x4
    80004d30:	06450513          	add	a0,a0,100 # 80008d90 <rodata_start+0xd90>
    80004d34:	ec4fd0ef          	jal	800023f8 <uart_puts>
    80004d38:	00200613          	li	a2,2
    80004d3c:	00048593          	mv	a1,s1
    80004d40:	00413517          	auipc	a0,0x413
    80004d44:	48853503          	ld	a0,1160(a0) # 804181c8 <kernel_pagetable>
    80004d48:	b51fe0ef          	jal	80003898 <handle_page_fault>
    80004d4c:	02050a63          	beqz	a0,80004d80 <handle_load_page_fault+0xb4>
    80004d50:	00006517          	auipc	a0,0x6
    80004d54:	a7850513          	add	a0,a0,-1416 # 8000a7c8 <digits+0x688>
    80004d58:	ea0fd0ef          	jal	800023f8 <uart_puts>
    80004d5c:	02013403          	ld	s0,32(sp)
    80004d60:	02813083          	ld	ra,40(sp)
    80004d64:	01813483          	ld	s1,24(sp)
    80004d68:	01013903          	ld	s2,16(sp)
    80004d6c:	00813983          	ld	s3,8(sp)
    80004d70:	00006517          	auipc	a0,0x6
    80004d74:	a7850513          	add	a0,a0,-1416 # 8000a7e8 <digits+0x6a8>
    80004d78:	03010113          	add	sp,sp,48
    80004d7c:	925fb06f          	j	800006a0 <panic>
    80004d80:	02013403          	ld	s0,32(sp)
    80004d84:	02813083          	ld	ra,40(sp)
    80004d88:	01813483          	ld	s1,24(sp)
    80004d8c:	01013903          	ld	s2,16(sp)
    80004d90:	00813983          	ld	s3,8(sp)
    80004d94:	00006517          	auipc	a0,0x6
    80004d98:	a1450513          	add	a0,a0,-1516 # 8000a7a8 <digits+0x668>
    80004d9c:	03010113          	add	sp,sp,48
    80004da0:	e58fd06f          	j	800023f8 <uart_puts>

0000000080004da4 <handle_store_page_fault>:
    80004da4:	fd010113          	add	sp,sp,-48
    80004da8:	00006517          	auipc	a0,0x6
    80004dac:	a5050513          	add	a0,a0,-1456 # 8000a7f8 <digits+0x6b8>
    80004db0:	02113423          	sd	ra,40(sp)
    80004db4:	02813023          	sd	s0,32(sp)
    80004db8:	00913c23          	sd	s1,24(sp)
    80004dbc:	01213823          	sd	s2,16(sp)
    80004dc0:	01313423          	sd	s3,8(sp)
    80004dc4:	e34fd0ef          	jal	800023f8 <uart_puts>
    80004dc8:	143024f3          	csrr	s1,stval
    80004dcc:	00006517          	auipc	a0,0x6
    80004dd0:	95450513          	add	a0,a0,-1708 # 8000a720 <digits+0x5e0>
    80004dd4:	e24fd0ef          	jal	800023f8 <uart_puts>
    80004dd8:	03c00413          	li	s0,60
    80004ddc:	00900993          	li	s3,9
    80004de0:	ffc00913          	li	s2,-4
    80004de4:	0084d7b3          	srl	a5,s1,s0
    80004de8:	00f7f713          	and	a4,a5,15
    80004dec:	ffc4041b          	addw	s0,s0,-4
    80004df0:	03770513          	add	a0,a4,55
    80004df4:	00e9c463          	blt	s3,a4,80004dfc <handle_store_page_fault+0x58>
    80004df8:	03070513          	add	a0,a4,48
    80004dfc:	de4fd0ef          	jal	800023e0 <uart_putc>
    80004e00:	ff2412e3          	bne	s0,s2,80004de4 <handle_store_page_fault+0x40>
    80004e04:	00004517          	auipc	a0,0x4
    80004e08:	f8c50513          	add	a0,a0,-116 # 80008d90 <rodata_start+0xd90>
    80004e0c:	decfd0ef          	jal	800023f8 <uart_puts>
    80004e10:	00400613          	li	a2,4
    80004e14:	00048593          	mv	a1,s1
    80004e18:	00413517          	auipc	a0,0x413
    80004e1c:	3b053503          	ld	a0,944(a0) # 804181c8 <kernel_pagetable>
    80004e20:	a79fe0ef          	jal	80003898 <handle_page_fault>
    80004e24:	02050a63          	beqz	a0,80004e58 <handle_store_page_fault+0xb4>
    80004e28:	00006517          	auipc	a0,0x6
    80004e2c:	a0850513          	add	a0,a0,-1528 # 8000a830 <digits+0x6f0>
    80004e30:	dc8fd0ef          	jal	800023f8 <uart_puts>
    80004e34:	02013403          	ld	s0,32(sp)
    80004e38:	02813083          	ld	ra,40(sp)
    80004e3c:	01813483          	ld	s1,24(sp)
    80004e40:	01013903          	ld	s2,16(sp)
    80004e44:	00813983          	ld	s3,8(sp)
    80004e48:	00006517          	auipc	a0,0x6
    80004e4c:	a0850513          	add	a0,a0,-1528 # 8000a850 <digits+0x710>
    80004e50:	03010113          	add	sp,sp,48
    80004e54:	84dfb06f          	j	800006a0 <panic>
    80004e58:	02013403          	ld	s0,32(sp)
    80004e5c:	02813083          	ld	ra,40(sp)
    80004e60:	01813483          	ld	s1,24(sp)
    80004e64:	01013903          	ld	s2,16(sp)
    80004e68:	00813983          	ld	s3,8(sp)
    80004e6c:	00006517          	auipc	a0,0x6
    80004e70:	9a450513          	add	a0,a0,-1628 # 8000a810 <digits+0x6d0>
    80004e74:	03010113          	add	sp,sp,48
    80004e78:	d80fd06f          	j	800023f8 <uart_puts>

0000000080004e7c <handle_illegal_instruction>:
    80004e7c:	fd010113          	add	sp,sp,-48
    80004e80:	02813023          	sd	s0,32(sp)
    80004e84:	00050413          	mv	s0,a0
    80004e88:	00006517          	auipc	a0,0x6
    80004e8c:	9e050513          	add	a0,a0,-1568 # 8000a868 <digits+0x728>
    80004e90:	02113423          	sd	ra,40(sp)
    80004e94:	00913c23          	sd	s1,24(sp)
    80004e98:	01213823          	sd	s2,16(sp)
    80004e9c:	01313423          	sd	s3,8(sp)
    80004ea0:	d58fd0ef          	jal	800023f8 <uart_puts>
    80004ea4:	00006517          	auipc	a0,0x6
    80004ea8:	9dc50513          	add	a0,a0,-1572 # 8000a880 <digits+0x740>
    80004eac:	d4cfd0ef          	jal	800023f8 <uart_puts>
    80004eb0:	00900913          	li	s2,9
    80004eb4:	10843983          	ld	s3,264(s0)
    80004eb8:	ffc00493          	li	s1,-4
    80004ebc:	03c00413          	li	s0,60
    80004ec0:	0089d7b3          	srl	a5,s3,s0
    80004ec4:	00f7f713          	and	a4,a5,15
    80004ec8:	ffc4041b          	addw	s0,s0,-4
    80004ecc:	03770513          	add	a0,a4,55
    80004ed0:	00e94463          	blt	s2,a4,80004ed8 <handle_illegal_instruction+0x5c>
    80004ed4:	03070513          	add	a0,a4,48
    80004ed8:	d08fd0ef          	jal	800023e0 <uart_putc>
    80004edc:	fe9412e3          	bne	s0,s1,80004ec0 <handle_illegal_instruction+0x44>
    80004ee0:	00004517          	auipc	a0,0x4
    80004ee4:	eb050513          	add	a0,a0,-336 # 80008d90 <rodata_start+0xd90>
    80004ee8:	d10fd0ef          	jal	800023f8 <uart_puts>
    80004eec:	143029f3          	csrr	s3,stval
    80004ef0:	00006517          	auipc	a0,0x6
    80004ef4:	99850513          	add	a0,a0,-1640 # 8000a888 <digits+0x748>
    80004ef8:	d00fd0ef          	jal	800023f8 <uart_puts>
    80004efc:	03c00413          	li	s0,60
    80004f00:	00900913          	li	s2,9
    80004f04:	ffc00493          	li	s1,-4
    80004f08:	0089d7b3          	srl	a5,s3,s0
    80004f0c:	00f7f713          	and	a4,a5,15
    80004f10:	ffc4041b          	addw	s0,s0,-4
    80004f14:	03770513          	add	a0,a4,55
    80004f18:	00e94463          	blt	s2,a4,80004f20 <handle_illegal_instruction+0xa4>
    80004f1c:	03070513          	add	a0,a4,48
    80004f20:	cc0fd0ef          	jal	800023e0 <uart_putc>
    80004f24:	fe9412e3          	bne	s0,s1,80004f08 <handle_illegal_instruction+0x8c>
    80004f28:	00004517          	auipc	a0,0x4
    80004f2c:	e6850513          	add	a0,a0,-408 # 80008d90 <rodata_start+0xd90>
    80004f30:	cc8fd0ef          	jal	800023f8 <uart_puts>
    80004f34:	02013403          	ld	s0,32(sp)
    80004f38:	02813083          	ld	ra,40(sp)
    80004f3c:	01813483          	ld	s1,24(sp)
    80004f40:	01013903          	ld	s2,16(sp)
    80004f44:	00813983          	ld	s3,8(sp)
    80004f48:	00006517          	auipc	a0,0x6
    80004f4c:	95850513          	add	a0,a0,-1704 # 8000a8a0 <digits+0x760>
    80004f50:	03010113          	add	sp,sp,48
    80004f54:	f4cfb06f          	j	800006a0 <panic>

0000000080004f58 <handle_breakpoint>:
    80004f58:	fd010113          	add	sp,sp,-48
    80004f5c:	00913c23          	sd	s1,24(sp)
    80004f60:	00050493          	mv	s1,a0
    80004f64:	00006517          	auipc	a0,0x6
    80004f68:	95450513          	add	a0,a0,-1708 # 8000a8b8 <digits+0x778>
    80004f6c:	02113423          	sd	ra,40(sp)
    80004f70:	02813023          	sd	s0,32(sp)
    80004f74:	01213823          	sd	s2,16(sp)
    80004f78:	01313423          	sd	s3,8(sp)
    80004f7c:	01413023          	sd	s4,0(sp)
    80004f80:	c78fd0ef          	jal	800023f8 <uart_puts>
    80004f84:	00006517          	auipc	a0,0x6
    80004f88:	94450513          	add	a0,a0,-1724 # 8000a8c8 <digits+0x788>
    80004f8c:	c6cfd0ef          	jal	800023f8 <uart_puts>
    80004f90:	1084ba03          	ld	s4,264(s1)
    80004f94:	03c00413          	li	s0,60
    80004f98:	00900993          	li	s3,9
    80004f9c:	ffc00913          	li	s2,-4
    80004fa0:	008a57b3          	srl	a5,s4,s0
    80004fa4:	00f7f713          	and	a4,a5,15
    80004fa8:	ffc4041b          	addw	s0,s0,-4
    80004fac:	03770513          	add	a0,a4,55
    80004fb0:	00e9c463          	blt	s3,a4,80004fb8 <handle_breakpoint+0x60>
    80004fb4:	03070513          	add	a0,a4,48
    80004fb8:	c28fd0ef          	jal	800023e0 <uart_putc>
    80004fbc:	ff2412e3          	bne	s0,s2,80004fa0 <handle_breakpoint+0x48>
    80004fc0:	00004517          	auipc	a0,0x4
    80004fc4:	dd050513          	add	a0,a0,-560 # 80008d90 <rodata_start+0xd90>
    80004fc8:	c30fd0ef          	jal	800023f8 <uart_puts>
    80004fcc:	00006517          	auipc	a0,0x6
    80004fd0:	91450513          	add	a0,a0,-1772 # 8000a8e0 <digits+0x7a0>
    80004fd4:	c24fd0ef          	jal	800023f8 <uart_puts>
    80004fd8:	00006517          	auipc	a0,0x6
    80004fdc:	92050513          	add	a0,a0,-1760 # 8000a8f8 <digits+0x7b8>
    80004fe0:	c18fd0ef          	jal	800023f8 <uart_puts>
    80004fe4:	0084ba03          	ld	s4,8(s1)
    80004fe8:	03c00413          	li	s0,60
    80004fec:	00900993          	li	s3,9
    80004ff0:	ffc00913          	li	s2,-4
    80004ff4:	008a57b3          	srl	a5,s4,s0
    80004ff8:	00f7f713          	and	a4,a5,15
    80004ffc:	ffc4041b          	addw	s0,s0,-4
    80005000:	03770513          	add	a0,a4,55
    80005004:	00e9c463          	blt	s3,a4,8000500c <handle_breakpoint+0xb4>
    80005008:	03070513          	add	a0,a4,48
    8000500c:	bd4fd0ef          	jal	800023e0 <uart_putc>
    80005010:	ff2412e3          	bne	s0,s2,80004ff4 <handle_breakpoint+0x9c>
    80005014:	00004517          	auipc	a0,0x4
    80005018:	d7c50513          	add	a0,a0,-644 # 80008d90 <rodata_start+0xd90>
    8000501c:	bdcfd0ef          	jal	800023f8 <uart_puts>
    80005020:	00006517          	auipc	a0,0x6
    80005024:	8e850513          	add	a0,a0,-1816 # 8000a908 <digits+0x7c8>
    80005028:	bd0fd0ef          	jal	800023f8 <uart_puts>
    8000502c:	0104ba03          	ld	s4,16(s1)
    80005030:	03c00413          	li	s0,60
    80005034:	00900993          	li	s3,9
    80005038:	ffc00913          	li	s2,-4
    8000503c:	008a57b3          	srl	a5,s4,s0
    80005040:	00f7f713          	and	a4,a5,15
    80005044:	ffc4041b          	addw	s0,s0,-4
    80005048:	03770513          	add	a0,a4,55
    8000504c:	00e9c463          	blt	s3,a4,80005054 <handle_breakpoint+0xfc>
    80005050:	03070513          	add	a0,a4,48
    80005054:	b8cfd0ef          	jal	800023e0 <uart_putc>
    80005058:	ff2412e3          	bne	s0,s2,8000503c <handle_breakpoint+0xe4>
    8000505c:	00004517          	auipc	a0,0x4
    80005060:	d3450513          	add	a0,a0,-716 # 80008d90 <rodata_start+0xd90>
    80005064:	b94fd0ef          	jal	800023f8 <uart_puts>
    80005068:	00006517          	auipc	a0,0x6
    8000506c:	8b050513          	add	a0,a0,-1872 # 8000a918 <digits+0x7d8>
    80005070:	b88fd0ef          	jal	800023f8 <uart_puts>
    80005074:	0504ba03          	ld	s4,80(s1)
    80005078:	03c00413          	li	s0,60
    8000507c:	00900993          	li	s3,9
    80005080:	ffc00913          	li	s2,-4
    80005084:	008a57b3          	srl	a5,s4,s0
    80005088:	00f7f713          	and	a4,a5,15
    8000508c:	ffc4041b          	addw	s0,s0,-4
    80005090:	03770513          	add	a0,a4,55
    80005094:	00e9c463          	blt	s3,a4,8000509c <handle_breakpoint+0x144>
    80005098:	03070513          	add	a0,a4,48
    8000509c:	b44fd0ef          	jal	800023e0 <uart_putc>
    800050a0:	ff2412e3          	bne	s0,s2,80005084 <handle_breakpoint+0x12c>
    800050a4:	00004517          	auipc	a0,0x4
    800050a8:	cec50513          	add	a0,a0,-788 # 80008d90 <rodata_start+0xd90>
    800050ac:	b4cfd0ef          	jal	800023f8 <uart_puts>
    800050b0:	1084b783          	ld	a5,264(s1)
    800050b4:	02813083          	ld	ra,40(sp)
    800050b8:	02013403          	ld	s0,32(sp)
    800050bc:	00478793          	add	a5,a5,4
    800050c0:	10f4b423          	sd	a5,264(s1)
    800050c4:	01013903          	ld	s2,16(sp)
    800050c8:	01813483          	ld	s1,24(sp)
    800050cc:	00813983          	ld	s3,8(sp)
    800050d0:	00013a03          	ld	s4,0(sp)
    800050d4:	03010113          	add	sp,sp,48
    800050d8:	00008067          	ret

00000000800050dc <handle_misaligned_access>:
    800050dc:	f9010113          	add	sp,sp,-112
    800050e0:	00006517          	auipc	a0,0x6
    800050e4:	84850513          	add	a0,a0,-1976 # 8000a928 <digits+0x7e8>
    800050e8:	05413023          	sd	s4,64(sp)
    800050ec:	06113423          	sd	ra,104(sp)
    800050f0:	06813023          	sd	s0,96(sp)
    800050f4:	04913c23          	sd	s1,88(sp)
    800050f8:	05213823          	sd	s2,80(sp)
    800050fc:	05313423          	sd	s3,72(sp)
    80005100:	00058a13          	mv	s4,a1
    80005104:	af4fd0ef          	jal	800023f8 <uart_puts>
    80005108:	143029f3          	csrr	s3,stval
    8000510c:	00006517          	auipc	a0,0x6
    80005110:	83450513          	add	a0,a0,-1996 # 8000a940 <digits+0x800>
    80005114:	ae4fd0ef          	jal	800023f8 <uart_puts>
    80005118:	03c00413          	li	s0,60
    8000511c:	00900913          	li	s2,9
    80005120:	ffc00493          	li	s1,-4
    80005124:	0089d7b3          	srl	a5,s3,s0
    80005128:	00f7f713          	and	a4,a5,15
    8000512c:	ffc4041b          	addw	s0,s0,-4
    80005130:	03770513          	add	a0,a4,55
    80005134:	00e94463          	blt	s2,a4,8000513c <handle_misaligned_access+0x60>
    80005138:	03070513          	add	a0,a4,48
    8000513c:	aa4fd0ef          	jal	800023e0 <uart_putc>
    80005140:	fe9412e3          	bne	s0,s1,80005124 <handle_misaligned_access+0x48>
    80005144:	00004517          	auipc	a0,0x4
    80005148:	c4c50513          	add	a0,a0,-948 # 80008d90 <rodata_start+0xd90>
    8000514c:	aacfd0ef          	jal	800023f8 <uart_puts>
    80005150:	00006797          	auipc	a5,0x6
    80005154:	ba078793          	add	a5,a5,-1120 # 8000acf0 <trap_names>
    80005158:	0807b803          	ld	a6,128(a5)
    8000515c:	0887b503          	ld	a0,136(a5)
    80005160:	0907b583          	ld	a1,144(a5)
    80005164:	0987b603          	ld	a2,152(a5)
    80005168:	0a07b683          	ld	a3,160(a5)
    8000516c:	0a87b703          	ld	a4,168(a5)
    80005170:	0b07b783          	ld	a5,176(a5)
    80005174:	01013423          	sd	a6,8(sp)
    80005178:	00a13823          	sd	a0,16(sp)
    8000517c:	02f13c23          	sd	a5,56(sp)
    80005180:	00b13c23          	sd	a1,24(sp)
    80005184:	02c13023          	sd	a2,32(sp)
    80005188:	02d13423          	sd	a3,40(sp)
    8000518c:	02e13823          	sd	a4,48(sp)
    80005190:	00600793          	li	a5,6
    80005194:	0347f663          	bgeu	a5,s4,800051c0 <handle_misaligned_access+0xe4>
    80005198:	06013403          	ld	s0,96(sp)
    8000519c:	06813083          	ld	ra,104(sp)
    800051a0:	05813483          	ld	s1,88(sp)
    800051a4:	05013903          	ld	s2,80(sp)
    800051a8:	04813983          	ld	s3,72(sp)
    800051ac:	04013a03          	ld	s4,64(sp)
    800051b0:	00005517          	auipc	a0,0x5
    800051b4:	7b850513          	add	a0,a0,1976 # 8000a968 <digits+0x828>
    800051b8:	07010113          	add	sp,sp,112
    800051bc:	ce4fb06f          	j	800006a0 <panic>
    800051c0:	00005517          	auipc	a0,0x5
    800051c4:	79850513          	add	a0,a0,1944 # 8000a958 <digits+0x818>
    800051c8:	a30fd0ef          	jal	800023f8 <uart_puts>
    800051cc:	003a1a13          	sll	s4,s4,0x3
    800051d0:	040a0793          	add	a5,s4,64
    800051d4:	00278a33          	add	s4,a5,sp
    800051d8:	fc8a3503          	ld	a0,-56(s4)
    800051dc:	a1cfd0ef          	jal	800023f8 <uart_puts>
    800051e0:	00004517          	auipc	a0,0x4
    800051e4:	bb050513          	add	a0,a0,-1104 # 80008d90 <rodata_start+0xd90>
    800051e8:	a10fd0ef          	jal	800023f8 <uart_puts>
    800051ec:	fadff06f          	j	80005198 <handle_misaligned_access+0xbc>

00000000800051f0 <handle_access_fault>:
    800051f0:	f9010113          	add	sp,sp,-112
    800051f4:	00005517          	auipc	a0,0x5
    800051f8:	78c50513          	add	a0,a0,1932 # 8000a980 <digits+0x840>
    800051fc:	05413023          	sd	s4,64(sp)
    80005200:	06113423          	sd	ra,104(sp)
    80005204:	06813023          	sd	s0,96(sp)
    80005208:	04913c23          	sd	s1,88(sp)
    8000520c:	05213823          	sd	s2,80(sp)
    80005210:	05313423          	sd	s3,72(sp)
    80005214:	00058a13          	mv	s4,a1
    80005218:	9e0fd0ef          	jal	800023f8 <uart_puts>
    8000521c:	143029f3          	csrr	s3,stval
    80005220:	00005517          	auipc	a0,0x5
    80005224:	50050513          	add	a0,a0,1280 # 8000a720 <digits+0x5e0>
    80005228:	9d0fd0ef          	jal	800023f8 <uart_puts>
    8000522c:	03c00413          	li	s0,60
    80005230:	00900913          	li	s2,9
    80005234:	ffc00493          	li	s1,-4
    80005238:	0089d7b3          	srl	a5,s3,s0
    8000523c:	00f7f713          	and	a4,a5,15
    80005240:	ffc4041b          	addw	s0,s0,-4
    80005244:	03770513          	add	a0,a4,55
    80005248:	00e94463          	blt	s2,a4,80005250 <handle_access_fault+0x60>
    8000524c:	03070513          	add	a0,a4,48
    80005250:	990fd0ef          	jal	800023e0 <uart_putc>
    80005254:	fe9412e3          	bne	s0,s1,80005238 <handle_access_fault+0x48>
    80005258:	00004517          	auipc	a0,0x4
    8000525c:	b3850513          	add	a0,a0,-1224 # 80008d90 <rodata_start+0xd90>
    80005260:	998fd0ef          	jal	800023f8 <uart_puts>
    80005264:	00006797          	auipc	a5,0x6
    80005268:	a8c78793          	add	a5,a5,-1396 # 8000acf0 <trap_names>
    8000526c:	0b87b883          	ld	a7,184(a5)
    80005270:	0c07b803          	ld	a6,192(a5)
    80005274:	0c87b503          	ld	a0,200(a5)
    80005278:	0d07b583          	ld	a1,208(a5)
    8000527c:	0d87b603          	ld	a2,216(a5)
    80005280:	0e07b683          	ld	a3,224(a5)
    80005284:	0e87b703          	ld	a4,232(a5)
    80005288:	0f07b783          	ld	a5,240(a5)
    8000528c:	01113023          	sd	a7,0(sp)
    80005290:	01013423          	sd	a6,8(sp)
    80005294:	02f13c23          	sd	a5,56(sp)
    80005298:	00a13823          	sd	a0,16(sp)
    8000529c:	00b13c23          	sd	a1,24(sp)
    800052a0:	02c13023          	sd	a2,32(sp)
    800052a4:	02d13423          	sd	a3,40(sp)
    800052a8:	02e13823          	sd	a4,48(sp)
    800052ac:	00700793          	li	a5,7
    800052b0:	0347f663          	bgeu	a5,s4,800052dc <handle_access_fault+0xec>
    800052b4:	06013403          	ld	s0,96(sp)
    800052b8:	06813083          	ld	ra,104(sp)
    800052bc:	05813483          	ld	s1,88(sp)
    800052c0:	05013903          	ld	s2,80(sp)
    800052c4:	04813983          	ld	s3,72(sp)
    800052c8:	04013a03          	ld	s4,64(sp)
    800052cc:	00005517          	auipc	a0,0x5
    800052d0:	6dc50513          	add	a0,a0,1756 # 8000a9a8 <digits+0x868>
    800052d4:	07010113          	add	sp,sp,112
    800052d8:	bc8fb06f          	j	800006a0 <panic>
    800052dc:	00005517          	auipc	a0,0x5
    800052e0:	6bc50513          	add	a0,a0,1724 # 8000a998 <digits+0x858>
    800052e4:	914fd0ef          	jal	800023f8 <uart_puts>
    800052e8:	003a1a13          	sll	s4,s4,0x3
    800052ec:	040a0793          	add	a5,s4,64
    800052f0:	00278a33          	add	s4,a5,sp
    800052f4:	fc0a3503          	ld	a0,-64(s4)
    800052f8:	900fd0ef          	jal	800023f8 <uart_puts>
    800052fc:	00004517          	auipc	a0,0x4
    80005300:	a9450513          	add	a0,a0,-1388 # 80008d90 <rodata_start+0xd90>
    80005304:	8f4fd0ef          	jal	800023f8 <uart_puts>
    80005308:	fadff06f          	j	800052b4 <handle_access_fault+0xc4>

000000008000530c <handle_exception>:
    8000530c:	fe010113          	add	sp,sp,-32
    80005310:	00813823          	sd	s0,16(sp)
    80005314:	00050413          	mv	s0,a0
    80005318:	00005517          	auipc	a0,0x5
    8000531c:	6a050513          	add	a0,a0,1696 # 8000a9b8 <digits+0x878>
    80005320:	00913423          	sd	s1,8(sp)
    80005324:	00113c23          	sd	ra,24(sp)
    80005328:	00058493          	mv	s1,a1
    8000532c:	8ccfd0ef          	jal	800023f8 <uart_puts>
    80005330:	00f00793          	li	a5,15
    80005334:	00005517          	auipc	a0,0x5
    80005338:	09450513          	add	a0,a0,148 # 8000a3c8 <digits+0x288>
    8000533c:	0087ee63          	bltu	a5,s0,80005358 <handle_exception+0x4c>
    80005340:	00341713          	sll	a4,s0,0x3
    80005344:	00006797          	auipc	a5,0x6
    80005348:	9ac78793          	add	a5,a5,-1620 # 8000acf0 <trap_names>
    8000534c:	00e787b3          	add	a5,a5,a4
    80005350:	0007b503          	ld	a0,0(a5)
    80005354:	04050663          	beqz	a0,800053a0 <handle_exception+0x94>
    80005358:	8a0fd0ef          	jal	800023f8 <uart_puts>
    8000535c:	00004517          	auipc	a0,0x4
    80005360:	a3450513          	add	a0,a0,-1484 # 80008d90 <rodata_start+0xd90>
    80005364:	894fd0ef          	jal	800023f8 <uart_puts>
    80005368:	0040f717          	auipc	a4,0x40f
    8000536c:	d4070713          	add	a4,a4,-704 # 804140a8 <ic>
    80005370:	24073783          	ld	a5,576(a4)
    80005374:	00f00693          	li	a3,15
    80005378:	00178793          	add	a5,a5,1
    8000537c:	24f73023          	sd	a5,576(a4)
    80005380:	0686ee63          	bltu	a3,s0,800053fc <handle_exception+0xf0>
    80005384:	00006717          	auipc	a4,0x6
    80005388:	92c70713          	add	a4,a4,-1748 # 8000acb0 <digits+0xb70>
    8000538c:	00241793          	sll	a5,s0,0x2
    80005390:	00e787b3          	add	a5,a5,a4
    80005394:	0007a783          	lw	a5,0(a5)
    80005398:	00e787b3          	add	a5,a5,a4
    8000539c:	00078067          	jr	a5
    800053a0:	00005517          	auipc	a0,0x5
    800053a4:	02850513          	add	a0,a0,40 # 8000a3c8 <digits+0x288>
    800053a8:	fb1ff06f          	j	80005358 <handle_exception+0x4c>
    800053ac:	00040593          	mv	a1,s0
    800053b0:	01013403          	ld	s0,16(sp)
    800053b4:	01813083          	ld	ra,24(sp)
    800053b8:	00048513          	mv	a0,s1
    800053bc:	00813483          	ld	s1,8(sp)
    800053c0:	02010113          	add	sp,sp,32
    800053c4:	e2dff06f          	j	800051f0 <handle_access_fault>
    800053c8:	00040593          	mv	a1,s0
    800053cc:	01013403          	ld	s0,16(sp)
    800053d0:	01813083          	ld	ra,24(sp)
    800053d4:	00048513          	mv	a0,s1
    800053d8:	00813483          	ld	s1,8(sp)
    800053dc:	02010113          	add	sp,sp,32
    800053e0:	cfdff06f          	j	800050dc <handle_misaligned_access>
    800053e4:	01013403          	ld	s0,16(sp)
    800053e8:	01813083          	ld	ra,24(sp)
    800053ec:	00048513          	mv	a0,s1
    800053f0:	00813483          	ld	s1,8(sp)
    800053f4:	02010113          	add	sp,sp,32
    800053f8:	f4cff06f          	j	80004b44 <handle_syscall>
    800053fc:	00005517          	auipc	a0,0x5
    80005400:	5cc50513          	add	a0,a0,1484 # 8000a9c8 <digits+0x888>
    80005404:	ff5fc0ef          	jal	800023f8 <uart_puts>
    80005408:	00040513          	mv	a0,s0
    8000540c:	b61fe0ef          	jal	80003f6c <print_decimal>
    80005410:	00004517          	auipc	a0,0x4
    80005414:	98050513          	add	a0,a0,-1664 # 80008d90 <rodata_start+0xd90>
    80005418:	fe1fc0ef          	jal	800023f8 <uart_puts>
    8000541c:	01013403          	ld	s0,16(sp)
    80005420:	01813083          	ld	ra,24(sp)
    80005424:	00813483          	ld	s1,8(sp)
    80005428:	00005517          	auipc	a0,0x5
    8000542c:	5b850513          	add	a0,a0,1464 # 8000a9e0 <digits+0x8a0>
    80005430:	02010113          	add	sp,sp,32
    80005434:	a6cfb06f          	j	800006a0 <panic>
    80005438:	01013403          	ld	s0,16(sp)
    8000543c:	01813083          	ld	ra,24(sp)
    80005440:	00048513          	mv	a0,s1
    80005444:	00813483          	ld	s1,8(sp)
    80005448:	02010113          	add	sp,sp,32
    8000544c:	b0dff06f          	j	80004f58 <handle_breakpoint>
    80005450:	01013403          	ld	s0,16(sp)
    80005454:	01813083          	ld	ra,24(sp)
    80005458:	00048513          	mv	a0,s1
    8000545c:	00813483          	ld	s1,8(sp)
    80005460:	02010113          	add	sp,sp,32
    80005464:	f90ff06f          	j	80004bf4 <handle_instruction_page_fault>
    80005468:	01013403          	ld	s0,16(sp)
    8000546c:	01813083          	ld	ra,24(sp)
    80005470:	00048513          	mv	a0,s1
    80005474:	00813483          	ld	s1,8(sp)
    80005478:	02010113          	add	sp,sp,32
    8000547c:	851ff06f          	j	80004ccc <handle_load_page_fault>
    80005480:	01013403          	ld	s0,16(sp)
    80005484:	01813083          	ld	ra,24(sp)
    80005488:	00048513          	mv	a0,s1
    8000548c:	00813483          	ld	s1,8(sp)
    80005490:	02010113          	add	sp,sp,32
    80005494:	9e9ff06f          	j	80004e7c <handle_illegal_instruction>
    80005498:	01013403          	ld	s0,16(sp)
    8000549c:	01813083          	ld	ra,24(sp)
    800054a0:	00048513          	mv	a0,s1
    800054a4:	00813483          	ld	s1,8(sp)
    800054a8:	02010113          	add	sp,sp,32
    800054ac:	8f9ff06f          	j	80004da4 <handle_store_page_fault>

00000000800054b0 <trap_handler>:
    800054b0:	0040f717          	auipc	a4,0x40f
    800054b4:	bf870713          	add	a4,a4,-1032 # 804140a8 <ic>
    800054b8:	22073783          	ld	a5,544(a4)
    800054bc:	00050593          	mv	a1,a0
    800054c0:	00178793          	add	a5,a5,1
    800054c4:	22f73023          	sd	a5,544(a4)
    800054c8:	142027f3          	csrr	a5,scause
    800054cc:	0007851b          	sext.w	a0,a5
    800054d0:	0007d463          	bgez	a5,800054d8 <trap_handler+0x28>
    800054d4:	fc9fe06f          	j	8000449c <handle_interrupt>
    800054d8:	e35ff06f          	j	8000530c <handle_exception>

00000000800054dc <user_trap_handler>:
    800054dc:	ff010113          	add	sp,sp,-16
    800054e0:	00813023          	sd	s0,0(sp)
    800054e4:	00113423          	sd	ra,8(sp)
    800054e8:	00050413          	mv	s0,a0
    800054ec:	14202773          	csrr	a4,scause
    800054f0:	10053783          	ld	a5,256(a0)
    800054f4:	1007f793          	and	a5,a5,256
    800054f8:	02079863          	bnez	a5,80005528 <user_trap_handler+0x4c>
    800054fc:	0007051b          	sext.w	a0,a4
    80005500:	00040593          	mv	a1,s0
    80005504:	00075a63          	bgez	a4,80005518 <user_trap_handler+0x3c>
    80005508:	00013403          	ld	s0,0(sp)
    8000550c:	00813083          	ld	ra,8(sp)
    80005510:	01010113          	add	sp,sp,16
    80005514:	f89fe06f          	j	8000449c <handle_interrupt>
    80005518:	00013403          	ld	s0,0(sp)
    8000551c:	00813083          	ld	ra,8(sp)
    80005520:	01010113          	add	sp,sp,16
    80005524:	de9ff06f          	j	8000530c <handle_exception>
    80005528:	00005517          	auipc	a0,0x5
    8000552c:	4d050513          	add	a0,a0,1232 # 8000a9f8 <digits+0x8b8>
    80005530:	ec9fc0ef          	jal	800023f8 <uart_puts>
    80005534:	00040513          	mv	a0,s0
    80005538:	92cff0ef          	jal	80004664 <dump_trap_frame>
    8000553c:	0000006f          	j	8000553c <user_trap_handler+0x60>

0000000080005540 <minimal_interrupt_handler>:
    80005540:	00050593          	mv	a1,a0
    80005544:	142027f3          	csrr	a5,scause
    80005548:	0040f697          	auipc	a3,0x40f
    8000554c:	b6068693          	add	a3,a3,-1184 # 804140a8 <ic>
    80005550:	2206b703          	ld	a4,544(a3)
    80005554:	0007879b          	sext.w	a5,a5
    80005558:	00500613          	li	a2,5
    8000555c:	00170713          	add	a4,a4,1
    80005560:	02c79063          	bne	a5,a2,80005580 <minimal_interrupt_handler+0x40>
    80005564:	00413797          	auipc	a5,0x413
    80005568:	c6c7a783          	lw	a5,-916(a5) # 804181d0 <timer_ticks.0>
    8000556c:	0017879b          	addw	a5,a5,1
    80005570:	22e6b023          	sd	a4,544(a3)
    80005574:	00413717          	auipc	a4,0x413
    80005578:	c4f72e23          	sw	a5,-932(a4) # 804181d0 <timer_ticks.0>
    8000557c:	00008067          	ret
    80005580:	22e6b023          	sd	a4,544(a3)
    80005584:	142027f3          	csrr	a5,scause
    80005588:	0007851b          	sext.w	a0,a5
    8000558c:	0007d463          	bgez	a5,80005594 <minimal_interrupt_handler+0x54>
    80005590:	f0dfe06f          	j	8000449c <handle_interrupt>
    80005594:	d79ff06f          	j	8000530c <handle_exception>

0000000080005598 <fast_interrupt_handler>:
    80005598:	00050613          	mv	a2,a0
    8000559c:	142027f3          	csrr	a5,scause
    800055a0:	0040f717          	auipc	a4,0x40f
    800055a4:	b0870713          	add	a4,a4,-1272 # 804140a8 <ic>
    800055a8:	22073683          	ld	a3,544(a4)
    800055ac:	43f7d813          	sra	a6,a5,0x3f
    800055b0:	fff00593          	li	a1,-1
    800055b4:	00168513          	add	a0,a3,1
    800055b8:	22a73023          	sd	a0,544(a4)
    800055bc:	06b81463          	bne	a6,a1,80005624 <fast_interrupt_handler+0x8c>
    800055c0:	0007879b          	sext.w	a5,a5
    800055c4:	00100593          	li	a1,1
    800055c8:	04b78263          	beq	a5,a1,8000560c <fast_interrupt_handler+0x74>
    800055cc:	00500593          	li	a1,5
    800055d0:	02b78263          	beq	a5,a1,800055f4 <fast_interrupt_handler+0x5c>
    800055d4:	00268693          	add	a3,a3,2
    800055d8:	22d73023          	sd	a3,544(a4)
    800055dc:	14202573          	csrr	a0,scause
    800055e0:	43f55793          	sra	a5,a0,0x3f
    800055e4:	00060593          	mv	a1,a2
    800055e8:	0005051b          	sext.w	a0,a0
    800055ec:	05079663          	bne	a5,a6,80005638 <fast_interrupt_handler+0xa0>
    800055f0:	eadfe06f          	j	8000449c <handle_interrupt>
    800055f4:	02873783          	ld	a5,40(a4)
    800055f8:	04078663          	beqz	a5,80005644 <fast_interrupt_handler+0xac>
    800055fc:	0007b703          	ld	a4,0(a5)
    80005600:	0087b583          	ld	a1,8(a5)
    80005604:	00500513          	li	a0,5
    80005608:	00070067          	jr	a4
    8000560c:	00873783          	ld	a5,8(a4)
    80005610:	02078a63          	beqz	a5,80005644 <fast_interrupt_handler+0xac>
    80005614:	0007b703          	ld	a4,0(a5)
    80005618:	0087b583          	ld	a1,8(a5)
    8000561c:	00100513          	li	a0,1
    80005620:	00070067          	jr	a4
    80005624:	14202573          	csrr	a0,scause
    80005628:	43f55793          	sra	a5,a0,0x3f
    8000562c:	0005051b          	sext.w	a0,a0
    80005630:	00b78663          	beq	a5,a1,8000563c <fast_interrupt_handler+0xa4>
    80005634:	00060593          	mv	a1,a2
    80005638:	cd5ff06f          	j	8000530c <handle_exception>
    8000563c:	00060593          	mv	a1,a2
    80005640:	e5dfe06f          	j	8000449c <handle_interrupt>
    80005644:	00008067          	ret

0000000080005648 <handle_environment_call>:
    80005648:	fe010113          	add	sp,sp,-32
    8000564c:	00913423          	sd	s1,8(sp)
    80005650:	00050493          	mv	s1,a0
    80005654:	00005517          	auipc	a0,0x5
    80005658:	3e450513          	add	a0,a0,996 # 8000aa38 <digits+0x8f8>
    8000565c:	00813823          	sd	s0,16(sp)
    80005660:	00113c23          	sd	ra,24(sp)
    80005664:	00058413          	mv	s0,a1
    80005668:	d91fc0ef          	jal	800023f8 <uart_puts>
    8000566c:	00800793          	li	a5,8
    80005670:	02f40a63          	beq	s0,a5,800056a4 <handle_environment_call+0x5c>
    80005674:	00900793          	li	a5,9
    80005678:	04f40863          	beq	s0,a5,800056c8 <handle_environment_call+0x80>
    8000567c:	00005517          	auipc	a0,0x5
    80005680:	42450513          	add	a0,a0,1060 # 8000aaa0 <digits+0x960>
    80005684:	d75fc0ef          	jal	800023f8 <uart_puts>
    80005688:	01013403          	ld	s0,16(sp)
    8000568c:	01813083          	ld	ra,24(sp)
    80005690:	00813483          	ld	s1,8(sp)
    80005694:	00005517          	auipc	a0,0x5
    80005698:	42c50513          	add	a0,a0,1068 # 8000aac0 <digits+0x980>
    8000569c:	02010113          	add	sp,sp,32
    800056a0:	800fb06f          	j	800006a0 <panic>
    800056a4:	00005517          	auipc	a0,0x5
    800056a8:	3ac50513          	add	a0,a0,940 # 8000aa50 <digits+0x910>
    800056ac:	d4dfc0ef          	jal	800023f8 <uart_puts>
    800056b0:	01013403          	ld	s0,16(sp)
    800056b4:	01813083          	ld	ra,24(sp)
    800056b8:	00048513          	mv	a0,s1
    800056bc:	00813483          	ld	s1,8(sp)
    800056c0:	02010113          	add	sp,sp,32
    800056c4:	c80ff06f          	j	80004b44 <handle_syscall>
    800056c8:	00005517          	auipc	a0,0x5
    800056cc:	3b050513          	add	a0,a0,944 # 8000aa78 <digits+0x938>
    800056d0:	d29fc0ef          	jal	800023f8 <uart_puts>
    800056d4:	1084b783          	ld	a5,264(s1)
    800056d8:	01813083          	ld	ra,24(sp)
    800056dc:	01013403          	ld	s0,16(sp)
    800056e0:	00478793          	add	a5,a5,4
    800056e4:	10f4b423          	sd	a5,264(s1)
    800056e8:	00813483          	ld	s1,8(sp)
    800056ec:	02010113          	add	sp,sp,32
    800056f0:	00008067          	ret
	...

0000000080005700 <trap_entry>:
    80005700:	ef010113          	add	sp,sp,-272
    80005704:	00013023          	sd	zero,0(sp)
    80005708:	00113423          	sd	ra,8(sp)
    8000570c:	00213823          	sd	sp,16(sp)
    80005710:	00313c23          	sd	gp,24(sp)
    80005714:	02413023          	sd	tp,32(sp)
    80005718:	02513423          	sd	t0,40(sp)
    8000571c:	02613823          	sd	t1,48(sp)
    80005720:	02713c23          	sd	t2,56(sp)
    80005724:	04813023          	sd	s0,64(sp)
    80005728:	04913423          	sd	s1,72(sp)
    8000572c:	04a13823          	sd	a0,80(sp)
    80005730:	04b13c23          	sd	a1,88(sp)
    80005734:	06c13023          	sd	a2,96(sp)
    80005738:	06d13423          	sd	a3,104(sp)
    8000573c:	06e13823          	sd	a4,112(sp)
    80005740:	06f13c23          	sd	a5,120(sp)
    80005744:	09013023          	sd	a6,128(sp)
    80005748:	09113423          	sd	a7,136(sp)
    8000574c:	09213823          	sd	s2,144(sp)
    80005750:	09313c23          	sd	s3,152(sp)
    80005754:	0b413023          	sd	s4,160(sp)
    80005758:	0b513423          	sd	s5,168(sp)
    8000575c:	0b613823          	sd	s6,176(sp)
    80005760:	0b713c23          	sd	s7,184(sp)
    80005764:	0d813023          	sd	s8,192(sp)
    80005768:	0d913423          	sd	s9,200(sp)
    8000576c:	0da13823          	sd	s10,208(sp)
    80005770:	0db13c23          	sd	s11,216(sp)
    80005774:	0fc13023          	sd	t3,224(sp)
    80005778:	0fd13423          	sd	t4,232(sp)
    8000577c:	0fe13823          	sd	t5,240(sp)
    80005780:	0ff13c23          	sd	t6,248(sp)
    80005784:	11010293          	add	t0,sp,272
    80005788:	00513823          	sd	t0,16(sp)
    8000578c:	100022f3          	csrr	t0,sstatus
    80005790:	10513023          	sd	t0,256(sp)
    80005794:	141022f3          	csrr	t0,sepc
    80005798:	10513423          	sd	t0,264(sp)
    8000579c:	00010513          	mv	a0,sp
    800057a0:	d11ff0ef          	jal	800054b0 <trap_handler>
    800057a4:	0040006f          	j	800057a8 <trap_return>

00000000800057a8 <trap_return>:
    800057a8:	00050113          	mv	sp,a0
    800057ac:	10013283          	ld	t0,256(sp)
    800057b0:	10029073          	csrw	sstatus,t0
    800057b4:	10813283          	ld	t0,264(sp)
    800057b8:	14129073          	csrw	sepc,t0
    800057bc:	00813083          	ld	ra,8(sp)
    800057c0:	01813183          	ld	gp,24(sp)
    800057c4:	02013203          	ld	tp,32(sp)
    800057c8:	02813283          	ld	t0,40(sp)
    800057cc:	03013303          	ld	t1,48(sp)
    800057d0:	03813383          	ld	t2,56(sp)
    800057d4:	04013403          	ld	s0,64(sp)
    800057d8:	04813483          	ld	s1,72(sp)
    800057dc:	05013503          	ld	a0,80(sp)
    800057e0:	05813583          	ld	a1,88(sp)
    800057e4:	06013603          	ld	a2,96(sp)
    800057e8:	06813683          	ld	a3,104(sp)
    800057ec:	07013703          	ld	a4,112(sp)
    800057f0:	07813783          	ld	a5,120(sp)
    800057f4:	08013803          	ld	a6,128(sp)
    800057f8:	08813883          	ld	a7,136(sp)
    800057fc:	09013903          	ld	s2,144(sp)
    80005800:	09813983          	ld	s3,152(sp)
    80005804:	0a013a03          	ld	s4,160(sp)
    80005808:	0a813a83          	ld	s5,168(sp)
    8000580c:	0b013b03          	ld	s6,176(sp)
    80005810:	0b813b83          	ld	s7,184(sp)
    80005814:	0c013c03          	ld	s8,192(sp)
    80005818:	0c813c83          	ld	s9,200(sp)
    8000581c:	0d013d03          	ld	s10,208(sp)
    80005820:	0d813d83          	ld	s11,216(sp)
    80005824:	0e013e03          	ld	t3,224(sp)
    80005828:	0e813e83          	ld	t4,232(sp)
    8000582c:	0f013f03          	ld	t5,240(sp)
    80005830:	0f813f83          	ld	t6,248(sp)
    80005834:	01013103          	ld	sp,16(sp)
    80005838:	10200073          	sret

000000008000583c <kernel_trap_vector>:
    8000583c:	ec5ff06f          	j	80005700 <trap_entry>

0000000080005840 <fast_trap_return>:
    80005840:	10013283          	ld	t0,256(sp)
    80005844:	10029073          	csrw	sstatus,t0
    80005848:	10813283          	ld	t0,264(sp)
    8000584c:	14129073          	csrw	sepc,t0
    80005850:	00813083          	ld	ra,8(sp)
    80005854:	05013503          	ld	a0,80(sp)
    80005858:	05813583          	ld	a1,88(sp)
    8000585c:	11010113          	add	sp,sp,272
    80005860:	10200073          	sret

0000000080005864 <disable_interrupts_asm>:
    80005864:	10017073          	csrc	sstatus,2
    80005868:	00008067          	ret

000000008000586c <enable_interrupts_asm>:
    8000586c:	10016073          	csrs	sstatus,2
    80005870:	00008067          	ret

0000000080005874 <read_interrupt_status>:
    80005874:	10002573          	csrr	a0,sstatus
    80005878:	00257513          	and	a0,a0,2
    8000587c:	00008067          	ret

0000000080005880 <kernelvec>:
    80005880:	ed810113          	add	sp,sp,-296
    80005884:	00113423          	sd	ra,8(sp)
    80005888:	00213823          	sd	sp,16(sp)
    8000588c:	00313c23          	sd	gp,24(sp)
    80005890:	02413023          	sd	tp,32(sp)
    80005894:	02513423          	sd	t0,40(sp)
    80005898:	02613823          	sd	t1,48(sp)
    8000589c:	02713c23          	sd	t2,56(sp)
    800058a0:	04813023          	sd	s0,64(sp)
    800058a4:	04913423          	sd	s1,72(sp)
    800058a8:	04a13823          	sd	a0,80(sp)
    800058ac:	04b13c23          	sd	a1,88(sp)
    800058b0:	06c13023          	sd	a2,96(sp)
    800058b4:	06d13423          	sd	a3,104(sp)
    800058b8:	06e13823          	sd	a4,112(sp)
    800058bc:	06f13c23          	sd	a5,120(sp)
    800058c0:	09013023          	sd	a6,128(sp)
    800058c4:	09113423          	sd	a7,136(sp)
    800058c8:	09213823          	sd	s2,144(sp)
    800058cc:	09313c23          	sd	s3,152(sp)
    800058d0:	0b413023          	sd	s4,160(sp)
    800058d4:	0b513423          	sd	s5,168(sp)
    800058d8:	0b613823          	sd	s6,176(sp)
    800058dc:	0b713c23          	sd	s7,184(sp)
    800058e0:	0d813023          	sd	s8,192(sp)
    800058e4:	0d913423          	sd	s9,200(sp)
    800058e8:	0da13823          	sd	s10,208(sp)
    800058ec:	0db13c23          	sd	s11,216(sp)
    800058f0:	0fc13023          	sd	t3,224(sp)
    800058f4:	0fd13423          	sd	t4,232(sp)
    800058f8:	0fe13823          	sd	t5,240(sp)
    800058fc:	0ff13c23          	sd	t6,248(sp)
    80005900:	12810293          	add	t0,sp,296
    80005904:	00513823          	sd	t0,16(sp)
    80005908:	100022f3          	csrr	t0,sstatus
    8000590c:	10513023          	sd	t0,256(sp)
    80005910:	141022f3          	csrr	t0,sepc
    80005914:	10513423          	sd	t0,264(sp)
    80005918:	142022f3          	csrr	t0,scause
    8000591c:	10513823          	sd	t0,272(sp)
    80005920:	143022f3          	csrr	t0,stval
    80005924:	10513c23          	sd	t0,280(sp)
    80005928:	140022f3          	csrr	t0,sscratch
    8000592c:	12513023          	sd	t0,288(sp)
    80005930:	00010513          	mv	a0,sp
    80005934:	44c000ef          	jal	80005d80 <enter_interrupt_handler>
    80005938:	22051663          	bnez	a0,80005b64 <kernel_panic>
    8000593c:	00010513          	mv	a0,sp
    80005940:	b71ff0ef          	jal	800054b0 <trap_handler>
    80005944:	00010513          	mv	a0,sp
    80005948:	544000ef          	jal	80005e8c <exit_interrupt_handler>
    8000594c:	0a00006f          	j	800059ec <kernelret>

0000000080005950 <kernelvec_fast>:
    80005950:	f8010113          	add	sp,sp,-128
    80005954:	00113423          	sd	ra,8(sp)
    80005958:	00213823          	sd	sp,16(sp)
    8000595c:	00513c23          	sd	t0,24(sp)
    80005960:	02613023          	sd	t1,32(sp)
    80005964:	02713423          	sd	t2,40(sp)
    80005968:	02a13823          	sd	a0,48(sp)
    8000596c:	02b13c23          	sd	a1,56(sp)
    80005970:	04c13023          	sd	a2,64(sp)
    80005974:	04d13423          	sd	a3,72(sp)
    80005978:	05c13823          	sd	t3,80(sp)
    8000597c:	05d13c23          	sd	t4,88(sp)
    80005980:	07e13023          	sd	t5,96(sp)
    80005984:	07f13423          	sd	t6,104(sp)
    80005988:	100022f3          	csrr	t0,sstatus
    8000598c:	06513823          	sd	t0,112(sp)
    80005990:	141022f3          	csrr	t0,sepc
    80005994:	06513c23          	sd	t0,120(sp)
    80005998:	08010293          	add	t0,sp,128
    8000599c:	00513823          	sd	t0,16(sp)
    800059a0:	00010513          	mv	a0,sp
    800059a4:	bf5ff0ef          	jal	80005598 <fast_interrupt_handler>
    800059a8:	0ec0006f          	j	80005a94 <fast_kernelret>

00000000800059ac <kernelvec_minimal>:
    800059ac:	14011073          	csrw	sscratch,sp
    800059b0:	328000ef          	jal	80005cd8 <get_interrupt_stack_top>
    800059b4:	00050113          	mv	sp,a0
    800059b8:	fc010113          	add	sp,sp,-64
    800059bc:	00113423          	sd	ra,8(sp)
    800059c0:	140022f3          	csrr	t0,sscratch
    800059c4:	00513823          	sd	t0,16(sp)
    800059c8:	00a13c23          	sd	a0,24(sp)
    800059cc:	02b13023          	sd	a1,32(sp)
    800059d0:	100022f3          	csrr	t0,sstatus
    800059d4:	02513423          	sd	t0,40(sp)
    800059d8:	141022f3          	csrr	t0,sepc
    800059dc:	02513823          	sd	t0,48(sp)
    800059e0:	00010513          	mv	a0,sp
    800059e4:	b5dff0ef          	jal	80005540 <minimal_interrupt_handler>
    800059e8:	0f40006f          	j	80005adc <minimal_kernelret>

00000000800059ec <kernelret>:
    800059ec:	12013283          	ld	t0,288(sp)
    800059f0:	14029073          	csrw	sscratch,t0
    800059f4:	11813283          	ld	t0,280(sp)
    800059f8:	14329073          	csrw	stval,t0
    800059fc:	11013283          	ld	t0,272(sp)
    80005a00:	14229073          	csrw	scause,t0
    80005a04:	10813283          	ld	t0,264(sp)
    80005a08:	14129073          	csrw	sepc,t0
    80005a0c:	10013283          	ld	t0,256(sp)
    80005a10:	10029073          	csrw	sstatus,t0
    80005a14:	00813083          	ld	ra,8(sp)
    80005a18:	01813183          	ld	gp,24(sp)
    80005a1c:	02013203          	ld	tp,32(sp)
    80005a20:	02813283          	ld	t0,40(sp)
    80005a24:	03013303          	ld	t1,48(sp)
    80005a28:	03813383          	ld	t2,56(sp)
    80005a2c:	04013403          	ld	s0,64(sp)
    80005a30:	04813483          	ld	s1,72(sp)
    80005a34:	05013503          	ld	a0,80(sp)
    80005a38:	05813583          	ld	a1,88(sp)
    80005a3c:	06013603          	ld	a2,96(sp)
    80005a40:	06813683          	ld	a3,104(sp)
    80005a44:	07013703          	ld	a4,112(sp)
    80005a48:	07813783          	ld	a5,120(sp)
    80005a4c:	08013803          	ld	a6,128(sp)
    80005a50:	08813883          	ld	a7,136(sp)
    80005a54:	09013903          	ld	s2,144(sp)
    80005a58:	09813983          	ld	s3,152(sp)
    80005a5c:	0a013a03          	ld	s4,160(sp)
    80005a60:	0a813a83          	ld	s5,168(sp)
    80005a64:	0b013b03          	ld	s6,176(sp)
    80005a68:	0b813b83          	ld	s7,184(sp)
    80005a6c:	0c013c03          	ld	s8,192(sp)
    80005a70:	0c813c83          	ld	s9,200(sp)
    80005a74:	0d013d03          	ld	s10,208(sp)
    80005a78:	0d813d83          	ld	s11,216(sp)
    80005a7c:	0e013e03          	ld	t3,224(sp)
    80005a80:	0e813e83          	ld	t4,232(sp)
    80005a84:	0f013f03          	ld	t5,240(sp)
    80005a88:	0f813f83          	ld	t6,248(sp)
    80005a8c:	01013103          	ld	sp,16(sp)
    80005a90:	10200073          	sret

0000000080005a94 <fast_kernelret>:
    80005a94:	07813283          	ld	t0,120(sp)
    80005a98:	14129073          	csrw	sepc,t0
    80005a9c:	07013283          	ld	t0,112(sp)
    80005aa0:	10029073          	csrw	sstatus,t0
    80005aa4:	00813083          	ld	ra,8(sp)
    80005aa8:	01813283          	ld	t0,24(sp)
    80005aac:	02013303          	ld	t1,32(sp)
    80005ab0:	02813383          	ld	t2,40(sp)
    80005ab4:	03013503          	ld	a0,48(sp)
    80005ab8:	03813583          	ld	a1,56(sp)
    80005abc:	04013603          	ld	a2,64(sp)
    80005ac0:	04813683          	ld	a3,72(sp)
    80005ac4:	05013e03          	ld	t3,80(sp)
    80005ac8:	05813e83          	ld	t4,88(sp)
    80005acc:	06013f03          	ld	t5,96(sp)
    80005ad0:	06813f83          	ld	t6,104(sp)
    80005ad4:	01013103          	ld	sp,16(sp)
    80005ad8:	10200073          	sret

0000000080005adc <minimal_kernelret>:
    80005adc:	03013283          	ld	t0,48(sp)
    80005ae0:	14129073          	csrw	sepc,t0
    80005ae4:	02813283          	ld	t0,40(sp)
    80005ae8:	10029073          	csrw	sstatus,t0
    80005aec:	00813083          	ld	ra,8(sp)
    80005af0:	01813503          	ld	a0,24(sp)
    80005af4:	02013583          	ld	a1,32(sp)
    80005af8:	01013103          	ld	sp,16(sp)
    80005afc:	10200073          	sret

0000000080005b00 <uservec>:
    80005b00:	14011073          	csrw	sscratch,sp
    80005b04:	1d4000ef          	jal	80005cd8 <get_interrupt_stack_top>
    80005b08:	00050113          	mv	sp,a0
    80005b0c:	ed810113          	add	sp,sp,-296
    80005b10:	00113423          	sd	ra,8(sp)
    80005b14:	140022f3          	csrr	t0,sscratch
    80005b18:	00513823          	sd	t0,16(sp)
    80005b1c:	00313c23          	sd	gp,24(sp)
    80005b20:	02413023          	sd	tp,32(sp)
    80005b24:	100022f3          	csrr	t0,sstatus
    80005b28:	10513023          	sd	t0,256(sp)
    80005b2c:	141022f3          	csrr	t0,sepc
    80005b30:	10513423          	sd	t0,264(sp)
    80005b34:	00010513          	mv	a0,sp
    80005b38:	9a5ff0ef          	jal	800054dc <user_trap_handler>
    80005b3c:	0040006f          	j	80005b40 <userret>

0000000080005b40 <userret>:
    80005b40:	10813283          	ld	t0,264(sp)
    80005b44:	14129073          	csrw	sepc,t0
    80005b48:	10013283          	ld	t0,256(sp)
    80005b4c:	10029073          	csrw	sstatus,t0
    80005b50:	00813083          	ld	ra,8(sp)
    80005b54:	01813183          	ld	gp,24(sp)
    80005b58:	02013203          	ld	tp,32(sp)
    80005b5c:	01013103          	ld	sp,16(sp)
    80005b60:	10200073          	sret

0000000080005b64 <kernel_panic>:
    80005b64:	558000ef          	jal	800060bc <emergency_stack_recovery>
    80005b68:	f7dfe0ef          	jal	80004ae4 <kernel_panic_handler>
    80005b6c:	0000006f          	j	80005b6c <kernel_panic+0x8>

0000000080005b70 <switch_to_interrupt_stack>:
    80005b70:	00253023          	sd	sp,0(a0)
    80005b74:	164000ef          	jal	80005cd8 <get_interrupt_stack_top>
    80005b78:	00050113          	mv	sp,a0
    80005b7c:	00008067          	ret

0000000080005b80 <restore_from_interrupt_stack>:
    80005b80:	00053103          	ld	sp,0(a0)
    80005b84:	00008067          	ret

0000000080005b88 <save_minimal_context>:
    80005b88:	00153023          	sd	ra,0(a0)
    80005b8c:	00253423          	sd	sp,8(a0)
    80005b90:	100022f3          	csrr	t0,sstatus
    80005b94:	00553823          	sd	t0,16(a0)
    80005b98:	141022f3          	csrr	t0,sepc
    80005b9c:	00553c23          	sd	t0,24(a0)
    80005ba0:	00008067          	ret

0000000080005ba4 <restore_minimal_context>:
    80005ba4:	00053083          	ld	ra,0(a0)
    80005ba8:	00853103          	ld	sp,8(a0)
    80005bac:	01053283          	ld	t0,16(a0)
    80005bb0:	10029073          	csrw	sstatus,t0
    80005bb4:	01853283          	ld	t0,24(a0)
    80005bb8:	14129073          	csrw	sepc,t0
    80005bbc:	00008067          	ret
	...

0000000080005bc8 <print_decimal>:
    80005bc8:	06050c63          	beqz	a0,80005c40 <print_decimal+0x78>
    80005bcc:	fc010113          	add	sp,sp,-64
    80005bd0:	02113c23          	sd	ra,56(sp)
    80005bd4:	02813823          	sd	s0,48(sp)
    80005bd8:	02913423          	sd	s1,40(sp)
    80005bdc:	00810693          	add	a3,sp,8
    80005be0:	00000713          	li	a4,0
    80005be4:	00a00613          	li	a2,10
    80005be8:	00900813          	li	a6,9
    80005bec:	02c577b3          	remu	a5,a0,a2
    80005bf0:	00168693          	add	a3,a3,1
    80005bf4:	00050593          	mv	a1,a0
    80005bf8:	00070413          	mv	s0,a4
    80005bfc:	0017071b          	addw	a4,a4,1
    80005c00:	0307879b          	addw	a5,a5,48
    80005c04:	fef68fa3          	sb	a5,-1(a3)
    80005c08:	02c55533          	divu	a0,a0,a2
    80005c0c:	feb860e3          	bltu	a6,a1,80005bec <print_decimal+0x24>
    80005c10:	00810793          	add	a5,sp,8
    80005c14:	00878433          	add	s0,a5,s0
    80005c18:	fff78493          	add	s1,a5,-1
    80005c1c:	00044503          	lbu	a0,0(s0)
    80005c20:	fff40413          	add	s0,s0,-1
    80005c24:	fbcfc0ef          	jal	800023e0 <uart_putc>
    80005c28:	fe849ae3          	bne	s1,s0,80005c1c <print_decimal+0x54>
    80005c2c:	03813083          	ld	ra,56(sp)
    80005c30:	03013403          	ld	s0,48(sp)
    80005c34:	02813483          	ld	s1,40(sp)
    80005c38:	04010113          	add	sp,sp,64
    80005c3c:	00008067          	ret
    80005c40:	03000513          	li	a0,48
    80005c44:	f9cfc06f          	j	800023e0 <uart_putc>

0000000080005c48 <init_interrupt_stack>:
    80005c48:	ff010113          	add	sp,sp,-16
    80005c4c:	00005517          	auipc	a0,0x5
    80005c50:	19c50513          	add	a0,a0,412 # 8000ade8 <trap_names+0xf8>
    80005c54:	00113423          	sd	ra,8(sp)
    80005c58:	fa0fc0ef          	jal	800023f8 <uart_puts>
    80005c5c:	00100593          	li	a1,1
    80005c60:	deadc637          	lui	a2,0xdeadc
    80005c64:	0040f897          	auipc	a7,0x40f
    80005c68:	8b488893          	add	a7,a7,-1868 # 80414518 <cpu_interrupt_stack>
    80005c6c:	02059813          	sll	a6,a1,0x20
    80005c70:	eef60613          	add	a2,a2,-273 # ffffffffdeadbeef <bss_end+0xffffffff5e6c3ce7>
    80005c74:	37ab7737          	lui	a4,0x37ab7
    80005c78:	0040f797          	auipc	a5,0x40f
    80005c7c:	87878793          	add	a5,a5,-1928 # 804144f0 <save_config>
    80005c80:	00c8a023          	sw	a2,0(a7)
    80005c84:	00271713          	sll	a4,a4,0x2
    80005c88:	00180613          	add	a2,a6,1
    80005c8c:	00411697          	auipc	a3,0x411
    80005c90:	88c68693          	add	a3,a3,-1908 # 80416518 <cpu_interrupt_stack+0x2000>
    80005c94:	eef70713          	add	a4,a4,-273 # 37ab6eef <_entry-0x48549111>
    80005c98:	00c7b023          	sd	a2,0(a5)
    80005c9c:	00813083          	ld	ra,8(sp)
    80005ca0:	00e6b023          	sd	a4,0(a3)
    80005ca4:	00411717          	auipc	a4,0x411
    80005ca8:	87370713          	add	a4,a4,-1933 # 80416517 <cpu_interrupt_stack+0x1fff>
    80005cac:	0116b423          	sd	a7,8(a3)
    80005cb0:	00e6b823          	sd	a4,16(a3)
    80005cb4:	0006bc23          	sd	zero,24(a3)
    80005cb8:	0107b423          	sd	a6,8(a5)
    80005cbc:	00b7a823          	sw	a1,16(a5)
    80005cc0:	0007bc23          	sd	zero,24(a5)
    80005cc4:	0207b023          	sd	zero,32(a5)
    80005cc8:	00005517          	auipc	a0,0x5
    80005ccc:	14850513          	add	a0,a0,328 # 8000ae10 <trap_names+0x120>
    80005cd0:	01010113          	add	sp,sp,16
    80005cd4:	f24fc06f          	j	800023f8 <uart_puts>

0000000080005cd8 <get_interrupt_stack_top>:
    80005cd8:	00411517          	auipc	a0,0x411
    80005cdc:	85053503          	ld	a0,-1968(a0) # 80416528 <cpu_interrupt_stack+0x2010>
    80005ce0:	00008067          	ret

0000000080005ce4 <check_stack_overflow>:
    80005ce4:	00411717          	auipc	a4,0x411
    80005ce8:	83470713          	add	a4,a4,-1996 # 80416518 <cpu_interrupt_stack+0x2000>
    80005cec:	00873683          	ld	a3,8(a4)
    80005cf0:	00050793          	mv	a5,a0
    80005cf4:	04d56063          	bltu	a0,a3,80005d34 <check_stack_overflow+0x50>
    80005cf8:	01073703          	ld	a4,16(a4)
    80005cfc:	00100513          	li	a0,1
    80005d00:	02f76c63          	bltu	a4,a5,80005d38 <check_stack_overflow+0x54>
    80005d04:	40d787b3          	sub	a5,a5,a3
    80005d08:	1ff00713          	li	a4,511
    80005d0c:	02f77663          	bgeu	a4,a5,80005d38 <check_stack_overflow+0x54>
    80005d10:	0040e517          	auipc	a0,0x40e
    80005d14:	7f052503          	lw	a0,2032(a0) # 80414500 <save_config+0x10>
    80005d18:	02050063          	beqz	a0,80005d38 <check_stack_overflow+0x54>
    80005d1c:	0006a503          	lw	a0,0(a3)
    80005d20:	deadc7b7          	lui	a5,0xdeadc
    80005d24:	eef78793          	add	a5,a5,-273 # ffffffffdeadbeef <bss_end+0xffffffff5e6c3ce7>
    80005d28:	40f50533          	sub	a0,a0,a5
    80005d2c:	00a03533          	snez	a0,a0
    80005d30:	00008067          	ret
    80005d34:	00100513          	li	a0,1
    80005d38:	00008067          	ret

0000000080005d3c <update_stack_stats>:
    80005d3c:	00410697          	auipc	a3,0x410
    80005d40:	7dc68693          	add	a3,a3,2012 # 80416518 <cpu_interrupt_stack+0x2000>
    80005d44:	0106b703          	ld	a4,16(a3)
    80005d48:	0040e797          	auipc	a5,0x40e
    80005d4c:	7a878793          	add	a5,a5,1960 # 804144f0 <save_config>
    80005d50:	0187a603          	lw	a2,24(a5)
    80005d54:	40a7073b          	subw	a4,a4,a0
    80005d58:	00e67463          	bgeu	a2,a4,80005d60 <update_stack_stats+0x24>
    80005d5c:	00e7ac23          	sw	a4,24(a5)
    80005d60:	0046a703          	lw	a4,4(a3)
    80005d64:	0207a683          	lw	a3,32(a5)
    80005d68:	00e6f463          	bgeu	a3,a4,80005d70 <update_stack_stats+0x34>
    80005d6c:	02e7a023          	sw	a4,32(a5)
    80005d70:	0247a703          	lw	a4,36(a5)
    80005d74:	0017071b          	addw	a4,a4,1
    80005d78:	02e7a223          	sw	a4,36(a5)
    80005d7c:	00008067          	ret

0000000080005d80 <enter_interrupt_handler>:
    80005d80:	fe010113          	add	sp,sp,-32
    80005d84:	00913423          	sd	s1,8(sp)
    80005d88:	00410497          	auipc	s1,0x410
    80005d8c:	79048493          	add	s1,s1,1936 # 80416518 <cpu_interrupt_stack+0x2000>
    80005d90:	0044a783          	lw	a5,4(s1)
    80005d94:	00113c23          	sd	ra,24(sp)
    80005d98:	00813823          	sd	s0,16(sp)
    80005d9c:	0017869b          	addw	a3,a5,1
    80005da0:	00800713          	li	a4,8
    80005da4:	00d4a223          	sw	a3,4(s1)
    80005da8:	0cd76663          	bltu	a4,a3,80005e74 <enter_interrupt_handler+0xf4>
    80005dac:	0040e417          	auipc	s0,0x40e
    80005db0:	74440413          	add	s0,s0,1860 # 804144f0 <save_config>
    80005db4:	00c42703          	lw	a4,12(s0)
    80005db8:	00068793          	mv	a5,a3
    80005dbc:	06070263          	beqz	a4,80005e20 <enter_interrupt_handler+0xa0>
    80005dc0:	0084b603          	ld	a2,8(s1)
    80005dc4:	02c56863          	bltu	a0,a2,80005df4 <enter_interrupt_handler+0x74>
    80005dc8:	0104b703          	ld	a4,16(s1)
    80005dcc:	02a76463          	bltu	a4,a0,80005df4 <enter_interrupt_handler+0x74>
    80005dd0:	40c505b3          	sub	a1,a0,a2
    80005dd4:	1ff00813          	li	a6,511
    80005dd8:	00b87e63          	bgeu	a6,a1,80005df4 <enter_interrupt_handler+0x74>
    80005ddc:	01042583          	lw	a1,16(s0)
    80005de0:	04058263          	beqz	a1,80005e24 <enter_interrupt_handler+0xa4>
    80005de4:	00062583          	lw	a1,0(a2)
    80005de8:	deadc637          	lui	a2,0xdeadc
    80005dec:	eef60613          	add	a2,a2,-273 # ffffffffdeadbeef <bss_end+0xffffffff5e6c3ce7>
    80005df0:	02c58a63          	beq	a1,a2,80005e24 <enter_interrupt_handler+0xa4>
    80005df4:	00005517          	auipc	a0,0x5
    80005df8:	07450513          	add	a0,a0,116 # 8000ae68 <trap_names+0x178>
    80005dfc:	dfcfc0ef          	jal	800023f8 <uart_puts>
    80005e00:	01c42703          	lw	a4,28(s0)
    80005e04:	0044a783          	lw	a5,4(s1)
    80005e08:	0017071b          	addw	a4,a4,1
    80005e0c:	00e42e23          	sw	a4,28(s0)
    80005e10:	fff7879b          	addw	a5,a5,-1
    80005e14:	00f4a223          	sw	a5,4(s1)
    80005e18:	fff00513          	li	a0,-1
    80005e1c:	0440006f          	j	80005e60 <enter_interrupt_handler+0xe0>
    80005e20:	0104b703          	ld	a4,16(s1)
    80005e24:	0184b603          	ld	a2,24(s1)
    80005e28:	01842583          	lw	a1,24(s0)
    80005e2c:	00a4bc23          	sd	a0,24(s1)
    80005e30:	40a7073b          	subw	a4,a4,a0
    80005e34:	04c53023          	sd	a2,64(a0)
    80005e38:	0007061b          	sext.w	a2,a4
    80005e3c:	00c5f463          	bgeu	a1,a2,80005e44 <enter_interrupt_handler+0xc4>
    80005e40:	00e42c23          	sw	a4,24(s0)
    80005e44:	02042703          	lw	a4,32(s0)
    80005e48:	00d77463          	bgeu	a4,a3,80005e50 <enter_interrupt_handler+0xd0>
    80005e4c:	02f42023          	sw	a5,32(s0)
    80005e50:	02442783          	lw	a5,36(s0)
    80005e54:	00000513          	li	a0,0
    80005e58:	0017879b          	addw	a5,a5,1
    80005e5c:	02f42223          	sw	a5,36(s0)
    80005e60:	01813083          	ld	ra,24(sp)
    80005e64:	01013403          	ld	s0,16(sp)
    80005e68:	00813483          	ld	s1,8(sp)
    80005e6c:	02010113          	add	sp,sp,32
    80005e70:	00008067          	ret
    80005e74:	00005517          	auipc	a0,0x5
    80005e78:	fc450513          	add	a0,a0,-60 # 8000ae38 <trap_names+0x148>
    80005e7c:	d7cfc0ef          	jal	800023f8 <uart_puts>
    80005e80:	0044a783          	lw	a5,4(s1)
    80005e84:	fff7879b          	addw	a5,a5,-1
    80005e88:	f8dff06f          	j	80005e14 <enter_interrupt_handler+0x94>

0000000080005e8c <exit_interrupt_handler>:
    80005e8c:	00410717          	auipc	a4,0x410
    80005e90:	68c70713          	add	a4,a4,1676 # 80416518 <cpu_interrupt_stack+0x2000>
    80005e94:	00472783          	lw	a5,4(a4)
    80005e98:	00078c63          	beqz	a5,80005eb0 <exit_interrupt_handler+0x24>
    80005e9c:	04053683          	ld	a3,64(a0)
    80005ea0:	fff7879b          	addw	a5,a5,-1
    80005ea4:	00f72223          	sw	a5,4(a4)
    80005ea8:	00d73c23          	sd	a3,24(a4)
    80005eac:	00008067          	ret
    80005eb0:	00005517          	auipc	a0,0x5
    80005eb4:	fd850513          	add	a0,a0,-40 # 8000ae88 <trap_names+0x198>
    80005eb8:	d40fc06f          	j	800023f8 <uart_puts>

0000000080005ebc <print_stack_stats>:
    80005ebc:	fc010113          	add	sp,sp,-64
    80005ec0:	00005517          	auipc	a0,0x5
    80005ec4:	ff050513          	add	a0,a0,-16 # 8000aeb0 <trap_names+0x1c0>
    80005ec8:	02113c23          	sd	ra,56(sp)
    80005ecc:	02913423          	sd	s1,40(sp)
    80005ed0:	02813823          	sd	s0,48(sp)
    80005ed4:	d24fc0ef          	jal	800023f8 <uart_puts>
    80005ed8:	00005517          	auipc	a0,0x5
    80005edc:	ff850513          	add	a0,a0,-8 # 8000aed0 <trap_names+0x1e0>
    80005ee0:	d18fc0ef          	jal	800023f8 <uart_puts>
    80005ee4:	00810493          	add	s1,sp,8
    80005ee8:	00048613          	mv	a2,s1
    80005eec:	00000693          	li	a3,0
    80005ef0:	00002737          	lui	a4,0x2
    80005ef4:	00a00593          	li	a1,10
    80005ef8:	00400513          	li	a0,4
    80005efc:	02b777b3          	remu	a5,a4,a1
    80005f00:	00160613          	add	a2,a2,1
    80005f04:	0016869b          	addw	a3,a3,1
    80005f08:	0307879b          	addw	a5,a5,48
    80005f0c:	fef60fa3          	sb	a5,-1(a2)
    80005f10:	02b75733          	divu	a4,a4,a1
    80005f14:	fea694e3          	bne	a3,a0,80005efc <print_stack_stats+0x40>
    80005f18:	00b10413          	add	s0,sp,11
    80005f1c:	00044503          	lbu	a0,0(s0)
    80005f20:	cc0fc0ef          	jal	800023e0 <uart_putc>
    80005f24:	00040793          	mv	a5,s0
    80005f28:	fff40413          	add	s0,s0,-1
    80005f2c:	fe9798e3          	bne	a5,s1,80005f1c <print_stack_stats+0x60>
    80005f30:	00005517          	auipc	a0,0x5
    80005f34:	fb050513          	add	a0,a0,-80 # 8000aee0 <trap_names+0x1f0>
    80005f38:	cc0fc0ef          	jal	800023f8 <uart_puts>
    80005f3c:	00005517          	auipc	a0,0x5
    80005f40:	fb450513          	add	a0,a0,-76 # 8000aef0 <trap_names+0x200>
    80005f44:	0040e417          	auipc	s0,0x40e
    80005f48:	5ac40413          	add	s0,s0,1452 # 804144f0 <save_config>
    80005f4c:	cacfc0ef          	jal	800023f8 <uart_puts>
    80005f50:	01846503          	lwu	a0,24(s0)
    80005f54:	c75ff0ef          	jal	80005bc8 <print_decimal>
    80005f58:	00005517          	auipc	a0,0x5
    80005f5c:	f8850513          	add	a0,a0,-120 # 8000aee0 <trap_names+0x1f0>
    80005f60:	c98fc0ef          	jal	800023f8 <uart_puts>
    80005f64:	00005517          	auipc	a0,0x5
    80005f68:	f9c50513          	add	a0,a0,-100 # 8000af00 <trap_names+0x210>
    80005f6c:	c8cfc0ef          	jal	800023f8 <uart_puts>
    80005f70:	01842783          	lw	a5,24(s0)
    80005f74:	06400513          	li	a0,100
    80005f78:	02f5053b          	mulw	a0,a0,a5
    80005f7c:	00d5551b          	srlw	a0,a0,0xd
    80005f80:	c49ff0ef          	jal	80005bc8 <print_decimal>
    80005f84:	00005517          	auipc	a0,0x5
    80005f88:	f8c50513          	add	a0,a0,-116 # 8000af10 <trap_names+0x220>
    80005f8c:	c6cfc0ef          	jal	800023f8 <uart_puts>
    80005f90:	00005517          	auipc	a0,0x5
    80005f94:	f8850513          	add	a0,a0,-120 # 8000af18 <trap_names+0x228>
    80005f98:	c60fc0ef          	jal	800023f8 <uart_puts>
    80005f9c:	01c46503          	lwu	a0,28(s0)
    80005fa0:	c29ff0ef          	jal	80005bc8 <print_decimal>
    80005fa4:	00003517          	auipc	a0,0x3
    80005fa8:	dec50513          	add	a0,a0,-532 # 80008d90 <rodata_start+0xd90>
    80005fac:	c4cfc0ef          	jal	800023f8 <uart_puts>
    80005fb0:	00005517          	auipc	a0,0x5
    80005fb4:	f8050513          	add	a0,a0,-128 # 8000af30 <trap_names+0x240>
    80005fb8:	c40fc0ef          	jal	800023f8 <uart_puts>
    80005fbc:	02046503          	lwu	a0,32(s0)
    80005fc0:	c09ff0ef          	jal	80005bc8 <print_decimal>
    80005fc4:	00003517          	auipc	a0,0x3
    80005fc8:	dcc50513          	add	a0,a0,-564 # 80008d90 <rodata_start+0xd90>
    80005fcc:	c2cfc0ef          	jal	800023f8 <uart_puts>
    80005fd0:	00005517          	auipc	a0,0x5
    80005fd4:	f7850513          	add	a0,a0,-136 # 8000af48 <trap_names+0x258>
    80005fd8:	c20fc0ef          	jal	800023f8 <uart_puts>
    80005fdc:	02446503          	lwu	a0,36(s0)
    80005fe0:	be9ff0ef          	jal	80005bc8 <print_decimal>
    80005fe4:	00003517          	auipc	a0,0x3
    80005fe8:	dac50513          	add	a0,a0,-596 # 80008d90 <rodata_start+0xd90>
    80005fec:	c0cfc0ef          	jal	800023f8 <uart_puts>
    80005ff0:	00005517          	auipc	a0,0x5
    80005ff4:	f7050513          	add	a0,a0,-144 # 8000af60 <trap_names+0x270>
    80005ff8:	c00fc0ef          	jal	800023f8 <uart_puts>
    80005ffc:	00410517          	auipc	a0,0x410
    80006000:	52056503          	lwu	a0,1312(a0) # 8041651c <cpu_interrupt_stack+0x2004>
    80006004:	bc5ff0ef          	jal	80005bc8 <print_decimal>
    80006008:	03013403          	ld	s0,48(sp)
    8000600c:	03813083          	ld	ra,56(sp)
    80006010:	02813483          	ld	s1,40(sp)
    80006014:	00003517          	auipc	a0,0x3
    80006018:	d7c50513          	add	a0,a0,-644 # 80008d90 <rodata_start+0xd90>
    8000601c:	04010113          	add	sp,sp,64
    80006020:	bd8fc06f          	j	800023f8 <uart_puts>

0000000080006024 <set_context_save_config>:
    80006024:	ff010113          	add	sp,sp,-16
    80006028:	00813023          	sd	s0,0(sp)
    8000602c:	0040e797          	auipc	a5,0x40e
    80006030:	4c478793          	add	a5,a5,1220 # 804144f0 <save_config>
    80006034:	00113423          	sd	ra,8(sp)
    80006038:	00050413          	mv	s0,a0
    8000603c:	00005517          	auipc	a0,0x5
    80006040:	f3c50513          	add	a0,a0,-196 # 8000af78 <trap_names+0x288>
    80006044:	0087a023          	sw	s0,0(a5)
    80006048:	00b7a223          	sw	a1,4(a5)
    8000604c:	00c7a623          	sw	a2,12(a5)
    80006050:	ba8fc0ef          	jal	800023f8 <uart_puts>
    80006054:	00100793          	li	a5,1
    80006058:	04f40063          	beq	s0,a5,80006098 <set_context_save_config+0x74>
    8000605c:	00200793          	li	a5,2
    80006060:	02f40063          	beq	s0,a5,80006080 <set_context_save_config+0x5c>
    80006064:	00005517          	auipc	a0,0x5
    80006068:	f3450513          	add	a0,a0,-204 # 8000af98 <trap_names+0x2a8>
    8000606c:	00040e63          	beqz	s0,80006088 <set_context_save_config+0x64>
    80006070:	00813083          	ld	ra,8(sp)
    80006074:	00013403          	ld	s0,0(sp)
    80006078:	01010113          	add	sp,sp,16
    8000607c:	00008067          	ret
    80006080:	00005517          	auipc	a0,0x5
    80006084:	f4850513          	add	a0,a0,-184 # 8000afc8 <trap_names+0x2d8>
    80006088:	00013403          	ld	s0,0(sp)
    8000608c:	00813083          	ld	ra,8(sp)
    80006090:	01010113          	add	sp,sp,16
    80006094:	b64fc06f          	j	800023f8 <uart_puts>
    80006098:	00013403          	ld	s0,0(sp)
    8000609c:	00813083          	ld	ra,8(sp)
    800060a0:	00005517          	auipc	a0,0x5
    800060a4:	f1050513          	add	a0,a0,-240 # 8000afb0 <trap_names+0x2c0>
    800060a8:	01010113          	add	sp,sp,16
    800060ac:	b4cfc06f          	j	800023f8 <uart_puts>

00000000800060b0 <get_save_config>:
    800060b0:	0040e517          	auipc	a0,0x40e
    800060b4:	44050513          	add	a0,a0,1088 # 804144f0 <save_config>
    800060b8:	00008067          	ret

00000000800060bc <emergency_stack_recovery>:
    800060bc:	ff010113          	add	sp,sp,-16
    800060c0:	00005517          	auipc	a0,0x5
    800060c4:	f2050513          	add	a0,a0,-224 # 8000afe0 <trap_names+0x2f0>
    800060c8:	00113423          	sd	ra,8(sp)
    800060cc:	b2cfc0ef          	jal	800023f8 <uart_puts>
    800060d0:	00410797          	auipc	a5,0x410
    800060d4:	44878793          	add	a5,a5,1096 # 80416518 <cpu_interrupt_stack+0x2000>
    800060d8:	0087b703          	ld	a4,8(a5)
    800060dc:	0007a223          	sw	zero,4(a5)
    800060e0:	0007bc23          	sd	zero,24(a5)
    800060e4:	deadc7b7          	lui	a5,0xdeadc
    800060e8:	00813083          	ld	ra,8(sp)
    800060ec:	eef78793          	add	a5,a5,-273 # ffffffffdeadbeef <bss_end+0xffffffff5e6c3ce7>
    800060f0:	00f72023          	sw	a5,0(a4) # 2000 <_entry-0x7fffe000>
    800060f4:	00005517          	auipc	a0,0x5
    800060f8:	f0c50513          	add	a0,a0,-244 # 8000b000 <trap_names+0x310>
    800060fc:	01010113          	add	sp,sp,16
    80006100:	af8fc06f          	j	800023f8 <uart_puts>

0000000080006104 <sbi_ecall>:
    80006104:	00050313          	mv	t1,a0
    80006108:	00058e13          	mv	t3,a1
    8000610c:	ff010113          	add	sp,sp,-16
    80006110:	00060513          	mv	a0,a2
    80006114:	00068593          	mv	a1,a3
    80006118:	00070613          	mv	a2,a4
    8000611c:	00078693          	mv	a3,a5
    80006120:	00080713          	mv	a4,a6
    80006124:	00088793          	mv	a5,a7
    80006128:	000e0813          	mv	a6,t3
    8000612c:	00030893          	mv	a7,t1
    80006130:	00000073          	ecall
    80006134:	01010113          	add	sp,sp,16
    80006138:	00008067          	ret

000000008000613c <sbi_set_timer>:
    8000613c:	00000593          	li	a1,0
    80006140:	00000613          	li	a2,0
    80006144:	00000693          	li	a3,0
    80006148:	00000713          	li	a4,0
    8000614c:	00000793          	li	a5,0
    80006150:	00000813          	li	a6,0
    80006154:	00000893          	li	a7,0
    80006158:	00000073          	ecall
    8000615c:	00008067          	ret

0000000080006160 <get_time>:
    80006160:	c0102573          	rdtime	a0
    80006164:	00008067          	ret

0000000080006168 <sbi_console_putchar>:
    80006168:	00000593          	li	a1,0
    8000616c:	00000613          	li	a2,0
    80006170:	00000693          	li	a3,0
    80006174:	00000713          	li	a4,0
    80006178:	00000793          	li	a5,0
    8000617c:	00000813          	li	a6,0
    80006180:	00100893          	li	a7,1
    80006184:	00000073          	ecall
    80006188:	00008067          	ret

000000008000618c <sbi_console_getchar>:
    8000618c:	00000513          	li	a0,0
    80006190:	00000593          	li	a1,0
    80006194:	00000613          	li	a2,0
    80006198:	00000693          	li	a3,0
    8000619c:	00000713          	li	a4,0
    800061a0:	00000793          	li	a5,0
    800061a4:	00000813          	li	a6,0
    800061a8:	00200893          	li	a7,2
    800061ac:	00000073          	ecall
    800061b0:	00051663          	bnez	a0,800061bc <sbi_console_getchar+0x30>
    800061b4:	0005851b          	sext.w	a0,a1
    800061b8:	00008067          	ret
    800061bc:	fff00513          	li	a0,-1
    800061c0:	00008067          	ret

00000000800061c4 <sbi_shutdown>:
    800061c4:	00000513          	li	a0,0
    800061c8:	00000593          	li	a1,0
    800061cc:	00000613          	li	a2,0
    800061d0:	00000693          	li	a3,0
    800061d4:	00000713          	li	a4,0
    800061d8:	00000793          	li	a5,0
    800061dc:	00000813          	li	a6,0
    800061e0:	00800893          	li	a7,8
    800061e4:	00000073          	ecall
    800061e8:	0000006f          	j	800061e8 <sbi_shutdown+0x24>

00000000800061ec <sbi_send_ipi>:
    800061ec:	00000593          	li	a1,0
    800061f0:	00000613          	li	a2,0
    800061f4:	00000693          	li	a3,0
    800061f8:	00000713          	li	a4,0
    800061fc:	00000793          	li	a5,0
    80006200:	00000813          	li	a6,0
    80006204:	00400893          	li	a7,4
    80006208:	00000073          	ecall
    8000620c:	00008067          	ret

0000000080006210 <sbi_clear_ipi>:
    80006210:	00000513          	li	a0,0
    80006214:	00000593          	li	a1,0
    80006218:	00000613          	li	a2,0
    8000621c:	00000693          	li	a3,0
    80006220:	00000713          	li	a4,0
    80006224:	00000793          	li	a5,0
    80006228:	00000813          	li	a6,0
    8000622c:	00300893          	li	a7,3
    80006230:	00000073          	ecall
    80006234:	00008067          	ret

0000000080006238 <sbi_remote_fence_i>:
    80006238:	00000593          	li	a1,0
    8000623c:	00000613          	li	a2,0
    80006240:	00000693          	li	a3,0
    80006244:	00000713          	li	a4,0
    80006248:	00000793          	li	a5,0
    8000624c:	00000813          	li	a6,0
    80006250:	00500893          	li	a7,5
    80006254:	00000073          	ecall
    80006258:	00008067          	ret

000000008000625c <sbi_remote_sfence_vma>:
    8000625c:	00000693          	li	a3,0
    80006260:	00000713          	li	a4,0
    80006264:	00000793          	li	a5,0
    80006268:	00000813          	li	a6,0
    8000626c:	00600893          	li	a7,6
    80006270:	00000073          	ecall
    80006274:	00008067          	ret

0000000080006278 <print_decimal>:
    80006278:	06050c63          	beqz	a0,800062f0 <print_decimal+0x78>
    8000627c:	fc010113          	add	sp,sp,-64
    80006280:	02113c23          	sd	ra,56(sp)
    80006284:	02813823          	sd	s0,48(sp)
    80006288:	02913423          	sd	s1,40(sp)
    8000628c:	00810693          	add	a3,sp,8
    80006290:	00000713          	li	a4,0
    80006294:	00a00613          	li	a2,10
    80006298:	00900813          	li	a6,9
    8000629c:	02c577b3          	remu	a5,a0,a2
    800062a0:	00168693          	add	a3,a3,1
    800062a4:	00050593          	mv	a1,a0
    800062a8:	00070413          	mv	s0,a4
    800062ac:	0017071b          	addw	a4,a4,1
    800062b0:	0307879b          	addw	a5,a5,48
    800062b4:	fef68fa3          	sb	a5,-1(a3)
    800062b8:	02c55533          	divu	a0,a0,a2
    800062bc:	feb860e3          	bltu	a6,a1,8000629c <print_decimal+0x24>
    800062c0:	00810793          	add	a5,sp,8
    800062c4:	00878433          	add	s0,a5,s0
    800062c8:	fff78493          	add	s1,a5,-1
    800062cc:	00044503          	lbu	a0,0(s0)
    800062d0:	fff40413          	add	s0,s0,-1
    800062d4:	90cfc0ef          	jal	800023e0 <uart_putc>
    800062d8:	fe849ae3          	bne	s1,s0,800062cc <print_decimal+0x54>
    800062dc:	03813083          	ld	ra,56(sp)
    800062e0:	03013403          	ld	s0,48(sp)
    800062e4:	02813483          	ld	s1,40(sp)
    800062e8:	04010113          	add	sp,sp,64
    800062ec:	00008067          	ret
    800062f0:	03000513          	li	a0,48
    800062f4:	8ecfc06f          	j	800023e0 <uart_putc>

00000000800062f8 <timer_init>:
    800062f8:	ff010113          	add	sp,sp,-16
    800062fc:	00005517          	auipc	a0,0x5
    80006300:	d1c50513          	add	a0,a0,-740 # 8000b018 <trap_names+0x328>
    80006304:	00113423          	sd	ra,8(sp)
    80006308:	8f0fc0ef          	jal	800023f8 <uart_puts>
    8000630c:	00410817          	auipc	a6,0x410
    80006310:	22c80813          	add	a6,a6,556 # 80416538 <sys_time>
    80006314:	00100793          	li	a5,1
    80006318:	00100713          	li	a4,1
    8000631c:	00003697          	auipc	a3,0x3
    80006320:	4e468693          	add	a3,a3,1252 # 80009800 <rodata_start+0x1800>
    80006324:	00000613          	li	a2,0
    80006328:	00000597          	auipc	a1,0x0
    8000632c:	35458593          	add	a1,a1,852 # 8000667c <timer_interrupt_handler>
    80006330:	00500513          	li	a0,5
    80006334:	00083023          	sd	zero,0(a6)
    80006338:	00083423          	sd	zero,8(a6)
    8000633c:	00083823          	sd	zero,16(a6)
    80006340:	00412897          	auipc	a7,0x412
    80006344:	ea08b423          	sd	zero,-344(a7) # 804181e8 <timer_events>
    80006348:	00083c23          	sd	zero,24(a6)
    8000634c:	02083023          	sd	zero,32(a6)
    80006350:	02083423          	sd	zero,40(a6)
    80006354:	02083823          	sd	zero,48(a6)
    80006358:	d41fd0ef          	jal	80004098 <register_interrupt>
    8000635c:	00813083          	ld	ra,8(sp)
    80006360:	00005517          	auipc	a0,0x5
    80006364:	cd850513          	add	a0,a0,-808 # 8000b038 <trap_names+0x348>
    80006368:	01010113          	add	sp,sp,16
    8000636c:	88cfc06f          	j	800023f8 <uart_puts>

0000000080006370 <timer_start>:
    80006370:	ff010113          	add	sp,sp,-16
    80006374:	00813023          	sd	s0,0(sp)
    80006378:	00412417          	auipc	s0,0x412
    8000637c:	e6040413          	add	s0,s0,-416 # 804181d8 <timer_enabled>
    80006380:	00042783          	lw	a5,0(s0)
    80006384:	00113423          	sd	ra,8(sp)
    80006388:	00078a63          	beqz	a5,8000639c <timer_start+0x2c>
    8000638c:	00813083          	ld	ra,8(sp)
    80006390:	00013403          	ld	s0,0(sp)
    80006394:	01010113          	add	sp,sp,16
    80006398:	00008067          	ret
    8000639c:	00005517          	auipc	a0,0x5
    800063a0:	cbc50513          	add	a0,a0,-836 # 8000b058 <trap_names+0x368>
    800063a4:	854fc0ef          	jal	800023f8 <uart_puts>
    800063a8:	db9ff0ef          	jal	80006160 <get_time>
    800063ac:	000187b7          	lui	a5,0x18
    800063b0:	6a078793          	add	a5,a5,1696 # 186a0 <_entry-0x7ffe7960>
    800063b4:	00f507b3          	add	a5,a0,a5
    800063b8:	00078513          	mv	a0,a5
    800063bc:	00412717          	auipc	a4,0x412
    800063c0:	e2f73223          	sd	a5,-476(a4) # 804181e0 <next_timer_interrupt>
    800063c4:	d79ff0ef          	jal	8000613c <sbi_set_timer>
    800063c8:	00500513          	li	a0,5
    800063cc:	ef9fd0ef          	jal	800042c4 <enable_interrupt>
    800063d0:	00100793          	li	a5,1
    800063d4:	00f42023          	sw	a5,0(s0)
    800063d8:	00013403          	ld	s0,0(sp)
    800063dc:	00813083          	ld	ra,8(sp)
    800063e0:	00005517          	auipc	a0,0x5
    800063e4:	c9050513          	add	a0,a0,-880 # 8000b070 <trap_names+0x380>
    800063e8:	01010113          	add	sp,sp,16
    800063ec:	80cfc06f          	j	800023f8 <uart_puts>

00000000800063f0 <timer_stop>:
    800063f0:	00412797          	auipc	a5,0x412
    800063f4:	de87a783          	lw	a5,-536(a5) # 804181d8 <timer_enabled>
    800063f8:	00079463          	bnez	a5,80006400 <timer_stop+0x10>
    800063fc:	00008067          	ret
    80006400:	ff010113          	add	sp,sp,-16
    80006404:	00005517          	auipc	a0,0x5
    80006408:	c8450513          	add	a0,a0,-892 # 8000b088 <trap_names+0x398>
    8000640c:	00113423          	sd	ra,8(sp)
    80006410:	fe9fb0ef          	jal	800023f8 <uart_puts>
    80006414:	00500513          	li	a0,5
    80006418:	f51fd0ef          	jal	80004368 <disable_interrupt>
    8000641c:	00813083          	ld	ra,8(sp)
    80006420:	00412797          	auipc	a5,0x412
    80006424:	da07ac23          	sw	zero,-584(a5) # 804181d8 <timer_enabled>
    80006428:	00005517          	auipc	a0,0x5
    8000642c:	c7850513          	add	a0,a0,-904 # 8000b0a0 <trap_names+0x3b0>
    80006430:	01010113          	add	sp,sp,16
    80006434:	fc5fb06f          	j	800023f8 <uart_puts>

0000000080006438 <timer_interrupt>:
    80006438:	00008067          	ret

000000008000643c <get_system_ticks>:
    8000643c:	00410517          	auipc	a0,0x410
    80006440:	0fc53503          	ld	a0,252(a0) # 80416538 <sys_time>
    80006444:	00008067          	ret

0000000080006448 <get_system_time_ms>:
    80006448:	00410717          	auipc	a4,0x410
    8000644c:	0f073703          	ld	a4,240(a4) # 80416538 <sys_time>
    80006450:	3e800793          	li	a5,1000
    80006454:	02e787b3          	mul	a5,a5,a4
    80006458:	06400513          	li	a0,100
    8000645c:	02a7d533          	divu	a0,a5,a0
    80006460:	00008067          	ret

0000000080006464 <get_system_time>:
    80006464:	00410517          	auipc	a0,0x410
    80006468:	0d453503          	ld	a0,212(a0) # 80416538 <sys_time>
    8000646c:	00008067          	ret

0000000080006470 <get_system_time_struct>:
    80006470:	00410797          	auipc	a5,0x410
    80006474:	0c878793          	add	a5,a5,200 # 80416538 <sys_time>
    80006478:	0107b703          	ld	a4,16(a5)
    8000647c:	0087b683          	ld	a3,8(a5)
    80006480:	0007b783          	ld	a5,0(a5)
    80006484:	00e53823          	sd	a4,16(a0)
    80006488:	00d53423          	sd	a3,8(a0)
    8000648c:	00f53023          	sd	a5,0(a0)
    80006490:	00008067          	ret

0000000080006494 <add_timer_event>:
    80006494:	0c058863          	beqz	a1,80006564 <add_timer_event+0xd0>
    80006498:	fd010113          	add	sp,sp,-48
    8000649c:	02813023          	sd	s0,32(sp)
    800064a0:	00913c23          	sd	s1,24(sp)
    800064a4:	01213823          	sd	s2,16(sp)
    800064a8:	01313423          	sd	s3,8(sp)
    800064ac:	02113423          	sd	ra,40(sp)
    800064b0:	00058493          	mv	s1,a1
    800064b4:	00050913          	mv	s2,a0
    800064b8:	00060993          	mv	s3,a2
    800064bc:	fe9fb0ef          	jal	800024a4 <alloc_page>
    800064c0:	00050413          	mv	s0,a0
    800064c4:	08050c63          	beqz	a0,8000655c <add_timer_event+0xc8>
    800064c8:	00410717          	auipc	a4,0x410
    800064cc:	07073703          	ld	a4,112(a4) # 80416538 <sys_time>
    800064d0:	3e800793          	li	a5,1000
    800064d4:	02e787b3          	mul	a5,a5,a4
    800064d8:	06400713          	li	a4,100
    800064dc:	00953423          	sd	s1,8(a0)
    800064e0:	01353823          	sd	s3,16(a0)
    800064e4:	02e7d7b3          	divu	a5,a5,a4
    800064e8:	01278533          	add	a0,a5,s2
    800064ec:	00a43023          	sd	a0,0(s0)
    800064f0:	f25fd0ef          	jal	80004414 <disable_interrupts>
    800064f4:	00412717          	auipc	a4,0x412
    800064f8:	cf470713          	add	a4,a4,-780 # 804181e8 <timer_events>
    800064fc:	00073783          	ld	a5,0(a4)
    80006500:	00078863          	beqz	a5,80006510 <add_timer_event+0x7c>
    80006504:	00043683          	ld	a3,0(s0)
    80006508:	0007b603          	ld	a2,0(a5)
    8000650c:	02c6fc63          	bgeu	a3,a2,80006544 <add_timer_event+0xb0>
    80006510:	00f43c23          	sd	a5,24(s0)
    80006514:	00873023          	sd	s0,0(a4)
    80006518:	ef9fd0ef          	jal	80004410 <enable_interrupts>
    8000651c:	00000513          	li	a0,0
    80006520:	02813083          	ld	ra,40(sp)
    80006524:	02013403          	ld	s0,32(sp)
    80006528:	01813483          	ld	s1,24(sp)
    8000652c:	01013903          	ld	s2,16(sp)
    80006530:	00813983          	ld	s3,8(sp)
    80006534:	03010113          	add	sp,sp,48
    80006538:	00008067          	ret
    8000653c:	0007b703          	ld	a4,0(a5)
    80006540:	00e6e863          	bltu	a3,a4,80006550 <add_timer_event+0xbc>
    80006544:	00078613          	mv	a2,a5
    80006548:	0187b783          	ld	a5,24(a5)
    8000654c:	fe0798e3          	bnez	a5,8000653c <add_timer_event+0xa8>
    80006550:	00f43c23          	sd	a5,24(s0)
    80006554:	00863c23          	sd	s0,24(a2)
    80006558:	fc1ff06f          	j	80006518 <add_timer_event+0x84>
    8000655c:	fff00513          	li	a0,-1
    80006560:	fc1ff06f          	j	80006520 <add_timer_event+0x8c>
    80006564:	fff00513          	li	a0,-1
    80006568:	00008067          	ret

000000008000656c <remove_timer_events>:
    8000656c:	08050263          	beqz	a0,800065f0 <remove_timer_events+0x84>
    80006570:	fd010113          	add	sp,sp,-48
    80006574:	01313423          	sd	s3,8(sp)
    80006578:	00412997          	auipc	s3,0x412
    8000657c:	c7098993          	add	s3,s3,-912 # 804181e8 <timer_events>
    80006580:	02813023          	sd	s0,32(sp)
    80006584:	00913c23          	sd	s1,24(sp)
    80006588:	01213823          	sd	s2,16(sp)
    8000658c:	02113423          	sd	ra,40(sp)
    80006590:	00050493          	mv	s1,a0
    80006594:	e81fd0ef          	jal	80004414 <disable_interrupts>
    80006598:	0009b403          	ld	s0,0(s3)
    8000659c:	00000913          	li	s2,0
    800065a0:	00040e63          	beqz	s0,800065bc <remove_timer_events+0x50>
    800065a4:	00843783          	ld	a5,8(s0)
    800065a8:	00040513          	mv	a0,s0
    800065ac:	01843403          	ld	s0,24(s0)
    800065b0:	02978463          	beq	a5,s1,800065d8 <remove_timer_events+0x6c>
    800065b4:	00050913          	mv	s2,a0
    800065b8:	fe0416e3          	bnez	s0,800065a4 <remove_timer_events+0x38>
    800065bc:	02013403          	ld	s0,32(sp)
    800065c0:	02813083          	ld	ra,40(sp)
    800065c4:	01813483          	ld	s1,24(sp)
    800065c8:	01013903          	ld	s2,16(sp)
    800065cc:	00813983          	ld	s3,8(sp)
    800065d0:	03010113          	add	sp,sp,48
    800065d4:	e3dfd06f          	j	80004410 <enable_interrupts>
    800065d8:	00090863          	beqz	s2,800065e8 <remove_timer_events+0x7c>
    800065dc:	00893c23          	sd	s0,24(s2)
    800065e0:	ee1fb0ef          	jal	800024c0 <free_page>
    800065e4:	fbdff06f          	j	800065a0 <remove_timer_events+0x34>
    800065e8:	0089b023          	sd	s0,0(s3)
    800065ec:	ff5ff06f          	j	800065e0 <remove_timer_events+0x74>
    800065f0:	00008067          	ret

00000000800065f4 <process_timer_events>:
    800065f4:	fe010113          	add	sp,sp,-32
    800065f8:	00410797          	auipc	a5,0x410
    800065fc:	f407b783          	ld	a5,-192(a5) # 80416538 <sys_time>
    80006600:	01213023          	sd	s2,0(sp)
    80006604:	3e800913          	li	s2,1000
    80006608:	02f90933          	mul	s2,s2,a5
    8000660c:	00913423          	sd	s1,8(sp)
    80006610:	00412497          	auipc	s1,0x412
    80006614:	bd848493          	add	s1,s1,-1064 # 804181e8 <timer_events>
    80006618:	00813823          	sd	s0,16(sp)
    8000661c:	0004b403          	ld	s0,0(s1)
    80006620:	06400793          	li	a5,100
    80006624:	00113c23          	sd	ra,24(sp)
    80006628:	02f95933          	divu	s2,s2,a5
    8000662c:	02041863          	bnez	s0,8000665c <process_timer_events+0x68>
    80006630:	0340006f          	j	80006664 <process_timer_events+0x70>
    80006634:	01843703          	ld	a4,24(s0)
    80006638:	00843783          	ld	a5,8(s0)
    8000663c:	00e4b023          	sd	a4,0(s1)
    80006640:	00078663          	beqz	a5,8000664c <process_timer_events+0x58>
    80006644:	01043503          	ld	a0,16(s0)
    80006648:	000780e7          	jalr	a5
    8000664c:	00040513          	mv	a0,s0
    80006650:	e71fb0ef          	jal	800024c0 <free_page>
    80006654:	0004b403          	ld	s0,0(s1)
    80006658:	00040663          	beqz	s0,80006664 <process_timer_events+0x70>
    8000665c:	00043783          	ld	a5,0(s0)
    80006660:	fcf97ae3          	bgeu	s2,a5,80006634 <process_timer_events+0x40>
    80006664:	01813083          	ld	ra,24(sp)
    80006668:	01013403          	ld	s0,16(sp)
    8000666c:	00813483          	ld	s1,8(sp)
    80006670:	00013903          	ld	s2,0(sp)
    80006674:	02010113          	add	sp,sp,32
    80006678:	00008067          	ret

000000008000667c <timer_interrupt_handler>:
    8000667c:	fd010113          	add	sp,sp,-48
    80006680:	02113423          	sd	ra,40(sp)
    80006684:	02813023          	sd	s0,32(sp)
    80006688:	00913c23          	sd	s1,24(sp)
    8000668c:	00410417          	auipc	s0,0x410
    80006690:	eac40413          	add	s0,s0,-340 # 80416538 <sys_time>
    80006694:	01213823          	sd	s2,16(sp)
    80006698:	01313423          	sd	s3,8(sp)
    8000669c:	ac5ff0ef          	jal	80006160 <get_time>
    800066a0:	00043703          	ld	a4,0(s0)
    800066a4:	3e800693          	li	a3,1000
    800066a8:	01843603          	ld	a2,24(s0)
    800066ac:	00170713          	add	a4,a4,1
    800066b0:	02d707b3          	mul	a5,a4,a3
    800066b4:	00e43023          	sd	a4,0(s0)
    800066b8:	06400713          	li	a4,100
    800066bc:	00160613          	add	a2,a2,1
    800066c0:	00412497          	auipc	s1,0x412
    800066c4:	b2048493          	add	s1,s1,-1248 # 804181e0 <next_timer_interrupt>
    800066c8:	00050993          	mv	s3,a0
    800066cc:	00c43c23          	sd	a2,24(s0)
    800066d0:	00018937          	lui	s2,0x18
    800066d4:	6a090913          	add	s2,s2,1696 # 186a0 <_entry-0x7ffe7960>
    800066d8:	02e7d7b3          	divu	a5,a5,a4
    800066dc:	02d7d733          	divu	a4,a5,a3
    800066e0:	02d7f7b3          	remu	a5,a5,a3
    800066e4:	00e43423          	sd	a4,8(s0)
    800066e8:	00f43823          	sd	a5,16(s0)
    800066ec:	f09ff0ef          	jal	800065f4 <process_timer_events>
    800066f0:	0b1000ef          	jal	80006fa0 <schedule_from_timer>
    800066f4:	0004b783          	ld	a5,0(s1)
    800066f8:	012787b3          	add	a5,a5,s2
    800066fc:	00f4b023          	sd	a5,0(s1)
    80006700:	a61ff0ef          	jal	80006160 <get_time>
    80006704:	00050793          	mv	a5,a0
    80006708:	0004b503          	ld	a0,0(s1)
    8000670c:	00f57c63          	bgeu	a0,a5,80006724 <timer_interrupt_handler+0xa8>
    80006710:	02043703          	ld	a4,32(s0)
    80006714:	01278533          	add	a0,a5,s2
    80006718:	00a4b023          	sd	a0,0(s1)
    8000671c:	00170793          	add	a5,a4,1
    80006720:	02f43023          	sd	a5,32(s0)
    80006724:	a19ff0ef          	jal	8000613c <sbi_set_timer>
    80006728:	a39ff0ef          	jal	80006160 <get_time>
    8000672c:	02843783          	ld	a5,40(s0)
    80006730:	41350733          	sub	a4,a0,s3
    80006734:	00e7f463          	bgeu	a5,a4,8000673c <timer_interrupt_handler+0xc0>
    80006738:	02e43423          	sd	a4,40(s0)
    8000673c:	01843683          	ld	a3,24(s0)
    80006740:	03043603          	ld	a2,48(s0)
    80006744:	02813083          	ld	ra,40(sp)
    80006748:	fff68793          	add	a5,a3,-1
    8000674c:	02c787b3          	mul	a5,a5,a2
    80006750:	01813483          	ld	s1,24(sp)
    80006754:	01013903          	ld	s2,16(sp)
    80006758:	00813983          	ld	s3,8(sp)
    8000675c:	00000513          	li	a0,0
    80006760:	00e787b3          	add	a5,a5,a4
    80006764:	02d7d7b3          	divu	a5,a5,a3
    80006768:	02f43823          	sd	a5,48(s0)
    8000676c:	02013403          	ld	s0,32(sp)
    80006770:	03010113          	add	sp,sp,48
    80006774:	00008067          	ret

0000000080006778 <print_timer_stats>:
    80006778:	fc010113          	add	sp,sp,-64
    8000677c:	00005517          	auipc	a0,0x5
    80006780:	93c50513          	add	a0,a0,-1732 # 8000b0b8 <trap_names+0x3c8>
    80006784:	02113c23          	sd	ra,56(sp)
    80006788:	02813823          	sd	s0,48(sp)
    8000678c:	02913423          	sd	s1,40(sp)
    80006790:	03213023          	sd	s2,32(sp)
    80006794:	c65fb0ef          	jal	800023f8 <uart_puts>
    80006798:	00004517          	auipc	a0,0x4
    8000679c:	7b050513          	add	a0,a0,1968 # 8000af48 <trap_names+0x258>
    800067a0:	00410917          	auipc	s2,0x410
    800067a4:	d9890913          	add	s2,s2,-616 # 80416538 <sys_time>
    800067a8:	c51fb0ef          	jal	800023f8 <uart_puts>
    800067ac:	01893503          	ld	a0,24(s2)
    800067b0:	00810413          	add	s0,sp,8
    800067b4:	00510493          	add	s1,sp,5
    800067b8:	ac1ff0ef          	jal	80006278 <print_decimal>
    800067bc:	00002517          	auipc	a0,0x2
    800067c0:	5d450513          	add	a0,a0,1492 # 80008d90 <rodata_start+0xd90>
    800067c4:	c35fb0ef          	jal	800023f8 <uart_puts>
    800067c8:	00005517          	auipc	a0,0x5
    800067cc:	91050513          	add	a0,a0,-1776 # 8000b0d8 <trap_names+0x3e8>
    800067d0:	c29fb0ef          	jal	800023f8 <uart_puts>
    800067d4:	02093503          	ld	a0,32(s2)
    800067d8:	aa1ff0ef          	jal	80006278 <print_decimal>
    800067dc:	00002517          	auipc	a0,0x2
    800067e0:	5b450513          	add	a0,a0,1460 # 80008d90 <rodata_start+0xd90>
    800067e4:	c15fb0ef          	jal	800023f8 <uart_puts>
    800067e8:	00005517          	auipc	a0,0x5
    800067ec:	90850513          	add	a0,a0,-1784 # 8000b0f0 <trap_names+0x400>
    800067f0:	c09fb0ef          	jal	800023f8 <uart_puts>
    800067f4:	02893503          	ld	a0,40(s2)
    800067f8:	a81ff0ef          	jal	80006278 <print_decimal>
    800067fc:	00005517          	auipc	a0,0x5
    80006800:	90c50513          	add	a0,a0,-1780 # 8000b108 <trap_names+0x418>
    80006804:	bf5fb0ef          	jal	800023f8 <uart_puts>
    80006808:	00005517          	auipc	a0,0x5
    8000680c:	91050513          	add	a0,a0,-1776 # 8000b118 <trap_names+0x428>
    80006810:	be9fb0ef          	jal	800023f8 <uart_puts>
    80006814:	03093503          	ld	a0,48(s2)
    80006818:	a61ff0ef          	jal	80006278 <print_decimal>
    8000681c:	00005517          	auipc	a0,0x5
    80006820:	8ec50513          	add	a0,a0,-1812 # 8000b108 <trap_names+0x418>
    80006824:	bd5fb0ef          	jal	800023f8 <uart_puts>
    80006828:	00005517          	auipc	a0,0x5
    8000682c:	90850513          	add	a0,a0,-1784 # 8000b130 <trap_names+0x440>
    80006830:	bc9fb0ef          	jal	800023f8 <uart_puts>
    80006834:	00893503          	ld	a0,8(s2)
    80006838:	a41ff0ef          	jal	80006278 <print_decimal>
    8000683c:	00005517          	auipc	a0,0x5
    80006840:	90c50513          	add	a0,a0,-1780 # 8000b148 <trap_names+0x458>
    80006844:	bb5fb0ef          	jal	800023f8 <uart_puts>
    80006848:	01093503          	ld	a0,16(s2)
    8000684c:	a2dff0ef          	jal	80006278 <print_decimal>
    80006850:	00005517          	auipc	a0,0x5
    80006854:	90050513          	add	a0,a0,-1792 # 8000b150 <trap_names+0x460>
    80006858:	ba1fb0ef          	jal	800023f8 <uart_puts>
    8000685c:	00005517          	auipc	a0,0x5
    80006860:	8fc50513          	add	a0,a0,-1796 # 8000b158 <trap_names+0x468>
    80006864:	b95fb0ef          	jal	800023f8 <uart_puts>
    80006868:	000037b7          	lui	a5,0x3
    8000686c:	03078793          	add	a5,a5,48 # 3030 <_entry-0x7fffcfd0>
    80006870:	00f11423          	sh	a5,8(sp)
    80006874:	03100793          	li	a5,49
    80006878:	00f10523          	sb	a5,10(sp)
    8000687c:	00244503          	lbu	a0,2(s0)
    80006880:	fff40413          	add	s0,s0,-1
    80006884:	b5dfb0ef          	jal	800023e0 <uart_putc>
    80006888:	fe849ae3          	bne	s1,s0,8000687c <print_timer_stats+0x104>
    8000688c:	03013403          	ld	s0,48(sp)
    80006890:	03813083          	ld	ra,56(sp)
    80006894:	02813483          	ld	s1,40(sp)
    80006898:	02013903          	ld	s2,32(sp)
    8000689c:	00005517          	auipc	a0,0x5
    800068a0:	8d450513          	add	a0,a0,-1836 # 8000b170 <trap_names+0x480>
    800068a4:	04010113          	add	sp,sp,64
    800068a8:	b51fb06f          	j	800023f8 <uart_puts>

00000000800068ac <reset_timer_stats>:
    800068ac:	00410797          	auipc	a5,0x410
    800068b0:	c8c78793          	add	a5,a5,-884 # 80416538 <sys_time>
    800068b4:	0007bc23          	sd	zero,24(a5)
    800068b8:	0207b023          	sd	zero,32(a5)
    800068bc:	0207b423          	sd	zero,40(a5)
    800068c0:	0207b823          	sd	zero,48(a5)
    800068c4:	00008067          	ret

00000000800068c8 <remove_from_ready_queue>:
    800068c8:	00852603          	lw	a2,8(a0)
    800068cc:	00410597          	auipc	a1,0x410
    800068d0:	ca458593          	add	a1,a1,-860 # 80416570 <ready_queue>
    800068d4:	00361613          	sll	a2,a2,0x3
    800068d8:	00c58833          	add	a6,a1,a2
    800068dc:	00083703          	ld	a4,0(a6)
    800068e0:	02070a63          	beqz	a4,80006914 <remove_from_ready_queue+0x4c>
    800068e4:	03873783          	ld	a5,56(a4)
    800068e8:	00070693          	mv	a3,a4
    800068ec:	02a70663          	beq	a4,a0,80006918 <remove_from_ready_queue+0x50>
    800068f0:	00f50a63          	beq	a0,a5,80006904 <remove_from_ready_queue+0x3c>
    800068f4:	02f70063          	beq	a4,a5,80006914 <remove_from_ready_queue+0x4c>
    800068f8:	00078693          	mv	a3,a5
    800068fc:	0387b783          	ld	a5,56(a5)
    80006900:	fef51ae3          	bne	a0,a5,800068f4 <remove_from_ready_queue+0x2c>
    80006904:	03853783          	ld	a5,56(a0)
    80006908:	02f6bc23          	sd	a5,56(a3)
    8000690c:	00a70e63          	beq	a4,a0,80006928 <remove_from_ready_queue+0x60>
    80006910:	02053c23          	sd	zero,56(a0)
    80006914:	00008067          	ret
    80006918:	fce79ce3          	bne	a5,a4,800068f0 <remove_from_ready_queue+0x28>
    8000691c:	00083023          	sd	zero,0(a6)
    80006920:	0207bc23          	sd	zero,56(a5)
    80006924:	00008067          	ret
    80006928:	00c585b3          	add	a1,a1,a2
    8000692c:	00d5b023          	sd	a3,0(a1)
    80006930:	02053c23          	sd	zero,56(a0)
    80006934:	fe1ff06f          	j	80006914 <remove_from_ready_queue+0x4c>

0000000080006938 <idle_task>:
    80006938:	fe010113          	add	sp,sp,-32
    8000693c:	00005517          	auipc	a0,0x5
    80006940:	83c50513          	add	a0,a0,-1988 # 8000b178 <trap_names+0x488>
    80006944:	00113c23          	sd	ra,24(sp)
    80006948:	801fb0ef          	jal	80002148 <printf>
    8000694c:	000f4737          	lui	a4,0xf4
    80006950:	23f70713          	add	a4,a4,575 # f423f <_entry-0x7ff0bdc1>
    80006954:	00012623          	sw	zero,12(sp)
    80006958:	00c12783          	lw	a5,12(sp)
    8000695c:	fef74ce3          	blt	a4,a5,80006954 <idle_task+0x1c>
    80006960:	00c12783          	lw	a5,12(sp)
    80006964:	0017879b          	addw	a5,a5,1
    80006968:	00f12623          	sw	a5,12(sp)
    8000696c:	00c12783          	lw	a5,12(sp)
    80006970:	fef758e3          	bge	a4,a5,80006960 <idle_task+0x28>
    80006974:	fe1ff06f          	j	80006954 <idle_task+0x1c>

0000000080006978 <create_task>:
    80006978:	fc010113          	add	sp,sp,-64
    8000697c:	02813823          	sd	s0,48(sp)
    80006980:	03213023          	sd	s2,32(sp)
    80006984:	01613023          	sd	s6,0(sp)
    80006988:	02113c23          	sd	ra,56(sp)
    8000698c:	02913423          	sd	s1,40(sp)
    80006990:	01313c23          	sd	s3,24(sp)
    80006994:	01413823          	sd	s4,16(sp)
    80006998:	01513423          	sd	s5,8(sp)
    8000699c:	00050b13          	mv	s6,a0
    800069a0:	00058913          	mv	s2,a1
    800069a4:	00410797          	auipc	a5,0x410
    800069a8:	c1078793          	add	a5,a5,-1008 # 804165b4 <tasks+0x4>
    800069ac:	00000413          	li	s0,0
    800069b0:	04000693          	li	a3,64
    800069b4:	00c0006f          	j	800069c0 <create_task+0x48>
    800069b8:	0014041b          	addw	s0,s0,1
    800069bc:	18d40863          	beq	s0,a3,80006b4c <create_task+0x1d4>
    800069c0:	0007a703          	lw	a4,0(a5)
    800069c4:	07078793          	add	a5,a5,112
    800069c8:	fe0718e3          	bnez	a4,800069b8 <create_task+0x40>
    800069cc:	02061793          	sll	a5,a2,0x20
    800069d0:	00005697          	auipc	a3,0x5
    800069d4:	63068693          	add	a3,a3,1584 # 8000c000 <next_pid>
    800069d8:	01d7d593          	srl	a1,a5,0x1d
    800069dc:	00341993          	sll	s3,s0,0x3
    800069e0:	00005797          	auipc	a5,0x5
    800069e4:	b3078793          	add	a5,a5,-1232 # 8000b510 <TIME_SLICES>
    800069e8:	0006a703          	lw	a4,0(a3)
    800069ec:	00b787b3          	add	a5,a5,a1
    800069f0:	40898a33          	sub	s4,s3,s0
    800069f4:	0007b783          	ld	a5,0(a5)
    800069f8:	004a1a13          	sll	s4,s4,0x4
    800069fc:	00410a97          	auipc	s5,0x410
    80006a00:	bb4a8a93          	add	s5,s5,-1100 # 804165b0 <tasks>
    80006a04:	014a84b3          	add	s1,s5,s4
    80006a08:	0017059b          	addw	a1,a4,1
    80006a0c:	00e4a023          	sw	a4,0(s1)
    80006a10:	00100713          	li	a4,1
    80006a14:	00c4a423          	sw	a2,8(s1)
    80006a18:	00f4b823          	sd	a5,16(s1)
    80006a1c:	00b6a023          	sw	a1,0(a3)
    80006a20:	00e4a223          	sw	a4,4(s1)
    80006a24:	0004bc23          	sd	zero,24(s1)
    80006a28:	a3dff0ef          	jal	80006464 <get_system_time>
    80006a2c:	02a4b023          	sd	a0,32(s1)
    80006a30:	0404a023          	sw	zero,64(s1)
    80006a34:	0764b423          	sd	s6,104(s1)
    80006a38:	0204bc23          	sd	zero,56(s1)
    80006a3c:	00000793          	li	a5,0
    80006a40:	01f00613          	li	a2,31
    80006a44:	0100006f          	j	80006a54 <create_task+0xdc>
    80006a48:	04e68223          	sb	a4,68(a3)
    80006a4c:	00178793          	add	a5,a5,1
    80006a50:	0ec78463          	beq	a5,a2,80006b38 <create_task+0x1c0>
    80006a54:	00f90733          	add	a4,s2,a5
    80006a58:	00074703          	lbu	a4,0(a4)
    80006a5c:	00f486b3          	add	a3,s1,a5
    80006a60:	fe0714e3          	bnez	a4,80006a48 <create_task+0xd0>
    80006a64:	0007879b          	sext.w	a5,a5
    80006a68:	40898733          	sub	a4,s3,s0
    80006a6c:	00471713          	sll	a4,a4,0x4
    80006a70:	00ea8733          	add	a4,s5,a4
    80006a74:	00072603          	lw	a2,0(a4)
    80006a78:	00872503          	lw	a0,8(a4)
    80006a7c:	800005b7          	lui	a1,0x80000
    80006a80:	00c6169b          	sllw	a3,a2,0xc
    80006a84:	00b686bb          	addw	a3,a3,a1
    80006a88:	00410817          	auipc	a6,0x410
    80006a8c:	ae880813          	add	a6,a6,-1304 # 80416570 <ready_queue>
    80006a90:	00351513          	sll	a0,a0,0x3
    80006a94:	00a80533          	add	a0,a6,a0
    80006a98:	02069693          	sll	a3,a3,0x20
    80006a9c:	000015b7          	lui	a1,0x1
    80006aa0:	0206d693          	srl	a3,a3,0x20
    80006aa4:	00f707b3          	add	a5,a4,a5
    80006aa8:	ee058593          	add	a1,a1,-288 # ee0 <_entry-0x7ffff120>
    80006aac:	00053883          	ld	a7,0(a0)
    80006ab0:	00b685b3          	add	a1,a3,a1
    80006ab4:	04078223          	sb	zero,68(a5)
    80006ab8:	00300793          	li	a5,3
    80006abc:	02d73823          	sd	a3,48(a4)
    80006ac0:	02b73423          	sd	a1,40(a4)
    80006ac4:	00f72223          	sw	a5,4(a4)
    80006ac8:	06088c63          	beqz	a7,80006b40 <create_task+0x1c8>
    80006acc:	0388b783          	ld	a5,56(a7)
    80006ad0:	00953023          	sd	s1,0(a0)
    80006ad4:	02f73c23          	sd	a5,56(a4)
    80006ad8:	0298bc23          	sd	s1,56(a7)
    80006adc:	40898433          	sub	s0,s3,s0
    80006ae0:	00441413          	sll	s0,s0,0x4
    80006ae4:	03083783          	ld	a5,48(a6)
    80006ae8:	008a8433          	add	s0,s5,s0
    80006aec:	00842683          	lw	a3,8(s0)
    80006af0:	044a0593          	add	a1,s4,68
    80006af4:	00178793          	add	a5,a5,1
    80006af8:	00ba85b3          	add	a1,s5,a1
    80006afc:	00004517          	auipc	a0,0x4
    80006b00:	6bc50513          	add	a0,a0,1724 # 8000b1b8 <trap_names+0x4c8>
    80006b04:	02f83823          	sd	a5,48(a6)
    80006b08:	e40fb0ef          	jal	80002148 <printf>
    80006b0c:	00042503          	lw	a0,0(s0)
    80006b10:	03813083          	ld	ra,56(sp)
    80006b14:	03013403          	ld	s0,48(sp)
    80006b18:	02813483          	ld	s1,40(sp)
    80006b1c:	02013903          	ld	s2,32(sp)
    80006b20:	01813983          	ld	s3,24(sp)
    80006b24:	01013a03          	ld	s4,16(sp)
    80006b28:	00813a83          	ld	s5,8(sp)
    80006b2c:	00013b03          	ld	s6,0(sp)
    80006b30:	04010113          	add	sp,sp,64
    80006b34:	00008067          	ret
    80006b38:	01f00793          	li	a5,31
    80006b3c:	f2dff06f          	j	80006a68 <create_task+0xf0>
    80006b40:	00953023          	sd	s1,0(a0)
    80006b44:	02973c23          	sd	s1,56(a4)
    80006b48:	f95ff06f          	j	80006adc <create_task+0x164>
    80006b4c:	00004517          	auipc	a0,0x4
    80006b50:	64c50513          	add	a0,a0,1612 # 8000b198 <trap_names+0x4a8>
    80006b54:	df4fb0ef          	jal	80002148 <printf>
    80006b58:	fff00513          	li	a0,-1
    80006b5c:	fb5ff06f          	j	80006b10 <create_task+0x198>

0000000080006b60 <scheduler_init>:
    80006b60:	fe010113          	add	sp,sp,-32
    80006b64:	00004517          	auipc	a0,0x4
    80006b68:	68c50513          	add	a0,a0,1676 # 8000b1f0 <trap_names+0x500>
    80006b6c:	00813823          	sd	s0,16(sp)
    80006b70:	00113c23          	sd	ra,24(sp)
    80006b74:	00913423          	sd	s1,8(sp)
    80006b78:	00410417          	auipc	s0,0x410
    80006b7c:	a3840413          	add	s0,s0,-1480 # 804165b0 <tasks>
    80006b80:	dc8fb0ef          	jal	80002148 <printf>
    80006b84:	00040793          	mv	a5,s0
    80006b88:	00411717          	auipc	a4,0x411
    80006b8c:	62870713          	add	a4,a4,1576 # 804181b0 <mem_end>
    80006b90:	0007a223          	sw	zero,4(a5)
    80006b94:	0007a023          	sw	zero,0(a5)
    80006b98:	0207bc23          	sd	zero,56(a5)
    80006b9c:	07078793          	add	a5,a5,112
    80006ba0:	fef718e3          	bne	a4,a5,80006b90 <scheduler_init+0x30>
    80006ba4:	00000613          	li	a2,0
    80006ba8:	00004597          	auipc	a1,0x4
    80006bac:	67058593          	add	a1,a1,1648 # 8000b218 <trap_names+0x528>
    80006bb0:	00000517          	auipc	a0,0x0
    80006bb4:	d8850513          	add	a0,a0,-632 # 80006938 <idle_task>
    80006bb8:	00410797          	auipc	a5,0x410
    80006bbc:	9a07bc23          	sd	zero,-1608(a5) # 80416570 <ready_queue>
    80006bc0:	00410797          	auipc	a5,0x410
    80006bc4:	9a07bc23          	sd	zero,-1608(a5) # 80416578 <ready_queue+0x8>
    80006bc8:	00410797          	auipc	a5,0x410
    80006bcc:	9a07bc23          	sd	zero,-1608(a5) # 80416580 <ready_queue+0x10>
    80006bd0:	00410797          	auipc	a5,0x410
    80006bd4:	9a07bc23          	sd	zero,-1608(a5) # 80416588 <ready_queue+0x18>
    80006bd8:	da1ff0ef          	jal	80006978 <create_task>
    80006bdc:	00411497          	auipc	s1,0x411
    80006be0:	61c48493          	add	s1,s1,1564 # 804181f8 <idle_task_ptr>
    80006be4:	02a05663          	blez	a0,80006c10 <scheduler_init+0xb0>
    80006be8:	fff5071b          	addw	a4,a0,-1
    80006bec:	00371793          	sll	a5,a4,0x3
    80006bf0:	40e787b3          	sub	a5,a5,a4
    80006bf4:	00479793          	sll	a5,a5,0x4
    80006bf8:	00f40433          	add	s0,s0,a5
    80006bfc:	00050593          	mv	a1,a0
    80006c00:	00004517          	auipc	a0,0x4
    80006c04:	62050513          	add	a0,a0,1568 # 8000b220 <trap_names+0x530>
    80006c08:	0084b023          	sd	s0,0(s1)
    80006c0c:	d3cfb0ef          	jal	80002148 <printf>
    80006c10:	0004b783          	ld	a5,0(s1)
    80006c14:	00411717          	auipc	a4,0x411
    80006c18:	5ef73623          	sd	a5,1516(a4) # 80418200 <current_task>
    80006c1c:	00078663          	beqz	a5,80006c28 <scheduler_init+0xc8>
    80006c20:	00400713          	li	a4,4
    80006c24:	00e7a223          	sw	a4,4(a5)
    80006c28:	01013403          	ld	s0,16(sp)
    80006c2c:	01813083          	ld	ra,24(sp)
    80006c30:	00813483          	ld	s1,8(sp)
    80006c34:	00004517          	auipc	a0,0x4
    80006c38:	61450513          	add	a0,a0,1556 # 8000b248 <trap_names+0x558>
    80006c3c:	02010113          	add	sp,sp,32
    80006c40:	d08fb06f          	j	80002148 <printf>

0000000080006c44 <pick_next_task>:
    80006c44:	00410597          	auipc	a1,0x410
    80006c48:	92c58593          	add	a1,a1,-1748 # 80416570 <ready_queue>
    80006c4c:	00058713          	mv	a4,a1
    80006c50:	00300793          	li	a5,3
    80006c54:	fff00613          	li	a2,-1
    80006c58:	01873683          	ld	a3,24(a4)
    80006c5c:	ff870713          	add	a4,a4,-8
    80006c60:	00069c63          	bnez	a3,80006c78 <pick_next_task+0x34>
    80006c64:	fff7879b          	addw	a5,a5,-1
    80006c68:	fec798e3          	bne	a5,a2,80006c58 <pick_next_task+0x14>
    80006c6c:	00411517          	auipc	a0,0x411
    80006c70:	58c53503          	ld	a0,1420(a0) # 804181f8 <idle_task_ptr>
    80006c74:	00008067          	ret
    80006c78:	0386b503          	ld	a0,56(a3)
    80006c7c:	00379793          	sll	a5,a5,0x3
    80006c80:	00f585b3          	add	a1,a1,a5
    80006c84:	00a5b023          	sd	a0,0(a1)
    80006c88:	00008067          	ret

0000000080006c8c <schedule>:
    80006c8c:	fe010113          	add	sp,sp,-32
    80006c90:	00411817          	auipc	a6,0x411
    80006c94:	57080813          	add	a6,a6,1392 # 80418200 <current_task>
    80006c98:	00913423          	sd	s1,8(sp)
    80006c9c:	00083483          	ld	s1,0(a6)
    80006ca0:	00113c23          	sd	ra,24(sp)
    80006ca4:	00813823          	sd	s0,16(sp)
    80006ca8:	0a048263          	beqz	s1,80006d4c <schedule+0xc0>
    80006cac:	00410597          	auipc	a1,0x410
    80006cb0:	8c458593          	add	a1,a1,-1852 # 80416570 <ready_queue>
    80006cb4:	00058713          	mv	a4,a1
    80006cb8:	00300793          	li	a5,3
    80006cbc:	fff00613          	li	a2,-1
    80006cc0:	01873683          	ld	a3,24(a4)
    80006cc4:	ff870713          	add	a4,a4,-8
    80006cc8:	0a069463          	bnez	a3,80006d70 <schedule+0xe4>
    80006ccc:	fff7879b          	addw	a5,a5,-1
    80006cd0:	fec798e3          	bne	a5,a2,80006cc0 <schedule+0x34>
    80006cd4:	00411417          	auipc	s0,0x411
    80006cd8:	52443403          	ld	s0,1316(s0) # 804181f8 <idle_task_ptr>
    80006cdc:	08040263          	beqz	s0,80006d60 <schedule+0xd4>
    80006ce0:	06848063          	beq	s1,s0,80006d40 <schedule+0xb4>
    80006ce4:	0205b783          	ld	a5,32(a1)
    80006ce8:	0044a683          	lw	a3,4(s1)
    80006cec:	00400713          	li	a4,4
    80006cf0:	00178793          	add	a5,a5,1
    80006cf4:	02f5b023          	sd	a5,32(a1)
    80006cf8:	00e69663          	bne	a3,a4,80006d04 <schedule+0x78>
    80006cfc:	00300793          	li	a5,3
    80006d00:	00f4a223          	sw	a5,4(s1)
    80006d04:	0004a603          	lw	a2,0(s1)
    80006d08:	00042703          	lw	a4,0(s0)
    80006d0c:	00400793          	li	a5,4
    80006d10:	04448593          	add	a1,s1,68
    80006d14:	00f42223          	sw	a5,4(s0)
    80006d18:	04440693          	add	a3,s0,68
    80006d1c:	00004517          	auipc	a0,0x4
    80006d20:	55450513          	add	a0,a0,1364 # 8000b270 <trap_names+0x580>
    80006d24:	00883023          	sd	s0,0(a6)
    80006d28:	c20fb0ef          	jal	80002148 <printf>
    80006d2c:	00042603          	lw	a2,0(s0)
    80006d30:	0004a583          	lw	a1,0(s1)
    80006d34:	00004517          	auipc	a0,0x4
    80006d38:	57450513          	add	a0,a0,1396 # 8000b2a8 <trap_names+0x5b8>
    80006d3c:	c0cfb0ef          	jal	80002148 <printf>
    80006d40:	f24ff0ef          	jal	80006464 <get_system_time>
    80006d44:	00411797          	auipc	a5,0x411
    80006d48:	4aa7b623          	sd	a0,1196(a5) # 804181f0 <last_schedule_time>
    80006d4c:	01813083          	ld	ra,24(sp)
    80006d50:	01013403          	ld	s0,16(sp)
    80006d54:	00813483          	ld	s1,8(sp)
    80006d58:	02010113          	add	sp,sp,32
    80006d5c:	00008067          	ret
    80006d60:	00411417          	auipc	s0,0x411
    80006d64:	49843403          	ld	s0,1176(s0) # 804181f8 <idle_task_ptr>
    80006d68:	f6849ee3          	bne	s1,s0,80006ce4 <schedule+0x58>
    80006d6c:	fd5ff06f          	j	80006d40 <schedule+0xb4>
    80006d70:	0386b403          	ld	s0,56(a3)
    80006d74:	00379793          	sll	a5,a5,0x3
    80006d78:	00f587b3          	add	a5,a1,a5
    80006d7c:	0087b023          	sd	s0,0(a5)
    80006d80:	f60410e3          	bnez	s0,80006ce0 <schedule+0x54>
    80006d84:	fddff06f          	j	80006d60 <schedule+0xd4>

0000000080006d88 <switch_task>:
    80006d88:	0005a603          	lw	a2,0(a1)
    80006d8c:	00052583          	lw	a1,0(a0)
    80006d90:	00004517          	auipc	a0,0x4
    80006d94:	51850513          	add	a0,a0,1304 # 8000b2a8 <trap_names+0x5b8>
    80006d98:	bb0fb06f          	j	80002148 <printf>

0000000080006d9c <task_yield>:
    80006d9c:	00411597          	auipc	a1,0x411
    80006da0:	4645b583          	ld	a1,1124(a1) # 80418200 <current_task>
    80006da4:	0005a603          	lw	a2,0(a1)
    80006da8:	ff010113          	add	sp,sp,-16
    80006dac:	04458593          	add	a1,a1,68
    80006db0:	00004517          	auipc	a0,0x4
    80006db4:	53050513          	add	a0,a0,1328 # 8000b2e0 <trap_names+0x5f0>
    80006db8:	00113423          	sd	ra,8(sp)
    80006dbc:	b8cfb0ef          	jal	80002148 <printf>
    80006dc0:	00813083          	ld	ra,8(sp)
    80006dc4:	01010113          	add	sp,sp,16
    80006dc8:	ec5ff06f          	j	80006c8c <schedule>

0000000080006dcc <task_exit>:
    80006dcc:	ff010113          	add	sp,sp,-16
    80006dd0:	00813023          	sd	s0,0(sp)
    80006dd4:	00411417          	auipc	s0,0x411
    80006dd8:	42c40413          	add	s0,s0,1068 # 80418200 <current_task>
    80006ddc:	00043583          	ld	a1,0(s0)
    80006de0:	00113423          	sd	ra,8(sp)
    80006de4:	04058863          	beqz	a1,80006e34 <task_exit+0x68>
    80006de8:	0005a603          	lw	a2,0(a1)
    80006dec:	00004517          	auipc	a0,0x4
    80006df0:	52450513          	add	a0,a0,1316 # 8000b310 <trap_names+0x620>
    80006df4:	04458593          	add	a1,a1,68
    80006df8:	b50fb0ef          	jal	80002148 <printf>
    80006dfc:	00043403          	ld	s0,0(s0)
    80006e00:	00040513          	mv	a0,s0
    80006e04:	ac5ff0ef          	jal	800068c8 <remove_from_ready_queue>
    80006e08:	0040f717          	auipc	a4,0x40f
    80006e0c:	76870713          	add	a4,a4,1896 # 80416570 <ready_queue>
    80006e10:	03873783          	ld	a5,56(a4)
    80006e14:	00500693          	li	a3,5
    80006e18:	00d42223          	sw	a3,4(s0)
    80006e1c:	00013403          	ld	s0,0(sp)
    80006e20:	00813083          	ld	ra,8(sp)
    80006e24:	00178793          	add	a5,a5,1
    80006e28:	02f73c23          	sd	a5,56(a4)
    80006e2c:	01010113          	add	sp,sp,16
    80006e30:	e5dff06f          	j	80006c8c <schedule>
    80006e34:	00813083          	ld	ra,8(sp)
    80006e38:	00013403          	ld	s0,0(sp)
    80006e3c:	01010113          	add	sp,sp,16
    80006e40:	00008067          	ret

0000000080006e44 <task_sleep>:
    80006e44:	fe010113          	add	sp,sp,-32
    80006e48:	00913423          	sd	s1,8(sp)
    80006e4c:	00411497          	auipc	s1,0x411
    80006e50:	3b448493          	add	s1,s1,948 # 80418200 <current_task>
    80006e54:	0004b583          	ld	a1,0(s1)
    80006e58:	00113c23          	sd	ra,24(sp)
    80006e5c:	00813823          	sd	s0,16(sp)
    80006e60:	04058863          	beqz	a1,80006eb0 <task_sleep+0x6c>
    80006e64:	00050413          	mv	s0,a0
    80006e68:	04a05463          	blez	a0,80006eb0 <task_sleep+0x6c>
    80006e6c:	0005a603          	lw	a2,0(a1)
    80006e70:	00050693          	mv	a3,a0
    80006e74:	04458593          	add	a1,a1,68
    80006e78:	00004517          	auipc	a0,0x4
    80006e7c:	4c050513          	add	a0,a0,1216 # 8000b338 <trap_names+0x648>
    80006e80:	ac8fb0ef          	jal	80002148 <printf>
    80006e84:	0004b483          	ld	s1,0(s1)
    80006e88:	00048513          	mv	a0,s1
    80006e8c:	a3dff0ef          	jal	800068c8 <remove_from_ready_queue>
    80006e90:	00200793          	li	a5,2
    80006e94:	0484a023          	sw	s0,64(s1)
    80006e98:	01013403          	ld	s0,16(sp)
    80006e9c:	01813083          	ld	ra,24(sp)
    80006ea0:	00f4a223          	sw	a5,4(s1)
    80006ea4:	00813483          	ld	s1,8(sp)
    80006ea8:	02010113          	add	sp,sp,32
    80006eac:	de1ff06f          	j	80006c8c <schedule>
    80006eb0:	01813083          	ld	ra,24(sp)
    80006eb4:	01013403          	ld	s0,16(sp)
    80006eb8:	00813483          	ld	s1,8(sp)
    80006ebc:	02010113          	add	sp,sp,32
    80006ec0:	00008067          	ret

0000000080006ec4 <wakeup_tasks>:
    80006ec4:	fc010113          	add	sp,sp,-64
    80006ec8:	02813823          	sd	s0,48(sp)
    80006ecc:	02913423          	sd	s1,40(sp)
    80006ed0:	03213023          	sd	s2,32(sp)
    80006ed4:	01313c23          	sd	s3,24(sp)
    80006ed8:	01413823          	sd	s4,16(sp)
    80006edc:	01513423          	sd	s5,8(sp)
    80006ee0:	02113c23          	sd	ra,56(sp)
    80006ee4:	0040f417          	auipc	s0,0x40f
    80006ee8:	6cc40413          	add	s0,s0,1740 # 804165b0 <tasks>
    80006eec:	00411917          	auipc	s2,0x411
    80006ef0:	2c490913          	add	s2,s2,708 # 804181b0 <mem_end>
    80006ef4:	00200493          	li	s1,2
    80006ef8:	00004a97          	auipc	s5,0x4
    80006efc:	478a8a93          	add	s5,s5,1144 # 8000b370 <trap_names+0x680>
    80006f00:	00300a13          	li	s4,3
    80006f04:	0040f997          	auipc	s3,0x40f
    80006f08:	66c98993          	add	s3,s3,1644 # 80416570 <ready_queue>
    80006f0c:	00c0006f          	j	80006f18 <wakeup_tasks+0x54>
    80006f10:	07040413          	add	s0,s0,112
    80006f14:	05240e63          	beq	s0,s2,80006f70 <wakeup_tasks+0xac>
    80006f18:	00442783          	lw	a5,4(s0)
    80006f1c:	fe979ae3          	bne	a5,s1,80006f10 <wakeup_tasks+0x4c>
    80006f20:	04042783          	lw	a5,64(s0)
    80006f24:	fff7879b          	addw	a5,a5,-1
    80006f28:	04f42023          	sw	a5,64(s0)
    80006f2c:	fef042e3          	bgtz	a5,80006f10 <wakeup_tasks+0x4c>
    80006f30:	00042603          	lw	a2,0(s0)
    80006f34:	04440593          	add	a1,s0,68
    80006f38:	000a8513          	mv	a0,s5
    80006f3c:	a0cfb0ef          	jal	80002148 <printf>
    80006f40:	00842783          	lw	a5,8(s0)
    80006f44:	01442223          	sw	s4,4(s0)
    80006f48:	00379793          	sll	a5,a5,0x3
    80006f4c:	00f987b3          	add	a5,s3,a5
    80006f50:	0007b703          	ld	a4,0(a5)
    80006f54:	04070063          	beqz	a4,80006f94 <wakeup_tasks+0xd0>
    80006f58:	03873683          	ld	a3,56(a4)
    80006f5c:	0087b023          	sd	s0,0(a5)
    80006f60:	02d43c23          	sd	a3,56(s0)
    80006f64:	02873c23          	sd	s0,56(a4)
    80006f68:	07040413          	add	s0,s0,112
    80006f6c:	fb2416e3          	bne	s0,s2,80006f18 <wakeup_tasks+0x54>
    80006f70:	03813083          	ld	ra,56(sp)
    80006f74:	03013403          	ld	s0,48(sp)
    80006f78:	02813483          	ld	s1,40(sp)
    80006f7c:	02013903          	ld	s2,32(sp)
    80006f80:	01813983          	ld	s3,24(sp)
    80006f84:	01013a03          	ld	s4,16(sp)
    80006f88:	00813a83          	ld	s5,8(sp)
    80006f8c:	04010113          	add	sp,sp,64
    80006f90:	00008067          	ret
    80006f94:	0087b023          	sd	s0,0(a5)
    80006f98:	02843c23          	sd	s0,56(s0)
    80006f9c:	f75ff06f          	j	80006f10 <wakeup_tasks+0x4c>

0000000080006fa0 <schedule_from_timer>:
    80006fa0:	ff010113          	add	sp,sp,-16
    80006fa4:	00813023          	sd	s0,0(sp)
    80006fa8:	00411417          	auipc	s0,0x411
    80006fac:	25840413          	add	s0,s0,600 # 80418200 <current_task>
    80006fb0:	00043783          	ld	a5,0(s0)
    80006fb4:	00113423          	sd	ra,8(sp)
    80006fb8:	06078263          	beqz	a5,8000701c <schedule_from_timer+0x7c>
    80006fbc:	0187b703          	ld	a4,24(a5)
    80006fc0:	00170713          	add	a4,a4,1
    80006fc4:	00e7bc23          	sd	a4,24(a5)
    80006fc8:	c9cff0ef          	jal	80006464 <get_system_time>
    80006fcc:	00043583          	ld	a1,0(s0)
    80006fd0:	00411797          	auipc	a5,0x411
    80006fd4:	2207b783          	ld	a5,544(a5) # 804181f0 <last_schedule_time>
    80006fd8:	40f50533          	sub	a0,a0,a5
    80006fdc:	0105b783          	ld	a5,16(a1)
    80006fe0:	00f57a63          	bgeu	a0,a5,80006ff4 <schedule_from_timer+0x54>
    80006fe4:	00013403          	ld	s0,0(sp)
    80006fe8:	00813083          	ld	ra,8(sp)
    80006fec:	01010113          	add	sp,sp,16
    80006ff0:	ed5ff06f          	j	80006ec4 <wakeup_tasks>
    80006ff4:	0005a603          	lw	a2,0(a1)
    80006ff8:	00004517          	auipc	a0,0x4
    80006ffc:	3a050513          	add	a0,a0,928 # 8000b398 <trap_names+0x6a8>
    80007000:	04458593          	add	a1,a1,68
    80007004:	944fb0ef          	jal	80002148 <printf>
    80007008:	c85ff0ef          	jal	80006c8c <schedule>
    8000700c:	00013403          	ld	s0,0(sp)
    80007010:	00813083          	ld	ra,8(sp)
    80007014:	01010113          	add	sp,sp,16
    80007018:	eadff06f          	j	80006ec4 <wakeup_tasks>
    8000701c:	00813083          	ld	ra,8(sp)
    80007020:	00013403          	ld	s0,0(sp)
    80007024:	01010113          	add	sp,sp,16
    80007028:	00008067          	ret

000000008000702c <get_current_task>:
    8000702c:	00411517          	auipc	a0,0x411
    80007030:	1d453503          	ld	a0,468(a0) # 80418200 <current_task>
    80007034:	00008067          	ret

0000000080007038 <get_task_count>:
    80007038:	0040f797          	auipc	a5,0x40f
    8000703c:	57c78793          	add	a5,a5,1404 # 804165b4 <tasks+0x4>
    80007040:	00411697          	auipc	a3,0x411
    80007044:	17468693          	add	a3,a3,372 # 804181b4 <mem_end+0x4>
    80007048:	00000513          	li	a0,0
    8000704c:	0007a703          	lw	a4,0(a5)
    80007050:	07078793          	add	a5,a5,112
    80007054:	00070463          	beqz	a4,8000705c <get_task_count+0x24>
    80007058:	0015051b          	addw	a0,a0,1
    8000705c:	fed798e3          	bne	a5,a3,8000704c <get_task_count+0x14>
    80007060:	00008067          	ret

0000000080007064 <print_scheduler_stats>:
    80007064:	ff010113          	add	sp,sp,-16
    80007068:	00004517          	auipc	a0,0x4
    8000706c:	36850513          	add	a0,a0,872 # 8000b3d0 <trap_names+0x6e0>
    80007070:	00113423          	sd	ra,8(sp)
    80007074:	00813023          	sd	s0,0(sp)
    80007078:	8d0fb0ef          	jal	80002148 <printf>
    8000707c:	0040f417          	auipc	s0,0x40f
    80007080:	4f440413          	add	s0,s0,1268 # 80416570 <ready_queue>
    80007084:	02043583          	ld	a1,32(s0)
    80007088:	00004517          	auipc	a0,0x4
    8000708c:	36850513          	add	a0,a0,872 # 8000b3f0 <trap_names+0x700>
    80007090:	8b8fb0ef          	jal	80002148 <printf>
    80007094:	03043583          	ld	a1,48(s0)
    80007098:	00004517          	auipc	a0,0x4
    8000709c:	37850513          	add	a0,a0,888 # 8000b410 <trap_names+0x720>
    800070a0:	8a8fb0ef          	jal	80002148 <printf>
    800070a4:	03843583          	ld	a1,56(s0)
    800070a8:	00004517          	auipc	a0,0x4
    800070ac:	38050513          	add	a0,a0,896 # 8000b428 <trap_names+0x738>
    800070b0:	898fb0ef          	jal	80002148 <printf>
    800070b4:	0040f797          	auipc	a5,0x40f
    800070b8:	50078793          	add	a5,a5,1280 # 804165b4 <tasks+0x4>
    800070bc:	00411697          	auipc	a3,0x411
    800070c0:	0f868693          	add	a3,a3,248 # 804181b4 <mem_end+0x4>
    800070c4:	00000593          	li	a1,0
    800070c8:	0007a703          	lw	a4,0(a5)
    800070cc:	07078793          	add	a5,a5,112
    800070d0:	00070463          	beqz	a4,800070d8 <print_scheduler_stats+0x74>
    800070d4:	0015859b          	addw	a1,a1,1
    800070d8:	fed798e3          	bne	a5,a3,800070c8 <print_scheduler_stats+0x64>
    800070dc:	00004517          	auipc	a0,0x4
    800070e0:	36450513          	add	a0,a0,868 # 8000b440 <trap_names+0x750>
    800070e4:	864fb0ef          	jal	80002148 <printf>
    800070e8:	00411797          	auipc	a5,0x411
    800070ec:	1187b783          	ld	a5,280(a5) # 80418200 <current_task>
    800070f0:	02078263          	beqz	a5,80007114 <print_scheduler_stats+0xb0>
    800070f4:	00013403          	ld	s0,0(sp)
    800070f8:	00813083          	ld	ra,8(sp)
    800070fc:	0007a603          	lw	a2,0(a5)
    80007100:	04478593          	add	a1,a5,68
    80007104:	00004517          	auipc	a0,0x4
    80007108:	35450513          	add	a0,a0,852 # 8000b458 <trap_names+0x768>
    8000710c:	01010113          	add	sp,sp,16
    80007110:	838fb06f          	j	80002148 <printf>
    80007114:	00013403          	ld	s0,0(sp)
    80007118:	00813083          	ld	ra,8(sp)
    8000711c:	00004597          	auipc	a1,0x4
    80007120:	2ac58593          	add	a1,a1,684 # 8000b3c8 <trap_names+0x6d8>
    80007124:	00000613          	li	a2,0
    80007128:	00004517          	auipc	a0,0x4
    8000712c:	33050513          	add	a0,a0,816 # 8000b458 <trap_names+0x768>
    80007130:	01010113          	add	sp,sp,16
    80007134:	814fb06f          	j	80002148 <printf>

0000000080007138 <print_task_list>:
    80007138:	fa010113          	add	sp,sp,-96
    8000713c:	00004517          	auipc	a0,0x4
    80007140:	33c50513          	add	a0,a0,828 # 8000b478 <trap_names+0x788>
    80007144:	04113c23          	sd	ra,88(sp)
    80007148:	04813823          	sd	s0,80(sp)
    8000714c:	04913423          	sd	s1,72(sp)
    80007150:	05213023          	sd	s2,64(sp)
    80007154:	03313c23          	sd	s3,56(sp)
    80007158:	ff1fa0ef          	jal	80002148 <printf>
    8000715c:	00004517          	auipc	a0,0x4
    80007160:	33450513          	add	a0,a0,820 # 8000b490 <trap_names+0x7a0>
    80007164:	fe5fa0ef          	jal	80002148 <printf>
    80007168:	0040f417          	auipc	s0,0x40f
    8000716c:	48c40413          	add	s0,s0,1164 # 804165f4 <tasks+0x44>
    80007170:	00411917          	auipc	s2,0x411
    80007174:	08490913          	add	s2,s2,132 # 804181f4 <last_schedule_time+0x4>
    80007178:	00004497          	auipc	s1,0x4
    8000717c:	39848493          	add	s1,s1,920 # 8000b510 <TIME_SLICES>
    80007180:	00004997          	auipc	s3,0x4
    80007184:	33898993          	add	s3,s3,824 # 8000b4b8 <trap_names+0x7c8>
    80007188:	00c0006f          	j	80007194 <print_task_list+0x5c>
    8000718c:	07040413          	add	s0,s0,112
    80007190:	07240863          	beq	s0,s2,80007200 <print_task_list+0xc8>
    80007194:	fc042783          	lw	a5,-64(s0)
    80007198:	fe078ae3          	beqz	a5,8000718c <print_task_list+0x54>
    8000719c:	0284b503          	ld	a0,40(s1)
    800071a0:	0304b583          	ld	a1,48(s1)
    800071a4:	0384b603          	ld	a2,56(s1)
    800071a8:	0404b683          	ld	a3,64(s1)
    800071ac:	0484b703          	ld	a4,72(s1)
    800071b0:	0204b803          	ld	a6,32(s1)
    800071b4:	02079893          	sll	a7,a5,0x20
    800071b8:	01d8d793          	srl	a5,a7,0x1d
    800071bc:	03078793          	add	a5,a5,48
    800071c0:	00a13423          	sd	a0,8(sp)
    800071c4:	00b13823          	sd	a1,16(sp)
    800071c8:	02d13023          	sd	a3,32(sp)
    800071cc:	02e13423          	sd	a4,40(sp)
    800071d0:	01013023          	sd	a6,0(sp)
    800071d4:	00278733          	add	a4,a5,sp
    800071d8:	00c13c23          	sd	a2,24(sp)
    800071dc:	fd443783          	ld	a5,-44(s0)
    800071e0:	fc442683          	lw	a3,-60(s0)
    800071e4:	fbc42583          	lw	a1,-68(s0)
    800071e8:	fd073603          	ld	a2,-48(a4)
    800071ec:	00098513          	mv	a0,s3
    800071f0:	00040713          	mv	a4,s0
    800071f4:	07040413          	add	s0,s0,112
    800071f8:	f51fa0ef          	jal	80002148 <printf>
    800071fc:	f9241ce3          	bne	s0,s2,80007194 <print_task_list+0x5c>
    80007200:	05813083          	ld	ra,88(sp)
    80007204:	05013403          	ld	s0,80(sp)
    80007208:	04813483          	ld	s1,72(sp)
    8000720c:	04013903          	ld	s2,64(sp)
    80007210:	03813983          	ld	s3,56(sp)
    80007214:	06010113          	add	sp,sp,96
    80007218:	00008067          	ret

000000008000721c <update_task_times>:
    8000721c:	00411797          	auipc	a5,0x411
    80007220:	fe47b783          	ld	a5,-28(a5) # 80418200 <current_task>
    80007224:	00078863          	beqz	a5,80007234 <update_task_times+0x18>
    80007228:	0187b703          	ld	a4,24(a5)
    8000722c:	00170713          	add	a4,a4,1
    80007230:	00e7bc23          	sd	a4,24(a5)
    80007234:	00008067          	ret
