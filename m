From: Stewart Smith <stewart@flamingspork.com>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sat, 10 Apr 2004 15:41:14 +1000
Message-ID: <1081575674.13650.21.camel@kennedy>
References: <20040329205339.74202.qmail@web25004.mail.ukl.yahoo.com>
	 <1080620527.31924.117.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-vF7LcBrR4ZLURmQJXlYW"
Return-path: <reiserfs-list-return-17825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080620527.31924.117.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Scott Young <youngs1@sunyit.edu>
Cc: reiserfs-list@namesys.com

--=-vF7LcBrR4ZLURmQJXlYW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-03-30 at 14:22, Scott Young wrote:
> by putting a / at the end of their name.  Folders are more complicated,
> but I think it should be done by just adding a slash after the full
> directory name (full as in including a trailing slash, so therefore
> there would be two slashes at the end to access an attribute).=20
> /home//attribute would be the an attribute on the home directory.=20

This behaviour would be broken, as you can have many slashes together
and they just get collapsed as one. This has been so on unixes for a
very long time (try 'ls ////////////////////////////////' on your system
:)

A lot of things would break if // suddenly meant something different.=20

--=20
Stewart Smith (stewart@flamingspork.com)
http://www.flamingspork.com/


--=-vF7LcBrR4ZLURmQJXlYW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAd4j53tgLgERgy8oRAl4zAJ4ofj/6m7aD8MLth7OL42lFqgXfcQCdEmOK
axscs25+avx+i8myDDxOh8k=
=cjZF
-----END PGP SIGNATURE-----

--=-vF7LcBrR4ZLURmQJXlYW--

