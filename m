From: Valdis.Kletnieks@vt.edu
Subject: Re: What does this mean?
Date: Sun, 14 Jul 2002 12:36:28 -0400
Message-ID: <200207141636.g6EGaTCr017595@turing-police.cc.vt.edu>
References: <3D2993E5.6030707@tpg.com.au> <20020708190923.A928@namesys.com> <3D29BA3F.7010201@tpg.com.au> <200207081228.56302.kuba@mareimbrium.org> <3D2E6DAB.9050400@tpg.com.au> <200207121326.g6CDQu3u003587@turing-police.cc.vt.edu>
            <3D2FFA1B.8050302@tpg.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_508465164P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Sat, 13 Jul 2002 19:59:55 +1000."
             <3D2FFA1B.8050302@tpg.com.au> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Basil Chupin <blchupin@tpg.com.au>
Cc: reiserfs-list@namesys.com

--==_Exmh_508465164P
Content-Type: text/plain; charset=us-ascii

On Sat, 13 Jul 2002 19:59:55 +1000, Basil Chupin <blchupin@tpg.com.au>  said:

> We compared the outputs from the 'ps aux' command and what I found is 
> that I am not running the kjournald process on any of my (3) 'systems' 
>  while he is (on his 2 'systems') even though our setups are almost 
> identical (with regards to running SuSE v8 ). I thought kjournald was 
> part and parcel of reiserfs but then why isn't it running on my 
> 'systems'? Just another mystery.

ext2 filesystems don't have a kernel thread.
ext3 have one kjournald thread per file system.
resierfs have one kreiserfsd thread per file system.

You don't have any because you're all reiserfs.  His two systems obviously
have at least 1 ext3 file system (/boot or / perhaps?)

--==_Exmh_508465164P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9MaiMcC3lWbTT17ARAkt3AKDAcDmNa7B551YiuoTHA84BEh6dQACgmADO
DUua4tf5d979qovavHK40fU=
=tlwN
-----END PGP SIGNATURE-----

--==_Exmh_508465164P--
