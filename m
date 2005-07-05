From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: XFS corruption during power-blackout
Date: Tue, 5 Jul 2005 21:24:48 +0200
Message-ID: <200507052124.49199.Dieter.Nuetzel@hamburg.de>
References: <20050705154919.GA13262@kevlar.burdell.org> <200507051725.UAA07417@raad.intranet> <20050705181057.GA16422@kevlar.burdell.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050705181057.GA16422@kevlar.burdell.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Sonny Rao <sonny@burdell.org>, Al Boldi <a1426z@gawab.com>, 'Jens Axboe' <axboe@suse.de>, 'David Masover' <ninja@slaphack.com>, 'Chris Wedgwood' <cw@f00f.org>, 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

Am Dienstag, 5. Juli 2005 20:10 schrieb Sonny Rao:
> On Tue, Jul 05, 2005 at 08:25:11PM +0300, Al Boldi wrote:
> > Sonny Rao wrote: {
> >
> > > > >On Wed, Jun 29, 2005 at 07:53:09AM +0300, Al Boldi wrote:
> > > > >>What I found were 4 things in the dest dir:
> > > > >>1. Missing Dirs,Files. That's OK.
> > > > >>2. Files of size 0. That's acceptable.
> > > > >>3. Corrupted Files. That's unacceptable.
> > > > >>4. Corrupted Files with original fingerprint. That's ABSOLUTELY
> > > > >>unacceptable.
> > >
> > > 2. Moral of the story is: What's ext3 doing the others aren't?
> >
> > Ext3 has stronger guaranties than basic filesystem consistency.
> > I.e. in ordered mode, file data is always written before metadata, so t=
he
> > worst that could happen is a growing file's new data is written but the
> > metadata isn't updated before a power failure... so the new writes
> > wouldn't be seen afterwards.
> >
> > }
> >
> > Sonny,
> > Thanks for you input!
> > Is there an option in XFS,ReiserFS,JFS to enable ordered mode?
>
> I beleive in newer 2.6 kernels that Reiser has ordered mode (IIRC, courte=
sy
> of Chris Mason),

And SuSE, ack.

ftp://ftp.suse.com/pub/people/mason/patches/data-logging

They are around some time ;-)

> but XFS and JFS do not support it.  I seem to remember=20
> Shaggy (JFS maintainer) saying in older 2.4 kernels he tried to write
> file data before metadata but had to change that behavior in 2.6, not
> really sure why or anything beyond that.

Greetings,
	Dieter

=2D-=20
Dieter N=FCtzel
@home: <Dieter () nuetzel-hh ! de>
