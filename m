From: Valdis.Kletnieks@vt.edu
Subject: Re: Behavior of tails with respect to shred, wipe, etc
Date: Sat, 26 Oct 2002 03:09:23 -0400
Message-ID: <200210260709.g9Q79N8Q012571@turing-police.cc.vt.edu>
References: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net> <15801.26994.705639.374241@laputa.namesys.com>
            <3DB9F2B6.6000701@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1767132786P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11796-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 26 Oct 2002 05:41:10 +0400."
             <3DB9F2B6.6000701@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs-List <reiserfs-list@namesys.com>

--==_Exmh_-1767132786P
Content-Type: text/plain; charset=us-ascii

On Sat, 26 Oct 2002 05:41:10 +0400, Hans Reiser said:

> Use encryption.  Encryption still leaves you vulnerable to those who can 
> extract the key out of the owner though.

If you have multiple users on the same filesystem, key management becomes...
umm... "interesting".  Projects like loop-AES usually finesse it by only
having one key per filesystem.

It's 3AM, I'm going to avoid thinking about what's involved if *one* user on
a multi-user partition needs to change a compromised key.... ;)
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-1767132786P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9uj+jcC3lWbTT17ARAo3tAKDIX3KGV5D/APKHGCM/CJA2WSFbJwCbBUaU
OG57oMAcu4dhrry8/wIEZlg=
=82Tq
-----END PGP SIGNATURE-----

--==_Exmh_-1767132786P--
