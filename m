From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: PAP-12365: check_after_balance_leaf: S is incorrectkernel BUG at 
 prints.c:334! (Part 2)
Date: Mon, 12 Aug 2002 15:15:09 +0200
Message-ID: <3D57B4DD.7870B143@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11163-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Aug 10 21:38:57 router0 kernel: 12223
Aug 10 21:38:57 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) = 1600; MAX_CHILD_SIZE
(4072) - dc_size( [dc_number=0, dc_size=53157], 98 ) [2468]
= 1604
Aug 10 21:38:57 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:57 router0 kernel: PAP-12365:
check_after_balance_leaf: S is incorrectkernel BUG at
prints.c:334!
Aug 10 21:38:57 router0 kernel: invalid operand: 0000
Aug 10 21:38:57 router0 kernel: CPU:    0
Aug 10 21:38:57 router0 kernel: EIP:
0010:[reiserfs_panic+41/96]    Not tainted
Aug 10 21:38:57 router0 kernel: EFLAGS: 00010282
Aug 10 21:38:57 router0 kernel: eax: 00000036   ebx:
c0247e00   ecx: c5ac4000   edx: 00000001
Aug 10 21:38:57 router0 kernel: esi: c777a800   edi:
00000644   ebp: c3231b44   esp: c3231b2c
Aug 10 21:38:57 router0 kernel: ds: 0018   es: 0018   ss:
0018
Aug 10 21:38:57 router0 kernel: Process vboxgetty (pid:
1522, stackpage=c3231000)
Aug 10 21:38:57 router0 kernel: Stack: c024cdc0 c02ef9a0
c0247e00 c3231b54 c75be000 00000005 c3231b64 c01626b3
Aug 10 21:38:57 router0 squid[1510]: storeLateRelease:
released 0 objects
Aug 10 21:38:57 router0 kernel:        c777a800 c0247e00
c3231ba0 00000062 00000070 00000640 c3231bd0 c0162873
Aug 10 21:38:57 router0 kernel:        c3231bf4 c3231bf4
00000000 c3231de8 00000070 c3231ba0 c3231b98 00000000
Aug 10 21:38:57 router0 kernel: Call Trace:
[check_after_balance_leaf+403/416] [do_balance+227/368]
[mark_page_accessed+27/64] [bread+35/112]
[reiserfs_paste_into_item+153/240]
Aug 10 21:38:57 router0 kernel:
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488]
Aug 10 21:38:57 router0 kernel:
[generic_file_write+1065/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 21:38:57 router0 kernel:
Aug 10 21:38:57 router0 kernel: Code: 0f 0b 4e 01 c6 cd 24
c0 68 a0 f9 2e c0 85 f6 74 16 0f b7 46
Aug 10 21:38:57 router0 kernel:  5140
Aug 10 21:38:57 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:57 router0 kernel: 1: file_release
Aug 10 21:38:57 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:57 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3231758 c024cdc0 c02ef9a0
c0252b60 c3231780 c0252060 c3231800 c0178846
Aug 10 21:38:57 router0 kernel:        c777a800 c0252b60
c777a800 00000001 c32318dc 0000acfb 00001000 00003023
Aug 10 21:38:57 router0 kernel:        c777a800 00003023
c32317b8 00000002 00000302 00000001 00000000 c6bd1000
Aug 10 21:38:57 router0 kernel: Call Trace:
[search_by_key+6758/8144] [is_tree_node+76/96]
[search_by_key+6774/8144]
[search_for_position_by_key+178/1056] [make_cpu_key+69/80]
Aug 10 21:38:57 router0 kernel:
[reiserfs_do_truncate+178/1248]
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
Aug 10 21:38:57 router0 kernel:   [do_exit+164/560]
[do_invalid_op+0/144] [die+86/96] [do_invalid_op+124/144]
[reiserfs_panic+41/96] [vt_console_print+706/736]
Aug 10 21:38:57 router0 kernel:
[__call_console_drivers+55/80] [_call_console_drivers+87/96]
[call_console_drivers+217/240] [error_code+52/60]
[reiserfs_panic+41/96] [check_after_balance_leaf+403/416]
Aug 10 21:38:57 router0 kernel:   [do_balance+227/368]
[mark_page_accessed+27/64] [bread+35/112]
[reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688]
Aug 10 21:38:57 router0 kernel:
[block_prepare_write+33/64] [reiserfs_get_block+0/3488]
[reiserfs_prepare_write+97/112] [reiserfs_get_block+0/3488]
[generic_file_write+1065/1632] [sys_write+152/256]
Aug 10 21:38:57 router0 kernel:   [system_call+51/56]
Aug 10 21:38:57 router0 kernel: 5140
Aug 10 21:38:57 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:57 router0 kernel: 1: file_release
Aug 10 21:38:57 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:57 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3231758 c024cdc0 c02ef9a0
c0252b60 c3231780 c7650018 c3231800 c0178846
Aug 10 21:38:58 router0 kernel:        c777a800 c0252b60
c777a800 00000001 c32318dc 0000acfb 00001000 00000050
Aug 10 21:38:58 router0 kernel:        c777a800 00003023
c32317b8 00000003 00000302 c7650018 00000000 00000000
Aug 10 21:38:58 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_key+6774/8144]
[search_for_position_by_key+178/1056] [make_cpu_key+69/80]
[reiserfs_do_truncate+178/1248]
Aug 10 21:38:58 router0 kernel:
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
[do_exit+164/560]
Aug 10 21:38:58 router0 kernel:   [do_invalid_op+0/144]
[die+86/96] [do_invalid_op+124/144] [reiserfs_panic+41/96]
[vt_console_print+706/736] [__call_console_drivers+55/80]
Aug 10 21:38:58 router0 kernel:
[_call_console_drivers+87/96] [call_console_drivers+217/240]
[error_code+52/60] [reiserfs_panic+41/96]
[check_after_balance_leaf+403/416] [do_balance+227/368]
Aug 10 21:38:58 router0 kernel:   [mark_page_accessed+27/64]
[bread+35/112] [reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
Aug 10 21:38:58 router0 kernel:
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488] [generic_file_write+1065/1632]
[sys_write+152/256] [system_call+51/56]
Aug 10 21:38:58 router0 kernel: 5140
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 1: file_release
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3231758 c024cdc0 c02ef9a0
c0252b60 c3231780 c764d358 c3231800 c0178846
Aug 10 21:38:58 router0 kernel:        c777a800 c0252b60
c777a800 00000001 c32318dc 0000acfb 00001000 00000bd0
Aug 10 21:38:58 router0 kernel:        c777a800 00003023
c32317b8 00000004 00000302 c764d348 00000033 00000034
Aug 10 21:38:58 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_key+6774/8144]
[search_for_position_by_key+178/1056] [make_cpu_key+69/80]
[reiserfs_do_truncate+178/1248]
Aug 10 21:38:58 router0 kernel:
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
[do_exit+164/560]
Aug 10 21:38:58 router0 kernel:   [do_invalid_op+0/144]
[die+86/96] [do_invalid_op+124/144] [reiserfs_panic+41/96]
[vt_console_print+706/736] [__call_console_drivers+55/80]
Aug 10 21:38:58 router0 kernel:
[_call_console_drivers+87/96] [call_console_drivers+217/240]
[error_code+52/60] [reiserfs_panic+41/96]
[check_after_balance_leaf+403/416] [do_balance+227/368]
Aug 10 21:38:58 router0 kernel:   [mark_page_accessed+27/64]
[bread+35/112] [reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
Aug 10 21:38:58 router0 kernel:
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488] [generic_file_write+1065/1632]
[sys_write+152/256] [system_call+51/56]
Aug 10 21:38:58 router0 kernel: 5140
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 1: file_release
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3231758 c024cdc0 c02ef9a0
c0252b60 c3231780 c75dc4a8 c3231800 c0178846
Aug 10 21:38:58 router0 kernel:        c777a800 c0252b60
c777a800 00000001 c32318dc 0000acfb 00001000 00000c98
Aug 10 21:38:58 router0 kernel:        c777a800 00003023
c32317b8 00000005 00000302 c75dc498 00000048 00000049
Aug 10 21:38:58 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_key+6774/8144]
[search_for_position_by_key+178/1056] [make_cpu_key+69/80]
[reiserfs_do_truncate+178/1248]
Aug 10 21:38:58 router0 kernel:
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
[do_exit+164/560]
Aug 10 21:38:58 router0 kernel:   [do_invalid_op+0/144]
[die+86/96] [do_invalid_op+124/144] [reiserfs_panic+41/96]
[vt_console_print+706/736] [__call_console_drivers+55/80]
Aug 10 21:38:58 router0 kernel:
[_call_console_drivers+87/96] [call_console_drivers+217/240]
[error_code+52/60] [reiserfs_panic+41/96]
[check_after_balance_leaf+403/416] [do_balance+227/368]
Aug 10 21:38:58 router0 kernel:   [mark_page_accessed+27/64]
[bread+35/112] [reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
Aug 10 21:38:58 router0 kernel:
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488] [generic_file_write+1065/1632]
[sys_write+152/256] [system_call+51/56]
Aug 10 21:38:58 router0 kernel: fix_nodes
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 1: file_release
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: PAP-8305: fix_nodes:  there
is pending do_balancekernel BUG at prints.c:334!
Aug 10 21:38:58 router0 kernel: invalid operand: 0000
Aug 10 21:38:58 router0 kernel: CPU:    0
Aug 10 21:38:58 router0 kernel: EIP:
0010:[reiserfs_panic+41/96]    Not tainted
Aug 10 21:38:58 router0 kernel: EFLAGS: 00010282
Aug 10 21:38:58 router0 kernel: eax: 00000034   ebx:
c024b7e0   ecx: c5ac4000   edx: 00000001
Aug 10 21:38:58 router0 kernel: esi: c777a800   edi:
c3231440   ebp: c32313c8   esp: c32313b0
Aug 10 21:38:58 router0 kernel: ds: 0018   es: 0018   ss:
0018
Aug 10 21:38:58 router0 kernel: Process vboxgetty (pid:
1522, stackpage=c3231000)
Aug 10 21:38:58 router0 kernel: Stack: c024cdc0 c02ef9a0
c024b7e0 c32313d8 c3ad439c c3231950 c323141c c016d236
Aug 10 21:38:58 router0 kernel:        c777a800 c024b7e0
c024b7b9 c3231440 c3231950 c3231440 08230f60 08230f78
Aug 10 21:38:58 router0 kernel:        08230f90 08230fa8
08230fc0 08230ff0 08231098 082310a4 c3231440 c3231950
Aug 10 21:38:58 router0 kernel: Call Trace:
[fix_nodes+198/1440] [reiserfs_insert_item+113/224]
[indirect2direct+666/768] [maybe_indirect_to_direct+461/480]
[reiserfs_cut_from_item+276/1472]
Aug 10 21:38:58 router0 kernel:
[reiserfs_do_truncate+764/1248]
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
Aug 10 21:38:58 router0 kernel:   [do_exit+164/560]
[do_invalid_op+0/144] [die+86/96] [do_invalid_op+124/144]
[reiserfs_panic+41/96] [vt_console_print+706/736]
Aug 10 21:38:58 router0 kernel:
[__call_console_drivers+55/80] [_call_console_drivers+87/96]
[call_console_drivers+217/240] [error_code+52/60]
[reiserfs_panic+41/96] [check_after_balance_leaf+403/416]
Aug 10 21:38:58 router0 kernel:   [do_balance+227/368]
[mark_page_accessed+27/64] [bread+35/112]
[reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688]
Aug 10 21:38:58 router0 kernel:
[block_prepare_write+33/64] [reiserfs_get_block+0/3488]
[reiserfs_prepare_write+97/112] [reiserfs_get_block+0/3488]
[generic_file_write+1065/1632] [sys_write+152/256]
Aug 10 21:38:58 router0 kernel:   [system_call+51/56]
Aug 10 21:38:58 router0 kernel:
Aug 10 21:38:58 router0 kernel: Code: 0f 0b 4e 01 c6 cd 24
c0 68 a0 f9 2e c0 85 f6 74 16 0f b7 46
Aug 10 21:38:58 router0 kernel:  5140
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 1: file_release
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c77bddb4 c024cdc0 c02ef9a0
c0252b60 c77bdddc c0252060 c77bde5c c0178846
Aug 10 21:38:58 router0 kernel:        c777a800 c0252b60
c77bdedc c02487e8 c77bdedc c77bdee0 00000000 00000b28
Aug 10 21:38:58 router0 kernel:        00000b28 00005a2c
00000001 00000002 00000005 00000001 c75bd120 0000000b
Aug 10 21:38:58 router0 kernel: Call Trace:
[search_by_key+6758/8144] [make_cpu_key+69/80]
[reiserfs_update_sd+80/368] [reiserfs_dirty_inode+58/96]
[__mark_inode_dirty+47/128]
Aug 10 21:38:58 router0 kernel:
[generic_file_write+739/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 21:38:58 router0 kernel: 5140
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 1: file_release
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c77bddb4 c024cdc0 c02ef9a0
c0252b60 c77bdddc c7650018 c77bde5c c0178846
Aug 10 21:38:58 router0 kernel:        c777a800 c0252b60
c77bdedc c02487e8 c77bdedc c77bdee0 00000000 00000050
Aug 10 21:38:58 router0 kernel:        00000b28 00005a2c
00000001 00000003 00000005 c7650018 00000000 00000000
Aug 10 21:38:58 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_update_sd+80/368]
[reiserfs_dirty_inode+58/96] [__mark_inode_dirty+47/128]
[generic_file_write+739/1632]
Aug 10 21:38:58 router0 kernel:   [sys_write+152/256]
[system_call+51/56]
Aug 10 21:38:58 router0 kernel: 5140
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 1: file_release
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c77bddb4 c024cdc0 c02ef9a0
c0252b60 c77bdddc c764d358 c77bde5c c0178846
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 5140
Aug 10 21:38:58 router0 kernel:        c777a800 c0252b60
c777a800 c77bde54 c77bde6c c01e653d 00000000 00000050
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: 5140
Aug 10 21:38:58 router0 kernel:
[reiserfs_prepare_write+97/112] [reiserfs_get_block+0/3488]
[generic_file_write+1065/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 21:38:58 router0 kernel: fix_nodes
Aug 10 21:38:58 router0 kernel: EFLAGS: 00010282
Aug 10 21:38:58 router0 kernel: ds: 0018   es: 0018   ss:
0018
Aug 10 21:38:58 router0 kernel: Call Trace:
[fix_nodes+198/1440] [__call_console_drivers+55/80]
[reiserfs_paste_into_item+119/240] [direct2indirect+449/976]
[reiserfs_get_block+2570/3488]
Aug 10 21:38:58 router0 kernel: 5140
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 1: file_release
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: 3: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3327db4 c024cdc0 c02ef9a0
c0252b60 c3327ddc c0252060 c3327e5c c0178846
Aug 10 21:38:58 router0 kernel:        c01d6afb c030abc4
c77644b8 00000002 c77644b8 c030ab80 c030abc4 00000008
Aug 10 21:38:58 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3327db4 c024cdc0 c02ef9a0
c0252b60 c3327ddc c7650038 c3327e5c c0178846
Aug 10 21:38:58 router0 kernel:        c777a800 c0252b60
c3327edc c02487e8 c3327edc c3327e20 c01d6aa4 00000060
Aug 10 21:38:58 router0 kernel:        c01d6afb c030abc4
c77644b8 00000003 c77644b8 c7650028 00000001 00000002
Aug 10 21:38:58 router0 kernel: Call Trace:
[search_by_key+6758/8144] [start_request+324/528]
[start_request+411/528] [reiserfs_update_sd+80/368]
[end_8259A_irq+26/32]
Aug 10 21:38:58 router0 kernel:   [do_IRQ+140/176]
[reiserfs_dirty_inode+58/96] [__mark_inode_dirty+47/128]
[generic_file_write+739/1632] [sys_poll+724/752]
[sys_write+152/256]
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: 3: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3327db4 c024cdc0 c02ef9a0
c0252b60 c3327ddc c7644888 c3327e5c c0178846
Aug 10 21:38:58 router0 kernel:        c777a800 c0252b60
c3327edc c02487e8 c3327edc c3327e20 c01d6aa4 00000e28
Aug 10 21:38:58 router0 kernel:        c01d6afb c030abc4
c77644b8 00000004 c77644b8 c7644888 00000086 00000087
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: 1: file_release
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:38:58 router0 kernel: 3: reiserfs_get_block
Aug 10 21:38:58 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3327db4 c024cdc0 c02ef9a0
c0252b60 c3327ddc c5a8c5dc c3327e5c c0178846
Aug 10 21:38:58 router0 kernel:        c777a800 c0252b60
c3327edc c02487e8 c3327edc c3327e20 c01d6aa4 00000950
Aug 10 21:38:58 router0 kernel: Call Trace:
[search_by_key+6758/8144] [start_request+324/528]
[start_request+411/528] [reiserfs_update_sd+80/368]
[end_8259A_irq+26/32]
Aug 10 21:38:58 router0 kernel: 5140
Aug 10 21:38:58 router0 kernel: 0: reiserfs_get_block
Aug 10 21:38:58 router0 kernel:   [sys_write+152/256]
[system_call+51/56]
Aug 10 21:38:58 router0 kernel:   [sys_write+152/256]
[system_call+51/56]
Aug 10 21:38:58 router0 kernel: 2:
reiserfs_vfs_truncate_file
