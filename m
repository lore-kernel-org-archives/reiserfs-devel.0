From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_conversion.c:29
Date: Thu, 30 Mar 2006 14:33:26 +0200
Message-ID: <20060330123326.GA23772@zeus.uziel.local>
References: <200603151111.49826.zam@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <reiserfs-list-return-28408-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200603151111.49826.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi zam,


On Wed, Mar 15, 2006 at 11:11:49AM +0300, Alexander Zarochentsev wrote:
> Hello,
>=20
> please try the attached patch.
>=20
> --=20
> Alex.

> [ skipped life-saving patch ]

I just checked my currently used reiser4 version against
reiser4-for-2.6.16-1 and noticed that this patch was not in there. The
diff between my copy (2.6.16-rc4-mm2 with your patch on top) and status
quo follows:


diff -urN a/fs/reiser4/as_ops.c b/fs/reiser4/as_ops.c
--- a/fs/reiser4/as_ops.c	2006-03-20 20:11:38.000000000 +0100
+++ b/fs/reiser4/as_ops.c	2006-03-30 14:19:27.000000000 +0200
@@ -222,7 +222,7 @@
=20
 	ctx =3D init_context(inode->i_sb);
 	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
+		return RETERR(PTR_ERR(ctx));
=20
 	node =3D jprivate(page);
 	spin_lock_jnode(node);
