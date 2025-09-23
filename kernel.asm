
kernel.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	100002b7          	lui	t0,0x10000
    80000004:	05300313          	li	t1,83
    80000008:	00628023          	sb	t1,0(t0) # 10000000 <_entry-0x70000000>
    8000000c:	00011117          	auipc	sp,0x11
    80000010:	ff410113          	add	sp,sp,-12 # 80011000 <mem_end>
    80000014:	05000313          	li	t1,80
    80000018:	00628023          	sb	t1,0(t0)
    8000001c:	00010297          	auipc	t0,0x10
    80000020:	fe428293          	add	t0,t0,-28 # 80010000 <bss_start>
    80000024:	00011317          	auipc	t1,0x11
    80000028:	ffc30313          	add	t1,t1,-4 # 80011020 <bss_end>

000000008000002c <bss_clear>:
    8000002c:	00628863          	beq	t0,t1,8000003c <bss_done>
    80000030:	0002b023          	sd	zero,0(t0)
    80000034:	00828293          	add	t0,t0,8
    80000038:	ff5ff06f          	j	8000002c <bss_clear>

000000008000003c <bss_done>:
    8000003c:	778000ef          	jal	800007b4 <main>

0000000080000040 <loop>:
    80000040:	0000006f          	j	80000040 <loop>

0000000080000044 <test_virtual_memory>:
    80000044:	ff010113          	add	sp,sp,-16
    80000048:	00002517          	auipc	a0,0x2
    8000004c:	fb850513          	add	a0,a0,-72 # 80002000 <rodata_start>
    80000050:	00113423          	sd	ra,8(sp)
    80000054:	705000ef          	jal	80000f58 <uart_puts>
    80000058:	00002517          	auipc	a0,0x2
    8000005c:	fc850513          	add	a0,a0,-56 # 80002020 <rodata_start+0x20>
    80000060:	6f9000ef          	jal	80000f58 <uart_puts>
    80000064:	01100593          	li	a1,17
    80000068:	40100513          	li	a0,1025
    8000006c:	01b59593          	sll	a1,a1,0x1b
    80000070:	01551513          	sll	a0,a0,0x15
    80000074:	711000ef          	jal	80000f84 <pmm_init>
    80000078:	00002517          	auipc	a0,0x2
    8000007c:	fd050513          	add	a0,a0,-48 # 80002048 <rodata_start+0x48>
    80000080:	6d9000ef          	jal	80000f58 <uart_puts>
    80000084:	56c010ef          	jal	800015f0 <kvminit>
    80000088:	00002517          	auipc	a0,0x2
    8000008c:	fe050513          	add	a0,a0,-32 # 80002068 <rodata_start+0x68>
    80000090:	6c9000ef          	jal	80000f58 <uart_puts>
    80000094:	718010ef          	jal	800017ac <kvminithart>
    80000098:	00002517          	auipc	a0,0x2
    8000009c:	fe850513          	add	a0,a0,-24 # 80002080 <rodata_start+0x80>
    800000a0:	6b9000ef          	jal	80000f58 <uart_puts>
    800000a4:	00813083          	ld	ra,8(sp)
    800000a8:	00002517          	auipc	a0,0x2
    800000ac:	ff850513          	add	a0,a0,-8 # 800020a0 <rodata_start+0xa0>
    800000b0:	01010113          	add	sp,sp,16
    800000b4:	6a50006f          	j	80000f58 <uart_puts>

00000000800000b8 <pt_test>:
    800000b8:	fe010113          	add	sp,sp,-32
    800000bc:	00002517          	auipc	a0,0x2
    800000c0:	00450513          	add	a0,a0,4 # 800020c0 <rodata_start+0xc0>
    800000c4:	00113c23          	sd	ra,24(sp)
    800000c8:	00813823          	sd	s0,16(sp)
    800000cc:	00913423          	sd	s1,8(sp)
    800000d0:	689000ef          	jal	80000f58 <uart_puts>
    800000d4:	00002517          	auipc	a0,0x2
    800000d8:	f4c50513          	add	a0,a0,-180 # 80002020 <rodata_start+0x20>
    800000dc:	67d000ef          	jal	80000f58 <uart_puts>
    800000e0:	01100593          	li	a1,17
    800000e4:	40100513          	li	a0,1025
    800000e8:	01b59593          	sll	a1,a1,0x1b
    800000ec:	01551513          	sll	a0,a0,0x15
    800000f0:	695000ef          	jal	80000f84 <pmm_init>
    800000f4:	00002517          	auipc	a0,0x2
    800000f8:	fec50513          	add	a0,a0,-20 # 800020e0 <rodata_start+0xe0>
    800000fc:	65d000ef          	jal	80000f58 <uart_puts>
    80000100:	785000ef          	jal	80001084 <create_pagetable>
    80000104:	14050a63          	beqz	a0,80000258 <pt_test+0x1a0>
    80000108:	00050413          	mv	s0,a0
    8000010c:	00002517          	auipc	a0,0x2
    80000110:	00450513          	add	a0,a0,4 # 80002110 <rodata_start+0x110>
    80000114:	645000ef          	jal	80000f58 <uart_puts>
    80000118:	00002517          	auipc	a0,0x2
    8000011c:	01050513          	add	a0,a0,16 # 80002128 <rodata_start+0x128>
    80000120:	639000ef          	jal	80000f58 <uart_puts>
    80000124:	00100613          	li	a2,1
    80000128:	01f61613          	sll	a2,a2,0x1f
    8000012c:	00a00693          	li	a3,10
    80000130:	00060593          	mv	a1,a2
    80000134:	00040513          	mv	a0,s0
    80000138:	781000ef          	jal	800010b8 <map_page>
    8000013c:	0c051263          	bnez	a0,80000200 <pt_test+0x148>
    80000140:	80000637          	lui	a2,0x80000
    80000144:	800005b7          	lui	a1,0x80000
    80000148:	00002517          	auipc	a0,0x2
    8000014c:	01850513          	add	a0,a0,24 # 80002160 <rodata_start+0x160>
    80000150:	359000ef          	jal	80000ca8 <printf>
    80000154:	40100613          	li	a2,1025
    80000158:	01561613          	sll	a2,a2,0x15
    8000015c:	00600693          	li	a3,6
    80000160:	00060593          	mv	a1,a2
    80000164:	00040513          	mv	a0,s0
    80000168:	751000ef          	jal	800010b8 <map_page>
    8000016c:	0a050e63          	beqz	a0,80000228 <pt_test+0x170>
    80000170:	00002517          	auipc	a0,0x2
    80000174:	02850513          	add	a0,a0,40 # 80002198 <rodata_start+0x198>
    80000178:	5e1000ef          	jal	80000f58 <uart_puts>
    8000017c:	080004b7          	lui	s1,0x8000
    80000180:	fff48493          	add	s1,s1,-1 # 7ffffff <_entry-0x78000001>
    80000184:	08100613          	li	a2,129
    80000188:	01600693          	li	a3,22
    8000018c:	01861613          	sll	a2,a2,0x18
    80000190:	00c49593          	sll	a1,s1,0xc
    80000194:	00040513          	mv	a0,s0
    80000198:	721000ef          	jal	800010b8 <map_page>
    8000019c:	0a050263          	beqz	a0,80000240 <pt_test+0x188>
    800001a0:	00002517          	auipc	a0,0x2
    800001a4:	05050513          	add	a0,a0,80 # 800021f0 <rodata_start+0x1f0>
    800001a8:	5b1000ef          	jal	80000f58 <uart_puts>
    800001ac:	00002517          	auipc	a0,0x2
    800001b0:	09c50513          	add	a0,a0,156 # 80002248 <rodata_start+0x248>
    800001b4:	5a5000ef          	jal	80000f58 <uart_puts>
    800001b8:	00000593          	li	a1,0
    800001bc:	00040513          	mv	a0,s0
    800001c0:	610010ef          	jal	800017d0 <dump_pagetable>
    800001c4:	00002517          	auipc	a0,0x2
    800001c8:	09450513          	add	a0,a0,148 # 80002258 <rodata_start+0x258>
    800001cc:	58d000ef          	jal	80000f58 <uart_puts>
    800001d0:	00040513          	mv	a0,s0
    800001d4:	0b4010ef          	jal	80001288 <destroy_pagetable>
    800001d8:	00002517          	auipc	a0,0x2
    800001dc:	09850513          	add	a0,a0,152 # 80002270 <rodata_start+0x270>
    800001e0:	579000ef          	jal	80000f58 <uart_puts>
    800001e4:	01013403          	ld	s0,16(sp)
    800001e8:	01813083          	ld	ra,24(sp)
    800001ec:	00813483          	ld	s1,8(sp)
    800001f0:	00002517          	auipc	a0,0x2
    800001f4:	09850513          	add	a0,a0,152 # 80002288 <rodata_start+0x288>
    800001f8:	02010113          	add	sp,sp,32
    800001fc:	55d0006f          	j	80000f58 <uart_puts>
    80000200:	00002517          	auipc	a0,0x2
    80000204:	f4050513          	add	a0,a0,-192 # 80002140 <rodata_start+0x140>
    80000208:	551000ef          	jal	80000f58 <uart_puts>
    8000020c:	40100613          	li	a2,1025
    80000210:	01561613          	sll	a2,a2,0x15
    80000214:	00600693          	li	a3,6
    80000218:	00060593          	mv	a1,a2
    8000021c:	00040513          	mv	a0,s0
    80000220:	699000ef          	jal	800010b8 <map_page>
    80000224:	f40516e3          	bnez	a0,80000170 <pt_test+0xb8>
    80000228:	80200637          	lui	a2,0x80200
    8000022c:	802005b7          	lui	a1,0x80200
    80000230:	00002517          	auipc	a0,0x2
    80000234:	f8850513          	add	a0,a0,-120 # 800021b8 <rodata_start+0x1b8>
    80000238:	271000ef          	jal	80000ca8 <printf>
    8000023c:	f41ff06f          	j	8000017c <pt_test+0xc4>
    80000240:	81000637          	lui	a2,0x81000
    80000244:	00c49593          	sll	a1,s1,0xc
    80000248:	00002517          	auipc	a0,0x2
    8000024c:	fc850513          	add	a0,a0,-56 # 80002210 <rodata_start+0x210>
    80000250:	259000ef          	jal	80000ca8 <printf>
    80000254:	f59ff06f          	j	800001ac <pt_test+0xf4>
    80000258:	01013403          	ld	s0,16(sp)
    8000025c:	01813083          	ld	ra,24(sp)
    80000260:	00813483          	ld	s1,8(sp)
    80000264:	00002517          	auipc	a0,0x2
    80000268:	e9450513          	add	a0,a0,-364 # 800020f8 <rodata_start+0xf8>
    8000026c:	02010113          	add	sp,sp,32
    80000270:	4e90006f          	j	80000f58 <uart_puts>

0000000080000274 <pmm_test>:
    80000274:	fe010113          	add	sp,sp,-32
    80000278:	00002517          	auipc	a0,0x2
    8000027c:	03050513          	add	a0,a0,48 # 800022a8 <rodata_start+0x2a8>
    80000280:	00113c23          	sd	ra,24(sp)
    80000284:	00813823          	sd	s0,16(sp)
    80000288:	00913423          	sd	s1,8(sp)
    8000028c:	01213023          	sd	s2,0(sp)
    80000290:	4c9000ef          	jal	80000f58 <uart_puts>
    80000294:	00002517          	auipc	a0,0x2
    80000298:	d8c50513          	add	a0,a0,-628 # 80002020 <rodata_start+0x20>
    8000029c:	4bd000ef          	jal	80000f58 <uart_puts>
    800002a0:	01100593          	li	a1,17
    800002a4:	40100513          	li	a0,1025
    800002a8:	01b59593          	sll	a1,a1,0x1b
    800002ac:	01551513          	sll	a0,a0,0x15
    800002b0:	4d5000ef          	jal	80000f84 <pmm_init>
    800002b4:	00002517          	auipc	a0,0x2
    800002b8:	01c50513          	add	a0,a0,28 # 800022d0 <rodata_start+0x2d0>
    800002bc:	49d000ef          	jal	80000f58 <uart_puts>
    800002c0:	545000ef          	jal	80001004 <alloc_page>
    800002c4:	00050593          	mv	a1,a0
    800002c8:	00050493          	mv	s1,a0
    800002cc:	00002517          	auipc	a0,0x2
    800002d0:	01c50513          	add	a0,a0,28 # 800022e8 <rodata_start+0x2e8>
    800002d4:	1d5000ef          	jal	80000ca8 <printf>
    800002d8:	52d000ef          	jal	80001004 <alloc_page>
    800002dc:	00050593          	mv	a1,a0
    800002e0:	00050413          	mv	s0,a0
    800002e4:	00002517          	auipc	a0,0x2
    800002e8:	02450513          	add	a0,a0,36 # 80002308 <rodata_start+0x308>
    800002ec:	1bd000ef          	jal	80000ca8 <printf>
    800002f0:	515000ef          	jal	80001004 <alloc_page>
    800002f4:	00050593          	mv	a1,a0
    800002f8:	00050913          	mv	s2,a0
    800002fc:	00002517          	auipc	a0,0x2
    80000300:	02c50513          	add	a0,a0,44 # 80002328 <rodata_start+0x328>
    80000304:	1a5000ef          	jal	80000ca8 <printf>
    80000308:	00002517          	auipc	a0,0x2
    8000030c:	04050513          	add	a0,a0,64 # 80002348 <rodata_start+0x348>
    80000310:	449000ef          	jal	80000f58 <uart_puts>
    80000314:	00048513          	mv	a0,s1
    80000318:	509000ef          	jal	80001020 <free_page>
    8000031c:	00002517          	auipc	a0,0x2
    80000320:	04450513          	add	a0,a0,68 # 80002360 <rodata_start+0x360>
    80000324:	435000ef          	jal	80000f58 <uart_puts>
    80000328:	00040513          	mv	a0,s0
    8000032c:	4f5000ef          	jal	80001020 <free_page>
    80000330:	00002517          	auipc	a0,0x2
    80000334:	04850513          	add	a0,a0,72 # 80002378 <rodata_start+0x378>
    80000338:	421000ef          	jal	80000f58 <uart_puts>
    8000033c:	00002517          	auipc	a0,0x2
    80000340:	05450513          	add	a0,a0,84 # 80002390 <rodata_start+0x390>
    80000344:	415000ef          	jal	80000f58 <uart_puts>
    80000348:	4bd000ef          	jal	80001004 <alloc_page>
    8000034c:	00050593          	mv	a1,a0
    80000350:	00050493          	mv	s1,a0
    80000354:	00002517          	auipc	a0,0x2
    80000358:	05c50513          	add	a0,a0,92 # 800023b0 <rodata_start+0x3b0>
    8000035c:	14d000ef          	jal	80000ca8 <printf>
    80000360:	4a5000ef          	jal	80001004 <alloc_page>
    80000364:	00050593          	mv	a1,a0
    80000368:	00050413          	mv	s0,a0
    8000036c:	00002517          	auipc	a0,0x2
    80000370:	04450513          	add	a0,a0,68 # 800023b0 <rodata_start+0x3b0>
    80000374:	135000ef          	jal	80000ca8 <printf>
    80000378:	00090513          	mv	a0,s2
    8000037c:	4a5000ef          	jal	80001020 <free_page>
    80000380:	00048513          	mv	a0,s1
    80000384:	49d000ef          	jal	80001020 <free_page>
    80000388:	00040513          	mv	a0,s0
    8000038c:	495000ef          	jal	80001020 <free_page>
    80000390:	00002517          	auipc	a0,0x2
    80000394:	04050513          	add	a0,a0,64 # 800023d0 <rodata_start+0x3d0>
    80000398:	3c1000ef          	jal	80000f58 <uart_puts>
    8000039c:	01013403          	ld	s0,16(sp)
    800003a0:	01813083          	ld	ra,24(sp)
    800003a4:	00813483          	ld	s1,8(sp)
    800003a8:	00013903          	ld	s2,0(sp)
    800003ac:	00002517          	auipc	a0,0x2
    800003b0:	04450513          	add	a0,a0,68 # 800023f0 <rodata_start+0x3f0>
    800003b4:	02010113          	add	sp,sp,32
    800003b8:	3a10006f          	j	80000f58 <uart_puts>

