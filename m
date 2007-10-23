From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 2/8] block_alloc.c cleanup
Date: Tue, 23 Oct 2007 14:08:44 +0200
Message-ID: <1193141324.6236.30.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-duHFt5aPugQjl1cGZ+FC"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--=-duHFt5aPugQjl1cGZ+FC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- block_alloc.c.orig	2007-10-23 11:54:03.000000000 +0200
+++ block_alloc.c	2007-10-23 12:02:34.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+reiser4/README */
 
 #include "debug.h"
 #include "dformat.h"
@@ -31,20 +32,20 @@
    used -- already allocated blocks,
 
    grabbed -- initially reserved for performing an fs operation, those
blocks
-          are taken from free blocks, then grabbed disk space leaks
from grabbed
-          blocks counter to other counters like "fake allocated",
"flush
-          reserved", "used", the rest of not used grabbed space is
returned to
-          free space at the end of fs operation;
+	  are taken from free blocks, then grabbed disk space leaks from
grabbed
+	  blocks counter to other counters like "fake allocated", "flush
+	  reserved", "used", the rest of not used grabbed space is returned to
+	  free space at the end of fs operation;
 
    fake allocated -- counts all nodes without real disk block numbers
assigned,
-                     we have separate accounting for formatted and
unformatted
-                     nodes (for easier debugging);
+		     we have separate accounting for formatted and unformatted
+		     nodes (for easier debugging);
 
    flush reserved -- disk space needed for flushing and committing an
atom.
-                     Each dirty already allocated block could be
written as a
-                     part of atom's overwrite set or as a part of
atom's
-                     relocate set.  In both case one additional block
is needed,
-                     it is used as a wandered block if we do overwrite
or as a
+		     Each dirty already allocated block could be written as a
+		     part of atom's overwrite set or as a part of atom's
+		     relocate set.  In both case one additional block is needed,
+		     it is used as a wandered block if we do overwrite or as a
 		     new location for a relocated block.
 
    In addition, blocks in some states are counted on per-thread and
per-atom
@@ -68,8 +69,9 @@
    2) one block for either allocating a new node, or dirtying of right
or left
       clean neighbor, only one case may happen.
 
-   VS-FIXME-HANS: why can only one case happen? I would expect to see
dirtying of left neighbor, right neighbor, current
-   node, and creation of new node.  have I forgotten something?  email
me.
+   VS-FIXME-HANS: why can only one case happen? I would expect to see
dirtying
+   of left neighbor, right neighbor, current node, and creation of new
node.
+   Have I forgotten something?  email me.
 
    These grabbed blocks are counted in both reiser4 context "grabbed
