	.file	"pmm-opt.c"
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	leaq	m1(%rip), %rdi
	leaq	m2(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movsd	.LC0(%rip), %xmm1
	leaq	m3(%rip), %rcx
	movsd	.LC1(%rip), %xmm0
.L2:
	leaq	8000(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L3:
	movsd	%xmm1, (%rdi,%rax)
	movq	$0x000000000, (%rcx,%rax)
	movsd	%xmm0, (%rsi,%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L3
	cmpq	$8000000, %rdx
	jne	.L2
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	1984+m1(%rip), %rsi
	leaq	m3(%rip), %rdi
	leaq	1986016+m2(%rip), %rcx
	leaq	8000000(%rsi), %r8
.L5:
	leaq	1984000+m2(%rip), %rax
	movsd	(%rsi), %xmm7
	movsd	8(%rsi), %xmm6
	movq	%rdi, %rdx
	movsd	16(%rsi), %xmm5
	movsd	24(%rsi), %xmm4
	.p2align 4,,10
	.p2align 3
.L6:
	movsd	8008(%rax), %xmm2
	addq	$32, %rax
	addq	$32, %rdx
	movsd	15984(%rax), %xmm1
	movsd	23992(%rax), %xmm0
	movsd	-32(%rax), %xmm3
	mulsd	%xmm6, %xmm2
	mulsd	%xmm7, %xmm3
	mulsd	%xmm5, %xmm1
	mulsd	%xmm4, %xmm0
	movsd	%xmm2, -24(%rdx)
	movsd	%xmm3, -32(%rdx)
	movsd	%xmm1, -16(%rdx)
	movsd	%xmm0, -8(%rdx)
	cmpq	%rcx, %rax
	jne	.L6
	addq	$8000, %rsi
	addq	$8000, %rdi
	cmpq	%rsi, %r8
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
	movsd	m3(%rip), %xmm0
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
