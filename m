From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH v2 03/14] fs/buffer: replace ll_rw_block()
Date: Thu, 1 Sep 2022 21:34:54 +0800
Message-ID: <20220901133505.2510834-4-yi.zhang@huawei.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20220901133505.2510834-1-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz
Cc: tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, yi.zhang@huawei.com, chengzhihao1@huawei.com, yukuai3@huawei.com

ll_rw_block() is not safe for the sync IO path because it skip buffers
which has been locked by others, it could lead to false positive EIO
when submitting read IO. So stop using ll_rw_block(), switch to use new
helpers which could guarantee buffer locked and submit IO if needed.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/buffer.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index a6bc769e665d..aec568b3ae52 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -562,7 +562,7 @@ void write_boundary_block(struct block_device *bdev,
 	struct buffer_head *bh = __find_get_block(bdev, bblock + 1, blocksize);
 	if (bh) {
 		if (buffer_dirty(bh))
-			ll_rw_block(REQ_OP_WRITE, 1, &bh);
+			write_dirty_buffer(bh, 0);
 		put_bh(bh);
 	}
 }
@@ -1342,7 +1342,7 @@ void __breadahead(struct block_device *bdev, sector_t block, unsigned size)
 {
 	struct buffer_head *bh = __getblk(bdev, block, size);
 	if (likely(bh)) {
-		ll_rw_block(REQ_OP_READ | REQ_RAHEAD, 1, &bh);
+		bh_readahead(bh, REQ_RAHEAD);
 		brelse(bh);
 	}
 }
@@ -2022,7 +2022,7 @@ int __block_write_begin_int(struct folio *folio, loff_t pos, unsigned len,
 		if (!buffer_uptodate(bh) && !buffer_delay(bh) &&
 		    !buffer_unwritten(bh) &&
 		     (block_start < from || block_end > to)) {
-			ll_rw_block(REQ_OP_READ, 1, &bh);
+			bh_read_nowait(bh, 0);
 			*wait_bh++=bh;
 		}
 	}
@@ -2582,11 +2582,9 @@ int block_truncate_page(struct address_space *mapping,
 		set_buffer_uptodate(bh);
 
 	if (!buffer_uptodate(bh) && !buffer_delay(bh) && !buffer_unwritten(bh)) {
-		err = -EIO;
-		ll_rw_block(REQ_OP_READ, 1, &bh);
-		wait_on_buffer(bh);
+		err = bh_read(bh, 0);
 		/* Uhhuh. Read error. Complain and punt. */
-		if (!buffer_uptodate(bh))
+		if (err < 0)
 			goto unlock;
 	}
 
-- 
2.31.1

