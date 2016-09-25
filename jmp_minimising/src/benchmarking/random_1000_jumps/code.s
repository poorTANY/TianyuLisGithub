	.globl	__Z3DFSi
	.align	4, 0x90
__Z3DFSi:                               ## @_Z3DFSi
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
	movl	%edi, -4(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$100, -4(%rbp)
	jge	LBB0_3
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_1
LBB0_3:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc