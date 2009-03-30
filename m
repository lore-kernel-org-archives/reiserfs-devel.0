From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 16/35 xattr-rework] reiserfs: remove link detection code
Date: Mon, 30 Mar 2009 14:02:31 -0400
Message-ID: <20090330181011.335919655@suse.com>
References: <20090330180215.951354436@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=patches.suse/reiserfs-remove-link-detection.diff
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

 Early in the reiserfs xattr development, there was a plan to use hardlinks
 to save disk space for identical xattrs. That code never materialized and
 isn't going to, so this patch removes the detection code.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

---
 fs/reiserfs/xattr.c |   13 -------------
 1 file changed, 13 deletions(-)

--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -432,7 +432,6 @@ reiserfs_xattr_set(struct inode *inode,
 	if (buffer && buffer_size)
 		xahash = xattr_hash(buffer, buffer_size);
 
-      open_file:
 	dentry = get_xa_file_dentry(inode, name, flags);
 	if (IS_ERR(dentry)) {
 		err = PTR_ERR(dentry);
@@ -441,18 +440,6 @@ reiserfs_xattr_set(struct inode *inode,
 
 	REISERFS_I(inode)->i_flags |= i_has_xattr_dir;
 
-	/* we need to copy it off.. */
-	if (dentry->d_inode->i_nlink > 1) {
-		dput(dentry);
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


