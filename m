From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: reiser4: porting to 3.16: any reason ->aio_read() of struct file_operations has been left out?
Date: Wed, 20 Aug 2014 02:32:20 +0400
Message-ID: <10671542.MCAVDCHSND@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2893353.IxhOXVxpjS"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=+LVdI5w1sSC3AdRyGKF4GFIaC+MNW1T/yo59TGs2RZs=;
        b=PWa6WL4jZeGMPq23zvhrY16nyg+PtxF/3BxYC2+d2CCDCWkEi2G1oMBPrHGLPsT7df
         y1NkMfbztd1O/IhiJnrZM3/Ajrhdq3pNbSBt9+3Rd47xtwB3cMnqRgFb7fFed9mzRozP
         OYPBjqlgAxNMskmhy1TilgIaBeNmQrM7JWgWt/0StGUjI/BpLPGRFsT87WN8xlTkZ32m
         j1tUA20rDSWD3/rZ5L+MyNKk9rCShRywGgPnRirAsZX8ht+Z+UfCDDV5ci+kPo4Dk1Uv
         THeSqdi0nQ1xck4heiCBzr+k6JNaCNRWYcQROHAOSLu9J+XFySpT9H+d9HJUR633XT2c
         C2/A==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart2893353.IxhOXVxpjS
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

From=20`git log` I've seen that VFS people intend to replace ->aio_read()=
 and
=2D>aio_write() of struct file_operations with new methods ->read_iter() =
and
=2D>write_iter().

(Along with a couple of related new helpers, differing from previous ju=
st in
calling _iter methods instead of aio_ ones.)

From=20other filesystems it seems that these are simple drop-in replaceme=
nts
(however, well, I have zero familiarity with VFS). So here is a questio=
n:
is there any intentional reason that generic_file_aio_write() is not us=
ed
in reiser4?

What follows is a simple patch that I've currently applied to my own ke=
rnel
(seems to be the only significant vfs change affecting filesystems), ho=
wever,
I fear that these code-paths are not generally used, so my "works for m=
e"
isn't really representative. Could you please clarify the situation her=
e?

From=2081172835255a01718c2c256942d5887825a0cd7a Mon Sep 17 00:00:00 2001
From: Ivan Shapovalov <intelfx100@gmail.com>
Date: Tue, 19 Aug 2014 14:33:35 +0400
Subject: [PATCH] Adjust reiser4 to 3.16: ->{read,write}_iter of struct
 file_operations.

1. ->aio_{read,write} of struct file_operations are being replaced with=
 ->{read,write}_iter.
2. do_sync_{read,write} are being replaced with new_sync_{read,write}.
3. generic_file_splice_write is being replaced with iter_file_splice_wr=
ite.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
=2D--
 fs/reiser4/plugin/file/cryptcompress.c | 2 +-
 fs/reiser4/plugin/file/file.c          | 2 +-
 fs/reiser4/plugin/object.c             | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/reiser4/plugin/file/cryptcompress.c b/fs/reiser4/plugin=
/file/cryptcompress.c
index 8af388d..b0109fb 100644
=2D-- a/fs/reiser4/plugin/file/cryptcompress.c
+++ b/fs/reiser4/plugin/file/cryptcompress.c
@@ -2964,7 +2964,7 @@ ssize_t read_cryptcompress(struct file * file, ch=
ar __user *buf, size_t size,
 =09=09reiser4_exit_context(ctx);
 =09=09return result;
 =09}
=2D=09result =3D do_sync_read(file, buf, size, off);
+=09result =3D new_sync_read(file, buf, size, off);
=20
 =09context_set_commit_async(ctx);
 =09reiser4_exit_context(ctx);
diff --git a/fs/reiser4/plugin/file/file.c b/fs/reiser4/plugin/file/fil=
e.c
index 94029cd..e65c48d 100644
=2D-- a/fs/reiser4/plugin/file/file.c
+++ b/fs/reiser4/plugin/file/file.c
@@ -1752,7 +1752,7 @@ ssize_t read_unix_file(struct file *file, char __=
user *buf,
 =09switch (uf_info->container) {
 =09case UF_CONTAINER_EXTENTS:
 =09=09if (!reiser4_inode_get_flag(inode, REISER4_PART_MIXED)) {
=2D=09=09=09result =3D do_sync_read(file, buf, read_amount, off);
+=09=09=09result =3D new_sync_read(file, buf, read_amount, off);
 =09=09=09break;
 =09=09}
 =09case UF_CONTAINER_TAILS:
diff --git a/fs/reiser4/plugin/object.c b/fs/reiser4/plugin/object.c
index 553f1e2..e431e1f 100644
=2D-- a/fs/reiser4/plugin/object.c
+++ b/fs/reiser4/plugin/object.c
@@ -188,7 +188,7 @@ static struct file_operations regular_file_f_ops =3D=
 {
 =09.llseek =3D generic_file_llseek,
 =09.read =3D reiser4_read_dispatch,
 =09.write =3D reiser4_write_dispatch,
=2D=09.aio_read =3D generic_file_aio_read,
+=09.read_iter =3D generic_file_read_iter,
 =09.unlocked_ioctl =3D reiser4_ioctl_dispatch,
 #ifdef CONFIG_COMPAT
 =09.compat_ioctl =3D reiser4_ioctl_dispatch,
@@ -198,7 +198,7 @@ static struct file_operations regular_file_f_ops =3D=
 {
 =09.release =3D reiser4_release_dispatch,
 =09.fsync =3D reiser4_sync_file_common,
 =09.splice_read =3D generic_file_splice_read,
=2D=09.splice_write =3D generic_file_splice_write
+=09.splice_write =3D iter_file_splice_write
 };
 static struct address_space_operations regular_file_a_ops =3D {
 =09.writepage =3D reiser4_writepage,
=2D-=20
2.0.4

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2893353.IxhOXVxpjS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPz0HkACgkQxUKljSIMAnCvGAD/VMXi0Kw+Wsezy4RESDVZvlhC
9yy8Jx5wXbb8Mu/TEVkBANWalzJenZlNtZRU+XkUUPddioRcRGj7b9pmECAF3Z87
=jpH4
-----END PGP SIGNATURE-----

--nextPart2893353.IxhOXVxpjS--

