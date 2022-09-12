	.text
	.file	"Test.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	1 "/home/amr/AM/ClangLib" "Test.c"
	.loc	1 11 0                          # Test.c:11:0
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$96, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -16
	.loc	1 13 15 prologue_end            # Test.c:13:15
	callq	clock@PLT
.Ltmp0:
	#DEBUG_VALUE: main:t1 <- $rax
	.loc	1 15 14                         # Test.c:15:14
	leaq	.L.str(%rip), %rsi
	leaq	48(%rsp), %rdi
	callq	read_file_to_string@PLT
.Ltmp1:
	.loc	1 17 29                         # Test.c:17:29
	leaq	72(%rsp), %rbx
	.loc	1 17 17 is_stmt 0               # Test.c:17:17
	movq	88(%rsp), %rax
	movq	%rax, 16(%rsp)
	vmovups	72(%rsp), %xmm0
	vmovups	%xmm0, (%rsp)
	callq	Str_split@PLT
.Ltmp2:
	#DEBUG_VALUE: main:alis <- [DW_OP_LLVM_fragment 0 64] $rax
	#DEBUG_VALUE: main:alis <- [DW_OP_LLVM_fragment 64 64] $rdx
	.loc	1 21 5 is_stmt 1                # Test.c:21:5
	movq	%rax, %rdi
	movq	%rdx, %rsi
	callq	printLIST@PLT
.Ltmp3:
	.loc	1 22 5                          # Test.c:22:5
	movq	88(%rsp), %rax
	movq	%rax, 16(%rsp)
	vmovups	72(%rsp), %xmm0
	vmovups	%xmm0, (%rsp)
	callq	printString@PLT
.Ltmp4:
	.loc	1 25 5                          # Test.c:25:5
	leaq	.L.str.1(%rip), %rsi
	movq	%rbx, %rdi
	callq	Str_cat@PLT
.Ltmp5:
	.loc	1 27 5                          # Test.c:27:5
	movq	88(%rsp), %rax
	movq	%rax, 16(%rsp)
	vmovups	72(%rsp), %xmm0
	vmovups	%xmm0, (%rsp)
	callq	printString@PLT
.Ltmp6:
	.loc	1 31 5                          # Test.c:31:5
	vmovups	48(%rsp), %ymm0
	vmovups	64(%rsp), %ymm1
	vmovups	%ymm1, 16(%rsp)
	vmovups	%ymm0, (%rsp)
	vzeroupper
	callq	close_file@PLT
.Ltmp7:
	.loc	1 50 5                          # Test.c:50:5
	xorl	%eax, %eax
	callq	Str_free_all@PLT
