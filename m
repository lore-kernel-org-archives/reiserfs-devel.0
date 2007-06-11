From: jeffm@suse.com
Subject: [patch 16/40] reiserfs: remove link detection code
Date: Mon, 11 Jun 2007 15:03:25 -0400
Message-ID: <20070611190631.086406632@suse.com>
References: <20070611190309.532091171@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs-remove-link-detection.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

 Early in the reiserfs xattr development, there was a plan to use hardlinks
 to save disk space for identical xattrs. That code never materialized and
 isn't going to, so this patch removes the detection code.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

---
 fs/reiserfs/xattr.c |   13 -------------
 1 file changed, 13 deletions(-)

--- a/fs/reiserfs/xattr.c	2007-06-11 14:49:36.000000000 -0400
+++ b/fs/reiserfs/xattr.c	2007-06-11 14:50:06.000000000 -0400
@@ -384,7 +384,6 @@ reiserfs_xattr_set(struct inode *inode, 
 	if (!buffer)
 		return reiserfs_xattr_del(inode, name);
 
-      open_file:
 	fp = open_xattr_file(inode, name, flags);
 	if (IS_ERR(fp)) {
 		err = PTR_ERR(fp);
@@ -394,18 +393,6 @@ reiserfs_xattr_set(struct inode *inode, 
 	xahash = xattr_hash(buffer, buffer_size);
 	xinode = fp->f_path.dentry->d_inode;
 
-	/* we need to copy it off.. */
-	if (xinode->i_nlink > 1) {
-		fput(fp);
-		err = reiserfs_xattr_del(inode, name);
-		if (err < 0)
-			goto out;
-		/* We just killed the old one, we're not replacing anymore */
-		if (flags & XATTR_REPLACE)
-			flags &= ~XATTR_REPLACE;
-		goto open_file;
-	}
-
 	/* Resize it so we're ok to write there */
 	newattrs.ia_size = buffer_size;
 	newattrs.ia_valid = ATTR_SIZE | ATTR_CTIME;

-- 
Jeff Mahoney
SUSE Labs

