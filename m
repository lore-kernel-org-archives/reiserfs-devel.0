From: Peter Stuge <stuge@cdy.org>
Subject: reiserfsck 3.6.19 fails to rebuild-tree badly broken fs
Date: Mon, 8 Jan 2007 03:42:23 +0100
Message-ID: <20070108024223.1754.qmail@cdy.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="M9NhX3UHpAaciwkO"
Return-path: <reiserfs-list-return-30364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello list,

I have a fs that has been broken by controller cache in combination
with multiple power outages.

It would mount, and many files were accessible, while some were not.

I decided to clean it up so I could safely start writing to the
filesystem again, and set out to fsck, but did not get far.

I started with check, which old me to rebuild-tree.

Attached is the log from rebuild-tree. I've run rebuild-tree several
times and always get the same result, except for the number 91163
after "left" which can change between runs. Block 33147 never changes
however.

I don't have a dd backup of the fs for forensic purposes, but I'll
gladly try any suggestions you can offer on the real fs.

At the very least I would like to get the fs back to mountable state
and copy some more files off of it before making a new fs. Do I only
need to change the root inode (to 0?) or is there more to it?

I'm not afraid of hacking up some utilities to fix/debug the fs, just
let me know how to proceed.

(Does reiserfsck want to deal with this broken fs:s?)

Should this be a $25 support question?


Thanks in advance, and thanks for the work you've put into ReiserFS!


//Peter

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sdb2.log"

--8<--
# reiserfsck --rebuild-tree -l sdb2.log /dev/sdb2 
reiserfsck 3.6.19 (2003 www.namesys.com)

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

Will rebuild the filesystem (/dev/sdb2) tree
Will put log info to 'sdb2.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/sdb2' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Jan  8 00:00:54 2007
###########

Pass 0:
Loading on-disk bitmap .. ok, 33991146 blocks marked used
Skipping 9280 blocks (super block, journal, bitmaps) 33981866 blocks will be read
0%....20%....40%....60%....80%....100%                        left 0, 5675 /sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 33981866
                Leaves among those 91514
                        - corrected leaves 12
                        - leaves all contents of which could not be saved and deleted 26
                pointers in indirect items to wrong area 6 (zeroed)
                Objectids found 281451

Pass 1 (will try to insert 91488 leaves):
Looking for allocable blocks .. finished
0%                                                         left 91163, 325 /sec
The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

build_the_tree: Nothing but leaves are expected. Block 33147 - unknown

Aborted
# 
-->8--

sdb2.log:
####### Pass 0 #######
block 33148: The number of items (12) is incorrect, should be (0) - corrected
block 33148: The free space (0) is incorrect, should be (4072) - corrected
block 33158: The number of items (32784) is incorrect, should be (5) - corrected
block 33158: The free space (176) is incorrect, should be (2176) - corrected
pass0: vpf-10410: block 33158, item 3: Wrong order of items - change the type of the key [2097154 7211 0x40000 ??? (15)] to StatData
pass0: vpf-10430: block 33158, item 2: Wrong order of items - change the dir_id of the key [4098 67112490 0x5 DRCT (2)] to 2
pass0: vpf-10560: block 33158, item 2: Wrong order of items - change the object_id of the key [2 67112490 0x5 DRCT (2)] to 7338
pass0: vpf-10170: block 33158: item 2: Wrong order of items - the item 
	2 7338 0x5 DRCT (2), len 240, location 2644 entry count 65535, fsck need 0, format new fixed to 
	2 7338 0x1 DRCT (2), len 240, location 2644 entry count 65535, fsck need 0, format new
pass0: vpf-10460: block 33158, item 3: Wrong order of items - change the dir_id of the key [2097154 7211 0x0 SD (0)] to 2
pass0: block 33158, item 2 (upper): Item [2 7338 0x1 DRCT (2)] is out of order - deleted
pass0: block 33158, item 1 (upper): Item [2 7338 0x0 SD (0)] is out of order - deleted
block 33254: The number of items (7) is incorrect, should be (0) - corrected
block 33254: The free space (4) is incorrect, should be (4072) - corrected
block 432363: The number of items (14) is incorrect, should be (0) - corrected
block 432363: The free space (364) is incorrect, should be (4072) - corrected
pass0: block 1048642, item 6: The directory [74952 78252] has the wrong mode (?rwxr--r--), corrected to (drwxr--r--)
verify_directory_item: block 1048642, item 74952 78252 0x1 DIR (3), len 216, location 908 entry count 7, fsck need 0, format old: All entries were deleted from the directory
block 2654363: The number of items (12) is incorrect, should be (0) - corrected
block 2654363: The free space (1020) is incorrect, should be (4072) - corrected
pass0: vpf-10160: block 7897967: item 15: No "." entry found in the first item of a directory
block 7897991: The number of items (5) is incorrect, should be (4) - corrected
block 7897991: The free space (1808) is incorrect, should be (2192) - corrected
pass0: vpf-10210: block 7897991, item 0: The item with wrong offset or length found [26175 2504273 0x4539 DRCT (2)], len 1672 - deleted
pass0: vpf-10170: block 7897991: item 1: Wrong order of items - the item 
	21128991 276050 0x400101 IND (1), len 24, location 4028 entry count 0, fsck need 0, format new fixed to 
	167994943 276050 0x1 IND (1), len 24, location 4028 entry count 0, fsck need 0, format new
