From: Brandon Low <lostlogic@gentoo.org>
Subject: Re: reiserfsprogs-3.6.12 release
Date: Thu, 12 Feb 2004 10:21:38 -0600
Message-ID: <20040212162138.GC7002@lostlogicx.com>
References: <200402102010.04479.vitaly@namesys.com> <200402121431.26019.vitaly@namesys.com> <200402121317.53245.henning-04@die.informatik.uni-siegen.de> <200402121710.19639.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <reiserfs-list-return-16779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200402121710.19639.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 02/12/04 at 17:10:19 +0300, Vitaly Fertman wrote:
> so dev is devfs. ok, would you then
> 	stat ide/host0/bus1/target0/lun0/part7
> ?
> 
> looks like rdev of the device file on devfs does not match to dev of its
> mount point.

I've done some of this stuff too, in case it is useful, attached is a
script file from me doing so.

--Brandon
> 
> --
> Thanks,
> Vitaly Fertman

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=typescript

Script started on Thu Feb 12 10:15:39 2004
sh-2.05b# stat /
  File: `/'
  Size: 752       	Blocks: 2          IO Block: 131072 directory
Device: 303h/771d	Inode: 2           Links: 22
Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2003-05-29 10:33:47.000000000 -0500
Modify: 2004-02-12 10:15:39.000000000 -0600
Change: 2004-02-12 10:15:39.000000000 -0600

sh-2.05b# stat /dev/hda3
  File: `/dev/hda3' -> `ide/host0/bus0/target0/lun0/part3'
  Size: 33        	Blocks: 0          IO Block: 1024   symbolic link
Device: ah/10d	Inode: 1240        Links: 1
Access: (0555/lr-xr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2004-02-12 10:15:14.000000000 -0600
Modify: 2004-02-12 10:02:39.000000000 -0600
Change: 2004-02-12 10:02:39.000000000 -0600

sh-2.05b# stat /dev/root
  File: `/dev/root' -> `ide/host0/bus0/target0/lun0/part3'
  Size: 33        	Blocks: 0          IO Block: 1024   symbolic link
Device: ah/10d	Inode: 621         Links: 1
Access: (0555/lr-xr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2004-02-12 10:15:18.000000000 -0600
Modify: 2004-02-12 10:02:31.000000000 -0600
Change: 2004-02-12 10:02:31.000000000 -0600

sh-2.05b# stat /dev/ide/host0/bus0/target0/lun0/part3 
  File: `/dev/ide/host0/bus0/target0/lun0/part3'
  Size: 0         	Blocks: 0          IO Block: 1024   block special file
Device: ah/10d	Inode: 611         Links: 1     Device type: 3,3
Access: (0600/brw-------)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 1969-12-31 18:00:00.000000000 -0600
Modify: 1969-12-31 18:00:00.000000000 -0600
Change: 1969-12-31 18:00:00.000000000 -0600

sh-2.05b# rdev
/dev/ide/host0/bus0/target0/lun0/part3 /
Script done on Thu Feb 12 10:16:59 2004

--a8Wt8u1KmwUX3Y2C--
