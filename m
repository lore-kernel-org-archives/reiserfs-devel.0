From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Tue, 26 Oct 2004 08:45:19 -0600
Message-ID: <1098801919.2610.2.camel@localhost.localdomain>
References: <20040819074027.8429715D94@mail03.powweb.com>
	 <41248D43.3040905@dgreaves.com> <4124D255.2060401@comcast.net>
	 <412597F9.1010707@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-LzBBdhpyMybwOefEmxvL"
Return-path: <reiserfs-list-return-22180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412597F9.1010707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--=-LzBBdhpyMybwOefEmxvL
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-08-20 at 00:19, Hans Reiser wrote:
> George Beshers wrote:
> >>> Masked Processes
> >>> - May not create hard links.
> >>> - Child processes [of a masked process] must inherit the parent's=20
> >>>  "mask bit" and mask definition.
> >>> =20
> >> remind me - what is the mask tied to? UID/GID, EUID, PID, PGID?=20
> >> filesystem?
> >> Hans actually says it's derived from the executable.
> >> What if it changes between two processes starting?
> >> Does the running processes mask change? (cf chmod a file - seems=20
> >> reasonable but...)
> >> I'd think it needs to be pretty atomic...
> >> In fact, maybe changing masks on a running (mounted?) system is a=20
> >> potential security hole and forbidden?
> >> I think I could think of race examples.
> >
> > I am disinclined to tackle changing masks on the fly until I have a=20
> > compelling story
> > to justify the work.
>=20
> It is less work to allow changing them on the fly than to not do so,=20
> since they are stored in the fs, not something loaded into the process=20
> state.

Yes.

Additionally, if they could not be changed "on-the-fly", then in
practical terms this would force an admin to restart a daemon when a
change is made.  That would not be very friendly.
--=20
Lamont R. Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs, L.C. http://www.GuruLabs.com/

--=-LzBBdhpyMybwOefEmxvL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBfmL++YBsl9wN1AkRAhhDAJ9hF+gNf0As5Ga4rWimsli2+JtU5wCePzZ8
X9bt2CEAEi+djhLcw7e9o5I=
=FziB
-----END PGP SIGNATURE-----

--=-LzBBdhpyMybwOefEmxvL--

