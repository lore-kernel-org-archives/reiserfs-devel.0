From: "Tom Evans" <tom@23palmer.net>
Subject: Bitmap alignment issues....
Date: Wed, 9 Feb 2005 12:59:17 -0500
Message-ID: <E1Cyw7x-00073N-00@smtp03.mrf.mail.rcn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi All -

I am new to the list - I have been using Reiser4 on Linux/Alpha
for several months now and like very much what it offers.

(I use a -mm kernel from kernel.org with a Debian distro)

Recently I became aware or a large number or alignment fixups
occurring in the kernel, specifically in the reiser4 code.

(My machine(s) would occasionally slow to a crawl when doing
 intense disk i/o - I thought it was because I had recently
 started using IDE drives in my systems (the IDE controllers
 on these boards are notoriously slow) ).

I determined that 50k+ alignment faults were happening
per second - I traced the majority down to these 3 functions:

1) reiser4_find_next_set_bit  (in fs/reiser4/plugins/space/bitmap.c)
2) find_next_zero_bit (in asm/bitops.h)
3) replace_extent (in fs/reiser4/plugins/item/extent.c)

The first 2 accounted for ~4million faults during boot - essentially,
the base address of the bit array is not aligned properly
for ulong accesses on Alpha (which are 64bit).

I worked around this by using "get_unaligned()" for the array
accesses in #1 and implemented a version of "find_next_zero_bit"
local to reiser4 that handles unaligned base addresses (no need
for all other users of the function to suffer the same performance hit).

Those 2 changes brought the number of alignment fixups to 0 on a boot - 
the #3 issue accounts for a very small number of fixups - I have not
yet found the exact location.

While these changes eliminated the faults, they are not optimal,
get_unaligned() adds many cycles over a standard load.

I wanted to see if anyone here was already familiar with this issue and
what the process would be for getting it addressed.

Thanks for your patience!

...tom

