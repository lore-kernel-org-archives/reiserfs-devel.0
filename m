From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH 13/14] ext2: replace bh_submit_read() helper with bh_read_locked()
Date: Wed, 31 Aug 2022 15:21:10 +0800
Message-ID: <20220831072111.3569680-14-yi.zhang@huawei.com>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20220831072111.3569680-1-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org
Cc: jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, yi.zhang@huawei.com, chengzhihao1@huawei.com, yukuai3@huawei.com

bh_submit_read() is almost the same as bh_read_locked(), switch to use
bh_read_locked() in read_block_bitmap(), prepare remove the old one.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ext2/balloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
index c17ccc19b938..548a1d607f5a 100644
--- a/fs/ext2/balloc.c
+++ b/fs/ext2/balloc.c
@@ -142,7 +142,7 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
 	if (likely(bh_uptodate_or_lock(bh)))
 		return bh;
 
-	if (bh_submit_read(bh) < 0) {
+	if (bh_read_locked(bh, 0) < 0) {
 		brelse(bh);
 		ext2_error(sb, __func__,
 			    "Cannot read block bitmap - "
-- 
2.31.1

