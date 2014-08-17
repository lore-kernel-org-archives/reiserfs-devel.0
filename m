From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 0/9] reiser4: batch discard support (FITRIM ioctl): initial implementation.
Date: Mon, 18 Aug 2014 01:56:25 +0400
Message-ID: <1685989.0lto5eJQ6M@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1864252.meuEHdt7Lh"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=g8RcwEMAoyPObdw6cI1C2S9mTRMIwAX4OXj0ooEJjHk=;
        b=hii18JTeJFHKcg36/6R55gGJcoKwkYlFFgFUAY3kNaGRVIBfwb8ZN/0xwaw+Y1izpe
         1HKx5oINZHKpldsxP47uXRXCSe8OzC4rTSaYDEcKQkAIO76/eRSqrJfAFQQ5d0Aflsc3
         b8JvW/HyiXD8gqja847sXYhzRpzY1/I+Ogmg1+Jn1xk2Whw4WbJfoWjbyp2facp5dfaW
         SfgWcioUFNOhAjWWi+3pOkAd2xZ6FEoUbAQoiOLYfhj2GyRyIquW7V/lkJ9y7YSwdxPb
         JrptvZU/y2lYziAZ8lbiIfqqBsWI91CLSLxOGz+Rw728Yzic8LrpGgNK08oFd6ReRc9i
         elOA==
In-Reply-To: <1408312379-1990-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com


--nextPart1864252.meuEHdt7Lh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 18 August 2014 at 01:52:50, Ivan Shapovalov wrote:=09
> [...]
>=20
> Ivan Shapovalov (9):
>   reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed a=
mount of space.
>   reiser4: block_alloc: add a "forward" parameter to reiser4_blocknr_=
hint to allocate blocks only in forward direction.
>   reiser4: txnmgr: free allocated but unneeded atom in atom_begin_and=
_assign_to_txnh().
>   reiser4: txnmgr: add reiser4_create_atom() which creates an empty a=
tom without capturing any nodes.
>   reiser4: txnmgr: call reiser4_post_write_back_hook() for empty atom=
s.
>   reiser4: batch discard support: add a dummy FITRIM ioctl handler fo=
r directories.
>   reiser4: batch discard support: actually implement the FITRIM ioctl=
 handler.
>   reiser4: block_alloc: add a "min_len" parameter to reiser4_blocknr_=
hint to limit allocated extent length from below.
>   reiser4: batch discard support: honor minimal extent length passed =
from=20the userspace.
>=20
>  [...]

This is a diff between v2 and v3, for ease of reviewing.

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 8797b43..9eed7fc 100644
=2D-- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -278,8 +278,7 @@ reiser4_grab(reiser4_context * ctx, __u64 count, re=
iser4_ba_flags_t flags)
=20
 =09if (flags & BA_SOME_SPACE) {
 =09=09/* Reserve 25% of all free space. */
=2D=09=09count =3D free_blocks;
=2D=09=09do_div(count, 4);
+=09=09count =3D free_blocks >> 2;
 =09}
