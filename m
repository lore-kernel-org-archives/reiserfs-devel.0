From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Journal writes hanging in presence of I/O errors
Date: 08 Aug 2002 13:57:16 -0600
Message-ID: <1028836637.5940.16.camel@oberon.rnd.esoft.com>
References: <1028828929.9189.25.camel@spoon.durables.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-nyG8CdPyQDl+CSGRZdg/"
Return-path: <reiserfs-list-return-11144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1028828929.9189.25.camel@spoon.durables.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--=-nyG8CdPyQDl+CSGRZdg/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2002-08-08 at 11:48, Robert Walsh wrote:
I'm using a logical volume
> manager that I can inject faults into in order to test filesystem and
> driver behavior.
>=20
> Any ideas?  The ideal behavior would be that the write system call just
> fails with EIO.

This reminded me of something.  I was thinking about bad blocks and
other I/O errors this week because one of my IBM 60GXP drives is
failing.)=20

I have this idea, and I wonder if anyone is already working on it?

Bad blocks and disk errors are a problem for every file system.  Modern
hard drives handle bad sectors by using the firmware to relocate to a
good sector.  The Linux kernel should have another layer (LVM, probably)
between the hard drive and the file system that can do the same thing.=20
The LVM layer should replace bad physical blocks with good ones.  This
way, the file system never needs to worry about it, except perhaps by
setting a fsck-required flag.  File system check would be required
because on a read error, the replacement block wouldn't contain the
correct data.

Has anyone written this into LVM?
--=20
Jonathan Briggs
jbriggs@esoft.com

--=-nyG8CdPyQDl+CSGRZdg/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9Us0cG8fHaOLTWwgRAm7OAKCcNCX/aaAYem5fI0BYx8hbLZhGTQCgnE3R
hkwiUG401l7KCh2VmohRcpY=
=r1+v
-----END PGP SIGNATURE-----

--=-nyG8CdPyQDl+CSGRZdg/--


