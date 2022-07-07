From: Andrey Strachuk <strochuk@ispras.ru>
Subject: [PATCH] reiserfs: removed useless condition from if
Date: Thu,  7 Jul 2022 17:27:45 +0300
Message-ID: <20220707142745.14572-1-strochuk@ispras.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrey Strachuk <strochuk@ispras.ru>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org

At line 1001, bi is compared with NULL.

982	struct buffer_head *bh = bi->bi_bh;
983	int nr, free_space;
984	struct block_head *blkh;
985	struct item_head *ih;
986	int i;
987	int last_loc, unmoved_loc;
988
989	blkh = B_BLK_HEAD(bh);
990	nr = blkh_nr_item(blkh);
991	free_space = blkh_free_space(blkh);
992
993	/* check free space */
994	RFALSE(free_space < paste_size,
995	       "vs-10175: not enough free space: needed %d, available %d",
996	       paste_size, free_space);
997
998	#ifdef CONFIG_REISERFS_CHECK
999		if (zeros_number > paste_size) {
1000			struct super_block *sb = NULL;
1001			if (bi && bi->tb)
1002				sb = bi->tb->tb_sb;
1003			print_cur_tb("10177");
1004			reiserfs_panic(sb, "vs-10177",
1005				       "zeros_number == %d, paste_size == %d",
1006				       zeros_number, paste_size);
1007		}
1008	#endif				/* CONFIG_REISERFS_CHECK */

However, it cannot be NULL because kernel crashes
at line 982 otherwise.
The patch removes useless comparison.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
Fixes: c3a9c2109f84 ("reiserfs: rework reiserfs_panic")
---
 fs/reiserfs/lbalance.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
index 7f868569d4d0..0a530ea06d4e 100644
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -998,7 +998,7 @@ void leaf_paste_in_buffer(struct buffer_info *bi, int affected_item_num,
 #ifdef CONFIG_REISERFS_CHECK
 	if (zeros_number > paste_size) {
 		struct super_block *sb = NULL;
-		if (bi && bi->tb)
+		if (bi->tb)
 			sb = bi->tb->tb_sb;
 		print_cur_tb("10177");
 		reiserfs_panic(sb, "vs-10177",
-- 
2.25.1

