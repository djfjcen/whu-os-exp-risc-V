
kernel.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	100002b7          	lui	t0,0x10000
    80000004:	05300313          	li	t1,83
    80000008:	00628023          	sb	t1,0(t0) # 10000000 <_entry-0x70000000>
    8000000c:	00011117          	auipc	sp,0x11
    80000010:	ff410113          	add	sp,sp,-12 # 80011000 <bss_end>
    80000014:	05000313          	li	t1,80
    80000018:	00628023          	sb	t1,0(t0)
    8000001c:	00010297          	auipc	t0,0x10
    80000020:	fe428293          	add	t0,t0,-28 # 80010000 <bss_start>
    80000024:	00011317          	auipc	t1,0x11
    80000028:	fdc30313          	add	t1,t1,-36 # 80011000 <bss_end>

000000008000002c <bss_clear>:
    8000002c:	00628863          	beq	t0,t1,8000003c <bss_done>
    80000030:	0002b023          	sd	zero,0(t0)
    80000034:	00828293          	add	t0,t0,8
    80000038:	ff5ff06f          	j	8000002c <bss_clear>

000000008000003c <bss_done>:
    8000003c:	400000ef          	jal	8000043c <main>

0000000080000040 <loop>:
    80000040:	0000006f          	j	80000040 <loop>

0000000080000044 <performance_test>:
    80000044:	fd010113          	add	sp,sp,-48
    80000048:	00001517          	auipc	a0,0x1
    8000004c:	fb850513          	add	a0,a0,-72 # 80001000 <uart_puts+0x414>
    80000050:	02813023          	sd	s0,32(sp)
    80000054:	00913c23          	sd	s1,24(sp)
    80000058:	01213823          	sd	s2,16(sp)
    8000005c:	01313423          	sd	s3,8(sp)
    80000060:	02113423          	sd	ra,40(sp)
    80000064:	00000413          	li	s0,0
    80000068:	385000ef          	jal	80000bec <uart_puts>
    8000006c:	00001997          	auipc	s3,0x1
    80000070:	4b498993          	add	s3,s3,1204 # 80001520 <long_string>
    80000074:	00001917          	auipc	s2,0x1
    80000078:	fa490913          	add	s2,s2,-92 # 80001018 <uart_puts+0x42c>
    8000007c:	06400493          	li	s1,100
    80000080:	00040593          	mv	a1,s0
    80000084:	00098613          	mv	a2,s3
    80000088:	0014041b          	addw	s0,s0,1
    8000008c:	00090513          	mv	a0,s2
    80000090:	0ad000ef          	jal	8000093c <printf>
    80000094:	fe9416e3          	bne	s0,s1,80000080 <performance_test+0x3c>
    80000098:	02013403          	ld	s0,32(sp)
    8000009c:	02813083          	ld	ra,40(sp)
    800000a0:	01813483          	ld	s1,24(sp)
    800000a4:	01013903          	ld	s2,16(sp)
    800000a8:	00813983          	ld	s3,8(sp)
    800000ac:	00001517          	auipc	a0,0x1
    800000b0:	f8450513          	add	a0,a0,-124 # 80001030 <uart_puts+0x444>
    800000b4:	03010113          	add	sp,sp,48
    800000b8:	3350006f          	j	80000bec <uart_puts>

00000000800000bc <basic_format_test>:
    800000bc:	ff010113          	add	sp,sp,-16
    800000c0:	00001517          	auipc	a0,0x1
    800000c4:	f8850513          	add	a0,a0,-120 # 80001048 <uart_puts+0x45c>
    800000c8:	00113423          	sd	ra,8(sp)
    800000cc:	321000ef          	jal	80000bec <uart_puts>
    800000d0:	000035b7          	lui	a1,0x3
    800000d4:	03958593          	add	a1,a1,57 # 3039 <_entry-0x7fffcfc7>
    800000d8:	00001517          	auipc	a0,0x1
    800000dc:	f9850513          	add	a0,a0,-104 # 80001070 <uart_puts+0x484>
    800000e0:	05d000ef          	jal	8000093c <printf>
    800000e4:	fffe85b7          	lui	a1,0xfffe8
    800000e8:	e3358593          	add	a1,a1,-461 # fffffffffffe7e33 <bss_end+0xffffffff7ffd6e33>
    800000ec:	00001517          	auipc	a0,0x1
    800000f0:	f9c50513          	add	a0,a0,-100 # 80001088 <uart_puts+0x49c>
    800000f4:	049000ef          	jal	8000093c <printf>
    800000f8:	deadc5b7          	lui	a1,0xdeadc
    800000fc:	eef58593          	add	a1,a1,-273 # ffffffffdeadbeef <bss_end+0xffffffff5eacaeef>
    80000100:	00001517          	auipc	a0,0x1
    80000104:	fa050513          	add	a0,a0,-96 # 800010a0 <uart_puts+0x4b4>
    80000108:	035000ef          	jal	8000093c <printf>
    8000010c:	00001597          	auipc	a1,0x1
    80000110:	fb458593          	add	a1,a1,-76 # 800010c0 <uart_puts+0x4d4>
    80000114:	00001517          	auipc	a0,0x1
    80000118:	fbc50513          	add	a0,a0,-68 # 800010d0 <uart_puts+0x4e4>
    8000011c:	021000ef          	jal	8000093c <printf>
    80000120:	04100593          	li	a1,65
    80000124:	00001517          	auipc	a0,0x1
    80000128:	fc450513          	add	a0,a0,-60 # 800010e8 <uart_puts+0x4fc>
    8000012c:	011000ef          	jal	8000093c <printf>
    80000130:	00001517          	auipc	a0,0x1
    80000134:	fd050513          	add	a0,a0,-48 # 80001100 <uart_puts+0x514>
    80000138:	005000ef          	jal	8000093c <printf>
    8000013c:	00000593          	li	a1,0
    80000140:	00001517          	auipc	a0,0x1
    80000144:	fd850513          	add	a0,a0,-40 # 80001118 <uart_puts+0x52c>
    80000148:	7f4000ef          	jal	8000093c <printf>
    8000014c:	800005b7          	lui	a1,0x80000
    80000150:	fff5c593          	not	a1,a1
    80000154:	00001517          	auipc	a0,0x1
    80000158:	fdc50513          	add	a0,a0,-36 # 80001130 <uart_puts+0x544>
    8000015c:	7e0000ef          	jal	8000093c <printf>
    80000160:	800005b7          	lui	a1,0x80000
    80000164:	00001517          	auipc	a0,0x1
    80000168:	fe450513          	add	a0,a0,-28 # 80001148 <uart_puts+0x55c>
    8000016c:	7d0000ef          	jal	8000093c <printf>
    80000170:	00813083          	ld	ra,8(sp)
    80000174:	00001517          	auipc	a0,0x1
    80000178:	fec50513          	add	a0,a0,-20 # 80001160 <uart_puts+0x574>
    8000017c:	01010113          	add	sp,sp,16
    80000180:	26d0006f          	j	80000bec <uart_puts>

