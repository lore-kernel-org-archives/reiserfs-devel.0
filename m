From: Russell Coker <bofh@coker.com.au>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Mon, 14 Oct 2002 22:52:09 +0200
Message-ID: <200210142252.09438.bofh@coker.com.au>
References: <200210121052.22603.bofh@coker.com.au> <200210122302.g9CN23BD000383@sirius.cs.pdx.edu> <20021014175909.GA10292@tapu.f00f.org>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11684-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021014175909.GA10292@tapu.f00f.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Wedgwood <cw@f00f.org>
Cc: reiserfs-list@namesys.com

On Mon, 14 Oct 2002 19:59, Chris Wedgwood wrote:
> On Sat, Oct 12, 2002 at 04:02:03PM -0700, The Amazing Dragon wrote:
> > I believe PCI-X is still 64-bits wide (I haven't seen anything
> > mention this so I assume it is unchanged) and up to 133MHz, so
> > theoretical bandwidth of 1066MBps. So 7 Serial ATA drives, perhaps
> > 10 drives if you take into account the real performance of drives.
>
> Bus width is at best a very naive metric.
>
> At present, you can't get 100MB/s sustained read off any IDE drive I'm
> aware off, not even for linear-read-out.  You *may* get 50MB/s on a
> high-end SCSI disk, most IDE drives seem to top out around 30MB/s.

In my tests IDE drives topped out at 30MB/s for sustained reads from the start 
of the drive two years ago, one year ago they were approaching 40MB/s.  I 
haven't tested the latest drives, but I expect them to be faster...  Maybe 
the recently released IDE drives will sustain 50MB/s for the first few dozen 
gigs at least...

> The other thing is, how many people need 1G/s+ disk IO?  Chances are
> if you need this, you might be convinced to use real-hardware instead
> of a PC full of IDE drives.

The real question is "how many people need such linear performance with no 
seeks?".  Probably almost none.

> > What astonishes me is that 66MHz 64-bit PCI is *still* confined
> > exclusively to high end motherboards, when even the low-end
> > motherboards are struggling against the bandwidth monster.
>
> Nope.  Some cheap MB's are 64/66, the Dual Athlon boards for example.

Cheap == single CPU.

In a quick web search of some companies I buy from, one sells a single 
dual-CPU motherboard which costs three times as much as the single-CPU 
motherboards (which have become amazingly cheap).  However it'll end up 
costing more because with the lack of choice I'll probably be forced to spend 
more on other things.

> P.S. FWIW, SGI demonstrated 7GB/s through the filesystem over five
>      years ago.

Yes, and still no-one makes PC hardware that compares.  :(

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

