From: Frederik Himpe <fhimpe@vub.ac.be>
Subject: libaal patch fixing pointer cast warnings
Date: Wed, 11 Feb 2009 21:23:34 +0100
Message-ID: <1234383815.5099.3.camel@Anastacia.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-rT4AqwSl7rbVPI2ZFpAM"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--=-rT4AqwSl7rbVPI2ZFpAM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

When compiling aalib 1.0.5 on x86_64 with gcc 4.3.2 and --enable-Werror,
compilation fails with messages like these:

cc1: warnings being treated as errors
malloc.c: In function '__chunk_free':
malloc.c:164: error: cast from pointer to integer of different size

An updated patch based on a patch from Mandriva is attached here. Could
you review the patch for its correctness and apply it if it's correct?

Thanks,

-- 
Frederik Himpe

--=-rT4AqwSl7rbVPI2ZFpAM
Content-Disposition: attachment; filename="libaal.castint.patch"
Content-Type: text/x-patch; name="libaal.castint.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff -ur libaal-1.0.5.orig/src/malloc.c libaal-1.0.5/src/malloc.c
--- libaal-1.0.5.orig/src/malloc.c	2005-07-28 21:13:41.000000000 +0200
+++ libaal-1.0.5/src/malloc.c	2009-02-11 21:14:56.000000000 +0100
@@ -3,6 +3,7 @@
    
    malloc.c -- hanlders for memory allocation functions. */
 
+#include <stdint.h>
 #include <aal/libaal.h>
 
 /* Checking whether allone mode is in use. If so, initializes memory working
@@ -105,8 +106,8 @@
 
 	s = chunk->len - size - sizeof(chunk_t);
 	new = forw ? 
-		(char *)chunk + sizeof(chunk_t) + size :
-		(char *)chunk + sizeof(chunk_t) + s;
+		(void *)(intptr_t)chunk + sizeof(chunk_t) + size :
+		(void *)(intptr_t)chunk + sizeof(chunk_t) + s;
 	
 	/* Okay, we have found chunk good enough. And now we split it onto two
 	   chunks. */
@@ -121,8 +122,8 @@
 
 	area_free -= (size + sizeof(chunk_t));
 	return forw ?
-		(char *)chunk + sizeof(chunk_t):
-		(char *)new + sizeof(chunk_t);
+		(void *)(intptr_t)chunk + sizeof(chunk_t):
+		(void *)(intptr_t)new + sizeof(chunk_t);
 }
 
 /* Makes search for proper memory chunk in list of chunks. If found, split it in
@@ -157,7 +158,7 @@
 }
 
 #define ptr2chunk(ptr) \
-        ((chunk_t *)((int)ptr - sizeof(chunk_t)))
+        ((chunk_t *)((intptr_t)ptr - sizeof(chunk_t)))
 
 /* Frees passed memory pointer */
 static void __chunk_free(void *ptr) {
Only in libaal-1.0.5/src: malloc.c~

--=-rT4AqwSl7rbVPI2ZFpAM--

