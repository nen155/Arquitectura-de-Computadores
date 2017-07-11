	.file	"pmm-secuencial-modificado.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta fila y columna\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
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
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	cmpl	$1, %edi
	jle	.L59
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %rbp
	movq	%rax, %rbx
	movl	%eax, 44(%rsp)
	salq	$3, %rbp
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r13
	call	malloc
	movq	%rax, %r14
	leal	63(%rbx), %eax
	testl	%ebx, %ebx
	cmovns	%ebx, %eax
	movl	%eax, 72(%rsp)
	andl	$-64, 72(%rsp)
	testl	%ebx, %ebx
	jle	.L3
	leal	-1(%rbx), %eax
	movl	%ebx, 48(%rsp)
	xorl	%r12d, %r12d
	movl	%eax, 76(%rsp)
	leaq	8(,%rax,8), %rax
	movq	%rax, 32(%rsp)
.L5:
	movq	%rbp, %rdi
	call	malloc
	movq	%rax, (%r15,%r12)
	addq	$8, %r12
	cmpq	32(%rsp), %r12
	jne	.L5
	xorl	%r12d, %r12d
.L7:
	movq	%rbp, %rdi
	call	malloc
	movq	%rax, 0(%r13,%r12)
	addq	$8, %r12
	cmpq	32(%rsp), %r12
	jne	.L7
	xorl	%r12d, %r12d
.L9:
	movq	%rbp, %rdi
	call	malloc
	movq	%rax, (%r14,%r12)
	addq	$8, %r12
	cmpq	%r12, 32(%rsp)
	jne	.L9
	leaq	112(%rsp), %rax
	xorl	%edi, %edi
	movq	%rax, %rsi
	movq	%rax, 64(%rsp)
	call	clock_gettime
	movl	%ebx, %eax
	movq	%rbx, 96(%rsp)
	movl	48(%rsp), %ebx
	salq	$3, %rax
	movapd	.LC3(%rip), %xmm0
	movq	%rax, 80(%rsp)
	xorl	%eax, %eax
	movq	%rbp, 88(%rsp)
	movq	%rax, %rbp
.L39:
	movq	(%r15,%rbp), %rax
	movq	0(%r13,%rbp), %rcx
	movq	(%r14,%rbp), %rdi
	movq	%rax, %rdx
	salq	$60, %rdx
	shrq	$63, %rdx
	cmpl	%edx, %ebx
	cmovbe	%ebx, %edx
	cmpl	$8, %ebx
	movl	%edx, %esi
	cmovbe	%ebx, %esi
	testl	%esi, %esi
	je	.L41
	movsd	.LC1(%rip), %xmm7
	cmpl	$1, %esi
	movsd	.LC2(%rip), %xmm3
	movsd	%xmm7, (%rax)
	movsd	%xmm3, (%rcx)
	je	.L42
	cmpl	$2, %esi
	movsd	%xmm7, 8(%rax)
	movsd	%xmm3, 8(%rcx)
	je	.L43
	cmpl	$3, %esi
	movapd	%xmm7, %xmm4
	movsd	%xmm7, 16(%rax)
	movapd	%xmm3, %xmm5
	movsd	%xmm3, 16(%rcx)
	je	.L44
	cmpl	$4, %esi
	movapd	%xmm7, %xmm6
	movsd	%xmm7, 24(%rax)
	movapd	%xmm3, %xmm7
	movsd	%xmm3, 24(%rcx)
	je	.L45
	cmpl	$5, %esi
	movapd	%xmm4, %xmm3
	movsd	%xmm4, 32(%rax)
	movapd	%xmm5, %xmm4
	movsd	%xmm5, 32(%rcx)
	je	.L46
	cmpl	$6, %esi
	movapd	%xmm6, %xmm5
	movsd	%xmm6, 40(%rax)
	movapd	%xmm7, %xmm6
	movsd	%xmm7, 40(%rcx)
	je	.L47
	cmpl	$7, %esi
	movsd	%xmm3, 48(%rax)
	movsd	%xmm4, 48(%rcx)
	je	.L48
	movsd	%xmm5, 56(%rax)
	movl	$8, %edx
	movsd	%xmm6, 56(%rcx)
