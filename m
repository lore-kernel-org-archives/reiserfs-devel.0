From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 45431] New: PROBLEM: problem with kswap/raiserfs
Date: Thu,  2 Aug 2012 07:51:34 +0000 (UTC)
Message-ID: <bug-45431-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=45431

           Summary: PROBLEM: problem with kswap/raiserfs
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.33 to 3.3.8
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: georgy.vas@gmail.com
        Regression: No


Created an attachment (id=76641)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=76641)
Kernel configuration

Hello,

we have a problem with kswap/raiserfs.

This is output of kernel log:

  kernel: [87963.971159] INFO: task kswapd0:113 blocked for more than 120
seconds.
  kernel: [87963.971163] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
  kernel: [87963.971166] kswapd0         D 0000000000000000     0   113      2
0x00000000
  kernel: [87963.971171]  ffff88035bd9d1d0 0000000000000046 ffffea00065134c0
ffff88035b02a010
  kernel: [87963.971179]  00000000000106c0 00000000000106c0 ffff88035b02bfd8
ffff88035b02bfd8
  kernel: [87963.971184]  00000000000106c0 ffff88065b370ee0 0000000100270026
ffff8801a10f4238
  kernel: [87963.971190] Call Trace:
  kernel: [87963.971200]  [<ffffffff8146cefe>] ?
__mutex_lock_slowpath+0xde/0x150
  kernel: [87963.971207]  [<ffffffff810a40ba>] ? release_pages+0x20a/0x240
  kernel: [87963.971211]  [<ffffffff8146c99a>] ? mutex_lock+0x1a/0x40
  kernel: [87963.971217]  [<ffffffff811822fd>] ? reiserfs_write_lock+0x2d/0x50
  kernel: [87963.971223]  [<ffffffff8116cb52>] ? reiserfs_write_dquot+0x22/0xd0
  kernel: [87963.971229]  [<ffffffff810981dc>] ? find_get_pages+0x3c/0x130
  kernel: [87963.971235]  [<ffffffff8113df06>] ? dqput+0x116/0x1e0
  kernel: [87963.971241]  [<ffffffff8113e038>] ? __dquot_drop+0x68/0x70
  kernel: [87963.971247]  [<ffffffff811638b0>] ?
reiserfs_evict_inode+0xe0/0x190
  kernel: [87963.971250]  [<ffffffff81122468>] ?
fsnotify_clear_marks_by_inode+0x28/0xe0
  kernel: [87963.971255]  [<ffffffff8110300d>] ? evict+0x9d/0x190
  kernel: [87963.971257]  [<ffffffff811035ff>] ? dispose_list+0x3f/0x50
  kernel: [87963.971259]  [<ffffffff81103787>] ? prune_icache_sb+0x177/0x350
  kernel: [87963.971264]  [<ffffffff810ecf52>] ? prune_super+0x162/0x1d0
  kernel: [87963.971268]  [<ffffffff810a8841>] ? shrink_slab+0x181/0x200
  kernel: [87963.971270]  [<ffffffff810a9254>] ? balance_pgdat+0x584/0x790
  kernel: [87963.971273]  [<ffffffff810a9595>] ? kswapd+0x135/0x1c0
  kernel: [87963.971275]  [<ffffffff810a9460>] ? balance_pgdat+0x790/0x790
  kernel: [87963.971280]  [<ffffffff8105a3d6>] ? kthread+0x96/0xa0
  kernel: [87963.971284]  [<ffffffff814703b4>] ? kernel_thread_helper+0x4/0x10
  kernel: [87963.971287]  [<ffffffff8105a340>] ? kthread_worker_fn+0x180/0x180
  kernel: [87963.971289]  [<ffffffff814703b0>] ? gs_change+0xb/0xb
  kernel: [87963.971291] INFO: task kswapd1:114 blocked for more than 120
seconds.
  kernel: [87963.971293] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
  kernel: [87963.971294] kswapd1         D 0000000000000000     0   114      2
0x00000000
  kernel: [87963.971296]  ffff88035bdf6820 0000000000000046 ffffffff8109fb58
ffff88035b02c010
  kernel: [87963.971300]  00000000000106c0 00000000000106c0 ffff88035b02dfd8
ffff88035b02dfd8
  kernel: [87963.971303]  00000000000106c0 ffff88065b371650 ffffea000fc0bf80
ffff88066fcf3b90
  kernel: [87963.971306] Call Trace:
  kernel: [87963.971310]  [<ffffffff8109fb58>] ? free_pcppages_bulk+0x318/0x390
  kernel: [87963.971313]  [<ffffffff810a0ce8>] ? __pagevec_free+0x38/0x50
  kernel: [87963.971316]  [<ffffffff8146cefe>] ?
