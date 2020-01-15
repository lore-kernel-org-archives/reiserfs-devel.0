From: jeffm@suse.com
Subject: [PATCH] reiserfs: fix handling of -EOPNOTSUPP in reiserfs_for_each_xattr
Date: Wed, 15 Jan 2020 13:00:59 -0500
Message-ID: <20200115180059.6935-1-jeffm@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, jack@suse.cz
Cc: brunni@netestate.de, Jeff Mahoney <jeffm@suse.com>

From: Jeff Mahoney <jeffm@suse.com>

Commit 60e4cf67a58 (reiserfs: fix extended attributes on the root
directory) introduced a regression open_xa_root started returning
-EOPNOTSUPP but it was not handled properly in reiserfs_for_each_xattr.

When the reiserfs module is built without CONFIG_REISERFS_FS_XATTR,
deleting an inode would result in a warning and chowning an inode
would also result in a warning and then fail to complete.

With CONFIG_REISERFS_FS_XATTR enabled, the xattr root would always be
present for read-write operations.

This commit handles -EOPNOSUPP in the same way -ENODATA is handled.

Fixes: 60e4cf67a58 (reiserfs: fix extended attributes on the root directory)
Reported-by: Michael Brunnbauer <brunni@netestate.de>
Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/xattr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 06497965f0a0..d843c4789ced 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -319,8 +319,12 @@ static int reiserfs_for_each_xattr(struct inode *inode,
 out_dir:
 	dput(dir);
 out:
-	/* -ENODATA isn't an error */
-	if (err == -ENODATA)
+	/*
+	 * -ENODATA: this object doesn't have any xattrs
+	 * -EOPNOTSUPP: this file system doesn't have xattrs enabled on disk.
+	 * Neither are errors
+	 */
+	if (err == -ENODATA || err == -EOPNOTSUPP)
 		err = 0;
 	return err;
 }
-- 
2.16.4