00000000800003bc <performance_test>:
    800003bc:	fd010113          	add	sp,sp,-48
    800003c0:	00002517          	auipc	a0,0x2
    800003c4:	05850513          	add	a0,a0,88 # 80002418 <rodata_start+0x418>
    800003c8:	02813023          	sd	s0,32(sp)
    800003cc:	00913c23          	sd	s1,24(sp)
    800003d0:	01213823          	sd	s2,16(sp)
    800003d4:	01313423          	sd	s3,8(sp)
    800003d8:	02113423          	sd	ra,40(sp)
    800003dc:	00000413          	li	s0,0
    800003e0:	379000ef          	jal	80000f58 <uart_puts>
    800003e4:	00002997          	auipc	s3,0x2
    800003e8:	55498993          	add	s3,s3,1364 # 80002938 <long_string>
    800003ec:	00002917          	auipc	s2,0x2
    800003f0:	04490913          	add	s2,s2,68 # 80002430 <rodata_start+0x430>
    800003f4:	06400493          	li	s1,100
    800003f8:	00040593          	mv	a1,s0
    800003fc:	00098613          	mv	a2,s3
    80000400:	0014041b          	addw	s0,s0,1
    80000404:	00090513          	mv	a0,s2
    80000408:	0a1000ef          	jal	80000ca8 <printf>
    8000040c:	fe9416e3          	bne	s0,s1,800003f8 <performance_test+0x3c>
    80000410:	02013403          	ld	s0,32(sp)
    80000414:	02813083          	ld	ra,40(sp)
    80000418:	01813483          	ld	s1,24(sp)
    8000041c:	01013903          	ld	s2,16(sp)
    80000420:	00813983          	ld	s3,8(sp)
    80000424:	00002517          	auipc	a0,0x2
    80000428:	02450513          	add	a0,a0,36 # 80002448 <rodata_start+0x448>
    8000042c:	03010113          	add	sp,sp,48
    80000430:	3290006f          	j	80000f58 <uart_puts>

0000000080000434 <basic_format_test>:
    80000434:	ff010113          	add	sp,sp,-16
    80000438:	00002517          	auipc	a0,0x2
    8000043c:	02850513          	add	a0,a0,40 # 80002460 <rodata_start+0x460>
    80000440:	00113423          	sd	ra,8(sp)
    80000444:	315000ef          	jal	80000f58 <uart_puts>
    80000448:	000035b7          	lui	a1,0x3
    8000044c:	03958593          	add	a1,a1,57 # 3039 <_entry-0x7fffcfc7>
    80000450:	00002517          	auipc	a0,0x2
    80000454:	03850513          	add	a0,a0,56 # 80002488 <rodata_start+0x488>
    80000458:	051000ef          	jal	80000ca8 <printf>
    8000045c:	fffe85b7          	lui	a1,0xfffe8
    80000460:	e3358593          	add	a1,a1,-461 # fffffffffffe7e33 <bss_end+0xffffffff7ffd6e13>
    80000464:	00002517          	auipc	a0,0x2
    80000468:	03c50513          	add	a0,a0,60 # 800024a0 <rodata_start+0x4a0>
    8000046c:	03d000ef          	jal	80000ca8 <printf>
    80000470:	deadc5b7          	lui	a1,0xdeadc
    80000474:	eef58593          	add	a1,a1,-273 # ffffffffdeadbeef <bss_end+0xffffffff5eacaecf>
    80000478:	00002517          	auipc	a0,0x2
    8000047c:	04050513          	add	a0,a0,64 # 800024b8 <rodata_start+0x4b8>
    80000480:	029000ef          	jal	80000ca8 <printf>
    80000484:	00002597          	auipc	a1,0x2
    80000488:	05458593          	add	a1,a1,84 # 800024d8 <rodata_start+0x4d8>
    8000048c:	00002517          	auipc	a0,0x2
    80000490:	05c50513          	add	a0,a0,92 # 800024e8 <rodata_start+0x4e8>
    80000494:	015000ef          	jal	80000ca8 <printf>
    80000498:	04100593          	li	a1,65
    8000049c:	00002517          	auipc	a0,0x2
    800004a0:	06450513          	add	a0,a0,100 # 80002500 <rodata_start+0x500>
    800004a4:	005000ef          	jal	80000ca8 <printf>
    800004a8:	00002517          	auipc	a0,0x2
    800004ac:	07050513          	add	a0,a0,112 # 80002518 <rodata_start+0x518>
    800004b0:	7f8000ef          	jal	80000ca8 <printf>
    800004b4:	00000593          	li	a1,0
    800004b8:	00002517          	auipc	a0,0x2
    800004bc:	07850513          	add	a0,a0,120 # 80002530 <rodata_start+0x530>
    800004c0:	7e8000ef          	jal	80000ca8 <printf>
    800004c4:	800005b7          	lui	a1,0x80000
    800004c8:	fff5c593          	not	a1,a1
    800004cc:	00002517          	auipc	a0,0x2
    800004d0:	07c50513          	add	a0,a0,124 # 80002548 <rodata_start+0x548>
    800004d4:	7d4000ef          	jal	80000ca8 <printf>
    800004d8:	800005b7          	lui	a1,0x80000
    800004dc:	00002517          	auipc	a0,0x2
    800004e0:	08450513          	add	a0,a0,132 # 80002560 <rodata_start+0x560>
    800004e4:	7c4000ef          	jal	80000ca8 <printf>
    800004e8:	00813083          	ld	ra,8(sp)
    800004ec:	00002517          	auipc	a0,0x2
    800004f0:	08c50513          	add	a0,a0,140 # 80002578 <rodata_start+0x578>
    800004f4:	01010113          	add	sp,sp,16
    800004f8:	2610006f          	j	80000f58 <uart_puts>

00000000800004fc <boundary_test>:
    800004fc:	ff010113          	add	sp,sp,-16
    80000500:	00002517          	auipc	a0,0x2
    80000504:	0a050513          	add	a0,a0,160 # 800025a0 <rodata_start+0x5a0>
    80000508:	00113423          	sd	ra,8(sp)
    8000050c:	24d000ef          	jal	80000f58 <uart_puts>
    80000510:	00000593          	li	a1,0
    80000514:	00002517          	auipc	a0,0x2
    80000518:	0b450513          	add	a0,a0,180 # 800025c8 <rodata_start+0x5c8>
    8000051c:	78c000ef          	jal	80000ca8 <printf>
    80000520:	00002597          	auipc	a1,0x2
    80000524:	c1858593          	add	a1,a1,-1000 # 80002138 <rodata_start+0x138>
    80000528:	00002517          	auipc	a0,0x2
    8000052c:	0b850513          	add	a0,a0,184 # 800025e0 <rodata_start+0x5e0>
    80000530:	778000ef          	jal	80000ca8 <printf>
    80000534:	00002517          	auipc	a0,0x2
    80000538:	0c450513          	add	a0,a0,196 # 800025f8 <rodata_start+0x5f8>
    8000053c:	76c000ef          	jal	80000ca8 <printf>
    80000540:	00002517          	auipc	a0,0x2
    80000544:	0d050513          	add	a0,a0,208 # 80002610 <rodata_start+0x610>
    80000548:	760000ef          	jal	80000ca8 <printf>
    8000054c:	00813083          	ld	ra,8(sp)
    80000550:	00002517          	auipc	a0,0x2
    80000554:	0d850513          	add	a0,a0,216 # 80002628 <rodata_start+0x628>
    80000558:	01010113          	add	sp,sp,16
    8000055c:	1fd0006f          	j	80000f58 <uart_puts>

0000000080000560 <color_test>:
    80000560:	ff010113          	add	sp,sp,-16
    80000564:	00002517          	auipc	a0,0x2
    80000568:	0ec50513          	add	a0,a0,236 # 80002650 <rodata_start+0x650>
    8000056c:	00113423          	sd	ra,8(sp)
    80000570:	1e9000ef          	jal	80000f58 <uart_puts>
    80000574:	00002597          	auipc	a1,0x2
    80000578:	0fc58593          	add	a1,a1,252 # 80002670 <rodata_start+0x670>
    8000057c:	01f00513          	li	a0,31
    80000580:	4dc000ef          	jal	80000a5c <printf_color>
    80000584:	00002597          	auipc	a1,0x2
    80000588:	0fc58593          	add	a1,a1,252 # 80002680 <rodata_start+0x680>
    8000058c:	02000513          	li	a0,32
    80000590:	4cc000ef          	jal	80000a5c <printf_color>
    80000594:	00002597          	auipc	a1,0x2
    80000598:	0fc58593          	add	a1,a1,252 # 80002690 <rodata_start+0x690>
    8000059c:	02200513          	li	a0,34
    800005a0:	4bc000ef          	jal	80000a5c <printf_color>
    800005a4:	00002597          	auipc	a1,0x2
    800005a8:	0fc58593          	add	a1,a1,252 # 800026a0 <rodata_start+0x6a0>
    800005ac:	02100513          	li	a0,33
    800005b0:	4ac000ef          	jal	80000a5c <printf_color>
    800005b4:	00002597          	auipc	a1,0x2
    800005b8:	0fc58593          	add	a1,a1,252 # 800026b0 <rodata_start+0x6b0>
    800005bc:	02300513          	li	a0,35
    800005c0:	49c000ef          	jal	80000a5c <printf_color>
    800005c4:	00002597          	auipc	a1,0x2
    800005c8:	10458593          	add	a1,a1,260 # 800026c8 <rodata_start+0x6c8>
    800005cc:	02400513          	li	a0,36
    800005d0:	48c000ef          	jal	80000a5c <printf_color>
    800005d4:	00002597          	auipc	a1,0x2
    800005d8:	10458593          	add	a1,a1,260 # 800026d8 <rodata_start+0x6d8>
    800005dc:	02500513          	li	a0,37
    800005e0:	47c000ef          	jal	80000a5c <printf_color>
    800005e4:	06400613          	li	a2,100
    800005e8:	00002597          	auipc	a1,0x2
    800005ec:	10058593          	add	a1,a1,256 # 800026e8 <rodata_start+0x6e8>
    800005f0:	01f00513          	li	a0,31
    800005f4:	468000ef          	jal	80000a5c <printf_color>
    800005f8:	00002617          	auipc	a2,0x2
    800005fc:	10860613          	add	a2,a2,264 # 80002700 <rodata_start+0x700>
    80000600:	00002597          	auipc	a1,0x2
    80000604:	10858593          	add	a1,a1,264 # 80002708 <rodata_start+0x708>
    80000608:	02000513          	li	a0,32
    8000060c:	450000ef          	jal	80000a5c <printf_color>
    80000610:	00813083          	ld	ra,8(sp)
    80000614:	00002517          	auipc	a0,0x2
    80000618:	10c50513          	add	a0,a0,268 # 80002720 <rodata_start+0x720>
    8000061c:	01010113          	add	sp,sp,16
    80000620:	1390006f          	j	80000f58 <uart_puts>

