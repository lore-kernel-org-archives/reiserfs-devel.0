From: Christophe Saout <christophe@saout.de>
Subject: Re: Quicker alternative to "find /"?
Date: Mon, 16 Aug 2004 17:33:50 +0200
Message-ID: <1092670430.19943.6.camel@leto.cs.pocnet.net>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
	 <1092660765.28417.4.camel@leto.cs.pocnet.net>
	 <1092661560.12138.24.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-HSrlhXHdSZ6L+yMC6wif"
Return-path: <reiserfs-list-return-20335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1092661560.12138.24.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Chris Mason <mason@suse.com>
Cc: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>, reiserfs-list@namesys.com

--=-HSrlhXHdSZ6L+yMC6wif
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Montag, den 16.08.2004, 09:06 -0400 schrieb Chris Mason:

> This gets tricky quickly.  Many threads reading many different
> directories at once will introduce a lot of seeks, since the directories
> are likely to be far apart on disk.  It is far better for the filesystem
> to realize a sequential scan of the directory is in progress and do
> smarter readahead based on that. =20

You are right. I just tried and the result was catastrophic (on ReiserFS
3). Probably because the other threads running concurrently make
readahead unusable (VM decides to drop it before it is used) or
something...?

On the contrary it works very well for reading the contents of a lot of
files.


--=-HSrlhXHdSZ6L+yMC6wif
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBINPdZCYBcts5dM0RAvYcAJ94jXBZJmbIQi0Ehco9Y9FmkKMC3QCfZZsc
v9if5FGjKE8o2taej/V/UA0=
=MvJp
-----END PGP SIGNATURE-----

--=-HSrlhXHdSZ6L+yMC6wif--

