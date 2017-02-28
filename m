From: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: [RFC PATCH] uapi: move struct reiserfs_security_handle out from linux/reiserfs_xattr.h
Date: Tue, 28 Feb 2017 03:53:28 +0300
Message-ID: <20170228005328.GA27363@altlinux.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

As there seems to be no way struct reiserfs_security_handle could be
passed between the kernel and userspace, move its definition from the
UAPI header to a private header fs/reiserfs/xattr.h which is the only
file in the tree that includes linux/reiserfs_xattr.h.

This also fixes the following linux/reiserfs_xattr.h userspace
compilation error:

/usr/include/linux/reiserfs_xattr.h:21:2: error: unknown type name 'size_t'
  size_t length;

Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---
Perhaps the whole file could be moved out from the UAPI.
I'm not sure about that, though.

 fs/reiserfs/xattr.h                 | 6 ++++++
 include/uapi/linux/reiserfs_xattr.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/reiserfs/xattr.h b/fs/reiserfs/xattr.h
index 613ff5a..1ae77ed 100644
--- a/fs/reiserfs/xattr.h
+++ b/fs/reiserfs/xattr.h
@@ -4,6 +4,12 @@
 #include <linux/rwsem.h>
 #include <linux/xattr.h>
 
+struct reiserfs_security_handle {
+	const char *name;
+	void *value;
+	size_t length;
+};
+
 struct inode;
 struct dentry;
 struct iattr;
diff --git a/include/uapi/linux/reiserfs_xattr.h b/include/uapi/linux/reiserfs_xattr.h
index 38fdd64..e07f4c7 100644
--- a/include/uapi/linux/reiserfs_xattr.h
+++ b/include/uapi/linux/reiserfs_xattr.h
@@ -15,10 +15,4 @@ struct reiserfs_xattr_header {
 	__le32 h_hash;		/* hash of the value */
 };
 
-struct reiserfs_security_handle {
-	const char *name;
-	void *value;
-	size_t length;
-};
-
 #endif  /*  _LINUX_REISERFS_XATTR_H  */
-- 
ldv
