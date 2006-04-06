From: Alexander Zarochentsev <zam@namesys.com>
Subject: can anybody check that the attached patch eliminates reiser4 compilation warnings on 64bit platforms?
Date: Thu, 6 Apr 2006 11:20:37 +0400
Message-ID: <200604061120.37578.zam@namesys.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_FFMNETuqNVJ/H9g"
Return-path: <reiserfs-list-return-28451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_FFMNETuqNVJ/H9g
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hello,

would you please help to check the attached patch (for 2.6.17-rc1-mm1) 
because our Alpha does not want to boot now.

the warning were:

fs/reiser4/jnode.c: In function `info_jnode':
fs/reiser4/jnode.c:1923: warning: long long unsigned int format, __u64 
arg (arg 2)
fs/reiser4/key.c: In function `print_key':
fs/reiser4/key.c:88: warning: long long unsigned int format, oid_t arg 
(arg 3)
fs/reiser4/key.c:88: warning: long long unsigned int format, __u64 arg 
(arg 5)
fs/reiser4/key.c:88: warning: long long unsigned int format, __u64 arg 
(arg 6)
fs/reiser4/key.c:88: warning: long long unsigned int format, oid_t arg 
(arg 7)
fs/reiser4/key.c:88: warning: long long unsigned int format, __u64 arg 
(arg 8)
fs/reiser4/key.c:94: warning: long long unsigned int format, oid_t arg 
(arg 3)
fs/reiser4/key.c:94: warning: long long unsigned int format, __u64 arg 
(arg 5)
fs/reiser4/key.c:94: warning: long long unsigned int format, oid_t arg 
(arg 6)
fs/reiser4/key.c:94: warning: long long unsigned int format, __u64 arg 
(arg 7)
fs/reiser4/super_ops.c: In function `reiser4_dirty_inode':
fs/reiser4/super_ops.c:176: warning: long long unsigned int format, 
oid_t arg (arg 9)
fs/reiser4/plugin/file_ops_readdir.c: In function `readdir_common':
fs/reiser4/plugin/file_ops_readdir.c:635: warning: long long unsigned 
int format, oid_t arg (arg 9)
fs/reiser4/plugin/dir_plugin_common.c: In function `rem_entry':
fs/reiser4/plugin/dir_plugin_common.c:207: warning: long long unsigned 
int format, oid_t arg (arg 9)
fs/reiser4/plugin/file/file.c: In function `delete_object_unix_file':
fs/reiser4/plugin/file/file.c:2986: warning: long long unsigned int 
format, oid_t arg (arg 9)
fs/reiser4/plugin/space/bitmap.c: In function `bnode_check_adler32':
fs/reiser4/plugin/space/bitmap.c:506: warning: long long unsigned int 
format, bmap_nr_t arg (arg 9)

Thanks in advance.
-- 
Alex.

--Boundary-00=_FFMNETuqNVJ/H9g
Content-Type: text/x-diff;
  charset="us-ascii";
  name="reiser4-fix-compilation-warnings-on-alpha.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="reiser4-fix-compilation-warnings-on-alpha.diff"

A fix for printk format specifications and __u64 arguments mismatch, visible
on Alpha platform.

Signed-off-by: <zam@namesys.com>

---

 fs/reiser4/key.c                      |   16 +++++++++-------
 fs/reiser4/plugin/dir_plugin_common.c |    2 +-
 fs/reiser4/plugin/file/file.c         |    2 +-
 fs/reiser4/plugin/file_ops_readdir.c  |    2 +-
 fs/reiser4/plugin/space/bitmap.c      |    2 +-
 fs/reiser4/super_ops.c                |    2 +-
 6 files changed, 14 insertions(+), 12 deletions(-)

Index: linux-2.6.17-rc1-mm1/fs/reiser4/key.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/key.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/key.c
@@ -81,17 +81,19 @@ void print_key(const char *prefix /* pre
 	else {
 		if (REISER4_LARGE_KEY)
 			printk("%s: (%Lx:%x:%Lx:%Lx:%Lx:%Lx)", prefix,
-			       get_key_locality(key),
+			       (unsigned long long)get_key_locality(key),
 			       get_key_type(key),
-			       get_key_ordering(key),
-			       get_key_band(key),
-			       get_key_objectid(key), get_key_offset(key));
+			       (unsigned long long)get_key_ordering(key),
+			       (unsigned long long)get_key_band(key),
+			       (unsigned long long)get_key_objectid(key),
+			       (unsigned long long)get_key_offset(key));
 		else
 			printk("%s: (%Lx:%x:%Lx:%Lx:%Lx)", prefix,
-			       get_key_locality(key),
+			       (unsigned long long)get_key_locality(key),
 			       get_key_type(key),
-			       get_key_band(key),
-			       get_key_objectid(key), get_key_offset(key));
+			       (unsigned long long)get_key_band(key),
+			       (unsigned long long)get_key_objectid(key),
+			       (unsigned long long)get_key_offset(key));
 		/*
 		 * if this is a key of directory entry, try to decode part of
 		 * a name stored in the key, and output it.
Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/dir_plugin_common.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/dir_plugin_common.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/dir_plugin_common.c
@@ -206,7 +206,7 @@ rem_entry(struct inode *dir, struct dent
 		if (get_key_objectid(&key) != get_inode_oid(child)) {
 			warning("nikita-3397",
 				"rem_entry: %#llx != %#llx\n",
-				get_key_objectid(&key),
+				(unsigned long long)get_key_objectid(&key),
 				(unsigned long long)get_inode_oid(child));
 			return RETERR(-EIO);
 		}
Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/file/file.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/file/file.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/file/file.c
@@ -2971,7 +2971,7 @@ int delete_object_unix_file(struct inode
 
 	if (result)
 		warning("", "failed to truncate file (%llu) on removal: %d",
-			get_inode_oid(inode), result);
+			(unsigned long long)get_inode_oid(inode), result);
 
 	/* remove stat data and safe link */
 	return delete_object_common(inode);
Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/file_ops_readdir.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/file_ops_readdir.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/file_ops_readdir.c
@@ -633,7 +633,7 @@ int readdir_common(struct file *f /* dir
 	if (reiser4_grab_space(inode_file_plugin(inode)->estimate.update(inode),
 			       BA_CAN_COMMIT) != 0)
 		warning("", "failed to update atime on readdir: %llu",
-			get_inode_oid(inode));
+			(unsigned long long)get_inode_oid(inode));
 	else
 		file_accessed(f);
 
Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/space/bitmap.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/space/bitmap.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/space/bitmap.c
@@ -505,7 +505,7 @@ bnode_check_adler32(const struct bitmap_
 
 		warning("vpf-263",
 			"Checksum for the bitmap block %llu is incorrect",
-			bmap);
+			(unsigned long long)bmap);
 
 		return RETERR(-EIO);
 	}
Index: linux-2.6.17-rc1-mm1/fs/reiser4/super_ops.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/super_ops.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/super_ops.c
@@ -174,7 +174,7 @@ static void reiser4_dirty_inode(struct i
 	result = reiser4_update_sd(inode);
 	if (result)
 		warning("", "failed to dirty inode for %llu: %d",
-			get_inode_oid(inode), result);
+			(unsigned long long)get_inode_oid(inode), result);
 }
 
 /**

--Boundary-00=_FFMNETuqNVJ/H9g--
