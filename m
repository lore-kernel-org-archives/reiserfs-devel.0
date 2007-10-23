From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 3/8] block_alloc.h cleanup
Date: Tue, 23 Oct 2007 14:11:22 +0200
Message-ID: <1193141482.6236.38.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-T9qZ+lf1wun21Nhuq+7J"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-T9qZ+lf1wun21Nhuq+7J
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- block_alloc.h.orig	2007-10-23 12:04:28.000000000 +0200
+++ block_alloc.h	2007-10-23 12:08:30.000000000 +0200
@@ -1,6 +1,6 @@
 /* Copyright 2002, 2003 by Hans Reiser, licensing governed by
reiser4/README */
 
-#if !defined (__FS_REISER4_BLOCK_ALLOC_H__)
+#if !defined(__FS_REISER4_BLOCK_ALLOC_H__)
 #define __FS_REISER4_BLOCK_ALLOC_H__
 
 #include "dformat.h"
@@ -9,9 +9,11 @@
 #include <linux/types.h>	/* for __u??  */
 #include <linux/fs.h>
 
-/* Mask when is applied to given block number shows is that block
number is a fake one */
+/* Mask when is applied to given block number shows is that block
number is a
+   fake one */
 #define REISER4_FAKE_BLOCKNR_BIT_MASK   0x8000000000000000ULL
-/* Mask which isolates a type of object this fake block number was
assigned to */
+/* Mask which isolates a type of object this fake block number was
assigned
+   to */
 #define REISER4_BLOCKNR_STATUS_BIT_MASK 0xC000000000000000ULL
 
 /*result after applying the REISER4_BLOCKNR_STATUS_BIT_MASK should be
compared
@@ -35,9 +37,9 @@ typedef enum {
 
 /* a hint for block allocator */
 struct reiser4_blocknr_hint {
-	/* FIXME: I think we want to add a longterm lock on the bitmap block
here.  This
-	   is to prevent jnode_flush() calls from interleaving allocations on
the same
-	   bitmap, once a hint is established. */
+	/* FIXME: I think we want to add a longterm lock on the bitmap block
+	   here. This is to prevent jnode_flush() calls from interleaving
+	   allocations on the same bitmap, once a hint is established. */
 
 	/* search start hint */
 	reiser4_block_nr blk;
@@ -69,8 +71,8 @@ enum reiser4_ba_flags {
 	/* defer actual block freeing until transaction commit */
 	BA_DEFER = (1 << 3),
 
-	/* allocate blocks for permanent fs objects (formatted or
unformatted), not
-	   wandered of log blocks */
+	/* allocate blocks for permanent fs objects (formatted or
unformatted),
+	    not wandered of log blocks */
 	BA_PERMANENT = (1 << 4),
 
 	/* grab space even it was disabled */
@@ -97,7 +99,7 @@ reiser4_block_nr fake_blocknr_unformatte
 
 int reiser4_grab_space(__u64 count, reiser4_ba_flags_t flags);
 void all_grabbed2free(void);
-void grabbed2free(reiser4_context *, reiser4_super_info_data *, __u64
count);
+void grabbed2free(reiser4_context * , reiser4_super_info_data * , __u64
count);
 void fake_allocated2free(__u64 count, reiser4_ba_flags_t flags);
 void grabbed2flush_reserved_nolock(txn_atom * atom, __u64 count);
 void grabbed2flush_reserved(__u64 count);

--=-T9qZ+lf1wun21Nhuq+7J
Content-Disposition: attachment; filename=block_alloc.h.patch
Content-Type: text/x-patch; name=block_alloc.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- block_alloc.h.orig	2007-10-23 12:04:28.000000000 +0200
+++ block_alloc.h	2007-10-23 12:08:30.000000000 +0200
@@ -1,6 +1,6 @@
 /* Copyright 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
 
-#if !defined (__FS_REISER4_BLOCK_ALLOC_H__)
+#if !defined(__FS_REISER4_BLOCK_ALLOC_H__)
 #define __FS_REISER4_BLOCK_ALLOC_H__
 
 #include "dformat.h"
@@ -9,9 +9,11 @@
 #include <linux/types.h>	/* for __u??  */
 #include <linux/fs.h>
 
-/* Mask when is applied to given block number shows is that block number is a fake one */
+/* Mask when is applied to given block number shows is that block number is a
+   fake one */
 #define REISER4_FAKE_BLOCKNR_BIT_MASK   0x8000000000000000ULL
-/* Mask which isolates a type of object this fake block number was assigned to */
+/* Mask which isolates a type of object this fake block number was assigned
+   to */
 #define REISER4_BLOCKNR_STATUS_BIT_MASK 0xC000000000000000ULL
 
 /*result after applying the REISER4_BLOCKNR_STATUS_BIT_MASK should be compared
@@ -35,9 +37,9 @@ typedef enum {
 
 /* a hint for block allocator */
 struct reiser4_blocknr_hint {
-	/* FIXME: I think we want to add a longterm lock on the bitmap block here.  This
-	   is to prevent jnode_flush() calls from interleaving allocations on the same
-	   bitmap, once a hint is established. */
+	/* FIXME: I think we want to add a longterm lock on the bitmap block
+	   here. This is to prevent jnode_flush() calls from interleaving
+	   allocations on the same bitmap, once a hint is established. */
 
 	/* search start hint */
 	reiser4_block_nr blk;
@@ -69,8 +71,8 @@ enum reiser4_ba_flags {
 	/* defer actual block freeing until transaction commit */
 	BA_DEFER = (1 << 3),
 
-	/* allocate blocks for permanent fs objects (formatted or unformatted), not
-	   wandered of log blocks */
+	/* allocate blocks for permanent fs objects (formatted or unformatted),
+	    not wandered of log blocks */
 	BA_PERMANENT = (1 << 4),
 
 	/* grab space even it was disabled */
@@ -97,7 +99,7 @@ reiser4_block_nr fake_blocknr_unformatte
 
 int reiser4_grab_space(__u64 count, reiser4_ba_flags_t flags);
 void all_grabbed2free(void);
-void grabbed2free(reiser4_context *, reiser4_super_info_data *, __u64 count);
+void grabbed2free(reiser4_context * , reiser4_super_info_data * , __u64 count);
 void fake_allocated2free(__u64 count, reiser4_ba_flags_t flags);
 void grabbed2flush_reserved_nolock(txn_atom * atom, __u64 count);
 void grabbed2flush_reserved(__u64 count);

--=-T9qZ+lf1wun21Nhuq+7J--

