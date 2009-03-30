From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 22/35 xattr-rework] reiserfs: remove i_has_xattr_dir
Date: Mon, 30 Mar 2009 14:02:37 -0400
Message-ID: <20090330181012.115651016@suse.com>
References: <20090330180215.951354436@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=patches.suse/reiserfs-remove-i_has_xattr_dir.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

 With the changes to xattr root locking, the i_has_xattr_dir flag
 is no longer needed. This patch removes it.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

---
 fs/reiserfs/xattr.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -459,10 +459,7 @@ int reiserfs_delete_xattrs(struct inode
 
 	dput(root);
 out:
-	if (!err)
-		REISERFS_I(inode)->i_flags =
-		    REISERFS_I(inode)->i_flags & ~i_has_xattr_dir;
-	else
+	if (err)
 		reiserfs_warning(inode->i_sb, "jdm-20004",
 				 "Couldn't remove all xattrs (%d)\n", err);
 	return err;
@@ -660,7 +657,6 @@ reiserfs_xattr_set(struct inode *inode,
 	down_write(&REISERFS_I(inode)->i_xattr_sem);
 
 	xahash = xattr_hash(buffer, buffer_size);
-	REISERFS_I(inode)->i_flags |= i_has_xattr_dir;
 
 	/* Resize it so we're ok to write there */
 	newattrs.ia_size = buffer_size;
@@ -769,7 +765,6 @@ reiserfs_xattr_get(const struct inode *i
 	down_read(&REISERFS_I(inode)->i_xattr_sem);
 
 	isize = i_size_read(dentry->d_inode);
-	REISERFS_I(inode)->i_flags |= i_has_xattr_dir;
 
 	/* Just return the size needed */
 	if (buffer == NULL) {
@@ -999,8 +994,6 @@ ssize_t reiserfs_listxattr(struct dentry
 	buf.r_pos = 0;
 	buf.r_inode = dentry->d_inode;
 
-	REISERFS_I(dentry->d_inode)->i_flags |= i_has_xattr_dir;
-
 	mutex_lock_nested(&dir->d_inode->i_mutex, I_MUTEX_XATTR);
 	err = xattr_readdir(dir->d_inode, reiserfs_listxattr_filler, &buf);
 	mutex_unlock(&dir->d_inode->i_mutex);


