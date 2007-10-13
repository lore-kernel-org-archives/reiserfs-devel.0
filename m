From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH] Reiser4: Drop 'size' argument from bio_endio and bi_end_io
Date: Sat, 13 Oct 2007 11:29:58 +0200
Message-ID: <47109016.8000403@free.fr>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org>	<470FDB41.2000102@free.fr> <20071012140023.30e5b30e.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071012140023.30e5b30e.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, Neil Brown <neilb@suse.de>, Edward Shishkin <edward@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>

Reiser4: Drop 'size' argument from bio_endio and bi_end_io

This patch pushes into Reiser4 the changes introduced by 
commit 6712ecf8f648118c3363c142196418f89a510b90:

	As bi_end_io is only called once when the request is complete,
	the 'size' argument is now redundant.  Remove it.

	Now there is no need for bio_endio to subtract the size completed
	from bi_size.  So don't do that either.

	While we are at it, change bi_end_io to return void.

Please review.

Signed-Off-By: Laurent Riffard <laurent.riffard@free.fr>
---
 fs/reiser4/flush_queue.c  |   10 ++--------
 fs/reiser4/page_cache.c   |   24 ++++--------------------
 fs/reiser4/status_flags.c |    7 +------
 3 files changed, 7 insertions(+), 34 deletions(-)

Index: linux-2.6-mm/fs/reiser4/flush_queue.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/flush_queue.c
+++ linux-2.6-mm/fs/reiser4/flush_queue.c
@@ -391,9 +391,8 @@ int atom_fq_parts_are_clean(txn_atom * a
 }
 #endif
 /* Bio i/o completion routine for reiser4 write operations. */
-static int
-end_io_handler(struct bio *bio, unsigned int bytes_done UNUSED_ARG,
-	       int err)
+static void
+end_io_handler(struct bio *bio, int err)
 {
 	int i;
 	int nr_errors = 0;
@@ -401,10 +400,6 @@ end_io_handler(struct bio *bio, unsigned
 
 	assert("zam-958", bio->bi_rw & WRITE);
 
-	/* i/o op. is not fully completed */
-	if (bio->bi_size != 0)
-		return 1;
-
 	if (err == -EOPNOTSUPP)
 		set_bit(BIO_EOPNOTSUPP, &bio->bi_flags);
 
@@ -447,7 +442,6 @@ end_io_handler(struct bio *bio, unsigned
 	}
 
 	bio_put(bio);
-	return 0;
 }
 
 /* Count I/O requests which will be submitted by @bio in given flush queues
Index: linux-2.6-mm/fs/reiser4/page_cache.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/page_cache.c
+++ linux-2.6-mm/fs/reiser4/page_cache.c
@@ -320,18 +320,11 @@ reiser4_tree *reiser4_tree_by_page(const
    mpage_end_io_read() would also do. But it's static.
 
 */
-static int
-end_bio_single_page_read(struct bio *bio, unsigned int bytes_done UNUSED_ARG,
-			 int err UNUSED_ARG)
+static void
+end_bio_single_page_read(struct bio *bio, int err UNUSED_ARG)
 {
 	struct page *page;
 
-	if (bio->bi_size != 0) {
-		warning("nikita-3332", "Truncated single page read: %i",
-			bio->bi_size);
-		return 1;
-	}
-
 	page = bio->bi_io_vec[0].bv_page;
 
 	if (test_bit(BIO_UPTODATE, &bio->bi_flags)) {
@@ -342,7 +335,6 @@ end_bio_single_page_read(struct bio *bio
 	}
 	unlock_page(page);
 	bio_put(bio);
-	return 0;
 }
 
 /* completion handler for single page bio-based write.
@@ -350,25 +342,17 @@ end_bio_single_page_read(struct bio *bio
    mpage_end_io_write() would also do. But it's static.
 
 */
-static int
-end_bio_single_page_write(struct bio *bio, unsigned int bytes_done UNUSED_ARG,
-			  int err UNUSED_ARG)
+static void
+end_bio_single_page_write(struct bio *bio, int err UNUSED_ARG)
 {
 	struct page *page;
 
-	if (bio->bi_size != 0) {
-		warning("nikita-3333", "Truncated single page write: %i",
-			bio->bi_size);
-		return 1;
-	}
-
 	page = bio->bi_io_vec[0].bv_page;
 
 	if (!test_bit(BIO_UPTODATE, &bio->bi_flags))
 		SetPageError(page);
 	end_page_writeback(page);
 	bio_put(bio);
-	return 0;
 }
 
 /* ->readpage() method for formatted nodes */
Index: linux-2.6-mm/fs/reiser4/status_flags.c
===================================================================
--- linux-2.6-mm.orig/fs/reiser4/status_flags.c
+++ linux-2.6-mm/fs/reiser4/status_flags.c
@@ -15,12 +15,8 @@
 /* This is our end I/O handler that marks page uptodate if IO was successful. It also
    unconditionally unlocks the page, so we can see that io was done.
    We do not free bio, because we hope to reuse that. */
-static int reiser4_status_endio(struct bio *bio, unsigned int bytes_done,
-				int err)
+static void reiser4_status_endio(struct bio *bio, int err)
 {
-	if (bio->bi_size)
-		return 1;
-
 	if (test_bit(BIO_UPTODATE, &bio->bi_flags)) {
 		SetPageUptodate(bio->bi_io_vec->bv_page);
 	} else {
@@ -28,7 +24,6 @@ static int reiser4_status_endio(struct b
 		SetPageError(bio->bi_io_vec->bv_page);
 	}
 	unlock_page(bio->bi_io_vec->bv_page);
-	return 0;
 }
 
 /* Initialise status code. This is expected to be called from the disk format


