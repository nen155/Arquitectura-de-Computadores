	call	clock_gettime
	movl	$0, %edx
	movsd	.LC0(%rip), %xmm1
.L5:
	movapd	%xmm1, %xmm0
	mulsd	0(%rbp,%rdx), %xmm0
	addsd	(%rbx,%rdx), %xmm0
	movsd	%xmm0, (%rbx,%rdx)
	addq	$8, %rdx
	cmpq	$800000000, %rdx
	jne	.L5
	leaq	16(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime
