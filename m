From: Valdis.Kletnieks@vt.edu
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Mon, 29 Mar 2004 20:32:14 -0500
Message-ID: <200403300132.i2U1WEIb006442@turing-police.cc.vt.edu>
References: <20040329185901.62166.qmail@web25008.mail.ukl.yahoo.com>
            <406885F1.9040409@mrs.umn.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_91550282P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 29 Mar 2004 14:24:17 CST."
             <406885F1.9040409@mrs.umn.edu> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com

--==_Exmh_91550282P
Content-Type: text/plain; charset=us-ascii

On Mon, 29 Mar 2004 14:24:17 CST, Grant Miner <mine0057@mrs.umn.edu>  said:
> Someone mentioned earlier, and I like just the at sign: @ Think of it 
> short for "attributes".
> 
> file/@/uid
> 
> The nice thing about @ is it shows up early lexicographically, it's 
> short and unlikely to be used.  This name is important to pick well 
> because it will likely set a long precedent.

Don't use the MH mail handler on that filesystem then.  It uses a
symlink called '@' to point to "the current mail item". For instance, this
reply:

$ ls -l ~/@
1 lrwxrwxrwx  1 valdis valdis 28 Mar 29 20:30 /home/valdis/@ -> /home/valdis/Mail/reiser/849


--==_Exmh_91550282P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAaM4ecC3lWbTT17ARAqeLAJ9N07RTK+6s669QFlwx0C7mptueggCguQkj
pX1cD0JNgNBuMEqMuwd01OI=
=tuD5
-----END PGP SIGNATURE-----

--==_Exmh_91550282P--
