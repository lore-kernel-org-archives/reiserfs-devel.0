From: =?unknown-8bit?q?Jos=E9?= Mans <mans@gyptis.org>
Subject: BUG ? :)
Date: Wed, 8 Oct 2003 20:08:59 +0200
Message-ID: <20031008180859.GA1090@gyptis.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hello,
please see :

gyptis:/mnt/local/Download/Drivers/ATI/RAGE64/11.2560/UTILITY/DISK1/VDB# ls
A?P?Eq7nVDB@  NEC_6FGnVDB@
ls -l
ls: NEC_6FGnVDB@: No such file or directory
ls: APEq7nVDB@: No such file or directory
total 0
ls -lisaF
ls: .@: No such file or directory
ls: .n: No such file or directory
ls: NEC_6FGnVDB@: No such file or directory
ls: APEq7nVDB@: No such file or directory


gyptis:/mnt/local/Download/Drivers/ATI/RAGE64/11.2560/UTILITY/DISK1# rm -rf VDB/

umount /mnt
fsck /dev/hda4 #(/mnt)
 (see end this message)
fsck  --rebuild-tree /dev/hda4
 fsck.ext3: invalid option -- e  :)



rm -rf /mnt/local/Download/Drivers/ATI/RAGE64/11.2560/UTILITY/DISK1/VDB/
rm: cannot remove directory `VDB/': Directory not empty

outch :)

My version reserfs :
  reiserfsprogs 1:3.6.11-1 (debian testing)
Linux gyptis 2.4.21 


thx :)



# LOG fsck...

Replaying journal..
0 transactions replayed
Checking internal tree../  1 (of   2)/ 23 (of  97)/ 44 (of  91)bad_directory_item: block 8246: The directory item [4 178 0x1 DIR (3)] has a not properly hashed entry (0)
bad_leaf: block 8246, item 20: The corrupted item found (4 178 0x1 DIR (3), len 264, location 1560 entry count 11, / 24 (of  97)/ 55 (of  85)block 8258: The number of items (17) is incorrect, should be (9)
 the problem in the internal node occured (8258), whole subtree is skipped                                         / 53 (of  97)/ 77 (of 170)block 2684348: The level of the node (16385) is not correct, (1) expected
 the problem in the internal node occured (2684348), whole subtree is skipped                                      / 84 (of  97)/ 11 (of 102)bad_directory_item: block 4463855: The directory item [52785 52797 0x1 DIR (3)] has a not properly hashed entry (0)
bad_leaf: block 4463855, item 8: The corrupted item found (52785 52797 0x1 DIR (3), len 112, location 676 entry count 4, fsck need 0, format old)                                                                                                  /  2 (of   2)/ 63 (of 123)/ 21 (of 132)bad_directory_item: block 8498503: The directory item [107898 113352 0x320a3400 DIR (3)] has a not properly hashed entry (7)
bad_leaf: block 8498503, item 0: The corrupted item found (107898 113352 0x320a3400 DIR (3), len 624, location 3472 entry count 20, fsck need 0, format old)
bad_directory_item: block 8498503: The directory item [107898 118588 0x1 DIR (3)] has a not properly hashed entry (0)
bad_leaf: block 8498503, item 6: The corrupted item found (107898 118588 0x1 DIR (3), len 600, location 1068 entry count 22, fsck need 0, format old)                                                                                                           / 70 (of 123)/129 (of 170)bad_directory_item: block 8517201: The directory item [112190 112212 0x1 DIR (3)] has a not properly hashed entry (0)
bad_leaf: block 8517201, item 14: The corrupted item found (112190 112212 0x1 DIR (3), len 944, location 1544 entry count 31, fsck need 0, format old)                                                                                                          / 74 (of 123)/ 33 (of 168)bad_directory_item: block 8548003: The directory item [114772 115331 0x1 DIR (3)] has a not properly hashed entry (16)
bad_leaf: block 8548003, item 11: The corrupted item found (114772 115331 0x1 DIR (3), len 1288, location 312 entry count 38, fsck need 0, format old)                                                                                                                       /155 (of 168)bad_directory_item: block 8556828: The directory item [115105 115131 0x1 DIR (3)] has the corrupted entry structure
bad_leaf: block 8556828, item 1: The corrupted item found (115105 115131 0x1 DIR (3), len 1120, location 2932 entry count 27, fsck need 0, format old)                                                                                                          / 75 (of 123)/ 12 (of 170)block 8556855: The level of the node (16385) is not correct, (1) expected
 the problem in the internal node occured (8556855), whole subtree is skipped                                      / 76 (of 123)/ 79 (of 170)bad_directory_item: block 8559508: The directory item [115786 115951 0x1 DIR (3)] has the corrupted entry structure
bad_leaf: block 8559508, item 4: The corrupted item found (115786 115951 0x1 DIR (3), len 240, location 152 entry count 5, fsck need 0, format old)                                                                                                             / 82 (of 123)/115 (of 170)bad_directory_item: block 8578253: The directory item [119215 119216 0x1 DIR (3)] has a not properly hashed entry (0)
bad_leaf: block 8578253, item 2: The corrupted item found (119215 119216 0x1 DIR (3), len 352, location 3116 entry count 13, fsck need 0, format old)
bad_directory_item: block 8578253: The directory item [119216 119227 0x1 DIR (3)] has a not properly hashed entry (7)
bad_leaf: block 8578253, item 24: The corrupted item found (119216 119227 0x1 DIR (3), len 328, location 2112 entry count 12, fsck need 0, format old)                                                                                                                       /118 (of 170)bad_indirect_item: block 8578264: The item [119238 119239 0x1 IND (1)] has the bad pointer (0) to the block (1082321204)
bad_indirect_item: block 8578264: The item [119238 119239 0x1 IND (1)] has the bad pointer (1) to the block (1082321205)
bad_indirect_item: block 8578264: The item [119238 119239 0x1 IND (1)] has the bad pointer (2) to the block (1082321206)
bad_indirect_item: block 8578264: The item [119238 119239 0x1 IND (1)] has the bad pointer (3) to the block (1082321207)
bad_indirect_item: block 8578264: The item [119238 119239 0x1 IND (1)] has the bad pointer (4) to the block (1082321203)
bad_indirect_item: block 8578264: The item [102854 102856 0x1 IND (1)] has the bad pointer (0) to the block (1082321209)
bad_indirect_item: block 8578264: The item [102854 102856 0x1 IND (1)] has the bad pointer (1) to the block (1082321210)
bad_indirect_item: block 8578264: The item [102854 102856 0x1 IND (1)] has the bad pointer (2) to the block (1082321211)
bad_indirect_item: block 8578264: The item [102854 102856 0x1 IND (1)] has the bad pointer (3) to the block (1082321212)
bad_indirect_item: block 8578264: The item [102854 102856 0x1 IND (1)] has the bad pointer (4) to the block (1082321208)
bad_leaf: block 8578264, items 7 and 8: The wrong order of items: [119238 119240 0x0 SD (0)], [102854 102856 0x1 IND (1)]
bad_stat_data: The objectid (102857) is shared by at least two files
bad_directory_item: block 8578264: The directory item [102854 102857 0x1 DIR (3)] has the corrupted entry structure
bad_leaf: block 8578264, item 10: The corrupted item found (102854 102857 0x1 DIR (3), len 112, location 460 entry count 4, fsck need 0, format old)
bad_stat_data: The objectid (102858) is shared by at least two files                                               / 84 (of 123)/ 42 (of 170)bad_directory_item: block 8616684: The directory item [120818 120842 0x1 DIR (3)] has the corrupted entry structure
bad_leaf: block 8616684, item 11: The corrupted item found (120818 120842 0x1 DIR (3), len 2128, location 320 entry count 66, fsck need 0, format old)                                                                                                          / 87 (of 123)/ 24 (of 166)bad_leaf: block 8714253, items 13 and 14: The wrong order of items: [123731 123735 0x0 SD (0)], [10734finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Bad nodes were found, Semantic pass skipped
17 found corruptions can be fixed only when running with --rebuild-tree
###########
reiserfsck finished at Wed Oct  8 20:05:09 2003
###########


