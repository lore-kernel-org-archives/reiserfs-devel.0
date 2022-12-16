From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH 1/8] reiserfs: use b_folio instead of b_page in some obvious cases
Date: Fri, 16 Dec 2022 20:53:40 +0000
Message-ID: <20221216205348.3781217-2-willy@infradead.org>
References: <20221216205348.3781217-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=CQ97DsGJ4Y1Qura2GbbzIPIdSqcmYgGw1zGOmtPnJ54=; b=lpXh0kCICoVi689Oqyg6kl4q9s
        7zsctC1h96NJuYSSymBTddqUC2ISEeyKCxdXL+xwcEfsrsoooJoPk3ykHkzOD6opHHWdUeXVT5rP/
        EioN7Jn32O0Iy/XhKcsMWfhYRAb0BMxe6dwF4CTOXrpyPVioO6ygLP+tUiBrhCuGSNfE+6cKo44XB
        dcawOTuJV4wXhc8YSr8E/IPje12TlxnK2+x7k4HvncBiu6bn+5+Y38SdQarZSc2l9t03YWROS4Hcp
        oWIYFXrvok6FkCTDkVNuormND7yp3hFVCJK32JnjNkoynKZx65jovmC0jhtJxrDyjBg++lrOpFx89
        ZlHZR3Dw==;
In-Reply-To: <20221216205348.3781217-1-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Ira Weiny <ira.weiny@intel.com>

These are checks against NULL, tests for uptodateness, comments and
printing the value.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/reiserfs/inode.c           | 12 ++++++------
 fs/reiserfs/prints.c          |  4 ++--
 fs/reiserfs/tail_conversion.c |  9 +++++----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index c7d1fa526dea..41c0a785e9ab 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -313,7 +313,7 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 		 * associated with it that is yet to be written to disk.
 		 */
 		if ((args & GET_BLOCK_NO_HOLE)
-		    && !PageUptodate(bh_result->b_page)) {
+		    && !folio_test_uptodate(bh_result->b_folio)) {
 			return -ENOENT;
 		}
 		return 0;
@@ -345,7 +345,7 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 			 * yet to be written to disk.
 			 */
 		if ((args & GET_BLOCK_NO_HOLE)
-			    && !PageUptodate(bh_result->b_page)) {
+			    && !folio_test_uptodate(bh_result->b_folio)) {
 			ret = -ENOENT;
 		}
 
@@ -376,7 +376,7 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 		 * to date, we don't want read old data off disk.  Set the up
 		 * to date bit on the buffer instead and jump to the end
 		 */
-	if (!bh_result->b_page || PageUptodate(bh_result->b_page)) {
+	if (!bh_result->b_folio || folio_test_uptodate(bh_result->b_folio)) {
 		set_buffer_uptodate(bh_result);
 		goto finished;
 	}
@@ -510,7 +510,7 @@ static int reiserfs_get_blocks_direct_io(struct inode *inode,
 {
 	int ret;
 
-	bh_result->b_page = NULL;
+	bh_result->b_folio = NULL;
 
 	/*
 	 * We set the b_size before reiserfs_get_block call since it is
@@ -967,11 +967,11 @@ int reiserfs_get_block(struct inode *inode, sector_t block,
 			set_buffer_uptodate(unbh);
 
 			/*
-			 * unbh->b_page == NULL in case of DIRECT_IO request,
+			 * unbh->b_folio == NULL in case of DIRECT_IO request,
 			 * this means buffer will disappear shortly, so it
 			 * should not be added to
 			 */
-			if (unbh->b_page) {
+			if (unbh->b_folio) {
 				/*
 				 * we've converted the tail, so we must
 				 * flush unbh before the transaction commits
diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index 84a194b77f19..c2efbc14d9c8 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -155,11 +155,11 @@ static int scnprintf_block_head(char *buf, size_t size, struct buffer_head *bh)
 static int scnprintf_buffer_head(char *buf, size_t size, struct buffer_head *bh)
 {
 	return scnprintf(buf, size,
-			 "dev %pg, size %zd, blocknr %llu, count %d, state 0x%lx, page %p, (%s, %s, %s)",
+			 "dev %pg, size %zd, blocknr %llu, count %d, state 0x%lx, folio %p, (%s, %s, %s)",
 			 bh->b_bdev, bh->b_size,
 			 (unsigned long long)bh->b_blocknr,
 			 atomic_read(&(bh->b_count)),
-			 bh->b_state, bh->b_page,
+			 bh->b_state, bh->b_folio,
 			 buffer_uptodate(bh) ? "UPTODATE" : "!UPTODATE",
 			 buffer_dirty(bh) ? "DIRTY" : "CLEAN",
 			 buffer_locked(bh) ? "LOCKED" : "UNLOCKED");
diff --git a/fs/reiserfs/tail_conversion.c b/fs/reiserfs/tail_conversion.c
index 2cec61af2a9e..a61bca73c45f 100644
--- a/fs/reiserfs/tail_conversion.c
+++ b/fs/reiserfs/tail_conversion.c
@@ -127,11 +127,11 @@ int direct2indirect(struct reiserfs_transaction_handle *th, struct inode *inode,
 		 * we only send the unbh pointer if the buffer is not
 		 * up to date.  this avoids overwriting good data from
 		 * writepage() with old data from the disk or buffer cache
-		 * Special case: unbh->b_page will be NULL if we are coming
+		 * Special case: unbh->b_folio will be NULL if we are coming
 		 * through DIRECT_IO handler here.
 		 */
-		if (!unbh->b_page || buffer_uptodate(unbh)
-		    || PageUptodate(unbh->b_page)) {
+		if (!unbh->b_folio || buffer_uptodate(unbh)
+		    || folio_test_uptodate(unbh->b_folio)) {
 			up_to_date_bh = NULL;
 		} else {
 			up_to_date_bh = unbh;
@@ -176,7 +176,8 @@ void reiserfs_unmap_buffer(struct buffer_head *bh)
 	 * interested in removing it from per-sb j_dirty_buffers list, to avoid
 	 * BUG() on attempt to write not mapped buffer
 	 */
-	if ((!list_empty(&bh->b_assoc_buffers) || bh->b_private) && bh->b_page) {
+	if ((!list_empty(&bh->b_assoc_buffers) || bh->b_private) &&
+	    bh->b_folio) {
 		struct inode *inode = bh->b_folio->mapping->host;
 		struct reiserfs_journal *j = SB_JOURNAL(inode->i_sb);
 		spin_lock(&j->j_dirty_buffers_lock);
-- 
2.35.1

