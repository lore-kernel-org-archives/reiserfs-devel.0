From: Fionn Behrens <fionn@spamfilter.de>
Subject: Re: bad blocks on disk. Which files are damaged?
Date: Mon, 15 Aug 2005 13:07:51 +0200
Message-ID: <1124104066.25727.10.camel@laptop>
References: <1124040310.14141.4.camel@laptop> <430060B4.7070906@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-HXweh1JlG8ZLbOcvu1hU"
Return-path: <reiserfs-list-return-25469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430060B4.7070906@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-HXweh1JlG8ZLbOcvu1hU
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mo, 2005-08-15 at 13:30 +0400, Vladimir V. Saveliev wrote:

> You might want to look at
> http://namesys.com/bad-block-handling.html
>=20
> I believe it is in uptodate state. Yes, Vitaly?

thanks for the link. The page has not been updated recently it seems but
it has some good advice. I must admit, though, that I'd rather like to
find out the defective files first and try to copy all unaffected files
BEFORE I do an fsck. Because I am afraid I could lose pointers to
otherwise unharmed files during a --rebuild-tree.

None of the tools on that page seems to be able to just point out which
files could be damaged from the badblocks list... and that was my
initial problem.

best regards,
		Fionn
--=20
 "We view Intellectual Property theft as a threat
  to our national security," (http://beam.me.to/?iptheft-terrorism)
*** David Israelite, Ashcroft Deputy and Chief of "US DOJ IP Task Force"


--=-HXweh1JlG8ZLbOcvu1hU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDAHeCjkvYSI4bFywRAk96AJ0T7YYoiMFq0B4MR5cYWrueGHikKgCaA4Aw
MSRmeKFCV2f44zq8uP6oBX4=
=J8ZH
-----END PGP SIGNATURE-----

--=-HXweh1JlG8ZLbOcvu1hU--


