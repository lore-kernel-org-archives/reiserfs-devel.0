From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 43/8] pool.h cleanup
Date: Thu, 25 Oct 2007 16:03:56 +0200
Message-ID: <1193321036.15901.31.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-7sYfVWUGG6yukscf0db7"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-7sYfVWUGG6yukscf0db7
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 6 errors, 2 warnings, 56 lines checked
patched:total: 0 errors, 1 warnings, 57 lines checked
leftover:

WARNING: do not add new typedefs
#27: FILE: pool.h:27:
+typedef enum {




--=-7sYfVWUGG6yukscf0db7
Content-Disposition: attachment; filename=pool.h.patch
Content-Type: text/x-patch; name=pool.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- pool.h.orig	2007-10-25 16:00:35.000000000 +0200
+++ pool.h	2007-10-25 16:02:16.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
 
 /* Fast pool allocation */
 
@@ -32,13 +33,13 @@ typedef enum {
 
 /* pool manipulation functions */
 
-extern void reiser4_init_pool(struct reiser4_pool * pool, size_t obj_size,
+extern void reiser4_init_pool(struct reiser4_pool *pool, size_t obj_size,
 			      int num_of_objs, char *data);
-extern void reiser4_done_pool(struct reiser4_pool * pool);
-extern void reiser4_pool_free(struct reiser4_pool * pool,
-			      struct reiser4_pool_header * h);
-struct reiser4_pool_header *reiser4_add_obj(struct reiser4_pool * pool,
-					 struct list_head * list,
+extern void reiser4_done_pool(struct reiser4_pool *pool);
+extern void reiser4_pool_free(struct reiser4_pool *pool,
+			      struct reiser4_pool_header *h);
+struct reiser4_pool_header *reiser4_add_obj(struct reiser4_pool *pool,
+					 struct list_head *list,
 					 pool_ordering order,
 					 struct reiser4_pool_header *reference);
 

--=-7sYfVWUGG6yukscf0db7--

