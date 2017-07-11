	.file	"pmm-secuencial-modificado.c"
	.section	.rodata
.LC0:
	.string	"Falta fila y columna\n"
	.align 8
.LC5:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Matrices:%u\t/ m[0][0]*m2[0][0]=res[0][0](%8.6f+%8.6f=%8.6f) // m[%d][%d]*m2[%d][%d]=res[%d][%d](%8.6f+%8.6f=%8.6f) /\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$168, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -164(%rbp)
	movq	%rsi, -176(%rbp)
	cmpl	$1, -164(%rbp)
	jg	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$21, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L2:
	movq	-176(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -136(%rbp)
	movl	$64, -132(%rbp)
	movl	$0, %eax
	movq	%rax, -120(%rbp)
	movl	-136(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -112(%rbp)		//INICIALIZO M
	movl	-136(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -104(%rbp)		//INICIALIZO M2
	movl	-136(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -96(%rbp)			//INICIALIZO RES
	movl	-136(%rbp), %eax
	cltd
	idivl	-132(%rbp)
	imull	-132(%rbp), %eax
	movl	%eax, -128(%rbp)
	movl	$0, -156(%rbp)			//VARIABLE i=0
	jmp	.L3
.L4:
	movl	-156(%rbp), %eax		//FIN BUCLE PARA INICIALIZAR CON MALLOC M
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-112(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-136(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	addl	$1, -156(%rbp)
.L3:
	movl	-156(%rbp), %eax 		//INICIO BUCLE PARA INICIALIZAR CON MALLOC M
	cmpl	-136(%rbp), %eax
	jl	.L4
	movl	$0, -156(%rbp)
	jmp	.L5
.L6:
	movl	-156(%rbp), %eax		//FIN BUCLE PARA INICIALIZAR CON MALLOC M2
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-136(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	addl	$1, -156(%rbp)
.L5:
	movl	-156(%rbp), %eax
	cmpl	-136(%rbp), %eax		//INICIO BUCLE PARA INICIALIZAR CON MALLOC M2
	jl	.L6
	movl	$0, -156(%rbp)
	jmp	.L7
.L8:
	movl	-156(%rbp), %eax		//FIN BUCLE PARA INICIALIZAR CON MALLOC RES
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-136(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	addl	$1, -156(%rbp)
.L7:
	movl	-156(%rbp), %eax
	cmpl	-136(%rbp), %eax		//INICIO BUCLE PARA INICIALIZAR CON MALLOC RES
	jl	.L8
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime			//INICIO BUCLE DE DAR VALORES A M,M2,RES
	movl	$0, -156(%rbp)
	jmp	.L9
.L12:
	movl	$0, -152(%rbp)
	jmp	.L10
.L11:
	movl	-156(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movabsq	$4611686018427387904, %rax
	movq	%rax, (%rdx)
	movl	-156(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movabsq	$4613937818241073152, %rax
	movq	%rax, (%rdx)
	movl	-156(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, (%rdx)
	addl	$1, -152(%rbp)
.L10:
	movl	-152(%rbp), %eax
	cmpl	-136(%rbp), %eax
	jl	.L11
	addl	$1, -156(%rbp)
.L9:
	movl	-156(%rbp), %eax
	cmpl	-136(%rbp), %eax
	jl	.L12
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime			//FIN BUCLE DE DAR VALORES A M,M2,RES
	movq	-64(%rbp), %rdx			//GUARDAR VALOR EN NCGT
	movq	-80(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-56(%rbp), %rdx
	movq	-72(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	-88(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	movl	$0, -124(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi			//FIN GUARDAR VALOR EN NCGT
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
	movq	-64(%rbp), %rdx
	movq	-80(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-56(%rbp), %rdx
	movq	-72(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	-88(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	movl	-136(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-136(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movq	(%rax), %r8
	movl	-136(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-136(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-136(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-136(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-136(%rbp), %eax
	leal	-1(%rax), %r13d
	movl	-136(%rbp), %eax
	leal	-1(%rax), %r9d
	movl	-136(%rbp), %eax
	leal	-1(%rax), %r15d
	movl	-136(%rbp), %eax
	leal	-1(%rax), %r14d
	movl	-136(%rbp), %eax
	leal	-1(%rax), %r12d
	movl	-136(%rbp), %eax
	leal	-1(%rax), %ebx
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %r10
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rsi
	movl	-136(%rbp), %r11d
	movq	-88(%rbp), %rax
	movl	%r13d, 8(%rsp)
	movl	%r9d, (%rsp)
	movq	%r8, -184(%rbp)
	movsd	-184(%rbp), %xmm6
	movq	%rcx, -184(%rbp)
	movsd	-184(%rbp), %xmm5
	movq	%rdx, -184(%rbp)
	movsd	-184(%rbp), %xmm4
	movl	%r15d, %r9d
	movl	%r14d, %r8d
	movl	%r12d, %ecx
	movl	%ebx, %edx
	movq	%r10, -184(%rbp)
	movsd	-184(%rbp), %xmm3
	movq	%rdi, -184(%rbp)
	movsd	-184(%rbp), %xmm2
	movq	%rsi, -184(%rbp)
	movsd	-184(%rbp), %xmm1
	movl	%r11d, %esi
	movq	%rax, -184(%rbp)
	movsd	-184(%rbp), %xmm0
	movl	$.LC5, %edi
	movl	$7, %eax
	call	printf
	movl	$0, -156(%rbp)
	jmp	.L23
.L24:
	movl	-156(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	addl	$1, -156(%rbp)
.L23:
	movl	-156(%rbp), %eax
	cmpl	-136(%rbp), %eax
	jl	.L24
	movl	$0, -156(%rbp)
	jmp	.L25
.L26:
	movl	-156(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	addl	$1, -156(%rbp)
.L25:
	movl	-156(%rbp), %eax
	cmpl	-136(%rbp), %eax
	jl	.L26
	movl	$0, -156(%rbp)
	jmp	.L27
.L28:
	movl	-156(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	addl	$1, -156(%rbp)
.L27:
	movl	-156(%rbp), %eax
	cmpl	-136(%rbp), %eax
	jl	.L28
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
