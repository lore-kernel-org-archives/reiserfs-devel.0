From: Oliver Jehle <oliver.jehle@monex.li>
Subject: reiserfsck aborts in pass1
Date: 02 May 2002 16:30:27 +0200
Message-ID: <1020349828.915.69.camel@vorab>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10211-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

i've got some problems with the filesystem, so i check the filesystem
with the reiserfsck. i'm on kernel 2.4.18 . but i think, the filesystem
was corrupted by an older kernel (2.4.14)... 



laax:~ # reiserfsck --rebuild-tree /dev/sdb1

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

  **********************************************************
  ** This  is  an  experimental  version  of  reiserfsck, **
  **              !! MAKE A BACKUP FIRST !!               **
  ** Don't run this program unless something  is  broken. **
  ** Some types of random FS damage can be recovered from **
  ** by  this  program,   which  basically   throws  away **
  ** the internal nodes of the tree and then reconstructs **
  ** them. This program is for use only by the desperate, **
  ** and is  of only beta quality.  If you are using  the **
  ** latest  reiserfsprogs  and  it  fails  please  email **
  ** bug reports to reiserfs-list@namesys.com.            **
  **********************************************************

Will rebuild the filesystem (/dev/sdb1) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Thu May  2 16:02:38 2002
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 3402700 blocks marked used
Skipping 8344 blocks (super block, journal, bitmaps) 3394356 blocks will
be read
0%pass0: vpf-10170: block 8787: item 12: (65535 1198 0x1 IND (1)) fixed
to 1196 1198 0x1 IND (1)
pass0: vpf-10170: block 8994: item 10: (2090 2095 0x1 IND (1)) fixed to
65535 2095 0x1 IND (1)
pass0: vpf-10180: block 8994: item 11: 2090 2095 0x1001 DRCT (2) follows
non stat item of the same file 65535 2095 0x1 IND (1) - deleted
pass0: block 8994: 10-th (upper) item (65535 2095 0x1 IND (1)) is out of
order, deleted
pass0: block 8994: 9-th (upper) item (65535 2095 0x0 SD (0)) is out of
order, deleted
pass0: block 9073, item 8 2571 0x1 DIR (3), len 363, location 3501 entry
count 14, fsck need 0, format old: 1 entries were deleted of
pass0: block 11909, item 6393 6394 0x1 DIR (3), len 2595, location 1501
entry count 56, fsck need 0, format old: 1 entries were deleted of
pass0: block 12955, item 9923 9941 0x7607f000 DIR (3), len 1443,
location 2653 entry count 31, fsck need 0, format old: 1 entries were
deleted of
pass0: block 14670, item 13454 13519 0x1 DIR (3), len 1172, location 144
entry count 23, fsck need 0, format old: 1 entries were deleted of
pass0: vpf-10170: block 16027: item 6: (13513 16600 0x1 DRCT (2)) fixed
to 885601481 16600 0x1 DRCT (2)
pass0: block 16027: 7-th (lower) item (13514 13515 0x0 SD (0)) is out of
order, deleted
pass0: block 19249, item 20475 21134 0x1 DIR (3), len 417, location 2120
entry count 8, fsck need 0, format old: 1 entries were deleted of
pass0: block 19672, item 20475 20498 0x1 DIR (3), len 2208, location 754
entry count 54, fsck need 0, format old: 1 entries were deleted of
pass0: block 19772, item 20479 20480 0x1 DIR (3), len 422, location 1223
entry count 7, fsck need 0, format old: 1 entries were deleted of
pass0: vpf-10170: block 22033: item 2: (28759 28761 0x1 DRCT (2)) fixed
to 28759 1884909657 0x1 DRCT (2)
pass0: block 22033: 2-th (upper) item (28759 1884909657 0x1 DRCT (2)) is
out of order, deleted
pass0: block 22033: 1-th (upper) item (28759 1884909657 0x0 SD (0)) is
out of order, deleted
pass0: block 22408, item 30030 30384 0x1 DIR (3), len 2197, location
1815 entry count 59, fsck need 0, format old: 1 entries were deleted of
pass0: vpf-10170: block 23408: item 2: (32157 33055 0x1 IND (1)) fixed
to 2107473309 33055 0x1 IND (1)
pass0: vpf-10180: block 23408: item 3: 32157 33055 0x1001 DRCT (2)
follows non stat item of the same file 2107473309 33055 0x1 IND (1) -
deleted
pass0: block 23408: 3-th (lower) item (32157 33057 0x0 SD (0)) is out of
order, deleted
pass0: block 29185, item 42608 42631 0x14943580 DIR (3), len 3518,
location 578 entry count 58, fsck need 0, format old: 1 entries were
deleted of
pass0: block 29785: 0-th (upper) item (3024467013 47099 0x781 DRCT (2))
is out of order, deleted
pass0: block 31632, item 49682 49683 0x1 DIR (3), len 2359, location 209
entry count 51, fsck need 0, format old: 1 entries were deleted of
pass0: block 31853, item 39033 49703 0x1 DIR (3), len 1237, location 213
entry count 26, fsck need 0, format old: 1 entries were deleted of
pass0: vpf-10170: block 36067: item 1: (3717062029 58528 0x1 IND (1))
fixed to 56717 58528 0x1 IND (1)
pass0: block 37780, item 4795 109387 0x1 DIR (3), len 68, location 3459
entry count 3, fsck need 0, format old: 1 entries were deleted of
pass0: block 39368, item 4805 4806 0x1 DIR (3), len 2449, location 1647
entry count 64, fsck need 0, format old: 1 entries were deleted of
pass0: vpf-10170: block 39408: item 10: (66421 66645 0x1 DRCT (2)) fixed
to 66421 72680533 0x1 DRCT (2)
pass0: block 39408: 10-th (upper) item (66421 72680533 0x1 DRCT (2)) is
out of order, deleted
pass0: block 39408: 9-th (upper) item (66421 72680533 0x0 SD (0)) is out
of order, deleted
pass0: block 39512, item 67251 67252 0x1 DIR (3), len 99, location 2044
entry count 4, fsck need 0, format old: 1 entries were deleted of
pass0: block 46239, item 77054 85498 0x1 DIR (3), len 2364, location
1576 entry count 56, fsck need 0, format old: 1 entries were deleted of
pass0: block 46304, item 88193 88194 0x358d9380 DIR (3), len 4016,
location 80 entry count 82, fsck need 0, format old: 1 entries were
deleted of
pass0: block 49310, item 6390 90752 0x1 DIR (3), len 2090, location 297
entry count 47, fsck need 0, format old: 1 entries were deleted of
pass0: vpf-10110: block 50868, item (2), unknown item type found (100155
102584 0x1 ??? (15)) - delete
pass0: vpf-10170: block 52455: item 8: (100038 106731 0x1 DRCT (2))
fixed to 100038 2699796715 0x1 DRCT (2)
pass0: block 52455: 8-th (upper) item (100038 2699796715 0x1 DRCT (2))
is out of order, deleted
pass0: block 52455: 7-th (upper) item (100038 2699796715 0x0 SD (0)) is
out of order, deleted
pass0: vpf-10160: block 53032: item 10: no "." entry found in the first
item of a directory
verify_direntry: block 53032, item 2816124890 108507 0x1 DIR (3), len
114, location 447 entry count 5, fsck need 0, format old has entry "."
pointing to (108506 108507) instead of (2816124890 108507)
pass0: block 53032: 10-th (upper) item (2816124890 108507 0x1 DIR (3))
is out of order, deleted
pass0: block 53032: 9-th (upper) item (2816124890 108507 0x0 SD (0)) is
out of order, deleted
verify_direntry: block 53252, item 69743 69744 0x1 DIR (3), len 52,
location 1920 entry count 3, fsck need 0, format old has entry "."
pointing to (275714159 69744) instead of (69743 69744)
pass0: vpf-10160: block 53396: item 7: no "." entry found in the first
item of a directory
verify_direntry: block 53396, item 20599 1355632845 0x1 DIR (3), len
636, location 3063 entry count 23, fsck need 0, format old has entry "."
pointing to (20599 20685) instead of (20599 1355632845)
pass0: block 53411, item 20601 20675 0x689a400 DIR (3), len 4021,
location 75 entry count 128, fsck need 0, format old: 1 entries were
deleted of
pass0: vpf-10170: block 57297: item 20: (2963058844 110771 0x1 IND (1))
fixed to 110748 110771 0x1 IND (1)
pass0: block 58450, item 109826 116634 0x1 DIR (3), len 2362, location
265 entry count 83, fsck need 0, format old: 2 entries were deleted of
pass0: block 61263, item 109826 116634 0x6e537880 DIR (3), len 2657,
location 1439 entry count 93, fsck need 0, format old: 1 entries were
deleted of
....20%....40%....60%....80%....100%                        left 0, 4175
/sec
not set got 21 hits
"r5" got 123463 hits
        "r5" hash is selected
Flushing..done
        Read blocks (but not data blocks) 3394356
                Leaves among those 50848
                        - corrected leaves 2919
                pointers in indirect items to wrong area 41 (zeroed)
                Objectids found 123459

Pass 1 (will try to insert 50848 leaves):
####### Pass 1 #######
Looking for allocable blocks .. ok
0%....20%....40%....pass1.c 389 pass1_correct_leaf        left 22237,
1144 /sec
pass1_correct_leaf: (37853: 4274 62934 0x1 IND (1)), 2-th slot is not
fixed
Aborted


