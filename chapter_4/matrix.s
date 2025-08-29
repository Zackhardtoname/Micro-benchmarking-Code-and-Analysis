	.file	"matrix.cc"
	.text
	.p2align 4
	.globl	_Z17SimpleMultiplyOnePKdS0_Pd
	.type	_Z17SimpleMultiplyOnePKdS0_Pd, @function
_Z17SimpleMultiplyOnePKdS0_Pd:
.LFB7526:
	.cfi_startproc
	movq	%rdx, %rcx
	movl	$1024, %r8d
.L2:
	movl	$1024, %edx
.L6:
	movsd	(%rdi), %xmm7
	movsd	8(%rdi), %xmm6
	pxor	%xmm3, %xmm3
	movl	$256, %eax
	movsd	16(%rdi), %xmm5
	movsd	24(%rdi), %xmm4
	movapd	%xmm3, %xmm2
	movapd	%xmm3, %xmm1
	mulsd	(%rsi), %xmm7
	movapd	%xmm3, %xmm0
	mulsd	8(%rsi), %xmm6
	mulsd	16(%rsi), %xmm5
	mulsd	24(%rsi), %xmm4
	.p2align 5
	.p2align 4
	.p2align 3
.L3:
	addsd	%xmm7, %xmm0
	addsd	%xmm6, %xmm1
	addsd	%xmm5, %xmm2
	addsd	%xmm4, %xmm3
	subl	$1, %eax
	jne	.L3
	addsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm3, %xmm0
	movsd	%xmm0, 8(%rcx)
	subl	$1, %edx
	jne	.L6
	subl	$1, %r8d
	jne	.L2
	ret
	.cfi_endproc
.LFE7526:
	.size	_Z17SimpleMultiplyOnePKdS0_Pd, .-_Z17SimpleMultiplyOnePKdS0_Pd
	.p2align 4
	.globl	_Z8InitTagsv
	.type	_Z8InitTagsv, @function
