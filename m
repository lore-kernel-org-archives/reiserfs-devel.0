From: Russell Coker <bofh@coker.com.au>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Tue, 15 Oct 2002 14:57:58 +0200
Message-ID: <200210151457.58520.bofh@coker.com.au>
References: <200210121052.22603.bofh@coker.com.au> <200210142252.09438.bofh@coker.com.au> <20021014225812.GA11337@tapu.f00f.org>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11693-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021014225812.GA11337@tapu.f00f.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Wedgwood <cw@f00f.org>
Cc: reiserfs-list@namesys.com

On Tue, 15 Oct 2002 00:58, Chris Wedgwood wrote:
> On Mon, Oct 14, 2002 at 10:52:09PM +0200, Russell Coker wrote:
> > In my tests IDE drives topped out at 30MB/s for sustained reads from
> > the start of the drive two years ago, one year ago they were
> > approaching 40MB/s.
>
> It's a little higher than I expected.  How much does it vary from
> end-to-end?

See the following graph:
http://www.coker.com.au/~russell/hardware/46g.png

This shows testing a single 46G drive, two drives on different buses at the 
same time, and two drives on the same bus at the same time.  zcav (part of 
Bonnie++) was used to perform the tests.

> THat said, It's still a far cry from 100MB/s.

True.  S-ATA only needs it's speed for RAID attachments.

> > The real question is "how many people need such linear performance
> > with no seeks?".  Probably almost none.
>
> Across a decent fs, provided the layout isn't too bad, seeks really
> don't hurt that much for large reads.  With lots of spindles, it gets
> even better.

But how many people need such large reads?

The most disk intensive programs I use are Squid and GCC, Squid has an average 
file size of ~12K, and I suspect that the source files used by GCC aren't 
much bigger...

> > Cheap == single CPU.
>
> So put a single CPU in it then; or use some other MB.  64/66PCI isn't
> that hard to get or expensive.

Sure I can afford it if I really want it.  However the original discussion was 
about the lamentable fact that all the cheapest motherboards don't have it.  
So far no-one has presented any evidence of the <E100 motherbords having it.

> > In a quick web search of some companies I buy from, one sells a
> > single dual-CPU motherboard which costs three times as much as the
> > single-CPU motherboards (which have become amazingly cheap).
>
> The MB cost is a small part of the overall cost, especially if you're
> looking at 8x320GB drives.

True, but that's not what we were discussing.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

