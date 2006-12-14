From: Johannes Hirte <hirtejs@idmt.fraunhofer.de>
Subject: deadlock produced by reiser4-patch
Date: Thu, 14 Dec 2006 21:13:26 +0100
Message-ID: <200612142113.27072.hirtejs@idmt.fraunhofer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30322-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

The reiser4-patch for 2.6.18 (also included in the mm-tree) contains some 
changes to sync_sb_inodes, which produces a deadlock on SMP-configured 
kernels.

diff -urN linux-2.6.18.orig/fs/fs-writeback.c linux-2.6.18/fs/fs-writeback.c
--- linux-2.6.18.orig/fs/fs-writeback.c	2006-11-20 00:43:20.178243289 +0300
+++ linux-2.6.18/fs/fs-writeback.c	2006-11-19 17:36:10.394665097 +0300
@@ -286,8 +286,6 @@
  * WB_SYNC_HOLD is a hack for sys_sync(): reattach the inode to sb->s_dirty 
so
  * that it can be located for waiting on in __writeback_single_inode().
  *
- * Called under inode_lock.
- *
  * If `bdi' is non-zero then we're being asked to writeback a specific queue.
  * This function assumes that the blockdev superblock's inodes are backed by
  * a variety of queues, so all inodes are searched.  For other superblocks,
@@ -303,11 +301,13 @@
  * on the writer throttling path, and we get decent balancing between many
  * throttled threads: we don't want them all piling up on __wait_on_inode.
  */
-static void
-sync_sb_inodes(struct super_block *sb, struct writeback_control *wbc)
+void
+generic_sync_sb_inodes(struct super_block *sb, struct writeback_control *wbc)
 {
 	const unsigned long start = jiffies;	/* livelock avoidance */
 
+	spin_lock(&inode_lock);
+
 	if (!wbc->for_kupdate || list_empty(&sb->s_io))
 		list_splice_init(&sb->s_dirty, &sb->s_io);
 
@@ -387,8 +387,19 @@
 		if (wbc->nr_to_write <= 0)
 			break;
 	}
+	spin_unlock(&inode_lock);
 	return;		/* Leave any unwritten inodes on s_io */
 }
+EXPORT_SYMBOL(generic_sync_sb_inodes);
+
+static void
+sync_sb_inodes(struct super_block *sb, struct writeback_control *wbc)
+{
+	if (sb->s_op->sync_inodes)
+		sb->s_op->sync_inodes(sb, wbc);
+	else
+		generic_sync_sb_inodes(sb, wbc);
+}

The spinlock, which is introduced here, is already held by sync_inodes_sb, 
which themselve call sync_sb_inodes, the system hangs here. 
