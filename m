From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 2/4] [PATCH] reiserfs: deal with NULL xattr root w/ xattrs disabled
Date: Sun, 10 May 2009 16:05:37 -0400
Message-ID: <20090510200649.766302622@suse.com>
References: <20090510200535.893737918@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-xattr-root-fixup
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ftp.linux.org.uk>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, stefanr@s5r6.in-berlin.de

 This patch avoids an Oops in open_xa_root that can occur when deleting a
 file with xattrs disabled. It assumes that the xattr root will be there,
 and that is not guaranteed.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/super.c |    2 --
 fs/reiserfs/xattr.c |    4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -448,13 +448,11 @@ int remove_save_link(struct inode *inode
 static void reiserfs_kill_sb(struct super_block *s)
 {
 	if (REISERFS_SB(s)) {
-#ifdef CONFIG_REISERFS_FS_XATTR
 		if (REISERFS_SB(s)->xattr_root) {
 			d_invalidate(REISERFS_SB(s)->xattr_root);
 			dput(REISERFS_SB(s)->xattr_root);
 			REISERFS_SB(s)->xattr_root = NULL;
 		}
-#endif
 		if (REISERFS_SB(s)->priv_root) {
 			d_invalidate(REISERFS_SB(s)->priv_root);
 			dput(REISERFS_SB(s)->priv_root);
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -123,7 +123,9 @@ static struct dentry *open_xa_root(struc
 	mutex_lock_nested(&privroot->d_inode->i_mutex, I_MUTEX_XATTR);
 
 	xaroot = dget(REISERFS_SB(sb)->xattr_root);
-	if (!xaroot->d_inode) {
+	if (!xaroot)
+		xaroot = ERR_PTR(-ENODATA);
+	else if (!xaroot->d_inode) {
 		int err = -ENODATA;
 		if (xattr_may_create(flags))
 			err = xattr_mkdir(privroot->d_inode, xaroot, 0700);


