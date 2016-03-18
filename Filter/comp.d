
comp.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <fast_filter4>:
   0:	41 57                	push   %r15
   2:	41 56                	push   %r14
   4:	41 55                	push   %r13
   6:	41 54                	push   %r12
   8:	55                   	push   %rbp
   9:	53                   	push   %rbx
   a:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   e:	4c 8b 17             	mov    (%rdi),%r10
  11:	48 8b 2e             	mov    (%rsi),%rbp
  14:	45 8d 7e ff          	lea    -0x1(%r14),%r15d
  18:	45 85 ff             	test   %r15d,%r15d
  1b:	0f 8e 69 02 00 00    	jle    28a <fast_filter4+0x28a>
  21:	41 8d 46 fe          	lea    -0x2(%r14),%eax
  25:	89 44 24 fc          	mov    %eax,-0x4(%rsp)
  29:	31 c0                	xor    %eax,%eax
  2b:	d1 6c 24 fc          	shrl   -0x4(%rsp)
  2f:	8b 4c 24 fc          	mov    -0x4(%rsp),%ecx
  33:	48 83 c1 01          	add    $0x1,%rcx
  37:	48 c1 e1 04          	shl    $0x4,%rcx
  3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40:	49 c7 04 02 00 00 00 	movq   $0x0,(%r10,%rax,1)
  47:	00 
  48:	49 c7 44 02 08 00 00 	movq   $0x0,0x8(%r10,%rax,1)
  4f:	00 00 
  51:	48 83 c0 10          	add    $0x10,%rax
  55:	48 39 c8             	cmp    %rcx,%rax
  58:	75 e6                	jne    40 <fast_filter4+0x40>
  5a:	49 63 c6             	movslq %r14d,%rax
  5d:	45 31 c9             	xor    %r9d,%r9d
  60:	41 bb 01 00 00 00    	mov    $0x1,%r11d
  66:	49 c7 44 c2 f8 00 00 	movq   $0x0,-0x8(%r10,%rax,8)
  6d:	00 00 
  6f:	4c 8d 65 f8          	lea    -0x8(%rbp),%r12
  73:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  78:	4d 89 d8             	mov    %r11,%r8
  7b:	c4 81 7b 10 0c ca    	vmovsd (%r10,%r9,8),%xmm1
  81:	44 89 cb             	mov    %r9d,%ebx
  84:	c4 81 7b 10 04 da    	vmovsd (%r10,%r11,8),%xmm0
  8a:	48 89 d6             	mov    %rdx,%rsi
  8d:	4c 89 e1             	mov    %r12,%rcx
  90:	31 c0                	xor    %eax,%eax
  92:	4d 29 c8             	sub    %r9,%r8
  95:	0f 1f 00             	nopl   (%rax)
  98:	44 89 cf             	mov    %r9d,%edi
  9b:	29 c7                	sub    %eax,%edi
  9d:	83 ff 02             	cmp    $0x2,%edi
  a0:	7e 7d                	jle    11f <fast_filter4+0x11f>
  a2:	c5 fb 10 71 08       	vmovsd 0x8(%rcx),%xmm6
  a7:	83 c0 04             	add    $0x4,%eax
  aa:	48 83 c6 20          	add    $0x20,%rsi
  ae:	c5 7b 10 46 e0       	vmovsd -0x20(%rsi),%xmm8
  b3:	c5 fb 10 21          	vmovsd (%rcx),%xmm4
  b7:	c5 3b 59 ce          	vmulsd %xmm6,%xmm8,%xmm9
  bb:	c5 fb 10 7e e8       	vmovsd -0x18(%rsi),%xmm7
  c0:	c4 21 3b 59 44 c1 08 	vmulsd 0x8(%rcx,%r8,8),%xmm8,%xmm8
  c7:	48 83 e9 20          	sub    $0x20,%rcx
  cb:	c5 fb 10 51 18       	vmovsd 0x18(%rcx),%xmm2
  d0:	c5 c3 59 f6          	vmulsd %xmm6,%xmm7,%xmm6
  d4:	c5 fb 10 6e f0       	vmovsd -0x10(%rsi),%xmm5
  d9:	c5 fb 10 5e f8       	vmovsd -0x8(%rsi),%xmm3
  de:	c5 b3 58 c9          	vaddsd %xmm1,%xmm9,%xmm1
  e2:	c5 43 59 cc          	vmulsd %xmm4,%xmm7,%xmm9
  e6:	c5 bb 58 c0          	vaddsd %xmm0,%xmm8,%xmm0
  ea:	c5 d3 59 e4          	vmulsd %xmm4,%xmm5,%xmm4
  ee:	c5 fb 58 c6          	vaddsd %xmm6,%xmm0,%xmm0
  f2:	c4 c1 73 58 c9       	vaddsd %xmm9,%xmm1,%xmm1
  f7:	c5 53 59 ca          	vmulsd %xmm2,%xmm5,%xmm9
  fb:	c5 e3 59 d2          	vmulsd %xmm2,%xmm3,%xmm2
  ff:	c5 fb 58 c4          	vaddsd %xmm4,%xmm0,%xmm0
 103:	c4 c1 73 58 c9       	vaddsd %xmm9,%xmm1,%xmm1
 108:	c5 63 59 49 10       	vmulsd 0x10(%rcx),%xmm3,%xmm9
 10d:	83 f8 1c             	cmp    $0x1c,%eax
 110:	c5 fb 58 c2          	vaddsd %xmm2,%xmm0,%xmm0
 114:	c4 c1 73 58 c9       	vaddsd %xmm9,%xmm1,%xmm1
 119:	0f 85 79 ff ff ff    	jne    98 <fast_filter4+0x98>
 11f:	29 c3                	sub    %eax,%ebx
 121:	4c 89 cf             	mov    %r9,%rdi
 124:	89 d9                	mov    %ebx,%ecx
 126:	48 63 d8             	movslq %eax,%rbx
 129:	48 8d 34 da          	lea    (%rdx,%rbx,8),%rsi
 12d:	48 29 df             	sub    %rbx,%rdi
 130:	4c 8d 6c fd 00       	lea    0x0(%rbp,%rdi,8),%r13
 135:	49 89 f0             	mov    %rsi,%r8
 138:	89 c7                	mov    %eax,%edi
 13a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 140:	85 c9                	test   %ecx,%ecx
 142:	78 22                	js     166 <fast_filter4+0x166>
 144:	c4 c1 7b 10 10       	vmovsd (%r8),%xmm2
 149:	83 c7 01             	add    $0x1,%edi
 14c:	83 e9 01             	sub    $0x1,%ecx
 14f:	49 83 c0 08          	add    $0x8,%r8
 153:	49 83 ed 08          	sub    $0x8,%r13
 157:	c4 c1 6b 59 55 08    	vmulsd 0x8(%r13),%xmm2,%xmm2
 15d:	83 ff 1d             	cmp    $0x1d,%edi
 160:	c5 f3 58 ca          	vaddsd %xmm2,%xmm1,%xmm1
 164:	7e da                	jle    140 <fast_filter4+0x140>
 166:	4c 89 df             	mov    %r11,%rdi
 169:	44 89 d9             	mov    %r11d,%ecx
 16c:	48 29 df             	sub    %rbx,%rdi
 16f:	29 c1                	sub    %eax,%ecx
 171:	48 8d 7c fd 00       	lea    0x0(%rbp,%rdi,8),%rdi
 176:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 17d:	00 00 00 
 180:	85 c9                	test   %ecx,%ecx
 182:	78 20                	js     1a4 <fast_filter4+0x1a4>
 184:	c5 fb 10 16          	vmovsd (%rsi),%xmm2
 188:	83 c0 01             	add    $0x1,%eax
 18b:	83 e9 01             	sub    $0x1,%ecx
 18e:	48 83 c6 08          	add    $0x8,%rsi
 192:	48 83 ef 08          	sub    $0x8,%rdi
 196:	c5 eb 59 57 08       	vmulsd 0x8(%rdi),%xmm2,%xmm2
 19b:	83 f8 1d             	cmp    $0x1d,%eax
 19e:	c5 fb 58 c2          	vaddsd %xmm2,%xmm0,%xmm0
 1a2:	7e dc                	jle    180 <fast_filter4+0x180>
 1a4:	c4 81 7b 11 0c ca    	vmovsd %xmm1,(%r10,%r9,8)
 1aa:	49 83 c1 02          	add    $0x2,%r9
 1ae:	49 83 c4 10          	add    $0x10,%r12
 1b2:	c4 81 7b 11 04 da    	vmovsd %xmm0,(%r10,%r11,8)
 1b8:	49 83 c3 02          	add    $0x2,%r11
 1bc:	45 39 cf             	cmp    %r9d,%r15d
 1bf:	0f 8f b3 fe ff ff    	jg     78 <fast_filter4+0x78>
 1c5:	8b 44 24 fc          	mov    -0x4(%rsp),%eax
 1c9:	44 8d 44 00 02       	lea    0x2(%rax,%rax,1),%r8d
 1ce:	4d 63 c8             	movslq %r8d,%r9
 1d1:	45 39 c6             	cmp    %r8d,%r14d
 1d4:	4e 8d 5c cd f8       	lea    -0x8(%rbp,%r9,8),%r11
 1d9:	0f 8e a0 00 00 00    	jle    27f <fast_filter4+0x27f>
 1df:	90                   	nop
 1e0:	c4 81 7b 10 04 ca    	vmovsd (%r10,%r9,8),%xmm0
 1e6:	48 89 d6             	mov    %rdx,%rsi
 1e9:	4c 89 d9             	mov    %r11,%rcx
 1ec:	31 c0                	xor    %eax,%eax
 1ee:	66 90                	xchg   %ax,%ax
 1f0:	44 89 c7             	mov    %r8d,%edi
 1f3:	29 c7                	sub    %eax,%edi
 1f5:	83 ff 02             	cmp    $0x2,%edi
 1f8:	7e 2b                	jle    225 <fast_filter4+0x225>
 1fa:	c5 fb 10 0e          	vmovsd (%rsi),%xmm1
 1fe:	83 c0 02             	add    $0x2,%eax
 201:	48 83 c6 10          	add    $0x10,%rsi
 205:	48 83 e9 10          	sub    $0x10,%rcx
 209:	c5 f3 59 49 18       	vmulsd 0x18(%rcx),%xmm1,%xmm1
 20e:	c5 f3 58 c0          	vaddsd %xmm0,%xmm1,%xmm0
 212:	c5 fb 10 4e f8       	vmovsd -0x8(%rsi),%xmm1
 217:	c5 f3 59 49 10       	vmulsd 0x10(%rcx),%xmm1,%xmm1
 21c:	83 f8 1c             	cmp    $0x1c,%eax
 21f:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 223:	75 cb                	jne    1f0 <fast_filter4+0x1f0>
 225:	48 63 f0             	movslq %eax,%rsi
 228:	4c 89 cb             	mov    %r9,%rbx
 22b:	44 89 c1             	mov    %r8d,%ecx
 22e:	48 8d 3c f2          	lea    (%rdx,%rsi,8),%rdi
 232:	48 29 f3             	sub    %rsi,%rbx
 235:	29 c1                	sub    %eax,%ecx
 237:	48 8d 74 dd 00       	lea    0x0(%rbp,%rbx,8),%rsi
 23c:	0f 1f 40 00          	nopl   0x0(%rax)
 240:	85 c9                	test   %ecx,%ecx
 242:	78 20                	js     264 <fast_filter4+0x264>
 244:	c5 fb 10 0f          	vmovsd (%rdi),%xmm1
 248:	83 c0 01             	add    $0x1,%eax
 24b:	83 e9 01             	sub    $0x1,%ecx
 24e:	48 83 c7 08          	add    $0x8,%rdi
 252:	48 83 ee 08          	sub    $0x8,%rsi
 256:	c5 f3 59 4e 08       	vmulsd 0x8(%rsi),%xmm1,%xmm1
 25b:	83 f8 1d             	cmp    $0x1d,%eax
 25e:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 262:	7e dc                	jle    240 <fast_filter4+0x240>
 264:	41 83 c0 01          	add    $0x1,%r8d
 268:	c4 81 7b 11 04 ca    	vmovsd %xmm0,(%r10,%r9,8)
 26e:	49 83 c3 08          	add    $0x8,%r11
 272:	49 83 c1 01          	add    $0x1,%r9
 276:	45 39 f0             	cmp    %r14d,%r8d
 279:	0f 85 61 ff ff ff    	jne    1e0 <fast_filter4+0x1e0>
 27f:	5b                   	pop    %rbx
 280:	5d                   	pop    %rbp
 281:	41 5c                	pop    %r12
 283:	41 5d                	pop    %r13
 285:	41 5e                	pop    %r14
 287:	41 5f                	pop    %r15
 289:	c3                   	retq   
 28a:	49 63 c6             	movslq %r14d,%rax
 28d:	45 31 c0             	xor    %r8d,%r8d
 290:	49 c7 44 c2 f8 00 00 	movq   $0x0,-0x8(%r10,%rax,8)
 297:	00 00 
 299:	e9 30 ff ff ff       	jmpq   1ce <fast_filter4+0x1ce>
 29e:	66 90                	xchg   %ax,%ax

