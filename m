From: Valdis.Kletnieks@vt.edu
Subject: Re: Proposal for keying encrypted filesystem
Date: Fri, 04 Apr 2003 09:01:17 -0500
Message-ID: <200304041401.h34E1Hli003929@turing-police.cc.vt.edu>
References: <200303282026.23543.phma@webjockey.net> <3E89B908.1070106@namesys.com> <200304031614.h33GE7S7004132@turing-police.cc.vt.edu>
            <200304031822.12677.phma@webjockey.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1888600716P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13569-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 03 Apr 2003 18:22:11 EST."
             <200304031822.12677.phma@webjockey.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

--==_Exmh_1888600716P
Content-Type: text/plain; charset=us-ascii

On Thu, 03 Apr 2003 18:22:11 EST, Pierre Abbat <phma@webjockey.net>  said:

> What's LSM? This sounds like it can do what I want with rsync. Is it possible
 
> to add a new key token to init and have it propagate to all processes?

If that's the semantics you *REALLY* want, a better idea would probably be
to use loop-AES to encrypt an entire partition.

Note that this only works if your threat model reduces to "US vs THEM" (i.e.
"me vs whoever stole the laptop".  If you have more than one class of users
involved, you can't do it this way (and yes, there *do* exist threat models
where you want to make sure that even if the attacker manages to bypass
the file system permissions and get the contents of the file, they're still
useless...)

--==_Exmh_1888600716P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+jZAtcC3lWbTT17ARAhN/AJ468/ACZYqD8LtccTV1mLlLGuy5UACeJNxn
IdHGu3vk5GkhGBqADcjUJAo=
=/eVB
-----END PGP SIGNATURE-----

--==_Exmh_1888600716P--
