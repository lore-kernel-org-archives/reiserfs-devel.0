From: Valdis.Kletnieks@vt.edu
Subject: Re: Poor sequential write performance.
Date: Thu, 07 Nov 2002 13:09:00 -0500
Message-ID: <200211071809.gA7I90nd004446@turing-police.cc.vt.edu>
References: <3DCA47AB.8060008@valuecommerce.ne.jp>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1690657712P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11945-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 07 Nov 2002 19:59:55 +0900."
             <3DCA47AB.8060008@valuecommerce.ne.jp> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Naoki <naoki@valuecommerce.ne.jp>
Cc: reiserfs-list@namesys.com

--==_Exmh_1690657712P
Content-Type: text/plain; charset=us-ascii

On Thu, 07 Nov 2002 19:59:55 +0900, Naoki <naoki@valuecommerce.ne.jp>  said:

> real    0m3.059s
> user    0m2.543s <== say what???
> sys     0m0.064s

> 0.25user 0.04system 0:00.38elapsed 76%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (115major+19minor)pagefaults 0swaps

I'd start by investigating why on the new box the 'user' time is 2.5+ seconds.

Notice that the 'system' times on both boxes are comparable (0.06 versus
0.04 - low enough that timer resolution probably matters in any jitter in
the measurements).

Does 'which wc' show you running something other than /usr/bin/time on the
new box?
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_1690657712P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9yqw8cC3lWbTT17ARAvpjAJ9PrKJ9WITSUqveVHlgvcoiIpgfBQCggDj+
FUJgLT7oDUjrpYRZFgtjZvY=
=/GUY
-----END PGP SIGNATURE-----

--==_Exmh_1690657712P--
