From: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>
Subject: Re: Partial data loss with reiserfs3
Date: Thu, 17 Feb 2005 11:22:27 +0200
Message-ID: <1108632147.42146253ce02b@webmail.vu.lt>
References: <200502161622.06930.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502161622.06930.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,

Cituojant Vitaly Fertman <vitaly@namesys.com>:
> so you can try to recover from the whole partition on the copy. Have
> 
> you made fs/partition backup before rebuild-tree (probably fdisk)? 
> If no, make a copy of the hda6 partition and run
> 	reiserfsck --rebuild-tree -S <hda6-copy> -l logfile
> if yes, copy it back to hda6 and run on hda6.

Thanks a lot, it did help! All of the important files are here and
readable and according to 'df' about as much disk space is taken as was
before data loss. Of course, directory tree is broken and file names
are lost, as recovered data is in lost+found.

Below is the output and recovery log.

The question is, what has caused such behaviour in the first place? I'm
still not done with NTFS shrinking - /home expansion, but I'm afraid to
continue without understanding what went wrong here. 

Is it important to update reiserfsprogs 3.6.18 -> 3.6.19 ?

[root@laurynas-pc ~]# dd if=/dev/hda6 | bzip2 -vv > ~/partition.hda6.bz2

[root@laurynas-pc ~]# reiserfsck --rebuild-tree -S /dev/hda6 -l
recovery-from-whole-partition.log
reiserfsck 3.6.18 (2003 www.namesys.com)

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

Will rebuild the filesystem (/dev/hda6) tree
Will put log info to 'recovery-from-whole-partition.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
Replaying journal..
Reiserfs journal '/dev/hda6' in blocks [18..8211]: 0 transactions
replayed
###########
reiserfsck --rebuild-tree started at Thu Feb 17 10:48:43 2005
###########

Pass 0:
The whole partition (1741036 blocks) is to be scanned
Skipping 8264 blocks (super block, journal, bitmaps) 1732772 blocks will
be read
0%....20%....40%....60%....80%....100%                        left 0,
2799 /sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 1732772
                Leaves among those 1126
                        - leaves all contents of which could not be
saved and deleted 5
                Objectids found 4330

