From: Steve Langasek <vorlon@debian.org>
Subject: Re: Fwd: reiser4 non-free?
Date: Fri, 30 Apr 2004 13:15:28 -0500
Message-ID: <20040430181527.GB4002@tennyson.netexpress.net>
References: <20040424193246.GA2490@raptus.homelinux.org> <1083314051.23952.2.camel@faith>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1083314051.23952.2.camel@faith>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stewart Smith <stewart@flamingspork.com>
Cc: Domenico Andreoli <cavok@tiscali.it>, Hans Reiser <reiser@namesys.com>, Sami Liedes <sliedes@cc.hut.fi>, ed@debian.org, debian-legal@lists.debian.org, reiserfs-list@namesys.com

On Fri, Apr 30, 2004 at 06:34:11PM +1000, Stewart Smith wrote:
> On Sun, 2004-04-25 at 05:32, Domenico Andreoli wrote:
> > > Also, a clustering file system built to work on top of this file
> > > system shall be considered a derivative work for the purposes of
> > > interpreting the GPL license granted herein.  Plugins are also to be
> > > considered derivative works.  Share code or pay money, we give you the
> > > choice.

> > Surely a license cannot add anything to the set of derived works (if
> > the other work is not derived, the license obviously doesn't apply to
> > it and hence never gets to say it is derived; if it is, it is even
> > without the license saying so). However I believe -legal has not
> > considered text like this a problem before (I might be wrong though).

> It doesn't "add", it clarifies. i.e. if you build a clustered file
> system that does stuff specific to reiserfs (e.g. use the reiser4
> syscall), then that will be considered a derived work, and must be
> distributable under the GPL.

> Sure, you could go to court and argue that it isn't - but namesys have a
> clear clarification of what they consider, so I hope your lawyer is good
> :)

The term "derivative work" in the GPL is defined by copyright law and
case law.  Any author is free to use a different definition in his
license, but such a license is no longer congruent with the GPL.  If
the intent here is "these things are defined to be derivative works for
the purpose of this license" rather than "you are warned that we will
regard these things as derivative works when deciding whether to sue
you", then Hans Reiser has no legal authority to make such a definition
change on behalf of *other* copyright holders.  This is why, if a work
made available under this "clarified" GPL license requires code
copyrighted by others who released it under an unmodified GPL license,
Debian must regard that work as undistributable (at least in binary
form) without explicit consent from the other copyright holders.

I'm not sure what works are being distributed under this clarified
license, though, or what their status is as derivative works, so this
may not actually be an issue.

In any case, no one is contesting Hans Reiser's right to make such a
license clarification for his own code; the only question is what the
implications are for Debian's continued distribution of it.

> Think of it in the same light as the clarification in the kernel's copy
> of the GPL saying that userspace programs aren't derived. except here
> it's the other way around.

This is an additional license *grant*, and is therefore not equivalent
to what is discussed above.  The GPL is always compatible with *more*
permissive licenses.

-- 
Steve Langasek
postmodern programmer