0000000080000184 <boundary_test>:
    80000184:	ff010113          	add	sp,sp,-16
    80000188:	00001517          	auipc	a0,0x1
    8000018c:	00050513          	mv	a0,a0
    80000190:	00113423          	sd	ra,8(sp)
    80000194:	259000ef          	jal	80000bec <uart_puts>
    80000198:	00000593          	li	a1,0
    8000019c:	00001517          	auipc	a0,0x1
    800001a0:	01450513          	add	a0,a0,20 # 800011b0 <uart_puts+0x5c4>
    800001a4:	798000ef          	jal	8000093c <printf>
    800001a8:	00001597          	auipc	a1,0x1
    800001ac:	63058593          	add	a1,a1,1584 # 800017d8 <long_string+0x2b8>
    800001b0:	00001517          	auipc	a0,0x1
    800001b4:	01850513          	add	a0,a0,24 # 800011c8 <uart_puts+0x5dc>
    800001b8:	784000ef          	jal	8000093c <printf>
    800001bc:	00001517          	auipc	a0,0x1
    800001c0:	02450513          	add	a0,a0,36 # 800011e0 <uart_puts+0x5f4>
    800001c4:	778000ef          	jal	8000093c <printf>
    800001c8:	00001517          	auipc	a0,0x1
    800001cc:	03050513          	add	a0,a0,48 # 800011f8 <uart_puts+0x60c>
    800001d0:	76c000ef          	jal	8000093c <printf>
    800001d4:	00813083          	ld	ra,8(sp)
    800001d8:	00001517          	auipc	a0,0x1
    800001dc:	03850513          	add	a0,a0,56 # 80001210 <uart_puts+0x624>
    800001e0:	01010113          	add	sp,sp,16
    800001e4:	2090006f          	j	80000bec <uart_puts>

00000000800001e8 <color_test>:
    800001e8:	ff010113          	add	sp,sp,-16
    800001ec:	00001517          	auipc	a0,0x1
    800001f0:	04c50513          	add	a0,a0,76 # 80001238 <uart_puts+0x64c>
    800001f4:	00113423          	sd	ra,8(sp)
    800001f8:	1f5000ef          	jal	80000bec <uart_puts>
    800001fc:	00001597          	auipc	a1,0x1
    80000200:	05c58593          	add	a1,a1,92 # 80001258 <uart_puts+0x66c>
    80000204:	01f00513          	li	a0,31
    80000208:	4e8000ef          	jal	800006f0 <printf_color>
    8000020c:	00001597          	auipc	a1,0x1
    80000210:	05c58593          	add	a1,a1,92 # 80001268 <uart_puts+0x67c>
    80000214:	02000513          	li	a0,32
    80000218:	4d8000ef          	jal	800006f0 <printf_color>
    8000021c:	00001597          	auipc	a1,0x1
    80000220:	05c58593          	add	a1,a1,92 # 80001278 <uart_puts+0x68c>
    80000224:	02200513          	li	a0,34
    80000228:	4c8000ef          	jal	800006f0 <printf_color>
    8000022c:	00001597          	auipc	a1,0x1
    80000230:	05c58593          	add	a1,a1,92 # 80001288 <uart_puts+0x69c>
    80000234:	02100513          	li	a0,33
    80000238:	4b8000ef          	jal	800006f0 <printf_color>
    8000023c:	00001597          	auipc	a1,0x1
    80000240:	05c58593          	add	a1,a1,92 # 80001298 <uart_puts+0x6ac>
    80000244:	02300513          	li	a0,35
    80000248:	4a8000ef          	jal	800006f0 <printf_color>
    8000024c:	00001597          	auipc	a1,0x1
    80000250:	06458593          	add	a1,a1,100 # 800012b0 <uart_puts+0x6c4>
    80000254:	02400513          	li	a0,36
    80000258:	498000ef          	jal	800006f0 <printf_color>
    8000025c:	00001597          	auipc	a1,0x1
    80000260:	06458593          	add	a1,a1,100 # 800012c0 <uart_puts+0x6d4>
    80000264:	02500513          	li	a0,37
    80000268:	488000ef          	jal	800006f0 <printf_color>
    8000026c:	06400613          	li	a2,100
    80000270:	00001597          	auipc	a1,0x1
    80000274:	06058593          	add	a1,a1,96 # 800012d0 <uart_puts+0x6e4>
    80000278:	01f00513          	li	a0,31
    8000027c:	474000ef          	jal	800006f0 <printf_color>
    80000280:	00001617          	auipc	a2,0x1
    80000284:	06860613          	add	a2,a2,104 # 800012e8 <uart_puts+0x6fc>
    80000288:	00001597          	auipc	a1,0x1
    8000028c:	06858593          	add	a1,a1,104 # 800012f0 <uart_puts+0x704>
    80000290:	02000513          	li	a0,32
    80000294:	45c000ef          	jal	800006f0 <printf_color>
    80000298:	00813083          	ld	ra,8(sp)
    8000029c:	00001517          	auipc	a0,0x1
    800002a0:	06c50513          	add	a0,a0,108 # 80001308 <uart_puts+0x71c>
    800002a4:	01010113          	add	sp,sp,16
    800002a8:	1450006f          	j	80000bec <uart_puts>

