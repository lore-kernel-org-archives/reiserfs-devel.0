From: Edward Shishkin <edward@namesys.com>
Subject: [patch 3/3] reiser4: fix unix-file readpages filler
Date: Mon, 16 Jul 2007 22:51:05 +0400
Message-ID: <469BBE19.5020900@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070000020800020305000904"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Zan Lynx <zlynx@acm.org>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070000020800020305000904
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit




--------------070000020800020305000904
Content-Type: text/x-patch;
 name="reiser4-fix-uf_readpages_filler.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-uf_readpages_filler.patch"

Protect page (via incrementing page count) from
being reclaimed when looking for extent pointer
in unix-file specific readpages filler.

Signed-off-by: Edward Shishkin <edward@namesys.com>
---
 linux-2.6.22-rc6-mm1/fs/reiser4/plugin/file/file.c |   32 +++++++++++----------
 1 files changed, 18 insertions(+), 14 deletions(-)

--- linux-2.6.22-rc6-mm1/fs/reiser4/plugin/file/file.c.orig
+++ linux-2.6.22-rc6-mm1/fs/reiser4/plugin/file/file.c
@@ -1607,6 +1607,8 @@
 		unlock_page(page);
 		return 0;
 	}
+	page_cache_get(page);
+
 	if (rc->lh.node == 0) {
 		/* no twig lock  - have to do tree search. */
 		reiser4_key key;
@@ -1619,21 +1621,19 @@
 			&key, &rc->coord, &rc->lh,
 			ZNODE_READ_LOCK, FIND_EXACT,
 			TWIG_LEVEL, TWIG_LEVEL, CBK_UNIQUE, NULL);
-		if (ret)
-			return ret;
+		if (unlikely(ret))
+			goto exit;
 		lock_page(page);
 		cbk_done = 1;
 	}
 	ret = zload(rc->coord.node);
-	if (ret) {
-		unlock_page(page);
-		return ret;
-	}
+	if (unlikely(ret))
+		goto unlock;
 	if (!coord_is_existing_item(&rc->coord) ||
 	    !item_is_extent(&rc->coord)) {
 		zrelse(rc->coord.node);
-		unlock_page(page);
-		return RETERR(-EIO);
+		ret = RETERR(-EIO);
+		goto unlock;
 	}
 	ext = extent_by_coord(&rc->coord);
 	ext_index = extent_unit_index(&rc->coord);
@@ -1647,22 +1647,26 @@
 		/* we can be here after a CBK call only in case of
 		   corruption of the tree or the tree lookup algorithm bug. */
 		if (unlikely(cbk_done)) {
-			unlock_page(page);
-			return RETERR(-EIO);
+			ret = RETERR(-EIO);
+			goto unlock;
 		}
 		goto repeat;
 	}
 	node = jnode_of_page(page);
 	if (unlikely(IS_ERR(node))) {
 		zrelse(rc->coord.node);
-		unlock_page(page);
-		return PTR_ERR(node);
+		ret = PTR_ERR(node);
+		goto unlock;
 	}
 	ret = reiser4_do_readpage_extent(ext, page->index - ext_index, page);
 	jput(node);
 	zrelse(rc->coord.node);
-	if (ret)
-		unlock_page(page);
+	if (likely(!ret))
+		goto exit;
+ unlock:
+	unlock_page(page);
+ exit:
+	page_cache_release(page);
 	return ret;
 }
 


--------------070000020800020305000904--
