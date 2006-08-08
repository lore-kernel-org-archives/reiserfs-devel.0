From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled fs, looks stable to me...)
Date: Tue, 8 Aug 2006 11:56:58 +0200
Message-ID: <20060808095658.GA6834@hermes.uziel.local>
References: <20060730223755.GA14386@hermes.uziel.local> <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com> <1256888283.20060801132818@wp.pl> <1154455834.10745.21.camel@localhost> <1692247736.20060801231255@wp.pl> <916440956.20060806162316@wp.pl> <20060807092435.GA11596@zeus.uziel.local> <44D773D6.4020504@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <reiserfs-list-return-29541-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44D773D6.4020504@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Maciej =?utf-8?Q?So=C5=82tysiak?= <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2006 at 01:09:42PM -0400, David Masover wrote:
> Christian Trefzer wrote:
> > Few people keep a 32MB ext2 for /boot purposes these days, so it
> > really is imperative that grub can read kernel images off a reiser4
> > /.
>=20
> I think there are patches, but I do keep a 32 meg ext3 for /boot,
> because it seems like no matter what FS I choose, there's some sort of
> caveat involving Grub.  I know when installing XFS as a root FS on
> Ubuntu, it talks about Grub problems...

New installations is what I had in mind there. People see they could use
something fancy, but their bootloader-du-jour won't take it. Bummer. The
warning message is the only thing keeping folks from running into a
broken installation. No good.


> I mean, having Grub support everything would be nice, but if you're
> reformatting anyway, I don't think it's that imperative.

Yeah, _if_ you are s.o. who knows how to turn a partition table upside
down without losing a single bit of data. Even then, it is quite a
hassle to move the start of a partition 4 cylinders up to make room for
an all-compatible ext2 /boot ; )

Grub is a bootloader and as such should (as an optimum) be able to grab
kernels off of any fs. I guess patches are accepted by upstream
developers?


Kind regards,
Chris

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUBRNhf6anY3eLOiwZcAQr/Zw//SPS4bO7Fx1535Vv7ibt7kN5KRQYrQ+19
qcd8aYhZYn8VBv/RgUQlvLryjLIFVo4IRm745u7yae2+fZfLPiEn/Ud9iW5aJpC9
EwDY97ix9ZvrWsXsl+XJiMV56FUg5+hG4WBBlXJYYGi0fW19Srx61SvswEXt7aFb
A922s0nb3nLt4H7lm0Y7p3Ajo3YmDZLg7bx/dizw7R4Iq5edHPDX+isQcuTb4KQd
vtlGLUovnYw+UMpQ1OztSbhvRgMcNPYppDR0IrfO2Wlf77x2MjqYgMkip9RmsDUZ
dcTaEHqxblDHGLzz7Fmw1TBn/a/dADLOd7Kcw6OsVEi+XPUwhibvvpxGyQqxDfvc
gRbIkusomXHlvG34uyd4oW76Dt7+w67or94hvsm0VP4RD5A2UXCBPRW0elmFmYX1
O00OY2VJSO/Fc0qxOnaoxhvuBOx3X0P+XOc/i8cFxpvY+7yuJcn7AQLuqQyfHgUd
PPzifh0hmI18D6xCKu2u1EwPpRBamwQDrCXdj0i7v40F/ZOnLfXO+Jl7LdBVeLjZ
NQz0rGBsKF9RsTyuy83cxoguhPEUC9JIv/4l4NBZ8Zr4KPdk7RJ0hHFLixmZ8Mca
eYx8NSzGoNTUnsqg43SQmgVzi9bfaNMrBg81gd64gZdAjY8kBD/zDmkZ0n23kkK9
VqDPw867bYs=
=aE8N
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

