From: Alistair McDonald <alistair@inrevo.com>
Subject: Re: core dump on reiserfsck --rebuildtree
Date: Mon, 22 Sep 2003 11:02:08 +0100
Message-ID: <200309221102.08476.alistair@inrevo.com>
References: <65047.80.5.156.133.1064000151.squirrel@blanark.dyndns.org> <200309200017.08396.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15716-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200309200017.08396.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>

On Friday 19 September 2003 21:17 pm, you wrote:
> This is unexpected case when the corruption that is supposed to be fixed
> at pass0 still exists on pass1. It is interesting if that 'wrong pointer'
> number and the file key are the same all the time, could you run it again
> and compair these numbers.
>
> Actually last few times similar corruptions occured due to bad memory or
> due to some buggy pathes from distributors. So 1 -- would you test you
> memory and 2 -- would you use reiserfsprogs from our ftp site
> (ftp.namesys.com/pub/reiserfsprogs/). Version -- 3.6.11.


Thanks for your reply, Vitaly.

I did as you asked, and have run several iterations of a memory tester, and 
also upgraded to the latest version of the tools.

Here is the output in entirety:

--------------BEGIN OUTPUT----------
altair root # /usr/local/sbin/reiserfsck --rebuild-tree /dev/lvm1/data
reiserfsck 3.6.11 (2003 www.namesys.com)

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

Will rebuild the filesystem (/dev/lvm1/data) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Sun Sep 21 00:06:54 2003
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 32379002 blocks marked used
Skipping 10050 blocks (super block, journal, bitmaps) 32368952 blocks will
be read
0%pass0: vpf-10140: block 351219: items 18 and 19 have bad short keys
[159757 159757 0x0 SD (0)], [159757 159757 0x1 DRC
T (2)], both deleted
.pass0: block 1569971, item 2: The file [134430 134431] has the wrong mode
(?---------), corrected to (----------)
.pass0: block 3145212, item 5: The file [142257 142258] has the wrong mode
(?------r--), corrected to (-------r--)
pass0: vpf-10430: block 3145649, item 4: Wrong order of items - change the
dir_id of the key [145538 145539 0x1 DRCT (2)
] to 145516
pass0: vpf-10560: block 3145649, item 4: Wrong order of items - change the
object_id of the key [145516 145539 0x1 DRCT
(2)] to 145518
pass0: block 3145649, item 4: Not the directory [145516 145518] has the
wrong mode (drwxr-xr-x), corrected to (-rwxr-xr-
x)
pass0: block 3145713, item 18: The file [146134 146135] has the wrong mode
(?---------), corrected to (----------)
.pass0: block 4650256, item 2: The file [137258 137261] has the wrong mode
(?---------), corrected to (----------)
.20%.block 9010383: The number of items (16) is incorrect, should be (2) -
corrected
block 9010383: The free space (1) is incorrect, should be (4024) - corrected
pass0: vpf-10130: block 9010383: item 0: Wrong key [61440 0 0xf001 SD
(0)], corrected to [4063162594 14 0xf001 SD (0)]
pass0: block 9010383, item 0: StatData item of wrong length found
4063162594 14 0x0 SD (0), len 0, location 4096 entry c
ount 61440, fsck need 2, format BAD - deleted
pass0: vpf-10110: block 9010383, item (0): Unknown item type found
[4063162594 14 0x100 ??? (15)] - deleted
block 9027317: The number of items (271) is incorrect, should be (1) -
corrected
block 9027317: The free space (0) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 9027317, item (0): Unknown item type found
[284164112 0 0xf01f010 ??? (15)] - deleted
block 9039843: The number of items (15) is incorrect, should be (1) -
corrected
block 9039843: The free space (0) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 9039843, item (0): Unknown item type found [0 0
0xf ??? (15)] - deleted
block 9076792: The free space (4096) is incorrect, should be (4072) -
corrected
block 9548999: The number of items (47616) is incorrect, should be (1) -
corrected
block 9548999: The free space (5) is incorrect, should be (3024) - corrected
pass0: vpf-10110: block 9548999, item (0): Unknown item type found
[4278190080 4294967295 0xffff00ff ??? (15)] - deleted
.pass0: block 9872602, item 15034 15099 0x10ac9b80 DIR (3), len 4032,
location 64 entry count 127, fsck need 1, format o
ld: 95 entries were deleted
pass0: block 9895922, item 28581 29347 0x1 DIR (3), len 1080, location
2608 entry count 39, fsck need 1, format old: 28
entries were deleted
block 9915123: The number of items (271) is incorrect, should be (1) -
corrected
block 9915123: The free space (0) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 9915123, item (0): Unknown item type found [0
16777231 0xf00000 ??? (15)] - deleted
pass0: vpf-10560: block 10410848, item 4: Wrong order of items - change
the object_id of the key [47129 47477 0x17ef7680
 DIR (3)] to 47453
