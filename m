From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: PAP-12365: check_after_balance_leaf: S is incorrectkernel BUG at 
 prints.c:334! (Part 1)
Date: Mon, 12 Aug 2002 15:10:29 +0200
Message-ID: <3D57B3C5.2EFA522C@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11162-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello reiserfs team,

I experienced following bug with kernel 2.4.9, 2.4.19-pre3
and 2.4.20 when REISERFS_CHECK was on. If it was off, nearly
all went fine (there was some crash, but I have no log of
this crash).

Shortly after booting with REISERFS_CHECK on, the machine
hangs with following message (sent via networking syslogd to
another machine):

Aug 10 22:15:40 router0 /usr/sbin/cron[1406]: (CRON) STARTUP
(fork ok)
Aug 10 22:15:44 router0 kernel: 12223
Aug 10 22:15:44 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) = 1596; MAX_CHILD_SIZE
(4072) - dc_size( [dc_number=-981319276, dc_size=53157], 56
) [2472] = 1600
Aug 10 22:15:44 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:44 router0 kernel: PAP-12365:
check_after_balance_leaf: S is incorrectkernel BUG at
prints.c:334!
Aug 10 22:15:44 router0 kernel: invalid operand: 0000
Aug 10 22:15:44 router0 kernel: CPU:    0
Aug 10 22:15:44 router0 kernel: EIP:
0010:[reiserfs_panic+41/96]    Not tainted
Aug 10 22:15:44 router0 kernel: EFLAGS: 00010282
Aug 10 22:15:44 router0 kernel: eax: 00000036   ebx:
c0247e00   ecx: c3b54000   edx: 00000001
Aug 10 22:15:44 router0 kernel: esi: c777a800   edi:
00000640   ebp: c1a21b44   esp: c1a21b2c
Aug 10 22:15:44 router0 kernel: ds: 0018   es: 0018   ss:
0018
Aug 10 22:15:44 router0 kernel: Process httpd (pid: 1462,
stackpage=c1a21000)
Aug 10 22:15:44 router0 kernel: Stack: c024cdc0 c02ef9a0
c0247e00 c1a21b54 c51e9000 00000005 c1a21b64 c01626b3
Aug 10 22:15:44 router0 kernel:        c777a800 c0247e00
c1a21ba0 00000038 00000069 0000063c c1a21bd0 c0162873
Aug 10 22:15:44 router0 kernel:        c1a21bf4 c1a21bf4
c1a21e3c c1a21df0 00000069 c1a21ba0 c1a21b98 00000000
Aug 10 22:15:44 router0 kernel: Call Trace:
[check_after_balance_leaf+403/416] [do_balance+227/368]
[bread+35/112] [reiserfs_insert_item+143/224]
[reiserfs_get_block+2042/3488]
Aug 10 22:15:44 router0 kernel:   [do_journal_end+182/2624]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488]
Aug 10 22:15:44 router0 kernel:
[generic_file_write+1065/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 22:15:44 router0 kernel:
Aug 10 22:15:44 router0 kernel: Code: 0f 0b 4e 01 c6 cd 24
c0 68 a0 f9 2e c0 85 f6 74 16 0f b7 46
Aug 10 22:15:44 router0 kernel:  5140
Aug 10 22:15:44 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:44 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c2bb1d54 c024cdc0 c02ef9a0
c0252b60 c2bb1d7c c0252060 c2bb1dfc c0178846
Aug 10 22:15:44 router0 kernel:        c777a800 c0252b60
c2bb1e88 c02482ec c2bb1e48 00000001 00000000 00000000
Aug 10 22:15:44 router0 kernel:        00000000 c02fb1c0
00000000 00000002 00000000 00000000 07010000 c2bb1df4
Aug 10 22:15:44 router0 kernel: Call Trace:
[search_by_key+6758/8144] [update_attr+155/192]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:15:44 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+1477/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:15:44 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:15:44 router0 kernel: 5140
Aug 10 22:15:44 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:44 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c2bb1d54 c024cdc0 c02ef9a0
c0252b60 c2bb1d7c c5626018 c2bb1dfc c0178846
Aug 10 22:15:44 router0 kernel:        c777a800 c0252b60
c2bb1e88 c02482ec c2bb1e48 00000001 00000000 00000050
Aug 10 22:15:44 router0 kernel:        00000000 c02fb1c0
00000000 00000003 00000000 c5626018 00000000 00000000
Aug 10 22:15:44 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:15:44 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:15:44 router0 kernel:   [system_call+51/56]
Aug 10 22:15:44 router0 kernel: 5140
Aug 10 22:15:44 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:44 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c2bb1d54 c024cdc0 c02ef9a0
c0252b60 c2bb1d7c c5623328 c2bb1dfc c0178846
Aug 10 22:15:44 router0 kernel:        c777a800 c0252b60
c2bb1e88 c02482ec c2bb1e48 00000001 00000000 00000bb8
Aug 10 22:15:44 router0 kernel:        00000000 c02fb1c0
00000000 00000004 00000000 c5623328 00000030 00000031
Aug 10 22:15:44 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:15:44 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:15:44 router0 kernel:   [system_call+51/56]
Aug 10 22:15:44 router0 kernel: 5140
Aug 10 22:15:44 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:44 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c2bb1d54 c024cdc0 c02ef9a0
c0252b60 c2bb1d7c c2bb1e48 c2bb1dfc c0178846
Aug 10 22:15:44 router0 kernel:        c777a800 c0252b60
c2bb1e88 c02482ec c2bb1e48 00000001 00000000 00000b78
Aug 10 22:15:44 router0 kernel:        00000000 00000000
00000000 00000005 00000000 c55b4688 00000066 00000067
Aug 10 22:15:44 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:15:44 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:15:44 router0 kernel:   [system_call+51/56]
Aug 10 22:15:44 router0 kernel: 5140
Aug 10 22:15:44 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:44 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c2bb1d54 c024cdc0 c02ef9a0
c0252b60 c2bb1d7c c0252060 c2bb1dfc c0178846
Aug 10 22:15:44 router0 kernel:        c777a800 c0252b60
c2bb1e88 c02482ec c2bb1e48 00000001 00000000 00000b78
Aug 10 22:15:44 router0 kernel:        00000000 00000000
00000000 00000002 00000000 c55a7018 00000000 00000001
Aug 10 22:15:44 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:15:44 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:15:44 router0 kernel:   [system_call+51/56]
Aug 10 22:15:44 router0 kernel: 5140
Aug 10 22:15:44 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:45 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c2bb1d54 c024cdc0 c02ef9a0
c0252b60 c2bb1d7c c5626018 c2bb1dfc c0178846
Aug 10 22:15:45 router0 kernel:        c777a800 c0252b60
c2bb1e88 c02482ec c2bb1e48 00000001 00000000 00000050
Aug 10 22:15:45 router0 kernel:        00000000 00000000
00000000 00000003 00000000 c5626018 00000000 00000000
Aug 10 22:15:45 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:15:45 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:15:45 router0 kernel:   [system_call+51/56]
Aug 10 22:15:45 router0 kernel: 5140
Aug 10 22:15:45 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:45 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c2bb1d54 c024cdc0 c02ef9a0
c0252b60 c2bb1d7c c5623328 c2bb1dfc c0178846
Aug 10 22:15:45 router0 kernel:        c777a800 c0252b60
c2bb1e88 c02482ec c2bb1e48 00000001 00000000 00000bb8
Aug 10 22:15:45 router0 kernel:        00000000 00000000
00000000 00000004 00000000 c5623328 00000030 00000031
Aug 10 22:15:45 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:15:45 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:15:45 router0 kernel:   [system_call+51/56]
Aug 10 22:15:45 router0 kernel: 5140
Aug 10 22:15:45 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:45 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c2bb1d54 c024cdc0 c02ef9a0
c0252b60 c2bb1d7c c2bb1e48 c2bb1dfc c0178846
Aug 10 22:15:45 router0 kernel:        c777a800 c0252b60
c2bb1e88 c02482ec c2bb1e48 00000001 00000000 00000b78
Aug 10 22:15:45 router0 kernel:        00000000 00000000
00000000 00000005 00000000 c55b4688 00000066 00000067
Aug 10 22:15:45 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:15:45 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:15:45 router0 kernel:   [system_call+51/56]
Aug 10 22:15:45 router0 kernel: 5140
Aug 10 22:15:45 router0 kernel: 0: reiserfs_get_block
Aug 10 22:15:45 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c559bd54 c024cdc0 c02ef9a0
c0252b60 c559bd7c c0252060 c559bdfc c0178846
Aug 10 22:15:45 router0 kernel:        c777a800 c0252b60
c559be88 c02482ec c559be48 c559bdc0 c01c697d c114c240
Aug 10 22:15:45 router0 kernel:        00000007 00000001
00000000 00000002 00000000 c02fb1c0 00000000 00000000



I had changed PAP-5140 a bit so that it does not panic and
prints out a stack trace instead. You can reproduce this
behaviour by applying the patches
"linux-2.4.20.showStackOnFailingConntrackListDelete.patch"
(enables showing stack) and
"linux-2.4.20.reiserfs.PAP-5140.nervous.patch" (changes
PAP-5140)

I changed PAP-5140 because at first, only PAP-5140 errors
were printed, the reason (error "PAP-12365") already had
scrolled up the screen (and logging to disk was not possible
because reiserfs refused to work... ;-)).


