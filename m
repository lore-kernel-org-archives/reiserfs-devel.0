From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 22:38:12 +0200
Message-ID: <1093552692.13881.43.camel@leto.cs.pocnet.net>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
	 <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com>
	 <20040826014542.4bfe7cc3.akpm@osdl.org> <412DAC59.4010508@namesys.com>
	 <1093548414.5678.74.camel@krustophenia.net>
	 <20040826203017.GA14361@school.ioffe.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-iRiqRY6UDa+JwpiIC1hF"
Return-path: <reiserfs-list-return-20794-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826203017.GA14361@school.ioffe.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Dmitry Baryshkov <mitya@school.ioffe.ru>
Cc: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

--=-iRiqRY6UDa+JwpiIC1hF
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 27.08.2004, 00:30 +0400 schrieb Dmitry Baryshkov:

> Another example: Can ext2/etx3/reiserfsv3/xfs be implemented as reiser4
> plugins? From Hans' words it seems so. If this is correct, then maybe
> reiser4 core should be updated to completely replace current VFS layer?
> Then it's a good point to create a branch (in old development model it
> would be 2.7, dunno for new :), replace VFS layer with reiser4 core, and
> rewrite all (or at least most used) FS as reiser4 plugins. Then
> everybody will be happy.
>=20
> But this looks too good to be true. Perhaps I misunderstood Hans' words
> aboud 'new disk format', did I?

No. You can change the format the reiser4 storage tree is stored in. As
long as other filesystems don't use the same underlying storage tree
this is not possible.


--=-iRiqRY6UDa+JwpiIC1hF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLko0ZCYBcts5dM0RAifHAJoDtiifngYh4ZiRKhfWPv/yKHeNBACfSpa/
dzAAXkO7oaVv7W4rgMIhrk8=
=h/iE
-----END PGP SIGNATURE-----

--=-iRiqRY6UDa+JwpiIC1hF--