00000000000002a0 <fast_filter3>:
 2a0:	41 57                	push   %r15
 2a2:	41 56                	push   %r14
 2a4:	41 55                	push   %r13
 2a6:	41 54                	push   %r12
 2a8:	55                   	push   %rbp
 2a9:	53                   	push   %rbx
 2aa:	44 8b 6e 08          	mov    0x8(%rsi),%r13d
 2ae:	4c 8b 1f             	mov    (%rdi),%r11
 2b1:	48 8b 3e             	mov    (%rsi),%rdi
 2b4:	41 8d 45 ff          	lea    -0x1(%r13),%eax
 2b8:	85 c0                	test   %eax,%eax
 2ba:	0f 8e 8d 02 00 00    	jle    54d <fast_filter3+0x2ad>
 2c0:	89 c6                	mov    %eax,%esi
 2c2:	41 8d 45 fe          	lea    -0x2(%r13),%eax
 2c6:	89 44 24 f8          	mov    %eax,-0x8(%rsp)
 2ca:	31 c0                	xor    %eax,%eax
 2cc:	d1 6c 24 f8          	shrl   -0x8(%rsp)
 2d0:	8b 4c 24 f8          	mov    -0x8(%rsp),%ecx
 2d4:	48 83 c1 01          	add    $0x1,%rcx
 2d8:	48 c1 e1 04          	shl    $0x4,%rcx
 2dc:	0f 1f 40 00          	nopl   0x0(%rax)
 2e0:	49 c7 04 03 00 00 00 	movq   $0x0,(%r11,%rax,1)
 2e7:	00 
 2e8:	49 c7 44 03 08 00 00 	movq   $0x0,0x8(%r11,%rax,1)
 2ef:	00 00 
 2f1:	48 83 c0 10          	add    $0x10,%rax
 2f5:	48 39 c8             	cmp    %rcx,%rax
 2f8:	75 e6                	jne    2e0 <fast_filter3+0x40>
 2fa:	49 63 c5             	movslq %r13d,%rax
 2fd:	44 89 6c 24 fc       	mov    %r13d,-0x4(%rsp)
 302:	bb 01 00 00 00       	mov    $0x1,%ebx
 307:	49 c7 44 c3 f8 00 00 	movq   $0x0,-0x8(%r11,%rax,8)
 30e:	00 00 
 310:	45 31 d2             	xor    %r10d,%r10d
 313:	45 31 c9             	xor    %r9d,%r9d
 316:	4c 8d 77 f8          	lea    -0x8(%rdi),%r14
 31a:	41 bf 1d 00 00 00    	mov    $0x1d,%r15d
 320:	41 89 f5             	mov    %esi,%r13d
 323:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 328:	c4 81 7b 10 04 13    	vmovsd (%r11,%r10,1),%xmm0
 32e:	4b 8d 0c 16          	lea    (%r14,%r10,1),%rcx
 332:	49 89 d0             	mov    %rdx,%r8
 335:	c4 81 7b 10 4c 13 08 	vmovsd 0x8(%r11,%r10,1),%xmm1
 33c:	31 c0                	xor    %eax,%eax
 33e:	66 90                	xchg   %ax,%ax
 340:	44 89 ce             	mov    %r9d,%esi
 343:	29 c6                	sub    %eax,%esi
 345:	85 f6                	test   %esi,%esi
 347:	0f 8e 03 01 00 00    	jle    450 <fast_filter3+0x1b0>
 34d:	c5 fb 10 51 08       	vmovsd 0x8(%rcx),%xmm2
 352:	83 c0 02             	add    $0x2,%eax
 355:	49 83 c0 10          	add    $0x10,%r8
 359:	c4 c1 7b 10 60 f0    	vmovsd -0x10(%r8),%xmm4
 35f:	48 83 e9 10          	sub    $0x10,%rcx
 363:	c4 c1 7b 10 58 f8    	vmovsd -0x8(%r8),%xmm3
 369:	c5 db 59 ea          	vmulsd %xmm2,%xmm4,%xmm5
 36d:	c5 db 59 61 20       	vmulsd 0x20(%rcx),%xmm4,%xmm4
 372:	c5 e3 59 d2          	vmulsd %xmm2,%xmm3,%xmm2
 376:	c5 d3 58 c0          	vaddsd %xmm0,%xmm5,%xmm0
 37a:	c5 e3 59 69 10       	vmulsd 0x10(%rcx),%xmm3,%xmm5
 37f:	83 f8 1e             	cmp    $0x1e,%eax
 382:	c5 db 58 c9          	vaddsd %xmm1,%xmm4,%xmm1
 386:	c5 f3 58 ca          	vaddsd %xmm2,%xmm1,%xmm1
 38a:	c5 fb 58 c5          	vaddsd %xmm5,%xmm0,%xmm0
 38e:	75 b0                	jne    340 <fast_filter3+0xa0>
 390:	41 83 c1 02          	add    $0x2,%r9d
 394:	c4 81 7b 11 04 13    	vmovsd %xmm0,(%r11,%r10,1)
 39a:	83 c3 02             	add    $0x2,%ebx
 39d:	c4 81 7b 11 4c 13 08 	vmovsd %xmm1,0x8(%r11,%r10,1)
 3a4:	49 83 c2 10          	add    $0x10,%r10
 3a8:	45 39 e9             	cmp    %r13d,%r9d
 3ab:	0f 8c 77 ff ff ff    	jl     328 <fast_filter3+0x88>
 3b1:	8b 44 24 f8          	mov    -0x8(%rsp),%eax
 3b5:	44 8b 6c 24 fc       	mov    -0x4(%rsp),%r13d
 3ba:	44 8d 4c 00 02       	lea    0x2(%rax,%rax,1),%r9d
 3bf:	45 39 cd             	cmp    %r9d,%r13d
 3c2:	7e 7c                	jle    440 <fast_filter3+0x1a0>
 3c4:	49 63 c1             	movslq %r9d,%rax
 3c7:	bb 1d 00 00 00       	mov    $0x1d,%ebx
 3cc:	48 c1 e0 03          	shl    $0x3,%rax
 3d0:	4c 8d 54 07 f8       	lea    -0x8(%rdi,%rax,1),%r10
 3d5:	49 01 c3             	add    %rax,%r11
 3d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 3df:	00 
 3e0:	c4 c1 7b 10 03       	vmovsd (%r11),%xmm0
 3e5:	4d 89 d0             	mov    %r10,%r8
 3e8:	48 89 d0             	mov    %rdx,%rax
 3eb:	31 f6                	xor    %esi,%esi
 3ed:	0f 1f 00             	nopl   (%rax)
 3f0:	44 89 c9             	mov    %r9d,%ecx
 3f3:	29 f1                	sub    %esi,%ecx
 3f5:	85 c9                	test   %ecx,%ecx
 3f7:	0f 8e f3 00 00 00    	jle    4f0 <fast_filter3+0x250>
 3fd:	c5 fb 10 08          	vmovsd (%rax),%xmm1
 401:	83 c6 02             	add    $0x2,%esi
 404:	48 83 c0 10          	add    $0x10,%rax
 408:	49 83 e8 10          	sub    $0x10,%r8
 40c:	c4 c1 73 59 48 18    	vmulsd 0x18(%r8),%xmm1,%xmm1
 412:	c5 f3 58 c0          	vaddsd %xmm0,%xmm1,%xmm0
 416:	c5 fb 10 48 f8       	vmovsd -0x8(%rax),%xmm1
 41b:	c4 c1 73 59 48 10    	vmulsd 0x10(%r8),%xmm1,%xmm1
 421:	83 fe 1e             	cmp    $0x1e,%esi
 424:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 428:	75 c6                	jne    3f0 <fast_filter3+0x150>
 42a:	41 83 c1 01          	add    $0x1,%r9d
 42e:	c4 c1 7b 11 03       	vmovsd %xmm0,(%r11)
 433:	49 83 c2 08          	add    $0x8,%r10
 437:	49 83 c3 08          	add    $0x8,%r11
 43b:	45 39 e9             	cmp    %r13d,%r9d
 43e:	75 a0                	jne    3e0 <fast_filter3+0x140>
 440:	5b                   	pop    %rbx
 441:	5d                   	pop    %rbp
 442:	41 5c                	pop    %r12
 444:	41 5d                	pop    %r13
 446:	41 5e                	pop    %r14
 448:	41 5f                	pop    %r15
 44a:	c3                   	retq   
 44b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 450:	85 f6                	test   %esi,%esi
 452:	78 48                	js     49c <fast_filter3+0x1fc>
 454:	45 89 fc             	mov    %r15d,%r12d
 457:	48 63 e8             	movslq %eax,%rbp
 45a:	41 89 c0             	mov    %eax,%r8d
 45d:	48 8d 0c ea          	lea    (%rdx,%rbp,8),%rcx
 461:	41 29 c4             	sub    %eax,%r12d
 464:	41 f7 d0             	not    %r8d
 467:	4c 01 e5             	add    %r12,%rbp
 46a:	45 01 c8             	add    %r9d,%r8d
 46d:	48 8d 2c ea          	lea    (%rdx,%rbp,8),%rbp
 471:	eb 14                	jmp    487 <fast_filter3+0x1e7>
 473:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 478:	44 89 c6             	mov    %r8d,%esi
 47b:	48 83 c1 08          	add    $0x8,%rcx
 47f:	45 8d 40 ff          	lea    -0x1(%r8),%r8d
 483:	85 f6                	test   %esi,%esi
 485:	78 15                	js     49c <fast_filter3+0x1fc>
 487:	c5 fb 10 11          	vmovsd (%rcx),%xmm2
 48b:	48 63 f6             	movslq %esi,%rsi
 48e:	48 39 e9             	cmp    %rbp,%rcx
 491:	c5 eb 59 14 f7       	vmulsd (%rdi,%rsi,8),%xmm2,%xmm2
 496:	c5 fb 58 c2          	vaddsd %xmm2,%xmm0,%xmm0
 49a:	75 dc                	jne    478 <fast_filter3+0x1d8>
 49c:	89 d9                	mov    %ebx,%ecx
 49e:	29 c1                	sub    %eax,%ecx
 4a0:	0f 88 ea fe ff ff    	js     390 <fast_filter3+0xf0>
 4a6:	45 8d 41 e3          	lea    -0x1d(%r9),%r8d
 4aa:	89 c6                	mov    %eax,%esi
 4ac:	48 98                	cltq   
 4ae:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
 4b2:	f7 d6                	not    %esi
 4b4:	01 de                	add    %ebx,%esi
 4b6:	eb 19                	jmp    4d1 <fast_filter3+0x231>
 4b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 4bf:	00 
 4c0:	89 f1                	mov    %esi,%ecx
 4c2:	48 83 c0 08          	add    $0x8,%rax
 4c6:	8d 76 ff             	lea    -0x1(%rsi),%esi
 4c9:	85 c9                	test   %ecx,%ecx
 4cb:	0f 88 bf fe ff ff    	js     390 <fast_filter3+0xf0>
 4d1:	c5 fb 10 10          	vmovsd (%rax),%xmm2
 4d5:	48 63 c9             	movslq %ecx,%rcx
 4d8:	41 39 f0             	cmp    %esi,%r8d
 4db:	c5 eb 59 14 cf       	vmulsd (%rdi,%rcx,8),%xmm2,%xmm2
 4e0:	c5 f3 58 ca          	vaddsd %xmm2,%xmm1,%xmm1
 4e4:	75 da                	jne    4c0 <fast_filter3+0x220>
 4e6:	e9 a5 fe ff ff       	jmpq   390 <fast_filter3+0xf0>
 4eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 4f0:	85 c9                	test   %ecx,%ecx
 4f2:	0f 88 32 ff ff ff    	js     42a <fast_filter3+0x18a>
 4f8:	41 89 df             	mov    %ebx,%r15d
 4fb:	48 63 ee             	movslq %esi,%rbp
 4fe:	41 89 f0             	mov    %esi,%r8d
 501:	48 8d 04 ea          	lea    (%rdx,%rbp,8),%rax
 505:	41 29 f7             	sub    %esi,%r15d
 508:	41 f7 d0             	not    %r8d
 50b:	4c 01 fd             	add    %r15,%rbp
 50e:	45 01 c8             	add    %r9d,%r8d
 511:	48 8d 34 ea          	lea    (%rdx,%rbp,8),%rsi
 515:	eb 1c                	jmp    533 <fast_filter3+0x293>
 517:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 51e:	00 00 
 520:	44 89 c1             	mov    %r8d,%ecx
 523:	48 83 c0 08          	add    $0x8,%rax
 527:	45 8d 40 ff          	lea    -0x1(%r8),%r8d
 52b:	85 c9                	test   %ecx,%ecx
 52d:	0f 88 f7 fe ff ff    	js     42a <fast_filter3+0x18a>
 533:	c5 fb 10 08          	vmovsd (%rax),%xmm1
 537:	48 63 c9             	movslq %ecx,%rcx
 53a:	48 39 f0             	cmp    %rsi,%rax
 53d:	c5 f3 59 0c cf       	vmulsd (%rdi,%rcx,8),%xmm1,%xmm1
 542:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 546:	75 d8                	jne    520 <fast_filter3+0x280>
 548:	e9 dd fe ff ff       	jmpq   42a <fast_filter3+0x18a>
 54d:	49 63 c5             	movslq %r13d,%rax
 550:	45 31 c9             	xor    %r9d,%r9d
 553:	49 c7 44 c3 f8 00 00 	movq   $0x0,-0x8(%r11,%rax,8)
 55a:	00 00 
 55c:	e9 5e fe ff ff       	jmpq   3bf <fast_filter3+0x11f>
 561:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 568:	0f 1f 84 00 00 00 00 
 56f:	00 

