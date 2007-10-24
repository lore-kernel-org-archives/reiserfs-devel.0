From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 29/8] inode.h cleanup
Date: Thu, 25 Oct 2007 00:47:20 +0200
Message-ID: <1193266040.24225.40.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-RaWa/2rcbLpfytoPamIw"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-RaWa/2rcbLpfytoPamIw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 10 errors, 9 warnings, 449 lines checked
patched:total: 3 errors, 4 warnings, 453 lines checked


Leftovers: 

WARNING: do not add new typedefs
#33: FILE: inode.h:33:
+typedef enum {

WARNING: do not add new typedefs
#81: FILE: inode.h:81:
+typedef struct reiser4_inode reiser4_inode;

WARNING: do not add new typedefs
#89: FILE: inode.h:89:
+typedef struct {;

WARNING: do not add new typedefs
#96: FILE: inode.h:96:
+typedef __u32 oid_hi_t;

I think this one is false:

ERROR: need consistent spacing around '*' (ctx:WxB)
#331: FILE: inode.h:331:
+extern int setup_inode_ops(struct inode *inode,
reiser4_object_create_data *);

^

ERROR: need space one side of that '++' (ctx:WxW)
#404: FILE: inode.h:404:
+       ++ __i->field;                                          \
        ^

ERROR: need space one side of that '--' (ctx:WxW)
#413: FILE: inode.h:413:
+       -- __i->field;                                          \
        ^




--=-RaWa/2rcbLpfytoPamIw
Content-Disposition: attachment; filename=inode.h.patch
Content-Type: text/x-patch; name=inode.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- inode.h.orig	2007-10-25 00:32:25.000000000 +0200
+++ inode.h	2007-10-25 00:39:55.000000000 +0200
@@ -1,8 +1,9 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Inode functions. */
 
-#if !defined( __REISER4_INODE_H__ )
+#if !defined(__REISER4_INODE_H__)
 #define __REISER4_INODE_H__
 
 #include "forward.h"
@@ -139,7 +140,7 @@ struct reiser4_inode {
 	/* this semaphore is to serialize readers and writers of @pset->file
 	 * when file plugin conversion is enabled
 	 */
- 	struct rw_semaphore conv_sem;
+	struct rw_semaphore conv_sem;
 
 	/* tree of jnodes. Phantom jnodes (ones not attched to any atom) are
 	   tagged in that tree by EFLUSH_TAG_ANONYMOUS */
@@ -178,7 +179,8 @@ static inline struct inode *inode_by_rei
 						   r4_inode /* inode queried */
 						   )
 {
-	return &container_of(r4_inode, struct reiser4_inode_object, p)->vfs_inode;
+	return &container_of(r4_inode, struct reiser4_inode_object,
+			     p)->vfs_inode;
 }
 
 /*
@@ -252,7 +254,7 @@ static inline void set_inode_ordering(co
 
 /* return inode in which @uf_info is embedded */
 static inline struct inode *
-unix_file_info_to_inode(const struct unix_file_info * uf_info)
+unix_file_info_to_inode(const struct unix_file_info *uf_info)
 {
 	return &container_of(uf_info, struct reiser4_inode_object,
 			     p.file_plugin_data.unix_file_info)->vfs_inode;
@@ -330,14 +332,16 @@ extern int setup_inode_ops(struct inode 
 extern struct inode *reiser4_iget(struct super_block *super,
 				  const reiser4_key * key, int silent);
 extern void reiser4_iget_complete(struct inode *inode);
-extern void reiser4_inode_set_flag(struct inode *inode, reiser4_file_plugin_flags f);
-extern void reiser4_inode_clr_flag(struct inode *inode, reiser4_file_plugin_flags f);
+extern void reiser4_inode_set_flag(struct inode *inode,
+				   reiser4_file_plugin_flags f);
+extern void reiser4_inode_clr_flag(struct inode *inode,
+				   reiser4_file_plugin_flags f);
 extern int reiser4_inode_get_flag(const struct inode *inode,
 				  reiser4_file_plugin_flags f);
 
 /*  has inode been initialized? */
 static inline int
-is_inode_loaded(const struct inode *inode /* inode queried */ )
+is_inode_loaded(const struct inode *inode/* inode queried */)
 {
 	assert("nikita-1120", inode != NULL);
 	return reiser4_inode_get_flag(inode, REISER4_LOADED);
@@ -364,7 +368,7 @@ extern void reiser4_make_bad_inode(struc
 extern void inode_set_extension(struct inode *inode, sd_ext_bits ext);
 extern void inode_clr_extension(struct inode *inode, sd_ext_bits ext);
 extern void inode_check_scale(struct inode *inode, __u64 old, __u64 new);
-extern void inode_check_scale_nolock(struct inode * inode, __u64 old, __u64 new);
+extern void inode_check_scale_nolock(struct inode *inode, __u64 old, __u64 new);
 
 #define INODE_SET_SIZE(i, value)			\
 ({							\
@@ -424,7 +428,7 @@ static inline struct radix_tree_root *jn
 }
 
 static inline struct radix_tree_root *jnode_tree_by_reiser4_inode(reiser4_inode
-								  * r4_inode)
+								  *r4_inode)
 {
 	return &r4_inode->jnodes_tree;
 }

--=-RaWa/2rcbLpfytoPamIw--

