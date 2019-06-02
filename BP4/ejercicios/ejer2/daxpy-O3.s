	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Falta el tamanio y/o la constante multiplicativa\n"
	.align 8
.LC5:
	.string	"Time: %11.9f\t Primer elemento: %d\t Ultimo elemento: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L33
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movq	%rax, %r14
	xorl	%esi, %esi
	movl	%r14d, %ebx
	movl	$10, %edx
	salq	$2, %rbx
	call	strtol@PLT
	movq	%rbx, %rdi
	movq	%rax, %r15
	movl	%eax, 12(%rsp)
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	malloc@PLT
	testl	%r14d, %r14d
	movq	%rax, %r13
	je	.L3
	movq	%r12, %rbx
	leal	-1(%r14), %ebp
	movl	$4, %eax
	shrq	$2, %rbx
	negq	%rbx
	andl	$3, %ebx
	leal	3(%rbx), %r8d
	cmpl	$4, %r8d
	cmovnb	%r8d, %eax
	cmpl	%eax, %ebp
	jb	.L17
	testl	%ebx, %ebx
	movl	$0, 8(%rsp)
	je	.L5
	cmpl	$1, %ebx
	movl	$2, (%r12)
	movl	$0, 0(%r13)
	je	.L19
	cmpl	$3, %ebx
	movl	$3, 4(%r12)
	movl	$2, 4(%r13)
	jne	.L20
	movl	$4, 8(%r12)
	movl	$4, 8(%r13)
	movl	$3, 8(%rsp)
