From: Jean Jordaan <jean@upfrontsystems.co.za>
Subject: reiserfs corruption: --rebuild-tree bug report
Date: Tue, 20 Jan 2004 16:11:56 +0200
Message-ID: <400D372C.5010903@upfrontsystems.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi all

Prompted by this sentence in the manpage:

   If reiserfsck --check fails in
   some  way  you  should also run reiserfsck --rebuild-tree,
   but we also encourage you to submit this as a bug  report.

I'm sending you the output of my 'reiserfck --rebuild-tree'.
It saved my ass, so I'm not complaining! However, I have no
idea how the filesystem got into this state. If you want me
to check anything else about this drive, please let me know
what to do. I'll have to reformat it soon though.

/dev/md0 was part of a 3 disk RAID5 array, which one fine
day booted with an inode error. The array was 3 IDE drives,
mounted master, slave and master.

cdimage root # mdadm --create /dev/md0 --raid-devices=3 --level=5 
--spare-devices=0 --chunk=64 missing /dev/hdb3 /dev/hdc3
mdadm: /dev/hdb3 appears to be part of a raid array:
     level=5 devices=3 ctime=Tue Jan 20 10:35:45 2004
mdadm: /dev/hdc3 appears to be part of a raid array:
     level=5 devices=3 ctime=Tue Jan 20 10:09:43 2004
Continue creating array? y
mdadm: array /dev/md0 started.
cdimage root # mount -r -t reiserfs /dev/md0 /mnt/gentoo/raid/
mount: Not a directory
cdimage root # cat /proc/mdstat
Personalities : [raid5]
read_ahead 1024 sectors
md0 : active raid5 ide/host0/bus1/target0/lun0/part3[2] 
ide/host0/bus0/target1/lun0/part3[1]
       76003328 blocks level 5, 64k chunk, algorithm 2 [3/2] [_UU]


cdimage root # reiserfsck --check /dev/md0

<-------------reiserfsck, 2003------------->
reiserfsprogs 3.6.8

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

Will read-only check consistency of the filesystem on /dev/md0
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
###########
reiserfsck --check started at Tue Jan 20 12:19:38 2004
###########
Replaying journal..
0 transactions replayed
Checking internal tree../  1 (of   2)/  1 (of 126)/  1 (of 153)block 8211: The 
level of the node (25938) is not correct, (1) expected
  the problem in the internal node occured (8211), whole subtree is skipped
finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Bad nodes were found, Semantic pass skipped
1 found corruptions can be fixed only during --rebuild-tree
###########
reiserfsck finished at Tue Jan 20 12:20:11 2004
###########
cdimage root # mount -r -t reiserfs /dev/md0 /mnt/gentoo/raid/
mount: Not a directory
cdimage root # reiserfsck --rebuild-tree /dev/md0

<-------------reiserfsck, 2003------------->
reiserfsprogs 3.6.8

   *************************************************************
   ** Do not run rebuild-tree unless something is broken  and **
   ** MAKE A BACKUP before using it.  If you have bad sectors **
   ** on a drive  it is usually a bad idea  to continue using **
   ** it.  Then you probably should get a working hard drive, **
   ** copy the file system from the bad drive to the good one **
   ** -- dd_rescue is  a good tool for  that -- and only then **
   ** run this program.                                       **
   ** If you are using the latest reiserfsprogs and  it fails **
   ** please  email bug reports to reiserfs-list@namesys.com, **
   ** providing  as  much  information  as  possible --  your **
   ** hardware,  kernel,  patches,  settings,  all reiserfsck **
   ** messages  (including version),  the reiserfsck logfile, **
   ** check  the  syslog file  for  any  related information. **
   ** If you would like advice on using this program, support **
   ** is available  for $25 at  www.namesys.com/support.html. **
   *************************************************************

Will rebuild the filesystem (/dev/md0) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Tue Jan 20 12:44:02 2004
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 647544 blocks marked used
Skipping 8790 blocks (super block, journal, bitmaps) 638754 blocks will be read
0%....20%....40%....60%....80%....100%                       left 0, 22026 /sec
193779 directory entries were hashed with "r5" hash.
         "r5" hash is selected
