From: Chris Mason <mason@suse.com>
Subject: Re: Horrible ftruncate performance
Date: 23 Jul 2003 12:20:46 -0400
Message-ID: <1058977246.2690.4.camel@tiny.suse.com>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu>
	 <200307151848.59027.Dieter.Nuetzel@hamburg.de>
	 <20030715170540.GA1213@namesys.com>  <3F1D69AC.5040302@namesys.com>
	 <1058892649.5042.29.camel@tiny.suse.com>  <3F1D7DD8.3010806@namesys.com>
	 <1058898249.2749.2.camel@tiny.suse.com>  <3F1E27BA.3070603@namesys.com>
	 <1058971137.2624.9.camel@tiny.suse.com>  <3F1EA1DB.2020505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1EA1DB.2020505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

On Wed, 2003-07-23 at 10:55, Hans Reiser wrote:

> >They have pointers to 4k blocks, we have pointers to 4k blocks, our
> >pointers should be able to do everything their pointers can do ;-)
> >
> >  
> >
> If you have to write 200MB of zeros to a file instead of 32 bytes, 
> performance is going to be bad no matter what you do.
> 
> We don't have resources for duplicating work, or even supporting 
> duplicate work.  We don't have funding right now from anyone.
> 
> V4 works.  V4 is faster than anything else out there by a lot.  If we 
> get it debugged, we might have one of those licenses in addition to the 
> GPL come out of nowhere again, and survive.   We have no resources for 
> any other activity besides debugging and shipping and promoting V4, or 
> fixing V3 bugs.  Hole performance improvement using extents is a feature 
> not a bug.

Hans, my point is that other people might be interested in doing the
work and testing the code, or at least discussing ways to fix the
problem without format changes.  Please don't shoot these discussions
down, and give the people interested in improvements to v3 a chance to
discuss it.

v4 is beta and not in any way a viable choice for people today.  It
might end up being the coolest filesystem ever made, but we need to be
realistic about supporting the users we've already got.

-chris


