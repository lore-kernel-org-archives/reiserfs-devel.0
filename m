From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.2 52/74] reiserfs: Don't clear SGID when inheriting ACLs
Date: Mon, 09 Oct 2017 13:30:34 +0100
Message-ID: <lsq.1507552234.259257642@decadent.org.uk>
References: <lsq.1507552233.547064726@decadent.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <lsq.1507552233.547064726@decadent.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org

3.2.94-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Jan Kara <jack@suse.cz>

commit 6883cd7f68245e43e91e5ee583b7550abf14523f upstream.

When new directory 'DIR1' is created in a directory 'DIR0' with SGID bit
set, DIR1 is expected to have SGID bit set (and owning group equal to
the owning group of 'DIR0'). However when 'DIR0' also has some default
ACLs that 'DIR1' inherits, setting these ACLs will result in SGID bit on
'DIR1' to get cleared if user is not member of the owning group.

Fix the problem by moving posix_acl_update_mode() out of
__reiserfs_set_acl() into reiserfs_set_acl(). That way the function will
not be called when inheriting ACLs which is what we want as it prevents
SGID bit clearing and the mode has been properly set by
posix_acl_create() anyway.

Fixes: 073931017b49d9458aa351605b43a7e34598caef
CC: reiserfs-devel@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
[bwh: Backported to 3.2: the __reiserfs_set_acl() function didn't exist,
 so added it]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 fs/reiserfs/xattr_acl.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

--- a/fs/reiserfs/xattr_acl.c
+++ b/fs/reiserfs/xattr_acl.c
@@ -250,15 +250,9 @@ struct posix_acl *reiserfs_get_acl(struc
 	return acl;
 }
 
-/*
- * Inode operation set_posix_acl().
- *
- * inode->i_mutex: down
- * BKL held [before 2.5.x]
- */
 static int
-reiserfs_set_acl(struct reiserfs_transaction_handle *th, struct inode *inode,
-		 int type, struct posix_acl *acl)
+__reiserfs_set_acl(struct reiserfs_transaction_handle *th, struct inode *inode,
+		   int type, struct posix_acl *acl)
 {
 	char *name;
 	void *value = NULL;
@@ -271,11 +265,6 @@ reiserfs_set_acl(struct reiserfs_transac
 	switch (type) {
 	case ACL_TYPE_ACCESS:
 		name = POSIX_ACL_XATTR_ACCESS;
-		if (acl) {
-			error = posix_acl_update_mode(inode, &inode->i_mode, &acl);
-			if (error)
-				return error;
-		}
 		break;
 	case ACL_TYPE_DEFAULT:
 		name = POSIX_ACL_XATTR_DEFAULT;
@@ -316,6 +305,26 @@ reiserfs_set_acl(struct reiserfs_transac
 	return error;
 }
 
+/*
+ * Inode operation set_posix_acl().
+ *
+ * inode->i_mutex: down
+ */
+static int
+reiserfs_set_acl(struct reiserfs_transaction_handle *th, struct inode *inode,
+		 int type, struct posix_acl *acl)
+{
+	int error;
+
+	if (type == ACL_TYPE_ACCESS && acl) {
+		error = posix_acl_update_mode(inode, &inode->i_mode,
+					      &acl);
+		if (error)
+			return error;
+	}
+	return __reiserfs_set_acl(th, inode, type, acl);
+}
+
 /* dir->i_mutex: locked,
  * inode is new and not released into the wild yet */
 int
@@ -350,8 +359,8 @@ reiserfs_inherit_default_acl(struct reis
 	if (acl) {
 		/* Copy the default ACL to the default ACL of a new directory */
 		if (S_ISDIR(inode->i_mode)) {
-			err = reiserfs_set_acl(th, inode, ACL_TYPE_DEFAULT,
-					       acl);
+			err = __reiserfs_set_acl(th, inode, ACL_TYPE_DEFAULT,
+						 acl);
 			if (err)
 				goto cleanup;
 		}
@@ -364,7 +373,7 @@ reiserfs_inherit_default_acl(struct reis
 
 		/* If we need an ACL.. */
 		if (err > 0)
-			err = reiserfs_set_acl(th, inode, ACL_TYPE_ACCESS, acl);
+			err = __reiserfs_set_acl(th, inode, ACL_TYPE_ACCESS, acl);
 	      cleanup:
 		posix_acl_release(acl);
 	} else {

