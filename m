From: Andreas =?iso-8859-1?Q?Sch=E4fer?= <gentryx@gmx.de>
Subject: Re: somewhat OT query on journalling
Date: Fri, 21 Jul 2006 23:26:11 +0200
Message-ID: <20060721212611.GA13453@wintermute>
References: <20060719152744.GA26155@tranquility.scriptkitchen.com> <44BE95F6.50004@namesys.com> <20060721124518.GA1977@tranquility.scriptkitchen.com> <44C122F1.7000109@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <reiserfs-list-return-29112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44C122F1.7000109@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Don't get too excited -- the transactions probably aren't done yet. Witho=
ut those, no filesystem that claims to journal data is really any better th=
an a filesystem which only journals metadata.  Even once=20
> they are implemented (or even if they are already), applications have to =
support them directly.

Actually, I think transactions in a filesystem context are a bit
different from the transactions you know form databases. Generally
speaking, a transaction denotes a transition from one valid state to
another. This transition should either be performed completely or --
in case of errors -- performed not at all (a.k.a. "roll back").

Databases allow application defined transactions (i.e. the
application specifies when a valid state is being left and when one is
reached again).

IMHO for filesystems a transaction denotes the flushing of write
buffers. "metadata only" transactions/journaling mean that even after
a crash the file itself will be readable (and not pointing to
e.g. sector -4711 ...). "data _and_ metadata" now means that the
filesystem does also guarantee that the data itself is written
completely.

Please correct my if I got this totally wrong.

-Andreas


--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQFEwUZzxQzSAzXqsyYRAjOhAKCO/mCHY1yU2GMdCSZDGTd2a/ngTACgkTsx
9694WvWuo4I4iGKzYUq6FOI=
=nCyi
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
