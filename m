From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: AMD64 progress?
Date: Fri, 14 Jan 2005 23:17:51 +0300
Message-ID: <20050114201751.GB5883@backtop.namesys.com>
References: <1105594407.32495.8.camel@gentoo>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23146-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1105594407.32495.8.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com

On Wed, Jan 12, 2005 at 11:33:27PM -0600, Jake Maciejewski wrote:
> There was mention of Namesys getting an AMD64 machine. Do you guys have
> it yet? Has there been any progress on my reiser4 bug(s), particularly
> the "reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset,
> start_offset) >= end_offset" problem?

can you test the following patch? I know that amd64 does not require
strong word aligment, but may be amd64 bitops coded in assembler 
do that?

===== plugin/space/bitmap.c 1.185 vs edited =====
--- 1.185/plugin/space/bitmap.c	Sun Dec  5 19:49:52 2004
+++ edited/plugin/space/bitmap.c	Fri Jan 14 23:15:53 2005
@@ -57,13 +57,15 @@
 
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
 
@@ -182,12 +184,41 @@
 
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


