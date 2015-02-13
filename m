From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH] Adjust reiser4 for 3.15: replace truncate_inode_pages(..., 0) with truncate_inode_pages_final(...).
Date: Fri, 13 Feb 2015 15:49:19 +0300
Message-ID: <1423831759-14470-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=adwwb0GQ5kdZzcfq9MeY+A3BbhpxRoylpJFh1bFXpKI=;
        b=Oe+go6wjFUbkADDhn8e838JZkbBajKssCHTBZObZovWS97x6gayJjKuF5hKgZzNyaN
         Hrae3B2je9S2tzzwPbxdnSLQVP5aJCWrIolw6wssALTXdjpJfdUfigwK7NIZe305SjNS
         9B+kuPX6Hv1lUq4JgvuSJKapZVLw31+gXwbE8htZQZZER9qD2vSUsX/Z5DI6TpFYwBgF
         PpVsz4MS6jQQQbmNIHCTJkbLoRzcxjFefjw9E8vMRNrS644u4PLOrdJgNnmBaJReK4BX
         ZpchkdiWsGxfS7+2nNMQmgIvmnOePTIP24u2CMdjTzq/9CN6rCWyPqZoepYxqEPQXGI9
         obVA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Upstream commit 91b0abe36a7b2b3b02d7500925a5f8455334f0e5
"mm + fs: store shadow entries in page cache".

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

We have missed this one long ago...

 fs/reiser4/super_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index acff93a..7e319bb 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -214,7 +214,7 @@ static void reiser4_evict_inode(struct inode *inode)
 			fplug->delete_object(inode);
 	}
 
-	truncate_inode_pages(&inode->i_data, 0);
+	truncate_inode_pages_final(&inode->i_data);
 	inode->i_blocks = 0;
 	clear_inode(inode);
 	reiser4_exit_context(ctx);
-- 
2.3.0

