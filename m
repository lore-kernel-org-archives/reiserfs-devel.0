From: Valdis.Kletnieks@vt.edu
Subject: Re: any way to disable fsync?
Date: Tue, 11 Jul 2006 17:57:30 -0400
Message-ID: <200607112157.k6BLvUqk028924@turing-police.cc.vt.edu>
References: <op.tcjl3meld4os1z@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1152655050_5755P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 11 Jul 2006 23:03:12 +0200."
             <op.tcjl3meld4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

--==_Exmh_1152655050_5755P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Jul 2006 23:03:12 +0200, =3D?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=
=3D?=3D said:
> I got problem with apps that are calling fsync, it makes my hard drive =
=20
> flush like mad and it slows down things quite a lot.

Several have posted how to bypass it.  I'll pose the opposite side:

Usually, applications call fsync() because they're pretty sure that if
the disk and in-memory copies aren't lined up, a crash at that point coul=
d
result in data loss and/or corruption.

So sqlite calls fsync() - probably because if it *doesn't*, and your
system crashes/reboots, you *will* lose that sqlite database.

Your data, your decision.

--==_Exmh_1152655050_5755P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFEtB7KcC3lWbTT17ARAgoTAKCs8kyvSlwmGVkRt+YxcJcNAxEPTACeK9w9
++OPqIioKraCrMupr1dd3rQ=
=YDPf
-----END PGP SIGNATURE-----

--==_Exmh_1152655050_5755P--