Flushing..finished
         Read blocks (but not data blocks) 638754
                 Leaves among those 38854
                 Objectids found 8553

Pass 1 (will try to insert 38854 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                        left 0, 3532 /sec
Flushing..finished
         38854 leaves read
                 38778 inserted
                         - pointers in indirect items pointing to metadata 3 
(zeroed)
                 76 not inserted
####### Pass 2 #######

Pass 2:
0%....20%....40%....60%....80%....100%                           left 0, 0 /sec
Flushing..finished
         Leaves inserted item by item 76
Pass 3 (semantic):
####### Pass 3 #########
Flushing..finished
         Files found: 0
         Directories found: 2
Pass 3a (looking for lost dir/files):
####### Pass 3a (lost+found pass) #########
Looking for lost directories:
/2_4vpf-10680: The directory [2 4] has the wrong block count in the StatData (1) 
- corrected to (2)
vpf-10650: The directory [2 4] has the wrong size in the StatData (48) - 
corrected to (752)
/2_113get_next_directory_item: The entry ".." of the directory [2 113] pointes 
to [1 2], instead of [2 258218] - corrected
/2_5022get_next_directory_item: The entry ".." of the directory [2 5022] pointes 
to [1 2], instead of [2 258218] - corrected
/2_5212get_next_directory_item: The entry ".." of the directory [2 5212] pointes 
to [1 2], instead of [2 258218] - corrected
/2_5360get_next_directory_item: The entry ".." of the directory [2 5360] pointes 
to [1 2], instead of [2 258218] - corrected
/2_5365get_next_directory_item: The entry ".." of the directory [2 5365] pointes 
to [1 2], instead of [2 258218] - corrected
/2_5367get_next_directory_item: The entry ".." of the directory [2 5367] pointes 
to [1 2], instead of [2 258218] - corrected
/2_5369get_next_directory_item: The entry ".." of the directory [2 5369] pointes 
to [1 2], instead of [2 258218] - corrected
/2_5369/log/wtmpvpf-10680: The file [7261 7264] has the wrong block count in the 
StatData (1152) - corrected to (1128)
/2_7587get_next_directory_item: The entry ".." of the directory [2 7587] pointes 
to [1 2], instead of [2 258218] - corrected
/2_26686get_next_directory_item: The entry ".." of the directory [2 26686] 
pointes to [1 2], instead of [2 258218] - corrected
/2_26689get_next_directory_item: The entry ".." of the directory [2 26689] 
pointes to [1 2], instead of [2 258218] - corrected
/2_26784get_next_directory_item: The entry ".." of the directory [2 26784] 
pointes to [1 2], instead of [2 258218] - corrected
Looking for lost files:
The object [141767 141772] has wrong mode (b--xr--r-x) - corrected to -rw-------
vpf-10670: The file [141767 141772] has the wrong size in the StatData (0) - 
corrected to (1912)
vpf-10680: The file [141767 141772] has the wrong block count in the StatData 
(0) - corrected to (8)
The object [141778 141818] has wrong mode (?---------) - corrected to -rw-------
vpf-10670: The file [141778 141818] has the wrong size in the StatData (0) - 
corrected to (1640)
vpf-10680: The file [141778 141818] has the wrong block count in the StatData 
(0) - corrected to (8)
The object [141836 141840] has wrong mode (?---------) - corrected to -rw-------
Flushing..finished
         Objects without names 19557
         Empty lost dirs removed 166439
         Dirs linked to /lost+found: 12
                 Dirs without stat data found 1
         Files linked to /lost+found 1975
         Objects having used objectids: 4887
                 dirs fixed 2
Pass 4 - finished       done 0, 0 /sec
         Deleted unreachable items 6
Flushing..finished
Syncing..finished
###########
reiserfsck finished at Tue Jan 20 12:46:00 2004
###########
cdimage root # mount -r -t reiserfs /dev/md0 /mnt/gentoo/raid/
cdimage root # ls /mnt/gentoo/raid/
lost+found
cdimage root # ls /mnt/gentoo/raid/lost+found/

-- 
Jean Jordaan
http://www.upfrontsystems.co.za

