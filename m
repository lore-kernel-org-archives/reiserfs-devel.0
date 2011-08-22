From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 22 Aug 2011 12:34:28 GMT
Message-ID: <201108221234.p7MCYSnZ004908@demeter2.kernel.org>
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
     Kernel Version|2.6.36,2.6.37,2.6.39        |2.6.36,2.6.37,2.6.39,3.0




--- Comment #38 from roucaries.bastien+kernel@gmail.com  2011-08-22 12:34:25 ---
Reproductible with 3.0 see trace:
Aug 22 12:05:21 portablebastien kernel: [53760.744138] INFO: task
x-www-browser:3507 blocked for more than 120 seconds.
Aug 22 12:05:21 portablebastien kernel: [53760.744144] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 22 12:05:21 portablebastien kernel: [53760.744149] x-www-browser   D
ffff8800cbd22830     0  3507   2908 0x00000000
Aug 22 12:05:21 portablebastien kernel: [53760.744157]  ffff8800cbd22830
0000000000000082 ffff880117e0ce80 ffff880000000000
Aug 22 12:05:21 portablebastien kernel: [53760.744165]  ffff88011af580c0
0000000000012800 ffff8800cbdaffd8 ffff8800cbdaffd8
Aug 22 12:05:21 portablebastien kernel: [53760.744172]  0000000000012800
ffff8800cbd22830 0000000000012800 0000000000012800
Aug 22 12:05:21 portablebastien kernel: [53760.744179] Call Trace:
Aug 22 12:05:21 portablebastien kernel: [53760.744192]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.744200]  [<ffffffff81335e18>] ?
__mutex_lock_common.clone.5+0x114/0x179
Aug 22 12:05:21 portablebastien kernel: [53760.744206]  [<ffffffff81335cf1>] ?
mutex_lock+0x1a/0x2d
Aug 22 12:05:21 portablebastien kernel: [53760.744212]  [<ffffffff8110686d>] ?
do_unlinkat+0x50/0x14d
Aug 22 12:05:21 portablebastien kernel: [53760.744218]  [<ffffffff810fbc23>] ?
vfs_read+0xb2/0xf2
Aug 22 12:05:21 portablebastien kernel: [53760.744223]  [<ffffffff810fbcc2>] ?
sys_read+0x5f/0x6b
Aug 22 12:05:21 portablebastien kernel: [53760.744231]  [<ffffffff8133ba92>] ?
system_call_fastpath+0x16/0x1b
Aug 22 12:05:21 portablebastien kernel: [53760.744236] INFO: task
konqueror:3510 blocked for more than 120 seconds.
Aug 22 12:05:21 portablebastien kernel: [53760.744240] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 22 12:05:21 portablebastien kernel: [53760.744244] konqueror       D
ffff8800cbe88870     0  3510   2908 0x00000000
Aug 22 12:05:21 portablebastien kernel: [53760.744250]  ffff8800cbe88870
0000000000000086 ffff880117e0ce80 ffff880000000000
Aug 22 12:05:21 portablebastien kernel: [53760.744257]  ffffffff8160b020
0000000000012800 ffff8800cd239fd8 ffff8800cd239fd8
Aug 22 12:05:21 portablebastien kernel: [53760.744264]  0000000000012800
ffff8800cbe88870 0000000000012800 0000000000012800
Aug 22 12:05:21 portablebastien kernel: [53760.744271] Call Trace:
Aug 22 12:05:21 portablebastien kernel: [53760.744277]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.744283]  [<ffffffff81335e18>] ?
__mutex_lock_common.clone.5+0x114/0x179
Aug 22 12:05:21 portablebastien kernel: [53760.744290]  [<ffffffff81335cf1>] ?
mutex_lock+0x1a/0x2d
Aug 22 12:05:21 portablebastien kernel: [53760.744294]  [<ffffffff8110686d>] ?
do_unlinkat+0x50/0x14d
Aug 22 12:05:21 portablebastien kernel: [53760.744300]  [<ffffffff810fbc23>] ?
vfs_read+0xb2/0xf2
Aug 22 12:05:21 portablebastien kernel: [53760.744304]  [<ffffffff810fbcc2>] ?
sys_read+0x5f/0x6b
Aug 22 12:05:21 portablebastien kernel: [53760.744310]  [<ffffffff8133ba92>] ?
system_call_fastpath+0x16/0x1b
Aug 22 12:05:21 portablebastien kernel: [53760.744315] INFO: task
konqueror:3511 blocked for more than 120 seconds.
Aug 22 12:05:21 portablebastien kernel: [53760.744318] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 22 12:05:21 portablebastien kernel: [53760.744322] konqueror       D
ffff8800cbe88180     0  3511   2908 0x00000000
Aug 22 12:05:21 portablebastien kernel: [53760.744328]  ffff8800cbe88180
0000000000000082 ffff880117e0ce80 ffff8800d2b83080
Aug 22 12:05:21 portablebastien kernel: [53760.744335]  ffff8800cbd22830
0000000000012800 ffff8800cbf2bfd8 ffff8800cbf2bfd8
Aug 22 12:05:21 portablebastien kernel: [53760.744342]  0000000000012800
ffff8800cbe88180 0000000000012800 0000000000012800
Aug 22 12:05:21 portablebastien kernel: [53760.744349] Call Trace:
Aug 22 12:05:21 portablebastien kernel: [53760.744355]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Aug 22 12:05:21 portablebastien kernel: [53760.744360]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.744366]  [<ffffffff81335e18>] ?
__mutex_lock_common.clone.5+0x114/0x179
Aug 22 12:05:21 portablebastien kernel: [53760.744372]  [<ffffffff81335cf1>] ?
mutex_lock+0x1a/0x2d
Aug 22 12:05:21 portablebastien kernel: [53760.744377]  [<ffffffff8110686d>] ?
do_unlinkat+0x50/0x14d
Aug 22 12:05:21 portablebastien kernel: [53760.744382]  [<ffffffff810fbc23>] ?
vfs_read+0xb2/0xf2
Aug 22 12:05:21 portablebastien kernel: [53760.744387]  [<ffffffff810fbcc2>] ?
sys_read+0x5f/0x6b
Aug 22 12:05:21 portablebastien kernel: [53760.744392]  [<ffffffff8133ba92>] ?
system_call_fastpath+0x16/0x1b
Aug 22 12:05:21 portablebastien kernel: [53760.744397] INFO: task
konqueror:3512 blocked for more than 120 seconds.
Aug 22 12:05:21 portablebastien kernel: [53760.744401] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 22 12:05:21 portablebastien kernel: [53760.744405] konqueror       D
ffff8800cbfbb690     0  3512   2908 0x00000000
Aug 22 12:05:21 portablebastien kernel: [53760.744411]  ffff8800cbfbb690
0000000000000082 ffff880117e0ce80 ffff8800d2b83080
Aug 22 12:05:21 portablebastien kernel: [53760.744418]  ffff8800cbe88870
0000000000012800 ffff8800cbfb7fd8 ffff8800cbfb7fd8
Aug 22 12:05:21 portablebastien kernel: [53760.744425]  0000000000012800
ffff8800cbfbb690 0000000000012800 0000000000012800
Aug 22 12:05:21 portablebastien kernel: [53760.744432] Call Trace:
Aug 22 12:05:21 portablebastien kernel: [53760.744438]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Aug 22 12:05:21 portablebastien kernel: [53760.744443]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.744449]  [<ffffffff81335e18>] ?
__mutex_lock_common.clone.5+0x114/0x179
Aug 22 12:05:21 portablebastien kernel: [53760.744455]  [<ffffffff81335cf1>] ?
mutex_lock+0x1a/0x2d
Aug 22 12:05:21 portablebastien kernel: [53760.744460]  [<ffffffff8110686d>] ?
do_unlinkat+0x50/0x14d
Aug 22 12:05:21 portablebastien kernel: [53760.744465]  [<ffffffff810fbc23>] ?
vfs_read+0xb2/0xf2
Aug 22 12:05:21 portablebastien kernel: [53760.744470]  [<ffffffff810fbcc2>] ?
sys_read+0x5f/0x6b
Aug 22 12:05:21 portablebastien kernel: [53760.744475]  [<ffffffff8133ba92>] ?
system_call_fastpath+0x16/0x1b
Aug 22 12:05:21 portablebastien kernel: [53760.744481] INFO: task
konqueror:3513 blocked for more than 120 seconds.
Aug 22 12:05:21 portablebastien kernel: [53760.744484] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 22 12:05:21 portablebastien kernel: [53760.744488] konqueror       D
ffff8800d1d97750     0  3513   2908 0x00000000
Aug 22 12:05:21 portablebastien kernel: [53760.744494]  ffff8800d1d97750
0000000000000082 ffff880117e0ce80 ffff880000000000
Aug 22 12:05:21 portablebastien kernel: [53760.744501]  ffffffff8160b020
0000000000012800 ffff8800c9471fd8 ffff8800c9471fd8
Aug 22 12:05:21 portablebastien kernel: [53760.744508]  0000000000012800
ffff8800d1d97750 0000000000012800 0000000000012800
Aug 22 12:05:21 portablebastien kernel: [53760.744515] Call Trace:
Aug 22 12:05:21 portablebastien kernel: [53760.744521]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.744527]  [<ffffffff81335e18>] ?
__mutex_lock_common.clone.5+0x114/0x179
Aug 22 12:05:21 portablebastien kernel: [53760.744533]  [<ffffffff81335cf1>] ?
mutex_lock+0x1a/0x2d
Aug 22 12:05:21 portablebastien kernel: [53760.744538]  [<ffffffff8110686d>] ?
do_unlinkat+0x50/0x14d
Aug 22 12:05:21 portablebastien kernel: [53760.744543]  [<ffffffff810fbc23>] ?
vfs_read+0xb2/0xf2
Aug 22 12:05:21 portablebastien kernel: [53760.744548]  [<ffffffff810fbcc2>] ?
sys_read+0x5f/0x6b
Aug 22 12:05:21 portablebastien kernel: [53760.744553]  [<ffffffff8133ba92>] ?
system_call_fastpath+0x16/0x1b
Aug 22 12:05:21 portablebastien kernel: [53760.744563] INFO: task
konqueror:3602 blocked for more than 120 seconds.
Aug 22 12:05:21 portablebastien kernel: [53760.744567] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 22 12:05:21 portablebastien kernel: [53760.744570] konqueror       D
ffff8800d8530fe0     0  3602   2908 0x00000000
Aug 22 12:05:21 portablebastien kernel: [53760.744577]  ffff8800d8530fe0
0000000000000082 0000000000000000 0000000000000000
Aug 22 12:05:21 portablebastien kernel: [53760.744584]  ffffffff8160b020
0000000000012800 ffff8800d87e7fd8 ffff8800d87e7fd8
Aug 22 12:05:21 portablebastien kernel: [53760.744591]  0000000000012800
ffff8800d8530fe0 0000000000012800 0000000000012800
Aug 22 12:05:21 portablebastien kernel: [53760.744598] Call Trace:
Aug 22 12:05:21 portablebastien kernel: [53760.744604]  [<ffffffff81109605>] ?
poll_freewait+0x8c/0x8c
Aug 22 12:05:21 portablebastien kernel: [53760.744640]  [<ffffffffa029217b>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.744647]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Aug 22 12:05:21 portablebastien kernel: [53760.744663]  [<ffffffffa0296e03>] ?
do_journal_begin_r+0x1a1/0x280 [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.744672]  [<ffffffff8113b53f>] ?
dquot_active+0x19/0x3a
Aug 22 12:05:21 portablebastien kernel: [53760.744688]  [<ffffffffa0296f9d>] ?
journal_begin+0xbb/0xf7 [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.744702]  [<ffffffffa027e1b8>] ?
reiserfs_unlink+0x7d/0x279 [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.744709]  [<ffffffff81111b05>] ?
mntput_no_expire+0x21/0xd5
Aug 22 12:05:21 portablebastien kernel: [53760.744715]  [<ffffffff8110669e>] ?
path_lookupat+0x31b/0x335
Aug 22 12:05:21 portablebastien kernel: [53760.744720]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Aug 22 12:05:21 portablebastien kernel: [53760.744725]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.744731]  [<ffffffff8133565f>] ?
_cond_resched+0x9/0x20
Aug 22 12:05:21 portablebastien kernel: [53760.744736]  [<ffffffff81104523>] ?
inode_permission+0x60/0xc6
Aug 22 12:05:21 portablebastien kernel: [53760.744741]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Aug 22 12:05:21 portablebastien kernel: [53760.744747]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.744752]  [<ffffffff81104706>] ?
vfs_unlink+0x65/0xbe
Aug 22 12:05:21 portablebastien kernel: [53760.744756]  [<ffffffff811068e3>] ?
do_unlinkat+0xc6/0x14d
Aug 22 12:05:21 portablebastien kernel: [53760.744762]  [<ffffffff810fbc23>] ?
vfs_read+0xb2/0xf2
Aug 22 12:05:21 portablebastien kernel: [53760.744766]  [<ffffffff810fbcc2>] ?
sys_read+0x5f/0x6b
Aug 22 12:05:21 portablebastien kernel: [53760.744772]  [<ffffffff8133ba92>] ?
system_call_fastpath+0x16/0x1b
Aug 22 12:05:21 portablebastien kernel: [53760.744785] INFO: task
konqueror:6686 blocked for more than 120 seconds.
Aug 22 12:05:21 portablebastien kernel: [53760.744788] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 22 12:05:21 portablebastien kernel: [53760.744792] konqueror       D
ffff8800c77929b0     0  6686   3437 0x00000000
Aug 22 12:05:21 portablebastien kernel: [53760.744799]  ffff8800c77929b0
0000000000000082 ffff880117e0ce80 ffff880000000000
Aug 22 12:05:21 portablebastien kernel: [53760.744806]  ffff88011af580c0
0000000000012800 ffff880089523fd8 ffff880089523fd8
Aug 22 12:05:21 portablebastien kernel: [53760.744813]  0000000000012800
ffff8800c77929b0 0000000000012800 0000000000012800
Aug 22 12:05:21 portablebastien kernel: [53760.744820] Call Trace:
Aug 22 12:05:21 portablebastien kernel: [53760.744825]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.744832]  [<ffffffff81335e18>] ?
__mutex_lock_common.clone.5+0x114/0x179
Aug 22 12:05:21 portablebastien kernel: [53760.744838]  [<ffffffff81335cf1>] ?
mutex_lock+0x1a/0x2d
Aug 22 12:05:21 portablebastien kernel: [53760.744843]  [<ffffffff8110686d>] ?
do_unlinkat+0x50/0x14d
Aug 22 12:05:21 portablebastien kernel: [53760.744848]  [<ffffffff810fc8b0>] ?
fput+0x1a/0x1a2
Aug 22 12:05:21 portablebastien kernel: [53760.744853]  [<ffffffff810fbcc2>] ?
sys_read+0x5f/0x6b
Aug 22 12:05:21 portablebastien kernel: [53760.744858]  [<ffffffff8133ba92>] ?
system_call_fastpath+0x16/0x1b
Aug 22 12:05:21 portablebastien kernel: [53760.744877] INFO: task
konqueror:31954 blocked for more than 120 seconds.
Aug 22 12:05:21 portablebastien kernel: [53760.744881] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 22 12:05:21 portablebastien kernel: [53760.744884] konqueror       D
ffff8800b128f610     0 31954   2908 0x00000000
Aug 22 12:05:21 portablebastien kernel: [53760.744893]  ffff8800b128f610
0000000000000086 ffff880117e0ce80 ffff8800d2b83080
Aug 22 12:05:21 portablebastien kernel: [53760.744900]  ffff8800cbe88180
0000000000012800 ffff88003e141fd8 ffff88003e141fd8
Aug 22 12:05:21 portablebastien kernel: [53760.744907]  0000000000012800
ffff8800b128f610 0000000000012800 0000000000012800
Aug 22 12:05:21 portablebastien kernel: [53760.744914] Call Trace:
Aug 22 12:05:21 portablebastien kernel: [53760.744920]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Aug 22 12:05:21 portablebastien kernel: [53760.744925]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.744931]  [<ffffffff81335e18>] ?
__mutex_lock_common.clone.5+0x114/0x179
Aug 22 12:05:21 portablebastien kernel: [53760.744937]  [<ffffffff81335cf1>] ?
mutex_lock+0x1a/0x2d
Aug 22 12:05:21 portablebastien kernel: [53760.744942]  [<ffffffff8110686d>] ?
do_unlinkat+0x50/0x14d
Aug 22 12:05:21 portablebastien kernel: [53760.744947]  [<ffffffff810fc8b0>] ?
fput+0x1a/0x1a2
Aug 22 12:05:21 portablebastien kernel: [53760.744952]  [<ffffffff810fbcc2>] ?
sys_read+0x5f/0x6b
Aug 22 12:05:21 portablebastien kernel: [53760.744958]  [<ffffffff8133ba92>] ?
system_call_fastpath+0x16/0x1b
Aug 22 12:05:21 portablebastien kernel: [53760.744966] INFO: task cc1:18172
blocked for more than 120 seconds.
Aug 22 12:05:21 portablebastien kernel: [53760.744970] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 22 12:05:21 portablebastien kernel: [53760.744973] cc1             D
ffff88011af29550     0 18172  18171 0x00000000
Aug 22 12:05:21 portablebastien kernel: [53760.744980]  ffff88011af29550
0000000000000082 ffff88010047b9a8 0000000000000000
Aug 22 12:05:21 portablebastien kernel: [53760.744987]  ffffffff8160b020
0000000000012800 ffff88010047bfd8 ffff88010047bfd8
Aug 22 12:05:21 portablebastien kernel: [53760.744994]  0000000000012800
ffff88011af29550 0000000000012800 0000000000012800
Aug 22 12:05:21 portablebastien kernel: [53760.745001] Call Trace:
Aug 22 12:05:21 portablebastien kernel: [53760.745018]  [<ffffffffa029217b>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.745024]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Aug 22 12:05:21 portablebastien kernel: [53760.745040]  [<ffffffffa0296e03>] ?
do_journal_begin_r+0x1a1/0x280 [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.745056]  [<ffffffffa0296f9d>] ?
journal_begin+0xbb/0xf7 [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.745071]  [<ffffffffa0280e1c>] ?
reiserfs_truncate_file+0x16f/0x26e [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.745077]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Aug 22 12:05:21 portablebastien kernel: [53760.745083]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.745097]  [<ffffffffa0283dfa>] ?
reiserfs_vfs_truncate_file+0x22/0x30 [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.745104]  [<ffffffff810bfda0>] ?
vmtruncate+0x33/0x3b
Aug 22 12:05:21 portablebastien kernel: [53760.745119]  [<ffffffffa0283d6a>] ?
reiserfs_setattr+0x253/0x2c1 [reiserfs]
Aug 22 12:05:21 portablebastien kernel: [53760.745126]  [<ffffffff810b54ad>] ?
generic_file_buffered_write+0x1b8/0x219
Aug 22 12:05:21 portablebastien kernel: [53760.745133]  [<ffffffff8110cb3c>] ?
__d_lookup_rcu+0xb6/0xf2
Aug 22 12:05:21 portablebastien kernel: [53760.745139]  [<ffffffff810ba536>] ?
get_pageblock_flags_group+0x3f/0x76
Aug 22 12:05:21 portablebastien kernel: [53760.745145]  [<ffffffff8104ad82>] ?
current_fs_time+0x1e/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.745150]  [<ffffffff8110f6db>] ?
notify_change+0x1a7/0x291
Aug 22 12:05:21 portablebastien kernel: [53760.745156]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Aug 22 12:05:21 portablebastien kernel: [53760.745163]  [<ffffffff810fa6a9>] ?
do_truncate+0x65/0x80
Aug 22 12:05:21 portablebastien kernel: [53760.745168]  [<ffffffff810fa353>] ?
__dentry_open+0x1a7/0x29c
Aug 22 12:05:21 portablebastien kernel: [53760.745173]  [<ffffffff811058d3>] ?
do_last+0x4df/0x584
Aug 22 12:05:21 portablebastien kernel: [53760.745178]  [<ffffffff81106bea>] ?
path_openat+0xc7/0x349
Aug 22 12:05:21 portablebastien kernel: [53760.745184]  [<ffffffff810d0312>] ?
tlb_flush_mmu+0x37/0x50
Aug 22 12:05:21 portablebastien kernel: [53760.745190]  [<ffffffff81106e98>] ?
do_filp_open+0x2c/0x72
Aug 22 12:05:21 portablebastien kernel: [53760.745196]  [<ffffffff8133565f>] ?
_cond_resched+0x9/0x20
Aug 22 12:05:21 portablebastien kernel: [53760.745203]  [<ffffffff811ac741>] ?
__strncpy_from_user+0x19/0x4a
Aug 22 12:05:21 portablebastien kernel: [53760.745208]  [<ffffffff81110208>] ?
alloc_fd+0x69/0x110
Aug 22 12:05:21 portablebastien kernel: [53760.745214]  [<ffffffff810fb138>] ?
do_sys_open+0x5f/0xe6
Aug 22 12:05:21 portablebastien kernel: [53760.745220]  [<ffffffff8133ba92>] ?
system_call_fastpath+0x16/0x1b

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
