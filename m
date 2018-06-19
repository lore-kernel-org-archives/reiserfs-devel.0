From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/3] reiserfs: remove unused j_timestamp
Date: Tue, 19 Jun 2018 17:43:13 +0200
Message-ID: <20180619154343.3640484-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>
Cc: y2038@lists.linaro.org, Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

This uses the deprecated time_t type but is write-only, so we
can just remove it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/reiserfs/journal.c  | 1 -
 fs/reiserfs/reiserfs.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 52eb5d293a34..1e7f733b2a12 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -4110,7 +4110,6 @@ static int do_journal_end(struct reiserfs_transaction_handle *th, int flags)
 
 	atomic_set(&jl->j_older_commits_done, 0);
 	jl->j_trans_id = journal->j_trans_id;
-	jl->j_timestamp = journal->j_trans_start_time;
 	jl->j_commit_bh = c_bh;
 	jl->j_start = journal->j_start;
 	jl->j_len = journal->j_len;
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index ae4811fecc1f..1536ebbaf6ab 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -271,7 +271,6 @@ struct reiserfs_journal_list {
 
 	struct mutex j_commit_mutex;
 	unsigned int j_trans_id;
-	time_t j_timestamp;
 	struct reiserfs_list_bitmap *j_list_bitmap;
 	struct buffer_head *j_commit_bh;	/* commit buffer head */
 	struct reiserfs_journal_cnode *j_realblock;
-- 
2.9.0

