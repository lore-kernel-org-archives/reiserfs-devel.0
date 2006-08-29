From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: Re: assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)
Date: Tue, 29 Aug 2006 17:38:21 -0400
Message-ID: <200608291738.21648.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608211844.24443.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Reply-To: andrew.j.wade@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608211844.24443.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I now have a stack trace for this assertion:


reiser4 panicked cowardly: reiser4[tar(5412)]: reiser4_set_page_dirty_internal (fs/reiser4/page_cache.c:475)[]:
assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)
 [<c0103870>] dump_trace+0x64/0x1ad
 [<c01039cb>] show_trace_log_lvl+0x12/0x25
 [<c0103cc1>] show_trace+0xd/0x10
 [<c0103cdb>] dump_stack+0x17/0x19
 [<c01a0caf>] reiser4_do_panic+0x4e/0x84
 [<c01e66e9>] reiser4_set_page_dirty_internal+0xe5/0xee
 [<c01cb2a4>] znode_make_dirty+0x271/0x452
 [<c022108f>] cut_node40+0x191/0x1a6
 [<c0221410>] shift_node40+0x36c/0x91d
 [<c01b11ba>] carry_shift_data+0xaa/0x139
 [<c01b2e1b>] carry_insert_flow+0x1de/0x837
 [<c01b008f>] reiser4_carry+0x185/0x49a
 [<c01b8d77>] reiser4_insert_flow+0x16b/0x17e
 [<c022deec>] reiser4_write_tail+0x5cd/0x685
 [<c020445f>] batch_write_unix_file+0x26e/0x467
 [<c0133347>] generic_file_buffered_write+0xd2/0x1fb
 [<c0135035>] __generic_file_aio_write_nolock+0x3a8/0x3e5
 [<c01350ca>] generic_file_aio_write+0x58/0xab
 [<c014eda6>] do_sync_write+0xb4/0xf2
 [<c014f38e>] vfs_write+0x8a/0x136
 [<c014faca>] sys_write+0x3b/0x60
 [<c01028cd>] sysenter_past_esp+0x56/0x8d
DWARF2 unwinder stuck at sysenter_past_esp+0x56/0x8d

Leftover inexact backtrace:

 [<c01039cb>] show_trace_log_lvl+0x12/0x25
 [<c0103cc1>] show_trace+0xd/0x10
 [<c0103cdb>] dump_stack+0x17/0x19
 [<c01a0caf>] reiser4_do_panic+0x4e/0x84
 [<c01e66e9>] reiser4_set_page_dirty_internal+0xe5/0xee
 [<c01cb2a4>] znode_make_dirty+0x271/0x452
 [<c022108f>] cut_node40+0x191/0x1a6
 [<c0221410>] shift_node40+0x36c/0x91d
 [<c01b11ba>] carry_shift_data+0xaa/0x139
 [<c01b2e1b>] carry_insert_flow+0x1de/0x837
 [<c01b008f>] reiser4_carry+0x185/0x49a
 [<c01b8d77>] reiser4_insert_flow+0x16b/0x17e
 [<c022deec>] reiser4_write_tail+0x5cd/0x685
 [<c020445f>] batch_write_unix_file+0x26e/0x467
 [<c0133347>] generic_file_buffered_write+0xd2/0x1fb
 [<c0135035>] __generic_file_aio_write_nolock+0x3a8/0x3e5
 [<c01350ca>] generic_file_aio_write+0x58/0xab
 [<c014eda6>] do_sync_write+0xb4/0xf2
 [<c014f38e>] vfs_write+0x8a/0x136
 [<c014faca>] sys_write+0x3b/0x60
 [<c01028cd>] sysenter_past_esp+0x56/0x8d
 =======================
: jnode: 0, tree: 0 (r:0,w:0), dk: 0 (r:0,w:0)
jload: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0
inode: 0, cbk_cache: 0 (r:0,w0), eflush: 0, zlock: 0,
spin: 0, long: 3 inode_sem: (r:0,w:1)
d: 3, x: 6, t: 0
Kernel panic - not syncing: reiser4[tar(5412)]: reiser4_set_page_dirty_internal (fs/reiser4/page_cache.c:475)[]:
assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)

Andrew Wade
