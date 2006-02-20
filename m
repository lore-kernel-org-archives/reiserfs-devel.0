From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 11/11] reiserfs: associate xattr's packing locality w/ owning inode's
Date: Mon, 20 Feb 2006 15:14:58 -0500
Message-ID: <20060220201458.GA23332@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: "E. Gryaznova" <grev@namesys.com>


 Currently, the .reiserfs_priv tree is "just another directory" on the
 filesystem, and the placement rules are unspecialized.

 This patch associates the dirid of the inode's xattr dir and the xattr files
 with the dirid of the owning inode. Since most xattrs will likely be
 tails anyway, this should give a decent performance boost.

 fs/reiserfs/inode.c |    6 ++++++
 fs/reiserfs/xattr.c |    7 +++++++
 2 files changed, 13 insertions(+)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/inode.c linux-2.6.15-staging2/fs/reiserfs/inode.c
--- linux-2.6.15-staging1/fs/reiserfs/inode.c	2006-02-13 14:21:15.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/inode.c	2006-02-13 14:21:17.000000000 -0500
@@ -1806,6 +1806,12 @@ int reiserfs_new_inode(struct reiserfs_t
 
 	/* item head of new item */
 	ih.ih_key.k_dir_id = reiserfs_choose_packing(dir);
+
+	/* Pack xattrs with their owning files */
+	if (is_reiserfs_priv_object(dir) && dentry->d_fsdata != NULL &&
+	    le32_to_cpu(INODE_PKEY(dentry->d_fsdata)->k_dir_id) != 1)
+		ih.ih_key.k_dir_id = INODE_PKEY(dentry->d_fsdata)->k_dir_id;
+
 	ih.ih_key.k_objectid = cpu_to_le32(reiserfs_get_unused_objectid(th));
 	if (!ih.ih_key.k_objectid) {
 		err = -ENOMEM;
diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-02-13 14:21:17.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-02-13 14:21:17.000000000 -0500
@@ -164,7 +164,10 @@ static struct dentry *open_xa_dir(struct
 			goto out_err;
 		}
 
+		xadir->d_fsdata = inode;
 		err = vfs_mkdir(xaroot->d_inode, xadir, 0700);
+		xadir->d_fsdata = NULL;
+
 		if (err) {
 			dput(xadir);
 			mutex_unlock(&xaroot->d_inode->i_mutex);
@@ -215,7 +218,11 @@ static struct file *open_xattr_file(stru
 		if (flags & XATTR_REPLACE)
 			goto out_err;
 
+		/* By being in this code at all, we already have a reference
+		 * to inode. */
+		xafile->d_fsdata = inode;
 		err = vfs_create(xadir->d_inode, xafile, 0700|S_IFREG, NULL);
+		xafile->d_fsdata = NULL;
 		if (err)
 			goto out_err;
 	}
