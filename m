From: Patrick Smith <patsmith@pobox.com>
Subject: reiserfsck on PPC: checkmem fails
Date: Tue, 04 Feb 2003 00:44:43 -0500
Message-ID: <3E3F534B.2050000@pobox.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020807090200010209000205"
Return-path: <reiserfs-list-return-12636-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

This is a multi-part message in MIME format.
--------------020807090200010209000205
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I'm using ReiserFS on a PowerPC.  The filesystem works fine in normal 
use, but I'm having a bit of trouble with reiserfsck.

Versions:  reiserfsprogs 3.6.4, Linux kernel 2.4.20.

In order to get reiserfsprogs to compile, I applied the attached patch.

When I run reiserfsprogs, it reports one or two problems, and then fails 
in checkmem.  For now, I'm ignoring the problems, as I don't know 
whether they're caused by the same thing as checkmem or are real problems.

I've tracked down the cause of the checkmem failure to this bit of code 
in reiserfs_fetch_ondisk_bitmap in bitmap.c:

     last_byte_unused_bits = bm->bm_byte_size * 8 - bm->bm_bit_size;
     for (i = 0; i < last_byte_unused_bits; i ++)
         clear_bit (bm->bm_bit_size + i, bm->bm_map);

Thing is, the set_bit/clear_bit functions on PowerPC handle bits in 
groups of 32, with the low-order bits getting the lower numbers.  And, 
when this code runs, bm->bm_byte_size is 506733, congruent to 1 modulo 
4.  So the last byte of data bits is aligned on a word (4 byte) 
boundary, followed by the "mem_end" sentinel inserted by getmem:

	Bmem _end

(where B is the last byte of data).

When the code above calls clear_bit to clear the last few bits, this 
clears low-order bits in the Bmem word.  But those are in the 'm' byte, 
not the data byte.  Oops!

Does anyone have any ideas as to whether there's an easy fix?  And 
whether there could be similar problems elsewhere?  Any help would be 
much appreciated.

Also, would there be any serious drawbacks to using 3.6.3 or 3.6.2 
instead?  And would they have the same problem?

--------------020807090200010209000205
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

--------------020807090200010209000205--