.Ltmp8:
	.loc	1 76 1                          # Test.c:76:1
	xorl	%eax, %eax
	addq	$96, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Ltmp9:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
	.file	2 "/opt/zig-linux-x86_64-dev/lib/libc/include/generic-glibc" "time.h"
	.file	3 "/opt/zig-linux-x86_64-dev/lib/libc/include/generic-glibc/bits" "types.h"
	.file	4 "/opt/zig-linux-x86_64-dev/lib/libc/include/generic-glibc/bits/types" "clock_t.h"
	.file	5 "/home/amr/AM/ClangLib" "./file_handle.h"
	.file	6 "/opt/zig-linux-x86_64-dev/lib/include" "stddef.h"
	.file	7 "/opt/zig-linux-x86_64-dev/lib/libc/include/generic-glibc/bits/types" "struct_FILE.h"
	.file	8 "/opt/zig-linux-x86_64-dev/lib/libc/include/generic-glibc/bits/types" "FILE.h"
	.file	9 "/home/amr/AM/ClangLib" "./LibTypes.h"
	.file	10 "/home/amr/AM/ClangLib" "./LibStr.h"
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"./text_file.txt"
	.size	.L.str, 16

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	" Assembly"
	.size	.L.str.1, 10

	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Ltmp0-.Lfunc_begin0
	.quad	.Ltmp1-.Lfunc_begin0
	.short	1                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp2-.Lfunc_begin0
	.quad	.Ltmp3-.Lfunc_begin0
	.short	6                               # Loc expr size
	.byte	80                              # DW_OP_reg0
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.byte	81                              # DW_OP_reg1
	.byte	147                             # DW_OP_piece
	.byte	8                               # 8
	.quad	0
	.quad	0
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	14                              # DW_FORM_strp
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	14                              # DW_FORM_strp
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.ascii	"\227B"                         # DW_AT_GNU_all_call_sites
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	23                              # DW_FORM_sec_offset
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.ascii	"\211\202\001"                  # DW_TAG_GNU_call_site
	.byte	0                               # DW_CHILDREN_no
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.ascii	"\211\202\001"                  # DW_TAG_GNU_call_site
	.byte	1                               # DW_CHILDREN_yes
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.ascii	"\212\202\001"                  # DW_TAG_GNU_call_site_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.ascii	"\221B"                         # DW_AT_GNU_call_site_value
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	16                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	17                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	18                              # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	19                              # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	20                              # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	21                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	22                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	23                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	24                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                               # DWARF version number
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x43c DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	12                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2a:0xc9 DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_GNU_all_call_sites
	.long	.Linfo_string68                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	11                              # DW_AT_decl_line
	.long	776                             # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x43:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	48
	.long	.Linfo_string69                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	15                              # DW_AT_decl_line
	.long	300                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x51:0xf DW_TAG_variable
	.long	.Ldebug_loc0                    # DW_AT_location
	.long	.Linfo_string70                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	13                              # DW_AT_decl_line
	.long	276                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x60:0xf DW_TAG_variable
	.long	.Ldebug_loc1                    # DW_AT_location
	.long	.Linfo_string71                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	17                              # DW_AT_decl_line
	.long	976                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x6f:0xd DW_TAG_GNU_call_site
	.long	243                             # DW_AT_abstract_origin
	.quad	.Ltmp0                          # DW_AT_low_pc
	.byte	6                               # Abbrev [6] 0x7c:0x14 DW_TAG_GNU_call_site
	.long	283                             # DW_AT_abstract_origin
	.quad	.Ltmp1                          # DW_AT_low_pc
	.byte	7                               # Abbrev [7] 0x89:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	145
	.byte	48
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x90:0xd DW_TAG_GNU_call_site
	.long	959                             # DW_AT_abstract_origin
	.quad	.Ltmp2                          # DW_AT_low_pc
	.byte	5                               # Abbrev [5] 0x9d:0xd DW_TAG_GNU_call_site
	.long	1025                            # DW_AT_abstract_origin
	.quad	.Ltmp3                          # DW_AT_low_pc
	.byte	5                               # Abbrev [5] 0xaa:0xd DW_TAG_GNU_call_site
	.long	1038                            # DW_AT_abstract_origin
	.quad	.Ltmp4                          # DW_AT_low_pc
	.byte	6                               # Abbrev [6] 0xb7:0x14 DW_TAG_GNU_call_site
	.long	1051                            # DW_AT_abstract_origin
	.quad	.Ltmp5                          # DW_AT_low_pc
	.byte	7                               # Abbrev [7] 0xc4:0x6 DW_TAG_GNU_call_site_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.byte	2                               # DW_AT_GNU_call_site_value
	.byte	115
	.byte	0
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0xcb:0xd DW_TAG_GNU_call_site
	.long	1038                            # DW_AT_abstract_origin
	.quad	.Ltmp6                          # DW_AT_low_pc
	.byte	5                               # Abbrev [5] 0xd8:0xd DW_TAG_GNU_call_site
	.long	1074                            # DW_AT_abstract_origin
	.quad	.Ltmp7                          # DW_AT_low_pc
	.byte	5                               # Abbrev [5] 0xe5:0xd DW_TAG_GNU_call_site
	.long	1087                            # DW_AT_abstract_origin
	.quad	.Ltmp8                          # DW_AT_low_pc
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0xf3:0xb DW_TAG_subprogram
	.long	.Linfo_string3                  # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	72                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	254                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	9                               # Abbrev [9] 0xfe:0xb DW_TAG_typedef
	.long	265                             # DW_AT_type
	.long	.Linfo_string6                  # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x109:0xb DW_TAG_typedef
	.long	276                             # DW_AT_type
	.long	.Linfo_string5                  # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	156                             # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x114:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	11                              # Abbrev [11] 0x11b:0x11 DW_TAG_subprogram
	.long	.Linfo_string7                  # DW_AT_name
	.byte	5                               # DW_AT_decl_file
	.byte	15                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	300                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	12                              # Abbrev [12] 0x126:0x5 DW_TAG_formal_parameter
	.long	368                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x12c:0xb DW_TAG_typedef
	.long	311                             # DW_AT_type
	.long	.Linfo_string60                 # DW_AT_name
	.byte	5                               # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.byte	13                              # Abbrev [13] 0x137:0x39 DW_TAG_structure_type
	.long	.Linfo_string60                 # DW_AT_name
	.byte	48                              # DW_AT_byte_size
	.byte	5                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.byte	14                              # Abbrev [14] 0x13f:0xc DW_TAG_member
	.long	.Linfo_string8                  # DW_AT_name
	.long	368                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	8                               # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x14b:0xc DW_TAG_member
	.long	.Linfo_string10                 # DW_AT_name
	.long	385                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x157:0xc DW_TAG_member
	.long	.Linfo_string13                 # DW_AT_name
	.long	403                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x163:0xc DW_TAG_member
	.long	.Linfo_string55                 # DW_AT_name
	.long	903                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	11                              # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x170:0x5 DW_TAG_pointer_type
	.long	373                             # DW_AT_type
	.byte	16                              # Abbrev [16] 0x175:0x5 DW_TAG_const_type
	.long	378                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0x17a:0x7 DW_TAG_base_type
	.long	.Linfo_string9                  # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	9                               # Abbrev [9] 0x181:0xb DW_TAG_typedef
	.long	396                             # DW_AT_type
	.long	.Linfo_string12                 # DW_AT_name
	.byte	6                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x18c:0x7 DW_TAG_base_type
	.long	.Linfo_string11                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	15                              # Abbrev [15] 0x193:0x5 DW_TAG_pointer_type
	.long	408                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x198:0xb DW_TAG_typedef
	.long	419                             # DW_AT_type
	.long	.Linfo_string54                 # DW_AT_name
	.byte	8                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.byte	13                              # Abbrev [13] 0x1a3:0x165 DW_TAG_structure_type
	.long	.Linfo_string53                 # DW_AT_name
	.byte	216                             # DW_AT_byte_size
	.byte	7                               # DW_AT_decl_file
	.byte	49                              # DW_AT_decl_line
	.byte	14                              # Abbrev [14] 0x1ab:0xc DW_TAG_member
	.long	.Linfo_string14                 # DW_AT_name
	.long	776                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	51                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1b7:0xc DW_TAG_member
	.long	.Linfo_string16                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	54                              # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1c3:0xc DW_TAG_member
	.long	.Linfo_string17                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	55                              # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1cf:0xc DW_TAG_member
	.long	.Linfo_string18                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	56                              # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1db:0xc DW_TAG_member
	.long	.Linfo_string19                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	57                              # DW_AT_decl_line
	.byte	32                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1e7:0xc DW_TAG_member
	.long	.Linfo_string20                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	58                              # DW_AT_decl_line
	.byte	40                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1f3:0xc DW_TAG_member
	.long	.Linfo_string21                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	59                              # DW_AT_decl_line
	.byte	48                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x1ff:0xc DW_TAG_member
	.long	.Linfo_string22                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	60                              # DW_AT_decl_line
	.byte	56                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x20b:0xc DW_TAG_member
	.long	.Linfo_string23                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	61                              # DW_AT_decl_line
	.byte	64                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x217:0xc DW_TAG_member
	.long	.Linfo_string24                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	64                              # DW_AT_decl_line
	.byte	72                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x223:0xc DW_TAG_member
	.long	.Linfo_string25                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	65                              # DW_AT_decl_line
	.byte	80                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x22f:0xc DW_TAG_member
	.long	.Linfo_string26                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	66                              # DW_AT_decl_line
	.byte	88                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x23b:0xc DW_TAG_member
	.long	.Linfo_string27                 # DW_AT_name
	.long	788                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	68                              # DW_AT_decl_line
	.byte	96                              # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x247:0xc DW_TAG_member
	.long	.Linfo_string29                 # DW_AT_name
	.long	798                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	70                              # DW_AT_decl_line
	.byte	104                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x253:0xc DW_TAG_member
	.long	.Linfo_string30                 # DW_AT_name
	.long	776                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	72                              # DW_AT_decl_line
	.byte	112                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x25f:0xc DW_TAG_member
	.long	.Linfo_string31                 # DW_AT_name
	.long	776                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	73                              # DW_AT_decl_line
	.byte	116                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x26b:0xc DW_TAG_member
	.long	.Linfo_string32                 # DW_AT_name
	.long	803                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	74                              # DW_AT_decl_line
	.byte	120                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x277:0xc DW_TAG_member
	.long	.Linfo_string34                 # DW_AT_name
	.long	814                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	77                              # DW_AT_decl_line
	.byte	128                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x283:0xc DW_TAG_member
	.long	.Linfo_string36                 # DW_AT_name
	.long	821                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	78                              # DW_AT_decl_line
	.byte	130                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x28f:0xc DW_TAG_member
	.long	.Linfo_string38                 # DW_AT_name
	.long	828                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	79                              # DW_AT_decl_line
	.byte	131                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x29b:0xc DW_TAG_member
	.long	.Linfo_string40                 # DW_AT_name
	.long	847                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	81                              # DW_AT_decl_line
	.byte	136                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2a7:0xc DW_TAG_member
	.long	.Linfo_string42                 # DW_AT_name
	.long	859                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	89                              # DW_AT_decl_line
	.byte	144                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2b3:0xc DW_TAG_member
	.long	.Linfo_string44                 # DW_AT_name
	.long	870                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	91                              # DW_AT_decl_line
	.byte	152                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2bf:0xc DW_TAG_member
	.long	.Linfo_string46                 # DW_AT_name
	.long	880                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	92                              # DW_AT_decl_line
	.byte	160                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2cb:0xc DW_TAG_member
	.long	.Linfo_string48                 # DW_AT_name
	.long	798                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	93                              # DW_AT_decl_line
	.byte	168                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2d7:0xc DW_TAG_member
	.long	.Linfo_string49                 # DW_AT_name
	.long	890                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	94                              # DW_AT_decl_line
	.byte	176                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2e3:0xc DW_TAG_member
	.long	.Linfo_string50                 # DW_AT_name
	.long	385                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	95                              # DW_AT_decl_line
	.byte	184                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2ef:0xc DW_TAG_member
	.long	.Linfo_string51                 # DW_AT_name
	.long	776                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	96                              # DW_AT_decl_line
	.byte	192                             # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x2fb:0xc DW_TAG_member
	.long	.Linfo_string52                 # DW_AT_name
	.long	891                             # DW_AT_type
	.byte	7                               # DW_AT_decl_file
	.byte	98                              # DW_AT_decl_line
	.byte	196                             # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	10                              # Abbrev [10] 0x308:0x7 DW_TAG_base_type
	.long	.Linfo_string15                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	15                              # Abbrev [15] 0x30f:0x5 DW_TAG_pointer_type
	.long	378                             # DW_AT_type
	.byte	15                              # Abbrev [15] 0x314:0x5 DW_TAG_pointer_type
	.long	793                             # DW_AT_type
	.byte	17                              # Abbrev [17] 0x319:0x5 DW_TAG_structure_type
	.long	.Linfo_string28                 # DW_AT_name
                                        # DW_AT_declaration
	.byte	15                              # Abbrev [15] 0x31e:0x5 DW_TAG_pointer_type
	.long	419                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x323:0xb DW_TAG_typedef
	.long	276                             # DW_AT_type
	.long	.Linfo_string33                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	152                             # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x32e:0x7 DW_TAG_base_type
	.long	.Linfo_string35                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	2                               # DW_AT_byte_size
	.byte	10                              # Abbrev [10] 0x335:0x7 DW_TAG_base_type
	.long	.Linfo_string37                 # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	18                              # Abbrev [18] 0x33c:0xc DW_TAG_array_type
	.long	378                             # DW_AT_type
	.byte	19                              # Abbrev [19] 0x341:0x6 DW_TAG_subrange_type
	.long	840                             # DW_AT_type
	.byte	1                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	20                              # Abbrev [20] 0x348:0x7 DW_TAG_base_type
	.long	.Linfo_string39                 # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	15                              # Abbrev [15] 0x34f:0x5 DW_TAG_pointer_type
	.long	852                             # DW_AT_type
	.byte	21                              # Abbrev [21] 0x354:0x7 DW_TAG_typedef
	.long	.Linfo_string41                 # DW_AT_name
	.byte	7                               # DW_AT_decl_file
	.byte	43                              # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x35b:0xb DW_TAG_typedef
	.long	276                             # DW_AT_type
	.long	.Linfo_string43                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	153                             # DW_AT_decl_line
	.byte	15                              # Abbrev [15] 0x366:0x5 DW_TAG_pointer_type
	.long	875                             # DW_AT_type
	.byte	17                              # Abbrev [17] 0x36b:0x5 DW_TAG_structure_type
	.long	.Linfo_string45                 # DW_AT_name
                                        # DW_AT_declaration
	.byte	15                              # Abbrev [15] 0x370:0x5 DW_TAG_pointer_type
	.long	885                             # DW_AT_type
	.byte	17                              # Abbrev [17] 0x375:0x5 DW_TAG_structure_type
	.long	.Linfo_string47                 # DW_AT_name
                                        # DW_AT_declaration
	.byte	22                              # Abbrev [22] 0x37a:0x1 DW_TAG_pointer_type
	.byte	18                              # Abbrev [18] 0x37b:0xc DW_TAG_array_type
	.long	378                             # DW_AT_type
	.byte	19                              # Abbrev [19] 0x380:0x6 DW_TAG_subrange_type
	.long	840                             # DW_AT_type
	.byte	20                              # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x387:0xb DW_TAG_typedef
	.long	914                             # DW_AT_type
	.long	.Linfo_string59                 # DW_AT_name
	.byte	9                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.byte	13                              # Abbrev [13] 0x392:0x2d DW_TAG_structure_type
	.long	.Linfo_string59                 # DW_AT_name
	.byte	24                              # DW_AT_byte_size
	.byte	9                               # DW_AT_decl_file
	.byte	33                              # DW_AT_decl_line
	.byte	14                              # Abbrev [14] 0x39a:0xc DW_TAG_member
	.long	.Linfo_string56                 # DW_AT_name
	.long	385                             # DW_AT_type
	.byte	9                               # DW_AT_decl_file
	.byte	34                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3a6:0xc DW_TAG_member
	.long	.Linfo_string57                 # DW_AT_name
	.long	385                             # DW_AT_type
	.byte	9                               # DW_AT_decl_file
	.byte	35                              # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3b2:0xc DW_TAG_member
	.long	.Linfo_string58                 # DW_AT_name
	.long	783                             # DW_AT_type
	.byte	9                               # DW_AT_decl_file
	.byte	36                              # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	11                              # Abbrev [11] 0x3bf:0x11 DW_TAG_subprogram
	.long	.Linfo_string61                 # DW_AT_name
	.byte	10                              # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	976                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	12                              # Abbrev [12] 0x3ca:0x5 DW_TAG_formal_parameter
	.long	903                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x3d0:0xb DW_TAG_typedef
	.long	987                             # DW_AT_type
	.long	.Linfo_string62                 # DW_AT_name
	.byte	9                               # DW_AT_decl_file
	.byte	28                              # DW_AT_decl_line
	.byte	13                              # Abbrev [13] 0x3db:0x21 DW_TAG_structure_type
	.long	.Linfo_string62                 # DW_AT_name
	.byte	16                              # DW_AT_byte_size
	.byte	9                               # DW_AT_decl_file
	.byte	40                              # DW_AT_decl_line
	.byte	14                              # Abbrev [14] 0x3e3:0xc DW_TAG_member
	.long	.Linfo_string13                 # DW_AT_name
	.long	1020                            # DW_AT_type
	.byte	9                               # DW_AT_decl_file
	.byte	41                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	14                              # Abbrev [14] 0x3ef:0xc DW_TAG_member
	.long	.Linfo_string56                 # DW_AT_name
	.long	385                             # DW_AT_type
	.byte	9                               # DW_AT_decl_file
	.byte	42                              # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x3fc:0x5 DW_TAG_pointer_type
	.long	783                             # DW_AT_type
	.byte	23                              # Abbrev [23] 0x401:0xd DW_TAG_subprogram
	.long	.Linfo_string63                 # DW_AT_name
	.byte	10                              # DW_AT_decl_file
	.byte	64                              # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	12                              # Abbrev [12] 0x408:0x5 DW_TAG_formal_parameter
	.long	976                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	23                              # Abbrev [23] 0x40e:0xd DW_TAG_subprogram
	.long	.Linfo_string64                 # DW_AT_name
	.byte	10                              # DW_AT_decl_file
	.byte	62                              # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	12                              # Abbrev [12] 0x415:0x5 DW_TAG_formal_parameter
	.long	903                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	23                              # Abbrev [23] 0x41b:0x12 DW_TAG_subprogram
	.long	.Linfo_string65                 # DW_AT_name
	.byte	10                              # DW_AT_decl_file
	.byte	30                              # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	12                              # Abbrev [12] 0x422:0x5 DW_TAG_formal_parameter
	.long	1069                            # DW_AT_type
	.byte	12                              # Abbrev [12] 0x427:0x5 DW_TAG_formal_parameter
	.long	368                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x42d:0x5 DW_TAG_pointer_type
	.long	903                             # DW_AT_type
	.byte	23                              # Abbrev [23] 0x432:0xd DW_TAG_subprogram
	.long	.Linfo_string66                 # DW_AT_name
	.byte	5                               # DW_AT_decl_file
	.byte	17                              # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	12                              # Abbrev [12] 0x439:0x5 DW_TAG_formal_parameter
	.long	300                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	24                              # Abbrev [24] 0x43f:0x7 DW_TAG_subprogram
	.long	.Linfo_string67                 # DW_AT_name
	.byte	10                              # DW_AT_decl_file
	.byte	38                              # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 14.0.6 (git@github.com:ziglang/zig-bootstrap.git 73fba22053d7668fa2448a13b32c772f95c6e1c6)" # string offset=0
