From: Richard Dunn <richard.dunn@arkona.com>
Subject: reiserfsck failing at 3299032 consistently
Date: Sun, 6 Jun 2004 09:53:54 -0600
Message-ID: <200406060953.54417.richard.dunn@arkona.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_S4zwA/yjslqGqXG"
Return-path: <reiserfs-list-return-19047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_S4zwA/yjslqGqXG
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I performed a "reiserfsck --rebuild-tree /dev/sda1" on an external Western 
Digital harddrive via firewire after the --check report errors only fixable 
by --rebuild-tree. The reiserfsck scan failed at block 3299032 and to send 
the bug report only if the second dies at the same place with the same block 
number. I ran --rebuild-tree again:

[root@rcdunn:18:22:42:~]# reiserfsck --quiet --logfile reiser_sda1.log 
--rebuild-tree /dev/sda1
reiserfsck 3.6.13 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will rebuild the filesystem (/dev/sda1) tree
Will put log info to 'reiser_sda1.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/sda1' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Sat Jun  5 18:24:40 2004
###########

Pass 0:
Loading on-disk bitmap .. ok, 29610951 blocks marked used
Skipping 9403 blocks (super block, journal, bitmaps) 29601548 blocks will be 
read
0%....20%....40%....60%....80%....100%
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 29601548
                Leaves among those 64864
                        - corrected leaves 70
                Objectids found 192798

Pass 1 (will try to insert 64864 leaves):
Looking for allocable blocks .. finished
0%....20%....40%.
The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

mark_block_used: (3299032) used already
Aborted
[root@rcdunn:20:39:31:~]#

The same block number "3299032" shows up again.

My hardware:

Gateway 9300XL laptop, 600 Mhz Pentium III, 293 MB Ram
External Western Digital WD1600B011-RNN 150 GB hard drive
Using firewire interface

OS: SuSE 9.1 with all current patches to Jun 6, 2004.
Linux rcdunn 2.6.4-54.5-default #1 Fri May 7 21:43:10 UTC 2004 i686 i686 i386 
GNU/Linux
reiserfsck 3.6.13 (2003 www.namesys.com)

All I found in syslogs (from boot, I believe) was:

Jun  5 10:57:58 rcdunn kernel: ReiserFS: sda1: found reiserfs format "3.6" 
with standard journal
Jun  5 10:58:06 rcdunn kernel: ReiserFS: sda1: using ordered data mode
Jun  5 10:58:06 rcdunn kernel: ReiserFS: sda1: journal params: device sda1, 
size 8192, journal first block 18, max trans len 1024, max batch 900, max 
commit age 30, max trans age 30
Jun  5 10:58:06 rcdunn kernel: ReiserFS: sda1: checking transaction log (sda1)
Jun  5 10:58:06 rcdunn kernel: ReiserFS: sda1: Using r5 hash to sort names



--Boundary-00=_S4zwA/yjslqGqXG
Content-Type: text/x-log;
  charset="us-ascii";
  name="reiser_sda1.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="reiser_sda1.log"

####### Pass 0 #######
pass0: vpf-10160: block 3546613: item 13: No "." entry found in the first i=
tem of a directory
verify_directory_item: block 3546613, item 416 417 0x77cd2e00 DIR (3), len =
24, location 2428 entry count 1, fsck need 1, format old: All entries were =
deleted from the directory
pass0: vpf-10160: block 3547516: item 2: No "." entry found in the first it=
em of a directory
pass0: vpf-10170: block 3555745: item 15: Wrong order of items - the item=20
	1545 2066 0x80000000000001 DRCT (2), len 160, location 412 entry count 655=
35, fsck need 1, format new fixed to=20
	1545 2066 0x1 DRCT (2), len 160, location 412 entry count 65535, fsck need=
 1, format new
pass0: block 3568136, item 3894 3969 0x1 DIR (3), len 104, location 296 ent=
ry count 4, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10110: block 3569117, item (15): Unknown item type found [4544 4=
555 0x1 ??? (15)] - deleted
pass0: block 3569373, item 6092 6171 0x1 DIR (3), len 136, location 3916 en=
try count 5, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 3570237: item 16: No "." entry found in the first i=
tem of a directory
pass0: block 3570237, item 8164 8165 0x14e0400 DIR (3), len 80, location 23=
68 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 3571149: item 2: No "." entry found in the first it=
em of a directory
pass0: block 3571383, item 12938 13307 0x1 DIR (3), len 120, location 3932 =
entry count 4, fsck need 1, format old: 1 entries were deleted
pass0: block 3571416, item 13426 13428 0x1 DIR (3), len 128, location 3860 =
entry count 5, fsck need 1, format old: 1 entries were deleted
pass0: block 3571623, item 14412 14418 0x1 DIR (3), len 120, location 3932 =
entry count 5, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 3571623: item 27: No "." entry found in the first i=
tem of a directory
pass0: vpf-10170: block 3571695: item 15: Wrong order of items - the item=20
	14653 14654 0x80000000000001 DRCT (2), len 1640, location 624 entry count =
65535, fsck need 1, format new fixed to=20
	14653 14654 0x1 DRCT (2), len 1640, location 624 entry count 65535, fsck n=
eed 1, format new
pass0: vpf-10160: block 4271084: item 3: No "." entry found in the first it=
em of a directory
pass0: block 4271084, item 17892 17893 0x14e0400 DIR (3), len 80, location =
3904 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4271654: item 2: No "." entry found in the first it=
em of a directory
pass0: block 4271654, item 19123 19125 0x14e0400 DIR (3), len 80, location =
3908 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4271703: item 4: No "." entry found in the first it=
em of a directory
pass0: block 4271703, item 19205 19260 0xea39700 DIR (3), len 160, location=
 2288 entry count 4, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4271861: item 4: No "." entry found in the first it=
em of a directory
pass0: block 4271861, item 19208 19209 0x2a1180 DIR (3), len 48, location 2=
400 entry count 2, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4271861: item 8: No "." entry found in the first it=
em of a directory
pass0: vpf-10160: block 4272195: item 2: No "." entry found in the first it=
em of a directory
pass0: block 4272195, item 19883 19885 0x14e0400 DIR (3), len 80, location =
3908 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4277849: item 6: No "." entry found in the first it=
em of a directory
pass0: block 4277849, item 21119 22784 0x18a000 DIR (3), len 512, location =
1940 entry count 16, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10170: block 4279561: item 15: Wrong order of items - the item=20
	22747 22753 0x80000000000001 DRCT (2), len 1568, location 408 entry count =
65535, fsck need 1, format new fixed to=20
	22747 22753 0x1 DRCT (2), len 1568, location 408 entry count 65535, fsck n=
eed 1, format new
pass0: vpf-10160: block 4283473: item 16: No "." entry found in the first i=
tem of a directory
pass0: block 4283473, item 25210 25211 0x14e0400 DIR (3), len 80, location =
2368 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4284056: item 2: No "." entry found in the first it=
em of a directory
pass0: block 4284056, item 26004 26006 0x14e0400 DIR (3), len 80, location =
3908 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4284608: item 16: No "." entry found in the first i=
tem of a directory
pass0: block 4284608, item 26747 26748 0x14e0400 DIR (3), len 80, location =
2368 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4284694: item 2: No "." entry found in the first it=
em of a directory
pass0: block 4284694, item 26866 26868 0x14e0400 DIR (3), len 80, location =
3908 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4284733: item 4: No "." entry found in the first it=
em of a directory
pass0: block 4284733, item 26948 27003 0xea39700 DIR (3), len 160, location=
 2288 entry count 4, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4287598: item 4: No "." entry found in the first it=
em of a directory
pass0: block 4287598, item 28488 28543 0xea39700 DIR (3), len 160, location=
 2288 entry count 4, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4290175: item 2: No "." entry found in the first it=
em of a directory
pass0: block 4290175, item 31894 31896 0x14e0400 DIR (3), len 80, location =
3908 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4290333: item 16: No "." entry found in the first i=
tem of a directory
pass0: block 4290333, item 32637 32638 0x14e0400 DIR (3), len 80, location =
2368 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 4290669: item 2: No "." entry found in the first it=
em of a directory
pass0: vpf-10160: block 4291949: item 7: No "." entry found in the first it=
em of a directory
verify_directory_item: block 4291949, item 41272 41273 0x77682880 DIR (3), =
len 32, location 2416 entry count 1, fsck need 1, format old: All entries w=
ere deleted from the directory
pass0: vpf-10170: block 5043994: item 15: Wrong order of items - the item=20
	42141 49384 0x80000000000001 DRCT (2), len 824, location 412 entry count 6=
