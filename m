From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 can now bear with filled fs, looks stable to me...
Date: Sun, 30 Jul 2006 18:30:47 -0500
Message-ID: <44CD4127.9010202@slaphack.com>
References: <20060730223755.GA14386@hermes.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060730223755.GA14386@hermes.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Trefzer <ctrefzer@gmx.de>
Cc: reiserfs-list@namesys.com

Christian Trefzer wrote:
> Hi,
> 
> I booted 2.6.18-rc2-mm1 today and later filled up my /opt partition by
> accident, and guess what, reiser4 did not screw up : D

Hmm, I'm curious, though...  How does it react to a few billion files? 
Sorry, I can't test this, but I will be testing MythTV, if not now, then 
in a few weeks.

> Congratulations and thanks to the namesys developers! Hans, I can
> somewhat understand how you feel about your situation. Don't let
> frustration get in your way, your work is simply too great. You're an
[...]
> screwing over society ; ) Sometimes you just  have to swallow your pride
> instead of wasting your time by yelling at the rest of the world, and if
> "humble work" does not lead to success, there won't be any other way, I
> fear.

Amen.  I do not want to see Reiser4 not succeed because of politics, and 
it really looks like the only way to win the political war is not to 
play.  The technical stuff is really the last way in, but neither side 
has said anything technical in awhile.  The most technical things that 
have happened lately is Hans pointing to benchmarks and LKML pointing to 
ext3 "plugins".

I suspect part of this is simply the word "plugin" coming around to bite 
us in the ass, but whatever.  We're all tired of this fight.

> IMHO it would be best to deliver "quality patches" against all kinds of
> sources (distro kernels, vanilla -rcs maybe, etc.)

Well, we have the patches against vanilla, which seem to work well with 
at least a few other patches I've tried.

> and the entire
> patched source tarball as well, for people to download and build. Next
> step would be to provide binary packages, and repos for people to add to
> their package manager's source list. Until distros pick up their
> respective patch, this is as far as support can go, I guess.

That would actually be pretty good, for anyone making the conscious 
decision to use a filesystem.  Still need official distro support to get 
the people who don't (think they) care.

> So, what do you all say?

Sounds good.  I don't have any idea of the work required, either...
