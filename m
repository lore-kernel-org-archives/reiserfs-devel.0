From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: slightly [OT] highmem (was Re: 2.4.20 at kernel.org and data logging)
Date: Fri, 24 Jan 2003 18:15:05 +0100
Message-ID: <200301241815.05859.Dieter.Nuetzel@hamburg.de>
References: <0E18D85A21D2874080456C3B8A12E83E01009FAD@cof110avexu4.global.avaya.com> <200301241800.19072.Dieter.Nuetzel@hamburg.de> <20030124200338.A4338@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030124200338.A4338@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Russell Coker <russell@coker.com.au>, reiserfs-list <reiserfs-list@namesys.com>

Am Freitag, 24. Januar 2003 18:03 schrieb Oleg Drokin:
> Hello!
>
> On Fri, Jan 24, 2003 at 06:00:19PM +0100, Dieter N?tzel wrote:
> > > > higmem4GB / highmem64GB with "pae" or does it produce more overhead
> > > > that you mention below?
> > >
> > > You get no advantage of course.
> > > But lots of overhead. Rumours have it that 256M systems with highmem
> > > enabled kernels (default for RedHat beta it seems) are swapping much
> > > more then when the same kernel is built with highmem off.
> >
> > But that could be because they have forgotten to enabled HIGHMEM IO?
> > See Andrea Ancangeli's -aa kernels.
>
> What HIGHMEM IO? There is exactly NO highmem, so sighmem IO code won't be
> used.

Yes, you are right. There isn't any physical highmem.
Shows how stupid the above idea is.

Manuel's system haven't have highmem, too.
So he should see the performance degradation, too.

Thanks,
	Dieter


2.4.20-aa1 for example:

CONFIG_HIGHIO:

If you want to be able to do I/O to high memory pages, say Y.
Otherwise low memory pages are used as bounce buffers causing a
degrade in performance.