00000000800002ac <screen_test>:
    800002ac:	fd010113          	add	sp,sp,-48
    800002b0:	00001517          	auipc	a0,0x1
    800002b4:	07850513          	add	a0,a0,120 # 80001328 <uart_puts+0x73c>
    800002b8:	02113423          	sd	ra,40(sp)
    800002bc:	02813023          	sd	s0,32(sp)
    800002c0:	00913c23          	sd	s1,24(sp)
    800002c4:	01213823          	sd	s2,16(sp)
    800002c8:	125000ef          	jal	80000bec <uart_puts>
    800002cc:	00001517          	auipc	a0,0x1
    800002d0:	08450513          	add	a0,a0,132 # 80001350 <uart_puts+0x764>
    800002d4:	119000ef          	jal	80000bec <uart_puts>
    800002d8:	00000413          	li	s0,0
    800002dc:	00001917          	auipc	s2,0x1
    800002e0:	08c90913          	add	s2,s2,140 # 80001368 <uart_puts+0x77c>
    800002e4:	00500493          	li	s1,5
    800002e8:	00040593          	mv	a1,s0
    800002ec:	00090513          	mv	a0,s2
    800002f0:	0014041b          	addw	s0,s0,1
    800002f4:	648000ef          	jal	8000093c <printf>
    800002f8:	fe9418e3          	bne	s0,s1,800002e8 <screen_test+0x3c>
    800002fc:	00012623          	sw	zero,12(sp)
    80000300:	00c12783          	lw	a5,12(sp)
    80000304:	00018737          	lui	a4,0x18
    80000308:	69f70713          	add	a4,a4,1695 # 1869f <_entry-0x7ffe7961>
    8000030c:	00f74c63          	blt	a4,a5,80000324 <screen_test+0x78>
    80000310:	00c12783          	lw	a5,12(sp)
    80000314:	0017879b          	addw	a5,a5,1
    80000318:	00f12623          	sw	a5,12(sp)
    8000031c:	00c12783          	lw	a5,12(sp)
    80000320:	fef758e3          	bge	a4,a5,80000310 <screen_test+0x64>
    80000324:	228000ef          	jal	8000054c <clear_screen>
    80000328:	00001517          	auipc	a0,0x1
    8000032c:	04850513          	add	a0,a0,72 # 80001370 <uart_puts+0x784>
    80000330:	0bd000ef          	jal	80000bec <uart_puts>
    80000334:	00001517          	auipc	a0,0x1
    80000338:	07450513          	add	a0,a0,116 # 800013a8 <uart_puts+0x7bc>
    8000033c:	0b1000ef          	jal	80000bec <uart_puts>
    80000340:	00500593          	li	a1,5
    80000344:	00100513          	li	a0,1
    80000348:	21c000ef          	jal	80000564 <goto_xy>
    8000034c:	00001517          	auipc	a0,0x1
    80000350:	07450513          	add	a0,a0,116 # 800013c0 <uart_puts+0x7d4>
    80000354:	099000ef          	jal	80000bec <uart_puts>
    80000358:	00500593          	li	a1,5
    8000035c:	01400513          	li	a0,20
    80000360:	204000ef          	jal	80000564 <goto_xy>
    80000364:	00001517          	auipc	a0,0x1
    80000368:	06c50513          	add	a0,a0,108 # 800013d0 <uart_puts+0x7e4>
    8000036c:	081000ef          	jal	80000bec <uart_puts>
    80000370:	00700593          	li	a1,7
    80000374:	00100513          	li	a0,1
    80000378:	1ec000ef          	jal	80000564 <goto_xy>
    8000037c:	00001597          	auipc	a1,0x1
    80000380:	06458593          	add	a1,a1,100 # 800013e0 <uart_puts+0x7f4>
    80000384:	02400513          	li	a0,36
    80000388:	368000ef          	jal	800006f0 <printf_color>
    8000038c:	00900593          	li	a1,9
    80000390:	00100513          	li	a0,1
    80000394:	1d0000ef          	jal	80000564 <goto_xy>
    80000398:	00001517          	auipc	a0,0x1
    8000039c:	06050513          	add	a0,a0,96 # 800013f8 <uart_puts+0x80c>
    800003a0:	04d000ef          	jal	80000bec <uart_puts>
    800003a4:	00a00593          	li	a1,10
    800003a8:	00100513          	li	a0,1
    800003ac:	1b8000ef          	jal	80000564 <goto_xy>
    800003b0:	1a8000ef          	jal	80000558 <clear_line>
    800003b4:	00001517          	auipc	a0,0x1
    800003b8:	05c50513          	add	a0,a0,92 # 80001410 <uart_puts+0x824>
    800003bc:	031000ef          	jal	80000bec <uart_puts>
    800003c0:	02013403          	ld	s0,32(sp)
    800003c4:	02813083          	ld	ra,40(sp)
    800003c8:	01813483          	ld	s1,24(sp)
    800003cc:	01013903          	ld	s2,16(sp)
    800003d0:	00001517          	auipc	a0,0x1
    800003d4:	06850513          	add	a0,a0,104 # 80001438 <uart_puts+0x84c>
    800003d8:	03010113          	add	sp,sp,48
    800003dc:	0110006f          	j	80000bec <uart_puts>

00000000800003e0 <error_recovery_test>:
    800003e0:	ff010113          	add	sp,sp,-16
    800003e4:	00001517          	auipc	a0,0x1
    800003e8:	07c50513          	add	a0,a0,124 # 80001460 <uart_puts+0x874>
    800003ec:	00113423          	sd	ra,8(sp)
    800003f0:	7fc000ef          	jal	80000bec <uart_puts>
    800003f4:	00000513          	li	a0,0
    800003f8:	544000ef          	jal	8000093c <printf>
    800003fc:	02054863          	bltz	a0,8000042c <error_recovery_test+0x4c>
    80000400:	00001617          	auipc	a2,0x1
    80000404:	0a860613          	add	a2,a2,168 # 800014a8 <uart_puts+0x8bc>
    80000408:	02a00593          	li	a1,42
    8000040c:	00001517          	auipc	a0,0x1
    80000410:	0a450513          	add	a0,a0,164 # 800014b0 <uart_puts+0x8c4>
    80000414:	528000ef          	jal	8000093c <printf>
    80000418:	00813083          	ld	ra,8(sp)
    8000041c:	00001517          	auipc	a0,0x1
    80000420:	0b450513          	add	a0,a0,180 # 800014d0 <uart_puts+0x8e4>
    80000424:	01010113          	add	sp,sp,16
    80000428:	7c40006f          	j	80000bec <uart_puts>
    8000042c:	00001517          	auipc	a0,0x1
    80000430:	05450513          	add	a0,a0,84 # 80001480 <uart_puts+0x894>
    80000434:	7b8000ef          	jal	80000bec <uart_puts>
    80000438:	fc9ff06f          	j	80000400 <error_recovery_test+0x20>

000000008000043c <main>:
    8000043c:	ff010113          	add	sp,sp,-16
    80000440:	00001517          	auipc	a0,0x1
    80000444:	0b050513          	add	a0,a0,176 # 800014f0 <uart_puts+0x904>
    80000448:	00113423          	sd	ra,8(sp)
    8000044c:	7a0000ef          	jal	80000bec <uart_puts>
    80000450:	c6dff0ef          	jal	800000bc <basic_format_test>
    80000454:	d31ff0ef          	jal	80000184 <boundary_test>
    80000458:	d91ff0ef          	jal	800001e8 <color_test>
    8000045c:	e51ff0ef          	jal	800002ac <screen_test>
    80000460:	be5ff0ef          	jal	80000044 <performance_test>
    80000464:	f7dff0ef          	jal	800003e0 <error_recovery_test>
    80000468:	00001517          	auipc	a0,0x1
    8000046c:	0a050513          	add	a0,a0,160 # 80001508 <uart_puts+0x91c>
    80000470:	77c000ef          	jal	80000bec <uart_puts>
    80000474:	0000006f          	j	80000474 <main+0x38>

