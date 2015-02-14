From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 3/3] Adjust reiser4 for 3.19: convert to private i_dquot field.
Date: Sat, 14 Feb 2015 03:44:43 +0300
Message-ID: <1423874683-7787-3-git-send-email-intelfx100@gmail.com>
References: <1423874683-7787-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FqHGpoVLk82VXEN8K8AyrqG3WDIeDx5w9iRuaI10jmE=;
        b=z5zVlJNBDRzeBgaHAYHEo2xozx0BQSVdeW1YFqxtFjKbe7RyfLNAvB0Zinw/Ji9zHn
         dnk96AGidrrEP4QZd80Oe3H9BVmp+rnibXDcn56pjNTsahJi687Lom4Dvs2mGVcUWoZE
         vulABTCq6pN1bnbn1+V2b6q9Mer98E694TLiTCvuTU+jxr7UKCcY/pU8U2yEb/c2UOV2
         PAMp5pdQ5XhSqGnjdVHfQAJixNWP2bUydH9a9wzzHmtGE1Lthdl8FRm+r2zIHOwZCRcU
         pPlgDXOChSuSLOrJLVIdQ2+D39uXn5Fftzcfzqay8WbJG5RmZ32zthPo7UpHUtowdfqo
         i5Ew==
In-Reply-To: <1423874683-7787-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Upstream commit 75cbe701a4251fcd8b846d52ae42f88c9a8e5e93
"vfs: Remove i_dquot field from inode".

Example taken from upstream commit 53873638bd7cbcbf43cea72f0eb0d2ee9260f059
"reiserfs: Convert to private i_dquot field".

reiser4 does not support quotas, but there's rudimentary code doing some quota
operations, and in order for it not to segfault we need to act like we do
support quotas.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

Hopefully I've done the right thing. Another option would be to simply remove
all the quota-related code.

 fs/reiser4/inode.h     |  4 ++++
 fs/reiser4/super_ops.c | 15 ++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/reiser4/inode.h b/fs/reiser4/inode.h
index 95e1d9e..43f7731 100644
--- a/fs/reiser4/inode.h
+++ b/fs/reiser4/inode.h
@@ -154,6 +154,10 @@ struct reiser4_inode {
 	 * fs/reiser4/search.c:handle_vroot() */
 	reiser4_block_nr vroot;
 	struct mutex loading;
+
+#ifdef CONFIG_QUOTA
+	struct dquot *i_dquot[MAXQUOTAS];
+#endif
 };
 
 void loading_init_once(reiser4_inode *);
diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index 7e319bb..b196835 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -113,6 +113,9 @@ static struct inode *reiser4_alloc_inode(struct super_block *super)
 		/* this deals with info's loading semaphore */
 		loading_alloc(info);
 		info->vroot = UBER_TREE_ADDR;
+#ifdef CONFIG_QUOTA
+		memset(&info->i_dquot, 0, sizeof(info->i_dquot));
+#endif
 		return &obj->vfs_inode;
 	} else
 		return NULL;
@@ -477,6 +480,13 @@ static int reiser4_show_options(struct seq_file *m, struct dentry *dentry)
 	return 0;
 }
 
+#ifdef CONFIG_QUOTA
+static struct dquot **reiser4_get_dquots(struct inode *inode)
+{
+	return reiser4_inode_data(inode)->i_dquot;
+}
+#endif
+
 struct super_operations reiser4_super_operations = {
 	.alloc_inode = reiser4_alloc_inode,
 	.destroy_inode = reiser4_destroy_inode,
@@ -487,7 +497,10 @@ struct super_operations reiser4_super_operations = {
 	.statfs = reiser4_statfs,
 	.remount_fs = reiser4_remount,
 	.writeback_inodes = reiser4_writeback_inodes,
-	.show_options = reiser4_show_options
+	.show_options = reiser4_show_options,
+#ifdef CONFIG_QUOTA
+	.get_dquots = reiser4_get_dquots,
+#endif
 };
 
 /**
-- 
2.3.0

