From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 04/29] reiserfs: cleanup, remove nblocks argument from journal_end
Date: Wed, 23 Apr 2014 10:00:37 -0400
Message-ID: <20140423151139.513938157@suse.com>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=reiserfs/reiserfs-cleanup-remove-nblocks-argument-from-journal_end
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

journal_end takes a block count argument but doesn't actually use it
for anything. We can remove it.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/file.c      |    4 ++--
 fs/reiserfs/inode.c     |   33 +++++++++++++++------------------
 fs/reiserfs/journal.c   |   38 +++++++++++++++++---------------------
 fs/reiserfs/namei.c     |   38 +++++++++++++++++++-------------------
 fs/reiserfs/reiserfs.h  |    7 +++----
 fs/reiserfs/resize.c    |    6 +++---
 fs/reiserfs/stree.c     |    3 +--
 fs/reiserfs/super.c     |   30 ++++++++++++------------------
 fs/reiserfs/xattr.c     |    4 ++--
 fs/reiserfs/xattr_acl.c |    2 +-
 10 files changed, 75 insertions(+), 90 deletions(-)

--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -96,7 +96,7 @@ static int reiserfs_file_release(struct
 #ifdef REISERFS_PREALLOCATE
 	reiserfs_discard_prealloc(&th, inode);
 #endif
-	err = journal_end(&th, inode->i_sb, 1);
+	err = journal_end(&th, inode->i_sb);
 
 	/* copy back the error code from journal_begin */
 	if (!err)
@@ -227,7 +227,7 @@ int reiserfs_commit_page(struct inode *i
 		}
 	}
 	if (logit) {
-		ret = journal_end(&th, s, bh_per_page + 1);
+		ret = journal_end(&th, s);
 	      drop_write_lock:
 		reiserfs_write_unlock(s);
 	}
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -72,7 +72,7 @@ void reiserfs_evict_inode(struct inode *
 			reiserfs_write_lock_nested(inode->i_sb, depth);
 		}
 
-		if (journal_end(&th, inode->i_sb, jbegin_count))
+		if (journal_end(&th, inode->i_sb))
 			goto out;
 
 		/*
@@ -252,7 +252,6 @@ static int restart_transaction(struct re
 			       struct inode *inode, struct treepath *path)
 {
 	struct super_block *s = th->t_super;
-	int len = th->t_blocks_allocated;
 	int err;
 
 	BUG_ON(!th->t_trans_id);
@@ -265,7 +264,7 @@ static int restart_transaction(struct re
 		return 0;
 	}
 	reiserfs_update_sd(th, inode);
-	err = journal_end(th, s, len);
+	err = journal_end(th, s);
 	if (!err) {
 		err = journal_begin(th, s, JOURNAL_PER_BALANCE_CNT * 6);
 		if (!err)
@@ -1791,7 +1790,7 @@ int reiserfs_write_inode(struct inode *i
 		reiserfs_write_lock(inode->i_sb);
 		if (!journal_begin(&th, inode->i_sb, jbegin_count)) {
 			reiserfs_update_sd(&th, inode);
-			journal_end_sync(&th, inode->i_sb, jbegin_count);
+			journal_end_sync(&th, inode->i_sb);
 		}
 		reiserfs_write_unlock(inode->i_sb);
 	}
@@ -2098,7 +2097,7 @@ int reiserfs_new_inode(struct reiserfs_t
 	if (retval) {
 		err = retval;
 		reiserfs_check_path(&path_to_key);
-		journal_end(th, th->t_super, th->t_blocks_allocated);
+		journal_end(th, th->t_super);
 		goto out_inserted_sd;
 	}
 
@@ -2109,7 +2108,7 @@ int reiserfs_new_inode(struct reiserfs_t
 		if (retval) {
 			err = retval;
 			reiserfs_check_path(&path_to_key);
-			journal_end(th, th->t_super, th->t_blocks_allocated);
+			journal_end(th, th->t_super);
 			goto out_inserted_sd;
 		}
 	} else if (inode->i_sb->s_flags & MS_POSIXACL) {
@@ -2126,8 +2125,7 @@ int reiserfs_new_inode(struct reiserfs_t
 		if (retval) {
 			err = retval;
 			reiserfs_check_path(&path_to_key);
-			retval = journal_end(th, th->t_super,
-					     th->t_blocks_allocated);
+			retval = journal_end(th, th->t_super);
 			if (retval)
 				err = retval;
 			goto out_inserted_sd;
@@ -2149,7 +2147,7 @@ int reiserfs_new_inode(struct reiserfs_t
 	reiserfs_write_lock_nested(inode->i_sb, depth);
 
       out_end_trans:
-	journal_end(th, th->t_super, th->t_blocks_allocated);
+	journal_end(th, th->t_super);
 	/*
 	 * Drop can be outside and it needs more credits so it's better
 	 * to have it outside
@@ -2319,8 +2317,7 @@ int reiserfs_truncate_file(struct inode
 		 */
 		add_save_link(&th, inode, 1);
 	err2 = reiserfs_do_truncate(&th, inode, page, update_timestamps);