0000000080000478 <print_number>:
    80000478:	0c050663          	beqz	a0,80000544 <print_number+0xcc>
    8000047c:	fd010113          	add	sp,sp,-48
    80000480:	02113423          	sd	ra,40(sp)
    80000484:	02813023          	sd	s0,32(sp)
    80000488:	08061a63          	bnez	a2,8000051c <print_number+0xa4>
    8000048c:	0005071b          	sext.w	a4,a0
    80000490:	00000613          	li	a2,0
    80000494:	0005859b          	sext.w	a1,a1
    80000498:	00010fa3          	sb	zero,31(sp)
    8000049c:	01e10813          	add	a6,sp,30
    800004a0:	01f00693          	li	a3,31
    800004a4:	00001317          	auipc	t1,0x1
    800004a8:	48430313          	add	t1,t1,1156 # 80001928 <digits>
    800004ac:	02b777bb          	remuw	a5,a4,a1
    800004b0:	fff80813          	add	a6,a6,-1
    800004b4:	0007089b          	sext.w	a7,a4
    800004b8:	00068e13          	mv	t3,a3
    800004bc:	fff6869b          	addw	a3,a3,-1
    800004c0:	02079793          	sll	a5,a5,0x20
    800004c4:	0207d793          	srl	a5,a5,0x20
    800004c8:	00f307b3          	add	a5,t1,a5
    800004cc:	0007c503          	lbu	a0,0(a5)
    800004d0:	02b7573b          	divuw	a4,a4,a1
    800004d4:	00a800a3          	sb	a0,1(a6)
    800004d8:	fcb8fae3          	bgeu	a7,a1,800004ac <print_number+0x34>
    800004dc:	04060a63          	beqz	a2,80000530 <print_number+0xb8>
    800004e0:	ffee069b          	addw	a3,t3,-2
    800004e4:	02068793          	add	a5,a3,32
    800004e8:	002787b3          	add	a5,a5,sp
    800004ec:	02d00713          	li	a4,45
    800004f0:	fee78023          	sb	a4,-32(a5)
    800004f4:	02d00513          	li	a0,45
    800004f8:	00d10433          	add	s0,sp,a3
    800004fc:	00140413          	add	s0,s0,1
    80000500:	6d4000ef          	jal	80000bd4 <uart_putc>
    80000504:	00044503          	lbu	a0,0(s0)
    80000508:	fe051ae3          	bnez	a0,800004fc <print_number+0x84>
    8000050c:	02813083          	ld	ra,40(sp)
    80000510:	02013403          	ld	s0,32(sp)
    80000514:	03010113          	add	sp,sp,48
    80000518:	00008067          	ret
    8000051c:	f60558e3          	bgez	a0,8000048c <print_number+0x14>
    80000520:	80000737          	lui	a4,0x80000
    80000524:	f6e508e3          	beq	a0,a4,80000494 <print_number+0x1c>
    80000528:	40a0073b          	negw	a4,a0
    8000052c:	f69ff06f          	j	80000494 <print_number+0x1c>
    80000530:	fc0514e3          	bnez	a0,800004f8 <print_number+0x80>
    80000534:	02813083          	ld	ra,40(sp)
    80000538:	02013403          	ld	s0,32(sp)
    8000053c:	03010113          	add	sp,sp,48
    80000540:	00008067          	ret
    80000544:	03000513          	li	a0,48
    80000548:	68c0006f          	j	80000bd4 <uart_putc>

000000008000054c <clear_screen>:
    8000054c:	00001517          	auipc	a0,0x1
    80000550:	18c50513          	add	a0,a0,396 # 800016d8 <long_string+0x1b8>
    80000554:	6980006f          	j	80000bec <uart_puts>

0000000080000558 <clear_line>:
    80000558:	00001517          	auipc	a0,0x1
    8000055c:	18850513          	add	a0,a0,392 # 800016e0 <long_string+0x1c0>
    80000560:	68c0006f          	j	80000bec <uart_puts>

