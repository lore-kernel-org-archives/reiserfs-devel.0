From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Tue, 15 Feb 2011 09:45:44 GMT
Message-ID: <201102150945.p1F9jiWP020974@demeter2.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162





--- Comment #5 from roucaries.bastien+kernel@gmail.com  2011-02-15 09:45:44 ---
I get also this

[20404.979618] =================================
[20404.979659] [ INFO: inconsistent lock state ]
[20404.979683] 2.6.36reiser #6
[20404.979698] ---------------------------------
[20404.979722] inconsistent {IN-RECLAIM_FS-R} -> {RECLAIM_FS-ON-W} usage.
[20404.979759] khubd/268 [HC0[0]:SC0[0]:HE1:SE1] takes:
[20404.979789]  (iprune_sem){+++++-}, at: [<ffffffff811175b9>]
invalidate_inodes+0x39/0x142
[20404.979849] {IN-RECLAIM_FS-R} state was registered at:
[20404.979880]   [<ffffffff81076053>] __lock_acquire+0x385/0xd1a
[20404.979921]   [<ffffffff81076abf>] lock_acquire+0xd7/0x104
[20404.979957]   [<ffffffff8134b9de>] down_read+0x47/0x5c
[20404.979993]   [<ffffffff8111794e>] shrink_icache_memory+0x48/0x224
[20404.980025]   [<ffffffff810d0256>] shrink_slab+0xdb/0x15f
[20404.980025]   [<ffffffff810d1a21>] balance_pgdat+0x2ff/0x525
[20404.980025]   [<ffffffff810d1f24>] kswapd+0x2dd/0x31a
[20404.980025]   [<ffffffff810642ae>] kthread+0x8c/0x94
[20404.980025]   [<ffffffff8100a964>] kernel_thread_helper+0x4/0x10
[20404.980025] irq event stamp: 18699
[20404.980025] hardirqs last  enabled at (18699): [<ffffffff810a1d98>]
__call_rcu+0x136/0x149
[20404.980025] hardirqs last disabled at (18698): [<ffffffff810a1c97>]
__call_rcu+0x35/0x149
[20404.980025] softirqs last  enabled at (17986): [<ffffffff81121369>]
bdi_queue_work+0xcb/0xd4
[20404.980025] softirqs last disabled at (17982): [<ffffffff8134c655>]
_raw_spin_lock_bh+0x11/0x40
[20404.980025]
[20404.980025] other info that might help us debug this:
[20404.980025] 8 locks held by khubd/268:
[20404.980025]  #0:  (&__lockdep_no_validate__){+.+.+.}, at:
[<ffffffffa014d759>] hub_thread+0x11f/0xe77 [usbcore]
[20404.980025]  #1:  (&__lockdep_no_validate__){+.+.+.}, at:
[<ffffffffa014c702>] usb_disconnect+0x58/0x11e [usbcore]
[20404.980025]  #2:  (&__lockdep_no_validate__){+.+.+.}, at:
[<ffffffff812580bc>] device_release_driver+0x18/0x2d
[20404.980025]  #3:  (&shost->scan_mutex){+.+.+.}, at: [<ffffffffa0026059>]
scsi_remove_host+0x21/0x110 [scsi_mod]
[20404.980025]  #4:  (&__lockdep_no_validate__){+.+.+.}, at:
[<ffffffff812580bc>] device_release_driver+0x18/0x2d
[20404.980025]  #5:  (&type->s_umount_key#38){.+.+.+}, at: [<ffffffff81105900>]
get_super+0x67/0xb7
[20404.980025]  #6:  (iprune_sem){+++++-}, at: [<ffffffff811175b9>]
invalidate_inodes+0x39/0x142
[20404.980025]  #7:  (&fsnotify_mark_srcu){.+.+.+}, at: [<ffffffff8113060a>]
fsnotify+0x79/0x449
[20404.980025]
[20404.980025] stack backtrace:
[20404.980025] Pid: 268, comm: khubd Not tainted 2.6.36reiser #6
[20404.980025] Call Trace:
[20404.980025]  [<ffffffff81074afa>] valid_state+0x17f/0x192
[20404.980025]  [<ffffffff8107546e>] ? check_usage_backwards+0x0/0x81
[20404.980025]  [<ffffffff81074c66>] mark_lock+0x159/0x235
[20404.980025]  [<ffffffff81130c99>] ? fsnotify_create_event+0x39/0x162
[20404.980025]  [<ffffffff81074d94>] mark_held_locks+0x52/0x70
[20404.980025]  [<ffffffff81074e4b>] lockdep_trace_alloc+0x99/0xbb
[20404.980025]  [<ffffffff810fb7d0>] kmem_cache_alloc+0x2d/0x141
[20404.980025]  [<ffffffff81130c99>] fsnotify_create_event+0x39/0x162
[20404.980025]  [<ffffffff81130553>] send_to_group+0x10f/0x14d
[20404.980025]  [<ffffffff81130859>] fsnotify+0x2c8/0x449
[20404.980025]  [<ffffffff811315ac>] fsnotify_unmount_inodes+0xb8/0xf9
[20404.980025]  [<ffffffff811175cd>] invalidate_inodes+0x4d/0x142
[20404.980025]  [<ffffffff8112b98f>] __invalidate_device+0x30/0x4e
[20404.980025]  [<ffffffff811a731b>] invalidate_partition+0x28/0x3d
[20404.980025]  [<ffffffff811565e7>] del_gendisk+0x36/0xf1
[20404.980025]  [<ffffffff81255760>] ? device_del+0x19e/0x1a6
[20404.980025]  [<ffffffffa00f1f45>] sd_remove+0x61/0x9f [sd_mod]
[20404.980025]  [<ffffffff81257f9a>] __device_release_driver+0x76/0xcc
[20404.991845]  [<ffffffff812580c4>] device_release_driver+0x20/0x2d
[20404.991845]  [<ffffffff812573cc>] bus_remove_device+0xb1/0xc6
[20404.993852]  [<ffffffff812556fc>] device_del+0x13a/0x1a6
[20404.993852]  [<ffffffffa002f830>] __scsi_remove_device+0x4d/0x98 [scsi_mod]
[20404.993852]  [<ffffffffa002c77d>] scsi_forget_host+0x47/0x6c [scsi_mod]
[20404.993852]  [<ffffffffa00260c5>] scsi_remove_host+0x8d/0x110 [scsi_mod]
[20404.993852]  [<ffffffffa0066c70>] quiesce_and_remove_host+0x60/0x9c
[usb_storage]
[20404.993852]  [<ffffffffa0066d69>] usb_stor_disconnect+0x1d/0x29
[usb_storage]
[20404.993852]  [<ffffffffa0154480>] usb_unbind_interface+0x6c/0x13f [usbcore]
[20404.993852]  [<ffffffff81257f9a>] __device_release_driver+0x76/0xcc
[20405.003718]  [<ffffffff812580c4>] device_release_driver+0x20/0x2d
[20405.003718]  [<ffffffff812573cc>] bus_remove_device+0xb1/0xc6
[20405.006684]  [<ffffffff812556fc>] device_del+0x13a/0x1a6
[20405.006684]  [<ffffffffa01519ee>] usb_disable_device+0x80/0xf7 [usbcore]
[20405.006684]  [<ffffffffa014c738>] usb_disconnect+0x8e/0x11e [usbcore]
[20405.010204]  [<ffffffffa014db04>] hub_thread+0x4ca/0xe77 [usbcore]
[20405.010204]  [<ffffffff81075014>] ? trace_hardirqs_on_caller+0x111/0x135
[20405.010204]  [<ffffffff81064747>] ? autoremove_wake_function+0x0/0x34
[20405.010204]  [<ffffffffa014d63a>] ? hub_thread+0x0/0xe77 [usbcore]
[20405.010204]  [<ffffffff810642ae>] kthread+0x8c/0x94
[20405.010204]  [<ffffffff8100a964>] kernel_thread_helper+0x4/0x10
[20405.010204]  [<ffffffff8134cf10>] ? restore_args+0x0/0x30
[20405.010204]  [<ffffffff81064222>] ? kthread+0x0/0x94
[20405.010204]  [<ffffffff8100a960>] ? kernel_thread_helper+0x0/0x10

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