pass0: vpf-10160: block 10410848: item 4: No "." entry found in the first
item of a directory
pass0: block 10410848, item 4: The directory [47129 47453] has the wrong
mode (-rw-rw-r--), corrected to (drw-rw-r--)
pass0: vpf-10560: block 10410897, item 2: Wrong order of items - change
the object_id of the key [47129 47526 0x1 DRCT (
2)] to 47518
pass0: block 10419267, item 62773 62774 0x5e514b00 DIR (3), len 4040,
location 56 entry count 138, fsck need 1, format o
ld: 101 entries were deleted
.block 11088119: The number of items (11264) is incorrect, should be (1) -
corrected
block 11088119: The free space (1024) is incorrect, should be (4048) -
corrected
pass0: block 11088119, item 0: StatData item of wrong length found 82944
8192 0x0 SD (0), len 0, location 4096 entry cou
nt 22272, fsck need 0, format old - deleted
block 11137639: The free space (4096) is incorrect, should be (4072) -
corrected
block 11137940: The free space (4096) is incorrect, should be (4072) -
corrected
block 11137960: The free space (4096) is incorrect, should be (4072) -
corrected
block 11138171: The free space (4096) is incorrect, should be (4072) -
corrected
block 11460941: The free space (4) is incorrect, should be (4072) - corrected
block 11915937: The number of items (47616) is incorrect, should be (1) -
corrected
block 11915937: The free space (5) is incorrect, should be (3024) - corrected
pass0: vpf-10110: block 11915937, item (0): Unknown item type found
[4278190080 4294967295 0xffff00ff ??? (15)] - delete
d
.block 12218892: The number of items (47616) is incorrect, should be (1) -
corrected
block 12218892: The free space (5) is incorrect, should be (3024) - corrected
pass0: vpf-10110: block 12218892, item (0): Unknown item type found
[4278190080 4294967295 0xffff00ff ??? (15)] - delete
d
pass0: vpf-10160: block 12231785: item 3: No "." entry found in the first
item of a directory
pass0: block 12232886, item 8: The file [98079 98099] has the wrong mode
(?------r--), corrected to (-------r--)
pass0: block 12252853, item 5: The file [104045 104091] has the wrong mode
(?------r--), corrected to (-------r--)
block 12625600: The number of items (271) is incorrect, should be (1) -
corrected
block 12625600: The free space (0) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 12625600, item (0): Unknown item type found [0
16777231 0xf00000 ??? (15)] - deleted
pass0: block 13105168, item 4: The file [118506 118520] has the wrong mode
(?------r--), corrected to (-------r--)
pass0: block 13163501, item 2 120555 0x1 DIR (3), len 792, location 3304
entry count 24, fsck need 0, format old: 18 ent
ries were deleted
pass0: block 13163501, item 2: The directory [2 121031] has the wrong mode
(?---------), corrected to (d---------)
verify_directory_item: block 13163501, item 2 121031 0x1 DIR (3), len
2680, location 1156 entry count 94, fsck need 0, f
ormat old: All entries were deleted from the directory
40%.pass0: block 15234537, item 2: The file [121078 121087] has the wrong
mode (?---------), corrected to (----------)
pass0: block 15234569, item 2: The file [121105 121115] has the wrong mode
(?------r--), corrected to (-------r--)
pass0: block 15235848, item 2: The file [122272 122275] has the wrong mode
(?------r--), corrected to (-------r--)
pass0: block 15235892, item 4: The file [122289 122308] has the wrong mode
(?--------x), corrected to (---------x)
pass0: block 15235929, item 2: The file [122350 122352] has the wrong mode
(?---------), corrected to (----------)
pass0: block 15235929, item 4: The file [122350 122353] has the wrong mode
(?--xr-x---), corrected to (---xr-x---)
pass0: block 15236144, item 2: The file [122518 122526] has the wrong mode
(?---------), corrected to (----------)
...60%..pass0: block 23722410, item 2: The file [140873 140883] has the
wrong mode (?--xr-x--x), corrected to (---xr-x--
x)
pass0: vpf-10180: block 24147093: item 3: The item [121031 139105 0x1 DIR
(3)], which follows non StatData item [121031
137120 0x1 DIR (3)], is deleted
pass0: vpf-10180: block 24147093: item 3: The item [121031 139819 0x1 DIR
(3)], which follows non StatData item [121031
137120 0x1 DIR (3)], is deleted
.pass0: block 25361188, item 2: The file [140984 140998] has the wrong
mode (?--x-wx---), corrected to (---x-wx---)
.pass0: block 26017787, item 2: The directory [132309 132310] has the
wrong mode (?--xr-----), corrected to (d--xr-----)
verify_directory_item: block 26017787, item 132309 132310 0x1 DIR (3), len
608, location 2480 entry count 13, fsck need
0, format old: All entries were deleted from the directory
80%.pass0: block 29226969, item 2: The file [132814 132841] has the wrong
mode (?---rwx--x), corrected to (----rwx--x)
pass0: block 29227104, item 2: The file [132980 132988] has the wrong mode
(?---------), corrected to (----------)
.pass0: block 29620640, item 4: The file [133132 133140] has the wrong
mode (?---------), corrected to (----------)
pass0: block 30675473, item 3: The file [146137 146138] has the wrong mode
(?------r--), corrected to (-------r--)
pass0: block 30702310, item 4: The file [156681 156745] has the wrong mode
(?---------), corrected to (----------)
pass0: block 30702693, item 2: The file [157860 157967] has the wrong mode
(sr--r-x--x), corrected to (-r--r-x--x)
pass0: block 30702701, item 2: The file [157860 158002] has the wrong mode
(cr-xr--r--), corrected to (-r-xr--r--)
pass0: block 30703092, item 4: The file [159574 159589] has the wrong mode
(?---------), corrected to (----------)
pass0: block 30703092, item 8: The directory [159591 159592] has the wrong
mode (?---------), corrected to (d---------)
verify_directory_item: block 30703092, item 159591 159592 0x1 DIR (3), len
80, location 1168 entry count 3, fsck need 1,
 format old: All entries were deleted from the directory
