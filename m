From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/7] roll back reiser4-generic_sync_sb_inodes-doesnt-exist-anymore.patch
Date: Tue, 2 Feb 2010 02:56:11 +0100
Message-ID: <201002020256.12110.edward.shishkin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:subject:date
         :user-agent:mime-version:message-id:content-type
         :content-transfer-encoding;
        bh=26J8QatdcGWztBZJ5P81Tyql6wBWFO0ZRIEvtpb2XGg=;
        b=vDNbHg4qi40TFdRGlwuxBW11LaeA/m4f3qN9a8haSzeU+8HNwvBuqtu+ngpG18/hcy
         8g0sT4wm4S+gyHoy3XESxXMgqP4olXLBoc5z/bXGlu6s3wEa504xsPkmeYPbNzEu8VYH
         EbQ0HiNGDnFGJS3QIKaEHnVcARU32ymh59ZJ4=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Roll back reiser4-generic_sync_sb_inodes-doesnt-exist-anymore.patch
(wrong stuff)

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/context.h   |    2 +-
 fs/reiser4/entd.c      |    4 +---
 fs/reiser4/super_ops.c |    6 ++----
 3 files changed, 4 insertions(+), 8 deletions(-)

Index: linux-2.6.33-rc5-mm1/fs/reiser4/context.h
===================================================================
--- linux-2.6.33-rc5-mm1.orig/fs/reiser4/context.h
+++ linux-2.6.33-rc5-mm1/fs/reiser4/context.h
@@ -66,7 +66,7 @@ struct reiser4_context {
 	/* count non-trivial jnode_set_dirty() calls */
 	unsigned long nr_marked_dirty;
 
-	/* reiser4_sync_inodes calls (via writeback/sync_inodes_sb)
+	/* reiser4_sync_inodes calls (via generic_sync_sb_inodes)
 	 * reiser4_writepages for each of dirty inodes. Reiser4_writepages
 	 * captures pages. When number of pages captured in one
 	 * reiser4_sync_inodes reaches some threshold - some atoms get
Index: linux-2.6.33-rc5-mm1/fs/reiser4/entd.c
===================================================================
--- linux-2.6.33-rc5-mm1.orig/fs/reiser4/entd.c
+++ linux-2.6.33-rc5-mm1/fs/reiser4/entd.c
@@ -241,9 +241,7 @@ static void entd_flush(struct super_bloc
 	if (rq->wbc->nr_to_write > 0) {
 		rq->wbc->range_start = 0;
 		rq->wbc->range_end = LLONG_MAX;
-		writeback_inodes_sb(super);
-		if (rq->wbc->sync_mode == WB_SYNC_ALL)
-			sync_inodes_sb(super);
+		generic_sync_sb_inodes(rq->wbc);
 	}
 	rq->wbc->nr_to_write = ENTD_CAPTURE_APAGE_BURST;
 	reiser4_writeout(super, rq->wbc);
Index: linux-2.6.33-rc5-mm1/fs/reiser4/super_ops.c
===================================================================
--- linux-2.6.33-rc5-mm1.orig/fs/reiser4/super_ops.c
+++ linux-2.6.33-rc5-mm1/fs/reiser4/super_ops.c
@@ -384,7 +384,7 @@ static void reiser4_clear_inode(struct i
  * @wbc:
  *
  * This method is called by background and non-backgound writeback. Reiser4's
- * implementation uses writeback/sync_inodes_sb to call reiser4_writepages for
+ * implementation uses generic_sync_sb_inodes to call reiser4_writepages for
  * each of dirty inodes. Reiser4_writepages handles pages dirtied via shared
  * mapping - dirty pages get into atoms. Writeout is called to flush some
  * atoms.
@@ -412,9 +412,7 @@ static void reiser4_sync_inodes(struct s
 	 * call reiser4_writepages for each of dirty inodes to turn dirty pages
 	 * into transactions if they were not yet.
 	 */
-	writeback_inodes_sb(super);
-	if (wbc->sync_mode == WB_SYNC_ALL)
-		sync_inodes_sb(super);
+	generic_sync_sb_inodes(wbc);
 
 	/* flush goes here */
 	wbc->nr_to_write = to_write;
