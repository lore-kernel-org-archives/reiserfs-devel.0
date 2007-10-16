From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 5/7] reiserfs: fix memset byte count during resize
Date: Tue, 16 Oct 2007 19:02:15 -0400
Message-ID: <20071016230258.847418000@suse.com>
References: <20071016230210.779927000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=patches.suse/reiserfs-fix-resize-meminit.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Linux Torvalds <torvalds@linux-foundation.org>
Cc: ReiserFS Development Mailing List <reiserfs-devel@vger.kernel.org>

 The following patch corrects the memset in reiserfs_resize to clear
 the memory allocated for the new bitmap info structs. Previously,
 it would clear the memory used by the old size. Depending on the
 contents of memory, this could cause incorrect caching behavior for
 bitmap blocks in the newly allocated area.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/resize.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/reiserfs/resize.c	2007-10-16 18:52:23.281225507 -0400
+++ b/fs/reiserfs/resize.c	2007-10-16 18:55:56.641755755 -0400
@@ -119,7 +119,7 @@ int reiserfs_resize(struct super_block *
 			return -ENOMEM;
 		}
 		memset(bitmap, 0,
-		       sizeof(struct reiserfs_bitmap_info) * SB_BMAP_NR(s));
+		       sizeof(struct reiserfs_bitmap_info) * bmap_nr_new);
 		for (i = 0; i < bmap_nr; i++)
 			bitmap[i] = old_bitmap[i];
 

-- 

