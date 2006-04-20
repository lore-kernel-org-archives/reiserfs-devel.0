From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfsprogs: id_map_init off-by-one
Date: Thu, 20 Apr 2006 15:10:40 -0400
Message-ID: <20060420191040.GA7261@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28512-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


 The following patch fixes a bug where reiserfsck will crash if OIDs up around
 the maximum are in use. The problem is that INDEX_COUNT ends up rounding down
 and the last chunk isn't allocated, causing a segfault.

--- reiserfsprogs-3.6.19/fsck/uobjectid.c	2004-06-17 15:57:39.000000000 -0400
+++ reiserfsprogs-3.6.19.devel/fsck/uobjectid.c	2006-04-20 15:05:45.000000000 -0400
@@ -33,7 +33,7 @@ id_map_t *id_map_init() {
     __u32 i;
  
     map = getmem(sizeof(id_map_t));
-    map->index = mem_alloc(INDEX_COUNT * sizeof(void *));
+    map->index = mem_alloc((INDEX_COUNT + 1) * sizeof(void *));
 
     for (i = 0; i < INDEX_COUNT; i++) {
 	if (map->index[i] != (void *)0)
