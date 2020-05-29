From: Yi Wang <wang.yi59@zte.com.cn>
Subject: [PATCH] reiserfs: Replace kmalloc with kcalloc in the comment
Date: Fri, 29 May 2020 09:02:30 +0800
Message-ID: <1590714150-15895-1-git-send-email-wang.yi59@zte.com.cn>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeffm@suse.com
Cc: jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, wang.yi59@zte.com.cn, wang.liang82@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>

From: Liao Pingfang <liao.pingfang@zte.com.cn>

Use kcalloc instead of kmalloc in the comment according to
the previous kcalloc() call.

Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
---
 fs/reiserfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 6419e6d..21ad762 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -1066,7 +1066,7 @@ int reiserfs_get_block(struct inode *inode, sector_t block,
 			} else {
 				/* paste hole to the indirect item */
 				/*
-				 * If kmalloc failed, max_to_insert becomes
+				 * If kcalloc failed, max_to_insert becomes
 				 * zero and it means we only have space for
 				 * one block
 				 */
-- 
2.9.5

