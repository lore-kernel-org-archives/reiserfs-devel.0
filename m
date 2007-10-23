From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 15/8] dformat.h cleanup
Date: Tue, 23 Oct 2007 16:14:52 +0200
Message-ID: <1193148892.6236.76.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- dformat.h.orig	2007-10-23 16:04:37.000000000 +0200
+++ dformat.h	2007-10-23 16:05:28.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Formats of on-disk data and conversion functions. */
 
@@ -10,7 +11,7 @@
    To declare fields of on-disk structures, use d8, d16, d32 and d64.
    d??tocpu() and cputod??() to convert. */
 
-#if !defined( __FS_REISER4_DFORMAT_H__ )
+#if !defined(__FS_REISER4_DFORMAT_H__)
 #define __FS_REISER4_DFORMAT_H__
 
 #include <asm/byteorder.h>
@@ -37,7 +38,7 @@ typedef __le64 reiser4_dblock_nr;
  *
  * Returns true if if disk addresses are the same
  */
-static inline int disk_addr_eq(const reiser4_block_nr *b1,
+static inline int disk_addr_eq(const reiser4_block_nr * b1,
 			       const reiser4_block_nr * b2)
 {
 	assert("nikita-1033", b1 != NULL);

