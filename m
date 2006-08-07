From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled fs, looks stable to me...)
Date: Mon, 7 Aug 2006 11:24:35 +0200
Message-ID: <20060807092435.GA11596@zeus.uziel.local>
References: <20060730223755.GA14386@hermes.uziel.local> <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com> <1256888283.20060801132818@wp.pl> <1154455834.10745.21.camel@localhost> <1692247736.20060801231255@wp.pl> <916440956.20060806162316@wp.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <reiserfs-list-return-29524-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <916440956.20060806162316@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Maciej =?utf-8?Q?So=C5=82tysiak?= <pysiak.satriani@wp.pl>
Cc: reiserfs-list@namesys.com

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 06, 2006 at 04:23:16PM +0200, Maciej So=C5=82tysiak wrote:
> I tried to create a kernel package with reiser4 for ubuntu-server (dapper)
> They ship a 2.6.15 (heavily modified) kernel upon which the current
> reiser4-for-2.6.17-3.patch applies fine but unfortunately miscompiles, eg.
> fs/reiser4/plugin/file_ops_readdir.c: In function 'llseek_common_dir':
> fs/reiser4/plugin/file_ops_readdir.c:486: warning: implicit declaration o=
f function 'mutex_lock'
> fs/reiser4/plugin/file_ops_readdir.c:486: error: 'struct inode' has no me=
mber named 'i_mutex'
> fs/reiser4/plugin/file_ops_readdir.c:508: warning: implicit declaration o=
f function 'mutex_unlock'
> fs/reiser4/plugin/file_ops_readdir.c:508: error: 'struct inode' has no me=
mber named 'i_mutex'
>=20
> I bet these are trivial to fix and I will try to do this but my time cons=
traints
> currently prevent me from doing that.

Guess these won't be so easy, afaik 2.6.15 lacks the semaphore->mutex
transition.


> There also is an issue with grub. The kernel alone is fine for creating p=
artitions
> (or loop devices) but with grub not patched we can't install boot partiti=
ons. No biggy,
> I guess, but still a problem.

Few people keep a 32MB ext2 for /boot purposes these days, so it really
is imperative that grub can read kernel images off a reiser4 /.


> I could create a vanilla + reiser4 kernel package easily but that would b=
e stripped
> off of the important dapper/debian patches and that is a no-no for dapper=
 users, I guess.
> At least for non-guru freaks who run their own, modified kernels.

Sure. The best thing might be to back-port "internal" fixes in
fs/reiser4/ to reiser4-for-2.6.15-x so the API calls match the kernel.
Patching 2.6.15 with a 2.6.17 patch is a no-no.
=20
But you _are_ taking a step forward, and your effort is appreciated : D

Kind regards,
Chris

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUBRNcG06nY3eLOiwZcAQqp2BAAn0BUD2TgslvguwRPKpZV5FMXY3y4bETb
HJBw0P2/fwdBlwsgB4fEJhxvX1tnoSRwuJ05Gy2n7cCgxSy3ZrLCETHBGw6d8pvR
A42oJd1zqYwV6w1p05XUKP6fPX5sjwdKqebKGREtjEPK3YVYQTXK7y0JC05Oe/fX
5Y5jMog1zolshxzGOmwj0phJkkAfVmaP/mcv/rHb/p81BPk/16ekKYBiSbT33t9U
ytwmkgVtKBz0CnKRVqIX3uZ9XnwvfC3o3wKL3RzKHCLaLmV/KBgT17Qy8AfRwi9C
Rt5AG+9pTR0DRJ8zJAB7qbtAg0eBMFXBroGhrM7oSgvF/k8L34y2MuF1/zzvspH2
CYiB4m135dioSGvtoZhMuW1X/x9Wcsk/XnuNAhOkIsXxd7giYjxuo3RAV7UVZJ66
9PbbZa1VibscjV1W6gm5Gy1ccuP1dSzRZBtQ2kUCcohOsIyzU+Ule9+rARL8gSP4
uK+96x7NuVQa3GqfHSkuRyyrhDY8jFiAaF7w104SIpt8jsokG2zaqsypSdMOnYMG
nlYEEzDq/TK8zoJsK0ayLQD2HOQCwoXgMGyfjq6sSv6SPYlzWZ202IM4INhdolUc
uysTcsViQ4If+cUlIXhn4bDYBbKdqU7g6EnnAv3/V/BXkSyDt21OzDjjUlaaI+Sl
hlwAHNfOwa4=
=MRW0
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--

