From: "Michael G. Morey" <mmorey@optivel.com>
Subject: SMART Self-Test Reports UNC Errors on Dell Latitude D800 Hitachi
	Travelstar DK23FB
Date: Thu, 12 Aug 2004 11:22:03 -0500
Message-ID: <1092327723.16346.7.camel@turing.optivel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-d/2u5zOjFMOso/hIHO+q"
Return-path: <reiserfs-list-return-20231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiser Filesystem User List <reiserfs-list@namesys.com>

--=-d/2u5zOjFMOso/hIHO+q
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

All,

I've installed and run the smartmontools package backported to Debian
GNU/Linux 3.0r1 from http://www.backports.org, and have run the short
and extended Offline self tests.  The results are as follows:

smartctl version 5.32 Copyright (C) 2002-4 Bruce Allen
Home page is http://smartmontools.sourceforge.net/

=3D=3D=3D START OF READ SMART DATA SECTION =3D=3D=3D
SMART Self-test log structure revision number 1
Num  Test_Description    Status                  Remaining=20
LifeTime(hours)  LBA_of_first_error
# 1  Extended offline    Completed: read failure       80%    =20
4089         8371832
# 2  Short offline       Completed without error       00%    =20
4088         -
# 3  Short offline       Completed without error       00%       =20
0         -

My manager suggested that I reformat the partitions (we use ReiserFS
3.6), to mark the bad blocks.  Is this a viable option?  Can the drive
be salvaged, or should it be replaced?

Thanks in advance.
--=20
Michael G. Morey <mmorey@optivel.com>
Optivel

--=-d/2u5zOjFMOso/hIHO+q
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBG5krUxCoiYM0uf4RAhtGAJ9W319p6pSMSLtOHn1LRelDtyum/ACfVrXm
R+NjJmNe6G4ivyerJIgpvV8=
=ymns
-----END PGP SIGNATURE-----

--=-d/2u5zOjFMOso/hIHO+q--

