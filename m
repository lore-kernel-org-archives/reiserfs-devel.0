From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv7 5/6] reiser4: blocknr_set: use kmem_cache instead of kmalloc for allocating entries.
Date: Thu, 31 Jul 2014 14:19:48 +0400
Message-ID: <1406801989-6884-6-git-send-email-intelfx100@gmail.com>
References: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yBohRSkWm2o9sq/9aDypgHV74WvfbTDNXsZ4Xw47SYU=;
        b=qINSRyZ4m666RBco+yHwkyyRWsqUzkA+mjAb3OmIkOjUJV/M9sGUeWzcO01aW3nOmo
         3T16LGwxdp2zPDVgsH9XHUlfKJyabQJ2LnRMHr9zrD2PzjbPZQU7W5dl/oXimk2avovU
         AVgfNrwnd/c3hdnf2o03UGxRdJ7NKaFPy3y+1jwIDib812ktb7sDL4M9s3cf8SUprees
         A+9OfEENIa+/vox1LoKXOYftYH7pJMp7UJn9PUr1WUWxiiADTk+gO2hfOYSlD4SveM4a
         BoI1BOnoKOz7g+J87WBLuNwAerNkWoQp9j9CxcY2XN7uyNp8nAoX32uncqNI4Xno2Thn
         x0EA==
In-Reply-To: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/blocknrset.c | 34 +++++++++++++++++++++++++++++++---
 fs/reiser4/super_ops.c  |  7 +++++++
 fs/reiser4/txnmgr.h     |  2 ++
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/fs/reiser4/blocknrset.c b/fs/reiser4/blocknrset.c
index bf57c17..2f18cbc 100644
--- a/fs/reiser4/blocknrset.c
+++ b/fs/reiser4/blocknrset.c
@@ -8,6 +8,7 @@ reiser4/README */
 #include "dformat.h"
 #include "txnmgr.h"
 #include "context.h"
+#include "super.h"
 
 #include <linux/slab.h>
 
@@ -42,6 +43,8 @@ reiser4/README */
 	sizeof(struct list_head)) /		\
 	sizeof(reiser4_block_nr))
 
+static struct kmem_cache *blocknr_set_slab = NULL;
+
 /* An entry of the blocknr_set */
 struct blocknr_set_entry {
 	unsigned nr_singles;
@@ -82,8 +85,8 @@ static blocknr_set_entry *bse_alloc(void)
 {
 	blocknr_set_entry *e;
 
-	if ((e = (blocknr_set_entry *) kmalloc(sizeof(blocknr_set_entry),
-					   reiser4_ctx_gfp_mask_get())) == NULL)
+	if ((e = (blocknr_set_entry *) kmem_cache_alloc(blocknr_set_slab,
+							reiser4_ctx_gfp_mask_get())) == NULL)
 		return NULL;
 
 	bse_init(e);
@@ -95,7 +98,7 @@ static blocknr_set_entry *bse_alloc(void)
 /* Audited by: green(2002.06.11) */
 static void bse_free(blocknr_set_entry * bse)
 {
-	kfree(bse);
+	kmem_cache_free(blocknr_set_slab, bse);
 }
 
 /* Add a block number to a blocknr_set_entry */
@@ -225,6 +228,31 @@ blocknr_set_add_pair(txn_atom * atom,
 	return blocknr_set_add(atom, bset, new_bsep, a, b);
 }
 
+/* Initialize slab cache of blocknr_set_entry objects. */
+int blocknr_set_init_static(void)
+{
+	assert("intelfx-55", blocknr_set_slab == NULL);
+
+	blocknr_set_slab = kmem_cache_create("blocknr_set_entry",
+					     sizeof(blocknr_set_entry),
+					     0,
+					     SLAB_HWCACHE_ALIGN |
+					     SLAB_RECLAIM_ACCOUNT,
+					     NULL);
+
+	if (blocknr_set_slab == NULL) {
+		return RETERR(-ENOMEM);
+	}
+
+	return 0;
+}
+
+/* Destroy slab cache of blocknr_set_entry objects. */
+void blocknr_set_done_static(void)
+{
+	destroy_reiser4_cache(&blocknr_set_slab);
+}
+
 /* Initialize a blocknr_set. */
 void blocknr_set_init(struct list_head *bset)
 {
diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index a63ceb5..bcd7fd6 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -678,6 +678,10 @@ static int __init init_reiser4(void)
 	if ((result = reiser4_init_d_cursor()) != 0)
 		goto failed_init_d_cursor;
 
+	/* initialize cache of blocknr set entries */
+	if ((result = blocknr_set_init_static()) != 0)
+		goto failed_init_blocknr_set;
+
 	/* initialize cache of blocknr list entries */
 	if ((result = blocknr_list_init_static()) != 0)
 		goto failed_init_blocknr_list;
@@ -689,6 +693,8 @@ static int __init init_reiser4(void)
 
 	blocknr_list_done_static();
  failed_init_blocknr_list:
+	blocknr_set_done_static();
+ failed_init_blocknr_set:
 	reiser4_done_d_cursor();
  failed_init_d_cursor:
 	reiser4_done_file_fsdata();
@@ -725,6 +731,7 @@ static void __exit done_reiser4(void)
 	result = unregister_filesystem(&reiser4_fs_type);
 	BUG_ON(result != 0);
 	blocknr_list_done_static();
+	blocknr_set_done_static();
 	reiser4_done_d_cursor();
 	reiser4_done_file_fsdata();
 	reiser4_done_dentry_fsdata();
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 3515de9..0dee787 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -465,6 +465,8 @@ int capture_bulk(jnode **, int count);
 
 /* See the comment on the function blocknrset.c:blocknr_set_add for the
    calling convention of these three routines. */
+extern int blocknr_set_init_static(void);
+extern void blocknr_set_done_static(void);
 extern void blocknr_set_init(struct list_head * bset);
 extern void blocknr_set_destroy(struct list_head * bset);
 extern void blocknr_set_merge(struct list_head * from, struct list_head * into);
-- 
2.0.3

