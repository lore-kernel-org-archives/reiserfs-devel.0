From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 57/8] tap.h cleanup
Date: Thu, 25 Oct 2007 19:11:41 +0200
Message-ID: <1193332301.15901.95.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Gx7woMu5wyZCniAE9PHo"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-Gx7woMu5wyZCniAE9PHo
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 16 errors, 0 warnings, 70 lines checked
patched:Your patch has no obvious style problems and is ready for
submission.


--=-Gx7woMu5wyZCniAE9PHo
Content-Disposition: attachment; filename=tap.h.patch
Content-Type: text/x-patch; name=tap.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- tap.h.orig	2007-10-25 19:08:14.000000000 +0200
+++ tap.h	2007-10-25 19:10:28.000000000 +0200
@@ -2,7 +2,7 @@
 
 /* Tree Access Pointers. See tap.c for more details. */
 
-#if !defined( __REISER4_TAP_H__ )
+#if !defined(__REISER4_TAP_H__)
 #define __REISER4_TAP_H__
 
 #include "forward.h"
@@ -31,23 +31,23 @@ struct tree_access_pointer {
 	ra_info_t ra_info;
 };
 
-typedef int (*go_actor_t) (tap_t * tap);
+typedef int (*go_actor_t) (tap_t *tap);
 
-extern int reiser4_tap_load(tap_t * tap);
-extern void reiser4_tap_relse(tap_t * tap);
-extern void reiser4_tap_init(tap_t * tap, coord_t * coord, lock_handle * lh,
+extern int reiser4_tap_load(tap_t *tap);
+extern void reiser4_tap_relse(tap_t *tap);
+extern void reiser4_tap_init(tap_t *tap, coord_t *coord, lock_handle * lh,
 		     znode_lock_mode mode);
-extern void reiser4_tap_monitor(tap_t * tap);
-extern void reiser4_tap_copy(tap_t * dst, tap_t * src);
-extern void reiser4_tap_done(tap_t * tap);
-extern int reiser4_tap_move(tap_t * tap, lock_handle * target);
-extern int tap_to_coord(tap_t * tap, coord_t * target);
-
-extern int go_dir_el(tap_t * tap, sideof dir, int units_p);
-extern int go_next_unit(tap_t * tap);
-extern int go_prev_unit(tap_t * tap);
-extern int rewind_right(tap_t * tap, int shift);
-extern int rewind_left(tap_t * tap, int shift);
+extern void reiser4_tap_monitor(tap_t *tap);
+extern void reiser4_tap_copy(tap_t *dst, tap_t *src);
+extern void reiser4_tap_done(tap_t *tap);
+extern int reiser4_tap_move(tap_t *tap, lock_handle * target);
+extern int tap_to_coord(tap_t *tap, coord_t *target);
+
+extern int go_dir_el(tap_t *tap, sideof dir, int units_p);
+extern int go_next_unit(tap_t *tap);
+extern int go_prev_unit(tap_t *tap);
+extern int rewind_right(tap_t *tap, int shift);
+extern int rewind_left(tap_t *tap, int shift);
 
 extern struct list_head *reiser4_taps_list(void);
 

--=-Gx7woMu5wyZCniAE9PHo--