0000000080000564 <goto_xy>:
    80000564:	fd010113          	add	sp,sp,-48
    80000568:	00913c23          	sd	s1,24(sp)
    8000056c:	00050493          	mv	s1,a0
    80000570:	01b00513          	li	a0,27
    80000574:	02113423          	sd	ra,40(sp)
    80000578:	02813023          	sd	s0,32(sp)
    8000057c:	01213823          	sd	s2,16(sp)
    80000580:	00058413          	mv	s0,a1
    80000584:	01313423          	sd	s3,8(sp)
    80000588:	64c000ef          	jal	80000bd4 <uart_putc>
    8000058c:	05b00513          	li	a0,91
    80000590:	644000ef          	jal	80000bd4 <uart_putc>
    80000594:	06300793          	li	a5,99
    80000598:	0c87cc63          	blt	a5,s0,80000670 <goto_xy+0x10c>
    8000059c:	00900793          	li	a5,9
    800005a0:	0487ce63          	blt	a5,s0,800005fc <goto_xy+0x98>
    800005a4:	12805a63          	blez	s0,800006d8 <goto_xy+0x174>
    800005a8:	0304041b          	addw	s0,s0,48
    800005ac:	0ff47513          	zext.b	a0,s0
    800005b0:	624000ef          	jal	80000bd4 <uart_putc>
    800005b4:	03b00513          	li	a0,59
    800005b8:	61c000ef          	jal	80000bd4 <uart_putc>
    800005bc:	06300793          	li	a5,99
    800005c0:	0697c863          	blt	a5,s1,80000630 <goto_xy+0xcc>
    800005c4:	00900793          	li	a5,9
    800005c8:	0e97c463          	blt	a5,s1,800006b0 <goto_xy+0x14c>
    800005cc:	10905c63          	blez	s1,800006e4 <goto_xy+0x180>
    800005d0:	0304851b          	addw	a0,s1,48
    800005d4:	0ff57513          	zext.b	a0,a0
    800005d8:	5fc000ef          	jal	80000bd4 <uart_putc>
    800005dc:	02013403          	ld	s0,32(sp)
    800005e0:	02813083          	ld	ra,40(sp)
    800005e4:	01813483          	ld	s1,24(sp)
    800005e8:	01013903          	ld	s2,16(sp)
    800005ec:	00813983          	ld	s3,8(sp)
    800005f0:	04800513          	li	a0,72
    800005f4:	03010113          	add	sp,sp,48
    800005f8:	5dc0006f          	j	80000bd4 <uart_putc>
    800005fc:	00a00913          	li	s2,10
    80000600:	0324453b          	divw	a0,s0,s2
    80000604:	0305051b          	addw	a0,a0,48
    80000608:	0ff57513          	zext.b	a0,a0
    8000060c:	5c8000ef          	jal	80000bd4 <uart_putc>
    80000610:	0324643b          	remw	s0,s0,s2
    80000614:	0304041b          	addw	s0,s0,48
    80000618:	0ff47513          	zext.b	a0,s0
    8000061c:	5b8000ef          	jal	80000bd4 <uart_putc>
    80000620:	03b00513          	li	a0,59
    80000624:	5b0000ef          	jal	80000bd4 <uart_putc>
    80000628:	06300793          	li	a5,99
    8000062c:	f897dce3          	bge	a5,s1,800005c4 <goto_xy+0x60>
    80000630:	06400413          	li	s0,100
    80000634:	0284c53b          	divw	a0,s1,s0
    80000638:	00a00913          	li	s2,10
    8000063c:	0305051b          	addw	a0,a0,48
    80000640:	0ff57513          	zext.b	a0,a0
    80000644:	590000ef          	jal	80000bd4 <uart_putc>
    80000648:	0284e53b          	remw	a0,s1,s0
    8000064c:	0325453b          	divw	a0,a0,s2
    80000650:	0305051b          	addw	a0,a0,48
    80000654:	0ff57513          	zext.b	a0,a0
    80000658:	57c000ef          	jal	80000bd4 <uart_putc>
    8000065c:	0324e53b          	remw	a0,s1,s2
    80000660:	0305051b          	addw	a0,a0,48
    80000664:	0ff57513          	zext.b	a0,a0
    80000668:	56c000ef          	jal	80000bd4 <uart_putc>
    8000066c:	f71ff06f          	j	800005dc <goto_xy+0x78>
    80000670:	06400913          	li	s2,100
    80000674:	0324453b          	divw	a0,s0,s2
    80000678:	00a00993          	li	s3,10
    8000067c:	0305051b          	addw	a0,a0,48
    80000680:	0ff57513          	zext.b	a0,a0
    80000684:	550000ef          	jal	80000bd4 <uart_putc>
    80000688:	0324653b          	remw	a0,s0,s2
    8000068c:	0335453b          	divw	a0,a0,s3
    80000690:	0305051b          	addw	a0,a0,48
    80000694:	0ff57513          	zext.b	a0,a0
    80000698:	53c000ef          	jal	80000bd4 <uart_putc>
    8000069c:	0334643b          	remw	s0,s0,s3
    800006a0:	0304041b          	addw	s0,s0,48
    800006a4:	0ff47513          	zext.b	a0,s0
    800006a8:	52c000ef          	jal	80000bd4 <uart_putc>
    800006ac:	f09ff06f          	j	800005b4 <goto_xy+0x50>
    800006b0:	00a00413          	li	s0,10
    800006b4:	0284c53b          	divw	a0,s1,s0
    800006b8:	0305051b          	addw	a0,a0,48
    800006bc:	0ff57513          	zext.b	a0,a0
    800006c0:	514000ef          	jal	80000bd4 <uart_putc>
    800006c4:	0284e53b          	remw	a0,s1,s0
    800006c8:	0305051b          	addw	a0,a0,48
    800006cc:	0ff57513          	zext.b	a0,a0
    800006d0:	504000ef          	jal	80000bd4 <uart_putc>
    800006d4:	f09ff06f          	j	800005dc <goto_xy+0x78>
    800006d8:	03100513          	li	a0,49
    800006dc:	4f8000ef          	jal	80000bd4 <uart_putc>
    800006e0:	ed5ff06f          	j	800005b4 <goto_xy+0x50>
    800006e4:	03100513          	li	a0,49
    800006e8:	4ec000ef          	jal	80000bd4 <uart_putc>
    800006ec:	ef1ff06f          	j	800005dc <goto_xy+0x78>

