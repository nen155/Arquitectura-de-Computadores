	.file	"pmm-secuencial-modificado.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta fila y columna\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Matrices:%u\t/ m[0][0]*m2[0][0]=res[0][0](%8.6f+%8.6f=%8.6f) // m[%d][%d]*m2[%d][%d]=res[%d][%d](%8.6f+%8.6f=%8.6f) /\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	cmpl	$1, %edi
	jg	.L2
	movq	stderr(%rip), %rcx
	movl	$21, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L2:
	movq	8(%rsi), %rdi
	movl	$10, %edx		//MUEVO UN 10 A RDX=EDX=10
	movl	$0, %esi
	call	strtol
	movq	%rax, %r14
	movq	%rax, 48(%rsp)
	movl	%eax, 32(%rsp)
	movslq	%r14d, %rax
	leaq	0(,%rax,8), %r15
	movq	%r15, %rdi
	call	malloc
	movq	%rax, %rbp	//GUARDO M EN RBP
	movq	%r15, %rdi
	call	malloc
	movq	%rax, %rbx	//GUARDO M2 EN RBX
	movq	%r15, %rdi
	call	malloc
	movq	%rax, 24(%rsp)	//GUARDO RES EN 24(RSP)
	movl	%r14d, %eax
	addl	$63, %eax
	testl	%r14d, %r14d
	cmovns	%r14d, %eax
	andl	$-64, %eax
	movl	%eax, 36(%rsp)
	testl	%r14d, %r14d
	jle	.L3
	movl	%r14d, %eax
	subl	$1, %eax
	leaq	8(,%rax,8), %r13
	movl	$0, %r12d
.L5:
	movq	%r15, %rdi
	call	malloc
	movq	%rax, 0(%rbp,%r12)
	addq	$8, %r12
	cmpq	%r13, %r12
	jne	.L5
	movl	$0, %r12d
.L7:
	movq	%r15, %rdi
	call	malloc
	movq	%rax, (%rbx,%r12)
	addq	$8, %r12
	cmpq	%r13, %r12
	jne	.L7
	movl	$0, %r12d
.L9:
	movq	%r15, %rdi
	call	malloc
	movq	24(%rsp), %rsi
	movq	%rax, (%rsi,%r12)
	addq	$8, %r12
	cmpq	%r13, %r12
	jne	.L9
	leaq	64(%rsp), %rsi
	movl	$0, %edi
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
	movq	48(%rsp), %r14
	leal	-1(%r14), %ecx
	movq	24(%rsp), %rsi
	movq	-8(%rsi,%r15), %rax
	movsd	-8(%rax,%r15), %xmm6
	movq	-8(%rbx,%r15), %rax
	movsd	-8(%rax,%r15), %xmm5
	movq	-8(%rbp,%r15), %rax
	movsd	-8(%rax,%r15), %xmm4
	movq	(%rsi), %rsi
	movq	(%rbx), %rdx
	movq	0(%rbp), %rax
	movq	80(%rsp), %rdi
	subq	64(%rsp), %rdi
	cvtsi2sdq	%rdi, %xmm1
	movq	88(%rsp), %rdi
	subq	72(%rsp), %rdi
	cvtsi2sdq	%rdi, %xmm0
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	addsd	40(%rsp), %xmm0
	movl	%ecx, 16(%rsp)
	movl	%ecx, 8(%rsp)
	movl	%ecx, (%rsp)
	movl	%ecx, %r9d
	movl	%ecx, %r8d
	movsd	(%rsi), %xmm3
	movsd	(%rdx), %xmm2
	movsd	(%rax), %xmm1
	movl	%r14d, %edx
	movl	$.LC5, %esi
	movl	$1, %edi
	movl	$7, %eax
	call	__printf_chk
	testl	%r14d, %r14d
	jle	.L24
	movl	$0, %r12d
.L26:
	movq	0(%rbp,%r12,8), %rdi
	call	free
	addq	$1, %r12
	cmpl	%r12d, 32(%rsp)
	jg	.L26
	movl	$0, %r12d
.L28:
	movq	(%rbx,%r12,8), %rdi
	call	free
	addq	$1, %r12
	cmpl	%r12d, 32(%rsp)
	jg	.L28
	movl	$0, %r12d
	movq	24(%rsp), %r13
.L29:
	movq	0(%r13,%r12,8), %rdi
	call	free
	addq	$1, %r12
	cmpl	%r12d, 32(%rsp)
	jg	.L29
	jmp	.L24
.L3:
	leaq	64(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime
	jmp	.L11
.L24:
	movq	%rbp, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	movq	24(%rsp), %rdi
	call	free
	movl	$0, %eax
	addq	$104, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
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
