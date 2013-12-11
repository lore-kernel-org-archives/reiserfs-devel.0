From: Fabian Frederick <fabf@skynet.be>
Subject: [PATCH 1/1] reiserfs:Adding tmpfile support
Date: Wed, 11 Dec 2013 22:31:55 +0100
Message-ID: <20131211223155.e50a8b820090bb5a6aca7673@skynet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, akpm@linux-foundation.org

This patch is largely based on reiserfs_create function.
-Removing dquot_initialize (cf ext2/tmpfile)
-Removing add_entry code.
-Adding d_tmpfile generic call.

It was not extensively tested; other solutions would be to work with
invisible entries or merge creation - tmpfile process.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/reiserfs/namei.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index dc5236f..125060b 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -637,6 +637,65 @@ static int reiserfs_create(struct inode *dir, struct dentry *dentry, umode_t mod
 	return retval;
 }
 
+
+/* tmpfile function based on reiserfs_create without filename entry
+*/
+
+static int reiserfs_tmpfile(struct inode *dir, struct dentry *dentry,
+	umode_t mode)
+{
+	int retval;
+	struct inode *inode;
+	int jbegin_count =
+	    JOURNAL_PER_BALANCE_CNT * 2 +
+	    2 * (REISERFS_QUOTA_INIT_BLOCKS(dir->i_sb) +
+		 REISERFS_QUOTA_TRANS_BLOCKS(dir->i_sb));
+	struct reiserfs_transaction_handle th;
+	struct reiserfs_security_handle security;
+
+	inode = new_inode(dir->i_sb);
+	if (!inode)
+		return -ENOMEM;
+
+	new_inode_init(inode, dir, mode);
+
+	jbegin_count += reiserfs_cache_default_acl(dir);
+	retval = reiserfs_security_init(dir, inode, &dentry->d_name, &security);
+	if (retval < 0) {
+		drop_new_inode(inode);
+		return retval;
+	}
+	jbegin_count += retval;
+	reiserfs_write_lock(dir->i_sb);
+
+	retval = journal_begin(&th, dir->i_sb, jbegin_count);
+	if (retval) {
+		drop_new_inode(inode);
+		goto out_failed;
+	}
+
+	retval =
+	    reiserfs_new_inode(&th, dir, mode, NULL, 0 /*i_size */ , dentry,
+			       inode, &security);
+	if (retval)
+		goto out_failed;
+
+	inode->i_op = &reiserfs_file_inode_operations;
+	inode->i_fop = &reiserfs_file_operations;
+	inode->i_mapping->a_ops = &reiserfs_address_space_operations;
+
+	reiserfs_update_inode_transaction(inode);
+	reiserfs_update_inode_transaction(dir);
+
+	unlock_new_inode(inode);
+	d_tmpfile(dentry, inode);
+	retval = journal_end(&th, dir->i_sb, jbegin_count);
+
+      out_failed:
+	reiserfs_write_unlock(dir->i_sb);
+	return retval;
+}
+
 static int reiserfs_mknod(struct inode *dir, struct dentry *dentry, umode_t mode,
 			  dev_t rdev)
 {
@@ -1522,6 +1581,7 @@ const struct inode_operations reiserfs_dir_inode_operations = {
 	.removexattr = reiserfs_removexattr,
 	.permission = reiserfs_permission,
 	.get_acl = reiserfs_get_acl,
+	.tmpfile = reiserfs_tmpfile,
 };
 
 /*
-- 
1.8.1.4
