From: Joshua Masiko <joshua@dsmagic.com>
Subject: Re: can't mount repaired reiserfs partition
Date: Wed, 23 Apr 2003 16:21:02 +0300 (EAT)
Message-ID: <Pine.LNX.4.21.0304231619260.4976-100000@entandikwa.ds.co.ug>
References: <200304231658.33598.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304231658.33598.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Joshua Masiko <joshua@dsmagic.com>, reiserfs-list@namesys.com



On Wed, 23 Apr 2003, Vitaly Fertman wrote:

> > Super block seems to be correct
> >
> > ===========================================================================
> >=====
> >
> > timon:/home/joshua/downloads/reiserfsprogs-3.6.6-pre1/fsck # mount -t
> > reiserfs -o ro /dev/hdd6 /mnt/recover/
> > mount: wrong fs type, bad option, bad superblock on /dev/hdd6,
> >        or too many mounted file systems
> 
> Ok, and what does reiserfsck --check say now?
> Do you have anything related in the syslog?
> 
> -- 
> Thanks,
> Vitaly Fertman
> 


timon:/home/joshua/downloads/reiserfsprogs-3.6.6-pre1/fsck # ./reiserfsck
--check  /dev/hdd6

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
bread: Cannot read the block (4679842): (Invalid argument).

reiserfs_open: Your partition is not big enough to contain the
filesystem of (4679842) blocks as was specified in the found super block.

Failed to open the filesystem.

If the partition table has not been changed, and the partition is
valid  and  it really  contains  a reiserfs  partition,  then the
superblock  is corrupted and you need to run  --rebuild-sb.

Aborted