.Linfo_string1:
	.asciz	"Test.c"                        # string offset=105
.Linfo_string2:
	.asciz	"/home/amr/AM/ClangLib"         # string offset=112
.Linfo_string3:
	.asciz	"clock"                         # string offset=134
.Linfo_string4:
	.asciz	"long"                          # string offset=140
.Linfo_string5:
	.asciz	"__clock_t"                     # string offset=145
.Linfo_string6:
	.asciz	"clock_t"                       # string offset=155
.Linfo_string7:
	.asciz	"read_file_to_string"           # string offset=163
.Linfo_string8:
	.asciz	"name"                          # string offset=183
.Linfo_string9:
	.asciz	"char"                          # string offset=188
.Linfo_string10:
	.asciz	"size"                          # string offset=193
.Linfo_string11:
	.asciz	"unsigned long"                 # string offset=198
.Linfo_string12:
	.asciz	"size_t"                        # string offset=212
.Linfo_string13:
	.asciz	"ptr"                           # string offset=219
.Linfo_string14:
	.asciz	"_flags"                        # string offset=223
.Linfo_string15:
	.asciz	"int"                           # string offset=230
.Linfo_string16:
	.asciz	"_IO_read_ptr"                  # string offset=234
.Linfo_string17:
	.asciz	"_IO_read_end"                  # string offset=247
