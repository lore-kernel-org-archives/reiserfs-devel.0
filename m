From: Thomas Raschbacher <lordvan@lordvan.com>
Subject: [Fwd: Re: Reiserfsck can't fix FS]
Date: Fri, 14 Oct 2005 23:26:46 +0100
Message-ID: <1129328806.6906.5.camel@desktop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-y1jWOcSmgCR/K689HF9x"
Return-path: <reiserfs-list-return-26530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs List <reiserfs-list@namesys.com>

--=-y1jWOcSmgCR/K689HF9x
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

forgot to CC the list. sorry
-------- Forwarded Message --------
From: Thomas Raschbacher <lordvan@lordvan.com>
To: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiserfsck can't fix FS
Date: Fri, 14 Oct 2005 20:32:09 +0100

Hi!

The check on the image worked out fine.
I didn't see a failed block read so far. I'll maybe try to dd
if=3D/dev/... of=3D/dev/null tomorrow to see if there are failed block
reads .. but if not .. any idea what else it could be? (or at least how
to fix it?)

Thanks

On Fri, 2005-10-14 at 20:08 +0400, Vitaly Fertman wrote:
> Hello Thomas!
>=20
> On Friday 14 October 2005 19:21, Thomas Raschbacher wrote:
> > Hi,
> >=20
> > I had to run reiserfsck on my usb hdd because there were some problems.
> > It told me to rebuild the tree (because I couldn't mount it I coudlnt'
> > backup things and I didn't have enough space (50GB) spare for a disk
> > image).
> >=20
> > attached my logfiles and (where i remembered to save it the stdout
> > output)
> >=20
> > It alwasy aborts at the same place.
> >=20
> > (i did the same for another partition and there after running reiserfsc=
k
> > --rebuild-tree about 10 times it worked out ok but this one seems to be
> > a problem ..)
> >=20
> > reiserfsck 3.6.19 (2003 www.namesys.com)
> > Linux version 2.6.12-gentoo-r6 (root@desktop) (gcc version
> > 3.4.3-20050110 (Gentoo 3.4.3.20050110-r2, ssp-3.4.3.20050110-0,
> > pie-8.7.7)) #1 Thu Jul 21 20:21:20 BST 2005
> > (i can provide kernel config file if needed)
> >=20
> > Please let me know if ther'es anything I can do as there's quite a bit
> > of data on that drive.
>=20
> it is possible to check how reiserfsck works, you can extract=20
> the fs metadata and fsck them on another compter. this does=20
> not require you to have 50M as there are not real data:
> 	debugreiserfs -p /dev/discs/disc2/part6 | bzip2 -c > part6.bz2
> go to another computer:
> 	touch part6.image
> 	bunzip2 -c part6.bz2 | debugreiserfs -u part6.image
> 	reiserfsck --rebuild-tree part6.image -l logfile
>=20
> if it finishes successfully, the problem is in your hardware.
> As the same block number repeats and there is also a failed=20
> block read, the problem is likely to be IO related.
>=20
> it fsck fails on your metadata, I would like to have a look=20
> at part6.bz2.
>=20
--=20
-----BEGIN GEEK CODE BLOCK-----
GCS/CC/E/M/MU/S d- s: a--- C++++(++) UL++++ P+ L++++ E W+++ N+++ o-- K
w-- O
M-- V- PS+ PE-- Y++ PGP+++ t+++ 5+ X- R tv b++++ DI- D+ G++ e-->+++++
h-- !r
z-=20
------END GEEK CODE BLOCK------

--=-y1jWOcSmgCR/K689HF9x
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDUDCmv20tKfoYgekRAgjKAKCWnhMkTjm3Yt4AS8tMlDwgJ2B6zgCePqJZ
gXdQ9lP3lk7soF9SFqxA6G8=
=xUI2
-----END PGP SIGNATURE-----

--=-y1jWOcSmgCR/K689HF9x--

