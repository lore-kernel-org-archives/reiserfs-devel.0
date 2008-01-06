From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/4] reiser4: fix dummy ioctl_cryptcompress
Date: Mon, 07 Jan 2008 00:12:43 +0300
Message-ID: <4781444B.7000707@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000303040102040203030307"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000303040102040203030307
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Andrew,
please, apply.

Thanks,
Edward.

--------------000303040102040203030307
Content-Type: text/x-patch;
 name="reiser4-fix-dummy-ioctl_cryptcompress.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-dummy-ioctl_cryptcompress.patch"

. Problem: unexpected resolving to prompt when merging/updating
  stuff with python-based Gentoo manager (reported by
  rvalles <rvalles@es.gnu.org> and
  Dushan Tcholich <dusanc@gmail.com>).

  Bug: User application made wrong decision about file's nature
  based on returned value of ->ioctl() method for cryptcompress
  file plugin.

  Fix: make dummy ->ioctl() method for cryptcompress file plugin
  to return -EINVAL instead of zero.

. Drop some redundant ifs.

. Update comments. Add precise definition of FCS (file conversion set)
  that should be protected during file plugin conversion.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/cryptcompress.c   |    2 
 linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/file.c            |    7 
 linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/file_conversion.c |  118 ++++++----
 3 files changed, 78 insertions(+), 49 deletions(-)

--- linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/cryptcompress.c.orig
+++ linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/cryptcompress.c
@@ -3627,7 +3627,7 @@
 int ioctl_cryptcompress(struct inode *inode, struct file *filp,
 			unsigned int cmd, unsigned long arg)
 {
-	return 0;
+	return RETERR(-ENOSYS);
 }
 
 /* plugin->mmap */
--- linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/file.c.orig
+++ linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/file.c
@@ -1006,12 +1006,9 @@
 
 	/* clear MOVED tag for all found pages */
 	for (i = 0; i < pagevec_count(&pvec); i++) {
-		void *p;
-
 		page_cache_get(pvec.pages[i]);
-		p = radix_tree_tag_clear(&mapping->page_tree, pvec.pages[i]->index,
-					 PAGECACHE_TAG_REISER4_MOVED);
-		assert("vs-49", p == pvec.pages[i]);
+		radix_tree_tag_clear(&mapping->page_tree, pvec.pages[i]->index,
+				     PAGECACHE_TAG_REISER4_MOVED);
 	}
 	write_unlock_irq(&mapping->tree_lock);
 
--- linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/file_conversion.c.orig
+++ linux-2.6.24-rc6-mm1/fs/reiser4/plugin/file/file_conversion.c
@@ -4,8 +4,8 @@
 /* *
  * This file contains a converter cryptcompress->unix_file, and O(1)-heuristic,
  * which allows to assign for a regular file the most reasonable plugin to be
- * managed by. Note, that we don't use back conversion because of compatibility
- * reasons (see http://dev.namesys.com/Version4.X.Y for details).
+ * managed by. Note, that we don't perform back conversion because of
+ * compatibility reasons (see http://dev.namesys.com/Version4.X.Y for details).
  *
  * Currently used heuristic is very simple: if first complete logical cluster
  * (64K by default) of a file is incompressible, then we make a decision, that
@@ -17,12 +17,37 @@
  * The conversion is accompanied by rebuilding disk structures of a file, so it
  * is important to protect them from being interacted with other plugins which
  * don't expect them to be in such inconsistent state. For this to be protected
- * we serialize readers and writers of pset. Writers are the processes which can
- * change it with conversion purposes; other ones are readers. Serialization is
- * performed via acquiring per-inode rw-semaphore (conv_sem).
+ * we serialize readers and writers of a file's conversion set (FCS).
  *
- * (*)  This heuristic can be easily changed as soon as we have a new,
- *      better one.
+ * We define FCS as a file plugin id installed in inode's pset all structures
+ * specific for this id (like stat-data, etc. items). Note, that FCS is defined
+ * per file.
+ * FCS reader is defined as a set of instruction of the following type:
+ * inode_file_plugin(inode)->method();
+ * FCS writer is a set of instructions that perform file plugin conversion
+ * (convert items, update pset, etc).
+ * Example:
+ * reiser4_write_careful() supplied to VFS as a ->write() file operation is
+ * composed of the following (optional) instructions:
+ *             1              2                         3
+ * *********************** ####### -------------------------------------------->
+ *
+ * 1) "****" are instructions performed on behalf of cryptcompress file plugin;
+ * 2) "####" is a FCS writer (performing a conversion cryptcompress->unix_file);
+ * 3) "----" are instructions performed on behalf of unix_file plugin;
+ * Here (1) and (3) are FCS readers.
+ *
+ * In this example FCS readers and writers are already serialized (by design),
+ * however there can be readers and writers executing at the same time in
+ * different contexts, so we need a common mechanism of serialization.
+ *
+ * Currently serialization of FCS readers and writers is performed via acquiring
+ * a special per-inode rw-semaphore (conv_sem). And yes, {down, up}_read is for
+ * FCS readers, and  {down, up}_write is for FCS writers, see the macros below
+ * for passive/active protection.
+ *
+ * ---
+ * (*)  This heuristic can be changed to a better one (benchmarking is needed).
  * (**) Such solution allows to keep enable/disable state on disk.
  */
 
@@ -50,8 +75,15 @@
  * protection for writers. All methods with active or passive protection
  * has suffix "careful".
  */
-/* Macro for passive protection.
-   method_foo contains only readers */
+/**
+ * Macros for passive protection.
+ *
+ * Construct invariant operation to be supplied to VFS.
+ * The macro accepts the following lexemes:
+ * @type - type of the value represented by the compound statement;
+ * @method - name of an operation to be supplied to VFS (reiser4 file
+ * plugin also should contain a method with such name).
+ */
 #define PROT_PASSIVE(type, method, args)				\
 ({							                \
 	type _result;							\
@@ -63,11 +95,7 @@
 		if (!should_protect(inode))				\
 			up_read(guard);					\
 	}								\
-	if (inode_file_plugin(inode) ==					\
-	    file_plugin_by_id(UNIX_FILE_PLUGIN_ID))			\
-		_result = method ## _unix_file args;			\
-	else								\
-		_result = method ## _cryptcompress args;		\
+	_result = inode_file_plugin(inode)->method args;		\
 	if (should_protect(inode))					\
 		up_read(guard);						\
 	_result;							\
@@ -83,28 +111,29 @@
 		if (!should_protect(inode))				\
 			up_read(guard);					\
 	}								\
-	if (inode_file_plugin(inode) ==					\
-	    file_plugin_by_id(UNIX_FILE_PLUGIN_ID))			\
-		method ## _unix_file args;				\
-	else								\
-		method ## _cryptcompress args;				\
+	inode_file_plugin(inode)->method args;				\
+									\
 	if (should_protect(inode))					\
 		up_read(guard);						\
 })
 
 /**
- * Macro for active protection.
- * active_expr contains writers of pset;
- * NOTE: after evaluating active_expr conversion should be disabled.
+ * This macro is for invariant methods which can be decomposed
+ * into "active expression" that goes first and contains pset
+ * writers (and, hence, needs serialization), and generic plugin
+ * method which doesn't need serialization.
+ *
+ * The macro accepts the following lexemes:
+ * @type - type of the value represented by the compound statement;
+ * @method - name of invariant operation supplied to VFS;
+ * @active_expr - name of "active expression", usually some O(1) -
+ * heuristic for disabling a conversion.
  */
 #define PROT_ACTIVE(type, method, args, active_expr)			\
 ({	                 						\
 	type _result = 0;						\
 	struct rw_semaphore * guard =					\
 		&reiser4_inode_data(inode)->conv_sem;			\
-	reiser4_context * ctx =	reiser4_init_context(inode->i_sb);	\
-	if (IS_ERR(ctx))						\
-		return PTR_ERR(ctx);					\
 									\
 	if (should_protect(inode)) {					\
 		down_write(guard);					\
@@ -112,15 +141,7 @@
 			_result = active_expr;				\
 		up_write(guard);					\
 	}								\
-	if (_result == 0) {						\
-		if (inode_file_plugin(inode) ==				\
-		    file_plugin_by_id(UNIX_FILE_PLUGIN_ID))		\
-			_result =  method ## _unix_file args;		\
-		else							\
-			_result =  method ## _cryptcompress args;	\
-	}								\
-	reiser4_exit_context(ctx);					\
-	_result;							\
+	_result = inode_file_plugin(inode)->method args;                \
 })
 
 /* Pass management to the unix-file plugin with "notail" policy */
@@ -547,7 +568,8 @@
  */
 
 /*
- * Reiser4 write "careful" method.  Write a file in 2 steps:
+ * Reiser4 invariant ->write() method supplied to VFS.
+ * Write a file in 2 steps:
  *  . start write with initial file plugin,
  *    switch to a new (more resonable) file plugin (if any);
  *  . finish write with the new plugin.
@@ -564,8 +586,9 @@
 
 	/**
 	 * First step.
-	 * Sanity check: if conversion is possible,
-	 * then protect pset.
+	 * Check, if conversion is possible.
+	 * If yes, then ->write() method contains pset
+	 * writers, so active protection is required.
 	 */
 	if (should_protect(inode)) {
 		prot = 1;
@@ -574,15 +597,16 @@
 	written_old = inode_file_plugin(inode)->write(file,
 						      buf,
 						      count,
-						      off, &conv);
+						      off,
+						      &conv);
 	if (prot)
 		up_write(guard);
 	if (written_old < 0 || conv == 0)
 		return written_old;
 	/**
 	 * Conversion occurred.
-	 * Back conversion is impossible,
-	 * so don't protect at this step.
+	 * Back conversion is impossible, so at
+	 * this step protection is not required.
 	 */
 	assert("edward-1532",
 	       inode_file_plugin(inode) ==
@@ -591,15 +615,23 @@
 	written_new = inode_file_plugin(inode)->write(file,
 						      buf + written_old,
 						      count - written_old,
-						      off, NULL);
+						      off,
+						      NULL);
 	return written_old + (written_new < 0 ? 0 : written_new);
 }
 
 int reiser4_setattr_careful(struct dentry *dentry, struct iattr *attr)
 {
+	int result;
 	struct inode * inode = dentry->d_inode;
-	return PROT_ACTIVE(int, setattr, (dentry, attr),
-			   setattr_conversion_hook(inode, attr));
+	reiser4_context * ctx =	reiser4_init_context(inode->i_sb);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	result = PROT_ACTIVE(int, setattr, (dentry, attr),
+			     setattr_conversion_hook(inode, attr));
+	reiser4_exit_context(ctx);
+	return result;
 }
 
 /* Wrappers with passive protection for:

--------------000303040102040203030307--
