From: Valdis.Kletnieks@vt.edu
Subject: Re: How to recover data with a dead journal?
Date: Fri, 06 Sep 2002 12:00:38 -0400
Message-ID: <200209061600.g86G0cbr020464@turing-police.cc.vt.edu>
References: <200209061313.24892.matthew@bytemark.co.uk> <200209061343.04582.matthew@bytemark.co.uk> <200209061543.50567.Dieter.Nuetzel@hamburg.de>
            <200209061455.46176.matthew@bytemark.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_306209968P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 06 Sep 2002 14:55:46 BST."
             <200209061455.46176.matthew@bytemark.co.uk> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Matthew Bloch <matthew@bytemark.co.uk>
Cc: reiserfs-list@namesys.com

--==_Exmh_306209968P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 06 Sep 2002 14:55:46 BST, Matthew Bloch <matthew@bytemark.co.uk> =
 said:

> could be).  It's only a small disc so it didn't take long.  I'll rememb=
er =

> dd_rescue for next time, though disc recovery in general is dull and =

> potentially heartbreaking ;-) so I think I'll just splash out on a mirr=
or =

> drive so there is no next time!

I've had to help recover a large RAID5 with an Oracle database on it afte=
r
the controller went bonkers and flushed its cache to the correct block
numbers on the incorrect disk numbers.  Ouch.  At least it wasn't like
the one shop I know of that bought a terabyte of RAID-5 and no backup
device because it was hot-swap RAID-5 with hot spares - worked great till=

a plumbing leak on the floor above dumped lots of water into the cabinet.=
=2E.

Take regular backups anyhow - the Universe runs by the laws of thermodyna=
mics,
and is continually trying to increase entropy.  Your data has a big bulls=
eye
target on it. ;)
-- =

				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_306209968P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9eNEmcC3lWbTT17ARAgcgAJ9d8mWlTtCCf4Ahs/IwJA+CV33I5ACeN4Nn
8ucNe36OAV2DX3nb6/QBHcs=
=j0wF
-----END PGP SIGNATURE-----

--==_Exmh_306209968P--
