From: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <daniel-gl@gmx.net>
Subject: reiserfs hanging with 3.2.19
Date: Mon, 25 Jun 2012 03:01:04 +0200
Message-ID: <20120625010104.GA462@minime.bse>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

As there are currently so many reports of reiserfs hanging, I have
one to add myself.

I have updated from 2.6.38.5 to 3.2.19 two weeks ago and have never
observed something like this in the past two years on this computer.

I think it started with Firefox hanging:
firefox         S 0000000000000002     0 18983    340 0x00000000
 ffff88007469d8d0 0000000000000082 0000000000000246 ffff8800745e0cd0
 0000000000010640 ffff88007180dfd8 0000000000004000 ffff88007180c000
 ffff88007180dfd8 0000000000010640 ffff88007469d8d0 0000000000010640
Call Trace:
 [<ffffffff810f20f1>] ? __find_get_block+0x71/0x1d0
 [<ffffffff810549d1>] ? bit_waitqueue+0x11/0xb0
 [<ffffffff81054ab9>] ? wake_up_bit+0x19/0x40
 [<ffffffffa00e997b>] ? search_by_key+0xe2b/0xed0 [reiserfs]
 [<ffffffff81033249>] ? load_balance+0xa9/0x7f0
 [<ffffffff81326eed>] ? schedule_hrtimeout_range_clock+0x12d/0x150
 [<ffffffff81034863>] ? try_to_wake_up+0xc3/0x260
 [<ffffffff8102aed0>] ? __wake_up_common+0x50/0x80
 [<ffffffffa00e9a63>] ? search_for_position_by_key+0x43/0x270 [reiserfs]
 [<ffffffff810da540>] ? poll_freewait+0xb0/0xb0
 [<ffffffff810ddfbf>] ? dput+0x1f/0x190
 [<ffffffffa00f4ba0>] ? open_xa_dir+0xa0/0x230 [reiserfs]
 [<ffffffffa00eb0b4>] ? reiserfs_do_truncate+0xe4/0x530 [reiserfs]
 [<ffffffffa00f617e>] ? reiserfs_write_lock+0x2e/0x50 [reiserfs]
 [<ffffffffa00f5158>] ? reiserfs_for_each_xattr+0x2e8/0x2f0 [reiserfs]
 [<ffffffffa00eb528>] ? reiserfs_delete_object+0x28/0x80 [reiserfs]
 [<ffffffffa00d713b>] ? reiserfs_evict_inode+0xeb/0x120 [reiserfs]
 [<ffffffff811873db>] ? _atomic_dec_and_lock+0x4b/0x70
 [<ffffffff810e0c59>] ? evict+0x99/0x180
 [<ffffffff810dd930>] ? d_kill+0xf0/0x130
 [<ffffffff810de06a>] ? dput+0xca/0x190
 [<ffffffff810d30cd>] ? path_put+0xd/0x20
 [<ffffffff810feda9>] ? fsnotify_put_event+0x59/0x60
 [<ffffffff8110129a>] ? inotify_read+0x29a/0x2f0
 [<ffffffff81054ae0>] ? wake_up_bit+0x40/0x40
 [<ffffffff810d9856>] ? do_vfs_ioctl+0x96/0x4e0
 [<ffffffff810c92c3>] ? vfs_read+0xc3/0x160
 [<ffffffff810c93af>] ? sys_read+0x4f/0x90
 [<ffffffff81327faf>] ? page_fault+0x1f/0x30
 [<ffffffff813283bb>] ? system_call_fastpath+0x16/0x1b

Actually this is the second time firefox hung, but I killed it the
first time and successfully wrote some files to the partition afterwards.
This process is not listed with SysRq-w. Only the ls that made me
suspicious and sync_supers:

SysRq : Show Blocked State
  task                        PC stack   pid father
sync_supers     D 0000000000000000     0    18      2 0x00000000
 ffff880075501290 0000000000000046 0000000000000000 ffffffff81435020
 0000000000010640 ffff880075545fd8 0000000000004000 ffff880075544000
 ffff880075545fd8 0000000000010640 ffff880075501290 0000000000010640
Call Trace:
 [<ffffffff81033249>] ? load_balance+0xa9/0x7f0
 [<ffffffff81054b10>] ? autoremove_wake_function+0x30/0x30
 [<ffffffff8109beaa>] ? account_page_dirtied+0x7a/0xc0
 [<ffffffffa00ec972>] ? queue_log_writer+0x92/0xe0 [reiserfs]
 [<ffffffff81034a00>] ? try_to_wake_up+0x260/0x260
 [<ffffffffa00f1441>] ? do_journal_end.clone.31+0x1b1/0xea0 [reiserfs]
 [<ffffffff810a8a80>] ? bdi_sched_wait+0x20/0x20
 [<ffffffffa00e0120>] ? reiserfs_sync_fs+0x60/0x70 [reiserfs]
 [<ffffffff810cc0ca>] ? sync_supers+0xda/0xe0
 [<ffffffff810a8ac5>] ? bdi_sync_supers+0x45/0x60
 [<ffffffff810a8a80>] ? bdi_sched_wait+0x20/0x20
 [<ffffffff81054666>] ? kthread+0x96/0xa0
 [<ffffffff81329574>] ? kernel_thread_helper+0x4/0x10
 [<ffffffff810545d0>] ? kthread_worker_fn+0x180/0x180
 [<ffffffff81329570>] ? gs_change+0xb/0xb
ls              D 0000000000000000     0 19436  18303 0x00000004
 ffff88007458f810 0000000000000082 000280da00000000 ffffffff81435020
 0000000000010640 ffff88007431dfd8 0000000000004000 ffff88007431c000
 ffff88007431dfd8 0000000000010640 ffff88007458f810 0000000000010640
Call Trace:
 [<ffffffff81327faf>] ? page_fault+0x1f/0x30
 [<ffffffff81190cd6>] ? copy_user_generic_unrolled+0x86/0xb0
 [<ffffffffa00ec972>] ? queue_log_writer+0x92/0xe0 [reiserfs]
 [<ffffffff81034a00>] ? try_to_wake_up+0x260/0x260
 [<ffffffffa00f2357>] ? do_journal_begin_r+0x227/0x350 [reiserfs]
 [<ffffffffa00f2510>] ? journal_begin+0x90/0x170 [reiserfs]
 [<ffffffffa00e018a>] ? reiserfs_dirty_inode+0x3a/0xb0 [reiserfs]
 [<ffffffff81023db9>] ? do_page_fault+0x199/0x420
 [<ffffffff810ebb47>] ? __mark_inode_dirty+0x37/0x220
 [<ffffffff810e028d>] ? touch_atime+0x11d/0x170
 [<ffffffff810da03f>] ? vfs_readdir+0xbf/0xd0
 [<ffffffff810da132>] ? sys_getdents+0x82/0xf0
 [<ffffffff813283bb>] ? system_call_fastpath+0x16/0x1b

When I managed to make four more processes hang, I did a lazy umount
and restarted the system.

  Daniel
