	.file	"mult.cc"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"%d iterations, %lu cycles, %4.2f cycles/iteration\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%lu %lu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7497:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	call	time
	xorl	%edi, %edi
	movzbl	%al, %eax
	movl	%eax, 12(%rsp)
	call	time
	xorl	%edi, %edi
	movzbl	%al, %eax
	movl	%eax, 16(%rsp)
	call	time
	xorl	%edi, %edi
	movzbl	%al, %eax
	movl	%eax, 20(%rsp)
	call	time
	xorl	%edi, %edi
	movzbl	%al, %eax
	movl	%eax, 24(%rsp)
	call	time
	movq	%rax, %rbp
	movzbl	%al, %eax
	movl	%eax, 28(%rsp)
	rdtsc
	movl	$1000000000, %esi
	movl	$1, %ebx
	movq	%rax, %rcx
	salq	$32, %rdx
	orq	%rdx, %rcx
	.p2align 6
	.p2align 4
	.p2align 3
.L2:
	movslq	12(%rsp), %rax
	movslq	16(%rsp), %rdx
	imulq	%rbx, %rax
	imulq	%rax, %rdx
	movslq	20(%rsp), %rax
	movslq	24(%rsp), %rbx
	imulq	%rdx, %rax
	imulq	%rax, %rbx
	subl	$1, %esi
	jne	.L2
	rdtsc
	pxor	%xmm1, %xmm1
	salq	$32, %rdx
	orq	%rdx, %rax
	subq	%rcx, %rax
	movq	%rax, %rsi
	cvtsi2sdq	%rax, %xmm1
	rdtsc
	movl	$1000000000, %r8d
	movq	%rax, %rdi
	salq	$32, %rdx
	orq	%rdx, %rdi
	.p2align 6
	.p2align 4
	.p2align 3
.L3:
	movslq	12(%rsp), %rax
	movslq	16(%rsp), %rdx
	movslq	20(%rsp), %rcx
	imulq	%rbx, %rax
	imulq	%rax, %rdx
	imulq	%rdx, %rcx
	movslq	24(%rsp), %rdx
	movslq	28(%rsp), %rbx
	imulq	%rcx, %rdx
	imulq	%rdx, %rbx
	subl	$1, %r8d
	jne	.L3
	rdtsc
	pxor	%xmm0, %xmm0
	salq	$32, %rdx
	movq	%rsi, %rcx
	movl	$.LC1, %esi
	orq	%rdx, %rax
	movl	$1000000000, %edx
	subq	%rdi, %rax
	movq	stdout(%rip), %rdi
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	subsd	%xmm1, %xmm0
	divsd	.LC0(%rip), %xmm0
	call	fprintf
	movq	%rbx, %rcx
	movq	%rbp, %rdx
	movl	$.LC2, %esi
	movq	stdout(%rip), %rdi
	xorl	%eax, %eax
	call	fprintf
	addq	$40, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7497:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 15.2.1 20250808 (Red Hat 15.2.1-1)"
	.section	.note.GNU-stack,"",@progbits
