	.file	"figura1.c"
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
	leaq	40004+s(%rip), %r9
	leaq	32(%rsp), %r11
	xorl	%r10d, %r10d
	leaq	-4(%r9), %r8
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	s(%rip), %rax
	movl	%r10d, %edi
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rdi,%rdx,2), %edx
	addl	%edx, %esi
	cmpq	%r8, %rax
	jne	.L3
	leaq	4+s(%rip), %rax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rdx,%rdx,2), %edx
	subl	%edi, %edx
	addl	%edx, %ecx
	cmpq	%r9, %rax
	jne	.L4
	cmpl	%esi, %ecx
	cmovg	%esi, %ecx
	movl	%ecx, (%r11,%r10,4)
	addq	$1, %r10
	cmpq	$40000, %r10
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
	jne	.L13
	addq	$160056, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L13:
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
