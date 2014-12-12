From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv4 00/10] reiser4: batch discard support (FITRIM ioctl): initial implementation.
Date: Sat, 13 Dec 2014 00:02:38 +0300
Message-ID: <2186348.HDiZHFVbjn@intelfx-laptop>
References: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5206531.B1OszdvBhz"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:user-agent:in-reply-to:references
         :mime-version:content-type;
        bh=O6Lmz+rM7xSoguQKryex4MbA+nSLTWJBJHZvirlsPUs=;
        b=ygq+b5RgFC/rfA/U8I9x0AxrnsCEKM/7+OPRQaeu7BdM3vzX0lLWxAqgbvwavZQwrL
         aj9Kj/eqOTkQqiX5CD6hjBQGa2Vo0L1l0GPOui2VdCwyqZdIlUrh2REvtCc/F/fwS8il
         sP7iEIaS8D5e2mgvn94ThjJoiZAgud4zpvlOEbHlsD9qU1jfLz2OlxUtILtJ+NdwKJUo
         evUBhwu/0XMLIjZBnDH16Kruv9lnzgGnzhuzF5asv90EPhzeC7bZdi+bXnFBqHt4Esfh
         Yj4J2JBP/5RJwvDF5FI7MUo2+YSvy4yElv6LYJqh++C61svNnlPuAI2r6szFCo1pioZ9
         mEuQ==
In-Reply-To: <1418418046-10933-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--nextPart5206531.B1OszdvBhz
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 13 December 2014 at 00:00:36, Ivan Shapovalov wrote:=09
> [...]
>=20
> Ivan Shapovalov (10):
>   reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed a=
mount of space.
>   reiser4: block_alloc: add a "monotonic_forward" parameter to reiser=
4_blocknr_hint to allocate blocks only in forward direction.
>   reiser4: block_alloc: move block accounting by pre-commit hook into=
 block_alloc.c and document BA_DEFER behavior.
>   reiser4: txnmgr: free allocated but unneeded atom in atom_begin_and=
_assign_to_txnh().
>   reiser4: txnmgr: add reiser4_create_atom() which creates an empty a=
tom without capturing any nodes.
>   reiser4: txnmgr: move "empty atom" shortcut slightly below.
>   reiser4: batch discard support: add a dummy FITRIM ioctl handler fo=
r directories.
>   reiser4: batch discard support: actually implement the FITRIM ioctl=
 handler.
>   reiser4: block_alloc: add a "min_len" parameter to reiser4_blocknr_=
hint to limit allocated extent length from below.
>   reiser4: batch discard support: honor minimal extent length passed =
from=20the userspace.
>=20
> [...]

