From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: assertion failed: keyeq(znode_get_rd_key(node), znode_get_ld_key(node->right))
Date: Mon, 21 Aug 2006 19:22:58 -0400
Message-ID: <200608211922.58975.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


I looked at this one for a bit; I couldn't make any headway. I don't
fully understand what the debugging code for the delimiting keys is
doing.

(2.6.18-rc4-mm1)

reiser4 panicked cowardly: reiser4[ent:hdb1!(2167)]: sibling_list_remove (fs/reiser4/tree_walk.c:814)[zam-32245]:
assertion failed: keyeq(znode_get_rd_key(node), znode_get_ld_key(node->right))
Kernel panic - not syncing: reiser4[ent:hdb1!(2167)]: sibling_list_remove (fs/reiser4/tree_walk.c:814)[zam-32245]:
assertion failed: keyeq(znode_get_rd_key(node), znode_get_ld_key(node->right))

================

(2.6.18-rc4-mm1)

reiser4 panicked cowardly: reiser4[ent:hdb1!(2175)]: sibling_list_remove (fs/reiser4/tree_walk.c:814)[zam-32245]:
assertion failed: keyeq(znode_get_rd_key(node), znode_get_ld_key(node->right))
 [<c0103754>] dump_trace+0x64/0x181
 [<c0103883>] show_trace_log_lvl+0x12/0x25
 [<c0103b79>] show_trace+0xd/0x10
 [<c0103b93>] dump_stack+0x17/0x19
 [<c01a0663>] reiser4_do_panic+0x4e/0x7b
 [<c01ee6bd>] sibling_list_remove+0x85/0x52e
 [<c01ba97d>] forget_znode+0x22b/0x33b
 [<c01b76e0>] longterm_unlock_znode+0x268/0x723
 [<c01da260>] handle_pos_on_formatted+0x35c/0x45f
 [<c01da3fc>] handle_pos_on_leaf+0x4d/0x61
 [<c01d6a84>] squalloc+0x16/0x52
 [<c01d89f7>] jnode_flush+0x80e/0x99d
 [<c01d8fee>] flush_current_atom+0x468/0x722
 [<c01cf073>] flush_some_atom+0x9c3/0xb13
 [<c01f4216>] reiser4_writeout+0x1a6/0x30c
 [<c01f554b>] entd+0x1e2/0x3d5
 [<c0124545>] kthread+0xaf/0xde
 [<c03eb415>] kernel_thread_helper+0x5/0xb
DWARF2 unwinder stuck at kernel_thread_helper+0x5/0xb
Leftover inexact backtrace:
 [<c0103883>] show_trace_log_lvl+0x12/0x25
 [<c0103b79>] show_trace+0xd/0x10
 [<c0103b93>] dump_stack+0x17/0x19
 [<c01a0663>] reiser4_do_panic+0x4e/0x7b
 [<c01ee6bd>] sibling_list_remove+0x85/0x52e
 [<c01ba97d>] forget_znode+0x22b/0x33b
 [<c01b76e0>] longterm_unlock_znode+0x268/0x723
 [<c01da260>] handle_pos_on_formatted+0x35c/0x45f
 [<c01da3fc>] handle_pos_on_leaf+0x4d/0x61
 [<c01d6a84>] squalloc+0x16/0x52
 [<c01d89f7>] jnode_flush+0x80e/0x99d
 [<c01d8fee>] flush_current_atom+0x468/0x722
 [<c01cf073>] flush_some_atom+0x9c3/0xb13
 [<c01f4216>] reiser4_writeout+0x1a6/0x30c
 [<c01f554b>] entd+0x1e2/0x3d5
 [<c0124545>] kthread+0xaf/0xde
 [<c03eb415>] kernel_thread_helper+0x5/0xb
 =======================
: jnode: 0, tree: 1 (r:0,w:1), dk: 1 (r:0,w:1)
jload: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0
inode: 0, cbk_cache: 0 (r:0,w0), eflush: 0, zlock: 1,
spin: 3, long: 1 inode_sem: (r:0,w:0)
d: 1, x: 4, t: -1
Kernel panic - not syncing: reiser4[ent:hdb1!(2175)]: sibling_list_remove (fs/reiser4/tree_walk.c:814)[zam-32245]:
assertion failed: keyeq(znode_get_rd_key(node), znode_get_ld_key(node->right))

Andrew Wade