blocks"
    counter and in the fs-wide one (both ctx->grabbed_blocks and
@@ -127,7 +129,7 @@ void reiser4_blocknr_hint_init(reiser4_b
 /* Release any resources of a blocknr hint. */
 void reiser4_blocknr_hint_done(reiser4_blocknr_hint * hint UNUSED_ARG)
 {
-	/* No resources should be freed in current blocknr_hint
implementation. */
+/* No resources should be freed in current blocknr_hint implementation.
*/
 }
 
 /* see above for explanation of fake block number.  */
@@ -255,7 +257,7 @@ int reiser4_check_block_counters(const s
    @count           -- number of blocks we reserve;
 
    @return          -- 0 if success,  -ENOSPC, if all
-                       free blocks are preserved or already allocated.
+			free blocks are preserved or already allocated.
 */
 
 static int
@@ -300,7 +302,7 @@ reiser4_grab(reiser4_context * ctx, __u6
 	/* disable grab space in current context */
 	ctx->grab_enabled = 0;
 
-      unlock_and_ret:
+unlock_and_ret:
 	spin_unlock_reiser4_super(sbinfo);
 
 	return ret;
@@ -315,14 +317,14 @@ int reiser4_grab_space(__u64 count, reis
 				   lock_stack_isclean(get_current_lock_stack
 						      ())));
 	ctx = get_current_context();
-	if (!(flags & BA_FORCE) && !is_grab_enabled(ctx)) {
+	if (!(flags & BA_FORCE) && !is_grab_enabled(ctx))
 		return 0;
-	}
 
 	ret = reiser4_grab(ctx, count, flags);
 	if (ret == -ENOSPC) {
 
-		/* Trying to commit the all transactions if BA_CAN_COMMIT flag
present */
+		/* Trying to commit the all transactions if BA_CAN_COMMIT flag
+		   present */
 		if (flags & BA_CAN_COMMIT) {
 			txnmgr_force_commit_all(ctx->super, 0);
 			ctx->grab_enabled = 1;
@@ -664,12 +666,12 @@ reiser4_alloc_blocks(reiser4_blocknr_hin
 
 	/* For write-optimized data we use default search start value, which
is
 	 * close to last write location. */
-	if (flags & BA_USE_DEFAULT_SEARCH_START) {
+	if (flags & BA_USE_DEFAULT_SEARCH_START)
 		get_blocknr_hint_default(&hint->blk);
-	}
 
-	/* VITALY: allocator should grab this for internal/tx-lists/similar
only. */
-/* VS-FIXME-HANS: why is this comment above addressed to vitaly (from
vitaly)? */
+	/* VITALY: allocator should grab this for internal/tx-lists/similar
+	   only. */
+/* VS-FIXME-HANS: why is this comment above addressed to vitaly (from
vitaly)?*/
 	if (hint->block_stage == BLOCK_NOT_COUNTED) {
 		ret = reiser4_grab_space_force(*len, flags);
 		if (ret != 0)
@@ -765,7 +767,8 @@ used2flush_reserved(reiser4_super_info_d
 	spin_unlock_reiser4_super(sbinfo);
 }
 
-/* disk space, virtually used by fake block numbers is counted as
"grabbed" again. */
+/* disk space, virtually used by fake block numbers is counted as
"grabbed"
+   again. */
 static void
 fake_allocated2grabbed(reiser4_context * ctx, reiser4_super_info_data *
sbinfo,
 		       __u64 count, reiser4_ba_flags_t flags)
@@ -960,10 +963,11 @@ void reiser4_check_block(const reiser4_b
    plugin allocation or store deleted block numbers in atom's
delete_set data
    structure depend on @defer parameter. */
 
-/* if BA_DEFER bit is not turned on, @target_stage means the stage of
blocks which
-   will be deleted from WORKING bitmap. They might be just unmapped
from disk, or
-   freed but disk space is still grabbed by current thread, or these
blocks must
-   not be counted in any reiser4 sb block counters, see block_stage_t
comment */
+/* if BA_DEFER bit is not turned on, @target_stage means the stage of
blocks
+   which will be deleted from WORKING bitmap. They might be just
unmapped from
+   disk, or freed but disk space is still grabbed by current thread, or
these
+   blocks must not be counted in any reiser4 sb block counters,
+   see block_stage_t comment */
 
 /* BA_FORMATTED bit is only used when BA_DEFER in not present: it is
used to
    distinguish blocks allocated for unformatted and formatted nodes */
@@ -1021,8 +1025,8 @@ reiser4_dealloc_blocks(const reiser4_blo
 				  *start, *len);
 
 		if (flags & BA_PERMANENT) {
-			/* These blocks were counted as allocated, we have to revert it
-			 * back if allocation is discarded. */
+			/* These blocks were counted as allocated, we have to
+			 * revert it back if allocation is discarded. */
 			txn_atom *atom = get_current_atom_locked();
 			atom->nr_blocks_allocated -= *len;
 			spin_unlock_atom(atom);
@@ -1031,7 +1035,8 @@ reiser4_dealloc_blocks(const reiser4_blo
 		switch (target_stage) {
 		case BLOCK_NOT_COUNTED:
 			assert("vs-960", flags & BA_FORMATTED);
-			/* VITALY: This is what was grabbed for internal/tx-lists/similar
only */
+			/* VITALY: This is what was grabbed for
+			   internal/tx-lists/similar only */
 			used2free(sbinfo, *len);
 			break;
 

--=-duHFt5aPugQjl1cGZ+FC
Content-Disposition: attachment; filename=block_alloc.c.patch
Content-Type: text/x-patch; name=block_alloc.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- block_alloc.c.orig	2007-10-23 11:54:03.000000000 +0200
+++ block_alloc.c	2007-10-23 12:02:34.000000000 +0200
@@ -1,4 +1,5 @@
-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by reiser4/README */
+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
+reiser4/README */
 
 #include "debug.h"
 #include "dformat.h"
@@ -31,20 +32,20 @@
    used -- already allocated blocks,
 
    grabbed -- initially reserved for performing an fs operation, those blocks
-          are taken from free blocks, then grabbed disk space leaks from grabbed
-          blocks counter to other counters like "fake allocated", "flush
-          reserved", "used", the rest of not used grabbed space is returned to
-          free space at the end of fs operation;
+	  are taken from free blocks, then grabbed disk space leaks from grabbed
+	  blocks counter to other counters like "fake allocated", "flush
+	  reserved", "used", the rest of not used grabbed space is returned to
+	  free space at the end of fs operation;
 
    fake allocated -- counts all nodes without real disk block numbers assigned,
-                     we have separate accounting for formatted and unformatted
-                     nodes (for easier debugging);
+		     we have separate accounting for formatted and unformatted
+		     nodes (for easier debugging);
 
    flush reserved -- disk space needed for flushing and committing an atom.
-                     Each dirty already allocated block could be written as a
-                     part of atom's overwrite set or as a part of atom's
-                     relocate set.  In both case one additional block is needed,
-                     it is used as a wandered block if we do overwrite or as a
+		     Each dirty already allocated block could be written as a
+		     part of atom's overwrite set or as a part of atom's
+		     relocate set.  In both case one additional block is needed,
+		     it is used as a wandered block if we do overwrite or as a
 		     new location for a relocated block.
 
    In addition, blocks in some states are counted on per-thread and per-atom
@@ -68,8 +69,9 @@
    2) one block for either allocating a new node, or dirtying of right or left
       clean neighbor, only one case may happen.
 
-   VS-FIXME-HANS: why can only one case happen? I would expect to see dirtying of left neighbor, right neighbor, current
-   node, and creation of new node.  have I forgotten something?  email me.
+   VS-FIXME-HANS: why can only one case happen? I would expect to see dirtying
+   of left neighbor, right neighbor, current node, and creation of new node.
+   Have I forgotten something?  email me.
 
    These grabbed blocks are counted in both reiser4 context "grabbed blocks"
    counter and in the fs-wide one (both ctx->grabbed_blocks and
@@ -127,7 +129,7 @@ void reiser4_blocknr_hint_init(reiser4_b
 /* Release any resources of a blocknr hint. */
 void reiser4_blocknr_hint_done(reiser4_blocknr_hint * hint UNUSED_ARG)
 {
-	/* No resources should be freed in current blocknr_hint implementation. */
+/* No resources should be freed in current blocknr_hint implementation. */
 }
 
 /* see above for explanation of fake block number.  */
@@ -255,7 +257,7 @@ int reiser4_check_block_counters(const s
    @count           -- number of blocks we reserve;
 
    @return          -- 0 if success,  -ENOSPC, if all
-                       free blocks are preserved or already allocated.
+			free blocks are preserved or already allocated.
 */
 
 static int
@@ -300,7 +302,7 @@ reiser4_grab(reiser4_context * ctx, __u6
 	/* disable grab space in current context */
 	ctx->grab_enabled = 0;
 
-      unlock_and_ret:
+unlock_and_ret:
 	spin_unlock_reiser4_super(sbinfo);
 
 	return ret;
@@ -315,14 +317,14 @@ int reiser4_grab_space(__u64 count, reis
 				   lock_stack_isclean(get_current_lock_stack
 						      ())));
 	ctx = get_current_context();
-	if (!(flags & BA_FORCE) && !is_grab_enabled(ctx)) {
+	if (!(flags & BA_FORCE) && !is_grab_enabled(ctx))
 		return 0;
-	}
 
 	ret = reiser4_grab(ctx, count, flags);
 	if (ret == -ENOSPC) {
 
-		/* Trying to commit the all transactions if BA_CAN_COMMIT flag present */
+		/* Trying to commit the all transactions if BA_CAN_COMMIT flag
+		   present */
 		if (flags & BA_CAN_COMMIT) {
 			txnmgr_force_commit_all(ctx->super, 0);
 			ctx->grab_enabled = 1;
@@ -664,12 +666,12 @@ reiser4_alloc_blocks(reiser4_blocknr_hin
 
 	/* For write-optimized data we use default search start value, which is
 	 * close to last write location. */
-	if (flags & BA_USE_DEFAULT_SEARCH_START) {
+	if (flags & BA_USE_DEFAULT_SEARCH_START)
 		get_blocknr_hint_default(&hint->blk);
-	}
 
-	/* VITALY: allocator should grab this for internal/tx-lists/similar only. */
-/* VS-FIXME-HANS: why is this comment above addressed to vitaly (from vitaly)? */
+	/* VITALY: allocator should grab this for internal/tx-lists/similar
+	   only. */
+/* VS-FIXME-HANS: why is this comment above addressed to vitaly (from vitaly)?*/
 	if (hint->block_stage == BLOCK_NOT_COUNTED) {
 		ret = reiser4_grab_space_force(*len, flags);
 		if (ret != 0)
@@ -765,7 +767,8 @@ used2flush_reserved(reiser4_super_info_d
 	spin_unlock_reiser4_super(sbinfo);
 }
 
-/* disk space, virtually used by fake block numbers is counted as "grabbed" again. */
+/* disk space, virtually used by fake block numbers is counted as "grabbed"
+   again. */
 static void
 fake_allocated2grabbed(reiser4_context * ctx, reiser4_super_info_data * sbinfo,
 		       __u64 count, reiser4_ba_flags_t flags)
@@ -960,10 +963,11 @@ void reiser4_check_block(const reiser4_b
    plugin allocation or store deleted block numbers in atom's delete_set data
    structure depend on @defer parameter. */
 
-/* if BA_DEFER bit is not turned on, @target_stage means the stage of blocks which
-   will be deleted from WORKING bitmap. They might be just unmapped from disk, or
-   freed but disk space is still grabbed by current thread, or these blocks must
-   not be counted in any reiser4 sb block counters, see block_stage_t comment */
+/* if BA_DEFER bit is not turned on, @target_stage means the stage of blocks
+   which will be deleted from WORKING bitmap. They might be just unmapped from
+   disk, or freed but disk space is still grabbed by current thread, or these
+   blocks must not be counted in any reiser4 sb block counters,
+   see block_stage_t comment */
 
 /* BA_FORMATTED bit is only used when BA_DEFER in not present: it is used to
    distinguish blocks allocated for unformatted and formatted nodes */
@@ -1021,8 +1025,8 @@ reiser4_dealloc_blocks(const reiser4_blo
 				  *start, *len);
 
 		if (flags & BA_PERMANENT) {
-			/* These blocks were counted as allocated, we have to revert it
-			 * back if allocation is discarded. */
+			/* These blocks were counted as allocated, we have to
+			 * revert it back if allocation is discarded. */
 			txn_atom *atom = get_current_atom_locked();
 			atom->nr_blocks_allocated -= *len;
 			spin_unlock_atom(atom);
@@ -1031,7 +1035,8 @@ reiser4_dealloc_blocks(const reiser4_blo
 		switch (target_stage) {
 		case BLOCK_NOT_COUNTED:
 			assert("vs-960", flags & BA_FORMATTED);
-			/* VITALY: This is what was grabbed for internal/tx-lists/similar only */
+			/* VITALY: This is what was grabbed for
+			   internal/tx-lists/similar only */
 			used2free(sbinfo, *len);
 			break;
 

--=-duHFt5aPugQjl1cGZ+FC--

