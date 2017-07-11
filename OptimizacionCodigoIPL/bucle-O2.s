	call	clock_gettime
	movl	$0, %eax			//TENGO 0 EN EAX
	movsd	.LC1(%rip), %xmm2		//ME POSICIONO MUCHISIMO SOBRE RIP Y LO METO EN XMM2
	movsd	.LC2(%rip), %xmm1		//ME POSICIONO MUCHISIMO SOBRE RIP Y LO METO EN XMM1
	xorpd	%xmm0, %xmm0			//HAGO XMM0= 0
	jmp	.L30
.L12:
	movsd	%xmm2, (%rdi,%rdx,8)		//METO EL NUMERO DE XMM2 EN LA DIRECCION RDX=10*8+RDI=RAX=0*8+DIRECCION DE M
	movsd	%xmm1, (%rsi,%rdx,8)		//METO EL NUMERO DE XMM1 EN LA DIRECCION RDX=10*8+RSI=RAX=0*8+DIRECCION DE M2
	movsd	%xmm0, (%rcx,%rdx,8)		//METO EL NUMERO DE XMM0 EN LA DIRECCION RDX=10*8+RCX=RAX=0*8+DIRECCION DE RES
	addq	$1, %rdx			//AÑADO RDX=10+1
	cmpl	%edx, 32(%rsp)			//COMPARO EDX EL INDICE CON EL FINAL
	jg	.L12
	addq	$1, %rax			//AÑADO RAX=0+1
	cmpl	%eax, 32(%rsp)			//COMPARO RAX EL INDICE CON EL FINAL
	jle	.L11
.L30:
	movq	0(%rbp,%rax,8), %rdi		//METO EN RDI=RAX=0*8+DIRECCION DE M
	movq	(%rbx,%rax,8), %rsi		//METO EN RSI=RAX=0*8+DIRECCION DE M2
	movq	24(%rsp), %rcx			//METO EN RCX= RES
	movq	(%rcx,%rax,8), %rcx		//RCX=RAX=0*8+DIRECCION RES
	movl	$0, %edx			//EDX=0
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
	cmpl	$0, 36(%rsp)
	jle	.L13
	movl	$0, %r11d
	movq	%r15, 56(%rsp)
	jmp	.L14
.L20:
	movslq	%r9d, %rsi
	salq	$3, %rsi
	leaq	(%r14,%rsi), %r10
	movsd	(%r10), %xmm0
	cmpl	%r11d, %edi
	jle	.L15
	movq	0(%rbp,%r12,8), %r8
	movl	%r11d, %eax
.L16:
	movslq	%eax, %rdx
	movq	(%rbx,%rdx,8), %rcx
	movsd	(%r8,%rdx,8), %xmm1
	mulsd	(%rcx,%rsi), %xmm1
	addsd	%xmm1, %xmm0
	addl	$1, %eax
	cmpl	%eax, %edi
	jg	.L16
.L15:
	movsd	%xmm0, (%r10)
	addl	$1, %r9d
	cmpl	%r9d, %r13d
	jg	.L20
.L19:
	addq	$1, %r12
	cmpl	%r12d, 32(%rsp)
	jle	.L18
.L22:
	cmpl	%r15d, %r13d
	jle	.L19
	movq	24(%rsp), %rax
	movq	(%rax,%r12,8), %r14
	movl	%r15d, %r9d
	jmp	.L20
.L18:
	addl	$64, %r15d
	cmpl	%r15d, 36(%rsp)
	jle	.L21
.L23:
	cmpl	$0, 32(%rsp)
	jle	.L18
	movl	$0, %r12d
	leal	64(%r15), %r13d
	jmp	.L22
.L21:
	addl	$64, %r11d
	cmpl	%r11d, 36(%rsp)
	jle	.L34
.L14:
	movl	$0, %r15d
	leal	64(%r11), %edi
	jmp	.L23
.L34:
	movq	56(%rsp), %r15
.L13:
	leaq	80(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime
