From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Compile fix for reiserfs quota debug
Date: Thu, 18 Nov 2004 12:44:37 +0100
Message-ID: <20041118114437.GC2767@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="f+W+jCU1fRNres8c"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello!

  Attached patch fixes debugging messages of the quota code in the
reiserfs so that they compile. Could some of the reiserfs developers
have a look at it please so that it can be merged in the mainline?

							Honza
-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="quota-new-2.6.10-rc2-mm1-3-reiserdebug.diff"

Fix debugging quota messages in reiserfs code so that they compile.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupNX /home/jack/.kerndiffexclude linux-2.6.10-rc2-mm1-2-offadd/fs/reiserfs/bitmap.c linux-2.6.10-rc2-mm1-3-reiserdebug/fs/reiserfs/bitmap.c
--- linux-2.6.10-rc2-mm1-2-offadd/fs/reiserfs/bitmap.c	2004-11-16 16:39:09.000000000 +0100
+++ linux-2.6.10-rc2-mm1-3-reiserdebug/fs/reiserfs/bitmap.c	2004-11-16 16:57:33.000000000 +0100
@@ -956,14 +956,14 @@ static inline int blocknrs_and_prealloc_
     if (!hint->formatted_node) {
         int quota_ret;
 #ifdef REISERQUOTA_DEBUG
-	reiserfs_debug (s, "reiserquota: allocating %d blocks id=%u", amount_needed, hint->inode->i_uid);
+	reiserfs_debug (s, REISERFS_DEBUG_CODE, "reiserquota: allocating %d blocks id=%u", amount_needed, hint->inode->i_uid);
 #endif
 	quota_ret = DQUOT_ALLOC_BLOCK_NODIRTY(hint->inode, amount_needed);
 	if (quota_ret)    /* Quota exceeded? */
 	    return QUOTA_EXCEEDED;
 	if (hint->preallocate && hint->prealloc_size ) {
 #ifdef REISERQUOTA_DEBUG
-	    reiserfs_debug (s, "reiserquota: allocating (prealloc) %d blocks id=%u", hint->prealloc_size, hint->inode->i_uid);
+	    reiserfs_debug (s, REISERFS_DEBUG_CODE, "reiserquota: allocating (prealloc) %d blocks id=%u", hint->prealloc_size, hint->inode->i_uid);
 #endif
 	    quota_ret = DQUOT_PREALLOC_BLOCK_NODIRTY(hint->inode, hint->prealloc_size);
 	    if (quota_ret)
@@ -1009,7 +1009,7 @@ static inline int blocknrs_and_prealloc_
 	    /* Free the blocks */
 	    if (!hint->formatted_node) {
 #ifdef REISERQUOTA_DEBUG
-		reiserfs_debug (s, "reiserquota: freeing (nospace) %d blocks id=%u", amount_needed + hint->prealloc_size - nr_allocated, hint->inode->i_uid);
+		reiserfs_debug (s, REISERFS_DEBUG_CODE, "reiserquota: freeing (nospace) %d blocks id=%u", amount_needed + hint->prealloc_size - nr_allocated, hint->inode->i_uid);
 #endif
 		DQUOT_FREE_BLOCK_NODIRTY(hint->inode, amount_needed + hint->prealloc_size - nr_allocated);     /* Free not allocated blocks */
 	    }
@@ -1029,7 +1029,7 @@ static inline int blocknrs_and_prealloc_
 	 nr_allocated + REISERFS_I(hint->inode)->i_prealloc_count) {
     /* Some of preallocation blocks were not allocated */
 #ifdef REISERQUOTA_DEBUG
-	reiserfs_debug (s, "reiserquota: freeing (failed prealloc) %d blocks id=%u", amount_needed + hint->prealloc_size - nr_allocated - INODE_INFO(hint->inode)->i_prealloc_count, hint->inode->i_uid);
+	reiserfs_debug (s, REISERFS_DEBUG_CODE, "reiserquota: freeing (failed prealloc) %d blocks id=%u", amount_needed + hint->prealloc_size - nr_allocated - REISERFS_I(hint->inode)->i_prealloc_count, hint->inode->i_uid);
 #endif
 	DQUOT_FREE_BLOCK_NODIRTY(hint->inode, amount_needed +
 	                         hint->prealloc_size - nr_allocated -
diff -rupNX /home/jack/.kerndiffexclude linux-2.6.10-rc2-mm1-2-offadd/fs/reiserfs/stree.c linux-2.6.10-rc2-mm1-3-reiserdebug/fs/reiserfs/stree.c
--- linux-2.6.10-rc2-mm1-2-offadd/fs/reiserfs/stree.c	2004-11-16 16:39:09.000000000 +0100
+++ linux-2.6.10-rc2-mm1-3-reiserdebug/fs/reiserfs/stree.c	2004-11-16 16:57:33.000000000 +0100
@@ -1388,7 +1388,7 @@ int reiserfs_delete_item (struct reiserf
     do_balance(&s_del_balance, NULL, NULL, M_DELETE);
 
 #ifdef REISERQUOTA_DEBUG
-    reiserfs_debug (p_s_sb, "reiserquota delete_item(): freeing %u, id=%u type=%c", quota_cut_bytes, p_s_inode->i_uid, head2type(&s_ih));
+    reiserfs_debug (p_s_sb, REISERFS_DEBUG_CODE, "reiserquota delete_item(): freeing %u, id=%u type=%c", quota_cut_bytes, p_s_inode->i_uid, head2type(&s_ih));
 #endif
     DQUOT_FREE_SPACE_NODIRTY(p_s_inode, quota_cut_bytes);
 
@@ -1465,7 +1465,7 @@ void reiserfs_delete_solid_item (struct 
 	    do_balance (&tb, NULL, NULL, M_DELETE);
 	    if (inode) {	/* Should we count quota for item? (we don't count quotas for save-links) */
 #ifdef REISERQUOTA_DEBUG
-		reiserfs_debug (th->t_super, "reiserquota delete_solid_item(): freeing %u id=%u type=%c", quota_cut_bytes, inode->i_uid, key2type(key));
+		reiserfs_debug (th->t_super, REISERFS_DEBUG_CODE, "reiserquota delete_solid_item(): freeing %u id=%u type=%c", quota_cut_bytes, inode->i_uid, key2type(key));
 #endif
 		DQUOT_FREE_SPACE_NODIRTY(inode, quota_cut_bytes);
 	    }
@@ -1786,7 +1786,7 @@ int reiserfs_cut_from_item (struct reise
 	REISERFS_I(p_s_inode)->i_flags &= ~i_pack_on_close_mask ;
     }
 #ifdef REISERQUOTA_DEBUG
-    reiserfs_debug (p_s_inode->i_sb, "reiserquota cut_from_item(): freeing %u id=%u type=%c", quota_cut_bytes, p_s_inode->i_uid, '?');
+    reiserfs_debug (p_s_inode->i_sb, REISERFS_DEBUG_CODE, "reiserquota cut_from_item(): freeing %u id=%u type=%c", quota_cut_bytes, p_s_inode->i_uid, '?');
 #endif
     DQUOT_FREE_SPACE_NODIRTY(p_s_inode, quota_cut_bytes);
     return n_ret_value;
@@ -1999,7 +1999,7 @@ int reiserfs_paste_into_item (struct rei
     fs_gen = get_generation(inode->i_sb) ;
 
 #ifdef REISERQUOTA_DEBUG
-    reiserfs_debug (inode->i_sb, "reiserquota paste_into_item(): allocating %u id=%u type=%c", n_pasted_size, inode->i_uid, key2type(&(p_s_key->on_disk_key)));
+    reiserfs_debug (inode->i_sb, REISERFS_DEBUG_CODE, "reiserquota paste_into_item(): allocating %u id=%u type=%c", n_pasted_size, inode->i_uid, key2type(&(p_s_key->on_disk_key)));
 #endif
 
     if (DQUOT_ALLOC_SPACE_NODIRTY(inode, n_pasted_size)) {
@@ -2048,7 +2048,7 @@ error_out:
     /* this also releases the path */
     unfix_nodes(&s_paste_balance);
 #ifdef REISERQUOTA_DEBUG
-    reiserfs_debug (inode->i_sb, "reiserquota paste_into_item(): freeing %u id=%u type=%c", n_pasted_size, inode->i_uid, key2type(&(p_s_key->on_disk_key)));
+    reiserfs_debug (inode->i_sb, REISERFS_DEBUG_CODE, "reiserquota paste_into_item(): freeing %u id=%u type=%c", n_pasted_size, inode->i_uid, key2type(&(p_s_key->on_disk_key)));
 #endif
     DQUOT_FREE_SPACE_NODIRTY(inode, n_pasted_size);
     return retval ;
@@ -2081,7 +2081,7 @@ int reiserfs_insert_item(struct reiserfs
 	    quota_bytes = inode->i_sb->s_blocksize + UNFM_P_SIZE ;
 	}
 #ifdef REISERQUOTA_DEBUG
-	reiserfs_debug (inode->i_sb, "reiserquota insert_item(): allocating %u id=%u type=%c", quota_bytes, inode->i_uid, head2type(p_s_ih));
+	reiserfs_debug (inode->i_sb, REISERFS_DEBUG_CODE, "reiserquota insert_item(): allocating %u id=%u type=%c", quota_bytes, inode->i_uid, head2type(p_s_ih));
 #endif
 	/* We can't dirty inode here. It would be immediately written but
 	 * appropriate stat item isn't inserted yet... */
@@ -2127,7 +2127,7 @@ error_out:
     /* also releases the path */
     unfix_nodes(&s_ins_balance);
 #ifdef REISERQUOTA_DEBUG
-    reiserfs_debug (th->t_super, "reiserquota insert_item(): freeing %u id=%u type=%c", quota_bytes, inode->i_uid, head2type(p_s_ih));
+    reiserfs_debug (th->t_super, REISERFS_DEBUG_CODE, "reiserquota insert_item(): freeing %u id=%u type=%c", quota_bytes, inode->i_uid, head2type(p_s_ih));
 #endif
     if (inode)
 	DQUOT_FREE_SPACE_NODIRTY(inode, quota_bytes) ;

--f+W+jCU1fRNres8c--
