From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: lost partition table
Date: Sun, 26 Mar 2006 12:07:32 +0100
Message-ID: <1143371252.9216.20.camel@teratron.lan.etheus.net>
References: <1142439481.27675.ezmlm@namesys.com>
	 <20060324135549.GB13979@raven.londonmet.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Vz6zf6otSrjfvz/p0sg9"
Return-path: <reiserfs-list-return-28346-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060324135549.GB13979@raven.londonmet.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-Vz6zf6otSrjfvz/p0sg9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-03-24 at 13:55 +0000, ild0012@raven.londonmet.ac.uk wrote:
> Hello folks.
>=20
> i am using slackware linux(2.6.14 with reiser4 patch) on x86_64 and was t=
rying to install free_bsd on a separate partition.
> well, during that instalation , accedentualy i have pressed a wrong key ,=
 so my partition table is owerriten by something else , but i realized this=
 streight away and stopped the instalation process .


I once did this by running fsck.reiser4 on the whole disk, instead of on
the first partition.

luckily, I wrote down what was in /proc/partitions, and reconstructed
the partition table with help from hexedit to check the exact alignment
of the partitions.

As for the first partition on the disk, I had let fsck.reiser4 run to
completion, fixing thousands of errors, with the various rebuild options
turned on. Obviously this had caused a lot of damage to the file system,
with it being off-set from the beginning of the disk. Amazingly
re-running fsck.reiser4 on the actual partition seemed to do the trick,
leaving only a few libraries corrupt.

Quick tip: I found that about 0x11044 bytes in from the beginning of a
Reiser4 partition, you find the string "ReIsEr40FoRmAt". I am sure other
file systems have similar magic strings which can be searched for using
hexedit, enabling the partition table to be fixed.


--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-Vz6zf6otSrjfvz/p0sg9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBEJnX05OI9vmOoVqERAr7iAJ9ZwTT2W688d/dSX3hg5ag/Uxj6aACg+Qv0
4ngpOxF4V62lyYkc7r18uFs=
=4D8e
-----END PGP SIGNATURE-----

--=-Vz6zf6otSrjfvz/p0sg9--

