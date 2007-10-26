From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 69/8] object.h cleanup
Date: Fri, 26 Oct 2007 14:12:21 +0200
Message-ID: <1193400741.4615.28.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Ua4FJAY4QnxjMdW0CrmP"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-Ua4FJAY4QnxjMdW0CrmP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 17 errors, 0 warnings, 121 lines checked
patched:total: 11 errors, 0 warnings, 121 lines checked
leftover:

ERROR: need consistent spacing around '*' (ctx:WxB)
#46: FILE: object.h:46:
+int key_by_inode_and_offset_common(struct inode *, loff_t, reiser4_key
*);

^

ERROR: need consistent spacing around '*' (ctx:WxB)
#48: FILE: object.h:48:
+                            reiser4_object_create_data *);
                                                        ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#56: FILE: object.h:56:
+                                reiser4_object_create_data *);
                                                            ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#77: FILE: object.h:77:
+char *wire_read_common(char *addr, reiser4_object_on_wire *);
                                                           ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#78: FILE: object.h:78:
+struct dentry *wire_get_common(struct super_block *,
reiser4_object_on_wire *);

^

ERROR: need consistent spacing around '*' (ctx:WxB)
#80: FILE: object.h:80:
+void wire_done_common(reiser4_object_on_wire *);
                                              ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#86: FILE: object.h:86:
+                           const struct qstr *qname, reiser4_key *);
                                                                  ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#87: FILE: object.h:87:
+int build_readdir_key_common(struct file *dir, reiser4_key *);
                                                            ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#89: FILE: object.h:89:
+                    reiser4_object_create_data * ,
reiser4_dir_entry_desc *);

^

ERROR: need consistent spacing around '*' (ctx:WxB)
#91: FILE: object.h:91:
+                    reiser4_dir_entry_desc *);
                                            ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#93: FILE: object.h:93:
+                           reiser4_object_create_data *);
                                                       ^




--=-Ua4FJAY4QnxjMdW0CrmP
Content-Disposition: attachment; filename=object.h.patch
Content-Type: text/x-patch; name=object.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- object.h.orig	2007-10-26 14:07:04.000000000 +0200
+++ object.h	2007-10-26 14:10:22.000000000 +0200
@@ -3,7 +3,7 @@
 
 /* Declaration of object plugin functions. */
 
-#if !defined( __FS_REISER4_PLUGIN_OBJECT_H__ )
+#if !defined(__FS_REISER4_PLUGIN_OBJECT_H__)
 #define __FS_REISER4_PLUGIN_OBJECT_H__
 
 #include "../type_safe_hash.h"
@@ -11,7 +11,7 @@
 /* common implementations of inode operations */
 int reiser4_create_common(struct inode *parent, struct dentry *dentry,
 			  int mode, struct nameidata *);
-struct dentry * reiser4_lookup_common(struct inode *parent,
+struct dentry *reiser4_lookup_common(struct inode *parent,
 				      struct dentry *dentry,
 				      struct nameidata *nameidata);
 int reiser4_link_common(struct dentry *existing, struct inode *parent,
@@ -86,7 +86,7 @@ void build_entry_key_common(const struct
 			    const struct qstr *qname, reiser4_key *);
 int build_readdir_key_common(struct file *dir, reiser4_key *);
 int reiser4_add_entry_common(struct inode *object, struct dentry *where,
-		     reiser4_object_create_data *, reiser4_dir_entry_desc *);
+		     reiser4_object_create_data * , reiser4_dir_entry_desc *);
 int reiser4_rem_entry_common(struct inode *object, struct dentry *where,
 		     reiser4_dir_entry_desc *);
 int reiser4_dir_init_common(struct inode *object, struct inode *parent,
@@ -104,8 +104,8 @@ reiser4_block_nr dir_estimate_unlink_com
 int do_prepare_write(struct file *, struct page *, unsigned from, unsigned to);
 
 /* merely useful functions */
-int lookup_sd(struct inode *, znode_lock_mode, coord_t *, lock_handle *,
-	      const reiser4_key *, int silent);
+int lookup_sd(struct inode *, znode_lock_mode, coord_t *, lock_handle * ,
+	      const reiser4_key * , int silent);
 
 /* __FS_REISER4_PLUGIN_OBJECT_H__ */
 #endif

--=-Ua4FJAY4QnxjMdW0CrmP--

