From: Zhang Yi <yi.zhang@huawei.com>
Subject: [PATCH 11/14] ufs: replace ll_rw_block()
Date: Wed, 31 Aug 2022 15:21:08 +0800
Message-ID: <20220831072111.3569680-12-yi.zhang@huawei.com>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20220831072111.3569680-1-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org
Cc: jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, yi.zhang@huawei.com, chengzhihao1@huawei.com, yukuai3@huawei.com

ll_rw_block() is not safe for the sync read path because it cannot
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in ufs.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ufs/balloc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ufs/balloc.c b/fs/ufs/balloc.c
index bd810d8239f2..bbc2159eece4 100644
--- a/fs/ufs/balloc.c
+++ b/fs/ufs/balloc.c
@@ -296,9 +296,7 @@ static void ufs_change_blocknr(struct inode *inode, sector_t beg,
 			if (!buffer_mapped(bh))
 					map_bh(bh, inode->i_sb, oldb + pos);
 			if (!buffer_uptodate(bh)) {
-				ll_rw_block(REQ_OP_READ, 1, &bh);
-				wait_on_buffer(bh);
-				if (!buffer_uptodate(bh)) {
+				if (bh_read(bh, 0)) {
 					ufs_error(inode->i_sb, __func__,
 						  "read of block failed\n");
 					break;
-- 
2.31.1

