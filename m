From: Jan Kara <jack@suse.cz>
Subject: [PATCH 10/16] reiserfs: Use lowercase names of quota functions
Date: Tue, 27 Jan 2009 17:48:43 +0100
Message-ID: <1233074929-12277-11-git-send-email-jack@suse.cz>
References: <y>
 <1233074929-12277-1-git-send-email-jack@suse.cz>
 <1233074929-12277-2-git-send-email-jack@suse.cz>
 <1233074929-12277-3-git-send-email-jack@suse.cz>
 <1233074929-12277-4-git-send-email-jack@suse.cz>
 <1233074929-12277-5-git-send-email-jack@suse.cz>
 <1233074929-12277-6-git-send-email-jack@suse.cz>
 <1233074929-12277-7-git-send-email-jack@suse.cz>
 <1233074929-12277-8-git-send-email-jack@suse.cz>
 <1233074929-12277-9-git-send-email-jack@suse.cz>
 <1233074929-12277-10-git-send-email-jack@suse.cz>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1233074929-12277-10-git-send-email-jack@suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org

Use lowercase names of quota functions instead of old uppercase ones.

Signed-off-by: Jan Kara <jack@suse.cz>
CC: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/bitmap.c |   14 ++++++++------
 fs/reiserfs/inode.c  |   10 +++++-----
 fs/reiserfs/namei.c  |    6 +++---
 fs/reiserfs/stree.c  |   14 +++++++-------
 fs/reiserfs/super.c  |    2 +-
 5 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
index 4646caa..f32d142 100644
--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -430,7 +430,7 @@ static void _reiserfs_free_block(struct reiserfs_transaction_handle *th,
 
 	journal_mark_dirty(th, s, sbh);
 	if (for_unformatted)
-		DQUOT_FREE_BLOCK_NODIRTY(inode, 1);
+		vfs_dq_free_block_nodirty(inode, 1);
 }
 
 void reiserfs_free_block(struct reiserfs_transaction_handle *th,
@@ -1055,7 +1055,7 @@ static inline int blocknrs_and_prealloc_arrays_from_search_start
 			       amount_needed, hint->inode->i_uid);
 #endif
 		quota_ret =
-		    DQUOT_ALLOC_BLOCK_NODIRTY(hint->inode, amount_needed);
+		    vfs_dq_alloc_block_nodirty(hint->inode, amount_needed);
 		if (quota_ret)	/* Quota exceeded? */
 			return QUOTA_EXCEEDED;
 		if (hint->preallocate && hint->prealloc_size) {
@@ -1064,8 +1064,7 @@ static inline int blocknrs_and_prealloc_arrays_from_search_start
 				       "reiserquota: allocating (prealloc) %d blocks id=%u",
 				       hint->prealloc_size, hint->inode->i_uid);
 #endif
-			quota_ret =
-			    DQUOT_PREALLOC_BLOCK_NODIRTY(hint->inode,
+			quota_ret = vfs_dq_prealloc_block_nodirty(hint->inode,
 							 hint->prealloc_size);
 			if (quota_ret)
 				hint->preallocate = hint->prealloc_size = 0;
@@ -1098,7 +1097,10 @@ static inline int blocknrs_and_prealloc_arrays_from_search_start
 					       nr_allocated,
 					       hint->inode->i_uid);
 #endif
-				DQUOT_FREE_BLOCK_NODIRTY(hint->inode, amount_needed + hint->prealloc_size - nr_allocated);	/* Free not allocated blocks */
+				/* Free not allocated blocks */
+				vfs_dq_free_block_nodirty(hint->inode,
+					amount_needed + hint->prealloc_size -
+					nr_allocated);
 			}
 			while (nr_allocated--)
 				reiserfs_free_block(hint->th, hint->inode,
@@ -1129,7 +1131,7 @@ static inline int blocknrs_and_prealloc_arrays_from_search_start
 			       REISERFS_I(hint->inode)->i_prealloc_count,
 			       hint->inode->i_uid);
 #endif
-		DQUOT_FREE_BLOCK_NODIRTY(hint->inode, amount_needed +
+		vfs_dq_free_block_nodirty(hint->inode, amount_needed +
 					 hint->prealloc_size - nr_allocated -
 					 REISERFS_I(hint->inode)->
 					 i_prealloc_count);
diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 55fce92..823227a 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -53,7 +53,7 @@ void reiserfs_delete_inode(struct inode *inode)
 		 * after delete_object so that quota updates go into the same transaction as
 		 * stat data deletion */
 		if (!err) 
-			DQUOT_FREE_INODE(inode);
+			vfs_dq_free_inode(inode);
 
 		if (journal_end(&th, inode->i_sb, jbegin_count))
 			goto out;
@@ -1763,7 +1763,7 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 
 	BUG_ON(!th->t_trans_id);
 
-	if (DQUOT_ALLOC_INODE(inode)) {
+	if (vfs_dq_alloc_inode(inode)) {
 		err = -EDQUOT;
 		goto out_end_trans;
 	}
@@ -1947,12 +1947,12 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 	INODE_PKEY(inode)->k_objectid = 0;
 
 	/* Quota change must be inside a transaction for journaling */
-	DQUOT_FREE_INODE(inode);
+	vfs_dq_free_inode(inode);
 
       out_end_trans:
 	journal_end(th, th->t_super, th->t_blocks_allocated);
 	/* Drop can be outside and it needs more credits so it's better to have it outside */
-	DQUOT_DROP(inode);
+	vfs_dq_drop(inode);
 	inode->i_flags |= S_NOQUOTA;
 	make_bad_inode(inode);
 
@@ -3119,7 +3119,7 @@ int reiserfs_setattr(struct dentry *dentry, struct iattr *attr)
 				if (error)
 					goto out;
 				error =
-				    DQUOT_TRANSFER(inode, attr) ? -EDQUOT : 0;
+				    vfs_dq_transfer(inode, attr) ? -EDQUOT : 0;
 				if (error) {
 					journal_end(&th, inode->i_sb,
 						    jbegin_count);
diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 738967f..639d635 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -555,7 +555,7 @@ static int reiserfs_add_entry(struct reiserfs_transaction_handle *th,
 */
 static int drop_new_inode(struct inode *inode)
 {
-	DQUOT_DROP(inode);
+	vfs_dq_drop(inode);
 	make_bad_inode(inode);
 	inode->i_flags |= S_NOQUOTA;
 	iput(inode);
@@ -563,7 +563,7 @@ static int drop_new_inode(struct inode *inode)
 }
 
 /* utility function that does setup for reiserfs_new_inode.  
-** DQUOT_INIT needs lots of credits so it's better to have it
+** vfs_dq_init needs lots of credits so it's better to have it
 ** outside of a transaction, so we had to pull some bits of
 ** reiserfs_new_inode out into this func.
 */
@@ -586,7 +586,7 @@ static int new_inode_init(struct inode *inode, struct inode *dir, int mode)
 	} else {
 		inode->i_gid = current_fsgid();
 	}
-	DQUOT_INIT(inode);
+	vfs_dq_init(inode);
 	return 0;
 }
 
diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index abbc64d..73aaa33 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -1297,7 +1297,7 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th, struct treepath
 		       "reiserquota delete_item(): freeing %u, id=%u type=%c",
 		       quota_cut_bytes, p_s_inode->i_uid, head2type(&s_ih));
 #endif
-	DQUOT_FREE_SPACE_NODIRTY(p_s_inode, quota_cut_bytes);
+	vfs_dq_free_space_nodirty(p_s_inode, quota_cut_bytes);
 
 	/* Return deleted body length */
 	return n_ret_value;
@@ -1383,7 +1383,7 @@ void reiserfs_delete_solid_item(struct reiserfs_transaction_handle *th,
 					       quota_cut_bytes, inode->i_uid,
 					       key2type(key));
 #endif
-				DQUOT_FREE_SPACE_NODIRTY(inode,
+				vfs_dq_free_space_nodirty(inode,
 							 quota_cut_bytes);
 			}
 			break;
@@ -1734,7 +1734,7 @@ int reiserfs_cut_from_item(struct reiserfs_transaction_handle *th,
 		       "reiserquota cut_from_item(): freeing %u id=%u type=%c",
 		       quota_cut_bytes, p_s_inode->i_uid, '?');
 #endif
-	DQUOT_FREE_SPACE_NODIRTY(p_s_inode, quota_cut_bytes);
+	vfs_dq_free_space_nodirty(p_s_inode, quota_cut_bytes);
 	return n_ret_value;
 }
 
@@ -1971,7 +1971,7 @@ int reiserfs_paste_into_item(struct reiserfs_transaction_handle *th, struct tree
 		       key2type(&(p_s_key->on_disk_key)));
 #endif
 
-	if (DQUOT_ALLOC_SPACE_NODIRTY(inode, n_pasted_size)) {
+	if (vfs_dq_alloc_space_nodirty(inode, n_pasted_size)) {
 		pathrelse(p_s_search_path);
 		return -EDQUOT;
 	}
@@ -2027,7 +2027,7 @@ int reiserfs_paste_into_item(struct reiserfs_transaction_handle *th, struct tree
 		       n_pasted_size, inode->i_uid,
 		       key2type(&(p_s_key->on_disk_key)));
 #endif
-	DQUOT_FREE_SPACE_NODIRTY(inode, n_pasted_size);
+	vfs_dq_free_space_nodirty(inode, n_pasted_size);
 	return retval;
 }
 
@@ -2060,7 +2060,7 @@ int reiserfs_insert_item(struct reiserfs_transaction_handle *th, struct treepath
 #endif
 		/* We can't dirty inode here. It would be immediately written but
 		 * appropriate stat item isn't inserted yet... */
-		if (DQUOT_ALLOC_SPACE_NODIRTY(inode, quota_bytes)) {
+		if (vfs_dq_alloc_space_nodirty(inode, quota_bytes)) {
 			pathrelse(p_s_path);
 			return -EDQUOT;
 		}
@@ -2112,6 +2112,6 @@ int reiserfs_insert_item(struct reiserfs_transaction_handle *th, struct treepath
 		       quota_bytes, inode->i_uid, head2type(p_s_ih));
 #endif
 	if (inode)
-		DQUOT_FREE_SPACE_NODIRTY(inode, quota_bytes);
+		vfs_dq_free_space_nodirty(inode, quota_bytes);
 	return retval;
 }
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 317c035..5dbafb7 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -250,7 +250,7 @@ static int finish_unfinished(struct super_block *s)
 			retval = remove_save_link_only(s, &save_link_key, 0);
 			continue;
 		}
-		DQUOT_INIT(inode);
+		vfs_dq_init(inode);
 
 		if (truncate && S_ISDIR(inode->i_mode)) {
 			/* We got a truncate request for a dir which is impossible.
-- 
1.6.0.2