00000000800006f0 <printf_color>:
    800006f0:	f8010113          	add	sp,sp,-128
    800006f4:	02913c23          	sd	s1,56(sp)
    800006f8:	00050493          	mv	s1,a0
    800006fc:	01b00513          	li	a0,27
    80000700:	06f13423          	sd	a5,104(sp)
    80000704:	04113423          	sd	ra,72(sp)
    80000708:	04813023          	sd	s0,64(sp)
    8000070c:	04c13823          	sd	a2,80(sp)
    80000710:	04d13c23          	sd	a3,88(sp)
    80000714:	06e13023          	sd	a4,96(sp)
    80000718:	07013823          	sd	a6,112(sp)
    8000071c:	07113c23          	sd	a7,120(sp)
    80000720:	00058413          	mv	s0,a1
    80000724:	03213823          	sd	s2,48(sp)
    80000728:	03313423          	sd	s3,40(sp)
    8000072c:	03413023          	sd	s4,32(sp)
    80000730:	01513c23          	sd	s5,24(sp)
    80000734:	4a0000ef          	jal	80000bd4 <uart_putc>
    80000738:	05b00513          	li	a0,91
    8000073c:	498000ef          	jal	80000bd4 <uart_putc>
    80000740:	06300793          	li	a5,99
    80000744:	1a97e063          	bltu	a5,s1,800008e4 <printf_color+0x1f4>
    80000748:	00900793          	li	a5,9
    8000074c:	1497e663          	bltu	a5,s1,80000898 <printf_color+0x1a8>
    80000750:	0304851b          	addw	a0,s1,48
    80000754:	0ff57513          	zext.b	a0,a0
    80000758:	47c000ef          	jal	80000bd4 <uart_putc>
    8000075c:	06d00513          	li	a0,109
    80000760:	474000ef          	jal	80000bd4 <uart_putc>
    80000764:	1c040863          	beqz	s0,80000934 <printf_color+0x244>
    80000768:	00044503          	lbu	a0,0(s0)
    8000076c:	05010793          	add	a5,sp,80
    80000770:	00f13423          	sd	a5,8(sp)
    80000774:	00000a93          	li	s5,0
    80000778:	06050463          	beqz	a0,800007e0 <printf_color+0xf0>
    8000077c:	02500913          	li	s2,37
    80000780:	02000a13          	li	s4,32
    80000784:	00001997          	auipc	s3,0x1
    80000788:	09c98993          	add	s3,s3,156 # 80001820 <long_string+0x300>
    8000078c:	00140493          	add	s1,s0,1
    80000790:	13251863          	bne	a0,s2,800008c0 <printf_color+0x1d0>
    80000794:	00144783          	lbu	a5,1(s0)
    80000798:	14078063          	beqz	a5,800008d8 <printf_color+0x1e8>
    8000079c:	13278863          	beq	a5,s2,800008cc <printf_color+0x1dc>
    800007a0:	fa87879b          	addw	a5,a5,-88
    800007a4:	0ff7f793          	zext.b	a5,a5
    800007a8:	00fa6c63          	bltu	s4,a5,800007c0 <printf_color+0xd0>
    800007ac:	00279793          	sll	a5,a5,0x2
    800007b0:	013787b3          	add	a5,a5,s3
    800007b4:	0007a783          	lw	a5,0(a5)
    800007b8:	013787b3          	add	a5,a5,s3
    800007bc:	00078067          	jr	a5
    800007c0:	02500513          	li	a0,37
    800007c4:	410000ef          	jal	80000bd4 <uart_putc>
    800007c8:	00144503          	lbu	a0,1(s0)
    800007cc:	ffe00a93          	li	s5,-2
    800007d0:	404000ef          	jal	80000bd4 <uart_putc>
    800007d4:	0014c503          	lbu	a0,1(s1)
    800007d8:	00148413          	add	s0,s1,1
    800007dc:	fa0518e3          	bnez	a0,8000078c <printf_color+0x9c>
    800007e0:	00001517          	auipc	a0,0x1
    800007e4:	f1050513          	add	a0,a0,-240 # 800016f0 <long_string+0x1d0>
    800007e8:	404000ef          	jal	80000bec <uart_puts>
    800007ec:	04813083          	ld	ra,72(sp)
    800007f0:	04013403          	ld	s0,64(sp)
    800007f4:	03813483          	ld	s1,56(sp)
    800007f8:	03013903          	ld	s2,48(sp)
    800007fc:	02813983          	ld	s3,40(sp)
    80000800:	02013a03          	ld	s4,32(sp)
    80000804:	000a8513          	mv	a0,s5
    80000808:	01813a83          	ld	s5,24(sp)
    8000080c:	08010113          	add	sp,sp,128
    80000810:	00008067          	ret
    80000814:	00813783          	ld	a5,8(sp)
    80000818:	00000613          	li	a2,0
    8000081c:	01000593          	li	a1,16
    80000820:	0007a503          	lw	a0,0(a5)
    80000824:	00878793          	add	a5,a5,8
    80000828:	00f13423          	sd	a5,8(sp)
    8000082c:	c4dff0ef          	jal	80000478 <print_number>
    80000830:	fa5ff06f          	j	800007d4 <printf_color+0xe4>
    80000834:	00813783          	ld	a5,8(sp)
    80000838:	0007c503          	lbu	a0,0(a5)
    8000083c:	00878793          	add	a5,a5,8
    80000840:	00f13423          	sd	a5,8(sp)
    80000844:	390000ef          	jal	80000bd4 <uart_putc>
    80000848:	f8dff06f          	j	800007d4 <printf_color+0xe4>
    8000084c:	00813783          	ld	a5,8(sp)
    80000850:	0007b403          	ld	s0,0(a5)
    80000854:	00878793          	add	a5,a5,8
    80000858:	00f13423          	sd	a5,8(sp)
    8000085c:	00041863          	bnez	s0,8000086c <printf_color+0x17c>
    80000860:	0c40006f          	j	80000924 <printf_color+0x234>
    80000864:	00140413          	add	s0,s0,1
    80000868:	36c000ef          	jal	80000bd4 <uart_putc>
    8000086c:	00044503          	lbu	a0,0(s0)
    80000870:	fe051ae3          	bnez	a0,80000864 <printf_color+0x174>
    80000874:	f61ff06f          	j	800007d4 <printf_color+0xe4>
    80000878:	00813783          	ld	a5,8(sp)
    8000087c:	00100613          	li	a2,1
    80000880:	00a00593          	li	a1,10
    80000884:	0007a503          	lw	a0,0(a5)
    80000888:	00878793          	add	a5,a5,8
    8000088c:	00f13423          	sd	a5,8(sp)
    80000890:	be9ff0ef          	jal	80000478 <print_number>
    80000894:	f41ff06f          	j	800007d4 <printf_color+0xe4>
    80000898:	00a00913          	li	s2,10
    8000089c:	0324d53b          	divuw	a0,s1,s2
    800008a0:	0305051b          	addw	a0,a0,48
    800008a4:	0ff57513          	zext.b	a0,a0
    800008a8:	32c000ef          	jal	80000bd4 <uart_putc>
    800008ac:	0324f53b          	remuw	a0,s1,s2
    800008b0:	0305051b          	addw	a0,a0,48
    800008b4:	07f57513          	and	a0,a0,127
    800008b8:	31c000ef          	jal	80000bd4 <uart_putc>
    800008bc:	ea1ff06f          	j	8000075c <printf_color+0x6c>
    800008c0:	314000ef          	jal	80000bd4 <uart_putc>
    800008c4:	00040493          	mv	s1,s0
    800008c8:	f0dff06f          	j	800007d4 <printf_color+0xe4>
    800008cc:	02500513          	li	a0,37
    800008d0:	304000ef          	jal	80000bd4 <uart_putc>
    800008d4:	f01ff06f          	j	800007d4 <printf_color+0xe4>
    800008d8:	02500513          	li	a0,37
    800008dc:	2f8000ef          	jal	80000bd4 <uart_putc>
    800008e0:	f01ff06f          	j	800007e0 <printf_color+0xf0>
    800008e4:	06400913          	li	s2,100
    800008e8:	0324d53b          	divuw	a0,s1,s2
    800008ec:	00a00993          	li	s3,10
    800008f0:	0305051b          	addw	a0,a0,48
    800008f4:	0ff57513          	zext.b	a0,a0
    800008f8:	2dc000ef          	jal	80000bd4 <uart_putc>
    800008fc:	0324f53b          	remuw	a0,s1,s2
    80000900:	0335553b          	divuw	a0,a0,s3
    80000904:	0305051b          	addw	a0,a0,48
    80000908:	0ff57513          	zext.b	a0,a0
    8000090c:	2c8000ef          	jal	80000bd4 <uart_putc>
    80000910:	0334f53b          	remuw	a0,s1,s3
    80000914:	0305051b          	addw	a0,a0,48
    80000918:	07f57513          	and	a0,a0,127
    8000091c:	2b8000ef          	jal	80000bd4 <uart_putc>
    80000920:	e3dff06f          	j	8000075c <printf_color+0x6c>
    80000924:	00001517          	auipc	a0,0x1
    80000928:	dc450513          	add	a0,a0,-572 # 800016e8 <long_string+0x1c8>
    8000092c:	2c0000ef          	jal	80000bec <uart_puts>
    80000930:	ea5ff06f          	j	800007d4 <printf_color+0xe4>
    80000934:	fff00a93          	li	s5,-1
    80000938:	eb5ff06f          	j	800007ec <printf_color+0xfc>

