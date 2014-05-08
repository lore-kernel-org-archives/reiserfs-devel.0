From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv3 5/5] reiser4: discard support: downgrade all reiser4_log() to reiser4_debug().
Date: Thu,  8 May 2014 22:45:50 +0400
Message-ID: <1399574750-10499-6-git-send-email-intelfx100@gmail.com>
References: <1399574750-10499-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SpykMwgzDLSBtGYMD0QaSWTHjwAoeOKWUDYeGAUkCMQ=;
        b=VCsT37ssO/dY6ZpUo2aERupuuBu5fvODyw7+AkK2Ol0oT0QdYsyEz6MagAXQZw1tfE
         qxDBQy4F1y5Ptsj7z6kskZNR0NrWZW/52DME6RMUekp0H7o1IYgxq9+7VS3kPMAtkuG9
         mGdobSzC3nwIky1VChGsAnVszyfhLMLhS2KPtDAdF3kUBb0V2nU6DJSlc1abHehdVqn6
         +b29lGEuZHg3kQeP95CA9bH8qCsnD5dE35KIrM71N3G1xZOIGT31lmAJD1T97SIzS0V8
         qL2XD0mpsdddxj5/hNWg57L/1U/paTiUQ7HrjvVrniaf6m/yuvD+OrTtLz6QYcNXBcm6
         Hqbw==
In-Reply-To: <1399574750-10499-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

...where the latter is a conditional version of reiser4_log().

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/debug.h   |  4 ++++
 fs/reiser4/discard.c | 62 ++++++++++++++++++++++++++--------------------------
 2 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/fs/reiser4/debug.h b/fs/reiser4/debug.h
index 060921f..281bf78 100644
--- a/fs/reiser4/debug.h
+++ b/fs/reiser4/debug.h
@@ -46,6 +46,9 @@
 /* version of info that only actually prints anything when _d_ebugging
     is on */
 #define dinfo(format, ...) printk(format , ## __VA_ARGS__)
