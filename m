From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv7 0/6] reiser4: discard support: simplified and race-free initial implementation.
Date: Thu, 31 Jul 2014 14:34:43 +0400
Message-ID: <7039066.L9FjB0NPsX@intelfx-laptop>
References: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3202331.yOTRfuCa6s"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=Tu3zMCghs4txGHm3AYrzXAhCKgWBz38yi/m1X6EXw78=;
        b=CJyQ9KwfmGds4+q2c3Svnp2qYQy+sKQGcHTGuq2TTeV7QPjQW1kFG+QSIf+GWeNWin
         kuh9VnFeNwc+e3LGicK6QI99VzNGLURcssvCi4R9Ua2qFCcwN2m5+kwqStF4LTnD81G+
         uo3/yB/ZcvVnZjKYKxtx/A54qZpmBnN/BG7sM82CaZV9UmtwbUocMH0Fkvi9HCKkrUz8
         nF9v69KMUSQZ8yDc85T5qbskUUuPDvGVkM1j6j0N7Uo4ANE7nISPetfHHsX+NMhWr243
         nBfoPrjNm/jc0cr2QpCHtoITKpsXFMCmx4C+vq+UFN909y9zSiYADLO7hfvfwOfqWenu
         yYww==
In-Reply-To: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com


--nextPart3202331.yOTRfuCa6s
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 31 July 2014 at 14:19:43, Ivan Shapovalov wrote:=09
> [...]
>=20
> Ivan Shapovalov (6):
>   reiser4: fix reiser4_post_{commit,write_back}_hook() and their invo=
cations.
>   reiser4: make space_allocator's check_blocks() reusable.
>   reiser4: add an implementation of "block lists", splitted off the d=
iscard code.
>   reiser4: blocknr_list: use kmem_cache instead of kmalloc for alloca=
ting entries.
>   reiser4: blocknr_set: use kmem_cache instead of kmalloc for allocat=
ing entries.
>   reiser4: discard support: initial implementation using blocknr_list=
, without extent padding.
>=20
> [...]

This is a diff between previous two patchsets and this one, for ease of=
 reviewing.

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 98080a1..324b11c 100644
=2D-- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -9,6 +9,7 @@ reiser4/README */
 #include "block_alloc.h"
 #include "tree.h"
 #include "super.h"
+#include "discard.h"
=20
 #include <linux/types.h>=09/* for __u??  */
 #include <linux/fs.h>=09=09/* for struct super_block  */
@@ -1144,7 +1145,7 @@ void reiser4_post_write_back_hook(void)
 =09} while (ret =3D=3D -E_REPEAT);
=20
 =09if (ret) {
=2D=09=09warning("intelfx-8", "discard atom failed (%ld)", ret);
+=09=09warning("intelfx-8", "discard atom failed (%d)", ret);
 =09}
=20
 =09atom =3D get_current_atom_locked();
diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index 8442619..7a07afc 100644
=2D-- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -53,23 +53,21 @@
  * the atom's delete set becomes "the discard set" -- list of blocks t=
hat have
  * to be considered for discarding.
  *
=2D * On atom commit we will generate a minimal superset of the discard s=
et,
=2D * comprised of whole erase units.
=2D *
  * Discarding is performed before completing deferred deallocations, h=
ence all
  * extents in the discard set are still marked as allocated and cannot=
 contain
  * any data. Thus we can avoid any checks for blocks directly present =
in the
  * discard set.
  *
=2D * However, we pad each extent from both sides to erase unit boundarie=
s, and
=2D * these paddings still have to be checked if they fall outside of ini=
tial
=2D * extent (may not happen if block size > erase unit size).
+ * For now, we don't perform "padding" of extents to erase unit bounda=
ries.
+ * This means if extents are not aligned with the device's erase unit =
lattice,
+ * the partial erase units at head and tail of extents are truncated b=
y kernel
+ * (in blkdev_issue_discard()).
  *
  * So, at commit time the following actions take place:
  * - delete sets are merged to form the discard set;
  * - elements of the discard set are sorted;
  * - the discard set is iterated, joining any adjacent extents;
