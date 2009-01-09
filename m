From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 0/9] reiserfsprogs patch queue
Date: Fri, 09 Jan 2009 18:26:30 -0500
Message-ID: <4967DD26.4070501@suse.com>
References: <20080124200226.606635000@suse.com> <4799C193.8010502@gmail.com> <479A03FF.6050702@suse.com> <47E6F5A0.7070308@gmail.com> <47E7112E.1050700@suse.com> <4967CC7D.7020009@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig1D1B9764BA6D77957100910F"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4967CC7D.7020009@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig1D1B9764BA6D77957100910F
Content-Type: multipart/mixed;
 boundary="------------020402000100090105070906"

This is a multi-part message in MIME format.
--------------020402000100090105070906
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Edward Shishkin wrote:
> Well, I am about to release reiserfsprogs-3.6.21,
> which includes the following changes since 3.6.19:

Great!

> Jeff Mahoney:
> - mkreiserfs-quiet.diff
> - reiserfsprogs-large-block-warning.diff
> - reiserfsprogs-fsck-mapid.diff
> - reiserfsprogs-external-journal-changes.diff
> - reiserfsprogs-remove-stupid-fsck_sleep.diff
> - reiserfsprogs-mkfs-use-o_excl.diff
> - reiserfsprogs-enforce-block-limit.diff
> - reiserfsprogs-large-fs.diff
> - reiserfsprogs-better-fsck-a-behavior.diff
> - reiserfsprogs-remove-dependency-on-asm_unaligned.h.diff
>=20
> Ludwig Nussel:
> - mkreiserfs-set-the-owner-of-the-root-directory-to-the-calling-user.di=
ff
>=20
> Edward Shishkin:
> - mkreiserfs-disable-small-block-sizes.diff
>=20
> Jeff, do you have something to add here?
> Sorry for delay.

Yeah, I do. I have two more patches. The first adds a progress
bar/spinner to fsck -a. The second reorders the link so that the right
dependencies are met. See attached.

-Jeff

--=20
Jeff Mahoney
SUSE Labs

--------------020402000100090105070906
Content-Type: text/x-patch;
 name="reiserfsprogs-progress.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="reiserfsprogs-progress.diff"

From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserprogs: add spinner and progress bar for -a mode

 This patch implements a progress bar with percentages and a plain spinne=
r
 for when progress wants to be demonstrated but percentages aren't known.=


 These are used during journal replay and for the internal tree check.

---
 fsck/check_tree.c      |    2=20
 fsck/ustree.c          |    7 ++
 include/progbar.h      |   32 +++++++++++++
 lib/Makefile.am        |    2=20
 lib/progbar.c          |  117 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
 reiserfscore/journal.c |   16 +++++-
 6 files changed, 172 insertions(+), 4 deletions(-)

