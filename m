From: Johannes Hirte <hirtejs@idmt.fraunhofer.de>
Subject: Re: Reiser4: Running out of room still causes corruption
Date: Tue, 17 Oct 2006 14:42:50 +0200
Message-ID: <200610171442.51395.hirtejs@idmt.fraunhofer.de>
References: <452B343E.1020402@nusconsulting.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <452B343E.1020402@nusconsulting.com.au>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Dienstag, 10. Oktober 2006 07:48 schrieb Daniel Kasak:
> Hi all.
>
> I'd had more problems with filesystem corruption after running out of
> space.

I was able to reproduce this error and log the oops:

Oct 16 01:00:01 Theben cron[22195]: (root) CMD 
(rm -f /var/spool/cron/lastrun/cron.hourly)
Oct 16 01:03:08 Theben reiser4[kio_file(10493)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:714)[nikita-2282]:
Oct 16 01:03:08 Theben WARNING: Partial conversion of 65795: 3 of 4: -28
Oct 16 01:03:08 Theben reiser4[kio_file(10493)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2268)[nikita-3233]:
Oct 16 01:03:08 Theben WARNING: Failed (-28) to convert in release_unix_file 
(65795)
Oct 16 01:04:23 Theben Unable to handle kernel NULL pointer dereference at 
0000000000000048 RIP:
Oct 16 01:04:23 Theben [<ffffffff8022e638>] 
truncate_inode_pages_range+0x18/0x2d0
Oct 16 01:04:23 Theben PGD 3f5c1067 PUD 349e5067 PMD 0
Oct 16 01:04:23 Theben Oops: 0000 [1] PREEMPT
Oct 16 01:04:23 Theben CPU 0
Oct 16 01:04:23 Theben Modules linked in: usblp nvidia sym53c8xx ehci_hcd 
ohci_hcd uhci_hcd
Oct 16 01:04:23 Theben Pid: 24786, comm: konqueror Tainted: P      
2.6.18-reiser4 #1
Oct 16 01:04:23 Theben RIP: 0010:[<ffffffff8022e638>]  [<ffffffff8022e638>] 
truncate_inode_pages_range+0x18/0x2d0
Oct 16 01:04:23 Theben RSP: 0000:ffff8100328f7348  EFLAGS: 00010296
Oct 16 01:04:23 Theben RAX: 0000000000000000 RBX: ffff810001585548 RCX: 
0000000000000001
Oct 16 01:04:23 Theben RDX: 0000000000003fff RSI: 0000000000003000 RDI: 
0000000000000000
Oct 16 01:04:23 Theben RBP: ffff81000d2b7440 R08: 0000000000000000 R09: 
ffff81002c41ab38
Oct 16 01:04:23 Theben R10: 0000000000000040 R11: 0000000000000040 R12: 
0000000000000003
Oct 16 01:04:23 Theben R13: 0000000000000001 R14: 0000000000000000 R15: 
0000000000000000
Oct 16 01:04:23 Theben FS:  00002b530b62f260(0000) GS:ffffffff807ca000(0000) 
knlGS:00000000f65f8ba0
Oct 16 01:04:23 Theben CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
Oct 16 01:04:23 Theben CR2: 0000000000000048 CR3: 000000002e6d5000 CR4: 
00000000000006e0
Oct 16 01:04:23 Theben Process konqueror (pid: 24786, threadinfo 
ffff8100328f6000, task ffff8100224387e0)
Oct 16 01:04:23 Theben Stack:  0000000000003000 0000000000000003 
0000000000000000 0000000000000000
Oct 16 01:04:23 Theben 00000001000060d2 0000000000000046 0000000000000000 
0000000000000046
Oct 16 01:04:23 Theben ffff81003dcb9090 0000000000000292 ffff81003dcb9090 
0000000000011210
Oct 16 01:04:23 Theben Call Trace:
Oct 16 01:04:23 Theben [<ffffffff803263e8>] 
reiser4_invalidate_pages+0x198/0x240
Oct 16 01:04:23 Theben [<ffffffff8034f0c1>] item_body_by_coord_hard+0x11/0x20
Oct 16 01:04:23 Theben [<ffffffff80349ede>] extent_size+0x1e/0x60
Oct 16 01:04:23 Theben [<ffffffff80349f94>] max_unit_key_extent+0x34/0x60
Oct 16 01:04:23 Theben [<ffffffff8034f096>] max_item_key_by_coord+0x36/0x50
Oct 16 01:04:23 Theben [<ffffffff8034a378>] kill_hook_extent+0x368/0x490
Oct 16 01:04:23 Theben [<ffffffff8032abe6>] reiser4_get_neighbor+0xa6/0x4b0
Oct 16 01:04:23 Theben [<ffffffff8034a010>] kill_hook_extent+0x0/0x490
Oct 16 01:04:23 Theben [<ffffffff8033e7e2>] call_kill_hooks+0x82/0xa0
Oct 16 01:04:23 Theben [<ffffffff8034f096>] max_item_key_by_coord+0x36/0x50
Oct 16 01:04:23 Theben [<ffffffff8033f173>] prepare_for_compact+0x4a3/0x7e0
Oct 16 01:04:23 Theben [<ffffffff8033e690>] kill_units+0x0/0xa0
Oct 16 01:04:23 Theben [<ffffffff80341060>] kill_tail+0x0/0x50
Oct 16 01:04:23 Theben [<ffffffff8033e730>] kill_head+0x0/0x30
Oct 16 01:04:23 Theben [<ffffffff803156fd>] move_lh_internal+0x13d/0x1a0
Oct 16 01:04:23 Theben [<ffffffff80310470>] jload_gfp+0x1c0/0x1f0
Oct 16 01:04:23 Theben [<ffffffff8031245c>] lock_carry_node+0x2cc/0x330
Oct 16 01:04:23 Theben [<ffffffff80323f4f>] handle_eottl+0x5f/0x790
Oct 16 01:04:23 Theben [<ffffffff8033f5cc>] kill_node40+0x3c/0xe0
Oct 16 01:04:23 Theben [<ffffffff803134cd>] carry_cut+0x4d/0x60
Oct 16 01:04:23 Theben [<ffffffff80312eea>] carry+0xda/0x2b0
Oct 16 01:04:23 Theben [<ffffffff80312594>] post_carry+0x54/0xd0
Oct 16 01:04:23 Theben [<ffffffff80317b7f>] kill_node_content+0x72f/0x7d0
Oct 16 01:04:23 Theben [<ffffffff80315e8e>] longterm_lock_znode+0x3de/0x510
Oct 16 01:04:23 Theben [<ffffffff80325dec>] coord_by_handle+0x36c/0x3a0
Oct 16 01:04:23 Theben [<ffffffff80341660>] lookup_node40+0x320/0x450
Oct 16 01:04:23 Theben [<ffffffff80310470>] jload_gfp+0x1c0/0x1f0
Oct 16 01:04:23 Theben [<ffffffff803185af>] cut_tree_worker_common+0x27f/0x370
Oct 16 01:04:23 Theben [<ffffffff8032f0f3>] plugin_by_unsafe_id+0x23/0x100
Oct 16 01:04:23 Theben [<ffffffff80318330>] cut_tree_worker_common+0x0/0x370
Oct 16 01:04:23 Theben [<ffffffff803164c9>] cut_tree_object+0x129/0x220
Oct 16 01:04:23 Theben [<ffffffff8031c01e>] znode_make_dirty+0x7e/0xc0
Oct 16 01:04:23 Theben [<ffffffff8031a305>] reiser4_grab_space+0x45/0xa0
Oct 16 01:04:23 Theben [<ffffffff8031a5ea>] reiser4_grab_reserved+0xaa/0x170
Oct 16 01:04:23 Theben [<ffffffff803340fe>] cut_file_items+0x12e/0x1d0
Oct 16 01:04:23 Theben [<ffffffff80335020>] update_file_size+0x0/0x90
Oct 16 01:04:23 Theben [<ffffffff80313087>] carry+0x277/0x2b0
Oct 16 01:04:23 Theben [<ffffffff803346b5>] truncate_file_body+0x1b5/0x3b0
Oct 16 01:04:23 Theben [<ffffffff8020fb66>] __alloc_pages+0x76/0x2d0
Oct 16 01:04:23 Theben [<ffffffff80266445>] cache_alloc_refill+0x1c5/0x560
Oct 16 01:04:23 Theben [<ffffffff80231436>] __wake_up+0x56/0xa0
Oct 16 01:04:23 Theben [<ffffffff8021f99f>] 
inotify_dev_queue_event+0x13f/0x170
Oct 16 01:04:23 Theben [<ffffffff8020d9be>] 
inotify_inode_queue_event+0xce/0x140
Oct 16 01:04:23 Theben [<ffffffff8026bf45>] __down_write_nested+0x35/0xf0
Oct 16 01:04:23 Theben [<ffffffff8030e939>] preempt_point+0x9/0x30
Oct 16 01:04:23 Theben [<ffffffff80334f75>] delete_object_unix_file+0x45/0xf0
Oct 16 01:04:23 Theben [<ffffffff803189db>] init_context+0x7b/0x90
Oct 16 01:04:23 Theben [<ffffffff8032889f>] reiser4_delete_inode+0x9f/0xd0
Oct 16 01:04:23 Theben [<ffffffff80328800>] reiser4_delete_inode+0x0/0xd0
Oct 16 01:04:23 Theben [<ffffffff802329e6>] generic_delete_inode+0x96/0x130
Oct 16 01:04:23 Theben [<ffffffff80241232>] do_unlinkat+0x102/0x1c0
Oct 16 01:04:23 Theben [<ffffffff80217be1>] vfs_write+0x131/0x180
Oct 16 01:04:23 Theben [<ffffffff802184a3>] sys_write+0x53/0x90
Oct 16 01:04:23 Theben [<ffffffff8026723e>] system_call+0x7e/0x83
Oct 16 01:04:23 Theben
Oct 16 01:04:23 Theben
Oct 16 01:04:23 Theben Code: 48 83 7f 48 00 0f 84 96 02 00 00 48 89 d0 25 ff 
0f 00 00 48
Oct 16 01:04:23 Theben RIP  [<ffffffff8022e638>] 
truncate_inode_pages_range+0x18/0x2d0
Oct 16 01:04:23 Theben RSP <ffff8100328f7348>
Oct 16 01:04:23 Theben CR2: 0000000000000048
Oct 16 01:05:44 Theben su(pam_unix)[31072]: session closed for user root
Oct 16 01:05:44 Theben su(pam_unix)[15209]: session closed for user root
Oct 16 01:05:48 Theben <6>amarokapp[30214] trap stack segment rip:2af09564afa4 
rsp:7fff16cbcf40 error:0
Oct 16 01:06:05 Theben kde(pam_unix)[30044]: session closed for user puck
Oct 16 01:06:14 Theben shutdown[22509]: shutting down for system reboot

After the oops any operation on the reiser4 partition hang, so I had to reset 
the machine (MagicSysRq).
