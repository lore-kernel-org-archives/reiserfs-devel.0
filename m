From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv7 4/6] reiser4: blocknr_list: use kmem_cache instead of kmalloc for allocating entries.
Date: Thu, 31 Jul 2014 14:19:47 +0400
Message-ID: <1406801989-6884-5-git-send-email-intelfx100@gmail.com>
References: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YQ8fDPGPGhZhKSMkZbrQpYcnsF8PmKvLnU5Ct+Da/nQ=;
        b=iCcGN8806/bw71guOaJAtl7WkXZl1QihN+cpeSf57l7uxQ9vIGDsosHh2vrixDf3dE
         oLd+VZ1i7dN0gKQYucsNJsXKlBcsEoaWTLCo1a1bDvIXnsjgMDeE31N9Y258xEZm/uP3
         1BDLjufTyvatnW0WE2xT5Pk4s9hOXjQgVhItxhsbmqMMMPBNMJORthta5JiGya1ANrbD
         JwnwXKphv9pCxbWCPzjQCCJyLVR8+fJbUFoGuPqJNV6nuho6fMSAVTiDam6grYIDCbBe
         9ANwaaQTp2Sv2uUXs43E2L3wrlFC+ySjAaf7FsMAM8RwlUoVlTnhuopxLIGV5DbEHwXk
         tKJQ==
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
 fs/reiser4/blocknrlist.c | 31 ++++++++++++++++++++++++++++---
 fs/reiser4/super_ops.c   |  7 +++++++
 fs/reiser4/txnmgr.h      |  2 ++
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/fs/reiser4/blocknrlist.c b/fs/reiser4/blocknrlist.c
index 2868771..39a4a9b 100644
--- a/fs/reiser4/blocknrlist.c
+++ b/fs/reiser4/blocknrlist.c
@@ -9,10 +9,13 @@
 #include "dformat.h"
 #include "txnmgr.h"
 #include "context.h"
+#include "super.h"
 
 #include <linux/slab.h>
 #include <linux/list_sort.h>
 
+static struct kmem_cache *blocknr_list_slab = NULL;
+
 /**
  * Represents an extent range [@start; @end).
  */
@@ -36,8 +39,8 @@ static blocknr_list_entry *blocknr_list_entry_alloc(void)
 {
 	blocknr_list_entry *entry;
 
-	entry = (blocknr_list_entry *)kmalloc(sizeof(blocknr_list_entry),
-	                                      reiser4_ctx_gfp_mask_get());
+	entry = (blocknr_list_entry *)kmem_cache_alloc(blocknr_list_slab,
+	                                               reiser4_ctx_gfp_mask_get());
 	if (entry == NULL) {
 		return NULL;
 	}
@@ -51,7 +54,7 @@ static void blocknr_list_entry_free(blocknr_list_entry *entry)
 {
 	assert("intelfx-12", entry != NULL);
 
-	kfree(entry);
+	kmem_cache_free(blocknr_list_slab, entry);
 }
 
 /**
@@ -142,6 +145,28 @@ static int blocknr_list_entry_compare(void* priv UNUSED_ARG,
 	return 0;
 }
 
+int blocknr_list_init_static(void)
+{
+	assert("intelfx-54", blocknr_list_slab == NULL);
+
+	blocknr_list_slab = kmem_cache_create("blocknr_list_entry",
+	                                      sizeof(blocknr_list_entry),
+	                                      0,
+	                                      SLAB_HWCACHE_ALIGN |
+	                                      SLAB_RECLAIM_ACCOUNT,
+	                                      NULL);
+	if (blocknr_list_slab == NULL) {
+		return RETERR(-ENOMEM);
+	}
+
+	return 0;
+}
+
+void blocknr_list_done_static(void)
+{
+	destroy_reiser4_cache(&blocknr_list_slab);
+}
+
 void blocknr_list_init(struct list_head* blist)
 {
 	assert("intelfx-24", blist != NULL);
diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index 81773b3..a63ceb5 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -678,11 +678,17 @@ static int __init init_reiser4(void)
 	if ((result = reiser4_init_d_cursor()) != 0)
 		goto failed_init_d_cursor;
 
+	/* initialize cache of blocknr list entries */
+	if ((result = blocknr_list_init_static()) != 0)
+		goto failed_init_blocknr_list;
+
 	if ((result = register_filesystem(&reiser4_fs_type)) == 0) {
 		reiser4_debugfs_root = debugfs_create_dir("reiser4", NULL);
 		return 0;
 	}
 
+	blocknr_list_done_static();
+ failed_init_blocknr_list:
 	reiser4_done_d_cursor();
  failed_init_d_cursor:
 	reiser4_done_file_fsdata();
@@ -718,6 +724,7 @@ static void __exit done_reiser4(void)
 	debugfs_remove(reiser4_debugfs_root);
 	result = unregister_filesystem(&reiser4_fs_type);
 	BUG_ON(result != 0);
+	blocknr_list_done_static();
 	reiser4_done_d_cursor();
 	reiser4_done_file_fsdata();
 	reiser4_done_dentry_fsdata();
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 18ca23d..3515de9 100644
--- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -486,6 +486,8 @@ extern int blocknr_set_iterator(txn_atom * atom, struct list_head * bset,
 				int delete);
 
 /* This is the block list interface (see blocknrlist.c) */
+extern int blocknr_list_init_static(void);
+extern void blocknr_list_done_static(void);
 extern void blocknr_list_init(struct list_head *blist);
 extern void blocknr_list_destroy(struct list_head *blist);
 extern void blocknr_list_merge(struct list_head *from, struct list_head *to);
-- 
2.0.3

