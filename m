From: Patrick Smith <patsmith@pobox.com>
Subject: Re: reiserfsck on PPC: checkmem fails
Date: Wed, 05 Feb 2003 22:58:50 -0500
Message-ID: <3E41DD7A.5060407@pobox.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090005030709090403090706"
Return-path: <reiserfs-list-return-12657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

This is a multi-part message in MIME format.
--------------090005030709090403090706
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Yesterday, I reported having tried a experimental fix for this problem, 
that resulted in a spew of error messages.  Turns out those were due to 
a bug in my fix.  With that repaired, checkmem error message does indeed 
disappear.

I've attached a patch showing what I did.  With this applied, reiserfsck 
--check produces the same error messages it did previously, minus the 
checkmem one.  It also produces one new message:

	check_and_free_buffer_mem: dirty buffer (3 16) found

I've no idea whether this is due to a problem with my fix, a problem on 
the disk, or what.  The fact that this message wasn't produced before 
application of my fix doesn't mean much, as in that case reiserfsck was 
dying in checkmem before getting to the point where this message is 
produced.

For what it's worth, the _2_ other error messages I'm getting (a) refer 
to a block used more than once, and (b) say the ondisk bitmap is not 
correct.  Though there's also a message about _3_ corruptions repairable 
with --fix-fixable.  It's quite possible these represent real problems 
with the filesystem, as the disk has been hit by at least one power 
failure.  Or they could be lingering side effects of the bitmap problem.

At this point, I have no intention of trying to repair the disk without 
some reassurance that this problem is indeed fixed.  My "fix" may be 
introducing other problems, and there may be other cases of 
big-endian/little-endian confusion.  And I'd rather not spend the time 
to read all the code to ferret these out.  Someone who knows the code 
can presumably do it much more quickly.  :-)

--------------090005030709090403090706
Content-Type: text/plain;
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

diff -ur original/include/io.h reiserfsprogs-3.6.4/include/io.h
--- original/include/io.h	2003-02-05 21:42:44.000000000 -0500
+++ reiserfsprogs-3.6.4/include/io.h	2003-02-05 21:52:44.000000000 -0500
@@ -2,6 +2,7 @@
  * Copyright 1996-2002 Hans Reiser
  */
 
