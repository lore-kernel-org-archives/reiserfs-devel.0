From: Valdis.Kletnieks@vt.edu
Subject: Re: External journals and NVRAM devices
Date: Fri, 01 Nov 2002 15:57:42 -0500
Message-ID: <200211012057.gA1Kvgf2001695@turing-police.cc.vt.edu>
References: <20021101203805.C5E7245609B@server5.fastmail.fm>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1465480856P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 01 Nov 2002 20:38:05 GMT."
             <20021101203805.C5E7245609B@server5.fastmail.fm> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: JP Howard <jh_lists@fastmail.fm>
Cc: Edward Shishkin <edward@namesys.com>, Andreas Dilger <adilger@clusterfs.com>, ReiserFS List <reiserfs-list@namesys.com>

--==_Exmh_1465480856P
Content-Type: text/plain; charset=us-ascii

On Fri, 01 Nov 2002 20:38:05 GMT, JP Howard said:

> Blocksize: 4096
> <...>
> Journal parameters:
> <...>
> 	Size 8193 blocks (including 1 for journal header) (first block
> 	18)
> ----
> 
> So my journal is only 32k? With Ext3 I used 192MB journal in data=journal

That's 32M, not 32K.

Note that the required size of the journal file depends in part on the maximum
amount of data in the journal that isn't stored to permanent locations yet.
As a result, if the journal commit process uses a "small and often" scheme,
you'll need less journal than one that makes large commits on a rare basis.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_1465480856P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9wurGcC3lWbTT17ARApWnAJ0QXtRVyJbxTaGbEfh05m6lCkJwMACgm3lH
VnHn795VWjFGvp0Nr5S+ZvU=
=6s5o
-----END PGP SIGNATURE-----

--==_Exmh_1465480856P--
