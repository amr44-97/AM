	.file	"Test.cpp"
# GNU C++20 (Debian 12.2.0-2) version 12.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O2 -std=gnu++20 -fasynchronous-unwind-tables
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"./LibStr.cpp"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"=============================================================="
	.section	.rodata.str1.1
.LC3:
	.string	"Total time Taken is %0.12f\n"
.LC4:
	.string	"Hello World Iam amr "
.LC5:
	.string	"Abdellah Mohammed Maharek!!"
.LC6:
	.string	":14sw2"
.LC7:
	.string	":1213"
.LC8:
	.string	":9000"
.LC9:
	.string	" 555"
.LC10:
	.string	"\033[35mHello Iam kat"
.LC11:
	.string	" Assembly"
.LC12:
	.string	" Hello ALL Of you"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$280, %rsp	#,
	.cfi_def_cfa_offset 320
# Test.cpp:15:     long t1 = clock();
	call	clock@PLT	#
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	leaq	208(%rsp), %rbp	#, tmp92
	leaq	144(%rsp), %rdi	#, tmp91
# file_handle.hpp:7: struct File{
	movq	$0, 216(%rsp)	#, a.size
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	movq	%rbp, %rsi	# tmp92,
# Test.cpp:15:     long t1 = clock();
	movq	%rax, %rbx	# tmp172, t1
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	leaq	.LC0(%rip), %rdx	#, tmp93
# file_handle.hpp:7: struct File{
	movq	$0, 224(%rsp)	#, a.ptr
	movl	$0, 256(%rsp)	#, a.opened
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	call	_ZN4File14read_to_stringEPKc@PLT	#
	subq	$32, %rsp	#,
	.cfi_def_cfa_offset 352
	movdqa	176(%rsp), %xmm1	# D.4700, tmp178
	movq	192(%rsp), %rax	# D.4700, D.4700
	movups	%xmm1, (%rsp)	# tmp178,
	movq	%rax, 16(%rsp)	# D.4700,
	call	_Z9Str_split6String@PLT	#
# Test.cpp:23:     Println(alis);
	addq	$32, %rsp	#,
	.cfi_def_cfa_offset 320
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	movq	%rdx, %rsi	#, alis
	movq	%rax, %rdi	# tmp173, alis
# Test.cpp:23:     Println(alis);
	call	_Z7Println4list@PLT	#
# Test.cpp:26:     Str_free_all();
	call	_Z12Str_free_allv@PLT	#
# Test.cpp:28:     a.close();
	movq	%rbp, %rdi	# tmp92,
# LibTypes.hpp:71:            return cat_to_new(s);
	leaq	.LC12(%rip), %rbp	#, tmp138
# Test.cpp:28:     a.close();
	call	_ZN4File5closeEv@PLT	#
# Test.cpp:29:     long t2 = clock();
	call	clock@PLT	#
# Test.cpp:31:     double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
	pxor	%xmm0, %xmm0	# tmp103
# Test.cpp:31:     double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
	subq	%rbx, %rax	# t1, tmp102
# Test.cpp:32:     Println("==============================================================");
	leaq	.LC2(%rip), %rbx	#, tmp105
	movq	%rbx, %rdi	# tmp105,
# Test.cpp:31:     double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
	cvtsi2sdq	%rax, %xmm0	# tmp102, tmp103
# Test.cpp:31:     double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
	divsd	.LC1(%rip), %xmm0	#, tot
	movsd	%xmm0, 8(%rsp)	# tot, %sfp
# Test.cpp:32:     Println("==============================================================");
	call	_Z7PrintlnPKc@PLT	#
# Test.cpp:33:     Println("==============================================================");
	movq	%rbx, %rdi	# tmp105,
	call	_Z7PrintlnPKc@PLT	#
# Test.cpp:34:     Println("==============================================================");
	movq	%rbx, %rdi	# tmp105,
# Test.cpp:39:     String news = StringBuild("Hello World Iam amr ");
	leaq	16(%rsp), %rbx	#, tmp109
# Test.cpp:34:     Println("==============================================================");
	call	_Z7PrintlnPKc@PLT	#
# Test.cpp:35:     printf("Total time Taken is %0.12f\n",(double) tot);
	movsd	8(%rsp), %xmm0	# %sfp, tot
	movl	$1, %eax	#,
	leaq	.LC3(%rip), %rdi	#, tmp108
	call	printf@PLT	#