This is a diff between v3 and v4, for ease of reviewing.

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 1632f78..549cc0a 100644
=2D-- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -264,7 +264,7 @@ int reiser4_check_block_counters(const struct super=
_block *super)
 static int
 reiser4_grab(reiser4_context * ctx, __u64 count, reiser4_ba_flags_t fl=
ags)
 {
=2D=09__u64 free_blocks;
+=09__u64 allowed_blocks;
 =09int ret =3D 0, use_reserved =3D flags & BA_RESERVED;
 =09reiser4_super_info_data *sbinfo;
=20
@@ -280,15 +280,24 @@ reiser4_grab(reiser4_context * ctx, __u64 count, =
reiser4_ba_flags_t flags)
=20
 =09spin_lock_reiser4_super(sbinfo);
=20
=2D=09free_blocks =3D sbinfo->blocks_free;
+=09allowed_blocks =3D use_reserved ? sbinfo->blocks_free
+=09                              : sbinfo->blocks_free - sbinfo->block=
s_reserved;
=20
 =09if (flags & BA_SOME_SPACE) {
=2D=09=09/* Reserve 25% of all free space. */
=2D=09=09count =3D free_blocks >> 2;
=2D=09}
+=09=09/* Reserve 25% of all free space */
+=09=09if (allowed_blocks =3D=3D 0) {
+=09=09=09/* No space at all */
+=09=09=09ret =3D RETERR(-ENOSPC);
+=09=09=09goto unlock_and_ret;
+=09=09}
=20
=2D=09if ((use_reserved && free_blocks < count) ||
=2D=09    (!use_reserved && free_blocks < count + sbinfo->blocks_reserved=
)) {
+=09=09count =3D allowed_blocks >> 2;
+=09=09if (count =3D=3D 0) {
+=09=09=09/* Less than 4 free blocks */
+=09=09=09count =3D allowed_blocks;
+=09=09}
+=09} else if (count > allowed_blocks) {
+=09=09/* Not enough space */
 =09=09ret =3D RETERR(-ENOSPC);
 =09=09goto unlock_and_ret;
 =09}
@@ -989,6 +998,19 @@ reiser4_check_blocks(const reiser4_block_nr * star=
t,
 /* BA_FORMATTED bit is only used when BA_DEFER in not present: it is u=
sed to
    distinguish blocks allocated for unformatted and formatted nodes */=

=20
+/* if BA_DEFER is enabled, @target_stage and other @flags are ignored.=

+ *
+ * @target_stage is implied to be BLOCK_NOT_COUNTED.
+ * (assumption is used in reiser4_post_write_back_hook() and apply_dse=
t())
+ *
+ * @flags are implied to have BA_PERMANENT.
+ * (assumption is used in reiser4_pre_commit_hook() which counts deall=
ocated
+ *  blocks)
+ *=20
+ * That is, if a deferred deallocation is done after reiser4_pre_commi=
t_hook(),
+ * then BA_PERMANENT is implied to be disabled.
+ */
+
 int
 reiser4_dealloc_blocks(const reiser4_block_nr * start,
 =09=09       const reiser4_block_nr * len,
@@ -1080,10 +1102,39 @@ reiser4_dealloc_blocks(const reiser4_block_nr *=
 start,
 =09return 0;
 }
=20
+/* an actor for counting blocks that are going to be deallocated */
+static int
+count_dset_blocks(txn_atom * atom, const reiser4_block_nr * start,
+                  const reiser4_block_nr * len, void *data)
+{
+=09reiser4_block_nr *blocks_freed_p =3D data;
+
+=09if (len !=3D NULL) {
+=09=09(*blocks_freed_p) +=3D *len;
+=09} else {
+=09=09(*blocks_freed_p)++;
+=09}
+=09return 0;
+}
+
 /* wrappers for block allocator plugin methods */
 int reiser4_pre_commit_hook(void)
 {
=2D=09assert("zam-502", get_current_super_private() !=3D NULL);
+=09reiser4_block_nr blocks_freed =3D 0;
+=09reiser4_super_info_data *sbinfo =3D get_current_super_private();
+=09txn_atom *atom =3D get_current_atom_locked();
+
+=09assert("zam-502", sbinfo !=3D NULL);
+
+=09assert("zam-876", atom->stage =3D=3D ASTAGE_PRE_COMMIT);
+=09spin_unlock_atom(atom);
+
+=09atom_dset_deferred_apply(atom, count_dset_blocks, &blocks_freed, 0)=
;
+
+=09spin_lock_reiser4_super(sbinfo);
+=09sbinfo->blocks_free_committed +=3D blocks_freed - atom->nr_blocks_a=
llocated;
+=09spin_unlock_reiser4_super(sbinfo);
+
 =09sa_pre_commit_hook();
 =09return 0;
 }
diff --git a/fs/reiser4/block_alloc.h b/fs/reiser4/block_alloc.h
index 16f9810..ac1a747 100644
=2D-- a/fs/reiser4/block_alloc.h
+++ b/fs/reiser4/block_alloc.h
@@ -53,10 +53,10 @@ struct reiser4_blocknr_hint {
 =09/* block allocator assumes that blocks, which will be mapped to dis=
k,
 =09   are in this specified block_stage */
 =09block_stage_t block_stage;
=2D=09/* Allocate blocks only in backward direction starting from blk. */=

+=09/* allocate blocks in backward direction */
 =09unsigned int backward:1;
=2D=09/* Allocate blocks only in forward direction starting from blk. */
=2D=09unsigned int forward:1;
+=09/* allocate blocks only in forward direction starting from blk */
+=09unsigned int monotonic_forward:1;
=20
 };
=20
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space=
/bitmap.c
index 8309cf9..7c0a1e4 100644
=2D-- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1129,16 +1129,17 @@ static int alloc_blocks_forward(reiser4_blocknr=
_hint *hint, int needed,
 =09actual_len =3D
 =09    bitmap_alloc_forward(&search_start, &search_end, min_len, neede=
d);
=20
=2D=09/* There is only one bitmap search if max_dist was specified or fir=
st
=2D=09   pass was from the beginning of the bitmap. We also do one pass f=
or
=2D=09   scanning bitmap in backward direction. */
+=09/* There is only one bitmap search if max_dist was specified, first=

+=09   pass was from the beginning of the bitmap, or if the monotonic f=
lag
+=09   has been set. Otherwise we also do one pass for scanning bitmap =
in
+=09   backward direction. */
 =09if (actual_len =3D=3D 0 && search_start !=3D 0 &&
=2D=09    hint->max_dist =3D=3D 0 && hint->forward =3D=3D 0) {
+=09    hint->max_dist =3D=3D 0 && !hint->monotonic_forward) {
 =09=09/* next step is a scanning from 0 to search_start */
 =09=09search_end =3D search_start;
 =09=09search_start =3D 0;
 =09=09actual_len =3D
=2D=09=09    bitmap_alloc_forward(&search_start, &search_end, 1, needed);=

+=09=09    bitmap_alloc_forward(&search_start, &search_end, min_len, ne=
eded);
 =09}
 =09if (actual_len =3D=3D 0)
 =09=09return RETERR(-ENOSPC);
@@ -1331,15 +1332,13 @@ static void cond_add_to_overwrite_set(txn_atom =
* atom, jnode * node)
    pages in a single-linked list */
 static int
 apply_dset_to_commit_bmap(txn_atom * atom, const reiser4_block_nr * st=
art,
=2D=09=09=09  const reiser4_block_nr * len, void *data)
+=09=09=09  const reiser4_block_nr * len, void *data UNUSED_ARG)
 {
=20
 =09bmap_nr_t bmap;
 =09bmap_off_t offset;
 =09int ret;
=20
=2D=09long long *blocks_freed_p =3D data;
=2D
 =09struct bitmap_node *bnode;
=20
 =09struct super_block *sb =3D reiser4_get_current_sb();
@@ -1375,11 +1374,8 @@ apply_dset_to_commit_bmap(txn_atom * atom, const=
 reiser4_block_nr * start,
 =09=09assert("zam-443",
 =09=09       offset + *len <=3D bmap_bit_count(sb->s_blocksize));
 =09=09reiser4_clear_bits(data, offset, (bmap_off_t) (offset + *len));
=2D
=2D=09=09(*blocks_freed_p) +=3D *len;
 =09} else {
 =09=09reiser4_clear_bit(offset, data);
=2D=09=09(*blocks_freed_p)++;
 =09}
=20
 =09bnode_set_commit_crc(bnode, bnode_calc_crc(bnode, sb->s_blocksize))=
;
@@ -1402,8 +1398,6 @@ int reiser4_pre_commit_hook_bitmap(void)
 =09struct super_block *super =3D reiser4_get_current_sb();
 =09txn_atom *atom;
=20
=2D=09long long blocks_freed =3D 0;
=2D
 =09atom =3D get_current_atom_locked();
 =09assert("zam-876", atom->stage =3D=3D ASTAGE_PRE_COMMIT);
 =09spin_unlock_atom(atom);
@@ -1469,19 +1463,7 @@ int reiser4_pre_commit_hook_bitmap(void)
 =09=09}
 =09}
=20
=2D=09atom_dset_deferred_apply(atom, apply_dset_to_commit_bmap, &blocks_f=
reed, 0);
=2D
=2D=09blocks_freed -=3D atom->nr_blocks_allocated;
=2D
=2D=09{
=2D=09=09reiser4_super_info_data *sbinfo;
=2D
=2D=09=09sbinfo =3D get_super_private(super);
=2D
=2D=09=09spin_lock_reiser4_super(sbinfo);
=2D=09=09sbinfo->blocks_free_committed +=3D blocks_freed;
=2D=09=09spin_unlock_reiser4_super(sbinfo);
=2D=09}
+=09atom_dset_deferred_apply(atom, apply_dset_to_commit_bmap, NULL, 0);=

=20
 =09return 0;
 }
diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index a98b192..2c98959 100644
=2D-- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -503,7 +503,7 @@ int reiser4_trim_fs(struct super_block *super, stru=
ct fstrim_range* range)
 =09hint.max_dist =3D range->len >> super->s_blocksize_bits;
 =09hint.min_len =3D range->minlen >> super->s_blocksize_bits;
 =09hint.block_stage =3D BLOCK_GRABBED;
=2D=09hint.forward =3D 1;
+=09hint.monotonic_forward =3D 1;
=20
 =09end =3D hint.blk + hint.max_dist;
=20
@@ -535,14 +535,27 @@ int reiser4_trim_fs(struct super_block *super, st=
ruct fstrim_range* range)
 =09=09if (ret !=3D 0)
 =09=09=09goto out;
=20
=2D=09=09while (ctx->grabbed_blocks !=3D 0) {
+=09=09do {
 =09=09=09/*
 =09=09=09 * Allocate no more than is grabbed.
+=09=09=09 *
+=09=09=09 * NOTE: we do not use BA_PERMANENT in our allocations
+=09=09=09 * even though we deallocate with BA_DEFER.
+=09=09=09 * Our atom takes the "shortcut" in commit_current_atom()
+=09=09=09 * and as such the pre-commit hook is not applied.
 =09=09=09 */
+=09=09=09assert("intelfx-75", ctx->grabbed_blocks !=3D 0);
 =09=09=09len =3D ctx->grabbed_blocks;
 =09=09=09ret =3D reiser4_alloc_blocks(&hint, &start, &len, 0 /* flags =
*/);
=2D=09=09=09if (ret =3D=3D -ENOSPC)
+=09=09=09if (ret =3D=3D -ENOSPC) {
+=09=09=09=09/*
+=09=09=09=09 * We have reached the end of the filesystem --
+=09=09=09=09 * no more blocks to discard.
+=09=09=09=09 */
+=09=09=09=09ret =3D 0;
+=09=09=09=09finished =3D 1;
 =09=09=09=09break;
+=09=09=09}
 =09=09=09if (ret !=3D 0)
 =09=09=09=09goto out;
=20
@@ -557,7 +570,7 @@ int reiser4_trim_fs(struct super_block *super, stru=
ct fstrim_range* range)
 =09=09=09 * Mark the newly allocated extent for deallocation.
 =09=09=09 * Discard happens on deallocation.
 =09=09=09 */
=2D=09=09=09ret =3D reiser4_dealloc_blocks(&start, &len, BLOCK_NOT_COUNTE=
D, BA_DEFER);
+=09=09=09ret =3D reiser4_dealloc_blocks(&start, &len, 0, BA_DEFER);
 =09=09=09if (ret !=3D 0)
 =09=09=09=09goto out;
=20
@@ -571,23 +584,18 @@ int reiser4_trim_fs(struct super_block *super, st=
ruct fstrim_range* range)
 =09=09=09 * space.
 =09=09=09 */
 =09=09=09discarded_count +=3D len;
=2D=09=09}
+=09=09} while (ctx->grabbed_blocks !=3D 0);
=20
=2D=09=09assert("intelfx-64", (ret =3D=3D 0) || (ret =3D=3D -ENOSPC));
=2D
=2D=09=09if (ret =3D=3D -ENOSPC) {
=2D=09=09=09ret =3D 0;
=2D=09=09=09finished =3D 1;
=2D=09=09}
+=09=09assert("intelfx-64", ret =3D=3D 0);
=20
 =09=09/*
 =09=09 * Extents marked for deallocation are discarded here, as part
 =09=09 * of committing current atom.
 =09=09 */
+=09=09all_grabbed2free();
 =09=09atom =3D get_current_atom_locked();
 =09=09spin_lock_txnh(ctx->trans);
 =09=09force_commit_atom(ctx->trans);
=2D=09=09all_grabbed2free();
 =09=09grab_space_enable();
 =09} while (!finished);
