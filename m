From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] reiser4progs: version-1.0.9
Date: Sun, 29 Jun 2014 01:10:11 +0200
Message-ID: <53AF4B53.80404@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070506090307020501030703"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=XrlH+cmxbi57jCiGJR20C4qo7SsC2Mv77wq2VQ/4ddQ=;
        b=PbC64Nq45vOCrcqjyDFzqmFUGokjV7cgEWjQX30n8NU6PZu11/wi9K4Qy2MhNa0hGD
         tUjEZ5oYvVsm8ZZzt4ef6+7AYnERLkNqOINUkNQjO6HIlYQj70tDYNBL62UZ+QIrNPu2
         bY80n1xeC71YvxJI6IiqBy8WWG96A94ZXAnWEC2YoVKU1PeSdx/tR4aNRWVSXOPDCAlg
         YHc6SQY3zDlprw8lkSZEfnAETA5q5ibqAmyViyLA15Hs6hafDplF4xFf2R50ORTt/w8U
         QFu/Hqlpg/W7VYCxHHwIs4G4r/SaYDGFfPdObjgAzLiCchql2c+xsSs2XetyfL5VAMrk
         d8Jg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------070506090307020501030703
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------070506090307020501030703
Content-Type: text/x-patch;
 name="reiser4progs-version-1.0.9.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4progs-version-1.0.9.patch"

Index: reiser4progs-1.0.8/CREDITS
===================================================================
--- reiser4progs-1.0.8.orig/CREDITS
+++ reiser4progs-1.0.8/CREDITS
@@ -71,3 +71,6 @@ is just amazing to watch his talent for
 
 Edward Shishkin wrote cryptcompress file plugin and other plugins
 related to transparent crypto and compression support.
+
+Ivan Shapovalov (aka Intelfx) implemented discard support, which is
+useful for solid-state drives (SSDs).
Index: reiser4progs-1.0.8/ChangeLog
===================================================================
--- reiser4progs-1.0.8.orig/ChangeLog
+++ reiser4progs-1.0.8/ChangeLog
@@ -6,6 +6,23 @@ reiser4progs/COPYING.
 This file may be modified and/or distributed without restriction. This is
 not an invitation to misrepresent the history of reiser4progs.
 
+2014-06-28
+	1.0.9 version
+2014-06-28
+	discard option to mkfs -- discard device at filesystem creation
+	time (for SSD drives)
+
+	Fixup in librepair/twig_scan.c: cb_item_region_check().
+2013-05-03
+	1.0.8 version
+2013-05-03
+	Fixups in fsck.reiser4: repair a special kind of corruptions
+	appeared due to software bugs in earlier kernels.
+
+	mkfs.reiser4 now enables intelligent compression with lzo1
+	algorithm by default. If you want to create reiser4 without
+	compression, then override the default plugin set with the
+	"-o create=reg40" option.
 2008-01-09
 	1.0.7 version.
 2008-01-09
Index: reiser4progs-1.0.8/doc/mkfs.reiser4.8
===================================================================
--- reiser4progs-1.0.8.orig/doc/mkfs.reiser4.8
+++ reiser4progs-1.0.8/doc/mkfs.reiser4.8
@@ -52,6 +52,10 @@ universally unique identifier to be used
 .TP
 .B -s, --lost-found
 forces mkfs to create lost+found directory.
+.TP
+.B -d, --discard
+tells mkfs to discard given device before creating the filesystem (for
+solid state drives).
 .SH PLUGIN OPTIONS
 .TP
 .B -p, --print-profile
Index: reiser4progs-1.0.8/configure.in
===================================================================
--- reiser4progs-1.0.8.orig/configure.in
+++ reiser4progs-1.0.8/configure.in
@@ -15,7 +15,7 @@ AH_TEMPLATE([LIBREISER4_MIN_INTERFACE_VE
 
 LIBREISER4_MAJOR_VERSION=1
 LIBREISER4_MINOR_VERSION=0
-LIBREISER4_MICRO_VERSION=8
+LIBREISER4_MICRO_VERSION=9
 
 LIBREISER4_INTERFACE_AGE=0
 LIBREISER4_BINARY_AGE=0
@@ -432,7 +432,7 @@ AC_CHECK_SIZEOF(off_t, 64, [
 ])
 
 OLD_LIBS="$LIBS"
-AC_CHECK_LIBAAL(aal, 1.0.5, ,exit)
+AC_CHECK_LIBAAL(aal, 1.0.6, ,exit)
 AAL_LIBS="$LIBS"
 LIBS="$OLD_LIBS"
 
@@ -440,7 +440,7 @@ AC_SUBST(AAL_LIBS)
 
 if test x$enable_libminimal = xyes; then
     	OLD_LIBS="$LIBS"
-    	AC_CHECK_LIBAAL(aal-minimal, 1.0.5, ,exit)
+    	AC_CHECK_LIBAAL(aal-minimal, 1.0.6, ,exit)
     	AAL_MINIMAL_LIBS="$LIBS"
     	LIBS="$OLD_LIBS"
Index: reiser4progs-1.0.8/librepair/twig_scan.c
===================================================================
--- reiser4progs-1.0.8.orig/librepair/twig_scan.c
+++ reiser4progs-1.0.8/librepair/twig_scan.c
@@ -19,7 +19,7 @@ static errno_t cb_item_region_check(blk_
 	/* This must be fixed at the first pass. */
 	if (start >= ts->bm_met->total || 
 	    count > ts->bm_met->total ||
-	    start >= ts->bm_met->total - count)
+	    start > ts->bm_met->total - count)
 	{
 		ts->stat.bad_unfm_ptrs++;
 		return RE_FATAL;

--------------070506090307020501030703--
