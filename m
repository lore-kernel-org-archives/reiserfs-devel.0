From: Valdis.Kletnieks@vt.edu
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 11:35:34 -0400
Message-ID: <200209161535.g8GFZYM4004165@turing-police.cc.vt.edu>
References: <20020916102742.6538D2926@hofmann.snowcra.sh> <200209161450.g8GEorM4003750@turing-police.cc.vt.edu>
            <200209161713.52352.russell@coker.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1901158394P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11475-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 16 Sep 2002 17:13:52 +0200."
             <200209161713.52352.russell@coker.com.au> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Russell Coker <russell@coker.com.au>
Cc: Sam Vilain <sam@vilain.net>, 'reiserfs-list' <reiserfs-list@namesys.com>

--==_Exmh_-1901158394P
Content-Type: text/plain; charset=us-ascii

On Mon, 16 Sep 2002 17:13:52 +0200, Russell Coker said:

> Alternately use quotas, speaking of which, do Quotas work on ReiserFS without 
> additional patches yet?  Quotas really are an essential feature.

Quotas are a Good Thing - but note that quite often you get into the
situation where you want to "overcommit" a partition (for instance, 2G of
disk, and 10 users each of which have a 500M limit).  It helps, but you're
still open to attacks by collusion (intentional, accidental, or by hijacking
3 other userids to help).

> Solar Designer's OpenWall kernel patch addresses this issue by prohibiting 
....
> Also the LSM patch includes NSA Security enhanced Linux.  In the default SE 
> Linux policy a user in the default un-priviledged role (user_r) with the 
> defalt security domain for that role (user_t) will not be allowed to even 

Ahh, both are very nice, but alas, neither is part of the base kernel yet.

> A machine with an adequate security setup and with correctly configured quotas 
> should be able to operate correctly with hostile local users even if it only 
> has a single file system.

Granted.  However, my point was that I've never seen a Unixoid system that was
safe to run with only one big partition without extensive kernel hacking to
make it safe. I'll be more than happy to change my stance as soon as SELinux
ships as part of the base system ;)

/Valdis

--==_Exmh_-1901158394P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9hfpFcC3lWbTT17ARAkpTAJ9tDbdS84bwRMvnxKjUI/lvMDugtgCg9lus
mVOxNcE5v6sxvXahQUhh4g8=
=IlwS
-----END PGP SIGNATURE-----

--==_Exmh_-1901158394P--