=20
diff --git a/fs/reiser4/txnmgr.c b/fs/reiser4/txnmgr.c
index 2efdf85..5084722 100644
=2D-- a/fs/reiser4/txnmgr.c
+++ b/fs/reiser4/txnmgr.c
@@ -1071,6 +1071,10 @@ static int commit_current_atom(long *nr_submitte=
d, txn_atom ** atom)
 =09ON_DEBUG(((*atom)->committer =3D current));
 =09spin_unlock_atom(*atom);
=20
+=09ret =3D current_atom_complete_writes();
+=09if (ret)
+=09=09return ret;
+
 =09if ((*atom)->capture_count =3D=3D 0) {
 =09=09/* Process the atom's delete set.
 =09=09 * Even if the atom has no captured nodes, the delete set may
@@ -1079,10 +1083,6 @@ static int commit_current_atom(long *nr_submitte=
d, txn_atom ** atom)
 =09=09goto done;
 =09}
=20
=2D=09ret =3D current_atom_complete_writes();
=2D=09if (ret)
=2D=09=09return ret;
=2D
 =09assert("zam-906", list_empty(ATOM_WB_LIST(*atom)));
=20
 =09/* isolate critical code path which should be executed by only one

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart5206531.B1OszdvBhz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlSLV+4ACgkQxUKljSIMAnAjCwEAmI9XmUe2Mh/VCuGxqtMSQ58b
fC7DqW+1zIeRRFbCjzQA/2ATuGTLfo6XenOzSrPfDv64hbELtdL10Zgv7jbdq+xB
=1jSp
-----END PGP SIGNATURE-----

--nextPart5206531.B1OszdvBhz--

