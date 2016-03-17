	.file	"combine.c"
	.text
	.globl	init_tsc
	.type	init_tsc, @function
init_tsc:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	init_tsc, .-init_tsc
	.globl	start_tsc
	.type	start_tsc, @function
start_tsc:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movl	$0, %eax
#APP
# 83 "tsc_x86.h" 1
	cpuid
# 0 "" 2
# 84 "tsc_x86.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -24(%rbp)
	movl	%edx, -20(%rbp)
	movq	-24(%rbp), %rax
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	start_tsc, .-start_tsc
	.globl	stop_tsc
	.type	stop_tsc, @function
stop_tsc:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, -32(%rbp)
#APP
# 90 "tsc_x86.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, -24(%rbp)
	movl	%edx, -20(%rbp)
	movl	$0, %eax
#APP
# 91 "tsc_x86.h" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	-24(%rbp), %rax
	subq	-32(%rbp), %rax
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	stop_tsc, .-stop_tsc
	.comm	n,4,4
	.comm	U,8,8
	.comm	V,8,8
	.comm	X,8,8
	.comm	Y,8,8
	.comm	Z,8,8
	.globl	sum
	.bss
	.align 8
	.type	sum, @object
	.size	sum, 8
sum:
	.zero	8
	.globl	mul
	.data
	.align 8
	.type	mul, @object
	.size	mul, 8
mul:
	.long	0
	.long	1072693248
	.globl	num
	.align 8
	.type	num, @object
	.size	num, 8
num:
	.long	3435973837
	.long	1072483532
	.text
	.globl	compute
	.type	compute, @function
compute:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movabsq	$4607182418800017408, %rax
	movq	%rax, mul(%rip)
	movl	$0, %eax
	movq	%rax, sum(%rip)
	movl	$0, %eax
	movq	%rax, -40(%rbp)
	movl	$0, %eax
	movq	%rax, -32(%rbp)
	movabsq	$4607182418800017408, %rax
	movq	%rax, -24(%rbp)
	movabsq	$4607182418800017408, %rax
	movq	%rax, -16(%rbp)
	movabsq	$4607632778762754458, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -44(%rbp)
	jmp	.L7
