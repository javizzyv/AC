	.file	"pmm-secuencial-modificado_a.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"Primer componente: %f "
.LC5:
	.string	"Segundo componente: %f "
.LC6:
	.string	"Time: %11.9f\t\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	m1(%rip), %rbp
	leaq	m2(%rip), %rdx
	leaq	m3(%rip), %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movsd	.LC0(%rip), %xmm1
	movsd	.LC1(%rip), %xmm0
.L2:
	leaq	8000(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L3:
	movsd	%xmm1, 0(%rbp,%rax)
	movq	$0x000000000, (%rbx,%rax)
	movsd	%xmm0, (%rdx,%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L3
	cmpq	$8000000, %rax
	jne	.L2
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	3984+m1(%rip), %rdi
	movq	$-3984, %r9
	movl	$16, %r8d
	leaq	m2(%rip), %rdx
	leaq	8+m3(%rip), %rcx
	subq	%rbp, %r9
	leaq	8000000(%rdi), %r10
	subq	%rbp, %r8
.L5:
	leaq	(%r9,%rdi), %rax
	leaq	(%r8,%rdi), %rsi
	movsd	(%rdi), %xmm3
	movsd	8(%rdi), %xmm2
	.p2align 4,,10
	.p2align 3
.L6:
	movsd	3992008(%rdx,%rax), %xmm0
	movsd	3984000(%rdx,%rax), %xmm1
	mulsd	%xmm2, %xmm0
	mulsd	%xmm3, %xmm1
	movsd	%xmm1, (%rbx,%rax)
	movsd	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpq	%rax, %rsi
	jne	.L6
	addq	$8000, %rdi
	subq	$8000, %rdx
	cmpq	%r10, %rdi
	jne	.L5
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	$10, %edi
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm1
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC3(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsp)
	call	putchar@PLT
	movsd	(%rbx), %xmm0
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	$10, %edi
	call	putchar@PLT
	movsd	7999992+m3(%rip), %xmm0
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	$10, %edi
	call	putchar@PLT
	movsd	8(%rsp), %xmm1
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	movapd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	56(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L13
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	m3,8000000,32
	.comm	m2,8000000,32
	.comm	m1,8000000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1073741824
	.align 8
.LC1:
	.long	0
	.long	1074266112
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