pass0: block 7897991, item 2 (lower): Item [943647 2151954003 0x0 SD (0)] is out of order - deleted
block 7898037: The number of items (8) is incorrect, should be (1) - corrected
block 7898037: The free space (2136) is incorrect, should be (2672) - corrected
block 7898058: The number of items (25) is incorrect, should be (1) - corrected
block 7898058: The free space (0) is incorrect, should be (2704) - corrected
verify_directory_item: block 7898058, item 157215 407425 0x90000a00009b1 DIR (3), len 1344, location 2752 entry count 79, fsck need 0, format new: All entries were deleted from the directory
block 7898078: The number of items (20) is incorrect, should be (0) - corrected
block 7898078: The free space (660) is incorrect, should be (4072) - corrected
block 8192005: The number of items (19) is incorrect, should be (1) - corrected
block 8192005: The free space (148) is incorrect, should be (3848) - corrected
pass0: vpf-10110: block 8192005, item (0): Unknown item type found [134356176 4513635 0x50000401 ??? (15)] - deleted
block 11239427: The number of items (9) is incorrect, should be (0) - corrected
block 11239427: The free space (552) is incorrect, should be (4072) - corrected
block 17598467: The number of items (11) is incorrect, should be (0) - corrected
block 17598467: The free space (4) is incorrect, should be (4072) - corrected
block 19568078: The number of items (21) is incorrect, should be (1) - corrected
block 19568078: The free space (448) is incorrect, should be (3848) - corrected
pass0: vpf-10210: block 19568078, item 0: The item with wrong offset or length found [140727251 88032 0x101f400004e00 DRCT (2)], len 200 - deleted
block 19568462: The number of items (3) is incorrect, should be (0) - corrected
block 19568462: The free space (668) is incorrect, should be (4072) - corrected
block 19922948: The number of items (12) is incorrect, should be (1) - corrected
block 19922948: The free space (336) is incorrect, should be (3856) - corrected
pass0: vpf-10210: block 19922948, item 0: The item with wrong offset or length found [352380 427646 0x7000003dd DRCT (2)], len 192 - deleted
pass0: block 20185117, item 274125 278039 0x1 DIR (3), len 152, location 2044 entry count 6, fsck need 0, format old: 2 entries were deleted
block 20283652: The number of items (7) is incorrect, should be (1) - corrected
block 20283652: The free space (60) is incorrect, should be (3896) - corrected
pass0: vpf-10210: block 20283652, item 0: The item with wrong offset or length found [189296 358123 0xa1000000003a1 DRCT (2)], len 152 - deleted
block 20283712: The number of items (16390) is incorrect, should be (1) - corrected
block 20283712: The free space (972) is incorrect, should be (2816) - corrected
pass0: vpf-10210: block 20283712, item 0: The item with wrong offset or length found [268624752 358335 0x550000000006a1 DRCT (2)], len 1232 - deleted
block 21626884: The number of items (9) is incorrect, should be (0) - corrected
block 21626884: The free space (2296) is incorrect, should be (4072) - corrected
pass0: vpf-10160: block 22053134: item 6: No "." entry found in the first item of a directory
block 23366314: The number of items (13) is incorrect, should be (1) - corrected
block 23366314: The free space (128) is incorrect, should be (2936) - corrected
pass0: vpf-10210: block 23366314, item 0: The item with wrong offset or length found [351834 134533657 0x800000600000025 DRCT (2)], len 1112 - deleted
block 24480571: The number of items (32797) is incorrect, should be (1) - corrected
block 24480571: The free space (564) is incorrect, should be (3840) - corrected
verify_directory_item: block 24480571, item 56327 302164 0x1 DIR (3), len 208, location 3888 entry count 7, fsck need 0, format old: All entries were deleted from the directory
block 25100441: The number of items (9) is incorrect, should be (1) - corrected
block 25100441: The free space (1464) is incorrect, should be (2472) - corrected
pass0: vpf-10210: block 25100441, item 0: The item with wrong offset or length found [184614 156024 0x200000000000190 DRCT (2)], len 1576 - deleted
pass0: vpf-10240: block 25821202, item (1): Item [294502 295317 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (2): Item [294502 295318 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (3): Item [294502 295319 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: block 25821202, item 4: The directory [294502 295341] has the wrong mode (?r-xrwxr-x), corrected to (dr-xrwxr-x)
verify_directory_item: block 25821202, item 294502 295341 0x1 DIR (3), len 104, location 3816 entry count 4, fsck need 0, format old: All entries were deleted from the directory
pass0: vpf-10240: block 25821202, item (5): Item [294502 295342 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (6): Item [294502 295343 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (7): Item [294502 295345 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (8): Item [294502 295346 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (9): Item [294502 295357 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (10): Item [294502 295358 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (11): Item [294502 295777 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (12): Item [294502 295778 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (13): Item [294503 295895 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (14): Item [294503 295898 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (15): Item [294503 295899 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (16): Item [294503 295901 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
pass0: vpf-10240: block 25821202, item (17): Item [294503 295944 0x1 DRCT (2)], which format (0) is not equal to StatData format (1), is deleted
block 27558676: The number of items (14) is incorrect, should be (2) - corrected
block 27558676: The free space (36) is incorrect, should be (3236) - corrected
pass0: vpf-10210: block 27558676, item 0: The item with wrong offset or length found [427304 427598 0x230000000369 DRCT (2)], len 744 - deleted
pass0: vpf-10100: block 27558676, item (0): Unknown item type of StatData size, type set to StatData [427432 33982031 0x0 SD (0)]
block 29425781: The number of items (33) is incorrect, should be (1) - corrected
block 29425781: The free space (64) is incorrect, should be (3928) - corrected
verify_directory_item: block 29425781, item 132576 133360 0x1 DIR (3), len 120, location 3976 entry count 5, fsck need 0, format old: All entries were deleted from the directory
block 31556131: The number of items (5) is incorrect, should be (0) - corrected
block 31556131: The free space (0) is incorrect, should be (4072) - corrected
block 31556168: The number of items (8) is incorrect, should be (1) - corrected
block 31556168: The free space (520) is incorrect, should be (3248) - corrected
pass0: vpf-10210: block 31556168, item 0: The item with wrong offset or length found [287351 291675 0x400b1d DRCT (2)], len 800 - deleted
block 33030510: The number of items (1034) is incorrect, should be (1) - corrected
block 33030510: The free space (16900) is incorrect, should be (3320) - corrected
block 33916283: The number of items (19) is incorrect, should be (0) - corrected
block 33916283: The free space (224) is incorrect, should be (4072) - corrected
pass0: vpf-10160: block 33917650: item 5: No "." entry found in the first item of a directory
block 33917650: item 5: ".." is 0-th entry
pass0: vpf-10450: block 33918734, item 0: Wrong order of items - change the dir_id of the key [15111 49759 0x0 SD (0)] to 31503
pass0: vpf-10160: block 33918734: item 1: No "." entry found in the first item of a directory
pass0: block 33918734, item 1: The directory [31503 49759] has the wrong mode (?---------), corrected to (d---------)
verify_directory_item: block 33918734, item 31503 49759 0x401 DIR (3), len 200, location 3852 entry count 7, fsck need 0, format old: All entries were deleted from the directory
pass0: vpf-10550: block 33918734, item 1: Wrong order of items - change the object_id of the key [31503 4245088 0x0 SD (0)] to 49760
pass0: vpf-10410: block 33918734, item 5: Wrong order of items - change the type of the key [31503 2483077730 0x0 ??? (15)] to StatData
pass0: vpf-10550: block 33918734, item 3: Wrong order of items - change the object_id of the key [31503 2147648097 0x0 SD (0)] to 49761
pass0: block 33918734, item 4: The directory [31503 49761] has the wrong mode (br-xrw-r--), corrected to (dr-xrw-r--)
verify_directory_item: block 33918734, item 31503 49761 0x1 DIR (3), len 120, location 3316 entry count 4, fsck need 0, format old: All entries were deleted from the directory
pass0: vpf-10550: block 33918734, item 4: Wrong order of items - change the object_id of the key [31503 2483077730 0x0 SD (0)] to 49762
pass0: vpf-10160: block 33918916: item 12: No "." entry found in the first item of a directory
block 33922188: The number of items (32) is incorrect, should be (1) - corrected
block 33922188: The free space (88) is incorrect, should be (3848) - corrected
verify_directory_item: block 33922188, item 2434234895 8463425 0x1 DIR (3), len 200, location 3896 entry count 7, fsck need 0, format old: All entries were deleted from the directory
block 33922837: The number of items (9) is incorrect, should be (0) - corrected
block 33922837: The free space (2196) is incorrect, should be (4072) - corrected
block 33922914: The number of items (13) is incorrect, should be (0) - corrected
block 33922914: The free space (1088) is incorrect, should be (4072) - corrected
block 33923262: The number of items (13) is incorrect, should be (2) - corrected
block 33923262: The free space (228) is incorrect, should be (3692) - corrected
block 33927887: The number of items (14) is incorrect, should be (0) - corrected
block 33927887: The free space (644) is incorrect, should be (4072) - corrected
pass0: vpf-10160: block 34471946: item 16: No "." entry found in the first item of a directory
pass0: vpf-10160: block 34471946: item 18: No "." entry found in the first item of a directory
block 34471946: item 18: ".." is 0-th entry
6 directory entries were hashed with not set hash.
251704 directory entries were hashed with "r5" hash.
####### Pass 1 #######

--M9NhX3UHpAaciwkO--