--- a/fsck/check_tree.c	2004-09-29 15:52:20.000000000 -0400
+++ b/fsck/check_tree.c	2008-01-24 13:39:05.000000000 -0500
@@ -1124,7 +1124,7 @@ void check_fs_tree (reiserfs_filsys_t *=20
 {
     before_check_fs_tree (fs);
    =20
-    fsck_progress ("Checking internal tree..");
+    fsck_progress ("Checking internal tree..  ");
     pass_through_tree (fs, bad_node, bad_path, fsck_mode(fs) =3D=3D FSCK=
_AUTO ? 2 : -1);
     /* internal tree is correct (including all objects have correct
        sequences of items) */
--- a/fsck/ustree.c	2004-05-24 18:11:43.000000000 -0400
+++ b/fsck/ustree.c	2008-01-24 13:39:05.000000000 -0500
@@ -4,6 +4,7 @@
  */
=20
 #include "fsck.h"
+#include "progbar.h"
=20
 struct tree_balance * cur_tb =3D 0;
=20
@@ -196,6 +197,9 @@ void pass_through_tree (reiserfs_filsys_
     int h =3D 0;
     unsigned long block =3D get_sb_root_block (fs->fs_ondisk_sb);
     int problem;
+    struct spinner spinner;
+
+    spinner_init(&spinner, fsck_progress_file(fs));
=20
=20
     if (block >=3D get_sb_block_count (fs->fs_ondisk_sb) || not_data_blo=
ck (fs, block)) {
@@ -223,6 +227,8 @@ void pass_through_tree (reiserfs_filsys_
 	    }
 	    problem =3D 1;	=09
 	} else {
+
+	    spinner_touch(&spinner);
 	    path[h] =3D bread (fs->fs_dev, block, fs->fs_blocksize);
 	    if (path[h] =3D=3D 0)
 		/* FIXME: handle case when read failed */
@@ -279,4 +285,5 @@ void pass_through_tree (reiserfs_filsys_
         block =3D first_child (path[h]);
         h ++;
     }
+    spinner_clear(&spinner);
 }
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/include/progbar.h	2008-01-24 13:39:05.000000000 -0500
@@ -0,0 +1,32 @@
+#ifndef _PROGBAR_H_
+#define _PROGBAR_H_
+
+enum {
+	E2F_FLAG_PROG_SUPPRESS =3D 1,
+	E2F_FLAG_PROG_BAR =3D 2,
+};
+
+struct progbar {
+	char units[16];
+	int progress_pos;
+	int progress_last_percent;
+	time_t progress_last_time;
+	int flags;
+	FILE *file;
+};
+
+struct spinner {
+	int count;
+	FILE *file;
+};
+
+void progbar_init(struct progbar *ctx, const char *units, FILE *fp);
+void progbar_clear(struct progbar * ctx);
+int progbar_update(struct progbar * ctx, const char *label, int curr, in=
t max,
+                           unsigned int dpynum);
+
+void spinner_init(struct spinner *spinner, FILE *fp);
+void spinner_touch(struct spinner *spinner);
+void spinner_clear(struct spinner *spinner);
+
+#endif /* _PROGBAR_H_ */
--- a/lib/Makefile.am	2004-02-17 06:35:12.000000000 -0500
+++ b/lib/Makefile.am	2008-01-24 13:39:05.000000000 -0500
@@ -1,5 +1,5 @@
 noinst_LIBRARIES =3D libmisc.a
=20
-libmisc_a_SOURCES =3D io.c misc.c=20
+libmisc_a_SOURCES =3D io.c misc.c progbar.c
 ##reiserfs.c
=20
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/lib/progbar.c	2008-01-24 13:39:05.000000000 -0500
@@ -0,0 +1,117 @@
+#include <stdio.h>
+#include <sys/time.h>
+#include <string.h>
+
+#include "progbar.h"
+
+static char bar[128], spaces[128];
+static const char spinner[] =3D "\\|/-";
+
+void progbar_init(struct progbar *ctx, const char *units, FILE *fp)
+{
+	memset(ctx, 0, sizeof (*ctx));
+	if (!bar[0])
+		memset(bar, '=3D', sizeof(bar)-1);
+	if (!spaces[0])
+		memset(spaces, ' ', sizeof(spaces)-1);
+	strncpy(ctx->units, units, sizeof(ctx->units));
+	ctx->file =3D fp;
+}
+
+
+void progbar_clear(struct progbar * ctx)
+{
+	if (!(ctx->flags & E2F_FLAG_PROG_BAR))
+		return;
+
+	fprintf(ctx->file, "\r%*s\r", 80, " ");
+	fflush(ctx->file);
+	ctx->flags &=3D ~E2F_FLAG_PROG_BAR;
+}
+
+int progbar_update(struct progbar * ctx, const char *label, int curr, in=
t max,
+                           unsigned int dpynum)
+{
+	int	i;
+	unsigned int	tick;
+	struct timeval	tv;
+	int dpywidth;
+	int fixed_percent;
+	float percent =3D ((float) curr) / ((float) max) * 100;
+
+	if (ctx->flags & E2F_FLAG_PROG_SUPPRESS)
+		return 0;
+
+	/*
+	 * Calculate the new progress position.  If the
+	 * percentage hasn't changed, then we skip out right
+	 * away.
+	 */
+	fixed_percent =3D (int) ((10 * percent) + 0.5);
+	if (ctx->progress_last_percent =3D=3D fixed_percent)
+		return 0;
+	ctx->progress_last_percent =3D fixed_percent;
+
+	/*
+	 * If we've already updated the spinner once within
+	 * the last 1/8th of a second, no point doing it
+	 * again.
+	 */
+	gettimeofday(&tv, NULL);
+	tick =3D (tv.tv_sec << 3) + (tv.tv_usec / (1000000 / 8));
+	if ((tick =3D=3D ctx->progress_last_time) &&
+	    (fixed_percent !=3D 0) && (fixed_percent !=3D 1000))
+		return 0;
+	ctx->progress_last_time =3D tick;
+
+	/*
+	 * Advance the spinner, and note that the progress bar
+	 * will be on the screen
+	 */
+	ctx->progress_pos =3D (ctx->progress_pos+1) & 3;
+	ctx->flags |=3D E2F_FLAG_PROG_BAR;
+
+	dpywidth =3D 66 - strlen(label);
+	dpywidth =3D 8 * (dpywidth / 8);
+	if (dpynum)
+		dpywidth -=3D 8;
+
+	i =3D ((percent * dpywidth) + 50) / 100;
+	fprintf(ctx->file, "\r%s: |%s%s", label,
+	       bar + (sizeof(bar) - (i+1)),
+	       spaces + (sizeof(spaces) - (dpywidth - i + 1)));
+	if (fixed_percent =3D=3D 1000)
+		fputc('|', ctx->file);
+	else
+		fputc(spinner[ctx->progress_pos & 3], ctx->file);
+	fprintf(ctx->file, " %4.1f%%  ", percent);
+	if (dpynum)
+		fprintf(ctx->file, "%u%s\r", dpynum, ctx->units);
+	else
+		fputs(" \r", ctx->file);
+
+	if (fixed_percent =3D=3D 1000)
+		progbar_clear(ctx);
+	fflush(ctx->file);
+
+	return 0;
+}
+
+void
+spinner_init(struct spinner *ctx, FILE *fp)
+{
+	memset(ctx, 0, sizeof (*ctx));
+	ctx->file =3D fp;
+}
+
+void
+spinner_touch(struct spinner *ctx)
+{
+	fprintf(ctx->file, "=08%c", spinner[ctx->count++ % 4]);
+}
+
+void
+spinner_clear(struct spinner *ctx)
+{
+	fputs("=08", ctx->file);
+}
--- a/reiserfscore/journal.c	2008-01-24 13:39:04.000000000 -0500
+++ b/reiserfscore/journal.c	2008-01-24 13:39:05.000000000 -0500
@@ -6,6 +6,7 @@
 #define _GNU_SOURCE
=20
 #include "includes.h"
+#include "progbar.h"
=20
 /* compares description block with commit block. returns 0 if they diffe=
r, 1
    if they match */
@@ -799,6 +800,8 @@ int replay_journal (reiserfs_filsys_t *=20
     struct reiserfs_journal_header * j_head;
     reiserfs_trans_t cur, newest, control;
     int replayed, ret;
+    struct progbar progbar;
+    int trans_count;
=20
     if (!reiserfs_journal_opened (fs))
         reiserfs_panic ("replay_journal: journal is not opened");
@@ -806,7 +809,8 @@ int replay_journal (reiserfs_filsys_t *=20
     if (!is_opened_rw (fs))
         reiserfs_panic ("replay_journal: fs is not opened with write per=
ms");
=20
-    reiserfs_warning (stderr, "Replaying journal..\n");
+
+    reiserfs_warning (stderr, "Replaying journal: ");
     bh =3D fs->fs_jh_bh;
 =09
     j_head =3D (struct reiserfs_journal_header *)(bh->b_data);
@@ -819,12 +823,15 @@ int replay_journal (reiserfs_filsys_t *=20
 	return 0;
     }
=20
+    trans_count =3D newest.trans_id - cur.trans_id;
+
     /*  Smth strange with journal header or journal. We cannot say for s=
ure what was the last=20
 	replaied transaction, but relying on JH data is preferable. */
=20
     replayed =3D 0;
     ret =3D TRANS_FOUND;
    =20
+    progbar_init(&progbar, " trans", stderr);
     /* Looking to the first valid not replayed transaction. */
     while (1) {
 	if (cur.mount_id =3D=3D control.mount_id &&=20
@@ -842,6 +849,7 @@ int replay_journal (reiserfs_filsys_t *=20
 	    break;
 =09
 	if (!transaction_check_content(fs, &cur)) {
+	    progbar_clear(&progbar);
 	    reiserfs_warning (stderr, "Trans broken: mountid %lu, transid %lu, =
desc %lu, "
 		"len %lu, commit %lu, next trans offset %lu\n", cur.mount_id, cur.tran=
s_id,=20
 		cur.desc_blocknr, cur.trans_len, cur.commit_blocknr, cur.next_trans_of=
fset);
@@ -857,10 +865,14 @@ int replay_journal (reiserfs_filsys_t *=20
 	control =3D cur;
         replayed ++;
=20
+	progbar_update(&progbar, "Replaying journal", replayed, trans_count,
+	               replayed);
+
 	ret =3D next_transaction (fs, &cur, newest);
     }
+    progbar_clear(&progbar);
=20
-    reiserfs_warning (stderr, "Reiserfs journal '%s' in blocks [%u..%u]:=
 %d "
+    reiserfs_warning (stderr, "\rReplaying journal: Done.\nReiserfs jour=
nal '%s' in blocks [%u..%u]: %d "
 		      "transactions replayed\n", fs->fs_j_file_name,=20
 		      get_jp_journal_1st_block(sb_jp(fs->fs_ondisk_sb)),
 		      get_jp_journal_1st_block(sb_jp(fs->fs_ondisk_sb)) +=20

--------------020402000100090105070906
Content-Type: text/x-patch;
 name="reiserfsprogs-reorder-libs.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="reiserfsprogs-reorder-libs.diff"

From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfsprogs: reorder libcore and libmisc

 For some reason, the spinner/progress bar patch didn't build without
 reordering the libs. I don't really care to find out why.

---
 debugreiserfs/Makefile.am   |    2 +-
 fsck/Makefile.am            |    2 +-
 mkreiserfs/Makefile.am      |    2 +-
 resize_reiserfs/Makefile.am |    2 +-
 tune/Makefile.am            |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

--- a/debugreiserfs/Makefile.am	2004-05-13 14:12:56.000000000 -0400
+++ b/debugreiserfs/Makefile.am	2008-01-24 13:39:06.000000000 -0500
@@ -4,4 +4,4 @@ debugreiserfs_SOURCES =3D debugreiserfs.c=20
 man_MANS =3D debugreiserfs.8
 EXTRA_DIST =3D $(man_MANS)
=20
-LDADD =3D $(top_srcdir)/lib/libmisc.a $(top_srcdir)/reiserfscore/libcore=
=2Ea
+LDADD =3D $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc=
=2Ea
--- a/fsck/Makefile.am	2004-02-17 06:35:12.000000000 -0500
+++ b/fsck/Makefile.am	2008-01-24 13:39:06.000000000 -0500
@@ -7,5 +7,5 @@ ufile.c check_tree.c info.c super.c fsck
 man_MANS =3D reiserfsck.8
 EXTRA_DIST =3D $(man_MANS)
=20
-reiserfsck_LDADD =3D $(top_srcdir)/lib/libmisc.a $(top_srcdir)/reiserfsc=
ore/libcore.a
+reiserfsck_LDADD =3D $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/=
lib/libmisc.a
=20
--- a/mkreiserfs/Makefile.am	2004-02-17 06:35:12.000000000 -0500
+++ b/mkreiserfs/Makefile.am	2008-01-24 13:39:06.000000000 -0500
@@ -4,5 +4,5 @@ mkreiserfs_SOURCES =3D mkreiserfs.c
 man_MANS =3D mkreiserfs.8
 EXTRA_DIST =3D $(man_MANS)
=20
-LDADD =3D $(top_srcdir)/lib/libmisc.a $(top_srcdir)/reiserfscore/libcore=
=2Ea
+LDADD =3D $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc=
=2Ea
=20
--- a/resize_reiserfs/Makefile.am	2004-02-17 06:35:12.000000000 -0500
+++ b/resize_reiserfs/Makefile.am	2008-01-24 13:39:06.000000000 -0500
@@ -4,5 +4,5 @@ resize_reiserfs_SOURCES =3D fe.c resize_re
 man_MANS =3D resize_reiserfs.8
 EXTRA_DIST =3D $(man_MANS)
=20
-LDADD =3D $(top_srcdir)/lib/libmisc.a $(top_srcdir)/reiserfscore/libcore=
=2Ea
+LDADD =3D $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc=
=2Ea
=20
--- a/tune/Makefile.am	2004-02-17 06:35:12.000000000 -0500
+++ b/tune/Makefile.am	2008-01-24 13:39:06.000000000 -0500
@@ -5,5 +5,5 @@ reiserfstune_SOURCES =3D tune.c tune.h
 man_MANS =3D reiserfstune.8
 EXTRA_DIST =3D $(man_MANS)
=20
-LDADD =3D $(top_srcdir)/lib/libmisc.a $(top_srcdir)/reiserfscore/libcore=
=2Ea
+LDADD =3D $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc=
=2Ea
=20

--------------020402000100090105070906--

--------------enig1D1B9764BA6D77957100910F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkln3SsACgkQLPWxlyuTD7L0BwCeMKdQqHUjJLyYKMvwRaJMzJly
M38An0RlYA11DR9Puu6FzYg7ZsQ30cY0
=jr7M
-----END PGP SIGNATURE-----

--------------enig1D1B9764BA6D77957100910F--
