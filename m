From: Redeeman <redeeman@metanurb.dk>
Subject: Re: Again, some bad Reiser4 (ReiserFS) 'reviews'
Date: Mon, 19 Jul 2004 13:52:00 +0200
Message-ID: <1090237920.11153.0.camel@localhost>
References: <200407150025.30908.Dieter.Nuetzel@hamburg.de>
	 <40F6C548.7030805@namesys.com>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19683-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40F6C548.7030805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Thu, 2004-07-15 at 10:56 -0700, Hans Reiser wrote:
> Dieter N=FCtzel wrote:
>=20
> >http://rufus.hackish.org/wiki/2.6FileSystemBenchmarks
> >
> >Greetings,
> >	Dieter
> >
> >
> > =20
> >
> I think he has an fsync intensive workload, which reiser4 is not good at =

> because we haven't bothered with it yet, and we care more about maturing =

> the atomic functionality.  I have no idea what ccache does with the fs.  =

> Does it use fsync?
>=20
> How he got tar to be slow is hard to understand, I don't remember seeing =

> a slow tar using reiser4, does anyone else?  I am guessing he created=20
> the tarball using ext2, and didn't know that readdir order matters and=20
> affects the tarball, and that he should create it on the filesystem=20
> being benchmarked.  Maybe the tarball ordering also affects subsequent=20
> compiles, I don't know.
wow, i didnt know i had to create on the filesystem i benchmark, i
always just created on what i had, and that werent reiser4, but still
reiser4 proved to be the fastest (alot faster than the other)

>=20
> zam, would you confirm that the fibration plugin is our current default=20
> plugin?
>=20
> Hans
>=20
--=20
Redeeman <redeeman@metanurb.dk>

