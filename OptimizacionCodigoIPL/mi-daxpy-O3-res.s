	call	clock_gettime
	movq	%rbx, %rdx
	xorl	%r9d, %r9d
	salq	$60, %rdx
	shrq	$63, %rdx
	movapd	(%rsp), %xmm1
	testl	%edx, %edx
	je	.L6
	movsd	.LC0(%rip), %xmm0
	movb	$1, %r9b
	mulsd	0(%rbp), %xmm0
	addsd	(%rbx), %xmm0
	movsd	%xmm0, (%rbx)
.L6:
	movl	$100000000, %eax
	xorl	%ecx, %ecx
	subl	%edx, %eax
	movl	%edx, %edx
	movl	%eax, %r8d
	leaq	0(,%rdx,8), %rsi
	xorl	%edx, %edx
	shrl	%r8d
	leal	(%r8,%r8), %r10d
	leaq	(%rbx,%rsi), %rdi
	addq	%rbp, %rsi
	.p2align 4,,10
	.p2align 3
.L9:
	movsd	(%rsi,%rdx), %xmm0
	addl	$1, %ecx
	movhpd	8(%rsi,%rdx), %xmm0
	mulpd	%xmm1, %xmm0
	addpd	(%rdi,%rdx), %xmm0
	movapd	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpl	%r8d, %ecx
	jb	.L9
	cmpl	%r10d, %eax
	leal	(%r9,%r10), %edx
	je	.L8
	movsd	.LC0(%rip), %xmm0
	movslq	%edx, %rdx
	leaq	(%rbx,%rdx,8), %rax
	mulsd	0(%rbp,%rdx,8), %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
.L8:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
