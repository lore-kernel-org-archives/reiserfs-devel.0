From: Jeffrey Mahoney <jeffm@novell.com>
Subject: [PATCH 4/5] reiserfs: fixes to allow reiserfs to use selinux attributes
Date: Sat, 20 Nov 2004 19:13:38 -0500
Message-ID: <20041121001338.GE979@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

This patch adds the selinux private flag to inodes marked as reiserfs-private.

It also avoids the use of vfs_rmdir, since it will use the selinux permissions
check. The permission checks aren't valid in this context. Also, some of the
checks performed are superfluous for this case.

Signed-off-by: Jeff Mahoney <jeffm@novell.com>

diff -ruNpX dontdiff linux-2.6.9/include/linux/reiserfs_xattr.h linux-2.6.9.selinux/include/linux/reiserfs_xattr.h
--- linux-2.6.9/include/linux/reiserfs_xattr.h	2004-08-14 01:38:11.000000000 -0400
+++ linux-2.6.9.selinux/include/linux/reiserfs_xattr.h	2004-11-20 17:00:26.000000000 -0500
@@ -5,6 +5,7 @@
 #include <linux/config.h>
 #include <linux/init.h>
 #include <linux/xattr.h>
+#include <linux/security.h>
 
 /* Magic value in header */
 #define REISERFS_XATTR_MAGIC 0x52465841 /* "RFXA" */
@@ -103,12 +104,13 @@ reiserfs_read_unlock_xattr_i(struct inod
     up_read (&REISERFS_I(inode)->xattr_sem);
 }
 
 static inline void
 reiserfs_mark_inode_private(struct inode *inode)
 {
     REISERFS_I(inode)->i_flags |= i_priv_object;
+    security_inode_mark_private (inode);
 }
 
 #else
 
 #define is_reiserfs_priv_object(inode) 0
diff -ruNpX dontdiff linux-2.6.9/fs/reiserfs/xattr.c linux-2.6.9.selinux/fs/reiserfs/xattr.c
--- linux-2.6.9/fs/reiserfs/xattr.c	2004-11-19 14:40:53.000000000 -0500
+++ linux-2.6.9.selinux/fs/reiserfs/xattr.c	2004-11-20 18:03:57.523322224 -0500
@@ -834,7 +834,15 @@ reiserfs_delete_xattrs (struct inode *in
     if (dir->d_inode->i_nlink <= 2) {
         root = get_xa_root (inode->i_sb);
         reiserfs_write_lock_xattrs (inode->i_sb);
-        err = vfs_rmdir (root->d_inode, dir);
+
+        /* security checks can cause vfs_rmdir to fail when it shouldn't */
+        dentry_unhash (dir);
+        err = root->d_inode->i_op->rmdir (root->d_inode, dir);
+        if (!err) {
+            dir->d_inode->i_flags |= S_DEAD;
+            d_delete (dir);
+        }
+        dput (dir);
         reiserfs_write_unlock_xattrs (inode->i_sb);
         dput (root);
     } else {

-- 
Jeff Mahoney
SuSE Labs
