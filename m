From: Govardhan <govar@thinkpix.com>
Subject: reiserfs_open: bread failed reading block 16
Date: Tue, 2 Apr 2002 17:38:21 -0500
Message-ID: <E16sWun-0006Sa-00@main.gmane.org>
Reply-To: govar@thinkpix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vitaly@namesys.com, vs@namesys.com, reiserfs-list@namesys.com, reiserfs@devlinux.com

Hi, 
    I have two partitions one is /dev/md0 and /dev/md1. All the user files 
are on /dev/md1. I am not sure when this happened but I cannot see the user 
files. So when I check the filesystems that were mounted, only /dev/md0 was 
mounted. I tried to mount /dev/md1, but it gave the following error:

#mount -t reiserfs /dev/md1 /users
mount: wrong fs type, bad option, bad superblock on /dev/md1,
       or too many mounted file systems
       (could this be the IDE device where you in fact use
       ide-scsi so that sr0 or sda or so is needed?)

# reiserfsck --check --logfile check.log /dev/md1

<-------------reiserfsck, 2001------------->
reiserfsprogs 3.x.0j

Will read-only check consistency of the partition
Will put log info to 'check.log'
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfs_open: bread failed reading block 16
reiserfs_open: bread failed reading block 2
reiserfs_open: neither new nor old reiserfs format found on /dev/md1
reiserfsck: --rebuild-sb may restore reiserfs super block

#reiserfsck --rebuild-sb /dev/md1

<-------------reiserfsck, 2001------------->
reiserfsprogs 3.x.0j

Will check SB and rebuild if it is needed
Will put log info to 'stderr'
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfs_open: bread failed reading block 16
reiserfs_open: bread failed reading block 2
reiserfs_open: neither new nor old reiserfs format found on /dev/md1

what is version of ReiserFS you use[1-4]
        (1)   3.6.x
        (2) >=3.5.9
        (3) < 3.5.9 converted to new format
        (4) < 3.5.9
        (X)   exit
1
Super block of format 3.6 found on the 0x3 in block 16
Block count 0
Blocksize 4096
Free blocks 0
Busy blocks (skipped 16, bitmaps - 0, journal blocks - 8193
1 super blocks, -8210 data blocks
Root block 0
Journal block (first) 18
Journal dev 0
Journal orig size 8192
Filesystem state ERROR
Tree height 0
Hash function used to sort names: not set
Objectid map size 0, max 972
Version 2
Is this ok ? [N/Yes]: Yes
bwrite: lseek to position 65536 (block=16, dev=3): Invalid argument
# reiserfsck --rebuild-tree /dev/md1

<-------------reiserfsck, 2001------------->
reiserfsprogs 3.x.0j


This is an experimental version of reiserfsck, MAKE A BACKUP FIRST!
Don't run this program unless something is broken.
Some types of random FS damage can be recovered
from by this program, which basically throws away the internal nodes
of the tree and then reconstructs them.  This program is for use only
by the desperate, and is of only beta quality.  Email
reiserfs@devlinux.com with bug reports.
Will rebuild the filesystem tree
Will put log info to 'stderr'
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfs_open: bread failed reading block 16
reiserfs_open: bread failed reading block 2
reiserfs_open: neither new nor old reiserfs format found on /dev/md1
reiserfsck: --rebuild-sb may restore reiserfs super block
#


Nothing seems to fix the problem. Am I doing anything wrong
Please advise me.
Thanks,
Govar