.L8:
	movsd	-8(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-8(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-8(%rbp), %xmm0
	mulsd	-8(%rbp), %xmm0
	movsd	-24(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-8(%rbp), %xmm0
	mulsd	-8(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	addl	$4, -44(%rbp)
.L7:
	movl	-44(%rbp), %eax
	movl	n(%rip), %edx
	subl	$4, %edx
	cmpl	%edx, %eax
	jb	.L8
	jmp	.L9
.L10:
	movsd	sum(%rip), %xmm0
	addsd	-8(%rbp), %xmm0
	movsd	%xmm0, sum(%rip)
	movsd	mul(%rip), %xmm0
	mulsd	-8(%rbp), %xmm0
	movsd	%xmm0, mul(%rip)
	addl	$1, -44(%rbp)
.L9:
	movl	-44(%rbp), %edx
	movl	n(%rip), %eax
	cmpl	%eax, %edx
	jb	.L10
	movsd	-40(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	movsd	sum(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, sum(%rip)
	movsd	-24(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	movsd	mul(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, mul(%rip)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	compute, .-compute
	.globl	rdtsc
	.type	rdtsc, @function
rdtsc:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$40, %rsp
	movl	$1, -20(%rbp)
	jmp	.L12
.L20:
	call	start_tsc
	movq	%rax, -16(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L13
.L14:
	movl	$0, %eax
	call	compute
	addl	$1, -24(%rbp)
.L13:
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L14
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	stop_tsc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	js	.L15
	cvtsi2sdq	%rax, %xmm0
	jmp	.L16
.L15:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L16:
	ucomisd	.LC3(%rip), %xmm0
	jb	.L27
	jmp	.L19
.L27:
	sall	-20(%rbp)
.L12:
	cmpl	$16383, -20(%rbp)
	jle	.L20
.L19:
	call	start_tsc
	movq	%rax, -16(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L21
.L22:
	movl	$0, %eax
	call	compute
	addl	$1, -24(%rbp)
.L21:
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L22
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	stop_tsc
	movl	-20(%rbp), %edx
	movslq	%edx, %rcx
	movl	$0, %edx
	divq	%rcx
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	testq	%rax, %rax
	js	.L23
	cvtsi2sdq	%rax, %xmm0
	jmp	.L25
.L23:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L25:
	movsd	%xmm0, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	rdtsc, .-rdtsc
	.globl	c_clock
	.type	c_clock, @function
c_clock:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$1, -28(%rbp)
	jmp	.L29
.L35:
	call	clock
	movq	%rax, -24(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L30
.L31:
	movl	$0, %eax
	call	compute
	addl	$1, -32(%rbp)
.L30:
	movl	-32(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L31
	call	clock
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	ucomisd	.LC4(%rip), %xmm0
	jb	.L40
	jmp	.L34
.L40:
	sall	-28(%rbp)
.L29:
	cmpl	$16383, -28(%rbp)
	jle	.L35
.L34:
	call	clock
	movq	%rax, -24(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L36
.L37:
	movl	$0, %eax
	call	compute
	addl	$1, -32(%rbp)
.L36:
	movl	-32(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L37
	call	clock
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	cvtsi2sd	-28(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	c_clock, .-c_clock
	.globl	timeofday
	.type	timeofday, @function
timeofday:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	$1, -44(%rbp)
	jmp	.L42
.L48:
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movl	$0, -48(%rbp)
	jmp	.L43
.L44:
	movl	$0, %eax
	call	compute
	addl	$1, -48(%rbp)
.L43:
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L44
	leaq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC5(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	.LC6(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	ucomisd	.LC3(%rip), %xmm0
	jb	.L53
	jmp	.L47
.L53:
	sall	-44(%rbp)
.L42:
	cmpl	$16383, -44(%rbp)
	jle	.L48
.L47:
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movl	$0, -48(%rbp)
	jmp	.L49
.L50:
	movl	$0, %eax
	call	compute
	addl	$1, -48(%rbp)
.L49:
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L50
	leaq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC5(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvtsi2sd	-44(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	timeofday, .-timeofday
	.section	.rodata
.LC7:
	.string	"n=%d \n"
	.text
	.globl	main_run
	.type	main_run, @function
main_run:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, n(%rip)
	movl	n(%rip), %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	rdtsc
	movsd	%xmm0, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -40(%rbp)
	movl	$0, %eax
	call	c_clock
	movsd	%xmm0, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	$0, %eax
	call	timeofday
	movsd	%xmm0, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$32, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-16(%rbp), %rax
	leaq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-16(%rbp), %rax
	leaq	24(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main_run, .-main_run
	.globl	compare
	.type	compare, @function
compare:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	compare, .-compare
	.section	.rodata
.LC8:
	.string	"w"
.LC9:
	.string	"num_of_cycles.txt"
.LC10:
	.string	"n.txt"
.LC11:
	.string	"%f\n"
.LC12:
	.string	"%d\n"
	.text
	.globl	benchmark
	.type	benchmark, @function
benchmark:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$232, %rsp
	.cfi_offset 3, -24
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$5, -204(%rbp)
	movl	-204(%rbp), %eax
	movslq	%eax, %r8
	subq	$1, %r8
	movq	%r8, -200(%rbp)
	movslq	%eax, %r8
	movq	%r8, %rsi
	movl	$0, %edi
	movslq	%eax, %rsi
	movq	%rsi, %rdx
	movl	$0, %ecx
	cltq
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
	movq	%rax, -192(%rbp)
	movl	$15000000, -208(%rbp)
	movl	$.LC8, %esi
	movl	$.LC9, %edi
	call	fopen
	movq	%rax, -184(%rbp)
	movl	$.LC8, %esi
	movl	$.LC10, %edi
	call	fopen
	movq	%rax, -176(%rbp)
	movl	$0, -216(%rbp)
	jmp	.L59
.L62:
	movl	$0, -212(%rbp)
	jmp	.L60
.L61:
	movl	-208(%rbp), %eax
	movl	%eax, %edi
	call	main_run
	movq	%rax, -168(%rbp)
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movq	-192(%rbp), %rdx
	movl	-212(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	%rax, (%rdx,%rcx,8)
	addl	$1, -212(%rbp)
.L60:
	movl	-212(%rbp), %eax
	cmpl	-204(%rbp), %eax
	jl	.L61
	movl	-204(%rbp), %eax
	movslq	%eax, %rsi
	movq	-192(%rbp), %rax
	movl	$compare, %ecx
	movl	$8, %edx
	movq	%rax, %rdi
	call	qsort
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
	movl	-216(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rax, -160(%rbp,%rdx,8)
	movl	-216(%rbp), %eax
	cltq
	movq	-160(%rbp,%rax,8), %rax
	movq	-184(%rbp), %rdx
	movq	%rax, -232(%rbp)
	movsd	-232(%rbp), %xmm0
	movl	$.LC11, %esi
	movq	%rdx, %rdi
	movl	$1, %eax
	call	fprintf
	movl	-208(%rbp), %edx
	movq	-176(%rbp), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	sall	-208(%rbp)
	addl	$1, -216(%rbp)
.L59:
	cmpl	$0, -216(%rbp)
	jle	.L62
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-176(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
	movq	%rbx, %rsp
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	benchmark, .-benchmark
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$2, -4(%rbp)
	je	.L65
	movl	$0, %eax
	call	benchmark
	jmp	.L64
.L65:
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, n(%rip)
	movl	n(%rip), %eax
	movl	%eax, %edi
	call	main_run
	movl	$0, %eax
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	0
	.long	1100470148
	.align 8
.LC4:
	.long	991146299
	.long	1088604081
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.align 8
.LC6:
	.long	1073741824
	.long	1105420059
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