000000008000093c <printf>:
    8000093c:	f7010113          	add	sp,sp,-144
    80000940:	04113423          	sd	ra,72(sp)
    80000944:	04813023          	sd	s0,64(sp)
    80000948:	02913c23          	sd	s1,56(sp)
    8000094c:	03213823          	sd	s2,48(sp)
    80000950:	03313423          	sd	s3,40(sp)
    80000954:	03413023          	sd	s4,32(sp)
    80000958:	01513c23          	sd	s5,24(sp)
    8000095c:	04b13c23          	sd	a1,88(sp)
    80000960:	06c13023          	sd	a2,96(sp)
    80000964:	06d13423          	sd	a3,104(sp)
    80000968:	06e13823          	sd	a4,112(sp)
    8000096c:	06f13c23          	sd	a5,120(sp)
    80000970:	09013023          	sd	a6,128(sp)
    80000974:	09113423          	sd	a7,136(sp)
    80000978:	16050063          	beqz	a0,80000ad8 <printf+0x19c>
    8000097c:	00050413          	mv	s0,a0
    80000980:	00054503          	lbu	a0,0(a0)
    80000984:	05810793          	add	a5,sp,88
    80000988:	00f13423          	sd	a5,8(sp)
    8000098c:	00000a93          	li	s5,0
    80000990:	06050463          	beqz	a0,800009f8 <printf+0xbc>
    80000994:	02500913          	li	s2,37
    80000998:	02000a13          	li	s4,32
    8000099c:	00001997          	auipc	s3,0x1
    800009a0:	f0898993          	add	s3,s3,-248 # 800018a4 <long_string+0x384>
    800009a4:	00140493          	add	s1,s0,1
    800009a8:	0f251e63          	bne	a0,s2,80000aa4 <printf+0x168>
    800009ac:	00144783          	lbu	a5,1(s0)
    800009b0:	10078663          	beqz	a5,80000abc <printf+0x180>
    800009b4:	0f278e63          	beq	a5,s2,80000ab0 <printf+0x174>
    800009b8:	fa87879b          	addw	a5,a5,-88
    800009bc:	0ff7f793          	zext.b	a5,a5
    800009c0:	00fa6c63          	bltu	s4,a5,800009d8 <printf+0x9c>
    800009c4:	00279793          	sll	a5,a5,0x2
    800009c8:	013787b3          	add	a5,a5,s3
    800009cc:	0007a783          	lw	a5,0(a5)
    800009d0:	013787b3          	add	a5,a5,s3
    800009d4:	00078067          	jr	a5
    800009d8:	02500513          	li	a0,37
    800009dc:	1f8000ef          	jal	80000bd4 <uart_putc>
    800009e0:	00144503          	lbu	a0,1(s0)
    800009e4:	ffe00a93          	li	s5,-2
    800009e8:	1ec000ef          	jal	80000bd4 <uart_putc>
    800009ec:	0014c503          	lbu	a0,1(s1)
    800009f0:	00148413          	add	s0,s1,1
    800009f4:	fa0518e3          	bnez	a0,800009a4 <printf+0x68>
    800009f8:	04813083          	ld	ra,72(sp)
    800009fc:	04013403          	ld	s0,64(sp)
    80000a00:	03813483          	ld	s1,56(sp)
    80000a04:	03013903          	ld	s2,48(sp)
    80000a08:	02813983          	ld	s3,40(sp)
    80000a0c:	02013a03          	ld	s4,32(sp)
    80000a10:	000a8513          	mv	a0,s5
    80000a14:	01813a83          	ld	s5,24(sp)
    80000a18:	09010113          	add	sp,sp,144
    80000a1c:	00008067          	ret
    80000a20:	00813783          	ld	a5,8(sp)
    80000a24:	00000613          	li	a2,0
    80000a28:	01000593          	li	a1,16
    80000a2c:	0007a503          	lw	a0,0(a5)
    80000a30:	00878793          	add	a5,a5,8
    80000a34:	00f13423          	sd	a5,8(sp)
    80000a38:	a41ff0ef          	jal	80000478 <print_number>
    80000a3c:	fb1ff06f          	j	800009ec <printf+0xb0>
    80000a40:	00813783          	ld	a5,8(sp)
    80000a44:	0007c503          	lbu	a0,0(a5)
    80000a48:	00878793          	add	a5,a5,8
    80000a4c:	00f13423          	sd	a5,8(sp)
    80000a50:	184000ef          	jal	80000bd4 <uart_putc>
    80000a54:	f99ff06f          	j	800009ec <printf+0xb0>
    80000a58:	00813783          	ld	a5,8(sp)
    80000a5c:	0007b403          	ld	s0,0(a5)
    80000a60:	00878793          	add	a5,a5,8
    80000a64:	00f13423          	sd	a5,8(sp)
    80000a68:	00041863          	bnez	s0,80000a78 <printf+0x13c>
    80000a6c:	05c0006f          	j	80000ac8 <printf+0x18c>
    80000a70:	00140413          	add	s0,s0,1
    80000a74:	160000ef          	jal	80000bd4 <uart_putc>
    80000a78:	00044503          	lbu	a0,0(s0)
    80000a7c:	fe051ae3          	bnez	a0,80000a70 <printf+0x134>
    80000a80:	f6dff06f          	j	800009ec <printf+0xb0>
    80000a84:	00813783          	ld	a5,8(sp)
    80000a88:	00100613          	li	a2,1
    80000a8c:	00a00593          	li	a1,10
    80000a90:	0007a503          	lw	a0,0(a5)
    80000a94:	00878793          	add	a5,a5,8
    80000a98:	00f13423          	sd	a5,8(sp)
    80000a9c:	9ddff0ef          	jal	80000478 <print_number>
    80000aa0:	f4dff06f          	j	800009ec <printf+0xb0>
    80000aa4:	130000ef          	jal	80000bd4 <uart_putc>
    80000aa8:	00040493          	mv	s1,s0
    80000aac:	f41ff06f          	j	800009ec <printf+0xb0>
    80000ab0:	02500513          	li	a0,37
    80000ab4:	120000ef          	jal	80000bd4 <uart_putc>
    80000ab8:	f35ff06f          	j	800009ec <printf+0xb0>
    80000abc:	02500513          	li	a0,37
    80000ac0:	114000ef          	jal	80000bd4 <uart_putc>
    80000ac4:	f35ff06f          	j	800009f8 <printf+0xbc>
    80000ac8:	00001517          	auipc	a0,0x1
    80000acc:	c2050513          	add	a0,a0,-992 # 800016e8 <long_string+0x1c8>
    80000ad0:	11c000ef          	jal	80000bec <uart_puts>
    80000ad4:	f19ff06f          	j	800009ec <printf+0xb0>
    80000ad8:	fff00a93          	li	s5,-1
    80000adc:	f1dff06f          	j	800009f8 <printf+0xbc>