.Linfo_string18:
	.asciz	"_IO_read_base"                 # string offset=260
.Linfo_string19:
	.asciz	"_IO_write_base"                # string offset=274
.Linfo_string20:
	.asciz	"_IO_write_ptr"                 # string offset=289
.Linfo_string21:
	.asciz	"_IO_write_end"                 # string offset=303
.Linfo_string22:
	.asciz	"_IO_buf_base"                  # string offset=317
.Linfo_string23:
	.asciz	"_IO_buf_end"                   # string offset=330
.Linfo_string24:
	.asciz	"_IO_save_base"                 # string offset=342
.Linfo_string25:
	.asciz	"_IO_backup_base"               # string offset=356
.Linfo_string26:
	.asciz	"_IO_save_end"                  # string offset=372
.Linfo_string27:
	.asciz	"_markers"                      # string offset=385
.Linfo_string28:
	.asciz	"_IO_marker"                    # string offset=394
.Linfo_string29:
	.asciz	"_chain"                        # string offset=405
.Linfo_string30:
	.asciz	"_fileno"                       # string offset=412
.Linfo_string31:
	.asciz	"_flags2"                       # string offset=420
.Linfo_string32:
	.asciz	"_old_offset"                   # string offset=428
.Linfo_string33:
	.asciz	"__off_t"                       # string offset=440
