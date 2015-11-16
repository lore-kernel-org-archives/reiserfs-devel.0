From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: port for linux-4.3
Date: Mon, 16 Nov 2015 09:54:30 +0100
Message-ID: <564999C6.2010608@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070103030709060501000402"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type;
        bh=WxZJQNLr+xKEI4UCRSCBido2wPV4iDGTEKBCMGUgstw=;
        b=UXUE4Gl5BnFkTtyX2y3Xxp63rETyGIKjuhDMaNQyTkXszBCA0VaAklgSIWpxmhq/hk
         hQbYeFVCWJKxJnMYvRw7tEISzw3FmMZrmG8iOtyRf74zEEdfLuJbgZiNUcrZsMGujz12
         u3hCBKr1wu/Ag2kStv23nljbKKQPnYyMyJShqxWd9jWLfRijwOLQDVJL1Gv+bTr7wUoF
         qtV10vvyG2z+yJLzADaG+h5ANYU8Vuh8iZkWBiqB4cc9WQaSLvTN/Dm6XzyIK0aQkTOE
         KAY96qweYfF3AkINx0FkC38pKR+SM3VRXUunvNLEud9vlVt2+bdMsrS9IYvm4OMVdCNe
         i/fQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070103030709060501000402
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Flag BIO_UPTODATE gone.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

--------------070103030709060501000402
Content-Type: text/x-patch;
 name="reiser4-port-for-4.3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-port-for-4.3.patch"

diff -urN linux-4.2.3/fs/reiser4/flush_queue.c linux-4.3/fs/reiser4/flush_queue.c
--- linux-4.2.3/fs/reiser4/flush_queue.c	2015-11-16 09:45:01.160671244 +0100
+++ linux-4.3/fs/reiser4/flush_queue.c	2015-11-16 09:39:45.717199841 +0100
@@ -392,9 +392,11 @@
 	return list_empty_careful(&atom->flush_queues);
 }
 #endif
-/* Bio i/o completion routine for reiser4 write operations. */
-static void
-end_io_handler(struct bio *bio, int err)
+
+/*
+ * Bio i/o completion routine for reiser4 write operations
+ */
+static void end_io_handler(struct bio *bio)
 {
 	int i;
 	int nr_errors = 0;
@@ -409,7 +411,7 @@
 	for (i = 0; i < bio->bi_vcnt; i += 1) {
 		struct page *pg = bio->bi_io_vec[i].bv_page;
 
-		if (!test_bit(BIO_UPTODATE, &bio->bi_flags)) {
+		if (bio->bi_error) {
 			SetPageError(pg);
 			nr_errors++;
 		}
diff -urN linux-4.2.3/fs/reiser4/page_cache.c linux-4.3/fs/reiser4/page_cache.c
--- linux-4.2.3/fs/reiser4/page_cache.c	2015-11-16 09:45:01.165671236 +0100
+++ linux-4.3/fs/reiser4/page_cache.c	2015-11-16 09:39:45.723199830 +0100
@@ -324,16 +324,15 @@
    mpage_end_io_read() would also do. But it's static.
 
 */
-static void
-end_bio_single_page_read(struct bio *bio, int err UNUSED_ARG)
+static void end_bio_single_page_read(struct bio *bio)
 {
 	struct page *page;
 
 	page = bio->bi_io_vec[0].bv_page;
 
-	if (test_bit(BIO_UPTODATE, &bio->bi_flags)) {
+	if (!bio->bi_error)
 		SetPageUptodate(page);
-	} else {
+	else {
 		ClearPageUptodate(page);
 		SetPageError(page);
 	}
@@ -346,14 +345,13 @@
    mpage_end_io_write() would also do. But it's static.
 
 */
-static void
-end_bio_single_page_write(struct bio *bio, int err UNUSED_ARG)
+static void end_bio_single_page_write(struct bio *bio)
 {
 	struct page *page;
 
 	page = bio->bi_io_vec[0].bv_page;
 
-	if (!test_bit(BIO_UPTODATE, &bio->bi_flags))
+	if (bio->bi_error)
 		SetPageError(page);
 	end_page_writeback(page);
 	bio_put(bio);
diff -urN linux-4.2.3/fs/reiser4/status_flags.c linux-4.3/fs/reiser4/status_flags.c
--- linux-4.2.3/fs/reiser4/status_flags.c	2015-11-16 09:45:01.189671197 +0100
+++ linux-4.3/fs/reiser4/status_flags.c	2015-11-16 09:39:45.748199785 +0100
@@ -16,11 +16,11 @@
 /* This is our end I/O handler that marks page uptodate if IO was successful.
    It also unconditionally unlocks the page, so we can see that io was done.
    We do not free bio, because we hope to reuse that. */
-static void reiser4_status_endio(struct bio *bio, int err)
+static void reiser4_status_endio(struct bio *bio)
 {
-	if (test_bit(BIO_UPTODATE, &bio->bi_flags)) {
+	if (!bio->bi_error)
 		SetPageUptodate(bio->bi_io_vec->bv_page);
-	} else {
+	else {
 		ClearPageUptodate(bio->bi_io_vec->bv_page);
 		SetPageError(bio->bi_io_vec->bv_page);
 	}
diff -urN linux-4.2.3/fs/reiser4/wander.c linux-4.3/fs/reiser4/wander.c
--- linux-4.2.3/fs/reiser4/wander.c	2015-11-16 09:45:01.194671189 +0100
+++ linux-4.3/fs/reiser4/wander.c	2015-11-16 09:39:45.755199773 +0100
@@ -714,7 +714,6 @@
 {
 	struct super_block *super = reiser4_get_current_sb();
 	int write_op = ( flags & WRITEOUT_BARRIER ) ? WRITE_FLUSH_FUA : WRITE;
-	int max_blocks;
 	jnode *cur = first;
 	reiser4_block_nr block;
 
@@ -723,11 +722,10 @@
 	assert("zam-570", nr > 0);
 
 	block = *block_p;
-	max_blocks = min(bio_get_nr_vecs(super->s_bdev), BIO_MAX_PAGES);
 
 	while (nr > 0) {
 		struct bio *bio;
-		int nr_blocks = min(nr, max_blocks);
+		int nr_blocks = min(nr, BIO_MAX_PAGES);
 		int i;
 		int nr_used;
 

--------------070103030709060501000402--
