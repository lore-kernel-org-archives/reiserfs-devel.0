From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 7/10] Reiser4: Replace inode.u.generic_ip with inode.i_private
Date: Sat,  2 Dec 2006 14:16:28 +0100
Message-ID: <11650653921199-git-send-email-laurent.riffard@free.fr>
References: <1165065391908-git-send-email-laurent.riffard@free.fr> <1165065391122-git-send-email-laurent.riffard@free.fr> <1165065391534-git-send-email-laurent.riffard@free.fr> <11650653912299-git-send-email-laurent.riffard@free.fr> <11650653921903-git-send-email-laurent.riffard@free.fr> <11650653921405-git-send-email-laurent.riffard@free.fr> <11650653923297-git-send-email-laurent.riffard@free.fr>
Return-path: <reiserfs-list-return-30276-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <11650653923297-git-send-email-laurent.riffard@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

inode.u.generic_ip was replaced with inode.i_private to reduce the size
of the VFS inode structure. This patch updates reiser4 code to reflect
this change.
---
 fs/reiser4/inode.h                   |    2 +-
 fs/reiser4/plugin/file/symlink.c     |   14 +++++++-------
 fs/reiser4/plugin/inode_ops.c        |    6 +++---
 fs/reiser4/plugin/item/static_stat.c |   18 +++++++++---------
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/reiser4/inode.h b/fs/reiser4/inode.h
index ed59b0f..88b155d 100644
--- a/fs/reiser4/inode.h
+++ b/fs/reiser4/inode.h
@@ -41,7 +41,7 @@ typedef enum {
 	REISER4_IMMUTABLE = 2,
 	/* inode was read from storage */
 	REISER4_LOADED = 3,
-	/* this bit is set for symlinks. inode->u.generic_ip points to target
+	/* this bit is set for symlinks. inode->i_private points to target
 	   name of symlink. */
 	REISER4_GENERIC_PTR_USED = 4,
 	/* set if size of stat-data item for this inode is known. If this is
diff --git a/fs/reiser4/plugin/file/symlink.c b/fs/reiser4/plugin/file/symlink.c
index 343e72e..4f3f05a 100644
--- a/fs/reiser4/plugin/file/symlink.c
+++ b/fs/reiser4/plugin/file/symlink.c
@@ -42,8 +42,8 @@ int create_symlink(struct inode *symlink,
 	 */
 	reiser4_inode_data(symlink)->extmask |= (1 << SYMLINK_STAT);
 
-	assert("vs-838", symlink->u.generic_ip == NULL);
-	symlink->u.generic_ip = (void *)data->name;
+	assert("vs-838", symlink->i_private == NULL);
+	symlink->i_private = (void *)data->name;
 
 	assert("vs-843", symlink->i_size == 0);
 	INODE_SET_FIELD(symlink, i_size, strlen(data->name));
@@ -51,14 +51,14 @@ int create_symlink(struct inode *symlink,
 	/* insert stat data appended with data->name */
 	result = inode_file_plugin(symlink)->write_sd_by_inode(symlink);
 	if (result) {
-		/* FIXME-VS: Make sure that symlink->u.generic_ip is not attached
+		/* FIXME-VS: Make sure that symlink->i_private is not attached
 		   to kmalloced data */
 		INODE_SET_FIELD(symlink, i_size, 0);
 	} else {
-		assert("vs-849", symlink->u.generic_ip
+		assert("vs-849", symlink->i_private
 		       && inode_get_flag(symlink, REISER4_GENERIC_PTR_USED));
 		assert("vs-850",
-		       !memcmp((char *)symlink->u.generic_ip, data->name,
+		       !memcmp((char *)symlink->i_private, data->name,
 			       (size_t) symlink->i_size + 1));
 	}
 	return result;
@@ -76,8 +76,8 @@ void destroy_inode_symlink(struct inode *inode)
 	assert("edward-801", inode_get_flag(inode, REISER4_GENERIC_PTR_USED));
 	assert("vs-839", S_ISLNK(inode->i_mode));
 
-	kfree(inode->u.generic_ip);
-	inode->u.generic_ip = NULL;
+	kfree(inode->i_private);
+	inode->i_private = NULL;
 	inode_clr_flag(inode, REISER4_GENERIC_PTR_USED);
 }
 
diff --git a/fs/reiser4/plugin/inode_ops.c b/fs/reiser4/plugin/inode_ops.c
index 73e6cbd..7c215af 100644
--- a/fs/reiser4/plugin/inode_ops.c
+++ b/fs/reiser4/plugin/inode_ops.c
@@ -389,16 +389,16 @@ int mknod_common(struct inode *parent, struct dentry *dentry,
  *
  * This is common implementation of vfs's followlink method of struct
  * inode_operations.
- * Assumes that inode's generic_ip points to the content of symbolic link.
+ * Assumes that inode's i_private points to the content of symbolic link.
  */
 void *follow_link_common(struct dentry *dentry, struct nameidata *nd)
 {
 	assert("vs-851", S_ISLNK(dentry->d_inode->i_mode));
 
-	if (!dentry->d_inode->u.generic_ip
+	if (!dentry->d_inode->i_private
 	    || !inode_get_flag(dentry->d_inode, REISER4_GENERIC_PTR_USED))
 		return ERR_PTR(RETERR(-EINVAL));
-	nd_set_link(nd, dentry->d_inode->u.generic_ip);
+	nd_set_link(nd, dentry->d_inode->i_private);
 	return NULL;
 }
 
diff --git a/fs/reiser4/plugin/item/static_stat.c b/fs/reiser4/plugin/item/static_stat.c
index d1a4a40..0ef01e6 100644
--- a/fs/reiser4/plugin/item/static_stat.c
+++ b/fs/reiser4/plugin/item/static_stat.c
@@ -430,21 +430,21 @@ save_large_times_sd(struct inode *inode /* object being processed */ ,
 
 /* symlink stat data extension */
 
-/* allocate memory for symlink target and attach it to inode->u.generic_ip */
+/* allocate memory for symlink target and attach it to inode->i_private */
 static int
 symlink_target_to_inode(struct inode *inode, const char *target, int len)
 {
-	assert("vs-845", inode->u.generic_ip == NULL);
+	assert("vs-845", inode->i_private == NULL);
 	assert("vs-846", !inode_get_flag(inode, REISER4_GENERIC_PTR_USED));
 
 	/* FIXME-VS: this is prone to deadlock. Not more than other similar
 	   places, though */
-	inode->u.generic_ip = kmalloc((size_t) len + 1, get_gfp_mask());
-	if (!inode->u.generic_ip)
+	inode->i_private = kmalloc((size_t) len + 1, get_gfp_mask());
+	if (!inode->i_private)
 		return RETERR(-ENOMEM);
 
-	memcpy((char *)(inode->u.generic_ip), target, (size_t) len);
-	((char *)(inode->u.generic_ip))[len] = 0;
+	memcpy((char *)(inode->i_private), target, (size_t) len);
+	((char *)(inode->i_private))[len] = 0;
 	inode_set_flag(inode, REISER4_GENERIC_PTR_USED);
 	return 0;
 }
@@ -499,8 +499,8 @@ static int save_symlink_sd(struct inode *inode, char **area)
 	if (!inode_get_flag(inode, REISER4_GENERIC_PTR_USED)) {
 		const char *target;
 
-		target = (const char *)(inode->u.generic_ip);
-		inode->u.generic_ip = NULL;
+		target = (const char *)(inode->i_private);
+		inode->i_private = NULL;
 
 		result = symlink_target_to_inode(inode, target, length);
 
@@ -510,7 +510,7 @@ static int save_symlink_sd(struct inode *inode, char **area)
 	} else {
 		/* there is nothing to do in update but move area */
 		assert("vs-844",
-		       !memcmp(inode->u.generic_ip, sd->body,
+		       !memcmp(inode->i_private, sd->body,
 			       (size_t) length + 1));
 	}
 
-- 
1.4.4.1.gaed4

