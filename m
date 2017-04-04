From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] reiserfs: silence warning from
 dquot_writeback_dquots()
Date: Tue, 04 Apr 2017 06:37:41 -0600
Message-ID: <58E3AFB5020000780014C9E7@prv-mh.provo.novell.com>
References: <58E3AFB5020000780014C9E7@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>

Following commit 9d1ccbe70e ("quota: Use s_umount protection for quota
operations") I see on all systems having ReiserFS volumes

<4>WARNING: CPU: 4 PID: 77 at .../fs/quota/dquot.c:619 dquot_writeback_dquots+0x267/0x2b0
<5>Modules linked in: ...
<5>CPU: 4 PID: 77 Comm: kworker/4:1 Not tainted 4.10.1-2017-03-01-xen0 #1
<5>Hardware name: ...
<5>Workqueue: events_long flush_old_commits [reiserfs]
<5>Call Trace:
<5> dump_stack+0x50/0xa0
<5> __warn+0x105/0x120
<5> ? dquot_writeback_dquots+0x267/0x2b0
<5> warn_slowpath_null+0x23/0x30
<5> dquot_writeback_dquots+0x267/0x2b0
<5> ? sched_clock_cpu+0x47/0x50
<5> ? idle_balance+0x21c/0x3a0
<5> reiserfs_sync_fs+0x11/0x70 [reiserfs]
<5> flush_old_commits+0x47/0x60 [reiserfs]
<5> process_one_work+0xfc/0x2f0
<5> ? schedule+0x27/0x90
<5> worker_thread+0xc5/0x290
<5> ? schedule+0x27/0x90
<5> kthread+0xfd/0x110
<5> ? manage_workers+0x60/0x60
<5> ? kthread_parkme+0x30/0x30
<5> ret_from_fork+0x1c/0x28
<4>---[ end trace e7e00754f5b3cec7 ]---

Acquire the semaphore expected to be held.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Cc: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c |    2 ++
 1 file changed, 2 insertions(+)

Looking over other users of dquot_writeback_dquots() I couldn't really
convince myself that the semaphore is held in all cases by ext2, but I
also didn't see any warnings so far.

--- 4.11-rc5/fs/reiserfs/super.c
+++ 4.11-rc5-reiserfs-dquot-warning/fs/reiserfs/super.c
@@ -93,7 +93,9 @@ static void flush_old_commits(struct wor
 	sbi->work_queued = 0;
 	spin_unlock(&sbi->old_work_lock);
 
+	down_read(&s->s_umount);
 	reiserfs_sync_fs(s, 1);
+	up_read(&s->s_umount);
 }
 
 void reiserfs_schedule_old_flush(struct super_block *s)



