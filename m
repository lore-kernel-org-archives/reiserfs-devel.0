From: Julian Hall <jules@acris.co.uk>
Subject: Hangs and crashes, reiserfsck --rebuild-tree fails?
Date: Tue, 04 Mar 2003 14:25:46 +0000
Message-ID: <3E64B76A.6030109@acris.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I seem to have some corruption on one of my file systems and don't seem 
to be able to fix it.  The problem manifests itself by (apparently) 
random crashes and hangs whenever the file system is mounted, usually 
within 10-15 minutes of the last reboot.

I tried to fix the problem using reiserfsck, and it advised me that I 
needed to use --rebuild-tree, so I ran that.  These are the messages 
that were produced:

root@vengeance:/# reiserfsck --rebuild-tree /dev/hdd2

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.4

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

Will rebuild the filesystem (/dev/hdd2) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you 
do):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Tue Mar  4 15:17:12 2003
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 4997800 blocks marked used
Skipping 8363 blocks (super block, journal, bitmaps) 4989437 blocks will 
be read
0%.pass0: block 281565, item 2 397 0x1 DIR (3), len 286, location 3778 
entry count 11, fsck need 0, format old: 9 entries were deleted
...20%....40%....60%....80%....100%                         left 0, 688 /sec
187986 directory entries were hashed with "tea" hash.
        "tea" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 4989437
                Leaves among those 60572
                Objectids found 187545

Pass 1 (will try to insert 60572 leaves):
####### Pass 1 #######
Looking for allocable blocks .. fininshed
0%....20%....40%....60%....80%....100%                          left 0, 
97 /sec
Flushing..finished
        60572 leaves read
                59102 inserted
                        - pointers in indirect items pointing to 
metadata 5 (zeroed)
                1470 not inserted
        non-unique pointers in indirect items (zeroed) 1
####### Pass 2 #######

Pass 2:
0%....20%....40%....60%....Not enough allocable blocks, checking 
bitmap...there are 0 allocable blocks, btw

out of disk space
Aborted
root@vengeance:/# df
Filesystem         1024-blocks  Used Available Capacity Mounted on
/dev/hda1            2476090 2244793   103283     96%   /
/dev/hda2            2516186 2264563   123607     95%   /apps
/dev/hda4            4637018 4145260   251728     94%   /work

I'm running pretty close to capacity on all my partitions, and it seems 
that the one with the problem is too full for a rebuild tree operation 
to succeed.  And now I cannot mount the partition to fix the problem.

What should I do?

Thanks

Julian


