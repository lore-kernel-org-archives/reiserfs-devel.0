From: Oleg Drokin <green@namesys.com>
Subject: Re: slightly [OT] highmem (was Re: 2.4.20 at kernel.org and data logging)
Date: Fri, 24 Jan 2003 10:50:19 +0300
Message-ID: <20030124105019.A5426@namesys.com>
References: <0E18D85A21D2874080456C3B8A12E83E01009FAD@cof110avexu4.global.avaya.com> <1042905430.31095.2343.camel@tiny.suse.com> <3E307657.2010200@mb.tu-ilmenau.de> <200301240040.14310.russell@coker.com.au> <3E308664.5010705@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12476-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E308664.5010705@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Russell Coker <russell@coker.com.au>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Fri, Jan 24, 2003 at 01:18:44AM +0100, Manuel Krause wrote:
> >You need highmem if you want more than 980M.  People usually refer to 1G, 
> >and if you don't mind wasting 20M then that's near enough.
> Mmh. So I wasn't really clear with my questions?
> Does it give advantages for 512M systems like mine if I enabled 
> higmem4GB / highmem64GB with "pae" or does it produce more overhead that 
> you mention below?

You get no advantage of course.
But lots of overhead. Rumours have it that 256M systems with highmem enabled
kernels (default for RedHat beta it seems) are swapping much more
then when the same kernel is built with highmem off.

Bye,
    Oleg