0000000000000570 <fast_filter2>:
 570:	41 56                	push   %r14
 572:	41 55                	push   %r13
 574:	41 54                	push   %r12
 576:	55                   	push   %rbp
 577:	53                   	push   %rbx
 578:	44 8b 56 08          	mov    0x8(%rsi),%r10d
 57c:	48 8b 2f             	mov    (%rdi),%rbp
 57f:	4c 8b 0e             	mov    (%rsi),%r9
 582:	45 8d 62 ff          	lea    -0x1(%r10),%r12d
 586:	45 85 e4             	test   %r12d,%r12d
 589:	0f 8e 6e 01 00 00    	jle    6fd <fast_filter2+0x18d>
 58f:	45 8d 6a fe          	lea    -0x2(%r10),%r13d
 593:	31 c0                	xor    %eax,%eax
 595:	41 d1 ed             	shr    %r13d
 598:	44 89 e9             	mov    %r13d,%ecx
 59b:	48 83 c1 01          	add    $0x1,%rcx
 59f:	48 c1 e1 04          	shl    $0x4,%rcx
 5a3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 5a8:	48 c7 44 05 00 00 00 	movq   $0x0,0x0(%rbp,%rax,1)
 5af:	00 00 
 5b1:	48 c7 44 05 08 00 00 	movq   $0x0,0x8(%rbp,%rax,1)
 5b8:	00 00 
 5ba:	48 83 c0 10          	add    $0x10,%rax
 5be:	48 39 c8             	cmp    %rcx,%rax
 5c1:	75 e5                	jne    5a8 <fast_filter2+0x38>
 5c3:	49 63 c2             	movslq %r10d,%rax
 5c6:	4c 89 cb             	mov    %r9,%rbx
 5c9:	41 bb 01 00 00 00    	mov    $0x1,%r11d
 5cf:	48 c7 44 c5 f8 00 00 	movq   $0x0,-0x8(%rbp,%rax,8)
 5d6:	00 00 
 5d8:	48 8d 4d 08          	lea    0x8(%rbp),%rcx
 5dc:	45 31 c0             	xor    %r8d,%r8d
 5df:	90                   	nop
 5e0:	48 89 de             	mov    %rbx,%rsi
 5e3:	31 c0                	xor    %eax,%eax
 5e5:	eb 3d                	jmp    624 <fast_filter2+0xb4>
 5e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 5ee:	00 00 
 5f0:	c5 fb 10 04 c2       	vmovsd (%rdx,%rax,8),%xmm0
 5f5:	48 83 ee 08          	sub    $0x8,%rsi
 5f9:	c5 fb 59 46 08       	vmulsd 0x8(%rsi),%xmm0,%xmm0
 5fe:	c5 fb 58 41 f8       	vaddsd -0x8(%rcx),%xmm0,%xmm0
 603:	c5 fb 11 41 f8       	vmovsd %xmm0,-0x8(%rcx)
 608:	c5 fb 10 04 c2       	vmovsd (%rdx,%rax,8),%xmm0
 60d:	48 83 c0 01          	add    $0x1,%rax
 611:	c5 fb 59 46 10       	vmulsd 0x10(%rsi),%xmm0,%xmm0
 616:	48 83 f8 1e          	cmp    $0x1e,%rax
 61a:	c5 fb 58 01          	vaddsd (%rcx),%xmm0,%xmm0
 61e:	c5 fb 11 01          	vmovsd %xmm0,(%rcx)
 622:	74 52                	je     676 <fast_filter2+0x106>
 624:	41 39 c0             	cmp    %eax,%r8d
 627:	4c 63 f0             	movslq %eax,%r14
 62a:	79 c4                	jns    5f0 <fast_filter2+0x80>
 62c:	44 89 d8             	mov    %r11d,%eax
 62f:	44 29 f0             	sub    %r14d,%eax
 632:	78 42                	js     676 <fast_filter2+0x106>
 634:	4a 8d 34 f2          	lea    (%rdx,%r14,8),%rsi
 638:	44 89 f7             	mov    %r14d,%edi
 63b:	c5 fb 10 01          	vmovsd (%rcx),%xmm0
 63f:	45 8d 70 e3          	lea    -0x1d(%r8),%r14d
 643:	f7 d7                	not    %edi
 645:	44 01 df             	add    %r11d,%edi
 648:	eb 13                	jmp    65d <fast_filter2+0xed>
 64a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 650:	89 f8                	mov    %edi,%eax
 652:	48 83 c6 08          	add    $0x8,%rsi
 656:	8d 7f ff             	lea    -0x1(%rdi),%edi
 659:	85 c0                	test   %eax,%eax
 65b:	78 19                	js     676 <fast_filter2+0x106>
 65d:	c5 fb 10 0e          	vmovsd (%rsi),%xmm1
 661:	48 98                	cltq   
 663:	41 39 fe             	cmp    %edi,%r14d
 666:	c4 c1 73 59 0c c1    	vmulsd (%r9,%rax,8),%xmm1,%xmm1
 66c:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 670:	c5 fb 11 01          	vmovsd %xmm0,(%rcx)
 674:	75 da                	jne    650 <fast_filter2+0xe0>
 676:	41 83 c0 02          	add    $0x2,%r8d
 67a:	48 83 c1 10          	add    $0x10,%rcx
 67e:	41 83 c3 02          	add    $0x2,%r11d
 682:	48 83 c3 10          	add    $0x10,%rbx
 686:	45 39 c4             	cmp    %r8d,%r12d
 689:	0f 8f 51 ff ff ff    	jg     5e0 <fast_filter2+0x70>
 68f:	43 8d 7c 2d 02       	lea    0x2(%r13,%r13,1),%edi
 694:	41 39 fa             	cmp    %edi,%r10d
 697:	7e 5b                	jle    6f4 <fast_filter2+0x184>
 699:	48 63 c7             	movslq %edi,%rax
 69c:	48 c1 e0 03          	shl    $0x3,%rax
 6a0:	48 8d 74 05 00       	lea    0x0(%rbp,%rax,1),%rsi
 6a5:	49 01 c1             	add    %rax,%r9
 6a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 6af:	00 
 6b0:	4c 89 c9             	mov    %r9,%rcx
 6b3:	31 c0                	xor    %eax,%eax
 6b5:	eb 29                	jmp    6e0 <fast_filter2+0x170>
 6b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 6be:	00 00 
 6c0:	c5 fb 10 04 c2       	vmovsd (%rdx,%rax,8),%xmm0
 6c5:	48 83 c0 01          	add    $0x1,%rax
 6c9:	48 83 e9 08          	sub    $0x8,%rcx
 6cd:	c5 fb 59 41 08       	vmulsd 0x8(%rcx),%xmm0,%xmm0
 6d2:	48 83 f8 1e          	cmp    $0x1e,%rax
 6d6:	c5 fb 58 06          	vaddsd (%rsi),%xmm0,%xmm0
 6da:	c5 fb 11 06          	vmovsd %xmm0,(%rsi)
 6de:	74 04                	je     6e4 <fast_filter2+0x174>
 6e0:	39 c7                	cmp    %eax,%edi
 6e2:	79 dc                	jns    6c0 <fast_filter2+0x150>
 6e4:	83 c7 01             	add    $0x1,%edi
 6e7:	48 83 c6 08          	add    $0x8,%rsi
 6eb:	49 83 c1 08          	add    $0x8,%r9
 6ef:	44 39 d7             	cmp    %r10d,%edi
 6f2:	75 bc                	jne    6b0 <fast_filter2+0x140>
 6f4:	5b                   	pop    %rbx
 6f5:	5d                   	pop    %rbp
 6f6:	41 5c                	pop    %r12
 6f8:	41 5d                	pop    %r13
 6fa:	41 5e                	pop    %r14
 6fc:	c3                   	retq   
 6fd:	49 63 c2             	movslq %r10d,%rax
 700:	31 ff                	xor    %edi,%edi
 702:	48 c7 44 c5 f8 00 00 	movq   $0x0,-0x8(%rbp,%rax,8)
 709:	00 00 
 70b:	eb 87                	jmp    694 <fast_filter2+0x124>
 70d:	0f 1f 00             	nopl   (%rax)

