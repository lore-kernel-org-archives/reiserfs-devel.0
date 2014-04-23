From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 07/29] reiserfs: cleanup, remove blocks arg from journal_join
Date: Wed, 23 Apr 2014 10:00:40 -0400
Message-ID: <20140423151139.934019564@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-cleanup-remove-blocks-arg-from-journal_join
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

journal_join is always called with a block count of 1. Let's just get
rid of the argument.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/file.c     |    2 +-
 fs/reiserfs/journal.c  |   18 +++++++++---------
 fs/reiserfs/reiserfs.h |    2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -71,7 +71,7 @@ static int reiserfs_file_release(struct
 		 * aborted transaction
 		 */
 		jbegin_failure = err;
-		err = journal_join_abort(&th, inode->i_sb, 1);
+		err = journal_join_abort(&th, inode->i_sb);
 
 		if (err) {
 			/*
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -90,7 +90,7 @@ static int flush_commit_list(struct supe
 			     struct reiserfs_journal_list *jl, int flushall);
 static int can_dirty(struct reiserfs_journal_cnode *cn);
 static int journal_join(struct reiserfs_transaction_handle *th,
-			struct super_block *sb, unsigned long nblocks);
+			struct super_block *sb);
 static void release_journal_dev(struct super_block *super,
 			       struct reiserfs_journal *journal);
 static int dirty_one_transaction(struct super_block *s,
@@ -1925,7 +1925,7 @@ static int do_journal_release(struct rei
 		 * make sure something gets logged to force
 		 * our way into the flush code
 		 */
-		if (!journal_join(&myth, sb, 1)) {
+		if (!journal_join(&myth, sb)) {
 			reiserfs_prepare_for_journal(sb,
 						     SB_BUFFER_WITH_SB(sb),
 						     1);
@@ -1938,7 +1938,7 @@ static int do_journal_release(struct rei
 	/* this also catches errors during the do_journal_end above */
 	if (!error && reiserfs_is_journal_aborted(journal)) {
 		memset(&myth, 0, sizeof(myth));
-		if (!journal_join_abort(&myth, sb, 1)) {
+		if (!journal_join_abort(&myth, sb)) {
 			reiserfs_prepare_for_journal(sb,
 						     SB_BUFFER_WITH_SB(sb),
 						     1);
@@ -3092,7 +3092,7 @@ static int do_journal_begin_r(struct rei
 			}
 			goto relock;
 		}
-		retval = journal_join(&myth, sb, 1);
+		retval = journal_join(&myth, sb);
 		if (retval)
 			goto out_fail;
 
@@ -3181,7 +3181,7 @@ int reiserfs_end_persistent_transaction(
 }
 
 static int journal_join(struct reiserfs_transaction_handle *th,
-			struct super_block *sb, unsigned long nblocks)
+			struct super_block *sb)
 {
 	struct reiserfs_transaction_handle *cur_th = current->journal_info;
 
@@ -3191,11 +3191,11 @@ static int journal_join(struct reiserfs_
 	 */
 	th->t_handle_save = cur_th;
 	BUG_ON(cur_th && cur_th->t_refcount > 1);
-	return do_journal_begin_r(th, sb, nblocks, JBEGIN_JOIN);
+	return do_journal_begin_r(th, sb, 1, JBEGIN_JOIN);
 }
 
 int journal_join_abort(struct reiserfs_transaction_handle *th,
-		       struct super_block *sb, unsigned long nblocks)
+		       struct super_block *sb)
 {
 	struct reiserfs_transaction_handle *cur_th = current->journal_info;
 
@@ -3205,7 +3205,7 @@ int journal_join_abort(struct reiserfs_t
 	 */
 	th->t_handle_save = cur_th;
 	BUG_ON(cur_th && cur_th->t_refcount > 1);
-	return do_journal_begin_r(th, sb, nblocks, JBEGIN_ABORT);
+	return do_journal_begin_r(th, sb, 1, JBEGIN_ABORT);
 }
 
 int journal_begin(struct reiserfs_transaction_handle *th,
@@ -3571,7 +3571,7 @@ void reiserfs_flush_old_commits(struct s
 	    journal->j_trans_start_time > 0 &&
 	    journal->j_len > 0 &&
 	    (now - journal->j_trans_start_time) > journal->j_max_trans_age) {
-		if (!journal_join(&th, sb, 1)) {
+		if (!journal_join(&th, sb)) {
 			reiserfs_prepare_for_journal(sb,
 						     SB_BUFFER_WITH_SB(sb),
 						     1);
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -2924,7 +2924,7 @@ int reiserfs_in_journal(struct super_blo
 int journal_begin(struct reiserfs_transaction_handle *,
 		  struct super_block *sb, unsigned long);
 int journal_join_abort(struct reiserfs_transaction_handle *,
-		       struct super_block *sb, unsigned long);
+		       struct super_block *sb);
 void reiserfs_abort_journal(struct super_block *sb, int errno);
 void reiserfs_abort(struct super_block *sb, int errno, const char *fmt, ...);
 int reiserfs_allocate_list_bitmaps(struct super_block *s,


