From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH v2 08/14] ocfs2: replace ll_rw_block()
Date: Thu, 1 Sep 2022 21:34:59 +0800
Message-ID: <20220901133505.2510834-9-yi.zhang@huawei.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20220901133505.2510834-1-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz
Cc: tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, yi.zhang@huawei.com, chengzhihao1@huawei.com, yukuai3@huawei.com

ll_rw_block() is not safe for the sync read path because it cannot
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in ocfs2.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ocfs2/aops.c  | 2 +-
 fs/ocfs2/super.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index af4157f61927..1d65f6ef00ca 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -636,7 +636,7 @@ int ocfs2_map_page_blocks(struct page *page, u64 *p_blkno,
 			   !buffer_new(bh) &&
 			   ocfs2_should_read_blk(inode, page, block_start) &&
 			   (block_start < from || block_end > to)) {
-			ll_rw_block(REQ_OP_READ, 1, &bh);
+			bh_read_nowait(bh, 0);
 			*wait_bh++=bh;
 		}
 
diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index e2cc9eec287c..26b4c2bfee49 100644
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -1764,9 +1764,7 @@ static int ocfs2_get_sector(struct super_block *sb,
 	if (!buffer_dirty(*bh))
 		clear_buffer_uptodate(*bh);
 	unlock_buffer(*bh);
-	ll_rw_block(REQ_OP_READ, 1, bh);
-	wait_on_buffer(*bh);
-	if (!buffer_uptodate(*bh)) {
+	if (bh_read(*bh, 0) < 0) {
 		mlog_errno(-EIO);
 		brelse(*bh);
 		*bh = NULL;
-- 
2.31.1

