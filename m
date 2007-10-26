From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 67/8] object.c cleanup
Date: Fri, 26 Oct 2007 13:57:54 +0200
Message-ID: <1193399874.4615.20.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-pKgBOdgwgsJYL4+D0pJN"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-pKgBOdgwgsJYL4+D0pJN
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 1 errors, 1 warnings, 516 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.

--=-pKgBOdgwgsJYL4+D0pJN
Content-Disposition: attachment; filename=object.c.patch
Content-Type: text/x-patch; name=object.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- object.c.orig	2007-10-26 13:54:50.000000000 +0200
+++ object.c	2007-10-26 13:56:07.000000000 +0200
@@ -210,7 +210,7 @@ file_plugin file_plugins[LAST_FILE_PLUGI
 			.pops = &file_plugin_ops,
 			.label = "symlink",
 			.desc = "symbolic link",
-			.linkage = {NULL,NULL}
+			.linkage = {NULL, NULL}
 		},
 		.inode_ops = {
 			.readlink = generic_readlink,
@@ -219,7 +219,8 @@ file_plugin file_plugins[LAST_FILE_PLUGI
 			.setattr = reiser4_setattr_common,
 			.getattr = reiser4_getattr_common
 		},
-		/* inode->i_fop of symlink is initialized by NULL in setup_inode_ops */
+		/* inode->i_fop of symlink is initialized by NULL in
+		 * setup_inode_ops */
 		.file_ops = {.owner = NULL},
 		.as_ops = {.writepage = NULL},
 

--=-pKgBOdgwgsJYL4+D0pJN--

