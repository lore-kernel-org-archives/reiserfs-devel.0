From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: PAP-12365: check_after_balance_leaf: S is incorrectkernel BUG at 
 prints.c:334! (Part 3)
Date: Mon, 12 Aug 2002 15:16:01 +0200
Message-ID: <3D57B511.892EFCEA@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com



Aug 10 22:05:21 router0 kernel: 12223
Aug 10 22:05:21 router0 kernel: B_FREE_SPACE
(PATH_H_PBUFFER(tb->tb_path,0)) = 8; MAX_CHILD_SIZE (4072) -
dc_size( [dc_number=0, dc_size=53157], 97 ) [4060] = 12
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-12365:
check_after_balance_leaf: S is incorrectkernel BUG at
prints.c:334!
Aug 10 22:05:21 router0 kernel: invalid operand: 0000
Aug 10 22:05:21 router0 kernel: CPU:    0
Aug 10 22:05:21 router0 kernel: EIP:
0010:[reiserfs_panic+41/96]    Not tainted
Aug 10 22:05:21 router0 kernel: EFLAGS: 00010282
Aug 10 22:05:21 router0 kernel: eax: 00000036   ebx:
c0247e00   ecx: c5acc000   edx: 00000001
Aug 10 22:05:21 router0 kernel: esi: c777a800   edi:
0000000c   ebp: c3a13b44   esp: c3a13b2c
Aug 10 22:05:21 router0 kernel: ds: 0018   es: 0018   ss:
0018
Aug 10 22:05:21 router0 kernel: Process httpd (pid: 1461,
stackpage=c3a13000)
Aug 10 22:05:21 router0 kernel: Stack: c024cdc0 c02ef9a0
c0247e00 c3a13b54 c75bd000 00000005 c3a13b64 c01626b3
Aug 10 22:05:21 router0 kernel:        c777a800 c0247e00
c3a13ba0 00000061 00000069 00000008 c3a13bd0 c0162873
Aug 10 22:05:21 router0 kernel:        c3a13bf4 c3a13bf4
c3a13e3c c3a13df0 00000069 c3a13ba0 c3a13b98 00000000
Aug 10 22:05:21 router0 kernel: Call Trace:
[check_after_balance_leaf+403/416] [do_balance+227/368]
[bread+35/112] [reiserfs_insert_item+143/224]
[reiserfs_get_block+2042/3488]
Aug 10 22:05:21 router0 kernel:   [do_journal_end+182/2624]
[__block_prepare_write+198/688] [block_prepare_write+33/64]
[reiserfs_get_block+0/3488] [reiserfs_prepare_write+97/112]
[reiserfs_get_block+0/3488]
Aug 10 22:05:21 router0 kernel:
[generic_file_write+1065/1632] [sys_write+152/256]
[system_call+51/56]
Aug 10 22:05:21 router0 kernel:
Aug 10 22:05:21 router0 kernel: Code: 0f 0b 4e 01 c6 cd 24
c0 68 a0 f9 2e c0 85 f6 74 16 0f b7 46
Aug 10 22:05:21 router0 kernel:  5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c0252060 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 00000001 00000000 00000000
Aug 10 22:05:21 router0 kernel:        00000000 c02fb1c0
00000000 00000002 00000000 00000000 07010000 c3a7fdf4
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [update_attr+155/192]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:05:21 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+1477/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:05:21 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c7650018 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 00000001 00000000 00000050
Aug 10 22:05:21 router0 kernel:        00000000 c02fb1c0
00000000 00000003 00000000 c7650018 00000000 00000000
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:05:21 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:05:21 router0 kernel:   [system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c764d328 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 00000001 00000000 00000bb8
Aug 10 22:05:21 router0 kernel:        00000000 c02fb1c0
00000000 00000004 00000000 c764d328 00000030 00000031
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:05:21 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:05:21 router0 kernel:   [system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c3a7fe48 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 00000001 00000000 00000b78
Aug 10 22:05:21 router0 kernel:        00000000 00000000
00000000 00000005 00000000 c75de688 00000066 00000067
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:05:21 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:05:21 router0 kernel:   [system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c0252060 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 00000001 00000000 00000b78
Aug 10 22:05:21 router0 kernel:        00000000 00000000
00000000 00000002 00000000 c75d1018 00000000 00000001
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:05:21 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:05:21 router0 kernel:   [system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c7650018 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 00000001 00000000 00000050
Aug 10 22:05:21 router0 kernel:        00000000 00000000
00000000 00000003 00000000 c7650018 00000000 00000000
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:05:21 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:05:21 router0 kernel:   [system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c764d328 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 00000001 00000000 00000bb8
Aug 10 22:05:21 router0 kernel:        00000000 00000000
00000000 00000004 00000000 c764d328 00000030 00000031
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:05:21 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:05:21 router0 kernel:   [system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c3a7fe48 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 00000001 00000000 00000b78
Aug 10 22:05:21 router0 kernel:        00000000 00000000
00000000 00000005 00000000 c75de688 00000066 00000067
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [search_by_entry_key+28/640]
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224]
Aug 10 22:05:21 router0 kernel:   [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
Aug 10 22:05:21 router0 kernel:   [system_call+51/56]
Aug 10 22:05:21 router0 kernel: _get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fbc4 c024cdc0 c02ef9a0
c0252b60 c3a7fbec c75a190c c3a7fc6c c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c777a800 c31e3bd4 c3a7fd64 c014bcde 080b396c 00000e88
Aug 10 22:05:21 router0 kernel:        c3a7fd24 00000001
200b206c 00000005 080b968c c75a18f8 0000008e 0000008d
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [padzero+30/48]
[search_for_position_by_key+178/1056] [make_cpu_key+69/80]
[_get_block_create_0+157/1584]
Aug 10 22:05:21 router0 kernel:
[_get_block_create_0+183/1584] [reiserfs_get_block+202/3488]
[handle_mm_fault+80/192] [do_page_fault+393/1230]
[do_page_fault+0/1230] [block_read_full_page+220/512]
Aug 10 22:05:21 router0 kernel:   [__alloc_pages+65/368]
[reiserfs_readpage+17/32] [reiserfs_get_block+0/3488]
[do_generic_file_read+669/1040] [generic_file_read+129/304]
[file_read_actor+0/144]
Aug 10 22:05:21 router0 kernel:   [sys_read+152/256]
[system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c0252060 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdb0 c012da51 000001d2
Aug 10 22:05:21 router0 kernel:        c57090c4 c57090c4
c028a574 00000002 c023136c 00104025 c3a7fdb8 c02314d6
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [__alloc_pages+65/368]
[fast_clear_page+12/80] [mmx_clear_page+38/48]
[do_anonymous_page+182/224]
Aug 10 22:05:21 router0 kernel:   [do_no_page+44/368]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320] [reiserfs_lookup+109/224]
[d_alloc+25/416]
Aug 10 22:05:21 router0 kernel:   [real_lookup+88/208]
[link_path_walk+615/2112] [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c7650038 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdb0 c012da51 00000060
Aug 10 22:05:21 router0 kernel:        c57090c4 c57090c4
c028a574 00000003 c023136c c7650028 00000001 00000002
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [__alloc_pages+65/368]
[fast_clear_page+12/80] [do_no_page+44/368]
[search_by_entry_key+28/640]
Aug 10 22:05:21 router0 kernel:
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224] [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+615/2112]
Aug 10 22:05:21 router0 kernel:   [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c7644838 c3a7fdfc c0178846
Aug 10 22:05:21 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdb0 c012da51 00000e00
Aug 10 22:05:21 router0 kernel:        c57090c4 c57090c4
c028a574 00000004 c023136c c7644838 00000081 00000082
Aug 10 22:05:21 router0 kernel: Call Trace:
[search_by_key+6758/8144] [__alloc_pages+65/368]
[fast_clear_page+12/80] [do_no_page+44/368]
[search_by_entry_key+28/640]
Aug 10 22:05:21 router0 kernel:
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224] [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+615/2112]
Aug 10 22:05:21 router0 kernel:   [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:21 router0 kernel: 5140
Aug 10 22:05:21 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:21 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c3a7fe48 c3a7fdfc c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdb0 c012da51 00000958
Aug 10 22:05:22 router0 kernel:        c57090c4 00000000
c0000074 00000005 c023136c c6bd4208 0000001e 0000001f
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [__alloc_pages+65/368]
[fast_clear_page+12/80] [do_no_page+44/368]
[search_by_entry_key+28/640]
Aug 10 22:05:22 router0 kernel:
[reiserfs_find_entry+79/320] [reiserfs_find_entry+106/320]
[reiserfs_lookup+109/224] [d_alloc+25/416]
[real_lookup+88/208] [link_path_walk+615/2112]
Aug 10 22:05:22 router0 kernel:   [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c0252060 c3a7fd88 c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c31e3dac c3a7fdac c3a7fdc4 0000002b 00000010 00000000
Aug 10 22:05:22 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000002 00000018 c3a7fd4c c0108d38 c3a80000
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[show_stack+104/128] [reiserfs_read_inode2+89/224]
[get_new_inode+206/368]
Aug 10 22:05:22 router0 kernel:   [iget4+183/208]
[reiserfs_find_actor+0/32] [reiserfs_iget+38/112]
[reiserfs_find_actor+0/32] [reiserfs_lookup+144/224]
[real_lookup+88/208]
Aug 10 22:05:22 router0 kernel:   [link_path_walk+615/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c7650038 c3a7fd88 c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c31e3dac c3a7fdac c3a7fdc4 0000002b 00000010 00000060
Aug 10 22:05:22 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000003 00000018 c7650028 00000001 00000002
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[reiserfs_read_inode2+89/224] [get_new_inode+206/368]
[iget4+183/208]
Aug 10 22:05:22 router0 kernel:   [reiserfs_find_actor+0/32]
[reiserfs_iget+38/112] [reiserfs_find_actor+0/32]
[reiserfs_lookup+144/224] [real_lookup+88/208]
[link_path_walk+615/2112]
Aug 10 22:05:22 router0 kernel:   [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c7644838 c3a7fd88 c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c31e3dac c3a7fdac c3a7fdc4 0000002b 00000010 00000e00
Aug 10 22:05:22 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000004 00000018 c7644838 00000081 00000082
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[reiserfs_read_inode2+89/224] [get_new_inode+206/368]
[iget4+183/208]
Aug 10 22:05:22 router0 kernel:   [reiserfs_find_actor+0/32]
[reiserfs_iget+38/112] [reiserfs_find_actor+0/32]
[reiserfs_lookup+144/224] [real_lookup+88/208]
[link_path_walk+615/2112]
Aug 10 22:05:22 router0 kernel:   [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c6bd441c c3a7fd88 c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c31e3dac c3a7fdac c3a7fdc4 0000002b 00000010 00000a60
Aug 10 22:05:22 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000005 00000018 c6bd4418 0000003f 00000040
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[reiserfs_read_inode2+89/224] [get_new_inode+206/368]
[iget4+183/208]
Aug 10 22:05:22 router0 kernel:   [reiserfs_find_actor+0/32]
[reiserfs_iget+38/112] [reiserfs_find_actor+0/32]
[reiserfs_lookup+144/224] [real_lookup+88/208]
[link_path_walk+615/2112]
Aug 10 22:05:22 router0 kernel:   [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c0252060 c3a7fdfc c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdc4 0004ab9a c3a7fe04
Aug 10 22:05:22 router0 kernel:        c3a7fe04 c0166dda
c3a7fdc4 00000002 c31e3dac c1151a78 0004ab9a 0004ab9b
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_read_inode2+202/224]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:05:22 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+615/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:05:22 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c7650038 c3a7fdfc c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdc4 0004ab9a 00000060
Aug 10 22:05:22 router0 kernel:        c3a7fe04 c0166dda
c3a7fdc4 00000003 c31e3dac c7650028 00000001 00000002
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_read_inode2+202/224]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:05:22 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+615/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:05:22 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c7644838 c3a7fdfc c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdc4 0004ab9a 00000e00
Aug 10 22:05:22 router0 kernel:        c3a7fe04 c0166dda
c3a7fdc4 00000004 c31e3dac c7644838 00000081 00000082
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_read_inode2+202/224]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:05:22 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+615/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:05:22 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c6bd441c c3a7fdfc c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdc4 0004ab9a 00000a60
Aug 10 22:05:22 router0 kernel:        c3a7fe04 c0166dda
c3a7fdc4 00000005 c31e3dac c6bd4418 0000003f 00000040
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_read_inode2+202/224]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:05:22 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+615/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:05:22 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c0252060 c3a7fd88 c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c36af104 c3a7fdac c3a7fdc4 0000002b 0000000e c6bd4000
Aug 10 22:05:22 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000002 00000018 c3a7fd4c c0108d38 c3a80000
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[show_stack+104/128] [reiserfs_read_inode2+89/224]
[get_new_inode+206/368]
Aug 10 22:05:22 router0 kernel:   [iget4+183/208]
[reiserfs_find_actor+0/32] [reiserfs_iget+38/112]
[reiserfs_find_actor+0/32] [reiserfs_lookup+144/224]
[real_lookup+88/208]
Aug 10 22:05:22 router0 kernel:   [link_path_walk+615/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c7650038 c3a7fd88 c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c36af104 c3a7fdac c3a7fdc4 0000002b 0000000e 00000060
Aug 10 22:05:22 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000003 00000018 c7650028 00000001 00000002
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[reiserfs_read_inode2+89/224] [get_new_inode+206/368]
[iget4+183/208]
Aug 10 22:05:22 router0 kernel:   [reiserfs_find_actor+0/32]
[reiserfs_iget+38/112] [reiserfs_find_actor+0/32]
[reiserfs_lookup+144/224] [real_lookup+88/208]
[link_path_walk+615/2112]
Aug 10 22:05:22 router0 kernel:   [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c7644838 c3a7fd88 c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c36af104 c3a7fdac c3a7fdc4 0000002b 0000000e 00000e00
Aug 10 22:05:22 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000004 00000018 c7644838 00000081 00000082
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[reiserfs_read_inode2+89/224] [get_new_inode+206/368]
[iget4+183/208]
Aug 10 22:05:22 router0 kernel:   [reiserfs_find_actor+0/32]
[reiserfs_iget+38/112] [reiserfs_find_actor+0/32]
[reiserfs_lookup+144/224] [real_lookup+88/208]
[link_path_walk+615/2112]
Aug 10 22:05:22 router0 kernel:   [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c6bd444c c3a7fd88 c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c36af104 c3a7fdac c3a7fdc4 0000002b 0000000e 00000a78
Aug 10 22:05:22 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000005 00000018 c6bd4448 00000042 00000043
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[reiserfs_read_inode2+89/224] [get_new_inode+206/368]
[iget4+183/208]
Aug 10 22:05:22 router0 kernel:   [reiserfs_find_actor+0/32]
[reiserfs_iget+38/112] [reiserfs_find_actor+0/32]
[reiserfs_lookup+144/224] [real_lookup+88/208]
[link_path_walk+615/2112]
Aug 10 22:05:22 router0 kernel:   [path_walk+29/48]
[__user_walk+60/96] [sys_stat64+26/112] [system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c0252060 c3a7fdfc c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdc4 0004ab9b c3a7fe04
Aug 10 22:05:22 router0 kernel:        c3a7fe04 c0166dda
c3a7fdc4 00000002 c36af104 c1151b68 0004ab9b 0004abb9
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_read_inode2+202/224]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:05:22 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+1477/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:05:22 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c7650038 c3a7fdfc c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdc4 0004ab9b 00000060
Aug 10 22:05:22 router0 kernel:        c3a7fe04 c0166dda
c3a7fdc4 00000003 c36af104 c7650028 00000001 00000002
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_read_inode2+202/224]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:05:22 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+1477/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:05:22 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c7644838 c3a7fdfc c0178846
Aug 10 22:05:22 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdc4 0004ab9b 00000e00
Aug 10 22:05:22 router0 kernel:        c3a7fe04 c0166dda
c3a7fdc4 00000004 c36af104 c7644838 00000081 00000082
Aug 10 22:05:22 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_read_inode2+202/224]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:05:22 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+1477/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:05:22 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:22 router0 kernel: 5140
Aug 10 22:05:22 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:22 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fd54 c024cdc0 c02ef9a0
c0252b60 c3a7fd7c c6bd444c c3a7fdfc c0178846
Aug 10 22:05:23 router0 kernel:        c777a800 c0252b60
c3a7fe88 c02482ec c3a7fe48 c3a7fdc4 0004ab9b 00000a78
Aug 10 22:05:23 router0 kernel:        c3a7fe04 c0166dda
c3a7fdc4 00000005 c36af104 c6bd4448 00000042 00000043
Aug 10 22:05:23 router0 kernel: Call Trace:
[search_by_key+6758/8144] [reiserfs_read_inode2+202/224]
[search_by_entry_key+28/640] [reiserfs_find_entry+79/320]
[reiserfs_find_entry+106/320]
Aug 10 22:05:23 router0 kernel:   [reiserfs_lookup+109/224]
[d_alloc+25/416] [real_lookup+88/208]
[link_path_walk+1477/2112] [path_walk+29/48]
[__user_walk+60/96]
Aug 10 22:05:23 router0 kernel:   [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:23 router0 kernel: 5140
Aug 10 22:05:23 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:23 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c0252060 c3a7fd88 c0178846
Aug 10 22:05:23 router0 kernel:        c777a800 c0252b60
c36af2dc c3a7fdac c3a7fdc4 0000002b 0000000e c6bd4000
Aug 10 22:05:23 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000002 00000018 c3a7fd4c c0108d38 c3a80000
Aug 10 22:05:23 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[show_stack+104/128] [reiserfs_read_inode2+89/224]
[get_new_inode+206/368]
Aug 10 22:05:23 router0 kernel:   [iget4+183/208]
[reiserfs_find_actor+0/32] [reiserfs_iget+38/112]
[reiserfs_find_actor+0/32] [reiserfs_lookup+144/224]
[real_lookup+88/208]
Aug 10 22:05:23 desktop kernel: DMA write timed out
Aug 10 22:05:23 router0 kernel:   [link_path_walk+1477/2112]
[path_walk+29/48] [__user_walk+60/96] [sys_stat64+26/112]
[system_call+51/56]
Aug 10 22:05:23 router0 kernel: 5140
Aug 10 22:05:23 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:23 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c7650038 c3a7fd88 c0178846
Aug 10 22:05:23 router0 kernel:        c777a800 c0252b60
c36af2dc c3a7fdac c3a7fdc4 0000002b 0000000e 00000060
Aug 10 22:05:23 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000003 00000018 c7650028 00000001 00000002
Aug 10 22:05:23 router0 kernel: Call Trace:
[search_by_key+6758/8144] [show_trace+230/240]
[reiserfs_read_inode2+89/224] [get_new_inode+206/368]
[iget4+183/208]
Aug 10 22:05:23 router0 kernel:   [reiserfs_find_actor+0/32]
[reiserfs_iget+38/112] [reiserfs_find_actor+0/32]
[reiserfs_lookup+144/224] [real_lookup+88/208]
[link_path_walk+1477/2112]
Aug 10 22:05:23 router0 kernel:        c3a7fd34 c0108ca6
c02360e4 00000004 00000018 c7644838 00000081 00000082
Aug 10 22:05:23 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a7fce0 c024cdc0 c02ef9a0
c0252b60 c3a7fd08 c6bd464c c3a7fd88 c0178846
Aug 10 22:05:23 router0 kernel: 5140
Aug 10 22:05:23 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:23 router0 kernel: 5140
Aug 10 22:05:23 router0 kernel:
[do_generic_file_read+669/1040] [generic_file_read+129/304]
[file_read_actor+0/144] [sys_read+152/256]
[system_call+51/56]
Aug 10 22:05:23 router0 kernel: 5140
Aug 10 22:05:23 router0 kernel:   [sys_ioctl+390/416]
[error_code+52/60]
Aug 10 22:05:23 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a0dae8 c024cdc0 c02ef9a0
c0252b60 c3a0db10 c7650018 c3a0db90 c0178846
Aug 10 22:05:23 router0 kernel:   [sys_ioctl+390/416]
[error_code+52/60]
Aug 10 22:05:23 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a0dae8 c024cdc0 c02ef9a0
c0252b60 c3a0db10 c764d37c c3a0db90 c0178846
Aug 10 22:05:23 router0 kernel:        c777a800 c0252b60
c777a800 c36afa3c c3a0dc88 c57ea000 c57094b4 00000be0
Aug 10 22:05:23 router0 kernel:        c5af6000 00000001
c3a0105c 00000004 00000286 c764d378 00000035 00000036
Aug 10 22:05:23 router0 kernel:   [sys_ioctl+390/416]
[error_code+52/60]
Aug 10 22:05:23 router0 kernel: 5140
Aug 10 22:05:23 router0 kernel: 0: reiserfs_get_block
Aug 10 22:05:23 router0 kernel: PAP-5140: search_by_key:
schedule occurred in do_balance!c3a0dae8 c024cdc0 c02ef9a0
c0252b60 c3a0db10 c73403cc c3a0db90 c0178846
Aug 10 22:05:23 router0 kernel:        c777a800 c0252b60
c777a800 c36afa3c c3a0dc88 c57ea000 c57094b4 00000c58
Aug 10 22:05:23 router0 kernel:        c5af6000 00000001
c3a0105c 00000005 00000286 c73403b8 0000003a 0000003b
Aug 10 22:05:23 router0 kernel:   [sys_ioctl+390/416]
[error_code+52/60]
