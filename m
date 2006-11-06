From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 cryptcompress test setup: bug
Date: Mon, 06 Nov 2006 17:07:16 -0500
Message-ID: <200611062207.kA6M7Gsj002629@turing-police.cc.vt.edu>
References: <eio2bt$hdj$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1162850836_5721P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 06 Nov 2006 19:27:57 GMT."
             <eio2bt$hdj$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: danny.milo@scratchpost.org
Cc: reiserfs-list@namesys.com

--==_Exmh_1162850836_5721P
Content-Type: text/plain; charset=us-ascii

On Mon, 06 Nov 2006 19:27:57 GMT, Danny Milosavljevic said:
> Hi Edward,
> 
> I finally tried your cryptcompress setup (2.6.18-mm3) and just did the
> first evil thing I could think of:
> 
> the reiser4 partition with ccreg40 enabled is /dev/sda1 (/mnt/tmp/)
> (mkfs'ed, thus empty).

> [  372.564358]  [<c01b6400>] ext3_dirty_inode+0x30/0x90
> [  372.564364]  [<c016b4b9>] cp_new_stat64+0xf9/0x110

You might want to check /home sometime - this looks like an ext3 botch
rather than a reiserfs botch, unless reiser4 is stomping on something
behind ext3's back.

--==_Exmh_1162850836_5721P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFFT7IUcC3lWbTT17ARAiJ9AJ9h9KSkCZrG8FZmvfkm7YJh/MKb0ACgiQuG
v9zTyX4JIHrK8o29RWStZcQ=
=SjzL
-----END PGP SIGNATURE-----

--==_Exmh_1162850836_5721P--
