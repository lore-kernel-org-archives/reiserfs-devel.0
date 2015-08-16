From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 3/3] reiser4: release format 4.0.1
Date: Sun, 16 Aug 2015 20:15:55 +0200
Message-ID: <55D0D35B.8010609@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040902060703040802000106"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=+/0ejvMmDqmY1QLUIy2MExdRbbxmwf9fhenP0lEGZe8=;
        b=HFxnQTOCvmhKNhm5fkJOrw9w6g1mj2Fj2IPrOl5UbpyLtH8DjbrofIoOdhgTsGuPcZ
         73uTRibyO9XlZAl4pTlJPQpB5ZJyDhbJbs5jEHoW8xDHolCVRqProHY95cfqCwPxlCBd
         oPtYW9Vk2UPuOt/eLrtqwHnyV6YJYWlcj5ydw/DXCTSfoGuSEWZqEKSwT1dxd281dp+1
         pQo1DCPLtftuWsW6meffd6fKQGLFiv4qmffv1Qj5beGzb5SL2gumPuaIJn+ZoS48t8HI
         jsZcu6PNCoavsNCZXVKR/m3iRgde33AzncAGR5aGYbEEdmfDjzfaAkN6ADhTPNMRD0aH
         AHCg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------040902060703040802000106
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------040902060703040802000106
Content-Type: text/x-patch;
 name="reiser4-release-4.0.1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-release-4.0.1.patch"

. Remove unneeded macro FORMAT40_VERSION;
. Print a format release when initializing reiser4 kernel module;  
. Cleanups;
. Release version 4.0.1 of reiser4 kernel module (node41
  with checksum support);

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/disk_format/disk_format40.c |   25 +++++++++++--------------
 fs/reiser4/plugin/node/node.h                 |    2 +-
 fs/reiser4/plugin/plugin.h                    |   22 +++++++++++++++++-----
 fs/reiser4/super_ops.c                        |    6 ++++--
 4 files changed, 33 insertions(+), 22 deletions(-)

--- a/fs/reiser4/plugin/disk_format/disk_format40.c
+++ b/fs/reiser4/plugin/disk_format/disk_format40.c
@@ -27,9 +27,6 @@
    & tx record. */
 #define RELEASE_RESERVED 4
 
-/* The greatest supported format40 version number */
-#define FORMAT40_VERSION PLUGIN_LIBRARY_VERSION
-
 /* This flag indicates that backup should be updated
    (the update is performed by fsck) */
 #define FORMAT40_UPDATE_BACKUP (1 << 31)
@@ -92,14 +89,14 @@ static int update_backup_version(const f
 		FORMAT40_UPDATE_BACKUP);
 }
 
-static int update_disk_version(const format40_disk_super_block * sb)
+static int update_disk_version_minor(const format40_disk_super_block * sb)
 {
-	return (get_format40_version(sb) < FORMAT40_VERSION);
+	return (get_format40_version(sb) < PLUGIN_LIBRARY_VERSION);
 }
 
 static int incomplete_compatibility(const format40_disk_super_block * sb)
 {
-	return (get_format40_version(sb) > FORMAT40_VERSION);
+	return (get_format40_version(sb) > PLUGIN_LIBRARY_VERSION);
 }
 
 static format40_super_info *get_sb_info(struct super_block *super)
