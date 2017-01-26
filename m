From: edward.shishkin@gmail.com
Subject: [PATCH 3/3] Reiser4: use vmalloc instead of kmalloc to alloacte zhash table
Date: Thu, 26 Jan 2017 13:23:37 +0100
Message-ID: <1485433417-10554-3-git-send-email-edward.shishkin@gmail.com>
References: <1485433417-10554-1-git-send-email-edward.shishkin@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E41IyT5TNZj1lGjvpamN6GFaxzCz5Kfe3moNAQya+h8=;
        b=dijvo4Kj9svElcG1xOdS1kKKUuZw8xOK56wNIcBMBj0cSWlk8/MnxEmzMBHYKquHeC
         Q5oSY3v4xBqLQa9+JNpqC+ih45FgN0PptNQIXgEJAgKo493RaeGPJQKRHMjoq7HkyzR4
         aC8G0M5GwncscFTS5drlSA9czR+7lluIT2LY9NFwl6rtOYKKjKvnv4yVDQGwAQO7awda
         Ycl+T7gf/Zz7RIExhWpIAkrreEjcezfz+aww2vTmy+nJro+I3yoJDDQc4KGuQw6lAh0H
         CNyAujp0XsmIgGpYynhAhyt2Jim9yyNkalWumr0cni/WVJG1cziOUyud3IB2p/fD4wqG
         sipw==
In-Reply-To: <1485433417-10554-1-git-send-email-edward.shishkin@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

From: Edward Shishkin <edward.shishkin@gmail.com>

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 znode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/znode.c b/znode.c
index 2581a0a..f7c77ef 100644
--- a/znode.c
+++ b/znode.c
@@ -188,8 +188,8 @@ blknrhashfn(z_hash_table * table, const reiser4_block_nr * b)
 }
 
 /* The hash table definition */
-#define KMALLOC(size) kmalloc((size), reiser4_ctx_gfp_mask_get())
-#define KFREE(ptr, size) kfree(ptr)
+#define KMALLOC(size) reiser4_vmalloc(size)
+#define KFREE(ptr, size) vfree(ptr)
 TYPE_SAFE_HASH_DEFINE(z, znode, reiser4_block_nr, zjnode.key.z, zjnode.link.z,
 		      blknrhashfn, blknreq);
 #undef KFREE
-- 
2.7.4

