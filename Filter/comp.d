
comp.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <fast_filter3>:
   0:	41 57                	push   %r15
   2:	41 56                	push   %r14
   4:	41 55                	push   %r13
   6:	41 54                	push   %r12
   8:	55                   	push   %rbp
   9:	53                   	push   %rbx
   a:	44 8b 6e 08          	mov    0x8(%rsi),%r13d
   e:	4c 8b 1f             	mov    (%rdi),%r11
  11:	48 8b 3e             	mov    (%rsi),%rdi
  14:	41 8d 45 ff          	lea    -0x1(%r13),%eax
  18:	85 c0                	test   %eax,%eax
  1a:	0f 8e 8d 02 00 00    	jle    2ad <fast_filter3+0x2ad>
  20:	89 c6                	mov    %eax,%esi
  22:	41 8d 45 fe          	lea    -0x2(%r13),%eax
  26:	89 44 24 f8          	mov    %eax,-0x8(%rsp)
  2a:	31 c0                	xor    %eax,%eax
  2c:	d1 6c 24 f8          	shrl   -0x8(%rsp)
  30:	8b 4c 24 f8          	mov    -0x8(%rsp),%ecx
  34:	48 83 c1 01          	add    $0x1,%rcx
  38:	48 c1 e1 04          	shl    $0x4,%rcx
  3c:	0f 1f 40 00          	nopl   0x0(%rax)
  40:	49 c7 04 03 00 00 00 	movq   $0x0,(%r11,%rax,1)
  47:	00 
  48:	49 c7 44 03 08 00 00 	movq   $0x0,0x8(%r11,%rax,1)
  4f:	00 00 
  51:	48 83 c0 10          	add    $0x10,%rax
  55:	48 39 c8             	cmp    %rcx,%rax
  58:	75 e6                	jne    40 <fast_filter3+0x40>
  5a:	49 63 c5             	movslq %r13d,%rax
  5d:	44 89 6c 24 fc       	mov    %r13d,-0x4(%rsp)
  62:	bb 01 00 00 00       	mov    $0x1,%ebx
  67:	49 c7 44 c3 f8 00 00 	movq   $0x0,-0x8(%r11,%rax,8)
  6e:	00 00 
  70:	45 31 d2             	xor    %r10d,%r10d
  73:	45 31 c9             	xor    %r9d,%r9d
  76:	4c 8d 77 f8          	lea    -0x8(%rdi),%r14
  7a:	41 bf 1d 00 00 00    	mov    $0x1d,%r15d
  80:	41 89 f5             	mov    %esi,%r13d
  83:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  88:	c4 81 7b 10 04 13    	vmovsd (%r11,%r10,1),%xmm0
  8e:	4b 8d 0c 16          	lea    (%r14,%r10,1),%rcx
  92:	49 89 d0             	mov    %rdx,%r8
  95:	c4 81 7b 10 4c 13 08 	vmovsd 0x8(%r11,%r10,1),%xmm1
  9c:	31 c0                	xor    %eax,%eax
  9e:	66 90                	xchg   %ax,%ax
  a0:	44 89 ce             	mov    %r9d,%esi
  a3:	29 c6                	sub    %eax,%esi
  a5:	85 f6                	test   %esi,%esi
  a7:	0f 8e 03 01 00 00    	jle    1b0 <fast_filter3+0x1b0>
  ad:	c5 fb 10 51 08       	vmovsd 0x8(%rcx),%xmm2
  b2:	83 c0 02             	add    $0x2,%eax
  b5:	49 83 c0 10          	add    $0x10,%r8
  b9:	c4 c1 7b 10 60 f0    	vmovsd -0x10(%r8),%xmm4
  bf:	48 83 e9 10          	sub    $0x10,%rcx
  c3:	c4 c1 7b 10 58 f8    	vmovsd -0x8(%r8),%xmm3
  c9:	c5 db 59 ea          	vmulsd %xmm2,%xmm4,%xmm5
  cd:	c5 db 59 61 20       	vmulsd 0x20(%rcx),%xmm4,%xmm4
  d2:	c5 e3 59 d2          	vmulsd %xmm2,%xmm3,%xmm2
  d6:	c5 d3 58 c0          	vaddsd %xmm0,%xmm5,%xmm0
  da:	c5 e3 59 69 10       	vmulsd 0x10(%rcx),%xmm3,%xmm5
  df:	83 f8 1e             	cmp    $0x1e,%eax
  e2:	c5 db 58 c9          	vaddsd %xmm1,%xmm4,%xmm1
  e6:	c5 f3 58 ca          	vaddsd %xmm2,%xmm1,%xmm1
  ea:	c5 fb 58 c5          	vaddsd %xmm5,%xmm0,%xmm0
  ee:	75 b0                	jne    a0 <fast_filter3+0xa0>
  f0:	41 83 c1 02          	add    $0x2,%r9d
  f4:	c4 81 7b 11 04 13    	vmovsd %xmm0,(%r11,%r10,1)
  fa:	83 c3 02             	add    $0x2,%ebx
  fd:	c4 81 7b 11 4c 13 08 	vmovsd %xmm1,0x8(%r11,%r10,1)
 104:	49 83 c2 10          	add    $0x10,%r10
 108:	45 39 e9             	cmp    %r13d,%r9d
 10b:	0f 8c 77 ff ff ff    	jl     88 <fast_filter3+0x88>
 111:	8b 44 24 f8          	mov    -0x8(%rsp),%eax
 115:	44 8b 6c 24 fc       	mov    -0x4(%rsp),%r13d
 11a:	44 8d 4c 00 02       	lea    0x2(%rax,%rax,1),%r9d
 11f:	45 39 cd             	cmp    %r9d,%r13d
 122:	7e 7c                	jle    1a0 <fast_filter3+0x1a0>
 124:	49 63 c1             	movslq %r9d,%rax
 127:	bb 1d 00 00 00       	mov    $0x1d,%ebx
 12c:	48 c1 e0 03          	shl    $0x3,%rax
 130:	4c 8d 54 07 f8       	lea    -0x8(%rdi,%rax,1),%r10
 135:	49 01 c3             	add    %rax,%r11
 138:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 13f:	00 
 140:	c4 c1 7b 10 03       	vmovsd (%r11),%xmm0
 145:	4d 89 d0             	mov    %r10,%r8
 148:	48 89 d0             	mov    %rdx,%rax
 14b:	31 f6                	xor    %esi,%esi
 14d:	0f 1f 00             	nopl   (%rax)
 150:	44 89 c9             	mov    %r9d,%ecx
 153:	29 f1                	sub    %esi,%ecx
 155:	85 c9                	test   %ecx,%ecx
 157:	0f 8e f3 00 00 00    	jle    250 <fast_filter3+0x250>
 15d:	c5 fb 10 08          	vmovsd (%rax),%xmm1
 161:	83 c6 02             	add    $0x2,%esi
 164:	48 83 c0 10          	add    $0x10,%rax
 168:	49 83 e8 10          	sub    $0x10,%r8
 16c:	c4 c1 73 59 48 18    	vmulsd 0x18(%r8),%xmm1,%xmm1
 172:	c5 f3 58 c0          	vaddsd %xmm0,%xmm1,%xmm0
 176:	c5 fb 10 48 f8       	vmovsd -0x8(%rax),%xmm1
 17b:	c4 c1 73 59 48 10    	vmulsd 0x10(%r8),%xmm1,%xmm1
 181:	83 fe 1e             	cmp    $0x1e,%esi
 184:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 188:	75 c6                	jne    150 <fast_filter3+0x150>
 18a:	41 83 c1 01          	add    $0x1,%r9d
 18e:	c4 c1 7b 11 03       	vmovsd %xmm0,(%r11)
 193:	49 83 c2 08          	add    $0x8,%r10
 197:	49 83 c3 08          	add    $0x8,%r11
 19b:	45 39 e9             	cmp    %r13d,%r9d
 19e:	75 a0                	jne    140 <fast_filter3+0x140>
 1a0:	5b                   	pop    %rbx
 1a1:	5d                   	pop    %rbp
 1a2:	41 5c                	pop    %r12
 1a4:	41 5d                	pop    %r13
 1a6:	41 5e                	pop    %r14
 1a8:	41 5f                	pop    %r15
 1aa:	c3                   	retq   
 1ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 1b0:	85 f6                	test   %esi,%esi
 1b2:	78 48                	js     1fc <fast_filter3+0x1fc>
 1b4:	45 89 fc             	mov    %r15d,%r12d
 1b7:	48 63 e8             	movslq %eax,%rbp
 1ba:	41 89 c0             	mov    %eax,%r8d
 1bd:	48 8d 0c ea          	lea    (%rdx,%rbp,8),%rcx
 1c1:	41 29 c4             	sub    %eax,%r12d
 1c4:	41 f7 d0             	not    %r8d
 1c7:	4c 01 e5             	add    %r12,%rbp
 1ca:	45 01 c8             	add    %r9d,%r8d
 1cd:	48 8d 2c ea          	lea    (%rdx,%rbp,8),%rbp
 1d1:	eb 14                	jmp    1e7 <fast_filter3+0x1e7>
 1d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 1d8:	44 89 c6             	mov    %r8d,%esi
 1db:	48 83 c1 08          	add    $0x8,%rcx
 1df:	45 8d 40 ff          	lea    -0x1(%r8),%r8d
 1e3:	85 f6                	test   %esi,%esi
 1e5:	78 15                	js     1fc <fast_filter3+0x1fc>
 1e7:	c5 fb 10 11          	vmovsd (%rcx),%xmm2
 1eb:	48 63 f6             	movslq %esi,%rsi
 1ee:	48 39 e9             	cmp    %rbp,%rcx
 1f1:	c5 eb 59 14 f7       	vmulsd (%rdi,%rsi,8),%xmm2,%xmm2
 1f6:	c5 fb 58 c2          	vaddsd %xmm2,%xmm0,%xmm0
 1fa:	75 dc                	jne    1d8 <fast_filter3+0x1d8>
 1fc:	89 d9                	mov    %ebx,%ecx
 1fe:	29 c1                	sub    %eax,%ecx
 200:	0f 88 ea fe ff ff    	js     f0 <fast_filter3+0xf0>
 206:	45 8d 41 e3          	lea    -0x1d(%r9),%r8d
 20a:	89 c6                	mov    %eax,%esi
 20c:	48 98                	cltq   
 20e:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
 212:	f7 d6                	not    %esi
 214:	01 de                	add    %ebx,%esi
 216:	eb 19                	jmp    231 <fast_filter3+0x231>
 218:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 21f:	00 
 220:	89 f1                	mov    %esi,%ecx
 222:	48 83 c0 08          	add    $0x8,%rax
 226:	8d 76 ff             	lea    -0x1(%rsi),%esi
 229:	85 c9                	test   %ecx,%ecx
 22b:	0f 88 bf fe ff ff    	js     f0 <fast_filter3+0xf0>
 231:	c5 fb 10 10          	vmovsd (%rax),%xmm2
 235:	48 63 c9             	movslq %ecx,%rcx
 238:	41 39 f0             	cmp    %esi,%r8d
 23b:	c5 eb 59 14 cf       	vmulsd (%rdi,%rcx,8),%xmm2,%xmm2
 240:	c5 f3 58 ca          	vaddsd %xmm2,%xmm1,%xmm1
 244:	75 da                	jne    220 <fast_filter3+0x220>
 246:	e9 a5 fe ff ff       	jmpq   f0 <fast_filter3+0xf0>
 24b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 250:	85 c9                	test   %ecx,%ecx
 252:	0f 88 32 ff ff ff    	js     18a <fast_filter3+0x18a>
 258:	41 89 df             	mov    %ebx,%r15d
 25b:	48 63 ee             	movslq %esi,%rbp
 25e:	41 89 f0             	mov    %esi,%r8d
 261:	48 8d 04 ea          	lea    (%rdx,%rbp,8),%rax
 265:	41 29 f7             	sub    %esi,%r15d
 268:	41 f7 d0             	not    %r8d
 26b:	4c 01 fd             	add    %r15,%rbp
 26e:	45 01 c8             	add    %r9d,%r8d
 271:	48 8d 34 ea          	lea    (%rdx,%rbp,8),%rsi
 275:	eb 1c                	jmp    293 <fast_filter3+0x293>
 277:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 27e:	00 00 
 280:	44 89 c1             	mov    %r8d,%ecx
 283:	48 83 c0 08          	add    $0x8,%rax
 287:	45 8d 40 ff          	lea    -0x1(%r8),%r8d
 28b:	85 c9                	test   %ecx,%ecx
 28d:	0f 88 f7 fe ff ff    	js     18a <fast_filter3+0x18a>
 293:	c5 fb 10 08          	vmovsd (%rax),%xmm1
 297:	48 63 c9             	movslq %ecx,%rcx
 29a:	48 39 f0             	cmp    %rsi,%rax
 29d:	c5 f3 59 0c cf       	vmulsd (%rdi,%rcx,8),%xmm1,%xmm1
 2a2:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 2a6:	75 d8                	jne    280 <fast_filter3+0x280>
 2a8:	e9 dd fe ff ff       	jmpq   18a <fast_filter3+0x18a>
 2ad:	49 63 c5             	movslq %r13d,%rax
 2b0:	45 31 c9             	xor    %r9d,%r9d
 2b3:	49 c7 44 c3 f8 00 00 	movq   $0x0,-0x8(%r11,%rax,8)
 2ba:	00 00 
 2bc:	e9 5e fe ff ff       	jmpq   11f <fast_filter3+0x11f>
 2c1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 2c8:	0f 1f 84 00 00 00 00 
 2cf:	00 

