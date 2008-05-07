From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 3/3] [PATCH] reiserfs: convert j_commit_lock to mutex
Date: Wed, 7 May 2008 01:51:40 +0000 (UTC)
Message-ID: <20080508063653.480641970@suse.com>
References: <20080508063557.757413878@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Date: Thu, 08 May 2008 02:36:00 -0400
Content-Disposition: inline; filename=reiserfs-j_commit_lock-mutex
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

 j_commit_lock is a semaphore but uses it as if it were a mutex. This
 patch converts it to a mutex.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/journal.c          |   18 +++++++-----------
 include/linux/reiserfs_fs_sb.h |    2 +-
 2 files changed, 8 insertions(+), 12 deletions(-)

--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -36,13 +36,9 @@
 
 #include <asm/uaccess.h>
 #include <asm/system.h>
-
 #include <linux/time.h>
-#include <asm/semaphore.h>
-
 #include <linux/vmalloc.h>
 #include <linux/reiserfs_fs.h>
-
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/fcntl.h>
@@ -1045,9 +1041,9 @@ static int flush_commit_list(struct supe
 	}
 
 	/* make sure nobody is trying to flush this one at the same time */
-	down(&jl->j_commit_lock);
+	mutex_lock(&jl->j_commit_mutex);
 	if (!journal_list_still_alive(s, trans_id)) {
-		up(&jl->j_commit_lock);
+		mutex_unlock(&jl->j_commit_mutex);
 		goto put_jl;
 	}
 	BUG_ON(jl->j_trans_id == 0);
@@ -1057,7 +1053,7 @@ static int flush_commit_list(struct supe
 		if (flushall) {
 			atomic_set(&(jl->j_older_commits_done), 1);
 		}
-		up(&jl->j_commit_lock);
+		mutex_unlock(&jl->j_commit_mutex);
 		goto put_jl;
 	}
 
@@ -1181,7 +1177,7 @@ static int flush_commit_list(struct supe
 	if (flushall) {
 		atomic_set(&(jl->j_older_commits_done), 1);
 	}
-	up(&jl->j_commit_lock);
+	mutex_unlock(&jl->j_commit_mutex);
       put_jl:
 	put_journal_list(s, jl);
 
@@ -2556,7 +2552,7 @@ static struct reiserfs_journal_list *all
 	INIT_LIST_HEAD(&jl->j_working_list);
 	INIT_LIST_HEAD(&jl->j_tail_bh_list);
 	INIT_LIST_HEAD(&jl->j_bh_list);
-	sema_init(&jl->j_commit_lock, 1);
+	mutex_init(&jl->j_commit_mutex);
 	SB_JOURNAL(s)->j_num_lists++;
 	get_journal_list(jl);
 	return jl;
@@ -4034,7 +4030,7 @@ static int do_journal_end(struct reiserf
 	 * the new transaction is fully setup, and we've already flushed the
 	 * ordered bh list
 	 */
-	down(&jl->j_commit_lock);
+	mutex_lock(&jl->j_commit_mutex);
 
 	/* save the transaction id in case we need to commit it later */
 	commit_trans_id = jl->j_trans_id;
@@ -4200,7 +4196,7 @@ static int do_journal_end(struct reiserf
 		lock_kernel();
 	}
 	BUG_ON(!list_empty(&jl->j_tail_bh_list));
-	up(&jl->j_commit_lock);
+	mutex_unlock(&jl->j_commit_mutex);
 
 	/* honor the flush wishes from the caller, simple commits can
 	 ** be done outside the journal lock, they are done below
--- a/include/linux/reiserfs_fs_sb.h
+++ b/include/linux/reiserfs_fs_sb.h
@@ -152,7 +152,7 @@ struct reiserfs_journal_list {
 	atomic_t j_nonzerolen;
 	atomic_t j_commit_left;
 	atomic_t j_older_commits_done;	/* all commits older than this on disk */
-	struct semaphore j_commit_lock;
+	struct mutex j_commit_mutex;
 	unsigned long j_trans_id;
 	time_t j_timestamp;
 	struct reiserfs_list_bitmap *j_list_bitmap;

