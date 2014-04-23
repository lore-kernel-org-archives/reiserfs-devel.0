From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 09/29] reiserfs: cleanup, remove unnecessary parens
Date: Wed, 23 Apr 2014 10:00:42 -0400
Message-ID: <20140423151140.228015511@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-cleanup-remove-unnecessary-parens
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

The reiserfs code is littered with extra parens in places where the authors
may not have been certain about precedence of & vs ->. This patch cleans them
out.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---

 fs/reiserfs/bitmap.c   |    6 +--
 fs/reiserfs/dir.c      |    2 -
 fs/reiserfs/do_balan.c |    2 -
 fs/reiserfs/file.c     |   16 +++++-----
 fs/reiserfs/fix_node.c |    8 ++---
 fs/reiserfs/ibalance.c |    4 +-
 fs/reiserfs/inode.c    |   10 +++---
 fs/reiserfs/item_ops.c |    4 +-
 fs/reiserfs/journal.c  |   73 +++++++++++++++++++++++------------------------
 fs/reiserfs/lbalance.c |   76 ++++++++++++++++++++++++-------------------------
 fs/reiserfs/namei.c    |   21 +++++++------
 fs/reiserfs/prints.c   |    8 ++---
 fs/reiserfs/stree.c    |    9 ++---
 fs/reiserfs/super.c    |   16 +++++-----
 fs/reiserfs/xattr.c    |    4 +-
 15 files changed, 129 insertions(+), 130 deletions(-)

--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -78,7 +78,7 @@ int is_reusable(struct super_block *s, b
 	 * up front so we need to account for it.
 	 */
 	if (unlikely(test_bit(REISERFS_OLD_FORMAT,
-			      &(REISERFS_SB(s)->s_properties)))) {
+			      &REISERFS_SB(s)->s_properties))) {
 		b_blocknr_t bmap1 = REISERFS_SB(s)->s_sbh->b_blocknr + 1;
 		if (block >= bmap1 &&
 		    block <= bmap1 + bmap_count) {
@@ -524,7 +524,7 @@ static void __discard_prealloc(struct re
 	if (dirty)
 		reiserfs_update_sd(th, inode);
 	ei->i_prealloc_block = save;
-	list_del_init(&(ei->i_prealloc_list));
+	list_del_init(&ei->i_prealloc_list);
 }
 
 /* FIXME: It should be inline function */
@@ -1417,7 +1417,7 @@ struct buffer_head *reiserfs_read_bitmap
 	 * I doubt there are any of these left, but just in case...
 	 */
 	if (unlikely(test_bit(REISERFS_OLD_FORMAT,
-	                      &(REISERFS_SB(sb)->s_properties))))
+			      &REISERFS_SB(sb)->s_properties)))
 		block = REISERFS_SB(sb)->s_sbh->b_blocknr + 1 + bitmap;
 	else if (bitmap == 0)
 		block = (REISERFS_DISK_OFFSET_IN_BYTES >> sb->s_blocksize_bits) + 1;
--- a/fs/reiserfs/dir.c
+++ b/fs/reiserfs/dir.c
@@ -112,7 +112,7 @@ research:
 		store_ih(&tmp_ih, ih);
 
 		/* we must have found item, that is item of this directory, */
