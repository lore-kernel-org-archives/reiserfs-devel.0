From: Stephen Smalley <sds@epoch.ncsc.mil>
Subject: Re: mount reiserfs (novice)
Date: Thu, 17 Jun 2004 08:36:29 -0400
Sender: fedora-selinux-list-bounces@redhat.com
Message-ID: <1087475789.25033.31.camel@moss-spartans.epoch.ncsc.mil>
References: <20040617120957.2dea34f4@maxim-l.office.modum.by>
	<200406172129.00895.russell@coker.com.au>
Reply-To: "Fedora SELinux support list for users & developers." <fedora-selinux-list@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <fedora-selinux-list-bounces@redhat.com>
In-Reply-To: <200406172129.00895.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://www.redhat.com/mailman/listinfo/fedora-selinux-list>, 
	<mailto:fedora-selinux-list-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/fedora-selinux-list>
List-Post: <mailto:fedora-selinux-list@redhat.com>
List-Help: <mailto:fedora-selinux-list-request@redhat.com?subject=help>
List-Subscribe: <http://www.redhat.com/mailman/listinfo/fedora-selinux-list>, 
	<mailto:fedora-selinux-list-request@redhat.com?subject=subscribe>
Errors-To: fedora-selinux-list-bounces@redhat.com
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>, "Fedora SELinux support list for users & developers." <fedora-selinux-list@redhat.com>
Cc: ReiserFS <reiserfs-list@namesys.com>, James Morris <jmorris@redhat.com>

On Thu, 2004-06-17 at 07:29, Russell Coker wrote:
> I've just reproduced this bug on the kernel.org 2.6.7 kernel.  It seems that 
> there is a hidden directory on a ReiserFS file system used for XATTRs which 
> is unlabeled.  Allowing mount to search this directory does no good as many 
> (most?) operations also need it (eg setfiles).
> 
> I've CC'd the ReiserFS mailing list.  I would be happy to work with ReiserFS 
> developers in debugging this and testing the fix.

You might want to also read this thread:
http://marc.theaimsgroup.com/?l=linux-kernel&m=108619875326417&w=2

Dmitry found a workaround for his immediate problem just by using the
following patch to prevent deadlock when the xattr directories and files
are being created:
http://marc.theaimsgroup.com/?l=linux-kernel&m=108635056719373&w=2

However, I suspect that we need a new inode security hook so that
filesystem implementations like reiserfs can tell security modules like
SELinux that certain inodes are private to the filesystem and should not
be labeled or access controlled by the security module.
Something like the following patch, but we would have to work out the
details of how SELinux would implement this hook function.

diff -ru -X dontdiff linux-2.6.7-rc2.old/fs/reiserfs/namei.c linux-2.6.7-rc2/fs/reiserfs/namei.c
--- linux-2.6.7-rc2.old/fs/reiserfs/namei.c	2004-06-01 09:09:30.000000000 -0400
+++ linux-2.6.7-rc2/fs/reiserfs/namei.c	2004-06-03 16:00:52.712349408 -0400
@@ -14,6 +14,7 @@
 #include <linux/config.h>
 #include <linux/time.h>
 #include <linux/bitops.h>
+#include <linux/security.h>
 #include <linux/reiserfs_fs.h>
 #include <linux/reiserfs_acl.h>
 #include <linux/reiserfs_xattr.h>
@@ -351,8 +352,10 @@
         }
 
 	/* Propogate the priv_object flag so we know we're in the priv tree */
-	if (is_reiserfs_priv_object (dir))
+	if (is_reiserfs_priv_object (dir)) {
 	    REISERFS_I(inode)->i_flags |= i_priv_object;
+	    security_inode_mark_private(inode);
+	}
     }
     reiserfs_write_unlock(dir->i_sb);
     if ( retval == IO_ERROR ) {
diff -ru -X dontdiff linux-2.6.7-rc2.old/fs/reiserfs/xattr_acl.c linux-2.6.7-rc2/fs/reiserfs/xattr_acl.c
--- linux-2.6.7-rc2.old/fs/reiserfs/xattr_acl.c	2004-06-01 09:09:30.000000000 -0400
+++ linux-2.6.7-rc2/fs/reiserfs/xattr_acl.c	2004-06-03 16:00:17.954633384 -0400
@@ -5,6 +5,7 @@
 #include <linux/pagemap.h>
 #include <linux/xattr.h>
 #include <linux/xattr_acl.h>
+#include <linux/security.h>
 #include <linux/reiserfs_xattr.h>
 #include <linux/reiserfs_acl.h>
 #include <asm/uaccess.h>
@@ -332,6 +333,7 @@
      * it introduces locking cycles */
     if (is_reiserfs_priv_object (dir)) {
         REISERFS_I(inode)->i_flags |= i_priv_object;
+	 security_inode_mark_private(inode);
         goto apply_umask;
     }
 
diff -ru -X dontdiff linux-2.6.7-rc2.old/fs/reiserfs/xattr.c linux-2.6.7-rc2/fs/reiserfs/xattr.c
--- linux-2.6.7-rc2.old/fs/reiserfs/xattr.c	2004-06-01 09:09:30.000000000 -0400
+++ linux-2.6.7-rc2/fs/reiserfs/xattr.c	2004-06-03 15:59:32.060610336 -0400
@@ -37,6 +37,7 @@
 #include <linux/file.h>
 #include <linux/pagemap.h>
 #include <linux/xattr.h>
+#include <linux/security.h>
 #include <linux/reiserfs_xattr.h>
 #include <linux/reiserfs_acl.h>
 #include <linux/mbcache.h>
@@ -183,6 +184,7 @@
         }
         /* Newly created object.. Need to mark it private */
         REISERFS_I(xadir->d_inode)->i_flags |= i_priv_object;
