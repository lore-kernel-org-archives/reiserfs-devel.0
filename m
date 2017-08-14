From: edward.shishkin@gmail.com
Subject: [PATCH] Reiser4: Port for Linux-4.12
Date: Mon, 14 Aug 2017 11:47:02 +0200
Message-ID: <1502704022-4040-1-git-send-email-edward.shishkin@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=k6h4IylIg2JXK503LMZijgKuvRyL6jHq9UpORQd+TEs=;
        b=dG2rmDw7MMOOgPp6eLl5muX6VWuUKrmIfZY//l9fw0bVOvdMT/LWbV3zgma3Q7w8D2
         8AxMUmugyoxAtIg6lfMWpfDVuaPEu/YmFAQDvRKDS6PBkXVGrOnhnmAddk4TTtyqESS5
         MTzf+M7S3TlRzVJvawTygrHi/7U8N8OodgqkzH/rzuavTXShk318EIUAMEyduFYNbk6a
         eBWll5fkAfpUJN2q8BZbpu8Q10sw5nQymfp9MBhMPctbnNwKLLtLPI7nEkqbF6a1gcUz
         RcT0gx8ltKr50JWyTx7pWVjnx/78VBfX/6X8gzBvub9mkAa6VJlkBQM5J3FpSjQ/CFxa
         4yaA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

From: Edward Shishkin <edward.shishkin@gmail.com>

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 plugin/file/cryptcompress.c   | 2 +-
 plugin/file/file.c            | 4 ++--
 plugin/file_plugin_common.c   | 8 ++++----
 plugin/inode_ops.c            | 4 ++--
 plugin/inode_ops_rename.c     | 2 +-
 plugin/item/extent_file_ops.c | 4 ++--
 plugin/item/static_stat.c     | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/plugin/file/cryptcompress.c b/plugin/file/cryptcompress.c
index 774fc9b..e1a3449 100644
--- a/plugin/file/cryptcompress.c
+++ b/plugin/file/cryptcompress.c
@@ -1594,7 +1594,7 @@ static int update_sd_cryptcompress(struct inode *inode)
 	if (result)
 		return result;
 	if (!IS_NOCMTIME(inode))
-		inode->i_ctime = inode->i_mtime = CURRENT_TIME;
+		inode->i_ctime = inode->i_mtime = current_time(inode);
 
 	result = reiser4_update_sd(inode);
 
diff --git a/plugin/file/file.c b/plugin/file/file.c
index 9d08481..9da0744 100644
--- a/plugin/file/file.c
+++ b/plugin/file/file.c
@@ -364,7 +364,7 @@ int reiser4_update_file_size(struct inode *inode, loff_t new_size,
 
 	INODE_SET_SIZE(inode, new_size);
 	if (update_sd) {
-		inode->i_ctime = inode->i_mtime = CURRENT_TIME;
+		inode->i_ctime = inode->i_mtime = current_time(inode);
 		result = reiser4_update_sd(inode);
 	}
 	return result;
@@ -2238,7 +2238,7 @@ ssize_t write_unix_file(struct file *file,
 			update_sd = 1;
 		}
 		if (!IS_NOCMTIME(inode)) {
-			inode->i_ctime = inode->i_mtime = CURRENT_TIME;
+			inode->i_ctime = inode->i_mtime = current_time(inode);
 			update_sd = 1;
 		}
 		if (update_sd) {
diff --git a/plugin/file_plugin_common.c b/plugin/file_plugin_common.c
index fe9f97e..706732d 100644
--- a/plugin/file_plugin_common.c
+++ b/plugin/file_plugin_common.c
@@ -60,7 +60,7 @@ int set_plug_in_inode_common(struct inode *object /* inode to set plugin on */ ,
 	object->i_mode = data->mode;
 	/* this should be plugin decision */
 	object->i_uid = current_fsuid();
-	object->i_mtime = object->i_atime = object->i_ctime = CURRENT_TIME;
+	object->i_mtime = object->i_atime = object->i_ctime = current_time(object);
 
 	/* support for BSD style group-id assignment. See mount's manual page
 	   description of bsdgroups ext2 mount options for more details */
@@ -256,7 +256,7 @@ int reiser4_add_link_common(struct inode *object, struct inode *parent)
 	 */
 
 	INODE_INC_NLINK(object);
-	object->i_ctime = CURRENT_TIME;
+	object->i_ctime = current_time(object);
 	return 0;
 }
 
@@ -272,7 +272,7 @@ int reiser4_rem_link_common(struct inode *object, struct inode *parent)
 	 */
 
 	INODE_DROP_NLINK(object);
-	object->i_ctime = CURRENT_TIME;
+	object->i_ctime = current_time(object);
 	return 0;
 }
 
@@ -292,7 +292,7 @@ int rem_link_common_dir(struct inode *object, struct inode *parent UNUSED_ARG)
 
 	else
 		INODE_DROP_NLINK(object);
-	object->i_ctime = CURRENT_TIME;
+	object->i_ctime = current_time(object);
 	return 0;
 }
 