pass0: vpf-10160: block 30703104: item 12: No "." entry found in the first
item of a directory
pass0: vpf-10430: block 30703104, item 28: Wrong order of items - change
the dir_id of the key [159742 159743 0x375fd280
 DIR (3)] to 159669
pass0: vpf-10560: block 30703104, item 28: Wrong order of items - change
the object_id of the key [159669 159743 0x375fd
280 DIR (3)] to 159677
pass0: vpf-10160: block 30703104: item 28: No "." entry found in the first
item of a directory
pass0: block 30703104, item 28: The directory [159669 159677] has the
wrong mode (-rw-r--r--), corrected to (drw-r--r--)
pass0: vpf-10480: block 30703218, item 6: Wrong order of items - change
the object_id of the key [160296 160297 0x1 DRCT
 (2)] to 160174
pass0: vpf-10500: block 30703218, item 6: Wrong order of items - change
the dir_id of the key [160296 160174 0x1 DRCT (2
)] to 160163
pass0: block 30703218, item 5: The file [160163 160174] has the wrong mode
(?---------), corrected to (----------)
pass0: block 30892146, item 12: The file [162754 162902] has the wrong
mode (?---------), corrected to (----------)
pass0: block 30893203, item 3: The file [163275 163472] has the wrong mode
(?---------), corrected to (----------)
pass0: block 30894449, item 6: The file [163735 163895] has the wrong mode
(?------r--), corrected to (-------r--)
pass0: vpf-10560: block 30894449, item 8: Wrong order of items - change
the object_id of the key [163735 163901 0x281 DR
CT (2)] to 163896
pass0: vpf-10170: block 30894449: item 8: Wrong order of items - the item
        163735 163896 0x281 DRCT (2), len 384, location 960 entry count