00000000000002d0 <fast_filter2>:
 2d0:	41 56                	push   %r14
 2d2:	41 55                	push   %r13
 2d4:	41 54                	push   %r12
 2d6:	55                   	push   %rbp
 2d7:	53                   	push   %rbx
 2d8:	44 8b 56 08          	mov    0x8(%rsi),%r10d
 2dc:	48 8b 2f             	mov    (%rdi),%rbp
 2df:	4c 8b 0e             	mov    (%rsi),%r9
 2e2:	45 8d 62 ff          	lea    -0x1(%r10),%r12d
 2e6:	45 85 e4             	test   %r12d,%r12d
 2e9:	0f 8e 6e 01 00 00    	jle    45d <fast_filter2+0x18d>
 2ef:	45 8d 6a fe          	lea    -0x2(%r10),%r13d
 2f3:	31 c0                	xor    %eax,%eax
 2f5:	41 d1 ed             	shr    %r13d
 2f8:	44 89 e9             	mov    %r13d,%ecx
 2fb:	48 83 c1 01          	add    $0x1,%rcx
 2ff:	48 c1 e1 04          	shl    $0x4,%rcx
 303:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 308:	48 c7 44 05 00 00 00 	movq   $0x0,0x0(%rbp,%rax,1)
 30f:	00 00 
 311:	48 c7 44 05 08 00 00 	movq   $0x0,0x8(%rbp,%rax,1)
 318:	00 00 
 31a:	48 83 c0 10          	add    $0x10,%rax
 31e:	48 39 c8             	cmp    %rcx,%rax
 321:	75 e5                	jne    308 <fast_filter2+0x38>
 323:	49 63 c2             	movslq %r10d,%rax
 326:	4c 89 cb             	mov    %r9,%rbx
 329:	41 bb 01 00 00 00    	mov    $0x1,%r11d
 32f:	48 c7 44 c5 f8 00 00 	movq   $0x0,-0x8(%rbp,%rax,8)
 336:	00 00 
 338:	48 8d 4d 08          	lea    0x8(%rbp),%rcx
 33c:	45 31 c0             	xor    %r8d,%r8d
 33f:	90                   	nop
 340:	48 89 de             	mov    %rbx,%rsi
 343:	31 c0                	xor    %eax,%eax
 345:	eb 3d                	jmp    384 <fast_filter2+0xb4>
 347:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 34e:	00 00 
 350:	c5 fb 10 04 c2       	vmovsd (%rdx,%rax,8),%xmm0
 355:	48 83 ee 08          	sub    $0x8,%rsi
 359:	c5 fb 59 46 08       	vmulsd 0x8(%rsi),%xmm0,%xmm0
 35e:	c5 fb 58 41 f8       	vaddsd -0x8(%rcx),%xmm0,%xmm0
 363:	c5 fb 11 41 f8       	vmovsd %xmm0,-0x8(%rcx)
 368:	c5 fb 10 04 c2       	vmovsd (%rdx,%rax,8),%xmm0
 36d:	48 83 c0 01          	add    $0x1,%rax
 371:	c5 fb 59 46 10       	vmulsd 0x10(%rsi),%xmm0,%xmm0
 376:	48 83 f8 1e          	cmp    $0x1e,%rax
 37a:	c5 fb 58 01          	vaddsd (%rcx),%xmm0,%xmm0
 37e:	c5 fb 11 01          	vmovsd %xmm0,(%rcx)
 382:	74 52                	je     3d6 <fast_filter2+0x106>
 384:	41 39 c0             	cmp    %eax,%r8d
 387:	4c 63 f0             	movslq %eax,%r14
 38a:	79 c4                	jns    350 <fast_filter2+0x80>
 38c:	44 89 d8             	mov    %r11d,%eax
 38f:	44 29 f0             	sub    %r14d,%eax
 392:	78 42                	js     3d6 <fast_filter2+0x106>
 394:	4a 8d 34 f2          	lea    (%rdx,%r14,8),%rsi
 398:	44 89 f7             	mov    %r14d,%edi
 39b:	c5 fb 10 01          	vmovsd (%rcx),%xmm0
 39f:	45 8d 70 e3          	lea    -0x1d(%r8),%r14d
 3a3:	f7 d7                	not    %edi
 3a5:	44 01 df             	add    %r11d,%edi
 3a8:	eb 13                	jmp    3bd <fast_filter2+0xed>
 3aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 3b0:	89 f8                	mov    %edi,%eax
 3b2:	48 83 c6 08          	add    $0x8,%rsi
 3b6:	8d 7f ff             	lea    -0x1(%rdi),%edi
 3b9:	85 c0                	test   %eax,%eax
 3bb:	78 19                	js     3d6 <fast_filter2+0x106>
 3bd:	c5 fb 10 0e          	vmovsd (%rsi),%xmm1
 3c1:	48 98                	cltq   
 3c3:	41 39 fe             	cmp    %edi,%r14d
 3c6:	c4 c1 73 59 0c c1    	vmulsd (%r9,%rax,8),%xmm1,%xmm1
 3cc:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 3d0:	c5 fb 11 01          	vmovsd %xmm0,(%rcx)
 3d4:	75 da                	jne    3b0 <fast_filter2+0xe0>
 3d6:	41 83 c0 02          	add    $0x2,%r8d
 3da:	48 83 c1 10          	add    $0x10,%rcx
 3de:	41 83 c3 02          	add    $0x2,%r11d
 3e2:	48 83 c3 10          	add    $0x10,%rbx
 3e6:	45 39 c4             	cmp    %r8d,%r12d
 3e9:	0f 8f 51 ff ff ff    	jg     340 <fast_filter2+0x70>
 3ef:	43 8d 7c 2d 02       	lea    0x2(%r13,%r13,1),%edi
 3f4:	41 39 fa             	cmp    %edi,%r10d
 3f7:	7e 5b                	jle    454 <fast_filter2+0x184>
 3f9:	48 63 c7             	movslq %edi,%rax
 3fc:	48 c1 e0 03          	shl    $0x3,%rax
 400:	48 8d 74 05 00       	lea    0x0(%rbp,%rax,1),%rsi
 405:	49 01 c1             	add    %rax,%r9
 408:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 40f:	00 
 410:	4c 89 c9             	mov    %r9,%rcx
 413:	31 c0                	xor    %eax,%eax
 415:	eb 29                	jmp    440 <fast_filter2+0x170>
 417:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 41e:	00 00 
 420:	c5 fb 10 04 c2       	vmovsd (%rdx,%rax,8),%xmm0
 425:	48 83 c0 01          	add    $0x1,%rax
 429:	48 83 e9 08          	sub    $0x8,%rcx
 42d:	c5 fb 59 41 08       	vmulsd 0x8(%rcx),%xmm0,%xmm0
 432:	48 83 f8 1e          	cmp    $0x1e,%rax
 436:	c5 fb 58 06          	vaddsd (%rsi),%xmm0,%xmm0
 43a:	c5 fb 11 06          	vmovsd %xmm0,(%rsi)
 43e:	74 04                	je     444 <fast_filter2+0x174>
 440:	39 c7                	cmp    %eax,%edi
 442:	79 dc                	jns    420 <fast_filter2+0x150>
 444:	83 c7 01             	add    $0x1,%edi
 447:	48 83 c6 08          	add    $0x8,%rsi
 44b:	49 83 c1 08          	add    $0x8,%r9
 44f:	44 39 d7             	cmp    %r10d,%edi
 452:	75 bc                	jne    410 <fast_filter2+0x140>
 454:	5b                   	pop    %rbx
 455:	5d                   	pop    %rbp
 456:	41 5c                	pop    %r12
 458:	41 5d                	pop    %r13
 45a:	41 5e                	pop    %r14
 45c:	c3                   	retq   
 45d:	49 63 c2             	movslq %r10d,%rax
 460:	31 ff                	xor    %edi,%edi
 462:	48 c7 44 c5 f8 00 00 	movq   $0x0,-0x8(%rbp,%rax,8)
 469:	00 00 
 46b:	eb 87                	jmp    3f4 <fast_filter2+0x124>
 46d:	0f 1f 00             	nopl   (%rax)

