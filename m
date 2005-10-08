From: Harry Edmon <harry@atmos.washington.edu>
Subject: reiserfsck --rebuild-tree fails with "out of space"
Date: Fri, 07 Oct 2005 17:21:37 -0700
Message-ID: <43471111.1090106@atmos.washington.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020604000309040306050202"
Return-path: <reiserfs-list-return-26426-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------020604000309040306050202
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

A disk I am trying to fix fails a "reiserfsck --rebuild-tree" with the 
message "out of space".  I have enclosed the log, and the output to the 
terminal.  The system is running Debian "sarge" with all released 
patches.  Kernel is 2.6.8.  Reiserfsck is 3.6.19.  No disk errors in any 
log files.



--------------020604000309040306050202
Content-Type: text/x-log;
 name="reiser.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser.log"

####### Pass 0 #######
block 1428615: The number of items (32) is incorrect, should be (0) - corrected
block 1428615: The free space (0) is incorrect, should be (4072) - corrected
block 17130895: The number of items (128) is incorrect, should be (0) - corrected
block 17130895: The free space (2048) is incorrect, should be (4072) - corrected
block 44465182: The number of items (256) is incorrect, should be (1) - corrected
block 44465182: The free space (4096) is incorrect, should be (4048) - corrected
pass0: vpf-10150: block 44465182: item 0: Wrong key [0 0 0x200 SD (0)], deleted
block 58613341: The number of items (8) is incorrect, should be (1) - corrected
block 58613341: The free space (308) is incorrect, should be (4048) - corrected
pass0: block 58613341, item 0: StatData item of wrong length found 1342179872 2113538 0x0 SD (0), len 0, location 4096 entry count 0, fsck need 0, format old - deleted
414530 directory entries were hashed with "r5" hash.
####### Pass 1 #######

--------------020604000309040306050202
Content-Type: text/plain;
 name="reiser.log2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser.log2"

condense:~# reiserfsck --logfile /var/tmp/reiser.log --rebuild-tree /dev/hdg1
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

Will rebuild the filesystem (/dev/hdg1) tree
Will put log info to '/var/tmp/reiser.log'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/hdg1' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Fri Oct  7 15:46:17 2005
###########

Pass 0:
Loading on-disk bitmap .. ok, 61048992 blocks marked used
Skipping 10074 blocks (super block, journal, bitmaps) 61038918 blocks will be read
0%....20%....40%....60%..                                                    lef                                                  left 0, 13223 /secccseccccc
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 61038918
                Leaves among those 141109
                        - leaves all contents of which could not be saved and deleted 5
                Objectids found 414533

Pass 1 (will try to insert 141104 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....Not enough allocable blocks, checking bitmap...there are 1 allocable blocks, btw

out of disk space
Aborted

--------------020604000309040306050202--
