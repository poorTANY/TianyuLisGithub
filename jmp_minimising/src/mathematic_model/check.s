	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
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
	subq	$96, %rsp
	leaq	_w(%rip), %rax
	xorl	%ecx, %ecx
	movl	$4000000, %edx          ## imm = 0x3D0900
	movl	%edx, %esi
	leaq	_v(%rip), %rdi
	leaq	_l(%rip), %r8
	leaq	_h(%rip), %r9
	movl	$4000, %edx             ## imm = 0xFA0
                                        ## kill: RDX<def> EDX<kill>
	movl	$0, -36(%rbp)
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	movq	%r9, %rdi
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movl	%ecx, %esi
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	movl	%ecx, -68(%rbp)         ## 4-byte Spill
	movq	%r8, -80(%rbp)          ## 8-byte Spill
	callq	_memset
	movq	-80(%rbp), %rdi         ## 8-byte Reload
	movl	-68(%rbp), %esi         ## 4-byte Reload
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movl	-68(%rbp), %esi         ## 4-byte Reload
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	movl	-68(%rbp), %esi         ## 4-byte Reload
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	callq	__Z8readFilev
	callq	__Z4initv
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rax
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdx
	movq	%rdx, -24(%rbp)
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rdi
	callq	*-32(%rbp)
	leaq	L_.str(%rip), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	callq	__Z5solvev
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	movl	%eax, %esi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rdx
	movq	%rax, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	*-16(%rbp)
	xorl	%ecx, %ecx
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	movl	%ecx, %eax
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__Z8readFilev
	.align	4, 0x90
