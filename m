From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 23 May 2011 16:33:44 GMT
Message-ID: <201105231633.p4NGXitT013441@demeter2.kernel.org>
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





--- Comment #21 from roucaries.bastien+kernel@gmail.com  2011-05-23 16:33:39 ---
New trace

May 23 14:32:11 portablebastien kernel: [43800.728142] INFO: task
firefox-bin:14948 blocked for more than 120 seconds.
May 23 14:32:11 portablebastien kernel: [43800.728147] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:32:11 portablebastien kernel: [43800.728151] firefox-bin   D
ffff8800c3168000     0 14948   3917 0x00000000
May 23 14:32:11 portablebastien kernel: [43800.728159]  ffff8800c3168000
0000000000000086 0000000000000000 ffffffff8160b020
May 23 14:32:11 portablebastien kernel: [43800.728168]  00000000000136c0
ffff88004f5f5fd8 00000000000136c0 00000000000136c0
May 23 14:32:11 portablebastien kernel: [43800.728174]  ffff8800c31682d8
ffff8800c31682e0 ffff8800c3168000 00000000000136c0
May 23 14:32:11 portablebastien kernel: [43800.728181] Call Trace:
May 23 14:32:11 portablebastien kernel: [43800.728219]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:32:11 portablebastien kernel: [43800.728227]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:32:11 portablebastien kernel: [43800.728242]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:32:11 portablebastien kernel: [43800.728255]  [<ffffffffa02d0aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 23 14:32:11 portablebastien kernel: [43800.728269]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:32:11 portablebastien kernel: [43800.728283]  [<ffffffffa02bf52f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 23 14:32:11 portablebastien kernel: [43800.728289]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:32:11 portablebastien kernel: [43800.728295]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 23 14:32:11 portablebastien kernel: [43800.728302]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 23 14:32:11 portablebastien kernel: [43800.728309]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 23 14:32:11 portablebastien kernel: [43800.728315]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 23 14:32:11 portablebastien kernel: [43800.728321]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 23 14:32:11 portablebastien kernel: [43800.728327]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 23 14:32:11 portablebastien kernel: [43800.728332]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 23 14:32:11 portablebastien kernel: [43800.728337]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 23 14:32:11 portablebastien kernel: [43800.728342]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 23 14:34:11 portablebastien kernel: [43920.728239] INFO: task
firefox-bin:14948 blocked for more than 120 seconds.
May 23 14:34:11 portablebastien kernel: [43920.728247] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:34:11 portablebastien kernel: [43920.728251] firefox-bin   D
ffff8800c3168000     0 14948   3917 0x00000000
May 23 14:34:11 portablebastien kernel: [43920.728258]  ffff8800c3168000
0000000000000086 0000000000000000 ffffffff8160b020
May 23 14:34:11 portablebastien kernel: [43920.728266]  00000000000136c0
ffff88004f5f5fd8 00000000000136c0 00000000000136c0
May 23 14:34:11 portablebastien kernel: [43920.728273]  ffff8800c31682d8
ffff8800c31682e0 ffff8800c3168000 00000000000136c0
May 23 14:34:11 portablebastien kernel: [43920.728279] Call Trace:
May 23 14:34:11 portablebastien kernel: [43920.728317]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728326]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:34:11 portablebastien kernel: [43920.728340]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728354]  [<ffffffffa02d0aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728368]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728381]  [<ffffffffa02bf52f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728388]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:34:11 portablebastien kernel: [43920.728394]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 23 14:34:11 portablebastien kernel: [43920.728401]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 23 14:34:11 portablebastien kernel: [43920.728408]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 23 14:34:11 portablebastien kernel: [43920.728414]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 23 14:34:11 portablebastien kernel: [43920.728420]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 23 14:34:11 portablebastien kernel: [43920.728426]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 23 14:34:11 portablebastien kernel: [43920.728431]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 23 14:34:11 portablebastien kernel: [43920.728436]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 23 14:34:11 portablebastien kernel: [43920.728442]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 23 14:34:11 portablebastien kernel: [43920.728456] INFO: task okular:16181
blocked for more than 120 seconds.
May 23 14:34:11 portablebastien kernel: [43920.728459] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:34:11 portablebastien kernel: [43920.728462] okular        D
ffff8800bdc18d80     0 16181   3586 0x00000000
May 23 14:34:11 portablebastien kernel: [43920.728468]  ffff8800bdc18d80
0000000000000086 0000000000000000 ffff88011b65ca40
May 23 14:34:11 portablebastien kernel: [43920.728475]  00000000000136c0
ffff88011a73bfd8 00000000000136c0 00000000000136c0
May 23 14:34:11 portablebastien kernel: [43920.728481]  ffff8800bdc19058
ffff8800bdc19060 ffff8800bdc18d80 00000000000136c0
May 23 14:34:11 portablebastien kernel: [43920.728488] Call Trace:
May 23 14:34:11 portablebastien kernel: [43920.728502]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728509]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:34:11 portablebastien kernel: [43920.728522]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728536]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728549]  [<ffffffffa02b87cb>] ?
reiserfs_truncate_file+0x17a/0x27f [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728558]  [<ffffffff810ceeaa>] ?
unmap_mapping_range+0x59/0xf5
May 23 14:34:11 portablebastien kernel: [43920.728571]  [<ffffffffa02ba6d2>] ?
reiserfs_vfs_truncate_file+0x22/0x2d [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728577]  [<ffffffff810bef87>] ?
vmtruncate+0x36/0x3f
May 23 14:34:11 portablebastien kernel: [43920.728590]  [<ffffffffa02b6d45>] ?
reiserfs_setattr+0x26f/0x2f4 [reiserfs]
May 23 14:34:11 portablebastien kernel: [43920.728596]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:34:11 portablebastien kernel: [43920.728601]  [<ffffffff81106439>] ?
notify_change+0x195/0x27e
May 23 14:34:11 portablebastien kernel: [43920.728606]  [<ffffffff810f2d4f>] ?
do_truncate+0x68/0x86
May 23 14:34:11 portablebastien kernel: [43920.728611]  [<ffffffff810f21bb>] ?
__dentry_open+0x186/0x291
May 23 14:34:11 portablebastien kernel: [43920.728616]  [<ffffffff810fb5c4>] ?
get_write_access+0x10/0x3a
May 23 14:34:11 portablebastien kernel: [43920.728621]  [<ffffffff810fd00e>] ?
do_last+0x453/0x526
May 23 14:34:11 portablebastien kernel: [43920.728626]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 23 14:34:11 portablebastien kernel: [43920.728631]  [<ffffffff810f34a5>] ?
do_sync_read+0xb1/0xea
May 23 14:34:11 portablebastien kernel: [43920.728637]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 23 14:34:11 portablebastien kernel: [43920.728642]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 23 14:36:11 portablebastien kernel: [44040.728162] INFO: task
firefox-bin:14948 blocked for more than 120 seconds.
May 23 14:36:11 portablebastien kernel: [44040.728168] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:36:11 portablebastien kernel: [44040.728172] firefox-bin   D
ffff8800c3168000     0 14948   3917 0x00000000
May 23 14:36:11 portablebastien kernel: [44040.728179]  ffff8800c3168000
0000000000000086 0000000000000000 ffffffff8160b020
May 23 14:36:11 portablebastien kernel: [44040.728187]  00000000000136c0
ffff88004f5f5fd8 00000000000136c0 00000000000136c0
May 23 14:36:11 portablebastien kernel: [44040.728193]  ffff8800c31682d8
ffff8800c31682e0 ffff8800c3168000 00000000000136c0
May 23 14:36:11 portablebastien kernel: [44040.728200] Call Trace:
May 23 14:36:11 portablebastien kernel: [44040.728239]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728248]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:36:11 portablebastien kernel: [44040.728262]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728276]  [<ffffffffa02d0aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728290]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728303]  [<ffffffffa02bf52f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728309]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:36:11 portablebastien kernel: [44040.728316]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 23 14:36:11 portablebastien kernel: [44040.728322]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 23 14:36:11 portablebastien kernel: [44040.728329]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 23 14:36:11 portablebastien kernel: [44040.728335]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 23 14:36:11 portablebastien kernel: [44040.728341]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 23 14:36:11 portablebastien kernel: [44040.728347]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 23 14:36:11 portablebastien kernel: [44040.728352]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 23 14:36:11 portablebastien kernel: [44040.728357]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 23 14:36:11 portablebastien kernel: [44040.728362]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 23 14:36:11 portablebastien kernel: [44040.728373] INFO: task okular:16181
blocked for more than 120 seconds.
May 23 14:36:11 portablebastien kernel: [44040.728377] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:36:11 portablebastien kernel: [44040.728380] okular        D
ffff8800bdc18d80     0 16181   3586 0x00000000
May 23 14:36:11 portablebastien kernel: [44040.728386]  ffff8800bdc18d80
0000000000000086 0000000000000000 ffff88011b65ca40
May 23 14:36:11 portablebastien kernel: [44040.728393]  00000000000136c0
ffff88011a73bfd8 00000000000136c0 00000000000136c0
May 23 14:36:11 portablebastien kernel: [44040.728399]  ffff8800bdc19058
ffff8800bdc19060 ffff8800bdc18d80 00000000000136c0
May 23 14:36:11 portablebastien kernel: [44040.728405] Call Trace:
May 23 14:36:11 portablebastien kernel: [44040.728420]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728426]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:36:11 portablebastien kernel: [44040.728440]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728453]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728467]  [<ffffffffa02b87cb>] ?
reiserfs_truncate_file+0x17a/0x27f [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728473]  [<ffffffff810ceeaa>] ?
unmap_mapping_range+0x59/0xf5
May 23 14:36:11 portablebastien kernel: [44040.728486]  [<ffffffffa02ba6d2>] ?
reiserfs_vfs_truncate_file+0x22/0x2d [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728493]  [<ffffffff810bef87>] ?
vmtruncate+0x36/0x3f
May 23 14:36:11 portablebastien kernel: [44040.728505]  [<ffffffffa02b6d45>] ?
reiserfs_setattr+0x26f/0x2f4 [reiserfs]
May 23 14:36:11 portablebastien kernel: [44040.728511]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:36:11 portablebastien kernel: [44040.728516]  [<ffffffff81106439>] ?
notify_change+0x195/0x27e
May 23 14:36:11 portablebastien kernel: [44040.728522]  [<ffffffff810f2d4f>] ?
do_truncate+0x68/0x86
May 23 14:36:11 portablebastien kernel: [44040.728526]  [<ffffffff810f21bb>] ?
__dentry_open+0x186/0x291
May 23 14:36:11 portablebastien kernel: [44040.728532]  [<ffffffff810fb5c4>] ?
get_write_access+0x10/0x3a
May 23 14:36:11 portablebastien kernel: [44040.728537]  [<ffffffff810fd00e>] ?
do_last+0x453/0x526
May 23 14:36:11 portablebastien kernel: [44040.728542]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 23 14:36:11 portablebastien kernel: [44040.728547]  [<ffffffff810f34a5>] ?
do_sync_read+0xb1/0xea
May 23 14:36:11 portablebastien kernel: [44040.728552]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 23 14:36:11 portablebastien kernel: [44040.728557]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 23 14:38:11 portablebastien kernel: [44160.728166] INFO: task
firefox-bin:14948 blocked for more than 120 seconds.
May 23 14:38:11 portablebastien kernel: [44160.728182] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:38:11 portablebastien kernel: [44160.728186] firefox-bin   D
ffff8800c3168000     0 14948   3917 0x00000000
May 23 14:38:11 portablebastien kernel: [44160.728193]  ffff8800c3168000
0000000000000086 0000000000000000 ffffffff8160b020
May 23 14:38:11 portablebastien kernel: [44160.728201]  00000000000136c0
ffff88004f5f5fd8 00000000000136c0 00000000000136c0
May 23 14:38:11 portablebastien kernel: [44160.728208]  ffff8800c31682d8
ffff8800c31682e0 ffff8800c3168000 00000000000136c0
May 23 14:38:11 portablebastien kernel: [44160.728215] Call Trace:
May 23 14:38:11 portablebastien kernel: [44160.728255]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728264]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:38:11 portablebastien kernel: [44160.728279]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728293]  [<ffffffffa02d0aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728307]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728321]  [<ffffffffa02bf52f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728327]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:38:11 portablebastien kernel: [44160.728333]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 23 14:38:11 portablebastien kernel: [44160.728340]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 23 14:38:11 portablebastien kernel: [44160.728347]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 23 14:38:11 portablebastien kernel: [44160.728353]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 23 14:38:11 portablebastien kernel: [44160.728359]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 23 14:38:11 portablebastien kernel: [44160.728365]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 23 14:38:11 portablebastien kernel: [44160.728370]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 23 14:38:11 portablebastien kernel: [44160.728375]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 23 14:38:11 portablebastien kernel: [44160.728381]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 23 14:38:11 portablebastien kernel: [44160.728393] INFO: task okular:16181
blocked for more than 120 seconds.
May 23 14:38:11 portablebastien kernel: [44160.728397] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:38:11 portablebastien kernel: [44160.728400] okular        D
ffff8800bdc18d80     0 16181   3586 0x00000000
May 23 14:38:11 portablebastien kernel: [44160.728406]  ffff8800bdc18d80
0000000000000086 0000000000000000 ffff88011b65ca40
May 23 14:38:11 portablebastien kernel: [44160.728413]  00000000000136c0
ffff88011a73bfd8 00000000000136c0 00000000000136c0
May 23 14:38:11 portablebastien kernel: [44160.728419]  ffff8800bdc19058
ffff8800bdc19060 ffff8800bdc18d80 00000000000136c0
May 23 14:38:11 portablebastien kernel: [44160.728425] Call Trace:
May 23 14:38:11 portablebastien kernel: [44160.728440]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728446]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:38:11 portablebastien kernel: [44160.728460]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728473]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728487]  [<ffffffffa02b87cb>] ?
reiserfs_truncate_file+0x17a/0x27f [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728493]  [<ffffffff810ceeaa>] ?
unmap_mapping_range+0x59/0xf5
May 23 14:38:11 portablebastien kernel: [44160.728506]  [<ffffffffa02ba6d2>] ?
reiserfs_vfs_truncate_file+0x22/0x2d [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728513]  [<ffffffff810bef87>] ?
vmtruncate+0x36/0x3f
May 23 14:38:11 portablebastien kernel: [44160.728525]  [<ffffffffa02b6d45>] ?
reiserfs_setattr+0x26f/0x2f4 [reiserfs]
May 23 14:38:11 portablebastien kernel: [44160.728531]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:38:11 portablebastien kernel: [44160.728536]  [<ffffffff81106439>] ?
notify_change+0x195/0x27e
May 23 14:38:11 portablebastien kernel: [44160.728541]  [<ffffffff810f2d4f>] ?
do_truncate+0x68/0x86
May 23 14:38:11 portablebastien kernel: [44160.728546]  [<ffffffff810f21bb>] ?
__dentry_open+0x186/0x291
May 23 14:38:11 portablebastien kernel: [44160.728551]  [<ffffffff810fb5c4>] ?
get_write_access+0x10/0x3a
May 23 14:38:11 portablebastien kernel: [44160.728556]  [<ffffffff810fd00e>] ?
do_last+0x453/0x526
May 23 14:38:11 portablebastien kernel: [44160.728561]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 23 14:38:11 portablebastien kernel: [44160.728566]  [<ffffffff810f34a5>] ?
do_sync_read+0xb1/0xea
May 23 14:38:11 portablebastien kernel: [44160.728572]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 23 14:38:11 portablebastien kernel: [44160.728577]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 23 14:40:11 portablebastien kernel: [44280.728140] INFO: task
firefox-bin:14948 blocked for more than 120 seconds.
May 23 14:40:11 portablebastien kernel: [44280.728145] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:40:11 portablebastien kernel: [44280.728150] firefox-bin   D
ffff8800c3168000     0 14948   3917 0x00000000
May 23 14:40:11 portablebastien kernel: [44280.728157]  ffff8800c3168000
0000000000000086 0000000000000000 ffffffff8160b020
May 23 14:40:11 portablebastien kernel: [44280.728165]  00000000000136c0
ffff88004f5f5fd8 00000000000136c0 00000000000136c0
May 23 14:40:11 portablebastien kernel: [44280.728171]  ffff8800c31682d8
ffff8800c31682e0 ffff8800c3168000 00000000000136c0
May 23 14:40:11 portablebastien kernel: [44280.728178] Call Trace:
May 23 14:40:11 portablebastien kernel: [44280.728215]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728224]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:40:11 portablebastien kernel: [44280.728238]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728252]  [<ffffffffa02d0aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728266]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728279]  [<ffffffffa02bf52f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728285]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:40:11 portablebastien kernel: [44280.728291]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 23 14:40:11 portablebastien kernel: [44280.728298]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 23 14:40:11 portablebastien kernel: [44280.728305]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 23 14:40:11 portablebastien kernel: [44280.728311]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 23 14:40:11 portablebastien kernel: [44280.728316]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 23 14:40:11 portablebastien kernel: [44280.728323]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 23 14:40:11 portablebastien kernel: [44280.728328]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 23 14:40:11 portablebastien kernel: [44280.728333]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 23 14:40:11 portablebastien kernel: [44280.728338]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 23 14:40:11 portablebastien kernel: [44280.728349] INFO: task okular:16181
blocked for more than 120 seconds.
May 23 14:40:11 portablebastien kernel: [44280.728352] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:40:11 portablebastien kernel: [44280.728356] okular        D
ffff8800bdc18d80     0 16181   3586 0x00000000
May 23 14:40:11 portablebastien kernel: [44280.728362]  ffff8800bdc18d80
0000000000000086 0000000000000000 ffff88011b65ca40
May 23 14:40:11 portablebastien kernel: [44280.728368]  00000000000136c0
ffff88011a73bfd8 00000000000136c0 00000000000136c0
May 23 14:40:11 portablebastien kernel: [44280.728375]  ffff8800bdc19058
ffff8800bdc19060 ffff8800bdc18d80 00000000000136c0
May 23 14:40:11 portablebastien kernel: [44280.728387] Call Trace:
May 23 14:40:11 portablebastien kernel: [44280.728401]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728407]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:40:11 portablebastien kernel: [44280.728421]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728435]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728448]  [<ffffffffa02b87cb>] ?
reiserfs_truncate_file+0x17a/0x27f [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728455]  [<ffffffff810ceeaa>] ?
unmap_mapping_range+0x59/0xf5
May 23 14:40:11 portablebastien kernel: [44280.728468]  [<ffffffffa02ba6d2>] ?
reiserfs_vfs_truncate_file+0x22/0x2d [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728475]  [<ffffffff810bef87>] ?
vmtruncate+0x36/0x3f
May 23 14:40:11 portablebastien kernel: [44280.728487]  [<ffffffffa02b6d45>] ?
reiserfs_setattr+0x26f/0x2f4 [reiserfs]
May 23 14:40:11 portablebastien kernel: [44280.728493]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:40:11 portablebastien kernel: [44280.728498]  [<ffffffff81106439>] ?
notify_change+0x195/0x27e
May 23 14:40:11 portablebastien kernel: [44280.728503]  [<ffffffff810f2d4f>] ?
do_truncate+0x68/0x86
May 23 14:40:11 portablebastien kernel: [44280.728508]  [<ffffffff810f21bb>] ?
__dentry_open+0x186/0x291
May 23 14:40:11 portablebastien kernel: [44280.728513]  [<ffffffff810fb5c4>] ?
get_write_access+0x10/0x3a
May 23 14:40:11 portablebastien kernel: [44280.728518]  [<ffffffff810fd00e>] ?
do_last+0x453/0x526
May 23 14:40:11 portablebastien kernel: [44280.728523]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 23 14:40:11 portablebastien kernel: [44280.728528]  [<ffffffff810f34a5>] ?
do_sync_read+0xb1/0xea
May 23 14:40:11 portablebastien kernel: [44280.728533]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 23 14:40:11 portablebastien kernel: [44280.728538]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 23 14:42:11 portablebastien kernel: [44400.728123] INFO: task
firefox-bin:14948 blocked for more than 120 seconds.
May 23 14:42:11 portablebastien kernel: [44400.728128] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 23 14:42:11 portablebastien kernel: [44400.728133] firefox-bin   D
ffff8800c3168000     0 14948   3917 0x00000000
May 23 14:42:11 portablebastien kernel: [44400.728140]  ffff8800c3168000
0000000000000086 0000000000000000 ffffffff8160b020
May 23 14:42:11 portablebastien kernel: [44400.728148]  00000000000136c0
ffff88004f5f5fd8 00000000000136c0 00000000000136c0
May 23 14:42:11 portablebastien kernel: [44400.728155]  ffff8800c31682d8
ffff8800c31682e0 ffff8800c3168000 00000000000136c0
May 23 14:42:11 portablebastien kernel: [44400.728162] Call Trace:
May 23 14:42:11 portablebastien kernel: [44400.728199]  [<ffffffffa02c9b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 23 14:42:11 portablebastien kernel: [44400.728208]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 23 14:42:11 portablebastien kernel: [44400.728223]  [<ffffffffa02cd57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 23 14:42:11 portablebastien kernel: [44400.728236]  [<ffffffffa02d0aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 23 14:42:11 portablebastien kernel: [44400.728250]  [<ffffffffa02cd726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 23 14:42:11 portablebastien kernel: [44400.728264]  [<ffffffffa02bf52f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 23 14:42:11 portablebastien kernel: [44400.728270]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 23 14:42:11 portablebastien kernel: [44400.728276]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 23 14:42:11 portablebastien kernel: [44400.728283]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 23 14:42:11 portablebastien kernel: [44400.728290]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 23 14:42:11 portablebastien kernel: [44400.728296]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 23 14:42:11 portablebastien kernel: [44400.728302]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 23 14:42:11 portablebastien kernel: [44400.728308]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 23 14:42:11 portablebastien kernel: [44400.728314]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 23 14:42:11 portablebastien kernel: [44400.728318]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 23 14:42:11 portablebastien kernel: [44400.728324]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
