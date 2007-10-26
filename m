From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 73/8] plugin/fibration.h cleanup
Date: Fri, 26 Oct 2007 15:44:43 +0200
Message-ID: <1193406283.4615.45.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-IrSjSFcwgIS/fjxnui04"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-IrSjSFcwgIS/fjxnui04
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig	total: 3 errors, 2 warnings, 37 lines checked
patched:total: 0 errors, 2 warnings, 37 lines checked
leftover:

WARNING: do not add new typedefs
#11: FILE: fibration.h:11:
+typedef struct fibration_plugin {

WARNING: do not add new typedefs
#18: FILE: fibration.h:18:
+typedef enum {



--=-IrSjSFcwgIS/fjxnui04
Content-Disposition: attachment; filename=fibration.h.patch
Content-Type: text/x-patch; name=fibration.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- fibration.h.orig	2007-10-26 15:41:53.000000000 +0200
+++ fibration.h	2007-10-26 15:43:17.000000000 +0200
@@ -3,7 +3,7 @@
 /* Fibration plugin used by hashed directory plugin to segment content
  * of directory. See fs/reiser4/plugin/fibration.c for more on this. */
 
-#if !defined( __FS_REISER4_PLUGIN_FIBRATION_H__ )
+#if !defined(__FS_REISER4_PLUGIN_FIBRATION_H__)
 #define __FS_REISER4_PLUGIN_FIBRATION_H__
 
 #include "plugin_header.h"
@@ -12,7 +12,7 @@ typedef struct fibration_plugin {
 	/* generic fields */
 	plugin_header h;
 
-	 __u64(*fibre) (const struct inode * dir, const char *name, int len);
+	 __u64(*fibre) (const struct inode *dir, const char *name, int len);
 } fibration_plugin;
 
 typedef enum {

--=-IrSjSFcwgIS/fjxnui04--

