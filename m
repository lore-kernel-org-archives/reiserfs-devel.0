From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser acceptance (was Re: Atomic filesystem or not)
Date: Wed, 21 Jul 2004 11:25:51 +0300
Message-ID: <20040721082551.GZ4990@nysv.org>
References: <200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com> <40F6E06B.1080505@namesys.com> <40F73370.2090600@slaphack.com> <40FB876E.1050200@namesys.com> <40FC3730.80908@slaphack.com> <20040720065253.GW4990@nysv.org> <40FCCC4F.6040709@slaphack.com> <20040720080357.GX4990@nysv.org> <40FDFAB1.9050300@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40FDFAB1.9050300@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

On Wed, Jul 21, 2004 at 12:10:09AM -0500, David Masover wrote:

>Wrong.  sys_reiser5 could require a totally different set of arguments
>than sys_reiser4.  Suppose it's like this:

You are right.

>If only, if only.  But we discussed libraries, and it seems Hans wants
>apps patched to use sys_reiser4 directly.  Right?

Is there a performance reason behind this?
Also, one less library dependancy is one less library dependancy...
Beside the fact that direct patching is a stronger vote for
standardizing.

>Imagine if Tesla had been able to play that game.  This is why democracy
>currently sucks -- the honest people won't be able to play the game, so
>of course there are mostly dishonest politicians!

So we have the Free Software movement that can't play the corporate
software game. But revolutions have been known to happen.

>Oops, offtopic :X

A strong maybe.

>Why, when it's automated, stable, and ultimately makes your box faster?

The time that goes to compiling may even save the 1% speedup that
the new binaries bring along. Remember, that Debian has different packages
with different optimizations where it actually matters.
And I can make my own packages with apt-get source --build if I need.

So I just don't like to sit on my arse for hours while something compiles
just so I can have a next-to-imaginary speed-up :)

>And I abhor the notion of having packages excluded because someone else
>doesn't like the license.

Amen to that. cf. DFSG/Debian.

>But I wasn't trying to sell Gentoo as a distro to actually use, only one
>to send patches to.

And I think it's a good point, Gentoo users are most likely very good
testers.

>Just tell them that you are a (woody|sarge|sid)-based very unstable
>reiser4-powered distro.

This is a bit like defeating the purpose of Debian stable, and it
takes a bit of time to make all these packages. But sure, there may
be some automatization to build these backports easily; if there isn't
I'd have to invent one, and still no-one would be forced to use it.

So, now we have the strategy, now let's wait for the call to arms.

-- 
mjt

