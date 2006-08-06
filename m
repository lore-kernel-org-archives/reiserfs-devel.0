From: Clay Barnes <clay.barnes@gmail.com>
Subject: Re: Another article abour Reiser4 on linux.com
Date: Sat, 5 Aug 2006 17:44:42 -0700
Message-ID: <20060806004442.GQ17805@HAL_5000D.tc.ph.cox.net>
References: <87bqqzbaug.fsf@baldur.nicundtas.de>
	<44D4B154.6010005@slaphack.com> <28295017.20060805181722@wp.pl>
	<1254266559.20060805182204@wp.pl>
	<20060805180722.GN17805@HAL_5000D.tc.ph.cox.net>
	<44D5103C.2030201@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44D5103C.2030201@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Maciej =?utf-8?Q?So=C5=82tysiak?= <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

I think the core thing we have to have to win this argument is
a) A word that isn't *instantly* associated with banned things.
b) The ability to point to the technology to point to the design
and say look, "Look, it's *impossible* to use this design to put
binary modules into the kernel."  Even if it's as hard as ATI or
nVidia modules to put it in, that'll be enough to put up a fight
against inclusion.  The *only* way to win a polical/personal fight
is to remove any possible objection until resistance looks purely
stupid and wholly unsubtantiated.  Yes, things with reservations
have made it in in the past, but only when there is no personal
conflict.

I was just saying to my roomate that I was losing hope for Reiser4
because I didn't see an end to the politics any time soon.  I
would *love* to see Reiser 4 in the kernel, but you guys are
fighting a worse than uphill battle.  As long as there's a stalemate
the kernel people win, since no change is all they want.  It's 
also quite easy for them to find something new to complain about
if you solve their current problems.

There's only one possible way I see to get in.  You must ask for an
absolute list of things that are objectionable.  You should then
ask *before you start work*  about removal of any items that are 
either a) impossible, or b) illogical.  Once you've gotten the
official stamp of approval of the (posibly recvised) absolute list
of objections, you have to do it, completely and exactly.  If they
agreed that that is everything they find wrong and promised that
they would include Reiser4 if those issues were resolved, then they
really *have* to put it in then.

The down side of course is that they may ask for a lot.  Even if
it's more than you find fair, remember that they can effectively
kill your project by inaction.  Fair?  No.  The way the world
works?  Unfortunately, yes.

The core of all this is that rather than leaving an open-ended task
that can be expanded at will, they are given limits to how long the
objections can be spread out.  The bonus to you is that if anyone
tries to drag out issues after you've done the list, you can point
to the it and say "These were the limit of the real issues that
were raised.  Anything beyond is someone else's preference, and 
therefore their job to get included."

--Clay

On 17:40 Sat 05 Aug     , David Masover wrote:
> Clay Barnes wrote:
> >I like using a term that is already in an accepted part of the
> >kernel.  Extensions might smack of plugins a bit much, and we're
> >trying to avoid just doing a s/plugins/extensions/ of the
> >arguments we're seeing now.
> 
> We could do that with almost anything:
> 
> >>Or just modules... netfilter has modules that allow us to write
> >>very cool and weird stuff (like unclean match once was) and
> >>nobody complains.
> 
> Except that modules could also possibly remind people of proprietary 
> modules, like the nvidia/ATI/vmware stuff.
> 
> Still, if we allow netfilter, why not Reiser4 modules?
> 
> >>Another word could be 'hooks'
> 
> I don't think this would quite work.  A hook describes more the place 
> you connect to, whereas a module/plugin/whatever...
> 
> Think of it this way -- the hook is what a plugin would plug in to.
> 
> So it may not matter much what we name them, we're probably still going 
> to need that cut'n'paste argument.  Might be easier with "modules", though.