# Test.cpp:39:     String news = StringBuild("Hello World Iam amr ");
	movq	%rbx, %rdi	# tmp109,
	leaq	.LC4(%rip), %rsi	#, tmp110
	call	_Z11StringBuildPKc@PLT	#
# Test.cpp:40:     Println(news);
	subq	$32, %rsp	#,
	.cfi_def_cfa_offset 352
	movdqa	48(%rsp), %xmm2	# news, tmp179
	movq	64(%rsp), %rax	# news, news
	movups	%xmm2, (%rsp)	# tmp179,
	movq	%rax, 16(%rsp)	# news,
	call	_Z7Println6String@PLT	#
# Test.cpp:42:     Str_cat(&news,"Abdellah Mohammed Maharek!!");
	movq	%rbx, %rdi	# tmp109,
	addq	$32, %rsp	#,
	.cfi_def_cfa_offset 320
	leaq	.LC5(%rip), %rsi	#, tmp115
	call	_Z7Str_catP6StringPKc@PLT	#
# Test.cpp:43:     Println(news);
	subq	$32, %rsp	#,
	.cfi_def_cfa_offset 352
	movdqa	48(%rsp), %xmm3	# news, tmp180
	movq	64(%rsp), %rax	# news, news
	movups	%xmm3, (%rsp)	# tmp180,
	movq	%rax, 16(%rsp)	# news,
	call	_Z7Println6String@PLT	#
# Test.cpp:46:     Str_cat_list(&news, " 555", ":9000", ":1213",":14sw2");
	xorl	%r9d, %r9d	#
	movq	%rbx, %rdi	# tmp109,
	addq	$32, %rsp	#,
	.cfi_def_cfa_offset 320
	leaq	.LC6(%rip), %r8	#,
	leaq	.LC7(%rip), %rcx	#, tmp120
	xorl	%eax, %eax	#
	leaq	.LC8(%rip), %rdx	#, tmp121
	leaq	.LC9(%rip), %rsi	#, tmp122
	call	_Z15Str_cat_list_fnP6Stringz@PLT	#
# Test.cpp:48:     Println(news);
	subq	$32, %rsp	#,
	.cfi_def_cfa_offset 352
	movdqa	48(%rsp), %xmm4	# news, tmp181
	movq	64(%rsp), %rax	# news, news
# Test.cpp:51:     String kat = StringBuild(ANSI_COLOR_MAGENTA "Hello Iam kat");
	leaq	80(%rsp), %rbx	#, tmp126
# Test.cpp:48:     Println(news);
	movups	%xmm4, (%rsp)	# tmp181,
	movq	%rax, 16(%rsp)	# news,
	call	_Z7Println6String@PLT	#
# Test.cpp:51:     String kat = StringBuild(ANSI_COLOR_MAGENTA "Hello Iam kat");
	movq	%rbx, %rdi	# tmp126,
	addq	$32, %rsp	#,
	.cfi_def_cfa_offset 320
	leaq	.LC10(%rip), %rsi	#, tmp127
	call	_Z11StringBuildPKc@PLT	#
# Test.cpp:52:     Println(kat);
	subq	$32, %rsp	#,
	.cfi_def_cfa_offset 352
	movdqa	80(%rsp), %xmm5	# kat, tmp182
	movq	96(%rsp), %rax	# kat, kat
	movups	%xmm5, (%rsp)	# tmp182,
	movq	%rax, 16(%rsp)	# kat,
	call	_Z7Println6String@PLT	#
# LibTypes.hpp:63:                 this->cat(s);
	addq	$32, %rsp	#,
	.cfi_def_cfa_offset 320
	movq	%rbx, %rdi	# tmp126,
	leaq	.LC11(%rip), %rsi	#, tmp132
	call	_ZN6String3catEPKc@PLT	#
# Test.cpp:56:     Println(kat);
	subq	$32, %rsp	#,
	.cfi_def_cfa_offset 352
	movdqa	80(%rsp), %xmm6	# kat, tmp183
	movq	96(%rsp), %rax	# kat, kat
# LibTypes.hpp:71:            return cat_to_new(s);
	leaq	112(%rsp), %r12	#, tmp136
# Test.cpp:56:     Println(kat);
	movups	%xmm6, (%rsp)	# tmp183,
	movq	%rax, 16(%rsp)	# kat,
	call	_Z7Println6String@PLT	#
# LibTypes.hpp:71:            return cat_to_new(s);
	movq	%rbp, %rdx	# tmp138,
	movq	%rbx, %rsi	# tmp126,
	movq	%r12, %rdi	# tmp136,
	addq	$32, %rsp	#,
	.cfi_def_cfa_offset 320
	call	_ZN6String10cat_to_newEPKc@PLT	#