.L12:
	cmpl	%esi, %ebx
	je	.L13
.L11:
	movl	%ebx, %r10d
	movl	%esi, %r12d
	subl	%esi, %r10d
	movl	%r10d, %r9d
	shrl	%r9d
	movl	%r9d, %r11d
	addl	%r11d, %r11d
	je	.L14
	salq	$3, %r12
	movq	%rax, 104(%rsp)
	xorl	%r8d, %r8d
	leaq	(%rax,%r12), %rsi
	movsd	.LC2(%rip), %xmm6
	addq	%rcx, %r12
	movq	%rsi, 48(%rsp)
	movq	48(%rsp), %rax
	xorl	%esi, %esi
.L17:
	addl	$1, %r8d
	movsd	%xmm6, (%r12,%rsi)
	movapd	%xmm0, (%rax,%rsi)
	movsd	%xmm6, 8(%r12,%rsi)
	addq	$16, %rsi
	cmpl	%r8d, %r9d
	ja	.L17
	addl	%r11d, %edx
	cmpl	%r10d, %r11d
	movq	104(%rsp), %rax
	je	.L13
.L14:
	movsd	.LC1(%rip), %xmm2
	movslq	%edx, %rdx
	movsd	.LC2(%rip), %xmm3
	movsd	%xmm2, (%rax,%rdx,8)
	movsd	%xmm3, (%rcx,%rdx,8)
.L13:
	movq	80(%rsp), %rdx
	xorl	%esi, %esi
	addq	$8, %rbp
	movapd	%xmm0, 48(%rsp)
	call	memset
	cmpq	%rbp, 32(%rsp)
	movapd	48(%rsp), %xmm0
	jne	.L39
	movq	88(%rsp), %rbp
	movq	96(%rsp), %rbx
	jmp	.L38
.L59:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$21, %edx
	movl	$1, %esi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L3:
	leaq	112(%rsp), %rax
	xorl	%edi, %edi
	movq	%rax, %rsi
	movq	%rax, 64(%rsp)
	call	clock_gettime
	leal	-1(%rbx), %eax
	movl	%eax, 76(%rsp)
