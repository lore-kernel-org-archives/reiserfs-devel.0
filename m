From: Christian Placzek <kris@cp-data.de>
Subject: Re: reiserfs3 rebuild-tree successful but no files
Date: Fri, 11 Feb 2005 08:02:34 +0100
Message-ID: <200502110802.34489.kris@cp-data.de>
References: <200502082321.07706.kris@cp-data.de> <200502101350.53886.kris@cp-data.de> <1108047170.3900.43.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1108047170.3900.43.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Thursday 10 February 2005 15:52, you wrote:
> Hello
>
> On Thu, 2005-02-10 at 15:50, Christian Placzek wrote:
> > No, I wasn't. It seems mount doesn't recognize the true file system,
> > although the magic exists.
> >
> > <snip>
> > 00010000 30 76 0D 01  00 00 00 00  00 00 00 00  12 00 00 00
> > 0v.............. 00 00 00 00  00 20 00 00  00 04 00 00  00 00 00 00 .....
> > .......... 00010020 84 03 00 00  1E 00 00 00  00 00 00 00  00 10 CC 03
> > ................ 00 00 02 00  52 65 49 73  45 72 32 46  73 00 01 00
> > ....ReIsEr2Fs... 00010040 00 00 00 00  00 00 1B 02  02 00 00 00  00 00 00
> > 00 ................ 00 00 00 00  CF DC 6B 1C  3E 77 48 3C  A7 4E 6E 84
> > ......k.>wH<.Nn. 00010060 6E 8E E3 EE  00 00 00 00  00 00 00 00  00 00 00
> > 00 n............... 00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00
> > ................ <snip>
> >
> >
> > Maybe the following output is the key. I did this with a fresh copy. Note
> > the number before the '$' sign in the command prompt. It's the error
> > status of the previous command.
>
> Sorry, I am confused.
> You had to do:
> dd if=/dev/shreded of=/dev/spare
> reiserfsck --rebuild-sb /dev/spare
> reiserfsck --rebuild-tree -S /dev/spare
> mount /dev/spare /mnt
Okay, done. No output of 'mount' in 'dmesg'.
>
> Would you try that and let us know the result?
Here it is, but not in full length (28000 lines):

root@marvin:/home/kris 0$ # reiserfsck --rebuild-sb /dev/sdc5
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will check superblock and rebuild it if needed
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes

reiserfs_open: the reiserfs superblock cannot be found on /dev/sdc5.