0000000000000470 <fast_filter1>:
 470:	41 56                	push   %r14
 472:	41 54                	push   %r12
 474:	55                   	push   %rbp
 475:	53                   	push   %rbx
 476:	8b 5e 08             	mov    0x8(%rsi),%ebx
 479:	4c 8b 17             	mov    (%rdi),%r10
 47c:	4c 8b 0e             	mov    (%rsi),%r9
 47f:	83 fb 01             	cmp    $0x1,%ebx
 482:	7e 2e                	jle    4b2 <fast_filter1+0x42>
 484:	8d 43 fe             	lea    -0x2(%rbx),%eax
 487:	d1 e8                	shr    %eax
 489:	48 8d 48 01          	lea    0x1(%rax),%rcx
 48d:	31 c0                	xor    %eax,%eax
 48f:	48 c1 e1 04          	shl    $0x4,%rcx
 493:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 498:	49 c7 04 02 00 00 00 	movq   $0x0,(%r10,%rax,1)
 49f:	00 
 4a0:	49 c7 44 02 08 00 00 	movq   $0x0,0x8(%r10,%rax,1)
 4a7:	00 00 
 4a9:	48 83 c0 10          	add    $0x10,%rax
 4ad:	48 39 c8             	cmp    %rcx,%rax
 4b0:	75 e6                	jne    498 <fast_filter1+0x28>
 4b2:	48 63 c3             	movslq %ebx,%rax
 4b5:	45 31 c0             	xor    %r8d,%r8d
 4b8:	85 db                	test   %ebx,%ebx
 4ba:	49 c7 44 c2 f8 00 00 	movq   $0x0,-0x8(%r10,%rax,8)
 4c1:	00 00 
 4c3:	4d 8d 59 f8          	lea    -0x8(%r9),%r11
 4c7:	bd 1d 00 00 00       	mov    $0x1d,%ebp
 4cc:	7e 63                	jle    531 <fast_filter1+0xc1>
 4ce:	66 90                	xchg   %ax,%ax
 4d0:	c4 81 7b 10 04 c2    	vmovsd (%r10,%r8,8),%xmm0
 4d6:	44 89 c7             	mov    %r8d,%edi
 4d9:	4c 89 d9             	mov    %r11,%rcx
 4dc:	48 89 d0             	mov    %rdx,%rax
 4df:	31 f6                	xor    %esi,%esi
 4e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 4e8:	45 89 c4             	mov    %r8d,%r12d
 4eb:	41 29 f4             	sub    %esi,%r12d
 4ee:	45 85 e4             	test   %r12d,%r12d
 4f1:	7e 4d                	jle    540 <fast_filter1+0xd0>
 4f3:	c5 fb 10 08          	vmovsd (%rax),%xmm1
 4f7:	83 c6 02             	add    $0x2,%esi
 4fa:	48 83 c0 10          	add    $0x10,%rax
 4fe:	48 83 e9 10          	sub    $0x10,%rcx
 502:	c5 f3 59 49 18       	vmulsd 0x18(%rcx),%xmm1,%xmm1
 507:	c5 f3 58 c0          	vaddsd %xmm0,%xmm1,%xmm0
 50b:	c5 fb 10 48 f8       	vmovsd -0x8(%rax),%xmm1
 510:	c5 f3 59 49 10       	vmulsd 0x10(%rcx),%xmm1,%xmm1
 515:	83 fe 1e             	cmp    $0x1e,%esi
 518:	c5 f3 58 c0          	vaddsd %xmm0,%xmm1,%xmm0
 51c:	75 ca                	jne    4e8 <fast_filter1+0x78>
 51e:	c4 81 7b 11 04 c2    	vmovsd %xmm0,(%r10,%r8,8)
 524:	49 83 c0 01          	add    $0x1,%r8
 528:	49 83 c3 08          	add    $0x8,%r11
 52c:	44 39 c3             	cmp    %r8d,%ebx
 52f:	7f 9f                	jg     4d0 <fast_filter1+0x60>
 531:	5b                   	pop    %rbx
 532:	5d                   	pop    %rbp
 533:	41 5c                	pop    %r12
 535:	41 5e                	pop    %r14
 537:	c3                   	retq   
 538:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 53f:	00 
 540:	89 f9                	mov    %edi,%ecx
 542:	29 f1                	sub    %esi,%ecx
 544:	78 d8                	js     51e <fast_filter1+0xae>
 546:	89 f0                	mov    %esi,%eax
 548:	41 89 ee             	mov    %ebp,%r14d
 54b:	4c 63 e6             	movslq %esi,%r12
 54e:	f7 d0                	not    %eax
 550:	41 29 f6             	sub    %esi,%r14d
 553:	01 c7                	add    %eax,%edi
 555:	4a 8d 04 e2          	lea    (%rdx,%r12,8),%rax
 559:	4d 01 f4             	add    %r14,%r12
 55c:	4a 8d 34 e2          	lea    (%rdx,%r12,8),%rsi
 560:	eb 13                	jmp    575 <fast_filter1+0x105>
 562:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 568:	89 f9                	mov    %edi,%ecx
 56a:	48 83 c0 08          	add    $0x8,%rax
 56e:	8d 7f ff             	lea    -0x1(%rdi),%edi
 571:	85 c9                	test   %ecx,%ecx
 573:	78 a9                	js     51e <fast_filter1+0xae>
 575:	c5 fb 10 08          	vmovsd (%rax),%xmm1
 579:	48 63 c9             	movslq %ecx,%rcx
 57c:	48 39 f0             	cmp    %rsi,%rax
 57f:	c4 c1 73 59 0c c9    	vmulsd (%r9,%rcx,8),%xmm1,%xmm1
 585:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 589:	75 dd                	jne    568 <fast_filter1+0xf8>
 58b:	eb 91                	jmp    51e <fast_filter1+0xae>
 58d:	0f 1f 00             	nopl   (%rax)

