From: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Subject: Re: Reiserfs concurrent write problems
Date: Mon, 26 Apr 2004 12:12:49 -0600
Message-ID: <20040426181249.GA24101@em.ca>
References: <20040426172648.GA22918@em.ca> <1083000970.30344.50.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <reiserfs-list-return-18228-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1083000970.30344.50.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2004 at 01:36:11PM -0400, Chris Mason wrote:
> Please try 2.6.6-rc2-mm2, which has new block allocator patches and
> other speedups.

Thanks.  I'm compiling this now.

> The default mount options should work best for you, but this might work
> too:
>=20
> mount -o alloc=3Dskip_busy:dirid_groups /dev/xxx /mnt

I'll try that.

> Depending on the file size,=20
>=20
> mount -o notail can make a huge difference too.

They are mostly small files, averaging about 12.5kB.  I am already using
	mount -o noatime,notail

--=20
Bruce Guenter <bruceg@em.ca> http://em.ca/~bruceg/ http://untroubled.org/
OpenPGP key: 699980E8 / D0B7 C8DD 365D A395 29DA  2E2A E96F B2DC 6999 80E8

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAjVEg6W+y3GmZgOgRAv7AAKCbL4hIyi4eU4ZycHYJ6xSod3rqYwCfQOjG
arxKCoIEYHlysST2U7YYhIY=
=mNRz
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
