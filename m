From: Valdis.Kletnieks@vt.edu
Subject: Re: Problem - reiser4(2004.08.13), apache(2.0.50) and "AllowOverride All"
Date: Wed, 25 Aug 2004 17:27:15 -0400
Message-ID: <200408252127.i7PLRGeI026701@turing-police.cc.vt.edu>
References: <412B71F6.6020603@zappa.cx> <1093373015.9503.3.camel@leto.cs.pocnet.net>
            <1093375229.9503.6.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-386481728P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 24 Aug 2004 21:20:28 +0200."
             <1093375229.9503.6.camel@leto.cs.pocnet.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Christophe Saout <christophe@saout.de>
Cc: Andreas Sundstrom <sunkan@zappa.cx>, reiserfs-list@namesys.com

--==_Exmh_-386481728P
Content-Type: text/plain; charset=us-ascii

On Tue, 24 Aug 2004 21:20:28 +0200, Christophe Saout said:

> Sorry, this was already known. My current apache 2.0.50 seems to call
> lstat first though.

Note that doing an lstat first still has a race condition.....

--==_Exmh_-386481728P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBLQQzcC3lWbTT17ARAmomAKD9quVehKxzhgglUs7PRS26CJiHUgCfWWCd
Z8bEmAc8EUUg8OufIGs4kq4=
=hhgm
-----END PGP SIGNATURE-----

--==_Exmh_-386481728P--
