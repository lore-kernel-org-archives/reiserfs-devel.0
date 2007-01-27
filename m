From: "George Sohos" <gsohos@gmail.com>
Subject: reiserfsck aborting while rebuilding tree
Date: Sat, 27 Jan 2007 16:45:51 -0500
Message-ID: <e59fbf1a0701271345o54dc4961te8b67261a4675d3a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_20389_28089803.1169934351941"
Return-path: <reiserfs-list-return-30473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_20389_28089803.1169934351941
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

I have a problem similar to one posted in the list about two weeks ago (see
message reiserfsck 3.6.19 fails to rebuild-tree badly broken
fs<http://www.mail-archive.com/reiserfs-list@namesys.com/msg22539.html>).
I started seeing some kernel dumps while updatedb was running its nightly
cycle. Sometimes the system would become unresponsive and nothing but a soft
reset would help. The last couple of days reboot would hang while unmounting
local filesystems, so yesterday I decided to check if there are any
filesystem errors that where the reason of all this behavior. (I am not an
expert at analyzing kernel dumps but genksyms was complaining about
filp_close, which, I think, is in fs kernel code).

I should note that this is a fairly new system with less than one year of
operation. It runs a gentoo 2.6.18-r3 (but maybe a later r?, I cannot tell
at the moment). I used systemrescuecd 0.3.2 and the reiserfs tools from
there. The filesystem itself was built from whatever was stable in gentoo
about a year ago.

reiserfsck --check /dev/sda3 suggested that I rebuild the tree. I tried that
several times, but every time the failure is because while running pass1, it
thinks that it should fix something in pass0 and just aborts. This leaves
the filesystem in an unmountable state.

badblocks /dev/sda3 came up with nothing, so at least it doesn't look like a
disk error.

My question is: Is there a way to force the filesystem to a state where I
can mount it again. Does anyone know what that message means? Why doesn't
pass0 fix the issue? Can I force pass0 to fix the problem?

Here is the output from reiserfsck:


####### Pass 0 #######

pass0: vpf-10600: block 3342481, item 1: Wrong order of items - change the
object_id of the key [171796 67977468 0x0 SD (0)] to 868604

pass0: vpf-10600: block 3342481, item 5: Wrong order of items - change the
object_id of the key [171796 67977470 0x0 SD (0)] to 868606

pass0: vpf-10170: block 3342481: item 6: Wrong order of items - the item

171796 868606 0x400000000000001 DRCT (2), len 1168, location 260 entry count
65535, fsck need 1, format new fixed to

171796 868606 0x1 DRCT (2), len 1168, location 260 entry count 65535, fsck
need 1, format new

pass0: vpf-10600: block 5348244, item 1: Wrong order of items - change the
object_id of the key [2622502 69731409 0x0 SD (0)] to 2622545

pass0: vpf-10600: block 5348244, item 5: Wrong order of items - change the
object_id of the key [2622502 69731411 0x0 SD (0)] to 2622547

pass0: vpf-10170: block 5348244: item 6: Wrong order of items - the item

2622502 2622547 0x400000000000001 DRCT (2), len 72, location 3556 entry
count 65535, fsck need 1, format new fixed to

2622502 2622547 0x1 DRCT (2), len 72, location 3556 entry count 65535, fsck
need 1, format new

pass0: vpf-10170: block 5348244: item 10: Wrong order of items - the item

2622502 2622549 0x400000000000001 DRCT (2), len 72, location 3316 entry
count 65535, fsck need 1, format new fixed to

2622502 2622549 0x1 DRCT (2), len 72, location 3316 entry count 65535, fsck
need 1, format new

pass0: vpf-10600: block 5348244, item 17: Wrong order of items - change the
object_id of the key [2622502 69731417 0x0 SD (0)] to 2622553

pass0: vpf-10600: block 5348244, item 21: Wrong order of items - change the
object_id of the key [2622502 69731419 0x0 SD (0)] to 2622555

pass0: vpf-10170: block 5348244: item 22: Wrong order of items - the item

2622502 2622555 0x400000000000001 DRCT (2), len 296, location 2076 entry
count 65535, fsck need 1, format new fixed to

2622502 2622555 0x1 DRCT (2), len 296, location 2076 entry count 65535, fsck
need 1, format new

pass0: vpf-10170: block 5348244: item 26: Wrong order of items - the item

2622502 2622557 0x400000000000001 DRCT (2), len 72, location 1844 entry
count 65535, fsck need 1, format new fixed to

2622502 2622557 0x1 DRCT (2), len 72, location 1844 entry count 65535, fsck
need 1, format new

pass0: vpf-10600: block 5348245, item 1: Wrong order of items - change the
object_id of the key [2622591 69731457 0x0 SD (0)] to 2622593

pass0: vpf-10550: block 5473073, item 1: Wrong order of items - change the
object_id of the key [1296563 68417615 0x0 SD (0)] to 1308751

pass0: vpf-10600: block 5473074, item 1: Wrong order of items - change the
object_id of the key [1296563 68417616 0x0 SD (0)] to 1308752

pass0: vpf-10600: block 5473074, item 5: Wrong order of items - change the
object_id of the key [1296563 68417618 0x0 SD (0)] to 1308754

pass0: vpf-10170: block 5473074: item 6: Wrong order of items - the item

1296563 1308754 0x400000000000001 IND (1), len 28, location 2140 entry count
0, fsck need 1, format new fixed to

1296563 1308754 0x1 IND (1), len 28, location 2140 entry count 0, fsck need
1, format new

pass0: vpf-10550: block 5473075, item 1: Wrong order of items - change the
object_id of the key [1296563 68417620 0x0 SD (0)] to 1308756

pass0: vpf-10550: block 7897070, item 1: Wrong order of items - change the
object_id of the key [2486813 69598234 0x0 SD (0)] to 2489370

pass0: vpf-10600: block 7897071, item 1: Wrong order of items - change the
object_id of the key [2486813 69598238 0x0 SD (0)] to 2489374

pass0: vpf-10550: block 7897072, item 1: Wrong order of items - change the
object_id of the key [2486813 69598367 0x0 SD (0)] to 2489503

pass0: vpf-10550: block 7897087, item 1: Wrong order of items - change the
object_id of the key [2486813 69598257 0x0 SD (0)] to 2489393

pass0: vpf-10540: block 9064050, item 0: Wrong order of items - change the
object_id of the key [230109 231808 0x0 SD (0)] to 67340672

pass0: vpf-10410: block 9064050, item 6: Wrong order of items - change the
type of the key [230142 230144 0x0 ??? (15)] to StatData

pass0: vpf-10560: block 9064050, item 5: Wrong order of items - change the
object_id of the key [230111 69521412 0x1 DRCT (2)] to 2412548

pass0: vpf-10410: block 9064050, item 10: Wrong order of items - change the
type of the key [230142 1931741 0x0 ??? (15)] to StatData

pass0: vpf-10590: block 9064739, item 1: Wrong order of items - change the
object_id of the key [3088717 70197600 0x1 DRCT (2)] to 3088736

pass0: vpf-10410: block 9064739, item 6: Wrong order of items - change the
type of the key [3088717 3088770 0x0 ??? (15)] to StatData

pass0: vpf-10590: block 9064739, item 5: Wrong order of items - change the
object_id of the key [3088717 70197626 0x1 DRCT (2)] to 3088762

pass0: vpf-10410: block 9064739, item 10: Wrong order of items - change the
type of the key [3088726 3088729 0x0 ??? (15)] to StatData

pass0: vpf-10550: block 9064740, item 1: Wrong order of items - change the
object_id of the key [233051 67341919 0x0 SD (0)] to 233055

pass0: vpf-10550: block 9503056, item 1: Wrong order of items - change the
object_id of the key [16202 67133207 0x0 SD (0)] to 24343

pass0: vpf-10600: block 10322306, item 1: Wrong order of items - change the
object_id of the key [2639684 69748599 0x0 SD (0)] to 2639735

pass0: vpf-10600: block 10322307, item 1: Wrong order of items - change the
object_id of the key [262113 67372791 0x0 SD (0)] to 263927

pass0: vpf-10550: block 11567185, item 1: Wrong order of items - change the
object_id of the key [2832919 69941786 0x0 SD (0)] to 2832922

pass0: vpf-10550: block 11567185, item 5: Wrong order of items - change the
object_id of the key [2832923 69941790 0x0 SD (0)] to 2832926

pass0: vpf-10170: block 11567185: item 6: Wrong order of items - the item

2832923 2832926 0x400000000000001 DRCT (2), len 1520, location 548 entry
count 65535, fsck need 1, format new fixed to

2832923 2832926 0x1 DRCT (2), len 1520, location 548 entry count 65535, fsck
need 1, format new

pass0: vpf-10590: block 11567186, item 1: Wrong order of items - change the
object_id of the key [33039 68585817 0x1 IND (1)] to 1476953

pass0: vpf-10560: block 11567186, item 5: Wrong order of items - change the
object_id of the key [33039 68585819 0x1 DRCT (2)] to 1476955

pass0: vpf-10550: block 12387453, item 1: Wrong order of items - change the
object_id of the key [2640222 69749114 0x0 SD (0)] to 2640250

pass0: vpf-10600: block 12502212, item 1: Wrong order of items - change the
object_id of the key [2896580 70005504 0x0 SD (0)] to 2896640

pass0: vpf-10600: block 13303865, item 1: Wrong order of items - change the
object_id of the key [707662 67817979 0x0 SD (0)] to 709115

pass0: vpf-10600: block 13303865, item 5: Wrong order of items - change the
object_id of the key [707662 67817981 0x0 SD (0)] to 709117

pass0: vpf-10170: block 13303865: item 6: Wrong order of items - the item

707662 709117 0x400000000000001 IND (1), len 8, location 800 entry count 0,
fsck need 1, format new fixed to

707662 709117 0x1 IND (1), len 8, location 800 entry count 0, fsck need 1,
format new

pass0: vpf-10550: block 15145951, item 1: Wrong order of items - change the
object_id of the key [2970187 70079432 0x0 SD (0)] to 2970568

pass0: vpf-10590: block 15597842, item 1: Wrong order of items - change the
object_id of the key [296803 67407082 0x1 DIR (3)] to 298218

pass0: block 15597842, item 296803 298218 0x1 DIR (3), len 152, location
3900 entry count 5, fsck need 1, format old: 2 entries were deleted

pass0: vpf-10410: block 15597842, item 6: Wrong order of items - change the
type of the key [296803 298221 0x0 ??? (15)] to StatData

pass0: vpf-10590: block 15597842, item 5: Wrong order of items - change the
object_id of the key [296803 67407084 0x1 DRCT (2)] to 298220

pass0: vpf-10410: block 15597842, item 10: Wrong order of items - change the
type of the key [296803 298226 0x0 ??? (15)] to StatData

pass0: vpf-10590: block 15597842, item 17: Wrong order of items - change the
object_id of the key [296803 67407093 0x1 DRCT (2)] to 298229

pass0: vpf-10560: block 15597842, item 21: Wrong order of items - change the
object_id of the key [296803 67407095 0x1 DRCT (2)] to 298231

pass0: vpf-10600: block 16537944, item 1: Wrong order of items - change the
object_id of the key [2891477 70000354 0x0 SD (0)] to 2891490

pass0: vpf-10600: block 16537944, item 5: Wrong order of items - change the
object_id of the key [2891477 70000356 0x0 SD (0)] to 2891492

pass0: vpf-10170: block 16537944: item 6: Wrong order of items - the item

2891477 2891492 0x400000000000001 DRCT (2), len 368, location 2252 entry
count 65535, fsck need 1, format new fixed to

2891477 2891492 0x1 DRCT (2), len 368, location 2252 entry count 65535, fsck
need 1, format new

pass0: vpf-10170: block 16537944: item 10: Wrong order of items - the item

2891477 2891494 0x400000000000001 DRCT (2), len 88, location 1860 entry
count 65535, fsck need 1, format new fixed to

2891477 2891494 0x1 DRCT (2), len 88, location 1860 entry count 65535, fsck
need 1, format new

pass0: vpf-10550: block 16537944, item 17: Wrong order of items - change the
object_id of the key [2891477 70000362 0x0 SD (0)] to 2891498

pass0: vpf-10600: block 16679133, item 1: Wrong order of items - change the
object_id of the key [3052903 70161953 0x0 SD (0)] to 3053089

pass0: vpf-10550: block 16679133, item 5: Wrong order of items - change the
object_id of the key [3052903 70161955 0x0 SD (0)] to 3053091

pass0: vpf-10170: block 16679133: item 6: Wrong order of items - the item

3052903 3053091 0x400000000000001 DRCT (2), len 32, location 308 entry count
65535, fsck need 1, format new fixed to

3052903 3053091 0x1 DRCT (2), len 32, location 308 entry count 65535, fsck
need 1, format new

pass0: vpf-10550: block 16875742, item 1: Wrong order of items - change the
object_id of the key [2251643 69361054 0x0 SD (0)] to 2252190

pass0: vpf-10550: block 16875743, item 1: Wrong order of items - change the
object_id of the key [2251643 69361055 0x0 SD (0)] to 2252191

pass0: vpf-10550: block 18188235, item 1: Wrong order of items - change the
object_id of the key [2728396 69837264 0x0 SD (0)] to 2728400

pass0: vpf-10600: block 18188235, item 5: Wrong order of items - change the
object_id of the key [2728401 69837267 0x0 SD (0)] to 2728403

pass0: vpf-10170: block 18188235: item 6: Wrong order of items - the item

2728401 2728403 0x400000000000001 DRCT (2), len 640, location 976 entry
count 65535, fsck need 0, format new fixed to

2728401 2728403 0x1 DRCT (2), len 640, location 976 entry count 65535, fsck
need 0, format new

pass0: vpf-10600: block 18188926, item 1: Wrong order of items - change the
object_id of the key [2728786 69837656 0x0 SD (0)] to 2728792

block 18582881: The number of items (32256) is incorrect, should be (1) -
corrected

block 18582881: The free space (1187) is incorrect, should be (4048) -
corrected

pass0: vpf-10110: block 18582881, item (0): Unknown item type found
[3573547009 2113929217 0x204d2 ??? (15)] - deleted

pass0: vpf-10550: block 18711879, item 1: Wrong order of items - change the
object_id of the key [2791131 69900003 0x0 SD (0)] to 2791139

pass0: vpf-10600: block 18808866, item 1: Wrong order of items - change the
object_id of the key [1389327 68498330 0x0 SD (0)] to 1389466

pass0: vpf-10550: block 18808866, item 5: Wrong order of items - change the
object_id of the key [1389327 68498332 0x0 SD (0)] to 1389468

pass0: vpf-10170: block 18808866: item 6: Wrong order of items - the item

1389327 1389468 0x400000000000001 DRCT (2), len 344, location 196 entry
count 65535, fsck need 0, format new fixed to

1389327 1389468 0x1 DRCT (2), len 344, location 196 entry count 65535, fsck
need 0, format new

pass0: vpf-10550: block 23560245, item 1: Wrong order of items - change the
object_id of the key [703536 67819932 0x0 SD (0)] to 711068

pass0: vpf-10550: block 24248718, item 1: Wrong order of items - change the
object_id of the key [3057862 70166750 0x0 SD (0)] to 3057886

pass0: vpf-10600: block 24339293, item 1: Wrong order of items - change the
object_id of the key [2527474 70184185 0x0 SD (0)] to 3075321

pass0: vpf-10600: block 24339293, item 5: Wrong order of items - change the
object_id of the key [2527474 70184287 0x0 SD (0)] to 3075423

pass0: vpf-10170: block 24339293: item 6: Wrong order of items - the item

2527474 3075423 0x400000000000001 IND (1), len 852, location 556 entry count
0, fsck need 0, format new fixed to

2527474 3075423 0x1 IND (1), len 852, location 556 entry count 0, fsck need
0, format new

pass0: vpf-10600: block 25135276, item 1: Wrong order of items - change the
object_id of the key [929250 68042697 0x0 SD (0)] to 933833

pass0: vpf-10550: block 27426905, item 1: Wrong order of items - change the
object_id of the key [236696 68491645 0x0 SD (0)] to 1382781

pass0: vpf-10550: block 29689588, item 1: Wrong order of items - change the
object_id of the key [1296579 68420163 0x0 SD (0)] to 1311299

pass0: vpf-10600: block 29709151, item 1: Wrong order of items - change the
object_id of the key [1296579 68422853 0x0 SD (0)] to 1313989

pass0: vpf-10600: block 30965941, item 1: Wrong order of items - change the
object_id of the key [1136968 68246709 0x0 SD (0)] to 1137845

pass0: vpf-10600: block 31720811, item 1: Wrong order of items - change the
object_id of the key [1173904 68291873 0x0 SD (0)] to 1183009

pass0: vpf-10550: block 32014344, item 1: Wrong order of items - change the
object_id of the key [299737 69526014 0x0 SD (0)] to 2417150

pass0: vpf-10550: block 32014344, item 5: Wrong order of items - change the
object_id of the key [299782 67718770 0x0 SD (0)] to 609906

pass0: vpf-10170: block 32014344: item 6: Wrong order of items - the item

299782 609906 0x400000000000001 DRCT (2), len 1592, location 1276 entry
count 65535, fsck need 0, format new fixed to

299782 609906 0x1 DRCT (2), len 1592, location 1276 entry count 65535, fsck
need 0, format new

pass0: vpf-10600: block 33358084, item 1: Wrong order of items - change the
object_id of the key [982345 68101653 0x0 SD (0)] to 992789

pass0: vpf-10550: block 33358084, item 5: Wrong order of items - change the
object_id of the key [982345 68101655 0x0 SD (0)] to 992791

pass0: vpf-10170: block 33358084: item 6: Wrong order of items - the item

982345 992791 0x400000000000001 DRCT (2), len 984, location 196 entry count
65535, fsck need 0, format new fixed to

982345 992791 0x1 DRCT (2), len 984, location 196 entry count 65535, fsck
need 0, format new

pass0: block 36360228, item 2162343 2162344 0x1 DIR (3), len 1504, location
2592 entry count 38, fsck need 0, format old: 4 entries were deleted

pass0: vpf-10600: block 37519380, item 1: Wrong order of items - change the
object_id of the key [174437 67283606 0x0 SD (0)] to 174742

pass0: vpf-10600: block 37519380, item 5: Wrong order of items - change the
object_id of the key [174437 67283608 0x0 SD (0)] to 174744

pass0: vpf-10170: block 37519380: item 6: Wrong order of items - the item

174437 174744 0x400000000000001 DRCT (2), len 232, location 1284 entry count
65535, fsck need 0, format new fixed to

174437 174744 0x1 DRCT (2), len 232, location 1284 entry count 65535, fsck
need 0, format new

pass0: vpf-10170: block 37519380: item 10: Wrong order of items - the item

174437 174788 0x400000000000001 DRCT (2), len 408, location 700 entry count
65535, fsck need 0, format new fixed to

174437 174788 0x1 DRCT (2), len 408, location 700 entry count 65535, fsck
need 0, format new

pass0: vpf-10600: block 38305830, item 1: Wrong order of items - change the
object_id of the key [235125 69160187 0x0 SD (0)] to 2051323

pass0: vpf-10600: block 42894943, item 1: Wrong order of items - change the
object_id of the key [2886410 69996227 0x0 SD (0)] to 2887363

pass0: vpf-10600: block 42894943, item 5: Wrong order of items - change the
object_id of the key [2886410 69996229 0x0 SD (0)] to 2887365

pass0: vpf-10170: block 42894943: item 6: Wrong order of items - the item

2886410 2887365 0x400000000000001 IND (1), len 8, location 2448 entry count
0, fsck need 0, format new fixed to

2886410 2887365 0x1 IND (1), len 8, location 2448 entry count 0, fsck need
0, format new

pass0: vpf-10600: block 43057477, item 1: Wrong order of items - change the
object_id of the key [284903 67395570 0x0 SD (0)] to 286706

pass0: vpf-10600: block 43057477, item 5: Wrong order of items - change the
object_id of the key [284903 67395572 0x0 SD (0)] to 286708

pass0: vpf-10170: block 43057477: item 6: Wrong order of items - the item

284903 286708 0x400000000000001 DRCT (2), len 64, location 1612 entry count
65535, fsck need 0, format new fixed to

284903 286708 0x1 DRCT (2), len 64, location 1612 entry count 65535, fsck
need 0, format new

pass0: vpf-10170: block 43057477: item 10: Wrong order of items - the item

284903 286710 0x400000000000001 DRCT (2), len 168, location 652 entry count
65535, fsck need 0, format new fixed to

284903 286710 0x1 DRCT (2), len 168, location 652 entry count 65535, fsck
need 0, format new

pass0: vpf-10600: block 43058001, item 1: Wrong order of items - change the
object_id of the key [1387495 68497139 0x0 SD (0)] to 1388275

pass0: vpf-10600: block 43058001, item 5: Wrong order of items - change the
object_id of the key [1387495 68497141 0x0 SD (0)] to 1388277

pass0: vpf-10170: block 43058001: item 6: Wrong order of items - the item

1387495 1388277 0x400000000000001 IND (1), len 32, location 2020 entry count
0, fsck need 0, format new fixed to

1387495 1388277 0x1 IND (1), len 32, location 2020 entry count 0, fsck need
0, format new

pass0: vpf-10600: block 46301609, item 1: Wrong order of items - change the
object_id of the key [426634 67577233 0x0 SD (0)] to 468369

pass0: vpf-10600: block 46301609, item 5: Wrong order of items - change the
object_id of the key [426634 67577235 0x0 SD (0)] to 468371

pass0: vpf-10170: block 46301609: item 6: Wrong order of items - the item

426634 468371 0x400000000000001 DRCT (2), len 1640, location 828 entry count
65535, fsck need 0, format new fixed to

426634 468371 0x1 DRCT (2), len 1640, location 828 entry count 65535, fsck
need 0, format new

pass0: vpf-10600: block 47779386, item 1: Wrong order of items - change the
object_id of the key [33091 68604328 0x0 SD (0)] to 1495464

6 directory entries were hashed with not set hash.

1164701 directory entries were hashed with "r5" hash.

####### Pass 1 #######

is_leaf_bad: block 5473073 items 1 and 2: Wrong order of items:

1296563 68417615 0x0 SD (0), len 44, location 1876 entry count 65535, fsck
need 1, format new

1296563 1308751 0x1 DRCT (2), len 1776, location 100 entry count 65535, fsck
need 1, format new

is_leaf_bad: WARNING: The leaf (5473073) is formatted badly. Will be handled
on the the pass2.

What you do not see is the abort message on the screen after this last one.
I do not have a dd_rescue backup. Is everything lost? Is this the $25
question, as the poster in the message I am referring to was asking?!

Thanks in advance,

George

------=_Part_20389_28089803.1169934351941
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hello all,</div>
<div>&nbsp;</div>
<div>I have a problem similar to one posted in the list about two weeks ago (see message <span class="subject"><a href="http://www.mail-archive.com/reiserfs-list@namesys.com/msg22539.html" name="22539"><font color="#810081">
reiserfsck 3.6.19 fails to rebuild-tree badly broken fs</font></a>). I started seeing some kernel dumps while updatedb was running its nightly cycle. Sometimes the system would become unresponsive and nothing but a soft reset would help. The last couple of days reboot would hang while unmounting local filesystems, so yesterday I decided to&nbsp;check if there are any filesystem errors that where the reason of all this behavior. (I am not an expert at analyzing kernel dumps but genksyms was complaining about filp_close, which, I think, is in fs kernel code).
</span></div>
<div><span class="subject"></span>&nbsp;</div>
<div><span class="subject">I should note that this is a fairly new system with less than one year of operation. It runs a gentoo 2.6.18-r3 (but maybe a later r?, I cannot tell at the moment). I used systemrescuecd 0.3.2 and the reiserfs tools from there. The filesystem itself was built from whatever was stable in gentoo about a year ago.
</span></div>
<div><span class="subject"></span>&nbsp;</div>
<div><span class="subject">reiserfsck --check /dev/sda3 suggested that I rebuild the tree. I tried that several times, but every time the failure is because while running pass1, it thinks that it should fix something in pass0 and just aborts. This leaves the filesystem in an unmountable state.
</span></div>
<div><span class="subject"></span>&nbsp;</div>
<div><span class="subject">badblocks /dev/sda3 came up with nothing, so at least it doesn&#39;t look like a disk error.</span></div>
<div><span class="subject"></span>&nbsp;</div>
<div><span class="subject">My question is: Is there a way to force the filesystem to a state where I can mount it again. Does anyone know what that message means? Why doesn&#39;t pass0 fix the issue? Can I force pass0 to fix the problem?
</span></div>
<div><span class="subject"></span>&nbsp;</div>
<div><span class="subject">Here is the output from reiserfsck:</span></div>
<div><span class="subject"></span>&nbsp;</div>
<div><span class="subject"><font size="2">
<p>####### Pass 0 #######</p>
<p>pass0: vpf-10600: block 3342481, item 1: Wrong order of items - change the object_id of the key [171796 67977468 0x0 SD (0)] to 868604</p>
<p>pass0: vpf-10600: block 3342481, item 5: Wrong order of items - change the object_id of the key [171796 67977470 0x0 SD (0)] to 868606</p>
<p>pass0: vpf-10170: block 3342481: item 6: Wrong order of items - the item </p>
<p>171796 868606 0x400000000000001 DRCT (2), len 1168, location 260 entry count 65535, fsck need 1, format new fixed to </p>
<p>171796 868606 0x1 DRCT (2), len 1168, location 260 entry count 65535, fsck need 1, format new</p>
<p>pass0: vpf-10600: block 5348244, item 1: Wrong order of items - change the object_id of the key [2622502 69731409 0x0 SD (0)] to 2622545</p>
<p>pass0: vpf-10600: block 5348244, item 5: Wrong order of items - change the object_id of the key [2622502 69731411 0x0 SD (0)] to 2622547</p>
<p>pass0: vpf-10170: block 5348244: item 6: Wrong order of items - the item </p>
<p>2622502 2622547 0x400000000000001 DRCT (2), len 72, location 3556 entry count 65535, fsck need 1, format new fixed to </p>
<p>2622502 2622547 0x1 DRCT (2), len 72, location 3556 entry count 65535, fsck need 1, format new</p>
<p>pass0: vpf-10170: block 5348244: item 10: Wrong order of items - the item </p>
<p>2622502 2622549 0x400000000000001 DRCT (2), len 72, location 3316 entry count 65535, fsck need 1, format new fixed to </p>
<p>2622502 2622549 0x1 DRCT (2), len 72, location 3316 entry count 65535, fsck need 1, format new</p>
<p>pass0: vpf-10600: block 5348244, item 17: Wrong order of items - change the object_id of the key [2622502 69731417 0x0 SD (0)] to 2622553</p>
<p>pass0: vpf-10600: block 5348244, item 21: Wrong order of items - change the object_id of the key [2622502 69731419 0x0 SD (0)] to 2622555</p>
<p>pass0: vpf-10170: block 5348244: item 22: Wrong order of items - the item </p>
<p>2622502 2622555 0x400000000000001 DRCT (2), len 296, location 2076 entry count 65535, fsck need 1, format new fixed to </p>
<p>2622502 2622555 0x1 DRCT (2), len 296, location 2076 entry count 65535, fsck need 1, format new</p>
<p>pass0: vpf-10170: block 5348244: item 26: Wrong order of items - the item </p>
<p>2622502 2622557 0x400000000000001 DRCT (2), len 72, location 1844 entry count 65535, fsck need 1, format new fixed to </p>
<p>2622502 2622557 0x1 DRCT (2), len 72, location 1844 entry count 65535, fsck need 1, format new</p>
<p>pass0: vpf-10600: block 5348245, item 1: Wrong order of items - change the object_id of the key [2622591 69731457 0x0 SD (0)] to 2622593</p>
<p>pass0: vpf-10550: block 5473073, item 1: Wrong order of items - change the object_id of the key [1296563 68417615 0x0 SD (0)] to 1308751</p>
<p>pass0: vpf-10600: block 5473074, item 1: Wrong order of items - change the object_id of the key [1296563 68417616 0x0 SD (0)] to 1308752</p>
<p>pass0: vpf-10600: block 5473074, item 5: Wrong order of items - change the object_id of the key [1296563 68417618 0x0 SD (0)] to 1308754</p>
<p>pass0: vpf-10170: block 5473074: item 6: Wrong order of items - the item </p>
<p>1296563 1308754 0x400000000000001 IND (1), len 28, location 2140 entry count 0, fsck need 1, format new fixed to </p>
<p>1296563 1308754 0x1 IND (1), len 28, location 2140 entry count 0, fsck need 1, format new</p>
<p>pass0: vpf-10550: block 5473075, item 1: Wrong order of items - change the object_id of the key [1296563 68417620 0x0 SD (0)] to 1308756</p>
<p>pass0: vpf-10550: block 7897070, item 1: Wrong order of items - change the object_id of the key [2486813 69598234 0x0 SD (0)] to 2489370</p>
<p>pass0: vpf-10600: block 7897071, item 1: Wrong order of items - change the object_id of the key [2486813 69598238 0x0 SD (0)] to 2489374</p>
<p>pass0: vpf-10550: block 7897072, item 1: Wrong order of items - change the object_id of the key [2486813 69598367 0x0 SD (0)] to 2489503</p>
<p>pass0: vpf-10550: block 7897087, item 1: Wrong order of items - change the object_id of the key [2486813 69598257 0x0 SD (0)] to 2489393</p>
<p>pass0: vpf-10540: block 9064050, item 0: Wrong order of items - change the object_id of the key [230109 231808 0x0 SD (0)] to 67340672</p>
<p>pass0: vpf-10410: block 9064050, item 6: Wrong order of items - change the type of the key [230142 230144 0x0 ??? (15)] to StatData</p>
<p>pass0: vpf-10560: block 9064050, item 5: Wrong order of items - change the object_id of the key [230111 69521412 0x1 DRCT (2)] to 2412548</p>
<p>pass0: vpf-10410: block 9064050, item 10: Wrong order of items - change the type of the key [230142 1931741 0x0 ??? (15)] to StatData</p>
<p>pass0: vpf-10590: block 9064739, item 1: Wrong order of items - change the object_id of the key [3088717 70197600 0x1 DRCT (2)] to 3088736</p>
<p>pass0: vpf-10410: block 9064739, item 6: Wrong order of items - change the type of the key [3088717 3088770 0x0 ??? (15)] to StatData</p>
<p>pass0: vpf-10590: block 9064739, item 5: Wrong order of items - change the object_id of the key [3088717 70197626 0x1 DRCT (2)] to 3088762</p>
<p>pass0: vpf-10410: block 9064739, item 10: Wrong order of items - change the type of the key [3088726 3088729 0x0 ??? (15)] to StatData</p>
<p>pass0: vpf-10550: block 9064740, item 1: Wrong order of items - change the object_id of the key [233051 67341919 0x0 SD (0)] to 233055</p>
<p>pass0: vpf-10550: block 9503056, item 1: Wrong order of items - change the object_id of the key [16202 67133207 0x0 SD (0)] to 24343</p>
<p>pass0: vpf-10600: block 10322306, item 1: Wrong order of items - change the object_id of the key [2639684 69748599 0x0 SD (0)] to 2639735</p>
<p>pass0: vpf-10600: block 10322307, item 1: Wrong order of items - change the object_id of the key [262113 67372791 0x0 SD (0)] to 263927</p>
<p>pass0: vpf-10550: block 11567185, item 1: Wrong order of items - change the object_id of the key [2832919 69941786 0x0 SD (0)] to 2832922</p>
<p>pass0: vpf-10550: block 11567185, item 5: Wrong order of items - change the object_id of the key [2832923 69941790 0x0 SD (0)] to 2832926</p>
<p>pass0: vpf-10170: block 11567185: item 6: Wrong order of items - the item </p>
<p>2832923 2832926 0x400000000000001 DRCT (2), len 1520, location 548 entry count 65535, fsck need 1, format new fixed to </p>
<p>2832923 2832926 0x1 DRCT (2), len 1520, location 548 entry count 65535, fsck need 1, format new</p>
<p>pass0: vpf-10590: block 11567186, item 1: Wrong order of items - change the object_id of the key [33039 68585817 0x1 IND (1)] to 1476953</p>
<p>pass0: vpf-10560: block 11567186, item 5: Wrong order of items - change the object_id of the key [33039 68585819 0x1 DRCT (2)] to 1476955</p>
<p>pass0: vpf-10550: block 12387453, item 1: Wrong order of items - change the object_id of the key [2640222 69749114 0x0 SD (0)] to 2640250</p>
<p>pass0: vpf-10600: block 12502212, item 1: Wrong order of items - change the object_id of the key [2896580 70005504 0x0 SD (0)] to 2896640</p>
<p>pass0: vpf-10600: block 13303865, item 1: Wrong order of items - change the object_id of the key [707662 67817979 0x0 SD (0)] to 709115</p>
<p>pass0: vpf-10600: block 13303865, item 5: Wrong order of items - change the object_id of the key [707662 67817981 0x0 SD (0)] to 709117</p>
<p>pass0: vpf-10170: block 13303865: item 6: Wrong order of items - the item </p>
<p>707662 709117 0x400000000000001 IND (1), len 8, location 800 entry count 0, fsck need 1, format new fixed to </p>
<p>707662 709117 0x1 IND (1), len 8, location 800 entry count 0, fsck need 1, format new</p>
<p>pass0: vpf-10550: block 15145951, item 1: Wrong order of items - change the object_id of the key [2970187 70079432 0x0 SD (0)] to 2970568</p>
<p>pass0: vpf-10590: block 15597842, item 1: Wrong order of items - change the object_id of the key [296803 67407082 0x1 DIR (3)] to 298218</p>
<p>pass0: block 15597842, item 296803 298218 0x1 DIR (3), len 152, location 3900 entry count 5, fsck need 1, format old: 2 entries were deleted</p>
<p>pass0: vpf-10410: block 15597842, item 6: Wrong order of items - change the type of the key [296803 298221 0x0 ??? (15)] to StatData</p>
<p>pass0: vpf-10590: block 15597842, item 5: Wrong order of items - change the object_id of the key [296803 67407084 0x1 DRCT (2)] to 298220</p>
<p>pass0: vpf-10410: block 15597842, item 10: Wrong order of items - change the type of the key [296803 298226 0x0 ??? (15)] to StatData</p>
<p>pass0: vpf-10590: block 15597842, item 17: Wrong order of items - change the object_id of the key [296803 67407093 0x1 DRCT (2)] to 298229</p>
<p>pass0: vpf-10560: block 15597842, item 21: Wrong order of items - change the object_id of the key [296803 67407095 0x1 DRCT (2)] to 298231</p>
<p>pass0: vpf-10600: block 16537944, item 1: Wrong order of items - change the object_id of the key [2891477 70000354 0x0 SD (0)] to 2891490</p>
<p>pass0: vpf-10600: block 16537944, item 5: Wrong order of items - change the object_id of the key [2891477 70000356 0x0 SD (0)] to 2891492</p>
<p>pass0: vpf-10170: block 16537944: item 6: Wrong order of items - the item </p>
<p>2891477 2891492 0x400000000000001 DRCT (2), len 368, location 2252 entry count 65535, fsck need 1, format new fixed to </p>
<p>2891477 2891492 0x1 DRCT (2), len 368, location 2252 entry count 65535, fsck need 1, format new</p>
<p>pass0: vpf-10170: block 16537944: item 10: Wrong order of items - the item </p>
<p>2891477 2891494 0x400000000000001 DRCT (2), len 88, location 1860 entry count 65535, fsck need 1, format new fixed to </p>
<p>2891477 2891494 0x1 DRCT (2), len 88, location 1860 entry count 65535, fsck need 1, format new</p>
<p>pass0: vpf-10550: block 16537944, item 17: Wrong order of items - change the object_id of the key [2891477 70000362 0x0 SD (0)] to 2891498</p>
<p>pass0: vpf-10600: block 16679133, item 1: Wrong order of items - change the object_id of the key [3052903 70161953 0x0 SD (0)] to 3053089</p>
<p>pass0: vpf-10550: block 16679133, item 5: Wrong order of items - change the object_id of the key [3052903 70161955 0x0 SD (0)] to 3053091</p>
<p>pass0: vpf-10170: block 16679133: item 6: Wrong order of items - the item </p>
<p>3052903 3053091 0x400000000000001 DRCT (2), len 32, location 308 entry count 65535, fsck need 1, format new fixed to </p>
<p>3052903 3053091 0x1 DRCT (2), len 32, location 308 entry count 65535, fsck need 1, format new</p>
<p>pass0: vpf-10550: block 16875742, item 1: Wrong order of items - change the object_id of the key [2251643 69361054 0x0 SD (0)] to 2252190</p>
<p>pass0: vpf-10550: block 16875743, item 1: Wrong order of items - change the object_id of the key [2251643 69361055 0x0 SD (0)] to 2252191</p>
<p>pass0: vpf-10550: block 18188235, item 1: Wrong order of items - change the object_id of the key [2728396 69837264 0x0 SD (0)] to 2728400</p>
<p>pass0: vpf-10600: block 18188235, item 5: Wrong order of items - change the object_id of the key [2728401 69837267 0x0 SD (0)] to 2728403</p>
<p>pass0: vpf-10170: block 18188235: item 6: Wrong order of items - the item </p>
<p>2728401 2728403 0x400000000000001 DRCT (2), len 640, location 976 entry count 65535, fsck need 0, format new fixed to </p>
<p>2728401 2728403 0x1 DRCT (2), len 640, location 976 entry count 65535, fsck need 0, format new</p>
<p>pass0: vpf-10600: block 18188926, item 1: Wrong order of items - change the object_id of the key [2728786 69837656 0x0 SD (0)] to 2728792</p>
<p>block 18582881: The number of items (32256) is incorrect, should be (1) - corrected</p>
<p>block 18582881: The free space (1187) is incorrect, should be (4048) - corrected</p>
<p>pass0: vpf-10110: block 18582881, item (0): Unknown item type found [3573547009 2113929217 0x204d2 ??? (15)] - deleted</p>
<p>pass0: vpf-10550: block 18711879, item 1: Wrong order of items - change the object_id of the key [2791131 69900003 0x0 SD (0)] to 2791139</p>
<p>pass0: vpf-10600: block 18808866, item 1: Wrong order of items - change the object_id of the key [1389327 68498330 0x0 SD (0)] to 1389466</p>
<p>pass0: vpf-10550: block 18808866, item 5: Wrong order of items - change the object_id of the key [1389327 68498332 0x0 SD (0)] to 1389468</p>
<p>pass0: vpf-10170: block 18808866: item 6: Wrong order of items - the item </p>
<p>1389327 1389468 0x400000000000001 DRCT (2), len 344, location 196 entry count 65535, fsck need 0, format new fixed to </p>
<p>1389327 1389468 0x1 DRCT (2), len 344, location 196 entry count 65535, fsck need 0, format new</p>
<p>pass0: vpf-10550: block 23560245, item 1: Wrong order of items - change the object_id of the key [703536 67819932 0x0 SD (0)] to 711068</p>
<p>pass0: vpf-10550: block 24248718, item 1: Wrong order of items - change the object_id of the key [3057862 70166750 0x0 SD (0)] to 3057886</p>
<p>pass0: vpf-10600: block 24339293, item 1: Wrong order of items - change the object_id of the key [2527474 70184185 0x0 SD (0)] to 3075321</p>
<p>pass0: vpf-10600: block 24339293, item 5: Wrong order of items - change the object_id of the key [2527474 70184287 0x0 SD (0)] to 3075423</p>
<p>pass0: vpf-10170: block 24339293: item 6: Wrong order of items - the item </p>
<p>2527474 3075423 0x400000000000001 IND (1), len 852, location 556 entry count 0, fsck need 0, format new fixed to </p>
<p>2527474 3075423 0x1 IND (1), len 852, location 556 entry count 0, fsck need 0, format new</p>
<p>pass0: vpf-10600: block 25135276, item 1: Wrong order of items - change the object_id of the key [929250 68042697 0x0 SD (0)] to 933833</p>
<p>pass0: vpf-10550: block 27426905, item 1: Wrong order of items - change the object_id of the key [236696 68491645 0x0 SD (0)] to 1382781</p>
<p>pass0: vpf-10550: block 29689588, item 1: Wrong order of items - change the object_id of the key [1296579 68420163 0x0 SD (0)] to 1311299</p>
<p>pass0: vpf-10600: block 29709151, item 1: Wrong order of items - change the object_id of the key [1296579 68422853 0x0 SD (0)] to 1313989</p>
<p>pass0: vpf-10600: block 30965941, item 1: Wrong order of items - change the object_id of the key [1136968 68246709 0x0 SD (0)] to 1137845</p>
<p>pass0: vpf-10600: block 31720811, item 1: Wrong order of items - change the object_id of the key [1173904 68291873 0x0 SD (0)] to 1183009</p>
<p>pass0: vpf-10550: block 32014344, item 1: Wrong order of items - change the object_id of the key [299737 69526014 0x0 SD (0)] to 2417150</p>
<p>pass0: vpf-10550: block 32014344, item 5: Wrong order of items - change the object_id of the key [299782 67718770 0x0 SD (0)] to 609906</p>
<p>pass0: vpf-10170: block 32014344: item 6: Wrong order of items - the item </p>
<p>299782 609906 0x400000000000001 DRCT (2), len 1592, location 1276 entry count 65535, fsck need 0, format new fixed to </p>
<p>299782 609906 0x1 DRCT (2), len 1592, location 1276 entry count 65535, fsck need 0, format new</p>
<p>pass0: vpf-10600: block 33358084, item 1: Wrong order of items - change the object_id of the key [982345 68101653 0x0 SD (0)] to 992789</p>
<p>pass0: vpf-10550: block 33358084, item 5: Wrong order of items - change the object_id of the key [982345 68101655 0x0 SD (0)] to 992791</p>
<p>pass0: vpf-10170: block 33358084: item 6: Wrong order of items - the item </p>
<p>982345 992791 0x400000000000001 DRCT (2), len 984, location 196 entry count 65535, fsck need 0, format new fixed to </p>
<p>982345 992791 0x1 DRCT (2), len 984, location 196 entry count 65535, fsck need 0, format new</p>
<p>pass0: block 36360228, item 2162343 2162344 0x1 DIR (3), len 1504, location 2592 entry count 38, fsck need 0, format old: 4 entries were deleted</p>
<p>pass0: vpf-10600: block 37519380, item 1: Wrong order of items - change the object_id of the key [174437 67283606 0x0 SD (0)] to 174742</p>
<p>pass0: vpf-10600: block 37519380, item 5: Wrong order of items - change the object_id of the key [174437 67283608 0x0 SD (0)] to 174744</p>
<p>pass0: vpf-10170: block 37519380: item 6: Wrong order of items - the item </p>
<p>174437 174744 0x400000000000001 DRCT (2), len 232, location 1284 entry count 65535, fsck need 0, format new fixed to </p>
<p>174437 174744 0x1 DRCT (2), len 232, location 1284 entry count 65535, fsck need 0, format new</p>
<p>pass0: vpf-10170: block 37519380: item 10: Wrong order of items - the item </p>
<p>174437 174788 0x400000000000001 DRCT (2), len 408, location 700 entry count 65535, fsck need 0, format new fixed to </p>
<p>174437 174788 0x1 DRCT (2), len 408, location 700 entry count 65535, fsck need 0, format new</p>
<p>pass0: vpf-10600: block 38305830, item 1: Wrong order of items - change the object_id of the key [235125 69160187 0x0 SD (0)] to 2051323</p>
<p>pass0: vpf-10600: block 42894943, item 1: Wrong order of items - change the object_id of the key [2886410 69996227 0x0 SD (0)] to 2887363</p>
<p>pass0: vpf-10600: block 42894943, item 5: Wrong order of items - change the object_id of the key [2886410 69996229 0x0 SD (0)] to 2887365</p>
<p>pass0: vpf-10170: block 42894943: item 6: Wrong order of items - the item </p>
<p>2886410 2887365 0x400000000000001 IND (1), len 8, location 2448 entry count 0, fsck need 0, format new fixed to </p>
<p>2886410 2887365 0x1 IND (1), len 8, location 2448 entry count 0, fsck need 0, format new</p>
<p>pass0: vpf-10600: block 43057477, item 1: Wrong order of items - change the object_id of the key [284903 67395570 0x0 SD (0)] to 286706</p>
<p>pass0: vpf-10600: block 43057477, item 5: Wrong order of items - change the object_id of the key [284903 67395572 0x0 SD (0)] to 286708</p>
<p>pass0: vpf-10170: block 43057477: item 6: Wrong order of items - the item </p>
<p>284903 286708 0x400000000000001 DRCT (2), len 64, location 1612 entry count 65535, fsck need 0, format new fixed to </p>
<p>284903 286708 0x1 DRCT (2), len 64, location 1612 entry count 65535, fsck need 0, format new</p>
<p>pass0: vpf-10170: block 43057477: item 10: Wrong order of items - the item </p>
<p>284903 286710 0x400000000000001 DRCT (2), len 168, location 652 entry count 65535, fsck need 0, format new fixed to </p>
<p>284903 286710 0x1 DRCT (2), len 168, location 652 entry count 65535, fsck need 0, format new</p>
<p>pass0: vpf-10600: block 43058001, item 1: Wrong order of items - change the object_id of the key [1387495 68497139 0x0 SD (0)] to 1388275</p>
<p>pass0: vpf-10600: block 43058001, item 5: Wrong order of items - change the object_id of the key [1387495 68497141 0x0 SD (0)] to 1388277</p>
<p>pass0: vpf-10170: block 43058001: item 6: Wrong order of items - the item </p>
<p>1387495 1388277 0x400000000000001 IND (1), len 32, location 2020 entry count 0, fsck need 0, format new fixed to </p>
<p>1387495 1388277 0x1 IND (1), len 32, location 2020 entry count 0, fsck need 0, format new</p>
<p>pass0: vpf-10600: block 46301609, item 1: Wrong order of items - change the object_id of the key [426634 67577233 0x0 SD (0)] to 468369</p>
<p>pass0: vpf-10600: block 46301609, item 5: Wrong order of items - change the object_id of the key [426634 67577235 0x0 SD (0)] to 468371</p>
<p>pass0: vpf-10170: block 46301609: item 6: Wrong order of items - the item </p>
<p>426634 468371 0x400000000000001 DRCT (2), len 1640, location 828 entry count 65535, fsck need 0, format new fixed to </p>
<p>426634 468371 0x1 DRCT (2), len 1640, location 828 entry count 65535, fsck need 0, format new</p>
<p>pass0: vpf-10600: block 47779386, item 1: Wrong order of items - change the object_id of the key [33091 68604328 0x0 SD (0)] to 1495464</p>
<p>6 directory entries were hashed with not set hash.</p>
<p>1164701 directory entries were hashed with &quot;r5&quot; hash.</p>
<p>####### Pass 1 #######</p>
<p>is_leaf_bad: block 5473073 items 1 and 2: Wrong order of items:</p>
<p>1296563 68417615 0x0 SD (0), len 44, location 1876 entry count 65535, fsck need 1, format new</p>
<p>1296563 1308751 0x1 DRCT (2), len 1776, location 100 entry count 65535, fsck need 1, format new</p>
<p>is_leaf_bad: WARNING: The leaf (5473073) is formatted badly. Will be handled on the the pass2.</p>
<p>What you do not see is the abort message on the screen after this last one. I&nbsp;do not&nbsp;have a&nbsp;dd_rescue backup. Is everything lost? Is this the $25 question, as the poster in the message I am referring to was asking?!</p>

<p>Thanks in advance,</p>
<p>George</p>
<p>&nbsp;</p></font></span></div>

------=_Part_20389_28089803.1169934351941--
