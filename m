From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 4/4] reiser4: capture superblock when syncing fs
Date: Sun, 21 Oct 2012 19:59:38 +0200
Message-ID: <5084380A.9070502@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060506030603090803030005"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=xxnk8yswEsDO/Iif0WnQDnHMe5ElRS1suWSKz2/qsps=;
        b=rFZt7mIJSzWq+gFekg/ZdJg+x3Mhq00TLKMqD8ufbngI4R8G+2XRJHCXcPjJRwjis7
         I00NaGzkN1iPuE2BIv3BWXhfxHy4PgD3saTN227vfql6yJUEbG6b651F9GgXNDNNHwjH
         VWk5BQz2mid0Hd0jEgvBuEWkGwCUeKJqwsACnoVMtypMLDrdF1AdSVkVoGzWlhCC734o
         Go3wCpTDXR9sXzLYtpcqVT77aXWvwRbvuXurXmnVNmonAWQ8kqOKxnHnLR6LiXK4ow2D
         EpH8eDyd2lKpSI3fkdSA1PG9/F44rg9XwqMSiDSrUGuZdzi5vslJ4eSnJDbThHTjDMcu
         dDTg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------060506030603090803030005
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------060506030603090803030005
Content-Type: text/x-patch;
 name="reiser4-capture-superblock-when-syncing-fs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-capture-superblock-when-syncing-fs.patch"

. Capture super block when syncing fs to synchronize
  the superblock with the other stuff;
. Make gcc happy.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/carry_ops.c |    4 ++--
 fs/reiser4/super_ops.c |   13 ++++++++++++-
 fs/reiser4/tree.h      |    2 +-
 3 files changed, 15 insertions(+), 4 deletions(-)

--- linux-3.6.2_.orig/fs/reiser4/super_ops.c
+++ linux-3.6.2_/fs/reiser4/super_ops.c
@@ -397,6 +397,7 @@ static long reiser4_writeback_inodes(str
 /* ->sync_fs() of super operations */
 static int reiser4_sync_fs(struct super_block *super, int wait)
 {
+	int ret;
 	reiser4_context *ctx;
 	struct bdi_writeback *wb;
 	struct wb_writeback_work work = {
@@ -417,13 +418,23 @@ static int reiser4_sync_fs(struct super_
 		warning("edward-1567", "failed to init context");
 		return PTR_ERR(ctx);
 	}
+	/*
+	 * Capture znode associated with super block
+	 */
+	ret = reiser4_capture_super_block(super);
+	if (ret != 0)
+		warning("vs-1701",
+			"reiser4_capture_super_block failed in write_super: %d",
+			ret);
+
 	wb = &reiser4_get_super_fake(super)->i_mapping->backing_dev_info->wb;
 	spin_lock(&wb->list_lock);
 	generic_writeback_sb_inodes(super, wb, &wbc, &work, true);
 	spin_unlock(&wb->list_lock);
 	wbc.nr_to_write = LONG_MAX;
 	/*
-	 * flush goes here
+	 * (flush goes here)
+	 * commit all transactions
 	 */
 	reiser4_writeout(super, &wbc);
 
--- linux-3.6.2_.orig/fs/reiser4/carry_ops.c
+++ linux-3.6.2_/fs/reiser4/carry_ops.c
@@ -1339,7 +1339,7 @@ static int carry_delete(carry_op * op /*
 	    node_num_items(parent) == 1)
 		result = reiser4_kill_tree_root(coord.node);
 
-	return result < 0 ? : 0;
+	return result < 0 ? result : 0;
 }
 
 /* implements COP_CUT opration
@@ -1369,7 +1369,7 @@ static int carry_cut(carry_op * op /* op
 		result = nplug->cut_and_kill(op->u.cut_or_kill.u.kill, &info);
 
 	doing->restartable = 0;
-	return result < 0 ? : 0;
+	return result < 0 ? result : 0;
 }
 
 /* helper function for carry_paste(): returns true if @op can be continued as
--- linux-3.6.2_.orig/fs/reiser4/tree.h
+++ linux-3.6.2_/fs/reiser4/tree.h
@@ -405,7 +405,7 @@ typedef struct cbk_handle {
 	/* put here error message to be printed by caller */
 	const char *error;
 	/* result passed back to caller */
-	lookup_result result;
+	int result;
 	/* lock handles for active and parent */
 	lock_handle *parent_lh;
 	lock_handle *active_lh;

--------------060506030603090803030005--
