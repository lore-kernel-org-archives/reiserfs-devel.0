From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] New: Reiserfs hang with dataloss sometimes
Date: Tue, 15 Feb 2011 09:36:41 GMT
Message-ID: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162

           Summary: Reiserfs hang with dataloss sometimes
           Product: File System
           Version: 2.5
    Kernel Version: 2.6.36
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: ReiserFS
        AssignedTo: reiserfs-devel@vger.kernel.org
        ReportedBy: roucaries.bastien+kernel@gmail.com
        Regression: Yes


Reiserfs hang and it is a regression compared to 2.6.33

System trace is here:
Nov 18 15:25:08 portablebastien kernel: [19920.664304] kalarm        D
00000001004a5de3     0  2995      1 0x00000000
Nov 18 15:25:08 portablebastien kernel: [19920.664312]  ffff88011cfced00
0000000000000082 ffff880000000000 ffffffff81632020
Nov 18 15:25:08 portablebastien kernel: [19920.664319]  0000000000014940
0000000000014940 ffff8800cabfffd8 0000000000014940
Nov 18 15:25:08 portablebastien kernel: [19920.664325]  0000000000014940
ffff88011cfcefd8 ffff88011cfcefe0 ffff88011cfced00
Nov 18 15:25:08 portablebastien kernel: [19920.664331] Call Trace:
Nov 18 15:25:08 portablebastien kernel: [19920.664364]  [<ffffffffa01aab69>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664373]  [<ffffffff8103f7c9>] ?
default_wake_function+0x0/0xf
Nov 18 15:25:08 portablebastien kernel: [19920.664386]  [<ffffffffa01ae70a>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664399]  [<ffffffffa01b1c65>] ?
xattr_lookup+0x17/0xef [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664412]  [<ffffffffa01ae8b4>] ?
journal_begin+0xbd/0xfa [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664425]  [<ffffffffa01a0516>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664431]  [<ffffffff81048a76>] ?
current_fs_time+0x1e/0x24
Nov 18 15:25:08 portablebastien kernel: [19920.664438]  [<ffffffff81107d03>] ?
__mark_inode_dirty+0x27/0x1ac
Nov 18 15:25:08 portablebastien kernel: [19920.664444]  [<ffffffff810fdcf4>] ?
file_update_time+0xf6/0x121
Nov 18 15:25:08 portablebastien kernel: [19920.664450]  [<ffffffff810b0703>] ?
__generic_file_aio_write+0x164/0x280
Nov 18 15:25:08 portablebastien kernel: [19920.664457]  [<ffffffff8124e41e>] ?
sock_aio_read+0xb6/0xc5
Nov 18 15:25:08 portablebastien kernel: [19920.664462]  [<ffffffff810b0874>] ?
generic_file_aio_write+0x55/0x9f
Nov 18 15:25:08 portablebastien kernel: [19920.664469]  [<ffffffff810ec718>] ?
do_sync_write+0xb1/0xea
Nov 18 15:25:08 portablebastien kernel: [19920.664476]  [<ffffffff811533f3>] ?
security_file_permission+0x18/0x2e
Nov 18 15:25:08 portablebastien kernel: [19920.664482]  [<ffffffff810ecc4b>] ?
vfs_write+0xa4/0x100
Nov 18 15:25:08 portablebastien kernel: [19920.664488]  [<ffffffff810ecd5a>] ?
sys_write+0x45/0x6b
Nov 18 15:25:08 portablebastien kernel: [19920.664493]  [<ffffffff81008a02>] ?
system_call_fastpath+0x16/0x1b
Nov 18 15:25:08 portablebastien kernel: [19920.664505] akregator     D
ffffc900054360e0     0  2996      1 0x00000000
Nov 18 15:25:08 portablebastien kernel: [19920.664511]  ffff880037bf2210
0000000000000082 ffff8800cab77aa8 ffff88011f6d6630
Nov 18 15:25:08 portablebastien kernel: [19920.664517]  0000000000014940
0000000000014940 ffff8800cab77fd8 0000000000014940
Nov 18 15:25:08 portablebastien kernel: [19920.664523]  0000000000014940
ffff880037bf24e8 ffff880037bf24f0 ffff880037bf2210
Nov 18 15:25:08 portablebastien kernel: [19920.664529] Call Trace:
Nov 18 15:25:08 portablebastien kernel: [19920.664535]  [<ffffffff8130e223>] ?
schedule_hrtimeout_range_clock+0xc4/0x125
Nov 18 15:25:08 portablebastien kernel: [19920.664549]  [<ffffffffa01aab69>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664555]  [<ffffffff8103f7c9>] ?
default_wake_function+0x0/0xf
Nov 18 15:25:08 portablebastien kernel: [19920.664568]  [<ffffffffa01ae70a>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664580]  [<ffffffffa01b1c65>] ?
xattr_lookup+0x17/0xef [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664593]  [<ffffffffa01ae8b4>] ?
journal_begin+0xbd/0xfa [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664606]  [<ffffffffa01a0516>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664611]  [<ffffffff81048a76>] ?
current_fs_time+0x1e/0x24
Nov 18 15:25:08 portablebastien kernel: [19920.664617]  [<ffffffff81107d03>] ?
__mark_inode_dirty+0x27/0x1ac
Nov 18 15:25:08 portablebastien kernel: [19920.664622]  [<ffffffff810fdcf4>] ?
file_update_time+0xf6/0x121
Nov 18 15:25:08 portablebastien kernel: [19920.664628]  [<ffffffff810b0703>] ?
__generic_file_aio_write+0x164/0x280
Nov 18 15:25:08 portablebastien kernel: [19920.664633]  [<ffffffff810b16f0>] ?
generic_file_aio_read+0x51e/0x576
Nov 18 15:25:08 portablebastien kernel: [19920.664638]  [<ffffffff810b0874>] ?
generic_file_aio_write+0x55/0x9f
Nov 18 15:25:08 portablebastien kernel: [19920.664644]  [<ffffffff810ec718>] ?
do_sync_write+0xb1/0xea
Nov 18 15:25:08 portablebastien kernel: [19920.664650]  [<ffffffff811533f3>] ?
security_file_permission+0x18/0x2e
Nov 18 15:25:08 portablebastien kernel: [19920.664656]  [<ffffffff810ecc4b>] ?
vfs_write+0xa4/0x100
Nov 18 15:25:08 portablebastien kernel: [19920.664661]  [<ffffffff810ecd5a>] ?
sys_write+0x45/0x6b
Nov 18 15:25:08 portablebastien kernel: [19920.664493]  [<ffffffff81008a02>] ?
system_call_fastpath+0x16/0x1b
Nov 18 15:25:08 portablebastien kernel: [19920.664505] akregator     D
ffffc900054360e0     0  2996      1 0x00000000
Nov 18 15:25:08 portablebastien kernel: [19920.664511]  ffff880037bf2210
0000000000000082 ffff8800cab77aa8 ffff88011f6d6630
Nov 18 15:25:08 portablebastien kernel: [19920.664517]  0000000000014940
0000000000014940 ffff8800cab77fd8 0000000000014940
Nov 18 15:25:08 portablebastien kernel: [19920.664523]  0000000000014940
ffff880037bf24e8 ffff880037bf24f0 ffff880037bf2210
Nov 18 15:25:08 portablebastien kernel: [19920.664529] Call Trace:
Nov 18 15:25:08 portablebastien kernel: [19920.664535]  [<ffffffff8130e223>] ?
schedule_hrtimeout_range_clock+0xc4/0x125
Nov 18 15:25:08 portablebastien kernel: [19920.664549]  [<ffffffffa01aab69>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664555]  [<ffffffff8103f7c9>] ?
default_wake_function+0x0/0xf
Nov 18 15:25:08 portablebastien kernel: [19920.664568]  [<ffffffffa01ae70a>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664580]  [<ffffffffa01b1c65>] ?
xattr_lookup+0x17/0xef [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664593]  [<ffffffffa01ae8b4>] ?
journal_begin+0xbd/0xfa [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664606]  [<ffffffffa01a0516>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
Nov 18 15:25:08 portablebastien kernel: [19920.664611]  [<ffffffff81048a76>] ?
current_fs_time+0x1e/0x24
Nov 18 15:25:08 portablebastien kernel: [19920.664617]  [<ffffffff81107d03>] ?
__mark_inode_dirty+0x27/0x1ac
Nov 18 15:25:08 portablebastien kernel: [19920.664622]  [<ffffffff810fdcf4>] ?
file_update_time+0xf6/0x121
Nov 18 15:25:08 portablebastien kernel: [19920.664628]  [<ffffffff810b0703>] ?
__generic_file_aio_write+0x164/0x280
Nov 18 15:25:08 portablebastien kernel: [19920.664633]  [<ffffffff810b16f0>] ?
generic_file_aio_read+0x51e/0x576
Nov 18 15:25:08 portablebastien kernel: [19920.664638]  [<ffffffff810b0874>] ?
generic_file_aio_write+0x55/0x9f
Nov 18 15:25:08 portablebastien kernel: [19920.664644]  [<ffffffff810ec718>] ?
do_sync_write+0xb1/0xea
Nov 18 15:25:08 portablebastien kernel: [19920.664650]  [<ffffffff811533f3>] ?
security_file_permission+0x18/0x2e
Nov 18 15:25:08 portablebastien kernel: [19920.664656]  [<ffffffff810ecc4b>] ?
vfs_write+0xa4/0x100
Nov 18 15:25:08 portablebastien kernel: [19920.664661]  [<ffffffff810ecd5a>] ?
sys_write+0x45/0x6b
Nov 18 15:25:08 portablebastien kernel: [19920.664666]  [<ffffffff81008a02>] ?
system_call_fastpath+0x16/0x1b
ov 18 15:27:08 portablebastien kernel: [20040.668744] kded4         D
00000001004a8412     0  2869      1 0x00000000
Nov 18 15:27:08 portablebastien kernel: [20040.668752]  ffff8801114adf60
0000000000000086 ffff880100000000 ffffffff81632020
Nov 18 15:27:08 portablebastien kernel: [20040.668760]  0000000000014940
0000000000014940 ffff880037ad7fd8 0000000000014940
Nov 18 15:27:08 portablebastien kernel: [20040.668770]  0000000000014940
ffff8801114ae238 ffff8801114ae240 ffff8801114adf60
Nov 18 15:27:08 portablebastien kernel: [20040.668780] Call Trace:
Nov 18 15:27:08 portablebastien kernel: [20040.668815]  [<ffffffffa01aab69>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.668825]  [<ffffffff8103f7c9>] ?
default_wake_function+0x0/0xf
Nov 18 15:27:08 portablebastien kernel: [20040.668840]  [<ffffffffa01ae70a>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.668848]  [<ffffffff8112c164>] ?
__dquot_initialize+0x20/0x16d
Nov 18 15:27:08 portablebastien kernel: [20040.668862]  [<ffffffffa01ae8b4>] ?
journal_begin+0xbd/0xfa [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.668875]  [<ffffffffa0196bff>] ?
reiserfs_create+0xe6/0x205 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.668883]  [<ffffffff810f4712>] ?
generic_permission+0xe/0x8a
Nov 18 15:27:08 portablebastien kernel: [20040.668892]  [<ffffffff810f54b7>] ?
vfs_create+0x66/0x88
Nov 18 15:27:08 portablebastien kernel: [20040.668898]  [<ffffffff810f49c5>] ?
d_alloc_and_lookup+0x4a/0x67
Nov 18 15:27:08 portablebastien kernel: [20040.668904]  [<ffffffff810f5e6a>] ?
do_last+0x268/0x536
Nov 18 15:27:08 portablebastien kernel: [20040.668911]  [<ffffffff810f7aa9>] ?
do_filp_open+0x1e4/0x53b
Nov 18 15:27:08 portablebastien kernel: [20040.668919]  [<ffffffff810eb2e0>] ?
do_sys_open+0x56/0xe4
Nov 18 15:27:08 portablebastien kernel: [20040.668926]  [<ffffffff81008a02>] ?
system_call_fastpath+0x16/0x1b
Nov 18 15:27:08 portablebastien kernel: [20040.673550] kalarm        D
00000001004a5de3     0  2995      1 0x00000000
Nov 18 15:27:08 portablebastien kernel: [20040.673557]  ffff88011cfced00
0000000000000082 ffff880000000000 ffffffff81632020
Nov 18 15:27:08 portablebastien kernel: [20040.673563]  0000000000014940
0000000000014940 ffff8800cabfffd8 0000000000014940
Nov 18 15:27:08 portablebastien kernel: [20040.673571]  0000000000014940
ffff88011cfcefd8 ffff88011cfcefe0 ffff88011cfced00
Nov 18 15:27:08 portablebastien kernel: [20040.673580] Call Trace:
Nov 18 15:27:08 portablebastien kernel: [20040.673598]  [<ffffffffa01aab69>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.673606]  [<ffffffff8103f7c9>] ?
default_wake_function+0x0/0xf
Nov 18 15:27:08 portablebastien kernel: [20040.673620]  [<ffffffffa01ae70a>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.673633]  [<ffffffffa01b1c65>] ?
xattr_lookup+0x17/0xef [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.673647]  [<ffffffffa01ae8b4>] ?
journal_begin+0xbd/0xfa [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.673661]  [<ffffffffa01a0516>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.673668]  [<ffffffff81048a76>] ?
current_fs_time+0x1e/0x24
Nov 18 15:27:08 portablebastien kernel: [20040.673676]  [<ffffffff81107d03>] ?
__mark_inode_dirty+0x27/0x1ac
Nov 18 15:27:08 portablebastien kernel: [20040.673683]  [<ffffffff810fdcf4>] ?
file_update_time+0xf6/0x121
Nov 18 15:27:08 portablebastien kernel: [20040.673690]  [<ffffffff810b0703>] ?
__generic_file_aio_write+0x164/0x280
Nov 18 15:27:08 portablebastien kernel: [20040.673698]  [<ffffffff8124e41e>] ?
sock_aio_read+0xb6/0xc5
Nov 18 15:27:08 portablebastien kernel: [20040.673704]  [<ffffffff810b0874>] ?
generic_file_aio_write+0x55/0x9f
Nov 18 15:27:08 portablebastien kernel: [20040.673711]  [<ffffffff810ec718>] ?
do_sync_write+0xb1/0xea
Nov 18 15:27:08 portablebastien kernel: [20040.673719]  [<ffffffff811533f3>] ?
security_file_permission+0x18/0x2e
Nov 18 15:27:08 portablebastien kernel: [20040.673726]  [<ffffffff810ecc4b>] ?
vfs_write+0xa4/0x100
Nov 18 15:27:08 portablebastien kernel: [20040.673732]  [<ffffffff810ecd5a>] ?
sys_write+0x45/0x6b
Nov 18 15:27:08 portablebastien kernel: [20040.673738]  [<ffffffff81008a02>] ?
system_call_fastpath+0x16/0x1b
Nov 18 15:27:08 portablebastien kernel: [20040.678435] akregator     D
ffffc900054360e0     0  2996      1 0x00000000
Nov 18 15:27:08 portablebastien kernel: [20040.678441]  ffff880037bf2210
0000000000000082 ffff8800cab77aa8 ffff88011f6d6630
Nov 18 15:27:08 portablebastien kernel: [20040.678448]  0000000000014940
0000000000014940 ffff8800cab77fd8 0000000000014940
Nov 18 15:27:08 portablebastien kernel: [20040.678454]  0000000000014940
ffff880037bf24e8 ffff880037bf24f0 ffff880037bf2210
Nov 18 15:27:08 portablebastien kernel: [20040.678460] Call Trace:
Nov 18 15:27:08 portablebastien kernel: [20040.678467]  [<ffffffff8130e223>] ?
schedule_hrtimeout_range_clock+0xc4/0x125
Nov 18 15:27:08 portablebastien kernel: [20040.678482]  [<ffffffffa01aab69>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.678488]  [<ffffffff8103f7c9>] ?
default_wake_function+0x0/0xf
Nov 18 15:27:08 portablebastien kernel: [20040.678501]  [<ffffffffa01ae70a>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.678514]  [<ffffffffa01b1c65>] ?
xattr_lookup+0x17/0xef [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.678526]  [<ffffffffa01ae8b4>] ?
journal_begin+0xbd/0xfa [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.678539]  [<ffffffffa01a0516>] ?
reiserfs_dirty_inode+0x56/0x95 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.678544]  [<ffffffff81048a76>] ?
current_fs_time+0x1e/0x24
Nov 18 15:27:08 portablebastien kernel: [20040.678550]  [<ffffffff81107d03>] ?
__mark_inode_dirty+0x27/0x1ac
Nov 18 15:27:08 portablebastien kernel: [20040.678555]  [<ffffffff810fdcf4>] ?
file_update_time+0xf6/0x121
Nov 18 15:27:08 portablebastien kernel: [20040.678560]  [<ffffffff810b0703>] ?
__generic_file_aio_write+0x164/0x280
Nov 18 15:27:08 portablebastien kernel: [20040.678566]  [<ffffffff810b16f0>] ?
generic_file_aio_read+0x51e/0x576
Nov 18 15:27:08 portablebastien kernel: [20040.678571]  [<ffffffff810b0874>] ?
generic_file_aio_write+0x55/0x9f
Nov 18 15:27:08 portablebastien kernel: [20040.678577]  [<ffffffff810ec718>] ?
do_sync_write+0xb1/0xea
Nov 18 15:27:08 portablebastien kernel: [20040.678583]  [<ffffffff811533f3>] ?
security_file_permission+0x18/0x2e
Nov 18 15:27:08 portablebastien kernel: [20040.678588]  [<ffffffff810ecc4b>] ?
vfs_write+0xa4/0x100
Nov 18 15:27:08 portablebastien kernel: [20040.678593]  [<ffffffff810ecd5a>] ?
sys_write+0x45/0x6b
Nov 18 15:27:08 portablebastien kernel: [20040.678598]  [<ffffffff81008a02>] ?
system_call_fastpath+0x16/0x1b
Nov 18 15:27:08 portablebastien kernel: [20040.683411] pidgin        D
00000001004abe7c     0  7472   2942 0x00000000
Nov 18 15:27:08 portablebastien kernel: [20040.683417]  ffff8800b83cc420
0000000000000082 0000000000000000 ffffffff81632020
Nov 18 15:27:08 portablebastien kernel: [20040.683424]  0000000000014940
0000000000014940 ffff88003d1d7fd8 0000000000014940
Nov 18 15:27:08 portablebastien kernel: [20040.683430]  0000000000014940
ffff8800b83cc6f8 ffff8800b83cc700 ffff8800b83cc420
Nov 18 15:27:08 portablebastien kernel: [20040.683436] Call Trace:
Nov 18 15:27:08 portablebastien kernel: [20040.683451]  [<ffffffffa01aab69>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.683457]  [<ffffffff8103f7c9>] ?
default_wake_function+0x0/0xf
Nov 18 15:27:08 portablebastien kernel: [20040.683470]  [<ffffffffa01ae70a>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.683476]  [<ffffffff8112c164>] ?
__dquot_initialize+0x20/0x16d
Nov 18 15:27:08 portablebastien kernel: [20040.683489]  [<ffffffffa01ae8b4>] ?
journal_begin+0xbd/0xfa [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.683500]  [<ffffffffa0196bff>] ?
reiserfs_create+0xe6/0x205 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.683506]  [<ffffffff810f4712>] ?
generic_permission+0xe/0x8a
Nov 18 15:27:08 portablebastien kernel: [20040.683512]  [<ffffffff810f54b7>] ?
vfs_create+0x66/0x88
Nov 18 15:27:08 portablebastien kernel: [20040.683517]  [<ffffffff810f5e6a>] ?
do_last+0x268/0x536
Nov 18 15:27:08 portablebastien kernel: [20040.683523]  [<ffffffff810f7aa9>] ?
do_filp_open+0x1e4/0x53b
Nov 18 15:27:08 portablebastien kernel: [20040.683529]  [<ffffffff810eb2e0>] ?
do_sys_open+0x56/0xe4
Nov 18 15:27:08 portablebastien kernel: [20040.683534]  [<ffffffff81008a02>] ?
system_call_fastpath+0x16/0x1b
Nov 18 15:27:08 portablebastien kernel: [20040.688478] okular        D
00000001004a9d20     0 19668  19569 0x00000000
Nov 18 15:27:08 portablebastien kernel: [20040.688485]  ffff8800b813caf0
0000000000000082 0000000000000000 ffff88011f65caf0
Nov 18 15:27:08 portablebastien kernel: [20040.688491]  0000000000014940
0000000000014940 ffff8800b82f9fd8 0000000000014940
Nov 18 15:27:08 portablebastien kernel: [20040.688497]  0000000000014940
ffff8800b813cdc8 ffff8800b813cdd0 ffff8800b813caf0
Nov 18 15:27:08 portablebastien kernel: [20040.688506] Call Trace:
Nov 18 15:27:08 portablebastien kernel: [20040.688522]  [<ffffffffa01aab69>] ?
queue_log_writer+0x7e/0xac [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.688530]  [<ffffffff8103f7c9>] ?
default_wake_function+0x0/0xf
Nov 18 15:27:08 portablebastien kernel: [20040.688543]  [<ffffffffa01ae70a>] ?
do_journal_begin_r+0x1d3/0x2c0 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.688558]  [<ffffffffa01ae8b4>] ?
journal_begin+0xbd/0xfa [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.688571]  [<ffffffffa01997a4>] ?
reiserfs_truncate_file+0x175/0x279 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.688579]  [<ffffffff810c728f>] ?
unmap_mapping_range+0x59/0xf5
Nov 18 15:27:08 portablebastien kernel: [20040.688592]  [<ffffffffa019b6ae>] ?
reiserfs_vfs_truncate_file+0x22/0x2d [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.688599]  [<ffffffff810b9269>] ?
vmtruncate+0x36/0x41
Nov 18 15:27:08 portablebastien kernel: [20040.688612]  [<ffffffffa0197c20>] ?
reiserfs_setattr+0x26f/0x2f4 [reiserfs]
Nov 18 15:27:08 portablebastien kernel: [20040.688619]  [<ffffffff81048a76>] ?
current_fs_time+0x1e/0x24
Nov 18 15:27:08 portablebastien kernel: [20040.688626]  [<ffffffff810ff2e1>] ?
notify_change+0x195/0x27e
Nov 18 15:27:08 portablebastien kernel: [20040.688633]  [<ffffffff810ec0ac>] ?
do_truncate+0x68/0x86
Nov 18 15:27:08 portablebastien kernel: [20040.688639]  [<ffffffff810eb531>] ?
__dentry_open+0x186/0x291
Nov 18 15:27:08 portablebastien kernel: [20040.688645]  [<ffffffff810f45e8>] ?
get_write_access+0x10/0x3a
Nov 18 15:27:08 portablebastien kernel: [20040.688652]  [<ffffffff810f605f>] ?
do_last+0x45d/0x536
Nov 18 15:27:08 portablebastien kernel: [20040.688658]  [<ffffffff810f7aa9>] ?
do_filp_open+0x1e4/0x53b
Nov 18 15:27:08 portablebastien kernel: [20040.688665]  [<ffffffff810ec802>] ?
do_sync_read+0xb1/0xea
Nov 18 15:27:08 portablebastien kernel: [20040.688672]  [<ffffffff810eb2e0>] ?
do_sys_open+0x56/0xe4
Nov 18 15:27:08 portablebastien kernel: [20040.688678]  [<ffffffff81008a02>] ?
system_call_fastpath+0x16/0x1b

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
