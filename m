From: Valdis.Kletnieks@vt.edu
Subject: Re: non volatile ram devices
Date: Sat, 07 Dec 2002 05:44:55 -0500
Message-ID: <200212071044.gB7AitI3013919@turing-police.cc.vt.edu>
References: <200212042059.35300.russell@coker.com.au> <200212061052.59139.russell@coker.com.au> <m3wummpuzp.fsf@merlin.emma.line.org>
            <200212071103.00132.russell@coker.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1747594598P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 07 Dec 2002 11:03:00 +0100."
             <200212071103.00132.russell@coker.com.au> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com

--==_Exmh_1747594598P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, 07 Dec 2002 11:03:00 +0100, Russell Coker <russell@coker.com.au> =
 said:
> How does qmail not support softupdates?

I can't speak for qmail directly, but I've heard of other software that g=
ets
indigestion because softupdates doesn't present the exact same API and vi=
ew
of the world.  I think it had to do with exactly how you fsync() a direct=
ory,
and when the syscall returned, and when the data was *really* on disk.

--==_Exmh_1747594598P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE98dEncC3lWbTT17ARAogpAKDpoB9Ui9cqZ55JKaYeGs0Lp+4uugCdEj5Y
s7oYDcuPwDHhN5phBM8Y4r4=
=xleX
-----END PGP SIGNATURE-----

--==_Exmh_1747594598P--
