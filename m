From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: reiserfs rebuild-tree time?
Date: Thu, 11 Mar 2004 01:18:50 -0600
Message-ID: <20040311071850.GB13119@dbz.icequake.net>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Return-path: <reiserfs-list-return-17171-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2004 at 01:27:47AM -0500, jlewis@lewis.org wrote:
>=20
> The system is a dual PIII-733.  Other than the rebuild and a few admins
> ssh'd in to keep an eye on it, the system is idle.  I'm not seeing a whole
> lot of activity (1MB/s in, 1MB/5s or so out according to vmstat) and CPU
> idle 98%.  If CPU and disk i/o aren't limiting it, what's causing the
> rebuild-tree to take so long?

Maybe it's time to test the HDD?  A quick run through with the
manufacturer's util will at least rule out failing hardware before going
further.

--=20
Ryan Underwood, <nemesis@icequake.net>

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAUBLaIonHnh+67jkRAvBUAJoDqufB4N80Yg/cIJ4FPjtrE52/9ACZAU1b
Zm8jQ5r573CIgSCsUCO18AE=
=TLcY
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
