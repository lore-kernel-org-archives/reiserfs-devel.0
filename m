From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 1/2] reiser4: port for Linux-4.14
Date: Sun, 26 Nov 2017 23:54:41 +0100
Message-ID: <a80269ec-3c31-c72f-8b13-ce28aeb6b189@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------3FC6983F40B090D600D0E2FE"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=1JYzbAqOG+Q+DUOGQAdGMhZICf65JscUZz3R5Fa1oR8=;
        b=jTDwplAPq2KBUNzYJQwhwnrJ0e/Ssa57zRP9cTGRr14BSvl5D9S/JUYygp16JCb01M
         FM9KxwzStjjCiRI2neaHbcML/+RkeRDZcl+lQIBsjZnbCqAJaS7nsUo2rscdcwEkQQmt
         NvKMN+S5D3Tqhhod83D/yha04Z9LmWxq43dhGKWu2zGfn9cfOme2v3Nn/s4kKRCwTBHL
         GiMOj2K0UQWe0lWwFT0jUpvTEU2CQn7TOEfuJS3igmFGiRTLebZ51CdhE8USZACql8lo
         MoT6ccIPRmp8BKxn67PSkkl20bPvRWpvuVtAjRsS3v+RvO1/PgyiCGnp07vNH+me3YF0
         8f+Q==
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------3FC6983F40B090D600D0E2FE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------3FC6983F40B090D600D0E2FE
Content-Type: text/x-patch;
 name="1.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="1.diff"

commit 7047eba35342544128c7dbbdf24c06943141c1ad
Author: Edward Shishkin <edward.shishkin@gmail.com>
Date:   Thu Oct 5 23:15:41 2017 +0200

    Port for Linux-4.14
    
    Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

diff --git a/page_cache.c b/page_cache.c
index eadf74b33..8cca57867 100644
--- a/page_cache.c
+++ b/page_cache.c
@@ -437,7 +437,7 @@ static struct bio *page_bio(struct page *page, jnode * node, int rw, gfp_t gfp)
 		assert("nikita-2275", blocknr != (reiser4_block_nr) 0);
 		assert("nikita-2276", !reiser4_blocknr_is_fake(&blocknr));
 
-		bio->bi_bdev = super->s_bdev;
+		bio_set_dev(bio, super->s_bdev);
 		/* fill bio->bi_iter.bi_sector before calling bio_add_page(), because
 		 * q->merge_bvec_fn may want to inspect it (see
 		 * drivers/md/linear.c:linear_mergeable_bvec() for example. */
diff --git a/plugin/file/cryptcompress.c b/plugin/file/cryptcompress.c
index 694680bc7..f58eee96e 100644
--- a/plugin/file/cryptcompress.c
+++ b/plugin/file/cryptcompress.c
@@ -1501,7 +1501,8 @@ static int pages_truncate_ok(struct inode *inode, pgoff_t start)
 	int found;
 	struct page * page;
 
-	found = find_get_pages(inode->i_mapping, start, 1, &page);
+
+	found = find_get_pages(inode->i_mapping, &start, 1, &page);
 	if (found)
 		put_cluster_page(page);
 	return !found;
@@ -1887,14 +1888,14 @@ static void checkout_page_cluster(struct cluster_handle * clust,
 	int i;
 	int found;
 	int to_put;
+	pgoff_t page_index = clust_to_pg(clust->index, inode);
 	struct tfm_cluster *tc = &clust->tc;
 
 	/* find and put checked in pages: cluster is locked,
 	 * so we must get expected number (to_put) of pages
 	 */
 	to_put = size_in_pages(lbytes(clust->index, inode));
-	found = find_get_pages(inode->i_mapping,
-			       clust_to_pg(clust->index, inode),
+	found = find_get_pages(inode->i_mapping, &page_index,
 			       to_put, clust->pages);
 	BUG_ON(found != to_put);
 
@@ -2521,6 +2522,7 @@ void truncate_complete_page_cluster(struct inode *inode, cloff_t index,
 	int found;
 	int nr_pages;
 	jnode *node;
+	pgoff_t page_index = clust_to_pg(index, inode);
 	struct page *pages[MAX_CLUSTER_NRPAGES];
 
 	node = jlookup(current_tree, get_inode_oid(inode),
@@ -2529,8 +2531,7 @@ void truncate_complete_page_cluster(struct inode *inode, cloff_t index,
 	assert("edward-1483", nr_pages != 0);
 	if (!node)
 		goto truncate;
-	found = find_get_pages(inode->i_mapping,
-			       clust_to_pg(index, inode),
+	found = find_get_pages(inode->i_mapping, &page_index,
 			       cluster_nrpages(inode), pages);
 	if (!found) {
 		assert("edward-1484", jnode_truncate_ok(inode, index));
diff --git a/status_flags.c b/status_flags.c
index 21e70c662..574005e06 100644
--- a/status_flags.c
+++ b/status_flags.c
@@ -46,7 +46,7 @@ int reiser4_status_init(reiser4_block_nr block)
 	bio = bio_alloc(reiser4_ctx_gfp_mask_get(), 1);
 	if (bio != NULL) {
 		bio->bi_iter.bi_sector = block * (sb->s_blocksize >> 9);
-		bio->bi_bdev = sb->s_bdev;
+		bio_set_dev(bio, sb->s_bdev);
 		bio->bi_io_vec[0].bv_page = page;
 		bio->bi_io_vec[0].bv_len = sb->s_blocksize;
 		bio->bi_io_vec[0].bv_offset = 0;
@@ -146,7 +146,7 @@ int reiser4_status_write(__u64 status, __u64 extended_status, char *message)
 
 	kunmap_atomic((char *)statuspage);
 	bio_reset(bio);
-	bio->bi_bdev = sb->s_bdev;
+	bio_set_dev(bio, sb->s_bdev);
 	bio->bi_io_vec[0].bv_page = get_super_private(sb)->status_page;
 	bio->bi_io_vec[0].bv_len = sb->s_blocksize;
 	bio->bi_io_vec[0].bv_offset = 0;
diff --git a/wander.c b/wander.c
index 8595c22cb..5dfb30ae3 100644
--- a/wander.c
+++ b/wander.c
@@ -728,7 +728,7 @@ static int write_jnodes_to_disk_extent(
 		if (!bio)
 			return RETERR(-ENOMEM);
 
-		bio->bi_bdev = super->s_bdev;
+		bio_set_dev(bio, super->s_bdev);
 		bio->bi_iter.bi_sector = block * (super->s_blocksize >> 9);
 		for (nr_used = 0, i = 0; i < nr_blocks; i++) {
 			struct page *pg;

--------------3FC6983F40B090D600D0E2FE--
