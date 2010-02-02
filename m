From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 3/7] roll back vfs-add-super_operationssync_inodes-2.patch
Date: Tue, 2 Feb 2010 02:56:15 +0100
Message-ID: <201002020256.15908.edward.shishkin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:subject:date
         :user-agent:mime-version:message-id:content-type
         :content-transfer-encoding;
        bh=fZJ593MifPDUL6wLQ06wxnJyKFbitnOVUVjrsdVnz1g=;
        b=KoCO87o8fIJCO4KGAu006gDZlERbQt3EXQEAyJiqKPuBsPGRhPi93lyO56Lcb+Ufs3
         QReNgrKnh//b4iX48NDCs+JuzGP7yHs6clnDXKn4+I1a6eyrn6pbo/kRigMZKn+hHTmI
         /TFBgigRckw4f2k0uU9y6O9Ixvp637fNMo+EQ=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Roll back reiser4-vfs-add-super_operationssync_inodes-2.patch
(wrong stuff)

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/fs-writeback.c  |    5 +----
 include/linux/fs.h |    2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

Index: linux-2.6.33-rc5-mm1/fs/fs-writeback.c
===================================================================
--- linux-2.6.33-rc5-mm1.orig/fs/fs-writeback.c
+++ linux-2.6.33-rc5-mm1/fs/fs-writeback.c
@@ -1217,10 +1217,7 @@ EXPORT_SYMBOL(writeback_inodes_sb_if_idl
  */
 void sync_inodes_sb(struct super_block *sb)
 {
-	if (sb->s_op->sync_inodes)
-		sb->s_op->sync_inodes(sb, NULL);
-	else
-		bdi_sync_writeback(sb->s_bdi, sb);
+	bdi_sync_writeback(sb->s_bdi, sb);
 	wait_sb_inodes(sb);
 }
 EXPORT_SYMBOL(sync_inodes_sb);
Index: linux-2.6.33-rc5-mm1/include/linux/fs.h
===================================================================
--- linux-2.6.33-rc5-mm1.orig/include/linux/fs.h
+++ linux-2.6.33-rc5-mm1/include/linux/fs.h
@@ -1566,8 +1566,6 @@ struct super_operations {
 	void (*clear_inode) (struct inode *);
 	void (*umount_begin) (struct super_block *);
 
-	void (*sync_inodes)(struct super_block *sb,
-				struct writeback_control *wbc);
 	int (*show_options)(struct seq_file *, struct vfsmount *);
 	int (*show_stats)(struct seq_file *, struct vfsmount *);
 #ifdef CONFIG_QUOTA
