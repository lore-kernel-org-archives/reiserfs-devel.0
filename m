From: Chris Mason <mason@suse.com>
Subject: Re: Symbol collisions in patch?
Date: 03 Apr 2002 08:38:26 -0500
Message-ID: <1017841106.26533.92.camel@tiny>
References: <Pine.LNX.4.44.0204022130330.32751-100000@conn6m.toms.net> 
	<20020403093210.B5947@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020403093210.B5947@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Tom Oehser <tom@toms.net>, reiserfs-list@namesys.com

On Wed, 2002-04-03 at 00:32, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Apr 02, 2002 at 09:41:55PM -0500, Tom Oehser wrote:
> 
> > 2) There are symbol collisions that prevent supporting reiser AND ext3fs,
> >    *even as a module*.  Come on, guys, symbol collisions between the two
> >    most popular journalling filesystems?  Pa-thetic...
> 
> I believe this is ext3 problem, because reiserfs occupied these symbol first ;)
> ext3 appeared a little bit later then reiserfs.

Shrug, for 2.2.x, both filesystems grew within a short time of each
other.  I thought ext3 resolved the conflicts (at least they did in
2.4.x).

> 
> > 3) There is no support for version 3.6 filesystems in 2.2.x, so, what good
> >    is reiser support on my rescue diskette, if 2.4.x users can't use it?
> 
> This is even documented. v3.6 format is for 2.4+ kernels only.
> If you concerned that much about the issue and needs this v3.6 support,
> you might try to convice Hans about that.
> One of teh best ways to convice Hans to provice v3.6 support in 2.2 kernels
> is to pay for the work (details are at http://www.namesys.com/support.html)

Tom, putting the 3.6.x format into the 2.2.x code is a huge amount of
work.  It took us months to get things stable in 2.4.x.  If anyone on
the list wants to do the port, I'll supply beer for the party when
you're done.
 
> > So, the rest of the world is still willing to devote *some* effort to
> > supporting 2.0.x, (and libc5, for that matter), and *plenty* of effort to
> > supporting 2.2.x, but it seems that reiser doesn't isn't or won't...

We support the code we've written.  So, if someone finds a bug in 2.2.x
reiserfs, we fix it.  It is unlikely that new features (3.6.x, relocated
journals, non 4k block sizes) will be ported back to kernels before
2.4.x.

-chris