+/* a conditional equivalent of reiser4_log */
+#define reiser4_debug(label, format, ...)				\
+	reiser4_log(label, format, ## __VA_ARGS__)
 /* macro to catch logical errors. Put it into `default' clause of
     switch() statement. */
 #define impossible(label, format, ...) 			\
@@ -77,6 +80,7 @@ extern void call_on_each_assert(void);
 #else
 
 #define dinfo(format, args...) noop
+#define reiser4_debug(label, format, args...) noop
 #define impossible(label, format, args...) noop
 #define assert(label, cond) noop
 #define check_me(label, expr)	((void) (expr))
diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index c2ffe47..0dbbb3e 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -116,9 +116,9 @@ static int discard_set_entry_merge(discard_set_entry *to,
 	assert("intelfx-17", start < end);
 
 	if (to->start <= end && start <= to->end) {
-		reiser4_log("discard",
-		            "Merging extents: [%llu; %llu) and [%llu; %llu)",
-		            to->start, to->end, start, end);
+		reiser4_debug("discard",
+		              "Merging extents: [%llu; %llu) and [%llu; %llu)",
+		              to->start, to->end, start, end);
 
 		if (start < to->start) {
 			to->start = start;
@@ -188,9 +188,9 @@ static int __discard_extent(struct block_device *bdev, sector_t start,
 {
 	assert("intelfx-21", bdev != NULL);
 
-	reiser4_log("discard", "DISCARDING: [%llu; %llu)",
-	            (unsigned long long)start,
-	            (unsigned long long)(start + len));
+	reiser4_debug("discard", "DISCARDING: [%llu; %llu)",
+	              (unsigned long long)start,
+	              (unsigned long long)(start + len));
 
 	return blkdev_issue_discard(bdev, start, len, reiser4_ctx_gfp_mask_get(),
 	                            0);
@@ -217,17 +217,17 @@ static int discard_extent(discard_set_entry *e)
 	/* we assume block = N * sector */
 	assert("intelfx-7", sec_per_blk > 0);
 
-	reiser4_log("discard", "Extent {blk}: [%llu; %llu)",
-	            (unsigned long long)e->start,
-	            (unsigned long long)e->end);
+	reiser4_debug("discard", "Extent {blk}: [%llu; %llu)",
+	              (unsigned long long)e->start,
+	              (unsigned long long)e->end);
 
 	/* convert extent to sectors */
 	extent_start_sec = e->start * sec_per_blk;
 	extent_end_sec = e->end * sec_per_blk;
 
-	reiser4_log("discard", "Extent {sec}: [%llu; %llu)",
-	            (unsigned long long)extent_start_sec,
-	            (unsigned long long)extent_end_sec);
+	reiser4_debug("discard", "Extent {sec}: [%llu; %llu)",
+	              (unsigned long long)extent_start_sec,
+	              (unsigned long long)extent_end_sec);
 
 	/* round down extent start sector to an erase unit boundary */
 	unit_sec = extent_start_sec;
@@ -240,10 +240,10 @@ static int discard_extent(discard_set_entry *e)
 		/* considering erase unit:
 		 * [unit_sec; unit_sec + granularity) */
 
-		reiser4_log("discard", "Erase unit %d {sec}: [%llu; %llu)",
-		            erase_unit_counter,
-		            (unsigned long long)unit_sec,
-		            (unsigned long long)(unit_sec + granularity));
+		reiser4_debug("discard", "Erase unit %d {sec}: [%llu; %llu)",
+		              erase_unit_counter,
+		              (unsigned long long)unit_sec,
+		              (unsigned long long)(unit_sec + granularity));
 
 		/* calculate block range for erase unit:
 		 * [unit_start_blk; unit_start_blk+unit_len_blk) */
@@ -262,18 +262,18 @@ static int discard_extent(discard_set_entry *e)
 			unit_len_blk = 1;
 		}
 
-		reiser4_log("discard", "Erase unit %d {blk}: [%llu; %llu)",
-		            erase_unit_counter,
-		            (unsigned long long)unit_start_blk,
-		            (unsigned long long)(unit_start_blk + unit_len_blk));
+		reiser4_debug("discard", "Erase unit %d {blk}: [%llu; %llu)",
+		              erase_unit_counter,
+		              (unsigned long long)unit_start_blk,
+		              (unsigned long long)(unit_start_blk + unit_len_blk));
 
 		if (reiser4_check_blocks(&unit_start_blk, &unit_len_blk, 0)) {
 			/* OK. Add this unit to the accumulator.
 			 * We accumulate discard units to call blkdev_issue_discard()
 			 * not too frequently. */
 
-			reiser4_log("discard", "Erase unit %d: OK, adding to request",
-			            erase_unit_counter);
+			reiser4_debug("discard", "Erase unit %d: OK, adding to request",
+			              erase_unit_counter);
 
 			if (request_len_sec > 0) {
 				request_len_sec += granularity;
@@ -282,12 +282,12 @@ static int discard_extent(discard_set_entry *e)
 				request_len_sec = granularity;
 			}
 
-			reiser4_log("discard",
-			            "Erase unit %d: request updated: [%llu; %llu)",
-			            erase_unit_counter,
-			            (unsigned long long)request_start_sec,
-			            (unsigned long long)(request_start_sec +
-			                                 request_len_sec));
+			reiser4_debug("discard",
+			              "Erase unit %d: request updated: [%llu; %llu)",
+			              erase_unit_counter,
+			              (unsigned long long)request_start_sec,
+			              (unsigned long long)(request_start_sec +
+			                                   request_len_sec));
 		} else {
 			/* This unit can't be discarded. Discard what's been accumulated
 			 * so far. */
@@ -312,7 +312,7 @@ static int discard_extent(discard_set_entry *e)
 		}
 	}
 
-	reiser4_log("discard", "Extent done");
+	reiser4_debug("discard", "Extent done");
 
 	return 0;
 }
@@ -336,8 +336,8 @@ static int __discard_list(struct list_head *list)
 		++extent_count;
 	}
 
-	reiser4_log("discard", "Discarding: %d extents",
-	            extent_count);
+	reiser4_debug("discard", "Discarding: %d extents",
+	              extent_count);
 
 	return 0;
 }
-- 
1.9.2