0000000000000590 <slow_filter>:
 590:	41 55                	push   %r13
 592:	41 54                	push   %r12
 594:	55                   	push   %rbp
 595:	53                   	push   %rbx
 596:	48 83 ec 08          	sub    $0x8,%rsp
 59a:	44 8b 66 08          	mov    0x8(%rsi),%r12d
 59e:	48 8b 1f             	mov    (%rdi),%rbx
 5a1:	4c 8b 2e             	mov    (%rsi),%r13
 5a4:	45 85 e4             	test   %r12d,%r12d
 5a7:	7e 5b                	jle    604 <slow_filter+0x74>
 5a9:	48 89 d5             	mov    %rdx,%rbp
 5ac:	49 63 d4             	movslq %r12d,%rdx
 5af:	31 f6                	xor    %esi,%esi
 5b1:	48 c1 e2 03          	shl    $0x3,%rdx
 5b5:	48 89 df             	mov    %rbx,%rdi
 5b8:	e8 00 00 00 00       	callq  5bd <slow_filter+0x2d>
 5bd:	4c 89 ea             	mov    %r13,%rdx
 5c0:	31 c9                	xor    %ecx,%ecx
 5c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 5c8:	48 89 d6             	mov    %rdx,%rsi
 5cb:	31 c0                	xor    %eax,%eax
 5cd:	eb 24                	jmp    5f3 <slow_filter+0x63>
 5cf:	90                   	nop
 5d0:	c5 fb 10 44 c5 00    	vmovsd 0x0(%rbp,%rax,8),%xmm0
 5d6:	48 83 c0 01          	add    $0x1,%rax
 5da:	48 83 ee 08          	sub    $0x8,%rsi
 5de:	c5 fb 59 46 08       	vmulsd 0x8(%rsi),%xmm0,%xmm0
 5e3:	48 83 f8 1e          	cmp    $0x1e,%rax
 5e7:	c5 fb 58 04 cb       	vaddsd (%rbx,%rcx,8),%xmm0,%xmm0
 5ec:	c5 fb 11 04 cb       	vmovsd %xmm0,(%rbx,%rcx,8)
 5f1:	74 04                	je     5f7 <slow_filter+0x67>
 5f3:	39 c1                	cmp    %eax,%ecx
 5f5:	79 d9                	jns    5d0 <slow_filter+0x40>
 5f7:	48 83 c1 01          	add    $0x1,%rcx
 5fb:	48 83 c2 08          	add    $0x8,%rdx
 5ff:	41 39 cc             	cmp    %ecx,%r12d
 602:	7f c4                	jg     5c8 <slow_filter+0x38>
 604:	48 83 c4 08          	add    $0x8,%rsp
 608:	5b                   	pop    %rbx
 609:	5d                   	pop    %rbp
 60a:	41 5c                	pop    %r12
 60c:	41 5d                	pop    %r13
 60e:	c3                   	retq   
 60f:	90                   	nop

