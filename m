From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 15:27:01 +0200
Message-ID: <1093526821.11694.15.camel@leto.cs.pocnet.net>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
	 <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com>
	 <20040826014542.4bfe7cc3.akpm@osdl.org>
	 <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de>
	 <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-GF3yaRKueIaxVkCW+tfp"
Return-path: <reiserfs-list-return-20665-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826130718.GB820@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

--=-GF3yaRKueIaxVkCW+tfp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 15:07 +0200 schrieb Christoph Hellwig:

> > The reiser4 core doesn't know about inodes, directories or files. It's
> > the glue code between the VFS and the storage layer that does. It's
> > implemented as a plugin. This has nothing to do with semantic
> > enhancements yet. These should be removed for now and made a 2.7 topic.
>=20
> Oh yes, it is.  As soon as you use different access methods on an
> overlapping set of objects you see exactly the problems I described.

Right. That shouldn't happen. Since an object is usally tied to exactly
one plugin this can't happen I think. At least as long the programmer
doesn't mess anything up.

> If they don't overlap there's no point for the plugins to start with,
> you'll better turn the core into a library that can be used by different
> projects then.

I think that's what Hans is trying to suggest. The core is theoretically
usable for anything. He made a filesystem of it.

You can see reiser4 as a library and the UNIX directory and file plugins
as the filesystem. That's why they are linked in uncoditionally because
it doesn't make sense otherwise. It's mainly the naming that seems to
confuse people.


--=-GF3yaRKueIaxVkCW+tfp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLeUlZCYBcts5dM0RAgtMAJ9Ioh6ZzeKEDC54OzV2AbcEGthyqACfX9kV
/LMOtx7w/Zks1bTQkLPP9pY=
=hb0O
-----END PGP SIGNATURE-----

--=-GF3yaRKueIaxVkCW+tfp--

