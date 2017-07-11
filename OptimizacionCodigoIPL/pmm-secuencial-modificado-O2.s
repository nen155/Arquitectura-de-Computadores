	.file	"pmm-secuencial-modificado.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta fila y columna\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Matrices:%u\t/ m[0][0]*m2[0][0]=res[0][0](%8.6f+%8.6f=%8.6f) // m[%d][%d]*m2[%d][%d]=res[%d][%d](%8.6f+%8.6f=%8.6f) /\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	cmpl	$1, %edi
	jle	.L41
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %rbx
	movq	%rax, %r13
	movq	%rax, 56(%rsp)
	salq	$3, %rbx
	movl	%eax, 40(%rsp)
	movq	%rbx, %rdi
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r15
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r14
	call	malloc
	movq	%rax, %rbp
	movl	%r13d, %eax
	addl	$63, %eax
	testl	%r13d, %r13d
	movl	%eax, %esi
	movq	%r13, %rax
	cmovns	%r13d, %esi
	movl	%esi, 44(%rsp)
	andl	$-64, 44(%rsp)
	testl	%r13d, %r13d
	jle	.L3
	subl	$1, %eax
	xorl	%r13d, %r13d
	leaq	8(,%rax,8), %r12
	movl	%eax, 68(%rsp)
.L5:
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, (%r15,%r13)
	addq	$8, %r13
	cmpq	%r12, %r13
	jne	.L5
	xorl	%r13d, %r13d
.L7:
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, (%r14,%r13)
	addq	$8, %r13
	cmpq	%r12, %r13
	jne	.L7
	xorl	%r13d, %r13d
.L9:
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, 0(%rbp,%r13)
	addq	$8, %r13
	cmpq	%r13, %r12
	jne	.L9
	leaq	80(%rsp), %r12
	xorl	%edi, %edi
	movq	%r12, %rsi
	call	clock_gettime
	xorl	%eax, %eax
.L32:
	movq	(%r15,%rax,8), %rdi
	movq	(%r14,%rax,8), %rsi
	xorl	%edx, %edx
	movq	0(%rbp,%rax,8), %rcx
.L12:
	movsd	.LC1(%rip), %xmm7
	movq	$0, (%rcx,%rdx,8)
	movsd	.LC2(%rip), %xmm3
	movsd	%xmm7, (%rdi,%rdx,8)
	movsd	%xmm3, (%rsi,%rdx,8)
	addq	$1, %rdx
	cmpl	%edx, 40(%rsp)
	jg	.L12
	addq	$1, %rax
	cmpl	%eax, 40(%rsp)
	jg	.L32
	jmp	.L11
.L41:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$21, %edx
	movl	$1, %esi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L3:
	leaq	80(%rsp), %r12
	xorl	%edi, %edi
	movq	%r12, %rsi
	call	clock_gettime
	movq	56(%rsp), %rax
	subl	$1, %eax
	movl	%eax, 68(%rsp)
