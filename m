From: Valdis.Kletnieks@vt.edu
Subject: Re: Reiserfs 1300G partition on lvm problem ...
Date: Sun, 29 May 2005 17:37:35 -0400
Message-ID: <200505292137.j4TLbarw017197@turing-police.cc.vt.edu>
References: <1117392967.29669.ezmlm@namesys.com>
            <429A1742.8030504@mh.be>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1117402655_6734P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24208-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sun, 29 May 2005 21:25:54 +0200."
             <429A1742.8030504@mh.be> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Matthias Barremaecker <info@mh.be>
Cc: reiserfs-list@namesys.com

--==_Exmh_1117402655_6734P
Content-Type: text/plain; charset=us-ascii

On Sun, 29 May 2005 21:25:54 +0200, Matthias Barremaecker said:

> but that sais it is a fysical drive error

Physical drive errors.  Your hardware is broken.  Isn't much that Reiserfs
can do about it.

> What can I do.

1) Call whoever you get hardware support from.

2) Be ready to restore from backups.

3) If you didn't have RAID-5 (or similar) set up, or a good backup, consider
it a learning experience.

If your data is important enough that you'll care if you lose it, you should take
steps to make sure you won't lose it... It's that simple.

(Just for the record, if we have important info, it gets at least RAID5, a
backup to tape or other device, *and* a *second* backup off-site.  And my shop
is far from the most paranoid about such things.)


--==_Exmh_1117402655_6734P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCmjYecC3lWbTT17ARAmPnAJ9/RMLl9uDmVeo/HR5cY7RnhznjNwCeP8+Q
8yu+5nYp1pOuybB4MSVNLFU=
=xLsh
-----END PGP SIGNATURE-----

--==_Exmh_1117402655_6734P--
