From: Valdis.Kletnieks@vt.edu
Subject: Re: [PATCH] make fs/reiser4/search.c compile with gcc 4.0
Date: Wed, 22 Sep 2004 14:59:37 -0400
Message-ID: <200409221859.i8MIxb7h014797@turing-police.cc.vt.edu>
References: <2f4958ff0409221145524aed7b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-557301711P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21875-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 22 Sep 2004 20:45:55 +0200."
             <2f4958ff0409221145524aed7b@mail.gmail.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_-557301711P
Content-Type: text/plain; charset=us-ascii

On Wed, 22 Sep 2004 20:45:55 +0200, =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= said:

> I know gcc 4.0 is still in it's alphas.
> Obvious solution is to move function declared in other function
> up-wards. Since it's static anyway, it won't make any diffrence.
> Please consider applying to repo.

I'm not sure it's a good idea to be trying to "fix" reiser4 code to compile
with an alpha compiler, at least without a *very* firm commitment from the gcc
crew that this *is* a real error in the reiser4 code and not a bug in gcc
causing a spurious message.

Why does this code compile cleanly with gcc 3.x and fail with a 4.0 alpha?
Without knowing that, it's *STUPID* to change the code to suit the alpha...

--==_Exmh_-557301711P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBUcuZcC3lWbTT17ARAqLTAKDd1gNeDJSy2Lz5LH47jFFEoIA6+QCg5ysu
5KmyO9Qqt8x8DmAx42lnoyc=
=UijQ
-----END PGP SIGNATURE-----

--==_Exmh_-557301711P--
