From: Valdis.Kletnieks@vt.edu
Subject: Re: Reiser4 kernel modules
Date: Mon, 01 Nov 2004 15:02:24 -0500
Message-ID: <200411012002.iA1K2OLa012887@turing-police.cc.vt.edu>
References: <8jfy8hpgzk4.fsf@panter.stud.ntnu.no> <1099299984.1712.82.camel@tribesman.namesys.com>
            <8jflldlhg4e.fsf@panter.stud.ntnu.no>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1169685168P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 01 Nov 2004 14:07:45 +0100."
             <8jflldlhg4e.fsf@panter.stud.ntnu.no> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?iso-8859-1?q?Lars_Tobias_B=F8rsting?= <larstobi@itea.ntnu.no>
Cc: Reiser4 <reiserfs-list@namesys.com>

--==_Exmh_1169685168P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 01 Nov 2004 14:07:45 +0100, =3D?iso-8859-1?q?Lars_Tobias_B=3DF8rs=
ting?=3D said:

> And why does reiser4 need changes in the kernel code? Is it really a
> smart approach to require kernel changes for reiser4 to work?
>=20
> Why isn't it possible to build reiser4 as kernel modules?

It still requires the change to the kernel to add the proper code
in linux-2.6.9/fs/reiser4, add it to the proper Makefiles, the Kconfig
glue needed to build it, etc.  Adding in-tree code is a change to the
kernel, even if it ends up getting built as modules.

Or you *can* build it as an out-of-tree module - which still has some
rough edges in the 2.6 Kbuild infrastructure (most notably, if you
do a 'make modules_install', you have to remember to re-install all your
out-of-tree stuff as well...)

--==_Exmh_1169685168P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBhpZPcC3lWbTT17ARAlBIAKDCMuRegBVogP834jY3LeSPRSlIagCdFfhX
mDdhC6Axt8x0VwutVl6fUz0=
=26/D
-----END PGP SIGNATURE-----

--==_Exmh_1169685168P--
