From: Michael Barry <jabbera@gmail.com>
Subject: Possible bug: clog length 0
Date: Sun, 24 Oct 2004 23:10:40 -0400
Message-ID: <662c77ee04102420101ae1a40@mail.gmail.com>
Reply-To: Michael Barry <jabbera@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I would like to being by thanking anyone for thier time who can help
me with this.

I am installing php currently. When the installation gets to a certain
step the php process freezes in state D(Disk Sleep). This process
cannot be killed with kill -9. When I checked my log files I saw "clog
length 0" repeated many times. I traced this text to the reiserfs4
code. I then compiled my kernel 2.6.9-mm1 (note: this also occurs with
2.6.8.1-mm4) with reiserfs4 with all debug options.

Note: This possible bug is repoduceable and always freezes at the same point. 

When I recompile php, now I get an oops earlier in the installation
process. The following is my log file output:



clog length 0
reiser4[php(17428)]: object_lookup (fs/reiser4/search.c:397)[nikita-2104]:
code: -503 at fs/reiser4/plugin/file/file.c:803
reiser4 panicked cowardly: assertion failed:
lock_stack_isclean(get_current_lock_stack())
context: trace_flags: 0
pid: 17428, comm: php
        lock stack:
.... nr_signaled 0
.... curpri high
.... current locks:
...... write: c000000000007bb2
...... write: c000000000007bb2
...... write: c000000000007bb3
        atom: refcount: 2 id: 1 flags: 0 txnh_count: 1 capture_count:
10050 stage: 1 start: 4294698070, flushed: 0
------------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:131!
invalid operand: 0000 [#1]
SMP 
Modules linked in: sg sr_mod
CPU:    0
EIP:    0060:[<c018edfc>]    Not tainted VLI
EFLAGS: 00010246   (2.6.9-mm1) 
EIP is at reiser4_do_panic+0x230/0x2d8
eax: c050cb08   ebx: c050cb00   ecx: c050cb00   edx: c050cb00
esi: c996c000   edi: c996d4b4   ebp: c996d42c   esp: c996d26c
ds: 007b   es: 007b   ss: 0068
Process php (pid: 17428, threadinfo=c996c000 task=c9bf2020)
Stack: cec03200 00000001 c03f193b c996d298 c0401527 00000323 c996d2c0 c7cb4188 
       c01dfb79 c03f1926 c0403858 c03f8573 c03baf67 c03f8483 0000018d 00000002 
       c5bc6500 c01b799f c018f142 c01f058e c996d398 00000000 00000000 00000000 
Call Trace:
 [<c01dfb79>] object_lookup+0x1a9/0x451
 [<c01b799f>] coord_is_existing_item+0xd9/0x1e8
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c01f058e>] reiser4_blocknr_is_sane_for+0x27/0xf8
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c0222cc7>] num_of_items_node40+0x24/0x1b5
 [<c023a2f3>] estimate_cde+0x8c/0x192
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c01b799f>] coord_is_existing_item+0xd9/0x1e8
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c01e549e>] xmemcpy+0x21/0x25
 [<c018f805>] return_err+0x1c/0xa0
 [<c0223a18>] key_at_node40+0x5d/0x141
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c01e54ea>] xmemset+0x22/0x26
 [<c028293e>] hint_validate+0x53/0x181
 [<c01e54ea>] xmemset+0x22/0x26
 [<c0281278>] find_file_item+0x312/0x440
 [<c028485b>] readpage_unix_file+0x19e/0xc02
 [<c0222cc7>] num_of_items_node40+0x24/0x1b5
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c01ffb74>] reiser4_readpage+0xdf/0x2cd
 [<c0222cc7>] num_of_items_node40+0x24/0x1b5
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c013d191>] page_cache_read+0xa1/0xd5
 [<c013d4f4>] filemap_nopage+0x32f/0x3a6
 [<c0286ac3>] unix_file_filemap_nopage+0x56/0xd8
 [<c0286a6d>] unix_file_filemap_nopage+0x0/0xd8
 [<c014b5d7>] do_no_page+0xba/0x30f
 [<c02a00e8>] vsprintf+0x27/0x2b
 [<c014ba28>] handle_mm_fault+0xf4/0x16c
 [<c01174c1>] do_page_fault+0x1c4/0x60a
 [<c01c31ee>] try_capture_block+0x253/0x719
 [<c013bf48>] add_to_page_cache+0xbe/0xc3
 [<c01aa29e>] check_lock_object+0x17/0x186
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c01aa1f3>] znode_is_any_locked+0x7c/0x87
 [<c0222cc7>] num_of_items_node40+0x24/0x1b5
 [<c018efe1>] schedulable+0x8/0x79
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c018efe1>] schedulable+0x8/0x79
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c01b799f>] coord_is_existing_item+0xd9/0x1e8
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c0222cc7>] num_of_items_node40+0x24/0x1b5
 [<c0222cc7>] num_of_items_node40+0x24/0x1b5
 [<c0223351>] length_by_coord_node40+0x52/0x2c7
 [<c01b799f>] coord_is_existing_item+0xd9/0x1e8
 [<c01172fd>] do_page_fault+0x0/0x60a
 [<c0105a09>] error_code+0x2d/0x38
 [<c018007b>] load_aout_binary+0x456/0x711
 [<c02a0dda>] __copy_user_zeroing_intel+0x16/0xac
 [<c02a0f44>] __copy_from_user_ll+0x68/0x6c
 [<c0241b7a>] paste_tail+0x159/0x40f
 [<c0241a21>] paste_tail+0x0/0x40f
 [<c0228769>] create_item_node40+0x867/0xa1b
 [<c01a66c0>] carry_insert_flow+0x225/0x363
 [<c019f9ac>] carry_on_level+0x98/0x487
 [<c01a0c5e>] lock_carry_level+0x66/0x153
 [<c0140372>] perthread_pages_reserve+0x64/0x133
 [<c019f660>] carry+0x1dc/0x490
 [<c01af6cf>] insert_flow+0x115/0x1e4
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c0222cc7>] num_of_items_node40+0x24/0x1b5
 [<c0162ed0>] inode_add_bytes+0x28/0x74
 [<c0243caa>] write_tail+0x1a8/0x232
 [<c02852ff>] should_have_notail+0x40/0x4a
 [<c0243b02>] write_tail+0x0/0x232
 [<c0243b02>] write_tail+0x0/0x232
 [<c0286517>] append_and_or_overwrite+0x516/0x94c
 [<c01baa49>] check_block_counters+0x6d/0x19a
 [<c0287b61>] flow_by_inode_unix_file+0x62/0x165
 [<c0286a05>] write_flow+0xb8/0x107
 [<c01bd3e6>] grabbed2free+0x67/0xdc
 [<c0286d2e>] write_file+0x7a/0xe5
 [<c028700a>] write_unix_file+0x271/0x3c0
 [<c018f142>] get_current_trace_flags+0xc/0xe4
 [<c01ff17c>] reiser4_write+0x191/0x44b
 [<c01fefeb>] reiser4_write+0x0/0x44b
 [<c015959b>] vfs_write+0xb0/0x119
 [<c01596d5>] sys_write+0x51/0x80
 [<c0104f7f>] syscall_call+0x7/0xb
Code: 44 ff ff ff 8b 11 85 d2 0f 84 3a ff ff ff 8b 00 39 c8 0f 85 30
ff ff ff 39 42 04 0f 85 27 ff ff ff b8 08 cb 50 c0 e8 cc 93 21
00 <0f> 0b 83 00 3c 19 3f c0 c7 04 24 5c af 41 c0 c7 44 24 04 a0 c6 


Michael
