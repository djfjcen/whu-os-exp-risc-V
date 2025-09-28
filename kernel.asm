
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
    80000024:	00414317          	auipc	t1,0x414
    80000028:	0a430313          	add	t1,t1,164 # 804140c8 <bss_end>

000000008000002c <bss_clear>:
    8000002c:	00628863          	beq	t0,t1,8000003c <bss_done>
    80000030:	0002b023          	sd	zero,0(t0)
    80000034:	00828293          	add	t0,t0,8
    80000038:	ff5ff06f          	j	8000002c <bss_clear>

000000008000003c <bss_done>:
    8000003c:	154010ef          	jal	80001190 <main>

0000000080000040 <loop>:
    80000040:	0000006f          	j	80000040 <loop>

0000000080000044 <test_virtual_memory>:
    80000044:	ff010113          	add	sp,sp,-16
    80000048:	00004517          	auipc	a0,0x4
    8000004c:	fb850513          	add	a0,a0,-72 # 80004000 <rodata_start>
    80000050:	00113423          	sd	ra,8(sp)
    80000054:	129010ef          	jal	8000197c <uart_puts>
    80000058:	00004517          	auipc	a0,0x4
    8000005c:	fc850513          	add	a0,a0,-56 # 80004020 <rodata_start+0x20>
    80000060:	11d010ef          	jal	8000197c <uart_puts>
    80000064:	01100593          	li	a1,17
    80000068:	40100513          	li	a0,1025
    8000006c:	01b59593          	sll	a1,a1,0x1b
    80000070:	01551513          	sll	a0,a0,0x15
    80000074:	135010ef          	jal	800019a8 <pmm_init>
    80000078:	00004517          	auipc	a0,0x4
    8000007c:	fd050513          	add	a0,a0,-48 # 80004048 <rodata_start+0x48>
    80000080:	0fd010ef          	jal	8000197c <uart_puts>
    80000084:	560020ef          	jal	800025e4 <kvminit>
    80000088:	00004517          	auipc	a0,0x4
    8000008c:	fe050513          	add	a0,a0,-32 # 80004068 <rodata_start+0x68>
    80000090:	0ed010ef          	jal	8000197c <uart_puts>
    80000094:	1c0020ef          	jal	80002254 <kvminithart>
    80000098:	00004517          	auipc	a0,0x4
    8000009c:	fe850513          	add	a0,a0,-24 # 80004080 <rodata_start+0x80>
    800000a0:	0dd010ef          	jal	8000197c <uart_puts>
    800000a4:	00813083          	ld	ra,8(sp)
    800000a8:	00004517          	auipc	a0,0x4
    800000ac:	ff850513          	add	a0,a0,-8 # 800040a0 <rodata_start+0xa0>
    800000b0:	01010113          	add	sp,sp,16
    800000b4:	0c90106f          	j	8000197c <uart_puts>

00000000800000b8 <pt_test>:
    800000b8:	fe010113          	add	sp,sp,-32
    800000bc:	00004517          	auipc	a0,0x4
    800000c0:	00450513          	add	a0,a0,4 # 800040c0 <rodata_start+0xc0>
    800000c4:	00113c23          	sd	ra,24(sp)
    800000c8:	00813823          	sd	s0,16(sp)
    800000cc:	00913423          	sd	s1,8(sp)
    800000d0:	0ad010ef          	jal	8000197c <uart_puts>
    800000d4:	00004517          	auipc	a0,0x4
    800000d8:	f4c50513          	add	a0,a0,-180 # 80004020 <rodata_start+0x20>
    800000dc:	0a1010ef          	jal	8000197c <uart_puts>
    800000e0:	01100593          	li	a1,17
    800000e4:	40100513          	li	a0,1025
    800000e8:	01b59593          	sll	a1,a1,0x1b
    800000ec:	01551513          	sll	a0,a0,0x15
    800000f0:	0b9010ef          	jal	800019a8 <pmm_init>
    800000f4:	00004517          	auipc	a0,0x4
    800000f8:	fec50513          	add	a0,a0,-20 # 800040e0 <rodata_start+0xe0>
    800000fc:	081010ef          	jal	8000197c <uart_puts>
    80000100:	2f5010ef          	jal	80001bf4 <create_pagetable>
    80000104:	14050a63          	beqz	a0,80000258 <pt_test+0x1a0>
    80000108:	00050413          	mv	s0,a0
    8000010c:	00004517          	auipc	a0,0x4
    80000110:	00450513          	add	a0,a0,4 # 80004110 <rodata_start+0x110>
    80000114:	069010ef          	jal	8000197c <uart_puts>
    80000118:	00004517          	auipc	a0,0x4
    8000011c:	01050513          	add	a0,a0,16 # 80004128 <rodata_start+0x128>
    80000120:	05d010ef          	jal	8000197c <uart_puts>
    80000124:	00100613          	li	a2,1
    80000128:	01f61613          	sll	a2,a2,0x1f
    8000012c:	00a00693          	li	a3,10
    80000130:	00060593          	mv	a1,a2
    80000134:	00040513          	mv	a0,s0
    80000138:	2f1010ef          	jal	80001c28 <map_page>
    8000013c:	0c051263          	bnez	a0,80000200 <pt_test+0x148>
    80000140:	80000637          	lui	a2,0x80000
    80000144:	800005b7          	lui	a1,0x80000
    80000148:	00004517          	auipc	a0,0x4
    8000014c:	01850513          	add	a0,a0,24 # 80004160 <rodata_start+0x160>
    80000150:	57c010ef          	jal	800016cc <printf>
    80000154:	40100613          	li	a2,1025
    80000158:	01561613          	sll	a2,a2,0x15
    8000015c:	00600693          	li	a3,6
    80000160:	00060593          	mv	a1,a2
    80000164:	00040513          	mv	a0,s0
    80000168:	2c1010ef          	jal	80001c28 <map_page>
    8000016c:	0a050e63          	beqz	a0,80000228 <pt_test+0x170>
    80000170:	00004517          	auipc	a0,0x4
    80000174:	02850513          	add	a0,a0,40 # 80004198 <rodata_start+0x198>
    80000178:	005010ef          	jal	8000197c <uart_puts>
    8000017c:	080004b7          	lui	s1,0x8000
    80000180:	fff48493          	add	s1,s1,-1 # 7ffffff <_entry-0x78000001>
    80000184:	08100613          	li	a2,129
    80000188:	01600693          	li	a3,22
    8000018c:	01861613          	sll	a2,a2,0x18
    80000190:	00c49593          	sll	a1,s1,0xc
    80000194:	00040513          	mv	a0,s0
    80000198:	291010ef          	jal	80001c28 <map_page>
    8000019c:	0a050263          	beqz	a0,80000240 <pt_test+0x188>
    800001a0:	00004517          	auipc	a0,0x4
    800001a4:	05050513          	add	a0,a0,80 # 800041f0 <rodata_start+0x1f0>
    800001a8:	7d4010ef          	jal	8000197c <uart_puts>
    800001ac:	00004517          	auipc	a0,0x4
    800001b0:	09c50513          	add	a0,a0,156 # 80004248 <rodata_start+0x248>
    800001b4:	7c8010ef          	jal	8000197c <uart_puts>
    800001b8:	00000593          	li	a1,0
    800001bc:	00040513          	mv	a0,s0
    800001c0:	0b8020ef          	jal	80002278 <dump_pagetable>
    800001c4:	00004517          	auipc	a0,0x4
    800001c8:	09450513          	add	a0,a0,148 # 80004258 <rodata_start+0x258>
    800001cc:	7b0010ef          	jal	8000197c <uart_puts>
    800001d0:	00040513          	mv	a0,s0
    800001d4:	519010ef          	jal	80001eec <destroy_pagetable>
    800001d8:	00004517          	auipc	a0,0x4
    800001dc:	09850513          	add	a0,a0,152 # 80004270 <rodata_start+0x270>
    800001e0:	79c010ef          	jal	8000197c <uart_puts>
    800001e4:	01013403          	ld	s0,16(sp)
    800001e8:	01813083          	ld	ra,24(sp)
    800001ec:	00813483          	ld	s1,8(sp)
    800001f0:	00004517          	auipc	a0,0x4
    800001f4:	09850513          	add	a0,a0,152 # 80004288 <rodata_start+0x288>
    800001f8:	02010113          	add	sp,sp,32
    800001fc:	7800106f          	j	8000197c <uart_puts>
    80000200:	00004517          	auipc	a0,0x4
    80000204:	f4050513          	add	a0,a0,-192 # 80004140 <rodata_start+0x140>
    80000208:	774010ef          	jal	8000197c <uart_puts>
    8000020c:	40100613          	li	a2,1025
    80000210:	01561613          	sll	a2,a2,0x15
    80000214:	00600693          	li	a3,6
    80000218:	00060593          	mv	a1,a2
    8000021c:	00040513          	mv	a0,s0
    80000220:	209010ef          	jal	80001c28 <map_page>
    80000224:	f40516e3          	bnez	a0,80000170 <pt_test+0xb8>
    80000228:	80200637          	lui	a2,0x80200
    8000022c:	802005b7          	lui	a1,0x80200
    80000230:	00004517          	auipc	a0,0x4
    80000234:	f8850513          	add	a0,a0,-120 # 800041b8 <rodata_start+0x1b8>
    80000238:	494010ef          	jal	800016cc <printf>
    8000023c:	f41ff06f          	j	8000017c <pt_test+0xc4>
    80000240:	81000637          	lui	a2,0x81000
    80000244:	00c49593          	sll	a1,s1,0xc
    80000248:	00004517          	auipc	a0,0x4
    8000024c:	fc850513          	add	a0,a0,-56 # 80004210 <rodata_start+0x210>
    80000250:	47c010ef          	jal	800016cc <printf>
    80000254:	f59ff06f          	j	800001ac <pt_test+0xf4>
    80000258:	01013403          	ld	s0,16(sp)
    8000025c:	01813083          	ld	ra,24(sp)
    80000260:	00813483          	ld	s1,8(sp)
    80000264:	00004517          	auipc	a0,0x4
    80000268:	e9450513          	add	a0,a0,-364 # 800040f8 <rodata_start+0xf8>
    8000026c:	02010113          	add	sp,sp,32
    80000270:	70c0106f          	j	8000197c <uart_puts>

0000000080000274 <pmm_test>:
    80000274:	fe010113          	add	sp,sp,-32
    80000278:	00004517          	auipc	a0,0x4
    8000027c:	03050513          	add	a0,a0,48 # 800042a8 <rodata_start+0x2a8>
    80000280:	00113c23          	sd	ra,24(sp)
    80000284:	00813823          	sd	s0,16(sp)
    80000288:	00913423          	sd	s1,8(sp)
    8000028c:	01213023          	sd	s2,0(sp)
    80000290:	6ec010ef          	jal	8000197c <uart_puts>
    80000294:	00004517          	auipc	a0,0x4
    80000298:	d8c50513          	add	a0,a0,-628 # 80004020 <rodata_start+0x20>
    8000029c:	6e0010ef          	jal	8000197c <uart_puts>
    800002a0:	01100593          	li	a1,17
    800002a4:	40100513          	li	a0,1025
    800002a8:	01b59593          	sll	a1,a1,0x1b
    800002ac:	01551513          	sll	a0,a0,0x15
    800002b0:	6f8010ef          	jal	800019a8 <pmm_init>
    800002b4:	00004517          	auipc	a0,0x4
    800002b8:	01c50513          	add	a0,a0,28 # 800042d0 <rodata_start+0x2d0>
    800002bc:	6c0010ef          	jal	8000197c <uart_puts>
    800002c0:	768010ef          	jal	80001a28 <alloc_page>
    800002c4:	00050593          	mv	a1,a0
    800002c8:	00050493          	mv	s1,a0
    800002cc:	00004517          	auipc	a0,0x4
    800002d0:	01c50513          	add	a0,a0,28 # 800042e8 <rodata_start+0x2e8>
    800002d4:	3f8010ef          	jal	800016cc <printf>
    800002d8:	750010ef          	jal	80001a28 <alloc_page>
    800002dc:	00050593          	mv	a1,a0
    800002e0:	00050413          	mv	s0,a0
    800002e4:	00004517          	auipc	a0,0x4
    800002e8:	02450513          	add	a0,a0,36 # 80004308 <rodata_start+0x308>
    800002ec:	3e0010ef          	jal	800016cc <printf>
    800002f0:	738010ef          	jal	80001a28 <alloc_page>
    800002f4:	00050593          	mv	a1,a0
    800002f8:	00050913          	mv	s2,a0
    800002fc:	00004517          	auipc	a0,0x4
    80000300:	02c50513          	add	a0,a0,44 # 80004328 <rodata_start+0x328>
    80000304:	3c8010ef          	jal	800016cc <printf>
    80000308:	00004517          	auipc	a0,0x4
    8000030c:	04050513          	add	a0,a0,64 # 80004348 <rodata_start+0x348>
    80000310:	66c010ef          	jal	8000197c <uart_puts>
    80000314:	00048513          	mv	a0,s1
    80000318:	72c010ef          	jal	80001a44 <free_page>
    8000031c:	00004517          	auipc	a0,0x4
    80000320:	04450513          	add	a0,a0,68 # 80004360 <rodata_start+0x360>
    80000324:	658010ef          	jal	8000197c <uart_puts>
    80000328:	00040513          	mv	a0,s0
    8000032c:	718010ef          	jal	80001a44 <free_page>
    80000330:	00004517          	auipc	a0,0x4
    80000334:	04850513          	add	a0,a0,72 # 80004378 <rodata_start+0x378>
    80000338:	644010ef          	jal	8000197c <uart_puts>
    8000033c:	00004517          	auipc	a0,0x4
    80000340:	05450513          	add	a0,a0,84 # 80004390 <rodata_start+0x390>
    80000344:	638010ef          	jal	8000197c <uart_puts>
    80000348:	6e0010ef          	jal	80001a28 <alloc_page>
    8000034c:	00050593          	mv	a1,a0
    80000350:	00050493          	mv	s1,a0
    80000354:	00004517          	auipc	a0,0x4
    80000358:	05c50513          	add	a0,a0,92 # 800043b0 <rodata_start+0x3b0>
    8000035c:	370010ef          	jal	800016cc <printf>
    80000360:	6c8010ef          	jal	80001a28 <alloc_page>
    80000364:	00050593          	mv	a1,a0
    80000368:	00050413          	mv	s0,a0
    8000036c:	00004517          	auipc	a0,0x4
    80000370:	04450513          	add	a0,a0,68 # 800043b0 <rodata_start+0x3b0>
    80000374:	358010ef          	jal	800016cc <printf>
    80000378:	00090513          	mv	a0,s2
    8000037c:	6c8010ef          	jal	80001a44 <free_page>
    80000380:	00048513          	mv	a0,s1
    80000384:	6c0010ef          	jal	80001a44 <free_page>
    80000388:	00040513          	mv	a0,s0
    8000038c:	6b8010ef          	jal	80001a44 <free_page>
    80000390:	00004517          	auipc	a0,0x4
    80000394:	04050513          	add	a0,a0,64 # 800043d0 <rodata_start+0x3d0>
    80000398:	5e4010ef          	jal	8000197c <uart_puts>
    8000039c:	01013403          	ld	s0,16(sp)
    800003a0:	01813083          	ld	ra,24(sp)
    800003a4:	00813483          	ld	s1,8(sp)
    800003a8:	00013903          	ld	s2,0(sp)
    800003ac:	00004517          	auipc	a0,0x4
    800003b0:	04450513          	add	a0,a0,68 # 800043f0 <rodata_start+0x3f0>
    800003b4:	02010113          	add	sp,sp,32
    800003b8:	5c40106f          	j	8000197c <uart_puts>

00000000800003bc <test_alloc_pages_gap2>:
    800003bc:	fa010113          	add	sp,sp,-96
    800003c0:	00004517          	auipc	a0,0x4
    800003c4:	05850513          	add	a0,a0,88 # 80004418 <rodata_start+0x418>
    800003c8:	04113c23          	sd	ra,88(sp)
    800003cc:	04813823          	sd	s0,80(sp)
    800003d0:	04913423          	sd	s1,72(sp)
    800003d4:	05213023          	sd	s2,64(sp)
    800003d8:	03313c23          	sd	s3,56(sp)
    800003dc:	03413823          	sd	s4,48(sp)
    800003e0:	03513423          	sd	s5,40(sp)
    800003e4:	598010ef          	jal	8000197c <uart_puts>
    800003e8:	00004517          	auipc	a0,0x4
    800003ec:	c3850513          	add	a0,a0,-968 # 80004020 <rodata_start+0x20>
    800003f0:	58c010ef          	jal	8000197c <uart_puts>
    800003f4:	01100593          	li	a1,17
    800003f8:	40100513          	li	a0,1025
    800003fc:	01b59593          	sll	a1,a1,0x1b
    80000400:	01551513          	sll	a0,a0,0x15
    80000404:	5a4010ef          	jal	800019a8 <pmm_init>
    80000408:	620010ef          	jal	80001a28 <alloc_page>
    8000040c:	00050593          	mv	a1,a0
    80000410:	00050993          	mv	s3,a0
    80000414:	00004517          	auipc	a0,0x4
    80000418:	03450513          	add	a0,a0,52 # 80004448 <rodata_start+0x448>
    8000041c:	2b0010ef          	jal	800016cc <printf>
    80000420:	00004517          	auipc	a0,0x4
    80000424:	04050513          	add	a0,a0,64 # 80004460 <rodata_start+0x460>
    80000428:	00810493          	add	s1,sp,8
    8000042c:	550010ef          	jal	8000197c <uart_puts>
    80000430:	00048913          	mv	s2,s1
    80000434:	00000413          	li	s0,0
    80000438:	00004a97          	auipc	s5,0x4
    8000043c:	040a8a93          	add	s5,s5,64 # 80004478 <rodata_start+0x478>
    80000440:	00300a13          	li	s4,3
    80000444:	5e4010ef          	jal	80001a28 <alloc_page>
    80000448:	00050613          	mv	a2,a0
    8000044c:	0014041b          	addw	s0,s0,1
    80000450:	00c93023          	sd	a2,0(s2)
    80000454:	00040593          	mv	a1,s0
    80000458:	000a8513          	mv	a0,s5
    8000045c:	270010ef          	jal	800016cc <printf>
    80000460:	00890913          	add	s2,s2,8
    80000464:	ff4410e3          	bne	s0,s4,80000444 <test_alloc_pages_gap2+0x88>
    80000468:	00004517          	auipc	a0,0x4
    8000046c:	03050513          	add	a0,a0,48 # 80004498 <rodata_start+0x498>
    80000470:	50c010ef          	jal	8000197c <uart_puts>
    80000474:	00098513          	mv	a0,s3
    80000478:	5cc010ef          	jal	80001a44 <free_page>
    8000047c:	00004517          	auipc	a0,0x4
    80000480:	02c50513          	add	a0,a0,44 # 800044a8 <rodata_start+0x4a8>
    80000484:	4f8010ef          	jal	8000197c <uart_puts>
    80000488:	00000413          	li	s0,0
    8000048c:	00004997          	auipc	s3,0x4
    80000490:	03c98993          	add	s3,s3,60 # 800044c8 <rodata_start+0x4c8>
    80000494:	00300913          	li	s2,3
    80000498:	0004b503          	ld	a0,0(s1)
    8000049c:	0014041b          	addw	s0,s0,1
    800004a0:	00848493          	add	s1,s1,8
    800004a4:	5a0010ef          	jal	80001a44 <free_page>
    800004a8:	00040593          	mv	a1,s0
    800004ac:	00098513          	mv	a0,s3
    800004b0:	21c010ef          	jal	800016cc <printf>
    800004b4:	ff2412e3          	bne	s0,s2,80000498 <test_alloc_pages_gap2+0xdc>
    800004b8:	05013403          	ld	s0,80(sp)
    800004bc:	05813083          	ld	ra,88(sp)
    800004c0:	04813483          	ld	s1,72(sp)
    800004c4:	04013903          	ld	s2,64(sp)
    800004c8:	03813983          	ld	s3,56(sp)
    800004cc:	03013a03          	ld	s4,48(sp)
    800004d0:	02813a83          	ld	s5,40(sp)
    800004d4:	00004517          	auipc	a0,0x4
    800004d8:	00c50513          	add	a0,a0,12 # 800044e0 <rodata_start+0x4e0>
    800004dc:	06010113          	add	sp,sp,96
    800004e0:	49c0106f          	j	8000197c <uart_puts>

00000000800004e4 <test_alloc_pages_pattern>:
    800004e4:	fa010113          	add	sp,sp,-96
    800004e8:	00004517          	auipc	a0,0x4
    800004ec:	02850513          	add	a0,a0,40 # 80004510 <rodata_start+0x510>
    800004f0:	04113c23          	sd	ra,88(sp)
    800004f4:	04813823          	sd	s0,80(sp)
    800004f8:	04913423          	sd	s1,72(sp)
    800004fc:	05213023          	sd	s2,64(sp)
    80000500:	03313c23          	sd	s3,56(sp)
    80000504:	478010ef          	jal	8000197c <uart_puts>
    80000508:	01100593          	li	a1,17
    8000050c:	40100513          	li	a0,1025
    80000510:	01b59593          	sll	a1,a1,0x1b
    80000514:	01551513          	sll	a0,a0,0x15
    80000518:	490010ef          	jal	800019a8 <pmm_init>
    8000051c:	00810493          	add	s1,sp,8
    80000520:	00000413          	li	s0,0
    80000524:	00004997          	auipc	s3,0x4
    80000528:	01498993          	add	s3,s3,20 # 80004538 <rodata_start+0x538>
    8000052c:	00500913          	li	s2,5
    80000530:	4f8010ef          	jal	80001a28 <alloc_page>
    80000534:	00050613          	mv	a2,a0
    80000538:	0014041b          	addw	s0,s0,1
    8000053c:	00c4b023          	sd	a2,0(s1)
    80000540:	00040593          	mv	a1,s0
    80000544:	00098513          	mv	a0,s3
    80000548:	184010ef          	jal	800016cc <printf>
    8000054c:	00848493          	add	s1,s1,8
    80000550:	ff2410e3          	bne	s0,s2,80000530 <test_alloc_pages_pattern+0x4c>
    80000554:	00813983          	ld	s3,8(sp)
    80000558:	00098513          	mv	a0,s3
    8000055c:	4e8010ef          	jal	80001a44 <free_page>
    80000560:	01813903          	ld	s2,24(sp)
    80000564:	00090513          	mv	a0,s2
    80000568:	4dc010ef          	jal	80001a44 <free_page>
    8000056c:	02013483          	ld	s1,32(sp)
    80000570:	00048513          	mv	a0,s1
    80000574:	4d0010ef          	jal	80001a44 <free_page>
    80000578:	02813403          	ld	s0,40(sp)
    8000057c:	00040513          	mv	a0,s0
    80000580:	4c4010ef          	jal	80001a44 <free_page>
    80000584:	00098593          	mv	a1,s3
    80000588:	00004517          	auipc	a0,0x4
    8000058c:	fc850513          	add	a0,a0,-56 # 80004550 <rodata_start+0x550>
    80000590:	13c010ef          	jal	800016cc <printf>
    80000594:	00090593          	mv	a1,s2
    80000598:	00004517          	auipc	a0,0x4
    8000059c:	fd050513          	add	a0,a0,-48 # 80004568 <rodata_start+0x568>
    800005a0:	12c010ef          	jal	800016cc <printf>
    800005a4:	00048593          	mv	a1,s1
    800005a8:	00004517          	auipc	a0,0x4
    800005ac:	fd850513          	add	a0,a0,-40 # 80004580 <rodata_start+0x580>
    800005b0:	11c010ef          	jal	800016cc <printf>
    800005b4:	00040593          	mv	a1,s0
    800005b8:	00004517          	auipc	a0,0x4
    800005bc:	fe050513          	add	a0,a0,-32 # 80004598 <rodata_start+0x598>
    800005c0:	10c010ef          	jal	800016cc <printf>
    800005c4:	00300513          	li	a0,3
    800005c8:	4b8010ef          	jal	80001a80 <alloc_pages>
    800005cc:	00050493          	mv	s1,a0
    800005d0:	0a050263          	beqz	a0,80000674 <test_alloc_pages_pattern+0x190>
    800005d4:	00004517          	auipc	a0,0x4
    800005d8:	ff450513          	add	a0,a0,-12 # 800045c8 <rodata_start+0x5c8>
    800005dc:	3a0010ef          	jal	8000197c <uart_puts>
    800005e0:	03c00413          	li	s0,60
    800005e4:	00900993          	li	s3,9
    800005e8:	ffc00913          	li	s2,-4
    800005ec:	0084d7b3          	srl	a5,s1,s0
    800005f0:	00f7f713          	and	a4,a5,15
    800005f4:	ffc4041b          	addw	s0,s0,-4
    800005f8:	03770513          	add	a0,a4,55
    800005fc:	00e9c463          	blt	s3,a4,80000604 <test_alloc_pages_pattern+0x120>
    80000600:	03070513          	add	a0,a4,48
    80000604:	360010ef          	jal	80001964 <uart_putc>
    80000608:	ff2412e3          	bne	s0,s2,800005ec <test_alloc_pages_pattern+0x108>
    8000060c:	00004517          	auipc	a0,0x4
    80000610:	23c50513          	add	a0,a0,572 # 80004848 <rodata_start+0x848>
    80000614:	368010ef          	jal	8000197c <uart_puts>
    80000618:	00048613          	mv	a2,s1
    8000061c:	00100593          	li	a1,1
    80000620:	00004517          	auipc	a0,0x4
    80000624:	fd050513          	add	a0,a0,-48 # 800045f0 <rodata_start+0x5f0>
    80000628:	0a4010ef          	jal	800016cc <printf>
    8000062c:	00001637          	lui	a2,0x1
    80000630:	00c48633          	add	a2,s1,a2
    80000634:	00200593          	li	a1,2
    80000638:	00004517          	auipc	a0,0x4
    8000063c:	fb850513          	add	a0,a0,-72 # 800045f0 <rodata_start+0x5f0>
    80000640:	08c010ef          	jal	800016cc <printf>
    80000644:	00002637          	lui	a2,0x2
    80000648:	05013403          	ld	s0,80(sp)
    8000064c:	05813083          	ld	ra,88(sp)
    80000650:	04013903          	ld	s2,64(sp)
    80000654:	03813983          	ld	s3,56(sp)
    80000658:	00c48633          	add	a2,s1,a2
    8000065c:	04813483          	ld	s1,72(sp)
    80000660:	00300593          	li	a1,3
    80000664:	00004517          	auipc	a0,0x4
    80000668:	f8c50513          	add	a0,a0,-116 # 800045f0 <rodata_start+0x5f0>
    8000066c:	06010113          	add	sp,sp,96
    80000670:	05c0106f          	j	800016cc <printf>
    80000674:	05013403          	ld	s0,80(sp)
    80000678:	05813083          	ld	ra,88(sp)
    8000067c:	04813483          	ld	s1,72(sp)
    80000680:	04013903          	ld	s2,64(sp)
    80000684:	03813983          	ld	s3,56(sp)
    80000688:	00004517          	auipc	a0,0x4
    8000068c:	f2850513          	add	a0,a0,-216 # 800045b0 <rodata_start+0x5b0>
    80000690:	06010113          	add	sp,sp,96
    80000694:	2e80106f          	j	8000197c <uart_puts>

0000000080000698 <performance_test>:
    80000698:	fd010113          	add	sp,sp,-48
    8000069c:	00004517          	auipc	a0,0x4
    800006a0:	f7c50513          	add	a0,a0,-132 # 80004618 <rodata_start+0x618>
    800006a4:	02813023          	sd	s0,32(sp)
    800006a8:	00913c23          	sd	s1,24(sp)
    800006ac:	01213823          	sd	s2,16(sp)
    800006b0:	01313423          	sd	s3,8(sp)
    800006b4:	02113423          	sd	ra,40(sp)
    800006b8:	00000413          	li	s0,0
    800006bc:	2c0010ef          	jal	8000197c <uart_puts>
    800006c0:	00005997          	auipc	s3,0x5
    800006c4:	c7898993          	add	s3,s3,-904 # 80005338 <long_string>
    800006c8:	00004917          	auipc	s2,0x4
    800006cc:	f6890913          	add	s2,s2,-152 # 80004630 <rodata_start+0x630>
    800006d0:	06400493          	li	s1,100
    800006d4:	00040593          	mv	a1,s0
    800006d8:	00098613          	mv	a2,s3
    800006dc:	0014041b          	addw	s0,s0,1
    800006e0:	00090513          	mv	a0,s2
    800006e4:	7e9000ef          	jal	800016cc <printf>
    800006e8:	fe9416e3          	bne	s0,s1,800006d4 <performance_test+0x3c>
    800006ec:	02013403          	ld	s0,32(sp)
    800006f0:	02813083          	ld	ra,40(sp)
    800006f4:	01813483          	ld	s1,24(sp)
    800006f8:	01013903          	ld	s2,16(sp)
    800006fc:	00813983          	ld	s3,8(sp)
    80000700:	00004517          	auipc	a0,0x4
    80000704:	f4850513          	add	a0,a0,-184 # 80004648 <rodata_start+0x648>
    80000708:	03010113          	add	sp,sp,48
    8000070c:	2700106f          	j	8000197c <uart_puts>

