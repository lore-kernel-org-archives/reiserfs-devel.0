From: John Fettig <jfettig@students.uiuc.edu>
Subject: reiserfsck --rebuild-tree aborted
Date: Fri, 10 Jan 2003 00:53:46 -0600
Message-ID: <20030110005346.A24040@ux13.cso.uiuc.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="HlL+5n6rz5pIUxbD"
Return-path: <reiserfs-list-return-12303-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A brief explanation of my woes:

Upgrading hd, so was testing out a boot cd.  Boot cd has Keeper Linux on
it, with 2.4.18 kernel.  I mounted the the reiserfs partition, looked
around a bit, and rebooted.  I forgot to unmount (and it was mounted
rw)...

The kernel on the drive (2.4.20) panics when I try to boot it without
the cd.  I pop the cd back in, and try reiserfsck.  It tells me to
backup (which was hopefully successful) and run reiserfsck
--rebuild-tree.  I was using the reiserfsck from the mangled partition,
it allowed me to mount (this time read only) and some of the data was
still acessable.  I believe the version was 3.x.0b, but not certain.

As per FAQ, I grabbed 3.6.4, tried it, and also the latest pre.  All of
the versions give me the same error: it starts Pass 0, the meter goes to
100%, then on to Pass 1.  It gives these errors:

build_the_tree: Nothing but leaves are expected. Block 8532-??22683
build_the_tree: Nothing but leaves are expected. Block 8580-??22660
pass1.c 405 pass1_correct_leaf
pass1_correct_leaf: block 8581, item 0, pointer 22: The wrong pointer
(944715855) in the file [7471218 636]. Must be fixed on pass0.
Aborted

The logfile is attached.  If I you are already aware of the bug, and can
offer me a solution that will recover my data, I'll gladly pay you $25.

John

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="LOGFILE.LOG"

####### Pass 0 #######
pass0: block 8432, item 110 114 0x26a10000 DIR (3), len 1600, location 2496 entry count 50, fsck need 1, format old: 8 entries were deleted
pass0: block 8479, item 7209070 114 0x6ae6d400 DIR (3), len 3040, location 1056 entry count 95, fsck need 1, format old: 11 entries were deleted
pass0: vpf-10460: block 8503, item 6: Wrong order of items - change the dir_id of the key [7471218 23200098 0x0 SD (0)] to 114
pass0: vpf-10600: block 8503, item 6: Wrong order of items - change the object_id of the key [114 23200098 0x0 SD (0)] to 354
pass0: vpf-10210: block 8532, item 0: The item with wrong offset or length found [7471218 470 0x1990199 DRCT (2)], len 880 - deleted
pass0: block 8553, item 7209070 114 0x47046280 DIR (3), len 3264, location 832 entry count 102, fsck need 1, format old: 10 entries were deleted
pass0: block 8558, item 110 114 0x3273aa80 DIR (3), len 2848, location 1248 entry count 89, fsck need 1, format old: 11 entries were deleted
pass0: vpf-10450: block 8565, item 0: Wrong order of items - change the dir_id of the key [7471218 582 0x1 DRCT (2)] to 114
pass0: block 8605, item 7209070 7471218 0x1 DIR (3), len 2928, location 1168 entry count 92, fsck need 1, format old: 13 entries were deleted
pass0: block 8609, item 3 13 0x1 DIR (3), len 104, location 3244 entry count 4, fsck need 1, format old: 1 entries were deleted
pass0: block 8624, item 110 114 0x58cd2500 DIR (3), len 2912, location 1184 entry count 91, fsck need 1, format old: 6 entries were deleted
pass0: block 8634, item 110 7471218 0x11b51e00 DIR (3), len 3072, location 1024 entry count 96, fsck need 1, format old: 14 entries were deleted
pass0: block 8661, item 1: StatData item of wrong length found 114 1023032570 0x0 SD (0), len 8, location 4044 entry count 0, fsck need 1, format new - deleted
pass0: vpf-10170: block 8661: item 1: Wrong order of items - the item 
	114 81146 0x2001 DRCT (2), len 656, location 3396 entry count 65535, fsck need 1, format new fixed to 
	114 81146 0x1 DRCT (2), len 656, location 3396 entry count 65535, fsck need 1, format new
