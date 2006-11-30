From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Subject: [PATCH] fs: reiserfs add missing brackets
Date: Thu, 30 Nov 2006 10:38:02 +0100
Message-ID: <200611301038.03140.m.kozlowski@tuxland.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-dev@namesys.com
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Hello,

	This patch adds missing brackets. 

 include/linux/reiserfs_fs.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.19-rc6-mm2-a/include/linux/reiserfs_fs.h	2006-11-28 12:17:06.000000000 +0100
+++ linux-2.6.19-rc6-mm2-b/include/linux/reiserfs_fs.h	2006-11-30 01:05:38.000000000 +0100
@@ -739,7 +739,7 @@ struct block_head {
 #define PUT_B_FREE_SPACE(p_s_bh,val)  do { set_blkh_free_space(B_BLK_HEAD(p_s_bh),val); } while (0)
 
 /* Get right delimiting key. -- little endian */
-#define B_PRIGHT_DELIM_KEY(p_s_bh)   (&(blk_right_delim_key(B_BLK_HEAD(p_s_bh))
+#define B_PRIGHT_DELIM_KEY(p_s_bh)   (&(blk_right_delim_key(B_BLK_HEAD(p_s_bh))))
 
 /* Does the buffer contain a disk leaf. */
 #define B_IS_ITEMS_LEVEL(p_s_bh)     (B_LEVEL(p_s_bh) == DISK_LEAF_NODE_LEVEL)


-- 
Regards,

	Mariusz Kozlowski