0000000080000624 <screen_test>:
    80000624:	fd010113          	add	sp,sp,-48
    80000628:	00002517          	auipc	a0,0x2
    8000062c:	11850513          	add	a0,a0,280 # 80002740 <rodata_start+0x740>
    80000630:	02113423          	sd	ra,40(sp)
    80000634:	02813023          	sd	s0,32(sp)
    80000638:	00913c23          	sd	s1,24(sp)
    8000063c:	01213823          	sd	s2,16(sp)
    80000640:	119000ef          	jal	80000f58 <uart_puts>
    80000644:	00002517          	auipc	a0,0x2
    80000648:	12450513          	add	a0,a0,292 # 80002768 <rodata_start+0x768>
    8000064c:	10d000ef          	jal	80000f58 <uart_puts>
    80000650:	00000413          	li	s0,0
    80000654:	00002917          	auipc	s2,0x2
    80000658:	12c90913          	add	s2,s2,300 # 80002780 <rodata_start+0x780>
    8000065c:	00500493          	li	s1,5
    80000660:	00040593          	mv	a1,s0
    80000664:	00090513          	mv	a0,s2
    80000668:	0014041b          	addw	s0,s0,1
    8000066c:	63c000ef          	jal	80000ca8 <printf>
    80000670:	fe9418e3          	bne	s0,s1,80000660 <screen_test+0x3c>
    80000674:	00012623          	sw	zero,12(sp)
    80000678:	00c12783          	lw	a5,12(sp)
    8000067c:	00018737          	lui	a4,0x18
    80000680:	69f70713          	add	a4,a4,1695 # 1869f <_entry-0x7ffe7961>
    80000684:	00f74c63          	blt	a4,a5,8000069c <screen_test+0x78>
    80000688:	00c12783          	lw	a5,12(sp)
    8000068c:	0017879b          	addw	a5,a5,1
    80000690:	00f12623          	sw	a5,12(sp)
    80000694:	00c12783          	lw	a5,12(sp)
    80000698:	fef758e3          	bge	a4,a5,80000688 <screen_test+0x64>
    8000069c:	21c000ef          	jal	800008b8 <clear_screen>
    800006a0:	00002517          	auipc	a0,0x2
    800006a4:	0e850513          	add	a0,a0,232 # 80002788 <rodata_start+0x788>
    800006a8:	0b1000ef          	jal	80000f58 <uart_puts>
    800006ac:	00002517          	auipc	a0,0x2
    800006b0:	11450513          	add	a0,a0,276 # 800027c0 <rodata_start+0x7c0>
    800006b4:	0a5000ef          	jal	80000f58 <uart_puts>
    800006b8:	00500593          	li	a1,5
    800006bc:	00100513          	li	a0,1
    800006c0:	210000ef          	jal	800008d0 <goto_xy>
    800006c4:	00002517          	auipc	a0,0x2
    800006c8:	11450513          	add	a0,a0,276 # 800027d8 <rodata_start+0x7d8>
    800006cc:	08d000ef          	jal	80000f58 <uart_puts>
    800006d0:	00500593          	li	a1,5
    800006d4:	01400513          	li	a0,20
    800006d8:	1f8000ef          	jal	800008d0 <goto_xy>
    800006dc:	00002517          	auipc	a0,0x2
    800006e0:	10c50513          	add	a0,a0,268 # 800027e8 <rodata_start+0x7e8>
    800006e4:	075000ef          	jal	80000f58 <uart_puts>
    800006e8:	00700593          	li	a1,7
    800006ec:	00100513          	li	a0,1
    800006f0:	1e0000ef          	jal	800008d0 <goto_xy>
    800006f4:	00002597          	auipc	a1,0x2
    800006f8:	10458593          	add	a1,a1,260 # 800027f8 <rodata_start+0x7f8>
    800006fc:	02400513          	li	a0,36
    80000700:	35c000ef          	jal	80000a5c <printf_color>
    80000704:	00900593          	li	a1,9
    80000708:	00100513          	li	a0,1
    8000070c:	1c4000ef          	jal	800008d0 <goto_xy>
    80000710:	00002517          	auipc	a0,0x2
    80000714:	10050513          	add	a0,a0,256 # 80002810 <rodata_start+0x810>
    80000718:	041000ef          	jal	80000f58 <uart_puts>
    8000071c:	00a00593          	li	a1,10
    80000720:	00100513          	li	a0,1
    80000724:	1ac000ef          	jal	800008d0 <goto_xy>
    80000728:	19c000ef          	jal	800008c4 <clear_line>
    8000072c:	00002517          	auipc	a0,0x2
    80000730:	0fc50513          	add	a0,a0,252 # 80002828 <rodata_start+0x828>
    80000734:	025000ef          	jal	80000f58 <uart_puts>
    80000738:	02013403          	ld	s0,32(sp)
    8000073c:	02813083          	ld	ra,40(sp)
    80000740:	01813483          	ld	s1,24(sp)
    80000744:	01013903          	ld	s2,16(sp)
    80000748:	00002517          	auipc	a0,0x2
    8000074c:	10850513          	add	a0,a0,264 # 80002850 <rodata_start+0x850>
    80000750:	03010113          	add	sp,sp,48
    80000754:	0050006f          	j	80000f58 <uart_puts>

0000000080000758 <error_recovery_test>:
    80000758:	ff010113          	add	sp,sp,-16
    8000075c:	00002517          	auipc	a0,0x2
    80000760:	11c50513          	add	a0,a0,284 # 80002878 <rodata_start+0x878>
    80000764:	00113423          	sd	ra,8(sp)
    80000768:	7f0000ef          	jal	80000f58 <uart_puts>
    8000076c:	00000513          	li	a0,0
    80000770:	538000ef          	jal	80000ca8 <printf>
    80000774:	02054863          	bltz	a0,800007a4 <error_recovery_test+0x4c>
    80000778:	00002617          	auipc	a2,0x2
    8000077c:	14860613          	add	a2,a2,328 # 800028c0 <rodata_start+0x8c0>
    80000780:	02a00593          	li	a1,42
    80000784:	00002517          	auipc	a0,0x2
    80000788:	14450513          	add	a0,a0,324 # 800028c8 <rodata_start+0x8c8>
    8000078c:	51c000ef          	jal	80000ca8 <printf>
    80000790:	00813083          	ld	ra,8(sp)
    80000794:	00002517          	auipc	a0,0x2
    80000798:	15450513          	add	a0,a0,340 # 800028e8 <rodata_start+0x8e8>
    8000079c:	01010113          	add	sp,sp,16
    800007a0:	7b80006f          	j	80000f58 <uart_puts>
    800007a4:	00002517          	auipc	a0,0x2
    800007a8:	0f450513          	add	a0,a0,244 # 80002898 <rodata_start+0x898>
    800007ac:	7ac000ef          	jal	80000f58 <uart_puts>
    800007b0:	fc9ff06f          	j	80000778 <error_recovery_test+0x20>

00000000800007b4 <main>:
    800007b4:	ff010113          	add	sp,sp,-16
    800007b8:	00002517          	auipc	a0,0x2
    800007bc:	15050513          	add	a0,a0,336 # 80002908 <rodata_start+0x908>
    800007c0:	00113423          	sd	ra,8(sp)
    800007c4:	794000ef          	jal	80000f58 <uart_puts>
    800007c8:	87dff0ef          	jal	80000044 <test_virtual_memory>
    800007cc:	aa9ff0ef          	jal	80000274 <pmm_test>
    800007d0:	8e9ff0ef          	jal	800000b8 <pt_test>
    800007d4:	00002517          	auipc	a0,0x2
    800007d8:	14c50513          	add	a0,a0,332 # 80002920 <rodata_start+0x920>
    800007dc:	77c000ef          	jal	80000f58 <uart_puts>
    800007e0:	0000006f          	j	800007e0 <main+0x2c>

00000000800007e4 <print_number>:
    800007e4:	0c050663          	beqz	a0,800008b0 <print_number+0xcc>
    800007e8:	fd010113          	add	sp,sp,-48
    800007ec:	02113423          	sd	ra,40(sp)
    800007f0:	02813023          	sd	s0,32(sp)
    800007f4:	08061a63          	bnez	a2,80000888 <print_number+0xa4>
    800007f8:	0005071b          	sext.w	a4,a0
    800007fc:	00000613          	li	a2,0
    80000800:	0005859b          	sext.w	a1,a1
    80000804:	00010fa3          	sb	zero,31(sp)
    80000808:	01e10813          	add	a6,sp,30
    8000080c:	01f00693          	li	a3,31
    80000810:	00002317          	auipc	t1,0x2
    80000814:	53030313          	add	t1,t1,1328 # 80002d40 <digits>
    80000818:	02b777bb          	remuw	a5,a4,a1
    8000081c:	fff80813          	add	a6,a6,-1
    80000820:	0007089b          	sext.w	a7,a4
    80000824:	00068e13          	mv	t3,a3
    80000828:	fff6869b          	addw	a3,a3,-1
    8000082c:	02079793          	sll	a5,a5,0x20
    80000830:	0207d793          	srl	a5,a5,0x20
    80000834:	00f307b3          	add	a5,t1,a5
    80000838:	0007c503          	lbu	a0,0(a5)
    8000083c:	02b7573b          	divuw	a4,a4,a1
    80000840:	00a800a3          	sb	a0,1(a6)
    80000844:	fcb8fae3          	bgeu	a7,a1,80000818 <print_number+0x34>
    80000848:	04060a63          	beqz	a2,8000089c <print_number+0xb8>
    8000084c:	ffee069b          	addw	a3,t3,-2
    80000850:	02068793          	add	a5,a3,32
    80000854:	002787b3          	add	a5,a5,sp
    80000858:	02d00713          	li	a4,45
    8000085c:	fee78023          	sb	a4,-32(a5)
    80000860:	02d00513          	li	a0,45
    80000864:	00d10433          	add	s0,sp,a3
    80000868:	00140413          	add	s0,s0,1
    8000086c:	6d4000ef          	jal	80000f40 <uart_putc>
    80000870:	00044503          	lbu	a0,0(s0)
    80000874:	fe051ae3          	bnez	a0,80000868 <print_number+0x84>
    80000878:	02813083          	ld	ra,40(sp)
    8000087c:	02013403          	ld	s0,32(sp)
    80000880:	03010113          	add	sp,sp,48
    80000884:	00008067          	ret
    80000888:	f60558e3          	bgez	a0,800007f8 <print_number+0x14>
    8000088c:	80000737          	lui	a4,0x80000
    80000890:	f6e508e3          	beq	a0,a4,80000800 <print_number+0x1c>
    80000894:	40a0073b          	negw	a4,a0
    80000898:	f69ff06f          	j	80000800 <print_number+0x1c>
    8000089c:	fc0514e3          	bnez	a0,80000864 <print_number+0x80>
    800008a0:	02813083          	ld	ra,40(sp)
    800008a4:	02013403          	ld	s0,32(sp)
    800008a8:	03010113          	add	sp,sp,48
    800008ac:	00008067          	ret
    800008b0:	03000513          	li	a0,48
    800008b4:	68c0006f          	j	80000f40 <uart_putc>

00000000800008b8 <clear_screen>:
    800008b8:	00002517          	auipc	a0,0x2
    800008bc:	23850513          	add	a0,a0,568 # 80002af0 <long_string+0x1b8>
    800008c0:	6980006f          	j	80000f58 <uart_puts>

00000000800008c4 <clear_line>:
    800008c4:	00002517          	auipc	a0,0x2
    800008c8:	23450513          	add	a0,a0,564 # 80002af8 <long_string+0x1c0>
    800008cc:	68c0006f          	j	80000f58 <uart_puts>

00000000800008d0 <goto_xy>:
    800008d0:	fd010113          	add	sp,sp,-48
    800008d4:	00913c23          	sd	s1,24(sp)
    800008d8:	00050493          	mv	s1,a0
    800008dc:	01b00513          	li	a0,27
    800008e0:	02113423          	sd	ra,40(sp)
    800008e4:	02813023          	sd	s0,32(sp)
    800008e8:	01213823          	sd	s2,16(sp)
    800008ec:	00058413          	mv	s0,a1
    800008f0:	01313423          	sd	s3,8(sp)
    800008f4:	64c000ef          	jal	80000f40 <uart_putc>
    800008f8:	05b00513          	li	a0,91
    800008fc:	644000ef          	jal	80000f40 <uart_putc>
    80000900:	06300793          	li	a5,99
    80000904:	0c87cc63          	blt	a5,s0,800009dc <goto_xy+0x10c>
    80000908:	00900793          	li	a5,9
    8000090c:	0487ce63          	blt	a5,s0,80000968 <goto_xy+0x98>
    80000910:	12805a63          	blez	s0,80000a44 <goto_xy+0x174>
    80000914:	0304041b          	addw	s0,s0,48
    80000918:	0ff47513          	zext.b	a0,s0
    8000091c:	624000ef          	jal	80000f40 <uart_putc>
    80000920:	03b00513          	li	a0,59
    80000924:	61c000ef          	jal	80000f40 <uart_putc>
    80000928:	06300793          	li	a5,99
    8000092c:	0697c863          	blt	a5,s1,8000099c <goto_xy+0xcc>
    80000930:	00900793          	li	a5,9
    80000934:	0e97c463          	blt	a5,s1,80000a1c <goto_xy+0x14c>
    80000938:	10905c63          	blez	s1,80000a50 <goto_xy+0x180>
    8000093c:	0304851b          	addw	a0,s1,48
    80000940:	0ff57513          	zext.b	a0,a0
    80000944:	5fc000ef          	jal	80000f40 <uart_putc>
    80000948:	02013403          	ld	s0,32(sp)
    8000094c:	02813083          	ld	ra,40(sp)
    80000950:	01813483          	ld	s1,24(sp)
    80000954:	01013903          	ld	s2,16(sp)
    80000958:	00813983          	ld	s3,8(sp)
    8000095c:	04800513          	li	a0,72
    80000960:	03010113          	add	sp,sp,48
    80000964:	5dc0006f          	j	80000f40 <uart_putc>
    80000968:	00a00913          	li	s2,10
    8000096c:	0324453b          	divw	a0,s0,s2
    80000970:	0305051b          	addw	a0,a0,48
    80000974:	0ff57513          	zext.b	a0,a0
    80000978:	5c8000ef          	jal	80000f40 <uart_putc>
    8000097c:	0324643b          	remw	s0,s0,s2
    80000980:	0304041b          	addw	s0,s0,48
    80000984:	0ff47513          	zext.b	a0,s0
    80000988:	5b8000ef          	jal	80000f40 <uart_putc>
    8000098c:	03b00513          	li	a0,59
    80000990:	5b0000ef          	jal	80000f40 <uart_putc>
    80000994:	06300793          	li	a5,99
    80000998:	f897dce3          	bge	a5,s1,80000930 <goto_xy+0x60>
    8000099c:	06400413          	li	s0,100
    800009a0:	0284c53b          	divw	a0,s1,s0
    800009a4:	00a00913          	li	s2,10
    800009a8:	0305051b          	addw	a0,a0,48
    800009ac:	0ff57513          	zext.b	a0,a0
    800009b0:	590000ef          	jal	80000f40 <uart_putc>
    800009b4:	0284e53b          	remw	a0,s1,s0
    800009b8:	0325453b          	divw	a0,a0,s2
    800009bc:	0305051b          	addw	a0,a0,48
    800009c0:	0ff57513          	zext.b	a0,a0
    800009c4:	57c000ef          	jal	80000f40 <uart_putc>
    800009c8:	0324e53b          	remw	a0,s1,s2
    800009cc:	0305051b          	addw	a0,a0,48
    800009d0:	0ff57513          	zext.b	a0,a0
    800009d4:	56c000ef          	jal	80000f40 <uart_putc>
    800009d8:	f71ff06f          	j	80000948 <goto_xy+0x78>
    800009dc:	06400913          	li	s2,100
    800009e0:	0324453b          	divw	a0,s0,s2
    800009e4:	00a00993          	li	s3,10
    800009e8:	0305051b          	addw	a0,a0,48
    800009ec:	0ff57513          	zext.b	a0,a0
    800009f0:	550000ef          	jal	80000f40 <uart_putc>
    800009f4:	0324653b          	remw	a0,s0,s2
    800009f8:	0335453b          	divw	a0,a0,s3
    800009fc:	0305051b          	addw	a0,a0,48
    80000a00:	0ff57513          	zext.b	a0,a0
    80000a04:	53c000ef          	jal	80000f40 <uart_putc>
    80000a08:	0334643b          	remw	s0,s0,s3
    80000a0c:	0304041b          	addw	s0,s0,48
    80000a10:	0ff47513          	zext.b	a0,s0
    80000a14:	52c000ef          	jal	80000f40 <uart_putc>
    80000a18:	f09ff06f          	j	80000920 <goto_xy+0x50>
    80000a1c:	00a00413          	li	s0,10
    80000a20:	0284c53b          	divw	a0,s1,s0
    80000a24:	0305051b          	addw	a0,a0,48
    80000a28:	0ff57513          	zext.b	a0,a0
    80000a2c:	514000ef          	jal	80000f40 <uart_putc>
    80000a30:	0284e53b          	remw	a0,s1,s0
    80000a34:	0305051b          	addw	a0,a0,48
    80000a38:	0ff57513          	zext.b	a0,a0
    80000a3c:	504000ef          	jal	80000f40 <uart_putc>
    80000a40:	f09ff06f          	j	80000948 <goto_xy+0x78>
    80000a44:	03100513          	li	a0,49
    80000a48:	4f8000ef          	jal	80000f40 <uart_putc>
    80000a4c:	ed5ff06f          	j	80000920 <goto_xy+0x50>
    80000a50:	03100513          	li	a0,49
    80000a54:	4ec000ef          	jal	80000f40 <uart_putc>
    80000a58:	ef1ff06f          	j	80000948 <goto_xy+0x78>