__mutex_lock_slowpath+0xde/0x150
  kernel: [87963.971318]  [<ffffffff810a40ba>] ? release_pages+0x20a/0x240
  kernel: [87963.971320]  [<ffffffff8146c99a>] ? mutex_lock+0x1a/0x40
  kernel: [87963.971323]  [<ffffffff811822fd>] ? reiserfs_write_lock+0x2d/0x50
  kernel: [87963.971325]  [<ffffffff8116cb52>] ? reiserfs_write_dquot+0x22/0xd0
  kernel: [87963.971327]  [<ffffffff810981dc>] ? find_get_pages+0x3c/0x130
  kernel: [87963.971330]  [<ffffffff8113df06>] ? dqput+0x116/0x1e0
  kernel: [87963.971332]  [<ffffffff8113e038>] ? __dquot_drop+0x68/0x70
  kernel: [87963.971335]  [<ffffffff811638b0>] ?
reiserfs_evict_inode+0xe0/0x190
  kernel: [87963.971337]  [<ffffffff81122468>] ?
fsnotify_clear_marks_by_inode+0x28/0xe0
  kernel: [87963.971339]  [<ffffffff8110300d>] ? evict+0x9d/0x190
  kernel: [87963.971342]  [<ffffffff811035ff>] ? dispose_list+0x3f/0x50
  kernel: [87963.971344]  [<ffffffff81103787>] ? prune_icache_sb+0x177/0x350
  kernel: [87963.971347]  [<ffffffff810ecf52>] ? prune_super+0x162/0x1d0
  kernel: [87963.971349]  [<ffffffff810a8841>] ? shrink_slab+0x181/0x200
  kernel: [87963.971351]  [<ffffffff810a9254>] ? balance_pgdat+0x584/0x790
  kernel: [87963.971354]  [<ffffffff810a9595>] ? kswapd+0x135/0x1c0
  kernel: [87963.971356]  [<ffffffff810a9460>] ? balance_pgdat+0x790/0x790
  kernel: [87963.971359]  [<ffffffff8105a3d6>] ? kthread+0x96/0xa0
  kernel: [87963.971361]  [<ffffffff814703b4>] ? kernel_thread_helper+0x4/0x10
  kernel: [87963.971364]  [<ffffffff8105a340>] ? kthread_worker_fn+0x180/0x180
  kernel: [87963.971367]  [<ffffffff814703b0>] ? gs_change+0xb/0xb
  kernel: [87963.971377] INFO: task mysqld:2328 blocked for more than 120
seconds.
  kernel: [87963.971378] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
  kernel: [87963.971380] mysqld          D 0000000000000000     0  2328   1607
0x00000000
  kernel: [87963.971382]  ffff88035be460b0 0000000000000082 ffffffff810304b8
ffff880638b86010
  kernel: [87963.971386]  00000000000106c0 00000000000106c0 ffff880638b87fd8
ffff880638b87fd8
  kernel: [87963.971389]  00000000000106c0 ffff8806510dc2f0 0000001000000001
ffff8803c8d85940
  kernel: [87963.971392] Call Trace:
  kernel: [87963.971396]  [<ffffffff810304b8>] ?
select_task_rq_fair+0x378/0x770
  kernel: [87963.971399]  [<ffffffff8146cefe>] ?
__mutex_lock_slowpath+0xde/0x150
  kernel: [87963.971405]  [<ffffffff8102cddb>] ? __wake_up_common+0x5b/0x90
  kernel: [87963.971407]  [<ffffffff8146c99a>] ? mutex_lock+0x1a/0x40
  kernel: [87963.971409]  [<ffffffff8118229d>] ?
reiserfs_write_lock_once+0x2d/0x60
  kernel: [87963.971412]  [<ffffffff8116cfc5>] ? reiserfs_dirty_inode+0x25/0xb0
  kernel: [87963.971416]  [<ffffffff8110e9c0>] ? __mark_inode_dirty+0x40/0x260
  kernel: [87963.971419]  [<ffffffff811021fb>] ? file_update_time+0xfb/0x180
  kernel: [87963.971421]  [<ffffffff8109a2a8>] ?
__generic_file_aio_write+0x258/0x480
  kernel: [87963.971424]  [<ffffffff8109a52b>] ?
generic_file_aio_write+0x5b/0xc0
  kernel: [87963.971427]  [<ffffffff810e9cf8>] ? do_sync_write+0xc8/0x110
  kernel: [87963.971432]  [<ffffffff811211a8>] ? fsnotify+0x128/0x310
  kernel: [87963.971434]  [<ffffffff8146de19>] ? _raw_spin_lock_bh+0x9/0x30
  kernel: [87963.971440]  [<ffffffff811f246c>] ?
security_file_permission+0x1c/0xa0
  kernel: [87963.971442]  [<ffffffff810ea32e>] ? vfs_write+0xce/0x130
  kernel: [87963.971444]  [<ffffffff810ea431>] ? sys_pwrite64+0xa1/0xb0
  kernel: [87963.971447]  [<ffffffff8105916f>] ? sys_clock_gettime+0x9f/0xc0
  kernel: [87963.971450]  [<ffffffff8146e5bb>] ? system_call_fastpath+0x16/0x1b
  kernel: [87963.971453] INFO: task mysqld:2469 blocked for more than 120
seconds.
  kernel: [87963.971454] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
  kernel: [87963.971456] mysqld          D 0000000000000000     0  2469   1607
0x00000000
  kernel: [87963.971458]  ffff88035bc7e820 0000000000000082 ffff880630cc5a80
ffff880630cc4010
  kernel: [87963.971462]  00000000000106c0 00000000000106c0 ffff880630cc5fd8
ffff880630cc5fd8
  kernel: [87963.971465]  00000000000106c0 ffff88062e7a60b0 ffff880630cc5718
0000000100000000
  kernel: [87963.971468] Call Trace:
  kernel: [87963.971471]  [<ffffffff8146cefe>] ?
__mutex_lock_slowpath+0xde/0x150
  kernel: [87963.971473]  [<ffffffff8146c99a>] ? mutex_lock+0x1a/0x40
  kernel: [87963.971475]  [<ffffffff8118229d>] ?
reiserfs_write_lock_once+0x2d/0x60
  kernel: [87963.971478]  [<ffffffff81165204>] ? reiserfs_get_block+0x84/0x10c0
  kernel: [87963.971482]  [<ffffffff81218f83>] ? cpumask_next_and+0x23/0x40
  kernel: [87963.971485]  [<ffffffff8111f746>] ? do_mpage_readpage+0x2d6/0x560
  kernel: [87963.971488]  [<ffffffff81098973>] ?
add_to_page_cache_locked+0xd3/0x130
  kernel: [87963.971491]  [<ffffffff8111fb47>] ? mpage_readpages+0xf7/0x150
  kernel: [87963.971493]  [<ffffffff81165180>] ? reiserfs_new_inode+0x640/0x640
  kernel: [87963.971495]  [<ffffffff81165180>] ? reiserfs_new_inode+0x640/0x640
  kernel: [87963.971498]  [<ffffffff810a2e92>] ? read_pages+0x52/0x120
  kernel: [87963.971500]  [<ffffffff810a30d6>] ?
__do_page_cache_readahead+0x176/0x180
  kernel: [87963.971503]  [<ffffffff810a32c3>] ? ondemand_readahead+0xc3/0x250
  kernel: [87963.971505]  [<ffffffff81099386>] ?
do_generic_file_read+0x296/0x490
  kernel: [87963.971507]  [<ffffffff810979d0>] ?
iov_iter_copy_from_user+0x140/0x140
  kernel: [87963.971510]  [<ffffffff81099bdb>] ?
generic_file_aio_read+0xfb/0x260
  kernel: [87963.971513]  [<ffffffff810e9e08>] ? do_sync_read+0xc8/0x110
  kernel: [87963.971515]  [<ffffffff811211a8>] ? fsnotify+0x128/0x310
  kernel: [87963.971518]  [<ffffffff810ea5a7>] ? vfs_read+0xc7/0x130
  kernel: [87963.971520]  [<ffffffff810ea713>] ? sys_read+0x53/0xa0
  kernel: [87963.971523]  [<ffffffff8146e5bb>] ? system_call_fastpath+0x16/0x1b
  kernel: [87963.971531] INFO: task mysqld:3210 blocked for more than 120
seconds.
  kernel: [87963.971532] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
87963.971839]  [<ffffffff8146c99a>] ? mutex_lock+0x1a/0x40
  kernel: [87963.971841]  [<ffffffff810f63aa>] ? do_lookup+0x27a/0x3a0
  kernel: [87963.971843]  [<ffffffff810f86ae>] ? path_lookupat+0xbe/0x680
  kernel: [87963.971846]  [<ffffffff81026f5a>] ?
ptep_set_access_flags+0x1a/0x20
  kernel: [87963.971850]  [<ffffffff810b7b42>] ? do_wp_page+0x412/0x7c0
  kernel: [87963.971853]  [<ffffffff810f8c9b>] ? do_path_lookup+0x2b/0x90
  kernel: [87963.971855]  [<ffffffff810f944f>] ? user_path_at_empty+0x9f/0xd0
  kernel: [87963.971860]  [<ffffffff810236e1>] ? do_page_fault+0x201/0x450
  kernel: [87963.971863]  [<ffffffff8146e1af>] ? page_fault+0x1f/0x30
  kernel: [87963.971865]  [<ffffffff810eeb01>] ? vfs_fstatat+0x41/0x80
  kernel: [87963.971867]  [<ffffffff810eec8f>] ? sys_newstat+0x1f/0x50
  kernel: [87963.971871]  [<ffffffff8122404d>] ?