5535, fsck need 1, format new fixed to=20
	42141 49384 0x1 DRCT (2), len 824, location 412 entry count 65535, fsck ne=
ed 1, format new
pass0: vpf-10170: block 5045420: item 15: Wrong order of items - the item=20
	42141 59233 0x80000000000001 DRCT (2), len 936, location 408 entry count 6=
5535, fsck need 1, format new fixed to=20
	42141 59233 0x1 DRCT (2), len 936, location 408 entry count 65535, fsck ne=
ed 1, format new
pass0: block 5045873, item 62245 62246 0x1 DIR (3), len 168, location 2028 =
entry count 6, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 5045941: item 8: No "." entry found in the first it=
em of a directory
pass0: block 5046110, item 63417 63418 0x1 DIR (3), len 120, location 3932 =
entry count 4, fsck need 1, format old: 1 entries were deleted
pass0: block 5327657, item 71167 71260 0x1 DIR (3), len 136, location 3916 =
entry count 5, fsck need 1, format old: 1 entries were deleted
pass0: block 5338599, item 74422 74424 0x1 DIR (3), len 112, location 2084 =
entry count 4, fsck need 1, format old: 1 entries were deleted
pass0: block 5338635, item 74727 74732 0x1 DIR (3), len 352, location 3632 =
entry count 11, fsck need 1, format old: 1 entries were deleted
pass0: block 5338681, item 75299 75301 0x1 DIR (3), len 2512, location 364 =
entry count 79, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10110: block 8256459, item (15): Unknown item type found [78226 =
78241 0x1 ??? (15)] - deleted
pass0: vpf-10110: block 8256461, item (15): Unknown item type found [78261 =
78278 0x1 ??? (15)] - deleted
pass0: vpf-10110: block 8256463, item (15): Unknown item type found [78331 =
78353 0x1 ??? (15)] - deleted
pass0: vpf-10160: block 8257286: item 16: No "." entry found in the first i=
tem of a directory
pass0: block 8257286, item 82415 82435 0x18a000 DIR (3), len 88, location 2=
360 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 8257390: item 2: No "." entry found in the first it=
em of a directory
pass0: block 8257390, item 82965 82966 0x14e0400 DIR (3), len 80, location =
3908 entry count 3, fsck need 1, format old: 1 entries were deleted
pass0: block 11564284, item 86108 86109 0x1 DIR (3), len 336, location 2060=
 entry count 10, fsck need 1, format old: 1 entries were deleted
pass0: vpf-10160: block 11565194: item 3: No "." entry found in the first i=
tem of a directory
block 11565194: item 3: ".." is 0-th entry
pass0: vpf-10160: block 11565543: item 10: No "." entry found in the first =
item of a directory
pass0: block 11565543, item 93183 93189 0x2 DIR (3), len 200, location 2248=
 entry count 5, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 11566632: item 10: No "." entry found in the first =
item of a directory
pass0: block 11566632, item 99466 99468 0x2 DIR (3), len 88, location 2108 =
entry count 3, fsck need 0, format old: 1 entries were deleted
pass0: block 11566673, item 99771 99818 0x1 DIR (3), len 344, location 2364=
 entry count 10, fsck need 0, format old: 1 entries were deleted
