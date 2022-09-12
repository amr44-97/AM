	.file	"Test.cpp"
	.intel_syntax noprefix
# GNU C++20 (Debian 12.2.0-2) version 12.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.25-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -O2 -std=gnu++20 -fasynchronous-unwind-tables
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
	push	r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 280	#,
	.cfi_def_cfa_offset 320
# Test.cpp:15:     long t1 = clock();
	call	clock@PLT	#
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	lea	rbp, 208[rsp]	# tmp92,
	lea	rdi, 144[rsp]	# tmp91,
# file_handle.hpp:7: struct File{
	mov	QWORD PTR 216[rsp], 0	# a.size,
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	mov	rsi, rbp	#, tmp92
# Test.cpp:15:     long t1 = clock();
	mov	rbx, rax	# t1, tmp172
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	lea	rdx, .LC0[rip]	# tmp93,
# file_handle.hpp:7: struct File{
	mov	QWORD PTR 224[rsp], 0	# a.ptr,
	mov	DWORD PTR 256[rsp], 0	# a.opened,
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	call	_ZN4File14read_to_stringEPKc@PLT	#
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 352
	movdqa	xmm1, XMMWORD PTR 176[rsp]	# tmp178, D.4700
	mov	rax, QWORD PTR 192[rsp]	# D.4700, D.4700
	movups	XMMWORD PTR [rsp], xmm1	#, tmp178
	mov	QWORD PTR 16[rsp], rax	#, D.4700
	call	_Z9Str_split6String@PLT	#
# Test.cpp:23:     Println(alis);
	add	rsp, 32	#,
	.cfi_def_cfa_offset 320
# Test.cpp:21:     list alis = Str_split(a.read_to_string("./LibStr.cpp")); //Str_split(a.buf);
	mov	rsi, rdx	# alis,
	mov	rdi, rax	# alis, tmp173
# Test.cpp:23:     Println(alis);
	call	_Z7Println4list@PLT	#
# Test.cpp:26:     Str_free_all();
	call	_Z12Str_free_allv@PLT	#
# Test.cpp:28:     a.close();
	mov	rdi, rbp	#, tmp92
# LibTypes.hpp:71:            return cat_to_new(s);
	lea	rbp, .LC12[rip]	# tmp138,
# Test.cpp:28:     a.close();
	call	_ZN4File5closeEv@PLT	#
# Test.cpp:29:     long t2 = clock();
	call	clock@PLT	#
# Test.cpp:31:     double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
	pxor	xmm0, xmm0	# tmp103
# Test.cpp:31:     double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
	sub	rax, rbx	# tmp102, t1
# Test.cpp:32:     Println("==============================================================");
	lea	rbx, .LC2[rip]	# tmp105,
	mov	rdi, rbx	#, tmp105
# Test.cpp:31:     double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
	cvtsi2sd	xmm0, rax	# tmp103, tmp102
# Test.cpp:31:     double tot  = (double) (t2 - t1)/CLOCKS_PER_SEC; 
	divsd	xmm0, QWORD PTR .LC1[rip]	# tot,
	movsd	QWORD PTR 8[rsp], xmm0	# %sfp, tot
# Test.cpp:32:     Println("==============================================================");
	call	_Z7PrintlnPKc@PLT	#
# Test.cpp:33:     Println("==============================================================");
	mov	rdi, rbx	#, tmp105
	call	_Z7PrintlnPKc@PLT	#
# Test.cpp:34:     Println("==============================================================");
	mov	rdi, rbx	#, tmp105
# Test.cpp:39:     String news = StringBuild("Hello World Iam amr ");
	lea	rbx, 16[rsp]	# tmp109,
# Test.cpp:34:     Println("==============================================================");
	call	_Z7PrintlnPKc@PLT	#
# Test.cpp:35:     printf("Total time Taken is %0.12f\n",(double) tot);
	movsd	xmm0, QWORD PTR 8[rsp]	# tot, %sfp
	mov	eax, 1	#,
	lea	rdi, .LC3[rip]	# tmp108,
	call	printf@PLT	#
# Test.cpp:39:     String news = StringBuild("Hello World Iam amr ");
	mov	rdi, rbx	#, tmp109
	lea	rsi, .LC4[rip]	# tmp110,
	call	_Z11StringBuildPKc@PLT	#
