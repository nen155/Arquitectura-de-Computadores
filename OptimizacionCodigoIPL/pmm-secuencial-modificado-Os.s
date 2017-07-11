	.file	"pmm-secuencial-modificado.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta fila y columna\n"
.LC5:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Matrices:%u\t/ m[0][0]*m2[0][0]=res[0][0](%8.6f+%8.6f=%8.6f) // m[%d][%d]*m2[%d][%d]=res[%d][%d](%8.6f+%8.6f=%8.6f) /\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB21:
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	decl	%edi
	jg	.L2
	movq	stderr(%rip), %rsi
	movl	$.LC0, %edi
	call	fputs
	orl	$-1, %edi
	call	exit
.L2:
	movq	8(%rsi), %rdi
	xorl	%r15d, %r15d
	call	atoi
	movslq	%eax, %rbp
	movl	%eax, %ebx
	salq	$3, %rbp
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	malloc
	movq	%rax, %r14
	movl	%ebx, %eax
	movl	$64, %ecx
	cltd
	idivl	%ecx
	movl	%eax, 24(%rsp)
	sall	$6, 24(%rsp)
.L3:
	cmpl	%r15d, %ebx
	jle	.L33
	movq	%rbp, %rdi
	call	malloc
	movq	%rax, (%r12,%r15,8)
	incq	%r15
	jmp	.L3
.L33:
	xorl	%r15d, %r15d
.L5:
	cmpl	%r15d, %ebx
	jle	.L34
	movq	%rbp, %rdi
	call	malloc
	movq	%rax, 0(%r13,%r15,8)
	incq	%r15
	jmp	.L5
.L34:
	xorl	%r15d, %r15d
.L7:
	cmpl	%r15d, %ebx
	jle	.L35
	movq	%rbp, %rdi
	call	malloc
	movq	%rax, (%r14,%r15,8)
	incq	%r15
	jmp	.L7
.L35:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%edx, %edx
.L9:
	cmpl	%edx, %ebx
	jle	.L11
	xorl	%eax, %eax
.L12:
	cmpl	%eax, %ebx
	jle	.L36
	movq	(%r12,%rdx,8), %rcx
	movsd	.LC1(%rip), %xmm7
	movsd	.LC2(%rip), %xmm3
	movsd	%xmm7, (%rcx,%rax,8)
	movq	0(%r13,%rdx,8), %rcx
	movsd	%xmm3, (%rcx,%rax,8)
	movq	(%r14,%rdx,8), %rcx
	movq	$0, (%rcx,%rax,8)
	incq	%rax
	jmp	.L12
.L36:
	incq	%rdx
	jmp	.L9
.L11:
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	cvtsi2sdq	%rax, %xmm1
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm0, %xmm1
	addsd	.LC3(%rip), %xmm1
	movsd	%xmm1, 40(%rsp)
	call	clock_gettime
	movsd	.LC4(%rip), %xmm7
	xorl	%esi, %esi
	movsd	40(%rsp), %xmm1
	xorl	%r11d, %r11d
	movsd	%xmm7, 32(%rsp)
.L13:
	cmpl	24(%rsp), %r11d
	jge	.L20
	leaq	0(%r13,%rsi), %rax
	xorl	%edi, %edi
	xorl	%r15d, %r15d
	movq	%rax, 40(%rsp)
.L21:
	xorl	%eax, %eax
.L19:
	cmpl	%eax, %ebx
	jg	.L17
	addl	$64, %r15d
	addq	$512, %rdi
	cmpl	24(%rsp), %r15d
	jl	.L21
	addl	$64, %r11d
	addq	$512, %rsi
	jmp	.L13
.L20:
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	movsd	%xmm1, 24(%rsp)
	call	clock_gettime
	movq	-8(%r14,%rbp), %rax
	movsd	24(%rsp), %xmm1
	leal	-1(%rbx), %ecx
	movq	(%r14), %rdi
	movq	0(%r13), %rsi
	movq	(%r12), %rdx
	movsd	-8(%rax,%rbp), %xmm6
	movq	-8(%r13,%rbp), %rax
	movl	%ecx, %r9d
	movl	%ecx, %r8d
	movsd	-8(%rax,%rbp), %xmm5
	movq	-8(%r12,%rbp), %rax
	movsd	-8(%rax,%rbp), %xmm4
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	movl	%ecx, 16(%rsp)
	xorl	%ebp, %ebp
	movl	%ecx, 8(%rsp)
	movl	%ecx, (%rsp)
	movsd	(%rdi), %xmm3
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	cvtsi2sdq	%rax, %xmm2
	movb	$7, %al
	divsd	32(%rsp), %xmm2
	addsd	%xmm2, %xmm0
	movsd	(%rsi), %xmm2
	movl	$.LC5, %esi
	addsd	%xmm1, %xmm0
	movsd	(%rdx), %xmm1
	movl	%ebx, %edx
	call	__printf_chk
.L22:
	cmpl	%ebp, %ebx
	jle	.L37
	movq	(%r12,%rbp,8), %rdi
	incq	%rbp
	call	free
	jmp	.L22
.L37:
	xorl	%ebp, %ebp
.L24:
	cmpl	%ebp, %ebx
	jle	.L38
	movq	0(%r13,%rbp,8), %rdi
	incq	%rbp
	call	free
	jmp	.L24
.L38:
	xorl	%ebp, %ebp
.L26:
	cmpl	%ebp, %ebx
	jle	.L39
	movq	(%r14,%rbp,8), %rdi
	incq	%rbp
	call	free
	jmp	.L26
.L17:
	xorl	%ecx, %ecx
.L28:
	leaq	(%rcx,%rdi), %r9
	xorl	%edx, %edx
	movq	%r9, %r8
	addq	(%r14,%rax,8), %r8
	movsd	(%r8), %xmm0
.L14:
	movq	%rdx, %r10
	addq	(%r12,%rax,8), %r10
	movsd	(%r10,%rsi), %xmm2
	movq	40(%rsp), %r10
	movq	(%r10,%rdx), %r10
	addq	$8, %rdx
	cmpq	$512, %rdx
	mulsd	(%r10,%r9), %xmm2
	addsd	%xmm2, %xmm0
	jne	.L14
	addq	$8, %rcx
	movsd	%xmm0, (%r8)
	cmpq	$512, %rcx
	jne	.L28
	incq	%rax
	jmp	.L19
.L39:
	movq	%r12, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	addq	$88, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.LFE21:
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