pass0: block 8990, item 2 81888 0x1 DIR (3), len 2728, location 1368 entry count 102, fsck need 0, format old: 7 entries were deleted
pass0: vpf-10460: block 11903, item 2: Wrong order of items - change the dir_id of the key [554705168 1014447223 0x0 SD (0)] to 8464
pass0: vpf-10550: block 11903, item 2: Wrong order of items - change the object_id of the key [8464 1014447223 0x0 SD (0)] to 15479
pass0: block 30619, item 81888 81996 0x1 DIR (3), len 304, location 3568 entry count 11, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10590: block 30619, item 10: Wrong order of items - change the object_id of the key [81888 1079787612 0x10001 DRCT (2)] to 82012
pass0: vpf-10170: block 30619: item 10: Wrong order of items - the item 
	81888 82012 0x10001 DRCT (2), len 424, location 2876 entry count 65535, fsck need 0, format new fixed to 
	81888 82012 0x1 DRCT (2), len 424, location 2876 entry count 65535, fsck need 0, format new
pass0: vpf-10160: block 30619: item 12: No "." entry found in the first item of a directory
block 30619: item 12: ".." is 0-th entry
pass0: block 30619, item 81888 82025 0x1 DIR (3), len 472, location 1632 entry count 19, fsck need 0, format old: 4 entries were deleted
86 directory entries were hashed with not set hash.
96202 directory entries were hashed with "r5" hash.
####### Pass 1 #######
pass1: block 8432, item 0, entry 2: The entry "E177E7E7d01" of the [110 114 0x26a10000 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8432, item 0, entry 27: The entry "5C573232d0d0" of the [110 114 0x26a10000 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8479, item 0, entry 14: The entry "A3A30808d0d0" of the [7209070 114 0x6af4ff00 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8479, item 0, entry 23: The entry "E5E74899d01" of the [7209070 114 0x6af4ff00 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8479, item 0, entry 39: The entry "E5E53737d0d0" of the [7209070 114 0x6af4ff00 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8479, item 0, entry 49: The entry "14B8B721d01" of the [7209070 114 0x6af4ff00 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8479, item 0, entry 53: The entry "9292B7B7d0d0" of the [7209070 114 0x6af4ff00 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8479, item 0, entry 70: The entry "7C7C5DC1d01" of the [7209070 114 0x6af4ff00 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
zero_nlink: The StatData [114 354 0x0 SD (0)] of the wrong format version (3112) - corrected to (1)
pass1: block 8553, item 0, entry 0: The entry "F0F05A98d01" of the [7209070 114 0x47046280 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8553, item 0, entry 12: The entry "9F9FE998d01" of the [7209070 114 0x47417780 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8553, item 0, entry 39: The entry "0606E8E8d0d0" of the [7209070 114 0x47417780 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8553, item 0, entry 62: The entry "D0D04176d01" of the [7209070 114 0x47417780 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8553, item 0, entry 64: The entry "9620CB91d01" of the [7209070 114 0x47417780 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8553, item 0, entry 68: The entry "55901761d0d0" of the [7209070 114 0x47417780 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8553, item 0, entry 74: The entry "A6A67056d01" of the [7209070 114 0x47417780 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8553, item 0, entry 77: The entry "93491999d01" of the [7209070 114 0x47417780 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8553, item 0, entry 81: The entry "EAEED5D5d0d0" of the [7209070 114 0x47417780 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8558, item 0, entry 11: The entry "1515DADAd0d0" of the [110 114 0x3273aa80 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8558, item 0, entry 16: The entry "CFD5E93Ed01" of the [110 114 0x3273aa80 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8558, item 0, entry 38: The entry "A61C80DDd0d0" of the [110 114 0x3273aa80 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8558, item 0, entry 54: The entry "67A81D95d0d0" of the [110 114 0x3273aa80 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8558, item 0, entry 56: The entry "4A2AFCC5d01" of the [110 114 0x3273aa80 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8558, item 0, entry 64: The entry "A7679889d0d0" of the [110 114 0x3273aa80 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
is_leaf_bad: block 8565 items 5 and 6: Wrong order of items:
	7471218 585 0x0 SD (0), len 44, location 2876 entry count 65535, fsck need 1, format new
	114 585 0x1 DRCT (2), len 368, location 2508 entry count 65535, fsck need 1, format new
is_leaf_bad: WARNING: The leaf (8565) is formatted badly. Will be handled on the the pass2.

--HlL+5n6rz5pIUxbD--
