From: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Subject: Re: Reiserfs concurrent write problems
Date: Tue, 27 Apr 2004 10:15:44 -0600
Message-ID: <20040427161544.GA27873@em.ca>
References: <20040426172648.GA22918@em.ca> <1083000970.30344.50.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <reiserfs-list-return-18251-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1083000970.30344.50.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2004 at 01:36:11PM -0400, Chris Mason wrote:
> Please try 2.6.6-rc2-mm2, which has new block allocator patches and
> other speedups.
>=20
> The default mount options should work best for you, but this might work
> too:
>=20
> mount -o alloc=3Dskip_busy:dirid_groups /dev/xxx /mnt

Using the new kernel and the above mount options boosted the write
performance of ReiserFS, almost to the level of XFS.  At the highest
concurrency level, the reading performance dropped, but it's still much
faster than the other FSs.

Thanks for your help.
--=20
Bruce Guenter <bruceg@em.ca> http://em.ca/~bruceg/ http://untroubled.org/
OpenPGP key: 699980E8 / D0B7 C8DD 365D A395 29DA  2E2A E96F B2DC 6999 80E8

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAjocw6W+y3GmZgOgRAuvUAJ9Z7PUZJ4iq840Vci/imFBMkx4UEACfRSYg
NRS8+6kY1NUvC1Bxi04iVek=
=Awll
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
