From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 18:44:13 +0200
Message-ID: <1093538653.5482.21.camel@leto.cs.pocnet.net>
References: <20040824202521.GA26705@lst.de>	<412CEE38.1080707@namesys.com>
	 <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com>
	 <412E10A2.1020801@pobox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-B1vbGDegrw7jAq82gPAY"
Return-path: <reiserfs-list-return-20723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412E10A2.1020801@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Will Dyson <will_dyson@pobox.com>
Cc: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

--=-B1vbGDegrw7jAq82gPAY
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 12:32 -0400 schrieb Will Dyson:

> > Andrew, we need to compete with WinFS and Dominic Giampaolo's filesyste=
m=20
> > for Apple, and that means we need to put search engine and database=20
> > functionality into the filesystem.  It takes 11 years of serious=20
>=20
> I'm very curious about your ideas on how to put search engine and=20
> database functionality into the filesystem.

I could imagine something like this.

There are some special folders or files or whatever under every file
where some userspace can put some metadata. A keyword perhaps.

echo linux > file.bla/keywords/topic

The filesystem might then automatically put these keywords into an index
and then provide a search mechanism elsewhere where it could ask "find
me all dentries with the keyword 'linux'." and it would return a list
like locate does. Only that it's in realtime and also works when moving
the file around (but not when copying with an unaware program for
obvious reasons).


--=-B1vbGDegrw7jAq82gPAY
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLhNdZCYBcts5dM0RAq9CAJ9pgJXRmbhmrrTyK+SNWcDM3sGZ5gCgkdEK
IhcgQtuxG1fRNF5OPZZau5w=
=zyan
-----END PGP SIGNATURE-----

--=-B1vbGDegrw7jAq82gPAY--

