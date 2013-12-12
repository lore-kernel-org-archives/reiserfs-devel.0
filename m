From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH] reiser4: support user namespaces and kuid_t/kgid_t.
Date: Thu, 12 Dec 2013 10:00:02 +0400
Message-ID: <1386828002-30019-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=fhC8QzPagxCpbqzfU9Bt4X5YKtdd02hK9HfvYpUz770=;
        b=cUcjK92WDabOST953rrLiR5LQmJbSFe94MBiH/pP8caq66tjHcaepH9jkh5jeXJcri
         MMi3Qrv9bZuR7YqThdNxzwaE2zoQcXuxgVdLcF3Jqo70zFDmEBXjO6ou1LvuscaSChFB
         M3KB4AplHdkXFwJAvXNkwaKwxCOijDMrtUnUBQaEKAHtmVVQw5IiUEVnQfzA/d9T6UKa
         Q5i1KfLg7gkjWTghbl3WCWI47AD8qCXnXsOwV0GHDhwcQsi1lqpDEwG7HVHQoeAKiPGF
         HZB46S50mpNzdqyPIEuqlDOEjWlHOjkv42uBSZMaIk5jcTzGd4F7+FFrsZABkp0oVuyF
         YZKA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

This is required to compile reiser4 with user namespaces support enabled.

---
 fs/reiser4/plugin/file_plugin_common.c |  4 ++--
 fs/reiser4/plugin/inode_ops.c          |  5 ++---
 fs/reiser4/plugin/item/static_stat.c   | 12 ++++++------
 fs/reiser4/super.h                     |  4 ++--
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/fs/reiser4/plugin/file_plugin_common.c b/fs/reiser4/plugin/file_plugin_common.c
index 1ed9459..f2eaf64 100644
--- a/fs/reiser4/plugin/file_plugin_common.c
+++ b/fs/reiser4/plugin/file_plugin_common.c
@@ -61,7 +61,7 @@ int set_plug_in_inode_common(struct inode *object /* inode to set plugin on */ ,
 
 	object->i_mode = data->mode;
 	/* this should be plugin decision */
-	object->i_uid = current->cred->fsuid;
+	object->i_uid = current_fsuid();
 	object->i_mtime = object->i_atime = object->i_ctime = CURRENT_TIME;
 
 	/* support for BSD style group-id assignment. See mount's manual page
@@ -75,7 +75,7 @@ int set_plug_in_inode_common(struct inode *object /* inode to set plugin on */ ,
 			/* sguid is inherited by sub-directories */
 			object->i_mode |= S_ISGID;
 	} else
-		object->i_gid = current->cred->fsgid;
+		object->i_gid = current_fsgid();
 
 	/* this object doesn't have stat-data yet */
 	reiser4_inode_set_flag(object, REISER4_NO_SD);
diff --git a/fs/reiser4/plugin/inode_ops.c b/fs/reiser4/plugin/inode_ops.c
index 59cebee..9e9497b 100644
--- a/fs/reiser4/plugin/inode_ops.c
+++ b/fs/reiser4/plugin/inode_ops.c
@@ -462,9 +462,8 @@ int reiser4_setattr_common(struct dentry *dentry, struct iattr *attr)
 	 */
 	result = setattr_reserve(reiser4_tree_by_inode(inode));
 	if (!result) {
-		if ((attr->ia_valid & ATTR_UID && attr->ia_uid != inode->i_uid)
-		    || (attr->ia_valid & ATTR_GID
-			&& attr->ia_gid != inode->i_gid)) {
+		if (((attr->ia_valid & ATTR_UID) && !uid_eq(attr->ia_uid, inode->i_uid))
+		    || ((attr->ia_valid & ATTR_GID) && !gid_eq(attr->ia_gid, inode->i_gid))) {
 			result = dquot_transfer(inode, attr) ? -EDQUOT : 0;
 			if (result) {
 				context_set_commit_async(ctx);
diff --git a/fs/reiser4/plugin/item/static_stat.c b/fs/reiser4/plugin/item/static_stat.c
index 80e0cb6..377cf24 100644
--- a/fs/reiser4/plugin/item/static_stat.c
+++ b/fs/reiser4/plugin/item/static_stat.c
@@ -327,8 +327,8 @@ static int present_unix_sd(struct inode *inode /* object being processed */ ,
 
 		sd = (reiser4_unix_stat *) * area;
 
-		inode->i_uid = le32_to_cpu(get_unaligned(&sd->uid));
-		inode->i_gid = le32_to_cpu(get_unaligned(&sd->gid));
+		i_uid_write(inode, le32_to_cpu(get_unaligned(&sd->uid)));
+		i_gid_write(inode, le32_to_cpu(get_unaligned(&sd->gid)));
 		inode->i_atime.tv_sec = le32_to_cpu(get_unaligned(&sd->atime));
 		inode->i_mtime.tv_sec = le32_to_cpu(get_unaligned(&sd->mtime));
 		inode->i_ctime.tv_sec = le32_to_cpu(get_unaligned(&sd->ctime));
@@ -344,8 +344,8 @@ static int present_unix_sd(struct inode *inode /* object being processed */ ,
 
 static int absent_unix_sd(struct inode *inode /* object being processed */ )
 {
-	inode->i_uid = get_super_private(inode->i_sb)->default_uid;
-	inode->i_gid = get_super_private(inode->i_sb)->default_gid;
+	i_uid_write(inode, get_super_private(inode->i_sb)->default_uid);
+	i_gid_write(inode, get_super_private(inode->i_sb)->default_gid);
 	inode->i_atime = inode->i_mtime = inode->i_ctime = CURRENT_TIME;
 	inode_set_bytes(inode, inode->i_size);
 	/* mark inode as lightweight, so that caller (lookup_common) will
@@ -371,8 +371,8 @@ static int save_unix_sd(struct inode *inode /* object being processed */ ,
 	assert("nikita-644", *area != NULL);
 
 	sd = (reiser4_unix_stat *) * area;
-	put_unaligned(cpu_to_le32(inode->i_uid), &sd->uid);
-	put_unaligned(cpu_to_le32(inode->i_gid), &sd->gid);
+	put_unaligned(cpu_to_le32(i_uid_read(inode)), &sd->uid);
+	put_unaligned(cpu_to_le32(i_gid_read(inode)), &sd->gid);
 	put_unaligned(cpu_to_le32((__u32) inode->i_atime.tv_sec), &sd->atime);
 	put_unaligned(cpu_to_le32((__u32) inode->i_ctime.tv_sec), &sd->ctime);
 	put_unaligned(cpu_to_le32((__u32) inode->i_mtime.tv_sec), &sd->mtime);
diff --git a/fs/reiser4/super.h b/fs/reiser4/super.h
index 58c9efd..46e69fd 100644
--- a/fs/reiser4/super.h
+++ b/fs/reiser4/super.h
@@ -138,13 +138,13 @@ struct reiser4_super_info_data {
 	 * default user id used for light-weight files without their own
 	 * stat-data.
 	 */
-	uid_t default_uid;
+	__u32 default_uid;
 
 	/*
 	 * default group id used for light-weight files without their own
 	 * stat-data.
 	 */
-	gid_t default_gid;
+	__u32 default_gid;
 
 	/* mkfs identifier generated at mkfs time. */
 	__u32 mkfs_id;
-- 
1.8.5.1

