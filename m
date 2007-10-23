From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 17/8] dscale.h cleanup
Date: Tue, 23 Oct 2007 16:37:46 +0200
Message-ID: <1193150266.6236.85.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-0CUo554MUTQiVK01Adhg"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-0CUo554MUTQiVK01Adhg
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-0CUo554MUTQiVK01Adhg
Content-Disposition: attachment; filename=dscale.h.patch
Content-Type: text/x-patch; name=dscale.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- dscale.h.orig	2007-10-23 16:35:31.000000000 +0200
+++ dscale.h	2007-10-23 16:36:17.000000000 +0200
@@ -3,12 +3,12 @@
 
 /* Scalable on-disk integers. See dscale.h for details. */
 
-#if !defined( __FS_REISER4_DSCALE_H__ )
+#if !defined(__FS_REISER4_DSCALE_H__)
 #define __FS_REISER4_DSCALE_H__
 
 #include "dformat.h"
 
-extern int dscale_read(unsigned char *address, __u64 * value);
+extern int dscale_read(unsigned char *address, __u64 *value);
 extern int dscale_write(unsigned char *address, __u64 value);
 extern int dscale_bytes(__u64 value);
 extern int dscale_fit(__u64 value, __u64 other);

--=-0CUo554MUTQiVK01Adhg--

