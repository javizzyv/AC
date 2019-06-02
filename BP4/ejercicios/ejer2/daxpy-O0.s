	.file	"daxpy.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Falta el tamanio y/o la constante multiplicativa\n"
	.align 8
.LC2:
	.string	"Time: %11.9f\t Primer elemento: %d\t Ultimo elemento: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$2, -100(%rbp)
	jg	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$49, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol@PLT
	movl	%eax, -80(%rbp)
	movq	-112(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol@PLT
	movl	%eax, -76(%rbp)
	movl	-80(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	movl	-80(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -64(%rbp)
	movl	$0, -84(%rbp)
	jmp	.L3
.L4:
	movl	-84(%rbp), %eax
	leal	2(%rax), %edx
	movl	-84(%rbp), %eax
	leaq	0(,%rax,4), %rcx
	movq	-72(%rbp), %rax
	addq	%rcx, %rax
	movl	%edx, (%rax)
	movl	-84(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-84(%rbp), %eax
	leaq	0(,%rax,4), %rcx
	movq	-64(%rbp), %rax
	addq	%rcx, %rax
	movl	%edx, (%rax)
	addl	$1, -84(%rbp)
.L3:
	movl	-84(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jb	.L4
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -84(%rbp)
	jmp	.L5
.L6:
	movl	-84(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-84(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	imull	-76(%rbp), %eax
	movl	%eax, %edx
	movl	-84(%rbp), %eax
	leaq	0(,%rax,4), %rsi
	movq	-72(%rbp), %rax
	addq	%rsi, %rax
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -84(%rbp)
.L5:
	movl	-84(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jb	.L6
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC1(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-80(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-72(%rbp), %rax
	movl	(%rax), %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