0000000080000710 <basic_format_test>:
    80000710:	ff010113          	add	sp,sp,-16
    80000714:	00004517          	auipc	a0,0x4
    80000718:	f4c50513          	add	a0,a0,-180 # 80004660 <rodata_start+0x660>
    8000071c:	00113423          	sd	ra,8(sp)
    80000720:	25c010ef          	jal	8000197c <uart_puts>
    80000724:	000035b7          	lui	a1,0x3
    80000728:	03958593          	add	a1,a1,57 # 3039 <_entry-0x7fffcfc7>
    8000072c:	00004517          	auipc	a0,0x4
    80000730:	f5c50513          	add	a0,a0,-164 # 80004688 <rodata_start+0x688>
    80000734:	799000ef          	jal	800016cc <printf>
    80000738:	fffe85b7          	lui	a1,0xfffe8
    8000073c:	e3358593          	add	a1,a1,-461 # fffffffffffe7e33 <bss_end+0xffffffff7fbd3d6b>
    80000740:	00004517          	auipc	a0,0x4
    80000744:	f6050513          	add	a0,a0,-160 # 800046a0 <rodata_start+0x6a0>
    80000748:	785000ef          	jal	800016cc <printf>
    8000074c:	deadc5b7          	lui	a1,0xdeadc
    80000750:	eef58593          	add	a1,a1,-273 # ffffffffdeadbeef <bss_end+0xffffffff5e6c7e27>
    80000754:	00004517          	auipc	a0,0x4
    80000758:	f6450513          	add	a0,a0,-156 # 800046b8 <rodata_start+0x6b8>
    8000075c:	771000ef          	jal	800016cc <printf>
    80000760:	00004597          	auipc	a1,0x4
    80000764:	f7858593          	add	a1,a1,-136 # 800046d8 <rodata_start+0x6d8>
    80000768:	00004517          	auipc	a0,0x4
    8000076c:	f8050513          	add	a0,a0,-128 # 800046e8 <rodata_start+0x6e8>
    80000770:	75d000ef          	jal	800016cc <printf>
    80000774:	04100593          	li	a1,65
    80000778:	00004517          	auipc	a0,0x4
    8000077c:	f8850513          	add	a0,a0,-120 # 80004700 <rodata_start+0x700>
    80000780:	74d000ef          	jal	800016cc <printf>
    80000784:	00004517          	auipc	a0,0x4
    80000788:	f9450513          	add	a0,a0,-108 # 80004718 <rodata_start+0x718>
    8000078c:	741000ef          	jal	800016cc <printf>
    80000790:	00000593          	li	a1,0
    80000794:	00004517          	auipc	a0,0x4
    80000798:	f9c50513          	add	a0,a0,-100 # 80004730 <rodata_start+0x730>
    8000079c:	731000ef          	jal	800016cc <printf>
    800007a0:	800005b7          	lui	a1,0x80000
    800007a4:	fff5c593          	not	a1,a1
    800007a8:	00004517          	auipc	a0,0x4
    800007ac:	fa050513          	add	a0,a0,-96 # 80004748 <rodata_start+0x748>
    800007b0:	71d000ef          	jal	800016cc <printf>
    800007b4:	800005b7          	lui	a1,0x80000
    800007b8:	00004517          	auipc	a0,0x4
    800007bc:	fa850513          	add	a0,a0,-88 # 80004760 <rodata_start+0x760>
    800007c0:	70d000ef          	jal	800016cc <printf>
    800007c4:	00813083          	ld	ra,8(sp)
    800007c8:	00004517          	auipc	a0,0x4
    800007cc:	fb050513          	add	a0,a0,-80 # 80004778 <rodata_start+0x778>
    800007d0:	01010113          	add	sp,sp,16
    800007d4:	1a80106f          	j	8000197c <uart_puts>

00000000800007d8 <boundary_test>:
    800007d8:	ff010113          	add	sp,sp,-16
    800007dc:	00004517          	auipc	a0,0x4
    800007e0:	fc450513          	add	a0,a0,-60 # 800047a0 <rodata_start+0x7a0>
    800007e4:	00113423          	sd	ra,8(sp)
    800007e8:	194010ef          	jal	8000197c <uart_puts>
    800007ec:	00000593          	li	a1,0
    800007f0:	00004517          	auipc	a0,0x4
    800007f4:	fd850513          	add	a0,a0,-40 # 800047c8 <rodata_start+0x7c8>
    800007f8:	6d5000ef          	jal	800016cc <printf>
    800007fc:	00005597          	auipc	a1,0x5
    80000800:	83c58593          	add	a1,a1,-1988 # 80005038 <rodata_start+0x1038>
    80000804:	00004517          	auipc	a0,0x4
    80000808:	fdc50513          	add	a0,a0,-36 # 800047e0 <rodata_start+0x7e0>
    8000080c:	6c1000ef          	jal	800016cc <printf>
    80000810:	00004517          	auipc	a0,0x4
    80000814:	fe850513          	add	a0,a0,-24 # 800047f8 <rodata_start+0x7f8>
    80000818:	6b5000ef          	jal	800016cc <printf>
    8000081c:	00004517          	auipc	a0,0x4
    80000820:	ff450513          	add	a0,a0,-12 # 80004810 <rodata_start+0x810>
    80000824:	6a9000ef          	jal	800016cc <printf>
    80000828:	00813083          	ld	ra,8(sp)
    8000082c:	00004517          	auipc	a0,0x4
    80000830:	ffc50513          	add	a0,a0,-4 # 80004828 <rodata_start+0x828>
    80000834:	01010113          	add	sp,sp,16
    80000838:	1440106f          	j	8000197c <uart_puts>

000000008000083c <color_test>:
    8000083c:	ff010113          	add	sp,sp,-16
    80000840:	00004517          	auipc	a0,0x4
    80000844:	01050513          	add	a0,a0,16 # 80004850 <rodata_start+0x850>
    80000848:	00113423          	sd	ra,8(sp)
    8000084c:	130010ef          	jal	8000197c <uart_puts>
    80000850:	00004597          	auipc	a1,0x4
    80000854:	02058593          	add	a1,a1,32 # 80004870 <rodata_start+0x870>
    80000858:	01f00513          	li	a0,31
    8000085c:	425000ef          	jal	80001480 <printf_color>
    80000860:	00004597          	auipc	a1,0x4
    80000864:	02058593          	add	a1,a1,32 # 80004880 <rodata_start+0x880>
    80000868:	02000513          	li	a0,32
    8000086c:	415000ef          	jal	80001480 <printf_color>
    80000870:	00004597          	auipc	a1,0x4
    80000874:	02058593          	add	a1,a1,32 # 80004890 <rodata_start+0x890>
    80000878:	02200513          	li	a0,34
    8000087c:	405000ef          	jal	80001480 <printf_color>
    80000880:	00004597          	auipc	a1,0x4
    80000884:	02058593          	add	a1,a1,32 # 800048a0 <rodata_start+0x8a0>
    80000888:	02100513          	li	a0,33
    8000088c:	3f5000ef          	jal	80001480 <printf_color>
    80000890:	00004597          	auipc	a1,0x4
    80000894:	02058593          	add	a1,a1,32 # 800048b0 <rodata_start+0x8b0>
    80000898:	02300513          	li	a0,35
    8000089c:	3e5000ef          	jal	80001480 <printf_color>
    800008a0:	00004597          	auipc	a1,0x4
    800008a4:	02858593          	add	a1,a1,40 # 800048c8 <rodata_start+0x8c8>
    800008a8:	02400513          	li	a0,36
    800008ac:	3d5000ef          	jal	80001480 <printf_color>
    800008b0:	00004597          	auipc	a1,0x4
    800008b4:	02858593          	add	a1,a1,40 # 800048d8 <rodata_start+0x8d8>
    800008b8:	02500513          	li	a0,37
    800008bc:	3c5000ef          	jal	80001480 <printf_color>
    800008c0:	06400613          	li	a2,100
    800008c4:	00004597          	auipc	a1,0x4
    800008c8:	02458593          	add	a1,a1,36 # 800048e8 <rodata_start+0x8e8>
    800008cc:	01f00513          	li	a0,31
    800008d0:	3b1000ef          	jal	80001480 <printf_color>
    800008d4:	00004617          	auipc	a2,0x4
    800008d8:	02c60613          	add	a2,a2,44 # 80004900 <rodata_start+0x900>
    800008dc:	00004597          	auipc	a1,0x4
    800008e0:	02c58593          	add	a1,a1,44 # 80004908 <rodata_start+0x908>
    800008e4:	02000513          	li	a0,32
    800008e8:	399000ef          	jal	80001480 <printf_color>
    800008ec:	00813083          	ld	ra,8(sp)
    800008f0:	00004517          	auipc	a0,0x4
    800008f4:	03050513          	add	a0,a0,48 # 80004920 <rodata_start+0x920>
    800008f8:	01010113          	add	sp,sp,16
    800008fc:	0800106f          	j	8000197c <uart_puts>

0000000080000900 <screen_test>:
    80000900:	fd010113          	add	sp,sp,-48
    80000904:	00004517          	auipc	a0,0x4
    80000908:	03c50513          	add	a0,a0,60 # 80004940 <rodata_start+0x940>
    8000090c:	02113423          	sd	ra,40(sp)
    80000910:	02813023          	sd	s0,32(sp)
    80000914:	00913c23          	sd	s1,24(sp)
    80000918:	01213823          	sd	s2,16(sp)
    8000091c:	060010ef          	jal	8000197c <uart_puts>
    80000920:	00004517          	auipc	a0,0x4
    80000924:	04850513          	add	a0,a0,72 # 80004968 <rodata_start+0x968>
    80000928:	054010ef          	jal	8000197c <uart_puts>
    8000092c:	00000413          	li	s0,0
    80000930:	00004917          	auipc	s2,0x4
    80000934:	05090913          	add	s2,s2,80 # 80004980 <rodata_start+0x980>
    80000938:	00500493          	li	s1,5
    8000093c:	00040593          	mv	a1,s0
    80000940:	00090513          	mv	a0,s2
    80000944:	0014041b          	addw	s0,s0,1
    80000948:	585000ef          	jal	800016cc <printf>
    8000094c:	fe9418e3          	bne	s0,s1,8000093c <screen_test+0x3c>
    80000950:	00012623          	sw	zero,12(sp)
    80000954:	00c12783          	lw	a5,12(sp)
    80000958:	00018737          	lui	a4,0x18
    8000095c:	69f70713          	add	a4,a4,1695 # 1869f <_entry-0x7ffe7961>
    80000960:	00f74c63          	blt	a4,a5,80000978 <screen_test+0x78>
    80000964:	00c12783          	lw	a5,12(sp)
    80000968:	0017879b          	addw	a5,a5,1
    8000096c:	00f12623          	sw	a5,12(sp)
    80000970:	00c12783          	lw	a5,12(sp)
    80000974:	fef758e3          	bge	a4,a5,80000964 <screen_test+0x64>
    80000978:	165000ef          	jal	800012dc <clear_screen>
    8000097c:	00004517          	auipc	a0,0x4
    80000980:	00c50513          	add	a0,a0,12 # 80004988 <rodata_start+0x988>
    80000984:	7f9000ef          	jal	8000197c <uart_puts>
    80000988:	00004517          	auipc	a0,0x4
    8000098c:	03850513          	add	a0,a0,56 # 800049c0 <rodata_start+0x9c0>
    80000990:	7ed000ef          	jal	8000197c <uart_puts>
    80000994:	00500593          	li	a1,5
    80000998:	00100513          	li	a0,1
    8000099c:	159000ef          	jal	800012f4 <goto_xy>
    800009a0:	00004517          	auipc	a0,0x4
    800009a4:	03850513          	add	a0,a0,56 # 800049d8 <rodata_start+0x9d8>
    800009a8:	7d5000ef          	jal	8000197c <uart_puts>
    800009ac:	00500593          	li	a1,5
    800009b0:	01400513          	li	a0,20
    800009b4:	141000ef          	jal	800012f4 <goto_xy>
    800009b8:	00004517          	auipc	a0,0x4
    800009bc:	03050513          	add	a0,a0,48 # 800049e8 <rodata_start+0x9e8>
    800009c0:	7bd000ef          	jal	8000197c <uart_puts>
    800009c4:	00700593          	li	a1,7
    800009c8:	00100513          	li	a0,1
    800009cc:	129000ef          	jal	800012f4 <goto_xy>
    800009d0:	00004597          	auipc	a1,0x4
    800009d4:	02858593          	add	a1,a1,40 # 800049f8 <rodata_start+0x9f8>
    800009d8:	02400513          	li	a0,36
    800009dc:	2a5000ef          	jal	80001480 <printf_color>
    800009e0:	00900593          	li	a1,9
    800009e4:	00100513          	li	a0,1
    800009e8:	10d000ef          	jal	800012f4 <goto_xy>
    800009ec:	00004517          	auipc	a0,0x4
    800009f0:	02450513          	add	a0,a0,36 # 80004a10 <rodata_start+0xa10>
    800009f4:	789000ef          	jal	8000197c <uart_puts>
    800009f8:	00a00593          	li	a1,10
    800009fc:	00100513          	li	a0,1
    80000a00:	0f5000ef          	jal	800012f4 <goto_xy>
    80000a04:	0e5000ef          	jal	800012e8 <clear_line>
    80000a08:	00004517          	auipc	a0,0x4
    80000a0c:	02050513          	add	a0,a0,32 # 80004a28 <rodata_start+0xa28>
    80000a10:	76d000ef          	jal	8000197c <uart_puts>
    80000a14:	02013403          	ld	s0,32(sp)
    80000a18:	02813083          	ld	ra,40(sp)
    80000a1c:	01813483          	ld	s1,24(sp)
    80000a20:	01013903          	ld	s2,16(sp)
    80000a24:	00004517          	auipc	a0,0x4
    80000a28:	02c50513          	add	a0,a0,44 # 80004a50 <rodata_start+0xa50>
    80000a2c:	03010113          	add	sp,sp,48
    80000a30:	74d0006f          	j	8000197c <uart_puts>

0000000080000a34 <error_recovery_test>:
    80000a34:	ff010113          	add	sp,sp,-16
    80000a38:	00004517          	auipc	a0,0x4
    80000a3c:	04050513          	add	a0,a0,64 # 80004a78 <rodata_start+0xa78>
    80000a40:	00113423          	sd	ra,8(sp)
    80000a44:	739000ef          	jal	8000197c <uart_puts>
    80000a48:	00000513          	li	a0,0
    80000a4c:	481000ef          	jal	800016cc <printf>
    80000a50:	02054863          	bltz	a0,80000a80 <error_recovery_test+0x4c>
    80000a54:	00004617          	auipc	a2,0x4
    80000a58:	06c60613          	add	a2,a2,108 # 80004ac0 <rodata_start+0xac0>
    80000a5c:	02a00593          	li	a1,42
    80000a60:	00004517          	auipc	a0,0x4
    80000a64:	06850513          	add	a0,a0,104 # 80004ac8 <rodata_start+0xac8>
    80000a68:	465000ef          	jal	800016cc <printf>
    80000a6c:	00813083          	ld	ra,8(sp)
    80000a70:	00004517          	auipc	a0,0x4
    80000a74:	07850513          	add	a0,a0,120 # 80004ae8 <rodata_start+0xae8>
    80000a78:	01010113          	add	sp,sp,16
    80000a7c:	7010006f          	j	8000197c <uart_puts>
    80000a80:	00004517          	auipc	a0,0x4
    80000a84:	01850513          	add	a0,a0,24 # 80004a98 <rodata_start+0xa98>
    80000a88:	6f5000ef          	jal	8000197c <uart_puts>
    80000a8c:	fc9ff06f          	j	80000a54 <error_recovery_test+0x20>

0000000080000a90 <print_page_replacement_info>:
    80000a90:	ff010113          	add	sp,sp,-16
    80000a94:	00004517          	auipc	a0,0x4
    80000a98:	07450513          	add	a0,a0,116 # 80004b08 <rodata_start+0xb08>
    80000a9c:	00113423          	sd	ra,8(sp)
    80000aa0:	6dd000ef          	jal	8000197c <uart_puts>
    80000aa4:	00004517          	auipc	a0,0x4
    80000aa8:	08c50513          	add	a0,a0,140 # 80004b30 <rodata_start+0xb30>
    80000aac:	6d1000ef          	jal	8000197c <uart_puts>
    80000ab0:	00004517          	auipc	a0,0x4
    80000ab4:	09050513          	add	a0,a0,144 # 80004b40 <rodata_start+0xb40>
    80000ab8:	6c5000ef          	jal	8000197c <uart_puts>
    80000abc:	00004517          	auipc	a0,0x4
    80000ac0:	0b450513          	add	a0,a0,180 # 80004b70 <rodata_start+0xb70>
    80000ac4:	6b9000ef          	jal	8000197c <uart_puts>
    80000ac8:	00004517          	auipc	a0,0x4
    80000acc:	0d050513          	add	a0,a0,208 # 80004b98 <rodata_start+0xb98>
    80000ad0:	6ad000ef          	jal	8000197c <uart_puts>
    80000ad4:	00004517          	auipc	a0,0x4
    80000ad8:	0dc50513          	add	a0,a0,220 # 80004bb0 <rodata_start+0xbb0>
    80000adc:	6a1000ef          	jal	8000197c <uart_puts>
    80000ae0:	00004517          	auipc	a0,0x4
    80000ae4:	0f050513          	add	a0,a0,240 # 80004bd0 <rodata_start+0xbd0>
    80000ae8:	695000ef          	jal	8000197c <uart_puts>
    80000aec:	00004517          	auipc	a0,0x4
    80000af0:	10450513          	add	a0,a0,260 # 80004bf0 <rodata_start+0xbf0>
    80000af4:	689000ef          	jal	8000197c <uart_puts>
    80000af8:	00004517          	auipc	a0,0x4
    80000afc:	11050513          	add	a0,a0,272 # 80004c08 <rodata_start+0xc08>
    80000b00:	67d000ef          	jal	8000197c <uart_puts>
    80000b04:	00004517          	auipc	a0,0x4
    80000b08:	12c50513          	add	a0,a0,300 # 80004c30 <rodata_start+0xc30>
    80000b0c:	671000ef          	jal	8000197c <uart_puts>
    80000b10:	00004517          	auipc	a0,0x4
    80000b14:	15050513          	add	a0,a0,336 # 80004c60 <rodata_start+0xc60>
    80000b18:	665000ef          	jal	8000197c <uart_puts>
    80000b1c:	00004517          	auipc	a0,0x4
    80000b20:	17450513          	add	a0,a0,372 # 80004c90 <rodata_start+0xc90>
    80000b24:	659000ef          	jal	8000197c <uart_puts>
    80000b28:	00004517          	auipc	a0,0x4
    80000b2c:	17850513          	add	a0,a0,376 # 80004ca0 <rodata_start+0xca0>
    80000b30:	64d000ef          	jal	8000197c <uart_puts>
    80000b34:	00004517          	auipc	a0,0x4
    80000b38:	19450513          	add	a0,a0,404 # 80004cc8 <rodata_start+0xcc8>
    80000b3c:	641000ef          	jal	8000197c <uart_puts>
    80000b40:	00004517          	auipc	a0,0x4
    80000b44:	1a850513          	add	a0,a0,424 # 80004ce8 <rodata_start+0xce8>
    80000b48:	635000ef          	jal	8000197c <uart_puts>
    80000b4c:	00004517          	auipc	a0,0x4
    80000b50:	1c450513          	add	a0,a0,452 # 80004d10 <rodata_start+0xd10>
    80000b54:	629000ef          	jal	8000197c <uart_puts>
    80000b58:	00004517          	auipc	a0,0x4
    80000b5c:	1e050513          	add	a0,a0,480 # 80004d38 <rodata_start+0xd38>
    80000b60:	61d000ef          	jal	8000197c <uart_puts>
    80000b64:	00004517          	auipc	a0,0x4
    80000b68:	1e450513          	add	a0,a0,484 # 80004d48 <rodata_start+0xd48>
    80000b6c:	611000ef          	jal	8000197c <uart_puts>
    80000b70:	00004517          	auipc	a0,0x4
    80000b74:	21050513          	add	a0,a0,528 # 80004d80 <rodata_start+0xd80>
    80000b78:	605000ef          	jal	8000197c <uart_puts>
    80000b7c:	00004517          	auipc	a0,0x4
    80000b80:	23c50513          	add	a0,a0,572 # 80004db8 <rodata_start+0xdb8>
    80000b84:	5f9000ef          	jal	8000197c <uart_puts>
    80000b88:	00004517          	auipc	a0,0x4
    80000b8c:	27050513          	add	a0,a0,624 # 80004df8 <rodata_start+0xdf8>
    80000b90:	5ed000ef          	jal	8000197c <uart_puts>
    80000b94:	00813083          	ld	ra,8(sp)
    80000b98:	00004517          	auipc	a0,0x4
    80000b9c:	74850513          	add	a0,a0,1864 # 800052e0 <rodata_start+0x12e0>
    80000ba0:	01010113          	add	sp,sp,16
    80000ba4:	5d90006f          	j	8000197c <uart_puts>

