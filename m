From: Brian Tinsley <btinsley@emageon.com>
Subject: [MORE] Filesystem Corruption
Date: Thu, 05 Sep 2002 12:16:04 -0500
Message-ID: <3D779154.1020506@emageon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090702090605070200070602"
Return-path: <reiserfs-list-return-11379-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list <reiserfs-list@namesys.com>

--------------090702090605070200070602
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I meant to attach the output from reiserfsck on the two partitions that 
asked to have --rebuild-tree used on them in last posting. Here it is. 
My concern is the second partition that reports "Fatal corruptions found".

-- 
Brian Tinsley
Chief Systems Engineer
Emageon


--------------090702090605070200070602
Content-Type: text/plain;
 name="reiserfsck.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfsck.txt"

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3

Will read-only check consistency of the filesystem on /dev/sdd1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Thu Sep  5 10:26:50 2002
###########
Replaying journal..
0 transactions replayed
Checking S+tree../  2 (of   7)/ 31 (of 140)/100 (of 125)leaf 209759 has wrong structure
whole subtree skipped
ok
Comparing bitmaps..free block count 28504138 mismatches with a correct one 28514095.
on-disk bitmap does not match to the correct one.
Bad nodes were found, Semantic pass skipped
There were found 1 corruptions which can be fixed only during --rebuild-tree
###########
reiserfsck finished at Thu Sep  5 10:29:25 2002
###########


<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3

Will read-only check consistency of the filesystem on /dev/sdd2
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Thu Sep  5 11:00:29 2002
###########
Replaying journal..
0 transactions replayed
Checking S+tree../  5 (of   5)/ 25 (of  98)/ 86 (of 164)
bad_stat_data: 2764113 is shared by at least two files
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 0 to the block 21415063 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 1 to the block 21415064 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 2 to the block 21415067 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 3 to the block 21415068 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 4 to the block 21415069 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 5 to the block 21415070 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 6 to the block 21415081 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 7 to the block 21415082 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 8 to the block 21415085 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 9 to the block 21415086 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 10 to the block 21415099 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764113 0x1 IND (1), len 48, location 4004 entry count 0, fsck need 0, format new has a pointer 11 to the block 21415100 which is in tree already

bad_stat_data: 2764114 is shared by at least two files
bad_indirect_item: block 465794: item 2762182 2764114 0x1 IND (1), len 8, location 3952 entry count 0, fsck need 0, format new has a pointer 0 to the block 23094854 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764114 0x1 IND (1), len 8, location 3952 entry count 0, fsck need 0, format new has a pointer 1 to the block 23094855 which is in tree already

bad_stat_data: 2764115 is shared by at least two files
bad_indirect_item: block 465794: item 2762182 2764115 0x1 IND (1), len 36, location 3872 entry count 0, fsck need 0, format new has a pointer 0 to the block 21415502 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764115 0x1 IND (1), len 36, location 3872 entry count 0, fsck need 0, format new has a pointer 1 to the block 21415503 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764115 0x1 IND (1), len 36, location 3872 entry count 0, fsck need 0, format new has a pointer 2 to the block 21415569 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764115 0x1 IND (1), len 36, location 3872 entry count 0, fsck need 0, format new has a pointer 3 to the block 21415570 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764115 0x1 IND (1), len 36, location 3872 entry count 0, fsck need 0, format new has a pointer 4 to the block 21415699 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764115 0x1 IND (1), len 36, location 3872 entry count 0, fsck need 0, format new has a pointer 5 to the block 21415712 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764115 0x1 IND (1), len 36, location 3872 entry count 0, fsck need 0, format new has a pointer 6 to the block 21415725 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764115 0x1 IND (1), len 36, location 3872 entry count 0, fsck need 0, format new has a pointer 7 to the block 21415740 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764115 0x1 IND (1), len 36, location 3872 entry count 0, fsck need 0, format new has a pointer 8 to the block 21415741 which is in tree already

bad_stat_data: 2764116 is shared by at least two files
bad_indirect_item: block 465794: item 2762182 2764116 0x1 IND (1), len 4, location 3824 entry count 0, fsck need 0, format new has a pointer 0 to the block 22613989 which is in tree already

bad_stat_data: 2764117 is shared by at least two files
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 0 to the block 21415750 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 1 to the block 21415751 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 2 to the block 21415752 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 3 to the block 21415753 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 4 to the block 21415754 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 5 to the block 21415755 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 6 to the block 21415756 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 7 to the block 21415757 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 8 to the block 21415758 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 9 to the block 21415759 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 10 to the block 21415760 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 11 to the block 21415761 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 12 to the block 21415762 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 13 to the block 21415763 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764117 0x1 IND (1), len 60, location 968 entry count 0, fsck need 0, format new has a pointer 14 to the block 21415764 which is in tree already

bad_stat_data: 2764118 is shared by at least two files

bad_stat_data: 2764119 is shared by at least two files
bad_indirect_item: block 465794: item 2762182 2764119 0x1 IND (1), len 36, location 836 entry count 0, fsck need 0, format new has a pointer 0 to the block 21415521 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764119 0x1 IND (1), len 36, location 836 entry count 0, fsck need 0, format new has a pointer 1 to the block 21415638 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764119 0x1 IND (1), len 36, location 836 entry count 0, fsck need 0, format new has a pointer 2 to the block 21415650 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764119 0x1 IND (1), len 36, location 836 entry count 0, fsck need 0, format new has a pointer 3 to the block 21415682 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764119 0x1 IND (1), len 36, location 836 entry count 0, fsck need 0, format new has a pointer 4 to the block 21415698 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764119 0x1 IND (1), len 36, location 836 entry count 0, fsck need 0, format new has a pointer 5 to the block 21415701 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764119 0x1 IND (1), len 36, location 836 entry count 0, fsck need 0, format new has a pointer 6 to the block 21415716 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764119 0x1 IND (1), len 36, location 836 entry count 0, fsck need 0, format new has a pointer 7 to the block 21415717 which is in tree already
bad_indirect_item: block 465794: item 2762182 2764119 0x1 IND (1), len 36, location 836 entry count 0, fsck need 0, format new has a pointer 8 to the block 21415719 which is in tree already

bad_stat_data: 2764120 is shared by at least two files
bad_path: left delimiting key 2762182 2764120 0x1001 DRCT (2) must be equal to 2762182 2764113 0x0 SD (0) (block 465794, pos 0)
/ 59 (of  98)/ 68 (of 170)bad_indirect_item: block 470919: item 2794700 2794753 0x1 IND (1), len 52, location 3980 entry count 0, fsck need 0, format new has a pointer 0 to the block 22620183 which is in tree already
bad_indirect_item: block 470919: item 2794700 2794753 0x1 IND (1), len 52, location 3980 entry count 0, fsck need 0, format new has a pointer 1 to the block 22620184 which is in tree already
/ 61 (of  98)/ 49 (of 170)bad_indirect_item: block 471255: item 2796189 2796415 0x1 IND (1), len 64, location 3180 entry count 0, fsck need 0, format new has a pointer 0 to the block 23087707 which is in tree already
ok
Comparing bitmaps..ok
Fatal corruptions were found, Semantic pass skipped
There were found 1 corruptions which can be fixed only during --rebuild-tree
###########
reiserfsck finished at Thu Sep  5 11:01:56 2002
###########



--------------090702090605070200070602--

