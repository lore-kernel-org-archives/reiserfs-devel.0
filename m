From: Valdis.Kletnieks@vt.edu
Subject: Re: Reiserfs 1300G partition on lvm problem ...
Date: Mon, 30 May 2005 03:37:12 -0400
Message-ID: <200505300737.j4U7bDKj002829@turing-police.cc.vt.edu>
References: <1117392967.29669.ezmlm@namesys.com> <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu>
            <429AAFDC.4050208@mh.be>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1117438632_30818P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24219-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 30 May 2005 08:17:00 +0200."
             <429AAFDC.4050208@mh.be> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Matthias Barremaecker <info@mh.be>
Cc: reiserfs-list@namesys.com

--==_Exmh_1117438632_30818P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 30 May 2005 08:17:00 +0200, Matthias Barremaecker said:

> I did a bad block check and I have 10 bad blocks of 4096bytes on 1300Gi=
g=20
> and ... that is the reason reiserfs will not work anymore.

> I guess this sux. I rather have that the data on the bad blocks is just=
=20
> corupted but the rest is accesseble.

It all depends on which 10 blocks go bad.  If it's a block that's allocat=
ed to
a file, you lose the 4K or whatever that's in that block.

If it's a block that an inode lives in, you're probably going to have the=

entire file evaporate.

If it's a block that contains something even more important, you're going=
 to
have large sections of the file system evaporate.

It's a tradeoff issue - how many times do you replicate metadata on the
filesystem, against how well the file system deals with errors.  The prob=
lem is
that if you just say =22let's have 2 copies of everything, just in case=
=22, it
takes a lot more disk space to *store* 2 copies of the metadata.  Also, y=
our
disk performance falls through the floor - most journalled filesystems ha=
ve
enough trouble making sure that *one* copy of things like the free list i=
s on
disk and consistent with the journal.  Making 2 copies is going to probab=
ly
triple your disk I/O and complicate matters a *lot* for fsck (if you cras=
h and
the two copies aren't consistent, which one do you believe?)

That's why almost all filesystems designers just punt and assume that the=
 media
actually works, and suggest if your media might not be 100% reliable, tha=
t you
use RAID or similar solutions....


--==_Exmh_1117438632_30818P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCmsKocC3lWbTT17ARAkWKAJ9k3aQfB+h65gyluQVnyJM7fG1vZQCfZdnc
vBler02IAAJLmis2zqzAkww=
=LxuH
-----END PGP SIGNATURE-----

--==_Exmh_1117438632_30818P--
