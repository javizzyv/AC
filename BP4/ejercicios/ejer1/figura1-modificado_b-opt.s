	.file	"figura1-modificado_b-copia.c"
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
	movl	%r9d, %edx
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rax), %esi
	addq	$32, %rax
	leal	(%rdx,%rsi,2), %esi
	addl	%esi, %edi
	movl	-24(%rax), %esi
	leal	(%rdx,%rsi,2), %esi
	addl	%edi, %esi
	movl	-16(%rax), %edi
	leal	(%rdx,%rdi,2), %edi
	addl	%edi, %esi
	movl	-8(%rax), %edi
	leal	(%rdx,%rdi,2), %edi
	addl	%esi, %edi
	movl	-28(%rax), %esi
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	addl	%esi, %ecx
	movl	-20(%rax), %esi
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	addl	%ecx, %esi
	movl	-12(%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%ecx, %esi
	movl	-4(%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%esi, %ecx
	cmpq	%rax, %r8
	jne	.L3
	cmpl	%ecx, %edi
	cmovl	%edi, %ecx
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
	movl	32(%rsp), %edx
	pxor	%xmm1, %xmm1
	movl	160028(%rsp), %ecx
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
	movq	160040(%rsp), %rdx
	xorq	%fs:40, %rdx
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
