From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: port for Linux-4.5
Date: Wed, 30 Mar 2016 11:20:23 +0200
Message-ID: <56FB9A57.3040906@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000302030209040000010204"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:subject:to:message-id:date:user-agent:mime-version;
        bh=y3tlLZdBYBw0u9T33tf2qLWIkt7IfI5CWPPCOxs8Pjw=;
        b=Qab+rN/6cYFAY0S6tcijDwfTQmZyGH8BFjxfXeokm0y6QbUzy8HDIHI+YsMDYZq9Ff
         33cjzApciHEpbPjX8jFBseYOxfjAcIAtKfCohrjtjpj5qzHPm/Khuz//xfpDpww+6YZ3
         7BGEffJmiy4TpBCDvQRKBK38i6Zv+5uXy74SFY581q1j+S8VM8BAj7Tn9o0RcNUIPuvw
         5fH3k7R0BZymVin4e5ImVdE2N25rHmDmSEUWjHuVpS2F1+5Es2R0k43R8VfLRGUmVzC5
         B3OPokqVu7ZUurPvLYkvyXA1g1ydydw+J6npHfB9HP3l3SevFJ8O7GxW3MzJ0w3j5SZA
         qQ5g==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000302030209040000010204
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

. Adjust for the new ->get_link() of vfs's inode_operations: we don't
   support RCU mode;
. check returned value of __copy_from_user() to make gcc happy
   (the path is never invoked) in create_item_node40().

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

--------------000302030209040000010204
Content-Type: text/x-patch;
 name="reiser4-port-for-4.5.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-port-for-4.5.patch"

diff -u -r linux-4.4/fs/reiser4/plugin/inode_ops.c linux-4.5/fs/reiser4/plugin/inode_ops.c
--- linux-4.4/fs/reiser4/plugin/inode_ops.c	2016-03-30 11:00:02.712055109 +0200
+++ linux-4.5/fs/reiser4/plugin/inode_ops.c	2016-03-29 15:05:54.603153436 +0200
@@ -394,23 +394,25 @@
  */
 
 /**
- * reiser4_follow_link_common - follow_link of inode operations
+ * reiser4_get_link_common: ->get_link() of inode_operations
  * @dentry: dentry of symlink
- * @data:
  *
- * This is common implementation of vfs's followlink method of struct
- * inode_operations.
  * Assumes that inode's i_private points to the content of symbolic link.
  */
-const char *reiser4_follow_link_common(struct dentry *dentry, void **cookie)
+const char *reiser4_get_link_common(struct dentry *dentry,
+				    struct inode *inode,
+				    struct delayed_call *done)
 {
+	if (!dentry)
+		return ERR_PTR(-ECHILD);
+
 	assert("vs-851", S_ISLNK(dentry->d_inode->i_mode));
 
-	if (!dentry->d_inode->i_private
-	    || !reiser4_inode_get_flag(dentry->d_inode,
-				       REISER4_GENERIC_PTR_USED))
+	if (!dentry->d_inode->i_private ||
+	    !reiser4_inode_get_flag(dentry->d_inode, REISER4_GENERIC_PTR_USED))
 		return ERR_PTR(RETERR(-EINVAL));
-	return *cookie = dentry->d_inode->i_private;
+
+	return dentry->d_inode->i_private;
 }
 
 /**
@@ -877,3 +879,14 @@
 	dir->i_ctime = dir->i_mtime = CURRENT_TIME;
 	return reiser4_update_sd(dir);
 }
+
+/*
+  Local variables:
+  c-indentation-style: "K&R"
+  mode-name: "LC"
+  c-basic-offset: 8
+  tab-width: 8
+  fill-column: 80
+  scroll-step: 1
+  End:
+*/
diff -u -r linux-4.4/fs/reiser4/plugin/node/node40.c linux-4.5/fs/reiser4/plugin/node/node40.c
--- linux-4.4/fs/reiser4/plugin/node/node40.c	2016-03-30 11:00:02.718055100 +0200
+++ linux-4.5/fs/reiser4/plugin/node/node40.c	2016-03-29 15:19:23.230063706 +0200
@@ -876,9 +876,10 @@
 			   without this check? */
 			assert("nikita-3038", reiser4_schedulable());
 			/* copy data from user space */
-			__copy_from_user(zdata(target->node) + offset,
-					 (const char __user *)data->data,
-					 (unsigned)data->length);
+			if (__copy_from_user(zdata(target->node) + offset,
+					     (const char __user *)data->data,
+					     (unsigned)data->length))
+				return RETERR(-EFAULT);
 		} else
 			/* copy from kernel space */
 			memcpy(zdata(target->node) + offset, data->data,
diff -u -r linux-4.4/fs/reiser4/plugin/object.c linux-4.5/fs/reiser4/plugin/object.c
--- linux-4.4/fs/reiser4/plugin/object.c	2016-03-30 11:00:02.719055099 +0200
+++ linux-4.5/fs/reiser4/plugin/object.c	2016-03-29 15:06:48.291082076 +0200
@@ -156,7 +156,7 @@
 /* VFS methods for symlink files */
 static struct inode_operations symlink_file_i_ops = {
 	.readlink = generic_readlink,
-	.follow_link = reiser4_follow_link_common,
+	.get_link = reiser4_get_link_common,
 	.permission = reiser4_permission_common,
 	.setattr = reiser4_setattr_common,
 	.getattr = reiser4_getattr_common
diff -u -r linux-4.4/fs/reiser4/plugin/object.h linux-4.5/fs/reiser4/plugin/object.h
--- linux-4.4/fs/reiser4/plugin/object.h	2016-03-30 11:00:02.719055099 +0200
+++ linux-4.5/fs/reiser4/plugin/object.h	2016-03-29 15:08:27.208950159 +0200
@@ -24,7 +24,8 @@
 		 umode_t mode, dev_t rdev);
 int reiser4_rename_common(struct inode *old_dir, struct dentry *old_name,
 			  struct inode *new_dir, struct dentry *new_name);
-const char *reiser4_follow_link_common(struct dentry *, void **cookie);
+const char *reiser4_get_link_common(struct dentry *, struct inode *inode,
+				    struct delayed_call *done);
 int reiser4_permission_common(struct inode *, int mask);
 int reiser4_setattr_common(struct dentry *, struct iattr *);
 int reiser4_getattr_common(struct vfsmount *mnt, struct dentry *,

--------------000302030209040000010204--
