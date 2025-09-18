	.file	"kutrace_lib.cc"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"KUtrace module/code not loaded\n"
	.align 8
.LC1:
	.string	"KUtrace module/code is version %lld. Need at least %lld\n"
	.text
	.p2align 4
	.type	_ZN12_GLOBAL__N_1L10TestModuleEv, @function
_ZN12_GLOBAL__N_1L10TestModuleEv:
.LFB7518:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$11, %esi
	movl	$1023, %edi
	call	syscall
	cmpq	$255, %rax
	ja	.L8
	movl	$1, %edx
	cmpq	$2, %rax
	jbe	.L9
	movl	%edx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
	movl	$31, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	xorl	%edx, %edx
.L10:
	movl	%edx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%rax, %rdx
	movl	$3, %ecx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	call	fprintf
	xorl	%edx, %edx
	jmp	.L10
	.cfi_endproc
.LFE7518:
	.size	_ZN12_GLOBAL__N_1L10TestModuleEv, .-_ZN12_GLOBAL__N_1L10TestModuleEv
	.p2align 4
	.type	_ZN12_GLOBAL__N_1L9StripCRLFEPc, @function
_ZN12_GLOBAL__N_1L9StripCRLFEPc:
.LFB7522:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen
	testl	%eax, %eax
	jle	.L11
	movslq	%eax, %rsi
	leaq	-1(%rbx,%rsi), %rdx
	movzbl	(%rdx), %ecx
	cmpb	$10, %cl
	je	.L17
.L14:
	cmpb	$13, %cl
	je	.L18
.L11:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore_state
	movb	$0, (%rdx)
	cmpl	$1, %eax
	je	.L11
	leaq	-2(%rbx,%rsi), %rdx
	movzbl	(%rdx), %ecx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L18:
	movb	$0, (%rdx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7522:
	.size	_ZN12_GLOBAL__N_1L9StripCRLFEPc, .-_ZN12_GLOBAL__N_1L9StripCRLFEPc
	.p2align 4
	.type	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy, @function
_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy:
.LFB7515:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdx, %rbx
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	call	strlen
	movl	$56, %edx
	pxor	%xmm0, %xmm0
	movq	$0, 56(%rsp)
	cmpq	%rdx, %rax
	movups	%xmm0, 8(%rsp)
	cmova	%rdx, %rax
	movups	%xmm0, 24(%rsp)
	movups	%xmm0, 40(%rsp)
	leaq	7(%rax), %rdx
	shrq	$3, %rdx
	addq	$1, %rdx
	salq	$4, %rdx
	addq	%rbp, %rdx
	salq	$32, %rdx
	orq	%rbx, %rdx
	movq	%rdx, (%rsp)
	cmpl	$8, %eax
	jnb	.L20
	testb	$4, %al
	jne	.L31
	testl	%eax, %eax
	je	.L21
	movzbl	(%r12), %edx
	movb	%dl, 8(%rsp)
	testb	$2, %al
	jne	.L32
.L21:
	movq	%rsp, %rdx
	movq	$-9, %rsi
	movl	$1023, %edi
	xorl	%eax, %eax
	call	syscall
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
	movl	%eax, %edx
	subl	$1, %eax
	movq	-8(%r12,%rdx), %rcx
	movq	%rcx, (%rsp,%rdx)
	cmpl	$8, %eax
	jb	.L21
	andl	$-8, %eax
	xorl	%edx, %edx
.L24:
	movl	%edx, %ecx
	addl	$8, %edx
	movq	(%r12,%rcx), %rsi
	movq	%rsi, 8(%rsp,%rcx)
	cmpl	%eax, %edx
	jb	.L24
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L31:
	movl	(%r12), %edx
	movl	%eax, %eax
	movl	%edx, 8(%rsp)
	movl	-4(%r12,%rax), %edx
	movl	%edx, 4(%rsp,%rax)
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L32:
	movl	%eax, %eax
	movzwl	-2(%r12,%rax), %edx
	movw	%dx, 6(%rsp,%rax)
	jmp	.L21
	.cfi_endproc
.LFE7515:
	.size	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy, .-_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"wb"
.LC4:
	.string	"%s did not open\n"
.LC6:
	.string	"  %s written (%3.1fMB)\n"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"ExtractTimePair missing event\n"
	.text
	.p2align 4
	.type	_ZN12_GLOBAL__N_1L6DoDumpEPKc, @function
_ZN12_GLOBAL__N_1L6DoDumpEPKc:
.LFB7534:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%edx, %edx
	movl	$2, %esi
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	movl	$1023, %edi
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
	subq	$73784, %rsp
	.cfi_def_cfa_offset 73840
	call	syscall
	movl	$.LC3, %esi
	movq	%r14, %rdi
	call	fopen
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.L65
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$5, %esi
	movl	$1023, %edi
	call	syscall
	leaq	8240(%rsp), %rbx
	movq	%rax, %rdx
	testq	%rax, %rax
	notq	%rdx
	sets	39(%rsp)
	cmovs	%rdx, %rax
	xorl	%ebp, %ebp
	shrq	$13, %rax
	movq	%rax, 24(%rsp)
	je	.L55
	movabsq	$72057594037927935, %r13
	movq	%r14, 40(%rsp)
.L36:
	movq	%rbp, %r12
	movq	%rbx, %r14
	salq	$13, %r12
	.p2align 4
	.p2align 3
.L38:
	movq	%r12, %rdx
	movl	$6, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	call	syscall
	addq	$8, %r14
	addq	$1, %r12
	movq	%rax, -8(%r14)
	leaq	73776(%rsp), %rax
	cmpq	%r14, %rax
	jne	.L38
	movq	8248(%rsp), %rdx
	movq	%rdx, %r14
	shrq	$56, %r14
	testq	%rbp, %rbp
	je	.L66
.L39:
	movq	8240(%rsp), %rax
	andq	%r13, %rax
	subq	16(%rsp), %rax
	js	.L51
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L52:
	mulsd	8(%rsp), %xmm0
	movq	(%rsp), %rcx
	movl	$1, %esi
	movq	%rbx, %rdi
	cvttsd2siq	%xmm0, %rax
	addq	%r15, %rax
	andq	%r13, %rax
	orq	%rdx, %rax
	movl	$65536, %edx
	movq	%rax, 8248(%rsp)
	call	fwrite
	testb	%r14b, %r14b
	js	.L67
.L53:
	addq	$1, %rbp
	cmpq	%rbp, 24(%rsp)
	jne	.L36
	movq	40(%rsp), %r14
.L55:
	movq	(%rsp), %rdi
	call	fclose
	pxor	%xmm0, %xmm0
	movq	%r14, %rdx
	cvtsi2sdq	24(%rsp), %xmm0
	mulsd	.LC5(%rip), %xmm0
	movl	$.LC6, %esi
	movl	$1, %eax
	movq	stdout(%rip), %rdi
	call	fprintf
	xorl	%edx, %edx
	movl	$3, %esi
	xorl	%eax, %eax
	movl	$1023, %edi
	call	syscall
	addq	$73784, %rsp
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
.L51:
	.cfi_restore_state
	movq	%rax, %rcx
	andl	$1, %eax
	pxor	%xmm0, %xmm0
	shrq	%rcx
	orq	%rax, %rcx
	cvtsi2sdq	%rcx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L52
.L66:
	cmpb	$0, 39(%rsp)
	je	.L40
	movabsq	$216172782113783808, %rax
	orq	%rdx, %rax
.L41:
	movq	%rax, 8248(%rsp)
	movabsq	$25769803776, %rcx
	movabsq	$16557098926080, %rax
	andq	8336(%rsp), %rax
	cmpq	%rcx, %rax
	jne	.L68
	movq	8344(%rsp), %rsi
	movq	8352(%rsp), %rax
.L43:
	movq	_ZN12_GLOBAL__N_1L10start_usecE(%rip), %rdi
	testq	%rdi, %rdi
	je	.L44
	movq	_ZN12_GLOBAL__N_1L12start_cyclesE(%rip), %rsi
.L45:
	movq	_ZN12_GLOBAL__N_1L11stop_cyclesE(%rip), %rcx
	movq	_ZN12_GLOBAL__N_1L9stop_usecE(%rip), %r8
	movq	%rsi, 16(%rsp)
	movq	%rcx, %rax
	movq	%r8, %r9
	movq	%rcx, %xmm0
	orq	%rsi, %rax
	subq	%rdi, %r9
	shrq	$32, %rax
	jne	.L47
	movabsq	$-4294967296, %r10
	imulq	$54, %r9, %rax
	xorl	%edx, %edx
	addq	%rsi, %rax
	andq	%r10, %rax
	orq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rcx, %xmm0
	subq	%rsi, %rax
	divq	%r9
	cmpq	$60, %rax
	jbe	.L48
	leaq	(%rcx,%r10), %rax
	movq	%rax, _ZN12_GLOBAL__N_1L11stop_cyclesE(%rip)
	movq	%rax, %xmm0
	movq	%rax, %rcx
.L47:
	movsd	.LC2(%rip), %xmm1
	movq	%rdi, %r15
	cmpq	%rcx, %rsi
	jge	.L50
	subq	%rsi, %rcx
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
.L50:
	pxor	%xmm2, %xmm2
	movq	%r8, %xmm4
	movq	%rsi, 8256(%rsp)
	movq	8248(%rsp), %rdx
	cvtsi2sdq	%r9, %xmm2
	divsd	%xmm1, %xmm2
	punpcklqdq	%xmm4, %xmm0
	movq	%rdi, 8264(%rsp)
	movaps	%xmm0, 8272(%rsp)
	movsd	%xmm2, 8(%rsp)
	jmp	.L39
.L67:
	movq	%rbp, %r12
	leaq	48(%rsp), %r14
	salq	$10, %r12
	.p2align 4
	.p2align 3
.L54:
	movq	%r12, %rdx
	movl	$9, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	call	syscall
	addq	$8, %r14
	addq	$1, %r12
	movq	%rax, -8(%r14)
	cmpq	%rbx, %r14
	jne	.L54
	movq	(%rsp), %rcx
	movl	$8192, %edx
	movl	$1, %esi
	leaq	48(%rsp), %rdi
	call	fwrite
	jmp	.L53
.L44:
	movq	%rax, _ZN12_GLOBAL__N_1L10start_usecE(%rip)
	movq	%rax, %rdi
	movq	%rsi, _ZN12_GLOBAL__N_1L12start_cyclesE(%rip)
	jmp	.L45
.L40:
	movq	%rdx, %rax
	movabsq	$216172782113783808, %rdx
	btrq	$62, %rax
	orq	%rdx, %rax
	jmp	.L41
.L68:
	movl	$1, %esi
	movl	$30, %edx
	movl	$.LC7, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	xorl	%esi, %esi
	xorl	%eax, %eax
	jmp	.L43
.L48:
	cmpq	$47, %rax
	ja	.L69
	movabsq	$4294967296, %rax
	addq	%rcx, %rax
	movq	%rax, _ZN12_GLOBAL__N_1L11stop_cyclesE(%rip)
	movq	%rax, %xmm0
	movq	%rax, %rcx
	jmp	.L47
.L65:
	movq	stderr(%rip), %rdi
	movq	%r14, %rdx
	addq	$73784, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$.LC4, %esi
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
.L69:
	.cfi_restore_state
	movq	%rcx, _ZN12_GLOBAL__N_1L11stop_cyclesE(%rip)
	jmp	.L47
	.cfi_endproc
.LFE7534:
	.size	_ZN12_GLOBAL__N_1L6DoDumpEPKc, .-_ZN12_GLOBAL__N_1L6DoDumpEPKc
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"KUtrace module/code not available\n"
	.text
	.p2align 4
	.type	_ZN12_GLOBAL__N_1L5DoOffEv, @function
_ZN12_GLOBAL__N_1L5DoOffEv:
.LFB7520:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	$1023, %edi
	xorl	%eax, %eax
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	call	syscall
	movdqa	.LC8(%rip), %xmm0
	xorl	%esi, %esi
	movq	%rsp, %rdi
	movq	%rax, %rbx
	movaps	%xmm0, (%rsp)
	call	nanosleep
	testq	%rbx, %rbx
	jne	.L78
	cmpq	$0, _ZN12_GLOBAL__N_1L9stop_usecE(%rip)
	je	.L73
.L74:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore_state
	rdtsc
	xorl	%esi, %esi
	salq	$32, %rdx
	movq	%rsp, %rdi
	orq	%rdx, %rax
	shrq	$6, %rax
	movq	%rax, %rbx
	call	gettimeofday
	movq	8(%rsp), %rsi
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	shrq	$6, %rax
	subq	%rbx, %rax
	cmpq	$320, %rax
	jg	.L73
	imulq	$1000000, (%rsp), %rcx
	movq	%rbx, _ZN12_GLOBAL__N_1L11stop_cyclesE(%rip)
	addq	%rsi, %rcx
	movq	%rcx, _ZN12_GLOBAL__N_1L9stop_usecE(%rip)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L78:
	movl	$34, %edx
	movl	$1, %esi
	movl	$.LC9, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7520:
	.size	_ZN12_GLOBAL__N_1L5DoOffEv, .-_ZN12_GLOBAL__N_1L5DoOffEv
	.p2align 4
	.type	_ZN12_GLOBAL__N_1L4DoOnEv, @function
_ZN12_GLOBAL__N_1L4DoOnEv:
.LFB7521:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	cmpq	$0, _ZN12_GLOBAL__N_1L10start_usecE(%rip)
	je	.L81
.L80:
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$1, %esi
	movl	$1023, %edi
	call	syscall
	cmpq	$1, %rax
	movl	$1, %eax
	jne	.L87
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L81:
	.cfi_restore_state
	rdtsc
	xorl	%esi, %esi
	salq	$32, %rdx
	movq	%rsp, %rdi
	orq	%rdx, %rax
	shrq	$6, %rax
	movq	%rax, %rbx
	call	gettimeofday
	movq	8(%rsp), %rsi
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	shrq	$6, %rax
	subq	%rbx, %rax
	cmpq	$320, %rax
	jg	.L81
	imulq	$1000000, (%rsp), %rcx
	movq	%rbx, _ZN12_GLOBAL__N_1L12start_cyclesE(%rip)
	addq	%rsi, %rcx
	movq	%rcx, _ZN12_GLOBAL__N_1L10start_usecE(%rip)
	jmp	.L80
	.p2align 4,,10
	.p2align 3
.L87:
	movl	$34, %edx
	movl	$1, %esi
	movl	$.LC9, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7521:
	.size	_ZN12_GLOBAL__N_1L4DoOnEv, .-_ZN12_GLOBAL__N_1L4DoOnEv
	.section	.rodata.str1.1
.LC10:
	.string	"Divide-by-zero"
.LC11:
	.string	"timer"
.LC12:
	.string	"read"
.LC13:
	.string	"r"
.LC14:
	.string	"uname -rv"
.LC15:
	.string	"rb"
.LC16:
	.string	"/proc/cpuinfo"
.LC17:
	.string	"model name"
.LC18:
	.string	"-idle-"
.LC19:
	.string	"-sched-"
	.text
	.p2align 4
	.type	_ZN12_GLOBAL__N_1L6DoInitEPKc.part.0, @function
_ZN12_GLOBAL__N_1L6DoInitEPKc.part.0:
.LFB7574:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$.LC13, %esi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	movl	$.LC14, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	movb	$0, _ZN12_GLOBAL__N_1L13kernelversionE(%rip)
	call	popen
	testq	%rax, %rax
	je	.L90
	movl	$_ZN12_GLOBAL__N_1L13kernelversionE, %edi
	movq	%rax, %rdx
	movl	$256, %esi
	movq	%rax, %rbx
	call	fgets
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	pclose
	testq	%r12, %r12
	je	.L90
	movl	$_ZN12_GLOBAL__N_1L13kernelversionE, %edi
	call	_ZN12_GLOBAL__N_1L9StripCRLFEPc
.L90:
	movl	$.LC15, %esi
	movl	$.LC16, %edi
	movb	$0, _ZN12_GLOBAL__N_1L9modelnameE(%rip)
	call	fopen
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L116
	movq	$0, 24(%rsp)
	leaq	32(%rsp), %rbx
	movabsq	$7020584519046819693, %r14
	movq	$0, 32(%rsp)
	.p2align 4
	.p2align 3
.L111:
	movq	%r13, %rcx
	movl	$10, %edx
	leaq	24(%rsp), %rdi
	movq	%rbx, %rsi
	call	__getdelim
	cmpq	$-1, %rax
	je	.L96
	movq	24(%rsp), %r12
	cmpq	%r14, (%r12)
	jne	.L111
	cmpw	$25965, 8(%r12)
	jne	.L111
	movl	$58, %esi
	movq	%r12, %rdi
	call	strchr
	testq	%rax, %rax
	je	.L111
	movq	%r12, %rdi
	movq	%rax, 8(%rsp)
	call	_ZN12_GLOBAL__N_1L9StripCRLFEPc
	movq	8(%rsp), %rax
	movl	$256, %edx
	movl	$_ZN12_GLOBAL__N_1L9modelnameE, %edi
	leaq	2(%rax), %rsi
	call	strncpy
	movb	$0, _ZN12_GLOBAL__N_1L9modelnameE+255(%rip)
.L96:
	movq	24(%rsp), %rdi
	call	free
	movq	%r13, %rdi
	call	fclose
	.p2align 4
	.p2align 3
.L98:
	rdtsc
	xorl	%esi, %esi
	salq	$32, %rdx
	movq	%rbx, %rdi
	orq	%rdx, %rax
	shrq	$6, %rax
	movq	%rax, %r12
	call	gettimeofday
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	shrq	$6, %rax
	subq	%r12, %rax
	cmpq	$320, %rax
	jg	.L98
	movq	%rbx, %rdx
	movq	$-9, %rsi
	movabsq	$231928233984, %rcx
	movl	$1023, %edi
	imulq	$1000000, 32(%rsp), %rax
	addq	40(%rsp), %rax
	movq	%rcx, 32(%rsp)
	movl	$_ZL9TrapNames, %ebx
	movq	%rax, _ZN12_GLOBAL__N_1L10start_usecE(%rip)
	movq	%rax, 48(%rsp)
	xorl	%eax, %eax
	movq	%r12, _ZN12_GLOBAL__N_1L12start_cyclesE(%rip)
	movq	%r12, 40(%rsp)
	call	syscall
	xorl	%edx, %edx
	movl	$258, %esi
	movl	$_ZN12_GLOBAL__N_1L13kernelversionE, %edi
	call	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	xorl	%edx, %edx
	movl	$259, %esi
	movl	$_ZN12_GLOBAL__N_1L9modelnameE, %edi
	call	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	movl	$.LC18, %edi
	xorl	%edx, %edx
	movl	$2, %esi
	call	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	movl	$.LC10, %edi
	.p2align 4
	.p2align 3
.L99:
	movslq	(%rbx), %rdx
	movl	$4, %esi
	addq	$16, %rbx
	call	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	jne	.L99
	movl	$.LC11, %edi
	movl	$_ZL8IrqNames, %ebx
	.p2align 4
	.p2align 3
.L100:
	movslq	(%rbx), %rdx
	movl	$5, %esi
	addq	$16, %rbx
	call	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	jne	.L100
	movl	$.LC12, %edi
	movl	$_ZL14Syscall64Names, %ebx
	.p2align 4
	.p2align 3
.L101:
	movslq	(%rbx), %rdx
	movl	$8, %esi
	addq	$16, %rbx
	call	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	jne	.L101
	movl	$511, %edx
	movl	$12, %esi
	movl	$.LC19, %edi
	call	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	call	getpid
	movq	%rbp, %rdi
	movl	$2, %esi
	movzwl	%ax, %ebx
	movq	%rbx, %rdx
	btsq	$41, %rbx
	call	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%rbx, %rdx
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	movq	$-8, %rsi
	popq	%rbp
	.cfi_def_cfa_offset 32
	movl	$1023, %edi
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	syscall
.L116:
	.cfi_restore_state
	leaq	32(%rsp), %rbx
	jmp	.L98
	.cfi_endproc
.LFE7574:
	.size	_ZN12_GLOBAL__N_1L6DoInitEPKc.part.0, .-_ZN12_GLOBAL__N_1L6DoInitEPKc.part.0
	.p2align 4
	.globl	_ZN7kutrace4testEv
	.type	_ZN7kutrace4testEv, @function
_ZN7kutrace4testEv:
.LFB7541:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$11, %esi
	movl	$1023, %edi
	call	syscall
	cmpq	$255, %rax
	ja	.L123
	movl	$1, %edx
	cmpq	$2, %rax
	jbe	.L124
	movl	%edx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L123:
	.cfi_restore_state
	movl	$31, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	xorl	%edx, %edx
.L125:
	movl	%edx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L124:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%rax, %rdx
	movl	$3, %ecx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	call	fprintf
	xorl	%edx, %edx
	jmp	.L125
	.cfi_endproc
.LFE7541:
	.size	_ZN7kutrace4testEv, .-_ZN7kutrace4testEv
	.p2align 4
	.globl	_ZN7kutrace2goEPKc
	.type	_ZN7kutrace2goEPKc, @function
_ZN7kutrace2goEPKc:
.LFB7542:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	_ZN12_GLOBAL__N_1L10TestModuleEv
	testb	%al, %al
	je	.L127
	xorl	%edx, %edx
	movl	$3, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	call	syscall
	movq	$0, _ZN12_GLOBAL__N_1L10start_usecE(%rip)
	movq	$0, _ZN12_GLOBAL__N_1L9stop_usecE(%rip)
	movq	$0, _ZN12_GLOBAL__N_1L12start_cyclesE(%rip)
	movq	$0, _ZN12_GLOBAL__N_1L11stop_cyclesE(%rip)
.L127:
	call	_ZN12_GLOBAL__N_1L10TestModuleEv
	testb	%al, %al
	je	.L128
	movq	%rbx, %rdi
	call	_ZN12_GLOBAL__N_1L6DoInitEPKc.part.0
.L128:
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZN12_GLOBAL__N_1L4DoOnEv
	.cfi_endproc
.LFE7542:
	.size	_ZN7kutrace2goEPKc, .-_ZN7kutrace2goEPKc
	.p2align 4
	.globl	_ZN7kutrace5goipcEPKc
	.type	_ZN7kutrace5goipcEPKc, @function
_ZN7kutrace5goipcEPKc:
.LFB7543:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	_ZN12_GLOBAL__N_1L10TestModuleEv
	testb	%al, %al
	je	.L137
	movl	$1, %edx
	movl	$3, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	call	syscall
	movq	$0, _ZN12_GLOBAL__N_1L10start_usecE(%rip)
	movq	$0, _ZN12_GLOBAL__N_1L9stop_usecE(%rip)
	movq	$0, _ZN12_GLOBAL__N_1L12start_cyclesE(%rip)
	movq	$0, _ZN12_GLOBAL__N_1L11stop_cyclesE(%rip)
.L137:
	call	_ZN12_GLOBAL__N_1L10TestModuleEv
	testb	%al, %al
	je	.L138
	movq	%rbx, %rdi
	call	_ZN12_GLOBAL__N_1L6DoInitEPKc.part.0
.L138:
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZN12_GLOBAL__N_1L4DoOnEv
	.cfi_endproc
.LFE7543:
	.size	_ZN7kutrace5goipcEPKc, .-_ZN7kutrace5goipcEPKc
	.p2align 4
	.globl	_ZN7kutrace4stopEPKc
	.type	_ZN7kutrace4stopEPKc, @function
_ZN7kutrace4stopEPKc:
.LFB7544:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	_ZN12_GLOBAL__N_1L5DoOffEv
	call	_ZN12_GLOBAL__N_1L10TestModuleEv
	testb	%al, %al
	je	.L147
	xorl	%edx, %edx
	movl	$2, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	call	syscall
.L147:
	movq	%rbx, %rdi
	call	_ZN12_GLOBAL__N_1L6DoDumpEPKc
	call	_ZN12_GLOBAL__N_1L5DoOffEv
	xorl	%edi, %edi
	call	exit
	.cfi_endproc
.LFE7544:
	.size	_ZN7kutrace4stopEPKc, .-_ZN7kutrace4stopEPKc
	.p2align 4
	.globl	_ZN7kutrace6mark_aEPKc
	.type	_ZN7kutrace6mark_aEPKc, @function
_ZN7kutrace6mark_aEPKc:
.LFB7545:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen
	testl	%eax, %eax
	jle	.L155
	movl	$6, %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movslq	%eax, %rdx
	subl	$1, %eax
	leaq	-1(%rbx,%rdx), %rsi
	leaq	(%rbx,%rdx), %rcx
	xorl	%edx, %edx
	subq	%rax, %rsi
	.p2align 5
	.p2align 4
	.p2align 3
.L154:
	movsbq	-1(%rcx), %rax
	leaq	(%rdx,%rdx,4), %rdx
	subq	$1, %rcx
	movsbq	_ZN12_GLOBAL__N_1L9kToBase40E(%rax), %rax
	leaq	(%rax,%rdx,8), %rdx
	cmpq	%rcx, %rsi
	jne	.L154
	movabsq	$2241972928512, %rax
	movl	%edx, %edx
	orq	%rax, %rdx
.L153:
	movl	$7, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	syscall
	.p2align 4,,10
	.p2align 3
.L155:
	.cfi_restore_state
	movabsq	$2241972928512, %rdx
	jmp	.L153
	.cfi_endproc
.LFE7545:
	.size	_ZN7kutrace6mark_aEPKc, .-_ZN7kutrace6mark_aEPKc
	.p2align 4
	.globl	_ZN7kutrace6mark_bEPKc
	.type	_ZN7kutrace6mark_bEPKc, @function
_ZN7kutrace6mark_bEPKc:
.LFB7546:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen
	testl	%eax, %eax
	jle	.L161
	movl	$6, %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movslq	%eax, %rdx
	subl	$1, %eax
	leaq	-1(%rbx,%rdx), %rsi
	leaq	(%rbx,%rdx), %rcx
	xorl	%edx, %edx
	subq	%rax, %rsi
	.p2align 5
	.p2align 4
	.p2align 3
.L160:
	movsbq	-1(%rcx), %rax
	leaq	(%rdx,%rdx,4), %rdx
	subq	$1, %rcx
	movsbq	_ZN12_GLOBAL__N_1L9kToBase40E(%rax), %rax
	leaq	(%rax,%rdx,8), %rdx
	cmpq	%rcx, %rsi
	jne	.L160
	movabsq	$2246267895808, %rax
	movl	%edx, %edx
	orq	%rax, %rdx
.L159:
	movl	$7, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	syscall
	.p2align 4,,10
	.p2align 3
.L161:
	.cfi_restore_state
	movabsq	$2246267895808, %rdx
	jmp	.L159
	.cfi_endproc
.LFE7546:
	.size	_ZN7kutrace6mark_bEPKc, .-_ZN7kutrace6mark_bEPKc
	.p2align 4
	.globl	_ZN7kutrace6mark_cEPKc
	.type	_ZN7kutrace6mark_cEPKc, @function
_ZN7kutrace6mark_cEPKc:
.LFB7547:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen
	testl	%eax, %eax
	jle	.L167
	movl	$6, %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movslq	%eax, %rdx
	subl	$1, %eax
	leaq	-1(%rbx,%rdx), %rsi
	leaq	(%rbx,%rdx), %rcx
	xorl	%edx, %edx
	subq	%rax, %rsi
	.p2align 5
	.p2align 4
	.p2align 3
.L166:
	movsbq	-1(%rcx), %rax
	leaq	(%rdx,%rdx,4), %rdx
	subq	$1, %rcx
	movsbq	_ZN12_GLOBAL__N_1L9kToBase40E(%rax), %rax
	leaq	(%rax,%rdx,8), %rdx
	cmpq	%rcx, %rsi
	jne	.L166
	movabsq	$2250562863104, %rax
	movl	%edx, %edx
	orq	%rax, %rdx
.L165:
	movl	$7, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	syscall
	.p2align 4,,10
	.p2align 3
.L167:
	.cfi_restore_state
	movabsq	$2250562863104, %rdx
	jmp	.L165
	.cfi_endproc
.LFE7547:
	.size	_ZN7kutrace6mark_cEPKc, .-_ZN7kutrace6mark_cEPKc
	.p2align 4
	.globl	_ZN7kutrace6mark_dEy
	.type	_ZN7kutrace6mark_dEy, @function
_ZN7kutrace6mark_dEy:
.LFB7548:
	.cfi_startproc
	movl	%edi, %edx
	movl	$7, %esi
	movl	$1023, %edi
	movabsq	$2254857830400, %rax
	orq	%rax, %rdx
	xorl	%eax, %eax
	jmp	syscall
	.cfi_endproc
.LFE7548:
	.size	_ZN7kutrace6mark_dEy, .-_ZN7kutrace6mark_dEy
	.p2align 4
	.globl	_ZN7kutrace8addeventEyy
	.type	_ZN7kutrace8addeventEyy, @function
_ZN7kutrace8addeventEyy:
.LFB7549:
	.cfi_startproc
	movabsq	$17587891077120, %rax
	salq	$32, %rdi
	movl	%esi, %esi
	andq	%rax, %rdi
	xorl	%eax, %eax
	movq	%rdi, %rdx
	movl	$1023, %edi
	orq	%rsi, %rdx
	movl	$7, %esi
	jmp	syscall
	.cfi_endproc
.LFE7549:
	.size	_ZN7kutrace8addeventEyy, .-_ZN7kutrace8addeventEyy
	.p2align 4
	.globl	_ZN7kutrace7addnameEyyPKc
	.type	_ZN7kutrace7addnameEyyPKc, @function
_ZN7kutrace7addnameEyyPKc:
.LFB7550:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	movq	%rdx, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	call	strlen
	movl	$55, %edx
	pxor	%xmm0, %xmm0
	movq	$0, 56(%rsp)
	cmpq	%rdx, %rax
	movups	%xmm0, 8(%rsp)
	cmova	%rdx, %rax
	movups	%xmm0, 24(%rsp)
	movups	%xmm0, 40(%rsp)
	leaq	7(%rax), %rdx
	shrq	$3, %rdx
	addq	$1, %rdx
	salq	$4, %rdx
	addq	%rbp, %rdx
	salq	$32, %rdx
	orq	%rbx, %rdx
	movq	%rdx, (%rsp)
	cmpl	$8, %eax
	jnb	.L173
	testb	$4, %al
	jne	.L184
	testl	%eax, %eax
	je	.L174
	movzbl	(%r12), %edx
	movb	%dl, 8(%rsp)
	testb	$2, %al
	jne	.L185
.L174:
	movq	%rsp, %rdx
	movl	$8, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	call	syscall
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L173:
	.cfi_restore_state
	movl	%eax, %edx
	subl	$1, %eax
	movq	-8(%r12,%rdx), %rcx
	movq	%rcx, (%rsp,%rdx)
	cmpl	$8, %eax
	jb	.L174
	andl	$-8, %eax
	xorl	%edx, %edx
.L177:
	movl	%edx, %ecx
	addl	$8, %edx
	movq	(%r12,%rcx), %rsi
	movq	%rsi, 8(%rsp,%rcx)
	cmpl	%eax, %edx
	jb	.L177
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L184:
	movl	(%r12), %edx
	movl	%eax, %eax
	movl	%edx, 8(%rsp)
	movl	-4(%r12,%rax), %edx
	movl	%edx, 4(%rsp,%rax)
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L185:
	movl	%eax, %eax
	movzwl	-2(%r12,%rax), %edx
	movw	%dx, 6(%rsp,%rax)
	jmp	.L174
	.cfi_endproc
.LFE7550:
	.size	_ZN7kutrace7addnameEyyPKc, .-_ZN7kutrace7addnameEyyPKc
	.p2align 4
	.globl	_ZN7kutrace6msleepEi
	.type	_ZN7kutrace6msleepEi, @function
_ZN7kutrace6msleepEi:
.LFB7551:
	.cfi_startproc
	movslq	%edi, %rax
	movl	%edi, %edx
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	xorl	%esi, %esi
	imulq	$274877907, %rax, %rax
	sarl	$31, %edx
	sarq	$38, %rax
	subl	%edx, %eax
	imull	$1000, %eax, %edx
	movd	%eax, %xmm0
	subl	%edx, %edi
	imull	$1000000, %edi, %edi
	movd	%edi, %xmm2
	movq	%rsp, %rdi
	punpckldq	%xmm2, %xmm0
	movdqa	%xmm0, %xmm1
	psrad	$31, %xmm1
	punpckldq	%xmm1, %xmm0
	movaps	%xmm0, (%rsp)
	call	nanosleep
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7551:
	.size	_ZN7kutrace6msleepEi, .-_ZN7kutrace6msleepEi
	.p2align 4
	.globl	_ZN7kutrace8readtimeEv
	.type	_ZN7kutrace8readtimeEv, @function
_ZN7kutrace8readtimeEv:
.LFB7552:
	.cfi_startproc
	rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	shrq	$6, %rax
	ret
	.cfi_endproc
.LFE7552:
	.size	_ZN7kutrace8readtimeEv, .-_ZN7kutrace8readtimeEv
	.p2align 4
	.globl	_ZN7kutrace12Base40ToCharEyPc
	.type	_ZN7kutrace12Base40ToCharEyPc, @function
_ZN7kutrace12Base40ToCharEyPc:
.LFB7553:
	.cfi_startproc
	movq	$0, (%rsi)
	movq	%rsi, %r11
	andl	$4294967295, %edi
	je	.L202
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rsi
	movl	$1, %r8d
	movq	%r11, %rdi
	movabsq	$-3689348814741910323, %r10
	.p2align 4
	.p2align 3
.L192:
	movq	%rsi, %rax
	movq	%rsi, %rbx
	mulq	%r10
	shrq	$5, %rdx
	leaq	(%rdx,%rdx,4), %rcx
	movq	%rdx, %rax
	movq	%rsi, %rdx
	salq	$3, %rcx
	movq	%rax, %rsi
	subq	%rcx, %rdx
	movzbl	_ZN12_GLOBAL__N_1L11kFromBase40E(%rdx), %r9d
	setne	%cl
	movb	%r9b, (%rdi)
	andb	%r8b, %cl
	je	.L191
	movl	%ecx, %r8d
	cmpq	$26, %rdx
	ja	.L191
	andl	$-33, %r9d
	xorl	%r8d, %r8d
	movb	%r9b, (%rdi)
.L191:
	addq	$1, %rdi
	cmpq	$39, %rbx
	ja	.L192
	movq	%r11, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L202:
	.cfi_restore 3
	movq	%rsi, %rax
	ret
	.cfi_endproc
.LFE7553:
	.size	_ZN7kutrace12Base40ToCharEyPc, .-_ZN7kutrace12Base40ToCharEyPc
	.p2align 4
	.globl	_ZN7kutrace12CharToBase40EPKc
	.type	_ZN7kutrace12CharToBase40EPKc, @function
_ZN7kutrace12CharToBase40EPKc:
.LFB7554:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	strlen
	testl	%eax, %eax
	jle	.L208
	movl	$6, %edx
	cmpl	%edx, %eax
	cmovg	%edx, %eax
	movslq	%eax, %rcx
	subl	$1, %eax
	leaq	-1(%rbx,%rcx), %rsi
	leaq	(%rbx,%rcx), %rdx
	subq	%rax, %rsi
	xorl	%eax, %eax
	.p2align 5
	.p2align 4
	.p2align 3
.L207:
	leaq	(%rax,%rax,4), %rcx
	movsbq	-1(%rdx), %rax
	subq	$1, %rdx
	movsbq	_ZN12_GLOBAL__N_1L9kToBase40E(%rax), %rax
	leaq	(%rax,%rcx,8), %rax
	cmpq	%rsi, %rdx
	jne	.L207
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L208:
	.cfi_restore_state
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7554:
	.size	_ZN7kutrace12CharToBase40EPKc, .-_ZN7kutrace12CharToBase40EPKc
	.p2align 4
	.globl	_ZN7kutrace9DoControlEyy
	.type	_ZN7kutrace9DoControlEyy, @function
_ZN7kutrace9DoControlEyy:
.LFB7555:
	.cfi_startproc
	movq	%rsi, %rdx
	xorl	%eax, %eax
	movq	%rdi, %rsi
	movl	$1023, %edi
	jmp	syscall
	.cfi_endproc
.LFE7555:
	.size	_ZN7kutrace9DoControlEyy, .-_ZN7kutrace9DoControlEyy
	.p2align 4
	.globl	_ZN7kutrace6DoDumpEPKc
	.type	_ZN7kutrace6DoDumpEPKc, @function
_ZN7kutrace6DoDumpEPKc:
.LFB7556:
	.cfi_startproc
	jmp	_ZN12_GLOBAL__N_1L6DoDumpEPKc
	.cfi_endproc
.LFE7556:
	.size	_ZN7kutrace6DoDumpEPKc, .-_ZN7kutrace6DoDumpEPKc
	.p2align 4
	.globl	_ZN7kutrace7DoEventEyy
	.type	_ZN7kutrace7DoEventEyy, @function
_ZN7kutrace7DoEventEyy:
.LFB7579:
	.cfi_startproc
	movabsq	$17587891077120, %rax
	salq	$32, %rdi
	movl	%esi, %esi
	andq	%rax, %rdi
	xorl	%eax, %eax
	movq	%rdi, %rdx
	movl	$1023, %edi
	orq	%rsi, %rdx
	movl	$7, %esi
	jmp	syscall
	.cfi_endproc
.LFE7579:
	.size	_ZN7kutrace7DoEventEyy, .-_ZN7kutrace7DoEventEyy
	.p2align 4
	.globl	_ZN7kutrace7DoFlushEv
	.type	_ZN7kutrace7DoFlushEv, @function
_ZN7kutrace7DoFlushEv:
.LFB7558:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZN12_GLOBAL__N_1L10TestModuleEv
	testb	%al, %al
	jne	.L217
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L217:
	.cfi_restore_state
	xorl	%edx, %edx
	movl	$2, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	syscall
	.cfi_endproc
.LFE7558:
	.size	_ZN7kutrace7DoFlushEv, .-_ZN7kutrace7DoFlushEv
	.p2align 4
	.globl	_ZN7kutrace6DoInitEPKc
	.type	_ZN7kutrace6DoInitEPKc, @function
_ZN7kutrace6DoInitEPKc:
.LFB7559:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	_ZN12_GLOBAL__N_1L10TestModuleEv
	testb	%al, %al
	jne	.L221
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L221:
	.cfi_restore_state
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	_ZN12_GLOBAL__N_1L6DoInitEPKc.part.0
	.cfi_endproc
.LFE7559:
	.size	_ZN7kutrace6DoInitEPKc, .-_ZN7kutrace6DoInitEPKc
	.p2align 4
	.globl	_ZN7kutrace6DoMarkEyy
	.type	_ZN7kutrace6DoMarkEyy, @function
_ZN7kutrace6DoMarkEyy:
.LFB7560:
	.cfi_startproc
	salq	$32, %rdi
	movl	%esi, %esi
	xorl	%eax, %eax
	movq	%rdi, %rdx
	movl	$1023, %edi
	orq	%rsi, %rdx
	movl	$7, %esi
	jmp	syscall
	.cfi_endproc
.LFE7560:
	.size	_ZN7kutrace6DoMarkEyy, .-_ZN7kutrace6DoMarkEyy
	.p2align 4
	.globl	_ZN7kutrace6DoTestEv
	.type	_ZN7kutrace6DoTestEv, @function
_ZN7kutrace6DoTestEv:
.LFB7561:
	.cfi_startproc
	xorl	%edx, %edx
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	movl	$10, %esi
	movl	$1023, %edi
	call	syscall
	cmpq	$1, %rax
	sete	%dl
	testq	%rax, %rax
	js	.L227
	movl	%edx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L227:
	.cfi_restore_state
	movl	$34, %edx
	movl	$1, %esi
	movl	$.LC9, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	xorl	%edx, %edx
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE7561:
	.size	_ZN7kutrace6DoTestEv, .-_ZN7kutrace6DoTestEv
	.p2align 4
	.globl	_ZN7kutrace5DoOffEv
	.type	_ZN7kutrace5DoOffEv, @function
_ZN7kutrace5DoOffEv:
.LFB7562:
	.cfi_startproc
	jmp	_ZN12_GLOBAL__N_1L5DoOffEv
	.cfi_endproc
.LFE7562:
	.size	_ZN7kutrace5DoOffEv, .-_ZN7kutrace5DoOffEv
	.p2align 4
	.globl	_ZN7kutrace4DoOnEv
	.type	_ZN7kutrace4DoOnEv, @function
_ZN7kutrace4DoOnEv:
.LFB7563:
	.cfi_startproc
	jmp	_ZN12_GLOBAL__N_1L4DoOnEv
	.cfi_endproc
.LFE7563:
	.size	_ZN7kutrace4DoOnEv, .-_ZN7kutrace4DoOnEv
	.p2align 4
	.globl	_ZN7kutrace6DoQuitEv
	.type	_ZN7kutrace6DoQuitEv, @function
_ZN7kutrace6DoQuitEv:
.LFB7564:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	_ZN12_GLOBAL__N_1L5DoOffEv
	xorl	%edi, %edi
	call	exit
	.cfi_endproc
.LFE7564:
	.size	_ZN7kutrace6DoQuitEv, .-_ZN7kutrace6DoQuitEv
	.p2align 4
	.globl	_ZN7kutrace7DoResetEy
	.type	_ZN7kutrace7DoResetEy, @function
_ZN7kutrace7DoResetEy:
.LFB7565:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	_ZN12_GLOBAL__N_1L10TestModuleEv
	testb	%al, %al
	jne	.L238
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L238:
	.cfi_restore_state
	movq	%rbx, %rdx
	movl	$3, %esi
	movl	$1023, %edi
	xorl	%eax, %eax
	call	syscall
	popq	%rbx
	.cfi_def_cfa_offset 8
	movq	$0, _ZN12_GLOBAL__N_1L10start_usecE(%rip)
	movq	$0, _ZN12_GLOBAL__N_1L9stop_usecE(%rip)
	movq	$0, _ZN12_GLOBAL__N_1L12start_cyclesE(%rip)
	movq	$0, _ZN12_GLOBAL__N_1L11stop_cyclesE(%rip)
	ret
	.cfi_endproc
.LFE7565:
	.size	_ZN7kutrace7DoResetEy, .-_ZN7kutrace7DoResetEy
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"Stat: %lld trace blocks used (%3.1fMB)\n"
	.text
	.p2align 4
	.globl	_ZN7kutrace6DoStatEy
	.type	_ZN7kutrace6DoStatEy, @function
_ZN7kutrace6DoStatEy:
.LFB7566:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%edx, %edx
	movq	%rdi, %rbx
	xorl	%eax, %eax
	movl	$4, %esi
	movl	$1023, %edi
	call	syscall
	andl	$1, %ebx
	movsd	.LC21(%rip), %xmm1
	jne	.L240
	movsd	.LC20(%rip), %xmm1
.L240:
	testq	%rax, %rax
	js	.L241
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L242:
	mulsd	%xmm1, %xmm0
	movq	stderr(%rip), %rdi
	movq	%rax, %rdx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	mulsd	.LC22(%rip), %xmm0
	movl	$.LC23, %esi
	movl	$1, %eax
	jmp	fprintf
	.p2align 4,,10
	.p2align 3
.L241:
	.cfi_restore_state
	movq	%rax, %rdx
	movq	%rax, %rcx
	pxor	%xmm0, %xmm0
	shrq	%rdx
	andl	$1, %ecx
	orq	%rcx, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L242
	.cfi_endproc
.LFE7566:
	.size	_ZN7kutrace6DoStatEy, .-_ZN7kutrace6DoStatEy
	.p2align 4
	.globl	_ZN7kutrace9EmitNamesEPK11NumNamePairy
	.type	_ZN7kutrace9EmitNamesEPK11NumNamePairy, @function
_ZN7kutrace9EmitNamesEPK11NumNamePairy:
.LFB7567:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	.L245
	movq	%rsi, %rbp
	.p2align 4
	.p2align 3
.L247:
	movslq	(%rbx), %rdx
	movq	%rbp, %rsi
	addq	$16, %rbx
	call	_ZN12_GLOBAL__N_1L19InsertVariableEntryEPKcyy
	movq	8(%rbx), %rdi
	testq	%rdi, %rdi
	jne	.L247
.L245:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7567:
	.size	_ZN7kutrace9EmitNamesEPK11NumNamePairy, .-_ZN7kutrace9EmitNamesEPK11NumNamePairy
	.p2align 4
	.globl	_ZN7kutrace7GetUsecEv
	.type	_ZN7kutrace7GetUsecEv, @function
_ZN7kutrace7GetUsecEv:
.LFB7568:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	xorl	%esi, %esi
	movq	%rsp, %rdi
	call	gettimeofday
	imulq	$1000000, (%rsp), %rax
	addq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7568:
	.size	_ZN7kutrace7GetUsecEv, .-_ZN7kutrace7GetUsecEv
	.section	.rodata.str1.1
.LC24:
	.string	"%04d%02d%02d_%02d%02d%02d"
.LC25:
	.string	"%s_%s_%s_%d.trace"
	.text
	.p2align 4
	.globl	_ZN7kutrace17MakeTraceFileNameEPKcPc
	.type	_ZN7kutrace17MakeTraceFileNameEPKcPc, @function
_ZN7kutrace17MakeTraceFileNameEPKcPc:
.LFB7569:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	movl	$47, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$264, %rsp
	.cfi_def_cfa_offset 288
	call	strrchr
	testq	%rax, %rax
	leaq	1(%rax), %rdx
	cmovne	%rdx, %rbx
	xorl	%edi, %edi
	call	time
	movq	%rsp, %rdi
	cltq
	movq	%rax, (%rsp)
	call	localtime
	movl	$_ZN12_GLOBAL__N_1L19gTempDateTimeBufferE, %edi
	movl	(%rax), %esi
	movl	8(%rax), %r9d
	movl	12(%rax), %r8d
	movl	16(%rax), %ecx
	movl	20(%rax), %edx
	pushq	%rsi
	.cfi_def_cfa_offset 296
	movl	$.LC24, %esi
	movl	4(%rax), %eax
	addl	$1, %ecx
	addl	$1900, %edx
	pushq	%rax
	.cfi_def_cfa_offset 304
	xorl	%eax, %eax
	call	sprintf
	leaq	16(%rsp), %rdi
	movl	$256, %esi
	call	gethostname
	movb	$0, 271(%rsp)
	call	getpid
	leaq	16(%rsp), %r8
	movq	%rbx, %rdx
	movq	%rbp, %rdi
	movl	%eax, %r9d
	movl	$_ZN12_GLOBAL__N_1L19gTempDateTimeBufferE, %ecx
	movl	$.LC25, %esi
	xorl	%eax, %eax
	call	sprintf
	addq	$280, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7569:
	.size	_ZN7kutrace17MakeTraceFileNameEPKcPc, .-_ZN7kutrace17MakeTraceFileNameEPKcPc
	.p2align 4
	.globl	_ZN7kutrace10TestModuleEv
	.type	_ZN7kutrace10TestModuleEv, @function
_ZN7kutrace10TestModuleEv:
.LFB7577:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$11, %esi
	movl	$1023, %edi
	call	syscall
	cmpq	$255, %rax
	ja	.L266
	movl	$1, %edx
	cmpq	$2, %rax
	jbe	.L267
	movl	%edx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L266:
	.cfi_restore_state
	movl	$31, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	xorl	%edx, %edx
.L268:
	movl	%edx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L267:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movq	%rax, %rdx
	movl	$3, %ecx
	xorl	%eax, %eax
	movl	$.LC1, %esi
	call	fprintf
	xorl	%edx, %edx
	jmp	.L268
	.cfi_endproc
.LFE7577:
	.size	_ZN7kutrace10TestModuleEv, .-_ZN7kutrace10TestModuleEv
	.section	.rodata
	.align 32
	.type	_ZN12_GLOBAL__N_1L11kFromBase40E, @object
	.size	_ZN12_GLOBAL__N_1L11kFromBase40E, 40
_ZN12_GLOBAL__N_1L11kFromBase40E:
	.string	""
	.ascii	"abcdefghijklmnopqrstuvwxyz0123456789-./"
	.align 32
	.type	_ZN12_GLOBAL__N_1L9kToBase40E, @object
	.size	_ZN12_GLOBAL__N_1L9kToBase40E, 256
_ZN12_GLOBAL__N_1L9kToBase40E:
	.base64	"ACYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJSYnGxwdHh8gISIjJCYmJiYmJiYBAgMEBQYHCAkKCwwNDg8QERITFBUWFxgZGiYmJiYmJgECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYmJiYm"
	.ascii	"&"
	.local	_ZN12_GLOBAL__N_1L19gTempDateTimeBufferE
	.comm	_ZN12_GLOBAL__N_1L19gTempDateTimeBufferE,32,32
	.local	_ZN12_GLOBAL__N_1L9modelnameE
	.comm	_ZN12_GLOBAL__N_1L9modelnameE,256,32
	.local	_ZN12_GLOBAL__N_1L13kernelversionE
	.comm	_ZN12_GLOBAL__N_1L13kernelversionE,256,32
	.local	_ZN12_GLOBAL__N_1L9stop_usecE
	.comm	_ZN12_GLOBAL__N_1L9stop_usecE,8,8
	.local	_ZN12_GLOBAL__N_1L10start_usecE
	.comm	_ZN12_GLOBAL__N_1L10start_usecE,8,8
	.local	_ZN12_GLOBAL__N_1L11stop_cyclesE
	.comm	_ZN12_GLOBAL__N_1L11stop_cyclesE,8,8
	.local	_ZN12_GLOBAL__N_1L12start_cyclesE
	.comm	_ZN12_GLOBAL__N_1L12start_cyclesE,8,8
	.section	.rodata.str1.1
.LC26:
	.string	"Debug"
.LC27:
	.string	"Non-maskable_Interrupt"
.LC28:
	.string	"Breakpoint"
.LC29:
	.string	"Overflow"
.LC30:
	.string	"Bound_Range_Exceeded"
.LC31:
	.string	"Invalid_Opcode"
.LC32:
	.string	"device_not_available"
.LC33:
	.string	"Double_Fault"
.LC34:
	.string	"Coprocessor_Segment_Overrun"
.LC35:
	.string	"Invalid_TSS"
.LC36:
	.string	"Segment_Not_Present"
.LC37:
	.string	"Stack_Segment_Fault"
.LC38:
	.string	"General_Protection_Fault"
.LC39:
	.string	"page_fault"
.LC40:
	.string	"Spurious_Interrupt"
.LC41:
	.string	"x87_Floating-Point_Exception"
.LC42:
	.string	"Alignment_Check"
.LC43:
	.string	"Machine_Check"
.LC44:
	.string	"SIMD_Floating-Point_Exception"
.LC45:
	.string	"IRET_Exception"
	.section	.rodata
	.align 32
	.type	_ZL9TrapNames, @object
	.size	_ZL9TrapNames, 352
_ZL9TrapNames:
	.long	0
	.zero	4
	.quad	.LC10
	.long	1
	.zero	4
	.quad	.LC26
	.long	2
	.zero	4
	.quad	.LC27
	.long	3
	.zero	4
	.quad	.LC28
	.long	4
	.zero	4
	.quad	.LC29
	.long	5
	.zero	4
	.quad	.LC30
	.long	6
	.zero	4
	.quad	.LC31
	.long	7
	.zero	4
	.quad	.LC32
	.long	8
	.zero	4
	.quad	.LC33
	.long	9
	.zero	4
	.quad	.LC34
	.long	10
	.zero	4
	.quad	.LC35
	.long	11
	.zero	4
	.quad	.LC36
	.long	12
	.zero	4
	.quad	.LC37
	.long	13
	.zero	4
	.quad	.LC38
	.long	14
	.zero	4
	.quad	.LC39
	.long	15
	.zero	4
	.quad	.LC40
	.long	16
	.zero	4
	.quad	.LC41
	.long	17
	.zero	4
	.quad	.LC42
	.long	18
	.zero	4
	.quad	.LC43
	.long	19
	.zero	4
	.quad	.LC44
	.long	32
	.zero	4
	.quad	.LC45
	.long	-1
	.zero	4
	.quad	0
	.section	.rodata.str1.1
.LC46:
	.string	"i8042_keyboard1"
.LC47:
	.string	"int3"
.LC48:
	.string	"rtc0"
.LC49:
	.string	"acpi"
.LC50:
	.string	"i8042_keyboard12"
.LC51:
	.string	"usb1"
.LC52:
	.string	"usb2"
.LC53:
	.string	"i915_graphics"
.LC54:
	.string	"enp2s0_eth0"
.LC55:
	.string	"hda_29_inner"
.LC56:
	.string	"hda_30_inner"
.LC57:
	.string	"mei_me"
.LC58:
	.string	"hda_36"
.LC59:
	.string	"eth0"
.LC60:
	.string	"hda_29"
.LC61:
	.string	"hda_30"
.LC62:
	.string	"hda_31"
.LC63:
	.string	"graphics"
.LC64:
	.string	"int80"
.LC65:
	.string	"sdb2"
.LC66:
	.string	"BH"
.LC67:
	.string	"error_apic_ipi"
.LC68:
	.string	"reschedule_ipi"
.LC69:
	.string	"call_func_ipi"
.LC70:
	.string	"call_func1_ipi"
.LC71:
	.string	"thermal_apic_ipi"
.LC72:
	.string	"threshold_apic_ipi"
.LC73:
	.string	"reboot_ipi"
.LC74:
	.string	"x86_platform_ipi"
.LC75:
	.string	"irq_work_ipi"
.LC76:
	.string	"uv_bau_message"
.LC77:
	.string	"deferred_error"
.LC78:
	.string	"hypervisor_callback"
.LC79:
	.string	"posted_intr"
.LC80:
	.string	"posted_intr_wakeup"
.LC81:
	.string	"posted_intr_nested"
.LC82:
	.string	"managed_irq_shutdown"
.LC83:
	.string	"hyperv_reenlighten"
.LC84:
	.string	"hyperv_stimer0"
.LC85:
	.string	"local_timer_vector"
.LC86:
	.string	"fpu_irq"
	.section	.rodata
	.align 32
	.type	_ZL8IrqNames, @object
	.size	_ZL8IrqNames, 752
_ZL8IrqNames:
	.long	0
	.zero	4
	.quad	.LC11
	.long	1
	.zero	4
	.quad	.LC46
	.long	3
	.zero	4
	.quad	.LC47
	.long	8
	.zero	4
	.quad	.LC48
	.long	9
	.zero	4
	.quad	.LC49
	.long	12
	.zero	4
	.quad	.LC50
	.long	16
	.zero	4
	.quad	.LC51
	.long	23
	.zero	4
	.quad	.LC52
	.long	24
	.zero	4
	.quad	.LC53
	.long	28
	.zero	4
	.quad	.LC54
	.long	29
	.zero	4
	.quad	.LC55
	.long	30
	.zero	4
	.quad	.LC56
	.long	31
	.zero	4
	.quad	.LC57
	.long	36
	.zero	4
	.quad	.LC58
	.long	34
	.zero	4
	.quad	.LC59
	.long	66
	.zero	4
	.quad	.LC60
	.long	82
	.zero	4
	.quad	.LC61
	.long	98
	.zero	4
	.quad	.LC62
	.long	177
	.zero	4
	.quad	.LC63
	.long	178
	.zero	4
	.quad	.LC59
	.long	128
	.zero	4
	.quad	.LC64
	.long	129
	.zero	4
	.quad	.LC59
	.long	35
	.zero	4
	.quad	.LC59
	.long	37
	.zero	4
	.quad	.LC59
	.long	39
	.zero	4
	.quad	.LC65
	.long	255
	.zero	4
	.quad	.LC66
	.long	254
	.zero	4
	.quad	.LC67
	.long	253
	.zero	4
	.quad	.LC68
	.long	252
	.zero	4
	.quad	.LC69
	.long	251
	.zero	4
	.quad	.LC70
	.long	250
	.zero	4
	.quad	.LC71
	.long	249
	.zero	4
	.quad	.LC72
	.long	248
	.zero	4
	.quad	.LC73
	.long	247
	.zero	4
	.quad	.LC74
	.long	246
	.zero	4
	.quad	.LC75
	.long	245
	.zero	4
	.quad	.LC76
	.long	244
	.zero	4
	.quad	.LC77
	.long	243
	.zero	4
	.quad	.LC78
	.long	242
	.zero	4
	.quad	.LC79
	.long	241
	.zero	4
	.quad	.LC80
	.long	240
	.zero	4
	.quad	.LC81
	.long	239
	.zero	4
	.quad	.LC82
	.long	238
	.zero	4
	.quad	.LC83
	.long	237
	.zero	4
	.quad	.LC84
	.long	236
	.zero	4
	.quad	.LC85
	.long	13
	.zero	4
	.quad	.LC86
	.long	-1
	.zero	4
	.quad	0
	.section	.rodata.str1.1
.LC87:
	.string	"write"
.LC88:
	.string	"open"
.LC89:
	.string	"close"
.LC90:
	.string	"stat"
.LC91:
	.string	"fstat"
.LC92:
	.string	"lstat"
.LC93:
	.string	"poll"
.LC94:
	.string	"lseek"
.LC95:
	.string	"mmap"
.LC96:
	.string	"mprotect"
.LC97:
	.string	"munmap"
.LC98:
	.string	"brk"
.LC99:
	.string	"rt_sigaction"
.LC100:
	.string	"rt_sigprocmask"
.LC101:
	.string	"rt_sigreturn"
.LC102:
	.string	"ioctl"
.LC103:
	.string	"pread64"
.LC104:
	.string	"pwrite64"
.LC105:
	.string	"readv"
.LC106:
	.string	"writev"
.LC107:
	.string	"access"
.LC108:
	.string	"pipe"
.LC109:
	.string	"select"
.LC110:
	.string	"sched_yield"
.LC111:
	.string	"mremap"
.LC112:
	.string	"msync"
.LC113:
	.string	"mincore"
.LC114:
	.string	"madvise"
.LC115:
	.string	"shmget"
.LC116:
	.string	"shmat"
.LC117:
	.string	"shmctl"
.LC118:
	.string	"dup"
.LC119:
	.string	"dup2"
.LC120:
	.string	"pause"
.LC121:
	.string	"nanosleep"
.LC122:
	.string	"getitimer"
.LC123:
	.string	"alarm"
.LC124:
	.string	"setitimer"
.LC125:
	.string	"getpid"
.LC126:
	.string	"sendfile"
.LC127:
	.string	"socket"
.LC128:
	.string	"connect"
.LC129:
	.string	"accept"
.LC130:
	.string	"sendto"
.LC131:
	.string	"recvfrom"
.LC132:
	.string	"sendmsg"
.LC133:
	.string	"recvmsg"
.LC134:
	.string	"shutdown"
.LC135:
	.string	"bind"
.LC136:
	.string	"listen"
.LC137:
	.string	"getsockname"
.LC138:
	.string	"getpeername"
.LC139:
	.string	"socketpair"
.LC140:
	.string	"setsockopt"
.LC141:
	.string	"getsockopt"
.LC142:
	.string	"clone"
.LC143:
	.string	"fork"
.LC144:
	.string	"vfork"
.LC145:
	.string	"execve"
.LC146:
	.string	"exit"
.LC147:
	.string	"wait4"
.LC148:
	.string	"kill"
.LC149:
	.string	"uname"
.LC150:
	.string	"semget"
.LC151:
	.string	"semop"
.LC152:
	.string	"semctl"
.LC153:
	.string	"shmdt"
.LC154:
	.string	"msgget"
.LC155:
	.string	"msgsnd"
.LC156:
	.string	"msgrcv"
.LC157:
	.string	"msgctl"
.LC158:
	.string	"fcntl"
.LC159:
	.string	"flock"
.LC160:
	.string	"fsync"
.LC161:
	.string	"fdatasync"
.LC162:
	.string	"truncate"
.LC163:
	.string	"ftruncate"
.LC164:
	.string	"getdents"
.LC165:
	.string	"getcwd"
.LC166:
	.string	"chdir"
.LC167:
	.string	"fchdir"
.LC168:
	.string	"rename"
.LC169:
	.string	"mkdir"
.LC170:
	.string	"rmdir"
.LC171:
	.string	"creat"
.LC172:
	.string	"link"
.LC173:
	.string	"unlink"
.LC174:
	.string	"symlink"
.LC175:
	.string	"readlink"
.LC176:
	.string	"chmod"
.LC177:
	.string	"fchmod"
.LC178:
	.string	"chown"
.LC179:
	.string	"fchown"
.LC180:
	.string	"lchown"
.LC181:
	.string	"umask"
.LC182:
	.string	"gettimeofday"
.LC183:
	.string	"getrlimit"
.LC184:
	.string	"getrusage"
.LC185:
	.string	"sysinfo"
.LC186:
	.string	"times"
.LC187:
	.string	"ptrace"
.LC188:
	.string	"getuid"
.LC189:
	.string	"syslog"
.LC190:
	.string	"getgid"
.LC191:
	.string	"setuid"
.LC192:
	.string	"setgid"
.LC193:
	.string	"geteuid"
.LC194:
	.string	"getegid"
.LC195:
	.string	"setpgid"
.LC196:
	.string	"getppid"
.LC197:
	.string	"getpgrp"
.LC198:
	.string	"setsid"
.LC199:
	.string	"setreuid"
.LC200:
	.string	"setregid"
.LC201:
	.string	"getgroups"
.LC202:
	.string	"setgroups"
.LC203:
	.string	"setresuid"
.LC204:
	.string	"getresuid"
.LC205:
	.string	"setresgid"
.LC206:
	.string	"getresgid"
.LC207:
	.string	"getpgid"
.LC208:
	.string	"setfsuid"
.LC209:
	.string	"setfsgid"
.LC210:
	.string	"getsid"
.LC211:
	.string	"capget"
.LC212:
	.string	"capset"
.LC213:
	.string	"rt_sigpending"
.LC214:
	.string	"rt_sigtimedwait"
.LC215:
	.string	"rt_sigqueueinfo"
.LC216:
	.string	"rt_sigsuspend"
.LC217:
	.string	"sigaltstack"
.LC218:
	.string	"utime"
.LC219:
	.string	"mknod"
.LC220:
	.string	"uselib"
.LC221:
	.string	"personality"
.LC222:
	.string	"ustat"
.LC223:
	.string	"statfs"
.LC224:
	.string	"fstatfs"
.LC225:
	.string	"sysfs"
.LC226:
	.string	"getpriority"
.LC227:
	.string	"setpriority"
.LC228:
	.string	"sched_setparam"
.LC229:
	.string	"sched_getparam"
.LC230:
	.string	"sched_setscheduler"
.LC231:
	.string	"sched_getscheduler"
.LC232:
	.string	"sched_get_priority_max"
.LC233:
	.string	"sched_get_priority_min"
.LC234:
	.string	"sched_rr_get_interval"
.LC235:
	.string	"mlock"
.LC236:
	.string	"munlock"
.LC237:
	.string	"mlockall"
.LC238:
	.string	"munlockall"
.LC239:
	.string	"vhangup"
.LC240:
	.string	"modify_ldt"
.LC241:
	.string	"pivot_root"
.LC242:
	.string	"_sysctl"
.LC243:
	.string	"prctl"
.LC244:
	.string	"arch_prctl"
.LC245:
	.string	"adjtimex"
.LC246:
	.string	"setrlimit"
.LC247:
	.string	"chroot"
.LC248:
	.string	"sync"
.LC249:
	.string	"acct"
.LC250:
	.string	"settimeofday"
.LC251:
	.string	"mount"
.LC252:
	.string	"umount2"
.LC253:
	.string	"swapon"
.LC254:
	.string	"swapoff"
.LC255:
	.string	"reboot"
.LC256:
	.string	"sethostname"
.LC257:
	.string	"setdomainname"
.LC258:
	.string	"iopl"
.LC259:
	.string	"ioperm"
.LC260:
	.string	"create_module"
.LC261:
	.string	"init_module"
.LC262:
	.string	"delete_module"
.LC263:
	.string	"get_kernel_syms"
.LC264:
	.string	"query_module"
.LC265:
	.string	"quotactl"
.LC266:
	.string	"nfsservctl"
.LC267:
	.string	"getpmsg"
.LC268:
	.string	"putpmsg"
.LC269:
	.string	"afs_syscall"
.LC270:
	.string	"tuxcall"
.LC271:
	.string	"security"
.LC272:
	.string	"gettid"
.LC273:
	.string	"readahead"
.LC274:
	.string	"setxattr"
.LC275:
	.string	"lsetxattr"
.LC276:
	.string	"fsetxattr"
.LC277:
	.string	"getxattr"
.LC278:
	.string	"lgetxattr"
.LC279:
	.string	"fgetxattr"
.LC280:
	.string	"listxattr"
.LC281:
	.string	"llistxattr"
.LC282:
	.string	"flistxattr"
.LC283:
	.string	"removexattr"
.LC284:
	.string	"lremovexattr"
.LC285:
	.string	"fremovexattr"
.LC286:
	.string	"tkill"
.LC287:
	.string	"time"
.LC288:
	.string	"futex"
.LC289:
	.string	"sched_setaffinity"
.LC290:
	.string	"sched_getaffinity"
.LC291:
	.string	"set_thread_area"
.LC292:
	.string	"io_setup"
.LC293:
	.string	"io_destroy"
.LC294:
	.string	"io_getevents"
.LC295:
	.string	"io_submit"
.LC296:
	.string	"io_cancel"
.LC297:
	.string	"get_thread_area"
.LC298:
	.string	"lookup_dcookie"
.LC299:
	.string	"epoll_create"
.LC300:
	.string	"epoll_ctl_old"
.LC301:
	.string	"epoll_wait_old"
.LC302:
	.string	"remap_file_pages"
.LC303:
	.string	"getdents64"
.LC304:
	.string	"set_tid_address"
.LC305:
	.string	"restart_syscall"
.LC306:
	.string	"semtimedop"
.LC307:
	.string	"fadvise64"
.LC308:
	.string	"timer_create"
.LC309:
	.string	"timer_settime"
.LC310:
	.string	"timer_gettime"
.LC311:
	.string	"timer_getoverrun"
.LC312:
	.string	"timer_delete"
.LC313:
	.string	"clock_settime"
.LC314:
	.string	"clock_gettime"
.LC315:
	.string	"clock_getres"
.LC316:
	.string	"clock_nanosleep"
.LC317:
	.string	"exit_group"
.LC318:
	.string	"epoll_wait"
.LC319:
	.string	"epoll_ctl"
.LC320:
	.string	"tgkill"
.LC321:
	.string	"utimes"
.LC322:
	.string	"vserver"
.LC323:
	.string	"mbind"
.LC324:
	.string	"set_mempolicy"
.LC325:
	.string	"get_mempolicy"
.LC326:
	.string	"mq_open"
.LC327:
	.string	"mq_unlink"
.LC328:
	.string	"mq_timedsend"
.LC329:
	.string	"mq_timedreceive"
.LC330:
	.string	"mq_notify"
.LC331:
	.string	"mq_getsetattr"
.LC332:
	.string	"kexec_load"
.LC333:
	.string	"waitid"
.LC334:
	.string	"add_key"
.LC335:
	.string	"request_key"
.LC336:
	.string	"keyctl"
.LC337:
	.string	"ioprio_set"
.LC338:
	.string	"ioprio_get"
.LC339:
	.string	"inotify_init"
.LC340:
	.string	"inotify_add_watch"
.LC341:
	.string	"inotify_rm_watch"
.LC342:
	.string	"migrate_pages"
.LC343:
	.string	"openat"
.LC344:
	.string	"mkdirat"
.LC345:
	.string	"mknodat"
.LC346:
	.string	"fchownat"
.LC347:
	.string	"futimesat"
.LC348:
	.string	"newfstatat"
.LC349:
	.string	"unlinkat"
.LC350:
	.string	"renameat"
.LC351:
	.string	"linkat"
.LC352:
	.string	"symlinkat"
.LC353:
	.string	"readlinkat"
.LC354:
	.string	"fchmodat"
.LC355:
	.string	"faccessat"
.LC356:
	.string	"pselect6"
.LC357:
	.string	"ppoll"
.LC358:
	.string	"unshare"
.LC359:
	.string	"set_robust_list"
.LC360:
	.string	"get_robust_list"
.LC361:
	.string	"splice"
.LC362:
	.string	"tee"
.LC363:
	.string	"sync_file_range"
.LC364:
	.string	"vmsplice"
.LC365:
	.string	"move_pages"
.LC366:
	.string	"utimensat"
.LC367:
	.string	"epoll_pwait"
.LC368:
	.string	"signalfd"
.LC369:
	.string	"timerfd_create"
.LC370:
	.string	"eventfd"
.LC371:
	.string	"fallocate"
.LC372:
	.string	"timerfd_settime"
.LC373:
	.string	"timerfd_gettime"
.LC374:
	.string	"accept4"
.LC375:
	.string	"signalfd4"
.LC376:
	.string	"eventfd2"
.LC377:
	.string	"epoll_create1"
.LC378:
	.string	"dup3"
.LC379:
	.string	"pipe2"
.LC380:
	.string	"inotify_init1"
.LC381:
	.string	"preadv"
.LC382:
	.string	"pwritev"
.LC383:
	.string	"rt_tgsigqueueinfo"
.LC384:
	.string	"perf_event_open"
.LC385:
	.string	"recvmmsg"
.LC386:
	.string	"fanotify_init"
.LC387:
	.string	"fanotify_mark"
.LC388:
	.string	"prlimit64"
.LC389:
	.string	"name_to_handle_at"
.LC390:
	.string	"open_by_handle_at"
.LC391:
	.string	"clock_adjtime"
.LC392:
	.string	"syncfs"
.LC393:
	.string	"sendmmsg"
.LC394:
	.string	"setns"
.LC395:
	.string	"getcpu"
.LC396:
	.string	"process_vm_readv"
.LC397:
	.string	"process_vm_writev"
.LC398:
	.string	"kcmp"
.LC399:
	.string	"finit_module"
.LC400:
	.string	"sched_setattr"
.LC401:
	.string	"sched_getattr"
.LC402:
	.string	"renameat2"
.LC403:
	.string	"seccomp"
.LC404:
	.string	"getrandom"
.LC405:
	.string	"memfd_create"
.LC406:
	.string	"kexec_file_load"
.LC407:
	.string	"bpf"
.LC408:
	.string	"execveat"
.LC409:
	.string	"userfaultfd"
.LC410:
	.string	"membarrier"
.LC411:
	.string	"mlock2"
	.section	.rodata
	.align 32
	.type	_ZL14Syscall64Names, @object
	.size	_ZL14Syscall64Names, 5248
_ZL14Syscall64Names:
	.long	0
	.zero	4
	.quad	.LC12
	.long	1
	.zero	4
	.quad	.LC87
	.long	2
	.zero	4
	.quad	.LC88
	.long	3
	.zero	4
	.quad	.LC89
	.long	4
	.zero	4
	.quad	.LC90
	.long	5
	.zero	4
	.quad	.LC91
	.long	6
	.zero	4
	.quad	.LC92
	.long	7
	.zero	4
	.quad	.LC93
	.long	8
	.zero	4
	.quad	.LC94
	.long	9
	.zero	4
	.quad	.LC95
	.long	10
	.zero	4
	.quad	.LC96
	.long	11
	.zero	4
	.quad	.LC97
	.long	12
	.zero	4
	.quad	.LC98
	.long	13
	.zero	4
	.quad	.LC99
	.long	14
	.zero	4
	.quad	.LC100
	.long	15
	.zero	4
	.quad	.LC101
	.long	16
	.zero	4
	.quad	.LC102
	.long	17
	.zero	4
	.quad	.LC103
	.long	18
	.zero	4
	.quad	.LC104
	.long	19
	.zero	4
	.quad	.LC105
	.long	20
	.zero	4
	.quad	.LC106
	.long	21
	.zero	4
	.quad	.LC107
	.long	22
	.zero	4
	.quad	.LC108
	.long	23
	.zero	4
	.quad	.LC109
	.long	24
	.zero	4
	.quad	.LC110
	.long	25
	.zero	4
	.quad	.LC111
	.long	26
	.zero	4
	.quad	.LC112
	.long	27
	.zero	4
	.quad	.LC113
	.long	28
	.zero	4
	.quad	.LC114
	.long	29
	.zero	4
	.quad	.LC115
	.long	30
	.zero	4
	.quad	.LC116
	.long	31
	.zero	4
	.quad	.LC117
	.long	32
	.zero	4
	.quad	.LC118
	.long	33
	.zero	4
	.quad	.LC119
	.long	34
	.zero	4
	.quad	.LC120
	.long	35
	.zero	4
	.quad	.LC121
	.long	36
	.zero	4
	.quad	.LC122
	.long	37
	.zero	4
	.quad	.LC123
	.long	38
	.zero	4
	.quad	.LC124
	.long	39
	.zero	4
	.quad	.LC125
	.long	40
	.zero	4
	.quad	.LC126
	.long	41
	.zero	4
	.quad	.LC127
	.long	42
	.zero	4
	.quad	.LC128
	.long	43
	.zero	4
	.quad	.LC129
	.long	44
	.zero	4
	.quad	.LC130
	.long	45
	.zero	4
	.quad	.LC131
	.long	46
	.zero	4
	.quad	.LC132
	.long	47
	.zero	4
	.quad	.LC133
	.long	48
	.zero	4
	.quad	.LC134
	.long	49
	.zero	4
	.quad	.LC135
	.long	50
	.zero	4
	.quad	.LC136
	.long	51
	.zero	4
	.quad	.LC137
	.long	52
	.zero	4
	.quad	.LC138
	.long	53
	.zero	4
	.quad	.LC139
	.long	54
	.zero	4
	.quad	.LC140
	.long	55
	.zero	4
	.quad	.LC141
	.long	56
	.zero	4
	.quad	.LC142
	.long	57
	.zero	4
	.quad	.LC143
	.long	58
	.zero	4
	.quad	.LC144
	.long	59
	.zero	4
	.quad	.LC145
	.long	60
	.zero	4
	.quad	.LC146
	.long	61
	.zero	4
	.quad	.LC147
	.long	62
	.zero	4
	.quad	.LC148
	.long	63
	.zero	4
	.quad	.LC149
	.long	64
	.zero	4
	.quad	.LC150
	.long	65
	.zero	4
	.quad	.LC151
	.long	66
	.zero	4
	.quad	.LC152
	.long	67
	.zero	4
	.quad	.LC153
	.long	68
	.zero	4
	.quad	.LC154
	.long	69
	.zero	4
	.quad	.LC155
	.long	70
	.zero	4
	.quad	.LC156
	.long	71
	.zero	4
	.quad	.LC157
	.long	72
	.zero	4
	.quad	.LC158
	.long	73
	.zero	4
	.quad	.LC159
	.long	74
	.zero	4
	.quad	.LC160
	.long	75
	.zero	4
	.quad	.LC161
	.long	76
	.zero	4
	.quad	.LC162
	.long	77
	.zero	4
	.quad	.LC163
	.long	78
	.zero	4
	.quad	.LC164
	.long	79
	.zero	4
	.quad	.LC165
	.long	80
	.zero	4
	.quad	.LC166
	.long	81
	.zero	4
	.quad	.LC167
	.long	82
	.zero	4
	.quad	.LC168
	.long	83
	.zero	4
	.quad	.LC169
	.long	84
	.zero	4
	.quad	.LC170
	.long	85
	.zero	4
	.quad	.LC171
	.long	86
	.zero	4
	.quad	.LC172
	.long	87
	.zero	4
	.quad	.LC173
	.long	88
	.zero	4
	.quad	.LC174
	.long	89
	.zero	4
	.quad	.LC175
	.long	90
	.zero	4
	.quad	.LC176
	.long	91
	.zero	4
	.quad	.LC177
	.long	92
	.zero	4
	.quad	.LC178
	.long	93
	.zero	4
	.quad	.LC179
	.long	94
	.zero	4
	.quad	.LC180
	.long	95
	.zero	4
	.quad	.LC181
	.long	96
	.zero	4
	.quad	.LC182
	.long	97
	.zero	4
	.quad	.LC183
	.long	98
	.zero	4
	.quad	.LC184
	.long	99
	.zero	4
	.quad	.LC185
	.long	100
	.zero	4
	.quad	.LC186
	.long	101
	.zero	4
	.quad	.LC187
	.long	102
	.zero	4
	.quad	.LC188
	.long	103
	.zero	4
	.quad	.LC189
	.long	104
	.zero	4
	.quad	.LC190
	.long	105
	.zero	4
	.quad	.LC191
	.long	106
	.zero	4
	.quad	.LC192
	.long	107
	.zero	4
	.quad	.LC193
	.long	108
	.zero	4
	.quad	.LC194
	.long	109
	.zero	4
	.quad	.LC195
	.long	110
	.zero	4
	.quad	.LC196
	.long	111
	.zero	4
	.quad	.LC197
	.long	112
	.zero	4
	.quad	.LC198
	.long	113
	.zero	4
	.quad	.LC199
	.long	114
	.zero	4
	.quad	.LC200
	.long	115
	.zero	4
	.quad	.LC201
	.long	116
	.zero	4
	.quad	.LC202
	.long	117
	.zero	4
	.quad	.LC203
	.long	118
	.zero	4
	.quad	.LC204
	.long	119
	.zero	4
	.quad	.LC205
	.long	120
	.zero	4
	.quad	.LC206
	.long	121
	.zero	4
	.quad	.LC207
	.long	122
	.zero	4
	.quad	.LC208
	.long	123
	.zero	4
	.quad	.LC209
	.long	124
	.zero	4
	.quad	.LC210
	.long	125
	.zero	4
	.quad	.LC211
	.long	126
	.zero	4
	.quad	.LC212
	.long	127
	.zero	4
	.quad	.LC213
	.long	128
	.zero	4
	.quad	.LC214
	.long	129
	.zero	4
	.quad	.LC215
	.long	130
	.zero	4
	.quad	.LC216
	.long	131
	.zero	4
	.quad	.LC217
	.long	132
	.zero	4
	.quad	.LC218
	.long	133
	.zero	4
	.quad	.LC219
	.long	134
	.zero	4
	.quad	.LC220
	.long	135
	.zero	4
	.quad	.LC221
	.long	136
	.zero	4
	.quad	.LC222
	.long	137
	.zero	4
	.quad	.LC223
	.long	138
	.zero	4
	.quad	.LC224
	.long	139
	.zero	4
	.quad	.LC225
	.long	140
	.zero	4
	.quad	.LC226
	.long	141
	.zero	4
	.quad	.LC227
	.long	142
	.zero	4
	.quad	.LC228
	.long	143
	.zero	4
	.quad	.LC229
	.long	144
	.zero	4
	.quad	.LC230
	.long	145
	.zero	4
	.quad	.LC231
	.long	146
	.zero	4
	.quad	.LC232
	.long	147
	.zero	4
	.quad	.LC233
	.long	148
	.zero	4
	.quad	.LC234
	.long	149
	.zero	4
	.quad	.LC235
	.long	150
	.zero	4
	.quad	.LC236
	.long	151
	.zero	4
	.quad	.LC237
	.long	152
	.zero	4
	.quad	.LC238
	.long	153
	.zero	4
	.quad	.LC239
	.long	154
	.zero	4
	.quad	.LC240
	.long	155
	.zero	4
	.quad	.LC241
	.long	156
	.zero	4
	.quad	.LC242
	.long	157
	.zero	4
	.quad	.LC243
	.long	158
	.zero	4
	.quad	.LC244
	.long	159
	.zero	4
	.quad	.LC245
	.long	160
	.zero	4
	.quad	.LC246
	.long	161
	.zero	4
	.quad	.LC247
	.long	162
	.zero	4
	.quad	.LC248
	.long	163
	.zero	4
	.quad	.LC249
	.long	164
	.zero	4
	.quad	.LC250
	.long	165
	.zero	4
	.quad	.LC251
	.long	166
	.zero	4
	.quad	.LC252
	.long	167
	.zero	4
	.quad	.LC253
	.long	168
	.zero	4
	.quad	.LC254
	.long	169
	.zero	4
	.quad	.LC255
	.long	170
	.zero	4
	.quad	.LC256
	.long	171
	.zero	4
	.quad	.LC257
	.long	172
	.zero	4
	.quad	.LC258
	.long	173
	.zero	4
	.quad	.LC259
	.long	174
	.zero	4
	.quad	.LC260
	.long	175
	.zero	4
	.quad	.LC261
	.long	176
	.zero	4
	.quad	.LC262
	.long	177
	.zero	4
	.quad	.LC263
	.long	178
	.zero	4
	.quad	.LC264
	.long	179
	.zero	4
	.quad	.LC265
	.long	180
	.zero	4
	.quad	.LC266
	.long	181
	.zero	4
	.quad	.LC267
	.long	182
	.zero	4
	.quad	.LC268
	.long	183
	.zero	4
	.quad	.LC269
	.long	184
	.zero	4
	.quad	.LC270
	.long	185
	.zero	4
	.quad	.LC271
	.long	186
	.zero	4
	.quad	.LC272
	.long	187
	.zero	4
	.quad	.LC273
	.long	188
	.zero	4
	.quad	.LC274
	.long	189
	.zero	4
	.quad	.LC275
	.long	190
	.zero	4
	.quad	.LC276
	.long	191
	.zero	4
	.quad	.LC277
	.long	192
	.zero	4
	.quad	.LC278
	.long	193
	.zero	4
	.quad	.LC279
	.long	194
	.zero	4
	.quad	.LC280
	.long	195
	.zero	4
	.quad	.LC281
	.long	196
	.zero	4
	.quad	.LC282
	.long	197
	.zero	4
	.quad	.LC283
	.long	198
	.zero	4
	.quad	.LC284
	.long	199
	.zero	4
	.quad	.LC285
	.long	200
	.zero	4
	.quad	.LC286
	.long	201
	.zero	4
	.quad	.LC287
	.long	202
	.zero	4
	.quad	.LC288
	.long	203
	.zero	4
	.quad	.LC289
	.long	204
	.zero	4
	.quad	.LC290
	.long	205
	.zero	4
	.quad	.LC291
	.long	206
	.zero	4
	.quad	.LC292
	.long	207
	.zero	4
	.quad	.LC293
	.long	208
	.zero	4
	.quad	.LC294
	.long	209
	.zero	4
	.quad	.LC295
	.long	210
	.zero	4
	.quad	.LC296
	.long	211
	.zero	4
	.quad	.LC297
	.long	212
	.zero	4
	.quad	.LC298
	.long	213
	.zero	4
	.quad	.LC299
	.long	214
	.zero	4
	.quad	.LC300
	.long	215
	.zero	4
	.quad	.LC301
	.long	216
	.zero	4
	.quad	.LC302
	.long	217
	.zero	4
	.quad	.LC303
	.long	218
	.zero	4
	.quad	.LC304
	.long	219
	.zero	4
	.quad	.LC305
	.long	220
	.zero	4
	.quad	.LC306
	.long	221
	.zero	4
	.quad	.LC307
	.long	222
	.zero	4
	.quad	.LC308
	.long	223
	.zero	4
	.quad	.LC309
	.long	224
	.zero	4
	.quad	.LC310
	.long	225
	.zero	4
	.quad	.LC311
	.long	226
	.zero	4
	.quad	.LC312
	.long	227
	.zero	4
	.quad	.LC313
	.long	228
	.zero	4
	.quad	.LC314
	.long	229
	.zero	4
	.quad	.LC315
	.long	230
	.zero	4
	.quad	.LC316
	.long	231
	.zero	4
	.quad	.LC317
	.long	232
	.zero	4
	.quad	.LC318
	.long	233
	.zero	4
	.quad	.LC319
	.long	234
	.zero	4
	.quad	.LC320
	.long	235
	.zero	4
	.quad	.LC321
	.long	236
	.zero	4
	.quad	.LC322
	.long	237
	.zero	4
	.quad	.LC323
	.long	238
	.zero	4
	.quad	.LC324
	.long	239
	.zero	4
	.quad	.LC325
	.long	240
	.zero	4
	.quad	.LC326
	.long	241
	.zero	4
	.quad	.LC327
	.long	242
	.zero	4
	.quad	.LC328
	.long	243
	.zero	4
	.quad	.LC329
	.long	244
	.zero	4
	.quad	.LC330
	.long	245
	.zero	4
	.quad	.LC331
	.long	246
	.zero	4
	.quad	.LC332
	.long	247
	.zero	4
	.quad	.LC333
	.long	248
	.zero	4
	.quad	.LC334
	.long	249
	.zero	4
	.quad	.LC335
	.long	250
	.zero	4
	.quad	.LC336
	.long	251
	.zero	4
	.quad	.LC337
	.long	252
	.zero	4
	.quad	.LC338
	.long	253
	.zero	4
	.quad	.LC339
	.long	254
	.zero	4
	.quad	.LC340
	.long	255
	.zero	4
	.quad	.LC341
	.long	256
	.zero	4
	.quad	.LC342
	.long	257
	.zero	4
	.quad	.LC343
	.long	258
	.zero	4
	.quad	.LC344
	.long	259
	.zero	4
	.quad	.LC345
	.long	260
	.zero	4
	.quad	.LC346
	.long	261
	.zero	4
	.quad	.LC347
	.long	262
	.zero	4
	.quad	.LC348
	.long	263
	.zero	4
	.quad	.LC349
	.long	264
	.zero	4
	.quad	.LC350
	.long	265
	.zero	4
	.quad	.LC351
	.long	266
	.zero	4
	.quad	.LC352
	.long	267
	.zero	4
	.quad	.LC353
	.long	268
	.zero	4
	.quad	.LC354
	.long	269
	.zero	4
	.quad	.LC355
	.long	270
	.zero	4
	.quad	.LC356
	.long	271
	.zero	4
	.quad	.LC357
	.long	272
	.zero	4
	.quad	.LC358
	.long	273
	.zero	4
	.quad	.LC359
	.long	274
	.zero	4
	.quad	.LC360
	.long	275
	.zero	4
	.quad	.LC361
	.long	276
	.zero	4
	.quad	.LC362
	.long	277
	.zero	4
	.quad	.LC363
	.long	278
	.zero	4
	.quad	.LC364
	.long	279
	.zero	4
	.quad	.LC365
	.long	280
	.zero	4
	.quad	.LC366
	.long	281
	.zero	4
	.quad	.LC367
	.long	282
	.zero	4
	.quad	.LC368
	.long	283
	.zero	4
	.quad	.LC369
	.long	284
	.zero	4
	.quad	.LC370
	.long	285
	.zero	4
	.quad	.LC371
	.long	286
	.zero	4
	.quad	.LC372
	.long	287
	.zero	4
	.quad	.LC373
	.long	288
	.zero	4
	.quad	.LC374
	.long	289
	.zero	4
	.quad	.LC375
	.long	290
	.zero	4
	.quad	.LC376
	.long	291
	.zero	4
	.quad	.LC377
	.long	292
	.zero	4
	.quad	.LC378
	.long	293
	.zero	4
	.quad	.LC379
	.long	294
	.zero	4
	.quad	.LC380
	.long	295
	.zero	4
	.quad	.LC381
	.long	296
	.zero	4
	.quad	.LC382
	.long	297
	.zero	4
	.quad	.LC383
	.long	298
	.zero	4
	.quad	.LC384
	.long	299
	.zero	4
	.quad	.LC385
	.long	300
	.zero	4
	.quad	.LC386
	.long	301
	.zero	4
	.quad	.LC387
	.long	302
	.zero	4
	.quad	.LC388
	.long	303
	.zero	4
	.quad	.LC389
	.long	304
	.zero	4
	.quad	.LC390
	.long	305
	.zero	4
	.quad	.LC391
	.long	306
	.zero	4
	.quad	.LC392
	.long	307
	.zero	4
	.quad	.LC393
	.long	308
	.zero	4
	.quad	.LC394
	.long	309
	.zero	4
	.quad	.LC395
	.long	310
	.zero	4
	.quad	.LC396
	.long	311
	.zero	4
	.quad	.LC397
	.long	312
	.zero	4
	.quad	.LC398
	.long	313
	.zero	4
	.quad	.LC399
	.long	314
	.zero	4
	.quad	.LC400
	.long	315
	.zero	4
	.quad	.LC401
	.long	316
	.zero	4
	.quad	.LC402
	.long	317
	.zero	4
	.quad	.LC403
	.long	318
	.zero	4
	.quad	.LC404
	.long	319
	.zero	4
	.quad	.LC405
	.long	320
	.zero	4
	.quad	.LC406
	.long	321
	.zero	4
	.quad	.LC407
	.long	322
	.zero	4
	.quad	.LC408
	.long	323
	.zero	4
	.quad	.LC409
	.long	324
	.zero	4
	.quad	.LC410
	.long	325
	.zero	4
	.quad	.LC411
	.long	511
	.zero	4
	.quad	.LC19
	.long	-1
	.zero	4
	.quad	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC5:
	.long	0
	.long	1068498944
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC8:
	.quad	0
	.quad	20000000
	.section	.rodata.cst8
	.align 8
.LC20:
	.long	0
	.long	1089470464
	.align 8
.LC21:
	.long	-1840700270
	.long	1089620260
	.align 8
.LC22:
	.long	0
	.long	1051721728
	.ident	"GCC: (GNU) 15.2.1 20250808 (Red Hat 15.2.1-1)"
	.section	.note.GNU-stack,"",@progbits
