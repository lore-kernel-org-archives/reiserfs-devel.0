From: Jeffrey Mahoney <jeffm@novell.com>
Subject: [PATCH 3/5] reiserfs: private inode abstracted to static inline
Date: Sat, 20 Nov 2004 19:13:32 -0500
Message-ID: <20041121001332.GD979@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22454-reiserfs=m.gmane.org@namesys.com>
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

This patch moves the assignment of i_priv_object to a static inline. This
is in preparation for selinux support in reiserfs.

Signed-off-by: Jeff Mahoney <jeffm@novell.com>

diff -ruNpX dontdiff linux-2.6.9/fs/reiserfs/inode.c linux-2.6.9.selinux/fs/reiserfs/inode.c
--- linux-2.6.9/fs/reiserfs/inode.c	2004-11-19 14:40:53.000000000 -0500
+++ linux-2.6.9.selinux/fs/reiserfs/inode.c	2004-11-20 17:04:42.000000000 -0500
@@ -1804,6 +1804,8 @@ int reiserfs_new_inode (struct reiserfs_
     } else if (inode->i_sb->s_flags & MS_POSIXACL) {
 	reiserfs_warning (inode->i_sb, "ACLs aren't enabled in the fs, "
 			  "but vfs thinks they are!");
+    } else if (is_reiserfs_priv_object (dir)) {
+	reiserfs_mark_inode_private (inode);
     }
 
     insert_inode_hash (inode);
diff -ruNpX dontdiff linux-2.6.9/fs/reiserfs/namei.c linux-2.6.9.selinux/fs/reiserfs/namei.c
--- linux-2.6.9/fs/reiserfs/namei.c	2004-08-14 01:37:14.000000000 -0400
+++ linux-2.6.9.selinux/fs/reiserfs/namei.c	2004-11-20 17:05:33.000000000 -0500
@@ -352,7 +352,7 @@ static struct dentry * reiserfs_lookup (
 
 	/* Propogate the priv_object flag so we know we're in the priv tree */
 	if (is_reiserfs_priv_object (dir))
-	    REISERFS_I(inode)->i_flags |= i_priv_object;
+	    reiserfs_mark_inode_private (inode);
     }
     reiserfs_write_unlock(dir->i_sb);
     if ( retval == IO_ERROR ) {
diff -ruNpX dontdiff linux-2.6.9/fs/reiserfs/xattr_acl.c linux-2.6.9.selinux/fs/reiserfs/xattr_acl.c
--- linux-2.6.9/fs/reiserfs/xattr_acl.c	2004-11-19 14:40:53.000000000 -0500
+++ linux-2.6.9.selinux/fs/reiserfs/xattr_acl.c	2004-11-19 18:25:03.000000000 -0500
@@ -337,7 +337,7 @@ reiserfs_inherit_default_acl (struct ino
      * would be useless since permissions are ignored, and a pain because
      * it introduces locking cycles */
     if (is_reiserfs_priv_object (dir)) {
-        REISERFS_I(inode)->i_flags |= i_priv_object;
+        reiserfs_mark_inode_private (inode);
         goto apply_umask;
     }
 
diff -ruNpX dontdiff linux-2.6.9/fs/reiserfs/xattr.c linux-2.6.9.selinux/fs/reiserfs/xattr.c
--- linux-2.6.9/fs/reiserfs/xattr.c	2004-11-19 14:40:53.000000000 -0500
+++ linux-2.6.9.selinux/fs/reiserfs/xattr.c	2004-11-20 18:03:57.523322224 -0500
@@ -182,7 +182,7 @@ open_xa_dir (const struct inode *inode, 
             return ERR_PTR (-ENODATA);
         }
         /* Newly created object.. Need to mark it private */
-        REISERFS_I(xadir->d_inode)->i_flags |= i_priv_object;
+        reiserfs_mark_inode_private (xadir->d_inode);
     }
 
     dput (xaroot);
@@ -231,7 +231,7 @@ get_xa_file_dentry (const struct inode *
             goto out;
         }
         /* Newly created object.. Need to mark it private */
-        REISERFS_I(xafile->d_inode)->i_flags |= i_priv_object;
+        reiserfs_mark_inode_private (xafile->d_inode);
     }
 
 out:
@@ -1316,7 +1334,7 @@ reiserfs_xattr_init (struct super_block 
 
       if (!err && dentry) {
           s->s_root->d_op = &xattr_lookup_poison_ops;
-          REISERFS_I(dentry->d_inode)->i_flags |= i_priv_object;
+          reiserfs_mark_inode_private (dentry->d_inode);
           REISERFS_SB(s)->priv_root = dentry;
       } else if (!(mount_flags & MS_RDONLY)) { /* xattrs are unavailable */
           /* If we're read-only it just means that the dir hasn't been
diff -ruNpX dontdiff linux-2.6.9/include/linux/reiserfs_xattr.h linux-2.6.9.selinux/include/linux/reiserfs_xattr.h
--- linux-2.6.9/include/linux/reiserfs_xattr.h	2004-08-14 01:38:11.000000000 -0400
+++ linux-2.6.9.selinux/include/linux/reiserfs_xattr.h	2004-11-20 17:00:26.000000000 -0500
@@ -103,6 +104,12 @@ reiserfs_read_unlock_xattr_i(struct inod
     up_read (&REISERFS_I(inode)->xattr_sem);
 }
 
+static inline void
+reiserfs_mark_inode_private(struct inode *inode)
+{
+    REISERFS_I(inode)->i_flags |= i_priv_object;
+}
+
 #else
 
 #define is_reiserfs_priv_object(inode) 0
-- 
Jeff Mahoney
SuSE Labs
