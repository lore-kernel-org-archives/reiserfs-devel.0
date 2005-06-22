From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: Check if attrs are enabled for attr ioctls
Date: Wed, 22 Jun 2005 15:50:32 -0400
Message-ID: <20050622195032.GA23981@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24475-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


 ReiserFS currently will allow the user to set/get attrs for files regardless
 if they are enabled. The patch checks to see if they are enabled, and returns
 -NOTTY if they are not.

 ext[23] doesn't need this check because attrs are always enabled.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
 
diff -ruNpX dontdiff linux-2.6.12-rc6/fs/reiserfs/ioctl.c linux-2.6.12-rc6.devel/fs/reiserfs/ioctl.c
--- linux-2.6.12-rc6/fs/reiserfs/ioctl.c	2005-06-13 14:34:32.000000000 -0400
+++ linux-2.6.12-rc6.devel/fs/reiserfs/ioctl.c	2005-06-22 17:30:40.000000000 -0400
@@ -34,10 +34,16 @@ int reiserfs_ioctl (struct inode * inode
 	/* following two cases are taken from fs/ext2/ioctl.c by Remy
 	   Card (card@masi.ibp.fr) */
 	case REISERFS_IOC_GETFLAGS:
+		if (!reiserfs_attrs (inode->i_sb))
+			return -ENOTTY;
+
 		flags = REISERFS_I(inode) -> i_attrs;
 		i_attrs_to_sd_attrs( inode, ( __u16 * ) &flags );
 		return put_user(flags, (int __user *) arg);
 	case REISERFS_IOC_SETFLAGS: {
+		if (!reiserfs_attrs (inode->i_sb))
+			return -ENOTTY;
+
 		if (IS_RDONLY(inode))
 			return -EROFS;
 
-- 
Jeff Mahoney
SuSE Labs
