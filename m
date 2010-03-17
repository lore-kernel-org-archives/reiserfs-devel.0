From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 1/2] reiserfs: fix oops while creating privroot with selinux
 enabled
Date: Wed, 17 Mar 2010 15:59:10 -0400
Message-ID: <4BA1348E.9070201@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

 Commit 57fe60df contains a bug that will cause it to oops when
 mounting a file system that didn't previously contain extended
 attributes on a system using security.* xattrs.

 The issue is that while creating the privroot during mount
 reiserfs_security_init calls reiserfs_xattr_jcreate_nblocks
 which dereferences the xattr root. The xattr root doesn't exist, so
 we get an oops.

 This fixes http://bugzilla.kernel.org/show_bug.cgi?id=15309

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/xattr_security.c   |    2 +-
 include/linux/reiserfs_xattr.h |    5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

--- a/fs/reiserfs/xattr_security.c
+++ b/fs/reiserfs/xattr_security.c
@@ -76,7 +76,7 @@ int reiserfs_security_init(struct inode
 		return error;
 	}
 
-	if (sec->length) {
+	if (sec->length && reiserfs_xattrs_initialized(inode->i_sb)) {
 		blocks = reiserfs_xattr_jcreate_nblocks(inode) +
 			 reiserfs_xattr_nblocks(inode, sec->length);
 		/* We don't want to count the directories twice if we have
--- a/include/linux/reiserfs_xattr.h
+++ b/include/linux/reiserfs_xattr.h
@@ -70,6 +70,11 @@ int reiserfs_security_write(struct reise
 void reiserfs_security_free(struct reiserfs_security_handle *sec);
 #endif
 
+static inline int reiserfs_xattrs_initialized(struct super_block *sb)
+{
+	return REISERFS_SB(sb)->priv_root != NULL;
+}
+
 #define xattr_size(size) ((size) + sizeof(struct reiserfs_xattr_header))
 static inline loff_t reiserfs_xattr_nblocks(struct inode *inode, loff_t size)
 {
-- 
Jeff Mahoney
SUSE Labs
