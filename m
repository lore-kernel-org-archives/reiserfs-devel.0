From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: reiserfsck 3.6.8 + corrupted filesystem
Date: Wed, 02 Jul 2003 13:31:44 -0400
Message-ID: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14802-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I've been running reiserfsck over a corrupted filesystem (IDE disks, dead
fans, overheating embedded controller RAM, smoke...you get the picture).
The messages are...interesting.

What is the meaning of the message "The problem has occurred looks like
a hardware problem (perhaps memory)."?  Is that referring to the memory
of reiserfsck, or is it suggesting there is some kind of data consistency
issue on the disk, or is it suggesting that the corruption it is seeing
on the disk might have been the result of bad memory some time in the
past?

I've been running reiserfsck --rebuild-tree in a while loop until it fixes
the FS.  It seems that each time through it gets a little further along,
then near the end of pass 1, reiserfsck complains that something wasn't
done in pass 0 and aborts.  Pass 0 runs again, and some additional changes
are made which fix whatever pass 1 was complaining about.  Pass 1 runs
again, gets a little further than it did the previous run, then aborts
a few thousand blocks later.  The most recent run suggests that this
might continue in pass 2 (complaining about things not done by both pass
1 and 0), but I've never gotten to pass 2 yet to find out.

Here are parts of the three reiserfsck runs so far (actually I did some
more earlier, but those were 3.6.6 not 3.6.8).  Note I've left out
several thousand lines of pass0 output, most of which involves deleting
invalidly formatted nodes, directories with bad types, wrong order
entries in directories...basically what you'd expect if one disk out of
a RAID array was randomly corrupted.

I realize that there is huge data loss here, but IMHO reiserfsck should at
least salvage the FS without calling abort() on itself.

I also realize that these log sections are useless as a bug report.
On the other hand, the messages keep changing anyway, so the state of the
FS is a bit of a moving target.  ;-)



(pass 0 elided)


18163 directory entries were hashed with not set hash.
23916806 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 158433879
                Leaves among those 925148
                        - corrected leaves 3613
                        - leaves all contents of which could not be saved and deleted 1584
                pointers in indirect items to wrong area 23559 (zeroed)
                Objectids found 4953

Pass 1 (will try to insert 923564 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%                                          left 523692, 160
/sec
The problem has occurred looks like a hardware problem (perhaps memory).
Send us the bug report only if the second run dies at the same place with
the same block number.

build_the_tree: Nothing but leaves are expected. Block 59067053 - ??

/root/bin/md0-fsck: line 7:   884 Done                    echo Yes
       885 Aborted                 | reiserfsck "$@" /dev/md0
+ mount /md0
mount: Not a directory



(pass 0 elided)



pass0: vpf-10160: block 64352473: item 7: No "." entry found in the first item of a directory
                                                        left 0, 3795 /seccccc
793 directory entries were hashed with not set hash.
23911554 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 158433879
                Leaves among those 922471
                        - corrected leaves 899
                        - leaves all contents of which could not be saved and deleted 1767
                pointers in indirect items to wrong area 16751 (zeroed)
                Objectids found 4942

Pass 1 (will try to insert 920704 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%is_leaf_bad: block 59177036, item 0: The corrupted item found (845456 215423828 0xcd7e001 ??? (15), len 4048, location 48 entry count 0, fsck need 0, format new)
is_leaf_bad: WARNING: The leaf (59177036) is formatted badly. Will be handled on the the pass2.
                                          left 520674, 166 /sec
The problem has occurred looks like a hardware problem (perhaps memory).
Send us the bug report only if the second run dies at the same place with
the same block number.

build_the_tree: Nothing but leaves are expected. Block 59373117 - ??

/root/bin/md0-fsck: line 7: 21821 Done                    echo Yes
     21822 Aborted                 | reiserfsck "$@" /dev/md0


(pass 0 elided)


191 directory entries were hashed with not set hash.
23911285 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 158433879
                Leaves among those 921865
                        - corrected leaves 282
                        - leaves all contents of which could not be saved and deleted 1821
                pointers in indirect items to wrong area 7191 (zeroed)
                Objectids found 4938

Pass 1 (will try to insert 920044 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%is_leaf_bad: block 59087496, item 0: The corrupted item found (666782 1200118 0x10003001 ??? (15), len 4048,
location 48 entry count 0, fsck need 1, format new)
is_leaf_bad: WARNING: The leaf (59087496) is formatted badly. Will be handled on the the pass2.
is_leaf_bad: block 59120291, item 0: The corrupted item found (6322931 7090318 0x10004001 ??? (15), len 4048, location 48 entry count 0, fsck need 1, format new)
is_leaf_bad: WARNING: The leaf (59120291) is formatted badly. Will be handled on the the pass2.
pass1.c 405 pass1_correct_leaf
pass1_correct_leaf: block 59141112, item 0, pointer 82: The wrong pointer (86245376) in the file [11136910 11081615]. Must be fixed on pass0.
/root/bin/md0-fsck: line 7:  6574 Done                    echo Yes
      6575 Aborted                 | reiserfsck "$@" /dev/md0