.L38:
	leaq	128(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	128(%rsp), %rax
	subq	112(%rsp), %rax
	xorl	%edi, %edi
	movq	64(%rsp), %rsi
	cvtsi2sdq	%rax, %xmm2
	movq	136(%rsp), %rax
	subq	120(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm0, %xmm2
	addsd	.LC7(%rip), %xmm2
	movsd	%xmm2, 32(%rsp)
	call	clock_gettime
	movl	72(%rsp), %edx
	movsd	32(%rsp), %xmm2
	testl	%edx, %edx
	jle	.L30
	movl	72(%rsp), %eax
	xorl	%ecx, %ecx
	movq	%rbp, 80(%rsp)
	movq	%rbx, 88(%rsp)
	subl	$1, %eax
	shrl	$6, %eax
	addq	$1, %rax
	movq	%rax, 64(%rsp)
	salq	$9, 64(%rsp)
.L31:
	leaq	0(%r13,%rcx), %rdi
	xorl	%ebp, %ebp
	movl	$64, %edx
.L37:
	movl	44(%rsp), %eax
	xorl	%r12d, %r12d
	leaq	512(%rbp), %rsi
	movl	%edx, 48(%rsp)
	movq	%r13, %r8
	testl	%eax, %eax
	jle	.L25
.L29:
	movq	(%r14,%r12,8), %rbx
	movq	%rcx, %r10
	addq	(%r15,%r12,8), %r10
	movq	%r15, %r9
	leaq	(%rbx,%rbp), %r11
	leaq	(%rbx,%rsi), %r13
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%r11, %r15
	movsd	(%r11), %xmm1
	subq	%rbx, %r15
	xorl	%eax, %eax
	movl	%edx, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L23:
	movq	(%rdi,%rax), %rdx
	movsd	(%r10,%rax), %xmm0
	addq	$8, %rax
	cmpq	$512, %rax
	mulsd	(%rdx,%r15), %xmm0
	addsd	%xmm0, %xmm1
	jne	.L23
	movsd	%xmm1, (%r11)
	addq	$8, %r11
	movl	32(%rsp), %edx
	cmpq	%r13, %r11
	jne	.L26
	addq	$1, %r12
	cmpl	%r12d, 44(%rsp)
	movq	%r9, %r15
	jg	.L29
	movq	%r8, %r13
.L25:
	addl	$64, %edx
	movl	48(%rsp), %eax
	cmpl	%eax, 72(%rsp)
	movq	%rsi, %rbp
	jg	.L37
	addq	$512, %rcx
	cmpq	64(%rsp), %rcx
	jne	.L31
	movq	80(%rsp), %rbp
	movq	88(%rsp), %rbx
.L30:
	leaq	128(%rsp), %rsi
	xorl	%edi, %edi
	movsd	%xmm2, 32(%rsp)
	call	clock_gettime
	movq	-8(%r14,%rbp), %rax
	movsd	32(%rsp), %xmm2
	movq	0(%r13), %rsi
	movq	(%r15), %rdx
	movq	(%r14), %rdi
	movsd	-8(%rax,%rbp), %xmm6
	movq	-8(%r13,%rbp), %rax
	movsd	-8(%rax,%rbp), %xmm5
	movq	-8(%r15,%rbp), %rax
	movsd	-8(%rax,%rbp), %xmm4
	movq	128(%rsp), %rax
	subq	112(%rsp), %rax
	xorl	%ebp, %ebp
	cvtsi2sdq	%rax, %xmm0
	movq	136(%rsp), %rax
	subq	120(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	76(%rsp), %eax
	movl	%eax, 16(%rsp)
	movl	%eax, 8(%rsp)
	movl	%eax, %r9d
	movl	%eax, (%rsp)
	movl	%eax, %r8d
	movl	%eax, %ecx
	movsd	(%rdi), %xmm3
	movl	$7, %eax
	movl	$1, %edi
	divsd	.LC5(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rdx), %xmm1
	movl	%ebx, %edx
	addsd	%xmm2, %xmm0
	movsd	(%rsi), %xmm2
	movl	$.LC6, %esi
	call	__printf_chk
	testl	%ebx, %ebx
	jle	.L21
.L51:
	movq	(%r15,%rbp,8), %rdi
	addq	$1, %rbp
	call	free
	cmpl	%ebp, 44(%rsp)
	jg	.L51
	xorl	%ebx, %ebx
.L35:
	movq	0(%r13,%rbx,8), %rdi
	addq	$1, %rbx
	call	free
	cmpl	%ebx, 44(%rsp)
	jg	.L35
	xorl	%ebx, %ebx
.L36:
	movq	(%r14,%rbx,8), %rdi
	addq	$1, %rbx
	call	free
	cmpl	%ebx, 44(%rsp)
	jg	.L36
.L21:
	movq	%r15, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	addq	$152, %rsp
	.cfi_remember_state
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
.L48:
	.cfi_restore_state
	movl	$7, %edx
	jmp	.L12
.L47:
	movl	$6, %edx
	jmp	.L12
.L46:
	movl	$5, %edx
	jmp	.L12
.L45:
	movl	$4, %edx
	jmp	.L12
.L44:
	movl	$3, %edx
	jmp	.L12
.L43:
	movl	$2, %edx
	jmp	.L12
.L42:
	movl	$1, %edx
	jmp	.L12
.L41:
	xorl	%edx, %edx
	jmp	.L11
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.align 8
.LC7:
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
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
