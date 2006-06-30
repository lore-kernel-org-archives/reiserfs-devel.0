From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 30 Jun 2006 10:04:14 -0700
Message-ID: <44A5598E.9060502@namesys.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>	 <1151608355.6335.79.camel@tribesman.namesys.com> <1151612146.11510.4.camel@ipso.snappymail.ca> <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28880-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44A55591.6060500@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Mike Benoit <ipso@snappymail.ca>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

I have to apologize, I just now read the part where find_next_zero is
using 42% of CPU.

Jeff, this has the "feel" of a bug (affecting performance not
correctness).  I am skeptical that we are searching only bitmap blocks
in which we successfully find and use a free block.  Could you look at
the code and his results with some care?  This profiling result is what
I would have expected to see BEFORE your optimizations occurred, and I
would not expect it now.  Thanks Mike for bringing this to our attention.

Hans

-------------------------

From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 5/5] reiserfs: make bitmap use cached first zero bit

 Currently, the bitmap code uses half of the hinting data gathered and
cached
 and wastes the other half. We'll skip completely full bitmaps, but start
 scanning in bitmaps at locations where if we consulted the zero bit hint,
 we'd know there aren't any free bits available.

 This patch uses the first zero hint to bump the beginning of the search
 window to where we know there is at least one zero bit.

 fs/reiserfs/bitmap.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletion(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15.orig.staging1/fs/reiserfs/bitmap.c
linux-2.6.15.orig.staging2/fs/reiserfs/bitmap.c
--- linux-2.6.15.orig.staging1/fs/reiserfs/bitmap.c    2006-01-16
16:53:35.663319136 -0500
+++ linux-2.6.15.orig.staging2/fs/reiserfs/bitmap.c    2006-01-16
16:53:35.673317616 -0500
@@ -187,7 +187,10 @@ static int scan_bitmap_block(struct reis
             return 0;    // No free blocks in this bitmap
         }
 
-        /* search for a first zero bit -- beggining of a window */
+        if (*beg < bi->first_zero_hint)
+            *beg = bi->first_zero_hint;
+
+        /* search for a first zero bit -- beginning of a window */
         *beg = reiserfs_find_next_zero_le_bit
             ((unsigned long *)(bh->b_data), boundary, *beg);
 


