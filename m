From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 26/8] fsdata.h cleanup
Date: Wed, 24 Oct 2007 15:09:34 +0200
Message-ID: <1193231374.24225.26.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-63JOgFowHp/3j4c0vK3k"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-63JOgFowHp/3j4c0vK3k
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 2 errors, 3 warnings, 205 lines checked
patched:total: 0 errors, 2 warnings, 205 lines checked

2 warnings are typedefs

WARNING: do not add new typedefs
#95: FILE: fsdata.h:95:
+typedef struct reiser4_file_fsdata {

WARNING: do not add new typedefs
#143: FILE: fsdata.h:143:
+typedef struct dir_cursor dir_cursor;

--=-63JOgFowHp/3j4c0vK3k
Content-Disposition: attachment; filename=fsdata.h.patch
Content-Type: text/x-patch; name=fsdata.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- fsdata.h.orig	2007-10-24 15:04:49.000000000 +0200
+++ fsdata.h	2007-10-24 15:07:52.000000000 +0200
@@ -1,7 +1,7 @@
 /* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
  * reiser4/README */
 
-#if !defined( __REISER4_FSDATA_H__ )
+#if !defined(__REISER4_FSDATA_H__)
 #define __REISER4_FSDATA_H__
 
 #include "debug.h"
@@ -78,8 +78,8 @@ struct reiser4_dentry_fsdata {
 	 * stat-data.
 	 */
 	struct de_location dec;
-	int stateless;		/* created through reiser4_decode_fh, needs special
-				 * treatment in readdir. */
+	int stateless;		/* created through reiser4_decode_fh, needs
+				 * special treatment in readdir. */
 };
 
 extern int reiser4_init_dentry_fsdata(void);

--=-63JOgFowHp/3j4c0vK3k--

