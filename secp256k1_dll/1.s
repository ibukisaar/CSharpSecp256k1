	.text
	.def	 @feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"dllmain.cpp"
	.def	 lzcnt;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,lzcnt
	.globl	lzcnt                   # -- Begin function lzcnt
	.p2align	4, 0x90
lzcnt:                                  # @lzcnt
# %bb.0:
	#APP

	lzcntq	%rcx, %rax

	#NO_APP
                                        # kill: def $eax killed $eax killed $rax
	retq
                                        # -- End function
	.def	 u256_less_than;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_less_than
	.globl	u256_less_than          # -- Begin function u256_less_than
	.p2align	4, 0x90
u256_less_than:                         # @u256_less_than
# %bb.0:
	movq	(%rcx), %r8
	movq	8(%rcx), %r9
	movq	16(%rcx), %rax
	movq	24(%rcx), %rcx
	#APP

	subq	(%rdx), %r8
	sbbq	8(%rdx), %r9
	sbbq	16(%rdx), %rax
	sbbq	24(%rdx), %rcx
	setb	%al

	#NO_APP
	movzbl	%al, %eax
	retq
                                        # -- End function
	.def	 u256_less_than_equal;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_less_than_equal
	.globl	u256_less_than_equal    # -- Begin function u256_less_than_equal
	.p2align	4, 0x90
u256_less_than_equal:                   # @u256_less_than_equal
# %bb.0:
	movq	(%rcx), %r8
	movq	8(%rcx), %r9
	movq	16(%rcx), %rax
	movq	24(%rcx), %rcx
	#APP

	subq	(%rdx), %r8
	sbbq	8(%rdx), %r9
	sbbq	16(%rdx), %rax
	sbbq	24(%rdx), %rcx
	setbe	%al

	#NO_APP
	movzbl	%al, %eax
	retq
                                        # -- End function
	.def	 u256_great_than;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_great_than
	.globl	u256_great_than         # -- Begin function u256_great_than
	.p2align	4, 0x90
u256_great_than:                        # @u256_great_than
# %bb.0:
	movq	(%rdx), %r8
	movq	8(%rdx), %r9
	movq	16(%rdx), %rax
	movq	24(%rdx), %rdx
	#APP

	subq	(%rcx), %r8
	sbbq	8(%rcx), %r9
	sbbq	16(%rcx), %rax
	sbbq	24(%rcx), %rdx
	setb	%al

	#NO_APP
	movzbl	%al, %eax
	retq
                                        # -- End function
	.def	 u256_great_than_equal;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_great_than_equal
	.globl	u256_great_than_equal   # -- Begin function u256_great_than_equal
	.p2align	4, 0x90
u256_great_than_equal:                  # @u256_great_than_equal
# %bb.0:
	movq	(%rdx), %r8
	movq	8(%rdx), %r9
	movq	16(%rdx), %rax
	movq	24(%rdx), %rdx
	#APP

	subq	(%rcx), %r8
	sbbq	8(%rcx), %r9
	sbbq	16(%rcx), %rax
	sbbq	24(%rcx), %rdx
	setbe	%al

	#NO_APP
	movzbl	%al, %eax
	retq
                                        # -- End function
	.def	 u256_mul_u64_p;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_mul_u64_p
	.globl	u256_mul_u64_p          # -- Begin function u256_mul_u64_p
	.p2align	4, 0x90
u256_mul_u64_p:                         # @u256_mul_u64_p
.seh_proc u256_mul_u64_p
# %bb.0:
	pushq	%r14
	.seh_pushreg 14
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbx
	.seh_pushreg 3
	.seh_endprologue
	movq	%rdx, %rsi
	movq	%rdx, %rax
	mulq	(%rcx)
	movq	%rdx, %r14
	movq	%rax, %r9
	movq	%rsi, %rax
	mulq	8(%rcx)
	movq	%rdx, %rbx
	movq	%rax, %r10
	movq	%rsi, %rax
	mulq	16(%rcx)
	movq	%rax, %r11
	movq	%rdx, %rdi
	movq	%rsi, %rax
	mulq	24(%rcx)
	movq	%rax, %rcx
	#APP

	addq	%r14, %r10
	adcq	%rbx, %r11
	adcq	%rdi, %rcx
	adcq	$0, %rdx

	#NO_APP
	movabsq	$4294968273, %r14       # imm = 0x1000003D1
	movq	%rdx, %rax
	mulq	%r14
	xorl	%ebx, %ebx
	#APP

	addq	%rax, %r9
	adcq	%rdx, %r10
	adcq	$0, %r11
	adcq	$0, %rcx
	adcq	$0, %rbx

	#NO_APP
	movq	%rcx, %rdx
	movq	%r9, %rax
	movq	%r11, %rdi
	movq	%r10, %rsi
	#APP

	addq	%r14, %rax
	adcq	$0, %rsi
	adcq	$0, %rdi
	adcq	$0, %rdx
	adcq	$0, %rbx

	#NO_APP
	testq	%rbx, %rbx
	je	.LBB5_2
# %bb.1:
	movq	%rdx, %rcx
	movq	%rdi, %r11
	movq	%rsi, %r10
	movq	%rax, %r9
.LBB5_2:
	movq	%r9, (%r8)
	movq	%r10, 8(%r8)
	movq	%r11, 16(%r8)
	movq	%rcx, 24(%r8)
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,u256_mul_u64_p
	.seh_endproc
                                        # -- End function
	.def	 u256_mul_p;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	u256_mul_p              # -- Begin function u256_mul_p
	.p2align	4, 0x90