65535, fsck need 1, format new fixed to
        163735 163896 0x1 DRCT (2), len 384, location 960 entry count
65535, fsck need 1, format new
pass0: vpf-10560: block 30894659, item 6: Wrong order of items - change
the object_id of the key [164054 164159 0x829 DR
CT (2)] to 164119
pass0: vpf-10170: block 30894659: item 6: Wrong order of items - the item
        164054 164119 0x829 DRCT (2), len 656, location 1380 entry count
65535, fsck need 1, format new fixed to
        164054 164119 0x1 DRCT (2), len 656, location 1380 entry count
65535, fsck need 1, format new
pass0: block 30894673, item 12: The file [164054 164168] has the wrong
mode (?------r--), corrected to (-------r--)
pass0: block 30894715, item 6: The file [164054 164189] has the wrong mode
(?---------), corrected to (----------)
pass0: vpf-10180: block 30896227: item 1: The item [165581 165587 0x1 DRCT
(2)], which follows non StatData item [165579
 165581 0x33c44c80 DIR (3)], is deleted
.pass0: block 31190909, item 2: The file [190910 190970] has the wrong
mode (?------r--), corrected to (-------r--)
pass0: block 31190909, item 4: The file [190910 190971] has the wrong mode
(?------r--), corrected to (-------r--)
pass0: block 31192430, item 4: The file [193278 193321] has the wrong mode
(pr-x---r-x), corrected to (-r-x---r-x)
pass0: block 31192430, item 8: The file [193278 193323] has the wrong mode
(?---------), corrected to (----------)
pass0: block 31192430, item 10: The file [193278 193324] has the wrong
mode (?---------), corrected to (----------)
pass0: block 31192430, item 12: The file [193278 193325] has the wrong
mode (?---------), corrected to (----------)
pass0: block 31192925, item 4: The directory [194931 194932] has the wrong
mode (?---------), corrected to (d---------)
verify_directory_item: block 31192925, item 194931 194932 0x1 DIR (3), len
88, location 3400 entry count 3, fsck need 1,
 format old: All entries were deleted from the directory
pass0: block 31192925, item 5: The directory [194931 194934] has the wrong
mode (?---------), corrected to (d---------)
verify_directory_item: block 31192925, item 194931 194934 0x1 DIR (3), len
720, location 2724 entry count 19, fsck need
1, format old: All entries were deleted from the directory
pass0: block 31192925, item 6: The directory [194931 194952] has the wrong
mode (?---------), corrected to (d---------)
verify_directory_item: block 31192925, item 194931 194952 0x1 DIR (3), len
424, location 2976 entry count 10, fsck need
1, format old: All entries were deleted from the directory
pass0: block 31193549, item 2: The file [197501 197523] has the wrong mode
(?---------), corrected to (----------)
verify_directory_item: block 31204849, item 203061 203062 0x1 DIR (3), len
1664, location 1896 entry count 42, fsck need
 1, format old: All entries were deleted from the directory
pass0: block 31554878, item 2: The file [119185 250854] has the wrong mode
(?---------), corrected to (----------)
verify_directory_item: block 32054421, item 222996 223210 0x19750d80 DIR
(3), len 800, location 3296 entry count 25, fsc
k need 1, format old: Found a name "cvs-ru_9.html" for 18-th entry
matching to the hash 836645248.
pass0: block 32054421, item 222996 223210 0x19750d80 DIR (3), len 800,
location 3296 entry count 25, fsck need 1, format
 old: 18 entries were deleted
