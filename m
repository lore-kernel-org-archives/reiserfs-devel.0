From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 13556] Random oopses
Date: Tue, 23 Jun 2009 22:18:30 GMT
Message-ID: <200906232218.n5NMIULU010970@demeter.kernel.org>
References: <bug-13556-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-13556-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13556


Andrew Morton <akpm@linux-foundation.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |akpm@linux-foundation.org
          Component|Other                       |ReiserFS
         AssignedTo|io_other@kernel-bugs.osdl.o |reiserfs-devel@vger.kernel.
                   |rg                          |org
            Product|IO/Storage                  |File System




--- Comment #1 from Andrew Morton <akpm@linux-foundation.org>  2009-06-23 22:18:28 ---
It looks like a reiserfs regression:

Jun 17 15:04:37 poincare kernel: BUG: unable to handle kernel NULL pointer
dereference at 0000000000000018
Jun 17 15:04:37 poincare kernel: IP: [<ffffffff805c46ea>]
_spin_lock_irq+0xa/0x20
Jun 17 15:04:37 poincare kernel: PGD 259926067 PUD 25987f067 PMD 0
Jun 17 15:04:37 poincare kernel: Oops: 0002 [#1] SMP
Jun 17 15:04:37 poincare kernel: last sysfs file: /sys/kernel/uevent_seqnum
Jun 17 15:04:37 poincare kernel: CPU 0
Jun 17 15:04:37 poincare kernel: Pid: 8270, comm: rm Not tainted
2.6.30-netconsole #1 EP45T-DS3
Jun 17 15:04:37 poincare kernel: RIP: 0010:[<ffffffff805c46ea>] 
[<ffffffff805c46ea>] _spin_lock_irq+0xa/0x20
Jun 17 15:04:37 poincare kernel: RSP: 0018:ffff88025bf7b918  EFLAGS: 00010086
Jun 17 15:04:37 poincare kernel: RAX: 0000000000000100 RBX: ffffe20008127300
RCX: 0000000000000001
Jun 17 15:04:37 poincare kernel: RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000018
Jun 17 15:04:37 poincare kernel: RBP: ffff88025bf7b918 R08: ffff88025f2e1800
R09: 0000000002d296f9
Jun 17 15:04:37 poincare kernel: R10: 0000000000000000 R11: 0000000000000000
R12: 0000000000000000
Jun 17 15:04:37 poincare kernel: R13: 0000000000000000 R14: 0000000000000018
R15: ffff88025f2e1800
Jun 17 15:04:37 poincare kernel: FS:  00002b72db9186f0(0000)
GS:ffff880028034000(0000) knlGS:0000000000000000
Jun 17 15:04:37 poincare kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
000000008005003b
Jun 17 15:04:37 poincare kernel: CR2: 0000000000000018 CR3: 0000000259874000
CR4: 00000000000406e0
Jun 17 15:04:37 poincare kernel: DR0: 0000000000000000 DR1: 0000000000000000
DR2: 0000000000000000
Jun 17 15:04:37 poincare kernel: DR3: 0000000000000000 DR6: 00000000ffff0ff0
DR7: 0000000000000400
Jun 17 15:04:37 poincare kernel: Process rm (pid: 8270, threadinfo
ffff88025bf7a000, task ffff88025bef9640)
Jun 17 15:04:37 poincare kernel: Stack:
Jun 17 15:04:37 poincare kernel:  ffff88025bf7b948 ffffffff802c1a40
ffff88024da158c0 0000000000000000
Jun 17 15:04:37 poincare kernel:  ffff88025bfc1e40 0000000000000000
ffff88025bf7b968 ffffffff802c1b36
Jun 17 15:04:37 poincare kernel:  0000000000000000 ffffc200098ee208
ffff88025bf7b9e8 ffffffff80316ab3
Jun 17 15:04:37 poincare kernel: Call Trace:
Jun 17 15:04:37 poincare kernel:  [<ffffffff802c1a40>]
__set_page_dirty+0x30/0xd0
Jun 17 15:04:37 poincare kernel:  [<ffffffff802c1b36>]
mark_buffer_dirty+0x56/0xa0
Jun 17 15:04:37 poincare kernel:  [<ffffffff80316ab3>]
flush_commit_list+0x713/0x720
Jun 17 15:04:37 poincare kernel:  [<ffffffff80317ac6>]
flush_journal_list+0x166/0x7e0
Jun 17 15:04:37 poincare kernel:  [<ffffffff80317d32>]
flush_journal_list+0x3d2/0x7e0
Jun 17 15:04:37 poincare kernel:  [<ffffffff80318206>]
flush_used_journal_lists+0xc6/0xe0
Jun 17 15:04:38 poincare kernel:  [<ffffffff8024c083>] ?
queue_delayed_work_on+0xa3/0xd0
Jun 17 15:04:38 poincare kernel:  [<ffffffff80319181>]
do_journal_end+0xf61/0x1100
Jun 17 15:04:38 poincare kernel:  [<ffffffff80300c82>] ?
reiserfs_update_sd_size+0x2b2/0x2e0
Jun 17 15:04:38 poincare kernel:  [<ffffffff80318527>] ?
do_journal_end+0x307/0x1100
Jun 17 15:04:38 poincare kernel:  [<ffffffff80319919>]
do_journal_begin_r+0x289/0x340
Jun 17 15:04:38 poincare kernel:  [<ffffffff8024fa20>] ?
autoremove_wake_function+0x0/0x40
Jun 17 15:04:38 poincare kernel:  [<ffffffff80319b86>] journal_begin+0x96/0x170
Jun 17 15:04:38 poincare kernel:  [<ffffffff80314102>]
reiserfs_do_truncate+0x2b2/0x530
Jun 17 15:04:38 poincare kernel:  [<ffffffff803143ab>]
reiserfs_delete_object+0x2b/0x80
Jun 17 15:04:38 poincare kernel:  [<ffffffff80303aca>]
reiserfs_delete_inode+0xaa/0xf0
Jun 17 15:04:38 poincare kernel:  [<ffffffff80303a20>] ?
reiserfs_delete_inode+0x0/0xf0
Jun 17 15:04:38 poincare kernel:  [<ffffffff802b2bb9>]
generic_delete_inode+0x89/0x130
Jun 17 15:04:38 poincare kernel:  [<ffffffff802b2ce5>]
generic_drop_inode+0x85/0x210
Jun 17 15:04:38 poincare kernel:  [<ffffffff802b1c6d>] iput+0x5d/0x70
Jun 17 15:04:38 poincare kernel:  [<ffffffff802a9bbf>] do_unlinkat+0x11f/0x1d0
Jun 17 15:04:38 poincare kernel:  [<ffffffff80253649>] ? up_read+0x9/0x10
Jun 17 15:04:38 poincare kernel:  [<ffffffff802272d7>] ?
do_page_fault+0x167/0x280
Jun 17 15:04:38 poincare kernel:  [<ffffffff802a9dcd>] sys_unlinkat+0x1d/0x40
Jun 17 15:04:38 poincare kernel:  [<ffffffff8020b36b>]
system_call_fastpath+0x16/0x1b

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
