From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: support for Reiserfs 3.6 failed on ~1Tb lvm2 lv on 2.6.6?
Date: Tue, 8 Jun 2004 23:33:55 +0200
Sender: bernd-schubert@web.de
Message-ID: <200406082334.02438.bernd-schubert@web.de>
References: <3DF9165145FACB4C96977FF650C1E9040C46A03F@its-mail1.its.corp.gwl.com> <40C627B7.9000803@dgreaves.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_KDjxAGbkUWc319c";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19104-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40C627B7.9000803@dgreaves.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Greaves <david@dgreaves.com>
Cc: "Burnes, James" <james.burnes@gwl.com>, reiserfs-list@namesys.com

--Boundary-02=_KDjxAGbkUWc319c
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

>
> I am wondering if the resync corrupted the data.
>

Not very likely, but on the other hand 2.6. is too few tested to be sure it=
s=20
not a md bug.=20
Well, during the resync pretty many data will be cached in memory, so the=20
resync might have speeded up the effects from bad memory ;)

Bernd

--Boundary-02=_KDjxAGbkUWc319c
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAxjDKC8BUnAF+ydYRAiiyAJ0YCtwIFRbn5ufAB232A26vTXpMSQCcDnEa
oTjhiw8OcNnXV/igYirVTkQ=
=19LJ
-----END PGP SIGNATURE-----

--Boundary-02=_KDjxAGbkUWc319c--
