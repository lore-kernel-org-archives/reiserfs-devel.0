From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] install standard {fsck,mkfs}.reiserfs symlinks
Date: Sat, 17 Jan 2009 11:19:38 -0500
Message-ID: <1232209178-25889-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Since utilities expect to be able to run `mkfs.$FS` and `fsck.$FS`,
reiserfs should install symlinks for these to the right place.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 fsck/Makefile.am       |    2 ++
 mkreiserfs/Makefile.am |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index 7b1013c..f2f0d9a 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -9,3 +9,5 @@ EXTRA_DIST = $(man_MANS)
 
 reiserfsck_LDADD = $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc.a
 
+install-exec-hook:
+	$(LN_S) reiserfsck $(DESTDIR)$(sbindir)/fsck.reiserfs
diff --git a/mkreiserfs/Makefile.am b/mkreiserfs/Makefile.am
index 72cd707..aed0cfa 100644
--- a/mkreiserfs/Makefile.am
+++ b/mkreiserfs/Makefile.am
@@ -6,3 +6,5 @@ EXTRA_DIST = $(man_MANS)
 
 LDADD = $(top_srcdir)/reiserfscore/libcore.a $(top_srcdir)/lib/libmisc.a
 
+install-exec-hook:
+	$(LN_S) mkreiserfs $(DESTDIR)$(sbindir)/mkfs.reiserfs
-- 
1.6.1

