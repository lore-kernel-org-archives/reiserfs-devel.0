From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/6] reiser4: adjust to writeback changes
Date: Wed, 07 Jul 2010 02:20:58 +0200
Message-ID: <4C33C86A.8010701@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090009080304020105000802"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090009080304020105000802
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------090009080304020105000802
Content-Type: text/plain;
 name="reiser4-adjust-writeback-changes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-adjust-writeback-changes.patch"

Adjust reiser4 to the latest vfs changes:
. Change reiser4_writeback_inodes();
. Use writeback_inodes_wb() instead of writeback_inodes_wbc().

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/entd.c       |    5 ++---
 fs/reiser4/page_cache.c |    3 ---
 fs/reiser4/super_ops.c  |    5 +++--
 3 files changed, 5 insertions(+), 8 deletions(-)

--- mmotm.orig/fs/reiser4/entd.c
+++ mmotm/fs/reiser4/entd.c
@@ -237,14 +237,13 @@ static void entd_flush(struct super_bloc
 		(ENTD_CAPTURE_APAGE_BURST << PAGE_CACHE_SHIFT);
 	tmp = rq->wbc->nr_to_write;
 
-	assert("edward-1561", super == rq->wbc->sb);
-
 	rq->mapping->a_ops->writepages(rq->mapping, rq->wbc);
 
 	if (rq->wbc->nr_to_write > 0) {
 		rq->wbc->range_start = 0;
 		rq->wbc->range_end = LLONG_MAX;
-		writeback_inodes_wbc(rq->wbc);
+		writeback_inodes_wb(&rq->mapping->backing_dev_info->wb,
+				    rq->wbc);
 	}
 	rq->wbc->nr_to_write = ENTD_CAPTURE_APAGE_BURST;
 
--- mmotm.orig/fs/reiser4/page_cache.c
+++ mmotm/fs/reiser4/page_cache.c
@@ -492,9 +492,6 @@ int reiser4_writepage(struct page *page,
 	 */
 	assert("vs-828", PageLocked(page));
 
-	wbc->sb = page->mapping->host->i_sb;
-	wbc->bdi = page->mapping->backing_dev_info;
-
 	return write_page_by_ent(page, wbc);
 }
 
--- mmotm.orig/fs/reiser4/super_ops.c
+++ mmotm/fs/reiser4/super_ops.c
@@ -391,7 +391,8 @@ static void reiser4_clear_inode(struct i
  */
 static int reiser4_writeback_inodes(struct super_block *super,
 				    struct bdi_writeback *wb,
-				    struct writeback_control *wbc)
+				    struct writeback_control *wbc,
+				    bool only_this_sb)
 {
 	int ret;
 	long to_write;
@@ -415,7 +416,7 @@ static int reiser4_writeback_inodes(stru
 	 * dirty pages into transactions if they were not yet.
 	 */
 	spin_lock(&inode_lock);
-	ret = generic_writeback_sb_inodes(super, wb, wbc);
+	ret = generic_writeback_sb_inodes(super, wb, wbc, only_this_sb);
 	spin_unlock(&inode_lock);
 
 	wbc->nr_to_write = to_write;

--------------090009080304020105000802--