0000000080000ba8 <demonstrate_page_replacement>:
    80000ba8:	f5010113          	add	sp,sp,-176
    80000bac:	00004517          	auipc	a0,0x4
    80000bb0:	27c50513          	add	a0,a0,636 # 80004e28 <rodata_start+0xe28>
    80000bb4:	0a113423          	sd	ra,168(sp)
    80000bb8:	0a813023          	sd	s0,160(sp)
    80000bbc:	08913c23          	sd	s1,152(sp)
    80000bc0:	09213823          	sd	s2,144(sp)
    80000bc4:	09313423          	sd	s3,136(sp)
    80000bc8:	09413023          	sd	s4,128(sp)
    80000bcc:	07513c23          	sd	s5,120(sp)
    80000bd0:	07613823          	sd	s6,112(sp)
    80000bd4:	07713423          	sd	s7,104(sp)
    80000bd8:	07813023          	sd	s8,96(sp)
    80000bdc:	05913c23          	sd	s9,88(sp)
    80000be0:	05a13823          	sd	s10,80(sp)
    80000be4:	05b13423          	sd	s11,72(sp)
    80000be8:	595000ef          	jal	8000197c <uart_puts>
    80000bec:	00004517          	auipc	a0,0x4
    80000bf0:	26450513          	add	a0,a0,612 # 80004e50 <rodata_start+0xe50>
    80000bf4:	589000ef          	jal	8000197c <uart_puts>
    80000bf8:	161010ef          	jal	80002558 <init_page_replacement>
    80000bfc:	00004517          	auipc	a0,0x4
    80000c00:	27450513          	add	a0,a0,628 # 80004e70 <rodata_start+0xe70>
    80000c04:	579000ef          	jal	8000197c <uart_puts>
    80000c08:	7ed000ef          	jal	80001bf4 <create_pagetable>
    80000c0c:	24050863          	beqz	a0,80000e5c <demonstrate_page_replacement+0x2b4>
    80000c10:	00050b13          	mv	s6,a0
    80000c14:	00004517          	auipc	a0,0x4
    80000c18:	29450513          	add	a0,a0,660 # 80004ea8 <rodata_start+0xea8>
    80000c1c:	561000ef          	jal	8000197c <uart_puts>
    80000c20:	100007b7          	lui	a5,0x10000
    80000c24:	00f13023          	sd	a5,0(sp)
    80000c28:	100017b7          	lui	a5,0x10001
    80000c2c:	00f13423          	sd	a5,8(sp)
    80000c30:	100027b7          	lui	a5,0x10002
    80000c34:	02010913          	add	s2,sp,32
    80000c38:	00010493          	mv	s1,sp
    80000c3c:	00f13823          	sd	a5,16(sp)
    80000c40:	100037b7          	lui	a5,0x10003
    80000c44:	00f13c23          	sd	a5,24(sp)
    80000c48:	04010b93          	add	s7,sp,64
    80000c4c:	00048a93          	mv	s5,s1
    80000c50:	00090a13          	mv	s4,s2
    80000c54:	00004d17          	auipc	s10,0x4
    80000c58:	29cd0d13          	add	s10,s10,668 # 80004ef0 <rodata_start+0xef0>
    80000c5c:	0340006f          	j	80000c90 <demonstrate_page_replacement+0xe8>
    80000c60:	000ab983          	ld	s3,0(s5)
    80000c64:	01600693          	li	a3,22
    80000c68:	000b0513          	mv	a0,s6
    80000c6c:	00098593          	mv	a1,s3
    80000c70:	7b9000ef          	jal	80001c28 <map_page>
    80000c74:	00050413          	mv	s0,a0
    80000c78:	10050e63          	beqz	a0,80000d94 <demonstrate_page_replacement+0x1ec>
    80000c7c:	000d0513          	mv	a0,s10
    80000c80:	4fd000ef          	jal	8000197c <uart_puts>
    80000c84:	008a0a13          	add	s4,s4,8
    80000c88:	008a8a93          	add	s5,s5,8
    80000c8c:	037a0663          	beq	s4,s7,80000cb8 <demonstrate_page_replacement+0x110>
    80000c90:	599000ef          	jal	80001a28 <alloc_page>
    80000c94:	00aa3023          	sd	a0,0(s4)
    80000c98:	00050613          	mv	a2,a0
    80000c9c:	fc0512e3          	bnez	a0,80000c60 <demonstrate_page_replacement+0xb8>
    80000ca0:	00004517          	auipc	a0,0x4
    80000ca4:	26850513          	add	a0,a0,616 # 80004f08 <rodata_start+0xf08>
    80000ca8:	008a0a13          	add	s4,s4,8
    80000cac:	4d1000ef          	jal	8000197c <uart_puts>
    80000cb0:	008a8a93          	add	s5,s5,8
    80000cb4:	fd7a1ee3          	bne	s4,s7,80000c90 <demonstrate_page_replacement+0xe8>
    80000cb8:	00004517          	auipc	a0,0x4
    80000cbc:	27050513          	add	a0,a0,624 # 80004f28 <rodata_start+0xf28>
    80000cc0:	4bd000ef          	jal	8000197c <uart_puts>
    80000cc4:	02048413          	add	s0,s1,32
    80000cc8:	0004b503          	ld	a0,0(s1)
    80000ccc:	00848493          	add	s1,s1,8
    80000cd0:	5b5010ef          	jal	80002a84 <lru_touch_page>
    80000cd4:	fe849ae3          	bne	s1,s0,80000cc8 <demonstrate_page_replacement+0x120>
    80000cd8:	00004517          	auipc	a0,0x4
    80000cdc:	27850513          	add	a0,a0,632 # 80004f50 <rodata_start+0xf50>
    80000ce0:	49d000ef          	jal	8000197c <uart_puts>
    80000ce4:	5c0020ef          	jal	800032a4 <test_page_replacement>
    80000ce8:	00004517          	auipc	a0,0x4
    80000cec:	28850513          	add	a0,a0,648 # 80004f70 <rodata_start+0xf70>
    80000cf0:	48d000ef          	jal	8000197c <uart_puts>
    80000cf4:	100005b7          	lui	a1,0x10000
    80000cf8:	000b0513          	mv	a0,s6
    80000cfc:	29c020ef          	jal	80002f98 <va2pa_with_replacement>
    80000d00:	12051863          	bnez	a0,80000e30 <demonstrate_page_replacement+0x288>
    80000d04:	00004517          	auipc	a0,0x4
    80000d08:	28c50513          	add	a0,a0,652 # 80004f90 <rodata_start+0xf90>
    80000d0c:	471000ef          	jal	8000197c <uart_puts>
    80000d10:	100015b7          	lui	a1,0x10001
    80000d14:	000b0513          	mv	a0,s6
    80000d18:	280020ef          	jal	80002f98 <va2pa_with_replacement>
    80000d1c:	12051863          	bnez	a0,80000e4c <demonstrate_page_replacement+0x2a4>
    80000d20:	00004517          	auipc	a0,0x4
    80000d24:	27050513          	add	a0,a0,624 # 80004f90 <rodata_start+0xf90>
    80000d28:	455000ef          	jal	8000197c <uart_puts>
    80000d2c:	00004517          	auipc	a0,0x4
    80000d30:	2a450513          	add	a0,a0,676 # 80004fd0 <rodata_start+0xfd0>
    80000d34:	449000ef          	jal	8000197c <uart_puts>
    80000d38:	00093503          	ld	a0,0(s2)
    80000d3c:	00890913          	add	s2,s2,8
    80000d40:	0e051463          	bnez	a0,80000e28 <demonstrate_page_replacement+0x280>
    80000d44:	ff791ae3          	bne	s2,s7,80000d38 <demonstrate_page_replacement+0x190>
    80000d48:	000b0513          	mv	a0,s6
    80000d4c:	1a0010ef          	jal	80001eec <destroy_pagetable>
    80000d50:	00004517          	auipc	a0,0x4
    80000d54:	29850513          	add	a0,a0,664 # 80004fe8 <rodata_start+0xfe8>
    80000d58:	0a013403          	ld	s0,160(sp)
    80000d5c:	0a813083          	ld	ra,168(sp)
    80000d60:	09813483          	ld	s1,152(sp)
    80000d64:	09013903          	ld	s2,144(sp)
    80000d68:	08813983          	ld	s3,136(sp)
    80000d6c:	08013a03          	ld	s4,128(sp)
    80000d70:	07813a83          	ld	s5,120(sp)
    80000d74:	07013b03          	ld	s6,112(sp)
    80000d78:	06813b83          	ld	s7,104(sp)
    80000d7c:	06013c03          	ld	s8,96(sp)
    80000d80:	05813c83          	ld	s9,88(sp)
    80000d84:	05013d03          	ld	s10,80(sp)
    80000d88:	04813d83          	ld	s11,72(sp)
    80000d8c:	0b010113          	add	sp,sp,176
    80000d90:	3ed0006f          	j	8000197c <uart_puts>
    80000d94:	00004517          	auipc	a0,0x4
    80000d98:	13450513          	add	a0,a0,308 # 80004ec8 <rodata_start+0xec8>
    80000d9c:	3e1000ef          	jal	8000197c <uart_puts>
    80000da0:	00004517          	auipc	a0,0x4
    80000da4:	84850513          	add	a0,a0,-1976 # 800045e8 <rodata_start+0x5e8>
    80000da8:	3d5000ef          	jal	8000197c <uart_puts>
    80000dac:	03c00d93          	li	s11,60
    80000db0:	00900c93          	li	s9,9
    80000db4:	ffc00c13          	li	s8,-4
    80000db8:	01b9d7b3          	srl	a5,s3,s11
    80000dbc:	00f7f793          	and	a5,a5,15
    80000dc0:	0087e433          	or	s0,a5,s0
    80000dc4:	0004041b          	sext.w	s0,s0
    80000dc8:	02041063          	bnez	s0,80000de8 <demonstrate_page_replacement+0x240>
    80000dcc:	020d8e63          	beqz	s11,80000e08 <demonstrate_page_replacement+0x260>
    80000dd0:	ffcd8d9b          	addw	s11,s11,-4
    80000dd4:	01b9d7b3          	srl	a5,s3,s11
    80000dd8:	00f7f793          	and	a5,a5,15
    80000ddc:	0087e433          	or	s0,a5,s0
    80000de0:	0004041b          	sext.w	s0,s0
    80000de4:	fe0404e3          	beqz	s0,80000dcc <demonstrate_page_replacement+0x224>
    80000de8:	ffcd8d9b          	addw	s11,s11,-4
    80000dec:	03778513          	add	a0,a5,55 # 10003037 <_entry-0x6fffcfc9>
    80000df0:	0ff7f693          	zext.b	a3,a5
    80000df4:	02fcd663          	bge	s9,a5,80000e20 <demonstrate_page_replacement+0x278>
    80000df8:	36d000ef          	jal	80001964 <uart_putc>
    80000dfc:	018d8a63          	beq	s11,s8,80000e10 <demonstrate_page_replacement+0x268>
    80000e00:	00100413          	li	s0,1
    80000e04:	fb5ff06f          	j	80000db8 <demonstrate_page_replacement+0x210>
    80000e08:	03000513          	li	a0,48
    80000e0c:	359000ef          	jal	80001964 <uart_putc>
    80000e10:	00004517          	auipc	a0,0x4
    80000e14:	0d050513          	add	a0,a0,208 # 80004ee0 <rodata_start+0xee0>
    80000e18:	365000ef          	jal	8000197c <uart_puts>
    80000e1c:	e69ff06f          	j	80000c84 <demonstrate_page_replacement+0xdc>
    80000e20:	03068513          	add	a0,a3,48
    80000e24:	fd5ff06f          	j	80000df8 <demonstrate_page_replacement+0x250>
    80000e28:	41d000ef          	jal	80001a44 <free_page>
    80000e2c:	f19ff06f          	j	80000d44 <demonstrate_page_replacement+0x19c>
    80000e30:	00004517          	auipc	a0,0x4
    80000e34:	18050513          	add	a0,a0,384 # 80004fb0 <rodata_start+0xfb0>
    80000e38:	345000ef          	jal	8000197c <uart_puts>
    80000e3c:	100015b7          	lui	a1,0x10001
    80000e40:	000b0513          	mv	a0,s6
    80000e44:	154020ef          	jal	80002f98 <va2pa_with_replacement>
    80000e48:	ec050ce3          	beqz	a0,80000d20 <demonstrate_page_replacement+0x178>
    80000e4c:	00004517          	auipc	a0,0x4
    80000e50:	16450513          	add	a0,a0,356 # 80004fb0 <rodata_start+0xfb0>
    80000e54:	329000ef          	jal	8000197c <uart_puts>
    80000e58:	ed5ff06f          	j	80000d2c <demonstrate_page_replacement+0x184>
    80000e5c:	00004517          	auipc	a0,0x4
    80000e60:	02c50513          	add	a0,a0,44 # 80004e88 <rodata_start+0xe88>
    80000e64:	ef5ff06f          	j	80000d58 <demonstrate_page_replacement+0x1b0>

0000000080000e68 <page_replacement_example>:
    80000e68:	ff010113          	add	sp,sp,-16
    80000e6c:	00004517          	auipc	a0,0x4
    80000e70:	1a450513          	add	a0,a0,420 # 80005010 <rodata_start+0x1010>
    80000e74:	00113423          	sd	ra,8(sp)
    80000e78:	305000ef          	jal	8000197c <uart_puts>
    80000e7c:	c15ff0ef          	jal	80000a90 <print_page_replacement_info>
    80000e80:	d29ff0ef          	jal	80000ba8 <demonstrate_page_replacement>
    80000e84:	420020ef          	jal	800032a4 <test_page_replacement>
    80000e88:	00813083          	ld	ra,8(sp)
    80000e8c:	00004517          	auipc	a0,0x4
    80000e90:	1b450513          	add	a0,a0,436 # 80005040 <rodata_start+0x1040>
    80000e94:	01010113          	add	sp,sp,16
    80000e98:	2e50006f          	j	8000197c <uart_puts>

0000000080000e9c <advanced_page_replacement_example>:
    80000e9c:	ef010113          	add	sp,sp,-272
    80000ea0:	00004517          	auipc	a0,0x4
    80000ea4:	1d050513          	add	a0,a0,464 # 80005070 <rodata_start+0x1070>
    80000ea8:	10113423          	sd	ra,264(sp)
    80000eac:	10813023          	sd	s0,256(sp)
    80000eb0:	0e913c23          	sd	s1,248(sp)
    80000eb4:	0f213823          	sd	s2,240(sp)
    80000eb8:	0f313423          	sd	s3,232(sp)
    80000ebc:	0f413023          	sd	s4,224(sp)
    80000ec0:	0d513c23          	sd	s5,216(sp)
    80000ec4:	0d613823          	sd	s6,208(sp)
    80000ec8:	0d713423          	sd	s7,200(sp)
    80000ecc:	0d813023          	sd	s8,192(sp)
    80000ed0:	0b913c23          	sd	s9,184(sp)
    80000ed4:	0ba13823          	sd	s10,176(sp)
    80000ed8:	2a5000ef          	jal	8000197c <uart_puts>
    80000edc:	519000ef          	jal	80001bf4 <create_pagetable>
    80000ee0:	26050863          	beqz	a0,80001150 <advanced_page_replacement_example+0x2b4>
    80000ee4:	00050493          	mv	s1,a0
    80000ee8:	00004517          	auipc	a0,0x4
    80000eec:	1d850513          	add	a0,a0,472 # 800050c0 <rodata_start+0x10c0>
    80000ef0:	28d000ef          	jal	8000197c <uart_puts>
    80000ef4:	00004797          	auipc	a5,0x4
    80000ef8:	44478793          	add	a5,a5,1092 # 80005338 <long_string>
    80000efc:	1b87b583          	ld	a1,440(a5)
    80000f00:	1c07b603          	ld	a2,448(a5)
    80000f04:	1c87b683          	ld	a3,456(a5)
    80000f08:	1d07b703          	ld	a4,464(a5)
    80000f0c:	1d87b783          	ld	a5,472(a5)
    80000f10:	03010a93          	add	s5,sp,48
    80000f14:	00810913          	add	s2,sp,8
    80000f18:	03200a13          	li	s4,50
    80000f1c:	00b13423          	sd	a1,8(sp)
    80000f20:	00c13823          	sd	a2,16(sp)
    80000f24:	00d13c23          	sd	a3,24(sp)
    80000f28:	02e13023          	sd	a4,32(sp)
    80000f2c:	02f13423          	sd	a5,40(sp)
    80000f30:	4150043b          	negw	s0,s5
    80000f34:	415a0a3b          	subw	s4,s4,s5
    80000f38:	00090993          	mv	s3,s2
    80000f3c:	00004b17          	auipc	s6,0x4
    80000f40:	1ecb0b13          	add	s6,s6,492 # 80005128 <rodata_start+0x1128>
    80000f44:	0180006f          	j	80000f5c <advanced_page_replacement_example+0xc0>
    80000f48:	000b0513          	mv	a0,s6
    80000f4c:	231000ef          	jal	8000197c <uart_puts>
    80000f50:	00a4041b          	addw	s0,s0,10
    80000f54:	00898993          	add	s3,s3,8
    80000f58:	09440063          	beq	s0,s4,80000fd8 <advanced_page_replacement_example+0x13c>
    80000f5c:	2cd000ef          	jal	80001a28 <alloc_page>
    80000f60:	00050613          	mv	a2,a0
    80000f64:	fe0502e3          	beqz	a0,80000f48 <advanced_page_replacement_example+0xac>
    80000f68:	0009bb83          	ld	s7,0(s3)
    80000f6c:	01600693          	li	a3,22
    80000f70:	00048513          	mv	a0,s1
    80000f74:	000b8593          	mv	a1,s7
    80000f78:	4b1000ef          	jal	80001c28 <map_page>
    80000f7c:	fc0516e3          	bnez	a0,80000f48 <advanced_page_replacement_example+0xac>
    80000f80:	03fa8613          	add	a2,s5,63
    80000f84:	000a8713          	mv	a4,s5
    80000f88:	01a00693          	li	a3,26
    80000f8c:	008707bb          	addw	a5,a4,s0
    80000f90:	02d7e7bb          	remw	a5,a5,a3
    80000f94:	00170713          	add	a4,a4,1
    80000f98:	0417879b          	addw	a5,a5,65
    80000f9c:	fef70fa3          	sb	a5,-1(a4)
    80000fa0:	fec716e3          	bne	a4,a2,80000f8c <advanced_page_replacement_example+0xf0>
    80000fa4:	04000693          	li	a3,64
    80000fa8:	000a8613          	mv	a2,s5
    80000fac:	000b8593          	mv	a1,s7
    80000fb0:	00048513          	mv	a0,s1
    80000fb4:	060107a3          	sb	zero,111(sp)
    80000fb8:	0ac020ef          	jal	80003064 <safe_copyout>
    80000fbc:	18051263          	bnez	a0,80001140 <advanced_page_replacement_example+0x2a4>
    80000fc0:	00004517          	auipc	a0,0x4
    80000fc4:	12850513          	add	a0,a0,296 # 800050e8 <rodata_start+0x10e8>
    80000fc8:	00a4041b          	addw	s0,s0,10
    80000fcc:	1b1000ef          	jal	8000197c <uart_puts>
    80000fd0:	00898993          	add	s3,s3,8
    80000fd4:	f94414e3          	bne	s0,s4,80000f5c <advanced_page_replacement_example+0xc0>
    80000fd8:	00004517          	auipc	a0,0x4
    80000fdc:	16850513          	add	a0,a0,360 # 80005140 <rodata_start+0x1140>
    80000fe0:	19d000ef          	jal	8000197c <uart_puts>
    80000fe4:	03100a93          	li	s5,49
    80000fe8:	00004d17          	auipc	s10,0x4
    80000fec:	178d0d13          	add	s10,s10,376 # 80005160 <rodata_start+0x1160>
    80000ff0:	00004b97          	auipc	s7,0x4
    80000ff4:	858b8b93          	add	s7,s7,-1960 # 80004848 <rodata_start+0x848>
    80000ff8:	00004c17          	auipc	s8,0x4
    80000ffc:	180c0c13          	add	s8,s8,384 # 80005178 <rodata_start+0x1178>
    80001000:	03600b13          	li	s6,54
    80001004:	03400c93          	li	s9,52
    80001008:	000d0513          	mv	a0,s10
    8000100c:	171000ef          	jal	8000197c <uart_puts>
    80001010:	000a8513          	mv	a0,s5
    80001014:	151000ef          	jal	80001964 <uart_putc>
    80001018:	000b8513          	mv	a0,s7
    8000101c:	161000ef          	jal	8000197c <uart_puts>
    80001020:	00090993          	mv	s3,s2
    80001024:	03100413          	li	s0,49
    80001028:	0140006f          	j	8000103c <advanced_page_replacement_example+0x1a0>
    8000102c:	0014041b          	addw	s0,s0,1
    80001030:	0ff47413          	zext.b	s0,s0
    80001034:	00898993          	add	s3,s3,8
    80001038:	05640863          	beq	s0,s6,80001088 <advanced_page_replacement_example+0x1ec>
    8000103c:	0009ba03          	ld	s4,0(s3)
    80001040:	04000693          	li	a3,64
    80001044:	07010593          	add	a1,sp,112
    80001048:	000a0613          	mv	a2,s4
    8000104c:	00048513          	mv	a0,s1
    80001050:	15c020ef          	jal	800031ac <safe_copyin>
    80001054:	fc051ce3          	bnez	a0,8000102c <advanced_page_replacement_example+0x190>
    80001058:	000c0513          	mv	a0,s8
    8000105c:	121000ef          	jal	8000197c <uart_puts>
    80001060:	00040513          	mv	a0,s0
    80001064:	101000ef          	jal	80001964 <uart_putc>
    80001068:	000b8513          	mv	a0,s7
    8000106c:	111000ef          	jal	8000197c <uart_puts>
    80001070:	0014041b          	addw	s0,s0,1
    80001074:	000a0513          	mv	a0,s4
    80001078:	0ff47413          	zext.b	s0,s0
    8000107c:	209010ef          	jal	80002a84 <lru_touch_page>
    80001080:	00898993          	add	s3,s3,8
    80001084:	fb641ce3          	bne	s0,s6,8000103c <advanced_page_replacement_example+0x1a0>
    80001088:	001a8a9b          	addw	s5,s5,1
    8000108c:	0ffafa93          	zext.b	s5,s5
    80001090:	f79a9ce3          	bne	s5,s9,80001008 <advanced_page_replacement_example+0x16c>
    80001094:	00004517          	auipc	a0,0x4
    80001098:	10450513          	add	a0,a0,260 # 80005198 <rodata_start+0x1198>
    8000109c:	0e1000ef          	jal	8000197c <uart_puts>
    800010a0:	01890993          	add	s3,s2,24
    800010a4:	00004a17          	auipc	s4,0x4
    800010a8:	13ca0a13          	add	s4,s4,316 # 800051e0 <rodata_start+0x11e0>
    800010ac:	00004417          	auipc	s0,0x4
    800010b0:	10c40413          	add	s0,s0,268 # 800051b8 <rodata_start+0x11b8>
    800010b4:	00093583          	ld	a1,0(s2)
    800010b8:	00048513          	mv	a0,s1
    800010bc:	6dd010ef          	jal	80002f98 <va2pa_with_replacement>
    800010c0:	00050793          	mv	a5,a0
    800010c4:	00040513          	mv	a0,s0
    800010c8:	00079463          	bnez	a5,800010d0 <advanced_page_replacement_example+0x234>
    800010cc:	000a0513          	mv	a0,s4
    800010d0:	00890913          	add	s2,s2,8
    800010d4:	0a9000ef          	jal	8000197c <uart_puts>
    800010d8:	fd299ee3          	bne	s3,s2,800010b4 <advanced_page_replacement_example+0x218>
    800010dc:	00004517          	auipc	a0,0x4
    800010e0:	11c50513          	add	a0,a0,284 # 800051f8 <rodata_start+0x11f8>
    800010e4:	099000ef          	jal	8000197c <uart_puts>
    800010e8:	00048513          	mv	a0,s1
    800010ec:	601000ef          	jal	80001eec <destroy_pagetable>
    800010f0:	00004517          	auipc	a0,0x4
    800010f4:	12050513          	add	a0,a0,288 # 80005210 <rodata_start+0x1210>
    800010f8:	085000ef          	jal	8000197c <uart_puts>
    800010fc:	00004517          	auipc	a0,0x4
    80001100:	13450513          	add	a0,a0,308 # 80005230 <rodata_start+0x1230>
    80001104:	079000ef          	jal	8000197c <uart_puts>
    80001108:	10813083          	ld	ra,264(sp)
    8000110c:	10013403          	ld	s0,256(sp)
    80001110:	0f813483          	ld	s1,248(sp)
    80001114:	0f013903          	ld	s2,240(sp)
    80001118:	0e813983          	ld	s3,232(sp)
    8000111c:	0e013a03          	ld	s4,224(sp)
    80001120:	0d813a83          	ld	s5,216(sp)
    80001124:	0d013b03          	ld	s6,208(sp)
    80001128:	0c813b83          	ld	s7,200(sp)
    8000112c:	0c013c03          	ld	s8,192(sp)
    80001130:	0b813c83          	ld	s9,184(sp)
    80001134:	0b013d03          	ld	s10,176(sp)
    80001138:	11010113          	add	sp,sp,272
    8000113c:	00008067          	ret
    80001140:	00004517          	auipc	a0,0x4
    80001144:	fd050513          	add	a0,a0,-48 # 80005110 <rodata_start+0x1110>
    80001148:	035000ef          	jal	8000197c <uart_puts>
    8000114c:	e05ff06f          	j	80000f50 <advanced_page_replacement_example+0xb4>
    80001150:	10013403          	ld	s0,256(sp)
    80001154:	10813083          	ld	ra,264(sp)
    80001158:	0f813483          	ld	s1,248(sp)
    8000115c:	0f013903          	ld	s2,240(sp)
    80001160:	0e813983          	ld	s3,232(sp)
    80001164:	0e013a03          	ld	s4,224(sp)
    80001168:	0d813a83          	ld	s5,216(sp)
    8000116c:	0d013b03          	ld	s6,208(sp)
    80001170:	0c813b83          	ld	s7,200(sp)
    80001174:	0c013c03          	ld	s8,192(sp)
    80001178:	0b813c83          	ld	s9,184(sp)
    8000117c:	0b013d03          	ld	s10,176(sp)
    80001180:	00004517          	auipc	a0,0x4
    80001184:	f1850513          	add	a0,a0,-232 # 80005098 <rodata_start+0x1098>
    80001188:	11010113          	add	sp,sp,272
    8000118c:	7f00006f          	j	8000197c <uart_puts>

0000000080001190 <main>:
    80001190:	ff010113          	add	sp,sp,-16
    80001194:	00004517          	auipc	a0,0x4
    80001198:	0c450513          	add	a0,a0,196 # 80005258 <rodata_start+0x1258>
    8000119c:	00113423          	sd	ra,8(sp)
    800011a0:	7dc000ef          	jal	8000197c <uart_puts>
    800011a4:	ea1fe0ef          	jal	80000044 <test_virtual_memory>
    800011a8:	8ccff0ef          	jal	80000274 <pmm_test>
    800011ac:	f0dfe0ef          	jal	800000b8 <pt_test>
    800011b0:	b34ff0ef          	jal	800004e4 <test_alloc_pages_pattern>
    800011b4:	00004517          	auipc	a0,0x4
    800011b8:	0bc50513          	add	a0,a0,188 # 80005270 <rodata_start+0x1270>
    800011bc:	7c0000ef          	jal	8000197c <uart_puts>
    800011c0:	00004517          	auipc	a0,0x4
    800011c4:	0e050513          	add	a0,a0,224 # 800052a0 <rodata_start+0x12a0>
    800011c8:	7b4000ef          	jal	8000197c <uart_puts>
    800011cc:	00004517          	auipc	a0,0x4
    800011d0:	10c50513          	add	a0,a0,268 # 800052d8 <rodata_start+0x12d8>
    800011d4:	7a8000ef          	jal	8000197c <uart_puts>
    800011d8:	c91ff0ef          	jal	80000e68 <page_replacement_example>
    800011dc:	cc1ff0ef          	jal	80000e9c <advanced_page_replacement_example>
    800011e0:	00004517          	auipc	a0,0x4
    800011e4:	09050513          	add	a0,a0,144 # 80005270 <rodata_start+0x1270>
    800011e8:	794000ef          	jal	8000197c <uart_puts>
    800011ec:	00004517          	auipc	a0,0x4
    800011f0:	11c50513          	add	a0,a0,284 # 80005308 <rodata_start+0x1308>
    800011f4:	788000ef          	jal	8000197c <uart_puts>
    800011f8:	00004517          	auipc	a0,0x4
    800011fc:	07850513          	add	a0,a0,120 # 80005270 <rodata_start+0x1270>
    80001200:	77c000ef          	jal	8000197c <uart_puts>
    80001204:	0000006f          	j	80001204 <main+0x74>

0000000080001208 <print_number>:
    80001208:	0c050663          	beqz	a0,800012d4 <print_number+0xcc>
    8000120c:	fd010113          	add	sp,sp,-48
    80001210:	02113423          	sd	ra,40(sp)
    80001214:	02813023          	sd	s0,32(sp)
    80001218:	08061a63          	bnez	a2,800012ac <print_number+0xa4>
    8000121c:	0005071b          	sext.w	a4,a0
    80001220:	00000613          	li	a2,0
    80001224:	0005859b          	sext.w	a1,a1
    80001228:	00010fa3          	sb	zero,31(sp)
    8000122c:	01e10813          	add	a6,sp,30
    80001230:	01f00693          	li	a3,31
    80001234:	00004317          	auipc	t1,0x4
    80001238:	53430313          	add	t1,t1,1332 # 80005768 <digits>
    8000123c:	02b777bb          	remuw	a5,a4,a1
    80001240:	fff80813          	add	a6,a6,-1
    80001244:	0007089b          	sext.w	a7,a4
    80001248:	00068e13          	mv	t3,a3
    8000124c:	fff6869b          	addw	a3,a3,-1
    80001250:	02079793          	sll	a5,a5,0x20
    80001254:	0207d793          	srl	a5,a5,0x20
    80001258:	00f307b3          	add	a5,t1,a5
    8000125c:	0007c503          	lbu	a0,0(a5)
    80001260:	02b7573b          	divuw	a4,a4,a1
    80001264:	00a800a3          	sb	a0,1(a6)
    80001268:	fcb8fae3          	bgeu	a7,a1,8000123c <print_number+0x34>
    8000126c:	04060a63          	beqz	a2,800012c0 <print_number+0xb8>
    80001270:	ffee069b          	addw	a3,t3,-2
    80001274:	02068793          	add	a5,a3,32
    80001278:	002787b3          	add	a5,a5,sp
    8000127c:	02d00713          	li	a4,45
    80001280:	fee78023          	sb	a4,-32(a5)
    80001284:	02d00513          	li	a0,45
    80001288:	00d10433          	add	s0,sp,a3
    8000128c:	00140413          	add	s0,s0,1
    80001290:	6d4000ef          	jal	80001964 <uart_putc>
    80001294:	00044503          	lbu	a0,0(s0)
    80001298:	fe051ae3          	bnez	a0,8000128c <print_number+0x84>
    8000129c:	02813083          	ld	ra,40(sp)
    800012a0:	02013403          	ld	s0,32(sp)
    800012a4:	03010113          	add	sp,sp,48
    800012a8:	00008067          	ret
    800012ac:	f60558e3          	bgez	a0,8000121c <print_number+0x14>
    800012b0:	80000737          	lui	a4,0x80000
    800012b4:	f6e508e3          	beq	a0,a4,80001224 <print_number+0x1c>
    800012b8:	40a0073b          	negw	a4,a0
    800012bc:	f69ff06f          	j	80001224 <print_number+0x1c>
    800012c0:	fc0514e3          	bnez	a0,80001288 <print_number+0x80>
    800012c4:	02813083          	ld	ra,40(sp)
    800012c8:	02013403          	ld	s0,32(sp)
    800012cc:	03010113          	add	sp,sp,48
    800012d0:	00008067          	ret
    800012d4:	03000513          	li	a0,48
    800012d8:	68c0006f          	j	80001964 <uart_putc>

00000000800012dc <clear_screen>:
    800012dc:	00004517          	auipc	a0,0x4
    800012e0:	23c50513          	add	a0,a0,572 # 80005518 <long_string+0x1e0>
    800012e4:	6980006f          	j	8000197c <uart_puts>

00000000800012e8 <clear_line>:
    800012e8:	00004517          	auipc	a0,0x4
    800012ec:	23850513          	add	a0,a0,568 # 80005520 <long_string+0x1e8>
    800012f0:	68c0006f          	j	8000197c <uart_puts>