copy_user_generic_string+0x2d/0x40
  kernel: [87963.971873]  [<ffffffff8146e1af>] ? page_fault+0x1f/0x30
  kernel: [87963.971875]  [<ffffffff8146e5bb>] ? system_call_fastpath+0x16/0x1b
  kernel: [87963.971878] INFO: task httpd:12434 blocked for more than 120
seconds.
  kernel: [87963.971879] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
  kernel: [87963.971880] httpd           D 0000000000000000     0 12434   2236
0x00000000
  kernel: [87963.971883]  ffff88035bc7ca60 0000000000000082 ffff8806042cbac8
ffff8806042ca010
  kernel: [87963.971886]  00000000000106c0 00000000000106c0 ffff8806042cbfd8
ffff8806042cbfd8
  kernel: [87963.971889]  00000000000106c0 ffff8806219a51d0 ffffffff8102bbfa
0012000000000006
  kernel: [87963.971892] Call Trace:
  kernel: [87963.971895]  [<ffffffff8102bbfa>] ? wake_affine+0x1ca/0x360
  kernel: [87963.971897]  [<ffffffff813b18d7>] ? memcpy_toiovec+0x57/0x80
  kernel: [87963.971902]  [<ffffffff813f921c>] ? tcp_recvmsg+0x3ac/0xb10
  kernel: [87963.971904]  [<ffffffff8146de19>] ? _raw_spin_lock_bh+0x9/0x30
  kernel: [87963.971906]  [<ffffffff813a97f9>] ? release_sock+0x19/0x110
  kernel: [87963.971909]  [<ffffffff8146cefe>] ?
__mutex_lock_slowpath+0xde/0x150
  kernel: [87963.971911]  [<ffffffff810f607a>] ? unlazy_walk+0x10a/0x1c0
  kernel: [87963.971913]  [<ffffffff8146c99a>] ? mutex_lock+0x1a/0x40
  kernel: [87963.971915]  [<ffffffff810f63aa>] ? do_lookup+0x27a/0x3a0
  kernel: [87963.971918]  [<ffffffff810f86ae>] ? path_lookupat+0xbe/0x680
  kernel: [87963.971920]  [<ffffffff81026f5a>] ?
ptep_set_access_flags+0x1a/0x20
  kernel: [87963.971923]  [<ffffffff810b7b42>] ? do_wp_page+0x412/0x7c0
  kernel: [87963.971925]  [<ffffffff810f8c9b>] ? do_path_lookup+0x2b/0x90
  kernel: [87963.971927]  [<ffffffff810f944f>] ? user_path_at_empty+0x9f/0xd0
  kernel: [87963.971930]  [<ffffffff810236e1>] ? do_page_fault+0x201/0x450
  kernel: [87963.971932]  [<ffffffff8146e1af>] ? page_fault+0x1f/0x30
  kernel: [87963.971935]  [<ffffffff810eeb01>] ? vfs_fstatat+0x41/0x80
  kernel: [87963.971937]  [<ffffffff810eec8f>] ? sys_newstat+0x1f/0x50
  kernel: [87963.971939]  [<ffffffff8122404d>] ?
copy_user_generic_string+0x2d/0x40
  kernel: [87963.971941]  [<ffffffff8146e1af>] ? page_fault+0x1f/0x30
  kernel: [87963.971943]  [<ffffffff8146e5bb>] ? system_call_fastpath+0x16/0x1b


Machine raises a big loud, stopping to perform i / o operations and can't
reboot normally (requires hard reboot)
We have this problem on several servers with similar configuration. In one of
the servers occurs very often.

We tried with different versions of the kernel, but the problem remains (from
2.6.33 to 3.3.8).

Output from ver_linux script:

If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux maverick 3.2.24hostbg #1 SMP Tue Jul 31 17:38:13 EEST 2012 x86_64
Intel(R) Xeon(R) CPU X5650 @ 2.67GHz GenuineIntel GNU/Linux

Gnu C                  gcc (Gentoo 4.3.4 p1.1, pie-10.1.5) 4.3.4 Copyright (C)
2008 Free Software Foundation, Inc. This is free software; see the source for
copying conditions. There is NO warranty; not even for MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.
Gnu make               3.82
util-linux             linux 2.19.1)
mount                  linux 2.19.1 (with libblkid support)
modutils               3.16
e2fsprogs              1.41.14
Linux C Library        2.10.1
Dynamic linker (ldd)   2.10.1
Procps                 3.2.8
Net-tools              1.60_p20110409135728
Kbd                    1.15.3wip
Sh-utils               8.7
Modules Loaded         xt_owner ipv6 iptable_filter ip_tables

Kernel conf is attached

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