u256_mul_p:                             # @u256_mul_p
.seh_proc u256_mul_p
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%r13
	.seh_pushreg 13
	pushq	%r12
	.seh_pushreg 12
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$192, %rsp
	.seh_stackalloc 192
	.seh_endprologue
	movq	%rdx, %rbp
	movq	(%rdx), %r13
	movq	8(%rdx), %r15
	movq	(%rcx), %rbx
	movq	%rbx, %rax
	mulq	%r13
	movq	%rdx, (%rsp)            # 8-byte Spill
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%r15, %rax
	mulq	%rbx
	movq	%rax, 88(%rsp)          # 8-byte Spill
	movq	%rdx, 168(%rsp)         # 8-byte Spill
	movq	16(%rbp), %r12
	movq	%r12, %rax
	mulq	%rbx
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rdx, 184(%rsp)         # 8-byte Spill
	movq	8(%rcx), %rsi
	movq	24(%rbp), %rbp
	movq	%rbp, %rax
	mulq	%rbx
	movq	%rdx, 176(%rsp)         # 8-byte Spill
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rsi, %rax
	mulq	%r13
	movq	%rdx, 136(%rsp)         # 8-byte Spill
	movq	%rax, %rbx
	movq	%rsi, %rax
	mulq	%r15
	movq	%rdx, 160(%rsp)         # 8-byte Spill
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rsi, %rax
	mulq	%r12
	movq	%rdx, 152(%rsp)         # 8-byte Spill
	movq	%rax, 80(%rsp)          # 8-byte Spill
	movq	%rsi, %rax
	mulq	%rbp
	movq	%rax, 72(%rsp)          # 8-byte Spill
	movq	%rdx, 128(%rsp)         # 8-byte Spill
	movq	16(%rcx), %rsi
	movq	%rsi, %rax
	mulq	%r13
	movq	%rdx, 112(%rsp)         # 8-byte Spill
	movq	%rax, %r11
	movq	%rsi, %rax
	mulq	%r15
	movq	%rdx, 104(%rsp)         # 8-byte Spill
	movq	%rax, 32(%rsp)          # 8-byte Spill
	movq	%rsi, %rax
	mulq	%r12
	movq	%rdx, 64(%rsp)          # 8-byte Spill
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%rsi, %rax
	mulq	%rbp
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	24(%rcx), %rdi
	movq	%rdi, %rax
	mulq	%r13
	movq	%rdx, %r13
	movq	%rax, %r9
	movq	%rdi, %rax
	mulq	%r15
	movq	%rdx, 24(%rsp)          # 8-byte Spill
	movq	%rax, %r15
	movq	%rdi, %rax
	mulq	%r12
	movq	%rdx, %rsi
	movq	%rax, %r14
	movq	%rdi, %rax
	mulq	%rbp
	movq	%rax, %r10
	movq	%rdx, %r12
	movq	%r8, 40(%rsp)           # 8-byte Spill
	movq	88(%rsp), %rax          # 8-byte Reload
	movq	56(%rsp), %rcx          # 8-byte Reload
	movq	32(%rsp), %rdx          # 8-byte Reload
	movq	16(%rsp), %rbp          # 8-byte Reload
	movq	8(%rsp), %rdi           # 8-byte Reload
	#APP

	addq	%rax, %rbx
	adcq	%rcx, %r11
	adcq	%rdx, %r9
	adcq	%rbp, %r15
	adcq	%rdi, %r14
	adcq	%rsi, %r10
	adcq	$0, %r12

	#NO_APP
	movq	(%rsp), %rax            # 8-byte Reload
	movq	120(%rsp), %rdx         # 8-byte Reload
	movq	80(%rsp), %rcx          # 8-byte Reload
	movq	72(%rsp), %rbp          # 8-byte Reload
	movq	48(%rsp), %rdi          # 8-byte Reload
	movq	24(%rsp), %rsi          # 8-byte Reload
	#APP

	addq	%rax, %rbx
	adcq	%rdx, %r11
	adcq	%rcx, %r9
	adcq	%rbp, %r15
	adcq	%rsi, %r14
	adcq	%rdi, %r10
	adcq	$0, %r12

	#NO_APP
	movq	%rbx, (%rsp)            # 8-byte Spill
	movq	144(%rsp), %rax         # 8-byte Reload
	movq	136(%rsp), %rdx         # 8-byte Reload
	movq	64(%rsp), %rcx          # 8-byte Reload
	#APP

	addq	%rdx, %r11
	adcq	%rax, %r9
	adcq	%r13, %r15
	adcq	%rcx, %r14
	adcq	$0, %r10
	adcq	$0, %r12

	#NO_APP
	movq	168(%rsp), %rax         # 8-byte Reload
	movq	128(%rsp), %rdx         # 8-byte Reload
	movq	112(%rsp), %rbp         # 8-byte Reload
	movq	104(%rsp), %rcx         # 8-byte Reload
	#APP

	addq	%rax, %r11
	adcq	%rbp, %r9
	adcq	%rcx, %r15
	adcq	%rdx, %r14
	adcq	$0, %r10
	adcq	$0, %r12

	#NO_APP
	movq	96(%rsp), %rcx          # 8-byte Reload
	movq	160(%rsp), %rax         # 8-byte Reload
	movq	152(%rsp), %rdx         # 8-byte Reload
	#APP

	addq	%rax, %r9
	adcq	%rdx, %r15
	adcq	$0, %r14
	adcq	$0, %r10
	adcq	$0, %r12

	#NO_APP
	movq	184(%rsp), %rax         # 8-byte Reload
	movq	176(%rsp), %rdx         # 8-byte Reload
	#APP

	addq	%rax, %r9
	adcq	%rdx, %r15
	adcq	$0, %r14
	adcq	$0, %r10
	adcq	$0, %r12

	#NO_APP
	movabsq	$4294968273, %r13       # imm = 0x1000003D1
	movq	%r15, %rax
	mulq	%r13
	movq	%rdx, %r15
	movq	%rax, %r8
	movq	%r14, %rax
	mulq	%r13
	movq	%rdx, %rbp
	movq	%rax, %rsi
	movq	%r10, %rax
	mulq	%r13
	movq	%rdx, %rdi
	movq	%rax, %rbx
	movq	%r12, %rax
	mulq	%r13
	#APP

	addq	%r15, %rsi
	adcq	%rbp, %rbx
	adcq	%rdi, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	(%rsp), %rbp            # 8-byte Reload
	#APP

	addq	%r8, %rcx
	adcq	%rsi, %rbp
	adcq	%rbx, %r11
	adcq	%rax, %r9
	adcq	$0, %rdx

	#NO_APP
	movq	%rdx, %rax
	mulq	%r13
	xorl	%ebx, %ebx
	#APP

	addq	%rax, %rcx
	adcq	%rdx, %rbp
	adcq	$0, %r11
	adcq	$0, %r9
	adcq	$0, %rbx

	#NO_APP
	movq	%r11, %rdx
	movq	%rbp, %rax
	movq	%r9, %rdi
	movq	%rcx, %rsi
	#APP

	addq	%r13, %rsi
	adcq	$0, %rax
	adcq	$0, %rdx
	adcq	$0, %rdi
	adcq	$0, %rbx

	#NO_APP
	testq	%rbx, %rbx
	je	.LBB6_2
# %bb.1:
	movq	%rdi, %r9
	movq	%rdx, %r11
	movq	%rax, %rbp
	movq	%rsi, %rcx
.LBB6_2:
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rcx, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r11, 16(%rax)
	movq	%r9, 24(%rax)
	addq	$192, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_square_p;
	.scl	2;
	.type	32;
	.endef
	.globl	u256_square_p           # -- Begin function u256_square_p
	.p2align	4, 0x90
u256_square_p:                          # @u256_square_p
.seh_proc u256_square_p
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%r13
	.seh_pushreg 13
	pushq	%r12
	.seh_pushreg 12
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$80, %rsp
	.seh_stackalloc 80
	.seh_endprologue
	movq	%rdx, 72(%rsp)          # 8-byte Spill
	movq	(%rcx), %rbp
	movq	8(%rcx), %rbx
	movq	%rbp, %rax
	mulq	%rbp
	movq	%rdx, 40(%rsp)          # 8-byte Spill
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rbx, %rax
	mulq	%rbp
	movq	%rax, %r15
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	16(%rcx), %rsi
	movq	%rsi, %rax
	mulq	%rbp
	movq	%rax, %r9
	movq	%rdx, 64(%rsp)          # 8-byte Spill
	movq	24(%rcx), %rcx
	movq	%rcx, %rax
	mulq	%rbp
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	movq	%rax, %r14
	movq	%rbx, %rax
	mulq	%rbx
	movq	%rdx, 56(%rsp)          # 8-byte Spill
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	%rsi, %rax
	mulq	%rbx
	movq	%rdx, 32(%rsp)          # 8-byte Spill
	movq	%rax, %r10
	movq	%rcx, %rax
	mulq	%rbx
	movq	%rdx, %rbp
	movq	%rax, %r11
	movq	%rsi, %rax
	mulq	%rsi
	movq	%rdx, 8(%rsp)           # 8-byte Spill
	movq	%rax, %r8
	movq	%rcx, %rax
	mulq	%rsi
	movq	%rdx, %r12
	movq	%rax, %rsi
	movq	%rcx, %rax
	mulq	%rcx
	movq	%rax, %rdi
	movq	%rdx, %rbx
	movq	%r9, %rdx
	movq	%r9, %r13
	movq	%r11, %rax
	movq	%r14, %r9
	movq	(%rsp), %rcx            # 8-byte Reload
	#APP

	addq	%r15, %r15
	adcq	%rcx, %r13
	adcq	%r10, %r14
	adcq	%r8, %rax
	adcq	%rsi, %rsi
	adcq	%r12, %rdi
	adcq	$0, %rbx

	#NO_APP
	movq	40(%rsp), %rcx          # 8-byte Reload
	#APP

	addq	%rcx, %r15
	adcq	%rdx, %r13
	adcq	%r10, %r14
	adcq	%r11, %rax
	adcq	%rbp, %rsi
	adcq	%r12, %rdi
	adcq	$0, %rbx

	#NO_APP
	movq	16(%rsp), %r8           # 8-byte Reload
	movq	48(%rsp), %rdx          # 8-byte Reload
	movq	8(%rsp), %rcx           # 8-byte Reload
	#APP

	addq	%rdx, %r13
	adcq	%r9, %r14
	adcq	%r8, %rax
	adcq	%rcx, %rsi
	adcq	$0, %rdi
	adcq	$0, %rbx

	#NO_APP
	movq	64(%rsp), %r10          # 8-byte Reload
	movq	32(%rsp), %rcx          # 8-byte Reload
	#APP

	addq	%rdx, %r13
	adcq	%r10, %r14
	adcq	%rcx, %rax
	adcq	%rbp, %rsi
	adcq	$0, %rdi
	adcq	$0, %rbx

	#NO_APP
	movq	56(%rsp), %rdx          # 8-byte Reload
	#APP

	addq	%rdx, %r14
	adcq	%rcx, %rax
	adcq	$0, %rsi
	adcq	$0, %rdi
	adcq	$0, %rbx

	#NO_APP
	#APP

	addq	%r10, %r14
	adcq	%r8, %rax
	adcq	$0, %rsi
	adcq	$0, %rdi
	adcq	$0, %rbx

	#NO_APP
	movabsq	$4294968273, %r11       # imm = 0x1000003D1
	mulq	%r11
	movq	%rdx, %r10
	movq	%rax, %r8
	movq	%rsi, %rax
	mulq	%r11
	movq	%rdx, %rsi
	movq	%rax, %rbp
	movq	%rdi, %rax
	mulq	%r11
	movq	%rdx, %rdi
	movq	%rax, %rcx
	movq	%rbx, %rax
	mulq	%r11
	#APP

	addq	%r10, %rbp
	adcq	%rsi, %rcx
	adcq	%rdi, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	24(%rsp), %rdi          # 8-byte Reload
	#APP

	addq	%r8, %rdi
	adcq	%rbp, %r15
	adcq	%rcx, %r13
	adcq	%rax, %r14
	adcq	$0, %rdx

	#NO_APP
	movq	%rdx, %rax
	mulq	%r11
	xorl	%ebx, %ebx
	#APP

	addq	%rax, %rdi
	adcq	%rdx, %r15
	adcq	$0, %r13
	adcq	$0, %r14
	adcq	$0, %rbx

	#NO_APP
	movq	%r14, %rcx
	movq	%rdi, %rax
	movq	%r13, %rbp
	movq	%r15, %rdx
	#APP

	addq	%r11, %rax
	adcq	$0, %rdx
	adcq	$0, %rbp
	adcq	$0, %rcx
	adcq	$0, %rbx

	#NO_APP
	testq	%rbx, %rbx
	je	.LBB7_2
