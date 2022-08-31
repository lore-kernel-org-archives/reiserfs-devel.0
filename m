From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH 07/14] ntfs3: replace ll_rw_block()
Date: Wed, 31 Aug 2022 15:21:04 +0800
Message-ID: <20220831072111.3569680-8-yi.zhang@huawei.com>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20220831072111.3569680-1-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org
Cc: jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, yi.zhang@huawei.com, chengzhihao1@huawei.com, yukuai3@huawei.com

ll_rw_block() is not safe for the sync read path because it cannot
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in
ntfs_get_block_vbo().

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ntfs3/inode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 51363d4e8636..bbe7d4ea1750 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -630,12 +630,9 @@ static noinline int ntfs_get_block_vbo(struct inode *inode, u64 vbo,
 			bh->b_size = block_size;
 			off = vbo & (PAGE_SIZE - 1);
 			set_bh_page(bh, page, off);
-			ll_rw_block(REQ_OP_READ, 1, &bh);
-			wait_on_buffer(bh);
-			if (!buffer_uptodate(bh)) {
-				err = -EIO;
+			err = bh_read(bh, 0);
+			if (err)
 				goto out;
-			}
 			zero_user_segment(page, off + voff, off + block_size);
 		}
 	}
-- 
2.31.1

