From: Valdis.Kletnieks@vt.edu
Subject: Re: disk runs full
Date: Thu, 12 May 2005 11:10:19 -0400
Message-ID: <200505121510.j4CFAJdk012045@turing-police.cc.vt.edu>
References: <42834307.2090101@gruber.cn>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1115910619_7142P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 12 May 2005 13:50:31 +0200."
             <42834307.2090101@gruber.cn> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alexander Gruber <alex@gruber.cn>
Cc: reiserfs-list@namesys.com

--==_Exmh_1115910619_7142P
Content-Type: text/plain; charset=us-ascii

On Thu, 12 May 2005 13:50:31 +0200, Alexander Gruber said:
> I checked it with du -sh * on the root partition and the result was much 
> smaller than the used space reported by df.

Note that temporary files are often creat()ed and then unlink()ed, leaving
the open file descriptor as the last reference.  You should probably run
'lsof' or similar tool.  On my laptop at the moment:

lsof -n | grep dele
cardmgr    2207       root    3u   CHR      254,0                5556 /dev/cm-2123-2 (deleted)
cardmgr    2207       root    4u   CHR      254,1                5559 /dev/cm-2123-5 (deleted)
cardmgr    2207       root    5u   CHR      254,2                5562 /dev/cm-2123-8 (deleted)
exmh       7142     valdis   10u   REG       0,16        0      74035 /tmp/tclfG25oV (deleted)
gconfd-2   7805     valdis   13wW  REG       0,16      641      44735 /tmp/gconfd-valdis/lock/0t1115905590ut151063u967p7805r252866408k3219173544 (deleted)
aspell     9481     valdis    2u   REG       0,16        0      74035 /tmp/tclfG25oV (deleted)

So there's 2 open but unlinked files on /tmp, and du and df will show up different
values. (Note that exmh did an open() of a file, unlinked it, and then passed
the open file descriptor to aspell as stdin - so that space will be reclaimed
once *both* of those processes have done a close() on the file descriptor).

--==_Exmh_1115910619_7142P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCg3HbcC3lWbTT17ARApz3AKDFxiyJ2PeP5qTj759gxaoW0Yqj5wCfWJy4
6H4TzImWwpFkjDmQ5xLfCd8=
=TlMa
-----END PGP SIGNATURE-----

--==_Exmh_1115910619_7142P--
