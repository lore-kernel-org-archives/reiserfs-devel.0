From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] reiserfs: don't leak memory referenced by struct
 reiserfs_security_handle fields
Date: Mon, 24 Aug 2015 06:24:01 -0600
Message-ID: <55DB2901020000780009CB13@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>

Ever since its introduction in 2.6.30 reiserfs_security_free() was
unused. Make all four users of reiserfs_security_init() use it. For
this to be safe (avoiding attempts to free an uninitialized ->value
member), remove a (now?) pointless shortcut from the latter function:
security_old_inode_init_security() properly returns -EOPNOTSUPP when
IS_PRIVATE(inode) (with the private flag getting propagated from dir),
and hence the respective exit path can be used uniformly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Cc: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/namei.c          |    4 ++++
 fs/reiserfs/xattr_security.c |    6 ------
 2 files changed, 4 insertions(+), 6 deletions(-)

--- 4.2-rc8/fs/reiserfs/namei.c
+++ 4.2-rc8-reiserfs-free-security/fs/reiserfs/namei.c
@@ -688,6 +688,7 @@ static int reiserfs_create(struct inode 
 
 out_failed:
 	reiserfs_write_unlock(dir->i_sb);
+	reiserfs_security_free(&security);
 	return retval;
 }
 
@@ -769,6 +770,7 @@ static int reiserfs_mknod(struct inode *
 
 out_failed:
 	reiserfs_write_unlock(dir->i_sb);
+	reiserfs_security_free(&security);
 	return retval;
 }
 
@@ -862,6 +864,7 @@ static int reiserfs_mkdir(struct inode *
 	retval = journal_end(&th);
 out_failed:
 	reiserfs_write_unlock(dir->i_sb);
+	reiserfs_security_free(&security);
 	return retval;
 }
 
@@ -1167,6 +1170,7 @@ static int reiserfs_symlink(struct inode
 	retval = journal_end(&th);
 out_failed:
 	reiserfs_write_unlock(parent_dir->i_sb);
+	reiserfs_security_free(&security);
 	return retval;
 }
 
--- 4.2-rc8/fs/reiserfs/xattr_security.c
+++ 4.2-rc8-reiserfs-free-security/fs/reiserfs/xattr_security.c
@@ -60,12 +60,6 @@ int reiserfs_security_init(struct inode 
 	int blocks = 0;
 	int error;
 
-	sec->name = NULL;
-
-	/* Don't add selinux attributes on xattrs - they'll never get used */
-	if (IS_PRIVATE(dir))
-		return 0;
-
 	error = security_old_inode_init_security(inode, dir, qstr, &sec->name,
 						 &sec->value, &sec->length);
 	if (error) {



