From: Bennett Todd <bet@rahul.net>
Subject: filenames that can be safely stolen (was Re: starting with ".." could break stuff)
Date: Fri, 2 Apr 2004 22:02:50 +0000
Message-ID: <20040402220250.GB4668@rahul.net>
References: <200404010546.i315kEvY019805@sirius.cs.pdx.edu> <20040402035617.GC2158@zero> <8765ciqr6v.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <reiserfs-list-return-17672-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <8765ciqr6v.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

2004-04-02T16:29:12 Hubert Chan:
> Tom> i bet there's a few apps that, when trying to skip .., only check
> Tom> the first two chars of the name. this may or may not be a problem.
>=20
> Then those apps are broken.  ..foo has always been a valid filename
> (though highly uncommon).  ..metas doesn't introduce anything new -- it
> only makes ..files more common.

Yup.

For another example, AFS steals "@sys"; it's a special black-magic
voodoo name that acts like a symlink to a machine-specific value,
used to set up baroque symlink trees so one uniform network
filesystem can support dispatching to appropriate versions of
machine-specific files like executables.

So another possibility worth considering might be @metas, with the
prior art of AFS to cite to people who complain about theoretical
problems:-).

-Bennett

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQFAbeMJHZWg9mCTffwRApicAJ47at8dQhi44MS6cSKp8nbjnP8HEgCeMxRL
2A1DyCYU4KTDUcDW4VKZ8lo=
=4J97
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
