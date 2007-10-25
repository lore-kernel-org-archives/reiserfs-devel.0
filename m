From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 45/8] readahead.h cleanup
Date: Thu, 25 Oct 2007 16:13:38 +0200
Message-ID: <1193321618.15901.38.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-280ggQ8/O2IvtdhVEoLl"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-280ggQ8/O2IvtdhVEoLl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 3 errors, 3 warnings, 51 lines checked
patched:total: 0 errors, 2 warnings, 52 lines checked
leftover:

WARNING: do not add new typedefs
#9: FILE: readahead.h:9:
+typedef enum {

WARNING: do not add new typedefs
#22: FILE: readahead.h:22:
+typedef struct {



--=-280ggQ8/O2IvtdhVEoLl
Content-Disposition: attachment; filename=readahead.h.patch
Content-Type: text/x-patch; name=readahead.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- readahead.h.orig	2007-10-25 16:10:17.000000000 +0200
+++ readahead.h	2007-10-25 16:12:06.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+ * reiser4/README */
 
 #ifndef __READAHEAD_H__
 #define __READAHEAD_H__
@@ -22,8 +23,8 @@ typedef struct {
 	reiser4_key key_to_stop;
 } ra_info_t;
 
-void formatted_readahead(znode *, ra_info_t *);
-void reiser4_init_ra_info(ra_info_t * rai);
+void formatted_readahead(znode * , ra_info_t *);
+void reiser4_init_ra_info(ra_info_t *rai);
 
 struct reiser4_file_ra_state {
 	loff_t start;		/* Current window */
@@ -35,7 +36,7 @@ struct reiser4_file_ra_state {
 	loff_t slow_start;	/* enlarging r/a size algorithm. */
 };
 
-extern void reiser4_readdir_readahead_init(struct inode *dir, tap_t * tap);
+extern void reiser4_readdir_readahead_init(struct inode *dir, tap_t *tap);
 
 /* __READAHEAD_H__ */
 #endif

--=-280ggQ8/O2IvtdhVEoLl--

