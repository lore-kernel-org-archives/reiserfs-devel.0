From: Chris Mason <mason@suse.com>
Subject: [PATCH] updated 2.6 reiserfsv3 patch set
Date: Wed, 03 Mar 2004 20:45:54 -0500
Message-ID: <1078364753.3928.188.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello everyone,

ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.3

Has updated patches for reiserfs v3.  New in this set:

reiserfs-lock-lat-2 -- updated to give better latencies during a delete
reiserfs-search-restart-2 -- better schedule detection
reiserfs-write-sched-bug -- schedule detection fix
reiserfs-jh-5 -- shouldn't hang during lilo anymore

The lilo fix for reiserfs-jh-5 is below as an incremental.

-chris

Index: linux.t/fs/reiserfs/ioctl.c
===================================================================
--- linux.t.orig/fs/reiserfs/ioctl.c	2004-01-09 01:59:26.000000000 -0500
+++ linux.t/fs/reiserfs/ioctl.c	2004-03-03 20:31:07.909642808 -0500
@@ -92,6 +92,7 @@
     int retval = 0;
     int index ;
     struct page *page ;
+    struct address_space *mapping ;
     unsigned long write_from ;
     unsigned long blocksize = inode->i_sb->s_blocksize ;
     	
@@ -122,17 +123,19 @@
     ** reiserfs_get_block to unpack the tail for us.
     */
     index = inode->i_size >> PAGE_CACHE_SHIFT ;
-    page = grab_cache_page(inode->i_mapping, index) ;
+    mapping = inode->i_mapping ;
+    page = grab_cache_page(mapping, index) ;
     retval = -ENOMEM;
     if (!page) {
         goto out ;
     }
-    retval = reiserfs_prepare_write(NULL, page, write_from, blocksize) ;
+    retval = mapping->a_ops->prepare_write(NULL, page, write_from, write_from) ;
     if (retval)
         goto out_unlock ;
 
     /* conversion can change page contents, must flush */
     flush_dcache_page(page) ;
+    retval = mapping->a_ops->commit_write(NULL, page, write_from, write_from) ;
     REISERFS_I(inode)->i_flags |= i_nopack_mask;
 
 out_unlock:


