From: Valdis.Kletnieks@vt.edu
Subject: Re: "df -i" support
Date: Fri, 14 May 2004 15:06:42 -0400
Message-ID: <200405141906.i4EJ6gZF030124@turing-police.cc.vt.edu>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es> <1084439945.14090.6209.camel@tribesman.namesys.com> <20040514173227.5b0541b5.turtle.power@wanadoo.es> <200405141655.i4EGtrAT007250@turing-police.cc.vt.edu> <20040514194040.22389128.turtle.power@wanadoo.es> <1084557009.3263.7.camel@localhost.localdomain> <20040514202627.18ddc7b2.turtle.power@wanadoo.es>
            <20040514184823.GG18086@schnapps.adilger.int>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-281729546P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18702-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 14 May 2004 12:48:23 MDT."
             <20040514184823.GG18086@schnapps.adilger.int> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--==_Exmh_-281729546P
Content-Type: text/plain; charset=us-ascii

On Fri, 14 May 2004 12:48:23 MDT, Andreas Dilger said:

> Hmm, why wouldn't reiserfs_statfs() just use that number for the "in use"
> inodes in the first place?  Sadly, the statfs() interface is broken in
> the sense that it contains "total" inodes and "free" inodes instead of
> "in use" inodes, but it shouldn't be difficult to just subtract the
> number of in-use inodes from 2^32-1 and stick that into the "free" field
> so that when user-space does the reverse it gets the right number.

If you get a multi-terabyte filesystem that contains more than 2^32-1 files,
things will get very pear-shaped....


--==_Exmh_-281729546P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFApRjCcC3lWbTT17ARAunlAKD5VDltCZbMoN9iN6FfJY3g7/PcdwCfW+X4
lpw4gKPNztf+bGsLRrTAwrI=
=svoR
-----END PGP SIGNATURE-----

--==_Exmh_-281729546P--
