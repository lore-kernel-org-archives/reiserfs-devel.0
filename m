From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Bitmap alignment issues....
Date: Wed, 9 Feb 2005 21:19:11 +0300
Message-ID: <20050209181911.GM7482@backtop.namesys.com>
References: <E1Cyw7x-00073N-00@smtp03.mrf.mail.rcn.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="iFRdW5/EC4oqxDHL"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <E1Cyw7x-00073N-00@smtp03.mrf.mail.rcn.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Tom Evans <tom@23palmer.net>
Cc: reiserfs-list@namesys.com

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hello,

On Wed, Feb 09, 2005 at 12:59:17PM -0500, Tom Evans wrote:
> 
> Hi All -
> 
> I am new to the list - I have been using Reiser4 on Linux/Alpha
> for several months now and like very much what it offers.
> 
> (I use a -mm kernel from kernel.org with a Debian distro)
> 
> Recently I became aware or a large number or alignment fixups
> occurring in the kernel, specifically in the reiser4 code.
> 
> (My machine(s) would occasionally slow to a crawl when doing
>  intense disk i/o - I thought it was because I had recently
>  started using IDE drives in my systems (the IDE controllers
>  on these boards are notoriously slow) ).
> 
> I determined that 50k+ alignment faults were happening
> per second - I traced the majority down to these 3 functions:
> 
> 1) reiser4_find_next_set_bit  (in fs/reiser4/plugins/space/bitmap.c)
> 2) find_next_zero_bit (in asm/bitops.h)
> 3) replace_extent (in fs/reiser4/plugins/item/extent.c)
> 
> The first 2 accounted for ~4million faults during boot - essentially,
> the base address of the bit array is not aligned properly
> for ulong accesses on Alpha (which are 64bit).
> 
> I worked around this by using "get_unaligned()" for the array
> accesses in #1 and implemented a version of "find_next_zero_bit"
> local to reiser4 that handles unaligned base addresses (no need
> for all other users of the function to suffer the same performance hit).
> 
> Those 2 changes brought the number of alignment fixups to 0 on a boot - 
> the #3 issue accounts for a very small number of fixups - I have not
> yet found the exact location.
> 
> While these changes eliminated the faults, they are not optimal,
> get_unaligned() adds many cycles over a standard load.
> 
> I wanted to see if anyone here was already familiar with this issue and
> what the process would be for getting it addressed.

it is known. ca you try the attached patch?

> 
> Thanks for your patience!
> 
> ...tom
> 

-- 
Alex.

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="bitmap-word-align-2.diff"

===== plugin/space/bitmap.c 1.186 vs edited =====
--- 1.186/plugin/space/bitmap.c	Wed Jan 19 18:52:52 2005
+++ edited/plugin/space/bitmap.c	Sun Feb  6 19:23:01 2005
@@ -54,13 +54,15 @@
 
 #define CHECKSUM_SIZE    4
 
+#define BYTES_PER_LONG   (sizeof(long))
+
 #if BITS_PER_LONG == 64
 #  define LONG_INT_SHIFT (6)
 #else
 #  define LONG_INT_SHIFT (5)
 #endif
 
-#define LONG_INT_MASK (BITS_PER_LONG - 1)
+#define LONG_INT_MASK (BITS_PER_LONG - 1UL)
 
 typedef unsigned long ulong_t;
 
@@ -179,17 +181,46 @@
 
 #include <asm/bitops.h>
 
+#if BITS_PER_LONG == 64
+
+#define OFF(addr)  (((ulong_t)(addr) & (BYTES_PER_LONG - 1)) << 3)
+#define BASE(addr) ((ulong_t*) ((ulong_t)(addr) & ~(BYTES_PER_LONG - 1)))
+
+static inline void reiser4_set_bit(int nr, void * addr)
+{
+	ext2_set_bit(nr + OFF(addr), BASE(addr));
+}
+
+static inline void reiser4_clear_bit(int nr, void * addr)
+{
+	ext2_clear_bit(nr + OFF(addr), BASE(addr));
+}
+
+static inline int reiser4_test_bit(int nr, void * addr)
+{
+	return ext2_test_bit(nr + OFF(addr), BASE(addr));
+}
+static inline int reiser4_find_next_zero_bit(void * addr, int maxoffset, int offset) 
+{
+	int off = OFF(addr);
+
+	return ext2_find_next_zero_bit(BASE(addr), maxoffset + off, offset + off) - off;
+}
+
+#else
+
 #define reiser4_set_bit(nr, addr)    ext2_set_bit(nr, addr)
 #define reiser4_clear_bit(nr, addr)  ext2_clear_bit(nr, addr)
 #define reiser4_test_bit(nr, addr)  ext2_test_bit(nr, addr)
 
 #define reiser4_find_next_zero_bit(addr, maxoffset, offset) \
 ext2_find_next_zero_bit(addr, maxoffset, offset)
+#endif
 
 /* Search for a set bit in the bit array [@start_offset, @max_offset[, offsets
  * are counted from @addr, return the offset of the first bit if it is found,
  * @maxoffset otherwise. */
-static bmap_off_t reiser4_find_next_set_bit(
+static bmap_off_t __reiser4_find_next_set_bit(
 	void *addr, bmap_off_t max_offset, bmap_off_t start_offset)
 {
 	ulong_t *base = addr;
@@ -225,6 +256,21 @@
 
 	return max_offset;
 }
+
+#if BITS_PER_LONG == 64 
+
+static bmap_off_t reiser4_find_next_set_bit(
+	void *addr, bmap_off_t max_offset, bmap_off_t start_offset)
+{
+	bmap_off_t off = OFF(addr);
+
+	return __reiser4_find_next_set_bit(BASE(addr), max_offset + off, start_offset + off) - off;
+}
+
+#else
+#define reiser4_find_next_set_bit(addr, max_offset, start_offset) \
+  __reiser4_find_next_set_bit(addr, max_offset, start_offset) 
+#endif
 
 /* search for the first set bit in single word. */
 static int find_last_set_bit_in_word (ulong_t word, int start_bit)

--iFRdW5/EC4oqxDHL--
