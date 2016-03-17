	.file	"locality.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -132(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%rsp, %rax
	movq	%rax, %rsi
	movl	$10, -120(%rbp)
	movl	$1, -116(%rbp)
	movl	-120(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	%rdx, -112(%rbp)
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, %rcx
	movl	$0, %ebx
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	%rdx, %rax
	addq	$1, %rax
	salq	$2, %rax
	leaq	3(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -104(%rbp)
	movl	-120(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	%rdx, -96(%rbp)
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -160(%rbp)
	movq	$0, -152(%rbp)
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -176(%rbp)
	movq	$0, -168(%rbp)
	movq	%rdx, %rax
	addq	$1, %rax
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -88(%rbp)
	movl	-120(%rbp), %eax
	cltq
	subq	$1, %rax
	movq	%rax, -80(%rbp)
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, -192(%rbp)
	movq	$0, -184(%rbp)
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	addq	$1, %rax
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -72(%rbp)
	movl	-120(%rbp), %eax
	cltq
	subq	$1, %rax
	movq	%rax, -64(%rbp)
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	addq	$1, %rax
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -56(%rbp)
	movl	-120(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -128(%rbp)
	jmp	.L2
.L5:
	movl	$0, -124(%rbp)
	jmp	.L3
.L4:
	movq	-72(%rbp), %rdx
	movabsq	$4617315517961601024, %rax
	movq	%rax, (%rdx)
	addl	$1, -124(%rbp)
.L3:
	movl	-124(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jl	.L4
	movl	-116(%rbp), %eax
	subl	%eax, -128(%rbp)
.L2:
	cmpl	$0, -128(%rbp)
	jns	.L5
	movq	%rsi, %rsp
	movl	$0, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
