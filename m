From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: xattr_create is unused with xattrs disabled
Date: Mon, 30 Mar 2009 16:49:58 -0400
Message-ID: <49D13076.3020208@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

 This patch ifdefs xattr_create when xattrs aren't enabled.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/xattr.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -57,12 +57,14 @@
 /* Helpers for inode ops. We do this so that we don't have all the VFS
  * overhead and also for proper i_mutex annotation.
  * dir->i_mutex must be held for all of them. */
+#ifdef CONFIG_REISERFS_FS_XATTR
 static int xattr_create(struct inode *dir, struct dentry *dentry, int mode)
 {
 	BUG_ON(!mutex_is_locked(&dir->i_mutex));
 	vfs_dq_init(dir);
 	return dir->i_op->create(dir, dentry, mode, NULL);
 }
+#endif
 
 static int xattr_mkdir(struct inode *dir, struct dentry *dentry, int mode)
 {
-- 
Jeff Mahoney
SUSE Labs
