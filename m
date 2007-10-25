From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 48/8] safe_link.h
Date: Thu, 25 Oct 2007 16:27:41 +0200
Message-ID: <1193322461.15901.50.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-iMKUROSlqYnN0wzIAj7W"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-iMKUROSlqYnN0wzIAj7W
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 2 errors, 0 warnings, 29 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-iMKUROSlqYnN0wzIAj7W
Content-Disposition: attachment; filename=safe_link.h.patch
Content-Type: text/x-patch; name=safe_link.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- safe_link.h.orig	2007-10-25 16:24:34.000000000 +0200
+++ safe_link.h	2007-10-25 16:26:10.000000000 +0200
@@ -3,7 +3,7 @@
 
 /* Safe-links. See safe_link.c for details. */
 
-#if !defined( __FS_SAFE_LINK_H__ )
+#if !defined(__FS_SAFE_LINK_H__)
 #define __FS_SAFE_LINK_H__
 
 #include "tree.h"

--=-iMKUROSlqYnN0wzIAj7W--