0000000080000ae0 <test_printf_basic>:
    80000ae0:	ff010113          	add	sp,sp,-16
    80000ae4:	02a00593          	li	a1,42
    80000ae8:	00001517          	auipc	a0,0x1
    80000aec:	c1050513          	add	a0,a0,-1008 # 800016f8 <long_string+0x1d8>
    80000af0:	00113423          	sd	ra,8(sp)
    80000af4:	e49ff0ef          	jal	8000093c <printf>
    80000af8:	f8500593          	li	a1,-123
    80000afc:	00001517          	auipc	a0,0x1
    80000b00:	c1450513          	add	a0,a0,-1004 # 80001710 <long_string+0x1f0>
    80000b04:	e39ff0ef          	jal	8000093c <printf>
    80000b08:	00000593          	li	a1,0
    80000b0c:	00001517          	auipc	a0,0x1
    80000b10:	c1c50513          	add	a0,a0,-996 # 80001728 <long_string+0x208>
    80000b14:	e29ff0ef          	jal	8000093c <printf>
    80000b18:	000015b7          	lui	a1,0x1
    80000b1c:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80000b20:	00001517          	auipc	a0,0x1
    80000b24:	c2050513          	add	a0,a0,-992 # 80001740 <long_string+0x220>
    80000b28:	e15ff0ef          	jal	8000093c <printf>
    80000b2c:	00001597          	auipc	a1,0x1
    80000b30:	c2c58593          	add	a1,a1,-980 # 80001758 <long_string+0x238>
    80000b34:	00001517          	auipc	a0,0x1
    80000b38:	c2c50513          	add	a0,a0,-980 # 80001760 <long_string+0x240>
    80000b3c:	e01ff0ef          	jal	8000093c <printf>
    80000b40:	05800593          	li	a1,88
    80000b44:	00001517          	auipc	a0,0x1
    80000b48:	c3450513          	add	a0,a0,-972 # 80001778 <long_string+0x258>
    80000b4c:	df1ff0ef          	jal	8000093c <printf>
    80000b50:	00813083          	ld	ra,8(sp)
    80000b54:	00001517          	auipc	a0,0x1
    80000b58:	c3c50513          	add	a0,a0,-964 # 80001790 <long_string+0x270>
    80000b5c:	01010113          	add	sp,sp,16
    80000b60:	dddff06f          	j	8000093c <printf>

0000000080000b64 <test_printf_edge_cases>:
    80000b64:	800005b7          	lui	a1,0x80000
    80000b68:	ff010113          	add	sp,sp,-16
    80000b6c:	fff5c593          	not	a1,a1
    80000b70:	00001517          	auipc	a0,0x1
    80000b74:	c3850513          	add	a0,a0,-968 # 800017a8 <long_string+0x288>
    80000b78:	00113423          	sd	ra,8(sp)
    80000b7c:	dc1ff0ef          	jal	8000093c <printf>
    80000b80:	800005b7          	lui	a1,0x80000
    80000b84:	00001517          	auipc	a0,0x1
    80000b88:	c3450513          	add	a0,a0,-972 # 800017b8 <long_string+0x298>
    80000b8c:	db1ff0ef          	jal	8000093c <printf>
    80000b90:	00000593          	li	a1,0
    80000b94:	00001517          	auipc	a0,0x1
    80000b98:	c3450513          	add	a0,a0,-972 # 800017c8 <long_string+0x2a8>
    80000b9c:	da1ff0ef          	jal	8000093c <printf>
    80000ba0:	00001597          	auipc	a1,0x1
    80000ba4:	c3858593          	add	a1,a1,-968 # 800017d8 <long_string+0x2b8>
    80000ba8:	00001517          	auipc	a0,0x1
    80000bac:	c3850513          	add	a0,a0,-968 # 800017e0 <long_string+0x2c0>
    80000bb0:	d8dff0ef          	jal	8000093c <printf>
    80000bb4:	00001517          	auipc	a0,0x1
    80000bb8:	c4450513          	add	a0,a0,-956 # 800017f8 <long_string+0x2d8>
    80000bbc:	d81ff0ef          	jal	8000093c <printf>
    80000bc0:	00813083          	ld	ra,8(sp)
    80000bc4:	00001517          	auipc	a0,0x1
    80000bc8:	c4450513          	add	a0,a0,-956 # 80001808 <long_string+0x2e8>
    80000bcc:	01010113          	add	sp,sp,16
    80000bd0:	d6dff06f          	j	8000093c <printf>

0000000080000bd4 <uart_putc>:
    80000bd4:	10000737          	lui	a4,0x10000
    80000bd8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80000bdc:	0207f793          	and	a5,a5,32
    80000be0:	fe078ce3          	beqz	a5,80000bd8 <uart_putc+0x4>
    80000be4:	00a70023          	sb	a0,0(a4)
    80000be8:	00008067          	ret

0000000080000bec <uart_puts>:
    80000bec:	00054683          	lbu	a3,0(a0)
    80000bf0:	02068263          	beqz	a3,80000c14 <uart_puts+0x28>
    80000bf4:	10000737          	lui	a4,0x10000
    80000bf8:	00150513          	add	a0,a0,1
    80000bfc:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80000c00:	0207f793          	and	a5,a5,32
    80000c04:	fe078ce3          	beqz	a5,80000bfc <uart_puts+0x10>
    80000c08:	00d70023          	sb	a3,0(a4)
    80000c0c:	00054683          	lbu	a3,0(a0)
    80000c10:	fe0694e3          	bnez	a3,80000bf8 <uart_puts+0xc>
    80000c14:	00008067          	ret
