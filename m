From: Yunfeng Ye <yeyunfeng@huawei.com>
Subject: [PATCH] reiserfs: prevent NULL pointer dereference in
 reiserfs_insert_item()
Date: Wed, 4 Dec 2019 22:22:51 +0800
Message-ID: <79c5135d-ff25-1cc9-4e99-9f572b88cc00@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: akpm@linux-foundation.org, zhengbin13@huawei.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, "hushiyuan@huawei.com" <hushiyuan@huawei.com>, "linfeilong@huawei.com" <linfeilong@huawei.com>

The variable inode may be NULL in reiserfs_insert_item(), but there is
no check before accessing the member of inode.

Fix this by adding NULL pointer check before calling reiserfs_debug().

Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>
---
 fs/reiserfs/stree.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index da9ebe33882b..bb4973aefbb1 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -2246,7 +2246,8 @@ int reiserfs_insert_item(struct reiserfs_transaction_handle *th,
 	/* also releases the path */
 	unfix_nodes(&s_ins_balance);
 #ifdef REISERQUOTA_DEBUG
-	reiserfs_debug(th->t_super, REISERFS_DEBUG_CODE,
+	if (inode)
+		reiserfs_debug(th->t_super, REISERFS_DEBUG_CODE,
 		       "reiserquota insert_item(): freeing %u id=%u type=%c",
 		       quota_bytes, inode->i_uid, head2type(ih));
 #endif
-- 
2.7.4

