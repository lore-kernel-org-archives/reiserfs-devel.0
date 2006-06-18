From: Christian Trefzer <ctrefzer@gmx.de>
Subject: got some "nikita-3233"s here...
Date: Sun, 18 Jun 2006 19:48:22 +0200
Message-ID: <20060618174822.GA26114@zeus.uziel.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <reiserfs-list-return-28811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks,

just had this in my dmesg after git yelled at me:

reiser4[git-update-inde(24210)]: extent2tail (/usr/src/sources/linux-git/fs=
/reiser4/plugin/file/tail_conversion.c:662)[]:
WARNING: write_tail failed
reiser4[git-update-inde(24210)]: release_unix_file (/usr/src/sources/linux-=
git/fs/reiser4/plugin/file/file.c:2260)[nikita-3233]:
WARNING: Failed (-28) to convert in release_unix_file (215174)
reiser4[git-unpack-file(24222)]: extent2tail (/usr/src/sources/linux-git/fs=
/reiser4/plugin/file/tail_conversion.c:662)[]:
WARNING: write_tail failed
reiser4[git-unpack-file(24222)]: release_unix_file (/usr/src/sources/linux-=
git/fs/reiser4/plugin/file/file.c:2260)[nikita-3233]:
WARNING: Failed (-28) to convert in release_unix_file (213520)
reiser4[git-update-inde(24221)]: extent2tail (/usr/src/sources/linux-git/fs=
/reiser4/plugin/file/tail_conversion.c:662)[]:
WARNING: write_tail failed
reiser4[git-update-inde(24221)]: release_unix_file (/usr/src/sources/linux-=
git/fs/reiser4/plugin/file/file.c:2260)[nikita-3233]:
WARNING: Failed (-28) to convert in release_unix_file (215179)
reiser4[git-update-inde(24232)]: extent2tail (/usr/src/sources/linux-git/fs=
/reiser4/plugin/file/tail_conversion.c:662)[]:
WARNING: write_tail failed
reiser4[git-update-inde(24232)]: release_unix_file (/usr/src/sources/linux-=
git/fs/reiser4/plugin/file/file.c:2260)[nikita-3233]:
WARNING: Failed (-28) to convert in release_unix_file (215183)
reiser4[git-update-inde(24232)]: extent2tail (/usr/src/sources/linux-git/fs=
/reiser4/plugin/file/tail_conversion.c:662)[]:
WARNING: write_tail failed
reiser4[git-update-inde(24232)]: release_unix_file (/usr/src/sources/linux-=
git/fs/reiser4/plugin/file/file.c:2260)[nikita-3233]:
WARNING: Failed (-28) to convert in release_unix_file (215184)
reiser4[git-unpack-file(24255)]: extent2tail (/usr/src/sources/linux-git/fs=
/reiser4/plugin/file/tail_conversion.c:662)[]:
WARNING: write_tail failed
reiser4[git-unpack-file(24255)]: release_unix_file (/usr/src/sources/linux-=
git/fs/reiser4/plugin/file/file.c:2260)[nikita-3233]:
WARNING: Failed (-28) to convert in release_unix_file (213523)
reiser4[git-unpack-file(24257)]: extent2tail (/usr/src/sources/linux-git/fs=
/reiser4/plugin/file/tail_conversion.c:662)[]:
WARNING: write_tail failed
reiser4[git-unpack-file(24257)]: release_unix_file (/usr/src/sources/linux-=
git/fs/reiser4/plugin/file/file.c:2260)[nikita-3233]:
WARNING: Failed (-28) to convert in release_unix_file (121385)
reiser4[git-checkout-in(24262)]: extent2tail (/usr/src/sources/linux-git/fs=
/reiser4/plugin/file/tail_conversion.c:714)[nikita-2282]:
WARNING: Partial conversion of 121385: 3 of 4: -22
reiser4[git-checkout-in(24262)]: release_unix_file (/usr/src/sources/linux-=
git/fs/reiser4/plugin/file/file.c:2260)[nikita-3233]:
WARNING: Failed (-22) to convert in release_unix_file (121385)
reiser4[git-read-tree(24272)]: extent2tail (/usr/src/sources/linux-git/fs/r=
eiser4/plugin/file/tail_conversion.c:714)[nikita-2282]:
WARNING: Partial conversion of 213520: 3 of 4: -22
reiser4[git-read-tree(24272)]: release_unix_file (/usr/src/sources/linux-gi=
t/fs/reiser4/plugin/file/file.c:2260)[nikita-3233]:
WARNING: Failed (-22) to convert in release_unix_file (213520)

