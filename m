From: Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: [PATCH 22/29] reiserfs: move reiserfs_xattr_handlers to .rodata
Date: Sat, 30 Sep 2023 02:00:26 -0300
Message-ID: <20230930050033.41174-23-wedsonaf@gmail.com>
References: <20230930050033.41174-1-wedsonaf@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696050131; x=1696654931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBbz7qEexK/f91LFPBrdRHvTcIeI5CzCcQ9osGtM8EE=;
        b=UMq4KiAenfMRZggFur+7oToekfK53rrUmKeNu0Ghnkzk07XzBH/KYXtiKuBEWPNA+6
         SjOMka6aI0mXxa9H/u7ZT5ccO+ijtLM7cXvJftVFXJTChfpsnOjKkdQr2lpI5nTRKa2v
         klfPbri/lScotVvZvz5jmKHKJ8V3/7yy5NBptU2GCKx1oZ1M5oAIxX7x3Hj79+4VreHP
         ENUpjQYP234CNQNBrH43OsoHK6EUmL24Ldho4wsqWmvvtbxKRSRVSYWMSQy04xeBbXgZ
         MAJ+3/Frgtrt6d1QMXJ2CScoH7Ozfpp4guc/5EFEltYMhDcYPfXiefYzHkhJcLJeJQKT
         FBXw==
In-Reply-To: <20230930050033.41174-1-wedsonaf@gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>, reiserfs-devel@vger.kernel.org

From: Wedson Almeida Filho <walmeida@microsoft.com>

This makes it harder for accidental or malicious changes to
reiserfs_xattr_handlers at runtime.

Cc: reiserfs-devel@vger.kernel.org
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
---
 fs/reiserfs/reiserfs.h | 2 +-
 fs/reiserfs/xattr.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 55e85256aae8..c18d0bc01725 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -1165,7 +1165,7 @@ static inline int bmap_would_wrap(unsigned bmap_nr)
 	return bmap_nr > ((1LL << 16) - 1);
 }
 
-extern const struct xattr_handler *reiserfs_xattr_handlers[];
+extern const struct xattr_handler * const reiserfs_xattr_handlers[];
 
 /*
  * this says about version of key of all items (but stat data) the
diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 651027967159..5a22a2bdaec7 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -910,7 +910,7 @@ static int create_privroot(struct dentry *dentry) { return 0; }
 #endif
 
 /* Actual operations that are exported to VFS-land */
-const struct xattr_handler *reiserfs_xattr_handlers[] = {
+const struct xattr_handler * const reiserfs_xattr_handlers[] = {
 #ifdef CONFIG_REISERFS_FS_XATTR
 	&reiserfs_xattr_user_handler,
 	&reiserfs_xattr_trusted_handler,
-- 
2.34.1

