From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] Reiser4 port for 4.8
Date: Mon, 14 Nov 2016 18:38:51 +0100
Message-ID: <1479145131-25114-1-git-send-email-edward.shishkin@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=Tl101DyY0f2z1GGOdxap6TVj0c2Kqmsq0TAldNyZ10c=;
        b=tP8c2m+k8LY+Sg5eEddRuJik78UBxDxQ15ToWvH7Zcfyd0C6yq5DICxwtR37diu1+M
         viLStNZrz1DWqWqon5+8fSSV7MUsjdAPglss0A+DkGU24LvoagZVrSsU9Cr/tFcnJynn
         GnemFrp8W/gL6EDwLsrlf6s+rmn1+TJNmFGNpyW3SH8q+em4bxRhLlcLwBXq61CME5/L
         8ohO0HLhWgHXJh2B1UYyX7cUacoaDWToyuXu2X6hQplAGvJ5c8gOno4HDhr0YPri3mwx
         yVJeE/NR9Q02QCF/rQmoxtqu35te953Ti1spQxhGAC0+X4E4eMh9umVpfCrQM+FK0n3a
         W1fQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 flush_queue.c  |  2 +-
 page_cache.c   |  3 ++-
 page_cache.h   |  2 --
 status_flags.c | 17 +++++++++++------
 wander.c       |  5 +++--
 5 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/flush_queue.c b/flush_queue.c
index 20b94ea..4a3d550 100644
--- a/flush_queue.c
+++ b/flush_queue.c
@@ -402,7 +402,7 @@ static void end_io_handler(struct bio *bio)
 	int nr_errors = 0;
 	flush_queue_t *fq;
 
-	assert("zam-958", bio->bi_rw & WRITE);
+	assert("zam-958", bio_op(bio) == WRITE);
 
 	/* we expect that bio->private is set to NULL or fq object which is used
 	 * for synchronization and error counting. */
diff --git a/page_cache.c b/page_cache.c
index d318d18..099c00a 100644
--- a/page_cache.c
+++ b/page_cache.c
@@ -398,7 +398,8 @@ int reiser4_page_io(struct page *page, jnode *node, int rw, gfp_t gfp)
 			set_page_writeback(page);
 			unlock_page(page);
 		}
-		reiser4_submit_bio(rw, bio);
+		bio_set_op_attrs(bio, rw, 0);
+		submit_bio(bio);
 		result = 0;
 	} else {
 		unlock_page(page);
diff --git a/page_cache.h b/page_cache.h
index b79dec7..32106f1 100644
--- a/page_cache.h
+++ b/page_cache.h
@@ -18,8 +18,6 @@ extern void reiser4_done_formatted_fake(struct super_block *);
 
 extern reiser4_tree *reiser4_tree_by_page(const struct page *);
 
-#define reiser4_submit_bio(rw, bio) submit_bio((rw), (bio))
-
 extern void reiser4_wait_page_writeback(struct page *);
 static inline void lock_and_wait_page_writeback(struct page *page)
 {
diff --git a/status_flags.c b/status_flags.c
index ef89464..96f9a9d 100644
--- a/status_flags.c
+++ b/status_flags.c
@@ -58,8 +58,8 @@ int reiser4_status_init(reiser4_block_nr block)
 		return -ENOMEM;
 	}
 	lock_page(page);
-	submit_bio(READ, bio);
-	//blk_flush_plug(current);
+	bio_set_op_attrs(bio, READ, 0);
+	submit_bio(bio);
 	wait_on_page_locked(page);
 	if (!PageUptodate(page)) {
 		warning("green-2007",
@@ -155,10 +155,15 @@ int reiser4_status_write(__u64 status, __u64 extended_status, char *message)
 	bio->bi_end_io = reiser4_status_endio;
 	lock_page(get_super_private(sb)->status_page);	/* Safe as nobody should
 							 * touch our page. */
-	/* We can block now, but we have no other choice anyway */
-	submit_bio(WRITE, bio);
-	//blk_flush_plug(current);
-	return 0;		/* We do not wait for io to finish. */
+	/*
+	 * We can block now, but we have no other choice anyway
+	 */
+	bio_set_op_attrs(bio, WRITE, 0);
+	submit_bio(bio);
+	/*
+	 * We do not wait for IO completon
+	 */
+	return 0;
 }
 
 /* Frees the page with status and bio structure. Should be called by disk format
diff --git a/wander.c b/wander.c
index 6c0cd71..407bb5e 100644
--- a/wander.c
+++ b/wander.c
@@ -708,7 +708,7 @@ static int write_jnodes_to_disk_extent(
 	flush_queue_t *fq, int flags)
 {
 	struct super_block *super = reiser4_get_current_sb();
-	int write_op = ( flags & WRITEOUT_FLUSH_FUA ) ? WRITE_FLUSH_FUA : WRITE;
+	int op_flags = (flags & WRITEOUT_FLUSH_FUA) ? WRITE_FLUSH_FUA : 0;
 	jnode *cur = first;
 	reiser4_block_nr block;
 
@@ -836,7 +836,8 @@ static int write_jnodes_to_disk_extent(
 			else {
 				add_fq_to_bio(fq, bio);
 				bio_get(bio);
-				reiser4_submit_bio(write_op, bio);
+				bio_set_op_attrs(bio, WRITE, op_flags);
+				submit_bio(bio);
 				bio_put(bio);
 			}
 
-- 
2.7.4