diff -urN a/fs/reiser4/page_cache.c b/fs/reiser4/page_cache.c
--- a/fs/reiser4/page_cache.c	2006-03-20 20:11:38.000000000 +0100
+++ b/fs/reiser4/page_cache.c	2006-03-30 14:19:27.000000000 +0200
@@ -198,10 +198,6 @@
 {
 	assert("nikita-2168", fake->i_state & I_NEW);
 	fake->i_mapping->a_ops =3D &formatted_fake_as_ops;
-	fake->i_blkbits =3D super->s_blocksize_bits;
-	fake->i_size =3D ~0ull;
-	fake->i_rdev =3D super->s_bdev->bd_dev;
-	fake->i_bdev =3D super->s_bdev;
 	*pfake =3D fake;
 	/* NOTE-NIKITA something else? */
 	unlock_new_inode(fake);
diff -urN a/fs/reiser4/plugin/file/file.c b/fs/reiser4/plugin/file/file.c
--- a/fs/reiser4/plugin/file/file.c	2006-03-20 20:11:38.000000000 +0100
+++ b/fs/reiser4/plugin/file/file.c	2006-03-30 14:19:27.000000000 +0200
@@ -1451,6 +1451,9 @@
 	int result;
 	unix_file_info_t *uf_info;
=20
+	/* close current transaction */
+	txn_restart_current();
+
 	uf_info =3D unix_file_inode_data(inode);
=20
 	/*
@@ -2171,6 +2174,7 @@
 				done_lh(&hint->lh);
 				if (!exclusive) {
 					drop_nonexclusive_access(uf_info);
+					txn_restart_current();
 					get_exclusive_access(uf_info);
 				}
 				result =3D tail2extent(uf_info);
@@ -2960,6 +2964,15 @@
 	unix_file_info_t *uf_info;
 	int result;
=20
+	/*
+	 * transaction can be open already. For example:
+	 * writeback_inodes->sync_sb_inodes->reiser4_sync_inodes->
+	 * generic_sync_sb_inodes->iput->generic_drop_inode->
+	 * generic_delete_inode->reiser4_delete_inode->delete_object_unix_file.
+	 * So, restart transaction to avoid deadlock with file rw semaphore.
+	 */
+	txn_restart_current();
+
 	if (inode_get_flag(inode, REISER4_NO_SD))
 		return 0;
=20
diff -urN a/fs/reiser4/plugin/file/tail_conversion.c b/fs/reiser4/plugin/fi=
le/tail_conversion.c
--- a/fs/reiser4/plugin/file/tail_conversion.c	2006-03-20 20:11:38.00000000=
0 +0100
+++ b/fs/reiser4/plugin/file/tail_conversion.c	2006-03-30 14:19:27.00000000=
0 +0200
@@ -20,12 +20,13 @@
 	assert("nikita-3047", LOCK_CNT_NIL(inode_sem_w));
 	assert("nikita-3048", LOCK_CNT_NIL(inode_sem_r));
 	/*
-	 * "deadlock avoidance": sometimes we commit a transaction under
+	 * "deadlock detection": sometimes we commit a transaction under
 	 * rw-semaphore on a file. Such commit can deadlock with another
 	 * thread that captured some block (hence preventing atom from being
 	 * committed) and waits on rw-semaphore.
 	 */
-	txn_restart_current();
+	assert("nikita-3361", get_current_context()->trans->atom =3D=3D NULL);
+	BUG_ON(get_current_context()->trans->atom !=3D NULL);
 	LOCK_CNT_INC(inode_sem_w);
 	down_write(&uf_info->latch);
 	uf_info->exclusive_use =3D 1;


This would basically revert your patch once applied to my local copy,
and make some other tiny changes. Will those take care of the problem,
or was your solution lost somehow?

The diff between reiser4-for-2.6.16-1 with your patch applied and my copy l=
ooks like this:


diff -urN a/fs/reiser4/as_ops.c b/fs/reiser4/as_ops.c
--- a/fs/reiser4/as_ops.c	2006-03-20 20:11:38.000000000 +0100
+++ b/fs/reiser4/as_ops.c	2006-03-30 14:19:27.000000000 +0200
@@ -222,7 +222,7 @@
=20
 	ctx =3D init_context(inode->i_sb);
 	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
+		return RETERR(PTR_ERR(ctx));
=20
 	node =3D jprivate(page);
 	spin_lock_jnode(node);
diff -urN a/fs/reiser4/page_cache.c b/fs/reiser4/page_cache.c
--- a/fs/reiser4/page_cache.c	2006-03-20 20:11:38.000000000 +0100
+++ b/fs/reiser4/page_cache.c	2006-03-30 14:19:27.000000000 +0200
@@ -198,10 +198,6 @@
 {
 	assert("nikita-2168", fake->i_state & I_NEW);
 	fake->i_mapping->a_ops =3D &formatted_fake_as_ops;
-	fake->i_blkbits =3D super->s_blocksize_bits;
-	fake->i_size =3D ~0ull;
-	fake->i_rdev =3D super->s_bdev->bd_dev;
-	fake->i_bdev =3D super->s_bdev;
 	*pfake =3D fake;
 	/* NOTE-NIKITA something else? */
 	unlock_new_inode(fake);


Is that supposed to do the job of avoiding the trouble I had?


Kind regards,

Chris (currently wondering which codebase to test-drive the hell out
without volumes going that way)


--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iQIVAwUBRCvQFV2m8MprmeOlAQL0qw//Tcz3R8C1TtVfuksPSoKOocwlq0uOIDU8
Ou8zKe9vJPYJ1W71UXUSRmu0vBrsaOrxrZe7VfiWwV6VWGOYMMiAdRBTtyzAMag1
NAnYSz824s+XXwlvUf/KqCpISz2NOR4N4/3RG9pBuXagy9SM02K+1RmU5k26sFGH
xjJQWt7D+QAMTkbpjQAxmr9hXDp72FSpYdunZoEQLGdnwbpZHJ4QDpeJ38zyUAd3
s4laWEvZtYbjT5UkbgT7T6TTds/zyv8cMhVornlEWpEq/o4Uwe/CnTty6Xty1J1x
W9FFC10H8eSrMRrtd6l39KdyzXXlWM7yZiGv22pxRSVjbfIVfk6uD3yeTnHx64lL
ZP5y+6Zd+3KnyiVqeJhUzm7Fgc7hZxgfmdjXpZ14zVo8QKYiyLjN5OQh1g44n4U+
zv93JqTuM9PNdV1V64CPcHO3SiDEzLrTz3uI2/5nfRBSFOlI79mCaP3rjEfEEiLZ
i3/3T+zGYENcSUX6Dy8bzNJQjIVe5RxI/haD694cpApyMzT7/bGZ1MiY0u/QnOf9
TEy+MWMHKHIq4IRrmFmuEoPRUSSnWwOQYE78/W+xBIasfqzD1vq8z2NY3NdM7q3l
A65l2uBhIEVekhET+fa2mUlGNzWyszQBRKUUu1QX3wHTsJsjMVG2T7HPrH3/APsM
SImAoKHqEaM=
=Jiwy
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

