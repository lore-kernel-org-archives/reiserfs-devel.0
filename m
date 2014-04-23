From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 01/29] reiserfs: use per-fs commit workqueues
Date: Wed, 23 Apr 2014 10:00:34 -0400
Message-ID: <20140423151139.033812424@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=patches.fixes/reiserfs-get-rid-of-reiserfs_mounted_fs_count
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

The reiserfs write lock hasn't been the BKL for some time. There's no
need to have different file systems queued up on the same workqueue.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/journal.c  |   22 +++-------------------
 fs/reiserfs/reiserfs.h |    2 ++
 fs/reiserfs/super.c    |   21 +++++++++++++++------
 3 files changed, 20 insertions(+), 25 deletions(-)

--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -58,13 +58,6 @@
 #define JOURNAL_WORK_ENTRY(h) (list_entry((h), struct reiserfs_journal_list, \
                                j_working_list))
 
-/* the number of mounted filesystems.  This is used to decide when to
-** start and kill the commit workqueue
-*/
-static int reiserfs_mounted_fs_count;
-
-static struct workqueue_struct *commit_wq;
-
 #define JOURNAL_TRANS_HALF 1018	/* must be correct to keep the desc and commit
 				   structs at 4k */
 #define BUFNR 64		/*read ahead */
@@ -1909,7 +1902,6 @@ static int do_journal_release(struct rei
 		}
 	}
 
-	reiserfs_mounted_fs_count--;
 	/* wait for all commits to finish */
 	cancel_delayed_work(&SB_JOURNAL(sb)->j_work);
 
@@ -1920,12 +1912,7 @@ static int do_journal_release(struct rei
 	reiserfs_write_unlock(sb);
 
 	cancel_delayed_work_sync(&REISERFS_SB(sb)->old_work);
-	flush_workqueue(commit_wq);
-
-	if (!reiserfs_mounted_fs_count) {
-		destroy_workqueue(commit_wq);
-		commit_wq = NULL;
-	}
+	flush_workqueue(REISERFS_SB(sb)->commit_wq);
 
 	free_journal_ram(sb);
 
@@ -2799,10 +2786,6 @@ int journal_init(struct super_block *sb,
 		goto free_and_return;
 	}
 
-	reiserfs_mounted_fs_count++;
-	if (reiserfs_mounted_fs_count <= 1)
-		commit_wq = alloc_workqueue("reiserfs", WQ_MEM_RECLAIM, 0);
-
 	INIT_DELAYED_WORK(&journal->j_work, flush_async_commits);
 	journal->j_work_sb = sb;
 	return 0;
@@ -4115,7 +4098,8 @@ static int do_journal_end(struct reiserf
 		flush_commit_list(sb, jl, 1);
 		flush_journal_list(sb, jl, 1);
 	} else if (!(jl->j_state & LIST_COMMIT_PENDING))
-		queue_delayed_work(commit_wq, &journal->j_work, HZ / 10);
+		queue_delayed_work(REISERFS_SB(sb)->commit_wq,
+				   &journal->j_work, HZ / 10);
 
 	/* if the next transaction has any chance of wrapping, flush
 	 ** transactions that might get overwritten.  If any journal lists are very
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -431,6 +431,8 @@ struct reiserfs_sb_info {
 	/* Depth of the lock, start from -1 like the bkl */
 	int lock_depth;
 
+	struct workqueue_struct *commit_wq;
+
 	/* Comment? -Hans */
 	void (*end_io_handler) (struct buffer_head *, int);
 	hashf_t s_hash_function;	/* pointer to function which is used
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -560,6 +560,7 @@ static void reiserfs_put_super(struct su
 
 	reiserfs_write_unlock(s);
 	mutex_destroy(&REISERFS_SB(s)->lock);
+	destroy_workqueue(REISERFS_SB(s)->commit_wq);
 	kfree(s->s_fs_info);
 	s->s_fs_info = NULL;
 }
@@ -1796,6 +1797,14 @@ static int reiserfs_fill_super(struct su
 	mutex_init(&sbi->lock);
 	sbi->lock_depth = -1;
 
+	sbi->commit_wq = alloc_workqueue("reiserfs/%s", WQ_MEM_RECLAIM, 0,
+					 s->s_id);
+	if (!sbi->commit_wq) {
+		SWARN(silent, s, "", "Cannot allocate commit workqueue");
+		errval = -ENOMEM;
+		goto error_unlocked;
+	}
+
 	jdev_name = NULL;
 	if (reiserfs_parse_options
 	    (s, (char *)data, &(sbi->s_mount_opt), &blocks, &jdev_name,
@@ -2402,18 +2411,18 @@ static int __init init_reiserfs_fs(void)
 {
 	int ret;
 
-	if ((ret = init_inodecache())) {
+	ret = init_inodecache();
+	if (ret)
 		return ret;
-	}
 
 	reiserfs_proc_info_global_init();
 
 	ret = register_filesystem(&reiserfs_fs_type);
+	if (ret)
+		goto out;
 
-	if (ret == 0) {
-		return 0;
-	}
-
+	return 0;
+out:
 	reiserfs_proc_info_global_done();
 	destroy_inodecache();
 


