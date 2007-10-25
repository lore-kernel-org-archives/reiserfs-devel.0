From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 46/8] reiser4.h cleanup
Date: Thu, 25 Oct 2007 16:19:28 +0200
Message-ID: <1193321968.15901.42.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-SsOZYtcEPgudnuArxjFo"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-SsOZYtcEPgudnuArxjFo
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 6 errors, 3 warnings, 269 lines checked
patched:total: 0 errors, 1 warnings, 270 lines checked
leftovers:

WARNING: line over 80 characters
#83: FILE: reiser4.h:83:
+#define REISER4_NEW_EXTENT_FLAGS (COPI_LOAD_LEFT | COPI_LOAD_RIGHT |
COPI_GO_LEFT)




--=-SsOZYtcEPgudnuArxjFo
Content-Disposition: attachment; filename=reiser4.h.patch
Content-Type: text/x-patch; name=reiser4.h.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- reiser4.h.orig	2007-10-25 16:14:33.000000000 +0200
+++ reiser4.h	2007-10-25 16:17:40.000000000 +0200
@@ -3,7 +3,7 @@
 
 /* definitions of common constants used by reiser4 */
 
-#if !defined( __REISER4_H__ )
+#if !defined(__REISER4_H__)
 #define __REISER4_H__
 
 #include <asm/param.h>		/* for HZ */
@@ -171,11 +171,12 @@ extern const int REISER4_MAGIC_OFFSET;	/
 */
 #define REISER4_USE_COLLISION_LIMIT    (0)
 
-/* If flush finds more than FLUSH_RELOCATE_THRESHOLD adjacent dirty leaf-level blocks it
-   will force them to be relocated. */
+/* If flush finds more than FLUSH_RELOCATE_THRESHOLD adjacent dirty leaf-level
+   blocks it will force them to be relocated. */
 #define FLUSH_RELOCATE_THRESHOLD 64
-/* If flush finds can find a block allocation closer than at most FLUSH_RELOCATE_DISTANCE
-   from the preceder it will relocate to that position. */
+/* If flush finds can find a block allocation closer than at most
+   FLUSH_RELOCATE_DISTANCE from the preceder it will relocate to that position.
+ */
 #define FLUSH_RELOCATE_DISTANCE  64
 
 /* If we have written this much or more blocks before encountering busy jnode
@@ -222,9 +223,9 @@ extern const int REISER4_MAGIC_OFFSET;	/
 #define REISER4_I reiser4_inode_data
 
 /* implication */
-#define ergo( antecedent, consequent ) ( !( antecedent ) || ( consequent ) )
+#define ergo(antecedent, consequent) (!(antecedent) || (consequent))
 /* logical equivalence */
-#define equi( p1, p2 ) ( ergo( ( p1 ), ( p2 ) ) && ergo( ( p2 ), ( p1 ) ) )
+#define equi(p1, p2) (ergo((p1), (p2)) && ergo((p2), (p1)))
 
 #define sizeof_array(x) ((int) (sizeof(x) / sizeof(x[0])))
 

--=-SsOZYtcEPgudnuArxjFo--

