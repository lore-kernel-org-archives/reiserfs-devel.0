From: Valdis.Kletnieks@vt.edu
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 10:17:55 -0400
Message-ID: <200304281417.h3SEHudA003449@turing-police.cc.vt.edu>
References: <3EAD34D5.8030108@solidcode.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1471977021P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 28 Apr 2003 16:04:05 +0200."
             <3EAD34D5.8030108@solidcode.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Erik Terpstra <erik@solidcode.net>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1471977021P
Content-Type: text/plain; charset=us-ascii

On Mon, 28 Apr 2003 16:04:05 +0200, Erik Terpstra <erik@solidcode.net>  said:
> Hi,
> 
> I am looking for a solution for the following problem:
> 
> On a legacy system for newspaper workflow, files are delivered to a 
> certain directory (for example ~/input).
> These files (in TIFF format) can be quite large (10 to 400 MB), they 
> could be copied over the local filesystem, a Samba share or via FTP.
> When large files are copied over the network these files show up in 
> ~/input while they are being copied (you can see the filesize grow).
> 
> However TIFF files are only useful for further processing when they are 
> complete.

Note that *any* solution has to deal elegantly with the case of a transfer
that fails partway through.  No amount of 'fuser' or reiser trickery will
fix the case where you are receiving a 400mb TIFF, and the connection is
closed after 250M is transferred.

--==_Exmh_-1471977021P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+rTgTcC3lWbTT17ARAvosAKDhsIUaYZL9pfZNjdqLTwjh87VsigCfR+Ze
Dr4BTbaORucLB7Z1BtL9E7Q=
=7xfC
-----END PGP SIGNATURE-----

--==_Exmh_-1471977021P--