0000000000000710 <fast_filter1>:
 710:	41 56                	push   %r14
 712:	41 54                	push   %r12
 714:	55                   	push   %rbp
 715:	53                   	push   %rbx
 716:	8b 5e 08             	mov    0x8(%rsi),%ebx
 719:	4c 8b 17             	mov    (%rdi),%r10
 71c:	4c 8b 0e             	mov    (%rsi),%r9
 71f:	83 fb 01             	cmp    $0x1,%ebx
 722:	7e 2e                	jle    752 <fast_filter1+0x42>
 724:	8d 43 fe             	lea    -0x2(%rbx),%eax
 727:	d1 e8                	shr    %eax
 729:	48 8d 48 01          	lea    0x1(%rax),%rcx
 72d:	31 c0                	xor    %eax,%eax
 72f:	48 c1 e1 04          	shl    $0x4,%rcx
 733:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 738:	49 c7 04 02 00 00 00 	movq   $0x0,(%r10,%rax,1)
 73f:	00 
 740:	49 c7 44 02 08 00 00 	movq   $0x0,0x8(%r10,%rax,1)
 747:	00 00 
 749:	48 83 c0 10          	add    $0x10,%rax
 74d:	48 39 c8             	cmp    %rcx,%rax
 750:	75 e6                	jne    738 <fast_filter1+0x28>
 752:	48 63 c3             	movslq %ebx,%rax
 755:	45 31 c0             	xor    %r8d,%r8d
 758:	85 db                	test   %ebx,%ebx
 75a:	49 c7 44 c2 f8 00 00 	movq   $0x0,-0x8(%r10,%rax,8)
 761:	00 00 
 763:	4d 8d 59 f8          	lea    -0x8(%r9),%r11
 767:	bd 1d 00 00 00       	mov    $0x1d,%ebp
 76c:	7e 63                	jle    7d1 <fast_filter1+0xc1>
 76e:	66 90                	xchg   %ax,%ax
 770:	c4 81 7b 10 04 c2    	vmovsd (%r10,%r8,8),%xmm0
 776:	44 89 c7             	mov    %r8d,%edi
 779:	4c 89 d9             	mov    %r11,%rcx
 77c:	48 89 d0             	mov    %rdx,%rax
 77f:	31 f6                	xor    %esi,%esi
 781:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 788:	45 89 c4             	mov    %r8d,%r12d
 78b:	41 29 f4             	sub    %esi,%r12d
 78e:	45 85 e4             	test   %r12d,%r12d
 791:	7e 4d                	jle    7e0 <fast_filter1+0xd0>
 793:	c5 fb 10 08          	vmovsd (%rax),%xmm1
 797:	83 c6 02             	add    $0x2,%esi
 79a:	48 83 c0 10          	add    $0x10,%rax
 79e:	48 83 e9 10          	sub    $0x10,%rcx
 7a2:	c5 f3 59 49 18       	vmulsd 0x18(%rcx),%xmm1,%xmm1
 7a7:	c5 f3 58 c0          	vaddsd %xmm0,%xmm1,%xmm0
 7ab:	c5 fb 10 48 f8       	vmovsd -0x8(%rax),%xmm1
 7b0:	c5 f3 59 49 10       	vmulsd 0x10(%rcx),%xmm1,%xmm1
 7b5:	83 fe 1e             	cmp    $0x1e,%esi
 7b8:	c5 f3 58 c0          	vaddsd %xmm0,%xmm1,%xmm0
 7bc:	75 ca                	jne    788 <fast_filter1+0x78>
 7be:	c4 81 7b 11 04 c2    	vmovsd %xmm0,(%r10,%r8,8)
 7c4:	49 83 c0 01          	add    $0x1,%r8
 7c8:	49 83 c3 08          	add    $0x8,%r11
 7cc:	44 39 c3             	cmp    %r8d,%ebx
 7cf:	7f 9f                	jg     770 <fast_filter1+0x60>
 7d1:	5b                   	pop    %rbx
 7d2:	5d                   	pop    %rbp
 7d3:	41 5c                	pop    %r12
 7d5:	41 5e                	pop    %r14
 7d7:	c3                   	retq   
 7d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 7df:	00 
 7e0:	89 f9                	mov    %edi,%ecx
 7e2:	29 f1                	sub    %esi,%ecx
 7e4:	78 d8                	js     7be <fast_filter1+0xae>
 7e6:	89 f0                	mov    %esi,%eax
 7e8:	41 89 ee             	mov    %ebp,%r14d
 7eb:	4c 63 e6             	movslq %esi,%r12
 7ee:	f7 d0                	not    %eax
 7f0:	41 29 f6             	sub    %esi,%r14d
 7f3:	01 c7                	add    %eax,%edi
 7f5:	4a 8d 04 e2          	lea    (%rdx,%r12,8),%rax
 7f9:	4d 01 f4             	add    %r14,%r12
 7fc:	4a 8d 34 e2          	lea    (%rdx,%r12,8),%rsi
 800:	eb 13                	jmp    815 <fast_filter1+0x105>
 802:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 808:	89 f9                	mov    %edi,%ecx
 80a:	48 83 c0 08          	add    $0x8,%rax
 80e:	8d 7f ff             	lea    -0x1(%rdi),%edi
 811:	85 c9                	test   %ecx,%ecx
 813:	78 a9                	js     7be <fast_filter1+0xae>
 815:	c5 fb 10 08          	vmovsd (%rax),%xmm1
 819:	48 63 c9             	movslq %ecx,%rcx
 81c:	48 39 f0             	cmp    %rsi,%rax
 81f:	c4 c1 73 59 0c c9    	vmulsd (%r9,%rcx,8),%xmm1,%xmm1
 825:	c5 fb 58 c1          	vaddsd %xmm1,%xmm0,%xmm0
 829:	75 dd                	jne    808 <fast_filter1+0xf8>
 82b:	eb 91                	jmp    7be <fast_filter1+0xae>
 82d:	0f 1f 00             	nopl   (%rax)

