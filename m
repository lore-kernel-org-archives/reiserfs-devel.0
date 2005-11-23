From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 16:09:32 +0300
Message-ID: <43846A0C.6010808@namesys.com>
References: <200511171447.41362.mail@earthworm.de> <200511231253.37328.mail@earthworm.de> <20051123121751.GC26252@favonius> <200511231321.18455.mail@earthworm.de> <20051123122809.GA31528@favonius>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010707010907030103020905"
Return-path: <reiserfs-list-return-27110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051123122809.GA31528@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
To: sander@humilis.net
Cc: "Hesse, Christian" <mail@earthworm.de>, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>

--------------010707010907030103020905
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

Sander wrote:
> Hesse, Christian wrote (ao):
>>On Wednesday 23 November 2005 13:17, Sander wrote:
>>>Hesse, Christian wrote (ao):
>>>>For Sander's list:
>>>>
>>>>http://www.earthworm.de/tmp/reiser4-fsync.c
>>>>strace -T -e sync,fsync reiser4-fsync
>>>I've added this one, but it segfaults at my system:
>>>
>>>$ gcc -o reiser4-fsync reiser4-fsync.c
>>>$ strace -T -e sync,fsync ./reiser4-fsync
>>>Segmentation fault
>>>
>>>Any idea?
>>I think that is caused by a patch in -mm. You should read
>>"2.6.15-rc1-mm2 breaks strace" on lkml.
> 
> I use -mm for Reiser4 obviously :-)
> 
> Owh well, it is still useful for other kernels of course.
> 

Please unapply the attached patch and check whether it makes any effect.

cd fs/reiser4
cat patch | patch -p1 -R

--------------010707010907030103020905
Content-Type: text/plain;
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

diff --git a/plugin/file_ops_readdir.c b/plugin/file_ops_readdir.c
index 9926e7c..b85ae7f 100644
--- a/plugin/file_ops_readdir.c
+++ b/plugin/file_ops_readdir.c
@@ -632,6 +632,14 @@ int readdir_common(struct file *f /* dir
 	tap_done(&tap);
 	detach_fsdata(f);
 
+	/* try to update directory's atime */
+	if (reiser4_grab_space(inode_file_plugin(inode)->estimate.update(inode),
+			       BA_CAN_COMMIT) != 0)
+		warning("", "failed to update atime on readdir: %llu",
+			get_inode_oid(inode));
+	else
+		update_atime(inode);
+
 	context_set_commit_async(ctx);
 	reiser4_exit_context(ctx);
 
diff --git a/super_ops.c b/super_ops.c
index fe18006..f4b750b 100644
--- a/super_ops.c
+++ b/super_ops.c
@@ -156,6 +156,28 @@ static void reiser4_destroy_inode(struct
 }
 
 /**
+ * reiser4_dirty_inode - dirty_inode of super operations
+ * @inode: inode being dirtied
+ *
+ * Updates stat data.
+ */
+static void reiser4_dirty_inode(struct inode *inode)
+{
+	int result;
+
+	if (!is_in_reiser4_context())
+		return;
+	assert("", !IS_RDONLY(inode));
+	assert("", (inode_file_plugin(inode)->estimate.update(inode) <=
+		    get_current_context()->grabbed_blocks));
+
+	result = reiser4_update_sd(inode);
+	if (result)
+		warning("", "failed to dirty inode for %llu: %d",
+			get_inode_oid(inode), result);
+}
+
+/**
  * reiser4_delete_inode - delete_inode of super operations
  * @inode: inode to delete
  *
@@ -421,6 +443,7 @@ static int reiser4_show_options(struct s
 struct super_operations reiser4_super_operations = {
 	.alloc_inode = reiser4_alloc_inode,
 	.destroy_inode = reiser4_destroy_inode,
+	.dirty_inode = reiser4_dirty_inode,
 	.delete_inode = reiser4_delete_inode,
 	.put_super = reiser4_put_super,
 	.write_super = reiser4_write_super,
diff --git a/vfs_ops.c b/vfs_ops.c
index 7adce84..64cc23d 100644
--- a/vfs_ops.c
+++ b/vfs_ops.c
@@ -53,11 +53,6 @@
 #include <linux/rcupdate.h>
 
 
-extern struct dentry_operations reiser4_dentry_operation;
-
-
-
-
 /* update inode stat-data by calling plugin */
 int reiser4_update_sd(struct inode *object)
 {
@@ -254,8 +249,6 @@ void reiser4_handle_error(void)
 	}
 }
 
-
-
 struct dentry_operations reiser4_dentry_operations = {
 	.d_revalidate = NULL,
 	.d_hash = NULL,
diff --git a/vfs_ops.h b/vfs_ops.h
index 9ba968c..f1556a4 100644
--- a/vfs_ops.h
+++ b/vfs_ops.h
@@ -27,7 +27,7 @@ int reiser4_readpages(struct file *, str
 int reiser4_invalidatepage(struct page *, unsigned long offset);
 int reiser4_releasepage(struct page *, int gfp);
 
-extern int reiser4_update_sd(struct inode *object);
+extern int reiser4_update_sd(struct inode *);
 extern int reiser4_add_nlink(struct inode *, struct inode *, int);
 extern int reiser4_del_nlink(struct inode *, struct inode *, int);
 
======== end ========


--------------010707010907030103020905--
