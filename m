From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 74/8] plugin/plugin_set.h
Date: Fri, 26 Oct 2007 15:48:42 +0200
Message-ID: <1193406522.4615.49.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-3FyunFDifq5OSvMZL6+1"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-3FyunFDifq5OSvMZL6+1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 2 errors, 2 warnings, 77 lines checked
patched:total: 0 errors, 1 warnings, 78 lines checked
leftover:

WARNING: do not add new typedefs
#16: FILE: plugin_set.h:16:
+typedef struct plugin_set plugin_set;



--=-3FyunFDifq5OSvMZL6+1
Content-Disposition: attachment; filename=plugin_set.h.patch
Content-Type: text/x-patch; name=plugin_set.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- plugin_set.h.orig	2007-10-26 15:45:34.000000000 +0200
+++ plugin_set.h	2007-10-26 15:47:02.000000000 +0200
@@ -1,9 +1,10 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
 
 /* Reiser4 plugin set definition.
    See fs/reiser4/plugin/plugin_set.c for details */
 
-#if !defined( __PLUGIN_SET_H__ )
+#if !defined(__PLUGIN_SET_H__)
 #define __PLUGIN_SET_H__
 
 #include "../type_safe_hash.h"

--=-3FyunFDifq5OSvMZL6+1--