Pass 1 (will try to insert 1121 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                         left 0,
224 /sec
Flushing..finished
        1121 leaves read
                886 inserted
                235 not inserted
        non-unique pointers in indirect items (zeroed) 3

Pass 2:
0%....20%....40%....60%....80%....100%                         left 0,
470 /sec
Flushing..finished
        Leaves inserted item by item 235
Pass 3 (semantic):
Flushing..finished
        Files found: 4
        Directories found: 5
        Symlinks found: 1
Pass 3a (looking for lost dir/files):
Looking for lost directories:
Looking for lost files:
Flushing..finishede 0, 0 /sec
        Objects without names 149
        Empty lost dirs removed 60
        Dirs linked to /lost+found: 64
                Dirs without stat data found 1
        Files linked to /lost+found 85
Pass 4 - finished       done 0, 0 /sec
        Deleted unreachable items 60
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Thu Feb 17 10:59:18 2005
###########
-------------
recovery-from-whole-partition.log:
-------------
[root@laurynas-pc ~]# cat recovery-from-whole-partition.log
####### Pass 0 #######
verify_direntry: block 8211, item 2 4336 0x0 SD (0), len 44, location
4052 entry count 65535, fsck need 0, format new: Key's offset [2 4336
0x0 SD (0)] must match the directory's hash (33204) - changed.
pass0: vpf-10180: block 32978: item 1: The item [2 12 0x1 IND (1)],
which follows non StatData item [2 6 0x1 DRCT (2)], is deleted
pass0: vpf-10180: block 32978: item 1: The item [2 112 0x1 IND (1)],
which follows non StatData item [2 6 0x1 DRCT (2)], isdeleted
block 236567: The free space (38917) is incorrect, should be (4072) -
corrected
block 266176: The free space (38917) is incorrect, should be (4072) -
corrected
block 548172: The free space (38917) is incorrect, should be (4072) -
corrected
block 578290: The free space (38917) is incorrect, should be (4072) -
corrected
block 1410673: The number of items (2560) is incorrect, should be (1) -
corrected
block 1410673: The free space (2) is incorrect, should be (2512) -
corrected
pass0: vpf-10110: block 1410673, item (0): Unknown item type found
[201331327 167772161 0x2 ??? (15)] - deleted
4273 directory entries were hashed with "r5" hash.
####### Pass 1 #######
vpf-10610: StatData item [2 4336 0x81b4 SD (0)] has non zero offset
found.
is_leaf_bad: block 8211, item 0: The corrupted item found (2 4336 0x81b4
SD (0), len 44, location 4052 entry count 65535, fsck need 0, format
new)
is_leaf_bad: WARNING: The leaf (8211) is formatted badly. Will be
handled on the the pass2.
####### Pass 2 #######
vpf-10610: StatData item [2 4336 0x81b4 SD (0)] has non zero offset
found.
####### Pass 3 #########
vpf-10680: The file [2 6] has the wrong block count in the StatData (0)
- corrected to (8)
vpf-10680: The directory [2 4335] has the wrong block count in the
StatData (8) - corrected to (1)
vpf-10650: The directory [2 4335] has the wrong size in the StatData
(3960) - corrected to (48)
####### Pass 3a (lost+found pass) #########
get_next_directory_item: The entry ".." of the directory [2 18] pointes
to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 32] pointes
to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 34] pointes
to [2 4], instead of [2 4335] - corrected
rebuild_semantic_pass: The entry [2 12] ("IconPositionsBRYR1a.new") in
directory [2 105] points to nowhere - is removed
vpf-10650: The directory [2 105] has the wrong size in the StatData
(160) - corrected to (120)
vpf-10680: The file [2 112] has the wrong block count in the StatData
(672) - corrected to (0)
get_next_directory_item: The entry ".." of the directory [2 296] pointes
to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 308] pointes
to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 323] pointes
to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 638] pointes
to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 656] pointes
to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 804] pointes
to [2 4], instead of [2 4335] - corrected
vpf-10680: The file [2 818] has the wrong block count in the StatData
(16) - corrected to (8)
get_next_directory_item: The entry ".." of the directory [2 1018]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 1023]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 1029]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 1033]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 1429]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2 1434]
pointes to [2 4], instead of [2 4335] - corrected
vpf-10680: The file [1438 1682] has the wrong block count in the
StatData (16) - corrected to (8)
rebuild_semantic_pass: The entry [1438 1686] ("Cache.Trash") in
directory [2 1438] points to nowhere - is removed
get_next_directory_item: The entry ".." of the directory [1438 1689]
pointes to [2 4335], instead of [2 1438] - corrected
vpf-10650: The directory [2 1438] has the wrong size in the StatData
(992) - corrected to (960)
get_next_directory_item: The entry ".." of the directory [4 1741]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1743]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1747]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1769]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1772]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1795]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1815]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1818]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1824]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1828]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1836]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1841]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1845]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1940]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 1945]
pointes to [2 4], instead of [2 4335] - corrected
rebuild_semantic_pass: The entry [2041 2053] ("Templates.sbd") in
directory [4 2041] points to nowhere - is removed
rebuild_semantic_pass: The entry [2041 2055] ("Sent.sbd") in directory
[4 2041] points to nowhere - is removed
rebuild_semantic_pass: The entry [2041 2059] ("Drafts.sbd") in directory
[4 2041] points to nowhere - is removed
rebuild_semantic_pass: The entry [2041 2061] ("Trash.sbd") in directory
[4 2041] points to nowhere - is removed
vpf-10650: The directory [4 2041] has the wrong size in the StatData
(672) - corrected to (552)
get_next_directory_item: The entry ".." of the directory [1953 2063]
pointes to [2 4335], instead of [4 1953] - corrected
vpf-10680: The file [2069 2137] has the wrong block count in the
StatData (2320) - corrected to (42816)
vpf-10680: The file [2063 2215] has the wrong block count in the
StatData (7120) - corrected to (215672)
get_next_directory_item: The entry ".." of the directory [1953 2231]
pointes to [2 4335], instead of [4 1953] - corrected
vpf-10680: The file [1949 2316] has the wrong block count in the
StatData (3712) - corrected to (72)
get_next_directory_item: The entry ".." of the directory [1949 2319]
pointes to [2 4335], instead of [4 1949] - corrected
get_next_directory_item: The entry ".." of the directory [1949 2333]
pointes to [2 4335], instead of [4 1949] - corrected
get_next_directory_item: The entry ".." of the directory [1949 2363]
pointes to [2 4335], instead of [4 1949] - corrected
get_next_directory_item: The entry ".." of the directory [4 2371]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 3647]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 3655]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 3723]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 3725]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 3728]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3728 3729]
pointes to [2 4335], instead of [4 3728] - corrected
get_next_directory_item: The entry ".." of the directory [4 3767]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 3777]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3777 3778]
pointes to [2 4335], instead of [4 3777] - corrected
rebuild_semantic_pass: The entry [3777 3806] ("mime-info") in directory
[4 3777] points to nowhere - is removed
get_next_directory_item: The entry ".." of the directory [3777 3807]
pointes to [2 4335], instead of [4 3777] - corrected
vpf-10650: The directory [4 3777] has the wrong size in the StatData
(152) - corrected to (120)
get_next_directory_item: The entry ".." of the directory [4 3811]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3811 3812]
pointes to [2 4335], instead of [4 3811] - corrected
get_next_directory_item: The entry ".." of the directory [4 3885]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 3894]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3894 3895]
pointes to [2 4335], instead of [4 3894] - corrected
get_next_directory_item: The entry ".." of the directory [3894 3984]
pointes to [2 4335], instead of [4 3894] - corrected
rebuild_semantic_pass: The entry [3999 4000] ("addin") in directory
[3894 3999] points to nowhere - is removed
vpf-10650: The directory [3894 3999] has the wrong size in the StatData
(72) - corrected to (48)
get_next_directory_item: The entry ".." of the directory [4 4004]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 4006]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 4230]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 4243]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4 4245]
pointes to [2 4], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [4246 4247]
pointes to [2 4335], instead of [4245 4246] - corrected
vpf-10680: The directory [4246 4255] has the wrong block count in the
StatData (1) - corrected to (2)
vpf-10650: The directory [4246 4255] has the wrong size in the StatData
(48) - corrected to (560)
get_next_directory_item: The entry ".." of the directory [4307 4308]
pointes to [2 4335], instead of [4245 4307] - corrected
get_next_directory_item: The entry ".." of the directory [4307 4313]
pointes to [2 4335], instead of [4245 4307] - corrected
get_next_directory_item: The entry ".." of the directory [4307 4318]
pointes to [2 4335], instead of [4245 4307] - corrected
get_next_directory_item: The entry ".." of the directory [4307 4321]
pointes to [2 4335], instead of [4245 4307] - corrected
rebuild_semantic_pass: The entry [4307 4323] ("wcprops") in directory
[4245 4307] points to nowhere - is removed
vpf-10650: The directory [4245 4307] has the wrong size in the StatData
(296) - corrected to (272)
get_next_directory_item: The entry ".." of the directory [4 4328]
pointes to [2 4], instead of [2 4335] - corrected
vpf-10680: The file [4328 4329] has the wrong block count in the
StatData (2544) - corrected to (13208)
get_next_directory_item: The entry ".." of the directory [1438 1691]
pointes to [1438 1689], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2069 2149]
pointes to [2069 2101], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2069 2170]
pointes to [2069 2092], instead of [2 4335] - corrected
vpf-10680: The file [2170 2179] has the wrong block count in the
StatData (6568) - corrected to (2920)
rebuild_semantic_pass: The entry [2170 2181] ("CVS.sbd") in directory
[2170 2178] points to nowhere - is removed
rebuild_semantic_pass: The entry [2170 2185] ("Users.sbd") in directory
[2170 2178] points to nowhere - is removed
rebuild_semantic_pass: The entry [2170 2187] ("Workers.sbd") in
directory [2170 2178] points to nowhere - is removed
vpf-10650: The directory [2170 2178] has the wrong size in the StatData
(296) - corrected to (208)
get_next_directory_item: The entry ".." of the directory [2170 2189]
pointes to [2 4335], instead of [2069 2170] - corrected
rebuild_semantic_pass: The entry [2170 2198] ("SourceForge.sbd") in
directory [2069 2170] points to nowhere - is removed
get_next_directory_item: The entry ".." of the directory [2170 2201]
pointes to [2 4335], instead of [2069 2170] - corrected
rebuild_semantic_pass: The entry [2170 2207] ("GPC Announcements.sbd")
in directory [2069 2170] points to nowhere - is removed
rebuild_semantic_pass: The entry [2170 2209] ("Mozilla Bugzilla.sbd") in
directory [2069 2170] points to nowhere - is removed
vpf-10650: The directory [2069 2170] has the wrong size in the StatData
(736) - corrected to (624)
get_next_directory_item: The entry ".." of the directory [2231 2237]
pointes to [1953 2231], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2231 2263]
pointes to [1953 2231], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2231 2278]
pointes to [1953 2231], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2231 2294]
pointes to [1953 2231], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [2231 2305]
pointes to [1953 2231], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3811 3828]
pointes to [3811 3812], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3895 3897]
pointes to [3894 3895], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3895 3900]
pointes to [3894 3895], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3895 3909]
pointes to [3894 3895], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3895 3914]
pointes to [3894 3895], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3895 3919]
pointes to [3894 3895], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3895 3939]
pointes to [3894 3895], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3895 3942]
pointes to [3894 3895], instead of [2 4335] - corrected
get_next_directory_item: The entry ".." of the directory [3942 3943]
pointes to [2 4335], instead of [3895 3942] - corrected
get_next_directory_item: The entry ".." of the directory [3942 3954]
pointes to [2 4335], instead of [3895 3942] - corrected
get_next_directory_item: The entry ".." of the directory [3895 3978]
pointes to [3894 3895], instead of [2 4335] - corrected
rebuild_semantic_pass: The entry [3978 3980] ("fontmetric") in directory
[3895 3978] points to nowhere - is removed
rebuild_semantic_pass: The entry [3978 3981] ("driver") in directory
[3895 3978] points to nowhere - is removed
vpf-10650: The directory [3895 3978] has the wrong size in the StatData
(136) - corrected to (80)
vpf-10680: The file [2069 2071] has the wrong block count in the
StatData (1448) - corrected to (1296)

--
Thanks,
Laurynas