pass0: block 32054421, item 2: The directory [222996 223211] has the wrong
mode (?---------), corrected to (d---------)
pass0: block 32054421, item 222996 223211 0x1 DIR (3), len 3080, location
748 entry count 97, fsck need 1, format old: 4
5 entries were deleted
pass0: block 32055338, item 2: The file [223210 229656] has the wrong mode
(?---------), corrected to (----------)
pass0: block 32055338, item 4: The file [223210 229682] has the wrong mode
(?---------), corrected to (----------)
pass0: block 32055338, item 6: The file [223210 229683] has the wrong mode
(?---------), corrected to (----------)
pass0: block 32055338, item 8: The file [223210 229684] has the wrong mode
(?---------), corrected to (----------)
pass0: block 32055338, item 10: The file [223210 237871] has the wrong
mode (?---------), corrected to (----------)
pass0: block 32055338, item 12: The file [223210 237872] has the wrong
mode (?---------), corrected to (----------)
pass0: block 32055338, item 14: The file [223210 237873] has the wrong
mode (?---------), corrected to (----------)
pass0: block 32055338, item 16: The file [223210 237874] has the wrong
mode (?---------), corrected to (----------)
pass0: block 32055338, item 18: The file [223210 237875] has the wrong
mode (p----w-r--), corrected to (-----w-r--)
pass0: block 32055338, item 20: The file [223210 237876] has the wrong
mode (p----w-r--), corrected to (-----w-r--)
pass0: block 32055338, item 22: The file [223210 237877] has the wrong
mode (p----w-r--), corrected to (-----w-r--)
pass0: block 32055338, item 24: The file [223211 223511] has the wrong
mode (p-w---x-w-), corrected to (--w---x-w-)
pass0: block 32055338, item 26: The file [223211 229688] has the wrong
mode (p-w--wx-w-), corrected to (--w--wx-w-)
pass0: block 32055338, item 28: Not the directory [223211 229689] has the
wrong mode (dr-xr-xr-x), corrected to (-r-xr-x
r-x)
pass0: block 32055338, item 30: The file [223211 229690] has the wrong
mode (l-wx--x--x), corrected to (--wx--x--x)
pass0: block 32055338, item 32: The file [223211 229691] has the wrong
mode (p---r--r--), corrected to (----r--r--)
                        left 1704195, 333 /sec
The problem has occurred looks like a hardware problem.
If you have bad blocks, we advise you to get a new hard
drive, because once you get one bad block that the disk
drive internals cannot hide from your sight, the chances
of getting more are generally said to become much higher
(precise statistics are unknown to us), and this disk drive
is probably not expensive enough for you to risk your time
and data on it. If you don't want to follow that advice,
then if you have just a few bad blocks, try writing to the
bad blocks and see if the drive remaps the bad blocks (that
means it takes a block it has in reserve and allocates it
for use for requests of that block number).  If it cannot
remap the block, this could be quite bad, as it may mean
that so many blocks have gone bad that none remain in
reserve to allocate.

bread: Cannot read the block (32085176): (Input/output error).

Aborted (core dumped)


--------------END OUTPUT----------

Analysis of core:

#0  0x40050f81 in kill () from /lib/libc.so.6
(gdb) bt
#0  0x40050f81 in kill () from /lib/libc.so.6
#1  0x40050d15 in raise () from /lib/libc.so.6
#2  0x4005226b in abort () from /lib/libc.so.6
#3  0x08064b52 in die (fmt=0x0) at misc.c:53
#4  0x08063ba3 in bread (dev=0, block=135201920, size=0) at io.c:524
#5  0x0804f8a7 in do_pass_0 (fs=0x80f0480) at pass0.c:1555
#6  0x08050b7a in pass_0 (fs=0x8093368) at pass0.c:1973
#7  0x0804a738 in rebuild_tree (fs=0x8093368) at main.c:800
#8  0x0804b9b8 in main (argc=0, argv=0x0) at main.c:1309
#9  0x4003d7a6 in __libc_start_main () from /lib/libc.so.6


Now, I've used the smartmon tools (http://smartmontools.sourceforge.net/) to 
do repeated test and the drives both seem fine. They are both around 1 year 
old and have had only light use. Could this be an lvm problem? Any ideas 
where I should look next? 

Can you offer any help on which tool to use to try to write to an individual 
block, as suggested by the output above?

Thanks,
Alistair 