00000000800012f4 <goto_xy>:
    800012f4:	fd010113          	add	sp,sp,-48
    800012f8:	00913c23          	sd	s1,24(sp)
    800012fc:	00050493          	mv	s1,a0
    80001300:	01b00513          	li	a0,27
    80001304:	02113423          	sd	ra,40(sp)
    80001308:	02813023          	sd	s0,32(sp)
    8000130c:	01213823          	sd	s2,16(sp)
    80001310:	00058413          	mv	s0,a1
    80001314:	01313423          	sd	s3,8(sp)
    80001318:	64c000ef          	jal	80001964 <uart_putc>
    8000131c:	05b00513          	li	a0,91
    80001320:	644000ef          	jal	80001964 <uart_putc>
    80001324:	06300793          	li	a5,99
    80001328:	0c87cc63          	blt	a5,s0,80001400 <goto_xy+0x10c>
    8000132c:	00900793          	li	a5,9
    80001330:	0487ce63          	blt	a5,s0,8000138c <goto_xy+0x98>
    80001334:	12805a63          	blez	s0,80001468 <goto_xy+0x174>
    80001338:	0304041b          	addw	s0,s0,48
    8000133c:	0ff47513          	zext.b	a0,s0
    80001340:	624000ef          	jal	80001964 <uart_putc>
    80001344:	03b00513          	li	a0,59
    80001348:	61c000ef          	jal	80001964 <uart_putc>
    8000134c:	06300793          	li	a5,99
    80001350:	0697c863          	blt	a5,s1,800013c0 <goto_xy+0xcc>
    80001354:	00900793          	li	a5,9
    80001358:	0e97c463          	blt	a5,s1,80001440 <goto_xy+0x14c>
    8000135c:	10905c63          	blez	s1,80001474 <goto_xy+0x180>
    80001360:	0304851b          	addw	a0,s1,48
    80001364:	0ff57513          	zext.b	a0,a0
    80001368:	5fc000ef          	jal	80001964 <uart_putc>
    8000136c:	02013403          	ld	s0,32(sp)
    80001370:	02813083          	ld	ra,40(sp)
    80001374:	01813483          	ld	s1,24(sp)
    80001378:	01013903          	ld	s2,16(sp)
    8000137c:	00813983          	ld	s3,8(sp)
    80001380:	04800513          	li	a0,72
    80001384:	03010113          	add	sp,sp,48
    80001388:	5dc0006f          	j	80001964 <uart_putc>
    8000138c:	00a00913          	li	s2,10
    80001390:	0324453b          	divw	a0,s0,s2
    80001394:	0305051b          	addw	a0,a0,48
    80001398:	0ff57513          	zext.b	a0,a0
    8000139c:	5c8000ef          	jal	80001964 <uart_putc>
    800013a0:	0324643b          	remw	s0,s0,s2
    800013a4:	0304041b          	addw	s0,s0,48
    800013a8:	0ff47513          	zext.b	a0,s0
    800013ac:	5b8000ef          	jal	80001964 <uart_putc>
    800013b0:	03b00513          	li	a0,59
    800013b4:	5b0000ef          	jal	80001964 <uart_putc>
    800013b8:	06300793          	li	a5,99
    800013bc:	f897dce3          	bge	a5,s1,80001354 <goto_xy+0x60>
    800013c0:	06400413          	li	s0,100
    800013c4:	0284c53b          	divw	a0,s1,s0
    800013c8:	00a00913          	li	s2,10
    800013cc:	0305051b          	addw	a0,a0,48
    800013d0:	0ff57513          	zext.b	a0,a0
    800013d4:	590000ef          	jal	80001964 <uart_putc>
    800013d8:	0284e53b          	remw	a0,s1,s0
    800013dc:	0325453b          	divw	a0,a0,s2
    800013e0:	0305051b          	addw	a0,a0,48
    800013e4:	0ff57513          	zext.b	a0,a0
    800013e8:	57c000ef          	jal	80001964 <uart_putc>
    800013ec:	0324e53b          	remw	a0,s1,s2
    800013f0:	0305051b          	addw	a0,a0,48
    800013f4:	0ff57513          	zext.b	a0,a0
    800013f8:	56c000ef          	jal	80001964 <uart_putc>
    800013fc:	f71ff06f          	j	8000136c <goto_xy+0x78>
    80001400:	06400913          	li	s2,100
    80001404:	0324453b          	divw	a0,s0,s2
    80001408:	00a00993          	li	s3,10
    8000140c:	0305051b          	addw	a0,a0,48
    80001410:	0ff57513          	zext.b	a0,a0
    80001414:	550000ef          	jal	80001964 <uart_putc>
    80001418:	0324653b          	remw	a0,s0,s2
    8000141c:	0335453b          	divw	a0,a0,s3
    80001420:	0305051b          	addw	a0,a0,48
    80001424:	0ff57513          	zext.b	a0,a0
    80001428:	53c000ef          	jal	80001964 <uart_putc>
    8000142c:	0334643b          	remw	s0,s0,s3
    80001430:	0304041b          	addw	s0,s0,48
    80001434:	0ff47513          	zext.b	a0,s0
    80001438:	52c000ef          	jal	80001964 <uart_putc>
    8000143c:	f09ff06f          	j	80001344 <goto_xy+0x50>
    80001440:	00a00413          	li	s0,10
    80001444:	0284c53b          	divw	a0,s1,s0
    80001448:	0305051b          	addw	a0,a0,48
    8000144c:	0ff57513          	zext.b	a0,a0
    80001450:	514000ef          	jal	80001964 <uart_putc>
    80001454:	0284e53b          	remw	a0,s1,s0
    80001458:	0305051b          	addw	a0,a0,48
    8000145c:	0ff57513          	zext.b	a0,a0
    80001460:	504000ef          	jal	80001964 <uart_putc>
    80001464:	f09ff06f          	j	8000136c <goto_xy+0x78>
    80001468:	03100513          	li	a0,49
    8000146c:	4f8000ef          	jal	80001964 <uart_putc>
    80001470:	ed5ff06f          	j	80001344 <goto_xy+0x50>
    80001474:	03100513          	li	a0,49
    80001478:	4ec000ef          	jal	80001964 <uart_putc>
    8000147c:	ef1ff06f          	j	8000136c <goto_xy+0x78>

0000000080001480 <printf_color>:
    80001480:	f8010113          	add	sp,sp,-128
    80001484:	02913c23          	sd	s1,56(sp)
    80001488:	00050493          	mv	s1,a0
    8000148c:	01b00513          	li	a0,27
    80001490:	06f13423          	sd	a5,104(sp)
    80001494:	04113423          	sd	ra,72(sp)
    80001498:	04813023          	sd	s0,64(sp)
    8000149c:	04c13823          	sd	a2,80(sp)
    800014a0:	04d13c23          	sd	a3,88(sp)
    800014a4:	06e13023          	sd	a4,96(sp)
    800014a8:	07013823          	sd	a6,112(sp)
    800014ac:	07113c23          	sd	a7,120(sp)
    800014b0:	00058413          	mv	s0,a1
    800014b4:	03213823          	sd	s2,48(sp)
    800014b8:	03313423          	sd	s3,40(sp)
    800014bc:	03413023          	sd	s4,32(sp)
    800014c0:	01513c23          	sd	s5,24(sp)
    800014c4:	4a0000ef          	jal	80001964 <uart_putc>
    800014c8:	05b00513          	li	a0,91
    800014cc:	498000ef          	jal	80001964 <uart_putc>
    800014d0:	06300793          	li	a5,99
    800014d4:	1a97e063          	bltu	a5,s1,80001674 <printf_color+0x1f4>
    800014d8:	00900793          	li	a5,9
    800014dc:	1497e663          	bltu	a5,s1,80001628 <printf_color+0x1a8>
    800014e0:	0304851b          	addw	a0,s1,48
    800014e4:	0ff57513          	zext.b	a0,a0
    800014e8:	47c000ef          	jal	80001964 <uart_putc>
    800014ec:	06d00513          	li	a0,109
    800014f0:	474000ef          	jal	80001964 <uart_putc>
    800014f4:	1c040863          	beqz	s0,800016c4 <printf_color+0x244>
    800014f8:	00044503          	lbu	a0,0(s0)
    800014fc:	05010793          	add	a5,sp,80
    80001500:	00f13423          	sd	a5,8(sp)
    80001504:	00000a93          	li	s5,0
    80001508:	06050463          	beqz	a0,80001570 <printf_color+0xf0>
    8000150c:	02500913          	li	s2,37
    80001510:	02000a13          	li	s4,32
    80001514:	00004997          	auipc	s3,0x4
    80001518:	14c98993          	add	s3,s3,332 # 80005660 <long_string+0x328>
    8000151c:	00140493          	add	s1,s0,1
    80001520:	13251863          	bne	a0,s2,80001650 <printf_color+0x1d0>
    80001524:	00144783          	lbu	a5,1(s0)
    80001528:	14078063          	beqz	a5,80001668 <printf_color+0x1e8>
    8000152c:	13278863          	beq	a5,s2,8000165c <printf_color+0x1dc>
    80001530:	fa87879b          	addw	a5,a5,-88
    80001534:	0ff7f793          	zext.b	a5,a5
    80001538:	00fa6c63          	bltu	s4,a5,80001550 <printf_color+0xd0>
    8000153c:	00279793          	sll	a5,a5,0x2
    80001540:	013787b3          	add	a5,a5,s3
    80001544:	0007a783          	lw	a5,0(a5)
    80001548:	013787b3          	add	a5,a5,s3
    8000154c:	00078067          	jr	a5
    80001550:	02500513          	li	a0,37
    80001554:	410000ef          	jal	80001964 <uart_putc>
    80001558:	00144503          	lbu	a0,1(s0)
    8000155c:	ffe00a93          	li	s5,-2
    80001560:	404000ef          	jal	80001964 <uart_putc>
    80001564:	0014c503          	lbu	a0,1(s1)
    80001568:	00148413          	add	s0,s1,1
    8000156c:	fa0518e3          	bnez	a0,8000151c <printf_color+0x9c>
    80001570:	00004517          	auipc	a0,0x4
    80001574:	fc050513          	add	a0,a0,-64 # 80005530 <long_string+0x1f8>
    80001578:	404000ef          	jal	8000197c <uart_puts>
    8000157c:	04813083          	ld	ra,72(sp)
    80001580:	04013403          	ld	s0,64(sp)
    80001584:	03813483          	ld	s1,56(sp)
    80001588:	03013903          	ld	s2,48(sp)
    8000158c:	02813983          	ld	s3,40(sp)
    80001590:	02013a03          	ld	s4,32(sp)
    80001594:	000a8513          	mv	a0,s5
    80001598:	01813a83          	ld	s5,24(sp)
    8000159c:	08010113          	add	sp,sp,128
    800015a0:	00008067          	ret
    800015a4:	00813783          	ld	a5,8(sp)
    800015a8:	00000613          	li	a2,0
    800015ac:	01000593          	li	a1,16
    800015b0:	0007a503          	lw	a0,0(a5)
    800015b4:	00878793          	add	a5,a5,8
    800015b8:	00f13423          	sd	a5,8(sp)
    800015bc:	c4dff0ef          	jal	80001208 <print_number>
    800015c0:	fa5ff06f          	j	80001564 <printf_color+0xe4>
    800015c4:	00813783          	ld	a5,8(sp)
    800015c8:	0007c503          	lbu	a0,0(a5)
    800015cc:	00878793          	add	a5,a5,8
    800015d0:	00f13423          	sd	a5,8(sp)
    800015d4:	390000ef          	jal	80001964 <uart_putc>
    800015d8:	f8dff06f          	j	80001564 <printf_color+0xe4>
    800015dc:	00813783          	ld	a5,8(sp)
    800015e0:	0007b403          	ld	s0,0(a5)
    800015e4:	00878793          	add	a5,a5,8
    800015e8:	00f13423          	sd	a5,8(sp)
    800015ec:	00041863          	bnez	s0,800015fc <printf_color+0x17c>
    800015f0:	0c40006f          	j	800016b4 <printf_color+0x234>
    800015f4:	00140413          	add	s0,s0,1
    800015f8:	36c000ef          	jal	80001964 <uart_putc>
    800015fc:	00044503          	lbu	a0,0(s0)
    80001600:	fe051ae3          	bnez	a0,800015f4 <printf_color+0x174>
    80001604:	f61ff06f          	j	80001564 <printf_color+0xe4>
    80001608:	00813783          	ld	a5,8(sp)
    8000160c:	00100613          	li	a2,1
    80001610:	00a00593          	li	a1,10
    80001614:	0007a503          	lw	a0,0(a5)
    80001618:	00878793          	add	a5,a5,8
    8000161c:	00f13423          	sd	a5,8(sp)
    80001620:	be9ff0ef          	jal	80001208 <print_number>
    80001624:	f41ff06f          	j	80001564 <printf_color+0xe4>
    80001628:	00a00913          	li	s2,10
    8000162c:	0324d53b          	divuw	a0,s1,s2
    80001630:	0305051b          	addw	a0,a0,48
    80001634:	0ff57513          	zext.b	a0,a0
    80001638:	32c000ef          	jal	80001964 <uart_putc>
    8000163c:	0324f53b          	remuw	a0,s1,s2
    80001640:	0305051b          	addw	a0,a0,48
    80001644:	07f57513          	and	a0,a0,127
    80001648:	31c000ef          	jal	80001964 <uart_putc>
    8000164c:	ea1ff06f          	j	800014ec <printf_color+0x6c>
    80001650:	314000ef          	jal	80001964 <uart_putc>
    80001654:	00040493          	mv	s1,s0
    80001658:	f0dff06f          	j	80001564 <printf_color+0xe4>
    8000165c:	02500513          	li	a0,37
    80001660:	304000ef          	jal	80001964 <uart_putc>
    80001664:	f01ff06f          	j	80001564 <printf_color+0xe4>
    80001668:	02500513          	li	a0,37
    8000166c:	2f8000ef          	jal	80001964 <uart_putc>
    80001670:	f01ff06f          	j	80001570 <printf_color+0xf0>
    80001674:	06400913          	li	s2,100
    80001678:	0324d53b          	divuw	a0,s1,s2
    8000167c:	00a00993          	li	s3,10
    80001680:	0305051b          	addw	a0,a0,48
    80001684:	0ff57513          	zext.b	a0,a0
    80001688:	2dc000ef          	jal	80001964 <uart_putc>
    8000168c:	0324f53b          	remuw	a0,s1,s2
    80001690:	0335553b          	divuw	a0,a0,s3
    80001694:	0305051b          	addw	a0,a0,48
    80001698:	0ff57513          	zext.b	a0,a0
    8000169c:	2c8000ef          	jal	80001964 <uart_putc>
    800016a0:	0334f53b          	remuw	a0,s1,s3
    800016a4:	0305051b          	addw	a0,a0,48
    800016a8:	07f57513          	and	a0,a0,127
    800016ac:	2b8000ef          	jal	80001964 <uart_putc>
    800016b0:	e3dff06f          	j	800014ec <printf_color+0x6c>
    800016b4:	00004517          	auipc	a0,0x4
    800016b8:	e7450513          	add	a0,a0,-396 # 80005528 <long_string+0x1f0>
    800016bc:	2c0000ef          	jal	8000197c <uart_puts>
    800016c0:	ea5ff06f          	j	80001564 <printf_color+0xe4>
    800016c4:	fff00a93          	li	s5,-1
    800016c8:	eb5ff06f          	j	8000157c <printf_color+0xfc>

00000000800016cc <printf>:
    800016cc:	f7010113          	add	sp,sp,-144
    800016d0:	04113423          	sd	ra,72(sp)
    800016d4:	04813023          	sd	s0,64(sp)
    800016d8:	02913c23          	sd	s1,56(sp)
    800016dc:	03213823          	sd	s2,48(sp)
    800016e0:	03313423          	sd	s3,40(sp)
    800016e4:	03413023          	sd	s4,32(sp)
    800016e8:	01513c23          	sd	s5,24(sp)
    800016ec:	04b13c23          	sd	a1,88(sp)
    800016f0:	06c13023          	sd	a2,96(sp)
    800016f4:	06d13423          	sd	a3,104(sp)
    800016f8:	06e13823          	sd	a4,112(sp)
    800016fc:	06f13c23          	sd	a5,120(sp)
    80001700:	09013023          	sd	a6,128(sp)
    80001704:	09113423          	sd	a7,136(sp)
    80001708:	16050063          	beqz	a0,80001868 <printf+0x19c>
    8000170c:	00050413          	mv	s0,a0
    80001710:	00054503          	lbu	a0,0(a0)
    80001714:	05810793          	add	a5,sp,88
    80001718:	00f13423          	sd	a5,8(sp)
    8000171c:	00000a93          	li	s5,0
    80001720:	06050463          	beqz	a0,80001788 <printf+0xbc>
    80001724:	02500913          	li	s2,37
    80001728:	02000a13          	li	s4,32
    8000172c:	00004997          	auipc	s3,0x4
    80001730:	fb898993          	add	s3,s3,-72 # 800056e4 <long_string+0x3ac>
    80001734:	00140493          	add	s1,s0,1
    80001738:	0f251e63          	bne	a0,s2,80001834 <printf+0x168>
    8000173c:	00144783          	lbu	a5,1(s0)
    80001740:	10078663          	beqz	a5,8000184c <printf+0x180>
    80001744:	0f278e63          	beq	a5,s2,80001840 <printf+0x174>
    80001748:	fa87879b          	addw	a5,a5,-88
    8000174c:	0ff7f793          	zext.b	a5,a5
    80001750:	00fa6c63          	bltu	s4,a5,80001768 <printf+0x9c>
    80001754:	00279793          	sll	a5,a5,0x2
    80001758:	013787b3          	add	a5,a5,s3
    8000175c:	0007a783          	lw	a5,0(a5)
    80001760:	013787b3          	add	a5,a5,s3
    80001764:	00078067          	jr	a5
    80001768:	02500513          	li	a0,37
    8000176c:	1f8000ef          	jal	80001964 <uart_putc>
    80001770:	00144503          	lbu	a0,1(s0)
    80001774:	ffe00a93          	li	s5,-2
    80001778:	1ec000ef          	jal	80001964 <uart_putc>
    8000177c:	0014c503          	lbu	a0,1(s1)
    80001780:	00148413          	add	s0,s1,1
    80001784:	fa0518e3          	bnez	a0,80001734 <printf+0x68>
    80001788:	04813083          	ld	ra,72(sp)
    8000178c:	04013403          	ld	s0,64(sp)
    80001790:	03813483          	ld	s1,56(sp)
    80001794:	03013903          	ld	s2,48(sp)
    80001798:	02813983          	ld	s3,40(sp)
    8000179c:	02013a03          	ld	s4,32(sp)
    800017a0:	000a8513          	mv	a0,s5
    800017a4:	01813a83          	ld	s5,24(sp)
    800017a8:	09010113          	add	sp,sp,144
    800017ac:	00008067          	ret
    800017b0:	00813783          	ld	a5,8(sp)
    800017b4:	00000613          	li	a2,0
    800017b8:	01000593          	li	a1,16
    800017bc:	0007a503          	lw	a0,0(a5)
    800017c0:	00878793          	add	a5,a5,8
    800017c4:	00f13423          	sd	a5,8(sp)
    800017c8:	a41ff0ef          	jal	80001208 <print_number>
    800017cc:	fb1ff06f          	j	8000177c <printf+0xb0>
    800017d0:	00813783          	ld	a5,8(sp)
    800017d4:	0007c503          	lbu	a0,0(a5)
    800017d8:	00878793          	add	a5,a5,8
    800017dc:	00f13423          	sd	a5,8(sp)
    800017e0:	184000ef          	jal	80001964 <uart_putc>
    800017e4:	f99ff06f          	j	8000177c <printf+0xb0>
    800017e8:	00813783          	ld	a5,8(sp)
    800017ec:	0007b403          	ld	s0,0(a5)
    800017f0:	00878793          	add	a5,a5,8
    800017f4:	00f13423          	sd	a5,8(sp)
    800017f8:	00041863          	bnez	s0,80001808 <printf+0x13c>
    800017fc:	05c0006f          	j	80001858 <printf+0x18c>
    80001800:	00140413          	add	s0,s0,1
    80001804:	160000ef          	jal	80001964 <uart_putc>
    80001808:	00044503          	lbu	a0,0(s0)
    8000180c:	fe051ae3          	bnez	a0,80001800 <printf+0x134>
    80001810:	f6dff06f          	j	8000177c <printf+0xb0>
    80001814:	00813783          	ld	a5,8(sp)
    80001818:	00100613          	li	a2,1
    8000181c:	00a00593          	li	a1,10
    80001820:	0007a503          	lw	a0,0(a5)
    80001824:	00878793          	add	a5,a5,8
    80001828:	00f13423          	sd	a5,8(sp)
    8000182c:	9ddff0ef          	jal	80001208 <print_number>
    80001830:	f4dff06f          	j	8000177c <printf+0xb0>
    80001834:	130000ef          	jal	80001964 <uart_putc>
    80001838:	00040493          	mv	s1,s0
    8000183c:	f41ff06f          	j	8000177c <printf+0xb0>
    80001840:	02500513          	li	a0,37
    80001844:	120000ef          	jal	80001964 <uart_putc>
    80001848:	f35ff06f          	j	8000177c <printf+0xb0>
    8000184c:	02500513          	li	a0,37
    80001850:	114000ef          	jal	80001964 <uart_putc>
    80001854:	f35ff06f          	j	80001788 <printf+0xbc>
    80001858:	00004517          	auipc	a0,0x4
    8000185c:	cd050513          	add	a0,a0,-816 # 80005528 <long_string+0x1f0>
    80001860:	11c000ef          	jal	8000197c <uart_puts>
    80001864:	f19ff06f          	j	8000177c <printf+0xb0>
    80001868:	fff00a93          	li	s5,-1
    8000186c:	f1dff06f          	j	80001788 <printf+0xbc>

0000000080001870 <test_printf_basic>:
    80001870:	ff010113          	add	sp,sp,-16
    80001874:	02a00593          	li	a1,42
    80001878:	00004517          	auipc	a0,0x4
    8000187c:	cc050513          	add	a0,a0,-832 # 80005538 <long_string+0x200>
    80001880:	00113423          	sd	ra,8(sp)
    80001884:	e49ff0ef          	jal	800016cc <printf>
    80001888:	f8500593          	li	a1,-123
    8000188c:	00004517          	auipc	a0,0x4
    80001890:	cc450513          	add	a0,a0,-828 # 80005550 <long_string+0x218>
    80001894:	e39ff0ef          	jal	800016cc <printf>
    80001898:	00000593          	li	a1,0
    8000189c:	00004517          	auipc	a0,0x4
    800018a0:	ccc50513          	add	a0,a0,-820 # 80005568 <long_string+0x230>
    800018a4:	e29ff0ef          	jal	800016cc <printf>
    800018a8:	000015b7          	lui	a1,0x1
    800018ac:	abc58593          	add	a1,a1,-1348 # abc <_entry-0x7ffff544>
    800018b0:	00004517          	auipc	a0,0x4
    800018b4:	cd050513          	add	a0,a0,-816 # 80005580 <long_string+0x248>
    800018b8:	e15ff0ef          	jal	800016cc <printf>
    800018bc:	00004597          	auipc	a1,0x4
    800018c0:	cdc58593          	add	a1,a1,-804 # 80005598 <long_string+0x260>
    800018c4:	00004517          	auipc	a0,0x4
    800018c8:	cdc50513          	add	a0,a0,-804 # 800055a0 <long_string+0x268>
    800018cc:	e01ff0ef          	jal	800016cc <printf>
    800018d0:	05800593          	li	a1,88
    800018d4:	00004517          	auipc	a0,0x4
    800018d8:	ce450513          	add	a0,a0,-796 # 800055b8 <long_string+0x280>
    800018dc:	df1ff0ef          	jal	800016cc <printf>
    800018e0:	00813083          	ld	ra,8(sp)
    800018e4:	00004517          	auipc	a0,0x4
    800018e8:	cec50513          	add	a0,a0,-788 # 800055d0 <long_string+0x298>
    800018ec:	01010113          	add	sp,sp,16
    800018f0:	dddff06f          	j	800016cc <printf>

00000000800018f4 <test_printf_edge_cases>:
    800018f4:	800005b7          	lui	a1,0x80000
    800018f8:	ff010113          	add	sp,sp,-16
    800018fc:	fff5c593          	not	a1,a1
    80001900:	00004517          	auipc	a0,0x4
    80001904:	ce850513          	add	a0,a0,-792 # 800055e8 <long_string+0x2b0>
    80001908:	00113423          	sd	ra,8(sp)
    8000190c:	dc1ff0ef          	jal	800016cc <printf>
    80001910:	800005b7          	lui	a1,0x80000
    80001914:	00004517          	auipc	a0,0x4
    80001918:	ce450513          	add	a0,a0,-796 # 800055f8 <long_string+0x2c0>
    8000191c:	db1ff0ef          	jal	800016cc <printf>
    80001920:	00000593          	li	a1,0
    80001924:	00004517          	auipc	a0,0x4
    80001928:	ce450513          	add	a0,a0,-796 # 80005608 <long_string+0x2d0>
    8000192c:	da1ff0ef          	jal	800016cc <printf>
    80001930:	00003597          	auipc	a1,0x3
    80001934:	70858593          	add	a1,a1,1800 # 80005038 <rodata_start+0x1038>
    80001938:	00004517          	auipc	a0,0x4
    8000193c:	ce850513          	add	a0,a0,-792 # 80005620 <long_string+0x2e8>
    80001940:	d8dff0ef          	jal	800016cc <printf>
    80001944:	00004517          	auipc	a0,0x4
    80001948:	cf450513          	add	a0,a0,-780 # 80005638 <long_string+0x300>
    8000194c:	d81ff0ef          	jal	800016cc <printf>
    80001950:	00813083          	ld	ra,8(sp)
    80001954:	00004517          	auipc	a0,0x4
    80001958:	cf450513          	add	a0,a0,-780 # 80005648 <long_string+0x310>
    8000195c:	01010113          	add	sp,sp,16
    80001960:	d6dff06f          	j	800016cc <printf>

0000000080001964 <uart_putc>:
    80001964:	10000737          	lui	a4,0x10000
    80001968:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000196c:	0207f793          	and	a5,a5,32
    80001970:	fe078ce3          	beqz	a5,80001968 <uart_putc+0x4>
    80001974:	00a70023          	sb	a0,0(a4)
    80001978:	00008067          	ret

000000008000197c <uart_puts>:
    8000197c:	00054683          	lbu	a3,0(a0)
    80001980:	02068263          	beqz	a3,800019a4 <uart_puts+0x28>
    80001984:	10000737          	lui	a4,0x10000
    80001988:	00150513          	add	a0,a0,1
    8000198c:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80001990:	0207f793          	and	a5,a5,32
    80001994:	fe078ce3          	beqz	a5,8000198c <uart_puts+0x10>
    80001998:	00d70023          	sb	a3,0(a4)
    8000199c:	00054683          	lbu	a3,0(a0)
    800019a0:	fe0694e3          	bnez	a3,80001988 <uart_puts+0xc>
    800019a4:	00008067          	ret

00000000800019a8 <pmm_init>:
    800019a8:	000017b7          	lui	a5,0x1
    800019ac:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    800019b0:	00f50533          	add	a0,a0,a5
    800019b4:	fffff737          	lui	a4,0xfffff
    800019b8:	00e57533          	and	a0,a0,a4
    800019bc:	00e5f5b3          	and	a1,a1,a4
    800019c0:	00412797          	auipc	a5,0x412
    800019c4:	6ea7b823          	sd	a0,1776(a5) # 804140b0 <mem_start>
    800019c8:	00412797          	auipc	a5,0x412
    800019cc:	6eb7b023          	sd	a1,1760(a5) # 804140a8 <mem_end>
    800019d0:	00412797          	auipc	a5,0x412
    800019d4:	6e07b423          	sd	zero,1768(a5) # 804140b8 <freelist>
    800019d8:	02b57e63          	bgeu	a0,a1,80001a14 <pmm_init+0x6c>
    800019dc:	02050e63          	beqz	a0,80001a18 <pmm_init+0x70>
    800019e0:	00050793          	mv	a5,a0
    800019e4:	00000613          	li	a2,0
    800019e8:	00000693          	li	a3,0
    800019ec:	00a7e863          	bltu	a5,a0,800019fc <pmm_init+0x54>
    800019f0:	00d7b023          	sd	a3,0(a5)
    800019f4:	00100613          	li	a2,1
    800019f8:	00078693          	mv	a3,a5
    800019fc:	00001737          	lui	a4,0x1
    80001a00:	00e787b3          	add	a5,a5,a4
    80001a04:	feb7e4e3          	bltu	a5,a1,800019ec <pmm_init+0x44>
    80001a08:	00060663          	beqz	a2,80001a14 <pmm_init+0x6c>
    80001a0c:	00412797          	auipc	a5,0x412
    80001a10:	6ad7b623          	sd	a3,1708(a5) # 804140b8 <freelist>
    80001a14:	00008067          	ret
    80001a18:	00000793          	li	a5,0
    80001a1c:	00000613          	li	a2,0
    80001a20:	00000693          	li	a3,0
    80001a24:	fd9ff06f          	j	800019fc <pmm_init+0x54>

0000000080001a28 <alloc_page>:
    80001a28:	00412797          	auipc	a5,0x412
    80001a2c:	69078793          	add	a5,a5,1680 # 804140b8 <freelist>
    80001a30:	0007b503          	ld	a0,0(a5)
    80001a34:	00050663          	beqz	a0,80001a40 <alloc_page+0x18>
    80001a38:	00053703          	ld	a4,0(a0)
    80001a3c:	00e7b023          	sd	a4,0(a5)
    80001a40:	00008067          	ret