Here are some logs of other hangs:

Aug 10 21:10:45 router0 kernel: 12223
Aug 10 21:10:45 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) = 1608; MAX_CHILD_SIZE
(4072) - dc_size( [dc_number=0, dc_size=53157], 97 ) [2460]
= 1612
Aug 10 21:10:45 router0 kernel: 0: reiserfs_get_block



Aug 10 21:21:39 router0 kernel: 12223
Aug 10 21:21:40 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) = 1600; MAX_CHILD_SIZE
(4072) - dc_size( [dc_number=0, dc_size=53157], 99 ) [2468]
= 1604
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: PAP-12365:
check_after_balance_leaf: S is incorrectkernel BUG at
prints.c:334!
Aug 10 21:21:40 router0 kernel: invalid operand: 0000
Aug 10 21:21:40 router0 kernel: CPU:    0
Aug 10 21:21:40 router0 kernel: EIP:
0010:[reiserfs_panic+41/96]    Not tainted
Aug 10 21:21:40 router0 kernel: EFLAGS: 00010282
Aug 10 21:21:40 router0 kernel: eax: 00000036   ebx:
c0247e00   ecx: c5ac6000   edx: 00000001
Aug 10 21:21:40 router0 kernel: esi: c777a800   edi:
00000644   ebp: c33e3b44   esp: c33e3b2c
Aug 10 21:21:40 router0 kernel: ds: 0018   es: 0018   ss:
0018
Aug 10 21:21:40 router0 kernel: Process vboxgetty (pid:
1518, stackpage=c33e3000)
Aug 10 21:21:40 router0 kernel: Stack: c024cdc0 c02ef9a0
c0247e00 c33e3b54 c75b9000 00000005 c33e3b64 c01626b3
Aug 10 21:21:40 router0 kernel:        c777a800 c0247e00
c33e3ba0 00000063 00000070 00000640 c33e3bd0 c0162873
Aug 10 21:21:40 router0 kernel:        c33e3bf4 c33e3bf4
00000000 c33e3de8 00000070 c33e3ba0 c33e3b98 00000000
Aug 10 21:21:40 router0 kernel: Call Trace:
[check_after_balance_leaf+403/416] [do_balance+227/368]
[mark_page_accessed+27/64] [bread+35/112]
[reiserfs_paste_into_item+153/240]
Aug 10 21:21:40 router0 kernel:
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488]
Aug 10 21:21:40 router0 kernel:
[generic_file_write+1065/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 21:21:40 router0 kernel:
Aug 10 21:21:40 router0 kernel: Code: 0f 0b 4e 01 c6 cd 24
c0 68 a0 f9 2e c0 85 f6 74 16 0f b7 46
Aug 10 21:21:40 router0 kernel:  5140
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 1: file_release
Aug 10 21:21:40 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:40 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c33e3758 c024cdc0 c02ef9a0
c0252b60 c33e3780 c0252060 c33e3800 c0178846
Aug 10 21:21:40 router0 kernel:        c777a800 c0252b60
c777a800 00000001 c33e38dc 0000acfb 00001000 00002fe5
Aug 10 21:21:40 router0 kernel:        c777a800 00002fe5
c33e37b8 00000002 00000302 00000001 00000000 c6c9f000
Aug 10 21:21:40 router0 kernel: Call Trace:
[search_by_key+6758/8144] [is_tree_node+76/96]
[search_by_key+6774/8144]
[search_for_position_by_key+178/1056] [make_cpu_key+69/80]
Aug 10 21:21:40 router0 kernel:
[reiserfs_do_truncate+178/1248]
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
Aug 10 21:21:40 router0 kernel:   [do_exit+164/560]
[do_invalid_op+0/144] [die+86/96] [do_invalid_op+124/144]
[reiserfs_panic+41/96] [vt_console_print+706/736]
Aug 10 21:21:40 router0 kernel:
[__call_console_drivers+55/80] [_call_console_drivers+87/96]
[call_console_drivers+217/240] [error_code+52/60]
[reiserfs_panic+41/96] [check_after_balance_leaf+403/416]
Aug 10 21:21:40 router0 kernel:   [do_balance+227/368]
[mark_page_accessed+27/64] [bread+35/112]
[reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688]
Aug 10 21:21:40 router0 kernel:
[block_prepare_write+33/64] [reiserfs_get_block+0/3488]
[reiserfs_prepare_write+97/112] [reiserfs_get_block+0/3488]
[generic_file_write+1065/1632] [sys_write+152/256]
Aug 10 21:21:40 router0 kernel:   [system_call+51/56]
Aug 10 21:21:40 router0 kernel: 5140
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 1: file_release
Aug 10 21:21:40 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:40 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c33e3758 c024cdc0 c02ef9a0
c0252b60 c33e3780 c7650018 c33e3800 c0178846
Aug 10 21:21:40 router0 kernel:        c777a800 c0252b60
c777a800 00000001 c33e38dc 0000acfb 00001000 00000050
Aug 10 21:21:40 router0 kernel:        c777a800 00002fe5
c33e37b8 00000003 00000302 c7650018 00000000 00000000
Aug 10 21:21:40 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_key+6774/8144]
[search_for_position_by_key+178/1056] [make_cpu_key+69/80]
[reiserfs_do_truncate+178/1248]
Aug 10 21:21:40 router0 kernel:
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
[do_exit+164/560]
Aug 10 21:21:40 router0 kernel:   [do_invalid_op+0/144]
[die+86/96] [do_invalid_op+124/144] [reiserfs_panic+41/96]
[vt_console_print+706/736] [__call_console_drivers+55/80]
Aug 10 21:21:40 router0 kernel:
[_call_console_drivers+87/96] [call_console_drivers+217/240]
[error_code+52/60] [reiserfs_panic+41/96]
[check_after_balance_leaf+403/416] [do_balance+227/368]
Aug 10 21:21:40 router0 kernel:   [mark_page_accessed+27/64]
[bread+35/112] [reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
Aug 10 21:21:40 router0 kernel:
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488] [generic_file_write+1065/1632]
[sys_write+152/256] [system_call+51/56]
Aug 10 21:21:40 router0 kernel: 5140
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 1: file_release
Aug 10 21:21:40 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:40 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c33e3758 c024cdc0 c02ef9a0
c0252b60 c33e3780 c764d358 c33e3800 c0178846
Aug 10 21:21:40 router0 kernel:        c777a800 c0252b60
c777a800 00000001 c33e38dc 0000acfb 00001000 00000bd0
Aug 10 21:21:40 router0 kernel:        c777a800 00002fe5
c33e37b8 00000004 00000302 c764d348 00000033 00000034
Aug 10 21:21:40 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_key+6774/8144]
[search_for_position_by_key+178/1056] [make_cpu_key+69/80]
[reiserfs_do_truncate+178/1248]
Aug 10 21:21:40 router0 kernel:
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
[do_exit+164/560]
Aug 10 21:21:40 router0 kernel:   [do_invalid_op+0/144]
[die+86/96] [do_invalid_op+124/144] [reiserfs_panic+41/96]
[vt_console_print+706/736] [__call_console_drivers+55/80]
Aug 10 21:21:40 router0 kernel:
[_call_console_drivers+87/96] [call_console_drivers+217/240]
[error_code+52/60] [reiserfs_panic+41/96]
[check_after_balance_leaf+403/416] [do_balance+227/368]
Aug 10 21:21:40 router0 kernel:   [mark_page_accessed+27/64]
[bread+35/112] [reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
Aug 10 21:21:40 router0 kernel:
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488] [generic_file_write+1065/1632]
[sys_write+152/256] [system_call+51/56]
Aug 10 21:21:40 router0 kernel: 5140
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 1: file_release
Aug 10 21:21:40 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:40 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c33e3758 c024cdc0 c02ef9a0
c0252b60 c33e3780 c75dc4a8 c33e3800 c0178846
Aug 10 21:21:40 router0 kernel:        c777a800 c0252b60
c777a800 00000001 c33e38dc 0000acfb 00001000 00000c98
Aug 10 21:21:40 router0 kernel:        c777a800 00002fe5
c33e37b8 00000005 00000302 c75dc498 00000048 00000049
Aug 10 21:21:40 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_key+6774/8144]
[search_for_position_by_key+178/1056] [make_cpu_key+69/80]
[reiserfs_do_truncate+178/1248]
Aug 10 21:21:40 router0 kernel:
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
[do_exit+164/560]
Aug 10 21:21:40 router0 kernel:   [do_invalid_op+0/144]
[die+86/96] [do_invalid_op+124/144] [reiserfs_panic+41/96]
[vt_console_print+706/736] [__call_console_drivers+55/80]
Aug 10 21:21:40 router0 kernel:
[_call_console_drivers+87/96] [call_console_drivers+217/240]
[error_code+52/60] [reiserfs_panic+41/96]
[check_after_balance_leaf+403/416] [do_balance+227/368]
Aug 10 21:21:40 router0 kernel:   [mark_page_accessed+27/64]
[bread+35/112] [reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
Aug 10 21:21:40 router0 kernel:
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488] [generic_file_write+1065/1632]
[sys_write+152/256] [system_call+51/56]
Aug 10 21:21:40 router0 kernel: fix_nodes
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 1: file_release
Aug 10 21:21:40 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:40 router0 kernel: PAP-8305: fix_nodes:  there
is pending do_balancekernel BUG at prints.c:334!
Aug 10 21:21:40 router0 kernel: invalid operand: 0000
Aug 10 21:21:40 router0 kernel: CPU:    0
Aug 10 21:21:40 router0 kernel: EIP:
0010:[reiserfs_panic+41/96]    Not tainted
Aug 10 21:21:40 router0 kernel: EFLAGS: 00010282
Aug 10 21:21:40 router0 kernel: eax: 00000034   ebx:
c024b7e0   ecx: c5ac6000   edx: 00000001
Aug 10 21:21:40 router0 kernel: esi: c777a800   edi:
c33e3440   ebp: c33e33c8   esp: c33e33b0
Aug 10 21:21:40 router0 kernel: ds: 0018   es: 0018   ss:
0018
Aug 10 21:21:40 router0 kernel: Process vboxgetty (pid:
1518, stackpage=c33e3000)
Aug 10 21:21:40 router0 kernel: Stack: c024cdc0 c02ef9a0
c024b7e0 c33e33d8 c4c61194 c33e3950 c33e341c c016d236
Aug 10 21:21:40 router0 kernel:        c777a800 c024b7e0
c024b7b9 c33e3440 c33e3950 c33e3440 20776572 686e6542
Aug 10 21:21:40 router0 kernel:        28206d61 62736461
67696240 746f6f66 6d6f632e 23230a29 c33e3440 c33e3950
Aug 10 21:21:40 router0 kernel: Call Trace:
[fix_nodes+198/1440] [reiserfs_insert_item+113/224]
[indirect2direct+666/768] [maybe_indirect_to_direct+461/480]
[reiserfs_cut_from_item+276/1472]
Aug 10 21:21:40 router0 kernel:
[reiserfs_do_truncate+764/1248]
[reiserfs_truncate_file+190/384]
[reiserfs_file_release+826/864] [fput+84/224]
[filp_close+85/112] [put_files_struct+89/208]
Aug 10 21:21:40 router0 kernel:   [do_exit+164/560]
[do_invalid_op+0/144] [die+86/96] [do_invalid_op+124/144]
[reiserfs_panic+41/96] [vt_console_print+706/736]
Aug 10 21:21:40 router0 kernel:
[__call_console_drivers+55/80] [_call_console_drivers+87/96]
[call_console_drivers+217/240] [error_code+52/60]
[reiserfs_panic+41/96] [check_after_balance_leaf+403/416]
Aug 10 21:21:40 router0 kernel:   [do_balance+227/368]
[mark_page_accessed+27/64] [bread+35/112]
[reiserfs_paste_into_item+153/240]
[reiserfs_get_block+3097/3488]
[__block_prepare_write+198/688]
Aug 10 21:21:40 router0 kernel:
[block_prepare_write+33/64] [reiserfs_get_block+0/3488]
[reiserfs_prepare_write+97/112] [reiserfs_get_block+0/3488]
[generic_file_write+1065/1632] [sys_write+152/256]
Aug 10 21:21:40 router0 kernel:   [system_call+51/56]
Aug 10 21:21:40 router0 kernel:
Aug 10 21:21:40 router0 kernel: Code: 0f 0b 4e 01 c6 cd 24
c0 68 a0 f9 2e c0 85 f6 74 16 0f b7 46
Aug 10 21:21:40 router0 kernel:  5140
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 1: file_release
Aug 10 21:21:40 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:40 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c77bddb4 c024cdc0 c02ef9a0
c0252b60 c77bdddc c0252060 c77bde5c c0178846
Aug 10 21:21:40 router0 kernel:        c777a800 c0252b60
c77bdedc c02487e8 c77bdedc c77bdee0 00000001 00000b18
Aug 10 21:21:40 router0 kernel:        00000b18 00000001
00000001 00000002 00000005 c75b8120 c75b8120 0000000b
Aug 10 21:21:40 router0 kernel: Call Trace:
[search_by_key+6758/8144] [make_cpu_key+69/80]
[reiserfs_update_sd+80/368] [reiserfs_dirty_inode+58/96]
[__mark_inode_dirty+47/128]
Aug 10 21:21:40 router0 kernel:
[generic_file_write+739/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 21:21:40 router0 kernel: 5140
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 1: file_release
Aug 10 21:21:40 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:40 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c77bddb4 c024cdc0 c02ef9a0
c0252b60 c77bdddc c7650018 c77bde5c c0178846
Aug 10 21:21:40 router0 kernel:        c777a800 c0252b60
c77bdedc c02487e8 c77bdedc c77bdee0 00000001 00000050
Aug 10 21:21:40 router0 kernel:        00000b18 00000001
00000001 00000003 00000005 c7650018 00000000 00000000
Aug 10 21:21:40 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_update_sd+80/368]
[reiserfs_dirty_inode+58/96] [__mark_inode_dirty+47/128]
[generic_file_write+739/1632]
Aug 10 21:21:40 router0 kernel:   [sys_write+152/256]
[system_call+51/56]
Aug 10 21:21:40 router0 kernel: 5140
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 1: file_release
Aug 10 21:21:40 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:40 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c77bddb4 c024cdc0 c02ef9a0
c0252b60 c77bdddc c764d358 c77bde5c c0178846
Aug 10 21:21:40 router0 kernel:        c777a800 c0252b60
c77bdedc c02487e8 c77bdedc c77bdee0 00000001 00000bd0
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 5140
Aug 10 21:21:40 router0 kernel:        00000007 00000000
00000000 00000002 0000000a c02fb1c0 00000000 c77bdcdc
Aug 10 21:21:40 router0 kernel: 3: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel:
[reiserfs_prepare_write+97/112] [reiserfs_get_block+0/3488]
[generic_file_write+1065/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 21:21:40 router0 kernel: 3: reiserfs_get_block
Aug 10 21:21:40 router0 kernel:
[reiserfs_prepare_write+97/112] [reiserfs_get_block+0/3488]
[generic_file_write+1065/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 21:21:40 router0 kernel:        00000246 c77bdc3c
c0116f18 00000005 00000011 c75dc498 00000047 00000048
Aug 10 21:21:40 router0 kernel:
[reiserfs_prepare_write+97/112] [reiserfs_get_block+0/3488]
[generic_file_write+1065/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 21:21:40 router0 kernel: fix_nodes
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel: 1: file_release
Aug 10 21:21:40 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:40 router0 kernel: invalid operand: 0000
Aug 10 21:21:40 router0 kernel: CPU:    0
Aug 10 21:21:40 router0 kernel: EIP:
0010:[reiserfs_panic+41/96]    Not tainted
Aug 10 21:21:40 router0 kernel: EFLAGS: 00010282
Aug 10 21:21:40 router0 kernel: eax: 00000034   ebx:
c024b7e0   ecx: c5ac6000   edx: 00000001
Aug 10 21:21:40 router0 kernel: esi: c777a800   edi:
c77bdb80   ebp: c77bdb08   esp: c77bdaf0
Aug 10 21:21:40 router0 kernel: Stack: c024cdc0 c02ef9a0
c024b7e0 c77bdb18 c33a4bbc c77bde28 c77bdb5c c016d236
Aug 10 21:21:40 router0 kernel:  <0>Kernel panic: Attempted
to kill init!
Aug 10 21:21:40 router0 kernel:      c777a800 c0252b60
c324bedc c02487e8 c324bedc c324bee0 c776b000 00000d48
Aug 10 21:21:40 router0 kernel:        00000d48 00000001
00000001 00000002 00000005 c31d8048 c31d8048 00000002
Aug 10 21:21:40 router0 kernel:
[generic_file_write+739/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 21:21:40 router0 kernel: 5140
Aug 10 21:21:40 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:40 router0 kernel:        c777a800 c0252b60
c324bedc c02487e8 c324bedc c324bee0 c776b000 00000050
Aug 10 21:21:40 router0 kernel:        00000d48 00000001
00000001 00000003 00000005 c7650018 00000000 00000000
Aug 10 21:21:41 router0 kernel:   [sys_write+152/256]
[system_call+51/56]
Aug 10 21:21:41 router0 kernel: 5140
Aug 10 21:21:41 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:41 router0 kernel: 1: file_release
Aug 10 21:21:41 router0 kernel:        00000d48 00000001
00000001 00000004 00000005 c764d348 00000032 00000033
Aug 10 21:21:41 router0 kernel:   [sys_write+152/256]
[system_call+51/56]
Aug 10 21:21:41 router0 kernel: 5140
Aug 10 21:21:41 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:41 router0 kernel: 1: file_release
Aug 10 21:21:41 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:41 router0 kernel: 3: reiserfs_get_block
Aug 10 21:21:41 router0 kernel: 5140
Aug 10 21:21:41 router0 kernel: 3: reiserfs_get_block
Aug 10 21:21:41 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:41 router0 kernel: 5140
Aug 10 21:21:41 router0 kernel: 5140
Aug 10 21:21:41 router0 kernel:   [system_call+51/56]
Aug 10 21:21:41 router0 kernel:        c777a800 c0252b60
c324bee0 c02487e8 c324bee0 c776b000 00000d48 00000d48
Aug 10 21:21:41 router0 kernel:        c777a800 c0252b60
c324bee0 c02487e8 c324bee0 c776b000 00000d48 00000050
Aug 10 21:21:41 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c324bdb8 c024cdc0 c02ef9a0
c0252b60 c324bde0 c764d348 c324be60 c0178846
Aug 10 21:21:41 router0 kernel:        c777a800 c0252b60
c324bee0 c02487e8 c324bee0 c776b000 00000d48 00000bc8
Aug 10 21:21:41 router0 kernel:        00000001 00000001
00000005 00000004 c31d8048 c764d348 00000032 00000033
Aug 10 21:21:41 router0 kernel:   [system_call+51/56]
Aug 10 21:21:41 router0 kernel: 5140
Aug 10 21:21:41 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:41 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c324bdb8 c024cdc0 c02ef9a0
c0252b60 c324bde0 c75b964c c324be60 c0178846
Aug 10 21:21:41 router0 kernel: 1: file_release
Aug 10 21:21:41 router0 kernel: 5140
Aug 10 21:21:41 router0 kernel: 0: reiserfs_get_block
Aug 10 21:21:41 router0 kernel: 1: file_release
Aug 10 21:21:41 router0 kernel: 2:
reiserfs_vfs_truncate_file
Aug 10 21:21:41 router0 kernel: 3: reiserfs_get_block
Aug 10 21:21:41 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c324bdb4 c024cdc0 c02ef9a0
c0252b60 c324bddc c7650018 c324be5c c0178846
Aug 10 21:21:41 router0 kernel:        00000d48 00000001
00000001 00000003 00000005 c7650018 00000000 00000000
Aug 10 21:21:41 router0 kernel:   [sys_write+152/256]
[system_call+51/56]
