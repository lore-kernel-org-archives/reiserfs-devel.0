From: Oleg Drokin <green@namesys.com>
Subject: Re: slightly [OT] highmem (was Re: 2.4.20 at kernel.org and data logging)
Date: Fri, 24 Jan 2003 20:03:38 +0300
Message-ID: <20030124200338.A4338@namesys.com>
References: <0E18D85A21D2874080456C3B8A12E83E01009FAD@cof110avexu4.global.avaya.com> <3E308664.5010705@mb.tu-ilmenau.de> <20030124105019.A5426@namesys.com> <200301241800.19072.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200301241800.19072.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Russell Coker <russell@coker.com.au>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Fri, Jan 24, 2003 at 06:00:19PM +0100, Dieter N?tzel wrote:
> > > higmem4GB / highmem64GB with "pae" or does it produce more overhead that
> > > you mention below?
> > You get no advantage of course.
> > But lots of overhead. Rumours have it that 256M systems with highmem
> > enabled kernels (default for RedHat beta it seems) are swapping much more
> > then when the same kernel is built with highmem off.
> But that could be because they have forgotten to enabled HIGHMEM IO?
> See Andrea Ancangeli's -aa kernels.

What HIGHMEM IO? There is exactly NO highmem, so sighmem IO code won't be used.

Bye,
    Oleg
