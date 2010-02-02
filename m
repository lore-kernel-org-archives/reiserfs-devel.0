From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 4/7] VFS: improve writeback_inodes_wb
Date: Tue, 2 Feb 2010 02:56:18 +0100
Message-ID: <201002020256.18841.edward.shishkin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:subject:date
         :user-agent:mime-version:message-id:cc:content-type
         :content-transfer-encoding;
        bh=8XRM8+zUYcaWPP+4tswejqVP/EH9DBkNfX+Nx4FroHw=;
        b=DQ62v01F0+kYEr7R+pw4C4EGOpkzf6IAhOBFj6PKnnhVZ40jWcjimiLsHsa7e1bbyW
         mEOMl2g13ZBdXYcKM4QGNkzsiOjpZ6v1vjx2A/zuIA+7GzKKozG1ktos78sWJPs/5ukb
         2fzfxs8LSF1lPqV/MC6RlIsGTUYEN039hwZmA=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, jens.axboe@oracle.com

Do not pin/unpin superblock for every inode in
writeback_inodes_wb(), pin it for the whole group
of inodes which belong to the same superblock and
call writeback_sb_inodes() handler for them.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/fs-writeback.c         |  133 +++++++++++++++++++++++++---------------------
 include/linux/writeback.h |    3 +
 2 files changed, 76 insertions(+), 60 deletions(-)

Index: linux-2.6.33-rc5-mm1/fs/fs-writeback.c
===================================================================
--- linux-2.6.33-rc5-mm1.orig/fs/fs-writeback.c
+++ linux-2.6.33-rc5-mm1/fs/fs-writeback.c
@@ -553,108 +553,85 @@ select_queue:
 	return ret;
 }
 
-static void unpin_sb_for_writeback(struct super_block **psb)
+static void unpin_sb_for_writeback(struct super_block *sb)
 {
-	struct super_block *sb = *psb;
-
-	if (sb) {
-		up_read(&sb->s_umount);
-		put_super(sb);
-		*psb = NULL;
-	}
+	up_read(&sb->s_umount);
+	put_super(sb);
 }
 
+enum sb_pin_state {
+	SB_PINNED,
+	SB_NOT_PINNED,
+	SB_PIN_FAILED
+};
+
 /*
  * For WB_SYNC_NONE writeback, the caller does not have the sb pinned
  * before calling writeback. So make sure that we do pin it, so it doesn't
  * go away while we are writing inodes from it.
- *
- * Returns 0 if the super was successfully pinned (or pinning wasn't needed),
- * 1 if we failed.
  */
-static int pin_sb_for_writeback(struct writeback_control *wbc,
-				struct inode *inode, struct super_block **psb)
+static enum sb_pin_state pin_sb_for_writeback(struct writeback_control *wbc,
+					      struct super_block *sb)
 {
-	struct super_block *sb = inode->i_sb;
-
-	/*
-	 * If this sb is already pinned, nothing more to do. If not and
-	 * *psb is non-NULL, unpin the old one first
-	 */
-	if (sb == *psb)
-		return 0;
-	else if (*psb)
-		unpin_sb_for_writeback(psb);
-
 	/*
 	 * Caller must already hold the ref for this
 	 */
 	if (wbc->sync_mode == WB_SYNC_ALL) {
 		WARN_ON(!rwsem_is_locked(&sb->s_umount));
-		return 0;
+		return SB_NOT_PINNED;
 	}
-
 	spin_lock(&sb_lock);
 	sb->s_count++;
 	if (down_read_trylock(&sb->s_umount)) {
 		if (sb->s_root) {
 			spin_unlock(&sb_lock);
-			goto pinned;
+			return SB_PINNED;
 		}
 		/*
 		 * umounted, drop rwsem again and fall through to failure
 		 */
 		up_read(&sb->s_umount);
 	}
-
 	sb->s_count--;
 	spin_unlock(&sb_lock);
-	return 1;
-pinned:
-	*psb = sb;
-	return 0;
+	return SB_PIN_FAILED;
 }
 
