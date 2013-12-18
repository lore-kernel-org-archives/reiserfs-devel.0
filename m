From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Wed, 18 Dec 2013 21:01:16 +0000
Message-ID: <bug-29162-695-kE26H16T9K@https.bugzilla.kernel.org/>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29162

David Kowis <dkowis+kbt@shlrm.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dkowis+kbt@shlrm.org

--- Comment #53 from David Kowis <dkowis+kbt@shlrm.org> ---
I'm uncertain if the problem I'm encountering is the same problem or not, but
it appears extremely similar. Forgive me if I'm not contributing properly.

I've got a Xen VM that is exhibiting the locking symptoms, but not the
corruption symptoms. A reiserfsck only replays journal entries and does not
find any corruptions. This is the only VM that does this out of about 14 VMs. I
see no error messages in the dom0 dmesg.

This is an ArchLinux distro Kernel 3.12.5-1-ARCH. it'll block anything that
wants to do IO, the kworker here, and dropbox as well. Eventually it gets to
the point that the system wedges and dies. I can Emergency Sync it via xl
sysrq, but it won't shut down cleanly. I have to xl destroy it. My other VMs,
some with higher IO loads are on 3.11.6-1-ARCH and have no problems.

[138600.507760] INFO: task kworker/0:1:3397 blocked for more than 120 seconds.
[138600.507775]       Not tainted 3.12.5-1-ARCH #1
[138600.507785] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[138600.507800] kworker/0:1     D 0000000000000000     0  3397      2
0x00000000
[138600.507818] Workqueue: events_long flush_old_commits [reiserfs]
[138600.507822]  ffff88002ea3bc78 0000000000000246 00000000000144c0
ffff88002ea3bfd8
[138600.507830]  ffff88002ea3bfd8 00000000000144c0 ffff88003b85a2c0
0000000000000000
[138600.507837]  0000000000000000 0000000000000000 0000000000000000
0000000000000000
[138600.507843] Call Trace:
[138600.507854]  [<ffffffff814f2109>] ? __mutex_unlock_slowpath+0xa9/0x170
[138600.507861]  [<ffffffff814f3a69>] schedule+0x29/0x70
[138600.507875]  [<ffffffffa004d5e5>] queue_log_writer+0x85/0xc0 [reiserfs]
[138600.507883]  [<ffffffff810952a0>] ? wake_up_process+0x40/0x40
[138600.507897]  [<ffffffffa005243c>] do_journal_end.isra.21+0x1cc/0xe60
[reiserfs]
[138600.507911]  [<ffffffffa0053244>] ? do_journal_begin_r+0x174/0x410
[reiserfs]
[138600.507925]  [<ffffffffa0053b59>] journal_end_sync+0x69/0x80 [reiserfs]
[138600.507939]  [<ffffffffa003f071>] reiserfs_sync_fs+0x61/0x80 [reiserfs]
[138600.507953]  [<ffffffffa003f0da>] flush_old_commits+0x4a/0x60 [reiserfs]
[138600.507961]  [<ffffffff8107dbc7>] process_one_work+0x167/0x450
[138600.507969]  [<ffffffff8107e5d1>] worker_thread+0x121/0x3a0
[138600.507977]  [<ffffffff8107e4b0>] ? manage_workers.isra.23+0x2b0/0x2b0
[138600.507986]  [<ffffffff81084fe0>] kthread+0xc0/0xd0
[138600.507995]  [<ffffffff814f0000>] ? inet6_set_link_af.part.39+0x3/0xb
[138600.508004]  [<ffffffff81084f20>] ? kthread_create_on_node+0x120/0x120
[138600.508010]  [<ffffffff814fcf3c>] ret_from_fork+0x7c/0xb0
[138600.508019]  [<ffffffff81084f20>] ? kthread_create_on_node+0x120/0x120

-- 
You are receiving this mail because:
You are the assignee for the bug.
