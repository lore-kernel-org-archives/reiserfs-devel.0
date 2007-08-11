From: Edward Shishkin <edward@namesys.com>
Subject: [PATCH] reiser4: fix readpage_unix_file
Date: Sun, 12 Aug 2007 00:02:23 +0400
Message-ID: <46BE15CF.50605@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070900000101050203070709"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, Zan Lynx <zlynx@acm.org>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070900000101050203070709
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Andrew,
please, apply.

Thanks,
Edward.

--------------070900000101050203070709
Content-Type: text/x-patch;
 name="reiser4-fix-readpage_unix_file.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-readpage_unix_file.patch"

. If nominated (by VFS) page is out of file size, then fill it
  by zeros instead of returning -EINVAL (this prevents returning
  an unexpected error (-EINVAL) by some apps that don't check
  file size).

. Check if the page became uptodate while it was being unlocked.

Signed-off-by: Edward Shishkin <edward@namesys.com> 
---
 linux-2.6.23-rc1-mm1/fs/reiser4/plugin/file/file.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1/fs/reiser4/plugin/file/file.c.orig
+++ linux-2.6.23-rc1-mm1/fs/reiser4/plugin/file/file.c
@@ -1436,9 +1436,11 @@
 	assert("vs-1061", page->mapping && page->mapping->host);
 
 	if (page->mapping->host->i_size <= page_offset(page)) {
-		/* page is out of file already */
+		/* page is out of file */
+		zero_user_page(page, 0, PAGE_CACHE_SIZE, KM_USER0);
+		SetPageUptodate(page);
 		unlock_page(page);
-		return -EINVAL;
+		return 0;
 	}
 
 	inode = page->mapping->host;
@@ -1625,6 +1627,8 @@
 		if (unlikely(ret))
 			goto exit;
 		lock_page(page);
+		if (PageUptodate(page))
+			goto unlock;
 		cbk_done = 1;
 	}
 	ret = zload(rc->coord.node);


--------------070900000101050203070709--
