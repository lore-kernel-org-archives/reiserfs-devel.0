From: Valdis.Kletnieks@vt.edu
Subject: Re: best reiserfs mount options for generic benchmarking
Date: Mon, 16 Sep 2002 00:28:14 -0400
Message-ID: <200209160428.g8G4SK3u013751@turing-police.cc.vt.edu>
References: <20020914164755.GA12387@rushmore>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_815752924P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11460-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 14 Sep 2002 12:47:55 EDT."
             <20020914164755.GA12387@rushmore> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: rwhron@earthlink.net
Cc: reiserfs-list@namesys.com

--==_Exmh_815752924P
Content-Type: text/plain; charset=us-ascii

On Sat, 14 Sep 2002 12:47:55 EDT, rwhron@earthlink.net said:

> I've changed the partition reiserfs runs on.  That means comparison
> with earlier runs is less valid.  Hans got me thinking the
> benchmarks may be helpful for reiserfs developers, so I want
> to cater to what is most useful for them.  

I'm not a developer, but I suspect what they'd *really* like to see is
the *interaction* between options - for instance, does the prealloc
option behave differently with tails/notails?  Does prealloc play
nice with notails for file creation, but not for file removal?  How
do the various combos of options behave for short reads/writes, long ones,
and a random mix?

Even if you don't find any bugs or regressions, this is the sort of data
that will be needed when somebody gets around to writing a tuning guide...
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_815752924P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9hV3ecC3lWbTT17ARAtKYAKCrr6AVCG9RmDBbYpTIZWw8Xu0u9QCeIvOm
6vhRkVHSm+a2wYdzTTQSXfc=
=K0lr
-----END PGP SIGNATURE-----

--==_Exmh_815752924P--
