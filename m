From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 24 Jun 2002 15:05:33 -0400
Message-ID: <1024945533.9008.10.camel@tiny>
References: <200206222202.56577.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10823-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200206222202.56577.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Sat, 2002-06-22 at 16:02, Dieter N=FCtzel wrote:
> On Friday, Chris wrote:
>=20
> > ftp.suse.com/pub/people/mason/patches/data-logging has a new
> > beta-data-logging-10.diff.gz
> >
> > This one:
> >
> > compiles as a module (thanks Jeff Mahoney)
> >
> > has a highmem bug fixed with data=3Djournal (help from Andrea)
>=20
> Hello Chris,
>=20
> should I run this with -aa kernel?

You can, the differences are minor, just interdiff from the last data
logging patch and apply the incremental onto the aa data logging patch.=20
I ran out of time before leaving for ottawa, so I didn't get the chance
to make an aa patch.

>=20
> > Fixes a problem with relocated/different sized journal devices.  This
> > was a merge error on my part.
> >
> > One tester reports a hang that I can't reproduce here, I'm still trying=
.
>=20
> You do not mean me (page coloring)?

No, this was a large 8 way smp machine. =20

-chris


