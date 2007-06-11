From: jeffm@suse.com
Subject: [patch 04/40] reiserfs: make bitmap use cached first zero bit
Date: Mon, 11 Jun 2007 15:03:13 -0400
Message-ID: <20070611190629.688573338@suse.com>
References: <20070611190309.532091171@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-bitmap-use-first-zero-hint.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

 Currently, the bitmap code uses half of the hinting data gathered and cached
 and wastes the other half. We'll skip completely full bitmaps, but start
 scanning in bitmaps at locations where if we consulted the zero bit hint,
 we'd know there aren't any free bits available.

 This patch uses the first zero hint to bump the beginning of the search
 window to where we know there is at least one zero bit.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---

 fs/reiserfs/bitmap.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/fs/reiserfs/bitmap.c	2007-06-11 14:49:32.000000000 -0400
+++ b/fs/reiserfs/bitmap.c	2007-06-11 14:50:10.000000000 -0400
@@ -166,7 +166,10 @@ static int scan_bitmap_block(struct reis
 			return 0;	// No free blocks in this bitmap
 		}
 
-		/* search for a first zero bit -- beggining of a window */
+		if (*beg < bi->first_zero_hint)
+			*beg = bi->first_zero_hint;
+
+		/* search for a first zero bit -- beginning of a window */
 		*beg = reiserfs_find_next_zero_le_bit
 		    ((unsigned long *)(bh->b_data), boundary, *beg);
 

-- 
Jeff Mahoney
SUSE Labs

