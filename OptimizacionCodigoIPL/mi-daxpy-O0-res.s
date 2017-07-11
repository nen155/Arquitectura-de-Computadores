call	clock_gettime
	movl	$0, -72(%rbp) //I=0
	jmp	.L4
.L5:
	movl	-72(%rbp), %eax //I A EAX
	cltq
	leaq	0(,%rax,8), %rdx //RDX = I+8
	movq	-48(%rbp), %rax  // Y A RAX
	addq	%rdx, %rax	//RDX = I+8 +Y
	movl	-72(%rbp), %edx //I= I+8 +Y
	movslq	%edx, %rdx	//RDX =EDX
	leaq	0(,%rdx,8), %rcx //RCX = I+8
	movq	-48(%rbp), %rdx  //RDX= Y
	addq	%rcx, %rdx	//RCX =I+8+Y
	movsd	(%rdx), %xmm1	//VALOR DE RDX A XMM1
	movl	-72(%rbp), %edx	//EDX=I
	movslq	%edx, %rdx	//RDX = EDX
	leaq	0(,%rdx,8), %rcx //RCX=I+8
	movq	-56(%rbp), %rdx  //RDX=X
	addq	%rcx, %rdx	//RDX=I+8+X
	movsd	(%rdx), %xmm0	//VALOR DE RDX A XMM0
	mulsd	-64(%rbp), %xmm0 //A MULTIPLICO POR XMM0
	addsd	%xmm1, %xmm0	//XMM1 = Y+X*A
	movsd	%xmm0, (%rax)	//X A DIRECCION DE RAX
	addl	$1, -72(%rbp)	// SUMO 1 A I
.L4:
	movl	-72(%rbp), %eax	//I A EAX
	cmpl	-68(%rbp), %eax	//COMPARO CON N
	jl	.L5 		//FIN DEL BUCLE
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	
