From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 23 May 2011 13:11:29 GMT
Message-ID: <201105231311.p4NDBTbv032193@demeter2.kernel.org>
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





--- Comment #20 from roucaries.bastien+kernel@gmail.com  2011-05-23 13:11:26 ---
New trace also

May 21 17:03:28 portablebastien kernel: [ 9720.730560] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:03:28 portablebastien kernel: [ 9720.732965] krunner       D
ffff8800dd8136c0     0  3838      1 0x00000000
May 21 17:03:28 portablebastien kernel: [ 9720.732973]  ffff880119784a40
0000000000000082 0000000000000000 ffff880117dc21c0
May 21 17:03:28 portablebastien kernel: [ 9720.732983]  00000000000136c0
ffff8800c948bfd8 00000000000136c0 00000000000136c0
May 21 17:03:28 portablebastien kernel: [ 9720.732992]  ffff880119784d18
ffff880119784d20 ffff880119784a40 00000000000136c0
May 21 17:03:28 portablebastien kernel: [ 9720.733009] Call Trace:
May 21 17:03:28 portablebastien kernel: [ 9720.733048]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:03:28 portablebastien kernel: [ 9720.733058]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:03:28 portablebastien kernel: [ 9720.733073]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:03:28 portablebastien kernel: [ 9720.733087]  [<ffffffffa02b3aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 21 17:03:28 portablebastien kernel: [ 9720.733102]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:03:28 portablebastien kernel: [ 9720.733116]  [<ffffffffa02a252f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 21 17:03:28 portablebastien kernel: [ 9720.733123]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 21 17:03:28 portablebastien kernel: [ 9720.733130]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 21 17:03:28 portablebastien kernel: [ 9720.733138]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 21 17:03:28 portablebastien kernel: [ 9720.733146]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 21 17:03:28 portablebastien kernel: [ 9720.733154]  [<ffffffff8125c21e>] ?
sock_aio_read+0xb6/0xc5
May 21 17:03:28 portablebastien kernel: [ 9720.733160]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 21 17:03:28 portablebastien kernel: [ 9720.733167]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 17:03:28 portablebastien kernel: [ 9720.733175]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 17:03:28 portablebastien kernel: [ 9720.733181]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 17:03:28 portablebastien kernel: [ 9720.733186]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 17:03:28 portablebastien kernel: [ 9720.733193]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 17:03:28 portablebastien kernel: [ 9720.733204] INFO: task
firefox-bin:3884 blocked for more than 120 seconds.
May 21 17:03:28 portablebastien kernel: [ 9720.735623] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:03:28 portablebastien kernel: [ 9720.738074] firefox-bin   D
ffff8800c2d721c0     0  3884   3544 0x00000000
May 21 17:03:28 portablebastien kernel: [ 9720.738081]  ffff8800c2d721c0
0000000000000086 0000000000000000 ffffffff8160b020
May 21 17:03:28 portablebastien kernel: [ 9720.738088]  00000000000136c0
ffff8800c2fcdfd8 00000000000136c0 00000000000136c0
May 21 17:03:28 portablebastien kernel: [ 9720.738097]  ffff8800c2d72498
ffff8800c2d724a0 ffff8800c2d721c0 00000000000136c0
May 21 17:03:28 portablebastien kernel: [ 9720.738106] Call Trace:
May 21 17:03:28 portablebastien kernel: [ 9720.738124]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:03:28 portablebastien kernel: [ 9720.738132]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:03:28 portablebastien kernel: [ 9720.738147]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:03:28 portablebastien kernel: [ 9720.738154]  [<ffffffff811035c5>] ?
d_instantiate+0x31/0x46
May 21 17:03:28 portablebastien kernel: [ 9720.738162]  [<ffffffff81132f58>] ?
__dquot_initialize+0x20/0x172
May 21 17:03:28 portablebastien kernel: [ 9720.738176]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:03:28 portablebastien kernel: [ 9720.738189]  [<ffffffffa0298c03>] ?
reiserfs_create+0xe6/0x205 [reiserfs]
May 21 17:03:28 portablebastien kernel: [ 9720.738196]  [<ffffffff810fb6ee>] ?
generic_permission+0xe/0x8a
May 21 17:03:28 portablebastien kernel: [ 9720.738202]  [<ffffffff810fc470>] ?
vfs_create+0x66/0x88
May 21 17:03:28 portablebastien kernel: [ 9720.738208]  [<ffffffff810fb9a1>] ?
d_alloc_and_lookup+0x4a/0x67
May 21 17:03:28 portablebastien kernel: [ 9720.738213]  [<ffffffff810fce1a>] ?
do_last+0x25f/0x526
May 21 17:03:28 portablebastien kernel: [ 9720.738219]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 21 17:03:28 portablebastien kernel: [ 9720.738226]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 21 17:03:28 portablebastien kernel: [ 9720.738232]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 17:05:28 portablebastien kernel: [ 9840.736224] INFO: task krunner:3838
blocked for more than 120 seconds.
May 21 17:05:28 portablebastien kernel: [ 9840.738576] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:05:28 portablebastien kernel: [ 9840.740930] krunner       D
ffff8800dd8136c0     0  3838      1 0x00000000
May 21 17:05:28 portablebastien kernel: [ 9840.740938]  ffff880119784a40
0000000000000082 0000000000000000 ffff880117dc21c0
May 21 17:05:28 portablebastien kernel: [ 9840.740948]  00000000000136c0
ffff8800c948bfd8 00000000000136c0 00000000000136c0
May 21 17:05:28 portablebastien kernel: [ 9840.740958]  ffff880119784d18
ffff880119784d20 ffff880119784a40 00000000000136c0
May 21 17:05:28 portablebastien kernel: [ 9840.740967] Call Trace:
May 21 17:05:28 portablebastien kernel: [ 9840.741006]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:05:28 portablebastien kernel: [ 9840.741016]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:05:28 portablebastien kernel: [ 9840.741032]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:05:28 portablebastien kernel: [ 9840.741046]  [<ffffffffa02b3aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 21 17:05:28 portablebastien kernel: [ 9840.741064]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:05:28 portablebastien kernel: [ 9840.741078]  [<ffffffffa02a252f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 21 17:05:28 portablebastien kernel: [ 9840.741085]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 21 17:05:28 portablebastien kernel: [ 9840.741092]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 21 17:05:28 portablebastien kernel: [ 9840.741100]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 21 17:05:28 portablebastien kernel: [ 9840.741108]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 21 17:05:28 portablebastien kernel: [ 9840.741116]  [<ffffffff8125c21e>] ?
sock_aio_read+0xb6/0xc5
May 21 17:05:28 portablebastien kernel: [ 9840.741122]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 21 17:05:28 portablebastien kernel: [ 9840.741129]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 17:05:28 portablebastien kernel: [ 9840.741137]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 17:05:28 portablebastien kernel: [ 9840.741143]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 17:05:28 portablebastien kernel: [ 9840.741148]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 17:05:28 portablebastien kernel: [ 9840.741155]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 17:05:28 portablebastien kernel: [ 9840.741167] INFO: task
firefox-bin:3884 blocked for more than 120 seconds.
May 21 17:05:28 portablebastien kernel: [ 9840.743488] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:05:28 portablebastien kernel: [ 9840.745866] firefox-bin   D
ffff8800c2d721c0     0  3884   3544 0x00000000
May 21 17:05:28 portablebastien kernel: [ 9840.745872]  ffff8800c2d721c0
0000000000000086 0000000000000000 ffffffff8160b020
May 21 17:05:28 portablebastien kernel: [ 9840.745879]  00000000000136c0
ffff8800c2fcdfd8 00000000000136c0 00000000000136c0
May 21 17:05:28 portablebastien kernel: [ 9840.745889]  ffff8800c2d72498
ffff8800c2d724a0 ffff8800c2d721c0 00000000000136c0
May 21 17:05:28 portablebastien kernel: [ 9840.745898] Call Trace:
May 21 17:05:28 portablebastien kernel: [ 9840.745916]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:05:28 portablebastien kernel: [ 9840.745924]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:05:28 portablebastien kernel: [ 9840.745939]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:05:28 portablebastien kernel: [ 9840.745946]  [<ffffffff811035c5>] ?
d_instantiate+0x31/0x46
May 21 17:05:28 portablebastien kernel: [ 9840.745954]  [<ffffffff81132f58>] ?
__dquot_initialize+0x20/0x172
May 21 17:05:28 portablebastien kernel: [ 9840.745968]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:05:28 portablebastien kernel: [ 9840.745981]  [<ffffffffa0298c03>] ?
reiserfs_create+0xe6/0x205 [reiserfs]
May 21 17:05:28 portablebastien kernel: [ 9840.745988]  [<ffffffff810fb6ee>] ?
generic_permission+0xe/0x8a
May 21 17:05:28 portablebastien kernel: [ 9840.745994]  [<ffffffff810fc470>] ?
vfs_create+0x66/0x88
May 21 17:05:28 portablebastien kernel: [ 9840.746000]  [<ffffffff810fb9a1>] ?
d_alloc_and_lookup+0x4a/0x67
May 21 17:05:28 portablebastien kernel: [ 9840.746006]  [<ffffffff810fce1a>] ?
do_last+0x25f/0x526
May 21 17:05:28 portablebastien kernel: [ 9840.746012]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 21 17:05:28 portablebastien kernel: [ 9840.746019]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 21 17:05:28 portablebastien kernel: [ 9840.746025]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 17:07:28 portablebastien kernel: [ 9960.744122] INFO: task krunner:3838
blocked for more than 120 seconds.
May 21 17:07:28 portablebastien kernel: [ 9960.746505] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:07:28 portablebastien kernel: [ 9960.748918] krunner       D
ffff8800dd8136c0     0  3838      1 0x00000000
May 21 17:07:28 portablebastien kernel: [ 9960.748927]  ffff880119784a40
0000000000000082 0000000000000000 ffff880117dc21c0
May 21 17:07:28 portablebastien kernel: [ 9960.748936]  00000000000136c0
ffff8800c948bfd8 00000000000136c0 00000000000136c0
May 21 17:07:28 portablebastien kernel: [ 9960.748946]  ffff880119784d18
ffff880119784d20 ffff880119784a40 00000000000136c0
May 21 17:07:28 portablebastien kernel: [ 9960.748955] Call Trace:
May 21 17:07:28 portablebastien kernel: [ 9960.748994]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:07:28 portablebastien kernel: [ 9960.749005]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:07:28 portablebastien kernel: [ 9960.749020]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:07:28 portablebastien kernel: [ 9960.749034]  [<ffffffffa02b3aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 21 17:07:28 portablebastien kernel: [ 9960.749049]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:07:28 portablebastien kernel: [ 9960.749063]  [<ffffffffa02a252f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 21 17:07:28 portablebastien kernel: [ 9960.749070]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 21 17:07:28 portablebastien kernel: [ 9960.749077]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 21 17:07:28 portablebastien kernel: [ 9960.749085]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 21 17:07:28 portablebastien kernel: [ 9960.749093]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 21 17:07:28 portablebastien kernel: [ 9960.749101]  [<ffffffff8125c21e>] ?
sock_aio_read+0xb6/0xc5
May 21 17:07:28 portablebastien kernel: [ 9960.749107]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 21 17:07:28 portablebastien kernel: [ 9960.749114]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 17:07:28 portablebastien kernel: [ 9960.749121]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 17:07:28 portablebastien kernel: [ 9960.749128]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 17:07:28 portablebastien kernel: [ 9960.749133]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 17:07:28 portablebastien kernel: [ 9960.749140]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 17:07:28 portablebastien kernel: [ 9960.749151] INFO: task
firefox-bin:3884 blocked for more than 120 seconds.
May 21 17:07:28 portablebastien kernel: [ 9960.751556] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:07:28 portablebastien kernel: [ 9960.754002] firefox-bin   D
ffff8800c2d721c0     0  3884   3544 0x00000000
May 21 17:07:28 portablebastien kernel: [ 9960.754008]  ffff8800c2d721c0
0000000000000086 0000000000000000 ffffffff8160b020
May 21 17:07:28 portablebastien kernel: [ 9960.754015]  00000000000136c0
ffff8800c2fcdfd8 00000000000136c0 00000000000136c0
May 21 17:07:28 portablebastien kernel: [ 9960.754024]  ffff8800c2d72498
ffff8800c2d724a0 ffff8800c2d721c0 00000000000136c0
May 21 17:07:28 portablebastien kernel: [ 9960.754033] Call Trace:
May 21 17:07:28 portablebastien kernel: [ 9960.754051]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:07:28 portablebastien kernel: [ 9960.754058]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:07:28 portablebastien kernel: [ 9960.754073]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:07:28 portablebastien kernel: [ 9960.754081]  [<ffffffff811035c5>] ?
d_instantiate+0x31/0x46
May 21 17:07:28 portablebastien kernel: [ 9960.754088]  [<ffffffff81132f58>] ?
__dquot_initialize+0x20/0x172
May 21 17:07:28 portablebastien kernel: [ 9960.754103]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:07:28 portablebastien kernel: [ 9960.754116]  [<ffffffffa0298c03>] ?
reiserfs_create+0xe6/0x205 [reiserfs]
May 21 17:07:28 portablebastien kernel: [ 9960.754123]  [<ffffffff810fb6ee>] ?
generic_permission+0xe/0x8a
May 21 17:07:28 portablebastien kernel: [ 9960.754129]  [<ffffffff810fc470>] ?
vfs_create+0x66/0x88
May 21 17:07:28 portablebastien kernel: [ 9960.754134]  [<ffffffff810fb9a1>] ?
d_alloc_and_lookup+0x4a/0x67
May 21 17:07:28 portablebastien kernel: [ 9960.754140]  [<ffffffff810fce1a>] ?
do_last+0x25f/0x526
May 21 17:07:28 portablebastien kernel: [ 9960.754146]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 21 17:07:28 portablebastien kernel: [ 9960.754153]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 21 17:07:28 portablebastien kernel: [ 9960.754159]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 17:09:28 portablebastien kernel: [10080.752184] INFO: task krunner:3838
blocked for more than 120 seconds.
May 21 17:09:28 portablebastien kernel: [10080.754639] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:09:28 portablebastien kernel: [10080.757099] krunner       D
ffff8800dd8136c0     0  3838      1 0x00000000
May 21 17:09:28 portablebastien kernel: [10080.757107]  ffff880119784a40
0000000000000082 0000000000000000 ffff880117dc21c0
May 21 17:09:28 portablebastien kernel: [10080.757116]  00000000000136c0
ffff8800c948bfd8 00000000000136c0 00000000000136c0
May 21 17:09:28 portablebastien kernel: [10080.757126]  ffff880119784d18
ffff880119784d20 ffff880119784a40 00000000000136c0
May 21 17:09:28 portablebastien kernel: [10080.757135] Call Trace:
May 21 17:09:28 portablebastien kernel: [10080.757175]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:09:28 portablebastien kernel: [10080.757185]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:09:28 portablebastien kernel: [10080.757200]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:09:28 portablebastien kernel: [10080.757215]  [<ffffffffa02b3aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 21 17:09:28 portablebastien kernel: [10080.757229]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:09:28 portablebastien kernel: [10080.757243]  [<ffffffffa02a252f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 21 17:09:28 portablebastien kernel: [10080.757251]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 21 17:09:28 portablebastien kernel: [10080.757258]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 21 17:09:28 portablebastien kernel: [10080.757266]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 21 17:09:28 portablebastien kernel: [10080.757273]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 21 17:09:28 portablebastien kernel: [10080.757281]  [<ffffffff8125c21e>] ?
sock_aio_read+0xb6/0xc5
May 21 17:09:28 portablebastien kernel: [10080.757288]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 21 17:09:28 portablebastien kernel: [10080.757295]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 17:09:28 portablebastien kernel: [10080.757302]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 17:09:28 portablebastien kernel: [10080.757308]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 17:09:28 portablebastien kernel: [10080.757314]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 17:09:28 portablebastien kernel: [10080.757321]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 17:09:28 portablebastien kernel: [10080.757332] INFO: task
firefox-bin:3884 blocked for more than 120 seconds.
May 21 17:09:28 portablebastien kernel: [10080.759822] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:09:28 portablebastien kernel: [10080.762417] firefox-bin   D
ffff8800c2d721c0     0  3884   3544 0x00000000
May 21 17:09:28 portablebastien kernel: [10080.762424]  ffff8800c2d721c0
0000000000000086 0000000000000000 ffffffff8160b020
May 21 17:09:28 portablebastien kernel: [10080.762434]  00000000000136c0
ffff8800c2fcdfd8 00000000000136c0 00000000000136c0
May 21 17:09:28 portablebastien kernel: [10080.762443]  ffff8800c2d72498
ffff8800c2d724a0 ffff8800c2d721c0 00000000000136c0
May 21 17:09:28 portablebastien kernel: [10080.762453] Call Trace:
May 21 17:09:28 portablebastien kernel: [10080.762473]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:09:28 portablebastien kernel: [10080.762481]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:09:28 portablebastien kernel: [10080.762496]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:09:28 portablebastien kernel: [10080.762503]  [<ffffffff811035c5>] ?
d_instantiate+0x31/0x46
May 21 17:09:28 portablebastien kernel: [10080.762511]  [<ffffffff81132f58>] ?
__dquot_initialize+0x20/0x172
May 21 17:09:28 portablebastien kernel: [10080.762525]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:09:28 portablebastien kernel: [10080.762538]  [<ffffffffa0298c03>] ?
reiserfs_create+0xe6/0x205 [reiserfs]
May 21 17:09:28 portablebastien kernel: [10080.762545]  [<ffffffff810fb6ee>] ?
generic_permission+0xe/0x8a
May 21 17:09:28 portablebastien kernel: [10080.762551]  [<ffffffff810fc470>] ?
vfs_create+0x66/0x88
May 21 17:09:28 portablebastien kernel: [10080.762557]  [<ffffffff810fb9a1>] ?
d_alloc_and_lookup+0x4a/0x67
May 21 17:09:28 portablebastien kernel: [10080.762563]  [<ffffffff810fce1a>] ?
do_last+0x25f/0x526
May 21 17:09:28 portablebastien kernel: [10080.762568]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 21 17:09:28 portablebastien kernel: [10080.762576]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 21 17:09:28 portablebastien kernel: [10080.762582]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 17:11:28 portablebastien kernel: [10200.760197] INFO: task krunner:3838
blocked for more than 120 seconds.
May 21 17:11:28 portablebastien kernel: [10200.762733] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:11:28 portablebastien kernel: [10200.765324] krunner       D
ffff8800dd8136c0     0  3838      1 0x00000000
May 21 17:11:28 portablebastien kernel: [10200.765333]  ffff880119784a40
0000000000000082 0000000000000000 ffff880117dc21c0
May 21 17:11:28 portablebastien kernel: [10200.765344]  00000000000136c0
ffff8800c948bfd8 00000000000136c0 00000000000136c0
May 21 17:11:28 portablebastien kernel: [10200.765353]  ffff880119784d18
ffff880119784d20 ffff880119784a40 00000000000136c0
May 21 17:11:28 portablebastien kernel: [10200.765363] Call Trace:
May 21 17:11:28 portablebastien kernel: [10200.765404]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:11:28 portablebastien kernel: [10200.765414]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:11:28 portablebastien kernel: [10200.765429]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:11:28 portablebastien kernel: [10200.765444]  [<ffffffffa02b3aed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 21 17:11:28 portablebastien kernel: [10200.765458]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:11:28 portablebastien kernel: [10200.765473]  [<ffffffffa02a252f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 21 17:11:28 portablebastien kernel: [10200.765482]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 21 17:11:28 portablebastien kernel: [10200.765489]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 21 17:11:28 portablebastien kernel: [10200.765497]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 21 17:11:28 portablebastien kernel: [10200.765505]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 21 17:11:28 portablebastien kernel: [10200.765513]  [<ffffffff8125c21e>] ?
sock_aio_read+0xb6/0xc5
May 21 17:11:28 portablebastien kernel: [10200.765519]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 21 17:11:28 portablebastien kernel: [10200.765526]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 17:11:28 portablebastien kernel: [10200.765534]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 17:11:28 portablebastien kernel: [10200.765540]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 17:11:28 portablebastien kernel: [10200.765546]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 17:11:28 portablebastien kernel: [10200.765552]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 17:11:28 portablebastien kernel: [10200.765564] INFO: task
firefox-bin:3884 blocked for more than 120 seconds.
May 21 17:11:28 portablebastien kernel: [10200.768165] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 17:11:28 portablebastien kernel: [10200.770750] firefox-bin   D
ffff8800c2d721c0     0  3884   3544 0x00000000
May 21 17:11:28 portablebastien kernel: [10200.770757]  ffff8800c2d721c0
0000000000000086 0000000000000000 ffffffff8160b020
May 21 17:11:28 portablebastien kernel: [10200.770764]  00000000000136c0
ffff8800c2fcdfd8 00000000000136c0 00000000000136c0
May 21 17:11:28 portablebastien kernel: [10200.770770]  ffff8800c2d72498
ffff8800c2d724a0 ffff8800c2d721c0 00000000000136c0
May 21 17:11:28 portablebastien kernel: [10200.770777] Call Trace:
May 21 17:11:28 portablebastien kernel: [10200.770795]  [<ffffffffa02acb83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 17:11:28 portablebastien kernel: [10200.770801]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 17:11:28 portablebastien kernel: [10200.770815]  [<ffffffffa02b057c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 17:11:28 portablebastien kernel: [10200.770821]  [<ffffffff811035c5>] ?
d_instantiate+0x31/0x46
May 21 17:11:28 portablebastien kernel: [10200.770829]  [<ffffffff81132f58>] ?
__dquot_initialize+0x20/0x172
May 21 17:11:28 portablebastien kernel: [10200.770842]  [<ffffffffa02b0726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 17:11:28 portablebastien kernel: [10200.770855]  [<ffffffffa0298c03>] ?
reiserfs_create+0xe6/0x205 [reiserfs]
May 21 17:11:28 portablebastien kernel: [10200.770860]  [<ffffffff810fb6ee>] ?
generic_permission+0xe/0x8a
May 21 17:11:28 portablebastien kernel: [10200.770866]  [<ffffffff810fc470>] ?
vfs_create+0x66/0x88
May 21 17:11:28 portablebastien kernel: [10200.770871]  [<ffffffff810fb9a1>] ?
d_alloc_and_lookup+0x4a/0x67
May 21 17:11:28 portablebastien kernel: [10200.770875]  [<ffffffff810fce1a>] ?
do_last+0x25f/0x526
May 21 17:11:28 portablebastien kernel: [10200.770880]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 21 17:11:28 portablebastien kernel: [10200.770887]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 21 17:11:28 portablebastien kernel: [10200.770892]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