0000000000000830 <slow_filter>:
 830:	41 55                	push   %r13
 832:	41 54                	push   %r12
 834:	55                   	push   %rbp
 835:	53                   	push   %rbx
 836:	48 83 ec 08          	sub    $0x8,%rsp
 83a:	44 8b 66 08          	mov    0x8(%rsi),%r12d
 83e:	48 8b 1f             	mov    (%rdi),%rbx
 841:	4c 8b 2e             	mov    (%rsi),%r13
 844:	45 85 e4             	test   %r12d,%r12d
 847:	7e 5b                	jle    8a4 <slow_filter+0x74>
 849:	48 89 d5             	mov    %rdx,%rbp
 84c:	49 63 d4             	movslq %r12d,%rdx
 84f:	31 f6                	xor    %esi,%esi
 851:	48 c1 e2 03          	shl    $0x3,%rdx
 855:	48 89 df             	mov    %rbx,%rdi
 858:	e8 00 00 00 00       	callq  85d <slow_filter+0x2d>
 85d:	4c 89 ea             	mov    %r13,%rdx
 860:	31 c9                	xor    %ecx,%ecx
 862:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 868:	48 89 d6             	mov    %rdx,%rsi
 86b:	31 c0                	xor    %eax,%eax
 86d:	eb 24                	jmp    893 <slow_filter+0x63>
 86f:	90                   	nop
 870:	c5 fb 10 44 c5 00    	vmovsd 0x0(%rbp,%rax,8),%xmm0
 876:	48 83 c0 01          	add    $0x1,%rax
 87a:	48 83 ee 08          	sub    $0x8,%rsi
 87e:	c5 fb 59 46 08       	vmulsd 0x8(%rsi),%xmm0,%xmm0
 883:	48 83 f8 1e          	cmp    $0x1e,%rax
 887:	c5 fb 58 04 cb       	vaddsd (%rbx,%rcx,8),%xmm0,%xmm0
 88c:	c5 fb 11 04 cb       	vmovsd %xmm0,(%rbx,%rcx,8)
 891:	74 04                	je     897 <slow_filter+0x67>
 893:	39 c1                	cmp    %eax,%ecx
 895:	79 d9                	jns    870 <slow_filter+0x40>
 897:	48 83 c1 01          	add    $0x1,%rcx
 89b:	48 83 c2 08          	add    $0x8,%rdx
 89f:	41 39 cc             	cmp    %ecx,%r12d
 8a2:	7f c4                	jg     868 <slow_filter+0x38>
 8a4:	48 83 c4 08          	add    $0x8,%rsp
 8a8:	5b                   	pop    %rbx
 8a9:	5d                   	pop    %rbp
 8aa:	41 5c                	pop    %r12
 8ac:	41 5d                	pop    %r13
 8ae:	c3                   	retq   
 8af:	90                   	nop

