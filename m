From: Valdis.Kletnieks@vt.edu
Subject: Re: newbie question about mounting options
Date: Thu, 08 Apr 2004 12:26:16 -0400
Message-ID: <200404081626.i38GQGhj015743@turing-police.cc.vt.edu>
References: <000a01c41d82$7e69bf70$3acac9d2@pierre2>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1753699904P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17795-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 08 Apr 2004 17:59:36 +0200."
             <000a01c41d82$7e69bf70$3acac9d2@pierre2> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Pierre Fafet <pierre.fafet@ladservices.fr>
Cc: 'Reiserfs List' <reiserfs-list@namesys.com>

--==_Exmh_1753699904P
Content-Type: text/plain; charset=us-ascii

On Thu, 08 Apr 2004 17:59:36 +0200, Pierre Fafet <pierre.fafet@ladservices.fr>  said:

>     [root@CORTON root]# mkreiserfs -s 8193 -j /dev/sdf1 /dev/sdg2
> 
>     <-------------mkreiserfs, 2002------------->
>     reiserfsprogs 3.6.4

> Why is it not working ?

reiserfsprogs is up to 3.6.13 or even later.  Probably you'll need to get to
some non-ancient version before anybody even thinks about the problem.
There's been lots of bugs fixed in the 2 years since the version you're running....

--==_Exmh_1753699904P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAdX0ocC3lWbTT17ARAtXdAKCAyVbBe3laSpM7ZIT9FhwcBiLp2gCg28HP
HlAfjicfYqAlWjJorXOIHiI=
=uknJ
-----END PGP SIGNATURE-----

--==_Exmh_1753699904P--