# %bb.1:
	movq	%rcx, %r14
	movq	%rbp, %r13
	movq	%rdx, %r15
	movq	%rax, %rdi
.LBB7_2:
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	%rdi, (%rax)
	movq	%r15, 8(%rax)
	movq	%r13, 16(%rax)
	movq	%r14, 24(%rax)
	addq	$80, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_norm_p;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_norm_p
	.globl	u256_norm_p             # -- Begin function u256_norm_p
	.p2align	4, 0x90
u256_norm_p:                            # @u256_norm_p
# %bb.0:
	movq	(%rcx), %r10
	movq	8(%rcx), %r11
	movq	16(%rcx), %r8
	movq	24(%rcx), %r9
	xorl	%eax, %eax
	movabsq	$4294968273, %rdx       # imm = 0x1000003D1
	#APP

	addq	%rdx, %r10
	adcq	$0, %r11
	adcq	$0, %r8
	adcq	$0, %r9
	adcq	$0, %rax

	#NO_APP
	testq	%rax, %rax
	je	.LBB8_2
# %bb.1:
	movq	%r10, (%rcx)
	movq	%r11, 8(%rcx)
	movq	%r8, 16(%rcx)
	movq	%r9, 24(%rcx)
.LBB8_2:
	retq
                                        # -- End function
	.def	 u256_add_p;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_add_p
	.globl	u256_add_p              # -- Begin function u256_add_p
	.p2align	4, 0x90
u256_add_p:                             # @u256_add_p
.seh_proc u256_add_p
# %bb.0:
	pushq	%r14
	.seh_pushreg 14
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbx
	.seh_pushreg 3
	.seh_endprologue
	movq	(%rcx), %rax
	movq	8(%rcx), %r9
	movq	16(%rcx), %r10
	movq	24(%rcx), %r11
	movq	24(%rdx), %rcx
	movq	16(%rdx), %rsi
	movq	(%rdx), %rdi
	movq	8(%rdx), %rdx
	xorl	%ebx, %ebx
	#APP

	addq	%rdi, %rax
	adcq	%rdx, %r9
	adcq	%rsi, %r10
	adcq	%rcx, %r11
	adcq	$0, %rbx

	#NO_APP
	movabsq	$4294968273, %r14       # imm = 0x1000003D1
	movq	%rax, %rdx
	movq	%r10, %rcx
	movq	%r9, %rdi
	movq	%r11, %rsi
	#APP

	addq	%r14, %rdx
	adcq	$0, %rdi
	adcq	$0, %rcx
	adcq	$0, %rsi
	adcq	$0, %rbx

	#NO_APP
	testq	%rbx, %rbx
	je	.LBB9_2
# %bb.1:
	movq	%rdi, %r9
	movq	%rcx, %r10
	movq	%rsi, %r11
	movq	%rdx, %rax
.LBB9_2:
	movq	%rax, (%r8)
	movq	%r9, 8(%r8)
	movq	%r10, 16(%r8)
	movq	%r11, 24(%r8)
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,u256_add_p
	.seh_endproc
                                        # -- End function
	.def	 u256_sub_p;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_sub_p
	.globl	u256_sub_p              # -- Begin function u256_sub_p
	.p2align	4, 0x90
u256_sub_p:                             # @u256_sub_p
.seh_proc u256_sub_p
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbx
	.seh_pushreg 3
	.seh_endprologue
	movq	(%rcx), %r10
	movq	8(%rcx), %rax
	movq	16(%rcx), %r9
	movq	24(%rcx), %rcx
	movq	24(%rdx), %r11
	movq	16(%rdx), %rsi
	movq	(%rdx), %rdi
	movq	8(%rdx), %rdx
	movl	$1, %ebx
	#APP

	subq	%rdi, %r10
	sbbq	%rdx, %rax
	sbbq	%rsi, %r9
	sbbq	%r11, %rcx
	sbbq	$0, %rbx

	#NO_APP
	testq	%rbx, %rbx
	jne	.LBB10_2
# %bb.1:
	movabsq	$4294968273, %rdx       # imm = 0x1000003D1
	#APP

	subq	%rdx, %r10
	sbbq	$0, %rax
	sbbq	$0, %r9
	sbbq	$0, %rcx

	#NO_APP
.LBB10_2:
	movq	%r10, (%r8)
	movq	%rax, 8(%r8)
	movq	%r9, 16(%r8)
	movq	%rcx, 24(%r8)
	popq	%rbx
	popq	%rdi
	popq	%rsi
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,u256_sub_p
	.seh_endproc
                                        # -- End function
	.def	 u256_neg_p;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_neg_p
	.globl	u256_neg_p              # -- Begin function u256_neg_p
	.p2align	4, 0x90
u256_neg_p:                             # @u256_neg_p
.seh_proc u256_neg_p
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	.seh_endprologue
	movq	(%rcx), %r8
	movq	8(%rcx), %r9
	movq	%r8, %rax
	orq	%r9, %rax
	jne	.LBB11_4
# %bb.1:
	cmpq	$0, 16(%rcx)
	jne	.LBB11_3
# %bb.2:
	cmpq	$0, 24(%rcx)
	je	.LBB11_5
.LBB11_3:
	xorl	%r9d, %r9d
.LBB11_4:
	movq	16(%rcx), %r10
	movq	24(%rcx), %r11
	movabsq	$-4294968273, %rax      # imm = 0xFFFFFFFEFFFFFC2F
	movq	$-1, %rcx
	movq	$-1, %rsi
	movq	$-1, %rdi
	#APP

	subq	%r8, %rax
	sbbq	%r9, %rsi
	sbbq	%r10, %rdi
	sbbq	%r11, %rcx

	#NO_APP
	movq	%rax, (%rdx)
	movq	%rsi, 8(%rdx)
	movq	%rdi, 16(%rdx)
	movq	%rcx, 24(%rdx)
	popq	%rdi
	popq	%rsi
	retq
.LBB11_5:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rdx)
	movups	%xmm0, (%rdx)
	popq	%rdi
	popq	%rsi
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,u256_neg_p
	.seh_endproc
                                        # -- End function
	.def	 u256_pow_u64_p;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	u256_pow_u64_p          # -- Begin function u256_pow_u64_p
	.p2align	4, 0x90
u256_pow_u64_p:                         # @u256_pow_u64_p
.seh_proc u256_pow_u64_p
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%r12
	.seh_pushreg 12
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbx
	.seh_pushreg 3
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	%r8, %r14
	movaps	.L__const.u256_pow_p.ret+16(%rip), %xmm0
	movaps	%xmm0, 48(%rsp)
	movaps	.L__const.u256_pow_p.ret(%rip), %xmm0
	movaps	%xmm0, 32(%rsp)
	movups	(%rcx), %xmm0
	movaps	%xmm0, 64(%rsp)
	movups	16(%rcx), %xmm0
	movaps	%xmm0, 80(%rsp)
	testq	%rdx, %rdx
	je	.LBB12_5
# %bb.1:
	movq	%rdx, %r12
	#APP

	lzcntq	%rdx, %rax

	#NO_APP
	movl	$63, %ecx
	subl	%eax, %ecx
	je	.LBB12_2
# %bb.6:
	movl	%ecx, %esi
	xorl	%edi, %edi
	leaq	64(%rsp), %rbx
	leaq	32(%rsp), %r15
	.p2align	4, 0x90
.LBB12_7:                               # =>This Inner Loop Header: Depth=1
	btq	%rdi, %r12
	jae	.LBB12_9
# %bb.8:                                #   in Loop: Header=BB12_7 Depth=1
	movq	%r15, %rcx
	movq	%rbx, %rdx
	movq	%r15, %r8
	callq	u256_mul_p
.LBB12_9:                               #   in Loop: Header=BB12_7 Depth=1
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	callq	u256_square_p
	addq	$1, %rdi
	cmpq	%rdi, %rsi
	jne	.LBB12_7
# %bb.3:
	btq	%rsi, %r12
	jae	.LBB12_5
.LBB12_4:
	leaq	64(%rsp), %rdx
	leaq	32(%rsp), %rcx
	movq	%rcx, %r8
	callq	u256_mul_p
.LBB12_5:
	movaps	32(%rsp), %xmm0
	movups	%xmm0, (%r14)
	movaps	48(%rsp), %xmm0
	movups	%xmm0, 16(%r14)
	addq	$104, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.LBB12_2:
	xorl	%esi, %esi
	btq	%rsi, %r12
	jb	.LBB12_4
	jmp	.LBB12_5
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_pow_p;
	.scl	2;
	.type	32;
	.endef
	.globl	u256_pow_p              # -- Begin function u256_pow_p
	.p2align	4, 0x90
u256_pow_p:                             # @u256_pow_p
.seh_proc u256_pow_p
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%r12
	.seh_pushreg 12
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbx
	.seh_pushreg 3
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	%r8, %r14
	movq	%rdx, %r15
	movaps	.L__const.u256_pow_p.ret+16(%rip), %xmm0
	movaps	%xmm0, 48(%rsp)
	movaps	.L__const.u256_pow_p.ret(%rip), %xmm0
	movaps	%xmm0, 32(%rsp)
	movups	(%rcx), %xmm0
	movaps	%xmm0, 64(%rsp)
	movups	16(%rcx), %xmm0
	movaps	%xmm0, 80(%rsp)
	cmpq	$0, 24(%rdx)
	je	.LBB13_21
# %bb.1:
	movq	(%r15), %rdi
	xorl	%esi, %esi
	leaq	64(%rsp), %rbx
	leaq	32(%rsp), %r12
	.p2align	4, 0x90
.LBB13_2:                               # =>This Inner Loop Header: Depth=1
	btq	%rsi, %rdi
	jae	.LBB13_4
# %bb.3:                                #   in Loop: Header=BB13_2 Depth=1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movq	%r12, %r8
	callq	u256_mul_p
.LBB13_4:                               #   in Loop: Header=BB13_2 Depth=1
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	callq	u256_square_p
	addq	$1, %rsi
	cmpq	$64, %rsi
	jne	.LBB13_2
# %bb.5:
	movq	8(%r15), %rdi
	xorl	%esi, %esi
	leaq	64(%rsp), %rbx
	leaq	32(%rsp), %r12
	.p2align	4, 0x90
.LBB13_6:                               # =>This Inner Loop Header: Depth=1
	btq	%rsi, %rdi
	jae	.LBB13_8
# %bb.7:                                #   in Loop: Header=BB13_6 Depth=1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movq	%r12, %r8
	callq	u256_mul_p
.LBB13_8:                               #   in Loop: Header=BB13_6 Depth=1
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	callq	u256_square_p
	addq	$1, %rsi
	cmpq	$64, %rsi
	jne	.LBB13_6
# %bb.9:
	movq	16(%r15), %rdi
	xorl	%esi, %esi
	leaq	64(%rsp), %rbx
	leaq	32(%rsp), %r12
	.p2align	4, 0x90
.LBB13_10:                              # =>This Inner Loop Header: Depth=1
	btq	%rsi, %rdi
	jae	.LBB13_12
# %bb.11:                               #   in Loop: Header=BB13_10 Depth=1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movq	%r12, %r8
	callq	u256_mul_p
.LBB13_12:                              #   in Loop: Header=BB13_10 Depth=1
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	callq	u256_square_p
	addq	$1, %rsi
	cmpq	$64, %rsi
	jne	.LBB13_10
# %bb.13:
	movq	24(%r15), %r12
	#APP

	lzcntq	%r12, %rax

	#NO_APP
	movl	$63, %ecx
	subl	%eax, %ecx
	je	.LBB13_14
# %bb.17:
	movl	%ecx, %esi
	xorl	%ebx, %ebx
	leaq	64(%rsp), %rdi
	leaq	32(%rsp), %r15
	.p2align	4, 0x90
.LBB13_18:                              # =>This Inner Loop Header: Depth=1
	btq	%rbx, %r12
	jae	.LBB13_20
# %bb.19:                               #   in Loop: Header=BB13_18 Depth=1
	movq	%r15, %rcx
	movq	%rdi, %rdx
	movq	%r15, %r8
	callq	u256_mul_p
.LBB13_20:                              #   in Loop: Header=BB13_18 Depth=1
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	addq	$1, %rbx
	cmpq	%rbx, %rsi
	jne	.LBB13_18
	jmp	.LBB13_15
.LBB13_21:
	cmpq	$0, 16(%r15)
	je	.LBB13_35
# %bb.22:
	movq	(%r15), %rdi
	xorl	%esi, %esi
	leaq	64(%rsp), %rbx
	leaq	32(%rsp), %r12
	.p2align	4, 0x90
.LBB13_23:                              # =>This Inner Loop Header: Depth=1
	btq	%rsi, %rdi
	jae	.LBB13_25
# %bb.24:                               #   in Loop: Header=BB13_23 Depth=1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movq	%r12, %r8
	callq	u256_mul_p
.LBB13_25:                              #   in Loop: Header=BB13_23 Depth=1
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	callq	u256_square_p
	addq	$1, %rsi
	cmpq	$64, %rsi
	jne	.LBB13_23
# %bb.26:
	movq	8(%r15), %rdi
	xorl	%esi, %esi
	leaq	64(%rsp), %rbx
	leaq	32(%rsp), %r12
	.p2align	4, 0x90
.LBB13_27:                              # =>This Inner Loop Header: Depth=1
	btq	%rsi, %rdi
	jae	.LBB13_29
# %bb.28:                               #   in Loop: Header=BB13_27 Depth=1
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movq	%r12, %r8
	callq	u256_mul_p
.LBB13_29:                              #   in Loop: Header=BB13_27 Depth=1
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	callq	u256_square_p
	addq	$1, %rsi
	cmpq	$64, %rsi
	jne	.LBB13_27
# %bb.30:
	movq	16(%r15), %r12
	#APP

	lzcntq	%r12, %rax

	#NO_APP
	movl	$63, %ecx
	subl	%eax, %ecx
	je	.LBB13_14
# %bb.31:
	movl	%ecx, %esi
	xorl	%ebx, %ebx
	leaq	64(%rsp), %rdi
	leaq	32(%rsp), %r15
	.p2align	4, 0x90
.LBB13_32:                              # =>This Inner Loop Header: Depth=1
	btq	%rbx, %r12
	jae	.LBB13_34
# %bb.33:                               #   in Loop: Header=BB13_32 Depth=1
	movq	%r15, %rcx
	movq	%rdi, %rdx
	movq	%r15, %r8
	callq	u256_mul_p
.LBB13_34:                              #   in Loop: Header=BB13_32 Depth=1
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	addq	$1, %rbx
	cmpq	%rbx, %rsi
	jne	.LBB13_32
	jmp	.LBB13_15
.LBB13_35:
	cmpq	$0, 8(%r15)
	movq	(%r15), %r12
	je	.LBB13_45
# %bb.36:
	xorl	%edi, %edi
	leaq	64(%rsp), %rbx
	leaq	32(%rsp), %rsi
	.p2align	4, 0x90
.LBB13_37:                              # =>This Inner Loop Header: Depth=1
	btq	%rdi, %r12
	jae	.LBB13_39
# %bb.38:                               #   in Loop: Header=BB13_37 Depth=1
	movq	%rsi, %rcx
	movq	%rbx, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
.LBB13_39:                              #   in Loop: Header=BB13_37 Depth=1
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	callq	u256_square_p
	addq	$1, %rdi
	cmpq	$64, %rdi
	jne	.LBB13_37
# %bb.40:
	movq	8(%r15), %r12
	#APP

	lzcntq	%r12, %rax

	#NO_APP
	movl	$63, %ecx
	subl	%eax, %ecx
	je	.LBB13_14
# %bb.41:
	movl	%ecx, %esi
	xorl	%ebx, %ebx
	leaq	64(%rsp), %rdi
	leaq	32(%rsp), %r15
	.p2align	4, 0x90
.LBB13_42:                              # =>This Inner Loop Header: Depth=1
	btq	%rbx, %r12
	jae	.LBB13_44
# %bb.43:                               #   in Loop: Header=BB13_42 Depth=1
	movq	%r15, %rcx
	movq	%rdi, %rdx
	movq	%r15, %r8
	callq	u256_mul_p
.LBB13_44:                              #   in Loop: Header=BB13_42 Depth=1
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	addq	$1, %rbx
	cmpq	%rbx, %rsi
	jne	.LBB13_42
	jmp	.LBB13_15
