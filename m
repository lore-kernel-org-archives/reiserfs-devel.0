From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 1/7] reiserfs: fix up lockdep warnings
Date: Tue, 16 Oct 2007 19:02:11 -0400
Message-ID: <20071016230258.530307000@suse.com>
References: <20071016230210.779927000@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=patches.suse/reiserfs-fix-lockdep-warnings
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Linux Torvalds <torvalds@linux-foundation.org>
Cc: ReiserFS Development Mailing List <reiserfs-devel@vger.kernel.org>

 This patch adds I_MUTEX_XATTR annotations to the inode locking in
 the reiserfs xattr code.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

---
 fs/reiserfs/xattr.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/fs/reiserfs/xattr.c	2007-10-16 18:52:28.557840914 -0400
+++ b/fs/reiserfs/xattr.c	2007-10-16 18:52:32.258571244 -0400
@@ -478,7 +478,7 @@ reiserfs_xattr_set(struct inode *inode, 
 	/* Resize it so we're ok to write there */
 	newattrs.ia_size = buffer_size;
 	newattrs.ia_valid = ATTR_SIZE | ATTR_CTIME;
-	mutex_lock(&xinode->i_mutex);
+	mutex_lock_nested(&xinode->i_mutex, I_MUTEX_XATTR);
 	err = notify_change(fp->f_path.dentry, &newattrs);
 	if (err)
 		goto out_filp;
@@ -1217,7 +1217,8 @@ int reiserfs_xattr_init(struct super_blo
 		if (!IS_ERR(dentry)) {
 			if (!(mount_flags & MS_RDONLY) && !dentry->d_inode) {
 				struct inode *inode = dentry->d_parent->d_inode;
-				mutex_lock(&inode->i_mutex);
+				mutex_lock_nested(&inode->i_mutex,
+				                  I_MUTEX_XATTR);
 				err = inode->i_op->mkdir(inode, dentry, 0700);
 				mutex_unlock(&inode->i_mutex);
 				if (err) {

-- 