+#include "misc.h"
 
 struct buffer_head {
     unsigned long b_blocknr;
diff -ur original/include/misc.h reiserfsprogs-3.6.4/include/misc.h
--- original/include/misc.h	2003-02-05 21:42:44.000000000 -0500
+++ reiserfsprogs-3.6.4/include/misc.h	2003-02-05 22:06:42.000000000 -0500
@@ -49,7 +49,6 @@
 int uuid_is_correct (unsigned char * uuid);
 int set_uuid (const unsigned char * text, unsigned char * UUID);
 
-#include <asm/bitops.h>
 #if __BYTE_ORDER == __LITTLE_ENDIAN
 int le_set_bit (int nr, void * addr);
 int le_clear_bit (int nr, void * addr);
diff -ur original/include/swab.h reiserfsprogs-3.6.4/include/swab.h
--- original/include/swab.h	2003-02-05 21:42:44.000000000 -0500
+++ reiserfsprogs-3.6.4/include/swab.h	2003-02-05 22:11:23.000000000 -0500
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
diff -ur original/reiserfscore/bitmap.c reiserfsprogs-3.6.4/reiserfscore/bitmap.c
--- original/reiserfscore/bitmap.c	2003-02-05 21:42:44.000000000 -0500
+++ reiserfsprogs-3.6.4/reiserfscore/bitmap.c	2003-02-05 21:49:59.000000000 -0500
@@ -10,6 +10,51 @@
 #include <assert.h>
 
 
+/* The on-disk bitmaps use little-endian byte order.  But the PPC versions
+   of the bit-manipulation functions use big-endian byte order.  Hence we
+   use these functions instead of the normal set_bit, clear_bit, ...
+
+   Note that the versions here are intended to be simple and work.  Some
+   optimization would be a good thing to add.  */
+
+static __inline__ int bm_set_bit(int nr, void* a)
+{
+   unsigned char* p = a + (nr >> 3);
+   unsigned char mask = 1 << (nr & 7);
+   int retval;
+   retval = ((*p & mask) != 0);
+   *p |= mask;
+   return retval;
+}
+
+static __inline__ int bm_clear_bit(int nr, void* a)
+{
+   unsigned char* p = a + (nr >> 3);
+   unsigned char mask = 1 << (nr & 7);
+   int retval;
+   retval = ((*p & mask) != 0);
+   *p &= ~mask;
+   return retval;
+}
+
+static __inline__ int bm_test_bit(int nr, void* a)
+{
+   unsigned char* p = a + (nr >> 3);
+   unsigned char mask = 1 << (nr & 7);
+   return (*p & mask) != 0;
+}
+
+static __inline__ unsigned long bm_find_next_zero_bit(void * addr,
+               unsigned long size, unsigned long offset)
+{
+   unsigned long nr;
+   for (nr = offset; nr < size; nr++)
+      if (!bm_test_bit(nr, addr))
+         return nr;
+   return size;
+}
+
+
 /* create clean bitmap */
 reiserfs_bitmap_t * reiserfs_create_bitmap (unsigned int bit_count)
 {
@@ -127,8 +172,8 @@
 	    to->bm_bit_size == from->bm_bit_size);
 
     for (i = 0; i < to->bm_bit_size; i++) {
-	if (test_bit(i, from->bm_map) && !test_bit(i, to->bm_map)) {
-	    set_bit(i, to->bm_map);
+	if (bm_test_bit(i, from->bm_map) && !bm_test_bit(i, to->bm_map)) {
+	    bm_set_bit(i, to->bm_map);
 	    to->bm_set_bits ++;
 	    to->bm_dirty = 1;	
 	}
@@ -148,8 +193,8 @@
 	    base->bm_bit_size == exclude->bm_bit_size);
 
     for (i = 0; i < base->bm_bit_size; i++) {
-	if (test_bit(i, exclude->bm_map) && test_bit(i, base->bm_map)) {
-	    clear_bit(i, base->bm_map);
+	if (bm_test_bit(i, exclude->bm_map) && bm_test_bit(i, base->bm_map)) {
+	    bm_clear_bit(i, base->bm_map);
 	    base->bm_set_bits --;
 	    base->bm_dirty = 1;
 	}
@@ -159,9 +204,9 @@
 void reiserfs_bitmap_set_bit (reiserfs_bitmap_t * bm, unsigned int bit_number)
 {
     assert(bit_number < bm->bm_bit_size);
-    if (test_bit (bit_number, bm->bm_map))
+    if (bm_test_bit (bit_number, bm->bm_map))
 	return;
-    set_bit(bit_number, bm->bm_map);
+    bm_set_bit(bit_number, bm->bm_map);
     bm->bm_set_bits ++;
     bm->bm_dirty = 1;
 }
@@ -170,9 +215,9 @@
 void reiserfs_bitmap_clear_bit (reiserfs_bitmap_t * bm, unsigned int bit_number)
 {
     assert(bit_number < bm->bm_bit_size);
-    if (!test_bit (bit_number, bm->bm_map))
+    if (!bm_test_bit (bit_number, bm->bm_map))
 	return;
-    clear_bit (bit_number, bm->bm_map);
+    bm_clear_bit (bit_number, bm->bm_map);
     bm->bm_set_bits --;
     bm->bm_dirty = 1;
 }
@@ -183,7 +228,7 @@
     if (bit_number >= bm->bm_bit_size)
 	printf ("bit %u, bitsize %lu\n", bit_number, bm->bm_bit_size);
     assert(bit_number < bm->bm_bit_size);
-    return test_bit(bit_number, bm->bm_map);
+    return bm_test_bit(bit_number, bm->bm_map);
 }
 
 
@@ -204,7 +249,7 @@
     unsigned int  bit_nr = *start;
     assert(*start < bm->bm_bit_size);
 
-    bit_nr = find_next_zero_bit(bm->bm_map, bm->bm_bit_size, *start);
+    bit_nr = bm_find_next_zero_bit(bm->bm_map, bm->bm_bit_size, *start);
 
     if (bit_nr >= bm->bm_bit_size) { /* search failed */	
 	return 1;
@@ -266,7 +311,7 @@
        reiserfs_bitmap_t has those bits set to 0 */
     last_byte_unused_bits = bm->bm_byte_size * 8 - bm->bm_bit_size;
     for (i = 0; i < last_byte_unused_bits; i ++)
-	clear_bit (bm->bm_bit_size + i, bm->bm_map);
+	bm_clear_bit (bm->bm_bit_size + i, bm->bm_map);
 
     bm->bm_set_bits = 0;
     /* FIXME: optimize that */
@@ -332,7 +377,7 @@
 	    /* set unused bits of last byte of a bitmap to 1 */
 	    last_byte_unused_bits = bm->bm_byte_size * 8 - bm->bm_bit_size;
 	    for (i = 0; i < last_byte_unused_bits; i ++)
-		set_bit ((bm->bm_bit_size % (fs->fs_blocksize * 8)) + i, bh->b_data);
+		bm_set_bit ((bm->bm_bit_size % (fs->fs_blocksize * 8)) + i, bh->b_data);
 	}
 	mark_buffer_dirty (bh);
 	brelse (bh);

--------------090005030709090403090706--

