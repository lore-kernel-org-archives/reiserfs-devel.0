From: Russell Coker <russell@coker.com.au>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 19:59:45 +1000
Message-ID: <200306051959.45126.russell@coker.com.au>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14421-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1054800852.1997.15.camel@wusel.schnulli.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heinz-Josef Claes <hjclaes@web.de>, reiserfs-list@namesys.com

On Thu, 5 Jun 2003 18:14, Heinz-Josef Claes wrote:
> Here are some questions:
>
> - I plan to build a system with IDE 250GB drives. 7 of them for raid 5
> and one hot spare. The OS will be on separate hardware raid 1 on smaller
> disks. Does anybody have experience with IDE controlers for the big
> disks? Is it better to use hardware raid oder software raid
> (performance)?

The sonsensus of opinion on the large-ide-arrays mailing list is that 3ware 
controllers are the best for hardware RAID on IDE.

Software RAID performs better in almost all areas, however for RAID-5 the 
reliability of software RAID isn't as good as that of hardware RAID (NB only 
hardware RAID with NV-RAM write-back cache does the right thing - non-caching 
hardware RAID-5 is equal to software RAID-5 for reliability).

Why have the OS on a different device?  On all the RAID installations I've 
used which I regard as successful the OS has been on the same hardware.

> - At this time, we plan to use reiserfs. What are the advantages /
> disadvantages of using the raid 1 for journaling for the (big) raid 5
> (performance, recovery)? The system will be heavily used with
> storebackup (www.sf.net/projects/storebackup) witch means that lots of
> hard links have to be created as fast as possible.

umem non-volatile RAM devices should perform best for journals.  If you use 
journalled-data in ReiserFS (need patches - it's not in the main kernels) and 
put the journal on a umem device you should get some significant performance 
increases - better than you get for having a separate hardware setup for the 
OS.  Also for 2.4.20 there are a few ReiserFS patches that you need for 
decent performance (which come along with the data-journalling patch).  These 
patches have more than doubled the performance of some of my machines.  I 
would expect that the SUSE kernel would include them already.

Also if using a umem device you want to try and move your most volatile data 
to it (EG a mail spool).  A 1G umem device has space for a lot more than 
ReiserFS journals.

The write-back cache in hardware RAID seems to be no more than about 128M.  
This isn't much when you have sustained disk writes of 2M/s (and due to the 
way RAID-5 works you need to cache at least twice as much data as you are 
writing for small writes).

Finally, having more than one busy file system on the same physical device is 
going to hurt performance.  The OS partition won't be very busy (turn off 
atime, set syslogd to allow write-back caching, and give your server a decent 
amount of RAM and it can go for minutes without a single disk access).  If 
you want good performance then you don't want to be swapping at all, RAM is 
cheap, much cheaper than fast hard drives.

I suggest that for good performance and a reasonable price you look at a 3ware 
RAID controller with a single RAID-5 device comprised of 7 disks as you 
suggested.  Then you have a umem device for the journal of the data 
filesystem and for a small filesystem for volatile data.  That and plenty of 
RAM should solve most of the performance problems.

Finally, there are some kernel bugs that choke performance on big machines.  
2.4.20 running with 4G of RAM and serious IO load will usually waste large 
amounts of CPU time on kswapd.  The kernel patch that SUSE uses solves this, 
also I think that 2.4.21-rc kernels may have code to address this.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