+	 security_inode_mark_private(xadir->d_inode);
     }
 
     dput (xaroot);
@@ -232,6 +234,7 @@
         }
         /* Newly created object.. Need to mark it private */
         REISERFS_I(xafile->d_inode)->i_flags |= i_priv_object;
+	 security_inode_mark_private(xafile->d_inode);
     }
 
 out:
@@ -1304,6 +1307,7 @@
       if (!err && dentry) {
           s->s_root->d_op = &xattr_lookup_poison_ops;
           REISERFS_I(dentry->d_inode)->i_flags |= i_priv_object;
+	   security_inode_mark_private(dentry->d_inode);
           REISERFS_SB(s)->priv_root = dentry;
       } else if (!(mount_flags & MS_RDONLY)) { /* xattrs are unavailable */
           /* If we're read-only it just means that the dir hasn't been
diff -ru -X dontdiff linux-2.6.7-rc2.old/include/linux/security.h linux-2.6.7-rc2/include/linux/security.h
--- linux-2.6.7-rc2.old/include/linux/security.h	2004-05-09 22:32:54.000000000 -0400
+++ linux-2.6.7-rc2/include/linux/security.h	2004-06-03 16:14:56.831023864 -0400
@@ -412,6 +412,11 @@
  *	associated with @dentry into @buffer.  @buffer may be NULL to 
  *	request the size of the buffer required.  
  *	Returns number of bytes used/required on success.
+ * @inode_mark_private:
+ *	Set up the security state of @inode to reflect the fact that the inode
+ *	is private, i.e. used internally by the filesystem for purposes such
+ *     as xattr storage and not accessible by userspace.  This property should
+ *     then be inherited by all nodes under this node.
  *
  * Security hooks for file operations
  *
@@ -1108,6 +1113,7 @@
   	int (*inode_getsecurity)(struct dentry *dentry, const char *name, void *buffer, size_t size);
   	int (*inode_setsecurity)(struct dentry *dentry, const char *name, const void *value, size_t size, int flags);
   	int (*inode_listsecurity)(struct dentry *dentry, char *buffer);
+  	void (*inode_mark_private)(struct inode *inode);
 
 	int (*file_permission) (struct file * file, int mask);
 	int (*file_alloc_security) (struct file * file);
@@ -1587,6 +1593,11 @@
 	return security_ops->inode_listsecurity(dentry, buffer);
 }
 
+static inline void security_inode_mark_private(struct inode *inode)
+{
+	security_ops->inode_mark_private(inode);
+}
+
 static inline int security_file_permission (struct file *file, int mask)
 {
 	return security_ops->file_permission (file, mask);
@@ -2226,6 +2237,11 @@
 	return 0;
 }
 
+static inline void security_inode_mark_private(struct inode *inode)
+{
+	return;
+}
+
 static inline int security_file_permission (struct file *file, int mask)
 {
 	return 0;
diff -ru -X dontdiff linux-2.6.7-rc2.old/security/dummy.c linux-2.6.7-rc2/security/dummy.c
--- linux-2.6.7-rc2.old/security/dummy.c	2004-06-01 09:09:31.000000000 -0400
+++ linux-2.6.7-rc2/security/dummy.c	2004-06-03 16:16:11.174721904 -0400
@@ -462,6 +462,11 @@
 	return 0;
 }
 
+static void dummy_inode_mark_private(struct inode *inode)
+{
+	return;
+}
+
 static int dummy_file_permission (struct file *file, int mask)
 {
 	return 0;
@@ -949,6 +954,7 @@
 	set_to_dummy_if_null(ops, inode_getsecurity);
 	set_to_dummy_if_null(ops, inode_setsecurity);
 	set_to_dummy_if_null(ops, inode_listsecurity);
+	set_to_dummy_if_null(ops, inode_mark_private);
 	set_to_dummy_if_null(ops, file_permission);
 	set_to_dummy_if_null(ops, file_alloc_security);
 	set_to_dummy_if_null(ops, file_free_security);


-- 
Stephen Smalley <sds@epoch.ncsc.mil>
National Security Agency
