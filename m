From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sat, 21 May 2011 14:37:04 GMT
Message-ID: <201105211437.p4LEb4tb013911@demeter2.kernel.org>
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


roucaries.bastien+kernel@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|2.6.36                      |2.6.36,2.6.37




--- Comment #16 from roucaries.bastien+kernel@gmail.com  2011-05-21 14:36:59 ---
I achieved to reproduce on 2.6.37,
new trace:
May 21 14:18:00 portablebastien kernel: [63360.729426] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:18:00 portablebastien kernel: [63360.730680] kglobalaccel  D
ffff8800dd9136c0     0 16193      1 0x00000000
May 21 14:18:00 portablebastien kernel: [63360.730689]  ffff88002f2ba1c0
0000000000000086 0000000000000000 ffff88007ddeb600
May 21 14:18:00 portablebastien kernel: [63360.730696]  00000000000136c0
ffff880036c95fd8 00000000000136c0 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.730703]  ffff88002f2ba498
ffff88002f2ba4a0 ffff88002f2ba1c0 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.730710] Call Trace:
May 21 14:18:00 portablebastien kernel: [63360.730724]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 14:18:00 portablebastien kernel: [63360.730764]  [<ffffffffa02d7b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.730771]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 14:18:00 portablebastien kernel: [63360.730785]  [<ffffffffa02db57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.730799]  [<ffffffffa02deaed>] ?
xattr_lookup+0x17/0xef [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.730813]  [<ffffffffa02db726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.730826]  [<ffffffffa02cd52f>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.730833]  [<ffffffff8104b676>] ?
current_fs_time+0x1e/0x24
May 21 14:18:00 portablebastien kernel: [63360.730839]  [<ffffffff8110f04b>] ?
__mark_inode_dirty+0x27/0x1ac
May 21 14:18:00 portablebastien kernel: [63360.730846]  [<ffffffff81104c94>] ?
file_update_time+0xf6/0x121
May 21 14:18:00 portablebastien kernel: [63360.730853]  [<ffffffff810b61c1>] ?
__generic_file_aio_write+0x164/0x280
May 21 14:18:00 portablebastien kernel: [63360.730860]  [<ffffffff8125c21e>] ?
sock_aio_read+0xb6/0xc5
May 21 14:18:00 portablebastien kernel: [63360.730866]  [<ffffffff810b6332>] ?
generic_file_aio_write+0x55/0x9f
May 21 14:18:00 portablebastien kernel: [63360.730872]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 14:18:00 portablebastien kernel: [63360.730878]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 14:18:00 portablebastien kernel: [63360.730883]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 14:18:00 portablebastien kernel: [63360.730888]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 14:18:00 portablebastien kernel: [63360.730894]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 14:18:00 portablebastien kernel: [63360.730901] INFO: task krunner:16219
blocked for more than 120 seconds.
May 21 14:18:00 portablebastien kernel: [63360.732085] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:18:00 portablebastien kernel: [63360.733226] krunner       D
ffff8800dd8136c0     0 16219      1 0x00000000
May 21 14:18:00 portablebastien kernel: [63360.733233]  ffff880095dbde80
0000000000000086 0000004000000000 ffff88007ddef2c0
May 21 14:18:00 portablebastien kernel: [63360.733240]  00000000000136c0
ffff880076453fd8 00000000000136c0 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.733246]  ffff880095dbe158
ffff880095dbe160 ffff880095dbde80 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.733252] Call Trace:
May 21 14:18:00 portablebastien kernel: [63360.733259]  [<ffffffff81100bc8>] ?
pollwake+0x0/0x4e
May 21 14:18:00 portablebastien kernel: [63360.733265]  [<ffffffff8131e74d>] ?
__mutex_lock_common+0x127/0x193
May 21 14:18:00 portablebastien kernel: [63360.733271]  [<ffffffff8125c21e>] ?
sock_aio_read+0xb6/0xc5
May 21 14:18:00 portablebastien kernel: [63360.733276]  [<ffffffff8131e885>] ?
mutex_lock+0x1a/0x33
May 21 14:18:00 portablebastien kernel: [63360.733282]  [<ffffffff810b631d>] ?
generic_file_aio_write+0x40/0x9f
May 21 14:18:00 portablebastien kernel: [63360.733288]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 14:18:00 portablebastien kernel: [63360.733293]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 14:18:00 portablebastien kernel: [63360.733298]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 14:18:00 portablebastien kernel: [63360.733303]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 14:18:00 portablebastien kernel: [63360.733308]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 14:18:00 portablebastien kernel: [63360.733318] INFO: task konsole:16274
blocked for more than 120 seconds.
May 21 14:18:00 portablebastien kernel: [63360.734470] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:18:00 portablebastien kernel: [63360.735647] konsole       D
ffff8800d04e1440     0 16274      1 0x00000000
May 21 14:18:00 portablebastien kernel: [63360.735653]  ffff8800d04e1440
0000000000000082 ffff880000000000 ffffffff8160b020
May 21 14:18:00 portablebastien kernel: [63360.735660]  00000000000136c0
ffff880044c5dfd8 00000000000136c0 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.735666]  ffff8800d04e1718
ffff8800d04e1720 ffff8800d04e1440 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.735673] Call Trace:
May 21 14:18:00 portablebastien kernel: [63360.735689]  [<ffffffffa02d7b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.735696]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 14:18:00 portablebastien kernel: [63360.735710]  [<ffffffffa02db57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.735716]  [<ffffffff811035c5>] ?
d_instantiate+0x31/0x46
May 21 14:18:00 portablebastien kernel: [63360.735723]  [<ffffffff81132f58>] ?
__dquot_initialize+0x20/0x172
May 21 14:18:00 portablebastien kernel: [63360.735737]  [<ffffffffa02db726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.735749]  [<ffffffffa02c3c03>] ?
reiserfs_create+0xe6/0x205 [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.735755]  [<ffffffff810fb6ee>] ?
generic_permission+0xe/0x8a
May 21 14:18:00 portablebastien kernel: [63360.735760]  [<ffffffff810fc470>] ?
vfs_create+0x66/0x88
May 21 14:18:00 portablebastien kernel: [63360.735765]  [<ffffffff810fb9a1>] ?
d_alloc_and_lookup+0x4a/0x67
May 21 14:18:00 portablebastien kernel: [63360.735770]  [<ffffffff810fce1a>] ?
do_last+0x25f/0x526
May 21 14:18:00 portablebastien kernel: [63360.735775]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 21 14:18:00 portablebastien kernel: [63360.735781]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 21 14:18:00 portablebastien kernel: [63360.735786]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 14:18:00 portablebastien kernel: [63360.735792] INFO: task
firefox-bin:16275 blocked for more than 120 seconds.
May 21 14:18:00 portablebastien kernel: [63360.736992] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:18:00 portablebastien kernel: [63360.738217] firefox-bin   D
ffff8800d04e57c0     0 16275  16158 0x00000004
May 21 14:18:00 portablebastien kernel: [63360.738223]  ffff8800d04e57c0
0000000000000082 0000000000000041 ffffffff8160b020
May 21 14:18:00 portablebastien kernel: [63360.738230]  00000000000136c0
ffff8800d0473fd8 00000000000136c0 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.738236]  ffff8800d04e5a98
ffff8800d04e5aa0 ffff8800d04e57c0 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.738243] Call Trace:
May 21 14:18:00 portablebastien kernel: [63360.738250]  [<ffffffff810bb2e4>] ?
get_page_from_freelist+0x538/0x733
May 21 14:18:00 portablebastien kernel: [63360.738265]  [<ffffffffa02d7b83>] ?
queue_log_writer+0x7e/0xac [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.738272]  [<ffffffff8104322f>] ?
default_wake_function+0x0/0xe
May 21 14:18:00 portablebastien kernel: [63360.738286]  [<ffffffffa02db57c>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.738292]  [<ffffffff811035c5>] ?
d_instantiate+0x31/0x46
May 21 14:18:00 portablebastien kernel: [63360.738298]  [<ffffffff81132f58>] ?
__dquot_initialize+0x20/0x172
May 21 14:18:00 portablebastien kernel: [63360.738311]  [<ffffffffa02db726>] ?
journal_begin+0xbd/0xfa [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.738324]  [<ffffffffa02c3c03>] ?
reiserfs_create+0xe6/0x205 [reiserfs]
May 21 14:18:00 portablebastien kernel: [63360.738329]  [<ffffffff810fb6ee>] ?
generic_permission+0xe/0x8a
May 21 14:18:00 portablebastien kernel: [63360.738334]  [<ffffffff810fc470>] ?
vfs_create+0x66/0x88
May 21 14:18:00 portablebastien kernel: [63360.738339]  [<ffffffff810fb9a1>] ?
d_alloc_and_lookup+0x4a/0x67
May 21 14:18:00 portablebastien kernel: [63360.738344]  [<ffffffff810fce1a>] ?
do_last+0x25f/0x526
May 21 14:18:00 portablebastien kernel: [63360.738349]  [<ffffffff810fea8d>] ?
do_filp_open+0x1e2/0x538
May 21 14:18:00 portablebastien kernel: [63360.738355]  [<ffffffff810f1f70>] ?
do_sys_open+0x56/0xde
May 21 14:18:00 portablebastien kernel: [63360.738360]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 14:18:00 portablebastien kernel: [63360.738365] INFO: task
firefox-bin:16343 blocked for more than 120 seconds.
May 21 14:18:00 portablebastien kernel: [63360.739632] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:18:00 portablebastien kernel: [63360.740973] firefox-bin   D
ffff8800dd9136c0     0 16343  16158 0x00000000
May 21 14:18:00 portablebastien kernel: [63360.740980]  ffff8800b93dca40
0000000000000082 0000000000000010 ffff88010fb5f2c0
May 21 14:18:00 portablebastien kernel: [63360.740986]  00000000000136c0
ffff88006d03ffd8 00000000000136c0 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.740994]  ffff8800b93dcd18
ffff8800b93dcd20 ffff8800b93dca40 00000000000136c0
May 21 14:18:00 portablebastien kernel: [63360.741004] Call Trace:
May 21 14:18:00 portablebastien kernel: [63360.741011]  [<ffffffff8110333c>] ?
dput+0x2c/0x12f
May 21 14:18:00 portablebastien kernel: [63360.741018]  [<ffffffff8131e74d>] ?
__mutex_lock_common+0x127/0x193
May 21 14:18:00 portablebastien kernel: [63360.741024]  [<ffffffff8131e885>] ?
mutex_lock+0x1a/0x33
May 21 14:18:00 portablebastien kernel: [63360.741030]  [<ffffffff810fe073>] ?
do_unlinkat+0x52/0x157
May 21 14:18:00 portablebastien kernel: [63360.741038]  [<ffffffff8131fa95>] ?
page_fault+0x25/0x30
May 21 14:18:00 portablebastien kernel: [63360.741043]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 14:20:00 portablebastien kernel: [63480.740134] INFO: task
kdeinit4:16158 blocked for more than 120 seconds.
May 21 14:20:00 portablebastien kernel: [63480.744377] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:20:00 portablebastien kernel: [63480.746337] kdeinit4      D
ffff8800dd9136c0     0 16158      1 0x00000000
May 21 14:20:00 portablebastien kernel: [63480.746344]  ffff8800c208b600
0000000000000082 ffff8800a164ba80 ffff8800c208d7c0
May 21 14:20:00 portablebastien kernel: [63480.746352]  00000000000136c0
ffff880119a65fd8 00000000000136c0 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.746359]  ffff8800c208b8d8
ffff8800c208b8e0 ffff8800c208b600 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.746366] Call Trace:
May 21 14:20:00 portablebastien kernel: [63480.746380]  [<ffffffff810d79c6>] ?
page_move_anon_rmap+0x1e/0x29
May 21 14:20:00 portablebastien kernel: [63480.746388]  [<ffffffff8131e74d>] ?
__mutex_lock_common+0x127/0x193
May 21 14:20:00 portablebastien kernel: [63480.746393]  [<ffffffff8131e885>] ?
mutex_lock+0x1a/0x33
May 21 14:20:00 portablebastien kernel: [63480.746400]  [<ffffffff810b631d>] ?
generic_file_aio_write+0x40/0x9f
May 21 14:20:00 portablebastien kernel: [63480.746406]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 14:20:00 portablebastien kernel: [63480.746412]  [<ffffffff8103bcd1>] ?
enqueue_task_fair+0x21/0x62
May 21 14:20:00 portablebastien kernel: [63480.746419]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 14:20:00 portablebastien kernel: [63480.746424]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 14:20:00 portablebastien kernel: [63480.746429]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 14:20:00 portablebastien kernel: [63480.746435]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 14:20:00 portablebastien kernel: [63480.746440] INFO: task kded4:16161
blocked for more than 120 seconds.
May 21 14:20:00 portablebastien kernel: [63480.748399] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:20:00 portablebastien kernel: [63480.750368] kded4         D
ffff8800c208d7c0     0 16161      1 0x00000000
May 21 14:20:00 portablebastien kernel: [63480.750374]  ffff8800c208d7c0
0000000000000082 0000004000000000 ffff88011b65ca40
May 21 14:20:00 portablebastien kernel: [63480.750381]  00000000000136c0
ffff880112c6ffd8 00000000000136c0 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.750387]  ffff8800c208da98
ffff8800c208daa0 ffff8800c208d7c0 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.750394] Call Trace:
May 21 14:20:00 portablebastien kernel: [63480.750400]  [<ffffffff81100bc8>] ?
pollwake+0x0/0x4e
May 21 14:20:00 portablebastien kernel: [63480.750406]  [<ffffffff8131e74d>] ?
__mutex_lock_common+0x127/0x193
May 21 14:20:00 portablebastien kernel: [63480.750413]  [<ffffffff8125c21e>] ?
sock_aio_read+0xb6/0xc5
May 21 14:20:00 portablebastien kernel: [63480.750418]  [<ffffffff8131e885>] ?
mutex_lock+0x1a/0x33
May 21 14:20:00 portablebastien kernel: [63480.750424]  [<ffffffff810b631d>] ?
generic_file_aio_write+0x40/0x9f
May 21 14:20:00 portablebastien kernel: [63480.750429]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 14:20:00 portablebastien kernel: [63480.750434]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 14:20:00 portablebastien kernel: [63480.750440]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 14:20:00 portablebastien kernel: [63480.750444]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 14:20:00 portablebastien kernel: [63480.750449]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 14:20:00 portablebastien kernel: [63480.750454] INFO: task
kwalletd:16175 blocked for more than 120 seconds.
May 21 14:20:00 portablebastien kernel: [63480.752480] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:20:00 portablebastien kernel: [63480.754493] kwalletd      D
ffff8800c2089440     0 16175      1 0x00000000
May 21 14:20:00 portablebastien kernel: [63480.754499]  ffff8800c2089440
0000000000000086 ffff880000000000 ffffffff8160b020
May 21 14:20:00 portablebastien kernel: [63480.754506]  00000000000136c0
ffff8801114cbfd8 00000000000136c0 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.754512]  ffff8800c2089718
ffff8800c2089720 ffff8800c2089440 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.754519] Call Trace:
May 21 14:20:00 portablebastien kernel: [63480.754525]  [<ffffffff8131e74d>] ?
__mutex_lock_common+0x127/0x193
May 21 14:20:00 portablebastien kernel: [63480.754531]  [<ffffffff8131e885>] ?
mutex_lock+0x1a/0x33
May 21 14:20:00 portablebastien kernel: [63480.754536]  [<ffffffff810b631d>] ?
generic_file_aio_write+0x40/0x9f
May 21 14:20:00 portablebastien kernel: [63480.754541]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 14:20:00 portablebastien kernel: [63480.754547]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 14:20:00 portablebastien kernel: [63480.754552]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 14:20:00 portablebastien kernel: [63480.754557]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 14:20:00 portablebastien kernel: [63480.754562]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 14:20:00 portablebastien kernel: [63480.754567] INFO: task
ksmserver:16179 blocked for more than 120 seconds.
May 21 14:20:00 portablebastien kernel: [63480.756617] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:20:00 portablebastien kernel: [63480.758707] ksmserver     D
ffff88007ddeb600     0 16179  16158 0x00000004
May 21 14:20:00 portablebastien kernel: [63480.758713]  ffff88007ddeb600
0000000000000082 ffff880000000000 ffff88011b65ca40
May 21 14:20:00 portablebastien kernel: [63480.758720]  00000000000136c0
ffff8800c6513fd8 00000000000136c0 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.758726]  ffff88007ddeb8d8
ffff88007ddeb8e0 ffff88007ddeb600 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.758732] Call Trace:
May 21 14:20:00 portablebastien kernel: [63480.758739]  [<ffffffff8131e74d>] ?
__mutex_lock_common+0x127/0x193
May 21 14:20:00 portablebastien kernel: [63480.758745]  [<ffffffff8131e885>] ?
mutex_lock+0x1a/0x33
May 21 14:20:00 portablebastien kernel: [63480.758750]  [<ffffffff810b631d>] ?
generic_file_aio_write+0x40/0x9f
May 21 14:20:00 portablebastien kernel: [63480.758755]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 14:20:00 portablebastien kernel: [63480.758761]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 14:20:00 portablebastien kernel: [63480.758766]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 14:20:00 portablebastien kernel: [63480.758771]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 14:20:00 portablebastien kernel: [63480.758776]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b
May 21 14:20:00 portablebastien kernel: [63480.758781] INFO: task kwin:16181
blocked for more than 120 seconds.
May 21 14:20:00 portablebastien kernel: [63480.760891] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 21 14:20:00 portablebastien kernel: [63480.763018] kwin          D
ffff88007ddef2c0     0 16181  16179 0x00000000
May 21 14:20:00 portablebastien kernel: [63480.763024]  ffff88007ddef2c0
0000000000000082 0000004000000000 ffff88011b65ca40
May 21 14:20:00 portablebastien kernel: [63480.763031]  00000000000136c0
ffff8800b924dfd8 00000000000136c0 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.763038]  ffff88007ddef598
ffff88007ddef5a0 ffff88007ddef2c0 00000000000136c0
May 21 14:20:00 portablebastien kernel: [63480.763044] Call Trace:
May 21 14:20:00 portablebastien kernel: [63480.763050]  [<ffffffff81100bc8>] ?
pollwake+0x0/0x4e
May 21 14:20:00 portablebastien kernel: [63480.763056]  [<ffffffff8131e74d>] ?
__mutex_lock_common+0x127/0x193
May 21 14:20:00 portablebastien kernel: [63480.763062]  [<ffffffff8125c21e>] ?
sock_aio_read+0xb6/0xc5
May 21 14:20:00 portablebastien kernel: [63480.763067]  [<ffffffff8131e885>] ?
mutex_lock+0x1a/0x33
May 21 14:20:00 portablebastien kernel: [63480.763073]  [<ffffffff810b631d>] ?
generic_file_aio_write+0x40/0x9f
May 21 14:20:00 portablebastien kernel: [63480.763078]  [<ffffffff810f33bb>] ?
do_sync_write+0xb1/0xea
May 21 14:20:00 portablebastien kernel: [63480.763083]  [<ffffffff8115a9f6>] ?
security_file_permission+0x18/0x2d
May 21 14:20:00 portablebastien kernel: [63480.763089]  [<ffffffff810f3909>] ?
vfs_write+0xa4/0x100
May 21 14:20:00 portablebastien kernel: [63480.763093]  [<ffffffff810f3a18>] ?
sys_write+0x45/0x6b
May 21 14:20:00 portablebastien kernel: [63480.763099]  [<ffffffff81009a12>] ?
system_call_fastpath+0x16/0x1b

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