_Z8InitTagsv:
.LFB7511:
	.cfi_startproc
	xorl	%eax, %eax
	movl	$512, %ecx
	movl	$_ZL5L1tag, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	rep stosq
	movl	$32768, %edx
	xorl	%esi, %esi
	movl	$_ZL5L2tag, %edi
	call	memset
	movl	$262144, %edx
	xorl	%esi, %esi
	movl	$_ZL5L3tag, %edi
	call	memset
	movq	$0, _ZL8L3misses(%rip)
	movq	$0, _ZL8L2misses(%rip)
	movq	$0, _ZL8L1misses(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7511:
	.size	_Z8InitTagsv, .-_Z8InitTagsv
	.p2align 4
	.globl	_Z2L1y
	.type	_Z2L1y, @function
_Z2L1y:
.LFB7512:
	.cfi_startproc
	movq	%rdi, %rdx
	andq	$-64, %rdi
	shrq	$6, %rdx
	sall	$3, %edx
	movl	%edx, %ecx
	andl	$504, %edx
	salq	$3, %rdx
	andl	$504, %ecx
	leaq	_ZL5L1tag(%rdx), %rax
	addq	$_ZL5L1tag+64, %rdx
	.p2align 4
	.p2align 4
	.p2align 3
.L13:
	cmpq	%rdi, (%rax)
	je	.L14
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L13
	movl	_ZL4L1rr(%rip), %eax
	addq	$1, _ZL8L1misses(%rip)
	addl	%eax, %ecx
	addl	$1, %eax
	andl	$7, %eax
	movslq	%ecx, %rcx
	movl	%eax, _ZL4L1rr(%rip)
	xorl	%eax, %eax
	movq	%rdi, _ZL5L1tag(,%rcx,8)
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE7512:
	.size	_Z2L1y, .-_Z2L1y
	.p2align 4
	.globl	_Z2L2y
	.type	_Z2L2y, @function
_Z2L2y:
.LFB7513:
	.cfi_startproc
	movq	%rdi, %rdx
	andq	$-64, %rdi
	shrq	$6, %rdx
	sall	$3, %edx
	movl	%edx, %ecx
	andl	$4088, %edx
	salq	$3, %rdx
	andl	$4088, %ecx
	leaq	_ZL5L2tag(%rdx), %rax
	addq	$_ZL5L2tag+64, %rdx
	.p2align 4
	.p2align 4
	.p2align 3
.L18:
	cmpq	%rdi, (%rax)
	je	.L19
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L18
	movl	_ZL4L2rr(%rip), %eax
	addq	$1, _ZL8L2misses(%rip)
	addl	%eax, %ecx
	addl	$1, %eax
	andl	$7, %eax
	movslq	%ecx, %rcx
	movl	%eax, _ZL4L2rr(%rip)
	xorl	%eax, %eax
	movq	%rdi, _ZL5L2tag(,%rcx,8)
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE7513:
	.size	_Z2L2y, .-_Z2L2y
	.p2align 4
	.globl	_Z2L3y
	.type	_Z2L3y, @function
_Z2L3y:
.LFB7514:
	.cfi_startproc
	movq	%rdi, %rdx
	movq	%rdi, %rax
	andq	$-64, %rdi
	shrq	$21, %rax
	shrq	$6, %rdx
	xorl	%eax, %edx
	sall	$4, %edx
	movl	%edx, %ecx
	andl	$32752, %edx
	salq	$3, %rdx
	andl	$32752, %ecx
	leaq	_ZL5L3tag(%rdx), %rax
	addq	$_ZL5L3tag+128, %rdx
	.p2align 4
	.p2align 4
	.p2align 3
.L23:
	cmpq	%rdi, (%rax)
	je	.L24
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L23
	movl	_ZL4L3rr(%rip), %eax
	addq	$1, _ZL8L3misses(%rip)
	addl	%eax, %ecx
	addl	$1, %eax
	andl	$15, %eax
	movslq	%ecx, %rcx
	movl	%eax, _ZL4L3rr(%rip)
	xorl	%eax, %eax
	movq	%rdi, _ZL5L3tag(,%rcx,8)
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE7514:
	.size	_Z2L3y, .-_Z2L3y
	.p2align 4
	.globl	_Z14SimpleMultiplyPKdS0_Pd
	.type	_Z14SimpleMultiplyPKdS0_Pd, @function
_Z14SimpleMultiplyPKdS0_Pd:
.LFB7524:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	8388608(%rsi), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
.L27:
	movq	%rbp, %rbx
	movq	%r12, %r9
	xorl	%r11d, %r11d
	salq	$13, %rbx
	leaq	(%r14,%rbx), %r10
	addq	%r13, %rbx
.L31:
	leaq	-8388608(%r9), %rsi
	movq	%rbx, %r8
	pxor	%xmm1, %xmm1
	.p2align 4
	.p2align 3
.L28:
	movq	%r8, %rdi
	movsd	(%r8), %xmm0
	mulsd	(%rsi), %xmm0
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	addq	$8, %r8
	call	_Z2L3y
	movq	%rsi, %rdi
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	addq	$8192, %rsi
	addsd	%xmm0, %xmm1
	call	_Z2L3y
	cmpq	%r9, %rsi
	jne	.L28
	movq	%r10, %rdi
	movsd	%xmm1, (%r10)
	addl	$1, %r11d
	leaq	8(%rsi), %r9
	call	_Z2L1y
	movq	%r10, %rdi
	call	_Z2L2y
	movq	%r10, %rdi
	addq	$8, %r10
	call	_Z2L3y
	cmpl	$1024, %r11d
	jne	.L31
	addq	$1, %rbp
	cmpq	$1024, %rbp
	jne	.L27
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
.LFE7524:
	.size	_Z14SimpleMultiplyPKdS0_Pd, .-_Z14SimpleMultiplyPKdS0_Pd
	.p2align 4
	.globl	_Z24SimpleMultiplyColumnwisePKdS0_Pd
	.type	_Z24SimpleMultiplyColumnwisePKdS0_Pd, @function
_Z24SimpleMultiplyColumnwisePKdS0_Pd:
.LFB7525:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	8388608(%rsi), %r9
	xorl	%r14d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	8388608(%rdi), %rbx
.L35:
	movq	%r13, %r11
	movq	%r12, %r10
	leaq	-8388608(%r9), %rbp
.L39:
	movq	%rbp, %rsi
	movq	%r11, %r8
	pxor	%xmm1, %xmm1
	.p2align 4
	.p2align 3
.L36:
	movq	%r8, %rdi
	movsd	(%r8), %xmm0
	mulsd	(%rsi), %xmm0
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	addq	$8, %r8
	call	_Z2L3y
	movq	%rsi, %rdi
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	addq	$8192, %rsi
	addsd	%xmm0, %xmm1
	call	_Z2L3y
	cmpq	%rsi, %r9
	jne	.L36
	movq	%r10, %rdi
	movsd	%xmm1, (%r10)
	addq	$8192, %r11
	call	_Z2L1y
	movq	%r10, %rdi
	call	_Z2L2y
	movq	%r10, %rdi
	addq	$8192, %r10
	call	_Z2L3y
	cmpq	%r11, %rbx
	jne	.L39
	addl	$1, %r14d
	addq	$8, %r9
	addq	$8, %r12
	cmpl	$1024, %r14d
	jne	.L35
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
.LFE7525:
	.size	_Z24SimpleMultiplyColumnwisePKdS0_Pd, .-_Z24SimpleMultiplyColumnwisePKdS0_Pd
	.p2align 4
	.globl	_Z4L123y
	.type	_Z4L123y, @function
_Z4L123y:
.LFB7515:
	.cfi_startproc
	movq	%rdi, %rsi
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	jmp	_Z2L3y
	.cfi_endproc
.LFE7515:
	.size	_Z4L123y, .-_Z4L123y
	.p2align 4
	.globl	_Z10SimpleInitPd
	.type	_Z10SimpleInitPd, @function
_Z10SimpleInitPd:
.LFB7516:
	.cfi_startproc
	movsd	.LC3(%rip), %xmm4
	movsd	.LC5(%rip), %xmm3
	movq	%rdi, %rax
	xorl	%ecx, %ecx
	leaq	8192(%rdi), %rsi
	movdqa	.LC1(%rip), %xmm7
	movl	$4, %edi
	movd	%edi, %xmm6
	unpcklpd	%xmm4, %xmm4
	unpcklpd	%xmm3, %xmm3
	movq	%rsi, %rdx
	pshufd	$0, %xmm6, %xmm6
.L44:
	movd	%ecx, %xmm5
	movdqa	%xmm7, %xmm2
	pshufd	$0, %xmm5, %xmm5
	.p2align 6
	.p2align 4
	.p2align 3
.L45:
	movdqa	%xmm2, %xmm0
	addq	$32, %rax
	paddd	%xmm6, %xmm2
	paddd	%xmm5, %xmm0
	cvtdq2pd	%xmm0, %xmm1
	divpd	%xmm4, %xmm1
	pshufd	$238, %xmm0, %xmm0
	cvtdq2pd	%xmm0, %xmm0
	divpd	%xmm4, %xmm0
	addpd	%xmm3, %xmm1
	movups	%xmm1, -32(%rax)
	addpd	%xmm3, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rax, %rdx
	jne	.L45
	addl	$1024, %ecx
	movq	%rsi, %rax
	addq	$8192, %rdx
	cmpl	$1048576, %ecx
	je	.L43
	addq	$8192, %rsi
	jmp	.L44
.L43:
	ret
	.cfi_endproc
.LFE7516:
	.size	_Z10SimpleInitPd, .-_Z10SimpleInitPd
	.p2align 4
	.globl	_Z8ZeroInitPd
	.type	_Z8ZeroInitPd, @function
_Z8ZeroInitPd:
.LFB7517:
	.cfi_startproc
	movl	$8388608, %edx
	xorl	%esi, %esi
	jmp	memset
	.cfi_endproc
.LFE7517:
	.size	_Z8ZeroInitPd, .-_Z8ZeroInitPd
	.p2align 4
	.globl	_Z9SimpleSumPd
	.type	_Z9SimpleSumPd, @function
_Z9SimpleSumPd:
.LFB7518:
	.cfi_startproc
	leaq	8192(%rdi), %rcx
	movq	%rdi, %rax
	leaq	8396800(%rdi), %rsi
	movq	%rcx, %rdx
	pxor	%xmm0, %xmm0
	.p2align 5
	.p2align 4
	.p2align 3
.L51:
	addsd	(%rax), %xmm0
	addq	$16, %rax
	addsd	-8(%rax), %xmm0
	cmpq	%rax, %rdx
	jne	.L51
	addq	$8192, %rdx
	movq	%rcx, %rax
	cmpq	%rsi, %rdx
	je	.L49
	addq	$8192, %rcx
	jmp	.L51
.L49:
	ret
	.cfi_endproc
.LFE7518:
	.size	_Z9SimpleSumPd, .-_Z9SimpleSumPd
	.p2align 4
	.globl	_Z10EqualArrayPKdS0_
	.type	_Z10EqualArrayPKdS0_, @function
_Z10EqualArrayPKdS0_:
.LFB7519:
	.cfi_startproc
	xorl	%eax, %eax
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L62:
	addq	$8, %rax
	cmpq	$8388608, %rax
	je	.L61
.L57:
	movsd	(%rdi,%rax), %xmm0
	ucomisd	(%rsi,%rax), %xmm0
	jp	.L58
	je	.L62
.L58:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L61:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE7519:
	.size	_Z10EqualArrayPKdS0_, .-_Z10EqualArrayPKdS0_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"%s\t%5.3f seconds, sum=%18.9f\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"Misses L1/L2/L3 %10lld %10lld %10lld\n"
	.text
	.p2align 4
	.globl	_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_
	.type	_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_, @function
_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_:
.LFB7520:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	movq	%rsi, %r15
	xorl	%esi, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r14
	movl	$512, %ecx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	movl	$32768, %edx
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	movl	$_ZL5L1tag, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	rep stosq
	movl	$_ZL5L2tag, %edi
	call	memset
	movl	$262144, %edx
	xorl	%esi, %esi
	movl	$_ZL5L3tag, %edi
	call	memset
	xorl	%esi, %esi
	movq	%rsp, %rdi
	movq	$0, _ZL8L3misses(%rip)
	movq	$0, _ZL8L2misses(%rip)
	movq	$0, _ZL8L1misses(%rip)
	call	gettimeofday
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	imulq	$1000000, (%rsp), %r12
	addq	8(%rsp), %r12
	call	*%r15
	xorl	%esi, %esi
	movq	%rsp, %rdi
	call	gettimeofday
	pxor	%xmm0, %xmm0
	leaq	8388608(%rbx), %rcx
	pxor	%xmm1, %xmm1
	imulq	$1000000, (%rsp), %rax
	addq	8(%rsp), %rax
	subq	%r12, %rax
	cvtsi2sdq	%rax, %xmm0
	movq	%rbx, %rax
.L64:
	leaq	8192(%rax), %rdx
	.p2align 5
	.p2align 4
	.p2align 3
.L65:
	addsd	(%rax), %xmm1
	addq	$16, %rax
	addsd	-8(%rax), %xmm1
	cmpq	%rax, %rdx
	jne	.L65
	cmpq	%rdx, %rcx
	je	.L66
	movq	%rdx, %rax
	jmp	.L64
.L66:
	movq	stdout(%rip), %rdi
	movq	%rbp, %rdx
	movl	$.LC7, %esi
	movl	$2, %eax
	divsd	.LC3(%rip), %xmm0
	call	fprintf
	movq	_ZL8L3misses(%rip), %r8
	xorl	%eax, %eax
	movq	_ZL8L2misses(%rip), %rcx
	movq	_ZL8L1misses(%rip), %rdx
	movq	stdout(%rip), %rdi
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	$.LC8, %esi
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
	jmp	fprintf
	.cfi_endproc
.LFE7520:
	.size	_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_, .-_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_
	.p2align 4
	.globl	_Z23SimpleMultiplyUnrolled4PKdS0_Pd
	.type	_Z23SimpleMultiplyUnrolled4PKdS0_Pd, @function
_Z23SimpleMultiplyUnrolled4PKdS0_Pd:
.LFB7527:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	8192(%rdi), %r10
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	8396800(%rdx), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	8192(%rdx), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
.L70:
	leaq	-8192(%r10), %r12
	leaq	-8192(%rbp), %r11
	movq	%r14, %rbx
	.p2align 4
	.p2align 3
.L72:
	pxor	%xmm2, %xmm2
	movq	%rbx, %r8
	movq	%r12, %rsi
	movapd	%xmm2, %xmm3
	movapd	%xmm2, %xmm4
	movapd	%xmm2, %xmm1
	.p2align 4
	.p2align 3
.L71:
	movsd	(%rsi), %xmm0
	mulsd	(%r8), %xmm0
	movq	%rsi, %rdi
	addsd	%xmm0, %xmm1
	movsd	8(%rsi), %xmm0
	mulsd	8192(%r8), %xmm0
	addsd	%xmm0, %xmm4
	movsd	16(%rsi), %xmm0
	mulsd	16384(%r8), %xmm0
	addsd	%xmm0, %xmm3
	movsd	24(%rsi), %xmm0
	mulsd	24576(%r8), %xmm0
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	call	_Z2L3y
	movq	%r8, %rdi
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	addsd	%xmm0, %xmm2
	call	_Z2L3y
	leaq	8(%rsi), %rdi
	call	_Z2L1y
	leaq	8(%rsi), %rdi
	call	_Z2L2y
	leaq	8(%rsi), %rdi
	call	_Z2L3y
	leaq	8192(%r8), %rdi
	call	_Z2L1y
	leaq	8192(%r8), %rdi
	call	_Z2L2y
	leaq	8192(%r8), %rdi
	call	_Z2L3y
	leaq	16(%rsi), %rdi
	call	_Z2L1y
	leaq	16(%rsi), %rdi
	call	_Z2L2y
	leaq	16(%rsi), %rdi
	call	_Z2L3y
	leaq	16384(%r8), %rdi
	call	_Z2L1y
	leaq	16384(%r8), %rdi
	call	_Z2L2y
	leaq	16384(%r8), %rdi
	call	_Z2L3y
	leaq	24(%rsi), %rdi
	call	_Z2L1y
	leaq	24(%rsi), %rdi
	call	_Z2L2y
	leaq	24(%rsi), %rdi
	addq	$32, %rsi
	call	_Z2L3y
	leaq	24576(%r8), %rdi
	call	_Z2L1y
	leaq	24576(%r8), %rdi
	call	_Z2L2y
	leaq	24576(%r8), %rdi
	addq	$32768, %r8
	call	_Z2L3y
	cmpq	%r10, %rsi
	jne	.L71
	addsd	%xmm4, %xmm1
	movq	%r11, %rdi
	addq	$8, %rbx
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	movsd	%xmm1, (%r11)
	call	_Z2L1y
	movq	%r11, %rdi
	call	_Z2L2y
	movq	%r11, %rdi
	addq	$8, %r11
	call	_Z2L3y
	cmpq	%rbp, %r11
	jne	.L72
	leaq	8192(%r11), %rbp
	leaq	8192(%rsi), %r10
	cmpq	%rbp, %r13
	jne	.L70
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
.LFE7527:
	.size	_Z23SimpleMultiplyUnrolled4PKdS0_Pd, .-_Z23SimpleMultiplyUnrolled4PKdS0_Pd
	.p2align 4
	.globl	_Z23SimpleMultiplyUnrolled2PKdS0_Pd
	.type	_Z23SimpleMultiplyUnrolled2PKdS0_Pd, @function
_Z23SimpleMultiplyUnrolled2PKdS0_Pd:
.LFB7528:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	8192(%rdi), %r10
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	8396800(%rdx), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	8192(%rdx), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
.L78:
	leaq	-8192(%r10), %r12
	leaq	-8192(%rbp), %r11
	movq	%r14, %rbx
	.p2align 4
	.p2align 3
.L80:
	pxor	%xmm2, %xmm2
	movq	%rbx, %r8
	movq	%r12, %rsi
	movapd	%xmm2, %xmm1
	.p2align 4
	.p2align 3
.L79:
	movsd	(%rsi), %xmm0
	mulsd	(%r8), %xmm0
	movq	%rsi, %rdi
	addsd	%xmm0, %xmm1
	movsd	8(%rsi), %xmm0
	mulsd	8192(%r8), %xmm0
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	call	_Z2L3y
	movq	%r8, %rdi
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	addsd	%xmm0, %xmm2
	call	_Z2L3y
	leaq	8(%rsi), %rdi
	call	_Z2L1y
	leaq	8(%rsi), %rdi
	call	_Z2L2y
	leaq	8(%rsi), %rdi
	addq	$16, %rsi
	call	_Z2L3y
	leaq	8192(%r8), %rdi
	call	_Z2L1y
	leaq	8192(%r8), %rdi
	call	_Z2L2y
	leaq	8192(%r8), %rdi
	addq	$16384, %r8
	call	_Z2L3y
	cmpq	%r10, %rsi
	jne	.L79
	addsd	%xmm2, %xmm1
	movq	%r11, %rdi
	addq	$8, %rbx
	movsd	%xmm1, (%r11)
	call	_Z2L1y
	movq	%r11, %rdi
	call	_Z2L2y
	movq	%r11, %rdi
	addq	$8, %r11
	call	_Z2L3y
	cmpq	%r11, %rbp
	jne	.L80
	addq	$8192, %rbp
	leaq	8192(%rsi), %r10
	cmpq	%rbp, %r13
	jne	.L78
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
.LFE7528:
	.size	_Z23SimpleMultiplyUnrolled2PKdS0_Pd, .-_Z23SimpleMultiplyUnrolled2PKdS0_Pd
	.p2align 4
	.globl	_Z23SimpleMultiplyUnrolled1PKdS0_Pd
	.type	_Z23SimpleMultiplyUnrolled1PKdS0_Pd, @function
_Z23SimpleMultiplyUnrolled1PKdS0_Pd:
.LFB7529:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	8192(%rdi), %r9
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	8396800(%rdx), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	8192(%rdx), %rbx
.L86:
	leaq	-8192(%r9), %rbp
	leaq	-8192(%rbx), %r10
	movq	%r13, %r11
	.p2align 4
	.p2align 3
.L88:
	movq	%r11, %r8
	movq	%rbp, %rsi
	pxor	%xmm1, %xmm1
	.p2align 4
	.p2align 3
.L87:
	movq	%rsi, %rdi
	movsd	(%rsi), %xmm0
	mulsd	(%r8), %xmm0
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	addq	$8, %rsi
	call	_Z2L3y
	movq	%r8, %rdi
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	addsd	%xmm0, %xmm1
	addq	$8192, %r8
	call	_Z2L3y
	cmpq	%r9, %rsi
	jne	.L87
	movq	%r10, %rdi
	movsd	%xmm1, (%r10)
	addq	$8, %r11
	call	_Z2L1y
	movq	%r10, %rdi
	call	_Z2L2y
	movq	%r10, %rdi
	addq	$8, %r10
	call	_Z2L3y
	cmpq	%r10, %rbx
	jne	.L88
	addq	$8192, %rbx
	leaq	8192(%rsi), %r9
	cmpq	%r12, %rbx
	jne	.L86
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7529:
	.size	_Z23SimpleMultiplyUnrolled1PKdS0_Pd, .-_Z23SimpleMultiplyUnrolled1PKdS0_Pd
	.p2align 4
	.globl	_Z24PointerMultiplyUnrolled4PKdS0_Pd
	.type	_Z24PointerMultiplyUnrolled4PKdS0_Pd, @function
_Z24PointerMultiplyUnrolled4PKdS0_Pd:
.LFB7546:
	.cfi_startproc
	jmp	_Z23SimpleMultiplyUnrolled4PKdS0_Pd
	.cfi_endproc
.LFE7546:
	.size	_Z24PointerMultiplyUnrolled4PKdS0_Pd, .-_Z24PointerMultiplyUnrolled4PKdS0_Pd
	.p2align 4
	.globl	_Z13BlockMultiplyPKdS0_Pd
	.type	_Z13BlockMultiplyPKdS0_Pd, @function
_Z13BlockMultiplyPKdS0_Pd:
.LFB7531:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r11d, %r11d
	movq	%rdx, %r8
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	73728(%rdi), %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
.L95:
	movq	%r8, 16(%rsp)
	leaq	(%r8,%r12,8), %rbp
	movl	%r11d, 4(%rsp)
	xorl	%r11d, %r11d
	movq	%r12, 8(%rsp)
	leaq	-65536(%rbx), %r12
.L102:
	movq	%r11, %r15
	movq	%rbp, 24(%rsp)
	leal	0(,%r11,8), %r9d
	leal	8(,%r11,8), %r10d
	movq	%r11, 32(%rsp)
	salq	$6, %r15
	movq	%rbp, %r8
	addq	%r14, %r15
	.p2align 4
	.p2align 3
.L100:
	movq	%r12, %rbp
	movq	%r8, %rsi
	.p2align 4
	.p2align 3
.L97:
	leaq	-8192(%rbp), %r11
	movq	%r15, %r13
	pxor	%xmm1, %xmm1
	.p2align 4
	.p2align 3
.L96:
	movq	%r11, %rdi
	movsd	(%r11), %xmm0
	mulsd	0(%r13), %xmm0
	call	_Z2L1y
	movq	%r11, %rdi
	call	_Z2L2y
	movq	%r11, %rdi
	addq	$8, %r11
	call	_Z2L3y
	movq	%r13, %rdi
	call	_Z2L1y
	movq	%r13, %rdi
	call	_Z2L2y
	movq	%r13, %rdi
	addsd	%xmm0, %xmm1
	addq	$8192, %r13
	call	_Z2L3y
	cmpq	%rbp, %r11
	jne	.L96
	addsd	(%rsi), %xmm1
	movq	%rsi, %rdi
	leaq	8192(%r11), %rbp
	movsd	%xmm1, (%rsi)
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	addq	$8192, %rsi
	call	_Z2L3y
	cmpq	%rbp, %rbx
	jne	.L97
	addl	$1, %r9d
	addq	$8, %r15
	addq	$8, %r8
	cmpl	%r9d, %r10d
	jne	.L100
	movq	%r11, %rsi
	movq	32(%rsp), %r11
	movq	24(%rsp), %rbp
	addq	$1, %r11
	addq	$64, %rbp
	cmpq	$128, %r11
	jne	.L102
	movl	4(%rsp), %r11d
	movq	8(%rsp), %r12
	leaq	73728(%rsi), %rbx
	movq	16(%rsp), %r8
	addl	$8, %r11d
	addq	$8192, %r12
	cmpl	$1024, %r11d
	jne	.L95
	addq	$40, %rsp
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
	.cfi_endproc
.LFE7531:
	.size	_Z13BlockMultiplyPKdS0_Pd, .-_Z13BlockMultiplyPKdS0_Pd
	.p2align 4
	.globl	_Z25BlockMultiplyPtrUnrolled4PKdS0_Pd
	.type	_Z25BlockMultiplyPtrUnrolled4PKdS0_Pd, @function
_Z25BlockMultiplyPtrUnrolled4PKdS0_Pd:
.LFB7532:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r9d, %r9d
	movq	%rsi, %r15
	xorl	%r10d, %r10d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	64(%rsi), %r11
	leaq	73728(%rdi), %r14
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
	movq	%rdx, %rbx
	subq	$64, %rsp
	.cfi_def_cfa_offset 120
.L107:
	movl	%r10d, 20(%rsp)
	movq	%r11, %r12
	leaq	(%rbx,%r9,8), %rbp
	xorl	%r8d, %r8d
	leaq	-65536(%r14), %rax
	movq	%r9, 24(%rsp)
	movq	%rax, 8(%rsp)
.L114:
	leaq	(%r15,%r8,8), %r9
	movq	%r8, 32(%rsp)
	movq	8(%rsp), %r10
	movq	%r11, %r13
	movq	%rbp, 40(%rsp)
	movq	%r9, (%rsp)
	movq	%r15, 48(%rsp)
	movq	%rbx, 56(%rsp)
	movq	%rbp, %rbx
	.p2align 4
	.p2align 3
.L112:
	movq	(%rsp), %r9
	movq	%rbx, %rbp
	leaq	-8192(%r10), %r15
	.p2align 4
	.p2align 3
.L109:
	pxor	%xmm2, %xmm2
	movq	%r9, %r8
	movq	%r15, %r11
	movapd	%xmm2, %xmm3
	movapd	%xmm2, %xmm4
	movapd	%xmm2, %xmm1
	.p2align 4
	.p2align 3
.L108:
	movsd	(%r11), %xmm0
	mulsd	(%r8), %xmm0
	movq	%r11, %rdi
	addsd	%xmm0, %xmm1
	movsd	8(%r11), %xmm0
	mulsd	8192(%r8), %xmm0
	addsd	%xmm0, %xmm4
	movsd	16(%r11), %xmm0
	mulsd	16384(%r8), %xmm0
	addsd	%xmm0, %xmm3
	movsd	24(%r11), %xmm0
	mulsd	24576(%r8), %xmm0
	call	_Z2L1y
	movq	%r11, %rdi
	call	_Z2L2y
	movq	%r11, %rdi
	call	_Z2L3y
	movq	%r8, %rdi
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	addsd	%xmm0, %xmm2
	call	_Z2L3y
	leaq	8(%r11), %rdi
	call	_Z2L1y
	leaq	8(%r11), %rdi
	call	_Z2L2y
	leaq	8(%r11), %rdi
	call	_Z2L3y
	leaq	8192(%r8), %rdi
	call	_Z2L1y
	leaq	8192(%r8), %rdi
	call	_Z2L2y
	leaq	8192(%r8), %rdi
	call	_Z2L3y
	leaq	16(%r11), %rdi
	call	_Z2L1y
	leaq	16(%r11), %rdi
	call	_Z2L2y
	leaq	16(%r11), %rdi
	call	_Z2L3y
	leaq	16384(%r8), %rdi
	call	_Z2L1y
	leaq	16384(%r8), %rdi
	call	_Z2L2y
	leaq	16384(%r8), %rdi
	call	_Z2L3y
	leaq	24(%r11), %rdi
	call	_Z2L1y
	leaq	24(%r11), %rdi
	call	_Z2L2y
	leaq	24(%r11), %rdi
	addq	$32, %r11
	call	_Z2L3y
	leaq	24576(%r8), %rdi
	call	_Z2L1y
	leaq	24576(%r8), %rdi
	call	_Z2L2y
	leaq	24576(%r8), %rdi
	addq	$32768, %r8
	call	_Z2L3y
	cmpq	%r10, %r11
	jne	.L108
	addsd	%xmm4, %xmm1
	movq	%rbp, %rdi
	addq	$8, %r9
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	addsd	0(%rbp), %xmm1
	movsd	%xmm1, 0(%rbp)
	call	_Z2L1y
	movq	%rbp, %rdi
	call	_Z2L2y
	movq	%rbp, %rdi
	addq	$8, %rbp
	call	_Z2L3y
	cmpq	%r9, %r12
	jne	.L109
	leaq	8192(%r11), %r10
	addq	$8192, %rbx
	cmpq	%r10, %r14
	jne	.L112
	movq	32(%rsp), %r8
	movq	40(%rsp), %rbp
	movq	%r11, %rsi
	addq	$64, %r12
	movq	48(%rsp), %r15
	movq	56(%rsp), %rbx
	movq	%r13, %r11
	addq	$8, %r8
	addq	$64, %rbp
	cmpq	$1024, %r8
	jne	.L114
	movl	20(%rsp), %r10d
	movq	24(%rsp), %r9
	leaq	73728(%rsi), %r14
	addl	$8, %r10d
	addq	$8192, %r9
	cmpl	$1024, %r10d
	jne	.L107
	addq	$64, %rsp
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
	.cfi_endproc
.LFE7532:
	.size	_Z25BlockMultiplyPtrUnrolled4PKdS0_Pd, .-_Z25BlockMultiplyPtrUnrolled4PKdS0_Pd
	.p2align 4
	.globl	_Z5RemapPKdPd
	.type	_Z5RemapPKdPd, @function
_Z5RemapPKdPd:
.LFB7533:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r15d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	256(%rdi), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	.p2align 4
	.p2align 3
.L119:
	leaq	-256(%r13), %rsi
	movq	%r14, %r8
	.p2align 4
	.p2align 3
.L120:
	movsd	(%rsi), %xmm0
	movq	%r8, %rdi
	leaq	16(%r8), %rbp
	movsd	%xmm0, (%r8)
	movsd	8(%rsi), %xmm0
	movsd	%xmm0, 8(%r8)
	movsd	16(%rsi), %xmm0
	movsd	%xmm0, 16(%r8)
	movsd	24(%rsi), %xmm0
	movsd	%xmm0, 24(%r8)
	call	_Z2L1y
	leaq	8(%r8), %rdi
	call	_Z2L1y
	movq	%rbp, %rdi
	call	_Z2L1y
	leaq	24(%r8), %rdi
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L1y
	leaq	8(%rsi), %rdi
	call	_Z2L1y
	leaq	16(%rsi), %rdi
	call	_Z2L1y
	leaq	24(%rsi), %rdi
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	leaq	8(%r8), %rdi
	call	_Z2L2y
	movq	%rbp, %rdi
	call	_Z2L2y
	leaq	24(%r8), %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	call	_Z2L2y
	leaq	8(%rsi), %rdi
	call	_Z2L2y
	leaq	16(%rsi), %rdi
	call	_Z2L2y
	leaq	24(%rsi), %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	call	_Z2L3y
	leaq	8(%r8), %rdi
	call	_Z2L3y
	movq	%rbp, %rdi
	call	_Z2L3y
	leaq	24(%r8), %rdi
	addq	$32, %r8
	call	_Z2L3y
	movq	%rsi, %rdi
	call	_Z2L3y
	leaq	8(%rsi), %rdi
	call	_Z2L3y
	leaq	16(%rsi), %rdi
	call	_Z2L3y
	leaq	24(%rsi), %rdi
	addq	$32, %rsi
	call	_Z2L3y
	cmpq	%rsi, %r13
	jne	.L120
	addl	$32, %r15d
	addq	$256, %r14
	addq	$8192, %r13
	cmpl	$1024, %r15d
	jne	.L119
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
	.cfi_endproc
.LFE7533:
	.size	_Z5RemapPKdPd, .-_Z5RemapPKdPd
	.p2align 4
	.globl	_Z18BlockMultiplyRemapPKdS0_Pd
	.type	_Z18BlockMultiplyRemapPKdS0_Pd, @function
_Z18BlockMultiplyRemapPKdS0_Pd:
.LFB7540:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r9
	movq	%rdx, %r11
	leaq	8192(%rdi), %r10
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$96, %rsp
	.cfi_def_cfa_offset 152
	movq	_ZL2aa(%rip), %rbp
	movq	%rbp, %r13
.L125:
	leaq	-8192(%r10), %rbx
	movq	%r13, %r14
.L126:
	movq	%r14, %rsi
	movq	%rbx, %rdi
	addq	$256, %rbx
	addq	$8192, %r14
	call	_Z5RemapPKdPd
	cmpq	%rbx, %r10
	jne	.L126
	addl	$32768, %r12d
	addq	$262144, %r13
	addq	$262144, %r10
	cmpl	$1048576, %r12d
	jne	.L125
	movq	_ZL2bb(%rip), %r15
	addq	$8192, %r9
	xorl	%ebx, %ebx
	movq	%r15, %r12
.L128:
	leaq	-8192(%r9), %r10
	movq	%r12, %r13
.L129:
	movq	%r13, %rsi
	movq	%r10, %rdi
	addq	$256, %r10
	addq	$8192, %r13
	call	_Z5RemapPKdPd
	cmpq	%r10, %r9
	jne	.L129
	addl	$32768, %ebx
	addq	$262144, %r12
	addq	$262144, %r9
	cmpl	$1048576, %ebx
	jne	.L128
	movq	_ZL2cc(%rip), %r10
	movq	%r11, 16(%rsp)
	leaq	256(%rbp), %rbx
	xorl	%r8d, %r8d
	leaq	256(%r10), %r9
	movq	%r10, %rbp
.L130:
	movq	%r8, %r12
	movq	%r9, 24(%rsp)
	xorl	%r10d, %r10d
	movq	%r9, %rsi
	salq	$15, %r12
	movq	%r8, 32(%rsp)
	leaq	32768(%r12), %rax
	movq	%rax, 8(%rsp)
.L136:
	movq	%r10, %rdx
	movq	%r12, 40(%rsp)
	movq	%rbx, %r11
	movq	%r10, 56(%rsp)
	salq	$10, %rdx
	movq	%rbp, 48(%rsp)
	movq	%rdx, %r8
	movq	%rsi, %rbp
	movq	%r12, %rsi
.L135:
	movq	%r15, 64(%rsp)
	movq	%r11, %r10
	movq	%rbp, %r12
	leaq	(%r15,%r8,8), %r13
	movq	%rbx, 72(%rsp)
	xorl	%r9d, %r9d
	movq	%r8, 80(%rsp)
	movq	%r11, 88(%rsp)
	movq	%rbp, %r11
	movq	%rsi, %rbp
.L131:
	movl	%r9d, 4(%rsp)
	leaq	-256(%r11), %r15
	movq	%r11, %r14
	movq	%r13, %r8
	leaq	-256(%r10), %r11
	.p2align 4
	.p2align 3
.L133:
	pxor	%xmm2, %xmm2
	movq	%r8, %rbx
	movq	%r11, %r9
	movapd	%xmm2, %xmm3
	movapd	%xmm2, %xmm4
	movapd	%xmm2, %xmm1
	.p2align 4
	.p2align 3
.L132:
	movsd	(%r9), %xmm0
	mulsd	(%rbx), %xmm0
	movq	%r9, %rdi
	addsd	%xmm0, %xmm1
	movsd	8(%r9), %xmm0
	mulsd	256(%rbx), %xmm0
	addsd	%xmm0, %xmm4
	movsd	16(%r9), %xmm0
	mulsd	512(%rbx), %xmm0
	addsd	%xmm0, %xmm3
	movsd	24(%r9), %xmm0
	mulsd	768(%rbx), %xmm0
	call	_Z2L1y
	movq	%r9, %rdi
	call	_Z2L2y
	movq	%r9, %rdi
	call	_Z2L3y
	movq	%rbx, %rdi
	call	_Z2L1y
	movq	%rbx, %rdi
	call	_Z2L2y
	movq	%rbx, %rdi
	addsd	%xmm0, %xmm2
	call	_Z2L3y
	leaq	8(%r9), %rdi
	call	_Z2L1y
	leaq	8(%r9), %rdi
	call	_Z2L2y
	leaq	8(%r9), %rdi
	call	_Z2L3y
	leaq	256(%rbx), %rdi
	call	_Z2L1y
	leaq	256(%rbx), %rdi
	call	_Z2L2y
	leaq	256(%rbx), %rdi
	call	_Z2L3y
	leaq	16(%r9), %rdi
	call	_Z2L1y
	leaq	16(%r9), %rdi
	call	_Z2L2y
	leaq	16(%r9), %rdi
	call	_Z2L3y
	leaq	512(%rbx), %rdi
	call	_Z2L1y
	leaq	512(%rbx), %rdi
	call	_Z2L2y
	leaq	512(%rbx), %rdi
	call	_Z2L3y
	leaq	24(%r9), %rdi
	call	_Z2L1y
	leaq	24(%r9), %rdi
	call	_Z2L2y
	leaq	24(%r9), %rdi
	addq	$32, %r9
	call	_Z2L3y
	leaq	768(%rbx), %rdi
	call	_Z2L1y
	leaq	768(%rbx), %rdi
	call	_Z2L2y
	leaq	768(%rbx), %rdi
	addq	$1024, %rbx
	call	_Z2L3y
	cmpq	%r10, %r9
	jne	.L132
	addsd	%xmm4, %xmm1
	movq	%r15, %rdi
	addq	$8, %r8
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	addsd	(%r15), %xmm1
	movsd	%xmm1, (%r15)
	call	_Z2L1y
	movq	%r15, %rdi
	call	_Z2L2y
	movq	%r15, %rdi
	addq	$8, %r15
	call	_Z2L3y
	cmpq	%r14, %r15
	jne	.L133
	leaq	256(%r9), %r10
	movl	4(%rsp), %r9d
	leaq	256(%r15), %r11
	addl	$32, %r9d
	cmpl	$1024, %r9d
	jne	.L131
	movq	80(%rsp), %r8
	movq	88(%rsp), %r11
	leaq	1024(%rbp), %rsi
	movq	%r12, %rbp
	movq	64(%rsp), %r15
	movq	72(%rsp), %rbx
	addq	$32768, %r8
	addq	$8192, %r11
	cmpq	%rsi, 8(%rsp)
	jne	.L135
	movq	56(%rsp), %r10
	leaq	8192(%rbp), %rsi
	movq	40(%rsp), %r12
	movq	48(%rsp), %rbp
	addq	$1, %r10
	cmpq	$32, %r10
	jne	.L136
	movq	32(%rsp), %r8
	movq	24(%rsp), %r9
	addq	$262144, %rbx
	addq	$1, %r8
	addq	$262144, %r9
	cmpq	$32, %r8
	jne	.L130
	movq	16(%rsp), %r11
	leaq	8192(%rbp), %r10
	xorl	%ebx, %ebx
.L137:
	leaq	-8192(%r10), %r9
	movq	%r11, %rbp
.L138:
	movq	%rbp, %rsi
	movq	%r9, %rdi
	addq	$256, %r9
	addq	$8192, %rbp
	call	_Z5RemapPKdPd
	cmpq	%r10, %r9
	jne	.L138
	addl	$32768, %ebx
	addq	$262144, %r11
	leaq	262144(%r9), %r10
	cmpl	$1048576, %ebx
	jne	.L137
	addq	$96, %rsp
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
	.cfi_endproc
.LFE7540:
	.size	_Z18BlockMultiplyRemapPKdS0_Pd, .-_Z18BlockMultiplyRemapPKdS0_Pd
	.p2align 4
	.globl	_Z8RemapAllPKdPd
	.type	_Z8RemapAllPKdPd, @function
_Z8RemapAllPKdPd:
.LFB7534:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	8192(%rdi), %r11
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	.p2align 4
	.p2align 3
.L151:
	leaq	-8192(%r11), %r9
	movq	%rbx, %r10
	.p2align 4
	.p2align 3
.L152:
	movq	%r10, %rsi
	movq	%r9, %rdi
	addq	$256, %r9
	addq	$8192, %r10
	call	_Z5RemapPKdPd
	cmpq	%r11, %r9
	jne	.L152
	addl	$32768, %ebp
	addq	$262144, %rbx
	leaq	262144(%r9), %r11
	cmpl	$1048576, %ebp
	jne	.L151
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7534:
	.size	_Z8RemapAllPKdPd, .-_Z8RemapAllPKdPd
	.p2align 4
	.globl	_Z7UnRemapPKdPd
	.type	_Z7UnRemapPKdPd, @function
_Z7UnRemapPKdPd:
.LFB7535:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%r15d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	256(%rsi), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	.p2align 4
	.p2align 3
.L157:
	leaq	-256(%r13), %rsi
	movq	%r14, %r8
	.p2align 4
	.p2align 3
.L158:
	movsd	(%r8), %xmm0
	movq	%rsi, %rdi
	leaq	16(%rsi), %rbp
	movsd	%xmm0, (%rsi)
	movsd	8(%r8), %xmm0
	movsd	%xmm0, 8(%rsi)
	movsd	16(%r8), %xmm0
	movsd	%xmm0, 16(%rsi)
	movsd	24(%r8), %xmm0
	movsd	%xmm0, 24(%rsi)
	call	_Z2L1y
	leaq	8(%rsi), %rdi
	call	_Z2L1y
	movq	%rbp, %rdi
	call	_Z2L1y
	leaq	24(%rsi), %rdi
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L1y
	leaq	8(%r8), %rdi
	call	_Z2L1y
	leaq	16(%r8), %rdi
	call	_Z2L1y
	leaq	24(%r8), %rdi
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	leaq	8(%rsi), %rdi
	call	_Z2L2y
	movq	%rbp, %rdi
	call	_Z2L2y
	leaq	24(%rsi), %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	call	_Z2L2y
	leaq	8(%r8), %rdi
	call	_Z2L2y
	leaq	16(%r8), %rdi
	call	_Z2L2y
	leaq	24(%r8), %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	call	_Z2L3y
	leaq	8(%rsi), %rdi
	call	_Z2L3y
	movq	%rbp, %rdi
	call	_Z2L3y
	leaq	24(%rsi), %rdi
	addq	$32, %rsi
	call	_Z2L3y
	movq	%r8, %rdi
	call	_Z2L3y
	leaq	8(%r8), %rdi
	call	_Z2L3y
	leaq	16(%r8), %rdi
	call	_Z2L3y
	leaq	24(%r8), %rdi
	addq	$32, %r8
	call	_Z2L3y
	cmpq	%rsi, %r13
	jne	.L158
	addl	$32, %r15d
	addq	$256, %r14
	addq	$8192, %r13
	cmpl	$1024, %r15d
	jne	.L157
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
	.cfi_endproc
.LFE7535:
	.size	_Z7UnRemapPKdPd, .-_Z7UnRemapPKdPd
	.p2align 4
	.globl	_Z10UnRemapAllPKdPd
	.type	_Z10UnRemapAllPKdPd, @function
_Z10UnRemapAllPKdPd:
.LFB7536:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	262144(%rdi), %r11
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx
	.p2align 4
	.p2align 3
.L163:
	leaq	-262144(%r11), %r9
	movq	%rbx, %r10
	.p2align 4
	.p2align 3
.L164:
	movq	%r10, %rsi
	movq	%r9, %rdi
	addq	$8192, %r9
	addq	$256, %r10
	call	_Z7UnRemapPKdPd
	cmpq	%r11, %r9
	jne	.L164
	addl	$32768, %ebp
	addq	$262144, %rbx
	leaq	262144(%r9), %r11
	cmpl	$1048576, %ebp
	jne	.L163
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7536:
	.size	_Z10UnRemapAllPKdPd, .-_Z10UnRemapAllPKdPd
	.p2align 4
	.globl	_Z12TransposeAllPKdPd
	.type	_Z12TransposeAllPKdPd, @function
_Z12TransposeAllPKdPd:
.LFB7537:
	.cfi_startproc
	movq	%rdi, %r11
	leaq	8388608(%rsi), %r9
	xorl	%r10d, %r10d
.L169:
	movq	%r10, %r8
	leaq	-8388608(%r9), %rsi
	salq	$13, %r8
	addq	%r11, %r8
	.p2align 4
	.p2align 3
.L170:
	movsd	(%r8), %xmm0
	movq	%r8, %rdi
	movsd	%xmm0, (%rsi)
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	addq	$8, %r8
	call	_Z2L3y
	movq	%rsi, %rdi
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	addq	$8192, %rsi
	call	_Z2L3y
	cmpq	%r9, %rsi
	jne	.L170
	addq	$1, %r10
	leaq	8(%rsi), %r9
	cmpq	$1024, %r10
	jne	.L169
	ret
	.cfi_endproc
.LFE7537:
	.size	_Z12TransposeAllPKdPd, .-_Z12TransposeAllPKdPd
	.p2align 4
	.globl	_Z23SimpleMultiplyTransposePKdS0_Pd
	.type	_Z23SimpleMultiplyTransposePKdS0_Pd, @function
_Z23SimpleMultiplyTransposePKdS0_Pd:
.LFB7541:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	8396800(%rdx), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	8192(%rdx), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	_ZL2bb(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	movq	%rbp, %rsi
	call	_Z12TransposeAllPKdPd
	leaq	8192(%rbx), %r9
.L174:
	leaq	-8192(%r9), %rbx
	leaq	-8192(%r12), %r10
	movq	%rbp, %r11
	.p2align 4
	.p2align 3
.L176:
	movq	%r11, %r8
	movq	%rbx, %rsi
	pxor	%xmm1, %xmm1
	.p2align 4
	.p2align 3
.L175:
	movq	%rsi, %rdi
	movsd	(%rsi), %xmm0
	mulsd	(%r8), %xmm0
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	addq	$8, %rsi
	call	_Z2L3y
	movq	%r8, %rdi
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	addsd	%xmm0, %xmm1
	addq	$8, %r8
	call	_Z2L3y
	cmpq	%r9, %rsi
	jne	.L175
	movq	%r10, %rdi
	movsd	%xmm1, (%r10)
	addq	$8192, %r11
	call	_Z2L1y
	movq	%r10, %rdi
	call	_Z2L2y
	movq	%r10, %rdi
	addq	$8, %r10
	call	_Z2L3y
	cmpq	%r12, %r10
	jne	.L176
	leaq	8192(%r10), %r12
	leaq	8192(%rsi), %r9
	cmpq	%r13, %r12
	jne	.L174
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7541:
	.size	_Z23SimpleMultiplyTransposePKdS0_Pd, .-_Z23SimpleMultiplyTransposePKdS0_Pd
	.p2align 4
	.globl	_Z14BlockTransposePKdPd
	.type	_Z14BlockTransposePKdPd, @function
_Z14BlockTransposePKdPd:
.LFB7538:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %r11
	leaq	65536(%rsi), %r10
	xorl	%ebx, %ebx
	.p2align 4
	.p2align 3
.L182:
	movq	%rbx, %r8
	leaq	-65536(%r10), %rsi
	salq	$13, %r8
	addq	%r11, %r8
.L183:
	movsd	(%r8), %xmm0
	movq	%r8, %rdi
	movsd	%xmm0, (%rsi)
	movsd	8(%r8), %xmm0
	movsd	%xmm0, 8192(%rsi)
	movsd	16(%r8), %xmm0
	movsd	%xmm0, 16384(%rsi)
	movsd	24(%r8), %xmm0
	movsd	%xmm0, 24576(%rsi)
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	call	_Z2L3y
	movq	%rsi, %rdi
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	call	_Z2L3y
	leaq	8(%r8), %rdi
	call	_Z2L1y
	leaq	8(%r8), %rdi
	call	_Z2L2y
	leaq	8(%r8), %rdi
	call	_Z2L3y
	leaq	8192(%rsi), %rdi
	call	_Z2L1y
	leaq	8192(%rsi), %rdi
	call	_Z2L2y
	leaq	8192(%rsi), %rdi
	call	_Z2L3y
	leaq	16(%r8), %rdi
	call	_Z2L1y
	leaq	16(%r8), %rdi
	call	_Z2L2y
	leaq	16(%r8), %rdi
	call	_Z2L3y
	leaq	16384(%rsi), %rdi
	call	_Z2L1y
	leaq	16384(%rsi), %rdi
	call	_Z2L2y
	leaq	16384(%rsi), %rdi
	call	_Z2L3y
	leaq	24(%r8), %rdi
	call	_Z2L1y
	leaq	24(%r8), %rdi
	call	_Z2L2y
	leaq	24(%r8), %rdi
	addq	$32, %r8
	call	_Z2L3y
	leaq	24576(%rsi), %rdi
	call	_Z2L1y
	leaq	24576(%rsi), %rdi
	call	_Z2L2y
	leaq	24576(%rsi), %rdi
	addq	$32768, %rsi
	call	_Z2L3y
	cmpq	%r10, %rsi
	jne	.L183
	addq	$1, %rbx
	leaq	8(%rsi), %r10
	cmpq	$8, %rbx
	jne	.L182
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7538:
	.size	_Z14BlockTransposePKdPd, .-_Z14BlockTransposePKdPd
	.p2align 4
	.globl	_Z27SimpleMultiplyTransposeFastPKdS0_Pd
	.type	_Z27SimpleMultiplyTransposeFastPKdS0_Pd, @function
_Z27SimpleMultiplyTransposeFastPKdS0_Pd:
.LFB7542:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	8192(%rsi), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	_ZL2bb(%rip), %rbx
	movq	%rdi, (%rsp)
	movq	%rbx, %r15
.L188:
	leaq	-8192(%rbp), %r9
	movq	%r15, %r13
	.p2align 4
	.p2align 3
.L189:
	movq	%r13, %rsi
	movq	%r9, %rdi
	addq	$64, %r9
	addq	$65536, %r13
	call	_Z14BlockTransposePKdPd
	cmpq	%rbp, %r9
	jne	.L189
	addl	$8, %r12d
	addq	$64, %r15
	leaq	65536(%r9), %rbp
	cmpl	$1024, %r12d
	jne	.L188
	movq	(%rsp), %r10
	leaq	8192(%r14), %r12
	addq	$8396800, %r14
	addq	$8192, %r10
.L190:
	leaq	-8192(%r10), %r13
	leaq	-8192(%r12), %r11
	movq	%rbx, %rbp
	.p2align 4
	.p2align 3
.L192:
	pxor	%xmm2, %xmm2
	movq	%rbp, %r8
	movq	%r13, %rsi
	movapd	%xmm2, %xmm3
	movapd	%xmm2, %xmm4
	movapd	%xmm2, %xmm1
	.p2align 4
	.p2align 3
.L191:
	movsd	(%rsi), %xmm0
	mulsd	(%r8), %xmm0
	movq	%rsi, %rdi
	addsd	%xmm0, %xmm1
	movsd	8(%rsi), %xmm0
	mulsd	8(%r8), %xmm0
	addsd	%xmm0, %xmm4
	movsd	16(%rsi), %xmm0
	mulsd	16(%r8), %xmm0
	addsd	%xmm0, %xmm3
	movsd	24(%rsi), %xmm0
	mulsd	24(%r8), %xmm0
	call	_Z2L1y
	movq	%rsi, %rdi
	call	_Z2L2y
	movq	%rsi, %rdi
	call	_Z2L3y
	movq	%r8, %rdi
	call	_Z2L1y
	movq	%r8, %rdi
	call	_Z2L2y
	movq	%r8, %rdi
	addsd	%xmm0, %xmm2
	call	_Z2L3y
	leaq	8(%rsi), %rdi
	call	_Z2L1y
	leaq	8(%rsi), %rdi
	call	_Z2L2y
	leaq	8(%rsi), %rdi
	call	_Z2L3y
	leaq	8(%r8), %rdi
	call	_Z2L1y
	leaq	8(%r8), %rdi
	call	_Z2L2y
	leaq	8(%r8), %rdi
	call	_Z2L3y
	leaq	16(%rsi), %rdi
	call	_Z2L1y
	leaq	16(%rsi), %rdi
	call	_Z2L2y
	leaq	16(%rsi), %rdi
	call	_Z2L3y
	leaq	16(%r8), %rdi
	call	_Z2L1y
	leaq	16(%r8), %rdi
	call	_Z2L2y
	leaq	16(%r8), %rdi
	call	_Z2L3y
	leaq	24(%rsi), %rdi
	call	_Z2L1y
	leaq	24(%rsi), %rdi
	call	_Z2L2y
	leaq	24(%rsi), %rdi
	addq	$32, %rsi
	call	_Z2L3y
	leaq	24(%r8), %rdi
	call	_Z2L1y
	leaq	24(%r8), %rdi
	call	_Z2L2y
	leaq	24(%r8), %rdi
	addq	$32, %r8
	call	_Z2L3y
	cmpq	%r10, %rsi
	jne	.L191
	addsd	%xmm4, %xmm1
	movq	%r11, %rdi
	addq	$8192, %rbp
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	movsd	%xmm1, (%r11)
	call	_Z2L1y
	movq	%r11, %rdi
	call	_Z2L2y
	movq	%r11, %rdi
	addq	$8, %r11
	call	_Z2L3y
	cmpq	%r12, %r11
	jne	.L192
	leaq	8192(%r11), %r12
	leaq	8192(%rsi), %r10
	cmpq	%r14, %r12
	jne	.L190
	addq	$8, %rsp
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
	.cfi_endproc
.LFE7542:
	.size	_Z27SimpleMultiplyTransposeFastPKdS0_Pd, .-_Z27SimpleMultiplyTransposeFastPKdS0_Pd
	.p2align 4
	.globl	_Z17BlockTransposeAllPKdPd
	.type	_Z17BlockTransposeAllPKdPd, @function
_Z17BlockTransposeAllPKdPd:
.LFB7539:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	8192(%rdi), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
.L200:
	leaq	-8192(%rbp), %r9
	movq	%r12, %rbx
	.p2align 4
	.p2align 3
.L201:
	movq	%rbx, %rsi
	movq	%r9, %rdi
	addq	$64, %r9
	addq	$65536, %rbx
	call	_Z14BlockTransposePKdPd
	cmpq	%rbp, %r9
	jne	.L201
	addl	$8, %r13d
	addq	$64, %r12
	leaq	65536(%r9), %rbp
	cmpl	$1024, %r13d
	jne	.L200
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7539:
	.size	_Z17BlockTransposeAllPKdPd, .-_Z17BlockTransposeAllPKdPd
	.p2align 4
	.globl	_Z9PageAlignPd
	.type	_Z9PageAlignPd, @function
_Z9PageAlignPd:
.LFB7543:
	.cfi_startproc
	leaq	4088(%rdi), %rax
	andq	$-4096, %rax
	ret
	.cfi_endproc
.LFE7543:
	.size	_Z9PageAlignPd, .-_Z9PageAlignPd
	.section	.rodata.str1.1
.LC10:
	.string	"Equal"
.LC11:
	.string	"Not equal"
.LC12:
	.string	"alloc"
.LC13:
	.string	"init"
.LC14:
	.string	"remap"
.LC15:
	.string	"a  sum=%18.9f\n"
.LC16:
	.string	"aa sum=%18.9f\n"
.LC17:
	.string	"c  sum=%18.9f\n"
.LC18:
	.string	"%s\n"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Remap Misses L1/L2/L3 %10lld %10lld %10lld\n"
	.section	.rodata.str1.1
.LC20:
	.string	"trans"
.LC21:
	.string	"b  sum=%18.9f\n"
.LC22:
	.string	"bb sum=%18.9f\n"
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"Transpose Misses L1/L2/L3 %10lld %10lld %10lld\n"
	.section	.rodata.str1.1
.LC24:
	.string	"btrans"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"BlockTranspose Misses L1/L2/L3 %10lld %10lld %10lld\n"
	.section	.rodata.str1.1
.LC26:
	.string	"simp"
.LC27:
	.string	"SimpleMultiply            "
.LC28:
	.string	"simpc"
.LC29:
	.string	"SimpleMultiplyColumnwise  "
.LC30:
	.string	"simpt"
.LC31:
	.string	"SimpleMultiplyTranspose   "
.LC32:
	.string	"simptf"
.LC33:
	.string	"SimpleMultiplyTransposeFast"
.LC34:
	.string	"simpr"
.LC35:
	.string	"BlockMultiplyRemap        "
.LC36:
	.string	"simp1"
.LC37:
	.string	"IGNORE SimpleMultiplyOne     "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7544:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC12, %edi
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
	call	_ZN7kutrace6mark_aEPKc
	movl	$8392704, %edi
	call	_Znam
	movl	$8392704, %edi
	movq	%rax, %rbx
	movq	%rax, 16(%rsp)
	call	_Znam
	movl	$8392704, %edi
	leaq	4088(%rbx), %rbp
	movq	%rax, %r14
	movq	%rax, 24(%rsp)
	andq	$-4096, %rbp
	call	_Znam
	leaq	4088(%r14), %r9
	movl	$8392704, %edi
	andq	$-4096, %r9
	leaq	4088(%rax), %rbx
	movq	%rax, 32(%rsp)
	movq	%r9, %r13
	movq	%r9, %r12
	andq	$-4096, %rbx
	call	_Znam
	movl	$8392704, %edi
	movq	%rax, 8(%rsp)
	call	_Znam
	movl	$8392704, %edi
	movq	%rax, %r14
	call	_Znam
	movl	$.LC13, %edi
	movq	%rax, %r15
	movq	8(%rsp), %rax
	addq	$4088, %rax
	andq	$-4096, %rax
	movq	%rax, _ZL2aa(%rip)
	leaq	4088(%r14), %rax
	andq	$-4096, %rax
	movq	%rax, _ZL2bb(%rip)
	leaq	4088(%r15), %rax
	andq	$-4096, %rax
	movq	%rax, _ZL2cc(%rip)
	call	_ZN7kutrace6mark_aEPKc
	movq	%rbp, %rdi
	call	_Z10SimpleInitPd
	movq	%r13, %rdi
	call	_Z10SimpleInitPd
	call	_Z8InitTagsv
	movl	$.LC14, %edi
	call	_ZN7kutrace6mark_aEPKc
	movq	_ZL2aa(%rip), %rax
	movq	%rbp, %rdi
	movq	%rax, %rsi
	movq	%rax, 40(%rsp)
	call	_Z8RemapAllPKdPd
	movq	40(%rsp), %rdi
	movq	%rbx, %rsi
	call	_Z10UnRemapAllPKdPd
	movq	%rbp, %rdi
	call	_Z9SimpleSumPd
	movl	$.LC15, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	movq	_ZL2aa(%rip), %rdi
	call	_Z9SimpleSumPd
	movl	$.LC16, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	movq	%rbx, %rdi
	call	_Z9SimpleSumPd
	movl	$.LC17, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	movq	%rbx, %rdx
	leaq	8388608(%rbp), %rcx
	movq	%rbp, %rax
	subq	%rbp, %rdx
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L227:
	addq	$8, %rax
	cmpq	%rcx, %rax
	je	.L226
.L209:
	movsd	(%rdx,%rax), %xmm0
	ucomisd	(%rax), %xmm0
	jp	.L216
	je	.L227
.L216:
	movl	$.LC11, %edx
.L207:
	movq	stdout(%rip), %rdi
	movl	$.LC18, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	_ZL8L2misses(%rip), %rcx
	xorl	%eax, %eax
	movq	_ZL8L1misses(%rip), %rdx
	movq	_ZL8L3misses(%rip), %r8
	movq	stdout(%rip), %rdi
	movl	$.LC19, %esi
	call	fprintf
	call	_Z8InitTagsv
	movl	$.LC20, %edi
	call	_ZN7kutrace6mark_aEPKc
	movq	_ZL2bb(%rip), %rax
	movq	%r13, %rdi
	movq	%rax, %rsi
	movq	%rax, 40(%rsp)
	call	_Z12TransposeAllPKdPd
	movq	40(%rsp), %rdi
	movq	%rbx, %rsi
	call	_Z12TransposeAllPKdPd
	movq	%r13, %rdi
	call	_Z9SimpleSumPd
	movl	$.LC21, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	movq	_ZL2bb(%rip), %rdi
	call	_Z9SimpleSumPd
	movl	$.LC22, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	movq	%rbx, %rdi
	call	_Z9SimpleSumPd
	movl	$.LC17, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	movq	%rbx, %r10
	leaq	8388608(%r13), %r11
	movq	%r13, %rax
	subq	%r13, %r10
	jmp	.L212
	.p2align 4,,10
	.p2align 3
.L229:
	addq	$8, %rax
	cmpq	%r11, %rax
	je	.L228
.L212:
	movsd	(%rax), %xmm0
	ucomisd	(%rax,%r10), %xmm0
	jp	.L217
	je	.L229
.L217:
	movl	$.LC11, %edx
.L210:
	movq	stdout(%rip), %rdi
	movl	$.LC18, %esi
	xorl	%eax, %eax
	movq	%r11, 56(%rsp)
	movq	%r10, 48(%rsp)
	call	fprintf
	movq	_ZL8L2misses(%rip), %rcx
	xorl	%eax, %eax
	movq	_ZL8L1misses(%rip), %rdx
	movq	_ZL8L3misses(%rip), %r8
	movq	stdout(%rip), %rdi
	movl	$.LC23, %esi
	call	fprintf
	call	_Z8InitTagsv
	movl	$.LC24, %edi
	call	_ZN7kutrace6mark_aEPKc
	movq	_ZL2bb(%rip), %rax
	movq	%r13, %rdi
	movq	%rax, %rsi
	movq	%rax, 40(%rsp)
	call	_Z17BlockTransposeAllPKdPd
	movq	40(%rsp), %rdi
	movq	%rbx, %rsi
	call	_Z17BlockTransposeAllPKdPd
	movq	%r13, %rdi
	call	_Z9SimpleSumPd
	movl	$.LC21, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	movq	_ZL2bb(%rip), %rdi
	call	_Z9SimpleSumPd
	movl	$.LC22, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	movq	%rbx, %rdi
	call	_Z9SimpleSumPd
	movl	$.LC17, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	movq	48(%rsp), %r10
	movq	56(%rsp), %r11
	jmp	.L215
	.p2align 4,,10
	.p2align 3
.L231:
	addq	$8, %r13
	cmpq	%r13, %r11
	je	.L230
.L215:
	movsd	0(%r13), %xmm0
	ucomisd	(%r10,%r13), %xmm0
	jp	.L218
	je	.L231
.L218:
	movl	$.LC11, %edx
.L213:
	movq	stdout(%rip), %rdi
	movl	$.LC18, %esi
	xorl	%eax, %eax
	call	fprintf
	movq	_ZL8L3misses(%rip), %r8
	xorl	%eax, %eax
	movq	_ZL8L2misses(%rip), %rcx
	movq	_ZL8L1misses(%rip), %rdx
	movq	stdout(%rip), %rdi
	movl	$.LC25, %esi
	call	fprintf
	call	_Z8InitTagsv
	movl	$.LC26, %edi
	call	_ZN7kutrace6mark_aEPKc
	movq	%rbx, %r8
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$_Z14SimpleMultiplyPKdS0_Pd, %esi
	movl	$.LC27, %edi
	call	_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_
	movl	$.LC28, %edi
	call	_ZN7kutrace6mark_aEPKc
	movq	%rbx, %r8
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$_Z24SimpleMultiplyColumnwisePKdS0_Pd, %esi
	movl	$.LC29, %edi
	call	_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_
	movl	$.LC30, %edi
	call	_ZN7kutrace6mark_aEPKc
	movq	%rbx, %r8
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$_Z23SimpleMultiplyTransposePKdS0_Pd, %esi
	movl	$.LC31, %edi
	call	_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_
	movq	%rbx, %rdi
	call	_Z8ZeroInitPd
	movl	$.LC32, %edi
	call	_ZN7kutrace6mark_aEPKc
	movq	%rbx, %r8
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$_Z27SimpleMultiplyTransposeFastPKdS0_Pd, %esi
	movl	$.LC33, %edi
	call	_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_
	movq	%rbx, %rdi
	call	_Z8ZeroInitPd
	movl	$.LC34, %edi
	call	_ZN7kutrace6mark_aEPKc
	movq	%rbx, %r8
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$_Z18BlockMultiplyRemapPKdS0_Pd, %esi
	movl	$.LC35, %edi
	call	_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_
	movq	%rbx, %rdi
	call	_Z8ZeroInitPd
	movl	$.LC36, %edi
	call	_ZN7kutrace6mark_aEPKc
	movq	%rbx, %r8
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$_Z17SimpleMultiplyOnePKdS0_Pd, %esi
	movl	$.LC37, %edi
	call	_Z6TimeMePKcPFvPKdS2_PdES2_S2_S3_
	movq	%r15, %rdi
	call	_ZdaPv
	movq	%r14, %rdi
	call	_ZdaPv
	movq	8(%rsp), %rdi
	call	_ZdaPv
	movq	32(%rsp), %rdi
	call	_ZdaPv
	movq	24(%rsp), %rdi
	call	_ZdaPv
	movq	16(%rsp), %rdi
	call	_ZdaPv
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L226:
	.cfi_restore_state
	movl	$.LC10, %edx
	jmp	.L207
.L228:
	movl	$.LC10, %edx
	jmp	.L210
.L230:
	movl	$.LC10, %edx
	jmp	.L213
	.cfi_endproc
.LFE7544:
	.size	main, .-main
	.local	_ZL5L3tag
	.comm	_ZL5L3tag,262144,32
	.local	_ZL5L2tag
	.comm	_ZL5L2tag,32768,32
	.local	_ZL5L1tag
	.comm	_ZL5L1tag,4096,32
	.local	_ZL4L3rr
	.comm	_ZL4L3rr,4,4
	.local	_ZL4L2rr
	.comm	_ZL4L2rr,4,4
	.local	_ZL4L1rr
	.comm	_ZL4L1rr,4,4
	.local	_ZL8L3misses
	.comm	_ZL8L3misses,8,8
	.local	_ZL8L2misses
	.comm	_ZL8L2misses,8,8
	.local	_ZL8L1misses
	.comm	_ZL8L1misses,8,8
	.local	_ZL2cc
	.comm	_ZL2cc,8,8
	.local	_ZL2bb
	.comm	_ZL2bb,8,8
	.local	_ZL2aa
	.comm	_ZL2aa,8,8
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1093567616
	.align 8
.LC5:
	.long	0
	.long	1072693248
	.ident	"GCC: (GNU) 15.2.1 20250808 (Red Hat 15.2.1-1)"
	.section	.note.GNU-stack,"",@progbits