-	error =
-	    journal_end(&th, inode->i_sb, JOURNAL_PER_BALANCE_CNT * 2 + 1);
+	error = journal_end(&th, inode->i_sb);
 	if (error)
 		goto out;
 
@@ -2483,7 +2480,7 @@ static int map_block_for_writepage(struc
       out:
 	pathrelse(&path);
 	if (trans_running) {
-		int err = journal_end(&th, inode->i_sb, jbegin_count);
+		int err = journal_end(&th, inode->i_sb);
 		if (err)
 			retval = err;
 		trans_running = 0;
@@ -2653,7 +2650,7 @@ static int reiserfs_write_full_page(stru
 	} while ((bh = bh->b_this_page) != head);
 
 	if (checked) {
-		error = journal_end(&th, s, bh_per_page + 1);
+		error = journal_end(&th, s);
 		reiserfs_write_unlock(s);
 		if (error)
 			goto fail;
@@ -2956,7 +2953,7 @@ static int reiserfs_write_end(struct fil
 		mark_inode_dirty(inode);
 		reiserfs_update_sd(&myth, inode);
 		update_sd = 1;
-		ret = journal_end(&myth, inode->i_sb, 1);
+		ret = journal_end(&myth, inode->i_sb);
 		if (ret)
 			goto journal_error;
 	}
@@ -3045,7 +3042,7 @@ int reiserfs_commit_write(struct file *f
 		mark_inode_dirty(inode);
 		reiserfs_update_sd(&myth, inode);
 		update_sd = 1;
-		ret = journal_end(&myth, inode->i_sb, 1);
+		ret = journal_end(&myth, inode->i_sb);
 		if (ret)
 			goto journal_error;
 	}
@@ -3349,7 +3346,7 @@ int reiserfs_setattr(struct dentry *dent
 				err = journal_begin(&th, inode->i_sb, 4);
 				if (!err) {
 					reiserfs_discard_prealloc(&th, inode);
-					err = journal_end(&th, inode->i_sb, 4);
+					err = journal_end(&th, inode->i_sb);
 				}
 				if (err)
 					error = err;
@@ -3401,7 +3398,7 @@ int reiserfs_setattr(struct dentry *dent
 		error = dquot_transfer(inode, attr);
 		reiserfs_write_lock(inode->i_sb);
 		if (error) {
-			journal_end(&th, inode->i_sb, jbegin_count);
+			journal_end(&th, inode->i_sb);
 			reiserfs_write_unlock(inode->i_sb);
 			goto out;
 		}
@@ -3415,7 +3412,7 @@ int reiserfs_setattr(struct dentry *dent
 		if (attr->ia_valid & ATTR_GID)
 			inode->i_gid = attr->ia_gid;
 		mark_inode_dirty(inode);
-		error = journal_end(&th, inode->i_sb, jbegin_count);
+		error = journal_end(&th, inode->i_sb);
 		reiserfs_write_unlock(inode->i_sb);
 		if (error)
 			goto out;
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -84,8 +84,7 @@
 #define WAIT        4		/* wait for the log blocks to hit the disk */
 
 static int do_journal_end(struct reiserfs_transaction_handle *,
-			  struct super_block *, unsigned long nblocks,
-			  int flags);
+			  struct super_block *, int flags);
 static int flush_journal_list(struct super_block *s,
 			      struct reiserfs_journal_list *jl, int flushall);
 static int flush_commit_list(struct super_block *s,
@@ -1921,7 +1920,7 @@ static int do_journal_release(struct rei
 	if (!error && !(sb->s_flags & MS_RDONLY)) {
 		/* end the current trans */
 		BUG_ON(!th->t_trans_id);
-		do_journal_end(th, sb, 10, FLUSH_ALL);
+		do_journal_end(th, sb, FLUSH_ALL);
 
 		/*
 		 * make sure something gets logged to force
@@ -1933,7 +1932,7 @@ static int do_journal_release(struct rei
 						     1);
 			journal_mark_dirty(&myth, sb,
 					   SB_BUFFER_WITH_SB(sb));
-			do_journal_end(&myth, sb, 1, FLUSH_ALL);
+			do_journal_end(&myth, sb, FLUSH_ALL);
 			flushed = 1;
 		}
 	}
@@ -1947,7 +1946,7 @@ static int do_journal_release(struct rei
 						     1);
 			journal_mark_dirty(&myth, sb,
 					   SB_BUFFER_WITH_SB(sb));
-			do_journal_end(&myth, sb, 1, FLUSH_ALL);
+			do_journal_end(&myth, sb, FLUSH_ALL);
 		}
 	}
 
@@ -3102,9 +3101,9 @@ static int do_journal_begin_r(struct rei
 
 		/* someone might have ended the transaction while we joined */
 		if (old_trans_id != journal->j_trans_id) {
-			retval = do_journal_end(&myth, sb, 1, 0);
+			retval = do_journal_end(&myth, sb, 0);
 		} else {
-			retval = do_journal_end(&myth, sb, 1, COMMIT_NOW);
+			retval = do_journal_end(&myth, sb, COMMIT_NOW);
 		}
 
 		if (retval)
@@ -3174,7 +3173,7 @@ int reiserfs_end_persistent_transaction(
 	struct super_block *s = th->t_super;
 	int ret = 0;
 	if (th->t_trans_id)
-		ret = journal_end(th, th->t_super, th->t_blocks_allocated);
+		ret = journal_end(th, th->t_super);
 	else
 		ret = -EIO;
 	if (th->t_refcount == 0) {
@@ -3375,8 +3374,7 @@ int journal_mark_dirty(struct reiserfs_t
 	return 0;
 }
 
-int journal_end(struct reiserfs_transaction_handle *th,
-		struct super_block *sb, unsigned long nblocks)
+int journal_end(struct reiserfs_transaction_handle *th, struct super_block *sb)
 {
 	if (!current->journal_info && th->t_refcount > 1)
 		reiserfs_warning(sb, "REISER-NESTING",
@@ -3404,7 +3402,7 @@ int journal_end(struct reiserfs_transact
 		}
 		return 0;
 	} else {
-		return do_journal_end(th, sb, nblocks, 0);
+		return do_journal_end(th, sb, 0);
 	}
 }
 
@@ -3514,7 +3512,7 @@ static int can_dirty(struct reiserfs_jou
  * will wait until the current transaction is done/committed before returning
  */
 int journal_end_sync(struct reiserfs_transaction_handle *th,
-		     struct super_block *sb, unsigned long nblocks)
+		     struct super_block *sb)
 {
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
 
@@ -3526,7 +3524,7 @@ int journal_end_sync(struct reiserfs_tra
 					     1);
 		journal_mark_dirty(th, sb, SB_BUFFER_WITH_SB(sb));
 	}
-	return do_journal_end(th, sb, nblocks, COMMIT_NOW | WAIT);
+	return do_journal_end(th, sb, COMMIT_NOW | WAIT);
 }
 
 /* writeback the pending async commits to disk */
@@ -3586,7 +3584,7 @@ void reiserfs_flush_old_commits(struct s
 			 * no sense to do an async commit so that kreiserfsd
 			 * can do it later
 			 */
-			do_journal_end(&th, sb, 1, COMMIT_NOW | WAIT);
+			do_journal_end(&th, sb, COMMIT_NOW | WAIT);
 		}
 	}
 }
@@ -3607,8 +3605,7 @@ void reiserfs_flush_old_commits(struct s
  * writers in the log.
  */
 static int check_journal_end(struct reiserfs_transaction_handle *th,
-			     struct super_block *sb, unsigned long nblocks,
-			     int flags)
+			     struct super_block *sb, int flags)
 {
 
 	time_t now;
@@ -3867,11 +3864,11 @@ static int __commit_trans_jl(struct inod
 			reiserfs_prepare_for_journal(sb, SB_BUFFER_WITH_SB(sb),
 						     1);
 			journal_mark_dirty(&th, sb, SB_BUFFER_WITH_SB(sb));
-			ret = journal_end(&th, sb, 1);
+			ret = journal_end(&th, sb);
 			goto flush_commit_only;
 		}
 
-		ret = journal_end_sync(&th, sb, 1);
+		ret = journal_end_sync(&th, sb);
 		if (!ret)
 			ret = 1;
 
@@ -3978,8 +3975,7 @@ int reiserfs_prepare_for_journal(struct
  * journal lists, etc just won't happen.
  */
 static int do_journal_end(struct reiserfs_transaction_handle *th,
-			  struct super_block *sb, unsigned long nblocks,
-			  int flags)
+			  struct super_block *sb, int flags)
 {
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
 	struct reiserfs_journal_cnode *cn, *next, *jl_cn;
@@ -4035,7 +4031,7 @@ static int do_journal_end(struct reiserf
 	 * not return 1 it tells us if we should continue with the
 	 * journal_end, or just return
 	 */
-	if (!check_journal_end(th, sb, nblocks, flags)) {
+	if (!check_journal_end(th, sb, flags)) {
 		reiserfs_schedule_old_flush(sb);
 		wake_queued_writers(sb);
 		reiserfs_async_progress_wait(sb);
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -672,7 +672,7 @@ static int reiserfs_create(struct inode
 		int err;
 		drop_nlink(inode);
 		reiserfs_update_sd(&th, inode);
-		err = journal_end(&th, dir->i_sb, jbegin_count);
+		err = journal_end(&th, dir->i_sb);
 		if (err)
 			retval = err;
 		unlock_new_inode(inode);
@@ -684,7 +684,7 @@ static int reiserfs_create(struct inode
 
 	unlock_new_inode(inode);
 	d_instantiate(dentry, inode);
-	retval = journal_end(&th, dir->i_sb, jbegin_count);
+	retval = journal_end(&th, dir->i_sb);
 
       out_failed:
 	reiserfs_write_unlock(dir->i_sb);
@@ -755,7 +755,7 @@ static int reiserfs_mknod(struct inode *
 		int err;
 		drop_nlink(inode);
 		reiserfs_update_sd(&th, inode);
-		err = journal_end(&th, dir->i_sb, jbegin_count);
+		err = journal_end(&th, dir->i_sb);
 		if (err)
 			retval = err;
 		unlock_new_inode(inode);
@@ -765,7 +765,7 @@ static int reiserfs_mknod(struct inode *
 
 	unlock_new_inode(inode);
 	d_instantiate(dentry, inode);
-	retval = journal_end(&th, dir->i_sb, jbegin_count);
+	retval = journal_end(&th, dir->i_sb);
 
       out_failed:
 	reiserfs_write_unlock(dir->i_sb);
@@ -847,7 +847,7 @@ static int reiserfs_mkdir(struct inode *
 		clear_nlink(inode);
 		DEC_DIR_INODE_NLINK(dir);
 		reiserfs_update_sd(&th, inode);
-		err = journal_end(&th, dir->i_sb, jbegin_count);
+		err = journal_end(&th, dir->i_sb);
 		if (err)
 			retval = err;
 		unlock_new_inode(inode);
@@ -859,7 +859,7 @@ static int reiserfs_mkdir(struct inode *
 
 	unlock_new_inode(inode);
 	d_instantiate(dentry, inode);
-	retval = journal_end(&th, dir->i_sb, jbegin_count);
+	retval = journal_end(&th, dir->i_sb);
 out_failed:
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
@@ -956,7 +956,7 @@ static int reiserfs_rmdir(struct inode *
 	/* prevent empty directory from getting lost */
 	add_save_link(&th, inode, 0 /* not truncate */ );
 
-	retval = journal_end(&th, dir->i_sb, jbegin_count);
+	retval = journal_end(&th, dir->i_sb);
 	reiserfs_check_path(&path);
       out_rmdir:
 	reiserfs_write_unlock(dir->i_sb);
@@ -969,7 +969,7 @@ static int reiserfs_rmdir(struct inode *
 	 * release path if operation was not complete
 	 */
 	pathrelse(&path);
-	err = journal_end(&th, dir->i_sb, jbegin_count);
+	err = journal_end(&th, dir->i_sb);
 	reiserfs_write_unlock(dir->i_sb);
 	return err ? err : retval;
 }
@@ -1059,14 +1059,14 @@ static int reiserfs_unlink(struct inode
 		/* prevent file from getting lost */
 		add_save_link(&th, inode, 0 /* not truncate */ );
 
-	retval = journal_end(&th, dir->i_sb, jbegin_count);
+	retval = journal_end(&th, dir->i_sb);
 	reiserfs_check_path(&path);
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 
       end_unlink:
 	pathrelse(&path);
-	err = journal_end(&th, dir->i_sb, jbegin_count);
+	err = journal_end(&th, dir->i_sb);
 	reiserfs_check_path(&path);
 	if (err)
 		retval = err;
@@ -1153,7 +1153,7 @@ static int reiserfs_symlink(struct inode
 		int err;
 		drop_nlink(inode);
 		reiserfs_update_sd(&th, inode);
-		err = journal_end(&th, parent_dir->i_sb, jbegin_count);
+		err = journal_end(&th, parent_dir->i_sb);
 		if (err)
 			retval = err;
 		unlock_new_inode(inode);
@@ -1163,7 +1163,7 @@ static int reiserfs_symlink(struct inode
 
 	unlock_new_inode(inode);
 	d_instantiate(dentry, inode);
-	retval = journal_end(&th, parent_dir->i_sb, jbegin_count);
+	retval = journal_end(&th, parent_dir->i_sb);
       out_failed:
 	reiserfs_write_unlock(parent_dir->i_sb);
 	return retval;
@@ -1213,7 +1213,7 @@ static int reiserfs_link(struct dentry *
 	if (retval) {
 		int err;
 		drop_nlink(inode);
-		err = journal_end(&th, dir->i_sb, jbegin_count);
+		err = journal_end(&th, dir->i_sb);
 		reiserfs_write_unlock(dir->i_sb);
 		return err ? err : retval;
 	}
@@ -1223,7 +1223,7 @@ static int reiserfs_link(struct dentry *
 
 	ihold(inode);
 	d_instantiate(dentry, inode);
-	retval = journal_end(&th, dir->i_sb, jbegin_count);
+	retval = journal_end(&th, dir->i_sb);
 	reiserfs_write_unlock(dir->i_sb);
 	return retval;
 }
@@ -1385,7 +1385,7 @@ static int reiserfs_rename(struct inode
 				       "new entry is found, new inode == 0");
 		}
 	} else if (retval) {
-		int err = journal_end(&th, old_dir->i_sb, jbegin_count);
+		int err = journal_end(&th, old_dir->i_sb);
 		reiserfs_write_unlock(old_dir->i_sb);
 		return err ? err : retval;
 	}
@@ -1412,7 +1412,7 @@ static int reiserfs_rename(struct inode
 					 &old_entry_path,
 					 &old_de)) != NAME_FOUND) {
 			pathrelse(&old_entry_path);
-			journal_end(&th, old_dir->i_sb, jbegin_count);
+			journal_end(&th, old_dir->i_sb);
 			reiserfs_write_unlock(old_dir->i_sb);
 			return -EIO;
 		}
@@ -1436,7 +1436,7 @@ static int reiserfs_rename(struct inode
 		if (retval != NAME_FOUND_INVISIBLE && retval != NAME_FOUND) {
 			pathrelse(&new_entry_path);
 			pathrelse(&old_entry_path);
-			journal_end(&th, old_dir->i_sb, jbegin_count);
+			journal_end(&th, old_dir->i_sb);
 			reiserfs_write_unlock(old_dir->i_sb);
 			return -EIO;
 		}
@@ -1454,7 +1454,7 @@ static int reiserfs_rename(struct inode
 				pathrelse(&dot_dot_entry_path);
 				pathrelse(&new_entry_path);
 				pathrelse(&old_entry_path);
-				journal_end(&th, old_dir->i_sb, jbegin_count);
+				journal_end(&th, old_dir->i_sb);
 				reiserfs_write_unlock(old_dir->i_sb);
 				return -EIO;
 			}
@@ -1601,7 +1601,7 @@ static int reiserfs_rename(struct inode
 		reiserfs_update_sd(&th, new_dentry_inode);
 	}
 
-	retval = journal_end(&th, old_dir->i_sb, jbegin_count);
+	retval = journal_end(&th, old_dir->i_sb);
 	reiserfs_write_unlock(old_dir->i_sb);
 	return retval;
 }
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -2914,10 +2914,9 @@ int journal_init(struct super_block *, c
 int journal_release(struct reiserfs_transaction_handle *, struct super_block *);
 int journal_release_error(struct reiserfs_transaction_handle *,
 			  struct super_block *);
-int journal_end(struct reiserfs_transaction_handle *, struct super_block *,
-		unsigned long);
-int journal_end_sync(struct reiserfs_transaction_handle *, struct super_block *,
-		     unsigned long);
+int journal_end(struct reiserfs_transaction_handle *, struct super_block *);
+int journal_end_sync(struct reiserfs_transaction_handle *,
+		     struct super_block *);
 int journal_mark_freed(struct reiserfs_transaction_handle *,
 		       struct super_block *, b_blocknr_t blocknr);
 int journal_transaction_should_end(struct reiserfs_transaction_handle *, int);
--- a/fs/reiserfs/resize.c
+++ b/fs/reiserfs/resize.c
@@ -182,7 +182,7 @@ int reiserfs_resize(struct super_block *
 	info = SB_AP_BITMAP(s) + bmap_nr - 1;
 	bh = reiserfs_read_bitmap_block(s, bmap_nr - 1);
 	if (!bh) {
-		int jerr = journal_end(&th, s, 10);
+		int jerr = journal_end(&th, s);
 		if (jerr)
 			return jerr;
 		return -EIO;
@@ -200,7 +200,7 @@ int reiserfs_resize(struct super_block *
 	info = SB_AP_BITMAP(s) + bmap_nr_new - 1;
 	bh = reiserfs_read_bitmap_block(s, bmap_nr_new - 1);
 	if (!bh) {
-		int jerr = journal_end(&th, s, 10);
+		int jerr = journal_end(&th, s);
 		if (jerr)
 			return jerr;
 		return -EIO;
@@ -225,5 +225,5 @@ int reiserfs_resize(struct super_block *
 	journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
 
 	SB_JOURNAL(s)->j_must_wait = 1;
-	return journal_end(&th, s, 10);
+	return journal_end(&th, s);
 }
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -1985,7 +1985,6 @@ int reiserfs_do_truncate(struct reiserfs
 		 */
 		if (journal_transaction_should_end(th, 0) ||
 		    reiserfs_transaction_free_space(th) <= JOURNAL_FOR_FREE_BLOCK_AND_UPDATE_SD) {
-			int orig_len_alloc = th->t_blocks_allocated;
 			pathrelse(&s_search_path);
 
 			if (update_timestamps) {
@@ -1994,7 +1993,7 @@ int reiserfs_do_truncate(struct reiserfs
 			}
 			reiserfs_update_sd(th, inode);
 
-			err = journal_end(th, inode->i_sb, orig_len_alloc);
+			err = journal_end(th, inode->i_sb);
 			if (err)
 				goto out;
 			err = journal_begin(th, inode->i_sb,
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -75,7 +75,7 @@ static int reiserfs_sync_fs(struct super
 	dquot_writeback_dquots(s, -1);
 	reiserfs_write_lock(s);
 	if (!journal_begin(&th, s, 1))
-		if (!journal_end_sync(&th, s, 1))
+		if (!journal_end_sync(&th, s))
 			reiserfs_flush_old_commits(s);
 	reiserfs_write_unlock(s);
 	return 0;
@@ -139,7 +139,7 @@ static int reiserfs_freeze(struct super_
 						     1);
 			journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
 			reiserfs_block_writes(&th);
-			journal_end_sync(&th, s, 1);
+			journal_end_sync(&th, s);
 		}
 	}
 	reiserfs_write_unlock(s);
@@ -179,7 +179,7 @@ static int remove_save_link_only(struct
 		/* removals are protected by direct items */
 		reiserfs_release_objectid(&th, le32_to_cpu(key->k_objectid));
 
-	return journal_end(&th, s, JOURNAL_PER_BALANCE_CNT);
+	return journal_end(&th, s);
 }
 
 #ifdef CONFIG_QUOTA
@@ -507,7 +507,7 @@ int remove_save_link(struct inode *inode
 	} else
 		REISERFS_I(inode)->i_flags &= ~i_link_saved_truncate_mask;
 
-	return journal_end(&th, inode->i_sb, JOURNAL_PER_BALANCE_CNT);
+	return journal_end(&th, inode->i_sb);
 }
 
 static void reiserfs_kill_sb(struct super_block *s)
@@ -660,7 +660,7 @@ static void reiserfs_dirty_inode(struct
 		goto out;
 
 	reiserfs_update_sd(&th, inode);
-	journal_end(&th, inode->i_sb, 1);
+	journal_end(&th, inode->i_sb);
 
 out:
 	reiserfs_write_unlock(inode->i_sb);
@@ -1514,7 +1514,7 @@ static int reiserfs_remount(struct super
 	}
 	/* this will force a full flush of all journal lists */
 	SB_JOURNAL(s)->j_must_wait = 1;
-	err = journal_end(&th, s, 10);
+	err = journal_end(&th, s);
 	if (err)
 		goto out_err_unlock;
 
@@ -2107,7 +2107,7 @@ static int reiserfs_fill_super(struct su
 
 
 		journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
-		errval = journal_end(&th, s, 1);
+		errval = journal_end(&th, s);
 		if (errval) {
 			dput(s->s_root);
 			s->s_root = NULL;
@@ -2220,9 +2220,7 @@ static int reiserfs_write_dquot(struct d
 	depth = reiserfs_write_unlock_nested(dquot->dq_sb);
 	ret = dquot_commit(dquot);
 	reiserfs_write_lock_nested(dquot->dq_sb, depth);
-	err =
-	    journal_end(&th, dquot->dq_sb,
-			REISERFS_QUOTA_TRANS_BLOCKS(dquot->dq_sb));
+	err = journal_end(&th, dquot->dq_sb);
 	if (!ret && err)
 		ret = err;
 out:
@@ -2245,9 +2243,7 @@ static int reiserfs_acquire_dquot(struct
 	depth = reiserfs_write_unlock_nested(dquot->dq_sb);
 	ret = dquot_acquire(dquot);
 	reiserfs_write_lock_nested(dquot->dq_sb, depth);
-	err =
-	    journal_end(&th, dquot->dq_sb,
-			REISERFS_QUOTA_INIT_BLOCKS(dquot->dq_sb));
+	err = journal_end(&th, dquot->dq_sb);
 	if (!ret && err)
 		ret = err;
 out:
@@ -2272,9 +2268,7 @@ static int reiserfs_release_dquot(struct
 	}
 	ret = dquot_release(dquot);
 	reiserfs_write_lock(dquot->dq_sb);
-	err =
-	    journal_end(&th, dquot->dq_sb,
-			REISERFS_QUOTA_DEL_BLOCKS(dquot->dq_sb));
+	err = journal_end(&th, dquot->dq_sb);
 	if (!ret && err)
 		ret = err;
 	reiserfs_write_unlock(dquot->dq_sb);
@@ -2307,7 +2301,7 @@ static int reiserfs_write_info(struct su
 	depth = reiserfs_write_unlock_nested(sb);
 	ret = dquot_commit_info(sb, type);
 	reiserfs_write_lock_nested(sb, depth);
-	err = journal_end(&th, sb, 2);
+	err = journal_end(&th, sb);
 	if (!ret && err)
 		ret = err;
 out:
@@ -2380,7 +2374,7 @@ static int reiserfs_quota_on(struct supe
 		err = journal_begin(&th, sb, 1);
 		if (err)
 			goto out;
-		err = journal_end_sync(&th, sb, 1);
+		err = journal_end_sync(&th, sb);
 		if (err)
 			goto out;
 	}
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -292,7 +292,7 @@ static int reiserfs_for_each_xattr(struc
 					  I_MUTEX_XATTR);
 			err = action(dir, data);
 			reiserfs_write_lock(inode->i_sb);
-			jerror = journal_end(&th, inode->i_sb, blocks);
+			jerror = journal_end(&th, inode->i_sb);
 			reiserfs_write_unlock(inode->i_sb);
 			mutex_unlock(&dir->d_parent->d_inode->i_mutex);
 			err = jerror ?: err;
@@ -601,7 +601,7 @@ int reiserfs_xattr_set(struct inode *ino
 					  buffer, buffer_size, flags);
 
 	reiserfs_write_lock(inode->i_sb);
-	error2 = journal_end(&th, inode->i_sb, jbegin_count);
+	error2 = journal_end(&th, inode->i_sb);
 	reiserfs_write_unlock(inode->i_sb);
 	if (error == 0)
 		error = error2;
--- a/fs/reiserfs/xattr_acl.c
+++ b/fs/reiserfs/xattr_acl.c
@@ -39,7 +39,7 @@ reiserfs_set_acl(struct inode *inode, st
 	if (error == 0) {
 		error = __reiserfs_set_acl(&th, inode, type, acl);
 		reiserfs_write_lock(inode->i_sb);
-		error2 = journal_end(&th, inode->i_sb, jcreate_blocks);
+		error2 = journal_end(&th, inode->i_sb);
 		reiserfs_write_unlock(inode->i_sb);
 		if (error2)
 			error = error2;


