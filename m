From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: ISATTY_BITS set on every file using ccreg40
Date: Mon, 17 Dec 2007 04:51:51 +0300
Message-ID: <4765D637.9090006@gmail.com>
References: <20071216232500.GA2314@efil.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030005090505080706000603"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071216232500.GA2314@efil.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ingo Bormuth <ibormuth@efil.de>, Dushan Tcholich <dusanc@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, rvalles <rvalles@es.gnu.org>

This is a multi-part message in MIME format.
--------------030005090505080706000603
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Ingo Bormuth wrote:

>Hi Edward,
>
>I just played around with reiser4's cryptcompress plugin
>an realized an odd behaviour.
>
>It seems, every file on any partition made with '-o ccreg40'
>has its SATTY_BITS set:
>  
>

Wow, it seems Ingo has found the culprit that confused Gentoo
manager.

I was inaccurate when introducing some dummy methods
to make file operations supplied for VFS invariant:
ioctl_cryptcompress should return -ENOSYS, otherwise userspace
application can make a wrong decision about file's nature.

Dushan, would you please check, if the attached patch really
fixes the python-prompt-problem?

Thanks to everyone!
Edward.

>$mkfs.reiser4 /dev/hdaXX
>$mount /dev/hdaXX /mnt/test
>$touch /mnt/test/x; exec 3<>/mnt/test/x; test -t 3 && echo T || echo F; exec 3>&-
>F
>$umount /mnt/test
>$mkfs.reiser4 -o create=ccreg40 /dev/hdaXX
>$mount /dev/hdaXX /mnt/test
>$touch /mnt/test/x; exec 3<>/mnt/test/x; test -t 3 && echo T || echo F; exec 3>&-
>T
>
>$mkfs.reiser4 -V
>mkfs.reiser4 1.0.6
>Copyright (C) 2001-2005 by Hans Reiser, licensing governed by reiser4progs/COPYING.
>
>$cat /proc/version
>Linux version 2.6.23.9-reiser4-r2 (gcc version 4.1.2) #1 PREEMPT Fri Dec 14 19:34:05 CET 2007
>
>
>Great performance andspace efficiency, no further problems, great job, btw.
>
>
>
>
>  
>


--------------030005090505080706000603
Content-Type: text/x-patch;
 name="reiser4-fixups.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fixups.patch"

Fix dummy ->ioctl() method for cryptcompress file plugin.
Drop some ifs.
Update comments.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 linux-2.6.24-rc3-mm2/fs/reiser4/plugin/file/cryptcompress.c   |    2 
 linux-2.6.24-rc3-mm2/fs/reiser4/plugin/file/file_conversion.c |   77 +++++-----
 2 files changed, 42 insertions(+), 37 deletions(-)

--- linux-2.6.24-rc3-mm2/fs/reiser4/plugin/file/file_conversion.c.orig
+++ linux-2.6.24-rc3-mm2/fs/reiser4/plugin/file/file_conversion.c
@@ -50,8 +50,13 @@
  * protection for writers. All methods with active or passive protection
  * has suffix "careful".
  */
-/* Macro for passive protection.
-   method_foo contains only readers */
+/**
+ * Macros for passive protection.
+ *
+ * The macro accepts the following lexemes:
+ * @type - type of the value represented by the compound statement;
+ * @method - invariant plugin method, which contains pset readers
+ */
 #define PROT_PASSIVE(type, method, args)				\
 ({							                \
 	type _result;							\
@@ -63,11 +68,7 @@
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
@@ -83,28 +84,29 @@
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
+ * @method - invariant plugin method, which contains pset writers;
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
@@ -112,15 +114,7 @@
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
@@ -547,7 +541,8 @@
  */
 
 /*
- * Reiser4 write "careful" method.  Write a file in 2 steps:
+ * Reiser4 invariant ->write() method supplied to VFS.
+ * Write a file in 2 steps:
  *  . start write with initial file plugin,
  *    switch to a new (more resonable) file plugin (if any);
  *  . finish write with the new plugin.
@@ -564,8 +559,9 @@
 
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
@@ -574,15 +570,16 @@
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
@@ -591,15 +588,23 @@
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
--- linux-2.6.24-rc3-mm2/fs/reiser4/plugin/file/cryptcompress.c.orig
+++ linux-2.6.24-rc3-mm2/fs/reiser4/plugin/file/cryptcompress.c
@@ -3627,7 +3627,7 @@
 int ioctl_cryptcompress(struct inode *inode, struct file *filp,
 			unsigned int cmd, unsigned long arg)
 {
-	return 0;
+	return RETERR(-ENOSYS);
 }
 
 /* plugin->mmap */

--------------030005090505080706000603--
