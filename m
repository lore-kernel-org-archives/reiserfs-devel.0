From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 11 Feb 2013 22:17:07 +0000 (UTC)
Message-ID: <20130211221707.2BCEC11FF40@bugzilla.kernel.org>
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


c880562@rmqkr.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |c880562@rmqkr.net




--- Comment #42 from c880562@rmqkr.net  2013-02-11 22:17:06 ---
Hello,

I have the same problem with my linux BackTrack/Ubuntu Full encrypted (/, /home
and swap), with kernel 2.6.39.4, 3.2.6 and 3.0.0-23-pae:

I have tried to disable swap, but same problem.
I have tried to make swap not encrypted, but same problem.
I have tried to disable my nvidia card module, but same problem.
I have done fsck & badblock & memtest but no problem on disk & ram.
I have tried to play with dirty_pages and other sysctl variables but same
problem...


Please, some news about???


thanks

[ 6600.396116] gnome-power-man D 00000000     0 14398  14366 0x00000000
[ 6600.396128]  f6c03cac 00200086 f6c03f98 00000000 09895418 00000008 c1148bb0
ffffffff
[ 6600.396145]  c18acd00 c18acd00 c18acd00 c18acd00 06fdfdab 000005d8 c18acd00
f7be4d00
[ 6600.396162]  eed00cc0 f04af2c0 0000032a 00000000 000003fe 00000195 00000000
00000000
[ 6600.396178] Call Trace:
[ 6600.396197]  [<c1148bb0>] ? poll_freewait+0x80/0x80
[ 6600.396210]  [<c100f928>] ? sched_clock+0x8/0x10
[ 6600.396222]  [<c102eec8>] ? default_spin_lock_flags+0x8/0x10
[ 6600.396233]  [<c155742f>] ? _raw_spin_lock_irqsave+0x2f/0x50
[ 6600.396271]  [<c1555855>] schedule+0x35/0x50
[ 6600.396300]  [<f86725ef>] queue_log_writer+0x6f/0xa0 [reiserfs]
[ 6600.396314]  [<c104a110>] ? try_to_wake_up+0x220/0x220
[ 6600.396343]  [<f86774d8>] do_journal_begin_r+0x1d8/0x310 [reiserfs]
[ 6600.396361]  [<c104a0ae>] ? try_to_wake_up+0x1be/0x220
[ 6600.396387]  [<f867768f>] journal_begin+0x7f/0x160 [reiserfs]
[ 6600.396395]  [<c1556249>] ? mutex_lock+0x19/0x40
[ 6600.396420]  [<f8665868>] reiserfs_dirty_inode+0x38/0xc0 [reiserfs]
[ 6600.396431]  [<c103eb2c>] ? __wake_up_sync_key+0x4c/0x60
[ 6600.396442]  [<c115a94f>] __mark_inode_dirty+0x2f/0x220
[ 6600.396451]  [<c14f375b>] ? unix_stream_sendmsg+0x37b/0x390
[ 6600.396461]  [<c114e9e1>] file_update_time+0xc1/0x140
[ 6600.396472]  [<c10ec8e9>] __generic_file_aio_write+0x1b9/0x540
[ 6600.396481]  [<c103f206>] ? update_cfs_load+0x136/0x300
[ 6600.396490]  [<c10442d5>] ? update_curr+0x195/0x2c0
[ 6600.396500]  [<c10eccda>] generic_file_aio_write+0x6a/0xd0
[ 6600.396514]  [<c11381e4>] do_sync_write+0xa4/0xe0
[ 6600.396527]  [<c12658b6>] ? apparmor_file_permission+0x16/0x20
[ 6600.396538]  [<c123785e>] ? security_file_permission+0x1e/0xa0
[ 6600.396562]  [<f86602f8>] reiserfs_file_write+0x88/0xa0 [reiserfs]
[ 6600.396571]  [<c1138792>] vfs_write+0xa2/0x170
[ 6600.396594]  [<f8660270>] ? reiserfs_file_open+0x90/0x90 [reiserfs]
[ 6600.396603]  [<c1138932>] sys_write+0x42/0x70
[ 6600.396613]  [<c155e49f>] sysenter_do_call+0x12/0x28
[ 6600.396630] INFO: task firefox-bin:16522 blocked for more than 120 seconds.
[ 6600.396636] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[ 6600.396642] firefox-bin     D e1b49c44     0 16522      1 0x00000000
[ 6600.396653]  e1b49c54 00000086 00000002 e1b49c44 ffffffff 00000002 f7be5824
00000000
[ 6600.396670]  c18acd00 c18acd00 c18acd00 c18acd00 00000000 00000000 c18acd00
f7be4d00
[ 6600.396686]  ef8072c0 f74c0000 00000000 e1b49d18 f6940600 00000005 00000001
00000001
[ 6600.396702] Call Trace:
[ 6600.396715]  [<c102eec8>] ? default_spin_lock_flags+0x8/0x10
[ 6600.396724]  [<c155742f>] ? _raw_spin_lock_irqsave+0x2f/0x50
[ 6600.396736]  [<c1555855>] schedule+0x35/0x50
[ 6600.396761]  [<f86725ef>] queue_log_writer+0x6f/0xa0 [reiserfs]
[ 6600.396773]  [<c104a110>] ? try_to_wake_up+0x220/0x220
[ 6600.396804]  [<f86774d8>] do_journal_begin_r+0x1d8/0x310 [reiserfs]
[ 6600.396837]  [<f865c302>] ? reiserfs_read_locked_inode+0xc2/0x130 [reiserfs]
[ 6600.396849]  [<c10730ab>] ? hrtimer_forward+0x16b/0x1b0
[ 6600.396874]  [<f867768f>] journal_begin+0x7f/0x160 [reiserfs]
[ 6600.396883]  [<c1556249>] ? mutex_lock+0x19/0x40
[ 6600.396906]  [<f865b64d>] reiserfs_truncate_file+0x6d/0x230 [reiserfs]
[ 6600.396916]  [<c15573fd>] ? _raw_spin_lock+0xd/0x10
[ 6600.396924]  [<c114a595>] ? __d_instantiate+0x95/0xd0
[ 6600.396960]  [<f865fd4a>] reiserfs_vfs_truncate_file+0x2a/0x40 [reiserfs]
[ 6600.396971]  [<c10f5c71>] vmtruncate+0x51/0x60
[ 6600.396993]  [<f865b007>] reiserfs_setattr+0x317/0x3a0 [reiserfs]
[ 6600.397005]  [<c117f18f>] ? __dquot_initialize+0x1f/0x140
[ 6600.397014]  [<c1150320>] notify_change+0x180/0x2f0
[ 6600.397023]  [<c1556249>] ? mutex_lock+0x19/0x40
[ 6600.397032]  [<c1136f32>] do_truncate+0x62/0x90
[ 6600.397041]  [<c113747a>] ? __dentry_open+0x22a/0x2c0
[ 6600.397067]  [<f8679df0>] ? reiserfs_permission+0x50/0x50 [reiserfs]
[ 6600.397077]  [<c1144387>] do_last+0x557/0x730
[ 6600.397086]  [<c1144e48>] path_openat+0x98/0x330
[ 6600.397095]  [<c11451c5>] do_filp_open+0x35/0x80
[ 6600.397105]  [<c115120d>] ? alloc_fd+0xbd/0xf0
[ 6600.397114]  [<c11421ed>] ? getname_flags+0xcd/0x140
[ 6600.397123]  [<c1137ace>] do_sys_open+0xee/0x1f0
[ 6600.397132]  [<c1110532>] ? do_munmap+0x212/0x2a0
[ 6600.397141]  [<c1137c3e>] sys_open+0x2e/0x40
[ 6600.397150]  [<c155e49f>] sysenter_do_call+0x12/0x28
[ 6600.397161]  [<c1550000>] ? wakeup_secondary_cpu_via_init+0xc3/0x1d9
[ 6720.396220] INFO: task gnome-power-man:14398 blocked for more than 120
seconds.
[ 6720.396229] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[ 6720.396236] gnome-power-man D 00000000     0 14398  14366 0x00000000
[ 6720.396248]  f6c03cac 00200086 f6c03f98 00000000 09895418 00000008 c1148bb0
ffffffff
[ 6720.396266]  c18acd00 c18acd00 c18acd00 c18acd00 06fdfdab 000005d8 c18acd00
f7be4d00
[ 6720.396283]  eed00cc0 f04af2c0 0000032a 00000000 000003fe 00000195 00000000
00000000
[ 6720.396298] Call Trace:
[ 6720.396317]  [<c1148bb0>] ? poll_freewait+0x80/0x80
[ 6720.396330]  [<c100f928>] ? sched_clock+0x8/0x10
[ 6720.396342]  [<c102eec8>] ? default_spin_lock_flags+0x8/0x10
[ 6720.396353]  [<c155742f>] ? _raw_spin_lock_irqsave+0x2f/0x50
[ 6720.396390]  [<c1555855>] schedule+0x35/0x50
[ 6720.396418]  [<f86725ef>] queue_log_writer+0x6f/0xa0 [reiserfs]
[ 6720.396431]  [<c104a110>] ? try_to_wake_up+0x220/0x220
[ 6720.396460]  [<f86774d8>] do_journal_begin_r+0x1d8/0x310 [reiserfs]
[ 6720.396478]  [<c104a0ae>] ? try_to_wake_up+0x1be/0x220
[ 6720.396503]  [<f867768f>] journal_begin+0x7f/0x160 [reiserfs]
[ 6720.396512]  [<c1556249>] ? mutex_lock+0x19/0x40
[ 6720.396536]  [<f8665868>] reiserfs_dirty_inode+0x38/0xc0 [reiserfs]
[ 6720.396546]  [<c103eb2c>] ? __wake_up_sync_key+0x4c/0x60
[ 6720.396557]  [<c115a94f>] __mark_inode_dirty+0x2f/0x220
[ 6720.396566]  [<c14f375b>] ? unix_stream_sendmsg+0x37b/0x390
[ 6720.396576]  [<c114e9e1>] file_update_time+0xc1/0x140
[ 6720.396586]  [<c10ec8e9>] __generic_file_aio_write+0x1b9/0x540
[ 6720.396595]  [<c103f206>] ? update_cfs_load+0x136/0x300
[ 6720.396604]  [<c10442d5>] ? update_curr+0x195/0x2c0
[ 6720.396613]  [<c10eccda>] generic_file_aio_write+0x6a/0xd0
[ 6720.396627]  [<c11381e4>] do_sync_write+0xa4/0xe0
[ 6720.396640]  [<c12658b6>] ? apparmor_file_permission+0x16/0x20
[ 6720.396651]  [<c123785e>] ? security_file_permission+0x1e/0xa0
[ 6720.396675]  [<f86602f8>] reiserfs_file_write+0x88/0xa0 [reiserfs]
[ 6720.396685]  [<c1138792>] vfs_write+0xa2/0x170
[ 6720.396707]  [<f8660270>] ? reiserfs_file_open+0x90/0x90 [reiserfs]
[ 6720.396716]  [<c1138932>] sys_write+0x42/0x70
[ 6720.396727]  [<c155e49f>] sysenter_do_call+0x12/0x28

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