0000000080000a5c <printf_color>:
    80000a5c:	f8010113          	add	sp,sp,-128
    80000a60:	02913c23          	sd	s1,56(sp)
    80000a64:	00050493          	mv	s1,a0
    80000a68:	01b00513          	li	a0,27
    80000a6c:	06f13423          	sd	a5,104(sp)
    80000a70:	04113423          	sd	ra,72(sp)
    80000a74:	04813023          	sd	s0,64(sp)
    80000a78:	04c13823          	sd	a2,80(sp)
    80000a7c:	04d13c23          	sd	a3,88(sp)
    80000a80:	06e13023          	sd	a4,96(sp)
    80000a84:	07013823          	sd	a6,112(sp)
    80000a88:	07113c23          	sd	a7,120(sp)
    80000a8c:	00058413          	mv	s0,a1
    80000a90:	03213823          	sd	s2,48(sp)
    80000a94:	03313423          	sd	s3,40(sp)
    80000a98:	03413023          	sd	s4,32(sp)
    80000a9c:	01513c23          	sd	s5,24(sp)
    80000aa0:	4a0000ef          	jal	80000f40 <uart_putc>
    80000aa4:	05b00513          	li	a0,91
    80000aa8:	498000ef          	jal	80000f40 <uart_putc>
    80000aac:	06300793          	li	a5,99
    80000ab0:	1a97e063          	bltu	a5,s1,80000c50 <printf_color+0x1f4>
    80000ab4:	00900793          	li	a5,9
    80000ab8:	1497e663          	bltu	a5,s1,80000c04 <printf_color+0x1a8>
    80000abc:	0304851b          	addw	a0,s1,48
    80000ac0:	0ff57513          	zext.b	a0,a0
    80000ac4:	47c000ef          	jal	80000f40 <uart_putc>
    80000ac8:	06d00513          	li	a0,109
    80000acc:	474000ef          	jal	80000f40 <uart_putc>
    80000ad0:	1c040863          	beqz	s0,80000ca0 <printf_color+0x244>
    80000ad4:	00044503          	lbu	a0,0(s0)
    80000ad8:	05010793          	add	a5,sp,80
    80000adc:	00f13423          	sd	a5,8(sp)
    80000ae0:	00000a93          	li	s5,0
    80000ae4:	06050463          	beqz	a0,80000b4c <printf_color+0xf0>
    80000ae8:	02500913          	li	s2,37
    80000aec:	02000a13          	li	s4,32
    80000af0:	00002997          	auipc	s3,0x2
    80000af4:	14898993          	add	s3,s3,328 # 80002c38 <long_string+0x300>
    80000af8:	00140493          	add	s1,s0,1
    80000afc:	13251863          	bne	a0,s2,80000c2c <printf_color+0x1d0>
    80000b00:	00144783          	lbu	a5,1(s0)
    80000b04:	14078063          	beqz	a5,80000c44 <printf_color+0x1e8>
    80000b08:	13278863          	beq	a5,s2,80000c38 <printf_color+0x1dc>
    80000b0c:	fa87879b          	addw	a5,a5,-88
    80000b10:	0ff7f793          	zext.b	a5,a5
    80000b14:	00fa6c63          	bltu	s4,a5,80000b2c <printf_color+0xd0>
    80000b18:	00279793          	sll	a5,a5,0x2
    80000b1c:	013787b3          	add	a5,a5,s3
    80000b20:	0007a783          	lw	a5,0(a5)
    80000b24:	013787b3          	add	a5,a5,s3
    80000b28:	00078067          	jr	a5
    80000b2c:	02500513          	li	a0,37
    80000b30:	410000ef          	jal	80000f40 <uart_putc>
    80000b34:	00144503          	lbu	a0,1(s0)
    80000b38:	ffe00a93          	li	s5,-2
    80000b3c:	404000ef          	jal	80000f40 <uart_putc>
    80000b40:	0014c503          	lbu	a0,1(s1)
    80000b44:	00148413          	add	s0,s1,1
    80000b48:	fa0518e3          	bnez	a0,80000af8 <printf_color+0x9c>
    80000b4c:	00002517          	auipc	a0,0x2
    80000b50:	fbc50513          	add	a0,a0,-68 # 80002b08 <long_string+0x1d0>
    80000b54:	404000ef          	jal	80000f58 <uart_puts>
    80000b58:	04813083          	ld	ra,72(sp)
    80000b5c:	04013403          	ld	s0,64(sp)
    80000b60:	03813483          	ld	s1,56(sp)
    80000b64:	03013903          	ld	s2,48(sp)
    80000b68:	02813983          	ld	s3,40(sp)
    80000b6c:	02013a03          	ld	s4,32(sp)
    80000b70:	000a8513          	mv	a0,s5
    80000b74:	01813a83          	ld	s5,24(sp)
    80000b78:	08010113          	add	sp,sp,128
    80000b7c:	00008067          	ret
    80000b80:	00813783          	ld	a5,8(sp)
    80000b84:	00000613          	li	a2,0
    80000b88:	01000593          	li	a1,16
    80000b8c:	0007a503          	lw	a0,0(a5)
    80000b90:	00878793          	add	a5,a5,8
    80000b94:	00f13423          	sd	a5,8(sp)
    80000b98:	c4dff0ef          	jal	800007e4 <print_number>
    80000b9c:	fa5ff06f          	j	80000b40 <printf_color+0xe4>
    80000ba0:	00813783          	ld	a5,8(sp)
    80000ba4:	0007c503          	lbu	a0,0(a5)
    80000ba8:	00878793          	add	a5,a5,8
    80000bac:	00f13423          	sd	a5,8(sp)
    80000bb0:	390000ef          	jal	80000f40 <uart_putc>
    80000bb4:	f8dff06f          	j	80000b40 <printf_color+0xe4>
    80000bb8:	00813783          	ld	a5,8(sp)
    80000bbc:	0007b403          	ld	s0,0(a5)
    80000bc0:	00878793          	add	a5,a5,8
    80000bc4:	00f13423          	sd	a5,8(sp)
    80000bc8:	00041863          	bnez	s0,80000bd8 <printf_color+0x17c>
    80000bcc:	0c40006f          	j	80000c90 <printf_color+0x234>
    80000bd0:	00140413          	add	s0,s0,1
    80000bd4:	36c000ef          	jal	80000f40 <uart_putc>
    80000bd8:	00044503          	lbu	a0,0(s0)
    80000bdc:	fe051ae3          	bnez	a0,80000bd0 <printf_color+0x174>
    80000be0:	f61ff06f          	j	80000b40 <printf_color+0xe4>
    80000be4:	00813783          	ld	a5,8(sp)
    80000be8:	00100613          	li	a2,1
    80000bec:	00a00593          	li	a1,10
    80000bf0:	0007a503          	lw	a0,0(a5)
    80000bf4:	00878793          	add	a5,a5,8
    80000bf8:	00f13423          	sd	a5,8(sp)
    80000bfc:	be9ff0ef          	jal	800007e4 <print_number>
    80000c00:	f41ff06f          	j	80000b40 <printf_color+0xe4>
    80000c04:	00a00913          	li	s2,10
    80000c08:	0324d53b          	divuw	a0,s1,s2
    80000c0c:	0305051b          	addw	a0,a0,48
    80000c10:	0ff57513          	zext.b	a0,a0
    80000c14:	32c000ef          	jal	80000f40 <uart_putc>
    80000c18:	0324f53b          	remuw	a0,s1,s2
    80000c1c:	0305051b          	addw	a0,a0,48
    80000c20:	07f57513          	and	a0,a0,127
    80000c24:	31c000ef          	jal	80000f40 <uart_putc>
    80000c28:	ea1ff06f          	j	80000ac8 <printf_color+0x6c>
    80000c2c:	314000ef          	jal	80000f40 <uart_putc>
    80000c30:	00040493          	mv	s1,s0
    80000c34:	f0dff06f          	j	80000b40 <printf_color+0xe4>
    80000c38:	02500513          	li	a0,37
    80000c3c:	304000ef          	jal	80000f40 <uart_putc>
    80000c40:	f01ff06f          	j	80000b40 <printf_color+0xe4>
    80000c44:	02500513          	li	a0,37
    80000c48:	2f8000ef          	jal	80000f40 <uart_putc>
    80000c4c:	f01ff06f          	j	80000b4c <printf_color+0xf0>
    80000c50:	06400913          	li	s2,100
    80000c54:	0324d53b          	divuw	a0,s1,s2
    80000c58:	00a00993          	li	s3,10
    80000c5c:	0305051b          	addw	a0,a0,48
    80000c60:	0ff57513          	zext.b	a0,a0
    80000c64:	2dc000ef          	jal	80000f40 <uart_putc>
    80000c68:	0324f53b          	remuw	a0,s1,s2
    80000c6c:	0335553b          	divuw	a0,a0,s3
    80000c70:	0305051b          	addw	a0,a0,48
    80000c74:	0ff57513          	zext.b	a0,a0
    80000c78:	2c8000ef          	jal	80000f40 <uart_putc>
    80000c7c:	0334f53b          	remuw	a0,s1,s3
    80000c80:	0305051b          	addw	a0,a0,48
    80000c84:	07f57513          	and	a0,a0,127
    80000c88:	2b8000ef          	jal	80000f40 <uart_putc>
    80000c8c:	e3dff06f          	j	80000ac8 <printf_color+0x6c>
    80000c90:	00002517          	auipc	a0,0x2
    80000c94:	e7050513          	add	a0,a0,-400 # 80002b00 <long_string+0x1c8>
    80000c98:	2c0000ef          	jal	80000f58 <uart_puts>
    80000c9c:	ea5ff06f          	j	80000b40 <printf_color+0xe4>
    80000ca0:	fff00a93          	li	s5,-1
    80000ca4:	eb5ff06f          	j	80000b58 <printf_color+0xfc>