diff --git a/plugin/inode_ops.c b/plugin/inode_ops.c
index 91fe425..64b5072 100644
--- a/plugin/inode_ops.c
+++ b/plugin/inode_ops.c
@@ -693,7 +693,7 @@ static int do_create_vfs_child(reiser4_object_create_data * data,/* parameters
 			   st_mtime fields of the file and the st_ctime and
 			   st_mtime fields of the parent directory. --SUS
 			 */
-			object->i_ctime = CURRENT_TIME;
+			object->i_ctime = current_time(object);
 			reiser4_update_dir(parent);
 		}
 		if (result != 0)
@@ -875,7 +875,7 @@ int reiser4_update_dir(struct inode *dir)
 {
 	assert("nikita-2525", dir != NULL);
 
-	dir->i_ctime = dir->i_mtime = CURRENT_TIME;
+	dir->i_ctime = dir->i_mtime = current_time(dir);
 	return reiser4_update_sd(dir);
 }
 
diff --git a/plugin/inode_ops_rename.c b/plugin/inode_ops_rename.c
index ddb7bf5..bedc86f 100644
--- a/plugin/inode_ops_rename.c
+++ b/plugin/inode_ops_rename.c
@@ -80,7 +80,7 @@ static int replace_name(struct inode *to_inode,	/* inode where @from_coord is
 
 		/* NOTE-NIKITA consider calling plugin method in stead of
 		   accessing inode fields directly. */
-		from_dir->i_mtime = CURRENT_TIME;
+		from_dir->i_mtime = current_time(from_dir);
 	} else {
 		warning("nikita-2326", "Unexpected item type");
 		result = RETERR(-EIO);
diff --git a/plugin/item/extent_file_ops.c b/plugin/item/extent_file_ops.c
index b670582..ef82745 100644
--- a/plugin/item/extent_file_ops.c
+++ b/plugin/item/extent_file_ops.c
@@ -942,13 +942,13 @@ filemap_copy_from_user(struct page *page, unsigned long offset,
 	int left;
 
 	kaddr = kmap_atomic(page);
-	left = __copy_from_user_inatomic_nocache(kaddr + offset, buf, bytes);
+	left = __copy_from_user_inatomic(kaddr + offset, buf, bytes);
 	kunmap_atomic(kaddr);
 
 	if (left != 0) {
 		/* Do it the slow way */
 		kaddr = kmap(page);
-		left = __copy_from_user_nocache(kaddr + offset, buf, bytes);
+		left = __copy_from_user(kaddr + offset, buf, bytes);
 		kunmap(page);
 	}
 	return bytes - left;
diff --git a/plugin/item/static_stat.c b/plugin/item/static_stat.c
index 377cf24..d75d353 100644
--- a/plugin/item/static_stat.c
+++ b/plugin/item/static_stat.c
@@ -346,7 +346,7 @@ static int absent_unix_sd(struct inode *inode /* object being processed */ )
 {
 	i_uid_write(inode, get_super_private(inode->i_sb)->default_uid);
 	i_gid_write(inode, get_super_private(inode->i_sb)->default_gid);
-	inode->i_atime = inode->i_mtime = inode->i_ctime = CURRENT_TIME;
+	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
 	inode_set_bytes(inode, inode->i_size);
 	/* mark inode as lightweight, so that caller (lookup_common) will
 	   complete initialisation by copying [ug]id from a parent. */
-- 
2.7.5