.Linfo_string34:
	.asciz	"_cur_column"                   # string offset=448
.Linfo_string35:
	.asciz	"unsigned short"                # string offset=460
.Linfo_string36:
	.asciz	"_vtable_offset"                # string offset=475
.Linfo_string37:
	.asciz	"signed char"                   # string offset=490
.Linfo_string38:
	.asciz	"_shortbuf"                     # string offset=502
.Linfo_string39:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=512
.Linfo_string40:
	.asciz	"_lock"                         # string offset=532
.Linfo_string41:
	.asciz	"_IO_lock_t"                    # string offset=538
.Linfo_string42:
	.asciz	"_offset"                       # string offset=549
.Linfo_string43:
	.asciz	"__off64_t"                     # string offset=557
.Linfo_string44:
	.asciz	"_codecvt"                      # string offset=567
.Linfo_string45:
	.asciz	"_IO_codecvt"                   # string offset=576
.Linfo_string46:
	.asciz	"_wide_data"                    # string offset=588
.Linfo_string47:
	.asciz	"_IO_wide_data"                 # string offset=599
.Linfo_string48:
	.asciz	"_freeres_list"                 # string offset=613
.Linfo_string49:
	.asciz	"_freeres_buf"                  # string offset=627
.Linfo_string50:
	.asciz	"__pad5"                        # string offset=640
