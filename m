From: Prakash Punnoor <prakash@punnoor.de>
Subject: reiser4 nfsroot problem
Date: Thu, 17 Aug 2006 18:35:52 +0200
Message-ID: <200608171835.52188.prakash@punnoor.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1976925.dzEuWRTQ5E";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart1976925.dzEuWRTQ5E
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

Using the reiser4 patch 3 for 2.6.17 with a 2.6.18-rc4 kernel (I ported the=
=20
reiser4 patch by hand with help of mm kernel...) I wasn't able to boot a=20
nfsroot client with the "image" residing on a master with reiser4 partition=
=2E=20
The same setup works w/o problems once I moved the "image" to an ext3=20
partition.

The client't kernel dies with:

nfs_stat_to_errno: bad nfs status return value: 45
Warning: unable to open an initial console.
nfs_stat_to_errno: bad nfs status return value: 45
nfs_stat_to_errno: bad nfs status return value: 45
nfs_stat_to_errno: bad nfs status return value: 45
nfs_stat_to_errno: bad nfs status return value: 45
Kernel panic - not syncing: No init found.  Try passing init=3D option to=20
kernel.

though claims it mounted the root file system.

Is this a known problem?

Cheers,
=2D-=20
(=C2=B0=3D                 =3D=C2=B0)
//\ Prakash Punnoor /\\
V_/                 \_V

--nextPart1976925.dzEuWRTQ5E
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBE5JroxU2n/+9+t5gRAubMAJ93WMasMxRZk468zvTAZX5ze+1HPACfTY3t
wZJ4kp1xsqJkAMQMtGj5epM=
=z4S8
-----END PGP SIGNATURE-----

--nextPart1976925.dzEuWRTQ5E--
