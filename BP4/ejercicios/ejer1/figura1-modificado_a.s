	.file	"figura1-modificado_a.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Tiempo: %11.9f\t Primera componente: %d\t Ultima componente: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$160056, %rsp
	.cfi_def_cfa_offset 160064
	xorl	%edi, %edi
	movq	%rsp, %rsi
	movq	%fs:40, %rax
	movq	%rax, 160040(%rsp)
	xorl	%eax, %eax
	call	clock_gettime@PLT
	leaq	32(%rsp), %r10
	leaq	40000+s(%rip), %r8
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	s(%rip), %rax
	movl	%r9d, %edi
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rdi,%rdx,2), %edx
	addl	%edx, %esi
	movl	-4(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%edi, %edx
	addl	%edx, %ecx
	cmpq	%rax, %r8
	jne	.L3
	cmpl	%ecx, %esi
	cmovl	%esi, %ecx
	movl	%ecx, (%r10,%r9,4)
	addq	$1, %r9
	cmpq	$40000, %r9
	jne	.L2
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC1(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	160028(%rsp), %ecx
	pxor	%xmm1, %xmm1
	movl	32(%rsp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	160040(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L11
	addq	$160056, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