@@ -327,7 +324,7 @@ static int try_init_format40(struct supe
 		printk("reiser4: Warning: The last completely supported "
 		       "version of disk format40 is %u. Some objects of "
 		       "the semantic tree can be unaccessible.\n",
-		       FORMAT40_VERSION);
+		       PLUGIN_LIBRARY_VERSION);
 	/* make sure that key format of kernel and filesystem match */
 	result = check_key_format(sb_copy);
 	if (result) {
@@ -491,8 +488,8 @@ static void pack_format40_super(const st
 	put_unaligned(cpu_to_le16(sbinfo->tree.height),
 		      &super_data->tree_height);
 
-	if (update_disk_version(super_data)) {
-		__u32 version = FORMAT40_VERSION | FORMAT40_UPDATE_BACKUP;
+	if (update_disk_version_minor(super_data)) {
+		__u32 version = PLUGIN_LIBRARY_VERSION | FORMAT40_UPDATE_BACKUP;
 
 		put_unaligned(cpu_to_le32(version), &super_data->version);
 	}
@@ -606,9 +603,9 @@ int check_open_format40(const struct ino
 	return 0;
 }
 
-/* plugin->u.format.version_update.
-   Perform all version update operations from the on-disk
-   format40_disk_super_block.version on disk to FORMAT40_VERSION.
+/*
+ * plugin->u.format.version_update
+ * Upgrade minor disk format version number
  */
 int version_update_format40(struct super_block *super) {
 	txn_handle * trans;
@@ -620,12 +617,12 @@ int version_update_format40(struct super
 	if (super->s_flags & MS_RDONLY)
  		return 0;
 
-	if (get_super_private(super)->version >= FORMAT40_VERSION)
+	if (get_super_private(super)->version >= PLUGIN_LIBRARY_VERSION)
 		return 0;
 
 	printk("reiser4: Updating disk format to 4.0.%u. The reiser4 metadata "
 	       "backup is left unchanged. Please run 'fsck.reiser4 --fix' "
-	       "on %s to update it too.\n", FORMAT40_VERSION, super->s_id);
+	       "on %s to update it too.\n", PLUGIN_LIBRARY_VERSION, super->s_id);
 
 	/* Mark the uber znode dirty to call log_super on write_logs. */
 	init_lh(&lh);
--- a/fs/reiser4/plugin/node/node.h
+++ b/fs/reiser4/plugin/node/node.h
@@ -241,7 +241,7 @@ typedef struct node_plugin {
 typedef enum {
 	NODE40_ID, /* standard unified node layout used for both,
 		      leaf and internal nodes */
-	NODE41_ID, /* unified node layout with a reference counter */
+	NODE41_ID, /* node layout with a checksum */
 	LAST_NODE_ID
 } reiser4_node_id;
 
--- a/fs/reiser4/plugin/plugin.h
+++ b/fs/reiser4/plugin/plugin.h
@@ -151,11 +151,13 @@ typedef struct reiser4_object_on_wire re
  * them, and which are only invoked by other plugins.
  */
 
-/* This should be incremented with each new contributed
-   pair (plugin type, plugin id).
-   NOTE: Make sure there is a release of reiser4progs
-   with the corresponding version number */
-#define PLUGIN_LIBRARY_VERSION 0
+/*
+ * This should be incremented in every release which adds one
+ * or more new plugins.
+ * NOTE: Make sure that respective marco is also incremented in
+ * the new release of reiser4progs.
+ */
+#define PLUGIN_LIBRARY_VERSION 1
 
  /* enumeration of fields within plugin_set */
 typedef enum {
@@ -904,6 +906,16 @@ static inline reiser4_plugin_id TYPE ##
 }									\
 typedef struct { int foo; } TYPE ## _plugin_dummy
 
+static inline int get_release_number_major(void)
+{
+	return LAST_FORMAT_ID - 1;
+}
+
+static inline int get_release_number_minor(void)
+{
+	return PLUGIN_LIBRARY_VERSION;
+}
+
 PLUGIN_BY_ID(item_plugin, REISER4_ITEM_PLUGIN_TYPE, item);
 PLUGIN_BY_ID(file_plugin, REISER4_FILE_PLUGIN_TYPE, file);
 PLUGIN_BY_ID(dir_plugin, REISER4_DIR_PLUGIN_TYPE, dir);
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -646,8 +646,10 @@ static int __init init_reiser4(void)
 	int result;
 
 	printk(KERN_INFO
-	       "Loading Reiser4. "
-	       "See www.namesys.com for a description of Reiser4.\n");
+	       "Loading Reiser4 (format release: 4.%d.%d) "
+	       "See www.namesys.com for a description of Reiser4.\n",
+	       get_release_number_major(),
+	       get_release_number_minor());
 
 	/* initialize slab cache of inodes */
 	if ((result = init_inodes()) != 0)

--------------040902060703040802000106--
