From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4fs and SPARC64?
Date: Wed, 16 Feb 2005 17:09:45 +0300
Message-ID: <20050216140944.GZ7482@backtop.namesys.com>
References: <421347FD.6000204@d-g-c.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="hoZxPH4CaxYzWscb"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <421347FD.6000204@d-g-c.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "mailinglists@d-g-c.de" <mailinglists@d-g-c.de>
Cc: reiserfs-list@namesys.com

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 16, 2005 at 02:17:49PM +0100, mailinglists@d-g-c.de wrote:
> Hi,

> i just wondered about reiser4fs working on SPARC64? I use Gentoo Sparc64 
> and it is working fine with kernel 2.4.28. But is the Reiser4 code 
> SPARC64 ready?

It would be nice if you try it :) we have no reiser4/sparc64 reports yet.  

Reiser4 code is included into AKPM's -mm kernels.  mkfs and other utils are in
the ftp://ftp.namesys.com/pub/reiser4progs/

At least 3 additional patches are needed for running reiser4 on sparc64. They not yet
included into -mm kernels.  I am attaching them to this e-mail.

> Thanks for your help
> 
> Florian Engelmann

-- 
Alex.

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiser4-bitmap-amd64-fix-2.diff"

===== plugin/space/bitmap.c 1.186 vs edited =====
--- 1.186/plugin/space/bitmap.c	Wed Jan 19 18:52:52 2005
+++ edited/plugin/space/bitmap.c	Mon Feb  7 16:18:37 2005
@@ -165,7 +165,7 @@
 static int
 find_next_zero_bit_in_word(ulong_t word, int start_bit)
 {
-	ulong_t mask = 1 << start_bit;
+	ulong_t mask = 1UL << start_bit;
 	int i = start_bit;
 
 	while ((word & mask) != 0) {
@@ -235,7 +235,7 @@
 	assert ("zam-965", start_bit < BITS_PER_LONG);
 	assert ("zam-966", start_bit >= 0);
 
-	bit_mask = (1 << nr);
+	bit_mask = (1UL << nr);
 
 	while (bit_mask != 0) {
 		if (bit_mask & word)

--hoZxPH4CaxYzWscb
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

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiser4-replace_extent-word-align-fix.diff"

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2005/02/12 18:55:16+03:00 zam@crimson.namesys.com 
#   replace_extent: unaligned access fix.
# 
# plugin/item/extent.c
#   2005/02/12 18:55:10+03:00 zam@crimson.namesys.com +1 -1
#   replace_extent: unaligned access fix.
# 
diff -Nru a/plugin/item/extent.c b/plugin/item/extent.c
--- a/plugin/item/extent.c	Tue Feb 15 21:25:22 2005
+++ b/plugin/item/extent.c	Tue Feb 15 21:25:22 2005
@@ -135,7 +135,7 @@
 			assert("vs-987", znode_is_loaded(coord_after.node));
 			assert("vs-988", !memcmp(ext, &orig_ext, sizeof (*ext)));
 
-			*ext = *replace;
+			memcpy(ext, replace, sizeof(*ext));
 			znode_make_dirty(coord_after.node);
 
 			if (coord_after.node != orig_znode)

--hoZxPH4CaxYzWscb--
