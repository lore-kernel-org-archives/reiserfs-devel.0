From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Thu, 8 Sep 2011 12:48:39 GMT
Message-ID: <201109081248.p88Cmdm2014331@demeter2.kernel.org>
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





--- Comment #39 from roucaries.bastien+kernel@gmail.com  2011-09-08 12:48:25 ---
This time I achieved to get an interesting trace, journal begin was interrupted
by an IPI, and stuck

What do you think about this ?

regards

Bastien

Sep  8 10:18:25 portablebastien kernel: [177000.740195] INFO: task kded4:31863
blocked for more than 120 seconds.
Sep  8 10:18:25 portablebastien kernel: [177000.740260] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:18:25 portablebastien kernel: [177000.740326] kded4           D
ffff880119d62830     0 31863      1 0x00000000
Sep  8 10:18:25 portablebastien kernel: [177000.740335]  ffff880119d62830
0000000000000082 ffff880000000040 0000000100000000
Sep  8 10:18:25 portablebastien kernel: [177000.740343]  ffffffff8160b020
0000000000012800 ffff8800cac65fd8 ffff8800cac65fd8
Sep  8 10:18:25 portablebastien kernel: [177000.740351]  0000000000012800
ffff880119d62830 0000000000012800 0000000000012800
Sep  8 10:18:25 portablebastien kernel: [177000.740358] Call Trace:
Sep  8 10:18:25 portablebastien kernel: [177000.740371]  [<ffffffff81336090>] ?
__mutex_lock_common.clone.5+0x114/0x179
Sep  8 10:18:25 portablebastien kernel: [177000.740379]  [<ffffffff81335f69>] ?
mutex_lock+0x1a/0x2d
Sep  8 10:18:25 portablebastien kernel: [177000.740386]  [<ffffffff810b6dbc>] ?
generic_file_aio_write+0x3b/0xb2
Sep  8 10:18:25 portablebastien kernel: [177000.740392]  [<ffffffff810fb7eb>] ?
do_sync_write+0xb1/0xea
Sep  8 10:18:25 portablebastien kernel: [177000.740401]  [<ffffffff811653e9>] ?
security_file_permission+0x18/0x33
Sep  8 10:18:25 portablebastien kernel: [177000.740407]  [<ffffffff810fbe02>] ?
vfs_write+0xa6/0xf9
Sep  8 10:18:25 portablebastien kernel: [177000.740412]  [<ffffffff810fbff7>] ?
sys_write+0x45/0x6b
Sep  8 10:18:25 portablebastien kernel: [177000.740418]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b
Sep  8 10:18:25 portablebastien kernel: [177000.740442] INFO: task
krunner:31987 blocked for more than 120 seconds.
Sep  8 10:18:25 portablebastien kernel: [177000.740498] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:18:25 portablebastien kernel: [177000.740562] krunner         D
ffff8801192d4300     0 31987      1 0x00000000
Sep  8 10:18:25 portablebastien kernel: [177000.740569]  ffff8801192d4300
0000000000000086 ffff880117744148 ffff8801181f2f40
Sep  8 10:18:25 portablebastien kernel: [177000.740577]  ffff8800caef0e60
0000000000012800 ffff88001d0ebfd8 ffff88001d0ebfd8
Sep  8 10:18:25 portablebastien kernel: [177000.740584]  0000000000012800
ffff8801192d4300 0000000000012800 0000000000012800
Sep  8 10:18:25 portablebastien kernel: [177000.740591] Call Trace:
Sep  8 10:18:25 portablebastien kernel: [177000.740598]  [<ffffffff81071f28>] ?
arch_local_irq_save+0x14/0x1d
Sep  8 10:18:25 portablebastien kernel: [177000.740636]  [<ffffffffa029b17f>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.740643]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Sep  8 10:18:25 portablebastien kernel: [177000.740662]  [<ffffffffa029fe07>] ?
do_journal_begin_r+0x1a1/0x280 [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.740670]  [<ffffffff81098a4a>] ?
delayacct_end+0x72/0x7d
Sep  8 10:18:25 portablebastien kernel: [177000.740677]  [<ffffffff810b5ebc>] ?
sleep_on_page+0x10/0x10
Sep  8 10:18:25 portablebastien kernel: [177000.740694]  [<ffffffffa029ffa1>] ?
journal_begin+0xbb/0xf7 [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.740712]  [<ffffffffa0290d35>] ?
reiserfs_dirty_inode+0x53/0x8f [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.740719]  [<ffffffff810600ad>] ?
autoremove_wake_function+0x2a/0x2a
Sep  8 10:18:25 portablebastien kernel: [177000.740725]  [<ffffffff8104ad82>] ?
current_fs_time+0x1e/0x24
Sep  8 10:18:25 portablebastien kernel: [177000.740732]  [<ffffffff8111846e>] ?
__mark_inode_dirty+0x22/0x183
Sep  8 10:18:25 portablebastien kernel: [177000.740739]  [<ffffffff8110e2b6>] ?
file_update_time+0xea/0x115
Sep  8 10:18:25 portablebastien kernel: [177000.740745]  [<ffffffff810b6c69>] ?
__generic_file_aio_write+0x160/0x278
Sep  8 10:18:25 portablebastien kernel: [177000.740752]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Sep  8 10:18:25 portablebastien kernel: [177000.740758]  [<ffffffff810b6ddb>] ?
generic_file_aio_write+0x5a/0xb2
Sep  8 10:18:25 portablebastien kernel: [177000.740764]  [<ffffffff810fb7eb>] ?
do_sync_write+0xb1/0xea
Sep  8 10:18:25 portablebastien kernel: [177000.740771]  [<ffffffff811653e9>] ?
security_file_permission+0x18/0x33
Sep  8 10:18:25 portablebastien kernel: [177000.740777]  [<ffffffff810fbe02>] ?
vfs_write+0xa6/0xf9
Sep  8 10:18:25 portablebastien kernel: [177000.740782]  [<ffffffff810fbff7>] ?
sys_write+0x45/0x6b
Sep  8 10:18:25 portablebastien kernel: [177000.740788]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b
Sep  8 10:18:25 portablebastien kernel: [177000.740811] INFO: task okular:12053
blocked for more than 120 seconds.
Sep  8 10:18:25 portablebastien kernel: [177000.740867] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:18:25 portablebastien kernel: [177000.740931] okular          D
ffff8800c9c8d060     0 12053  32057 0x00000000
Sep  8 10:18:25 portablebastien kernel: [177000.740938]  ffff8800c9c8d060
0000000000000086 ffff8800c9c8d0a8 ffff880000000000
Sep  8 10:18:25 portablebastien kernel: [177000.740946]  ffff88011af780c0
0000000000012800 ffff8800ab7dbfd8 ffff8800ab7dbfd8
Sep  8 10:18:25 portablebastien kernel: [177000.740953]  0000000000012800
ffff8800c9c8d060 0000000000012800 0000000000012800
Sep  8 10:18:25 portablebastien kernel: [177000.740960] Call Trace:
Sep  8 10:18:25 portablebastien kernel: [177000.740982]  [<ffffffffa029b17f>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.740988]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Sep  8 10:18:25 portablebastien kernel: [177000.741007]  [<ffffffffa029fe07>] ?
do_journal_begin_r+0x1a1/0x280 [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.741025]  [<ffffffffa029ffa1>] ?
journal_begin+0xbb/0xf7 [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.741042]  [<ffffffffa0289e1c>] ?
reiserfs_truncate_file+0x16f/0x26e [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.741048]  [<ffffffff8110a7ba>] ?
do_sys_poll+0x30d/0x37d
Sep  8 10:18:25 portablebastien kernel: [177000.741055]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Sep  8 10:18:25 portablebastien kernel: [177000.741060]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Sep  8 10:18:25 portablebastien kernel: [177000.741077]  [<ffffffffa028cdfa>] ?
reiserfs_vfs_truncate_file+0x22/0x30 [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.741084]  [<ffffffff810bffe8>] ?
vmtruncate+0x33/0x3b
Sep  8 10:18:25 portablebastien kernel: [177000.741099]  [<ffffffffa028cd6a>] ?
reiserfs_setattr+0x253/0x2c1 [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.741106]  [<ffffffff8110ce20>] ?
__d_lookup_rcu+0xb6/0xf2
Sep  8 10:18:25 portablebastien kernel: [177000.741112]  [<ffffffff8104ad82>] ?
current_fs_time+0x1e/0x24
Sep  8 10:18:25 portablebastien kernel: [177000.741118]  [<ffffffff8110f9bf>] ?
notify_change+0x1a7/0x291
Sep  8 10:18:25 portablebastien kernel: [177000.741124]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Sep  8 10:18:25 portablebastien kernel: [177000.741131]  [<ffffffff810fa98d>] ?
do_truncate+0x65/0x80
Sep  8 10:18:25 portablebastien kernel: [177000.741137]  [<ffffffff810fa637>] ?
__dentry_open+0x1a7/0x29c
Sep  8 10:18:25 portablebastien kernel: [177000.741142]  [<ffffffff81105bb7>] ?
do_last+0x4df/0x584
Sep  8 10:18:25 portablebastien kernel: [177000.741148]  [<ffffffff81106ece>] ?
path_openat+0xc7/0x349
Sep  8 10:18:25 portablebastien kernel: [177000.741153]  [<ffffffff810fb8d5>] ?
do_sync_read+0xb1/0xea
Sep  8 10:18:25 portablebastien kernel: [177000.741159]  [<ffffffff8110717c>] ?
do_filp_open+0x2c/0x72
Sep  8 10:18:25 portablebastien kernel: [177000.741166]  [<ffffffff813358d7>] ?
_cond_resched+0x9/0x20
Sep  8 10:18:25 portablebastien kernel: [177000.741172]  [<ffffffff811aca91>] ?
__strncpy_from_user+0x19/0x4a
Sep  8 10:18:25 portablebastien kernel: [177000.741178]  [<ffffffff811104ec>] ?
alloc_fd+0x69/0x110
Sep  8 10:18:25 portablebastien kernel: [177000.741184]  [<ffffffff810fb41c>] ?
do_sys_open+0x5f/0xe6
Sep  8 10:18:25 portablebastien kernel: [177000.741191]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b
Sep  8 10:18:25 portablebastien kernel: [177000.741197] INFO: task
firefox-bin:12794 blocked for more than 120 seconds.
Sep  8 10:18:25 portablebastien kernel: [177000.741256] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:18:25 portablebastien kernel: [177000.741320] firefox-bin     D
ffff8800c1e56400     0 12794  31987 0x00000000
Sep  8 10:18:25 portablebastien kernel: [177000.741326]  ffff8800c1e56400
0000000000000082 0000000000000246 ffffffff00000000
Sep  8 10:18:25 portablebastien kernel: [177000.741334]  ffff88011af780c0
0000000000012800 ffff880118589fd8 ffff880118589fd8
Sep  8 10:18:25 portablebastien kernel: [177000.741341]  0000000000012800
ffff8800c1e56400 0000000000012800 0000000000012800
Sep  8 10:18:25 portablebastien kernel: [177000.741349] Call Trace:
Sep  8 10:18:25 portablebastien kernel: [177000.741368]  [<ffffffffa029b17f>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Sep  8 10:18:25 portablebastien kernel: [177000.741374]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Sep  8 10:18:25 portablebastien kernel: [177000.741392]  [<ffffffffa029fe07>] ?
do_journal_begin_r+0x1a1/0x280 [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.741398]  [<ffffffff811098e9>] ?
poll_freewait+0x8c/0x8c
Sep  8 10:18:26 portablebastien kernel: [177000.741405]  [<ffffffff810cb994>] ?
__mod_zone_page_state+0x3c/0x45
Sep  8 10:18:26 portablebastien kernel: [177000.741413]  [<ffffffff8100e28d>] ?
paravirt_read_tsc+0x5/0x8
Sep  8 10:18:26 portablebastien kernel: [177000.741430]  [<ffffffffa029ffa1>] ?
journal_begin+0xbb/0xf7 [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.741447]  [<ffffffffa0290d35>] ?
reiserfs_dirty_inode+0x53/0x8f [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.741454]  [<ffffffff8104ad82>] ?
current_fs_time+0x1e/0x24
Sep  8 10:18:26 portablebastien kernel: [177000.741460]  [<ffffffff8111846e>] ?
__mark_inode_dirty+0x22/0x183
Sep  8 10:18:26 portablebastien kernel: [177000.741466]  [<ffffffff8110e3e4>] ?
touch_atime+0x103/0x12c
Sep  8 10:18:26 portablebastien kernel: [177000.741472]  [<ffffffff810b7391>] ?
generic_file_aio_read+0x55e/0x5c7
Sep  8 10:18:26 portablebastien kernel: [177000.741479]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Sep  8 10:18:26 portablebastien kernel: [177000.741485]  [<ffffffff810fb8d5>] ?
do_sync_read+0xb1/0xea
Sep  8 10:18:26 portablebastien kernel: [177000.741491]  [<ffffffff810fbef4>] ?
vfs_read+0x9f/0xf2
Sep  8 10:18:26 portablebastien kernel: [177000.741496]  [<ffffffff810fbf8c>] ?
sys_read+0x45/0x6b
Sep  8 10:18:26 portablebastien kernel: [177000.741503]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b
Sep  8 10:18:26 portablebastien kernel: [177000.741510] INFO: task
firefox-bin:13107 blocked for more than 120 seconds.
Sep  8 10:18:26 portablebastien kernel: [177000.741573] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:18:26 portablebastien kernel: [177000.741639] firefox-bin     D
ffff880004d76e60     0 13107  31987 0x00000000
Sep  8 10:18:26 portablebastien kernel: [177000.741646]  ffff880004d76e60
0000000000000082 0000000000000001 0000000000000000
Sep  8 10:18:26 portablebastien kernel: [177000.741653]  ffffffff8160b020
0000000000012800 ffff8800cafd1fd8 ffff8800cafd1fd8
Sep  8 10:18:26 portablebastien kernel: [177000.741661]  0000000000012800
ffff880004d76e60 0000000000012800 0000000000012800
Sep  8 10:18:26 portablebastien kernel: [177000.741668] Call Trace:
Sep  8 10:18:26 portablebastien kernel: [177000.741686]  [<ffffffffa029b17f>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.741692]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Sep  8 10:18:26 portablebastien kernel: [177000.741708]  [<ffffffffa029fe07>] ?
do_journal_begin_r+0x1a1/0x280 [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.741714]  [<ffffffff8103aec8>] ?
mmdrop+0xd/0x1c
Sep  8 10:18:26 portablebastien kernel: [177000.741719]  [<ffffffff8103b0a2>] ?
finish_task_switch+0x84/0xaf
Sep  8 10:18:26 portablebastien kernel: [177000.741725]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Sep  8 10:18:26 portablebastien kernel: [177000.741741]  [<ffffffffa029ffa1>] ?
journal_begin+0xbb/0xf7 [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.741756]  [<ffffffffa0290d35>] ?
reiserfs_dirty_inode+0x53/0x8f [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.741762]  [<ffffffff8104ad82>] ?
current_fs_time+0x1e/0x24
Sep  8 10:18:26 portablebastien kernel: [177000.741768]  [<ffffffff8111846e>] ?
__mark_inode_dirty+0x22/0x183
Sep  8 10:18:26 portablebastien kernel: [177000.741775]  [<ffffffff8110e2b6>] ?
file_update_time+0xea/0x115
Sep  8 10:18:26 portablebastien kernel: [177000.741781]  [<ffffffff810b6c69>] ?
__generic_file_aio_write+0x160/0x278
Sep  8 10:18:26 portablebastien kernel: [177000.741787]  [<ffffffff8106e09f>] ?
get_futex_key+0x8d/0x27a
Sep  8 10:18:26 portablebastien kernel: [177000.741793]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Sep  8 10:18:26 portablebastien kernel: [177000.741799]  [<ffffffff810b6ddb>] ?
generic_file_aio_write+0x5a/0xb2
Sep  8 10:18:26 portablebastien kernel: [177000.741804]  [<ffffffff810fb7eb>] ?
do_sync_write+0xb1/0xea
Sep  8 10:18:26 portablebastien kernel: [177000.741812]  [<ffffffff811653e9>] ?
security_file_permission+0x18/0x33
Sep  8 10:18:26 portablebastien kernel: [177000.741818]  [<ffffffff810fbe02>] ?
vfs_write+0xa6/0xf9
Sep  8 10:18:26 portablebastien kernel: [177000.741823]  [<ffffffff810fbff7>] ?
sys_write+0x45/0x6b
Sep  8 10:18:26 portablebastien kernel: [177000.741829]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b
Sep  8 10:18:26 portablebastien kernel: [177000.741835] INFO: task
firefox-bin:14131 blocked for more than 120 seconds.
Sep  8 10:18:26 portablebastien kernel: [177000.741894] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:18:26 portablebastien kernel: [177000.741958] firefox-bin     D
ffff8800143e8080     0 14131  31987 0x00000000
Sep  8 10:18:26 portablebastien kernel: [177000.741965]  ffff8800143e8080
0000000000000082 0000000000000292 ffffffff00000000
Sep  8 10:18:26 portablebastien kernel: [177000.741972]  ffff88011af780c0
0000000000012800 ffff88011949bfd8 ffff88011949bfd8
Sep  8 10:18:26 portablebastien kernel: [177000.741979]  0000000000012800
ffff8800143e8080 0000000000012800 0000000000012800
Sep  8 10:18:26 portablebastien kernel: [177000.741986] Call Trace:
Sep  8 10:18:26 portablebastien kernel: [177000.742003]  [<ffffffffa029b17f>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.742009]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Sep  8 10:18:26 portablebastien kernel: [177000.742026]  [<ffffffffa02a039b>] ?
reiserfs_commit_for_inode+0x96/0x1b5 [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.742032]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Sep  8 10:18:26 portablebastien kernel: [177000.742038]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Sep  8 10:18:26 portablebastien kernel: [177000.742044]  [<ffffffff813358d7>] ?
_cond_resched+0x9/0x20
Sep  8 10:18:26 portablebastien kernel: [177000.742050]  [<ffffffff81335f5c>] ?
mutex_lock+0xd/0x2d
Sep  8 10:18:26 portablebastien kernel: [177000.742064]  [<ffffffffa028ce6b>] ?
reiserfs_sync_file+0x42/0x8b [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.742071]  [<ffffffff8111bc56>] ?
vfs_fsync_range+0x52/0x74
Sep  8 10:18:26 portablebastien kernel: [177000.742077]  [<ffffffff8111bd00>] ?
do_fsync+0x27/0x3d
Sep  8 10:18:26 portablebastien kernel: [177000.742082]  [<ffffffff8111bf1c>] ?
sys_fsync+0xb/0x12
Sep  8 10:18:26 portablebastien kernel: [177000.742088]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b
Sep  8 10:18:26 portablebastien kernel: [177000.742098] INFO: task sync:14137
blocked for more than 120 seconds.
Sep  8 10:18:26 portablebastien kernel: [177000.742151] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:18:26 portablebastien kernel: [177000.742215] sync            D
ffff8800bfcf38d0     0 14137   3494 0x00000000
Sep  8 10:18:26 portablebastien kernel: [177000.742222]  ffff8800bfcf38d0
0000000000000082 0000000000000000 ffffffff8103b0a2
Sep  8 10:18:26 portablebastien kernel: [177000.742229]  ffffffff8160b020
0000000000012800 ffff880067405fd8 ffff880067405fd8
Sep  8 10:18:26 portablebastien kernel: [177000.742237]  0000000000012800
ffff8800bfcf38d0 0000000000012800 0000000000012800
Sep  8 10:18:26 portablebastien kernel: [177000.742244] Call Trace:
Sep  8 10:18:26 portablebastien kernel: [177000.742249]  [<ffffffff8103b0a2>] ?
finish_task_switch+0x84/0xaf
Sep  8 10:18:26 portablebastien kernel: [177000.742255]  [<ffffffff81071f28>] ?
arch_local_irq_save+0x14/0x1d
Sep  8 10:18:26 portablebastien kernel: [177000.742272]  [<ffffffffa029b17f>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.742278]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Sep  8 10:18:26 portablebastien kernel: [177000.742294]  [<ffffffffa029fe07>] ?
do_journal_begin_r+0x1a1/0x280 [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.742301]  [<ffffffff81023145>] ?
_flat_send__mask+0x6a/0x7c
Sep  8 10:18:26 portablebastien kernel: [177000.742307]  [<ffffffff81336a8d>] ?
_raw_spin_lock_irq+0xd/0x1a
Sep  8 10:18:26 portablebastien kernel: [177000.742313]  [<ffffffff8111bdd5>] ?
__sync_filesystem+0x78/0x78
Sep  8 10:18:26 portablebastien kernel: [177000.742328]  [<ffffffffa029ffa1>] ?
journal_begin+0xbb/0xf7 [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.742344]  [<ffffffffa0290c9e>] ?
reiserfs_sync_fs+0x1e/0x53 [reiserfs]
Sep  8 10:18:26 portablebastien kernel: [177000.742350]  [<ffffffff8111bdb8>] ?
__sync_filesystem+0x5b/0x78
Sep  8 10:18:26 portablebastien kernel: [177000.742356]  [<ffffffff810fe0ac>] ?
iterate_supers+0x5e/0xab
Sep  8 10:18:26 portablebastien kernel: [177000.742362]  [<ffffffff8111bd2f>] ?
sync_filesystems+0x19/0x1e
Sep  8 10:18:26 portablebastien kernel: [177000.742367]  [<ffffffff8111be43>] ?
sys_sync+0x12/0x31
Sep  8 10:18:26 portablebastien kernel: [177000.742373]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b
Sep  8 10:20:25 portablebastien kernel: [177120.740213] INFO: task kded4:31863
blocked for more than 120 seconds.
Sep  8 10:20:25 portablebastien kernel: [177120.742048] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:20:25 portablebastien kernel: [177120.743918] kded4           D
ffff880119d62830     0 31863      1 0x00000000
Sep  8 10:20:25 portablebastien kernel: [177120.743926]  ffff880119d62830
0000000000000082 ffff880000000040 0000000100000000
Sep  8 10:20:25 portablebastien kernel: [177120.743935]  ffffffff8160b020
0000000000012800 ffff8800cac65fd8 ffff8800cac65fd8
Sep  8 10:20:25 portablebastien kernel: [177120.743942]  0000000000012800
ffff880119d62830 0000000000012800 0000000000012800
Sep  8 10:20:25 portablebastien kernel: [177120.743952] Call Trace:
Sep  8 10:20:25 portablebastien kernel: [177120.743965]  [<ffffffff81336090>] ?
__mutex_lock_common.clone.5+0x114/0x179
Sep  8 10:20:25 portablebastien kernel: [177120.743972]  [<ffffffff81335f69>] ?
mutex_lock+0x1a/0x2d
Sep  8 10:20:25 portablebastien kernel: [177120.743979]  [<ffffffff810b6dbc>] ?
generic_file_aio_write+0x3b/0xb2
Sep  8 10:20:25 portablebastien kernel: [177120.743986]  [<ffffffff810fb7eb>] ?
do_sync_write+0xb1/0xea
Sep  8 10:20:25 portablebastien kernel: [177120.743994]  [<ffffffff811653e9>] ?
security_file_permission+0x18/0x33
Sep  8 10:20:25 portablebastien kernel: [177120.744026]  [<ffffffff810fbe02>] ?
vfs_write+0xa6/0xf9
Sep  8 10:20:25 portablebastien kernel: [177120.744031]  [<ffffffff810fbff7>] ?
sys_write+0x45/0x6b
Sep  8 10:20:25 portablebastien kernel: [177120.744038]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b
Sep  8 10:20:25 portablebastien kernel: [177120.744062] INFO: task
krunner:31987 blocked for more than 120 seconds.
Sep  8 10:20:25 portablebastien kernel: [177120.745956] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:20:25 portablebastien kernel: [177120.747877] krunner         D
ffff8801192d4300     0 31987      1 0x00000000
Sep  8 10:20:25 portablebastien kernel: [177120.747884]  ffff8801192d4300
0000000000000086 ffff880117744148 ffff8801181f2f40
Sep  8 10:20:25 portablebastien kernel: [177120.747891]  ffff8800caef0e60
0000000000012800 ffff88001d0ebfd8 ffff88001d0ebfd8
Sep  8 10:20:25 portablebastien kernel: [177120.747898]  0000000000012800
ffff8801192d4300 0000000000012800 0000000000012800
Sep  8 10:20:25 portablebastien kernel: [177120.747906] Call Trace:
Sep  8 10:20:25 portablebastien kernel: [177120.747913]  [<ffffffff81071f28>] ?
arch_local_irq_save+0x14/0x1d
Sep  8 10:20:25 portablebastien kernel: [177120.747951]  [<ffffffffa029b17f>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.747958]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Sep  8 10:20:25 portablebastien kernel: [177120.747975]  [<ffffffffa029fe07>] ?
do_journal_begin_r+0x1a1/0x280 [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.747982]  [<ffffffff81098a4a>] ?
delayacct_end+0x72/0x7d
Sep  8 10:20:25 portablebastien kernel: [177120.747989]  [<ffffffff810b5ebc>] ?
sleep_on_page+0x10/0x10
Sep  8 10:20:25 portablebastien kernel: [177120.748026]  [<ffffffffa029ffa1>] ?
journal_begin+0xbb/0xf7 [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.748042]  [<ffffffffa0290d35>] ?
reiserfs_dirty_inode+0x53/0x8f [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.748051]  [<ffffffff810600ad>] ?
autoremove_wake_function+0x2a/0x2a
Sep  8 10:20:25 portablebastien kernel: [177120.748059]  [<ffffffff8104ad82>] ?
current_fs_time+0x1e/0x24
Sep  8 10:20:25 portablebastien kernel: [177120.748067]  [<ffffffff8111846e>] ?
__mark_inode_dirty+0x22/0x183
Sep  8 10:20:25 portablebastien kernel: [177120.748075]  [<ffffffff8110e2b6>] ?
file_update_time+0xea/0x115
Sep  8 10:20:25 portablebastien kernel: [177120.748083]  [<ffffffff810b6c69>] ?
__generic_file_aio_write+0x160/0x278
Sep  8 10:20:25 portablebastien kernel: [177120.748092]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Sep  8 10:20:25 portablebastien kernel: [177120.748098]  [<ffffffff810b6ddb>] ?
generic_file_aio_write+0x5a/0xb2
Sep  8 10:20:25 portablebastien kernel: [177120.748106]  [<ffffffff810fb7eb>] ?
do_sync_write+0xb1/0xea
Sep  8 10:20:25 portablebastien kernel: [177120.748114]  [<ffffffff811653e9>] ?
security_file_permission+0x18/0x33
Sep  8 10:20:25 portablebastien kernel: [177120.748121]  [<ffffffff810fbe02>] ?
vfs_write+0xa6/0xf9
Sep  8 10:20:25 portablebastien kernel: [177120.748128]  [<ffffffff810fbff7>] ?
sys_write+0x45/0x6b
Sep  8 10:20:25 portablebastien kernel: [177120.748136]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b
Sep  8 10:20:25 portablebastien kernel: [177120.748161] INFO: task okular:12053
blocked for more than 120 seconds.
Sep  8 10:20:25 portablebastien kernel: [177120.750079] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Sep  8 10:20:25 portablebastien kernel: [177120.751982] okular          D
ffff8800c9c8d060     0 12053  32057 0x00000000
Sep  8 10:20:25 portablebastien kernel: [177120.751989]  ffff8800c9c8d060
0000000000000086 ffff8800c9c8d0a8 ffff880000000000
Sep  8 10:20:25 portablebastien kernel: [177120.752022]  ffff88011af780c0
0000000000012800 ffff8800ab7dbfd8 ffff8800ab7dbfd8
Sep  8 10:20:25 portablebastien kernel: [177120.752029]  0000000000012800
ffff8800c9c8d060 0000000000012800 0000000000012800
Sep  8 10:20:25 portablebastien kernel: [177120.752039] Call Trace:
Sep  8 10:20:25 portablebastien kernel: [177120.752060]  [<ffffffffa029b17f>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.752068]  [<ffffffff8103f0a4>] ?
try_to_wake_up+0x199/0x199
Sep  8 10:20:25 portablebastien kernel: [177120.752085]  [<ffffffffa029fe07>] ?
do_journal_begin_r+0x1a1/0x280 [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.752103]  [<ffffffffa029ffa1>] ?
journal_begin+0xbb/0xf7 [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.752120]  [<ffffffffa0289e1c>] ?
reiserfs_truncate_file+0x16f/0x26e [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.752127]  [<ffffffff8110a7ba>] ?
do_sys_poll+0x30d/0x37d
Sep  8 10:20:25 portablebastien kernel: [177120.752135]  [<ffffffff810383fc>] ?
need_resched+0x1a/0x23
Sep  8 10:20:25 portablebastien kernel: [177120.752142]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Sep  8 10:20:25 portablebastien kernel: [177120.752158]  [<ffffffffa028cdfa>] ?
reiserfs_vfs_truncate_file+0x22/0x30 [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.752166]  [<ffffffff810bffe8>] ?
vmtruncate+0x33/0x3b
Sep  8 10:20:25 portablebastien kernel: [177120.752182]  [<ffffffffa028cd6a>] ?
reiserfs_setattr+0x253/0x2c1 [reiserfs]
Sep  8 10:20:25 portablebastien kernel: [177120.752190]  [<ffffffff8110ce20>] ?
__d_lookup_rcu+0xb6/0xf2
Sep  8 10:20:25 portablebastien kernel: [177120.752197]  [<ffffffff8104ad82>] ?
current_fs_time+0x1e/0x24
Sep  8 10:20:25 portablebastien kernel: [177120.752203]  [<ffffffff8110f9bf>] ?
notify_change+0x1a7/0x291
Sep  8 10:20:25 portablebastien kernel: [177120.752210]  [<ffffffff8103840a>] ?
should_resched+0x5/0x24
Sep  8 10:20:25 portablebastien kernel: [177120.752219]  [<ffffffff810fa98d>] ?
do_truncate+0x65/0x80
Sep  8 10:20:25 portablebastien kernel: [177120.752226]  [<ffffffff810fa637>] ?
__dentry_open+0x1a7/0x29c
Sep  8 10:20:25 portablebastien kernel: [177120.752234]  [<ffffffff81105bb7>] ?
do_last+0x4df/0x584
Sep  8 10:20:25 portablebastien kernel: [177120.752241]  [<ffffffff81106ece>] ?
path_openat+0xc7/0x349
Sep  8 10:20:25 portablebastien kernel: [177120.752249]  [<ffffffff810fb8d5>] ?
do_sync_read+0xb1/0xea
Sep  8 10:20:25 portablebastien kernel: [177120.752256]  [<ffffffff8110717c>] ?
do_filp_open+0x2c/0x72
Sep  8 10:20:25 portablebastien kernel: [177120.752264]  [<ffffffff813358d7>] ?
_cond_resched+0x9/0x20
Sep  8 10:20:25 portablebastien kernel: [177120.752272]  [<ffffffff811aca91>] ?
__strncpy_from_user+0x19/0x4a
Sep  8 10:20:25 portablebastien kernel: [177120.752279]  [<ffffffff811104ec>] ?
alloc_fd+0x69/0x110
Sep  8 10:20:25 portablebastien kernel: [177120.752287]  [<ffffffff810fb41c>] ?
do_sys_open+0x5f/0xe6
Sep  8 10:20:25 portablebastien kernel: [177120.752295]  [<ffffffff8133bd12>] ?
system_call_fastpath+0x16/0x1b

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
