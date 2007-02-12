From: Marius Larssen <list-reiserfs@mariuslarssen.com>
Subject: reiserfsck --rebuild-tree aborting.
Date: Mon, 12 Feb 2007 22:34:53 +0100
Message-ID: <45D0DD7D.1070904@mariuslarssen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30567-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I have 7 disks in LVM2. All disks are free from badblocks. All disks are on promise ide controller.

00:0a.0 RAID bus controller: Promise Technology, Inc. PDC20267 (FastTrak100/Ultra100) (rev 02)
00:0c.0 RAID bus controller: Promise Technology, Inc. PDC20270 (FastTrak100 LP/TX2/TX4) (rev 02)

I use slackware 11.0. / is /dev/md0 which is two scsi disks in raid0.

00:08.0 SCSI storage controller: Adaptec AIC-7892A U160/m (rev 02)
00:09.0 SCSI storage controller: Adaptec AIC-7892A U160/m (rev 02)

Kernel: Linux nero 2.6.20 #1 SMP Tue Feb 6 16:43:14 CET 2007 i686 athlon i386 GNU/Linux


######################################################## This is a --rebuild-tree with reiserfsck version 3.6.19
Will rebuild the filesystem (/dev/dm/raid) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/dm/raid' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Thu Feb  8 19:27:23 2007
###########

Pass 0:
####### Pass 0 #######
The whole partition (274345984 blocks) is to be scanned
Skipping 16583 blocks (super block, journal, bitmaps) 274329401 blocks will be read
0%...block 147111690: The number of items (58373) is incorrect, should be (1) - corrected
block 147111690: The free space (28610) is incorrect, should be (3040) - corrected
pass0: vpf-10110: block 147111690, item (0): Unknown item type found [130595294 40370245 0x700026c ??? (15)] - deleted
                                                          left 0, 10816 /secc
126322 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 274329401
                Leaves among those 247020
                        - leaves all contents of which could not be saved and deleted 5
                Objectids found 100818

Pass 1 (will try to insert 247015 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%...                                       left 114198, 108 /sec
The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

mark_block_used: (99507313) used already
Aborted





######################################################## The following log is from reiserfsck (--rebuild-tree) version 3.6.20
################################## CMD: ./fsck.reiserfs  --rebuild-tree --scan-whole-partition -l /root/dm2.log -z /dev/dm/raid

####### Pass 0 #######
pass0: block 18020201: no correct item is found. Leave block untouched.
pass0: block 47242999: no correct item is found. Leave block untouched.
pass0: block 60497953: no correct item is found. Leave block untouched.
block 147111690: The number of items (58373) is incorrect, should be (1) - corrected
block 147111690: The free space (28610) is incorrect, should be (3040) - corrected
pass0: vpf-10110: block 147111690, item (0): Unknown item type found [130595294 40370245 0x700026c ??? (15)] - deleted
pass0: block 147111690: no correct item is found. Leave block untouched.
pass0: block 150706431: no correct item is found. Leave block untouched.
126322 directory entries were hashed with "r5" hash.
####### Pass 1 #######









######## STDOUT

Will rebuild the filesystem on (/dev/dm/raid)
        Will set file sizes in their metadata to real file sizes actually found by fsck.
Will put log info to '/root/dm2.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/dm/raid' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Mon Feb 12 14:20:20 2007
###########
Pass 0:
The whole partition (274345984 blocks) is to be scanned
Skipping 16583 blocks (super block, journal, bitmaps) 274329401 blocks will be read
0%...                                                          left 0, 10831 /secc
Flushing..finished
        Selected hash: "r5"
        Read formatted blocks: 274329401
        Read leaves (corrected/empty/wrong hash): 247020 (0/5/0)
        Objectids found: 100818
Pass 1 (will try to insert 247015 leaves):
Looking for allocable blocks .. finished
0%....20%....40%...                                       left 109944, 107 /sec
The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

mark_block_used: (109510886) used already
Aborted




############################################################## PVSCAN
root@nero:~# pvscan 
  PV /dev/hde1   VG dm   lvm2 [298.09 GB / 0    free]
  PV /dev/hdf1   VG dm   lvm2 [186.30 GB / 0    free]
  PV /dev/hdg1   VG dm   lvm2 [111.79 GB / 0    free]
  PV /dev/hdh1   VG dm   lvm2 [111.79 GB / 0    free]
  PV /dev/hdi1   VG dm   lvm2 [111.76 GB / 0    free]
  PV /dev/hdj1   VG dm   lvm2 [111.79 GB / 0    free]
  PV /dev/hdk1   VG dm   lvm2 [115.04 GB / 0    free]
  Total: 7 [1.02 TB] / in use: 7 [1.02 TB] / in no VG: 0 [0   ]




If any documentation is missing, please let me know and I will provide whatever is missing.



Regards, 


Marius Larssen

