From: Redeeman <redeeman@metanurb.dk>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Sun, 07 Mar 2004 13:15:54 +0100
Message-ID: <1078661754.5798.0.camel@redeeman.linux.dk>
References: <4044119D.6050502@andrew.cmu.edu> <4044366B.3000405@namesys.com>
	 <4044B787.7080301@andrew.cmu.edu> <20040303234104.GD1875@convergence.de>
	 <20040305184643.GA4758@openzaurus.ucw.cz>
	 <1078586701.6237.0.camel@redeeman.linux.dk>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078586701.6237.0.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>


On Fri, 2004-03-05 at 19:46, Pavel Machek wrote:
> Hi!
> 
> > It would be nice if someone with more profound knowledge could comment
> > on this, but my understanding of the problem is:
> > 
> > - journaled filesystems can only work when they can enforce that
> >   journal data is written to the platters at specifc times wrt
> >   normal data writes
> > - IDE write caching makes the disk "lie" to the kernel, i.e. it says
> >   "I've written the data" when it was only put in the cache
> > - now if a *power failure* keeps the disk from writing the cache
> >   contents to the platter, the fs and journal are inconsistent
> >   (a kernel crash would not cause this problem because the disk can
> >   still write the cache contents to the platters)
> > - at next mount time the fs will read the journal from the disk
> >   and try to use it to bring the fs into a consistent state;
> >   however, since the journal on disk is not guaranteed to be up to date
> >   this can *fail*  (I have no idea what various fs implementations do
> >   to handle this; I suspect they at least refuse to mount and require
> >   you to manually run fsck. Or they don't notice and let you work
> >   with a corrupt filesystem until they blow up.)
> > 
> > Right?  Or is this just paranoia?
> 
> Twice a year I fsck my reiser drives, and yes there's some corruption there.
> So you are right, and its not paranoia.

AAAAARRRRRRGGGGHHHHHH!!!
i have a reiserfs partition with my maildir, i have often lost power,
but i havent fscked, will that mean great chances that i have lost
something??
-- 
Regards, Redeeman
()  ascii ribbon campaign - against html e-mail 
/\                        - against microsoft attachments

