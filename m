From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 17:07:37 +0300
Message-ID: <20030228170737.B11516@namesys.com>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281500.37328.liviu.voicu@huji.ac.il> <20030228140627.I24291@humilis> <200302281511.56997.liviu.voicu@huji.ac.il>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302281511.56997.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Hello!

On Fri, Feb 28, 2003 at 03:11:56PM +0200, Voicu Liviu wrote:

> > You said you had problem with that too, but that is really weird as X
> > would not want 100% cpu.
> > In an other mail you write that your compiles are very fast. If a new
> > kernel doesn't solve your problem, and compiles are very fast anyway, I
> > would say: don't do that then (the renice to -10), or renice to -5 or
> > some value which does not bother you.
> I don't want to renice compilation threads, only X to get more responsives 
> from it...but this locks me out :-)

Hm, but if you do not renice X, it works ok?

I just noticed:
> Mem:   255948k av,  250540k used,    5408k free,       0k shrd,   28344k buff
>         59512k active,             119096k inactive
> Swap:  514072k av,     144k used,  513928k free                  122280k

So if you add X and kde (and other heavy stuff to that), you basically have no RAM,
so probably all the slowdown is from constant swapping.
Just run top when you see the interactive slowdown and look at the swapin/swapout ratio
and swap isage in top & /proc/stat

Bye,
    Oleg
