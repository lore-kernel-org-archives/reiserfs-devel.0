From: Hans Reiser <reiser@namesys.com>
Subject: [Fwd: [REISER4 PATCH] recover read performance]
Date: Tue, 28 Dec 2004 10:58:42 -0800
Message-ID: <41D1ACE2.2090404@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000307070903020209000304"
Return-path: <reiserfs-list-return-22926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@osdl.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--------------000307070903020209000304
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



--------------000307070903020209000304
Content-Type: message/rfc822;
 name="[REISER4 PATCH] recover read performance"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="[REISER4 PATCH] recover read performance"

Return-Path: <vs@namesys.com>
Delivered-To: reiser@namesys.com
Received: (qmail 31987 invoked by uid 85); 28 Dec 2004 18:43:25 -0000
Received: from vs@namesys.com by thebsh.namesys.com by uid 82 with qmail-scanner-1.15 
 (spamassassin: 2.43-cvs.  Clear:SA:0(0.0/2.0 tests=none autolearn=no version=2.60):. 
 Processed in 0.562371 secs); 28 Dec 2004 18:43:25 -0000
Received: from apachihuilliztli.mtu.ru (195.34.32.124)
  by thebsh.namesys.com with SMTP; 28 Dec 2004 18:43:24 -0000
Received: from umail.ru (umail.mtu.ru [195.34.32.101])
	by Apachihuilliztli.mtu.ru (Postfix) with ESMTP id 7E78C20B9A7;
	Tue, 28 Dec 2004 21:43:23 +0300 (MSK)
	(envelope-from vs@namesys.com)
Received: from [83.237.52.7] (HELO tribesman.namesys.com)
  by umail.ru (CommuniGate Pro SMTP 4.2b6)
  with ESMTP id 374515713; Tue, 28 Dec 2004 21:43:23 +0300
Subject: [REISER4 PATCH] recover read performance
From: Vladimir Saveliev <vs@namesys.com>
To: Hans Reiser <reiser@namesys.com>
Content-Type: multipart/mixed; boundary="=-aBXVgPweiTyP8sF1zmyB"
Message-Id: <1104259392.4673.50.camel@tribesman.namesys.com>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.4.4 
Date: Tue, 28 Dec 2004 21:43:14 +0300
X-Spam-Checker-Version: SpamAssassin 2.60 (1.212-2003-09-23-exp) on 
	thebsh.namesys.com
X-Spam-DCC: : 
X-Spam-Status: No, hits=0.0 required=2.0 tests=none autolearn=no version=2.60


--=-aBXVgPweiTyP8sF1zmyB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello, Hans

This patch eliminates reiser4 read performance drop ffound by Elena.
Please send it to Andrew

--=-aBXVgPweiTyP8sF1zmyB
Content-Disposition: attachment; filename=reiser4-recover-read-performance.patch
Content-Type: text/plain; name=reiser4-recover-read-performance.patch; charset=KOI8-R
Content-Transfer-Encoding: 7bit


This patch recovers reiser4 read performance which was caused by incorrect using 
page_cache_readahead


 fs/reiser4/plugin/file/file.c            |    2 +-
 fs/reiser4/plugin/item/extent_file_ops.c |    8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff -puN fs/reiser4/plugin/file/file.c~reiser4-recover-read-performance fs/reiser4/plugin/file/file.c
--- linux-2.6.10-rc3-mm1/fs/reiser4/plugin/file/file.c~reiser4-recover-read-performance	2004-12-28 21:39:06.503209425 +0300
+++ linux-2.6.10-rc3-mm1-vs/fs/reiser4/plugin/file/file.c	2004-12-28 21:39:54.406304805 +0300
@@ -2929,7 +2929,7 @@ reiser4_internal ssize_t sendfile_common
 		index = *ppos >> PAGE_CACHE_SHIFT;
 		offset = *ppos & ~PAGE_CACHE_MASK;
 
-		page_cache_readahead(inode->i_mapping, &file->f_ra, file, offset, 0);
+		page_cache_readahead(inode->i_mapping, &file->f_ra, file, offset, (file_size + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT);
 
 		/* determine valid read request size. */
 		read_request_size = PAGE_CACHE_SIZE - offset;
diff -puN fs/reiser4/plugin/item/extent_file_ops.c~reiser4-recover-read-performance fs/reiser4/plugin/item/extent_file_ops.c
--- linux-2.6.10-rc3-mm1/fs/reiser4/plugin/item/extent_file_ops.c~reiser4-recover-read-performance	2004-12-28 21:39:16.473980410 +0300
+++ linux-2.6.10-rc3-mm1-vs/fs/reiser4/plugin/item/extent_file_ops.c	2004-12-28 21:39:54.410304312 +0300
@@ -1124,7 +1124,7 @@ read_readpages(struct address_space *map
 
 static void
 call_page_cache_readahead(struct address_space *mapping, struct file *file, unsigned long page_nr,
-			  const uf_coord_t *uf_coord)
+			  const uf_coord_t *uf_coord, unsigned long ra_pages)
 {
 	reiser4_file_fsdata *fsdata;
 	uf_coord_t ra_coord;
@@ -1135,7 +1135,7 @@ call_page_cache_readahead(struct address
 	fsdata->ra2.data = &ra_coord;
 	fsdata->ra2.readpages = read_readpages;
 
-	page_cache_readahead(mapping, &file->f_ra, file, page_nr, 0);
+	page_cache_readahead(mapping, &file->f_ra, file, page_nr, ra_pages);
 	fsdata->ra2.readpages = NULL;
 }
 
@@ -1171,6 +1171,7 @@ read_extent(struct file *file, flow_t *f
 	uf_coord_t *uf_coord;
 	coord_t *coord;
 	extent_coord_extension_t *ext_coord;
+	unsigned long ra_pages;
 
 	uf_coord = &hint->coord;
 	assert("vs-1318", coord_extension_is_ok(uf_coord));
@@ -1198,9 +1199,10 @@ read_extent(struct file *file, flow_t *f
 	page_off = (unsigned long)(file_off & (PAGE_CACHE_SIZE - 1));
 
 	count = PAGE_CACHE_SIZE - page_off;
+	ra_pages = (flow->length + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT;
 
 	do {
-		call_page_cache_readahead(inode->i_mapping, file, page_nr, uf_coord);
+		call_page_cache_readahead(inode->i_mapping, file, page_nr, uf_coord, ra_pages);
 
 		/* this will return page if it exists and is uptodate, otherwise it will allocate page and call
 		   extent_readpage to fill it */

_

--=-aBXVgPweiTyP8sF1zmyB--




--------------000307070903020209000304--
