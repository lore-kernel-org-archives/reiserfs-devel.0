From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Fibration questions
Date: Fri, 23 Jul 2004 12:28:49 +0300
Message-ID: <20040723092849.GK4990@nysv.org>
References: <20040721054418.1150715C23@mail03.powweb.com> <40FE0B47.3010600@slaphack.com> <40FF74BA.1050206@namesys.com> <16639.45062.695014.910604@laputa.namesys.com> <20040722143909.GE4990@nysv.org> <200407221957.i6MJvWHB028798@turing-police.cc.vt.edu> <20040722210515.GH4990@nysv.org> <200407222136.i6MLahRF015248@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200407222136.i6MLahRF015248@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

On Thu, Jul 22, 2004 at 05:36:43PM -0400, Valdis.Kletnieks@vt.edu wrote:
>
>This of course explains why IE is the premier web browser on 95% of the
>desktops, right? I mean, it's faster and more secure than all the alternatives,
>right? ;)

I think desktops for all the Joe Q. Averages are pretty much a different
scene from servers..

>And how many times has the global RAM market been put under severe strain
>because the latest Windows upgrade needed more RAM, so everybody went out and
>bought more RAM, and more RAM, and more RAM...

But Windows isn't the only thing that starts requiring more RAM, and
if you can buy more for a lesser price, that's what you'll do, regardless.

>The *correct* model is "Gee, let's buy this new box, because the salesman told
>us we need at least a Model 9000 to run this app, and *never* *mentioned* that
>with proper tuning, we could actually get by with a Model 6000 that costs half
>as much, and makes him half as much in sales commission....".

But that happens.

Maybe I'm the unexperienced obnoxious adolescent again, as I'm in only
my second job so far, but I've noticed that both employers have the
principle that if you can get anything, even the slightest guarantee,
that something is faster and more stable at a somewhat higher cost, it's 
worth it. Even if you'd be paying for a scapegoat-factor warranty.

OK, the first job didn't last _that_ long because it was a start-up
and started running out of money, so maybe we should have invested
in poorer servers, but then again, we got to see all our competitors
go down in flames. And the company was alive and kicking (with a smaller
staff) until it got bought by a bigger company, so it all ended quite well.

Tune even faster solution and get even more power, it'll last us
all weekend, before it goes obsolete...

>I mean.. *seriously* - think about it for a moment.  A co-worker recently
>spec'ed out a Dell 6600 for a project - paid US$20k or so for that one.  I
>needed another server for another project, ended up spec'ing a Dell 2650 for
>about US$7k.  Now *what* motivation does Dell have to sell both of us 2650's
>rather than trying to talk us both into 6600's?  (As it was, Dell got lucky I didn't
>go for a box even *smaller* than a 2650... at $7K, trying to save MORE money
>isn't worth it.  And I'm quite sure that Sun wasn't overjoyed when we

So a Dell 2650 could have could have handled what the 6600 did?

And they're still selling 6600s, how big an impact would Reiser4's speed
advantage have really on them? But it seems I'm over over my head now :)

But this isn't the only way of trying to get funding from a big company. 
Speed, that is.

>Also - in what way, exactly, is Reiser4 "more secure"? (Think carefully about
>the Linux security model here, and where the LSM hooks are - almost all of it
>happens at the VFS layer.  And there's the whole xattr debacle too...)

Should I have said safe instead of secure? Maybe that would be the better
English word for it.
Like being safe at power failures.

Then there's view security, which should be implemented.

I make my meager living as a small-time administrator and writer of
web (and similar) magick in Python, so I don't know why the xattrs 
couldn't be mapped to Reiser4 calls, but shouldn't it be technically possible?
Maybe that's a point on which to whore out at the prospect of big cash...

Maybe some potential sponsor would agree that the Reiser4 way is the
better way, they'd agree that Linux file systems are starting to suck
compared to, say, Apple's file system and they'd like to do something
about it.

Also asking for a smaller sum of money might be a tactic, "That other company
asked for x money and they got it for their trivial thing, but we're
asking for x/10 to do so much more." But it boils down to presenting
this in a convincing manner...

But these are just ideas, I have absolutely zero marketing experience
so this should not be taken as a presumptuous manual on how to do things :)

-- 
mjt