.L5:
	movd	8(%rsp), %xmm4
	movl	%r14d, %edi
	movl	%ebx, %ecx
	subl	%ebx, %edi
	salq	$2, %rcx
	xorl	%eax, %eax
	pshufd	$0, %xmm4, %xmm0
	movl	%edi, %r9d
	movdqa	.LC2(%rip), %xmm3
	leaq	(%r12,%rcx), %rsi
	shrl	$2, %r9d
	addq	%r13, %rcx
	xorl	%edx, %edx
	movdqa	.LC3(%rip), %xmm2
	paddd	.LC1(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L7:
	movdqa	%xmm0, %xmm1
	addl	$1, %edx
	paddd	%xmm2, %xmm1
	movaps	%xmm1, (%rsi,%rax)
	movdqa	%xmm0, %xmm1
	paddd	%xmm3, %xmm0
	pslld	$1, %xmm1
	movups	%xmm1, (%rcx,%rax)
	addq	$16, %rax
	cmpl	%edx, %r9d
	ja	.L7
	movl	%edi, %edx
	movl	8(%rsp), %eax
	andl	$-4, %edx
	addl	%edx, %eax
	cmpl	%edx, %edi
	je	.L8
.L4:
	leal	2(%rax), %edx
	leal	(%rax,%rax), %esi
	movl	%eax, %ecx
	movl	%edx, (%r12,%rcx,4)
	movl	%esi, 0(%r13,%rcx,4)
	leal	1(%rax), %ecx
	cmpl	%ecx, %r14d
	jbe	.L8
	leal	3(%rax), %esi
	movl	%ecx, %edi
	addl	%ecx, %ecx
	cmpl	%edx, %r14d
	movl	%ecx, 0(%r13,%rdi,4)
	movl	%esi, (%r12,%rdi,4)
	jbe	.L8
	leal	4(%rax), %ecx
	movl	%edx, %edi
	addl	%edx, %edx
	cmpl	%esi, %r14d
	movl	%edx, 0(%r13,%rdi,4)
	movl	%ecx, (%r12,%rdi,4)
	jbe	.L8
	leal	5(%rax), %edx
	movl	%esi, %edi
	addl	%esi, %esi
	cmpl	%ecx, %r14d
	movl	%esi, 0(%r13,%rdi,4)
	movl	%edx, (%r12,%rdi,4)
	jbe	.L8
	leal	6(%rax), %edi
	movl	%ecx, %esi
	addl	%ecx, %ecx
	cmpl	%edx, %r14d
	movl	%ecx, 0(%r13,%rsi,4)
	movl	%edi, (%r12,%rsi,4)
	jbe	.L8
	movl	%edx, %ecx
	addl	$7, %eax
	addl	%edx, %edx
	movl	%eax, (%r12,%rcx,4)
	movl	%edx, 0(%r13,%rcx,4)
.L8:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	%r8d, 8(%rsp)
	call	clock_gettime@PLT
	movl	8(%rsp), %r8d
	cmpl	%r8d, %ebp
	jb	.L21
	xorl	%r8d, %r8d
	testl	%ebx, %ebx
	je	.L13
	movl	0(%r13), %eax
	imull	%r15d, %eax
	addl	%eax, (%r12)
	cmpl	$1, %ebx
	je	.L23
	movl	4(%r13), %eax
	imull	%r15d, %eax
	addl	%eax, 4(%r12)
	cmpl	$3, %ebx
	jne	.L24
	movl	8(%r13), %eax
	movl	$3, %r8d
	imull	%r15d, %eax
	addl	%eax, 8(%r12)
.L13:
	movd	12(%rsp), %xmm5
	movl	%r14d, %edi
	xorl	%eax, %eax
	subl	%ebx, %edi
	salq	$2, %rbx
	xorl	%edx, %edx
	pshufd	$0, %xmm5, %xmm2
	movl	%edi, %esi
	leaq	(%r12,%rbx), %rcx
	shrl	$2, %esi
	addq	%r13, %rbx
	movdqa	%xmm2, %xmm3
	psrlq	$32, %xmm3
	.p2align 4,,10
	.p2align 3
.L10:
	movdqu	(%rbx,%rax), %xmm0
	addl	$1, %edx
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm0
	pmuludq	%xmm3, %xmm0
	pshufd	$8, %xmm0, %xmm0
	pmuludq	%xmm2, %xmm1
	pshufd	$8, %xmm1, %xmm1
	punpckldq	%xmm0, %xmm1
	movdqa	(%rcx,%rax), %xmm0
	paddd	%xmm1, %xmm0
	movaps	%xmm0, (%rcx,%rax)
	addq	$16, %rax
	cmpl	%esi, %edx
	jb	.L10
	movl	%edi, %edx
	andl	$-4, %edx
	cmpl	%edx, %edi
	leal	(%r8,%rdx), %eax
	je	.L15
.L12:
	movl	%eax, %edx
	movl	0(%r13,%rdx,4), %ecx
	imull	%r15d, %ecx
	addl	%ecx, (%r12,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%r14d, %edx
	jnb	.L15
	movl	0(%r13,%rdx,4), %ecx
	imull	%r15d, %ecx
	addl	%ecx, (%r12,%rdx,4)
	leal	2(%rax), %edx
	cmpl	%r14d, %edx
	jnb	.L15
	movl	0(%r13,%rdx,4), %ecx
	imull	%r15d, %ecx
	addl	%ecx, (%r12,%rdx,4)
	leal	3(%rax), %edx
	cmpl	%edx, %r14d
	jbe	.L15
	movl	0(%r13,%rdx,4), %ecx
	imull	%r15d, %ecx
	addl	%ecx, (%r12,%rdx,4)
	leal	4(%rax), %edx
	cmpl	%edx, %r14d
	jbe	.L15
	movl	0(%r13,%rdx,4), %ecx
	addl	$5, %eax
	imull	%r15d, %ecx
	addl	%ecx, (%r12,%rdx,4)
	cmpl	%eax, %r14d
	jbe	.L15
	imull	0(%r13,%rax,4), %r15d
	addl	%r15d, (%r12,%rax,4)
.L15:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	24(%rsp), %rax
	pxor	%xmm1, %xmm1
	movl	(%r12,%rbp,4), %ecx
	movl	(%r12), %edx
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	xorl	%eax, %eax
	movq	56(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L34
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	movl	$1, 8(%rsp)
	jmp	.L5
.L23:
	movl	$1, %r8d
	jmp	.L13
.L3:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	$4294967295, %ebp
	call	clock_gettime@PLT
	jmp	.L15
.L20:
	movl	$2, 8(%rsp)
	jmp	.L5
.L24:
	movl	$2, %r8d
	jmp	.L13
.L17:
	xorl	%eax, %eax
	jmp	.L4
.L21:
	xorl	%eax, %eax
	jmp	.L12
.L34:
	call	__stack_chk_fail@PLT
.L33:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC3:
	.long	2
	.long	2
	.long	2
	.long	2
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
