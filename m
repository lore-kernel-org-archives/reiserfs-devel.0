From: Valdis.Kletnieks@vt.edu
Subject: Re: OT: simple file operations in C
Date: Mon, 10 Mar 2003 03:02:18 -0500
Message-ID: <200303100802.h2A82JWS004942@turing-police.cc.vt.edu>
References: <1047267222.c3ecdd60teodarren@myrealbox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_716072364P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 10 Mar 2003 03:33:42 GMT."
             <1047267222.c3ecdd60teodarren@myrealbox.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: darren <teodarren@myrealbox.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_716072364P
Content-Type: text/plain; charset=us-ascii

On Mon, 10 Mar 2003 03:33:42 GMT, darren <teodarren@myrealbox.com>  said:

> I want my program to be able copy, move and delete files, but i cannot seem t
o find any available functions or system calls to do this.

For move and delete, you want the rename() and unlink() system calls.

For copying, you might want to skip the stdio fopen() and friends, and
use open()/read()/write()/close().  You may need chmod() and utime() if you
want to be preserving filemode/timestamps.

Google for '+linux +programming +guide'.

--==_Exmh_716072364P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+bEaJcC3lWbTT17ARArIQAJ9eLoPDzX2XRTOD++rMeI2fe1+aJACg/A9E
dA4Ztw/EspK2EGQYXIKCjHo=
=atcH
-----END PGP SIGNATURE-----

--==_Exmh_716072364P--