0000000080001a44 <free_page>:
    80001a44:	02050c63          	beqz	a0,80001a7c <free_page+0x38>
    80001a48:	00412797          	auipc	a5,0x412
    80001a4c:	6687b783          	ld	a5,1640(a5) # 804140b0 <mem_start>
    80001a50:	02f56663          	bltu	a0,a5,80001a7c <free_page+0x38>
    80001a54:	00412797          	auipc	a5,0x412
    80001a58:	6547b783          	ld	a5,1620(a5) # 804140a8 <mem_end>
    80001a5c:	02f57063          	bgeu	a0,a5,80001a7c <free_page+0x38>
    80001a60:	03451793          	sll	a5,a0,0x34
    80001a64:	00079c63          	bnez	a5,80001a7c <free_page+0x38>
    80001a68:	00412797          	auipc	a5,0x412
    80001a6c:	65078793          	add	a5,a5,1616 # 804140b8 <freelist>
    80001a70:	0007b703          	ld	a4,0(a5)
    80001a74:	00a7b023          	sd	a0,0(a5)
    80001a78:	00e53023          	sd	a4,0(a0)
    80001a7c:	00008067          	ret

0000000080001a80 <alloc_pages>:
    80001a80:	00050613          	mv	a2,a0
    80001a84:	08a05863          	blez	a0,80001b14 <alloc_pages+0x94>
    80001a88:	00412317          	auipc	t1,0x412
    80001a8c:	63030313          	add	t1,t1,1584 # 804140b8 <freelist>
    80001a90:	00100793          	li	a5,1
    80001a94:	00033803          	ld	a6,0(t1)
    80001a98:	06f50463          	beq	a0,a5,80001b00 <alloc_pages+0x80>
    80001a9c:	06080c63          	beqz	a6,80001b14 <alloc_pages+0x94>
    80001aa0:	00083503          	ld	a0,0(a6)
    80001aa4:	00080793          	mv	a5,a6
    80001aa8:	00100713          	li	a4,1
    80001aac:	00000893          	li	a7,0
    80001ab0:	000015b7          	lui	a1,0x1
    80001ab4:	0200006f          	j	80001ad4 <alloc_pages+0x54>
    80001ab8:	02d50463          	beq	a0,a3,80001ae0 <alloc_pages+0x60>
    80001abc:	00053683          	ld	a3,0(a0)
    80001ac0:	00078893          	mv	a7,a5
    80001ac4:	00050813          	mv	a6,a0
    80001ac8:	00100713          	li	a4,1
    80001acc:	00050793          	mv	a5,a0
    80001ad0:	00068513          	mv	a0,a3
    80001ad4:	00b786b3          	add	a3,a5,a1
    80001ad8:	fe0510e3          	bnez	a0,80001ab8 <alloc_pages+0x38>
    80001adc:	00008067          	ret
    80001ae0:	0017071b          	addw	a4,a4,1 # 1001 <_entry-0x7fffefff>
    80001ae4:	00053683          	ld	a3,0(a0)
    80001ae8:	fee612e3          	bne	a2,a4,80001acc <alloc_pages+0x4c>
    80001aec:	02088863          	beqz	a7,80001b1c <alloc_pages+0x9c>
    80001af0:	00d8b023          	sd	a3,0(a7)
    80001af4:	00053023          	sd	zero,0(a0)
    80001af8:	00080513          	mv	a0,a6
    80001afc:	00008067          	ret
    80001b00:	00080663          	beqz	a6,80001b0c <alloc_pages+0x8c>
    80001b04:	00083783          	ld	a5,0(a6)
    80001b08:	00f33023          	sd	a5,0(t1)
    80001b0c:	00080513          	mv	a0,a6
    80001b10:	00008067          	ret
    80001b14:	00000513          	li	a0,0
    80001b18:	00008067          	ret
    80001b1c:	00053023          	sd	zero,0(a0)
    80001b20:	00d33023          	sd	a3,0(t1)
    80001b24:	00080513          	mv	a0,a6
    80001b28:	00008067          	ret

0000000080001b2c <walk_lookup>:
    80001b2c:	01e5d793          	srl	a5,a1,0x1e
    80001b30:	1ff7f793          	and	a5,a5,511
    80001b34:	00379793          	sll	a5,a5,0x3
    80001b38:	00f50533          	add	a0,a0,a5
    80001b3c:	00053703          	ld	a4,0(a0)
    80001b40:	00177793          	and	a5,a4,1
    80001b44:	04078a63          	beqz	a5,80001b98 <walk_lookup+0x6c>
    80001b48:	00e77793          	and	a5,a4,14
    80001b4c:	04079663          	bnez	a5,80001b98 <walk_lookup+0x6c>
    80001b50:	0155d793          	srl	a5,a1,0x15
    80001b54:	00a75713          	srl	a4,a4,0xa
    80001b58:	1ff7f793          	and	a5,a5,511
    80001b5c:	00c71713          	sll	a4,a4,0xc
    80001b60:	00379793          	sll	a5,a5,0x3
    80001b64:	00e787b3          	add	a5,a5,a4
    80001b68:	0007b503          	ld	a0,0(a5)
    80001b6c:	00157793          	and	a5,a0,1
    80001b70:	02078463          	beqz	a5,80001b98 <walk_lookup+0x6c>
    80001b74:	00e57793          	and	a5,a0,14
    80001b78:	02079063          	bnez	a5,80001b98 <walk_lookup+0x6c>
    80001b7c:	00c5d593          	srl	a1,a1,0xc
    80001b80:	00a55513          	srl	a0,a0,0xa
    80001b84:	1ff5f593          	and	a1,a1,511
    80001b88:	00359593          	sll	a1,a1,0x3
    80001b8c:	00c51513          	sll	a0,a0,0xc
    80001b90:	00b50533          	add	a0,a0,a1
    80001b94:	00008067          	ret
    80001b98:	00000513          	li	a0,0
    80001b9c:	00008067          	ret

0000000080001ba0 <free_swap_slot.part.0>:
    80001ba0:	0055579b          	srlw	a5,a0,0x5
    80001ba4:	0000f617          	auipc	a2,0xf
    80001ba8:	45c60613          	add	a2,a2,1116 # 80011000 <swap_mgr>
    80001bac:	00279793          	sll	a5,a5,0x2
    80001bb0:	00f607b3          	add	a5,a2,a5
    80001bb4:	0007a583          	lw	a1,0(a5)
    80001bb8:	00100713          	li	a4,1
    80001bbc:	00a7173b          	sllw	a4,a4,a0
    80001bc0:	00e5f6b3          	and	a3,a1,a4
    80001bc4:	0006869b          	sext.w	a3,a3
    80001bc8:	02068463          	beqz	a3,80001bf0 <free_swap_slot.part.0+0x50>
    80001bcc:	08862683          	lw	a3,136(a2)
    80001bd0:	fff74713          	not	a4,a4
    80001bd4:	08062803          	lw	a6,128(a2)
    80001bd8:	00e5f5b3          	and	a1,a1,a4
    80001bdc:	fff6871b          	addw	a4,a3,-1
    80001be0:	00b7a023          	sw	a1,0(a5)
    80001be4:	08e62423          	sw	a4,136(a2)
    80001be8:	01057463          	bgeu	a0,a6,80001bf0 <free_swap_slot.part.0+0x50>
    80001bec:	08a62023          	sw	a0,128(a2)
    80001bf0:	00008067          	ret

0000000080001bf4 <create_pagetable>:
    80001bf4:	ff010113          	add	sp,sp,-16
    80001bf8:	00113423          	sd	ra,8(sp)
    80001bfc:	e2dff0ef          	jal	80001a28 <alloc_page>
    80001c00:	00050e63          	beqz	a0,80001c1c <create_pagetable+0x28>
    80001c04:	00001737          	lui	a4,0x1
    80001c08:	00050793          	mv	a5,a0
    80001c0c:	00e50733          	add	a4,a0,a4
    80001c10:	0007b023          	sd	zero,0(a5)
    80001c14:	00878793          	add	a5,a5,8
    80001c18:	fee79ce3          	bne	a5,a4,80001c10 <create_pagetable+0x1c>
    80001c1c:	00813083          	ld	ra,8(sp)
    80001c20:	01010113          	add	sp,sp,16
    80001c24:	00008067          	ret

0000000080001c28 <map_page>:
    80001c28:	00c5e7b3          	or	a5,a1,a2
    80001c2c:	03479713          	sll	a4,a5,0x34
    80001c30:	20071863          	bnez	a4,80001e40 <map_page+0x218>
    80001c34:	fc010113          	add	sp,sp,-64
    80001c38:	02913423          	sd	s1,40(sp)
    80001c3c:	03213023          	sd	s2,32(sp)
    80001c40:	01313c23          	sd	s3,24(sp)
    80001c44:	01413823          	sd	s4,16(sp)
    80001c48:	01513423          	sd	s5,8(sp)
    80001c4c:	01613023          	sd	s6,0(sp)
    80001c50:	02113c23          	sd	ra,56(sp)
    80001c54:	02813823          	sd	s0,48(sp)
    80001c58:	00058493          	mv	s1,a1
    80001c5c:	00060913          	mv	s2,a2
    80001c60:	00050a13          	mv	s4,a0
    80001c64:	00068993          	mv	s3,a3
    80001c68:	00050813          	mv	a6,a0
    80001c6c:	00200a93          	li	s5,2
    80001c70:	00200793          	li	a5,2
    80001c74:	00100b13          	li	s6,1
    80001c78:	0037941b          	sllw	s0,a5,0x3
    80001c7c:	00f4043b          	addw	s0,s0,a5
    80001c80:	00c4041b          	addw	s0,s0,12
    80001c84:	0084d433          	srl	s0,s1,s0
    80001c88:	1ff47413          	and	s0,s0,511
    80001c8c:	00341413          	sll	s0,s0,0x3
    80001c90:	00880433          	add	s0,a6,s0
    80001c94:	00043783          	ld	a5,0(s0)
    80001c98:	0017f713          	and	a4,a5,1
    80001c9c:	14070e63          	beqz	a4,80001df8 <map_page+0x1d0>
    80001ca0:	00e7f713          	and	a4,a5,14
    80001ca4:	18071a63          	bnez	a4,80001e38 <map_page+0x210>
    80001ca8:	00a7d793          	srl	a5,a5,0xa
    80001cac:	00c79813          	sll	a6,a5,0xc
    80001cb0:	00100793          	li	a5,1
    80001cb4:	016a8663          	beq	s5,s6,80001cc0 <map_page+0x98>
    80001cb8:	00100a93          	li	s5,1
    80001cbc:	fbdff06f          	j	80001c78 <map_page+0x50>
    80001cc0:	00c4d793          	srl	a5,s1,0xc
    80001cc4:	1ff7f793          	and	a5,a5,511
    80001cc8:	00379793          	sll	a5,a5,0x3
    80001ccc:	00f80833          	add	a6,a6,a5
    80001cd0:	16080463          	beqz	a6,80001e38 <map_page+0x210>
    80001cd4:	00083783          	ld	a5,0(a6)
    80001cd8:	0017f793          	and	a5,a5,1
    80001cdc:	14079e63          	bnez	a5,80001e38 <map_page+0x210>
    80001ce0:	00c95793          	srl	a5,s2,0xc
    80001ce4:	00a79793          	sll	a5,a5,0xa
    80001ce8:	00412597          	auipc	a1,0x412
    80001cec:	3a858593          	add	a1,a1,936 # 80414090 <lru_mgr+0x3000>
    80001cf0:	0145a703          	lw	a4,20(a1)
    80001cf4:	0137e7b3          	or	a5,a5,s3
    80001cf8:	0017e793          	or	a5,a5,1
    80001cfc:	00f83023          	sd	a5,0(a6)
    80001d00:	0c070663          	beqz	a4,80001dcc <map_page+0x1a4>
    80001d04:	0040f717          	auipc	a4,0x40f
    80001d08:	3b070713          	add	a4,a4,944 # 804110b4 <lru_mgr+0x24>
    80001d0c:	00000793          	li	a5,0
    80001d10:	10000693          	li	a3,256
    80001d14:	00c0006f          	j	80001d20 <map_page+0xf8>
    80001d18:	0017879b          	addw	a5,a5,1
    80001d1c:	0ad78863          	beq	a5,a3,80001dcc <map_page+0x1a4>
    80001d20:	00072803          	lw	a6,0(a4)
    80001d24:	03070713          	add	a4,a4,48
    80001d28:	fe0818e3          	bnez	a6,80001d18 <map_page+0xf0>
    80001d2c:	00178813          	add	a6,a5,1
    80001d30:	00181513          	sll	a0,a6,0x1
    80001d34:	00179713          	sll	a4,a5,0x1
    80001d38:	01050533          	add	a0,a0,a6
    80001d3c:	0040f617          	auipc	a2,0x40f
    80001d40:	35460613          	add	a2,a2,852 # 80411090 <lru_mgr>
    80001d44:	00f706b3          	add	a3,a4,a5
    80001d48:	00451513          	sll	a0,a0,0x4
    80001d4c:	00469693          	sll	a3,a3,0x4
    80001d50:	00a60533          	add	a0,a2,a0
    80001d54:	fffff337          	lui	t1,0xfffff
    80001d58:	00d608b3          	add	a7,a2,a3
    80001d5c:	0064f4b3          	and	s1,s1,t1
    80001d60:	01453423          	sd	s4,8(a0)
    80001d64:	fff00513          	li	a0,-1
    80001d68:	01068693          	add	a3,a3,16
    80001d6c:	0098b823          	sd	s1,16(a7)
    80001d70:	0128bc23          	sd	s2,24(a7)
    80001d74:	02a8a023          	sw	a0,32(a7)
    80001d78:	0049f993          	and	s3,s3,4
    80001d7c:	00d606b3          	add	a3,a2,a3
    80001d80:	00098463          	beqz	s3,80001d88 <map_page+0x160>
    80001d84:	00500a93          	li	s5,5
    80001d88:	00181513          	sll	a0,a6,0x1
    80001d8c:	00f707b3          	add	a5,a4,a5
    80001d90:	00063883          	ld	a7,0(a2)
    80001d94:	01050733          	add	a4,a0,a6
    80001d98:	00479793          	sll	a5,a5,0x4
    80001d9c:	00471713          	sll	a4,a4,0x4
    80001da0:	00f607b3          	add	a5,a2,a5
    80001da4:	00e60733          	add	a4,a2,a4
    80001da8:	0357a223          	sw	s5,36(a5)
    80001dac:	01173023          	sd	a7,0(a4)
    80001db0:	0207b423          	sd	zero,40(a5)
    80001db4:	06088e63          	beqz	a7,80001e30 <map_page+0x208>
    80001db8:	00d8bc23          	sd	a3,24(a7)
    80001dbc:	0105a783          	lw	a5,16(a1)
    80001dc0:	00d63023          	sd	a3,0(a2)
    80001dc4:	0017879b          	addw	a5,a5,1
    80001dc8:	00f5a823          	sw	a5,16(a1)
    80001dcc:	00000513          	li	a0,0
    80001dd0:	03813083          	ld	ra,56(sp)
    80001dd4:	03013403          	ld	s0,48(sp)
    80001dd8:	02813483          	ld	s1,40(sp)
    80001ddc:	02013903          	ld	s2,32(sp)
    80001de0:	01813983          	ld	s3,24(sp)
    80001de4:	01013a03          	ld	s4,16(sp)
    80001de8:	00813a83          	ld	s5,8(sp)
    80001dec:	00013b03          	ld	s6,0(sp)
    80001df0:	04010113          	add	sp,sp,64
    80001df4:	00008067          	ret
    80001df8:	c31ff0ef          	jal	80001a28 <alloc_page>
    80001dfc:	00050813          	mv	a6,a0
    80001e00:	02050c63          	beqz	a0,80001e38 <map_page+0x210>
    80001e04:	00001737          	lui	a4,0x1
    80001e08:	00e50733          	add	a4,a0,a4
    80001e0c:	00050793          	mv	a5,a0
    80001e10:	0007b023          	sd	zero,0(a5)
    80001e14:	00878793          	add	a5,a5,8
    80001e18:	fee79ce3          	bne	a5,a4,80001e10 <map_page+0x1e8>
    80001e1c:	00c85793          	srl	a5,a6,0xc
    80001e20:	00a79793          	sll	a5,a5,0xa
    80001e24:	0017e793          	or	a5,a5,1
    80001e28:	00f43023          	sd	a5,0(s0)
    80001e2c:	e85ff06f          	j	80001cb0 <map_page+0x88>
    80001e30:	00d63423          	sd	a3,8(a2)
    80001e34:	f89ff06f          	j	80001dbc <map_page+0x194>
    80001e38:	fff00513          	li	a0,-1
    80001e3c:	f95ff06f          	j	80001dd0 <map_page+0x1a8>
    80001e40:	fff00513          	li	a0,-1
    80001e44:	00008067          	ret

0000000080001e48 <map_region>:
    80001e48:	000017b7          	lui	a5,0x1
    80001e4c:	fc010113          	add	sp,sp,-64
    80001e50:	fff78793          	add	a5,a5,-1 # fff <_entry-0x7ffff001>
    80001e54:	02913423          	sd	s1,40(sp)
    80001e58:	00f684b3          	add	s1,a3,a5
    80001e5c:	00b484b3          	add	s1,s1,a1
    80001e60:	fffff7b7          	lui	a5,0xfffff
    80001e64:	02113c23          	sd	ra,56(sp)
    80001e68:	02813823          	sd	s0,48(sp)
    80001e6c:	03213023          	sd	s2,32(sp)
    80001e70:	01313c23          	sd	s3,24(sp)
    80001e74:	01413823          	sd	s4,16(sp)
    80001e78:	01513423          	sd	s5,8(sp)
    80001e7c:	00f4f4b3          	and	s1,s1,a5
    80001e80:	0495f263          	bgeu	a1,s1,80001ec4 <map_region+0x7c>
    80001e84:	00058413          	mv	s0,a1
    80001e88:	00050993          	mv	s3,a0
    80001e8c:	00070a13          	mv	s4,a4
    80001e90:	40b60933          	sub	s2,a2,a1
    80001e94:	00001ab7          	lui	s5,0x1
    80001e98:	0080006f          	j	80001ea0 <map_region+0x58>
    80001e9c:	02947463          	bgeu	s0,s1,80001ec4 <map_region+0x7c>
    80001ea0:	00890633          	add	a2,s2,s0
    80001ea4:	00040593          	mv	a1,s0
    80001ea8:	000a0693          	mv	a3,s4
    80001eac:	00098513          	mv	a0,s3
    80001eb0:	d79ff0ef          	jal	80001c28 <map_page>
    80001eb4:	01540433          	add	s0,s0,s5
    80001eb8:	fe0502e3          	beqz	a0,80001e9c <map_region+0x54>
    80001ebc:	fff00513          	li	a0,-1
    80001ec0:	0080006f          	j	80001ec8 <map_region+0x80>
    80001ec4:	00000513          	li	a0,0
    80001ec8:	03813083          	ld	ra,56(sp)
    80001ecc:	03013403          	ld	s0,48(sp)
    80001ed0:	02813483          	ld	s1,40(sp)
    80001ed4:	02013903          	ld	s2,32(sp)
    80001ed8:	01813983          	ld	s3,24(sp)
    80001edc:	01013a03          	ld	s4,16(sp)
    80001ee0:	00813a83          	ld	s5,8(sp)
    80001ee4:	04010113          	add	sp,sp,64
    80001ee8:	00008067          	ret

0000000080001eec <destroy_pagetable>:
    80001eec:	f0010113          	add	sp,sp,-256
    80001ef0:	000017b7          	lui	a5,0x1
    80001ef4:	0e813823          	sd	s0,240(sp)
    80001ef8:	0f213023          	sd	s2,224(sp)
    80001efc:	0d613023          	sd	s6,192(sp)
    80001f00:	0b713c23          	sd	s7,184(sp)
    80001f04:	0e113c23          	sd	ra,248(sp)
    80001f08:	0e913423          	sd	s1,232(sp)
    80001f0c:	0d313c23          	sd	s3,216(sp)
    80001f10:	0d413823          	sd	s4,208(sp)
    80001f14:	0d513423          	sd	s5,200(sp)
    80001f18:	0b813823          	sd	s8,176(sp)
    80001f1c:	0b913423          	sd	s9,168(sp)
    80001f20:	0ba13023          	sd	s10,160(sp)
    80001f24:	09b13c23          	sd	s11,152(sp)
    80001f28:	00050413          	mv	s0,a0
    80001f2c:	00050913          	mv	s2,a0
    80001f30:	00f50b33          	add	s6,a0,a5
    80001f34:	00001bb7          	lui	s7,0x1
    80001f38:	00c0006f          	j	80001f44 <destroy_pagetable+0x58>
    80001f3c:	00890913          	add	s2,s2,8
    80001f40:	2d690063          	beq	s2,s6,80002200 <destroy_pagetable+0x314>
    80001f44:	00093783          	ld	a5,0(s2)
    80001f48:	00100713          	li	a4,1
    80001f4c:	00f7f693          	and	a3,a5,15
    80001f50:	fee696e3          	bne	a3,a4,80001f3c <destroy_pagetable+0x50>
    80001f54:	00a7d793          	srl	a5,a5,0xa
    80001f58:	00c79a13          	sll	s4,a5,0xc
    80001f5c:	017a0cb3          	add	s9,s4,s7
    80001f60:	00100d93          	li	s11,1
    80001f64:	000a0a93          	mv	s5,s4
    80001f68:	00040493          	mv	s1,s0
    80001f6c:	00c0006f          	j	80001f78 <destroy_pagetable+0x8c>
    80001f70:	008a0a13          	add	s4,s4,8
    80001f74:	279a0c63          	beq	s4,s9,800021ec <destroy_pagetable+0x300>
    80001f78:	000a3783          	ld	a5,0(s4)
    80001f7c:	00f7f713          	and	a4,a5,15
    80001f80:	ffb718e3          	bne	a4,s11,80001f70 <destroy_pagetable+0x84>
    80001f84:	00a7d793          	srl	a5,a5,0xa
    80001f88:	00c79993          	sll	s3,a5,0xc
    80001f8c:	00098c13          	mv	s8,s3
    80001f90:	01798d33          	add	s10,s3,s7
    80001f94:	00098413          	mv	s0,s3
    80001f98:	00c0006f          	j	80001fa4 <destroy_pagetable+0xb8>
    80001f9c:	00840413          	add	s0,s0,8
    80001fa0:	23a40e63          	beq	s0,s10,800021dc <destroy_pagetable+0x2f0>
    80001fa4:	00043783          	ld	a5,0(s0)
    80001fa8:	00f7f713          	and	a4,a5,15
    80001fac:	ffb718e3          	bne	a4,s11,80001f9c <destroy_pagetable+0xb0>
    80001fb0:	00a7d793          	srl	a5,a5,0xa
    80001fb4:	00c79793          	sll	a5,a5,0xc
    80001fb8:	00048713          	mv	a4,s1
    80001fbc:	03513c23          	sd	s5,56(sp)
    80001fc0:	00090493          	mv	s1,s2
    80001fc4:	017789b3          	add	s3,a5,s7
    80001fc8:	02813823          	sd	s0,48(sp)
    80001fcc:	00078a93          	mv	s5,a5
    80001fd0:	00070913          	mv	s2,a4
    80001fd4:	00c0006f          	j	80001fe0 <destroy_pagetable+0xf4>
    80001fd8:	00878793          	add	a5,a5,8 # 1008 <_entry-0x7fffeff8>
    80001fdc:	1cf98e63          	beq	s3,a5,800021b8 <destroy_pagetable+0x2cc>
    80001fe0:	0007b703          	ld	a4,0(a5)
    80001fe4:	00f77693          	and	a3,a4,15
    80001fe8:	ffb698e3          	bne	a3,s11,80001fd8 <destroy_pagetable+0xec>
    80001fec:	00a75713          	srl	a4,a4,0xa
    80001ff0:	00c71713          	sll	a4,a4,0xc
    80001ff4:	017706b3          	add	a3,a4,s7
    80001ff8:	05313423          	sd	s3,72(sp)
    80001ffc:	00d13423          	sd	a3,8(sp)
    80002000:	05813023          	sd	s8,64(sp)
    80002004:	00070993          	mv	s3,a4
    80002008:	04f13823          	sd	a5,80(sp)
    8000200c:	0100006f          	j	8000201c <destroy_pagetable+0x130>
    80002010:	00813783          	ld	a5,8(sp)
    80002014:	00870713          	add	a4,a4,8 # 1008 <_entry-0x7fffeff8>
    80002018:	16e78e63          	beq	a5,a4,80002194 <destroy_pagetable+0x2a8>
    8000201c:	00073783          	ld	a5,0(a4)
    80002020:	00f7f693          	and	a3,a5,15
    80002024:	ffb696e3          	bne	a3,s11,80002010 <destroy_pagetable+0x124>
    80002028:	00a7d793          	srl	a5,a5,0xa
    8000202c:	00c79793          	sll	a5,a5,0xc
    80002030:	017786b3          	add	a3,a5,s7
    80002034:	000a8c13          	mv	s8,s5
    80002038:	00d13c23          	sd	a3,24(sp)
    8000203c:	00078a93          	mv	s5,a5
    80002040:	04e13c23          	sd	a4,88(sp)
    80002044:	07213023          	sd	s2,96(sp)
    80002048:	0100006f          	j	80002058 <destroy_pagetable+0x16c>
    8000204c:	01813703          	ld	a4,24(sp)
    80002050:	00878793          	add	a5,a5,8
    80002054:	10f70c63          	beq	a4,a5,8000216c <destroy_pagetable+0x280>
    80002058:	0007b703          	ld	a4,0(a5)
    8000205c:	00f77693          	and	a3,a4,15
    80002060:	ffb696e3          	bne	a3,s11,8000204c <destroy_pagetable+0x160>
    80002064:	00a75713          	srl	a4,a4,0xa
    80002068:	00c71913          	sll	s2,a4,0xc
    8000206c:	01790733          	add	a4,s2,s7
    80002070:	07213423          	sd	s2,104(sp)
    80002074:	00090413          	mv	s0,s2
    80002078:	02e13023          	sd	a4,32(sp)
    8000207c:	06f13823          	sd	a5,112(sp)
    80002080:	00048913          	mv	s2,s1
    80002084:	0100006f          	j	80002094 <destroy_pagetable+0x1a8>
    80002088:	02013783          	ld	a5,32(sp)
    8000208c:	00840413          	add	s0,s0,8
    80002090:	0a878c63          	beq	a5,s0,80002148 <destroy_pagetable+0x25c>
    80002094:	00043783          	ld	a5,0(s0)
    80002098:	00f7f693          	and	a3,a5,15
    8000209c:	ffb696e3          	bne	a3,s11,80002088 <destroy_pagetable+0x19c>
    800020a0:	00a7d793          	srl	a5,a5,0xa
    800020a4:	00c79493          	sll	s1,a5,0xc
    800020a8:	017487b3          	add	a5,s1,s7
    800020ac:	00913823          	sd	s1,16(sp)
    800020b0:	02f13423          	sd	a5,40(sp)
    800020b4:	06813c23          	sd	s0,120(sp)
    800020b8:	0100006f          	j	800020c8 <destroy_pagetable+0x1dc>
    800020bc:	02813783          	ld	a5,40(sp)
    800020c0:	00848493          	add	s1,s1,8
    800020c4:	06978663          	beq	a5,s1,80002130 <destroy_pagetable+0x244>
    800020c8:	0004b783          	ld	a5,0(s1)
    800020cc:	00f7f693          	and	a3,a5,15
    800020d0:	ffb696e3          	bne	a3,s11,800020bc <destroy_pagetable+0x1d0>
    800020d4:	00a7d793          	srl	a5,a5,0xa
    800020d8:	00c79413          	sll	s0,a5,0xc
    800020dc:	017406b3          	add	a3,s0,s7
    800020e0:	09213023          	sd	s2,128(sp)
    800020e4:	09613423          	sd	s6,136(sp)
    800020e8:	00040913          	mv	s2,s0
    800020ec:	000a0b13          	mv	s6,s4
    800020f0:	00048a13          	mv	s4,s1
    800020f4:	00068493          	mv	s1,a3
    800020f8:	00043783          	ld	a5,0(s0)
    800020fc:	00840413          	add	s0,s0,8
    80002100:	00f7f713          	and	a4,a5,15
    80002104:	13b70e63          	beq	a4,s11,80002240 <destroy_pagetable+0x354>
    80002108:	fe8498e3          	bne	s1,s0,800020f8 <destroy_pagetable+0x20c>
    8000210c:	00090513          	mv	a0,s2
    80002110:	000a0493          	mv	s1,s4
    80002114:	08013903          	ld	s2,128(sp)
    80002118:	000b0a13          	mv	s4,s6
    8000211c:	08813b03          	ld	s6,136(sp)
    80002120:	925ff0ef          	jal	80001a44 <free_page>
    80002124:	02813783          	ld	a5,40(sp)
    80002128:	00848493          	add	s1,s1,8
    8000212c:	f8979ee3          	bne	a5,s1,800020c8 <destroy_pagetable+0x1dc>
    80002130:	01013503          	ld	a0,16(sp)
    80002134:	07813403          	ld	s0,120(sp)
    80002138:	90dff0ef          	jal	80001a44 <free_page>
    8000213c:	02013783          	ld	a5,32(sp)
    80002140:	00840413          	add	s0,s0,8
    80002144:	f48798e3          	bne	a5,s0,80002094 <destroy_pagetable+0x1a8>
    80002148:	07013783          	ld	a5,112(sp)
    8000214c:	06813503          	ld	a0,104(sp)
    80002150:	00090493          	mv	s1,s2
    80002154:	00f13823          	sd	a5,16(sp)
    80002158:	8edff0ef          	jal	80001a44 <free_page>
    8000215c:	01013783          	ld	a5,16(sp)
    80002160:	01813703          	ld	a4,24(sp)
    80002164:	00878793          	add	a5,a5,8
    80002168:	eef718e3          	bne	a4,a5,80002058 <destroy_pagetable+0x16c>
    8000216c:	05813703          	ld	a4,88(sp)
    80002170:	000a8513          	mv	a0,s5
    80002174:	06013903          	ld	s2,96(sp)
    80002178:	00e13823          	sd	a4,16(sp)
    8000217c:	8c9ff0ef          	jal	80001a44 <free_page>
    80002180:	01013703          	ld	a4,16(sp)
    80002184:	00813783          	ld	a5,8(sp)
    80002188:	000c0a93          	mv	s5,s8
    8000218c:	00870713          	add	a4,a4,8
    80002190:	e8e796e3          	bne	a5,a4,8000201c <destroy_pagetable+0x130>
    80002194:	05013783          	ld	a5,80(sp)
    80002198:	00098513          	mv	a0,s3
    8000219c:	04013c03          	ld	s8,64(sp)
    800021a0:	00f13423          	sd	a5,8(sp)
    800021a4:	04813983          	ld	s3,72(sp)
    800021a8:	89dff0ef          	jal	80001a44 <free_page>
    800021ac:	00813783          	ld	a5,8(sp)
    800021b0:	00878793          	add	a5,a5,8
    800021b4:	e2f996e3          	bne	s3,a5,80001fe0 <destroy_pagetable+0xf4>
    800021b8:	03013403          	ld	s0,48(sp)
    800021bc:	00090793          	mv	a5,s2
    800021c0:	000a8513          	mv	a0,s5
    800021c4:	00840413          	add	s0,s0,8
    800021c8:	03813a83          	ld	s5,56(sp)
    800021cc:	00048913          	mv	s2,s1
    800021d0:	00078493          	mv	s1,a5
    800021d4:	871ff0ef          	jal	80001a44 <free_page>
    800021d8:	dda416e3          	bne	s0,s10,80001fa4 <destroy_pagetable+0xb8>
    800021dc:	000c0513          	mv	a0,s8
    800021e0:	008a0a13          	add	s4,s4,8
    800021e4:	861ff0ef          	jal	80001a44 <free_page>
    800021e8:	d99a18e3          	bne	s4,s9,80001f78 <destroy_pagetable+0x8c>
    800021ec:	000a8513          	mv	a0,s5
    800021f0:	00890913          	add	s2,s2,8
    800021f4:	00048413          	mv	s0,s1
    800021f8:	84dff0ef          	jal	80001a44 <free_page>
    800021fc:	d56914e3          	bne	s2,s6,80001f44 <destroy_pagetable+0x58>
    80002200:	00040513          	mv	a0,s0
    80002204:	0f013403          	ld	s0,240(sp)
    80002208:	0f813083          	ld	ra,248(sp)
    8000220c:	0e813483          	ld	s1,232(sp)
    80002210:	0e013903          	ld	s2,224(sp)
    80002214:	0d813983          	ld	s3,216(sp)
    80002218:	0d013a03          	ld	s4,208(sp)
    8000221c:	0c813a83          	ld	s5,200(sp)
    80002220:	0c013b03          	ld	s6,192(sp)
    80002224:	0b813b83          	ld	s7,184(sp)
    80002228:	0b013c03          	ld	s8,176(sp)
    8000222c:	0a813c83          	ld	s9,168(sp)
    80002230:	0a013d03          	ld	s10,160(sp)
    80002234:	09813d83          	ld	s11,152(sp)
    80002238:	10010113          	add	sp,sp,256
    8000223c:	809ff06f          	j	80001a44 <free_page>
    80002240:	00a7d793          	srl	a5,a5,0xa
    80002244:	00c79513          	sll	a0,a5,0xc
    80002248:	ca5ff0ef          	jal	80001eec <destroy_pagetable>
    8000224c:	ea8496e3          	bne	s1,s0,800020f8 <destroy_pagetable+0x20c>
    80002250:	ebdff06f          	j	8000210c <destroy_pagetable+0x220>

