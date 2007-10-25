From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 41/8] page_cache.h cleanup
Date: Thu, 25 Oct 2007 15:54:42 +0200
Message-ID: <1193320482.15901.22.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-8C6f0CW+pKOB5oQcSzr+"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-8C6f0CW+pKOB5oQcSzr+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 3 errors, 1 warnings, 68 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-8C6f0CW+pKOB5oQcSzr+
Content-Disposition: attachment; filename=page_cache.h.patch
Content-Type: text/x-patch; name=page_cache.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- page_cache.h.orig	2007-10-25 15:50:17.000000000 +0200
+++ page_cache.h	2007-10-25 15:52:28.000000000 +0200
@@ -2,7 +2,7 @@
  * reiser4/README */
 /* Memory pressure hooks. Fake inodes handling. See page_cache.c. */
 
-#if !defined( __REISER4_PAGE_CACHE_H__ )
+#if !defined(__REISER4_PAGE_CACHE_H__)
 #define __REISER4_PAGE_CACHE_H__
 
 #include "forward.h"
@@ -38,7 +38,7 @@ extern void reiser4_invalidate_pages(str
 				     unsigned long count, int even_cows);
 extern void capture_reiser4_inodes(struct super_block *,
 				   struct writeback_control *);
-static inline void * reiser4_vmalloc (unsigned long size)
+static inline void *reiser4_vmalloc(unsigned long size)
 {
 	return __vmalloc(size,
 			 reiser4_ctx_gfp_mask_get() | __GFP_HIGHMEM,

--=-8C6f0CW+pKOB5oQcSzr+--