0000000080000ca8 <printf>:
    80000ca8:	f7010113          	add	sp,sp,-144
    80000cac:	04113423          	sd	ra,72(sp)
    80000cb0:	04813023          	sd	s0,64(sp)
    80000cb4:	02913c23          	sd	s1,56(sp)
    80000cb8:	03213823          	sd	s2,48(sp)
    80000cbc:	03313423          	sd	s3,40(sp)
    80000cc0:	03413023          	sd	s4,32(sp)
    80000cc4:	01513c23          	sd	s5,24(sp)
    80000cc8:	04b13c23          	sd	a1,88(sp)
    80000ccc:	06c13023          	sd	a2,96(sp)
    80000cd0:	06d13423          	sd	a3,104(sp)
    80000cd4:	06e13823          	sd	a4,112(sp)
    80000cd8:	06f13c23          	sd	a5,120(sp)
    80000cdc:	09013023          	sd	a6,128(sp)
    80000ce0:	09113423          	sd	a7,136(sp)
    80000ce4:	16050063          	beqz	a0,80000e44 <printf+0x19c>
    80000ce8:	00050413          	mv	s0,a0
    80000cec:	00054503          	lbu	a0,0(a0)
    80000cf0:	05810793          	add	a5,sp,88
    80000cf4:	00f13423          	sd	a5,8(sp)
    80000cf8:	00000a93          	li	s5,0
    80000cfc:	06050463          	beqz	a0,80000d64 <printf+0xbc>
    80000d00:	02500913          	li	s2,37
    80000d04:	02000a13          	li	s4,32
    80000d08:	00002997          	auipc	s3,0x2
    80000d0c:	fb498993          	add	s3,s3,-76 # 80002cbc <long_string+0x384>
    80000d10:	00140493          	add	s1,s0,1
    80000d14:	0f251e63          	bne	a0,s2,80000e10 <printf+0x168>
    80000d18:	00144783          	lbu	a5,1(s0)
    80000d1c:	10078663          	beqz	a5,80000e28 <printf+0x180>
    80000d20:	0f278e63          	beq	a5,s2,80000e1c <printf+0x174>
    80000d24:	fa87879b          	addw	a5,a5,-88
    80000d28:	0ff7f793          	zext.b	a5,a5
    80000d2c:	00fa6c63          	bltu	s4,a5,80000d44 <printf+0x9c>
    80000d30:	00279793          	sll	a5,a5,0x2
    80000d34:	013787b3          	add	a5,a5,s3
    80000d38:	0007a783          	lw	a5,0(a5)
    80000d3c:	013787b3          	add	a5,a5,s3
    80000d40:	00078067          	jr	a5
    80000d44:	02500513          	li	a0,37
    80000d48:	1f8000ef          	jal	80000f40 <uart_putc>
    80000d4c:	00144503          	lbu	a0,1(s0)
    80000d50:	ffe00a93          	li	s5,-2
    80000d54:	1ec000ef          	jal	80000f40 <uart_putc>
    80000d58:	0014c503          	lbu	a0,1(s1)
    80000d5c:	00148413          	add	s0,s1,1
    80000d60:	fa0518e3          	bnez	a0,80000d10 <printf+0x68>
    80000d64:	04813083          	ld	ra,72(sp)
    80000d68:	04013403          	ld	s0,64(sp)
    80000d6c:	03813483          	ld	s1,56(sp)
    80000d70:	03013903          	ld	s2,48(sp)
    80000d74:	02813983          	ld	s3,40(sp)
    80000d78:	02013a03          	ld	s4,32(sp)
    80000d7c:	000a8513          	mv	a0,s5
    80000d80:	01813a83          	ld	s5,24(sp)
    80000d84:	09010113          	add	sp,sp,144
    80000d88:	00008067          	ret
    80000d8c:	00813783          	ld	a5,8(sp)
    80000d90:	00000613          	li	a2,0
    80000d94:	01000593          	li	a1,16
    80000d98:	0007a503          	lw	a0,0(a5)
    80000d9c:	00878793          	add	a5,a5,8
    80000da0:	00f13423          	sd	a5,8(sp)
    80000da4:	a41ff0ef          	jal	800007e4 <print_number>
    80000da8:	fb1ff06f          	j	80000d58 <printf+0xb0>
    80000dac:	00813783          	ld	a5,8(sp)
    80000db0:	0007c503          	lbu	a0,0(a5)
    80000db4:	00878793          	add	a5,a5,8
    80000db8:	00f13423          	sd	a5,8(sp)
    80000dbc:	184000ef          	jal	80000f40 <uart_putc>
    80000dc0:	f99ff06f          	j	80000d58 <printf+0xb0>
    80000dc4:	00813783          	ld	a5,8(sp)
    80000dc8:	0007b403          	ld	s0,0(a5)
    80000dcc:	00878793          	add	a5,a5,8
    80000dd0:	00f13423          	sd	a5,8(sp)
    80000dd4:	00041863          	bnez	s0,80000de4 <printf+0x13c>
    80000dd8:	05c0006f          	j	80000e34 <printf+0x18c>
    80000ddc:	00140413          	add	s0,s0,1
    80000de0:	160000ef          	jal	80000f40 <uart_putc>
    80000de4:	00044503          	lbu	a0,0(s0)
    80000de8:	fe051ae3          	bnez	a0,80000ddc <printf+0x134>
    80000dec:	f6dff06f          	j	80000d58 <printf+0xb0>
    80000df0:	00813783          	ld	a5,8(sp)
    80000df4:	00100613          	li	a2,1
    80000df8:	00a00593          	li	a1,10
    80000dfc:	0007a503          	lw	a0,0(a5)
    80000e00:	00878793          	add	a5,a5,8
    80000e04:	00f13423          	sd	a5,8(sp)
    80000e08:	9ddff0ef          	jal	800007e4 <print_number>
    80000e0c:	f4dff06f          	j	80000d58 <printf+0xb0>
    80000e10:	130000ef          	jal	80000f40 <uart_putc>
    80000e14:	00040493          	mv	s1,s0
    80000e18:	f41ff06f          	j	80000d58 <printf+0xb0>
    80000e1c:	02500513          	li	a0,37
    80000e20:	120000ef          	jal	80000f40 <uart_putc>
    80000e24:	f35ff06f          	j	80000d58 <printf+0xb0>
    80000e28:	02500513          	li	a0,37
    80000e2c:	114000ef          	jal	80000f40 <uart_putc>
    80000e30:	f35ff06f          	j	80000d64 <printf+0xbc>
    80000e34:	00002517          	auipc	a0,0x2
    80000e38:	ccc50513          	add	a0,a0,-820 # 80002b00 <long_string+0x1c8>
    80000e3c:	11c000ef          	jal	80000f58 <uart_puts>
    80000e40:	f19ff06f          	j	80000d58 <printf+0xb0>
    80000e44:	fff00a93          	li	s5,-1
    80000e48:	f1dff06f          	j	80000d64 <printf+0xbc>

0000000080000e4c <test_printf_basic>:
    80000e4c:	ff010113          	add	sp,sp,-16
    80000e50:	02a00593          	li	a1,42
    80000e54:	00002517          	auipc	a0,0x2
    80000e58:	cbc50513          	add	a0,a0,-836 # 80002b10 <long_string+0x1d8>
    80000e5c:	00113423          	sd	ra,8(sp)
    80000e60:	e49ff0ef          	jal	80000ca8 <printf>
    80000e64:	f8500593          	li	a1,-123
    80000e68:	00002517          	auipc	a0,0x2
    80000e6c:	cc050513          	add	a0,a0,-832 # 80002b28 <long_string+0x1f0>
    80000e70:	e39ff0ef          	jal	80000ca8 <printf>
    80000e74:	00000593          	li	a1,0
    80000e78:	00002517          	auipc	a0,0x2
    80000e7c:	cc850513          	add	a0,a0,-824 # 80002b40 <long_string+0x208>
    80000e80:	e29ff0ef          	jal	80000ca8 <printf>
    80000e84:	000015b7          	lui	a1,0x1
    80000e88:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    80000e8c:	00002517          	auipc	a0,0x2
    80000e90:	ccc50513          	add	a0,a0,-820 # 80002b58 <long_string+0x220>
    80000e94:	e15ff0ef          	jal	80000ca8 <printf>
    80000e98:	00002597          	auipc	a1,0x2
    80000e9c:	cd858593          	add	a1,a1,-808 # 80002b70 <long_string+0x238>
    80000ea0:	00002517          	auipc	a0,0x2
    80000ea4:	cd850513          	add	a0,a0,-808 # 80002b78 <long_string+0x240>
    80000ea8:	e01ff0ef          	jal	80000ca8 <printf>
    80000eac:	05800593          	li	a1,88
    80000eb0:	00002517          	auipc	a0,0x2
    80000eb4:	ce050513          	add	a0,a0,-800 # 80002b90 <long_string+0x258>
    80000eb8:	df1ff0ef          	jal	80000ca8 <printf>
    80000ebc:	00813083          	ld	ra,8(sp)
    80000ec0:	00002517          	auipc	a0,0x2
    80000ec4:	ce850513          	add	a0,a0,-792 # 80002ba8 <long_string+0x270>
    80000ec8:	01010113          	add	sp,sp,16
    80000ecc:	dddff06f          	j	80000ca8 <printf>

0000000080000ed0 <test_printf_edge_cases>:
    80000ed0:	800005b7          	lui	a1,0x80000
    80000ed4:	ff010113          	add	sp,sp,-16
    80000ed8:	fff5c593          	not	a1,a1
    80000edc:	00002517          	auipc	a0,0x2
    80000ee0:	ce450513          	add	a0,a0,-796 # 80002bc0 <long_string+0x288>
    80000ee4:	00113423          	sd	ra,8(sp)
    80000ee8:	dc1ff0ef          	jal	80000ca8 <printf>
    80000eec:	800005b7          	lui	a1,0x80000
    80000ef0:	00002517          	auipc	a0,0x2
    80000ef4:	ce050513          	add	a0,a0,-800 # 80002bd0 <long_string+0x298>
    80000ef8:	db1ff0ef          	jal	80000ca8 <printf>
    80000efc:	00000593          	li	a1,0
    80000f00:	00002517          	auipc	a0,0x2
    80000f04:	ce050513          	add	a0,a0,-800 # 80002be0 <long_string+0x2a8>
    80000f08:	da1ff0ef          	jal	80000ca8 <printf>
    80000f0c:	00001597          	auipc	a1,0x1
    80000f10:	22c58593          	add	a1,a1,556 # 80002138 <rodata_start+0x138>
    80000f14:	00002517          	auipc	a0,0x2
    80000f18:	ce450513          	add	a0,a0,-796 # 80002bf8 <long_string+0x2c0>
    80000f1c:	d8dff0ef          	jal	80000ca8 <printf>
    80000f20:	00002517          	auipc	a0,0x2
    80000f24:	cf050513          	add	a0,a0,-784 # 80002c10 <long_string+0x2d8>
    80000f28:	d81ff0ef          	jal	80000ca8 <printf>
    80000f2c:	00813083          	ld	ra,8(sp)
    80000f30:	00002517          	auipc	a0,0x2
    80000f34:	cf050513          	add	a0,a0,-784 # 80002c20 <long_string+0x2e8>
    80000f38:	01010113          	add	sp,sp,16
    80000f3c:	d6dff06f          	j	80000ca8 <printf>

0000000080000f40 <uart_putc>:
    80000f40:	10000737          	lui	a4,0x10000
    80000f44:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80000f48:	0207f793          	and	a5,a5,32
    80000f4c:	fe078ce3          	beqz	a5,80000f44 <uart_putc+0x4>
    80000f50:	00a70023          	sb	a0,0(a4)
    80000f54:	00008067          	ret

0000000080000f58 <uart_puts>:
    80000f58:	00054683          	lbu	a3,0(a0)
    80000f5c:	02068263          	beqz	a3,80000f80 <uart_puts+0x28>
    80000f60:	10000737          	lui	a4,0x10000
    80000f64:	00150513          	add	a0,a0,1
    80000f68:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80000f6c:	0207f793          	and	a5,a5,32
    80000f70:	fe078ce3          	beqz	a5,80000f68 <uart_puts+0x10>
    80000f74:	00d70023          	sb	a3,0(a4)
    80000f78:	00054683          	lbu	a3,0(a0)
    80000f7c:	fe0694e3          	bnez	a3,80000f64 <uart_puts+0xc>
    80000f80:	00008067          	ret

0000000080000f84 <pmm_init>:
    80000f84:	000017b7          	lui	a5,0x1
    80000f88:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80000f8c:	00f50533          	add	a0,a0,a5
    80000f90:	fffff737          	lui	a4,0xfffff
    80000f94:	00e57533          	and	a0,a0,a4
    80000f98:	00e5f5b3          	and	a1,a1,a4
    80000f9c:	00010797          	auipc	a5,0x10
    80000fa0:	06a7b623          	sd	a0,108(a5) # 80011008 <mem_start>
    80000fa4:	00010797          	auipc	a5,0x10
    80000fa8:	04b7be23          	sd	a1,92(a5) # 80011000 <mem_end>
    80000fac:	00010797          	auipc	a5,0x10
    80000fb0:	0607b223          	sd	zero,100(a5) # 80011010 <freelist>
    80000fb4:	02b57e63          	bgeu	a0,a1,80000ff0 <pmm_init+0x6c>
    80000fb8:	02050e63          	beqz	a0,80000ff4 <pmm_init+0x70>
    80000fbc:	00050793          	mv	a5,a0
    80000fc0:	00000613          	li	a2,0
    80000fc4:	00000693          	li	a3,0
    80000fc8:	00a7e863          	bltu	a5,a0,80000fd8 <pmm_init+0x54>
    80000fcc:	00d7b023          	sd	a3,0(a5)
    80000fd0:	00100613          	li	a2,1
    80000fd4:	00078693          	mv	a3,a5
    80000fd8:	00001737          	lui	a4,0x1
    80000fdc:	00e787b3          	add	a5,a5,a4
    80000fe0:	feb7e4e3          	bltu	a5,a1,80000fc8 <pmm_init+0x44>
    80000fe4:	00060663          	beqz	a2,80000ff0 <pmm_init+0x6c>
    80000fe8:	00010797          	auipc	a5,0x10
    80000fec:	02d7b423          	sd	a3,40(a5) # 80011010 <freelist>
    80000ff0:	00008067          	ret
    80000ff4:	00000793          	li	a5,0
    80000ff8:	00000613          	li	a2,0
    80000ffc:	00000693          	li	a3,0
    80001000:	fd9ff06f          	j	80000fd8 <pmm_init+0x54>

0000000080001004 <alloc_page>:
    80001004:	00010797          	auipc	a5,0x10
    80001008:	00c78793          	add	a5,a5,12 # 80011010 <freelist>
    8000100c:	0007b503          	ld	a0,0(a5)
    80001010:	00050663          	beqz	a0,8000101c <alloc_page+0x18>
    80001014:	00053703          	ld	a4,0(a0)
    80001018:	00e7b023          	sd	a4,0(a5)
    8000101c:	00008067          	ret

0000000080001020 <free_page>:
    80001020:	02050c63          	beqz	a0,80001058 <free_page+0x38>
    80001024:	00010797          	auipc	a5,0x10
    80001028:	fe47b783          	ld	a5,-28(a5) # 80011008 <mem_start>
    8000102c:	02f56663          	bltu	a0,a5,80001058 <free_page+0x38>
    80001030:	00010797          	auipc	a5,0x10
    80001034:	fd07b783          	ld	a5,-48(a5) # 80011000 <mem_end>
    80001038:	02f57063          	bgeu	a0,a5,80001058 <free_page+0x38>
    8000103c:	03451793          	sll	a5,a0,0x34
    80001040:	00079c63          	bnez	a5,80001058 <free_page+0x38>
    80001044:	00010797          	auipc	a5,0x10
    80001048:	fcc78793          	add	a5,a5,-52 # 80011010 <freelist>
    8000104c:	0007b703          	ld	a4,0(a5)
    80001050:	00a7b023          	sd	a0,0(a5)
    80001054:	00e53023          	sd	a4,0(a0)
    80001058:	00008067          	ret

000000008000105c <alloc_pages>:
    8000105c:	02a05063          	blez	a0,8000107c <alloc_pages+0x20>
    80001060:	00010717          	auipc	a4,0x10
    80001064:	fb070713          	add	a4,a4,-80 # 80011010 <freelist>
    80001068:	00073503          	ld	a0,0(a4)
    8000106c:	00050a63          	beqz	a0,80001080 <alloc_pages+0x24>
    80001070:	00053783          	ld	a5,0(a0)
    80001074:	00f73023          	sd	a5,0(a4)
    80001078:	00008067          	ret
    8000107c:	00000513          	li	a0,0
    80001080:	00008067          	ret

0000000080001084 <create_pagetable>:
    80001084:	ff010113          	add	sp,sp,-16
    80001088:	00113423          	sd	ra,8(sp)
    8000108c:	f79ff0ef          	jal	80001004 <alloc_page>
    80001090:	00050e63          	beqz	a0,800010ac <create_pagetable+0x28>
    80001094:	00001737          	lui	a4,0x1
    80001098:	00050793          	mv	a5,a0
    8000109c:	00e50733          	add	a4,a0,a4
    800010a0:	0007b023          	sd	zero,0(a5)
    800010a4:	00878793          	add	a5,a5,8
    800010a8:	fee79ce3          	bne	a5,a4,800010a0 <create_pagetable+0x1c>
    800010ac:	00813083          	ld	ra,8(sp)
    800010b0:	01010113          	add	sp,sp,16
    800010b4:	00008067          	ret

00000000800010b8 <map_page>:
    800010b8:	00c5e7b3          	or	a5,a1,a2
    800010bc:	03479713          	sll	a4,a5,0x34
    800010c0:	10071e63          	bnez	a4,800011dc <map_page+0x124>
    800010c4:	fc010113          	add	sp,sp,-64
    800010c8:	02913423          	sd	s1,40(sp)
    800010cc:	03213023          	sd	s2,32(sp)
    800010d0:	01313c23          	sd	s3,24(sp)
    800010d4:	01413823          	sd	s4,16(sp)
    800010d8:	01513423          	sd	s5,8(sp)
    800010dc:	02113c23          	sd	ra,56(sp)
    800010e0:	02813823          	sd	s0,48(sp)
    800010e4:	00058913          	mv	s2,a1
    800010e8:	00060493          	mv	s1,a2
    800010ec:	00068993          	mv	s3,a3
    800010f0:	00200a13          	li	s4,2
    800010f4:	00200793          	li	a5,2
    800010f8:	00100a93          	li	s5,1
    800010fc:	0037941b          	sllw	s0,a5,0x3
    80001100:	00f4043b          	addw	s0,s0,a5
    80001104:	00c4041b          	addw	s0,s0,12
    80001108:	00895433          	srl	s0,s2,s0
    8000110c:	1ff47413          	and	s0,s0,511
    80001110:	00341413          	sll	s0,s0,0x3
    80001114:	00850433          	add	s0,a0,s0
    80001118:	00043783          	ld	a5,0(s0)
    8000111c:	0017f713          	and	a4,a5,1
    80001120:	08070063          	beqz	a4,800011a0 <map_page+0xe8>
    80001124:	00e7f713          	and	a4,a5,14
    80001128:	0a071663          	bnez	a4,800011d4 <map_page+0x11c>
    8000112c:	00a7d513          	srl	a0,a5,0xa
    80001130:	00c51513          	sll	a0,a0,0xc
    80001134:	00100793          	li	a5,1
    80001138:	015a0663          	beq	s4,s5,80001144 <map_page+0x8c>
    8000113c:	00100a13          	li	s4,1
    80001140:	fbdff06f          	j	800010fc <map_page+0x44>
    80001144:	00c95793          	srl	a5,s2,0xc
    80001148:	1ff7f793          	and	a5,a5,511
    8000114c:	00379793          	sll	a5,a5,0x3
    80001150:	00f50533          	add	a0,a0,a5
    80001154:	08050063          	beqz	a0,800011d4 <map_page+0x11c>
    80001158:	00053783          	ld	a5,0(a0)
    8000115c:	0017f793          	and	a5,a5,1
    80001160:	06079a63          	bnez	a5,800011d4 <map_page+0x11c>
    80001164:	00c4d493          	srl	s1,s1,0xc
    80001168:	00a49493          	sll	s1,s1,0xa
    8000116c:	0134e6b3          	or	a3,s1,s3
    80001170:	0016e693          	or	a3,a3,1
    80001174:	00d53023          	sd	a3,0(a0)
    80001178:	00000513          	li	a0,0
    8000117c:	03813083          	ld	ra,56(sp)
    80001180:	03013403          	ld	s0,48(sp)
    80001184:	02813483          	ld	s1,40(sp)
    80001188:	02013903          	ld	s2,32(sp)
    8000118c:	01813983          	ld	s3,24(sp)
    80001190:	01013a03          	ld	s4,16(sp)
    80001194:	00813a83          	ld	s5,8(sp)
    80001198:	04010113          	add	sp,sp,64
    8000119c:	00008067          	ret
    800011a0:	e65ff0ef          	jal	80001004 <alloc_page>
    800011a4:	02050863          	beqz	a0,800011d4 <map_page+0x11c>
    800011a8:	00001737          	lui	a4,0x1
    800011ac:	00e50733          	add	a4,a0,a4
    800011b0:	00050793          	mv	a5,a0
    800011b4:	0007b023          	sd	zero,0(a5)
    800011b8:	00878793          	add	a5,a5,8
    800011bc:	fef71ce3          	bne	a4,a5,800011b4 <map_page+0xfc>
    800011c0:	00c55793          	srl	a5,a0,0xc
    800011c4:	00a79793          	sll	a5,a5,0xa
    800011c8:	0017e793          	or	a5,a5,1
    800011cc:	00f43023          	sd	a5,0(s0)
    800011d0:	f65ff06f          	j	80001134 <map_page+0x7c>
    800011d4:	fff00513          	li	a0,-1
    800011d8:	fa5ff06f          	j	8000117c <map_page+0xc4>
    800011dc:	fff00513          	li	a0,-1
    800011e0:	00008067          	ret

00000000800011e4 <map_region>:
    800011e4:	000017b7          	lui	a5,0x1
    800011e8:	fc010113          	add	sp,sp,-64
    800011ec:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800011f0:	02913423          	sd	s1,40(sp)
    800011f4:	00f684b3          	add	s1,a3,a5
    800011f8:	00b484b3          	add	s1,s1,a1
    800011fc:	fffff7b7          	lui	a5,0xfffff
    80001200:	02113c23          	sd	ra,56(sp)
    80001204:	02813823          	sd	s0,48(sp)
    80001208:	03213023          	sd	s2,32(sp)
    8000120c:	01313c23          	sd	s3,24(sp)
    80001210:	01413823          	sd	s4,16(sp)
    80001214:	01513423          	sd	s5,8(sp)
    80001218:	00f4f4b3          	and	s1,s1,a5
    8000121c:	0495f263          	bgeu	a1,s1,80001260 <map_region+0x7c>
    80001220:	00058413          	mv	s0,a1
    80001224:	00050993          	mv	s3,a0
    80001228:	00070a13          	mv	s4,a4
    8000122c:	40b60933          	sub	s2,a2,a1
    80001230:	00001ab7          	lui	s5,0x1
    80001234:	0080006f          	j	8000123c <map_region+0x58>
    80001238:	02947463          	bgeu	s0,s1,80001260 <map_region+0x7c>
    8000123c:	00890633          	add	a2,s2,s0
    80001240:	00040593          	mv	a1,s0
    80001244:	000a0693          	mv	a3,s4
    80001248:	00098513          	mv	a0,s3
    8000124c:	e6dff0ef          	jal	800010b8 <map_page>
    80001250:	01540433          	add	s0,s0,s5
    80001254:	fe0502e3          	beqz	a0,80001238 <map_region+0x54>
    80001258:	fff00513          	li	a0,-1
    8000125c:	0080006f          	j	80001264 <map_region+0x80>
    80001260:	00000513          	li	a0,0
    80001264:	03813083          	ld	ra,56(sp)
    80001268:	03013403          	ld	s0,48(sp)
    8000126c:	02813483          	ld	s1,40(sp)
    80001270:	02013903          	ld	s2,32(sp)
    80001274:	01813983          	ld	s3,24(sp)
    80001278:	01013a03          	ld	s4,16(sp)
    8000127c:	00813a83          	ld	s5,8(sp)
    80001280:	04010113          	add	sp,sp,64
    80001284:	00008067          	ret