Next logical step was umount and fsck, which gave (with --check at
first):

FSCK: Directory [1d9ce:33640000000000:22dc4]: can't find the object=20
[1d9ce:6f626a5f77576c:34210] pointed by the entry=20
[ce69096aa8509b067aceb38324d8ec7de0e1aa].=20
FSCK: Directory [1d9ce:34340000000000:1da28]: can't find the object=20
[1da28:130613733336665:1da29] pointed by the entry=20
[0a733fe2e9ea3d1374d4fd72e7bba60e268e05].=20
FSCK: Directory [1d9ce:36310000000000:27582]: can't find the object=20
[1d9ce:6f626a5f75494a:34213] pointed by the entry=20
[b5b6191e22aad81fd7279878490b150a68c061].=20
FSCK: Directory [1d9ba:6b65726e656c00:33416]: can't find the object=20
[33416:c6776f726b717565:3488f] pointed by the entry [workqueue.c].=20

and afterwards with --fix:

FSCK: Directory [1d9ce:33640000000000:22dc4]: can't find the object=20
[1d9ce:6f626a5f77576c:34210] pointed by the entry=20
[ce69096aa8509b067aceb38324d8ec7de0e1aa]. Entry is removed.=20
FSCK: Directory [1d9ce:34340000000000:1da28]: can't find the object=20
[1da28:130613733336665:1da29] pointed by the entry=20
[0a733fe2e9ea3d1374d4fd72e7bba60e268e05]. Entry is removed.=20
FSCK: Directory [1d9ce:36310000000000:27582]: can't find the object=20
[1d9ce:6f626a5f75494a:34213] pointed by the entry=20
[b5b6191e22aad81fd7279878490b150a68c061]. Entry is removed.=20
FSCK: Directory [1d9ba:6b65726e656c00:33416]: can't find the object=20
[33416:c6776f726b717565:3488f] pointed by the entry [workqueue.c]. Entry is=
=20
removed.=20

Now git screws around a little, guess it is missing the four entries
that have been removed. Will look further into this.


Kind regards,
Chris

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iQIVAwUBRJWR5l2m8MprmeOlAQIivA/9FT3ie2nENZ+QhfyWCsWWdkCXgTMuwNHK
fsMxszwBxdFS6aqYVrlZVcL2etb99izX4S+2WxcL6imd6010NZwvTagqlspf+KZJ
/WmU0WYIIjzQwWN3iM2j/NFc0zAaVH+BZqnT0x8I1BKlirP4Cdn95nt9RvxB/AT9
OgweEyuSI1DTua1x4KlVgAB/7JmxdBssqffovqtc9k4ntmCVRybd1n5iEzYapBde
dRTaQpTPwKeRRRN8Vs1QoB0C4Edh97wF1PpU5LlRaP/zePY/+/1dhKkz00m8lSyC
jArBFQXZ69D5+eXSe+TyM+wTbhzmdPHz6jv8lvbTjAKtaLxuS4r+2AVY1uYPPxH3
iRmi5aeKHn3hdSVtkfzttv3pa8UBfVUXnk+2mdQbpXX2odidtrKH8rjh7a9MrGQ0
UoSrV9v0WxXKnEavISm27dQtcnjG3H+899pTvizg5lCoGiwPzeQvpRfHMXc+A2az
6akGv5ueTYEwn4iuQQ7PBKJoMVrXw6qZDQUWSYBP757urkb4heAckm4pJ10JjyHh
Blfe67Wev8zkOBwbMcdOKWm4xZU+s5hq78LPMEQdN+O7buRA+BgKaa2vxFpm/vqW
cheo70vMrtH0sALnMmioBiuBggdKPy8CmeB/vZ31nuDgtxZyN9JP+P+o6yp8WKOp
oBIjVG26dMI=
=268O
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