0000000080002254 <kvminithart>:
    80002254:	00412797          	auipc	a5,0x412
    80002258:	e6c7b783          	ld	a5,-404(a5) # 804140c0 <kernel_pagetable>
    8000225c:	fff00713          	li	a4,-1
    80002260:	03f71713          	sll	a4,a4,0x3f
    80002264:	00c7d793          	srl	a5,a5,0xc
    80002268:	00e7e7b3          	or	a5,a5,a4
    8000226c:	18079073          	csrw	satp,a5
    80002270:	12000073          	sfence.vma
    80002274:	00008067          	ret

0000000080002278 <dump_pagetable>:
    80002278:	fb010113          	add	sp,sp,-80
    8000227c:	03213823          	sd	s2,48(sp)
    80002280:	03313423          	sd	s3,40(sp)
    80002284:	04113423          	sd	ra,72(sp)
    80002288:	04813023          	sd	s0,64(sp)
    8000228c:	02913c23          	sd	s1,56(sp)
    80002290:	03413023          	sd	s4,32(sp)
    80002294:	01513c23          	sd	s5,24(sp)
    80002298:	01613823          	sd	s6,16(sp)
    8000229c:	01713423          	sd	s7,8(sp)
    800022a0:	00058993          	mv	s3,a1
    800022a4:	00050913          	mv	s2,a0
    800022a8:	28b05263          	blez	a1,8000252c <dump_pagetable+0x2b4>
    800022ac:	00000413          	li	s0,0
    800022b0:	0014041b          	addw	s0,s0,1
    800022b4:	02000513          	li	a0,32
    800022b8:	eacff0ef          	jal	80001964 <uart_putc>
    800022bc:	fe899ae3          	bne	s3,s0,800022b0 <dump_pagetable+0x38>
    800022c0:	00003517          	auipc	a0,0x3
    800022c4:	4c050513          	add	a0,a0,1216 # 80005780 <digits+0x18>
    800022c8:	eb4ff0ef          	jal	8000197c <uart_puts>
    800022cc:	00900793          	li	a5,9
    800022d0:	2737d463          	bge	a5,s3,80002538 <dump_pagetable+0x2c0>
    800022d4:	00a00413          	li	s0,10
    800022d8:	0289c53b          	divw	a0,s3,s0
    800022dc:	0305051b          	addw	a0,a0,48
    800022e0:	0ff57513          	zext.b	a0,a0
    800022e4:	e80ff0ef          	jal	80001964 <uart_putc>
    800022e8:	0289e53b          	remw	a0,s3,s0
    800022ec:	0305051b          	addw	a0,a0,48
    800022f0:	0ff57513          	zext.b	a0,a0
    800022f4:	e70ff0ef          	jal	80001964 <uart_putc>
    800022f8:	00002517          	auipc	a0,0x2
    800022fc:	0b050513          	add	a0,a0,176 # 800043a8 <rodata_start+0x3a8>
    80002300:	fff00b13          	li	s6,-1
    80002304:	e78ff0ef          	jal	8000197c <uart_puts>
    80002308:	00000493          	li	s1,0
    8000230c:	00cb5b13          	srl	s6,s6,0xc
    80002310:	00900a13          	li	s4,9
    80002314:	ffc00a93          	li	s5,-4
    80002318:	0140006f          	j	8000232c <dump_pagetable+0xb4>
    8000231c:	0014849b          	addw	s1,s1,1
    80002320:	20000793          	li	a5,512
    80002324:	00890913          	add	s2,s2,8
    80002328:	0cf48063          	beq	s1,a5,800023e8 <dump_pagetable+0x170>
    8000232c:	00093783          	ld	a5,0(s2)
    80002330:	0017f793          	and	a5,a5,1
    80002334:	fe0784e3          	beqz	a5,8000231c <dump_pagetable+0xa4>
    80002338:	00000413          	li	s0,0
    8000233c:	0009ca63          	bltz	s3,80002350 <dump_pagetable+0xd8>
    80002340:	0014041b          	addw	s0,s0,1
    80002344:	02000513          	li	a0,32
    80002348:	e1cff0ef          	jal	80001964 <uart_putc>
    8000234c:	fe89dae3          	bge	s3,s0,80002340 <dump_pagetable+0xc8>
    80002350:	00003517          	auipc	a0,0x3
    80002354:	44850513          	add	a0,a0,1096 # 80005798 <digits+0x30>
    80002358:	e24ff0ef          	jal	8000197c <uart_puts>
    8000235c:	06300793          	li	a5,99
    80002360:	1697d263          	bge	a5,s1,800024c4 <dump_pagetable+0x24c>
    80002364:	06400413          	li	s0,100
    80002368:	0284c53b          	divw	a0,s1,s0
    8000236c:	00a00b93          	li	s7,10
    80002370:	0305051b          	addw	a0,a0,48
    80002374:	0ff57513          	zext.b	a0,a0
    80002378:	decff0ef          	jal	80001964 <uart_putc>
    8000237c:	0284e53b          	remw	a0,s1,s0
    80002380:	0375453b          	divw	a0,a0,s7
    80002384:	0305051b          	addw	a0,a0,48
    80002388:	0ff57513          	zext.b	a0,a0
    8000238c:	dd8ff0ef          	jal	80001964 <uart_putc>
    80002390:	0374e53b          	remw	a0,s1,s7
    80002394:	0305051b          	addw	a0,a0,48
    80002398:	0ff57513          	zext.b	a0,a0
    8000239c:	dc8ff0ef          	jal	80001964 <uart_putc>
    800023a0:	00003517          	auipc	a0,0x3
    800023a4:	40050513          	add	a0,a0,1024 # 800057a0 <digits+0x38>
    800023a8:	dd4ff0ef          	jal	8000197c <uart_puts>
    800023ac:	00093b83          	ld	s7,0(s2)
    800023b0:	00ebf793          	and	a5,s7,14
    800023b4:	06079063          	bnez	a5,80002414 <dump_pagetable+0x19c>
    800023b8:	00003517          	auipc	a0,0x3
    800023bc:	40050513          	add	a0,a0,1024 # 800057b8 <digits+0x50>
    800023c0:	dbcff0ef          	jal	8000197c <uart_puts>
    800023c4:	00093503          	ld	a0,0(s2)
    800023c8:	0019859b          	addw	a1,s3,1
    800023cc:	0014849b          	addw	s1,s1,1
    800023d0:	00a55513          	srl	a0,a0,0xa
    800023d4:	00c51513          	sll	a0,a0,0xc
    800023d8:	ea1ff0ef          	jal	80002278 <dump_pagetable>
    800023dc:	20000793          	li	a5,512
    800023e0:	00890913          	add	s2,s2,8
    800023e4:	f4f494e3          	bne	s1,a5,8000232c <dump_pagetable+0xb4>
    800023e8:	04813083          	ld	ra,72(sp)
    800023ec:	04013403          	ld	s0,64(sp)
    800023f0:	03813483          	ld	s1,56(sp)
    800023f4:	03013903          	ld	s2,48(sp)
    800023f8:	02813983          	ld	s3,40(sp)
    800023fc:	02013a03          	ld	s4,32(sp)
    80002400:	01813a83          	ld	s5,24(sp)
    80002404:	01013b03          	ld	s6,16(sp)
    80002408:	00813b83          	ld	s7,8(sp)
    8000240c:	05010113          	add	sp,sp,80
    80002410:	00008067          	ret
    80002414:	00003517          	auipc	a0,0x3
    80002418:	39450513          	add	a0,a0,916 # 800057a8 <digits+0x40>
    8000241c:	d60ff0ef          	jal	8000197c <uart_puts>
    80002420:	00abdb93          	srl	s7,s7,0xa
    80002424:	016bfbb3          	and	s7,s7,s6
    80002428:	00000713          	li	a4,0
    8000242c:	03c00413          	li	s0,60
    80002430:	008bd7b3          	srl	a5,s7,s0
    80002434:	00f7f793          	and	a5,a5,15
    80002438:	00e7e733          	or	a4,a5,a4
    8000243c:	00071e63          	bnez	a4,80002458 <dump_pagetable+0x1e0>
    80002440:	02040c63          	beqz	s0,80002478 <dump_pagetable+0x200>
    80002444:	ffc4041b          	addw	s0,s0,-4
    80002448:	008bd7b3          	srl	a5,s7,s0
    8000244c:	00f7f793          	and	a5,a5,15
    80002450:	00e7e733          	or	a4,a5,a4
    80002454:	fe0706e3          	beqz	a4,80002440 <dump_pagetable+0x1c8>
    80002458:	ffc4041b          	addw	s0,s0,-4
    8000245c:	03778513          	add	a0,a5,55
    80002460:	0ff7f713          	zext.b	a4,a5
    80002464:	04fa5c63          	bge	s4,a5,800024bc <dump_pagetable+0x244>
    80002468:	cfcff0ef          	jal	80001964 <uart_putc>
    8000246c:	01540a63          	beq	s0,s5,80002480 <dump_pagetable+0x208>
    80002470:	00100713          	li	a4,1
    80002474:	fbdff06f          	j	80002430 <dump_pagetable+0x1b8>
    80002478:	03000513          	li	a0,48
    8000247c:	ce8ff0ef          	jal	80001964 <uart_putc>
    80002480:	00003517          	auipc	a0,0x3
    80002484:	33050513          	add	a0,a0,816 # 800057b0 <digits+0x48>
    80002488:	cf4ff0ef          	jal	8000197c <uart_puts>
    8000248c:	00093783          	ld	a5,0(s2)
    80002490:	0027f713          	and	a4,a5,2
    80002494:	08071463          	bnez	a4,8000251c <dump_pagetable+0x2a4>
    80002498:	0047f713          	and	a4,a5,4
    8000249c:	06071863          	bnez	a4,8000250c <dump_pagetable+0x294>
    800024a0:	0087f713          	and	a4,a5,8
    800024a4:	04071c63          	bnez	a4,800024fc <dump_pagetable+0x284>
    800024a8:	0107f793          	and	a5,a5,16
    800024ac:	04079263          	bnez	a5,800024f0 <dump_pagetable+0x278>
    800024b0:	00a00513          	li	a0,10
    800024b4:	cb0ff0ef          	jal	80001964 <uart_putc>
    800024b8:	e65ff06f          	j	8000231c <dump_pagetable+0xa4>
    800024bc:	03070513          	add	a0,a4,48
    800024c0:	fa9ff06f          	j	80002468 <dump_pagetable+0x1f0>
    800024c4:	089a5263          	bge	s4,s1,80002548 <dump_pagetable+0x2d0>
    800024c8:	00a00413          	li	s0,10
    800024cc:	0284c53b          	divw	a0,s1,s0
    800024d0:	0305051b          	addw	a0,a0,48
    800024d4:	0ff57513          	zext.b	a0,a0
    800024d8:	c8cff0ef          	jal	80001964 <uart_putc>
    800024dc:	0284e53b          	remw	a0,s1,s0
    800024e0:	0305051b          	addw	a0,a0,48
    800024e4:	0ff57513          	zext.b	a0,a0
    800024e8:	c7cff0ef          	jal	80001964 <uart_putc>
    800024ec:	eb5ff06f          	j	800023a0 <dump_pagetable+0x128>
    800024f0:	05500513          	li	a0,85
    800024f4:	c70ff0ef          	jal	80001964 <uart_putc>
    800024f8:	fb9ff06f          	j	800024b0 <dump_pagetable+0x238>
    800024fc:	05800513          	li	a0,88
    80002500:	c64ff0ef          	jal	80001964 <uart_putc>
    80002504:	00093783          	ld	a5,0(s2)
    80002508:	fa1ff06f          	j	800024a8 <dump_pagetable+0x230>
    8000250c:	05700513          	li	a0,87
    80002510:	c54ff0ef          	jal	80001964 <uart_putc>
    80002514:	00093783          	ld	a5,0(s2)
    80002518:	f89ff06f          	j	800024a0 <dump_pagetable+0x228>
    8000251c:	05200513          	li	a0,82
    80002520:	c44ff0ef          	jal	80001964 <uart_putc>
    80002524:	00093783          	ld	a5,0(s2)
    80002528:	f71ff06f          	j	80002498 <dump_pagetable+0x220>
    8000252c:	00003517          	auipc	a0,0x3
    80002530:	25450513          	add	a0,a0,596 # 80005780 <digits+0x18>
    80002534:	c48ff0ef          	jal	8000197c <uart_puts>
    80002538:	0309851b          	addw	a0,s3,48
    8000253c:	0ff57513          	zext.b	a0,a0
    80002540:	c24ff0ef          	jal	80001964 <uart_putc>
    80002544:	db5ff06f          	j	800022f8 <dump_pagetable+0x80>
    80002548:	0304851b          	addw	a0,s1,48
    8000254c:	0ff57513          	zext.b	a0,a0
    80002550:	c14ff0ef          	jal	80001964 <uart_putc>
    80002554:	e4dff06f          	j	800023a0 <dump_pagetable+0x128>

0000000080002558 <init_page_replacement>:
    80002558:	00100713          	li	a4,1
    8000255c:	02a71713          	sll	a4,a4,0x2a
    80002560:	0000f797          	auipc	a5,0xf
    80002564:	aa078793          	add	a5,a5,-1376 # 80011000 <swap_mgr>
    80002568:	08e7b023          	sd	a4,128(a5)
    8000256c:	0000f717          	auipc	a4,0xf
    80002570:	b0072e23          	sw	zero,-1252(a4) # 80011088 <swap_mgr+0x88>
    80002574:	0000f717          	auipc	a4,0xf
    80002578:	b0c70713          	add	a4,a4,-1268 # 80011080 <swap_mgr+0x80>
    8000257c:	0007a023          	sw	zero,0(a5)
    80002580:	00478793          	add	a5,a5,4
    80002584:	fee79ce3          	bne	a5,a4,8000257c <init_page_replacement+0x24>
    80002588:	0040f797          	auipc	a5,0x40f
    8000258c:	b007b423          	sd	zero,-1272(a5) # 80411090 <lru_mgr>
    80002590:	0040f797          	auipc	a5,0x40f
    80002594:	b007b423          	sd	zero,-1272(a5) # 80411098 <lru_mgr+0x8>
    80002598:	00100793          	li	a5,1
    8000259c:	02879793          	sll	a5,a5,0x28
    800025a0:	00412717          	auipc	a4,0x412
    800025a4:	b0f73023          	sd	a5,-1280(a4) # 804140a0 <lru_mgr+0x3010>
    800025a8:	fff00713          	li	a4,-1
    800025ac:	0040f797          	auipc	a5,0x40f
    800025b0:	af478793          	add	a5,a5,-1292 # 804110a0 <lru_mgr+0x10>
    800025b4:	00412697          	auipc	a3,0x412
    800025b8:	aec68693          	add	a3,a3,-1300 # 804140a0 <lru_mgr+0x3010>
    800025bc:	02075713          	srl	a4,a4,0x20
    800025c0:	0007b023          	sd	zero,0(a5)
    800025c4:	0007b423          	sd	zero,8(a5)
    800025c8:	00e7b823          	sd	a4,16(a5)
    800025cc:	0007bc23          	sd	zero,24(a5)
    800025d0:	0207b023          	sd	zero,32(a5)
    800025d4:	0207b423          	sd	zero,40(a5)
    800025d8:	03078793          	add	a5,a5,48
    800025dc:	fed792e3          	bne	a5,a3,800025c0 <init_page_replacement+0x68>
    800025e0:	00008067          	ret

00000000800025e4 <kvminit>:
    800025e4:	fd010113          	add	sp,sp,-48
    800025e8:	02113423          	sd	ra,40(sp)
    800025ec:	02813023          	sd	s0,32(sp)
    800025f0:	00913c23          	sd	s1,24(sp)
    800025f4:	01213823          	sd	s2,16(sp)
    800025f8:	01313423          	sd	s3,8(sp)
    800025fc:	01413023          	sd	s4,0(sp)
    80002600:	f59ff0ef          	jal	80002558 <init_page_replacement>
    80002604:	c24ff0ef          	jal	80001a28 <alloc_page>
    80002608:	00001737          	lui	a4,0x1
    8000260c:	00e50733          	add	a4,a0,a4
    80002610:	00050413          	mv	s0,a0
    80002614:	00050793          	mv	a5,a0
    80002618:	1a050663          	beqz	a0,800027c4 <kvminit+0x1e0>
    8000261c:	0007b023          	sd	zero,0(a5)
    80002620:	00878793          	add	a5,a5,8
    80002624:	fef71ce3          	bne	a4,a5,8000261c <kvminit+0x38>
    80002628:	00412917          	auipc	s2,0x412
    8000262c:	a9890913          	add	s2,s2,-1384 # 804140c0 <kernel_pagetable>
    80002630:	00002997          	auipc	s3,0x2
    80002634:	ebf98993          	add	s3,s3,-321 # 800044ef <rodata_start+0x4ef>
    80002638:	fffff7b7          	lui	a5,0xfffff
    8000263c:	00893023          	sd	s0,0(s2)
    80002640:	ffffe497          	auipc	s1,0xffffe
    80002644:	9c048493          	add	s1,s1,-1600 # 80000000 <_entry>
    80002648:	00f9f9b3          	and	s3,s3,a5
    8000264c:	0334f863          	bgeu	s1,s3,8000267c <kvminit+0x98>
    80002650:	00001a37          	lui	s4,0x1
    80002654:	0080006f          	j	8000265c <kvminit+0x78>
    80002658:	0334f063          	bgeu	s1,s3,80002678 <kvminit+0x94>
    8000265c:	00048613          	mv	a2,s1
    80002660:	00048593          	mv	a1,s1
    80002664:	00a00693          	li	a3,10
    80002668:	00040513          	mv	a0,s0
    8000266c:	dbcff0ef          	jal	80001c28 <map_page>
    80002670:	014484b3          	add	s1,s1,s4
    80002674:	fe0502e3          	beqz	a0,80002658 <kvminit+0x74>
    80002678:	00093403          	ld	s0,0(s2)
    8000267c:	00004997          	auipc	s3,0x4
    80002680:	30d98993          	add	s3,s3,781 # 80006989 <data_end+0x989>
    80002684:	fffff7b7          	lui	a5,0xfffff
    80002688:	00002497          	auipc	s1,0x2
    8000268c:	97848493          	add	s1,s1,-1672 # 80004000 <rodata_start>
    80002690:	00f9f9b3          	and	s3,s3,a5
    80002694:	0334f863          	bgeu	s1,s3,800026c4 <kvminit+0xe0>
    80002698:	00001a37          	lui	s4,0x1
    8000269c:	0080006f          	j	800026a4 <kvminit+0xc0>
    800026a0:	0334f063          	bgeu	s1,s3,800026c0 <kvminit+0xdc>
    800026a4:	00048613          	mv	a2,s1
    800026a8:	00048593          	mv	a1,s1
    800026ac:	00200693          	li	a3,2
    800026b0:	00040513          	mv	a0,s0
    800026b4:	d74ff0ef          	jal	80001c28 <map_page>
    800026b8:	014484b3          	add	s1,s1,s4
    800026bc:	fe0502e3          	beqz	a0,800026a0 <kvminit+0xbc>
    800026c0:	00093403          	ld	s0,0(s2)
    800026c4:	00005997          	auipc	s3,0x5
    800026c8:	93b98993          	add	s3,s3,-1733 # 80006fff <data_end+0xfff>
    800026cc:	fffff7b7          	lui	a5,0xfffff
    800026d0:	00004497          	auipc	s1,0x4
    800026d4:	93048493          	add	s1,s1,-1744 # 80006000 <data_end>
    800026d8:	00f9f9b3          	and	s3,s3,a5
    800026dc:	0334f863          	bgeu	s1,s3,8000270c <kvminit+0x128>
    800026e0:	00001a37          	lui	s4,0x1
    800026e4:	0080006f          	j	800026ec <kvminit+0x108>
    800026e8:	0334f063          	bgeu	s1,s3,80002708 <kvminit+0x124>
    800026ec:	00048613          	mv	a2,s1
    800026f0:	00048593          	mv	a1,s1
    800026f4:	00600693          	li	a3,6
    800026f8:	00040513          	mv	a0,s0
    800026fc:	d2cff0ef          	jal	80001c28 <map_page>
    80002700:	014484b3          	add	s1,s1,s4
    80002704:	fe0502e3          	beqz	a0,800026e8 <kvminit+0x104>
    80002708:	00093403          	ld	s0,0(s2)
    8000270c:	00413997          	auipc	s3,0x413
    80002710:	9bb98993          	add	s3,s3,-1605 # 804150c7 <bss_end+0xfff>
    80002714:	fffff7b7          	lui	a5,0xfffff
    80002718:	0000e497          	auipc	s1,0xe
    8000271c:	8e848493          	add	s1,s1,-1816 # 80010000 <bss_start>
    80002720:	00f9f9b3          	and	s3,s3,a5
    80002724:	0334f863          	bgeu	s1,s3,80002754 <kvminit+0x170>
    80002728:	00001a37          	lui	s4,0x1
    8000272c:	0080006f          	j	80002734 <kvminit+0x150>
    80002730:	0334f063          	bgeu	s1,s3,80002750 <kvminit+0x16c>
    80002734:	00048613          	mv	a2,s1
    80002738:	00048593          	mv	a1,s1
    8000273c:	00600693          	li	a3,6
    80002740:	00040513          	mv	a0,s0
    80002744:	ce4ff0ef          	jal	80001c28 <map_page>
    80002748:	014484b3          	add	s1,s1,s4
    8000274c:	fe0502e3          	beqz	a0,80002730 <kvminit+0x14c>
    80002750:	00093403          	ld	s0,0(s2)
    80002754:	01100993          	li	s3,17
    80002758:	00412497          	auipc	s1,0x412
    8000275c:	97048493          	add	s1,s1,-1680 # 804140c8 <bss_end>
    80002760:	01b99993          	sll	s3,s3,0x1b
    80002764:	0334f863          	bgeu	s1,s3,80002794 <kvminit+0x1b0>
    80002768:	00001a37          	lui	s4,0x1
    8000276c:	0080006f          	j	80002774 <kvminit+0x190>
    80002770:	0334f063          	bgeu	s1,s3,80002790 <kvminit+0x1ac>
    80002774:	00048613          	mv	a2,s1
    80002778:	00048593          	mv	a1,s1
    8000277c:	00600693          	li	a3,6
    80002780:	00040513          	mv	a0,s0
    80002784:	ca4ff0ef          	jal	80001c28 <map_page>
    80002788:	014484b3          	add	s1,s1,s4
    8000278c:	fe0502e3          	beqz	a0,80002770 <kvminit+0x18c>
    80002790:	00093403          	ld	s0,0(s2)
    80002794:	00040513          	mv	a0,s0
    80002798:	02013403          	ld	s0,32(sp)
    8000279c:	02813083          	ld	ra,40(sp)
    800027a0:	01813483          	ld	s1,24(sp)
    800027a4:	01013903          	ld	s2,16(sp)
    800027a8:	00813983          	ld	s3,8(sp)
    800027ac:	00013a03          	ld	s4,0(sp)
    800027b0:	00600693          	li	a3,6
    800027b4:	10000637          	lui	a2,0x10000
    800027b8:	100005b7          	lui	a1,0x10000
    800027bc:	03010113          	add	sp,sp,48
    800027c0:	c68ff06f          	j	80001c28 <map_page>
    800027c4:	02813083          	ld	ra,40(sp)
    800027c8:	02013403          	ld	s0,32(sp)
    800027cc:	00412797          	auipc	a5,0x412
    800027d0:	8e07ba23          	sd	zero,-1804(a5) # 804140c0 <kernel_pagetable>
    800027d4:	01813483          	ld	s1,24(sp)
    800027d8:	01013903          	ld	s2,16(sp)
    800027dc:	00813983          	ld	s3,8(sp)
    800027e0:	00013a03          	ld	s4,0(sp)
    800027e4:	03010113          	add	sp,sp,48
    800027e8:	00008067          	ret

