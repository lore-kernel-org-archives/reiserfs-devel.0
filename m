From: Jason Yan <yanaijie@huawei.com>
Subject: [PATCH 2/2] reiserfs: remove set but not used variable in do_balan.c
Date: Tue, 27 Aug 2019 11:29:32 +0800
Message-ID: <20190827032932.46622-2-yanaijie@huawei.com>
References: <20190827032932.46622-1-yanaijie@huawei.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827032932.46622-1-yanaijie@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, sfr@canb.auug.org.au, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Yan <yanaijie@huawei.com>

Fix the following gcc warning:

fs/reiserfs/do_balan.c: In function balance_leaf_insert_right:
fs/reiserfs/do_balan.c:629:6: warning: variable ret set but not used
[-Wunused-but-set-variable]

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 fs/reiserfs/do_balan.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
index ffb6d7f0da94..4075e41408b4 100644
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -626,7 +626,6 @@ static void balance_leaf_insert_right(struct tree_balance *tb,
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
 	int n = B_NR_ITEMS(tbS0);
 	struct buffer_info bi;
-	int ret;
 
 	/* new item or part of it doesn't fall into R[0] */
 	if (n - tb->rnum[0] >= tb->item_pos) {
@@ -690,7 +689,7 @@ static void balance_leaf_insert_right(struct tree_balance *tb,
 		/* whole new item falls into R[0] */
 
 		/* Shift rnum[0]-1 items to R[0] */
-		ret = leaf_shift_right(tb, tb->rnum[0] - 1, tb->rbytes);
+		leaf_shift_right(tb, tb->rnum[0] - 1, tb->rbytes);
 
 		/* Insert new item into R[0] */
 		buffer_info_init_right(tb, &bi);
-- 
2.17.2

