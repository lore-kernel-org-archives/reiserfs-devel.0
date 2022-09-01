From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH v2 13/14] ext2: replace bh_submit_read() helper with bh_read_locked()
Date: Thu, 1 Sep 2022 21:35:04 +0800
Message-ID: <20220901133505.2510834-14-yi.zhang@huawei.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20220901133505.2510834-1-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz
Cc: tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, yi.zhang@huawei.com, chengzhihao1@huawei.com, yukuai3@huawei.com

bh_submit_read() and the uptodate check logic in bh_uptodate_or_lock()
has been integrated in bh_read() helper, so switch to use it directly.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ext2/balloc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
index c17ccc19b938..5dc0a31f4a08 100644
--- a/fs/ext2/balloc.c
+++ b/fs/ext2/balloc.c
@@ -126,6 +126,7 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
 	struct ext2_group_desc * desc;
 	struct buffer_head * bh = NULL;
 	ext2_fsblk_t bitmap_blk;
+	int ret;
 
 	desc = ext2_get_group_desc(sb, block_group, NULL);
 	if (!desc)
@@ -139,10 +140,10 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
 			    block_group, le32_to_cpu(desc->bg_block_bitmap));
 		return NULL;
 	}
-	if (likely(bh_uptodate_or_lock(bh)))
+	ret = bh_read(bh, 0);
+	if (ret > 0)
 		return bh;
-
-	if (bh_submit_read(bh) < 0) {
+	if (ret < 0) {
 		brelse(bh);
 		ext2_error(sb, __func__,
 			    "Cannot read block bitmap - "
-- 
2.31.1

