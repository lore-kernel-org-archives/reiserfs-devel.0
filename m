From: "Grahame M. Kelly" <grahame@wildpossum.com>
Subject: Bug report
Date: Sat, 21 Feb 2004 13:48:42 +1100
Message-ID: <200402211348.42786.grahame@wildpossum.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_KcsNA1RelJhueSO"
Return-path: <reiserfs-list-return-16873-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_KcsNA1RelJhueSO
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi. I hope all these details are OK.

I only have a problem with /dev/hdb1 - I get the following message with 
terminates the --rebuild-tree or --fix-fixable directives:

Replaying journal..
0 transactions replayed
Checking internal tree..
Bad root block 0. (--rebuild-tree did not complete)
Aborted


If I run --rebuild-sb I get:

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
rebuild-sb: wrong tree height occured (65535), zeroed

rebuild-sb: You either have a corrupted journal or have just changed
the start of the partition with some partition table editor. If you are
sure that the start of the partition is ok, rebuild the journal header.
Do you want to rebuild the journal header? (y/n)[n]: y
Reiserfs super block in block 16 on 0x341 of format 3.5 with standard journal
Count of blocks on the device: 2560351
Number of bitmaps: 79
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] 
blocks): 2560351
Root block: 0
Filesystem is clean
Tree height: 0
Hash function used to sort names: "r5"
Objectid map size 4, max 1004
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0xfa03:
        FATAL corruptions exist.
         some corruptions exist.
sb_version: 0
Is this ok ? (y/n)[n]: y
The fs may still be unconsistent. Run reiserfsck --check.


Cheers, Grahame

---- Details ----

Linux glider 2.4.21-166-athlon #1 Wed Jan 7 03:05:30 UTC 2004 i686 athlon i386 
GNU/Linux (SuSE 9.0 Pro Distribution).

top - 13:38:30 up 1 day,  2:55, 11 users,  load average: 0.19, 0.59, 0.61
Tasks: 137 total,   3 running, 132 sleeping,   0 stopped,   2 zombie
Cpu(s):   6.2% user,   2.8% system,   0.0% nice,  91.1% idle
Mem:   1032852k total,   312016k used,   720836k free,    47240k buffers
Swap:  1036152k total,    60648k used,   975504k free,    67296k cached

Disk /dev/hdb: 41.1 GB, 41174138880 bytes
255 heads, 63 sectors/track, 5005 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Device Boot    Start       End    Blocks   Id  System
/dev/hdb1             1      1275  10241406   83  Linux
/dev/hdb2          1276      2550  10241437+  83  Linux
/dev/hdb3          2551      3825  10241437+  83  Linux
/dev/hdb4          3826      5005   9478350   83  Linux

glider:/ # rpm -qa|grep reiser
reiserfs-3.6.9-33

glider:/proc/ide # cat drivers
ide-cdrom version 4.59-ac1
ide-floppy version 0.99.newide
ide-disk version 1.17
ide-default version 0.9.newide

glider:/proc/ide # cat amd74xx
----------AMD BusMastering IDE Configuration----------------
Driver Version:                     2.11
South Bridge:                       PCI device 10de:0065 (nVidia Corporation)
Revision:                           IDE 0xa2
Highest DMA rate:                   UDMA100
BM-DMA base:                        0xf000
PCI clock:                          33.3MHz
-----------------------Primary IDE-------Secondary IDE------
Prefetch Buffer:              yes                 yes
Post Write Buffer:            yes                 yes
Enabled:                      yes                 yes
Simplex only:                  no                  no
Cable Type:                   80w                 80w
-------------------drive0----drive1----drive2----drive3-----
Transfer Mode:       UDMA      UDMA       PIO       PIO
Address Setup:       30ns      30ns      30ns      30ns
Cmd Active:          90ns      90ns      90ns      90ns
Cmd Recovery:        30ns      30ns      30ns      30ns
Data Active:         90ns      90ns      90ns      90ns
Data Recovery:       30ns      30ns      30ns      30ns
Cycle Time:          20ns      20ns     120ns     120ns
Transfer Rate:   99.9MB/s  99.9MB/s  16.6MB/s  16.6MB/s

glider:/proc/ide # lsmod | grep ide
ide-cd                 32416   0  (autoclean)
videodev                6272   8  (autoclean) [bttv]
cdrom                  29216   0  (autoclean) [ide-cd sr_mod]

--Boundary-00=_KcsNA1RelJhueSO
Content-Type: text/x-log;
  charset="us-ascii";
  name="rebuild2.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="rebuild2.log"

Will rebuild the filesystem (/dev/hdb1) tree
Will put log info to '/tmp/rebuild2.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Sat Feb 21 13:29:53 2004
###########

Pass 0:
Loading on-disk bitmap .. ok, 2560351 blocks marked used
Skipping 8289 blocks (super block, journal, bitmaps) 2552062 blocks will be read
0%....20%....40%....60%....80%....100%                        left 0, 9558 /sec
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 2552062
                Leaves among those 8562
                Objectids found 25649

Pass 1 (will try to insert 8562 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....Not enough allocable blocks, checking bitmap...there are 1 allocable blocks, btw

out of disk space
Aborted




####### Pass 0 #######
25647 directory entries were hashed with "r5" hash.
####### Pass 1 #######

--Boundary-00=_KcsNA1RelJhueSO
Content-Type: text/plain;
  charset="us-ascii";
  name="smart.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="smart.txt"

smartctl version 5.1-18 Copyright (C) 2002-3 Bruce Allen
Home page is http://smartmontools.sourceforge.net/

=== START OF READ SMART DATA SECTION ===
SMART Attributes Data Structure revision number: 16
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000b   100   100   060    Pre-fail  Always       -       0
  2 Throughput_Performance  0x0005   138   138   050    Pre-fail  Offline      -       314
  3 Spin_Up_Time            0x0007   115   115   024    Pre-fail  Always       -       187 (Average 194)
  4 Start_Stop_Count        0x0012   100   100   000    Old_age   Always       -       468
  5 Reallocated_Sector_Ct   0x0033   100   100   005    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x000b   100   100   067    Pre-fail  Always       -       0
  8 Seek_Time_Performance   0x0005   136   136   020    Pre-fail  Offline      -       31
  9 Power_On_Hours          0x0012   099   099   000    Old_age   Always       -       12128
 10 Spin_Retry_Count        0x0013   100   100   060    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   100   100   000    Old_age   Always       -       466
192 Power-Off_Retract_Count 0x0032   100   100   050    Old_age   Always       -       468
193 Load_Cycle_Count        0x0012   100   100   050    Old_age   Always       -       468
194 Temperature_Celsius     0x0002   127   127   000    Old_age   Always       -       43 (Lifetime Min/Max 11/51)
196 Reallocated_Event_Count 0x0032   100   100   000    Old_age   Always       -       0
197 Current_Pending_Sector  0x0022   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0008   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x000a   200   200   000    Old_age   Always       -       1


--Boundary-00=_KcsNA1RelJhueSO--

