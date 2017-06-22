From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: don't preallocate blocks for extended attributes
Date: Thu, 22 Jun 2017 16:35:04 -0400
Message-ID: <3c7d90d8-4f87-8c37-3ba3-11d5e5bf5c78@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="id92wDqoGgeb7fUImrNhdOqLTIetx6pL6"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--id92wDqoGgeb7fUImrNhdOqLTIetx6pL6
Content-Type: multipart/mixed; boundary="QNgQ1HCe4MNph8VxkhotEep1tL5jdGMi8";
 protected-headers="v1"
From: Jeff Mahoney <jeffm@suse.com>
To: reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.com>
Message-ID: <3c7d90d8-4f87-8c37-3ba3-11d5e5bf5c78@suse.com>
Subject: [PATCH] reiserfs: don't preallocate blocks for extended attributes

--QNgQ1HCe4MNph8VxkhotEep1tL5jdGMi8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Most extended attributes will fit in a single block.  More importantly,
we drop the reference to the inode while holding the transaction open
so the preallocated blocks aren't released.  As a result, the inode
may be evicted before it's removed from the transaction's prealloc list
which can cause memory corruption.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/bitmap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -980,7 +980,7 @@ static int determine_prealloc_size(reise
 	hint->prealloc_size =3D 0;
=20
 	if (!hint->formatted_node && hint->preallocate) {
-		if (S_ISREG(hint->inode->i_mode)
+		if (S_ISREG(hint->inode->i_mode) && !IS_PRIVATE(hint->inode)
 		    && hint->inode->i_size >=3D
 		    REISERFS_SB(hint->th->t_super)->s_alloc_options.
 		    preallocmin * hint->inode->i_sb->s_blocksize)

--=20
Jeff Mahoney
SUSE Labs


--QNgQ1HCe4MNph8VxkhotEep1tL5jdGMi8--

--id92wDqoGgeb7fUImrNhdOqLTIetx6pL6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2

iQIVAwUBWUwp+R57S2MheeWyAQhnkQ//eRwTTVrJ3UUjCXl6sdU/mbzYw6xOg3Jc
vgj3lNiQObTiuu4db79gbP9lScz1Apd0oW5+CxKFGKkdkphpc3oQ4aNO92Xphott
OYezIVx331YAfMQ+/l1Ri6QUloBo0ZG93nDwxw3WJfkqFGV+3dFnqA7QHM5qvnHD
mZiznMYn2Mj9BCD4qcFT2wzvwbVbnKAlpbfE476ARFmoBQcMq5J7KfeGP5WUE7i/
NWE+TrMA03olcPrez22fxGVQiUGIZuU4rjNK+IOH3rawoL7s40PKz0bl/FmzmCHD
93eLPLMGhu0iqsixdbCEPd/LzRa2shIm1T12/Axn7QcCGHUWXekhA+chTOMwg57V
z/CbapcAYQ6rLcrBVDH8/p4vIui2NHqINYBS3UFyFhoyyLlGOy4abnUFX8uFLSdQ
PGlwXpqnV7arE9kK64SbZosmG9pcLckfsW8E+y6vI2rOguvhgePcOUVLuqdw4H2m
63pKoR2VstgsVS0BYPmim0NpT9YflORgVWxp0OLgFGZ30vpwwsfSOQ8rCiO8KBvM
NZf62Xamby1eaTfafayCZR1TZvKJWRBnRIpxdX/GhmWhN07vgkcMsTykkGRkHr7l
tRKdnn8GLhgM4LXd+A5D2RmoLHmERLDCN0GzZZoRClPJuMGmPecyuRjwVAKAqqNn
UCEMsV5jRSM=
=sIXk
-----END PGP SIGNATURE-----

--id92wDqoGgeb7fUImrNhdOqLTIetx6pL6--
