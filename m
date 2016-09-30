From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: [PATCH] Adjust reiser4 for 3.15: replace truncate_inode_pages(..., 0) with truncate_inode_pages_final(...).
Date: Fri, 30 Sep 2016 09:43:32 +0300
Message-ID: <20160930064332.19365-1-intelfx@intelfx.name>
References: <20160930063629.13794-1-intelfx@intelfx.name>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RGX/w1YwWJ0tDmDK7gdp0qBjPGHbn/pdwqprzB+IU3Q=;
        b=B5Aa+wRqpA1k/z064xlxh5li33XUX5xRkvAz9fFPsi6JIKjtRjfj4MlU6BGy0HhS23
         iBXeL8q82IC6m0+5HYw+8tLpS0YykNjJUP/gBON45mtPaK2Sf+w2ih8Jdb9tXE30MdMX
         yAJf7ezktYt6LL6S36izv01y5fUgvxFlHJlwE=
In-Reply-To: <20160930063629.13794-1-intelfx@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx@intelfx.name>

Upstream commit 91b0abe36a7b2b3b02d7500925a5f8455334f0e5
"mm + fs: store shadow entries in page cache".

Moreover, the truncate_inode_pages(..., 0) in delete_object_cryptcompress()
is not needed at all.

Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
---
 plugin/file/cryptcompress.c | 2 --
 super_ops.c                 | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/plugin/file/cryptcompress.c b/plugin/file/cryptcompress.c
index 59d8df8..5433de9 100644
--- a/plugin/file/cryptcompress.c
+++ b/plugin/file/cryptcompress.c
@@ -3595,8 +3595,6 @@ int delete_object_cryptcompress(struct inode *inode)
 			(unsigned long long)get_inode_oid(inode),
 			result);
 	}
-	truncate_inode_pages(inode->i_mapping, 0);
-	assert("edward-1487", pages_truncate_ok(inode, 0));
 	/* and remove stat data */
 	return reiser4_delete_object_common(inode);
 }
diff --git a/super_ops.c b/super_ops.c
index 73c18f2..697580c 100644
--- a/super_ops.c
+++ b/super_ops.c
@@ -215,7 +215,7 @@ static void reiser4_evict_inode(struct inode *inode)
 			fplug->delete_object(inode);
 	}
 
-	truncate_inode_pages(&inode->i_data, 0);
+	truncate_inode_pages_final(&inode->i_data);
 	inode->i_blocks = 0;
 	clear_inode(inode);
 	reiser4_exit_context(ctx);
-- 
2.10.0