0000000080001288 <destroy_pagetable>:
    80001288:	f0010113          	add	sp,sp,-256
    8000128c:	000017b7          	lui	a5,0x1
    80001290:	0e813823          	sd	s0,240(sp)
    80001294:	0f213023          	sd	s2,224(sp)
    80001298:	0d613023          	sd	s6,192(sp)
    8000129c:	0b713c23          	sd	s7,184(sp)
    800012a0:	0e113c23          	sd	ra,248(sp)
    800012a4:	0e913423          	sd	s1,232(sp)
    800012a8:	0d313c23          	sd	s3,216(sp)
    800012ac:	0d413823          	sd	s4,208(sp)
    800012b0:	0d513423          	sd	s5,200(sp)
    800012b4:	0b813823          	sd	s8,176(sp)
    800012b8:	0b913423          	sd	s9,168(sp)
    800012bc:	0ba13023          	sd	s10,160(sp)
    800012c0:	09b13c23          	sd	s11,152(sp)
    800012c4:	00050413          	mv	s0,a0
    800012c8:	00050913          	mv	s2,a0
    800012cc:	00f50b33          	add	s6,a0,a5
    800012d0:	00001bb7          	lui	s7,0x1
    800012d4:	00c0006f          	j	800012e0 <destroy_pagetable+0x58>
    800012d8:	00890913          	add	s2,s2,8
    800012dc:	2d690063          	beq	s2,s6,8000159c <destroy_pagetable+0x314>
    800012e0:	00093783          	ld	a5,0(s2)
    800012e4:	00100713          	li	a4,1
    800012e8:	00f7f693          	and	a3,a5,15
    800012ec:	fee696e3          	bne	a3,a4,800012d8 <destroy_pagetable+0x50>
    800012f0:	00a7d793          	srl	a5,a5,0xa
    800012f4:	00c79a13          	sll	s4,a5,0xc
    800012f8:	017a0cb3          	add	s9,s4,s7
    800012fc:	00100d93          	li	s11,1
    80001300:	000a0a93          	mv	s5,s4
    80001304:	00040493          	mv	s1,s0
    80001308:	00c0006f          	j	80001314 <destroy_pagetable+0x8c>
    8000130c:	008a0a13          	add	s4,s4,8
    80001310:	279a0c63          	beq	s4,s9,80001588 <destroy_pagetable+0x300>
    80001314:	000a3783          	ld	a5,0(s4)
    80001318:	00f7f713          	and	a4,a5,15
    8000131c:	ffb718e3          	bne	a4,s11,8000130c <destroy_pagetable+0x84>
    80001320:	00a7d793          	srl	a5,a5,0xa
    80001324:	00c79993          	sll	s3,a5,0xc
    80001328:	00098c13          	mv	s8,s3
    8000132c:	01798d33          	add	s10,s3,s7
    80001330:	00098413          	mv	s0,s3
    80001334:	00c0006f          	j	80001340 <destroy_pagetable+0xb8>
    80001338:	00840413          	add	s0,s0,8
    8000133c:	23a40e63          	beq	s0,s10,80001578 <destroy_pagetable+0x2f0>
    80001340:	00043783          	ld	a5,0(s0)
    80001344:	00f7f713          	and	a4,a5,15
    80001348:	ffb718e3          	bne	a4,s11,80001338 <destroy_pagetable+0xb0>
    8000134c:	00a7d793          	srl	a5,a5,0xa
    80001350:	00c79793          	sll	a5,a5,0xc
    80001354:	00048713          	mv	a4,s1
    80001358:	03513c23          	sd	s5,56(sp)
    8000135c:	00090493          	mv	s1,s2
    80001360:	017789b3          	add	s3,a5,s7
    80001364:	02813823          	sd	s0,48(sp)
    80001368:	00078a93          	mv	s5,a5
    8000136c:	00070913          	mv	s2,a4
    80001370:	00c0006f          	j	8000137c <destroy_pagetable+0xf4>
    80001374:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80001378:	1cf98e63          	beq	s3,a5,80001554 <destroy_pagetable+0x2cc>
    8000137c:	0007b703          	ld	a4,0(a5)
    80001380:	00f77693          	and	a3,a4,15
    80001384:	ffb698e3          	bne	a3,s11,80001374 <destroy_pagetable+0xec>
    80001388:	00a75713          	srl	a4,a4,0xa
    8000138c:	00c71713          	sll	a4,a4,0xc
    80001390:	017706b3          	add	a3,a4,s7
    80001394:	05313423          	sd	s3,72(sp)
    80001398:	00d13423          	sd	a3,8(sp)
    8000139c:	05813023          	sd	s8,64(sp)
    800013a0:	00070993          	mv	s3,a4
    800013a4:	04f13823          	sd	a5,80(sp)
    800013a8:	0100006f          	j	800013b8 <destroy_pagetable+0x130>
    800013ac:	00813783          	ld	a5,8(sp)
    800013b0:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    800013b4:	16e78e63          	beq	a5,a4,80001530 <destroy_pagetable+0x2a8>
    800013b8:	00073783          	ld	a5,0(a4)
    800013bc:	00f7f693          	and	a3,a5,15
    800013c0:	ffb696e3          	bne	a3,s11,800013ac <destroy_pagetable+0x124>
    800013c4:	00a7d793          	srl	a5,a5,0xa
    800013c8:	00c79793          	sll	a5,a5,0xc
    800013cc:	017786b3          	add	a3,a5,s7
    800013d0:	000a8c13          	mv	s8,s5
    800013d4:	00d13c23          	sd	a3,24(sp)
    800013d8:	00078a93          	mv	s5,a5
    800013dc:	04e13c23          	sd	a4,88(sp)
    800013e0:	07213023          	sd	s2,96(sp)
    800013e4:	0100006f          	j	800013f4 <destroy_pagetable+0x16c>
    800013e8:	01813703          	ld	a4,24(sp)
    800013ec:	00878793          	add	a5,a5,8
    800013f0:	10f70c63          	beq	a4,a5,80001508 <destroy_pagetable+0x280>
    800013f4:	0007b703          	ld	a4,0(a5)
    800013f8:	00f77693          	and	a3,a4,15
    800013fc:	ffb696e3          	bne	a3,s11,800013e8 <destroy_pagetable+0x160>
    80001400:	00a75713          	srl	a4,a4,0xa
    80001404:	00c71913          	sll	s2,a4,0xc
    80001408:	01790733          	add	a4,s2,s7
    8000140c:	07213423          	sd	s2,104(sp)
    80001410:	00090413          	mv	s0,s2
    80001414:	02e13023          	sd	a4,32(sp)
    80001418:	06f13823          	sd	a5,112(sp)
    8000141c:	00048913          	mv	s2,s1
    80001420:	0100006f          	j	80001430 <destroy_pagetable+0x1a8>
    80001424:	02013783          	ld	a5,32(sp)
    80001428:	00840413          	add	s0,s0,8
    8000142c:	0a878c63          	beq	a5,s0,800014e4 <destroy_pagetable+0x25c>
    80001430:	00043783          	ld	a5,0(s0)
    80001434:	00f7f693          	and	a3,a5,15
    80001438:	ffb696e3          	bne	a3,s11,80001424 <destroy_pagetable+0x19c>
    8000143c:	00a7d793          	srl	a5,a5,0xa
    80001440:	00c79493          	sll	s1,a5,0xc
    80001444:	017487b3          	add	a5,s1,s7
    80001448:	00913823          	sd	s1,16(sp)
    8000144c:	02f13423          	sd	a5,40(sp)
    80001450:	06813c23          	sd	s0,120(sp)
    80001454:	0100006f          	j	80001464 <destroy_pagetable+0x1dc>
    80001458:	02813783          	ld	a5,40(sp)
    8000145c:	00848493          	add	s1,s1,8
    80001460:	06978663          	beq	a5,s1,800014cc <destroy_pagetable+0x244>
    80001464:	0004b783          	ld	a5,0(s1)
    80001468:	00f7f693          	and	a3,a5,15
    8000146c:	ffb696e3          	bne	a3,s11,80001458 <destroy_pagetable+0x1d0>
    80001470:	00a7d793          	srl	a5,a5,0xa
    80001474:	00c79413          	sll	s0,a5,0xc
    80001478:	017406b3          	add	a3,s0,s7
    8000147c:	09213023          	sd	s2,128(sp)
    80001480:	09613423          	sd	s6,136(sp)
    80001484:	00040913          	mv	s2,s0
    80001488:	000a0b13          	mv	s6,s4
    8000148c:	00048a13          	mv	s4,s1
    80001490:	00068493          	mv	s1,a3
    80001494:	00043783          	ld	a5,0(s0)
    80001498:	00840413          	add	s0,s0,8
    8000149c:	00f7f713          	and	a4,a5,15
    800014a0:	13b70e63          	beq	a4,s11,800015dc <destroy_pagetable+0x354>
    800014a4:	fe8498e3          	bne	s1,s0,80001494 <destroy_pagetable+0x20c>
    800014a8:	00090513          	mv	a0,s2
    800014ac:	000a0493          	mv	s1,s4
    800014b0:	08013903          	ld	s2,128(sp)
    800014b4:	000b0a13          	mv	s4,s6
    800014b8:	08813b03          	ld	s6,136(sp)
    800014bc:	b65ff0ef          	jal	80001020 <free_page>
    800014c0:	02813783          	ld	a5,40(sp)
    800014c4:	00848493          	add	s1,s1,8
    800014c8:	f8979ee3          	bne	a5,s1,80001464 <destroy_pagetable+0x1dc>
    800014cc:	01013503          	ld	a0,16(sp)
    800014d0:	07813403          	ld	s0,120(sp)
    800014d4:	b4dff0ef          	jal	80001020 <free_page>
    800014d8:	02013783          	ld	a5,32(sp)
    800014dc:	00840413          	add	s0,s0,8
    800014e0:	f48798e3          	bne	a5,s0,80001430 <destroy_pagetable+0x1a8>
    800014e4:	07013783          	ld	a5,112(sp)
    800014e8:	06813503          	ld	a0,104(sp)
    800014ec:	00090493          	mv	s1,s2
    800014f0:	00f13823          	sd	a5,16(sp)
    800014f4:	b2dff0ef          	jal	80001020 <free_page>
    800014f8:	01013783          	ld	a5,16(sp)
    800014fc:	01813703          	ld	a4,24(sp)
    80001500:	00878793          	add	a5,a5,8
    80001504:	eef718e3          	bne	a4,a5,800013f4 <destroy_pagetable+0x16c>
    80001508:	05813703          	ld	a4,88(sp)
    8000150c:	000a8513          	mv	a0,s5
    80001510:	06013903          	ld	s2,96(sp)
    80001514:	00e13823          	sd	a4,16(sp)
    80001518:	b09ff0ef          	jal	80001020 <free_page>
    8000151c:	01013703          	ld	a4,16(sp)
    80001520:	00813783          	ld	a5,8(sp)
    80001524:	000c0a93          	mv	s5,s8
    80001528:	00870713          	add	a4,a4,8
    8000152c:	e8e796e3          	bne	a5,a4,800013b8 <destroy_pagetable+0x130>
    80001530:	05013783          	ld	a5,80(sp)
    80001534:	00098513          	mv	a0,s3
    80001538:	04013c03          	ld	s8,64(sp)
    8000153c:	00f13423          	sd	a5,8(sp)
    80001540:	04813983          	ld	s3,72(sp)
    80001544:	addff0ef          	jal	80001020 <free_page>
    80001548:	00813783          	ld	a5,8(sp)
    8000154c:	00878793          	add	a5,a5,8
    80001550:	e2f996e3          	bne	s3,a5,8000137c <destroy_pagetable+0xf4>
    80001554:	03013403          	ld	s0,48(sp)
    80001558:	00090793          	mv	a5,s2
    8000155c:	000a8513          	mv	a0,s5
    80001560:	00840413          	add	s0,s0,8
    80001564:	03813a83          	ld	s5,56(sp)
    80001568:	00048913          	mv	s2,s1
    8000156c:	00078493          	mv	s1,a5
    80001570:	ab1ff0ef          	jal	80001020 <free_page>
    80001574:	dda416e3          	bne	s0,s10,80001340 <destroy_pagetable+0xb8>
    80001578:	000c0513          	mv	a0,s8
    8000157c:	008a0a13          	add	s4,s4,8
    80001580:	aa1ff0ef          	jal	80001020 <free_page>
    80001584:	d99a18e3          	bne	s4,s9,80001314 <destroy_pagetable+0x8c>
    80001588:	000a8513          	mv	a0,s5
    8000158c:	00890913          	add	s2,s2,8
    80001590:	00048413          	mv	s0,s1
    80001594:	a8dff0ef          	jal	80001020 <free_page>
    80001598:	d56914e3          	bne	s2,s6,800012e0 <destroy_pagetable+0x58>
    8000159c:	00040513          	mv	a0,s0
    800015a0:	0f013403          	ld	s0,240(sp)
    800015a4:	0f813083          	ld	ra,248(sp)
    800015a8:	0e813483          	ld	s1,232(sp)
    800015ac:	0e013903          	ld	s2,224(sp)
    800015b0:	0d813983          	ld	s3,216(sp)
    800015b4:	0d013a03          	ld	s4,208(sp)
    800015b8:	0c813a83          	ld	s5,200(sp)
    800015bc:	0c013b03          	ld	s6,192(sp)
    800015c0:	0b813b83          	ld	s7,184(sp)
    800015c4:	0b013c03          	ld	s8,176(sp)
    800015c8:	0a813c83          	ld	s9,168(sp)
    800015cc:	0a013d03          	ld	s10,160(sp)
    800015d0:	09813d83          	ld	s11,152(sp)
    800015d4:	10010113          	add	sp,sp,256
    800015d8:	a49ff06f          	j	80001020 <free_page>
    800015dc:	00a7d793          	srl	a5,a5,0xa
    800015e0:	00c79513          	sll	a0,a5,0xc
    800015e4:	ca5ff0ef          	jal	80001288 <destroy_pagetable>
    800015e8:	ea8496e3          	bne	s1,s0,80001494 <destroy_pagetable+0x20c>
    800015ec:	ebdff06f          	j	800014a8 <destroy_pagetable+0x220>

00000000800015f0 <kvminit>:
    800015f0:	fd010113          	add	sp,sp,-48
    800015f4:	02813023          	sd	s0,32(sp)
    800015f8:	02113423          	sd	ra,40(sp)
    800015fc:	00913c23          	sd	s1,24(sp)
    80001600:	01213823          	sd	s2,16(sp)
    80001604:	01313423          	sd	s3,8(sp)
    80001608:	01413023          	sd	s4,0(sp)
    8000160c:	9f9ff0ef          	jal	80001004 <alloc_page>
    80001610:	00001737          	lui	a4,0x1
    80001614:	00e50733          	add	a4,a0,a4
    80001618:	00050413          	mv	s0,a0
    8000161c:	00050793          	mv	a5,a0
    80001620:	16050263          	beqz	a0,80001784 <kvminit+0x194>
    80001624:	0007b023          	sd	zero,0(a5)
    80001628:	00878793          	add	a5,a5,8
    8000162c:	fef71ce3          	bne	a4,a5,80001624 <kvminit+0x34>
    80001630:	00010997          	auipc	s3,0x10
    80001634:	9e898993          	add	s3,s3,-1560 # 80011018 <kernel_pagetable>
    80001638:	00001917          	auipc	s2,0x1
    8000163c:	47790913          	add	s2,s2,1143 # 80002aaf <long_string+0x177>
    80001640:	fffff7b7          	lui	a5,0xfffff
    80001644:	0089b023          	sd	s0,0(s3)
    80001648:	fffff497          	auipc	s1,0xfffff
    8000164c:	9b848493          	add	s1,s1,-1608 # 80000000 <_entry>
    80001650:	00f97933          	and	s2,s2,a5
    80001654:	0324f863          	bgeu	s1,s2,80001684 <kvminit+0x94>
    80001658:	00001a37          	lui	s4,0x1
    8000165c:	0080006f          	j	80001664 <kvminit+0x74>
    80001660:	0324f063          	bgeu	s1,s2,80001680 <kvminit+0x90>
    80001664:	00048613          	mv	a2,s1
    80001668:	00048593          	mv	a1,s1
    8000166c:	00a00693          	li	a3,10
    80001670:	00040513          	mv	a0,s0
    80001674:	a45ff0ef          	jal	800010b8 <map_page>
    80001678:	014484b3          	add	s1,s1,s4
    8000167c:	fe0502e3          	beqz	a0,80001660 <kvminit+0x70>
    80001680:	0009b403          	ld	s0,0(s3)
    80001684:	00002917          	auipc	s2,0x2
    80001688:	71790913          	add	s2,s2,1815 # 80003d9b <data_end+0xd9b>
    8000168c:	fffff7b7          	lui	a5,0xfffff
    80001690:	00001497          	auipc	s1,0x1
    80001694:	97048493          	add	s1,s1,-1680 # 80002000 <rodata_start>
    80001698:	00f97933          	and	s2,s2,a5
    8000169c:	0324f863          	bgeu	s1,s2,800016cc <kvminit+0xdc>
    800016a0:	00001a37          	lui	s4,0x1
    800016a4:	0080006f          	j	800016ac <kvminit+0xbc>
    800016a8:	0324f063          	bgeu	s1,s2,800016c8 <kvminit+0xd8>
    800016ac:	00048613          	mv	a2,s1
    800016b0:	00048593          	mv	a1,s1
    800016b4:	00200693          	li	a3,2
    800016b8:	00040513          	mv	a0,s0
    800016bc:	9fdff0ef          	jal	800010b8 <map_page>
    800016c0:	014484b3          	add	s1,s1,s4
    800016c4:	fe0502e3          	beqz	a0,800016a8 <kvminit+0xb8>
    800016c8:	0009b403          	ld	s0,0(s3)
    800016cc:	00003917          	auipc	s2,0x3
    800016d0:	93390913          	add	s2,s2,-1741 # 80003fff <data_end+0xfff>
    800016d4:	fffff7b7          	lui	a5,0xfffff
    800016d8:	00002497          	auipc	s1,0x2
    800016dc:	92848493          	add	s1,s1,-1752 # 80003000 <data_end>
    800016e0:	00f97933          	and	s2,s2,a5
    800016e4:	0324f863          	bgeu	s1,s2,80001714 <kvminit+0x124>
    800016e8:	00001a37          	lui	s4,0x1
    800016ec:	0080006f          	j	800016f4 <kvminit+0x104>
    800016f0:	0324f063          	bgeu	s1,s2,80001710 <kvminit+0x120>
    800016f4:	00048613          	mv	a2,s1
    800016f8:	00048593          	mv	a1,s1
    800016fc:	00600693          	li	a3,6
    80001700:	00040513          	mv	a0,s0
    80001704:	9b5ff0ef          	jal	800010b8 <map_page>
    80001708:	014484b3          	add	s1,s1,s4
    8000170c:	fe0502e3          	beqz	a0,800016f0 <kvminit+0x100>
    80001710:	0009b403          	ld	s0,0(s3)
    80001714:	01100913          	li	s2,17
    80001718:	0000f497          	auipc	s1,0xf
    8000171c:	8e848493          	add	s1,s1,-1816 # 80010000 <bss_start>
    80001720:	01b91913          	sll	s2,s2,0x1b
    80001724:	0324f863          	bgeu	s1,s2,80001754 <kvminit+0x164>
    80001728:	00001a37          	lui	s4,0x1
    8000172c:	0080006f          	j	80001734 <kvminit+0x144>
    80001730:	0324f063          	bgeu	s1,s2,80001750 <kvminit+0x160>
    80001734:	00048613          	mv	a2,s1
    80001738:	00048593          	mv	a1,s1
    8000173c:	00600693          	li	a3,6
    80001740:	00040513          	mv	a0,s0
    80001744:	975ff0ef          	jal	800010b8 <map_page>
    80001748:	014484b3          	add	s1,s1,s4
    8000174c:	fe0502e3          	beqz	a0,80001730 <kvminit+0x140>
    80001750:	0009b403          	ld	s0,0(s3)
    80001754:	00040513          	mv	a0,s0
    80001758:	02013403          	ld	s0,32(sp)
    8000175c:	02813083          	ld	ra,40(sp)
    80001760:	01813483          	ld	s1,24(sp)
    80001764:	01013903          	ld	s2,16(sp)
    80001768:	00813983          	ld	s3,8(sp)
    8000176c:	00013a03          	ld	s4,0(sp)
    80001770:	00600693          	li	a3,6
    80001774:	10000637          	lui	a2,0x10000
    80001778:	100005b7          	lui	a1,0x10000
    8000177c:	03010113          	add	sp,sp,48
    80001780:	939ff06f          	j	800010b8 <map_page>
    80001784:	02813083          	ld	ra,40(sp)
    80001788:	02013403          	ld	s0,32(sp)
    8000178c:	00010797          	auipc	a5,0x10
    80001790:	8807b623          	sd	zero,-1908(a5) # 80011018 <kernel_pagetable>
    80001794:	01813483          	ld	s1,24(sp)
    80001798:	01013903          	ld	s2,16(sp)
    8000179c:	00813983          	ld	s3,8(sp)
    800017a0:	00013a03          	ld	s4,0(sp)
    800017a4:	03010113          	add	sp,sp,48
    800017a8:	00008067          	ret

