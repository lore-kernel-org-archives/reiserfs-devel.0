From: Valdis.Kletnieks@vt.edu
Subject: Re: [PATCH] make fs/reiser4/search.c compile with gcc 4.0
Date: Wed, 22 Sep 2004 15:09:12 -0400
Message-ID: <200409221909.i8MJ9CT2030530@turing-police.cc.vt.edu>
References: <2f4958ff0409221145524aed7b@mail.gmail.com> <200409221859.i8MIxb7h014797@turing-police.cc.vt.edu>
            <2f4958ff0409221203524cabb9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-401215715P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 22 Sep 2004 21:03:45 +0200."
             <2f4958ff0409221203524cabb9@mail.gmail.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_-401215715P
Content-Type: text/plain; charset=us-ascii

On Wed, 22 Sep 2004 21:03:45 +0200, =?UTF-8?Q?Grzegorz_Ja=C5=9Bkiewicz?= said:

> This code uses stuppid gcc extension, that is not present in gcc 4.0.

OK, if it's using a GCC extension that's already officially deprecated in 3.X and will be
removed in 4.0, then that *is* a good reason to fix the code.

--==_Exmh_-401215715P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBUc3UcC3lWbTT17ARAsCMAKDo98mKKkn83tp2tOuQhJfRKN046QCdGWCs
7zHTIjCtDt4TfLzRiefZS2Y=
=mS7P
-----END PGP SIGNATURE-----

--==_Exmh_-401215715P--
