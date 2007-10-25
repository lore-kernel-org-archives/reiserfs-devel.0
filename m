From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 40/8] page_cache.c cleanup
Date: Thu, 25 Oct 2007 15:19:32 +0200
Message-ID: <1193318372.15901.18.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-p+Ip3B+2fGBFDgRY2Vsj"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-p+Ip3B+2fGBFDgRY2Vsj
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 14 errors, 0 warnings, 730 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.

--=-p+Ip3B+2fGBFDgRY2Vsj
Content-Disposition: attachment; filename=page_cache.c.patch
Content-Type: text/x-patch; name=page_cache.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- page_cache.c.orig	2007-10-25 15:15:30.000000000 +0200
+++ page_cache.c	2007-10-25 15:15:57.000000000 +0200
@@ -140,11 +140,11 @@
       first time following happens (in call to ->read_node() or
       ->allocate_node()):
 
-        1. new page is added to the page cache.
+	1. new page is added to the page cache.
 
-        2. this page is attached to znode and its ->count is increased.
+	2. this page is attached to znode and its ->count is increased.
 
-        3. page is kmapped.
+	3. page is kmapped.
 
       3. if more calls to zload() follow (without corresponding zrelses), page
       counter is left intact and in its stead ->d_count is increased in znode.
@@ -158,14 +158,14 @@
       6. if node is removed from the tree (empty node with JNODE_HEARD_BANSHEE
       bit set) following will happen (also see comment at the top of znode.c):
 
-        1. when last lock is released, node will be uncaptured from
-        transaction. This released reference that transaction manager acquired
-        at the step 5.
-
-        2. when last reference is released, zput() detects that node is
-        actually deleted and calls ->delete_node()
-        operation. page_cache_delete_node() implementation detaches jnode from
-        page and releases page.
+	1. when last lock is released, node will be uncaptured from
+	transaction. This released reference that transaction manager acquired
+	at the step 5.
+
+	2. when last reference is released, zput() detects that node is
+	actually deleted and calls ->delete_node()
+	operation. page_cache_delete_node() implementation detaches jnode from
+	page and releases page.
 
       7. otherwise (node wasn't removed from the tree), last reference to
       znode will be released after transaction manager committed transaction
@@ -204,7 +204,7 @@
 #include <linux/writeback.h>
 #include <linux/blkdev.h>
 
-static struct bio *page_bio(struct page *, jnode *, int rw, gfp_t gfp);
+static struct bio *page_bio(struct page *, jnode * , int rw, gfp_t gfp);
 
 static struct address_space_operations formatted_fake_as_ops;
 
@@ -309,7 +309,7 @@ void reiser4_wait_page_writeback(struct 
 }
 
 /* return tree @page is in */
-reiser4_tree *reiser4_tree_by_page(const struct page *page /* page to query */ )
+reiser4_tree *reiser4_tree_by_page(const struct page *page/* page to query */)
 {
 	assert("nikita-2461", page != NULL);
 	return &get_super_private(page->mapping->host->i_sb)->tree;
@@ -373,7 +373,7 @@ end_bio_single_page_write(struct bio *bi
 
 /* ->readpage() method for formatted nodes */
 static int formatted_readpage(struct file *f UNUSED_ARG,
-			      struct page *page /* page to read */ )
+			      struct page *page/* page to read */)
 {
 	assert("nikita-2412", PagePrivate(page) && jprivate(page));
 	return reiser4_page_io(page, jprivate(page), READ,
@@ -531,7 +531,7 @@ int reiser4_writepage(struct page *page,
 	s = page->mapping->host->i_sb;
 	ctx = get_current_context_check();
 
-	//assert("", can_hit_entd(ctx, s));
+	/* assert("", can_hit_entd(ctx, s)); */
 	return write_page_by_ent(page, wbc);
 }
 

--=-p+Ip3B+2fGBFDgRY2Vsj--

