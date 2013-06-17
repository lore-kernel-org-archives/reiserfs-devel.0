From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: remove flush_old_commits
Date: Mon, 17 Jun 2013 14:57:02 -0400
Message-ID: <51BF5BFE.5060702@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2GACEWDOGWUOOOTKLEJLT"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2GACEWDOGWUOOOTKLEJLT
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Commit 033369d1 (reiserfs: get rid of resierfs_sync_super) was introduced=

to replace the old s->dirt method of superblock writeback. Reiserfs
always journals the superblock on modification so we weren't really using=

it anyway.

It also introduced a bug that causes reiserfs_sync_fs to be called in
5 second intervals once sync is called, whether the file system needs it
or not.

Let's just rip it all out. reiserfs_sync_fs has done the right thing
for ages.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/journal.c  |  4 ----
 fs/reiserfs/reiserfs.h |  6 ------
 fs/reiserfs/super.c    | 49 --------------------------------------------=
-----
 3 files changed, 59 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 742fdd4..3b6b108 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1923,8 +1923,6 @@ static int do_journal_release(struct reiserfs_trans=
action_handle *th,
 	 * the workqueue job (flush_async_commit) needs this lock
 	 */
 	reiserfs_write_unlock(sb);
-
-	cancel_delayed_work_sync(&REISERFS_SB(sb)->old_work);
 	flush_workqueue(commit_wq);
=20
 	if (!reiserfs_mounted_fs_count) {
@@ -3306,7 +3304,6 @@ int journal_mark_dirty(struct reiserfs_transaction_=
handle *th,
 		journal->j_first =3D cn;
 		journal->j_last =3D cn;
 	}
-	reiserfs_schedule_old_flush(sb);
 	return 0;
 }
=20
@@ -3944,7 +3941,6 @@ static int do_journal_end(struct reiserfs_transacti=
on_handle *th,
 	 ** it tells us if we should continue with the journal_end, or just ret=
urn
 	 */
 	if (!check_journal_end(th, sb, nblocks, flags)) {
-		reiserfs_schedule_old_flush(sb);
 		wake_queued_writers(sb);
 		reiserfs_async_progress_wait(sb);
 		goto out;
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index 157e474..055f512 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -480,11 +480,6 @@ struct reiserfs_sb_info {
 	struct dentry *priv_root;	/* root of /.reiserfs_priv */
 	struct dentry *xattr_root;	/* root of /.reiserfs_priv/xattrs */
 	int j_errno;
-
-	int work_queued;              /* non-zero delayed work is queued */
-	struct delayed_work old_work; /* old transactions flush delayed work */=

-	spinlock_t old_work_lock;     /* protects old_work and work_queued */
-
 #ifdef CONFIG_QUOTA
 	char *s_qf_names[MAXQUOTAS];
 	int s_jquota_fmt;
@@ -2493,7 +2488,6 @@ void reiserfs_abort(struct super_block *sb, int err=
no, const char *fmt, ...);
 int reiserfs_allocate_list_bitmaps(struct super_block *s,
 				   struct reiserfs_list_bitmap *, unsigned int);
=20
-void reiserfs_schedule_old_flush(struct super_block *s);
 void add_save_link(struct reiserfs_transaction_handle *th,
 		   struct inode *inode, int truncate);
 int remove_save_link(struct inode *inode, int truncate);
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index f8a23c3..dc2cd06 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -81,54 +81,9 @@ static int reiserfs_sync_fs(struct super_block *s, int=
 wait)
 	return 0;
 }
=20
-static void flush_old_commits(struct work_struct *work)
-{
-	struct reiserfs_sb_info *sbi;
-	struct super_block *s;
-
-	sbi =3D container_of(work, struct reiserfs_sb_info, old_work.work);
-	s =3D sbi->s_journal->j_work_sb;
-
-	spin_lock(&sbi->old_work_lock);
-	sbi->work_queued =3D 0;
-	spin_unlock(&sbi->old_work_lock);
-
-	reiserfs_sync_fs(s, 1);
-}
-
-void reiserfs_schedule_old_flush(struct super_block *s)
-{
-	struct reiserfs_sb_info *sbi =3D REISERFS_SB(s);
-	unsigned long delay;
-
-	if (s->s_flags & MS_RDONLY)
-		return;
-
-	spin_lock(&sbi->old_work_lock);
-	if (!sbi->work_queued) {
-		delay =3D msecs_to_jiffies(dirty_writeback_interval * 10);
-		queue_delayed_work(system_long_wq, &sbi->old_work, delay);
-		sbi->work_queued =3D 1;
-	}
-	spin_unlock(&sbi->old_work_lock);
-}
-
-static void cancel_old_flush(struct super_block *s)
-{
-	struct reiserfs_sb_info *sbi =3D REISERFS_SB(s);
-
-	cancel_delayed_work_sync(&REISERFS_SB(s)->old_work);
-	spin_lock(&sbi->old_work_lock);
-	sbi->work_queued =3D 0;
-	spin_unlock(&sbi->old_work_lock);
-}
-
 static int reiserfs_freeze(struct super_block *s)
 {
 	struct reiserfs_transaction_handle th;
-
-	cancel_old_flush(s);
-
 	reiserfs_write_lock(s);
 	if (!(s->s_flags & MS_RDONLY)) {
 		int err =3D journal_begin(&th, s, 1);
@@ -1796,8 +1751,6 @@ static int reiserfs_fill_super(struct super_block *=
s, void *data, int silent)
 	/* setup default block allocator options */
 	reiserfs_init_alloc_options(s);
=20
-	spin_lock_init(&sbi->old_work_lock);
-	INIT_DELAYED_WORK(&sbi->old_work, flush_old_commits);
 	mutex_init(&sbi->lock);
 	sbi->lock_depth =3D -1;
=20
@@ -2060,8 +2013,6 @@ error_unlocked:
 		reiserfs_write_unlock(s);
 	}
=20
-	cancel_delayed_work_sync(&REISERFS_SB(s)->old_work);
-
 	reiserfs_free_bitmap_cache(s);
 	if (SB_BUFFER_WITH_SB(s))
 		brelse(SB_BUFFER_WITH_SB(s));



------enig2GACEWDOGWUOOOTKLEJLT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJRv1wBAAoJEB57S2MheeWykCgP/2u0YNKoFHPgihnFA4MC3i06
AWRgcWFedvwKIrraHxSCJgt2US1EDjiPfz+pFf74zhSj8uHW8tWEVwtxdLGW52PS
Gg++dx73K+mCd47NFT0fbYmmrcSGduhHsBWkH/+o15xXNcb5b6PBj+bd4uxhZHj/
9idqQOAdE1GSwWg6D8FCn12CSPb1X4ba1PsebJ3SM+l5gZEM8J8YB7HKvi3Rugll
KeEAnCEJ6TpCJUjiAB64VY4Osk+huYRWp/99fls0mdtgVDNtusEiCyDtThXTPVv/
deJqySI4iy7jVDUrUZ5hxAV2i98nUiD3zVdXA4VORS5/emyOOKEbohqah3Dx60/3
EoWsmfi94ZsR06u0iciIOhFW+14Jiieqj6EeSfGTlG4z3jThRhs0lAYUm7//6X7a
idkqu/3RiP+ICaAHGuEyKcuF/Q4PTeckrx8nG4uqvhlURhP9vuqYxFSq8OIEPkqs
mmp4fFutAIFekWH2rx6vyDj3ySLmfZ9Zzj/6CkZm5+tqfQxk2BurHjNxGS3XiCy9
StTqhCIId11FV1U+/oB5i19qcvvLfG2jloeMjWOYlvUS1AHYGct6J1iffsozXh36
+x1MUqNeUDPPwphchpj5y3gkm9ht/yvmqPZ1Q1Pfdt1f5hzpqCXHwfXrUA/7qXQ5
NcKl5EkXbt9ijade8XMl
=a2Kw
-----END PGP SIGNATURE-----

------enig2GACEWDOGWUOOOTKLEJLT--