-		RFALSE(COMP_SHORT_KEYS(&(ih->ih_key), &pos_key),
+		RFALSE(COMP_SHORT_KEYS(&ih->ih_key, &pos_key),
 		       "vs-9000: found item %h does not match to dir we readdir %K",
 		       ih, &pos_key);
 		RFALSE(item_num > B_NR_ITEMS(bh) - 1,
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -1575,7 +1575,7 @@ void do_balance(struct tree_balance *tb,
 		return;
 	}
 
-	atomic_inc(&(fs_generation(tb->tb_sb)));
+	atomic_inc(&fs_generation(tb->tb_sb));
 	do_balance_starts(tb);
 
 	/*
--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -41,10 +41,10 @@ static int reiserfs_file_release(struct
         if (atomic_add_unless(&REISERFS_I(inode)->openers, -1, 1))
 		return 0;
 
-	mutex_lock(&(REISERFS_I(inode)->tailpack));
+	mutex_lock(&REISERFS_I(inode)->tailpack);
 
         if (!atomic_dec_and_test(&REISERFS_I(inode)->openers)) {
-		mutex_unlock(&(REISERFS_I(inode)->tailpack));
+		mutex_unlock(&REISERFS_I(inode)->tailpack);
 		return 0;
 	}
 
@@ -52,7 +52,7 @@ static int reiserfs_file_release(struct
 	if ((!(REISERFS_I(inode)->i_flags & i_pack_on_close_mask) ||
 	     !tail_has_to_be_packed(inode)) &&
 	    REISERFS_I(inode)->i_prealloc_count <= 0) {
-		mutex_unlock(&(REISERFS_I(inode)->tailpack));
+		mutex_unlock(&REISERFS_I(inode)->tailpack);
 		return 0;
 	}
 
@@ -116,7 +116,7 @@ static int reiserfs_file_release(struct
 	}
 out:
 	reiserfs_write_unlock(inode->i_sb);
-	mutex_unlock(&(REISERFS_I(inode)->tailpack));
+	mutex_unlock(&REISERFS_I(inode)->tailpack);
 	return err;
 }
 
@@ -126,18 +126,18 @@ static int reiserfs_file_open(struct ino
 
 	/* somebody might be tailpacking on final close; wait for it */
         if (!atomic_inc_not_zero(&REISERFS_I(inode)->openers)) {
-		mutex_lock(&(REISERFS_I(inode)->tailpack));
+		mutex_lock(&REISERFS_I(inode)->tailpack);
 		atomic_inc(&REISERFS_I(inode)->openers);
-		mutex_unlock(&(REISERFS_I(inode)->tailpack));
+		mutex_unlock(&REISERFS_I(inode)->tailpack);
 	}
 	return err;
 }
 
 void reiserfs_vfs_truncate_file(struct inode *inode)
 {
-	mutex_lock(&(REISERFS_I(inode)->tailpack));
+	mutex_lock(&REISERFS_I(inode)->tailpack);
 	reiserfs_truncate_file(inode, 1);
-	mutex_unlock(&(REISERFS_I(inode)->tailpack));
+	mutex_unlock(&REISERFS_I(inode)->tailpack);
 }
 
 /* Sync a reiserfs file. */
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -81,7 +81,7 @@ static void create_virtual_node(struct t
 	ih = item_head(Sh, 0);
 
 	/* define the mergeability for 0-th item (if it is not being deleted) */
-	if (op_is_left_mergeable(&(ih->ih_key), Sh->b_size)
+	if (op_is_left_mergeable(&ih->ih_key, Sh->b_size)
 	    && (vn->vn_mode != M_DELETE || vn->vn_affected_item_num))
 		vn->vn_vi[0].vi_type |= VI_TYPE_LEFT_MERGEABLE;
 
@@ -682,7 +682,7 @@ static int is_leaf_removable(struct tree
 	/* check whether we can divide 1 remaining item between neighbors */
 
 	/* get size of remaining item (in item units) */
-	size = op_unit_num(&(vn->vn_vi[to_left]));
+	size = op_unit_num(&vn->vn_vi[to_left]);
 
 	if (tb->lbytes + tb->rbytes >= size) {
 		set_parameters(tb, 0, to_left + 1, to_right + 1, 0, NULL,
@@ -720,7 +720,7 @@ static int are_leaves_removable(struct t
 
 		ih = item_head(S0, 0);
 		if (tb->CFR[0]
-		    && !comp_short_le_keys(&(ih->ih_key),
+		    && !comp_short_le_keys(&ih->ih_key,
 					   internal_key(tb->CFR[0],
 							  tb->rkey[0])))
 			/*
@@ -1287,7 +1287,7 @@ static inline int can_node_be_removed(in
 	    /* shifting may merge items which might save space */
 	    -
 	    ((!h
-	      && op_is_left_mergeable(&(ih->ih_key), Sh->b_size)) ? IH_SIZE : 0)
+	      && op_is_left_mergeable(&ih->ih_key, Sh->b_size)) ? IH_SIZE : 0)
 	    -
 	    ((!h && r_key
 	      && op_is_left_mergeable(r_key, Sh->b_size)) ? IH_SIZE : 0)
--- a/fs/reiserfs/ibalance.c
+++ b/fs/reiserfs/ibalance.c
@@ -154,9 +154,9 @@ static void internal_insert_childs(struc
 
 	/* copy to_be_insert disk children */
 	for (i = 0; i < count; i++) {
-		put_dc_size(&(new_dc[i]),
+		put_dc_size(&new_dc[i],
 			    MAX_CHILD_SIZE(bh[i]) - B_FREE_SPACE(bh[i]));
-		put_dc_block_number(&(new_dc[i]), bh[i]->b_blocknr);
+		put_dc_block_number(&new_dc[i], bh[i]->b_blocknr);
 	}
 	memcpy(dc, new_dc, DC_SIZE * count);
 
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -1027,7 +1027,7 @@ research:
 			 */
 			make_cpu_key(&tmp_key, inode,
 				     le_key_k_offset(version,
-						     &(ih->ih_key)) +
+						     &ih->ih_key) +
 				     op_bytes_number(ih,
 						     inode->i_sb->s_blocksize),
 				     TYPE_INDIRECT, 3);
@@ -1243,9 +1243,9 @@ static void init_inode(struct inode *ino
 	bh = PATH_PLAST_BUFFER(path);
 	ih = tp_item_head(path);
 
-	copy_key(INODE_PKEY(inode), &(ih->ih_key));
+	copy_key(INODE_PKEY(inode), &ih->ih_key);
 
-	INIT_LIST_HEAD(&(REISERFS_I(inode)->i_prealloc_list));
+	INIT_LIST_HEAD(&REISERFS_I(inode)->i_prealloc_list);
 	REISERFS_I(inode)->i_flags = 0;
 	REISERFS_I(inode)->i_prealloc_block = 0;
 	REISERFS_I(inode)->i_prealloc_count = 0;
@@ -1967,7 +1967,7 @@ int reiserfs_new_inode(struct reiserfs_t
 	else
 		make_le_item_head(&ih, NULL, KEY_FORMAT_3_6, SD_OFFSET,
 				  TYPE_STAT_DATA, SD_SIZE, MAX_US_INT);
-	memcpy(INODE_PKEY(inode), &(ih.ih_key), KEY_SIZE);
+	memcpy(INODE_PKEY(inode), &ih.ih_key, KEY_SIZE);
 	args.dirid = le32_to_cpu(ih.ih_key.k_dir_id);
 
 	depth = reiserfs_write_unlock_nested(inode->i_sb);
@@ -2011,7 +2011,7 @@ int reiserfs_new_inode(struct reiserfs_t
 	REISERFS_I(inode)->i_first_direct_byte = S_ISLNK(mode) ? 1 :
 	    U32_MAX /*NO_BYTES_IN_DIRECT_ITEM */ ;
 
-	INIT_LIST_HEAD(&(REISERFS_I(inode)->i_prealloc_list));
+	INIT_LIST_HEAD(&REISERFS_I(inode)->i_prealloc_list);
 	REISERFS_I(inode)->i_flags = 0;
 	REISERFS_I(inode)->i_prealloc_block = 0;
 	REISERFS_I(inode)->i_prealloc_count = 0;
--- a/fs/reiserfs/item_ops.c
+++ b/fs/reiserfs/item_ops.c
@@ -491,8 +491,8 @@ static int direntry_create_vi(struct vir
 		j = old_entry_num(is_affected, i, vn->vn_pos_in_item,
 				  vn->vn_mode);
 		dir_u->entry_sizes[i] =
-		    (j ? deh_location(&(deh[j - 1])) : ih_item_len(vi->vi_ih)) -
-		    deh_location(&(deh[j])) + DEH_SIZE;
+		    (j ? deh_location(&deh[j - 1]) : ih_item_len(vi->vi_ih)) -
+		    deh_location(&deh[j]) + DEH_SIZE;
 	}
 
 	size += (dir_u->entry_count * sizeof(short));
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1016,9 +1016,9 @@ static int flush_commit_list(struct supe
 	BUG_ON(jl->j_trans_id == 0);
 
 	/* this commit is done, exit */
-	if (atomic_read(&(jl->j_commit_left)) <= 0) {
+	if (atomic_read(&jl->j_commit_left) <= 0) {
 		if (flushall) {
-			atomic_set(&(jl->j_older_commits_done), 1);
+			atomic_set(&jl->j_older_commits_done, 1);
 		}
 		mutex_unlock(&jl->j_commit_mutex);
 		goto put_jl;
@@ -1094,10 +1094,10 @@ static int flush_commit_list(struct supe
 		put_bh(tbh);
 		/* once due to original getblk in do_journal_end */
 		put_bh(tbh);
-		atomic_dec(&(jl->j_commit_left));
+		atomic_dec(&jl->j_commit_left);
 	}
 
-	BUG_ON(atomic_read(&(jl->j_commit_left)) != 1);
+	BUG_ON(atomic_read(&jl->j_commit_left) != 1);
 
 	/*
 	 * If there was a write error in the journal - we can't commit
@@ -1147,10 +1147,10 @@ static int flush_commit_list(struct supe
 	/* mark the metadata dirty */
 	if (!retval)
 		dirty_one_transaction(s, jl);
-	atomic_dec(&(jl->j_commit_left));
+	atomic_dec(&jl->j_commit_left);
 
 	if (flushall) {
-		atomic_set(&(jl->j_older_commits_done), 1);
+		atomic_set(&jl->j_older_commits_done, 1);
 	}
 	mutex_unlock(&jl->j_commit_mutex);
 put_jl:
@@ -1379,8 +1379,8 @@ static int flush_journal_list(struct sup
 	}
 
 	/* if all the work is already done, get out of here */
-	if (atomic_read(&(jl->j_nonzerolen)) <= 0 &&
-	    atomic_read(&(jl->j_commit_left)) <= 0) {
+	if (atomic_read(&jl->j_nonzerolen) <= 0 &&
+	    atomic_read(&jl->j_commit_left) <= 0) {
 		goto flush_older_and_return;
 	}
 
@@ -1395,8 +1395,8 @@ static int flush_journal_list(struct sup
 		BUG();
 
 	/* are we done now? */
-	if (atomic_read(&(jl->j_nonzerolen)) <= 0 &&
-	    atomic_read(&(jl->j_commit_left)) <= 0) {
+	if (atomic_read(&jl->j_nonzerolen) <= 0 &&
+	    atomic_read(&jl->j_commit_left) <= 0) {
 		goto flush_older_and_return;
 	}
 
@@ -1404,7 +1404,7 @@ static int flush_journal_list(struct sup
 	 * loop through each cnode, see if we need to write it,
 	 * or wait on a more recent transaction, or just ignore it
 	 */
-	if (atomic_read(&(journal->j_wcount)) != 0) {
+	if (atomic_read(&journal->j_wcount) != 0) {
 		reiserfs_panic(s, "journal-844", "journal list is flushing, "
 			       "wcount is not 0");
 	}
@@ -1513,7 +1513,7 @@ free_cnode:
 			 * taking the buffer head away
 			 */
 			put_bh(saved_bh);
-			if (atomic_read(&(saved_bh->b_count)) < 0) {
+			if (atomic_read(&saved_bh->b_count) < 0) {
 				reiserfs_warning(s, "journal-945",
 						 "saved_bh->b_count < 0");
 			}
@@ -1614,7 +1614,7 @@ flush_older_and_return:
 	 * help find code using dead lists later on
 	 */
 	jl->j_len = 0;
-	atomic_set(&(jl->j_nonzerolen), 0);
+	atomic_set(&jl->j_nonzerolen, 0);
 	jl->j_start = 0;
 	jl->j_realblock = NULL;
 	jl->j_commit_bh = NULL;
@@ -1873,7 +1873,7 @@ void remove_journal_hash(struct super_bl
 			 * dec the nonzerolen
 			 */
 			if (cur->bh && cur->jlist)
-				atomic_dec(&(cur->jlist->j_nonzerolen));
+				atomic_dec(&cur->jlist->j_nonzerolen);
 			cur->bh = NULL;
 			cur->jlist = NULL;
 		}
@@ -2836,20 +2836,20 @@ int journal_init(struct super_block *sb,
 	journal->j_start = 0;
 	journal->j_len = 0;
 	journal->j_len_alloc = 0;
-	atomic_set(&(journal->j_wcount), 0);
-	atomic_set(&(journal->j_async_throttle), 0);
+	atomic_set(&journal->j_wcount, 0);
+	atomic_set(&journal->j_async_throttle, 0);
 	journal->j_bcount = 0;
 	journal->j_trans_start_time = 0;
 	journal->j_last = NULL;
 	journal->j_first = NULL;
-	init_waitqueue_head(&(journal->j_join_wait));
+	init_waitqueue_head(&journal->j_join_wait);
 	mutex_init(&journal->j_mutex);
 	mutex_init(&journal->j_flush_mutex);
 
 	journal->j_trans_id = 10;
 	journal->j_mount_id = 10;
 	journal->j_state = 0;
-	atomic_set(&(journal->j_jlock), 0);
+	atomic_set(&journal->j_jlock, 0);
 	journal->j_cnode_free_list = allocate_cnodes(num_cnodes);
 	journal->j_cnode_free_orig = journal->j_cnode_free_list;
 	journal->j_cnode_free = journal->j_cnode_free_list ? num_cnodes : 0;
@@ -2913,7 +2913,7 @@ int journal_transaction_should_end(struc
 		return 0;
 	if (journal->j_must_wait > 0 ||
 	    (journal->j_len_alloc + new_alloc) >= journal->j_max_batch ||
-	    atomic_read(&(journal->j_jlock)) ||
+	    atomic_read(&journal->j_jlock) ||
 	    (now - journal->j_trans_start_time) > journal->j_max_trans_age ||
 	    journal->j_cnode_free < (journal->j_trans_max * 3)) {
 		return 1;
@@ -3113,7 +3113,7 @@ relock:
 	if (journal->j_trans_start_time == 0) {
 		journal->j_trans_start_time = get_seconds();
 	}
-	atomic_inc(&(journal->j_wcount));
+	atomic_inc(&journal->j_wcount);
 	journal->j_len_alloc += nblocks;
 	th->t_blocks_logged = 0;
 	th->t_blocks_allocated = nblocks;
@@ -3306,10 +3306,10 @@ int journal_mark_dirty(struct reiserfs_t
 				 buffer_journal_dirty(bh) ? ' ' : '!');
 	}
 
-	if (atomic_read(&(journal->j_wcount)) <= 0) {
+	if (atomic_read(&journal->j_wcount) <= 0) {
 		reiserfs_warning(sb, "journal-1409",
 				 "returning because j_wcount was %d",
-				 atomic_read(&(journal->j_wcount)));
+				 atomic_read(&journal->j_wcount));
 		return 1;
 	}
 	/*
@@ -3448,7 +3448,7 @@ static int remove_from_transaction(struc
 		clear_buffer_dirty(bh);
 		clear_buffer_journal_test(bh);
 		put_bh(bh);
-		if (atomic_read(&(bh->b_count)) < 0) {
+		if (atomic_read(&bh->b_count) < 0) {
 			reiserfs_warning(sb, "journal-1752",
 					 "b_count < 0");
 		}
@@ -3497,7 +3497,7 @@ static int can_dirty(struct reiserfs_jou
 	cur = cn->hnext;
 	while (cur && can_dirty) {
 		if (cur->jlist && cur->jlist->j_len > 0 &&
-		    atomic_read(&(cur->jlist->j_commit_left)) > 0 && cur->bh &&
+		    atomic_read(&cur->jlist->j_commit_left) > 0 && cur->bh &&
 		    cur->blocknr && cur->sb == sb && cur->blocknr == blocknr) {
 			can_dirty = 0;
 		}
@@ -3623,8 +3623,8 @@ static int check_journal_end(struct reis
 
 	journal->j_len_alloc -= (th->t_blocks_allocated - th->t_blocks_logged);
 	/* <= 0 is allowed.  unmounting might not call begin */
-	if (atomic_read(&(journal->j_wcount)) > 0)
-		atomic_dec(&(journal->j_wcount));
+	if (atomic_read(&journal->j_wcount) > 0)
+		atomic_dec(&journal->j_wcount);
 
 	/*
 	 * BUG, deal with case where j_len is 0, but people previously
@@ -3642,7 +3642,7 @@ static int check_journal_end(struct reis
 	 * because the rest of journal end was already done for this
 	 * transaction.
 	 */
-	if (atomic_read(&(journal->j_wcount)) > 0) {
+	if (atomic_read(&journal->j_wcount) > 0) {
 		if (flush || commit_now) {
 			unsigned trans_id;
 
@@ -3650,7 +3650,7 @@ static int check_journal_end(struct reis
 			trans_id = jl->j_trans_id;
 			if (wait_on_commit)
 				jl->j_state |= LIST_COMMIT_PENDING;
-			atomic_set(&(journal->j_jlock), 1);
+			atomic_set(&journal->j_jlock, 1);
 			if (flush) {
 				journal->j_next_full_flush = 1;
 			}
@@ -3666,7 +3666,7 @@ static int check_journal_end(struct reis
 				} else {
 					lock_journal(sb);
 					if (journal->j_trans_id == trans_id) {
-						atomic_set(&(journal->j_jlock),
+						atomic_set(&journal->j_jlock,
 							   1);
 					}
 					unlock_journal(sb);
@@ -3693,7 +3693,7 @@ static int check_journal_end(struct reis
 	}
 	/* don't batch when someone is waiting on j_join_wait */
 	/* don't batch when syncing the commit or flushing the whole trans */
-	if (!(journal->j_must_wait > 0) && !(atomic_read(&(journal->j_jlock)))
+	if (!(journal->j_must_wait > 0) && !(atomic_read(&journal->j_jlock))
 	    && !flush && !commit_now && (journal->j_len < journal->j_max_batch)
 	    && journal->j_len_alloc < journal->j_max_batch
 	    && journal->j_cnode_free > (journal->j_trans_max * 3)) {
@@ -3792,7 +3792,7 @@ int journal_mark_freed(struct reiserfs_t
 						cleaned = 1;
 						put_bh(cn->bh);
 						if (atomic_read
-						    (&(cn->bh->b_count)) < 0) {
+						    (&cn->bh->b_count) < 0) {
 							reiserfs_warning(sb,
 								 "journal-2138",
 								 "cn->bh->b_count < 0");
@@ -3803,9 +3803,8 @@ int journal_mark_freed(struct reiserfs_t
 					 * we MUST dec nonzerolen
 					 */
 					if (cn->jlist) {
-						atomic_dec(&
-							   (cn->jlist->
-							    j_nonzerolen));
+						atomic_dec(&cn->jlist->
+							   j_nonzerolen);
 					}
 					cn->bh = NULL;
 				}
@@ -4244,7 +4243,7 @@ static int do_journal_end(struct reiserf
 	journal->j_start =
 	    (journal->j_start + journal->j_len +
 	     2) % SB_ONDISK_JOURNAL_SIZE(sb);
-	atomic_set(&(journal->j_wcount), 0);
+	atomic_set(&journal->j_wcount, 0);
 	journal->j_bcount = 0;
 	journal->j_last = NULL;
 	journal->j_first = NULL;
@@ -4349,11 +4348,11 @@ first_jl:
 			       "could not get a list bitmap");
 	}
 
-	atomic_set(&(journal->j_jlock), 0);
+	atomic_set(&journal->j_jlock, 0);
 	unlock_journal(sb);
 	/* wake up any body waiting to join. */
 	clear_bit(J_WRITERS_QUEUED, &journal->j_state);
-	wake_up(&(journal->j_join_wait));
+	wake_up(&journal->j_join_wait);
 
 	if (!flush && wait_on_commit &&
 	    journal_list_still_alive(sb, commit_trans_id)) {
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -38,12 +38,12 @@ static void leaf_copy_dir_entries(struct
 	 */
 	deh = B_I_DEH(source, ih);
 	if (copy_count) {
-		copy_records_len = (from ? deh_location(&(deh[from - 1])) :
+		copy_records_len = (from ? deh_location(&deh[from - 1]) :
 				    ih_item_len(ih)) -
-		    deh_location(&(deh[from + copy_count - 1]));
+		    deh_location(&deh[from + copy_count - 1]);
 		records =
 		    source->b_data + ih_location(ih) +
-		    deh_location(&(deh[from + copy_count - 1]));
+		    deh_location(&deh[from + copy_count - 1]);
 	} else {
 		copy_records_len = 0;
 		records = NULL;
@@ -81,7 +81,7 @@ static void leaf_copy_dir_entries(struct
 			/* form key by the following way */
 			if (from < ih_entry_count(ih)) {
 				set_le_ih_k_offset(&new_ih,
-						   deh_offset(&(deh[from])));
+						   deh_offset(&deh[from]));
 			} else {
 				/*
 				 * no entries will be copied to this
@@ -94,7 +94,7 @@ static void leaf_copy_dir_entries(struct
 				 * for it, so we -1
 				 */
 			}
-			set_le_key_k_type(KEY_FORMAT_3_5, &(new_ih.ih_key),
+			set_le_key_k_type(KEY_FORMAT_3_5, &new_ih.ih_key,
 					  TYPE_DIRENTRY);
 		}
 
@@ -155,7 +155,7 @@ static int leaf_copy_boundary_item(struc
 
 		/* there is nothing to merge */
 		if (!dest_nr_item
-		    || (!op_is_left_mergeable(&(ih->ih_key), src->b_size)))
+		    || (!op_is_left_mergeable(&ih->ih_key, src->b_size)))
 			return 0;
 
 		RFALSE(!ih_item_len(ih),
@@ -221,7 +221,7 @@ static int leaf_copy_boundary_item(struc
 	ih = item_head(src, src_nr_item - 1);
 	dih = item_head(dest, 0);
 
-	if (!dest_nr_item || !op_is_left_mergeable(&(dih->ih_key), src->b_size))
+	if (!dest_nr_item || !op_is_left_mergeable(&dih->ih_key, src->b_size))
 		return 0;
 
 	if (is_direntry_le_ih(ih)) {
@@ -368,8 +368,8 @@ static void leaf_copy_items_entirely(str
 	}
 
 	/* prepare space for items */
-	last_loc = ih_location(&(ih[nr + cpy_num - 1 - dest_before]));
-	last_inserted_loc = ih_location(&(ih[cpy_num - 1]));
+	last_loc = ih_location(&ih[nr + cpy_num - 1 - dest_before]);
+	last_inserted_loc = ih_location(&ih[cpy_num - 1]);
 
 	/* check free space */
 	RFALSE(free_space < j - last_inserted_loc,
@@ -449,7 +449,7 @@ static void leaf_item_bottle(struct buff
 				set_ih_free_space(&n_ih, 0);
 			}
 
-			RFALSE(op_is_left_mergeable(&(ih->ih_key), src->b_size),
+			RFALSE(op_is_left_mergeable(&ih->ih_key, src->b_size),
 			       "vs-10190: bad mergeability of item %h", ih);
 			n_ih.ih_version = ih->ih_version;	/* JDM Endian safe, both le */
 			leaf_insert_into_buf(dest_bi, B_NR_ITEMS(dest), &n_ih,
@@ -926,7 +926,7 @@ void leaf_insert_into_buf(struct buffer_
 	ih = item_head(bh, before);
 
 	/* prepare space for the body of new item */
-	last_loc = nr ? ih_location(&(ih[nr - before - 1])) : bh->b_size;
+	last_loc = nr ? ih_location(&ih[nr - before - 1]) : bh->b_size;
 	unmoved_loc = before ? ih_location(ih - 1) : bh->b_size;
 
 	memmove(bh->b_data + last_loc - ih_item_len(inserted_item_ih),
@@ -949,8 +949,8 @@ void leaf_insert_into_buf(struct buffer_
 
 	/* change locations */
 	for (i = before; i < nr + 1; i++) {
-		unmoved_loc -= ih_item_len(&(ih[i - before]));
-		put_ih_location(&(ih[i - before]), unmoved_loc);
+		unmoved_loc -= ih_item_len(&ih[i - before]);
+		put_ih_location(&ih[i - before], unmoved_loc);
 	}
 
 	/* sizes, free space, item number */
@@ -1009,7 +1009,7 @@ void leaf_paste_in_buffer(struct buffer_
 	/* item to be appended */
 	ih = item_head(bh, affected_item_num);
 
-	last_loc = ih_location(&(ih[nr - affected_item_num - 1]));
+	last_loc = ih_location(&ih[nr - affected_item_num - 1]);
 	unmoved_loc = affected_item_num ? ih_location(ih - 1) : bh->b_size;
 
 	/* prepare space */
@@ -1018,8 +1018,8 @@ void leaf_paste_in_buffer(struct buffer_
 
 	/* change locations */
 	for (i = affected_item_num; i < nr; i++)
-		put_ih_location(&(ih[i - affected_item_num]),
-				ih_location(&(ih[i - affected_item_num])) -
+		put_ih_location(&ih[i - affected_item_num],
+				ih_location(&ih[i - affected_item_num]) -
 				paste_size);
 
 	if (body) {
@@ -1101,19 +1101,19 @@ static int leaf_cut_entries(struct buffe
 	 * (prev_record) and length of all removed records (cut_records_len)
 	 */
 	prev_record_offset =
-	    (from ? deh_location(&(deh[from - 1])) : ih_item_len(ih));
+	    (from ? deh_location(&deh[from - 1]) : ih_item_len(ih));
 	cut_records_len = prev_record_offset /*from_record */  -
-	    deh_location(&(deh[from + del_count - 1]));
+	    deh_location(&deh[from + del_count - 1]);
 	prev_record = item + prev_record_offset;
 
 	/* adjust locations of remaining entries */
 	for (i = ih_entry_count(ih) - 1; i > from + del_count - 1; i--)
-		put_deh_location(&(deh[i]),
+		put_deh_location(&deh[i],
 				 deh_location(&deh[i]) -
 				 (DEH_SIZE * del_count));
 
 	for (i = 0; i < from; i++)
-		put_deh_location(&(deh[i]),
+		put_deh_location(&deh[i],
 				 deh_location(&deh[i]) - (DEH_SIZE * del_count +
 							  cut_records_len));
 
@@ -1200,7 +1200,7 @@ void leaf_cut_from_buffer(struct buffer_
 	}
 
 	/* location of the last item */
-	last_loc = ih_location(&(ih[nr - cut_item_num - 1]));
+	last_loc = ih_location(&ih[nr - cut_item_num - 1]);
 
 	/* location of the item, which is remaining at the same place */
 	unmoved_loc = cut_item_num ? ih_location(ih - 1) : bh->b_size;
@@ -1219,7 +1219,7 @@ void leaf_cut_from_buffer(struct buffer_
 
 	/* change locations */
 	for (i = cut_item_num; i < nr; i++)
-		put_ih_location(&(ih[i - cut_item_num]),
+		put_ih_location(&ih[i - cut_item_num],
 				ih_location(&ih[i - cut_item_num]) + cut_size);
 
 	/* size, free space */
@@ -1273,8 +1273,8 @@ static void leaf_delete_items_entirely(s
 	j = (first == 0) ? bh->b_size : ih_location(ih - 1);
 
 	/* delete items */
-	last_loc = ih_location(&(ih[nr - 1 - first]));
-	last_removed_loc = ih_location(&(ih[del_num - 1]));
+	last_loc = ih_location(&ih[nr - 1 - first]);
+	last_removed_loc = ih_location(&ih[del_num - 1]);
 
 	memmove(bh->b_data + last_loc + j - last_removed_loc,
 		bh->b_data + last_loc, last_removed_loc - last_loc);
@@ -1284,8 +1284,8 @@ static void leaf_delete_items_entirely(s
 
 	/* change item location */
 	for (i = first; i < nr - del_num; i++)
-		put_ih_location(&(ih[i - first]),
-				ih_location(&(ih[i - first])) + (j -
+		put_ih_location(&ih[i - first],
+				ih_location(&ih[i - first]) + (j -
 								 last_removed_loc));
 
 	/* sizes, item number */
@@ -1347,19 +1347,19 @@ void leaf_paste_entries(struct buffer_in
 	/* new records will be pasted at this point */
 	insert_point =
 	    item +
-	    (before ? deh_location(&(deh[before - 1]))
+	    (before ? deh_location(&deh[before - 1])
 	     : (ih_item_len(ih) - paste_size));
 
 	/* adjust locations of records that will be AFTER new records */
 	for (i = ih_entry_count(ih) - 1; i >= before; i--)
-		put_deh_location(&(deh[i]),
-				 deh_location(&(deh[i])) +
+		put_deh_location(&deh[i],
+				 deh_location(&deh[i]) +
 				 (DEH_SIZE * new_entry_count));
 
 	/* adjust locations of records that will be BEFORE new records */
 	for (i = 0; i < before; i++)
-		put_deh_location(&(deh[i]),
-				 deh_location(&(deh[i])) + paste_size);
+		put_deh_location(&deh[i],
+				 deh_location(&deh[i]) + paste_size);
 
 	old_entry_num = ih_entry_count(ih);
 	put_ih_entry_count(ih, ih_entry_count(ih) + new_entry_count);
@@ -1383,10 +1383,10 @@ void leaf_paste_entries(struct buffer_in
 
 	/* set locations of new records */
 	for (i = 0; i < new_entry_count; i++) {
-		put_deh_location(&(deh[i]),
-				 deh_location(&(deh[i])) +
+		put_deh_location(&deh[i],
+				 deh_location(&deh[i]) +
 				 (-deh_location
-				  (&(new_dehs[new_entry_count - 1])) +
+				  (&new_dehs[new_entry_count - 1]) +
 				  insert_point + DEH_SIZE * new_entry_count -
 				  item));
 	}
@@ -1404,16 +1404,16 @@ void leaf_paste_entries(struct buffer_in
 			next =
 			    (i <
 			     ih_entry_count(ih) -
-			     1) ? deh_location(&(deh[i + 1])) : 0;
-			prev = (i != 0) ? deh_location(&(deh[i - 1])) : 0;
+			     1) ? deh_location(&deh[i + 1]) : 0;
+			prev = (i != 0) ? deh_location(&deh[i - 1]) : 0;
 
-			if (prev && prev <= deh_location(&(deh[i])))
+			if (prev && prev <= deh_location(&deh[i]))
 				reiserfs_error(sb_from_bi(bi), "vs-10240",
 					       "directory item (%h) "
 					       "corrupted (prev %a, "
 					       "cur(%d) %a)",
 					       ih, deh + i - 1, i, deh + i);
-			if (next && next >= deh_location(&(deh[i])))
+			if (next && next >= deh_location(&deh[i]))
 				reiserfs_error(sb_from_bi(bi), "vs-10250",
 					       "directory item (%h) "
 					       "corrupted (cur(%d) %a, "
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -86,8 +86,8 @@ inline void set_de_name_and_namelen(stru
 static inline void set_de_object_key(struct reiserfs_dir_entry *de)
 {
 	BUG_ON(de->de_entry_num >= ih_entry_count(de->de_ih));
-	de->de_dir_id = deh_dir_id(&(de->de_deh[de->de_entry_num]));
-	de->de_objectid = deh_objectid(&(de->de_deh[de->de_entry_num]));
+	de->de_dir_id = deh_dir_id(&de->de_deh[de->de_entry_num]);
+	de->de_objectid = deh_objectid(&de->de_deh[de->de_entry_num]);
 }
 
 static inline void store_de_entry_key(struct reiserfs_dir_entry *de)
@@ -102,8 +102,8 @@ static inline void store_de_entry_key(st
 	    le32_to_cpu(de->de_ih->ih_key.k_dir_id);
 	de->de_entry_key.on_disk_key.k_objectid =
 	    le32_to_cpu(de->de_ih->ih_key.k_objectid);
-	set_cpu_key_k_offset(&(de->de_entry_key), deh_offset(deh));
-	set_cpu_key_k_type(&(de->de_entry_key), TYPE_DIRENTRY);
+	set_cpu_key_k_offset(&de->de_entry_key, deh_offset(deh));
+	set_cpu_key_k_type(&de->de_entry_key, TYPE_DIRENTRY);
 }
 
 /*
@@ -149,7 +149,7 @@ int search_by_entry_key(struct super_blo
 
 #ifdef CONFIG_REISERFS_CHECK
 	if (!is_direntry_le_ih(de->de_ih) ||
-	    COMP_SHORT_KEYS(&(de->de_ih->ih_key), key)) {
+	    COMP_SHORT_KEYS(&de->de_ih->ih_key, key)) {
 		print_block(de->de_bh, 0, -1, -1);
 		reiserfs_panic(sb, "vs-7005", "found item %h is not directory "
 			       "item or does not belong to the same directory "
@@ -369,7 +369,7 @@ static struct dentry *reiserfs_lookup(st
 	pathrelse(&path_to_entry);
 	if (retval == NAME_FOUND) {
 		inode = reiserfs_iget(dir->i_sb,
-				      (struct cpu_key *)&(de.de_dir_id));
+				      (struct cpu_key *)&de.de_dir_id);
 		if (!inode || IS_ERR(inode)) {
 			reiserfs_write_unlock(dir->i_sb);
 			return ERR_PTR(-EACCES);
@@ -414,7 +414,7 @@ struct dentry *reiserfs_get_parent(struc
 		reiserfs_write_unlock(dir->i_sb);
 		return ERR_PTR(-ENOENT);
 	}
-	inode = reiserfs_iget(dir->i_sb, (struct cpu_key *)&(de.de_dir_id));
+	inode = reiserfs_iget(dir->i_sb, (struct cpu_key *)&de.de_dir_id);
 	reiserfs_write_unlock(dir->i_sb);
 
 	return d_obtain_alias(inode);
@@ -935,7 +935,8 @@ static int reiserfs_rmdir(struct inode *
 	}
 
 	/* cut entry from dir directory */
-	retval = reiserfs_cut_from_item(&th, &path, &(de.de_entry_key), dir, NULL,	/* page */
+	retval = reiserfs_cut_from_item(&th, &path, &de.de_entry_key,
+					dir, NULL,	/* page */
 					0 /*new file size - not used here */ );
 	if (retval < 0)
 		goto end_rmdir;
@@ -1042,7 +1043,7 @@ static int reiserfs_unlink(struct inode
 	savelink = inode->i_nlink;
 
 	retval =
-	    reiserfs_cut_from_item(&th, &path, &(de.de_entry_key), dir, NULL,
+	    reiserfs_cut_from_item(&th, &path, &de.de_entry_key, dir, NULL,
 				   0);
 	if (retval < 0) {
 		inc_nlink(inode);
@@ -1583,7 +1584,7 @@ static int reiserfs_rename(struct inode
 	 * entry. This needs one more clean up
 	 */
 	if (reiserfs_cut_from_item
-	    (&th, &old_entry_path, &(old_de.de_entry_key), old_dir, NULL,
+	    (&th, &old_entry_path, &old_de.de_entry_key, old_dir, NULL,
 	     0) < 0)
 		reiserfs_error(old_dir->i_sb, "vs-7060",
 			       "couldn't not cut old name. Fsck later?");
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -652,11 +652,11 @@ void store_print_tb(struct tree_balance
 			"* %d * %3lld(%2d) * %3lld(%2d) * %3lld(%2d) * %5lld * %5lld * %5lld * %5lld * %5lld *\n",
 			h,
 			(tbSh) ? (long long)(tbSh->b_blocknr) : (-1LL),
-			(tbSh) ? atomic_read(&(tbSh->b_count)) : -1,
+			(tbSh) ? atomic_read(&tbSh->b_count) : -1,
 			(tb->L[h]) ? (long long)(tb->L[h]->b_blocknr) : (-1LL),
-			(tb->L[h]) ? atomic_read(&(tb->L[h]->b_count)) : -1,
+			(tb->L[h]) ? atomic_read(&tb->L[h]->b_count) : -1,
 			(tb->R[h]) ? (long long)(tb->R[h]->b_blocknr) : (-1LL),
-			(tb->R[h]) ? atomic_read(&(tb->R[h]->b_count)) : -1,
+			(tb->R[h]) ? atomic_read(&tb->R[h]->b_count) : -1,
 			(tbFh) ? (long long)(tbFh->b_blocknr) : (-1LL),
 			(tb->FL[h]) ? (long long)(tb->FL[h]->
 						  b_blocknr) : (-1LL),
@@ -698,7 +698,7 @@ void store_print_tb(struct tree_balance
 			"%p (%llu %d)%s", tb->FEB[i],
 			tb->FEB[i] ? (unsigned long long)tb->FEB[i]->
 			b_blocknr : 0ULL,
-			tb->FEB[i] ? atomic_read(&(tb->FEB[i]->b_count)) : 0,
+			tb->FEB[i] ? atomic_read(&tb->FEB[i]->b_count) : 0,
 			(i == ARRAY_SIZE(tb->FEB) - 1) ? "\n" : ", ");
 
 	sprintf(print_tb_buf + strlen(print_tb_buf),
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -748,7 +748,7 @@ io_error:
 				      (node_level ==
 				       DISK_LEAF_NODE_LEVEL) ? IH_SIZE :
 				      KEY_SIZE,
-				      &(last_element->pe_position));
+				      &last_element->pe_position);
 		if (node_level == stop_level) {
 			return retval;
 		}
@@ -871,9 +871,8 @@ int search_for_position_by_key(struct su
 			   --PATH_LAST_POSITION(search_path));
 	blk_size = sb->s_blocksize;
 
-	if (comp_short_keys(&(p_le_ih->ih_key), p_cpu_key)) {
+	if (comp_short_keys(&p_le_ih->ih_key, p_cpu_key))
 		return FILE_NOT_FOUND;
-	}
 
 	/* FIXME: quite ugly this far */
 
@@ -2088,7 +2087,7 @@ int reiserfs_paste_into_item(struct reis
 	reiserfs_debug(inode->i_sb, REISERFS_DEBUG_CODE,
 		       "reiserquota paste_into_item(): allocating %u id=%u type=%c",
 		       pasted_size, inode->i_uid,
-		       key2type(&(key->on_disk_key)));
+		       key2type(&key->on_disk_key));
 #endif
 
 	depth = reiserfs_write_unlock_nested(sb);
@@ -2150,7 +2149,7 @@ error_out:
 	reiserfs_debug(inode->i_sb, REISERFS_DEBUG_CODE,
 		       "reiserquota paste_into_item(): freeing %u id=%u type=%c",
 		       pasted_size, inode->i_uid,
-		       key2type(&(key->on_disk_key)));
+		       key2type(&key->on_disk_key));
 #endif
 	depth = reiserfs_write_unlock_nested(sb);
 	dquot_free_space_nodirty(inode, pasted_size);
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1642,7 +1642,7 @@ static int read_super_block(struct super
 /* after journal replay, reread all bitmap and super blocks */
 static int reread_meta_blocks(struct super_block *s)
 {
-	ll_rw_block(READ, 1, &(SB_BUFFER_WITH_SB(s)));
+	ll_rw_block(READ, 1, &SB_BUFFER_WITH_SB(s));
 	wait_on_buffer(SB_BUFFER_WITH_SB(s));
 	if (!buffer_uptodate(SB_BUFFER_WITH_SB(s))) {
 		reiserfs_warning(s, "reiserfs-2504", "error reading the super");
@@ -1886,7 +1886,7 @@ static int reiserfs_fill_super(struct su
 
 	jdev_name = NULL;
 	if (reiserfs_parse_options
-	    (s, (char *)data, &(sbi->s_mount_opt), &blocks, &jdev_name,
+	    (s, (char *)data, &sbi->s_mount_opt, &blocks, &jdev_name,
 	     &commit_max_age, qf_names, &qfmt) == 0) {
 		goto error_unlocked;
 	}
@@ -2003,7 +2003,7 @@ static int reiserfs_fill_super(struct su
 	args.dirid = REISERFS_ROOT_PARENT_OBJECTID;
 	root_inode =
 	    iget5_locked(s, REISERFS_ROOT_OBJECTID, reiserfs_find_actor,
-			 reiserfs_init_locked_inode, (void *)(&args));
+			 reiserfs_init_locked_inode, (void *)&args);
 	if (!root_inode) {
 		SWARN(silent, s, "jmacd-10", "get root inode failed");
 		goto error_unlocked;
@@ -2037,11 +2037,11 @@ static int reiserfs_fill_super(struct su
 
 	if (is_reiserfs_3_5(rs)
 	    || (is_reiserfs_jr(rs) && SB_VERSION(s) == REISERFS_VERSION_1))
-		set_bit(REISERFS_3_5, &(sbi->s_properties));
+		set_bit(REISERFS_3_5, &sbi->s_properties);
 	else if (old_format)
-		set_bit(REISERFS_OLD_FORMAT, &(sbi->s_properties));
+		set_bit(REISERFS_OLD_FORMAT, &sbi->s_properties);
 	else
-		set_bit(REISERFS_3_6, &(sbi->s_properties));
+		set_bit(REISERFS_3_6, &sbi->s_properties);
 
 	if (!(s->s_flags & MS_RDONLY)) {
 
@@ -2097,8 +2097,8 @@ static int reiserfs_fill_super(struct su
 
 				set_sb_version(rs, REISERFS_VERSION_2);
 				reiserfs_convert_objectid_map_v1(s);
-				set_bit(REISERFS_3_6, &(sbi->s_properties));
-				clear_bit(REISERFS_3_5, &(sbi->s_properties));
+				set_bit(REISERFS_3_6, &sbi->s_properties);
+				clear_bit(REISERFS_3_5, &sbi->s_properties);
 			} else if (!silent) {
 				reiserfs_info(s, "using 3.5.x disk format\n");
 			}
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -1027,8 +1027,8 @@ int reiserfs_xattr_init(struct super_blo
 
 error:
 	if (err) {
-		clear_bit(REISERFS_XATTRS_USER, &(REISERFS_SB(s)->s_mount_opt));
-		clear_bit(REISERFS_POSIXACL, &(REISERFS_SB(s)->s_mount_opt));
+		clear_bit(REISERFS_XATTRS_USER, &REISERFS_SB(s)->s_mount_opt);
+		clear_bit(REISERFS_POSIXACL, &REISERFS_SB(s)->s_mount_opt);
 	}
 
 	/* The super_block MS_POSIXACL must mirror the (no)acl mount option. */