what the version of ReiserFS do you use[1-4]
        (1)   3.6.x
        (2) >=3.5.9 (introduced in the middle of 1999) (if you use linux 2.2, 
choose this one)
        (3) < 3.5.9 converted to new format (don't choose if unsure)
        (4) < 3.5.9 (this is very old format, don't choose if unsure)
        (X)   exit
1

Enter block size [4096]:


No journal device was specified. (If journal is not available, re-run with 
--no-journal-available option specified).
Is journal default? (y/n)[y]:

Did you use resizer(y/n)[n]:
rebuild-sb: no uuid found, a new uuid was generated 
(bff1c11a-ba70-4f9e-851d-a81d10b388b9)

rebuild-sb: You either have a corrupted journal or have just changed
the start of the partition with some partition table editor. If you are
sure that the start of the partition is ok, rebuild the journal header.
Do you want to rebuild the journal header? (y/n)[n]: y
Reiserfs super block in block 16 on 0x825 of format 3.6 with standard journal
Count of blocks on the device: 27453056
Number of bitmaps: 838
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 0
Root block: 0
Filesystem is NOT clean
Tree height: 0
Hash function used to sort names: not set
Objectid map size 0, max 972
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x1:
         some corruptions exist.
sb_version: 2
inode generation number: 0
UUID: bff1c11a-ba70-4f9e-851d-a81d10b388b9
LABEL:
Set flags in SB:
Is this ok ? (y/n)[n]: y
The fs may still be unconsistent. Run reiserfsck --check.

root@marvin:/home/kris 1$ # reiserfsck --rebuild-tree -S /dev/sdc5
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

Will rebuild the filesystem (/dev/sdc5) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/sdc5' in blocks [18..8211]: 0 transactions replayed
Zero bit found in on-disk bitmap after the last valid bit. Fixed.
###########
reiserfsck --rebuild-tree started at Thu Feb 10 22:19:12 2005
###########

Pass 0:
####### Pass 0 #######
The whole partition (27453056 blocks) is to be scanned
Skipping 9048 blocks (super block, journal, bitmaps) 27444008 blocks will be 
read
0%block 945510: The number of items (12) is incorrect, should be (1) - 
corrected
block 945510: The free space (1) is incorrect, should be (976) - corrected
pass0: vpf-10110: block 945510, item (0): Unknown item type found [436207872 
50333952 0x1000172d2000000 ??? (13)] - deleted
...block 3519623: The number of items (64768) is incorrect, should be (1) - 
corrected
block 3519623: The free space (2560) is incorrect, should be (208) - corrected
pass0: vpf-10110: block 3519623, item (0): Unknown item type found [16781056 
255904190 0xc7fb8100 ??? (15)] - deleted
block 3904473: The number of items (64768) is incorrect, should be (1) - 
corrected
block 3904473: The free space (2560) is incorrect, should be (208) - corrected
pass0: vpf-10110: block 3904473, item (0): Unknown item type found [16781056 
255901224 0xbd590100 ??? (15)] - deleted
block 3908406: The number of items (64768) is incorrect, should be (1) - 
corrected
block 3908406: The free space (2560) is incorrect, should be (208) - corrected
pass0: vpf-10110: block 3908406, item (0): Unknown item type found [16781056 
255901416 0xbe770100 ??? (15)] - deleted
.20%block 5654267: The number of items (6144) is incorrect, should be (1) - 
corrected
block 5654267: The free space (65280) is incorrect, should be (208) - 
corrected
pass0: vpf-10110: block 5654267, item (0): Unknown item type found [65280 0 
0x1000902040dd401 ??? (14)] - deleted
.block 7061833: The number of items (8) is incorrect, should be (1) - 
corrected
block 7061833: The free space (519) is incorrect, should be (1744) - corrected
pass0: vpf-10110: block 7061833, item (0): Unknown item type found [179306496 
4294903918 0x50008 ??? (15)] - deleted
.block 8763031: The free space (1) is incorrect, should be (3792) - corrected
pass0: vpf-10110: block 8763031, item (0): Unknown item type found [65537 
65541 0x1000385 ??? (15)] - deleted
..block 10833304: The number of items (6144) is incorrect, should be (1) - 
corrected
block 10833304: The free space (65280) is incorrect, should be (208) - 
corrected
pass0: vpf-10110: block 10833304, item (0): Unknown item type found [65280 0 
0x1000902040dd401 ??? (14)] - deleted
40%block 11827048: The number of items (64768) is incorrect, should be (1) - 
corrected
block 11827048: The free space (2560) is incorrect, should be (208) - 
corrected
pass0: vpf-10110: block 11827048, item (0): Unknown item type found 
[2533363456 2675698929 0x3000e02033feaad ??? (4)] - deleted
block 11827165: The number of items (64768) is incorrect, should be (1) - 
corrected
block 11827165: The free space (2560) is incorrect, should be (208) - 
corrected
pass0: vpf-10110: block 11827165, item (0): Unknown item type found 
[2248150784 3026506910 0x7000e02033fed78 ??? (12)] - deleted
..block 14201002: The number of items (21) is incorrect, should be (1) - 
corrected
block 14201002: The free space (3) is incorrect, should be (208) - corrected
pass0: vpf-10110: block 14201002, item (0): Unknown item type found [587661575 
118031107 0x7270001 ??? (15)] - deleted
..60%block 17556778: The number of items (52686) is incorrect, should be (1) - 
corrected
block 17556778: The free space (1) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 17556778, item (0): Unknown item type found [655372 
3452371000 0xcdcf0001 ??? (15)] - deleted
....80%....100%                        left 0, 6293 /sec
656016 directory entries were hashed with "r5" hash.
Selected hash ("r5") does not match to the hash set in the super block (not 
set).
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 27444008
                Leaves among those 131577
                        - leaves all contents of which could not be saved and 
deleted 22
                Objectids found 572033

Pass 1 (will try to insert 131555 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                         left 0, 
265 /sec
Flushing..finished
        131555 leaves read
                127311 inserted
                        - pointers in indirect items pointing to metadata 2064 
(zeroed)
                4244 not inserted
        non-unique pointers in indirect items (zeroed) 436534
####### Pass 2 #######

Pass 2:
0%rewrite_file: 2 items of file [564389 598696] moved to [564389 3086], 
40 /sec
...rewrite_file: 2 items of file [996458 996461] moved to [996458 3089]7 /sec
rewrite_file: 2 items of file [996482 996485] moved to [996482 3092]
.rewrite_file: 2 items of file [998913 998916] moved to [998913 3101] /sec
20%....40%..vpf-10260: The file we are inserting the new item (93570 691287 
0x1 DRCT (2), len 208, location 3888 entry count 65535, fsck need 0, format 
new) into has no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (94064 269765 0x1 DRCT (2), 
len 408, location 3688 entry count 65535, fsck need 0, format new) into has 
no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (105546 881824 0xb4001 IND 
(1), len 680, location 3416 entry count 0, fsck need 0, format new) into has 
no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (93946 740012 0x11 DRCT (2), 
len 768, location 3328 entry count 65535, fsck need 0, format new) into has 
no StatData, insertion was skipped
.vpf-10260: The file we are inserting the new item (95418 950003 0x1 DRCT (2), 
len 272, location 3824 entry count 65535, fsck need 0, format new) into has 
no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (94104 656463 0xa1 DRCT (2), 
len 520, location 3576 entry count 65535, fsck need 0, format new) into has 
no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (95302 609146 0x1 DRCT (2), 
len 744, location 3352 entry count 65535, fsck need 0, format new) into has 
no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (94104 709993 0x1e9 DRCT 
(2), len 296, location 3800 entry count 65535, fsck need 0, format new) into 
has no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (93912 919878 0x131 DRCT 
(2), len 176, location 3920 entry count 65535, fsck need 0, format new) into 
has no StatData, insertion was skipped
vpf-10260: The file we are inserting the new item (94163 662251 0x211 DRCT 
(2), len 104, location 3992 entry count 65535, fsck need 0, format new) into 
has no StatData, insertion was skipped
.vpf-10260: The file we are inserting the new item (282820 112803 0x27f001 IND 
(1), len 4048, location 48 entry count 0, fsck need 0, format new) into has 
no StatData, insertion was skipped
...
...
... (here follow thousends of lines, which I removed)
...
...
rewrite_file: 2 items of file [1022678 1042260] moved to [1022678 241698]
rewrite_file: 2 items of file [1022712 1026510] moved to [1022712 241699]
rewrite_file: 2 items of file [1026066 1042203] moved to [1026066 241700]
rewrite_file: 2 items of file [1031541 999149] moved to [1031541 241709]
rewrite_file: 2 items of file [1031544 1031454] moved to [1031544 241713]
rewrite_file: 2 items of file [1033597 711929] moved to [1033597 241714]
vpf-10680: The file [1039539 1039546] has the wrong block count in the 
StatData (10576) - corrected to (9272)
rewrite_file: 2 items of file [1040370 1027097] moved to [1040370 241716]
rewrite_file: 2 items of file [1040371 1027102] moved to [1040371 241719]
rewrite_file: 2 items of file [1041147 1022968] moved to [1041147 241720]
rewrite_file: 2 items of file [1041147 1022969] moved to [1041147 241721]
Flushing..finished99, 80 /sec
        Objects without names 13893
        Empty lost dirs removed 96
        Dirs linked to /lost+found: 1410
                Dirs without stat data found 51
        Files linked to /lost+found 12483
        Objects having used objectids: 2327
                files fixed 2248
                dirs fixed 79
Pass 4 - finished done 129646, 61 /sec
        Deleted unreachable items 1587
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Fri Feb 11 00:15:28 2005
###########
root@marvin:/home/kris 1$ # mount /dev/sdc5 /mnt/temp1
root@marvin:/home/kris 0$ # ls -la /mnt/temp1
total 21
drwxr-xr-x   3 root root  4096 Jan 20 11:36 .
drwxr-xr-x  39 root root   968 Feb  6 14:12 ..
drwx------   2 root root 16384 Jan 20 11:36 lost+found
root@marvin:/home/kris 0$ # ls -la /mnt/temp1/lost+found/
total 20
drwx------  2 root root 16384 Jan 20 11:36 .
drwxr-xr-x  3 root root  4096 Jan 20 11:36 ..
root@marvin:/home/kris 0$ #

