From: Christophe Saout <christophe@saout.de>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Thu, 26 Aug 2004 18:39:24 +0200
Message-ID: <1093538364.5482.17.camel@leto.cs.pocnet.net>
References: <20040826130718.GB820@lst.de>
	 <1093526273.11694.8.camel@leto.cs.pocnet.net>
	 <20040826132439.GA1188@lst.de>
	 <1093527307.11694.23.camel@leto.cs.pocnet.net>
	 <20040826134034.GA1470@lst.de>
	 <1093528683.11694.36.camel@leto.cs.pocnet.net>
	 <20040826153748.GA3700@lst.de> <1093535334.5482.1.camel@leto.cs.pocnet.net>
	 <20040826160601.GB4326@lst.de>
	 <1093536859.5482.13.camel@leto.cs.pocnet.net>
	 <20040826172528.A21345@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-4Qlg4upLtOSiF4GR7uz6"
Return-path: <reiserfs-list-return-20722-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826172528.A21345@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

--=-4Qlg4upLtOSiF4GR7uz6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 17:25 +0100 schrieb Christoph Hellwig:

> > Looking at the code this could be done. The wrappers that dispatch the
> > operations are really small and call the plugin that is registered with
> > the inode of the mapping. Instead it could have directly set the
> > corresponding operations. Right. The wrappers are doing a few things
> > before calling the plugin. That could be done the other way round too.
> > But that's more of an implementation issue and could still be changed.
>=20
> I agree that it's an implementation issue.  But it's also a good proof
> for how Hans tries to ignore all the existing infrastructure for various
> reasons.

I definitely agree with you on that one.

It bugged me from the beginning because things like these are very
likely to suffer from unnecessary problems that have been solved in the
common code or might be solved when correctly done in the common code in
the future.


--=-4Qlg4upLtOSiF4GR7uz6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLhI8ZCYBcts5dM0RAoZWAJ4oW3Q6GVYrSAKCxfovL0qOTn8UUgCcDOwq
5I37yGCprEV2EZisvrKFIrg=
=Tj9X
-----END PGP SIGNATURE-----

--=-4Qlg4upLtOSiF4GR7uz6--