00000000800027ec <alloc_swap_slot>:
    800027ec:	0000f617          	auipc	a2,0xf
    800027f0:	81460613          	add	a2,a2,-2028 # 80011000 <swap_mgr>
    800027f4:	08862803          	lw	a6,136(a2)
    800027f8:	08462883          	lw	a7,132(a2)
    800027fc:	fff00513          	li	a0,-1
    80002800:	0d187663          	bgeu	a6,a7,800028cc <alloc_swap_slot+0xe0>
    80002804:	08062303          	lw	t1,128(a2)
    80002808:	07137863          	bgeu	t1,a7,80002878 <alloc_swap_slot+0x8c>
    8000280c:	0053579b          	srlw	a5,t1,0x5
    80002810:	00279793          	sll	a5,a5,0x2
    80002814:	00f607b3          	add	a5,a2,a5
    80002818:	0007a683          	lw	a3,0(a5)
    8000281c:	00100593          	li	a1,1
    80002820:	006595bb          	sllw	a1,a1,t1
    80002824:	00b6f7b3          	and	a5,a3,a1
    80002828:	0007879b          	sext.w	a5,a5
    8000282c:	0053571b          	srlw	a4,t1,0x5
    80002830:	00030513          	mv	a0,t1
    80002834:	08078e63          	beqz	a5,800028d0 <alloc_swap_slot+0xe4>
    80002838:	00100e13          	li	t3,1
    8000283c:	01c0006f          	j	80002858 <alloc_swap_slot+0x6c>
    80002840:	0006a683          	lw	a3,0(a3)
    80002844:	0007859b          	sext.w	a1,a5
    80002848:	0057571b          	srlw	a4,a4,0x5
    8000284c:	00f6f7b3          	and	a5,a3,a5
    80002850:	0007879b          	sext.w	a5,a5
    80002854:	06078e63          	beqz	a5,800028d0 <alloc_swap_slot+0xe4>
    80002858:	0015071b          	addw	a4,a0,1
    8000285c:	0057579b          	srlw	a5,a4,0x5
    80002860:	00279793          	sll	a5,a5,0x2
    80002864:	0007051b          	sext.w	a0,a4
    80002868:	00f606b3          	add	a3,a2,a5
    8000286c:	00ee17bb          	sllw	a5,t3,a4
    80002870:	fca898e3          	bne	a7,a0,80002840 <alloc_swap_slot+0x54>
    80002874:	04030a63          	beqz	t1,800028c8 <alloc_swap_slot+0xdc>
    80002878:	00062683          	lw	a3,0(a2)
    8000287c:	0016f513          	and	a0,a3,1
    80002880:	0a050063          	beqz	a0,80002920 <alloc_swap_slot+0x134>
    80002884:	00000513          	li	a0,0
    80002888:	00100e13          	li	t3,1
    8000288c:	01c0006f          	j	800028a8 <alloc_swap_slot+0xbc>
    80002890:	0006a683          	lw	a3,0(a3)
    80002894:	00078e9b          	sext.w	t4,a5
    80002898:	0057571b          	srlw	a4,a4,0x5
    8000289c:	00f6f7b3          	and	a5,a3,a5
    800028a0:	0007879b          	sext.w	a5,a5
    800028a4:	04078a63          	beqz	a5,800028f8 <alloc_swap_slot+0x10c>
    800028a8:	0015071b          	addw	a4,a0,1
    800028ac:	0057579b          	srlw	a5,a4,0x5
    800028b0:	00279793          	sll	a5,a5,0x2
    800028b4:	0005059b          	sext.w	a1,a0
    800028b8:	0007051b          	sext.w	a0,a4
    800028bc:	00f606b3          	add	a3,a2,a5
    800028c0:	00ee17bb          	sllw	a5,t3,a4
    800028c4:	fca316e3          	bne	t1,a0,80002890 <alloc_swap_slot+0xa4>
    800028c8:	fff00513          	li	a0,-1
    800028cc:	00008067          	ret
    800028d0:	0015079b          	addw	a5,a0,1
    800028d4:	0317f7bb          	remuw	a5,a5,a7
    800028d8:	00271713          	sll	a4,a4,0x2
    800028dc:	00e60733          	add	a4,a2,a4
    800028e0:	00b6e6b3          	or	a3,a3,a1
    800028e4:	0018081b          	addw	a6,a6,1
    800028e8:	00d72023          	sw	a3,0(a4) # 1000 <_entry-0x7ffff000>
    800028ec:	09062423          	sw	a6,136(a2)
    800028f0:	08f62023          	sw	a5,128(a2)
    800028f4:	00008067          	ret
    800028f8:	0025859b          	addw	a1,a1,2 # 10000002 <_entry-0x6ffffffe>
    800028fc:	0315f5bb          	remuw	a1,a1,a7
    80002900:	00271713          	sll	a4,a4,0x2
    80002904:	00e60733          	add	a4,a2,a4
    80002908:	01d6e6b3          	or	a3,a3,t4
    8000290c:	0018081b          	addw	a6,a6,1
    80002910:	00d72023          	sw	a3,0(a4)
    80002914:	09062423          	sw	a6,136(a2)
    80002918:	08b62023          	sw	a1,128(a2)
    8000291c:	00008067          	ret
    80002920:	00000713          	li	a4,0
    80002924:	00100593          	li	a1,1
    80002928:	00100e93          	li	t4,1
    8000292c:	fd1ff06f          	j	800028fc <alloc_swap_slot+0x110>

0000000080002930 <free_swap_slot>:
    80002930:	0000e717          	auipc	a4,0xe
    80002934:	6d070713          	add	a4,a4,1744 # 80011000 <swap_mgr>
    80002938:	08472783          	lw	a5,132(a4)
    8000293c:	04f57663          	bgeu	a0,a5,80002988 <free_swap_slot+0x58>
    80002940:	0055579b          	srlw	a5,a0,0x5
    80002944:	00279793          	sll	a5,a5,0x2
    80002948:	00f707b3          	add	a5,a4,a5
    8000294c:	0007a583          	lw	a1,0(a5)
    80002950:	00100693          	li	a3,1
    80002954:	00a696bb          	sllw	a3,a3,a0
    80002958:	00d5f633          	and	a2,a1,a3
    8000295c:	0006061b          	sext.w	a2,a2
    80002960:	02060463          	beqz	a2,80002988 <free_swap_slot+0x58>
    80002964:	08872603          	lw	a2,136(a4)
    80002968:	fff6c693          	not	a3,a3
    8000296c:	08072803          	lw	a6,128(a4)
    80002970:	00d5f5b3          	and	a1,a1,a3
    80002974:	fff6069b          	addw	a3,a2,-1
    80002978:	00b7a023          	sw	a1,0(a5)
    8000297c:	08d72423          	sw	a3,136(a4)
    80002980:	01057463          	bgeu	a0,a6,80002988 <free_swap_slot+0x58>
    80002984:	08a72023          	sw	a0,128(a4)
    80002988:	00008067          	ret

000000008000298c <find_page_desc>:
    8000298c:	fffff7b7          	lui	a5,0xfffff
    80002990:	00f57533          	and	a0,a0,a5
    80002994:	00000713          	li	a4,0
    80002998:	0040e797          	auipc	a5,0x40e
    8000299c:	70878793          	add	a5,a5,1800 # 804110a0 <lru_mgr+0x10>
    800029a0:	10000613          	li	a2,256
    800029a4:	0100006f          	j	800029b4 <find_page_desc+0x28>
    800029a8:	0017071b          	addw	a4,a4,1
    800029ac:	03078793          	add	a5,a5,48
    800029b0:	02c70a63          	beq	a4,a2,800029e4 <find_page_desc+0x58>
    800029b4:	0007b683          	ld	a3,0(a5)
    800029b8:	fea698e3          	bne	a3,a0,800029a8 <find_page_desc+0x1c>
    800029bc:	0147a683          	lw	a3,20(a5)
    800029c0:	0016f693          	and	a3,a3,1
    800029c4:	fe0682e3          	beqz	a3,800029a8 <find_page_desc+0x1c>
    800029c8:	00171513          	sll	a0,a4,0x1
    800029cc:	00e50533          	add	a0,a0,a4
    800029d0:	0040e797          	auipc	a5,0x40e
    800029d4:	6d078793          	add	a5,a5,1744 # 804110a0 <lru_mgr+0x10>
    800029d8:	00451513          	sll	a0,a0,0x4
    800029dc:	00f50533          	add	a0,a0,a5
    800029e0:	00008067          	ret
    800029e4:	00000513          	li	a0,0
    800029e8:	00008067          	ret

00000000800029ec <lru_add_page>:
    800029ec:	02050c63          	beqz	a0,80002a24 <lru_add_page+0x38>
    800029f0:	0040e717          	auipc	a4,0x40e
    800029f4:	6a070713          	add	a4,a4,1696 # 80411090 <lru_mgr>
    800029f8:	00073783          	ld	a5,0(a4)
    800029fc:	00053c23          	sd	zero,24(a0)
    80002a00:	02f53023          	sd	a5,32(a0)
    80002a04:	02078263          	beqz	a5,80002a28 <lru_add_page+0x3c>
    80002a08:	00a7bc23          	sd	a0,24(a5)
    80002a0c:	00411697          	auipc	a3,0x411
    80002a10:	68468693          	add	a3,a3,1668 # 80414090 <lru_mgr+0x3000>
    80002a14:	0106a783          	lw	a5,16(a3)
    80002a18:	00a73023          	sd	a0,0(a4)
    80002a1c:	0017879b          	addw	a5,a5,1
    80002a20:	00f6a823          	sw	a5,16(a3)
    80002a24:	00008067          	ret
    80002a28:	00a73423          	sd	a0,8(a4)
    80002a2c:	fe1ff06f          	j	80002a0c <lru_add_page+0x20>

0000000080002a30 <lru_remove_page>:
    80002a30:	02050c63          	beqz	a0,80002a68 <lru_remove_page+0x38>
    80002a34:	01853783          	ld	a5,24(a0)
    80002a38:	02053703          	ld	a4,32(a0)
    80002a3c:	02078863          	beqz	a5,80002a6c <lru_remove_page+0x3c>
    80002a40:	02e7b023          	sd	a4,32(a5)
    80002a44:	02070a63          	beqz	a4,80002a78 <lru_remove_page+0x48>
    80002a48:	00f73c23          	sd	a5,24(a4)
    80002a4c:	00411717          	auipc	a4,0x411
    80002a50:	64470713          	add	a4,a4,1604 # 80414090 <lru_mgr+0x3000>
    80002a54:	01072783          	lw	a5,16(a4)
    80002a58:	02053023          	sd	zero,32(a0)
    80002a5c:	00053c23          	sd	zero,24(a0)
    80002a60:	fff7879b          	addw	a5,a5,-1
    80002a64:	00f72823          	sw	a5,16(a4)
    80002a68:	00008067          	ret
    80002a6c:	0040e697          	auipc	a3,0x40e
    80002a70:	62e6b223          	sd	a4,1572(a3) # 80411090 <lru_mgr>
    80002a74:	fc071ae3          	bnez	a4,80002a48 <lru_remove_page+0x18>
    80002a78:	0040e717          	auipc	a4,0x40e
    80002a7c:	62f73023          	sd	a5,1568(a4) # 80411098 <lru_mgr+0x8>
    80002a80:	fcdff06f          	j	80002a4c <lru_remove_page+0x1c>

0000000080002a84 <lru_touch_page>:
    80002a84:	fffff7b7          	lui	a5,0xfffff
    80002a88:	00f57533          	and	a0,a0,a5
    80002a8c:	00000713          	li	a4,0
    80002a90:	0040e797          	auipc	a5,0x40e
    80002a94:	61078793          	add	a5,a5,1552 # 804110a0 <lru_mgr+0x10>
    80002a98:	10000613          	li	a2,256
    80002a9c:	0100006f          	j	80002aac <lru_touch_page+0x28>
    80002aa0:	0017071b          	addw	a4,a4,1
    80002aa4:	03078793          	add	a5,a5,48
    80002aa8:	0ac70663          	beq	a4,a2,80002b54 <lru_touch_page+0xd0>
    80002aac:	0007b683          	ld	a3,0(a5)
    80002ab0:	fea698e3          	bne	a3,a0,80002aa0 <lru_touch_page+0x1c>
    80002ab4:	0147a683          	lw	a3,20(a5)
    80002ab8:	0016f693          	and	a3,a3,1
    80002abc:	fe0682e3          	beqz	a3,80002aa0 <lru_touch_page+0x1c>
    80002ac0:	00171613          	sll	a2,a4,0x1
    80002ac4:	00e607b3          	add	a5,a2,a4
    80002ac8:	0040e597          	auipc	a1,0x40e
    80002acc:	5c858593          	add	a1,a1,1480 # 80411090 <lru_mgr>
    80002ad0:	00479793          	sll	a5,a5,0x4
    80002ad4:	00170513          	add	a0,a4,1
    80002ad8:	00f58833          	add	a6,a1,a5
    80002adc:	00151693          	sll	a3,a0,0x1
    80002ae0:	00a686b3          	add	a3,a3,a0
    80002ae4:	02883803          	ld	a6,40(a6)
    80002ae8:	00469693          	sll	a3,a3,0x4
    80002aec:	01078793          	add	a5,a5,16
    80002af0:	00d586b3          	add	a3,a1,a3
    80002af4:	0006b683          	ld	a3,0(a3)
    80002af8:	00f587b3          	add	a5,a1,a5
    80002afc:	04080e63          	beqz	a6,80002b58 <lru_touch_page+0xd4>
    80002b00:	02d83023          	sd	a3,32(a6)
    80002b04:	0005b883          	ld	a7,0(a1)
    80002b08:	04068c63          	beqz	a3,80002b60 <lru_touch_page+0xdc>
    80002b0c:	0106bc23          	sd	a6,24(a3)
    80002b10:	00151693          	sll	a3,a0,0x1
    80002b14:	00e60733          	add	a4,a2,a4
    80002b18:	00a686b3          	add	a3,a3,a0
    80002b1c:	00469693          	sll	a3,a3,0x4
    80002b20:	00471713          	sll	a4,a4,0x4
    80002b24:	00e58733          	add	a4,a1,a4
    80002b28:	00d586b3          	add	a3,a1,a3
    80002b2c:	00411617          	auipc	a2,0x411
    80002b30:	56460613          	add	a2,a2,1380 # 80414090 <lru_mgr+0x3000>
    80002b34:	02073423          	sd	zero,40(a4)
    80002b38:	0116b023          	sd	a7,0(a3)
    80002b3c:	01062703          	lw	a4,16(a2)
    80002b40:	02088463          	beqz	a7,80002b68 <lru_touch_page+0xe4>
    80002b44:	00f8bc23          	sd	a5,24(a7)
    80002b48:	00f5b023          	sd	a5,0(a1)
    80002b4c:	00e62823          	sw	a4,16(a2)
    80002b50:	00008067          	ret
    80002b54:	00008067          	ret
    80002b58:	00068893          	mv	a7,a3
    80002b5c:	fa0698e3          	bnez	a3,80002b0c <lru_touch_page+0x88>
    80002b60:	0105b423          	sd	a6,8(a1)
    80002b64:	fadff06f          	j	80002b10 <lru_touch_page+0x8c>
    80002b68:	00f5b423          	sd	a5,8(a1)
    80002b6c:	00f5b023          	sd	a5,0(a1)
    80002b70:	00e62823          	sw	a4,16(a2)
    80002b74:	00008067          	ret

0000000080002b78 <find_victim_page>:
    80002b78:	0040e517          	auipc	a0,0x40e
    80002b7c:	52053503          	ld	a0,1312(a0) # 80411098 <lru_mgr+0x8>
    80002b80:	00008067          	ret

0000000080002b84 <swap_out_page>:
    80002b84:	16050263          	beqz	a0,80002ce8 <swap_out_page+0x164>
    80002b88:	fd010113          	add	sp,sp,-48
    80002b8c:	00913c23          	sd	s1,24(sp)
    80002b90:	01452483          	lw	s1,20(a0)
    80002b94:	02813023          	sd	s0,32(sp)
    80002b98:	01313423          	sd	s3,8(sp)
    80002b9c:	02113423          	sd	ra,40(sp)
    80002ba0:	01213823          	sd	s2,16(sp)
    80002ba4:	0014f793          	and	a5,s1,1
    80002ba8:	00050413          	mv	s0,a0
    80002bac:	00048993          	mv	s3,s1
    80002bb0:	12078863          	beqz	a5,80002ce0 <swap_out_page+0x15c>
    80002bb4:	c39ff0ef          	jal	800027ec <alloc_swap_slot>
    80002bb8:	0005091b          	sext.w	s2,a0
    80002bbc:	fff00793          	li	a5,-1
    80002bc0:	12f90063          	beq	s2,a5,80002ce0 <swap_out_page+0x15c>
    80002bc4:	0049f993          	and	s3,s3,4
    80002bc8:	04098663          	beqz	s3,80002c14 <swap_out_page+0x90>
    80002bcc:	00843683          	ld	a3,8(s0)
    80002bd0:	00c9171b          	sllw	a4,s2,0xc
    80002bd4:	0000e797          	auipc	a5,0xe
    80002bd8:	4bc78793          	add	a5,a5,1212 # 80011090 <swap_area>
    80002bdc:	02071713          	sll	a4,a4,0x20
    80002be0:	02075713          	srl	a4,a4,0x20
    80002be4:	40f686b3          	sub	a3,a3,a5
    80002be8:	0000f617          	auipc	a2,0xf
    80002bec:	4a860613          	add	a2,a2,1192 # 80012090 <swap_area+0x1000>
    80002bf0:	00f707b3          	add	a5,a4,a5
    80002bf4:	00e60633          	add	a2,a2,a4
    80002bf8:	40e686b3          	sub	a3,a3,a4
    80002bfc:	00f68733          	add	a4,a3,a5
    80002c00:	00074703          	lbu	a4,0(a4)
    80002c04:	00178793          	add	a5,a5,1
    80002c08:	fee78fa3          	sb	a4,-1(a5)
    80002c0c:	fec798e3          	bne	a5,a2,80002bfc <swap_out_page+0x78>
    80002c10:	01442483          	lw	s1,20(s0)
    80002c14:	00043583          	ld	a1,0(s0)
    80002c18:	02843503          	ld	a0,40(s0)
    80002c1c:	f11fe0ef          	jal	80001b2c <walk_lookup>
    80002c20:	00050863          	beqz	a0,80002c30 <swap_out_page+0xac>
    80002c24:	00053783          	ld	a5,0(a0)
    80002c28:	0017f713          	and	a4,a5,1
    80002c2c:	08071063          	bnez	a4,80002cac <swap_out_page+0x128>
    80002c30:	ffe4f793          	and	a5,s1,-2
    80002c34:	0027e793          	or	a5,a5,2
    80002c38:	02091913          	sll	s2,s2,0x20
    80002c3c:	02079793          	sll	a5,a5,0x20
    80002c40:	00843503          	ld	a0,8(s0)
    80002c44:	02095913          	srl	s2,s2,0x20
    80002c48:	00f96933          	or	s2,s2,a5
    80002c4c:	01243823          	sd	s2,16(s0)
    80002c50:	df5fe0ef          	jal	80001a44 <free_page>
    80002c54:	01843783          	ld	a5,24(s0)
    80002c58:	00043423          	sd	zero,8(s0)
    80002c5c:	02043703          	ld	a4,32(s0)
    80002c60:	06078463          	beqz	a5,80002cc8 <swap_out_page+0x144>
    80002c64:	02e7b023          	sd	a4,32(a5)
    80002c68:	06070663          	beqz	a4,80002cd4 <swap_out_page+0x150>
    80002c6c:	00f73c23          	sd	a5,24(a4)
    80002c70:	00411717          	auipc	a4,0x411
    80002c74:	42070713          	add	a4,a4,1056 # 80414090 <lru_mgr+0x3000>
    80002c78:	01072783          	lw	a5,16(a4)
    80002c7c:	02043023          	sd	zero,32(s0)
    80002c80:	00043c23          	sd	zero,24(s0)
    80002c84:	fff7879b          	addw	a5,a5,-1
    80002c88:	00f72823          	sw	a5,16(a4)
    80002c8c:	00000513          	li	a0,0
    80002c90:	02813083          	ld	ra,40(sp)
    80002c94:	02013403          	ld	s0,32(sp)
    80002c98:	01813483          	ld	s1,24(sp)
    80002c9c:	01013903          	ld	s2,16(sp)
    80002ca0:	00813983          	ld	s3,8(sp)
    80002ca4:	03010113          	add	sp,sp,48
    80002ca8:	00008067          	ret
    80002cac:	00a9171b          	sllw	a4,s2,0xa
    80002cb0:	02071713          	sll	a4,a4,0x20
    80002cb4:	ffe7f793          	and	a5,a5,-2
    80002cb8:	02075713          	srl	a4,a4,0x20
    80002cbc:	00e7e7b3          	or	a5,a5,a4
    80002cc0:	00f53023          	sd	a5,0(a0)
    80002cc4:	f6dff06f          	j	80002c30 <swap_out_page+0xac>
    80002cc8:	0040e697          	auipc	a3,0x40e
    80002ccc:	3ce6b423          	sd	a4,968(a3) # 80411090 <lru_mgr>
    80002cd0:	f8071ee3          	bnez	a4,80002c6c <swap_out_page+0xe8>
    80002cd4:	0040e717          	auipc	a4,0x40e
    80002cd8:	3cf73223          	sd	a5,964(a4) # 80411098 <lru_mgr+0x8>
    80002cdc:	f95ff06f          	j	80002c70 <swap_out_page+0xec>
    80002ce0:	fff00513          	li	a0,-1
    80002ce4:	fadff06f          	j	80002c90 <swap_out_page+0x10c>
    80002ce8:	fff00513          	li	a0,-1
    80002cec:	00008067          	ret

0000000080002cf0 <swap_in_page>:
    80002cf0:	12050263          	beqz	a0,80002e14 <swap_in_page+0x124>
    80002cf4:	01452783          	lw	a5,20(a0)
    80002cf8:	fe010113          	add	sp,sp,-32
    80002cfc:	00813823          	sd	s0,16(sp)
    80002d00:	00113c23          	sd	ra,24(sp)
    80002d04:	00913423          	sd	s1,8(sp)
    80002d08:	0027f793          	and	a5,a5,2
    80002d0c:	00050413          	mv	s0,a0
    80002d10:	0e078e63          	beqz	a5,80002e0c <swap_in_page+0x11c>
    80002d14:	01052703          	lw	a4,16(a0)
    80002d18:	0000e797          	auipc	a5,0xe
    80002d1c:	37878793          	add	a5,a5,888 # 80011090 <swap_area>
    80002d20:	40f58633          	sub	a2,a1,a5
    80002d24:	00c7171b          	sllw	a4,a4,0xc
    80002d28:	02071713          	sll	a4,a4,0x20
    80002d2c:	02075713          	srl	a4,a4,0x20
    80002d30:	0000f817          	auipc	a6,0xf
    80002d34:	36080813          	add	a6,a6,864 # 80012090 <swap_area+0x1000>
    80002d38:	00058493          	mv	s1,a1
    80002d3c:	00f707b3          	add	a5,a4,a5
    80002d40:	00e80833          	add	a6,a6,a4
    80002d44:	40e60633          	sub	a2,a2,a4
    80002d48:	0007c683          	lbu	a3,0(a5)
    80002d4c:	00f60733          	add	a4,a2,a5
    80002d50:	00178793          	add	a5,a5,1
    80002d54:	00d70023          	sb	a3,0(a4)
    80002d58:	ff0798e3          	bne	a5,a6,80002d48 <swap_in_page+0x58>
    80002d5c:	00043583          	ld	a1,0(s0)
    80002d60:	02843503          	ld	a0,40(s0)
    80002d64:	dc9fe0ef          	jal	80001b2c <walk_lookup>
    80002d68:	02050063          	beqz	a0,80002d88 <swap_in_page+0x98>
    80002d6c:	00053703          	ld	a4,0(a0)
    80002d70:	00c4d793          	srl	a5,s1,0xc
    80002d74:	00a79793          	sll	a5,a5,0xa
    80002d78:	01e77713          	and	a4,a4,30
    80002d7c:	00e7e7b3          	or	a5,a5,a4
    80002d80:	0017e793          	or	a5,a5,1
    80002d84:	00f53023          	sd	a5,0(a0)
    80002d88:	01442783          	lw	a5,20(s0)
    80002d8c:	01042503          	lw	a0,16(s0)
    80002d90:	00943423          	sd	s1,8(s0)
    80002d94:	ffd7f793          	and	a5,a5,-3
    80002d98:	0017e793          	or	a5,a5,1
    80002d9c:	00f42a23          	sw	a5,20(s0)
    80002da0:	0000e797          	auipc	a5,0xe
    80002da4:	2e47a783          	lw	a5,740(a5) # 80011084 <swap_mgr+0x84>
    80002da8:	00f57463          	bgeu	a0,a5,80002db0 <swap_in_page+0xc0>
    80002dac:	df5fe0ef          	jal	80001ba0 <free_swap_slot.part.0>
    80002db0:	0040e717          	auipc	a4,0x40e
    80002db4:	2e070713          	add	a4,a4,736 # 80411090 <lru_mgr>
    80002db8:	00073783          	ld	a5,0(a4)
    80002dbc:	fff00693          	li	a3,-1
    80002dc0:	00d42823          	sw	a3,16(s0)
    80002dc4:	02f43023          	sd	a5,32(s0)
    80002dc8:	00043c23          	sd	zero,24(s0)
    80002dcc:	02078c63          	beqz	a5,80002e04 <swap_in_page+0x114>
    80002dd0:	0087bc23          	sd	s0,24(a5)
    80002dd4:	00411697          	auipc	a3,0x411
    80002dd8:	2bc68693          	add	a3,a3,700 # 80414090 <lru_mgr+0x3000>
    80002ddc:	0106a783          	lw	a5,16(a3)
    80002de0:	00873023          	sd	s0,0(a4)
    80002de4:	00000513          	li	a0,0
    80002de8:	0017879b          	addw	a5,a5,1
    80002dec:	00f6a823          	sw	a5,16(a3)
    80002df0:	01813083          	ld	ra,24(sp)
    80002df4:	01013403          	ld	s0,16(sp)
    80002df8:	00813483          	ld	s1,8(sp)
    80002dfc:	02010113          	add	sp,sp,32
    80002e00:	00008067          	ret
    80002e04:	00873423          	sd	s0,8(a4)
    80002e08:	fcdff06f          	j	80002dd4 <swap_in_page+0xe4>
    80002e0c:	fff00513          	li	a0,-1
    80002e10:	fe1ff06f          	j	80002df0 <swap_in_page+0x100>
    80002e14:	fff00513          	li	a0,-1
    80002e18:	00008067          	ret

