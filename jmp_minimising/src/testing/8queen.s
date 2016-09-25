	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	__Z7Ifblockii
	.align	4, 0x90
__Z7Ifblockii:                          ## @_Z7Ifblockii
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %esi
	movl	%esi, -20(%rbp)
	movl	-12(%rbp), %esi
	movl	%esi, -24(%rbp)
	movl	-8(%rbp), %esi
	subl	$1, %esi
	movl	%esi, -16(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$0, -16(%rbp)
	jle	LBB0_12
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	_a(%rip), %rax
	movslq	-12(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	imulq	$36, %rdx, %rdx
	addq	%rdx, %rax
	cmpl	$1, (%rax,%rcx,4)
	jne	LBB0_4
## BB#3:
	movl	$0, -4(%rbp)
	jmp	LBB0_13
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$4294967295, %eax       ## imm = 0xFFFFFFFF
	movl	%eax, -20(%rbp)
	cmpl	$0, %eax
	jle	LBB0_7
## BB#5:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	_a(%rip), %rax
	movslq	-20(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	imulq	$36, %rdx, %rdx
	addq	%rdx, %rax
	cmpl	$1, (%rax,%rcx,4)
	jne	LBB0_7
## BB#6:
	movl	$0, -4(%rbp)
	jmp	LBB0_13
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	cmpl	$9, %eax
	jge	LBB0_10
## BB#8:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	_a(%rip), %rax
	movslq	-24(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	imulq	$36, %rdx, %rdx
	addq	%rdx, %rax
	cmpl	$1, (%rax,%rcx,4)
	jne	LBB0_10
## BB#9:
	movl	$0, -4(%rbp)
	jmp	LBB0_13
LBB0_10:                                ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_11
LBB0_11:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$4294967295, %eax       ## imm = 0xFFFFFFFF
	movl	%eax, -16(%rbp)
	jmp	LBB0_1
LBB0_12:
	movl	$1, -4(%rbp)
LBB0_13:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__Z3DFSi
	.align	4, 0x90
__Z3DFSi:                               ## @_Z3DFSi
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movl	%edi, -24(%rbp)
	cmpl	$9, -24(%rbp)
	jne	LBB1_12
## BB#1:
	movl	_num(%rip), %eax
	addl	$1, %eax
	movl	%eax, _num(%rip)
	cmpl	$10, _num(%rip)
	jg	LBB1_11
## BB#2:
	movl	$1, -32(%rbp)
LBB1_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_5 Depth 2
	cmpl	$9, -32(%rbp)
	jge	LBB1_10
## BB#4:                                ##   in Loop: Header=BB1_3 Depth=1
	movl	$1, -36(%rbp)
LBB1_5:                                 ##   Parent Loop BB1_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$9, -36(%rbp)
	jge	LBB1_8
## BB#6:                                ##   in Loop: Header=BB1_5 Depth=2
	leaq	L_.str(%rip), %rdi
	leaq	_a(%rip), %rax
	movslq	-36(%rbp), %rcx
	movslq	-32(%rbp), %rdx
	imulq	$36, %rdx, %rdx
	addq	%rdx, %rax
	movl	(%rax,%rcx,4), %esi
	movb	$0, %al
	callq	_printf
	movl	%eax, -40(%rbp)         ## 4-byte Spill
## BB#7:                                ##   in Loop: Header=BB1_5 Depth=2
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB1_5
LBB1_8:                                 ##   in Loop: Header=BB1_3 Depth=1
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	movl	$10, %esi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	movq	%rax, -48(%rbp)         ## 8-byte Spill
## BB#9:                                ##   in Loop: Header=BB1_3 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB1_3
LBB1_10:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	movl	$10, %esi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rdi
	movq	%rax, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	*-16(%rbp)
	movq	%rax, -56(%rbp)         ## 8-byte Spill
LBB1_11:
	movl	$1, -20(%rbp)
	jmp	LBB1_19
LBB1_12:
	movl	$1, -28(%rbp)
LBB1_13:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$9, -28(%rbp)
	jge	LBB1_18
## BB#14:                               ##   in Loop: Header=BB1_13 Depth=1
	movl	-24(%rbp), %edi
	movl	-28(%rbp), %esi
	callq	__Z7Ifblockii
	cmpl	$0, %eax
	je	LBB1_16
## BB#15:                               ##   in Loop: Header=BB1_13 Depth=1
	leaq	_a(%rip), %rax
	movslq	-28(%rbp), %rcx
	movslq	-24(%rbp), %rdx
	imulq	$36, %rdx, %rdx
	addq	%rdx, %rax
	movl	$1, (%rax,%rcx,4)
	movl	-24(%rbp), %esi
	addl	$1, %esi
	movl	%esi, %edi
	callq	__Z3DFSi
	leaq	_a(%rip), %rcx
	movslq	-28(%rbp), %rdx
	movslq	-24(%rbp), %r8
	imulq	$36, %r8, %r8
	addq	%r8, %rcx
	movl	$0, (%rcx,%rdx,4)
	movl	%eax, -60(%rbp)         ## 4-byte Spill
LBB1_16:                                ##   in Loop: Header=BB1_13 Depth=1
	jmp	LBB1_17
LBB1_17:                                ##   in Loop: Header=BB1_13 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB1_13
LBB1_18:
	movl	$1, -20(%rbp)
LBB1_19:
	movl	-20(%rbp), %eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__textcoal_nt,coalesced,pure_instructions
	.globl	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	.weak_def_can_be_hidden	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	.align	4, 0x90
__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c: ## @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movb	%sil, %al
	leaq	-9(%rbp), %rsi
	movl	$1, %ecx
	movl	%ecx, %edx
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.private_extern	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.globl	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.weak_definition	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.align	4, 0x90
__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_: ## @_ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
## BB#0:
	pushq	%rbp
Ltmp17:
	.cfi_def_cfa_offset 16
Ltmp18:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp19:
	.cfi_def_cfa_register %rbp
	subq	$144, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rdi, %rax
	movq	(%rdi), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rdi
	movq	%rdi, -32(%rbp)
	movb	$10, -33(%rbp)
	movq	-32(%rbp), %rsi
	leaq	-48(%rbp), %rcx
	movq	%rcx, %rdi
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	movq	%rcx, -88(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__18ios_base6getlocEv
	movq	-88(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -24(%rbp)
Ltmp9:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp10:
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	jmp	LBB3_1
LBB3_1:                                 ## %_ZNSt3__19use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE.exit.i
	movb	-33(%rbp), %al
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	56(%rsi), %rsi
	movsbl	-9(%rbp), %edi
Ltmp11:
	movl	%edi, -100(%rbp)        ## 4-byte Spill
	movq	%rdx, %rdi
	movl	-100(%rbp), %r8d        ## 4-byte Reload
	movq	%rsi, -112(%rbp)        ## 8-byte Spill
	movl	%r8d, %esi
	movq	-112(%rbp), %rdx        ## 8-byte Reload
	callq	*%rdx
Ltmp12:
	movb	%al, -113(%rbp)         ## 1-byte Spill
	jmp	LBB3_5
LBB3_2:
Ltmp13:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
Ltmp14:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp15:
	jmp	LBB3_3
LBB3_3:
	movq	-56(%rbp), %rdi
	callq	__Unwind_Resume
LBB3_4:
Ltmp16:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -120(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
LBB3_5:                                 ## %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc.exit
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movq	-80(%rbp), %rdi         ## 8-byte Reload
	movb	-113(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %esi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	-72(%rbp), %rdi
	movq	%rax, -128(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	movq	-72(%rbp), %rdi
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	movq	%rdi, %rax
	addq	$144, %rsp
	popq	%rbp
	retq
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table3:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\274"                  ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	52                      ## Call site table length
Lset0 = Lfunc_begin3-Lfunc_begin3       ## >> Call Site 1 <<
	.long	Lset0
Lset1 = Ltmp9-Lfunc_begin3              ##   Call between Lfunc_begin3 and Ltmp9
	.long	Lset1
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset2 = Ltmp9-Lfunc_begin3              ## >> Call Site 2 <<
	.long	Lset2
Lset3 = Ltmp12-Ltmp9                    ##   Call between Ltmp9 and Ltmp12
	.long	Lset3
Lset4 = Ltmp13-Lfunc_begin3             ##     jumps to Ltmp13
	.long	Lset4
	.byte	0                       ##   On action: cleanup
Lset5 = Ltmp14-Lfunc_begin3             ## >> Call Site 3 <<
	.long	Lset5
Lset6 = Ltmp15-Ltmp14                   ##   Call between Ltmp14 and Ltmp15
	.long	Lset6
Lset7 = Ltmp16-Lfunc_begin3             ##     jumps to Ltmp16
	.long	Lset7
	.byte	1                       ##   On action: 1
Lset8 = Ltmp15-Lfunc_begin3             ## >> Call Site 4 <<
	.long	Lset8
Lset9 = Lfunc_end3-Ltmp15               ##   Call between Ltmp15 and Lfunc_end3
	.long	Lset9
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.align	2

	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp20:
	.cfi_def_cfa_offset 16
Ltmp21:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp22:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -20(%rbp)
	movl	$1, -24(%rbp)
	movl	-24(%rbp), %edi
	callq	__Z3DFSi
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str1(%rip), %rsi
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movl	_num(%rip), %esi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rdi
	movq	%rax, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	*-16(%rbp)
	leaq	L_.str2(%rip), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	xorl	%ecx, %ecx
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	movl	%ecx, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__textcoal_nt,coalesced,pure_instructions
	.globl	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.weak_def_can_be_hidden	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.align	4, 0x90
__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc: ## @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp23:
	.cfi_def_cfa_offset 16
Ltmp24:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp25:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__111char_traitsIcE6lengthEPKc
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	-32(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
## BB#0:
	pushq	%rbp
Ltmp56:
	.cfi_def_cfa_offset 16
Ltmp57:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp58:
	.cfi_def_cfa_register %rbp
	subq	$416, %rsp              ## imm = 0x1A0
	movq	%rdi, -200(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%rdx, -216(%rbp)
	movq	-200(%rbp), %rsi
Ltmp26:
	leaq	-232(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp27:
	jmp	LBB6_1
LBB6_1:
	leaq	-232(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	movb	(%rax), %cl
	movb	%cl, -265(%rbp)         ## 1-byte Spill
## BB#2:
	movb	-265(%rbp), %al         ## 1-byte Reload
	testb	$1, %al
	jne	LBB6_3
	jmp	LBB6_26
LBB6_3:
	leaq	-256(%rbp), %rax
	movq	-200(%rbp), %rcx
	movq	%rax, -176(%rbp)
	movq	%rcx, -184(%rbp)
	movq	-176(%rbp), %rax
	movq	-184(%rbp), %rcx
	movq	%rax, -144(%rbp)
	movq	%rcx, -152(%rbp)
	movq	-144(%rbp), %rax
	movq	-152(%rbp), %rcx
	movq	(%rcx), %rdx
	movq	-24(%rdx), %rdx
	addq	%rdx, %rcx
	movq	%rcx, -136(%rbp)
	movq	-136(%rbp), %rcx
	movq	%rcx, -128(%rbp)
	movq	-128(%rbp), %rcx
	movq	40(%rcx), %rcx
	movq	%rcx, (%rax)
	movq	-208(%rbp), %rsi
	movq	-200(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movl	8(%rax), %edi
	movq	%rsi, -280(%rbp)        ## 8-byte Spill
	movl	%edi, -284(%rbp)        ## 4-byte Spill
## BB#4:
	movl	-284(%rbp), %eax        ## 4-byte Reload
	andl	$176, %eax
	cmpl	$32, %eax
	jne	LBB6_6
## BB#5:
	movq	-208(%rbp), %rax
	addq	-216(%rbp), %rax
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	jmp	LBB6_7
LBB6_6:
	movq	-208(%rbp), %rax
	movq	%rax, -296(%rbp)        ## 8-byte Spill
LBB6_7:
	movq	-296(%rbp), %rax        ## 8-byte Reload
	movq	-208(%rbp), %rcx
	addq	-216(%rbp), %rcx
	movq	-200(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	-24(%rsi), %rsi
	addq	%rsi, %rdx
	movq	-200(%rbp), %rsi
	movq	(%rsi), %rdi
	movq	-24(%rdi), %rdi
	addq	%rdi, %rsi
	movq	%rsi, -72(%rbp)
	movq	-72(%rbp), %rsi
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	movq	%rcx, -312(%rbp)        ## 8-byte Spill
	movq	%rdx, -320(%rbp)        ## 8-byte Spill
	movq	%rsi, -328(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movq	-328(%rbp), %rcx        ## 8-byte Reload
	movl	144(%rcx), %esi
	movl	%eax, %edi
	callq	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	testb	$1, %al
	jne	LBB6_8
	jmp	LBB6_16
LBB6_8:
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -32(%rbp)
	movb	$32, -33(%rbp)
	movq	-32(%rbp), %rsi
Ltmp28:
	leaq	-48(%rbp), %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp29:
	jmp	LBB6_9
LBB6_9:                                 ## %.noexc
	leaq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
Ltmp30:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp31:
	movq	%rax, -336(%rbp)        ## 8-byte Spill
	jmp	LBB6_10
LBB6_10:                                ## %_ZNSt3__19use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE.exit.i.i
	movb	-33(%rbp), %al
	movq	-336(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	56(%rsi), %rsi
	movsbl	-9(%rbp), %edi
Ltmp32:
	movl	%edi, -340(%rbp)        ## 4-byte Spill
	movq	%rdx, %rdi
	movl	-340(%rbp), %r8d        ## 4-byte Reload
	movq	%rsi, -352(%rbp)        ## 8-byte Spill
	movl	%r8d, %esi
	movq	-352(%rbp), %rdx        ## 8-byte Reload
	callq	*%rdx
Ltmp33:
	movb	%al, -353(%rbp)         ## 1-byte Spill
	jmp	LBB6_14
LBB6_11:
Ltmp34:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
Ltmp35:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp36:
	jmp	LBB6_12
LBB6_12:
	movq	-56(%rbp), %rax
	movl	-60(%rbp), %ecx
	movq	%rax, -368(%rbp)        ## 8-byte Spill
	movl	%ecx, -372(%rbp)        ## 4-byte Spill
	jmp	LBB6_24
LBB6_13:
Ltmp37:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -376(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
LBB6_14:                                ## %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc.exit.i
Ltmp38:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp39:
	jmp	LBB6_15
LBB6_15:                                ## %.noexc1
	movb	-353(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %ecx
	movq	-328(%rbp), %rdx        ## 8-byte Reload
	movl	%ecx, 144(%rdx)
LBB6_16:                                ## %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv.exit
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movl	144(%rax), %ecx
	movb	%cl, %dl
	movb	%dl, -377(%rbp)         ## 1-byte Spill
## BB#17:
	movq	-256(%rbp), %rdi
Ltmp40:
	movb	-377(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %r9d
	movq	-280(%rbp), %rsi        ## 8-byte Reload
	movq	-304(%rbp), %rdx        ## 8-byte Reload
	movq	-312(%rbp), %rcx        ## 8-byte Reload
	movq	-320(%rbp), %r8         ## 8-byte Reload
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp41:
	movq	%rax, -392(%rbp)        ## 8-byte Spill
	jmp	LBB6_18
LBB6_18:
	leaq	-264(%rbp), %rax
	movq	-392(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -264(%rbp)
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	cmpq	$0, (%rax)
	jne	LBB6_25
## BB#19:
	movq	-200(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
	movq	%rax, -112(%rbp)
	movl	$5, -116(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -96(%rbp)
	movl	$5, -100(%rbp)
	movq	-96(%rbp), %rax
	movl	32(%rax), %edx
	orl	$5, %edx
Ltmp42:
	movq	%rax, %rdi
	movl	%edx, %esi
	callq	__ZNSt3__18ios_base5clearEj
Ltmp43:
	jmp	LBB6_20
LBB6_20:                                ## %_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj.exit
	jmp	LBB6_21
LBB6_21:
	jmp	LBB6_25
LBB6_22:
Ltmp49:
	movl	%edx, %ecx
	movq	%rax, -240(%rbp)
	movl	%ecx, -244(%rbp)
	jmp	LBB6_29
LBB6_23:
Ltmp44:
	movl	%edx, %ecx
	movq	%rax, -368(%rbp)        ## 8-byte Spill
	movl	%ecx, -372(%rbp)        ## 4-byte Spill
	jmp	LBB6_24
LBB6_24:                                ## %.body
	movl	-372(%rbp), %eax        ## 4-byte Reload
	movq	-368(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -240(%rbp)
	movl	%eax, -244(%rbp)
Ltmp45:
	leaq	-232(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp46:
	jmp	LBB6_28
LBB6_25:
	jmp	LBB6_26
LBB6_26:
Ltmp47:
	leaq	-232(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp48:
	jmp	LBB6_27
LBB6_27:
	jmp	LBB6_31
LBB6_28:
	jmp	LBB6_29
LBB6_29:
	movq	-240(%rbp), %rdi
	callq	___cxa_begin_catch
	movq	-200(%rbp), %rdi
	movq	(%rdi), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rdi
Ltmp50:
	movq	%rax, -400(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp51:
	jmp	LBB6_30
LBB6_30:
	callq	___cxa_end_catch
LBB6_31:
	movq	-200(%rbp), %rax
	addq	$416, %rsp              ## imm = 0x1A0
	popq	%rbp
	retq
LBB6_32:
Ltmp52:
	movl	%edx, %ecx
	movq	%rax, -240(%rbp)
	movl	%ecx, -244(%rbp)
Ltmp53:
	callq	___cxa_end_catch
Ltmp54:
	jmp	LBB6_33
LBB6_33:
	jmp	LBB6_34
LBB6_34:
	movq	-240(%rbp), %rdi
	callq	__Unwind_Resume
LBB6_35:
Ltmp55:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -404(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table6:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\253\201"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.ascii	"\234\001"              ## Call site table length
Lset10 = Ltmp26-Lfunc_begin6            ## >> Call Site 1 <<
	.long	Lset10
Lset11 = Ltmp27-Ltmp26                  ##   Call between Ltmp26 and Ltmp27
	.long	Lset11
Lset12 = Ltmp49-Lfunc_begin6            ##     jumps to Ltmp49
	.long	Lset12
	.byte	5                       ##   On action: 3
Lset13 = Ltmp28-Lfunc_begin6            ## >> Call Site 2 <<
	.long	Lset13
Lset14 = Ltmp29-Ltmp28                  ##   Call between Ltmp28 and Ltmp29
	.long	Lset14
Lset15 = Ltmp44-Lfunc_begin6            ##     jumps to Ltmp44
	.long	Lset15
	.byte	5                       ##   On action: 3
Lset16 = Ltmp30-Lfunc_begin6            ## >> Call Site 3 <<
	.long	Lset16
Lset17 = Ltmp33-Ltmp30                  ##   Call between Ltmp30 and Ltmp33
	.long	Lset17
Lset18 = Ltmp34-Lfunc_begin6            ##     jumps to Ltmp34
	.long	Lset18
	.byte	3                       ##   On action: 2
Lset19 = Ltmp35-Lfunc_begin6            ## >> Call Site 4 <<
	.long	Lset19
Lset20 = Ltmp36-Ltmp35                  ##   Call between Ltmp35 and Ltmp36
	.long	Lset20
Lset21 = Ltmp37-Lfunc_begin6            ##     jumps to Ltmp37
	.long	Lset21
	.byte	7                       ##   On action: 4
Lset22 = Ltmp38-Lfunc_begin6            ## >> Call Site 5 <<
	.long	Lset22
Lset23 = Ltmp43-Ltmp38                  ##   Call between Ltmp38 and Ltmp43
	.long	Lset23
Lset24 = Ltmp44-Lfunc_begin6            ##     jumps to Ltmp44
	.long	Lset24
	.byte	5                       ##   On action: 3
Lset25 = Ltmp45-Lfunc_begin6            ## >> Call Site 6 <<
	.long	Lset25
Lset26 = Ltmp46-Ltmp45                  ##   Call between Ltmp45 and Ltmp46
	.long	Lset26
Lset27 = Ltmp55-Lfunc_begin6            ##     jumps to Ltmp55
	.long	Lset27
	.byte	5                       ##   On action: 3
Lset28 = Ltmp47-Lfunc_begin6            ## >> Call Site 7 <<
	.long	Lset28
Lset29 = Ltmp48-Ltmp47                  ##   Call between Ltmp47 and Ltmp48
	.long	Lset29
Lset30 = Ltmp49-Lfunc_begin6            ##     jumps to Ltmp49
	.long	Lset30
	.byte	5                       ##   On action: 3
Lset31 = Ltmp48-Lfunc_begin6            ## >> Call Site 8 <<
	.long	Lset31
Lset32 = Ltmp50-Ltmp48                  ##   Call between Ltmp48 and Ltmp50
	.long	Lset32
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset33 = Ltmp50-Lfunc_begin6            ## >> Call Site 9 <<
	.long	Lset33
Lset34 = Ltmp51-Ltmp50                  ##   Call between Ltmp50 and Ltmp51
	.long	Lset34
Lset35 = Ltmp52-Lfunc_begin6            ##     jumps to Ltmp52
	.long	Lset35
	.byte	0                       ##   On action: cleanup
Lset36 = Ltmp51-Lfunc_begin6            ## >> Call Site 10 <<
	.long	Lset36
Lset37 = Ltmp53-Ltmp51                  ##   Call between Ltmp51 and Ltmp53
	.long	Lset37
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset38 = Ltmp53-Lfunc_begin6            ## >> Call Site 11 <<
	.long	Lset38
Lset39 = Ltmp54-Ltmp53                  ##   Call between Ltmp53 and Ltmp54
	.long	Lset39
Lset40 = Ltmp55-Lfunc_begin6            ##     jumps to Ltmp55
	.long	Lset40
	.byte	5                       ##   On action: 3
Lset41 = Ltmp54-Lfunc_begin6            ## >> Call Site 12 <<
	.long	Lset41
Lset42 = Lfunc_end6-Ltmp54              ##   Call between Ltmp54 and Lfunc_end6
	.long	Lset42
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	0                       ## >> Action Record 1 <<
                                        ##   Cleanup
	.byte	0                       ##   No further actions
	.byte	1                       ## >> Action Record 2 <<
                                        ##   Catch TypeInfo 1
	.byte	125                     ##   Continue to action 1
	.byte	1                       ## >> Action Record 3 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.byte	1                       ## >> Action Record 4 <<
                                        ##   Catch TypeInfo 1
	.byte	125                     ##   Continue to action 3
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.align	2

	.section	__TEXT,__textcoal_nt,coalesced,pure_instructions
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.align	4, 0x90
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
## BB#0:
	pushq	%rbp
Ltmp65:
	.cfi_def_cfa_offset 16
Ltmp66:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp67:
	.cfi_def_cfa_register %rbp
	subq	$720, %rsp              ## imm = 0x2D0
	movb	%r9b, %al
	leaq	-552(%rbp), %r10
	leaq	-488(%rbp), %r11
	movq	%rdi, -504(%rbp)
	movq	%rsi, -512(%rbp)
	movq	%rdx, -520(%rbp)
	movq	%rcx, -528(%rbp)
	movq	%r8, -536(%rbp)
	movb	%al, -537(%rbp)
	movq	-504(%rbp), %rcx
	movq	%r11, -472(%rbp)
	movq	$-1, -480(%rbp)
	movq	-472(%rbp), %rdx
	movq	-480(%rbp), %rsi
	movq	%rdx, -456(%rbp)
	movq	%rsi, -464(%rbp)
	movq	-456(%rbp), %rdx
	movq	$0, (%rdx)
	movq	-488(%rbp), %rdx
	movq	%rdx, -552(%rbp)
	movq	%r10, -448(%rbp)
	cmpq	$0, %rcx
	jne	LBB7_2
## BB#1:
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
	jmp	LBB7_29
LBB7_2:
	movq	-528(%rbp), %rax
	movq	-512(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -560(%rbp)
	movq	-536(%rbp), %rax
	movq	%rax, -344(%rbp)
	movq	-344(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -568(%rbp)
	movq	-568(%rbp), %rax
	cmpq	-560(%rbp), %rax
	jle	LBB7_4
## BB#3:
	movq	-560(%rbp), %rax
	movq	-568(%rbp), %rcx
	subq	%rax, %rcx
	movq	%rcx, -568(%rbp)
	jmp	LBB7_5
LBB7_4:
	movq	$0, -568(%rbp)
LBB7_5:
	movq	-520(%rbp), %rax
	movq	-512(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -576(%rbp)
	cmpq	$0, -576(%rbp)
	jle	LBB7_9
## BB#6:
	movq	-504(%rbp), %rax
	movq	-512(%rbp), %rcx
	movq	-576(%rbp), %rdx
	movq	%rax, -248(%rbp)
	movq	%rcx, -256(%rbp)
	movq	%rdx, -264(%rbp)
	movq	-248(%rbp), %rax
	movq	(%rax), %rcx
	movq	96(%rcx), %rcx
	movq	-256(%rbp), %rsi
	movq	-264(%rbp), %rdx
	movq	%rax, %rdi
	callq	*%rcx
	cmpq	-576(%rbp), %rax
	je	LBB7_8
## BB#7:
	leaq	-584(%rbp), %rax
	leaq	-240(%rbp), %rcx
	movq	%rcx, -224(%rbp)
	movq	$-1, -232(%rbp)
	movq	-224(%rbp), %rcx
	movq	-232(%rbp), %rdx
	movq	%rcx, -208(%rbp)
	movq	%rdx, -216(%rbp)
	movq	-208(%rbp), %rcx
	movq	$0, (%rcx)
	movq	-240(%rbp), %rcx
	movq	%rcx, -584(%rbp)
	movq	%rax, -8(%rbp)
	movq	$0, -504(%rbp)
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
	jmp	LBB7_29
LBB7_8:
	jmp	LBB7_9
LBB7_9:
	cmpq	$0, -568(%rbp)
	jle	LBB7_24
## BB#10:
	leaq	-608(%rbp), %rax
	movq	-568(%rbp), %rcx
	movb	-537(%rbp), %dl
	movq	%rax, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movb	%dl, -81(%rbp)
	movq	-72(%rbp), %rax
	movq	-80(%rbp), %rcx
	movb	-81(%rbp), %dl
	movq	%rax, -48(%rbp)
	movq	%rcx, -56(%rbp)
	movb	%dl, -57(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rcx
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rcx
	movq	%rcx, -24(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rcx, -16(%rbp)
	movq	-56(%rbp), %rsi
	movq	%rax, %rdi
	movsbl	-57(%rbp), %edx
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc
	leaq	-608(%rbp), %rax
	movq	-504(%rbp), %rcx
	movq	%rax, -200(%rbp)
	movq	-200(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	movq	%rax, -184(%rbp)
	movq	-184(%rbp), %rsi
	movq	%rsi, -176(%rbp)
	movq	-176(%rbp), %rsi
	movq	%rsi, -168(%rbp)
	movq	-168(%rbp), %rsi
	movzbl	(%rsi), %edx
	andl	$1, %edx
	cmpl	$0, %edx
	movq	%rcx, -656(%rbp)        ## 8-byte Spill
	movq	%rax, -664(%rbp)        ## 8-byte Spill
	je	LBB7_12
## BB#11:
	movq	-664(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rcx
	movq	%rcx, -112(%rbp)
	movq	-112(%rbp), %rcx
	movq	%rcx, -104(%rbp)
	movq	-104(%rbp), %rcx
	movq	16(%rcx), %rcx
	movq	%rcx, -672(%rbp)        ## 8-byte Spill
	jmp	LBB7_13
LBB7_12:
	movq	-664(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -160(%rbp)
	movq	-160(%rbp), %rcx
	movq	%rcx, -152(%rbp)
	movq	-152(%rbp), %rcx
	movq	%rcx, -144(%rbp)
	movq	-144(%rbp), %rcx
	addq	$1, %rcx
	movq	%rcx, -136(%rbp)
	movq	-136(%rbp), %rcx
	movq	%rcx, -128(%rbp)
	movq	-128(%rbp), %rcx
	movq	%rcx, -672(%rbp)        ## 8-byte Spill
LBB7_13:                                ## %_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv.exit
	movq	-672(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -96(%rbp)
	movq	-568(%rbp), %rcx
	movq	-656(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, -272(%rbp)
	movq	%rax, -280(%rbp)
	movq	%rcx, -288(%rbp)
	movq	-272(%rbp), %rax
	movq	(%rax), %rsi
	movq	96(%rsi), %rsi
	movq	-280(%rbp), %rdi
Ltmp59:
	movq	%rdi, -680(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	movq	-680(%rbp), %rax        ## 8-byte Reload
	movq	%rsi, -688(%rbp)        ## 8-byte Spill
	movq	%rax, %rsi
	movq	%rcx, %rdx
	movq	-688(%rbp), %rcx        ## 8-byte Reload
	callq	*%rcx
Ltmp60:
	movq	%rax, -696(%rbp)        ## 8-byte Spill
	jmp	LBB7_14
LBB7_14:                                ## %_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl.exit
	jmp	LBB7_15
LBB7_15:
	movq	-696(%rbp), %rax        ## 8-byte Reload
	cmpq	-568(%rbp), %rax
	je	LBB7_20
## BB#16:
	leaq	-328(%rbp), %rax
	movq	%rax, -312(%rbp)
	movq	$-1, -320(%rbp)
	movq	-312(%rbp), %rax
	movq	-320(%rbp), %rcx
	movq	%rax, -296(%rbp)
	movq	%rcx, -304(%rbp)
	movq	-296(%rbp), %rax
	movq	$0, (%rax)
	movq	-328(%rbp), %rax
	movq	%rax, -704(%rbp)        ## 8-byte Spill
## BB#17:
	leaq	-632(%rbp), %rax
	movq	-704(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -632(%rbp)
	movq	%rax, -336(%rbp)
## BB#18:
	movq	$0, -504(%rbp)
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
	movl	$1, -636(%rbp)
	jmp	LBB7_21
LBB7_19:
Ltmp61:
	movl	%edx, %ecx
	movq	%rax, -616(%rbp)
	movl	%ecx, -620(%rbp)
Ltmp62:
	leaq	-608(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp63:
	jmp	LBB7_23
LBB7_20:
	movl	$0, -636(%rbp)
LBB7_21:
	leaq	-608(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	movl	-636(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -708(%rbp)        ## 4-byte Spill
	je	LBB7_29
	jmp	LBB7_22
LBB7_22:
	jmp	LBB7_24
LBB7_23:
	jmp	LBB7_30
LBB7_24:
	movq	-528(%rbp), %rax
	movq	-520(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -576(%rbp)
	cmpq	$0, -576(%rbp)
	jle	LBB7_28
## BB#25:
	movq	-504(%rbp), %rax
	movq	-520(%rbp), %rcx
	movq	-576(%rbp), %rdx
	movq	%rax, -352(%rbp)
	movq	%rcx, -360(%rbp)
	movq	%rdx, -368(%rbp)
	movq	-352(%rbp), %rax
	movq	(%rax), %rcx
	movq	96(%rcx), %rcx
	movq	-360(%rbp), %rsi
	movq	-368(%rbp), %rdx
	movq	%rax, %rdi
	callq	*%rcx
	cmpq	-576(%rbp), %rax
	je	LBB7_27
## BB#26:
	leaq	-648(%rbp), %rax
	leaq	-408(%rbp), %rcx
	movq	%rcx, -392(%rbp)
	movq	$-1, -400(%rbp)
	movq	-392(%rbp), %rcx
	movq	-400(%rbp), %rdx
	movq	%rcx, -376(%rbp)
	movq	%rdx, -384(%rbp)
	movq	-376(%rbp), %rcx
	movq	$0, (%rcx)
	movq	-408(%rbp), %rcx
	movq	%rcx, -648(%rbp)
	movq	%rax, -416(%rbp)
	movq	$0, -504(%rbp)
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
	jmp	LBB7_29
LBB7_27:
	jmp	LBB7_28
LBB7_28:
	movq	-536(%rbp), %rax
	movq	%rax, -424(%rbp)
	movq	$0, -432(%rbp)
	movq	-424(%rbp), %rax
	movq	24(%rax), %rcx
	movq	%rcx, -440(%rbp)
	movq	-432(%rbp), %rcx
	movq	%rcx, 24(%rax)
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
LBB7_29:
	movq	-496(%rbp), %rax
	addq	$720, %rsp              ## imm = 0x2D0
	popq	%rbp
	retq
LBB7_30:
	movq	-616(%rbp), %rdi
	callq	__Unwind_Resume
LBB7_31:
Ltmp64:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -712(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
## BB#32:
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table7:
Lexception7:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\274"                  ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	52                      ## Call site table length
Lset43 = Lfunc_begin7-Lfunc_begin7      ## >> Call Site 1 <<
	.long	Lset43
Lset44 = Ltmp59-Lfunc_begin7            ##   Call between Lfunc_begin7 and Ltmp59
	.long	Lset44
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset45 = Ltmp59-Lfunc_begin7            ## >> Call Site 2 <<
	.long	Lset45
Lset46 = Ltmp60-Ltmp59                  ##   Call between Ltmp59 and Ltmp60
	.long	Lset46
Lset47 = Ltmp61-Lfunc_begin7            ##     jumps to Ltmp61
	.long	Lset47
	.byte	0                       ##   On action: cleanup
Lset48 = Ltmp62-Lfunc_begin7            ## >> Call Site 3 <<
	.long	Lset48
Lset49 = Ltmp63-Ltmp62                  ##   Call between Ltmp62 and Ltmp63
	.long	Lset49
Lset50 = Ltmp64-Lfunc_begin7            ##     jumps to Ltmp64
	.long	Lset50
	.byte	1                       ##   On action: 1
Lset51 = Ltmp63-Lfunc_begin7            ## >> Call Site 4 <<
	.long	Lset51
Lset52 = Lfunc_end7-Ltmp63              ##   Call between Ltmp63 and Lfunc_end7
	.long	Lset52
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.align	2

	.section	__TEXT,__textcoal_nt,coalesced,pure_instructions
	.private_extern	___clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## BB#0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	callq	___cxa_begin_catch
	movq	%rax, -8(%rbp)          ## 8-byte Spill
	callq	__ZSt9terminatev

	.globl	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	.weak_def_can_be_hidden	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	.align	4, 0x90
__ZNSt3__111char_traitsIcE11eq_int_typeEii: ## @_ZNSt3__111char_traitsIcE11eq_int_typeEii
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp68:
	.cfi_def_cfa_offset 16
Ltmp69:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp70:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %esi
	cmpl	-8(%rbp), %esi
	sete	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__ZNSt3__111char_traitsIcE3eofEv
	.weak_def_can_be_hidden	__ZNSt3__111char_traitsIcE3eofEv
	.align	4, 0x90
__ZNSt3__111char_traitsIcE3eofEv:       ## @_ZNSt3__111char_traitsIcE3eofEv
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp71:
	.cfi_def_cfa_offset 16
Ltmp72:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp73:
	.cfi_def_cfa_register %rbp
	movl	$4294967295, %eax       ## imm = 0xFFFFFFFF
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__ZNSt3__111char_traitsIcE6lengthEPKc
	.weak_def_can_be_hidden	__ZNSt3__111char_traitsIcE6lengthEPKc
	.align	4, 0x90
__ZNSt3__111char_traitsIcE6lengthEPKc:  ## @_ZNSt3__111char_traitsIcE6lengthEPKc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp74:
	.cfi_def_cfa_offset 16
Ltmp75:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp76:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_a                      ## @a
.zerofill __DATA,__common,_a,324,4
	.globl	_num                    ## @num
.zerofill __DATA,__common,_num,4,2
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%2d"

L_.str1:                                ## @.str1
	.asciz	"number of possibility:"

L_.str2:                                ## @.str2
	.asciz	"(only 10 shown)"


.subsections_via_symbols
