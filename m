From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 29/8] ioctl.h cleanup
Date: Thu, 25 Oct 2007 00:52:22 +0200
Message-ID: <1193266342.24225.44.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-2olSCTfnHTTt9JhMtj6e"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-2olSCTfnHTTt9JhMtj6e
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 4 errors, 0 warnings, 41 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-2olSCTfnHTTt9JhMtj6e
Content-Disposition: attachment; filename=ioctl.h.patch
Content-Type: text/x-patch; name=ioctl.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- ioctl.h.orig	2007-10-25 00:48:29.000000000 +0200
+++ ioctl.h	2007-10-25 00:50:16.000000000 +0200
@@ -1,7 +1,7 @@
 /* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
  * reiser4/README */
 
-#if !defined( __REISER4_IOCTL_H__ )
+#if !defined(__REISER4_IOCTL_H__)
 #define __REISER4_IOCTL_H__
 
 #include <linux/fs.h>
@@ -24,7 +24,7 @@
  * and its stat-data will be updated so that it will never be converted back
  * into tails again.
  */
-#define REISER4_IOC_UNPACK _IOW(0xCD,1,long)
+#define REISER4_IOC_UNPACK _IOW(0xCD, 1, long)
 
 /* __REISER4_IOCTL_H__ */
 #endif

--=-2olSCTfnHTTt9JhMtj6e--

