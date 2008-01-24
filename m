From: jeffm@suse.com
Subject: [patch 3/9] [PATCH] reiserfsprogs: id_map_init off-by-one
Date: Thu, 24 Jan 2008 15:02:29 -0500
Message-ID: <20080124200337.326279000@suse.com>
References: <20080124200226.606635000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfsprogs-fsck-mapid.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

 The following patch fixes a bug where reiserfsck will crash if OIDs up around
 the maximum are in use. The problem is that INDEX_COUNT ends up rounding down
 and the last chunk isn't allocated, causing a segfault.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fsck/uobjectid.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fsck/uobjectid.c	2004-06-17 15:57:39.000000000 -0400
+++ b/fsck/uobjectid.c	2008-01-24 13:39:04.000000000 -0500
@@ -15,7 +15,7 @@
 /* 2 bytes for the counter */
 #define BM_SIZE				(ALLOC_SIZE - sizeof(__u16))
 #define BM_INTERVAL			(BM_SIZE * 8)
-#define INDEX_COUNT			(MAX_ID / BM_INTERVAL)
+#define INDEX_COUNT			((MAX_ID / BM_INTERVAL) + 1)
 
 #define id_map_interval(map, id)	(map->index + (id / BM_INTERVAL))
 


