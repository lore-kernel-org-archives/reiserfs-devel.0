From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: reiser4 for windows
Date: Sun, 05 Dec 2004 19:31:29 -0700
Message-ID: <1102300289.19084.7.camel@titania.zlynx.org>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Rv18UCI0LbQmHGlT+O/o"
Return-path: <reiserfs-list-return-22681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041204211059.41930.qmail@web50908.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-Rv18UCI0LbQmHGlT+O/o
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-12-04 at 13:10 -0800, Job Bob wrote:
>   I know that this question has a fairly obvious
> answer, but is there or will there be a reiser4 driver
> for Windows? Microsoft will only make one if enough
> people use reiser4, otherwise hell will freeze before
> they do. The free software people seem to suffer from
> NIH syndrome, so they probably won't help either. That
> only leaves individuals or companies. Any ideas on
> when we might we a reiser4 driver for windows?
>=20
>                                        Yale


There are ext2/3 and reiserfs access programs for Windows.  They are not
implemented as Windows filesystem drivers.  I do not know if this is
because of technical difficulties or Windows vs. GPL licensing problems.

Most of them bring up the filesystem in a Windows Explorerish interface.
You can then copy files in or out.

I don't see any reasons why someone willing to do the work couldn't
adapt one of those programs to interface to Reiser4.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-Rv18UCI0LbQmHGlT+O/o
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBs8SBG8fHaOLTWwgRAmMOAJ9HMAM0sv4U5JRTO0EzqTBzwzTpagCeL/Gx
Rf7lYAJrVnoq8YBcc836vTs=
=62Po
-----END PGP SIGNATURE-----

--=-Rv18UCI0LbQmHGlT+O/o--