__Z8readFilev:                          ## @_Z8readFilev
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
	subq	$240, %rsp
	leaq	L_.str1(%rip), %rdi
	leaq	L_.str2(%rip), %rsi
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	callq	_freopen
	movq	__ZNSt3__13cinE@GOTPCREL(%rip), %rdi
	leaq	_n(%rip), %rsi
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str3(%rip), %rsi
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movl	_n(%rip), %esi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rdx
	movq	%rax, -104(%rbp)
	movq	%rdx, -112(%rbp)
	movq	-104(%rbp), %rdi
	callq	*-112(%rbp)
	movl	$0, -116(%rbp)
	movq	%rax, -160(%rbp)        ## 8-byte Spill
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-116(%rbp), %eax
	cmpl	_n(%rip), %eax
	jge	LBB1_4
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	movq	__ZNSt3__13cinE@GOTPCREL(%rip), %rdi
	leaq	_h(%rip), %rax
	movslq	-116(%rbp), %rcx
	shlq	$2, %rcx
	addq	%rcx, %rax
	movq	%rax, %rsi
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	_h(%rip), %rcx
	movslq	-116(%rbp), %rsi
	movl	(%rcx,%rsi,4), %esi
	movq	%rax, -168(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	movl	$32, %esi
	movq	%rax, %rdi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	movq	%rax, -176(%rbp)        ## 8-byte Spill
## BB#3:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-116(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -116(%rbp)
	jmp	LBB1_1
LBB1_4:
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rax
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rcx
	movq	%rcx, -88(%rbp)
	movq	%rax, -96(%rbp)
	movq	-88(%rbp), %rdi
	callq	*-96(%rbp)
	leaq	L_.str4(%rip), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rcx
	movq	%rax, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movq	-72(%rbp), %rdi
	callq	*-80(%rbp)
	movq	__ZNSt3__13cinE@GOTPCREL(%rip), %rdi
	leaq	_m(%rip), %rsi
	movq	%rax, -184(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rcx
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rsi
	movq	%rsi, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-56(%rbp), %rdi
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	callq	*-64(%rbp)
	leaq	L_.str5(%rip), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movl	_m(%rip), %esi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rcx
	movq	%rax, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-40(%rbp), %rdi
	callq	*-48(%rbp)
	movl	$0, -120(%rbp)
	movq	%rax, -200(%rbp)        ## 8-byte Spill
LBB1_5:                                 ## =>This Inner Loop Header: Depth=1
	movl	-120(%rbp), %eax
	cmpl	_m(%rip), %eax
	jge	LBB1_8
## BB#6:                                ##   in Loop: Header=BB1_5 Depth=1
	movq	__ZNSt3__13cinE@GOTPCREL(%rip), %rdi
	leaq	-124(%rbp), %rsi
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi
	leaq	-128(%rbp), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi
	leaq	-132(%rbp), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi
	leaq	-136(%rbp), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	movl	-124(%rbp), %esi
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	movl	$32, %esi
	movq	%rax, %rdi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	movl	-128(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	movl	$32, %esi
	movq	%rax, %rdi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	movl	-132(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	movl	$32, %esi
	movq	%rax, %rdi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	movl	-136(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	movl	$32, %esi
	movq	%rax, %rdi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rdi
	movq	%rax, -24(%rbp)
	movq	%rdi, -32(%rbp)
	movq	-24(%rbp), %rdi
	callq	*-32(%rbp)
	leaq	_v(%rip), %rdi
	leaq	_h(%rip), %rcx
	leaq	_w(%rip), %rdx
	movslq	-128(%rbp), %r8
	movslq	-124(%rbp), %r9
	imulq	$4000, %r9, %r9         ## imm = 0xFA0
	movq	%rdx, %r10
	addq	%r9, %r10
	movl	(%r10,%r8,4), %esi
	addl	$1, %esi
	movl	%esi, (%r10,%r8,4)
	movslq	-124(%rbp), %r8
	movslq	-128(%rbp), %r9
	imulq	$4000, %r9, %r9         ## imm = 0xFA0
	movq	%rdx, %r10
	addq	%r9, %r10
	movl	(%r10,%r8,4), %esi
	addl	$1, %esi
	movl	%esi, (%r10,%r8,4)
	movslq	-124(%rbp), %r8
	movl	(%rcx,%r8,4), %esi
	subl	-132(%rbp), %esi
	addl	-136(%rbp), %esi
	movslq	-128(%rbp), %r8
	movslq	-124(%rbp), %r9
	imulq	$4000, %r9, %r9         ## imm = 0xFA0
	movq	%rdi, %r10
	addq	%r9, %r10
	addl	(%r10,%r8,4), %esi
	movl	%esi, (%r10,%r8,4)
	movslq	-128(%rbp), %r8
	movslq	-124(%rbp), %r9
	imulq	$4000, %r9, %r9         ## imm = 0xFA0
	addq	%r9, %rdx
	movl	(%rdx,%r8,4), %esi
	movslq	-124(%rbp), %rdx
	movl	(%rcx,%rdx,4), %r11d
	movslq	-128(%rbp), %rdx
	addl	(%rcx,%rdx,4), %r11d
	imull	%r11d, %esi
	movslq	-128(%rbp), %rcx
	movslq	-124(%rbp), %rdx
	imulq	$4000, %rdx, %rdx       ## imm = 0xFA0
	movq	%rdi, %r8
	addq	%rdx, %r8
	subl	(%r8,%rcx,4), %esi
	movslq	-124(%rbp), %rcx
	movslq	-128(%rbp), %rdx
	imulq	$4000, %rdx, %rdx       ## imm = 0xFA0
	addq	%rdx, %rdi
	movl	%esi, (%rdi,%rcx,4)
	movq	%rax, -216(%rbp)        ## 8-byte Spill
## BB#7:                                ##   in Loop: Header=BB1_5 Depth=1
	movl	-120(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -120(%rbp)
	jmp	LBB1_5
LBB1_8:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str6(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	leaq	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rsi
	movq	%rax, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	*-16(%rbp)
	movq	___stdinp@GOTPCREL(%rip), %rsi
	movq	(%rsi), %rdi
	movq	%rax, -224(%rbp)        ## 8-byte Spill
	callq	_fclose
	movl	%eax, -228(%rbp)        ## 4-byte Spill
	addq	$240, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	__Z4initv
	.align	4, 0x90
__Z4initv:                              ## @_Z4initv
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
	movl	$0, -4(%rbp)
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
	movl	-4(%rbp), %eax
	cmpl	_n(%rip), %eax
	jge	LBB2_11
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %eax
	cmpl	_n(%rip), %eax
	jge	LBB2_9
## BB#4:                                ##   in Loop: Header=BB2_3 Depth=2
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jne	LBB2_6
## BB#5:                                ##   in Loop: Header=BB2_3 Depth=2
	leaq	_l(%rip), %rax
	movslq	-8(%rbp), %rcx
	movslq	-4(%rbp), %rdx
	imulq	$4000, %rdx, %rdx       ## imm = 0xFA0
	addq	%rdx, %rax
	movl	$0, (%rax,%rcx,4)
	jmp	LBB2_7
LBB2_6:                                 ##   in Loop: Header=BB2_3 Depth=2
	leaq	_l(%rip), %rax
	leaq	_h(%rip), %rcx
	movl	-8(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rsi
	movslq	-4(%rbp), %rdi
	imulq	$4000, %rdi, %rdi       ## imm = 0xFA0
	movq	%rax, %r8
	addq	%rdi, %r8
	movl	(%r8,%rsi,4), %edx
	movl	-8(%rbp), %r9d
	subl	$1, %r9d
	movslq	%r9d, %rsi
	addl	(%rcx,%rsi,4), %edx
	movslq	-8(%rbp), %rcx
	movslq	-4(%rbp), %rsi
	imulq	$4000, %rsi, %rsi       ## imm = 0xFA0
	addq	%rsi, %rax
	movl	%edx, (%rax,%rcx,4)
LBB2_7:                                 ##   in Loop: Header=BB2_3 Depth=2
	jmp	LBB2_8
LBB2_8:                                 ##   in Loop: Header=BB2_3 Depth=2
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	LBB2_3
LBB2_9:                                 ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_10
LBB2_10:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB2_1
LBB2_11:
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
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
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

	.private_extern	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.globl	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.weak_definition	__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.align	4, 0x90
__ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_: ## @_ZNSt3__14endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
## BB#0:
	pushq	%rbp
Ltmp20:
	.cfi_def_cfa_offset 16
Ltmp21:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp22:
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
Ltmp12:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp13:
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	jmp	LBB4_1
LBB4_1:                                 ## %_ZNSt3__19use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE.exit.i
	movb	-33(%rbp), %al
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	56(%rsi), %rsi
	movsbl	-9(%rbp), %edi
Ltmp14:
	movl	%edi, -100(%rbp)        ## 4-byte Spill
	movq	%rdx, %rdi
	movl	-100(%rbp), %r8d        ## 4-byte Reload
	movq	%rsi, -112(%rbp)        ## 8-byte Spill
	movl	%r8d, %esi
	movq	-112(%rbp), %rdx        ## 8-byte Reload
	callq	*%rdx
Ltmp15:
	movb	%al, -113(%rbp)         ## 1-byte Spill
	jmp	LBB4_5
LBB4_2:
Ltmp16:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
Ltmp17:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp18:
	jmp	LBB4_3
LBB4_3:
	movq	-56(%rbp), %rdi
	callq	__Unwind_Resume
LBB4_4:
Ltmp19:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -120(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
LBB4_5:                                 ## %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc.exit
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
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table4:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\274"                  ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	52                      ## Call site table length
Lset0 = Lfunc_begin4-Lfunc_begin4       ## >> Call Site 1 <<
	.long	Lset0
Lset1 = Ltmp12-Lfunc_begin4             ##   Call between Lfunc_begin4 and Ltmp12
	.long	Lset1
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset2 = Ltmp12-Lfunc_begin4             ## >> Call Site 2 <<
	.long	Lset2
Lset3 = Ltmp15-Ltmp12                   ##   Call between Ltmp12 and Ltmp15
	.long	Lset3
Lset4 = Ltmp16-Lfunc_begin4             ##     jumps to Ltmp16
	.long	Lset4
	.byte	0                       ##   On action: cleanup
Lset5 = Ltmp17-Lfunc_begin4             ## >> Call Site 3 <<
	.long	Lset5
Lset6 = Ltmp18-Ltmp17                   ##   Call between Ltmp17 and Ltmp18
	.long	Lset6
Lset7 = Ltmp19-Lfunc_begin4             ##     jumps to Ltmp19
	.long	Lset7
	.byte	1                       ##   On action: 1
Lset8 = Ltmp18-Lfunc_begin4             ## >> Call Site 4 <<
	.long	Lset8
Lset9 = Lfunc_end4-Ltmp18               ##   Call between Ltmp18 and Lfunc_end4
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
	.globl	__Z5solvev
	.align	4, 0x90
__Z5solvev:                             ## @_Z5solvev
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
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
LBB5_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB5_3 Depth 2
	movl	-8(%rbp), %eax
	cmpl	_n(%rip), %eax
	jge	LBB5_8
## BB#2:                                ##   in Loop: Header=BB5_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
LBB5_3:                                 ##   Parent Loop BB5_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-12(%rbp), %eax
	cmpl	_n(%rip), %eax
	jge	LBB5_6
## BB#4:                                ##   in Loop: Header=BB5_3 Depth=2
	leaq	_l(%rip), %rax
	leaq	_w(%rip), %rcx
	leaq	_v(%rip), %rdx
	movslq	-12(%rbp), %rsi
	movslq	-8(%rbp), %rdi
	imulq	$4000, %rdi, %rdi       ## imm = 0xFA0
	addq	%rdi, %rdx
	movl	(%rdx,%rsi,4), %r8d
	movslq	-12(%rbp), %rdx
	movslq	-8(%rbp), %rsi
	imulq	$4000, %rsi, %rsi       ## imm = 0xFA0
	addq	%rsi, %rcx
	movl	(%rcx,%rdx,4), %r9d
	movslq	-12(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	imulq	$4000, %rdx, %rdx       ## imm = 0xFA0
	addq	%rdx, %rax
	imull	(%rax,%rcx,4), %r9d
	addl	%r9d, %r8d
	addl	-4(%rbp), %r8d
	movl	%r8d, -4(%rbp)
## BB#5:                                ##   in Loop: Header=BB5_3 Depth=2
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB5_3
LBB5_6:                                 ##   in Loop: Header=BB5_1 Depth=1
	jmp	LBB5_7
LBB5_7:                                 ##   in Loop: Header=BB5_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	LBB5_1
LBB5_8:
	movl	-4(%rbp), %eax
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
Ltmp26:
	.cfi_def_cfa_offset 16
Ltmp27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp28:
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

	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin8:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception8
## BB#0:
	pushq	%rbp
Ltmp59:
	.cfi_def_cfa_offset 16
Ltmp60:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp61:
	.cfi_def_cfa_register %rbp
	subq	$416, %rsp              ## imm = 0x1A0
	movq	%rdi, -200(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%rdx, -216(%rbp)
	movq	-200(%rbp), %rsi
Ltmp29:
	leaq	-232(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp30:
	jmp	LBB8_1
LBB8_1:
	leaq	-232(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	movb	(%rax), %cl
	movb	%cl, -265(%rbp)         ## 1-byte Spill
## BB#2:
	movb	-265(%rbp), %al         ## 1-byte Reload
	testb	$1, %al
	jne	LBB8_3
	jmp	LBB8_26
LBB8_3:
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
	jne	LBB8_6
## BB#5:
	movq	-208(%rbp), %rax
	addq	-216(%rbp), %rax
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	jmp	LBB8_7
LBB8_6:
	movq	-208(%rbp), %rax
	movq	%rax, -296(%rbp)        ## 8-byte Spill
LBB8_7:
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
	jne	LBB8_8
	jmp	LBB8_16
LBB8_8:
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -32(%rbp)
	movb	$32, -33(%rbp)
	movq	-32(%rbp), %rsi
Ltmp31:
	leaq	-48(%rbp), %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp32:
	jmp	LBB8_9
LBB8_9:                                 ## %.noexc
	leaq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
Ltmp33:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%rax, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp34:
	movq	%rax, -336(%rbp)        ## 8-byte Spill
	jmp	LBB8_10
LBB8_10:                                ## %_ZNSt3__19use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE.exit.i.i
	movb	-33(%rbp), %al
	movq	-336(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	56(%rsi), %rsi
	movsbl	-9(%rbp), %edi
Ltmp35:
	movl	%edi, -340(%rbp)        ## 4-byte Spill
	movq	%rdx, %rdi
	movl	-340(%rbp), %r8d        ## 4-byte Reload
	movq	%rsi, -352(%rbp)        ## 8-byte Spill
	movl	%r8d, %esi
	movq	-352(%rbp), %rdx        ## 8-byte Reload
	callq	*%rdx
Ltmp36:
	movb	%al, -353(%rbp)         ## 1-byte Spill
	jmp	LBB8_14
LBB8_11:
Ltmp37:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
Ltmp38:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp39:
	jmp	LBB8_12
LBB8_12:
	movq	-56(%rbp), %rax
	movl	-60(%rbp), %ecx
	movq	%rax, -368(%rbp)        ## 8-byte Spill
	movl	%ecx, -372(%rbp)        ## 4-byte Spill
	jmp	LBB8_24
LBB8_13:
Ltmp40:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -376(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
LBB8_14:                                ## %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc.exit.i
Ltmp41:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp42:
	jmp	LBB8_15
LBB8_15:                                ## %.noexc1
	movb	-353(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %ecx
	movq	-328(%rbp), %rdx        ## 8-byte Reload
	movl	%ecx, 144(%rdx)
LBB8_16:                                ## %_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv.exit
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movl	144(%rax), %ecx
	movb	%cl, %dl
	movb	%dl, -377(%rbp)         ## 1-byte Spill
## BB#17:
	movq	-256(%rbp), %rdi
Ltmp43:
	movb	-377(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %r9d
	movq	-280(%rbp), %rsi        ## 8-byte Reload
	movq	-304(%rbp), %rdx        ## 8-byte Reload
	movq	-312(%rbp), %rcx        ## 8-byte Reload
	movq	-320(%rbp), %r8         ## 8-byte Reload
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp44:
	movq	%rax, -392(%rbp)        ## 8-byte Spill
	jmp	LBB8_18
LBB8_18:
	leaq	-264(%rbp), %rax
	movq	-392(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -264(%rbp)
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	cmpq	$0, (%rax)
	jne	LBB8_25
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
Ltmp45:
	movq	%rax, %rdi
	movl	%edx, %esi
	callq	__ZNSt3__18ios_base5clearEj
Ltmp46:
	jmp	LBB8_20
LBB8_20:                                ## %_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj.exit
	jmp	LBB8_21
LBB8_21:
	jmp	LBB8_25
LBB8_22:
Ltmp52:
	movl	%edx, %ecx
	movq	%rax, -240(%rbp)
	movl	%ecx, -244(%rbp)
	jmp	LBB8_29
LBB8_23:
Ltmp47:
	movl	%edx, %ecx
	movq	%rax, -368(%rbp)        ## 8-byte Spill
	movl	%ecx, -372(%rbp)        ## 4-byte Spill
	jmp	LBB8_24
LBB8_24:                                ## %.body
	movl	-372(%rbp), %eax        ## 4-byte Reload
	movq	-368(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -240(%rbp)
	movl	%eax, -244(%rbp)
Ltmp48:
	leaq	-232(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp49:
	jmp	LBB8_28
LBB8_25:
	jmp	LBB8_26
LBB8_26:
Ltmp50:
	leaq	-232(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp51:
	jmp	LBB8_27
LBB8_27:
	jmp	LBB8_31
LBB8_28:
	jmp	LBB8_29
LBB8_29:
	movq	-240(%rbp), %rdi
	callq	___cxa_begin_catch
	movq	-200(%rbp), %rdi
	movq	(%rdi), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rdi
Ltmp53:
	movq	%rax, -400(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp54:
	jmp	LBB8_30
LBB8_30:
	callq	___cxa_end_catch
LBB8_31:
	movq	-200(%rbp), %rax
	addq	$416, %rsp              ## imm = 0x1A0
	popq	%rbp
	retq
LBB8_32:
Ltmp55:
	movl	%edx, %ecx
	movq	%rax, -240(%rbp)
	movl	%ecx, -244(%rbp)
Ltmp56:
	callq	___cxa_end_catch
Ltmp57:
	jmp	LBB8_33
LBB8_33:
	jmp	LBB8_34
LBB8_34:
	movq	-240(%rbp), %rdi
	callq	__Unwind_Resume
LBB8_35:
Ltmp58:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -404(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table8:
Lexception8:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\253\201"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.ascii	"\234\001"              ## Call site table length
Lset10 = Ltmp29-Lfunc_begin8            ## >> Call Site 1 <<
	.long	Lset10
Lset11 = Ltmp30-Ltmp29                  ##   Call between Ltmp29 and Ltmp30
	.long	Lset11
Lset12 = Ltmp52-Lfunc_begin8            ##     jumps to Ltmp52
	.long	Lset12
	.byte	5                       ##   On action: 3
Lset13 = Ltmp31-Lfunc_begin8            ## >> Call Site 2 <<
	.long	Lset13
Lset14 = Ltmp32-Ltmp31                  ##   Call between Ltmp31 and Ltmp32
	.long	Lset14
Lset15 = Ltmp47-Lfunc_begin8            ##     jumps to Ltmp47
	.long	Lset15
	.byte	5                       ##   On action: 3
Lset16 = Ltmp33-Lfunc_begin8            ## >> Call Site 3 <<
	.long	Lset16
Lset17 = Ltmp36-Ltmp33                  ##   Call between Ltmp33 and Ltmp36
	.long	Lset17
Lset18 = Ltmp37-Lfunc_begin8            ##     jumps to Ltmp37
	.long	Lset18
	.byte	3                       ##   On action: 2
Lset19 = Ltmp38-Lfunc_begin8            ## >> Call Site 4 <<
	.long	Lset19
Lset20 = Ltmp39-Ltmp38                  ##   Call between Ltmp38 and Ltmp39
	.long	Lset20
Lset21 = Ltmp40-Lfunc_begin8            ##     jumps to Ltmp40
	.long	Lset21
	.byte	7                       ##   On action: 4
Lset22 = Ltmp41-Lfunc_begin8            ## >> Call Site 5 <<
	.long	Lset22
Lset23 = Ltmp46-Ltmp41                  ##   Call between Ltmp41 and Ltmp46
	.long	Lset23
Lset24 = Ltmp47-Lfunc_begin8            ##     jumps to Ltmp47
	.long	Lset24
	.byte	5                       ##   On action: 3
Lset25 = Ltmp48-Lfunc_begin8            ## >> Call Site 6 <<
	.long	Lset25
Lset26 = Ltmp49-Ltmp48                  ##   Call between Ltmp48 and Ltmp49
	.long	Lset26
Lset27 = Ltmp58-Lfunc_begin8            ##     jumps to Ltmp58
	.long	Lset27
	.byte	5                       ##   On action: 3
Lset28 = Ltmp50-Lfunc_begin8            ## >> Call Site 7 <<
	.long	Lset28
Lset29 = Ltmp51-Ltmp50                  ##   Call between Ltmp50 and Ltmp51
	.long	Lset29
Lset30 = Ltmp52-Lfunc_begin8            ##     jumps to Ltmp52
	.long	Lset30
	.byte	5                       ##   On action: 3
Lset31 = Ltmp51-Lfunc_begin8            ## >> Call Site 8 <<
	.long	Lset31
Lset32 = Ltmp53-Ltmp51                  ##   Call between Ltmp51 and Ltmp53
	.long	Lset32
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset33 = Ltmp53-Lfunc_begin8            ## >> Call Site 9 <<
	.long	Lset33
Lset34 = Ltmp54-Ltmp53                  ##   Call between Ltmp53 and Ltmp54
	.long	Lset34
Lset35 = Ltmp55-Lfunc_begin8            ##     jumps to Ltmp55
	.long	Lset35
	.byte	0                       ##   On action: cleanup
Lset36 = Ltmp54-Lfunc_begin8            ## >> Call Site 10 <<
	.long	Lset36
Lset37 = Ltmp56-Ltmp54                  ##   Call between Ltmp54 and Ltmp56
	.long	Lset37
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset38 = Ltmp56-Lfunc_begin8            ## >> Call Site 11 <<
	.long	Lset38
Lset39 = Ltmp57-Ltmp56                  ##   Call between Ltmp56 and Ltmp57
	.long	Lset39
Lset40 = Ltmp58-Lfunc_begin8            ##     jumps to Ltmp58
	.long	Lset40
	.byte	5                       ##   On action: 3
Lset41 = Ltmp57-Lfunc_begin8            ## >> Call Site 12 <<
	.long	Lset41
Lset42 = Lfunc_end8-Ltmp57              ##   Call between Ltmp57 and Lfunc_end8
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
	.globl	__ZNSt3__111char_traitsIcE6lengthEPKc
	.weak_def_can_be_hidden	__ZNSt3__111char_traitsIcE6lengthEPKc
	.align	4, 0x90
__ZNSt3__111char_traitsIcE6lengthEPKc:  ## @_ZNSt3__111char_traitsIcE6lengthEPKc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp62:
	.cfi_def_cfa_offset 16
Ltmp63:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp64:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.align	4, 0x90
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin10:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception10
## BB#0:
	pushq	%rbp
Ltmp71:
	.cfi_def_cfa_offset 16
Ltmp72:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp73:
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
	jne	LBB10_2
## BB#1:
	movq	-504(%rbp), %rax
	movq	%rax, -496(%rbp)
	jmp	LBB10_29
LBB10_2:
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
	jle	LBB10_4
## BB#3:
	movq	-560(%rbp), %rax
	movq	-568(%rbp), %rcx
	subq	%rax, %rcx
	movq	%rcx, -568(%rbp)
	jmp	LBB10_5
LBB10_4:
	movq	$0, -568(%rbp)
LBB10_5:
	movq	-520(%rbp), %rax
	movq	-512(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -576(%rbp)
	cmpq	$0, -576(%rbp)
	jle	LBB10_9
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
	je	LBB10_8
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
	jmp	LBB10_29
LBB10_8:
	jmp	LBB10_9
LBB10_9:
	cmpq	$0, -568(%rbp)
	jle	LBB10_24
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
	je	LBB10_12
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
	jmp	LBB10_13
LBB10_12:
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
LBB10_13:                               ## %_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv.exit
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
Ltmp65:
	movq	%rdi, -680(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	movq	-680(%rbp), %rax        ## 8-byte Reload
	movq	%rsi, -688(%rbp)        ## 8-byte Spill
	movq	%rax, %rsi
	movq	%rcx, %rdx
	movq	-688(%rbp), %rcx        ## 8-byte Reload
	callq	*%rcx
Ltmp66:
	movq	%rax, -696(%rbp)        ## 8-byte Spill
	jmp	LBB10_14
LBB10_14:                               ## %_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl.exit
	jmp	LBB10_15
LBB10_15:
	movq	-696(%rbp), %rax        ## 8-byte Reload
	cmpq	-568(%rbp), %rax
	je	LBB10_20
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
	jmp	LBB10_21
LBB10_19:
Ltmp67:
	movl	%edx, %ecx
	movq	%rax, -616(%rbp)
	movl	%ecx, -620(%rbp)
Ltmp68:
	leaq	-608(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp69:
	jmp	LBB10_23
LBB10_20:
	movl	$0, -636(%rbp)
LBB10_21:
	leaq	-608(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	movl	-636(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -708(%rbp)        ## 4-byte Spill
	je	LBB10_29
	jmp	LBB10_22
LBB10_22:
	jmp	LBB10_24
LBB10_23:
	jmp	LBB10_30
LBB10_24:
	movq	-528(%rbp), %rax
	movq	-520(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -576(%rbp)
	cmpq	$0, -576(%rbp)
	jle	LBB10_28
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
	je	LBB10_27
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
	jmp	LBB10_29
LBB10_27:
	jmp	LBB10_28
LBB10_28:
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
LBB10_29:
	movq	-496(%rbp), %rax
	addq	$720, %rsp              ## imm = 0x2D0
	popq	%rbp
	retq
LBB10_30:
	movq	-616(%rbp), %rdi
	callq	__Unwind_Resume
LBB10_31:
Ltmp70:
	movl	%edx, %ecx
	movq	%rax, %rdi
	movl	%ecx, -712(%rbp)        ## 4-byte Spill
	callq	___clang_call_terminate
## BB#32:
Lfunc_end10:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.align	2
GCC_except_table10:
Lexception10:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\274"                  ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	52                      ## Call site table length
Lset43 = Lfunc_begin10-Lfunc_begin10    ## >> Call Site 1 <<
	.long	Lset43
Lset44 = Ltmp65-Lfunc_begin10           ##   Call between Lfunc_begin10 and Ltmp65
	.long	Lset44
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset45 = Ltmp65-Lfunc_begin10           ## >> Call Site 2 <<
	.long	Lset45
Lset46 = Ltmp66-Ltmp65                  ##   Call between Ltmp65 and Ltmp66
	.long	Lset46
Lset47 = Ltmp67-Lfunc_begin10           ##     jumps to Ltmp67
	.long	Lset47
	.byte	0                       ##   On action: cleanup
Lset48 = Ltmp68-Lfunc_begin10           ## >> Call Site 3 <<
	.long	Lset48
Lset49 = Ltmp69-Ltmp68                  ##   Call between Ltmp68 and Ltmp69
	.long	Lset49
Lset50 = Ltmp70-Lfunc_begin10           ##     jumps to Ltmp70
	.long	Lset50
	.byte	1                       ##   On action: 1
Lset51 = Ltmp69-Lfunc_begin10           ## >> Call Site 4 <<
	.long	Lset51
Lset52 = Lfunc_end10-Ltmp69             ##   Call between Ltmp69 and Lfunc_end10
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
	.globl	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	.weak_def_can_be_hidden	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	.align	4, 0x90
__ZNSt3__111char_traitsIcE11eq_int_typeEii: ## @_ZNSt3__111char_traitsIcE11eq_int_typeEii
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
Ltmp77:
	.cfi_def_cfa_offset 16
Ltmp78:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp79:
	.cfi_def_cfa_register %rbp
	movl	$4294967295, %eax       ## imm = 0xFFFFFFFF
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_n                      ## @n
.zerofill __DATA,__common,_n,4,2
	.globl	_m                      ## @m
.zerofill __DATA,__common,_m,4,2
	.globl	_h                      ## @h
.zerofill __DATA,__common,_h,4000,4
	.globl	_l                      ## @l
.zerofill __DATA,__common,_l,4000000,4
	.globl	_v                      ## @v
.zerofill __DATA,__common,_v,4000000,4
	.globl	_w                      ## @w
.zerofill __DATA,__common,_w,4000000,4
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"value of jumping:"

L_.str1:                                ## @.str1
	.asciz	"sample.in"

L_.str2:                                ## @.str2
	.asciz	"r"

L_.str3:                                ## @.str3
	.asciz	"number of nodes:"

L_.str4:                                ## @.str4
	.asciz	"nodes got"

L_.str5:                                ## @.str5
	.asciz	"number of edges:"

L_.str6:                                ## @.str6
	.asciz	"edges got"


.subsections_via_symbols
