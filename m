From: Jan Kara <jack@suse.cz>
Subject: [PATCH 3/8] quota: Move quota syncing to ->sync_fs method
Date: Wed,  9 Nov 2011 18:45:02 +0100
Message-ID: <1320860707-18559-4-git-send-email-jack@suse.cz>
References: <1320860707-18559-1-git-send-email-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1320860707-18559-1-git-send-email-jack@suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: Christoph Hellwig <hch@infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>, Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>, Joel Becker <jlbec@evilplan.org>, reiserfs-devel@vger.kernel.org

Since the moment writes to quota files are using block device page cache and
space for quota structures is reserved at the moment they are first accessed we
have no reason to sync quota before inode writeback. In fact this order is now
only harmful since quota information can easily change during inode writeback
(either because conversion of delayed-allocated extents or simply because of
allocation of new blocks for simple filesystems not using page_mkwrite).

So move syncing of quota information after writeback of inodes into ->sync_fs
method. This way we do not have to use ->quota_sync callback which is primarily
intended for use by quotactl syscall anyway and we get rid of calling
->sync_fs() twice unnecessarily. We skip quota syncing for OCFS2 since it does
proper quota journalling in all cases (unlike ext3, ext4, and reiserfs which
also support legacy non-journalled quotas) and thus there are no dirty quota
structures.

CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Joel Becker <jlbec@evilplan.org>
CC: reiserfs-devel@vger.kernel.org
Acked-by: Steven Whitehouse <swhiteho@redhat.com>
Acked-by: Dave Kleikamp <shaggy@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/ext2/super.c     |    6 ++++++
 fs/ext3/super.c     |    5 +++++
 fs/ext4/super.c     |    5 +++++
 fs/gfs2/super.c     |    2 ++
 fs/jfs/super.c      |    5 +++++
 fs/reiserfs/super.c |    5 +++++
 fs/sync.c           |    3 ---
 7 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index bd8ac16..adf3cde 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -1180,6 +1180,12 @@ static int ext2_sync_fs(struct super_block *sb, int wait)
 	struct ext2_sb_info *sbi = EXT2_SB(sb);
 	struct ext2_super_block *es = EXT2_SB(sb)->s_es;
 
+	/*
+	 * Write quota structures to quota file, sync_blockdev() will write
+	 * them to disk later
+	 */
+	dquot_writeback_dquots(sb, -1);
+
 	spin_lock(&sbi->s_lock);
 	if (es->s_state & cpu_to_le16(EXT2_VALID_FS)) {
 		ext2_debug("setting valid to 0\n");
diff --git a/fs/ext3/super.c b/fs/ext3/super.c
index 922d289..b721140 100644
--- a/fs/ext3/super.c
+++ b/fs/ext3/super.c
@@ -2522,6 +2522,11 @@ static int ext3_sync_fs(struct super_block *sb, int wait)
 	tid_t target;
 
 	trace_ext3_sync_fs(sb, wait);
+	/*
+	 * Writeback quota in non-journalled quota case - journalled quota has
+	 * no dirty dquots
+	 */
+	dquot_writeback_dquots(sb, -1);
 	if (journal_start_commit(EXT3_SB(sb)->s_journal, &target)) {
 		if (wait)
 			log_wait_commit(EXT3_SB(sb)->s_journal, target);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 9953d80..a2d9098 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -4304,6 +4304,11 @@ static int ext4_sync_fs(struct super_block *sb, int wait)
 
 	trace_ext4_sync_fs(sb, wait);
 	flush_workqueue(sbi->dio_unwritten_wq);
+	/*
+	 * Writeback quota in non-journalled quota case - journalled quota has
+	 * no dirty dquots
+	 */
+	dquot_writeback_dquots(sb, -1);
 	if (jbd2_journal_start_commit(sbi->s_journal, &target)) {
 		if (wait)
 			jbd2_log_wait_commit(sbi->s_journal, target);
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index af40287..3757a9a 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -952,6 +952,8 @@ restart:
 static int gfs2_sync_fs(struct super_block *sb, int wait)
 {
 	struct gfs2_sbd *sdp = sb->s_fs_info;
+
+	gfs2_quota_sync(sb, -1);
 	if (wait && sdp)
 		gfs2_log_flush(sdp, NULL);
 	return 0;
diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index a44eff0..b9e0fca 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -602,6 +602,11 @@ static int jfs_sync_fs(struct super_block *sb, int wait)
 
 	/* log == NULL indicates read-only mount */
 	if (log) {
+		/*
+		 * Write quota structures to quota file, sync_blockdev() will
+		 * write them to disk later
+		 */
+		dquot_writeback_dquots(sb, -1);
 		jfs_flush_journal(log, wait);
 		jfs_syncpt(log, 0);
 	}
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 14363b9..dd7aec5 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -66,6 +66,11 @@ static int reiserfs_sync_fs(struct super_block *s, int wait)
 {
 	struct reiserfs_transaction_handle th;
 
+	/*
+	 * Writeback quota in non-journalled quota case - journalled quota has
+	 * no dirty dquots
+	 */
+	dquot_writeback_dquots(s, -1);
 	reiserfs_write_lock(s);
 	if (!journal_begin(&th, s, 1))
 		if (!journal_end_sync(&th, s, 1))
diff --git a/fs/sync.c b/fs/sync.c
index faad2d8..cda435f 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -30,9 +30,6 @@
  */
 static int __sync_filesystem(struct super_block *sb, int wait)
 {
-	if (sb->s_qcop && sb->s_qcop->quota_sync)
-		sb->s_qcop->quota_sync(sb, -1);
-
 	if (wait)
 		sync_inodes_sb(sb);
 	else
-- 
1.7.1