# Test.cpp:59:     Println(s);
	subq	$32, %rsp	#,
	.cfi_def_cfa_offset 352
	movdqa	112(%rsp), %xmm7	# s, tmp184
	movq	128(%rsp), %rax	# s, s
# LibTypes.hpp:75:            return cat_to_new(s.str);
	leaq	144(%rsp), %rbx	#, tmp142
# Test.cpp:59:     Println(s);
	movups	%xmm7, (%rsp)	# tmp184,
	movq	%rax, 16(%rsp)	# s,
	call	_Z7Println6String@PLT	#
# LibTypes.hpp:75:            return cat_to_new(s.str);
	addq	$32, %rsp	#,
	.cfi_def_cfa_offset 320
	movq	%r12, %rsi	# tmp136,
	movq	%rbx, %rdi	# tmp142,
	movq	64(%rsp), %rdx	# kat.str,
# LibTypes.hpp:71:            return cat_to_new(s);
	leaq	176(%rsp), %r13	#, tmp145
# LibTypes.hpp:75:            return cat_to_new(s.str);
	call	_ZN6String10cat_to_newEPKc@PLT	#
# LibTypes.hpp:71:            return cat_to_new(s);
	movq	%rbp, %rdx	# tmp138,
	movq	%rbx, %rsi	# tmp142,
	movq	%r13, %rdi	# tmp145,
	call	_ZN6String10cat_to_newEPKc@PLT	#
# Test.cpp:61:     s = s + kat + " Hello ALL Of you";
	movq	192(%rsp), %rax	# MEM[(struct String *)_57], MEM[(struct String *)_57]
	movdqa	176(%rsp), %xmm0	# MEM[(struct String *)_57], MEM[(struct String *)_57]
	movq	%rax, 96(%rsp)	# MEM[(struct String *)_57], s
	movaps	%xmm0, 80(%rsp)	# MEM[(struct String *)_57], s
# Test.cpp:62:     Println(s);
	subq	$32, %rsp	#,
	.cfi_def_cfa_offset 352
	movq	%rax, 16(%rsp)	# MEM[(struct String *)_57],
	movups	%xmm0, (%rsp)	# MEM[(struct String *)_57],
	call	_Z7Println6String@PLT	#
# LibTypes.hpp:75:            return cat_to_new(s.str);
	movq	96(%rsp), %rdx	# kat.str,
	movq	%r12, %rsi	# tmp136,
	movq	%rbx, %rdi	# tmp142,
	addq	$32, %rsp	#,
	.cfi_def_cfa_offset 320
	call	_ZN6String10cat_to_newEPKc@PLT	#
# LibTypes.hpp:71:            return cat_to_new(s);
	movq	%rbp, %rdx	# tmp138,
	movq	%rbx, %rsi	# tmp142,
	movq	%r13, %rdi	# tmp145,
	call	_ZN6String10cat_to_newEPKc@PLT	#
# Test.cpp:63:     s = s + kat + " Hello ALL Of you";
	movq	192(%rsp), %rax	# MEM[(struct String *)_57], MEM[(struct String *)_57]
	movdqa	176(%rsp), %xmm0	# MEM[(struct String *)_57], MEM[(struct String *)_57]
	movq	%rax, 96(%rsp)	# MEM[(struct String *)_57], s
	movaps	%xmm0, 80(%rsp)	# MEM[(struct String *)_57], s
# Test.cpp:64:     Println(s);
	subq	$32, %rsp	#,
	.cfi_def_cfa_offset 352
	movups	%xmm0, (%rsp)	# MEM[(struct String *)_57],
	movq	%rax, 16(%rsp)	# MEM[(struct String *)_57],
	call	_Z7Println6String@PLT	#
# Test.cpp:66:     Println(kat);
	movq	96(%rsp), %rax	# kat, kat
	movdqa	80(%rsp), %xmm1	# kat, tmp185
	movq	%rax, 16(%rsp)	# kat,
	movups	%xmm1, (%rsp)	# tmp185,
	call	_Z7Println6String@PLT	#
# Test.cpp:73:   Str_free_all();
	addq	$32, %rsp	#,
	.cfi_def_cfa_offset 320
	call	_Z12Str_free_allv@PLT	#
# Test.cpp:75: }
	addq	$280, %rsp	#,
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE52:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1093567616
	.ident	"GCC: (Debian 12.2.0-2) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
