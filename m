From: Patrick Smith <patsmith@pobox.com>
Subject: Re: reiserfsck on PPC: checkmem fails
Date: Wed, 05 Feb 2003 01:17:28 -0500
Message-ID: <3E40AC78.9050907@pobox.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050309050701090604090604"
Return-path: <reiserfs-list-return-12650-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

This is a multi-part message in MIME format.
--------------050309050701090604090604
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

> I'm using ReiserFS on a PowerPC.  The filesystem works fine in normal 
> use, but I'm having a bit of trouble with reiserfsck.
> 
> Versions:  reiserfsprogs 3.6.4, Linux kernel 2.4.20.

After looking into this a bit more, I've become quite confused and worried.

Various places in the code, arrays of bits are maintained.  Two 
different approaches seem to be taken:

ext2_test_bit, ext2_set_bit, etc. group bits into 8-bit bytes.  The 
kernel's bitmap.c uses this approach (but not everywhere).

test_bit, set_bit, etc. group bits into 32-bit words (at least in the 
PPC version).  The kernel's journal.c uses this approach.  As far as I 
can tell, only this approach is used in reiserfsprogs.

On a little-endian machine, the two approaches should be equivalent, so 
the distinction wouldn't matter much.

On a big-endian machine such as PPC, they are quite different, so each 
piece of data should be accessed with only one of the two approaches. 
But as far as I can tell, the kernel's bitmap.c accesses the block 
bitmaps with the first approach, and reiserfsprogs' bitmap.c uses the 
second approach.  :-(

On the other hand, when I tried modifying the reiserfsprogs bitmap.c to 
group bits by bytes instead of words, reiserfsck --check spewed a 
zillion error messages.  So maybe I've got something wrong above.

In any case, might I suggest standardizing on one of the two approaches 
throughout?  Preferably the byte-wise approach, for the sake of portability.

--------------050309050701090604090604
Content-Type: text/plain;
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

--- ./include/misc.h.orig	2002-09-13 06:09:28.000000000 -0400
+++ ./include/misc.h	2002-12-24 22:31:08.000000000 -0500
@@ -49,7 +49,10 @@
 int uuid_is_correct (unsigned char * uuid);
 int set_uuid (const unsigned char * text, unsigned char * UUID);
 
+#include <asm/byteorder.h>
+#define __KERNEL__
 #include <asm/bitops.h>
+#undef __KERNEL__
 #if __BYTE_ORDER == __LITTLE_ENDIAN
 int le_set_bit (int nr, void * addr);
 int le_clear_bit (int nr, void * addr);
--- ./include/io.h.orig	2002-09-01 11:32:07.000000000 -0400
+++ ./include/io.h	2002-12-24 22:31:08.000000000 -0500
@@ -2,6 +2,7 @@
  * Copyright 1996-2002 Hans Reiser
  */
 
+#include "misc.h"
 
 struct buffer_head {
     unsigned long b_blocknr;
--- ./include/swab.h.orig	2002-08-07 05:12:07.000000000 -0400
+++ ./include/swab.h	2002-12-24 22:32:09.000000000 -0500
@@ -4,5 +4,15 @@
 #ifndef _REISERFS_SWAB_H_
 #define _REISERFS_SWAB_H_
 
+#include <asm/byteorder.h>
+#define __KERNEL__
+#include <asm/bitops.h>
+#undef __KERNEL__
+
 #include <linux/byteorder/swab.h>
+
+#define swab16 __swab16
+#define swab32 __swab32
+#define swab64 __swab64
+
 #endif /* _REISERFS_SWAB_H_ */


--------------050309050701090604090604--

