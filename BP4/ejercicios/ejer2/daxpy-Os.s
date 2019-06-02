	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta el tamanio y/o la constante multiplicativa\n"
.LC2:
	.string	"Time: %11.9f\t Primer elemento: %d\t Ultimo elemento: %d\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jg	.L2
	movq	stderr(%rip), %rsi
	leaq	.LC0(%rip), %rdi
	call	fputs@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movq	%rax, %r12
	movl	$10, %edx
	movl	%r12d, %ebp
	xorl	%esi, %esi
	movl	%eax, %r14d
	salq	$2, %rbp
	call	strtol@PLT
	movq	%rbp, %rdi
	movl	%eax, %r13d
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	malloc@PLT
	xorl	%edx, %edx
	movq	%rax, %rbp
.L3:
	cmpl	%edx, %r14d
	jbe	.L10
	leal	2(%rdx), %eax
	movl	%eax, (%rbx,%rdx,4)
	leal	(%rdx,%rdx), %eax
	movl	%eax, 0(%rbp,%rdx,4)
	incq	%rdx
	jmp	.L3
.L10:
	leaq	8(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
.L5:
	cmpl	%eax, %r14d
	jbe	.L11
	movl	0(%rbp,%rax,4), %edx
	imull	%r13d, %edx
	addl	%edx, (%rbx,%rax,4)
	incq	%rax
	jmp	.L5
.L11:
	leaq	24(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leal	-1(%r12), %eax
	movl	(%rbx), %edx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	(%rbx,%rax,4), %ecx
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$1, %al
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	addq	$48, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
