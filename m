From: Francisco Javier Cabello <fjcabello@visual-tools.com>
Subject: reiserfs and IDE write cache
Date: Fri, 18 Aug 2006 09:22:18 +0200
Message-ID: <200608180922.23867.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1773903.0qJqmHFsvC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29624-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart1773903.0qJqmHFsvC
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,
I have been 'googling' and I have found a lot of people warning about the=20
problems with IDE write cache and journaling filesystems.=20
Should I disable write cache in my systems using reiserfs3+2.4.25?

I have tried to disable write cache with hdparm (hdparm -W0 /dev/hdc) but i=
t=20
is not working  ( you can see write cache is enabled with hdparm=20
=2Di /dev/hdc).
Is there other way to disable write cache?

Regards,

Paco

=2D-=20
One of my most productive days was throwing away 1000 lines of code (Ken=20
Thompson)
=2D----------------
PGP fingerprint: AF69 62B4 97EB F5BB 2C60  B802 568A E122 BBBE 5820
PGP Key available at http://pgp.mit.edu
=2D----------------


--nextPart1773903.0qJqmHFsvC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBE5WqvVorhIru+WCARAs2rAJ92Iydw67HvOTA6eSCxKTj/JrjsFQCcDWEq
J7b3jr4tRnb7t2zyl3wk3z8=
=G+6+
-----END PGP SIGNATURE-----

--nextPart1773903.0qJqmHFsvC--