.LBB13_45:
	testq	%r12, %r12
	je	.LBB13_16
# %bb.46:
	#APP

	lzcntq	%r12, %rax

	#NO_APP
	movl	$63, %ecx
	subl	%eax, %ecx
	je	.LBB13_14
# %bb.47:
	movl	%ecx, %esi
	xorl	%edi, %edi
	leaq	64(%rsp), %rbx
	leaq	32(%rsp), %r15
	.p2align	4, 0x90
.LBB13_48:                              # =>This Inner Loop Header: Depth=1
	btq	%rdi, %r12
	jae	.LBB13_50
# %bb.49:                               #   in Loop: Header=BB13_48 Depth=1
	movq	%r15, %rcx
	movq	%rbx, %rdx
	movq	%r15, %r8
	callq	u256_mul_p
.LBB13_50:                              #   in Loop: Header=BB13_48 Depth=1
	movq	%rbx, %rcx
	movq	%rbx, %rdx
	callq	u256_square_p
	addq	$1, %rdi
	cmpq	%rdi, %rsi
	jne	.LBB13_48
	jmp	.LBB13_15
.LBB13_14:
	xorl	%esi, %esi
.LBB13_15:
	btq	%rsi, %r12
	jae	.LBB13_16
# %bb.51:
	leaq	64(%rsp), %rdx
	leaq	32(%rsp), %rcx
	movq	%rcx, %r8
	callq	u256_mul_p
.LBB13_16:
	movaps	32(%rsp), %xmm0
	movups	%xmm0, (%r14)
	movaps	48(%rsp), %xmm0
	movups	%xmm0, 16(%r14)
	addq	$104, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_inv_p;
	.scl	2;
	.type	32;
	.endef
	.globl	u256_inv_p              # -- Begin function u256_inv_p
	.p2align	4, 0x90
u256_inv_p:                             # @u256_inv_p
.seh_proc u256_inv_p
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	%rdx, %rsi
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	cmpq	$1, %rax
	jne	.LBB14_5
# %bb.1:
	testq	%rdx, %rdx
	jne	.LBB14_5
# %bb.2:
	cmpq	$0, 16(%rcx)
	jne	.LBB14_4
# %bb.3:
	cmpq	$0, 24(%rcx)
	je	.LBB14_8
.LBB14_4:
	xorl	%edx, %edx
