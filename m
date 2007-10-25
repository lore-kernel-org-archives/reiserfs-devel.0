From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 55/8] super_ops.c cleanup
Date: Thu, 25 Oct 2007 18:58:42 +0200
Message-ID: <1193331522.15901.87.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-LQKnnboqATlC7w/jvFWb"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-LQKnnboqATlC7w/jvFWb
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 23 errors, 3 warnings, 725 lines checked
patched:total: 21 errors, 1 warnings, 726 lines checked
leftovers:

ERROR: do not initialise statics to 0 or NULL
#19: FILE: super_ops.c:19:
+static struct dentry *reiser4_debugfs_root = NULL;

ERROR: do not use assignment in if condition
#486: FILE: super_ops.c:486:
+       if ((result = reiser4_init_fs_info(super)) != 0)

ERROR: do not use assignment in if condition
#491: FILE: super_ops.c:491:
+       if ((result = reiser4_init_super_data(super, data)) != 0)

ERROR: do not use assignment in if condition
#495: FILE: super_ops.c:495:
+       if ((result = reiser4_init_read_super(super, silent)) != 0)

ERROR: do not use assignment in if condition
#502: FILE: super_ops.c:502:
+       if ((result = reiser4_init_ktxnmgrd(super)) != 0)

ERROR: do not use assignment in if condition
#506: FILE: super_ops.c:506:
+       if ((result = reiser4_init_entd(super)) != 0)

ERROR: do not use assignment in if condition
#510: FILE: super_ops.c:510:
+       if ((result = reiser4_init_formatted_fake(super)) != 0)

ERROR: do not use assignment in if condition
#514: FILE: super_ops.c:514:
+       if ((result =
get_super_private(super)->df_plug->init_format(super,

ERROR: do not use assignment in if condition
#527: FILE: super_ops.c:527:
+       if ((result = reiser4_init_root_inode(super)) != 0)

WARNING: line over 80 characters
#530: FILE: super_ops.c:530:
+       if ((result =
get_super_private(super)->df_plug->version_update(super)) != 0)

ERROR: do not use assignment in if condition
#530: FILE: super_ops.c:530:
+       if ((result =
get_super_private(super)->df_plug->version_update(super)) != 0)

ERROR: do not use assignment in if condition
#617: FILE: super_ops.c:617:
+       if ((result = init_inodes()) != 0)

ERROR: do not use assignment in if condition
#621: FILE: super_ops.c:621:
+       if ((result = init_znodes()) != 0)

ERROR: do not use assignment in if condition
#625: FILE: super_ops.c:625:
+       if ((result = init_plugins()) != 0)

ERROR: do not use assignment in if condition
#629: FILE: super_ops.c:629:
+       if ((result = init_plugin_set()) != 0)

ERROR: do not use assignment in if condition
#633: FILE: super_ops.c:633:
+       if ((result = init_txnmgr_static()) != 0)

ERROR: do not use assignment in if condition
#637: FILE: super_ops.c:637:
+       if ((result = init_jnodes()) != 0)

ERROR: do not use assignment in if condition
#641: FILE: super_ops.c:641:
+       if ((result = reiser4_init_fqs()) != 0)

ERROR: do not use assignment in if condition
#645: FILE: super_ops.c:645:
+       if ((result = reiser4_init_dentry_fsdata()) != 0)

ERROR: do not use assignment in if condition
#649: FILE: super_ops.c:649:
+       if ((result = reiser4_init_file_fsdata()) != 0)

ERROR: do not use assignment in if condition
#656: FILE: super_ops.c:656:
+       if ((result = reiser4_init_d_cursor()) != 0)

ERROR: do not use assignment in if condition
#659: FILE: super_ops.c:659:
+       if ((result = register_filesystem(&reiser4_fs_type)) == 0) {



--=-LQKnnboqATlC7w/jvFWb
Content-Disposition: attachment; filename=super_ops.c.patch
Content-Type: text/x-patch; name=super_ops.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- super_ops.c.orig	2007-10-25 18:51:49.000000000 +0200
+++ super_ops.c	2007-10-25 18:55:28.000000000 +0200
@@ -55,7 +55,7 @@ static void init_once(void *obj, struct 
 /**
  * init_inodes - create znode cache
  *
- * Initializes slab cache of inodes. It is part of reiser4 module initialization.
+ * Initializes slab cache of inodes. It is part of reiser4 module initialization
  */
 static int init_inodes(void)
 {
@@ -511,7 +511,8 @@ static int fill_super(struct super_block
 		goto failed_init_formatted_fake;
 
 	/* initialize disk format plugin */
-	if ((result = get_super_private(super)->df_plug->init_format(super, data)) != 0 )
+	if ((result = get_super_private(super)->df_plug->init_format(super,
+								    data)) != 0)
 		goto failed_init_disk_format;
 
 	/*
@@ -526,7 +527,7 @@ static int fill_super(struct super_block
 	if ((result = reiser4_init_root_inode(super)) != 0)
 		goto failed_init_root_inode;
 
-	if ((result = get_super_private(super)->df_plug->version_update(super)) != 0 )
+	if ((result = get_super_private(super)->df_plug->version_update(super)) != 0)
 		goto failed_update_format_version;
 
 	process_safelinks(super);

--=-LQKnnboqATlC7w/jvFWb--

