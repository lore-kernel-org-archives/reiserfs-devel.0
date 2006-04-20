From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfsprogs: id_map_init off-by-one
Date: Thu, 20 Apr 2006 15:20:56 -0400
Message-ID: <20060420192056.GA7681@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28514-reiserfs=m.gmane.org@namesys.com>
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

diff -rup reiserfsprogs-3.6.19/fsck/uobjectid.c reiserfsprogs-3.6.19.devel/fsck/uobjectid.c
--- reiserfsprogs-3.6.19/fsck/uobjectid.c	2004-06-17 15:57:39.000000000 -0400
+++ reiserfsprogs-3.6.19.devel/fsck/uobjectid.c	2006-04-20 15:18:26.000000000 -0400
@@ -15,7 +15,7 @@
 /* 2 bytes for the counter */
 #define BM_SIZE				(ALLOC_SIZE - sizeof(__u16))
 #define BM_INTERVAL			(BM_SIZE * 8)
-#define INDEX_COUNT			(MAX_ID / BM_INTERVAL)
+#define INDEX_COUNT			((MAX_ID / BM_INTERVAL) + 1)
 
 #define id_map_interval(map, id)	(map->index + (id / BM_INTERVAL))
 
