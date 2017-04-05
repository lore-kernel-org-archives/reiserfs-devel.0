From: Jan Kara <jack@suse.cz>
Subject: [PATCH 2/2] reiserfs: Protect dquot_writeback_dquots() by s_umount semaphore
Date: Wed,  5 Apr 2017 14:32:25 +0200
Message-ID: <20170405123225.670-2-jack@suse.cz>
References: <20170405123225.670-1-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20170405123225.670-1-jack@suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>, Jan Kara <jack@suse.cz>

dquot_writeback_dquots() expects s_umount semaphore to be held to
protect it from other concurrent quota operations. reiserfs_sync_fs()
can call dquot_writeback_dquots() without holding s_umount semaphore
when called from flush_old_commits().

Fix the problem by grabbing s_umount in flush_old_commits(). However we
have to be careful and use only trylock since reiserfs_cancel_old_sync()
can be waiting for flush_old_commits() to complete while holding
s_umount semaphore. Possible postponing of sync work is not a big deal
though as that is only an opportunistic flush.

Fixes: 9d1ccbe70e0b14545caad12dc73adb3605447df0
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 91cf5cbd6332..f536e12c4b1d 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -89,6 +89,19 @@ static void flush_old_commits(struct work_struct *work)
 	sbi = container_of(work, struct reiserfs_sb_info, old_work.work);
 	s = sbi->s_journal->j_work_sb;
 
+	/*
+	 * We need s_umount for protecting quota writeback. We have to use
+	 * trylock as reiserfs_cancel_old_flush() may be waiting for this work
+	 * to complete with s_umount held.
+	 */
+	if (!down_read_trylock(&s->s_umount)) {
+		/* Requeue work if we are not cancelling it */
+		spin_lock(&sbi->old_work_lock);
+		if (sbi->work_queued == 1)
+			queue_delayed_work(system_long_wq, &sbi->old_work, HZ);
+		spin_unlock(&sbi->old_work_lock);
+		return;
+	}
 	spin_lock(&sbi->old_work_lock);
 	/* Avoid clobbering the cancel state... */
 	if (sbi->work_queued == 1)
@@ -96,6 +109,7 @@ static void flush_old_commits(struct work_struct *work)
 	spin_unlock(&sbi->old_work_lock);
 
 	reiserfs_sync_fs(s, 1);
+	up_read(&s->s_umount);
 }
 
 void reiserfs_schedule_old_flush(struct super_block *s)
-- 
2.10.2