0000000080002e1c <handle_page_fault>:
    80002e1c:	fd010113          	add	sp,sp,-48
    80002e20:	fffff7b7          	lui	a5,0xfffff
    80002e24:	02813023          	sd	s0,32(sp)
    80002e28:	00f5f433          	and	s0,a1,a5
    80002e2c:	00040593          	mv	a1,s0
    80002e30:	01213823          	sd	s2,16(sp)
    80002e34:	02113423          	sd	ra,40(sp)
    80002e38:	00913c23          	sd	s1,24(sp)
    80002e3c:	01313423          	sd	s3,8(sp)
    80002e40:	00050913          	mv	s2,a0
    80002e44:	ce9fe0ef          	jal	80001b2c <walk_lookup>
    80002e48:	12050c63          	beqz	a0,80002f80 <handle_page_fault+0x164>
    80002e4c:	00053483          	ld	s1,0(a0)
    80002e50:	0014f793          	and	a5,s1,1
    80002e54:	12079663          	bnez	a5,80002f80 <handle_page_fault+0x164>
    80002e58:	12048463          	beqz	s1,80002f80 <handle_page_fault+0x164>
    80002e5c:	00a4d493          	srl	s1,s1,0xa
    80002e60:	bc9fe0ef          	jal	80001a28 <alloc_page>
    80002e64:	0004849b          	sext.w	s1,s1
    80002e68:	00050993          	mv	s3,a0
    80002e6c:	0e050a63          	beqz	a0,80002f60 <handle_page_fault+0x144>
    80002e70:	0040e797          	auipc	a5,0x40e
    80002e74:	23078793          	add	a5,a5,560 # 804110a0 <lru_mgr+0x10>
    80002e78:	00000713          	li	a4,0
    80002e7c:	10000613          	li	a2,256
    80002e80:	0100006f          	j	80002e90 <handle_page_fault+0x74>
    80002e84:	0017071b          	addw	a4,a4,1
    80002e88:	03078793          	add	a5,a5,48
    80002e8c:	06c70063          	beq	a4,a2,80002eec <handle_page_fault+0xd0>
    80002e90:	0007b683          	ld	a3,0(a5)
    80002e94:	fe8698e3          	bne	a3,s0,80002e84 <handle_page_fault+0x68>
    80002e98:	0147a683          	lw	a3,20(a5)
    80002e9c:	0026f693          	and	a3,a3,2
    80002ea0:	fe0682e3          	beqz	a3,80002e84 <handle_page_fault+0x68>
    80002ea4:	0107a683          	lw	a3,16(a5)
    80002ea8:	fc969ee3          	bne	a3,s1,80002e84 <handle_page_fault+0x68>
    80002eac:	00171513          	sll	a0,a4,0x1
    80002eb0:	00e50533          	add	a0,a0,a4
    80002eb4:	00451513          	sll	a0,a0,0x4
    80002eb8:	0040e797          	auipc	a5,0x40e
    80002ebc:	1e878793          	add	a5,a5,488 # 804110a0 <lru_mgr+0x10>
    80002ec0:	00f50533          	add	a0,a0,a5
    80002ec4:	00098593          	mv	a1,s3
    80002ec8:	e29ff0ef          	jal	80002cf0 <swap_in_page>
    80002ecc:	0a051e63          	bnez	a0,80002f88 <handle_page_fault+0x16c>
    80002ed0:	02813083          	ld	ra,40(sp)
    80002ed4:	02013403          	ld	s0,32(sp)
    80002ed8:	01813483          	ld	s1,24(sp)
    80002edc:	01013903          	ld	s2,16(sp)
    80002ee0:	00813983          	ld	s3,8(sp)
    80002ee4:	03010113          	add	sp,sp,48
    80002ee8:	00008067          	ret
    80002eec:	0040e717          	auipc	a4,0x40e
    80002ef0:	1c870713          	add	a4,a4,456 # 804110b4 <lru_mgr+0x24>
    80002ef4:	00000793          	li	a5,0
    80002ef8:	10000613          	li	a2,256
    80002efc:	00c0006f          	j	80002f08 <handle_page_fault+0xec>
    80002f00:	0017879b          	addw	a5,a5,1
    80002f04:	08c78263          	beq	a5,a2,80002f88 <handle_page_fault+0x16c>
    80002f08:	00072683          	lw	a3,0(a4)
    80002f0c:	03070713          	add	a4,a4,48
    80002f10:	fe0698e3          	bnez	a3,80002f00 <handle_page_fault+0xe4>
    80002f14:	00178613          	add	a2,a5,1
    80002f18:	00179713          	sll	a4,a5,0x1
    80002f1c:	00161693          	sll	a3,a2,0x1
    80002f20:	00f707b3          	add	a5,a4,a5
    80002f24:	00479793          	sll	a5,a5,0x4
    80002f28:	00c68733          	add	a4,a3,a2
    80002f2c:	0040e617          	auipc	a2,0x40e
    80002f30:	16460613          	add	a2,a2,356 # 80411090 <lru_mgr>
    80002f34:	00f606b3          	add	a3,a2,a5
    80002f38:	00471713          	sll	a4,a4,0x4
    80002f3c:	01078793          	add	a5,a5,16
    80002f40:	00e60733          	add	a4,a2,a4
    80002f44:	00c78533          	add	a0,a5,a2
    80002f48:	00200793          	li	a5,2
    80002f4c:	0086b823          	sd	s0,16(a3)
    80002f50:	01273423          	sd	s2,8(a4)
    80002f54:	0296a023          	sw	s1,32(a3)
    80002f58:	02f6a223          	sw	a5,36(a3)
    80002f5c:	f69ff06f          	j	80002ec4 <handle_page_fault+0xa8>
    80002f60:	0040e517          	auipc	a0,0x40e
    80002f64:	13853503          	ld	a0,312(a0) # 80411098 <lru_mgr+0x8>
    80002f68:	00050c63          	beqz	a0,80002f80 <handle_page_fault+0x164>
    80002f6c:	c19ff0ef          	jal	80002b84 <swap_out_page>
    80002f70:	00051863          	bnez	a0,80002f80 <handle_page_fault+0x164>
    80002f74:	ab5fe0ef          	jal	80001a28 <alloc_page>
    80002f78:	00050993          	mv	s3,a0
    80002f7c:	ee051ae3          	bnez	a0,80002e70 <handle_page_fault+0x54>
    80002f80:	fff00513          	li	a0,-1
    80002f84:	f4dff06f          	j	80002ed0 <handle_page_fault+0xb4>
    80002f88:	00098513          	mv	a0,s3
    80002f8c:	ab9fe0ef          	jal	80001a44 <free_page>
    80002f90:	fff00513          	li	a0,-1
    80002f94:	f3dff06f          	j	80002ed0 <handle_page_fault+0xb4>

0000000080002f98 <va2pa_with_replacement>:
    80002f98:	fe010113          	add	sp,sp,-32
    80002f9c:	00913423          	sd	s1,8(sp)
    80002fa0:	01213023          	sd	s2,0(sp)
    80002fa4:	00113c23          	sd	ra,24(sp)
    80002fa8:	00813823          	sd	s0,16(sp)
    80002fac:	00050493          	mv	s1,a0
    80002fb0:	00058913          	mv	s2,a1
    80002fb4:	b79fe0ef          	jal	80001b2c <walk_lookup>
    80002fb8:	00050a63          	beqz	a0,80002fcc <va2pa_with_replacement+0x34>
    80002fbc:	00053403          	ld	s0,0(a0)
    80002fc0:	00147793          	and	a5,s0,1
    80002fc4:	06079663          	bnez	a5,80003030 <va2pa_with_replacement+0x98>
    80002fc8:	02041063          	bnez	s0,80002fe8 <va2pa_with_replacement+0x50>
    80002fcc:	00000513          	li	a0,0
    80002fd0:	01813083          	ld	ra,24(sp)
    80002fd4:	01013403          	ld	s0,16(sp)
    80002fd8:	00813483          	ld	s1,8(sp)
    80002fdc:	00013903          	ld	s2,0(sp)
    80002fe0:	02010113          	add	sp,sp,32
    80002fe4:	00008067          	ret
    80002fe8:	00600613          	li	a2,6
    80002fec:	00090593          	mv	a1,s2
    80002ff0:	00048513          	mv	a0,s1
    80002ff4:	e29ff0ef          	jal	80002e1c <handle_page_fault>
    80002ff8:	fc051ae3          	bnez	a0,80002fcc <va2pa_with_replacement+0x34>
    80002ffc:	00090593          	mv	a1,s2
    80003000:	00048513          	mv	a0,s1
    80003004:	b29fe0ef          	jal	80001b2c <walk_lookup>
    80003008:	fc0502e3          	beqz	a0,80002fcc <va2pa_with_replacement+0x34>
    8000300c:	00053783          	ld	a5,0(a0)
    80003010:	0017f713          	and	a4,a5,1
    80003014:	fa070ce3          	beqz	a4,80002fcc <va2pa_with_replacement+0x34>
    80003018:	00a7d793          	srl	a5,a5,0xa
    8000301c:	03491593          	sll	a1,s2,0x34
    80003020:	00c79513          	sll	a0,a5,0xc
    80003024:	0345d593          	srl	a1,a1,0x34
    80003028:	00b50533          	add	a0,a0,a1
    8000302c:	fa5ff06f          	j	80002fd0 <va2pa_with_replacement+0x38>
    80003030:	00090513          	mv	a0,s2
    80003034:	a51ff0ef          	jal	80002a84 <lru_touch_page>
    80003038:	01813083          	ld	ra,24(sp)
    8000303c:	00a45513          	srl	a0,s0,0xa
    80003040:	01013403          	ld	s0,16(sp)
    80003044:	03491593          	sll	a1,s2,0x34
    80003048:	00c51513          	sll	a0,a0,0xc
    8000304c:	0345d593          	srl	a1,a1,0x34
    80003050:	00813483          	ld	s1,8(sp)
    80003054:	00013903          	ld	s2,0(sp)
    80003058:	00b50533          	add	a0,a0,a1
    8000305c:	02010113          	add	sp,sp,32
    80003060:	00008067          	ret

0000000080003064 <safe_copyout>:
    80003064:	14068063          	beqz	a3,800031a4 <safe_copyout+0x140>
    80003068:	fb010113          	add	sp,sp,-80
    8000306c:	02913c23          	sd	s1,56(sp)
    80003070:	03213823          	sd	s2,48(sp)
    80003074:	03313423          	sd	s3,40(sp)
    80003078:	03413023          	sd	s4,32(sp)
    8000307c:	01513c23          	sd	s5,24(sp)
    80003080:	01613823          	sd	s6,16(sp)
    80003084:	01713423          	sd	s7,8(sp)
    80003088:	01813023          	sd	s8,0(sp)
    8000308c:	04113423          	sd	ra,72(sp)
    80003090:	04813023          	sd	s0,64(sp)
    80003094:	00068b13          	mv	s6,a3
    80003098:	00050993          	mv	s3,a0
    8000309c:	00058c13          	mv	s8,a1
    800030a0:	00060b93          	mv	s7,a2
    800030a4:	fffffa37          	lui	s4,0xfffff
    800030a8:	00001937          	lui	s2,0x1
    800030ac:	10000493          	li	s1,256
    800030b0:	0040ea97          	auipc	s5,0x40e
    800030b4:	fe0a8a93          	add	s5,s5,-32 # 80411090 <lru_mgr>
    800030b8:	014c7433          	and	s0,s8,s4
    800030bc:	00040593          	mv	a1,s0
    800030c0:	00098513          	mv	a0,s3
    800030c4:	ed5ff0ef          	jal	80002f98 <va2pa_with_replacement>
    800030c8:	0c050a63          	beqz	a0,8000319c <safe_copyout+0x138>
    800030cc:	41840833          	sub	a6,s0,s8
    800030d0:	01280833          	add	a6,a6,s2
    800030d4:	010b7463          	bgeu	s6,a6,800030dc <safe_copyout+0x78>
    800030d8:	000b0813          	mv	a6,s6
    800030dc:	01850733          	add	a4,a0,s8
    800030e0:	40870733          	sub	a4,a4,s0
    800030e4:	01780533          	add	a0,a6,s7
    800030e8:	000b8793          	mv	a5,s7
    800030ec:	41770733          	sub	a4,a4,s7
    800030f0:	0a080263          	beqz	a6,80003194 <safe_copyout+0x130>
    800030f4:	0007c583          	lbu	a1,0(a5)
    800030f8:	00f70633          	add	a2,a4,a5
    800030fc:	00178793          	add	a5,a5,1
    80003100:	00b60023          	sb	a1,0(a2)
    80003104:	fef518e3          	bne	a0,a5,800030f4 <safe_copyout+0x90>
    80003108:	0040e797          	auipc	a5,0x40e
    8000310c:	f9878793          	add	a5,a5,-104 # 804110a0 <lru_mgr+0x10>
    80003110:	00000713          	li	a4,0
    80003114:	0100006f          	j	80003124 <safe_copyout+0xc0>
    80003118:	0017071b          	addw	a4,a4,1
    8000311c:	03078793          	add	a5,a5,48
    80003120:	02970863          	beq	a4,s1,80003150 <safe_copyout+0xec>
    80003124:	0007b603          	ld	a2,0(a5)
    80003128:	fec418e3          	bne	s0,a2,80003118 <safe_copyout+0xb4>
    8000312c:	0147a603          	lw	a2,20(a5)
    80003130:	00167593          	and	a1,a2,1
    80003134:	fe0582e3          	beqz	a1,80003118 <safe_copyout+0xb4>
    80003138:	00171793          	sll	a5,a4,0x1
    8000313c:	00e787b3          	add	a5,a5,a4
    80003140:	00479793          	sll	a5,a5,0x4
    80003144:	00fa87b3          	add	a5,s5,a5
    80003148:	00466613          	or	a2,a2,4
    8000314c:	02c7a223          	sw	a2,36(a5)
    80003150:	410b0b33          	sub	s6,s6,a6
    80003154:	00050b93          	mv	s7,a0
    80003158:	01240c33          	add	s8,s0,s2
    8000315c:	f40b1ee3          	bnez	s6,800030b8 <safe_copyout+0x54>
    80003160:	00000513          	li	a0,0
    80003164:	04813083          	ld	ra,72(sp)
    80003168:	04013403          	ld	s0,64(sp)
    8000316c:	03813483          	ld	s1,56(sp)
    80003170:	03013903          	ld	s2,48(sp)
    80003174:	02813983          	ld	s3,40(sp)
    80003178:	02013a03          	ld	s4,32(sp)
    8000317c:	01813a83          	ld	s5,24(sp)
    80003180:	01013b03          	ld	s6,16(sp)
    80003184:	00813b83          	ld	s7,8(sp)
    80003188:	00013c03          	ld	s8,0(sp)
    8000318c:	05010113          	add	sp,sp,80
    80003190:	00008067          	ret
    80003194:	000b8513          	mv	a0,s7
    80003198:	f71ff06f          	j	80003108 <safe_copyout+0xa4>
    8000319c:	fff00513          	li	a0,-1
    800031a0:	fc5ff06f          	j	80003164 <safe_copyout+0x100>
    800031a4:	00000513          	li	a0,0
    800031a8:	00008067          	ret

00000000800031ac <safe_copyin>:
    800031ac:	0e068863          	beqz	a3,8000329c <safe_copyin+0xf0>
    800031b0:	fc010113          	add	sp,sp,-64
    800031b4:	02813823          	sd	s0,48(sp)
    800031b8:	02913423          	sd	s1,40(sp)
    800031bc:	03213023          	sd	s2,32(sp)
    800031c0:	01313c23          	sd	s3,24(sp)
    800031c4:	01513423          	sd	s5,8(sp)
    800031c8:	01613023          	sd	s6,0(sp)
    800031cc:	02113c23          	sd	ra,56(sp)
    800031d0:	01413823          	sd	s4,16(sp)
    800031d4:	00068b13          	mv	s6,a3
    800031d8:	00050493          	mv	s1,a0
    800031dc:	00058993          	mv	s3,a1
    800031e0:	00060a93          	mv	s5,a2
    800031e4:	fffff937          	lui	s2,0xfffff
    800031e8:	00001437          	lui	s0,0x1
    800031ec:	012afa33          	and	s4,s5,s2
    800031f0:	000a0593          	mv	a1,s4
    800031f4:	00048513          	mv	a0,s1
    800031f8:	da1ff0ef          	jal	80002f98 <va2pa_with_replacement>
    800031fc:	08050c63          	beqz	a0,80003294 <safe_copyin+0xe8>
    80003200:	415a08b3          	sub	a7,s4,s5
    80003204:	008888b3          	add	a7,a7,s0
    80003208:	011b7463          	bgeu	s6,a7,80003210 <safe_copyin+0x64>
    8000320c:	000b0893          	mv	a7,s6
    80003210:	01550533          	add	a0,a0,s5
    80003214:	41450533          	sub	a0,a0,s4
    80003218:	06088063          	beqz	a7,80003278 <safe_copyin+0xcc>
    8000321c:	00098793          	mv	a5,s3
    80003220:	01198833          	add	a6,s3,a7
    80003224:	41350733          	sub	a4,a0,s3
    80003228:	00f70633          	add	a2,a4,a5
    8000322c:	00064603          	lbu	a2,0(a2)
    80003230:	00178793          	add	a5,a5,1
    80003234:	fec78fa3          	sb	a2,-1(a5)
    80003238:	fef818e3          	bne	a6,a5,80003228 <safe_copyin+0x7c>
    8000323c:	411b0b33          	sub	s6,s6,a7
    80003240:	00080993          	mv	s3,a6
    80003244:	008a0ab3          	add	s5,s4,s0
    80003248:	fa0b12e3          	bnez	s6,800031ec <safe_copyin+0x40>
    8000324c:	00000513          	li	a0,0
    80003250:	03813083          	ld	ra,56(sp)
    80003254:	03013403          	ld	s0,48(sp)
    80003258:	02813483          	ld	s1,40(sp)
    8000325c:	02013903          	ld	s2,32(sp)
    80003260:	01813983          	ld	s3,24(sp)
    80003264:	01013a03          	ld	s4,16(sp)
    80003268:	00813a83          	ld	s5,8(sp)
    8000326c:	00013b03          	ld	s6,0(sp)
    80003270:	04010113          	add	sp,sp,64
    80003274:	00008067          	ret
    80003278:	00001ab7          	lui	s5,0x1
    8000327c:	015a0ab3          	add	s5,s4,s5
    80003280:	012afa33          	and	s4,s5,s2
    80003284:	000a0593          	mv	a1,s4
    80003288:	00048513          	mv	a0,s1
    8000328c:	d0dff0ef          	jal	80002f98 <va2pa_with_replacement>
    80003290:	f60518e3          	bnez	a0,80003200 <safe_copyin+0x54>
    80003294:	fff00513          	li	a0,-1
    80003298:	fb9ff06f          	j	80003250 <safe_copyin+0xa4>
    8000329c:	00000513          	li	a0,0
    800032a0:	00008067          	ret

00000000800032a4 <test_page_replacement>:
    800032a4:	f4010113          	add	sp,sp,-192
    800032a8:	00002517          	auipc	a0,0x2
    800032ac:	52050513          	add	a0,a0,1312 # 800057c8 <digits+0x60>
    800032b0:	0a113c23          	sd	ra,184(sp)
    800032b4:	0a813823          	sd	s0,176(sp)
    800032b8:	0a913423          	sd	s1,168(sp)
    800032bc:	0b213023          	sd	s2,160(sp)
    800032c0:	09313c23          	sd	s3,152(sp)
    800032c4:	eb8fe0ef          	jal	8000197c <uart_puts>
    800032c8:	00002517          	auipc	a0,0x2
    800032cc:	52850513          	add	a0,a0,1320 # 800057f0 <digits+0x88>
    800032d0:	eacfe0ef          	jal	8000197c <uart_puts>
    800032d4:	d18ff0ef          	jal	800027ec <alloc_swap_slot>
    800032d8:	0005049b          	sext.w	s1,a0
    800032dc:	d10ff0ef          	jal	800027ec <alloc_swap_slot>
    800032e0:	0005041b          	sext.w	s0,a0
    800032e4:	d08ff0ef          	jal	800027ec <alloc_swap_slot>
    800032e8:	fff00793          	li	a5,-1
    800032ec:	02f48663          	beq	s1,a5,80003318 <test_page_replacement+0x74>
    800032f0:	1cf40c63          	beq	s0,a5,800034c8 <test_page_replacement+0x224>
    800032f4:	0005051b          	sext.w	a0,a0
    800032f8:	02f50063          	beq	a0,a5,80003318 <test_page_replacement+0x74>
    800032fc:	00848e63          	beq	s1,s0,80003318 <test_page_replacement+0x74>
    80003300:	00a40c63          	beq	s0,a0,80003318 <test_page_replacement+0x74>
    80003304:	00a48a63          	beq	s1,a0,80003318 <test_page_replacement+0x74>
    80003308:	00002517          	auipc	a0,0x2
    8000330c:	51050513          	add	a0,a0,1296 # 80005818 <digits+0xb0>
    80003310:	e6cfe0ef          	jal	8000197c <uart_puts>
    80003314:	0100006f          	j	80003324 <test_page_replacement+0x80>
    80003318:	00002517          	auipc	a0,0x2
    8000331c:	52050513          	add	a0,a0,1312 # 80005838 <digits+0xd0>
    80003320:	e5cfe0ef          	jal	8000197c <uart_puts>
    80003324:	0000e797          	auipc	a5,0xe
    80003328:	d607a783          	lw	a5,-672(a5) # 80011084 <swap_mgr+0x84>
    8000332c:	00f47663          	bgeu	s0,a5,80003338 <test_page_replacement+0x94>
    80003330:	00040513          	mv	a0,s0
    80003334:	86dfe0ef          	jal	80001ba0 <free_swap_slot.part.0>
    80003338:	cb4ff0ef          	jal	800027ec <alloc_swap_slot>
    8000333c:	0005051b          	sext.w	a0,a0
    80003340:	14a40c63          	beq	s0,a0,80003498 <test_page_replacement+0x1f4>
    80003344:	00002517          	auipc	a0,0x2
    80003348:	53c50513          	add	a0,a0,1340 # 80005880 <digits+0x118>
    8000334c:	e30fe0ef          	jal	8000197c <uart_puts>
    80003350:	00002517          	auipc	a0,0x2
    80003354:	55850513          	add	a0,a0,1368 # 800058a8 <digits+0x140>
    80003358:	e24fe0ef          	jal	8000197c <uart_puts>
    8000335c:	00080737          	lui	a4,0x80
    80003360:	00170713          	add	a4,a4,1 # 80001 <_entry-0x7ff7ffff>
    80003364:	00010637          	lui	a2,0x10
    80003368:	00c71713          	sll	a4,a4,0xc
    8000336c:	fff00793          	li	a5,-1
    80003370:	01f7d793          	srl	a5,a5,0x1f
    80003374:	00c13023          	sd	a2,0(sp)
    80003378:	02e13c23          	sd	a4,56(sp)
    8000337c:	00100613          	li	a2,1
    80003380:	00012737          	lui	a4,0x12
    80003384:	01f61613          	sll	a2,a2,0x1f
    80003388:	00f13823          	sd	a5,16(sp)
    8000338c:	04f13023          	sd	a5,64(sp)
    80003390:	06e13023          	sd	a4,96(sp)
    80003394:	06f13823          	sd	a5,112(sp)
    80003398:	40001737          	lui	a4,0x40001
    8000339c:	03010793          	add	a5,sp,48
    800033a0:	00411697          	auipc	a3,0x411
    800033a4:	d206b683          	ld	a3,-736(a3) # 804140c0 <kernel_pagetable>
    800033a8:	00171713          	sll	a4,a4,0x1
    800033ac:	0040e417          	auipc	s0,0x40e
    800033b0:	ce440413          	add	s0,s0,-796 # 80411090 <lru_mgr>
    800033b4:	00010493          	mv	s1,sp
    800033b8:	06010993          	add	s3,sp,96
    800033bc:	00c13423          	sd	a2,8(sp)
    800033c0:	00f13c23          	sd	a5,24(sp)
    800033c4:	00011637          	lui	a2,0x11
    800033c8:	08f13023          	sd	a5,128(sp)
    800033cc:	00411917          	auipc	s2,0x411
    800033d0:	cc490913          	add	s2,s2,-828 # 80414090 <lru_mgr+0x3000>
    800033d4:	00300793          	li	a5,3
    800033d8:	00002517          	auipc	a0,0x2
    800033dc:	4f050513          	add	a0,a0,1264 # 800058c8 <digits+0x160>
    800033e0:	06e13423          	sd	a4,104(sp)
    800033e4:	00f92823          	sw	a5,16(s2)
    800033e8:	02013023          	sd	zero,32(sp)
    800033ec:	02d13423          	sd	a3,40(sp)
    800033f0:	02c13823          	sd	a2,48(sp)
    800033f4:	04d13c23          	sd	a3,88(sp)
    800033f8:	06013c23          	sd	zero,120(sp)
    800033fc:	08d13423          	sd	a3,136(sp)
    80003400:	00943423          	sd	s1,8(s0)
    80003404:	04913823          	sd	s1,80(sp)
    80003408:	05313423          	sd	s3,72(sp)
    8000340c:	01343023          	sd	s3,0(s0)
    80003410:	d6cfe0ef          	jal	8000197c <uart_puts>
    80003414:	04813783          	ld	a5,72(sp)
    80003418:	05013703          	ld	a4,80(sp)
    8000341c:	08078a63          	beqz	a5,800034b0 <test_page_replacement+0x20c>
    80003420:	02e7b023          	sd	a4,32(a5)
    80003424:	08070263          	beqz	a4,800034a8 <test_page_replacement+0x204>
    80003428:	00f73c23          	sd	a5,24(a4) # 40001018 <_entry-0x3fffefe8>
    8000342c:	01092783          	lw	a5,16(s2)
    80003430:	04013823          	sd	zero,80(sp)
    80003434:	04013423          	sd	zero,72(sp)
    80003438:	fff7871b          	addw	a4,a5,-1
    8000343c:	00e92823          	sw	a4,16(s2)
    80003440:	00200793          	li	a5,2
    80003444:	00f71663          	bne	a4,a5,80003450 <test_page_replacement+0x1ac>
    80003448:	00043783          	ld	a5,0(s0)
    8000344c:	09378663          	beq	a5,s3,800034d8 <test_page_replacement+0x234>
    80003450:	00002517          	auipc	a0,0x2
    80003454:	4b850513          	add	a0,a0,1208 # 80005908 <digits+0x1a0>
    80003458:	d24fe0ef          	jal	8000197c <uart_puts>
    8000345c:	00843783          	ld	a5,8(s0)
    80003460:	04978c63          	beq	a5,s1,800034b8 <test_page_replacement+0x214>
    80003464:	00002517          	auipc	a0,0x2
    80003468:	4e450513          	add	a0,a0,1252 # 80005948 <digits+0x1e0>
    8000346c:	d10fe0ef          	jal	8000197c <uart_puts>
    80003470:	00002517          	auipc	a0,0x2
    80003474:	4f850513          	add	a0,a0,1272 # 80005968 <digits+0x200>
    80003478:	d04fe0ef          	jal	8000197c <uart_puts>
    8000347c:	0b813083          	ld	ra,184(sp)
    80003480:	0b013403          	ld	s0,176(sp)
    80003484:	0a813483          	ld	s1,168(sp)
    80003488:	0a013903          	ld	s2,160(sp)
    8000348c:	09813983          	ld	s3,152(sp)
    80003490:	0c010113          	add	sp,sp,192
    80003494:	00008067          	ret
    80003498:	00002517          	auipc	a0,0x2
    8000349c:	3c050513          	add	a0,a0,960 # 80005858 <digits+0xf0>
    800034a0:	cdcfe0ef          	jal	8000197c <uart_puts>
    800034a4:	eadff06f          	j	80003350 <test_page_replacement+0xac>
    800034a8:	00f43423          	sd	a5,8(s0)
    800034ac:	f81ff06f          	j	8000342c <test_page_replacement+0x188>
    800034b0:	00e43023          	sd	a4,0(s0)
    800034b4:	f71ff06f          	j	80003424 <test_page_replacement+0x180>
    800034b8:	00002517          	auipc	a0,0x2
    800034bc:	47050513          	add	a0,a0,1136 # 80005928 <digits+0x1c0>
    800034c0:	cbcfe0ef          	jal	8000197c <uart_puts>
    800034c4:	fadff06f          	j	80003470 <test_page_replacement+0x1cc>
    800034c8:	00002517          	auipc	a0,0x2
    800034cc:	37050513          	add	a0,a0,880 # 80005838 <digits+0xd0>
    800034d0:	cacfe0ef          	jal	8000197c <uart_puts>
    800034d4:	e65ff06f          	j	80003338 <test_page_replacement+0x94>
    800034d8:	00843783          	ld	a5,8(s0)
    800034dc:	f6979ae3          	bne	a5,s1,80003450 <test_page_replacement+0x1ac>
    800034e0:	00002517          	auipc	a0,0x2
    800034e4:	40850513          	add	a0,a0,1032 # 800058e8 <digits+0x180>
    800034e8:	c94fe0ef          	jal	8000197c <uart_puts>
    800034ec:	f71ff06f          	j	8000345c <test_page_replacement+0x1b8>
