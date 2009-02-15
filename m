From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: libaal patch fixing pointer cast warnings
Date: Sun, 15 Feb 2009 03:18:29 +0300
Message-ID: <18839.24405.36274.827765@edward.zelnet.ru>
References: <1234383815.5099.3.camel@Anastacia.local>
	<1234385241.5099.5.camel@Anastacia.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1234385241.5099.5.camel@Anastacia.local>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frederik Himpe <fhimpe@vub.ac.be>
Cc: reiserfs-devel@vger.kernel.org

Frederik Himpe writes:
 > On wo, 2009-02-11 at 21:23 +0100, Frederik Himpe wrote:
 > > When compiling aalib 1.0.5 on x86_64 with gcc 4.3.2 and --enable-Werror,
 > > compilation fails with messages like these:
 > > 
 > > cc1: warnings being treated as errors
 > > malloc.c: In function '__chunk_free':
 > > malloc.c:164: error: cast from pointer to integer of different size
 > > 
 > > An updated patch based on a patch from Mandriva is attached here. Could
 > > you review the patch for its correctness and apply it if it's correct?
 > 
 > A Mandriva developer checked the patch and made a suggestion, so here is
 > an improved patch.
 > 
 > -- 
 > Frederik Himpe
 > diff -ur libaal-1.0.5.orig/src/malloc.c libaal-1.0.5/src/malloc.c
 > --- libaal-1.0.5.orig/src/malloc.c	2005-07-28 21:13:41.000000000 +0200
 > +++ libaal-1.0.5/src/malloc.c	2009-02-11 21:14:56.000000000 +0100
 > @@ -3,6 +3,7 @@
 >     
 >     malloc.c -- hanlders for memory allocation functions. */
 >  
 > +#include <stdint.h>
 >  #include <aal/libaal.h>
 >  
 >  /* Checking whether allone mode is in use. If so, initializes memory working
 > @@ -105,8 +106,8 @@
 >  
 >  	s = chunk->len - size - sizeof(chunk_t);
 >  	new = forw ? 
 > -		(char *)chunk + sizeof(chunk_t) + size :
 > -		(char *)chunk + sizeof(chunk_t) + s;
 > +		(void *)(char *)chunk + sizeof(chunk_t) + size :
 > +		(void *)(char *)chunk + sizeof(chunk_t) + s;
 >  	
 >  	/* Okay, we have found chunk good enough. And now we split it onto two
 >  	   chunks. */
 > @@ -121,8 +122,8 @@
 >  
 >  	area_free -= (size + sizeof(chunk_t));
 >  	return forw ?
 > -		(char *)chunk + sizeof(chunk_t):
 > -		(char *)new + sizeof(chunk_t);
 > +		(void *)(char *)chunk + sizeof(chunk_t):
 > +		(void *)(char *)new + sizeof(chunk_t);
 >  }
 >  
 >  /* Makes search for proper memory chunk in list of chunks. If found, split it in
 > @@ -157,7 +158,7 @@
 >  }
 >  
 >  #define ptr2chunk(ptr) \
 > -        ((chunk_t *)((int)ptr - sizeof(chunk_t)))
 > +        ((chunk_t *)((intptr_t)ptr - sizeof(chunk_t)))

Nop, This is wrong!

This macro is to cut a chunk header.
If you cast from pointer to pointer, then it will cut
unexpected number of bytes:
(int)x - y is not the same as (int *)x - y. 

Please, try the following patch.

Edward.

Fix cast.

Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
---
 src/malloc.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- libaal-1.0.5.orig/src/malloc.c
+++ libaal-1.0.5/src/malloc.c
@@ -105,8 +105,8 @@ static void *__chunk_split(chunk_t *chun
 
 	s = chunk->len - size - sizeof(chunk_t);
 	new = forw ? 
-		(char *)chunk + sizeof(chunk_t) + size :
-		(char *)chunk + sizeof(chunk_t) + s;
+		(void *)chunk + sizeof(chunk_t) + size :
+		(void *)chunk + sizeof(chunk_t) + s;
 	
 	/* Okay, we have found chunk good enough. And now we split it onto two
 	   chunks. */
@@ -121,8 +121,8 @@ static void *__chunk_split(chunk_t *chun
 
 	area_free -= (size + sizeof(chunk_t));
 	return forw ?
-		(char *)chunk + sizeof(chunk_t):
-		(char *)new + sizeof(chunk_t);
+		(void *)chunk + sizeof(chunk_t):
+		(void *)new + sizeof(chunk_t);
 }
 
 /* Makes search for proper memory chunk in list of chunks. If found, split it in
@@ -157,7 +157,7 @@ static void *__chunk_alloc(uint32_t size
 }
 
 #define ptr2chunk(ptr) \
-        ((chunk_t *)((int)ptr - sizeof(chunk_t)))
+        ((chunk_t *)((long)ptr - sizeof(chunk_t)))
 
 /* Frees passed memory pointer */
 static void __chunk_free(void *ptr) {
