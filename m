From: Joshua Masiko <joshua@dsmagic.com>
Subject: Re: can't mount repaired reiserfs partition
Date: Wed, 23 Apr 2003 15:55:52 +0300 (EAT)
Message-ID: <Pine.LNX.4.21.0304231548250.3962-100000@entandikwa.ds.co.ug>
References: <200304231617.15308.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13774-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304231617.15308.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Joshua Masiko <joshua@dsmagic.com>, reiserfs-list@namesys.com



On Wed, 23 Apr 2003, Vitaly Fertman wrote:

> 
> Hi, 
> 
> On Wednesday 23 April 2003 16:23, Joshua Masiko wrote:
> > One of the partition on a harddisk that had SuSE 7.2 got corrupted. I
> > connected it as a secondary drive on a SuSE 8.1 machine and run reiserfsck
> > --check which found an error and said it was fixable by
> > --fix-fixable. Below is the output of --fix-fixable
> >
> > reiserfsck --fix-fixable /dev/hdd6
> > reiserfsck 3.6.2 (2002)
> 
> this is the old version, would you try to check your fs with 3.6.6-pre1 version and 
> tell us what it says?
> 
> -- 
> Thanks,
> Vitaly Fertman
> 

Okay I downloaded and compiled 3.6.6-pre1 
timon:/home/joshua/downloads/reiserfsprogs-3.6.6-pre1/fsck # ./reiserfsck
--check /dev/hdd6

<-------------reiserfsck, 2003------------->
reiserfsprogs 3.6.6-pre1

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

Will read-only check consistency of the filesystem on /dev/hdd6
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes

reiserfs_open_journal: journal parameters from the super block does not
match to
journal parameters from the journal. It is expected if you created your fs
with
old reiserfsprogs. In this case rebuild-sb will fix it all for you.

Either make journal partition available or use --no-journal-available
If you have the standard journal or if your partition is available
and you specified it correctly, you must run rebuild-sb.

=========================================================================================================================

timon:/home/joshua/downloads/reiserfsprogs-3.6.6-pre1/fsck # ./reiserfsck
--rebuild-sb /dev/hdd6

<-------------reiserfsck, 2003------------->
reiserfsprogs 3.6.6-pre1

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

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes

reiserfs_open_journal: journal parameters from the super block does not
match to
journal parameters from the journal. It is expected if you created your fs
with
old reiserfsprogs. In this case rebuild-sb will fix it all for you.

rebuild-sb: journal header is not found. You either have a corrupted
journal
 or have just changed the start of the partition with some partition table
editor.
If you are sure that the start of the partition is ok, rebuild the journal
header.
Do you want to rebuild the journal header? (y/n)[n]: y
Reiserfs super block in block 16 on 0x1646 of format 3.5 with standard
journal
Count of blocks on the device: 4678923
Number of bitmaps: 143
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 2697985
Root block: 17954
Filesystem is cleanly umounted
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 1004, max 1004
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 0

Super block seems to be correct

================================================================================

timon:/home/joshua/downloads/reiserfsprogs-3.6.6-pre1/fsck # mount -t
reiserfs -o ro /dev/hdd6 /mnt/recover/
mount: wrong fs type, bad option, bad superblock on /dev/hdd6,
       or too many mounted file systems


