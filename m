From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 24/8] forward.h cleanup
Date: Wed, 24 Oct 2007 14:44:05 +0200
Message-ID: <1193229845.24225.15.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-INp45KgI/cn6IBRVLYQK"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-INp45KgI/cn6IBRVLYQK
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 8 errors, 64 warnings, 252 lines checked
patched:total: 0 errors, 56 warnings, 256 lines checked

These 56 warnings are all new typedefs. I'm not good enough to fix it
correctly.

--=-INp45KgI/cn6IBRVLYQK
Content-Disposition: attachment; filename=forward.h.patch
Content-Type: text/x-patch; name=forward.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- forward.h.orig	2007-10-24 14:36:29.000000000 +0200
+++ forward.h	2007-10-24 14:41:25.000000000 +0200
@@ -1,8 +1,9 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+   reiser4/README */
 
 /* Forward declarations. Thank you Kernighan. */
 
-#if !defined( __REISER4_FORWARD_H__ )
+#if !defined(__REISER4_FORWARD_H__)
 #define __REISER4_FORWARD_H__
 
 #include <asm/errno.h>
@@ -73,8 +74,10 @@ typedef enum {
 typedef enum {
 	FILE_NAME_FOUND = 0,
 	FILE_NAME_NOTFOUND = -ENOENT,
-	FILE_IO_ERROR = -EIO,	/* FIXME: it seems silly to have special OOM, IO_ERROR return codes for each search. */
-	FILE_OOM = -ENOMEM	/* FIXME: it seems silly to have special OOM, IO_ERROR return codes for each search. */
+	FILE_IO_ERROR = -EIO,	/* FIXME: it seems silly to have special OOM,
+				   IO_ERROR return codes for each search. */
+	FILE_OOM = -ENOMEM	/* FIXME: it seems silly to have special OOM,
+				   IO_ERROR return codes for each search. */
 } file_lookup_result;
 
 /* behaviors of lookup. If coord we are looking for is actually in a tree,
@@ -131,9 +134,10 @@ typedef enum {
 	ZNODE_LOCK_LOPRI = 0,
 	ZNODE_LOCK_HIPRI = (1 << 0),
 
-	/* By setting the ZNODE_LOCK_NONBLOCK flag in a lock request the call to longterm_lock_znode will not sleep
-	   waiting for the lock to become available.  If the lock is unavailable, reiser4_znode_lock will immediately
-	   return the value -E_REPEAT. */
+	/* By setting the ZNODE_LOCK_NONBLOCK flag in a lock request the call to
+	   longterm_lock_znode will not sleep waiting for the lock to become
+	   available.  If the lock is unavailable, reiser4_znode_lock will
+	   immediately return the value -E_REPEAT. */
 	ZNODE_LOCK_NONBLOCK = (1 << 1),
 	/* An option for longterm_lock_znode which prevents atom fusion */
 	ZNODE_LOCK_DONT_FUSE = (1 << 2)
@@ -152,9 +156,9 @@ typedef enum {
 	RIGHT_SIDE
 } sideof;
 
-#define round_up( value, order )						\
-	( ( typeof( value ) )( ( ( long ) ( value ) + ( order ) - 1U ) &	\
-			     ~( ( order ) - 1 ) ) )
+#define round_up(value, order)						\
+	((typeof(value))(((long) (value) + (order) - 1U) &	\
+			     ~((order) - 1)))
 
 /* values returned by squalloc_right_neighbor and its auxiliary functions */
 typedef enum {
@@ -182,8 +186,8 @@ typedef enum {
 	LAST_ITEM_ID = 0x9
 } item_id;
 
-/* Flags passed to jnode_flush() to allow it to distinguish default settings based on
-   whether commit() was called or VM memory pressure was applied. */
+/* Flags passed to jnode_flush() to allow it to distinguish default settings
+   based on whether commit() was called or VM memory pressure was applied. */
 typedef enum {
 	/* submit flush queue to disk at jnode_flush completion */
 	JNODE_FLUSH_WRITE_BLOCKS = 1,

--=-INp45KgI/cn6IBRVLYQK--