=20
 =09if ((use_reserved && free_blocks < count) ||
diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
index 08b3941..16f9810 100644
=2D-- a/fs/reiser4/block_alloc.h
+++ b/fs/reiser4/block_alloc.h
@@ -45,6 +45,8 @@ struct reiser4_blocknr_hint {
 =09reiser4_block_nr blk;
 =09/* if not zero, it is a region size we search for free blocks in */=

 =09reiser4_block_nr max_dist;
+=09/* if not zero, minimal length of an extent to allocate */
+=09reiser4_block_nr min_len;
 =09/* level for allocation, may be useful have branch-level and higher=

 =09   write-optimized. */
 =09tree_level level;
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space=
/bitmap.c
index 9beaf66..8309cf9 100644
=2D-- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1101,7 +1101,7 @@ static int alloc_blocks_forward(reiser4_blocknr_h=
int *hint, int needed,
 =09=09=09=09reiser4_block_nr *start, reiser4_block_nr *len)
 {
 =09struct super_block *super =3D get_current_context()->super;
=2D=09int actual_len;
+=09int min_len, actual_len;
=20
 =09reiser4_block_nr search_start;
 =09reiser4_block_nr search_end;
@@ -1117,12 +1117,17 @@ static int alloc_blocks_forward(reiser4_blocknr=
_hint *hint, int needed,
 =09=09    LIMIT(hint->blk + hint->max_dist,
 =09=09=09  reiser4_block_count(super));
=20
+=09if (hint->min_len =3D=3D 0)
+=09=09min_len =3D 1;
+=09else
+=09=09min_len =3D (int)hint->min_len;
+
 =09/* We use @hint -> blk as a search start and search from it to the =
end
 =09   of the disk or in given region if @hint -> max_dist is not zero =
*/
 =09search_start =3D hint->blk;
=20
 =09actual_len =3D
=2D=09    bitmap_alloc_forward(&search_start, &search_end, 1, needed);
+=09    bitmap_alloc_forward(&search_start, &search_end, min_len, neede=
d);
=20
 =09/* There is only one bitmap search if max_dist was specified or fir=
st
 =09   pass was from the beginning of the bitmap. We also do one pass f=
or
@@ -1150,7 +1155,7 @@ static int alloc_blocks_backward(reiser4_blocknr_=
hint * hint, int needed,
 {
 =09reiser4_block_nr search_start;
 =09reiser4_block_nr search_end;
=2D=09int actual_len;
+=09int min_len, actual_len;
=20
 =09ON_DEBUG(struct super_block *super =3D reiser4_get_current_sb());
=20
@@ -1164,8 +1169,13 @@ static int alloc_blocks_backward(reiser4_blocknr=
_hint * hint, int needed,
 =09else
 =09=09search_end =3D search_start - hint->max_dist;
=20
+=09if (hint->min_len =3D=3D 0)
+=09=09min_len =3D 1;
+=09else
+=09=09min_len =3D (int)hint->min_len;
+
 =09actual_len =3D
=2D=09    bitmap_alloc_backward(&search_start, &search_end, 1, needed);
+=09    bitmap_alloc_backward(&search_start, &search_end, min_len, need=
ed);
 =09if (actual_len =3D=3D 0)
 =09=09return RETERR(-ENOSPC);
 =09if (actual_len < 0)
diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index 0048e83..f4cf0ff 100644
=2D-- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -14,7 +14,6 @@
 #include <linux/debugfs.h>
 #include <linux/backing-dev.h>
 #include <linux/module.h>
=2D#include <linux/delay.h>
=20
 /* slab cache for inodes */
 static struct kmem_cache *inode_cache;
@@ -482,28 +481,25 @@ static int reiser4_show_options(struct seq_file *=
m, struct dentry *dentry)
 int reiser4_trim_fs(struct super_block *super, struct fstrim_range* ra=
nge)
 {
 =09reiser4_blocknr_hint hint;
=2D=09reiser4_block_nr start, end, len, minlen, discarded_count =3D 0;
+=09reiser4_block_nr start, end, len, discarded_count =3D 0;
 =09reiser4_context *ctx;
=2D=09struct super_block *sb;
 =09txn_atom *atom;
 =09int ret, finished =3D 0;
=20
 =09reiser4_blocknr_hint_init(&hint);
 =09ctx =3D get_current_context();
=2D=09sb =3D ctx->super;
=20
 =09/*
 =09 * Configure the hint for block allocator.
 =09 * We will allocate in forward direction only.
 =09 */
=2D
=2D=09hint.blk =3D range->start >> sb->s_blocksize_bits;
=2D=09hint.max_dist =3D range->len >> sb->s_blocksize_bits;
+=09hint.blk =3D range->start >> super->s_blocksize_bits;
+=09hint.max_dist =3D range->len >> super->s_blocksize_bits;
+=09hint.min_len =3D range->minlen >> super->s_blocksize_bits;
 =09hint.block_stage =3D BLOCK_GRABBED;
 =09hint.forward =3D 1;
=20
 =09end =3D hint.blk + hint.max_dist;
=2D=09minlen =3D range->minlen >> sb->s_blocksize_bits;
=20
 =09/*
 =09 * We will perform the process in iterations in order not to starve=

@@ -536,7 +532,6 @@ int reiser4_trim_fs(struct super_block *super, stru=
ct fstrim_range* range)
 =09=09while (ctx->grabbed_blocks !=3D 0) {
 =09=09=09/*
 =09=09=09 * Allocate no more than is grabbed.
=2D=09=09=09 * FIXME: use minlen.
 =09=09=09 */
 =09=09=09len =3D ctx->grabbed_blocks;
 =09=09=09ret =3D reiser4_alloc_blocks(&hint, &start, &len, 0 /* flags =
*/);
@@ -597,7 +592,7 @@ out:
 =09/*
 =09 * Update the statistics.
 =09 */
=2D=09range->len =3D discarded_count << sb->s_blocksize_bits;
+=09range->len =3D discarded_count << super->s_blocksize_bits;
=20
 =09return ret;
 }

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1864252.meuEHdt7Lh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPxJQ0ACgkQxUKljSIMAnCJ+wD8Cr9BQmDuEEo/XrhTYbBH6xnm
6raDo5YXkfSb6B076OEA/0ZxE4FYCrD0VEg9tvSjLNVPVZv+CeEdmi3q9w9fV7U0
=NQFA
-----END PGP SIGNATURE-----

--nextPart1864252.meuEHdt7Lh--

