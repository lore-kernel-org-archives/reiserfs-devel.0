From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Severe problem with fsck.reiser4 1.0.3
Date: Thu, 13 Jan 2005 17:39:57 +0300
Message-ID: <200501131739.57777.vitaly@namesys.com>
References: <1105475609.41e4381953cbe@www.hosting-agency.de> <200501120053.56393.vitaly@namesys.com> <1105488122.41e468fa5d98a@www.hosting-agency.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1105488122.41e468fa5d98a@www.hosting-agency.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simon Raffeiner <sturmflut@lieberbiber.de>
Cc: reiserfs-list@namesys.com

On Wednesday 12 January 2005 03:02, Simon Raffeiner wrote:
> Get your copy (35 MB) at
>
> http://servipex.lieberbiber.de:10080/metadata.reiser4.20050111.bz2

got it. working on the problem.

> Warning: Hostname is dynamic and gets disconnected every 24 hours, so you
> might have to try again a few minutes later.
>
> Quoting Vitaly Fertman <vitaly@namesys.com>:
> > On Tuesday 11 January 2005 23:33, Simon Raffeiner wrote:
> > > Hi,
> > >
> > > yesterday my workstation refused to boot Linux using a Reiser4
> > > formatted / partition. It mocks about an error with an already cached
> > > block and about skipping the "entire subtree", I also can remember the
> > > filename "znode.c". ATM I had to boot another PC and connect the
> > > harddisk there to make some diagnostics so I cannot post the original
> > > error message, but this can be done on request.
> > >
> > > I used to access the partition with Kernel 2.6.9-mm1 for about a month
> > > and switched to 2.6.10-mm1 three days ago with no problems. According
> > > to dd_rescue and dmesg there are no bad blocks on the disk (at least
> > > the drive does not give any error messages about).
> > >
> > > I tried to run fsck.reiser4 from the X-2004 Version of "Kanotix" and
> > > got a segmentation fault right after "CHECKING STORAGE TREE". I tried
> > > the same with reiser4progs 1.0.1 on Gentoo with the same result, also
> > > the version from 1.0.3 breaks. This is the output from fsck.reiser4
> > > 1.0.3 on Gentoo Linux:
> > >
> > >
> > > playstation etc # fsck.reiser4 /dev/hdc3
> > > *******************************************************************
> > > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> > > *******************************************************************
> > >
> > > Fscking the /dev/hdc3 block device.
> > > Will check the consistency of the Reiser4 SuperBlock.
> > > Will check the consistency of the Reiser4 FileSystem.
> > > Continue?
> > > (Yes/No): Yes
> > > ***** fsck.reiser4 started at Tue Jan 11 21:27:03 2005
> > > Fatal: Failed to open the reiser4 backup.
> > > Fatal: Cannot open the FileSystem on (/dev/hdc3).
> > >
> > > 1 fatal corruptions were detected in SuperBlock. Run with --build-sb
> > > option to fix them.
> > >
> > >
> > > playstation etc # fsck.reiser4 --build-sb /dev/hdc3 -L fsck.log
> > > *******************************************************************
> > > This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> > > *******************************************************************
> > >
> > > Fscking the /dev/hdc3 block device.
> > > Will build the Reiser4 SuperBlock.
> > > Will check the consistency of the Reiser4 FileSystem.
> > > Continue?
> > > (Yes/No): Yes
> > > ***** fsck.reiser4 started at Tue Jan 11 21:24:10 2005
> > > Enter the key plugin name [key_large]:
> > > Reiser4 fs was detected on /dev/hdc3.
> > > Master super block (16):
> > > magic:          ReIsEr4
> > > blksize:        4096
> > > format:         0x0 (format40)
> > > uuid:           97920906-596c-4a63-9d49-2a268254f6c6
> > > label:          <none>
> > >
> > > Format super block (17):
> > > plugin:         format40
> > > description:    Disk-format for reiser4.
> > > magic:          ReIsEr40FoRmAt
> > > flushes:        0
> > > mkfs id:        0x751d8925
> > > blocks:         14462532
> > > free blocks:    10761350
> > > root block:     119159
> > > tail policy:    0x2 (smart)
> > > next oid:       0x585b59
> > > file count:     555932
> > > tree height:    5
> > > key policy:     LARGE
> > >
> > >
> > > CHECKING STORAGE TREE
> > > Segmentation fault
> > >
> > >
> > > The harddisk and the file system label seem to be perfectly okay but
> > > there is some kind of corruption that breaks the Reiser4 code in Linux
> > > 2.6.9-mm1, Linux 2.6.10-mm1, reiser4progs 1.0.1 and reiser4progs 1.0.3.
> > > Google gave me no answer on this and I am not able to track the problem
> > > down using strace. The fsck.log remains empty after the command above.
> >
> > can you pack the metadata with
> > 	debugfs.reiser4 -P /dev/hdc3 | bzip2 -c > hdc3.bz2
> > using 1.0.3 progs and provide it for downloading?
> >
> > --
> > Thanks,
> > Vitaly Fertman

-- 
Thanks,
Vitaly Fertman


