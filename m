From: Alan Chu <alanchu@MIT.EDU>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Fri, 16 Apr 2004 02:05:41 -0400 (EDT)
Message-ID: <Pine.GSO.4.55L.0404160203190.11522@ohmmjbeq-ovatb.zvg.rqh>
References: <Pine.GSO.4.55L.0404101549560.18241@ohmmjbeq-ovatb.zvg.rqh>
 <200404121306.40102.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17981-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404121306.40102.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

My / partition is officially borked.  I would highly recommend NOT using
Gnu Parted, btw.  It's screwed up my partitions twice now.  Guess I'm
stuck with good old Windows XP for a month, until I get some time in the
summer to put linux back on.

On Mon, 12 Apr 2004, Vitaly Fertman wrote:

> Hello Alan,
>
> On Sunday 11 April 2004 00:01, Alan Chu wrote:
> > Hi,
> >
> > I tried to resize down my root partition using Gnu Parted, off of a boot
> > disk. It failed midway, saying that there was an "invalid node". After
> > rebooting, I get kernel panic:
> >
> > -----
> > sh-2021: reiserfs_read_super: can not find reiserfs on ide0(3,9)
> > XFS: bad magic number
> > XFS: SB validate failed
> > Kernel panic: VFS: Unable to mount root fs on 03:09
> > -----
> >
> > I checked my partitions, and their numbers haven't changed (hda1 is still
> > hda1, hda2 is still hda2, etc.) so /etc/fstab should be fine.
> >
> > I searched around on the Gentoo forums, but most answers involve someone
> > trying to install Gentoo. Before using parted, my gentoo worked fine. So,
> > the kernel options should be correct.
> >
> > So I used the Linux "Recovery is Possible 6.9" boot disk, and ran
> > "reiserfsck --check" on my /dev/hda9, which is my / partition. The output
> > was the following:
> >
> > -----
> > Replaying journal..
> > No transactions found
> > Checking internal tree..
> > Bad root block 0.
> > (--rebuild-tree did not complete)
> > Aborted
> > -----
> >
> > Funny thing is, I didn't run "--rebuild-tree" yet. So, next, I tried the
> > "--rebuild-tree" option, since nothing is working,
>
> what does reiserfsck --check say now? Does it find any corruption?
>
>
> --
> Thanks,
> Vitaly Fertman
>
>
