From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/5] reiserfs: clean-up function return type
Date: Fri,  1 Jun 2012 17:18:05 +0300
Message-ID: <1338560288-10727-3-git-send-email-dedekind1@gmail.com>
References: <1338560288-10727-1-git-send-email-dedekind1@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1338560288-10727-1-git-send-email-dedekind1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux FS Maling List <linux-fsdevel@vger.kernel.org>, Linux Kernel Maling List <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Turn 'reiserfs_flush_old_commits()' into a void function because the callers
do not cares about what it returns anyway.

We are going to remove the 'sb->s_dirt' field completely and this patch is a
small step towards this direction.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/reiserfs/journal.c  |    8 +++-----
 fs/reiserfs/reiserfs.h |    2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index b1a0857..68aea62 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -3492,7 +3492,7 @@ static void flush_async_commits(struct work_struct *work)
 ** flushes any old transactions to disk
 ** ends the current transaction if it is too old
 */
-int reiserfs_flush_old_commits(struct super_block *sb)
+void reiserfs_flush_old_commits(struct super_block *sb)
 {
 	time_t now;
 	struct reiserfs_transaction_handle th;
@@ -3502,9 +3502,8 @@ int reiserfs_flush_old_commits(struct super_block *sb)
 	/* safety check so we don't flush while we are replaying the log during
 	 * mount
 	 */
-	if (list_empty(&journal->j_journal_list)) {
-		return 0;
-	}
+	if (list_empty(&journal->j_journal_list))
+		return;
 
 	/* check the current transaction.  If there are no writers, and it is
 	 * too old, finish it, and force the commit blocks to disk
@@ -3526,7 +3525,6 @@ int reiserfs_flush_old_commits(struct super_block *sb)
 			do_journal_end(&th, sb, 1, COMMIT_NOW | WAIT);
 		}
 	}
-	return sb->s_dirt;
 }
 
 /*
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index a59d271..09664c9 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -2452,7 +2452,7 @@ struct reiserfs_transaction_handle *reiserfs_persistent_transaction(struct
 int reiserfs_end_persistent_transaction(struct reiserfs_transaction_handle *);
 int reiserfs_commit_page(struct inode *inode, struct page *page,
 			 unsigned from, unsigned to);
-int reiserfs_flush_old_commits(struct super_block *);
+void reiserfs_flush_old_commits(struct super_block *);
 int reiserfs_commit_for_inode(struct inode *);
 int reiserfs_inode_needs_commit(struct inode *);
 void reiserfs_update_inode_transaction(struct inode *);
-- 
1.7.7.6
