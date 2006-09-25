From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: BitTorrent+Reiser4: curiouser and curiouser
Date: Mon, 25 Sep 2006 22:03:30 +0100
Message-ID: <1159218210.3504.5.camel@localhost.localdomain>
References: <4513827A.50809@slaphack.com>  <ef9ajj$ccv$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-TpezktUW/5riDSaiTVhi"
Return-path: <reiserfs-list-return-29979-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ef9ajj$ccv$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-TpezktUW/5riDSaiTVhi
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-09-25 at 21:27 +0200, Nicolas STRANSKY wrote:
> Le 09/22/2006 08:28 AM, David Masover a =E9crit :
> > Azureus had a problem.  Once it got up to a good clip downloading, it
> > would thrash the disk.  It would thrash the disk, and the system, so
> > hard that even web browsing was difficult, due to disk access being
> > many, many times slower than Internet access, even an Internet which is
> > being hogged by BitTorrent.
>=20
> Just to add my 2=A2, I have exactly the same problem with azureus + r4.
> Azureus starts to make constant disk writes at ~500-700kB/s when
> downloading a file on a r4 partition.
> I had opened a bugreport for azureus, but it now appears that this
> problem is reiser4 specific as I cannot reproduce it with other filesyste=
ms.
> https://sourceforge.net/tracker/?func=3Ddetail&atid=3D575154&aid=3D155822=
7&group_id=3D84122
>=20

I get this problem too. I believe I first noticed it when the fsync
trouble started.

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-TpezktUW/5riDSaiTVhi
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFGEQi5OI9vmOoVqERAjUzAJ9rVt69ltsQ+N3FqbMCPqQh8uatwwCg5Gtj
neo8qbaUtb3HFO5MAL2p3M8=
=t211
-----END PGP SIGNATURE-----

--=-TpezktUW/5riDSaiTVhi--

