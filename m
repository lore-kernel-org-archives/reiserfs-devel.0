From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 07/11 reiserfs: use better open options for internal files
Date: Mon, 20 Feb 2006 15:14:58 -0500
Message-ID: <20060220201458.GA23288@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28098-reiserfs=m.gmane.org@namesys.com>
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


 The generic read path will mark the file's atime during the course of the
 read. For xattr backing files, this behavior is undesirable, so we open
 the xattr files and directories with O_NOATIME. We also add the O_DIRECTORY
 flag where the xattr dir is opened for readdir.

 fs/reiserfs/xattr.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15-staging1/fs/reiserfs/xattr.c linux-2.6.15-staging2/fs/reiserfs/xattr.c
--- linux-2.6.15-staging1/fs/reiserfs/xattr.c	2006-02-13 14:21:10.000000000 -0500
+++ linux-2.6.15-staging2/fs/reiserfs/xattr.c	2006-02-13 14:21:10.000000000 -0500
@@ -222,7 +222,7 @@ static struct file *open_xattr_file(stru
 
 	dput(xadir);
 
-	return dentry_open(xafile, NULL, O_RDWR);
+	return dentry_open(xafile, NULL, O_RDWR|O_NOATIME);
 
       out_err:
      	dput(xafile);
@@ -661,7 +661,7 @@ int reiserfs_delete_xattrs(struct inode 
 		goto out;
 	}
 
-	fp = dentry_open(dir, NULL, O_RDWR);
+	fp = dentry_open(dir, NULL, O_RDWR|O_NOATIME|O_DIRECTORY);
 	if (IS_ERR(fp)) {
 		err = PTR_ERR(fp);
 		/* dentry_open dputs the dentry if it fails */
@@ -755,7 +755,7 @@ int reiserfs_chown_xattrs(struct inode *
 		goto out;
 	}
 
-	fp = dentry_open(dir, NULL, O_RDWR);
+	fp = dentry_open(dir, NULL, O_RDWR|O_NOATIME|O_DIRECTORY);
 	if (IS_ERR(fp)) {
 		err = PTR_ERR(fp);
 		/* dentry_open dputs the dentry if it fails */
