From: Dave Boutcher <boutcher@us.ibm.com>
Subject: Memory Corruption
Date: 19 Aug 2002 11:50:52 -0500
Message-ID: <1029775853.1608.40.camel@terrier2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11246-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm chasing a wierd memory corruption problem on a ppc64 system.  The
first byte of a slab_t structure keeps getting stepped on (zeroed,
actually.)  This happens during a testcase that copies a large file
called "junk" between file systems (a mix of ext2 and reiser) on a
2.4.13 kernel.  I know that's REALLY REALLY old, but it's whats in
SuSE's SLES-7 release that we have customers running...

In every case, the page immediately preceding the slab_t has exactly the
same data in it, and it looks like some kind of directory structure
(note the presence of the word "junk", along with ".." and "." towards
the end.)
C000000037008E00: FD8C0600 FE8C0600 FF8C0600 008D0600 <                >
C000000037008E10: 018D0600 028D0600 038D0600 048D0600 <                >
C000000037008E20: 058D0600 068D0600 078D0600 088D0600 <                >
C000000037008E30: 098D0600 0A8D0600 0B8D0600 0C8D0600 <                >
C000000037008E40: 0D8D0600 0E8D0600 0F8D0600 108D0600 <                >
C000000037008E50: 118D0600 128D0600 138D0600 148D0600 <                >
C000000037008E60: 158D0600 168D0600 178D0600 188D0600 <                >
C000000037008E70: 198D0600 1A8D0600 1B8D0600 1C8D0600 <                >
C000000037008E80: 1D8D0600 1E8D0600 1F8D0600 208D0600 <                >
C000000037008E90: 218D0600 228D0600 238D0600 248D0600 <!   "   #   $   >
C000000037008EA0: 258D0600 268D0600 278D0600 288D0600 <%   &   '   (   >
C000000037008EB0: 298D0600 2A8D0600 2B8D0600 2C8D0600 <)   *   +   ,   >
C000000037008EC0: 2D8D0600 2E8D0600 2F8D0600 308D0600 <-   .   /   0   >
C000000037008ED0: 318D0600 328D0600 338D0600 348D0600 <1   2   3   4   >
C000000037008EE0: 358D0600 368D0600 378D0600 388D0600 <5   6   7   8   >
C000000037008EF0: 398D0600 3A8D0600 3B8D0600 3C8D0600 <9   :   ;   <   >
C000000037008F00: 3D8D0600 3E8D0600 3F8D0600 408D0600 <=   >   ?   @   >
C000000037008F10: 418D0600 428D0600 438D0600 448D0600 <A   B   C   D   >
C000000037008F20: 458D0600 468D0600 478D0600 488D0600 <E   F   G   H   >
C000000037008F30: 498D0600 4A8D0600 4B8D0600 4C8D0600 <I   J   K   L   >
C000000037008F40: 4D8D0600 4E8D0600 4F8D0600 508D0600 <M   N   O   P   >
C000000037008F50: 518D0600 528D0600 538D0600 548D0600 <Q   R   S   T   >
C000000037008F60: 558D0600 A4810000 01000000 0020F906 <U               >
C000000037008F70: 00000000 00000000 00000000 B377493D <             wI=>
C000000037008F80: C377493D C377493D 907C0300 32000000 < wI= wI= |  2   >
C000000037008F90: 01000000 01000000 02000000 40000400 <            @   >
C000000037008FA0: 02000000 00000000 01000000 38000400 <            8   >
C000000037008FB0: 80F1A501 02000000 03000000 30000400 <            0   >
C000000037008FC0: 6A756E6B 00000000 2E2E0000 00000000 <junk    ..      >
C000000037008FD0: 2E000000 00000000 ED4174F0 03000000 <.        At     >
C000000037008FE0: 48000000 00000000 00000000 00000000 <H               >
C000000037008FF0: 91B2103D B377493D B377493D 01000000 <   = wI= wI=    >

The byte immediately following that gets zeroed.  It sure looks to me
like someone is going over the end of a buffer.

The question is, does anyone recognize that data structure?!?!?!

Thanks!!!

Dave B



