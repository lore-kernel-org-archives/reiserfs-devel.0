From: Valdis.Kletnieks@vt.edu
Subject: Re: 2GB limit won't go away
Date: Sun, 09 Jun 2002 12:08:09 -0400
Message-ID: <200206091608.g59G8ISI021286@turing-police.cc.vt.edu>
References: <1023708533.4654.301.camel@xserver>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_750707567P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Mon, 10 Jun 2002 05:28:53 MDT."
             <1023708533.4654.301.camel@xserver> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Chris Worley <chrisw@lnxi.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_750707567P
Content-Type: text/plain; charset=us-ascii

On Mon, 10 Jun 2002 05:28:53 MDT, Chris Worley <chrisw@lnxi.com>  said:

> But,  I can't create a file greater than 2GB.

Two quick guesses:

1) Old/busticated/crufty libc that doesn't have large-file support
1a) other userspace tools that don't have it (dd, cat, etc)

2) a 'ulimit -f' value for max filesize.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_750707567P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9A31ocC3lWbTT17ARAqHnAKDIX6mRIsp2mNdoc/YfAjlQll1YPwCg9z21
uWLUvzy1+88mQYshTNL/+sg=
=Z+sm
-----END PGP SIGNATURE-----

--==_Exmh_750707567P--
