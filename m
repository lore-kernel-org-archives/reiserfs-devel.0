From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 56/8] tap.c cleanup
Date: Thu, 25 Oct 2007 19:07:32 +0200
Message-ID: <1193332052.15901.91.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-rkUKLXxFaVOyrirHz5D4"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-rkUKLXxFaVOyrirHz5D4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 20 errors, 3 warnings, 377 lines checked
patched:total: 0 errors, 2 warnings, 376 lines checked
leftover:

WARNING: printk() should include KERN_ facility level
#314: FILE: tap.c:314:
+               printk("%s: null tap\n", prefix);

WARNING: printk() should include KERN_ facility level
#317: FILE: tap.c:317:
+       printk("%s: loaded: %i, in-list: %i, node: %p, mode: %s\n",
prefix,



--=-rkUKLXxFaVOyrirHz5D4
Content-Disposition: attachment; filename=tap.c.patch
Content-Type: text/x-patch; name=tap.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- tap.c.orig	2007-10-25 19:01:11.000000000 +0200
+++ tap.c	2007-10-25 19:05:41.000000000 +0200
@@ -23,14 +23,14 @@
 #include "tree_walk.h"
 
 #if REISER4_DEBUG
-static int tap_invariant(const tap_t * tap);
-static void tap_check(const tap_t * tap);
+static int tap_invariant(const tap_t *tap);
+static void tap_check(const tap_t *tap);
 #else
 #define tap_check(tap) noop
 #endif
 
 /** load node tap is pointing to, if not loaded already */
-int reiser4_tap_load(tap_t * tap)
+int reiser4_tap_load(tap_t *tap)
 {
 	tap_check(tap);
 	if (tap->loaded == 0) {
@@ -47,14 +47,13 @@ int reiser4_tap_load(tap_t * tap)
 }
 
 /** release node tap is pointing to. Dual to tap_load() */
-void reiser4_tap_relse(tap_t * tap)
+void reiser4_tap_relse(tap_t *tap)
 {
 	tap_check(tap);
 	if (tap->loaded > 0) {
 		--tap->loaded;
-		if (tap->loaded == 0) {
+		if (tap->loaded == 0)
 			zrelse(tap->coord->node);
-		}
 	}
 	tap_check(tap);
 }
@@ -63,7 +62,7 @@ void reiser4_tap_relse(tap_t * tap)
  * init tap to consist of @coord and @lh. Locks on nodes will be acquired with
  * @mode
  */
-void reiser4_tap_init(tap_t * tap, coord_t * coord, lock_handle * lh,
+void reiser4_tap_init(tap_t *tap, coord_t *coord, lock_handle * lh,
 		      znode_lock_mode mode)
 {
 	tap->coord = coord;
@@ -75,7 +74,7 @@ void reiser4_tap_init(tap_t * tap, coord
 }
 
 /** add @tap to the per-thread list of all taps */
-void reiser4_tap_monitor(tap_t * tap)
+void reiser4_tap_monitor(tap_t *tap)
 {
 	assert("nikita-2623", tap != NULL);
 	tap_check(tap);
@@ -85,7 +84,7 @@ void reiser4_tap_monitor(tap_t * tap)
 
 /* duplicate @src into @dst. Copy lock handle. @dst is not initially
  * loaded. */
-void reiser4_tap_copy(tap_t * dst, tap_t * src)
+void reiser4_tap_copy(tap_t *dst, tap_t *src)
 {
 	assert("nikita-3193", src != NULL);
 	assert("nikita-3194", dst != NULL);
@@ -100,7 +99,7 @@ void reiser4_tap_copy(tap_t * dst, tap_t
 }
 
 /** finish with @tap */
-void reiser4_tap_done(tap_t * tap)
+void reiser4_tap_done(tap_t *tap)
 {
 	assert("nikita-2565", tap != NULL);
 	tap_check(tap);
@@ -116,7 +115,7 @@ void reiser4_tap_done(tap_t * tap)
  * move @tap to the new node, locked with @target. Load @target, if @tap was
  * already loaded.
  */
-int reiser4_tap_move(tap_t * tap, lock_handle * target)
+int reiser4_tap_move(tap_t *tap, lock_handle * target)
 {
 	int result = 0;
 
@@ -145,7 +144,7 @@ int reiser4_tap_move(tap_t * tap, lock_h
  * move @tap to @target. Acquire lock on @target, if @tap was already
  * loaded.
  */
-static int tap_to(tap_t * tap, znode * target)
+static int tap_to(tap_t *tap, znode * target)
 {
 	int result;
 
@@ -173,7 +172,7 @@ static int tap_to(tap_t * tap, znode * t
  * move @tap to given @target, loading and locking @target->node if
  * necessary
  */
-int tap_to_coord(tap_t * tap, coord_t * target)
+int tap_to_coord(tap_t *tap, coord_t *target)
 {
 	int result;
 
@@ -192,7 +191,7 @@ struct list_head *reiser4_taps_list(void
 }
 
 /** helper function for go_{next,prev}_{item,unit,node}() */
-int go_dir_el(tap_t * tap, sideof dir, int units_p)
+int go_dir_el(tap_t *tap, sideof dir, int units_p)
 {
 	coord_t dup;
 	coord_t *coord;
@@ -254,7 +253,7 @@ int go_dir_el(tap_t * tap, sideof dir, i
  * move @tap to the next unit, transparently crossing item and node
  * boundaries
  */
-int go_next_unit(tap_t * tap)
+int go_next_unit(tap_t *tap)
 {
 	return go_dir_el(tap, RIGHT_SIDE, 1);
 }
@@ -263,7 +262,7 @@ int go_next_unit(tap_t * tap)
  * move @tap to the previous unit, transparently crossing item and node
  * boundaries
  */
-int go_prev_unit(tap_t * tap)
+int go_prev_unit(tap_t *tap)
 {
 	return go_dir_el(tap, LEFT_SIDE, 1);
 }
@@ -272,7 +271,7 @@ int go_prev_unit(tap_t * tap)
  * @shift times apply @actor to the @tap. This is used to move @tap by
  * @shift units (or items, or nodes) in either direction.
  */
-static int rewind_to(tap_t * tap, go_actor_t actor, int shift)
+static int rewind_to(tap_t *tap, go_actor_t actor, int shift)
 {
 	int result;
 
@@ -296,20 +295,20 @@ static int rewind_to(tap_t * tap, go_act
 }
 
 /** move @tap @shift units rightward */
-int rewind_right(tap_t * tap, int shift)
+int rewind_right(tap_t *tap, int shift)
 {
 	return rewind_to(tap, go_next_unit, shift);
 }
 
 /** move @tap @shift units leftward */
-int rewind_left(tap_t * tap, int shift)
+int rewind_left(tap_t *tap, int shift)
 {
 	return rewind_to(tap, go_prev_unit, shift);
 }
 
 #if REISER4_DEBUG
 /** debugging function: print @tap content in human readable form */
-static void print_tap(const char *prefix, const tap_t * tap)
+static void print_tap(const char *prefix, const tap_t *tap)
 {
 	if (tap == NULL) {
 		printk("%s: null tap\n", prefix);
@@ -324,7 +323,7 @@ static void print_tap(const char *prefix
 }
 
 /** check [tap-sane] invariant */
-static int tap_invariant(const tap_t * tap)
+static int tap_invariant(const tap_t *tap)
 {
 	/* [tap-sane] invariant */
 
@@ -353,7 +352,7 @@ static int tap_invariant(const tap_t * t
 }
 
 /** debugging function: check internal @tap consistency */
-static void tap_check(const tap_t * tap)
+static void tap_check(const tap_t *tap)
 {
 	int result;
 

--=-rkUKLXxFaVOyrirHz5D4--

