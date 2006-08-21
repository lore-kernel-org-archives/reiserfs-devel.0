From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: assertion failed: can_hit_entd(ctx, s)
Date: Mon, 21 Aug 2006 18:41:10 -0400
Message-ID: <200608211841.12071.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29641-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

This is the most common panic I've been getting. It looks like this:
(2.6.18-rc4-mm1)

reiser4 panicked cowardly: reiser4[scatteredwrites(4506)]: reiser4_writepage (fs/reiser4/page_cache.c:522)[]:
assertion failed: can_hit_entd(ctx, s)
Kernel panic - not syncing: reiser4[scatteredwrites(4506)]: reiser4_writepage (fs/reiser4/page_cache.c:522)[]:
assertion failed: can_hit_entd(ctx, s)

With the extra patches it looks like this:
(2.6.18-rc4-mm2)

reiser4 panicked cowardly: reiser4[grep(4918)]: can_hit_entd (fs/reiser4/page_cache.c:494)[ajw-3]:
assertion failed: ctx->trans->atom == NULL
 [<c0103870>] dump_trace+0x64/0x1ad
 [<c01039cb>] show_trace_log_lvl+0x12/0x25
 [<c0103cc1>] show_trace+0xd/0x10
 [<c0103cdb>] dump_stack+0x17/0x19
 [<c01a0ccf>] reiser4_do_panic+0x4e/0x7b
 [<c01e67b1>] reiser4_writepage+0xab/0x1a8
 [<c013b973>] shrink_inactive_list+0x37d/0x6f0
 [<c013bd94>] shrink_zone+0xae/0xcc
 [<c013c265>] try_to_free_pages+0x139/0x20d
 [<c0136f12>] __alloc_pages+0x189/0x27d
 [<c014c2ce>] cache_alloc_refill+0x2d2/0x5a0
 [<c014bfc7>] kmem_cache_alloc+0x70/0xa5
 [<c01eb68c>] reiser4_alloc_inode+0x51/0xfa
 [<c0163adc>] alloc_inode+0x14/0x122
 [<c0164ad5>] iget5_locked+0x3f/0x132
 [<c01f4091>] reiser4_iget+0x8b/0x361
 [<c01fadd8>] reiser4_lookup_common+0xef/0x151
 [<c015aef7>] do_lookup+0xa0/0x13d
 [<c015b72f>] __link_path_walk+0x79b/0xbd4
 [<c015bbb6>] link_path_walk+0x4e/0xc6
 [<c015c0e3>] do_path_lookup+0x203/0x21d
 [<c015c544>] __path_lookup_intent_open+0x44/0x76
 [<c015c5d2>] path_lookup_open+0x10/0x12
 [<c015c7c7>] open_namei+0x61/0x570
 [<c014e72d>] do_filp_open+0x1f/0x35
 [<c014e83e>] do_sys_open+0x3f/0xba
 [<c014e8e5>] sys_open+0x16/0x18
 [<c01028cd>] sysenter_past_esp+0x56/0x8d
DWARF2 unwinder stuck at sysenter_past_esp+0x56/0x8d

Leftover inexact backtrace:

 [<c01039cb>] show_trace_log_lvl+0x12/0x25
 [<c0103cc1>] show_trace+0xd/0x10
 [<c0103cdb>] dump_stack+0x17/0x19
 [<c01a0ccf>] reiser4_do_panic+0x4e/0x7b
 [<c01e67b1>] reiser4_writepage+0xab/0x1a8
 [<c013b973>] shrink_inactive_list+0x37d/0x6f0
 [<c013bd94>] shrink_zone+0xae/0xcc
 [<c013c265>] try_to_free_pages+0x139/0x20d
 [<c0136f12>] __alloc_pages+0x189/0x27d
 [<c014c2ce>] cache_alloc_refill+0x2d2/0x5a0
 [<c014bfc7>] kmem_cache_alloc+0x70/0xa5
 [<c01eb68c>] reiser4_alloc_inode+0x51/0xfa
 [<c0163adc>] alloc_inode+0x14/0x122
 [<c0164ad5>] iget5_locked+0x3f/0x132
 [<c01f4091>] reiser4_iget+0x8b/0x361
 [<c01fadd8>] reiser4_lookup_common+0xef/0x151
 [<c015aef7>] do_lookup+0xa0/0x13d
 [<c015b72f>] __link_path_walk+0x79b/0xbd4
 [<c015bbb6>] link_path_walk+0x4e/0xc6
 [<c015c0e3>] do_path_lookup+0x203/0x21d
 [<c015c544>] __path_lookup_intent_open+0x44/0x76
 [<c015c5d2>] path_lookup_open+0x10/0x12
 [<c015c7c7>] open_namei+0x61/0x570
 [<c014e72d>] do_filp_open+0x1f/0x35
 [<c014e83e>] do_sys_open+0x3f/0xba
 [<c014e8e5>] sys_open+0x16/0x18
 [<c01028cd>] sysenter_past_esp+0x56/0x8d
 =======================
