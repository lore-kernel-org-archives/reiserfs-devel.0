From: "Markus Perl" <markus@mex-web.de>
Subject: error in latest reiserfsck while rebuilding tree
Date: Sat, 2 Oct 2004 17:19:27 +0200 (CEST)
Message-ID: <61173.217.238.31.35.1096730367.squirrel@mycc.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-21986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello people,

I hope you can help me!

My problem is, that the free space was not shown correctly, so I started
rebuilding the Tree with "--rebuild-tree". That runs correctly and I got
the message "Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 17038928 blocks marked used
Skipping 8730 blocks (super block, journal, bitmaps) 17030198 blocks will
be rea
0%....20%....40%....block 9654256: The free space (4096) is incorrect,
should be (4072) - corrected"

So I started reiserfsck with "--rebuild-tree -z". This fails with an error
"out of disc space"

every time now, i start to rebuild the tree i get this error.

Output:
-----------------------------------------------------
###### Pass 0 #######
Loading on-disk bitmap .. ok, 17038928 blocks marked used
Skipping 8730 blocks (super block, journal, bitmaps) 17030198 blocks will
be rea
0%....20%....40%....block 9654256: The free space (4096) is incorrect,
should be (4072) - corrected
60%....80%....100%                       left 0, 10179 /sec
195482 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 17030198
                Leaves among those 57461
                        - leaves all contents of which could not be saved
and deleted 1
                Objectids found 195494

Pass 1 (will try to insert 57460 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....Not enough allocable blocks, checking
bitmap...there are 1 allocable blocks, btw

out of disk space
Aborted
-----------------------------------------------------

So i cannot mount the partition now!

What can I do?

I'm using reiserfsck 3.6.18
System: Suse 91
Kernel: 2.6
HDD: 120 GB
Partition: hda7 (65 GB)

I hope to hear from you soon

greets
Markus Perl


-- 
Markus Perl
markus at mex-web.de
www.mex-web.de
PGP-Key: www.mex-web.de/markus.gpg
