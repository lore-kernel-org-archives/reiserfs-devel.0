From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH 7/7] fix out of tree builds
Date: Fri, 19 Oct 2012 01:49:12 -0400
Message-ID: <1350625752-24944-7-git-send-email-vapier@gentoo.org>
References: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

This allows you to build out of tree like:
	mkdir build
	../configure
	make

This also fixes `make distcheck` since that uses the above mechanism.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile.am                 | 7 +------
 configure.ac                | 2 ++
 debugreiserfs/Makefile.am   | 2 +-
 fsck/Makefile.am            | 2 +-
 mkreiserfs/Makefile.am      | 2 +-
 resize_reiserfs/Makefile.am | 2 +-
 tune/Makefile.am            | 2 +-
 7 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index bcb518d..46d975b 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,8 +1,3 @@
 SUBDIRS = include lib reiserfscore fsck debugreiserfs resize_reiserfs mkreiserfs tune
 
-noinst_DATA = reiserfsprogs.spec
-
-EXTRA_DIST = CREDITS version.h
-
-dist-hook:
-	cp -f reiserfsprogs.spec $(distdir)
+EXTRA_DIST = CREDITS version.h reiserfsprogs.spec
diff --git a/configure.ac b/configure.ac
index 14d7563..1d266a5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -118,6 +118,8 @@ if test "x$ac_cv_wuninitialized_flag" = xyes; then
 	CFLAGS="$CFLAGS -Wuninitialized"
 fi
 
+CPPFLAGS="-I\$(top_srcdir)/include $CPPFLAGS"
+
 AC_OUTPUT(
     include/Makefile 
     mkreiserfs/Makefile 
diff --git a/debugreiserfs/Makefile.am b/debugreiserfs/Makefile.am
index 1a6eeb9..faf9877 100644
--- a/debugreiserfs/Makefile.am
+++ b/debugreiserfs/Makefile.am
@@ -4,4 +4,4 @@ debugreiserfs_SOURCES = debugreiserfs.c pack.c unpack.c stat.c corruption.c scan
 man_MANS = debugreiserfs.8
 EXTRA_DIST = $(man_MANS)
 
-LDADD = $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc.a
+LDADD = $(top_builddir)/reiserfscore/libcore.a $(top_builddir)/lib/libmisc.a
diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index f2f0d9a..8f01ee2 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -7,7 +7,7 @@ ufile.c check_tree.c info.c super.c fsck.h
 man_MANS = reiserfsck.8
 EXTRA_DIST = $(man_MANS)
 
-reiserfsck_LDADD = $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc.a
+reiserfsck_LDADD = $(top_builddir)/reiserfscore/libcore.a $(top_builddir)/lib/libmisc.a
 
 install-exec-hook:
 	$(LN_S) reiserfsck $(DESTDIR)$(sbindir)/fsck.reiserfs
diff --git a/mkreiserfs/Makefile.am b/mkreiserfs/Makefile.am
index aed0cfa..1a06f52 100644
--- a/mkreiserfs/Makefile.am
+++ b/mkreiserfs/Makefile.am
@@ -4,7 +4,7 @@ mkreiserfs_SOURCES = mkreiserfs.c
 man_MANS = mkreiserfs.8
 EXTRA_DIST = $(man_MANS)
 
-LDADD = $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc.a
+LDADD = $(top_builddir)/reiserfscore/libcore.a $(top_builddir)/lib/libmisc.a
 
 install-exec-hook:
 	$(LN_S) mkreiserfs $(DESTDIR)$(sbindir)/mkfs.reiserfs
diff --git a/resize_reiserfs/Makefile.am b/resize_reiserfs/Makefile.am
index 240b18b..8cee04e 100644
--- a/resize_reiserfs/Makefile.am
+++ b/resize_reiserfs/Makefile.am
@@ -4,5 +4,5 @@ resize_reiserfs_SOURCES = fe.c resize_reiserfs.c do_shrink.c resize.h
 man_MANS = resize_reiserfs.8
 EXTRA_DIST = $(man_MANS)
 
-LDADD = $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc.a
+LDADD = $(top_builddir)/reiserfscore/libcore.a $(top_builddir)/lib/libmisc.a
 
diff --git a/tune/Makefile.am b/tune/Makefile.am
index a76c669..c503956 100644
--- a/tune/Makefile.am
+++ b/tune/Makefile.am
@@ -5,5 +5,5 @@ reiserfstune_SOURCES = tune.c tune.h
 man_MANS = reiserfstune.8
 EXTRA_DIST = $(man_MANS)
 
-LDADD = $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc.a
+LDADD = $(top_builddir)/reiserfscore/libcore.a $(top_builddir)/lib/libmisc.a
 
-- 
1.7.12