00000000800017ac <kvminithart>:
    800017ac:	00010797          	auipc	a5,0x10
    800017b0:	86c7b783          	ld	a5,-1940(a5) # 80011018 <kernel_pagetable>
    800017b4:	fff00713          	li	a4,-1
    800017b8:	03f71713          	sll	a4,a4,0x3f
    800017bc:	00c7d793          	srl	a5,a5,0xc
    800017c0:	00e7e7b3          	or	a5,a5,a4
    800017c4:	18079073          	csrw	satp,a5
    800017c8:	12000073          	sfence.vma
    800017cc:	00008067          	ret

00000000800017d0 <dump_pagetable>:
    800017d0:	fb010113          	add	sp,sp,-80
    800017d4:	03213823          	sd	s2,48(sp)
    800017d8:	03313423          	sd	s3,40(sp)
    800017dc:	04113423          	sd	ra,72(sp)
    800017e0:	04813023          	sd	s0,64(sp)
    800017e4:	02913c23          	sd	s1,56(sp)
    800017e8:	03413023          	sd	s4,32(sp)
    800017ec:	01513c23          	sd	s5,24(sp)
    800017f0:	01613823          	sd	s6,16(sp)
    800017f4:	01713423          	sd	s7,8(sp)
    800017f8:	00058993          	mv	s3,a1
    800017fc:	00050913          	mv	s2,a0
    80001800:	28b05263          	blez	a1,80001a84 <dump_pagetable+0x2b4>
    80001804:	00000413          	li	s0,0
    80001808:	0014041b          	addw	s0,s0,1
    8000180c:	02000513          	li	a0,32
    80001810:	f30ff0ef          	jal	80000f40 <uart_putc>
    80001814:	fe899ae3          	bne	s3,s0,80001808 <dump_pagetable+0x38>
    80001818:	00001517          	auipc	a0,0x1
    8000181c:	54050513          	add	a0,a0,1344 # 80002d58 <digits+0x18>
    80001820:	f38ff0ef          	jal	80000f58 <uart_puts>
    80001824:	00900793          	li	a5,9
    80001828:	2737d463          	bge	a5,s3,80001a90 <dump_pagetable+0x2c0>
    8000182c:	00a00413          	li	s0,10
    80001830:	0289c53b          	divw	a0,s3,s0
    80001834:	0305051b          	addw	a0,a0,48
    80001838:	0ff57513          	zext.b	a0,a0
    8000183c:	f04ff0ef          	jal	80000f40 <uart_putc>
    80001840:	0289e53b          	remw	a0,s3,s0
    80001844:	0305051b          	addw	a0,a0,48
    80001848:	0ff57513          	zext.b	a0,a0
    8000184c:	ef4ff0ef          	jal	80000f40 <uart_putc>
    80001850:	00001517          	auipc	a0,0x1
    80001854:	b5850513          	add	a0,a0,-1192 # 800023a8 <rodata_start+0x3a8>
    80001858:	fff00b13          	li	s6,-1
    8000185c:	efcff0ef          	jal	80000f58 <uart_puts>
    80001860:	00000493          	li	s1,0
    80001864:	00cb5b13          	srl	s6,s6,0xc
    80001868:	00900a13          	li	s4,9
    8000186c:	ffc00a93          	li	s5,-4
    80001870:	0140006f          	j	80001884 <dump_pagetable+0xb4>
    80001874:	0014849b          	addw	s1,s1,1
    80001878:	20000793          	li	a5,512
    8000187c:	00890913          	add	s2,s2,8
    80001880:	0cf48063          	beq	s1,a5,80001940 <dump_pagetable+0x170>
    80001884:	00093783          	ld	a5,0(s2)
    80001888:	0017f793          	and	a5,a5,1
    8000188c:	fe0784e3          	beqz	a5,80001874 <dump_pagetable+0xa4>
    80001890:	00000413          	li	s0,0
    80001894:	0009ca63          	bltz	s3,800018a8 <dump_pagetable+0xd8>
    80001898:	0014041b          	addw	s0,s0,1
    8000189c:	02000513          	li	a0,32
    800018a0:	ea0ff0ef          	jal	80000f40 <uart_putc>
    800018a4:	fe89dae3          	bge	s3,s0,80001898 <dump_pagetable+0xc8>
    800018a8:	00001517          	auipc	a0,0x1
    800018ac:	4c850513          	add	a0,a0,1224 # 80002d70 <digits+0x30>
    800018b0:	ea8ff0ef          	jal	80000f58 <uart_puts>
    800018b4:	06300793          	li	a5,99
    800018b8:	1697d263          	bge	a5,s1,80001a1c <dump_pagetable+0x24c>
    800018bc:	06400413          	li	s0,100
    800018c0:	0284c53b          	divw	a0,s1,s0
    800018c4:	00a00b93          	li	s7,10
    800018c8:	0305051b          	addw	a0,a0,48
    800018cc:	0ff57513          	zext.b	a0,a0
    800018d0:	e70ff0ef          	jal	80000f40 <uart_putc>
    800018d4:	0284e53b          	remw	a0,s1,s0
    800018d8:	0375453b          	divw	a0,a0,s7
    800018dc:	0305051b          	addw	a0,a0,48
    800018e0:	0ff57513          	zext.b	a0,a0
    800018e4:	e5cff0ef          	jal	80000f40 <uart_putc>
    800018e8:	0374e53b          	remw	a0,s1,s7
    800018ec:	0305051b          	addw	a0,a0,48
    800018f0:	0ff57513          	zext.b	a0,a0
    800018f4:	e4cff0ef          	jal	80000f40 <uart_putc>
    800018f8:	00001517          	auipc	a0,0x1
    800018fc:	48050513          	add	a0,a0,1152 # 80002d78 <digits+0x38>
    80001900:	e58ff0ef          	jal	80000f58 <uart_puts>
    80001904:	00093b83          	ld	s7,0(s2)
    80001908:	00ebf793          	and	a5,s7,14
    8000190c:	06079063          	bnez	a5,8000196c <dump_pagetable+0x19c>
    80001910:	00001517          	auipc	a0,0x1
    80001914:	48050513          	add	a0,a0,1152 # 80002d90 <digits+0x50>
    80001918:	e40ff0ef          	jal	80000f58 <uart_puts>
    8000191c:	00093503          	ld	a0,0(s2)
    80001920:	0019859b          	addw	a1,s3,1
    80001924:	0014849b          	addw	s1,s1,1
    80001928:	00a55513          	srl	a0,a0,0xa
    8000192c:	00c51513          	sll	a0,a0,0xc
    80001930:	ea1ff0ef          	jal	800017d0 <dump_pagetable>
    80001934:	20000793          	li	a5,512
    80001938:	00890913          	add	s2,s2,8
    8000193c:	f4f494e3          	bne	s1,a5,80001884 <dump_pagetable+0xb4>
    80001940:	04813083          	ld	ra,72(sp)
    80001944:	04013403          	ld	s0,64(sp)
    80001948:	03813483          	ld	s1,56(sp)
    8000194c:	03013903          	ld	s2,48(sp)
    80001950:	02813983          	ld	s3,40(sp)
    80001954:	02013a03          	ld	s4,32(sp)
    80001958:	01813a83          	ld	s5,24(sp)
    8000195c:	01013b03          	ld	s6,16(sp)
    80001960:	00813b83          	ld	s7,8(sp)
    80001964:	05010113          	add	sp,sp,80
    80001968:	00008067          	ret
    8000196c:	00001517          	auipc	a0,0x1
    80001970:	41450513          	add	a0,a0,1044 # 80002d80 <digits+0x40>
    80001974:	de4ff0ef          	jal	80000f58 <uart_puts>
    80001978:	00abdb93          	srl	s7,s7,0xa
    8000197c:	016bfbb3          	and	s7,s7,s6
    80001980:	00000713          	li	a4,0
    80001984:	03c00413          	li	s0,60
    80001988:	008bd7b3          	srl	a5,s7,s0
    8000198c:	00f7f793          	and	a5,a5,15
    80001990:	00e7e733          	or	a4,a5,a4
    80001994:	00071e63          	bnez	a4,800019b0 <dump_pagetable+0x1e0>
    80001998:	02040c63          	beqz	s0,800019d0 <dump_pagetable+0x200>
    8000199c:	ffc4041b          	addw	s0,s0,-4
    800019a0:	008bd7b3          	srl	a5,s7,s0
    800019a4:	00f7f793          	and	a5,a5,15
    800019a8:	00e7e733          	or	a4,a5,a4
    800019ac:	fe0706e3          	beqz	a4,80001998 <dump_pagetable+0x1c8>
    800019b0:	ffc4041b          	addw	s0,s0,-4
    800019b4:	03778513          	add	a0,a5,55
    800019b8:	0ff7f713          	zext.b	a4,a5
    800019bc:	04fa5c63          	bge	s4,a5,80001a14 <dump_pagetable+0x244>
    800019c0:	d80ff0ef          	jal	80000f40 <uart_putc>
    800019c4:	01540a63          	beq	s0,s5,800019d8 <dump_pagetable+0x208>
    800019c8:	00100713          	li	a4,1
    800019cc:	fbdff06f          	j	80001988 <dump_pagetable+0x1b8>
    800019d0:	03000513          	li	a0,48
    800019d4:	d6cff0ef          	jal	80000f40 <uart_putc>
    800019d8:	00001517          	auipc	a0,0x1
    800019dc:	3b050513          	add	a0,a0,944 # 80002d88 <digits+0x48>
    800019e0:	d78ff0ef          	jal	80000f58 <uart_puts>
    800019e4:	00093783          	ld	a5,0(s2)
    800019e8:	0027f713          	and	a4,a5,2
    800019ec:	08071463          	bnez	a4,80001a74 <dump_pagetable+0x2a4>
    800019f0:	0047f713          	and	a4,a5,4
    800019f4:	06071863          	bnez	a4,80001a64 <dump_pagetable+0x294>
    800019f8:	0087f713          	and	a4,a5,8
    800019fc:	04071c63          	bnez	a4,80001a54 <dump_pagetable+0x284>
    80001a00:	0107f793          	and	a5,a5,16
    80001a04:	04079263          	bnez	a5,80001a48 <dump_pagetable+0x278>
    80001a08:	00a00513          	li	a0,10
    80001a0c:	d34ff0ef          	jal	80000f40 <uart_putc>
    80001a10:	e65ff06f          	j	80001874 <dump_pagetable+0xa4>
    80001a14:	03070513          	add	a0,a4,48 # 1030 <_entry-0x7fffefd0>
    80001a18:	fa9ff06f          	j	800019c0 <dump_pagetable+0x1f0>
    80001a1c:	089a5263          	bge	s4,s1,80001aa0 <dump_pagetable+0x2d0>
    80001a20:	00a00413          	li	s0,10
    80001a24:	0284c53b          	divw	a0,s1,s0
    80001a28:	0305051b          	addw	a0,a0,48
    80001a2c:	0ff57513          	zext.b	a0,a0
    80001a30:	d10ff0ef          	jal	80000f40 <uart_putc>
    80001a34:	0284e53b          	remw	a0,s1,s0
    80001a38:	0305051b          	addw	a0,a0,48
    80001a3c:	0ff57513          	zext.b	a0,a0
    80001a40:	d00ff0ef          	jal	80000f40 <uart_putc>
    80001a44:	eb5ff06f          	j	800018f8 <dump_pagetable+0x128>
    80001a48:	05500513          	li	a0,85
    80001a4c:	cf4ff0ef          	jal	80000f40 <uart_putc>
    80001a50:	fb9ff06f          	j	80001a08 <dump_pagetable+0x238>
    80001a54:	05800513          	li	a0,88
    80001a58:	ce8ff0ef          	jal	80000f40 <uart_putc>
    80001a5c:	00093783          	ld	a5,0(s2)
    80001a60:	fa1ff06f          	j	80001a00 <dump_pagetable+0x230>
    80001a64:	05700513          	li	a0,87
    80001a68:	cd8ff0ef          	jal	80000f40 <uart_putc>
    80001a6c:	00093783          	ld	a5,0(s2)
    80001a70:	f89ff06f          	j	800019f8 <dump_pagetable+0x228>
    80001a74:	05200513          	li	a0,82
    80001a78:	cc8ff0ef          	jal	80000f40 <uart_putc>
    80001a7c:	00093783          	ld	a5,0(s2)
    80001a80:	f71ff06f          	j	800019f0 <dump_pagetable+0x220>
    80001a84:	00001517          	auipc	a0,0x1
    80001a88:	2d450513          	add	a0,a0,724 # 80002d58 <digits+0x18>
    80001a8c:	cccff0ef          	jal	80000f58 <uart_puts>
    80001a90:	0309851b          	addw	a0,s3,48
    80001a94:	0ff57513          	zext.b	a0,a0
    80001a98:	ca8ff0ef          	jal	80000f40 <uart_putc>
    80001a9c:	db5ff06f          	j	80001850 <dump_pagetable+0x80>
    80001aa0:	0304851b          	addw	a0,s1,48
    80001aa4:	0ff57513          	zext.b	a0,a0
    80001aa8:	c98ff0ef          	jal	80000f40 <uart_putc>
    80001aac:	e4dff06f          	j	800018f8 <dump_pagetable+0x128>
