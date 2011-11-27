From: Cong Wang <amwang@redhat.com>
Subject: [PATCH 45/62] reiserfs: remove the second argument of k[un]map_atomic()
Date: Sun, 27 Nov 2011 13:27:25 +0800
Message-ID: <1322371662-26166-46-git-send-email-amwang@redhat.com>
References: <1322371662-26166-1-git-send-email-amwang@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1322371662-26166-1-git-send-email-amwang@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, Cong Wang <amwang@redhat.com>, reiserfs-devel@vger.kernel.org


Signed-off-by: Cong Wang <amwang@redhat.com>
---
 fs/reiserfs/stree.c           |    4 ++--
 fs/reiserfs/tail_conversion.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 313d39d..77df82f 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -1284,12 +1284,12 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
 		 ** -clm
 		 */
 
-		data = kmap_atomic(un_bh->b_page, KM_USER0);
+		data = kmap_atomic(un_bh->b_page);
 		off = ((le_ih_k_offset(&s_ih) - 1) & (PAGE_CACHE_SIZE - 1));
 		memcpy(data + off,
 		       B_I_PITEM(PATH_PLAST_BUFFER(path), &s_ih),
 		       ret_value);
-		kunmap_atomic(data, KM_USER0);
+		kunmap_atomic(data);
 	}
 	/* Perform balancing after all resources have been collected at once. */
 	do_balance(&s_del_balance, NULL, NULL, M_DELETE);
diff --git a/fs/reiserfs/tail_conversion.c b/fs/reiserfs/tail_conversion.c
index d7f6e51..8f546bd 100644
--- a/fs/reiserfs/tail_conversion.c
+++ b/fs/reiserfs/tail_conversion.c
@@ -128,9 +128,9 @@ int direct2indirect(struct reiserfs_transaction_handle *th, struct inode *inode,
 	if (up_to_date_bh) {
 		unsigned pgoff =
 		    (tail_offset + total_tail - 1) & (PAGE_CACHE_SIZE - 1);
-		char *kaddr = kmap_atomic(up_to_date_bh->b_page, KM_USER0);
+		char *kaddr = kmap_atomic(up_to_date_bh->b_page);
 		memset(kaddr + pgoff, 0, blk_size - total_tail);
-		kunmap_atomic(kaddr, KM_USER0);
+		kunmap_atomic(kaddr);
 	}
 
 	REISERFS_I(inode)->i_first_direct_byte = U32_MAX;
-- 
1.7.4.4
