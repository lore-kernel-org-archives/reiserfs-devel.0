From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 12:38:26 +0200
Message-ID: <1054809506.1997.76.camel@wusel.schnulli.de>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <200306051959.45126.russell@coker.com.au>
	 <1054807982.1995.56.camel@wusel.schnulli.de>
	 <200306052025.05910.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14428-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306052025.05910.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com

Am Don, 2003-06-05 um 12.25 schrieb Russell Coker:
> On Thu, 5 Jun 2003 20:13, Heinz-Josef Claes wrote:
> > My question also was about hardware or software raid. If I'm using
> > software raid, a hardware raid 1 for the OS is not a too bad idea.
> 
> Booting from software RAID-1 is easy to setup.  I've done it with both SCSI 
> and IDE software RAID.
> 
Perhaps I'm not up to date, but as far as I know rebooting with a broken
boot disk needs a bios which can switch automatically to the other disk
of the raid 1. If you have lots of machines (and which are standing
outside) this is an advantage.

> But having a single hardware RAID-5 is even easier.
> 
> > The other point is, that with the data (= raid 5 disks in my example),
> > separated from the OS, you are more flexible in case of a hardware
> > failure of the system. (I do not mean a disk failure.)
> 
> How?  If the disks are all working and the data is consistant then you 
> transfer them all to another system and things are fine.  If the disks aren't 
> all working or the data is inconsistant then having the OS on separate disks 
> won't help much.  Recovering the OS from backup is usually trivial, so the 
> fact that RAID-1 makes it easier to recover things does not provide much 
> benefit for the OS (IMHO).
> 
One thing the administrators here (they are moving from windows to
linux!) want is to pull out a cable and plug it to a new machine if the
old one behaves strange (eg. motherboard has strange problems). In such
a case it's *easy* for an administrator (who is not an expert) to try to
"repair" such a machine.

> I guess you could justify RAID-10 for the data store because of the ease of 
> recovery.
> 
Your right. But this is only system for holding a copy of the original
data. It will be all in all about 5 to 10 TB, so the price is important.
(One of the benefit is *not* to have 160 tape drives out).

> > > separate hardware setup for the OS.  Also for 2.4.20 there are a few
> > > ReiserFS patches that you need for decent performance (which come along
> > > with the data-journalling patch).  These patches have more than doubled
> > > the performance of some of my machines.  I would expect that the SUSE
> > > kernel would include them already.
> >
> > I use SuSE 8.2. It's much faster than the SuSE kernel in 8.1, even on my
> > ZIP drive at the parallel port ;)
> 
> Hopefully someone can advise on whether the SuSE 8.2 kernel has all the 
> patches you desire for best ReiserFS performance.
> 
> > > I suggest that for good performance and a reasonable price you look at a
> > > 3ware RAID controller with a single RAID-5 device comprised of 7 disks as
> > > you suggested.  Then you have a umem device for the journal of the data
> > > filesystem and for a small filesystem for volatile data.  That and plenty
> > > of RAM should solve most of the performance problems.
> >
> > Do you have experiences with serial ATA from 3ware? Is it a good idea
> > not to use parallel ATA?
> 
> Serial ATA is still very new.  Last time I checked the details of the 3ware 
> products they were using a bridge chip to convert the signals from the 
> parallel ATA controllers on their hardware to serial-ATA for the connectors, 
> also at that time the disk drives seemed to be all parallel-ATA internally 
> with a bridge chip.  This means that you would not get any performance 
> benefit from S-ATA (but cabling is much easier).
> 
> At the moment I would not expect to see any benefit of S-ATA apart from ease 
> of cabling (which is a significant issue when you have 8 or more disks).
True. That's why I'm interested in experiences. Cabling is a big problem
with parallel ATA.