# Test.cpp:40:     Println(news);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 352
	movdqa	xmm2, XMMWORD PTR 48[rsp]	# tmp179, news
	mov	rax, QWORD PTR 64[rsp]	# news, news
	movups	XMMWORD PTR [rsp], xmm2	#, tmp179
	mov	QWORD PTR 16[rsp], rax	#, news
	call	_Z7Println6String@PLT	#
# Test.cpp:42:     Str_cat(&news,"Abdellah Mohammed Maharek!!");
	mov	rdi, rbx	#, tmp109
	add	rsp, 32	#,
	.cfi_def_cfa_offset 320
	lea	rsi, .LC5[rip]	# tmp115,
	call	_Z7Str_catP6StringPKc@PLT	#
# Test.cpp:43:     Println(news);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 352
	movdqa	xmm3, XMMWORD PTR 48[rsp]	# tmp180, news
	mov	rax, QWORD PTR 64[rsp]	# news, news
	movups	XMMWORD PTR [rsp], xmm3	#, tmp180
	mov	QWORD PTR 16[rsp], rax	#, news
	call	_Z7Println6String@PLT	#
# Test.cpp:46:     Str_cat_list(&news, " 555", ":9000", ":1213",":14sw2");
	xor	r9d, r9d	#
	mov	rdi, rbx	#, tmp109
	add	rsp, 32	#,
	.cfi_def_cfa_offset 320
	lea	r8, .LC6[rip]	#,
	lea	rcx, .LC7[rip]	# tmp120,
	xor	eax, eax	#
	lea	rdx, .LC8[rip]	# tmp121,
	lea	rsi, .LC9[rip]	# tmp122,
	call	_Z15Str_cat_list_fnP6Stringz@PLT	#
# Test.cpp:48:     Println(news);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 352
	movdqa	xmm4, XMMWORD PTR 48[rsp]	# tmp181, news
	mov	rax, QWORD PTR 64[rsp]	# news, news
# Test.cpp:51:     String kat = StringBuild(ANSI_COLOR_MAGENTA "Hello Iam kat");
	lea	rbx, 80[rsp]	# tmp126,
# Test.cpp:48:     Println(news);
	movups	XMMWORD PTR [rsp], xmm4	#, tmp181
	mov	QWORD PTR 16[rsp], rax	#, news
	call	_Z7Println6String@PLT	#
# Test.cpp:51:     String kat = StringBuild(ANSI_COLOR_MAGENTA "Hello Iam kat");
	mov	rdi, rbx	#, tmp126
	add	rsp, 32	#,
	.cfi_def_cfa_offset 320
	lea	rsi, .LC10[rip]	# tmp127,
	call	_Z11StringBuildPKc@PLT	#
# Test.cpp:52:     Println(kat);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 352
	movdqa	xmm5, XMMWORD PTR 80[rsp]	# tmp182, kat
	mov	rax, QWORD PTR 96[rsp]	# kat, kat
	movups	XMMWORD PTR [rsp], xmm5	#, tmp182
	mov	QWORD PTR 16[rsp], rax	#, kat
	call	_Z7Println6String@PLT	#
# LibTypes.hpp:63:                 this->cat(s);
	add	rsp, 32	#,
	.cfi_def_cfa_offset 320
	mov	rdi, rbx	#, tmp126
	lea	rsi, .LC11[rip]	# tmp132,
	call	_ZN6String3catEPKc@PLT	#
# Test.cpp:56:     Println(kat);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 352
	movdqa	xmm6, XMMWORD PTR 80[rsp]	# tmp183, kat
	mov	rax, QWORD PTR 96[rsp]	# kat, kat
# LibTypes.hpp:71:            return cat_to_new(s);
	lea	r12, 112[rsp]	# tmp136,
# Test.cpp:56:     Println(kat);
	movups	XMMWORD PTR [rsp], xmm6	#, tmp183
	mov	QWORD PTR 16[rsp], rax	#, kat
	call	_Z7Println6String@PLT	#
# LibTypes.hpp:71:            return cat_to_new(s);
	mov	rdx, rbp	#, tmp138
	mov	rsi, rbx	#, tmp126
	mov	rdi, r12	#, tmp136
	add	rsp, 32	#,
	.cfi_def_cfa_offset 320
	call	_ZN6String10cat_to_newEPKc@PLT	#
# Test.cpp:59:     Println(s);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 352
	movdqa	xmm7, XMMWORD PTR 112[rsp]	# tmp184, s
	mov	rax, QWORD PTR 128[rsp]	# s, s
# LibTypes.hpp:75:            return cat_to_new(s.str);
	lea	rbx, 144[rsp]	# tmp142,
