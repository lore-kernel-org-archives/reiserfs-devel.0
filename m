From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: reiserfsprogs 3.6.5 release
Date: Tue, 25 Mar 2003 11:08:11 +0100
Message-ID: <200303251108.11938.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello all,

after my update to reiserfsprogs-3.6.5 no partition would be mounted during=
=20
boot ;-( It started with the reiserfsprogs-3.6.5-pre2 release.=20
reiserfsprogs-3.6.5-pre1 is fine and what I currently use.
The latest final is much faster and smooth during --check, --clear-attribut=
es,=20
=2D-rebuild-sb, --rebuild-tree but the boot thing wouldn't go away after al=
l my=20
search.

=2D--
Checking all file systems...
fsck 1.24a (02-Sep-2001)
Reiserfs super block in block 16 on 0x803 of format 3.6 with standard journ=
al
Blocks (total/free): 26105/6638 by 4096 bytes
=46ilesystem is cleanly umounted

flush_buffers: device is not specifed

!!! spelling !!!

=2D--specified---


Warning... fsck.reiserfs for device /dev/sda3 exited with signal 6.
Reiserfs super block in block 16 on 0x805 of format 3.6 with standard journ=
al
Blocks (total/free): 275032/124994 by 4096 bytes
=46ilesystem is cleanly umounted

flush_buffers: device is not specifed
Warning... fsck.reiserfs for device /dev/sda5 exited with signal 6.

Some more partitions.

fsck failed.  Please repair manually.
=2D--

SuSE 7.3 based system.
All updated as much as I can.

e2fsprogs-1.24a-11

2.4.21-pre4-aa3 with all latest datalogging stuff from Chris and Oleg
02-akpm-b_journal_head-1.diff
03-relocation-6.diff
04-reiserfs-sync_fs-1.diff
05-data-logging-36.diff
06-reiserfs-quota-26.diff
10-reiserfs-quota-link-fix.diff
11.dirty-inodes-for-kinoded.diff
kinoded-9.diff
search_reada-4.diff
stree.c-fix

> > Same here with all my "normal" SCSI disks.
> > See my former "reiserfsprogs-3.6.5-pre2: volumes do not mount during bo=
ot"
> > post.
> >
> > Should I try reiserfsck --rebuild-tree?
> >
> > Thanks,
> >       Dieter
>
> No, you should run reiserfsck --check manually and follow the instruction=
s.

I've tried back and forth like you've told me before, but nothing works.
Only going back to reiserfsprogs-3.6.5-pre1 helped.

SunWave1 /# /database/db3/sbin/reiserfsck --check /dev/sdb5

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5

  *************************************************************
  ** If you are using the latest reiserfsprogs and  it fails **
  ** please  email bug reports to reiserfs-list@namesys.com, **
  ** providing  as  much  information  as  possible --  your **
  ** hardware,  kernel,  patches,  settings,  all  reiserfsk **

!!! spelling !!!

=2D--reiserfsck---

  ** messages  (including version),  the reiserfsck logfile, **
  ** check  the  syslog file  for  any  related information. **
  ** If you would like advice on using this program, support **
  ** is available  for $25 at  www.namesys.com/support.html. **
  *************************************************************

Will read-only check consistency of the filesystem on /dev/sdb5
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es
###########
reiserfsck --check started at Tue Mar 25 10:47:47 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 1
        Internal nodes 0
        Directories 2
        Other files 0
        Data block pointers 0 (0 of them are zero)
        Safe links 0
###########
reiserfsck finished at Tue Mar 25 10:47:50 2003
###########

SunWave1 /# /database/db3/sbin/debugreiserfs /dev/sdb5

<-------------debugreiserfs, 2002------------->
reiserfsprogs 3.6.5


=46ilesystem state: consistent

Reiserfs super block in block 16 on 0x815 of format 3.6 with standard journ=
al
Count of blocks on the device: 214861
Number of bitmaps: 7
Blocksize: 4096
=46ree blocks (count of blocks - used [journal, bitmaps, data, reserved]=20
blocks): 206643
Root block: 8227
=46ilesystem is cleanly umounted
Tree height: 2
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x1b24fcfb]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
=46s state field: 0x0:
sb_version: 2
inode generation number: 166
UUID: e77b0523-ae87-47a8-89d6-e15e78628f56
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN


Log from my ROOT partition:

SunWave1 /# /database/db3/sbin/debugreiserfs /dev/sda3

<-------------debugreiserfs, 2002------------->
reiserfsprogs 3.6.5


=46ilesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x803 of format 3.6 with standard journ=
al
Count of blocks on the device: 26105
Number of bitmaps: 1
Blocksize: 4096
=46ree blocks (count of blocks - used [journal, bitmaps, data, reserved]=20
blocks): 6638
Root block: 8213
=46ilesystem is NOT cleanly umounted
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 334, max 972
Journal parameters:
        Device [0x0]
        Magic [0x0]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
=46s state field: 0x0:
sb_version: 2
inode generation number: 234347
UUID: f55d5f35-2658-41d2-b75b-a38eda560745
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN


reiserfsck --clear-attributes	OK
reiserfsck --rebuild-sb		OK
reiserfsck --rebuild-tree		OK

What next?
As sidenote: You should expand the copyright to 2003 ;-)

Thanks,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
