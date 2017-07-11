	call	clock_gettime			//INICIO BUCLE DE MULTIPLICACION DE MATRICES
	movl	$0, -144(%rbp)
	jmp	.L13
.L22:
	movl	$0, -140(%rbp)			//
	jmp	.L14
.L21:
	movl	$0, -156(%rbp)			//INICIALIZO LA VARIBLE i=0
	jmp	.L15
.L20:
	movl	-140(%rbp), %eax
	movl	%eax, -148(%rbp)
	jmp	.L16
.L19:						//BUCLE INTERNO
	movl	-156(%rbp), %eax		//MUEVO i=-156 a EAX	
	cltq
	leaq	0(,%rax,8), %rdx		//RDX=8*i=-156
	movq	-96(%rbp), %rax			//MUEVO res a RAX
	addq	%rdx, %rax			//AÑADO RDX=8*i+RAX=RES SALTO DE ELEMENTO EN ELEMENTO DE RES
	movq	(%rax), %rax			//MUEVO LA DIRECCION DE RES A RAX
	movl	-148(%rbp), %edx		//MUEVO j=-148 en EDX
	movslq	%edx, %rdx			//MUEVO J A RDX
	salq	$3, %rdx			//MULTIPO POR 8 EL CONTENDIO DE j = RDX=8*J
	addq	%rdx, %rax			//AÑADO AL CONTENIDO DE LA DIRECCION DE RES +8*J
	movq	(%rax), %rax			//MUEVO LA DIRECCION DE RES A RAX
	movq	%rax, -120(%rbp)		//MUEVO LA DIRECCION DE RES A -120(RBP)
	movl	-144(%rbp), %eax		//MUEVO KK=-144 A EAX
	movl	%eax, -152(%rbp)		//MUEVO KK A K=-152 
	jmp	.L17
.L18:
	movl	-156(%rbp), %eax		// MUEVO i=-156 A EAX
	cltq
	leaq	0(,%rax,8), %rdx		//RDX=8*i=-156
	movq	-112(%rbp), %rax		//MUEVO m=-112 a RAX
	addq	%rdx, %rax			//AÑADO RDX=8*i+M
	movq	(%rax), %rax			//MUEVO LA DIRECCION DE M A RAX
	movl	-152(%rbp), %edx		//MUEVO K=-152 A EDX
	movslq	%edx, %rdx			//MUEVO K=-152 A RDX
	salq	$3, %rdx			//MULTIPLICO RDX=K*8 
	addq	%rdx, %rax			//AÑADO RDX=K*8+M=-112
	movsd	(%rax), %xmm1			//PASO LA EL VALOR DE M=-112 A XMM1
	movl	-152(%rbp), %eax		//MUEVO K=-152 A EAX
	cltq
	leaq	0(,%rax,8), %rdx		//MULTIPLICO RDX=K*8
	movq	-104(%rbp), %rax		//PASO M2=-104 A RAX
	addq	%rdx, %rax			//AÑADO RAX=M2=M2+RDX=K*8
	movq	(%rax), %rax			//PASO LA DIRECCION DE RAX A RAX
	movl	-148(%rbp), %edx		//MUEVO J=-148 A EDX
	movslq	%edx, %rdx			//MUEVO EDX A RDX
	salq	$3, %rdx			//MULTIPLICO RDX=J*8
	addq	%rdx, %rax			//AÑADO AL VALOR DE RAX RDX=J*8
	movsd	(%rax), %xmm0			//PASO EL VALOR DE LA DIRECCION DE RAX A XMM0
	mulsd	%xmm1, %xmm0			//MULTIPLICO VALORES XMM1=M*XMM0=M2
	movsd	-120(%rbp), %xmm1		//MUEVO LA DIRECCION DE RES A XMM1
	addsd	%xmm1, %xmm0			//AÑADO XMM1 A XMM0
	movsd	%xmm0, -120(%rbp)		//MUEVO XMM0 A RES
	addl	$1, -152(%rbp)		//AÑADO 1 A k=-152
.L17:
	movl	-132(%rbp), %eax	//MUEVO 64 A EAX
	movl	-144(%rbp), %edx	//MUEVO KK A EDX
	addl	%edx, %eax		//AÑADO EAX=64+KK
	cmpl	-152(%rbp), %eax	//COMPARO K CON EAX=64+KK
	jg	.L18
	movl	-156(%rbp), %eax	//MUEVO i=-156 A EAX
	cltq
	leaq	0(,%rax,8), %rdx	//MULTIPLICO RDX=I*8
	movq	-96(%rbp), %rax		//MUEVO RES A RAX
	addq	%rdx, %rax		//AÑADO RES+RDX=I*8
	movq	(%rax), %rax		//MUEVO LA DIRECCION DE RES A RAX
	movl	-148(%rbp), %edx	//MUEVO J A EDX
	movslq	%edx, %rdx		//MUEVO RDX=EDX
	salq	$3, %rdx		//MULTIPLICO RDX=J*8
	addq	%rax, %rdx		//AÑADO A LA DIRECCION DE RES=J*8
	movq	-120(%rbp), %rax	//MUEVO LA DIRECCION DE RES A RAX
	movq	%rax, (%rdx)		//MUEVO RAX A LA DIRECCION DE RDX
	addl	$1, -148(%rbp) 		//AÑADO 1 A j=-148
.L16:
	movl	-132(%rbp), %eax	//MUEVO 64 A EAX
	movl	-140(%rbp), %edx	//PASO jj=-140 a edx
	addl	%edx, %eax
	cmpl	-148(%rbp), %eax	//MUEVO j a EAX
	jg	.L19
	addl	$1, -156(%rbp) 		//AÑADO 1 A i
.L15:
	movl	-156(%rbp), %eax	//MUEVO i=-156 a EAX
	cmpl	-136(%rbp), %eax	//COMPARO N=-136 con i
	jl	.L20
	movl	-132(%rbp), %eax	//MUEVO 64 A EAX
	addl	%eax, -140(%rbp)	//AÑADO 64 A jj
.L14:
	movl	-140(%rbp), %eax	//paso jj=-140 a edx
	cmpl	-128(%rbp), %eax	//COMPARO jj CON en=-128
	jl	.L21
	movl	-132(%rbp), %eax	//MUEVO 64 A EAX
	addl	%eax, -144(%rbp)	//AÑADO 64 A kk=-144
.L13:
	movl	-144(%rbp), %eax	//MUEVO kk=-144 a EAX
	cmpl	-128(%rbp), %eax	//COMPARO KK CON en=-128
	jl	.L22
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime		//FIN BUCLE MATRIX MULTIPLICATION
