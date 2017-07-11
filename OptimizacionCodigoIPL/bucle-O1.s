	call	clock_gettime
	movl	$0, %eax
	movsd	.LC1(%rip), %xmm2
	movsd	.LC2(%rip), %xmm1
	xorpd	%xmm0, %xmm0
	jmp	.L30
.L12:
	movsd	%xmm2, (%rdi,%rdx,8)
	movsd	%xmm1, (%rsi,%rdx,8)
	movsd	%xmm0, (%rcx,%rdx,8)
	addq	$1, %rdx
	cmpl	%edx, 32(%rsp)
	jg	.L12
	addq	$1, %rax
	cmpl	%eax, 32(%rsp)
	jle	.L11
.L30:
	movq	0(%rbp,%rax,8), %rdi
	movq	(%rbx,%rax,8), %rsi
	movq	24(%rsp), %rcx
	movq	(%rcx,%rax,8), %rcx
	movl	$0, %edx
	jmp	.L12
.L11:
	leaq	80(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	80(%rsp), %rax
	subq	64(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movq	88(%rsp), %rax
	subq	72(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	addsd	.LC3(%rip), %xmm0
	movsd	%xmm0, 40(%rsp)
	leaq	64(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	0
	.long	1074266112
	.align 8
.LC3:
	.long	0
	.long	0
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