.L11:
	leaq	96(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	96(%rsp), %rax
	subq	80(%rsp), %rax
	xorl	%edi, %edi
	movq	%r12, %rsi
	cvtsi2sdq	%rax, %xmm2
	movq	104(%rsp), %rax
	subq	88(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm0, %xmm2
	addsd	.LC3(%rip), %xmm2
	movsd	%xmm2, 32(%rsp)
	call	clock_gettime
	movl	44(%rsp), %edx
	movsd	32(%rsp), %xmm2
	testl	%edx, %edx
	jle	.L24
	movl	44(%rsp), %eax
	xorl	%ecx, %ecx
	movq	%rbx, 72(%rsp)
	subl	$1, %eax
	shrl	$6, %eax
	addq	$1, %rax
	movq	%rax, 48(%rsp)
	salq	$9, 48(%rsp)
.L25:
	leaq	(%r14,%rcx), %rdi
	xorl	%r12d, %r12d
	movl	$64, %edx
.L31:
	movl	40(%rsp), %eax
	xorl	%r13d, %r13d
	leaq	512(%r12), %rsi
	movl	%edx, 64(%rsp)
	movq	%r14, %r8
	testl	%eax, %eax
	jle	.L19
.L23:
	movq	0(%rbp,%r13,8), %rbx
	movq	%rcx, %r10
	addq	(%r15,%r13,8), %r10
	movq	%r15, %r9
	leaq	(%rbx,%r12), %r11
	leaq	(%rbx,%rsi), %r14
	.p2align 4,,10
	.p2align 3
.L20:
	movq	%r11, %r15
	movsd	(%r11), %xmm1
	subq	%rbx, %r15
	xorl	%eax, %eax
	movl	%edx, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L17:
	movq	(%rdi,%rax), %rdx
	movsd	(%r10,%rax), %xmm0
	addq	$8, %rax
	cmpq	$512, %rax
	mulsd	(%rdx,%r15), %xmm0
	addsd	%xmm0, %xmm1
	jne	.L17
	movsd	%xmm1, (%r11)
	addq	$8, %r11
	movl	32(%rsp), %edx
	cmpq	%r14, %r11
	jne	.L20
	addq	$1, %r13
	cmpl	%r13d, 40(%rsp)
	movq	%r9, %r15
	jg	.L23
	movq	%r8, %r14
.L19:
	addl	$64, %edx
	movl	64(%rsp), %eax
	cmpl	%eax, 44(%rsp)
	movq	%rsi, %r12
	jg	.L31
	addq	$512, %rcx
	cmpq	48(%rsp), %rcx
	jne	.L25
	movq	72(%rsp), %rbx
.L24:
	leaq	96(%rsp), %rsi
	xorl	%edi, %edi
	movsd	%xmm2, 32(%rsp)
	call	clock_gettime
	movq	-8(%rbp,%rbx), %rax
	movsd	32(%rsp), %xmm2
	movq	0(%rbp), %rdi
	movq	(%r14), %rsi
	movq	(%r15), %rdx
	movq	56(%rsp), %r13
	movsd	-8(%rax,%rbx), %xmm6
	movq	-8(%r14,%rbx), %rax
	movsd	-8(%rax,%rbx), %xmm5
	movq	-8(%r15,%rbx), %rax
	movsd	-8(%rax,%rbx), %xmm4
	movq	96(%rsp), %rax
	subq	80(%rsp), %rax
	xorl	%ebx, %ebx
	cvtsi2sdq	%rax, %xmm0
	movq	104(%rsp), %rax
	subq	88(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	68(%rsp), %eax
	movl	%eax, 16(%rsp)
	movl	%eax, 8(%rsp)
	movl	%eax, %r9d
	movl	%eax, (%rsp)
	movl	%eax, %r8d
	movl	%eax, %ecx
	movsd	(%rdi), %xmm3
	movl	$7, %eax
	movl	$1, %edi
	divsd	.LC4(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rdx), %xmm1
	movl	%r13d, %edx
	addsd	%xmm2, %xmm0
	movsd	(%rsi), %xmm2
	movl	$.LC5, %esi
	call	__printf_chk
	testl	%r13d, %r13d
	jle	.L15
.L33:
	movq	(%r15,%rbx,8), %rdi
	addq	$1, %rbx
	call	free
	cmpl	%ebx, 40(%rsp)
	jg	.L33
	xorl	%ebx, %ebx
.L29:
	movq	(%r14,%rbx,8), %rdi
	addq	$1, %rbx
	call	free
	cmpl	%ebx, 40(%rsp)
	jg	.L29
	xorl	%ebx, %ebx
.L30:
	movq	0(%rbp,%rbx,8), %rdi
	addq	$1, %rbx
	call	free
	cmpl	%ebx, 40(%rsp)
	jg	.L30
.L15:
	movq	%r15, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	addq	$120, %rsp
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
