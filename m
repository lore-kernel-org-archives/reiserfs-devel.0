From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: New gentoo bug with reiserfsprogs-3.6.5
Date: Thu, 3 Apr 2003 20:56:17 +0400
Message-ID: <200304032056.17957.vitaly@namesys.com>
References: <20030403160231.GF26830@lostlogicx.com> <200304032050.08685.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13549-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304032050.08685.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brandon Low <lostlogic@gentoo.org>, reiserfs-list@namesys.com

On Thursday 03 April 2003 20:50, Vitaly Fertman wrote:
> Hi, Brandon.
>
> On Thursday 03 April 2003 20:02, Brandon Low wrote:
> > Greetings Reiser devs,
> >
> > I've just recieved a new bug report relating to the reiserfsprogs-3.6.5
> > version in gentoo (this includes a
> > reiserfsprogs-3.6.5-flush_buffers-bug.patch from vitaly).  Please see:
> > http://bugs.gentoo.org/show_bug.cgi?id=18612
> >
> > Based on the initial bug report, I thought it was a fault in our kernel
> > or the kernel that the user was using at least, but the user has
> > confirmed that simply reverting to reiserfsprogs-3.6.4 fixes his issues.
> >
> > Thanks!
> >
> > --Brandon Low
>
> reiserfsck before the version 3.6.5-pre2 did not check anything on boot.
> That is why there seems to be no problem with the previous version.
> But
>
> Apr  1 16:13:13 kenny kernel: hda: dma_intr: error=0x10 { SectorIdNotFound
> }, LBAsect=78156212, sector=75907112
> Apr  1 16:13:13 kenny kernel: hda: dma_intr: status=0x51 { DriveReady
> SeekComplete Error }
>
> means hardware problem.

or some problems with partition table.

-- 

Thanks,
Vitaly Fertman
