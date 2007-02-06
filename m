From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Subject: [PATCH 2.6.20] reiserfs: Use ARRAY_SIZE macro when appropriate
Date: Tue, 6 Feb 2007 18:08:50 +0200
Message-ID: <20070206160850.GN8991@Ahmed>
References: <20070206160204.GA8991@Ahmed>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20070206160204.GA8991@Ahmed>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-dev@namesys.com
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hi all,

A patch to use ARRAY_SIZE macro already defined in kernel.h

Signed-off-by: Ahmed S. Darwish <darwish.07@gmail.com>
---
diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
index fba304e..f85c5cf 100644
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -19,6 +19,7 @@
 #include <linux/time.h>
 #include <linux/reiserfs_fs.h>
 #include <linux/buffer_head.h>
+#include <linux/kernel.h>
 
 #ifdef CONFIG_REISERFS_CHECK
 
@@ -1756,7 +1757,7 @@ static void store_thrown(struct tree_balance *tb, struct buffer_head *bh)
 	if (buffer_dirty(bh))
 		reiserfs_warning(tb->tb_sb,
 				 "store_thrown deals with dirty buffer");
-	for (i = 0; i < sizeof(tb->thrown) / sizeof(tb->thrown[0]); i++)
+	for (i = 0; i < ARRAY_SIZE(tb->thrown); i++)
 		if (!tb->thrown[i]) {
 			tb->thrown[i] = bh;
 			get_bh(bh);	/* free_thrown puts this */
@@ -1769,7 +1770,7 @@ static void free_thrown(struct tree_balance *tb)
 {
 	int i;
 	b_blocknr_t blocknr;
-	for (i = 0; i < sizeof(tb->thrown) / sizeof(tb->thrown[0]); i++) {
+	for (i = 0; i < ARRAY_SIZE(tb->thrown); i++) {
 		if (tb->thrown[i]) {
 			blocknr = tb->thrown[i]->b_blocknr;
 			if (buffer_dirty(tb->thrown[i]))


-- 
Ahmed S. Darwish
http://darwish-07.blogspot.com
