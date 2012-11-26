From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: fix double-lock while chowning setuid file w/ xattrs
Date: Mon, 26 Nov 2012 09:55:33 -0500
Message-ID: <50B382E5.1010300@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>
Cc: stable@kernel.org, Jan Kara <jack@suse.cz>

reiserfs_chown_xattrs() takes the iattr struct passed into ->setattr
and uses it to iterate over all the attrs associated with a file to change
ownership of xattrs (and transfer quota associated with the xattr files).

When a setuid file is chowned and the setuid bit is cleared, reiserfs_setattr
gets called with both ATTR_MODE and ATTR_UID set. Since ATTR_MODE causes
the ACL chmod code to be invoked, we end up calling reiserfs_acl_chmod on
the xattr file. There's a missing IS_PRIVATE check there, so instead of
bailing out immediately, we end up taking the inode->i_mutex a second time
in open_xa_dir.

The other xattr paths are protected against similar situations by bailing
out on IS_PRIVATE. This patch adds the missing check to reiserfs_acl_chmod.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
Cc: stable@kernel.org
---
 fs/reiserfs/xattr_acl.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/fs/reiserfs/xattr_acl.c
+++ b/fs/reiserfs/xattr_acl.c
@@ -448,6 +448,9 @@ int reiserfs_acl_chmod(struct inode *ino
 	struct posix_acl *acl, *clone;
 	int error;
 
+	if (IS_PRIVATE(inode))
+		return 0;
+
 	if (S_ISLNK(inode->i_mode))
 		return -EOPNOTSUPP;
 

--
Jeff Mahoney
SUSE Labs
