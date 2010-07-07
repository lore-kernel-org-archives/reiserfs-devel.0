From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 4/6] reiser4: remove inode_setattr
Date: Wed, 07 Jul 2010 02:21:24 +0200
Message-ID: <4C33C884.6050602@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060905040904030901070808"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060905040904030901070808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------060905040904030901070808
Content-Type: text/plain;
 name="reiser4-remove-inode_setattr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-remove-inode_setattr.patch"

Adjust reiser4 to vfs changes:
inode_setattr() has been removed.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/inode_ops.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- mmotm.orig/fs/reiser4/plugin/inode_ops.c
+++ mmotm/fs/reiser4/plugin/inode_ops.c
@@ -446,7 +446,9 @@ int reiser4_setattr_common(struct dentry
 	assert("nikita-3119", !(attr->ia_valid & ATTR_SIZE));
 
 	/*
-	 * grab disk space and call standard inode_setattr().
+	 * grab disk space and call standard
+	 * setattr_copy();
+	 * mark_inode_dirty().
 	 */
 	result = setattr_reserve(reiser4_tree_by_inode(inode));
 	if (!result) {
@@ -460,9 +462,9 @@ int reiser4_setattr_common(struct dentry
 				return result;
 			}
 		}
-		result = inode_setattr(inode, attr);
-		if (!result)
-			reiser4_update_sd(inode);
+		setattr_copy(inode, attr);
+		mark_inode_dirty(inode);
+		result = reiser4_update_sd(inode);
 	}
 
 	context_set_commit_async(ctx);

--------------060905040904030901070808--