: jnode: 0, tree: 0 (r:0,w:0), dk: 0 (r:0,w:0)
jload: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0
inode: 0, cbk_cache: 0 (r:0,w0), eflush: 0, zlock: 0,
spin: 0, long: 0 inode_sem: (r:0,w:0)
d: 0, x: 0, t: 0
Kernel panic - not syncing: reiser4[grep(4918)]: can_hit_entd (fs/reiser4/page_cache.c:494)[ajw-3]:
assertion failed: ctx->trans->atom == NULL

================


reiser4 panicked cowardly: reiser4[scatteredwrites(4245)]: can_hit_entd (fs/reiser4/page_cache.c:494)[ajw-3]:
assertion failed: ctx->trans->atom == NULL
 [<c0103870>] dump_trace+0x64/0x1ad
 [<c01039cb>] show_trace_log_lvl+0x12/0x25
 [<c0103cc1>] show_trace+0xd/0x10
 [<c0103cdb>] dump_stack+0x17/0x19
 [<c01a0ccf>] reiser4_do_panic+0x4e/0x7b
 [<c01e67b1>] reiser4_writepage+0xab/0x1a8
 [<c013b973>] shrink_inactive_list+0x37d/0x6f0
 [<c013bd94>] shrink_zone+0xae/0xcc
 [<c013c265>] try_to_free_pages+0x139/0x20d
 [<c0136f12>] __alloc_pages+0x189/0x27d
 [<c01388a7>] __do_page_cache_readahead+0xcc/0x1d2
 [<c0138f07>] blockable_page_cache_readahead+0x51/0xd9
 [<c0139010>] make_ahead_window+0x81/0xa4
 [<c013918a>] page_cache_readahead+0x157/0x176
 [<c023aa82>] reiser4_read_extent+0x374/0x6ab
 [<c020511f>] read_unix_file+0x5c7/0x762
 [<c014f1e2>] vfs_read+0x88/0x134
 [<c014fa4e>] sys_read+0x3b/0x60
 [<c01028cd>] sysenter_past_esp+0x56/0x8d
DWARF2 unwinder stuck at sysenter_past_esp+0x56/0x8d

Leftover inexact backtrace:

 [<c01039cb>] show_trace_log_lvl+0x12/0x25
 [<c0103cc1>] show_trace+0xd/0x10
 [<c0103cdb>] dump_stack+0x17/0x19
 [<c01a0ccf>] reiser4_do_panic+0x4e/0x7b
 [<c01e67b1>] reiser4_writepage+0xab/0x1a8
 [<c013b973>] shrink_inactive_list+0x37d/0x6f0
 [<c013bd94>] shrink_zone+0xae/0xcc
 [<c013c265>] try_to_free_pages+0x139/0x20d
 [<c0136f12>] __alloc_pages+0x189/0x27d
 [<c01388a7>] __do_page_cache_readahead+0xcc/0x1d2
 [<c0138f07>] blockable_page_cache_readahead+0x51/0xd9
 [<c0139010>] make_ahead_window+0x81/0xa4
 [<c013918a>] page_cache_readahead+0x157/0x176
 [<c023aa82>] reiser4_read_extent+0x374/0x6ab
 [<c020511f>] read_unix_file+0x5c7/0x762
 [<c014f1e2>] vfs_read+0x88/0x134
 [<c014fa4e>] sys_read+0x3b/0x60
 [<c01028cd>] sysenter_past_esp+0x56/0x8d
 =======================
: jnode: 0, tree: 0 (r:0,w:0), dk: 0 (r:0,w:0)
jload: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0
inode: 0, cbk_cache: 0 (r:0,w0), eflush: 0, zlock: 0,
spin: 0, long: 0 inode_sem: (r:1,w:0)
d: 1, x: 1, t: 0
Kernel panic - not syncing: reiser4[scatteredwrites(4245)]: can_hit_entd (fs/reiser4/page_cache.c:494)[ajw-3]:
assertion failed: ctx->trans->atom == NULL

Andrew Wade

