From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 52/8] status_flags.h cleanup
Date: Thu, 25 Oct 2007 17:09:28 +0200
Message-ID: <1193324968.15901.73.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-wL+jMwikANM1rg1+1vAg"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-wL+jMwikANM1rg1+1vAg
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 3 errors, 3 warnings, 43 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-wL+jMwikANM1rg1+1vAg
Content-Disposition: attachment; filename=status_flags.h.patch
Content-Type: text/x-patch; name=status_flags.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- status_flags.h.orig	2007-10-25 17:05:24.000000000 +0200
+++ status_flags.h	2007-10-25 17:08:19.000000000 +0200
@@ -5,7 +5,7 @@
    The status that helps us to find out if the filesystem is valid or if it
    contains some critical, or not so critical errors */
 
-#if !defined( __REISER4_STATUS_FLAGS_H__ )
+#if !defined(__REISER4_STATUS_FLAGS_H__)
 #define __REISER4_STATUS_FLAGS_H__
 
 #include "dformat.h"
@@ -29,14 +29,18 @@
 struct reiser4_status {
 	char magic[16];
 	d64 status;		/* Current FS state */
-	d64 extended_status;	/* Any additional info that might have sense in addition to "status". E.g.
-				   last sector where io error happened if status is "io error encountered" */
+	d64 extended_status;	/* Any additional info that might have sense in
+				 * addition to "status". E.g. last sector where
+				 * io error happened if status is
+				 * "io error encountered" */
 	d64 stacktrace[10];	/* Last ten functional calls made (addresses) */
-	char texterror[REISER4_TEXTERROR_LEN];	/* Any error message if appropriate, otherwise filled with zeroes */
+	char texterror[REISER4_TEXTERROR_LEN];	/* Any error message if
+						 * appropriate, otherwise filled
+						 * with zeroes */
 };
 
 int reiser4_status_init(reiser4_block_nr block);
-int reiser4_status_query(u64 * status, u64 * extended);
+int reiser4_status_query(u64 *status, u64 *extended);
 int reiser4_status_write(u64 status, u64 extended_status, char *message);
 int reiser4_status_finish(void);
 

--=-wL+jMwikANM1rg1+1vAg--