.LBB14_5:
	movq	%rax, 32(%rsp)
	movq	%rdx, 40(%rsp)
	movq	16(%rcx), %rbp
	movq	%rbp, 48(%rsp)
	movq	24(%rcx), %rcx
	movq	%rcx, 56(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rbp, 80(%rsp)
	movq	%rcx, 88(%rsp)
	leaq	64(%rsp), %rdi
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	leaq	32(%rsp), %rbx
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movl	$223, %ebp
	.p2align	4, 0x90
.LBB14_6:                               # =>This Inner Loop Header: Depth=1
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	addl	$-1, %ebp
	jne	.LBB14_6
# %bb.7:
	movaps	32(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movaps	48(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
.LBB14_9:
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	retq
.LBB14_8:
	movq	$1, (%rsi)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rsi)
	movq	$0, 24(%rsi)
	jmp	.LBB14_9
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_sqrt_p;
	.scl	2;
	.type	32;
	.endef
	.globl	u256_sqrt_p             # -- Begin function u256_sqrt_p
	.p2align	4, 0x90
u256_sqrt_p:                            # @u256_sqrt_p
.seh_proc u256_sqrt_p
# %bb.0:
	pushq	%r14
	.seh_pushreg 14
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$128, %rsp
	.seh_stackalloc 128
	.seh_endprologue
	movq	%rdx, %r14
	movq	(%rcx), %rax
	movq	%rax, 32(%rsp)
	movq	8(%rcx), %rdx
	movq	%rdx, 40(%rsp)
	movq	16(%rcx), %rbp
	movq	%rbp, 48(%rsp)
	movq	24(%rcx), %rcx
	movq	%rcx, 56(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rbp, 80(%rsp)
	movq	%rcx, 88(%rsp)
	leaq	64(%rsp), %rdi
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	leaq	32(%rsp), %rbx
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movaps	64(%rsp), %xmm0
	movaps	80(%rsp), %xmm1
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm1, 112(%rsp)
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	leaq	96(%rsp), %rsi
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movl	$222, %ebp
	.p2align	4, 0x90
.LBB15_1:                               # =>This Inner Loop Header: Depth=1
	movq	%rsi, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	addl	$-1, %ebp
	jne	.LBB15_1
# %bb.2:
	xorl	%eax, %eax
	cmpq	$1, 32(%rsp)
	jne	.LBB15_5
# %bb.3:
	movq	48(%rsp), %rcx
	orq	40(%rsp), %rcx
	orq	56(%rsp), %rcx
	jne	.LBB15_5
# %bb.4:
	movaps	96(%rsp), %xmm0
	movups	%xmm0, (%r14)
	movaps	112(%rsp), %xmm0
	movups	%xmm0, 16(%r14)
	movl	$1, %eax
.LBB15_5:
	addq	$128, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_fast_sqrt_p;
	.scl	2;
	.type	32;
	.endef
	.globl	u256_fast_sqrt_p        # -- Begin function u256_fast_sqrt_p
	.p2align	4, 0x90
u256_fast_sqrt_p:                       # @u256_fast_sqrt_p
.seh_proc u256_fast_sqrt_p
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	%rdx, %rsi
	movups	(%rcx), %xmm0
	movaps	%xmm0, 64(%rsp)
	movups	16(%rcx), %xmm0
	movaps	%xmm0, 80(%rsp)
	leaq	64(%rsp), %rdi
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movaps	64(%rsp), %xmm0
	movaps	80(%rsp), %xmm1
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm1, 48(%rsp)
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	leaq	32(%rsp), %rbx
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movl	$223, %ebp
	.p2align	4, 0x90
.LBB16_1:                               # =>This Inner Loop Header: Depth=1
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_p
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_p
	addl	$-1, %ebp
	jne	.LBB16_1
# %bb.2:
	movaps	32(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movaps	48(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_mul_n;
	.scl	2;
	.type	32;
	.endef
	.globl	u256_mul_n              # -- Begin function u256_mul_n
	.p2align	4, 0x90
u256_mul_n:                             # @u256_mul_n
.seh_proc u256_mul_n
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%r13
	.seh_pushreg 13
	pushq	%r12
	.seh_pushreg 12
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$296, %rsp              # imm = 0x128
	.seh_stackalloc 296
	.seh_endprologue
	movq	%rdx, %rbp
	movq	%rcx, %rsi
	movq	(%rdx), %r12
	movq	8(%rdx), %r11
	movq	(%rcx), %rbx
	movq	8(%rcx), %rdi
	movq	%rbx, %rax
	mulq	%r12
	movq	%rdx, 224(%rsp)         # 8-byte Spill
	movq	%rax, 288(%rsp)         # 8-byte Spill
	movq	%r11, %rax
	mulq	%rbx
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rdx, 264(%rsp)         # 8-byte Spill
	movq	16(%rbp), %rcx
	movq	%rcx, %rax
	mulq	%rbx
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	%rdx, 280(%rsp)         # 8-byte Spill
	movq	24(%rbp), %r9
	movq	%r9, %rax
	mulq	%rbx
	movq	%rdx, 272(%rsp)         # 8-byte Spill
	movq	%rax, 232(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	mulq	%r12
	movq	%rdx, 216(%rsp)         # 8-byte Spill
	movq	%rax, %r15
	movq	%rdi, %rax
	mulq	%r11
	movq	%rdx, 256(%rsp)         # 8-byte Spill
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rdx, 248(%rsp)         # 8-byte Spill
	movq	%rax, 168(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	mulq	%r9
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rdx, 240(%rsp)         # 8-byte Spill
	movq	16(%rsi), %rdi
	movq	%rdi, %rax
	mulq	%r12
	movq	%rdx, 208(%rsp)         # 8-byte Spill
	movq	%rax, %r14
	movq	%rdi, %rax
	mulq	%r11
	movq	%rdx, 200(%rsp)         # 8-byte Spill
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	mulq	%rcx
	movq	%rdx, 184(%rsp)         # 8-byte Spill
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	mulq	%r9
	movq	%rax, %r13
	movq	%rdx, 136(%rsp)         # 8-byte Spill
	movq	%r8, 104(%rsp)          # 8-byte Spill
	movq	24(%rsi), %r8
	movq	%r8, %rax
	mulq	%r12
	movq	%rdx, 152(%rsp)         # 8-byte Spill
	movq	%rax, %r10
	movq	%r8, %rax
	mulq	%r11
	movq	%rdx, 128(%rsp)         # 8-byte Spill
	movq	%rax, %r12
	movq	%r8, %rax
	mulq	%rcx
	movq	%rdx, %rcx
	movq	%rax, %r11
	movq	%r8, %rax
	mulq	%r9
	movq	176(%rsp), %rsi         # 8-byte Reload
	movq	144(%rsp), %rbp         # 8-byte Reload
	movq	120(%rsp), %rbx         # 8-byte Reload
	movq	112(%rsp), %rdi         # 8-byte Reload
	#APP

	addq	%rsi, %r15
	adcq	%rbp, %r14
	adcq	%rbx, %r10
	adcq	%rdi, %r12
	adcq	%r13, %r11
	adcq	%rcx, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	224(%rsp), %rbp         # 8-byte Reload
	movq	192(%rsp), %rbx         # 8-byte Reload
	movq	168(%rsp), %rdi         # 8-byte Reload
	movq	160(%rsp), %rsi         # 8-byte Reload
	movq	136(%rsp), %rcx         # 8-byte Reload
	movq	128(%rsp), %r8          # 8-byte Reload
	#APP

	addq	%rbp, %r15
	adcq	%rbx, %r14
	adcq	%rdi, %r10
	adcq	%rsi, %r12
	adcq	%r8, %r11
	adcq	%rcx, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	232(%rsp), %rbp         # 8-byte Reload
	movq	216(%rsp), %rbx         # 8-byte Reload
	movq	184(%rsp), %rdi         # 8-byte Reload
	movq	152(%rsp), %rsi         # 8-byte Reload
	#APP

	addq	%rbx, %r14
	adcq	%rbp, %r10
	adcq	%rsi, %r12
	adcq	%rdi, %r11
	adcq	$0, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	264(%rsp), %rbp         # 8-byte Reload
	movq	240(%rsp), %rbx         # 8-byte Reload
	movq	208(%rsp), %rdi         # 8-byte Reload
	movq	200(%rsp), %rsi         # 8-byte Reload
	#APP

	addq	%rbp, %r14
	adcq	%rdi, %r10
	adcq	%rsi, %r12
	adcq	%rbx, %r11
	adcq	$0, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	256(%rsp), %rbp         # 8-byte Reload
	movq	248(%rsp), %rbx         # 8-byte Reload
	#APP

	addq	%rbp, %r10
	adcq	%rbx, %r12
	adcq	$0, %r11
	adcq	$0, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	280(%rsp), %rbp         # 8-byte Reload
	movq	272(%rsp), %rbx         # 8-byte Reload
	#APP

	addq	%rbp, %r10
	adcq	%rbx, %r12
	adcq	$0, %r11
	adcq	$0, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	288(%rsp), %rbp         # 8-byte Reload
	movq	%rbp, 96(%rsp)
	movq	%r15, 88(%rsp)
	movq	%r14, 80(%rsp)
	movq	%r10, 72(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r11, 40(%rsp)
	movq	%r12, 32(%rsp)
	leaq	96(%rsp), %rcx
	leaq	88(%rsp), %rdx
	leaq	80(%rsp), %r8
	leaq	72(%rsp), %r9
	callq	"?u512_mod_n@@YAXAEA_K000_K111@Z"
	movq	96(%rsp), %rax
	movq	104(%rsp), %rcx         # 8-byte Reload
	movq	%rax, (%rcx)
	movq	88(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	80(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	72(%rsp), %rax
	movq	%rax, 24(%rcx)
	addq	$296, %rsp              # imm = 0x128
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 "?u512_mod_n@@YAXAEA_K000_K111@Z";
	.scl	3;
	.type	32;
	.endef
	.p2align	4, 0x90         # -- Begin function ?u512_mod_n@@YAXAEA_K000_K111@Z
"?u512_mod_n@@YAXAEA_K000_K111@Z":      # @"?u512_mod_n@@YAXAEA_K000_K111@Z"
.seh_proc "?u512_mod_n@@YAXAEA_K000_K111@Z"
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%r13
	.seh_pushreg 13
	pushq	%r12
	.seh_pushreg 12
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movq	%r9, %r15
	movq	%r8, 40(%rsp)           # 8-byte Spill
	movq	%rdx, 32(%rsp)          # 8-byte Spill
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	movq	192(%rsp), %r9
	movq	184(%rsp), %rbp
	movq	176(%rsp), %r8
	movabsq	$4624529908474429119, %rcx # imm = 0x402DA1732FC9BEBF
	movq	%r8, %rax
	mulq	%rcx
	movq	%rdx, 64(%rsp)          # 8-byte Spill
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%rbp, %rax
	mulq	%rcx
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	movq	%rax, %r12
	movq	%r9, %rax
	mulq	%rcx
	movq	%rax, %rbx
	movq	%rdx, (%rsp)            # 8-byte Spill
	movq	200(%rsp), %r11
	movq	%r11, %rax
	mulq	%rcx
	movq	%rax, %rdi
	movq	%rdx, %r13
	movabsq	$4994812053365940164, %rsi # imm = 0x4551231950B75FC4
	movq	%r8, %rax
	mulq	%rsi
	movq	%rdx, 56(%rsp)          # 8-byte Spill
	movq	%rax, %r14
	movq	%rbp, %rax
	mulq	%rsi
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	%rax, %r10
	movq	%r9, %rax
	movq	%r9, %rcx
	mulq	%rsi
	movq	%rdx, %rbp
	movq	%rax, %r8
	movq	%r11, %rax
	mulq	%rsi
	movq	%rax, %rsi
	xorl	%r9d, %r9d
	#APP

	addq	%r14, %r12
	adcq	%r10, %rbx
	adcq	%r8, %rdi
	adcq	%rcx, %rsi
	adcq	%rdx, %r11
	adcq	$0, %r9

	#NO_APP
	movq	64(%rsp), %rax          # 8-byte Reload
	movq	176(%rsp), %rdx
	movq	184(%rsp), %rcx
	#APP

	addq	%rax, %r12
	adcq	%rdx, %rbx
	adcq	%rcx, %rdi
	adcq	%r13, %rsi
	adcq	$0, %r11
	adcq	$0, %r9

	#NO_APP
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	(%rsp), %rdx            # 8-byte Reload
	#APP

	addq	%rax, %rbx
	adcq	%rdx, %rdi
	adcq	%rbp, %rsi
	adcq	$0, %r11
	adcq	$0, %r9

	#NO_APP
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	48(%rsp), %rcx          # 8-byte Reload
	#APP

	addq	%rax, %rbx
	adcq	%rcx, %rdi
	adcq	$0, %rsi
	adcq	$0, %r11
	adcq	$0, %r9

	#NO_APP
	movq	%r15, 16(%rsp)          # 8-byte Spill
	movq	(%r15), %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx), %rcx
	movq	32(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx), %rdx
	movq	24(%rsp), %rbp          # 8-byte Reload
	movq	(%rbp), %rbp
	movq	8(%rsp), %r8            # 8-byte Reload
	#APP

	addq	%rbp, %r8
	adcq	%rdx, %r12
	adcq	%rcx, %rbx
	adcq	%rax, %rdi
	adcq	$0, %rsi
	adcq	$0, %r11
	adcq	$0, %r9

	#NO_APP
	movq	%rsi, %rax
	movabsq	$4624529908474429119, %rcx # imm = 0x402DA1732FC9BEBF
	mulq	%rcx
	movq	%rdx, %r14
	movq	%rax, %r10
	movq	%r11, %rax
	mulq	%rcx
	movq	%rdx, (%rsp)            # 8-byte Spill
	movq	%rax, %r13
	movq	%rsi, %rax
	movabsq	$4994812053365940164, %r15 # imm = 0x4551231950B75FC4
	mulq	%r15
	movq	%rax, %rbp
	movq	%rdx, 8(%rsp)           # 8-byte Spill
	movq	%r9, %rdx
	negq	%rdx
	movq	%rdx, %rcx
	andq	%r15, %rcx
	movabsq	$4624529908474429119, %rax # imm = 0x402DA1732FC9BEBF
	andq	%rax, %rdx
	movq	%r11, %rax
	#APP

	addq	%rbp, %r13
	adcq	%rdx, %rsi
	adcq	%rcx, %r11
	adcq	$0, %r9

	#NO_APP
	movq	%r15, %rcx
	mulq	%r15
	#APP

	addq	%r14, %r13
	adcq	%rax, %rsi
	adcq	%rdx, %r11
	adcq	$0, %r9

	#NO_APP
	movq	(%rsp), %rax            # 8-byte Reload
	#APP

	addq	%rax, %rsi
	adcq	$0, %r11
	adcq	$0, %r9

	#NO_APP
	movq	8(%rsp), %rax           # 8-byte Reload
	#APP

	addq	%rax, %rsi
	adcq	$0, %r11
	adcq	$0, %r9

	#NO_APP
	#APP

	addq	%r8, %r10
	adcq	%r12, %r13
	adcq	%rbx, %rsi
	adcq	%rdi, %r11
	adcq	$0, %r9

	#NO_APP
	cmpq	$1, %r9
	je	.LBB18_4
# %bb.1:
	cmpq	$2, %r9
	jne	.LBB18_2
# %bb.3:
	movabsq	$-9197684256760693378, %rax # imm = 0x805B42E65F937D7E
	movabsq	$-8457119966977671288, %rcx # imm = 0x8AA24632A16EBF88
	movl	$2, %edx
	#APP

	addq	%rax, %r10
	adcq	%rcx, %r13
	adcq	%rdx, %rsi
	adcq	$0, %r11

	#NO_APP
	jmp	.LBB18_7
.LBB18_4:
	movl	$1, %eax
	movabsq	$4624529908474429119, %rdi # imm = 0x402DA1732FC9BEBF
	movq	%rdi, %r9
	movq	%rcx, %rdi
	#APP

	addq	%r9, %r10
	adcq	%rcx, %r13
	adcq	%rax, %rsi
	adcq	$0, %r11

	#NO_APP
	jmp	.LBB18_5
.LBB18_2:
	movabsq	$4624529908474429119, %rdi # imm = 0x402DA1732FC9BEBF
	movq	%rdi, %r9
	movq	%rcx, %rdi
.LBB18_5:
	xorl	%ebx, %ebx
	movl	$1, %r8d
	movq	%r10, %rax
	movq	%rsi, %rcx
	movq	%r13, %rbp
	movq	%r11, %rdx
	#APP

	addq	%r9, %rax
	adcq	%rdi, %rbp
	adcq	%r8, %rcx
	adcq	$0, %rdx
	adcq	$0, %rbx

	#NO_APP
	testq	%rbx, %rbx
	je	.LBB18_7
# %bb.6:
	movq	%rbp, %r13
	movq	%rcx, %rsi
	movq	%rdx, %r11
	movq	%rax, %r10
.LBB18_7:
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	%r10, (%rax)
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	%r13, (%rax)
	movq	40(%rsp), %rax          # 8-byte Reload
	movq	%rsi, (%rax)
	movq	16(%rsp), %rax          # 8-byte Reload
	movq	%r11, (%rax)
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_square_n;
	.scl	2;
	.type	32;
	.endef
	.globl	u256_square_n           # -- Begin function u256_square_n
	.p2align	4, 0x90
u256_square_n:                          # @u256_square_n
.seh_proc u256_square_n
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%r13
	.seh_pushreg 13
	pushq	%r12
	.seh_pushreg 12
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$168, %rsp
	.seh_stackalloc 168
	.seh_endprologue
	movq	%rdx, 160(%rsp)         # 8-byte Spill
	movq	(%rcx), %rbx
	movq	8(%rcx), %rsi
	movq	%rbx, %rax
	mulq	%rbx
	movq	%rdx, 104(%rsp)         # 8-byte Spill
	movq	%rax, 152(%rsp)         # 8-byte Spill
	movq	%rsi, %rax
	mulq	%rbx
	movq	%rax, %r10
	movq	%rdx, 128(%rsp)         # 8-byte Spill
	movq	16(%rcx), %r8
	movq	%r8, %rax
	mulq	%rbx
	movq	%rax, %r14
	movq	%rdx, 136(%rsp)         # 8-byte Spill
	movq	24(%rcx), %rcx
	movq	%rcx, %rax
	mulq	%rbx
	movq	%rdx, 112(%rsp)         # 8-byte Spill
	movq	%rax, %r12
	movq	%rsi, %rax
	mulq	%rsi
	movq	%rdx, 144(%rsp)         # 8-byte Spill
	movq	%rax, %rbx
	movq	%r8, %rax
	mulq	%rsi
	movq	%rdx, 120(%rsp)         # 8-byte Spill
	movq	%rax, %r11
	movq	%rcx, %rax
	mulq	%rsi
	movq	%rdx, %r13
	movq	%rax, %r9
	movq	%r8, %rax
	mulq	%r8
	movq	%rdx, 96(%rsp)          # 8-byte Spill
	movq	%rax, %rdi
	movq	%rcx, %rax
	mulq	%r8
	movq	%rdx, %r8
	movq	%rax, %rsi
	movq	%rcx, %rax
	mulq	%rcx
	movq	%r14, %rbp
	movq	%r9, %rcx
	movq	%r12, %r15
	#APP

	addq	%r10, %r10
	adcq	%rbx, %rbp
	adcq	%r11, %r15
	adcq	%rdi, %rcx
	adcq	%rsi, %rsi
	adcq	%r8, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	104(%rsp), %rdi         # 8-byte Reload
	#APP

	addq	%rdi, %r10
	adcq	%r14, %rbp
	adcq	%r11, %r15
	adcq	%r9, %rcx
	adcq	%r13, %rsi
	adcq	%r8, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	112(%rsp), %r8          # 8-byte Reload
	movq	128(%rsp), %rdi         # 8-byte Reload
	movq	96(%rsp), %rbx          # 8-byte Reload
	#APP

	addq	%rdi, %rbp
	adcq	%r12, %r15
	adcq	%r8, %rcx
	adcq	%rbx, %rsi
	adcq	$0, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	136(%rsp), %r9          # 8-byte Reload
	movq	120(%rsp), %rbx         # 8-byte Reload
	#APP

	addq	%rdi, %rbp
	adcq	%r9, %r15
	adcq	%rbx, %rcx
	adcq	%r13, %rsi
	adcq	$0, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	144(%rsp), %rdi         # 8-byte Reload
	#APP

	addq	%rdi, %r15
	adcq	%rbx, %rcx
	adcq	$0, %rsi
	adcq	$0, %rax
	adcq	$0, %rdx

	#NO_APP
	#APP

	addq	%r9, %r15
	adcq	%r8, %rcx
	adcq	$0, %rsi
	adcq	$0, %rax
	adcq	$0, %rdx

	#NO_APP
	movq	152(%rsp), %rbx         # 8-byte Reload
	movq	%rbx, 88(%rsp)
	movq	%r10, 80(%rsp)
	movq	%rbp, 72(%rsp)
	movq	%r15, 64(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	88(%rsp), %rcx
	leaq	80(%rsp), %rdx
	leaq	72(%rsp), %r8
	leaq	64(%rsp), %r9
	callq	"?u512_mod_n@@YAXAEA_K000_K111@Z"
	movq	88(%rsp), %rax
	movq	160(%rsp), %rcx         # 8-byte Reload
	movq	%rax, (%rcx)
	movq	80(%rsp), %rax
	movq	%rax, 8(%rcx)
	movq	72(%rsp), %rax
	movq	%rax, 16(%rcx)
	movq	64(%rsp), %rax
	movq	%rax, 24(%rcx)
	addq	$168, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_inv_n;
	.scl	2;
	.type	32;
	.endef
	.globl	u256_inv_n              # -- Begin function u256_inv_n
	.p2align	4, 0x90
u256_inv_n:                             # @u256_inv_n
.seh_proc u256_inv_n
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbp
	.seh_pushreg 5
	pushq	%rbx
	.seh_pushreg 3
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	%rdx, %rsi
	movq	(%rcx), %rax
	movq	8(%rcx), %rdx
	cmpq	$1, %rax
	jne	.LBB20_5
# %bb.1:
	testq	%rdx, %rdx
	jne	.LBB20_5
# %bb.2:
	cmpq	$0, 16(%rcx)
	jne	.LBB20_4
# %bb.3:
	cmpq	$0, 24(%rcx)
	je	.LBB20_8
.LBB20_4:
	xorl	%edx, %edx
.LBB20_5:
	movq	%rax, 32(%rsp)
	movq	%rdx, 40(%rsp)
	movq	16(%rcx), %rbp
	movq	%rbp, 48(%rsp)
	movq	24(%rcx), %rcx
	movq	%rcx, 56(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rbp, 80(%rsp)
	movq	%rcx, 88(%rsp)
	leaq	64(%rsp), %rdi
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	leaq	32(%rsp), %rbx
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movl	$127, %ebp
	.p2align	4, 0x90
.LBB20_6:                               # =>This Inner Loop Header: Depth=1
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	callq	u256_square_n
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rbx, %r8
	callq	u256_mul_n
	addl	$-1, %ebp
	jne	.LBB20_6
# %bb.7:
	movaps	32(%rsp), %xmm0
	movups	%xmm0, (%rsi)
	movaps	48(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
.LBB20_9:
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	retq
.LBB20_8:
	movq	$1, (%rsi)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 8(%rsi)
	movq	$0, 24(%rsi)
	jmp	.LBB20_9
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_norm_n;
	.scl	2;
	.type	32;
	.endef
	.globl	u256_norm_n             # -- Begin function u256_norm_n
	.p2align	4, 0x90
u256_norm_n:                            # @u256_norm_n
.seh_proc u256_norm_n
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	.seh_endprologue
	movq	(%rcx), %r10
	movq	8(%rcx), %rdx
	movq	16(%rcx), %r8
	movq	24(%rcx), %r9
	xorl	%eax, %eax
	movabsq	$4624529908474429119, %r11 # imm = 0x402DA1732FC9BEBF
	movabsq	$4994812053365940164, %rsi # imm = 0x4551231950B75FC4
	movl	$1, %edi
	#APP

	addq	%r11, %r10
	adcq	%rsi, %rdx
	adcq	%rdi, %r8
	adcq	$0, %r9
	adcq	$0, %rax

	#NO_APP
	testq	%rax, %rax
	je	.LBB21_2
# %bb.1:
	movq	%r10, (%rcx)
	movq	%rdx, 8(%rcx)
	movq	%r8, 16(%rcx)
	movq	%r9, 24(%rcx)
.LBB21_2:
	popq	%rdi
	popq	%rsi
	retq
	.seh_handlerdata
	.text
	.seh_endproc
                                        # -- End function
	.def	 u256_add_n;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_add_n
	.globl	u256_add_n              # -- Begin function u256_add_n
	.p2align	4, 0x90
u256_add_n:                             # @u256_add_n
.seh_proc u256_add_n
# %bb.0:
	pushq	%r15
	.seh_pushreg 15
	pushq	%r14
	.seh_pushreg 14
	pushq	%r12
	.seh_pushreg 12
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbx
	.seh_pushreg 3
	.seh_endprologue
	movq	(%rcx), %rax
	movq	8(%rcx), %r9
	movq	16(%rcx), %r10
	movq	24(%rcx), %r11
	movq	24(%rdx), %rcx
	movq	16(%rdx), %rsi
	movq	(%rdx), %rdi
	movq	8(%rdx), %rdx
	xorl	%ebx, %ebx
	#APP

	addq	%rdi, %rax
	adcq	%rdx, %r9
	adcq	%rsi, %r10
	adcq	%rcx, %r11
	adcq	$0, %rbx

	#NO_APP
	movabsq	$4624529908474429119, %r14 # imm = 0x402DA1732FC9BEBF
	movabsq	$4994812053365940164, %r15 # imm = 0x4551231950B75FC4
	movl	$1, %r12d
	movq	%r11, %rcx
	movq	%rax, %rdx
	movq	%r10, %rsi
	movq	%r9, %rdi
	#APP

	addq	%r14, %rdx
	adcq	%r15, %rdi
	adcq	%r12, %rsi
	adcq	$0, %rcx
	adcq	$0, %rbx

	#NO_APP
	testq	%rbx, %rbx
	je	.LBB22_2
# %bb.1:
	movq	%rdi, %r9
	movq	%rsi, %r10
	movq	%rcx, %r11
	movq	%rdx, %rax
.LBB22_2:
	movq	%rax, (%r8)
	movq	%r9, 8(%r8)
	movq	%r10, 16(%r8)
	movq	%r11, 24(%r8)
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,u256_add_n
	.seh_endproc
                                        # -- End function
	.def	 u256_sub_n;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_sub_n
	.globl	u256_sub_n              # -- Begin function u256_sub_n
	.p2align	4, 0x90
u256_sub_n:                             # @u256_sub_n
.seh_proc u256_sub_n
# %bb.0:
	pushq	%r14
	.seh_pushreg 14
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	pushq	%rbx
	.seh_pushreg 3
	.seh_endprologue
	movq	(%rcx), %r10
	movq	8(%rcx), %rax
	movq	16(%rcx), %r9
	movq	24(%rcx), %rcx
	movq	24(%rdx), %r11
	movq	16(%rdx), %rsi
	movq	(%rdx), %rdi
	movq	8(%rdx), %rbx
	movl	$1, %r14d
	movl	$1, %edx
	#APP

	subq	%rdi, %r10
	sbbq	%rbx, %rax
	sbbq	%rsi, %r9
	sbbq	%r11, %rcx
	sbbq	$0, %rdx

	#NO_APP
	testq	%rdx, %rdx
	jne	.LBB23_2
# %bb.1:
	movabsq	$4624529908474429119, %rdx # imm = 0x402DA1732FC9BEBF
	movabsq	$4994812053365940164, %rbx # imm = 0x4551231950B75FC4
	#APP

	subq	%rdx, %r10
	sbbq	%rbx, %rax
	sbbq	%r14, %r9
	sbbq	$0, %rcx

	#NO_APP
.LBB23_2:
	movq	%r10, (%r8)
	movq	%rax, 8(%r8)
	movq	%r9, 16(%r8)
	movq	%rcx, 24(%r8)
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,u256_sub_n
	.seh_endproc
                                        # -- End function
	.def	 u256_neg_n;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,u256_neg_n
	.globl	u256_neg_n              # -- Begin function u256_neg_n
	.p2align	4, 0x90
u256_neg_n:                             # @u256_neg_n
.seh_proc u256_neg_n
# %bb.0:
	pushq	%rsi
	.seh_pushreg 6
	pushq	%rdi
	.seh_pushreg 7
	.seh_endprologue
	movq	(%rcx), %r8
	movq	8(%rcx), %r9
	movq	%r8, %rax
	orq	%r9, %rax
	jne	.LBB24_4
# %bb.1:
	cmpq	$0, 16(%rcx)
	jne	.LBB24_3
# %bb.2:
	cmpq	$0, 24(%rcx)
	je	.LBB24_5
.LBB24_3:
	xorl	%r9d, %r9d
.LBB24_4:
	movq	16(%rcx), %r10
	movq	24(%rcx), %r11
	movabsq	$-4624529908474429119, %rax # imm = 0xBFD25E8CD0364141
	movabsq	$-4994812053365940165, %rcx # imm = 0xBAAEDCE6AF48A03B
	movq	$-2, %rsi
	movq	$-1, %rdi
	#APP

	subq	%r8, %rax
	sbbq	%r9, %rcx
	sbbq	%r10, %rsi
	sbbq	%r11, %rdi

	#NO_APP
	movq	%rax, (%rdx)
	movq	%rcx, 8(%rdx)
	movq	%rsi, 16(%rdx)
	movq	%rdi, 24(%rdx)
	popq	%rdi
	popq	%rsi
	retq
.LBB24_5:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rdx)
	movups	%xmm0, (%rdx)
	popq	%rdi
	popq	%rsi
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,u256_neg_n
	.seh_endproc
                                        # -- End function
	.section	.rdata,"dr"
	.p2align	4               # @__const.u256_pow_p.ret
.L__const.u256_pow_p.ret:
	.quad	1                       # 0x1
	.quad	0                       # 0x0
	.quad	0                       # 0x0
	.quad	0                       # 0x0

	.section	.drectve,"yn"
	.ascii	" /FAILIFMISMATCH:\"_MSC_VER=1900\""
	.ascii	" /FAILIFMISMATCH:\"_ITERATOR_DEBUG_LEVEL=0\""
	.ascii	" /FAILIFMISMATCH:\"RuntimeLibrary=MT_StaticRelease\""
	.ascii	" /DEFAULTLIB:libcpmt.lib"

	.ascii	" /EXPORT:lzcnt"
	.ascii	" /EXPORT:u256_less_than"
	.ascii	" /EXPORT:u256_less_than_equal"
	.ascii	" /EXPORT:u256_great_than"
	.ascii	" /EXPORT:u256_great_than_equal"
	.ascii	" /EXPORT:u256_mul_u64_p"
	.ascii	" /EXPORT:u256_mul_p"
	.ascii	" /EXPORT:u256_square_p"
	.ascii	" /EXPORT:u256_norm_p"
	.ascii	" /EXPORT:u256_add_p"
	.ascii	" /EXPORT:u256_sub_p"
	.ascii	" /EXPORT:u256_neg_p"
	.ascii	" /EXPORT:u256_pow_u64_p"
	.ascii	" /EXPORT:u256_pow_p"
	.ascii	" /EXPORT:u256_inv_p"
	.ascii	" /EXPORT:u256_sqrt_p"
	.ascii	" /EXPORT:u256_fast_sqrt_p"
	.ascii	" /EXPORT:u256_mul_n"
	.ascii	" /EXPORT:u256_square_n"
	.ascii	" /EXPORT:u256_inv_n"
	.ascii	" /EXPORT:u256_norm_n"
	.ascii	" /EXPORT:u256_add_n"
	.ascii	" /EXPORT:u256_sub_n"
	.ascii	" /EXPORT:u256_neg_n"
	.addrsig
