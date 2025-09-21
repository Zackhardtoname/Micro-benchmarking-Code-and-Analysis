	.file	"branchless.cpp"
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1757:
	.cfi_startproc
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1757:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4
	.type	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0, @function
_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0:
.LFB5055:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L7
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%rsi, 8(%rsp)
	call	strlen
	movq	8(%rsp), %rsi
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	movq	%rbx, %rdi
	movq	%rax, %rdx
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.L7:
	movq	(%rdi), %rax
	addq	-24(%rax), %rdi
	movl	32(%rdi), %esi
	orl	$1, %esi
	jmp	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
	.cfi_endproc
.LFE5055:
	.size	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0, .-_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	.section	.text._ZNSt13random_deviceC2Ev,"axG",@progbits,_ZNSt13random_deviceC5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt13random_deviceC2Ev
	.type	_ZNSt13random_deviceC2Ev, @function
_ZNSt13random_deviceC2Ev:
.LFB3232:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3232
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	leaq	16(%rsp), %rbx
	movq	%rsp, %rsi
	movl	$1634100580, 16(%rsp)
	movq	%rbx, (%rsp)
	movl	$1953264993, 19(%rsp)
	movq	$7, 8(%rsp)
	movb	$0, 23(%rsp)
.LEHB0:
	call	_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE0:
	movq	(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	.L8
	movq	16(%rsp), %rax
	leaq	1(%rax), %rsi
	call	_ZdlPvm
.L8:
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	movq	%rax, %rbx
.L10:
	movq	%rsp, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rdi
.LEHB1:
	call	_Unwind_Resume
.LEHE1:
	.cfi_endproc
.LFE3232:
	.section	.gcc_except_table._ZNSt13random_deviceC2Ev,"aG",@progbits,_ZNSt13random_deviceC5Ev,comdat
.LLSDA3232:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3232-.LLSDACSB3232
.LLSDACSB3232:
	.uleb128 .LEHB0-.LFB3232
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L11-.LFB3232
	.uleb128 0
	.uleb128 .LEHB1-.LFB3232
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE3232:
	.section	.text._ZNSt13random_deviceC2Ev,"axG",@progbits,_ZNSt13random_deviceC5Ev,comdat
	.size	_ZNSt13random_deviceC2Ev, .-_ZNSt13random_deviceC2Ev
	.weak	_ZNSt13random_deviceC1Ev
	.set	_ZNSt13random_deviceC1Ev,_ZNSt13random_deviceC2Ev
	.text
	.p2align 4
	.globl	_Z21increment_branch_freem
	.type	_Z21increment_branch_freem, @function
_Z21increment_branch_freem:
.LFB4119:
	.cfi_startproc
	movabsq	$4823603603198064275, %rdx
	movq	%rdi, %rax
	addq	%rdi, %rdi
	sarq	$63, %rax
	andq	%rdx, %rax
	xorq	%rdi, %rax
	ret
	.cfi_endproc
.LFE4119:
	.size	_Z21increment_branch_freem, .-_Z21increment_branch_freem
	.p2align 4
	.globl	_Z18increment_branchedm
	.type	_Z18increment_branchedm, @function
_Z18increment_branchedm:
.LFB4120:
	.cfi_startproc
	movabsq	$4823603603198064275, %rdx
	leaq	(%rdi,%rdi), %rax
	xorq	%rax, %rdx
	testq	%rdi, %rdi
	cmovs	%rdx, %rax
	ret
	.cfi_endproc
.LFE4120:
	.size	_Z18increment_branchedm, .-_Z18increment_branchedm
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Testing correctness...\n"
.LC1:
	.string	"Mismatch at iteration "
.LC2:
	.string	" with start value 0x"
.LC3:
	.string	": branch_free=0x"
.LC4:
	.string	", branched=0x"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"\342\234\223 Correctness test passed!\n\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4
	.globl	_Z16test_correctnessv
	.type	_Z16test_correctnessv, @function
_Z16test_correctnessv:
.LFB4122:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA4122
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$23, %edx
	movl	$.LC0, %esi
	movl	$_ZSt4cout, %edi
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
.LEHB2:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$48, %edi
	call	_Znwm
.LEHE2:
	movdqa	.LC6(%rip), %xmm0
	movabsq	$4823603603198064275, %rdx
	movq	%rax, %r13
	movq	%rax, %rsi
	leaq	48(%rax), %rdi
	movups	%xmm0, (%rax)
	movdqa	.LC7(%rip), %xmm0
	movups	%xmm0, 16(%rax)
	movdqa	.LC8(%rip), %xmm0
	movups	%xmm0, 32(%rax)
	.p2align 4
	.p2align 3
.L23:
	movq	(%rsi), %r14
	xorl	%r12d, %r12d
	movq	%r14, %rbx
	.p2align 6
	.p2align 4
	.p2align 3
.L22:
	leaq	(%rbx,%rbx), %rbp
	movq	%rbx, %rax
	sarq	$63, %rbx
	andq	%rdx, %rbx
	movq	%rbp, %rcx
	xorq	%rbp, %rbx
	xorq	%rdx, %rcx
	testq	%rax, %rax
	cmovs	%rcx, %rbp
	cmpq	%rbx, %rbp
	jne	.L34
	addl	$1, %r12d
	cmpl	$1000, %r12d
	jne	.L22
	addq	$8, %rsi
	cmpq	%rsi, %rdi
	jne	.L23
	movl	$30, %edx
	movl	$.LC5, %esi
	movl	$_ZSt4cout, %edi
.LEHB3:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.LEHE3:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r13, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 32
	movl	$48, %esi
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
.LEHB4:
	jmp	_ZdlPvm
.LEHE4:
.L34:
	.cfi_restore_state
	movl	$22, %edx
	movl	$.LC1, %esi
	movl	$_ZSt4cerr, %edi
.LEHB5:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r12d, %esi
	movl	$_ZSt4cerr, %edi
	call	_ZNSolsEi
	movl	$20, %edx
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	(%r12), %rax
	movq	%r14, %rsi
	movq	%r12, %rdi
	movq	-24(%rax), %rdx
	addq	%r12, %rdx
	movl	24(%rdx), %eax
	andl	$-75, %eax
	orl	$8, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertImEERSoT_
	movq	%rax, %r12
	movq	(%rax), %rax
	movl	$.LC3, %esi
	movq	%r12, %rdi
	movq	-24(%rax), %rdx
	addq	%r12, %rdx
	movl	24(%rdx), %eax
	andl	$-75, %eax
	orl	$2, %eax
	movl	%eax, 24(%rdx)
	movl	$16, %edx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	(%r12), %rax
	movq	%rbx, %rsi
	movq	%r12, %rdi
	movq	-24(%rax), %rdx
	addq	%r12, %rdx
	movl	24(%rdx), %eax
	andl	$-75, %eax
	orl	$8, %eax
	movl	%eax, 24(%rdx)
	call	_ZNSo9_M_insertImEERSoT_
	movl	$13, %edx
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	_ZNSo9_M_insertImEERSoT_
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	-24(%rax), %rdx
	addq	%rbp, %rdx
	movl	24(%rdx), %eax
	movq	240(%rdx), %rbx
	andl	$-75, %eax
	orl	$2, %eax
	movl	%eax, 24(%rdx)
	testq	%rbx, %rbx
	je	.L32
	cmpb	$0, 56(%rbx)
	je	.L20
	movsbl	67(%rbx), %esi
.L21:
	movq	%rbp, %rdi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	movl	$1, %edi
	call	exit
.L20:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L21
	movq	%rbx, %rdi
	call	*%rax
.LEHE5:
	movsbl	%al, %esi
	jmp	.L21
.L30:
	jmp	.L31
	.section	.gcc_except_table,"a",@progbits
.LLSDA4122:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4122-.LLSDACSB4122
.LLSDACSB4122:
	.uleb128 .LEHB2-.LFB4122
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB4122
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L30-.LFB4122
	.uleb128 0
	.uleb128 .LEHB4-.LFB4122
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB5-.LFB4122
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L30-.LFB4122
	.uleb128 0
.LLSDACSE4122:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDAC4122
	.type	_Z16test_correctnessv.cold, @function
_Z16test_correctnessv.cold:
.LFSB4122:
.L32:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
.LEHB6:
	call	_ZSt16__throw_bad_castv
.LEHE6:
.L26:
.L31:
	movq	%rax, %rbx
	movq	%r13, %rdi
	movl	$48, %esi
	call	_ZdlPvm
	movq	%rbx, %rdi
.LEHB7:
	call	_Unwind_Resume
.LEHE7:
	.cfi_endproc
.LFE4122:
	.section	.gcc_except_table
.LLSDAC4122:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC4122-.LLSDACSBC4122
.LLSDACSBC4122:
	.uleb128 .LEHB6-.LCOLDB9
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L26-.LCOLDB9
	.uleb128 0
	.uleb128 .LEHB7-.LCOLDB9
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSEC4122:
	.section	.text.unlikely
	.text
	.size	_Z16test_correctnessv, .-_Z16test_correctnessv
	.section	.text.unlikely
	.size	_Z16test_correctnessv.cold, .-_Z16test_correctnessv.cold
.LCOLDE9:
	.text
.LHOTE9:
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Demonstrating LFSR cycle properties:\n"
	.align 8
.LC11:
	.string	"First 10 values starting from 1:\n"
	.section	.rodata.str1.1
.LC12:
	.string	"  "
.LC13:
	.string	": 0x"
.LC14:
	.string	"\n0 -> 0x"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	" (should be 0 - degenerate case)\n\n"
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4
	.globl	_Z17demonstrate_cyclev
	.type	_Z17demonstrate_cyclev, @function
_Z17demonstrate_cyclev:
.LFB4127:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$37, %edx
	movl	$.LC10, %esi
	movl	$_ZSt4cout, %edi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movabsq	$4823603603198064275, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	$1, %ebx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$33, %edx
	movl	$.LC11, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L46:
	movsbl	67(%rbp), %esi
.L38:
	movq	%r14, %rdi
	addl	$1, %r12d
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	movq	%rbx, %rax
	addq	%rbx, %rbx
	sarq	$63, %rax
	andq	%r13, %rax
	xorq	%rax, %rbx
	cmpl	$10, %r12d
	je	.L45
.L39:
	movl	$2, %edx
	movl	$.LC12, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movl	%r12d, %esi
	movl	$_ZSt4cout, %edi
	movq	-24(%rax), %rax
	movq	$2, _ZSt4cout+16(%rax)
	call	_ZNSolsEi
	movl	$4, %edx
	movl	$.LC13, %esi
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	0(%rbp), %rcx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	movq	-24(%rcx), %rdx
	addq	%rbp, %rdx
	movl	24(%rdx), %eax
	movq	$16, 16(%rdx)
	andl	$-75, %eax
	orl	$8, %eax
	movl	%eax, 24(%rdx)
	movq	-24(%rcx), %rax
	movl	$304, %edx
	movw	%dx, 224(%rbp,%rax)
	call	_ZNSo9_M_insertImEERSoT_
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rdx
	addq	%r14, %rdx
	movl	24(%rdx), %eax
	movq	240(%rdx), %rbp
	andl	$-75, %eax
	orl	$2, %eax
	movl	%eax, 24(%rdx)
	testq	%rbp, %rbp
	je	.L43
	cmpb	$0, 56(%rbp)
	jne	.L46
	movq	%rbp, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	0(%rbp), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L38
	movq	%rbp, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L45:
	movl	$8, %edx
	movl	$.LC14, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	xorl	%esi, %esi
	movl	$_ZSt4cout, %edi
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	andl	$-75, %eax
	orl	$8, %eax
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertImEERSoT_
	movl	$.LC15, %esi
	movq	%rax, %rdi
	movq	(%rax), %rax
	movq	-24(%rax), %rdx
	addq	%rdi, %rdx
	movl	24(%rdx), %eax
	andl	$-75, %eax
	orl	$2, %eax
	movl	%eax, 24(%rdx)
	movl	$34, %edx
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
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	_Z17demonstrate_cyclev.cold, @function
_Z17demonstrate_cyclev.cold:
.LFSB4127:
.L43:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE4127:
	.text
	.size	_Z17demonstrate_cyclev, .-_Z17demonstrate_cyclev
	.section	.text.unlikely
	.size	_Z17demonstrate_cyclev.cold, .-_Z17demonstrate_cyclev.cold
.LCOLDE16:
	.text
.LHOTE16:
	.section	.text._ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv:
.LFB5001:
	.cfi_startproc
	movq	$-2147483648, %rcx
	movl	$2147483647, %esi
	movq	%rdi, %rdx
	movdqa	.LC20(%rip), %xmm4
	movq	%rcx, %xmm7
	movl	$1, %ecx
	movq	%rsi, %xmm6
	movq	%rcx, %xmm5
	movdqa	%xmm4, %xmm8
	leaq	1248(%rdi), %rax
	punpcklqdq	%xmm7, %xmm7
	punpcklqdq	%xmm6, %xmm6
	punpcklqdq	%xmm5, %xmm5
	psrlq	$32, %xmm8
	.p2align 4
	.p2align 3
.L48:
	movdqu	(%rdx), %xmm0
	movdqu	8(%rdx), %xmm1
	addq	$16, %rdx
	movdqu	1232(%rdx), %xmm2
	pand	%xmm6, %xmm1
	pand	%xmm7, %xmm0
	por	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	pand	%xmm5, %xmm0
	psrlq	$1, %xmm1
	movdqa	%xmm0, %xmm3
	pxor	%xmm1, %xmm2
	pmuludq	%xmm4, %xmm3
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm1
	pmuludq	%xmm8, %xmm0
	pmuludq	%xmm4, %xmm1
	paddq	%xmm0, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm1, %xmm3
	movdqa	%xmm3, %xmm0
	pxor	%xmm2, %xmm0
	movups	%xmm0, -16(%rdx)
	cmpq	%rdx, %rax
	jne	.L48
	movl	$2147483647, %ecx
	movq	$-2147483648, %rsi
	leaq	2480(%rdi), %rdx
	movq	%rcx, %xmm6
	movq	%rsi, %xmm7
	movl	$1, %esi
	movabsq	$-5403634167711393303, %rcx
	movq	%rcx, %xmm4
	movq	%rsi, %xmm5
	punpcklqdq	%xmm7, %xmm7
	punpcklqdq	%xmm4, %xmm4
	punpcklqdq	%xmm6, %xmm6
	punpcklqdq	%xmm5, %xmm5
	movdqa	%xmm4, %xmm8
	psrlq	$32, %xmm8
	.p2align 4
	.p2align 3
.L49:
	movdqu	(%rax), %xmm0
	movdqu	8(%rax), %xmm1
	addq	$16, %rax
	movdqu	-1264(%rax), %xmm2
	pand	%xmm6, %xmm1
	pand	%xmm7, %xmm0
	por	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	pand	%xmm5, %xmm0
	psrlq	$1, %xmm1
	movdqa	%xmm0, %xmm3
	pxor	%xmm1, %xmm2
	pmuludq	%xmm4, %xmm3
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm1
	pmuludq	%xmm8, %xmm0
	pmuludq	%xmm4, %xmm1
	paddq	%xmm0, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm1, %xmm3
	movdqa	%xmm3, %xmm0
	pxor	%xmm2, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rax, %rdx
	jne	.L49
	movq	2488(%rdi), %rsi
	movq	2480(%rdi), %rax
	movq	$0, 2496(%rdi)
	movq	%rsi, %rdx
	andq	$-2147483648, %rax
	andq	$-2147483648, %rsi
	andl	$2147483647, %edx
	orq	%rdx, %rax
	movq	%rax, %rdx
	andl	$1, %eax
	negq	%rax
	shrq	%rdx
	xorq	1232(%rdi), %rdx
	andq	%rcx, %rax
	xorq	%rdx, %rax
	movq	%rax, 2480(%rdi)
	movq	(%rdi), %rax
	andl	$2147483647, %eax
	orq	%rsi, %rax
	movq	%rax, %rdx
	andl	$1, %eax
	negq	%rax
	shrq	%rdx
	xorq	1240(%rdi), %rdx
	andq	%rcx, %rax
	xorq	%rdx, %rax
	movq	%rax, 2488(%rdi)
	ret
	.cfi_endproc
.LFE5001:
	.size	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv, .-_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	.section	.rodata.str1.1
.LC23:
	.string	"RPCID Generator Benchmark\n"
.LC24:
	.string	"========================\n\n"
.LC25:
	.string	"vector::_M_realloc_append"
.LC26:
	.string	"Running benchmarks with "
.LC27:
	.string	" iterations...\n"
.LC28:
	.string	"Each test repeated "
.LC29:
	.string	" times\n\n"
.LC30:
	.string	"Run "
.LC31:
	.string	"/"
.LC32:
	.string	":\n"
.LC34:
	.string	"  Branch-free: "
.LC35:
	.string	" ns/op\n"
.LC36:
	.string	"  Branched:    "
.LC37:
	.string	"  Speedup:     "
.LC38:
	.string	"x\n\n"
.LC39:
	.string	"Best Results:\n"
.LC40:
	.string	"=============\n"
.LC41:
	.string	"Branch-free: "
.LC42:
	.string	"Branched:    "
.LC43:
	.string	"Speedup:     "
.LC44:
	.string	"x\n"
.LC46:
	.string	"\nThroughput:\n"
.LC47:
	.string	" ops/sec\n"
	.section	.text.unlikely
.LCOLDB48:
	.section	.text.startup,"ax",@progbits
.LHOTB48:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4128:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA4128
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC23, %esi
	movl	$_ZSt4cout, %edi
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
	subq	$7592, %rsp
	.cfi_def_cfa_offset 7648
.LEHB8:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$.LC24, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	call	_Z16test_correctnessv
	call	_Z17demonstrate_cyclev
	leaq	2576(%rsp), %rdi
	call	_ZNSt13random_deviceC1Ev
.LEHE8:
	leaq	2576(%rsp), %rdi
.LEHB9:
	call	_ZNSt13random_device9_M_getvalEv
	movl	%eax, %edx
	movl	$1, %ecx
	leaq	64(%rsp), %r12
	movabsq	$6364136223846793005, %rsi
	movq	%rdx, 64(%rsp)
	.p2align 6
	.p2align 4
	.p2align 3
.L53:
	movq	%rdx, %rax
	shrq	$62, %rax
	xorq	%rdx, %rax
	imulq	%rsi, %rax
	leaq	(%rax,%rcx), %rdx
	movq	%rdx, (%r12,%rcx,8)
	addq	$1, %rcx
	cmpq	$312, %rcx
	jne	.L53
	movl	$80000, %edi
	movq	%rcx, (%rsp)
	movq	$312, 2560(%rsp)
	call	_Znwm
.LEHE9:
	movq	(%rsp), %rcx
	movq	%rax, %r8
	movq	%rax, %rbx
	movl	$10000, %r13d
	leaq	80000(%rax), %rbp
	movabsq	$8202884508482404352, %r14
	movabsq	$-2270628950310912, %r15
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L54:
	movabsq	$6148914691236517205, %rdi
	leaq	1(%rax), %rcx
	movq	64(%rsp,%rax,8), %rax
	movq	%rcx, 2560(%rsp)
	movq	%rax, %rdx
	shrq	$29, %rdx
	andq	%rdi, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$17, %rdx
	andq	%r14, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	salq	$37, %rdx
	andq	%r15, %rdx
	xorq	%rdx, %rax
	movq	%rax, %rdx
	movq	%rax, %rsi
	shrq	$43, %rdx
	xorq	%rdx, %rsi
	cmpq	%rdx, %rax
	movl	$1, %eax
	cmove	%rax, %rsi
	cmpq	%r8, %rbp
	je	.L56
	movq	%rsi, (%r8)
	addq	$8, %r8
	subq	$1, %r13
	je	.L101
.L61:
	movq	%rcx, %rax
	cmpq	$311, %rcx
	jbe	.L54
	movq	%r12, %rdi
	movq	%r8, (%rsp)
	call	_ZNSt23mersenne_twister_engineImLm64ELm312ELm156ELm31ELm13043109905998158313ELm29ELm6148914691236517205ELm17ELm8202884508482404352ELm37ELm18444473444759240704ELm43ELm6364136223846793005EE11_M_gen_randEv
	movq	2560(%rsp), %rax
	movq	(%rsp), %r8
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L56:
	movabsq	$1152921504606846975, %rax
	movq	%rbp, %rdx
	subq	%rbx, %rdx
	movq	%rdx, %rdi
	sarq	$3, %rdi
	cmpq	%rax, %rdi
	je	.L98
	testq	%rdi, %rdi
	movl	$1, %eax
	movq	%rdx, 24(%rsp)
	cmovne	%rdi, %rax
	movq	%rsi, 16(%rsp)
	movq	%rcx, 8(%rsp)
	addq	%rdi, %rax
	movabsq	$1152921504606846975, %rdi
	cmpq	%rdi, %rax
	cmova	%rdi, %rax
	salq	$3, %rax
	movq	%rax, %rdi
	movq	%rax, (%rsp)
.LEHB10:
	call	_Znwm
	movq	24(%rsp), %rdx
	movq	16(%rsp), %rsi
	movq	%rax, %r10
	movq	8(%rsp), %rcx
	testq	%rdx, %rdx
	movq	%rsi, (%rax,%rdx)
	je	.L59
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rcx, 16(%rsp)
	movq	%rdx, 8(%rsp)
	call	memcpy
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rdx
	movq	%rax, %r10
.L59:
	leaq	8(%r10,%rdx), %r8
	testq	%rbx, %rbx
	je	.L60
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	%r10, 24(%rsp)
	subq	%rbx, %rsi
	movq	%r8, 16(%rsp)
	movq	%rcx, 8(%rsp)
	call	_ZdlPvm
	movq	24(%rsp), %r10
	movq	16(%rsp), %r8
	movq	8(%rsp), %rcx
.L60:
	movq	(%rsp), %rbp
	movq	%r10, %rbx
	addq	%r10, %rbp
	subq	$1, %r13
	jne	.L61
.L101:
	movl	$24, %edx
	movl	$.LC26, %esi
	movl	$_ZSt4cout, %edi
	movq	%r8, (%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$100000000, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSo9_M_insertImEERSoT_
	movl	$.LC27, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$19, %edx
	movl	$.LC28, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$5, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSo9_M_insertImEERSoT_
	movl	$.LC29, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movq	(%rsp), %r8
	xorl	%r13d, %r13d
	movsd	.LC22(%rip), %xmm7
	movabsq	$4823603603198064275, %r15
	subq	%rbx, %r8
	movsd	%xmm7, 8(%rsp)
	movq	%r8, %r12
	movsd	%xmm7, 16(%rsp)
	sarq	$3, %r12
.L68:
	movl	$4, %edx
	movl	$.LC30, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	addq	$1, %r13
	movl	$_ZSt4cout, %edi
	movq	%r13, %rsi
	call	_ZNSo9_M_insertImEERSoT_
	movl	$1, %edx
	movl	$.LC31, %esi
	movq	%rax, %rdi
	movq	%rax, %r14
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$5, %esi
	movq	%r14, %rdi
	call	_ZNSo9_M_insertImEERSoT_
	movl	$2, %edx
	movl	$.LC32, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	$0, 32(%rsp)
	xorl	%ecx, %ecx
	.p2align 6
	.p2align 4
	.p2align 3
.L62:
	movq	%rcx, %rax
	xorl	%edx, %edx
	movq	32(%rsp), %rsi
	addq	$1, %rcx
	divq	%r12
	movq	(%rbx,%rdx,8), %rdx
	movq	%rdx, %rax
	addq	%rdx, %rdx
	sarq	$63, %rax
	andq	%r15, %rax
	xorq	%rdx, %rax
	addq	%rsi, %rax
	movq	%rax, 32(%rsp)
	cmpq	$1000000, %rcx
	jne	.L62
	call	_ZNSt6chrono3_V212system_clock3nowEv
	xorl	%ecx, %ecx
	movq	$0, 40(%rsp)
	movq	%rax, %r14
	.p2align 6
	.p2align 4
	.p2align 3
.L63:
	movq	%rcx, %rax
	xorl	%edx, %edx
	movq	40(%rsp), %rsi
	addq	$1, %rcx
	divq	%r12
	movq	(%rbx,%rdx,8), %rdx
	movq	%rdx, %rax
	addq	%rdx, %rdx
	sarq	$63, %rax
	andq	%r15, %rax
	xorq	%rdx, %rax
	addq	%rsi, %rax
	movq	%rax, 40(%rsp)
	cmpq	$100000000, %rcx
	jne	.L63
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rcx
	pxor	%xmm0, %xmm0
	subq	%r14, %rax
	addq	%rcx, %rdx
	cvtsi2sdq	%rax, %xmm0
	xorl	%ecx, %ecx
	divsd	.LC33(%rip), %xmm0
	movq	%rdx, 32(%rsp)
	movq	$0, 48(%rsp)
	movsd	%xmm0, (%rsp)
	.p2align 6
	.p2align 4
	.p2align 3
.L65:
	movq	%rcx, %rax
	xorl	%edx, %edx
	divq	%r12
	movq	(%rbx,%rdx,8), %rdx
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rsi
	xorq	%r15, %rsi
	testq	%rdx, %rdx
	movq	48(%rsp), %rdx
	cmovs	%rsi, %rax
	addq	$1, %rcx
	addq	%rdx, %rax
	movq	%rax, 48(%rsp)
	cmpq	$1000000, %rcx
	jne	.L65
	call	_ZNSt6chrono3_V212system_clock3nowEv
	xorl	%ecx, %ecx
	movq	$0, 56(%rsp)
	movq	%rax, %r14
	.p2align 6
	.p2align 4
	.p2align 3
.L67:
	movq	%rcx, %rax
	xorl	%edx, %edx
	divq	%r12
	movq	(%rbx,%rdx,8), %rdx
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rsi
	xorq	%r15, %rsi
	testq	%rdx, %rdx
	movq	56(%rsp), %rdx
	cmovs	%rsi, %rax
	addq	$1, %rcx
	addq	%rdx, %rax
	movq	%rax, 56(%rsp)
	cmpq	$100000000, %rcx
	jne	.L67
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	56(%rsp), %rdx
	pxor	%xmm0, %xmm0
	movq	48(%rsp), %rcx
	subq	%r14, %rax
	movsd	(%rsp), %xmm1
	minsd	16(%rsp), %xmm1
	movl	$.LC34, %esi
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC33(%rip), %xmm0
	movapd	%xmm0, %xmm2
	minsd	8(%rsp), %xmm2
	addq	%rcx, %rdx
	movl	$_ZSt4cout, %edi
	movq	%xmm0, %r14
	movq	%rdx, 48(%rsp)
	movl	$15, %edx
	movsd	%xmm1, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movsd	(%rsp), %xmm0
	movl	$_ZSt4cout, %edi
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	movq	$3, _ZSt4cout+8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$7, %edx
	movl	$.LC35, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$15, %edx
	movl	$.LC36, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	%r14, %xmm0
	movl	$_ZSt4cout, %edi
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	movq	$3, _ZSt4cout+8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$7, %edx
	movl	$.LC35, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$15, %edx
	movl	$.LC37, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	%r14, %xmm3
	movl	$_ZSt4cout, %edi
	divsd	(%rsp), %xmm3
	movapd	%xmm3, %xmm0
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	movq	$2, _ZSt4cout+8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$3, %edx
	movl	$.LC38, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	cmpq	$5, %r13
	jne	.L68
	movl	$.LC39, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$.LC40, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$13, %edx
	movl	$.LC41, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movsd	16(%rsp), %xmm0
	movl	$_ZSt4cout, %edi
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	movq	$3, _ZSt4cout+8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$.LC35, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$13, %edx
	movl	$.LC42, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movsd	8(%rsp), %xmm0
	movl	$_ZSt4cout, %edi
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	movq	$3, _ZSt4cout+8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$.LC35, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$13, %edx
	movl	$.LC43, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movsd	8(%rsp), %xmm6
	movl	$_ZSt4cout, %edi
	divsd	16(%rsp), %xmm6
	movapd	%xmm6, %xmm0
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	movq	$2, _ZSt4cout+8(%rdx)
	andl	$-261, %eax
	orl	$4, %eax
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$.LC44, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movsd	.LC45(%rip), %xmm0
	movl	$.LC46, %esi
	movl	$_ZSt4cout, %edi
	movapd	%xmm0, %xmm4
	divsd	8(%rsp), %xmm0
	divsd	16(%rsp), %xmm4
	movq	%xmm0, %r12
	movq	%xmm4, %r13
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$13, %edx
	movl	$.LC41, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	%r13, %xmm0
	movl	$_ZSt4cout, %edi
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	movq	$2, _ZSt4cout+8(%rdx)
	andl	$-261, %eax
	orb	$1, %ah
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$.LC47, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
	movl	$13, %edx
	movl	$.LC42, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	%r12, %xmm0
	movl	$_ZSt4cout, %edi
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	movq	$2, _ZSt4cout+8(%rdx)
	andl	$-261, %eax
	orb	$1, %ah
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$.LC47, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc.isra.0
.LEHE10:
	testq	%rbx, %rbx
	je	.L69
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	subq	%rbx, %rsi
	call	_ZdlPvm
.L69:
	leaq	2576(%rsp), %rdi
	call	_ZNSt13random_device7_M_finiEv
	addq	$7592, %rsp
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
.L75:
	.cfi_restore_state
	movq	%rax, %r12
	jmp	.L72
.L96:
	jmp	.L97
	.section	.gcc_except_table
.LLSDA4128:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4128-.LLSDACSB4128
.LLSDACSB4128:
	.uleb128 .LEHB8-.LFB4128
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB9-.LFB4128
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L75-.LFB4128
	.uleb128 0
	.uleb128 .LEHB10-.LFB4128
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L96-.LFB4128
	.uleb128 0
.LLSDACSE4128:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDAC4128
	.type	main.cold, @function
main.cold:
.LFSB4128:
.L98:
	.cfi_def_cfa_offset 7648
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$.LC25, %edi
.LEHB11:
	call	_ZSt20__throw_length_errorPKc
.LEHE11:
.L76:
.L97:
	movq	%rax, %r12
	testq	%rbx, %rbx
	je	.L72
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	subq	%rbx, %rsi
	call	_ZdlPvm
.L72:
	leaq	2576(%rsp), %rdi
	call	_ZNSt13random_device7_M_finiEv
	movq	%r12, %rdi
.LEHB12:
	call	_Unwind_Resume
.LEHE12:
	.cfi_endproc
.LFE4128:
	.section	.gcc_except_table
.LLSDAC4128:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC4128-.LLSDACSBC4128
.LLSDACSBC4128:
	.uleb128 .LEHB11-.LCOLDB48
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L76-.LCOLDB48
	.uleb128 0
	.uleb128 .LEHB12-.LCOLDB48
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
.LLSDACSEC4128:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE48:
	.section	.text.startup
.LHOTE48:
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.quad	1
	.quad	-9223372036854775808
	.align 16
.LC7:
	.quad	9223372036854775807
	.quad	-6148914691236517206
	.align 16
.LC8:
	.quad	6148914691236517205
	.quad	-2401053089206453570
	.align 16
.LC20:
	.quad	-5403634167711393303
	.quad	-5403634167711393303
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC22:
	.long	-1
	.long	2146435071
	.align 8
.LC33:
	.long	0
	.long	1100470148
	.align 8
.LC45:
	.long	0
	.long	1104006501
	.globl	__gxx_personality_v0
	.ident	"GCC: (GNU) 15.2.1 20250808 (Red Hat 15.2.1-1)"
	.section	.note.GNU-stack,"",@progbits
