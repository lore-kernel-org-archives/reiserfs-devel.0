From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 33/8] kassign.h cleanup
Date: Thu, 25 Oct 2007 01:24:55 +0200
Message-ID: <1193268295.24225.60.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-zgEY3w6ssdAjtsH3c6Sd"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-zgEY3w6ssdAjtsH3c6Sd
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 2 errors, 2 warnings, 110 lines checked
patched:total: 0 errors, 2 warnings, 110 lines checked
leftover:

WARNING: do not add new typedefs
#45: FILE: kassign.h:45:
+typedef struct obj_key_id {

WARNING: do not add new typedefs
#58: FILE: kassign.h:58:
+typedef struct de_id {




--=-zgEY3w6ssdAjtsH3c6Sd
Content-Disposition: attachment; filename=kassign.h.patch
Content-Type: text/x-patch; name=kassign.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- kassign.h.orig	2007-10-25 01:21:51.000000000 +0200
+++ kassign.h	2007-10-25 01:23:28.000000000 +0200
@@ -3,7 +3,7 @@
 
 /* Key assignment policy interface. See kassign.c for details. */
 
-#if !defined( __KASSIGN_H__ )
+#if !defined(__KASSIGN_H__)
 #define __KASSIGN_H__
 
 #include "forward.h"

--=-zgEY3w6ssdAjtsH3c6Sd--

