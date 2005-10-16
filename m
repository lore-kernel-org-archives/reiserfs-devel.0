From: Thomas Raschbacher <lordvan@lordvan.com>
Subject: Re: Reiserfsck can't fix FS
Date: Sun, 16 Oct 2005 18:40:35 +0100
Message-ID: <1129484435.16949.1.camel@desktop>
References: <1129303303.3370.4.camel@desktop>
	 <200510142008.42253.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-UzBeeWl9ldt1qFSbhQMM"
Return-path: <reiserfs-list-return-26543-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510142008.42253.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

--=-UzBeeWl9ldt1qFSbhQMM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

just a quick addition:

I ran this:

desktop lordvan # dd if=3D/dev/discs/disc2/part6  of=3D/dev/null bs=3D8k
1192384+0 records in
1192384+0 records out
1209296+0 records in
1209296+0 records out
1275725+0 records in
1275725+0 records out
1326505+0 records in
1326505+0 records out
1790232+0 records in
1790232+0 records out
2255571+0 records in
2255571+0 records out
2447343+0 records in
2447343+0 records out
6220163+1 records in
6220163+1 records out

as you see it produced no errors at all so the HDD can be read fine. any
idea what could cause the problem?

Thanks,
  THomas

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

--=-UzBeeWl9ldt1qFSbhQMM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDUpCTv20tKfoYgekRArfXAKCYuebMORmXp/SGSYY+S6dulbSESACcD4rL
G57H2VBLgLq7chI7VwyBxv0=
=3AuO
-----END PGP SIGNATURE-----

--=-UzBeeWl9ldt1qFSbhQMM--

