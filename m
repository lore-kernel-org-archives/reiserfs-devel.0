From: jeff leads <jleads@yahoo.com>
Subject: File Corruption
Date: Mon, 30 Sep 2002 12:52:27 -0700 (PDT)
Message-ID: <20020930195227.71240.qmail@web10501.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11581-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Ok, I'm running RedHat 7.1, gcc 2.96-85, kernel
2.4.9-21 (redhat's version) and ReiserFSProgs 3.6.3 (
just upgraded from 3.x0j-1).

I'm starting to get file corruption here and there. 
My next question is, where do I go from here?  What
can I do to rectify this issue?  Do I run a rebuild at
this point?  What caused this?  

I know it's a lot of questions.  Just looking for a
point in the right direction. 

I've been seeing some of these messages in the message
logs, It started happening about 2 weeks ago after
about 8 months of flawless service.

Sep 30 14:03:11 goku kernel: is_tree_node: node level
64680 does not match to the expected one 1
Sep 30 14:03:11 goku kernel: vs-5150: search_by_key:
invalid format found in block 47718. Fsck?
Sep 30 14:03:11 goku kernel: is_tree_node: node level
64680 does not match to the expected one 1
Sep 30 14:03:11 goku kernel: vs-5150: search_by_key:
invalid format found in block 47718. Fsck?
Sep 30 14:03:11 goku kernel: vs-5657:
reiserfs_do_truncate: i/o failure occurred trying to
truncate [116139 106872 0xfffffffffffffff DIRECT]



When I ran a reiserfsck --check I got the output
below.


[root@goku /root]# reiserfsck /dev/ida/c0d0p5

<-------------reiserfsck, 2001------------->
reiserfsprogs 3.x.0j

