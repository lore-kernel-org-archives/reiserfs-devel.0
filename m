From: Russell Coker <russell@coker.com.au>
Subject: Re: slightly [OT] highmem (was Re: 2.4.20 at kernel.org and data logging)
Date: Fri, 24 Jan 2003 01:24:32 +0100
Message-ID: <200301240124.32528.russell@coker.com.au>
References: <0E18D85A21D2874080456C3B8A12E83E01009FAD@cof110avexu4.global.avaya.com> <200301240040.14310.russell@coker.com.au> <3E308664.5010705@mb.tu-ilmenau.de>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E308664.5010705@mb.tu-ilmenau.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Fri, 24 Jan 2003 01:18, Manuel Krause wrote:
> On 01/24/2003 12:40 AM, Russell Coker wrote:
> > On Fri, 24 Jan 2003 00:10, Manuel Krause wrote:
> >>* Does enabled highmem support make any sense for mem<1G ?
> >
> > You need highmem if you want more than 980M.  People usually refer to 1G,
> > and if you don't mind wasting 20M then that's near enough.
>
> Mmh. So I wasn't really clear with my questions?
>
> Does it give advantages for 512M systems like mine if I enabled
> higmem4GB / highmem64GB with "pae" or does it produce more overhead that
> you mention below?

The sole advantage of highmem is the ability to access more than 980M of RAM.  
If you don't have >980M of RAM and don't plan to get more then there's no 
benefit for you.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

