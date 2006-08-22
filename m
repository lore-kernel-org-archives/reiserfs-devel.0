From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: eliminate minimum window size for bitmap searching
Date: Tue, 22 Aug 2006 10:28:20 -0400
Message-ID: <44EB1484.2040502@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29656-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>
Cc: Mike Benoit <ipso@snappymail.ca>

 When a file system becomes fragmented (using MythTV, for example), the
 bigalloc window searching ends up causing huge performance problems. In
 a file system presented by a user experiencing this bug, the file system
 was 90% free, but no 32-block free windows existed on the entire file system.
 This causes the allocator to scan the entire file system for each 128k write
 before backing down to searching for individual blocks.

 In the end, finding a contiguous window for all the blocks in a write is
 an advantageous special case, but one that can be found naturally when
 such a window exists anyway.

 This patch removes the bigalloc window searching, and has been proven to fix
 the test case described above.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNp linux-2.6.18-rc4.orig/fs/reiserfs/bitmap.c linux-2.6.18-rc4.orig.devel/fs/reiserfs/bitmap.c
--- linux-2.6.18-rc4.orig/fs/reiserfs/bitmap.c	2006-08-22 09:49:45.000000000 -0400
+++ linux-2.6.18-rc4.orig.devel/fs/reiserfs/bitmap.c	2006-08-22 10:19:35.000000000 -0400
@@ -1019,7 +1019,6 @@ static inline int blocknrs_and_prealloc_
 	b_blocknr_t finish = SB_BLOCK_COUNT(s) - 1;
 	int passno = 0;
 	int nr_allocated = 0;
-	int bigalloc = 0;
 
 	determine_prealloc_size(hint);
 	if (!hint->formatted_node) {
@@ -1046,28 +1045,9 @@ static inline int blocknrs_and_prealloc_
 				hint->preallocate = hint->prealloc_size = 0;
 		}
 		/* for unformatted nodes, force large allocations */
-		bigalloc = amount_needed;
 	}
 
 	do {
-		/* in bigalloc mode, nr_allocated should stay zero until
-		 * the entire allocation is filled
-		 */
-		if (unlikely(bigalloc && nr_allocated)) {
-			reiserfs_warning(s, "bigalloc is %d, nr_allocated %d\n",
-					 bigalloc, nr_allocated);
-			/* reset things to a sane value */
-			bigalloc = amount_needed - nr_allocated;
-		}
-		/*
-		 * try pass 0 and pass 1 looking for a nice big
-		 * contiguous allocation.  Then reset and look
-		 * for anything you can find.
-		 */
-		if (passno == 2 && bigalloc) {
-			passno = 0;
-			bigalloc = 0;
-		}
 		switch (passno++) {
 		case 0:	/* Search from hint->search_start to end of disk */
 			start = hint->search_start;
@@ -1105,8 +1085,7 @@ static inline int blocknrs_and_prealloc_
 								 new_blocknrs +
 								 nr_allocated,
 								 start, finish,
-								 bigalloc ?
-								 bigalloc : 1,
+								 1,
 								 amount_needed -
 								 nr_allocated,
 								 hint->

-- 
Jeff Mahoney
SUSE Labs