Will read-only check consistency of the partition
Will put log info to 'stderr'
Do you want to run this program?[N/Yes] (note need to
type Yes):Yes
Analyzing journal..last flushed trans 9936623,
mount_id 120, will replay from 9936624 up to
9936665:Yes?Mount_id 120, transaction 9936624, desc
block 1395, commit block 1404: ( 47578 47649 7733248
16 47715 46480 54961 28273)
Mount_id 120, transaction 9936625, desc block 1405,
commit block 1413: ( 47578 47649 7733248 16 47715
46480 14926)
Mount_id 120, transaction 9936626, desc block 1414,
commit block 1421: ( 47649 47578 16 7733248 47715
46480)
Mount_id 120, transaction 9936627, desc block 1422,
commit block 1429: ( 47649 47578 7733248 16 47715
46480)
Mount_id 120, transaction 9936628, desc block 1430,
commit block 1441: ( 47649 7733248 16 47715 46480
47578 32768 47716 33073 25296)
Mount_id 120, transaction 9936629, desc block 1442,
commit block 1446: ( 47649 47578 16)
Mount_id 120, transaction 9936630, desc block 1447,
commit block 1454: ( 47649 47578 7733248 16 47715
46480)
Mount_id 120, transaction 9936631, desc block 1455,
commit block 1502: ( 47649 47578 7733248 16 47715
46480 47716 45332 56044 65112 31402 36988 10174 10165
14938 9536 83232 33731 10534 8330 8342 27677 27674
8365 18184 27703 27999 14952 12599 18186 18376 9364
9408 9431 33241 45073 43361 28273 12583 27994 34308
9533 67489 67491 67498 1015808)
Mount_id 120, transaction 9936632, desc block 1503,
commit block 1512: ( 47578 47649 7733248 16 47716
46480 54961 28273)
Mount_id 120, transaction 9936633, desc block 1513,
commit block 1537: ( 47649 47578 7733248 16 47716
46480 36988 10174 10165 14938 9536 83232 33731 10534
8330 8342 27677 27674 8365 18184 27703 27999 10107)
Mount_id 120, transaction 9936634, desc block 1538,
commit block 1557: ( 47578 47649 7733248 16 47716
46480 14952 9431 14938 10174 33241 45073 43361 27994
32768 47717 33073 14926)
Mount_id 120, transaction 9936635, desc block 1558,
commit block 1574: ( 47649 47578 7733248 16 47716
46480 10161 10174 10165 14938 83232 33731 10534 27674
67567)
Mount_id 120, transaction 9936636, desc block 1575,
commit block 1601: ( 39068 47578 47649 7733248 16
47716 46480 36988 10174 10165 14938 9536 83232 33731
10534 8330 8342 27677 27674 8365 18184 27703 27999
10107 47717)
Mount_id 120, transaction 9936637, desc block 1602,
commit block 1609: ( 47649 47578 16 7733248 47717
46480)
Mount_id 120, transaction 9936638, desc block 1610,
commit block 1617: ( 47649 7733248 16 47717 46480
47578)
Mount_id 120, transaction 9936639, desc block 1618,
commit block 1622: ( 47649 47578 16)
Mount_id 120, transaction 9936640, desc block 1623,
commit block 1655: ( 47578 47649 7733248 16 47717
46480 55738 42257 73886 55877 43960 55671 36869 10107
10534 27999 12583 36867 9545 10174 10165 14938 12608
83232 33731 9737 1015808 36829 33073 32768 36870)
Mount_id 120, transaction 9936641, desc block 1656,
commit block 1667: ( 47649 47578 7733248 16 47717
46480 54961 28273 24159 48831)
Mount_id 120, transaction 9936642, desc block 1668,
commit block 1677: ( 45073 48831 47649 47578 7733248
16 47717 46480)
Mount_id 120, transaction 9936643, desc block 1678,
commit block 1687: ( 47649 47578 7733248 16 47717
46480 59424 40789)
Mount_id 120, transaction 9936644, desc block 1688,
commit block 1695: ( 47649 7733248 16 47717 46480
47578)
Mount_id 120, transaction 9936645, desc block 1696,
commit block 1700: ( 47578 47649 16)
Mount_id 120, transaction 9936646, desc block 1701,
commit block 1737: ( 47649 47578 7733248 16 47717
46480 55738 42257 73886 55877 43960 55671 36869 10107
10534 27999 12583 32768 47718 33073 36867 9545 10174
10165 14938 12608 83232 33731 9737 1015808 36829 36870
24159 45073 48831)
Mount_id 120, transaction 9936647, desc block 1738,
commit block 1740: ( 16)
Mount_id 120, transaction 9936648, desc block 1741,
commit block 1750: ( 59424 40789 47578 47649 7733248
16 47717 46480)
Mount_id 120, transaction 9936649, desc block 1751,
commit block 1758: ( 47649 47578 16 7733248 47717
46480)
Mount_id 120, transaction 9936650, desc block 1759,
commit block 1766: ( 47649 47578 7733248 16 47717
46480)
Mount_id 120, transaction 9936651, desc block 1767,
commit block 1776: ( 47649 47578 7733248 16 47717
46480 14926 25296)
Mount_id 120, transaction 9936652, desc block 1777,
commit block 1784: ( 47578 47649 7733248 16 47717
46480)
Mount_id 120, transaction 9936653, desc block 1785,
commit block 1793: ( 47578 47649 7733248 16 47717
46480 47718)
Mount_id 120, transaction 9936654, desc block 1794,
commit block 1803: ( 47578 47649 7733248 16 47718
46480 54961 28273)
Mount_id 120, transaction 9936655, desc block 1804,
commit block 1829: ( 47649 47578 7733248 16 47718
46480 27702 10174 10165 14938 83232 33731 36988 9536
10534 8330 8342 27677 27674 8365 18184 27703 27999
10107)
Mount_id 120, transaction 9936656, desc block 1830,
commit block 1841: ( 47578 47649 7733248 16 47718
46480 32768 47719 33073 7766016)
Mount_id 120, transaction 9936657, desc block 1842,
commit block 1857: ( 14952 9431 14938 10174 33241
45073 43361 27994 47649 47578 7766016 16 47718 46480)
Mount_id 120, transaction 9936658, desc block 1858,
commit block 1866: ( 14926 47578 47649 7766016 16
47718 46480)
Mount_id 120, transaction 9936659, desc block 1867,
commit block 1872: ( 38869 48831 47649 47578)
Mount_id 120, transaction 9936660, desc block 1873,
commit block 1876: ( 38869 16)
Mount_id 120, transaction 9936661, desc block 1877,
commit block 1879: ( 16)
Mount_id 120, transaction 9936662, desc block 1880,
commit block 1882: ( 16)
Mount_id 120, transaction 9936663, desc block 1883,
commit block 1891: ( 48831 47649 47578 7766016 16
47718 46480)
Mount_id 120, transaction 9936664, desc block 1892,
commit block 1896: ( 48831 47578 47649)
Mount_id 120, transaction 9936665, desc block 1897,
commit block 1905: ( 48831 47649 47578 7766016 16
47718 46480)
Journal replaied
Fetching on-disk bitmap..done
Checking S+tree../  1 (of   2)/ 43 (of 152)/  1 (of
163)shrink_id_map: objectid map shrinked: used 4096, 5
blocks
/ 44 (of 152)/105 (of 170)shrink_id_map: objectid map
shrinked: used 4096, 5 blocks
/ 58 (of 152)/ 57 (of 167)shrink_id_map: objectid map
shrinked: used 4096, 5 blocks
/ 59 (of 167)shrink_id_map: objectid map shrinked:
used 4096, 5 blocks
/ 77 (of 167)shrink_id_map: objectid map shrinked:
used 4096, 5 blocks
/ 79 (of 167)shrink_id_map: objectid map shrinked:
used 4096, 5 blocks
/ 80 (of 167)shrink_id_map: objectid map shrinked:
used 4096, 5 blocks
/101 (of 152)/ 91 (of 130)grow_id_map: objectid map
expanded: used 5120, 5 blocks
/117 (of 152)/ 80 (of 128)grow_id_map: objectid map
expanded: used 10240, 10 blocks
/125 (of 152)/121 (of 170)shrink_id_map: objectid map
shrinked: used 9216, 10 blocks
/  2 (of   2)/ 57 (of 150)/ 31 (of  85)grow_id_map:
objectid map expanded: used 5120, 5 blocks
/ 58 (of 150)/ 88 (of 170)grow_id_map: objectid map
expanded: used 5120, 5 blocks
/134 (of 170)grow_id_map: objectid map expanded: used
5120, 5 blocks
/ 65 (of 150)/148 (of 161)grow_id_map: objectid map
expanded: used 5120, 5 blocks
/ 68 (of 150)/131 (of 145)grow_id_map: objectid map
expanded: used 5120, 5 blocks
/ 88 (of 150)/  2 (of 156)shrink_id_map: objectid map
shrinked: used 4096, 5 blocks
/ 30 (of 156)shrink_id_map: objectid map shrinked:
used 4096, 5 blocks
/ 32 (of 156)shrink_id_map: objectid map shrinked:
used 4096, 5 blocks
/ 89 (of 150)/ 89 (of 169)block 7766332 is not marked
as used in the disk bitmap
block 7766211 is not marked as used in the disk bitmap
block 7766212 is not marked as used in the disk bitmap
block 7766213 is not marked as used in the disk bitmap
block 7766219 is not marked as used in the disk bitmap
block 7766227 is not marked as used in the disk bitmap
block 7766228 is not marked as used in the disk bitmap
block 7766229 is not marked as used in the disk bitmap
block 7766231 is not marked as used in the disk bitmap
block 7766232 is not marked as used in the disk bitmap
block 7766233 is not marked as used in the disk bitmap
block 7766234 is not marked as used in the disk bitmap
block 7766235 is not marked as used in the disk bitmap
block 7766236 is not marked as used in the disk bitmap
block 7766239 is not marked as used in the disk bitmap
block 7766240 is not marked as used in the disk bitmap
block 7766241 is not marked as used in the disk bitmap
block 7766242 is not marked as used in the disk bitmap
block 7766243 is not marked as used in the disk bitmap
block 7766244 is not marked as used in the disk bitmap
block 7766245 is not marked as used in the disk bitmap
block 7766246 is not marked as used in the disk bitmap
block 7766247 is not marked as used in the disk bitmap
block 7766248 is not marked as used in the disk bitmap
block 7766249 is not marked as used in the disk bitmap
block 7766250 is not marked as used in the disk bitmap
block 7766252 is not marked as used in the disk bitmap
block 7766253 is not marked as used in the disk bitmap
block 7766254 is not marked as used in the disk bitmap
block 7766255 is not marked as used in the disk bitmap
block 7766256 is not marked as used in the disk bitmap
block 7766257 is not marked as used in the disk bitmap
block 7766258 is not marked as used in the disk bitmap
block 7766259 is not marked as used in the disk bitmap
block 7766260 is not marked as used in the disk bitmap
block 7766261 is not marked as used in the disk bitmap
block 7766262 is not marked as used in the disk bitmap
block 7766263 is not marked as used in the disk bitmap
block 7766264 is not marked as used in the disk bitmap
block 7766265 is not marked as used in the disk bitmap
block 7766266 is not marked as used in the disk bitmap
block 7766267 is not marked as used in the disk bitmap
block 7766268 is not marked as used in the disk bitmap
block 7766269 is not marked as used in the disk bitmap
block 7766270 is not marked as used in the disk bitmap
block 7766271 is not marked as used in the disk bitmap
block 7766272 is not marked as used in the disk bitmap
block 7766273 is not marked as used in the disk bitmap
block 7766274 is not marked as used in the disk bitmap
block 7766275 is not marked as used in the disk bitmap
block 7766276 is not marked as used in the disk bitmap
block 7766277 is not marked as used in the disk bitmap
block 7766278 is not marked as used in the disk bitmap
block 7766279 is not marked as used in the disk bitmap
block 7766280 is not marked as used in the disk bitmap
block 7766282 is not marked as used in the disk bitmap
block 7766283 is not marked as used in the disk bitmap
block 7766284 is not marked as used in the disk bitmap
block 7766285 is not marked as used in the disk bitmap
block 7766286 is not marked as used in the disk bitmap
block 7766287 is not marked as used in the disk bitmap
block 7766288 is not marked as used in the disk bitmap
block 7766289 is not marked as used in the disk bitmap
block 7766290 is not marked as used in the disk bitmap
block 7766291 is not marked as used in the disk bitmap
block 7766292 is not marked as used in the disk bitmap
block 7766293 is not marked as used in the disk bitmap
block 7766294 is not marked as used in the disk bitmap
block 7766295 is not marked as used in the disk bitmap
block 7766296 is not marked as used in the disk bitmap
block 7766297 is not marked as used in the disk bitmap
block 7766298 is not marked as used in the disk bitmap
block 7766299 is not marked as used in the disk bitmap
block 7766300 is not marked as used in the disk bitmap
block 7766301 is not marked as used in the disk bitmap
block 7766302 is not marked as used in the disk bitmap
block 7766303 is not marked as used in the disk bitmap
block 7766304 is not marked as used in the disk bitmap
block 7766305 is not marked as used in the disk bitmap
block 7766306 is not marked as used in the disk bitmap
block 7766307 is not marked as used in the disk bitmap
block 7766308 is not marked as used in the disk bitmap
block 7766309 is not marked as used in the disk bitmap
block 7766310 is not marked as used in the disk bitmap
block 7766311 is not marked as used in the disk bitmap
block 7766312 is not marked as used in the disk bitmap
block 7766313 is not marked as used in the disk bitmap
block 7766314 is not marked as used in the disk bitmap
block 7766315 is not marked as used in the disk bitmap
block 7766316 is not marked as used in the disk bitmap
block 7766317 is not marked as used in the disk bitmap
block 7766318 is not marked as used in the disk bitmap
block 7766319 is not marked as used in the disk bitmap
block 7766320 is not marked as used in the disk bitmap
block 7766321 is not marked as used in the disk bitmap
block 7766322 is not marked as used in the disk bitmap
block 7766323 is not marked as used in the disk bitmap
block 7766324 is not marked as used in the disk bitmap
block 7766325 is not marked as used in the disk bitmap
block 7766326 is not marked as used in the disk bitmap
block 7766327 is not marked as used in the disk bitmap
block 7766328 is not marked as used in the disk bitmap
block 7766329 is not marked as used in the disk bitmap
block 7766330 is not marked as used in the disk bitmap
block 7766331 is not marked as used in the disk bitmap
/115 (of 150)/132 (of 143)shrink_id_map: objectid map
shrinked: used 4096, 5 blocks
ok
Comparing bitmaps..free block count 1214444 mismatches
with a correct one 1214339.
byte 970776: bm1: 0 bm2 38
byte 970777: bm1: 0 bm2 8
byte 970778: bm1: 40 bm2 fffffff8
byte 970779: bm1: 0 bm2 ffffff9f
byte 970780: bm1: 0 bm2 ffffffff
byte 970781: bm1: 8 bm2 ffffffff
byte 970782: bm1: 0 bm2 ffffffff
byte 970783: bm1: 0 bm2 ffffffff
byte 970784: bm1: 0 bm2 ffffffff
byte 970785: bm1: 2 bm2 ffffffff
byte 970786: bm1: 0 bm2 ffffffff
byte 970787: bm1: 0 bm2 ffffffff
byte 970788: bm1: 0 bm2 ffffffff
byte 970789: bm1: 0 bm2 ffffffff
byte 970790: bm1: 0 bm2 ffffffff
byte 970791: bm1: 0 bm2 1f
on-disk bitmap does not match to the correct one. 16
bytes differ
ok
Checking Semantic
t/opt/AVEngine/registry/hkey_current_user/software/computerassociates/inoculateit/6.0/local_scanner/stop_at_first_virus_in_a/tmp/recover.2.30031file
9 106855 has wrong sd_size 56377344, has to be
60522496
/scratch/UPS
SHIPPING/UPS/Common/SuppAsst/Tuner/vendors/ups/maps/com/ups/supportassistant/WorldShip/guides/Communications_Modem_Guidelet.mzp.t/ups
hosed
7-02/UPS/Common/SuppAsst/Tuner/vendors/ups/maps/com/ups/supportassistant/WorldShip/guides/Communications_Network_Information_Guidelok
ok


__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com