.Linfo_string51:
	.asciz	"_mode"                         # string offset=647
.Linfo_string52:
	.asciz	"_unused2"                      # string offset=653
.Linfo_string53:
	.asciz	"_IO_FILE"                      # string offset=662
.Linfo_string54:
	.asciz	"FILE"                          # string offset=671
.Linfo_string55:
	.asciz	"buf"                           # string offset=676
.Linfo_string56:
	.asciz	"length"                        # string offset=680
.Linfo_string57:
	.asciz	"capacity"                      # string offset=687
.Linfo_string58:
	.asciz	"str"                           # string offset=696
.Linfo_string59:
	.asciz	"String"                        # string offset=700
.Linfo_string60:
	.asciz	"file"                          # string offset=707
.Linfo_string61:
	.asciz	"Str_split"                     # string offset=712
.Linfo_string62:
	.asciz	"list"                          # string offset=722
.Linfo_string63:
	.asciz	"printLIST"                     # string offset=727
.Linfo_string64:
	.asciz	"printString"                   # string offset=737
.Linfo_string65:
	.asciz	"Str_cat"                       # string offset=749
.Linfo_string66:
	.asciz	"close_file"                    # string offset=757
.Linfo_string67:
	.asciz	"Str_free_all"                  # string offset=768
.Linfo_string68:
	.asciz	"main"                          # string offset=781
.Linfo_string69:
	.asciz	"a"                             # string offset=786
.Linfo_string70:
	.asciz	"t1"                            # string offset=788
.Linfo_string71:
	.asciz	"alis"                          # string offset=791
	.ident	"clang version 14.0.6 (git@github.com:ziglang/zig-bootstrap.git 73fba22053d7668fa2448a13b32c772f95c6e1c6)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
