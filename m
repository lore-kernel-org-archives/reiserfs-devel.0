From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/2] reiser4: handling error returned by d_obtain_alias fixup
Date: Sat, 27 Dec 2008 02:33:20 +0300
Message-ID: <495569C0.3030608@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050908080005080107040802"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hch@infradead.org, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050908080005080107040802
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------050908080005080107040802
Content-Type: text/x-patch;
 name="reiser4-d_obtain_alias-incorrect-handling-error-fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="reiser4-d_obtain_alias-incorrect-handling-error-fixup.patch"

. Fix up incorrect handling errors reterned by d_obtain_alias.
. Make quilt, checkpatch happy:
  remove comment with "joke not for everyone".

Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
---
 linux-2.6.28-rc2-mm1/fs/reiser4/plugin/dir_plugin_common.c  |   10 +---------
 linux-2.6.28-rc2-mm1/fs/reiser4/plugin/file_plugin_common.c |    5 +----
 2 files changed, 2 insertions(+), 13 deletions(-)

--- linux-2.6.28-rc2-mm1/fs/reiser4/plugin/dir_plugin_common.c.orig
+++ linux-2.6.28-rc2-mm1/fs/reiser4/plugin/dir_plugin_common.c
@@ -56,10 +56,7 @@ struct dentry *get_parent_common(struct 
 		check_light_weight(parent, child);
 		reiser4_iget_complete(parent);
 		dentry = d_obtain_alias(parent);
-		if (dentry == NULL) {
-			iput(parent);
-			dentry = ERR_PTR(RETERR(-ENOMEM));
-		} else
+		if (!IS_ERR(dentry))
 			dentry->d_op = &get_super_private(s)->ops.dentry;
 	} else if (PTR_ERR(parent) == -ENOENT)
 		dentry = ERR_PTR(RETERR(-ESTALE));
@@ -353,11 +350,6 @@ int reiser4_dir_done_common(struct inode
 	result = reiser4_rem_entry_common(object, &goodby_dots, &entry);
 	reiser4_free_dentry_fsdata(&goodby_dots);
 	if (unlikely(result != 0 && result != -ENOMEM && result != -ENOENT))
-		/* only worth a warning
-
-		   "values of B will give rise to dom!\n"
-		   -- v6src/s2/mv.c:89
-		 */
 		warning("nikita-2252", "Cannot remove dot of %lli: %i",
 			(unsigned long long)get_inode_oid(object), result);
 	return 0;
--- linux-2.6.28-rc2-mm1/fs/reiser4/plugin/file_plugin_common.c.orig
+++ linux-2.6.28-rc2-mm1/fs/reiser4/plugin/file_plugin_common.c
@@ -476,10 +476,7 @@ struct dentry *wire_get_common(struct su
 	if (!IS_ERR(inode)) {
 		reiser4_iget_complete(inode);
 		dentry = d_obtain_alias(inode);
-		if (dentry == NULL) {
-			iput(inode);
-			dentry = ERR_PTR(-ENOMEM);
-		} else
+		if (!IS_ERR(dentry))
 			dentry->d_op = &get_super_private(sb)->ops.dentry;
 	} else if (PTR_ERR(inode) == -ENOENT)
 		/*

--------------050908080005080107040802--
