From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/2] reiser4: port for Linux-3.14
Date: Mon, 05 May 2014 18:13:41 +0200
Message-ID: <5367B8B5.2040605@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080807070602090700040901"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=fCTsZkbTt28KQDfUpg2GjtFTpcg5MV6SV4fk03AcR84=;
        b=ZCLykQAEenyQ+Hne6ShCMArzktHauB5sx49ZL1cTDZWGKK8N4eMFhcY+LEJvQKOaT7
         9MTVaiVcvkhqPrTvWSbgCxMbtBn9qA5i6kJitAPXLof9zs3/sHWzFJ1GBv2OLORx2XM2
         o3d9DnZ6zI6bbLWpc4MDDOWHmXXpSTPEeljZmJo9wcbyqh8F3xGM2U5rsR6t8oOnZIgR
         K8tIcQ3Db3BtVcA4KgfNr1K/ol2+e7OH8zIt0Fk1t+odcKssmR6nC6mZMR5fYYhM8PVp
         JLLJyo0VDi1nS9t19paQYq5g9Mpb695L21tbp4uRahmlJ0cKPqGEdWYjA3BuKM4//sYT
         1sLQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080807070602090700040901
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------080807070602090700040901
Content-Type: text/x-patch;
 name="01-reiser4-port-to-3.14.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="01-reiser4-port-to-3.14.patch"

Port reiser4 to linux-3.14 (From Mathieu Belanger)

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

diff -urN linux-3.14.1/fs/reiser4/page_cache.c linux-3.14.1.mat/fs/reiser4/page_cache.c
--- linux-3.14.1/fs/reiser4/page_cache.c	2014-04-21 13:02:41.000000000 +0200
+++ linux-3.14.1.mat/fs/reiser4/page_cache.c	2014-04-21 12:59:32.000000000 +0200
@@ -438,10 +438,10 @@
 		assert("nikita-2276", !reiser4_blocknr_is_fake(&blocknr));
 
 		bio->bi_bdev = super->s_bdev;
-		/* fill bio->bi_sector before calling bio_add_page(), because
+		/* fill bio->bi_iter.bi_sector before calling bio_add_page(), because
 		 * q->merge_bvec_fn may want to inspect it (see
 		 * drivers/md/linear.c:linear_mergeable_bvec() for example. */
-		bio->bi_sector = blocknr * (blksz >> 9);
+		bio->bi_iter.bi_sector = blocknr * (blksz >> 9);
 
 		if (!bio_add_page(bio, page, blksz, 0)) {
 			warning("nikita-3452",
diff -urN linux-3.14.1/fs/reiser4/status_flags.c linux-3.14.1.mat/fs/reiser4/status_flags.c
--- linux-3.14.1/fs/reiser4/status_flags.c	2014-04-21 13:02:41.000000000 +0200
+++ linux-3.14.1.mat/fs/reiser4/status_flags.c	2014-04-21 12:59:32.000000000 +0200
@@ -45,13 +45,13 @@
 
 	bio = bio_alloc(reiser4_ctx_gfp_mask_get(), 1);
 	if (bio != NULL) {
-		bio->bi_sector = block * (sb->s_blocksize >> 9);
+		bio->bi_iter.bi_sector = block * (sb->s_blocksize >> 9);
 		bio->bi_bdev = sb->s_bdev;
 		bio->bi_io_vec[0].bv_page = page;
 		bio->bi_io_vec[0].bv_len = sb->s_blocksize;
 		bio->bi_io_vec[0].bv_offset = 0;
 		bio->bi_vcnt = 1;
-		bio->bi_size = sb->s_blocksize;
+		bio->bi_iter.bi_size = sb->s_blocksize;
 		bio->bi_end_io = reiser4_status_endio;
 	} else {
 		__free_pages(page, 0);
@@ -150,7 +150,7 @@
 	bio->bi_io_vec[0].bv_len = sb->s_blocksize;
 	bio->bi_io_vec[0].bv_offset = 0;
 	bio->bi_vcnt = 1;
-	bio->bi_size = sb->s_blocksize;
+	bio->bi_iter.bi_size = sb->s_blocksize;
 	bio->bi_end_io = reiser4_status_endio;
 	lock_page(get_super_private(sb)->status_page);	/* Safe as nobody should
 							 * touch our page. */
diff -urN linux-3.14.1/fs/reiser4/wander.c linux-3.14.1.mat/fs/reiser4/wander.c
--- linux-3.14.1/fs/reiser4/wander.c	2014-04-21 13:02:41.000000000 +0200
+++ linux-3.14.1.mat/fs/reiser4/wander.c	2014-04-21 12:59:33.000000000 +0200
@@ -736,7 +736,7 @@
 			return RETERR(-ENOMEM);
 
 		bio->bi_bdev = super->s_bdev;
-		bio->bi_sector = block * (super->s_blocksize >> 9);
+		bio->bi_iter.bi_sector = block * (super->s_blocksize >> 9);
 		for (nr_used = 0, i = 0; i < nr_blocks; i++) {
 			struct page *pg;
 
@@ -823,7 +823,7 @@
 		}
 		if (nr_used > 0) {
 			assert("nikita-3453",
-			       bio->bi_size == super->s_blocksize * nr_used);
+			       bio->bi_iter.bi_size == super->s_blocksize * nr_used);
 			assert("nikita-3454", bio->bi_vcnt == nr_used);
 
 			/* Check if we are allowed to write at all */

--------------080807070602090700040901--
