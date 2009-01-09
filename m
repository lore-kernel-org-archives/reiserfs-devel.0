From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: patch [4/4] reiser4progs: suppress reports about wrong bytes for
 cryptcompress objects
Date: Fri, 09 Jan 2009 03:16:33 +0300
Message-ID: <49669761.8040308@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000409000203020205060803"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000409000203020205060803
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit




--------------000409000203020205060803
Content-Type: text/x-patch;
 name="reiser4progs-add-check_bytes_report-method.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4progs-add-check_bytes_report-method.patch"

Don't report about wrong bytes for ccreg40
objects, as in most cases it is because kernel
doesn't support i_blocks and i_bytes for such
objects because of performance issues.

Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
---
 reiser4progs-1.0.6-orig/doc/fsck.reiser4.8                     |    3 
 reiser4progs-1.0.6-orig/plugin/object/ccreg40/ccreg40_repair.c |    8 +
 reiser4progs-1.0.6-orig/plugin/object/obj40/obj40_repair.c     |   46 ++++++++--
 reiser4progs-1.0.6-orig/plugin/object/obj40/obj40_repair.h     |   16 +++
 4 files changed, 66 insertions(+), 7 deletions(-)

--- reiser4progs-1.0.6-orig/doc/fsck.reiser4.8.orig
+++ reiser4progs-1.0.6-orig/doc/fsck.reiser4.8
@@ -30,7 +30,8 @@ the default action checks the consistenc
 This option may be used on a read-only file system mount.
 .TP
 .B --fix
-fixes minor corruptions that do not require rebuilding.
+fixes minor corruptions that do not require rebuilding;
+sets up correct values of bytes unsupported by kernel in the case of transparent compression.
 .TP
 .B --build-sb
 fixes all severe corruptions in super blocks, rebuilds super blocks from scratch if needed.
--- reiser4progs-1.0.6-orig/plugin/object/ccreg40/ccreg40_repair.c.orig
+++ reiser4progs-1.0.6-orig/plugin/object/ccreg40/ccreg40_repair.c
@@ -300,6 +300,14 @@ errno_t ccreg40_check_struct(reiser4_obj
 		
 		ops.check_size = ccreg40_check_size;
 		ops.check_nlink = mode == RM_BUILD ? 0 : SKIP_METHOD;
+		/**
+		 * don't report about wrong bytes for ccreg40
+		 * objects, as in most cases it is because kernel
+		 * doesn't support i_blocks and i_bytes for such
+		 * objects because of performance issues.
+		 */
+		ops.check_bytes = mode == RM_CHECK ? SKIP_METHOD : 0;
+		ops.check_bytes_report = SKIP_METHOD;
 		
 		hint.stat.mode = S_IFREG;
 		hint.stat.size = objcall(&cc->position, get_offset);
--- reiser4progs-1.0.6-orig/plugin/object/obj40/obj40_repair.c.orig
+++ reiser4progs-1.0.6-orig/plugin/object/obj40/obj40_repair.c
@@ -133,6 +133,19 @@ OBJ40_CHECK(nlink, uint32_t, value, corr
 OBJ40_CHECK(size,  uint64_t, value, correct);
 OBJ40_CHECK(bytes,  uint64_t, value, correct);
 
+static inline void obj40_check_bytes_report(reiser4_place_t *start,
+					    reiser4_core_t *core,
+					    uint64_t found_bytes,
+					    uint8_t mode,
+					    uint64_t correct_bytes)
+{
+	fsck_mess("Node (%llu), item (%u), [%s] (%s): wrong bytes "
+		  "(%llu), %s (%llu).", place_blknr(start),
+		  start->pos.item, print_inode(core, &start->key),
+		  start->plug->p.label, found_bytes, mode == RM_CHECK ?
+		  "Should be" : "Fixed to", correct_bytes);
+}
+
 static inline int obj40_check_mode(reiser4_object_t *obj, 
 				   uint16_t *mode, 
 				   uint16_t correct) 
@@ -216,12 +229,22 @@ static inline errno_t obj40_stat_unix_ch
 
 	if (fixed) {
 		/* sd_bytes are set wrongly in the kernel. */
-		fsck_mess("Node (%llu), item (%u), [%s] (%s): wrong bytes "
-			  "(%llu), %s (%llu).", place_blknr(start), 
-			  start->pos.item, print_inode(obj40_core, &start->key),
-			  start->plug->p.label, unixh.bytes, mode == RM_CHECK ? 
-			  "Should be" : "Fixed to", correct.bytes);
-		
+		if (ops->check_bytes_report == NULL) {
+			/* Report with the default method */
+			obj40_check_bytes_report(start,
+						 obj40_core,
+						 unixh.bytes,
+						 mode,
+						 correct.bytes);
+		} else if (ops->check_bytes_report != SKIP_METHOD) {
+			ops->check_bytes_report(start,
+						obj40_core,
+						unixh.bytes,
+						mode,
+						correct.bytes);
+		} else {
+			;
+		}
 		/* Zero rdev because rdev and bytes is the union on disk
 		   but not in the unixh. */
 		correct.rdev = 0;
@@ -625,3 +648,14 @@ lookup_t obj40_check_item(reiser4_object
 }
 
 #endif
+
+/*
+  Local variables:
+  c-indentation-style: "K&R"
+  mode-name: "LC"
+  c-basic-offset: 8
+  tab-width: 8
+  fill-column: 80
+  scroll-step: 1
+  End:
+*/
--- reiser4progs-1.0.6-orig/plugin/object/obj40/obj40_repair.h.orig
+++ reiser4progs-1.0.6-orig/plugin/object/obj40/obj40_repair.h
@@ -18,6 +18,11 @@ typedef struct obj40_stat_ops {
 	int (*check_nlink) (reiser4_object_t *obj, uint32_t *, uint32_t);
 	int (*check_size) (reiser4_object_t *obj, uint64_t *, uint64_t);
 	int (*check_bytes) (reiser4_object_t *obj, uint64_t *, uint64_t);
+	int (*check_bytes_report) (reiser4_place_t *start,
+				   reiser4_core_t *core,
+				   uint64_t found_bytes,
+				   uint8_t mode,
+				   uint64_t correct_bytes);
 } obj40_stat_ops_t;
 
 typedef struct obj40_stat_hint {
@@ -46,3 +51,14 @@ extern lookup_t obj40_check_item(reiser4
 				 void *data);
 
 #endif
+
+/*
+  Local variables:
+  c-indentation-style: "K&R"
+  mode-name: "LC"
+  c-basic-offset: 8
+  tab-width: 8
+  fill-column: 80
+  scroll-step: 1
+  End:
+*/


--------------000409000203020205060803--
