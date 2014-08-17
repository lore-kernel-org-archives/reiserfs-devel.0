From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 7/7] reiser4: batch discard support: actually implement the FITRIM ioctl handler.
Date: Sun, 17 Aug 2014 20:26:35 +0400
Message-ID: <1408292795-1841-8-git-send-email-intelfx100@gmail.com>
References: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7kAMKmKGnJynH6KeTxpl2Rof+kxwOflrrT9gMWRYJRs=;
        b=emz9kN3w9nXt4ASrTEoqVQgo4IqSzmqLJKcyx5LsGqaWlBe3Gcc5tLqgmOHs8tZYHN
         KAmxq1el2unO6+o4OOfsUlzDoTrzz3/0QUUC1FSVbfxE4g+DlxPzYJx0zhZHGQ+OkEzF
         ov/4QD96Hsb2M3ZWHV5+GS7OFaX6ud3qFfL+wyOZ9S0uym8SMwPLcijyFm95EhjAjiW+
         BmX9KPHvFoBupt7+uO3GTCmonZG3T1glwfF7DWWbouQRnoGOt3diB8+F5tSrDd4awDzG
         pscPMN4xft+HbkeIgdTtoP47BmEWKmsj3xN83YlKUNRPDZ5gZsoyW3yxlMM5ZP2vpgGh
         usig==
In-Reply-To: <1408292795-1841-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

It works in an iterative way, grabbing some fixed amount of space and allocating
blocks until grabbed space is exhausted or partition's end is reached.

Blocks are scheduled for discard by allocating them and immediately adding them
to the atom's delete set, which is read and processed at atom commit time.

After reaching the allocation stop condition, the atom is force-committed and,
if the allocation has been stopped due to grabbed space exhaustion (not due to
reaching end of partition), another iteration happens.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/plugin/file_ops.c |  41 +++++++++++++-
 fs/reiser4/super_ops.c       | 131 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+), 3 deletions(-)

diff --git a/fs/reiser4/plugin/file_ops.c b/fs/reiser4/plugin/file_ops.c
index 65e2b02..7686406 100644
--- a/fs/reiser4/plugin/file_ops.c
+++ b/fs/reiser4/plugin/file_ops.c
@@ -8,6 +8,9 @@
 #include "../inode.h"
 #include "object.h"
 
+#include <linux/fs.h>
+#include <linux/blkdev.h>
+
 /* file operations */
 
 /* implementation of vfs's llseek method of struct file_operations for
@@ -20,6 +23,9 @@ loff_t reiser4_llseek_dir_common(struct file *, loff_t, int origin);
 */
 int reiser4_iterate_common(struct file *, struct dir_context *);
 
+/* this function is implemented in super_ops.c */
+int reiser4_trim_fs(struct super_block *super, struct fstrim_range* range);
+
 /**
  * reiser4_release_dir_common - release of struct file_operations
  * @inode: inode of released file
@@ -121,9 +127,38 @@ long reiser4_ioctl_dir_common(struct file *file, unsigned int cmd, unsigned long
 		return PTR_ERR(ctx);
 
 	switch (cmd) {
-	case FITRIM:
-		warning("intelfx-62", "FITRIM ioctl not implemented");
-		/* fall-through to -ENOSYS */
+	case FITRIM: {
+		struct request_queue *q = bdev_get_queue(super->s_bdev);
+		struct fstrim_range range;
+
+		if (!capable(CAP_SYS_ADMIN)) {
+			ret = RETERR(-EPERM);
+			break;
+		}
+
+		if (!blk_queue_discard(q)) {
+			ret = RETERR(-EOPNOTSUPP);
+			break;
+		}
+
+		if (copy_from_user(&range, (struct fstrim_range __user *)arg,
+		    sizeof(range))) {
+			ret = RETERR(-EFAULT);
+			break;
+		}
+
+		range.minlen = max((unsigned int)range.minlen,
+				   q->limits.discard_granularity);
+
+		ret = reiser4_trim_fs(super, &range);
+
+		if (copy_to_user((struct fstrim_range __user *)arg, &range,
+		    sizeof(range))) {
+			ret = RETERR(-EFAULT);
+		}
+
+		break;
+	}
 
 	default:
 		ret = RETERR(-ENOSYS);
diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index bcd7fd6..0048e83 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -14,6 +14,7 @@
 #include <linux/debugfs.h>
 #include <linux/backing-dev.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 
 /* slab cache for inodes */
 static struct kmem_cache *inode_cache;
