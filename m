From: Sam Vilain <sam@vilain.net>
Subject: Re: Reserved Blocks
Date: Tue, 17 Sep 2002 18:39:01 +0100
Message-ID: <20020917173901.92EABB24@hofmann.snowcra.sh>
References: <20020916102742.6538D2926@hofmann.snowcra.sh>
	<200209161450.g8GEorM4003750@turing-police.cc.vt.edu>
	<20020916161413.05CFC297C@hofmann.snowcra.sh>
	<200209161651.g8GGpKM4005169@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200209161651.g8GGpKM4005169@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote:

> > many Linux distributions out there).  As a sysadmin, you've just taken
> > over one of those systems.  How, exactly, do you go about splitting
> > the filesystems up?
> This of course depends on how much unallocated disk space you have handy.
> The method of attack will differ based on whether you have a free partition
> or not. You may be able to mount a "new" filesystem and copy it, or you may
> be forced to dump to auxillary storage and reload.

I know that, and you've just agreed that it's not straightforward, and
not possible if you don't have any unpartitioned space available to
you.

> > to reason.  If reiserfs lets me shrink the reserved blocks percentage
> > to 5% or 3% rather than 10%, fantastic.
> If in this day and age you're quibbling over the difference between
> 10% and 5%, I wonder if you've already tuned the 'NBPI' value to match
> [...]

I'm just pointing out that the limit is still there, it's just a
little smaller.  `Fantastic' was perhaps too strong a word.

> Maxstor just announced 320G drives.  If you need that last 32G
> *that* badly, it's time to buy another one - and then think about
> the backup issues. ;)                        ^^^^^^^^^^^^^^^^^^^^
  ^^^^^^^^^^^^^^^^^^
Heh.  Definitely.  Large disks are dangerous :-).  I prefer to buy
more smaller ones and mirror 'em.

> > If you've not administered enough systems to appreciate why you'd
> > want this, then fine.
> Hmm.. let's just say that I'd already been doing Unix for a while
> when I had Sun change a purchase order out from under me from
> Sun-2's to Sun-3's instead.

Oh, you got that too?  I was a bit pissed off when they insisted we
replaced our 490s with Sparc 5's and fucked up our nice tidy X.25
cabling.  I remember decommissioning the last shoebox QIC-150.  Oh,
and those nice Sun vacuum driven 9 tracks made loading reel to reel a
pleasure.

OK, I'll admit you may have a few years on me, but it's not the length
of time it's the love gone into the networks you've looked after, how
much you learned from them, and how much love you were able to return
to the networks.  Which is unquantifiable - so let's leave it at that.

> No, splitting up filesystems isn't perfect - especially if you don't
> have an underlying system like LVM so you can grow partitions as
> needed.  However, I still say that it's the best of a number of
> non-perfect solutions.

Well, I say implement all that don't introduce undue complexity and
see which one yields the best results after 5 to 10 years.  The
skilled system administrator will appreciate them all.

So there :-P
--
   Sam Vilain, sam@vilain.net     WWW: http://sam.vilain.net/
    7D74 2A09 B2D3 C30F F78E      GPG: http://sam.vilain.net/sam.asc
    278A A425 30A9 05B5 2F13

Real Programmers don`t write in RPG.  RPG is for gum-chewing dimwits
who maintain ancient payroll programs.
