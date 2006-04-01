From: Oliver Maruhn <oliver@maruhn.com>
Subject: bug report: reiserfsck --rebuild-tree fails repeatedly with mark_block_used
Date: Sat, 01 Apr 2006 17:10:44 +0200
Message-ID: <442E97F4.7030906@maruhn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28436-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

"reiserfsck --rebuild-tree" always aborts with the appended error log.
The system is a Debian stable with a self compiled kernel 2.6.12.  I
tried reiserfsck 3.6.19 from the debian stable and testing.  Also I
compiled version 3.6.12 and got the same result.

There are no syslog messages.  The HDs have no hardware defects.  The
reiser fs lives on a linux software RAID 1 (/dev/mdX).  There are no RAM
errors (I did run a some tests) and the block number is always the same.

What other information do you need?

Cheers,

   Oliver



###########
reiserfsck --rebuild-tree started at Fri Mar 31 09:55:25 2006
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 155078527 blocks marked used
Skipping 13122 blocks (super block, journal, bitmaps) 155065405 blocks
will be read
0%....20%.block 73450006: The number of items (1) is incorrect, should
be (0) - corrected
block 73450006: The free space (1) is incorrect, should be (4072) -
corrected
block 73457475: The number of items (1) is incorrect, should be (0) -
corrected
block 73457475: The free space (2) is incorrect, should be (4072) -
corrected
block 73460971: The number of items (1) is incorrect, should be (0) -
corrected
block 73460971: The free space (36) is incorrect, should be (4072) -
corrected
block 81413338: The number of items (1) is incorrect, should be (0) -
corrected
block 81413338: The free space (2) is incorrect, should be (4072) -
corrected
                                                       left 0, 12965
/seccccc
493054 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 155065405
                Leaves among those 293795
                        - leaves all contents of which could not be
saved and deleted 18
                Objectids found 493059

Pass 1 (will try to insert 293777 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....                                             left 179117,
250 /sec
The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

mark_block_used: (54589262) used already
Aborted
