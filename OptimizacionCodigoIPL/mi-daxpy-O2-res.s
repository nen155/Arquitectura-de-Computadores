	call	clock_gettime
	movsd	.LC0(%rip), %xmm1
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	0(%rbp,%rdx), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	(%rbx,%rdx), %xmm0
	movsd	%xmm0, (%rbx,%rdx)
	addq	$8, %rdx
	cmpq	$800000000, %rdx
	jne	.L5
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