00000000000008b0 <compute_flops>:
 8b0:	85 ff                	test   %edi,%edi
 8b2:	7e 2f                	jle    8e3 <compute_flops+0x33>
 8b4:	31 c9                	xor    %ecx,%ecx
 8b6:	31 c0                	xor    %eax,%eax
 8b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 8bf:	00 
 8c0:	31 d2                	xor    %edx,%edx
 8c2:	eb 12                	jmp    8d6 <compute_flops+0x26>
 8c4:	0f 1f 40 00          	nopl   0x0(%rax)
 8c8:	48 83 c2 01          	add    $0x1,%rdx
 8cc:	48 83 c0 02          	add    $0x2,%rax
 8d0:	48 83 fa 1e          	cmp    $0x1e,%rdx
 8d4:	74 04                	je     8da <compute_flops+0x2a>
 8d6:	39 d1                	cmp    %edx,%ecx
 8d8:	79 ee                	jns    8c8 <compute_flops+0x18>
 8da:	83 c1 01             	add    $0x1,%ecx
 8dd:	39 f9                	cmp    %edi,%ecx
 8df:	75 df                	jne    8c0 <compute_flops+0x10>
 8e1:	f3 c3                	repz retq 
 8e3:	31 c0                	xor    %eax,%eax
 8e5:	c3                   	retq   
 8e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 8ed:	00 00 00 

