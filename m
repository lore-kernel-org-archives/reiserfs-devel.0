From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 23:54:24 -0700
Message-ID: <1080716064.13658.2.camel@titania.zlynx.org>
References: <200403310620.i2V6K7D9018881@sirius.cs.pdx.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-qfNDcMBbNzv/KdnXN/x+"
Return-path: <reiserfs-list-return-17613-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403310620.i2V6K7D9018881@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-qfNDcMBbNzv/KdnXN/x+
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-03-30 at 23:20, The Amazing Dragon wrote:
[snip]
> But how often do you need to access meta information directly from a
> shell? Most of the time it would be a GUI tool accessing the extra data,
> do you normally need to use `file` before doing anything? Most of the
> time you know that a file called "Pokemon" is something you're not going
> to access with `vi`, so would you need the filetype meta data before
> dealing with it?

No, no, don't use that argument.  If you go there, we might as well go
back to using weird little ioctl/setattr/chacl calls.  I much prefer a
nice filesystem interface and it should be very easy to use from the
shell.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-qfNDcMBbNzv/KdnXN/x+
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAamsgG8fHaOLTWwgRAsb3AJ9DvF/DBDPuDne4tRdueCqGWf6veACfTzWY
pmkocv/blYv4C9nEkm+nTp8=
=1CK4
-----END PGP SIGNATURE-----

--=-qfNDcMBbNzv/KdnXN/x+--