=2D * - <TODO>
+ * - for each extent, a single call to blkdev_issue_discard() is done.=

  */
=20
 #include "discard.h"
@@ -98,92 +96,20 @@ static int discard_extent(txn_atom *atom UNUSED_ARG=
,
 {
 =09struct super_block *sb =3D reiser4_get_current_sb();
 =09struct block_device *bdev =3D sb->s_bdev;
=2D=09struct queue_limits *limits =3D &bdev_get_queue(bdev)->limits;
=20
=2D=09sector_t extent_start_sec, extent_end_sec,
=2D=09         unit_sec, request_start_sec =3D 0, request_len_sec =3D 0;
=2D=09reiser4_block_nr unit_start_blk, unit_len_blk;
=2D=09int ret, erase_unit_counter =3D 0;
+=09sector_t extent_start_sec, extent_len_sec;
=20
 =09const int sec_per_blk =3D sb->s_blocksize >> 9;
=20
=2D=09/* from blkdev_issue_discard():
=2D=09 * Zero-sector (unknown) and one-sector granularities are the same.=
  */
=2D=09const int granularity =3D max(limits->discard_granularity >> 9, 1U)=
;
=2D=09const int alignment =3D (bdev_discard_alignment(bdev) >> 9) % granu=
larity;
=2D
 =09/* we assume block =3D N * sector */
 =09assert("intelfx-7", sec_per_blk > 0);
=20
 =09/* convert extent to sectors */
 =09extent_start_sec =3D *start * sec_per_blk;
=2D=09extent_end_sec =3D (*start + *len) * sec_per_blk;
+=09extent_len_sec =3D *len * sec_per_blk;
=20
=2D=09/* round down extent start sector to an erase unit boundary */
=2D=09unit_sec =3D extent_start_sec;
=2D=09if (granularity > 1) {
=2D=09=09sector_t tmp =3D extent_start_sec - alignment;
=2D=09=09unit_sec -=3D sector_div(tmp, granularity);
=2D=09}
=2D
=2D=09/* iterate over erase units in the extent */
=2D=09do {
=2D=09=09/* considering erase unit:
=2D=09=09 * [unit_sec; unit_sec + granularity) */
=2D
=2D=09=09/* calculate block range for erase unit:
=2D=09=09 * [unit_start_blk; unit_start_blk+unit_len_blk) */
=2D=09=09unit_start_blk =3D unit_sec;
=2D=09=09do_div(unit_start_blk, sec_per_blk);
=2D
=2D=09=09if (granularity > 1) {
=2D=09=09=09unit_len_blk =3D unit_sec + granularity - 1;
=2D=09=09=09do_div(unit_len_blk, sec_per_blk);
=2D=09=09=09++unit_len_blk;
=2D
=2D=09=09=09assert("intelfx-22", unit_len_blk > unit_start_blk);
=2D
=2D=09=09=09unit_len_blk -=3D unit_start_blk;
=2D=09=09} else {
=2D=09=09=09unit_len_blk =3D 1;
=2D=09=09}
=2D
=2D=09=09if (reiser4_check_blocks(&unit_start_blk, &unit_len_blk, 0)) {
=2D=09=09=09/* OK. Add this unit to the accumulator.
=2D=09=09=09 * We accumulate discard units to call blkdev_issue_discard()=

=2D=09=09=09 * not too frequently. */
=2D
=2D=09=09=09if (request_len_sec > 0) {
=2D=09=09=09=09request_len_sec +=3D granularity;
=2D=09=09=09} else {
=2D=09=09=09=09request_start_sec =3D unit_sec;
=2D=09=09=09=09request_len_sec =3D granularity;
=2D=09=09=09}
=2D=09=09} else {
=2D=09=09=09/* This unit can't be discarded. Discard what's been accumula=
ted
=2D=09=09=09 * so far. */
=2D=09=09=09if (request_len_sec > 0) {
=2D=09=09=09=09ret =3D __discard_extent(bdev, request_start_sec, request_=
len_sec);
=2D=09=09=09=09if (ret !=3D 0) {
=2D=09=09=09=09=09return ret;
=2D=09=09=09=09}
=2D=09=09=09=09request_len_sec =3D 0;
=2D=09=09=09}
=2D=09=09}
=2D
=2D=09=09unit_sec +=3D granularity;
=2D=09=09++erase_unit_counter;
=2D=09} while (unit_sec < extent_end_sec);
=2D
=2D=09/* Discard the last accumulated request. */
=2D=09if (request_len_sec > 0) {
=2D=09=09ret =3D __discard_extent(bdev, request_start_sec, request_len_se=
c);
=2D=09=09if (ret !=3D 0) {
=2D=09=09=09return ret;
=2D=09=09}
=2D=09}
=2D
=2D=09return 0;
+=09/* discard the extent, don't pad it to erase unit boundaries for no=
w */
+=09return __discard_extent(bdev, extent_start_sec, extent_len_sec);
 }
=20
 int discard_atom(txn_atom *atom, struct list_head *processed_set)
@@ -201,6 +127,7 @@ int discard_atom(txn_atom *atom, struct list_head *=
processed_set)
=20
 =09if (list_empty(&atom->discard.delete_set)) {
 =09=09/* Nothing left to discard. */
+=09=09spin_unlock_atom(atom);
 =09=09return 0;
 =09}
=20
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space=
/bitmap.c
index 03bc5e7..3da3f6b 100644
=2D-- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1259,8 +1259,7 @@ int reiser4_check_blocks_bitmap(const reiser4_blo=
ck_nr * start,
=20
 =09reiser4_block_nr end;
 =09bmap_nr_t bmap, end_bmap;
=2D=09bmap_off_t offset;
=2D=09bmap_off_t end_offset;
+=09bmap_off_t offset, end_offset;
 =09const bmap_off_t max_offset =3D bmap_bit_count(super->s_blocksize);=

=20
 =09assert("intelfx-9", start !=3D NULL);
@@ -1270,9 +1269,8 @@ int reiser4_check_blocks_bitmap(const reiser4_blo=
ck_nr * start,
 =09=09check_block_range(start, len);
 =09=09end =3D *start + *len - 1;
 =09} else {
=2D=09=09/* end is used as temporary len here */
=2D=09=09end =3D 1;
=2D=09=09check_block_range(start, &end);
+=09=09/* on next line, end is used as temporary len for check_block_ra=
nge() */
+=09=09end =3D 1; check_block_range(start, &end);
 =09=09end =3D *start;
 =09}
=20
diff --git a/fs/reiser4/txnmgr.h b/fs/reiser4/txnmgr.h
index 05990d8..72b84a2 100644
=2D-- a/fs/reiser4/txnmgr.h
+++ b/fs/reiser4/txnmgr.h
@@ -256,8 +256,10 @@ struct txn_atom {
 =09=09} nodiscard;
=20
 =09=09struct {
=2D=09=09=09/* The atom's delete set. It collects block numbers which wer=
e
=2D=09=09=09   deallocated with BA_DEFER, i. e. of ordinary nodes. */
+=09=09=09/* The atom's delete set. It collects all blocks that have be=
en
+=09=09=09   deallocated (both immediate and deferred) during the trans=
action.
+=09=09=09   These blocks are considered for discarding at commit time.=

+=09=09=09   For details see discard.c */
 =09=09=09struct list_head delete_set;
 =09=09} discard;
 =09};

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /

--nextPart3202331.yOTRfuCa6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPaG80ACgkQxUKljSIMAnD+pAEAvt3b8WlGD/iByEJvwiPY7TUO
enM55iszreTRTNfyyr0BAI1LRbPZn77FeoYE9CC77P7YrR4lb9uzxf+O1FpKaNf4
=DYqI
-----END PGP SIGNATURE-----

--nextPart3202331.yOTRfuCa6s--

