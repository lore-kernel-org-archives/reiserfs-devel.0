From: Nick Piggin <npiggin@suse.de>
Subject: [patch] reiser4 releasepage fix
Date: Sat, 15 Apr 2006 10:57:58 +0200
Message-ID: <20060415085758.GB14115@wotan.suse.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: reiserfs-list@namesys.com

Hi Andrew,

Can you put the following in -mm please? I cc'ed Hans about it earlier.
Basically, resier4 does not present a good reason why pagecache should
be dropped here. Basically the exact same operations are performed by
releasepage callers (reclaim or truncate). If there is some atomicity
problem, the code removed here wouldn't solve it anyway.

And unless reiser4 performs some of its own special synchronisation, I
can't see how it gets the pagecache removal sequence right for the
reclaim case (ie. careful checks of page_count and PageDirty under
tree_lock).

With this patch in place, reiser4-reget-page-mapping.patch can go.
I would also be worried about exporting remove_from_page_cache... at
least the __ variant can stop being exported now.

--
Index: linux-2.6/fs/reiser4/as_ops.c
===================================================================
--- linux-2.6.orig/fs/reiser4/as_ops.c
+++ linux-2.6/fs/reiser4/as_ops.c
@@ -358,11 +358,6 @@ int reiser4_releasepage(struct page *pag
 	assert("reiser4-4", page->mapping != NULL);
 	assert("reiser4-5", page->mapping->host != NULL);
 
-	/* is_page_cache_freeable() check
-	   (mapping + private + page_cache_get() by shrink_cache()) */
-	if (page_count(page) > 3)
-		return 0;
-
 	if (PageDirty(page))
 		return 0;
 
@@ -385,14 +380,6 @@ int reiser4_releasepage(struct page *pag
 		/* we are under memory pressure so release jnode also. */
 		jput(node);
 
-		write_lock_irq(&mapping->tree_lock);
-		/* shrink_list() + radix-tree */
-		if (page_count(page) == 2) {
-			__remove_from_page_cache(page);
-			atomic_dec(&page->_count);
-		}
-		write_unlock_irq(&mapping->tree_lock);
-
 		return 1;
 	} else {
 		spin_unlock(&(node->load));