# Test.cpp:59:     Println(s);
	movups	XMMWORD PTR [rsp], xmm7	#, tmp184
	mov	QWORD PTR 16[rsp], rax	#, s
	call	_Z7Println6String@PLT	#
# LibTypes.hpp:75:            return cat_to_new(s.str);
	add	rsp, 32	#,
	.cfi_def_cfa_offset 320
	mov	rsi, r12	#, tmp136
	mov	rdi, rbx	#, tmp142
	mov	rdx, QWORD PTR 64[rsp]	#, kat.str
# LibTypes.hpp:71:            return cat_to_new(s);
	lea	r13, 176[rsp]	# tmp145,
# LibTypes.hpp:75:            return cat_to_new(s.str);
	call	_ZN6String10cat_to_newEPKc@PLT	#
# LibTypes.hpp:71:            return cat_to_new(s);
	mov	rdx, rbp	#, tmp138
	mov	rsi, rbx	#, tmp142
	mov	rdi, r13	#, tmp145
	call	_ZN6String10cat_to_newEPKc@PLT	#
# Test.cpp:61:     s = s + kat + " Hello ALL Of you";
	mov	rax, QWORD PTR 192[rsp]	# MEM[(struct String *)_57], MEM[(struct String *)_57]
	movdqa	xmm0, XMMWORD PTR 176[rsp]	# MEM[(struct String *)_57], MEM[(struct String *)_57]
	mov	QWORD PTR 96[rsp], rax	# s, MEM[(struct String *)_57]
	movaps	XMMWORD PTR 80[rsp], xmm0	# s, MEM[(struct String *)_57]
# Test.cpp:62:     Println(s);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 352
	mov	QWORD PTR 16[rsp], rax	#, MEM[(struct String *)_57]
	movups	XMMWORD PTR [rsp], xmm0	#, MEM[(struct String *)_57]
	call	_Z7Println6String@PLT	#
# LibTypes.hpp:75:            return cat_to_new(s.str);
	mov	rdx, QWORD PTR 96[rsp]	#, kat.str
	mov	rsi, r12	#, tmp136
	mov	rdi, rbx	#, tmp142
	add	rsp, 32	#,
	.cfi_def_cfa_offset 320
	call	_ZN6String10cat_to_newEPKc@PLT	#
# LibTypes.hpp:71:            return cat_to_new(s);
	mov	rdx, rbp	#, tmp138
	mov	rsi, rbx	#, tmp142
	mov	rdi, r13	#, tmp145
	call	_ZN6String10cat_to_newEPKc@PLT	#
# Test.cpp:63:     s = s + kat + " Hello ALL Of you";
	mov	rax, QWORD PTR 192[rsp]	# MEM[(struct String *)_57], MEM[(struct String *)_57]
	movdqa	xmm0, XMMWORD PTR 176[rsp]	# MEM[(struct String *)_57], MEM[(struct String *)_57]
	mov	QWORD PTR 96[rsp], rax	# s, MEM[(struct String *)_57]
	movaps	XMMWORD PTR 80[rsp], xmm0	# s, MEM[(struct String *)_57]
# Test.cpp:64:     Println(s);
	sub	rsp, 32	#,
	.cfi_def_cfa_offset 352
	movups	XMMWORD PTR [rsp], xmm0	#, MEM[(struct String *)_57]
	mov	QWORD PTR 16[rsp], rax	#, MEM[(struct String *)_57]
	call	_Z7Println6String@PLT	#
# Test.cpp:66:     Println(kat);
	mov	rax, QWORD PTR 96[rsp]	# kat, kat
	movdqa	xmm1, XMMWORD PTR 80[rsp]	# tmp185, kat
	mov	QWORD PTR 16[rsp], rax	#, kat
	movups	XMMWORD PTR [rsp], xmm1	#, tmp185
	call	_Z7Println6String@PLT	#
# Test.cpp:73:   Str_free_all();
	add	rsp, 32	#,
	.cfi_def_cfa_offset 320
	call	_Z12Str_free_allv@PLT	#
# Test.cpp:75: }
	add	rsp, 280	#,
	.cfi_def_cfa_offset 40
	xor	eax, eax	#
	pop	rbx	#
	.cfi_def_cfa_offset 32
	pop	rbp	#
	.cfi_def_cfa_offset 24
	pop	r12	#
	.cfi_def_cfa_offset 16
	pop	r13	#
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
