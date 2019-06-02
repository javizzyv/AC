	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Falta el tamanio y/o la constante multiplicativa\n"
	.align 8
.LC2:
	.string	"Time: %11.9f\t Primer elemento: %d\t Ultimo elemento: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
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
	jle	.L15
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movq	%rax, %r13
	xorl	%esi, %esi
	movl	%r13d, %ebx
	movl	$10, %edx
	salq	$2, %rbx
	call	strtol@PLT
	movq	%rbx, %rdi
	movl	%eax, %r14d
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	malloc@PLT
	testl	%r13d, %r13d
	movq	%rax, %r12
	je	.L3
	leal	-1(%r13), %eax
	xorl	%ebx, %ebx
	movq	%rax, %r13
	addq	$1, %rax
	.p2align 4,,10
	.p2align 3
.L4:
	leal	2(%rbx), %edx
	movl	%edx, 0(%rbp,%rbx,4)
	leal	(%rbx,%rbx), %edx
	movl	%edx, (%r12,%rbx,4)
	addq	$1, %rbx
	cmpq	%rax, %rbx
	jne	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	salq	$2, %rbx
	call	clock_gettime@PLT
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%r12,%rdx), %ecx
	imull	%r14d, %ecx
	addl	%ecx, 0(%rbp,%rdx)
	addq	$4, %rdx
	cmpq	%rdx, %rbx
	jne	.L6
.L7:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC2(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	0(%rbp,%r13,4), %ecx
	pxor	%xmm1, %xmm1
	movl	0(%rbp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L16
	addq	$48, %rsp
	.cfi_remember_state
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
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	movl	$4294967295, %r13d
	call	clock_gettime@PLT
	jmp	.L7
.L16:
	call	__stack_chk_fail@PLT
.L15:
	movq	stderr(%rip), %rcx
	leaq	.LC0(%rip), %rdi
	movl	$49, %edx
	movl	$1, %esi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
