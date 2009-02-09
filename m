From: Felix Zielcke <fzielcke@z-51.de>
Subject: [PATCH] support a seperate build directory
Date: Mon, 09 Feb 2009 18:58:13 +0100
Message-ID: <1234202293.3457.7.camel@fz.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-2ulwnlQjGZPO45EmAr89"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--=-2ulwnlQjGZPO45EmAr89
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

here's a small patch to fully support a different build directory then
srcdir.

-- 
Felix Zielcke

--=-2ulwnlQjGZPO45EmAr89
Content-Disposition: attachment; filename=seperate.build.diff
Content-Type: text/x-patch; name=seperate.build.diff; charset=UTF-8
Content-Transfer-Encoding: 7bit

diff -ur -x Makefile.in reiser4progs-1.0.7_/Makefile.am reiser4progs-1.0.7/Makefile.am
--- reiser4progs-1.0.7_/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/Makefile.am	2009-02-09 18:27:50.000000000 +0100
@@ -19,7 +19,7 @@
 	$(all-sources) | xargs -- ctags -w -o TAGS
 
 install-exec-hook:
-	./run-ldconfig $(libdir)
+	$(top_srcdir)/run-ldconfig $(libdir)
 
 uninstall-hook:
-	./run-ldconfig $(libdir)
+	$(top_srcdir)./run-ldconfig $(libdir)
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/item/ctail40/Makefile.am reiser4progs-1.0.7/plugin/item/ctail40/Makefile.am
--- reiser4progs-1.0.7_/plugin/item/ctail40/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/item/ctail40/Makefile.am	2009-02-09 18:43:26.000000000 +0100
@@ -1,4 +1,4 @@
-includedir		     = -I$(top_srcdir)/include
+includedir		     = -I$(top_srcdir)/include -I$(top_srcdir)
 
 ctail40_sources		     = ctail40.c ctail40.h ctail40_repair.c ctail40_repair.h
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/item/extent40/Makefile.am reiser4progs-1.0.7/plugin/item/extent40/Makefile.am
--- reiser4progs-1.0.7_/plugin/item/extent40/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/item/extent40/Makefile.am	2009-02-09 18:44:12.000000000 +0100
@@ -1,4 +1,4 @@
-includedir		      = -I$(top_srcdir)/include
+includedir		      = -I$(top_srcdir)/include -I$(top_srcdir)
 
 extent40_sources	      = extent40.c extent40_repair.c extent40.h extent40_repair.h
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/item/plain40/Makefile.am reiser4progs-1.0.7/plugin/item/plain40/Makefile.am
--- reiser4progs-1.0.7_/plugin/item/plain40/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/item/plain40/Makefile.am	2009-02-09 18:39:10.000000000 +0100
@@ -1,4 +1,4 @@
-includedir		      = -I$(top_srcdir)/include
+includedir		      = -I$(top_srcdir)/include -I$(top_srcdir)
 
 plain40_sources		      = plain40.c plain40_repair.c plain40.h plain40_repair.h
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/item/tail40/Makefile.am reiser4progs-1.0.7/plugin/item/tail40/Makefile.am
--- reiser4progs-1.0.7_/plugin/item/tail40/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/item/tail40/Makefile.am	2009-02-09 18:42:25.000000000 +0100
@@ -1,4 +1,4 @@
-includedir		    = -I$(top_srcdir)/include
+includedir		    = -I$(top_srcdir)/include -I$(top_srcdir)
 
 tail40_sources		    = tail40.c tail40_repair.c tail40.h tail40_repair.h
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/key/key_large/Makefile.am reiser4progs-1.0.7/plugin/key/key_large/Makefile.am
--- reiser4progs-1.0.7_/plugin/key/key_large/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/key/key_large/Makefile.am	2009-02-09 18:26:04.000000000 +0100
@@ -1,4 +1,4 @@
-includedir			= -I$(top_srcdir)/include
+includedir			= -I$(top_srcdir)/include -I$(top_srcdir)
 
 key_large_sources               = key_large.c key_large.h key_large_repair.c
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/key/key_short/Makefile.am reiser4progs-1.0.7/plugin/key/key_short/Makefile.am
--- reiser4progs-1.0.7_/plugin/key/key_short/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/key/key_short/Makefile.am	2009-02-09 18:26:13.000000000 +0100
@@ -1,4 +1,4 @@
-includedir			= -I$(top_srcdir)/include
+includedir			= -I$(top_srcdir)/include -I$(top_srcdir)
 
 key_short_sources               = key_short.c key_short.h key_short_repair.c
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/object/ccreg40/Makefile.am reiser4progs-1.0.7/plugin/object/ccreg40/Makefile.am
--- reiser4progs-1.0.7_/plugin/object/ccreg40/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/object/ccreg40/Makefile.am	2009-02-09 18:50:13.000000000 +0100
@@ -1,4 +1,4 @@
-includedir		    = -I$(top_srcdir)/include
+includedir		    = -I$(top_srcdir)/include -I$(top_srcdir)
 
 ccreg40_sources		    = ccreg40.c ccreg40.h ccreg40_repair.c
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/object/dir40/Makefile.am reiser4progs-1.0.7/plugin/object/dir40/Makefile.am
--- reiser4progs-1.0.7_/plugin/object/dir40/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/object/dir40/Makefile.am	2009-02-09 18:45:20.000000000 +0100
@@ -1,4 +1,4 @@
-includedir		    = -I$(top_srcdir)/include
+includedir		    = -I$(top_srcdir)/include -I$(top_srcdir)
 
 dir40_sources		    = dir40.c dir40_repair.c dir40.h dir40_repair.h
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/object/reg40/Makefile.am reiser4progs-1.0.7/plugin/object/reg40/Makefile.am
--- reiser4progs-1.0.7_/plugin/object/reg40/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/object/reg40/Makefile.am	2009-02-09 18:46:41.000000000 +0100
@@ -1,4 +1,4 @@
-includedir		    = -I$(top_srcdir)/include
+includedir		    = -I$(top_srcdir)/include -I$(top_srcdir)
 
 reg40_sources		    = reg40.c reg40_repair.c reg40_repair.h
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/object/spl40/Makefile.am reiser4progs-1.0.7/plugin/object/spl40/Makefile.am
--- reiser4progs-1.0.7_/plugin/object/spl40/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/object/spl40/Makefile.am	2009-02-09 18:49:19.000000000 +0100
@@ -1,4 +1,4 @@
-includedir	 	    = -I$(top_srcdir)/include
+includedir	 	    = -I$(top_srcdir)/include -I$(top_srcdir)
 
 spl40_sources	            = spl40.c spl40.h spl40_repair.c spl40_repair.h
 
diff -ur -x Makefile.in reiser4progs-1.0.7_/plugin/object/sym40/Makefile.am reiser4progs-1.0.7/plugin/object/sym40/Makefile.am
--- reiser4progs-1.0.7_/plugin/object/sym40/Makefile.am	2009-02-09 18:25:32.000000000 +0100
+++ reiser4progs-1.0.7/plugin/object/sym40/Makefile.am	2009-02-09 18:48:22.000000000 +0100
@@ -1,4 +1,4 @@
-includedir	 	    = -I$(top_srcdir)/include
+includedir	 	    = -I$(top_srcdir)/include -I$(top_srcdir)
 
 sym40_sources	            = sym40.c sym40_repair.c sym40_repair.h
 

--=-2ulwnlQjGZPO45EmAr89--

