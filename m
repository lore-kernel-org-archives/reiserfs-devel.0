From: Christophe Saout <christophe@saout.de>
Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92':
	Input/output error
Date: Thu, 05 Aug 2004 00:46:45 +0200
Message-ID: <1091659605.8276.3.camel@leto.cs.pocnet.net>
References: <20040804065840.17C7915C7C@mail03.powweb.com>
	 <4110A0FA.3030007@namesys.com> <4110A38E.6070905@namesys.com>
	 <4110A561.9050200@namesys.com> <4110DBD6.7010904@namesys.com>
	 <20040804183801.GU1284@nysv.org>  <41115962.1030407@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Gw04mPWLglsMrmQND0wK"
Return-path: <reiserfs-list-return-20008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41115962.1030407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Markus =?ISO-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>, "Vladimir V. Saveliev" <vs@namesys.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

--=-Gw04mPWLglsMrmQND0wK
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 04.08.2004, 14:47 -0700 schrieb Hans Reiser:

> V4 likes stack.  If someone can convince me that kmalloc is as efficient=20
> as stack, I'd like to hear it, because I know I lack expertise on the top=
ic.

The disassembled fast path of kmalloc (with a size of the object known
at compile time) fits on one page. Most of the time it will just return
a pointer from a pool of cached and cache-hot objects.


--=-Gw04mPWLglsMrmQND0wK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBEWdUZCYBcts5dM0RAkJ+AJ9pFcwct3tCZsFzrwudOnJKrcWMDgCdGd9n
vf7zfF3qpfPlH0BmccZQ5Bk=
=gJH7
-----END PGP SIGNATURE-----

--=-Gw04mPWLglsMrmQND0wK--

