From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/2] reiser4: adjust to new shrinker API
Date: Fri, 20 Dec 2013 19:49:11 +0100
Message-ID: <52B49127.5020706@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020103010004040806010400"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=FruGtT/7JlnRqNTnVHXcqgCRz1TVpHTZNF9UurvMJbs=;
        b=wLweavo01jkz9mia6K+CSVRyawLQ/S3shIgMwodfEgpEgeS8OgGn1jrCQSj8+cFIju
         U8ySHCymO+L8Mha9ar0RxoTDqusK4RQw5rnYN7VAlevKrJtjQ9N50hKV+Sr2OQoMmqMY
         I2E6Q8lj9aTmEXqG8Pz9LetVsAxeJ/m9K3ktIegQAhqK97WSvL1E6yWIe5HH6kWcDdjK
         bFlisxT+zpdEl/ZRbGYZy+0Gl98COQDjXoNMd9Ahc/0fQhhLoCipoDDreXf5yoHlBucA
         MD8rB+ZyxpXFNZ0q/TDTdvHGVeIE8VuzxwROLISfBWG6JCuU+fIN9lIavGxOV/r2t0zc
         G2rQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020103010004040806010400
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------020103010004040806010400
Content-Type: text/x-patch;
 name="reiser4-adjust-to-new-shrinker-api.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-adjust-to-new-shrinker-api.patch"

Patch from Mathieu Belanger with some improvements

Adjust to new shrinker API: introduce
d_cursor_shrink_count() as ->count_objects();  
d_cursor_shrink_scan() as ->scan_objects();

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/fsdata.c |   44 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

--- linux-3.12.5.orig/fs/reiser4/fsdata.c
+++ linux-3.12.5/fs/reiser4/fsdata.c
@@ -23,30 +23,27 @@ static int file_is_stateless(struct file
 static void free_fsdata(reiser4_file_fsdata *fsdata);
 static void kill_cursor(dir_cursor *);
 
-/**
- * d_cursor_shrink - shrink callback for cache of dir_cursor-s
- * @nr: number of objects to free
- * @mask: GFP mask
- *
- * Shrinks d_cursor_cache. Scan LRU list of unused cursors, freeing requested
- * number. Return number of still freeable cursors.
- */
-static int d_cursor_shrink(struct shrinker *shrink, struct shrink_control *sc)
+static unsigned long d_cursor_shrink_scan(struct shrinker *shrink,
+					  struct shrink_control *sc)
 {
-	if (sc->nr_to_scan != 0) {
-		dir_cursor *scan;
+	dir_cursor *scan;
+	unsigned long freed = 0;
 
-		spin_lock(&d_c_lock);
-		while (!list_empty(&cursor_cache)) {
-			scan = list_entry(cursor_cache.next, dir_cursor, alist);
-			assert("nikita-3567", scan->ref == 0);
-			kill_cursor(scan);
-			--sc->nr_to_scan;
-			if (sc->nr_to_scan == 0)
-				break;
-		}
-		spin_unlock(&d_c_lock);
+	spin_lock(&d_c_lock);
+	while (!list_empty(&cursor_cache) && sc->nr_to_scan) {
+		scan = list_entry(cursor_cache.next, dir_cursor, alist);
+		assert("nikita-3567", scan->ref == 0);
+		kill_cursor(scan);
+		freed++;
+		sc->nr_to_scan--;
 	}
+	spin_unlock(&d_c_lock);
+	return freed;
+}
+
+static unsigned long d_cursor_shrink_count (struct shrinker *shrink,
+					    struct shrink_control *sc)
+{
 	return d_cursor_unused;
 }
 
@@ -58,8 +55,9 @@ static int d_cursor_shrink(struct shrink
  * shrunk only if system is really tight on memory.
  */
 static struct shrinker d_cursor_shrinker = {
-	.shrink = d_cursor_shrink,
-	.seeks = DEFAULT_SEEKS << 3,
+	.count_objects = d_cursor_shrink_count,
+	.scan_objects = d_cursor_shrink_scan,
+	.seeks = DEFAULT_SEEKS << 3
 };
 
 /**

--------------020103010004040806010400--
