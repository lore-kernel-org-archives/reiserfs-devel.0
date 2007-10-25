From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 42/8] pool.c cleanup
Date: Thu, 25 Oct 2007 15:59:59 +0200
Message-ID: <1193320799.15901.26.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-8JJJyAPkoWOOBr2RreUJ"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-8JJJyAPkoWOOBr2RreUJ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 9 errors, 0 warnings, 231 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-8JJJyAPkoWOOBr2RreUJ
Content-Disposition: attachment; filename=pool.c.patch
Content-Type: text/x-patch; name=pool.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- pool.c.orig	2007-10-25 15:55:49.000000000 +0200
+++ pool.c	2007-10-25 15:58:02.000000000 +0200
@@ -51,7 +51,7 @@
 #include <linux/err.h>
 
 /* initialize new pool object @h */
-static void reiser4_init_pool_obj(struct reiser4_pool_header * h)
+static void reiser4_init_pool_obj(struct reiser4_pool_header *h)
 {
 	INIT_LIST_HEAD(&h->usage_linkage);
 	INIT_LIST_HEAD(&h->level_linkage);
@@ -59,10 +59,10 @@ static void reiser4_init_pool_obj(struct
 }
 
 /* initialize new pool */
-void reiser4_init_pool(struct reiser4_pool * pool /* pool to initialize */ ,
+void reiser4_init_pool(struct reiser4_pool *pool /* pool to initialize */ ,
 		       size_t obj_size /* size of objects in @pool */ ,
 		       int num_of_objs /* number of preallocated objects */ ,
-		       char *data /* area for preallocated objects */ )
+		       char *data/* area for preallocated objects */)
 {
 	struct reiser4_pool_header *h;
 	int i;
@@ -93,7 +93,7 @@ void reiser4_init_pool(struct reiser4_po
    allocated objects.
 
 */
-void reiser4_done_pool(struct reiser4_pool * pool UNUSED_ARG)
+void reiser4_done_pool(struct reiser4_pool *pool UNUSED_ARG)
 {
 }
 
@@ -103,7 +103,7 @@ void reiser4_done_pool(struct reiser4_po
    allocation.
 
 */
-static void *reiser4_pool_alloc(struct reiser4_pool * pool)
+static void *reiser4_pool_alloc(struct reiser4_pool *pool)
 {
 	struct reiser4_pool_header *result;
 
@@ -138,8 +138,8 @@ static void *reiser4_pool_alloc(struct r
 }
 
 /* return object back to the pool */
-void reiser4_pool_free(struct reiser4_pool * pool,
-		       struct reiser4_pool_header * h)
+void reiser4_pool_free(struct reiser4_pool *pool,
+		       struct reiser4_pool_header *h)
 {
 	assert("nikita-961", h != NULL);
 	assert("nikita-962", pool != NULL);
@@ -182,10 +182,10 @@ void reiser4_pool_free(struct reiser4_po
    @list - where to add object;
    @reference - after (or before) which existing object to add
 */
-struct reiser4_pool_header *reiser4_add_obj(struct reiser4_pool * pool,
+struct reiser4_pool_header *reiser4_add_obj(struct reiser4_pool *pool,
 					 struct list_head *list,
 					 pool_ordering order,
-					 struct reiser4_pool_header * reference)
+					 struct reiser4_pool_header *reference)
 {
 	struct reiser4_pool_header *result;
 

--=-8JJJyAPkoWOOBr2RreUJ--