0000000000000610 <compute_flops>:
 610:	85 ff                	test   %edi,%edi
 612:	7e 2f                	jle    643 <compute_flops+0x33>
 614:	31 c9                	xor    %ecx,%ecx
 616:	31 c0                	xor    %eax,%eax
 618:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 61f:	00 
 620:	31 d2                	xor    %edx,%edx
 622:	eb 12                	jmp    636 <compute_flops+0x26>
 624:	0f 1f 40 00          	nopl   0x0(%rax)
 628:	48 83 c2 01          	add    $0x1,%rdx
 62c:	48 83 c0 02          	add    $0x2,%rax
 630:	48 83 fa 1e          	cmp    $0x1e,%rdx
 634:	74 04                	je     63a <compute_flops+0x2a>
 636:	39 d1                	cmp    %edx,%ecx
 638:	79 ee                	jns    628 <compute_flops+0x18>
 63a:	83 c1 01             	add    $0x1,%ecx
 63d:	39 f9                	cmp    %edi,%ecx
 63f:	75 df                	jne    620 <compute_flops+0x10>
 641:	f3 c3                	repz retq 
 643:	31 c0                	xor    %eax,%eax
 645:	c3                   	retq   
 646:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 64d:	00 00 00 

0000000000000650 <register_functions>:
 650:	48 83 ec 08          	sub    $0x8,%rsp
 654:	be 00 00 00 00       	mov    $0x0,%esi
 659:	bf 00 00 00 00       	mov    $0x0,%edi
 65e:	e8 00 00 00 00       	callq  663 <register_functions+0x13>
 663:	be 00 00 00 00       	mov    $0x0,%esi
 668:	bf 00 00 00 00       	mov    $0x0,%edi
 66d:	e8 00 00 00 00       	callq  672 <register_functions+0x22>
 672:	be 00 00 00 00       	mov    $0x0,%esi
 677:	bf 00 00 00 00       	mov    $0x0,%edi
 67c:	e8 00 00 00 00       	callq  681 <register_functions+0x31>
 681:	be 00 00 00 00       	mov    $0x0,%esi
 686:	bf 00 00 00 00       	mov    $0x0,%edi
 68b:	48 83 c4 08          	add    $0x8,%rsp
 68f:	e9 00 00 00 00       	jmpq   694 <register_functions+0x44>
