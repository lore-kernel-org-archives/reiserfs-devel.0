From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 12:13:03 +0200
Message-ID: <1054807982.1995.56.camel@wusel.schnulli.de>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <200306051959.45126.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14424-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306051959.45126.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com

Am Don, 2003-06-05 um 11.59 schrieb Russell Coker:
> On Thu, 5 Jun 2003 18:14, Heinz-Josef Claes wrote:
> > Here are some questions:
> >
> > - I plan to build a system with IDE 250GB drives. 7 of them for raid 5
> > and one hot spare. The OS will be on separate hardware raid 1 on smaller
> > disks. Does anybody have experience with IDE controlers for the big
> > disks? Is it better to use hardware raid oder software raid
> > (performance)?
> 
> The sonsensus of opinion on the large-ide-arrays mailing list is that 3ware 
> controllers are the best for hardware RAID on IDE.
> 
> Software RAID performs better in almost all areas, however for RAID-5 the 
> reliability of software RAID isn't as good as that of hardware RAID (NB only 
> hardware RAID with NV-RAM write-back cache does the right thing - non-caching 
> hardware RAID-5 is equal to software RAID-5 for reliability).
> 
> Why have the OS on a different device?  On all the RAID installations I've 
> used which I regard as successful the OS has been on the same hardware.
> 
My question also was about hardware or software raid. If I'm using
software raid, a hardware raid 1 for the OS is not a too bad idea.
The other point is, that with the data (= raid 5 disks in my example),
separated from the OS, you are more flexible in case of a hardware
failure of the system. (I do not mean a disk failure.)

> > - At this time, we plan to use reiserfs. What are the advantages /
> > disadvantages of using the raid 1 for journaling for the (big) raid 5
> > (performance, recovery)? The system will be heavily used with
> > storebackup (www.sf.net/projects/storebackup) witch means that lots of
> > hard links have to be created as fast as possible.
> 
> umem non-volatile RAM devices should perform best for journals.  If you use 
> journalled-data in ReiserFS (need patches - it's not in the main kernels) and 
> put the journal on a umem device you should get some significant performance 
> increases - better than you get for having a separate hardware setup for the 
> OS.  Also for 2.4.20 there are a few ReiserFS patches that you need for 
> decent performance (which come along with the data-journalling patch).  These 
> patches have more than doubled the performance of some of my machines.  I 
> would expect that the SUSE kernel would include them already.
> 
I use SuSE 8.2. It's much faster than the SuSE kernel in 8.1, even on my
ZIP drive at the parallel port ;)

> Also if using a umem device you want to try and move your most volatile data 
> to it (EG a mail spool).  A 1G umem device has space for a lot more than 
> ReiserFS journals.
> 
> The write-back cache in hardware RAID seems to be no more than about 128M.  
> This isn't much when you have sustained disk writes of 2M/s (and due to the 
> way RAID-5 works you need to cache at least twice as much data as you are 
> writing for small writes).
> 
> Finally, having more than one busy file system on the same physical device is 
> going to hurt performance.  The OS partition won't be very busy (turn off 
> atime, set syslogd to allow write-back caching, and give your server a decent 
> amount of RAM and it can go for minutes without a single disk access).  If 
> you want good performance then you don't want to be swapping at all, RAM is 
> cheap, much cheaper than fast hard drives.
> 
That's true.

> I suggest that for good performance and a reasonable price you look at a 3ware 
> RAID controller with a single RAID-5 device comprised of 7 disks as you 
> suggested.  Then you have a umem device for the journal of the data 
> filesystem and for a small filesystem for volatile data.  That and plenty of 
> RAM should solve most of the performance problems.
> 
Do you have experiences with serial ATA from 3ware? Is it a good idea
not to use parallel ATA?

> Finally, there are some kernel bugs that choke performance on big machines.  
> 2.4.20 running with 4G of RAM and serious IO load will usually waste large 
> amounts of CPU time on kswapd.  The kernel patch that SUSE uses solves this, 
> also I think that 2.4.21-rc kernels may have code to address this.

Thanks for your responce!


