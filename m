From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 61/8] plugins/plugin.h cleanup
Date: Thu, 25 Oct 2007 21:48:56 +0200
Message-ID: <1193341736.15901.112.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-4Sd0Z/aNTCl6metKo/b4"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-4Sd0Z/aNTCl6metKo/b4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 83 errors, 39 warnings, 899 lines checked
patched:total: 5 errors, 23 warnings, 905 lines checked
leftovers:

WARNING: do not add new typedefs
#40: FILE: plugin.h:40:
+typedef struct reiser4_object_on_wire reiser4_object_on_wire;

WARNING: do not add new typedefs
#161: FILE: plugin.h:161:
+typedef enum {

WARNING: do not add new typedefs
#182: FILE: plugin.h:182:
+typedef enum {

WARNING: do not add new typedefs
#199: FILE: plugin.h:199:
+typedef struct file_plugin {

ERROR: need consistent spacing around '*' (ctx:WxB)
#254: FILE: plugin.h:254:
+       int (*key_by_inode) (struct inode *, loff_t off, reiser4_key *);
                                                                     ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#263: FILE: plugin.h:263:
+                                 reiser4_object_create_data *);
                                                             ^

ERROR: need consistent spacing around '*' (ctx:WxB)
#278: FILE: plugin.h:278:
+                             reiser4_object_create_data *);
                                                         ^

WARNING: do not add new typedefs
#393: FILE: plugin.h:393:
+typedef enum {

WARNING: do not add new typedefs
#399: FILE: plugin.h:399:
+typedef struct dir_plugin {

WARNING: do not add new typedefs
#463: FILE: plugin.h:463:
+typedef struct formatting_plugin {

WARNING: do not add new typedefs
#471: FILE: plugin.h:471:
+typedef struct hash_plugin {

WARNING: do not add new typedefs
#478: FILE: plugin.h:478:
+typedef struct cipher_plugin {

WARNING: do not add new typedefs
#503: FILE: plugin.h:503:
+typedef struct digest_plugin {

WARNING: do not add new typedefs
#512: FILE: plugin.h:512:
+typedef struct compression_plugin {

WARNING: do not add new typedefs
#531: FILE: plugin.h:531:
+typedef struct compression_mode_plugin {

WARNING: do not add new typedefs
#543: FILE: plugin.h:543:
+typedef struct cluster_plugin {

WARNING: do not add new typedefs
#549: FILE: plugin.h:549:
+typedef struct sd_ext_plugin {

WARNING: do not add new typedefs
#563: FILE: plugin.h:563:
+typedef struct oid_allocator_plugin {

ERROR: need consistent spacing around '*' (ctx:WxB)
#584: FILE: plugin.h:584:
+       void (*print_info) (const char *, reiser4_oid_allocator *);
                                                                ^

WARNING: do not add new typedefs
#589: FILE: plugin.h:589:
+typedef struct disk_format_plugin {

WARNING: do not add new typedefs
#706: FILE: plugin.h:706:
+typedef enum {

WARNING: do not add new typedefs
#717: FILE: plugin.h:717:
+typedef enum {

WARNING: do not add new typedefs
#724: FILE: plugin.h:724:
+typedef enum {

WARNING: do not add new typedefs
#730: FILE: plugin.h:730:
+typedef enum {

WARNING: do not add new typedefs
#740: FILE: plugin.h:740:
+typedef enum {

WARNING: do not add new typedefs
#751: FILE: plugin.h:751:
+typedef enum {

ERROR: Macros with complex values should be enclosed in parenthesis
#802: FILE: plugin.h:802:
+static inline TYPE *TYPE ## _by_id(reiser4_plugin_id id)
\

WARNING: do not add new typedefs
#825: FILE: plugin.h:825:
+typedef struct { int foo; } TYPE ## _plugin_dummy




--=-4Sd0Z/aNTCl6metKo/b4
Content-Disposition: attachment; filename=plugin.h.patch
Content-Type: text/x-patch; name=plugin.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- plugin.h.orig	2007-10-25 21:45:44.000000000 +0200
+++ plugin.h	2007-10-25 21:43:15.000000000 +0200
@@ -1,9 +1,10 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
 
 /* Basic plugin data-types.
    see fs/reiser4/plugin/plugin.c for details */
 
-#if !defined( __FS_REISER4_PLUGIN_TYPES_H__ )
+#if !defined(__FS_REISER4_PLUGIN_TYPES_H__)
 #define __FS_REISER4_PLUGIN_TYPES_H__
 
 #include "../forward.h"
@@ -159,8 +160,9 @@ typedef struct reiser4_object_on_wire re
  /* enumeration of fields within plugin_set */
 typedef enum {
 	PSET_FILE,
-	PSET_DIR,		/* PSET_FILE and PSET_DIR should be first elements:
-				 * inode.c:read_inode() depends on this. */
+	PSET_DIR,		/* PSET_FILE and PSET_DIR should be first
+				 * elements: inode.c:read_inode() depends on
+				 * this. */
 	PSET_PERM,
 	PSET_FORMATTING,
 	PSET_HASH,
@@ -251,7 +253,8 @@ typedef struct file_plugin {
 	 */
 	int (*key_by_inode) (struct inode *, loff_t off, reiser4_key *);
 
-	/* NIKITA-FIXME-HANS: this comment is not as clear to others as you think.... */
+	/* NIKITA-FIXME-HANS: this comment is not as clear to others as you
+	 * think.... */
 	/*
 	 * set the plugin for a file.  Called during file creation in creat()
 	 * but not reiser4() unless an inode already exists for the file.
@@ -275,7 +278,7 @@ typedef struct file_plugin {
 			      reiser4_object_create_data *);
 
 	/* this does whatever is necessary to do when object is opened */
-	int (*open_object) (struct inode * inode, struct file * file);
+	int (*open_object) (struct inode *inode, struct file *file);
 	/*
 	 * this method should check REISER4_NO_SD and set REISER4_NO_SD on
 	 * success. Deletion of an object usually includes removal of items
@@ -307,15 +310,15 @@ typedef struct file_plugin {
 
 	/* not empty for DIRECTORY_FILE_PLUGIN_ID only currently. It calls
 	   detach of directory plugin to remove ".." */
-	int (*detach) (struct inode * child, struct inode * parent);
+	int (*detach) (struct inode *child, struct inode *parent);
 
 	/* called when @child was just looked up in the @parent. It is not
 	   empty for DIRECTORY_FILE_PLUGIN_ID only where it calls attach of
 	   directory plugin */
-	int (*bind) (struct inode * child, struct inode * parent);
+	int (*bind) (struct inode *child, struct inode *parent);
 
 	/* process safe-link during mount */
-	int (*safelink) (struct inode * object, reiser4_safe_link_t link,
+	int (*safelink) (struct inode *object, reiser4_safe_link_t link,
 			 __u64 value);
 
 	/* The couple of estimate methods for all file operations */
@@ -332,7 +335,7 @@ typedef struct file_plugin {
 	 * (read_inode) and when file is created (common_create_child) so that
 	 * file plugin could initialize its inode data
 	 */
-	void (*init_inode_data) (struct inode *, reiser4_object_create_data *,
+	void (*init_inode_data) (struct inode *, reiser4_object_create_data * ,
 				 int);
 
 	/*
@@ -344,8 +347,8 @@ typedef struct file_plugin {
 	 * @to_key: the end of the deleted key range,
 	 * @smallest_removed: the smallest removed key,
 	 *
-	 * @return: 0 if success, error code otherwise, -E_REPEAT means that long cut_tree
-	 * operation was interrupted for allowing atom commit .
+	 * @return: 0 if success, error code otherwise, -E_REPEAT means that
+	 * long cut_tree operation was interrupted for allowing atom commit .
 	 */
 	int (*cut_tree_worker) (tap_t *, const reiser4_key * from_key,
 				const reiser4_key * to_key,
@@ -361,14 +364,14 @@ typedef struct file_plugin {
 	 */
 	struct {
 		/* store object's identity at @area */
-		char *(*write) (struct inode * inode, char *area);
+		char *(*write) (struct inode *inode, char *area);
 		/* parse object from wire to the @obj */
 		char *(*read) (char *area, reiser4_object_on_wire * obj);
 		/* given object identity in @obj, find or create its dentry */
-		struct dentry *(*get) (struct super_block * s,
+		struct dentry *(*get) (struct super_block *s,
 				       reiser4_object_on_wire * obj);
 		/* how many bytes ->wire.write() consumes */
-		int (*size) (struct inode * inode);
+		int (*size) (struct inode *inode);
 		/* finish with object identify */
 		void (*done) (reiser4_object_on_wire * obj);
 	} wire;
@@ -408,44 +411,44 @@ typedef struct dir_plugin {
 	 * they should be a separate type of plugin.
 	 */
 
-	struct dentry *(*get_parent) (struct inode * childdir);
+	struct dentry *(*get_parent) (struct inode *childdir);
 
 	/*
 	 * check whether "name" is acceptable name to be inserted into this
 	 * object. Optionally implemented by directory-like objects.  Can check
 	 * for maximal length, reserved symbols etc
 	 */
-	int (*is_name_acceptable) (const struct inode * inode, const char *name,
+	int (*is_name_acceptable) (const struct inode *inode, const char *name,
 				   int len);
 
-	void (*build_entry_key) (const struct inode * dir	/* directory where
-								 * entry is (or will
-								 * be) in.*/ ,
-				 const struct qstr * name	/* name of file
-								 * referenced by this
-								 * entry */ ,
+	void (*build_entry_key) (const struct inode *dir /* directory where
+							  * entry is (or will
+							  * be) in.*/ ,
+				 const struct qstr *name /* name of file
+							  * referenced by this
+							  * entry */ ,
 				 reiser4_key * result	/* resulting key of
 							 * directory entry */ );
-	int (*build_readdir_key) (struct file * dir, reiser4_key * result);
-	int (*add_entry) (struct inode * object, struct dentry * where,
+	int (*build_readdir_key) (struct file *dir, reiser4_key * result);
+	int (*add_entry) (struct inode *object, struct dentry *where,
 			  reiser4_object_create_data * data,
 			  reiser4_dir_entry_desc * entry);
-	int (*rem_entry) (struct inode * object, struct dentry * where,
+	int (*rem_entry) (struct inode *object, struct dentry *where,
 			  reiser4_dir_entry_desc * entry);
 
 	/*
 	 * initialize directory structure for newly created object. For normal
 	 * unix directories, insert dot and dotdot.
 	 */
-	int (*init) (struct inode * object, struct inode * parent,
+	int (*init) (struct inode *object, struct inode *parent,
 		     reiser4_object_create_data * data);
 
 	/* destroy directory */
-	int (*done) (struct inode * child);
+	int (*done) (struct inode *child);
 
 	/* called when @subdir was just looked up in the @dir */
-	int (*attach) (struct inode * subdir, struct inode * dir);
-	int (*detach) (struct inode * subdir, struct inode * dir);
+	int (*attach) (struct inode *subdir, struct inode *dir);
+	int (*detach) (struct inode *subdir, struct inode *dir);
 
 	struct {
 		reiser4_block_nr(*add_entry) (const struct inode *);
@@ -462,7 +465,7 @@ typedef struct formatting_plugin {
 	plugin_header h;
 	/* returns non-zero iff file's tail has to be stored
 	   in a direct item. */
-	int (*have_tail) (const struct inode * inode, loff_t size);
+	int (*have_tail) (const struct inode *inode, loff_t size);
 } formatting_plugin;
 
 typedef struct hash_plugin {
@@ -476,25 +479,25 @@ typedef struct cipher_plugin {
 	/* generic fields */
 	plugin_header h;
 	struct crypto_blkcipher * (*alloc) (void);
-	void (*free) (struct crypto_blkcipher * tfm);
+	void (*free) (struct crypto_blkcipher *tfm);
 	/* Offset translator. For each offset this returns (k * offset), where
 	   k (k >= 1) is an expansion factor of the cipher algorithm.
 	   For all symmetric algorithms k == 1. For asymmetric algorithms (which
 	   inflate data) offset translation guarantees that all disk cluster's
 	   units will have keys smaller then next cluster's one.
 	 */
-	 loff_t(*scale) (struct inode * inode, size_t blocksize, loff_t src);
+	 loff_t(*scale) (struct inode *inode, size_t blocksize, loff_t src);
 	/* Cipher algorithms can accept data only by chunks of cipher block
 	   size. This method is to align any flow up to cipher block size when
 	   we pass it to cipher algorithm. To align means to append padding of
 	   special format specific to the cipher algorithm */
-	int (*align_stream) (__u8 * tail, int clust_size, int blocksize);
+	int (*align_stream) (__u8 *tail, int clust_size, int blocksize);
 	/* low-level key manager (check, install, etc..) */
-	int (*setkey) (struct crypto_tfm * tfm, const __u8 * key,
+	int (*setkey) (struct crypto_tfm *tfm, const __u8 *key,
 		       unsigned int keylen);
 	/* main text processing procedures */
-	void (*encrypt) (__u32 * expkey, __u8 * dst, const __u8 * src);
-	void (*decrypt) (__u32 * expkey, __u8 * dst, const __u8 * src);
+	void (*encrypt) (__u32 *expkey, __u8 *dst, const __u8 *src);
+	void (*decrypt) (__u32 *expkey, __u8 *dst, const __u8 *src);
 } cipher_plugin;
 
 typedef struct digest_plugin {
@@ -503,7 +506,7 @@ typedef struct digest_plugin {
 	/* fingerprint size in bytes */
 	int fipsize;
 	struct crypto_hash * (*alloc) (void);
-	void (*free) (struct crypto_hash * tfm);
+	void (*free) (struct crypto_hash *tfm);
 } digest_plugin;
 
 typedef struct compression_plugin {
@@ -519,10 +522,10 @@ typedef struct compression_plugin {
 	int (*min_size_deflate) (void);
 	 __u32(*checksum) (char *data, __u32 length);
 	/* main transform procedures */
-	void (*compress) (coa_t coa, __u8 * src_first, unsigned src_len,
-			  __u8 * dst_first, unsigned *dst_len);
-	void (*decompress) (coa_t coa, __u8 * src_first, unsigned src_len,
-			    __u8 * dst_first, unsigned *dst_len);
+	void (*compress) (coa_t coa, __u8 *src_first, unsigned src_len,
+			  __u8 *dst_first, unsigned *dst_len);
+	void (*decompress) (coa_t coa, __u8 *src_first, unsigned src_len,
+			    __u8 *dst_first, unsigned *dst_len);
 } compression_plugin;
 
 typedef struct compression_mode_plugin {
@@ -530,11 +533,11 @@ typedef struct compression_mode_plugin {
 	plugin_header h;
 	/* this is called when estimating compressibility
 	   of a logical cluster by its content */
-	int (*should_deflate) (struct inode * inode, cloff_t index);
+	int (*should_deflate) (struct inode *inode, cloff_t index);
 	/* this is called when results of compression should be saved */
-	int (*accept_hook) (struct inode * inode, cloff_t index);
+	int (*accept_hook) (struct inode *inode, cloff_t index);
 	/* this is called when results of compression should be discarded */
-	int (*discard_hook) (struct inode * inode, cloff_t index);
+	int (*discard_hook) (struct inode *inode, cloff_t index);
 } compression_mode_plugin;
 
 typedef struct cluster_plugin {
@@ -546,10 +549,10 @@ typedef struct cluster_plugin {
 typedef struct sd_ext_plugin {
 	/* generic fields */
 	plugin_header h;
-	int (*present) (struct inode * inode, char **area, int *len);
-	int (*absent) (struct inode * inode);
-	int (*save_len) (struct inode * inode);
-	int (*save) (struct inode * inode, char **area);
+	int (*present) (struct inode *inode, char **area, int *len);
+	int (*absent) (struct inode *inode);
+	int (*save_len) (struct inode *inode);
+	int (*save) (struct inode *inode, char **area);
 	/* alignment requirement for this stat-data part */
 	int alignment;
 } sd_ext_plugin;
@@ -590,11 +593,11 @@ typedef struct disk_format_plugin {
 	int (*init_format) (struct super_block *, void *data);
 
 	/* key of root directory stat data */
-	const reiser4_key *(*root_dir_key) (const struct super_block *);
+	const reiser4_key * (*root_dir_key) (const struct super_block *);
 
 	int (*release) (struct super_block *);
-	jnode *(*log_super) (struct super_block *);
-	int (*check_open) (const struct inode * object);
+	jnode * (*log_super) (struct super_block *);
+	int (*check_open) (const struct inode *object);
 	int (*version_update) (struct super_block *);
 } disk_format_plugin;
 
@@ -605,7 +608,7 @@ struct jnode_plugin {
 	int (*parse) (jnode * node);
 	struct address_space *(*mapping) (const jnode * node);
 	unsigned long (*index) (const jnode * node);
-	jnode *(*clone) (jnode * node);
+	jnode * (*clone) (jnode * node);
 };
 
 /* plugin instance.                                                         */
@@ -669,24 +672,24 @@ struct reiser4_plugin_ops {
 	/* called when plugin is unloaded */
 	int (*done) (reiser4_plugin * plugin);
 	/* load given plugin from disk */
-	int (*load) (struct inode * inode,
+	int (*load) (struct inode *inode,
 		     reiser4_plugin * plugin, char **area, int *len);
 	/* how many space is required to store this plugin's state
 	   in stat-data */
-	int (*save_len) (struct inode * inode, reiser4_plugin * plugin);
+	int (*save_len) (struct inode *inode, reiser4_plugin * plugin);
 	/* save persistent plugin-data to disk */
-	int (*save) (struct inode * inode, reiser4_plugin * plugin,
+	int (*save) (struct inode *inode, reiser4_plugin * plugin,
 		     char **area);
 	/* alignment requirement for on-disk state of this plugin
 	   in number of bytes */
 	int alignment;
 	/* install itself into given inode. This can return error
 	   (e.g., you cannot change hash of non-empty directory). */
-	int (*change) (struct inode * inode, reiser4_plugin * plugin,
+	int (*change) (struct inode *inode, reiser4_plugin * plugin,
 		       pset_member memb);
 	/* install itself into given inode. This can return error
 	   (e.g., you cannot change hash of non-empty directory). */
-	int (*inherit) (struct inode * inode, struct inode * parent,
+	int (*inherit) (struct inode *inode, struct inode *parent,
 			reiser4_plugin * plugin);
 };
 
@@ -767,7 +770,7 @@ struct reiser4_object_create_data {
 	/* add here something for non-standard objects you invent, like
 	   query for interpolation file etc. */
 
- 	struct reiser4_crypto_info * crypto;
+	struct reiser4_crypto_info *crypto;
 
 	struct inode *parent;
 	struct dentry *dentry;
@@ -795,29 +798,29 @@ struct reiser4_dir_entry_desc {
 #define MAX_PLUGIN_TYPE_LABEL_LEN  32
 #define MAX_PLUGIN_PLUG_LABEL_LEN  32
 
-#define PLUGIN_BY_ID(TYPE,ID,FIELD)					\
-static inline TYPE *TYPE ## _by_id( reiser4_plugin_id id )		\
+#define PLUGIN_BY_ID(TYPE, ID, FIELD)					\
+static inline TYPE *TYPE ## _by_id(reiser4_plugin_id id)		\
 {									\
-	reiser4_plugin *plugin = plugin_by_id ( ID, id );		\
-	return plugin ? & plugin -> FIELD : NULL;			\
+	reiser4_plugin *plugin = plugin_by_id(ID, id);		\
+	return plugin ? &plugin->FIELD : NULL;			\
 }									\
-static inline TYPE *TYPE ## _by_disk_id( reiser4_tree *tree, d16 *id )	\
+static inline TYPE *TYPE ## _by_disk_id(reiser4_tree * tree, d16 *id)	\
 {									\
-	reiser4_plugin *plugin = plugin_by_disk_id ( tree, ID, id );	\
-	return plugin ? & plugin -> FIELD : NULL;			\
+	reiser4_plugin *plugin = plugin_by_disk_id(tree, ID, id);	\
+	return plugin ? &plugin->FIELD : NULL;			\
 }									\
-static inline TYPE *TYPE ## _by_unsafe_id( reiser4_plugin_id id )	\
+static inline TYPE *TYPE ## _by_unsafe_id(reiser4_plugin_id id)	\
 {									\
-	reiser4_plugin *plugin = plugin_by_unsafe_id ( ID, id );	\
-	return plugin ? & plugin -> FIELD : NULL;			\
+	reiser4_plugin *plugin = plugin_by_unsafe_id(ID, id);	\
+	return plugin ? &plugin->FIELD : NULL;			\
 }									\
-static inline reiser4_plugin* TYPE ## _to_plugin( TYPE* plugin )	\
+static inline reiser4_plugin* TYPE ## _to_plugin(TYPE* plugin)	\
 {									\
-	return ( reiser4_plugin * ) plugin;				\
+	return (reiser4_plugin *) plugin;				\
 }									\
-static inline reiser4_plugin_id TYPE ## _id( TYPE* plugin )		\
+static inline reiser4_plugin_id TYPE ## _id(TYPE* plugin)		\
 {									\
-	return TYPE ## _to_plugin (plugin) -> h.id;			\
+	return TYPE ## _to_plugin(plugin)->h.id;			\
 }									\
 typedef struct { int foo; } TYPE ## _plugin_dummy
 
@@ -843,14 +846,17 @@ extern int save_plugin_id(reiser4_plugin
 
 extern struct list_head *get_plugin_list(reiser4_plugin_type type_id);
 
-#define for_all_plugins(ptype, plugin)							\
-for (plugin = list_entry(get_plugin_list(ptype)->next, reiser4_plugin, h.linkage);	\
-     get_plugin_list(ptype) != &plugin->h.linkage;					\
+#define for_all_plugins(ptype, plugin)					\
+for (plugin = list_entry(get_plugin_list(ptype)->next, reiser4_plugin,
+						 h.linkage);		\
+     get_plugin_list(ptype) != &plugin->h.linkage;			\
      plugin = list_entry(plugin->h.linkage.next, reiser4_plugin, h.linkage))
 
 
-extern int grab_plugin_pset(struct inode *self, struct inode *ancestor, pset_member memb);
-extern int force_plugin_pset(struct inode *self, pset_member memb, reiser4_plugin *plug);
+extern int grab_plugin_pset(struct inode *self, struct inode *ancestor,
+			    pset_member memb);
+extern int force_plugin_pset(struct inode *self, pset_member memb,
+			     reiser4_plugin *plug);
 extern int finish_pset(struct inode *inode);
 
 /* defined in fs/reiser4/plugin/object.c */

--=-4Sd0Z/aNTCl6metKo/b4--

