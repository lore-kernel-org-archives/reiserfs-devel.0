From: Christophe Saout <christophe@saout.de>
Subject: kdev_t usage fix for reiser4
Date: Wed, 27 Aug 2003 19:34:37 +0200
Message-ID: <1062005676.4286.4.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-WepeBAJksfaqhYB6yG2d"
Return-path: <reiserfs-list-return-15462-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-WepeBAJksfaqhYB6yG2d
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi!

I got reiser4 working with the 64 bit kdev_t patch.

You are not allowed to use kdev_val except for hashing purposes. Also
the kdev_t should not be used outside the kernel. That's what dev_t is
for.

I've attached a patch that fixes the usage in a bunch of places.

But I would also vote to use dev_t instead of int for reiser4 memory
structures that hold device numbers and reserve 64 bits for it in the
filesystem.

There is a place where the dev_t is used for debugging output, you
should also replace it to use the print_dev_t function (it returns a
string) because you don't know it's size for the printf format.

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html

--=-WepeBAJksfaqhYB6yG2d
Content-Disposition: attachment; filename=dev_t.fix
Content-Type: text/x-patch; name=dev_t.fix; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

diff -Nur linux.orig/fs/reiser4/inode.c linux/fs/reiser4/inode.c
--- linux.orig/fs/reiser4/inode.c	2003-08-27 19:28:43.458391272 +0200
+++ linux/fs/reiser4/inode.c	2003-08-27 19:28:23.441434312 +0200
@@ -170,11 +170,11 @@
 	case S_IFBLK:
 	case S_IFCHR:
 	case S_IFIFO:{
-			int rdev;	/* to keep gcc happy */
+			dev_t rdev;
 
 			/* ugly hack with rdev */
 			if (data == NULL) {
-				rdev = kdev_val(inode->i_rdev);
+				rdev = kdev_t_to_nr(inode->i_rdev);
 				inode->i_rdev = val_to_kdev(0);
 			} else
 				rdev = data->rdev;
diff -Nur linux.orig/fs/reiser4/plugin/item/static_stat.c linux/fs/reiser4/plugin/item/static_stat.c
--- linux.orig/fs/reiser4/plugin/item/static_stat.c	2003-08-27 19:28:49.947404792 +0200
+++ linux/fs/reiser4/plugin/item/static_stat.c	2003-08-27 19:28:37.134352672 +0200
@@ -425,7 +425,7 @@
 		inode->i_atime.tv_sec = d32tocpu(&sd->atime);
 		inode->i_mtime.tv_sec = d32tocpu(&sd->mtime);
 		inode->i_ctime.tv_sec = d32tocpu(&sd->ctime);
-		inode->i_rdev = val_to_kdev(d32tocpu(&sd->rdev));
+		inode->i_rdev = to_kdev_t(d32tocpu(&sd->rdev));
 		inode_set_bytes(inode, (loff_t) d64tocpu(&sd->bytes));
 		next_stat(len, area, sizeof *sd);
 		return 0;
@@ -470,7 +470,7 @@
 	cputod32((__u32) inode->i_atime.tv_sec, &sd->atime);
 	cputod32((__u32) inode->i_ctime.tv_sec, &sd->ctime);
 	cputod32((__u32) inode->i_mtime.tv_sec, &sd->mtime);
-	cputod32(kdev_val(inode->i_rdev), &sd->rdev);
+	cputod32(kdev_t_to_nr(inode->i_rdev), &sd->rdev);
 	cputod64((__u64) inode_get_bytes(inode), &sd->bytes);
 	*area += sizeof *sd;
 	return 0;

--=-WepeBAJksfaqhYB6yG2d--