pass0: block 11566833, item 98363 101498 0x1 DIR (3), len 1720, location 23=
32 entry count 39, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 24459109: item 3: No "." entry found in the first i=
tem of a directory
block 24459109: item 3: ".." is 0-th entry
pass0: block 24459159, item 105102 105129 0x1 DIR (3), len 560, location 16=
36 entry count 16, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 24460929: item 16: No "." entry found in the first =
item of a directory
pass0: block 24460929, item 105513 105524 0x2 DIR (3), len 56, location 213=
6 entry count 2, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 24572779: item 6: No "." entry found in the first i=
tem of a directory
pass0: block 24572779, item 108446 108453 0x2 DIR (3), len 192, location 22=
56 entry count 6, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 24572796: item 4: No "." entry found in the first i=
tem of a directory
block 24572796: item 4: ".." is 0-th entry
pass0: block 24573258, item 110521 110606 0x1 DIR (3), len 992, location 20=
44 entry count 31, fsck need 0, format old: 2 entries were deleted
pass0: block 24573765, item 112197 112237 0x1 DIR (3), len 912, location 19=
16 entry count 26, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 24574480: item 8: No "." entry found in the first i=
tem of a directory
block 24574480: item 8: ".." is 0-th entry
pass0: vpf-10160: block 24574737: item 3: No "." entry found in the first i=
tem of a directory
block 24574737: item 3: ".." is 0-th entry
pass0: vpf-10160: block 24575226: item 12: No "." entry found in the first =
item of a directory
pass0: block 24575226, item 116468 116476 0x2 DIR (3), len 360, location 20=
92 entry count 15, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 25918224: item 40: No "." entry found in the first =
item of a directory
verify_directory_item: block 25918224, item 120238 120255 0x2 DIR (3), len =
24, location 2168 entry count 1, fsck need 0, format old: All entries were =
deleted from the directory
pass0: block 25918256, item 120421 120422 0x1 DIR (3), len 1080, location 2=
332 entry count 30, fsck need 0, format old: 1 entries were deleted
pass0: block 25918284, item 120421 120600 0x1 DIR (3), len 1784, location 2=
268 entry count 40, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 25918328: item 12: No "." entry found in the first =
item of a directory
verify_directory_item: block 25918328, item 120884 120886 0x2 DIR (3), len =
24, location 2428 entry count 1, fsck need 0, format old: All entries were =
deleted from the directory
pass0: vpf-10160: block 25918467: item 2: No "." entry found in the first i=
tem of a directory
block 25918467: item 2: ".." is 0-th entry
pass0: vpf-10160: block 25918576: item 3: No "." entry found in the first i=
tem of a directory
block 25918576: item 3: ".." is 0-th entry
pass0: vpf-10160: block 25919041: item 29: No "." entry found in the first =
item of a directory
pass0: block 25919041, item 124107 124132 0x2 DIR (3), len 616, location 18=
36 entry count 17, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 25919143: item 3: No "." entry found in the first i=
tem of a directory
block 25919143: item 3: ".." is 0-th entry
pass0: vpf-10160: block 25919251: item 4: No "." entry found in the first i=
tem of a directory
pass0: block 25919251, item 124989 124990 0x2 DIR (3), len 48, location 240=
0 entry count 2, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 25919257: item 29: No "." entry found in the first =
item of a directory
pass0: block 25919257, item 125056 125081 0x2 DIR (3), len 616, location 18=
36 entry count 17, fsck need 0, format old: 1 entries were deleted
pass0: block 26168822, item 126749 126819 0x1 DIR (3), len 624, location 20=
28 entry count 19, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 26171343: item 29: No "." entry found in the first =
item of a directory
pass0: block 26171343, item 127564 127589 0x2 DIR (3), len 616, location 18=
36 entry count 17, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 26178796: item 9: No "." entry found in the first i=
tem of a directory
pass0: block 26178796, item 129271 129276 0x2 DIR (3), len 72, location 238=
0 entry count 3, fsck need 0, format old: 1 entries were deleted
pass0: block 26178923, item 130025 130039 0x1 DIR (3), len 120, location 20=
76 entry count 5, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 26178953: item 8: No "." entry found in the first i=
tem of a directory
pass0: block 26178953, item 130120 130415 0x2 DIR (3), len 80, location 236=
8 entry count 3, fsck need 0, format old: 1 entries were deleted
pass0: block 26178967, item 130242 130247 0x1 DIR (3), len 152, location 23=
96 entry count 5, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 26179558: item 6: No "." entry found in the first i=
tem of a directory
pass0: block 26179558, item 132701 132702 0x2 DIR (3), len 56, location 239=
6 entry count 2, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 26179748: item 3: No "." entry found in the first i=
tem of a directory
block 26179748: item 3: ".." is 0-th entry
pass0: block 26179903, item 134831 135165 0x1 DIR (3), len 968, location 20=
44 entry count 34, fsck need 0, format old: 1 entries were deleted
pass0: block 26179945, item 135167 135278 0x1 DIR (3), len 1696, location 1=
580 entry count 55, fsck need 0, format old: 2 entries were deleted
pass0: block 26180261, item 137294 137341 0x1 DIR (3), len 344, location 23=
64 entry count 10, fsck need 0, format old: 1 entries were deleted
pass0: block 26180420, item 135886 139021 0x1 DIR (3), len 1720, location 2=
332 entry count 39, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 26181102: item 6: No "." entry found in the first i=
tem of a directory
pass0: block 26181102, item 141172 141500 0x2 DIR (3), len 864, location 13=
32 entry count 29, fsck need 0, format old: 1 entries were deleted
pass0: block 26181152, item 140877 142796 0x1 DIR (3), len 1264, location 2=
028 entry count 45, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 26181178: item 8: No "." entry found in the first i=
tem of a directory
pass0: block 26181178, item 141587 141590 0x2 DIR (3), len 176, location 20=
16 entry count 6, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 26751757: item 15: No "." entry found in the first =
item of a directory
pass0: block 26751757, item 149206 149251 0x2 DIR (3), len 136, location 23=
12 entry count 5, fsck need 0, format old: 1 entries were deleted
pass0: block 26769989, item 152457 152458 0x1 DIR (3), len 1008, location 2=
300 entry count 26, fsck need 0, format old: 1 entries were deleted
pass0: block 26770223, item 153458 153815 0x1 DIR (3), len 800, location 21=
56 entry count 23, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 26770483: item 12: No "." entry found in the first =
item of a directory
pass0: block 26770483, item 154921 154922 0x2 DIR (3), len 104, location 20=
88 entry count 4, fsck need 0, format old: 1 entries were deleted
pass0: block 26771296, item 157379 157712 0x1 DIR (3), len 208, location 23=
64 entry count 7, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 27587509: item 10: No "." entry found in the first =
item of a directory
pass0: block 27587509, item 161613 161618 0x2 DIR (3), len 48, location 240=
0 entry count 2, fsck need 0, format old: 1 entries were deleted
pass0: block 27587509, item 161613 161625 0x1 DIR (3), len 200, location 21=
80 entry count 7, fsck need 0, format old: 1 entries were deleted
pass0: block 27587622, item 161992 162048 0x1 DIR (3), len 1648, location 2=
028 entry count 52, fsck need 0, format old: 1 entries were deleted
pass0: block 27588778, item 163046 163073 0x1 DIR (3), len 560, location 16=
36 entry count 16, fsck need 0, format old: 1 entries were deleted
pass0: block 27589194, item 163348 164918 0x1 DIR (3), len 504, location 23=
64 entry count 9, fsck need 0, format old: 1 entries were deleted
pass0: block 27590466, item 169029 169038 0x1 DIR (3), len 648, location 21=
40 entry count 17, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 27590559: item 8: No "." entry found in the first i=
tem of a directory
pass0: block 27590559, item 169365 169366 0x2 DIR (3), len 72, location 237=
6 entry count 3, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 28955447: item 18: No "." entry found in the first =
item of a directory
pass0: block 28955447, item 174383 174419 0x2 DIR (3), len 160, location 22=
92 entry count 4, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 28958842: item 2: No "." entry found in the first i=
tem of a directory
pass0: block 28958842, item 175440 175515 0x2 DIR (3), len 472, location 17=
24 entry count 14, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 28963629: item 16: No "." entry found in the first =
item of a directory
pass0: block 28963629, item 176724 176725 0x2 DIR (3), len 208, location 22=
40 entry count 7, fsck need 0, format old: 1 entries were deleted
pass0: block 28963629, item 176725 176726 0x1 DIR (3), len 240, location 19=
80 entry count 7, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 28963761: item 12: No "." entry found in the first =
item of a directory
pass0: block 28963761, item 177185 177364 0x2 DIR (3), len 96, location 235=
2 entry count 3, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 28964129: item 3: No "." entry found in the first i=
tem of a directory
block 28964129: item 3: ".." is 0-th entry
pass0: vpf-10160: block 28964202: item 4: No "." entry found in the first i=
tem of a directory
block 28964202: item 4: ".." is 0-th entry
pass0: vpf-10160: block 28964206: item 10: No "." entry found in the first =
item of a directory
pass0: block 28964206, item 179361 179372 0x2 DIR (3), len 336, location 18=
60 entry count 9, fsck need 0, format old: 1 entries were deleted
pass0: block 28964243, item 178877 178881 0x1 DIR (3), len 776, location 19=
80 entry count 19, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 28964280: item 4: No "." entry found in the first i=
tem of a directory
block 28964280: item 4: ".." is 0-th entry
pass0: vpf-10160: block 28964331: item 8: No "." entry found in the first i=
tem of a directory
pass0: block 28964331, item 180933 180934 0x2 DIR (3), len 72, location 212=
0 entry count 3, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 28966770: item 20: No "." entry found in the first =
item of a directory
pass0: block 28966770, item 191693 191694 0x2 DIR (3), len 48, location 240=
4 entry count 2, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 28966775: item 2: No "." entry found in the first i=
tem of a directory
block 28966775: item 2: ".." is 0-th entry
pass0: block 28966775, item 191108 191673 0x1 DIR (3), len 192, location 23=
48 entry count 7, fsck need 0, format old: 1 entries were deleted
pass0: vpf-10160: block 28966876: item 8: No "." entry found in the first i=
tem of a directory
pass0: block 28966876, item 192258 192263 0x2 DIR (3), len 56, location 239=
2 entry count 2, fsck need 0, format old: 1 entries were deleted
87 directory entries were hashed with not set hash.
192606 directory entries were hashed with "r5" hash.
####### Pass 1 #######
pass1: block 3568136, item 10, entry 0: The entry ".." of the [3894 3969 0x=
2 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
is_leaf_bad: block 3570126, item 8: The corrupted item found (7575 7667 0x1=
 DIR (3), len 96, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (3570126) is formatted badly. Will be handle=
d on the the pass2.
pass1: block 3570237, item 16, entry 0: The entry "Repository" of the [8164=
 8165 0x15ca2d80 DIR (3)] is hashed with not set whereas proper hash is "r5=
" - deleted
is_leaf_bad: block 3570560, item 5: The corrupted item found (9531 9566 0x1=
 DIR (3), len 112, location 2444 entry count 4, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (3570560) is formatted badly. Will be handle=
d on the the pass2.
pass1: block 3571416, item 2, entry 0: The entry ".." of the [13426 13428 0=
x2 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
is_leaf_bad: block 4271192, item 6: The corrupted item found (18445 18594 0=
x1 DIR (3), len 72, location 2188 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4271192) is formatted badly. Will be handle=
d on the the pass2.
pass1: block 4271703, item 4, entry 0: The entry "insert_webentry_0.sql" of=
 the [19205 19260 0x513e7180 DIR (3)] is hashed with not set whereas proper=
 hash is "r5" - deleted
pass1: block 4271861, item 4, entry 0: The entry "util" of the [19208 19209=
 0x1cd0400 DIR (3)] is hashed with not set whereas proper hash is "r5" - th=
e only entry - item was deleted
pass1: block 4271861, item 9, entry 0: The entry "." of the [19210 19211 0x=
1 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 4271861, item 9, entry 0: The entry ".." of the [19210 19211 0=
x2 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
is_leaf_bad: block 4272474, item 8: The corrupted item found (20087 20179 0=
x1 DIR (3), len 96, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4272474) is formatted badly. Will be handle=
d on the the pass2.
pass1: block 4277849, item 6, entry 0: The entry "js=F0" of the [21119 2278=
4 0x264700 DIR (3)] is hashed with not set whereas proper hash is "r5" - de=
leted
pass1: block 4277849, item 6, entry 13: The entry "todate_en.properties" of=
 the [21119 22784 0x269780 DIR (3)] is hashed with not set whereas proper h=
ash is "r5" - deleted
is_leaf_bad: block 4281957, item 18: The corrupted item found (23204 23239 =
0x1 DIR (3), len 120, location 2428 entry count 5, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4281957) is formatted badly. Will be handle=
d on the the pass2.
is_leaf_bad: block 4283191, item 8: The corrupted item found (24621 24713 0=
x1 DIR (3), len 96, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4283191) is formatted badly. Will be handle=
d on the the pass2.
pass1: block 4283473, item 16, entry 0: The entry "Repository" of the [2521=
0 25211 0x15ca2d80 DIR (3)] is hashed with not set whereas proper hash is "=
r5" - deleted
is_leaf_bad: block 4283795, item 8: The corrupted item found (25458 25550 0=
x1 DIR (3), len 96, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4283795) is formatted badly. Will be handle=
d on the the pass2.
is_leaf_bad: block 4284236, item 8: The corrupted item found (26158 26250 0=
x1 DIR (3), len 96, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4284236) is formatted badly. Will be handle=
d on the the pass2.
pass1: block 4284608, item 16, entry 0: The entry "Repository" of the [2674=
7 26748 0x15ca2d80 DIR (3)] is hashed with not set whereas proper hash is "=
r5" - deleted
pass1: block 4284733, item 4, entry 0: The entry "insert_webentry_0.sql" of=
 the [26948 27003 0x513e7180 DIR (3)] is hashed with not set whereas proper=
 hash is "r5" - deleted
pass1: block 4287598, item 4, entry 0: The entry "insert_webentry_0.sql" of=
 the [28488 28543 0x513e7180 DIR (3)] is hashed with not set whereas proper=
 hash is "r5" - deleted
is_leaf_bad: block 4288827, item 8: The corrupted item found (30132 30224 0=
x1 DIR (3), len 96, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4288827) is formatted badly. Will be handle=
d on the the pass2.
is_leaf_bad: block 4289952, item 8: The corrupted item found (30806 30898 0=
x1 DIR (3), len 96, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4289952) is formatted badly. Will be handle=
d on the the pass2.
is_leaf_bad: block 4290223, item 8: The corrupted item found (32048 32140 0=
x1 DIR (3), len 96, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4290223) is formatted badly. Will be handle=
d on the the pass2.
is_leaf_bad: block 4290232, item 6: The corrupted item found (32048 32168 0=
x1 DIR (3), len 72, location 2188 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4290232) is formatted badly. Will be handle=
d on the the pass2.
pass1: block 4290333, item 16, entry 0: The entry "Repository" of the [3263=
7 32638 0x15ca2d80 DIR (3)] is hashed with not set whereas proper hash is "=
r5" - deleted
is_leaf_bad: block 4290550, item 6: The corrupted item found (33501 33502 0=
x1 DIR (3), len 328, location 2444 entry count 9, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4290550) is formatted badly. Will be handle=
d on the the pass2.
is_leaf_bad: block 4290619, item 6: The corrupted item found (33641 33659 0=
x1 DIR (3), len 72, location 2188 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4290619) is formatted badly. Will be handle=
d on the the pass2.
is_leaf_bad: block 4291750, item 18: The corrupted item found (40514 40526 =
0x1 DIR (3), len 80, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (4291750) is formatted badly. Will be handle=
d on the the pass2.
pass1: block 5045873, item 23, entry 0: The entry "..=80" of the [62245 622=
46 0x2 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 5045941, item 8, entry 0: The entry "index.html" of the [62805=
 62814 0x2e4f3d80 DIR (3)] is hashed with not set whereas proper hash is "r=
5" - the only entry - item was deleted
pass1: block 5338599, item 10, entry 0: The entry "..=80" of the [74422 744=
24 0x2 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 5338635, item 4, entry 0: The entry ".." of the [74727 74732 0=
x2 DIR (3)] is hashed with not set whereas proper hash is "r5" - deleted
pass1: block 8257286, item 16, entry 0: The entry "User.java" of the [82415=
 82435 0x38313000 DIR (3)] is hashed with not set whereas proper hash is "r=
5" - deleted
is_leaf_bad: block 11563950, item 16: The corrupted item found (84741 84781=
 0x1 DIR (3), len 96, location 2444 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (11563950) is formatted badly. Will be handl=
ed on the the pass2.
is_leaf_bad: block 11564406, item 12: The corrupted item found (86513 86514=
 0x1 DIR (3), len 72, location 2188 entry count 3, fsck need 0, format old)
is_leaf_bad: WARNING: The leaf (11564406) is formatted badly. Will be handl=
ed on the the pass2.

--Boundary-00=_S4zwA/yjslqGqXG--
