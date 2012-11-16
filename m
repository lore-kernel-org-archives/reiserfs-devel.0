From: Jan Kara <jack@suse.cz>
Subject: [PATCH 1/4] reiserfs: Fix lock ordering during remount
Date: Fri, 16 Nov 2012 12:33:37 +0100
Message-ID: <1353065620-27279-2-git-send-email-jack@suse.cz>
References: <1353065620-27279-1-git-send-email-jack@suse.cz>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1353065620-27279-1-git-send-email-jack@suse.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <"jack@suse.cz>, stable"@vger.kernel.org#>, =@suse.cz, 3.0@suse.cz

When remounting reiserfs dquot_suspend() or dquot_resume() can be called.
These functions take dqonoff_mutex which ranks above write lock so we have
to drop it before calling into quota code.

CC: stable@vger.kernel.org # >= 3.0
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c |   27 ++++++++++++++++++++-------
 1 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 1078ae1..5372980 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1335,7 +1335,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 				kfree(qf_names[i]);
 #endif
 		err = -EINVAL;
-		goto out_err;
+		goto out_unlock;
 	}
 #ifdef CONFIG_QUOTA
 	handle_quota_files(s, qf_names, &qfmt);
@@ -1379,7 +1379,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	if (blocks) {
 		err = reiserfs_resize(s, blocks);
 		if (err != 0)
-			goto out_err;
+			goto out_unlock;
 	}
 
 	if (*mount_flags & MS_RDONLY) {
@@ -1389,9 +1389,15 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 			/* it is read-only already */
 			goto out_ok;
 
+		/*
+		 * Drop write lock. Quota will retake it when needed and lock
+		 * ordering requires calling dquot_suspend() without it.
+		 */
+		reiserfs_write_unlock(s);
 		err = dquot_suspend(s, -1);
 		if (err < 0)
 			goto out_err;
+		reiserfs_write_lock(s);
 
 		/* try to remount file system with read-only permissions */
 		if (sb_umount_state(rs) == REISERFS_VALID_FS
@@ -1401,7 +1407,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 
 		err = journal_begin(&th, s, 10);
 		if (err)
-			goto out_err;
+			goto out_unlock;
 
 		/* Mounting a rw partition read-only. */
 		reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
@@ -1416,7 +1422,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 
 		if (reiserfs_is_journal_aborted(journal)) {
 			err = journal->j_errno;
-			goto out_err;
+			goto out_unlock;
 		}
 
 		handle_data_mode(s, mount_options);
@@ -1425,7 +1431,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 		s->s_flags &= ~MS_RDONLY;	/* now it is safe to call journal_begin */
 		err = journal_begin(&th, s, 10);
 		if (err)
-			goto out_err;
+			goto out_unlock;
 
 		/* Mount a partition which is read-only, read-write */
 		reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
@@ -1442,10 +1448,16 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	SB_JOURNAL(s)->j_must_wait = 1;
 	err = journal_end(&th, s, 10);
 	if (err)
-		goto out_err;
+		goto out_unlock;
 
 	if (!(*mount_flags & MS_RDONLY)) {
+		/*
+		 * Drop write lock. Quota will retake it when needed and lock
+		 * ordering requires calling dquot_resume() without it.
+		 */
+		reiserfs_write_unlock(s);
 		dquot_resume(s, -1);
+		reiserfs_write_lock(s);
 		finish_unfinished(s);
 		reiserfs_xattr_init(s, *mount_flags);
 	}
@@ -1455,9 +1467,10 @@ out_ok:
 	reiserfs_write_unlock(s);
 	return 0;
 
+out_unlock:
+	reiserfs_write_unlock(s);
 out_err:
 	kfree(new_opts);
-	reiserfs_write_unlock(s);
 	return err;
 }
 
-- 
1.7.1

