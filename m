From: yu kuai <yukuai3@huawei.com>
Subject: [PATCH] reiserfs: fix set but not used variable 'blkh'
Date: Fri, 23 Aug 2019 17:42:36 +0800
Message-ID: <1566553356-8345-1-git-send-email-yukuai3@huawei.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: zhengbin13@huawei.com, yukuai3@yukuai.com, yi.zhang@huawei.com

Gcc '-Wunused-but-set-variable' warning: 
fs/reiserfs/prints.c:749:21: warning: variable blkh set but not used

Fix it by using blkh instead of regenerating it by B_BLK_HEAD(bh)

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: yu kuai <yukuai3@huawei.com>
---
 fs/reiserfs/prints.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index 9fed1c0..590d42b 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -749,15 +749,16 @@ static void check_internal_block_head(struct buffer_head *bh)
 	struct block_head *blkh;
 
 	blkh = B_BLK_HEAD(bh);
-	if (!(B_LEVEL(bh) > DISK_LEAF_NODE_LEVEL && B_LEVEL(bh) <= MAX_HEIGHT))
+	if (!(blkh_level(blkh) > DISK_LEAF_NODE_LEVEL &&
+		blkh_level(blkh) <= MAX_HEIGHT))
 		reiserfs_panic(NULL, "vs-6025", "invalid level %z", bh);
 
-	if (B_NR_ITEMS(bh) > (bh->b_size - BLKH_SIZE) / IH_SIZE)
+	if (blkh_nr_item(blkh) > (bh->b_size - BLKH_SIZE) / IH_SIZE)
 		reiserfs_panic(NULL, "vs-6030", "invalid item number %z", bh);
 
-	if (B_FREE_SPACE(bh) !=
-	    bh->b_size - BLKH_SIZE - KEY_SIZE * B_NR_ITEMS(bh) -
-	    DC_SIZE * (B_NR_ITEMS(bh) + 1))
+	if (blkh_free_space(p_blkh) !=
+	    bh->b_size - BLKH_SIZE - KEY_SIZE * blkh_nr_item(blkh) -
+	    DC_SIZE * (blkh_nr_item(blkh) + 1))
 		reiserfs_panic(NULL, "vs-6040", "invalid free space %z", bh);
 
 }
-- 
2.7.4