@@ -471,6 +472,136 @@ static int reiser4_show_options(struct seq_file *m, struct dentry *dentry)
 	return 0;
 }
 
+/**
+ * reiser4_trim_fs - discards all free space in a filesystem
+ * @super: the superblock of filesystem to discard
+ * @range: parameters for discarding
+ *
+ * Called from @reiser4_ioctl_dir_common().
+ */
+int reiser4_trim_fs(struct super_block *super, struct fstrim_range* range)
+{
+	reiser4_blocknr_hint hint;
+	reiser4_block_nr start, end, len, minlen, discarded_count = 0;
+	reiser4_context *ctx;
+	struct super_block *sb;
+	txn_atom *atom;
+	int ret, finished = 0;
+
+	reiser4_blocknr_hint_init(&hint);
+	ctx = get_current_context();
+	sb = ctx->super;
+
+	/*
+	 * Configure the hint for block allocator.
+	 * We will allocate in forward direction only.
+	 */
+
+	hint.blk = range->start >> sb->s_blocksize_bits;
+	hint.max_dist = range->len >> sb->s_blocksize_bits;
+	hint.block_stage = BLOCK_GRABBED;
+	hint.forward = 1;
+
+	end = hint.blk + hint.max_dist;
+	minlen = range->minlen >> sb->s_blocksize_bits;
+
+	/*
+	 * We will perform the process in iterations in order not to starve
+	 * the rest of the system of disk space.
+	 * Each iteration we will grab some space (using the BA_SOME_SPACE
+	 * flag, which currently grabs 25% of free disk space), create an empty
+	 * atom and sequentially allocate extents of disk space while we can
+	 * afford it (i. e. while we haven't reached the end of partition AND
+	 * while we haven't exhausted the grabbed space).
+	 */
+	do {
+		/*
+		 * Grab some sane amount of space.
+		 * We will allocate blocks until end of the partition or until
+		 * the grabbed space is exhausted.
+		 */
+		ret = reiser4_grab_reserved(super, 0, BA_CAN_COMMIT | BA_SOME_SPACE);
+		if (ret != 0)
+			goto out;
+		if (ctx->grabbed_blocks == 0)
+			goto out;
+
+		/*
+		 * We will not capture anything, so we need an empty atom.
+		 */
+		ret = reiser4_create_atom();
+		if (ret != 0)
+			goto out;
+
+		while (ctx->grabbed_blocks != 0) {
+			/*
+			 * Allocate no more than is grabbed.
+			 * FIXME: use minlen.
+			 */
+			len = ctx->grabbed_blocks;
+			ret = reiser4_alloc_blocks(&hint, &start, &len, 0 /* flags */);
+			if (ret == -ENOSPC)
+				break;
+			if (ret != 0)
+				goto out;
+
+			/*
+			 * Update the hint in order for the next scan to start
+			 * right after the newly allocated extent.
+			 */
+			hint.blk = start + len;
+			hint.max_dist = end - hint.blk;
+
+			/*
+			 * Mark the newly allocated extent for deallocation.
+			 * Discard happens on deallocation.
+			 */
+			ret = reiser4_dealloc_blocks(&start, &len, BLOCK_NOT_COUNTED, BA_DEFER);
+			if (ret != 0)
+				goto out;
+
+			/*
+			 * FIXME: get the actual discarded block count,
+			 * accounting for speculative discard of extent heads and tails.
+			 *
+			 * PRIORITY: LOW because we have already allocated all
+			 * possible space, so allocations of heads/tails will
+			 * fail unless there is a concurrent process reclaiming
+			 * space.
+			 */
+			discarded_count += len;
+		}
+
+		assert("intelfx-64", (ret == 0) || (ret == -ENOSPC));
+
+		if (ret == -ENOSPC) {
+			ret = 0;
+			finished = 1;
+		}
+
+		/*
+		 * Extents marked for deallocation are discarded here, as part
+		 * of committing current atom.
+		 */
+		atom = get_current_atom_locked();
+		spin_lock_txnh(ctx->trans);
+		force_commit_atom(ctx->trans);
+		all_grabbed2free();
+		grab_space_enable();
+	} while (!finished);
+
+out:
+	reiser4_release_reserved(super);
+	reiser4_blocknr_hint_done(&hint);
+
+	/*
+	 * Update the statistics.
+	 */
+	range->len = discarded_count << sb->s_blocksize_bits;
+
+	return ret;
+}
+
 struct super_operations reiser4_super_operations = {
 	.alloc_inode = reiser4_alloc_inode,
 	.destroy_inode = reiser4_destroy_inode,
-- 
2.0.4