00000000000008f0 <register_functions>:
 8f0:	48 83 ec 08          	sub    $0x8,%rsp
 8f4:	be 00 00 00 00       	mov    $0x0,%esi
 8f9:	bf 00 00 00 00       	mov    $0x0,%edi
 8fe:	e8 00 00 00 00       	callq  903 <register_functions+0x13>
 903:	be 00 00 00 00       	mov    $0x0,%esi
 908:	bf 00 00 00 00       	mov    $0x0,%edi
 90d:	e8 00 00 00 00       	callq  912 <register_functions+0x22>
 912:	be 00 00 00 00       	mov    $0x0,%esi
 917:	bf 00 00 00 00       	mov    $0x0,%edi
 91c:	e8 00 00 00 00       	callq  921 <register_functions+0x31>
 921:	be 00 00 00 00       	mov    $0x0,%esi
 926:	bf 00 00 00 00       	mov    $0x0,%edi
 92b:	e8 00 00 00 00       	callq  930 <register_functions+0x40>
 930:	be 00 00 00 00       	mov    $0x0,%esi
 935:	bf 00 00 00 00       	mov    $0x0,%edi
 93a:	48 83 c4 08          	add    $0x8,%rsp
 93e:	e9 00 00 00 00       	jmpq   943 <register_functions+0x53>