-static void writeback_inodes_wb(struct bdi_writeback *wb,
-				struct writeback_control *wbc)
+/*
+ * Write a portion of b_io inodes which belong to @sb.
+ * If @wbc->sb != NULL, then find and write all such
+ * inodes. Otherwise write only ones which go sequentially
+ * in reverse order.
+ * Return 1, if the caller writeback routine should be
+ * interrupted. Otherwise return 0.
+ */
+static int writeback_sb_inodes(struct super_block *sb,
+			       struct bdi_writeback *wb,
+			       struct writeback_control *wbc)
 {
-	struct super_block *sb = wbc->sb, *pin_sb = NULL;
-	const unsigned long start = jiffies;	/* livelock avoidance */
-
-	spin_lock(&inode_lock);
-
-	if (!wbc->for_kupdate || list_empty(&wb->b_io))
-		queue_io(wb, wbc->older_than_this);
-
 	while (!list_empty(&wb->b_io)) {
-		struct inode *inode = list_entry(wb->b_io.prev,
-						struct inode, i_list);
 		long pages_skipped;
-
-		/*
-		 * super block given and doesn't match, skip this inode
-		 */
-		if (sb && sb != inode->i_sb) {
+		struct inode *inode = list_entry(wb->b_io.prev,
+						 struct inode, i_list);
+		if (wbc->sb && sb != inode->i_sb) {
+			/* super block given and doesn't
+			   match, skip this inode */
 			redirty_tail(inode);
 			continue;
 		}
-
+		if (sb != inode->i_sb)
+			/* finish with this superblock */
+			return 0;
 		if (inode->i_state & (I_NEW | I_WILL_FREE)) {
 			requeue_io(inode);
 			continue;
 		}
-
 		/*
 		 * Was this inode dirtied after sync_sb_inodes was called?
 		 * This keeps sync from extra jobs and livelock.
 		 */
-		if (inode_dirtied_after(inode, start))
-			break;
-
-		if (pin_sb_for_writeback(wbc, inode, &pin_sb)) {
-			requeue_io(inode);
-			continue;
-		}
+		if (inode_dirtied_after(inode, wbc->wb_start))
+			return 1;
 
 		BUG_ON(inode->i_state & (I_FREEING | I_CLEAR));
 		__iget(inode);
@@ -673,14 +650,50 @@ static void writeback_inodes_wb(struct b
 		spin_lock(&inode_lock);
 		if (wbc->nr_to_write <= 0) {
 			wbc->more_io = 1;
-			break;
+			return 1;
 		}
 		if (!list_empty(&wb->b_more_io))
 			wbc->more_io = 1;
 	}
+	/* b_io is empty */
+	return 1;
+}
+
+static void writeback_inodes_wb(struct bdi_writeback *wb,
+				struct writeback_control *wbc)
+{
+	int ret = 0;
 
-	unpin_sb_for_writeback(&pin_sb);
+	wbc->wb_start = jiffies; /* livelock avoidance */
+	spin_lock(&inode_lock);
+	if (!wbc->for_kupdate || list_empty(&wb->b_io))
+		queue_io(wb, wbc->older_than_this);
 
+	while (!list_empty(&wb->b_io)) {
+		struct inode *inode = list_entry(wb->b_io.prev,
+						 struct inode, i_list);
+		struct super_block *sb = inode->i_sb;
+		enum sb_pin_state state;
+
+		if (wbc->sb && sb != wbc->sb) {
+			/* super block given and doesn't
+			   match, skip this inode */
+			redirty_tail(inode);
+			continue;
+		}
+		state = pin_sb_for_writeback(wbc, sb);
+
+		if (state == SB_PIN_FAILED) {
+			requeue_io(inode);
+			continue;
+		}
+		ret = writeback_sb_inodes(sb, wb, wbc);
+
+		if (state == SB_PINNED)
+			unpin_sb_for_writeback(sb);
+		if (ret)
+			break;
+	}
 	spin_unlock(&inode_lock);
 	/* Leave any unwritten inodes on b_io */
 }
Index: linux-2.6.33-rc5-mm1/include/linux/writeback.h
===================================================================
--- linux-2.6.33-rc5-mm1.orig/include/linux/writeback.h
+++ linux-2.6.33-rc5-mm1/include/linux/writeback.h
@@ -34,6 +34,9 @@ struct writeback_control {
 	enum writeback_sync_modes sync_mode;
 	unsigned long *older_than_this;	/* If !NULL, only write back inodes
 					   older than this */
+	unsigned long wb_start;         /* Time writeback_inodes_wb was
+					   called. This is needed to avoid
+					   extra jobs and livelock */
 	long nr_to_write;		/* Write this many pages, and decrement
 					   this for each page written */
 	long pages_skipped;		/* Pages which were not written */
