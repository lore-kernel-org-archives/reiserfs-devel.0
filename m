From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: File System shootout...
Date: Mon, 16 Feb 2004 14:23:22 +0100
Message-ID: <200402161423.22333.Dieter.Nuetzel@hamburg.de>
References: <1239031.1065786947952.JavaMail.nobody@franzjosef> <1066166147.29222.177.camel@mikeb.staff.netnation.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1066166147.29222.177.camel@mikeb.staff.netnation.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: mikeb@netnation.com
Cc: reiserfs-list@namesys.com

Am Dienstag, 14. Oktober 2003 23:15 schrieb Mike Benoit:
> On Fri, 2003-10-10 at 04:55, Dieter N=FCtzel wrote:
> > > Mike Benoit writes:
> > >  > To all those who are interested, here are the results of the
> > >  > benchmarks I've been running over the last week between all the
> > >  > major file systems (and there different mount options) using both
> > >  > Bonnie++ and IOzone. More tests are currently underway, so the
> > >  > results will be updated as they come in.
> > >  >
> > >  > Hopefully these results will give you a good comparative overview =
of
> > >  > each of the different file systems strengths and weaknesses.
> > >  >
> > >  > http://fsbench.netnation.com/
> > >
> > > I should probably add that I am getting quite different bonnie++
> > > results for reiser4 vs. ext3:
> > >
> > > on the box with 128M of ram:
> >
> > Why no numbers for ReiserFS 3.xx plus data-logging patch
> > (odered/journal/writeback, e.g. current code) like ext3?
>
> Do you have a link to the 2.6.0-test5+ data-logging patch?

v3 experimental data=3Dordered and logging speedups for 2.6.1
http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D107453067611552&w=3D2

And following posts.

Hope it's not too late or double post...;-)

Running very well with SuSE's 9.0 2.6.2-6 on RAID0 and RAID1, U320 15k.

Cheers,
	Dieter
